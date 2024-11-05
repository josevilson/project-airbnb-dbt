{{ config(materialized='view') }}

WITH int_airbnb_reviews AS (
    SELECT DISTINCT
        TRY_CAST(listing_id AS INTEGER) AS listing_id,
        TRY_CAST(id AS BIGINT) AS review_id,
        CAST(date AS DATE) AS review_date,
        TRY_CAST(reviewer_id AS BIGINT) AS reviewer_id,
        INITCAP(reviewer_name) AS reviewer_name,
        TRIM(REPLACE(REPLACE(comments, CHAR(10), ' '), CHAR(13), ' ')) AS comments
    FROM {{ ref('stg_airbnb_reviews') }}
    WHERE listing_id IS NOT NULL
)

SELECT * FROM int_airbnb_reviews;
