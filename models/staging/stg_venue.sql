with venue as (
    select *
    from {{ source('ticketdb', 'venue') }}
)

select * from venue