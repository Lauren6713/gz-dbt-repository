select
    s.date_date,
    s.orders_id,
    p.products_id,
    CAST(s.revenue AS FLOAT64) AS revenue,
    CAST(s.quantity AS INT64) AS quantity,
    CAST(p.purchse_price AS FLOAT64) AS purchse_price,
    SUM(CAST(s.revenue AS FLOAT64)) - SUM(CAST(s.quantity AS INT64)) * SUM(CAST(p.purchse_price AS FLOAT64)) AS margin
from
    {{ source('raw', 'sales') }} s
join
    {{ source('raw', 'product') }} p
    on s.pdt_id = p.products_id
group by
    s.date_date,
    s.orders_id,
    p.products_id,
    s.revenue,
    s.quantity,
    p.purchse_price








