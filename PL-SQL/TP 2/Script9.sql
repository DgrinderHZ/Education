DECLARE
    max_personnes CONSTANT INTEGER := 50 ;
    m_nombre_personnes INTEGER; m_notraj INTEGER; m_datetrajet DATE;
CURSOR cur_les_jours IS -- Cursor pour les journées
    SELECT DISTINCT datetrajet FROM trajet;
CURSOR cur_les_trajets IS -- Cursor pour les trajets de la journées
    SELECT DISTINCT notraj FROM trajet
    WHERE datetrajet = m_datetrajet;
CURSOR cur_les_voitures IS -- Cursor pour les voiture de trajets
    SELECT nov FROM tr_nov
    WHERE (notraj = m_notraj);
BEGIN
    FOR rec_les_jours IN cur_les_jours LOOP -- Traitez la liste des jours
        m_datetrajet := rec_les_jours.datetrajet; -- Traitez une journée de la liste des jours
        -- Validez la régle pour cette journée
        SELECT SUM(nbperstr) INTO m_nombre_personnes
        FROM tr_nov, trajet
        WHERE (tr_nov.notraj = trajet.notraj) AND (trajet.datetrajet = m_datetrajet);
        IF m_nombre_personnes > max_personnes THEN -- Trop_de_personnes (supérieur au max)
            DBMS_OUTPUT.PUT_LINE('On a trop de personnes: '|| m_nombre_personnes||' personnes pendant la journée de, Date: '||m_datetrajet);
            -- Affichage des trajets et voiteurs correspondantes (no. voiture et no. trajet)
            FOR rec_les_trajets IN cur_les_trajets LOOP
                m_notraj := rec_les_trajets.notraj; -- afficher trajet
                DBMS_OUTPUT.PUT_LINE(' >>> Trajet numéro: '||m_notraj);
                FOR rec_les_voitures IN cur_les_voitures LOOP
                    DBMS_OUTPUT.PUT_LINE(' >>> Numéro de voiture: '||rec_les_voitures.nov); -- Afficher voiture
                END LOOP;
            END LOOP ;
        END IF ;
    END LOOP;
END ;
/
