create or replace procedure web.rec_organization()
begin
declare @body long nvarchar;
set @body=http_body();
set @body=left(@body,length(@body)-1);
set @body=right(@body,length(@body)-1);
truncate table web.organization_1c;
insert into web.organization_1c
SELECT
    name,
    fullname,
    inn,
    kpp,
    okato,
    okpo,
    ogrn,
    link,
    link_bank,
    uaddress,
    faddress,
    tel,
    xid_bank,
    xid 
FROM OPENSTRING(value @body) 
WITH (name nvarchar(255),
    fullname nvarchar(255),
    inn nvarchar(255),
    kpp nvarchar(255),
    okato nvarchar(255),
    okpo nvarchar(255),
    ogrn nvarchar(255),
    link nvarchar(255),
    link_bank nvarchar(255),
    uaddress nvarchar(1024),
    faddress nvarchar(1024),
    tel nvarchar(256),
    xid_bank UNIQUEIDENTIFIER,
    xid UNIQUEIDENTIFIER)
option(delimited by '|' ESCAPES OFF) 
as h;
select 'rec_organization: OK';
end;
CREATE SERVICE "organization" TYPE 'RAW' AUTHORIZATION OFF USER "web" AS call web.rec_organization();
