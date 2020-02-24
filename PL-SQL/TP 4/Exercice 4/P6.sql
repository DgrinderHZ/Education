SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P6(p_code IN equipe.codeequipe%TYPE) IS 
    CURSOR arbitres IS
        SELECT i.NOM NOM
        FROM individu i, jouer j, match m
        WHERE j.codeequipe = p_code and i.noindividu = m.noindividu 
        ORDER BY  1;
BEGIN
        dbms_output.put_line(' noms ordonnés des arbitres des matchs joués par une équipe numéro :' || p_code);
        FOR ligne IN arbitres LOOP
            dbms_output.put_line(ligne.NOM );
        END LOOP;
   
End P6;
/

-- appel 
BEGIN
    P6(0);
END;
/