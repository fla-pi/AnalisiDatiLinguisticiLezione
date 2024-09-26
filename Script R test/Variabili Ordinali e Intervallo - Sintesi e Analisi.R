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

### Sintesi e Analisi dei dati ###

## Variabili ordinali (1 variabile x)

# 1.Sintesi dei dati
median(x) #mediana
IQR(x) #range interquartile

hist(x) #istogramma


# 2. Test
wilcox.test(x, mu = 0) #one sample Wilcoxon signed-rank test. mu è la mediana, e può essere impostata diversamente da 0

## Variabili ordinali (2 variabili x e y)

# 1.Sintesi dei dati

#mediana e range interquartile vanno calcolati distintamente per i due gruppi
median(x)
IQR(x)

median(y)
IQR(y)

# istogrammi sovrapposti delle due variabili, utilizzare i tre comandi successivi uno dopo l'altro
m = max(x,y)
hist(x, xlim=c(0,m), col="red")
hist(y, add=T, col=rgb(0, 1, 0, 0.5) )

# 2. Test di Correlazione
cor.test(x,y, method = "spearman")

# 3. Test per confrontare due gruppi
# per confrontare i rank x per i gruppi di una variabile nominale y
wilcox.test(x ~ y)

# per confrontare due vettori "numerici"
wilcox.test(x,y, paired = TRUE) #specificare paired = TRUE se le misurazioni non sono indipendenti

# kruskal-wallis test
kruskal.test(x ~ y)
