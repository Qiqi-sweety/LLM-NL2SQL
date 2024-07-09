import torch
import sqlite3
from transformers import PreTrainedTokenizer, PreTrainedModel
from typing import List

from .SchemaLinker import SchemaLinker

class EmbeddingFilter(SchemaLinker):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        self.tokenizer: PreTrainedTokenizer = None
        self.model: PreTrainedModel = None
        
        self.similarity_threshold = kwargs.pop("similarity_threshold", 0.5)
        self.device = kwargs.pop(
            "device",
            torch.device("cuda" if torch.cuda.is_available() else "cpu")
        )

    def get_schema(
            self, 
            db_path: str, 
            query: str, 
    ) -> str:
        # connect to db
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()

        # fetch all table names
        table_names = self._fetch_table_names(cursor)

        # fetch foreign key info
        foreign_keys_set, foreign_keys_map = self._fetch_foreign_key_info(cursor, table_names)

        # generate embeddings for query
        query_embeddings = self._get_text_embeddings(query)

        schema = ""
        for table_name in table_names:
            create_statement, selected_columns = self._construct_create_table_statement(cursor, table_name, query_embeddings, foreign_keys_set, foreign_keys_map)
            insert_statements = self._construct_insert_statements(cursor, table_name, selected_columns)
            schema += create_statement + insert_statements

        conn.close()

        return schema

    def _construct_create_table_statement(self, cursor: sqlite3.Cursor, table_name: str, query_embeddings, foreign_keys_set, foreign_keys_map) -> str:
        # fetch table info
        cursor.execute(f"PRAGMA table_info(`{table_name}`)")
        table_info = cursor.fetchall()
        
        # calculate columns similarities
        fully_qualified_names = [f"{table_name}.{column_info[1]}" for column_info in table_info]
        columns_embeddings = self._get_text_embeddings(fully_qualified_names)
        columns_similarity = torch.nn.functional.cosine_similarity(query_embeddings, columns_embeddings)

        create_statement = f"CREATE TABLE `{table_name}` \n(\n"
        
        selected_columns = []
        foreign_keys_contrains = ""
        
        for column_info, column_similarity in zip(table_info, columns_similarity):
            column_name = column_info[1]
            column_type = column_info[2]
            column_notnull = column_info[3]
            column_default_value = column_info[4]
            column_pk = column_info[5]
            fully_qualified_name = f"{table_name}.{column_name}"
            
            # Check if the column is a primary key or foreign key
            if (column_similarity > self.similarity_threshold 
                or column_pk    # primary key
                or fully_qualified_name in foreign_keys_set):
                selected_columns.append(column_name)
                
                create_statement += f"\t`{column_name}`\t{column_type}"
                if column_notnull:
                    create_statement += "\tNOT NULL"
                else:
                    create_statement += "\tNULL"
                if column_default_value is not None:
                    create_statement += f"\tDEFAULT {column_default_value}"
                if column_pk:
                    create_statement += "\tPRIMARY KEY"
                create_statement += ",\n"

                # collect foreign key constraints 
                referenced_column: str = foreign_keys_map.get(fully_qualified_name)
                if referenced_column is not None:
                    ref_table, ref_column = referenced_column.split('.')
                    foreign_keys_contrains += f"\tforeign key (`{column_name}`) references `{ref_table}` (`{ref_column}`),\n"
        
        if len(selected_columns) == 0:
            return "", []

        # Add foreign key constraints
        create_statement += foreign_keys_contrains
        
        create_statement = create_statement.rstrip(",\n") + "\n);\n\n"
        return create_statement, selected_columns

    def _get_text_embeddings(self, text):
        tokens = self.tokenizer(text, padding=True, return_tensors='pt').to(self.device)
        with torch.no_grad():
            self.model.to(self.device)
            embeddings = self.model(**tokens).last_hidden_state.mean(dim=1)
        return embeddings
