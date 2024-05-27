# LLM NL2SQL Benchmark

## Overview

This repository contains the code for the LLM NL2SQL Benchmark. 

## Installation

Use the following commands to install the required packages.

```sh
pip install nltk
pip install torch
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
Code Qwen 7B         0.673                0.392                0.293                0.120                0.399
SQL Coder 8B         0.109                0.004                0.000                0.000                0.028
Symbol LLM 13B       0.851                0.650                0.414                0.313                0.604


                     easy                 medium               hard                 extra                all                 
count                248                  446                  174                  166                  1034                
=====================   EXECUTION ACCURACY     =====================
Code Qwen 7B         0.758                0.684                0.489                0.404                0.624
SQL Coder 8B         0.762                0.628                0.402                0.271                0.565
Symbol LLM 13B       0.895                0.758                0.609                0.440                0.715
```


|                     | easy | medium | hard | extra | all |
|---------------------|------|--------|------|-------|-----|
| count               | 248  | 446    | 174  | 166   | 1034|

#### EXACT MATCHING ACCURACY

| Model         | easy | medium | hard | extra | all   |
|---------------|------|--------|------|-------|-------|
| CodeS 7B      | -    | -      | -    | -     | -     |
| Code Qwen 7B  | 0.673| 0.392  | 0.293| 0.120 | 0.399 |
| SQL Coder 8B  | 0.109| 0.004  | 0.000| 0.000 | 0.028 |
| Symbol LLM 13B| 0.851| 0.650  | 0.414| 0.313 | 0.604 |

#### EXECUTION ACCURACY

| Model         | easy | medium | hard | extra | all   |
|---------------|------|--------|------|-------|-------|
| CodeS 7B      | -    | -      | -    | -     | -     |
| Code Qwen 7B  | 0.758| 0.684  | 0.489| 0.404 | 0.624 |
| SQL Coder 8B  | 0.762| 0.628  | 0.402| 0.271 | 0.565 |
| Symbol LLM 13B| 0.895| 0.758  | 0.609| 0.440 | 0.715 |

### Bird Dataset

```
                     simple               moderate             challenging          total               
count                925                  465                  144                  1534                
======================================    ACCURACY    =====================================  
Code Qwen 7B         40.76                23.23                15.97                33.12
SQL Coder 8B         38.27                20.22                18.75                30.96
Symbol LLM 13B       28.00                11.18                9.72                 21.19


                     simple               moderate             challenging          total               
count                925                  465                  144                  1534                
=========================================    VES   ========================================
Code Qwen 7B         0.64                 0.00                 0.75                 0.45
SQL Coder 8B         0.00                 0.00                 0.00                 0.00
Symbol LLM 13B       0.96                 0.18                 1.89                 0.81
```


|                     | simple | moderate | challenging | total |
|---------------------|--------|----------|-------------|-------|
| count               | 925    | 465      | 144         | 1534  |

#### ACCURACY

| Model         | simple | moderate | challenging | total |
|---------------|--------|----------|-------------|-------|
| CodeS 7B      | -      | -        | -           | -     |
| Code Qwen 7B  | 40.76  | 23.23    | 15.97       | 33.12 |
| SQL Coder 8B  | 38.27  | 20.22    | 18.75       | 30.96 |
| Symbol LLM 13B| 28.00  | 11.18    | 9.72        | 21.19 |

#### VES

| Model         | simple | moderate | challenging | total |
|---------------|--------|----------|-------------|-------|
| CodeS 7B      | -      | -        | -           | -     |
| Code Qwen 7B  | 0.64   | 0.00     | 0.75        | 0.45  |
| SQL Coder 8B  | 0.00   | 0.00     | 0.00        | 0.00  |
| Symbol LLM 13B| 0.96   | 0.18     | 1.89        | 0.81  |

