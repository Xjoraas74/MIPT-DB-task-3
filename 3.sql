select count(*) as count
from "transaction" t 
	join customer c on t.customer_id = c.customer_id 
where t.online_order = true and t.order_status = 'Approved' and c.job_industry_category = 'IT'
group by t.brand 