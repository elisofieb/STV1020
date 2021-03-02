###### Seminar 1: Fasit ######

### Oppgave 1 ###


# Lager variabler #
navn <- c("Arne", "Geir", "Hans", "Kleopatra", "Mari", "Gunnar", "Kalle")
alder <- c(60, 45, 19, 19, 22, 87, 92)
by <- c("Skien", "Karasjok", "Kongsberg", "Fredrikstad", "Dale", "Stokke", "Trondhjem")
favorittfilm <- c("Up!", "Love Actually", "Ringenes Herre: To Tårn", "Inception", "Parasite", "Legally Blonde", 
           "Interstellar" )

# Setter sammen variablene til datasettet #
df <- data.frame(navn, alder, by, favorittfilm)


### Oppgave 2 ###

# Finner gjennomsnittet #

mean(df$alder)

# Finner standardavviket # 
sd(df$alder)

# Finner medianen #
median(df$alder)


### Oppgave 3 ###

# Lager variable for avstand til Oslo # 
avstand <- c(40, 500, 30, 60, 40, 30, 400) 

# Legger til variabelen til datasettet med cbind-funksjonen) #
df <- cbind(df, avstand) 

# Først skriver vi datasettet, og så variabelen vi vil legge til, det er viktig
# at verdiene har samme posisjon som kolonnen (personen) de hører til. Skien er
# den første verdien, hvis Skien er 60km fra Oslo må 60 være den første verdien
# i tallrekken. 


### Oppgave 4 ### 

# Bruker table-funksjonen til å lage en krysstabell #
table(df$navn, df$avstand)


### Oppgave 5 ### 

# Bruker geom_bar til å lage en barplot # 

ggplot(df, aes(alder)) + geom_bar()
