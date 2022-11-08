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
