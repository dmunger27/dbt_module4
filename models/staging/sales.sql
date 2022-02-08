with sales as (
    select *,
        extract(date from saletime) as saledate
    from `assignment4-340620.ticketdb.sales`
)

select * from sales