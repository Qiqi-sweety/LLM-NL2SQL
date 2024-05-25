import os
import subprocess
import chardet

# 要遍历的文件夹路径
folder_path = '/home/zch/spider-qwen/bird-dev/dev/dev_databases'

# 遍历文件夹
for folder_name in os.listdir(folder_path):
    order1='cd ' + folder_path + '/' + folder_name
    order2='sqlite3 ' + folder_name + ".sqlite .dump > schema.sql"
    
    schema_file = folder_path + '/' + folder_name + '/schema.sql'
    if not os.path.exists(schema_file):
        try:
            subprocess.run(order1 + "&&" + order2, shell=True, check=True)
            print("命令执行成功")
        except subprocess.CalledProcessError as e:
            print("命令执行失败:", e)
    else:
        print("文件已存在")
    # filter_out continous Insert command
    insert_lines = []
    output_file = open(folder_path + '/' + folder_name + '/schema_wash.sql',"w")
    with open(schema_file, 'rb') as f:
        result = chardet.detect(f.read())
    print(result)
    with open(schema_file, 'r',encoding=result['encoding']) as f:
        for line in f.readlines():
            if line.startswith("INSERT"):
                insert_lines.append(line)
            else:
                for insert_line in insert_lines[0:5]:
                    output_file.write(insert_line)
                insert_lines = []
                output_file.write(line)
    