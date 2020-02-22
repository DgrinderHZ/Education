SET SERVEROUT ON; 

SELECT t.trnum, t.villedep, t.villearr, t.heuredep, t.heurearr, tn.tdes, c.cnom
FROM conducteur  c
JOIN trajet t
ON c.cnum = t.cnum
JOIN train tn
ON tn.tnum = t.tnum
WHERE t.trnum = &v_numero_trajet;
