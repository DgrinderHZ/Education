set SERVEROUTPUT ON;
DECLARE
    numV INTEGER;
    marqu Varchar(20);
    procedure Q2 is
        Cursor dernier is
            Select C.idclt, C.nom, 
                    max(L.dateloc) as maxDate -- derniere location
            From Clients C, Locations L
            Where C.idclt = L.idclt
            Group by C.idclt, C.nom;
    Begin
        Dbms_output.put_line ('Nom       |  num. Voiture | Marque');
        For ligne in dernier loop
            
            Select V.idv, M.nomMarque into numV, marqu
            from Voitures V, Marques M, Locations L
            Where L.idv = V.idv And V.idmarque = M.idmarque
            And L.idClt = ligne.idClt And L.dateLoc = ligne.maxDate;
            Dbms_output.put_line (ligne.nom || '    |   ' || numV || '           |   ' || marqu);
        End loop;
    End Q2;
BEGIN
    -- appel
    Q2();
END;
