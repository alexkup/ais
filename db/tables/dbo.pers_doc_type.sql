CREATE TABLE dbo.pers_doc_type (
	"pers_doc_type_id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"name" nvarchar(40) NULL,
	PRIMARY KEY ( "pers_doc_type_id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."pers_doc_type" IS 'Виды персональных документов';

