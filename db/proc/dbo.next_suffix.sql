create or replace function dbo.next_suffix(@fio nvarchar(1000))
returns int
begin
declare @k int;

set @k=cast((select count(lname+' '+mname+' '+fname) from person
    where (lname+' '+mname+' '+fname)=@fio
    group by (lname+' '+mname+' '+fname)) as int); 
 
return @k-1;
end;
