create view dev.stalls_with_contracts as
SELECT distinct stalls.id_object AS object_id,
    objects.number as obj_number,
    objects.address,
    stalls.id AS stall_id,
    stalls.number AS stall_number,
    contract.id AS doc_id,
    contract.number AS doc_number,
    contract.ddateb,
    contract.ddatee,
    contract.ddatec,
    contract.id_price,
    contract.signature,
    contract."1c_flag" as flag,
    contract.want_halt,
    contract.id_org,
    contract.id_person,
    dealership.id_person as user_id,
    dealership.id as dealership_id,
    dealership.number as dealership_number,
    contract.other_data,
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
    contract.xid,
    picture.picture,
    contract.ts
FROM stalls 
LEFT JOIN objects on objects.id = stalls.id_object
left JOIN stall_status ON stalls.id = stall_status.id_stall 
LEFT JOIN contract ON stall_status.id_contract = contract.id
left join templates on templates.id_template = contract.id_template
LEFT JOIN price ON contract.id_price = price.id
left join dealership on dealership.id = contract.id_dealership
left join person as users on users.person_id = contract.id_person
left join organization on organization.id = contract.id_org
left join pers_doc on pers_doc.person_id = contract.id_person
left join picture on picture.id=contract.id_picture
where (getdate() between isnull(contract.ddateb,'1990-01-01') and isnull(contract.ddatee,'2050-01-01'))
