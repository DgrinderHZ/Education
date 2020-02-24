--  creatio  des tables!
CREATE TABLE PILOTE ( 
    nopilote INTEGER PRIMARY KEY,
    nompil VARCHAR(20),
    adresse VARCHAR(20),
    salaire INTEGER,
    prime INTEGER,
    embauche date
);


INSERT INTO pilote VALUES (1, 'hassan', 'mcissi, alnif', 1000, 200, '13/02/12');
INSERT INTO pilote VALUES (2, 'ALI', 'AZAG, alnif', 1000, 200, '13/02/13');
INSERT INTO pilote VALUES (3, 'haMZA', 'TINGHIR, R565', 1000, 200, '13/02/13');


