pdf("slike/graf6.pdf")
pdf.options(encoding='ISOLatin2.enc')


Sys.setlocale("LC_TIME", "C") # naj uporablja angleška imena mesecev:
cas <- moski$Time
datum <- names(table(moski$Date))
leto <- gsub(".*, ", "", datum)
names(leto) <- datum
datum1 <- as.Date(moski$Date, "%b %d, %Y") 
plot(datum1, cas, main = "Spreminjanje rekorda skozi čas", 
     xlab = "Letnica maratona", ylab = "Čas v sekundah", type = "h", lwd = 5, col = "steelblue")
#as.Date, ki nize pretvori v obliko, 
#ki jo R razume kot datum
datum1 <- as.Date(moski$Date, "%b %d, %Y") 
novi.datumi <- gsub("-", "", datum1)
datt <- as.numeric(novi.datumi)

#Krivulje, ki se najbolj prilegajo rekordom
#Npišemo funkcijo za linearno rast

linearna <- lm(cas ~ datt)
abline(linearna, col="blue")

#Preverimo če je populacija kvadratna funkcija

kvadratna <- lm(cas ~ I(datt^2) + datt)
curve(predict(kvadratna, data.frame(datt=x)), add = TRUE, col = "red")  

#Loess model za primerjavo (model loess uporablja lokalno prilagajanje)

z <- loess(cas ~ datt)
points(z, col = "green", cex = 0.7)
lines(z, col = "green")
curve(predict(z, data.frame(datt=x)),add=TRUE,col="orange")
#Pogledamo ostanke pri modelih. Tisti, ki ima manjši ostanek je bolj natančen

vsota.kvadratov <- sapply(list(linearna, kvadratna, z), function(x) sum(x$residuals^2))





#curve(predict(lin, data.frame(datum1 = x)), add= TRUE, col = "red")
dev.off()