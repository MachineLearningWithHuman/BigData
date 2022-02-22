{% test opportunity(model, column_name) %}

with validation as (

    select
        {{ column_name }} as id

    from {{ model }}

),

validation_errors as (

    select
        id

    from validation
    where id is null
    

)

select *
from validation_errors

{% endtest %}