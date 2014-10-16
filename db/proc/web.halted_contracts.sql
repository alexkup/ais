create or replace procedure web.halted_contracts()
begin
select  contract.xid_act,'|',
        contracts_halted.xid,'|',
        contract.xid_act2,'|',
        contracts_halted.xid_act,'|',char(13)+char(10)
 from contracts_halted
join contract on contract.id=contracts_halted.contract_id
where contract."1c_flag"=1
end;

CREATE SERVICE "halted_contracts" TYPE 'RAW' USER "sync_1c" AS call web.halted_contracts;
