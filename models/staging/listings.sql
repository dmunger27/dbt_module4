with listings as (
    select *,
        extract(date from listtime) as listdate
    from `assignment4-340620.ticketdb.listings`
)

select * from listings