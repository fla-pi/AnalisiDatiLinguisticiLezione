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

## Variabili nominali (1 variabile x)

# 1.Sintesi dei dati
table(x) #tavola con frequenza assoluta
round(prop.table(table(x))*100, 2) #tavola con proporzioni, arrotondate a 2 cifre

barplot(table(x)) #grafico a barre, frequenza per una variabile
pie(table(x))

# 2. Test
chisq.test(x) #chi squared test per un solo campione 

prob <- c(freq1, freq2, freq3, ecc..) #vettore con frequenza attesa degli elementi (in percentuale a somma 1, deve avere la stessa lunghezza del numero di categorie della variabile)
chisq.test(x, p = prob) #chi squared test per un solo campione, con probabilità personalizzate

## Variabili nominali (2 variabili x e y)

# 1.Sintesi dei dati
table(x,y)#tavola con frequenza assoluta
round(prop.table(table(x, y), margin = 1)*100, 2) #tavola con proporzioni (somma 100 su ogni riga), arrotondate a 2 cifre
round(prop.table(table(x, y), margin = 2)*100, 2) #tavola con proporzioni (somma 100 su ogni colonna), arrotondate a 2 cifre

barplot(table(x,y)) #grafico a barre, le barre rappresentano la frequenza di y e sono divise per valori di x
mosaicplot(table(x,y), color = TRUE) #mosaicplot 

# 2. Test
chisq.test(x,y) #chi squared test 
chisq.test(x,y)$stdres #residui standardizzati del test

chisq.test(x,y, simulate.p.value =  T, B = 2000) #chi squared test con simulazione di Monte Carlo
chisq.test(x,y, simulate.p.value =  T, B = 2000)$stdres #residui standardizzati del test

fisher.test(x,y) # test esatto di fisher (meglio solo per tavole 2x2)


