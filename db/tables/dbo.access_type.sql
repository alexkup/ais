create table dbo.access_type(
    id INTEGER NOT NULL,
    name nvarchar(100),
    PRIMARY KEY (id)
)in system;
COMMENT ON TABLE "dbo"."access_type" IS 'Виды доступа';
