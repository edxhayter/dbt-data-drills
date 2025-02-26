SELECT 
    booking_id, 
    -- flight_ids an array of flights in a booking
    flight_ids,
    booking_price,
    frequent_flyer_id
FROM {{ source('transform_air', 'bookings') }}