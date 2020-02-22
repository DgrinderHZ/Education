SET SERVEROUT ON; 

SELECT cnom CNOM, nbr_train NBR_TRAIN
FROM (
    SELECT DISTINCT c.cnom, COUNT(tn.tnum) nbr_train
    FROM conducteur  c
    JOIN trajet t
    ON c.cnum = t.cnum
    JOIN train tn
    ON tn.tnum = t.tnum
    GROUP BY c.cnom
)
WHERE nbr_train in (
    SELECT DISTINCT COUNT(*) 
    FROM train
);