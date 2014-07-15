CREATE TABLE dbo.positions (
	"position_id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	name nvarchar(100) NOT NULL,
	PRIMARY KEY ("position_id" ASC)
) IN "system";
COMMENT ON TABLE "dbo"."positions" IS 'Должности';
