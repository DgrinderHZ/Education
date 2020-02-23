DECLARE
un_ans VARCHAR(4);
un_jour VARCHAR(2);
BEGIN

un_ans := to_char(sysdate,'YYYY');
un_jour := to_char(sysdate,'D');
DBMS_OUTPUT.PUT_LINE('Aujourd’hui est '|| 
to_char(sysdate, 'DAY') ||', '|| un_jour ||' '||to_char(sysdate, 'MONTH')
||' '|| un_ans) ;
END ;
/