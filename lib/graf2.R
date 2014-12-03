pdf("slike/graf2.pdf",paper="a4r")
pdf.options(encoding='ISOLatin2.enc')


table(maraton$Spol)
pie(table(maraton$Spol), main="Razmerje med spoloma")

dev.off()