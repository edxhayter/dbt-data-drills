SELECT
    booking_id, 
    flatten.value::int AS flight_id,
    booking_price,
    frequent_flyer_id
FROM {{ ref('src_transform_air__bookings') }},
LATERAL FLATTEN(input => TRY_PARSE_JSON(flight_ids)) flatten
