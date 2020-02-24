DECLARE  
    m_seuil_montant budget.montant%TYPE := &seuil_montant;
BEGIN
    FOR x IN  
        (   SELECT num_operation, date_operation, montant 
            FROM budget
            WHERE categorie = 'Débit' AND montant > m_seuil_montant
        )
        LOOP
        -- Inserer les courses seulement
        INSERT INTO budget_seuil VALUES(
                x.num_operation, x.date_operation, x.montanty
            );
    END LOOP;
END;
/
