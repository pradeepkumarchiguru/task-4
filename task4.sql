create database flipkart 
use flipkart

CREATE TABLE mobile (
	`Brand` VARCHAR(12) NOT NULL, 
	`Model` VARCHAR(41) NOT NULL, 
	`Color` VARCHAR(21) NOT NULL, 
	`Memory` VARCHAR(6), 
	`Storage` VARCHAR(21), 
	`Rating` DECIMAL(38, 1), 
	`Selling Price` DECIMAL(38, 0) NOT NULL, 
	`Original Price` DECIMAL(38, 0) NOT NULL
);


--- insering bulk data
load data infile
'C:\\Flipkart_Mobiles_cleaned.csv'
into table mobile
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;

select * from mobile

-- procedure 
delimiter &&
create procedure records()
begin
  select * from mobile;
end &&

--- count 
select count(*) from mobile

select count(distinct model ) from mobile
select model,count(model) from mobile  where model='A53'


call records()

-- sum

select  sum(`selling price`)selling price  from mobile


select model,sum(`selling price`) suma53 from mobile where model='A53'

--- average 
call records()
select brand ,avg(`selling price`)average from mobile where brand='apple'

-- min

select brand ,min(`selling price`) from mobile where brand ='vivo'
--max 
select brand, max(`selling price`) from mobile where brand ='LG'



-- group 

call records()


select brand, min(`selling price`) from mobile group by Brand  

--- having 

select brand ,avg(`selling price`) from mobile  group by  brand having avg(Rating)>4
          

select model,max(`selling price`) from mobile   group by model having max(rating)>4




