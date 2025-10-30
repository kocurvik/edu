# Hlboké Učenie pre Počítačové Videnie-2-AIN-226/22

## Obsah

* lectures - pdf z prednášok
* notebooks - notebooky na cvičenia Google Colab
* supplementary - rôzne materiály na stiahnutie a obrázky do notebookov
* gcloud - skripty a iné materiály pre cvičenia na Google Cloude

## Výuka

* Prednášky - utorok 9:50 F1-247
* Cvičenia - štvrtok 11:30 F1-248
  
## Bodovanie

Bodovanie je rozdelené na dve časti: praktická časť a skúška. Dohromady je možné získať 100 bodov.

* V praktickej časti je možné získať 30+ bodov za domáce úlohy z cvičení a 40 bodov za projekt. Je možné dohodnúť si rôzne druhy projektov a body sa budú odelovať s prihliadnutím na obtiažnosť. Do finálnej známky sa z cvičení počíta maximálne 60 bodov. Na absolvovanie predmetu je za túto časť nutné získať aspoň 30 bodov.
* Za skúšku je možné získať 40 bodov. 20 bodov je možné získať za písomnú časť, 20 bodov je možné získať za ústnu odpoveď v dvoch vylosovaných témach.

Projekty sa budú hodnotiť po finálnej prezentácii. Keďže v deep learningu sa projekt niekedy nedá uponáhľať, tak bude možné projekty prezentovať aj na termíne ku koncu skúškového obdobia. Z tohto dôvodu je možné ísť na skúšku ešte pred udelením bodov za projekt.

Finálna známka bude určená až po absolvovaní skúšky a prezentácie projektu. V prípade, že študent/ka bude mať aspoň 30 bodov za domáce úlohy, tak môže dostať známku aj bez prezentácie finálneho projektu (dufáme však, že aj v takom prípade urobí aspoň menší projekt).

### Bodovacia Tabulka

