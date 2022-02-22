{{ config(materialized='table') }}

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
,SYSTEM_MODSTAMP
,DAY(SYSTEM_MODSTAMP) AS DAY
,MONTHNAME(SYSTEM_MODSTAMP) AS MONTH
,YEAR(SYSTEM_MODSTAMP) AS YEAR
from {{ source('Apex_V3', 'APEX_CLASS_V2') }}
),

final as (
    select * from source_data
)

select * from final