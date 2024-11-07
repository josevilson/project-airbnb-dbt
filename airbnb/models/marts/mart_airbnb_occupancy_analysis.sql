{{ config(materialized='table') }}

WITH availability_data AS (
    SELECT 
        LOWER(listing_neighbourhood_name) AS listing_neighbourhood_name,
        LOWER(listing_property_type) AS listing_property_type,
        availability_365
    FROM {{ ref('int_airbnb_listings') }}
)

SELECT 
    listing_neighbourhood_name,
    listing_property_type,
    FLOOR(AVG(availability_365)) AS avg_availability,
    COUNT(*) AS total_listings
FROM availability_data
GROUP BY listing_neighbourhood_name, listing_property_type
