WITH orders_margin AS (
    SELECT *
    FROM {{ ref('int_sales_margin') }}
),
shipping AS (
    SELECT *
    FROM {{ ref('stg_raw__ship') }}
)
SELECT
    orders_margin.orders_id,
    orders_margin.date_date,
    orders_margin.margin,
    shipping.shipping_fee,
    CAST(shipping.ship_cost AS FLOAT64) AS ship_cost,
    CAST(shipping.logcost AS FLOAT64) AS logcost,
    CAST(
        orders_margin.margin + shipping.shipping_fee - shipping.logcost - shipping.ship_cost
        AS FLOAT64
    ) AS operational_margin
FROM
    orders_margin
LEFT JOIN
    shipping
ON   orders_margin.orders_id = shipping.orders_id
