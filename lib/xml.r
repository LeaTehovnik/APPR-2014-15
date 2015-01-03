# Uvoz s spletne strani

source("lib/casvsekunde.R")

library(XML)

# Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# iz vozlišč, ki ustrezajo podani poti.
stripByPath <- function(x, path) {
  unlist(xpathApply(x, path,
                    function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
}

uvozi.maraton <- function(i) {
  url.maraton <- "http://en.wikipedia.org/wiki/Marathon_world_record_progression"
  doc.maraton <- htmlTreeParse(url.maraton, useInternalNodes=TRUE)
  
  # Poiščemo vse tabele v dokumentu
  tabele <- getNodeSet(doc.maraton, "//table")
  
  # Iz druge tabele dobimo seznam vrstic (<tr>) neposredno pod
  # trenutnim vozliščem
  vrstice <- getNodeSet(tabele[[i]], "./tr")
  
  # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
  # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
  seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td")
  
  # Iz seznama vrstic naredimo matriko
  matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE)
  
  # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
  colnames(matrika) <- gsub("\n", " ", stripByPath(vrstice[[1]], ".//th"))
  
  # Podatke iz matrike spravimo v razpredelnico
  tabela <- data.frame(gsub("^[^[:alnum:]]*", "",
                            gsub("\\[.*$", "", matrika)),
                       stringsAsFactors=FALSE)
  tabela$Time <- sapply(tabela$Time, cas.v.sekunde)
  return(tabela)
}
