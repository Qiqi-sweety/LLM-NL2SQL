import sqlite3
import torch
from transformers import RobertaTokenizer, RobertaModel

# load roberta model
roberta_tokenizer = RobertaTokenizer.from_pretrained('roberta-base')
roberta_model = RobertaModel.from_pretrained('roberta-base')

def get_roberta_filtered_table_schema(db_path, query):
    # fetch all schemas
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("SELECT nameFROM sqlite_master WHERE type='table';")
    results = cursor.fetchall()

    # store all table columns info
    table_infos = {}
    for result in results:
        table_name = result[0]
        cursor.execute(f"PRAGMA table_info(`{table_name}`)")
        table_info = cursor.fetchall()
        table_infos[table_name] = table_info
    
    # fetch foreign keys
    foreign_keys_set = set()
    foreign_keys_map = dict()
    for table_name in table_infos.keys():
        cursor.execute(f"PRAGMA foreign_key_list(`{table_name}`)")
        fks = cursor.fetchall()
        for fk in fks:
            referenced_column = f"{fk[2]}.{fk[4]}"
            referencing_column = f"{table_name}.{fk[3]}"
            foreign_keys_set.add(referenced_column)
            foreign_keys_set.add(referencing_column)
            foreign_keys_map[referencing_column] = referenced_column

    conn.close()

    # generate embeddings for query
    query_tokens = roberta_tokenizer(query, return_tensors='pt')
    query_embeddings = roberta_model(**query_tokens).last_hidden_state.mean(dim=1)

    related_schema = []
    for table_name, table_info in table_infos.items():
        # calculate columns similarities
        fully_qualified_names = [f"{table_name}.{column_info[1]}" for column_info in table_info]
        columns_embeddings = get_roberta_embeddings(fully_qualified_names)
        columns_similarity = torch.nn.functional.cosine_similarity(query_embeddings, columns_embeddings)

        similarity_threshold = 0.5

        num_used_columns = 0
        create_table_sql = f"CREATE TABLE '{table_name}' \n(\n"
        foreign_keys_contrains = ""
        for column_info, column_similarity in zip(table_info, columns_similarity):
            column_name = column_info[1]
            column_type = column_info[2]
            column_notnull = column_info[3]
            column_default_value = column_info[4]
            column_pk = column_info[5]
            fully_qualified_name = f"{table_name}.{column_name}"
            
            # Check if the column is a primary key or foreign key
            if (column_similarity > similarity_threshold or column_pk
                or fully_qualified_name in foreign_keys_set):
                num_used_columns += 1  
                
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

                # collect foreign key constraints 
                referenced_column: str = foreign_keys_map.get(fully_qualified_name)
                if referenced_column is not None:
                    ref_table, ref_column = referenced_column.split('.')
                    foreign_keys_contrains += f"\tforeign key ('{column_name}') references '{ref_table}' ('{ref_column}'),\n"
        
        if num_used_columns == 0:
            continue

        # Add foreign key constraints
        create_table_sql += foreign_keys_contrains
        
        create_table_sql = create_table_sql.rstrip(",\n") + "\n);"
        related_schema.append(create_table_sql)
    
    schema = "\n\n".join(related_schema)
    return schema


def get_roberta_embeddings(text):
    tokens = roberta_tokenizer(text, padding=True, return_tensors='pt')
    with torch.no_grad():
        embeddings = roberta_model(**tokens).last_hidden_state.mean(dim=1)
    return embeddings

