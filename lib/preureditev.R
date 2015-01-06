maraton$Drzavljanstvo[maraton$Državljanstvo == "West Germany"] <- "Germany"
maraton$Drzavljanstvo[maraton$Državljanstvo == "Soviet Union"] <- "Russia"

kraji <- names(table(maraton$Kraj))
maratoni <- gsub(".*, ", "", kraji)
names(maratoni) <- kraji
maratoni["Amsterdam Marathon"] <- "Netherlands"
maratoni["Beppu-Ōita Marathon"] <- "Japan"
maratoni["Berlin Marathon"] <- "West Germany"
maratoni["Boston Marathon"] <- "United States"
maratoni["Chicago Marathon"] <- "United States"
maratoni["Dülmen"] <- "West Germany"
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
maratoni["Beppu-Ōita Marathon"] <- "Japan"


maraton$Drzava <- maratoni[maraton$Kraj]
