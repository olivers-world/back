-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 04, 2024 at 05:11 PM
-- Server version: 11.3.2-MariaDB
-- PHP Version: 8.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olivers-world`
--

-- --------------------------------------------------------

--
-- Table structure for table `Additions`
--

CREATE TABLE `Additions` (
  `ID` int(11) NOT NULL,
  `Plats` varchar(255) NOT NULL,
  `DateHeure` datetime NOT NULL,
  `Reservations` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AdditionsPlats`
--

CREATE TABLE `AdditionsPlats` (
  `Plat` varchar(255) NOT NULL,
  `Addition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Allergies`
--

CREATE TABLE `Allergies` (
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Allergies`
--

INSERT INTO `Allergies` (`Nom`) VALUES
('Arachide'),
('Blé et triticale'),
('Graines de sésame'),
('Lait'),
('Mollusques et crustacés'),
('Moutarde'),
('Noix'),
('Oeuf'),
('Poissons'),
('Soja'),
('Sulfites');

-- --------------------------------------------------------

--
-- Table structure for table `FormuleDuJour`
--

CREATE TABLE `FormuleDuJour` (
  `Date` date NOT NULL,
  `MenuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FormuleDuJour`
--

INSERT INTO `FormuleDuJour` (`Date`, `MenuID`) VALUES
('2024-04-04', 1),
('2024-04-01', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Ingredients`
--

CREATE TABLE `Ingredients` (
  `Nom` varchar(255) NOT NULL,
  `Type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Ingredients`
--

INSERT INTO `Ingredients` (`Nom`, `Type`) VALUES
('Brandy', 'Boissons'),
('Café', 'Boissons'),
('Soda', 'Boissons'),
('Vin blanc', 'Boissons'),
('Vin rouge', 'Boissons'),
('Farine', 'Cereales'),
('Pain', 'Cereales'),
('Pain pita', 'Cereales'),
('Pâtes', 'Cereales'),
('Quinoa', 'Cereales'),
('Ravioli', 'Cereales'),
('Riz', 'Cereales'),
('Riz arborio', 'Cereales'),
('Ail', 'Condiments'),
('Anchois', 'Condiments'),
('Câpres', 'Condiments'),
('Poivre', 'Condiments'),
('Sel', 'Condiments'),
('Citron', 'Fruits'),
('Citrons', 'Fruits'),
('Dattes', 'Fruits'),
('Figues', 'Fruits'),
('Fruits variés', 'Fruits'),
('Pommes', 'Fruits'),
('Calamars', 'Fruits de Mer'),
('Crevettes', 'Fruits de Mer'),
('Moules', 'Fruits de Mer'),
('Basilic', 'Herbes'),
('Laurier', 'Herbes'),
('Origan', 'Herbes'),
('Persil', 'Herbes'),
('Romarin', 'Herbes'),
('Safran', 'Herbes'),
('Sauge', 'Herbes'),
('Thym', 'Herbes'),
('Huile d\'olive', 'Huiles'),
('Vinaigre', 'Huiles'),
('Artichauts', 'Legumes'),
('Aubergines', 'Legumes'),
('Carottes', 'Legumes'),
('Céleri', 'Legumes'),
('Champignons', 'Legumes'),
('Concombre', 'Legumes'),
('Courgettes', 'Legumes'),
('Échalotes', 'Legumes'),
('Épinards', 'Legumes'),
('Fenouil', 'Legumes'),
('Haricots', 'Legumes'),
('Laitue', 'Legumes'),
('Lentilles', 'Legumes'),
('Oignons', 'Legumes'),
('Olives', 'Legumes'),
('Pignons', 'Legumes'),
('Piment', 'Legumes'),
('Pois chiches', 'Legumes'),
('Poivrons', 'Legumes'),
('Pommes de terre', 'Legumes'),
('Tomates', 'Legumes'),
('Truffes', 'Legumes'),
('Amandes', 'Noix et Graines'),
('Cacao', 'Noix et Graines'),
('Noisettes', 'Noix et Graines'),
('Jaunes d\'oeufs', 'Oeufs'),
('Oeufs', 'Oeufs'),
('Bar', 'Poissons'),
('Cabillaud', 'Poissons'),
('Dorade', 'Poissons'),
('La Baudroie', 'Poissons'),
('La Vive', 'Poissons'),
('Le Saint-pierre', 'Poissons'),
('Merlan', 'Poissons'),
('Morue', 'Poissons'),
('Rascasse Rouge', 'Poissons'),
('Rouget Barbet', 'Poissons'),
('Sardine', 'Poissons'),
('Saumon', 'Poissons'),
('Thon', 'Poissons'),
('Bouillon de légumes', 'Préparés'),
('Falafels', 'Préparés'),
('Pesto', 'Préparés'),
('Sauce tahini', 'Préparés'),
('Sauce tomate', 'Préparés'),
('Tapenade', 'Préparés'),
('Beurre', 'Produits Laitiers'),
('Crème', 'Produits Laitiers'),
('Feta', 'Produits Laitiers'),
('Fromage de chèvre', 'Produits Laitiers'),
('Lait', 'Produits Laitiers'),
('Mascarpone', 'Produits Laitiers'),
('Mozzarella', 'Produits Laitiers'),
('Parmesan', 'Produits Laitiers'),
('Pâte feuilletée', 'Produits Laitiers'),
('Ricotta', 'Produits Laitiers'),
('Chocolat', 'Sucres et Douceurs'),
('Lardons', 'Sucres et Douceurs'),
('Miel', 'Sucres et Douceurs'),
('Pain d\'épices', 'Sucres et Douceurs'),
('Raisins secs', 'Sucres et Douceurs'),
('Sucre', 'Sucres et Douceurs'),
('Sucres', 'Sucres et Douceurs'),
('Vanille', 'Sucres et Douceurs'),
('Agneau', 'Viandes et Volailles'),
('Boeuf', 'Viandes et Volailles'),
('Canard', 'Viandes et Volailles'),
('Jambon', 'Viandes et Volailles'),
('Lapin', 'Viandes et Volailles'),
('Pancetta', 'Viandes et Volailles'),
('Porc', 'Viandes et Volailles'),
('Poulet', 'Viandes et Volailles'),
('Salami', 'Viandes et Volailles'),
('Saucisse', 'Viandes et Volailles'),
('Saucisson', 'Viandes et Volailles');

-- --------------------------------------------------------

--
-- Table structure for table `Inventaires`
--

CREATE TABLE `Inventaires` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Fait` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Inventaires`
--

INSERT INTO `Inventaires` (`ID`, `Date`, `Fait`) VALUES
(1, '2024-03-06', 1),
(2, '2024-03-20', 1),
(4, '2024-04-10', 0),
(54, '2024-04-04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Menus`
--

CREATE TABLE `Menus` (
  `ID` int(11) NOT NULL,
  `Menu` varchar(255) NOT NULL,
  `Prix` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Menus`
--

INSERT INTO `Menus` (`ID`, `Menu`, `Prix`) VALUES
(1, 'Classiques du Bistrot', 32.00),
(2, 'Végétarien Gourmand', 20.00),
(3, 'Voyage en Mer', 16.00);

-- --------------------------------------------------------

--
-- Table structure for table `MenusPlats`
--

CREATE TABLE `MenusPlats` (
  `MenuID` int(11) NOT NULL,
  `PlatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `MenusPlats`
--

INSERT INTO `MenusPlats` (`MenuID`, `PlatID`) VALUES
(1, 4),
(1, 1),
(1, 3),
(1, 13),
(1, 5),
(1, 19),
(1, 20),
(3, 4),
(3, 4),
(3, 15),
(3, 21),
(3, 22),
(3, 2),
(3, 9),
(3, 2),
(3, 9),
(3, 19),
(3, 19),
(3, 28),
(3, 29),
(2, 21),
(2, 10),
(2, 20),
(2, 20),
(2, 19),
(2, 5),
(2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `Nettoyages`
--

CREATE TABLE `Nettoyages` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Fait` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Nettoyages`
--

INSERT INTO `Nettoyages` (`ID`, `Date`, `Fait`) VALUES
(1, '2024-03-04', 1),
(2, '2024-03-11', 1),
(3, '2024-03-18', 1),
(4, '2024-03-25', 1),
(46, '2024-04-04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Plats`
--

CREATE TABLE `Plats` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prix` decimal(10,2) NOT NULL,
  `Types` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Plats`
--

INSERT INTO `Plats` (`ID`, `Nom`, `Prix`, `Types`) VALUES
(1, 'Boeuf Bourguignon', 22.00, 'Plats'),
(2, 'Bouillabaisse', 18.00, 'Plats'),
(3, 'Cassoulet', 20.00, 'Plats'),
(4, 'Ceviche', 17.00, 'Entrées'),
(5, 'Crème Brûlée', 10.00, 'Desserts'),
(6, 'Falafel Wrap', 11.00, 'Entrées'),
(8, 'Margherita Pizza', 10.00, 'Plats'),
(9, 'Moules Marinières', 16.00, 'Plats'),
(10, 'Paella', 19.00, 'Plats'),
(11, 'Quiche Lorraine', 500.00, 'Entrées'),
(12, 'Ratatouille', 12.00, 'Entrées'),
(13, 'Ravioli Ricotta e Spinaci', 13.00, 'Plats'),
(14, 'Risotto aux Champignons', 14.00, 'Plats'),
(15, 'Salade de Quinoa', 12.00, 'Entrées'),
(17, 'Sangria', 7.00, 'Boissons'),
(18, 'Spaghetti Carbonara', 15.00, 'Plats'),
(19, 'Tarte Tatin', 9.00, 'Desserts'),
(20, 'Tiramisu', 11.00, 'Desserts'),
(21, 'Salade Nicoise', 20.00, 'Entrées'),
(22, 'Carpaccio de boeuf', 14.00, 'Entrées'),
(23, 'Tartare de saumon', 16.00, 'Entrées'),
(24, 'Bruschetta', 8.00, 'Entrées'),
(25, 'Escargots de Bourgogne', 13.00, 'Entrées'),
(26, 'Panna cotta', 9.00, 'Desserts'),
(27, 'Fondant au chocolat', 10.00, 'Desserts'),
(28, 'Macarons assortis', 8.00, 'Desserts'),
(29, 'Mousse au chocolat', 9.00, 'Desserts'),
(30, 'Sorbet aux fruits de saison', 7.00, 'Desserts'),
(31, 'Limonade maison', 5.00, 'Boissons'),
(32, 'Jus de fruit fraits', 6.00, 'Boissons'),
(33, 'Café gourmand', 8.00, 'Desserts'),
(34, 'Thé glacé maison', 5.00, 'Boissons'),
(35, 'Eau pétillante', 4.00, 'Boissons'),
(36, 'Soda', 2.00, 'Boissons'),
(37, 'Vin rouge', 12.00, 'Boissons');

-- --------------------------------------------------------

--
-- Table structure for table `PlatsIngredients`
--

CREATE TABLE `PlatsIngredients` (
  `Plat` varchar(255) NOT NULL,
  `Ingredients` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PlatsIngredients`
--

INSERT INTO `PlatsIngredients` (`Plat`, `Ingredients`) VALUES
('Bouillabaisse', 'Ail'),
('Cassoulet', 'Ail'),
('Gazpacho', 'Ail'),
('Salade Niçoise', 'Anchois'),
('Ratatouille', 'Aubergines'),
('Margherita Pizza', 'Basilic'),
('Moules Marinières', 'Beurre'),
('Tarte Tatin', 'Beurre'),
('Boeuf Bourguignon', 'Boeuf'),
('Risotto aux Champignons', 'Bouillon de légumes'),
('Sangria', 'Brandy'),
('Tiramisu', 'Cacao'),
('Tiramisu', 'Café'),
('Cassoulet', 'Canard'),
('Boeuf Bourguignon', 'Carottes'),
('Boeuf Bourguignon', 'Champignons'),
('Risotto aux Champignons', 'Champignons'),
('Salade de Quinoa', 'Citron'),
('Gazpacho', 'Concombre'),
('Salade de Quinoa', 'Concombre'),
('Ratatouille', 'Courgettes'),
('Crème Brûlée', 'Crème'),
('Quiche Lorraine', 'Crème'),
('Bouillabaisse', 'Crevettes'),
('Paella', 'Crevettes'),
('Bouillabaisse', 'Dorade'),
('Moules Marinières', 'Échalotes'),
('Ravioli Ricotta e Spinaci', 'Épinards'),
('Falafel Wrap', 'Falafels'),
('Margherita Pizza', 'Farine'),
('Salade de Quinoa', 'Feta'),
('Quiche Lorraine', 'Fromage de chèvre'),
('Sangria', 'Fruits variés'),
('Cassoulet', 'Haricots'),
('Salade Niçoise', 'Haricots'),
('Gazpacho', 'Huile d\'olive'),
('Ratatouille', 'Huile d\'olive'),
('Crème Brûlée', 'Jaunes d\'oeufs'),
('Bouillabaisse', 'La Baudroie'),
('Bouillabaisse', 'La Vive'),
('Falafel Wrap', 'Laitue'),
('Quiche Lorraine', 'Lardons'),
('Bouillabaisse', 'Laurier'),
('Cassoulet', 'Laurier'),
('Tiramisu', 'Mascarpone'),
('Bouillabaisse', 'Merlan'),
('Bouillabaisse', 'Moules'),
('Moules Marinières', 'Moules'),
('Paella', 'Moules'),
('Margherita Pizza', 'Mozzarella'),
('Quiche Lorraine', 'Oeufs'),
('Salade Niçoise', 'Oeufs'),
('Spaghetti Carbonara', 'Oeufs'),
('Tiramisu', 'Oeufs'),
('Boeuf Bourguignon', 'Oignons'),
('Cassoulet', 'Oignons'),
('Ratatouille', 'Oignons'),
('Salade Niçoise', 'Olives'),
('Falafel Wrap', 'Pain pita'),
('Spaghetti Carbonara', 'Pancetta'),
('Risotto aux Champignons', 'Parmesan'),
('Spaghetti Carbonara', 'Parmesan'),
('Tarte Tatin', 'Pâte feuilletée'),
('Quiche Lorraine', 'Pâtes'),
('Spaghetti Carbonara', 'Pâtes'),
('Moules Marinières', 'Persil'),
('Spaghetti Carbonara', 'Poivre'),
('Gazpacho', 'Poivrons'),
('Paella', 'Poivrons'),
('Ratatouille', 'Poivrons'),
('Salade de Quinoa', 'Poivrons'),
('Tarte Tatin', 'Pommes'),
('Bouillabaisse', 'Pommes de terre'),
('Paella', 'Poulet'),
('Salade de Quinoa', 'Quinoa'),
('Bouillabaisse', 'Rascasse Rouge'),
('Ravioli Ricotta e Spinaci', 'Ravioli'),
('Ravioli Ricotta e Spinaci', 'Ricotta'),
('Paella', 'Riz'),
('Risotto aux Champignons', 'Riz arborio'),
('Bouillabaisse', 'Rouget Barbet'),
('Paella', 'Safran'),
('Falafel Wrap', 'Sauce tahini'),
('Ravioli Ricotta e Spinaci', 'Sauce tomate'),
('Cassoulet', 'Saucisse'),
('Sangria', 'Soda'),
('Crème Brûlée', 'Sucre'),
('Tarte Tatin', 'Sucre'),
('Tiramisu', 'Sucre'),
('Sangria', 'Sucres'),
('Salade Niçoise', 'Thon'),
('Falafel Wrap', 'Tomates'),
('Gazpacho', 'Tomates'),
('Margherita Pizza', 'Tomates'),
('Ratatouille', 'Tomates'),
('Salade de Quinoa', 'Tomates'),
('Salade Niçoise', 'Tomates'),
('Crème Brûlée', 'Vanille'),
('Moules Marinières', 'Vin blanc'),
('Risotto aux Champignons', 'Vin blanc'),
('Boeuf Bourguignon', 'Vin rouge'),
('Sangria', 'Vin rouge'),
('Gazpacho', 'Vinaigre');

-- --------------------------------------------------------

--
-- Table structure for table `Reservations`
--

CREATE TABLE `Reservations` (
  `ID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `DateHeure` datetime NOT NULL,
  `NbPersonnes` int(11) NOT NULL,
  `Statut` varchar(255) NOT NULL DEFAULT 'Prise'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Reservations`
--

INSERT INTO `Reservations` (`ID`, `Email`, `Nom`, `DateHeure`, `NbPersonnes`, `Statut`) VALUES
(97, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-05 12:00:00', 4, 'Prise'),
(98, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-05 19:25:00', 3, 'Prise'),
(99, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-04 12:00:00', 1, 'Prise'),
(100, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-04 12:25:00', 1, 'Prise'),
(101, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-04 12:10:00', 1, 'Prise'),
(102, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-04 12:30:00', 1, 'Prise'),
(103, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-04 12:50:00', 1, 'Prise'),
(104, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-04 12:55:00', 1, 'Prise'),
(105, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-03 12:00:00', 1, 'Prise'),
(106, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-03 12:05:00', 1, 'Prise'),
(107, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-03 12:10:00', 1, 'Prise'),
(108, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-03 12:15:00', 1, 'Prise'),
(109, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-03 12:20:00', 1, 'Prise'),
(110, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-02 12:25:00', 1, 'Prise'),
(111, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-02 12:35:00', 1, 'Prise'),
(112, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-02 12:30:00', 1, 'Prise'),
(113, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-02 12:10:00', 1, 'Prise'),
(114, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-02 12:15:00', 1, 'Prise'),
(115, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-02 12:55:00', 1, 'Prise'),
(116, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-06 12:50:00', 1, 'Prise'),
(117, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-06 12:45:00', 1, 'Prise'),
(118, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-06 12:55:00', 1, 'Prise'),
(119, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-06 12:35:00', 1, 'Prise'),
(120, 'garibaldialexis@gmail.com', 'GARIBALDI', '2024-04-06 12:30:00', 1, 'Prise'),
(121, 'adamcourtara@gmail.com', 'COURTARA', '2024-04-05 12:05:00', 3, 'Prise'),
(122, 'adamcourtara@gmail.com', 'COURTARA', '2024-04-05 12:30:00', 3, 'Prise'),
(123, 'mr.facebook@gmail.com', 'zuckerberg', '2024-04-05 12:20:00', 2, 'Prise'),
(124, 'thelegendofzelda@gmail.com', 'Meriot', '2024-04-05 12:10:00', 2, 'Prise'),
(125, 'djejounet@gmail.com', 'Nazim', '2024-04-05 12:15:00', 3, 'Prise');

-- --------------------------------------------------------

--
-- Table structure for table `ReservationsTables`
--

CREATE TABLE `ReservationsTables` (
  `Reservation` int(11) NOT NULL,
  `Table` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Restrictions`
--

CREATE TABLE `Restrictions` (
  `Type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Restrictions`
--

INSERT INTO `Restrictions` (`Type`) VALUES
('Alcool'),
('Aliment non Kasher'),
('Animaux non Halal'),
('Boeuf'),
('Fruits de mer'),
('Mélange lait-viande'),
('Porc');

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `Nom` varchar(255) NOT NULL,
  `Permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`Nom`, `Permissions`) VALUES
('Administrateur', '2'),
('Moderateur', '1'),
('Utilisateur', '0');

-- --------------------------------------------------------

--
-- Table structure for table `Statuts`
--

CREATE TABLE `Statuts` (
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Statuts`
--

INSERT INTO `Statuts` (`Nom`) VALUES
('Annulé'),
('En cours'),
('Prise'),
('Terminer');

-- --------------------------------------------------------

--
-- Table structure for table `Tables`
--

CREATE TABLE `Tables` (
  `ID` int(11) NOT NULL,
  `NbCouverts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Tables`
--

INSERT INTO `Tables` (`ID`, `NbCouverts`) VALUES
(1, 2),
(2, 2),
(3, 4),
(4, 4),
(5, 6),
(6, 2),
(7, 2),
(8, 3),
(9, 3),
(10, 3),
(11, 8),
(12, 8),
(13, 5);

-- --------------------------------------------------------

--
-- Table structure for table `TypeIngredients`
--

CREATE TABLE `TypeIngredients` (
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TypeIngredients`
--

INSERT INTO `TypeIngredients` (`Nom`) VALUES
('Boissons'),
('Cereales'),
('Condiments'),
('Fruits'),
('Fruits de Mer'),
('Herbes'),
('Huiles'),
('Legumes'),
('Légumineuses'),
('Noix et Graines'),
('Oeufs'),
('Poissons'),
('Préparés'),
('Produits Laitiers'),
('Sucres et Douceurs'),
('Viandes et Volailles');

-- --------------------------------------------------------

--
-- Table structure for table `TypesPlats`
--

CREATE TABLE `TypesPlats` (
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TypesPlats`
--

INSERT INTO `TypesPlats` (`Nom`) VALUES
('Boissons'),
('Desserts'),
('Entrées'),
('Plats');

-- --------------------------------------------------------

--
-- Table structure for table `Utilisateurs`
--

CREATE TABLE `Utilisateurs` (
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `MotDePasse` varchar(255) NOT NULL,
  `Role` varchar(255) DEFAULT NULL,
  `refreshToken` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`Nom`, `Prenom`, `Email`, `MotDePasse`, `Role`, `refreshToken`) VALUES
('COURTARA', 'Adam', 'adamcourtara@gmail.com', '$2b$10$Ob9GBImg8BZo6ryd2pGFf.DHz/QwOi5DGeGSsyMbfVYaVBL1Wtn2O', 'Utilisateur', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkYW1jb3VydGFyYUBnbWFpbC5jb20iLCJyb2xlcyI6IlV0aWxpc2F0ZXVyIiwiaWF0IjoxNzEyMjQ4ODk5LCJleHAiOjE3MTI4NTM2OTl9.xCnGHS9AsAJIgQmK_ePL8-C7-9BVD1gsIAUEjsXoURw'),
('GARIBALDI', 'Alexis', 'garibaldialexis@gmail.com', '$2b$10$OahGTmggffoF0Hl4s0YSQ.OioXjHn/meKjR1fmwU0Yc2YFRFLqs4u', 'Administrateur', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImdhcmliYWxkaWFsZXhpc0BnbWFpbC5jb20iLCJyb2xlcyI6IkFkbWluaXN0cmF0ZXVyIiwiaWF0IjoxNzEyMjQ5MTA0LCJleHAiOjE3MTI4NTM5MDR9.SHxaSZ9PYQ-jelUmIgD__I5JAjcTbKiDjyyetBrjTus'),
('zuckerberg', 'Mark', 'mr.facebook@gmail.com', '$2b$10$veqADWcz9SJlIWVlmwcd/.CfmWb.EuIcLskyejPe9FTDu41SftPWa', 'Utilisateur', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1yLmZhY2Vib29rQGdtYWlsLmNvbSIsInJvbGVzIjoiVXRpbGlzYXRldXIiLCJpYXQiOjE3MTIyNDg5NDksImV4cCI6MTcxMjg1Mzc0OX0.TTBmMtZxQfcfDTxzepHzqkdfA0-a3_SImqcXBu7HV2Q'),
('Meriot', 'Matthieu', 'thelegendofzelda@gmail.com', '$2b$10$ad3cVCnJOlI9Pa0dCbQYiuslwhPcwOALjPFK/.HfTcvqB2L06Rh26', 'Utilisateur', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRoZWxlZ2VuZG9memVsZGFAZ21haWwuY29tIiwicm9sZXMiOiJVdGlsaXNhdGV1ciIsImlhdCI6MTcxMjI0ODk3MSwiZXhwIjoxNzEyODUzNzcxfQ.-mBlv5RV6zUzqAkFh8RFBYO-UJRdVsnwEQqsjKroVhM');

-- --------------------------------------------------------

--
-- Table structure for table `UtilisateursAllergies`
--

CREATE TABLE `UtilisateursAllergies` (
  `Utilisateur` varchar(255) NOT NULL,
  `Allergie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UtilisateursRestrictions`
--

CREATE TABLE `UtilisateursRestrictions` (
  `Utilisateur` varchar(255) NOT NULL,
  `Restriction` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Additions`
--
ALTER TABLE `Additions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Plats` (`Plats`),
  ADD KEY `Reservations` (`Reservations`);

--
-- Indexes for table `AdditionsPlats`
--
ALTER TABLE `AdditionsPlats`
  ADD PRIMARY KEY (`Plat`,`Addition`),
  ADD KEY `Addition` (`Addition`);

--
-- Indexes for table `Allergies`
--
ALTER TABLE `Allergies`
  ADD PRIMARY KEY (`Nom`);

--
-- Indexes for table `FormuleDuJour`
--
ALTER TABLE `FormuleDuJour`
  ADD PRIMARY KEY (`Date`),
  ADD KEY `MenuID` (`MenuID`);

--
-- Indexes for table `Ingredients`
--
ALTER TABLE `Ingredients`
  ADD PRIMARY KEY (`Nom`),
  ADD KEY `Type` (`Type`);

--
-- Indexes for table `Inventaires`
--
ALTER TABLE `Inventaires`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Date` (`Date`);

--
-- Indexes for table `Menus`
--
ALTER TABLE `Menus`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Menu` (`Menu`);

--
-- Indexes for table `MenusPlats`
--
ALTER TABLE `MenusPlats`
  ADD KEY `fk_MenuID` (`MenuID`),
  ADD KEY `fk_PlatID` (`PlatID`);

--
-- Indexes for table `Nettoyages`
--
ALTER TABLE `Nettoyages`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Date` (`Date`);

--
-- Indexes for table `Plats`
--
ALTER TABLE `Plats`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Types` (`Types`);

--
-- Indexes for table `PlatsIngredients`
--
ALTER TABLE `PlatsIngredients`
  ADD PRIMARY KEY (`Plat`,`Ingredients`),
  ADD KEY `Ingredients` (`Ingredients`);

--
-- Indexes for table `Reservations`
--
ALTER TABLE `Reservations`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `DateHeure` (`DateHeure`),
  ADD KEY `Statut` (`Statut`);

--
-- Indexes for table `ReservationsTables`
--
ALTER TABLE `ReservationsTables`
  ADD PRIMARY KEY (`Reservation`,`Table`),
  ADD KEY `Table` (`Table`);

--
-- Indexes for table `Restrictions`
--
ALTER TABLE `Restrictions`
  ADD PRIMARY KEY (`Type`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`Nom`);

--
-- Indexes for table `Statuts`
--
ALTER TABLE `Statuts`
  ADD PRIMARY KEY (`Nom`);

--
-- Indexes for table `Tables`
--
ALTER TABLE `Tables`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TypeIngredients`
--
ALTER TABLE `TypeIngredients`
  ADD PRIMARY KEY (`Nom`);

--
-- Indexes for table `TypesPlats`
--
ALTER TABLE `TypesPlats`
  ADD PRIMARY KEY (`Nom`);

--
-- Indexes for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `Role` (`Role`);

--
-- Indexes for table `UtilisateursAllergies`
--
ALTER TABLE `UtilisateursAllergies`
  ADD PRIMARY KEY (`Utilisateur`,`Allergie`),
  ADD KEY `Allergie` (`Allergie`);

--
-- Indexes for table `UtilisateursRestrictions`
--
ALTER TABLE `UtilisateursRestrictions`
  ADD PRIMARY KEY (`Utilisateur`,`Restriction`),
  ADD KEY `Restriction` (`Restriction`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Additions`
--
ALTER TABLE `Additions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Inventaires`
--
ALTER TABLE `Inventaires`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `Menus`
--
ALTER TABLE `Menus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Nettoyages`
--
ALTER TABLE `Nettoyages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `Plats`
--
ALTER TABLE `Plats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `Reservations`
--
ALTER TABLE `Reservations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `Tables`
--
ALTER TABLE `Tables`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Additions`
--
ALTER TABLE `Additions`
  ADD CONSTRAINT `Additions_ibfk_2` FOREIGN KEY (`Reservations`) REFERENCES `Reservations` (`ID`);

--
-- Constraints for table `AdditionsPlats`
--
ALTER TABLE `AdditionsPlats`
  ADD CONSTRAINT `AdditionsPlats_ibfk_2` FOREIGN KEY (`Addition`) REFERENCES `Additions` (`ID`);

--
-- Constraints for table `FormuleDuJour`
--
ALTER TABLE `FormuleDuJour`
  ADD CONSTRAINT `FormuleDuJour_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `Menus` (`ID`);

--
-- Constraints for table `Ingredients`
--
ALTER TABLE `Ingredients`
  ADD CONSTRAINT `Ingredients_ibfk_1` FOREIGN KEY (`Type`) REFERENCES `TypeIngredients` (`Nom`);

--
-- Constraints for table `MenusPlats`
--
ALTER TABLE `MenusPlats`
  ADD CONSTRAINT `fk_MenuID` FOREIGN KEY (`MenuID`) REFERENCES `Menus` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PlatID` FOREIGN KEY (`PlatID`) REFERENCES `Plats` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Plats`
--
ALTER TABLE `Plats`
  ADD CONSTRAINT `Plats_ibfk_1` FOREIGN KEY (`Types`) REFERENCES `TypesPlats` (`Nom`);

--
-- Constraints for table `PlatsIngredients`
--
ALTER TABLE `PlatsIngredients`
  ADD CONSTRAINT `PlatsIngredients_ibfk_2` FOREIGN KEY (`Ingredients`) REFERENCES `Ingredients` (`Nom`);

--
-- Constraints for table `Reservations`
--
ALTER TABLE `Reservations`
  ADD CONSTRAINT `Reservations_ibfk_2` FOREIGN KEY (`Statut`) REFERENCES `Statuts` (`Nom`);

--
-- Constraints for table `ReservationsTables`
--
ALTER TABLE `ReservationsTables`
  ADD CONSTRAINT `ReservationsTables_ibfk_1` FOREIGN KEY (`Reservation`) REFERENCES `Reservations` (`ID`),
  ADD CONSTRAINT `ReservationsTables_ibfk_2` FOREIGN KEY (`Table`) REFERENCES `Tables` (`ID`);

--
-- Constraints for table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD CONSTRAINT `Utilisateurs_ibfk_1` FOREIGN KEY (`Role`) REFERENCES `Roles` (`Nom`);

--
-- Constraints for table `UtilisateursAllergies`
--
ALTER TABLE `UtilisateursAllergies`
  ADD CONSTRAINT `UtilisateursAllergies_ibfk_1` FOREIGN KEY (`Utilisateur`) REFERENCES `Utilisateurs` (`Email`),
  ADD CONSTRAINT `UtilisateursAllergies_ibfk_2` FOREIGN KEY (`Allergie`) REFERENCES `Allergies` (`Nom`);

--
-- Constraints for table `UtilisateursRestrictions`
--
ALTER TABLE `UtilisateursRestrictions`
  ADD CONSTRAINT `UtilisateursRestrictions_ibfk_1` FOREIGN KEY (`Utilisateur`) REFERENCES `Utilisateurs` (`Email`),
  ADD CONSTRAINT `UtilisateursRestrictions_ibfk_2` FOREIGN KEY (`Restriction`) REFERENCES `Restrictions` (`Type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
