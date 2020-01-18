Select occurred_at, account_id, channel
from web_events
limit 15;

# order_by #

Select *
from orders
order by occurred_at
limit 1000;


# query to return earliest 10 orders #
select id, occurred_at, total_amt_usd
from orders
limit 10;

# Write a query to return the top 5 orders in terms of #
#largest total_amt_usd. Include the id, account_id,   #
# and total_amt_usd.                                  #
select  id, account_id, total_amt_usd
from orders
order by total_amt_usd desc
limit 5  ;


# Write a query to return the lowest 20 orders in terms    #
#  of smallest total_amt_usd. Include the id, account_id,  #
# and total_amt_usd.                                       #
select  id, account_id, total_amt_usd
from orders
order by total_amt_usd asc
limit 20  ;


# 1. Write a query that displays the order ID,
#  account ID, and total dollar amount for all the orders,
# sorted first by the account ID (in ascending order), and then
# by the total dollar amount (in descending order).

Select id, account_id, total_amt_usd
from orders
order by account_id asc, total_amt_usd desc;

# 2. Now write a query that again displays order ID, account ID,
#   and total dollar amount for each order, but this time sorted
#   first by total dollar amount (in descending order), and then by
#   account ID (in ascending order).

Select id, account_id, total_amt_usd
from orders
order by total_amt_usd desc, account_id asc ;


# 3. Pulls the first 5 rows and all columns from the orders table that
#  have a dollar amount of gloss_amt_usd greater than or equal to 1000.

select * from orders
where gloss_amt_usd >= 1000
limit 5;


# 4. Pulls the first 10 rows and all columns from the orders table that
# have a total_amt_usd less than 500.

select * from orders
where total_amt_usd < 500
limit 10;


# Practice Question Using WHERE with Non-Numeric Data
# 5. Filter the accounts table to include the company name, website, and
# the primary point of contact (primary_poc) just for the Exxon Mobil
# company in the accounts table.


select name, website , primary_poc
from accounts
where name like 'Exxon Mobil';




# Create a column that divides the standard_amt_usd by 
#the standard_qty to find the unit price for standard paper
#  for each order. Limit the results to the first 10 orders, 
# and include the id and account_id fields.

select standard_amt_usd / standard_qty as unit_price, id, account_id
from orders
limit 10;

# Write a query that finds the percentage of revenue that comes
#  from poster paper for each order. 
# You will need to use only the columns that end with _usd. 
# (Try to do this without using the total column.) Display the id 
# and account_id fields also. NOTE - you will receive an error with
# the correct solution to this question. This occurs because at
#  least one of the values in the data creates a division by zero 
# in your formula. You will learn later in the course how to fully
#  handle this issue. For now, you can just limit your calculations 
# to the first 10 orders, as we did in question #1, and you'll avoid
#  that set of data that causes the problem.

SELECT id, account_id, 
   poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;



# Questions using the LIKE operator
# Use the accounts table to find

# 1. All the companies whose names start with 'C'.

Select name
from accounts
where name like 'C%' ;

# 2. All companies whose names contain the string 'one' 
#  somewhere in the name.

Select name
from accounts
where name like '%one%' ;

# 3. All companies whose names end with 's'.
Select name
from accounts
where name like '%s' ;
