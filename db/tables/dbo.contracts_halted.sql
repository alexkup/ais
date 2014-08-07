create table dbo.contracts_halted(
    contract_id int not null,
    emp_id int not null,
    filename nvarchar(512),
    other nvarchar(1024),
    "xid" UNIQUEIDENTIFIER DEFAULT NEWID(),
    PRIMARY KEY (xid));
