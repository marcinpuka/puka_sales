create or replace
TRIGGER TRG_CUSTOMER
BEFORE INSERT OR UPDATE 
ON CUSTOMER 
REFERENCING OLD AS oldROW NEW as newROW
FOR EACH ROW
DECLARE
BEGIN

IF (:newROW.CREDIT < 0) THEN 
raise_application_error (-20999, 'THE CREDIT '|| :newROW.CREDIT || 'IS LESS THAN 0!');
END IF;



END TRG_CUSTOMER;