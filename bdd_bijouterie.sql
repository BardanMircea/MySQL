USERS

id_user int pk ai not null
mdp varchar (255) not null
email varchar(255) not null unique
adr_facturation varchar(255) not null unique


ADRESSES_LIVRAISON

id int pk not null auto_increment
user_id int FK REFERENCES user.id_user
nom varchar not null
prenom varchar not null
rue varchar not null
nombre varchar not null
ville varchar not null
cp int (5) not null



PRODUITS

id_produit int pk ai not null
marque_id int fk REFERENCES marques.id_marque
categorie_id fk REFERENCES categories.id_categorie
commentaire_id fk REFERENCES commentaires.id_commentaire
matiere_id int fk REFERENCES matieres.id_matiere
genre enum(homme, femme, enfant, unisexe) null
image_id int fk REFERENCES 


COMMANDES

id_commande int pk ai not null
produit_id int fk REFERENCES produit.id_produit
etat enum("en cours de traitement", "expedie", "livre", retour") not null
code_promo_id int fk REFERENCES codes_promos.id_code_promo null


CODES_PROMO

id_code_promo int pk ai not null
nom varchar not null
valeur_remise int not null


IMAGES

id_image int pk ai not null
adresse_image varchar(255) not null
produit_id int fk REFERENCES produit.id_produit not null


COMMENTAIRES

id_commentaire int pk ai not null
description text null
user_id int fk REFERENCES users.id_user


MATIERES

id_matiere int pk ai not null
nom varchar(255) not null


MARQUES

id_marque int pk ai not null
nom varchar(255) not null


CATEGORIES

id_categorie int pk ai not null
nom varchar not null


ADRESSE_FACTURATION_COMMANDE
id int pk ai not null
adresse_facturation int fk REFERENCES user.adresse_facturation_id


ADRESSE_LIVRAISON_COMMANDE
id int pk ai not null
adresse_id int fk REFERENCES adresse.id_adresse






create table user(
    id_user INT(11) PRIMARY KEY  AUTO_INCREMENT NOT NULL
    email VARCHAR(255) NOT NULL
    mdp VARCHAR(255) NOT NULL
    role ENUM('user', 'admin', 'modo') NOT NULL
    nom VARCHAR(255) NOT NULL
    prenom VARCHAR(255) NOT NULL
    sexe ENUM("m", "f") NOT NULL
    date_naissance DATE NOT NULL
    date_inscription DATETIME NOT NULL
    adresse_facturation_id INT NULL);


CREATE TABLE matiere(
	id_marque INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nom VARCHAR (255) NOT NULL,
	contact VARCHAR(255) NOT NULL,		
	email VARCHAR(255) NOT NULL,
	telephone VARCHAR(255) NOT NULL,
	description TEXT NULL
	);	
CREATE TABLE code_promo(
	id_code_promo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	code VARCHAR(255) NOT NULL,
	valeur ENUM("pourcentage", "euro"),
	remise DOUBLE NOT NULL,
	date_boolean BOOLEAN NOT NULL,
	date_debut DATE NULL,
	date_fin DATE NULL,
	montant_boolean BOOLEAN NOT NULL,
	montant_min DOUBLE NULL,
	montant_max DOUBLE NULL,
	activation BOOLEAN NOT NULL,
	image VARCHAR(255) NULL,
	description TEXT NULL,
	limitation INT NULL);

CREATE TABLE produit(
	id_produit INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nom VARCHAR(255) NOT NULL,
	prix DOUBLE NOT NULL,
	remise INT(2) NULL,
	description TEXT NULL,
	quantite INT NOT NULL,
	genre ENUM ("homme", "femme", "enfant", "unisexe") NOT NULL,
	activation BOOLEAN NOT NULL,
	date_creation DATETIME NOT NULL,
	categorie_id INT NULL,
	marque_id INT NULL,
	FOREIGN KEY (categorie_id) REFERENCES categorie(id_categorie),
	FOREIGN KEY (marque_id) REFERENCES marque(id_marque);
	
CREATE TABLE image(
	id_image INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	src VARCHAR(255) NOT NULL,
	alt TEXT NOT NULL,
	titre VARCHAR(255) NOT NULL,
	produit_id INT NULL,
	FOREIGN KEY(produit_id) REFERENCES produit(id_produit));

CREATE TABLE matiere(
	id_matiere INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nom VARCHAR(255) NOT NULL);


CREATE TABLE produit_matiere(
	produit_id INT NULL,
	matiere_id INT NULL,
	FOREIGN KEY(produit_id) REFERENCES produit(id_produit),
	FOREIGN KEY(matiere_id) REFERENCES matiere(id_matiere));

CREATE TABLE adresse(
	id_adresse INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nom VARCHAR(255) NOT NULL,
	prenom VARCHAR(255) NOT NULL,
	adresse VARCHAR(255) NOT NULL,
	complement VARCHAR(255) NULL,
	cp INT(5) NOT NULL,
	ville VARCHAR(255) NOT NULL,
	pays VARCHAR(255) NOT NULL,
	telephone VARCHAR(255) NOT NULL,
	digicode VARCHAR(255) NULL,
	commentaire TEXT NULL,
	user_id INT NULL);

CREATE TABLE user(
	id_user INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL,
	mdp VARCHAR(255) NOT NULL,
	role ENUM("user", "admin", "modo") NOT NULL,
	nom VARCHAR(255) NOT NULL,
	prenom VARCHAR(255) NOT NULL,
	sexe ENUM("m", "f"),
	date_naissance DATE NOT NULL,
	date_incription DATETIME NOT NULL,	
	adresse_facturation_id INT NULL,
	FOREIGN KEY(adresse_facturation_id) REFERENCES adresse(id_adresse));

CREATE TABLE commentaire(
	id_commentaire INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	user_id INT NULL,
	produit_id INT NULL,
	message TEXT NULL,
	date_creation DATETIME NOT NULL,
	FOREIGN KEY(user_id) REFERENCES user(id_user),
	FOREIGN KEY(produit_id) REFERENCES produit(id_produit));


CREATE TABLE commande(
	id_commande INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	user_id INT NULL,
	date_creation DATETIME NOT NULL,
	montant DOUBLE NOT NULL,
	etat ENUM("en cours de traitement", "expedie", "livre", "retour", "annule") NOT NULL,
	adresse_livraison_commande_id INT NULL,
	adresse_facturation_commande_id INT NULL,
	code_promo_id INT NULL,
	FOREIGN KEY(code_promo_id) REFERENCES code_promo(id_code_promo));



CREATE TABLE adresse_livraison_commande(
	id_adresse_livraison INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nom VARCHAR(255) NOT NULL,
	prenom VARCHAR(255) NOT NULL,
	adresse VARCHAR(255) NOT NULL,
	complement VARCHAR(255) NULL,
	cp INT(5) NOT NULL,
	ville VARCHAR(255) NOT NULL,
	pays VARCHAR(255) NOT NULL,
	telephone VARCHAR(255) NOT NULL,
	digicode VARCHAR(255) NULL,
	commentaire TEXT NULL,
	commande_id INT NULL,
	FOREIGN KEY(commande_id) REFERENCES commande(id_commande));

CREATE TABLE details_commande(
	id_details_commande INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	commande_id INT NULL,
	produit_id INT NULL,
	quantite INT NOT NULL,
	prix DOUBLE NOT NULL,
	remise int(2) NOT NULL);