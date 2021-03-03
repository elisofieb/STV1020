###### SEMINAR 1 ######

### PLAN FOR SEMINARET ### 

# 1. Introduksjon til R
# 2. R, RStudio, og syntax-feil
# 3. Objekter, funksjoner, og klasser
# 4. Dataframes
# 5. Visualisering


### 1. Introduksjon til R ### 

# Først kan vi prøve å kjøre en kode med noe enkel matte! For å kjøre koden 
# setter dere musen ved siden av, og trykker ctrl+enter.

100/2+4


### 2. R, RStudio, og syntax-feil ### 

mean(,4+3))


### 3. Objekter, funksjoner, og klasser ###

# Objekter #

# I første omgang kan vi prøve å lage en vektor. Dette er et objekt som 
# inneholder flere elementer, f.eks. tall av samme klasse. 

# La oss først prøve å lage en med et tall. For å gjøre dette må vi først velge 
# et navn, så bruke det som heter en "assigner", og så skrive hva den skal 
# inneholde. Her lager jeg en vektor som heter "to" og som inneholder tallet 2. 

to <- 2

# <- er assigneren. Den sier bare at det som kommer på venstresiden skal lagres
# med navnet som er på høyresiden. Kjører dere koden vil dere se i environnment 
# at det kommer en linje hvor det står "to 2", dette betyr at vi har laget en
# variabel med navnet "to" som inneholder verdien 2. 

# Vi kan f.eks bruke objektet vi har laget til litt enkel matte:

2 + to 

# Her får vi resultatet fire, ettersom R nå leser to som 2.

# Det fine med objekter er at de kan inneholde veldig mye informasjon! 
# I første omgang kan vi prøve å lagre flere tall. Det er flere måter vi kan 
# gjøre dette på, f.eks. kan vi skrive 1:10 for å få alle heltallene mellom 1 og 
# 10, eller skrive c(1,22,5,2,1) for å lage en rekke tall. I det siste skiller 
# jeg tallene med komma. 

tall <- 1:10
flere_tall <- c(1,4,56,8,4,2,4)

# Du kan gi objektene akkurat de navnene du vil, men man kan ikke ha mellomrom 
# i navnene eller tall som første tegn, og det er god kutyme å unnåæ/ø/å 
# generelt i script.

# Funksjoner # 

# Nå som vi har et script med flere elementer kan vi prøve å kjøre noen 
# funksjoner på dem. Funksjoner er også objekter, men det blir først interessant 
# når man holder på med litt mer avansert kode. 

# La oss se om vi kan finne gjennomsnittet av disse vektorene. 

mean(tall)
mean(flere_tall)

#La oss si at vi vil ha element nr. 5 i vektoren flere_tall

tall[5] 

# Når vi kjører denne ser vi at vi får ut tallet 5,og dette kan vi jo også 
# sjekke i environment for å se at stemmer at dette er det femte tallet i 
# vektoren. 

# På samme måte som vi definerte en rekke med tall tidligere, kan vi også bruke 
# dette for å få ut en rekke med elementer. 

flere_tall[3:6]
flere_tall[c(3,5,1,6)]

# Vi kan også finne gjennomsnittet av kun disse tallene: 

mean(flere_tall[c(3,5,1,6)])

# Eller vi kan bruke disse som en ny vektor:

ny_vektor <- flere_tall[c(3,5,1,6)]


# Klasser # 

# For å sjekke om noe er numeric kan vi bruke funksjonen is.numeric():

is.numeric(tall)

# Her ser vi at vi får opp "TRUE" som betyr at "tall" er et numerisk objekt. 

# Når vi vil skrive tekst, bruker vi klassen character og tekst må alltid ha
# " " rundt seg. 

tekst <- "Jeg elsker R! <3"
is.character(tekst)

# Klassen character kan inneholde tekst, men vil f.eks. ikke kunne brukes til 
# matte. 

mean(tekst)

# Her ser dere at vi får en feilmelding, som sier at argumentet ikke er
# numerisk eller logisk. Funksjonen gir oss derfor resultatet NA, som
# betyr missing, altså at det ikke eksisterer et resultat. 

