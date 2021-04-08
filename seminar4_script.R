##### SEMINAR 4 #### 

#### Laste inn data ####

# Setter working directory
getwd()

setwd("~/Desktop")
# Installerer relevante pakker
# install.packages("")

# Har du dem allerede bare last dem inn 
library(tidyverse)
library(stargazer)

# Late inn datasett fra  
# https://raw.githubusercontent.com/louisabo/STV4020A/master/SEMINAR3/internett.csv

data <- read.csv("https://raw.githubusercontent.com/louisabo/STV4020A/master/SEMINAR3/internett.csv")

# Lagre datasett til en ny fil .rda (eller .RData: .rda er en forenklet måte å 
# skrive .RData på)

save(data, file = "data.rda")

rm(data)

load("data.rda")

# Inspiserer datasettet
View(data)
head(data)
tail(data) 
summary(data$internettbruk) 
range(data$internettbruk, na.rm = TRUE)

#### Missing - NA - NOT AVAILBLE ####

# Finne antall missing i hele datasettet
sum(is.na(data)) 

# Finne antall missing på bestemte variabler
sum(is.na(data$internettbruk))
sum(is.na(data$kjonn))

# Summary gir også info om NAs

# Håndtere missing: Sjekk ut hjelpefilen for NA.
?NA

# Håndtere missing: Ulike typer og bruk av subset fra tidyverse
data1 <- data %>%
  drop_na()

# Sjekket at det ble riktig
summary(data)

# Man kan også velge hvilke variabler man vil fjerne missing fra
data1 <- data %>% 
  drop_na(internettbruk) #bruk komma for å legge til flere variabler

# Sjekker at det ble riktig
sum(is.na(data$internettbruk))

#### Statistiske mål ####

# Dere må kunne 
# SD, typetall og mean 

# Rask oversikt over viktige statistiske mål
summary(data)

# Gjennomsnitt
mean(data$alder, na.rm = TRUE)
# Husk på missing!

# Modus/typetall 
library(DescTools)
Mode(data$internettbruk, na.rm = TRUE)

# Forsøk å ta gjennomsnitt med en dikotom variabel/variabel på nominalnivå
mean(data$kjonn, 
     na.rm = TRUE) 

# Standardavvik, gjennomsnittlig avstand fra gjennomsnittet 
sd(data$internettbruk, na.rm = TRUE)

# Varians, standardavviket -- kvadratrot (lagrer i eget objekt)
varians <- var(data$internettbruk, na.rm = TRUE)
varians # Måler spredning men ikke kvadrert 
sqrt(varians) # samme som SD 
sd(data$internettbruk, na.rm = TRUE)

mean(data$internettbruk, na.rm = TRUE)


#### Univariat analyse ####

# Rask oversikt igjen
summary(data)

#### NUMERIC ELLER INTEGER
####  Forholdstallsnivå -- kontinuerlig med nullpunkt 
####  Intervallnivå -- tilfeldig nullpunkt som temperatur eller ¨

#### FACTOR ELLER CHARACHTER 
####  Ordinalnivå -- CHARACHTER ELLER FACTOR
####  Nominalnivå -- CHARACHTER 

# Sjekker målenivået til variablene
install.packages("tibble")
library(tibble)
tibble::tibble(data)

str(data)


# DU KAN ENDRE KLASSE 

data$kjonn_1 <- as.factor(data$kjonn)

# Frekvenstabeller for kategoriske variabler 
table(data$kjonn_1)

# Lagrer tabellen i et objekt, og deretter gjør det om til df
tabell <- table(data$kjonn_1)
tabell1 <- data.frame(tabell)

# Bruker stargazer-pakken til å eksportere tabellen

stargazer(tabell1, 
          type = "text", 
          summary = FALSE) 

stargazer(tabell1, 
          type = "html", # velger hva slags fil jeg vil ha
          summary = FALSE,
          out = "tabell.html") # navn på filen

# Relativ fordeling
tabell2 <- prop.table(table(data$internett))
tabell2

# Grafisk fremstilling av dataene 

# Søylediagram for internettbruk
ggplot(data, aes(internettbruk)) + 
  geom_bar(width = 1)

# Frekvenstabell for alder 
summary(data$alder) # Min er 16 år, og maks er 90 år. Lager så kategorier
data$omkodet_alder <- cut(data$alder, breaks = c(16, 30, 45, 60, 75, 90))
table(data1$omkodet_alder)

# Bruke omkodet_alder i et søylediagram
ggplot(data, aes(omkodet_alder)) + 
  geom_bar(width = 1)

# Historgram for alder
ggplot(data, aes(alder)) + 
  geom_histogram(bins = 20, 
                 color = "white", 
                 fill = "blue") 

# Felles tabell med deskriptiv statistikk
stargazer(data, 
          type = "text")


#### Bivariat analyse #### 

## To kateogriske variabler ##

# Krysstabell
krysstabell <- table(data$kjonn, data$internettbruk)
krysstabell
# Tolk tabellen

# Krysstabell med relative tall
prop.table(krysstabell, margin = 1)

# Kjikvadrattesten
# Når p-verdien < 0.05 er det signifikant smh. (mindre)
# Når p-verdien > 0.05 er det ikke signifikant.(større)
chisq.test(krysstabell)

# Presentere sammenhengen grafisk

ggplot(data, aes(x = internettbruk, 
                 fill = as.factor(kjonn))) + 
  geom_bar(position = "dodge") + 
  labs(fill = "kjonn") 

# For relative tall 

ggplot(data, aes(x = internettbruk, 
                 fill = as.factor(kjonn))) + 
  geom_bar(position = "fill") + 
  labs(fill = "kjonn") 


## To kontinuerlige variabler ## 

# Pearsons r for alder og utdanning 
# og alder og utdanning
R <- cor(x = data$alder, 
         y = data$utdanning, 
         use = "pairwise.complete.obs",
         method = "pearson")
R

# Korrelasjonsmatrise
data <- read.csv("https://raw.githubusercontent.com/louisabo/STV4020A/master/SEMINAR3/internett.csv")

cor(data, 
    use = "pairwise.complete.obs") # variablene må være numeriske/integer.

# DU KAN VISUALISERE SAMMENHENGEN VHA GGPLOT

# Spredningsplott
ggplot(data, aes(alder, utdanning)) + 
  geom_point() + 
  labs(title=
         "Sammenhengen mellom alder og utdanning")

# Spredningsplott som viser kjønn

ggplot(data, aes(alder, utdanning, 
                 color = as.factor(kjonn))) + 
                 geom_point() + 
                labs(title= "Sammenhengen mellom alder og utdanning")

# Plott med linje
ggplot(data, aes(alder, utdanning)) +
  geom_smooth(method = "lm")+
  labs(title= "Sammenhengen mellom alder og utdanning")

# Plott med linje og punktestimater 

ggplot(data, aes(alder, utdanning)) + 
  geom_point() + 
  geom_smooth(method = "lm") + 
  labs(title= "Sammenhengen mellom alder og utdanning")


### EKSTRAOPPGAVER ##


## Lag plott med rett linje som beskriver sammenhengen mellom 
## følgende variable -- mål også korrelasjonen med pearson R
# 1) Utdanning og internettbruk 
# 2) Alder og utdanning 
# 3) Utdanning og tillit 
# 4) Tillit og alder 
# 5) Internettbruk og tillit 
# Hvilken vei peker linjen når det er negativ smh og hvilken vei peker pilen
# når det er positiv smh?