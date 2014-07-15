CREATE TABLE dbo.stalls (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
    	"id_object" INTEGER NOT NULL,
	"id_stall_type" INTEGER NOT NULL,
    	"number" nvarchar(128) NOT NULL,
	"other_data" nvarchar(512) null,
	"xid" UNIQUEIDENTIFIER,
	PRIMARY KEY ( "id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."stalls" IS 'Места';

ALTER TABLE "dbo"."stalls" ADD CONSTRAINT "objects" NOT NULL FOREIGN KEY ( "id_object" ASC ) REFERENCES "dbo"."objects" ( "id" );
ALTER TABLE "dbo"."stalls" ADD CONSTRAINT "stalls_type" NOT NULL FOREIGN KEY ( "id_stall_type" ASC ) REFERENCES "dbo"."stalls_type" ( "id_stall_type" );
