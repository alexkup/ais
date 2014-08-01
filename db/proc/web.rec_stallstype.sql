create or replace procedure web.rec_stallstype()
begin
declare @body long nvarchar;
set @body=http_body();
set @body=left(@body,length(@body)-1);
set @body=right(@body,length(@body)-1);
truncate table web.stalls_type_1c;
insert into web.stalls_type_1c
SELECT
    name ,link,xid   
FROM OPENSTRING(value @body) 
WITH (name nvarchar(255),link nvarchar(255),xid UNIQUEIDENTIFIER)
option(delimited by '|' ESCAPES OFF) 
as h;
select 'rec_stallstype: OK';
end;
CREATE SERVICE "stallstype" TYPE 'RAW' AUTHORIZATION OFF USER "web" AS call web.rec_stallstype();
