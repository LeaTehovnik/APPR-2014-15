# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
#uvoziDruzine <- function() {
#   return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
#                       row.names = 1,
#                       col.names = c("obcina", "en", "dva", "tri", "stiri"),
#                       fileEncoding = "Windows-1250"))
# }

# Zapišimo podatke v razpredelnico druzine.
# cat("Uvažam podatke o družinah...\n")
# druzine <- uvoziDruzine()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.


# 
# uvoziRekorde <- function() {
#   return(read.table("podatki/rekordi.csv", sep = ";", as.is = TRUE,
#                     col.names = c("Čas", "Ime", "Državljanstvo", "Datum", "Kraj", "Spol"),
#                     fileEncoding = "Windows-1250"))
# }
# 
# cat("Uvažam podatke o rekordih...\n")
# rekordi <- uvoziRekorde()

source("lib/xml.r",encoding="UTF-8")

cat("Uvažam podatke o rekordih...\n")
#zaenkrat še zakomentirano
moski <- uvozi.maraton(1)
zenske <- uvozi.maraton(2)
maraton <- rbind(moski, zenske)
maraton$Source <- NULL
maraton$Notes <- NULL
maraton$Spol <- c(rep("M", 49), rep("Z",38))
colnames(maraton) <- c("Čas", "Ime", "Drzavljanstvo", "Datum", "Kraj", "Spol")

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
kraji <- names(table(maraton$Kraj))
maratoni <- gsub(".*, ", "", kraji)
names(maratoni) <- kraji
maratoni["Amsterdam Marathon"] <- "Netherlands"
maratoni[grep("Beppu", maratoni)] <- "Japan"
maratoni["Berlin Marathon"] <- "Germany"
maratoni["Boston Marathon"] <- "United States"
maratoni["Chicago Marathon"] <- "United States"
maratoni["Dülmen"] <- "Germany"
maratoni["Fukuoka Marathon"] <- "Japan"
maratoni["London"] <- "United Kingdom"
maratoni["New York City Marathon"] <- "United States"
maratoni["Polytechnic Marathon"] <- "United Kingdom"
maratoni["Seaside"] <- "United States"
maratoni["Tour de Paris Marathon"] <- "France"
maratoni["Ryde"] <- "United Kingdom"
maratoni["Turku Marathon"] <- "Finland"
maratoni["Yonkers"] <- "United States"
maratoni["Yonkers,"] <- "United States"
maratoni[grep("OR", maratoni)] <- "United States"

maraton$Drzava <- maratoni[maraton$Kraj]
