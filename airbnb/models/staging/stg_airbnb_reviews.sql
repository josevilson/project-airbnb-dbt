with stg_airbnb_reviews as (

    select * from {{source('airbnb', 'raw_airbnb_reviews')}}
)
select * from stg_airbnb_reviews