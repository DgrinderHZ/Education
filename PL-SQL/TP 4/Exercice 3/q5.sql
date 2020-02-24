SET SERVEROUT ON;
Create or replace procedure Q5 is
    -- dernier reservation par chambre
    Cursor dernierReservation is
        Select idChambre , max(dataDebut) as maxDate
        From Reservation
        Group by idChambre;
    NomVisiteur Visiteur.nom%type;
Begin
    Dbms_output.put_line ('pour chaque chambre, le nom du visiteur qui a effectué la dernière réservation. ?');
    Dbms_output.put_line ('id Chambre | nom Visiteur');
    For ligne in dernierReservation loop
    
        Select V.nom into NomVisiteur
        from Visiteur V, Reservation R
        Where V.idVisiteur = R.idVisiteur
        And R.idChambre = ligne.idChambre And R.dataDebut = ligne.maxDate;
        
        Dbms_output.put_line (ligne.idChambre || '           ' || NomVisiteur);
    End loop;
End Q5;
/
-- appel
BEGIN
    Q5;
END;
/