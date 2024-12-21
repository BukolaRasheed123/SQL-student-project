-- Create the database
-- CREATE DATABASE bk_ecommerce_db;

-- Switch to the newly created database (if needed)
-- USE bk_ecommerce_db;

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
    product_id INT REFERENCES Products(product_id) ON UPDATE CASCADE ON DELETE CASCADE,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);


-- Populate the tables 

INSERT INTO customers (name, email, phone_number, address) VALUES 
('Leroy Schmitt', 'leroyschmitt@gmail.com', '(+234)703-278-3375', '655 Hernandez Wells, Lake Robertborough, Nevada'),
('Kerri Schmitt', 'kerrischmitt@gmail.com', '(+234)814-575-9377', '687 Kimberly Green, Ericside, New Mexico'),
('Tamara Phillips', 'tamaraphillips@gmail.com', '(+234)703-172-1431', '832 Johnson Curve, Robertsburgh, Tennessee'),
('Priscilla Osborne', 'priscillaosborne@gmail.com', '(+234)803-264-8910', '355 Miller Ferry, New Meredith, Louisiana'),
('Dr. Kristin Hinton', 'dr.kristinhinton@gmail.com', '(+234)703-281-6200', '274 Hernandez Union, East David, Nebraska'),
('Mary Daniels', 'marydaniels@gmail.com', '(+234)803-594-9491', '642 Michael Club, Port Deborahberg, New York'),
('Tina Collins', 'tinacollins@gmail.com', '(+234)814-647-5748', '521 Michael Points, North Becky, Rhode Island'),
('Jeanette Hamilton DVM', 'jeanettehamiltondvm@gmail.com', '(+234)706-517-6537', '498 Ronald Tunnel, East Amy, Florida'),
('Michael Mcdonald', 'michaelmcdonald@gmail.com', '(+234)813-112-9952', '635 Rosales Route, North John, North Dakota'),
('Megan Mcconnell', 'meganmcconnell@gmail.com', '(+234)814-852-8026', '128 Hess Motorway, Rachelfort, Arkansas'),
('Linda Silva', 'lindasilva@gmail.com', '(+234)703-128-7161', '647 Ross Motorway, New Michele, Tennessee'),
('Jose Hines Jr.', 'josehinesjr.@gmail.com', '(+234)706-815-5565', '308 Gregory Mission, Port Christophermouth, Hawaii'),
('Christopher Johnson', 'christopherjohnson@gmail.com', '(+234)813-956-9173', '288 Wilson Tunnel, Port Savannahville, Oregon'),
('Nancy Parrish', 'nancyparrish@gmail.com', '(+234)813-782-6972', '162 Monique Coves, Millermouth, Alaska');

