--  creatio  des tables!
CREATE TABLE equipe ( 
    codeequipe INTEGER PRIMARY KEY,
    nationalite VARCHAR(20)
);

CREATE TABLE STADE ( 
    codestade INTEGER PRIMARY KEY,
    nomStade VARCHAR(20),
    nbPlaces INTEGER
);

CREATE TABLE INDIVIDU ( 
    noIndividu INTEGER PRIMARY KEY,
    nom VARCHAR(20),
    prenom VARCHAR(20),
    codeequipe INTEGER REFERENCES equipe(codeequipe)
);

CREATE TABLE MATCH( 
    idMatch INTEGER PRIMARY KEY,
    nbSpectateur INTEGER,
    data DATE,
    noIndividu INTEGER REFERENCES individu(noIndividu),
    codestade INTEGER REFERENCES stade(codestade)
);

CREATE TABLE but ( 
    idbut INTEGER PRIMARY KEY,
    minute NUMBER(8,2),
    type VARCHAR(20),
    idMatch INTEGER REFERENCES match(idMatch),
    noIndividu INTEGER REFERENCES individu(noIndividu)
);

CREATE TABLE jouer (
    idMatch INTEGER REFERENCES match(idMatch),
    codeequipe INTEGER REFERENCES equipe(codeequipe),
    PRIMARY KEY(idmatch, codeequipe)
)
-- Insertion
insert into Equipe values(0,'Maroc');
insert into Equipe values(1,'Tunisie');
insert into Equipe values(2,'Camerone');
insert into Equipe values(3,'Manga');

insert into Stade values(0,'Amerigo',1000);
insert into Stade values(1,'Orange',1000);
insert into Stade values(2,'Pricipaux',1000);

insert into Individu values(0,'N1','P1',0);
insert into Individu values(1,'N2','P2',0);
insert into Individu values(2,'N3','P3',0);
insert into Individu values(3,'N4','P4',0);
insert into Individu values(4,'N5','P5',0);
insert into Individu values(5,'N6','P6',0);
insert into Individu values(6,'N7','P7',0);
insert into Individu values(7,'N8','P8',1);
insert into Individu values(8,'N9','P9',1);
insert into Individu values(9,'N10','P10',1);
insert into Individu values(10,'N11','P11',1);
insert into Individu values(11,'N12','P12',1);
insert into Individu values(12,'N13','P13',1);
insert into Individu values(13,'N14','P14',1);
insert into Individu values(14,'NA','PA', null);
insert into Individu values(15,'NA2','PA2', null);

insert into Match values(0,200,'23/07/2003',14,0);
insert into Match values(1,200,'23/07/2003',14,1);
insert into Match values(2,200,'23/07/2003',15,1);

insert into Jouer values(0,0);
insert into Jouer values(0,1);
insert into Jouer values(2,1);
insert into Jouer values(2,2);

insert into But values(1, 15,'Tir',0,1);
insert into But values(2, 23,'Diving header',0,2);
insert into But values(3, 44,'Freestyle',0,3);
insert into But values(4, 79,'Long rage',0,7);
insert into But values(5, 90,'Cross',0,9);
insert into But values(6, 17,'Tir',0,1);