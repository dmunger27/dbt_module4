WITH sales AS (
   SELECT * 
   FROM {{ ref('stg_sales') }} 
),

wait AS (
 SELECT buyerid,
        saletime,
        LAG(saletime, 1) OVER (PARTITION BY buyerid ORDER BY saletime) as prev_saletime,
        ROW_NUMBER() OVER (PARTITION BY buyerid ORDER BY saletime) as purchase_num
 FROM sales
),

time_between_purchases as (
   SELECT buyerid, 
         purchase_num,
         saletime,
         prev_saletime,
         saletime - prev_saletime as wait_time
   FROM wait
   WHERE saletime - prev_saletime IS NOT NULL
   ORDER BY buyerid
)

SELECT *
FROM time_between_purchases