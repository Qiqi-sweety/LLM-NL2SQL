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
