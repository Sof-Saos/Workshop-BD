
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `jardineria` DEFAULT CHARACTER SET utf8 ;
USE `jardineria` ;

-- -----------------------------------------------------
-- Table `jardineria`.`oficina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardineria`.`oficina` (
  `id_oficina` INT NOT NULL auto_increment,
  `ciudad` VARCHAR(200) NULL,
  `region` VARCHAR(200) NULL,
  `cod_postal` INT NULL,
  `telefono` INT NULL,
  `direccion` VARCHAR(200) NULL,
  PRIMARY KEY (`id_oficina`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `jardineria`.`jefe` (
  `id_jefe` INT NOT NULL auto_increment,
  `nombre` VARCHAR(200) NULL,
  `apellido` VARCHAR(200) NULL,
  PRIMARY KEY (`id_jefe`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `jardineria`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardineria`.`empleado` (
  `id_empleado` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `extension` INT NULL,
  `email` VARCHAR(200) NULL,
  `id_oficina` INT NULL,
  `id_jefe` INT NULL,
  `puesto` VARCHAR(200) NULL,
  INDEX `id_oficina_idx` (`id_oficina` ASC) VISIBLE,
  INDEX `id_jefe_idx` (`id_jefe` ASC) VISIBLE,
  CONSTRAINT `id_oficina`
    FOREIGN KEY (`id_oficina`)
    REFERENCES `jardineria`.`oficina` (`id_oficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_jefe`
    FOREIGN KEY (`id_jefe`)
    REFERENCES `jardineria`.`jefe` (`id_jefe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `jardineria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardineria`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `apellido` VARCHAR(200) NULL,
  `nombre_contacto` VARCHAR(200) NULL,
  `apellido_contacto` VARCHAR(200) NULL,
  `telefono` INT NULL,
  `fax` INT NULL,
  `direccion1` VARCHAR(200) NULL,
  `direccion2` VARCHAR(200) NULL,
  `ciudad` VARCHAR(45) NULL,
  `region` VARCHAR(45) NULL,
  `cod_postal` INT NULL,
  `cod_empleado` INT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `cod_empleado_idx` (`cod_empleado` ASC) VISIBLE,
  CONSTRAINT `cod_empleado`
    FOREIGN KEY (`cod_empleado`)
    REFERENCES `jardineria`.`empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardineria`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardineria`.`pagos` (
  `id_transaccion` INT NOT NULL,
  `id_cliente` INT NULL,
  `forma_pago` VARCHAR(200) NULL,
  `fecha_pago` DATETIME NULL,
  `total_pago` DECIMAL NULL,
  PRIMARY KEY (`id_transaccion`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `jardineria`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardineria`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardineria`.`pedido` (
  `id_pedido` INT NOT NULL auto_increment,
  `fecha_pedido` DATETIME NULL,
  `fecha_entrega` DATETIME NULL,
  `estado` VARCHAR(45) NULL,
  `comentarios` VARCHAR(200) NULL,
  `cod_cliente` INT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `cod_cliente_idx` (`cod_cliente` ASC) VISIBLE,
  CONSTRAINT `cod_cliente`
    FOREIGN KEY (`cod_cliente`)
    REFERENCES `jardineria`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardineria`.`gama`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardineria`.`gama` (
  `id_gama` INT NOT NULL auto_increment,
  `nombre_gama` VARCHAR(200) NULL,
  PRIMARY KEY (`id_gama`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardineria`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardineria`.`producto` (
  `id_producto` INT NOT NULL auto_increment,
  `nombre` VARCHAR(200) NULL,
  `id_gama` INT NULL,
 `proveedor` VARCHAR(200) NULL,
  `descripcion` VARCHAR(200) NULL,
  `stock` INT NULL,
  `precio_venta` DECIMAL NULL,
  `precio_proveedor` DECIMAL NULL,
  `imagen` LONGBLOB NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `id_gama_idx` (`id_gama` ASC) VISIBLE,
  CONSTRAINT `id_gama`
    FOREIGN KEY (`id_gama`)
    REFERENCES `jardineria`.`gama` (`id_gama`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


ALTER TABLE oficina MODIFY telefono VARCHAR(20);
ALTER TABLE cliente MODIFY telefono VARCHAR(20);
ALTER TABLE cliente MODIFY fax VARCHAR(20);

INSERT INTO jefe(nombre, apellido) VALUES
("Carlos", "Munera"),
("Marcela", "Valencia"),
("Armando", "Mendoza"),
("Daniel", "Valencia"),
("Catalina", "Ángel"),
("Margarita", "Sáenz"),
("Beatriz", "Pinzón Solano"),
("Teresa", "Chávez"),
("Arturo", "de la Barrera Azuela"),
("María", "Hernández");

INSERT INTO oficina(ciudad, region, cod_postal, telefono, direccion) 
VALUES
    ('Bogotá', 'Cundinamarca', 11111, '555-123-4567', 'Calle 123 # 23 - 34'),
    ('Medellín', 'Antioquia', 22222, '555-234-5678', 'Avenida 45 # 3 - 45'),
    ('Cali', 'Valle del Cauca', 33333, '555-345-6789', 'Calle 78 # 64 - 1'),
    ('Cartagena', 'Bolívar', 44444, '555-456-7890', 'Avenida 101 # 26 - 64'),
    ('Barranquilla', 'Atlántico', 55555, '555-567-8901', 'Calle 5 # 45 - 65'),
    ('Santa Marta', 'Magdalena', 66666, '555-678-9012', 'Avenida 87 # 5 - 12'),
    ('Pereira', 'Risaralda', 77777, '555-789-0123', 'Calle 23 # 1 - 6'),
    ('Cúcuta', 'Norte de Santander', 88888, '555-890-1234', 'Avenida 5 Circular 2'),
    ('Ibagué', 'Tolima', 99999, '555-901-2345', 'Calle 78 # 53 - 5'),
    ('Manizales', 'Caldas', 10101, '555-012-3456', 'Avenida 9 # 76 - 6');

INSERT INTO empleado(nombre, apellido1, apellido2, extension, email, id_oficina, id_jefe, puesto) 
VALUES
    ('David', 'López', 'Gómez', '101', 'david.lopez@gmail.com', 1, 2, 'Gerente'),
    ('Ana', 'Martínez', 'Rodríguez', '102', 'ana.martinez@gmail.com', 2, 3, 'Asistente'),
    ('Carlos', 'García', 'Sánchez', '103', 'carlos.garcia@gmail.com', 3, 4, 'Analista de Ventas'),
    ('Luisa', 'Ramírez', 'Hernández', '104', 'luisa.ramirez@gmail.com', 4, 5, 'Asistente de Gerencia'),
    ('María', 'González', 'Torres', '105', 'maria.gonzalez@gmail.com', 5, 6, 'Analista de Marketing'),
    ('Juan', 'Sánchez', 'Díaz', '106', 'juan.sanchez@hotmail.com', 6, 7, 'Gerente de Proyecto'),
    ('Sofía', 'Hernández', 'Pérez', '107', 'sofia.hernandez@yahoo.com', 7, 8, 'Desarrollador Web'),
    ('Pedro', 'Torres', 'López', '108', 'pedro.torres@hotmail.com', 8, 9, 'Asistente de Recursos Humanos'),
    ('Laura', 'Díaz', 'Martínez', '109', 'laura.diaz@hotmail.com', 9, 10, 'Analista de Finanzas'),
    ('Eduardo', 'Martínez', 'Sánchez', '110', 'eduardo.martinez@yahoo.com', 10, NULL, 'Director General');


INSERT INTO cliente(nombre, apellido, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, cod_postal, cod_empleado) 
VALUES
    ('Juan', 'Perez', 'Ana', 'González', '5551234567', '5559876543', 'Calle 123 # 23 - 34', 'Apto 4B', 'Bogotá', 'Cundinamarca', '12345', 1),
    ('María', 'López', 'Pedro', 'Sánchez', '555-234-5678', '555-876-5432', 'Avenida 45 # 3 - 45', 'Piso 8', 'Medellín', 'Antioquia', '23456', 2),
    ('Carlos', 'García', 'Sofía', 'Martínez', '555-345-6789', '555-765-4321', 'Calle 78 # 64 - 1', 'Local 12', 'Jericó', 'Antioquia', '34567', 3),
    ('Laura', 'Rodríguez', 'Javier', 'Torres', '555-456-7890', '555-654-3210', 'Avenida 101 # 26 - 64', 'Piso 3A', 'Marinilla', 'Antioquia', '45678', 4),
    ('Pedro', 'Sánchez', 'Elena', 'Gómez', '555-567-8901', '555-543-2109', 'Calle 5 # 45 - 65', 'Oficina 5', 'Guarne', 'Antioquia', '56789', 5),
    ('Ana', 'González', 'Luis', 'Hernández', '555-678-9012', '555-432-1098', 'Avenida 87 # 5 - 12', 'Piso 10', 'Pasto', 'Nariño', '67890', 6),
    ('Sofía', 'Martínez', 'Mario', 'Díaz', '555-789-0123', '555-321-0987', 'Calle 23 # 1 - 6', 'Local 9B', 'Remedios', 'Antioquia', '78901', 7),
    ('Javier', 'Torres', 'Isabel', 'Ortega', '555-890-1234', '555-210-9876', 'Avenida 5 Circular 2', 'Piso 5C', 'Leticia', 'Amazonas', '89012', 8),
    ('Elena', 'Gómez', 'Lucas', 'Ramírez', '555-901-2345', '555-109-8765', 'Calle 78 # 53 - 5', 'Local 7A', 'Mompox', 'Bolivar', '90123', 9),
    ('Luis', 'Hernández', 'Laura', 'Rodríguez', '555-012-3456', '555-987-6543', 'Avenida 9 # 76 - 6', 'Piso 4D', 'Bello', 'Antioquia', '01234', 10);

INSERT INTO pagos (id_transaccion, id_cliente, forma_pago, fecha_pago, total_pago)
VALUES
  (1234, 1, 'Tarjeta de crédito', '2023-09-11 10:30:00', 500),
  (2657, 2, 'Efectivo', '2023-09-11 11:45:00', 350),
  (7563, 5, 'Transferencia bancaria', '2023-09-11 12:15:00', 600),
  (2474, 3, 'PayPal', '2023-09-11 13:30:00', 450),
  (5058, 4, 'Tarjeta de débito', '2023-09-11 14:00:00', 700),
  (3846, 6, 'Efectivo', '2023-09-11 15:15:00', 250),
  (2037, 7, 'Transferencia bancaria', '2023-09-11 16:30:00', 800),
  (5648, 8, 'PayPal', '2023-09-11 17:45:00', 550),
  (9864, 9, 'Tarjeta de crédito', '2023-09-11 18:00:00', 900),
  (3727, 10, 'Tarjeta de débito', '2023-09-11 19:15:00', 300);

INSERT INTO gama(nombre_gama) 
VALUES ("Gama alta"),
       ("Gama media-baja"),
       ("Gama baja");

UPDATE gama
SET nombre_gama = 'Ramo extra-grande'
WHERE id_gama = 1;

UPDATE gama
SET nombre_gama = 'Ramo grande'
WHERE id_gama = 2;

UPDATE gama
SET nombre_gama = 'Ramo mediano'
WHERE id_gama = 3;

INSERT INTO gama(nombre_gama) Values ("Ramo pequeño");

ALTER TABLE pedido 
ADD COLUMN id_producto int,
ADD CONSTRAINT fk_pedido_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto);

INSERT INTO producto (nombre, id_gama, proveedor, descripcion, stock, precio_venta, precio_proveedor, imagen)
VALUES
  ('Rosas', 1, 'Jardín Olimpus', 'Hermosas rosas de colores variados.', 50, 100, 80, NULL),
  ('Tulipanes', 2, 'Skypea Garden', 'Tulipanes frescos y vibrantes para alegrar tu día.', 30, 75, 60, NULL),
  ('Claveles', 1, 'Flowerland', 'Claveles fragantes en una variedad de tonos.', 25, 90, 70, NULL),
  ('Margaritas', 3, 'Sophie-s Garden Shop', 'Margaritas blancas y brillantes para eventos especiales.', 40, 120, 100, NULL),
  ('Amapolas', 2, 'Exotic Flowers', 'Amapolas exóticas en colores intensos.', 60, 110, 90, NULL),
  ('Orquídeas', 1, 'Jardines de Marte', 'Elegantes orquídeas en macetas decorativas.', 75, 130, 110, NULL),
  ('Dientes de león', 4, 'En el Bosque', 'Dientes de león frescos y silvestres.', 2, 95, 75, NULL),
  ('Petunias', 3, 'Jardín Superior', 'Petunias en diversos tonos para jardines hermosos.', 35, 105, 85, NULL),
  ('Camelias', 2, 'Jungla Fantástica', 'Camelias raras y exóticas para coleccionistas.', 45, 115, 95, NULL),
  ('Dalias', 4, 'Flores: El Imperio', 'Dalias grandes y coloridas para arreglos impresionantes.', 55, 140, 120, NULL);

INSERT INTO pedido(fecha_pedido, fecha_entrega, estado, comentarios, cod_cliente, id_producto)
VALUES ('2023-01-17 13:30:00', '2023-01-19 10:30:00', 1, "Envio fragil", 1, 1), 
       ('2023-01-20 14:00:00', '2023-01-21 09:30:00', 4, "Envio express, debe llegar urgente", 2, 2), 
       ('2023-02-11 10:30:00', '2023-02-15 10:30:00', 2, "Envio fragil", 3, 3), 
       ('2023-04-20 11:30:00', '2023-04-22 15:00:00', 1, "Ramo costoso, tener cuidada", 4, 4), 
       ('2023-06-08 08:00:00', '2023-07-11 03:30:00', 1, "Normal", 5, 5), 
       ('2023-07-10 14:50:00', '2023-08-01 07:29:00', 4, "Envio fragil", 6, 6), 
       ('2023-09-01 11:20:00', '2023-09-11 10:30:00', 3, "Envio express, debe llegar urgente", 7, 7);

SELECT * FROM oficina;
SELECT * FROM jefe;
SELECT * FROM empleado;
SELECT * FROM cliente;
SELECT * FROM gama;
SELECT * FROM pagos;
SELECT * FROM pedido;
SELECT * FROM producto;

ALTER TABLE producto MODIFY COLUMN imagen varchar(200);

UPDATE producto SET imagen = ("https://estag.fimagenes.com/img/v2/7e4/1100858_526035_900.jpg") WHERE id_producto = 1;
UPDATE producto SET imagen = ("https://images.hola.com/imagenes/decoracion/20211013197604/cultivar-tulipanes-plantas-interior-exterior-il/1-6-268/cultivar-tulipanes-01m-m.jpg?tx=w_680") WHERE id_producto = 2;
UPDATE producto SET imagen =  ("https://agroactivocol.com/wp-content/uploads/2023/07/CLAVEL-ROJO.jpg") WHERE id_producto = 3;
UPDATE producto SET imagen = ("https://unsplash.com/es/fotos/6P9JgFe3f9Q") WHERE id_producto = 4;
UPDATE producto SET imagen =  ("https://www.mnhn.gob.cl/sites/www.mnhn.gob.cl/files/styles/16x9_grande/public/2021-04/Amapola%20roja.jpg?h=427da63c&itok=T0caVzl7") WHERE id_producto = 5;
UPDATE producto SET imagen =  ("https://www.lamansiondelasideas.com/wp-content/uploads/2022/08/significado-de-las-orquideas.jpg") WHERE id_producto = 6;
UPDATE producto SET imagen = ("https://www.crushpixel.com/big-static14/preview4/bouquet-dandelions-1414349.jpg") WHERE id_producto = 7;
UPDATE producto SET imagen =  ("https://www.shutterstock.com/es/image-photo/colorful-petunia-flowers-close-plant-red-2031503813") WHERE id_producto = 8;
UPDATE producto SET imagen =  ("https://plantasyjardin.com/wp-content/uploads/2011/05/Camelia-Dr.-Clifford-Parks-detalle-flor..jpg") WHERE id_producto = 9;
UPDATE producto SET imagen =  ("https://www.ngenespanol.com/wp-content/uploads/2022/11/dalia-la-flor-nacional-de-mexico-que-conquisto-al-mundo-770x431.jpg") WHERE id_producto = 10;

ALTER TABLE pagos ADD COLUMN id_pedido INT, 
ADD FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido);

-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT id_oficina, ciudad FROM oficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España
ALTER TABLE oficina add column pais varchar(200);
INSERT INTO oficina(ciudad, region, cod_postal, telefono, direccion, pais) VALUES ('Salamanca', 'Castilla y León', 30055, '231-434-444', 'Calle 34 # 12 - 4', 'España');
INSERT INTO oficina(ciudad, region, cod_postal, telefono, direccion, pais) VALUES ('Madrid', 'Comunidad Autonoma', 22494, '235674-444', 'Carrera 12 # 56 - 2', 'España');
SELECT ciudad, telefono FROM oficina WHERE pais = 'España';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT nombre, CASE WHEN apellido2 IS NULL THEN apellido1 ELSE CONCAT(apellido1, ' ', apellido2) END AS apellidos, email, id_jefe FROM empleado WHERE id_jefe = 7;

-- 4. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
SELECT distinct id_cliente FROM pagos WHERE YEAR(fecha_pago) = 2008;
SELECT DISTINCT id_cliente FROM pagos WHERE DATE_FORMAT(fecha_pago, '%D') = '2008';

-- 5 ¿Cuántos empleados hay en la compañía?
SELECT COUNT(id_empleado) AS numero_empleados_compania FROM empleado;

-- 6. ¿Cuántos clientes tiene cada ciudad?
SELECT ciudad, COUNT(id_cliente) AS Total_Clientes FROM cliente GROUP BY ciudad;

-- 7. ¿Cuál fue el pago promedio en 2009?
SELECT AVG(total_pago) AS promedio_2009 FROM pagos WHERE YEAR(fecha_pago) = 2009;

-- 8. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
SELECT estado, COUNT(id_pedido) AS numero_pedidos FROM pedido GROUP BY estado ORDER BY count(id_pedido) DESC;

--  9. Calcula el precio de venta del producto más caro y barato en una misma consulta.
SELECT MIN(precio_venta) AS producto_mas_barato, MAX(precio_venta) AS producto_mas_caro FROM producto;

-- 10. Devuelve el nombre del cliente con mayor límite de crédito.
SELECT concat(nombre, " ", apellido) AS Mayor_limite_credito FROM cliente ORDER BY limite_credito DESC LIMIT 1;

-- 11. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT nombre AS producto_mas_caro_nombre FROM producto ORDER BY precio_venta DESC LIMIT 1;

-- 12. Devuelve el nombre del producto del que se han vendido más unidades.
SELECT producto.nombre FROM producto LEFT JOIN pedido ON producto.id_producto = pedido.id_producto GROUP BY producto.nombre ORDER BY COUNT(pedido.id_producto) DESC LIMIT 1;

-- 13. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
SELECT * from cliente where limite_credito IS NOT NULL; -- dado que todos los clientes tienen un limite de crédito superior a sus pagos.

-- 14. Devuelve el listado de clientes indicando el nombre del cliente y cuantos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
SELECT cliente.nombre, count(pedido.cod_cliente)  AS Total_pedidos From pedido INNER JOIN cliente on cliente.id_cliente = pedido.cod_cliente group by cliente.nombre;

-- 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
SELECT nombre, concat(apellido1, " ", apellido2) AS apellidos, puesto, oficina.telefono AS telefono_oficina FROM empleado INNER JOIN oficina on empleado.id_oficina = oficina.id_oficina WHERE empleado.id_empleado NOT IN (SELECT DISTINCT cod_empleado FROM cliente Where cod_empleado IS NOT NULL);

-- 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que 
-- haya realizado la compra de algún producto de la gama Ramo pequeño.

SELECT * FROM oficina 
WHERE oficina.id_oficina NOT IN (
    SELECT DISTINCT empleado.id_oficina
    FROM empleado WHERE empleado.id_empleado IN ( SELECT DISTINCT cliente.cod_empleado FROM cliente WHERE cliente.id_cliente 
    IN ( SELECT DISTINCT pedido.cod_cliente FROM pedido WHERE pedido.id_producto IN (7, 10))) -- Los id de producto correspondientes a la gama "Ramo pequeño"))
);

-- 17. Devuelve el listado de clientes indicando el nombre del cliente y cuantos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
SELECT CONCAT(cliente.nombre, " ", cliente.apellido) AS nombre_cliente, count(pedido.id_pedido) AS pedidos_realizados FROM Cliente 
LEFT JOIN pedido ON cliente.id_cliente = pedido.cod_cliente GROUP BY cliente.nombre, cliente.apellido;

-- 18. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
-- realizado ningún pago.
SELECT CONCAT(cliente.nombre, " ", cliente.apellido) AS nombre_cliente, COALESCE(SUM(pagos.total_pago), 0) AS total_pagado FROM cliente
LEFT JOIN pagos ON cliente.id_cliente = pagos.id_cliente
GROUP BY cliente.nombre, cliente.apellido;
