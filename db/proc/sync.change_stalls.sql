create or replace procedure sync.change_stalls()
begin
    declare local temporary table tmp(
        id_object INTEGER NOT NULL,
	    id_stall_type INTEGER NOT NULL,
   	    number nvarchar(128) NOT NULL,
	    xid UNIQUEIDENTIFIER);

    insert into tmp
    select
        isnull((select top 1 id from dbo.objects where dbo.objects.xid=web.stalls_1c.xid_obj order by dbo.objects.xid),0),
        isnull((select top 1 id_stall_type from dbo.stalls_type where dbo.stalls_type.xid=web.stalls_1c.xid_type order by dbo.stalls_type.xid),0),
        web.stalls_1c.name,
        web.stalls_1c.xid
    from web.stalls_1c
    where web.stalls_1c.xid not in(select xid from stalls);

    update dbo.stalls set
        dbo.stalls.id_object=tmp.id_object,
        dbo.stalls.id_stall_type=tmp.id_stall_type,
        dbo.stalls.number=tmp.number
    from dbo.stalls, tmp
    where (tmp.xid=dbo.stalls.xid)and
    (dbo.stalls.id_object<>tmp.id_object or dbo.stalls.id_stall_type<>tmp.id_stall_type or
        dbo.stalls.number<>tmp.number);
end;
