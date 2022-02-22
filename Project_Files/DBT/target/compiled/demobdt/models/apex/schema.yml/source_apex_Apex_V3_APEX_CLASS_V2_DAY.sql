

with validation as (

    select
        DAY as day

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

