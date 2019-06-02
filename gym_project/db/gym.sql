DROP TABLE gymclasses;
DROP TABLE employees;
DROP TABLE clients;

CREATE TABLE employees
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  speciality VARCHAR(255)
);

CREATE TABLE clients
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  membership_type VARCHAR(255),
  contact_details VARCHAR(255)
);

CREATE TABLE gymclasses
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  employee_id INT8 references employees(id),
  client_id INT8 references clients(id),
  capacity INT2
);
