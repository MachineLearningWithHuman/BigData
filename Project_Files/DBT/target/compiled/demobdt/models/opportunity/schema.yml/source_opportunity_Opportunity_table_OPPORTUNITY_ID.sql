

with validation as (

    select
        ID as id

    from PC_FIVETRAN_DB.FIVETRAN_S3.OPPORTUNITY

),

validation_errors as (

    select
        id

    from validation
    where id is null
    

)

select *
from validation_errors

