pdf("slike/grafi.pdf",paper="a4r")
#Graf, ki prikazuje delež držav, iz katerih so rekorderji

table(maraton$Nationality)
pie(table(maraton$Nationality))

dev.off()