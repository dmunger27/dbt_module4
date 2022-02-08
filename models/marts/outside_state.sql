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

users AS (
   SELECT * 
   FROM {{ ref('stg_allusers') }}
),

outside_state as (
    SELECT *
    FROM(
        SELECT DISTINCT s.salesid,
            userid,
            u.state,
            v.venuestate
        FROM venue v
        JOIN events e ON v.venueid = e.venueid
        JOIN sales s ON e.eventid = s.eventid
        JOIN users u ON s.buyerid = u.userid
        WHERE u.state <> v.venuestate
    )
)

SELECT *
FROM outside_state