# Vi kan også kreve at et objekt skal ha en viss klasse. Det gjør vi med
# as."klassenavn". Det kan føre til noen uforventede resultater. Si hvis gjør
# flere_tall om til character. 

flere_tall <- as.character(flere_tall)
mean(flere_tall)

# Den siste klassen vi kommer til å bruke mye er factor. 

skolenivaer <- factor(c("Barneskole", "Ungdomskole", "Videregaende", 
                        "Videregaende", "Ungdomskole"),
                      levels = c("Barneskole", "Ungdomskole", "Videregaende"))

# Her kan vi se at vi først definerer de forskjellige verdiene som er i variabelen
# Så skriver vi hvilke nivåer den kan ha, i den rekkefølgen vi ønsker dem. 

# Om vi ikke hadde definert nivåene ville R gjort det automatisk i alfabetisk
# rekkefølge. 

# Nå kan vi se hva som er i variabelen, ved å bare kjøre navnet til variabelen: 

skolenivaer


# Vi kan også lage et objekt som inneholder både tekst og tall:

tekst_tall <- c(1,4,0,4, "matte", "R", "seminarer")

# Så kan vi bruke class-funksjonen  for å se hvilken klasse dette nye 
# objektet har: 

class(tekst_tall)


### 4. Dataframes ###


navn <- c("Emma", "Leo", "Thea", "Kim", "Mari", "Bhavna", "Emil")
alder <- c(60, 45, 19, 19, NA, 87, 92)
fylke <- c("Vestland", "Troms og Finnmark", "Agder", NA, "Trøndelag", "Viken", 
           "Viken" )
by <- c("Bergen", "Karasjok", "Arendal", NA, "Trondheim", "Halden", "Fredrikstad")

# Her lager jeg først et sett med vektorer, med litt forskjellig informasjon.
# I environnment kan dere se at alle har en lengde på 7.
# Dette kan vi også sjekke med length-funksjonen: 

length(navn)

#For å lage en data.frame kan vi bruke funksjonen as.data.frame()

personer <- data.frame(navn, alder, fylke, by)


# Før har vi kun skrevet navnet på vektoren. Nå som vi har det i en dataframe, må vi først
# velge denne, og så kolonnen. Det er to måter vi kan gjøre dette på:

# Med klammeparanteser kan vi velge rad og kolonne. Raden kommer først, og så 
# kolonnen: 
personer[2,1]

# Lar vi en plass være tom får vi enten alle kolonnene eller alle radene til en 
# bestemt rad eller kolonne. 

personer[,2] 
personer[2,]

# En mer vanlig måte å hente ut kolonner på er med '$'. Da skriver man først 
# navnet på datarammen, og så variabelen: 

personer$alder # Her får man verdiene til alle aldrene i datarammen. 

# Vi kan bruke matematiske formler her på samme måte som tidligere, f.eks. 
# for å finne alders gjennomsnittet i datarammen: 

mean(personer$alder) # Her får vi NA?

mean(personer$alder, na.rm = TRUE) # Her får man svaret 52.5 istedet.

# na.rm betyr NA remove, og når vi setter den til TRUE ber R om å fjerne NA i 
# variabelen når den regner ut gjennomsnittet. 


# For å finne medianen: 

median(personer$Alder, na.rm = TRUE)

# En lettere måte å få ut alle disse deskriptive verdiene er  å bruke 
# summary()-funksjonen. 
# Da trenger vi heller ikke bruke na.rm, fordi den heller sier hvor mange NA 
# det er i vektoren

summary(personer$alder)

### 5. Visualisering ### 

# For å installere en pakke bruker vi funksjonen install.packages, og skriver 
# navnet på pakken i parantesene med hermetegn: 

install.packages("tidyverse")

#For å hente inn pakken bruker vi funksjonen library(): 

library(tidyverse)

#For å lage en figur starter vi alltid med å definere datasettet, og kan velge
# å definere variabler

# Første argument er navnet på datasettet, så skriver man aes() som står for
# aesthetic. Der kan man skrive navnet på variabelen man vil se på. Jeg skriver 
# også en + fordi jeg skal legge til mer på neste linje. Så velger jeg hva slags 
# type plott jeg vil ha, denne gangen et histogram

ggplot(data = personer, aes((x = alder))) + 
  geom_histogram() 

