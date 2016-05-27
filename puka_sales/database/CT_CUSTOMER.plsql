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
 

end ct_customer;