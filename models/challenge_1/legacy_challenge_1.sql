WITH bookings AS (
    SELECT
        booking_id,
        flight_id
        booking_price,
        frequent_flyer_id
    FROM raw.booking_sytem.bookings