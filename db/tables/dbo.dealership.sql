CREATE TABLE dbo.dealership (
	"id" integer NOT NULL DEFAULT AUTOINCREMENT,
	"number" nvarchar(12) NOT NULL,
	"id_org" integer,
	"id_person" integer,
	"ddateb" datetime not null,
	"ddatee" datetime not null,	
	"id_picture" integer,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ("id" ASC)		
) IN "system";
COMMENT ON TABLE "dbo"."dealership" IS 'Доверенность';

ALTER TABLE "dbo"."dealership" ADD CONSTRAINT "organization" NOT NULL FOREIGN KEY ( "id_org" ASC ) REFERENCES "dbo"."organization" ( "id" );
ALTER TABLE "dbo"."dealership" ADD CONSTRAINT "person" NOT NULL FOREIGN KEY ( "id_person" ASC ) REFERENCES "dbo"."person" ( "person_id" );
ALTER TABLE "dbo"."dealership" ADD CONSTRAINT "picture" FOREIGN KEY ( "id_picture" ASC ) REFERENCES "dbo"."picture" ( "id" );
