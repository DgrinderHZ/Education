Create or replace trigger Q6
after INSERT or DELETE or UPDATE of idclt
on Locations 
for each row
Begin
    If inserting then 
        modifier( :new.idClt, 1) ; -- incr�menter
    Elsif deleting then 
        modifier( :old.idClt, -1) ; -- d�cr�menter
    Elsif updating then
        -- incr�menter puis d�cr�menter
        modifier( :new.idClt, 1) ;
        modifier( :old.idClt, -1) ;
    End if;
End Q6;
/
-- La fonction qui s'occupe de modifiee CLIENTS.nbvoiturelouee
Create or replace procedure modifier (idc Clients.idClt%type, N integer) is
Begin
    Update Clients set nbvoiturelouee = nbvoiturelouee + N
    Where idClt = idc;
End;

