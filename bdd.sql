-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 13 juin 2021 à 12:58
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`, `description`, `parent`) VALUES
(1, 'Nourriture', 'Matière comestible essentielle pour survivre.', NULL),
(2, 'Ordinateur', 'Matériel électronique programmable.', NULL),
(3, 'Sandwich', 'Plat à base de pain et d\'ingrédient divers. Souvent une plante+une viande+une sauce.', 1),
(5, 'Pizza', 'Plat italien composé d\'une pâte proche de celle du pain étalée finement et recouverte de tomate.', 1),
(6, 'Monstre', 'Des créatures étranges proches des animaux.', NULL),
(7, 'Slime', 'Des monstres composés de liquide. Ils absorbent leurs proies.', 6),
(8, 'Démon', 'Des monstres venant tout droit des enfers qui cherchent à corrompre le cœur des hommes.', 6),
(9, 'Meuble', 'Gros objet que l\'on met dans les maisons et qui ne bougent pas.', NULL),
(10, 'Film', 'Enchainement d\'image qui raconte généralement une histoire.', NULL),
(11, 'Jeu vidéo', 'Application numérique provocant l\'amusement.', NULL),
(12, 'Rangement', 'Meuble qui permet d\'entreposer efficacement des objets.', 9),
(13, 'Cuisine', 'Meuble qui aide à la confection de nourriture.', 9),
(14, 'Chambre', 'Meuble qui aide à se reposer efficacement.', 9),
(15, 'Plante', 'Une espèce vivante peu loquace.', NULL),
(16, 'Smartphone', 'Des ordinateurs miniatures, portables, modulaires avec un écran tactile.', 2),
(17, 'Ordinateur Fixe', 'Ordinateur non portable.', 2),
(18, 'Ordinateur Portable', 'Un ordinateur portable tout inclus.', 2),
(19, 'Viande', 'Morceau de muscle d\'animal.', 1),
(20, 'Animal', 'Un être vivant qui bouge beaucoup.', NULL),
(21, 'Dragon', 'Un gros monstre volant qui crache du feu.', 6),
(22, 'Voiture', 'Un véhicule à moteur à essence qui roule.', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `panier` varchar(200) NOT NULL,
  `addresse` varchar(128) NOT NULL,
  `codepostal` int(5) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `compte` int(11) DEFAULT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`panier`, `addresse`, `codepostal`, `prenom`, `nom`, `compte`, `id_commande`) VALUES
('429:1;429:1', 'Rue du jambon', 6600, 'Samuel', 'Demont', 5, 5),
('429:1;429:1', 'Rue du jambon', 6600, 'Samuel', 'Demont', 5, 6),
('35:1;35:1;26:1:0;26:1:0', 'Rue de la saucisse', 8954, 'Jean Jacques', 'Dupont', NULL, 7),
('29:11', 'Rue du jambon', 6600, 'Samuel', 'Demont', 5, 8);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id_compte` int(20) NOT NULL,
  `mail` varchar(320) NOT NULL,
  `telephone` int(15) NOT NULL,
  `adresse` varchar(128) NOT NULL,
  `codepostal` int(5) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `panier` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(64) NOT NULL,
  `naissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id_compte`, `mail`, `telephone`, `adresse`, `codepostal`, `prenom`, `nom`, `is_male`, `panier`, `token`, `naissance`) VALUES
(5, 'samueldemont83@gmail.com', 695453592, 'Rue du jambon', 6600, 'Samuel', 'Demont', 1, '', 'f30a4dcc9f28e282d467703e22a335f902ff6e2f08b15b8386301f377b54ba73', '2002-04-26'),
(6, 'antoine.daniel@free.fr', 695453592, 'Salondelasaucisse', 8953, 'Daniel', 'Antoine', 1, '36:-1;36:1;36:1;36:1;36:1;36:1', '1f04d96d95739e4f6a35d9d5555fe696412f9d0a8182ecaea7a1fef87402c19f', '2021-06-26');

-- --------------------------------------------------------

--
-- Structure de la table `parametre`
--

