# Využitie Google Cloudu

Toto je tutorial na využitie Google Cloudu.

## Kredity

TBA

## Upozornenie!

Ak nepoužívate inštancie, tak ich vypínajte! To isté platí o rezervácii statických IP adries!

## Projekt

Ako prvé si budete musieť vytvoriť na Google Cloude účet a následne vytvoriť projekt a pridať k nemu Vaše kódy na kredity k tomuto predmetu.

Túto časť si nepamätám na cviku to snáď spravíme spravíme. 

### Sprístupnenie GPU

Aby sme mohli používať GPU je nutné zvýšiť si tzv. quotu na gpu. To spravíme v časti IAM 

## Jupyter notebook

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

Po tomto stačí do prehliadača na hociakom počítači pripojenom na internet zadať adresu <vaša statická IP>:8888 a dostanete s k jupyter notebooku.

