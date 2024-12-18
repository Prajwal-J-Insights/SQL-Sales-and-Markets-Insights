CREATE DEFINER=`root`@`localhost` PROCEDURE `get_market_badge`(
		IN in_market varchar(45),
        IN in_fiscal_year year,
        OUT out_badge varchar(45)
)
BEGIN
	declare qty int default 0;
    #set default market to india
    if in_market="" then 
		set in_market="india";
	end if;
    #retrieve total qty for market+fiscal_year
	select SUM(sold_quantity) into qty
 from fact_sales_monthly s
join dim_customer c
on s.customer_code=c.customer_code
where get_fiscal_year(s.date)=in_fiscal_year and
	  c.market=in_market
group by c.market;

# determine market badge
	if qty>5000000 then set out_badge="GOLD";
    else set out_badge="SILVER";
    end if;
END