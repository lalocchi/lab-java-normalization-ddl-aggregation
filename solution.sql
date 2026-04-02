
CREATE TABLE author (
id INT AUTO_INCREMENT ,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
);
CREATE TABLE book (
id INT AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
word_count int,
views int,
PRIMARY KEY (id),
FOREIGN KEY (id) REFERENCES author(id)
);  


CREATE TABLE customers (
id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
customer_milage INT,
status VARCHAR (30) DEFAULT 'none'
);
CREATE TABLE aircrafts (
id INT AUTO_INCREMENT PRIMARY KEY,
aircraft_name VARCHAR(100),
aircraft_seats INT
);
CREATE TABLE flights (
id INT AUTO_INCREMENT PRIMARY KEY,
flight_number VARCHAR(6),
flight_milage INT,
aircraft_id INT,
FOREIGN KEY (aircraft_id) REFERENCES aircrafts(id)
);
CREATE TABLE bookings (
id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
flight_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(id),
FOREIGN KEY (flight_id) REFERENCES flights(id)
);

SELECT c.id,c.customer_name,c.customer_milage,a.aircraft_name,a.aircraft_seats
FROM bookings b
JOIN customers c ON b.customer_id = c.id
JOIN flights f ON b.flight_id = f.id
JOIN aircrafts a ON f.aircraft_id = a.id ;

