{{ config(materialized='table') }}

WITH price_data AS (
    SELECT
        listing_id,
        listing_neighbourhood_name AS neighborhood,
        listing_price
    FROM {{ ref('int_airbnb_listings') }} 
)

SELECT
    neighborhood,
    AVG(listing_price) AS avg_price,
    COUNT(*) AS total_listings
FROM price_data
GROUP BY neighborhood


/* Esse modelo calculará o preço médio por tipo de propriedade, por bairro e capacidade de pessoas no quarto. */
