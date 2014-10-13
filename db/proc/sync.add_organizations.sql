create or replace procedure sync.add_organizations()
begin
   
    insert into dbo.organization(name,org,inn,kpp,okato,okpo,ogrn,uaddress,faddress,tel,xid)
    select
        web.organization_1c.name,
        web.organization_1c.fullname,
        web.organization_1c.inn,
        web.organization_1c.kpp,
        web.organization_1c.okato,
        web.organization_1c.okpo,
        web.organization_1c.ogrn,
        web.organization_1c.uaddress,
        web.organization_1c.faddress,
        web.organization_1c.tel,
        web.organization_1c.xid
    from web.organization_1c where web.organization_1c.xid not in(select xid from dbo.organization where xid is not null)

end;
