--feedback
SELECT CASE
    when count(t1.*)=count(t2.*) then 'TRUE'
    else 'FALSE'
END AS RESULT
FROM "DEVELOPMENT"."FEEDBACK"."FEEDBACK" as t1, "PC_FIVETRAN_DB"."PUBLIC"."FEEDBACK" as t2;

--LEAD
SELECT CASE
    when count(t1.*)=count(t2.*) then 'TRUE'
    else 'FALSE'
END AS RESULT
FROM "DEVELOPMENT"."OPERATION"."LEAD" as t1, "PC_FIVETRAN_DB"."FIVETRAN_S3"."LEAD" as t2;

--Account2
SELECT CASE
    when count(t1.*)=count(t2.*) then 'TRUE'
    else 'FALSE'
END AS RESULT
FROM "DEVELOPMENT"."ACCOUNT"."ACCOUNT_2" as t1, "PC_FIVETRAN_DB"."FIVETRAN_S3"."ACCOUNT_2" as t2;

--ACCOUNT_FEED 
SELECT CASE
    when count(t1.*)=count(t2.*) then 'TRUE'
    else 'FALSE'
END AS RESULT
FROM "DEVELOPMENT"."ACCOUNT"."ACCOUNT_FEED" as t1, "PC_FIVETRAN_DB"."FIVETRAN_S3"."ACCOUNT_FEED" as t2;

--ACCOUNT HISTORY
SELECT CASE
    when count(t1.*)=count(t2.*) then 'TRUE'
    else 'FALSE'
END AS RESULT
FROM "DEVELOPMENT"."ACCOUNT"."ACCOUNT_HISTORY" as t1, "PC_FIVETRAN_DB"."FIVETRAN_S3"."ACCOUNT_HISTORY" as t2;

--ACCOUNT SHARE
SELECT CASE
    when count(t1.*)=count(t2.*) then 'TRUE'
    else 'FALSE'
END AS RESULT
FROM "DEVELOPMENT"."ACCOUNT"."ACCOUNT_SHARE" as t1, "PC_FIVETRAN_DB"."FIVETRAN_S3"."ACCOUNT_SHARE" as t2;

--APEX PAGE
SELECT CASE
    when count(t1.*)=count(t2.*) then 'TRUE'
    else 'FALSE'
END AS RESULT
FROM "DEVELOPMENT"."APEX"."APEX_PAGE" as t1, "PC_FIVETRAN_DB"."FIVETRAN_S3"."APEX_PAGE" as t2;

--APEX PAGE_INFO
SELECT CASE
    when count(t1.*)=count(t2.*) then 'TRUE'
    else 'FALSE'
END AS RESULT
FROM "DEVELOPMENT"."APEX"."APEX_PAGE_INFO" as t1, "PC_FIVETRAN_DB"."FIVETRAN_S3"."APEX_PAGE_INFO" as t2;

--APEX_TEST_RESULT
SELECT CASE
    when count(t1.*)=count(t2.*) then 'TRUE'
    else 'FALSE'
END AS RESULT
FROM "DEVELOPMENT"."APEX"."APEX_TEST_RESULT" as t1, "PC_FIVETRAN_DB"."FIVETRAN_S3"."APEX_TEST_RESULT" as t2;

SELECT COLUMN_NAME FROM "SNOWFLAKE"."ACCOUNT_USAGE"."COLUMNS" WHERE TABLE_NAME='FEEDBACK' and TABLE_SCHEMA='FIVETRAN_S3';


--1)CHECKING NO. OF COLUMNS FOR FEEDBACK
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='FEEDBACK'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='FEEDBACK'
);
// RESULT - FALSE - REMOVED THE EXTRA COLUMNS ADDED BY FIVETRAN.

--2)CHECKING NO.OF COLUMNS FOR LEAD
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='LEAD'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='LEAD'
); //RESULT- FALSE -> WHILE TRANSFORMING REMOVED UNNECESSARY COLUMNS ADDED BY FIVETRAN.

--3)CHECKING NO.OF COLUMNS FOR ACCOUNT_2
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='ACCOUNT_2'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='ACCOUNT_2'
  );// RESULT - FALSE - REMOVED THE EXTRA COLUMNS ADDED BY FIVETRAN.
  
--4)CHECKING NO.OF COLUMNS FOR ACCOUNT_FEED
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='ACCOUNT_FEED'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='ACCOUNT_FEED'
  );// RESULT - FALSE - REMOVED THE EXTRA COLUMNS ADDED BY FIVETRAN.
  
--5)CHECKING NO.OF COLUMNS FOR ACCOUNT_HISTORY
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='ACCOUNT_HISTORY'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='ACCOUNT_HISTORY'
  );// RESULT - FALSE - REMOVED THE EXTRA COLUMNS ADDED BY FIVETRAN.
  
--6)CHECKING NO.OF COLUMNS FOR ACCOUNT_SHARE
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='ACCOUNT_SHARE'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='ACCOUNT_SHARE'
  );// RESULT - FALSE - REMOVED THE EXTRA COLUMNS ADDED BY FIVETRAN.
  
//APEX
--1)CHECKING NO.OF COLUMNS FOR APEX_PAGE
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='APEX_PAGE'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='APEX_PAGE'
  );// RESULT - FALSE - REMOVED THE EXTRA COLUMNS ADDED BY FIVETRAN.
  
  
--2)CHECKING NO.OF COLUMNS FOR APEX_PAGE_INFO
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='APEX_PAGE_INFO'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='APEX_PAGE_INFO'
  );// RESULT - FALSE - REMOVED THE EXTRA COLUMNS ADDED BY FIVETRAN.
  
--3)CHECKING NO.OF COLUMNS FOR APEX_TEST_RESULT
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='APEX_TEST_RESULT'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='APEX_TEST_RESULT'
  );// RESULT - FALSE - REMOVED THE EXTRA COLUMNS ADDED BY FIVETRAN.
  
--4)CHECKING NO.OF COLUMNS FOR ASYNCAPEXJOB
select case
when max(No_of_columns)-min(No_of_columns)=0 then 'True'
else 'False'
end as Result
from
(
  Select count(c1.column_name) as No_of_columns
from "DEVELOPMENT"."INFORMATION_SCHEMA"."COLUMNS" as c1 where c1.table_name='ASYNCAPEXJOB'
UNION
select count(c2.column_name) as cnt2 from "PC_FIVETRAN_DB"."INFORMATION_SCHEMA"."COLUMNS" as c2
where c2.table_name='ASYNCAPEXJOB'
  );// RESULT - FALSE - REMOVED THE EXTRA COLUMNS ADDED BY FIVETRAN.  