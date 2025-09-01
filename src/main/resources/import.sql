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
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Black T-Shirt', 'A classic black t-shirt', 25.00, 80, 'black-t-shirt.jpg', 1, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Red T-Shirt', 'A vibrant red t-shirt', 27.00, 90, 'red-t-shirt.jpg', 1, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Leather Wallet', 'A premium leather wallet', 45.00, 40, 'leather-wallet.jpg', 2, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Fitness Tracker', 'A high-tech fitness tracker', 150.00, 25, 'fitness-tracker.jpg', 3, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Smartphone', 'A latest model smartphone', 699.00, 10, 'smartphone.jpg', 5, datetime('now'), datetime('now'));

-- Users (BCrypt passwords)
INSERT INTO users(username, password, role, email, created_at, updated_at) VALUES ('admin', '$2a$10$V3xwkCgNvXmtyeTNb6dVa.dBlqhI3syfqqjfXq4OClpf6Dta8dKPu', 'ADMIN', 'admin@example.com', datetime('now'), datetime('now'));  -- password: admin123
INSERT INTO users(username, password, role, email, created_at, updated_at) VALUES ('user1', '$2a$10$LPZVfjCvPGVZDAzek0l4IOND12MLr9rEjeXrxgN4taSUXyjTai0p2', 'CUSTOMER', 'user1@example.com', datetime('now'), datetime('now')); -- password: password1
INSERT INTO users(username, password, role, email, created_at, updated_at) VALUES ('user2', '$2a$10$RU79N9nxCd9jbkiyq6PjoeTDX/xfsARu0STinKzAKJ6WQrrKh8Nq.', 'CUSTOMER', 'user2@example.com', datetime('now'), datetime('now')); -- password: password2

-- Customers
INSERT INTO customers(user_id, first_name, last_name, email, phone_number, shipping_address, billing_address, created_at, updated_at) VALUES (2, 'John', 'Doe', 'user1@example.com', '0611111111', '10 Customer Road', '10 Customer Road', datetime('now'), datetime('now'));
INSERT INTO customers(user_id, first_name, last_name, email, phone_number, shipping_address, billing_address, created_at, updated_at) VALUES (3, 'Jane', 'Smith', 'user2@example.com', '0622222222', '20 Client Avenue', '20 Client Avenue', datetime('now'), datetime('now'));
