WITH sales AS (
   SELECT * 
   FROM {{ ref('stg_sales') }}
),

commission_structure AS (
    SELECT commission/pricepaid as commission_percent,
        pricepaid,
        commission,
        salesid,
        listid,
        sellerid,
        buyerid,
        eventid
    FROM sales
)

SELECT * 
FROM commission_structure