# 2. faza: Uvoz podatkov


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

maraton$Drzavljanstvo[maraton$Državljanstvo == "West Germany"] <- "Germany"
maraton$Drzavljanstvo[maraton$Državljanstvo == "Soviet Union"] <- "Russia"

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
maratoni["London Marathon"] <- "United Kingdom"
maratoni["Rotterdam Marathon"] <- "Netherlands"
maratoni[grep("OR", maratoni)] <- "United States"

maraton$Drzava <- maratoni[maraton$Kraj]

maraton$Drzava[maraton$Drzava == "West Germany"] <- "Germany"

drzavemarat <- maraton$Drzava

