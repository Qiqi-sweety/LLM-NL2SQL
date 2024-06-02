import subprocess

def evaluation():
    models = [
        "Qwen/Qwen1.5-7B-Chat", "Qwen/Qwen1.5-14B-Chat", "Qwen/Qwen1.5-32B-Chat",
        "Qwen/CodeQwen1.5-7B-Chat",
        "seeklhy/codes-7b", "seeklhy/codes-15b",
        "defog/llama-3-sqlcoder-8b", "defog/sqlcoder-34b-alpha",
        "Symbol-LLM/Symbol-LLM-7B-Instruct", "Symbol-LLM/Symbol-LLM-13B-Instruct"
    ]

    for model_name in models:
        predicted_sql_json_path = f"output/bird/{model_name}/dev_pred_gt.sql"
        ground_truth_sql_path = "data/bird/dev_gold.sql"
        data_mode = "dev"
        db_root_path = "data/bird/dev_databases/"
        mode_predict = "gt"
        diff_json_path = "data/bird/dev.json"

        command = [
            "python", "evaluation/evaluation_bird_ves.py",
            "--predicted_sql_json_path", predicted_sql_json_path,
            "--ground_truth_sql_path", ground_truth_sql_path,
            "--data_mode", data_mode,
            "--db_root_path", db_root_path,
            "--mode_predict", mode_predict,
            "--diff_json_path", diff_json_path
        ]
        
        print(model_name)
        subprocess.run(command)

if __name__ == "__main__":
    evaluation()