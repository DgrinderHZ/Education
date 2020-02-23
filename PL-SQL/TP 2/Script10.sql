
DECLARE
    m_annee INTEGER(4) := '&Entrez_une_annee'; -- a) entrer une annee
    m_villedep trajet.villedep%TYPE;
    m_index INTEGER; m_nombre_trajets INTEGER;
    CURSOR cur_les_villes IS -- liste des villes de départ de l'année saisie
        SELECT DISTINCT villedep FROM trajet
        WHERE TO_CHAR(datetrajet,'YYYY') = m_annee;
BEGIN
    -- Le début du rapport annuel
    DBMS_OUTPUT.PUT_LINE('SYNTHESE DES TRAJETS');
    DBMS_OUTPUT.PUT_LINE('Année : '||m_annee);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE(': Ville départ :   01 : 02 : 03 : 04 : 05 : 06 : 07 : 08 : 09 : 10 : 11 :12 :');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------');
    -- Le contenu du rapport
    FOR rec_les_villes IN cur_les_villes LOOP -- Traitez une ville
        m_villedep := rec_les_villes.villedep;
        DBMS_OUTPUT.PUT(': '||SUBSTR(m_villedep,0,7)||'  :');
        -- Traitez les mois (Pour chaque mois de 1 à 12)
        FOR m_index IN 1..12 LOOP -- Traitez un mois (m_index)
            SELECT COUNT(*) INTO m_nombre_trajets
            FROM trajet
            WHERE (villedep = m_villedep ) AND (TO_CHAR(datetrajet,'MM')= m_index) AND (TO_CHAR(datetrajet,'YYYY') = m_annee);
            DBMS_OUTPUT.PUT(TO_CHAR(m_nombre_trajets,'99')||' :');
        END LOOP; -- Les mois
        DBMS_OUTPUT.NEW_LINE; -- Nouvelle ligne
    END LOOP ; -- Les villes
    -- La fin du rapport:
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------');
END ;
/