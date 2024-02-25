select c.customer_id,
	t.transaction_id,
	t.list_price,
	sum(t.list_price) over(partition by c.customer_id) as sum,
	max(t.list_price) over(partition by c.customer_id) as max,
	min(t.list_price) over(partition by c.customer_id) as min,
	count(t.list_price) over(partition by c.customer_id) as count
from "transaction" t 
	join customer c on t.customer_id = c.customer_id
order by sum desc, count desc 