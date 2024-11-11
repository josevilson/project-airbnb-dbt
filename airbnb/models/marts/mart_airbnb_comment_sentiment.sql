WITH sentiment_agg_by_classification AS (
    SELECT 
        listing_neighbourhood_name,
        SUM(sentimento_positivo) AS comentarios_positivos,
        SUM(sentimento_negativo) AS comentarios_negativos,
        SUM(sentimento_positivo_neutral) AS comentarios_positivo_neutral,
        SUM(comentarios_total) AS comentarios_total,
        SUM(sentimento_positivo_neutral) / NULLIF(SUM(comentarios_total), 0) AS taxa_comentarios_positivos,
        SUM(sentimento_negativo) / NULLIF(SUM(comentarios_total), 0) AS taxa_comentarios_negativos
    FROM {{ ref('int_airbnb_reviews_sentiment') }}
    GROUP BY listing_neighbourhood_name
)

SELECT * 
FROM sentiment_agg_by_classification
