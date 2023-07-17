with advisories as (
    select * from {{source('deps_dev_v1', 'Advisories')}} limit 50
),

final as (
    select * from advisories
)


select * from final