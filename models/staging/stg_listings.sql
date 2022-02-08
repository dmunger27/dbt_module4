with listings as (
    select *,
        extract(date from listtime) as listdate
    from {{ source('ticketdb', 'listings') }}
)

select * from listings