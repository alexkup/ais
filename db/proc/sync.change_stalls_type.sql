create or replace procedure sync.change_stalls_type()
begin
    update dbo.stalls_type set dbo.stalls_type.name=web.stalls_type_1c.name 
    from web.stalls_type_1c where dbo.stalls_type.xid=web.stalls_type_1c.xid
end;
