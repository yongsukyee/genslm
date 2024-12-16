# Command to Run on Virga

## Folder Layout
```
genslm_wgsi
|- genslm/: Modified genslm repo (Virga branch)
|- genslm_wgsi.env/: Virtual environment
|- <workdir>/: Work output directory
|-|- <checkpoint_dir>/: Model checkpoints directory
|-|-|- hpc_ckpt_*.ckpt/: HPC-specific checkpoint for cluster resumption
|-|-|- last.ckpt/: Most recent checkpoint
|-|- logs/: Metric logs directory
|-|-|- logs_<SLURM_JOB_ID>_<SLURM_RESTART_COUNT>/: Metric logs directory for each resubmission
|-|- <job_name>.yaml: Copy of CONFIG.yaml for the experiment
|-|- command.log: Bash command to run script
|-|- <job_name>_<SLURM_JOB_ID>.err: Slurm error log file
|-|- <job_name>_<SLURM_JOB_ID>.out: Slurm output log file
|-|- <job_name>.slurm: Slurm job submission script
|- CONFIG.yaml: Base configuration file
|- run_submit.sh: Bash script for Slurm job submission
```

## Setup and Installation
Setup genslm code:
```bash
git clone https://github.com/yongsukyee/genslm.git
cd genslm
git switch virga
```

Setup virtual environment:
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

## Run Script
In `run_submit.sh`, edit `<ACCOUNT>` and relevant path location. Ensure that the number of nodes requested with `-n` is the same as `num_nodes` in YAML config. Then,
```bash
bash run_submit.sh
```
The job will auto-requeue when it reaches the wall time limit, and subsequent runs will load the `hpc_ckpt_*.ckpt` checkpoint files.

Additional command-line arguments in `run_submit.sh`:
- `-e`: Python virtual environment path

Modified configurations in `CONFIG.yaml`:
- `checkpoint_dir`: Checkpoint directory within `workdir`
- `load_init_pt_checkpoint`: Checkpoint `.pt` file to initialize model weights
- `load_checkpoint_path`: Checkpoint directory path to load checkpoint model

