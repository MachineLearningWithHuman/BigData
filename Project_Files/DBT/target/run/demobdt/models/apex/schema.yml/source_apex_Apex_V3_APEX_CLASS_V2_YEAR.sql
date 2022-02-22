select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with validation as (

    select
        YEAR as day

    from PC_FIVETRAN_DB.TRANSFORMATION.APEX_CLASS_V2

),

validation_errors as (

    select
        day

    from validation
    where day <1000
    

)

select *
from validation_errors


      
    ) dbt_internal_test