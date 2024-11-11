WITH neighborhood_data AS (
    SELECT
        a.listing_neighbourhood_name,
        COUNT(c.listing_id) AS total_listings,
        AVG(a.listing_price) AS avg_price,
        SUM(CASE WHEN c.listing_avaliable = 1 THEN 1 ELSE 0 END) / COUNT(a.listing_id) AS occupancy_rate
    FROM
        {{ ref('int_airbnb_listings') }} a
    LEFT JOIN
        {{ ref('int_airbnb_calendar') }} c ON a.listing_id = c.listing_id
    GROUP BY
        a.listing_neighbourhood_name
)

SELECT 
    listing_neighbourhood_name,
    total_listings,
    avg_price,
    occupancy_rate
FROM
    neighborhood_data
ORDER BY
    occupancy_rate DESC
