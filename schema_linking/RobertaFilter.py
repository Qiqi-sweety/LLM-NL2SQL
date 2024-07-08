from transformers import RobertaTokenizer, RobertaModel

from .SchemaFilter import SchemaFilter

class RobertaFilter(SchemaFilter):
    def __init__(self) -> None:
        super().__init__()
        self.tokenizer = RobertaTokenizer.from_pretrained('roberta-base')
        self.model = RobertaModel.from_pretrained('roberta-base')