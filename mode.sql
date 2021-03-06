# https://app.mode.com/editor/yogesh_sharma/reports/7307d6d20f7d #

# write a query to count the number of acquisition of the firm by city in descending order
Select acquirer_city, count(acquirer_city)
from tutorial.crunchbase_acquisitions
group by acquirer_city
order by count DESC;

# write a query to find the columns present in the city pppulation limit 100
select * from tutorial.city_populations
limit 100

# write a query to aggregrate the population to sum of cities
select sum(population_estimate_2012) as total_population
from tutorial.city_populations

# write a query to count the number of records in apple historical stock price
SELECT count(*) FROM tutorial.aapl_historical_stock_price


# write a query to find the order qunatity from each account along with amount in usd
SELECT account_id, sum(quantity),sum(amount_usd) FROM tutorial.orders
group by account_id;

# The following code will provide a count of all of rows in which the high column is not null.
SELECT COUNT(high)
  FROM tutorial.aapl_historical_stock_price
  
  
# Write a query that displays the number of players in each state, with FR, SO,
# JR, and SR players in separate columns and another column for the total number
#  of players. Order results such that states with the most players come first.
SELECT state,
      COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
      COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
      COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
      COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count,
      COUNT(1) AS total_players
 FROM benn.college_football_players
GROUP BY state
ORDER BY total_players DESC

  
# write a query to count toral number of unique months and total number of months
SELECT COUNT(Distinct year) ,
       COUNT(Distinct month),
       (COUNT(Distinct year) * COUNT(Distinct month)) as total_months
  FROM tutorial.aapl_historical_stock_price
  
Write a query that returns the unique values in the year column, in chronological order.
Select distinct year
from tutorial.aapl_historical_stock_price
order by year 
  
   
# Calculate the total number of shares traded each month. Order your results chronologically.
 SELECT year,
       month,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
 Group by month, year 
 order by  year, month ASC

  
  
# write a query for historical price , number of instances
SELECT year,
      COUNT(*) AS count
 FROM tutorial.aapl_historical_stock_price
GROUP BY year

# write a query for year, month , and number of transaction
SELECT year,
      month,
      COUNT(*) AS count
 FROM tutorial.aapl_historical_stock_price
GROUP BY year, month

  
  
  
 # query to count non-numerical data   
SELECT COUNT(date)
FROM tutorial.aapl_historical_stock_price

# Write a query that determines counts of every single column. Which column has the most null values?
SELECT COUNT(year) AS year,
       COUNT(month) AS month,
       COUNT(open) AS open,
       COUNT(high) AS high,
       COUNT(low) AS low,
       COUNT(close) AS close,
       COUNT(volume) AS volume
  FROM tutorial.aapl_historical_stock_price
  
# Write a query to calculate the average opening price (hint: you will need to use both COUNT and SUM, as well as some simple arithmetic.).
SELECT SUM(open)/COUNT(open) AS avg_open_price
  FROM tutorial.aapl_historical_stock_price 
  
  
 # query to write minimum price of apple at the
  SELECT min(low)
  FROM tutorial.aapl_historical_stock_price


# What was Apple's lowest stock price (at the time of this data collection)?
SELECT min(low)
FROM tutorial.aapl_historical_stock_price
group by date
order by date DESC
limit 1


# What was the highest single-day increase in Apple's share value?
SELECT MAX(close - open)
  FROM tutorial.aapl_historical_stock_price

# What was the highest difference of share value in a day 
Select MAX(high -low)
FROM tutorial.aapl_historical_stock_price

 #Write a query to calculate the average daily price change in Apple stock, grouped by year.
 
 Select AVG(close-open), year
 from tutorial.aapl_historical_stock_price
 group by year
 order by year


 #Write a query that calculates the lowest and highest prices that Apple stock achieved each month.
 Select year, month, min(low), max(high)
 from tutorial.aapl_historical_stock_price
 group by year,month
 order by year,month
 
 # After all, there are a lot of months in this dataset. Instead, you might want to find every month during
 # which AAPL stock worked its way over $400/share. The WHERE clause won't work for this because it doesn't
 # allow you to filter on aggregate columns—that's where the HAVING clause comes in:

