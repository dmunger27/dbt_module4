WITH sales AS (
   SELECT * 
   FROM {{ ref('stg_sales') }}
),

seller as (
    SELECT sellerid,
        saletime,
        eventid,
        qtysold
    FROM sales
),

buyer as (
    SELECT buyerid,
        saletime,
        eventid
    FROM sales
),

resellers as (
    SELECT buyerid,
        qtysold
    FROM seller s
    JOIN buyer b ON s.sellerid = b.buyerid
    AND b.eventid = s.eventid
    AND s.saletime > b.saletime
)

SELECT *
FROM resellers


