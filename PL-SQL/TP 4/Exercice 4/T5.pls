Create or replace trigger T5
BEFORE UPDATE OF data on MATCH for each row -- data = date
BEGIN
    RAISE_APPLICATION_ERROR(-20003,'Impossible de modifie la date d’un match!');
End T5;
/
-- TEST
BEGIN
    UPDATE MATCH 
    SET data = '31/12/19'
    WHERE idmatch = 1;
END;
/
