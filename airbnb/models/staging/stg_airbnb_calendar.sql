with stg_airbnb_calendar as (

    select *

    from 

    {{source('airbnb', 'raw_airbnb_calendar')}}
), final as (
    select 
    
    listing_id as listing_id, 
    date as listing_date_avaliable, 
    price as listing_price,
    available as listing_avaliable,
    minimum_nights as listing_minimum_nights,
    maximum_nights as listing_maximum_nights

    from 

    stg_airbnb_calendar
)

select * from final