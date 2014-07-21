create or replace procedure web.person_contracts()
begin
select 
    contract.number,
    contract.ddateb,
    contract.ddatee,
    contract.ddatec,
    (person.lname+' '+person.fname+' '+person.mname),
    (select top 1 
    (select name from pers_doc_type pdt where pdt.pers_doc_type_id=pd.pers_doc_type_id)+' '+pd.ser+' '+pd.num+' выдан '+
    pd.org+', '+cast(ddate as nvarchar)
from pers_doc pd where pd.person_id=person.person_id order by pd.pers_doc_type_id),
    person.inn,
    person.xid

     from contract
left join organization on contract.id_org=organization.id
left join person on contract.id_person=person.person_id
left join dealership on dealership.id=contract.id_dealership
end;
