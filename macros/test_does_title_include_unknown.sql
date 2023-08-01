{% test does_title_include_unknown(model, column_name) %}

with validation as (

    select
        {{ column_name }} as title, 
        Source

    from {{ model }}

),

validation_errors as (

    select
        title

    from validation

    where title like '%UNKNOWN%' AND Source != 'OSV' AND Source is not null 

)

select *
from validation_errors

{% endtest %}