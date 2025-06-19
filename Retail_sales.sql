use retail_sales;



select * from brands;
select * from categories;
select * from customers;
select * from order_items;
select * from orders;
select * from products;
select * from staffs;
select * from stocks;
select * from stores;



-- Inner Join for Order Details

  select * from products p  inner join order_items o on p.product_id = o.product_id;
  
-- Total Sales by Store

  select s.store_id,s.store_name, round(sum(total_price),2) as total_sales from order_items i 
  inner join orders o
  on i.order_id = o.order_id
  inner join stores s
  on o.store_id = s.store_id
  group by s.store_id, s.store_name
  order by s.store_id;
  
 -- Top 5 Selling Products
 
select * from order_items;

select o.product_id,p.product_name,sum(o.quantity) as total_quantity from order_items o
inner join products p on o.product_id=p.product_id
group by o.product_id,p.product_name order by total_quantity desc limit 5;
  
-- customer purchase summary(each customer return total orders placed, total items purchased, and total revenue)
  
  select * from orders;
  select * from order_items;
  
  select o.customer_id,c.first_name,c.last_name, count(o.order_id) as total_orders_placed, sum(i.quantity) as total_items_purchased,
  round(sum(i.total_price),2) as total_revenue from orders o 
  join order_items i
  on o.order_id = i.order_id
  join customers c
  on o.customer_id = c.customer_id
  group by o.customer_id, c.first_name, c.last_name
  order by total_revenue desc;

-- Segment Customers by Total Spend


-- Staff Performance Analysis

select s.staff_id,s.first_name,s.last_name,count(i.order_id) as total_orders,round(sum(i.total_price),2) as total_revenue 
from staffs s inner join orders o 
on s.staff_id = o.staff_id
inner join order_items i 
on o.order_id = i.order_id
group by s.staff_id,s.first_name,s.last_name
order by total_revenue desc;

-- Stock Alert Query
select * from stocks;
select * from products;

select s.store_id, st.store_name, s.product_id, p.product_name ,s.quantity
from stocks s inner join stores st
on s.store_id = st.store_id
inner join products p 
on s.product_id = p.product_id
where s.quantity<10
order by s.quantity;

-- 








