-- Crear base de datos
CREATE DATABASE apple_store_la_plata_bs_as;

-- Usar la base de datos
USE apple_store_la_plata_bs_as;

-- Eliminar base de datos
DROP DATABASE apple_store_la_plata_bs_as;



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
activo BOOLEAN NOT NULL,
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
id_empleado INT NOT NULL UNIQUE,
id_sucursal INT NOT NULL,
FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Crear tabla tecnicos
CREATE TABLE IF NOT EXISTS tecnicos(
id_tecnico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_comienzo DATE NOT NULL,
id_empleado INT NOT NULL UNIQUE,
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

-- Ver tabla técnicos
SELECT * FROM tecnicos;

-- Ver tabla servicios
SELECT * FROM servicios;

-- Ver tabla ventas de productos
SELECT * FROM venta_productos;

-- Ver tabla ventas de equipos
SELECT * FROM venta_equipos;



-- Insertar datos tabla clientes
INSERT INTO clientes
VALUES (NULL, NULL, "2718584787", "Fabiana", NULL, "Marmissolle", "1967-10-07", 2215589286, "oncologa@gmail.com"),
(NULL, NULL, "20144638531", "Gustavo", "Alfredo", "Delucchi", "1961-05-16", 2214389500, "elpsi@me.com"),
(NULL, NULL, "27417055717", "Melina", "Jazmin", "Beguiristain Colman", "1998-12-25", 2345562449, "beguiristainmelina@hotmail.es"),
(NULL, NULL, "20405687292", "Gastón", "Alejo", "Delucchi", "1997-07-03", 2216079500, "gdelucchi@me.com");

-- Insertar datos tabla ciudades
INSERT INTO ciudades
VALUES (NULL, "La Plata", "Buenos Aires", "Argentina", "1900");

-- Insertar datos tabla sucursales
INSERT INTO sucursales
VALUES (NULL, "Apple Store La Plata Bs. As.", "Calle 4 n924", 1);

-- Insertar datos tabla empleados
INSERT INTO empleados
VALUES (NULL, "30192406", "Gonzalo", "Adrián", "Muriado", "1983-06-03", 2216070711, "gonzalomuriado83@gmail.com", "2021-10-12", 1, TRUE),
(NULL, "40568729", "Gastón", "Alejo", "Delucchi", "1997-07-03", 2216079500, "gdelucchi@me.com", "2021-10-12", 1, TRUE);

-- Insertar datos tabla productos
INSERT INTO productos
VALUES (NULL, "Cable USB - Lightning 1 metro", "Apple", "Cable de carga y transmisión de datos blanco", 19000),
(NULL, "Cargador 20W", "Apple", "Cargador 20W, USB-C, carga rápida, para iPhone 8 al 15 Pro Max", 31800);

-- Insertar datos tabla stock
INSERT INTO stock
VALUES (NULL, 1, 55, 1),
(NULL, 2, 103, 1);

-- Insertar datos tabla equipos
INSERT INTO equipos
VALUES (NULL, "2024-02-24", "iPhone 15 Pro", "FP399R39P1", "256gb", "Nuevo", "100%", "Blue Titanium", 1200),
(NULL, "2024-02-23", "iPhone 14 Pro Max", "L5YX457J6M", "256gb", "Usado", "98%", "Space Black", 980);

-- Insertar datos tabla vendedores
INSERT INTO vendedores
VALUES (NULL, "2021-10-12", 1, 1);

-- Insertar datos tabla técnicos
INSERT INTO tecnicos
VALUES (NULL,"2021-10-12", 2, 1);

-- Insertar datos tabla servicios
INSERT INTO servicios
VALUES (NULL, "Recuperación de contraseña", 3000, 1);

-- Insertar datos tabla ventas de productos
INSERT INTO venta_productos
VALUES (NULL, "2024-02-26", 1, 2, 2, 1, 31800, 1),
(NULL, "2022-04-23", 1, 3, 1, 2, 38000, 1);

-- Insertar datos tabla ventas de equipos
INSERT INTO venta_equipos
VALUES (NULL, "2024-02-26", 1, 2, 1, 1, 1200, 1),
(NULL, "2024-02-23", 1, 3, 2, 1, 980, 1),
(NULL, "2024-02-23", 1, 3, 1, 1, 1200, 1);



-- Eliminar clientes
DELETE FROM clientes;

-- Eliminar ciudades
DELETE FROM ciudades;

-- Eliminar sucursales
DELETE FROM sucursales;

-- Eliminar empleados
DELETE FROM empleados;

-- Eliminar productos
DELETE FROM productos;

-- Eliminar stock
DELETE FROM stock;

-- Eliminar equipos
DELETE FROM equipos;

-- Eliminar vendedores
DELETE FROM vendedores;

-- Eliminar técnicos
DELETE FROM tecnicos;

-- Eliminar servicios
DELETE FROM servicios;

-- Eliminar ventas de productos
DELETE FROM venta_productos;

-- Eliminar ventas de equipos
DELETE FROM venta_equipos;



-- Crear vista empleados activos
CREATE OR REPLACE VIEW v_empleados_activos AS
	(SELECT primer_nombre, apellido, fecha_ingreso FROM empleados WHERE activo = TRUE ORDER BY primer_nombre);

-- Crear vista stock productos
CREATE OR REPLACE VIEW v_stock_productos AS
	(SELECT nombre, marca, stock FROM productos p RIGHT JOIN stock s ON (p.id_producto = s.id_producto));

-- Crear vista cantidad de equipos por cliente
CREATE OR REPLACE VIEW v_equipos_por_cliente AS
	(SELECT concat(primer_nombre, " ", apellido) AS nombre_completo, count(id_venta_equipo) AS equipos FROM clientes c JOIN venta_equipos v ON (c.id_cliente = v.id_cliente)
    GROUP BY nombre_completo);

-- Crear vista venta de equipos en sucursales
CREATE OR REPLACE VIEW v_venta_equipos_sucursales AS
	(SELECT nombre, count(id_venta_equipo) AS equipos FROM sucursales s JOIN venta_equipos v ON (s.id_sucursal = v.id_sucursal)
    GROUP BY nombre);

-- Crear vista valor de ventas de productos en sucursales
CREATE OR REPLACE VIEW v_valor_venta_productos_sucursales AS
	(SELECT nombre, sum(monto) AS valor FROM sucursales s JOIN venta_productos v ON (s.id_sucursal = v.id_sucursal)
    GROUP BY nombre);



-- Eliminar vista empleados activos
DROP VIEW v_empleados_activos;

-- Eliminar vista stock productos
DROP VIEW v_stock_productos;

-- Eliminar vista cantidad de equipos por cliente
DROP VIEW v_equipos_por_cliente;

-- Eliminar vista venta de equipos en sucursales
DROP VIEW v_venta_equipos_sucursales;

-- Eliminar vista valor de ventas de productos en sucursales
DROP VIEW v_valor_venta_productos_sucursales;



-- Ver vista empleados activos
SELECT * FROM v_empleados_activos;

-- Ver vista stock productos
SELECT * FROM v_stock_productos;

-- Ver vista cantidad de equipos por cliente
SELECT * FROM v_equipos_por_cliente;

-- Ver vista venta de equipos en sucursales
SELECT * FROM v_venta_equipos_sucursales;

-- Ver vista valor de ventas de productos en sucursales
SELECT * FROM v_valor_venta_productos_sucursales;



-- Crear función calcular edad
DELIMITER //
CREATE FUNCTION f_calcular_edad (idCliente INT) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE fecha_nac DATE;
	DECLARE edad INT;
    
    SELECT fecha_nacimiento INTO fecha_nac FROM clientes WHERE id_cliente = idCliente;
    
    SET edad = TIMESTAMPDIFF(YEAR, fecha_nac, CURDATE());
    
    RETURN edad;
END
// DELIMITER ;

-- Crear función calcular monto total
DELIMITER //
CREATE FUNCTION f_calcular_total (idVenta INT) RETURNS NUMERIC(10, 2) DETERMINISTIC
BEGIN
	DECLARE valor INT;
    DECLARE cant INT;
    DECLARE total NUMERIC(10, 2);
    
    SELECT monto INTO valor FROM venta_productos WHERE id_venta_producto = idVenta;
    
    SELECT cantidad INTO cant FROM venta_productos WHERE id_venta_producto = idVenta;
    
    SET total = valor * cant;
    
    RETURN total;
END
// DELIMITER ;



-- Eliminar función calcular edad
DROP FUNCTION f_calcular_edad;

-- Eliminar función calcular monto total
DROP FUNCTION f_calcular_total;



-- Llamar la función calcular edad
SELECT f_calcular_edad(3) AS "Edad";

-- Llamar la función calcular monto total
SELECT f_calcular_total(2) AS "Total";



-- Crear procedimiento almacenado para reducir stock
DELIMITER //
CREATE PROCEDURE sp_reducir_stock (IN fecha_actual DATE, idVendedor INT, idCliente INT, idProducto INT, cantidad INT, idSucursal INT)
BEGIN
	-- Declaración de variables
	DECLARE precio_producto NUMERIC(10, 2);
    DECLARE precio_total NUMERIC(10, 2);
    
	-- Obtener precio del producto
	SELECT precio INTO precio_producto FROM productos WHERE id_producto = idProducto;
    
    -- Setear el precio total de la compra
    SET precio_total = precio_producto * cantidad;
    
    -- Declarar IF para asegurarse de tener suficiente cantidad de productos
    IF (SELECT stock FROM stock WHERE id_producto = idProducto) >= cantidad THEN
		-- Agregar datos a la venta
		INSERT INTO venta_productos
		VALUES (NULL, fecha_actual, idVendedor, idCliente, idProducto, cantidad, precio_total, idSucursal);
    
		-- Descontar stock
		UPDATE stock
		SET stock = stock - cantidad WHERE id_producto = idProducto;
        
        -- Enviar mensaje de éxito
        SELECT "Stock reducido exitosamente" AS mensaje;
	ELSE
		-- Enviar mensaje de error
        SELECT "ERROR: No tienes la cantidad suficiente de este producto" AS mensaje;
	END IF;
    
END 

// DELIMITER ;

-- Crear procedimiento almacenado para ordenar clientes alfabéticamente
DELIMITER //
CREATE PROCEDURE sp_ordenar_clientes (IN campo_ordenamiento VARCHAR(20), orden VARCHAR(5))
BEGIN
	IF campo_ordenamiento <> "" THEN
		SET @ordenamiento_clientes = concat("ORDER BY ", campo_ordenamiento);
        IF orden = "asc" OR orden = "desc" THEN
			SET @sentido_ordenamiento = concat(@ordenamiento_clientes, " ", upper(orden));
		ELSE
		SET @sentido_ordenamiento = @ordenamiento_clientes;
		END IF;
	ELSE
		SET @ordenamiento_clientes = "";
	END IF;
    
    SET @clausula = concat("SELECT * FROM clientes ", @sentido_ordenamiento);
    
    PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END 

// DELIMITER ;



-- Eliminar procedimiento almacenado para reducir stock
DROP PROCEDURE sp_reducir_stock;

-- Eliminar procedimiento almacenado para ordenar clientes alfabéticamente
DROP PROCEDURE sp_ordenar_clientes;



-- Llamar procedimiento almacenado para reducir stock
CALL sp_reducir_stock("2024-10-15", 1, 3, 2, 3, 1);

-- Llamar procedimiento almacenado para ordenar clientes alfabéticamente
CALL sp_ordenar_clientes("apellido","desc");



-- Crear disparador respaldo de productos
	-- Tabla de respaldo
	CREATE TABLE respaldo_productos(
	id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	marca VARCHAR(20) NOT NULL,
	descripcion TEXT(200) NOT NULL,
	precio NUMERIC(10, 2) NOT NULL,
    acción VARCHAR(15) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    usuario VARCHAR(20)
	);

	-- Disparador
	DELIMITER //
	CREATE TRIGGER tr_respaldo_delete_productos
	AFTER DELETE ON productos
	FOR EACH ROW
	BEGIN
	INSERT INTO respaldo_productos (id_producto, nombre, marca, descripcion, precio, accion, fecha, hora, usuario)
    VALUES (old.id_producto, old.nombre, old.marca, old.descripcion, old.precio, "Delete", curdate(), curtime(), system_user());
	END
	// DELIMITER ;

-- Crear disparadores respaldo de clientes
	-- Tabla de respaldo
    CREATE TABLE respaldo_clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pasaporte VARCHAR(20) UNIQUE,
	cuit_cuil CHAR(11) UNIQUE,
	primer_nombre VARCHAR(35) NOT NULL,
	segundo_nombre VARCHAR(35),
	apellido VARCHAR(35) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	telefono BIGINT NOT NULL,
	email VARCHAR(50) NOT NULL,
    acción VARCHAR(15) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    usuario VARCHAR(20)
	);
	
    -- Disparador
    DELIMITER //
	CREATE TRIGGER tr_respaldo_delete_clientes
	AFTER DELETE ON clientes
	FOR EACH ROW
	BEGIN
    INSERT INTO respaldo_clientes (id_cliente, pasaporte, cuit_cuil, primer_nombre, segundo_nombre, apellido, fecha_nacimiento, telefono, email, accion, fecha, hora, usuario)
    VALUES (old.id_cliente, old.pasaporte, old.cuit_cuil, old.primer_nombre, old.segundo_nombre, old.apellido, old.fecha_nacimiento, old.telefono, old.email, "Delete", curdate(), curtime(), system_user());
	END
	// DELIMITER ;
    
    DELIMITER //
	CREATE TRIGGER tr_respaldo_update_clientes
	AFTER UPDATE ON clientes
	FOR EACH ROW
	BEGIN
    INSERT INTO respaldo_clientes (id_cliente, pasaporte, cuit_cuil, primer_nombre, segundo_nombre, apellido, fecha_nacimiento, telefono, email, accion, fecha, hora, usuario)
    VALUES (new.id_cliente, new.pasaporte, new.cuit_cuil, new.primer_nombre, new.segundo_nombre, new.apellido, new.fecha_nacimiento, new.telefono, new.email, "Update", curdate(), curtime(), system_user());
	END
	// DELIMITER ;



-- Eliminar disparador respaldo de productos
DROP TRIGGER tr_respaldo_delete_productos;

-- Eliminar disparadores respaldo de clientes
DROP TRIGGER tr_respaldo_delete_clientes;

DROP TRIGGER tr_respaldo_update_clientes;



-- Eliminar tabla de respaldo de productos
DROP TABLE respaldo_productos;

-- Eliminar tabla de respaldo de clientes
DROP TABLE respaldo_clientes;