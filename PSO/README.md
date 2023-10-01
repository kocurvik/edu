# Pokročilé Spracovanie Obrazu - Advanced Image Processing

## TERMÍN PREDNÁŠKY - LECTURE TIME SLOT

* streda 13:10 , M - VIII

## TERMÍNY CVIČENÍ - LABS TIME SLOT

* utorok 16:30 , F1-248


## PREDNÁŠKY - LECTURES

You can find the lectures on the website of [Zuzana Černeková](http://sccg.sk/~cernekova/lectures.html)


## CVIČENIA - LABS
### Points

[Table with points](https://docs.google.com/spreadsheets/d/1HX8snZt7RKt2jL3FsLWYoQ04Q5D9IaF4c6Os51pv2eE/edit?usp=sharing)

### Point System
SK:
| | | |
|-|-|-|
| veľké úlohy (2x7,5 boda) | 15 bodov |
| aktivita na cviečeniach + malé úlohy (max 10 bodov) | 15 bodov |
| projekt | 20 bodov |
| spolu | 50 bodov |
| minimum potrebné na pustenie ku skúške | 30 bodov |


EN:
| | | |
|-|-|-|
| homework (2x7,5 pts) | 15 pts |
| labs + small exercises | 15 pts |
| project | 20 pts |
| total | 50 pts |
| required minimum | 30 pts |


### Cvičenia - súbory

* Preztentácie (staré aj nové) s materiálmi sú tu na GitHube 

### Úlohy - Homework

**TBA**

### Projekty (SK)
Príklad tém: segmentácia ruky, spočítanie hodnoty mincí na stole, detekcia hodu hracej kocky, spočítanie kníh na poličke,

Samozrejme môžete si vymzslieť aj vlastnú tému. Tú však treba schváliť.

#### Požiadavky

Výstupom projektu bude najmä prezentácia, ktorá sa uskutoční na poslednom cvičení a kód/demo vášho algoritmu. 

V rámci projektu sa očakáva, že:
* naštudujete relevantnú literatúru (nemusí ísť len o vedecké publikácie)
* navrhnete minimálne dva rozdielne algoritmy na riešenie úlohy
* vyberiete z nich aspoň dva a tie otestujete voči ground truth nejakou metrikou (pri segmentácii napr. IoU, alebo aj mAP)
* ak má zvolený algoritmus nejaké parametre, tak ho otestujete pre viacero parametrov, a výsledky vyhodnotíte
* vytvoríte demo, ktoré bude riešiť zadanú úlohu
* odovzdáte aj kód a iné časti projektu
* odprezentujete projekt na poslednom cvičení (10 min. prezentácia + 5 min. otázky)

V úvode prezentácie popíšte a ukážte použitý dataset. Ak nemáte v datasete ground truth, tak ju skúste vytvoriť. Napr. pri segmentácii stačí pre 10-20 obrázkov z datasetu vytvoriť ručne masky segmentovaných objektov. Ideálne je pritom pokúsiť sa zachytiť čo najrôznejšie situácie. Vo výsledkoch môžete potom zobraziť ako algoritmus funguje aj na obrázky pre ktoré nemáte ground truth. 

V prezentácii môžete prezentovať aj neúspešné pokusy. Ak je napríklad metóda úplne nevyhovujúca na prvý pohľad, tak môžete pridať obrázok s krátkym popisom metódy. Prípadne ak ste metódu postupne vylepšovali, tak môžete v prezentácii ukázať postupné vylepšenia ktoré ste pre zvolenú metódu robili a to ako ovplinili výstup metódy.

Pri prezentovaní výsledkov buďte jednoznačný v tom čo jednotlivé čísla znamenajú. Je taktiež nutné aby všetci členovia skupiny rozumeli, tomu čo sa práve prezentuje! Ak bude zjavné, že jeden člen skupiny sa absolutne neorientuje v nejakej časti prezentácie, môže prísť o body. Ideálne by mal každý člen prezentovať aspoň časť projektu.

Najčastejšia otázka po prezentácii býva: "Na prednáške/cvičení sme robili X. Prečo ste nespravili to?". Pripravte sa na ňu.


### Projects (EN)

Example topics: hand segmentation, counting the value of coins on a desk, dice roll counting, counting books on a shelf,

You can also come up with your own topic which will need to be approved.

#### Requirements

The main output of the project is a presentation, which will take place during the last lab session and a code/demo for your project.

It is expected that the work on project will include:
* study of relevant literature (blogs/turorials online are sufficient)
* you will propose at least 2 different algorithms to solve the problem
* you will implement and test at least two of the algorithms
* testing will be done with respect to the ground truth using a relevant metric (e.g. IoU or mAP for object segmentation, accuracy etc.)
* if an algorithm has parameters you are expected to test the algorithms with different parameters
* you will create a demo which demonstrates a solution of the problem
* you will submit the presentation, demo and files for the project
* you will give a presentation during the last lab session (10 min. + 5 min. questions)

At the start of the presentation you will showcase the used dataset. If the dataset does not contain ground truth you will be expected to create it. For example for segmentation tasks 10-20 images have to be manually labeled. Ideally, the data will cover different aspects of the problem. In the results section you can also include examples on how the algorithm works for unlabeled data.

You are encouraged to include unsucessful attempts at solving a problem, but please keep this part short and concise. If you iteratively improved your method you can also showcase how your approach has evolved and how various improvements and decisions affected the results.

Make sure to be very precise when presenting quantitative results. It is necessary to be clear about what your target metrics are and what to they mean. It is also necessary for every memeber of the group to fully understand everything in the presentation. If a member of a group obviously does not know what is going or is confused as to what is in the presentation then some points can be deduced for the member of the group. Ideally, everyone should present at least a part of the project.

Be prepared to answer any questions related to your approach. Not every member needs to know specifics of everything, but at least a general idea is necessary. One of the most common questions is "We did X in labs/lecture. Why have you not tried that?".
