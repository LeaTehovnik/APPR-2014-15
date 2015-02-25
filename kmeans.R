
#metoda voditeljev
pdf("slike/graf7.pdf")
source("lib/uvozi.zemljevid.r")
maraton.norm <- scale(maraton$Čas)
k <- kmeans(maraton.norm, 5)
drzave <- row.names(maraton.norm)
m <- match(svet$name_long, drzave)
barve <- rainbow(5)
plot(svet, col = ifelse(is.na(m), "grey", barve[k$cluster[drzave[m]]]))

dev.off()