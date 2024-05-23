import os
os.environ["HF_ENDPOINT"] = "https://hf-mirror.com"
from transformers import AutoModelForCausalLM, AutoTokenizer
device = "cuda:1" # the device to load the model onto
from prompts import *

model = AutoModelForCausalLM.from_pretrained(
    "Qwen/CodeQwen1.5-7B-Chat",
    torch_dtype="auto",
    device_map="auto"
)
tokenizer = AutoTokenizer.from_pretrained("qwen/CodeQwen1.5-7B-Chat")


# prompt = "Show maximux number of year in table 'sales' in database 'store'."
# messages = [
#     {"role": "system", "content": "You are a powerful data analysist, reading database schema and write SQL to analyse data."},
#     {"role": "user", "content": prompt}
# ]
# text = tokenizer.apply_chat_template(
#     messages,
#     tokenize=False,
#     add_generation_prompt=True
# )
# model_inputs = tokenizer([text], return_tensors="pt").to(device)

# generated_ids = model.generate(
#     model_inputs.input_ids,
#     max_new_tokens=512
# )
# generated_ids = [
#     output_ids[len(input_ids):] for input_ids, output_ids in zip(model_inputs.input_ids, generated_ids)
# ]

# response = tokenizer.batch_decode(generated_ids, skip_special_tokens=True)[0]
# print(response)

import json
spider_dev = json.load(open("spider/dev.json"))
for idx,item in enumerate(spider_dev):
    # print(item['db_id'],item['query'],item['question'])
    db = item['db_id']
    schema = open(f"spider/database/{db}/schema_wash.sql").read()
    # prompt = "The databse schema is as follows:\n" + schema + "\n Write Sql for the following question:" + item['question'] + "\n" + "Only write sql with no comments."
    prompt=get_cot_prompt(schema,item['question'])
    messages = [
        {"role": "system", "content": "You are a powerful data analysist, reading database schema and write SQL to analyse data."},
        {"role": "user", "content": prompt}
    ]
    text = tokenizer.apply_chat_template(
        messages,
        tokenize=False,
        add_generation_prompt=True
    )
    model_inputs = tokenizer([text], return_tensors="pt").to(device)
    generated_ids = model.generate(
        model_inputs.input_ids,
        max_new_tokens=512
    )
    generated_ids = [
        output_ids[len(input_ids):] for input_ids, output_ids in zip(model_inputs.input_ids, generated_ids)
    ]

    response = tokenizer.batch_decode(generated_ids, skip_special_tokens=True)[0]
    # print("On datapoint",idx,"for db",db)
    # print("LLM response:",response)
    # print("Ground truth:", item['query'])
    # print("====================================")
    print(response.replace('\n',' '))



