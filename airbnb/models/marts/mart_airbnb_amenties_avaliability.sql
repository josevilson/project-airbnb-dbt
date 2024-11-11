{{ config(materialized='table') }}
WITH amenities_data AS (
    SELECT
        listing_neighbourhood_name as listing_neighbourhood_name,
        listing_room_type as listing_room_type,
        avg(listing_beds_amount) as avg_listing_beds_amount, 
        avg(listing_bathrooms_amount) as avg_listing_bathrooms_amount,
        avg(listing_accommodates_amount) as avg_listing_accommodates_amount,
        avg(availability_365) as avg_availability_365
    FROM
        {{ ref('int_airbnb_listings') }}

    GROUP BY
        listing_neighbourhood_name,
        listing_room_type
)

SELECT
    *
FROM
    amenities_data
