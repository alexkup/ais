create view dbo.stalls_with_contracts_now
as
select
    distinct stalls.id_object AS object_id,
    objects.number as obj_number,
    objects.address,
    stalls.id AS stall_id,
    stalls.number AS stall_number,
    stall_contracts_now.id AS doc_id,
    stall_contracts_now.number AS doc_number,
    stall_contracts_now.ddateb,
    stall_contracts_now.ddatee,
    stall_contracts_now.ddatec,
    stall_contracts_now.id_price,
    stall_contracts_now.signature,
    stall_contracts_now."1c_flag" as flag,
    stall_contracts_now.want_halt,
    stall_contracts_now.id_org,
    stall_contracts_now.id_person,
    dealership.id_person as user_id,
    dealership.id as dealership_id,
    dealership.number as dealership_number,
    stall_contracts_now.other_data,
    templates.filename,
    organization.name,
    price.cost,
    price.name as price_name,
    users.fname,
    users.lname,
    users.mname,
    pers_doc.ser,
    pers_doc.num,
    pers_doc.ddate as pass_date,
    pers_doc.org as pass_org,
    pers_doc.dept_code,
    stall_contracts_now.xid,
    picture.picture,
    stall_contracts_now.ts
from stalls 
left join objects on objects.id = stalls.id_object
left join stall_contracts_now on stall_contracts_now.id_stall=stalls.id
left join templates on templates.id_template = stall_contracts_now.id_template
left join price ON stall_contracts_now.id_price = price.id
left join dealership on dealership.id = stall_contracts_now.id_dealership
left join person as users on users.person_id = stall_contracts_now.id_person
left join organization on organization.id = stall_contracts_now.id_org
left join pers_doc on pers_doc.person_id = stall_contracts_now.id_person
left join picture on picture.id=stall_contracts_now.id_picture
