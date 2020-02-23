DECLARE
m_notraj INTEGER;
m_nombre INTEGER ;
m_villedep VARCHAR(20) ;
m_villearr VARCHAR(20) ;
m_datetrajet DATE ;
m_nbkm INTEGER ;
BEGIN
m_notraj := TRIM('&Entrez_un_numero_trajet'); -- a) Entrez un numero de trajet
-- b) Validez ce numéro de trajet 
SELECT COUNT(notraj) INTO m_nombre
FROM trajet WHERE notraj = m_notraj ;
IF m_nombre = 1 THEN -- Si ce numero déja existé
    -- Selectionnez ses informations 
    SELECT villedep, villearr, datetrajet, nbkm
    INTO m_villedep, m_villearr, m_datetrajet, m_nbkm
    FROM trajet WHERE notraj = m_notraj ;
    -- Affichez ses informations
    DBMS_OUTPUT.PUT_LINE(' #### TRAJET SELECTIONE #### ') ;
    DBMS_OUTPUT.PUT_LINE(' - Trajet No: '|| m_notraj) ;
    DBMS_OUTPUT.PUT_LINE(' - Ville depart : '|| m_villedep) ;
    DBMS_OUTPUT.PUT_LINE(' - Ville arrivé : '|| m_villearr) ;
    DBMS_OUTPUT.PUT_LINE(' - Date : '|| m_datetrajet) ;
    DBMS_OUTPUT.PUT_LINE(' - Nombre de km : '|| m_nbkm) ;
ELSE -- Sinon
    DBMS_OUTPUT.PUT_LINE('Ce numero n''existe pas ou il y a des erreurs');
END IF ;
END ;
/