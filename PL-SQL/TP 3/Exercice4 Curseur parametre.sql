DECLARE  
    Num_op budget.num_operation%TYPE;
    date_op budget.date_Operation%TYPE;
    montant_op budget.montant%TYPE;  
    m_seuil_montant budget.montant%TYPE := &seuil_montant;
CURSOR Curseur(seuil budget.montant%TYPE) IS 
        SELECT num_operation, date_operation, montant 
        FROM budget
        WHERE categorie = 'Débit' AND montant > m_seuil_montant;
BEGIN
OPEN Curseur(m_seuil_montant);
    LOOP 
        FETCH Curseur INTO num_op,  date_op, montant_op;
            INSERT INTO budget_seuil VALUES(
                num_op,  
                date_op, 
                montant_op
            );
        EXIT WHEN Curseur%NOTFOUND ;
    END LOOP;
CLOSE Curseur;
END;
/