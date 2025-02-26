SELECT 
    customer_id,
    frequent_flyer_id,
    customer_name
FROM {{ source('transform_air', 'customers') }}