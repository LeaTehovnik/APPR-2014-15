pdf("slike/grafi.pdf",paper="a4r")
pdf.options(encoding='ISOLatin2.enc')
#Graf, ki prikazuje delež držav, iz katerih so maratonci

table(maraton$Državljanstvo)
pie(table(maraton$Državljanstvo), main="Državljanstva maratoncev")

#graf razmerja med spolom

table(maraton$Spol)
pie(table(maraton$Spol), main="Razmerje med spoloma")

dev.off()

#Igranje z grafi, morda mi bo koristilo pri naslednjih fazah.
#plot(maraton$Date, maraton$Time, type = "p", main = "Spreminjanje rekorda s časom",
#col = "red")