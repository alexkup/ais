create table dbo.templates(
    id_template integer not null default autoincrement,
    name nvarchar(255),
    filename nvarchar(1024),
    primary key (id_template)
)in system;
COMMENT ON TABLE "dbo"."templates" IS 'Шаблоны';
