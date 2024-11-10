{{ config(materialized='table') }}

WITH price_data AS (
    SELECT
        l.listing_id,
        LOWER(l.listing_neighbourhood_name) AS neighborhood,
        c.listing_price
    FROM {{ ref('int_airbnb_listings') }} AS l
    JOIN {{ ref('int_airbnb_calendar') }} AS c
    ON l.listing_id = c.listing_id
)

SELECT 
    neighborhood,

    ROUND(AVG(listing_price),2) AS avg_price,
    COUNT(*) AS total_listings
FROM price_data
GROUP BY neighborhood


/* Esse modelo calculará o preço médio por tipo de propriedade, por bairro e capacidade de pessoas no quarto. */
