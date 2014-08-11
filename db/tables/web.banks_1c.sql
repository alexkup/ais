create table web.banks_1c(
    link nvarchar(255),
    name nvarchar(255),
    city nvarchar(255),
    address nvarchar(255),
    schet nvarchar(255),
    korschet nvarchar(255),
    bik nvarchar(255),
    link_org nvarchar(255),
    xid_org UNIQUEIDENTIFIER,
    xid UNIQUEIDENTIFIER,
    primary key (xid));
