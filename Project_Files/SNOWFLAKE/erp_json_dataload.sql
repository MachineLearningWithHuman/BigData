CREATE OR REPLACE STAGE "PC_FIVETRAN_DB"."ERP_SCHEMA".json_stage
    url='s3://projectunity/erp_data/'
    credentials=(aws_key_id='AKIAWPWG7LQZEHM53XU7' aws_secret_key='wR25209BeccmmOSozVqZaTdSQV+VFuKSPorw0XQS')
     file_format= JSON_FF;

create or replace table salary (
ActionCode varchar
,ActionReasonCode varchar
,AssignmentNumber varchar
,DateFrom varchar
,DateTo varchar
,METADATA varchar
,MultipleComponents varchar
,NextSalReviewDate varchar
,Salary varchar
,SalaryAmount varchar
,SalaryApproved varchar
,SalaryBasisName varchar
,SourceSystemId varchar
,SourceSystemOwner varchar
,filename    VARCHAR
   ,file_row_number VARCHAR
   ,load_timestamp timestamp default TO_TIMESTAMP_NTZ(current_timestamp));
   

   
copy into "PC_FIVETRAN_DB"."ERP_SCHEMA"."SALARY"  from( 
 SELECT
$1:ActionCode::VARCHAR 
,$1:ActionReasonCode::VARCHAR 
,$1:AssignmentNumber::VARCHAR 
,$1:DateFrom::VARCHAR  
,$1:DateTo::VARCHAR 
,$1:METADATA::VARCHAR 
,$1:MultipleComponents::VARCHAR 
,$1:NextSalReviewDate::VARCHAR 
,$1:Salary::VARCHAR 
,$1:SalaryAmount::varchar
,$1:SalaryApproved::VARCHAR 
,$1:SalaryBasisName::VARCHAR 
,$1:SourceSystemId::VARCHAR
,$1:SourceSystemOwner::VARCHAR 
,METADATA$FILENAME
,METADATA$FILE_ROW_NUMBER
,TO_TIMESTAMP_NTZ(current_timestamp)
from @PC_FIVETRAN_DB.ERP_SCHEMA.json_stage/salary.json)
on_error='continue';

select * from salary;



create or replace table JOB (
ActionReasonCode VARCHAR
,ActiveStatus VARCHAR
,ApprovalAuthority VARCHAR
,BenchmarkJobCode VARCHAR
,BenchmarkJobFlag VARCHAR
,CategoryCode VARCHAR
,EffectiveEndDate VARCHAR
,EffectiveStartDate VARCHAR
,FullPartTime VARCHAR
,Job VARCHAR
,JobCode VARCHAR
,JobFamilyName VARCHAR
,JobFunctionCode VARCHAR
,METADATA VARCHAR
,ManagerLevel VARCHAR
,MedicalCheckupRequired VARCHAR
,Name VARCHAR
,ProgressionJobCode VARCHAR
,RegularTemporary VARCHAR
,SetCode VARCHAR
,SourceSystemId VARCHAR
,SourceSystemOwner VARCHAR
,filename    VARCHAR 
,file_row_number VARCHAR
,load_timestamp timestamp default TO_TIMESTAMP_NTZ(current_timestamp));


copy into "PC_FIVETRAN_DB"."ERP_SCHEMA"."JOB" from (SELECT 	
	$1: ActionReasonCode::VARCHAR 
,	$1: ActiveStatus::VARCHAR 
,	$1: ApprovalAuthority::VARCHAR 
,	$1: BenchmarkJobCode::VARCHAR 
,	$1: BenchmarkJobFlag::VARCHAR 
,	$1: CategoryCode::VARCHAR 
,	$1: EffectiveEndDate::VARCHAR
,	$1: EffectiveStartDate::VARCHAR 
,	$1: FullPartTime::VARCHAR 
,	$1: Job::VARCHAR
,	$1: JobCode::VARCHAR 
,	$1: JobFamilyName::VARCHAR 
,	$1: JobFunctionCode::VARCHAR 
,	$1: METADATA::VARCHAR 
,	$1: ManagerLevel::VARCHAR 
,	$1: MedicalCheckupRequired::VARCHAR 
,	$1: Name::VARCHAR
,	$1: ProgressionJobCode::VARCHAR 
,	$1: RegularTemporary::VARCHAR 
,	$1: SetCode::VARCHAR 
,	$1: SourceSystemId::VARCHAR 
,	$1: SourceSystemOwner::VARCHAR 
,METADATA$FILENAME
,METADATA$FILE_ROW_NUMBER
,TO_TIMESTAMP_NTZ(current_timestamp)
from @PC_FIVETRAN_DB.ERP_SCHEMA.json_stage/job.json)
on_error='continue';


select * from job;