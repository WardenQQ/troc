CREATE TABLE Adresse(
  rue VARCHAR2 NOT NULL,
  ville VARCHAR2 NOT NULL,
  region VARCHAR2 NOT NULL,
  latitude NUMBER,
  longitude NUMBER,

  CONSTRAINT Adress_PK PRIMARY KEY (rue, ville, region)
);

CREATE TABLE Utilisateur(
  login VARCHAR2 NOT NULL,
  motDePasse VARCHAR2 NOT NULL,
  rue VARCHAR2 NOT NULL,
  ville VARCHAR2 NOT NULL,
  region VARCHAR2 NOT NULL,
  urlPhoto VARCHAR2 NOT NULL,

  CONSTRAINT Utilisateur_PK PRIMARY KEY (login)
  CONSTRAINT Adresse_FK FOREIGN KEY (rue, ville, region)
    REFERENCES Adresse(rue, ville, region)
);
