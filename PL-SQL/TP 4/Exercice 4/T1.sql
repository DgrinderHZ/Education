Create or replace trigger T1
BEFORE INSERT 
on INDIVIDU 
for each row
Begin
        :new.nom := UPPER(:new.nom);
        :new.prenom := INITCAP(:new.prenom);
End T1;
/
-- TEST
BEGIN
    insert into individu values(3,'chawki', 'hamza', null);
END;
/

