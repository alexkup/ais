CREATE TABLE dbo.object_org (
	"id" bigint NOT NULL DEFAULT AUTOINCREMENT,
	"id_obj" int NOT NULL,
	"id_org" int NOT NULL,
	"ts" TIMESTAMP NOT NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ("id" ASC)		
) IN "system";
COMMENT ON TABLE "dbo"."object_org" IS 'Орг. объектов';

ALTER TABLE "dbo"."object_org" ADD CONSTRAINT "objects" NOT NULL FOREIGN KEY ( "id_obj" ASC ) REFERENCES "dbo"."objects" ( "id" );
ALTER TABLE "dbo"."object_org" ADD CONSTRAINT "organization" NOT NULL FOREIGN KEY ( "id_org" ASC ) REFERENCES "dbo"."organization" ( "id" );
