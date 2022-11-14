# Hlboké Učenie pre Počítačové Videnie-2-AIN-226/22

## Obsah

* lectures - pdf z prednášok
* notebooks - notebooky na cvičenia Google Colab
* supplementary - rôzne materiály na stiahnutie a obrázky do notebookov
* gcloud - skripty a iné materiály pre cvičenia na Google Cloude

## Výuka

* Prednášky - utorky 14:50 online
* Cvičenia - utorky 18:10 online

Online výuka prebieha na MS Teams v [týme pre predmet](https://teams.microsoft.com/l/team/19%3aOHh4FI6NDQUNF-g_rYSJpEo4l8NjYm6A8tGEpFP0iVo1%40thread.tacv2/conversations?groupId=d7697f9b-f158-471a-a65d-4776633ec7d9&tenantId=ce31478d-6e7a-4ce7-8670-a5b9d51884f9). Je možné že v priebehu semestra sa presunieme z online výuky na prezenčnú. Takéto zmeny budú podliehať dohode so študentmi.

## Bodovanie

Bodovanie je rozdelené na dve časti: praktická časť a skúška. Dohromady je možné získať 100 bodov.

* V praktickej časti je možné získať 30+ bodov za domáce úlohy z cvičení a 40 bodov za projekt. Je možné dohodnúť si rôzne druhy projektov a body sa budú odelovať s prihliadnutím na obtiažnosť. Do finálnej známky sa z cvičení počíta maximálne 60 bodov. Na absolvovanie predmetu je za túto časť nutné získať aspoň 30 bodov.
* Za skúšku je možné získať 40 bodov. 10 bodov je možné získať za písomnú časť, 30 bodov je možné získať za ústnu odpoveď v troch vylosovaných témach.

Projekty sa budú hodnotiť po finálnej prezentácii. Keďže v deep learningu sa projekt niekedy nedá uponáhľať, tak bude možné projekty prezentovať aj na termíne ku koncu skúškového obdobia. Z tohto dôvodu je možné ísť na skúšku ešte pred udelením bodov za projekt.

Finálna známka bude určená až po absolvovaní skúšky a prezentácie projektu. V prípade, že študent/ka bude mať aspoň 30 bodov za domáce úlohy, tak môže dostať známku aj bez prezentácie finálneho projektu (dufáme však, že aj v takom prípade urobí aspoň menší projekt).

# Domáce úlohy

# Domáca úloha č.1

Prvá domáca úloha bude spočívať v praktickom testovaní vecí, ktoré sme si práve spomínali. Je rozložená na viaceré časti. Výstupom z úlohy môže byť buď viacero notebookov, alebo python skriptov, ktorými ste spúštali experimenty. Výstupom má byť takisto pdf súbor s výsledkami a grafmi, ktoré budú demonštrovať vaše tvrdenia.

Jadrom domácej úlohy bude trénovanie siete na datasete Cifar-10. Vždy potom budete porovnávať ako rôzne modifikácie siete fungujú voči iným prípadne voči nejakému baselinu. Úloha sa bude skladať z viacerých častí.

*Pozn.:*  Úlohu môžete riešiť aj v Kerase.

### Základný model (1b)

Cieľ je navrhnúť idálne čo najrýchlejší model, ktorý bude dosahovať cca. 70 percentnú presnosť na datasete Cifar-10. Tento model bude slúžiť ako baseline pre ďalšie modifikácie. V rámci modelu použite optimalizátor Adam a aktivácie ReLU. Začiatok modelu by mal pozostávať zo zopár konvolučných a poolingových vrstiev. Na konci by mala byť plne prepojená časť.

V naselujúcich podúlohách je nutné zmeniť vždy nejakú časť modelu a porovnať ich navzájom pomocou grafov, ktoré ukazujú vývoj validačnej presnosti a chyby. Namiesto grafov je možné použiť tabuľku, ale v nej je zmysluplné uvádzať len hodnoty na konci trénovania.

### Aktivácie (3b)

Vyskúšajte vymeniť aktivačné funkcie. Otestujte tri z nasledovných aktivačných funkcií sigmoid, tanh, ELU, LeakyReLU a PReLU. LeakyReLU môžete otestovať aj pre rôzne hodnoty parametru alpha (napr. 0.3, 0.1, 0,03). 

### Optimalizácia (6b)

Otestujte trénovanie pomocou optimalizátorov Adam, SGD alebo RMSProp. Spustite aspoň 4 rôzne konfigurácie (rôzne kroky, rôzne alpha, beta atď). Pre túto úlohu je vhodné využiť v pdfku grafy. 

Jednu metódu si vyberte a otestujte pre ňu navyše ďalšie tri veľkosti minibatchov.

### Dropout a Augmentácia (6b)

Dropout otestujte tak, že bude najprv len v plne prepojenej vrstve (p = 0.5) a potom aj po konvolučných vrstvách (p = 0.2). A ešte jednu možnosť navyše. Pri použití v konvolučných vrstvách nezabudnite, že treba použiť Dropout2d namiesto Dropout1d.

Augmentáciu testujte pre 3 rôzne nastavania. Môžte byť aj kreatívny, ale malo by to mať aspoň nejaký zmysel. Dokumentáciu nájdete [tu](https://pytorch.org/vision/stable/transforms.html). Dávajte si pritom pozor aby ste to spravili správne.

Obe veci testujte pre dva prípady v jednom použijete bežný split na train/val a v druhom nechajte v trénovacej množine iba prvých 1000 príkladov. Uvedomte si, že počet trénovacích krokov je pre druhý prípad menší použite preto úmerne viac epôch.

### Hlboká sieť (5b)

Navrhnite hlbokú (stačí aj úzku, ale nech má aspoň 11 vrstiev) sieť. Otestujte ju najprv bez BatchNorm, reziduálnych alebo dense prepojení, alebo prídavných trenovacích vrstiev. Nakoniec otestujte aspoň dva z týchto prístupov, tak aby ste mali aspoň 3 rôzne modely (tj. rôzne rozmiestnenie týchto prvkov).

Pozn.: Ak chcete testovať reziduálne, alebo dense prepojenia, tak navrhnite sieť tak, aby ich bolo kam dať.

### Najlepší model (3b)

Vytvorte model, ktorý dosiahne najlepší vylsedok, aký len viete. Tieto body sú navyše a nerátajú sa do celkového počtu bodov. Bude sa prihliadať na to aké modely odovzdali ostatní. Model zašlite vo formáte ako .pth torchovský state dict spolu s jedným skriptom, ktorý model načíta a spočíta presnosť na testovacej množine Cifar-10. Váš postup pre tvorbu modelu popíšte. Môžete sa inšpirovať internetom, ale nesťahujte ani nepoužívajte predtrénované modely. Ak už sa inšpirijete niečim až príliš, tak aspoň popíšte prečo by práve ten model mal fungovať dobre (tu prosím nepíšte, že preto že blog to tvrdí).

## Hodnotenie

Úloha je relatívne priamočiara, keďže jej cieľ je skôr nadobudnutie skúseností. Problém bude skôr s časom. Pri úlohách si môžete väčšinou vybrať viacere parametre. Preto nevadí ak niektoré z nich budú nezmyselné ako napr. veľmi veľký krok učenia, keďže vedieť co nefunguje je tiež dôležité. Budem však strhávať body ak v nejakej sekcii nebudú skoro žiadne nastavenia, ktoré dávaju zmysel/dobré výsledky. Ideálne by bolo ak by ste sa snažili napr. po prvých troch nastaveniach snažili nájsť to "najlepšie". Súčasťou pdfka, ktoré odovzdáte bude aj komentár, ak sa v ňom vyskytne nejaký nezmysel, tak tiež budem strhávať.

## Odovzdávanie

Úlohu odovzdajte v zipe s notebookmi/skriptami, pdfkom s výsledkami a vašim modelom na mailovú adresu kocurvik@gmail.com Pdfko rozdelte na sekcie ako tu a ideálne aj do podeskcií kde to dáva zmysel. K výsledkom vždy vypíšte komentár ako dopadli.

Deadline je do **9.11. 23:59**. Pri neskoršom odovzdaní budem strhávať body. Poznámka - zjavne sa neuploadol upravený notebook na Github, preto tam ostal dátum 12.11. Budem teda akceptovať tento termín ako deadline na odovzdanie!


# Domáca úloha č. 2 (15b)
Cieľom druhej domácej úlohy bude natrénovať objektový detektor na menšom datasete.

## Objektový detektor
Prvá časť úlohy bude spočívať v nájdení nejakého objektového dektora založeného na hlbokom učení ideálne z Githubu ako napr. YOLO, RetinaNet, CenterNet (existujú dva rôzne), CornerNet, FCOS, ATSS atď. Väčšina z nich existuje aj vo verzii pre keras. Výber detektora mi pošlete na schválenie na mail/MS Teams/osobne po cvičení. Posielajte ideálne rovno link na repozitár. Ak však zistíte, že to nejako nejde, tak detektor môžete neskôr zmeniť. Bol by som tiež rád ak by ste nemali všetci rovnaký detektor.

Ako pri minulej úlohe budete aj tento krát odovzdávať pdf súbor. V jeho úvode tak stručne popíšte ako funguje zvolený objektový detektor. Dôležité je popísať základný princíp. Kľudne použite obrázky z publikácie k danému detektoru, alebo odinadiaľ z internetu. Tento text by mal obsahovať odpoveď na otázky:

Aká štruktúra umožňuje zistiť pozíciu objektov?
Ako táto štruktúra funguje v kontexte tréningu (ako sa počíta loss)?
Ako zvolený detektor rieši priradenie viacero bounding boxov tomu istému objektu?
Má táto štruktúra problém class imbalance (objektov je málo a pozadia je veľa) a ak áno ako ho rieši?

## Dataset
Trénovať budete na datasete [Stanford Dogs](http://vision.stanford.edu/aditya86/ImageNetDogs/main.html). Tento dataset je dosť malý aby sa s ním ľahko pracovalo, ale má reálne nedostatky a ním je málo príkladov pre niektoré triedy a skutoťnosť, že dataset obsahuje iba určitý typ obrázkov (väčšinou jeden pes v prírodnom pozadí). Detektor tak môže pri inom druhu dát zlyhať. To nás ale trápiť nebude, keďže cieľom tejto úlohy je naučiť sa workflow trénovania objektových detektorov.

### train/test split
K datasetu si stianite aj train/test split. Je v .mat súboroch. Tie v pythone otvoríte napr. pomocou knižnice scipy a metódy scipy.io.loadmat. Tento split budeme používať na vyhodnotenie presnosti na datasete.

### Bounding boxy
V anotácii k datasetu sú k dispozícii aj bounding boxy. Asi najdôležitejšíe bude správne tieto dáta parsovať a dostať do trénovacieho procesu. Je na Vás, či si napr. tieto anotácie prekonvertujete skriptom do inej formy, alebo si napíšete vlastný generátor. Tento postup okomentujte v pdf.

### Alternatíva k datasetu

Ak sa vám v rámci iného projektu, alebo záverečnej práce hodí natrénovať objektový detektor na inom datasete, tak si túto úlohu môžete so mnou prekonzultovať a celú ju spraviť na vami zvolenom datasete. Musím ho však najprv odsúhlasiť.

## Tréning

Trénovať budete jeden model, ktorý bude detegovať bounding boxy pre rôzne triedy (každé plemeno je iná trieda). Väčšina objektových detektorov má dopredu nastavené približné parametre na trénovanie a taktiež poskytuje predtrénované modely. Tieto kľudne použite, napríklad ak bol backbone predtrénovaný na Imagenete, tak asi skonverguje dosť rýchlo, keďže v ňom je veľmi veľa obrázkov práve psov. Vytvorte si validačnú množinu a sledujte ako sa model učí. Ak to kód umožnuje je lepšie sledovat miery ako mAP, alebo AP50 (o nich nižšie). Takisto je fajn použiť postupnú redukciu trénovacieho kroku, alebo augmentáciu obrazu. Tieto veci neimplementujte ak niesú v stiahnutej implementácii, ale ak sa Vám chce tak samoszrejme môžete. Priebeh tréningu, spôsob delenia množiny a zvolené parametre taktiež pridajte do pdf. 

## Vyhodnotenie

Pre natrénovaný model bude nutné vytvoriť vyhodnotenie. Budeme používať najmä [IoU metriku](https://en.wikipedia.org/wiki/Jaccard_index) a miery AP teda average precision, teda počet objektov ktoré sme správne detegovali / počet objektov v testovacej množine zpriemerovaný pre všetky triedy. Tu je samozrejme otázka, čo znamená správna detekcia a práve to určíte IoU metrikou. Napríklad skóre AP50 znamená, precision ak ako true positive (správne detegovaný) berieme bounding box, ktorý má oproti ground truth IoU > 0.5. Často sa taktiež používa miera mAP (mean average precision) čo je priemer pre viacero hodnôt AP teda napr. mAP = (AP05 + AP10 + ... + AP90 + AP95) / 18.

*Pozn.:* Average precision sa často počíta pre nejakú hodnotu recallu. V našej definícii to však tak nie je. Nás bude zaujímať len hranica pre IoU metriku. Toto je tiež známe ako MS COCO mAP. Viac si o rozdieloch vo výpočtoch AP môžete prečítať prečítať [napr. tu.](https://jonathan-hui.medium.com/map-mean-average-precision-for-object-detection-45c121a31173). Je samozrejme možné, že použijete repozitár, kde už bude naimplementovaný iný druh výpočtu pre mAP (napr. VOC). V takom prípade musíte do reportu presne popísať ako tento výpočet prebiehal.


## Odovzdávanie
Na mail odovzdajte pdf súbor s popisom modelu, prípravy dát, trénovania a vyhodnotenia. Ak tabuľka s plemenami nebude v pdf, tak ju pridajte ako txt, alebo iný ľahko čítateľný súbor (napr. csv). Ak ste klonovali cudzie repo, ideálne je pridať do pdf link na Váš fork. Ak nie tak pridajte do zipu relevantný kód.

## Hodnotenie
V hodnotení nebude priamo zohľadnené to aké výsledky váš model dosiahol, ale skôr postup trénovanie. Ak však napríklad nebudete stíhať, stačí ak natrénujete model, ktorý aspoň trocha funguje po pár epochách a spravíte aj vyhodnotenie. Časť bodov získate aj za popis toho samotný objektový detektor funguje. Preto sa vám oplatí nejaký si vybrať a popísať ho, ak vám napríklad stačí menej bodov.


Deadline na celú úlohu je 11.12.2021 23:59. Keďže trénovanie môže trvať relatívne dlho, tak odporúčam začať skôr ako týždeň pred odovzdaním. Trénovať môžete kde chcete, ale odporúčam skúsiť Google Cloud.
