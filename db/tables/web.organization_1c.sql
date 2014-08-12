create table web.organization_1c (
    name nvarchar(255),
    fullname nvarchar(255),
    inn nvarchar(255),
    kpp nvarchar(255),
    okato nvarchar(255),
    okpo nvarchar(255),
    ogrn nvarchar(255),
    link nvarchar(255),
    link_bank nvarchar(255),
    uaddress nvarchar(1024),
    faddress nvarchar(1024),
    tel nvarchar(256);
    xid_bank UNIQUEIDENTIFIER,
    xid UNIQUEIDENTIFIER,
    primary key (xid));
