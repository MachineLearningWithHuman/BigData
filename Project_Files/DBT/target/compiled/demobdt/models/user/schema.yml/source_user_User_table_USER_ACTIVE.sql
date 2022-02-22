

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

