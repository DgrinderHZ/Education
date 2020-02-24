SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE P9 IS 
    mx_but INTEGER;
    CURSOR kuKhlahaLboussoufa IS
        SELECT i.nom , count(b.idbut) nbr_but
        FROM individu i, but b, equipe e
        WHERE i.noindividu = b.noindividu and e.codeequipe = i.codeequipe
               and  e.nationalite = 'Maroc'
        GROUP BY i.nom;
BEGIN
        SELECT max(count(b.idbut)) INTO mx_but
        FROM individu i, but b, equipe e
        WHERE i.noindividu = b.noindividu and e.codeequipe = i.codeequipe
               and  e.nationalite = 'Maroc'
        GROUP BY i.nom;
        
        dbms_output.put_line('les noms des joueurs marocains qui ont marqué le maximum de buts: ');
        FOR ligne IN kuKhlahaLboussoufa LOOP
           if ligne.nbr_but = mx_but then
                dbms_output.put_line(ligne.nom || ' a marqué '|| ligne.nbr_but|| ' but(s).');
           end if;
        END LOOP;
End P9;
/

-- appel 
BEGIN
    P9;
END;
/