#rada bi naredila graf, ki bo prikazoval ,kolikokrat je bil na nekem maratonu (v državi) 
#postavljen rekord. Potem pa bom te podatke še pokazala na zemljevidu

  
cairo_pdf("slike/graf3.pdf", width = 9.27, height = 11.69, family = "Arial") 


kraj <- table(maraton$Kraj)
kraj <- kraj[order(kraj, decreasing=TRUE)]
druge <- kraj < 2 
kraj <- c(kraj[!druge], "Druge" = sum(kraj[druge]))
pie(kraj, main="Število postavljenih rekordov na posameznem maratonu", clockwise = TRUE, cex = 1)




dev.off()

