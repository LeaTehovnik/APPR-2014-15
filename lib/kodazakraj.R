#Rada bi kraj oz. ime maratona povezala z državo
#To bom potem prekopirala v vizualizacijo.r


# Kar se tiče države maratona, jo lahko ponekod dobiš iz
# samega imena kraja (kjer je oblike Kraj, Država), 
#drugod si pa lahko
# pomagaš s pomožno tabelo (ali kar vektorjem), 
#ki si ga lahko narediš v CSV
# ali pa kar v R. Glede na to, da imaš le 24 različnih maratonov, tu ne bo
# preveč dela.

#kaj pa če bi naredila kar vekktor ,k i bi mi maratoen zamenjal z državami

#številska spremenljivka..če se državljanstvo ujema z

imenadrzav <- maraton$Drzavljanstvo
imenadrzav <- imenadrzav[!duplicated(imenadrzav)]

#če se ujema slučajno drž. z maratonom
#v kraj je KOLIKOKRAT je bil podrt rekord, rabim nvo vekotr
#ki mi bo 'naredil' države in jih psotavil na zemlejvid
kraj <- table(maraton$Kraj)  #kaj pa brez table?
kraj <- kraj[order(kraj, decreasing=TRUE)]
kraj <- kraj[kraj %in% imenadrzav] #ali je kraj v imenu držav
#če je, ga kar ?zamenjaj'?

#to bo imenska spremenljivka, dodati moram še, 
#da bo  tujec imel rdečo barvo, državljan modro, enako zeleno.
#če dobim nek vektor
# x = nam pove ali se država ujema z državljanstvom, y ,če se ne
tujec <-  len(x) > len(y)...! %in% imenadrzav
drzavljan <- len(y) > len(x)
enako <- len(x) = len(y)
tri <- c(tujec, drzavljan,enako)
barve <- rainbow(3)





#točke na zemlejvidu, tukaj bi dala vektor z 
#imeni maratonov? kako bo vedel, kje je kaj??
# imena maratonov so v kraj :

text(coordinates(svet), 
     labels = as.character(kraj), cex = 0.7) #namesto krajev mi vrže številke
barve <- rainbow(49)
plot(svet, col = barve)
