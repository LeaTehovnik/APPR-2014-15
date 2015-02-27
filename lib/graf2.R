cairo_pdf("slike/graf2.pdf", width = 7.27, height = 5.69, family = "Arial") 



pie(table(maraton$Spol), main="Razmerje med spoloma")

dev.off()