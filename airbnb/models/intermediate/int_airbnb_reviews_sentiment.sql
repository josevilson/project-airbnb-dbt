WITH sentiment_classification AS (
    SELECT *
    FROM {{ ref('stg_airbnb_reviews_sentiment') }}
),

sentiment_summary AS (
    SELECT 
        listing_id,
        SUM(sentimento_positivo) AS sentimento_positivo,
        SUM(sentimento_negativo) AS sentimento_negativo,
        SUM(sentimento_erro) AS sentimento_erro,
        SUM(sentimento_classificado) AS sentimento_positivo_neutral,
        SUM(sentimento_classificado) + sum(sentimento_negativo) as comentarios_total
    FROM sentiment_classification
    GROUP BY listing_id
),

distinct_listings AS (
    SELECT DISTINCT listing_id, lower(listing_neighbourhood_name) as listing_neighbourhood_name
    FROM {{ ref('int_airbnb_listings') }}
)

SELECT 
    dl.listing_id,
    dl.listing_neighbourhood_name,
    ss.sentimento_positivo,
    ss.sentimento_negativo,
    ss.sentimento_erro,
    ss.sentimento_positivo_neutral,
    ss.comentarios_total
FROM distinct_listings AS dl
JOIN sentiment_summary AS ss
ON dl.listing_id = ss.listing_id
