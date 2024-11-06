{{ config(materialized='table') }}

WITH availability_data AS (
    SELECT 
        LOWER(neighborhood_overview) AS neighborhood,
        LOWER(property_type) AS property_type,
        availability_365
    FROM {{ ref('int_airbnb_listings') }}
)

SELECT 
    neighborhood,
    property_type,
    AVG(availability_365) AS avg_availability,
    COUNT(*) AS total_listings
FROM availability_data
GROUP BY neighborhood, property_type;
