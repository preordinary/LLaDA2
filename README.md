# Evaluation for LLaDA 2.0

This repository provides an unofficial evaluation implementation for **LLaDA 2.0-mini-preview**, based on the [lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness).

> **⚠️ Disclaimer:**
> Since the official evaluation reports for [LLaDA 2.0](https://huggingface.co/inclusionAI/LLaDA2.0-mini-preview) are not yet available, the results presented below are based on independent testing conducted on my own equipment. They may not fully represent the model's official performance capabilities.

## ⚙️ Environment

* **Hardware:** NVIDIA A100 GPU
* **Software:**
    * `torch == 2.5.1`
    * `transformers == 4.57.1`

## 🚀 Quick Start

### 1. Sanity Check
First, run the test script to ensure the environment is set up correctly and the model can generate samples:
```bash
python test.py
```

### 2. Run Evaluation
Execute the shell script to start the evaluation process
```bash
bash eval_LLaDA2.sh
```

## 📝 Key Configurations & Notes
Please pay attention to the following parameters differences compared to LLaDA v1:

- `steps` **Parameter:** In LLaDA 2.0, steps refers to **intra-block steps** (steps within a block), which differs from the definition used in LLaDA 1.0.

- `eos_early_stop`**:** Added a new parameter `eos_early_stop` (default: `True`). This allows generation to stop immediately upon encountering the EOS token, improving efficiency without affecting generation quality.

### ⚠️ Post-processing & Logs
- **Log Samples**: You must enable the `log_samples` option, as the final metrics rely heavily on Python post-processing of these logs.

- **Data Management**: The post-processing script calculates the average accuracy based on **ALL** .jsonl files found in the current result directory
- - Recommendation: Before starting a new run, please **delete old JSONL** files or specify a new output directory to avoid mixing results from different experiments.

## 📊 Evaluation Results

**Observation**: The accuracy at a length of 256 is significantly lower. This is likely because LLaDA 2.0 tends to generate longer responses; a short context window (256) truncates the reasoning process, leading to incomplete answers.


|Model|Len|Method|HumanEval:Acc|MBPP:Acc|GSM8K:Acc|MATH500:Acc|
|-|-|-|-|-|-|-|
|LLaDA2.0-mini-preview|256|baseline|5.5|19.2|63.8|16.2|
||512|baseline|54.3|54.7|86.5|44.6|
||1024|baseline|74.2|63.2|87.7|61.2|


## 🙌 Acknowledgements
This project is built upon the open-source repository [daedal](https://github.com/Li-Jinsong/DAEDAL). Special thanks to the author for their contributions.