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

```
                     easy                 medium               hard                 extra                all                 
count                248                  446                  174                  166                  1034 
====================== EXACT MATCHING ACCURACY =====================
CodeS 7B             0.713                0.276                0.191                0.027                0.325
Code Qwen 7B         0.738                0.435                0.293                0.139                0.436
SQL Coder 8B         0.173                0.004                0.000                0.000                0.044
Symbol LLM 13B       0.847                0.641                0.385                0.319                0.596


                     easy                 medium               hard                 extra                all                 
count                248                  446                  174                  166                  1034                
=====================   EXECUTION ACCURACY     =====================
CodeS 7B             0.878                0.756                0.494                0.260                0.665
Code Qwen 7B         0.823                0.747                0.529                0.361                0.666
SQL Coder 8B         0.794                0.648                0.425                0.301                0.590
Symbol LLM 13B       0.907                0.780                0.580                0.434                0.721
```


|                     | easy | medium | hard | extra | all |
|---------------------|------|--------|------|-------|-----|
| count               | 248  | 446    | 174  | 166   | 1034|


### Bird Dataset

```
                     simple               moderate             challenging          total               
count                925                  465                  144                  1534                
======================================    ACCURACY    =====================================  
Code Qwen 7B         40.86                24.09                18.06                33.64
SQL Coder 8B         41.08                20.65                15.97                32.53
Symbol LLM 13B       28.00                11.18                9.72                 21.19


                     simple               moderate             challenging          total               
count                925                  465                  144                  1534                
=========================================    VES   ========================================
Code Qwen 7B         0.33                 0.67                 0.00                 0.40
SQL Coder 8B         0.00                 0.00                 0.00                 0.00
Symbol LLM 13B       0.96                 0.18                 1.89                 0.81
```


|                     | simple | moderate | challenging | total |
|---------------------|--------|----------|-------------|-------|
| count               | 925    | 465      | 144         | 1534  |

