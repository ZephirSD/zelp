-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 25 juil. 2023 à 11:16
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zelpData`
--

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id` int(11) NOT NULL,
  `avis_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230724053002', '2023-07-24 05:30:27', 36),
('DoctrineMigrations\\Version20230724053342', '2023-07-24 05:33:50', 52),
('DoctrineMigrations\\Version20230724054122', '2023-07-24 05:41:29', 47),
('DoctrineMigrations\\Version20230725070059', '2023-07-25 07:01:10', 48),
('DoctrineMigrations\\Version20230725072926', '2023-07-25 07:29:37', 53),
('DoctrineMigrations\\Version20230725111527', '2023-07-25 11:15:34', 77);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL,
  `ville_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `restaurant`
--

INSERT INTO `restaurant` (`id`, `ville_id`, `user_id`, `name`, `description`, `created_at`) VALUES
(1, NULL, NULL, 'Le Cantonais', 'Restaurant Saint André', '2023-07-25 08:01:06'),
(2, NULL, NULL, 'Restaurant Bon Enfants', 'restaurants', '2023-07-25 08:01:57');

-- --------------------------------------------------------

--
-- Structure de la table `restaurant_picture`
--

CREATE TABLE `restaurant_picture` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(6, 'da@mail.com', '[\"ROLE_RESTO\"]', '$2y$13$0mHIUJlni88wurMUTPttE.Ik1LHY.cqTee2euiG6IP1FvkUA2GUbO', 'test', 'test'),
(7, 'si@mail.re', '[]', '$2y$13$6dojkVVtkXWf22y/qPTbf.knb8RSRof6b/G1AxXs38qSn3pwBNyC6', 'test', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_postal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `name`, `code_postal`) VALUES
(86, 'BRAS PANON', '97412'),
(87, 'CILAOS', '97413'),
(88, 'ENTRE DEUX', '97414'),
(89, 'L ETANG SALE', '97427'),
(90, 'LA PLAINE DES PALMISTES', '97431'),
(91, 'LA POSSESSION', '97419'),
(92, 'LE PORT', '97420'),
(93, 'LE TAMPON', '97418'),
(94, 'LE TAMPON', '97430'),
(95, 'LES AVIRONS', '97425'),
(96, 'LES TROIS BASSINS', '97426'),
(97, 'PETITE ILE', '97429'),
(98, 'SALAZIE', '97433'),
(99, 'ST ANDRE', '97440'),
(100, 'ST BENOIT', '97437'),
(101, 'ST BENOIT', '97470'),
(102, 'ST DENIS', '97400'),
(103, 'ST DENIS', '97417'),
(104, 'ST DENIS', '97490'),
(105, 'ST JOSEPH', '97480'),
(106, 'ST LEU', '97416'),
(107, 'ST LEU', '97424'),
(108, 'ST LEU', '97436'),
(109, 'ST LOUIS', '97421'),
(110, 'ST LOUIS', '97450'),
(111, 'ST PAUL', '97411'),
(112, 'ST PAUL', '97422'),
(113, 'ST PAUL', '97423'),
(114, 'ST PAUL', '97434'),
(115, 'ST PAUL', '97435'),
(116, 'ST PAUL', '97460'),
(117, 'ST PHILIPPE', '97442'),
(118, 'ST PIERRE', '97410'),
(119, 'ST PIERRE', '97432'),
(120, 'STE MARIE', '97438'),
(121, 'STE ROSE', '97439'),
(122, 'STE SUZANNE', '97441');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8F91ABF0197E709F` (`avis_id`),
  ADD KEY `IDX_8F91ABF0B1E7706E` (`restaurant_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EB95123FA73F0036` (`ville_id`),
  ADD KEY `IDX_EB95123FA76ED395` (`user_id`);

--
-- Index pour la table `restaurant_picture`
--
ALTER TABLE `restaurant_picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DC9013FCB1E7706E` (`restaurant_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `restaurant_picture`
--
ALTER TABLE `restaurant_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `FK_8F91ABF0197E709F` FOREIGN KEY (`avis_id`) REFERENCES `avis` (`id`),
  ADD CONSTRAINT `FK_8F91ABF0B1E7706E` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Contraintes pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `FK_EB95123FA73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`),
  ADD CONSTRAINT `FK_EB95123FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `restaurant_picture`
--
ALTER TABLE `restaurant_picture`
  ADD CONSTRAINT `FK_DC9013FCB1E7706E` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
