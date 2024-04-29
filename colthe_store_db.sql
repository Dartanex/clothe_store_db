-- CREACION DE LA BASE DE DATOS --
CREATE DATABASE clothe_store_db
    DEFAULT CHARACTER SET = 'utf8mb4';

USE clothe_store_db;

-- CREACION DE TABLAS --

CREATE TABLE products (
  product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(70) NOT NULL,
  description TEXT NOT NULL,
  size ENUM('XS', 'S', 'M', 'L', 'XL','XXL', 'XXXL', 'XXXXL') NOT NULL,
  gender ENUM('hombre', 'mujer', 'ninio', 'ninia'),
  color VARCHAR(15) NOT NULL,
  stock_amount INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

CREATE TABLE customers (
  customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_fullname VARCHAR(50) NOT NULL,
  email VARCHAR(20) NOT NULL,
  address VARCHAR(70) NOT NULL,
  phone VARCHAR(9) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

CREATE TABLE employees (
  employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  employee_fullname VARCHAR(50) NOT NULL,
  position VARCHAR(15) NOT NULL,
  email VARCHAR(20) NOT NULL,
  address VARCHAR(70) NOT NULL,
  phone VARCHAR(9) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

CREATE TABLE sales (
  sale_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  employee_id INT NOT NULL,
  sale_date DATE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON UPDATE CASCADE
);

-- TABLA QUE PERMITIRA AGREGAR UNO O MULTIPLES PRODUCTOS A UNA VENTA --

CREATE TABLE sale_products (
  sale_product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sale_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON UPDATE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(product_id) ON UPDATE CASCADE
);

-- INSERCION DE DATOS A CADA TABLA, SE CREARAN 5 REGISTROS PARA CADA TABLA --

INSERT INTO products (product_name, description, size, gender, color, stock_amount, price)
VALUES  ("VCAY", "Vestido unicolor bajo con fruncido de cuello h alter", "M", "mujer", "Azul", "40", 5.55),
        ("Frenchy", "Camiseta de cuello redondo con ribete de volante bordado de ojales y ribete de encaje", "S", "mujer", "Blanco", "70", 5.95),
        ("JORESS", "Shorts con cinturón de cintura y volante unicolor", "XL", "mujer", "Negro", "45", 7.65),
        ("Manfinity Basic Short", "Short unicolor de cintura con cordón", "XXL", "hombre", "Negro", "100", 9.00),
        ("Camisa Manfinity Homme", "Camisa de hombre con media botonadura y mangas enrolladas", "L", "hombre", "Neblina Azul", "90", 11.90);

INSERT INTO customers (customer_fullname, email, address, phone)
VALUES  ("María Estela Aristides Díaz", "maria.aristides@gmail.com", "Calle el progreso, San Salvador", "1234-5678"),
        ("José Eduardo Ramirez Gonzales", "eduardo.gonzales@outlook.com", "Colonia Monserrat, San Salvador", "9123-4567"),
        ("Isaac Emilio Estrada López", "emilio.estrada@gmail.com", "Calle Antigua Tonacatepeque, Soyapango", "8912-3456"),
        ("Gabriela Alejandra López Díaz", "bagriela.lopez@outlook.com", "Colonia la rabida, San Salvador", "7891-2345"),
        ("Roberto Alonso Suarez Alemán", "roberto.suarez@gmail.com", "Calle la reforma, San Salvador", "6789-1234");

INSERT INTO employees (employee_fullname, position, email, address, phone)
VALUES  ("Adolfo Ramiro Hernández Hurtado", "Conserje", "adolfo.hernandez@gmail.com", "Colonia MiraMonete, San Salvador", "5678-9123"),
        ("Jennifer Alejandra Castillo Moreno", "Cajero", "jennifer.castillo@outlook.com", "Ciudad Arce, La Libertad", "4567-8901"),
        ("Johanna Elena Morales Cruz", "Cajero", "johanna.morales@gmail.com", "Colonia Cierra Morena, Soyapango", "2345-6789"),
        ("Celeste Alejandra Martínez Mendoza", "Dependiente", "celeste.martinez@outlook.com", "Colonia Alta Vista, Ilopango", "0123-4567"),
        ("Nuria Vannesa Artiga Valencia", "Gerente", "nuria.artiga@gmail.com", "Colonia Escalón, San Salvador", "9876-5432");

INSERT INTO sales (customer_id, employee_id, sale_date)
VALUES  (1, 2, "2024-01-12"),
        (2, 2, "2024-01-27"),
        (4,3, "2024-02-4"),
        (5,3, "2024-02-18"),
        (3,2, "2024-02-24");

INSERT INTO sale_products (sale_id, product_id, quantity)
VALUES  (1, 1, 2),
        (1, 2, 1),
        (1, 4, 1),
        (2, 3, 2),
        (3, 5, 1),
        (5, 2, 3),
        (4, 3, 2);