-- ================================
-- SCHEMA CREATION
-- ================================
CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    stock INT,
    image_url VARCHAR(255),
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'customer')),
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS customers (
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
INSERT INTO categories (name, created_at, updated_at) VALUES 
('Clothing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Accessories', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Fitness', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Books', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Electronics', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO products (name, description, price, stock, image_url, category_id, created_at, updated_at)
VALUES
('Blue T-Shirt', 'A stylish blue t-shirt', 29.00, 100, 'blue-t-shirt.jpg', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Bracelet', 'A beautiful bracelet', 15.00, 50, 'bracelet.jpg', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Blue Band', 'A fitness blue band', 79.00, 30, 'blue-band.jpg', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Black Watch', 'A sleek black watch', 199.00, 20, 'black-watch.jpg', 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Bamboo Watch', 'An eco-friendly bamboo watch', 65.00, 15, 'bamboo-watch.jpg', 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Mots de passe hashés avec BCrypt
-- admin123 -> $2a$10$7qS0rXvYtq8YvU3pC/8v1O0jwD9Q5QvU42CJk3w/7pG.yFj8QvKzK
-- password1 -> $2a$10$T0PjFpmqOtN2hCipXjF0E.1k1HP3LExOZ0BzL3qH7YqLx5f1B8Z12
-- password2 -> $2a$10$1L5F8wq0rVjYpO3bK4lT.eK2sD3m9PQr2BvC1gYvE7rM.zxQvC9QK

INSERT INTO users (username, password, role, email, created_at, updated_at) VALUES
('admin', '$2a$10$7qS0rXvYtq8YvU3pC/8v1O0jwD9Q5QvU42CJk3w/7pG.yFj8QvKzK', 'admin', 'admin@example.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user1', '$2a$10$T0PjFpmqOtN2hCipXjF0E.1k1HP3LExOZ0BzL3qH7YqLx5f1B8Z12', 'customer', 'user1@example.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user2', '$2a$10$1L5F8wq0rVjYpO3bK4lT.eK2sD3m9PQr2BvC1gYvE7rM.zxQvC9QK', 'customer', 'user2@example.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO customers (user_id, first_name, last_name, email, phone_number, shipping_address, billing_address, created_at, updated_at)
VALUES
(2, 'John', 'Doe', 'user1@example.com', '0611111111', '10 Customer Road', '10 Customer Road', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Jane', 'Smith', 'user2@example.com', '0622222222', '20 Client Avenue', '20 Client Avenue', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
