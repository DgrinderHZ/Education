DECLARE
    m_trnov tr_nov%ROWTYPE;
    m_nch tr_nov.nch%TYPE;
    m_count INTEGER;
    plus_q_un_chauffeur EXCEPTION;
BEGIN
    m_trnov.notraj := &Numero_trajet;
    m_trnov.nov := '&Numero_Voiture';
    m_trnov.nch := &Numero_Chauffeur;
    m_trnov.nbperstr:= &Nom_Personnes;
    DBMS_OUTPUT.PUT_LINE('Insérez ce tuple');
    INSERT INTO tr_nov VALUES (m_trnov.notraj, m_trnov.nov, m_trnov.nch, m_trnov.nbperstr);
    /* Validez la règle:
    « il y a un seul chauffeur qui conduit une voiture au cours d’un trajet » */
    -- Compter le nombre de chauffeurs pour une voiture au cours d'un trajet
    SELECT COUNT(*) INTO m_count
    FROM tr_nov
    WHERE (m_trnov.notraj = tr_nov.notraj) AND
    (m_trnov.nov = tr_nov.nov);
    -- Tester 
    IF m_count >= 2 THEN 
        -- Lancement d'Exception
        RAISE plus_q_un_chauffeur ;
    END IF ;
    EXCEPTION -- Capture d'Exception
        WHEN  plus_q_un_chauffeur THEN
        DBMS_OUTPUT.PUT_LINE ('Exception');
        ROLLBACK;
END ;
/