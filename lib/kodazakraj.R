#Rada bi kraj oz. ime maratona povezala z državo
#To bom potem prekopirala v vizualizacijo.r


# Kar se tiče države maratona, jo lahko ponekod dobiš iz
# samega imena kraja (kjer je oblike Kraj, Država), 
#drugod si pa lahko
# pomagaš s pomožno tabelo (ali kar vektorjem), 
#ki si ga lahko narediš v CSV
# ali pa kar v R. Glede na to, da imaš le 24 različnih maratonov, tu ne bo
# preveč dela.

imenadrzav <- maraton$Drzavljanstvo
imenadrzav <- imenadrzav[!duplicated(imenadrzav)]
kraj <- table(maraton$Kraj)  #kaj pa bre table?
kraj <- kraj[order(kraj, decreasing=TRUE)]
kraj <- kraj[kraj %in% imenadrzav] #ali je kraj v imenu držav


#če dobim nek vektor
# x = nam pove ali se država ujema z državljanstvom, y ,če se ne
tujec <-  len(x) > len(y)...! %in% imenadrzav
drzavljan <- len(y) > len(x)
enako <- len(x) = len(y)
#to bo imenska spremenljivka

#točke na zemlejvidu
text(coordinates(svet), 
     labels = as.character(imenadrzav), cex = 0.7)
barve <- rainbow(49)
plot(svet, col = barve)
