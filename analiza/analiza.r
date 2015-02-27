# 4. faza: Analiza podatkov

# Uvozimo funkcijo za uvoz spletne strani.
source("lib/xml.r")



#NAPOVED ŽENSKE
cat("Rišem graf...\n")
cairo_pdf("slike/graf4.pdf", width = 7.27, height = 5.69, family = "Arial") 



Sys.setlocale("LC_TIME", "C") # naj uporablja angleška imena mesecev:
cas.zenske <- zenske$Time
datum.zenske <- names(table(zenske$Date))
leto.zenske <- gsub(".*, ", "", datum.zenske)
names(leto.zenske) <- datum.zenske
datum1.zenske <- as.Date(zenske$Date, "%b %d, %Y") 
plot(datum1.zenske, cas.zenske, main = "Spreminjanje rekorda skozi čas", 
     xlim = as.Date(c("1918-09-29", "2050-12-31")),
     ylim = c(4000, 20400),
     xlab = "Letnica maratona", ylab = "Čas v sekundah", type = "h",
     lwd = 4, col = "pink")
#as.Date, ki nize pretvori v obliko, 
#ki jo R razume kot datum


#gledamo datume, ki so pred letom 1981
novdatum.zenske <- datum1.zenske[datum1.zenske < as.Date("1981-03-29")]
#Za lažjo regresijo
zacetek.zenske <- min(datum1.zenske)
datt.zenske <- as.numeric(datum1.zenske - zacetek.zenske)


#Različne regresijske metode
#LINEARNA
datumi.napoved.zenske <- as.Date(paste(1918:2050, 1, 1, sep = "-")) # leta, za katera napovedujemo
linearna.zenske <- lm(cas.zenske ~ datt.zenske)
lines(datumi.napoved.zenske,
      predict(linearna.zenske, data.frame(datt.zenske=as.numeric(datumi.napoved.zenske-zacetek.zenske))),
      col = "yellow")



#EKSPONENTNI MODEL
logcas.zenske <- log(cas.zenske)
llin.zenske <- lm(logcas.zenske ~ datt.zenske)
lines(datumi.napoved.zenske,
      exp(predict(llin.zenske, data.frame(datt.zenske=as.numeric(datumi.napoved.zenske-zacetek.zenske)))),
      col = "purple")


#LOESS MODEL
loes.zenske <- loess(cas.zenske ~ datt.zenske)
lines(datumi.napoved.zenske,
      predict(loes.zenske, data.frame(datt.zenske=as.numeric(datumi.napoved.zenske-zacetek.zenske))),
      col = "red")

#GAM
library(mgcv)
mgam.zenske <- gam(cas.zenske ~ s(datt.zenske))
lines(datumi.napoved.zenske,
      predict(mgam.zenske, data.frame(datt.zenske=as.numeric(datumi.napoved.zenske-zacetek.zenske))), 
      col = "cyan")

legend("topright", c("Linearna metoda", 
                     "Eksponentna medtoda", "Loess", "Gam"),lty=c(1,1,1),
       col = c("yellow", "purple", "red", "cyan"))

#Pogledamo ostanke pri modelih. Tisti, ki ima manjši ostanek je bolj natančen
vsota.kvadratov <- sapply(list(linearna.zenske, 
                               llin.zenske, loes.zenske, mgam.zenske), function(x) sum(x$residuals^2))
# 3.910234e+07  2.064928e-01 1.084761e+07 8.772608e+05

dev.off()

#NAPOVED MOŠKI
cat("Rišem graf...\n")
cairo_pdf("slike/graf5.pdf", width = 7.27, height = 5.69, family = "Arial") 


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
      col = "yellow")


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

legend("topright", c("Linearna metoda",
                     "Eksponentna medtoda", "Loess", "Gam"),lty=c(1,1,1),
       col = c("yellow", "purple", "red", "cyan"))

#Pogledamo ostanke pri modelih. Tisti, ki ima manjši ostanek je bolj natančen
vsota.kvadratov <- sapply(list(linearna, llin, loes, mgam), function(x) sum(x$residuals^2))
# 3.766024e+06  3.912026e-02 1.060280e+06 6.401781e+05

dev.off()



