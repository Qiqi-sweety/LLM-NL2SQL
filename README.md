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

## Running

Our evaluation framework supports almost all models that can be downloaded from HuggingFace and Spider dataset and Bird dataset. You can run the benchmark with the following command and specify the model and dataset.

```sh
python runner.py -m [model_name] -d [dataset_name]
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
| LLaMA 8B             | 0.419| 0.184  | 0.092| 0.030 | 0.200|
| SQL Coder 8B         | 0.153| 0.009  | 0.000| 0.000 | 0.041|
| GLM 9B               | 0.544| 0.238  | 0.052| 0.036 | 0.248|
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
| LLaMA 8B             | 0.718| 0.619  | 0.414| 0.259 | 0.550|
| SQL Coder 8B         | 0.762| 0.639  | 0.402| 0.289 | 0.573|
| GLM 9B               | 0.863| 0.762  | 0.511| 0.434 | 0.691|
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
| LLaMA 8B             | 13.73  | 5.38     | 9.03        | 10.76 |
| SQL Coder 8B         | 42.49  | 22.58    | 17.36       | 34.09 |
| GLM 9B               | 47.57  | 24.73    | 19.44       | 38.01 |
| Symbol LLM 13B       | 25.84  | 9.89     | 8.33        | 19.36 |
| Qwen 14B             | 39.68  | 16.99    | 10.42       | 30.05 |
| CodeS 15B            | 29.19  | 12.90    | 8.33        | 22.29 |
| Qwen 32B             | 47.68  | 26.45    | 17.36       | **38.40** |
| SQL Coder 34B        | 43.78  | 24.73    | 17.36       | 35.53 |

| **Bird**             | simple | moderate | challenging | total |
|----------------------|--------|----------|-------------|-------|
| count                | 925    | 465      | 144         | 1534  |
| **VES**              |        |          |             |       |
| Qwen 7B              | 27.77  | 9.92     | 4.42        | 20.17 |
| CodeS 7B             | 26.29  | 8.26     | 5.15        | 18.84 |
| Code Qwen 7B         | 42.06  | 22.89    | 18.95       | 34.08 |
| Symbol LLM 7B        | 23.56  | 8.17     | 11.53       | 17.77 |
| LLaMA 8B             | 14.18  | 5.47     | 6.93        | 10.86 |
| SQL Coder 8B         | 43.76  | 23.04    | 17.47       | 35.01 |
| GLM 9B               | 50.21  | 24.61    | 20.52       | 39.66 |
| Symbol LLM 13B       | 26.78  | 10.61    | 9.07        | 20.21 |
| Qwen 14B             | 40.61  | 17.88    | 10.15       | 30.86 |
| CodeS 15B            | 30.25  | 13.49    | 6.83        | 22.97 |
| Qwen 32B             | 49.26  | 26.33    | 18.57       | 39.43 |
| SQL Coder 34B        | 46.50  | 28.34    | 17.86       | 38.30 |


## Schema Linking

Chat-GLM-9B

```
                     simple               moderate             challenging          total               
count                925                  465                  144                  1534                
======================================    ACCURACY    =====================================
zero shot            46.05                24.52                18.75                36.96
few shot             48.43                28.82                18.75                39.70  
```

```
                     simple               moderate             challenging          total
count                925                  465                  144                  1534
=========================================    VES   ========================================
zero shot            48.28                25.00                19.91                38.56
few shot             51.34                28.94                18.94                41.51
```

Qwen2-7B

```
                     simple               moderate             challenging          total
count                925                  465                  144                  1534
======================================    ACCURACY    =====================================
zero shot            43.14                26.45                17.36                35.66
few shot             45.51                25.38                19.44                36.96
```