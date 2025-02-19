select
date_date,
SUM(ads_cost) AS total_ads_cost,
SUM(impression) AS total_impression,
SUM(click) AS total_click
from {{ ref('int_campaigns') }}
GROUP BY date_date
