SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION F1(N IN stade.codestade%TYPE) RETURN VARCHAR2 IS 
        nom VARCHAR(20);
        nbr_match INTEGER;
BEGIN
        
        SELECT s.nomstade, count(m.idmatch)  INTO NOM, nbr_match
        FROM match m, stade s
        WHERE s.codestade = N AND m.codestade = s.codestade 
        GROUP BY s.nomstade;
     RETURN ('Nom stade est: ' || nom || ' ET nombre de matche joué est '||nbr_match);
End F1;
/
-- appel 
BEGIN
    DBMS_OUTPUT.put_line(F1(1));
END;
/