create or replace function dbo.org_name_with_suffix(@oid int)
returns nvarchar(1000)
begin
declare @k nvarchar(1000);
select
    (case when IDENTITY(10)=1 then name
        else name+' ('+cast((IDENTITY(10)-1)as varchar)+')'
    end)as nn, id into #tmp
from organization 
where name=(select name from organization where id=@oid);

set @k=(select nn from #tmp where id=@oid);

return @k;
end;
