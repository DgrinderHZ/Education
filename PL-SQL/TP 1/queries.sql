INSERT INTO TRAIN
(TNUM, TDES, CAPACITE, LIEU )
VALUES
(1,'MAGHREB',1500,'FES');
INSERT INTO TRAIN
(TNUM, TDES, CAPACITE, LIEU )
VALUES
(2,'AOUITA',800,'CASA');
INSERT INTO TRAIN
(TNUM, TDES, CAPACITE, LIEU )
VALUES
(3,'GUERROUJ',2000,'OUJDA' );


INSERT INTO TRAIN
(TNUM, TDES, CAPACITE, LIEU )
VALUES
(4,'MARRAKECH',900,'MARRAKECH');
INSERT INTO TRAIN
(TNUM, TDES, CAPACITE, LIEU )
VALUES
(5,'BOUGHAZ',1000,'TANGER');
INSERT INTO TRAIN
(TNUM, TDES, CAPACITE, LIEU )
VALUES
(6,'GIBRALTAR',800,'TANGER');
INSERT INTO TRAIN
(TNUM, TDES, CAPACITE, LIEU )
VALUES
(7,'PROMENADE',2000,'CASA');

------------------------------
INSERT INTO CONDUCTEUR
(CNUM, CNOM, CPRENOM, VILLE, SALAIRE)
VALUES
(1,'LAHIA','MOHA','FES',8000);

INSERT INTO CONDUCTEUR
(CNUM, CNOM, CPRENOM, VILLE, SALAIRE)
VALUES
(2,'MEKNASSI','DRISS','MEKNES',12000);

INSERT INTO CONDUCTEUR
(CNUM, CNOM, CPRENOM, VILLE, SALAIRE)
VALUES
(3,'TAZI','JAOUAD','TAZA',9000);

INSERT INTO CONDUCTEUR
(CNUM, CNOM, CPRENOM, VILLE, SALAIRE)
VALUES
(4,'KHALDI','KHALID','MARRAKECH',7000);

INSERT INTO CONDUCTEUR
(CNUM, CNOM, CPRENOM, VILLE, SALAIRE)
VALUES
(5,'ALAMI','SAID','TANGER',10000);

INSERT INTO CONDUCTEUR
(CNUM, CNOM, CPRENOM, VILLE, SALAIRE)
VALUES
(6,'ADNANI','ZIDANE','FES',9000);

-----------------------------
SELECT CNUM,CNOM
FROM CONDUCTEUR
ORDER BY CNOM;
--------------------------------
SELECT AVG(SALAIRE) FROM CONDUCTEUR;
--------------------------------------
SELECT VILLE, MAX(SALAIRE) FROM CONDUCTEUR
GROUP BY VILLE;
------------------------------
set serveroutput on size 1000000
set linesize 150
spool @C:\Users\Omaima\Desktop\MST SIDI S3\Bases de données réparties\test.sql
select CNOM from CONDUCTEUR;
spool off
-------------------------------------------------------
CREATE TABLE TRAIN(TNUM NUMBER PRIMARY KEY NOT NULL, TDES VARCHAR(20), CAPACITE INTEGER,LIEU VARCHAR(20));
---------------------------------------------------------------------------------------
CREATE TABLE CONDUCTEUR(CNUM NUMBER PRIMARY KEY NOT NULL, CNOM VARCHAR(20),CPRENOM VARCHAR(20),VILLE VARCHAR(30), SALAIRE INTEGER);
------------------------------------------------------------------------------------------------
 CREATE TABLE TRAJET(TRNUM NUMBER  PRIMARY KEY NOT NULL,
		     TNUM NUMBER REFERENCES TRAIN(TNUM), 
		     CNUM NUMBER REFERENCES CONDUCTEUR (CNUM), 
	             VILLEDEP VARCHAR(30), VILLEARR VARCHAR(30), 
		     HEUREDEP TIMESTAMP , HEUREARR TIMESTAMP );
 ------------------------------------------------------------------------------------
 SELECT CNUM,CNOM
 FROM CONDUCTEUR
 ORDER BY CNOM;
  ----------------------------------------------
  SELECT AVG(SALAIRE) FROM CONDUCTEUR;
  ------------------------------------------
  SELECT MAX(SALAIRE) FROM CONDUCTEUR;
  -------------------------------------------
  SELECT VILLE FROM CONDUCTEUR WHERE SALAIRE =(SELECT MAX (SALAIRE) FROM CONDUCTEUR);


insert into trajet values(1, 2, 3, 'FES', 'MEKNES', '2019-06-DEC 20:54:45', '2019-06-DEC 23:54:45');


create table trajet(trnum integer primary key not null,
    tnum integer references train(tnum) not null,
    cnum integer references conducteur(cnum)not null,
    villedep varchar(20),
    villearr varchar(20),
    heuredep timestamp with local time zone ,
    heurearr timestamp with local time zone );

insert into trajet 
values(5, 1, 3, 'FES', 'MEKNES', '14/12/19 21:58:13,086000', '14/12/19 23:58:13,086000');

SELECT ename nom, hiredate "Date d'embauche", 
    TO_CHAR(NEXT_DAY(ADD_MONTHS( SYSDATE, 6 ),'LUNDI'),'DD/MM/YYYY HH24:MM:SS')
    "Date Négociation"
from emp;
========================
