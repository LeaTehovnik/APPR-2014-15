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

#Regresijo lahko uporabimo tudi za nelinearne modele.

z <- lowess(datum1, cas)
points(z, col = "green", cex = 0.7)
lines(z, col = "green")

lin <- lm(cas ~ datum1)
abline(lin, col="darkviolet")

kv <- lm(cas ~ I(datum1^2) + datum1)
#curve(predict(lin, data.frame(datum1 = x)), add= TRUE, col = "red")
dev.off()