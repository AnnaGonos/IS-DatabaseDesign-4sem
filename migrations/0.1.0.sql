CREATE TABLE IF NOT EXISTS customer (
  customer_id INT PRIMARY KEY,
  password VARCHAR(30),
  email VARCHAR(100),
  full_name VARCHAR(100),
  address VARCHAR(50),
  birth_date DATE,
  registration_date DATE
);


CREATE TABLE IF NOT EXISTS customer_phone (
  phone VARCHAR(30) PRIMARY KEY NOT NULL,
  customer_id INT NOT NULL REFERENCES customer(customer_id)
);


CREATE TABLE IF NOT EXISTS positions (
  position_id INT PRIMARY KEY,
  position_name pos,
  salary DECIMAL(10,2)
);


CREATE TABLE IF NOT EXISTS bank_card (
  customer_id INT NOT NULL REFERENCES customer(customer_id),
  card_number VARCHAR(16) PRIMARY KEY NOT NULL,
  cardholder_name VARCHAR(255) NOT NULL,
  verification_code VARCHAR(3) NOT NULL,
  expiration_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS category (
  category_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS subcategory (
  subcategory_id INT NOT NULL PRIMARY KEY,
  category_id INT NOT NULL REFERENCES category(category_id),
  name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS product (
  product_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50),
  price DECIMAL(10,2) NOT NULL,
  subcategory_id INT NOT NULL REFERENCES subcategory(subcategory_id),
  weight DECIMAL(10,2) NOT NULL,
  length DECIMAL(10,2) NOT NULL,
  width DECIMAL(10,2) NOT NULL,
  height DECIMAL(10,2) NOT NULL,
  image VARCHAR(255),
  description TEXT,
  return_product BOOL,
  warranty INT
);

CREATE TABLE IF NOT EXISTS product_rating (
  product_id INT NOT NULL,
  customer_id INT NOT NULL REFERENCES customer(customer_id),
  rating DECIMAL(2,1),
  PRIMARY KEY (product_id, customer_id) 
);

CREATE TABLE IF NOT EXISTS pickup_points (
  pickup_point_id INT PRIMARY KEY,
  address VARCHAR(50),
  working_hours DATE
);

CREATE TABLE IF NOT EXISTS pickup_point_phone (
  phone VARCHAR(30) NOT NULL PRIMARY KEY,
  pickup_point_id INT NOT NULL REFERENCES pickup_points(pickup_point_id)
);


CREATE TABLE IF NOT EXISTS employees (
  employee_id INT NOT NULL PRIMARY KEY,
  position_id INT NOT NULL REFERENCES positions(position_id),
  full_name VARCHAR(100),
  passport_data VARCHAR(255),
  date_of_birth DATE,
  inn VARCHAR(12),
  gender VARCHAR(1),
  phone VARCHAR(30),
  address VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS orders (
  order_number INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  order_date DATE NOT NULL,
  order_statuses order_status NOT NULL,
  order_cost DECIMAL(10,2) NOT NULL,
  payment_methods payment_method NOT NULL,
  customer_id INT NOT NULL REFERENCES customer(customer_id),
  employee_id INT NOT NULL REFERENCES employees(employee_id)
);

CREATE TABLE IF NOT EXISTS delivery (
  order_number INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  total_weight DECIMAL(10,2),
  total_volume DECIMAL(10,2),
  delivery_date DATE,
  delivery_time TIME,
  address VARCHAR(50),
  delivery_cost DECIMAL(10,2),
  employee_id INT REFERENCES employees(employee_id),
  delivery_statuses delivery_status,
  delivery_types delivery_type,
  FOREIGN KEY (order_number) REFERENCES orders(order_number)
);



-- заказы в пункте выдачи
CREATE TABLE IF NOT EXISTS order_pickup (
  order_number INT PRIMARY KEY,
  pickup_point_id INT NOT NULL,
  storage_period DATE,
  FOREIGN KEY (order_number) REFERENCES orders(order_number),
  FOREIGN KEY (pickup_point_id) REFERENCES pickup_points(pickup_point_id)
);


-- товары в заказе
CREATE TABLE IF NOT EXISTS order_items (
  catalog_product_id INT NOT NULL PRIMARY KEY,
  order_number INT NOT NULL REFERENCES orders(order_number),
  product_id INT NOT NULL REFERENCES product(product_id)
);



