DECLARE
un_ans VARCHAR(4);
m_nombre_trajets INTEGER;
BEGIN
-- a) Entrez un ans
un_ans := '&Entrez_un_ans';
-- b) Calculez le nombre de trajets
SELECT COUNT(notraj) INTO m_nombre_trajets
FROM trajet tr
WHERE to_char(datetrajet,'YYYY') = un_ans;
DBMS_OUTPUT.PUT_LINE('L''annee : '|| un_ans) ;
DBMS_OUTPUT.PUT_LINE(' - le nombre de trajets : '|| m_nombre_trajets);
END ;
/