DECLARE
    AncienSolde Budget.Solde%TYPE;
    NouveauSolde NUMBER(7, 2);
    DernierNumero NUMBER(4, 2);
BEGIN
    -- Récupérer le dernier solde
    SELECT Solde INTO AncienSolde 
    FROM budget
    WHERE Num_Operation IN (
        SELECT max(Num_Operation) FROM BUDGET
    );
    -- Récupérer le numéro de dernier ligne
    SELECT max(Num_Operation) INTO DernierNumero 
    FROM budget; 
    -- Insértion
    NouveauSolde := AncienSolde - 500;
    INSERT INTO BUDGET VALUES (
        DernierNumero + 1, 
        'Courses', 
        'Débit',
        '14/01/2002', 
        500, 
        NouveauSolde);
END;
/