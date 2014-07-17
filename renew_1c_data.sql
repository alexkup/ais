truncate table object_org;
truncate table stalls;
truncate table emp_obj;
truncate table objects;
truncate table obj_type;
truncate table stalls_type;

exec sync.add_stalls_type;

  insert into dbo.stalls_type(id_stall_type,name)
  select 0,'Неизвестно';

exec sync.add_obj_type;

  insert into dbo.obj_type(id_obj_type,name)
  select 0,'Неизвестно';

exec sync.add_objects;

  insert into dbo.objects(id,address,number,id_obj_type)
  select 0,'Неизвестно','-',0

exec sync.add_stalls;

  insert into emp_obj(id_obj,id_person) values
  ('25','24'),('76','24')
  
  insert into object_org(id_obj,id_org)
  select id,round(10 + rand() * 17,0) from objects;
  delete from object_org where id_obj=0;
commit
