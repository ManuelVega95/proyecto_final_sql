-- TRIGGERS -- 

-- TABLAS NUEVAS --
DROP TABLE IF EXISTS LOG_Jugador; -- lo que se mostrará en esta tabla será la acción (upd, ins, del) realizada, con una breve descripción, el nombre y apellido del jugador (por un lado la antigua, y por el otro la nueva cuando sea necesario), el usuario que realizó el informe y la hora y fecha exacta en el que ocurrió.
CREATE TABLE IF NOT EXISTS LOG_Jugador (
id_Log INT PRIMARY KEY AUTO_INCREMENT,
Accion VARCHAR(25),
Descripcion VARCHAR(100),
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Campo_Nuevo_Nombre VARCHAR(50),
Campo_Nuevo_Apellido VARCHAR(50),
Usuario VARCHAR(100),
Fecha_Upd_Ins_Del DATE,
Hora_Upd_Ins_Del TIME
);

DROP TABLE IF EXISTS LOG_Club; -- lo que se mostrará en esta tabla será la acción (upd, ins, del) realizada, con una breve descripción, el nombre del club que sufrirá cambios (por un lado el nombre antiguo, y por el otro el nuevo cuando sea necesario), el usuario que realizó el informe y la hora y fecha exacta en el que ocurrió.
CREATE TABLE IF NOT EXISTS LOG_Club (
id_Log INT PRIMARY KEY AUTO_INCREMENT,
Accion VARCHAR(25),
Descripcion VARCHAR(100),
Club VARCHAR(100),
Nombre_Club_Nuevo VARCHAR(50),
Usuario VARCHAR(100),
Fecha_Upd_Ins_Del DATE,
Hora_Upd_Ins_Del TIME
);

DROP TABLE IF EXISTS LOG_Seleccion; -- lo que se mostrará en esta tabla será la acción (upd, ins, del) realizada, con una breve descripción, el nombre de la selección que sufrirá cambios (por un lado el nombre antiguo, y por el otro el nuevo cuando sea necesario), el usuario que realizó el informe y la hora y fecha exacta en el que ocurrió.
CREATE TABLE IF NOT EXISTS LOG_Seleccion (
id_Log INT PRIMARY KEY AUTO_INCREMENT,
Accion VARCHAR(25),
Descripcion VARCHAR(100),
Selección VARCHAR(100),
Nombre_Selección_Nuevo VARCHAR(50),
Usuario VARCHAR(100),
Fecha_Upd_Ins_Del DATE,
Hora_Upd_Ins_Del TIME
);

-- LOG_JUGADOR --

