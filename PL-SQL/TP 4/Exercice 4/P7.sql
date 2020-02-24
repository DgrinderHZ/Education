SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P7(N IN INTEGER, p_type IN but.type%TYPE) IS 
    CURSOR buteur IS
        SELECT i.NOM NOM, count(b.idbut) nbBut
        FROM individu i, but b
        WHERE i.noindividu = b.noindividu and b.type = p_type
        GROUP BY i.NOM
        ORDER BY  i.nom;
BEGIN
        dbms_output.put_line('les noms des joueurs qui ont marqué au moins N buts de type : ' || p_type);
        FOR ligne IN buteur LOOP
           if ligne.nbBut >= N then
                dbms_output.put_line(ligne.NOM );
           end if;
        END LOOP;
   
End P7;
/

-- appel 
BEGIN
    P7(1, 'Tir');
END;
/