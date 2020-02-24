SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE P10 IS 
      CURSOR marocain IS -- id des joueurs
        SELECT DISTINCT i.noindividu
        FROM individu i, equipe e
        WHERE i.codeequipe = e.codeequipe and  e.nationalite = 'Maroc';
      i INTEGER;
      minut INTEGER := 2; -- fixer à la 2eme minute
BEGIN
        
        SELECT count(*) into i
        FROM but;
         i := i + 1;
       
        FOR ligne IN marocain LOOP
           FOR fois IN 1..2 LOOP
                 INSERT INTO BUT VALUES (i, minut,'Tir',0, ligne.noindividu);
                   i := i + 1;
                   minut := minut + 1;
           END LOOP;
        END LOOP;
        
End P10;
/
-- appel 
BEGIN
    P10;
END;
/