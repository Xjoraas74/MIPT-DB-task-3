select extract(month from t.transaction_date) as month, c.job_industry_category, sum(list_price) as sum
from "transaction" t 
	join customer c on t.customer_id = c.customer_id 
group by extract(month from t.transaction_date), c.job_industry_category 
order by extract(month from t.transaction_date), c.job_industry_category