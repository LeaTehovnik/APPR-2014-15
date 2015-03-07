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
mypdf("porocilo/ani.pdf", width = 8, height = 6, family = "Arial") 



#še pobarvati
# rekordi <- table(maraton$Drzava)
# rekordiveni <- unique(rekordi)
# rekordiveni <- rekordiveni[order(rekordiveni)]
# barve <- rgb(1, 0, 0, match(rekordi, rekordiveni)/length(rekordiveni))
# names(barve) <- names(rekordi)
#plot(svet, col = barve[as.character(svet$name_long)])
# plot(svet)
# title("Rekord")
#legend("left", legend = rekordiveni, fill = rgb(1, 0, 0, (1:length(rekordiveni))/length(rekordiveni)), cex = 0.5)
#imena <- c("London", "New York", "Tokyo")
#mesta <- data.frame("long" = c(-0.13, -74.01, 139.75), "lat"= c(51.51, 40.71,35.68))




plot(svet)
title("Rekordi leta 1908")
#imena <- c("London")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
# text(coordinates(mesta),
#      labels = imena,
#      pos = c(2), cex = 0.6,)
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")

plot(svet)
title("Rekordi leta 1909")
#imena <- c("London", "New York")
mesta <- data.frame("long" = c(-0.13, -74.01, 18.05), "lat" = c(51.51, 40.71,59.33))
# text(coordinates(mesta),
#      labels = imena,
#      pos = c(2), cex = 0.6,)
points(coordinates(mesta), type = "p", pch = 19, cex = c(1, 3, 1), col = "steelblue")

plot(svet)
title("Rekordi leta 1913")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 2, col = "steelblue")

plot(svet)
title("Rekordi leta 1914")
mesta <- data.frame("long" = c(8.91), "lat" = c(45.60))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
                    
plot(svet)
title("Rekordi leta 1918")
mesta <- data.frame("long" = c(2.35), "lat" = c(48.86))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")
                    

plot(svet)
title("Rekordi leta 1920")
mesta <- data.frame("long" = c(4.40), "lat" = c(51.21))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
                    
plot(svet)
title("Rekordi leta 1925")
mesta <- data.frame("long" = c(-74.01), "lat" = c(40.71))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")                    

plot(svet)
title("Rekordi leta 1926")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")

plot(svet)
title("Rekordi leta 1929")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")

plot(svet)
title("Rekordi leta 1935")
mesta <- data.frame("long" = c(139.69), "lat" = c(35.69))
points(coordinates(mesta), type = "p", pch = 19, cex = 4, col = "steelblue")



dev.off()
