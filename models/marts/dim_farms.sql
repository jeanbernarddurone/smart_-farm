with farms as (

    select *
    from {{ ref('stg_farms') }}

)

select

    farm_id,
    farm_name,

    owner_name,
    email,
    owner_phone,

    founded_year,

    extract(year from current_date) - founded_year as farm_age,

    case
        when extract(year from current_date) - founded_year < 10
            then 'recent'
        when extract(year from current_date) - founded_year < 30
            then 'established'
        else 'legacy'
    end as farm_age_group,

    total_area_hectares,

    case
        when total_area_hectares < 100 then 'small'
        when total_area_hectares < 500 then 'medium'
        else 'large'
    end as farm_size_category,

    region,
    city,
    province,

    latitude,
    longitude,

    farm_type,
    certification,

    status as STATUT

from farms