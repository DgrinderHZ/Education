SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P8(p_code IN equipe.codeequipe%TYPE) IS 
    CURSOR butParEquipe IS
        SELECT e.codeequipe, e.nationalite, count(b.idbut) nbr_but 
        FROM individu i, but b, equipe e
        WHERE i.noindividu = b.noindividu and e.codeequipe = i.codeequipe
              and e.codeequipe = p_code
        GROUP BY e.codeequipe, e.nationalite;
BEGIN
        dbms_output.put_line('le nombre de buts marqués par léquipe numéro : ' || p_code);
        FOR ligne IN butParEquipe LOOP
                dbms_output.put_line( 'Nom Equipe: '|| ligne.nationalite||', Nombre buts: '||ligne.nbr_but);
        END LOOP;
   
End P8;
/

-- appel 
BEGIN
    P8(0);
END;
/