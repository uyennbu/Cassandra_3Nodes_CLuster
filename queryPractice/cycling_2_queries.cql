-- OKAY:
SELECT * FROM cyclist_2; -- ok
SELECT * FROM cyclist_2 LIMIT 2;
SELECT * FROM cyclist_2 
    WHERE country = 'ITA' AND affiliation = 'Recco Club'; -- partitions
SELECT * FROM cyclist_2 
    WHERE country = 'ITA' AND affiliation = 'Recco Club' -- partitions
    AND id < 10; 
SELECT * FROM cyclist_2 
    WHERE country = 'ITA' AND affiliation = 'Recco Club' -- partitions
    AND id < 10 AND age < 25;  -- lỗi vì id không phải dấu = thì age ko được đặt điều kiện
SELECT * FROM cyclist_2 
    WHERE country = 'ITA' AND affiliation = 'Recco Club' -- partitions
    AND id = 2 AND age > 25; -- sửa thử thành < nhé, id is not unique in this table!

-- Nếu muốn điều kiện cho age trước thì phải đẩy age lên trước
-- vậy thì phải lập một bảng mới hoàn toàn vì cassandra không cho sửa primary key của table
COPY cyclist_2 (country, affiliation, age, id, firstname, lastname, registration) TO 'data.csv';

SELECT * FROM cyclist_2 
    WHERE country = 'ITA' AND affiliation = 'Recco Club' -- partitions
    AND age < 25; 
-- InvalidRequest: Error from server: code=2200 [Invalid query] 
-- message="PRIMARY KEY column "age" cannot be restricted as preceding column "id" is not restricted"

SELECT * FROM cyclist_2 WHERE country = 'ITA';

DELETE FROM cyclist_2 
    WHERE country = 'ITA' AND affiliation = 'Recco Club' -- partitions
    AND id IN (1,3,4,5,6,7);

INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) 
        VALUES (7, 'ITA', 'Recco Club', 25, 'Francesca', 'Bianchi', '2021-06-20');

INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname) 
        VALUES (7, 'ITA', 'Recco Club', 21, 'Francesca', 'Bianchi');

INSERT INTO cyclist_2 (id, country, affiliation, age, firstname) 
        VALUES (7, 'ITA', 'Recco Club', 20, 'Francesca');

-- Error
DELETE FROM cyclist_2 
    WHERE id IN (0,7);
    /**
    InvalidRequest: Error from server: code=2200 [Invalid query] 
    message="Some partition key parts are missing: country, affiliation"
    */

UPDATE cyclist_2
    SET lastname = 'Perotti'
    WHERE country = 'ITA' AND affiliation = 'Recco Club'
    AND id = 7 AND age = 21;

-- ERROR : InvalidRequest: Error from server: code=2200 [Invalid query] message="Some clustering keys are missing: age"
UPDATE cyclist_2
    SET lastname = 'Hehe'
    WHERE country = 'ITA' AND affiliation = 'Recco Club'
    AND id = 7; 