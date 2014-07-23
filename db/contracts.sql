alter table contract alter number nvarchar(128);

select * from organization

select * from contract
commit

delete from contract where id not in(5,6);

insert into dbo.contract(number,id_template,ddateb,ddatee,ddatec,id_org,"1c_flag",other_data,xid)
select 
    distinct
    isnull(number,'НЕТ НОМЕРА'),
    4,
    convert(datetime,left(ddateb,charindex(' ',ddateb)-1),104),
    convert(datetime,left(ddatee,charindex(' ',ddatee)-1),104),
    now(),
    (select id from organization where organization.xid=xid_org),
    1,
    link_partner,
    xid
    from web.contracts_1c


delete from contract where id in (6794,7414);
commit

insert into stall_status(id_stall,id_contract)
select
    (select id from stalls where stalls.xid=web.contracts_1c.xid_stall),
    (select id from contract where contract.xid=web.contracts_1c.xid)
from web.contracts_1c where exists(select id from stalls where stalls.xid=web.contracts_1c.xid_stall);



select * from stall_status

rollback
select * from web.contracts_1c where number like '%01%'

select * from web.contracts_1c where xid is null
select * from stalls
