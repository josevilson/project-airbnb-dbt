{{ config(materialized='table') }}

WITH review_data AS (
    SELECT 
        l.host_id,
        LOWER(l.listing_neighbourhood_name) AS neighborhood,
        l.listing_id,
        l.review_scores_rating,
        r.review_id,
        l.host_is_superhost_boolean
    FROM {{ ref('int_airbnb_listings') }} AS l
    JOIN {{ ref('int_airbnb_reviews') }} AS r 
    ON l.listing_id = r.listing_id
)

SELECT 
    host_id,
    neighborhood,
    listing_id,
    AVG(review_scores_rating) AS avg_review_score,
    COUNT(review_id) AS total_reviews,
    COALESCE(SUM(CASE WHEN host_is_superhost_boolean THEN 1 ELSE 0 END) * 1.0 / COUNT(review_id), 0) AS superhost_rate
FROM review_data
GROUP BY host_id, neighborhood, listing_id
