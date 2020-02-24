SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P3(N IN INTEGER) IS 
    CURSOR stades_N IS
        SELECT NOMSTADE  
        FROM stade
        WHERE NBPLACES > N;
BEGIN
        dbms_output.put_line('les noms des stades qui ont pu accueillir plus de N spectateurs:');
        FOR ligne IN stades_N LOOP
            dbms_output.put_line(ligne.NOMSTADE  );
        END LOOP;
   
End P3;
/
-- appel 
BEGIN
    P3(28);
END;
/