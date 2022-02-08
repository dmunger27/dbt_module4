WITH ticket_sales AS (
 SELECT saledate,
        num_sales,
        0.25 * AVG(num_sales) OVER() AS lower_limit
 FROM(
  SELECT 
    saledate,
    COUNT(*) AS num_sales
  FROM {{ ref('stg_sales') }}
  GROUP BY saledate
 )
)

SELECT * 
FROM ticket_sales
ORDER BY num_sales


