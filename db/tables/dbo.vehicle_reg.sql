CREATE TABLE dbo.vehicle_reg (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
  	"id_contract" INTEGER NOT NULL,
	"series" nvarchar(50),
	"number" nvarchar(100),    	
	"number_plate" nvarchar(255) NOT NULL,
  	"vin" nvarchar(200),
  	"model_name" nvarchar(255),
	"color" nvarchar(128),
	"owner_lname" nvarchar(255),
	"owner_mname" nvarchar(255),
	"owner_fname" nvarchar(255),
	"id_picture" integer,
	"ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";
COMMENT ON TABLE "dbo"."vehicle_reg" IS 'СТС';

ALTER TABLE "dbo"."vehicle_reg" ADD CONSTRAINT "contract" NOT NULL FOREIGN KEY ( "id_contract" ASC ) REFERENCES "dbo"."contract" ( "id" );
ALTER TABLE "dbo"."vehicle_reg" ADD CONSTRAINT "picture" NOT NULL FOREIGN KEY ( "id_picture" ASC ) REFERENCES "dbo"."picture" ( "id" );
