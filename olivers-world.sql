-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 30 mars 2024 à 01:35
-- Version du serveur : 11.3.2-MariaDB
-- Version de PHP : 8.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `olivers-world`
--

-- --------------------------------------------------------

--
-- Structure de la table `Additions`
--

CREATE TABLE `Additions` (
  `ID` int(11) NOT NULL,
  `Plats` varchar(255) NOT NULL,
  `DateHeure` datetime NOT NULL,
  `Reservations` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `AdditionsPlats`
--

CREATE TABLE `AdditionsPlats` (
  `Plat` varchar(255) NOT NULL,
  `Addition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Allergies`
--

CREATE TABLE `Allergies` (
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Allergies`
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
-- Doublure de structure pour la vue `countpersonneday`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `countpersonneday` (
`TotalPersonnes` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Structure de la table `Ingredients`
--

CREATE TABLE `Ingredients` (
  `Nom` varchar(255) NOT NULL,
  `Type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Ingredients`
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
-- Structure de la table `Menus`
--

CREATE TABLE `Menus` (
  `Menu` varchar(255) NOT NULL,
  `Prix` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Menus`
--

INSERT INTO `Menus` (`Menu`, `Prix`) VALUES
('Classiques du Bistrot', 20.00),
('Végétarien Gourmand', 20.00),
('Voyage en Mer', 20.00);

-- --------------------------------------------------------

--
-- Structure de la table `MenusPlats`
--

CREATE TABLE `MenusPlats` (
  `Menu` varchar(255) NOT NULL,
  `Plat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `MenusPlats`
--

INSERT INTO `MenusPlats` (`Menu`, `Plat`) VALUES
('Classiques du Bistrot', 'Boeuf Bourguignon'),
('Voyage en Mer', 'Bouillabaisse'),
('Classiques du Bistrot', 'Cassoulet'),
('Voyage en Mer', 'Ceviche'),
('Classiques du Bistrot', 'Crème Brûlée'),
('Végétarien Gourmand', 'Falafel Wrap'),
('Végétarien Gourmand', 'Gazpacho'),
('Voyage en Mer', 'Moules Marinières'),
('Classiques du Bistrot', 'Quiche Lorraine'),
('Classiques du Bistrot', 'Ratatouille'),
('Végétarien Gourmand', 'Ratatouille'),
('Végétarien Gourmand', 'Salade de Quinoa'),
('Végétarien Gourmand', 'Salade Niçoise'),
('Classiques du Bistrot', 'Sangria'),
('Voyage en Mer', 'Tarte Tatin'),
('Végétarien Gourmand', 'Tiramisu');

-- --------------------------------------------------------

--
-- Structure de la table `Plats`
--

CREATE TABLE `Plats` (
  `Nom` varchar(255) NOT NULL,
  `Prix` decimal(10,2) NOT NULL,
  `Types` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Plats`
--

INSERT INTO `Plats` (`Nom`, `Prix`, `Types`) VALUES
('Boeuf Bourguignon', 22.00, 'Plats principaux'),
('Bouillabaisse', 18.00, 'Fruits de mer'),
('Cassoulet', 20.00, 'Plats principaux'),
('Ceviche', 17.00, 'Fruits de mer'),
('Crème Brûlée', 10.00, 'Desserts'),
('Falafel Wrap', 11.00, 'Plats végétaliens'),
('Gazpacho', 8.00, 'Soupes'),
('Margherita Pizza', 10.00, 'Pizzas'),
('Moules Marinières', 16.00, 'Fruits de mer'),
('Paella', 19.00, 'Plats principaux'),
('Quiche Lorraine', 14.00, 'Entrées'),
('Ratatouille', 12.00, 'Plats végétariens'),
('Ravioli Ricotta e Spinaci', 13.00, 'Pâtes'),
('Risotto aux Champignons', 14.00, 'Plats principaux'),
('Salade de Quinoa', 12.00, 'Plats végétariens'),
('Salade Niçoise', 13.00, 'Salades'),
('Sangria', 7.00, 'Boissons alcoolisées'),
('Spaghetti Carbonara', 15.00, 'Pâtes'),
('Tarte Tatin', 9.00, 'Desserts'),
('Tiramisu', 11.00, 'Desserts');

-- --------------------------------------------------------

--
-- Structure de la table `PlatsIngredients`
--

CREATE TABLE `PlatsIngredients` (
  `Plat` varchar(255) NOT NULL,
  `Ingredients` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `PlatsIngredients`
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
-- Structure de la table `Reservations`
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
-- Déchargement des données de la table `Reservations`
--

INSERT INTO `Reservations` (`ID`, `Email`, `Nom`, `DateHeure`, `NbPersonnes`, `Statut`) VALUES
(75, 'Djej', 'djej@djej.djej', '2024-03-30 12:00:00', 1, 'Prise'),
(77, 'Djaj', 'djaj@djaj.djaj', '2024-03-30 12:05:00', 1, 'Prise'),
(79, 'Djej', 'djaj@djaj.djaj', '2024-03-30 12:10:00', 1, 'Prise'),
(80, 'dfdfdf', 'ddfdf', '2024-03-30 12:15:00', 1, 'Prise'),
(82, 'aaaaa', 'jjjj', '2024-03-30 12:25:00', 1, 'Prise');

-- --------------------------------------------------------

--
-- Structure de la table `ReservationsTables`
--

CREATE TABLE `ReservationsTables` (
  `Reservation` int(11) NOT NULL,
  `Table` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Restrictions`
--

CREATE TABLE `Restrictions` (
  `Type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Restrictions`
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
-- Structure de la table `Roles`
--

CREATE TABLE `Roles` (
  `Nom` varchar(255) NOT NULL,
  `Permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Roles`
--

INSERT INTO `Roles` (`Nom`, `Permissions`) VALUES
('Administrateur', '2'),
('Moderateur', '1'),
('Utilisateur', '0');

-- --------------------------------------------------------

--
-- Structure de la table `Statuts`
--

CREATE TABLE `Statuts` (
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Statuts`
--

INSERT INTO `Statuts` (`Nom`) VALUES
('Annulé'),
('En cours'),
('Prise'),
('Terminer');

-- --------------------------------------------------------

--
-- Structure de la table `Tables`
--

CREATE TABLE `Tables` (
  `ID` int(11) NOT NULL,
  `NbCouverts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Tables`
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
-- Structure de la table `TypeIngredients`
--

CREATE TABLE `TypeIngredients` (
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `TypeIngredients`
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
-- Structure de la table `TypesPlats`
--

CREATE TABLE `TypesPlats` (
  `Nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `TypesPlats`
--

INSERT INTO `TypesPlats` (`Nom`) VALUES
('Amuse-bouches'),
('Boissons alcoolisées'),
('Boissons non alcoolisées'),
('Desserts'),
('Entrées'),
('Fruits de mer'),
('Grillades'),
('Pâtes'),
('Pizzas'),
('Plats principaux'),
('Plats végétaliens'),
('Plats végétariens'),
('Salades'),
('Soupes'),
('Tapas');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateurs`
--

CREATE TABLE `Utilisateurs` (
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `MotDePasse` varchar(255) NOT NULL,
  `Role` varchar(255) DEFAULT NULL,
  `refreshToken` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`Nom`, `Prenom`, `Email`, `MotDePasse`, `Role`, `refreshToken`) VALUES
('Carlito', 'Carlito', 'carlito@carlito.carlito', '$2b$10$VicTb5Q5Ql7UPhhL285P3usj10M8tj5BtwW0LVdWxfyCt82QivQVO', 'Utilisateur', ''),
('Djej', 'Djej', 'djej@djej.djej', '$2b$10$W0NBggrzZlGko6hBE1Q2te0QoGDt8oig5Rg.jEVPM6y7VSlioajzW', 'Administrateur', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRqZWpAZGplai5kamVqIiwicm9sZXMiOiJBZG1pbmlzdHJhdGV1ciIsImlhdCI6MTcxMTc2MDAwNSwiZXhwIjoxNzEyMzY0ODA1fQ.02sa5Pdmtx23ezATzxUCpVaqXu203M1wt14pVloPdg0'),
('Terry', 'Davis', 'je.suis@schizophrene.aol', '$2b$10$LEOYpil6eJtjUfdRNa1Ae.ZNUBNfB.JzprQJSdL94QvEB6VY0CkN6', 'Utilisateur', ''),
('Jesus', 'Christ', 'jesus@christ.fr', '$2b$10$6jtLIsz4Bt4nMTXHgeLI5ehCP34sHliBItvViwKrYrSLTnQFmQ/BC', 'Utilisateur', ''),
('Mac', 'Fly', 'macfly@macfly.macfly', '$2b$10$AoZGjFosNQVZf4PfEFnL3O.rlD9w9v.8GSx2Ys409GRZOYWO.rLJS', 'Utilisateur', ''),
('Zongo', 'Logo', 'Zongolo@logogo.go', '$2b$10$vJ2HKmcbg6EiAk8bdVceO.T2Hqq2jjwe9PlD4xWv2xHnRmzhBGDie', 'Utilisateur', '');

-- --------------------------------------------------------

--
-- Structure de la table `UtilisateursAllergies`
--

CREATE TABLE `UtilisateursAllergies` (
  `Utilisateur` varchar(255) NOT NULL,
  `Allergie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `UtilisateursRestrictions`
--

CREATE TABLE `UtilisateursRestrictions` (
  `Utilisateur` varchar(255) NOT NULL,
  `Restriction` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la vue `countpersonneday`
--
DROP TABLE IF EXISTS `countpersonneday`;

CREATE ALGORITHM=UNDEFINED DEFINER=`syn`@`localhost` SQL SECURITY DEFINER VIEW `countpersonneday`  AS SELECT sum(`reservations`.`NbPersonnes`) AS `TotalPersonnes` FROM `reservations` WHERE (`reservations`.`Statut` = 'Prise' OR `reservations`.`Statut` = 'En cours') AND `reservations`.`DateHeure` >= curdate() AND `reservations`.`DateHeure` < curdate() + interval 1 day ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Additions`
--
ALTER TABLE `Additions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Plats` (`Plats`),
  ADD KEY `Reservations` (`Reservations`);

--
-- Index pour la table `AdditionsPlats`
--
ALTER TABLE `AdditionsPlats`
  ADD PRIMARY KEY (`Plat`,`Addition`),
  ADD KEY `Addition` (`Addition`);

--
-- Index pour la table `Allergies`
--
ALTER TABLE `Allergies`
  ADD PRIMARY KEY (`Nom`);

--
-- Index pour la table `Ingredients`
--
ALTER TABLE `Ingredients`
  ADD PRIMARY KEY (`Nom`),
  ADD KEY `Type` (`Type`);

--
-- Index pour la table `Menus`
--
ALTER TABLE `Menus`
  ADD PRIMARY KEY (`Menu`);

--
-- Index pour la table `MenusPlats`
--
ALTER TABLE `MenusPlats`
  ADD PRIMARY KEY (`Menu`,`Plat`),
  ADD KEY `Plat` (`Plat`);

--
-- Index pour la table `Plats`
--
ALTER TABLE `Plats`
  ADD PRIMARY KEY (`Nom`),
  ADD KEY `Types` (`Types`);

--
-- Index pour la table `PlatsIngredients`
--
ALTER TABLE `PlatsIngredients`
  ADD PRIMARY KEY (`Plat`,`Ingredients`),
  ADD KEY `Ingredients` (`Ingredients`);

--
-- Index pour la table `Reservations`
--
ALTER TABLE `Reservations`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `DateHeure` (`DateHeure`),
  ADD KEY `Statut` (`Statut`);

--
-- Index pour la table `ReservationsTables`
--
ALTER TABLE `ReservationsTables`
  ADD PRIMARY KEY (`Reservation`,`Table`),
  ADD KEY `Table` (`Table`);

--
-- Index pour la table `Restrictions`
--
ALTER TABLE `Restrictions`
  ADD PRIMARY KEY (`Type`);

--
-- Index pour la table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`Nom`);

--
-- Index pour la table `Statuts`
--
ALTER TABLE `Statuts`
  ADD PRIMARY KEY (`Nom`);

--
-- Index pour la table `Tables`
--
ALTER TABLE `Tables`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `TypeIngredients`
--
ALTER TABLE `TypeIngredients`
  ADD PRIMARY KEY (`Nom`);

--
-- Index pour la table `TypesPlats`
--
ALTER TABLE `TypesPlats`
  ADD PRIMARY KEY (`Nom`);

--
-- Index pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `Role` (`Role`);

--
-- Index pour la table `UtilisateursAllergies`
--
ALTER TABLE `UtilisateursAllergies`
  ADD PRIMARY KEY (`Utilisateur`,`Allergie`),
  ADD KEY `Allergie` (`Allergie`);

--
-- Index pour la table `UtilisateursRestrictions`
--
ALTER TABLE `UtilisateursRestrictions`
  ADD PRIMARY KEY (`Utilisateur`,`Restriction`),
  ADD KEY `Restriction` (`Restriction`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Additions`
--
ALTER TABLE `Additions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Reservations`
--
ALTER TABLE `Reservations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `Tables`
--
ALTER TABLE `Tables`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Additions`
--
ALTER TABLE `Additions`
  ADD CONSTRAINT `Additions_ibfk_2` FOREIGN KEY (`Reservations`) REFERENCES `Reservations` (`ID`);

--
-- Contraintes pour la table `AdditionsPlats`
--
ALTER TABLE `AdditionsPlats`
  ADD CONSTRAINT `AdditionsPlats_ibfk_1` FOREIGN KEY (`Plat`) REFERENCES `Plats` (`Nom`),
  ADD CONSTRAINT `AdditionsPlats_ibfk_2` FOREIGN KEY (`Addition`) REFERENCES `Additions` (`ID`);

--
-- Contraintes pour la table `Ingredients`
--
ALTER TABLE `Ingredients`
  ADD CONSTRAINT `Ingredients_ibfk_1` FOREIGN KEY (`Type`) REFERENCES `TypeIngredients` (`Nom`);

--
-- Contraintes pour la table `MenusPlats`
--
ALTER TABLE `MenusPlats`
  ADD CONSTRAINT `MenusPlats_ibfk_1` FOREIGN KEY (`Menu`) REFERENCES `Menus` (`Menu`),
  ADD CONSTRAINT `MenusPlats_ibfk_2` FOREIGN KEY (`Plat`) REFERENCES `Plats` (`Nom`);

--
-- Contraintes pour la table `Plats`
--
ALTER TABLE `Plats`
  ADD CONSTRAINT `Plats_ibfk_1` FOREIGN KEY (`Types`) REFERENCES `TypesPlats` (`Nom`);

--
-- Contraintes pour la table `PlatsIngredients`
--
ALTER TABLE `PlatsIngredients`
  ADD CONSTRAINT `PlatsIngredients_ibfk_1` FOREIGN KEY (`Plat`) REFERENCES `Plats` (`Nom`),
  ADD CONSTRAINT `PlatsIngredients_ibfk_2` FOREIGN KEY (`Ingredients`) REFERENCES `Ingredients` (`Nom`);

--
-- Contraintes pour la table `Reservations`
--
ALTER TABLE `Reservations`
  ADD CONSTRAINT `Reservations_ibfk_2` FOREIGN KEY (`Statut`) REFERENCES `Statuts` (`Nom`);

--
-- Contraintes pour la table `ReservationsTables`
--
ALTER TABLE `ReservationsTables`
  ADD CONSTRAINT `ReservationsTables_ibfk_1` FOREIGN KEY (`Reservation`) REFERENCES `Reservations` (`ID`),
  ADD CONSTRAINT `ReservationsTables_ibfk_2` FOREIGN KEY (`Table`) REFERENCES `Tables` (`ID`);

--
-- Contraintes pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD CONSTRAINT `Utilisateurs_ibfk_1` FOREIGN KEY (`Role`) REFERENCES `Roles` (`Nom`);

--
-- Contraintes pour la table `UtilisateursAllergies`
--
ALTER TABLE `UtilisateursAllergies`
  ADD CONSTRAINT `UtilisateursAllergies_ibfk_1` FOREIGN KEY (`Utilisateur`) REFERENCES `Utilisateurs` (`Email`),
  ADD CONSTRAINT `UtilisateursAllergies_ibfk_2` FOREIGN KEY (`Allergie`) REFERENCES `Allergies` (`Nom`);

--
-- Contraintes pour la table `UtilisateursRestrictions`
--
ALTER TABLE `UtilisateursRestrictions`
  ADD CONSTRAINT `UtilisateursRestrictions_ibfk_1` FOREIGN KEY (`Utilisateur`) REFERENCES `Utilisateurs` (`Email`),
  ADD CONSTRAINT `UtilisateursRestrictions_ibfk_2` FOREIGN KEY (`Restriction`) REFERENCES `Restrictions` (`Type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
