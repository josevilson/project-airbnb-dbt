{{ config(materialized='table') }}

WITH price_data AS (
    SELECT
        l.listing_id,
        LOWER(l.neighborhood_overview) AS neighborhood,
        LOWER(l.listing_property_type) AS property_type,
        l.listing_accommodates_amount as accommodates_amount,
        c.listing_price
    FROM {{ ref('int_airbnb_listings') }} AS l
    JOIN {{ ref('int_airbnb_calendar') }} AS c
    ON l.listing_id = c.listing_id
)

SELECT 
    neighborhood,
    property_type,
    accommodates_amount,
    ROUND(AVG(listing_price),2) AS avg_price,
    COUNT(*) AS total_listings
FROM price_data
GROUP BY neighborhood, property_type,accommodates_amount


/* Esse modelo calculará o preço médio por tipo de propriedade, por bairro e capacidade de pessoas no quarto. */
