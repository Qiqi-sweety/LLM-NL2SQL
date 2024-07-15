import torch
from sentence_transformers import SentenceTransformer

from .EmbeddingFilter import EmbeddingFilter

class QwenFilter(EmbeddingFilter):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        self.model = SentenceTransformer("Alibaba-NLP/gte-Qwen2-7B-instruct", trust_remote_code=True)
    
    def _get_text_embeddings(self, text) -> torch.Tensor:
        return self.model.encode(text)