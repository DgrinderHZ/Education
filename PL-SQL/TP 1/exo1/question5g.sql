SET SERVEROUT ON; 

SELECT c.cnom , COUNT(*) as nbr_trajets
FROM conducteur c
JOIN trajet t
ON c.cnum = t.cnum
GROUP BY c.cnom;

