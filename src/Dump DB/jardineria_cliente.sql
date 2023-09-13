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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `nombre_contacto` varchar(200) DEFAULT NULL,
  `apellido_contacto` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `direccion1` varchar(200) DEFAULT NULL,
  `direccion2` varchar(200) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `cod_postal` int DEFAULT NULL,
  `cod_empleado` int DEFAULT NULL,
  `limite_credito` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `cod_empleado_idx` (`cod_empleado`),
  CONSTRAINT `cod_empleado` FOREIGN KEY (`cod_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Perez','Ana','González','5551234567','5559876543','Calle 123 # 23 - 34','Apto 4B','Bogotá','Cundinamarca',12345,1,5000000),(2,'María','López','Pedro','Sánchez','555-234-5678','555-876-5432','Avenida 45 # 3 - 45','Piso 8','Medellín','Antioquia',23456,2,2000000),(3,'Carlos','García','Sofía','Martínez','555-345-6789','555-765-4321','Calle 78 # 64 - 1','Local 12','Medellín','Antioquia',34567,3,1000000),(4,'Laura','Rodríguez','Javier','Torres','555-456-7890','555-654-3210','Avenida 101 # 26 - 64','Piso 3A','Medellín','Antioquia',45678,4,NULL),(5,'Pedro','Sánchez','Elena','Gómez','555-567-8901','555-543-2109','Calle 5 # 45 - 65','Oficina 5','Bogotá','Cundinamarca',56789,5,NULL),(6,'Ana','González','Luis','Hernández','555-678-9012','555-432-1098','Avenida 87 # 5 - 12','Piso 10','Mompox','Bolivar',67890,6,NULL),(7,'Sofía','Martínez','Mario','Díaz','555-789-0123','555-321-0987','Calle 23 # 1 - 6','Local 9B','Medellín','Antioquia',78901,6,NULL),(8,'Javier','Torres','Isabel','Ortega','555-890-1234','555-210-9876','Avenida 5 Circular 2','Piso 5C','Leticia','Amazonas',89012,6,NULL),(9,'Elena','Gómez','Lucas','Ramírez','555-901-2345','555-109-8765','Calle 78 # 53 - 5','Local 7A','Mompox','Bolivar',90123,6,NULL),(10,'Luis','Hernández','Laura','Rodríguez','555-012-3456','555-987-6543','Avenida 9 # 76 - 6','Piso 4D','Leticia','Amazonas',1234,6,NULL),(11,'Simon','Pedrahita','Raul','Rojas','3156785544',NULL,'Carrera 65 # 32 - 7','Piso 1','Bogotá','Cundinamarca',85465,2,NULL),(12,'Xavier','Restrepo','Donovan','Juarez','3125623311',NULL,'Calle 54 # 65 - 7','Local 3E','Leticia','Amazonas',4535,1,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-13 13:26:11
