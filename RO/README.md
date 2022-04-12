## Projekty

Projekt sa bude skladať zo 4 častí: výber databázy, výber/redukcia príznakov, klasifikácia dát a vyhodnotenie.

* Možné úlohy/databazy na [kaggle](https://www.kaggle.com/datasets) alebo napr. [tu](http://archive.ics.uci.edu/ml/index.php). Rovnako môžete navrhnúť vlastné datasety, alebo úlohy do diplomiek/na iné predmety. V prípade, že nebudete generovať príznaky samostatne (napr. z obrázkov) tak je nutné aby mala databáza aspoň 10 príznakov a aspoň 500 objektov. Keďže ide o klasifikáciu, tak si rozmyslite čo budete v databáze klasifikovať. Databázy sa budú schvaľovať na cvičeni '''26.4.2022'''.

* Bude sa očakávať, že použijete aspoň jednu metódu na výber (napr. dopredný, spätný) alebo redukciu (napr. PCA, ICA, LSA, LDA, CCA, PLS) príznakov. Ak to bude vhodné skúste použiť aj inú predúpravu príznakov.

* Na klasifikáciu vyskúšate aspoň 2 algoritmy. Napr. SVM, Lineárny klasifikátor, ANN, SOM, Stromy, Bayes, kNN atď. Klasifikáciu otestuje aj bez toho aby ste použili výber/redukciu príznakov.

* Výsledky klasifikácie vyhodnotíte. Nezabudnite na rozdelenie dát na train/val/test. Ako vyhodnotenie môžete uvádzať presnosť v percentách, ROC krivky, matice zámen. Porovnajte použité klasifikátory s aj bez výberu/redukcie príznakov. 

V predbežnom reporte popíšete databázu, zhrniete vlastnosti príznakov, určíte váš cieľ čo na nej chcete klasifikovať a metódy ktoré chcete použiť. Predbežný report je potrebné poslať mailom do '''1.5.2022'''.

Vo finálnom reporte taktiež popíšte databázu, napíšete aké metódy ste použili, prečo ste ich použili a ako ste ich použili. Hlavná časť reportu bude spočívať vo vyhodnotení a porovnaní výsledkov jednotlivých postupov. Report bude taktiež v pdf a bude nutné ho poslať mailom do '''9.5.2022'''.

Prezentácia bude obsahovať rovnaké informácie ako report. Zhodnotíte v nej aj klady a zápory metód ideálne na konkrétnych príkladoch a neformálne závery (ako náročné boli rôzne postupy, kde boli úskalia atď.). Prezentácie sa budú prezentovať na prednáške '''10.5.2022'''. 

## Projects (EN)

The project will contain 4 parts: database selection, selection/reduction of features, classification and evaluation.

* You can select a database on [kaggle](https://www.kaggle.com/datasets) or [here](http://archive.ics.uci.edu/ml/index.php). You can also choose any other dataset or project for your thesis/other classes. In case that you are not generating the features yourself (for example from images) it is necessary for the database to contain at least 500 objects with 10 features. Since this will be a classification task it is necessary to determine what you want to classify. I will personally approve your selected database. The data of the approval is '''26.4.2022'''.

* You have to use at least one selection method (forward/backward) or a reduction method (PCA, ICA, LSA, LDA, CCA, PLS) for features. If possible you should also use some other form of feature preprocessing.

* You have to use at least 2 algorithms for classification (SVM, Linear classifier, ANN, SOM, Forests, Bayes, kNN). Test the classification both with and without feature selection/reduction.

* You have to evaluate all of the selected approaches to classification. Do not forget to split the data into train/val/test. You have to evaluate the classification accuracy using ROC curves, confusion matrices or precision and recall metrics. You have to perform the evaluation for models where you both did and did not apply feature selection/reduction.

In the preliminary report you will have to describe the database and the features it contains. You will have to specify what your goal is and which methods you want to use. The preliminary report deadline is '''1.5.2022'''.

The final report has to include the description of the database and the methods you have used along with an explanation of why you chose the methods and how you applied them. The most important part of the report will be the evaluation where you evaluate all of the approaches you have used. The report has to be a PDF file. The report deadilne is '''9.5.2022'''.

You will also be required to prepare a presentation with the same information as in the report. You should include positives and negatives of your selected approaches. You should evaluate the positives and negatives of the chosen methods. You can also present some informal conclusions (difficulties you had to overcome, what did not work etc.). The presentations will be presented during the lecture '''10.5.2022'''.
