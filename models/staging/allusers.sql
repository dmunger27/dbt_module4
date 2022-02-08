with users as (
    select 
        userid,
        username,
        firstname,
        lastname,
        city,
        state,
        email,
        phone,
        case when likesports = 'TRUE' then 1 else 0 end as likesports,
        case when liketheatre = 'TRUE' then 1 else 0 end as liketheatre,
        case when likeconcerts = 'TRUE' then 1 else 0 end as likeconcerts,
        case when likejazz = 'TRUE' then 1 else 0 end as likejazz,
        case when likeclassical = 'TRUE' then 1 else 0 end as likeclassical,
        case when likeopera = 'TRUE' then 1 else 0 end as likeopera,
        case when likerock = 'TRUE' then 1 else 0 end as likerock,
        case when likevegas = 'TRUE' then 1 else 0 end as likevegas,
        case when likebroadway = 'TRUE' then 1 else 0 end as likebroadway,
        case when likemusicals = 'TRUE' then 1 else 0 end as likemusicals
    from `assignment4-340620.ticketdb.users`
)

select * from users