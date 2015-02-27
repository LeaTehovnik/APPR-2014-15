#funkcija za prevod držav

slovar <- c("United States" = "ZDA",
            "United Kingdom" = "Velika Britanija",
            "Japan" = "Japonska",
            "Kenya" = "Kenija",
            "Norway" = "Norveška",
            "Ethiopia" = "Etiopija",
            "Germany" = "Nemčija",
            "Australia" = "Avstralija",
            "France" = "Francija")

prevedi <- function(x) {
  ifelse(is.na(slovar[x]), x, slovar[x])
}