SELECT
    customer_id,
    frequent_flyer_id,
    customer_name
FROM {{ ref('src_transform_air__customers') }}