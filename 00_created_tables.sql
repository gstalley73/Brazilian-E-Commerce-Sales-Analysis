CREATE TABLE Customers(
customer_id TEXT PRIMARY KEY,
customer_unique_id TEXT,
customer_zip_code_prefix INTEGER,
customer_city TEXT,
customer_state TEXT
);


CREATE TABLE Products(
product_id TEXT PRIMARY KEY,
product_category_name TEXT,
product_name_lenght INTEGER,
product_description_lenght INTEGER,
product_photos_qty INTEGER,
product_weight_g INTEGER,
product_length_cm INTEGER,
product_height_cm INTEGER,
product_width_cm INTEGER
);

CREATE TABLE Orders (
order_id TEXT PRIMARY KEY,
customer_id TEXT,
order_status TEXT,
order_purchase_timestamp DATETIME,
order_approved_at DATETIME,
order_delivered_carrier_date DATETIME,
order_delivered_customer_date DATETIME,
order_estimated_delivery_date DATETIME,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_items (
order_id TEXT,
order_item_id INTEGER,
product_id TEXT,
seller_id TEXT,
shipping_limit_date DATETIME,
price REAL,
freight_value REAL,
PRIMARY KEY (order_id, order_item_id),
FOREIGN KEY (order_id) REFERENCES Orders(order_id)
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Order_payments(
order_id TEXT,
payment_sequential INTEGER,
payment_type TEXT,
payment_installments INTEGER,
payment_value REAL,
FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);






