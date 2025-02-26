WITH bookings_flights AS (
    SELECT
        *
    FROM {{ ref('int__booking_flights') }}
)

SELECT
    -- add a composite key
    YEAR(flight_date)::string || '-' || frequent_flyer_id AS customer_year_id,
    YEAR(flight_date) AS flight_year,
    frequent_flyer_id,

    SUM(mileage) AS annual_mileage,
    COUNT(DISTINCT booking_flight_id) AS annual_flights
FROM bookings_flights
GROUP BY 1, 2, 3