with sales as (
    select *,
        extract(date from saletime) as saledate
    from {{ source('ticketdb', 'sales') }}
)

select * from sales