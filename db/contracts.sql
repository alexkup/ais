begin
    declare local temporary table tmp_dog(number nvarchar(256))
    ON COMMIT PRESERVE ROWS; 
create index idx_tmp on tmp_dog(number);
LOAD TABLE tmp_dog(number)
FROM '/home/ubuntu/dog2.csv'
STRIP OFF
QUOTES OFF
ESCAPES OFF
DELIMITED BY ';';


select count(*) from tmp_dog 
left join contract on tmp_dog.number like contract.number
where tmp_dog.number is not null and contract.number is null;
/*
select * from contract
left join tmp_dog on tmp_dog.number=contract.number
where tmp_dog.number is null and contract.number is not null;
*/
end;

select count(distinct number) from contract



select * from sa_conn_info()
select * from objects where address like 'НЕПРО%'

select * from web.obj_type_1c
left join  obj_type on  web.obj_type_1c.xid= obj_type.xid

select * from emp_obj
insert into emp_obj(id_obj,id_person)
select id,26 from objects

select * from employee
insert into employee
select 26,4,12

select * from person 
select * from logins --26

select count(*) from contract

delete from stall_status where id_contract not in(5,6)
delete from contract where id not in(5,6);
commit


insert into person(person_id,lname)
select -1,'служебная персона'

insert into dealership(number,id_org,id_person,ddateb,ddatee)
select 'служебная '+cast(id as nvarchar),id,-1,'1990-01-01','2099-01-01' from organization
where partner_flag=0

insert into dbo.contract(number,id_template,ddateb,ddatee,ddatec,id_org,"1c_flag",other_data,xid)
select 
    distinct
    isnull(number,'НЕТ НОМЕРА'),
    4,
    convert(datetime,left(ddateb,charindex(' ',ddateb)-1),104),
    isnull(convert(datetime,left(ddatee,charindex(' ',ddatee)-1),104),'2099-01-01'),
    now(),
    (select id from dealership where dealership.id_person=-1 and dealership.id_org=(select id from organization where organization.xid=xid_org)),
    1,
    link_partner,
    xid
    from web.contracts_1c


--delete from contract where id in (6794,7414);
--commit

insert into stall_status(id_stall,id_contract)
select 
    stalls.id,
    contract.id
from stalls
join web.contracts_1c on stalls.xid=web.contracts_1c.xid_stall
join contract on web.contracts_1c.xid=contract.xid 
commit

select count(*) from stall_status

rollback
select count(distinct number) from web.contracts_1c where number is not null

select * from web.contracts_1c where xid is null
select count(*) from stalls

select * from contract where number like '0304800301ММ%';
