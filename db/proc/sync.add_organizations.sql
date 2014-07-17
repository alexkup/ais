create or replace procedure sync.add_organizations()
begin
   
    insert into dbo.organization(name,org,inn,kpp,okato,okpo,ogrn)
    select
        web.organization_1c.name,
        web.organization_1c.fullname,
        web.organization_1c.inn,
        web.organization_1c.kpp,
        web.organization_1c.okato,
        web.organization_1c.okpo,
        web.organization_1c.ogrn
    from web.organization_1c where web.organization_1c.xid not in(select xid from dbo.organization)

end;
