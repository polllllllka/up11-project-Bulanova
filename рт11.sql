CREATE DATABASE dictionaries_db;

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    subcategory VARCHAR(100)
);

INSERT INTO categories (name, subcategory) VALUES
    ('Наручные', 'Механические'),
    ('Наручные', 'Кварцевые'),
    ('Настенные', 'Классические'),
    ('Аксессуары', 'Браслеты'),
    ('Аксессуары', 'Ремешки');


CREATE TABLE sizes (
    size_id SERIAL PRIMARY KEY,
    value NUMERIC(4,1) NOT NULL UNIQUE CHECK (value > 0)
);

INSERT INTO sizes (value) VALUES
    (18), (19), (20), (21), (22), (23), (24), (25);


CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    price NUMERIC(10,2) CHECK (price > 0),
    quantity INTEGER CHECK (quantity >= 0),
    category_id INTEGER REFERENCES categories(category_id)
);

INSERT INTO products (name, price, quantity, category_id) VALUES
    ('Часы наручные мужские', 5500.00, 10, 1),
    ('Часы настенные классические', 3200.50, 5, 3),
    ('Браслет кожаный', 800.00, 20, 4);


CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

INSERT INTO genres (name, description) VALUES
    ('Научно-популярные', 'Журналы о науке и технике'),
    ('Мода и стиль', 'Журналы о моде, красоте и стиле жизни'),
    ('Автомобильные', 'Журналы об авто и тюнинге'),
    ('Компьютерные', 'Журналы об IT, играх и гаджетах'),
    ('Хобби и рукоделие', 'Журналы о творчестве и DIY');

CREATE TABLE periodicity (
    period_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    days_between INTEGER CHECK (days_between > 0 AND days_between <= 365)
);

INSERT INTO periodicity (name, days_between) VALUES
    ('Ежедневный', 1), ('Еженедельный', 7), ('Ежемесячный', 30), ('Ежеквартальный', 90);


CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(100) NOT NULL,
    founded_year INTEGER CHECK (founded_year > 1800 AND founded_year <= 2026)
);

CREATE TABLE units (
    unit_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    short_name VARCHAR(10) NOT NULL
);

INSERT INTO publishers (name, country, founded_year) VALUES
    ('Burda', 'Германия', 1900), ('National Geographic', 'США', 1888), ('Вокруг света', 'Россия', 1861);

INSERT INTO units (name, short_name) VALUES
    ('Штука', 'шт'), ('Пачка', 'пач'), ('Комплект', 'компл');


CREATE TABLE languages (
    lang_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    iso_code CHAR(2) CHECK (length(iso_code) = 2)
);

CREATE TABLE audiences (
    audience_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    min_age INTEGER CHECK (min_age >= 0 AND min_age <= 18)
);

CREATE TABLE order_statuses (
    status_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    is_final BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO languages (name, iso_code) VALUES 
    ('Русский', 'ru'), ('Английский', 'en');
INSERT INTO audiences (name, min_age) VALUES 
    ('Дети', 0), ('Подростки', 12), ('Взрослые', 18);
INSERT INTO order_statuses (name, is_final) VALUES 
    ('Новый', FALSE), ('В обработке', FALSE), ('Доставлен', TRUE), ('Отменен', TRUE);