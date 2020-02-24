SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P1 IS 
    CURSOR nations IS
        SELECT nationalite 
        FROM Equipe;
BEGIN
        dbms_output.put_line('les différents pays qui ont participé à la coupe mondiale:');
        FOR ligne IN nations LOOP
            dbms_output.put_line(ligne.nationalite);
        END LOOP;
End P1;
/
-- appel 
BEGIN
    P1;
END;
/