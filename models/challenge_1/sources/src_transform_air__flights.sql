SELECT 
    flight_id,
    flight_date,
    mileage
FROM {{ source('transform_air', 'flights') }}