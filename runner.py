import os
from tqdm import tqdm
from utils import (
    get_args,
    get_schema,
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
    
    for item in tqdm(dataset):
        db = item['db_id']

        db_path = os.path.join(args.schema_path, db, f'{db}.sqlite')
        schema = get_schema(db_path)
        evidence = item.get('evidence', None)

        prompt = get_prompt(schema, item['question'], evidence, args.chat_mode) 
        response = generate_sql(prompt, tokenizer, model, args.chat_mode)
        
        print("On database:", db)
        print("LLM response:", response)
        print("Ground truth:", item['query'] if args.data_name == 'spider' else item['SQL'])
        print("====================================")

        response = response.replace('\n',' ') + '\n'
        result_file.write(response)

    result_file.close()

if __name__ == '__main__':
    args = get_args()
    run(args)