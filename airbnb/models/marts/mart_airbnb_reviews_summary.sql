{{ config(materialized='table') }}

WITH review_data AS (
    SELECT 
        l.host_id,
        LOWER(l.neighborhood_overview) AS neighborhood,
        l.listing_url AS listing_id,
        r.review_scores_rating,
        r.review_id,
        l.host_is_superhost
    FROM {{ ref('int_airbnb_listings') }} AS l
    JOIN {{ ref('int_airbnb_reviews') }} AS r 
    ON l.listing_url = r.listing_id
)

SELECT 
    host_id,
    neighborhood,
    listing_id,
    AVG(review_scores_rating) AS avg_review_score,
    COUNT(review_id) AS total_reviews,
    SUM(CASE WHEN host_is_superhost THEN 1 ELSE 0 END) / COUNT(DISTINCT host_id) AS superhost_rate
FROM review_data
GROUP BY host_id, neighborhood, listing_id;
