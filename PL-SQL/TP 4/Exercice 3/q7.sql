Create or replace function Q7 return integer is
    N integer;
Begin
    Select count(*) into N
    from Visiteur
    Where idVisiteur in (
            select idVisiteur
            From Reservation
            Group by idVisiteur
            Having count(*) > 2
    );
    Return N;
End Q7;
/
-- appel
BEGIN
    dbms_output.put_line('le nombre des visiteurs effectuant plus que deux réservations.');
    dbms_output.put_line(Q7);
END;
/