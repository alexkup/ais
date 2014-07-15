CREATE TABLE dbo.stall_status (
	"id" bigint NOT NULL DEFAULT AUTOINCREMENT,
	"id_stall" int NOT NULL,
	"id_contract" int NOT NULL,
	"ts" TIMESTAMP NOT NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ("id" ASC)		
) IN "system";
COMMENT ON TABLE "dbo"."stall_status" IS 'Состояние мест';

ALTER TABLE "dbo"."stall_status" ADD CONSTRAINT "stalls" NOT NULL FOREIGN KEY ( "id_stall" ASC ) REFERENCES "dbo"."stalls" ( "id" );
ALTER TABLE "dbo"."stall_status" ADD CONSTRAINT "contract" NOT NULL FOREIGN KEY ( "id_contract" ASC ) REFERENCES "dbo"."contract" ( "id" );
