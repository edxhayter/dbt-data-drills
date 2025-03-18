SELECT
    *
FROM {{ source('fresh_select', 'source_status__test') }}