# **** ESTRUCTURA: *****
# 1 - Creación de la BASE DE DATOS
# 2 - Csystem_userreación de las TABLAS
# 3 - Carga de los DATOS
# 4 - Creación de las VISTAS
# 5 - Creación de las FUNCIONES
# 6 - Creación  de STORED PROCEDURES
# 7 - Creación de TRIGGERS
# 8 - Control de cambios (TCL)

-- **** CREACIÓN DE LA BASE DE DATOS ****
CREATE SCHEMA IF NOT EXISTS libreria;
USE libreria;

-- **** CREACIÓN DE LAS TABLAS ****
--  ***** TABLA: LOCALES *****

CREATE TABLE `libreria`.`locales` (
  `id_Local` BIGINT(5) NOT NULL AUTO_INCREMENT COMMENT 'Código de identificación del local',
  `Nombre_Local` VARCHAR(50) NOT NULL COMMENT 'Nombre del Local',
  `Id_Pais` BIGINT(3) NOT NULL COMMENT 'Código del pais',
  `Id_Ciudad` BIGINT(7) NOT NULL COMMENT 'Código de la ciudad',
  `Direccion` VARCHAR(50) NOT NULL COMMENT 'Dirección del local',
  `Telefono` BIGINT(11) COMMENT 'Teléfono del local',
  `Email` VARCHAR(50) NOT NULL COMMENT 'Email del local',
  `Id_Empleado` BIGINT(5) NOT NULL COMMENT 'Codigo del gerente del local',
  PRIMARY KEY (`id_Local`),
  UNIQUE INDEX `id_Local_UNIQUE` (`id_Local` ASC) VISIBLE);
  
  --  ***** TABLA: BANCOS *****
CREATE TABLE `libreria`.`bancos` (
  `Id_Banco` BIGINT(3) NOT NULL AUTO_INCREMENT COMMENT 'Código interno identificador del Banco',
  `Nombre_Banco` VARCHAR(50) NOT NULL COMMENT 'Nombre del Banco',
  `Codigo_Banco` BIGINT(4) NOT NULL COMMENT 'Código del banco en el sistema bancario',
  PRIMARY KEY (`Id_Banco`),
  UNIQUE INDEX `Id_Banco_UNIQUE` (`Id_Banco` ASC) VISIBLE);

--  ***** TABLA: PAIS *****
CREATE TABLE `libreria`.`pais` (
  `Id_Pais` BIGINT(3) NOT NULL COMMENT 'Código internacional del pais',
  `Nombre_Pais` VARCHAR(50) NOT NULL COMMENT 'Nombre del Pais',
  PRIMARY KEY (`Id_Pais`),
  UNIQUE INDEX `Id_Pais_UNIQUE` (`Id_Pais` ASC) VISIBLE);

