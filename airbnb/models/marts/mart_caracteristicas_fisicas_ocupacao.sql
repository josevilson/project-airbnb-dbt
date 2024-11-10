WITH amenities_data AS (
    SELECT
        a.listing_room_type,
        a.listing_beds_amount,
        a.listing_bathrooms_amount,
        a.listing_accommodates_amount,
        AVG(CASE WHEN c.listing_avaliable = 't' THEN 1 ELSE 0 END) AS occupancy_rate
    FROM
        {{ ref('int_airbnb_listings') }} a
    LEFT JOIN
        {{ ref('int_airbnb_calendar') }} c ON a.listing_id = c.listing_id

    GROUP BY
        a.listing_room_type,
        a.listing_beds_amount,
        a.listing_bathrooms_amount,
        a.listing_accommodates_amount
)

SELECT
    listing_room_type,
    listing_beds_amount,
    listing_bathrooms_amount,
    listing_accommodates_amount,
    occupancy_rate
FROM
    amenities_data
ORDER BY
    occupancy_rate DESC