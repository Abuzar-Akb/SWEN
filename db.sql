DROP DATABASE IF EXISTS tennisvereniging;
CREATE DATABASE tennisvereniging;


USE tennisvereniging;


CREATE TABLE spelers (
		Spelersnr TINYINT NOT NULL, 
		Naam VARCHAR(25) NOT NULL, 
		Voorlettr VARCHAR(3) NOT NULL, 
		Voorvoegsl VARCHAR(5) NULL,  
		Geb_jaar SMALLINT NOT NULL, 
		Geslacht CHAR NOT NULL, 
		Jaartoe SMALLINT NOT NULL, 
		Woonplaats VARCHAR(25) NOT NULL, 
		PRIMARY KEY (Spelersnr)
);
		
CREATE TABLE teams (
		Teamnr TINYINT NOT NULL, 
		Spelersnr TINYINT NOT NULL ,
		Divisie VARCHAR(10) NOT NULL, 
		PRIMARY KEY (Teamnr),
        FOREIGN KEY (Spelersnr) REFERENCES spelers(Spelersnr)
);
		
CREATE TABLE wedstrijden (
		Wedstrdnr TINYINT NOT NULL, 
		Teamnr TINYINT NOT NULL, 
		Spelersnr TINYINT NOT NULL, 
		Gewonnen TINYINT NOT NULL, 
		Verloren TINYINT NOT NULL, 
		PRIMARY KEY (Wedstrdnr),
        FOREIGN KEY (Teamnr) REFERENCES teams(Teamnr),
        FOREIGN KEY (Spelersnr) REFERENCES spelers(Spelersnr)
);
		
CREATE TABLE boetes (
		Betalingnr TINYINT NOT NULL, 
		Spelersnr TINYINT NOT NULL, 
		Datum DATE NOT NULL, 
		Bedrag DECIMAL(6,2) NOT NULL, 
		PRIMARY KEY (Betalingnr),
        FOREIGN KEY (Spelersnr) REFERENCES spelers(Spelersnr)
);
 
INSERT INTO spelers 
		(Spelersnr, Naam, Voorlettr, Voorvoegsl, Geb_jaar, Geslacht, Jaartoe, Woonplaats) VALUES 
		(6, 'Permentier', 'R', '', 1964, 'M', 1977, 'Rotterdam'),
		(100, 'Permentier', 'P', '', 1963, 'M', 1979, 'Leiden'),
		(28, 'Cools', 'C', '', 1963, 'V', 1983, 'Rijswijk'),
		(83, 'Hofland', 'PK', '', 1956, 'M', 1982, 'Rotterdam'),
		(2, 'Elfring', 'R', '', 1948, 'M', 1975, 'Leiden'),
		(57, 'Bohemen', 'M', 'van', 1963, 'M', 1979, 'Leiden'),
		(44, 'Bakker', 'E', 'de', 1963, 'M', 1980, 'Leiden'),
		(95, 'Meuleman', 'P', '', 1963, 'M', 1972, 'Voorburg'),
		(112, 'Baalen', 'IP', 'van', 1963, 'V', 1984, 'Leiden'),
		(8, 'Nieuwenburg', 'B', '', 1962, 'V', 1980, 'Rijswijk'),
		(39, 'Bischof', 'D', '', 1956, 'M', 1980, 'Rotterdam'),
		(27, 'Cools', 'DD', '', 1964, 'V', 1983, 'Leiden'),
		(104, 'Moerman', 'D', '', 1970, 'V', 1984, 'Leiden'),
		(7, 'Wijers', 'GWS', '', 1963, 'M', 1981, 'Voorburg');
 
INSERT INTO teams VALUES 
		(1, 6, 'ere'),
		(2, 27, 'tweede');
 
INSERT INTO wedstrijden VALUES 
		(1, 1, 6, 3, 1),
		(2, 1, 6, 2, 3),
		(3, 1, 6, 3, 0),
		(4, 1, 44, 3, 2),
		(5, 1, 83, 0, 3),
		(6, 1, 2, 1, 3),
		(7, 1, 57, 3, 0),
		(8, 1, 8, 0, 3),
		(9, 2, 27, 3, 2),
		(10, 2, 104, 3, 2),
		(11, 2, 112, 2, 3),
		(12, 2, 112, 1, 3),
		(13, 2, 8, 0, 3);
 
INSERT INTO boetes VALUES 
		(1, 44, '1980/12/8', 75),
		(2, 27, '1981/5/5', 100),
		(3, 104, '1983/9/10', 50),
		(4, 44, '1984/12/8', 25),
		(5, 8, '1980/12/8', 25),
		(6, 44, '1980/12/8', 30),
		(7, 27, '1982/12/30', 75),
		(8, 90, '1984/11/12', 20);
