import sqlite3

from .SchemaLinker import SchemaLinker

class VanillaLinker(SchemaLinker):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
    
    def get_schema(
            self, 
            db_path: str, 
            query: str
    ) -> str:
        # connect to the database
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()

        # Get the table creation statements
        cursor.execute("SELECT name, sql FROM sqlite_master WHERE type='table';")
        results = cursor.fetchall()

        # Initialize the schema string with table creation statements
        schema = ""
        for table_name, create_statement in (result for result in results if result[1] is not None):
            schema += create_statement + ";\n\n"

            # Get column names for the current table
            cursor.execute(f"PRAGMA table_info(`{table_name}`);")
            columns_info = cursor.fetchall()
            column_names = [info[1] for info in columns_info]

            insert_statements = self._construct_insert_statements(cursor, table_name, column_names)
            schema += insert_statements

        conn.close()
        return schema
    