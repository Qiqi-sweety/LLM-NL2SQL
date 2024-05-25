import os
import json
import sqlite3
import argparse
from transformers import AutoTokenizer, AutoModelForCausalLM

# DEFAULT_LLM = "Qwen/CodeQwen1.5-13B-Chat"
DEFAULT_LLM = "defog/llama-3-sqlcoder-8b"
# DEFAULT_LLM = "Symbol-LLM/Symbol-LLM-13B-Instruct"

constraint=" When generating SQL, we should always consider constraints: \n \
【Constraints】\n \
- In `SELECT <column>`, just select needed columns in the 【Question】 without any unnecessary column or value \n \
- In `FROM <table>` or `JOIN <table>`, do not include unnecessary table \n \
- If use max or min func, `JOIN <table>` FIRST, THEN use `SELECT MAX(<column>)` or `SELECT MIN(<column>)` \n \
- If [Value examples] of <column> has 'None' or None, use `JOIN <table>` or `WHERE <column> is NOT NULL` is better \n \
- If use `ORDER BY <column> ASC|DESC`, add `GROUP BY <column>` before to select distinct values \
"

def load_tokenizer_and_model(model_name):
    tokenizer = AutoTokenizer.from_pretrained(
        model_name
    )
    model = AutoModelForCausalLM.from_pretrained(
        model_name,
        torch_dtype="auto",
        device_map="auto",
    )
    return tokenizer, model

def load_dataset(data_path):
    dev_path = os.path.join(data_path, 'dev.json')
    with open(dev_path, 'r') as f:
        dataset = json.load(f)
    return dataset

def get_output_file(output_path):
    directory = os.path.dirname(output_path)
    os.makedirs(directory, exist_ok=True)

    return open(output_path, 'w')

def get_schema(db_path):
    # connect to the database
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("SELECT sql FROM sqlite_master WHERE type='table';")
    schema_statements = cursor.fetchall()
    conn.close()

    schema = "\n\n".join(statement[0] for statement in schema_statements if statement[0] is not None)
    return schema

def get_prompt(schema:str, question:str) -> str:
    base_prompt = "The databse schema is as follows:\n" + schema + "\n Write Sql for the following question:" + question
    ans_prompt = "\n" + "Think step by step, but only write sql with no comments." 
    return base_prompt + constraint + ans_prompt

def generate_sql(prompt, tokenizer, model):
    messages = [
        {"role": "system", "content": "You are a powerful data analysist, reading database schema and write SQL to analyse data."},
        {"role": "user", "content": prompt}
    ]
    text = tokenizer.apply_chat_template(
        messages,
        tokenize=False,
        add_generation_prompt=True
    )
    model_inputs = tokenizer([text], return_tensors="pt").to('cuda')
    generated_ids = model.generate(
        model_inputs.input_ids,
        max_new_tokens=512
    )
    generated_ids = [
        output_ids[len(input_ids):] for input_ids, output_ids in zip(model_inputs.input_ids, generated_ids)
    ]

    response = tokenizer.batch_decode(generated_ids, skip_special_tokens=True)[0]

    return response

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-m', '--model_name', type=str, default=DEFAULT_LLM)
    parser.add_argument('-d', '--data_name', type=str, default='spider')

    args = parser.parse_args()

    args.data_path = f'data/{args.data_name}'
    if args.data_name == 'spider':
        args.schema_path = f'{args.data_path}/database'
    elif args.data_name == 'bird':
        args.schema_path = f'{args.data_path}/dev_databases'
    else:
        raise ValueError('data_name must be spider or bird')
    args.result_path = f'output/{args.data_name}/{args.model_name}/dev_pred.sql'

    return args