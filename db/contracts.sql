alter table contract alter number nvarchar(128);

select * from organization

select * from contract
commit

delete from contract where id not in(5,6);

insert into dbo.contract(number,id_template,ddateb,ddatee,ddatec,id_org,"1c_flag",other_data,xid)
select 
    isnull(number,'НЕТ НОМЕРА'),
    4,
    convert(datetime,left(ddateb,charindex(' ',ddateb)-1),104),
    convert(datetime,left(ddatee,charindex(' ',ddatee)-1),104),
    now(),
    (select id from organization where organization.xid=xid_org),
    1,
    (link_partner+' '+link_stall),
    xid
    from web.contracts_1c

insert into stall_status
select
    (select id from stalls where stalls.xid=web.contracts_1c.xid_stall),
    (select id from contract where contract.xid=web.contracts_1c.xid)
from web.contracts_1c;



select * from web.contracts_1c where number like '%01%'
