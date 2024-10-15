/*Create STATEMENTS*/
CREATE TABLE region
( region_ID char(7) NOT NULL,
 region_name varchar(30) Not NULL,
 PRIMARY KEY (region_ID)
); 
CREATE TABLE membership
( membership_ID char(7) Not NULL,
 membership_type char(20) NOT NULL,
 price$ numeric(7,2) NOT NULL,
 duration char(10) NOT NULL,
 PRIMARY KEY (membership_ID)
);
CREATE TABLE manager
( manager_ID char(3) NOT NULL,
 manager_FirstName varchar(35) NOT NULL,
 manager_LastName varchar(35) not NULL,
 phone_nr char(10) NOT NULL,
 PRIMARY KEY (manager_ID)
);
CREATE TABLE protein 
( protein_ID char(5) NOT NULL,
 protein_name varchar(35) NOT NULL,
 protein_price char(3) NOT NULL,
 PRIMARY KEY (protein_ID)
);
CREATE TABLE gym
( gym_id char(5) NOT NULL,
 gym_name Varchar(35) NOT NULL,
 manager_id char(3) NOT NULL,
 region_id char(7) NOT NULL,
 PRIMARY key (gym_id),
 FOREIGN KEY (manager_id) REFERENCES manager(manager_id),
 FOREIGN KEY (region_id) REFERENCES region(region_id)
);
CREATE TABLE instructor
( instructor_ID char(5) NOT NULL,
 instructor_FirstName varchar(35) NOT NULL,
 instructor_LastName varchar(35) NOT NULL,
 instructor_PhoneNr char(10) NOT NULL,
 salary int(10) NOT NULL,
 gym_ID char(5) NOT NULL,
 PRIMARY KEY (instructor_ID),
 FOREIGN KEY (gym_ID) REFERENCES gym (gym_ID)
);
CREATE TABLE client
( client_ID char(5) NOT NULL,
 client_FirstName varchar(35) NOT NULL,
 client_LastName varchar(35) NOT NULL,
 gender char(1) NOT NULL,
 age INT(2) NOT NULL,
 client_PhoneNr char(10) NOT NULL,
 BMI Numeric(3,2) NOT NULL,
 instructor_id char(5) NOT NULL,
 PRIMARY KEY (client_ID),
 FOREIGN KEY (instructor_ID) REFERENCES instructor (instructor_ID)
);
CREATE TABLE payment
( payment_id char(7),
 payment_date date(10),
 amount int(10),
 client_id char(5) NOT NULL,
 gym_id char(5) NOT NULL,
 PRIMARY key (payment_id),
 FOREIGN KEY (client_id) REFERENCES client(client_id),
 FOREIGN KEY (gym_id) REFERENCES gym(gym_id)
);
CREATE TABLE soldvia
( payment_id char(7) NOT NULL,
 membership_id char(7) NOT NULL,
 PRIMARY KEY (payment_id,membership_id),
 FOREIGN KEY (payment_id) REFERENCES payment(payment_id),
 FOREIGN KEY (membership_id) REFERENCES membership(membership_id)
);
CREATE TABLE supplies
( gym_id char(5) NOT NULL,
 protein_id char(5) NOT NULL,
 PRIMARY key (gym_id, protein_id),
 FOREIGN KEY (gym_id) REFERENCES gym (gym_id),
 FOREIGN KEY (protein_id) REFERENCES protein (protein_id)
);

/*INSERT STATEMENTS*/
INSERT into region VALUES ('T1001','Tirane');
INSERT into region VALUES ('D2221','Durres');
INSERT into region VALUES ('E3001','Elbasan');
INSERT into region VALUES ('V9402','Vlore');

INSERT INTO membership VALUES ('O24H','One day',20,'24 hours');
INSERT INTO membership VALUES ('C112','Classic',35,'1 month');
INSERT INTO membership VALUES ('CP13','Classic Plus',45,'2 months');
INSERT INTO membership VALUES ('E342','Elite',55,'4 months');
INSERT INTO membership VALUES ('EP90','Elite Plus',70,'6 months');
INSERT INTO membership VALUES ('G000','Golden',95,'1 year');

INSERT INTO manager VALUES ('01M22','Argela','Milo',0684627265);
INSERT INTO manager VALUES ('D4555','Serxhio','Dosku',678376266);
INSERT INTO manager VALUES ('E8875','Eni','Hoxha',6783766466);
INSERT INTO manager VALUES ('V3000','Klara','Gjecaj',6976533345);

INSERT into protein VALUES ('QL5','Vegan-Pro',30);
INSERT into protein VALUES ('R71','Fat-Loss',50);
INSERT into protein VALUES ('63S','Weight-Gainer',60);

INSERT INTO gym VALUES ('T600','Power Gym 1','01M22','T1001');
INSERT INTO gym VALUES ('D133','Power Gym 2','D4555','D2221');
INSERT INTO gym VALUES ('VB60','Power Gym 3','E8875','V9402');
INSERT INTO gym VALUES ('ELB9','Power Gym 4','V3000','E3001');

