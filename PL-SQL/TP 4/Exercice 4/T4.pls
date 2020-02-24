Create or replace trigger T4
AFTER DELETE on individu for each row
Begin
        DELETE FROM but
        WHERE noindividu = :old.noindividu; 
End T4;
/
-- TEST
BEGIN
    DELETE FROM INDIVIDU 
    WHERE noindividu = 1;
END;
/
