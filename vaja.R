pdf("slike/graf6.pdf")
pdf.options(encoding='ISOLatin2.enc')


Sys.setlocale("LC_TIME", "C") # naj uporablja angleška imena mesecev:
cas <- moski$Time
datum <- names(table(moski$Date))
leto <- gsub(".*, ", "", datum)
names(leto) <- datum
datum1 <- as.Date(moski$Date, "%b %d, %Y") 
plot(datum1, cas, main = "Spreminjanje rekorda skozi čas", 
     xlim = as.Date(c("1908-01-01", "2050-12-31")),
     ylim = c(5000, 10518.4),
     xlab = "Letnica maratona", ylab = "Čas v sekundah", type = "h",
     lwd = 5, col = "steelblue")
#as.Date, ki nize pretvori v obliko, 
#ki jo R razume kot datum


#gledamo datume, ki so pred letom 1981
novdatum <- datum1[datum1 < as.Date("1981-01-01")]
#Za lažjo regresijo
zacetek <- min(datum1)
datt <- as.numeric(datum1 - zacetek)


#Različne regresijske metode
#LINEARNA
datumi.napoved <- as.Date(paste(1908:2050, 1, 1, sep = "-")) # leta, za katera napovedujemo
linearna <- lm(cas ~ datt)
lines(datumi.napoved,
      predict(linearna, data.frame(datt=as.numeric(datumi.napoved-zacetek))),
      col = "blue")
#KVADRATNA
kvadratna <- lm(cas ~ I(datt^2) + datt)
lines(datumi.napoved,
      predict(kvadratna, data.frame(datt=as.numeric(datumi.napoved-zacetek))),
      col = "yellow")
#KUBIČNA
tretja <- lm(cas ~ I(datt^(3)) + I(datt^2) +datt)
lines(datumi.napoved,
      predict(tretja, data.frame(datt=as.numeric(datumi.napoved-zacetek))),
      col = "orange")

#EKSPONENTNI MODEL
logcas <- log(cas)
llin <- lm(logcas ~ datt)
lines(datumi.napoved,
      exp(predict(llin, data.frame(datt=as.numeric(datumi.napoved-zacetek)))),
      col = "purple")


#LOESS MODEL
loes <- loess(cas ~ datt)
lines(datumi.napoved,
      predict(loes, data.frame(datt=as.numeric(datumi.napoved-zacetek))),
      col = "red")

#GAM
library(mgcv)
mgam <- gam(cas ~ s(datt))
lines(datumi.napoved,
      predict(mgam, data.frame(datt=as.numeric(datumi.napoved-zacetek))), 
              col = "cyan")

legend("topright", c("Linerana metoda", "Kvadratna metoda","Kubična metoda",
                    "Eksponentna medtoda", "Loess", "Gam"),lty=c(1,1,1),
       col = c("blue","yellow","orange", "purple", "red", "cyan"))
#Pogledamo ostanke pri modelih. Tisti, ki ima manjši ostanek je bolj natančen

vsota.kvadratov <- sapply(list(linearna, kvadratna, tretja, llin, loes, mgam), function(x) sum(x$residuals^2))
#3.766024e+06 1.198967e+06 1.166479e+06 1.252544e+06 3.912026e-02 1.060280e+06

dev.off()