INSERT INTO instructor VALUES ('S8678','Lea','Lera',0674388256,200,'T600');
INSERT INTO instructor VALUES ('764G9','Elsa','Cena',0696545788,200,'D133');
INSERT INTO instructor VALUES ('C7000','Danjela','Hoxha',0697655568,150,'VB60');
INSERT INTO instructor VALUES ('EF454','Shila','Skenderi',0679998000,150,'ELB9');
INSERT INTO instructor VALUES ('G67KL','Xhesi','Plepaj',0687776547,300,'T600');

INSERT INTO client VALUES ('554J','Xhesika','Shima','F',19,0685243388,21.2,'S8678');
INSERT INTO client VALUES ('J597','Oksana','Spahiu','F',25,0676665345,22.8,'C7000');
INSERT INTO client VALUES ('A307','Kevin','Ali','M',20,0698747737,25.7,'C7000');
INSERT INTO client VALUES ('124K','Luisa','Dosaj','F',35,0676666366,29,'S8678');
INSERT INTO client VALUES ('784A','Arben','Zani','M',40,0688873626,24.4,'764G9');
INSERT INTO client VALUES ('387B','Engjell','Stasi','F',18,0688892550,26.7,'EF454');
INSERT INTO client VALUES ('A94K','Ertana','Zyba','F',29,0688255356,20.1,'G67KL');
INSERT INTO client VALUES ('8h77','Kristian','Zyberi','M',19,0675553424,18.7,'764G9');
INSERT INTO client VALUES ('N90J','Luan','Meraj','M',41,0698873626,29.2,'G67KL');
INSERT INTO client VALUES ('897H','Liljana','Leci','F',23,0678837267,19.7,'EF454');

INSERT INTO payment VALUES ('4YL6PE','25-01-2022',35,'554J','T600');
INSERT INTO payment VALUES ('B2MP18','12-01-2022',35,'J597','T600');
INSERT INTO payment VALUES ('USS3KS','03-01-2022',20,'A307','D133');
INSERT INTO payment VALUES ('CI9Q9T','05-01-2022',95,'124K','D133');
INSERT INTO payment VALUES (NULL,'18-01-2022',NULL,'784A','ELB9');
INSERT INTO payment VALUES ('G6CU37','10-01-2022',45,'387B','VB60');
INSERT INTO payment VALUES (NULL,'25-01-2022',NULL,'A94K','D133');
INSERT INTO payment VALUES ('NX9V2D','16-01-2022',95,'8h77','ELB9');
INSERT INTO payment VALUES (NULL,'01-01-2022',NULL,'N90J','VB60');
INSERT INTO payment VALUES ('OF1ESP','25-01-2021',70,'897H','T600');

INSERT INTO soldvia VALUES ('4YL6PE','C112');
INSERT INTO soldvia VALUES ('B2MP18','C112');
INSERT INTO soldvia VALUES ('USS3KS','O24H');
INSERT INTO soldvia VALUES ('CI9Q9T','G000');
INSERT INTO soldvia VALUES ('G6CU37','CP13');
INSERT INTO soldvia VALUES ('NX9V2D','G000');
INSERT INTO soldvia VALUES ('OF1ESP','EP90');

INSERT INTO supplies VALUES ('T1001','QL5');
INSERT INTO supplies VALUES ('D2221','R71');
INSERT INTO supplies VALUES ('V9402','63S');
INSERT INTO supplies VALUES ('E3001','63S');
INSERT INTO supplies VALUES ('T1001','R71');
INSERT INTO supplies VALUES ('D2221','63S');
INSERT INTO supplies VALUES ('V9402','R71');
INSERT INTO supplies VALUES ('E3001','R71');

/*SELECT STATEMENTS*/
SELECT instructor_firstname,instructor_lastname 
FROM instructor 
WHERE salary>(SELECT AVG(salary) FROM instructor);

SELECT client_firstname,client_lastname FROM client WHERE bmi>=25;

SELECT gym_id,gym_name,manager_firstname,manager_lastname 
FROM gym,manager 
WHERE gym.manager_id=manager.manager_id;

SELECT salary FROM instructor 
WHERE instructor_firstname 
LIKE '%Danjela%' and instructor_lastname LIKE '%Hoxha%';

SELECT SUM(amount) FROM payment;

SELECT membership_type 
FROM membership 
WHERE price$>60;

SELECT membership_id, 
COUNT(membership_id) 
FROM soldvia 
GROUP BY membership_id 
HAVING COUNT(membership_id)>=2;

SELECT client_id FROM payment WHERE payment_id is NULL;

SELECT membership_id,membership_type, price$ FROM membership order by price$ desc;

/*DELETE STATEMENTS*/
drop table supplies;
drop table soldvia;
drop table payment;
drop table client;
drop table instructor;
drop table gym;
drop table protein;
drop table manager;
drop table membership;
drop table region;