INSERT INTO products (product_id, product_name,category,price,stock_quantity) VALUES 
(101, 'Smart TV', 'Electronics', 555, 73), (102, 'Coffee Maker', 'Appliances', 346, 31), (103, 'Air Purifier', 'Appliances', 383, 71),
(104, 'Vacuum Cleaner', 'Appliances', 631, 49), (105, 'Drone', 'Electronics', 568, 51), (106, '3D Printer', 'Electronics', 518, 95),
(107, 'Electric Scooter', 'Vehicles', 987, 43), (108, 'Wireless Charger', 'Accessories', 707, 72), (109, 'Noise Cancelling Earbuds', 'Audio', 405, 69),
(110, 'Standing Desk', 'Furniture', 387, 91);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES 
(5001, 6, '2025-12-16 08:02:04', 3837), (5002, 6, '2025-05-30 08:02:04', 7074), (5003, 12, '2026-08-09 08:02:04', 5471),
(5004, 2, '2025-11-04 08:02:04', 1018), (5005, 7, '2025-02-22 08:02:04', 4954), (5006, 1, '2026-08-24 08:02:04', 4481),
(5007, 3, '2026-04-03 08:02:04', 4935), (5008, 5, '2026-04-05 08:02:04', 3701), (5009, 7, '2025-02-12 08:02:04', 6764),
(5010, 2, '2025-06-09 08:02:04', 7640), (5011, 6, '2026-09-27 08:02:04', 4113), (5012, 14, '2025-11-17 08:02:04', 5638),
(5013, 6, '2026-05-10 08:02:04', 7393), (5014, 5, '2025-08-30 08:02:04', 5485), (5015, 13, '2025-07-21 08:02:04', 3204),
(5016, 5, '2025-04-22 08:02:04', 5833), (5017, 2, '2025-11-21 08:02:04', 5287), (5018, 14, '2025-06-09 08:02:04', 6122),
(5019, 7, '2025-10-10 08:02:04', 4103), (5020, 1, '2025-12-22 08:02:04', 4836), (5021, 4, '2024-11-27 08:02:04', 3172),
(5022, 11, '2025-05-16 08:02:04', 3528), (5023, 3, '2026-04-02 08:02:04', 3409), (5024, 6, '2026-07-31 08:02:04', 2574);
   

      
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price) VALUES 
(9001, 5001, 108, 3, 707), (9002, 5001, 110, 3, 387), (9003, 5001, 101, 1, 555), (9004, 5002, 105, 2, 568), (9005, 5002, 102, 2, 346),
(9006, 5002, 106, 2, 518), (9007, 5002, 104, 1, 631), (9008, 5002, 109, 3, 405), (9009, 5002, 109, 2, 405), (9010, 5002, 106, 3, 518),
(9011, 5003, 109, 3, 405), (9012, 5003, 106, 2, 518), (9013, 5003, 106, 1, 518), (9014, 5003, 109, 1, 405), (9015, 5003, 110, 3, 387),
(9016, 5003, 105, 1, 568), (9017, 5003, 105, 1, 568), (9018, 5004, 104, 1, 631), (9019, 5004, 110, 1, 387), (9020, 5005, 105, 1, 568),
(9021, 5005, 110, 1, 387), (9022, 5005, 107, 3, 987), (9023, 5005, 102, 3, 346), (9024, 5006, 101, 3, 555), (9025, 5006, 109, 1, 405),
(9026, 5006, 103, 3, 383), (9027, 5006, 104, 2, 631), (9028, 5007, 107, 3, 987), (9029, 5007, 107, 1, 987), (9030, 5007, 107, 1, 987),
(9031, 5008, 102, 1, 346), (9032, 5008, 102, 3, 346), (9033, 5008, 109, 2, 405), (9034, 5008, 102, 1, 346), (9035, 5008, 110, 3, 387),
(9036, 5009, 107, 3, 987), (9037, 5009, 108, 1, 707), (9038, 5009, 105, 3, 568), (9039, 5009, 109, 1, 405), (9040, 5009, 107, 1, 987),
(9041, 5010, 107, 2, 987), (9042, 5010, 103, 3, 383), (9043, 5010, 102, 3, 346), (9044, 5010, 106, 1, 518), (9045, 5010, 107, 3, 987),
(9046, 5011, 101, 3, 555), (9047, 5011, 108, 1, 707), (9048, 5011, 101, 2, 555), (9049, 5011, 104, 1, 631), (9050, 5012, 102, 1, 346),
(9051, 5012, 103, 3, 383), (9052, 5012, 105, 2, 568), (9053, 5012, 106, 1, 518), (9054, 5012, 109, 2, 405), (9055, 5012, 106, 1, 518),
(9056, 5012, 110, 3, 387), (9057, 5013, 105, 1, 568), (9058, 5013, 106, 3, 518), (9059, 5013, 110, 3, 387), (9060, 5013, 103, 3, 383),
(9061, 5013, 107, 3, 987), (9062, 5014, 107, 1, 987), (9063, 5014, 107, 2, 987), (9064, 5014, 104, 1, 631), (9065, 5014, 104, 3, 631),
(9066, 5015, 105, 1, 568), (9067, 5015, 102, 3, 346), (9068, 5015, 103, 1, 383), (9069, 5015, 109, 3, 405), (9070, 5016, 110, 2, 387),
(9071, 5016, 108, 3, 707), (9072, 5016, 102, 3, 346), (9073, 5016, 106, 3, 518), (9074, 5016, 102, 1, 346), (9075, 5017, 110, 2, 387),
(9076, 5017, 102, 1, 346), (9077, 5017, 106, 2, 518), (9078, 5017, 105, 1, 568), (9079, 5017, 103, 3, 383), (9080, 5017, 108, 2, 707),
(9081, 5018, 108, 1, 707), (9082, 5018, 110, 3, 387), (9083, 5018, 104, 1, 631), (9084, 5018, 102, 2, 346), (9085, 5018, 109, 2, 405),
(9086, 5018, 108, 3, 707), (9087, 5019, 105, 1, 568), (9088, 5019, 108, 2, 707), (9089, 5019, 108, 3, 707), (9090, 5020, 105, 3, 568),
(9091, 5020, 110, 3, 387), (9092, 5020, 109, 2, 405), (9093, 5020, 110, 3, 387), (9094, 5021, 104, 2, 631), (9095, 5021, 110, 2, 387),
(9096, 5021, 105, 2, 568), (9097, 5022, 104, 1, 631), (9098, 5022, 103, 3, 383), (9099, 5022, 103, 1, 383), (9100, 5022, 109, 2, 405),
(9101, 5022, 101, 1, 555), (9102, 5023, 110, 3, 387), (9103, 5023, 102, 3, 346), (9104, 5023, 102, 2, 346), (9105, 5023, 106, 1, 518),
(9106, 5024, 103, 2, 383), (9107, 5024, 110, 1, 387), (9108, 5024, 103, 1, 383), (9109, 5024, 102, 3, 346);

   
   
   
   
   
 