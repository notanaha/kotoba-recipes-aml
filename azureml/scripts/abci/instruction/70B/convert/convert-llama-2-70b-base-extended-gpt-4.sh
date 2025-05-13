#!/bin/bash
#$ -l rt_AF=1
#$ -l h_rt=2:00:00
#$ -j y
#$ -o outputs/convert/instruct/70b/
#$ -cwd

set -e

# module load
source /etc/profile.d/modules.sh
module load cuda/11.8/11.8.0
module load cudnn/8.9/8.9.2
module load nccl/2.16/2.16.2-1
module load hpcx/2.12

# swich virtual env
source .env/bin/activate

# distributed settings
export MASTER_ADDR=$(/usr/sbin/ip a show dev bond0 | grep 'inet ' | awk '{ print $2 }' | cut -d "/" -f 1)
export MASTER_PORT=$((10000 + ($JOB_ID % 50000)))

echo "MASTER_ADDR=${MASTER_ADDR}"

start=228
end=456
increment=228

for ((i = start; i <= end; i += increment)); do
  ITERATION=$i
  FORMATTED_ITERATION=$(printf "iter_%07d" $ITERATION)

  CHECK_POINT_PATH=/bb/llm/gaf51275/llama/checkpoints/instruct/gpt-4-instruct/70b/llama-2-70b-base-extended-cc/${FORMATTED_ITERATION}/model.pt
  OUTPUT_PATH=/groups/gaf51275/llama/checkpoints/hf_checkpoints/instruct-gpt4/llama-2-70b-base-extended-cc/${FORMATTED_ITERATION}

  echo "convert ${CHECK_POINT_PATH} to ${OUTPUT_PATH}"

  mkdir -p $OUTPUT_PATH

  BASE_MODEL_CHECKPOINT=/bb/llm/gaf51275/llama/from_megatron_hf_checkpoints/hf_checkpoints/Llama-2-70b-extended-cc/Llama2-70b-base-extended-cc-megatron-iter0025000

  python tools/checkpoint-convert/convert_ckpt.py \
    --model $BASE_MODEL_CHECKPOINT \
    --ckpt $CHECK_POINT_PATH \
    --out $OUTPUT_PATH
done
