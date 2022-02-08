WITH unique_buyers AS (
  SELECT 
    saledate, 
    unique_buyers, 
    num_sales
  FROM(
    SELECT saledate,
       COUNT(DISTINCT buyerid) AS unique_buyers,
       COUNT(*) AS num_sales
    FROM {{ ref('stg_sales') }}
    GROUP BY saledate
    ORDER BY saledate
  )
)

SELECT *
FROM unique_buyers