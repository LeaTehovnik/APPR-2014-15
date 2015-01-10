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

cas <- maraton$Čas
datum <- names(table(maraton$Datum))
leto <- gsub(".*, ", "", datum)
names(leto) <- datum
plot(leto, cas, main = "Spreminjanje rekorda skozi čas", 
     xlab = "Letnica maratona", ylab = "Čas v sekundah", type = "h", lwd = 5, col = "steelblue")

dev.off()