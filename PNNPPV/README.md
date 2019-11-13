# Neurónové siete pre počítačové videnie

Tú nájdete súbory k predmetu Praktikum z neuronových sietí pre počítačové videnie

[Bodovacia tabuľka](https://docs.google.com/spreadsheets/d/1oGddioqF9-LL4pEr5f0VdXgg_hKkn2rmF_YBNlTihY4/edit?usp=sharing)


## Domáca úloha č 1

Prvá domáca úloha bude spočívať v praktickom testovaní vecí, ktoré sme si práve spomínali. Je rozložená na viaceré časti. Výstupom z úlohy môže byť buď viacero notebookov, alebo python skriptov, ktorými ste spúštali experimenty. Výstupom má byť takisto pdf súbor s výsledkami a grafmi, ktoré budú demonštrovať vaše tvrdenia.

Jadrom domácej úlohy bude trénovanie siete na datasete Cifar-10. Vždy potom budete porovnávať ako rôzne modifikácie siete fungujú voči iným prípadne voči nejakému baselinu. Úloha sa bude skladať z viacerých častí.

### Základný model (1b)

Cieľ je navrhnúť idálne čo najrýchlejší model, ktorý bude dosahovať cca. 70 percentnú presnosť na datasete Cifar-10. Tento model bude slúžiť ako baseline pre ďalšie modifikácie. V rámci modelu použite optimalizátor Adam a aktivácie ReLU. Začiatok modelu by mal pozostávať zo zopár konvolučných a poolingových vrstiev. Na konci by mala byť plne prepojená časť.

V naselujúcich podúlohách je nutné zmeniť vždy nejakú časť modelu a porovnať ich navzájom pomocou grafov, ktoré ukazujú vývoj validačnej presnosti a chyby. Namiesto grafov je možné použiť tabuľku, ale v nej je zmysluplné uvádzať len hodnoty na konci trénovania.

### Aktivácie (3b)

Vyskúšajte vymeniť aktivačné funkcie. Otestujte sigmoid, tanh, ELU a PReLU. LeakyReLU otestujte pre tri rôzne hodnoty parametru alpha (napr. 0.3, 0.1, 0,03). PReLU a LeakyReLU je treba použiť špeciálne podľa [dokumentácie](https://keras.io/layers/advanced-activations/)

### Optimalizácia (6b)

Otestujte trénovanie pomocou optimalizátora Adam, SGD a RMSProp. Pre Adam a RMSProp otestujte 3 rôzne kroky učenia a dve iné nastavenia ostatných parametrov (krok učenia nechajte fixný). Pre SGD otestujte 6 rôznych krokov učenia. Tu je najlepšie vyrobiť graf.

Jednu metódu si vyberte a otestujte pre ňu 4 rôzne veľkosti minibatchov.

### Dropout a Augmentácia (5b)

Otestujte regularizačné metódy pomocou Dropoutu a Augmentácie. Všetko testujte pre dva prípady v jednom použijete bežný split na train/val a v druhom nechajte v trénovacej množine iba prvých 1000 príkladov. Uvedomte si, že počet trénovacích krokov je pre druhý prípad menší použite preto viac epôch, alebo nastavte trénovanie na kroky nie podľa minibatch.

Dropout otestujte tak, že bude najprv len v plne prepojenej vrstve (p = 0.5) a potom aj po konvolučných vrstvách (p = 0.2). Otestujete tiež ďalšie 3 rôzne rozmiestnenie a hodnoty pre Dropout (rôzne p pre konvolučné vrstvy, vynechanie dropout atď.).

Augmentáciu testujte pre 3 rôzne nastavanie pre oba prípady. Môžte byť aj kreatívny, ale malo by to mať aspoň nejaký zmysel.

### Hlboká sieť (5b)

Navrhnite hlbokú (stačí aj úzku, ale nech má aspoň 11 vrstiev) sieť. Otestujte ju najprv bez BatchNorm, reziduálnych alebo dense prepojení, alebo prídavných trenovacích vrstiev. Nakoniec otestujte aspoň dva z týchto prístupov, tak aby ste mali aspoň 4 rôzne modely (tj. rôzne rozmiestnenie týchto prvkov).

Pozn.: Ak chcete testovať reziduálne, alebo dense prepojenia, tak navrhnite sieť tak, aby ich bolo kam dať.

### Najlepší model (3b)

Vytvorte model, ktorý dosiahne najlepší vylsedok, aký len viete. Tieto body sú navyše a nerátajú sa do celkového počtu bodov. Bude sa prihliadať na to aké modely odovzdali ostatní. Model zašlite vo formáte h5 v prílohe spolu s notebookmi a pdfkom. Váš postup pre tvorbu modelu popíšte. Môžete sa inšpirovať internetom, ale nesťahujte ani nepoužívajte predtrénované modely. Ak už sa inšpirijete niečim až príliš, tak aspoň popíšte prečo by práve ten model mal fungovať dobre (tu prosím nepíšte, že preto že blog to tvrdí).

## Hodnotenie

Úloha je relatívne priamočiara, keďže jej cieľ je skôr nadobudnutie skúseností. Problém bude skôr s časom. Pri úlohách si môžete väčšinou vybrať viacere parametre. Preto nevadí ak niektoré z nich budú nezmyselné ako napr. veľmi veľký krok učenia, keďže vedieť co nefunguje je tiež dôležité. Budem však strhávať body ak v nejakej sekcii nebudú skoro žiadne nastavenia, ktoré dávaju zmysel/dobré výsledky. Ideálne by bolo ak by ste sa snažili napr. po prvých troch nastaveniach snažili nájsť to "najlepšie". Súčasťou pdfka, ktoré odovzdáte bude aj komentár, ak sa v ňom vyskytne nejaký nezmysel, tak tiež budem strhávať.

## Odovzdávanie

Úlohu odovzdajte v zipe s notebookmi/skriptami, pdfkom s výsledkami a vašim modelom na mailovú adresu kocurvik@gmail.com Pdfko rozdelte na sekcie ako tu a ideálne aj do podeskcií kde to dáva zmysel. K výsledkom vždy vypíšte komentár ako dopadli.

Deadline je do **6.11. 23:59**. Ak nebudete stíhať, tak pri neskoršom odovzdaní budem strhávať body.


## Domáca úloha č 2 (20b)

Cieľom druhej domácej úlohy bude natrénovať objektový detektor na menšom datasete. 

### Objektový detektor

Prvá časť úlohy bude spočívať v nájdení nejakého objektového dektora založeného na hlbokom učení ideálne z Githubu ako napr. YOLO, RetinaNet, Faster R-CNN, CenterNet (existujú dva rôzne), CornerNet atď. Väčšina z nich existuje aj vo verzii pre keras. Výber detektora mi pre istotu pošlite na schválenie na mail. Posielajte ideálne rovno link na repozitár. Ak však zistíte, že to nejako nejde, tak detektor môžete neskôr zmeniť. Bol by som tiež rád ak by ste nemali všetci rovnaký detektor.

Ako pri minulej úlohe budete aj tento krát odovzdávať pdf súbor. V jeho úvode tak stručne popíšte ako funguje zvolený objektový detektor. Dôležité je popísať základný princíp. Kľudne použite obrázky z publikácie k danému detektoru, alebo odinadiaľ z internetu. Tento text by mal obsahovať odpoveď na otázky:

1. Aká štruktúra umožňuje zistiť pozíciu objektov?
2. Ako táto štruktúra funguje v kontexte tréningu (ako sa počíta loss)?
3. Ako zvolený detektor rieši priradenie viacero bounding boxov tomu istému objektu?
4. Má táto štruktúra problém class imbalance (objektov je málo a pozadia je veľa) a ak áno ako ho rieši?

### Dataset

Trénovať budete na datasete [Stanford Dogs](http://vision.stanford.edu/aditya86/ImageNetDogs/main.html). Tento dataset je dosť malý aby sa s ním ľahko pracovalo, ale má reálne nedostatky a ním je málo príkladov pre niektoré triedy a skutoťnosť, že dataset obsahuje iba určitý typ obrázkov (väčšinou jeden pes v prírodnom pozadí). Detektor tak môže pri inom druhu dát zlyhať. To nás ale trápiť nebude, keďže cieľom tejto úlohy je naučiť sa workflow trénovania objektových detektorov.

#### train/test split

K datasetu si stianite aj train/test split. Je v `.mat` súboroch. Tie v pythone otvoríte napr. pomocou knižnice `scipy` a metódy `scipy.io.loadmat`. Tento split budeme používať na vyhodnotenie presnosti na datasete.

#### Bounding boxy

V anotácii k datasetu sú k dispozícii aj bounding boxy. Asi najdôležitejšíe bude správne tieto dáta parsovať a dostať do trénovacieho procesu. Je na Vás, či si napr. tieto anotácie prekonvertujete skriptom do inej formy, alebo si napíšete vlastný generátor. Tento postup okomentujte v pdf.

### Tréning

Trénovať budete dva modely. Jeden bude detegovať bounding boxy pre rôzne triedy a druhý bude detegovať všetky bounding boxy ako jednu triedu.

Väčšina objektových detektorov má dopredu nastavené približné parametre na trénovanie a taktiež poskytuje predtrénované modely. Tieto kľudne použite, avšak bol by som rád ak by ten model nebol predtrénovaný zrovna na ImageNete (Stanford Dogs sú jeho podmnožina). Vytvorte si validačnú množinu a sledujte ako sa model učí. Ak to kód umožnuje je lepšie sledovat miery ako mAP, alebo AP50 (o nich nižšie). Takisto je fajn použiť redukciu trénovacieho kroku, alebo augmentáciu obrazu. Tieto veci neimplementujte ak niesú v stiahnutej implementácii, ale ak sa Vám chce tak samoszrejme môžete. Priebeh tréningu, spôsob delenia množiny a zvolené parametre taktiež pridajte do pdf.

### Vyhodnotenie

Pre každý model bude nutné vytvoriť vyhodnotenie. Budeme používať najmä [IoU metriku](https://en.wikipedia.org/wiki/Jaccard_index) a miery AP teda average precision, teda počet objektov ktoré sme správne detegovali / počet objektov v testovacej množine zpriemerovaný pre všetky triedy. Tu je samozrejme otázka, čo znamená správna detekcia a práve to určíte IoU metrikou. Napríklad skóre AP50 znamená, precision ak ako true positive berieme bounding box, ktorý má oproti ground truth IoU > 0.5. Často sa taktiež používa miera mAP (mean average precision) čo je priemer pre viacero hodnôt AP teda napr. mAP = (AP05 + AP10 + ... + AP90 + AP95) / 18

Pre model ktorý deteguje iba jednu obecnú triedu pes samozrejme A v AP nedáva až tak zmysel, keďže máme jednu triedu, ale budeme ho používať pre konzistenciu. Vo vyhodnotení vytvorte graf (scatter plot) kde bude vidno jednolivé hodnoty pre rôzne IoU prahy AP. Takisto spočítajte hodnotu mAP ako je definovaná v predchádzajúcom odstavci. 

Pre model ktorý rozlišuje plemená spočítajte AP25, AP50 a AP75. Vytvotre tabuľku (môže byť aj txt súbor) v ktorej bude pre každé plemeno zobrazený počet trénovacích dát a precion pre prahy IoU > 0.25, 0.50 a 0.75. V pdf stačí tabuľka kde budú najzaujímavejšie hodnoty (najlepšie a najhoršie pre každú z troch metrík). Okomentujte či tieto hodnoty súvisia počtom príkladov v trénovacích dátach. 

Môžete samozrejme pridať aj iné vyhodnotenie ako napríklad AP50 pre rôzne veľkosti bounding boxov, ale nieje to potrebné. Výsledky okomentujte. Prekvapilo Vás niečo? Čo ste sa pri tréningu naučili.

### Odovzdávanie

Na mail odovzdajte pdf súbor s popisom modelu, prípravy dát, trénovania a vyhodnotenia. Ak tabuľka s plemenami nebude v pdf, tak ju pridajte ako txt, alebo iný ľahko čítateľný súbor (napr. csv).  Ak ste klonovali cudzie repo, ideálne je pridať do pdf link na Váš fork. Ak nie tak pridajte do zipu relevantný kód.

Deadline na úlohu je **16:30 4.12.2019**. Keďže trénovanie môže trvať relatívne dlho, tak odporúčam začať skôr ako týždeň pred odovzdaním. Trénovať môžete kde chcete, ale odporúčam Google Cloud.
