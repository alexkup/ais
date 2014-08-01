create or replace procedure web.rec_objtype()
begin
declare @body long nvarchar;
set @body=http_body();
set @body=left(@body,length(@body)-1);
set @body=right(@body,length(@body)-1);
truncate table web.obj_type_1c;
insert into web.obj_type_1c
SELECT
    name ,link,xid   
FROM OPENSTRING(value @body) 
WITH (name nvarchar(255),link nvarchar(255),xid UNIQUEIDENTIFIER)
option(delimited by '|' ESCAPES OFF) 
as h;
select 'rec_objtype: OK';
end;
CREATE SERVICE "objtype" TYPE 'RAW' AUTHORIZATION OFF USER "web" AS call web.rec_objtype();
