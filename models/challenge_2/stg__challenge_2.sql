SELECT
    value,
    DATE(load_timestamp) AS load_date
FROM {{ ref('src__challenge_2') }}