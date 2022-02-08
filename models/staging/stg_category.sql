with category as (
    select *
    from {{ source('ticketdb', 'category') }}
)

select * from category