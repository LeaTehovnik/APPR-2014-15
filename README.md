# Analiza podatkov s programom R, 2014/15

Avtor : Lea Tehovnik

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2014/15.

## Tematika

Tema mojega projekta je rekord maratona skozi čas. Ukvarjala se bom z obdelavo podatkov različnih rekordov maratona. V projektu bom za vsak rekord podala spol(urejenostna spremenljivka), čas(številska spremenljivka), ime maratonca, državljanstvo ter kraj oz. ime in datum maratona(vse imenske spremenljivke).

Podatke bom pridobila iz spletne strani Wikipedia, natačneje na naslovu http://en.wikipedia.org/wiki/Marathon_world_record_progression.

Moj cilj je analizirati različne podatke, npr. ali je ista oseba postavila rekord večkrat, kje je bil največkrat postavljen, kdo je večkrat podrl rekord, moški ali ženske ter iz katere države je največ rekorderjev. Če pa bom tekom projetka dobila še kakšno idejo, bom obedelala tudi to.

## Program

Glavni program se nahaja v datoteki `projekt.r`. Ko ga poženemo, se izvedejo
programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Slike, ki jih program naredi, se shranijo v mapo
`slike/`. Zemljevidi v obliki SHP, ki jih program pobere, se shranijo v mapo
`zemljevid/`.

## Poročilo

Poročilo se nahaja v mapi `porocilo/`. Za izdelavo poročila v obliki PDF je
potrebno datoteko `porocilo/porocilo.tex` prevesti z LaTeXom. Pred tem je
potrebno pognati program, saj so v poročilu vključene slike iz mape `slike/`.
