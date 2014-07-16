create or replace procedure sync.add_stalls_type()
begin
    insert into dbo.stalls_type(name,xid)
    select name,xid from web.stalls_type_1c
    where web.stalls_type_1c.xid not in(select xid from dbo.stalls_type)
end;
