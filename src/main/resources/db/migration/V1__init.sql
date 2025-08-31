-- ================================
-- SCHEMA CREATION
-- ================================
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    stock INT,
    image_url VARCHAR(255),
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

-- Création de la table Users
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'customer')),
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table Customers (lié à un user)
CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    shipping_address TEXT,
    billing_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ================================
-- INITIAL DATA
-- ================================
INSERT INTO categories (name) VALUES 
('Clothing'),
('Accessories'),
('Fitness'),
('Books'),
('Electronics');

INSERT INTO products (name, description, price, stock, image_url, category_id)
VALUES
('Blue T-Shirt', 'A stylish blue t-shirt', 29.00, 100, 'blue-t-shirt.jpg', 1),
('Bracelet', 'A beautiful bracelet', 15.00, 50, 'bracelet.jpg', 2),
('Blue Band', 'A fitness blue band', 79.00, 30, 'blue-band.jpg', 3),
('Black Watch', 'A sleek black watch', 199.00, 20, 'black-watch.jpg', 4),
('Bamboo Watch', 'An eco-friendly bamboo watch', 65.00, 15, 'bamboo-watch.jpg', 5),
('Bracelet', 'A beautiful bracelet', 15.00, 50, 'bracelet.jpg', 2),
('Blue T-Shirt', 'A stylish blue t-shirt', 29.00, 100, 'blue-t-shirt.jpg', 1),
('Blue Band', 'A fitness blue band', 79.00, 30, 'blue-band.jpg', 3),
('Bamboo Watch', 'An eco-friendly bamboo watch', 65.00, 15, 'bamboo-watch.jpg', 5),
('Black Watch', 'A sleek black watch', 199.00, 20, 'black-watch.jpg', 4);


INSERT INTO users (username, password, role, email) VALUES
('admin', 'admin123', 'admin', 'admin@example.com'),
('user1', 'password1', 'customer', 'user1@example.com'),
('user2', 'password2', 'customer', 'user2@example.com');


INSERT INTO customers (user_id, first_name, last_name, email, phone_number, shipping_address, billing_address)
VALUES
(2, 'John', 'Doe', 'user1@example.com', '0611111111', '10 Customer Road', '10 Customer Road'),
(3, 'Jane', 'Smith', 'user2@example.com', '0622222222', '20 Client Avenue', '20 Client Avenue');