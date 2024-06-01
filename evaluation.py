import subprocess
from utils import get_args

def run_evaluation_spider(model_name):
    gold = "data/spider/dev_gold.sql"
    db = "data/spider/database/"
    table = "data/spider/tables.json"
    etype = "all"
    pred = f"output/spider/{model_name}/dev_pred.sql"
    
    command = [
        "python", "evaluation/evaluation_spider.py",
        "--gold", gold,
        "--pred", pred,
        "--db", db,
        "--table", table,
        "--etype", etype
    ]
    
    subprocess.run(command)

def run_evaluation_bird(model_name):
    base_command = {
        "ex": "evaluation/evaluation_bird_ex.py",
        "ves": "evaluation/evaluation_bird_ves.py"
    }
    predicted_sql_json_path = f"output/bird/{model_name}/dev_pred_gt.sql"
    ground_truth_sql_path = "data/bird/dev_gold.sql"
    data_mode = "dev"
    db_root_path = "data/bird/dev_databases/"
    mode_predict = "gt"
    diff_json_path = "data/bird/dev.json"

    for cmd_key in base_command:
        command = [
            "python", base_command[cmd_key],
            "--predicted_sql_json_path", predicted_sql_json_path,
            "--ground_truth_sql_path", ground_truth_sql_path,
            "--data_mode", data_mode,
            "--db_root_path", db_root_path,
            "--mode_predict", mode_predict,
            "--diff_json_path", diff_json_path
        ]
        
        subprocess.run(command)


def evaluation(args):
    if args.data_name == 'spider':
        run_evaluation_spider(args.model_name)
    elif args.data_name == 'bird':
        run_evaluation_bird(args.model_name)

if __name__ == "__main__":
    args = get_args()
    evaluation(args)