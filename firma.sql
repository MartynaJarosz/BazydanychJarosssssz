USE firma;
GO


--Zadanie 1
CREATE DATABASE firma;


--Zadanie 2
CREATE SCHEMA rozliczenia;


--Zadanie 3
CREATE TABLE rozliczenia.pracownicy 
(
	id_pracownika INT PRIMARY KEY NOT NULL,
	imie NVARCHAR(30),
	nazwisko NVARCHAR(30) NOT NULL,
	adres NVARCHAR(200) NOT NULL,
	telefon INT
);

CREATE TABLE rozliczenia.godziny 
(
	id_godziny INT PRIMARY KEY NOT NULL,
	data DATE,  
	liczba_godzin SMALLINT NOT NULL,
	id_pracownika INT  NOT NULL
);

CREATE TABLE rozliczenia.pensje 
(
	id_pensji INT PRIMARY KEY NOT NULL,
	stanowisko VARCHAR(20),
	kwota INT NOT NULL,
	id_premii INT
);

CREATE TABLE rozliczenia.premie 
(
	id_premii INT PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(20),
	kwota INT NOT NULL
);

ALTER TABLE rozliczenia.godziny ADD CONSTRAINT id_pracownika FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje ADD CONSTRAINT id_premii FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);


--Zadanie 4
INSERT INTO rozliczenia.pracownicy VALUES(1, 'Anna', 'Frycz', 'ul. Nowa 25, Kraków', 458462591);
INSERT INTO rozliczenia.pracownicy VALUES(2, 'Tomasz', 'Drabczyk', 'ul. S³oneczna 2, Bochnia', 158924682);
INSERT INTO rozliczenia.pracownicy VALUES(3, '£ukasz', 'Adamczyk', 'ul. Krokusowa 15, Skawina', 510720369);
INSERT INTO rozliczenia.pracownicy VALUES(4, 'Joanna', 'Janik', 'ul. D³ua 1, Kraków', 752013548);
INSERT INTO rozliczenia.pracownicy VALUES(5, 'Krystyna', 'Nowak', 'ul. Olimpijska 45, Kraków', 886245523);
INSERT INTO rozliczenia.pracownicy VALUES(6, 'Robert', 'Górski', 'ul. Reymonta 4, Wieliczka', 206120358);
INSERT INTO rozliczenia.pracownicy VALUES(7, 'Tadeusz', 'Holak', 'ul. Spokojna 68, Kraków', 663254108);
INSERT INTO rozliczenia.pracownicy VALUES(8, 'Maria', 'Rybak', 'ul. Senatorska 23, Bochnia', 965214852);
INSERT INTO rozliczenia.pracownicy VALUES(9, 'Józef', 'Pelo', 'ul. Sucha 7, Kraków', 120145898);
INSERT INTO rozliczenia.pracownicy VALUES(10, 'Jan', 'Adamowicz', 'ul. Kraka 44, Skawina', 748521987);

INSERT INTO rozliczenia.godziny VALUES(1, '2012-02-01', 8, 1);
INSERT INTO rozliczenia.godziny VALUES(2, '2012-02-03', 7, 2);
INSERT INTO rozliczenia.godziny VALUES(3, '2012-02-14', 9, 3);
INSERT INTO rozliczenia.godziny VALUES(4, '2012-02-02', 7, 4);
INSERT INTO rozliczenia.godziny VALUES(5, '2012-02-05', 7, 5);
INSERT INTO rozliczenia.godziny VALUES(6, '2012-02-18', 6, 6);
INSERT INTO rozliczenia.godziny VALUES(7, '2012-02-24', 9, 7);
INSERT INTO rozliczenia.godziny VALUES(8, '2012-02-11', 6, 8);
INSERT INTO rozliczenia.godziny VALUES(9, '2012-02-06', 5, 9);
INSERT INTO rozliczenia.godziny VALUES(10, '2012-02-19', 8, 10);

INSERT INTO rozliczenia.premie VALUES(1, 'regulaminowa', 200);
INSERT INTO rozliczenia.premie VALUES(2, 'regulaminowa', 210);
INSERT INTO rozliczenia.premie VALUES(3, 'regulaminowa', 220);
INSERT INTO rozliczenia.premie VALUES(4, 'regulaminowa', 230);
INSERT INTO rozliczenia.premie VALUES(5, 'regulaminowa', 240);
INSERT INTO rozliczenia.premie VALUES(6, 'regulaminowa', 250);
INSERT INTO rozliczenia.premie VALUES(7, 'regulaminowa', 260);
INSERT INTO rozliczenia.premie VALUES(8, 'regulaminowa', 270);
INSERT INTO rozliczenia.premie VALUES(9, 'regulaminowa', 280);
INSERT INTO rozliczenia.premie VALUES(10, 'regulaminowa', 290);

INSERT INTO rozliczenia.pensje VALUES(1, 'Programista', 5500, 1);
INSERT INTO rozliczenia.pensje VALUES(2, 'Software Developer', 9650, 2);
INSERT INTO rozliczenia.pensje VALUES(3, 'Software Engineer', 11000, 3);
INSERT INTO rozliczenia.pensje VALUES(4, 'Web Developer', 6300, 4);
INSERT INTO rozliczenia.pensje VALUES(5, 'DevOps Developer', 7400, 5);
INSERT INTO rozliczenia.pensje VALUES(6, 'Front-end Developer', 8100, 6);
INSERT INTO rozliczenia.pensje VALUES(7, 'Back-end Developer', 9000, 7);
INSERT INTO rozliczenia.pensje VALUES(8, 'Full Stack Developer', 14000, 8);
INSERT INTO rozliczenia.pensje VALUES(9, 'Software Architect ', 9600, 9);
INSERT INTO rozliczenia.pensje VALUES(10, 'In¿ynier systemowy', 8500, 10);


--Zadanie 5
SELECT nazwisko, adres FROM rozliczenia.pracownicy;


--Zadanie 6
SELECT DATEPART(MONTH, [data]) AS miesiac, DATEPART (WEEK, [data]) AS tydzien FROM rozliczenia.godziny;


--Zadanie 7
EXEC SP_RENAME 'rozliczenia.pensje.kwota' , 'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje ADD kwota_netto AS (kwota_brutto - (kwota_brutto*0.23));

SELECT * FROM rozliczenia.pensje;
