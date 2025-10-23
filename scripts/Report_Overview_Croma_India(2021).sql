select date_format(date, '%M') AS Month, 
	s.product_code, 				
	product, variant, 				
	s.sold_quantity, g.gross_price as gross_price_per_item,                 	
	(s.sold_quantity*g.gross_price) as gross_price_total
from fact_sales_monthly s
left join dim_product d
on s.product_code = d.product_code
join fact_gross_price g
on s.product_code = g.product_code and
get_fiscal_year(date) = g.fiscal_year
where customer_code = "90002002" and		
get_fiscal_year(date)=2021 
order by date asc
Limit 1000000; 
