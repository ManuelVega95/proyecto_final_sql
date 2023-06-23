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

-- CALL sp_ordenar_clubes('', ''); 
-- en el primer parámetro hay que agregar el nombre de una columna de la tabla Club (SELECT * FROM Club), y en el otro parámetro ASC o DESC para ver el orden requerido. EJEMPLO: CALL sp_ordenar_clubes('Nombre_Club', 'DESC'); 

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
-- usando el SELECT * FROM Club podemos comprobar que se agregaron los datos.

-- SP 3 -- 
DROP PROCEDURE IF EXISTS sp_eliminar_jugador;
DELIMITER //
CREATE PROCEDURE sp_eliminar_jugador (
									IN e_id_Jugador INT
                                    )
BEGIN
	DELETE FROM Jugador WHERE id_Jugador = e_id_Jugador;
END //
DELIMITER ;

-- CALL sp_eliminar_jugador(); -- la idea es eliminar un jugador de la base de datos usando un ítem de la columna id_Jugador (SELECT * FROM Jugador)

-- SP 4 -- 
DROP PROCEDURE IF EXISTS sp_editar_seleccion;
DELIMITER //
CREATE PROCEDURE sp_editar_seleccion (
									IN e_Pais VARCHAR(150),
                                    IN e_id_Seleccion INT
                                    )
BEGIN
	UPDATE Seleccion SET Pais = e_Pais WHERE id_Seleccion = e_id_Seleccion;
END //
DELIMITER ;

-- CALL sp_editar_seleccion('', ); -- la idea es editar, según el id que sería el segundo parámetro a elegir, el nombre del país de alguna selección de la base de datos (SELECT * FROM Seleccion)
