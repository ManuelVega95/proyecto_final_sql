-- STORED PROCEDURES --

-- SP 1 -- 
DROP PROCEDURE IF EXISTS sp_ordenar_clubes;
DELIMITER //
CREATE PROCEDURE sp_ordenar_clubes (IN orden VARCHAR(50),
									IN asc_o_desc VARCHAR(50)
                                    )
BEGIN
	SET @club_order = CONCAT('SELECT * FROM Club ORDER BY (', orden, ')', asc_o_desc);
	PREPARE stmt FROM @club_order;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END // 
DELIMITER ;

-- CALL sp_ordenar_clubes('', ''); -- en el primer parámetro hay que agregar el nombre de una columna de la tabla Club (SELECT * FROM Club), y en el otro parámetro ASC o DESC para ver el orden requerido. 
-- EJEMPLO: CALL sp_ordenar_clubes('Nombre_Club', 'DESC'); 
-- SELECT * FROM CLUB;

-- SP 2 -- 
DROP PROCEDURE IF EXISTS sp_insertar_clubes;
DELIMITER //
CREATE PROCEDURE sp_insertar_clubes (
									IN c_Nombre_Club VARCHAR(40), 
                                    IN c_Abreviatura_Club VARCHAR(10), 
                                    IN c_Pais_Club VARCHAR(20)
                                    )
BEGIN
	INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club)
	VALUES (c_Nombre_Club, c_Abreviatura_Club, c_Pais_Club);
END //
DELIMITER ;

-- CALL sp_insertar_clubes('', '', ''); -- en este ejemplo, habría que agregar el nombre del club, abreviatura del club, y país del club (SELECT * FROM Club) para agregar un club nuevo. Como el ID tiene auto_increment, no es necesario añadirlo.
-- EJEMPLO: CALL sp_insertar_clubes('campo1', 'campo2', 'campo3');
-- SELECT * FROM CLUB;
-- SELECT * FROM Log_Club;

-- SP 3 -- 
DROP PROCEDURE IF EXISTS sp_eliminar_jugador;
DELIMITER //
CREATE PROCEDURE sp_eliminar_jugador (
									IN j_id_Jugador INT
                                    )
BEGIN
	DELETE FROM Jugador WHERE id_Jugador = j_id_Jugador;
END //
DELIMITER ;

-- CALL sp_eliminar_jugador(); -- la idea es eliminar un jugador de la base de datos usando un ítem de la columna id_Jugador (SELECT * FROM Jugador)
-- EJEMPLO: CALL sp_eliminar_jugador(20);
-- SELECT * FROM JUGADOR;
-- SELECT * FROM Log_Jugador;

-- SP 4 -- 
DROP PROCEDURE IF EXISTS sp_editar_seleccion;
DELIMITER //
CREATE PROCEDURE sp_editar_seleccion (
									IN s_Pais VARCHAR(50),
                                    IN s_Continente VARCHAR(50),
                                    IN s_Confederacion VARCHAR(50),
                                    IN s_Promedio_Edad DECIMAL (6,2),
                                    IN s_Valor BIGINT,
                                    IN s_Cantidad_Jugadores TINYINT,
                                    IN s_Puntos SMALLINT,
                                    IN s_id_Seleccion INT
                                    )
BEGIN
	UPDATE Seleccion SET Pais = s_Pais, Continente = s_Continente, Confederacion = s_Confederacion, Promedio_Edad = s_Promedio_Edad, Valor = s_Valor, Cantidad_Jugadores = S_Cantidad_Jugadores, Puntos = s_Puntos WHERE id_Seleccion = s_id_Seleccion;
END //
DELIMITER ;

-- CALL sp_editar_seleccion('', '', '', '', '', '', '',  ); -- la idea es editar, según el id que sería el último parámetro a elegir, el país de la base de datos, modificando todos sus campos (SELECT * FROM Seleccion)
-- EJEMPLO: CALL sp_editar_seleccion('campo1', 'campo2', 'campo3', '25.5', '10000000', '32', '3500', 3 );
-- SELECT * FROM SELECCION;
-- SELECT * FROM Log_Seleccion;
