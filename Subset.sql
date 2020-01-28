# Find the number of events occured at each channel on each day

   Select Date_Trunc('Day', occurred_at) as day, channel, count(*) as event_count
   from web_events
   group by 1,2 
   order by 1;
