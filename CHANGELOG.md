# CHANGELOG

## 2024, December 11
- fix Virga template for job resubmission as previous one stopped working
- add load HPC checkpoint from auto-requeue in `model.py`
- remove load from `last.ckpt` model checkpoint in `model.py`

## 2024, December 6
- add copy `CONFIG.yaml` file to `workdir` directory in `/hpc/submit.py`
- add `CSVLogger` as default metrics logger in `model.py`

## 2024, December 4
- rename `load_pt_checkpoint` to `load_init_pt_checkpoint` in configuration
- add `load_checkpoint_path` in configuration
- add load model from specified checkpoint `load_checkpoint_path` or `last.ckpt` if available in `model.py`

## 2024, November 29
- modify Virga template to include job resubmission after timeout

## 2024, August 19
- add bash script to run on Virga in `run_submit.sh`
- add template for Virga in `/hpc/templates/virga.j2`
- add commands to run on Virga in `/docs/COMMANDS_virga.md`
- add requirements on Virga in `/requirements/requirements_virga.txt`
- add `envpath` command-line argument in `/hpc/submit.py`
- add write `command.log` file to `workdir` directory in `/hpc/submit.py`
