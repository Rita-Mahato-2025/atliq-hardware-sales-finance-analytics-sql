select get_fiscal_year(s.date), 		
	round(sum(s.sold_quantity*g.gross_price),2) as Total_Gross_Sales_Amount
from fact_sales_monthly s
join fact_gross_price g
on s.product_code = g.product_code and   
     get_fiscal_year(s.date) = g.fiscal_year
where customer_code = 90002002
group by get_fiscal_year(s.date);
