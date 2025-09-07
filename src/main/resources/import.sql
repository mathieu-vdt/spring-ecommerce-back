-- Categories
INSERT INTO categories(name, created_at, updated_at) VALUES ('Clothing', datetime('now'), datetime('now'));
INSERT INTO categories(name, created_at, updated_at) VALUES ('Accessories', datetime('now'), datetime('now'));
INSERT INTO categories(name, created_at, updated_at) VALUES ('Fitness', datetime('now'), datetime('now'));
INSERT INTO categories(name, created_at, updated_at) VALUES ('Books', datetime('now'), datetime('now'));
INSERT INTO categories(name, created_at, updated_at) VALUES ('Electronics', datetime('now'), datetime('now'));
INSERT INTO categories(name, created_at, updated_at) VALUES ('Shoes', datetime('now'), datetime('now'));

-- Products
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Nike Mercurial Superfly 360', 'The Nike Mercurial Superfly 360 Elite FG Soccer Shoe has 20 years of innovation at its back, Mercurial is the boot-of-choice for the fastest players in the game. Superfly 360 was designed to eliminate unwanted movement, with Flyknit construction that wraps the entire foot, and a sockliner that interlocks with a new internal structure for maximum response.', 370.00, 5, 'https://spring-ecommerce-back.onrender.com/api/files/p2-nike-black-lux-pack.jpg', 6, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Calvin Klein Sport Multi-Function Black Dial Stainless Steel Analog Wa – The Watch Factory ®', 'A Brand That Is Synonymous To Uber Fashion And Luxury Leaves No Stone Unturned To Carve A Niche For Itself In The Watch Industry. Founded In 1968 By Calvin Klein And Barry Schwartz, Calvin Klein Is A Global Lifestyle Brand That Strives For Excellence With Its Exemplary Design And Cutting-Edge Technology.', 187.05, 50, 'https://spring-ecommerce-back.onrender.com/api/files/Calvin_Klein_Sport.jpg', 2, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Gucci Black Quilted Leather GG Marmont Small Matelasse Shoulder Bag', 'This gorgeous and softly structured Gucci Black Quilted Leather GG Marmont Shoulder Bag is an ideal accessory! This particular bag features signature quilted leather with a interlocking G logo at the front flap and embroidered heart on the rear. The adjustable chain strap allows you to carry this bag over your shoulder, crossbody or in the crook over your arm. The exterior leather is clean and beautiful throughout with light scuff marks to the bottom corner edges. The interior lining remains clean and is overall in excellent condition.', 1980.00, 20, 'https://spring-ecommerce-back.onrender.com/api/files/gucci_bag.jpg', 2, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Rolex Submariner 40mm - 2 Tons Black', 'Black stainless steel case Geometric dial Arrow hands Logo detail Counting bezel Screw-down crown Round case Stainless steel bracelet Buckle clasp Day and date display Condition: EXCELLENT. This pre-owned item is in near-perfect condition and shows no signs of wear.', 9.9450, 20, 'https://spring-ecommerce-back.onrender.com/api/files/rolex_watch.jpg', 2, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('LA TRAINER LUX Shoes', "Step into the '80s with the adidas LA TRAINER LUX shoes. A master mix of textile and suede, the upper features silver serrated 3-Stripes to create a retro-futuristic look. Underneath, a rubber outsole offers extra grip.", 48.00, 100, 'https://spring-ecommerce-back.onrender.com/api/files/adidas_shoes.jpg', 6, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Adidas Originals Trefoil Hoodie', 'The adidas Originals Trefoil Hoodie is a classic pullover hoodie that combines comfort and style. Made from soft cotton fleece, it features the iconic Trefoil logo on the front, ribbed cuffs and hem for a snug fit, and a spacious kangaroo pocket. Perfect for casual wear or layering during colder months.', 60.00, 75, 'https://spring-ecommerce-back.onrender.com/api/files/adidas-trefoil-hoodie.jpg', 1, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Ray-Ban Wayfarer Sunglasses', 'Ray-Ban Wayfarer Sunglasses are a timeless accessory known for their distinctive trapezoidal frame and high-quality lenses. Crafted from durable acetate, these sunglasses offer 100% UV protection and come in various colors and lens options. Ideal for both casual and formal occasions, they provide a perfect blend of style and functionality.', 150.00, 40, 'https://spring-ecommerce-back.onrender.com/api/files/ray-ban-meta-wayfarer-noir.jpg', 2, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Fitbit Charge 5', 'The Fitbit Charge 5 is a sleek and advanced fitness tracker designed to help you monitor your health and stay active. It features a vibrant AMOLED display, built-in GPS, heart rate monitoring, sleep tracking, and stress management tools. With its long battery life and water-resistant design, the Charge 5 is perfect for all-day wear and various activities.', 130.00, 60, 'https://spring-ecommerce-back.onrender.com/api/files/Fitbit_Charge_5.jpg', 5, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Apple AirPods Pro (2nd Generation)', 'Apple AirPods Pro (2nd Generation) are wireless earbuds that offer active noise cancellation, transparency mode, and a customizable fit with three sizes of silicone tips. They feature improved sound quality, spatial audio with dynamic head tracking, and a new H2 chip for enhanced performance. The earbuds are sweat and water-resistant, making them ideal for workouts and daily use.', 249.00, 80, 'https://spring-ecommerce-back.onrender.com/api/files/airpods-pro-2.jpg', 5, datetime('now'), datetime('now'));
INSERT INTO products(name, description, price, stock, image_url, category_id, created_at, updated_at) VALUES ('Sony WH-1000XM4 Wireless Noise-Canceling Headphones', 'The Sony WH-1000XM4 Wireless Noise-Canceling Headphones are premium over-ear headphones that deliver exceptional sound quality and industry-leading noise cancellation. They feature adaptive sound control, touch sensor controls, and up to 30 hours of battery life. With support for high-resolution audio and a comfortable design, these headphones are perfect for music lovers and frequent travelers.', 349.99, 30, 'https://spring-ecommerce-back.onrender.com/api/files/sony_headphones.jpg', 5, datetime('now'), datetime('now'));

