WITH sales AS (
   SELECT * 
   FROM {{ ref('stg_sales') }}
),

listing AS (
   SELECT * 
   FROM {{ ref('stg_listings') }} 
),

event AS (
   SELECT * 
   FROM {{ ref('stg_events') }}
),

ticket_price as (
    SELECT sales.listid,
        eventname,
        sales.sellerid,
        buyerid, 
        pricepaid/qtysold as avg_price_paid,
        saletime,
        pricepaid
    FROM event
    JOIN listing ON event.eventid = listing.eventid
    JOIN sales ON listing.listid = sales.listid
    ORDER BY avg_price_paid
)

SELECT *
FROM ticket_price