# 1> Export table data as .csv file on you local machine
select * INTO OUTFILE '/Users/swapnil/leavetransaction.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' from leave_transactions
