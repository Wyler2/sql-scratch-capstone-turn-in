select *
from survey 
limit 10;

select question, count(distinct user_id)
from survey
group by 1;

select *
from quiz
limit 5;

select *
from home_try_on
limit 5;

select *
from purchase
limit 5;

SELECT DISTINCT q.user_id,
CASE WHEN h.user_ID IS NOT NULL
    THEN 'True' ELSE 'False'
 END AS 'is_home_try_on',
case when h.number_of_pairs is null then 'NULL' else 
 h.number_of_pairs
 END as 'number_of_pairs',
CASE WHEN p.user_id IS NOT NULL
    THEN 'True' ELSE 'False'
 END AS 'is_purchase'
 FROM quiz q
 LEFT JOIN home_try_on h
     ON q.user_id = h.user_id
 LEFT JOIN purchase p
     ON p.user_id = q.user_id
limit 10;

select count(distinct quiz.user_id) as 'quiz_user_id', count (distinct home_try_on.user_id) as 'home_try_on_user_id' 
from quiz
left join home_try_on
	on quiz.user_id = home_try_on.user_id; 

select count (distinct home_try_on.user_id) as 'home_try_on_user_id', count (distinct purchase.user_id) as 'purchase_user_id' 
from home_try_on
left join purchase
	on home_try_on.user_id = purchase.user_id;


select max(style) as 'most popular style', max(fit) as 'most popular fit', max(shape) as 'most popular fit',max(color) as 'most popular color'
from quiz;

select max(style) as 'most popular style', max(model_name) as 'most popular modal', max(color) as 'most popular color',max(price) as 'most common price'
from purchase;




with quiz funnel as (select *
from quiz
left join home_try_on
	on quiz.user_id = home_try_on.user_id)
select (user_id), count(number_of_pairs) where number_of_pairs is not null
from quiz funnel;