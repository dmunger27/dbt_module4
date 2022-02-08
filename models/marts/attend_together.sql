WITH events AS (
   SELECT * 
   FROM {{ ref('stg_events') }} 
),

sales AS (
   SELECT * 
   FROM {{ ref('stg_sales') }}
),

coattendees as (
    SELECT *
    FROM(
        SELECT COUNT(*) as coattendee,
            buyerid_one,
            buyerid_two
        FROM(
            SELECT DISTINCT one.eventid as eventid_one,
                    one.buyerid as buyerid_one,
                    two.buyerid as buyerid_two
            FROM sales one
            INNER JOIN sales two ON one.eventid = two.eventid
            WHERE one.buyerid <> two.buyerid
        )
        GROUP BY buyerid_one, buyerid_two
        ORDER BY COUNT(*)
    )
    WHERE coattendee >= 3
)

SELECT * FROM coattendees