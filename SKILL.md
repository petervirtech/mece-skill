---
name: mece
description: Structure problems, analyses, and product features into mutually exclusive and collectively exhaustive parts, including actionable user stories.
---

# MECE-probleemstructurering

Gebruik deze skill wanneer iemand een vaag probleem wil opdelen, een analyse- of oplossingsstructuur nodig heeft, of een feature wil vertalen naar complete, niet-overlappende user stories.

## Kernregels

- **Mutually exclusive (wederzijds uitsluitend):** elke situatie, vraag of requirement hoort in precies één onderdeel van dezelfde decompositie.
- **Collectively exhaustive (gezamenlijk volledig):** de onderdelen dekken samen de afgesproken scope; expliciete uitzonderingen en aannames maken ontbrekende dekking zichtbaar.
- Kies per decompositieniveau één indelingslogica. Meng bijvoorbeeld geen gebruikersrollen, processtappen en technische componenten in dezelfde laag.
- Gebruik alleen zoveel detail als nodig is om een beslissing, onderzoek of implementatie uitvoerbaar te maken. MECE betekent niet dat elk onderdeel even groot moet zijn.

## Werkwijze

1. **Verhelder het doel.** Formuleer de hoofdvraag als een concrete uitkomst en leg scope, doelgroep, tijdsperiode en relevante beperkingen vast. Benoem ontbrekende informatie als aanname.
2. **Kies de eerste snijlijn.** Kies de meest bruikbare lens voor de vraag, bijvoorbeeld procesfase, klantsegment, oorzaak, kanaal, data-entiteit of oplossing. Geef kort aan waarom deze lens passend is.
3. **Bouw de boom.** Deel het geheel op in begrijpelijke onderdelen en herhaal dit alleen voor onderdelen die nog te groot of niet uitvoerbaar zijn. Geef elk onderdeel een korte naam en een duidelijke omschrijving.
4. **Controleer MECE.**
   - Wijs voor elk onderdeel een uniek criterium toe.
   - Zoek actief naar overlap, dubbeltellingen en een restcategorie die eigenlijk meerdere dingen verbergt.
   - Controleer de scope op uitzonderingen, randgevallen, negatieve gevallen en afhankelijkheden.
   - Voeg ontbrekende onderdelen toe of versmal de scope; verzin geen kunstmatige categorieën om de checklist af te vinken.
5. **Maak het uitvoerbaar.** Koppel elk blad aan een onderzoeksvraag, beslissing, experiment, taak of requirement. Geef prioriteit en afhankelijkheden alleen wanneer die uit de context volgen.
6. **Maak onzekerheid zichtbaar.** Scheid feiten, aannames, open vragen en aanbevelingen. Vraag maximaal de ontbrekende verduidelijkingen die de decompositie wezenlijk veranderen.

## Van feature naar user stories

Gebruik bij een feature eerst de gewenste gebruikersuitkomst en werk daarna door de relevante scenario's:

1. Formuleer het probleem, de doelgroep en het meetbare gewenste resultaat.
2. Splits de feature in capabilities of gebruikersdoelen, niet in schermen, API-endpoints of technische taken.
3. Controleer per capability de scenario-dekking: normaal pad, alternatieve invoer, validatie/lege toestand, fout- of herstelpad, rechten en relevante niet-functionele eisen.
4. Maak van elk scenario één zelfstandige user story die waarde levert en onafhankelijk te begrijpen is. Voeg technische subtaken pas onder de story toe.
5. Verwijder overlap door stories op één uniek gebruikersdoel te begrenzen. Voeg ontbrekende scenario's toe totdat de afgesproken scope volledig is.
6. Schrijf acceptatiecriteria als observeerbaar gedrag, bij voorkeur in Given/When/Then-vorm. Koppel elk criterium aan precies één story.

Gebruik dit formaat:

```text
## [Capability]
Doel: ...
Scope: ...

### US-01 — [unieke gebruikersuitkomst]
Als [persona] wil ik [actie/doel], zodat [waarde].

Acceptatiecriteria:
- Gegeven ..., wanneer ..., dan ...
- Gegeven ..., wanneer ..., dan ...

Afhankelijkheden: ...
Open vragen/aannames: ...
```

## Verwachte output

Pas de vorm aan de vraag aan, maar lever minimaal:

1. **Doel en scope**
2. **Gekozen decompositielens**
3. **MECE-structuur** met genummerde onderdelen en korte toelichting
4. **MECE-controle** met overlap-, dekking- en randgevallen
5. **Actievolgende stap** of, bij een feature, de user-story/backlog-tabel
6. **Aannames en open vragen**

Gebruik bij grotere structuren een tabel met `ID`, `Onderdeel`, `Uniek criterium`, `Dekking`, `Prioriteit` en `Volgende actie`. Presenteer eerst de structuur en daarna de toelichting; verberg geen twijfel achter stellige formuleringen.

## Kwaliteitscheck

Voer vóór oplevering deze laatste check uit:

- Kan elk item zonder interpretatie aan precies één categorie worden toegewezen?
- Is voor elk item binnen de afgesproken scope een categorie aanwezig?
- Is de indelingslogica op elk niveau consistent?
- Zijn overlap, aannames, uitzonderingen en buiten-scope-items expliciet?
- Zijn de kleinste onderdelen concreet genoeg om te onderzoeken, beslissen of bouwen?
- Zijn user stories klein genoeg om te testen en groot genoeg om gebruikerswaarde te leveren?
