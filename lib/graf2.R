pdf("slike/graf2.pdf")
pdf.options(encoding='ISOLatin2.enc')



pie(table(maraton$Spol), main="Razmerje med spoloma")

dev.off()