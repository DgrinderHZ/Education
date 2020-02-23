DECLARE
-- a) Entrer les deux dates
m_date_commencement DATE := CAST('&date_de_commencement' AS DATE);
m_date_terminaison DATE := CAST('&date_de_terminaison'AS DATE);
m_nombre_voitures INTEGER; m_nombre_personnes INTEGER;
-- b) On définie un cursor à afficher plus tard
CURSOR cur_trajet IS
    SELECT notraj, datetrajet, villedep, villearr
    FROM trajet WHERE datetrajet
    BETWEEN m_date_commencement AND m_date_terminaison ;
BEGIN
-- Le début du rapport
DBMS_OUTPUT.PUT_LINE('############# LISTE DE TRAJETS: #############') ;
DBMS_OUTPUT.PUT_LINE(' Période, De: '|| m_date_commencement ||' à '||m_date_terminaison) ;
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------') ;
DBMS_OUTPUT.PUT_LINE(': '|| 'Ligne '||' : '||' No Trajet'||' : '||' Départ '||' : '||'Arrivée '||' : '||
'       Date :'||'         Nbr voitures'||' : '||'Nbr personnes'||' :');
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------') ;
FOR rec_trajet IN cur_trajet LOOP
-- Calculez les nombres des voitures participées et les nombres des personnes transportées par chaque trajet
    SELECT COUNT(*), SUM(tr_nov.nbperstr)
    INTO m_nombre_voitures, m_nombre_personnes
    FROM tr_nov
    WHERE tr_nov.notraj = rec_trajet.notraj ;
    -- Une ligne du rapport:
    DBMS_OUTPUT.PUT_LINE( ':'|| TO_CHAR(cur_trajet%ROWCOUNT,'999999')|| '   : '||TO_CHAR(rec_trajet.notraj,'999999999')||
    '   : '||SUBSTR(rec_trajet.villedep,0,15)|| '   : '||SUBSTR(rec_trajet.villearr,0,15)|| '   : '||TO_CHAR(rec_trajet.datetrajet,'DD/MM/YY')||
    '   : '||TO_CHAR(m_nombre_voitures,'9999999999')|| '   : '||TO_CHAR(m_nombre_personnes,'9999999999')||' :');
END LOOP ;
-- La fin du rapport:
DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------') ;
END ;
/