SELECT
    foreign_key AS value,
    name
FROM {{ ref('src__dim_name') }}