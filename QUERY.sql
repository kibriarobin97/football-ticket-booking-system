CREATE TABLE users (
  user_id serial PRIMARY KEY,
  full_name varchar(100) NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  role varchar(20) NOT NULL,
  phone_number varchar(50)
);

CREATE TABLE matches (
  match_id serial PRIMARY KEY,
  fixture varchar(100) NOT NULL,
  tournament_category varchar(50) NOT NULL,
  base_ticket_price decimal(10, 2) NOT NULL,
  match_status varchar(20) NOT NULL
);

CREATE TABLE bookings (
  booking_id serial PRIMARY KEY,
  user_id int NOT NULL REFERENCES users(user_id),
  match_id int NOT NULL REFERENCES matches(match_id),
  seat_number varchar(10),
  payment_status varchar(20),
  total_cost decimal(8, 2) NOT NULL
);