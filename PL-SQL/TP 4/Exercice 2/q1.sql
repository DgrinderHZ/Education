 DECLARE
    procedure Q1 (p_idloc integer, p_dateloc Date, 
        p_duree integer, p_idclt integer, p_idv integer) is
        N1 integer; -- vérifier si p_idloc existe
        N2 integer; -- vérifier si le client existe
        N3 integer; -- vérifier si la voiture existe
    Begin
        Select count(*) into N1 from Locations where idLoc = p_idloc;
        Select count(*) into N2 from Clients where idClt = p_idclt;
        Select count(*) into N3 from Voitures where idv = p_idv;
        If (N1 = 0) and (N2 > 0) and (N3 > 0) Then
            Insert into Locations values (idloc, p_dateloc, 
                                          p_duree, p_idclt, p_idv);
        Else
            Dbms_output.put_line ('Données incorrectes');
        End if;
    End Q1;
BEGIN
    -- Appel de la procèdure
    Q1(1, '12/12/19', 4, 1, 1);

END;
/