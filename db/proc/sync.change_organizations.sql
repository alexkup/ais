create or replace procedure sync.change_organizations()
begin
    update dbo.organization set
        dbo.organization.name=web.organization_1c.name,
        dbo.organization.org=web.organization_1c.fullname,
        dbo.organization.inn=web.organization_1c.inn,
        dbo.organization.kpp=web.organization_1c.kpp,
        dbo.organization.okato=web.organization_1c.okato,
        dbo.organization.okpo=web.organization_1c.okpo,
        dbo.organization.ogrn=web.organization_1c.ogrn,
        dbo.organization.uaddress=web.organization_1c.uaddress,
        dbo.organization.faddress=web.organization_1c.faddress,
        dbo.organization.tel=web.organization_1c.tel
    from web.organization_1c,dbo.organization where (web.organization_1c.xid=dbo.organization.xid) and
    (web.organization_1c.name<>isnull(dbo.organization.name,'') or web.organization_1c.fullname<>isnull(dbo.organization.org,'') or
    web.organization_1c.inn<>isnull(dbo.organization.inn,'') or web.organization_1c.kpp<>isnull(dbo.organization.kpp,'') or
    web.organization_1c.okato<>isnull(dbo.organization.okato,'') or web.organization_1c.okpo<>isnull(dbo.organization.okpo,'') or
    web.organization_1c.ogrn<>isnull(dbo.organization.ogrn,'') or dbo.organization.uaddress<>isnull(web.organization_1c.uaddress,'') or
    isnull(dbo.organization.faddress,'')<>web.organization_1c.faddress or isnull(dbo.organization.tel,'')<>web.organization_1c.tel)
end;
