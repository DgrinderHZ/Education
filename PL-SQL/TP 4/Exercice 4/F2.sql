SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION F2(p_nom IN individu.nom%TYPE) RETURN VARCHAR IS 
       
        CURSOR matches is
            SELECT m.idmatch idmatch
            FROM match m, individu i
            WHERE i.nom = p_nom and i.noindividu = m.noindividu ;
        ch VARCHAR(100);
BEGIN
    ch := '->';
    FOR ligne in matches LOOP
           ch := ch || ', matche ' || ligne.idmatch;
    end loop;
    
    RETURN ch;
End F2;
/
-- appel 
BEGIN
    DBMS_OUTPUT.put_line('liste des matches arbitré par NA');
    DBMS_OUTPUT.put_line(F2('NA'));
END;
/