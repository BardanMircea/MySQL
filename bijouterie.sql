-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 24 sep. 2022 à 18:30
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bijouterie`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id_adresse` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `cp` int(5) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `digicode` varchar(255) DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `nom`, `prenom`, `adresse`, `complement`, `cp`, `ville`, `pays`, `telephone`, `digicode`, `commentaire`, `user_id`) VALUES
(1, 'nom1', 'prenom1', 'adresse1', NULL, 77000, 'Melun', 'France', '789456123', NULL, 'premiere a gauche', 1),
(2, 'nom2', 'prenom2', 'adresse2', NULL, 77550, 'Reau', 'France', '654987321', 'asd3ffr434', NULL, 2),
(3, 'nom3', 'prenom3', 'adresse3', NULL, 9300, 'Versailles', 'France', '023456120', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `adresse_facturation_commande`
--

CREATE TABLE `adresse_facturation_commande` (
  `id_adresse_facturation` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `cp` int(5) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `commande_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adresse_facturation_commande`
--

INSERT INTO `adresse_facturation_commande` (`id_adresse_facturation`, `nom`, `prenom`, `adresse`, `complement`, `cp`, `ville`, `pays`, `telephone`, `commande_id`) VALUES
(1, 'nom1', 'prenom1', 'adresse1', NULL, 93000, 'Paris', 'France', '456123789', 1),
(2, 'nom2', 'prenom2', 'adresse2', NULL, 91000, 'Paris', 'France', '45612398', 2),
(3, 'nom3', 'prenom3', 'adresse3', NULL, 77550, 'Reau', 'France', '14725396', 3);

-- --------------------------------------------------------

--
-- Structure de la table `adresse_livraison_commande`
--

CREATE TABLE `adresse_livraison_commande` (
  `id_adresse_livraison` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `cp` int(5) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `digicode` varchar(255) DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `commande_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adresse_livraison_commande`
--

INSERT INTO `adresse_livraison_commande` (`id_adresse_livraison`, `nom`, `prenom`, `adresse`, `complement`, `cp`, `ville`, `pays`, `telephone`, `digicode`, `commentaire`, `commande_id`) VALUES
(1, 'nom1', 'prenom1', 'adresse1', NULL, 77000, 'Melun', 'France', '465123789', 'qwerty', NULL, 1),
(2, 'nom2', 'prenom2', 'adresse2', NULL, 91000, 'Paris', 'France', '354156287', 'azerty', NULL, 2),
(3, 'nom3', 'prenom3', 'adresse3', NULL, 77550, 'Reau', 'France', '147258369', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`, `description`) VALUES
(1, 'categorie1', NULL),
(2, 'categorie2', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `code_promo`
--

CREATE TABLE `code_promo` (
  `id_code_promo` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `valeur` enum('pourcentage','euro') DEFAULT NULL,
  `remise` double NOT NULL,
  `date_boolean` tinyint(1) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `montant_boolean` tinyint(1) NOT NULL,
  `montant_min` double DEFAULT NULL,
  `montant_max` double DEFAULT NULL,
  `activation` tinyint(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `limitation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `code_promo`
--

INSERT INTO `code_promo` (`id_code_promo`, `code`, `valeur`, `remise`, `date_boolean`, `date_debut`, `date_fin`, `montant_boolean`, `montant_min`, `montant_max`, `activation`, `image`, `description`, `limitation`) VALUES
(1, '1', 'euro', 10, 1, '2022-09-01', '2022-09-30', 0, NULL, NULL, 1, NULL, 'remise mois septembre', NULL),
(2, 'AsDf12', 'pourcentage', 12, 0, NULL, NULL, 1, 10, 50, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `montant` double NOT NULL,
  `etat` enum('en cours de traitement','expedie','livre','retour','annule') NOT NULL,
  `adresse_livraison_commande_id` int(11) DEFAULT NULL,
  `adresse_facturation_commande_id` int(11) DEFAULT NULL,
  `code_promo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `user_id`, `date_creation`, `montant`, `etat`, `adresse_livraison_commande_id`, `adresse_facturation_commande_id`, `code_promo_id`) VALUES
(1, 1, '2022-09-22 16:55:52', 100, 'en cours de traitement', 1, 1, 1),
(2, 2, '2022-09-23 09:52:33', 1000, 'expedie', 2, 2, 2),
(3, 3, '2022-09-23 10:04:49', 499.99, 'livre', 3, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id_commentaire` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id_commentaire`, `user_id`, `produit_id`, `message`, `date_creation`) VALUES
(1, 1, 1, 'whatever', '2022-09-22 16:12:15'),
(2, 3, 3, 'bof', '2022-09-23 10:04:28');

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `id_details_commande` int(11) NOT NULL,
  `commande_id` int(11) DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `prix` double NOT NULL,
  `remise` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `details_commande`
--

INSERT INTO `details_commande` (`id_details_commande`, `commande_id`, `produit_id`, `quantite`, `prix`, `remise`) VALUES
(1, 1, 1, 1, 99.99, 10),
(2, 2, 2, 1, 99.99, 12),
(3, 3, 3, 1, 499.99, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id_image` int(11) NOT NULL,
  `src` varchar(255) NOT NULL,
  `alt` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `produit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id_image`, `src`, `alt`, `title`, `produit_id`) VALUES
(1, 'produit1.png', 'alt desc', 'produit1', 1),
(2, 'produit2', 'alt desc2', 'produit2', 2),
(3, 'produit3.jpeg', 'altDesc3', 'produit3', 3);

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id_marque` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom`, `contact`, `email`, `telephone`, `description`) VALUES
(1, 'marque1', '1 rue de nulle Part, Paris', 'contactmarque1@mail.com', '123456789', NULL),
(2, 'marque2', '2 rue d\'ailleurs, Ailleurs', 'contactMarque2@mail.com', '789456123', 'lorem ipsum'),
(3, 'marque3', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `nom`) VALUES
(1, 'or'),
(2, 'ag'),
(3, 'pt');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `remise` int(2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `genre` enum('homme','femme','enfant','unisexe') NOT NULL,
  `activation` tinyint(1) NOT NULL,
  `date_creation` datetime NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `marque_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `nom`, `prix`, `remise`, `description`, `quantite`, `genre`, `activation`, `date_creation`, `categorie_id`, `marque_id`) VALUES
(1, 'produit1', 99.99, 10, 'lorem ipsum', 5, 'homme', 0, '2022-09-22 16:00:03', 1, 2),
(2, 'produit2', 9.99, NULL, NULL, 10, 'unisexe', 1, '2022-09-22 16:00:03', 2, 1),
(3, 'produit3', 499.99, 5, NULL, 2, 'femme', 1, '2022-09-23 09:59:53', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `produit_matiere`
--

CREATE TABLE `produit_matiere` (
  `produit_id` int(11) DEFAULT NULL,
  `matiere_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit_matiere`
--

INSERT INTO `produit_matiere` (`produit_id`, `matiere_id`) VALUES
(1, 1),
(2, 2),
(1, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `role` enum('user','admin','modo') NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `sexe` enum('m','f') DEFAULT NULL,
  `date_naissance` date NOT NULL,
  `date_incription` datetime NOT NULL,
  `adresse_facturation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `email`, `mdp`, `role`, `nom`, `prenom`, `sexe`, `date_naissance`, `date_incription`, `adresse_facturation_id`) VALUES
(1, 'nom1@mail.com', 'mdp', 'admin', 'nom1', 'prenom1', 'f', '2022-09-06', '2022-09-22 15:55:25', 1),
(2, 'nom2@mail.com', '123', 'modo', 'nom2', 'prenom2', 'f', '2022-09-28', '2022-09-22 15:55:25', 2),
(3, 'nom3@mail.com', '369', 'user', 'nom3', 'prenom3', 'f', '2022-09-01', '2022-09-23 09:37:57', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adresse`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Index pour la table `adresse_facturation_commande`
--
ALTER TABLE `adresse_facturation_commande`
  ADD PRIMARY KEY (`id_adresse_facturation`),
  ADD KEY `adresse_facturation_commande_ibfk_1` (`commande_id`);

--
-- Index pour la table `adresse_livraison_commande`
--
ALTER TABLE `adresse_livraison_commande`
  ADD PRIMARY KEY (`id_adresse_livraison`),
  ADD KEY `adresse_livraison_commande_ibfk_1` (`commande_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `code_promo`
--
ALTER TABLE `code_promo`
  ADD PRIMARY KEY (`id_code_promo`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `fk_adresse_livraison_commande_id` (`adresse_livraison_commande_id`),
  ADD KEY `fk_adresse_facturation_commande_id` (`adresse_facturation_commande_id`),
  ADD KEY `commande_ibfk_1` (`code_promo_id`),
  ADD KEY `commande_ibfk_2` (`user_id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id_commentaire`),
  ADD KEY `commentaire_ibfk_1` (`user_id`),
  ADD KEY `commentaire_ibfk_2` (`produit_id`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id_details_commande`),
  ADD KEY `fk_produit_id` (`produit_id`),
  ADD KEY `fk_commande_id` (`commande_id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `image_ibfk_1` (`produit_id`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id_marque`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_matiere`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `produit_ibfk_1` (`categorie_id`),
  ADD KEY `produit_ibfk_2` (`marque_id`);

--
-- Index pour la table `produit_matiere`
--
ALTER TABLE `produit_matiere`
  ADD KEY `produit_id` (`produit_id`),
  ADD KEY `matiere_id` (`matiere_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `user_ibfk_1` (`adresse_facturation_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `adresse_facturation_commande`
--
ALTER TABLE `adresse_facturation_commande`
  MODIFY `id_adresse_facturation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `adresse_livraison_commande`
--
ALTER TABLE `adresse_livraison_commande`
  MODIFY `id_adresse_livraison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `code_promo`
--
ALTER TABLE `code_promo`
  MODIFY `id_code_promo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `details_commande`
--
ALTER TABLE `details_commande`
  MODIFY `id_details_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id_marque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_matiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `adresse_facturation_commande`
--
ALTER TABLE `adresse_facturation_commande`
  ADD CONSTRAINT `adresse_facturation_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id_commande`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `adresse_livraison_commande`
--
ALTER TABLE `adresse_livraison_commande`
  ADD CONSTRAINT `adresse_livraison_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id_commande`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`code_promo_id`) REFERENCES `code_promo` (`id_code_promo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_adresse_facturation_commande_id` FOREIGN KEY (`adresse_facturation_commande_id`) REFERENCES `adresse_facturation_commande` (`id_adresse_facturation`),
  ADD CONSTRAINT `fk_adresse_livraison_commande_id` FOREIGN KEY (`adresse_livraison_commande_id`) REFERENCES `adresse_livraison_commande` (`id_adresse_livraison`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD CONSTRAINT `fk_commande_id` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id_commande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produit_id` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id_produit`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id_categorie`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id_marque`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit_matiere`
--
ALTER TABLE `produit_matiere`
  ADD CONSTRAINT `produit_matiere_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `produit_matiere_ibfk_2` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id_matiere`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`adresse_facturation_id`) REFERENCES `adresse` (`id_adresse`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
