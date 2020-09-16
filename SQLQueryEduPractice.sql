use SalesDb
select * from customers;
select city,state, sum(sales) 'sum' from customers
group by City, state
having city in ('Cincinnati' , 'Columbus');

select city, sum(sales) from Customers
group by city
having sum(sales) > 600000

select Name 'customer' from customers
where sales < 10000

select Name, Sales, (City + ',' + state) 'City, State' from Customers
where sales >= 30000 and sales < 40000