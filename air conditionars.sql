create database airconditioner

drop table if exists air
create table air
(
  name varchar(400),
  main_category varchar(200),
  sub_category varchar(200),
  image varchar(600),
  link varchar(600),
  ratings numeric ,
  no_of_ratings numeric,
  discount_price money,
  actual_price money 

)
select * from air


alter table air
alter column ratings type numeric

alter table air
alter column no_of_ratings type numeric

copy
air (name, main_category, sub_category, image, link, ratings, no_of_ratings,  discount_price, actual_price
)
from 'D:/Air Conditioners.csv'
delimiter ','
csv header

select * from air

--1] Find the number of products with
-- ratings available and without ratings.

--i] without null
SELECT COUNT(*) AS products_with_ratings
FROM air
WHERE ratings IS NOT NULL;

--ii] with null
SELECT COUNT(*) AS products_with_ratings
FROM air
WHERE ratings IS NULL;

--2] What is the average discount price of the 
--  air conditioners in the dataset?

SELECT
	AVG(CAST(AIR.DISCOUNT_PRICE AS NUMERIC))
FROM
	AIR


select * from air

--3] Identify the top 5 products with the highest
--        number of ratings.

SELECT
	NAME, no_of_ratings
FROM
	AIR
WHERE NO_OF_RATINGS IS NOT NULL
ORDER BY
	NO_OF_RATINGS  DESC
LIMIT
	5;


--4] Are there any missing or null values in the dataset? 
--     Which columns are affected?

select * from air
where no_of_ratings is null



-- Total number of products

SELECT COUNT(*) AS total_products
INTO total_products_count
FROM air;

-- Number of products with both ratings and discount price
SELECT COUNT(*) AS products_with_ratings_and_discount
INTO products_with_ratings_and_discount_count
FROM air
WHERE ratings IS NOT NULL AND discount_price IS NOT NULL;

-- Calculate percentage

SELECT 
    (products_with_ratings_and_discount_count::DECIMAL / total_products_count::DECIMAL) * 100 AS percentage
FROM (
    SELECT
        (SELECT COUNT(*) FROM air WHERE ratings IS NOT NULL AND discount_price IS NOT NULL) AS products_with_ratings_and_discount_count,
        (SELECT COUNT(*) FROM air) AS total_products_count
) subquery;


select (dis::decimal / total_p::decimal)* 100 as per from
(select
(select count(*)
from air
where ratings is not null and discount_price is not null) as dis ,
(select count(*) from air ) as total_p) subqery

-- 5]  What is the percentage of products that have both ratings and a 
--    discount price?
SELECT
	(
		COUNT(*) FILTER (
			WHERE
				RATINGS IS NOT NULL
				AND DISCOUNT_PRICE IS NOT NULL
		) * 100.0 / COUNT(*)
	) AS PERCENTAGE
FROM
	AIR;


-- 5]  Find the product with the maximum discount percentage

select name, discount_price
from air
where discount_price is not null
order by discount_price desc limit 1;


-- 6] Plot a graph showing the distribution of discount prices for
--  the products.

SELECT discount_price
FROM air
WHERE discount_price IS NOT NULL;




