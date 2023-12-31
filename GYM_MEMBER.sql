--------------------------------------------------------
--  DDL for Table GYM_MEMBER
--------------------------------------------------------

  CREATE TABLE "SCOTT"."GYM_MEMBER" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(10 CHAR), 
	"PHONE" VARCHAR2(13 CHAR), 
	"GENDER" VARCHAR2(2 CHAR), 
	"BIRTHDAY" DATE, 
	"ADDRESS" VARCHAR2(300 CHAR), 
	"JOIN_TIME" TIMESTAMP (6) DEFAULT systimestamp, 
	"EXPIRE_DATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"MEMBERSHIP_CODE" NUMBER(3,0), 
	"PT_CODE" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GYM_MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."GYM_MEMBER_PK" ON "SCOTT"."GYM_MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger GYM_MEMBER_TRG2
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."GYM_MEMBER_TRG2" 
BEFORE INSERT ON GYM_MEMBER 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."GYM_MEMBER_TRG2" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GYM_MEMBER_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."GYM_MEMBER_TRG" 
BEFORE INSERT ON GYM_MEMBER 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."GYM_MEMBER_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GYM_MEMBER_TRG1
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."GYM_MEMBER_TRG1" 
BEFORE INSERT ON GYM_MEMBER 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."GYM_MEMBER_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GYM_MEMBER_TRG3
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."GYM_MEMBER_TRG3" 
BEFORE INSERT ON GYM_MEMBER 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."GYM_MEMBER_TRG3" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GYM_MEMBER_TRG4
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."GYM_MEMBER_TRG4" 
BEFORE INSERT ON GYM_MEMBER 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT GYM_MEMBER_SEQ4.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."GYM_MEMBER_TRG4" ENABLE;
--------------------------------------------------------
--  Constraints for Table GYM_MEMBER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."GYM_MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."GYM_MEMBER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."GYM_MEMBER" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."GYM_MEMBER" ADD CONSTRAINT "GYM_MEMBER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GYM_MEMBER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."GYM_MEMBER" ADD CONSTRAINT "GYM_MEMBER_FK" FOREIGN KEY ("MEMBERSHIP_CODE")
	  REFERENCES "SCOTT"."MEMBERSHIP" ("MEMBERSHIP_CODE") ENABLE;
  ALTER TABLE "SCOTT"."GYM_MEMBER" ADD CONSTRAINT "GYM_MEMBER_PT_CODE_FK" FOREIGN KEY ("PT_CODE")
	  REFERENCES "SCOTT"."PT" ("PT_CODE") ENABLE;
