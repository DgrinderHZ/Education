Create or replace trigger T3
BEFORE INSERT on BUT for each row

Begin
        if :new.minute < 0 then
            RAISE_APPLICATION_ERROR(-20002,'la minute est Négative.!');
        end if;
End T3;
/
-- TEST
BEGIN
    insert into But values(22,-2, 'Tir', 0, 1);
END;
/