[link](https://docs.google.com/spreadsheets/d/1oGddioqF9-LL4pEr5f0VdXgg_hKkn2rmF_YBNlTihY4/edit?usp=sharing)

# Domáce úlohy

# Domáca úloha č. 1

Prvá domáca úloha bude spočívať v praktickom testovaní vecí, ktoré sme si práve spomínali. Je rozložená na viaceré časti. Výstupom z úlohy môže byť buď viacero notebookov, alebo python skriptov, ktorými ste spúštali experimenty. Výstupom má byť takisto pdf súbor s výsledkami a grafmi, ktoré budú demonštrovať vaše tvrdenia.

Jadrom domácej úlohy bude trénovanie siete na datasete Cifar-10. Vždy potom budete porovnávať ako rôzne modifikácie siete fungujú voči iným prípadne voči nejakému baselinu. Úloha sa bude skladať z viacerých častí.

*Pozn.:*  Úlohu môžete riešiť aj v Kerase, alebo inom frameworku, ale treba sa najprv dohodnúť so mnou.

### Základný model (1b)

Cieľ je navrhnúť idálne čo najrýchlejší model, ktorý bude dosahovať cca. 70 percentnú presnosť na datasete Cifar-10. Tento model bude slúžiť ako baseline pre ďalšie modifikácie. V rámci modelu použite optimalizátor Adam a aktivácie ReLU. Začiatok modelu by mal pozostávať zo zopár konvolučných a poolingových vrstiev. Na konci by mala byť plne prepojená časť.

V naselujúcich podúlohách je nutné zmeniť vždy nejakú časť modelu a porovnať ich navzájom pomocou grafov, ktoré ukazujú vývoj validačnej presnosti a chyby. Namiesto grafov je možné použiť tabuľku, ale v nej je zmysluplné uvádzať len hodnoty na konci trénovania.

### Aktivácie (3b)

Vyskúšajte vymeniť aktivačné funkcie. Otestujte tri z nasledovných aktivačných funkcií sigmoid, tanh, ELU, LeakyReLU a PReLU. LeakyReLU môžete otestovať aj pre rôzne hodnoty parametru alpha (napr. 0.3, 0.1, 0,03). 

### Optimalizácia (4b)

Otestujte trénovanie pomocou optimalizátorov Adam, SGD alebo RMSProp. Spustite aspoň 4 rôzne konfigurácie (rôzne kroky, rôzne alpha, beta atď). Pre túto úlohu je vhodné využiť v pdfku grafy. 

Jednu metódu si vyberte a otestujte pre ňu navyše ďalšie tri veľkosti minibatchov.

### Dropout a Augmentácia (4b)

Dropout otestujte tak, že bude najprv len v plne prepojenej vrstve (p = 0.5) a potom aj po konvolučných vrstvách (p = 0.2). A ešte jednu možnosť navyše. Pri použití v konvolučných vrstvách nezabudnite, že treba použiť Dropout2d namiesto Dropout1d.

Augmentáciu testujte pre 3 rôzne nastavania. Môžte byť aj kreatívny, ale malo by to mať aspoň nejaký zmysel. Dokumentáciu nájdete [tu](https://pytorch.org/vision/stable/transforms.html). Dávajte si pritom pozor aby ste to spravili správne.

Obe veci testujte pre dva prípady v jednom použijete bežný split na train/val a v druhom nechajte v trénovacej množine iba prvých 1000 príkladov. Uvedomte si, že počet trénovacích krokov je pre druhý prípad menší použite preto úmerne viac epôch.

### Hlboká sieť (3b)

Navrhnite hlbokú (stačí aj úzku, ale nech má aspoň 11 vrstiev) sieť. Otestujte ju najprv bez BatchNorm, reziduálnych alebo dense prepojení, alebo prídavných trenovacích vrstiev. Nakoniec otestujte aspoň dva z týchto prístupov, tak aby ste mali aspoň 3 rôzne modely (tj. rôzne rozmiestnenie týchto prvkov).

Pozn.: Ak chcete testovať reziduálne, alebo dense prepojenia, tak navrhnite sieť tak, aby ich bolo kam dať.

### Najlepší model (3b)

Vytvorte model, ktorý dosiahne najlepší vylsedok, aký len viete. Tieto body sú navyše a nerátajú sa do celkového počtu bodov. Bude sa prihliadať na to aké modely odovzdali ostatní. Model zašlite vo formáte ako .pth torchovský state dict spolu s jedným skriptom, ktorý model načíta a spočíta presnosť na testovacej množine Cifar-10. Váš postup pre tvorbu modelu popíšte. Môžete sa inšpirovať internetom, ale nesťahujte ani nepoužívajte predtrénované modely. Ak už sa inšpirijete niečim až príliš, tak aspoň popíšte prečo by práve ten model mal fungovať dobre (tu prosím nepíšte, že preto lebo to tvrdí nejaký blog).

## Hodnotenie

Úloha je relatívne priamočiara, keďže jej cieľ je skôr nadobudnutie skúseností. Problém bude skôr s časom. Pri úlohách si môžete väčšinou vybrať viacere parametre. Preto nevadí ak niektoré z nich budú nezmyselné ako napr. veľmi veľký krok učenia, keďže vedieť co nefunguje je tiež dôležité. Budem však strhávať body ak v nejakej sekcii nebudú skoro žiadne nastavenia, ktoré dávaju zmysel/dobré výsledky. Ideálne by bolo ak by ste sa snažili napr. po prvých troch nastaveniach snažili nájsť to "najlepšie". Súčasťou pdfka, ktoré odovzdáte bude aj komentár, ak sa v ňom vyskytne nejaký nezmysel, tak tiež budem strhávať.

## Odovzdávanie

Úlohu odovzdajte v zipe s notebookmi/skriptami, pdfkom s výsledkami a vašim modelom na mailovú adresu `kocurvik@gmail.com` Pdfko rozdelte na sekcie ako tu a ideálne aj do podeskcií kde to dáva zmysel. K výsledkom vždy vypíšte komentár ako dopadli.

Úlohu odovzdajte v zipe s notebookmi/skriptami, pdfkom s výsledkami a vašim modelom na mailovú adresu kocurvik@gmail.com Pdfko rozdelte na sekcie ako tu a ideálne aj do podeskcií kde to dáva zmysel. K výsledkom vždy vypíšte komentár ako dopadli.

Deadline je do **21.11.2025 12:00**. Pri neskoršom odovzdaní budem strhávať body.


## Domáca úloha č. 1 (15b) - Alternatíva

Ako alternatívu prvej domácej úlohy je možné jeden z notebookov z cvičení prepísať do iného frameworku. Cieľové frameworky môžu byť napr.JAX, alebo aj niečo iné. Ak máte záujem o túto formu prvej domácej úlohy, tak je nutné tento postup prekonzultovať aspoň týždeň pred deadlinom originálneho zadania.
## Odovzdávanie

# Domáca úloha č. 2 (15b)
Cieľom druhej domácej úlohy bude natrénovať objektový detektor na menšom datasete.

## Objektový detektor
Prvá časť úlohy bude spočívať v nájdení nejakého objektového dektora založeného na hlbokom učení ideálne z Githubu ako napr. YOLO, RetinaNet, CenterNet (existujú dva rôzne), CornerNet, FCOS, ATSS atď. Väčšina z nich existuje aj vo verzii pre keras. Výber detektora mi pošlete na schválenie na mail/MS Teams/osobne po cvičení. Posielajte ideálne rovno link na repozitár. Ak však zistíte, že to nejako nejde, tak detektor môžete neskôr zmeniť. Bol by som tiež rád ak by ste nemali všetci rovnaký detektor.

Ako pri minulej úlohe budete aj tento krát odovzdávať pdf súbor. V jeho úvode tak stručne popíšte ako funguje zvolený objektový detektor. Dôležité je popísať základný princíp. Kľudne použite obrázky z publikácie k danému detektoru, alebo odinadiaľ z internetu. Tento text by mal obsahovať odpoveď na otázky:

* Aká štruktúra umožňuje zistiť pozíciu objektov?
* Ako táto štruktúra funguje v kontexte tréningu (ako sa počíta loss)?
* Ako zvolený detektor rieši priradenie viacero bounding boxov tomu istému objektu?
* Má táto štruktúra problém class imbalance (objektov je málo a pozadia je veľa) a ak áno ako ho rieši?

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
Na mail odovzdajte pdf súbor s popisom modelu, prípravy dát, trénovania a vyhodnotenia. Ak ste klonovali cudzie repo, ideálne je pridať do pdf link na Váš fork. Ak nie tak pridajte do zipu relevantný kód.

## Hodnotenie
V hodnotení nebude priamo zohľadnené to aké výsledky váš model dosiahol, ale skôr postup trénovanie. Ak však napríklad nebudete stíhať, stačí ak natrénujete model, ktorý aspoň trocha funguje po pár epochách a spravíte aj vyhodnotenie. Časť bodov získate aj za popis toho samotný objektový detektor funguje. Preto sa vám oplatí nejaký si vybrať a popísať ho, ak vám napríklad stačí menej bodov.


Deadline na celú úlohu je **TBA**. Keďže trénovanie môže trvať relatívne dlho, tak odporúčam začať skôr ako týždeň pred odovzdaním. Trénovať môžete kde chcete, ale odporúčam skúsiť Google Cloud.


## Domáca úloha č. 3 (5b)

Cieľom tretej úlohy bude preskúmať nejaký etický, alebo spoločenský problém týkajúci sa využitia machine learningu. Tento problém sa nemusí týkať priamo počítačového videnia. Dole sú príklady tém, ktoré som študentom navrhoval pár rokov späť. Tento zoznam môžete brať ako voľnú inšpiráciu. Budem rád ak si vyberiete vlastnú tému. Je povinné schválenie témy aby sme sa vyhli duplicitným témam. Témy mi pošlite mailom a ja ich zapíšem do bodovacej tabuľky.

Príklady tém (zoznam je z roku 2019, niektoré linky nemusia fungovať) - Zoznam slúži na inšpiráciu. Budem rád ak si vyberiete vlastnú tému:
* vizuálna (re-)identifikácia v štátom riadenej represii (napr. diskusia na reddite [1](https://www.reddit.com/r/MachineLearning/comments/dv5axp/n_hikvision_marketed_ml_surveillance_camera_that/),[2](https://www.reddit.com/r/MachineLearning/comments/bvzc7w/d_has_anyone_noticed_a_lot_of_ml_research_into/))
* právne aspekty vlastníckych práv k modelom, datasetom, súkromným dátam a pod. [link](https://www.reddit.com/r/MachineLearning/comments/13zvxe/ip_law_and_machine_learning_who_owns_the_model/)
* nasadenie vizuálnych modelov (napr. UI, alebo [autonómna mobilita](https://www.theguardian.com/technology/shortcuts/2019/mar/13/driverless-cars-racist)) s nedostatočnou reprezentáciou niektorých skupín ľudí
* problémy zberu medicínskych dát napr. [Google a medicínske dáta](https://www.theguardian.com/commentisfree/2019/nov/14/im-the-google-whistleblower-the-medical-data-of-millions-of-americans-is-at-risk)
* kapitalizmus a AI napr. [link](https://a2larm.cz/2017/12/skryta-moc-silicon-valley/), alebo [digitálny feudalizmus](https://www.project-syndicate.org/commentary/platform-economy-digital-feudalism-by-mariana-mazzucato-2019-10).
* [policing AI a bias](https://www.ft.com/content/5753689c-d63e-11e9-a0bd-ab8ec6435630)
* [sexistický bias v Amazon hiring AI](https://www.reuters.com/article/us-amazon-com-jobs-automation-insight/amazon-scraps-secret-ai-recruiting-tool-that-showed-bias-against-women-idUSKCN1MK08G)
* [bias v analýze textu](https://arxiv.org/abs/1805.04508)
* [ImageNet roulette](https://a2larm.cz/2019/10/selfie-aplikace-odhalila-temnou-stranku-umele-inteligence/)
* automatizované generovanie fake news napr. [GPT-2](https://www.theverge.com/2019/11/7/20953040/openai-text-generation-ai-gpt-2-full-model-release-1-5b-parameters)
* [Tay od microsoftu](https://www.theverge.com/2016/3/24/11297050/tay-microsoft-chatbot-racist)
* Autonómne zbrane [link](https://futureoflife.org/open-letter-autonomous-weapons/?cn-reloaded=1), alebo [link](https://warontherocks.com/2019/09/terrorist-groups-artificial-intelligence-and-killer-drones/)

### Podmienky

Témy si záväzne vyberte do **TBA**.

Výstupom úlohy bude prezentácia, ktorú budete prezentovať  **TBA**. Prezentácia by mala byť na 5-10 minút. V jej obshahu uvediete problém, kedy môže nastať a ak už prakticky aj nastal, tak uvedte príklad a popíšte jeho okolnosti a dopady. Ak nie tak uveďte aspon hypotetický príklad. V ďalšej časti uveďte ako je možné detegovať tento problém. Pre 'low level' veci je to napr. postup ako sa zistí, že model je biased. Pre abstraktnejšie celospoločenské problémy je to náročnejšie, každopádne skúste popísať nejaký mechanizmus na detekciu (medzinárodná kontrola, datove audity spoločností, zákony atď.). V nasledujúcej časti popíšte aký môže mať tento problém dopad na spoločnosť na rôznych úrovniach. Popíšte prečo je dopad problematický. V poslednej časti prezentujte možné riešenia problému. Pri riešeniach sa zamerajte na čo najrealistickejšie riešenia, teda nie napr. konverzia spoločenského zriadenia na anarcho-primitivizmus, ktorá by asi problém s AI nemala. Na konci časti s riešeniami spravíte diskusiu, kde uvediete Váš názor na tento problém. Môžete prípadne pripraviť aj nejaké otázky na diskusiu. V slidoch by ste mali na konci uviesť zdroje, ktoré ste si prešli teda aspoň 3, z toho aspoň 2 musia byť serióznejšie (vedecké články, printové a established webové médiá).

Pozn.: Niektoré problémy sú problémami len v kontexte nejakého morálneho systému, alebo ideológie. Ak natrafíte na niečo, čo je prezentované ako problém, ale Vám sa to nezdá, resp. nesúhlasíte s tým, že to problém je, tak to predneste v diskusnej časti. Kľudne sa môže stať, že si vyberiete problém, ktorý ja za problém nepovažujem. Preto ho pri jeho predstavení skúste zasadiť to nejakého kontextu v ktorom problematický je.



