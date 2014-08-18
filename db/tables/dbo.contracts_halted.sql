create table dbo.contracts_halted(
    contract_id int not null,
    emp_id int not null,
    filename nvarchar(512),
    other nvarchar(1024),
    "xid" UNIQUEIDENTIFIER DEFAULT NEWID(),
    "xid_act" UNIQUEIDENTIFIER DEFAULT NEWID(),
    "xid_act2" UNIQUEIDENTIFIER DEFAULT NEWID(),
    PRIMARY KEY (xid));
    
COMMENT ON TABLE "dbo"."contracts_halted" IS 'расторгнутые договра';

ALTER TABLE "dbo"."contracts_halted" ADD CONSTRAINT "contract" FOREIGN KEY ( "contract_id" ASC ) REFERENCES "dbo"."contract" ( "id" );
ALTER TABLE "dbo"."contracts_halted" ADD CONSTRAINT "emp" FOREIGN KEY ( "emp_id" ASC ) REFERENCES "dbo"."person" ( "person_id" );
