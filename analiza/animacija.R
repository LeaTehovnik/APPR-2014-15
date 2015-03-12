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





plot(svet)
title("Rekordi leta 1908")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)

plot(svet)
title("Rekordi leta 1909")
mesta <- data.frame("long" = c(-0.13, -74.01, 18.05), "lat" = c(51.51, 40.71,59.33))
points(coordinates(mesta), type = "p", pch = 19, cex = c(1, 2, 1), col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)

plot(svet)
title("Rekordi leta 1913")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1.5, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)

plot(svet)
title("Rekordi leta 1914")
mesta <- data.frame("long" = c(8.91), "lat" = c(45.60))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


                    
plot(svet)
title("Rekordi leta 1918")
mesta <- data.frame("long" = c(2.35), "lat" = c(48.86))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)



plot(svet)
title("Rekordi leta 1920")
mesta <- data.frame("long" = c(4.40), "lat" = c(51.21))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1925")
mesta <- data.frame("long" = c(-74.01), "lat" = c(40.71))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")                    
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1926")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1929")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1935")
mesta <- data.frame("long" = c(139.69), "lat" = c(35.69))
points(coordinates(mesta), type = "p", pch = 19, cex = 2.5, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1947")
mesta <- data.frame("long" = c(-74.01), "lat" = c(40.71))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1952")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1953")
mesta <- data.frame("long" = c(-0.13, 22.27), "lat" = c(51.51, 60.45))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1954")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1956")
mesta <- data.frame("long" = c(21.14), "lat" = c(62.30))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1958")
mesta <- data.frame("long" = c(18.05), "lat" = c(59.33))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1960")
mesta <- data.frame("long" = c(12.48), "lat" = c(41.86))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1963")
mesta <- data.frame("long" = c(-3.78, -0.13, 139.69,-118.40), "lat" = c(51.59, 51.51, 35.69, 34.02))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, 
       col = c("steelblue","steelblue", "steelblue", "pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1964")
mesta <- data.frame("long" = c(-0.13, 139.69,-1.16, 174.76), "lat" = c(51.51, 35.69, 50.73, -36.85))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, 
            col = c("steelblue","steelblue", "pink", "pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1965")
mesta <- data.frame("long" = c(-0.13), "lat" = c(51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)



plot(svet)
title("Rekordi leta 1967")
mesta <- data.frame("long" = c(130.40, -79.38), "lat" = c(33.59, 43.65))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue", "pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1969")
mesta <- data.frame("long" = c(4.40), "lat" = c(51.22))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1970")
mesta <- data.frame("long" = c(-3.19, -123.92), "lat" = c(55.95, 45.99))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue", "pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1971")
mesta <- data.frame("long" = c(-75.16, -118.40, -74.01), "lat" = c(39.95, 34.02, 40.71))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1973")
mesta <- data.frame("long" = c(-118.40), "lat" = c(34.02))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1974")
mesta <- data.frame("long" = c(-118.40, 7.53, 172.64), "lat" = c(34.02, 48.01, -43.53))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("pink","pink", "steelblue"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1975")
mesta <- data.frame("long" = c(-71.06, 7.29, -123.09), "lat" = c(42.36, 51.83, 44.05))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")       
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1977")
mesta <- data.frame("long" = c(-1.86, 13.41), "lat" = c(43.30, 52.52))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1978")
mesta <- data.frame("long" = c(139.69, -74.01), "lat" = c(35.69, 40.71))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue", "pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1979")
mesta <- data.frame("long" = c(-74.01), "lat" = c(40.71))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")                    
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1980")
mesta <- data.frame("long" = c(4.89, 174.76, -73.55, -74.01, 139.69), "lat" = c(52.37, -36.85, 45.51, 40.71, 35.69))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue", "pink","pink","pink","pink"))       
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1981")
mesta <- data.frame("long" = c(130.40, -0.13), "lat" = c(33.59, 51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue", "pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1982")
mesta <- data.frame("long" = c(-80.20, -123.09), "lat" = c(25.79, 44.05))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("pink", "pink"))       
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1983")
mesta <- data.frame("long" = c(-0.13, -71.06), "lat" = c(51.51, 42.36))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "pink")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1984")
mesta <- data.frame("long" = c(-87.63, -0.13), "lat" = c(41.88, 51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue","pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1985")
mesta <- data.frame("long" = c(4.48, -0.13), "lat" = c(51.92, 51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue","pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1988")
mesta <- data.frame("long" = c(4.48, 13.41), "lat" = c(51.92, 52.52))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = "steelblue")
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 1998")
mesta <- data.frame("long" = c(4.48), "lat" = c(51.92))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)




plot(svet)
title("Rekordi leta 1999")
mesta <- data.frame("long" = c(-87.63, 13.41), "lat" = c(41.88, 52.52))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue","pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 2001")
mesta <- data.frame("long" = c(-87.63, 13.41), "lat" = c(41.88, 52.52))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 2002")
mesta <- data.frame("long" = c(-87.63, -0.13), "lat" = c(41.88, 51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("pink","steelblue"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 2003")
mesta <- data.frame("long" = c(13.41, -0.13), "lat" = c(52.52, 51.51))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue","pink"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 2007")
mesta <- data.frame("long" = c(13.41), "lat" = c(52.52))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)


plot(svet)
title("Rekordi leta 2008")
mesta <- data.frame("long" = c(13.41), "lat" = c(52.52))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)

plot(svet)
title("Rekordi leta 2011")
mesta <- data.frame("long" = c(13.41), "lat" = c(52.52))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)

plot(svet)
title("Rekordi leta 2013")
mesta <- data.frame("long" = c(13.41), "lat" = c(52.52))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)

plot(svet)
title("Rekordi leta 2014")
mesta <- data.frame("long" = c(13.41), "lat" = c(52.52))
points(coordinates(mesta), type = "p", pch = 19, cex = 1, col = c("steelblue"))
legend("bottom", legend = c("moški 1x", "moški 2x", "moški 3x", "moški 4x", "ženska 1x"),
       col = c("steelblue","steelblue","steelblue","steelblue", "pink"),
       pt.cex = c(1,1.5,2,2.5,1), pch = 19, cex = 0.5, y.intersp = 1.7, horiz = TRUE)



dev.off()

