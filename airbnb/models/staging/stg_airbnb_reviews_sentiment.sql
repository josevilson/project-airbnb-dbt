with stg_airbnb_reviews_sentimental as (
    select 
        listing_id as listing_id,
        id as id_comment,
        reviewer_id as reviewer_id,
        CASE 
            WHEN sentimento = 'positiva' THEN 1
            ELSE 0
        END AS sentimento_positivo,
        CASE 
            WHEN sentimento = 'negativa' THEN 1
            ELSE 0
        END AS sentimento_negativo,
        CASE 
            WHEN sentimento IN ('positiva', 'neutra') THEN 1
            ELSE 0
        END AS sentimento_classificado,
        CASE 
            WHEN sentimento = 'erro' THEN 1
            ELSE 0
        END AS sentimento_erro
    from {{source('airbnb', 'raw_airbnb_reviews_sentimental_all')}}
)
select * from stg_airbnb_reviews_sentimental