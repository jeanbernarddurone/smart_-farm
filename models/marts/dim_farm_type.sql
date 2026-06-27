WITH source AS (
    SELECT *
    FROM {{ ref('stg_farms') }}
)

SELECT
    farm_type,
    COUNT(*) AS Quantity_exploita
FROM source
GROUP BY farm_type