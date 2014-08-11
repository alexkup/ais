create or replace function dbo.generate_contract_number(@id_stall int)
returns nvarchar(100)
begin
  declare @rrr nvarchar(100);
  set @rrr = (select regexp_substr(obj_type.name,'(\d+)')+rtrim(objects.number)+regexp_substr(stalls.number,'(\d+)')
  from stalls
  join objects on  objects.id=stalls.id_object
  join obj_type on objects.id_obj_type=obj_type.id_obj_type
  where stalls.id=@id_stall);
    return @rrr;
end;
