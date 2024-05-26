# spider: Qwen/CodeQwen1.5-7B-Chat
python evaluation/evaluation_spider.py --gold=data/spider/dev_gold.sql --pred=output/spider/Qwen/CodeQwen1.5-7B-Chat/dev_pred.sql --db=data/spider/database/ --table=data/spider/tables.json

# spider: defog/llama-3-sqlcoder-8b
python evaluation/evaluation_spider.py --gold=data/spider/dev_gold.sql --pred=output/spider/defog/llama-3-sqlcoder-8b/dev_pred.sql --db=data/spider/database/ --table=data/spider/tables.json

# spider: Symbol-LLM/Symbol-LLM-13B-Instruct
python evaluation/evaluation_spider.py --gold=data/spider/dev_gold.sql --pred=output/spider/Symbol-LLM/Symbol-LLM-13B-Instruct/dev_pred.sql --db=data/spider/database/ --table=data/spider/tables.json

# spider: seeklhy/codes-7b
python evaluation/evaluation_spider.py --gold=data/spider/dev_gold.sql --pred=output/spider/seeklhy/codes-7b/dev_pred.sql --db=data/spider/database/ --table=data/spider/tables.json

# bird: Qwen/CodeQwen1.5-7B-Chat
python evaluation/evaluation_bird_ex.py --predicted_sql_json_path=output/bird/Qwen/CodeQwen1.5-7B-Chat/dev_pred_gt.sql --ground_truth_sql_path=data/bird/dev_gold.sql --data_mode=dev --db_root_path=data/bird/dev_databases/ --mode_predict=gt --diff_json_path=data/bird/dev.json

# bird: defog/llama-3-sqlcoder-8b
python evaluation/evaluation_bird_ex.py --predicted_sql_json_path=output/bird/defog/llama-3-sqlcoder-8b/dev_pred_gt.sql --ground_truth_sql_path=data/bird/dev_gold.sql --data_mode=dev --db_root_path=data/bird/dev_databases/ --mode_predict=gt --diff_json_path=data/bird/dev.json

# bird: Symbol-LLM/Symbol-LLM-13B-Instruct
python evaluation/evaluation_bird_ex.py --predicted_sql_json_path=output/bird/Symbol-LLM/Symbol-LLM-13B-Instruct/dev_pred_gt.sql --ground_truth_sql_path=data/bird/dev_gold.sql --data_mode=dev --db_root_path=data/bird/dev_databases/ --mode_predict=gt --diff_json_path=data/bird/dev.json

# bird: seeklhy/codes-7b
python evaluation/evaluation_bird_ex.py --predicted_sql_json_path=output/bird/seeklhy/codes-7b/dev_pred_gt.sql --ground_truth_sql_path=data/bird/dev_gold.sql --data_mode=dev --db_root_path=data/bird/dev_databases/ --mode_predict=gt --diff_json_path=data/bird/dev.json