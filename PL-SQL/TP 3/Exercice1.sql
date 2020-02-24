DECLARE
    AncienSolde Budget.Solde%TYPE;
    NouveauSolde NUMBER(7, 2);
    DernierNumero NUMBER(4, 2);
BEGIN
    -- R�cup�rer le dernier solde
    SELECT Solde INTO AncienSolde 
    FROM budget
    WHERE Num_Operation IN (
        SELECT max(Num_Operation) FROM BUDGET
    );
    -- R�cup�rer le num�ro de dernier ligne
    SELECT max(Num_Operation) INTO DernierNumero 
    FROM budget; 
    -- Ins�rtion
    NouveauSolde := AncienSolde - 500;
    INSERT INTO BUDGET VALUES (
        DernierNumero + 1, 
        'Courses', 
        'D�bit',
        '14/01/2002', 
        500, 
        NouveauSolde);
END;
/