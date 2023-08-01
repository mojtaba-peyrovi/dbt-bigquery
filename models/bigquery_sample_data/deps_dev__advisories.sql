with advisories as (
    select * from {{source('deps_dev_v1', 'Advisories')}} limit 50
),

final as (
    select *,
    advisories.Source = '{{ var("advisory_source") }}' as is_from_osv
    from advisories
)


select * from final