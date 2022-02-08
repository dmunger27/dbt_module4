WITH venue AS (
   SELECT *
   FROM {{ ref('stg_venue') }}
),

events AS (
   SELECT *
   FROM {{ ref('stg_events') }}
),

sales AS (
   SELECT *
   FROM {{ ref('stg_sales') }}
),

event_sales AS (
 SELECT eventname,
        venuecity,
        COUNT(*) as num_sales
 FROM venue
    INNER JOIN events ON venue.venueid = events.venueid
    INNER JOIN sales ON events.eventid = sales.eventid
 GROUP BY venuecity, eventname
),

max_sales AS (
   SELECT MAX(num_sales) as top_sales,
          venuecity
   FROM event_sales
   GROUP BY venuecity
),

highest_city_sales AS (
   SELECT eventname,
         max_sales.venuecity,
         top_sales
   FROM max_sales
   INNER JOIN event_sales ON (event_sales.venuecity = max_sales.venuecity AND event_sales.num_sales = max_sales.top_sales)
)

SELECT * 
FROM highest_city_sales