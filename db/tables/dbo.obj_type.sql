CREATE TABLE dbo.obj_type (
	"id_obj_type" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"name" nvarchar(160) NOT NULL,
	"xid" UNIQUEIDENTIFIER,
	PRIMARY KEY ( "id_obj_type" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."obj_type" IS 'Типы объектов';
