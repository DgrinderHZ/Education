Create or replace function Q1 (V1 integer, V2 integer) return boolean is
    N1 integer := 0; 
    N2 integer := 0; 
Begin
    -- trouver N1: nombre des types resérver par le visiteur 1
    -- et non visité par le visiteur 2
    Select count (C.idtype) into N1
    From Reservation R, Chambre C
    Where R.idChambre = C.idChambre And R.idVisiteur = V1
    And C.idType not in ( 
            Select H.idType
            From Reservation T, Chambre H
            Where T.idChambre = H.idChambre
            And T.idVisiteur = V2
    );
    -- trouver N2: nombre des types resérver par le visiteur 2
    -- et non visité par le visiteur 1
    Select count (C.idtype) into N2
    From Reservation R, Chambre C
    Where R.idChambre = C.idChambre And R.idVisiteur = V2
    And C.idType not in ( 
            Select H.idType
            From Reservation T, Chambre H
            Where T.idChambre = H.idChambre
            And T.idVisiteur = V1
    );
    -- si des zéros alors oui!
    Return (N1 = 0) and (N2 = 0);
End;

BEGIN
    if Q1(1, 1) = true then
         DBMS_OUTPUT.PUT_LINE('oui');
    else
         DBMS_OUTPUT.PUT_LINE('NON');
    end if;
END;
/