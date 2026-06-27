WITH source AS (
    SELECT *
    FROM {{ ref('farms_crop') }}
)

SELECT *
FROM source