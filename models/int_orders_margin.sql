select*


from {{ ref('int_sales_margin') }}
GROUP BY date_date
