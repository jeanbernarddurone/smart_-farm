with source as (

    select * 
    from {{ ref('farms') }}

)

select

    -- Identifiants
    farm_id,

    -- Infos ferme
    trim(farm_name) as farm_name,
    trim(owner_name) as owner_name,
    lower(trim(owner_email)) as email,
    owner_phone,


    -- Géographie
    trim(region) as region,
    trim(city) as city,
    trim(province) as province,

    -- Catégories
    lower(trim(farm_type)) as farm_type,
    lower(trim(certification)) as certification,
    lower(trim(status)) as status,

    -- Champs dérivés utiles
    case 
        when founded_year <= 1980 then 'old'
        when founded_year between 1981 and 2005 then 'mid'
        else 'recent'
    end as farm_age_category,

    -- Région simplifiée (utile BI)
    case 
        when province in ('Quebec') then 'QC'
        when province in ('Ontario') then 'ON'
        when province in ('Manitoba') then 'MB'
        when province in ('British Columbia') then 'BC'
        else 'other'
    end as province_code,
    founded_year,
    total_area_hectares,
    latitude,
    longitude

from source