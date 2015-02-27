cairo_pdf("slike/graf2.pdf", width = 9.27, height = 11.69, family = "Arial") 



pie(table(maraton$Spol), main="Razmerje med spoloma")

dev.off()