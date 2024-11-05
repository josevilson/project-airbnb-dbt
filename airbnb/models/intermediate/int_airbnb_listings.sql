{{ config(materialized='view') }}

WITH int_airbnb_listings AS (
    SELECT DISTINCT
        TRIM(liint_airbnb_listingssting_url) AS listing_url,
        TRY_CAST(scrape_id AS BIGINT) AS scrape_id,
        CAST(last_scraped AS DATE) AS last_scraped,
        LOWER(source) AS source,
        INITCAP(name) AS name,
        TRIM(description) AS description,
        TRIM(neighborhood_overview) AS neighborhood_overview,
        TRIM(picture_url) AS picture_url,
        TRY_CAST(host_id AS BIGINT) AS host_id,
        TRIM(host_url) AS host_url,
        INITCAP(host_name) AS host_name,
        CAST(host_since AS DATE) AS host_since,
        TRIM(host_location) AS host_location,
        TRIM(host_about) AS host_about,
        LOWER(host_response_time) AS host_response_time,
        TRY_CAST(REPLACE(host_response_rate, '%', '') AS INTEGER) AS host_response_rate,
        TRY_CAST(REPLACE(host_acceptance_rate, '%', '') AS INTEGER) AS host_acceptance_rate,
        LOWER(host_is_superhost) = 't' AS host_is_superhost,
        TRIM(host_thumbnail_url) AS host_thumbnail_url,
        TRY_CAST(latitude AS DECIMAL) AS latitude,
        TRY_CAST(longitude AS DECIMAL) AS longitude,
        LOWER(property_type) AS property_type,
        LOWER(room_type) AS room_type,
        TRY_CAST(accommodates AS INTEGER) AS accommodates,
        TRY_CAST(bathrooms AS DECIMAL) AS bathrooms,
        TRY_CAST(REPLACE(price, '$', '') AS DECIMAL) AS price,
        TRY_CAST(availability_365 AS INTEGER) AS availability_365,
        TRY_CAST(review_scores_rating AS DECIMAL) AS review_scores_rating,
        TRY_CAST(reviews_per_month AS DECIMAL) AS reviews_per_month
    FROM {{ ref('stg_airbnb_listings') }}
    WHERE host_id IS NOT NULL
)

SELECT * FROM int_airbnb_listings;
