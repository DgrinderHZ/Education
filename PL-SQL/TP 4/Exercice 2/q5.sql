DECLARE     
    procedure Q5 is
        -- récupérer la duree totale par client
        Cursor Somme is
            Select C.idClt, C.nom, sum(duree) as sommeDuree
            From Clients C, Locations L
            Where L.idClt = C.idClt
            Group by C.idClt, C.nom;
        
        maxDuree integer;
    Begin
        -- trouver la duree max
        Select max(sum(duree)) into maxDuree
        from Locations
        group by idClt;
        -- afficher les client ayant la duree max
        Dbms_output.put_line ('Nom client');
        For T in Somme loop
            If (T.sommeDuree = maxDuree) then 
                Dbms_output.put_line (T.nom);
            End if;
        End loop;
    End;
BEGIN
    -- appel
    Q5;
END;