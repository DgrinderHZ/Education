Create or replace trigger T8
BEFORE INSERT on equipe for each row
Begin
        if :new.nationalite = 'Mr' then
            :new.nationalite := 'Maroc';
        elsif :new.nationalite = 'Fr' then
            :new.nationalite := 'France';
        elsif :new.nationalite = 'Br' then
            :new.nationalite := 'Brési';
        elsif :new.nationalite = 'Esp' then
            :new.nationalite := 'Espagne';
        end if;
End T8;
/
-- TEST
BEGIN
    insert into Equipe values(0,'Mr');
    insert into Equipe values(4,'Fr');
    insert into Equipe values(5,'Br');
    insert into Equipe values(6,'Esp');
END;
/
