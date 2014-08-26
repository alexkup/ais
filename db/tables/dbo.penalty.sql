create table dbo.penalty(
    emp_id integer not null,
    contract_id integer not null,
    cost DECIMAL,
    other_data nvarchar(200),
    ddate datetime,
    "ts" TIMESTAMP NULL DEFAULT TIMESTAMP,
	PRIMARY KEY (emp_id,contract_id ASC) 
) IN "system";
COMMENT ON TABLE "dbo"."price" IS 'Штрафы'
