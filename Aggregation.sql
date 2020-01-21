# query to find all the accounts  where
# primary point of contact of information is not present

Select * from accounts
where primary_poc is Null
