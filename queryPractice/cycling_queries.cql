/**
 static table!
*/
SELECT * FROM cyclist_semi_pro; -- ok
SELECT * FROM cyclist_semi_pro WHERE id = 3; -- ok
-- Các lệnh error vì cần full scan
SELECT * FROM cyclist_semi_pro WHERE age = 23; -- error
SELECT * FROM cyclist_semi_pro WHERE id < 3; -- error 
/**
InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot execute this query as it might involve data filtering and thus may have unpredictable performance. 
If you want to execute this query despite the performance unpredictability, use ALLOW FILTERING"
*/
SELECT * FROM cyclist_semi_pro WHERE id < 3 ALLOW FILTERING; -- error 

-- functions:
SELECT count(*) FROM cyclist_semi_pro;
/**
Warnings :
Aggregation query used without partition key
*/


CREATE TABLE cyclist_2 (
    id int,
    affiliation text,
    age int,
    country text,
    firstname text,
    lastname text,
    registration date,
    PRIMARY KEY ((country, affiliation), id, age)
)