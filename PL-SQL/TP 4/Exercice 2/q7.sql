DECLARE    
    function Q7 return integer is
        Cursor touteMarque is -- nombre de marques par client
            Select l.idclt, count(distinct V.idmarque) as NB
            From Locations l, Voitures v
            Where l.idv = v.idv
            Group by l.idclt;
        N integer := 0;
        M integer; -- nombre total de marques
    Begin
        Select count(*) into M from Marques;
        -- selection
        For ligne in touteMarque loop
            If (ligne.NB = M) then
                N := N + 1;
            End if;
        End loop;
        Return N;
    End Q7;
BEGIN
   -- appel
   DBMS_OUTPUT.PUT_LINE('le nombre des clients effectuant des locations des voitures des toutes les marques est:  '|| Q7());
END;