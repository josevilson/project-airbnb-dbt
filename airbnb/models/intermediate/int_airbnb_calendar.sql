{{ config(materialized='view') }}

WITH int_airbnb_calendar AS (
    SELECT DISTINCT
        CAST(listing_id AS INTEGER) AS listing_id,
        CAST(date AS DATE) AS date,
        CASE 
            WHEN LOWER(available) = 't' THEN TRUE
            ELSE FALSE
        END AS available,
        COALESCE(TRY_CAST(REPLACE(price, '$', '') AS DECIMAL), 0) AS price,
        COALESCE(TRY_CAST(minimum_nights AS INTEGER), 1) AS minimum_nights,
        COALESCE(TRY_CAST(maximum_nights AS INTEGER), 1) AS maximum_nights
    FROM {{ ref('stg_airbnb_calendar') }}
    WHERE listing_id IS NOT NULL
)

SELECT * FROM int_airbnb_calendar;
