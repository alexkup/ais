CREATE TABLE dbo.organization (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"name" nvarchar(200) NOT NULL,
	"org" nvarchar(512) NOT NULL,
	"mainaccname" nvarchar(100) NULL,
	"directorname" nvarchar(100) NULL,
	"inn" nchar(36) NULL, 
	"kpp" nvarchar(40) NULL,
	"okato" nvarchar(60) NULL,
	"okpo" nvarchar(60) NULL,
	"ogrn" nvarchar(60) NULL,
	uaddress nvarchar(1024),
	faddress nvarchar(1024),
	tel nvarchar(256),
	"id_bank" integer NOT NULL default 0,
	"id_bank_u" integer NOT NULL default 0,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	"xid" UNIQUEIDENTIFIER  DEFAULT NEWID(),
	"partner_flag" integer NOT NULL default 1,
	PRIMARY KEY ( "id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."organization" IS 'Юр лица';

ALTER TABLE "dbo"."organization" ADD CONSTRAINT "banks" NOT NULL FOREIGN KEY ( "id_bank" ASC ) REFERENCES "dbo"."banks" ( "id" );
ALTER TABLE "dbo"."organization" ADD CONSTRAINT "banks_u" NOT NULL FOREIGN KEY ( "id_bank_u" ASC ) REFERENCES "dbo"."banks" ( "id" );

CREATE UNIQUE CLUSTERED INDEX "inn_unique" ON "dbo"."organization" ( "inn" ASC, "kpp" ASC ) WITH NULLS NOT DISTINCT IN "system";
