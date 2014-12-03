pdf("slike/graf1.pdf",paper="a4r")
pdf.options(encoding='ISOLatin2.enc')
#Graf, ki prikazuje delež držav, iz katerih so maratonci

table(maraton$Državljanstvo)
pie(table(maraton$Državljanstvo), main="Državljanstva maratoncev")


dev.off()

#Igranje z grafi, morda mi bo koristilo pri naslednjih fazah.
#plot(maraton$Date, maraton$Time, type = "p", main = "Spreminjanje rekorda s časom",
#col = "red")