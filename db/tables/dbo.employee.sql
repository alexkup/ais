CREATE TABLE dbo.employee (
	"person_id" INTEGER NOT NULL,
	"position_id" INTEGER NOT NULL,
	"org_id" INTEGER NULL,
	"access" integer NOT NULL,
	start_page nvarchar(512) NOT NULL,
	PRIMARY KEY ("person_id" ASC, "org_id" ASC)
) IN "system";
COMMENT ON TABLE "dbo"."employee" IS 'Сотрудники';

ALTER TABLE "dbo"."employee" ADD CONSTRAINT "person" NOT NULL FOREIGN KEY ( "person_id" ASC ) REFERENCES "dbo"."person" ( "person_id" );
ALTER TABLE "dbo"."employee" ADD CONSTRAINT "positions" NOT NULL FOREIGN KEY ( "position_id" ASC ) REFERENCES "dbo"."positions" ( "position_id" );
ALTER TABLE "dbo"."employee" ADD CONSTRAINT "organization" NOT NULL FOREIGN KEY ( "org_id" ASC ) REFERENCES "dbo"."organization" ( "id" );
ALTER TABLE "dbo"."employee" ADD CONSTRAINT "access" NOT NULL FOREIGN KEY ( "access" ASC ) REFERENCES "dbo"."access_type" ( "id" );
