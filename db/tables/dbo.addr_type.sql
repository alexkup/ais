CREATE TABLE dbo.addr_type (
	"addr_type_id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"name" nvarchar(40) NOT NULL,
	PRIMARY KEY ( "addr_type_id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."addr_type" IS 'Виды адресов';

