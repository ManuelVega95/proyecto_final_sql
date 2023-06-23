-- CREAR USUARIOS Y DAR PERMISOS --

-- USE mysql;

-- USUARIO 1 --

CREATE USER if not exists 'user_sl'@'localhost' IDENTIFIED BY '12345'; 
-- el Create User sirve para la creación del usuario 'user_sl'@'localhost', que podrá tener acceso a solo lectura de todas las tablas.

GRANT SELECT ON Futbol_Proyecto_Final_SQL.* to 'user_sl'@'localhost';
-- con este Grant, lo que le permitimos al usuario creado anteriormente 'user_sl'@'localhost', es que pueda tener la vista de todas las tablas del esquema Futbol_Proyecto_Final_SQL.
-- usando el 'USE Futbol_Proyecto_Final_SQL;' en el nuevo usuario podríamos ver cada tabla del esquema anterior.

-- USUARIO 2 --

CREATE USER if not exists 'user_sl_in_up'@'localhost' IDENTIFIED BY '67890';
-- el Create User sirve para la creación del usuario 'user_sl_in_up'@'localhost', que podrá tener acceso a la lectura, realizar cambios y actualizar en todas las tablas,.

GRANT SELECT, INSERT, UPDATE ON Futbol_Proyecto_Final_SQL.* to 'user_sl_in_up'@'localhost';
-- con este Grant, lo que le permitimos al usuario creado anteriormente 'user_sl_in_up'@'localhost', es que pueda tener la vista de todas las tablas, poder realizar modificaciones y agregar información nueva en el esquema Futbol_Proyecto_Final_SQL.
-- usando el 'USE Futbol_Proyecto_Final_SQL;' en el nuevo usuario podríamos realizar los SELECT, INSERT y UPDATE del esquema anterior.
