#zemljevid animacija
# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")


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

# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
mypdf("slike/ani1.pdf", width = 7.27, height = 5.69, family = "Arial") 



#še pobarvati
# rekordi <- table(maraton$Drzava)
# rekordiveni <- unique(rekordi)
# rekordiveni <- rekordiveni[order(rekordiveni)]
# barve <- rgb(1, 0, 0, match(rekordi, rekordiveni)/length(rekordiveni))
# names(barve) <- names(rekordi)
#plot(svet, col = barve[as.character(svet$name_long)])
plot(svet)
title("Rekord")
#legend("left", legend = rekordiveni, fill = rgb(1, 0, 0, (1:length(rekordiveni))/length(rekordiveni)), cex = 0.5)
#imena <- c("London", "New York", "Tokyo")
#mesta <- data.frame("long" = c(-0.13, -74.01, 139.75), "lat"= c(51.51, 40.71,35.68))
text(coordinates(mesta),
     labels = imena,
     pos = c(2,4,1), cex = 0.6,)
points(coordinates(mesta), type = "p", pch = 15, cex = 0.4, col = "green")


plot(svet)
title("Rekord1")

dev.off()
