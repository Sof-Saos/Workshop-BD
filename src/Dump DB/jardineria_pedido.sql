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
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha_pedido` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `comentarios` varchar(200) DEFAULT NULL,
  `cod_cliente` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `cod_cliente_idx` (`cod_cliente`),
  KEY `fk_pedido_producto` (`id_producto`),
  CONSTRAINT `cod_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_pedido_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2023-01-17 13:30:00','2023-01-19 10:30:00','Completado','Envio fragil',1,1),(2,'2023-01-20 14:00:00','2023-01-21 09:30:00','Completado','Envio express, debe llegar urgente',2,2),(3,'2023-02-11 10:30:00','2023-02-15 10:30:00','Completado','Envio fragil',3,3),(4,'2023-04-20 11:30:00','2023-04-22 15:00:00','Completado','Ramo costoso, tener cuidada',4,10),(5,'2023-06-08 08:00:00','2023-07-11 03:30:00','Completado','Normal',5,5),(6,'2023-07-10 14:50:00','2023-08-01 07:29:00','Completado','Envio fragil',6,6),(7,'2023-09-01 11:20:00','2023-09-13 10:30:00','En proceso','Envio express, debe llegar urgente',7,4),(8,'2008-07-23 10:00:00','2008-02-10 12:00:00','Completado','Normal',8,4),(9,'2008-10-15 06:00:00','2008-11-25 08:00:00','Completado','Normal',8,2),(10,'2008-12-12 14:00:00','2008-12-19 03:30:00','Completado','Ramo costoso, tener cuidado',9,7);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-13 13:26:12
