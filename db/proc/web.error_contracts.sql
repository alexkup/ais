create or replace procedure web.error_contracts()
as
begin
select 
    number as 'Номер догвора',
    ddateb as 'Дата начала',
    ddatee as 'Дата окончания',
    ddatec as 'Дата создания',
    other_data as 'Контрагент(порчее)'
from contract
left join web.contract_acts_1c on web.contract_acts_1c.xid_contrcat=contract.xid
where web.contract_acts_1c.xid_contrcat is null and other_data is not null
order by other_data
end;

CREATE SERVICE "error_contracts" TYPE 'HTML' AUTHORIZATION OFF USER "web" AS call web.error_contracts();
