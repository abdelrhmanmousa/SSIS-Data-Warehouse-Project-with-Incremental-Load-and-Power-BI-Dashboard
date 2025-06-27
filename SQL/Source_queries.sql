--** should initiat the variable in SSIS First (MAX_Order_id_BK) to run the conditoin where =?**
-- For Data flow 1 Fact (all thing without ADDs)
SELECT 
    od.order_id,
    od.product_id,
    o.customer_id,
    o.employee_id,
    o.ship_via as shipper_id,
    o.ship_name,
    p.supplier_id,
	o.Return_date,
	o.Delivery_date,
	o.required_date,
    o.order_date,
 o.shipped_date,
	o.freight,
	o.Shipping,
	o.IsReturned,
	o.Delivery,
    od.quantity,
    p.unit_price,
	od.order_price,
   od.total_amount,
    od.discount
FROM Order_Details od
 JOIN Orders o ON od.order_id = o.order_id
 JOIN Products p ON od.product_id = p.product_id
--where od.order_id >? --- refer to variable max order id 

--For Data flow 2 (ADDs)
-----Source Shipp-ADD
SELECT [order_id]  ,[ship_address]
      ,[ship_city]
      ,[ship_region]
      ,[ship_postal_code]
      ,[ship_country]
  FROM [NorthwindUpdate].[dbo].[orders]
--WHERE order_id> ?
-----Source Emp-ADD
select e.employee_id , o.order_id ,e.address ,e.country,e.city,r.region_description,e.postal_code
from employees e join employee_territories et
on e.employee_id=et.employee_id
join territories t 
on t.territory_id=et.territory_id
join region r
on r.region_id=t.region_id
join orders o 
on o.employee_id = e.employee_id
--where o.order_id >?
----- Source Supp-ADD
WITH OrderWithSupplier AS (
    SELECT 
        dt.order_id,
        s.supplier_id,
        s.address,
        s.city,
        s.country,
        s.region,
        s.postal_code,
        ROW_NUMBER() OVER (PARTITION BY dt.order_id ORDER BY s.supplier_id) AS rn
    FROM suppliers s
    JOIN products p ON p.supplier_id = s.supplier_id
    JOIN order_details dt ON dt.product_id = p.product_id
 --WHERE dt.order_id > ?
)
SELECT 
    order_id,
    supplier_id,
    address,
    city,
    country,
    region,
    postal_code
FROM OrderWithSupplier
WHERE rn = 1;

----- Source Cus_ADD
select o.order_id , c.customer_id , c.address , c.city , c.country , c.region , c.postal_code  from customers c  join  orders o
on o.customer_id = c.customer_id
--where o.order_id >?