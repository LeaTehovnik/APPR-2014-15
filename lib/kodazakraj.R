


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



drzave1 <- table(maraton$Drzava)
domacin <- sapply(names(drzave1), function(x) sum(ujema[maraton$Drzava == x]))
barve <- rep("white", nrow(svet))
names(barve) <- svet$name_long
tujec <- domacin < drzave1/2
drzavljan <- domacin > drzave1/2
enako <- domacin == drzave1/2
barve[names(which(tujec))] <- "red"
barve[names(which(drzavljan))] <- "blue"
barve[names(which(enako))] <- "green"


#točke na zemlejvidu, tukaj bi dala vektor z 
#imeni maratonov? kako bo vedel, kje je kaj??
# imena maratonov so v kraj :
plot(svet, col = barve)
text(mesta, 
     labels = as.character, cex = 0.7) #namesto krajev mi vrže številke
barve <- rainbow(49)
plot(svet, col = barve)
