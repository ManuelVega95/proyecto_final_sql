-- SENTENCIAS TCL --

/*
SELECT @@AUTOCOMMIT;
SET @@AUTOCOMMIT = 0; -- Se necesita poner el autocommit en 0 para desactivar la variable, y empezar con las transacciones.
*/

-- TCL 1 - ELIMINAR REGISTROS --

START TRANSACTION;

DELETE FROM Seleccion WHERE id_Seleccion = 24;
-- SELECT * FROM Seleccion;
-- rollback;
-- commit;
DELETE FROM Seleccion WHERE id_Seleccion = 25;
-- SELECT * FROM Seleccion;
-- rollback;
-- commit;

INSERT INTO Seleccion (Pais, Continente, Confederacion, Promedio_Edad, Valor, Cantidad_Jugadores, Puntos)
VALUES('Nigeria', 'África', 'CAF', '26.2', '347000000', '23', '1481');

INSERT INTO Seleccion (Pais, Continente, Confederacion, Promedio_Edad, Valor, Cantidad_Jugadores, Puntos)
VALUES('Noruega', 'Europa', 'UEFA', '26.5', '395000000', '25', '1464');

-- TCL 2 - AGREGAR REGISTROS --

START TRANSACTION;

INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club, id_Entrenador, id_Estadio, id_Torneo_Nacional, id_Torneo_Internacional)
VALUES('Estudiantes LP', 'EST', 'Argentina', '21', '21', '1', '2');

INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club, id_Entrenador, id_Estadio, id_Torneo_Nacional, id_Torneo_Internacional)
VALUES('Argentinos Juniors', 'ARG', 'Argentina', '22', '22', '1', '1');

INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club, id_Entrenador, id_Estadio, id_Torneo_Nacional, id_Torneo_Internacional)
VALUES('Gimnasia LP', 'GIM', 'Argentina', '23', '23', '1', '2');

INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club, id_Entrenador, id_Estadio, id_Torneo_Nacional, id_Torneo_Internacional)
VALUES('Patronato', 'PAT', 'Argentina', '24', '24', '1', '1');

SAVEPOINT Clubes_Argentinos;

INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club, id_Entrenador, id_Estadio, id_Torneo_Nacional, id_Torneo_Internacional)
VALUES('Mónaco', 'MON', 'Francia', '25', '25', '6', '3');

INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club, id_Entrenador, id_Estadio, id_Torneo_Nacional, id_Torneo_Internacional)
VALUES('Colo Colo', 'COL', 'Chile', '26', '26', '13', '1');

INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club, id_Entrenador, id_Estadio, id_Torneo_Nacional, id_Torneo_Internacional)
VALUES('Peñarol', 'PEÑ', 'Uruguay', '27', '27', '11', '2');

INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club, id_Entrenador, id_Estadio, id_Torneo_Nacional, id_Torneo_Internacional)
VALUES('Celtic', 'CEL', 'Escocia', '28', '28', '18', '3');

SAVEPOINT Clubes_Internacionales;

-- RELEASE SAVEPOINT Clubes_Argentinos; - eliminamos el primer savepoint.
-- commit;
