# Try pulling all the data from the accounts table,
# and all the data from the orders table.

SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
limit 10;

# Try pulling standard_qty, gloss_qty, and poster_qty
# from the orders table, and the website and the primary_poc
# from the accounts table.

Select orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
From orders
Join accounts
On orders.account_id= accounts.id ;
