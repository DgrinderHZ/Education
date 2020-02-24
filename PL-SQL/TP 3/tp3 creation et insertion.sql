CREATE TABLE COURSES ( 
    num_operation NUMBER(4,2) PRIMARY KEY,
    nom_operation VARCHAR (15),
    categorie VARCHAR (10),
    date_operation DATE,
    montant NUMBER (6, 2)
);
CREATE TABLE BUDGET_SEUIL( 
    NUM_OPERATION NUMBER(4,2)PRIMARY KEY NOT NULL,
    DATE_OPERATION DATE,
    MONTANT NUMBER(6, 2)
);
INSERT INTO budget VALUES(
3,
'toto',
'Débit',
CAST('10/12/2004' AS DATE),
100,
1500
);
drop table budget_seuil;
/*CREATE TABLE BUDGET_EURO( 
    NUM_OPERATION NUMBER(4,2)PRIMARY KEY NOT NULL,
    NOM_OPERATION VARCHAR2(15),
    CATEGORIE VARCHAR2 (10),
    DATE_OPERATION DATE,
    MONTANT NUMBER(6, 2),
    SOLDE NUMBER (7, 2)
);
drop table budget_euro;

CREATE TABLE COURSES ( 
    num_operation NUMBER(4,2) PRIMARY KEY,
    nom_operation VARCHAR (15),
    categorie VARCHAR (10),
    date_operation DATE,
    montant NUMBER (6, 2)
);
drop table courses;
/*
INSERT INTO budget VALUES(
0,
'INITIAL',
'CREATION',
CAST('10/12/2003' AS DATE),
100,
1500
);
/*
CREATE TABLE BUDGET( 
    NUM_OPERATION NUMBER(4,2)PRIMARY KEY,
    NOM_OPERATION VARCHAR2 (15),
    CATEGORIE VARCHAR2 (10),
    DATE_OPERATION DATE,
    MONTANT NUMBER (6, 2),
    SOLDE NUMBER (7, 2) 
);