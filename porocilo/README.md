# Poročilo

**Izbira teme**

Tema mojega projekta je rekord maratona skozi čas. Ukvarjala se bom z obdelavo podatkov različnih rekordov maratona. V projektu bom za vsak rekord podala spol(urejenostna spremenljivka), čas(številska spremenljivka), ime maratonca, državljanstvo ter kraj oz. ime in datum maratona(vse imenske spremenljivke).

Podatke bom pridobila iz spletne strani Wikipedia, natačneje na naslovu http://en.wikipedia.org/wiki/Marathon_world_record_progression.

Moj cilj je analizirati različne podatke, npr. ali je ista oseba postavila rekord večkrat, kje je bil največkrat postavljen, kdo je večkrat podrl rekord, moški ali ženske ter iz katere države je največ rekorderjev. Če pa bom tekom projetka dobila še kakšno idejo, bom obedelala tudi to.

**Obdelava, uvoz in čiščenje podatkov**

Podatke sem s pomočjo datoteke xml.r uvozila in jih združila s funkcijo rbind v preglednico maraton. Ker sta bila zadnja dva stolpca brezpomenska, sem ju izbrisala, dodala pa sem nov stolpec, ki bo določal spol tekomovalca. Prav tako sem s pomočjo funckije casvsekunde čas, ki je bil podan v urah in minutah, ter ločen s podpičji, spremenila v čas, ki je določen samo s sekundami, kar mi bo gotovo koristilo pri nadaljni obravnavi podatkov v sledečih fazah.

Z grafom sem ponazorila razmerje držav iz katerih prihajajo maratonci. Vidimo, da jih največ prihaja iz Združenih držav Amerike ter Velike Britanije.
Drugi graf se nanaša na razmerje med spoloma. Očitno so rekord večkrat podrli moški. 

V prihodnjih fazah pa bom uvozila tudi grafe, ki bodo nakazovali spreminjanje rekorda s časom.