SELECT year,
       month,
       MAX(high) AS month_high
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
HAVING MAX(high) > 400
 ORDER BY year, month
 
 # Query clause order
# As mentioned in prior lessons, the order in which you write the clauses
# is important. Here's the order for everything you've learned so far:

# SELECT
# FROM
# WHERE
# GROUP BY
# HAVING
# ORDER BY

# write a query to count toral number of unique months and total number of months
SELECT COUNT(Distinct year) ,
       COUNT(Distinct month),
       (COUNT(Distinct year) * COUNT(Distinct month)) as total_months
  FROM tutorial.aapl_historical_stock_price
  
# Average trade volumes by month to get a sense of when Apple stock really moves:

SELECT year, month,
       AVG(volume) AS avg_trade_volume
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
 ORDER BY 3 DESC                                     
    
# Write a query that counts the number of unique values in the month column for each year.
SELECT year,
       COUNT(DISTINCT month) AS months_count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year
 ORDER BY year

# Write a query that separately counts the number of unique values in the month column and the number of unique values in the `year` column.
SELECT COUNT(DISTINCT year) AS years_count,
      COUNT(DISTINCT month) AS months_count
  FROM tutorial.aapl_historical_stock_price      
                                     
                                     
# The CASE statement is followed by at least one pair of 
# WHEN and THEN statements—SQL's equivalent of IF/THEN in Excel. 
# Because of this pairing, you might be tempted to call this SQL 
# CASE WHEN, but CASE is the accepted term.

# Every CASE statement must end with the END statement. 
# The ELSE statement is optional, and provides a way to capture 
# values not specified in the WHEN/THEN statements. CASE is easiest 
# to understand in the context of an example:

   SELECT player_name,
          year,
          CASE WHEN year = 'SR' THEN 'yes'
               ELSE NULL END AS is_a_senior
     FROM benn.college_football_players
                                     
  # Write a query that includes a column that is flagged "yes" when
  # a player is from California, and sort the results with those players first.
  
  SELECT player_name,
        state,
        CASE WHEN state = 'CA' THEN 'yes'
            ELSE NULL END AS PLAYER_FROM_CALIFORNIA
            FROM benn.college_football_players
            ORDER BY PLAYER_FROM_CALIFORNIA ASC

                                     
                                     SELECT player_name,
          weight,
          CASE WHEN weight > 250 THEN 'over 250'
                WHEN weight > 200 THEN '201-250'
                WHEN weight > 175 THEN '176-200'
                ELSE '175 or under' END AS weight_group
FROM benn.college_football_players


# BETTER multipke case statement
SELECT player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 AND weight <= 250 THEN '201-250'
            WHEN weight > 175 AND weight <= 200 THEN '176-200'
            ELSE '175 or under' END AS weight_group
  FROM benn.college_football_players


# Write a query that includes players' names and a column
# that classifies them into four categories based on height.
#  Keep in mind that the answer we provide is only one of many
# possible answers, since you could divide players' heights in many ways.

SELECT player_name,
       height,
       CASE WHEN height > 74 THEN 'over 74'
            WHEN height > 72 AND height <= 74 THEN '73-74'
            WHEN height > 70 AND height <= 72 THEN '71-72'
            ELSE 'under 70' END AS height_group
  FROM benn.college_football_players


# Using CASE with aggregate functions
# CASE's slightly more complicated and substantially more useful
#  functionality comes from pairing it with aggregate functions.
# For example, let's say you want to only count rows that fulfill a
#  certain condition. Since COUNT ignores nulls, you could use a CASE
# statement to evaluate the condition and produce null or non-null values
#  depending on the outcome:

SELECT CASE WHEN year = 'FR' THEN 'FR'
            ELSE 'Not FR' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY CASE WHEN year = 'FR' THEN 'FR'
               ELSE 'Not FR' END

#But what if you also wanted to count a couple other conditions?
# Using the WHERE clause only allows you to count one condition.
#Here's an example of counting multiple conditions in one query:

SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY 1
