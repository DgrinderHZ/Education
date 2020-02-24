Create or replace trigger Q6
after INSERT or DELETE or UPDATE of idChambre
on Reservation 
for each row
Begin
    If inserting Then
        modifier( :new.idChambre, 1) ;
    Elsif deleting then
        modifier( :old.idChambre, -1) ;
    Elsif updating then
        modifier( :new.idChambre, 1) ;
        modifier( :old.idChambre, -1) ;
    End if;
End;
/
-- fonction effectuant la modification
Create or replace procedure modifier (idc chambre.idChambre%type, N integer) is
Begin
    Update Chambre set Nb_reservation = Nb_reservation + N
    Where idChambre = idc;
End;
/