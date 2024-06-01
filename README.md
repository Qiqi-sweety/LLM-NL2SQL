# LLM NL2SQL Benchmark

## Overview

This repository contains the code for the LLM NL2SQL Benchmark. 

## Installation

Use the following commands to install the required packages.

```sh
pip install nltk
pip install torch
pip install chardet
pip install protobuf
pip install sqlparse
pip install accelerate
pip install func_timeout
pip install transformers
pip install sentencepiece

python -c "import nltk; nltk.download('punkt')"
```

## Result

### Spider Dataset


| **Spider**           | easy | medium | hard | extra | all |
|----------------------|------|--------|------|-------|-----|
| count                | 248  | 446    | 174  | 166   | 1034|
| **EXACT MATCHING**   |      |        |      |       |     |
| Qwen 7B              | 0.262| 0.139  | 0.017| 0.000 | 0.126|
| CodeS 7B             | 0.669| 0.307  | 0.236| 0.066 | 0.343|
| Code Qwen 7B         | 0.734| 0.460  | 0.379| 0.127 | 0.458|
| Symbol LLM 7B        | 0.786| 0.509  | 0.282| 0.289 | 0.502|
| SQL Coder 8B         | 0.153| 0.009  | 0.000| 0.000 | 0.041|
| Symbol LLM 13B       | 0.827| 0.639  | 0.385| 0.313 | **0.589**|
| Qwen 14B             | 0.629| 0.191  | 0.086| 0.030 | 0.252|
| CodeS 15B            | 0.758| 0.321  | 0.184| 0.054 | 0.360|
| Qwen 32B             | 0.726| 0.233  | 0.103| 0.042 | 0.299|
| SQL Coder 34B        | 0.222| 0.260  | 0.172| 0.036 | 0.200|


| **Spider**           | easy | medium | hard | extra | all |
|----------------------|------|--------|------|-------|-----|
| count                | 248  | 446    | 174  | 166   | 1034|
| **EXECUTION ACCURACY** |      |        |      |       |     |
| Qwen 7B              | 0.802| 0.652  | 0.316| 0.265 | 0.570|
| CodeS 7B             | 0.835| 0.726  | 0.494| 0.295 | 0.644|
| Code Qwen 7B         | 0.843| 0.760  | 0.546| 0.349 | 0.678|
| Symbol LLM 7B        | 0.843| 0.688  | 0.529| 0.398 | 0.652|
| SQL Coder 8B         | 0.762| 0.639  | 0.402| 0.289 | 0.573|
| Symbol LLM 13B       | 0.911| 0.783  | 0.580| 0.464 | **0.728**|
| Qwen 14B             | 0.867| 0.720  | 0.471| 0.398 | 0.662|
| CodeS 15B            | 0.863| 0.738  | 0.500| 0.337 | 0.663|
| Qwen 32B             | 0.883| 0.762  | 0.540| 0.410 | 0.697|
| SQL Coder 34B        | 0.702| 0.668  | 0.460| 0.283 | 0.579|


### Bird Dataset

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **ACCURACY**         |        |          |             |       |
| Qwen 7B              | 26.49  | 9.46     | 4.17        | 19.23 |
| CodeS 7B             | 24.11  | 7.31     | 5.56        | 17.28 |
| Code Qwen 7B         | 41.95  | 22.37    | 19.44       | 33.90 |
| Symbol LLM 7B        | 21.19  | 6.02     | 6.94        | 15.25 |
| SQL Coder 8B         | 42.49  | 22.58    | 17.36       | 34.09 |
| Symbol LLM 13B       | 25.84  | 9.89     | 8.33        | 19.36 |
| Qwen 14B             | 39.68  | 16.99    | 10.42       | 30.05 |
| CodeS 15B            | 29.19  | 12.90    | 8.33        | 22.29 |
| Qwen 32B             | 47.68  | 26.45    | 17.36       | **38.40** |
| SQL Coder 34B        | 43.78  | 24.73    | 17.36       | 35.53 |

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **VES**              |        |          |             |       |
| Qwen 7B              | 0.00   | 0.00     | 0.00        | 0.00  |
| CodeS 7B             | 0.00   | 0.00     | 0.00        | 0.00  |
| Code Qwen 7B         | 0.75   | 0.61     | 0.00        | 0.64  |
| Symbol LLM 7B        | 0.95   | 0.00     | 0.00        | 0.58  |
| SQL Coder 8B         | 0.00   | 0.00     | 0.00        | 0.00  |
| Symbol LLM 13B       | 1.04   | 0.00     | 0.75        | **0.70**  |
| Qwen 14B             | 0.00   | 0.00     | 0.00        | 0.00  |
| CodeS 15B            | 0.00   | 0.00     | 0.00        | 0.00  |
| Qwen 32B             | 0.00   | 0.00     | 0.00        | 0.00  |
| SQL Coder 34B        | 0.00   | 0.00     | 0.00        | 0.00  |

## 测试结果V2

#### Spider-Dev数据集

|                         | **easy** | **medium** | **hard** | **extremely hard** | **all** |
| ----------------------- | -------- | ---------- | -------- | ------------------ | ------- |
| Count                   | 248      | 446        | 74       | 166                | 1034    |
| **CodeQwen1.5-7B-Chat** |          |            |          |                    |         |
| Exact Execution (EX)    | 84.3     | 75.6       | 58.0     | 43.4               | 69.5    |
| Exact Match（EM）       | 73.0     | 43.5       | 30.5     | 19.3               | 44.5    |
| **CodeS 7B**            |          |            |          |                    |         |
| Exact Execution (EX)    | 86.3     | 73.3       | 52.9     | 28.3               | 65.8    |
| Exact Match（EM）       | 69.4     | 29.8       | 24.7     | 6.6                | 34.7    |

#### BIRD-DEV数据集

|                         | **easy** | **medium** | **hard** | **all** |
| ----------------------- | -------- | ---------- | -------- | ------- |
| Count                   | 925      | 465        | 144      | 1534    |
| **CodeQwen1.5-7B-Chat** |          |            |          |         |
| Exact Execution (EX)    | 39.6     | 24.1       | 22.2     | 33.3    |
| Valid Efficiency (VES)  | 43.7     | 23.7       | 21.8     | 35.6    |
| **CodeS 7B**            |          |            |          |         |
| Exact Execution (EX)    | 29.3     | 11.8       | 8.3      | 22.0    |
| Valid Efficiency (VES)  | 34.6     | 12.4       | 6.4      | 25.2    |


