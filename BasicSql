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
