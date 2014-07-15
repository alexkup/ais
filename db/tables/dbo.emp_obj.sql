CREATE TABLE dbo.emp_obj (
	"id" bigint NOT NULL DEFAULT AUTOINCREMENT,
	"id_obj" int NOT NULL,
	"id_person" int NOT NULL,
	"ts" TIMESTAMP NOT NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ("id" ASC)		
) IN "system";
COMMENT ON TABLE "dbo"."emp_obj" IS 'Объекты сотрудника';

ALTER TABLE "dbo"."emp_obj" ADD CONSTRAINT "objects" NOT NULL FOREIGN KEY ( "id_obj" ASC ) REFERENCES "dbo"."objects" ( "id" );
ALTER TABLE "dbo"."emp_obj" ADD CONSTRAINT "person" NOT NULL FOREIGN KEY ( "id_person" ASC ) REFERENCES "dbo"."person" ( "person_id" );
