DROP DATABASE IF EXISTS notas_db;
CREATE DATABASE notas_db;
USE notas_db;

CREATE TABLE `usuarios` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `nombre` VARCHAR(100),
   `email` VARCHAR(100) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `notas` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `titulo` VARCHAR(100) NOT NULL,
   `fecha_creacion` DATETIME NOT NULL,
   `ultima_modificacion` DATETIME NOT NULL,
   `descripcion` TEXT NOT NULL,
   `puede_eliminarse` TINYINT(1) NOT NULL,
   `usuario_id` INT NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `categorias` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `nombre_categoria` VARCHAR(100) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `nota_categoria` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `nota_id` INT NOT NULL,
   `categoria_id` INT NOT NULL,
   PRIMARY KEY (`id`)
);


ALTER TABLE `notas` ADD CONSTRAINT `FK_5efa5472-e84d-429c-aeb4-b8db49797b4b` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios`(`id`)  ;

ALTER TABLE `nota_categoria` ADD CONSTRAINT `FK_3f8b0283-1b05-4455-a119-b9a5f211c538` FOREIGN KEY (`nota_id`) REFERENCES `notas`(`id`)  ;

ALTER TABLE `nota_categoria` ADD CONSTRAINT `FK_c5ba8ceb-a282-4dde-99d4-a73ff59d481a` FOREIGN KEY (`categoria_id`) REFERENCES `categorias`(`id`)  ;


-- Agregando los registros:

INSERT INTO notas_db.usuarios VALUES 
(DEFAULT, 'Maida', 'maidh@gmail.com'),
(DEFAULT, 'Sofi', 'sofidh@gmail.com'),
(DEFAULT, 'Mila', 'miladh@gmail.com'),
(DEFAULT, 'Manu', 'manu@gmail.com'),
(DEFAULT, 'Nico', 'nico@gmail.com'),
(DEFAULT, 'Luz', 'luz.dh@gmail.com'),
(DEFAULT, 'Alejandra', 'ale.b@gmail.com'),
(DEFAULT, 'Nacho', 'isnachoh@gmail.com'),
(DEFAULT, 'Tom', 'w.tom@gmail.com'),
(DEFAULT, 'Ramiro', 'ramiro.st@gmail.com');

INSERT INTO notas_db.categorias VALUES 
(DEFAULT, 'Canciones'),
(DEFAULT, 'Gastos'),
(DEFAULT, 'Deporte'),
(DEFAULT, 'Cursos'),
(DEFAULT, 'Proyectos'),
(DEFAULT, 'Viajes'),
(DEFAULT, 'Musica'),
(DEFAULT, 'Facturas'),
(DEFAULT, 'Danza'),
(DEFAULT, 'Recetas');

INSERT INTO notas_db.notas VALUES
(DEFAULT, 'Muestra', NOW(), NOW(), 'Las canciones deben durar 3 minutos', 1, 6),
(DEFAULT, 'Grabacion', NOW(), NOW(), 'O pato, Desafinado, Alguem cantando, Vuelo', 0, 6),
(DEFAULT, 'Uruguay', NOW(), NOW(), 'Averiguar por requisitos', 0, 1),
(DEFAULT, 'Contempo', NOW(), NOW(), 'Arte XXI', 0, 1),
(DEFAULT, 'Guacamole', NOW(), NOW(), 'Ingredientes: 3 Paltas, 1 morron rojo, 1 cebolla morada, 2 limones, sal y chile. Pasos: 1) Cortar el morron, el chile y la cebolla en cuadrados finitos, 2) Pisar las paltas con un tenedor, 3) Agregarle limon y sal 4) Mezclar todo ', 0, 4),
(DEFAULT, 'Italia', NOW(), NOW(), 'Averiguar PCR', 0, 4),
(DEFAULT, 'Italiano', NOW(), NOW(), 'Dante', 0, 4),
(DEFAULT, 'Frances', NOW(), NOW(), 'Alianza Francesa', 0, 9),
(DEFAULT, 'Programacion', NOW(), NOW(), 'Digital House, React, UX', 0, 9),
(DEFAULT, 'Lemon Pie', NOW(), NOW(), 'Ingredientes: 2 huevos, harina 0000, leche condensada, 4 limones', 0, 9);


INSERT INTO notas_db.nota_categoria VALUES
(DEFAULT, 1, 1),
(DEFAULT, 1, 7),
(DEFAULT, 2, 1),
(DEFAULT, 2, 7),
(DEFAULT, 2, 5),
(DEFAULT, 3, 6),
(DEFAULT, 4, 9),
(DEFAULT, 5, 10),
(DEFAULT, 6, 6),
(DEFAULT, 7, 4),
(DEFAULT, 8, 4),
(DEFAULT, 9, 4),
(DEFAULT, 9, 5),
(DEFAULT, 10, 10);

-- Pruebas:

SELECT * FROM notas_db.nota_categoria 
INNER JOIN notas_db.notas ON nota_categoria.nota_id = notas.id 
INNER JOIN notas_db.categorias ON nota_categoria.categoria_id = categorias.id ;

SELECT * FROM notas_db.notas
INNER JOIN notas_db.usuarios ON notas.usuario_id = usuarios.id; 












