from transformers import BertTokenizer, BertModel

from .SchemaFilter import SchemaFilter

class BertFilter(SchemaFilter):
    def __init__(self) -> None:
        super().__init__()
        self.tokenizer = BertTokenizer.from_pretrained('bert-base-uncased')
        self.model = BertModel.from_pretrained('bert-base-uncased')