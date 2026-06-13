-- Create database 
CREATE DATABASE football_ticket_booking_system;

-- users table
CREATE TABLE users (
  user_id serial PRIMARY KEY,
  full_name varchar(100) NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  role varchar(20) NOT NULL,
  phone_number varchar(50)
);

-- matches table
CREATE TABLE matches (
  match_id serial PRIMARY KEY,
  fixture varchar(100) NOT NULL,
  tournament_category varchar(50) NOT NULL,
  base_ticket_price decimal(10, 2) NOT NULL,
  match_status varchar(20) NOT NULL
);

-- bookings table
CREATE TABLE bookings (
  booking_id serial PRIMARY KEY,
  user_id int NOT NULL REFERENCES users(user_id),
  match_id int NOT NULL REFERENCES matches(match_id),
  seat_number varchar(10),
  payment_status varchar(20),
  total_cost decimal(8, 2) NOT NULL
);

-- Users data
INSERT INTO
  users (full_name, email, role, phone_number)
VALUES
  (
    'Tanvir Rahman',
    'tanvir@mail.com',
    'Football Fan',
    '+8801711111111'
  ),
  (
    'Asif Haque',
    'asif@mail.com',
    'Football Fan',
    '+8801722222222'
  ),
  (
    'Sajjad Rahman',
    'sajjad@mail.com',
    'Ticket Manager',
    '+8801733333333'
  ),
  (
    'Jannat Ara',
    'jannat@mail.com',
    'Football Fan',
    NULL
  );


-- Matches data
INSERT INTO
  matches (
    fixture,
    tournament_category,
    base_ticket_price,
    match_status
  )
VALUES
  (
    'Real Madrid vs Barcelona',
    'Champions League',
    150,
    'Available'
  ),
  (
    'Man City vs Liverpool',
    'Premier League',
    120,
    'Selling Fast'
  ),
  (
    'Bayern Munich vs PSG',
    'Champions League',
    130,
    'Available'
  ),
  (
    'AC Milan vs Inter Milan',
    'Serie A',
    90,
    'Sold Out'
  ),
  ('Juventus vs Roma', 'Serie A', 80, 'Available');


-- Bookings data
INSERT INTO
  bookings (
    user_id,
    match_id,
    seat_number,
    payment_status,
    total_cost
  )
VALUES
  (1, 1, 'A-12', 'Confirmed', 150),
  (1, 2, 'B-04', 'Confirmed', 120),
  (2, 1, 'A-13', 'Confirmed', 150),
  (2, 1, NULL, NULL, 150),
  (3, 2, 'C-20', 'Pending', 120);