create table web.contracts_1c(
  partner_name nvarchar(255),
  partner_type nvarchar(255),
  ddateb nvarchar(255),
  ddatee nvarchar(255),
  number nvarchar(255),
  price nvarchar(255),
  link_org nvarchar(255),
  link_partner nvarchar(255),
  link_stall nvarchar(255),
  link_contract nvarchar(255),
  xid_org UNIQUEIDENTIFIER,
  xid_partner UNIQUEIDENTIFIER,
  xid_stall UNIQUEIDENTIFIER,
  xid UNIQUEIDENTIFIER not null);

create index idx_contract_number on dbo.contract(number);
