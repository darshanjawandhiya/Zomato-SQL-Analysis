
-- zomato dataset

-- select * from users limit 5;
-- Replicate sample function from pandas (return n random records)
-- select * from users order by rand() limit 5

-- find null values
-- select * from orders where restaurant_rating = '';
-- UPDATE orders set restaurant_rating= null where restaurant_rating='';
-- select * from orders; 

-- select user_id , count(*) as 'total_count' from orders group by user_id
-- select t1.name,count(*) as 'total_count' from users t1 
-- join orders t2 
-- on t1.user_id=t2.user_id
-- group by t1.user_id,t1.name


-- select t2.r_name,count(*) as 'total_items_count' from menu t1 
-- join restaurants t2
-- on t1.r_id = t2.r_id
-- group by t1.r_id,t2.r_name

-- select t1.r_name,count(t2.restaurant_rating),round(avg(t2.restaurant_rating),2) as 'rating' from restaurants t1 
-- join orders t2
-- on t1.r_id = t2.r_id where t2.restaurant_rating is not null
-- group by t1.r_id,t1.r_name order by rating desc 

-- select f_id,count(*) as 'total_count' from menu group by f_id order by total_count desc
-- select t2.f_name,count(*) as 'total_count' from menu t1 join food t2 
-- on t1.f_id = t2.f_id
-- group by t1.f_id,t2.f_name 
-- order by total_count desc

-- select MONTHNAME(date(date)),date from orders

-- select t2.r_name,sum(amount) as 'revenue' from orders t1 join restaurants t2 
-- on t1.r_id=t2.r_id 
-- where MONTHNAME(date(date)) = 'July'
-- group by t1.r_id,t2.r_name  
-- order by revenue desc;
 


-- select MONTHNAME(date(date)),sum(amount) from orders t1 join restaurants t2 
-- on t1.r_id=t2.r_id 
-- where r_name ='kfc'
-- group by MONTH(date(date)),MONTHNAME(date(date))
-- order by MONTH(date(date))

-- select t2.r_name,sum(amount) as 'revenue' from orders t1 join restaurants t2 on t1.r_id = t2.r_id
-- group by t1.r_id,t2.r_name 
-- having revenue > 1500

-- select t1.user_id,t1.name from users t1
-- except 
-- select t2.user_id,t3.name from orders t2
-- JOIN users t3 on t2.user_id =t3.user_id

-- select t1.order_id,t1.date,t3.f_name from orders t1 join order_details t2 on t1.order_id=t2.order_id
-- JOIN food t3 on t2.f_id = t3.f_id
-- where user_id =4 and
-- date between '2022-05-15' and '2022-06-15' 

-- select distinct (t1.user_id),t2.name,t4.f_name,t3.f_id,count(*) from orders t1 join users t2 on t1.user_id = t2.user_id
-- join order_details t3 on t1.order_id = t3.order_id
-- join food t4 on t3.f_id = t4.f_id
-- group by t1.user_id,t3.f_id,t2.name,t4.f_name
-- order by count(*) desc

-- select t1.r_id,t1.r_name,sum(price),count(*) as 'total dish',sum(price)/count(*) as 'avg_price' 
-- from restaurants t1 join menu t2 on t1.r_id = t2.r_id 
-- group by t1.r_id,t1.r_name
-- order by avg_price 

-- select t1.partner_id,t1.partner_name,count(*) as 'total_deliveries',avg(t2.delivery_rating),count(*) * 100 + avg(delivery_rating)* 1000 as 'salary'
-- from delivery_partner t1 
-- join orders t2 on t1.partner_id =t2.partner_id
-- group by t1.partner_id,t1.partner_name
-- order by t1.partner_id

-- select t3.r_name,t1.r_id from menu t1 join food t2 on t1.f_id = t2.f_id
-- join restaurants t3 on t1.r_id = t3.r_id
-- group by r_id,t3.r_name having min(type)= 'Veg' and max(type) = 'Veg'

-- select t1.user_id,t2.name,min(t1.amount) as 'min',max(t1.amount) as 'max' from orders t1 join users t2 
-- on t1.user_id =t2.user_id
-- group by t1.user_id,t2.name


SELECT t1.user_id,t3.f_id,COUNT(*) FROM users t1
JOIN orders t2
ON t1.user_id = t2.user_id
JOIN order_details t3
ON t2.order_id = t3.order_id
GROUP BY t1.user_id,t3.f_id
ORDER BY COUNT(*) DESC;
