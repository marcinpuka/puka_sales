create or replace
procedure ct_customer is
v_tabcnt number;
begin 

SELECT Count(*)
INTO   v_tabcnt 
from all_tables
where table_name = 'CUSTOMER' and OWNER = USER;


if v_tabcnt = 0 then 

EXECUTE IMMEDIATE 'CREATE TABLE CUSTOMER
(
    customer_id     	INTEGER     PRIMARY KEY,
    first_name      	VARCHAR(20),
    credit          		DECIMAL(10,2)
)';
end if;
commit;
 
SELECT COUNT(*) INTO v_tabcnt
FROM ALL_SEQUENCES 
WHERE SEQUENCE_NAME = 'SEQ_CUSTOMER_ID'
	AND SEQUENCE_OWNER = USER;

if  v_tabcnt = 0 then
EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_CUSTOMER_ID
			START WITH 100000
			INCREMENT BY 1
			CACHE 20';

COMMIT;
end if;


end ct_customer;