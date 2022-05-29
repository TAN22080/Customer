CREATE OR REPLACE TRIGGER TRG_CUSTOMER
BEFORE INSERT OR UPDATE ON CUSTOMER 
FOR EACH ROW 
DECLARE 
BEGIN 
  IF (:new.credits < 0) THEN
  Raise_application_error (-2001, 'credits has to be greater or equal to 0');
  END IF;
  
  IF (:new.birthdate > sysdate) THEN
  Raise_application_error (-2002, 'Birthdate cant be in the future');
  END IF;
  
  IF (UPDATING and (:old.Birthdate <> :new.Birthdate)) THEN
  raise_application_error(-2003, 'birthdate can not be changed');
  END IF;
  
  IF (:new.email not like '%_@_%._%') THEN
  raise_application_error(-2004, 'invalid email');
  END IF;
  
  
END TRG_CUSTOMER;
