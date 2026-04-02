
CREATE TABLE author (
id INT AUTO_INCREMENT ,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
);
CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  author_id INT,
  title VARCHAR(255) NOT NULL,
  word_count INT,
  views INT,
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

 -- TASK 2
 
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
  flight_number VARCHAR(10) PRIMARY KEY,
  aircraft_id INT,
  milage INT,
  FOREIGN KEY (aircraft_id) REFERENCES aircrafts(id)
);

CREATE TABLE bookings (
id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
flight_number VARCHAR(10),
FOREIGN KEY (customer_id) REFERENCES customers(id),
FOREIGN KEY (flight_number) REFERENCES flights(flight_number)
);

 /*INSERTIONS */
INSERT INTO aircrafts (aircraft_name, aircraft_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO flights (flight_number, aircraft_id,milage) VALUES
('DL143', 1, 135),
('DL122', 2, 4370),
('DL53', 3, 2078),
('DL222', 3, 1765),
('DL37', 1, 531);

INSERT INTO customers (customer_name,customer_milage,status) VALUES
('Agustine Riviera', 115235, 'Silver'),
('Alaina Sepulvida', 6008, 'None'),
('Tom Jones', 205767, 'Gold'),
('Sam Rio', 2653, 'None'),
('Jessica James', 127656, 'Silver'),
('Ana Janco', 136773, 'Silver'),
('Jennifer Cortez', 300582, 'Gold'),
('Christian Janco', 14642, 'Silver');

INSERT INTO bookings (customer_id, flight_number) VALUES
(1, 'DL143'),
(1, 'DL122'),
(2, 'DL122'),
(1, 'DL143'),
(3, 'DL122'),
(3, 'DL53'),
(1, 'DL143'),
(4, 'DL143'),
(1, 'DL143'),
(3, 'DL222'),
(5, 'DL143'),
(4, 'DL143'),
(6, 'DL222'),
(7, 'DL222'),
(5, 'DL122'),
(4, 'DL37'),
(8, 'DL222');


SELECT c.id,c.customer_name,c.customer_milage,a.aircraft_name,a.aircraft_seats
FROM bookings b
JOIN customers c ON b.customer_id = c.id
JOIN flights f ON b.flight_number = f.flight_number
JOIN aircrafts a ON f.aircraft_id = a.id ;


SELECT COUNT(DISTINCT flight_number) FROM flights;

SELECT AVG(milage) FROM flights;

SELECT AVG(aircraft_seats) FROM aircrafts;

SELECT status, AVG(customer_milage) FROM customers GROUP BY status;

SELECT status, MAX(customer_milage) FROM customers GROUP BY status;

SELECT COUNT(*) FROM aircrafts WHERE aircraft_name LIKE '%Boeing%';

SELECT * FROM flights WHERE milage BETWEEN 300 AND 2000;

SELECT c.status, AVG(f.milage)
FROM bookings b
JOIN customers c ON b.customer_id = c.id
JOIN flights f ON b.flight_number = f.flight_number
GROUP BY c.status;

SELECT a.aircraft_name, COUNT(*) AS total_bookings
FROM bookings b
JOIN customers c ON b.customer_id = c.id
JOIN flights f ON b.flight_number = f.flight_number
JOIN aircrafts a ON f.aircraft_id = a.id
WHERE c.status = 'Gold'
GROUP BY a.aircraft_name
ORDER BY total_bookings DESC
LIMIT 1;

