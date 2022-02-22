select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with validation as (

    select
        ACTIVE as active_status

    from PC_FIVETRAN_DB.FIVETRAN_S3.USER

),

validation_errors as (

    select
        active_status

    from validation
    where active_status not in ('TRUE','FALSE')
    

)

select *
from validation_errors


      
    ) dbt_internal_test