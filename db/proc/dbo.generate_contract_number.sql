create or replace function dbo.generate_contract_number(@id_stall int)
returns nvarchar(100)
begin
  declare @rrr nvarchar(100);
  declare @k int;

  set @k = (select count(*) from stall_status 
  join contract on contract.id=stall_status.id_contract
  where stall_status.id_stall=@id_stall)+1;

  set @rrr = (select regexp_substr(obj_type.name,'(\d+)')+rtrim(objects.number)+regexp_substr(stalls.number,'(\d+)')
  from stalls
  join objects on  objects.id=stalls.id_object
  join obj_type on objects.id_obj_type=obj_type.id_obj_type
  where stalls.id=@id_stall);
    if length((select regexp_substr(stalls.number,'(\d+)') from stalls where stalls.id=@id_stall))<4 then return @rrr+right('0'+cast(@k as nvarchar),2);
    else return @rrr;
    end if;
end;
