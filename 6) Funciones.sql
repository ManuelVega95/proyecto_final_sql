-- FUNCIONES --

-- Función 1 -- 
DROP FUNCTION IF EXISTS fn_letra_club;
DELIMITER //
CREATE FUNCTION fn_letra_club (club VARCHAR(250)) returns int
DETERMINISTIC
BEGIN
	DECLARE numero int;
	SELECT Count(*) into numero FROM Club WHERE Nombre_Club like concat('%', club, '%');
	RETURN numero;
END //
DELIMITER ;

-- SELECT fn_letra_club('') as Clubes_con_X_letra; -- simplemente nos devuelve cuántos clubes hay con la letra que escribamos.
-- EJEMPLO: SELECT fn_letra_club('a') as Clubes_con_Letra_A;

-- Extra:  SELECT left(Nombre_Club, 1) as Letra, fn_letra_club(left(Nombre_Club, 1)) as Clubes_con_X_Letra from Club; -- un detalle que vi en un tutorial para tener las letras correspondientes y comprobar que la información que se trae es cierta. 

-- Función 2 --
DROP FUNCTION IF EXISTS fn_paises_clubes;
DELIMITER //
CREATE FUNCTION fn_paises_clubes (pais VARCHAR(250)) returns int
DETERMINISTIC
BEGIN
	DECLARE numero int;
	SELECT Count(*) into numero FROM Club WHERE Pais_Club like concat('%', pais, '%' );
	RETURN numero;
END //
DELIMITER ;

-- SELECT fn_paises_clubes('') as Cantidad_Clubes; -- acá directamente escribimos el nombre de cualquier país y nos devuelve la cantidad exacta de clubes que hay de dicho país en la base de datos. 
-- EJEMPLO: SELECT fn_paises_clubes('Argentina') as Cantidad_Clubes; 
