DECLARE
        procedure Q3 is
            -- récupération des id de clients
            Cursor C is
                Select L.idClt
                From Locations L, Voitures V
                Where L.idv = V.idv
                Group by L.idClt
                Having count (distinct idmarque) = 1;
        Begin
            -- Affichage
            Dbms_output.put_line ('Numèro de client');
            For T in C loop
                Dbms_output.put_line (T.idclt);
            End loop;
        End;
BEGIN
    -- appel
    Q3();
END;

