#rada bi naredila graf, ki bo prikazoval ,kolikokrat je bil na nekem maratonu (v državi) 
#postavljen rekord. Potem pa bom te podatke še pokazala na zemljevidu

  
pdf("slike/graf3.pdf")
pdf.options(encoding='ISOLatin2.enc')


kraj <- table(maraton$Kraj)
kraj <- kraj[order(kraj, decreasing=TRUE)]
druge <- kraj < 2 
kraj <- c(kraj[!druge], "Druge" = sum(kraj[druge]))
pie(kraj, main="Število postavljenih rekordov na posameznem maratonu", clockwise = TRUE, cex = 1)




dev.off()

