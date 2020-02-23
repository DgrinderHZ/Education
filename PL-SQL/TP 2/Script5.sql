DECLARE
m_nombre INTEGER ; m_norep INTEGER ; m_nov INTEGER ;
m_nog INTEGER ;
m_typerep VARCHAR(30) ;
m_px INTEGER ; m_kmcpt INTEGER ;
BEGIN
-- a) Entrez les informations d'une nouvelle reparation
m_norep := &numero_reparation ;
m_nov := '&numero_voiture' ;
m_nog := &numero_garage ;
m_typerep := '&type_reparation' ;
m_px := &prix_reparation ;
m_kmcpt := &nombre_kilometres ;
-- b) Validez le NOV est deja existe dans VOITURE
SELECT COUNT(m_nov) INTO m_nombre
FROM voiture WHERE nov = m_nov ;
IF m_nombre = 1 THEN -- SI oui
    -- Insérer cette reparation
    INSERT INTO reparation VALUES
    (m_norep, m_nov, m_nog, m_typerep, m_px, m_kmcpt );
    -- Affichez le resultat
    DBMS_OUTPUT.PUT_LINE(' - Insere la reparation No '|| m_norep) ;
ELSE -- Sinon
    DBMS_OUTPUT.PUT_LINE('Ce numero de voiture n''existe pas ou il y a des erreurs');
END IF;
END;
/