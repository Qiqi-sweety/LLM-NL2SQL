from typing import Dict, List
from abc import abstractmethod

class LanguageModel():
    def __init__(self, **kwargs) -> None:
        self.max_new_tokens = kwargs.pop("max_new_tokens", 512)

    @abstractmethod
    def chat(self, messages: List[Dict[str, str]]) -> str:
        raise NotImplementedError()

    def generate_sql(self, prompt):
        messages = [
            {"role": "system", "content": "You are a powerful data analysist, reading database schema and write SQL to analyse data."},
            {"role": "user", "content": prompt}
        ]
        response = self.chat(messages)

        # fetch code block
        if "```" in response:
            sql = response.split("```")[1]
        else:
            sql = response

        if 'sql\n' in sql[:4]:
            sql = sql[4:]

        if sql == "":
            sql = ";"

        return sql
