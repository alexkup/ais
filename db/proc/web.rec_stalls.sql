create or replace procedure web.rec_stalls()
begin
declare @body long nvarchar;
set @body=http_body();
set @body=left(@body,length(@body)-1);
set @body=right(@body,length(@body)-1);
truncate table web.stalls_1c;
insert into web.stalls_1c
SELECT
    obj_id ,stall_type,name,link,typelink,objlink,xid,xid_type,xid_obj 
FROM OPENSTRING(value @body) 
WITH (obj_id nvarchar(255),
    stall_type nvarchar(255),
    name nvarchar(255),
    link nvarchar(255),
    typelink nvarchar(255),
    objlink nvarchar(255),
    xid UNIQUEIDENTIFIER,
    xid_type UNIQUEIDENTIFIER,
    xid_obj UNIQUEIDENTIFIER)
option(delimited by '|' ESCAPES OFF) 
as h;
select 'OK';
end;
CREATE SERVICE "stalls" TYPE 'RAW' AUTHORIZATION OFF USER "web" AS call web.rec_stalls();
