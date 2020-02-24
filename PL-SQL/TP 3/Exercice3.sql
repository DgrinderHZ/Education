DECLARE
    i NUMBER;
    Num_op BUDGET.Num_operation%TYPE := 0 ;
    nom_op BUDGET.nom_operation%TYPE ;
    Categorie_op BUDGET.Categorie%TYPE;
    Date_op BUDGET.Date_Operation%TYPE ;
    Montant_op BUDGET.Montant%TYPE := 500;
    Solde_op BUDGET.Solde%TYPE;
    CURSOR Curseur IS 
        SELECT nom_operation, Categorie, Date_operation, Montant, Solde
        FROM BUDGET WHERE Date_operation > '01/01/2002';
BEGIN
    i := 0;
    OPEN Curseur;
        LOOP i := i+1;
            FETCH Curseur INTO nom_op, Categorie_op, Date_op,Montant_op, Solde_op;
            INSERT INTO BUDGET_EURO VALUES (
                Num_op, nom_op,Categorie_op, 
                Date_op, Montant_op/11, 
                Solde_op/11
            ); 
            Num_op := Num_op + 1 ;
            EXIT WHEN Curseur%NOTFOUND ;
        END LOOP;
    CLOSE Curseur;
END;
/