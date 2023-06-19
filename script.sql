DROP TABLE employee;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    age INT NOT NULL,
    hiredate DATE NOT NULL
);

INSERT INTO employee
VALUES 
(01, 'Alan', 'Palmer', 32, '2019-12-15'),
(02, 'Susan', 'Shepard', 28, '2015-07-21'),
(03, 'Justin', 'Ward', 43, '2017-08-24'),
(04, 'Alan', 'Smith', 30, '2017-06-22'),
(05, 'James', 'Betternot', 26, '2017-06-22'),
(06, 'Ralph', 'White', 44, '2017-06-23'),
(07, 'Leonard', 'Nimoy', 72, '2007-12-14'),
(08, 'Janice', 'Rand', 61, '2016-07-06'),
(09, 'Harry', 'Mudd', 65, '2020-07-06'),
(10, 'Hikaru', 'Sulu', 58, '2015-03-21'),
(11, 'James', 'Kirk', 59, '2014-01-02'),
(12, 'Leonard', 'McCoy', 65, '2015-08-21'),
(13, 'Pavel', 'Chekov', 44, '2014-10-15'),
(14, 'Christopher', 'Pike', 32, '2014-11-24'),
(15, 'Darth', 'Vader', 124, '2015-03-22'),
(16, 'Boba', 'Fett', 49, '2015-03-22'),
(17, 'Luke', 'Skywalker', 66, '2019-11-11'),
(18, 'Han', 'Solo', 73, '2012-02-03'),
(19, 'Kylo', 'Ren', 34, '2020-06-14'),
(20, 'Galen', 'Erso', 55, '2020-06-14')
;

DROP TABLE address;

CREATE TABLE address (
    id INT PRIMARY KEY,
    address1 TEXT NOT NULL,
    address2 TEXT,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    zip TEXT NOT NULL
);

INSERT INTO address
VALUES 
(01, '1211 Sudan St', NULL, 'Mobile', 'AL', '36609'),
(02, '4800 Barkshire Dr', NULL, 'Pace', 'FL', '32571'),
(03, '12 Nutmeg Ct', NULL, 'Culver City', 'CA', '90211'),
(04, '2142 Elmwood Pl', NULL, 'Johnson City', 'TN', '37112'),
(05, '777 Heavenly Ln', 'Box 13', 'Pike City', 'MN', '50877')
;

DROP TABLE contact;

CREATE TABLE contact (
    id INT PRIMARY KEY,
    cellphone TEXT NOT NULL,
    homephone TEXT,
    email TEXT NOT NULL
);

INSERT INTO contact
VALUES 
(01, '5121325343', '5125234234', 'apalmer@yachtmail.com'),
(02, '5129739834', '5129847873', 'sshepard@yorkdevtraining.com'),
(03, '6453898502', '6459872345', 'jsward2007@yahoo.com'),
(04, '8763238756', '8763736548', 'alsmith999@gmail.com'),
(05, '8880345966', '8888567987', 'james.betternot@hotmail.com'),
(06, '3322827765', '3328760098', 'ralph.white264@aol.com')
;

SELECT employee.fname, employee.lname, employee.age, address.city, address.state
FROM employee
INNER JOIN address ON employee.id = address.id
WHERE employee.fname = 'Alan';

SELECT employee.fname, employee.lname, employee.age, address.city, address.state, contact.email
FROM employee
INNER JOIN address ON employee.id = address.id
INNER JOIN contact ON employee.id = contact.id
WHERE contact.email = 'james.betternot@hotmail.com';

UPDATE contact
SET cellphone = '4383991212'
WHERE id = (SELECT employee.id from employee where employee.fname = 'Susan' AND employee.lname = 'Shepard'); 

SELECT *
FROM employee
INNER JOIN address ON employee.id = address.id
INNER JOIN contact ON employee.id = contact.id
WHERE employee.fname = 'Susan' AND employee.lname = 'Shepard';