-- Trigger INSERT para la tabla LOG_Jugador. Buscaremos informar acerca de los nuevos jugadores que se agreguen a la Base de Datos. --
DROP TRIGGER IF EXISTS log_insertar_jugador;
DELIMITER //
CREATE TRIGGER log_insertar_jugador AFTER INSERT ON Jugador
FOR EACH ROW
BEGIN
INSERT INTO LOG_Jugador (Accion, Descripcion, Nombre, Apellido, Campo_Nuevo_Nombre, Campo_Nuevo_Apellido, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Insert', concat('Se agregó al jugador: '), NEW.Nombre_Jugador, NEW.Apellido_Jugador, '' , '', CURRENT_USER(), NOW(), NOW());
END//
DELIMITER ;
-- EJEMPLO: INSERT INTO Jugador (Nombre_Jugador, Apellido_Jugador, Nacionalidad_Jugador, Posición_Jugador, Dorsal_Jugador, Altura_Jugador, Valor_Pase, id_Seleccion, id_Club, id_Entrenador, Fecha_Nacimiento) VALUES ('campo1', 'campo2', 'campo3', 'campo4', '32', '1.70', '10000000', '1', '21', '21', '1990-10-19'); 
-- SELECT * FROM Jugador;
-- SELECT * FROM LOG_Jugador;

-- Trigger UPDATE para la tabla LOG_Jugador. Se mostrarán los casos donde haya alguna modificación en la tabla Jugadores. --
DROP TRIGGER IF EXISTS log_editar_jugador;
DELIMITER //
CREATE TRIGGER log_editar_jugador AFTER UPDATE ON Jugador
FOR EACH ROW
BEGIN
INSERT INTO LOG_Jugador (Accion, Descripcion, Nombre, Apellido, Campo_Nuevo_Nombre, Campo_Nuevo_Apellido, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Update', concat('Se modificó al jugador: '), OLD.Nombre_Jugador, OLD.Apellido_Jugador, NEW.Nombre_Jugador , NEW.Apellido_Jugador , CURRENT_USER(), NOW(), NOW());
END//
DELIMITER ;
-- EJEMPLO: UPDATE Jugador SET Nombre_Jugador = 'campo3', Apellido_Jugador = 'campo4' WHERE id_Jugador = 21; -- el id_Jugador 21 existe en caso de que hayamos hecho el insert anterior, sino podemos usar alguno del 1 al 20.
-- SELECT * FROM Jugador;
-- SELECT * FROM LOG_Jugador;

-- Trigger DELETE para la tabla LOG_Jugador. Se informará el momento exacto en el que cierto usuario elimine un jugador de la Base de datos. --
DROP TRIGGER IF EXISTS log_eliminar_jugador;
DELIMITER //
CREATE TRIGGER log_eliminar_jugador BEFORE DELETE ON Jugador
FOR EACH ROW
BEGIN
INSERT INTO LOG_Jugador (Accion, Descripcion, Nombre, Apellido, Campo_Nuevo_Nombre, Campo_Nuevo_Apellido, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Delete', concat('Se eliminó al jugador: '), OLD.Nombre_Jugador, OLD.Apellido_Jugador, '', '', CURRENT_USER(), NOW(), NOW());
END//
DELIMITER ;
-- EJEMPLO: DELETE FROM Jugador WHERE id_Jugador = 21; -- en caso de haber hecho el primer ejemplo, sino simplemente usamos entre el id_Jugador 1 y 20 --.
-- SELECT * FROM Jugador;
-- SELECT * FROM LOG_Jugador;

-- LOG_CLUB --

-- Trigger INSERT para la tabla LOG_Club. Buscaremos informar acerca de los nuevos clubes que se agreguen a la Base de Datos.  --
DROP TRIGGER IF EXISTS log_insertar_club;
DELIMITER //
CREATE TRIGGER log_insertar_club AFTER INSERT ON Club
FOR EACH ROW
BEGIN
INSERT INTO LOG_Club (Accion, Descripcion, Club, Nombre_Club_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Insert', concat('Se agregó al club: '), NEW.Nombre_Club, '', CURRENT_USER(), NOW(), NOW());
END//
DELIMITER ;
-- EJEMPLO: INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club, id_Entrenador, id_Estadio, id_Torneo_Nacional, id_Torneo_Internacional) VALUES ('campo1', 'campo2', 'campo3', 1, 1, 1, 1);
-- SELECT * FROM Club;
-- SELECT * FROM LOG_Club;

-- Trigger UPDATE para la tabla LOG_Club. Se mostrarán los casos donde haya alguna modificación en la tabla Club.--
DROP TRIGGER IF EXISTS log_modificar_club;
DELIMITER //
CREATE TRIGGER log_modificar_club AFTER UPDATE ON Club
FOR EACH ROW
BEGIN
INSERT INTO LOG_Club (Accion, Descripcion, Club, Nombre_Club_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Update', concat('Se modificó al club: '), OLD.Nombre_Club, NEW.Nombre_Club, CURRENT_USER(), NOW(), NOW());
END//
DELIMITER ;
-- EJEMPLO: UPDATE Club SET Nombre_Club = 'campo2' WHERE id_Club = 21; -- el id_Club 21 existe en caso de que hayamos hecho el insert anterior, sino podemos usar alguno del 1 al 20.
-- SELECT * FROM Club;
-- SELECT * FROM LOG_Club;

-- Trigger DELETE para la tabla LOG_Club.  Se informará el momento exacto en el que cierto usuario elimine un club de la Base de datos. --
DROP TRIGGER IF EXISTS log_eliminar_club;
DELIMITER //
CREATE TRIGGER log_eliminar_club BEFORE DELETE ON Club
FOR EACH ROW
BEGIN
INSERT INTO LOG_Club (Accion, Descripcion, Club, Nombre_Club_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Delete', concat('Se eliminó al club: '), OLD.Nombre_Club, '', CURRENT_USER(), NOW(), NOW());
END//
DELIMITER ;
-- EJEMPLO: DELETE FROM Club WHERE id_Club = 21; -- el id_Club 21 existe en caso de que hayamos hecho el insert anterior, sino podemos usar alguno del 1 al 20.
-- SELECT * FROM Club;
-- SELECT * FROM LOG_Club;

-- LOG_SELECCION --

-- Trigger INSERT para la tabla LOG_Seleccion. Buscaremos informar acerca de las nuevas selecciones que se agreguen a la Base de Datos.  --
DROP TRIGGER IF EXISTS log_insertar_seleccion;
DELIMITER //
CREATE TRIGGER log_insertar_seleccion AFTER INSERT ON Seleccion
FOR EACH ROW
BEGIN
INSERT INTO LOG_Seleccion (Accion, Descripcion, Selección, Nombre_Selección_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Insert', concat('Se agregó a la selección: '), NEW.Pais, '', CURRENT_USER(), NOW(), NOW());
END//
DELIMITER ;
-- EJEMPLO: INSERT INTO Seleccion (Pais, Continente, Confederacion, Promedio_Edad, Valor, Cantidad_Jugadores, Puntos) VALUES ('campo1', 'campo2', 'campo3', '25.4', 10000, 1, 1);
-- SELECT * FROM Seleccion;
-- SELECT * FROM Seleccion;

-- Trigger UPDATE para la tabla LOG_Seleccion. Se mostrarán los casos donde haya alguna modificación en la tabla Club.--
DROP TRIGGER IF EXISTS log_modificar_seleccion;
DELIMITER //
CREATE TRIGGER log_modificar_seleccion AFTER UPDATE ON Seleccion
FOR EACH ROW
BEGIN
INSERT INTO LOG_Seleccion (Accion, Descripcion, Selección, Nombre_Selección_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Update', concat('Se modificó a la selección: '), OLD.Pais, NEW.Pais, CURRENT_USER(), NOW(), NOW());
END//
DELIMITER ;
-- EJEMPLO: UPDATE Seleccion SET Pais = 'campo2' WHERE id_Seleccion = 26; -- el id_Seleccion 26 existe en caso de que hayamos hecho el insert anterior, sino podemos usar alguna del 1 al 25.
-- SELECT * FROM Seleccion;
-- SELECT * FROM LOG_Seleccion;

-- Trigger DELETE para la tabla LOG_Seleccion.  Se informará el momento exacto en el que cierto usuario elimine una selección de la Base de datos. --
DROP TRIGGER IF EXISTS log_eliminar_seleccion;
DELIMITER //
CREATE TRIGGER log_eliminar_seleccion BEFORE DELETE ON Seleccion
FOR EACH ROW
BEGIN
INSERT INTO LOG_Seleccion (Accion, Descripcion, Selección, Nombre_Selección_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Delete', concat('Se eliminó a la selección: '), OLD.Pais, '', CURRENT_USER(), NOW(), NOW());
END//
DELIMITER ;
-- EJEMPLO: DELETE FROM Seleccion WHERE id_Seleccion = 26; -- el id_Seleccion 26 existe en caso de que hayamos hecho el insert anterior, sino podemos usar alguna del 1 al 25.
-- SELECT * FROM Seleccion;
-- SELECT * FROM LOG_Seleccion;
