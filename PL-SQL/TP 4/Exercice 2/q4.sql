DECLARE 
    reponse BOOLEAN;
    function Q4 (C1 integer, C2 integer) return boolean is
        N1 integer := 0;
        N2 integer := 0;
    Begin
        -- calcule de nombre de voiture loué par le client 1
        -- et jamais louées par le client 2
        Select count(idv) into N1 
        From Locations
        Where idClt = C1
        And idv not in ( 
                Select idv 
                From Locations 
                Where idClt = C2
        );
        -- calcule de nombre de voitures louées par le client 2
        -- et jamais louées par le client 1
        Select count(idv) into N2 From Locations
        Where idClt = C2
        And idv not in (
                Select idv 
                From Locations 
                Where idClt = C1
        );
        
        Return (N1 = 0) and (N2 = 0);
    End;
BEGIN
    -- appel 1
    reponse := Q4(1, 2);
    if reponse = true then
        Dbms_output.put_line ('oui');
    else 
        Dbms_output.put_line ('non');
    end if;
    -- appel 2
    reponse := Q4(1, 1);
    if reponse = true then
        Dbms_output.put_line ('oui');
    else 
        Dbms_output.put_line ('non');
    end if;
END;
