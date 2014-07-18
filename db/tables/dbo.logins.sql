create table dbo.logins(
	person_id int not null,
	username nvarchar(50) not null,
	pwd nvarchar(100) not null,
	session_hash nvarchar(100) null,
	"access" integer NOT NULL,
	start_page nvarchar(512) NOT NULL,	
	ts TIMESTAMP NOT NULL DEFAULT TIMESTAMP,
	PRIMARY KEY ("person_id" ASC)
) in system;
COMMENT ON TABLE "dbo"."logins" IS 'Логины';

ALTER TABLE "dbo"."logins" ADD CONSTRAINT "person" NOT NULL FOREIGN KEY ( "person_id" ASC ) REFERENCES "dbo"."person" ( "person_id" );
ALTER TABLE "dbo"."logins" ADD CONSTRAINT "access" NOT NULL FOREIGN KEY ( "access" ASC ) REFERENCES "dbo"."access_type" ( "id" );
