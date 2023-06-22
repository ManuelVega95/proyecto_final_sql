DROP TABLE IF EXISTS Seleccion;
CREATE TABLE IF NOT EXISTS Seleccion (-- en esta tabla incluiremos las selecciones nacionales con sus datos precisos según la tabla general. La moneda utilizada es el euro
id_Seleccion INT PRIMARY KEY AUTO_INCREMENT,
Pais VARCHAR (100) NOT NULL,
Continente VARCHAR (50),
Confederacion VARCHAR (100),
Promedio_Edad DECIMAL (6, 2),
Valor BIGINT,
Cantidad_Jugadores TINYINT,
Puntos SMALLINT
);

DROP TABLE IF EXISTS Entrenador;
CREATE TABLE IF NOT EXISTS Entrenador ( -- esta tabla la integrarán los datos de los entrenadores de los distintos clubes
id_Entrenador INT PRIMARY KEY AUTO_INCREMENT,
Nombre_Entrenador VARCHAR (30) NOT NULL,
Apellido_Entrenador VARCHAR (30) NOT NULL,
Nacionalidad_Entrenador VARCHAR (30),
id_Club INT
);

DROP TABLE IF EXISTS Estadio;
CREATE TABLE IF NOT EXISTS Estadio ( -- en esta tabla, tendremos a los estadios de los clubes mencionados en la tabla Clubes
id_Estadio INT PRIMARY KEY AUTO_INCREMENT,
Nombre_Estadio VARCHAR (50) NOT NULL,
Capacidad BIGINT,
id_Club INT
);

DROP TABLE IF EXISTS Torneos_Nacionales;
CREATE TABLE IF NOT EXISTS Torneos_Nacionales ( -- esta tabla la integrarán los torneos locales que disputen los clubes 
id_Torneo_Nacional INT PRIMARY KEY AUTO_INCREMENT,
Torneo_Nacional VARCHAR (50) NOT NULL,
Pais_Torneo VARCHAR (50)
);

DROP TABLE IF EXISTS Torneos_Internacionales;
CREATE TABLE IF NOT EXISTS Torneos_Internacionales ( -- a diferencia de la tabla anterior, acá estarán los torneos que disputen los clubes pero a nivel internacional
id_Torneo_Internacional INT PRIMARY KEY AUTO_INCREMENT,
Torneo_Internacional VARCHAR (50) NOT NULL,
Continente VARCHAR (40)
);

DROP TABLE IF EXISTS Club;
CREATE TABLE IF NOT EXISTS Club ( -- en esta tabla, estarán los datos de los distintos clubes, y es la que se unirá con todas las demás tablas de la base de datos
id_Club INT PRIMARY KEY AUTO_INCREMENT,
Nombre_Club VARCHAR (40) NOT NULL,
Abreviatura_Club VARCHAR (10),
Pais_Club VARCHAR (20),
id_Entrenador INT,
id_Estadio INT,
id_Torneo_Nacional INT,
id_Torneo_Internacional INT,
FOREIGN KEY (id_Entrenador) REFERENCES Entrenador (id_Entrenador),
FOREIGN KEY (id_Estadio) REFERENCES Estadio (id_Estadio),
FOREIGN KEY (id_Torneo_Nacional) REFERENCES Torneos_Nacionales (id_Torneo_Nacional),
FOREIGN KEY (id_Torneo_Internacional) REFERENCES Torneos_Internacionales (id_Torneo_Internacional)
); 

DROP TABLE IF EXISTS Jugador;
CREATE TABLE IF NOT EXISTS Jugador ( -- en esta tabla se buscará informar acerca de cada jugador, con sus datos más importantes. La moneda utilizada para cada jugador es el euro
id_Jugador INT PRIMARY KEY AUTO_INCREMENT,
Nombre_Jugador VARCHAR (30) NOT NULL,
Apellido_Jugador VARCHAR (30) NOT NULL,
Nacionalidad_Jugador VARCHAR (30),
Posición_Jugador VARCHAR (30) NOT NULL,
Dorsal_Jugador TINYINT NOT NULL,
Altura_Jugador DECIMAL (6, 2),
Valor_Pase BIGINT, 
id_Seleccion INT,
id_Club INT,
id_Entrenador INT,
Fecha_Nacimiento DATE,
FOREIGN KEY (id_Seleccion) REFERENCES Seleccion (id_Seleccion),
FOREIGN KEY (id_Entrenador) REFERENCES Entrenador (id_Entrenador),
FOREIGN KEY (id_Club) REFERENCES Club (id_Club)
);

DROP TABLE IF EXISTS Copas_del_Mundo;
CREATE TABLE IF NOT EXISTS Copas_del_Mundo (-- en esta tabla pondremos cuántas veces una selección terminó entre los primeros 4 de un Mundial de Fútbol
id_Copas_del_Mundo INT PRIMARY KEY AUTO_INCREMENT,
id_Seleccion INT,
Titulos TINYINT,
Ultimo_Titulo INT,
Subcampeonatos TINYINT,
Tercer_Puesto TINYINT,
Cuarto_Puesto TINYINT,
FOREIGN KEY (id_Seleccion) REFERENCES Seleccion (id_Seleccion)
);
