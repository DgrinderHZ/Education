SET SERVEROUTPUT ON;
DECLARE 
    v_adresse pilote.adresse%TYPE;
    v_salaire pilote.salaire%TYPE;
    v_prime pilote.prime%TYPE;
BEGIN
     dbms_output.put_line(' ___________ Teste de  .list_pil ______________');
     pack_pilote.list_pil;
     dbms_output.put_line(' ___________ Teste de  .inser_pil ______________');
     pack_pilote.inser_pil('Hassan ZEKK', 'msssici',  '12/12/19');
     pack_pilote.list_pil;
     dbms_output.put_line(' ___________ Teste de  .sel_pil ______________');
     pack_pilote.sel_pil('Hassan ZEKK', v_adresse, v_salaire);
     dbms_output.put_line('Salaire de Hassan ZEKK: '|| v_salaire || ' adresse: '|| v_adresse);
     dbms_output.put_line(' ___________ Teste de  .sel_pil surchagé ______________');
     v_adresse := pack_pilote.sel_pil('Hassan ZEKK');
     dbms_output.put_line('Adresse de Hassan ZEKK: '|| v_adresse);
     dbms_output.put_line(' ___________ Teste de .prime_pil ______________');
     SELECT prime INTO v_prime
     FROM pilote
     WHERE nompil = 'Hassan ZEKK';
     dbms_output.put_line('Avant, Prime de ALI : '|| v_prime);
     pack_pilote.prime_pil('Hassan ZEKK', 199);
     SELECT prime INTO v_prime
     FROM pilote
     WHERE nompil = 'ALI';
     dbms_output.put_line('Apres, Prime de ALI : '|| v_prime);
     dbms_output.put_line(' ___________ Teste de .sal_prim_pil ______________');
     pack_pilote.sal_prim_pil;
END;
/