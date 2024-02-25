select c.first_name , c.last_name , t.list_price 
from "transaction" t 
	join customer c on t.customer_id = c.customer_id 
where t.list_price = (
	select max(cp.price)
	from (
		select c.customer_id,
			max(t.list_price) over(partition by c.customer_id) as price
		from "transaction" t 
			join customer c on t.customer_id = c.customer_id
		where t.list_price is not null 
	) as cp
)