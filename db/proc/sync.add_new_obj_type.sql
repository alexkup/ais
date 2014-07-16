create or replace procedure sync.add_new_obj_type()
begin
    insert into dbo.obj_type(name,xid)
    select name,xid from web.obj_type_1c
    where web.obj_type_1c.xid not in(select xid from dbo.obj_type)
end;
