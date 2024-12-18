CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_year`(calendar_date DATE) RETURNS int
    DETERMINISTIC
BEGIN
	 declare fiscal_year INT;
     set fiscal_year=year(date_add(calendar_date,Interval 4 month));
RETURN fiscal_year;
END