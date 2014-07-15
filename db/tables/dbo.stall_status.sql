CREATE TABLE dbo.stall_status (
	"id" bigint NOT NULL DEFAULT AUTOINCREMENT,
	"id_stall" int NOT NULL,
	"id_contract" int NOT NULL,
	"ts" TIMESTAMP NOT NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ("id" ASC)		
) IN "system";
COMMENT ON TABLE "dbo"."stall_status" IS 'Состояние мест';
