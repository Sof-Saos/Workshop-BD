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
-- Table structure for table `oficina`
--

DROP TABLE IF EXISTS `oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oficina` (
  `id_oficina` int NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(200) DEFAULT NULL,
  `region` varchar(200) DEFAULT NULL,
  `cod_postal` int DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `pais` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_oficina`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficina`
--

LOCK TABLES `oficina` WRITE;
/*!40000 ALTER TABLE `oficina` DISABLE KEYS */;
INSERT INTO `oficina` VALUES (1,'Bogotá','Cundinamarca',11111,'555-123-4567','Calle 123 # 23 - 34','Colombia'),(2,'Medellín','Antioquia',22222,'555-234-5678','Avenida 45 # 3 - 45','Colombia'),(3,'Cali','Valle del Cauca',33333,'555-345-6789','Calle 78 # 64 - 1','Colombia'),(4,'Cartagena','Bolívar',44444,'555-456-7890','Avenida 101 # 26 - 64','Colombia'),(5,'Barranquilla','Atlántico',55555,'555-567-8901','Calle 5 # 45 - 65','Colombia'),(6,'Santa Marta','Magdalena',66666,'555-678-9012','Avenida 87 # 5 - 12','Colombia'),(7,'Pereira','Risaralda',77777,'555-789-0123','Calle 23 # 1 - 6','Colombia'),(8,'Cúcuta','Norte de Santander',88888,'555-890-1234','Avenida 5 Circular 2','Colombia'),(9,'Ibagué','Tolima',99999,'555-901-2345','Calle 78 # 53 - 5','Colombia'),(10,'Manizales','Caldas',10101,'555-012-3456','Avenida 9 # 76 - 6','Colombia'),(11,'Salamanca','Castilla y León',30055,'231-434-444','Calle 34 # 12 - 4','España'),(12,'Madrid','Comunidad Autonoma',22494,'235674-444','Carrera 12 # 56 - 2','España');
/*!40000 ALTER TABLE `oficina` ENABLE KEYS */;
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
