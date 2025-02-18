select
date_date,
ROUND(SUM (revenue)) AS total_revenue,
SUM(quantity) AS total_quantity,
ROUND(SUM(margin)) AS total_margin
from {{ ref('int_sales_margin') }}
GROUP BY date_date

