create or replace procedure sync.change_obj_type()
begin
    update dbo.obj_type set dbo.obj_type.name=web.obj_type_1c.name 
    from web.obj_type_1c where dbo.obj_type.xid=web.obj_type_1c.xid
end;
