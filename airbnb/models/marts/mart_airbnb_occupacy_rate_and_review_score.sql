{{ config(materialized='table') }}

WITH review_data AS (
    SELECT 
        l.listing_id,
        l.listing_neighbourhood_name,
        l.listing_property_type,
        AVG(l.review_scores_rating) AS avg_review_score,
        COUNT(r.review_id) AS total_reviews
    FROM {{ ref('int_airbnb_listings') }} AS l
    JOIN {{ ref('int_airbnb_reviews') }} AS r 
        ON l.listing_id = r.listing_id
    GROUP BY l.listing_id, l.listing_neighbourhood_name, l.listing_property_type
)

, calendar_data AS (
    SELECT 
        c.listing_id,
        COUNT(*) AS total_days,
        SUM(CASE WHEN c.listing_avaliable THEN 1 ELSE 0 END) AS available_days,
        SUM(CASE WHEN NOT c.listing_avaliable THEN 1 ELSE 0 END) AS unavailable_days
    FROM {{ ref('int_airbnb_calendar') }} AS c
    GROUP BY c.listing_id
)

, combined_data AS (
    SELECT 
        r.listing_id,
        r.listing_neighbourhood_name,
        r.listing_property_type,
        r.avg_review_score,
        r.total_reviews,
        c.total_days,
        c.available_days,
        c.unavailable_days
    FROM review_data r
    JOIN calendar_data c
        ON r.listing_id = c.listing_id
)

SELECT 
    listing_neighbourhood_name,
    listing_property_type,
    AVG(avg_review_score) AS avg_review_score,
    SUM(available_days) * 1.0 / SUM(total_days) AS occupancy_rate,  -- Taxa de ocupação
    COUNT(total_reviews) AS total_reviews
FROM combined_data
GROUP BY listing_neighbourhood_name, listing_property_type
ORDER BY occupancy_rate DESC, avg_review_score DESC


/* Correlação entre taxa de ocupação e avaliação média das propriedades */