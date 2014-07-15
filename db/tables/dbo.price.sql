CREATE TABLE dbo.price (
	"id" integer NOT NULL DEFAULT AUTOINCREMENT,
	"name" nvarchar(50) NOT NULL,	
	"cost" DECIMAL NOT NULL,
	"deleted" integer NOT NULL DEFAULT 0,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ("id" ASC)
) IN "system";
COMMENT ON TABLE "dbo"."price" IS 'Тариф';
