{{ config(materialized='table') }}

WITH availability_and_price AS (
    SELECT 
        listing_id,
        listing_date_avaliable,
        listing_avaliable,
        listing_price
    FROM {{ ref('int_airbnb_calendar') }}
)

, availability_summary AS (
    SELECT
        listing_id,
        COUNT(*) AS total_days,  -- total de dias para a propriedade
        SUM(CASE WHEN listing_avaliable = TRUE THEN 1 ELSE 0 END) AS available_days,  -- dias disponíveis
        SUM(CASE WHEN listing_avaliable = FALSE THEN 1 ELSE 0 END) AS unavailable_days  -- dias indisponíveis
    FROM availability_and_price
    GROUP BY listing_id
)

, price_summary AS (
    SELECT 
        listing_id,
        AVG(listing_price) AS avg_price
    FROM availability_and_price
    GROUP BY listing_id
)

SELECT 
    a.listing_id,
    a.available_days,
    a.unavailable_days,
    p.avg_price,
    -- Calculando a relação entre preço e disponibilidade
    CASE 
        WHEN a.unavailable_days > a.available_days THEN 'Low Availability (High Price)' 
        WHEN a.unavailable_days < a.available_days THEN 'High Availability (Low Price)'
        ELSE 'Balanced Availability and Price'
    END AS price_availability_trend
FROM availability_summary a
JOIN price_summary p ON a.listing_id = p.listing_id
ORDER BY price_availability_trend
