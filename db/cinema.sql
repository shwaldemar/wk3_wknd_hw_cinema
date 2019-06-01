DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE films
(
  title VARCHAR(255),
  price INT8,
  id SERIAL8 PRIMARY KEY
);

CREATE TABLE customers
(
  name VARCHAR(255),
  funds INT8,
  id SERIAL8 PRIMARY KEY
);

CREATE TABLE tickets
(
  customer_id  INT8,
  film_id INT8,
  id SERIAL8 PRIMARY KEY
);
