/*we are using NamasteSQL1 orders table
1- write a query to find premium customers from orders data. Premium customers are those who have done more orders than average no of orders per customer.
*/
select * from orders

/* Using a Subquery in the WHERE Clause: */
select * from(
select customer_id, count(order_id) as total_orders from orders group by customer_id) as customer_orders where total_orders > (
select avg(count_order) from (select customer_id, count(order_id) as count_order from orders
group by customer_id) as average);

/* Using a Subquery in the HAVING Clause: */
select customer_id, count(order_id) as total_orders from orders group by customer_id having count(order_id) > (
select avg(count_order) from (select customer_id, count(order_id) as count_order from orders
group by customer_id) as average);

/* Using Common Table Expressions (CTE): */
with customer_count as (
select customer_id, count(order_id) as total_orders from orders group by customer_id
) select customer_id from customer_count where total_orders > (select avg(total_orders) from customer_count);

/*But it is WRONG TO USE IN THIS QUESTION THIS IS JUST FOR UNDERSTANDING Using Window Function: */
(select avg (total_order) from (select customer_id, count(order_id) over(partition by customer_id) as total_order from Orders) as avg_order);


