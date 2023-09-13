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
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `id_gama` int DEFAULT NULL,
  `proveedor` varchar(200) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `precio_venta` decimal(10,0) DEFAULT NULL,
  `precio_proveedor` decimal(10,0) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_gama_idx` (`id_gama`),
  CONSTRAINT `id_gama` FOREIGN KEY (`id_gama`) REFERENCES `gama` (`id_gama`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Rosas',1,'Jardín Olimpus','Hermosas rosas de colores variados.',50,100,80,'https://estag.fimagenes.com/img/v2/7e4/1100858_526035_900.jpg'),(2,'Tulipanes',2,'Skypea Garden','Tulipanes frescos y vibrantes para alegrar tu día.',30,75,60,'https://images.hola.com/imagenes/decoracion/20211013197604/cultivar-tulipanes-plantas-interior-exterior-il/1-6-268/cultivar-tulipanes-01m-m.jpg?tx=w_680'),(3,'Claveles',1,'Flowerland','Claveles fragantes en una variedad de tonos.',25,90,70,'https://agroactivocol.com/wp-content/uploads/2023/07/CLAVEL-ROJO.jpg'),(4,'Margaritas',3,'Sophie-s Garden Shop','Margaritas blancas y brillantes para eventos especiales.',40,120,100,'https://unsplash.com/es/fotos/6P9JgFe3f9Q'),(5,'Amapolas',2,'Exotic Flowers','Amapolas exóticas en colores intensos.',60,110,90,'https://www.mnhn.gob.cl/sites/www.mnhn.gob.cl/files/styles/16x9_grande/public/2021-04/Amapola%20roja.jpg?h=427da63c&itok=T0caVzl7'),(6,'Orquídeas',1,'Jardines de Marte','Elegantes orquídeas en macetas decorativas.',75,130,110,'https://www.lamansiondelasideas.com/wp-content/uploads/2022/08/significado-de-las-orquideas.jpg'),(7,'Dientes de león',4,'En el Bosque','Dientes de león frescos y silvestres.',2,95,75,'https://www.crushpixel.com/big-static14/preview4/bouquet-dandelions-1414349.jpg'),(8,'Petunias',3,'Jardín Superior','Petunias en diversos tonos para jardines hermosos.',35,105,85,'https://www.shutterstock.com/es/image-photo/colorful-petunia-flowers-close-plant-red-2031503813'),(9,'Camelias',2,'Jungla Fantástica','Camelias raras y exóticas para coleccionistas.',45,115,95,'https://plantasyjardin.com/wp-content/uploads/2011/05/Camelia-Dr.-Clifford-Parks-detalle-flor..jpg'),(10,'Dalias',4,'Flores: El Imperio','Dalias grandes y coloridas para arreglos impresionantes.',55,140,120,'https://www.ngenespanol.com/wp-content/uploads/2022/11/dalia-la-flor-nacional-de-mexico-que-conquisto-al-mundo-770x431.jpg');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
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
