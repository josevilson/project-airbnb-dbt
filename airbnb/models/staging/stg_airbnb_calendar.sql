with stg_airbnb_calendar as (

    select *

    from 

    {{source('airbnb', 'raw_airbnb_calendar')}}
), final as (
    select 
    
    listing_id as listing_id, 
    date as date_avaliable, 
    available as listing_avaliable,
    minimum_nights as minimum_nights,
    maximum_nights as maximum_nights

    from 

    stg_airbnb_calendar
)

select * from final