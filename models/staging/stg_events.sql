with events as (
    select *,
        extract(date from starttime) as startdate
    from {{ source('ticketdb', 'events') }}
)

select * from events