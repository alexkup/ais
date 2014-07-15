CREATE TABLE dbo.contact_type (
	contact_type_id integer NOT NULL DEFAULT AUTOINCREMENT,
	name nvarchar(40) NOT NULL,
	PRIMARY KEY ( "contact_type_id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."contact_type" IS 'Виды контактов';
