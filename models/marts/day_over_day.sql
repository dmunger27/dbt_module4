WITH day_over_day AS (
    SELECT 
        saledate,
        COUNT(*) AS num_sales
    FROM {{ ref('stg_sales') }}
    GROUP BY saledate
    ORDER BY saledate
)

SELECT *
FROM day_over_day
