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

#tabella di contingenza (x variabile ordinale)
table(y, x)

round(prop.table(table(y,x), margin = 1)*100, 2) #tabella con proporzioni (somma 100 per riga)

# barplot raggruppato per i valori della variabile y (nominale) e che mostra i valori della  variabile x  (ordinale)
barplot(table(x, y), beside=T)

#mosaicplot (ordinale vs ordinale oppure ordinale vs nominale)
mosaicplot(table(x, y), color = T)

# 2. Test di Correlazione
cor.test(x,y, method = "spearman")

# 3. Test per confrontare due gruppi
# per confrontare i rank x per i gruppi di una variabile nominale y
wilcox.test(x ~ y)

# per confrontare due vettori "numerici"
wilcox.test(x,y, paired = TRUE) #specificare paired = TRUE se le misurazioni non sono indipendenti

# kruskal-wallis test
kruskal.test(x ~ y)
