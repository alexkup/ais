CREATE TABLE dbo.person (
	"person_id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"fname" nvarchar(60) NULL,
	"mname" nvarchar(60) NULL,
	"lname" nvarchar(120) NOT NULL,
	"suffix" nvarchar(100),
	"sex" nchar(1) NULL,
	"birth_date" DATE NULL,
	"death_date" DATE NULL,
	"shortened" nvarchar(40) NULL,
	"pic_id" integer,
	"tfname" nvarchar(60) NULL,
	"tlname" nvarchar(60) NULL,
	"pers_account" nvarchar(100) NULL,
	"inn" nchar(36) NULL, 
	"deleted" integer NOT NULL DEFAULT 0,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	"xid" UNIQUEIDENTIFIER  DEFAULT NEWID(),
	PRIMARY KEY ( "person_id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."person" IS 'Физ. лица';
COMMENT ON COLUMN "dbo"."person"."pers_account" IS 'снилс';

ALTER TABLE "dbo"."person" ADD CONSTRAINT "picture" FOREIGN KEY ( "pic_id" ASC ) REFERENCES "dbo"."picture" ( "id" );

CREATE UNIQUE CLUSTERED INDEX "first_middle_last_suffix_unique" ON "dbo"."person" ( "fname" ASC, "mname" ASC, "lname" ASC, "suffix" ASC ) WITH NULLS NOT DISTINCT IN "system";

