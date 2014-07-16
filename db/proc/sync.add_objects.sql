create or replace procedure sync.add_objects()
begin

    select distinct
        (select top 1 fullname from web.objects_1c inner_obj where outer_obj.xid=inner_obj.xid order by fullname),
        (select top 1 left(name,charindex(' ',name)) from web.objects_1c inner_obj where outer_obj.xid=inner_obj.xid order by fullname),
        (select id_obj_type from obj_type where xid=(select top 1 xid_type from web.objects_1c inner_obj where outer_obj.xid=inner_obj.xid order by fullname)),
        xid 
    from web.objects_1c outer_obj
    
end;