--  ***** TABLA: CIUDAD*****
CREATE TABLE `libreria`.`ciudad` (
  `Id_Ciudad` BIGINT(7) NOT NULL COMMENT 'Codigo de la ciudad',
  `Nombre_Ciudad` VARCHAR(50) NOT NULL COMMENT 'Nombre de la Cuidad',
  `Id_Pais`BIGINT(3) NOT NULL,
  PRIMARY KEY (`Id_Ciudad`),
  UNIQUE INDEX `Id_Ciudad_UNIQUE` (`Id_Ciudad` ASC) VISIBLE,
  INDEX `Id_Pais_idx` (`Id_Pais` ASC) VISIBLE,
  CONSTRAINT `Id_Pais`
    FOREIGN KEY (`Id_Pais`)
    REFERENCES `libreria`.`pais` (`Id_Pais`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

--  ***** TABLA: FORMA_PAGO *****
CREATE TABLE `libreria`.`forma_pago` (
  `Id_Pago` BIGINT(5) NOT NULL COMMENT 'Código de la forma de financiamiento',
  `Nombre_Pago` VARCHAR(50) NOT NULL COMMENT 'Forma pago (Cdo, Visa 1 cuota, Cta Cte 30D, etc)',
  PRIMARY KEY (`Id_Pago`),
  UNIQUE INDEX `Id_Pago_UNIQUE` (`Id_Pago` ASC) VISIBLE);

--  ***** TABLA: CLIENTES *****

CREATE TABLE `libreria`.`clientes` (
  `Id_Cliente` BIGINT(8) NOT NULL COMMENT 'Código interno del cliente',
  `Identificacion` BIGINT(8) NOT NULL COMMENT 'Documento de identidad',
  `Nombre_Cliente` VARCHAR(50) NOT NULL COMMENT 'Nombre del Cliente',
  `Apellido_Cliente` VARCHAR(50) NOT NULL COMMENT 'Apellido del cliente',
  `Id_Pais` BIGINT(3) NOT NULL COMMENT 'Código del pais',
  `Id_Ciudad` BIGINT(7) NOT NULL COMMENT 'Código de la ciudad',
  `Direccion` VARCHAR(50) NOT NULL COMMENT 'Direcciónd el Cliente',
  `Codigo_Postal` VARCHAR(8) NOT NULL COMMENT 'CODIGO POSTAL',
  `Email` VARCHAR(50) NOT NULL COMMENT 'Email del cliente',
  `Telefono` BIGINT(10) NOT NULL COMMENT 'Teléfono del cliente',
  PRIMARY KEY (`Id_Cliente`),
  UNIQUE INDEX `Id_Cliente_UNIQUE` (`Id_Cliente` ASC) VISIBLE);


--  ***** TABLA: PROVEEDORES *****

CREATE TABLE `libreria`.`proveedores` (
  `Id_Proveedor` BIGINT(5) NOT NULL AUTO_INCREMENT COMMENT 'Código interno del Proveedor',
  `Identificacion` BIGINT(12) NOT NULL COMMENT 'Documento de identidad (RUT,CUIT,etc)',
  `Nombre_Prov` VARCHAR(50) NOT NULL COMMENT 'Razón Social del Proveedor',
  `Id_Pais` BIGINT(3) NOT NULL COMMENT 'Código del Pais',
  `Id_Ciudad` BIGINT(7) NOT NULL COMMENT 'Código de la Ciudad',
  `Direccion` VARCHAR(50) NOT NULL COMMENT 'Dirección del Proveedor',
  `Telefono` BIGINT(10) NOT NULL COMMENT 'Teléfono del Proveedor',
  `Email` VARCHAR(50) NOT NULL COMMENT 'Email del Proveedor',
  `Contacto` VARCHAR(50) NOT NULL COMMENT 'Contacto dentro del proveedor (Ejecutivo de cuenta)',
  `Id_Pago` BIGINT(5) NOT NULL COMMENT 'Código de la forma de pago asignada',
  `Id_Banco` BIGINT(4) NOT NULL COMMENT 'Código interno del Banco del proveedor',
  `Numero_cuenta` BIGINT(14) NOT NULL COMMENT 'Número de cuenta bancaria',
  PRIMARY KEY (`Id_Proveedor`),
  UNIQUE INDEX `Id_Proveedor_UNIQUE` (`Id_Proveedor` ASC) VISIBLE);

--  ***** TABLA: VENTAS *****

CREATE TABLE `libreria`.`ventas` (
  `Id_Venta` BIGINT(10) NOT NULL AUTO_INCREMENT COMMENT 'Número identificador de la venta',
  `Factura` BIGINT(6) NOT NULL COMMENT 'Número de factura ',
  `Fecha` DATETIME NOT NULL COMMENT 'Fecha del momento de la venta',
  `Id_Cliente` BIGINT(8) NOT NULL COMMENT 'Código interno de identificación del cliente',
  `Identificacion` BIGINT(8) NOT NULL COMMENT 'Número de documento del cliente',
  `Nombre_Cliente` VARCHAR(50) NOT NULL COMMENT 'Nombre del cliente',
  `Apellido_Cliente` VARCHAR(50) NOT NULL COMMENT 'Apellido del cliente',
  `Isbn` BIGINT(13) NOT NULL COMMENT 'International Standard Book Number',
  `Nombre_Libro` VARCHAR(50) NOT NULL COMMENT 'Nombre del libro',
  `Cantidad` BIGINT(3) NOT NULL COMMENT 'Cantidad de libros vendidos',
  `Pvp` DECIMAL(5,2) NOT NULL COMMENT 'Precio de Venta al Público del libro',
  `Id_Empleado` BIGINT(5) NOT NULL COMMENT 'Número identificador del empleado que hizo la venta',
  `Id_Local` BIGINT(5) NOT NULL COMMENT 'Número identificador del local',
  `Id_Pago` BIGINT(5) NOT NULL COMMENT 'Código de la forma de financiamiento',
  `Venta` DECIMAL(6,2) NOT NULL COMMENT 'Valor total de la venta',
  PRIMARY KEY (`Id_Venta`),
  UNIQUE INDEX `Id_Venta_UNIQUE` (`Id_Venta` ASC) VISIBLE,
  UNIQUE INDEX `Factura_UNIQUE` (`Factura` ASC) VISIBLE);

--  ***** TABLA: COMPRAS *****
CREATE TABLE `libreria`.`compras` (
  `Id_Compra` BIGINT(10) NOT NULL AUTO_INCREMENT COMMENT 'Número identificador de la Compra',
  `Fac_Compra` BIGINT(6) NOT NULL COMMENT 'Factura de compra',
  `Fecha` DATETIME NOT NULL COMMENT 'Fecha de la factura de compra',
  `Id_Proveedor` BIGINT(6) NOT NULL COMMENT 'Número identificador del proveedor',
  `Nombre_Prov` VARCHAR(50) NOT NULL COMMENT 'Razón social del proveedor',
  `Isbn` BIGINT(13) NOT NULL COMMENT 'International Standard Book Number',
  `Nombre_Libro` VARCHAR(50) NOT NULL COMMENT 'Nombre del Libro',
  `Cantidad` BIGINT(3) NOT NULL COMMENT 'Cantidad de libros comprados',
  `Costo` DECIMAL(5,2) NOT NULL COMMENT 'Costo de compra del libro',
  `Pvp` DECIMAL(5,2) NOT NULL COMMENT 'Precio de venta al público',
  `Id_Empleado` BIGINT(5) NOT NULL COMMENT 'Número identificador del empleado que ingresa la compra',
  `Id_Local` BIGINT(5) NOT NULL COMMENT 'Número identificador del Local',
  PRIMARY KEY (`Id_Compra`),
  UNIQUE INDEX `Id_Compra_UNIQUE` (`Id_Compra` ASC) VISIBLE);
  
--  ***** TABLA: LIBROS *****
CREATE TABLE `libreria`.`libros` (
  `Isbn` BIGINT (13) NOT NULL COMMENT 'International Standard Book Number',
  `Nombre_Libro` VARCHAR(50) NOT NULL COMMENT 'Nombre del Libro',
  `Autor` VARCHAR(50) NOT NULL COMMENT 'Nombre del Autor',
  `Id_Proveedor` BIGINT(5) NOT NULL COMMENT 'Código interno del Proveedor',
  `Nom_Editorial` VARCHAR(50) NOT NULL COMMENT 'Nombre de la Editorial',
  `Genero` VARCHAR(50) NOT NULL COMMENT 'Tipo de género literario',
  `Resumen` TEXT(500) COMMENT 'Información de la contratapa',
  PRIMARY KEY (`Isbn`),
  UNIQUE INDEX `Isbn_UNIQUE` (`Isbn` ASC) VISIBLE,
  FOREIGN KEY (`Id_Proveedor`)
  REFERENCES `libreria`.`proveedores` (`Id_Proveedor`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

--  ***** TABLA: EMPLEADOS *****

CREATE TABLE `libreria`.`empleados` (
  `id_Empleado` BIGINT(5) NOT NULL AUTO_INCREMENT COMMENT 'Código interno del Empleado',
  `Identificacion` VARCHAR(8) NOT NULL COMMENT 'Documento de identidad',
  `Nombre_Empleado` VARCHAR(50) NOT NULL COMMENT 'Nombre del Empleado',
  `Apellido_Empleado` VARCHAR(50) NOT NULL,
  `Id_Pais` BIGINT(3) NOT NULL COMMENT 'Código del país',
  `Id_Ciudad` BIGINT(7) NOT NULL COMMENT 'Código de la Ciudad',
  `Direccion` VARCHAR(50) NOT NULL COMMENT 'Dirección del Empleado',
  `Telefono` BIGINT(10) NOT NULL COMMENT 'Teléfono del Empleado',
  `Cargo` VARCHAR(50) NOT NULL COMMENT 'Cargo del Empleado',
  `Comision` DECIMAL(4,2) NOT NULL COMMENT 'Comisión del empleado',
  `Id_Local` BIGINT(5) NOT NULL COMMENT 'Código interno del local al que es asignado el empleado',
  `Fecha_Nac` DATE NOT NULL COMMENT 'Fecha de Nacimiento del empleado',
  `Fecha_Ingreso` DATE NOT NULL COMMENT 'Fecha de ingreso del empleado a la empresa',
  PRIMARY KEY (`id_Empleado`),
  UNIQUE INDEX `id_Empleado_UNIQUE` (`id_Empleado` ASC) VISIBLE,
FOREIGN KEY (`Id_Pais`)
  REFERENCES `libreria`.`pais` (`Id_Pais`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`Id_Ciudad`)
  REFERENCES `libreria`.`ciudad` (`Id_Ciudad`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (`Id_Local`)
  REFERENCES `libreria`.`locales` (`id_Local`)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

-- ***** INSERTAMOS DATOS *****
# Datos de la tabla: locales
INSERT INTO `locales` (`Id_Local`, `Nombre_Local`, `Id_Pais`, `Id_Ciudad`, `Direccion`, `Telefono`, `Email`, `Id_Empleado`) VALUES
	(1, 'Paseo Real', 1, 1, '21 de Setiembre 456', 5984451587, 'paseoreal@libreria.com', 1),
	(2, 'Bookshop', 3, 4, 'Jose Ellauri 1444', 0551458287, 'bookshop@libreria.com', 2),
	(3, 'Del Virrey', 2, 3, 'Hnos García 1234', 0549125481, 'delvirrey@libreria.com', 3),
	(4, 'Nube blanca', 1, 1, 'Fco. Soca  4544', 5982144558, 'nubeblanca@libreria.com', 4),
	(5, 'Literalia', 1, 1, 'Rivera 4587', 5987156898, 'literalia@libreria.com', 5);
    
# Datos de la tabla: bancos
INSERT INTO `bancos` (`Id_Banco`, `Nombre_Banco`, `Codigo_Banco`) VALUES
	(1, 'Santander', 0134),
	(2, 'BBVA', 0128),
	(3, 'ScotiaBank', 0138),
	(4, 'Itau', 0114),
	(5, 'BROU', 0001);

# Datos de la tabla: pais
INSERT INTO `pais` (`Id_Pais`, `Nombre_Pais`) VALUES
	(1, 'Uruguay'),
	(2, 'Argentina'),
	(3, 'Brasil'),
	(4, 'Paraguay'),
	(5, 'Chile');

# Datos de la tabla: ciudad
INSERT INTO `ciudad` (`Id_Ciudad`, `Nombre_Ciudad`, `Id_Pais`) VALUES
	(1, 'Montevideo', 1),
	(2, 'Buenos Aires', 2),
	(3, 'Cordoba', 2),
	(4, 'San Pablo', 3),
	(5, 'Rio de Janeiro', 3),
	(6, 'Asuncion', 4),
	(7, 'Santiago de Chile', 5);

# Datos de la tabla: forma_pago
INSERT INTO `forma_pago` (`Id_Pago`, `Nombre_Pago`) VALUES
	(1, 'Efectivo'),
	(2, 'VISA'),
	(3, 'MASTER'),
	(4, 'AMEX'),
	(5, 'Credito 30 días'),
	(6, 'Crédito 45 días'),
	(7, 'Crédito 60 días');

# Datos de la tabla: clientes
INSERT INTO `clientes` (`Id_Cliente`, `Identificacion`, `Nombre_Cliente`, `Apellido_Cliente`, `Id_Pais`, `Id_Ciudad`, `Direccion`, `Codigo_Postal`, `Email`, `Telefono`) VALUES
	(1, 41000733, 'Martin', 'Intamouzu', 1, 1, 'J.Rodriguez 598', '11200', 'mintamouzu@gmail.com', 598221546),
	(2, 43703425, 'Gonzalo', 'Rodriguez', 1, 1, 'Ricaldoni 2589', '11200', 'grodriguez@gmail.com', 598254445),
	(3, 45724562, 'Rocio', 'Fueller', 2, 3, 'Av. Cordoba 2589', 'x50001', 'rfueller@gmail.com', 54904487),
	(4, 47726341, 'Miranda', 'Preston', 2, 2, 'Real 2587', 'C1425FFG', 'mpreston@gmail.com', 54944544),
	(5, 36830555, 'Mariella', 'Perez', 1, 1, 'Prudencio 4478', '20200', 'mperez@gmail.com', 598221154);

# Datos de la tabla: proveedores
INSERT INTO `proveedores` (`Id_Proveedor`, `Identificacion`, `Nombre_Prov`, `Id_Pais`, `Id_Ciudad`, `Direccion`, `Telefono`, `Email`, `Contacto`, `Id_Pago`, `Id_Banco`, `Numero_Cuenta`) VALUES
	(1, 215454556687, 'Editorial Planeta', 1, 1, 'Cuareim 1647', 29014026, 'info@planetadelibros.com.uy', 'Roberto Planeta', 5, 5, 00142544400001),
	(2, 214581890997, 'Random House', 1, 1, 'Ronedeau 1258', 29874564, 'ventas@randomhouse.com', 'Jose Martí', 5, 1, 01345454565444),
	(3, 110405777788, 'Editorial B', 1, 1, 'Constituyentes 1247', 21145334, 'info@editorialb.com', 'Maria Gimenez', 5, 2, 01281455640278);

# Datos de la tabla: ventas
INSERT INTO `ventas` (`Id_Venta`, `Factura`, `Fecha`, `Id_Cliente`, `Identificacion`, `Nombre_Cliente`, `Apellido_Cliente`, `Isbn`, `Nombre_Libro`, `Cantidad`, `Pvp`, `Id_Empleado`, `Id_Local`, `Id_Pago`, `Venta`) VALUES
	(1, 1, '2020-10-01', 5, 36830555, 'Mariella', 'Perez', 8412123101, 'El transito terreno', 1, '49.00', 2, 2, 1, '49.00'),
	(2, 2, '2020-11-15', 4, 47726341, 'Miranda', 'Preston', 8474891469, 'Sistemas operativos', 1, '16.50', 4, 4, 2, '16.50'),
	(3, 3, '2020-12-30', 5, 36830555, 'Mariella', 'Perez', 8430504737, 'Poemas intrinsecos', 1, '20.00', 3, 3, 3, '20.00'),
	(4, 4, '2021-02-13', 2, 43703425, 'Gonzalo', 'Rodriguez', 8447301206, 'Avances en Arquitectura', 1, '55.00', 4, 4, 1, '55.00'),
	(5, 5, '2021-03-30', 3, 45724562, 'Rocío', 'Fueller', 8420617040, 'Las balas del bien', 1, '69.00', 3, 3, 1, '69.00');

# Datos de la tabla: compras
INSERT INTO `compras` (`Id_Compra`, `Fac_Compra`, `Fecha`, `Id_Proveedor`, `Nombre_Prov`, `Isbn`, `Nombre_Libro`, `Cantidad`, `Costo`, `Pvp`, `Id_Empleado`, `Id_Local`) VALUES
	(1, 1254, '2020-09-01', 1, 'Editorial Planeta', 9788445007709, 'El Senor de los Anillos. Ilustrado por Alan Lee', 3, '55', '103', 1, 1),
	(2, 45115, '2020-10-03', 1, 'Editorial Planeta', 8410002123101, 'El transito terreno', 2, '35', '49', 1, 2),
	(3, 6487, '2021-01-10', 1, 'Editorial Planeta', 8470004891469, 'Sistemas operativos', 4, '12', '16.5', 1, 4),
	(4, 11547, '2021-12-13', 2, 'Random House', 8430000504737, 'Poemas intrinsecos', 1, '15', '20', 1, 3),
	(5, 44456, '2022-01-16', 3, 'Editorial B', 8440007301206, 'Avances en Arquitectura', 5, '40', '55', 1, 4),
	(6, 44877, '2022-08-01', 2, 'Random House', 8420000617040, 'Las balas del bien', 1, '50', '69', 1, 3);

# Datos de la tabla: libros
INSERT INTO `libros` (`Isbn`, `Nombre_Libro`, `Autor`, `Id_Proveedor`, `Nom_Editorial`, `Genero`, `Resumen`) VALUES
	(8412123101, 'El tránsito terreno', 'Plasencia, Juan Luis', 1, 'Editorial Planeta', 'Filosofía', ''),
	(8474891469, 'Sistemas operativos', 'Bazilian Eric', 1, 'Editorial Planeta', 'Técnica', ''),
	(8430504737, 'Poemas intrínsecos', 'Llorens Antonia', 2, 'Random House', 'Poesía', ''),
	(8447301206, 'Avances en Arquitectura', 'Richter, Helmut', 3, 'Editorial B', 'Técnica, Historia', ''),
	(8420617040, 'Las balas del bien', 'Leverling, Janet', 2, 'Random House', 'Novela', ';');

# Datos de la tabla: empleados
INSERT INTO `empleados` (`Id_Empleado`, `Identificacion`, `Nombre_Empleado`, `Apellido_Empleado`, `Id_Pais`, `Id_Ciudad`, `Direccion`, `Telefono`, `Cargo`, `Comision`, `Id_Local`, `Fecha_Nac`, `Fecha_Ingreso`) VALUES
	(1, 45274439, 'Nicolas', 'Almeida', 1, 1, 'Maldonado 539', 5988758709, 'Vendedor', '10.00', 1, '1988-09-05', '2022-03-01'),
	(2, 43211206, 'Matias', 'Gonzalez', 3, 4, 'Santos Dumont 4357', 552664081, 'Vendedor', '10.00', 2, '1979-04-11', '2020-06-07'),
	(3, 44073192, 'Carmen', 'Rodriguez', 2, 3, 'Alvear 537', 540770829, 'Encargado', '5.00', 3, '1970-07-22', '2019-01-15'),
	(4, 37756368, 'Lorena', 'Gutierrez', 1, 1, 'Goes 1258', 5982919317, 'Encargado', '5.00', 4, '1990-08-14', '2019-09-02'),
	(5, 47723666, 'Jose', 'Lopez', 1, 1, 'A. Machado 3547', 5983491775, 'Vendedor', '10.00', 5, '1995-09-23', '2020-11-06');

-- *****  CREACION DE VISTAS *****
# Muestra el total de las ventas acumulada por cliente

CREATE OR REPLACE VIEW vventas_clientes
AS
	SELECT
		v.Id_Cliente,
        v.Nombre_Cliente,
        v.Apellido_Cliente,
		sum(Venta) as Venta_Acum,
        sum(Cantidad) as Cant_Acum
	FROM ventas v
	GROUP BY v.Id_Cliente 
;
# Muestra la lista de libros vendidos por local

CREATE OR REPLACE VIEW vlibros_local
AS
	SELECT
		l.id_Local,
        l.Nombre_Local,
        v.Nombre_Libro,
		v.Cantidad
	FROM locales l
	JOIN ventas v ON v.Id_Local = l.id_Local
    ORDER BY l.id_Local
;
# Muestra la facturación acumulada por local

CREATE OR REPLACE VIEW vventas_local
AS
	SELECT
		v.Id_Local,
		l.Nombre_Local,
        sum(v.Venta) as Venta_Acum        
	FROM locales l
JOIN ventas v ON v.Id_Local = l.id_Local
GROUP BY v.Id_Local
;
# Muestra los locales donde se vendió el libro "Las balas del Bien"

CREATE OR REPLACE VIEW vlibro_en_local
AS
	SELECT
		v.Fecha,
        v.Id_Local,
		l.Nombre_Local,
        v.Nombre_Libro,
        v.Venta,
        v.Cantidad
	FROM locales l
JOIN ventas v ON v.Id_Local = l.id_Local
WHERE v.Nombre_Libro = 'Las balas del bien'
;
# Muestra las ventas acumuladas por empleado

CREATE OR REPLACE VIEW vvta_empleado
AS
	SELECT
		l.Nombre_Local,
        e.Id_Empleado,
        e.Nombre_Empleado,
        SUM(venta) as Venta_Acum,
        SUM(cantidad) as Cant_Acum       
	FROM ventas AS v
JOIN empleados AS e ON e.Id_Empleado = v.Id_Empleado
JOIN locales AS l on e.Id_Empleado = l.Id_Empleado
GROUP BY v.Id_Empleado
;

-- *****  CREACION DE FUNCIONES *****
# Función: Consultar por un ID de empleado y que me devuelva la comisión que tiene para cobrar
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `consulta_comision`(param_id INT) 
RETURNS DECIMAL (9,2)
    READS SQL DATA
BEGIN
	DECLARE cometa, venta_acum, sueldo DECIMAL (9,2);
    SET venta_acum = 0;
    SET cometa = 0;
    SET sueldo = 0;
    SELECT SUM(venta) FROM ventas AS v WHERE v.Id_Empleado = param_id INTO venta_acum;
    SELECT comision FROM empleados AS e WHERE e.Id_Empleado = param_id INTO cometa;
    SET sueldo = cometa * 0.01 * venta_acum;   

RETURN sueldo;
END $$
DELIMITER ;

# Función: Agrega al costo 40% de margen para determinar el Precio de Venta al Público (PVP)
DELIMITER $$
CREATE FUNCTION `precio_publico` (costo DECIMAL(5,2))
RETURNS DECIMAL (5,2)
	DETERMINISTIC
BEGIN
	DECLARE pvp, margen DECIMAL (5,2);
	SET pvp = 0.00;
	SET margen = 1.4;
	SELECT costo* margen INTO pvp;
	
    RETURN pvp;
END $$
DELIMITER ;

-- ***** CREACIÓN DE STORED PROCEDURES *****
DELIMITER $$;
# Agregar un cliente en forma automática
CREATE PROCEDURE `sp_altacliente` (IN Id_Cliente BIGINT (8), Identificacion BIGINT (8), Nombre_Cliente VARCHAR (50), Apellido_Cliente VARCHAR (50), Id_Pais BIGINT (3), Id_Ciudad BIGINT(7), Direccion VARCHAR (50), Codigo_Postal VARCHAR (8), Email VARCHAR (50), Telefono BIGINT (10))
BEGIN
    INSERT INTO clientes VALUES (Id_Cliente, Identificacion, Nombre_Cliente, Apellido_Cliente, Id_Pais, Id_Ciudad, Direccion, Codigo_Postal, Email, Telefono);
END$$    
DELIMITER ;

-- ***** CREACIÓN DE TRIGGERS *****
# Trigger after: crea un log que registra quién y cuándo fue creado un nuevo libro

-- Creo la tabla de LOG donde se graba el Trigger
USE libreria;
CREATE TABLE IF NOT EXISTS log_nuevo_libro
	(
		id_nvolibro BIGINT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
        Isbn BIGINT (13),
        Id_proveedor BIGINT,
		Usuario VARCHAR(100),
        Fecha DATE,
        Hora TIME
    );

-- Creación del Trigger
USE libreria;
CREATE TRIGGER tr_nuevo_libro
AFTER INSERT ON libros
FOR EACH ROW
INSERT INTO log_nuevo_libro (Isbn, Id_proveedor, Usuario, Fecha, Hora)
VALUES (
			NEW.Isbn,
            NEW.Id_proveedor,
            USER(),
            CURRENT_DATE(),
            CURRENT_TIME()
	   );
       
-- Insert de Test

INSERT INTO libreria.libros (Isbn, Nombre_Libro, Autor, Id_Proveedor, Nom_Editorial, Genero, Resumen)
VALUES
	(9789501251111, 'Los 7 habitos de la gente altamente efectiva','Stephen Covey', 1,'Editorial Planeta', 'Autoayuda', ' ');

-- Validar el nuevo registro en la tabla Log
SELECT * FROM libreria.log_nuevo_libro;

-- ***** CONTROL DE CAMBIOS (TCL) *****
# El siguiente StoreProcedure actualiza la tabla "Compras" y busca
# garantizar que los campos "Id_Compra" y "Fac_Compra" sean siempre únicos:
DELIMITER //

CREATE PROCEDURE actualizar_compra(
  IN p_Id_Compra BIGINT,
  IN p_Fac_Compra BIGINT,
  IN p_Nombre_Prov VARCHAR(50),
  IN p_Isbn VARCHAR(50),
  IN p_Nombre_Libro VARCHAR(50),
  IN p_Cantidad BIGINT,
  IN p_Costo DECIMAL(5,2),
  IN p_Pvp DECIMAL(5,2),
  IN p_Id_Empleado BIGINT,
  IN p_Id_Local BIGINT
)
BEGIN
  DECLARE exit handler for sqlexception
  BEGIN
    ROLLBACK;
    SELECT 'Error:';
    -- No puedo entender cuál es el error aquí --
  END;
  
  START TRANSACTION;
  
  SAVEPOINT inicio;
  
  UPDATE Compras
  SET Nombre_Prov = p_Nombre_Prov,
      Isbn = p_Isbn,
      Nombre_Libro = p_Nombre_Libro,
      Cantidad = p_Cantidad,
      Costo = p_Costo,
      Pvp = p_Pvp,
      Id_Empleado = p_Id_Empleado,
      Id_Local = p_Id_Local
  WHERE Id_Compra = p_Id_Compra AND Fac_Compra = p_Fac_Compra;
  
  IF (SELECT ROW_COUNT() > 0) THEN
    IF EXISTS(SELECT 1 FROM compras WHERE Id_Compra = p_Id_Compra AND Fac_Compra = p_Fac_Compra AND Id_Compra <> OLD.Id_Compra)
    THEN
      ROLLBACK TO inicio;
      SELECT 'Error: El número de compra y factura ya existen en la base de datos.';
    ELSE
      COMMIT;
      SELECT 'La compra se ha actualizado correctamente.';
    END IF;
  ELSE
    ROLLBACK;
    SELECT 'Error: No se encontró ninguna compra con el número de compra y factura especificados.';
  END IF;
END //

DELIMITER ;

# Este SP valida si existe un proveedor registrado en la tabla PROVEEDORES antes de actualizarla,
# si el proveedor no existe, da un error y no realiza ningún cambio en la tabla.

DELIMITER //

CREATE PROCEDURE actualizar_proveedor(
    IN id_prov BIGINT,
    IN identificacion BIGINT,
    IN nombre_prov VARCHAR(50),
    IN id_pais BIGINT,
    IN id_ciudad BIGINT,
    IN direccion VARCHAR(50),
    IN telefono BIGINT,
    IN email VARCHAR(50),
    IN contacto VARCHAR(50),
    IN id_pago BIGINT,
    IN id_banco BIGINT,
    IN num_cuenta BIGINT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Ha ocurrido un error durante la actualización del proveedor';
    END;

    START TRANSACTION;
    SAVEPOINT sp1;

    UPDATE Proveedores SET
        Identificacion = identificacion,
        Nombre_Prov = nombre_prov,
        Id_Pais = id_pais,
        Id_Ciudad = id_ciudad,
        Direccion = direccion,
        Telefono = telefono,
        Email = email,
        Contacto = contacto,
        Id_Pago = id_pago,
        Id_Banco = id_banco,
        Numero_Cuenta = num_cuenta
    WHERE Id_Proveedor = id_prov;

    IF ROW_COUNT() = 0 THEN
        ROLLBACK;
        SELECT 'No se ha encontrado el proveedor con el id especificado';
    END IF;

    COMMIT;
    SELECT 'La actualización del proveedor se ha realizado correctamente';
END //

DELIMITER ;