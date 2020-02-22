SET SERVEROUT ON; 

SELECT tnum, tdes as nom_train
FROM train tn
WHERE tnum IN (
        SELECT tnum
        FROM trajet
);
