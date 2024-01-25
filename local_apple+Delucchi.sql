-- Crear base de datos
CREATE DATABASE apple_store_la_plata_bs_as;



-- Usar la base de datos
USE apple_store_la_plata_bs_as;



-- Crear tabla clientes
CREATE TABLE IF NOT EXISTS clientes(
id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
pasaporte VARCHAR(20) UNIQUE,
cuit_cuil CHAR(11) UNIQUE,
primer_nombre VARCHAR(35) NOT NULL,
segundo_nombre VARCHAR(35),
apellido VARCHAR(35) NOT NULL,
fecha_nacimiento DATE NOT NULL,
telefono BIGINT NOT NULL,
email VARCHAR(50) NOT NULL
);

-- Crear tabla ciudades
CREATE TABLE IF NOT EXISTS ciudades(
id_ciudad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
provincia VARCHAR(20) NOT NULL,
pais VARCHAR(20) NOT NULL,
codigo_postal VARCHAR(15) NOT NULL
);

-- Crear tabla sucursales
CREATE TABLE IF NOT EXISTS sucursales(
id_sucursal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(35) NOT NULL,
direccion VARCHAR(50) NOT NULL,
id_ciudad INT NOT NULL,
FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad)
);

-- Crear tabla empleados
CREATE TABLE IF NOT EXISTS empleados(
id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dni CHAR(8) NOT NULL UNIQUE,
primer_nombre VARCHAR(35) NOT NULL,
segundo_nombre VARCHAR(35),
apellido VARCHAR(35) NOT NULL,
fecha_nacimiento DATE NOT NULL,
telefono BIGINT NOT NULL,
email VARCHAR(50) NOT NULL,
fecha_ingreso DATE NOT NULL,
id_sucursal INT NOT NULL,
FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Crear tabla productos
CREATE TABLE IF NOT EXISTS productos(
id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
marca VARCHAR(20) NOT NULL,
descripcion TEXT(200) NOT NULL,
precio NUMERIC(10, 2) NOT NULL
);

-- Crear tabla stock
CREATE TABLE IF NOT EXISTS stock(
id_stock INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_producto INT NOT NULL,
stock INT NOT NULL,
id_sucursal INT NOT NULL,
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Crear tabla equipos
CREATE TABLE IF NOT EXISTS equipos(
id_equipo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_ingreso DATE NOT NULL,
equipo VARCHAR(30) NOT NULL,
serial VARCHAR(20) NOT NULL,
almacenamiento VARCHAR(10) NOT NULL,
estado VARCHAR(10) NOT NULL,
condicion VARCHAR(10) NOT NULL,
color VARCHAR(20) NOT NULL,
precio NUMERIC(6, 2) NOT NULL
);

-- Crear tabla vendedores
CREATE TABLE IF NOT EXISTS vendedores(
id_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_comienzo DATE NOT NULL,
id_empleado INT NOT NULL,
id_sucursal INT NOT NULL,
FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Crear tabla tecnicos
CREATE TABLE IF NOT EXISTS tecnicos(
id_tecnico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_comienzo DATE NOT NULL,
id_empleado INT NOT NULL,
id_sucursal INT NOT NULL,
FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Crear tabla servicios
CREATE TABLE IF NOT EXISTS servicios(
id_servicio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
precio NUMERIC(9, 2) NOT NULL,
id_tecnico INT,
FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico)
);

-- Crear tabla ventas de productos
CREATE TABLE IF NOT EXISTS venta_productos(
id_venta_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha DATE NOT NULL,
id_vendedor INT NOT NULL,
id_cliente INT NOT NULL,
id_producto INT NOT NULL,
cantidad INT NOT NULL,
monto NUMERIC(9, 2) NOT NULL,
id_sucursal INT NOT NULL,
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Crear tabla ventas de equipos
CREATE TABLE IF NOT EXISTS venta_equipos(
id_venta_equipo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha DATE NOT NULL,
id_vendedor INT NOT NULL,
id_cliente INT NOT NULL,
id_equipo INT NOT NULL,
cantidad INT NOT NULL,
monto NUMERIC(9, 2) NOT NULL,
id_sucursal INT NOT NULL,
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo),
FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);



-- Ver tabla clientes
SELECT * FROM clientes;

-- Ver tabla ciudades
SELECT * FROM ciudades;

-- Ver tabla sucursales
SELECT * FROM sucursales;

-- Ver tabla empleados
SELECT * FROM empleados;

-- Ver tabla productos
SELECT * FROM productos;

-- Ver tabla stock
SELECT * FROM stock;

-- Ver tabla equipos
SELECT * FROM equipos;

-- Ver tabla vendedores
SELECT * FROM vendedores;

-- Ver tabla tecnicos
SELECT * FROM tecnicos;

-- Ver tabla servicios
SELECT * FROM servicios;

-- Ver tabla ventas de productos
SELECT * FROM venta_productos;

-- Ver tabla ventas de equipos
SELECT * FROM venta_equipos;



-- Eliminar base de datos
DROP DATABASE apple_store_la_plata_bs_as;