export CUDA_VISIBLE_DEVICES=2

BASE_OUTPUT_PATH="./results/llada2"
MODEL_PATH="your model path"
length=512
steps=32
block_length=32


task="humaneval"
OUTPUT_PATH="${BASE_OUTPUT_PATH}/${task}_${length}"
accelerate launch evaluation_script.py \
    -m dllm_eval \
    --model LLaDA2 \
    --tasks ${task} \
    --batch_size 1 \
    --model_args "pretrained=${MODEL_PATH},assistant_prefix=<reasoning> " \
    --gen_kwargs "block_length=${block_length},gen_length=${length},steps=${steps},temperature=0,eos_early_stop=True" \
    --num_fewshot 0 \
    --output_path "${OUTPUT_PATH}" \
    --log_samples \
    --confirm_run_unsafe_code

python metrics/humaneval.py \
    --res_path "${OUTPUT_PATH}"



task="gsm8k"
OUTPUT_PATH="${BASE_OUTPUT_PATH}/${task}_${length}"
accelerate launch evaluation_script.py \
    -m dllm_eval \
    --model LLaDA2 \
    --tasks ${task} \
    --batch_size 1 \
    --model_args "pretrained=${MODEL_PATH},assistant_prefix=<reasoning> " \
    --gen_kwargs "block_length=${block_length},gen_length=${length},steps=${steps},temperature=0,eos_early_stop=True" \
    --num_fewshot 0 \
    --output_path "${OUTPUT_PATH}" \
    --log_samples \
    --confirm_run_unsafe_code

python metrics/gsm8k.py \
    --res_path "${OUTPUT_PATH}"



task="mbpp"
OUTPUT_PATH="${BASE_OUTPUT_PATH}/${task}_${length}"
accelerate launch evaluation_script.py \
    -m dllm_eval \
    --model LLaDA2 \
    --tasks ${task} \
    --batch_size 1 \
    --model_args "pretrained=${MODEL_PATH},assistant_prefix=<reasoning> " \
    --gen_kwargs "block_length=${block_length},gen_length=${length},steps=${steps},temperature=0,eos_early_stop=True" \
    --num_fewshot 0 \
    --output_path "${OUTPUT_PATH}" \
    --log_samples \
    --confirm_run_unsafe_code

python metrics/mbpp.py \
    --res_path "${OUTPUT_PATH}"



task="math500"
OUTPUT_PATH="${BASE_OUTPUT_PATH}/${task}_${length}"
accelerate launch evaluation_script.py \
    -m dllm_eval \
    --model LLaDA2 \
    --tasks ${task} \
    --batch_size 1 \
    --model_args "pretrained=${MODEL_PATH},assistant_prefix=<reasoning> " \
    --gen_kwargs "block_length=${block_length},gen_length=${length},steps=${steps},temperature=0,eos_early_stop=True" \
    --num_fewshot 0 \
    --output_path "${OUTPUT_PATH}" \
    --log_samples \
    --confirm_run_unsafe_code

python metrics/math500.py \
    --res_path "${OUTPUT_PATH}"