-- Users (BCrypt passwords)
INSERT INTO users(username, password, role, email, created_at, updated_at) VALUES ('admin', '$2a$10$V3xwkCgNvXmtyeTNb6dVa.dBlqhI3syfqqjfXq4OClpf6Dta8dKPu', 'ADMIN', 'admin@example.com', datetime('now'), datetime('now'));  -- password: admin123
INSERT INTO users(username, password, role, email, created_at, updated_at) VALUES ('user1', '$2a$10$LPZVfjCvPGVZDAzek0l4IOND12MLr9rEjeXrxgN4taSUXyjTai0p2', 'CUSTOMER', 'user1@example.com', datetime('now'), datetime('now')); -- password: password1
INSERT INTO users(username, password, role, email, created_at, updated_at) VALUES ('user2', '$2a$10$RU79N9nxCd9jbkiyq6PjoeTDX/xfsARu0STinKzAKJ6WQrrKh8Nq.', 'CUSTOMER', 'user2@example.com', datetime('now'), datetime('now')); -- password: password2

-- Customers
INSERT INTO customers(user_id, first_name, last_name, email, phone_number, shipping_address, billing_address, created_at, updated_at) VALUES (2, 'John', 'Doe', 'user1@example.com', '0611111111', '10 Customer Road', '10 Customer Road', datetime('now'), datetime('now'));
INSERT INTO customers(user_id, first_name, last_name, email, phone_number, shipping_address, billing_address, created_at, updated_at) VALUES (3, 'Jane', 'Smith', 'user2@example.com', '0622222222', '20 Client Avenue', '20 Client Avenue', datetime('now'), datetime('now'));

-- =========================
-- ORDERS (IDs forcés 1..8)
-- =========================
-- Colonnes: id, customer_id, total, status
-- created_at / updated_at seront remplis par @PrePersist/@PreUpdate

INSERT INTO orders (id, customer_id, total, status, created_at, updated_at) VALUES (1, 1, 466.00, 'Delivered', datetime('now', '-2 days'), datetime('now', '-2 days')), (2, 2, 210.00, 'Delivered', datetime('now', '-1 days'), datetime('now', '-1 days')), (3, 1, 598.99, 'Shipped', datetime('now', '-4 days'), datetime('now', '-4 days')), (4, 2, 178.00, 'Delivered', datetime('now', '-2 days'), datetime('now', '-2 days')), (5, 1, 1980.00, 'Delivered', datetime('now', '-2 days'), datetime('now', '-2 days')), (6, 2, 337.05, 'Pending', datetime('now', '-1 days'), datetime('now', '-1 days')), (7, 1, 168.00, 'Pending', datetime('now'), datetime('now')), (8, 2, 249.00, 'Pending', datetime('now'), datetime('now'));

-- =========================
-- ORDER ITEMS
-- =========================
-- Colonnes: order_id, product_id, quantity, price (prix unitaire)
-- Rappels produits (IDs d’après tes inserts produits):
--  1: Nike Mercurial (370.00)
--  2: Calvin Klein Watch (187.05)
--  3: Gucci Marmont Bag (1980.00)
--  5: LA TRAINER LUX Shoes (48.00)
--  6: Adidas Trefoil Hoodie (60.00)
--  7: Ray-Ban Wayfarer (150.00)
--  8: Fitbit Charge 5 (130.00)
--  9: AirPods Pro 2 (249.00)
-- 10: Sony WH-1000XM4 (349.99)

-- Order 1 total 466.00 → 2×(48.00) + 1×(370.00)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (1, 5, 2,  48.00), (1, 1, 1, 370.00);

-- Order 2 total 210.00 → 1×(150.00) + 1×(60.00)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (2, 7, 1, 150.00), (2, 6, 1,  60.00);

-- Order 3 total 598.99 → 1×(249.00) + 1×(349.99)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (3, 9,  1, 249.00), (3, 10, 1, 349.99);

-- Order 4 total 178.00 → 1×(130.00) + 1×(48.00)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (4, 8, 1, 130.00), (4, 5, 1,  48.00);

-- Order 5 total 1980.00 → 1×(1980.00)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (5, 3, 1, 1980.00);

-- Order 6 total 337.05 → 1×(187.05) + 1×(150.00)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (6, 2, 1, 187.05), (6, 7, 1, 150.00);

-- Order 7 total 168.00 → 2×(60.00) + 1×(48.00)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (7, 6, 2,  60.00), (7, 5, 1,  48.00);

-- Order 8 total 249.00 → 1×(249.00)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (8, 9, 1, 249.00);
