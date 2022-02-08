with events as (
    select *,
        extract(date from starttime) as startdate
    from `assignment4-340620.ticketdb.events`
)

select * from events