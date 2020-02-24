--  creatio  des tables!
CREATE TABLE CLIENTS ( 
    idclt INTEGER PRIMARY KEY,
    nom VARCHAR (20),
    adresse VARCHAR (40),
    nbvoiturelouee INTEGER
);

CREATE TABLE PAYS ( 
    idpays INTEGER PRIMARY KEY,
    nompays VARCHAR(20)
);

CREATE TABLE MARQUES ( 
    idmarque INTEGER PRIMARY KEY,
    nomMarque VARCHAR(20),
    idpays INTEGER REFERENCES pays(idpays)
);

CREATE TABLE VOITURES ( 
    idv INTEGER PRIMARY KEY,
    dataconstruction DATE,
    idmarque INTEGER REFERENCES marques(idmarque)
);

CREATE TABLE LOCATIONS ( 
    idloc INTEGER PRIMARY KEY,
    dateloc DATE,
    duree INTEGER, -- en jour
    idclt INTEGER REFERENCES clients(idclt),
    idv INTEGER REFERENCES voitures(idv)
);

-- Insertion
INSERT INTO clients VALUES (1, 'Hassan', 'Mssici, Alnif, Tinghir', 0);
INSERT INTO clients VALUES (2, 'Mohammed', 'Mssici, Alnif, Tinghir', 1);
INSERT INTO clients VALUES (3, 'Ali', 'Achbarou, Alnif, Tinghir', 2);
INSERT INTO clients VALUES (4, 'Sliman', 'Azag, Alnif, Tinghir', 1);

INSERT INTO pays VALUES (1, 'Maroc');

INSERT INTO marques VALUES (1, 'Nissan', 1);
INSERT INTO marques VALUES (2, 'Dacia', 1);
INSERT INTO marques VALUES (3, 'Renault', 1);
INSERT INTO marques VALUES (4, 'Ford', 1);

INSERT INTO voitures VALUES (1, '12/12/2013', 1);
INSERT INTO voitures VALUES (2, '12/12/2009', 1);
INSERT INTO voitures VALUES (3, '12/12/2003', 2);
INSERT INTO voitures VALUES (4, '12/12/2019', 2);
INSERT INTO voitures VALUES (5, '12/12/2015', 3);
INSERT INTO voitures VALUES (6, '12/12/2012', 3);
INSERT INTO voitures VALUES (7, '12/12/2014', 4);
INSERT INTO voitures VALUES (8, '12/12/2011', 4);
