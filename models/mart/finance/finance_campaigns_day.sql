with table1 as (
    select 
        f.date_date,  -- On garde uniquement la date de finance_days
        f.operational_margin,
        f.total_log_costs,
        f.margin,
        c.total_ads_cost
    from {{ ref('finance_days') }} as f
    left join {{ ref('int_campaigns_day') }} as c
    on f.date_date = c.date_date
)

select
    date_trunc(date_date, MONTH) AS date_date,   -- Ici, on prend directement la colonne de table1
    sum(total_ads_cost) as total_ads_cost,
    sum(operational_margin) as total_operational_margin,
    sum(margin) as total_ads_margin
from table1
group by date_date
order by date_date