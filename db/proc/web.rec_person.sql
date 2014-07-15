create or replace procedure web.rec_person()
begin
declare @body long nvarchar;
set @body=http_body();
set @body=left(@body,length(@body)-1);
set @body=right(@body,length(@body)-1);
truncate table web.person_1c;
insert into web.person_1c
SELECT
    "fname",
	"mname",
	"lname",
	"sex",
	birth_date,
	"pers_account",
	"inn",
    link,
	"xid"
FROM OPENSTRING(value @body) 
WITH ("fname" nvarchar(60),
	"mname" nvarchar(60),
	"lname" nvarchar(120),
	"sex" nvarchar(30),
	"birth_date" nvarchar(100),
	"pers_account" nvarchar(100),
	"inn" nchar(36),
    link nvarchar(255), 
	"xid" UNIQUEIDENTIFIER)
option(delimited by '|') 
as h;
select 'OK';
end;
CREATE SERVICE "person" TYPE 'RAW' AUTHORIZATION OFF USER "web" AS call web.rec_person();
