{{ config(materialized='view') }}

WITH int_airbnb_listings AS (
    SELECT DISTINCT
        TRIM(listing_id) AS listing_id,
        INITCAP(listing_title) AS listing_title,
        TRIM(listing_description) AS listing_description,
        TRIM(listing_neighbourhood_name) AS listing_neighbourhood_name,
        TRIM(neighborhood_overview) AS neighborhood_overview,
        TRIM(listing_picture_url) AS listing_picture_url,
        CAST(host_id AS BIGINT) AS host_id,
        INITCAP(host_name) AS host_name,
        CAST(host_since_date AS DATE) AS host_since_date,
        TRIM(host_location) AS host_location,
        TRIM(host_about) AS host_about,
        LOWER(host_response_time) AS host_response_time,
        CAST(REPLACE(host_response_rate_percent, '%', '') AS INTEGER) AS host_response_rate_percent,
        CAST(REPLACE(host_acceptance_rate_percent, '%', '') AS INTEGER) AS host_acceptance_rate_percent,
        host_is_superhost_boolean,
        LOWER(listing_property_type) AS listing_property_type,
        LOWER(listing_room_type) AS listing_room_type,
        CAST(listing_accommodates_amount AS INTEGER) AS listing_accommodates_amount,
        CAST(listing_bathrooms_amount AS DECIMAL) AS listing_bathrooms_amount,
        CAST(listing_beds_amount AS DECIMAL) AS listing_beds_amount,
        COALESCE(CAST(REPLACE(REPLACE(listing_price, '$', ''), ',', '') AS DECIMAL), 0) AS listing_price,
        CAST(availability_365 AS INTEGER) AS availability_365,
        CAST(review_scores_rating AS DECIMAL) AS review_scores_rating,
        CAST(reviews_per_month AS DECIMAL) AS reviews_per_month
    FROM {{ ref('stg_airbnb_listings') }}
    WHERE host_id IS NOT NULL
)

SELECT * FROM int_airbnb_listings
