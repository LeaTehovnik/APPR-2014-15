pdf("slike/graf4.pdf")
pdf.options(encoding='ISOLatin2.enc')

cas <- maraton$Čas
datum <- names(table(maraton$Datum))
leto <- gsub(".*, ", "", datum)
names(leto) <- datum
plot(leto, cas, main = "Spreminjanje rekorda skozi čas", 
     xlab = "Letnica maratona", ylab = "Čas v sekundah", type = "h", lwd = 5, col = "steelblue")

dev.off()