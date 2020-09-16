/*select * from customers;
select * from orders;

select * from customers
join orders on customers.id = orders.customerid;
*/

select * from customers
join orders o on customers.id = o.customerid
join orderlines ol on o.id = ol.ordersid



/*select * from orders
select * from orderLines

select * from orders o
join orderLines ol on o.id = ol.ordersid
where price > 10*/





