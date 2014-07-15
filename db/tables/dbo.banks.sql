CREATE TABLE dbo.banks (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"bname" nvarchar(512) NULL,
	"name" nchar(512) NOT NULL,
	"inn" nchar(36) NULL,
	"addr" nvarchar(255) NULL,
	"bank" nchar(255) NULL,
	"rs" nchar(40) NULL,
	"oconh" nchar(36) NULL,
	"ocpo" nchar(36) NULL,
	"bic" nchar(36) NULL,
	"cs" nchar(40) NULL,
	"phone" nvarchar(512) NULL,
	"org" INTEGER NULL,
	"kpp" nvarchar(40) NULL,
	"full_name" nvarchar(512) NULL,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."banks" IS 'Банковские реквизиты';
COMMENT ON COLUMN "dbo"."banks"."id" IS 'идентификатор';
COMMENT ON COLUMN "dbo"."banks"."bname" IS 'название банковских реквизитов для печати';
COMMENT ON COLUMN "dbo"."banks"."name" IS 'название банковских реквизитов для выпадающих списков';
COMMENT ON COLUMN "dbo"."banks"."inn" IS 'ИНН';
COMMENT ON COLUMN "dbo"."banks"."addr" IS 'адрес';
COMMENT ON COLUMN "dbo"."banks"."bank" IS 'название банка';
COMMENT ON COLUMN "dbo"."banks"."rs" IS 'расчетный счет';
COMMENT ON COLUMN "dbo"."banks"."oconh" IS 'ОКОНХ';
COMMENT ON COLUMN "dbo"."banks"."ocpo" IS 'ОКПО';
COMMENT ON COLUMN "dbo"."banks"."bic" IS 'БИК';
COMMENT ON COLUMN "dbo"."banks"."cs" IS 'кор.счет';
COMMENT ON COLUMN "dbo"."banks"."phone" IS 'телефон';
COMMENT ON COLUMN "dbo"."banks"."org" IS 'организация';
COMMENT ON COLUMN "dbo"."banks"."kpp" IS 'КПП';
