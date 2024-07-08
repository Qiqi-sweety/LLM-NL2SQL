from transformers import BertTokenizer, BertModel

from .EmbeddingFilter import EmbeddingFilter

class BertFilter(EmbeddingFilter):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        self.tokenizer = BertTokenizer.from_pretrained('bert-base-uncased')
        self.model = BertModel.from_pretrained('bert-base-uncased')