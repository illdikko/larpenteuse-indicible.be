-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 21 avr. 2025 à 03:53
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `atelier_arpenteuse`
--

-- --------------------------------------------------------

--
-- Structure de la table `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `operator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `collection`
--

INSERT INTO `collection` (`id`, `label`, `description`, `created_at`, `operator_id`) VALUES
(1, 'Artefacts Maudits', 'Une collection d\'objets maudits et interdits.', '2025-04-20 22:13:28', NULL),
(2, 'Livres Occultes', 'Une collection de livres interdits et dangereux.', '2025-04-20 22:23:30', NULL),
(3, 'Figurines Mythiques', 'Une collection de figurines représentant des créatures mythiques.', '2025-04-20 22:23:30', NULL),
(4, 'Collection inexistante', 'Description', '2025-04-20 23:20:39', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `collection_item`
--

CREATE TABLE `collection_item` (
  `id` int(11) NOT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `collection_item`
--

INSERT INTO `collection_item` (`id`, `collection_id`, `item_id`) VALUES
(1, 1, NULL),
(2, 1, 2),
(5, 1, 777),
(6, 2, NULL),
(7, 2, 4),
(8, 3, 2),
(9, 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `type` enum('bota','zoo','brol') NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `date_de_mise_en_vente` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL,
  `primary_picture` text DEFAULT NULL,
  `secondary_picture` text DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL,
  `operator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `type`, `label`, `slug`, `date_de_mise_en_vente`, `created_at`, `updated_at`, `description`, `primary_picture`, `secondary_picture`, `prix`, `operator_id`) VALUES
(2, 'zoo', 'Statuette de Cthulhu', 'statuette-de-cthulhu', '2023-10-02 12:30:00', '2025-04-20 22:13:28', '2025-04-20 22:13:28', 'Une statuette représentant le Grand Ancien Cthulhu.', 'statuette_cthulhu.jpg', 'statuette_cthulhu_2.jpg', 499.99, 2),
(4, 'bota', 'Manuscrit Voynich', 'manuscrit-voynich', '2023-10-04 13:30:00', '2025-04-20 22:20:03', '2025-04-20 22:20:03', 'Un manuscrit indéchiffrable aux pouvoirs mystérieux.', 'manuscrit_voynich.jpg', 'manuscrit_voynich_2.jpg', 799.99, NULL),
(5, 'zoo', 'Figurine de Nyarlathotep', 'figurine-de-nyarlathotep', '2023-10-05 10:45:00', '2025-04-20 22:20:03', '2025-04-20 22:20:03', 'Une figurine du Chaos Rampant, Nyarlathotep.', 'figurine_nyarlathotep.jpg', 'figurine_nyarlathotep_2.jpg', 599.99, 1),
(12, 'bota', 'Grimoire de R\'lyeh', 'grimoire-de-rlyeh', '2023-10-01 08:00:00', '2025-04-20 22:55:30', '2025-04-20 22:55:30', 'Un livre maudit contenant des incantations interdites.', 'grimoire_rlyeh.jpg', 'grimoire_rlyeh_2.jpg', 999.99, 1),
(777, 'brol', 'Amulette de Yog-Sothoth', 'amulette-de-yog-sothoth', '2025-04-21 00:20:29', '2025-04-20 22:20:03', '2025-04-21 00:20:29', 'Une amulette protectrice contre les forces du mal.', 'amulette_yog_sothoth.jpg', 'amulette_yog_sothoth_2.jpg', 399.99, 3);

-- --------------------------------------------------------

--
-- Structure de la table `item_tag`
--

CREATE TABLE `item_tag` (
  `item_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `item_tag`
--

INSERT INTO `item_tag` (`item_id`, `tag_id`) VALUES
(2, 999),
(2, 4),
(777, 4),
(777, 6),
(4, 3),
(4, 5),
(5, 999),
(5, 6),
(2, 4),
(777, 4),
(777, 6),
(4, 3),
(4, 5),
(5, 999),
(5, 6);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `date_de_réception` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nom` varchar(100) NOT NULL,
  `prénom` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `téléphone` varchar(20) DEFAULT NULL,
  `contenu` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `date_de_réception`, `nom`, `prénom`, `email`, `téléphone`, `contenu`, `is_read`) VALUES
(1, '2023-10-03 07:00:00', 'Lovecraft', 'Howard', 'howard.lovecraft@example.com', '0475123456', 'Attention, ne lisez pas le Grimoire à voix haute!', 0),
(2, '2023-10-04 08:15:00', 'Derleth', 'August', 'august.derleth@example.com', '0475654321', 'Avez-vous trouvé la statuette de Cthulhu?', 0),
(3, '2023-10-05 09:30:00', 'Smith', 'Clark Ashton', 'clark.smith@example.com', '0475987654', 'L\'amulette de Yog-Sothoth est-elle toujours disponible?', 0);

-- --------------------------------------------------------

--
-- Structure de la table `operator`
--

CREATE TABLE `operator` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prénom` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` enum('admin','visiteur') NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `operator`
--

INSERT INTO `operator` (`id`, `nom`, `prénom`, `username`, `email`, `role`, `last_login`, `created_at`, `deleted_at`) VALUES
(1, 'Lovecraft', 'Howard', 'hlovecraft', 'nouvel.email@example.com', 'admin', '2025-04-21 00:48:33', '2025-04-20 22:13:28', NULL),
(2, 'Derleth', 'August', 'aderleth', 'august.derleth@example.com', 'visiteur', '2025-04-20 22:25:39', '2025-04-20 22:13:28', NULL),
(3, 'Smith', 'Clark Ashton', 'csmith', 'clark.smith@example.com', 'visiteur', '2025-04-21 00:37:20', '2025-04-20 22:20:03', NULL),
(19, 'Dupont', 'Jean', 'jdupont1', 'jean.dupont@example.com', 'admin', '2025-04-20 23:31:47', '2025-04-20 23:31:47', NULL),
(20, 'Martin', 'Sophie', 'smartin2', 'jean.dupont@example.com', 'visiteur', '2025-04-20 23:31:47', '2025-04-20 23:31:47', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tag`
--

INSERT INTO `tag` (`id`, `label`, `slug`) VALUES
(3, 'Mythes', 'mythes'),
(4, 'Artefacts', 'artefacts'),
(5, 'Livres Interdits', 'livres-interdits'),
(6, 'Créatures', 'créatures'),
(999, 'Grand Ancien', 'grand-ancien');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_operator` (`operator_id`);

--
-- Index pour la table `collection_item`
--
ALTER TABLE `collection_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collection_item_ibfk_1` (`item_id`),
  ADD KEY `collection_item_ibfk_2` (`collection_id`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `operator_id` (`operator_id`);

--
-- Index pour la table `item_tag`
--
ALTER TABLE `item_tag`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `collection_item`
--
ALTER TABLE `collection_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=778;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `operator`
--
ALTER TABLE `operator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `collection`
--
ALTER TABLE `collection`
  ADD CONSTRAINT `fk_operator` FOREIGN KEY (`operator_id`) REFERENCES `operator` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `collection_item`
--
ALTER TABLE `collection_item`
  ADD CONSTRAINT `collection_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `collection_item_ibfk_2` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `operator` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `item_tag`
--
ALTER TABLE `item_tag`
  ADD CONSTRAINT `item_tag_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
