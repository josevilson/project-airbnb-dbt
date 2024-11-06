{{ config(materialized='view') }}

WITH int_airbnb_calendar AS (
    SELECT DISTINCT
        listing_id,
        CAST(listing_date_avaliable AS DATE) AS listing_date_avaliable,
        CASE 
            WHEN LOWER(listing_avaliable) = 't' THEN TRUE
            ELSE FALSE
        END AS listing_avaliable,
        COALESCE(CAST(REPLACE(REPLACE(listing_price, '$', ''), ',', '') AS DECIMAL), 0) AS listing_price,
        COALESCE(CAST(listing_minimum_nights as INTEGER), 1) AS listing_minimum_nights,
        COALESCE(CAST(listing_maximum_nights as INTEGER), 1) AS listing_maximum_nights
    FROM {{ ref('stg_airbnb_calendar') }}
    WHERE listing_id IS NOT NULL
)

SELECT * FROM int_airbnb_calendar
