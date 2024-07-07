import sqlite3
import torch
from transformers import BertTokenizer, BertModel

# load bert model
bert_tokenizer = BertTokenizer.from_pretrained('bert-base-uncased')
bert_model = BertModel.from_pretrained('bert-base-uncased')

def get_bert_filtered_table_schema(db_path, query):
    # fetch all schemas
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("SELECT name, sql FROM sqlite_master WHERE type='table';")
    results = cursor.fetchall()

    # store all table create sql and columns
    table_schemas = {}
    table_infos = {}
    for result in results:
        table_name = result[0]
        table_statement = result[1]
        cursor.execute(f"PRAGMA table_info(`{table_name}`)")
        table_info = cursor.fetchall()
        table_schemas[table_name] = table_statement
        table_infos[table_name] = table_info

    conn.close()

    # generate embeddings for query
    query_tokens = bert_tokenizer(query, return_tensors='pt')
    query_embeddings = bert_model(**query_tokens).last_hidden_state.mean(dim=1)

    related_schema = []
    for table_name, table_schema in table_schemas.items():
        # table_embeddings = get_bert_embeddings(table_name)
        # table_similarity = torch.nn.functional.cosine_similarity(query_embeddings, table_embeddings)
        
        # # if table name is similar to query, add the whole table schema
        # if table_similarity > 0.5:
        #     related_schema.append(table_schema)
        #     continue

        create_table_sql = f"CREATE TABLE '{table_name}' \n(\n"
        
        table_info = table_infos[table_name]
        table_column_names = [f"{table_name}.{column_info[1]}" for column_info in table_info]
        columns_embeddings = get_bert_embeddings(table_column_names)
        columns_similarity = torch.nn.functional.cosine_similarity(query_embeddings, columns_embeddings)

        similarity_threshold = 0.5
        if columns_similarity.max() <= similarity_threshold:
            continue

        for column_info, column_similarity in zip(table_info, columns_similarity):
            if column_similarity > similarity_threshold:    
                column_name = column_info[1]
                column_type = column_info[2]
                column_notnull = column_info[3]
                column_default_value = column_info[4]
                column_pk = column_info[5]

                create_table_sql += f"\t'{column_name}'\t{column_type}"
                if column_notnull:
                    create_table_sql += "\tNOT NULL"
                else:
                    create_table_sql += "\tNULL"
                if column_default_value is not None:
                    create_table_sql += f"\tDEFAULT {column_default_value}"
                if column_pk:
                    create_table_sql += "\tPRIMARY KEY"
                create_table_sql += ",\n"
        
        create_table_sql = create_table_sql.rstrip(",\n") + "\n);"
        related_schema.append(create_table_sql)
    
    schema = "\n\n".join(related_schema)
    return schema


def get_bert_embeddings(text):
    tokens = bert_tokenizer(text, padding=True, return_tensors='pt')
    with torch.no_grad():
        embeddings = bert_model(**tokens).last_hidden_state.mean(dim=1)
    return embeddings

