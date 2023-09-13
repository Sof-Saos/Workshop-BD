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
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_transaccion` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `forma_pago` varchar(200) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `total_pago` decimal(10,0) DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1234,1,'Tarjeta de crédito','2023-09-11 10:30:00',500,1),(2037,7,'Transferencia bancaria','2009-09-11 16:30:00',800,2),(2474,3,'PayPal','2009-09-11 13:30:00',450,3),(2657,2,'Efectivo','2023-09-11 11:45:00',350,4),(3727,10,'Tarjeta de débito','2023-09-11 19:15:00',300,5),(3846,6,'Efectivo','2023-09-11 15:15:00',250,6),(4545,10,'Paypal','2009-12-12 11:00:00',120,10),(5058,4,'Tarjeta de débito','2023-09-11 14:00:00',700,7),(5456,8,'Tarjeta de crédito','2008-07-23 09:00:00',200,8),(5648,8,'PayPal','2023-09-11 17:45:00',550,NULL),(7454,8,'Tarjeta de crédito','2008-10-15 05:00:00',130,9),(7563,5,'Transferencia bancaria','2023-09-11 12:15:00',600,NULL),(8755,2,'Paypal','2009-10-02 10:00:00',324,NULL),(8884,9,'Efectivo','2008-12-12 11:00:00',750,10),(9864,9,'Tarjeta de crédito','2023-09-11 18:00:00',900,NULL);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
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
