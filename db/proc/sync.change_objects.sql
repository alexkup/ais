create or replace procedure sync.change_objects()
begin
    declare local temporary table tmp(
        "address" nvarchar(512) NOT NULL,
        number nvarchar(12) NOT NULL,
	    id_obj_type integer not null,
	    xid UNIQUEIDENTIFIER);
    insert into tmp
    select distinct
        (select top 1 fullname from web.objects_1c inner_obj where outer_obj.xid=inner_obj.xid order by xid_type),
        (select top 1 left(name,charindex(' ',name)) from web.objects_1c inner_obj where outer_obj.xid=inner_obj.xid order by xid_type),
        isnull((select id_obj_type from obj_type where xid=(select top 1 xid_type from web.objects_1c inner_obj where outer_obj.xid=inner_obj.xid order by xid_type)),0),
        xid 
    from web.objects_1c outer_obj;
    
   update dbo.objects set 
        dbo.objects.address=tmp.address, 
        dbo.objects.number=tmp.number,
        dbo.objects.id_obj_type=tmp.id_obj_type
    from dbo.objects, tmp
    where (tmp.xid=dbo.objects.xid)
        and(tmp.address<>dbo.objects.address or tmp.id_obj_type<>dbo.objects.id_obj_type or tmp.number<>dbo.objects.number)
end;
