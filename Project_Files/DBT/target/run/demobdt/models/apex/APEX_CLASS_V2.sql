

      create or replace transient table PC_FIVETRAN_DB.TRANSFORMATION.APEX_CLASS_V2  as
      (

with source_data as (

     SELECT API_VERSION
,BODY_CRC
,CREATED_DATE
,IS_VALID
,LAST_MODIFIED_BY_ID
,LAST_MODIFIED_DATE
,NAMESPACE_PREFIX
,SIZE_WITHOUT_COMMENTS
,STATUS
,cast(SYSTEM_MODSTAMP as datetime) as SYSTEM_MODSTAMP
from PC_FIVETRAN_DB.TRANSFORMATION.APEX_CLASS_V1
),

final as (
    select * from source_data
)

select * from final
      );
    