# Lab: Running a fine-tuning job on Devana / Perun

In this lab you will connect to one of the HPC clusters of the Slovak Academy of Sciences (**Devana** or **Perun**), prepare a conda environment and run your fine-tuning task as a GPU job.

Full documentation of the clusters: https://userdocs.hpc.sav.sk/

Throughout this guide replace `<USER>` with your cluster username and `<PROJECT>` with the project ID (step 4 shows how to find it).

---

## ⚠️ Acknowledgement – required if you use the cluster

If you use the clusters for any work that ends up in a thesis, report, paper or poster, you **must** include the acknowledgement for the cluster you used ([official texts](https://userdocs.hpc.sav.sk/acknowledgement/)).

> **🎓 Using the cluster for your master's thesis?** You must include the acknowledgement in your thesis **and email me the final thesis** at **kocurvik@gmail.com** once it is submitted. This is a condition of the access we were granted – the computing centre requires us to report the results produced with their resources.

**Devana**

- 🇬🇧 *"(Part of the) Research results was obtained using the computational resources procured in the national project National competence centre for high performance computing (project code: 311070AKF2) funded by European Regional Development Fund, EU Structural Funds Informatization of society, Operational Program Integrated Infrastructure."*
- 🇸🇰 *„Výskum (alebo jeho časť) bol realizovaný s využitím výpočtovej infraštruktúry obstaranej v projekte Národné kompetenčné centrum pre vysokovýkonné počítanie (kód projektu: 311070AKF2) financovaného z Európskeho fondu regionálneho rozvoja, Štrukturálnych fondov EU Informatizácia spoločnosti, operačného programu Integrovaná infraštruktúra 2014-2020."*

**Perun**

- 🇬🇧 *"(Part of the) Research results were obtained using the computational resources funded by the EU NextGenerationEU through the Recovery and Resilience Plan for Slovakia under the project No. 17I03-04-P02-00001, Development and construction of a supercomputer for national supercomputing centre."*
- 🇸🇰 *„Výskum (alebo jeho časť) bol realizovaný s využitím výpočtovej infraštruktúry financovanej Európskou úniou – NextGenerationEU prostredníctvom Plánu obnovy a odolnosti SR v rámci projektu č. 17I03-04-P02-00001: Vývoj a konštrukcia superpočítača pre národné superpočítačové centrum."*

---

## Rules of good behaviour

The GPU hours come from a **shared project allocation** – every wasted hour is taken from your classmates.

- **Never train on the login node.** Login nodes are only for editing files, installing packages, downloading data and submitting jobs. Computation always goes into a job.
- **Ask only for what you need:** 1 GPU, a few CPU cores and a short time limit (e.g. 30 minutes). Smaller jobs also start sooner.
- **Debug on a small subset** of the data first (the dataset contains a `sample/` folder).
- **Cancel jobs** you no longer need (`scancel`) and **delete Jupyter sessions** in Open OnDemand when you are done – an idle notebook still blocks a GPU.
---

## 1. Generate an SSH key

The clusters don't allow password login over SSH, you need an SSH key pair. On Linux, macOS or Windows 10/11 (PowerShell) run:

```bash
ssh-keygen -t ed25519
```

This creates a private key `~/.ssh/id_ed25519` (never share it!) and a public key `~/.ssh/id_ed25519.pub`. Log in to the registration portal and upload the **public** key (`.pub`) in the SSH key section.

📖 Details (incl. PuTTY on older Windows): https://userdocs.hpc.sav.sk/quick_start/ssh_keys/

---

## 2. Connect to the cluster

You can choose between a terminal (SSH) and a web browser (Open OnDemand). In both cases you will be asked for a one-time code from a 2FA authenticator app (e.g. Google Authenticator, FreeOTP, Aegis); on the first login you will be guided through setting it up.

### Option A: SSH

| Cluster | Login hostname | Port |
|---|---|---|
| Devana | `login.devana.sav.sk` | 5522 |
| Perun | `login.perun.sav.sk` | 5522 |

```bash
ssh -p 5522 <USER>@login.devana.sav.sk -i ~/.ssh/id_ed25519
```

On first login answer `yes` to the question about the host's authenticity.

Tip: add this to `~/.ssh/config` so that `ssh devana` is enough (this also makes it easy to connect from VS Code Remote-SSH):

```
Host devana
    HostName login.devana.sav.sk
    Port 5522
    User <USER>
    IdentityFile ~/.ssh/id_ed25519
```

📖 Details (MobaXterm, PuTTY): https://userdocs.hpc.sav.sk/quick_start/how_to_connect/

### Option B: Open OnDemand (browser only)

Go to https://ood.devana.nscc.sk and log in with your username, password and 2FA code. Useful menus:

- **Files** – browse, upload, download and edit files,
- **Clusters → shell** – a terminal in your browser (you can do everything in this guide from here),
- **Jobs → Active Jobs / Job Composer** – monitor and create batch jobs,
- **Interactive Apps → Jupyter Notebook** – a notebook running on a compute node.

📖 Details: https://userdocs.hpc.sav.sk/quick_start/open_ondemand/

---

## 3. Prepare a conda environment

Software on the clusters is provided through **modules**. Conda is available as a module:

```bash
module avail conda      # find the exact module name
module load conda
eval "$(conda shell.bash hook)"   # makes `conda activate` work in the current shell
```

Now create your own conda environment with everything the task needs – PyTorch, torchvision, `submitit` (for option B in step 6) and `jupyter` (for option C). Activate it and check that `torch` imports. You won't see a GPU on the login node, that is expected.

Remember: after every new login you have to run `module load conda`, the `eval` line and `conda activate <your-env>` again. Jobs inherit the environment of the shell you submit them from, so activate your environment **before** submitting a job – there is no need to activate it inside the job script.

Download the dataset (and the pretrained weights) **on the login node** – compute nodes may not have internet access. Keeping the data in your home directory is fine.

---

## 4. Your project account and the queue

Every job must be charged to a project account. Find yours with:

```bash
sprojects -a
```

Have a look at the partitions and how busy the cluster is:

```bash
sinfo            # partitions and the state of their nodes
squeue           # all jobs in the queue
squeue --me      # only your jobs
```

GPU partitions: **`gpu`** on Devana (4× NVIDIA A100 per node), **`gpu_short`** on Perun. Both clusters also have a **`testing`** partition for very short runs (max 30 min).

📖 Partitions: https://userdocs.hpc.sav.sk/shared/job_submission/partitions/, https://userdocs.hpc.sav.sk/perun/partitions/, GPU jobs: https://userdocs.hpc.sav.sk/devana/job_submission/gpu_jobs/

---

## 5. The task

### Fine-tuning

Complete this task on the cluster. You can prepare it on your own machine or in Colab, but make sure you also run it on the cluster (copy your code there with `scp`, VS Code, or the *Files* menu in Open OnDemand).

In this task we will train a network starting from pretrained weights, so-called **fine-tuning** or **transfer learning**. We take a pretrained model from `torchvision.models` and train it on the cats vs. dogs dataset, which you can download e.g. here:

```
https://files.fast.ai/data/examples/dogscats.tgz
```

Use `torchvision.datasets.ImageFolder` to work with the dataset. Since the pretrained model expects a normalized image as input, you also have to pass the following transforms to its constructor:

```python
from torchvision import transforms

transform = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406],
                         std=[0.229, 0.224, 0.225])
    ])
```

After loading the model, we first have to modify its output. We do this by replacing its `fc` attribute so that it has only two output neurons (or one + sigmoid). If we want to freeze the layers, it is best to do so before replacing `fc`. We will then optimize only the very last layer. For more details see e.g. the [PyTorch tutorial](https://pytorch.org/tutorials/beginner/finetuning_torchvision_models_tutorial.html).

```python
import torch
from torchvision import models

model = models.resnet18(weights="IMAGENET1K_V1")  # pretrained=True in older torchvision
for param in model.parameters():
    param.requires_grad = False
model.fc = torch.nn.Linear(model.fc.in_features, 2)

optimizer = torch.optim.Adam(model.fc.parameters(), lr=1e-3)
```

Then train the model in a standard training loop. Don't forget to call `model.train()` before the training loop and `model.eval()` before validation! Otherwise it won't work.

Make the script print which device it runs on and the validation accuracy after each epoch, so you can verify the run from the job log.

---

## 6. Run the job

Choose one of the options (or try all of them).

### Option A: Slurm batch script

A minimal template – fill in the missing parts:

```bash
#!/bin/bash
#SBATCH --job-name=dogscats
#SBATCH --account=<PROJECT>
#SBATCH --partition=gpu          # Perun: gpu_short
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=00:30:00
#SBATCH --output=dogscats_%j.out # %j = job ID

nvidia-smi
python <your_script>.py
```

Submit it from a shell where your conda environment is active (the job inherits it):

```bash
conda activate <your-env>
sbatch job.sh
squeue --me                      # PD = pending, R = running
tail -f dogscats_<JOBID>.out     # follow the output
```

In Open OnDemand you can do the same via **Jobs → Job Composer**.

📖 Details: https://userdocs.hpc.sav.sk/shared/job_submission/first_script/, GPU jobs: https://userdocs.hpc.sav.sk/shared/job_submission/gpu_jobs/

### Option B: submitit

[submitit](https://github.com/facebookincubator/submitit) submits a Python function as a Slurm job directly from Python and gives you its return value back. Run this on the login node with your environment activated:

```python
import submitit

def add(a, b):
    return a + b

executor = submitit.AutoExecutor(folder="submitit_logs/%j")
executor.update_parameters(
    slurm_account="<PROJECT>",
    slurm_partition="gpu",      # Perun: gpu_short
    gpus_per_node=1,
    cpus_per_task=8,
    timeout_min=30,
)

job = executor.submit(add, 5, 7)
print(job.job_id)
print(job.result())   # waits for the job to finish -> 12
```

Replace `add` with your training function. Logs end up in `submitit_logs/<JOBID>/`.

### Option C: Jupyter Notebook in Open OnDemand

> ⚠️ **Not recommended for training.** A notebook holds the GPU for the whole session, even while you are reading or typing, and a long training run is lost if the browser or session disconnects. Use notebooks only for quick exploration and debugging, and run the actual training as a batch job (option A or B).

In https://ood.devana.nscc.sk open **Interactive Apps → Jupyter Notebook**, set the account, partition (`gpu`), 1 GPU, walltime, module `conda` and your conda environment name (it must contain `jupyter`). Click **Launch**, then **Connect to Jupyter** once the session is running. **Delete the session when you are done.**

📖 Details: https://userdocs.hpc.sav.sk/shared/environment/jupyternotebook/

---

## Useful Slurm commands

| Command | What it does |
|---|---|
| `sprojects -a` | your projects / accounts |
| `sinfo` | partitions and node states |
| `squeue --me` | your queued and running jobs |
| `sbatch job.sh` | submit a batch job |
| `scancel <JOBID>` | cancel a job |
| `sacct -j <JOBID>` | info about a finished job |
| `srun -A <PROJECT> -p gpu --gres=gpu:1 --time=00:20:00 --pty bash` | interactive shell on a GPU node (for debugging) |
