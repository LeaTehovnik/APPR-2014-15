cas <- zenske$Time
datum <- names(table(zenske$Date))
leto <- gsub(".*, ", "", datum)
names(leto) <- datum
plot(leto, cas, main = "Spreminjanje rekorda skozi čas", 
     xlab = "Letnica maratona", ylab = "Čas v sekundah", type = "h", lwd = 5, col = "steelblue")