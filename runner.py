import os
from tqdm import tqdm

import schema_linking
from fix_gt import fix_gt
from evaluation import evaluation
from scripts.vanilla import get_table_schema_with_insert_data
from utils import (
    get_args,
    get_prompt,
    generate_sql,
    load_dataset,
    seed_everything,
    get_output_file,
    load_tokenizer_and_model,
)

def run(args):
    seed_everything(42)
    tokenizer, model = load_tokenizer_and_model(args.model_name)
    dataset = load_dataset(args.data_path)
    result_file = get_output_file(args.result_path)
    schema_linker = schema_linking.load_schema_linker(args.strategy)

    for item in tqdm(dataset):
        db = item['db_id']
        query = item['question']
        evidence = item.get('evidence', None)

        sqlite_path = os.path.join(args.database_path, db, f'{db}.sqlite')
        db_path = os.path.join(args.schema_path, db, f'{db}.sql') 

        strategy = args.strategy
        try:
            if strategy == 'llm_filter':
                filtered_schema_path = f'/data1/MrLiao/agents/NL2SQL/results/Qwen1.5-14B/select_tab_col/col/{item["question_id"]}.json'
                schema = schema_linking.get_llm_filterd_table_schema(sqlite_path, filtered_schema_path)
            else:
                question = f"{db}\t{query}"
                schema_query = query + ' ' + evidence if evidence else query
                schema = schema_linker.get_schema(sqlite_path, schema_query, question=question)
        except Exception as e:
            # few shot strategy
            schema = get_table_schema_with_insert_data(db_path)
        
        prompt = get_prompt(schema, query, evidence, args.chat_mode) 
        response = generate_sql(prompt, tokenizer, model, args.chat_mode)
        
        print()
        print("On database:", db)
        print("Question:", query)
        print("LLM response:", response)
        print("Ground truth:", item['query'] if args.data_name == 'spider' else item['SQL'])
        print("====================================")

        response = response.replace('\n',' ') + '\n'
        result_file.write(response)

    result_file.close()

    if args.data_name in ['bird']:
        fix_gt(args)
    evaluation(args)

if __name__ == '__main__':
    args = get_args()
    run(args)