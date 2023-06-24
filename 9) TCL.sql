-- SENTENCIAS TCL --

/*
SELECT @@AUTOCOMMIT;
SET @@AUTOCOMMIT = 0; -- Se necesita poner el autocommit en 0 para desactivar la variable, y empezar con las transacciones.
*/

-- TCL 1 - ELIMINAR REGISTROS --

START TRANSACTION;

DELETE FROM Jugador WHERE id_Jugador = 19;
-- SELECT * FROM Jugador;
-- rollback;
-- commit;
DELETE FROM Jugador WHERE id_Jugador = 20;
-- SELECT * FROM Jugador;
-- rollback;
-- commit;

-- 19 --
-- INSERT INTO Jugador (Nombre_Jugador, Apellido_Jugador, Nacionalidad_Jugador, Posición_Jugador, Dorsal_Jugador, Altura_Jugador, Valor_Pase, id_Seleccion, id_Club, id_Entrenador, Fecha_Nacimiento )
-- VALUES('Martin', 'Ødegaard', 'Noruego', 'Mediocampista', '8', '1.78', 80000000, '25', '19', '19', '1998-12-17');

-- 20 --
-- INSERT INTO Jugador (Nombre_Jugador, Apellido_Jugador, Nacionalidad_Jugador, Posición_Jugador, Dorsal_Jugador, Altura_Jugador, Valor_Pase, id_Seleccion, id_Club, id_Entrenador, Fecha_Nacimiento )
-- VALUES('Virgil', 'Van Dijk', 'Holandés', 'Defensor', '4', '1.93', 45000000, '6', '20', '20', '1991-07-08');


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

-- RELEASE SAVEPOINT Clubes_Argentinos; -- eliminamos el primer savepoint.
-- commit;
