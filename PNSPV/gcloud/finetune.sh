wget https://files.fast.ai/data/examples/dogscats.tgz
tar -xvf dogscats.tgz
nohup python finetune.py > fine-tune.0.out &
watch -n 0.1 nvidia-smi