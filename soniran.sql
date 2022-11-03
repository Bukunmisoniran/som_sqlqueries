___@Assignment___
select *
from "accounts"

select *
from "orders"

select *
from "region"

select *
from "web_events"

select *
from "sales_reps"  

---@QUESTION 1
___@Day of the week with highest orders and primary point of contact___
select "pry_poc", to_char("date", 'day'), sum("total_sales") as "sales_total"
from
(select a.primary_poc "pry_poc", o.total "total_sales", o.occured_at "date"
from "accounts" a
join "orders" o
on a.id = o.account_id) as "table_one"
group by "pry_poc", "date"
order by "sales_total" desc

----@Question 2 Total sales made by walmart on saturday... compare that other companies and suggest what reason could be
select "name", to_char(occured_at, 'day'), max(total) as "highest_sale"
from "accounts" a
join "orders" o
on o.account_id = a.id
where trim(to_char(occured_at, 'day')) = 'saturday' and "name" ='Walmart'
group by "name", "occured_at"
order by "highest_sale"

----@Question 3 Sales rep with the highest sales,week day and what month was the sales made?

select "sales_rep_name", to_char("date", 'day') "week_day", to_char("date", 'month') "months", sum("total_sales") as "sales_total"
from
(select s.name "sales_rep_name", o.total "total_sales", o.occured_at "date"
from "sales_reps" s
join "orders" o
on s.region_id = o.id) as "table_one"
group by "sales_rep_name", "date"
order by "sales_total" desc
