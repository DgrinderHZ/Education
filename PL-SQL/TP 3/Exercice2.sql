DECLARE 
    Num_op budget.num_operation%TYPE;
    nom_op budget.nom_operation%TYPE;
    categorie_op budget.Categorie%TYPE;
    date_op budget.date_Operation%TYPE;
    montant_op budget.montant%TYPE;
    CURSOR Curseur IS 
        SELECT num_operation, nom_operation, categorie, date_operation, montant 
        FROM budget;
BEGIN
OPEN Curseur;
    LOOP 
        FETCH Curseur INTO num_op, nom_op, categorie_op, date_op, montant_op;
        -- Inserer les courses seulement
        IF nom_op = 'Courses' THEN
            INSERT INTO COURSES VALUES(
                num_op, nom_op, categorie_op, 
                date_op, montant_op
            );
        END IF ;
        EXIT WHEN Curseur%NOTFOUND ;
    END LOOP;
CLOSE Curseur;
END;
/