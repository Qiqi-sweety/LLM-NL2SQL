import os
import json
import sqlite3
import argparse
from transformers import AutoTokenizer, AutoModelForCausalLM

# DEFAULT_LLM = "seeklhy/codes-7b"
DEFAULT_LLM = "seeklhy/codes-15b"
# DEFAULT_LLM = "Qwen/CodeQwen1.5-7B-Chat"
# DEFAULT_LLM = "defog/llama-3-sqlcoder-8b"
# DEFAULT_LLM = "Symbol-LLM/Symbol-LLM-7B-Instruct"
# DEFAULT_LLM = "Symbol-LLM/Symbol-LLM-13B-Instruct"

constraint=" When generating SQL, we should always consider constraints: \n \
【Constraints】\n \
- In `SELECT <column>`, just select needed columns in the 【Question】 without any unnecessary column or value \n \
- In `FROM <table>` or `JOIN <table>`, do not include unnecessary table \n \
- If use max or min func, `JOIN <table>` FIRST, THEN use `SELECT MAX(<column>)` or `SELECT MIN(<column>)` \n \
- If [Value examples] of <column> has 'None' or None, use `JOIN <table>` or `WHERE <column> is NOT NULL` is better \n \
- If use `ORDER BY <column> ASC|DESC`, add `GROUP BY <column>` before to select distinct values \
"

def seed_everything(seed: int):  
    import random, os
    import numpy as np
    import torch

    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.backends.cudnn.benchmark = True
    torch.backends.cudnn.deterministic = True
    os.environ['PYTHONHASHSEED'] = str(seed)

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

def get_output_file(output_path, mode='w'):
    directory = os.path.dirname(output_path)
    os.makedirs(directory, exist_ok=True)

    return open(output_path, mode)

def get_schema(db_path):
    with open(db_path, 'r') as f:
        schema = f.read()
    return schema

def get_table_schema(db_path):
    # connect to the database
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("SELECT sql FROM sqlite_master WHERE type='table';")
    schema_statements = cursor.fetchall()
    conn.close()

    schema = "\n\n".join(statement[0] for statement in schema_statements if statement[0] is not None)
    return schema

def get_dump_schema(db_path):
    # connect to the database
    conn = sqlite3.connect(db_path)
    schema = "\n".join(conn.iterdump())
    return schema

def get_prompt(schema:str, question:str, evidence:str = None, chat_mode:bool = True) -> str:
    # base prompt for the question
    base_prompt = "The databse schema is as follows:\n" + schema + "\nWrite Sql for the following question: " + question
    
    # if extra knowledge is provided, add it to the prompt
    if evidence is not None:
        knowledge_prompt = "\n " + "Consider the extra knowledge, it is very useful to help you understand the question and the corresponding sql: " + evidence
    else:
        knowledge_prompt = ""
    
    # if chat mode is enabled, add the chat mode prompt
    if chat_mode:
        base_ans_prompt = "\n" + "And lastly, only write sql with no comments." 
    else:
        base_ans_prompt = "\n" + "Answer : SELECT"

    return base_prompt + knowledge_prompt + base_ans_prompt

def get_cot_prompt(schema:str, question:str) -> str:
    base_prompt = "The databse schema is as follows:\n" + schema + "\n Write Sql for the following question:" + question
    ans_prompt = "\n" + "Think step by step, but only write sql with no comments." 
    return base_prompt + constraint + ans_prompt

def generate_sql(prompt, tokenizer, model, chat_mode:bool = True):
    if chat_mode:
        messages = [
            {"role": "system", "content": "You are a powerful data analysist, reading database schema and write SQL to analyse data."},
            {"role": "user", "content": prompt}
        ]
        text = tokenizer.apply_chat_template(
            messages,
            tokenize=False,
            add_generation_prompt=True
        )

        model_inputs = tokenizer(
            [text], 
            return_tensors="pt",
            return_attention_mask=True
        ).to('cuda')
        generated_ids = model.generate(
            model_inputs.input_ids,
            max_new_tokens=512,
            attention_mask=model_inputs.attention_mask,
            pad_token_id=tokenizer.eos_token_id
        )
        generated_ids = [
            output_ids[len(input_ids):] for input_ids, output_ids in zip(model_inputs.input_ids, generated_ids)
        ]

        response = tokenizer.batch_decode(generated_ids, skip_special_tokens=True)[0]

    else:
        model_inputs = tokenizer.encode(prompt, return_tensors="pt").to('cuda')
        outputs = model.generate(
            model_inputs,
            max_new_tokens=512,
            attention_mask=model_inputs.new_full(model_inputs.shape, 1),
            pad_token_id=tokenizer.eos_token_id
        )
        response = tokenizer.decode(outputs[0][len(model_inputs[0])-1:-1])
    
    # fetch code block
    if "```" in response:
        sql = response.split("```")[1]
    else:
        sql = response

    if 'sql\n' in sql[:4]:
        sql = sql[4:]

    return sql

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-m', '--model_name', type=str, default=DEFAULT_LLM)
    parser.add_argument('-d', '--data_name', type=str, default='spider')

    args = parser.parse_args()

    args.data_path = f'data/{args.data_name}'
    args.schema_path = f'output/{args.data_name}/database'
    args.result_path = f'output/{args.data_name}/{args.model_name}/dev_pred.sql'
    args.gt_result_path = f'output/{args.data_name}/{args.model_name}/dev_pred_gt.sql'

    args.chat_mode = ("codes" not in args.model_name) and ("Symbol-LLM" not in args.model_name)

    return args