CREATE TABLE `coches` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `modelo` varchar(255),
  `marca` varchar(255),
  `precio` int(20),
  `stock` int(255)
);

CREATE TABLE `grupos` (
  `id` int PRIMARY KEY,
  `nombre` varchar(255),
  `ciudad` varchar(255)
);

CREATE TABLE `vendedores` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `grupo_id` int,
  `nombre` varchar(255),
  `apellidos` varchar(255),
  `cargo` varchar(255),
  `sueldo` float,
  `comision` float,
  `jefe` varchar(255)
);

CREATE TABLE `clientes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `vendedor_id` int,
  `nombre` varchar(255),
  `ciudad` varchar(255),
  `gastado` float
);

CREATE TABLE `encargos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` int,
  `coche_id` int,
  `cantidad` int,
  `fecha` date
);

ALTER TABLE `vendedores` ADD FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`);

ALTER TABLE `clientes` ADD FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`id`);

ALTER TABLE `encargos` ADD FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

ALTER TABLE `encargos` ADD FOREIGN KEY (`coche_id`) REFERENCES `coches` (`id`);
