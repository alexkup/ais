CREATE DBSPACE "pictures" AS 'pictures.db';


CREATE TABLE dbo.picture (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"picture" LONG BINARY NULL,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	"width" INTEGER NULL,
	"height" INTEGER NULL,
	PRIMARY KEY ( "id" ASC )
) IN "pictures";
COMMENT ON TABLE "dbo"."picture" IS 'Картинки';
COMMENT ON COLUMN "dbo"."picture"."id" IS 'Уникальный идентификатор';
COMMENT ON COLUMN "dbo"."picture"."picture" IS 'Изображение';
COMMENT ON COLUMN "dbo"."picture"."width" IS 'Ширина';
COMMENT ON COLUMN "dbo"."picture"."height" IS 'Высота';
