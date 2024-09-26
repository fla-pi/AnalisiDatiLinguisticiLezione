#############################################################
#                                                           #
# Analisi dei dati linguistici con R e JASP -               #
# dalla sintesi dei dati alla statistica inferenziale       #
#                                                           #
#############################################################

#caricare un dataset (controllare sempre se il separatore nel file (sep) è una virgola o altro)
dataset <- read.table(file.choose(), sep = ",", header = T, stringsAsFactors = T)

# Visualizzare dataset
View(dataset)

# accedere alle colonne del dataset direttamente digitandone il nome
attach(dataset)

# selezionare un sottoset di una variabile in base ai valori di un'altra variabile
x[y=="valorevariabile"]

#testare la distribuzione normale. Se p value < 0.05, non è una distr. normale
shapiro.test(x)

### Sintesi e Analisi dei dati ###

## Variabili ratio (1 variabile x)

# 1.Sintesi dei dati
mean(x) #media
sd(x) #deviazione standard

median(x) #mediana
IQR(x) #range interquartile

hist(x) #istogramma
boxplot(x) #boxplot

# 2. Test
t.test(x, mu = 0) #one sample t-test. mu è la media, e può essere impostata diversamente da 0
wilcox.test(x, mu = 0) #one sample Wilcoxon signed-rank test. mu è la mediana, e può essere impostata diversamente da 0



## Variabili ratio (2 variabili x e y)

# 1.Sintesi dei dati

#media e dev standard vanno calcolati distintamente per i due gruppi
mean(x) #media
sd(x) #deviazione standard

mean(y) #media
sd(x) #deviazione standard

# mediana e range interquartile calcolati distintamente per i due gruppi
median(x)
IQR(x)

median(y)
IQR(y)

# per plot dei valori dix divisi per valor idella variabile nominale y
boxplot(x ~ y)

# 2. Test di Correlazione
cor.test(x,y, method = "pearson") #correlazione di pearson
cor.test(x,y, method = "spearman") #correlazione di spearman
cor.test(x,y, method = "kendall")  #correlazione di kendall

# 3. Test per confrontare due gruppi
t.test(x ~ y) #t-test x = variabile ratio, y = variabile nominale
wilcox.test(x ~ y) #mann whitneytest, se si aggiunge paired = TRUE (per sample non indipendenti) diventa wilcoxon test

aov(x ~ y)# oneway anova
summary(aov(x ~ y)) #riassunto dei risultati del one way anova

kruskal.test(x ~ y) #kruskal-wallis
