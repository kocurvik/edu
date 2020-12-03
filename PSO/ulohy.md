# Malé úlohy na doma 2020/2021

## Bodovanie

Za každú malú úlohu je možné dostať jeden bod. Úlohy budú pribúdať postupne počas semestra, ale odovzdávať sa budú naraz až na konci. Samozrejme môžete si ich dopredu priebežne vypracovávať.

Dohromady je možné za úlohy dostať max. 10 bodov. K bodom za úlohy sa prirátavaju body za aktivitu na cvičeniach. Spolu môžete dostať za aktivitu a malé úlohy max. 15 bodov. Ak teda máte dostatočné množstvo bodov za aktivitu, tak body za úlohy ani nebudete potrebovať.

## Odovzdávanie

TBA

## Úlohy

### mu01 - Vzdialenosť pixelov vo farebnom priestore

Vytvorte skript ktorý načíta obrázok zátišia (zatisie.jpg z cv01.zip), pomocou ginuputu nechá uživateľa vybrať jeden pixel v obrázku a potom zobrazí 2 obrázky na jednom bude vyobrazená Euklidovská vzdialenosť každého pixelu od uživateľom zvoleného pixelu v priestore RGB a na druhom v priestore Lab.

Obrázky s vzdialenosťami vhodne naškálujte. Teda buď od 0 po aktuálnu max vzidalenosť, alebo od 0 po teoreticky maximálnu možú vzialenosť v danom farebnom priestore. Prvý prístup by mal vyzerať asi takto (colormapu môžete využiť aj inú).

![Príklad riešenia](https://raw.githubusercontent.com/kocurvik/edu/master/PSO/supplementary/other/mu01.png)


### mu02 - Rohy obdĺžnikov

Vytvorte skript ktorý načíta obrázok obdĺžnikov (boxes.bmp z cv07.zip) a pomocou metódy hit and miss nájde rohy obdĺžnikov.

Rohy potom vykreslí do pôvodného obrázka červenými hviezdičkami nasledovne:

![Príklad riešenia](https://raw.githubusercontent.com/kocurvik/edu/master/PSO/supplementary/other/mu02.png)


### mu03 - Hranový detektor

Vytvorte funkciu, ktorá bez použitia príkazu edge vráti pre daný obrázok jeho gradientný vektor podľa Prewittovej, alebo Sobelovho operátora. Teda ak je vstup šedotónový obrázok I veľkosti výška x širka, tak výsup bude pole s rozmermi výška x šírka x 2. Kde prvý kanál bude reprezentovať parciálnu deriváciu v x-ovom smere a druhý kanál deriváciu v y-ovom smere.

Signatúra funcie bude G = hrany(I, 'sobel'), alebo G = hrany(I, 'prewitt').

### mu04 - Hranový detektor smery

Vytvorte funkciu, ktorá bez použitia príkazu edge vráti rozdelenie pixelov podľa smeorov hrán do n priečinkov. Filter si môžete vybrať ľubovolný, takisto môžete použiť funkciu z mu03 ak ju budete odovzdávať. Uhol zistíte podľa hodnôt gradientu pomocou trigonomickej funkcie atan2. Každému uhlu potom priradíte hodnotu priečinka (bin) ktoré budú rovnomerne rozdelené. Napríklad pre 4 priečinky to budú rozmedzia v stupňoch: [-45, 45), [45, 135), [135, 225), [225, 315). Pre vstupný šedotónový obrázok s rozmermi výška x šírka a hodnotu n bude výsup matica s rozmermi šírka a výška kde každý element bude v rozmedzí 0 až n-1 a bude označovať zvolený priečinok.

Signatúra funkcie bude L = smery(I, n)

### mu05 - k-means clustering

Naimplementujte funkciu mykmeans(A, k), ktorá bude mať na vstupe maticu A s rozmermi n x m, kde n bude počet vektorov a m dĺžka príznakového vektora a k bude parameter k-means algoritmu. Funkcia vráti vektor dĺžky n v ktorom budú celočíselné hodnoty 1 až k podľa toho v akom klustri vektor skončil. Nezabudnite centroidy inicializovať tak, aby boli v oblastiach kde sa nachádzajú vstupné vektory.

Signatúra funkcie bude l = mykmeans(A, k)
