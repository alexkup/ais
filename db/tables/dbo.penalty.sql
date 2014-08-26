create table dbo.penalty(
    person_id integer not null,
    contract_id integer not null,
    cost DECIMAL,
    other_data nvarchar(200),
    ddate datetime,
    "ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY (person_id,contract_id ASC) 
) IN "system";
COMMENT ON TABLE "dbo"."penalty" IS 'Штрафы'

ALTER TABLE "dbo"."penalty" ADD CONSTRAINT "contract" NOT NULL FOREIGN KEY ( "contract_id" ASC ) REFERENCES "dbo"."contract" ( "id" );
ALTER TABLE "dbo"."penalty" ADD CONSTRAINT "person" NOT NULL FOREIGN KEY ( "person_id" ASC ) REFERENCES "dbo"."person" ( "person_id" );
