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

            # Get the first few rows of the current table for example insert statements
            cursor.execute(f"SELECT * FROM {table_name} LIMIT {self.num_insert_rows};")
            rows = cursor.fetchall()
            if rows:
                # Get column names for the current table
                cursor.execute(f"PRAGMA table_info({table_name});")
                columns_info = cursor.fetchall()
                column_names = ", ".join([f"`{info[1]}`" for info in columns_info])

                # Create INSERT statements for the sample data
                for row in rows:
                    # Properly format the INSERT statement with the actual row values
                    row_values = ', '.join([self._format_value(value) for value in row])
                    insert_statement = f"INSERT INTO `{table_name}` VALUES ({row_values});"
                    # insert_statement = f"INSERT INTO `{table_name}` ({column_names}) VALUES ({row_values});"
                    schema += insert_statement + "\n"

                # Add extra newline for formatting if there were any INSERT statements
                schema += "\n"

        conn.close()
        print(schema)
        exit(0)
        return schema
    
    def _format_value(self, value) -> str:
        if value is None:
            return "NULL"
        elif isinstance(value, str):
            value = value.replace("'", "''")
            return f"'{value}'"
        else:
            return str(value)