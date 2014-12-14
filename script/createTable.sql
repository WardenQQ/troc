CREATE TABLE Adresse(
  rue VARCHAR2(256) NOT NULL,
  ville VARCHAR2(256) NOT NULL,
  region VARCHAR2(256) NOT NULL,
  latitude NUMBER,
  longitude NUMBER,
  PRIMARY KEY (rue, ville, region)
);

CREATE TABLE Utilisateur(
  login VARCHAR2(32) NOT NULL,
  motDePasse VARCHAR2(32) NOT NULL,
  rue VARCHAR2(256) NOT NULL,
  ville VARCHAR2(256) NOT NULL,
  region VARCHAR2(256) NOT NULL,
  urlPhoto VARCHAR2(256),
  PRIMARY KEY (login),
  FOREIGN KEY (rue, ville, region)
    REFERENCES Adresse(rue, ville, region)
);

CREATE TABLE Categorie(
  nom VARCHAR(32),
  parent VARCHAR(32),
  PRIMARY KEY (nom),
  FOREIGN KEY (parent)
    REFERENCES Categorie(nom)
);

CREATE TABLE Bien(
  proprietaire VARCHAR2(32) NOT NULL,
  nom VARCHAR2(32) NOT NULL,
  categorie VARCHAR2(32),
  etat NUMBER(1) NOT NULL,
  valeurEstimee NUMBER DEFAULT(0) NOT NULL,
  descriptif VARCHAR2(32),
  urlPhoto VARCHAR2(32),
  PRIMARY KEY (proprietaire, nom, categorie, etat),
  FOREIGN KEY (proprietaire)
    REFERENCES Utilisateur(login),
  FOREIGN KEY (categorie)
    REFERENCES Categorie(nom)
);

CREATE TABLE Service(
  proprietaire VARCHAR2(32) NOT NULL,
  nom VARCHAR2(32) NOT NULL,
  categorie VARCHAR2(32),
  dateService DATE NOT NULL,
  valeurEstimee NUMBER DEFAULT(0) NOT NULL,
  descriptif VARCHAR2(32),
  urlPhoto VARCHAR2(32),
  PRIMARY KEY (proprietaire, nom, categorie, dateService),
  FOREIGN KEY (proprietaire)
    REFERENCES Utilisateur(login),
  FOREIGN KEY (categorie)
    REFERENCES Categorie(nom)
);


