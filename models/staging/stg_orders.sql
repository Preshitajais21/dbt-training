select 
    --from raw_orders
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    o.ordercostprice,
    o.ordersellingprice,
    ordersellingprice-ordercostprice as profit,
    {{ markup('ordersellingprice','ordercostprice') }} as markup,
    --from raw_customers
    c.customerid,
    c.customername,
    c.country,
    c.segment,
    --from raw_products
    p.productid,
    p.category,
    p.productname,
    p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_products') }} as p 
on o.productid = p.productid
{{ limit_data_in_dev('orderdate') }}