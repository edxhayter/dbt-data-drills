WITH bookings_details AS (
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
    booking_details.booking_flight_id,
    booking_details.booking_id,
    booking_details.flight_id,
    booking_details.frequent_flyer_id,
    
    flights.flight_date,
    flights.mileage

FROM booking_details
LEFT JOIN flights
ON booking_details.flight_id = flights.flight_id
