WITH listing AS (
   SELECT * 
   FROM {{ ref('stg_listings') }}
),

sales AS (
   SELECT * 
   FROM {{ ref('stg_sales') }} 
),

diff_time AS (
    SELECT listid,
           listtime,
           saletime,
           total_listed-total_sold as diff
    FROM(              
        SELECT listing.listid as listid,
                listtime,
                saletime,
                SUM(numtickets) as total_listed,
                SUM(qtysold) as total_sold
        FROM listing
        INNER JOIN sales ON listing.listid = sales.listid
        GROUP BY listing.listid, listtime, saletime
    )
    WHERE total_listed-total_sold = 0
),

time_to_sell_out as (
    SELECT listid,
        saletime-listtime as date_diff
    FROM diff_time
    ORDER BY date_diff DESC
)

SELECT *
FROM time_to_sell_out