CREATE TABLE dbo.contract (
	"id" integer NOT NULL DEFAULT AUTOINCREMENT,
	"number" nvarchar(12) NOT NULL,
	"id_template" integer not null,
	"ddateb" datetime not null,
	"ddatee" datetime not null,
	"ddatec" datetime not null,
	"id_picture" integer,
	"id_org" integer,
	"id_person" integer,
	"id_dealership" integer,
	"id_dealership_emp" integer,
	"id_price" integer,	
	"signature" integer not null DEFAULT 0,
	"1c_flag" integer not null DEFAULT 0,
	"other_data" nvarchar(512),
	"xid" UNIQUEIDENTIFIER DEFAULT NEWID(),
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ("id" ASC)
) IN "system";
COMMENT ON TABLE "dbo"."contract" IS 'Договоры';

ALTER TABLE "dbo"."contract" ADD CONSTRAINT "organization" FOREIGN KEY ( "id_org" ASC ) REFERENCES "dbo"."organization" ( "id" );
ALTER TABLE "dbo"."contract" ADD CONSTRAINT "person" FOREIGN KEY ( "id_person" ASC ) REFERENCES "dbo"."person" ( "person_id" );
ALTER TABLE "dbo"."contract" ADD CONSTRAINT "dealership" FOREIGN KEY ( "id_dealership" ASC ) REFERENCES "dbo"."dealership" ( "id" );
ALTER TABLE "dbo"."contract" ADD CONSTRAINT "dealership_emp" FOREIGN KEY ( "id_dealership_emp" ASC ) REFERENCES "dbo"."dealership" ( "id" );
ALTER TABLE "dbo"."contract" ADD CONSTRAINT "price" FOREIGN KEY ( "id_price" ASC ) REFERENCES "dbo"."price" ( "id" );
ALTER TABLE "dbo"."contract" ADD CONSTRAINT "picture" FOREIGN KEY ( "id_picture" ASC ) REFERENCES "dbo"."picture" ( "id" );
ALTER TABLE "dbo"."contract" ADD CONSTRAINT "templates" NOT NULL FOREIGN KEY ( "id_template" ASC ) REFERENCES "dbo"."templates" ( "id_template" );
