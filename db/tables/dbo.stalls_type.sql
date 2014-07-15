CREATE TABLE dbo.stalls_type (
	"id_stall_type" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"name" nvarchar(80) NOT NULL,
	"xid" UNIQUEIDENTIFIER,
	PRIMARY KEY ( "id_stall_type" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."stalls_type" IS 'Типы мест';

