CREATE OR REPLACE PACKAGE BODY pack_pilote AS
    -- La fonction qui retourne le salaire moyenne (privée)
    FUNCTION sal_moyen_pil RETURN INTEGER IS
                  sal_moy INTEGER;
              BEGIN
                  SELECT AVG(salaire) INTO sal_moy
                  FROM pilote;
                  RETURN sal_moy;
              END sal_moyen_pil;
              
    -- La procedure qui insere une ligne 
    PROCEDURE inser_pil(p_nom IN pilote.nompil%TYPE, p_adresse IN pilote.adresse%TYPE, p_dateEmbauche IN pilote.embauche%TYPE) IS
                   sal_moy INTEGER;
                   N INTEGER;
              BEGIN
                  -- calcul de salaire moyenne
                  sal_moy := sal_moyen_pil(); 
                  -- calcul de nombre d'enregistrement 
                  SELECT COUNT(*) INTO N
                  FROM pilote;
                  -- insertion
                  INSERT INTO pilote VALUES (N+1, p_nom, p_adresse, sal_moy, 0, p_dateEmbauche);
              END inser_pil;
              
    -- La procedure qui selection l'adresse et le salaire d'un employer
    PROCEDURE sel_pil(p_nom IN pilote.nompil%TYPE, p_adresse OUT pilote.adresse%TYPE, p_salaire OUT pilote.salaire%TYPE) IS
              BEGIN
                  SELECT adresse, salaire INTO p_adresse, p_salaire
                  FROM pilote
                  WHERE nompil = p_nom;
              END sel_pil;
              
    -- La fonction qui retourne l'adresse d'un employer      
    FUNCTION sel_pil(p_nom IN pilote.nompil%TYPE) RETURN pilote.adresse%TYPE IS
                  v_adresse pilote.adresse%TYPE;
              BEGIN
                  SELECT adresse INTO v_adresse
                  FROM pilote
                  WHERE nompil = p_nom;
                  RETURN v_adresse;
              END sel_pil;
    -- La procedure qui attribue une prime à un pilote
    PROCEDURE prime_pil(p_nom IN pilote.nompil%TYPE, p_prime pilote.prime%TYPE) IS 
              BEGIN
                  UPDATE pilote
                  SET prime = p_prime
                  WHERE nompil = p_nom;
              END prime_pil;
    -- La procedure qui affiche les pilotes      
    PROCEDURE list_pil IS
                  CURSOR list_pilote IS
                        SELECT nompil, adresse, salaire, prime
                        FROM pilote;
              BEGIN
                  dbms_output.put_line('NOM      | ADRESSE       | SALAIRE     | PRIME');
                  -- open list_pilote;
                        FOR ligne IN list_pilote LOOP
                            dbms_output.put_line(ligne.nompil ||'   |'||ligne.adresse||'      |'||ligne.salaire||'         |'||ligne.prime);
                        END LOOP;
                  -- close list_pilote;
              END list_pil;
    -- La procedure qui affiche les pilotes (salaire total)
    PROCEDURE sal_prim_pil IS
              CURSOR list_pilote IS
                        SELECT nompil, adresse, salaire+prime as total_sal
                        FROM pilote;
              BEGIN
                  dbms_output.put_line('NOM   | ADRESSE       | SALAIRE TOTAL');
                  -- open list_pilote;
                        FOR ligne IN list_pilote LOOP
                            dbms_output.put_line(ligne.nompil ||' |'||ligne.adresse||' |'||ligne.total_sal);
                        END LOOP;
                  -- close list_pilote;
              END sal_prim_pil;
              
              
END pack_pilote;
/