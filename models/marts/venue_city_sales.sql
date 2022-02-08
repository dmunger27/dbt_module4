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

venue_city_sales as (
   SELECT venuecity,
         COUNT(*) AS num_sales
   FROM venue
      INNER JOIN events ON venue.venueid = events.venueid
      INNER JOIN sales ON events.eventid = sales.eventid
   GROUP BY venuecity
   ORDER BY num_sales
)

SELECT *
FROM venue_city_sales