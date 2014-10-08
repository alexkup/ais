create or replace procedure web.rec_contract_acts()
begin
declare @body long nvarchar;
set @body=http_body();
set @body=left(@body,length(@body)-1);
set @body=right(@body,length(@body)-1);
truncate table web.contract_acts_1c;
insert into web.contract_acts_1c
SELECT
  link_contract,
  link_zak,
  link_act,
  xid_contrcat,
  xid_zak,
  xid_act
FROM OPENSTRING(value @body) 
WITH (link_contract nvarchar(255),
  link_zak nvarchar(255),
  link_act nvarchar(255),
  xid_contrcat UNIQUEIDENTIFIER,
  xid_zak UNIQUEIDENTIFIER,
  xid_act UNIQUEIDENTIFIER)
option(delimited by '|' ESCAPES OFF) 
as h;
select 'rec_contract_acts: OK';
end;
CREATE SERVICE "contracts_acts" TYPE 'RAW' AUTHORIZATION OFF USER "web" AS call web.rec_contract_acts();
