{{ config(materialized='table') }}

WITH price_data AS (
    SELECT
        l.listing_id,
        LOWER(l.listing_neighbourhood_name) AS neighborhood,
        LOWER(l.listing_property_type) AS property_type,
        c.listing_price
    FROM {{ ref('int_airbnb_listings') }} AS l
    JOIN {{ ref('int_airbnb_calendar') }} AS c
    ON l.listing_id = c.listing_id
)

SELECT 
    neighborhood,
    property_type,
    AVG(listing_price) AS avg_price,
    COUNT(*) AS total_listings
FROM price_data
GROUP BY neighborhood, property_type


/* Esse modelo calculará o preço médio por tipo de propriedade e por bairro. */