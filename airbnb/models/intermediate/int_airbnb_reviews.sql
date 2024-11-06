{{ config(materialized='view') }}

WITH int_airbnb_reviews AS (
    SELECT DISTINCT
        listing_id,
        CAST(id AS BIGINT) AS review_id,
        CAST(date AS DATE) AS review_date,
        CAST(reviewer_id AS BIGINT) AS reviewer_id,
        INITCAP(reviewer_name) AS reviewer_name,
        TRIM(REPLACE(REPLACE(comments, CHR(10), ' '), CHR(13), ' ')) AS comments
    FROM {{ ref('stg_airbnb_reviews') }}
    WHERE listing_id IS NOT NULL
)

SELECT * FROM int_airbnb_reviews
