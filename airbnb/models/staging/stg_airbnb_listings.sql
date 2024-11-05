with stg_airbnb_listings as (

    select * from {{source('airbnb', 'raw_airbnb_listings')}}
), 

final as (
select 
    id as listing_id,

    name as listing_title,
    description as listing_description,
    neighborhood_overview as neighborhood_overview,
    picture_url as listing_picture_url,
    host_id as host_id,
    host_name as host_name,
    host_since as host_since_date,
    host_location as host_location,
    host_about as host_about,
    host_response_time as host_response_time,
    host_response_rate as host_response_rate_percent,
    host_acceptance_rate as host_acceptance_rate_percent,
    {{ string_to_boolean('host_is_superhost') }} as host_is_superhost_boolean,

    host_listings_count as host_listings_count,
    host_total_listings_count as host_total_listings_count,

    neighbourhood_cleansed as listing_neighbourhood_name,

   
    property_type as listing_property_type,
    room_type as listing_room_type,
    accommodates as listing_accommodates_amount,
    bathrooms as listing_bathrooms_amount,
    bathrooms_text as listing_bathrooms_text,
    bedrooms as listing_bedrooms_amount,
    beds as listing_beds_amount,
    amenities as listing_amenities,
    price as listing_price,



    minimum_nights as minimum_nights,
    maximum_nights as maximum_nights,
    minimum_minimum_nights as minimum_minimum_nights,
    maximum_minimum_nights as maximum_minimum_nights,
    minimum_maximum_nights as minimum_maximum_nights,
    maximum_maximum_nights as maximum_maximum_nights,
    minimum_nights_avg_ntm as minimum_nights_avg_ntm,
    maximum_nights_avg_ntm as maximum_nights_avg_ntm,
    calendar_updated as calendar_updated,
    has_availability as has_availability,
    availability_30 as availability_30,
    availability_60 as availability_60,
    availability_90 as availability_90,
    availability_365 as availability_365,
    calendar_last_scraped as calendar_last_scraped,
    number_of_reviews as number_of_reviews,
    number_of_reviews_ltm as number_of_reviews_ltm,
    number_of_reviews_l30d as number_of_reviews_l30d,
    first_review as first_review,
    last_review as last_review,
    review_scores_rating as review_scores_rating,
    review_scores_accuracy as review_scores_accuracy,
    review_scores_cleanliness as review_scores_cleanliness,
    review_scores_checkin as review_scores_checkin,
    review_scores_communication as review_scores_communication,
    review_scores_location as review_scores_location,
    review_scores_value as review_scores_value,
    license as license,
    instant_bookable as instant_bookable,
    calculated_host_listings_count as calculated_host_listings_count,
    calculated_host_listings_count_entire_homes as calculated_host_listings_count_entire_homes,
    calculated_host_listings_count_private_rooms as calculated_host_listings_count_private_rooms,
    calculated_host_listings_count_shared_rooms as calculated_host_listings_count_shared_rooms,
    reviews_per_month as reviews_per_month

    from stg_airbnb_listings

)
select * from final

-- Colunas não consideradas
-- scrape_id,
-- last_scraped,
-- source,
-- listing_url,
-- host_url
-- host_thumbnail_url,
-- host_picture_url,
--  host_neighbourhood
--  host_verifications
--  host_has_profile_pic,
--  host_identity_verified,
 -- neighbourhood_group_cleansed


-- latitude,
-- longitude,