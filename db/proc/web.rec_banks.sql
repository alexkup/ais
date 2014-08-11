create or replace procedure web.rec_banks()
begin
declare @body long nvarchar;
set @body=http_body();
set @body=left(@body,length(@body)-1);
set @body=right(@body,length(@body)-1);
truncate table web.banks_1c;
insert into web.banks_1c
SELECT link,name,bankname,city,address,schet,korschet,bik,link_org,xid_org,xid
  
FROM OPENSTRING(value @body) 
WITH (link nvarchar(255),
    name nvarchar(255),
    bankname nvarchar(255),
    city nvarchar(255),
    address nvarchar(255),
    schet nvarchar(255),
    korschet nvarchar(255),
    bik nvarchar(255),
    link_org nvarchar(255),
    xid_org UNIQUEIDENTIFIER,
    xid UNIQUEIDENTIFIER)
option(delimited by '|' ESCAPES OFF) 
as h;
select 'rec_banks: OK';
end;

CREATE SERVICE "banks" TYPE 'RAW' AUTHORIZATION OFF USER "web" AS call web.rec_banks();