CREATE TABLE `parametre` (
  `nom` varchar(20) NOT NULL,
  `option1` varchar(10) DEFAULT NULL,
  `option2` varchar(10) DEFAULT NULL,
  `option3` varchar(10) DEFAULT NULL,
  `id_parametre` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `option4` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `parametre`
--

INSERT INTO `parametre` (`nom`, `option1`, `option2`, `option3`, `id_parametre`, `id_produit`, `option4`) VALUES
('Corne', 'Taureau', 'Bouc', 'Licorne', 1, 21, NULL),
('Taille', '2 m', '1 m', ' 30 cm', 2, 22, NULL),
('Peau', '#ff0000', '#7c3f3f', '#9e5575', 3, 21, NULL),
('Bois', '#c87806', '#8b6c40', NULL, 4, 26, NULL),
('Base', 'Tomate', 'Crème', 'Sans', 5, 8, NULL),
('Fromage', 'Mozarella', 'Gruyère', 'Sans', 6, 8, NULL),
('Viande', 'Chorizo', 'Pepperoni', 'Lardon', 7, 8, NULL),
('Garniture', 'Olive', 'Anchois', 'Sans', 8, 8, NULL),
('Région', 'Alaska', 'France', 'Japon', 9, 5, NULL),
('Mémoire', '16Go', '32Go', '64Go', 10, 13, NULL),
('Couleur', '#f0f0f0', '#c5432f', NULL, 11, 28, NULL),
('Sauce', 'Niçoise', 'Italienne', 'Albanaise', 12, 6, NULL),
('Spécialité', 'Cuisine', 'Transport', 'Combat', 13, 20, NULL),
('Contenu', 'Homme', 'Gemme', 'Sans', 14, 24, NULL),
('Cuisson', 'Bleu', 'Saignant', 'A point', 15, 1, NULL),
('Couette', '#e2e2e2', '#b3fcf8', '#ecea87', 16, 30, '#ff7474'),
('Matelat', '#e2e2e2', '#bebebe', NULL, 17, 30, NULL),
('Boie', '#c98c00', '#97855e', '#6f5d34', 18, 30, '#a07554'),
('Processeur', 'Intel', 'AMD', 'MOTOROLA', 19, 14, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `reference` varchar(10) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `prix_ht` float NOT NULL,
  `taux_tva` int(3) NOT NULL,
  `photo` varchar(20) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `note` int(1) NOT NULL,
  `en_promotion` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `reference`, `nom`, `description`, `prix_ht`, `taux_tva`, `photo`, `id_categorie`, `note`, `en_promotion`) VALUES
(1, 'NVB0000001', 'Steak', 'Morceau de viande coupé d\'un bœuf mort. Peut être cuite, salée, ou séchée pour une meilleur conservation. Attention, la conservation est mauvaise!', 5.5, 5, 'steak.png', 19, 2, 0),
(4, 'NTC0000001', 'Quiche lorraine', 'Tarte avec garniture à l\'oeuf, à la crème et au lardon.', 4.52, 5, 'quiche.png', 1, 0, 0),
(5, 'NVP0000001', 'Saumon', 'Animal sous-marin très goutu.', 8.25, 6, 'saumon.png', 1, 4, 0),
(6, 'NPL0000001', 'Salade', 'Préparation à base de plante notemment de laitue', 3.4, 2, 'salade.png', 1, 3, 0),
(7, 'NTC0000001', 'Tourte', 'Tarte à la citrouille, sucré mais délicieux.', 8.75, 2, 'tarte.png', 1, 4, 0),
(8, 'NTP0000001', 'Pizza', 'Plat italien aux ingrédient aux couleurs de l\'Italie.', 7.5, 4, 'pizza.png', 5, 5, 0),
(9, 'NTP0000002', 'Marguerite', 'Plat italien aux ingrédient aux couleurs de l\'Italie.', 7.5, 4, 'pizza.png', 5, 4, 0),
(10, 'NTP0000003', 'Quatre fromage', 'Plat italien aux ingrédient aux couleurs de l\'Italie.', 8, 4, 'pizza.png', 5, 3, 0),
(11, 'NTP0000002', 'Tarte aux pommes', 'Tarte à la pomme et légèrement caramélisé.', 9, 2, 'tarte.png', 1, 4, 0),
(12, 'NTP0000003', 'Tarte aux poires', 'Tarte à la poire et légèrement caramélisé. Avec une touche de cannelle.', 9, 2, 'tarte.png', 1, 2, 0),
(13, 'OT00000001', 'Iphone', 'Téléphone-ordinateur portable modulaire avec écran tactile inclus.', 1100, 5, 'iphone.png', 16, 3, 1),
(14, 'OPC0000001', 'PC Multicolore', 'Ordinateur fixe gaming de haute qualité.', 2550, 5, 'pc_color.png', 17, 4, 0),
(15, 'OPC0000002', 'PC Jaune', 'Ordinateur fixe gaming de haute qualité.', 1900, 5, 'pc_yellow.png', 17, 3, 0),
(16, 'OPC0000003', 'PC Bleu', 'Ordinateur fixe gaming de haute qualité.', 2998, 5, 'pc_blue.png', 17, 4, 0),
(17, 'OPC0000004', 'PC Rouge', 'Ordinateur fixe gaming de haute qualité.', 2250, 5, 'pc_red.png', 17, 5, 0),
(18, 'MD00000001', 'Démon rouge', 'Démon volant résistant au feu avec un écran de 33 pouces.', 12506, 10, 'demon2.png', 8, 4, 1),
(19, 'MD00000002', 'Démon violet', 'Démon volant résistant à la maladie avec un grand appétit.', 15203, 10, 'demon1.png', 8, 3, 1),
(20, 'MD00000003', 'Démon blanc', 'Démon volant très intelligent. Adepte de la philosophie et du Candy Up.', 16532, 10, 'demon0.png', 8, 5, 1),
(21, 'MD00000004', 'Le Diable', 'Grand démon très puissant fournit sans son trident magique.', 156000, 10, 'demon3.png', 8, 5, 1),
(22, 'MS00000001', 'Slime vert', 'Slime agressif qui se divise à sa mort en deux plus petit slimes.', 2500, 10, 'slime1.png', 7, 4, 1),
(23, 'MS00000002', 'Slime bleu', 'Slime agressif particulièrement faible.', 2855, 10, 'slime2.png', 7, 3, 1),
(24, 'MS00000003', 'Roi slime', 'Énorme slime qui est à la tête d\'un clan de slime.', 5890, 10, 'slime3.png', 7, 2, 1),
(25, 'MS00000004', 'Slime rose', 'Petit slime mignon dont les excréments se vendent à bas prix.', 680, 10, 'slime4.png', 7, 3, 1),
(26, 'MM00000002', 'Coffre', 'Un rangement simple qui permet de stocker plusieurs milliers d\'objets.', 10, 5, 'coffre.png', 12, 3, 0),
(27, 'MM00000003', 'Double Coffre', 'Un rangement simple qui permet de stocker encore plus d\'objets.', 25, 5, 'coffre2.png', 12, 4, 0),
(28, 'MMC0000001', 'Frigogidaire', 'Un rangement qui permet de conserver de la nourriture beaucoup plus longtemps grâce à la puissance mystique du froid.', 220, 3, 'cuisine1.png', 13, 2, 0),
(29, 'MMC0000002', 'Cuisinière', 'Un outil indispensable pour la préparation de plats chauds de qualité.', 430, 3, 'cuisine2.png', 13, 4, 0),
(30, 'MMD0000001', 'Double Lit Exquis', 'Permet de dormir avec un confort inégalé', 430, 3, 'chambre1.png', 14, 5, 0),
(31, 'MMD0000002', 'Cage à oiseau', 'Permet de dormir avec un confort inégalé. Uniquement pour les oiseaux!', 56, 5, 'cage.png', 9, 1, 0),
(32, 'F000000001', 'Club de la bagarre', 'Un film.', 10, 25, 'film1.png', 10, 5, 0),
(33, 'F00000002', 'L\'ange Michel', 'L\'incroyable histoire d\'un artiste.', 10, 25, 'film2.png', 10, 5, 0),
(34, 'F00000003', 'Mains en l\'air!', 'Coronavirus es nos noseam es no BFM TV - Rico Rodrig <br/>\r\nFilm citoyen pour les citoyen à 125€', 125, 25, 'film3.png', 10, 4, 0),
(35, 'PA00000001', 'Arbre', 'Grande plante avec un tronc et des feuilles vertes.', 160, 5, 'arbre.png', 15, 3, 1),
(36, 'PA00000002', 'Arbre rose', 'Grande plante avec un tronc et des feuilles roses.', 220, 5, 'arbre2.png', 15, 4, 1),
(37, 'PA00000003', 'Buisson', 'Petite plante avec plein de feuilles vertes.', 85, 5, 'buisson.png', 15, 3, 0),
(38, 'PA00000004', 'Herbe', 'Petite plante verte.', 2.5, 5, 'herbe.png', 15, 1, 0),
(39, 'PA00000005', 'Herbe avec fleur', 'Petite plante verte avec des fleurs', 5, 5, 'fleur.png', 15, 1, 0),
(40, 'PA00000006', 'Algue', 'Petite plante verte aquatique.', 4.25, 5, 'algue.png', 15, 2, 0),
(41, 'PA00000007', 'Nénuphar', 'Petite plante vert à fleur qui flotte sur la surface de l\'eau.', 10.5, 5, 'nenuphar.png', 15, 3, 0),
(170, 'PA00000001', 'Préparation salé', '﻿De la nourriture chaud chaud vert que l\'on vous vend. Et c\'est tout...', 14, 10, 'plat01.png', 1, 3, 0),
(171, 'PA00000002', 'Manger belge', 'Un manger étrange pas cher vert que vous pouvez manger. Et c\'est tout...', 21, 10, 'plat02.png', 1, 4, 0),
(172, 'PA00000003', 'Manger froid', 'A bouffer beau pas cher amer que vous pouvez manger. Achetez le.', 15, 10, 'plat03.png', 1, 1, 0),
(173, 'PA00000004', 'Manger basque', 'Un plat beau beau amer que l\'on vous vend. Achetez le.', 23, 10, 'plat04.png', 1, 3, 0),
(174, 'PA00000005', 'Manger chaud', 'Un manger froid chaud dur que vous pouvez manger. Bonne journée!', 13, 10, 'plat05.png', 1, 5, 0),
(175, 'PA00000006', 'Manger belge', 'De la nourriture chaud beau vert que vous pouvez manger. Super!', 5, 10, 'plat06.png', 1, 4, 0),
(176, 'PA00000007', 'Préparation salé', 'Un manger froid chaud dur que vous pouvez manger. Bonne journée!', 4, 10, 'plat07.png', 1, 0, 0),
(177, 'PA00000008', 'Préparation froid', 'Un plat chaud agréable amer que vous pouvez manger. Bonne journée!', 0, 10, 'plat08.png', 1, 1, 0),
(178, 'PA00000009', 'Plat chaud', 'Un plat nourissant délicieux salé que l\'on vous vend. Super!', 8, 10, 'plat09.png', 1, 2, 0),
(179, 'PA00000010', 'Manger belge', 'A bouffer chaud étrange dur que vous pouvez manger. Et c\'est tout...', 2, 10, 'plat10.png', 1, 5, 0),
(180, 'PA00000011', 'Préparation froid', 'De la nourriture beau chaud dur que l\'on vous vend. Bonne journée!', 20, 10, 'plat11.png', 19, 5, 0),
(181, 'PA00000012', 'Manger belge', 'Un manger étrange chaud dur que l\'on vous vend. Achetez le.', 18, 10, 'plat12.png', 1, 0, 0),
(182, 'PA00000013', 'Plat salé', 'De la nourriture nourissant chaud vert que l\'on vous vend. Super!', 23, 10, 'plat13.png', 1, 2, 0),
(183, 'PA00000014', 'Plat basque', 'De la nourriture délicieux délicieux sucré que l\'on vous vend. Et c\'est tout...', 6, 10, 'plat14.png', 19, 1, 0),
(184, 'PA00000015', 'Plat froid', 'Un plat beau pas cher salé que l\'on vous vend. Super!', 28, 10, 'plat15.png', 1, 0, 0),
(185, 'PA00000016', 'Plat italien', 'De la nourriture beau étrange vert que l\'on vous vend. Bonne journée!', 8, 10, 'plat16.png', 1, 3, 0),
(186, 'PA00000017', 'Manger chaud', 'A bouffer nourissant chaud piquant que l\'on vous vend. Et c\'est tout...', 1, 10, 'plat17.png', 1, 4, 0),
(187, 'PA00000018', 'Manger salé', 'A bouffer froid pas cher vert que vous pouvez manger. Achetez le.', 29, 10, 'plat18.png', 19, 4, 0),
(188, 'PA00000019', 'Plat basque', 'A bouffer étrange nourissant salé que l\'on vous vend. Achetez le.', 11, 10, 'plat19.png', 19, 0, 0),
(189, 'PA00000020', 'Manger chaud', 'A bouffer délicieux délicieux dur que vous pouvez manger. Et c\'est tout...', 14, 10, 'plat20.png', 1, 0, 0),
(190, 'PA00000021', 'Plat chaud', 'De la nourriture chaud délicieux dur que l\'on vous vend. Super!', 10, 10, 'plat21.png', 19, 5, 0),
(191, 'PA00000022', 'Manger italien', 'Un plat beau nourissant rouge que l\'on vous vend. Bonne journée!', 0, 10, 'plat22.png', 1, 0, 0),
(192, 'PA00000023', 'Manger basque', 'Un plat beau froid amer que l\'on vous vend. Bonne journée!', 17, 10, 'plat23.png', 1, 2, 0),
(193, 'PA00000024', 'Plat italien', 'A bouffer pas cher chaud dur que l\'on vous vend. Achetez le.', 9, 10, 'plat24.png', 1, 3, 0),
(194, 'PA00000025', 'Préparation français', 'Un manger froid nourissant salé que vous pouvez manger. Achetez le.', 21, 10, 'plat25.png', 1, 2, 0),
(195, 'PA00000026', 'Manger français', 'De la nourriture chaud beau rouge que l\'on vous vend. Achetez le.', 17, 10, 'plat26.png', 1, 0, 0),
(196, 'PA00000027', 'Manger basque', 'Un plat délicieux délicieux vert que l\'on vous vend. Et c\'est tout...', 4, 10, 'plat27.png', 1, 3, 0),
(197, 'PA00000028', 'Manger chaud', 'Un plat froid beau amer que vous pouvez manger. Achetez le.', 3, 10, 'plat28.png', 1, 1, 0),
(198, 'PA00000029', 'Préparation français', 'De la nourriture pas cher délicieux acide que vous pouvez manger. Bonne journée!', 26, 10, 'plat29.png', 1, 2, 0),
(199, 'PA00000030', 'Plat basque', 'Un manger agréable étrange rouge que vous pouvez manger. Et c\'est tout...', 13, 10, 'plat30.png', 1, 2, 0),
(200, 'PA00000031', 'Préparation belge', 'Un manger chaud beau salé que vous pouvez manger. Bonne journée!', 8, 10, 'plat31.png', 1, 0, 0),
(201, 'PA00000032', 'Plat chaud', 'Un plat chaud pas cher sucré que vous pouvez manger. Super!', 17, 10, 'plat32.png', 1, 0, 0),
(202, 'PA00000033', 'Préparation belge', 'Un plat chaud étrange dur que l\'on vous vend. Achetez le.', 12, 10, 'plat33.png', 1, 3, 0),
(203, 'PA00000034', 'Plat salé', 'Un plat beau étrange acide que vous pouvez manger. Achetez le.', 4, 10, 'plat34.png', 19, 3, 0),
(204, 'PA00000035', 'Manger chaud', 'Un manger étrange étrange acide que l\'on vous vend. Super!', 18, 10, 'plat35.png', 1, 4, 0),
(205, 'PA00000036', 'Préparation chaud', 'Un manger agréable beau rouge que l\'on vous vend. Super!', 14, 10, 'plat36.png', 19, 3, 0),
(206, 'PA00000037', 'Plat chaud', 'Un plat beau pas cher vert que vous pouvez manger. Bonne journée!', 22, 10, 'plat37.png', 1, 4, 0),
(207, 'PA00000038', 'Manger français', 'Un plat pas cher agréable acide que l\'on vous vend. Bonne journée!', 5, 10, 'plat38.png', 1, 0, 0),
(208, 'PA00000039', 'Manger froid', 'Un plat étrange agréable salé que l\'on vous vend. Super!', 26, 10, 'plat39.png', 1, 2, 0),
(209, 'PA00000040', 'Manger français', 'De la nourriture beau agréable salé que vous pouvez manger. Super!', 5, 10, 'plat40.png', 19, 3, 0),
(210, 'PA00000041', 'Préparation froid', 'A bouffer agréable pas cher rouge que vous pouvez manger. Super!', 13, 10, 'plat41.png', 19, 5, 0),
(211, 'PA00000042', 'Préparation basque', 'Un manger étrange froid vert que vous pouvez manger. Bonne journée!', 24, 10, 'plat42.png', 1, 3, 0),
(212, 'PA00000043', 'Manger italien', 'Un manger nourissant nourissant vert que vous pouvez manger. Et c\'est tout...', 2, 10, 'plat43.png', 19, 3, 0),
(213, 'PA00000044', 'Plat français', 'Un manger agréable pas cher amer que vous pouvez manger. Achetez le.', 12, 10, 'plat44.png', 1, 1, 0),
(214, 'PA00000045', 'Plat italien', 'A bouffer beau étrange amer que l\'on vous vend. Et c\'est tout...', 17, 10, 'plat45.png', 1, 2, 0),
(215, 'PA00000046', 'Plat italien', 'A bouffer chaud agréable sucré que l\'on vous vend. Bonne journée!', 22, 10, 'plat46.png', 1, 2, 0),
(216, 'PA00000047', 'Plat salé', 'Un manger beau pas cher vert que l\'on vous vend. Achetez le.', 11, 10, 'plat47.png', 3, 0, 0),
(217, 'PA00000048', 'Préparation froid', 'Un manger délicieux délicieux vert que vous pouvez manger. Bonne journée!', 9, 10, 'plat48.png', 3, 5, 0),
(218, 'PA00000049', 'Plat chaud', 'Un plat beau nourissant rouge que vous pouvez manger. Super!', 22, 10, 'plat49.png', 3, 5, 0),
(219, 'PA00000050', 'Plat salé', 'De la nourriture pas cher agréable piquant que vous pouvez manger. Et c\'est tout...', 6, 10, 'plat50.png', 3, 5, 0),
(220, 'PA00000051', 'Plat salé', 'Un manger étrange pas cher acide que l\'on vous vend. Bonne journée!', 9, 10, 'plat51.png', 3, 0, 0),
(221, 'PA00000052', 'Plat salé', 'De la nourriture étrange froid sucré que vous pouvez manger. Bonne journée!', 24, 10, 'plat52.png', 3, 1, 0),
(222, 'PA00000053', 'Préparation français', 'De la nourriture froid nourissant salé que l\'on vous vend. Et c\'est tout...', 8, 10, 'plat53.png', 3, 2, 0),
(223, 'PA00000054', 'Plat froid', 'De la nourriture chaud froid dur que l\'on vous vend. Super!', 8, 10, 'plat54.png', 3, 0, 0),
(224, 'PA00000055', 'Plat froid', 'De la nourriture nourissant agréable vert que vous pouvez manger. Super!', 17, 10, 'plat55.png', 3, 5, 0),
(225, 'PA00000056', 'Plat chaud', 'De la nourriture étrange délicieux dur que l\'on vous vend. Bonne journée!', 7, 10, 'plat56.png', 3, 3, 0),
(226, 'PA00000057', 'Manger italien', 'Un plat chaud nourissant piquant que l\'on vous vend. Bonne journée!', 3, 10, 'plat57.png', 3, 1, 0),
(227, 'PA00000058', 'Préparation chaud', 'A bouffer pas cher nourissant amer que vous pouvez manger. Achetez le.', 14, 10, 'plat58.png', 3, 1, 0),
(228, 'PA00000059', 'Plat chaud', 'De la nourriture nourissant étrange dur que vous pouvez manger. Achetez le.', 26, 10, 'plat59.png', 3, 3, 0),
(229, 'PA00000060', 'Plat belge', 'De la nourriture délicieux agréable salé que l\'on vous vend. Achetez le.', 7, 10, 'plat60.png', 3, 4, 0),
(230, 'PA00000061', 'Plat salé', 'De la nourriture froid étrange dur que vous pouvez manger. Et c\'est tout...', 24, 10, 'plat61.png', 3, 2, 0),
(231, 'PA00000062', 'Plat salé', 'Un manger agréable agréable salé que l\'on vous vend. Et c\'est tout...', 11, 10, 'plat62.png', 3, 0, 0),
(232, 'PA00000063', 'Plat basque', 'A bouffer pas cher nourissant acide que vous pouvez manger. Et c\'est tout...', 15, 10, 'plat63.png', 3, 0, 0),
(233, 'PA00000064', 'Préparation chaud', 'Un manger chaud pas cher vert que l\'on vous vend. Et c\'est tout...', 5, 10, 'plat64.png', 3, 5, 0),
(234, 'PA00000065', 'Manger salé', 'A bouffer agréable chaud dur que vous pouvez manger. Achetez le.', 17, 10, 'plat65.png', 3, 0, 0),
(235, 'PA00000066', 'Manger basque', 'Un plat nourissant froid acide que l\'on vous vend. Bonne journée!', 6, 10, 'plat66.png', 3, 5, 0),
(236, 'PA00000067', 'Préparation basque', 'De la nourriture beau froid piquant que vous pouvez manger. Super!', 10, 10, 'plat67.png', 1, 2, 0),
(237, 'PA00000068', 'Manger français', 'De la nourriture pas cher agréable acide que l\'on vous vend. Bonne journée!', 20, 10, 'plat68.png', 19, 1, 0),
(238, 'PA00000069', 'Manger basque', 'A bouffer pas cher froid amer que vous pouvez manger. Achetez le.', 27, 10, 'plat69.png', 1, 4, 0),
(239, 'PA00000070', 'Manger italien', 'Un plat étrange froid sucré que l\'on vous vend. Bonne journée!', 15, 10, 'plat70.png', 1, 5, 0),
(240, 'PA00000071', 'Plat basque', 'De la nourriture chaud pas cher rouge que vous pouvez manger. Bonne journée!', 5, 10, 'plat71.png', 19, 0, 0),
(241, 'PA00000072', 'Préparation français', 'A bouffer étrange étrange amer que vous pouvez manger. Et c\'est tout...', 29, 10, 'plat72.png', 1, 2, 0),
(242, 'PA00000073', 'Manger chaud', 'A bouffer pas cher froid dur que l\'on vous vend. Achetez le.', 12, 10, 'plat73.png', 1, 5, 0),
(243, 'PA00000074', 'Manger basque', 'Un plat beau beau vert que l\'on vous vend. Et c\'est tout...', 9, 10, 'plat74.png', 1, 0, 0),
(244, 'PA00000075', 'Manger salé', 'A bouffer chaud étrange rouge que l\'on vous vend. Super!', 23, 10, 'plat75.png', 1, 5, 0),
(245, 'PA00000076', 'Préparation basque', 'Un plat froid pas cher salé que vous pouvez manger. Achetez le.', 21, 10, 'plat76.png', 1, 5, 0),
(246, 'PA00000077', 'Manger salé', 'Un plat délicieux délicieux acide que l\'on vous vend. Super!', 16, 10, 'plat77.png', 19, 0, 0),
(247, 'PA00000078', 'Plat français', 'Un manger froid délicieux amer que vous pouvez manger. Et c\'est tout...', 6, 10, 'plat78.png', 19, 0, 0),
(248, 'PA00000079', 'Manger basque', 'A bouffer agréable froid amer que vous pouvez manger. Bonne journée!', 27, 10, 'plat79.png', 1, 1, 0),
(249, 'OD00000001', 'Machine Fyhoriby', 'Un mat?riel bizarre en plastique avec Linux que vous pouvez utiliser. Super!', 556, 10, 'ordi01.png', 18, 4, 0),
(250, 'OD00000002', 'Machine Xivomeji', 'Un mat?riel chaud quantique avec Windows que vous pouvez utiliser. Bonne journ?e!', 1200, 10, 'ordi02.png', 18, 5, 1),
(251, 'OD00000003', 'Ordinateur Myyeduve', 'Un mat?riel solide en aluminium avec Windows que l\'on vous vend. Achetez le.', 1807, 10, 'ordi03.png', 17, 3, 0),
(252, 'OD00000004', 'Ordinateur Risoguje', 'Un mac puissant binaire avec WiwuvyjiOS que vous pouvez utiliser. Et c\'est tout...', 1521, 10, 'ordi04.png', 18, 1, 0),
(253, 'OD00000005', 'Ordinateur Zyjiyagy', 'Un mat?riel solide en m?tal avec MacOS que l\'on vous vend. Super!', 1383, 10, 'ordi05.png', 18, 2, 0),
(254, 'OD00000006', 'Ordinateur Jufaneba', 'Un ordinateur chaud en plastique avec Linux que vous pouvez utiliser. Bonne journ?e!', 1871, 10, 'ordi06.png', 18, 4, 0),
(255, 'OD00000007', 'PC Camemavi', 'Un ordinateur solide quantique avec HuvojutaOS que vous pouvez utiliser. Et c\'est tout...', 618, 10, 'ordi07.png', 17, 4, 0),
(256, 'OD00000008', 'PC Wosexipe', 'Un PC puissant binaire avec ZaqulamyOS que vous pouvez utiliser. Achetez le.', 1816, 10, 'ordi08.png', 17, 2, 0),
(257, 'OD00000009', 'Machine Veqequqo', 'Un mac puissant ?lectrique avec Windows que l\'on vous vend. Super!', 1633, 10, 'ordi09.png', 18, 1, 0),
(258, 'OD00000010', 'PC Xajejetu', 'Un mac puissant ?lectrique avec Windows que vous pouvez utiliser. Et c\'est tout...', 842, 10, 'ordi10.png', 18, 5, 0),
(259, 'OD00000011', 'Ordinateur Didugihe', 'Un PC chaud ?lectrique avec Windows que l\'on vous vend. Bonne journ?e!', 1021, 10, 'ordi11.png', 17, 1, 1),
(260, 'OD00000012', 'PC Nasuveda', 'Un mac froid bleu avec ZarepagoOS que l\'on vous vend. Et c\'est tout...', 1059, 10, 'ordi12.png', 18, 3, 1),
(261, 'OD00000013', 'PC Yywobacy', 'Un PC agr?able quantique avec MacOS que l\'on vous vend. Et c\'est tout...', 1988, 10, 'ordi13.png', 18, 1, 0),
(262, 'OD00000014', 'Machine Qifekaro', 'Un mac bizarre en m?tal avec Linux que vous pouvez utiliser. Bonne journ?e!', 1104, 10, 'ordi14.png', 17, 5, 1),
(263, 'OD00000015', 'PC Hewumoqy', 'Un ordinateur puissant bleu avec MacOS que l\'on vous vend. Et c\'est tout...', 1023, 10, 'ordi15.png', 18, 3, 1),
(264, 'OD00000016', 'PC Jihyveya', 'Un mac ?tanche binaire avec FawytycoOS que l\'on vous vend. Bonne journ?e!', 677, 10, 'ordi16.png', 18, 1, 0),
(265, 'OD00000017', 'Ordinateur Xoyusege', 'Un PC chaud en plastique avec Windows que l\'on vous vend. Bonne journ?e!', 1693, 10, 'ordi17.png', 18, 4, 0),
(266, 'OD00000018', 'Ordinateur Yefowesy', 'Un mac agr?able en m?tal avec Linux que l\'on vous vend. Super!', 1914, 10, 'ordi18.png', 18, 3, 0),
(267, 'OD00000019', 'Ordinateur Kyneviqi', 'Un ordinateur chaud bleu avec Windows que vous pouvez utiliser. Bonne journ?e!', 1137, 10, 'ordi19.png', 17, 0, 1),
(268, 'OD00000020', 'PC Dujavuli', 'Un mat?riel ?tanche en aluminium avec Linux que l\'on vous vend. Super!', 1468, 10, 'ordi20.png', 18, 3, 0),
(269, 'OD00000021', 'Machine Vofoqury', 'Un ordinateur chaud binaire avec Windows que l\'on vous vend. Achetez le.', 758, 10, 'ordi21.png', 18, 1, 0),
(270, 'OD00000022', 'Ordinateur Tyzecibu', 'Un PC bizarre en m?tal avec Linux que vous pouvez utiliser. Achetez le.', 1645, 10, 'ordi22.png', 18, 1, 0),
(271, 'OD00000023', 'Machine Kepuvaxo', 'Un mac puissant en plastique avec Linux que vous pouvez utiliser. Super!', 1864, 10, 'ordi23.png', 18, 4, 0),
(272, 'OD00000024', 'Machine Mizihegu', 'Un mac agr?able binaire avec WimybumuOS que vous pouvez utiliser. Super!', 1400, 10, 'ordi24.png', 18, 3, 0),
(273, 'OD00000025', 'PC Bynacepa', 'Un PC chaud en aluminium avec Linux que l\'on vous vend. Bonne journ?e!', 1804, 10, 'ordi25.png', 17, 5, 0),
(274, 'OD00000026', 'Machine Lyzoqoru', 'Un mat?riel bizarre en aluminium avec Windows que l\'on vous vend. Et c\'est tout...', 1914, 10, 'ordi26.png', 18, 2, 0),
(275, 'OD00000027', 'PC Kulydyru', 'Un ordinateur solide quantique avec Linux que vous pouvez utiliser. Super!', 1897, 10, 'ordi27.png', 18, 2, 0),
(276, 'OD00000028', 'Ordinateur Kayozaje', 'Un ordinateur puissant quantique avec Linux que vous pouvez utiliser. Super!', 1510, 10, 'ordi28.png', 17, 3, 0),
(277, 'OD00000029', 'Machine Rojylebi', 'Un ordinateur agr?able binaire avec Windows que vous pouvez utiliser. Bonne journ?e!', 1652, 10, 'ordi29.png', 17, 1, 0),
(278, 'OD00000030', 'Machine Curilaro', 'Un mat?riel pas cher en aluminium avec MacOS que vous pouvez utiliser. Achetez le.', 1127, 10, 'ordi30.png', 18, 0, 1),
(279, 'OD00000031', 'Ordinateur Behypafa', 'Un PC froid binaire avec Linux que vous pouvez utiliser. Et c\'est tout...', 1651, 10, 'ordi31.png', 18, 5, 0),
(280, 'OD00000032', 'Ordinateur Hihynavy', 'Un mat?riel chaud quantique avec Windows que vous pouvez utiliser. Super!', 1764, 10, 'ordi32.png', 18, 4, 0),
(281, 'OD00000033', 'Machine Zadiyuqe', 'Un mac solide en aluminium avec Windows que l\'on vous vend. Super!', 1109, 10, 'ordi33.png', 18, 0, 1),
(312, 'OT00000001', 'Téléphone Yilohymi', '﻿Un téléphone portable agréable vert avec WindowsPhoneOS que l\'on vous vend. Super!', 864, 10, 'tel01.png', 16, 1, 0),
(313, 'OT00000002', 'Smartphone Hysikery', 'Un téléphone froid en métal avec FihohyweOS que vous pouvez utiliser. Et c\'est tout...', 1168, 10, 'tel02.png', 16, 1, 1),
(314, 'OT00000003', 'Téléphone Pytihare', 'Un écran bizarre bleu avec Android que vous pouvez utiliser. Et c\'est tout...', 1499, 10, 'tel03.png', 16, 1, 0),
(315, 'OT00000004', 'Téléphone Ziyawahi', 'Un smartphone agréable quantique avec WindowsPhoneOS que vous pouvez utiliser. Et c\'est tout...', 1077, 10, 'tel04.png', 16, 2, 1),
(316, 'OT00000005', 'Ecran Hydijoza', 'Un téléphone portable bizarre bleu avec Android que l\'on vous vend. Et c\'est tout...', 841, 10, 'tel05.png', 16, 1, 0),
(317, 'OT00000006', 'Ecran Bavahore', 'Un smartphone pas cher bleu avec RehysigeOS que l\'on vous vend. Super!', 973, 10, 'tel06.png', 16, 5, 0),
(318, 'OT00000007', 'Smartphone Qofemeki', 'Un téléphone portable chaud vert avec IOS que l\'on vous vend. Bonne journée!', 910, 10, 'tel07.png', 16, 2, 0),
(319, 'OT00000008', 'Téléphone Zozuvatu', 'Un écran chaud bleu avec WindowsPhoneOS que l\'on vous vend. Bonne journée!', 1810, 10, 'tel08.png', 16, 1, 0),
(320, 'OT00000009', 'Téléphone Mijefohu', 'Un téléphone portable froid quantique avec WindowsPhoneOS que l\'on vous vend. Bonne journée!', 1016, 10, 'tel09.png', 16, 0, 1),
(321, 'OT00000010', 'Smartphone Dasojiyi', 'Un téléphone solide en aluminium avec Android que l\'on vous vend. Et c\'est tout...', 1356, 10, 'tel10.png', 16, 3, 0),
(322, 'OT00000011', 'Smartphone Fifityyu', 'Un téléphone agréable en aluminium avec IOS que vous pouvez utiliser. Super!', 737, 10, 'tel11.png', 16, 2, 0),
(323, 'OT00000012', 'Téléphone Luyoyemy', 'Un écran pas cher en métal avec IOS que l\'on vous vend. Et c\'est tout...', 1385, 10, 'tel12.png', 16, 4, 0),
(324, 'OT00000013', 'Ecran Ceboquzi', 'Un smartphone puissant en aluminium avec WindowsPhoneOS que l\'on vous vend. Bonne journée!', 1064, 10, 'tel13.png', 16, 5, 1),
(325, 'OT00000014', 'Smartphone Firudody', 'Un smartphone bizarre vert avec PaduwyboOS que l\'on vous vend. Et c\'est tout...', 1506, 10, 'tel14.png', 16, 5, 0),
(326, 'OT00000015', 'Smartphone Kudybafa', 'Un smartphone étanche vert avec KafosuweOS que l\'on vous vend. Et c\'est tout...', 1851, 10, 'tel15.png', 16, 1, 0),
(327, 'OT00000016', 'Smartphone Wugybori', 'Un téléphone bizarre binaire avec WindowsPhoneOS que l\'on vous vend. Et c\'est tout...', 1308, 10, 'tel16.png', 16, 0, 0),
(328, 'OT00000017', 'Téléphone Hocutefy', 'Un téléphone chaud vert avec Android que l\'on vous vend. Achetez le.', 1228, 10, 'tel17.png', 16, 4, 1),
(329, 'OT00000018', 'Téléphone Zarygymi', 'Un téléphone portable chaud vert avec KymiwunuOS que vous pouvez utiliser. Bonne journée!', 1160, 10, 'tel18.png', 16, 2, 1),
(330, 'OT00000019', 'Téléphone Kizunusi', 'Un téléphone froid électrique avec HugygikaOS que l\'on vous vend. Et c\'est tout...', 1308, 10, 'tel19.png', 16, 4, 0),
(331, 'OT00000020', 'Téléphone Labyfiyy', 'Un téléphone portable pas cher binaire avec IOS que vous pouvez utiliser. Achetez le.', 1867, 10, 'tel20.png', 16, 3, 0),
(332, 'OT00000021', 'Ecran Jowasuta', 'Un smartphone froid bleu avec FupifuzyOS que vous pouvez utiliser. Et c\'est tout...', 1656, 10, 'tel21.png', 16, 1, 0),
(333, 'OT00000022', 'Ecran Qerepixi', 'Un téléphone portable agréable électrique avec WindowsPhoneOS que vous pouvez utiliser. Super!', 777, 10, 'tel22.png', 16, 4, 0),
(334, 'OT00000023', 'Téléphone Dyyucopi', 'Un téléphone portable pas cher en plastique avec TuvolaroOS que l\'on vous vend. Bonne journée!', 1081, 10, 'tel23.png', 16, 3, 1),
(335, 'OT00000024', 'Téléphone Celelegu', 'Un écran bizarre binaire avec Android que l\'on vous vend. Et c\'est tout...', 1566, 10, 'tel24.png', 16, 1, 0),
(336, 'OT00000025', 'Smartphone Zifiwidi', 'Un téléphone chaud bleu avec Android que vous pouvez utiliser. Super!', 989, 10, 'tel25.png', 16, 0, 0),
(337, 'OT00000026', 'Smartphone Wosyfoxi', 'Un écran solide quantique avec Android que vous pouvez utiliser. Super!', 1753, 10, 'tel26.png', 16, 5, 0),
(338, 'OT00000027', 'Ecran Baxinase', 'Un téléphone portable solide électrique avec Android que vous pouvez utiliser. Super!', 652, 10, 'tel27.png', 16, 1, 0),
(339, 'OT00000028', 'Téléphone Jocixuye', 'Un téléphone bizarre en aluminium avec IOS que l\'on vous vend. Achetez le.', 1897, 10, 'tel28.png', 16, 0, 0),
(340, 'OT00000029', 'Smartphone Mepyyege', 'Un écran solide en plastique avec Android que l\'on vous vend. Et c\'est tout...', 702, 10, 'tel29.png', 16, 0, 0),
(341, 'OT00000030', 'Téléphone Kecydoya', 'Un smartphone pas cher en aluminium avec Android que l\'on vous vend. Et c\'est tout...', 777, 10, 'tel30.png', 16, 2, 0),
(342, 'OT00000031', 'Ecran Bikoyabi', 'Un téléphone puissant en métal avec IOS que vous pouvez utiliser. Achetez le.', 951, 10, 'tel31.png', 16, 3, 0),
(343, 'PL00000001', 'Une plante verte', '﻿Une plante aquatique électrique basse que l\'on vous vend. Et c\'est tout...', 66, 5, 'plante01.png', 15, 4, 0),
(344, 'PL00000002', 'Une Vasiqesotus aquatique', 'Une plante pas cher à fruit avec des Jexyqepolettes que vous pouvez planter. Super!', 440, 5, 'plante02.png', 15, 2, 1),
(345, 'PL00000003', 'Une plante verte', 'Un arbre agréable petite haute que vous pouvez planter. Achetez le.', 30, 5, 'plante03.png', 15, 0, 0),
(346, 'PL00000004', 'Une Vovynygotus aquatique', 'Une herbe chaud à tronc avec des Vekyyipilettes que vous pouvez planter. Bonne journée!', 55, 5, 'plante04.png', 15, 5, 0),
(347, 'PL00000005', 'Une plante rouge', 'Un arbre forestière vert à poil que vous pouvez planter. Et c\'est tout...', 375, 5, 'plante05.png', 15, 4, 1),
(348, 'PL00000006', 'Une Vujuhatudée aquatique', 'Une herbe aquatique électrique haute que vous pouvez planter. Super!', 249, 5, 'plante06.png', 15, 5, 1),
(349, 'PL00000007', 'Une plante aquatique', 'Une plante verte vert basse que l\'on vous vend. Bonne journée!', 623, 5, 'plante07.png', 15, 5, 1),
(350, 'PL00000008', 'Une Tebyxigedée verte', 'Une Buyilufidée agréable à feuille haute que l\'on vous vend. Super!', 384, 5, 'plante08.png', 15, 5, 1),
(351, 'PL00000009', 'Une Lilivubadée aquatique', 'Une herbe chaud à feuille basse que vous pouvez planter. Achetez le.', 935, 5, 'plante09.png', 15, 4, 1),
(352, 'PL00000010', 'Une Bifakujetus rouge', 'Une Batemylidée chaud grande avec des Putypyzulettes que vous pouvez planter. Bonne journée!', 947, 5, 'plante10.png', 15, 5, 1),
(353, 'PL00000011', 'Une Lylyjyvedée verte', 'Un arbre pas cher petite avec des Sudymeyilettes que vous pouvez planter. Achetez le.', 570, 5, 'plante11.png', 15, 3, 1),
(354, 'PL00000012', 'Une plante rouge', 'Une Silosovadée chaud à tronc haute que l\'on vous vend. Achetez le.', 825, 5, 'plante12.png', 15, 4, 1),
(355, 'PL00000013', 'Une Wexuqeyitus rouge', 'Une herbe verte grande haute que l\'on vous vend. Et c\'est tout...', 696, 5, 'plante13.png', 15, 1, 1),
(356, 'PL00000014', 'Une plante rouge', 'Une plante forestière à tronc haute que l\'on vous vend. Bonne journée!', 624, 5, 'plante14.png', 15, 5, 1),
(357, 'AN00000001', 'Une animal poilu', 'Un Hoseyeved?e chaud volant ? poil que vous pouvez adopter. Et c\'est tout...', 169, 20, 'animal01.png', 20, 2, 0),
(358, 'AN00000002', 'Un Kixemovitus poilu', 'Un animal chaud grand haute que l\'on vous vend. Bonne journ?e!', 374, 20, 'animal02.png', 20, 2, 0),
(359, 'AN00000003', 'Un Xozorebyd?e aquatique', 'Un Xaxanyvid?e agr?able ?lectrique avec des Susuzokulettes que l\'on vous vend. Achetez le.', 486, 20, 'animal03.png', 20, 5, 0),
(360, 'AN00000004', 'Un Bekezykotus volant', 'Une sp?cimen forestier poilu basse que vous pouvez adopter. Bonne journ?e!', 207, 20, 'animal04.png', 20, 3, 0),
(361, 'AN00000005', 'Une animal volant', 'Un animal froid bleu ? poil que l\'on vous vend. Achetez le.', 172, 20, 'animal05.png', 20, 1, 0),
(362, 'AN00000006', 'Une animal volant', 'Un Petygejid?e chaud petit ? poil que l\'on vous vend. Et c\'est tout...', 76, 20, 'animal06.png', 20, 2, 0),
(363, 'AN00000007', 'Une animal poilu', 'Une sp?cimen bizarre bleu basse que vous pouvez adopter. Bonne journ?e!', 265, 20, 'animal07.png', 20, 1, 0),
(364, 'AN00000008', 'Un Powupakod?e aquatique', 'Une sp?cimen verte ?lectrique haute que l\'on vous vend. Bonne journ?e!', 544, 20, 'animal08.png', 20, 4, 0),
(365, 'AN00000009', 'Un Xotojybutus poilu', 'Un animal verte grand ? poil que l\'on vous vend. Et c\'est tout...', 274, 20, 'animal09.png', 20, 3, 0),
(366, 'AN00000010', 'Une animal poilu', 'Une sp?cimen forestier vert haute que vous pouvez adopter. Achetez le.', 23, 20, 'animal10.png', 20, 4, 0),
(367, 'AN00000011', 'Une animal volant', 'Un animal froid bleu ? poil que l\'on vous vend. Bonne journ?e!', 119, 20, 'animal11.png', 20, 3, 0),
(368, 'AN00000012', 'Un Hefivaxod?e poilu', 'Une sp?cimen pas cher poilu haute que l\'on vous vend. Et c\'est tout...', 630, 20, 'animal12.png', 20, 4, 0),
(369, 'AN00000013', 'Un Bopulumad?e volant', 'Un Mopapenod?e pas cher vert avec des Zahymeholettes que vous pouvez adopter. Et c\'est tout...', 781, 20, 'animal13.png', 20, 4, 0),
(370, 'AN00000014', 'Un Yifiresid?e poilu', 'Une sp?cimen verte volant ? poil que l\'on vous vend. Achetez le.', 561, 20, 'animal14.png', 20, 0, 0),
(371, 'AN00000015', 'Un Tadogazid?e aquatique', 'Un Wyjetirid?e pas cher poilu haute que vous pouvez adopter. Achetez le.', 639, 20, 'animal15.png', 20, 0, 0),
(372, 'AN00000016', 'Un Mybutuwad?e aquatique', 'Une b?te agr?able bleu ? poil que vous pouvez adopter. Super!', 742, 20, 'animal16.png', 20, 2, 0),
(373, 'AN00000017', 'Un Jijyrepud?e poilu', 'Un Nigokeqed?e froid bleu ? poil que vous pouvez adopter. Super!', 31, 20, 'animal17.png', 20, 3, 0),
(374, 'AN00000018', 'Un Qycifamotus aquatique', 'Un animal forestier venimeux basse que vous pouvez adopter. Super!', 887, 20, 'animal18.png', 20, 1, 0),
(375, 'AN00000019', 'Un Fybojojyd?e poilu', 'Un Kulyvumed?e aquatique bleu ? poil que vous pouvez adopter. Et c\'est tout...', 324, 20, 'animal19.png', 20, 2, 0),
(388, 'MD00000001', 'Une l?zard poilu', 'Un dragon chaud volant basse que l\'on vous vend. Super!', 183, 15, 'dragon01.png', 21, 3, 1),
(389, 'MD00000002', 'Un wyvern volant', 'Une hydre agr?able ?lectrique basse que vous pouvez adopter. Et c\'est tout...', 115, 15, 'dragon02.png', 21, 3, 1),
(390, 'MD00000003', 'Un dragon volant', 'Une hydre chaud poilu basse que l\'on vous vend. Super!', 745, 15, 'dragon03.png', 21, 2, 1),
(391, 'MD00000004', 'Un dragon aquatique', 'Une l?zard froid poilu basse que l\'on vous vend. Super!', 240, 15, 'dragon04.png', 21, 1, 1),
(392, 'MD00000005', 'Un dragon volant', 'Une l?zard aquatique bleu haute que vous pouvez adopter. Et c\'est tout...', 456, 15, 'dragon05.png', 21, 5, 1),
(393, 'MD00000006', 'Un wyvern volant', 'Un dragon aquatique bleu ? poil que vous pouvez adopter. Et c\'est tout...', 245, 15, 'dragon06.png', 21, 4, 1),
(394, 'MD00000007', 'Un wyvern aquatique', 'Une l?zard verte bleu ? poil que vous pouvez adopter. Et c\'est tout...', 84, 15, 'dragon07.png', 21, 3, 1),
(395, 'MD00000008', 'Un wyvern aquatique', 'Un wyvern verte grand basse que l\'on vous vend. Achetez le.', 861, 15, 'dragon08.png', 21, 0, 1),
(396, 'MD00000009', 'Une l?zard poilu', 'Un dragon agr?able grand ? poil que l\'on vous vend. Et c\'est tout...', 219, 15, 'dragon09.png', 21, 3, 1),
(397, 'MD00000010', 'Un dragon poilu', 'Un wyvern aquatique ?lectrique haute que l\'on vous vend. Et c\'est tout...', 413, 15, 'dragon10.png', 21, 1, 1),
(403, 'DM00000001', 'Une décoration en kit', '﻿Une construction en plastique cher haute que vous pouvez acheter. Super!', 387, 5, 'meuble01.png', 9, 1, 0),
(404, 'DM00000002', 'Un meuble de chambre', 'Une construction en bois de luxe basse que l\'on vous vend. Achetez le.', 739, 5, 'meuble02.png', 9, 2, 0),
(405, 'DM00000003', 'Un meuble en kit', 'Une construction en plastique cher décoré que l\'on vous vend. Super!', 98, 5, 'meuble03.png', 9, 5, 0),
(406, 'DM00000004', 'Une décoration de chambre', 'Une construction en fer pas cher basse que vous pouvez acheter. Achetez le.', 826, 5, 'meuble04.png', 9, 2, 0),
(407, 'DM00000005', 'Un meuble de chambre', 'Un objet de chambre rouge haute que vous pouvez acheter. Achetez le.', 785, 5, 'meuble05.png', 9, 2, 0),
(408, 'DM00000006', 'Un meuble de chambre', 'Un objet en kit bleu décoré que vous pouvez acheter. Achetez le.', 202, 5, 'meuble06.png', 9, 5, 0),
(409, 'DM00000007', 'Un meuble de chambre', 'Un meuble dur bleu avec des Giqakuvalettes que l\'on vous vend. Super!', 349, 5, 'meuble07.png', 9, 5, 0),
(410, 'DM00000008', 'Une décoration de chambre', 'Une construction en bois vert décoré que l\'on vous vend. Et c\'est tout...', 933, 5, 'meuble08.png', 9, 1, 0),
(411, 'DM00000009', 'Une décoration en bois', 'Une décoration de cuisine cher décoré que vous pouvez acheter. Et c\'est tout...', 246, 5, 'meuble09.png', 9, 2, 0),
(412, 'DM00000010', 'Un objet en kit', 'Un objet de chambre de luxe décoré que l\'on vous vend. Achetez le.', 278, 5, 'meuble10.png', 9, 3, 0),
(418, 'VO00000001', 'Un v?hicule de sport', 'Une bagnole utilitaire de luxe manuelle que vous pouvez conduire. Bonne journ?e!', 586, 5, 'voiture01.png', 22, 4, 0),
(419, 'VO00000002', 'Une bagnole familliale', 'Une voiture de sport de luxe avec des suspensions relev?es que vous pouvez conduire. Bonne journ?e!', 39, 5, 'voiture02.png', 22, 4, 0),
(420, 'VO00000003', 'Une voiture ?lectrique', 'Une voiture familliale vert manuelle que l\'on vous vend. Et c\'est tout...', 871, 5, 'voiture03.png', 22, 5, 0),
(421, 'VO00000004', 'Une voiture de sport', 'Une bagnole familliale diesel avec des suspensions relev?es que l\'on vous vend. Super!', 418, 5, 'voiture04.png', 22, 5, 1),
(422, 'VO00000005', 'Une bagnole ?lectrique', 'Un SUV sans permis ?lectrique avec des suspensions relev?es que vous pouvez conduire. Bonne journ?e!', 50, 5, 'voiture05.png', 22, 5, 0),
(423, 'VO00000006', 'Un v?hicule de sport', 'Une voiture familliale bleu automatique que l\'on vous vend. Et c\'est tout...', 429, 5, 'voiture06.png', 22, 3, 1),
(424, 'VO00000007', 'Une bagnole ?lectrique', 'Une voiture familliale cher manuelle que l\'on vous vend. Super!', 64, 5, 'voiture07.png', 22, 2, 0),
(425, 'VO00000008', 'Un v?hicule de sport', 'Un v?hicule sans permis bleu d?cor? que l\'on vous vend. Et c\'est tout...', 645, 5, 'voiture08.png', 22, 1, 0),
(426, 'VO00000009', 'Une bagnole de sport', 'Un v?hicule ?conomique diesel manuelle que l\'on vous vend. Achetez le.', 530, 5, 'voiture09.png', 22, 2, 0),
(427, 'VO00000010', 'Une bagnole familliale', 'Un v?hicule de transport diesel avec des suspensions relev?es que vous pouvez conduire. Bonne journ?e!', 34, 5, 'voiture10.png', 22, 5, 0),
(428, 'VO00000011', 'Une voiture de sport', 'Un v?hicule de transport diesel manuelle que l\'on vous vend. Achetez le.', 493, 5, 'voiture11.png', 22, 5, 1),
(429, 'VO00000012', 'Une bagnole ?lectrique', 'Une bagnole familliale cher automatique que vous pouvez conduire. Super!', 281, 5, 'voiture12.png', 22, 1, 0),
(430, 'VO00000013', 'Un v?hicule ?lectrique', 'Un v?hicule familliale pas cher avec des suspensions relev?es que l\'on vous vend. Achetez le.', 910, 5, 'voiture13.png', 22, 5, 0),
(431, 'VO00000014', 'Une voiture de sport', 'Une bagnole ?conomique vert automatique que l\'on vous vend. Super!', 124, 5, 'voiture14.png', 22, 0, 0),
(432, 'VO00000015', 'Une bagnole familliale', 'Un v?hicule de transport cher manuelle que l\'on vous vend. Bonne journ?e!', 619, 5, 'voiture15.png', 22, 1, 0),
(433, 'VO00000016', 'Une voiture ?lectrique', 'Une voiture tout terrain bleu automatique que l\'on vous vend. Achetez le.', 887, 5, 'voiture16.png', 22, 5, 0);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `promoted_categories_id`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `promoted_categories_id` (
`id_categorie` int(11)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `promoted_item`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `promoted_item` (
`id_produit` int(11)
,`reference` varchar(10)
,`nom` varchar(30)
,`description` varchar(1000)
,`prix_ht` float
,`taux_tva` int(3)
,`photo` varchar(20)
,`id_categorie` int(11)
,`note` int(1)
,`en_promotion` tinyint(1)
);

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE `promotion` (
  `id_promotion` int(11) NOT NULL,
  `remise` int(11) NOT NULL DEFAULT 0,
  `reduction` int(3) NOT NULL DEFAULT 0,
  `prix_minimal` int(11) NOT NULL DEFAULT 0,
  `prix_maximal` int(11) NOT NULL DEFAULT 999999999,
  `nom` varchar(10) NOT NULL,
  `date_fin` date NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`id_promotion`, `remise`, `reduction`, `prix_minimal`, `prix_maximal`, `nom`, `date_fin`, `id_categorie`) VALUES
(1, 10, 0, 20, 999999999, 'Noël', '2021-07-08', 6),
(2, 0, 20, 40, 999999999, 'paque', '2021-08-05', 7),
(7, 50, 0, 110, 999999999, 'MoisVert', '2021-07-01', 15),
(8, 0, 30, 1000, 1200, 'ordisuper', '2021-06-24', 2),
(9, 50, 0, 1150, 1250, 'ordigenial', '2021-07-08', 2),
(10, 50, 0, 300, 500, 'promocar', '2021-06-16', 22),
(11, 0, 15, 0, 600, 'telgo', '2021-08-18', 16);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `promotion2`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `promotion2` (
`id_promotion` int(11)
,`nom` varchar(10)
,`date_fin` date
,`remise` int(11)
,`reduction` int(3)
,`prix_minimal` int(11)
,`prix_maximal` int(11)
,`id_categorie` int(11)
);

-- --------------------------------------------------------

--
-- Structure de la vue `promoted_categories_id`
--
DROP TABLE IF EXISTS `promoted_categories_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `promoted_categories_id`  AS SELECT DISTINCT `promotion2`.`id_categorie` AS `id_categorie` FROM `promotion2` ;

-- --------------------------------------------------------

--
-- Structure de la vue `promoted_item`
--
DROP TABLE IF EXISTS `promoted_item`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `promoted_item`  AS SELECT DISTINCT `a`.`id_produit` AS `id_produit`, `a`.`reference` AS `reference`, `a`.`nom` AS `nom`, `a`.`description` AS `description`, `a`.`prix_ht` AS `prix_ht`, `a`.`taux_tva` AS `taux_tva`, `a`.`photo` AS `photo`, `a`.`id_categorie` AS `id_categorie`, `a`.`note` AS `note`, `a`.`en_promotion` AS `en_promotion` FROM (`produit` `a` join `promotion2` `p` on(`p`.`id_categorie` = `a`.`id_categorie`)) WHERE `p`.`prix_minimal` <= `a`.`prix_ht` AND `a`.`prix_ht` <= `p`.`prix_maximal` ;

-- --------------------------------------------------------

--
-- Structure de la vue `promotion2`
--
DROP TABLE IF EXISTS `promotion2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `promotion2`  AS SELECT `p`.`id_promotion` AS `id_promotion`, `p`.`nom` AS `nom`, `p`.`date_fin` AS `date_fin`, `p`.`remise` AS `remise`, `p`.`reduction` AS `reduction`, `p`.`prix_minimal` AS `prix_minimal`, `p`.`prix_maximal` AS `prix_maximal`, `c`.`id_categorie` AS `id_categorie` FROM (`promotion` `p` join `categorie` `c` on(`p`.`id_categorie` = `c`.`id_categorie` or `p`.`id_categorie` = `c`.`parent`)) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id_compte`);

--
-- Index pour la table `parametre`
--
ALTER TABLE `parametre`
  ADD PRIMARY KEY (`id_parametre`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id_promotion`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id_compte` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `parametre`
--
ALTER TABLE `parametre`
  MODIFY `id_parametre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT pour la table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id_promotion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `parametre`
--
ALTER TABLE `parametre`
  ADD CONSTRAINT `parametre_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
