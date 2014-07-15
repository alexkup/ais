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
	"id_bank" integer NOT NULL default 0,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	"xid" UNIQUEIDENTIFIER,
	"partner_flag" integer NOT NULL default 1,
	PRIMARY KEY ( "id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."organization" IS 'Юр лица';

ALTER TABLE "dbo"."organization" ADD CONSTRAINT "banks" NOT NULL FOREIGN KEY ( "id_bank" ASC ) REFERENCES "dbo"."banks" ( "id" );
