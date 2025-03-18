SELECT
    *
FROM {{ source('fresh_select', 'dim_name') }}