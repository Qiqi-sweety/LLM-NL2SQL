# LLM NL2SQL Benchmark

## Overview

This repository contains the code for the LLM NL2SQL Benchmark. 

## Installation

Use the following commands to install the required packages.

```sh
pip install nltk
pip install torch
pip install sqlparse
pip install accelerate
pip install transformers
pip install sentencepiece

python -c "import nltk; nltk.download('punkt')"
```

## Result

Spider Dataset:

                     easy                 medium               hard                 extra                all                 
count                248                  446                  174                  166                  1034                
=====================   EXECUTION ACCURACY     =====================
Code Qwen 7B         0.754                0.652                0.477                0.343                0.598
SQL Coder 8B         0.758                0.637                0.368                0.283                0.564
Symbol LLM 13B       0.867                0.670                0.506                0.301                0.631

Bird Dataset:

                     simple               moderate             challenging          total               
count                925                  465                  144                  1534                
======================================    ACCURACY    =====================================
SQL Coder 8B         20.11                7.31                 10.42                15.32
Symbol LLM 13B       16.32                5.16                 6.25                 11.99