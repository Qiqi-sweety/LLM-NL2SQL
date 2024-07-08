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
        cursor.execute("SELECT tbl_name, sql FROM sqlite_master WHERE type='table';")
        schema_statements = cursor.fetchall()

        # Initialize the schema string with table creation statements
        schema = ""
        for table_name, create_statement in (statement for statement in schema_statements if statement[1] is not None):
            schema += create_statement + ";\n\n"

            # Get the first 5 rows of the current table for example insert statements
            cursor.execute(f"SELECT * FROM {table_name} LIMIT 5;")
            rows = cursor.fetchall()
            if rows:
                # Get column names for the current table
                cursor.execute(f"PRAGMA table_info({table_name});")
                columns_info = cursor.fetchall()
                column_names = [info[1] for info in columns_info]

                # Create INSERT statements for the sample data
                for row in rows:
                    placeholders = ', '.join('?' for _ in row)
                    insert_statement = f"INSERT INTO {table_name} ({', '.join(column_names)}) VALUES ({placeholders});"
                    # Properly format the INSERT statement with the actual row values
                    formatted_insert_statement = cursor.mogrify(insert_statement, row).decode('utf-8')
                    schema += formatted_insert_statement + "\n"

            # Add extra newline for formatting if there were any INSERT statements
            if rows:
                schema += "\n"

        conn.close()
        return schema