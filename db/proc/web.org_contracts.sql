select 
    contract.number,
    contract.ddateb,
    contract.ddatee,
    contract.ddatec,
    organization.name,
    organization.org,
    organization.mainaccname,
    organization.directorname,
    organization.inn,
    organization.kpp,
    organization.okpo,
    organization.ogrn,
    organization.xid,

     from contract
left join organization on contract.id_org=organization.id
left join person on contract.id_person=person.person_id
left join dealership on dealership.id=contract.id_dealership
