--Zadanie 1
CREATE DATABASE firma;


--Zadanie 2
CREATE SCHEMA ksiegowosc;


--Zadanie 3
CREATE TABLE ksiegowosc.pracownicy 
(
	id_pracownika INT PRIMARY KEY NOT NULL,
	imie VARCHAR(30),
	nazwisko VARCHAR(30) NOT NULL,
	adres VARCHAR(200) NOT NULL,
	telefon INT
);
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela pracownicy';

CREATE TABLE ksiegowosc.godziny 
(
	id_godziny INT PRIMARY KEY NOT NULL,
	data DATE,  
	liczba_godzin SMALLINT NOT NULL,
	id_pracownika INT NOT NULL,
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika)
);
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela godziny'

CREATE TABLE ksiegowosc.pensja 
(
	id_pensji INT PRIMARY KEY NOT NULL,
	stanowisko VARCHAR(20),
	kwota INT NOT NULL
);
COMMENT ON TABLE ksiegowosc.pensja IS 'Tabela pensje'

CREATE TABLE ksiegowosc.premia
(
	id_premii INT PRIMARY KEY NOT NULL,
	rodzaj VARCHAR(20),
	kwota INT NOT NULL
);
COMMENT ON TABLE ksiegowosc.premia IS 'Tabela premie'

CREATE TABLE ksiegowosc.wynagrodzenia
(
	id_wynagrodzenia INT PRIMARY KEY NOT NULL,
	data DATE,
	id_pracownika INT NOT NULL,
	id_godziny INT NOT NULL,
	id_pensji INT NOT NULL,
	id_premii INT,
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika),
	FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
	FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji),
	FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii)
);
COMMENT ON TABLE ksiegowosc.wynagrodzenia IS 'Tabela wynagrodzenia'


--Zadanie 4
INSERT INTO ksiegowosc.pracownicy VALUES(1, 'Anna', 'Frycz', 'ul. Nowa 25, Kraków', 458462591);
INSERT INTO ksiegowosc.pracownicy VALUES(2, 'Tomasz', 'Drabczyk', 'ul. Słoneczna 2, Bochnia', 158924682);
INSERT INTO ksiegowosc.pracownicy VALUES(3, 'Łukasz', 'Adamczyk', 'ul. Krokusowa 15, Skawina', 510720369);
INSERT INTO ksiegowosc.pracownicy VALUES(4, 'Joanna', 'Janik', 'ul. Dłua 1, Kraków', 752013548);
INSERT INTO ksiegowosc.pracownicy VALUES(5, 'Krystyna', 'Nowak', 'ul. Olimpijska 45, Kraków', 886245523);
INSERT INTO ksiegowosc.pracownicy VALUES(6, 'Robert', 'Górski', 'ul. Reymonta 4, Wieliczka', 206120358);
INSERT INTO ksiegowosc.pracownicy VALUES(7, 'Tadeusz', 'Holak', 'ul. Spokojna 68, Kraków', 663254108);
INSERT INTO ksiegowosc.pracownicy VALUES(8, 'Maria', 'Rybak', 'ul. Senatorska 23, Bochnia', 965214852);
INSERT INTO ksiegowosc.pracownicy VALUES(9, 'Józef', 'Pelo', 'ul. Sucha 7, Kraków', 120145898);
INSERT INTO ksiegowosc.pracownicy VALUES(10, 'Jan', 'Adamowicz', 'ul. Kraka 44, Skawina', 748521987);

INSERT INTO ksiegowosc.godziny VALUES(1, '2012-02-01', 168, 1);
INSERT INTO ksiegowosc.godziny VALUES(2, '2012-02-03', 177, 2);
INSERT INTO ksiegowosc.godziny VALUES(3, '2012-02-14', 169, 3);
INSERT INTO ksiegowosc.godziny VALUES(4, '2012-02-02', 187, 4);
INSERT INTO ksiegowosc.godziny VALUES(5, '2012-02-05', 167, 5);
INSERT INTO ksiegowosc.godziny VALUES(6, '2012-02-18', 176, 6);
INSERT INTO ksiegowosc.godziny VALUES(7, '2012-02-24', 159, 7);
INSERT INTO ksiegowosc.godziny VALUES(8, '2012-02-11', 160, 8);
INSERT INTO ksiegowosc.godziny VALUES(9, '2012-02-06', 165, 9);
INSERT INTO ksiegowosc.godziny VALUES(10, '2012-02-19', 158, 10);

INSERT INTO ksiegowosc.premia VALUES(1, 'regulaminowa', 200);
INSERT INTO ksiegowosc.premia VALUES(2, 'regulaminowa', 210);
INSERT INTO ksiegowosc.premia VALUES(3, 'regulaminowa', 220);
INSERT INTO ksiegowosc.premia VALUES(4, 'regulaminowa', 230);
INSERT INTO ksiegowosc.premia VALUES(5, 'regulaminowa', 240);
INSERT INTO ksiegowosc.premia VALUES(6, 'regulaminowa', 250);
INSERT INTO ksiegowosc.premia VALUES(7, 'regulaminowa', 260);
INSERT INTO ksiegowosc.premia VALUES(8, 'regulaminowa', 270);
INSERT INTO ksiegowosc.premia VALUES(9, 'regulaminowa', 280);
INSERT INTO ksiegowosc.premia VALUES(10, 'regulaminowa', 290);

