

with validation as (

    select
        LEAD_ID as id

    from PC_FIVETRAN_DB.FIVETRAN_S3.LEAD

),

validation_errors as (

    select
        id

    from validation
    where id is null
    

)

select *
from validation_errors

