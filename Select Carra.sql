DROP DATABASE IF EXISTS tienda_practica;
CREATE DATABASE tienda_practica CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tienda_practica;

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
fecha_registro DATE NOT NULL
);

CREATE TABLE productos (
id_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
categoria VARCHAR(50) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
stock INT NULL
);
CREATE TABLE pedidos (
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
fecha DATETIME NOT NULL,
total DECIMAL(10,2) NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

INSERT INTO clientes (nombre, apellido, email, fecha_registro) VALUES
('Martín', 'Mendoza', 'martin.mendoza@email.com', '2024-01-15'),
('María', 'Gómez', 'maria.gomez@email.com', '2024-02-01'),
('Lucas', 'Martínez', 'lucas.martinez@email.com', '2024-02-20'),
('Ana', 'López', 'ana.lopez@email.com', '2024-03-05'),
('Gonzalo', 'Pérez', 'gonzalo.perez@email.com', '2024-03-12'),
('Soledad', 'Benítez', 'soledad.benitez@email.com', '2024-04-01');

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Notebook Pro 15', 'Notebooks', 185000.00, 10),
('Notebook Lite 14', 'Notebooks', 120000.00, 15),
('Mouse Inalámbrico', 'Accesorios', 15000.00, 50),
('Teclado Mecánico', 'Accesorios', 35000.00, 25),
('Monitor 24 FHD', 'Monitores', 95000.00, 8),
('Monitor 27 4K', 'Monitores', 160000.00, NULL),
('Auriculares Bluetooth', 'Accesorios', 28000.00, 30),
('Base Cooler Notebook', 'Accesorios', 18000.00, 12);

INSERT INTO pedidos (id_cliente, fecha, total) VALUES
(1, '2024-03-01 10:30:00', 185000.00),
(1, '2024-03-15 14:20:00', 15000.00),
(2, '2024-03-18 11:00:00', 120000.00),
(3, '2024-03-20 16:45:00', 130000.00),
(4, '2024-03-22 09:15:00', 35000.00);

select nombre, precio from productos where categoria ="notebooks";
select apellido from clientes where apellido like "%ez" or apellido like "M%";
select nombre, precio from productos where precio between "50000" and "150000";
select categoria, count(*) as total_productos, avg (precio) as precio_promedio from productos group by categoria;
select categoria, count(*) as total_productos, avg (precio) as precio_promedio from productos group by categoria having count(*)>3 and avg(precio)<30000;

select p. *, c. nombre, c. apellido from pedidos p
inner join clientes c on p.id_cliente = c.id_cliente;

select c. id_pedido, c. nombre, c. apellido, p. fecha, p. id_cliente from clientes c
left join pedidos p on p.id_cliente = c.id_cliente;
