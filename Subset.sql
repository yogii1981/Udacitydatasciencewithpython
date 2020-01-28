# Find the number of events occured at each channel on each day

   Select Date_Trunc('Day', occurred_at) as day, channel, count(*) as event_count
   from web_events
   group by 1,2 
   order by 1;
   
 # create a subquery which brings all the data from the previous query results
      Select * 
     from
      (Select Date_Trunc('Day', occurred_at) as day, channel, count(*) as event_count
      from web_events
      group by 1,2 
      order by 1) sub
      
      
  # Find the aggregate number of events of each channel. Since your brak out day earlier, it is giving 
  # average per day
  
       Select channel, avg(event_count) as Average_event_count 
     from
      (Select Date_Trunc('Day', occurred_at) as day, channel, count(*) as event_count
      from web_events
      group by 1,2 
      order by 1) sub
      group by 1
      order by 2 desc
