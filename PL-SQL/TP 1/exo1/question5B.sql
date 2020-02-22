SET SERVEROUT ON; 

SELECT cnom, cprenom, salaire
FROM conducteur
WHERE salaire > &v_salaire_in;
