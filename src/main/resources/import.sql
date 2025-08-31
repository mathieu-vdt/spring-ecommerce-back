-- Categories
INSERT INTO categories(name, created_at, updated_at) VALUES ('Clothing', datetime('now'), datetime('now'));
INSERT INTO categories(name, created_at, updated_at) VALUES ('Accessories', datetime('now'), datetime('now'));
INSERT INTO categories(name, created_at, updated_at) VALUES ('Fitness', datetime('now'), datetime('now'));
INSERT INTO categories(name, created_at, updated_at) VALUES ('Books', datetime('now'), datetime('now'));
INSERT INTO categories(name, created_at, updated_at) VALUES ('Electronics', datetime('now'), datetime('now'));

-- Products
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Blue T-Shirt', 'A stylish blue t-shirt', 29.00, 100, 'blue-t-shirt.jpg', 1, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Bracelet', 'A beautiful bracelet', 15.00, 50, 'bracelet.jpg', 2, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Blue Band', 'A fitness blue band', 79.00, 30, 'blue-band.jpg', 3, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Black Watch', 'A sleek black watch', 199.00, 20, 'black-watch.jpg', 4, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Bamboo Watch', 'An eco-friendly bamboo watch', 65.00, 15, 'bamboo-watch.jpg', 5, datetime('now'), datetime('now'));

-- Users (BCrypt passwords)
INSERT INTO users(username, password, role, email, created_at, updated_at) VALUES ('admin', '$2a$10$7qS0rXvYtq8YvU3pC/8v1O0jwD9Q5QvU42CJk3w/7pG.yFj8QvKzK', 'ADMIN', 'admin@example.com', datetime('now'), datetime('now'));
INSERT INTO users(username, password, role, email, created_at, updated_at) VALUES ('user1', '$2a$10$T0PjFpmqOtN2hCipXjF0E.1k1HP3LExOZ0BzL3qH7YqLx5f1B8Z12', 'CUSTOMER', 'user1@example.com', datetime('now'), datetime('now'));
INSERT INTO users(username, password, role, email, created_at, updated_at) VALUES ('user2', '$2a$10$1L5F8wq0rVjYpO3bK4lT.eK2sD3m9PQr2BvC1gYvE7rM.zxQvC9QK', 'CUSTOMER', 'user2@example.com', datetime('now'), datetime('now'));

-- Customers
INSERT INTO customers(user_id, first_name, last_name, email, phone_number, shipping_address, billing_address, created_at, updated_at) VALUES (2, 'John', 'Doe', 'user1@example.com', '0611111111', '10 Customer Road', '10 Customer Road', datetime('now'), datetime('now'));
INSERT INTO customers(user_id, first_name, last_name, email, phone_number, shipping_address, billing_address, created_at, updated_at) VALUES (3, 'Jane', 'Smith', 'user2@example.com', '0622222222', '20 Client Avenue', '20 Client Avenue', datetime('now'), datetime('now'));
