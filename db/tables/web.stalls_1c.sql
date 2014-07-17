create table web.stalls_1c(
  obj_id nvarchar(255),
  stall_type nvarchar(255),
  name nvarchar(255),
  link nvarchar(255),
  typelink nvarchar(255),
  xid UNIQUEIDENTIFIER,
  xid_type UNIQUEIDENTIFIER,
  primary key (xid));
