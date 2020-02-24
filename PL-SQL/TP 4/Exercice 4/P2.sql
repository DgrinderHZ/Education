SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P2 IS 
    CURSOR arbitres IS
        SELECT NOINDIVIDU , NOM , PRENOM , CODEEQUIPE  
        FROM individu
        WHERE NOM like '%NA%';
BEGIN
        dbms_output.put_line('la liste des arbitres:');
        FOR ligne IN arbitres LOOP
            dbms_output.put_line(ligne.NOINDIVIDU || ' '|| ligne.NOM || ' '|| ligne.PRENOM || ' '|| ligne.CODEEQUIPE );
        END LOOP;
   
End P2;
/
-- appel 
BEGIN
    P2;
END;
/