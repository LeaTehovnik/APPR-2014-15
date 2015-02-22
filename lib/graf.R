pdf("slike/graf1.pdf")
pdf.options(family = "Helvetica")
#Graf, ki prikazuje delež držav, iz katerih so maratonci

#drzave, kjer so manj kot trije maratonci, sem združila v druge
drzave <- table(maraton$Drzavljanstvo)
drzave <- drzave[order(drzave, decreasing=TRUE)]
druge <- drzave < 3 
drzave <- c(drzave[!druge], "Druge" = sum(drzave[druge]))
pie(drzave, main="Drzavljanstva maratoncev", clockwise = TRUE, cex = 1)

#pretvorba angleščkih imen v slovenska
# slovenska <- c("ZDA", "Velika Britanija", "Japonska", "Kenija", "Norveška", "Etiopija",
#                "Nemčija", "Avstralija", "Francija")
# prave <- drzave[!druge]
# names(prave)[1:9] <- slovenska

dev.off()

#Igranje z grafi, morda mi bo koristilo pri naslednjih fazah.
#plot(maraton$Date, maraton$Time, type = "p", main = "Spreminjanje rekorda s časom",
#col = "red")