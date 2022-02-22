{{ config(materialized='table') }}

with source_data as (

    select COLUMN_NAME
,CREATED_BY_ID
,CREATED_DATE
,DELETED
,LAST_MODIFIED_BY_ID
,LAST_MODIFIED_DATE
,OPERATION
,SORT_ORDER
,SYSTEM_MODSTAMP
,USER_LIST_VIEW_CRITERIA_ID
,USER_LIST_VIEW_ID
,VALUE from {{ source('USER_LIST', 'USER_LIST_VIEW_CREATION') }}
),

final as (
    select * from source_data
)

select * from final