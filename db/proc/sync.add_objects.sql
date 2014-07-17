create or replace procedure sync.add_objects()
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
    
    insert into dbo.objects(address,number,id_obj_type,xid)
    select * from tmp where not exists(select * from dbo.objects obj where obj.xid=tmp.xid);
end;
