WITH customers AS (
    SELECT
        *
    FROM {{ ref('int__customer') }}
),

mileage_by_year AS (
    SELECT
        *
    FROM {{ ref('int__annual_customer_mileage') }}
),

spend_by_year AS (
    SELECT
        *
    FROM {{ ref('int__annual_booking_spend') }}
),

-- Table from which calculations can be made
data_merge AS (
    SELECT
        mileage_by_year.customer_year_id,
        mileage_by_year.annual_mileage,
        mileage_by_year.annual_flights,
        mileage_by_year.flight_year,

        spend_by_year.annual_spend,

        customers.customer_id,
        customers.frequent_flyer_id
    FROM mileage_by_year
    LEFT JOIN spend_by_year ON mileage_by_year.customer_year_id = spend_by_year.customer_year_id
    LEFT JOIN customers ON mileage_by_year.frequent_flyer_id = customers.frequent_flyer_id
),

loyalty_logic AS (
    SELECT
        frequent_flyer_id,
        customer_id,
        flight_year AS loyalty_year,
        annual_mileage AS total_mileage,
        annual_spend AS total_loyalty_spend,
        annual_flights AS total_flights,
        CASE
        WHEN annual_mileage >= 10000 AND annual_spend >= 5000 AND annual_flights >= 5 THEN 'Platinum'
        WHEN annual_mileage >= 5000 AND annual_spend >= 3000 AND annual_flights >= 3 THEN 'Gold'
        WHEN annual_mileage >= 1000 AND annual_spend >= 1000 AND annual_flights >= 1 THEN 'Silver'
        ELSE 'Bronze'
        END AS current_status
    FROM data_merge
)

SELECT * FROM loyalty_logic
ORDER BY 2 ASC

