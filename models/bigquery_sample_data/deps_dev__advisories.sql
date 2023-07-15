with advisories as (
    select * from {{source('deps_dev_v1', 'Advisories')}} limit 5
),

final as (
    select * from advisories
)


select * from final