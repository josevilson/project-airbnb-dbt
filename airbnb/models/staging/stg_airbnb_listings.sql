with stg_airbnb_listings as (

    select * from {{source('airbnb', 'raw_airbnb_listings')}}
)

select * from stg_airbnb_listings