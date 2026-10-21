CREATE DATABASE normalization_db;
CREATE TABLE client_phones (
    client_id   INT         NOT NULL,
    name        VARCHAR(100) NOT NULL,
    phone       VARCHAR(20)  NOT NULL,
    PRIMARY KEY (client_id, phone)
);

INSERT INTO client_phones (client_id, name, phone) VALUES
    (1, 'Иванов', '123-45-67'),
    (1, 'Иванов', '890-12-34'),
    (2, 'Петров', '555-55-55');

SELECT * FROM client_phones ORDER BY client_id, phone;

CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
);

CREATE TABLE order_items (
    order_id   INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products VALUES
    (10, 'Часы'),
    (20, 'Браслет');

INSERT INTO order_items VALUES
    (1, 10, 2),
    (1, 20, 1),
    (2, 10, 1);

SELECT * FROM products;
SELECT * FROM order_items ORDER BY order_id, product_id;


CREATE TABLE categories (
    category_id   INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    id          INT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories VALUES
    (10, 'Наручные'),
    (20, 'Аксессуары'),
    (30, 'Настенные');

INSERT INTO products VALUES
    (1, 'Часы',      10),
    (2, 'Браслет',   20),
    (3, 'Будильник', 30);

CREATE TABLE manufacturers (
    manufacturer_id INT PRIMARY KEY,
    manufacturer    VARCHAR(100) NOT NULL,
    country         VARCHAR(50)  NOT NULL
);

CREATE TABLE products (
    id              INT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    manufacturer_id INT NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

INSERT INTO manufacturers VALUES
    (1, 'Восток', 'Россия'),
    (2, 'Casio',  'Япония');

INSERT INTO products VALUES
    (1, 'Часы',      1),
    (2, 'Браслет',   2),
    (3, 'Будильник', 1);



CREATE TABLE clients (
    client_id   INT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    client_phone VARCHAR(20) NOT NULL
);

CREATE TABLE categories (
    category_id   INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE manufacturers (
    manufacturer_id INT PRIMARY KEY,
    manufacturer_name VARCHAR(100) NOT NULL,
    country         VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(100) NOT NULL,
    category_id     INT NOT NULL,
    manufacturer_id INT NOT NULL,
    price           NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    FOREIGN KEY (category_id)     REFERENCES categories(category_id),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

CREATE TABLE orders (
    order_id   INT PRIMARY KEY,
    order_date DATE NOT NULL,
    client_id  INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE order_items (
    order_id   INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO clients VALUES
    (1, 'Сидорова', '123-45-67'),
    (2, 'Павлова',  '555-55-55');

INSERT INTO categories VALUES
    (1, 'Детская'),
    (2, 'Женская');

INSERT INTO manufacturers VALUES
    (1, 'Восток', 'Россия'),
    (2, 'Casio',  'Япония');

INSERT INTO products VALUES
    (1, 'Кроссовки', 1, 1, 2190.00),
    (2, 'Сандалии',  1, 2, 2790.00),
    (3, 'Сапоги',    2, 1, 25000.00);

INSERT INTO orders VALUES
    (1, '2026-04-02', 1),
    (2, '2026-04-05', 2);

INSERT INTO order_items VALUES
    (1, 1, 1),
    (1, 2, 1),
    (2, 3, 1);

CREATE TABLE person_hobbies (
    id      INT NOT NULL,
    name    VARCHAR(100) NOT NULL,
    hobby   VARCHAR(50) NOT NULL,
    PRIMARY KEY (id, hobby)
);

INSERT INTO person_hobbies VALUES
    (1, 'Иванов', 'Футбол'),
    (1, 'Иванов', 'Шахматы'),
    (2, 'Петров', 'Плавание');

CREATE TABLE categories (
    category_id   INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id  INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE order_items (
    order_id   INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO categories VALUES
    (1, 'Наручные'),
    (2, 'Аксессуары');

INSERT INTO products VALUES
    (10, 'Часы',    1),
    (20, 'Браслет', 2);

INSERT INTO order_items VALUES
    (1, 10, 2),
    (1, 20, 1),
    (2, 10, 1);

CREATE TABLE clients (
    client_id    INT PRIMARY KEY,
    client_name  VARCHAR(100) NOT NULL,
    client_email VARCHAR(100) NOT NULL UNIQUE,
    client_phone VARCHAR(20)  NOT NULL
);

CREATE TABLE manufacturers (
    manufacturer_id INT PRIMARY KEY,
    manufacturer    VARCHAR(100) NOT NULL,
    country         VARCHAR(50)  NOT NULL
);

CREATE TABLE products (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(100) NOT NULL,
    manufacturer_id INT NOT NULL,
    price           NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

CREATE TABLE orders (
    order_id   INT PRIMARY KEY,
    order_date DATE NOT NULL,
    client_id  INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE order_items (
    order_id   INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO clients VALUES
    (1, 'Сидорова', 'sidorova@mail.ru', '123-45-67'),
    (2, 'Павлова',  'pavlova@mail.ru',  '555-55-55');

INSERT INTO manufacturers VALUES
    (1, 'Восток', 'Россия'),
    (2, 'Casio',  'Япония');

INSERT INTO products VALUES
    (1, 'Кроссовки', 1, 2190.00),
    (2, 'Сандалии',  2, 2790.00),
    (3, 'Сапоги',    1, 25000.00);

INSERT INTO orders VALUES
    (1, '2026-04-02', 1),
    (2, '2026-04-05', 2);

INSERT INTO order_items VALUES
    (1, 1, 1),
    (1, 2, 1),
    (2, 3, 1);


CREATE TABLE room_types (
    room_type_id INT PRIMARY KEY,
    room_type    VARCHAR(50) NOT NULL
);

CREATE TABLE rooms (
    room_id      INT PRIMARY KEY,
    room_number  VARCHAR(10) NOT NULL,
    room_type_id INT NOT NULL,
    FOREIGN KEY (room_type_id) REFERENCES room_types(room_type_id)
);

CREATE TABLE os_vendors (
    vendor_id   INT PRIMARY KEY,
    vendor_name VARCHAR(50) NOT NULL
);

CREATE TABLE operating_systems (
    os_id     INT PRIMARY KEY,
    os_name   VARCHAR(50) NOT NULL,
    vendor_id INT NOT NULL,
    FOREIGN KEY (vendor_id) REFERENCES os_vendors(vendor_id)
);

CREATE TABLE pc_models (
    model_id INT PRIMARY KEY,
    model    VARCHAR(50) NOT NULL,
    cpu      VARCHAR(50) NOT NULL,
    ram_gb   INT NOT NULL CHECK (ram_gb > 0)
);

CREATE TABLE computers (
    inv_id   INT PRIMARY KEY,
    room_id  INT NOT NULL,
    model_id INT NOT NULL,
    os_id    INT NOT NULL,
    FOREIGN KEY (room_id)  REFERENCES rooms(room_id),
    FOREIGN KEY (model_id) REFERENCES pc_models(model_id),
    FOREIGN KEY (os_id)    REFERENCES operating_systems(os_id)
);

INSERT INTO room_types VALUES (1, 'Лаборатория'), (2, 'Класс');
INSERT INTO rooms VALUES (1, '101', 1), (2, '205', 2);
INSERT INTO os_vendors VALUES (1, 'Microsoft');
INSERT INTO operating_systems VALUES (1, 'Windows 11', 1), (2, 'Windows 10', 1);
INSERT INTO pc_models VALUES (1, 'Dell OptiPlex', 'i5-12400', 16),
                             (2, 'HP ProDesk',    'i5-12400', 16);
INSERT INTO computers VALUES (1, 1, 1, 1), (2, 1, 2, 1), (3, 2, 1, 2);
