WITH listing AS (
   SELECT *
   FROM {{ ref('stg_listings') }}
),

events AS (
   SELECT *
   FROM {{ ref('stg_events') }}
),

sales AS (
   SELECT *
   FROM {{ ref('stg_sales') }}
),

percent_sold AS (
     SELECT eventname,
          sold_tickets/listed_tickets as sale_percent
     FROM(
       SELECT eventname,
            SUM(numtickets) as listed_tickets,
            SUM(qtysold) as sold_tickets
       FROM events
            INNER JOIN listing ON events.eventid = listing.eventid
            INNER JOIN sales ON listing.eventid = sales.eventid
       GROUP BY sales.eventid, eventname
     ) 
     ORDER BY sale_percent DESC
)

SELECT *
FROM percent_sold