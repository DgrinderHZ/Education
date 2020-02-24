SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P5 IS 
    CURSOR marocain IS
        SELECT i.NOM NOM, i.PRENOM PRENOM
        FROM individu i, equipe e
        WHERE i.codeequipe = e.codeequipe And e.nationalite='Maroc';
BEGIN
        dbms_output.put_line(' les noms des joueurs marocains qui ont participé à la coupe mondiale:');
        FOR ligne IN marocain LOOP
            dbms_output.put_line(ligne.NOM);
        END LOOP;
   
End P5;
/
-- appel 
BEGIN
    P5;
END;
/