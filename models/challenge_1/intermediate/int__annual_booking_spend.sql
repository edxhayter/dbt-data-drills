WITH booking_spend AS(
    SELECT
        *
    FROM {{ ref('int__booking_spend') }}
)

SELECT
    -- add composite key
    YEAR(charge_date)::string || '-' || frequent_flyer_id AS customer_year_id,
    YEAR(charge_date) AS loyalty_year,
    frequent_flyer_id,

    SUM(booking_spend) AS annual_spend

FROM booking_spend
GROUP BY 1, 2, 3