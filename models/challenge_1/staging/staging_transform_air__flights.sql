SELECT
    flight_id,
    DATE(flight_date , 'dd/mm/yyyy') AS flight_date,
    mileage
FROM {{ ref('src_transform_air__flights') }}