# Using Google Cloudu

This is a tutorial for using the Google Cloud specifically the Google Compute Engine

## Credits

TBA

## Warning!

If you are not using instances then shut them down! Otherwise you might get billed. The same applies for static IP addresses and persistent disks.

## Project

First you will need to create a [Google Cloude](https://cloud.google.com/) account and a project within it. You will then need to add your codes for credits for this course.

After activation you are eligible for further 300 dollars worth of credits. Activate these credits as well. Later you will be prompted to upgrade your account. Upgrade your account otherwise you will not be able to use GPUs. This requires credit card information, but you won't be billed unless you spend your free credits (300 + 50 should be enough).

## Aktivácia Google Compute Engine

Before applying for GPUs you will need to active the Google Compute Engine. This is simply done by clicking the Google Compute Engine in the menu on the left.

![Quota postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/init_compute.png)


### GPU access

In order to use the GPUs it is necessary to increate the GPU quota. This can be done in **IAM & admin > Quotas**. It is neccessary to increase the quota for the global number of GPUs you will use.

![Quota postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/quota1.png)

Filter out the quotas by the keyword GPU.

![Quota postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/quota2.png)

Now we will request a qouta change. This may not be approved immediately. If this is the case you can create a VM without GPUs in the following steps.

![Quota postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/quota3.png)

## Creating a VM

Now we will create a virtual machine to suit our needs. Go to **Compute Engine > VM Instances** and create a new instance.

![VM postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/vm1.png)

Now choose marketplace and select the the Deep Learning VM since it already has Tensorflow along with CUDA.

![VM postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/vm2.png)

We can change the configuration and select a different GPU, CPUs or storage. By default it is best to use K80 GPUs since they are cheapest. If you do not have a GPU then try this only with CPUS. If you do not see GPUs it is possible that they are not available in the selected zone. In Slovakia it is best to select the zone **europe-west1-b**. Also make sure you check both of the checkboxes.
![VM postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/vm3.png)

After deploying the VM you will be redirected to the Deployment Manger. We will switch to **Compute Engine > VM Instances**. Here it is possible to run, stop or change the settings of our VMs.avenia a zdroje ktoré potrebujú.

## SSH

To access the VM we may use the terminal in the browser. If you have the Google Cloud SDK you can also save the command gor it in clipboard by selecting the appropriate command in the dropdown menu.

*Note:* If you log in via the gcloud command you will be logged in with the username on your current machine. If you want to change the name you have to change the commaned from:

```
gcloud compute --project "<project-name>"  --zone "<zone>" ssh "<instance-name>"
```
to
```
gcloud compute --project "<project-name>"  --zone "<zone>" ssh "<user_name>@<instance-name>"
```

The project name and zone can be copied from the clipboard.

![SSH postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/ssh1.png)

## File transfer

To transfer files you will need the [Google Cloud SDK](https://cloud.google.com/sdk/docs/). Install it (if you are not an admin you can select user installation). At the end of the installation do check all of the boxes. After running the shell use region **europe-west1** and zone **europe-west1-b**.

You can then transfer files such as (you do not need the --zone parameter if you are in the defult zone as selected in the previous step):

```
gcloud compute scp --project "<project-name>"  --zone "<zone>" <user>@<instance-name>:/path/to/file /local/path
```

Or the other way around.

## Jupyter notebook

If you want to use jupzter notebook from any PC in the same way we do with Google Colab we will have to perform some additional setup.te pár nastavení. 

### Assigning Static IP address

In order to connect to the machine we will need to assign it a static IP address and open some ports.

First we will create a new rule for firewall. This can be found in the **VPC network > Firewall rules**. We add a new rule there.

![Firewall postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/firewall1.png)

Fill it out in the same way as is presented in the image. In *Targets* select *All instances in the network*. In *Source IP ranges* fill in *0.0.0.0/0*. In *Protocols and ports* select *"Specified protocols and ports"*. At the end choose *tcp* and ports *7000-9000*.

![Firewall postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/firewall2.png)

We will also need to allow http and https traffic in our instace.

![Firewall postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/firewall3.png)

To create a new static IP go to **VPC network > External IP adresses**.

![Static IP postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/ip1.png)

Then change the address from *Ephemeral* to *Static*. We will use this later.

![Static IP postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/ip2.png)

### Konfigurácia

After logging-in to the VM (browser, ssh, gcloud) run the following code to set-up the jupyter notebook environment.

```
jupyter notebook --generate-config
wget https://raw.githubusercontent.com/kocurvik/edu/master/PNSPV/gcloud/jupyter_notebook_config.py
cp -f ./jupyter_notebook_config.py ~/.jupyter/
rm ./jupyter_notebook_config.py
python -m notebook.auth password
mkdir notebooky
cd notebooky
jupyter notebook
```

After this you only need to input <your external IP address>:8888 into your browser and you will gain access to the notebook.


## Exercise - fine-tuning

Do this exercise on the cloud. You can prepare it locally or in Colab, but it would be ideal if you run it for at least a while on the cloud.

In this exercise we will train a network with pre-trained weights which is known as fine-tuning or transfer learning. We will use the models from torchvision.models on the cats vs. dogs. You can download it here:
```
https://files.fast.ai/data/examples/dogscats.tgz
```

To work with the dataset you can use torchvision.datasets.ImageFolder. Since the pre-trained model assumes normalized inputs you have use the following transform in the Dataset constructor.

```python
from torchvision import transforms

transform = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406],
                         std=[0.229, 0.224, 0.225] )
    ])
```

After loading the model we have to adjust its output. We can do this by changing the fc parmater so the output only contains two neurons (or one neuron with sigmoid). If we want to freeze the layers it is advisable to do this in advance. We will then perform optimization only on the last layer. You can find more info in [this pytorch tutorial](https://pytorch.org/tutorials/beginner/finetuning_torchvision_models_tutorial.html)

```python
from torchvision import models

model = models.resnet18(pretrained=True)
for param in model.parameters():
    param.requires_grad = False
model.fc = torch.nn.Linear(model.fc.in_features, 2))

optimizer = torch.optim.Adam(model.fc.parameters(), lr=1e-3)
```

Model potom skúste natrénovať v štandardnom trénovacom loope. Nezabudnite dať pred trénovací loop model.train() a pred validačný model.eval()! Inak to nebude fungovať.then add a Global Pooling layer and few Dense layers. Test the training for all of the three options.
