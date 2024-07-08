"""
This is the interface class for schema linking.
"""
class SchemaLinker():
    def __init__(self, **kwargs) -> None:
        pass

    def get_schema(
            self, 
            db_path: str, 
            query: str, 
    ) -> str:
        raise NotImplementedError
