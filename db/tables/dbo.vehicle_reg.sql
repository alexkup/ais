CREATE TABLE dbo.vehicle_reg (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
  "id_contract" INTEGER NOT NULL,
	"series" nvarchar(8),
	"number" nvarchar(12),    	
	"number_plate" nvarchar(40) NOT NULL,
  "vin" nvarchar(34),
  "model_name" nvarchar(100),
	"color" nvarchar(40),
	"owner_lname" nvarchar(120),
	"owner_mname" nvarchar(60),
	"owner_fname" nvarchar(60),
	"id_picture" integer,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."vehicle_reg" IS 'СТС';

ALTER TABLE "dbo"."vehicle_reg" ADD CONSTRAINT "contract" NOT NULL FOREIGN KEY ( "id_contract" ASC ) REFERENCES "dbo"."contract" ( "id" );
ALTER TABLE "dbo"."vehicle_reg" ADD CONSTRAINT "picture" NOT NULL FOREIGN KEY ( "id_picture" ASC ) REFERENCES "dbo"."picture" ( "id" );
