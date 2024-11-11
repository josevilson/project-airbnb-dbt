{{ config(materialized='table') }}

WITH calendar_data AS (
    SELECT 
        listing_id,
        EXTRACT(YEAR FROM listing_date_avaliable) AS year,
        EXTRACT(MONTH FROM listing_date_avaliable) AS month,
        listing_avaliable
    FROM {{ ref('int_airbnb_calendar') }}
)

, monthly_occupancy AS (
    SELECT
        year,
        month,
        listing_id,
        COUNT(*) AS total_days, 
        SUM(CASE WHEN listing_avaliable = FALSE THEN 1 ELSE 0 END) AS occupied_days  -- conta apenas os dias ocupados
    FROM calendar_data
    GROUP BY year, month, listing_id
)

SELECT
    year,
    month,
    AVG(CAST(occupied_days AS FLOAT64) / total_days) * 100 AS avg_occupancy_rate  -- calcula a taxa média de ocupação
FROM monthly_occupancy
GROUP BY year, month
ORDER BY year, month
