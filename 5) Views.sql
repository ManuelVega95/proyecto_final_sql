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
