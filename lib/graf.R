pdf("slike/grafi.pdf",paper="a4r")
pdf.options(encoding='ISOLatin2.enc')
#Graf, ki prikazuje delež držav, iz katerih so maratonci

table(maraton$Nationality)
pie(table(maraton$Nationality), main="Državljanstva maratoncev")

#graf razmerja med spolom

table(maraton$Spol)
pie(table(maraton$Spol), main="Razmerje med spoloma")

dev.off()