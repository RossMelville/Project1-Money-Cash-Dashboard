DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE tags 
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  icon VARCHAR(255)  
);

CREATE TABLE merchants
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL8 PRIMARY KEY,
  value INT4,
  transaction_date DATE,
  merchant_id INT8 REFERENCES merchants(id),
  tag_id INT8 REFERENCES tags(id)
);