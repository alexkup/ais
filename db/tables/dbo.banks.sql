CREATE TABLE "dbo"."banks" (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"bname" NVARCHAR(512) NULL,
	"name" NCHAR(512) NOT NULL,
	"addr" NVARCHAR(255) NULL,
	"rs" NCHAR(40) NULL,
	"bic" NCHAR(36) NULL,
	"cs" NCHAR(40) NULL,
	"phone" NVARCHAR(512) NULL,
	"org" INTEGER NULL,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."banks" IS 'Банковские реквизиты';
COMMENT ON COLUMN "dbo"."banks"."id" IS 'идентификатор';
COMMENT ON COLUMN "dbo"."banks"."bname" IS 'название банковских реквизитов для печати';
COMMENT ON COLUMN "dbo"."banks"."name" IS 'название банковских реквизитов для выпадающих списков';
COMMENT ON COLUMN "dbo"."banks"."addr" IS 'адрес';
COMMENT ON COLUMN "dbo"."banks"."rs" IS 'расчетный счет';
COMMENT ON COLUMN "dbo"."banks"."bic" IS 'БИК';
COMMENT ON COLUMN "dbo"."banks"."cs" IS 'кор.счет';
COMMENT ON COLUMN "dbo"."banks"."phone" IS 'телефон';
COMMENT ON COLUMN "dbo"."banks"."org" IS 'организация';
