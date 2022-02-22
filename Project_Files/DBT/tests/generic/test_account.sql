{% test account(model, column_name) %}

with validation as (

    select
        {{ column_name }} as rvn

    from {{ model }}

),

validation_errors as (

    select
        rvn

    from validation
    where rvn is null
    

)

select *
from validation_errors

{% endtest %}