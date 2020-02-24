Create or replace trigger T2
BEFORE INSERT on match for each row
DECLARE 
    v_nbplaces INTEGER;
Begin
        SELECT nbplaces into v_nbplaces
        FROM stade
        WHERE codestade = :new.codestade;
        
        if :new.nbspectateur > v_nbplaces then
            RAISE_APPLICATION_ERROR(-20001,'Le nombre de spectateurs est supéreur au nombre de places disponibles dans le stade!');
        end if;
End T2;
/
-- TEST
BEGIN
    insert into Match values(3,2000,'23/07/2003',14,0);
END;
/
