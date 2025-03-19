WITH booking_details AS (
    SELECT
        *
    FROM {{ ref('staging_transform_air__booking_details') }}
),

flights AS (
    SELECT
        *
    FROM {{ ref('staging_transform_air__flights') }}
)

SELECT
    booking_id,
    frequent_flyer_id,
    flight_date AS charge_date,
    CASE 
        WHEN RANK() OVER (partition by booking_id ORDER BY flight_date ASC) = 1 
        THEN booking_price 
    END AS booking_spend
FROM booking_details
LEFT JOIN flights
ON booking_details.flight_id = flights.flight_id
QUALIFY booking_spend IS NOT NULL