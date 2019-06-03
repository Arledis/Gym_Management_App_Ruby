DROP TABLE bookings;
DROP TABLE gymclasses;
DROP TABLE clients;

CREATE TABLE gymclasses
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  capacity INT2
);

CREATE TABLE clients
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  membership_type VARCHAR(255),
  contact_details VARCHAR(255)
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  gymclass_id INT8 references gymclasses(id),
  client_id INT8 references clients(id)
);
