CREATE DATABASE  IF NOT EXISTS `futbol_proyecto_final_sql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `futbol_proyecto_final_sql`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: futbol_proyecto_final_sql
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `id_Club` int NOT NULL AUTO_INCREMENT,
  `Nombre_Club` varchar(40) NOT NULL,
  `Abreviatura_Club` varchar(10) DEFAULT NULL,
  `Pais_Club` varchar(20) DEFAULT NULL,
  `id_Entrenador` int DEFAULT NULL,
  `id_Estadio` int DEFAULT NULL,
  `id_Torneo_Nacional` int DEFAULT NULL,
  `id_Torneo_Internacional` int DEFAULT NULL,
  PRIMARY KEY (`id_Club`),
  KEY `id_Entrenador` (`id_Entrenador`),
  KEY `id_Estadio` (`id_Estadio`),
  KEY `id_Torneo_Nacional` (`id_Torneo_Nacional`),
  KEY `id_Torneo_Internacional` (`id_Torneo_Internacional`),
  CONSTRAINT `club_ibfk_1` FOREIGN KEY (`id_Entrenador`) REFERENCES `entrenador` (`id_Entrenador`),
  CONSTRAINT `club_ibfk_2` FOREIGN KEY (`id_Estadio`) REFERENCES `estadio` (`id_Estadio`),
  CONSTRAINT `club_ibfk_3` FOREIGN KEY (`id_Torneo_Nacional`) REFERENCES `torneos_nacionales` (`id_Torneo_Nacional`),
  CONSTRAINT `club_ibfk_4` FOREIGN KEY (`id_Torneo_Internacional`) REFERENCES `torneos_internacionales` (`id_Torneo_Internacional`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,'Boca Juniors','BOC','Argentina',1,1,1,1),(2,'River Plate','RIV','Argentina',2,2,1,1),(3,'Racing Club','RAC','Argentina',3,3,1,1),(4,'Independiente','IND','Argentina',4,4,1,2),(5,'San Lorenzo','SLO','Argentina',5,5,1,2),(6,'Barcelona','BAR','España',6,6,2,4),(7,'Real Madrid','RMA','España',7,7,2,3),(8,'Juventus','JUV','Italia',8,8,3,4),(9,'Flamengo','FLA','Brasil',9,9,8,1),(10,'Manchester City','MCI','Inglaterra',10,10,3,3),(11,'París Saint-Germain','PSG','Francia',11,11,6,3),(12,'Bayern Munich','BAY','Alemania',12,12,5,3),(13,'Al-Nassr FC','NAS','Arabia Saudita',13,13,7,5),(14,'Manchester United','MAN','Inglaterra',14,14,3,4),(15,'Roma','ROM','Italia',15,15,4,4),(16,'Nápoli','NAP','Italia',16,16,4,3),(17,'SL Benfica','BEN','Portugal',17,17,9,3),(18,'Tottenham','TOT','Inglaterra',18,18,3,3),(19,'Arsenal','ARS','Inglaterra',19,19,3,4),(20,'Liverpool','LIV','Inglaterra',20,20,3,3);
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_insertar_club` AFTER INSERT ON `club` FOR EACH ROW BEGIN
INSERT INTO LOG_Club (Accion, Descripcion, Club, Nombre_Club_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Insert', concat('Se agregó al club: '), NEW.Nombre_Club, '', CURRENT_USER(), NOW(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_modificar_club` AFTER UPDATE ON `club` FOR EACH ROW BEGIN
INSERT INTO LOG_Club (Accion, Descripcion, Club, Nombre_Club_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Update', concat('Se modificó al club: '), OLD.Nombre_Club, NEW.Nombre_Club, CURRENT_USER(), NOW(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_eliminar_club` BEFORE DELETE ON `club` FOR EACH ROW BEGIN
INSERT INTO LOG_Club (Accion, Descripcion, Club, Nombre_Club_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Delete', concat('Se eliminó al club: '), OLD.Nombre_Club, '', CURRENT_USER(), NOW(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `copas_del_mundo`
--

DROP TABLE IF EXISTS `copas_del_mundo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copas_del_mundo` (
  `id_Copas_del_Mundo` int NOT NULL AUTO_INCREMENT,
  `id_Seleccion` int DEFAULT NULL,
  `Titulos` tinyint DEFAULT NULL,
  `Ultimo_Titulo` int DEFAULT NULL,
  `Subcampeonatos` tinyint DEFAULT NULL,
  `Tercer_Puesto` tinyint DEFAULT NULL,
  `Cuarto_Puesto` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_Copas_del_Mundo`),
  KEY `id_Seleccion` (`id_Seleccion`),
  CONSTRAINT `copas_del_mundo_ibfk_1` FOREIGN KEY (`id_Seleccion`) REFERENCES `seleccion` (`id_Seleccion`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copas_del_mundo`
--

LOCK TABLES `copas_del_mundo` WRITE;
/*!40000 ALTER TABLE `copas_del_mundo` DISABLE KEYS */;
INSERT INTO `copas_del_mundo` VALUES (1,1,3,2022,3,NULL,NULL),(2,2,2,2018,2,2,1),(3,3,5,2002,2,2,2),(4,4,NULL,NULL,NULL,1,NULL),(5,5,1,1966,NULL,NULL,2),(6,6,NULL,NULL,3,1,1),(7,7,NULL,NULL,1,2,NULL),(8,8,4,2006,2,1,1),(9,9,NULL,NULL,NULL,1,1),(10,10,1,2010,NULL,NULL,1),(11,11,NULL,NULL,NULL,NULL,1),(12,12,NULL,NULL,NULL,NULL,NULL),(13,13,NULL,NULL,NULL,1,NULL),(14,14,4,2014,4,4,1),(15,15,NULL,NULL,NULL,NULL,NULL),(16,16,2,1950,NULL,NULL,3),(17,17,NULL,NULL,NULL,NULL,NULL),(18,18,NULL,NULL,NULL,NULL,NULL),(19,19,NULL,NULL,NULL,NULL,NULL),(20,20,NULL,NULL,NULL,NULL,NULL),(21,21,NULL,NULL,NULL,2,NULL),(22,22,NULL,NULL,NULL,NULL,1),(23,23,NULL,NULL,NULL,1,NULL),(24,24,NULL,NULL,NULL,NULL,NULL),(25,25,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `copas_del_mundo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `id_Entrenador` int NOT NULL AUTO_INCREMENT,
  `Nombre_Entrenador` varchar(30) NOT NULL,
  `Apellido_Entrenador` varchar(30) NOT NULL,
  `Nacionalidad_Entrenador` varchar(30) DEFAULT NULL,
  `id_Club` int DEFAULT NULL,
  PRIMARY KEY (`id_Entrenador`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES (1,'Jorge','Almirón','Argentino',1),(2,'Martín','Demichelis','Argentino',2),(3,'Ricardo','Zielinski','Argentino',3),(4,'Fernando','Gago','Argentino',4),(5,'Rubén','Insúa','Argentino',5),(6,'Xavi','Hernández','Español',6),(7,'Carlo','Ancelotti','Italiano',7),(8,'Massimiliano','Allegri','Italiano',8),(9,'Jorge','Sampaoli','Argentino',9),(10,'Pep','Guardiola','Español',10),(11,'Christophe','Galtier','Francés',11),(12,'Thomas','Tuchel','Alemán',12),(13,'Dinko','Jelicic','Croata',13),(14,'Erik','Ten Hag','Holandés',14),(15,'José','Mourinho','Portugués',15),(16,'Luciano','Spalletti','Italiano',16),(17,'Roger','Schmidt','Alemán',17),(18,'Ryan','Mason','Inglés',18),(19,'Mikel','Arteta','Español',19),(20,'Jürgen','Klopp','Alemán',20),(21,'Eduardo','Domínguez','Argentino',21),(22,'Gabriel','Milito','Argentino',22),(23,'Sebastián','Romero','Argentino',23),(24,'Rodolfo','De Paoli','Argentino',24),(25,'Frederic','De Boever','Belga',25),(26,'Gustavo','Quinteros','Boliviano',26),(27,'Damián','Macaluso','Uruguayo',27),(28,'Ange','Postecoglou','Australiano',28);
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadio`
--

DROP TABLE IF EXISTS `estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadio` (
  `id_Estadio` int NOT NULL AUTO_INCREMENT,
  `Nombre_Estadio` varchar(50) NOT NULL,
  `Capacidad` bigint DEFAULT NULL,
  `id_Club` int DEFAULT NULL,
  PRIMARY KEY (`id_Estadio`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadio`
--

LOCK TABLES `estadio` WRITE;
/*!40000 ALTER TABLE `estadio` DISABLE KEYS */;
INSERT INTO `estadio` VALUES (1,'La Bombonera',57200,1),(2,'Más Monumental',83196,2),(3,'Libertadores de América',42069,3),(4,'Cilindro de Avellaneda',51389,4),(5,'Nuevo Gasómetro',47964,5),(6,'Camp Nou',99354,6),(7,'Santiago Bernabéu',81044,7),(8,'Allianz Stadium',41507,8),(9,'Jornalista Mário Filho',78838,9),(10,'Etihad Stadium',55017,10),(11,'Parc des Princes',49691,11),(12,'Allianz Arena',75024,12),(13,'Al-Awwal Park',25000,13),(14,'Old Trafford',74879,14),(15,'Olimpico de Roma',73261,15),(16,'Stadio Diego Armando Maradona',54726,16),(17,'Estádio da Luz',65000,17),(18,'Tottenham Hotspur Stadium',62062,18),(19,'Emirates Stadium',60704,19),(20,'Anfield',54074,20),(21,'Estadio UNO Jorge Luis Hirschi',32530,21),(22,'Estadio Diego Armando Maradona',26000,22),(23,'Juan Carmelo Zerillo',21500,23),(24,'Presbítero Bartolomé Grella',22000,24),(25,'Stade Louis-II',18523,25),(26,'Monumental David Arellano',47347,26),(27,'Campeón del Siglo',40700,27),(28,'Celtic Park',60832,28);
/*!40000 ALTER TABLE `estadio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `id_Jugador` int NOT NULL AUTO_INCREMENT,
  `Nombre_Jugador` varchar(30) NOT NULL,
  `Apellido_Jugador` varchar(30) NOT NULL,
  `Nacionalidad_Jugador` varchar(30) DEFAULT NULL,
  `Posición_Jugador` varchar(30) NOT NULL,
  `Dorsal_Jugador` tinyint NOT NULL,
  `Altura_Jugador` decimal(6,2) DEFAULT NULL,
  `Valor_Pase` bigint DEFAULT NULL,
  `id_Seleccion` int DEFAULT NULL,
  `id_Club` int DEFAULT NULL,
  `id_Entrenador` int DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_Jugador`),
  KEY `id_Seleccion` (`id_Seleccion`),
  KEY `id_Entrenador` (`id_Entrenador`),
  KEY `id_Club` (`id_Club`),
  CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`id_Seleccion`) REFERENCES `seleccion` (`id_Seleccion`),
  CONSTRAINT `jugador_ibfk_2` FOREIGN KEY (`id_Entrenador`) REFERENCES `entrenador` (`id_Entrenador`),
  CONSTRAINT `jugador_ibfk_3` FOREIGN KEY (`id_Club`) REFERENCES `club` (`id_Club`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Darío','Benedetto','Argentino','Delantero',9,1.75,2000000,1,1,1,'1990-05-17'),(2,'Enzo','Pérez','Argentino','Mediocampista',24,1.79,1500000,1,2,2,'1986-02-22'),(3,'Martín','Cauteruccio','Uruguayo','Delantero',9,1.79,4000000,16,3,3,'1987-04-14'),(4,'Gabriel','Arias','Chileno','Arquero',21,1.89,2800000,23,4,4,'1987-09-13'),(5,'Federico','Gattoni','Argentino','Defensor',6,1.83,4500000,1,5,5,'1999-02-16'),(6,'Robert','Lewandowski','Polaco','Delantero',9,1.85,40000000,21,6,6,'1988-08-21'),(7,'Luka','Modric','Croata','Mediocampista',10,1.72,10000000,7,7,7,'1985-09-09'),(8,'Leandro','Paredes','Argentino','Mediocampista',32,1.80,12000000,1,8,8,'1994-06-29'),(9,'David','Luiz','Brasilero','Defensor',23,1.89,600000,3,9,9,'1987-04-22'),(10,'Julián','Álvarez','Argentino','Delantero',19,1.70,50000000,1,10,10,'2000-01-31'),(11,'Lionel','Messi','Argentino','Delantero',30,1.70,45000000,1,11,11,'1987-06-24'),(12,'Manuel','Neuer','Alemán','Arquero',1,1.93,7000000,14,12,12,'1986-03-27'),(13,'Cristiano','Ronaldo','Portugués','Delantero',7,1.87,20000000,9,13,13,'1985-02-05'),(14,'Lisandro','Martínez','Argentino','Defensor',6,1.75,50000000,1,14,14,'1998-01-18'),(15,'Paulo','Dybala','Argentino','Delantero',21,1.77,30000000,1,15,15,'1993-11-15'),(16,'Victor','Osimhen','Nigeriano','Delantero',9,1.86,100000000,24,16,16,'1998-12-29'),(17,'Nicolás','Otamendi','Argentino','Defensor',30,1.83,3000000,1,17,17,'1988-02-12'),(18,'Heung-min','Son','Surcoreano','Delantero',7,1.84,60000000,22,18,18,'1992-07-08'),(19,'Martin','Ødegaard','Noruego','Mediocampista',8,1.78,80000000,25,19,19,'1998-12-17'),(20,'Virgil','Van Dijk','Holandés','Defensor',4,1.93,45000000,6,20,20,'1991-07-08');
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_insertar_jugador` AFTER INSERT ON `jugador` FOR EACH ROW BEGIN
INSERT INTO LOG_Jugador (Accion, Descripcion, Nombre, Apellido, Campo_Nuevo_Nombre, Campo_Nuevo_Apellido, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Insert', concat('Se agregó al jugador: '), NEW.Nombre_Jugador, NEW.Apellido_Jugador, '' , '', CURRENT_USER(), NOW(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_editar_jugador` AFTER UPDATE ON `jugador` FOR EACH ROW BEGIN
INSERT INTO LOG_Jugador (Accion, Descripcion, Nombre, Apellido, Campo_Nuevo_Nombre, Campo_Nuevo_Apellido, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Update', concat('Se modificó al jugador: '), OLD.Nombre_Jugador, OLD.Apellido_Jugador, NEW.Nombre_Jugador , NEW.Apellido_Jugador , CURRENT_USER(), NOW(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_eliminar_jugador` BEFORE DELETE ON `jugador` FOR EACH ROW BEGIN
INSERT INTO LOG_Jugador (Accion, Descripcion, Nombre, Apellido, Campo_Nuevo_Nombre, Campo_Nuevo_Apellido, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Delete', concat('Se eliminó al jugador: '), OLD.Nombre_Jugador, OLD.Apellido_Jugador, '', '', CURRENT_USER(), NOW(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_club`
--

DROP TABLE IF EXISTS `log_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_club` (
  `id_Log` int NOT NULL AUTO_INCREMENT,
  `Accion` varchar(25) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Club` varchar(100) DEFAULT NULL,
  `Nombre_Club_Nuevo` varchar(50) DEFAULT NULL,
  `Usuario` varchar(100) DEFAULT NULL,
  `Fecha_Upd_Ins_Del` date DEFAULT NULL,
  `Hora_Upd_Ins_Del` time DEFAULT NULL,
  PRIMARY KEY (`id_Log`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_club`
--

LOCK TABLES `log_club` WRITE;
/*!40000 ALTER TABLE `log_club` DISABLE KEYS */;
INSERT INTO `log_club` VALUES (1,'Insert','Se agregó al club: ','Boca Juniors','','root@localhost','2023-06-23','21:50:04'),(2,'Insert','Se agregó al club: ','River Plate','','root@localhost','2023-06-23','21:50:04'),(3,'Insert','Se agregó al club: ','Racing Club','','root@localhost','2023-06-23','21:50:04'),(4,'Insert','Se agregó al club: ','Independiente','','root@localhost','2023-06-23','21:50:04'),(5,'Insert','Se agregó al club: ','San Lorenzo','','root@localhost','2023-06-23','21:50:04'),(6,'Insert','Se agregó al club: ','Barcelona','','root@localhost','2023-06-23','21:50:04'),(7,'Insert','Se agregó al club: ','Real Madrid','','root@localhost','2023-06-23','21:50:04'),(8,'Insert','Se agregó al club: ','Juventus','','root@localhost','2023-06-23','21:50:04'),(9,'Insert','Se agregó al club: ','Flamengo','','root@localhost','2023-06-23','21:50:04'),(10,'Insert','Se agregó al club: ','Manchester City','','root@localhost','2023-06-23','21:50:04'),(11,'Insert','Se agregó al club: ','París Saint-Germain','','root@localhost','2023-06-23','21:50:04'),(12,'Insert','Se agregó al club: ','Bayern Munich','','root@localhost','2023-06-23','21:50:04'),(13,'Insert','Se agregó al club: ','Al-Nassr FC','','root@localhost','2023-06-23','21:50:04'),(14,'Insert','Se agregó al club: ','Manchester United','','root@localhost','2023-06-23','21:50:04'),(15,'Insert','Se agregó al club: ','Roma','','root@localhost','2023-06-23','21:50:04'),(16,'Insert','Se agregó al club: ','Nápoli','','root@localhost','2023-06-23','21:50:04'),(17,'Insert','Se agregó al club: ','SL Benfica','','root@localhost','2023-06-23','21:50:04'),(18,'Insert','Se agregó al club: ','Tottenham','','root@localhost','2023-06-23','21:50:04'),(19,'Insert','Se agregó al club: ','Arsenal','','root@localhost','2023-06-23','21:50:04'),(20,'Insert','Se agregó al club: ','Liverpool','','root@localhost','2023-06-23','21:50:05');
/*!40000 ALTER TABLE `log_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_jugador`
--

DROP TABLE IF EXISTS `log_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_jugador` (
  `id_Log` int NOT NULL AUTO_INCREMENT,
  `Accion` varchar(25) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Campo_Nuevo_Nombre` varchar(50) DEFAULT NULL,
  `Campo_Nuevo_Apellido` varchar(50) DEFAULT NULL,
  `Usuario` varchar(100) DEFAULT NULL,
  `Fecha_Upd_Ins_Del` date DEFAULT NULL,
  `Hora_Upd_Ins_Del` time DEFAULT NULL,
  PRIMARY KEY (`id_Log`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_jugador`
--

LOCK TABLES `log_jugador` WRITE;
/*!40000 ALTER TABLE `log_jugador` DISABLE KEYS */;
INSERT INTO `log_jugador` VALUES (1,'Insert','Se agregó al jugador: ','Darío','Benedetto','','','root@localhost','2023-06-23','21:50:05'),(2,'Insert','Se agregó al jugador: ','Enzo','Pérez','','','root@localhost','2023-06-23','21:50:05'),(3,'Insert','Se agregó al jugador: ','Martín','Cauteruccio','','','root@localhost','2023-06-23','21:50:05'),(4,'Insert','Se agregó al jugador: ','Gabriel','Arias','','','root@localhost','2023-06-23','21:50:05'),(5,'Insert','Se agregó al jugador: ','Federico','Gattoni','','','root@localhost','2023-06-23','21:50:05'),(6,'Insert','Se agregó al jugador: ','Robert','Lewandowski','','','root@localhost','2023-06-23','21:50:05'),(7,'Insert','Se agregó al jugador: ','Luka','Modric','','','root@localhost','2023-06-23','21:50:05'),(8,'Insert','Se agregó al jugador: ','Leandro','Paredes','','','root@localhost','2023-06-23','21:50:05'),(9,'Insert','Se agregó al jugador: ','David','Luiz','','','root@localhost','2023-06-23','21:50:05'),(10,'Insert','Se agregó al jugador: ','Julián','Álvarez','','','root@localhost','2023-06-23','21:50:05'),(11,'Insert','Se agregó al jugador: ','Lionel','Messi','','','root@localhost','2023-06-23','21:50:05'),(12,'Insert','Se agregó al jugador: ','Manuel','Neuer','','','root@localhost','2023-06-23','21:50:05'),(13,'Insert','Se agregó al jugador: ','Cristiano','Ronaldo','','','root@localhost','2023-06-23','21:50:05'),(14,'Insert','Se agregó al jugador: ','Lisandro','Martínez','','','root@localhost','2023-06-23','21:50:05'),(15,'Insert','Se agregó al jugador: ','Paulo','Dybala','','','root@localhost','2023-06-23','21:50:05'),(16,'Insert','Se agregó al jugador: ','Victor','Osimhen','','','root@localhost','2023-06-23','21:50:05'),(17,'Insert','Se agregó al jugador: ','Nicolás','Otamendi','','','root@localhost','2023-06-23','21:50:05'),(18,'Insert','Se agregó al jugador: ','Heung-min','Son','','','root@localhost','2023-06-23','21:50:05'),(19,'Insert','Se agregó al jugador: ','Martin','Ødegaard','','','root@localhost','2023-06-23','21:50:05'),(20,'Insert','Se agregó al jugador: ','Virgil','Van Dijk','','','root@localhost','2023-06-23','21:50:05');
/*!40000 ALTER TABLE `log_jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_seleccion`
--

DROP TABLE IF EXISTS `log_seleccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_seleccion` (
  `id_Log` int NOT NULL AUTO_INCREMENT,
  `Accion` varchar(25) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Selección` varchar(100) DEFAULT NULL,
  `Nombre_Selección_Nuevo` varchar(50) DEFAULT NULL,
  `Usuario` varchar(100) DEFAULT NULL,
  `Fecha_Upd_Ins_Del` date DEFAULT NULL,
  `Hora_Upd_Ins_Del` time DEFAULT NULL,
  PRIMARY KEY (`id_Log`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_seleccion`
--

LOCK TABLES `log_seleccion` WRITE;
/*!40000 ALTER TABLE `log_seleccion` DISABLE KEYS */;
INSERT INTO `log_seleccion` VALUES (1,'Insert','Se agregó a la selección: ','Argentina','','root@localhost','2023-06-23','21:50:04'),(2,'Insert','Se agregó a la selección: ','Francia','','root@localhost','2023-06-23','21:50:04'),(3,'Insert','Se agregó a la selección: ','Brasil','','root@localhost','2023-06-23','21:50:04'),(4,'Insert','Se agregó a la selección: ','Bélgica','','root@localhost','2023-06-23','21:50:04'),(5,'Insert','Se agregó a la selección: ','Inglaterra','','root@localhost','2023-06-23','21:50:04'),(6,'Insert','Se agregó a la selección: ','Holanda','','root@localhost','2023-06-23','21:50:04'),(7,'Insert','Se agregó a la selección: ','Croacia','','root@localhost','2023-06-23','21:50:04'),(8,'Insert','Se agregó a la selección: ','Italia','','root@localhost','2023-06-23','21:50:04'),(9,'Insert','Se agregó a la selección: ','Portugal','','root@localhost','2023-06-23','21:50:04'),(10,'Insert','Se agregó a la selección: ','España','','root@localhost','2023-06-23','21:50:04'),(11,'Insert','Se agregó a la selección: ','Marruecos','','root@localhost','2023-06-23','21:50:04'),(12,'Insert','Se agregó a la selección: ','Suiza','','root@localhost','2023-06-23','21:50:04'),(13,'Insert','Se agregó a la selección: ','Estados Unidos','','root@localhost','2023-06-23','21:50:04'),(14,'Insert','Se agregó a la selección: ','Alemania','','root@localhost','2023-06-23','21:50:04'),(15,'Insert','Se agregó a la selección: ','México','','root@localhost','2023-06-23','21:50:04'),(16,'Insert','Se agregó a la selección: ','Uruguay','','root@localhost','2023-06-23','21:50:04'),(17,'Insert','Se agregó a la selección: ','Colombia','','root@localhost','2023-06-23','21:50:04'),(18,'Insert','Se agregó a la selección: ','Senegal','','root@localhost','2023-06-23','21:50:04'),(19,'Insert','Se agregó a la selección: ','Dinamarca','','root@localhost','2023-06-23','21:50:04'),(20,'Insert','Se agregó a la selección: ','Japón','','root@localhost','2023-06-23','21:50:04'),(21,'Insert','Se agregó a la selección: ','Polonia','','root@localhost','2023-06-23','21:50:04'),(22,'Insert','Se agregó a la selección: ','Corea del Sur','','root@localhost','2023-06-23','21:50:04'),(23,'Insert','Se agregó a la selección: ','Chile','','root@localhost','2023-06-23','21:50:04'),(24,'Insert','Se agregó a la selección: ','Nigeria','','root@localhost','2023-06-23','21:50:04'),(25,'Insert','Se agregó a la selección: ','Noruega','','root@localhost','2023-06-23','21:50:04');
/*!40000 ALTER TABLE `log_seleccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seleccion`
--

DROP TABLE IF EXISTS `seleccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seleccion` (
  `id_Seleccion` int NOT NULL AUTO_INCREMENT,
  `Pais` varchar(100) NOT NULL,
  `Continente` varchar(50) DEFAULT NULL,
  `Confederacion` varchar(100) DEFAULT NULL,
  `Promedio_Edad` decimal(6,2) DEFAULT NULL,
  `Valor` bigint DEFAULT NULL,
  `Cantidad_Jugadores` tinyint DEFAULT NULL,
  `Puntos` smallint DEFAULT NULL,
  PRIMARY KEY (`id_Seleccion`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seleccion`
--

LOCK TABLES `seleccion` WRITE;
/*!40000 ALTER TABLE `seleccion` DISABLE KEYS */;
INSERT INTO `seleccion` VALUES (1,'Argentina','Sudamérica','CONMEBOL',27.60,647000000,27,1841),(2,'Francia','Europa','UEFA',26.40,1150000000,23,1838),(3,'Brasil','Sudamérica','CONMEBOL',26.80,910000000,23,1834),(4,'Bélgica','Europa','UEFA',26.50,367000000,24,1793),(5,'Inglaterra','Europa','UEFA',27.20,1180000000,26,1792),(6,'Holanda','Europa','UEFA',26.60,569000000,23,1731),(7,'Croacia','Europa','UEFA',27.90,266000000,22,1730),(8,'Italia','Europa','UEFA',27.90,570000000,23,1714),(9,'Portugal','Europa','UEFA',27.70,970000000,26,1707),(10,'España','Europa','UEFA',28.10,656000000,23,1683),(11,'Marruecos','África','CAF',27.50,303000000,28,1678),(12,'Suiza','Europa','UEFA',28.00,243000000,25,1664),(13,'Estados Unidos','Norteamérica','CONCACAF',25.20,92000000,23,1654),(14,'Alemania','Europa','UEFA',27.60,817000000,23,1647),(15,'México','Centroamérica','CONCACAF',26.20,157000000,24,1632),(16,'Uruguay','Sudamérica','CONMEBOL',23.60,108000000,31,1631),(17,'Colombia','Sudamérica','CONMEBOL',26.40,228000000,24,1617),(18,'Senegal','África','CAF',27.40,271000000,26,1613),(19,'Dinamarca','Europa','UEFA',27.00,388000000,25,1595),(20,'Japón','Asia','AFC',26.30,199000000,26,1589),(21,'Polonia','Europa','UEFA',26.70,214000000,24,1554),(22,'Corea del Sur','Asia','AFC',27.80,133000000,25,1536),(23,'Chile','Sudamérica','CONMEBOL',27.00,87000000,31,1511),(24,'Nigeria','África','CAF',26.20,347000000,23,1481),(25,'Noruega','Europa','UEFA',26.50,395000000,25,1464);
/*!40000 ALTER TABLE `seleccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_insertar_seleccion` AFTER INSERT ON `seleccion` FOR EACH ROW BEGIN
INSERT INTO LOG_Seleccion (Accion, Descripcion, Selección, Nombre_Selección_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Insert', concat('Se agregó a la selección: '), NEW.Pais, '', CURRENT_USER(), NOW(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_modificar_seleccion` AFTER UPDATE ON `seleccion` FOR EACH ROW BEGIN
INSERT INTO LOG_Seleccion (Accion, Descripcion, Selección, Nombre_Selección_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Update', concat('Se modificó a la selección: '), OLD.Pais, NEW.Pais, CURRENT_USER(), NOW(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_eliminar_seleccion` BEFORE DELETE ON `seleccion` FOR EACH ROW BEGIN
INSERT INTO LOG_Seleccion (Accion, Descripcion, Selección, Nombre_Selección_Nuevo, Usuario, Fecha_Upd_Ins_Del, Hora_Upd_Ins_Del) 
VALUE ('Delete', concat('Se eliminó a la selección: '), OLD.Pais, '', CURRENT_USER(), NOW(), NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `torneos_internacionales`
--

DROP TABLE IF EXISTS `torneos_internacionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneos_internacionales` (
  `id_Torneo_Internacional` int NOT NULL AUTO_INCREMENT,
  `Torneo_Internacional` varchar(50) NOT NULL,
  `Continente` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_Torneo_Internacional`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneos_internacionales`
--

LOCK TABLES `torneos_internacionales` WRITE;
/*!40000 ALTER TABLE `torneos_internacionales` DISABLE KEYS */;
INSERT INTO `torneos_internacionales` VALUES (1,'Copa Libertadores','Sudamérica'),(2,'Copa Sudamericana','Sudamérica'),(3,'Champions League','Europa'),(4,'Europa League','Europa'),(5,'AFC Champions League','Asia'),(6,'Liga de Campeones CONCACAF','Centro y Norteamérica'),(7,'Champions League CAF','África'),(8,'Champions League OFC','Oceanía');
/*!40000 ALTER TABLE `torneos_internacionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneos_nacionales`
--

DROP TABLE IF EXISTS `torneos_nacionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneos_nacionales` (
  `id_Torneo_Nacional` int NOT NULL AUTO_INCREMENT,
  `Torneo_Nacional` varchar(50) NOT NULL,
  `Pais_Torneo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Torneo_Nacional`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneos_nacionales`
--

LOCK TABLES `torneos_nacionales` WRITE;
/*!40000 ALTER TABLE `torneos_nacionales` DISABLE KEYS */;
INSERT INTO `torneos_nacionales` VALUES (1,'Liga Profesional de Fútbol','Argentina'),(2,'LaLiga Santander','España'),(3,'Premier League','Inglaterra'),(4,'Serie A','Italia'),(5,'Bundesliga','Alemania'),(6,'Ligue 1','Francia'),(7,'Saudi Pro League','Arabia Saudita'),(8,'Brasileirao','Brasil'),(9,'Primeira Liga','Portugal'),(10,'Eredivisie','Holanda'),(11,'Campeonato Uruguayo','Uruguay'),(12,'División de Honor','Paraguay'),(13,'Primera División','Chile'),(14,'Categoría Primera A','Colombia'),(15,'Liga MX','México'),(16,'MLS','Estados Unidos'),(17,'Belgian Pro League','Bélgica'),(18,'Scottish Premiership','Escocia'),(19,'J1 League','Japón'),(20,'Süper Lig','Turquía');
/*!40000 ALTER TABLE `torneos_nacionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_clubes_argentinos`
--

DROP TABLE IF EXISTS `vw_clubes_argentinos`;
/*!50001 DROP VIEW IF EXISTS `vw_clubes_argentinos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clubes_argentinos` AS SELECT 
 1 AS `id_Club`,
 1 AS `Nombre_Club`,
 1 AS `Abreviatura_Club`,
 1 AS `Pais_Club`,
 1 AS `id_Entrenador`,
 1 AS `id_Estadio`,
 1 AS `id_Torneo_Nacional`,
 1 AS `id_Torneo_Internacional`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_copas_sudamericanas_y_europeas`
--

DROP TABLE IF EXISTS `vw_copas_sudamericanas_y_europeas`;
/*!50001 DROP VIEW IF EXISTS `vw_copas_sudamericanas_y_europeas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_copas_sudamericanas_y_europeas` AS SELECT 
 1 AS `Id`,
 1 AS `Copa`,
 1 AS `Continente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_delanteros`
--

DROP TABLE IF EXISTS `vw_delanteros`;
/*!50001 DROP VIEW IF EXISTS `vw_delanteros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_delanteros` AS SELECT 
 1 AS `Id`,
 1 AS `Apellido`,
 1 AS `Nombre`,
 1 AS `Posición`,
 1 AS `id_Club`,
 1 AS `Dorsal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_información_completa`
--

DROP TABLE IF EXISTS `vw_información_completa`;
/*!50001 DROP VIEW IF EXISTS `vw_información_completa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_información_completa` AS SELECT 
 1 AS `Id`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Nacionalidad`,
 1 AS `Club`,
 1 AS `Director_Técnico`,
 1 AS `Estadio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_promedio_valor_jugadores`
--

DROP TABLE IF EXISTS `vw_promedio_valor_jugadores`;
/*!50001 DROP VIEW IF EXISTS `vw_promedio_valor_jugadores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_promedio_valor_jugadores` AS SELECT 
 1 AS `Total_Jugadores`,
 1 AS `Promedio_Valor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_selecciones_campeonas_del_mundo`
--

DROP TABLE IF EXISTS `vw_selecciones_campeonas_del_mundo`;
/*!50001 DROP VIEW IF EXISTS `vw_selecciones_campeonas_del_mundo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_selecciones_campeonas_del_mundo` AS SELECT 
 1 AS `Id`,
 1 AS `Seleccion`,
 1 AS `Continente`,
 1 AS `Confederacion`,
 1 AS `Titulos`,
 1 AS `Ultimo_Titulo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_selecciones_cuartas_del_mundo`
--

DROP TABLE IF EXISTS `vw_selecciones_cuartas_del_mundo`;
/*!50001 DROP VIEW IF EXISTS `vw_selecciones_cuartas_del_mundo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_selecciones_cuartas_del_mundo` AS SELECT 
 1 AS `Id`,
 1 AS `Seleccion`,
 1 AS `Continente`,
 1 AS `Confederacion`,
 1 AS `Titulos`,
 1 AS `Ultimo_Titulo`,
 1 AS `Subcampeonatos`,
 1 AS `Tercer_Puesto`,
 1 AS `Cuarto_Puesto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_selecciones_nacionales`
--

DROP TABLE IF EXISTS `vw_selecciones_nacionales`;
/*!50001 DROP VIEW IF EXISTS `vw_selecciones_nacionales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_selecciones_nacionales` AS SELECT 
 1 AS `Id`,
 1 AS `Seleccion`,
 1 AS `Continente`,
 1 AS `Confederacion`,
 1 AS `Titulos`,
 1 AS `Ultimo_Titulo`,
 1 AS `Subcampeonatos`,
 1 AS `Tercer_Puesto`,
 1 AS `Cuarto_Puesto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_selecciones_subcampeonas_del_mundo`
--

DROP TABLE IF EXISTS `vw_selecciones_subcampeonas_del_mundo`;
/*!50001 DROP VIEW IF EXISTS `vw_selecciones_subcampeonas_del_mundo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_selecciones_subcampeonas_del_mundo` AS SELECT 
 1 AS `Id`,
 1 AS `Seleccion`,
 1 AS `Continente`,
 1 AS `Confederacion`,
 1 AS `Titulos`,
 1 AS `Ultimo_Titulo`,
 1 AS `Subcampeonatos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_selecciones_terceras_del_mundo`
--

DROP TABLE IF EXISTS `vw_selecciones_terceras_del_mundo`;
/*!50001 DROP VIEW IF EXISTS `vw_selecciones_terceras_del_mundo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_selecciones_terceras_del_mundo` AS SELECT 
 1 AS `Id`,
 1 AS `Seleccion`,
 1 AS `Continente`,
 1 AS `Confederacion`,
 1 AS `Titulos`,
 1 AS `Ultimo_Titulo`,
 1 AS `Subcampeonatos`,
 1 AS `Tercer_Puesto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_selecciones_top_4_de_mundiales`
--

DROP TABLE IF EXISTS `vw_selecciones_top_4_de_mundiales`;
/*!50001 DROP VIEW IF EXISTS `vw_selecciones_top_4_de_mundiales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_selecciones_top_4_de_mundiales` AS SELECT 
 1 AS `Id`,
 1 AS `Seleccion`,
 1 AS `Continente`,
 1 AS `Confederacion`,
 1 AS `Titulos`,
 1 AS `Ultimo_Titulo`,
 1 AS `Subcampeonatos`,
 1 AS `Tercer_Puesto`,
 1 AS `Cuarto_Puesto`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'futbol_proyecto_final_sql'
--

--
-- Dumping routines for database 'futbol_proyecto_final_sql'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_letra_club` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_letra_club`(club VARCHAR(250)) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE numero int;
	SELECT Count(*) into numero FROM Club WHERE Nombre_Club like concat('%', club, '%');
	RETURN numero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_paises_clubes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_paises_clubes`(pais VARCHAR(250)) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE numero int;
	SELECT Count(*) into numero FROM Club WHERE Pais_Club like concat('%', pais, '%' );
	RETURN numero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_editar_seleccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editar_seleccion`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_jugador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_jugador`(
									IN j_id_Jugador INT
                                    )
BEGIN
	DELETE FROM Jugador WHERE id_Jugador = j_id_Jugador;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_clubes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_clubes`(
									IN c_Nombre_Club VARCHAR(40), 
                                    IN c_Abreviatura_Club VARCHAR(10), 
                                    IN c_Pais_Club VARCHAR(20)
                                    )
BEGIN
	INSERT INTO Club (Nombre_Club, Abreviatura_Club, Pais_Club)
	VALUES (c_Nombre_Club, c_Abreviatura_Club, c_Pais_Club);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ordenar_clubes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenar_clubes`(IN orden VARCHAR(50),
									IN asc_o_desc VARCHAR(50)
                                    )
BEGIN
	SET @club_order = CONCAT('SELECT * FROM Club ORDER BY (', orden, ')', asc_o_desc);
	PREPARE stmt FROM @club_order;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_clubes_argentinos`
--

/*!50001 DROP VIEW IF EXISTS `vw_clubes_argentinos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clubes_argentinos` AS select `club`.`id_Club` AS `id_Club`,`club`.`Nombre_Club` AS `Nombre_Club`,`club`.`Abreviatura_Club` AS `Abreviatura_Club`,`club`.`Pais_Club` AS `Pais_Club`,`club`.`id_Entrenador` AS `id_Entrenador`,`club`.`id_Estadio` AS `id_Estadio`,`club`.`id_Torneo_Nacional` AS `id_Torneo_Nacional`,`club`.`id_Torneo_Internacional` AS `id_Torneo_Internacional` from `club` where (`club`.`Pais_Club` like '%Argentina%') order by `club`.`Nombre_Club` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_copas_sudamericanas_y_europeas`
--

/*!50001 DROP VIEW IF EXISTS `vw_copas_sudamericanas_y_europeas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_copas_sudamericanas_y_europeas` AS select `torneos_internacionales`.`id_Torneo_Internacional` AS `Id`,`torneos_internacionales`.`Torneo_Internacional` AS `Copa`,`torneos_internacionales`.`Continente` AS `Continente` from `torneos_internacionales` where ((`torneos_internacionales`.`Continente` like '%Sudamérica%') or (`torneos_internacionales`.`Continente` like '%Europa%')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_delanteros`
--

/*!50001 DROP VIEW IF EXISTS `vw_delanteros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_delanteros` AS select `jugador`.`id_Jugador` AS `Id`,`jugador`.`Apellido_Jugador` AS `Apellido`,`jugador`.`Nombre_Jugador` AS `Nombre`,`jugador`.`Posición_Jugador` AS `Posición`,`jugador`.`id_Club` AS `id_Club`,`jugador`.`Dorsal_Jugador` AS `Dorsal` from `jugador` where (`jugador`.`Posición_Jugador` like '%Delantero%') order by `jugador`.`Apellido_Jugador` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_información_completa`
--

/*!50001 DROP VIEW IF EXISTS `vw_información_completa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_información_completa` AS select `j`.`id_Jugador` AS `Id`,`j`.`Nombre_Jugador` AS `Nombre`,`j`.`Apellido_Jugador` AS `Apellido`,`j`.`Nacionalidad_Jugador` AS `Nacionalidad`,`c`.`Nombre_Club` AS `Club`,`en`.`Apellido_Entrenador` AS `Director_Técnico`,`es`.`Nombre_Estadio` AS `Estadio` from (((`jugador` `j` join `club` `c` on((`j`.`id_Jugador` = `c`.`id_Club`))) join `estadio` `es` on((`j`.`id_Jugador` = `es`.`id_Estadio`))) join `entrenador` `en` on((`j`.`id_Jugador` = `en`.`id_Entrenador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_promedio_valor_jugadores`
--

/*!50001 DROP VIEW IF EXISTS `vw_promedio_valor_jugadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_promedio_valor_jugadores` AS select count(0) AS `Total_Jugadores`,avg(`jugador`.`Valor_Pase`) AS `Promedio_Valor` from `jugador` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_selecciones_campeonas_del_mundo`
--

/*!50001 DROP VIEW IF EXISTS `vw_selecciones_campeonas_del_mundo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_selecciones_campeonas_del_mundo` AS select `s`.`id_Seleccion` AS `Id`,`s`.`Pais` AS `Seleccion`,`s`.`Continente` AS `Continente`,`s`.`Confederacion` AS `Confederacion`,`c`.`Titulos` AS `Titulos`,`c`.`Ultimo_Titulo` AS `Ultimo_Titulo` from (`seleccion` `s` join `copas_del_mundo` `c` on(((`s`.`id_Seleccion` = `c`.`id_Copas_del_Mundo`) and (0 <> `c`.`Ultimo_Titulo`)))) order by `c`.`Titulos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_selecciones_cuartas_del_mundo`
--

/*!50001 DROP VIEW IF EXISTS `vw_selecciones_cuartas_del_mundo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_selecciones_cuartas_del_mundo` AS select `s`.`id_Seleccion` AS `Id`,`s`.`Pais` AS `Seleccion`,`s`.`Continente` AS `Continente`,`s`.`Confederacion` AS `Confederacion`,`c`.`Titulos` AS `Titulos`,`c`.`Ultimo_Titulo` AS `Ultimo_Titulo`,`c`.`Subcampeonatos` AS `Subcampeonatos`,`c`.`Tercer_Puesto` AS `Tercer_Puesto`,`c`.`Cuarto_Puesto` AS `Cuarto_Puesto` from (`seleccion` `s` join `copas_del_mundo` `c` on(((`s`.`id_Seleccion` = `c`.`id_Copas_del_Mundo`) and (0 <> `c`.`Cuarto_Puesto`)))) order by `c`.`Cuarto_Puesto` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_selecciones_nacionales`
--

/*!50001 DROP VIEW IF EXISTS `vw_selecciones_nacionales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_selecciones_nacionales` AS select `s`.`id_Seleccion` AS `Id`,`s`.`Pais` AS `Seleccion`,`s`.`Continente` AS `Continente`,`s`.`Confederacion` AS `Confederacion`,`c`.`Titulos` AS `Titulos`,`c`.`Ultimo_Titulo` AS `Ultimo_Titulo`,`c`.`Subcampeonatos` AS `Subcampeonatos`,`c`.`Tercer_Puesto` AS `Tercer_Puesto`,`c`.`Cuarto_Puesto` AS `Cuarto_Puesto` from (`seleccion` `s` join `copas_del_mundo` `c` on((`s`.`id_Seleccion` = `c`.`id_Copas_del_Mundo`))) order by `s`.`Pais` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_selecciones_subcampeonas_del_mundo`
--

/*!50001 DROP VIEW IF EXISTS `vw_selecciones_subcampeonas_del_mundo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_selecciones_subcampeonas_del_mundo` AS select `s`.`id_Seleccion` AS `Id`,`s`.`Pais` AS `Seleccion`,`s`.`Continente` AS `Continente`,`s`.`Confederacion` AS `Confederacion`,`c`.`Titulos` AS `Titulos`,`c`.`Ultimo_Titulo` AS `Ultimo_Titulo`,`c`.`Subcampeonatos` AS `Subcampeonatos` from (`seleccion` `s` join `copas_del_mundo` `c` on(((`s`.`id_Seleccion` = `c`.`id_Copas_del_Mundo`) and (0 <> `c`.`Subcampeonatos`)))) order by `c`.`Subcampeonatos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_selecciones_terceras_del_mundo`
--

/*!50001 DROP VIEW IF EXISTS `vw_selecciones_terceras_del_mundo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_selecciones_terceras_del_mundo` AS select `s`.`id_Seleccion` AS `Id`,`s`.`Pais` AS `Seleccion`,`s`.`Continente` AS `Continente`,`s`.`Confederacion` AS `Confederacion`,`c`.`Titulos` AS `Titulos`,`c`.`Ultimo_Titulo` AS `Ultimo_Titulo`,`c`.`Subcampeonatos` AS `Subcampeonatos`,`c`.`Tercer_Puesto` AS `Tercer_Puesto` from (`seleccion` `s` join `copas_del_mundo` `c` on(((`s`.`id_Seleccion` = `c`.`id_Copas_del_Mundo`) and (0 <> `c`.`Tercer_Puesto`)))) order by `c`.`Tercer_Puesto` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_selecciones_top_4_de_mundiales`
--

/*!50001 DROP VIEW IF EXISTS `vw_selecciones_top_4_de_mundiales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_selecciones_top_4_de_mundiales` AS select `s`.`id_Seleccion` AS `Id`,`s`.`Pais` AS `Seleccion`,`s`.`Continente` AS `Continente`,`s`.`Confederacion` AS `Confederacion`,`c`.`Titulos` AS `Titulos`,`c`.`Ultimo_Titulo` AS `Ultimo_Titulo`,`c`.`Subcampeonatos` AS `Subcampeonatos`,`c`.`Tercer_Puesto` AS `Tercer_Puesto`,`c`.`Cuarto_Puesto` AS `Cuarto_Puesto` from (`seleccion` `s` join `copas_del_mundo` `c` on(((`s`.`id_Seleccion` = `c`.`id_Copas_del_Mundo`) and (0 <> `c`.`Titulos`) and (0 <> `c`.`Subcampeonatos`) and (0 <> `c`.`Tercer_Puesto`) and (0 <> `c`.`Cuarto_Puesto`)))) order by `s`.`Pais` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-23 22:08:58
