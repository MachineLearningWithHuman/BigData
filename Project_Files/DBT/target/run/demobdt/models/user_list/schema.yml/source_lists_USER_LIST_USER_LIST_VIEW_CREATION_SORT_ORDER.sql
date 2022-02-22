select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with validation as (

    select
        SORT_ORDER as sort

    from PC_FIVETRAN_DB.FIVETRAN_S3.USER_LIST_VIEW_CREATION

),

validation_errors as (

    select
        sort

    from validation
    where sort >1 and sort is null
    

)

select *
from validation_errors


      
    ) dbt_internal_test