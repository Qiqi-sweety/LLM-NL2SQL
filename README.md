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


|                     | easy | medium | hard | extra | all |
|---------------------|------|--------|------|-------|-----|
| count               | 248  | 446    | 174  | 166   | 1034|

```
                     easy                 medium               hard                 extra                all                 
count                248                  446                  174                  166                  1034 
====================== EXACT MATCHING ACCURACY =====================
Qwen 7B              0.262                0.139                0.017                0.000                0.126
CodeS 7B             0.669                0.307                0.236                0.066                0.343
Code Qwen 7B         0.734                0.460                0.379                0.127                0.458
Symbol LLM 7B        0.786                0.509                0.282                0.289                0.502
SQL Coder 8B         0.153                0.009                0.000                0.000                0.041
Symbol LLM 13B       0.827                0.639                0.385                0.313                0.589
Qwen 14B             0.629                0.191                0.086                0.030                0.252
CodeS 15B            0.758                0.321                0.184                0.054                0.360
Qwen 32B
SQL Coder 34B        0.222                0.260                0.172                0.036                0.200


                     easy                 medium               hard                 extra                all                 
count                248                  446                  174                  166                  1034                
=====================   EXECUTION ACCURACY     =====================
Qwen 7B              0.802                0.652                0.316                0.265                0.570 
CodeS 7B             0.835                0.726                0.494                0.295                0.644
Code Qwen 7B         0.843                0.760                0.546                0.349                0.678
Symbol LLM 7B        0.843                0.688                0.529                0.398                0.652
SQL Coder 8B         0.762                0.639                0.402                0.289                0.573

Symbol LLM 13B       0.911                0.783                0.580                0.464                0.728
Qwen 14B             0.867                0.720                0.471                0.398                0.662
CodeS 15B            0.863                0.738                0.500                0.337                0.663

SQL Coder 34B        0.702                0.668                0.460                0.283                0.579
```


### Bird Dataset

```
                     simple               moderate             challenging          total               
count                925                  465                  144                  1534                
======================================    ACCURACY    =====================================  
Code Qwen 7B         41.95                22.37                19.44                33.90
Symbol LLM 7B        21.19                6.02                 6.94                 15.25
SQL Coder 8B         42.49                22.58                17.36                34.09
Symbol LLM 13B       25.84                9.89                 8.33                 19.36
Qwen 14B             39.68                16.99                10.42                30.05

SQL Coder 34B        43.78                24.73                17.36                35.53


                     simple               moderate             challenging          total               
count                925                  465                  144                  1534                
=========================================    VES   ========================================
Code Qwen 7B         0.75                 0.61                 0.00                 0.64
Symbol LLM 7B        0.95                 0.00                 0.00                 0.58
SQL Coder 8B         0.00                 0.00                 0.00                 0.00

Symbol LLM 13B       1.04                 0.00                 0.75                 0.70
Qwen 14B             0.00                 0.00                 0.00                 0.00

SQL Coder 34B        0.00                 0.00                 0.00                 0.00
```


|                     | simple | moderate | challenging | total |
|---------------------|--------|----------|-------------|-------|
| count               | 925    | 465      | 144         | 1534  |

