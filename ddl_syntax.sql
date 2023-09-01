-- Table Products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR NOT NULL,
    list_price INT NOT NULL,
    stock INT NOT NULL,
    product_description VARCHAR,
    exp_date DATE
);
 
-- Table Customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR NOT NULL,
    phone_number VARCHAR
);
 
-- Table Employee
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR,
    email VARCHAR NOT NULL,
    phone_number VARCHAR,
    hire_date DATE NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id)
);
 
-- Table Stores
CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR NOT NULL,
    web_address VARCHAR,
    physical_address VARCHAR NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL
);
 
-- Table Orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_datetime TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    customer_id INT,
    store_id INT,
    employee_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    FOREIGN KEY(store_id)
        REFERENCES stores(store_id),
    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);
 
-- Table Order_Items
CREATE TABLE order_items (
    order_id INT NOT NULL,
    line_item_id INT NOT NULL,
    product_id INT,
    quantity INT CHECK ((quantity > 0)),
    unit_price INT NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id),
    PRIMARY KEY(order_id, line_item_id)
);