SELECT
    test.value,
    ref.name,
    test.load_date
FROM {{ ref('stg__challenge_2') }} test
LEFT JOIN {{ ref('stg__dim_name') }} ref
    ON test.value = ref.value