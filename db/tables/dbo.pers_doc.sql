CREATE TABLE dbo.pers_doc (
	"person_id" INTEGER NOT NULL,
	"pers_doc_type_id" INTEGER NOT NULL,
	"ser" nvarchar(20) NULL,
	"num" nvarchar(40) NOT NULL,
	"ddate" DATE NOT NULL,
	"ddatee" DATE NULL,
	"org" nvarchar(512) NULL,
	"dept_code" nvarchar(128) NULL,
	PRIMARY KEY ( "person_id" ASC, "pers_doc_type_id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."pers_doc" IS 'Персональные документы';

ALTER TABLE "dbo"."pers_doc" ADD CONSTRAINT "pers_doc_type" NOT NULL FOREIGN KEY ( "pers_doc_type_id" ASC ) REFERENCES "dbo"."pers_doc_type" ( "pers_doc_type_id" );
ALTER TABLE "dbo"."pers_doc" ADD CONSTRAINT "person" NOT NULL FOREIGN KEY ( "person_id" ASC ) REFERENCES "dbo"."person" ( "person_id" );
