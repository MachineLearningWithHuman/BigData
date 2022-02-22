{% test user(model, column_name) %}

with validation as (

    select
        {{ column_name }} as active_status

    from {{ model }}

),

validation_errors as (

    select
        active_status

    from validation
    where active_status not in ('TRUE','FALSE')
    

)

select *
from validation_errors

{% endtest %}