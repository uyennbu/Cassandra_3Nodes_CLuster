-- KESPACE 1: cycling with replication factor = 1
-- create new kespace with replication factor = 1
CREATE KEYSPACE IF NOT EXISTS cycling
   WITH replication = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };
-- create new table in a kespace
CREATE TABLE IF NOT EXISTS cycling.cyclist_semi_pro (
  id int,
  firstname text,
  lastname text,
  age int,
  affiliation text,
  country text,
  registration date,
  PRIMARY KEY (id));
-- insert data into the table
INSERT INTO cycling.cyclist_semi_pro (id, firstname, lastname, age, affiliation, country, registration) VALUES (1, 'Carlos', 'Perotti', 22, 'Recco Club', 'ITA', '2020-01-12');
INSERT INTO cycling.cyclist_semi_pro (id, firstname, lastname, age, affiliation, country, registration) VALUES (2, 'Giovani', 'Pasi', 19, 'Venezia Velocità', 'ITA', '2016-05-15');
INSERT INTO cycling.cyclist_semi_pro (id, firstname, lastname, age, affiliation, country, registration) VALUES (3, 'Frances', 'Giardello', 24, 'Menaggio Campioni', 'ITA', '2018-07-29');
INSERT INTO cycling.cyclist_semi_pro (id, firstname, lastname, age, affiliation, country, registration) VALUES (4, 'Mark', 'Pastore', 19, 'Portofino Ciclisti', 'ITA', '2017-06-16');
INSERT INTO cycling.cyclist_semi_pro (id, firstname, lastname, age, affiliation, country, registration) VALUES (5, 'Irene', 'Cantona', 24, 'Como Velocità', 'ITA', '2012-07-22');
-- select data from table
SELECT * FROM cycling.cyclist_semi_pro ;


-- KESPACE 2: cycling_contest with replication factor = 2
-- create kespace
CREATE KEYSPACE IF NOT EXISTS cycling_contest
   WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '2'};
-- create staff table
CREATE TABLE IF NOT EXISTS cycling_contest.staffs (
    id INT PRIMARY KEY,
    firstname text,
    lastname text,
    phone text
);
-- insert new data into table
INSERT INTO cycling_contest.staffs (id, firstname, lastname, phone) VALUES (1, 'Fabiola', 'Jackson', '(831) 555-5554');
INSERT INTO cycling_contest.staffs (id, firstname, lastname, phone) VALUES (1, 'Mireya', 'Copeland', '(831) 505-2355');
INSERT INTO cycling_contest.staffs (id, firstname, lastname, phone) VALUES (1, 'Jannette', 'David', '(516) 379-4444');
-- select data from table
SELECT * FROM cycling_contest.staffs;

