CREATE TABLE IF NOT EXISTS cyclist_2 (
    id int,
    affiliation text,
    age int,
    country text,
    firstname text,
    lastname text,
    registration date,
    PRIMARY KEY ((country, affiliation), id, age)
);

-- Dữ liệu cho các tay đua nước Ý (ITA)
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (1, 'ITA', 'Como Velocità', 24, 'Irene', 'Cantona', '2012-07-22');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (2, 'ITA', 'Recco Club', 22, 'Carlos', 'Perotti', '2020-01-12');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (3, 'ITA', 'Venezia Velocità', 19, 'Giovani', 'Pasi', '2016-05-15');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (4, 'ITA', 'Portofino Ciclisti', 19, 'Mark', 'Pastore', '2017-06-16');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (5, 'ITA', 'Menaggio Campioni', 24, 'Frances', 'Giardello', '2018-07-29');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (6, 'ITA', 'Como Velocità', 21, 'Alessandro', 'Rossi', '2019-03-12');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (7, 'ITA', 'Recco Club', 25, 'Francesca', 'Bianchi', '2021-06-20');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (8, 'ITA', 'Venezia Velocità', 20, 'Matteo', 'Ferrari', '2018-11-05');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (9, 'ITA', 'Portofino Ciclisti', 23, 'Lorenzo', 'Russo', '2017-08-14');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (10, 'ITA', 'Menaggio Campioni', 22, 'Giulia', 'Marini', '2020-04-25');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (11, 'ITA', 'Como Velocità', 19, 'Andrea', 'Gallo', '2022-01-15');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (12, 'ITA', 'Recco Club', 26, 'Chiara', 'Conti', '2016-09-30');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (13, 'ITA', 'Venezia Velocità', 24, 'Giovanni', 'De Luca', '2015-05-18');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (14, 'ITA', 'Portofino Ciclisti', 18, 'Sofia', 'Costa', '2023-07-11');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (15, 'ITA', 'Menaggio Campioni', 27, 'Federico', 'Bruno', '2014-12-03');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (16, 'ITA', 'Como Velocità', 21, 'Riccardo', 'Rizzo', '2019-10-22');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (17, 'ITA', 'Recco Club', 23, 'Aurora', 'Moretti', '2020-08-09');

-- Dữ liệu cho các tay đua nước Pháp (FRA)
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (18, 'FRA', 'Paris Cyclisme', 25, 'Lucas', 'Bernard', '2017-04-17');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (19, 'FRA', 'Lyon Velo', 20, 'Chloé', 'Petit', '2021-02-28');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (20, 'FRA', 'Marseille Vitesse', 22, 'Hugo', 'Dubois', '2018-06-14');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (21, 'FRA', 'Paris Cyclisme', 24, 'Manon', 'Moreau', '2016-11-19');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (22, 'FRA', 'Lyon Velo', 19, 'Arthur', 'Michel', '2022-09-05');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (23, 'FRA', 'Marseille Vitesse', 26, 'Emma', 'Garcia', '2015-03-24');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (24, 'FRA', 'Paris Cyclisme', 21, 'Thomas', 'Lefevre', '2019-07-08');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (25, 'FRA', 'Lyon Velo', 23, 'Léa', 'Rousseau', '2020-12-12');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (26, 'FRA', 'Marseille Vitesse', 18, 'Louis', 'Blanc', '2023-05-17');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (27, 'FRA', 'Paris Cyclisme', 27, 'Camille', 'Guerin', '2014-08-29');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (28, 'FRA', 'Lyon Velo', 20, 'Nathan', 'Roux', '2021-10-02');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (29, 'FRA', 'Marseille Vitesse', 25, 'Clara', 'Fontaine', '2017-01-20');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (30, 'FRA', 'Paris Cyclisme', 22, 'Enzo', 'Chevalier', '2018-05-14');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (31, 'FRA', 'Lyon Velo', 24, 'Inès', 'Masson', '2016-04-11');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (32, 'FRA', 'Marseille Vitesse', 19, 'Antoine', 'Gérard', '2022-03-08');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (33, 'FRA', 'Paris Cyclisme', 26, 'Eva', 'Mercier', '2015-07-26');

-- Dữ liệu cho các tay đua nước Tây Ban Nha (ESP)
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (34, 'ESP', 'Madrid Cilismo', 23, 'Carlos', 'Sanz', '2019-11-15');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (35, 'ESP', 'Barcelona Rápido', 21, 'Lucia', 'Gomez', '2020-09-09');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (36, 'ESP', 'Valencia Pedal', 18, 'Alejandro', 'Ortega', '2023-02-14');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (37, 'ESP', 'Madrid Cilismo', 25, 'Sofia', 'Navarro', '2017-06-30');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (38, 'ESP', 'Barcelona Rápido', 27, 'Mateo', 'Delgado', '2014-10-05');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (39, 'ESP', 'Valencia Pedal', 20, 'Elena', 'Rubio', '2021-04-19');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (40, 'ESP', 'Madrid Cilismo', 22, 'Manuel', 'Ruiz', '2018-12-25');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (41, 'ESP', 'Barcelona Rápido', 24, 'Alba', 'Marin', '2016-08-12');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (42, 'ESP', 'Valencia Pedal', 19, 'Diego', 'Jimenez', '2022-07-04');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (43, 'ESP', 'Madrid Cilismo', 26, 'Paula', 'Muñoz', '2015-10-10');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (44, 'ESP', 'Barcelona Rápido', 23, 'Daniel', 'Garrido', '2019-02-27');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (45, 'ESP', 'Valencia Pedal', 21, 'Marta', 'Santos', '2020-11-11');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (46, 'ESP', 'Madrid Cilismo', 25, 'David', 'Castillo', '2017-03-16');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (47, 'ESP', 'Barcelona Rápido', 18, 'Sara', 'Peña', '2023-08-22');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (48, 'ESP', 'Valencia Pedal', 22, 'Pablo', 'Flores', '2018-01-30');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (49, 'ESP', 'Madrid Cilismo', 27, 'Laura', 'Cano', '2014-05-04');
INSERT INTO cyclist_2 (id, country, affiliation, age, firstname, lastname, registration) VALUES (50, 'ESP', 'Barcelona Rápido', 20, 'Javier', 'Blanco', '2021-07-19');