WITH bookings AS (
    SELECT
        *
    FROM {{ ref('staging_transform_air__bookings') }}
),

flights AS (
    SELECT
        *
    FROM {{ ref('staging_transform_air__flights') }}
)

SELECT
    bookings.booking_flight_id,
    bookings.booking_id,
    bookings.flight_id,
    bookings.frequent_flyer_id,
    
    flights.flight_date,
    flights.mileage

FROM bookings
LEFT JOIN flights
ON bookings.flight_id = flights.flight_id
