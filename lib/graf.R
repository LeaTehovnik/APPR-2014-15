cairo_pdf("slike/graf1.pdf", width = 7, height = 7, family = "Arial") 
#Graf, ki prikazuje delež držav, iz katerih so maratonci

#drzave, kjer so manj kot trije maratonci, sem združila v druge
drzave <- table(maraton$Drzavljanstvo)
drzave <- drzave[order(drzave, decreasing=TRUE)]
druge <- drzave < 3 
drzave <- c(drzave[!druge], "Druge" = sum(drzave[druge]))
pie(drzave, labels = prevedi(names(drzave)),
    main="Državljanstva maratoncev", clockwise = TRUE, cex = 1)

dev.off()

#Igranje z grafi, morda mi bo koristilo pri naslednjih fazah.
#plot(maraton$Date, maraton$Time, type = "p", main = "Spreminjanje rekorda s časom",
#col = "red")