select c.customer_id, sum(list_price) as sum, max(list_price) as max, min(list_price) as min, count(list_price) as count  
from "transaction" t 
	join customer c on t.customer_id = c.customer_id 
group by c.customer_id 
order by sum desc, count desc 