WITH source AS (
    SELECT *
    FROM {{ ref('stg_farms') }}
)

SELECT
    farm_type,
    COUNT(*) AS nb_farms
FROM source
GROUP BY farm_type