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

 Write a query to calculate the average daily price change in Apple stock, grouped by year.
 
 Select AVG(close-open), year
 from tutorial.aapl_historical_stock_price
 group by year
 order by year


 Write a query that calculates the lowest and highest prices that Apple stock achieved each month.
 Select year, month, min(low), max(high)
 from tutorial.aapl_historical_stock_price
 group by year,month
 order by year,month
