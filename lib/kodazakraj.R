#Rada bi kraj oz. ime maratona povezala z državo

# Kar se tiče države maratona, jo lahko ponekod dobiš iz
# samega imena kraja (kjer je oblike Kraj, Država), 
#drugod si pa lahko
# pomagaš s pomožno tabelo (ali kar vektorjem), 
#ki si ga lahko narediš v CSV
# ali pa kar v R. Glede na to, da imaš le 24 različnih maratonov, tu ne bo
# preveč dela.

imenadrzav <- maraton$Drzavljanstvo
imenadrzav <- imenadrzav[!duplicated(imenadrzav)]
kraj <- table(maraton$Kraj)
kraj <- kraj[order(kraj, decreasing=TRUE)]
kraj <- kraj[kraj %in% imenadrzav]
