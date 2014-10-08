update contract set contract.xid_act=web.contract_acts_1c.xid_zak, contract.xid_act2=web.contract_acts_1c.xid_act from web.contract_acts_1c
where contract.xid=web.contract_acts_1c.xid_contrcat
commit
