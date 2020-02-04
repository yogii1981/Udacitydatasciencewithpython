# Find the number of events occured at each channel on each day

  SELECT DATE_TRUNC('day',occurred_at) AS day,
   channel, COUNT(*) as events
FROM web_events
GROUP BY 1,2
ORDER BY 3 DESC;
   
 # create a subquery which brings all the data from the previous query results
     SELECT *
     FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
           channel, COUNT(*) as events
     FROM web_events 
     GROUP BY 1,2
     ORDER BY 3 DESC) sub;
      
      
  # Find the aggregate number of events of each channel. Since your break out day earlier, it is giving 
  # average per day
  
       SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
             channel, COUNT(*) as events
      FROM web_events 
      GROUP BY 1,2) sub
GROUP BY channel
ORDER BY 2 DESC;


# What was the month/year combo for the first order placed?
Select * 
from orders
where Date_Trunc('month', occurred_at) =
(select Date_trunc('month',min(occurred_at)) as min_month
 from orders)
 order by occurred_at

                   
# The average amount of standard paper sold on the first month 
 # that any order was placed in the orders table (in terms of quantity).         
                   
SELECT AVG(standard_qty) avg_std, AVG(gloss_qty) avg_gls, AVG(poster_qty) avg_pst
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
     (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);

SELECT SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
      (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);
