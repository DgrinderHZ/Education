SET SERVEROUT ON; 

SELECT tnum, tdes as designation_train
FROM train tn
WHERE tnum NOT IN (
        SELECT tnum
        FROM trajet
);
