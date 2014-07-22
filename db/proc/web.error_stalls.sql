create procedure web.error_stalls()
as
begin
  select name as 'группа мест в 1с',typelink as 'конфликтыне значения','существуют места с различными типами мест' as 'ошибка' from web.objects_1c where xid in(
    select xid from web.objects_1c
    where xid_type is not null
    group by xid
    having count(xid_type)>1)
  union all
  select name,isnull(typelink,'НЕ ЗАДАН!!'),'существуют места с пустыми типами мест' from web.objects_1c where xid in(
    select xid from web.objects_1c
    where xid_type is null)
end;
