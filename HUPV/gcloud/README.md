# Využitie Google Cloudu

Toto je tutorial na využitie Google Cloudu. Screenshoty môžu byť neaktuálne, ale princíp je rovnaký. Dajú sa nastaviť aj iné veci, napr. pripojenie cez WinSCP a pod. To si ale skúste nájsť tutoriál väčšinou je to ľahko dohľadateľné.

## Kredity

26.10.2022 som Vám odoslal mail s inštrukciami na získanie 50 dolárov v Google Cloude.

## Upozornenie!

Ak nepoužívate inštancie, tak ich vypínajte! To isté platí o rezervácii statických IP adries!

## Projekt

Ako prvé si budete musieť vytvoriť na [Google Cloude](https://cloud.google.com/) účet a následne vytvoriť projekt a pridať k nemu Vaše kódy na kredity k tomuto predmetu.

Po aktivácii máte možnosť dostať ďalších 300 dolárov kreditov. Tieto kredity si aplikujte tiež. Neskôr sa Vám zobrazí popup na upgrade konta. Upgradnite si ho (bude potrebné použiť bankomatovú kartu). Pokiaľ nevyčerpáte kredity (300 + 50 kreditov je dosť), tak platiť nebudete.

## Aktivácia Google Compute Engine

Pre predchádzajúcim krokom je nutné aktivovať Google Compute Engine. To sa robí jednoducho kliknutím na Google Compute Engine v menu.

![Quota postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/init_compute.png)


### Sprístupnenie GPU

Aby sme mohli používať GPU je nutné zvýšiť si tzv. quotu na gpu. To spravíme v časti **IAM & admin > Quotas**. Je nutné zmeniť kvótu na maximálny počet GPU, ktoré globálne používame.

![Quota postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/quota1.png)

Aby sa to ľahsie hľadalo môžeme si vyfiltrovať len globálne nastavenia pre Compute Engine API

![Quota postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/quota2.png)

Nakoniec podáme požiadavku na zmenu. Táto nemusí byť schválená hneď. Ak náhodou nebude, tak si v neskorších krokch vytvorte VM bez GPU.

![Quota postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/quota3.png)

## Vyvtorenie VM

Teraz si vytvoríme virtuálny stroj podľa našich požiadaviek. Prejdeme do **Compute Engine > VM Instances** a vytvoríme novú inštanciu.

![VM postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/vm1.png)

Vyberieme si marketplace, kde sú k dispozícii aj prednastavené VM na ktorých je aj Tensorflow s CUDA rovno aj pre GPU.

![VM postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/vm2.png)

VM si upravíme tak, aby mal priradené GPU nvidia T4. To nám bude stačiť a je cenovo najvýhodnejšie. Môžete skúsiť aj lepšie karty, tie su ale drahšie. Ak nemáte schválené GPU, tak si nechajte len CPU. Stačí nam jedno CPU. Aby sa nám GPU vôbec zobrazili je nutné vybrať zónu napr. **europe-west4-c**. Takisto zaškrtnite aj políčko s inštaláciou driverov. Ak chcete používať notebooky cez GCP interface, tak zaškrtnite aj druhé, ale nemám s tým skúsenosti. Ak máte nastavenia, tak stlačte deploy.

![VM postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/vm3.png)

Po deploynutí virtuálneho stroja sa dostanete do Deployment Managera. My sa ale vrátime do **Compute Engine > VM Instances**. Tu je možné virtuálne stroje spúštať, vypínať ale im aj meniť nastavenia a zdroje ktoré potrebujú.

## Prístup cez SSH

Na prístup môžeme využiť priamo terminál cez prehliadač. Alebo ak mám nainštalované Google Cloud SDK, tak si môžeme skopírovať príkaz pomocou ktorého sa nám na našom počítači otvorí ssh terminál do tohto stroja.

*Pozn:* Ak sa prihlasujeme cez gcloud príkaz, tak sa prihlásime s uživateľským menom podľa toho ako sme prihlásený na našom počítači. Ak chceme iné meno musíme príkaz zmeniť z:
```
gcloud compute ssh --project "<project-name>"  --zone "<zone>" "<instance-name>"
```
na
```
gcloud compute ssh --project "<project-name>"  --zone "<zone>" "<user_name>@<instance-name>"
```

Názov projektu si môžete pozrieť, tak že si na zozname VM vyberiete aby sa Vám príkaz SSH uložil do clipboardu.


![SSH postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/ssh1.png)

## Prenos súborov

Pre prenos súborov budeme potrebovať [Google Cloud SDK](https://cloud.google.com/sdk/docs/). Nainštalujte si ju na počítač (stačí pre jedného uživateľa). Pri inštalácii na konci nechajte zaškrtnuté všetky políčka. Po spustení shellu vyberte región **europe-west1** a zónu **europe-west1-b**.

Súbory sa potim prenášajú pomocou (ak je zóna rovnaká ako v predchádzajúcom kroku, tak ju nemusíte špecifikovať):

```
gcloud compute scp --project "<project-name>"  --zone "<zone>" <user>@<instance-name>:/path/to/file /local/path
```

Alebo naopak. 

## Jupyter notebook

Ak si chceme z nášho prehliadača na ľubovoľnom počítači spúsťať jupyter notebooky obdobne ako na Google Colab, tak si musíme urobiť ešte pár nastavení. 

### Priradenie Statickej IP adresy

Aby sme sa vedeli pripojiť so strojom kamkoľvek je nutné priradiť VM statickú IP adresu a sprístupniť želané porty.

Najprv si vyrobíme nové pravidlo pre firewall. To nájdeme v sekcii **VPC network > Firewall rules**, kde pridáme nové pravidlo.

![Firewall postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/firewall1.png)

Pravidlo vyplňte ako na obrázku. V *Targets* vyberte *All instances in the network*. V *Source IP ranges* zadajte *0.0.0.0/0*.
V *Protocols and ports* vyberte *"Specified protocols and ports"*. Nakoniec vyberte *tcp* and porty *7000-9000*.

![Firewall postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/firewall2.png)

Ešte je nutné v nastavení nášho VM povoliť http a https traffic.

![Firewall postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/firewall3.png)

Pre vytvorenie statickej IP adresy musíme vojsť do **VPC network > External IP adresses**.

![Static IP postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/ip1.png)

Následne zmeníme adresu z *Ephemeral* na *Static*. Externú adresu potom použijeme neskôr.

![Static IP postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/imgs/ip2.png)

### Konfigurácia

Ak sa prihlásite cez ssh na VM (prehliadač/Putty/ssh/gcloud), tak urobte tieto kroky aby ste rozbehali jupyter notebook prostredie.

```
jupyter notebook --generate-config
wget https://raw.githubusercontent.com/kocurvik/edu/master/HUPV/gcloud/jupyter_notebook_config.py
cp -f ./jupyter_notebook_config.py ~/.jupyter/
rm ./jupyter_notebook_config.py
python -m notebook.auth password
mkdir notebooky
cd notebooky
jupyter notebook
```

Po tomto stačí do prehliadača na ľubovoľnom počítači pripojenom na internet zadať adresu <vaša externá statická IP>:8888 a dostanete s k jupyter notebooku.


## Úloha - fine-tuning

Túto úlohu vypracujte na cloude. Pripraviť si ju môžete u seba, alebo v Colabe. Skúste si ju však spustiť aj na cloude.

V tejto úlohe budeme trénovať sieť s predtrénovanými váhami tzv. fine-tuning alebo transfer learning. Predtrénované modely prevezmeme z torchvision.models na datasete cats vs. dogs, ktorý stiahnete napríklad tu:


```
https://files.fast.ai/data/examples/dogscats.tgz
```

Pre prácu s datasetom použite torchvision.datasets.ImageFolder. Keďže predtrénovaný model predpokladá že na vstupe bude normalizovaný obrázok, tak musíte v jeho konštruktore použiť aj transformácie:

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


Po načítaní modelu si musíme najprv urpaviť jeho výstup. To spravíme tak, že premeníme jeho parameter fc, tak aby na výstupe boli len dva neuróny (alebo jeden + sigmoid). Ak chceme zmraziť vrstvy, tak je vhodné spraviť to ešte predtým. Optimalizovať potom budeme len úplne poslednú vrstvu. Detailnejšie info napr. [pytorch tutorial](https://pytorch.org/tutorials/beginner/finetuning_torchvision_models_tutorial.html)

```python
from torchvision import models

model = models.resnet18(pretrained=True)
for param in model.parameters():
    param.requires_grad = False
model.fc = torch.nn.Linear(model.fc.in_features, 2))

optimizer = torch.optim.Adam(model.fc.parameters(), lr=1e-3)
```

Model potom skúste natrénovať v štandardnom trénovacom loope. Nezabudnite dať pred trénovací loop model.train() a pred validačný model.eval()! Inak to nebude fungovať.
