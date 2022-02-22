{% test apex(model, column_name) %}

with validation as (

    select
        {{ column_name }} as isvalid

    from {{ model }}

),

validation_errors as (

    select
        isvalid

    from validation
    where isvalid >1
    

)

select *
from validation_errors

{% endtest %}