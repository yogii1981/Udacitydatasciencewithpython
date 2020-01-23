# query to find all the accounts  where
# primary point of contact of information is not present

Select * from accounts
where primary_poc is Null

# Count function doesn't count Null values, it will not count the number of rows without the null values.

Select Count primary_poc as Account_Primary_Point_contact_count
From accounts;

# In order to include those rows where primary_poc is Null

Select * from accounts
where primary_poc is Null;


# Find the sum of quantity

Select SUM(standard_qty) as Standard, SUM (gloss_qty) as Gloss, SUM(poster_qty) as Poster
From orders;

#Aggregation Questions
# Use the SQL environment below to find the solution for each of the following questions. If you get stuck or want to check your answers, # you can find the answers at the top of the next concept.

#Find the total amount of poster_qty paper ordered in the orders table.
Select SUM(poster_qty) as Poster
From orders;


#Find the total amount of standard_qty paper ordered in the orders table.
Select SUM(standard_qty) as Standard
From orders;


#Find the total dollar amount of sales using the total_amt_usd in the orders table.

Select SUM(total_amt_usd) as Total_Amount_Dollar_Sales
From orders;


#Find the total amount spent on standard_amt_usd and gloss_amt_usd paper
# for each order in the orders table. This should give a dollar amount for each order
# in the table.
 SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;



#Find the standard_amt_usd per unit of standard_qty paper. Your solution should
# use both aggregation and a mathematical operator.

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;

# If you want to count NULLs as zero, you will need to use SUM and COUNT.
# However, this is probably not a good idea if the NULL values truly just represent
# unknown values for a cell.

#Questions: MIN, MAX, & AVERAGE
# Use the SQL environment below to assist with answering the following questions.

#Whether you get stuck or you just want to double-check your solutions,

#my answers can be found at the top of the next concept.



#When was the earliest order ever placed? You only need to return the date.
Select occurred_at
From orders
Order by occurred_at asc
limit 1;

# or

Select Min(occurred_at)
From orders
limit 1;


# Try performing the same query as in question 1 without using an aggregation function.
Select occurred_at
From orders
Order by occurred_at asc
limit 1;


#When did the most recent (latest) web_event occur?
Select Max(occurred_at)
From web_events
limit 1;



#Try to perform the result of the previous query without using an aggregation function.
Select occurred_at
From web_events
Order by occurred_at asc
limit 1;



#Find the mean (AVERAGE) amount spent per order on each paper type, as well as
# the mean amount of each paper type purchased per order. Your final answer should
# have 6 values - one for each paper type for the average number of sales, as well as
#the average amount.

SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss,
           AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd,
           AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;



# Via the video, you might be interested in how to calculate the MEDIAN. Though this
#  is more advanced than what we have covered so far try finding - what is the
#  MEDIAN total_usd spent on all orders?

 SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;
# Since there are 6912 orders - we want the average of the 3457 and 3456 order
# amounts when ordered. This is the average of 2483.16 and 2482.55. This gives
# the median of 2482.855. This obviously isn't an ideal way to compute. If we obtain
# new orders, we would have to change the limit. SQL didn't even calculate the median
# for us. The above used a SUBQUERY, but you could use any method to find the two
# necessary values, and then you just need the average of them



###################################################################

#GROUP BY
#GROUP BY Note
# Now that you have been introduced to JOINs, GROUP BY, and aggregate functions, the real power
# of SQL starts to come to life. Try some of the below to put your skills to the test!

#Questions: GROUP BY
#Use the SQL environment below to assist with answering the following questions. Whether you get
# stuck or you just want to double check your solutions, my answers can be found at the top of the next concept.

#One part that can be difficult to recognize is when it might be easiest to use an aggregate or one
# of the other SQL functionalities. Try some of the below to see if you can differentiate to find the easiest solution.

#Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.

#Find the total sales in usd for each account. You should include two columns - the total sales for each company's
# orders in usd and the company name.

#Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event?
# Your query should return only three values - the date, channel, and account name.

#Find the total number of times each type of channel from the web_events was used. Your final table should
# have two columns - the channel and the number of times the channel was used.

#Who was the primary contact associated with the earliest web_event?

# What was the smallest order placed by each account in terms of total usd.
# Provide only two columns - the account name and the total usd. Order from
# smallest dollar amounts to largest.



# 1. Which account (by name) placed the earliest order? Your solution should have
#  the account name and the date of the order.

 SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 1;


# 2. Find the total sales in usd for each account. You should include two columns - the total
# .  sales for each company's orders in usd and the company name.


SELECT SUM(total_amt_usd) total_sales, a.name as Company_name
From orders o
Join accounts a
On o.account_id = a.id
Group By a.name;





# 3. Via what channel did the most recent (latest) web_event occur, which account was
# associated with this web_event? Your query should return only three values - the date,
# channel, and account name.

SELECT w.occurred_at latestdate, w.channel as channel, a.name accountname
From web_events w
Join accounts a
On w.account_id = a.id
order by occurred_at desc
limit 1;



# 4. Find the total number of times each type of channel from the web_events was used. Your final table should
# have two columns - the channel and the number of times the channel was used.

SELECT w.channel, count(channel) as total_number_of_timechannelused
from web_events w
Group by w.channel;

# 5. Who was the primary contact associated with the earliest web_event?

SELECT a.primary_poc
FROM accounts a
Join web_events w
On a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 1;

# 6.What was the smallest order placed by each account in terms of total usd.
# Provide only two columns - the account name and the total usd. Order from
# smallest dollar amounts to largest.

SELECT a.name, MIN(total_amt_usd) smallest_order
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY smallest_order;


# Find the number of sales reps in each region. Your final table
# should have two columns - the region and the number of sales_reps.
#  Order from fewest reps to most reps.

Select r.name as region_name, s.id
from region r
join sales_reps s
on r.id = s.region_id
group by r.name;

# or this approach
Select r.name as region_name,count(s.id) as num_reps
from region r
join sales_reps s
on r.id = s.region_id
group by r.name
order by num_reps;


# Questions: GROUP BY Part II
# Use the SQL environment below to assist with answering the following
#  questions. Whether you get stuck or you just want to double check
# your solutions, my answers can be found at the top of the next concept.

#For each account, determine the average amount of each type of paper
# they purchased across their orders. Your result should have four
#columns - one for the account name and one for the average quantity
# purchased for each of the paper types for each account.
SELECT a.name, AVG(o.standard_qty) avg_stand, AVG(o.gloss_qty) avg_gloss, AVG(o.poster_qty) avg_post
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;




# For each account, determine the average amount spent per order on
# each paper type. Your result should have four columns - one for the
# account name and one for the average amount spent on each paper type.

SELECT a.name, AVG(o.standard_amt_usd) avg_stand_amt, AVG(o.gloss_amt_usd) avg_gloss_amt, AVG(o.poster_amt_usd) avg_post_amt
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;


#Determine the number of times a particular channel was used in the web_events
# table for each sales rep. Your final table should have three
#  columns - the name of the sales rep, the channel, and the number of
# occurrences. Order your table with the highest number of occurrences first.

SELECT s.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;


#Determine the number of times a particular channel was used in the web_events
# table for each region. Your final table should have three columns - the region
#  name, the channel, and the number of occurrences. Order your table with the
#  highest number of occurrences first.

SELECT r.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;


