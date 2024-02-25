select c.job_industry_category , count(*) as count
from customer c  
group by c.job_industry_category 
order by count desc  