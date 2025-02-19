select
date_date,
COUNT(orders_id) AS nb_transactions,

ROUND(SUM(margin),1) AS margin,
ROUND(SUM(operational_margin),1) AS operational_margin,
ROUND(SUM(ship_cost),1) AS total_purchase_cost,
ROUND(SUM(shipping_fee),1) AS total_shipping_fees,
ROUND(SUM(logcost),1) AS total_log_costs,
FROM {{ ref('int_orders_margin') }}
GROUP BY date_date
ORDER BY date_date