Create or replace procedure Q2 is
    -- ordonné les visiteur par nombre réservation
    Cursor premiers is 
        Select V.idVisiteur , V.nom From Visiteur V, Reservation R
        Where V.idVisiteur = R.idVisiteur
        Group by V.idVisiteur , V.nom
        Order by count(*) desc; 
    ligne premiers%rowtype;
Begin
    open premiers;
        Loop Fetch premiers into ligne;
            Exit when (premiers%notfound) or (premiers%rowcount) > 3;
            Dbms_output.put_line (ligne.nom);
        End loop;
    close premiers;
End;
/
-- appel
BEGIN
    Q2;
END;
/
