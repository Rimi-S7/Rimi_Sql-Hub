DROP DATABASE IF EXISTS `concon_delivery`;
CREATE DATABASE `concon_delivery`;
USE `concon_delivery`;

DROP TABLE IF EXISTS department;

CREATE TABLE department (
    department_id	INT,
    department_name	VARCHAR(512)
);

INSERT INTO department (department_id, department_name) VALUES ('1', 'Logistics & Transportation');
INSERT INTO department (department_id, department_name) VALUES ('2', 'Customer Service');
INSERT INTO department (department_id, department_name) VALUES ('3', 'Warehouse & Inventory Management');
INSERT INTO department (department_id, department_name) VALUES ('4', 'Operations & Dispatch');
INSERT INTO department (department_id, department_name) VALUES ('5', 'Fleet Maintenance & Management');

DROP TABLE IF EXISTS staff_profile;

CREATE TABLE staff_profile (
    staff_id	INT,
    first_name	VARCHAR(512),
    last_name	VARCHAR(512),
    age	INT,
    gender	VARCHAR(512),
    birth_date	VARCHAR(512)
);

INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('1', 'Ethan', 'Roberts', '44', 'Male', '2/12/1981');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('2', 'Ava', 'Mitchell', '36', 'Female', '3/22/1989');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('3', 'Liam', 'Anderson', '29', 'Male', '4/8/1996');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('4', 'Sophia', 'Clark', '61', 'Female', '4/8/1964');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('5', 'Noah', 'Bennett', '46', 'Male', '5/17/1979');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('6', 'Isabella', 'Hayes', '35', 'Female', '6/3/1990');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('7', 'Mason', 'Thompson', '43', 'Male', '7/29/1990');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('8', 'Jack', 'Richards', '38', 'Male', '8/14/1987');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('9', 'Lucas', 'Walker', '34', 'Male', '9/25/1991');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('10', 'Charlotte', 'Adams', '40', 'Female', '10/9/1985');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('11', 'Elijah', 'Scott', '37', 'Female', '12/21/1988');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('12', 'Amelia', 'Turner', '39', 'Female', '11/30/1986');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('13', 'James', 'Parker', '42', 'Male', '6/30/1983');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('14', 'Olivia', 'Carter', '30', 'Female', '2/9/1995');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('15', 'Benjamin', 'Hughes', '27', 'Male', '6/19/1998');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('16', 'Evelyn', 'Foster', '32', 'Female', '7/7/1993');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('17', 'William', 'Gray', '44', 'Male', '3/15/1981');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('18', 'Abigail', 'Cooper', '50', 'Male', '6/30/1975');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('19', 'Henry', 'Collins', '60', 'Male', '4/20/1965');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('20', 'Ella', 'Jenkins', '23', 'Female', '7/27/2002');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('21', 'Alexander', 'Brooks', '45', 'Male', '8/25/1980');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('22', 'Grace', 'Simmons', '31', 'Male', '10/20/1994');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('23', 'Samuel', 'Reed', '67', 'Male', '5/23/1958');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('24', 'Lily', 'Patterson', '19', 'Female', '8/28/2006');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('25', 'Daniel', 'Watson', '54', 'Male', '3/16/1971');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('26', 'Scarlett', 'Ward', '38', 'Female', '1/18/1987');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('27', 'Matthew', 'Green', '65', 'Male', '6/10/1960');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('28', 'Chloe', 'Philips', '26', 'Female', '11/27/1999');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('29', 'David', 'Rogers', '41', 'Male', '2/28/1984');
INSERT INTO staff_profile (staff_id, first_name, last_name, age, gender, birth_date) VALUES ('30', NULL, NULL, NULL, NULL, NULL);

DROP TABLE IF EXISTS staff_salary;

CREATE TABLE staff_salary (
    staff_id	INT,
    first_name	VARCHAR(512),
    last_name	VARCHAR(512),
    occupation	VARCHAR(512),
    salary	DOUBLE,
    dept_id	VARCHAR(512)
);

INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('1', 'Ethan', 'Roberts', 'Delivery Driver', '3000.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('2', 'Ava', 'Mitchell', 'Inventory Manager', '5000.0', '3');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('3', 'Liam', 'Anderson', 'Dispatcher', '4000.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('4', 'Sophia', 'Clark', 'Route Planner', '4500.0', '4');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('5', 'Noah', 'Bennett', 'Logistics Coordinator', '5200.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('6', 'Isabella', 'Hayes', 'Operations Manager', '7000.0', '4');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('7', 'Mason', 'Thompson', 'Delivery Driver', '3000.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('8', 'Jack', 'Richards', 'Delivery Driver', '3200.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('9', 'Lucas', 'Walker', 'Delivery Driver', '3100.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('10', 'Charlotte', 'Adams', 'Route Planner', '4600.0', '4');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('11', 'Elijah', 'Scott', 'Courier', '3500.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('12', 'Amelia', 'Turner', 'Inventory Manager', '5100.0', '3');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('13', 'James', 'Parker', 'Dispatcher', '3900.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('14', 'Harper', 'Murphy', 'Courier', '3600.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('15', 'Olivia', 'Carter', 'Package Handler', '2500.0', '2');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('16', 'Benjamin', 'Hughes', 'Courier', '3800.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('17', 'Evelyn', 'Foster', 'Operations Manager', '7200.0', '4');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('18', 'William', 'Gray', 'Dispatcher', '4100.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('19', 'Abigail', 'Cooper', 'Courier', '3700.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('20', 'Henry', 'Collins', 'Delivery Driver', '3000.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('21', 'Ella', 'Jenkins', 'Package Handler', '2600.0', '2');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('22', 'Alexander', 'Brooks', 'Dispatcher', '4000.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('23', 'Grace', 'Simmons', 'Dispatcher', '3800.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('24', 'Samuel', 'Reed', 'Delivery Driver', '3200.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('25', 'Lily', 'Patterson', 'Fleet Supervisor', '6000.0', '5');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('26', 'Daniel', 'Watson', 'Courier', '3900.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('27', 'Scarlett', 'Ward', 'Package Handler', '2400.0', '2');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('28', 'Matthew', 'Green', 'Delivery Driver', '3100.0', '1');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('29', 'Chloe', 'Philips', 'Warehouse Associate', '3200.0', '3');
INSERT INTO staff_salary (staff_id, first_name, last_name, occupation, salary, dept_id) VALUES ('30', 'David', 'Rogers', 'Delivery Driver', '3300.0', '1');
