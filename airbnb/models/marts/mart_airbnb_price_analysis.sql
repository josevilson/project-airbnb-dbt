{{ config(materialized='table') }}

WITH price_data AS (
    SELECT
        l.listing_url,
        LOWER(l.neighborhood_overview) AS neighborhood,
        LOWER(l.property_type) AS property_type,
        c.price,
        c.adjusted_price
    FROM {{ ref('int_airbnb_listings') }} AS l
    JOIN {{ ref('int_airbnb_calendar') }} AS c
    ON l.listing_url = c.listing_id
)

SELECT 
    neighborhood,
    property_type,
    AVG(price) AS avg_price,
    AVG(adjusted_price) AS avg_adjusted_price,
    COUNT(*) AS total_listings
FROM price_data
GROUP BY neighborhood, property_type;


/* Esse modelo calculará o preço médio por tipo de propriedade e por bairro. */