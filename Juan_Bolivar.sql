--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View VIEW_1
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "EJERCICIOS"."VIEW_1" ("SALESMAN_NAME", "CUSTOMER_NAME", "COUNTRY") AS 
  Select s.Name as salesman_name, C.Name as customer_name, c.COUNTRY
  from  SALESMAN S
  Inner Join CUSTOMERS c on c.COUNTRY = S.COUNTRY
--------------------------------------------------------
--  DDL for View VIEW_2
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "EJERCICIOS"."VIEW_2" ("ID", "NAME", "COUNTRY", "GRADE", "SALESMAN_ID", "SALESMAN_NAME", "COMMISSION") AS 
  select c."ID",c."NAME",c."COUNTRY",c."GRADE",c."SALESMAN_ID", S.NAME as salesman_name, S.COMMISSION
  from Customers C
  inner join SALESMAN S on s.Id = C.SALESMAN_ID
  where S.COMMISSION>12
--------------------------------------------------------
--  DDL for View VIEW_3
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE VIEW "EJERCICIOS"."VIEW_3" ("CUSTOMER_NAME", "COUNTRY", "ORDER_NUMBER", "ORDER_DATE", "ORDER_AMOUNT") AS 
  Select C.NAME as customer_name, C.COUNTRY,o.Id as order_number, o.ORDER_DATE, o.AMOUNT as order_amount
   from Customers C
   left join Orders o on C.ID = o.CUSTOMER_ID
   order by o.ORDER_DATE asc
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."CUSTOMERS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"GRADE" NUMBER, 
	"SALESMAN_ID" NUMBER
   )
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."ORDERS" 
   (	"ID" NUMBER, 
	"AMOUNT" VARCHAR2(255), 
	"ORDER_DATE" VARCHAR2(255), 
	"CUSTOMER_ID" NUMBER, 
	"SALESMAN_ID" NUMBER
   )
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."SALESMAN" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"COMMISSION" NUMBER(5,2)
   )
--------------------------------------------------------
--  DDL for Index PK_SALESMAN
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."PK_SALESMAN" ON "EJERCICIOS"."SALESMAN" ("ID")
--------------------------------------------------------
--  DDL for Index PK_CUSTOMERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."PK_CUSTOMERS" ON "EJERCICIOS"."CUSTOMERS" ("ID")
--------------------------------------------------------
--  DDL for Index PK_ORDERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."PK_ORDERS" ON "EJERCICIOS"."ORDERS" ("ID")
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("NAME" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("COUNTRY" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("GRADE" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("SALESMAN_ID" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD CONSTRAINT "PK_CUSTOMERS" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("AMOUNT" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("ORDER_DATE" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("SALESMAN_ID" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "PK_ORDERS" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."SALESMAN" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."SALESMAN" MODIFY ("NAME" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."SALESMAN" MODIFY ("COUNTRY" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."SALESMAN" MODIFY ("COMMISSION" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."SALESMAN" ADD CONSTRAINT "PK_SALESMAN" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD CONSTRAINT "FK_SALESMAN" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "FK_SALESMAN_ORDERS" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "FK_CUSTOMERS" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "EJERCICIOS"."CUSTOMERS" ("ID") ENABLE
