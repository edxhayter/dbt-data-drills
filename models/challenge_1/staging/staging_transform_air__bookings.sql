SELECT
    -- add a composite key for the table
    booking_id || '-' || flight_id AS booking_flight_id,
    booking_id,
    flight_id,
    booking_price,
    frequent_flyer_id
FROM {{ ref('base_transform_air__bookings') }}