# Pred uporabo namestite paket extrafont, potem pa izvedite
#   library(extrafont)
#   font_import() # vpraša za potrditev, traja nekaj minut
#   loadfonts()
# Slednja ukaza izvedite samo enkrat in ju ne vključujte v program!

library(extrafont)

# Uporabimo privzeto pisavo
pdf.options(family = "Helvetica")

# Funkcija za klic pdf, ki ignorira nastavitev pisave
mypdf <- function(file, width = 7, height = 7,
                  family = "Helvetica", onefile = TRUE) {
  pdf(file, width = width, height = height, onefile = onefile)
}

# Odkomentiraj, če želiš uporabljati cairo_pdf
mypdf <- cairo_pdf
