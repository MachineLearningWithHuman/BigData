select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with validation as (

    select
        ANNUAL_REVENUE as rvn

    from PC_FIVETRAN_DB.TRANSFORMATION.ACCOUNT_V3

),

validation_errors as (

    select
        rvn

    from validation
    where rvn is null
    

)

select *
from validation_errors


      
    ) dbt_internal_test