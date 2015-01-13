pdf("slike/graf1.pdf")
pdf.options(encoding='ISOLatin2.enc')
#Graf, ki prikazuje delež držav, iz katerih so maratonci

#drzave, kjer sta manj kot trije maratonci, sem združila v druge
drzave <- table(maraton$Drzavljanstvo)
drzave <- drzave[order(drzave, decreasing=TRUE)]
druge <- drzave < 3 
drzave <- c(drzave[!druge], "Druge" = sum(drzave[druge]))
pie(drzave, main="Drzavljanstva maratoncev", clockwise = TRUE, cex = 1)




dev.off()

#Igranje z grafi, morda mi bo koristilo pri naslednjih fazah.
#plot(maraton$Date, maraton$Time, type = "p", main = "Spreminjanje rekorda s časom",
#col = "red")