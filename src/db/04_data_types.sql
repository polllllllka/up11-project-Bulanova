
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER,
    course INTEGER
);
INSERT INTO students (name, age, course) VALUES
('Иванов Иван', 20, 2),
('Петров Пётр', 21, 3),
('Сидорова Анна', 19, 1);


CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);
INSERT INTO clients (name, email, phone, address) VALUES
('Иванов Иван', 'ivanov@mail.ru', '+79991112233', 'г. Москва, ул. Ленина, д. 1, кв. 10'),
('Петров Пётр', 'petrov@mail.ru', '+79992223344', 'г. Санкт-Петербург, Невский пр., д. 5'),
('Сидорова Анна', 'sidorova@mail.ru', '+79993334455', 'г. Казань, ул. Баумана, д. 15');


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    delivery_date DATE,
    status VARCHAR(20) DEFAULT 'новый'
);
INSERT INTO orders (delivery_date) VALUES
('2026-10-20'),
('2026-10-25'),
('2026-11-01');


CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) CHECK (price > 0),
    quantity INTEGER CHECK (quantity >= 0)
);
INSERT INTO products (name, price, quantity) VALUES
('Ноутбук', 74999.99, 10),
('Мышь', 1500.50, 50),
('Клавиатура', 3200.00, 30);


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    login VARCHAR(50) UNIQUE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    is_admin BOOLEAN DEFAULT FALSE
);
INSERT INTO users (login) VALUES ('ivanov'), ('petrov'), ('admin');
UPDATE users SET is_admin = TRUE WHERE login = 'admin';


CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE,
    is_active BOOLEAN DEFAULT TRUE
);
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    order_date DATE DEFAULT CURRENT_DATE,
    total NUMERIC(10,2) CHECK (total >= 0),
    is_paid BOOLEAN DEFAULT FALSE
);
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_name VARCHAR(100) NOT NULL,
    quantity INTEGER CHECK (quantity > 0),
    price NUMERIC(10,2) CHECK (price > 0)
);
INSERT INTO customers (name, email) VALUES ('Иванов', 'ivanov@shop.ru');
INSERT INTO orders (customer_id, total) VALUES (1, 15000);
INSERT INTO order_items (order_id, product_name, quantity, price) VALUES (1, 'Телефон', 1, 15000);


CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(100),
    duration_minutes INTEGER CHECK (duration_minutes > 0),
    release_date DATE,
    rating NUMERIC(3,1) CHECK (rating >= 0 AND rating <= 10),
    is_active BOOLEAN DEFAULT TRUE
);
CREATE TABLE halls (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    capacity INTEGER CHECK (capacity > 0),
    has_3d BOOLEAN DEFAULT FALSE
);
CREATE TABLE sessions (
    id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES movies(id),
    hall_id INTEGER REFERENCES halls(id),
    session_date DATE DEFAULT CURRENT_DATE,
    start_time VARCHAR(10) NOT NULL,
    ticket_price NUMERIC(10,2) CHECK (ticket_price > 0),
    is_cancelled BOOLEAN DEFAULT FALSE
);
INSERT INTO movies (title, genre, duration_minutes, release_date, rating) VALUES
('Интерстеллар', 'Фантастика', 169, '2014-11-07', 8.6),
('Начало', 'Фантастика', 148, '2010-07-16', 8.8),
('Тёмный рыцарь', 'Боевик', 152, '2008-07-18', 9.0),
('Оппенгеймер', 'Драма', 180, '2023-07-21', 8.3),
('Дюна', 'Фантастика', 155, '2021-10-22', 8.0);

INSERT INTO halls (name, capacity, has_3d) VALUES
('Зал 1', 100, FALSE),
('Зал 2', 150, TRUE),
('Зал 3', 200, TRUE),
('VIP-зал', 50, FALSE),
('Зал 5', 120, TRUE);

INSERT INTO sessions (movie_id, hall_id, start_time, ticket_price) VALUES
(1, 2, '18:00', 500.00),
(2, 1, '19:30', 400.00),
(3, 3, '20:00', 600.00),
(4, 2, '21:00', 550.00),
(5, 1, '22:00', 450.00);
