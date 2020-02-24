Create or replace trigger T6
BEFORE DELETE on equipe for each row
Begin
        DELETE FROM individu
        WHERE codeequipe = :old.codeequipe; 
        
        -- pour eviter la violation de contrainte d'intégrité
        -- on supprime sur la table jouer aussi
         DELETE FROM jouer
         WHERE codeequipe = :old.codeequipe; 
End T6;
/
-- TEST
BEGIN
    DELETE FROM equipe 
    WHERE codeequipe = 1;
END;
/
