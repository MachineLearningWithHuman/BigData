

with validation as (

    select
        IS_VALID as isvalid

    from PC_FIVETRAN_DB.TRANSFORMATION.APEX_CLASS_V2

),

validation_errors as (

    select
        isvalid

    from validation
    where isvalid >1
    

)

select *
from validation_errors

