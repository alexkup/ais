CREATE TABLE dbo.addr (
	"person_id" INTEGER NOT NULL,
	"addr_type_id" INTEGER NOT NULL,
	"zip" INTEGER NULL,
	"area_id" INTEGER NULL,
	"street_id" INTEGER NULL,
	"location" nvarchar(160) NULL,
	"full_address" nvarchar(512) NULL,
	"reg_date" DATE NULL,
	"phone" nvarchar(40) NULL,
	PRIMARY KEY ( "person_id" ASC, "addr_type_id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."addr" IS 'Адреса';

ALTER TABLE "dbo"."addr" ADD CONSTRAINT "addr_type" NOT NULL FOREIGN KEY ( "addr_type_id" ASC ) REFERENCES "dbo"."addr_type" ( "addr_type_id" );
ALTER TABLE "dbo"."addr" ADD CONSTRAINT "person" NOT NULL FOREIGN KEY ( "person_id" ASC ) REFERENCES "dbo"."person" ( "person_id" );
