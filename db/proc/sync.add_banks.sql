create or replace procedure sync.add_banks()
begin
insert into banks(bname,name,addr,rs,bic,cs,org,xid)
select 
    web.banks_1c.bankname,
    web.banks_1c.name,
    web.banks_1c.city+' '+web.banks_1c.address,
    web.banks_1c.schet,
    web.banks_1c.bik,
    web.banks_1c.korschet,
    organization.id,
    web.banks_1c.xid
from web.banks_1c
join organization on organization.xid=web.banks_1c.xid_org
where web.banks_1c.xid not in(select xid from dbo.banks where xid is not null)
end;
