{% test does_title_include_null(model, column_name) %}

with validation as (

    select
        {{ column_name }} as title

    from {{ model }}

),

validation_errors as (

    select
        title

    from validation

    where title like '%NULL%'

)

select *
from validation_errors

{% endtest %}