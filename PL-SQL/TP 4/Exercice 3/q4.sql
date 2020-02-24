SET SERVEROUT ON;
Create or replace procedure Q4 is
    Cursor typesParVisiteur is
        Select R.idVisiteur , count(distinct C.idType) as NB
        From Reservation R, Chambre C
        Where R.idChambre = C.idChambre
        Group by R.idVisiteur;
    N integer;
Begin
    -- nombre total des types
    Select count(*) into N from Types;
    Dbms_output.put_line ('Voici les numéros des visiteurs qui ont réservé des
    chambres de tous les types:');
    For ligne in typesParVisiteur loop
        If (ligne.NB = N) then
            Dbms_output.put_line (ligne.idVisiteur);
        End if;
    End loop;
End;
/
-- appel
BEGIN 
    Q4;
END;
/