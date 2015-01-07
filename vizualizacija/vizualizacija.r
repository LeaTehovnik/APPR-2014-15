# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

maraton$Drzavljanstvo[maraton$Drzavljanstvo == "West Germany"] <- "Germany"
maraton$Drzavljanstvo[maraton$Drzavljanstvo == "Soviet Union"] <- "Russia"

#1.ZEMLJEVID (šTEVILSKA SPREMENLJIVKA)
# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                          "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                          encoding = "Windows-1250")



# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.svet <- c()
  manjkajo <- ! nove.svet %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.svet[manjkajo]
  podatki <- rbind(podatki, M)
  
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}

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

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/maraton_svet1.pdf", width=6, height=4)

#še pobarvati
rekordi <- table(maraton$Drzava)
rekordiveni <- unique(rekordi)
rekordiveni <- rekordiveni[order(rekordiveni)]
barve <- rgb(1, 0, 0, match(rekordi, rekordiveni)/length(rekordiveni))
names(barve) <- names(rekordi)
plot(svet, col = barve[as.character(svet$name_long)])
title("Število podrtih maratonov")
legend("left", legend = rekordiveni, fill = rgb(1, 0, 0, (1:length(rekordiveni))/length(rekordiveni)), cex = 0.5)
imena <- c("London", "Berlin", "Paris","Tokio")
mesta <- data.frame("long" = c(51.51, 52.52, 48.85, 139.75), "lat"= c(-0.13, 13.41, 2.35,  35.68))
text(coordinates(mesta[c("long", "lat")]),
     labels = imena,
     pos= 1, cex = 0.6, offset = 0.3)





dev.off()

#2.ZEMLJEVID (Imenska/urejenostna spremenljivka)
# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

#preuredit je treba West Germany in Soviet Union
maraton$Drzavljanstvo[maraton$Drzavljanstvo == "West Germany"] <- "Germany"
maraton$Drzavljanstvo[maraton$Drzavljanstvo == "Soviet Union"] <- "Russia"

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.svet <- c()
  manjkajo <- ! nove.svet %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.svet[manjkajo]
  podatki <- rbind(podatki, M)
  
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}

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


drzave1 <- table(maraton$Drzava)
ujema <- maraton$Drzavljanstvo == maraton$Drzava
domacin <- sapply(names(drzave1), function(x) sum(ujema[maraton$Drzava == x]))
barve <- rep("white", nrow(svet))
names(barve) <- svet$name_long
tujec <- domacin < drzave1/2
drzavljan <- domacin > drzave1/2
enako <- domacin == drzave1/2
barve[names(which(tujec))] <- "red"
barve[names(which(drzavljan))] <- "blue"
barve[names(which(enako))] <- "green"



# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/maraton_svet2.pdf", width=6, height=4)

n = 100

#plot(obcine, col = barve)
plot(svet, col = barve)
title("Zmage domačinov in tujcev")
legend("left", legend = c("Tujec", "Državljan", "Enako"), fill = c("red", "blue", "green"), cex = 0.6)
imena <- c("London", "Berlin", "Paris","Tokio")
mesta <- data.frame("long" = c(51.51, 52.52, 48.85, 139.75), "lat"= c(-0.13, 13.41, 2.35,  35.68))
text(coordinates(mesta[c("long", "lat")]),
     labels = imena,
     pos= 1, cex = 0.6, offset = 0.3)


dev.off()