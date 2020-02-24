SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P4 IS 
    CURSOR vacantes IS
        SELECT m.IDMATCH IDMATCH, 
               (s.NBPLACES - m.NBSPECTATEUR) plc_vacantes   
        FROM match m, stade s
        WHERE m.codestade = s.codestade;
BEGIN
        dbms_output.put_line('le nombre de places vacantes dans le stade par match:');
        FOR ligne IN vacantes LOOP
            dbms_output.put_line(ligne.IDMATCH ||' '|| ligne.plc_vacantes );
        END LOOP;
   
End P4;
/
-- appel 
BEGIN
    P4;
END;
/