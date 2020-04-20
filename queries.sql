# Geef de spelersnaam en het geslacht van elke speler die in Leiden woont. 
SELECT Naam, Geslacht FROM spelers WHERE Woonplaats = "Leiden";
# Geef het nummer, de woonplaats en het geboortejaar van elke speler die of in Leiden woont of in 1963 geboren is, maar niet van diegenen die in Leiden wonen en in 1963 geboren zijn. 
SELECT Spelersnr, Woonplaats, Geb_jaar FROM spelers WHERE (Woonplaats = "Leiden" OR Geb_jaar = 1963) AND NOT (Woonplaats = "Leiden" AND Geb_jaar = 1963)
# Geef de namen en geboortejaren van de spelers die toegetreden zijn tot de vereniging toen ze 16, 17, 18, 19 of 20 jaar oud waren. 
SELECT Naam, Geb_jaar FROM spelers WHERE (Jaartoe - Geb_jaar) BETWEEN 16 AND 20
# Geef het nummer, de naam en de woonplaats van elke speler die in Rijswijk, Rotterdam, Leiden of Voorburg woont. 
SELECT Spelersnr, Naam, Woonplaats FROM spelers WHERE Woonplaats IN ("Rijswijk", "Rotterdam", "Leiden", "Voorburg")
# Geef de naam en het nummer van elke speler met als voorlaatste letter in de naam de letter e.
SELECT Naam, Spelersnr FROM spelers WHERE Naam LIKE "%e_";
# Hoeveel spelers staan in de ‘spelers’ tabel geregistreerd? 
SELECT COUNT(Spelersnr) FROM spelers
# Hoeveel spelers wonen in Leiden ? 
SELECT COUNT(Spelersnr) FROM spelers WHERE Woonplaats = "Leiden";
# Hoeveel verschillende plaatsnamen bevat de ‘plaats’ kolom ? 
SELECT COUNT(DISTINCT(Woonplaats)) FROM spelers;
# Geef het gemiddelde boetebedrag betaald voor speler 44. 
SELECT AVG(Bedrag) FROM boetes WHERE Spelersnr = 44;
# Geef van elke speler die aanvoerder is en voor wie in totaal meer dan 80 euro aan boetes is betaald, het spelersnummer en het totale boetebedrag. 
SELECT Spelersnr, SUM(Bedrag) FROM boetes GROUP BY Spelersnr HAVING SUM(Bedrag) > 80
# Geef het spelersnummer van elke speler voor wie meer dan 1 boete na 12/08/1980 is betaald, sorteer op spelersnr. 
SELECT Spelersnr, count(Spelersnr) FROM boetes WHERE Datum > "12/08/1980" GROUP BY Spelersnr HAVING count(Spelersnr) > 1 ORDER BY Spelersnr
# Geef het spelersnummer en de naam van elke speler die voor het eerste team minstens één wedstrijd heeft gespeeld. 
SELECT Spelersnr, Naam FROM spelers NATURAL JOIN wedstrijden WHERE Teamnr = 1 GROUP BY Spelersnr
# Geef het spelersnummer en de naam van de speler die aanvoerder is van team 1. 
SELECT Spelersnr, Naam FROM spelers NATURAL JOIN teams WHERE Teamnr = 1
# Geef het spelersnummer en de naam van elke speler voor wie minstens één boete van meer dan 50 euro betaald is. 
SELECT Spelersnr, Naam FROM boetes NATURAL JOIN spelers WHERE Bedrag > 50 GROUP BY Spelersnr;
#  Geef de teamnummers en spelersnummers van die personen uit Leiden die aanvoerders zijn van de teams uit de eredivisie.
# (Stel bij deze oefening dat er meerdere aanvoerders kunnen zijn per team en dat er meerdere teams in de ere divisie spelen.) 
SELECT Teamnr, Spelersnr FROM teams NATURAL JOIN spelers WHERE Woonplaats = "Leiden" AND Divisie = "ere"
# Wat is de laagste boete voor een speler die in Leiden woont? 
SELECT MIN(Bedrag) FROM boetes NATURAL JOIN spelers WHERE Woonplaats = "Leiden";
# Wat is het totaalbedrag aan boetes dat betaald is voor spelers uit Rijswijk? 
SELECT SUM(Bedrag) FROM boetes NATURAL JOIN spelers WHERE Woonplaats = "Rijswijk";

# Voor welke speler is ooit een boete betaald groter dan het gemiddelde boetebedrag?
SELECT Spelersnr, Naam from boetes NATURAL JOIN spelers WHERE Bedrag > (SELECT AVG(Bedrag) FROM boetes);
