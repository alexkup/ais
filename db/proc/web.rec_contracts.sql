create or replace procedure web.rec_contracts()
begin
declare @body long nvarchar;
set @body=http_body();
set @body=left(@body,length(@body)-1);
set @body=right(@body,length(@body)-1);
truncate table web.contracts_1c;
insert into web.contracts_1c
SELECT
  partner_name,
  partner_type,
  ddateb,
  ddatee,
  number,
  price,
  link_org,
  link_partner,
  link_stall,
  link_contract,
  xid_org,
  xid_partner,
  xid_stall,
  xid
FROM OPENSTRING(value @body) 
WITH (partner_name nvarchar(255),
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
  xid UNIQUEIDENTIFIER)
option(delimited by '|') 
as h;
select 'rec_contracts: OK';
end;
CREATE SERVICE "contracts" TYPE 'RAW' AUTHORIZATION OFF USER "web" AS call web.rec_contracts();
