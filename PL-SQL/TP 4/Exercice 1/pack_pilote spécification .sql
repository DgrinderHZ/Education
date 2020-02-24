CREATE OR REPLACE PACKAGE pack_pilote AS

    PROCEDURE inser_pil(p_nom IN pilote.nompil%TYPE, p_adresse IN pilote.adresse%TYPE, p_dateEmbauche IN pilote.embauche%TYPE);
    PROCEDURE sel_pil(p_nom IN pilote.nompil%TYPE, p_adresse OUT pilote.adresse%TYPE, p_salaire OUT pilote.salaire%TYPE);
    FUNCTION sel_pil(p_nom IN pilote.nompil%TYPE) RETURN pilote.adresse%TYPE;
    PROCEDURE prime_pil(p_nom IN pilote.nompil%TYPE, p_prime IN pilote.prime%TYPE);
    PROCEDURE list_pil;
    PROCEDURE sal_prim_pil;
    
END pack_pilote;
/
