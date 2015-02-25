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


#gledmao datume, ki so pred letom 1981
novdatum <- datum1[datum1 < as.Date("1981-01-01")]
#Za lažjo regresijo
zacetek <- min(datum1)
datt <- as.numeric(datum1 - zacetek)

datumi.napoved <- as.Date(paste(1908:2050, 1, 1, sep = "-")) # leta, za katera napovedujemo
linearna <- lm(cas ~ datt)
lines(datumi.napoved,
      predict(linearna, data.frame(datt=as.numeric(datumi.napoved-zacetek))),
      col = "blue")

kvadratna <- lm(cas ~ I(datt^2) + datt)
lines(datumi.napoved,
      predict(kvadratna, data.frame(datt=as.numeric(datumi.napoved-zacetek))),
      col = "yellow")

tretja <- lm(cas ~ I(datt^(3)) + I(datt^2) +datt)
lines(datumi.napoved,
      predict(tretja, data.frame(datt=as.numeric(datumi.napoved-zacetek))),
      col = "orange")
cetrta <- lm(cas ~ I(datt^(6)) + I(datt^3) +datt)
lines(datumi.napoved,
      predict(cetrta, data.frame(datt=as.numeric(datumi.napoved-zacetek))),
      col = "pink")





loes <- loess(cas ~ datt)
lines(datumi.napoved,
      predict(loes, data.frame(datt=as.numeric(datumi.napoved-zacetek))),
      col = "red")

#Pogledamo ostanke pri modelih. Tisti, ki ima manjši ostanek je bolj natančen

vsota.kvadratov <- sapply(list(linearna, kvadratna, tretja, loes), function(x) sum(x$residuals^2))
#3766024 1198967 1166479 1060280

dev.off()