--  creatio  des tables!
CREATE TABLE HOTEL ( 
    idhotel INTEGER PRIMARY KEY,
    nom VARCHAR(20),
    ville VARCHAR(20)
);

CREATE TABLE TYPES ( 
    idtype INTEGER PRIMARY KEY,
    nom VARCHAR(20),
    tarif INTEGER
);

CREATE TABLE visiteur ( 
    idvisiteur INTEGER PRIMARY KEY,
    nom VARCHAR(20),
    ville VARCHAR(20)
);

CREATE TABLE RESERVATION ( 
    idchambre INTEGER PRIMARY KEY,
    datadebut DATE,
    datafin DATE,
    idvisiteur INTEGER REFERENCES visiteur(idvisiteur)
);

CREATE TABLE CHAMBRE ( 
    idchambre INTEGER PRIMARY KEY,
    price NUMBER(8,2),
    nb_reservation INTEGER,
    idhotel INTEGER REFERENCES hotel(idhotel),
    idtype INTEGER REFERENCES types(idtype)
);

-- Insertion
INSERT INTO HOTEL VALUES (1, 'Hassan', 'Mssici');
INSERT INTO HOTEL VALUES (2, 'Abdo', 'Alnif');
INSERT INTO HOTEL VALUES (3, 'Hamza', 'Mssici');

INSERT INTO types VALUES (1, 'Pour couple', 200);
INSERT INTO types VALUES (2, 'Pour couple', 200);
INSERT INTO types VALUES (3, 'Pour un', 150);
INSERT INTO types VALUES (4, 'Pour un', 150);

INSERT INTO visiteur VALUES (1, 'Hassan Zekkouri', 'Mssici');
INSERT INTO visiteur VALUES (2, 'Mohammed Zekkouri', 'Mssici');
INSERT INTO visiteur VALUES (3, 'Othmane Zekkouri', 'Mssici');

INSERT INTO chambre VALUES (1, 100, 1, 1, 1);
INSERT INTO chambre VALUES (2, 100, 2, 1, 2);
INSERT INTO chambre VALUES (3, 100, 2, 1, 2);

INSERT INTO reservation VALUES (1, '12/02/12', '13/02/12', 2);
INSERT INTO reservation VALUES (2, '12/02/14', '13/02/14', 1);
INSERT INTO reservation VALUES (4, '12/02/08', '13/02/08', 3);


