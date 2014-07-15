create or replace procedure web.rec_objects()
begin
declare @body long nvarchar;
set @body=http_body();
set @body=left(@body,length(@body)-1);
set @body=right(@body,length(@body)-1);
truncate table web.objects_1c;
insert into web.objects_1c
SELECT
    name,
    fullname,
    type,
    link,
    xid     
FROM OPENSTRING(value @body) 
WITH (name nvarchar(255),
    fullname nvarchar(255),
    type nvarchar(255),
    link nvarchar(255),
    xid UNIQUEIDENTIFIER)
option(delimited by '|') 
as h;
end;
CREATE SERVICE "objects" TYPE 'RAW' AUTHORIZATION OFF USER "web" AS call web.rec_objects();
