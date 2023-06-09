CREATE TABLE ADMIN (
  ADMIN_ID VARCHAR2(20) NOT NULL ENABLE,
  ADMIN_PW VARCHAR2(20) NOT NULL ENABLE,
  ADMIN_NAME VARCHAR2(30) NOT NULL ENABLE,
  ADMIN_TEL VARCHAR2(20) NOT NULL ENABLE,
  ADMIN_REGDATE DATE NOT NULL ENABLE,
  PRIMARY KEY (ADMIN_ID)
);

CREATE SEQUENCE admin_id_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER admin_id_trg
BEFORE INSERT ON admin
FOR EACH ROW
BEGIN
  SELECT admin_id_seq.NEXTVAL
  INTO :new.admin_id
  FROM dual;
END;
/