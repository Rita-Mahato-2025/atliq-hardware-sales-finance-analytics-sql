select 	
	date_format(s.date, '%M') as Month, 	
	round(sum(s.sold_quantity* g.gross_price),2) as Total_Gross_Sales_Amount
from fact_sales_monthly s
join fact_gross_price g
on 
 	g.product_code=s.product_code and
    	g.fiscal_year=get_fiscal_year(s.date)	
where customer_code = 90002002
group by s.date
order by s.date
limit 1000000;
