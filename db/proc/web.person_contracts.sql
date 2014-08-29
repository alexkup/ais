create or replace procedure web.person_contracts()
begin
select 
    contract.number,'|',
    convert(nvarchar,contract.ddateb,112),'|',
    convert(nvarchar,contract.ddatee,112),'|',
    convert(nvarchar,contract.ddatec,112),'|',
    (person.lname+' '+person.fname+' '+person.mname),'|',
    (select top 1 
    (select name from pers_doc_type pdt where pdt.pers_doc_type_id=pd.pers_doc_type_id)+' '+pd.ser+' '+pd.num+' выдан '+
    pd.org+', '+cast(ddate as nvarchar)
from pers_doc pd where pd.person_id=person.person_id order by pd.pers_doc_type_id),'|',
    person.inn,'|',
    cast(person.xid as nvarchar),'|',
    cast((select xid from organization o where o.id=(select id_org from dealership where contract.id_dealership=dealership.id))as nvarchar) as org_xid,'|',
    contract.xid,'|',
    contract.xid_act,'|',
    contract.xid_act2,'|',
    (SELECT list(xid) from stall_status join stalls on stalls.id=stall_status.id_stall where stall_status.id_contract=contract.id),'|',
    price.cost,'|',char(13)+char(10)
     from contract
left join organization on contract.id_org=organization.id
left join person on contract.id_person=person.person_id
left join dealership on dealership.id=contract.id_dealership
left join price on price.id=contract.id_price
where contract."1c_flag"=1 and dealership.id_person<>-1 and contract.id_org is null;
end;

CREATE SERVICE "person_contracts" TYPE 'RAW' USER "sync_1c" AS call web.person_contracts;
