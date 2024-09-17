# COMMAND TO RUN ON VIRGA

## My folder layout
```
genslm_wgsi
|- run_submit.sh
|- genslm
```

## Setup virtual environment
```bash
module load python
module load pytorch
module load transformers/4.34.1-py312
python -m venv --system-site-packages ./genslm_wgsi.env
source genslm_wgsi.env/bin/activate
pip install -r requirements/requirements_virga.txt
pip install -e genslm/.
```

## Run script
In `run_submit.sh`, edit `<ACCOUNT>` and relevant path location. Ensure that the number of nodes requested with `-n` is the same as `num_nodes` in YAML config. Then,
```bash
bash run_submit.sh
```
