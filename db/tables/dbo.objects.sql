CREATE TABLE dbo.objects (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"address" nvarchar(512) NOT NULL,
	"number" nvarchar(12) NOT NULL,
	"coordinates" STPoint NULL,
	"id_obj_type" integer not null,
	"xid" UNIQUEIDENTIFIER,
	PRIMARY KEY ( "id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."objects" IS 'Объекты';

ALTER TABLE "dbo"."objects" ADD CONSTRAINT "obj_type" NOT NULL FOREIGN KEY ( "id_obj_type" ASC ) REFERENCES "dbo"."obj_type" ( "id_obj_type" );

CREATE INDEX IX_objectsnumber ON objects (number);
CREATE INDEX IX_objectsaddress ON objects (address);
