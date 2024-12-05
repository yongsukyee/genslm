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
module load pytorch/2.1.1-py312-cu122-mpi
module load transformers/4.34.1-py312
python -m venv --system-site-packages ./genslm_wgsi.env
source genslm_wgsi.env/bin/activate
pip install -r requirements/requirements_virga.txt
pip install deepspeed==0.9.*
pip install -e genslm/.
```

## Run script
In `run_submit.sh`, edit `<ACCOUNT>` and relevant path location. ~~Ensure that the number of nodes requested with `-n` is the same as `num_nodes` in YAML config.~~ Then,
```bash
bash run_submit.sh
```

Additional command-line arguments in `run_submit.sh`:
- `-e`: Python virtual environment path
- `-s`: Resubmit the SLURM job script after timeout. To cancel job when `-s` enabled, use `scancel --signal=USR1 <SLURM_JOB_ID>`.

Modified configurations in `CONFIG.yaml`:
- `checkpoint_dir`: Checkpoint directory within `workdir`
- `load_init_pt_checkpoint`: Checkpoint `.pt` file to initialize model weights
- `load_checkpoint_path`: Checkpoint directory path to load checkpoint model

