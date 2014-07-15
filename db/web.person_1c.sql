CREATE TABLE "web"."person_1c" (
	"fname" nvarchar(60),
	"mname" nvarchar(60),
	"lname" nvarchar(120),
	"sex" nvarchar(30),
	"birth_date" datetime,
	"pers_account" nvarchar(100),
	"inn" nchar(36),
	link nvarchar(255), 
	"xid" UNIQUEIDENTIFIER,
	PRIMARY KEY (xid));
