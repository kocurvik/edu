# Využitie Google Cloudu

Toto je tutorial na využitie Google Cloudu.

## Kredity

TBA

## Upozornenie!

Ak nepoužívate inštancie, tak ich vypínajte! To isté platí o rezervácii statických IP adries!

## Projekt

Ako prvé si budete musieť vytvoriť na [Google Cloude](https://cloud.google.com/) účet a následne vytvoriť projekt a pridať k nemu Vaše kódy na kredity k tomuto predmetu.

Túto časť si nepamätám na cviku to snáď spravíme. 

### Sprístupnenie GPU

Aby sme mohli používať GPU je nutné zvýšiť si tzv. quotu na gpu. To spravíme v časti **IAM & admin > Quotas**. Je nutné zmeniť kvótu na maximálny počet GPU, ktoré globálne používame.

![Quota postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/quota1.png)

Aby sa to ľahsie hľadalo môžeme si vyfiltrovať len globálne nastavenia pre Compute Engine API

![Quota postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/quota2.png)

Nakoniec podáme požiadavku na zmenu. Táto nemusí byť schválená hneď. Ak náhodou nebude, tak si v neskorších krokch vytvorte VM bez GPU.

![Quota postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/quota3.png)

## Vyvtorenie VM

Teraz si vytvoríme virtuálny stroj podľa našich požiadaviek. Prejdeme do **Compute Engine > VM Instances** a vytvoríme novú inštanciu.

![VM postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/vm1.png)

Vyberieme si marketplace, kde sú k dispozícii aj prednastavené VM na ktorých je aj Tensorflow s CUDA rovno aj pre GPU.

![VM postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/vm2.png)

VM si upravíme tak, aby mal priradené GPU Tesla K80. To nám bude stačiť. Môžete skúsiť aj lepšie karty, tie su ale drahšie. Ak nemáte schválené GPU, tak si nechajte len CPU. Stačí nam jednu CPU. Aby sa nám GPU vôbec zobrazili je nutné vybrať zónu **europe-west1-b**. Takisto zaškrtnite aj oboje políčka. Ak máte nastavenia, tak stlačte deploy.

![VM postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/vm3.png)

Po deploynutí virtuálneho stroja sa dostanete do Deployment Managera. My sa ale vrátime do **Compute Engine > VM Instances**. Tu je možné virtuálne stroje spúštať, vypínať ale im aj meniť nastavenia a zdroje ktoré potrebujú.

## Prístup cez SSH

Na prístup môžeme využiť priamo terminál cez prehliadač. Alebo ak mám nainštalované Google Cloud SDK, tak si môžeme skopírovať príkaz pomocou ktorého sa nám na našom počítači otvorí ssh terminál do tohto stroja.


## Prenos súborov

Pre prenos súborov budeme potrebovať [Google Cloud SDK](https://cloud.google.com/sdk/docs/). Nainštalujte si ju na počítač (stačí pre jedného uživateľa). Pri inštalácii na konci nechajte zaškrtnuté všetky políčka. Po spustení shellu vyberte región **europe-west1** a zónu **europe-west1-b**.

Súbory sa potim prenášajú pomocou:

```
gcloud compute scp <user>@<instance-name>:/path/to/file /local/path
```

Alebo naopak. 

## Jupyter notebook

Ak si chceme z nášho prehliadača na ľubovoľnom počítači spúsťať jupyter notebooky obdobne ako na Google Colab, tak si musíme urobiť ešte pár nastavení. 

### Priradenie Statickej IP adresy

Aby sme sa vedeli pripojiť so strojom kamkoľvek je nutné priradiť VM statickú IP adresu a sprístupniť želané porty.

Najprv si vyrobíme nové pravidlo pre firewall. To nájdeme v sekcii **VPC network > Firewall rules**, kde pridáme nové pravidlo.

![Firewall postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/firewall1.png)

Pravidlo vyplňte ako na obrázku. V *Targets* vyberte *All instances in the network*. V *Source IP ranges* zadajte *0.0.0.0/0*.
V *Protocols and ports* vyberte *"Specified protocols and ports"*. Nakoniec vyberte *tcp* and porty *7000-9000*.

![Firewall postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/firewall2.png)

Ešte je nutné v nastavení nášho VM povoliť http a https traffic.

![Firewall postup 3](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/firewall3.png)

Pre vytvorenie statickej IP adresy musíme vojsť do **VPC network > External IP adresses**.

![Static IP postup 1](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/ip1.png)

Následne zmeníme adresu z *Ephemeral* na *Static*. Externú adresu potom použijeme neskôr.

![Static IP postup 2](https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/imgs/ip2.png)

### Konfigurácia

Ak sa prihlásite cez ssh na VM (prehliadač/Putty/ssh/gcloud), tak urobte tieto kroky aby ste rozbehali jupyter notebook prostredie.

```
jupyter notebook --generate-config
wget https://raw.githubusercontent.com/kocurvik/edu/master/PNNPPV/gcloud/jupyter_notebook_config.py
cp -f ./jupyter_notebook_config.py ~/.jupyter/
rm ./jupyter_notebook_config.py
python -m notebook.auth password
mkdir notebooky
cd notebooky
jupyter notebook
```

Po tomto stačí do prehliadača na ľubovoľnom počítači pripojenom na internet zadať adresu <vaša externá statická IP>:8888 a dostanete s k jupyter notebooku.

