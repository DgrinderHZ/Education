set SERVEROUTPUT ON;
Create or replace function Q3 return integer is
    N integer;
Begin
    Select count(*) into N From chambre
    Where idChambre not in (
        select idChambre 
        from Reservation
        Where dataDebut >= '01/07/2009' 
    );
    Return N;
End Q3;
/
-- appel
BEGIN
    DBMS_OUTPUT.put_line('Reponse , ' || Q3());
END;
/