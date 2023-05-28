CREATE TABLE QNA (
  QNA_NUMBER NUMBER(38,0) DEFAULT 1,
  QNA_READCOUNT NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,
  QNA_WRITER VARCHAR2(20) NOT NULL ENABLE,
  QNA_TITLE VARCHAR2(100) NOT NULL ENABLE,
  QNA_CONTENT CLOB NOT NULL ENABLE,
  QNA_REGDATE TIMESTAMP (6) NOT NULL ENABLE,
  QNA_STEP NUMBER(38,0) NOT NULL ENABLE,
  QNA_LEVER NUMBER(38,0) NOT NULL ENABLE,
  QNA_GROUP NUMBER(38,0) DEFAULT 1 NOT NULL ENABLE,
  PRIMARY KEY (QNA_NUMBER)
);

CREATE SEQUENCE qna_number_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER qna_number_trg
BEFORE INSERT ON qna
FOR EACH ROW
BEGIN
  SELECT qna_number_seq.NEXTVAL
  INTO :new.qna_number
  FROM dual;
END;
/

UPDATE QNA SET qna_writer = 'BraveKim7878' WHERE qna_number = 1;
UPDATE QNA SET qna_writer = 'CoolEric222' WHERE qna_number = 2;
UPDATE QNA SET qna_writer = 'SmartLee3' WHERE qna_number = 3;
UPDATE QNA SET qna_writer = 'CleverPark441D' WHERE qna_number = 4;
UPDATE QNA SET qna_writer = 'StrongChoi55B' WHERE qna_number = 5;
UPDATE QNA SET qna_writer = 'KindJeon' WHERE qna_number = 6;
UPDATE QNA SET qna_writer = 'QuickHan' WHERE qna_number = 7;
UPDATE QNA SET qna_writer = 'HappyYoo6G5' WHERE qna_number = 8;
UPDATE QNA SET qna_writer = 'BoldJang' WHERE qna_number = 9;
UPDATE QNA SET qna_writer = 'WiseLim6CL' WHERE qna_number = 10;
UPDATE QNA SET qna_writer = 'LoyalKang' WHERE qna_number = 11;
UPDATE QNA SET qna_writer = 'CheerfulSeoH9H' WHERE qna_number = 12;
UPDATE QNA SET qna_writer = 'GenerousSon123' WHERE qna_number = 13;