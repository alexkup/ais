CREATE TABLE dbo.contact (
	"person_id" INTEGER NOT NULL,
	"contact_type_id" integer NOT NULL,
	"data" nvarchar(100),
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ("person_id" ASC, "contact_type_id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."contact" IS 'Контакты';

ALTER TABLE "dbo"."contact" ADD CONSTRAINT "contact_type" NOT NULL FOREIGN KEY ( "contact_type_id" ASC ) REFERENCES "dbo"."contact_type" ( "contact_type_id" );
ALTER TABLE "dbo"."contact" ADD CONSTRAINT "
" NOT NULL FOREIGN KEY ( "person_id" ASC ) REFERENCES "dbo"."person" ( "person_id" );
