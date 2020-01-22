-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Sty 2020, 18:46
-- Wersja serwera: 10.4.10-MariaDB
-- Wersja PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sklep_muzyczny`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adresy`
--

CREATE TABLE `adresy` (
  `ID_Adres` int(11) NOT NULL,
  `Wojewodztwo` varchar(30) NOT NULL,
  `Miasto` varchar(30) NOT NULL,
  `Ulica` varchar(30) NOT NULL,
  `Kod_pocztowy` varchar(6) NOT NULL,
  `Nr_domu` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `adresy`
--

INSERT INTO `adresy` (`ID_Adres`, `Wojewodztwo`, `Miasto`, `Ulica`, `Kod_pocztowy`, `Nr_domu`) VALUES
(11, 'Malopolskie', 'Krakow', 'Kwiatowa ', '34-145', 61),
(12, 'Podkarpackie', 'Debica', 'Glowna', '35-361', 514),
(81, 'Podkarpackie', 'Rzeszow', 'Mickiewicza', '28-612', 34),
(82, 'Podkarpackie', 'Krosno', 'Słoneczna', '31-541', 21),
(83, 'Podkarpackie', 'Sanok', 'Słowackiego', '38-500', 54),
(84, 'Wielkopolskie', 'Poznań', 'Kwiatowa', '14-542', 78);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID_Klienta` int(11) NOT NULL,
  `Imie_Klienta` varchar(30) NOT NULL,
  `Nazwisko_Klienta` varchar(30) NOT NULL,
  `ID_Adres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`ID_Klienta`, `Imie_Klienta`, `Nazwisko_Klienta`, `ID_Adres`) VALUES
(11, 'Tomasz', 'Nowak', 11),
(12, 'Oliwia', 'Marciniak', 12);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_Pracownika` int(11) NOT NULL,
  `Imie_Pracownika` varchar(30) NOT NULL,
  `Nazwisko_Pracownika` varchar(30) NOT NULL,
  `Data_zatrudnienia` date NOT NULL,
  `ID_adres` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `haslo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`ID_Pracownika`, `Imie_Pracownika`, `Nazwisko_Pracownika`, `Data_zatrudnienia`, `ID_adres`, `login`, `haslo`) VALUES
(81, 'Jan', 'Kowalski', '2019-07-03', 81, 'login1', 'haslo1'),
(82, 'Andrzej', 'Kowalczyk', '2019-05-01', 82, 'login2', 'haslo2'),
(83, 'Sebastian', 'Drozd', '2019-08-05', 83, 'login3', 'haslo3'),
(84, 'Paweł', 'Orkiszewski', '2019-11-06', 84, 'login4', 'haslo4');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `ID_Produkt` int(11) NOT NULL,
  `Nazwa` varchar(100) NOT NULL,
  `Cena` decimal(8,2) NOT NULL,
  `Kategoria` varchar(30) NOT NULL,
  `Autor` varchar(50) DEFAULT NULL,
  `Ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `produkt`
--

INSERT INTO `produkt` (`ID_Produkt`, `Nazwa`, `Cena`, `Kategoria`, `Autor`, `Ilosc`) VALUES
(101, 'Blackstar', '45.90', 'Plyta', 'David Bowie', 15),
(102, 'The Rise and Fall of Ziggy Stardust and the Spiders from Mars', '24.90', 'Plyta', 'David Bowie', 13),
(103, 'Gitara Yamaha RGX 121 Z BL', '1399.90', 'Instrument', NULL, 3),
(104, 'Ukulele HARLEY BENTON UK12', '135.00', 'Instrument', NULL, 4),
(105, 'Perkusja DDrum D2', '2091.00', 'Instrument', NULL, 3),
(106, 'Invisible Touch', '29.90', 'Plyta', 'Genesis', 12),
(107, 'A Night at the Opera', '32.50', 'Płyta', 'Queen', 8),
(108, 'Fortepian YAMAHA CLP-665GP', '14531.00', 'Instrument', NULL, 1),
(109, 'Skrzypce Ever Play EV613', '420.00', 'Instrument', NULL, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedaz`
--

CREATE TABLE `sprzedaz` (
  `ID_Transakcji` int(11) NOT NULL,
  `ID_Klienta` int(11) DEFAULT NULL,
  `ID_Pracownika` int(11) NOT NULL,
  `ID_Produkt` int(11) NOT NULL,
  `Data_sprzedazy` date NOT NULL,
  `Ilosc_sprz_egz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `sprzedaz`
--

INSERT INTO `sprzedaz` (`ID_Transakcji`, `ID_Klienta`, `ID_Pracownika`, `ID_Produkt`, `Data_sprzedazy`, `Ilosc_sprz_egz`) VALUES
(1001, NULL, 81, 101, '2020-01-01', 2),
(1002, 12, 82, 101, '2020-01-01', 2),
(1003, 11, 83, 108, '2020-01-02', 1),
(1004, NULL, 83, 107, '2020-01-03', 3),
(1005, NULL, 81, 102, '2020-01-05', 1),
(1006, NULL, 84, 106, '2020-01-06', 1),
(1007, 11, 84, 109, '2020-01-06', 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adresy`
--
ALTER TABLE `adresy`
  ADD PRIMARY KEY (`ID_Adres`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_Klienta`),
  ADD KEY `adres` (`ID_Adres`) USING BTREE;

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_Pracownika`) USING BTREE,
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `adres` (`ID_adres`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`ID_Produkt`);

--
-- Indeksy dla tabeli `sprzedaz`
--
ALTER TABLE `sprzedaz`
  ADD PRIMARY KEY (`ID_Transakcji`),
  ADD KEY `klient` (`ID_Klienta`),
  ADD KEY `pracownik` (`ID_Pracownika`),
  ADD KEY `produkt` (`ID_Produkt`);

--
-- AUTO_INCREMENT dla tabel zrzutów
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID_Klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `ID_Pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT dla tabeli `produkt`
--
ALTER TABLE `produkt`
  MODIFY `ID_Produkt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT dla tabeli `sprzedaz`
--
ALTER TABLE `sprzedaz`
  MODIFY `ID_Transakcji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD CONSTRAINT `klienci_ibfk_1` FOREIGN KEY (`ID_Adres`) REFERENCES `adresy` (`ID_Adres`);

--
-- Ograniczenia dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`ID_adres`) REFERENCES `adresy` (`ID_Adres`);

--
-- Ograniczenia dla tabeli `sprzedaz`
--
ALTER TABLE `sprzedaz`
  ADD CONSTRAINT `sprzedaz_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `klienci` (`ID_Klienta`),
  ADD CONSTRAINT `sprzedaz_ibfk_2` FOREIGN KEY (`ID_Pracownika`) REFERENCES `pracownicy` (`ID_Pracownika`),
  ADD CONSTRAINT `sprzedaz_ibfk_3` FOREIGN KEY (`ID_Produkt`) REFERENCES `produkt` (`ID_Produkt`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
