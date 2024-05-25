# spider: Qwen/CodeQwen1.5-7B-Chat
python evaluation/evaluation_spider.py --gold=data/spider/dev_gold.sql --pred=output/spider/Qwen/CodeQwen1.5-7B-Chat/dev_pred.sql --db=data/spider/database/ --table=data/spider/tables.json

# spider: defog/llama-3-sqlcoder-8b
python evaluation/evaluation_spider.py --gold=data/spider/dev_gold.sql --pred=output/spider/defog/llama-3-sqlcoder-8b/dev_pred.sql --db=data/spider/database/ --table=data/spider/tables.json

# spider: Symbol-LLM/Symbol-LLM-13B-Instruct
python evaluation/evaluation_spider.py --gold=data/spider/dev_gold.sql --pred=output/spider/Symbol-LLM/Symbol-LLM-13B-Instruct/dev_pred.sql --db=data/spider/database/ --table=data/spider/tables.json
