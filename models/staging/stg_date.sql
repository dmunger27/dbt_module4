with date as (
    select 
        dateid,
        caldate,
        day,
        week,
        month,
        qtr,
        year,
        case when holiday = TRUE then 1 else 0 end as holiday
    from {{ source('ticketdb', 'date') }}
)

select * from date