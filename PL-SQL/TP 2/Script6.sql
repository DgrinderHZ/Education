DECLARE
m_notraj INTEGER := &Entrez_numero_trajet;
m_datetrajet DATE;
m_villedep VARCHAR(30);
m_villearr VARCHAR(30);
BEGIN
-- a) S�lectionnez les informations de ce trajet:
SELECT datetrajet, villedep, villearr
INTO m_datetrajet, m_villedep, m_villearr
FROM trajet WHERE m_notraj = notraj ;
IF SQL%FOUND THEN -- S'il existe
    -- Affichez les informations
    DBMS_OUTPUT.PUT_LINE ('### Trajet sel�ction� ###');
    DBMS_OUTPUT.PUT_LINE ('No trajet: '||m_notraj);
    DBMS_OUTPUT.PUT_LINE ('Date : '||m_datetrajet);
    DBMS_OUTPUT.PUT_LINE ('D�part : '||m_villedep);
    DBMS_OUTPUT.PUT_LINE ('Arriv�e : '||m_villearr);
    END IF;
EXCEPTION -- Exception non trouv�
WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('ERREUR: Il n''y a pas ce trajet');
END ;
/