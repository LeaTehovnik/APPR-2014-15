#Pobrišemo PDF-je in počistimo delovno okolje
silent <- TRUE
source("clearpdf.r", encoding = "UTF-8")
source("fontconfig.r",encoding = "UTF-8")
library(extrafont)

#vključitev funkcije prevod
source("lib/prevod.R",encoding="UTF-8")

# 2. faza: Obdelava, uvoz in čiščenje podatkov
source("uvoz/uvoz.r",encoding="UTF-8")
source("lib/graf.R",encoding="UTF-8")
source("lib/graf2.R",encoding="UTF-8")

# 3. faza: Analiza in vizualizacija podatkov
source("vizualizacija/vizualizacija.r",encoding="UTF-8")

# 4. faza: Napredna analiza podatkov
source("analiza/analiza.r",encoding="UTF-8")
source("analiza/animacija.R",encoding="UTF-8")
source("analiza/rekordikraj.R",encoding="UTF-8")

cat("Končano.\n")
