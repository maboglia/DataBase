-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Set 07, 2020 alle 17:04
-- Versione del server: 10.4.11-MariaDB
-- Versione PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `its_2020`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `libri2`
--

CREATE TABLE `libri3` (
  `id` int(11) NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `prezzo` decimal(8,2) NOT NULL,
  `pagine` int(11) NOT NULL,
  `editore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `libri2`
--

INSERT INTO `libri3` (`id`, `titolo`, `prezzo`, `pagine`, `editore`) VALUES
(1, 'Alchimista (L\')', '12.00', 184, 1),
(2, 'Cinquanta sfumature di bianco', '10.20', 560, 1),
(3, 'Dieci piccoli indiani', '10.20', 208, 1),
(4, 'Don Chisciotte della Mancha', '20.40', 444, 3),
(5, 'Harry Potter e la Pietra Filosofale', '8.50', 302, 4),
(6, 'Il Codice da Vinci', '11.00', 512, 1),
(7, 'Il giovane Holden', '10.20', 251, 3),
(8, 'Il leone, la strega e l\'armadio', '7.65', 182, 1),
(9, 'Il libretto rosso', '7.22', 160, 5),
(10, 'Il Piccolo Principe', '4.25', 95, 1),
(11, 'Il Signore degli Anelli: La compagnia dell\'anello. Le due torri. Il ritorno del re', '25.00', 1255, 10),
(12, 'Il sogno della camera rossa. Romanzo cinese del XVIII secolo', '15.30', 721, 3),
(13, 'La colonna di fuoco', '27.00', 912, 1),
(14, 'La donna della domenica', '12.00', 434, 1),
(15, 'Lo Hobbit', '9.35', 417, 10),
(16, 'Macerie prime', '14.45', 192, 6),
(17, 'Origin', '21.25', 564, 1),
(18, 'Quel che resta del giorno', '12.00', 276, 3),
(19, 'Un mese con Montalbano', '12.75', 512, 7),
(20, 'Una storia tra due citta\'', '9.77', 600, 10),
(21, 'Marcovaldo', '10.00', 120, 7),
(22, 'IT', '25.00', 550, 9),
(23, 'Gomorra', '12.59', 345, 2),
(24, 'I diari della motocicletta', '23.00', 345, 3),
(26, 'Gli insospettabili - Sarah Savioli\r\n', '16.00', 240, 13);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
