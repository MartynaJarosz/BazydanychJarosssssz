USE firma_zad5;
GO

--a)
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)458 462 591' WHERE id_pracownika = '1'
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)158 924 682' WHERE id_pracownika = '2'
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)510 720 369' WHERE id_pracownika = '3'
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)752 013 548' WHERE id_pracownika = '4'
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)886 245 523' WHERE id_pracownika = '5'
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)206 120 358' WHERE id_pracownika = '6'
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)663 254 108' WHERE id_pracownika = '7'
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)965 214 852' WHERE id_pracownika = '8'
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)120 145 898' WHERE id_pracownika = '9'
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)748 521 987' WHERE id_pracownika = '10'

SELECT id_pracownika, telefon FROM ksiegowosc.pracownicy

--b)
UPDATE ksiegowosc.pracownicy SET telefon = SUBSTRING(telefon, 1, 8) + '-' + 
										   SUBSTRING(telefon, 10, 3) + '-' + 
										   SUBSTRING(telefon, 14, 3)

SELECT id_pracownika, telefon FROM ksiegowosc.pracownicy

--c)
SELECT id_pracownika, imie, UPPER(nazwisko) AS nazwisko, adres, telefon 
FROM ksiegowosc.pracownicy
WHERE LEN(nazwisko) = (SELECT MAX(LEN(nazwisko)) FROM ksiegowosc.pracownicy)

--d)
SELECT CONVERT(VARCHAR(32),HashBytes('MD5', CONVERT(varchar, pracownicy.id_pracownika)),2) AS id_pracownika,
	   CONVERT(VARCHAR(32),HashBytes('MD5', CONVERT(varchar, pracownicy.imie)),2) AS imie,
	   CONVERT(VARCHAR(32),HashBytes('MD5', CONVERT(varchar, pracownicy.nazwisko)),2) AS nazwisko,
	   CONVERT(VARCHAR(32),HashBytes('MD5', CONVERT(varchar, pracownicy.adres)),2) AS adres,
	   CONVERT(VARCHAR(32),HashBytes('MD5', CONVERT(varchar, pracownicy.telefon)),2) AS telefon,
	   CONVERT(VARCHAR(32),HashBytes('MD5', CONVERT(varchar, pensja.kwota)),2) AS pensja
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenia.id_pensji
	
--f)
SELECT pracownicy.id_pracownika,
	pracownicy.imie,
	pracownicy.nazwisko,
	pracownicy.adres,
	pracownicy.telefon,
	pensja.kwota AS pensja,
	premia.kwota AS premia
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
JOIN ksiegowosc.pensja ON wynagrodzenia.id_pensji = pensja.id_pensji
LEFT JOIN ksiegowosc.premia ON wynagrodzenia.id_premii = premia.id_premii

--g)
SELECT CONCAT('Pracownik ', pracownicy.imie, ' ', pracownicy.nazwisko, ', w dniu ', wynagrodzenia.data, ' otrzyma³ pensjê ca³kowit¹ na kwotê ',
premia.kwota + pensja.kwota + (godziny.liczba_godzin-160)*30, ' z³, gdzie wynagrodzenie zasadnicze wynosi³o: ', pensja.kwota, ' z³, premia: ', premia.kwota, ' z³, nadgodziny: ', (godziny.liczba_godzin-160)*30, ' z³')
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenia ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.pensja ON wynagrodzenia.id_pensji = pensja.id_pensji
JOIN ksiegowosc.godziny ON wynagrodzenia.id_godziny = godziny.id_godziny
LEFT JOIN ksiegowosc.premia ON wynagrodzenia.id_premii = premia.id_premii



