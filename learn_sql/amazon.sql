CREATE TABLE "CLIENT" (
"email" CHAR(20) NOT NULL,
"Iname" CHAR(15) NOT NULL,
"fname" CHAR(15) NOT NULL,
"street" CHAR(20) NOT NULL,
"city" CHAR(15) NOT NULL,
"state" CHAR(2) NOT NULL,
"zip" CHAR(10) NOT NULL,
PRIMARY KEY ("email") 
);

CREATE TABLE "BOOK" (
"isbn" CHAR(10) NOT NULL,
"title" CHAR(20) NOT NULL,
"fname" CHAR(15) NOT NULL,
"Iname" CHAR(15) NOT NULL,
"list_price" NUMBER NOT NULL,
"qoh" NUMBER NOT NULL,
PRIMARY KEY ("isbn") 
);

CREATE TABLE "XORDER" (
"id" CHAR(5) NOT NULL,
"clientemail" CHAR(20) NOT NULL,
"order_date" DATE NOT NULL,
"credit_card" CHAR(16) NOT NULL,
"exp_date" DATE NOT NULL,
"ship_method" CHAR(10) NOT NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "LIENTEM" (
"xorderid" CHAR(5) NOT NULL,
"bookisbn" CHAR(10) NOT NULL,
"sale_price" NUMBER NOT NULL,
"quantity" NUMBER NOT NULL,
PRIMARY KEY ("xorderid", "bookisbn") 
);


ALTER TABLE "XORDER" ADD CONSTRAINT "fk_clientemail" FOREIGN KEY ("clientemail") REFERENCES "CLIENT" ("email");
ALTER TABLE "LIENTEM" ADD CONSTRAINT "fk_xorderid" FOREIGN KEY ("xorderid") REFERENCES "XORDER" ("id");
ALTER TABLE "LIENTEM" ADD CONSTRAINT "fk_bookisbn" FOREIGN KEY ("bookisbn") REFERENCES "BOOK" ("isbn");

