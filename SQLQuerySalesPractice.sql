use SalesDb

/*select * from customers;
select * from orders;

select * from customers
join orders on customers.id = orders.customerid;
*/

select c.Name, (c.City + ',' + c.State) 'city,state', o.Date, ol.Product from customers c
join orders o on c.id = o.customerid
join orderlines ol on o.id = ol.ordersid
order by Date

select city , (sum(sales)/count(city)) 'average sales' from Customers
group by City


/*select * from orders
select * from orderLines

select * from orders o
join orderLines ol on o.id = ol.ordersid
where price > 10*/





