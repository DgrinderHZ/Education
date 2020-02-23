SET SERVEROUT ON;
DECLARE
nom_ville VARCHAR(20) ;
nombre_min INTEGER ;
nombre_max INTEGER ;
nombre_moyen INTEGER ;
BEGIN
-- a) Entrez le nom d'une ville
nom_ville := '&Entrez_un_nom_ville';
-- b) Requete
SELECT AVG(nbkm), MIN(nbkm), MAX(nbkm)
INTO nombre_moyen, nombre_min, nombre_max
FROM trajet
WHERE villedep = nom_ville ;
-- Affichez
DBMS_OUTPUT.PUT_LINE('#### Ville de départ : '|| nom_ville) ;
DBMS_OUTPUT.PUT_LINE(' --> Nombre moyen : '|| nombre_moyen) ;
DBMS_OUTPUT.PUT_LINE(' --> Nombre minimum : '|| nombre_min) ;
DBMS_OUTPUT.PUT_LINE(' --> Nombre maximum : '|| nombre_max) ;
END;
