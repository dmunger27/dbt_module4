 WITH sales AS (
   SELECT * 
   FROM {{ ref('stg_sales') }}
),

date AS (
   SELECT * 
   FROM {{ ref('stg_date') }} 
),

holiday_sales as (
    SELECT saledate,
        SUM(qtysold) as total_sold
    FROM sales
    JOIN date ON sales.dateid = date.dateid
    WHERE holiday = 1
    GROUP BY saledate
)

SELECT *
FROM holiday_sales