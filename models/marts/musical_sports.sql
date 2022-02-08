WITH users AS (
   SELECT *
   FROM {{ ref('stg_allusers') }}
),

events AS (
   SELECT *
   FROM {{ ref('stg_events') }}
),

category AS (
   SELECT *
   FROM {{ ref('stg_category') }}
),

sales AS (
   SELECT *
   FROM {{ ref('stg_sales') }}
),

musical_sports AS (
    SELECT DISTINCT userid,
        likesports,
        catname
    FROM category
        INNER JOIN events ON category.catid = events.catid
        INNER JOIN sales ON events.eventid = sales.eventid
        INNER JOIN users ON sales.buyerid = users.userid
    WHERE likesports = 1 AND catname = 'Musicals'
)

SELECT *
FROM musical_sports
ORDER BY userid



