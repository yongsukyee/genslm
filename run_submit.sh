#!/bin/bash

ENV_PATH="/scratch3/${USER}/genslm_wgsi/genslm_wgsi.env"

# Using venv
module load python
module load pytorch
module load transformers/4.34.1-py312
source ${ENV_PATH}/bin/activate

python -m genslm.hpc.submit -T virga -A <ACCOUNT> \
    -w /scratch3/${USER}/genslm_wgsi/outputs/test \
    -e ${ENV_PATH} \
    -j test_run \
    -t 02:00:00 \
    -n 2 \
    -v "-c /scratch3/${USER}/genslm_wgsi/25M_finetune.yaml"
# Additional flags
    # -m "genslm.model"
