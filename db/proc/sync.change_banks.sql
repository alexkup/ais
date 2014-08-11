create or replace procedure sync.change_banks()
begin
update dbo.banks set
    dbo.banks.bname=web.banks_1c.bankname,
    dbo.banks.name=web.banks_1c.name,
    dbo.banks.addr=web.banks_1c.city+' '+web.banks_1c.address,
    dbo.banks.rs=web.banks_1c.schet,
    dbo.banks.bic=web.banks_1c.bik,
    dbo.banks.cs=web.banks_1c.korschet
    from web.banks_1c,dbo.banks where (web.banks_1c.xid=dbo.banks.xid) and (
    dbo.banks.bname<>web.banks_1c.bankname or dbo.banks.name<>web.banks_1c.name or
    dbo.banks.addr<>(web.banks_1c.city+' '+web.banks_1c.address) or dbo.banks.rs<>web.banks_1c.schet or
    dbo.banks.bic<>web.banks_1c.bik or dbo.banks.cs<>web.banks_1c.korschet)
end;
