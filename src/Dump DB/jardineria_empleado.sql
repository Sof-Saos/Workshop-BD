-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: jardineria
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido1` varchar(45) DEFAULT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `extension` int DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `id_oficina` int DEFAULT NULL,
  `id_jefe` int DEFAULT NULL,
  `puesto` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_oficina_idx` (`id_oficina`),
  KEY `id_jefe_idx` (`id_jefe`),
  CONSTRAINT `id_jefe` FOREIGN KEY (`id_jefe`) REFERENCES `jefe` (`id_jefe`),
  CONSTRAINT `id_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `oficina` (`id_oficina`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'David','López','Gómez',101,'david.lopez@gmail.com',1,2,'Gerente'),(2,'Ana','Martínez','Rodríguez',102,'ana.martinez@gmail.com',2,3,'Representante de Ventas'),(3,'Carlos','García','Sánchez',103,'carlos.garcia@gmail.com',3,4,'Analista de Ventas'),(4,'Luisa','Ramírez','Hernández',104,'luisa.ramirez@gmail.com',4,5,'Asistente de Gerencia'),(5,'María','González','Torres',105,'maria.gonzalez@gmail.com',5,6,'Representante de Ventas'),(6,'Juan','Sánchez','Díaz',106,'juan.sanchez@hotmail.com',6,7,'Gerente de Proyecto'),(7,'Sofía','Hernández','Pérez',107,'sofia.hernandez@yahoo.com',7,8,'Representante de Ventas'),(8,'Pedro','Torres','López',108,'pedro.torres@hotmail.com',8,9,'Representante de Ventas'),(9,'Laura','Díaz','Martínez',109,'laura.diaz@hotmail.com',9,10,'Representante de Ventas'),(10,'Eduardo','Martínez','Sánchez',110,'eduardo.martinez@yahoo.com',10,NULL,'Representante de Ventas');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-13 13:26:10
