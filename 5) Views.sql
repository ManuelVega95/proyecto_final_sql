-- VIEWS --

-- View 1 --
CREATE VIEW vw_Clubes_Argentinos as (
SELECT *
FROM Club
WHERE Pais_Club like '%Argentina%'
ORDER BY Nombre_Club ASC
);

-- View 2 --
CREATE VIEW vw_Delanteros as
(SELECT id_Jugador as Id, Apellido_Jugador as Apellido, Nombre_Jugador as Nombre, Posición_Jugador as Posición, id_Club, Dorsal_Jugador as Dorsal
FROM Jugador
WHERE Posición_Jugador like '%Delantero%'
ORDER BY Apellido_Jugador ASC
);

-- View 3 --
CREATE VIEW vw_Promedio_Valor_Jugadores as
(SELECT Count(*) as Total_Jugadores, AVG(Valor_Pase) as Promedio_Valor
FROM Jugador
);

-- View 4 --
CREATE VIEW vw_Copas_Sudamericanas_y_Europeas as
(SELECT id_Torneo_Internacional as Id, Torneo_Internacional as Copa, Continente
FROM Torneos_Internacionales
WHERE Continente like '%Sudamérica%' or Continente like '%Europa%'
); 

-- View 5 --
CREATE VIEW vw_Información_Completa as
(SELECT j.id_Jugador as Id,
j.Nombre_Jugador as Nombre, 
j.Apellido_Jugador as Apellido,
j.Nacionalidad_Jugador as Nacionalidad, 
c.Nombre_Club as Club,
en.Apellido_Entrenador as Director_Técnico,
es.Nombre_Estadio as Estadio
FROM Jugador as j
INNER JOIN Club as c ON j.id_Jugador = c.id_Club
INNER JOIN Estadio as es ON j.id_Jugador = es.id_Estadio
INNER JOIN Entrenador as en ON j.id_Jugador = en.id_Entrenador
);

-- View 6 --
CREATE VIEW vw_Selecciones_Campeonas_del_Mundo as
(SELECT s.id_Seleccion as Id,
s.Pais as Seleccion,
s.Continente,
s.Confederacion,
c.Titulos,
c.Ultimo_Titulo
FROM Seleccion as s
INNER JOIN Copas_Del_Mundo as c ON s.id_Seleccion = c.id_Copas_del_Mundo and c.Ultimo_Titulo
ORDER BY c.Titulos DESC
);

-- View 7 --
CREATE VIEW vw_Selecciones_Subcampeonas_del_Mundo as
(SELECT s.id_Seleccion as Id,
s.Pais as Seleccion,
s.Continente,
s.Confederacion,
c.Titulos,
c.Ultimo_Titulo,
c.Subcampeonatos
FROM Seleccion as s
INNER JOIN Copas_Del_Mundo as c ON s.id_Seleccion = c.id_Copas_del_Mundo and c.Subcampeonatos
ORDER BY c.Subcampeonatos DESC
);

-- View 8 --
CREATE VIEW vw_Selecciones_Terceras_del_Mundo as
(SELECT s.id_Seleccion as Id,
s.Pais as Seleccion,
s.Continente,
s.Confederacion,
c.Titulos,
c.Ultimo_Titulo,
c.Subcampeonatos,
c.Tercer_Puesto
FROM Seleccion as s
INNER JOIN Copas_Del_Mundo as c ON s.id_Seleccion = c.id_Copas_del_Mundo and c.Tercer_Puesto
ORDER BY c.Tercer_Puesto DESC
);

-- View 9 --
CREATE VIEW vw_Selecciones_Cuartas_del_Mundo as
(SELECT s.id_Seleccion as Id,
s.Pais as Seleccion,
s.Continente,
s.Confederacion,
c.Titulos,
c.Ultimo_Titulo,
c.Subcampeonatos,
c.Tercer_Puesto,
c.Cuarto_Puesto
FROM Seleccion as s
INNER JOIN Copas_Del_Mundo as c ON s.id_Seleccion = c.id_Copas_del_Mundo and c.Cuarto_Puesto
ORDER BY c.Cuarto_Puesto DESC
);

-- View 10 --
CREATE VIEW vw_Selecciones_Top_4_de_Mundiales as
(SELECT s.id_Seleccion as Id,
s.Pais as Seleccion,
s.Continente,
s.Confederacion,
c.Titulos,
c.Ultimo_Titulo,
c.Subcampeonatos,
c.Tercer_Puesto,
c.Cuarto_Puesto
FROM Seleccion as s
INNER JOIN Copas_Del_Mundo as c ON s.id_Seleccion = c.id_Copas_del_Mundo and c.Titulos and c.Subcampeonatos and c.Tercer_Puesto and c.Cuarto_Puesto
ORDER BY s.Pais ASC
);

-- View 11 --
CREATE VIEW vw_Selecciones_Nacionales as
(SELECT s.id_Seleccion as Id,
s.Pais as Seleccion,
s.Continente,
s.Confederacion,
c.Titulos,
c.Ultimo_Titulo,
c.Subcampeonatos,
c.Tercer_Puesto,
c.Cuarto_Puesto
FROM Seleccion as s
INNER JOIN Copas_Del_Mundo as c ON s.id_Seleccion = c.id_Copas_del_Mundo
ORDER BY s.Pais ASC
);
