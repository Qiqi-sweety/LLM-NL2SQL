import sqlite3
from typing import List

"""
This is the interface class for schema linking.
"""
class SchemaLinker():
    def __init__(self, **kwargs) -> None:
        self.num_insert_rows = kwargs.pop("num_insert_rows", 5)
        assert self.num_insert_rows >= 0

    def get_schema(
            self, 
            db_path: str, 
            query: str, 
    ) -> str:
        raise NotImplementedError

    def _construct_insert_statements(self, cursor: sqlite3.Cursor, table_name: str, column_names: List[str]) -> str:
        """
        Construct insert statements for each row in the table.
        """
        insert_statements = ""
        column_names_str = ", ".join([f"`{column_name}`" for column_name in column_names])

        # Get the first few rows of the current table for example insert statements
        cursor.execute(f"SELECT {column_names_str} FROM `{table_name}` LIMIT {self.num_insert_rows};")
        rows = cursor.fetchall()

        if rows:
            # Create INSERT statements for the sample data
            for row in rows:
                # Properly format the INSERT statement with the actual row values
                row_values = ', '.join([self._format_sql_value(value) for value in row])
                insert_statements += f"INSERT INTO `{table_name}` VALUES ({row_values});\n"
                # insert_statements += f"INSERT INTO `{table_name}` ({column_names_str}) VALUES ({row_values});\n"

            # Add extra newline for formatting if there were any INSERT statements
            insert_statements += "\n"

        return insert_statements

    def _format_sql_value(self, value) -> str:
        if value is None:
            return "NULL"
        elif isinstance(value, str):
            value = value.replace("'", "''")
            return f"'{value}'"
        else:
            return str(value)