INSERT INTO ksiegowosc.pensja VALUES(1, 'Programista', 5500);
INSERT INTO ksiegowosc.pensja VALUES(2, 'Software Developer', 9650);
INSERT INTO ksiegowosc.pensja VALUES(3, 'Software Engineer', 11000);
INSERT INTO ksiegowosc.pensja VALUES(4, 'Web Developer', 6300);
INSERT INTO ksiegowosc.pensja VALUES(5, 'DevOps Developer', 7400);
INSERT INTO ksiegowosc.pensja VALUES(6, 'Front-end Developer', 8100);
INSERT INTO ksiegowosc.pensja VALUES(7, 'Back-end Developer', 9000);
INSERT INTO ksiegowosc.pensja VALUES(8, 'Full Stack Developer', 14000);
INSERT INTO ksiegowosc.pensja VALUES(9, 'Software Architect ', 9600);
INSERT INTO ksiegowosc.pensja VALUES(10, 'Inżynier systemowy', 8500);

INSERT INTO ksiegowosc.wynagrodzenia VALUES(1, '2012-02-01', 1, 1, 4);
INSERT INTO ksiegowosc.wynagrodzenia VALUES(2, '2012-02-04', 2, 2, 5, 8);
INSERT INTO ksiegowosc.wynagrodzenia VALUES(3, '2012-02-16', 3, 3, 1, 6);
INSERT INTO ksiegowosc.wynagrodzenia VALUES(4, '2012-02-05', 4, 4, 3, 2);
INSERT INTO ksiegowosc.wynagrodzenia VALUES(5, '2012-02-24', 5, 5, 8, 1);
INSERT INTO ksiegowosc.wynagrodzenia VALUES(6, '2012-02-26', 6, 6, 6);
INSERT INTO ksiegowosc.wynagrodzenia VALUES(7, '2012-02-27', 7, 7, 9, 4);
INSERT INTO ksiegowosc.wynagrodzenia VALUES(8, '2012-02-18', 8, 8, 7, 7);
INSERT INTO ksiegowosc.wynagrodzenia VALUES(9, '2012-02-14', 9, 9, 10, 5);
INSERT INTO ksiegowosc.wynagrodzenia VALUES(10, '2012-02-28', 10, 10, 2, 10);

--Zadanie 5
--a)
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy

--b)
SELECT pracownicy.id_pracownika 
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
WHERE pensja.kwota > 7000

--c)
SELECT wynagrodzenia.id_pracownika, pensja.kwota AS pensja
FROM ksiegowosc.wynagrodzenia
JOIN ksiegowosc.pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
WHERE pensja.kwota > 6000 AND wynagrodzenia.id_premii IS NULL

--d)
SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%'

--e)
SELECT * FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%' AND imie LIKE '%a'

--f)
SELECT pracownicy.imie, pracownicy.nazwisko, (godziny.liczba_godzin - 160) AS nadgodziny
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.godziny
ON wynagrodzenia.id_godziny = godziny.id_godziny

--g)
SELECT pracownicy.imie, pracownicy.nazwisko, pensja.kwota AS pensja
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
WHERE pensja.kwota BETWEEN 3500 AND 6500

--h)
SELECT pracownicy.imie, pracownicy.nazwisko
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.godziny
ON wynagrodzenia.id_godziny = godziny.id_godziny
WHERE godziny.liczba_godzin > 160 AND wynagrodzenia.id_premii IS NULL

--i)
SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensja.kwota AS pensja
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.Pensja
ON wynagrodzenia.ID_pensji = pensja.id_pensji
ORDER BY pensja.kwota

--j)
SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensja.kwota AS pensja, premia.kwota AS premia
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
JOIN ksiegowosc.premia
ON wynagrodzenia.id_premii = premia.id_premii
ORDER BY pensja.kwota DESC, premia.kwota DESC

--k)
SELECT stanowisko, COUNT(stanowisko)
FROM ksiegowosc.pensja GROUP BY stanowisko

--l)SELECT stanowisko, MIN(kwota) AS minimalna_kwota, MAX(kwota) AS max_kwota, AVG(kwota) AS srednia_kwota 
FROM ksiegowosc.pensja 
GROUP BY stanowisko
HAVING stanowisko = 'Programista'

--m)
SELECT SUM(kwota) AS wynagrodzenia_suma
FROM ksiegowosc.pensja

--n)
SELECT stanowisko, SUM(kwota) AS wynagrodzenia_suma
FROM ksiegowosc.pensja 
GROUP BY stanowisko

--o)
SELECT pensja.stanowisko, COUNT(id_premii) AS "liczba premii dla pracowników danego stanowiska"
FROM ksiegowosc.pensja 
JOIN ksiegowosc.wynagrodzenia
ON pensja.id_pensji = wynagrodzenia.id_pensji
GROUP BY pensja.stanowisko

--p)
ALTER TABLE ksiegowosc.godziny DROP CONSTRAINT godziny_id_pracownika_fkey;
ALTER TABLE ksiegowosc.wynagrodzenia DROP CONSTRAINT wynagrodzenia_id_pracownika_fkey;

DELETE FROM ksiegowosc.pracownicy
USING ksiegowosc.wynagrodzenia, ksiegowosc.pensja
WHERE wynagrodzenia.id_pracownika = pracownicy.id_pracownika
AND pensja.id_pensji = wynagrodzenia.id_pensji
AND pensja.kwota < 6000;
SELECT * FROM ksiegowosc.pracownicy
