DROP TABLE CUSTOMER;

CREATE OR REPLACE procedure PRO_CT_CUSTOMER IS
  V_CNT NUMBER;
BEGIN
  Select count(*) INTO V_CNT
  FROM ALL_TABLES
  WHERE OWNER = 'DEMO' AND
      TABLE_NAME = 'CUSTOMER';
      
      IF V_CNT = 0 THEN
      EXECUTE IMMEDIATE 'CREATE TABLE CUSTOMER
                         (
                          CUSTOMER_ID INTEGER,
                          EMAIL       VARCHAR(45),
                          FIRSTNAME   VARCHAR(40),
                          LASTNAME    VARCHAR(40),
                          GENDER      VARCHAR(20),
                          BIRTHDATE   DATE,
                          CREDITS     DECIMAL(4)
                          )';
        COMMIT;                    
      END IF;
      
      Select count(*) INTO v_cnt
      FROM all_sequences
      WHERE sequence_OWNER = 'DEMO' AND
          sequence_NAME = 'SEQ_CUSTOMERID';
          
          IF V_CNT = 0 THEN 
            EXECUTE immediate 'CREATE sequence SEQ_CUSTOMERID
                               START WITH 10000
                               INCREMENT BY 1
                               CACHE  50';
                       COMMIT;        
          END IF;
      
      
END PRO_CT_CUSTOMER;