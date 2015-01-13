# 4. faza: Analiza podatkov

# Uvozimo funkcijo za uvoz spletne strani.
source("lib/xml.r")

# # Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)
# 
# # Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()

pdf("slike/graf4.pdf")
pdf.options(encoding='ISOLatin2.enc')


Sys.setlocale("LC_TIME", "C") # naj uporablja angleška imena mesecev:
cas <- zenske$Time
datum <- names(table(zenske$Date))
leto <- gsub(".*, ", "", datum)
names(leto) <- datum
plot(as.Date(zenske$Date, "%b %d, %Y"), cas, main = "Spreminjanje rekorda skozi čas", 
     xlab = "Letnica maratona", ylab = "Čas v sekundah", type = "h", lwd = 5, col = "pink")
#as.Date, ki nize pretvori v obliko, 
#ki jo R razume kot datum

dev.off()

pdf("slike/graf5.pdf")
pdf.options(encoding='ISOLatin2.enc')


Sys.setlocale("LC_TIME", "C") # naj uporablja angleška imena mesecev:
cas <- moski$Time
datum <- names(table(moski$Date))
leto <- gsub(".*, ", "", datum)
names(leto) <- datum
plot(as.Date(moski$Date, "%b %d, %Y"), cas, main = "Spreminjanje rekorda skozi čas", 
     xlab = "Letnica maratona", ylab = "Čas v sekundah", type = "h", lwd = 5, col = "steelblue")
#as.Date, ki nize pretvori v obliko, 
#ki jo R razume kot datum

dev.off()

# Tukaj si lahko pomagaš s funkcijo as.Date, ki nize pretvori v obliko, 
# ki jo R razume kot datum. Najprej bo potrebno dopovedati, naj uporablja angleška imena mesecev:
#   
#   Sys.setlocale("LC_TIME", "C")
# 
# Potem lahko pretvorjene datume neposredno uporabiš v grafu:
#   
#   plot(as.Date(maraton$Datum, "%b %d, %Y"), cas, main = "Spreminjanje rekorda skozi čas", 
#        xlab = "Letnica maratona", ylab = "Čas v sekundah", type = "h", lwd = 5, col = "steelblue")
# 
# Tukaj bi seveda koristilo, če ločiš moške in ženske rekorde - bodisi z različnimi barvami, ali pa narišeš dva graf