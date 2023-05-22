CREATE TABLE "JUNGHO"."BOARD"
   (	"BOARD_NUMBER" NUMBER(38,0) DEFAULT 1 NOT NULL ENABLE,
	"BOARD_WRITER" VARCHAR2(20) NOT NULL ENABLE,
	"BOARD_TITLE" VARCHAR2(50) NOT NULL ENABLE,
	"BOARD_CONTENT" CLOB NOT NULL ENABLE,
	"BOARD_PW" VARCHAR2(20) NOT NULL ENABLE,
	"BOARD_REGDATE" TIMESTAMP (6) NOT NULL ENABLE,
	"BOARD_READCOUNT" NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,
	"BOARD_GROUP" NUMBER(38,0) DEFAULT 1 NOT NULL ENABLE,
	"BOARD_STEP" NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,
	"BOARD_LEVEL" NUMBER(38,0) DEFAULT 0 NOT NULL ENABLE,
	"BOARD_IP" VARCHAR2(20),
	 CONSTRAINT "BOARD_PK" PRIMARY KEY ("BOARD_NUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
 LOB ("BOARD_CONTENT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION
  NOCACHE LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

CREATE OR REPLACE TRIGGER "JUNGHO"."BOARD_NUMBER_AUTO_INCREMENT"
BEFORE INSERT ON board
FOR EACH ROW
BEGIN
  SELECT board_number_seq.NEXTVAL
  INTO :new.board_number
  FROM dual;
END;
/
ALTER TRIGGER "JUNGHO"."BOARD_NUMBER_AUTO_INCREMENT" ENABLE;

CREATE UNIQUE INDEX "JUNGHO"."BOARD_PK" ON "JUNGHO"."BOARD" ("BOARD_NUMBER")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  CREATE UNIQUE INDEX "JUNGHO"."SYS_IL0000020062C00004$$" ON "JUNGHO"."BOARD" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
  PARALLEL (DEGREE 0 INSTANCES 0) ;