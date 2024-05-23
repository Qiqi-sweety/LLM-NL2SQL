constraint=" When generating SQL, we should always consider constraints: \n \
【Constraints】\n \
- In `SELECT <column>`, just select needed columns in the 【Question】 without any unnecessary column or value \n \
- In `FROM <table>` or `JOIN <table>`, do not include unnecessary table \n \
- If use max or min func, `JOIN <table>` FIRST, THEN use `SELECT MAX(<column>)` or `SELECT MIN(<column>)` \n \
- If [Value examples] of <column> has 'None' or None, use `JOIN <table>` or `WHERE <column> is NOT NULL` is better \n \
- If use `ORDER BY <column> ASC|DESC`, add `GROUP BY <column>` before to select distinct values \
"

def get_prompt(schema:str, question:str) -> str:
    base_prompt = "The databse schema is as follows:\n" + schema + "\n Write Sql for the following question:" + question
    base_ans_prompt = "\n" + "And lastly, only write sql with no comments." 
    return base_prompt + base_ans_prompt

def get_evidence_prompt(schema:str, question:str, evidence:str) -> str:
    base_prompt = "The databse schema is as follows:\n" + schema + "\n Write Sql for the following question:" + question
    knowledge_prompt = "\n " + "Consider the extra knowledge, it is very useful to help you understand the question and the corresponding sql: " + evidence
    base_ans_prompt = "\n" + "And lastly, only write sql with no comments."
    return base_prompt + knowledge_prompt + base_ans_prompt

def get_cot_prompt(schema:str, question:str) -> str:
    base_prompt = "The databse schema is as follows:\n" + schema + "\n Write Sql for the following question:" + question
    # cot_prompt="\n Decompose the question into sub questions, and generate the SQL after thinking step by step:"
    cot_prompt=""
    # cot_ans_prompt = "You can write answer in script blocks, and indicate script type in it, like this: \n \
    # ```sql \n \
    # SELECT column_a \n \
    # FROM table_b \n \
    # ```"
    ans_prompt = "\n" + "Think step by step, but only write sql with no comments." 
    return base_prompt + cot_prompt + constraint + ans_prompt