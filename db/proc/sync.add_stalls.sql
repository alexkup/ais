create or replace procedure sync.add_stalls()
begin
 insert into stalls(id_object,id_stall_type,number,xid)
 select
    isnull((select top 1 id from dbo.objects where dbo.objects.xid=web.stalls_1c.xid_obj order by dbo.objects.xid),0),
    isnull((select top 1 id_stall_type from dbo.stalls_type where dbo.stalls_type.xid=web.stalls_1c.xid_type order by dbo.stalls_type.xid),0),
    web.stalls_1c.name,
    web.stalls_1c.xid
 from web.stalls_1c
 where web.stalls_1c.xid not in(select xid from stalls where xid is not null)
end;
