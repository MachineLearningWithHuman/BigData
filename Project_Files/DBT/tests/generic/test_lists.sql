{% test lists(model, column_name) %}

with validation as (

    select
        {{ column_name }} as sort

    from {{ model }}

),

validation_errors as (

    select
        sort

    from validation
    where sort >1 and sort is null
    

)

select *
from validation_errors

{% endtest %}