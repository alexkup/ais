create view dbo.stall_contracts_now as
select 
    	contract.id,
	contract.number,
	contract.id_template,
	contract.ddateb,
	contract.ddatee,
	contract.ddatec,
	contract.id_picture,
	contract.id_org,
	contract.id_person,
	contract.id_dealership,
	contract.id_dealership_emp,
	contract.id_price,	
	contract.signature,
	contract."1c_flag",
	contract.other_data,
	contract.xid,
	contract.xid_act,
	contract.xid_act2,
	contract.ts,
	contract.want_halt,
    	stall_status.id_stall
 from contract
join stall_status on stall_status.id_contract=contract.id
where (getdate() between contract.ddateb and contract.ddatee)
