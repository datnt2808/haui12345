-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: autopro
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
-- Table structure for table `tb_productcategory`
--

DROP TABLE IF EXISTS `tb_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_productcategory` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryCode` varchar(50) NOT NULL DEFAULT '',
  `CategoryName` varchar(255) NOT NULL DEFAULT '',
  `Description` text,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(100) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productcategory`
--

LOCK TABLES `tb_productcategory` WRITE;
/*!40000 ALTER TABLE `tb_productcategory` DISABLE KEYS */;
INSERT INTO `tb_productcategory` VALUES (5,'DM1','Bóng đèn gương phụ kiện','Các sản phẩm Bóng đèn gương phụ kiện','DangPD','2023-04-22 09:54:00','DangPD','2023-04-22 09:55:48'),(6,'DM2','Điều hòa','Các sản phẩm điều hòa','DangPD','2023-04-22 09:56:13','DangPD','2023-04-22 09:56:13'),(7,'DM3','Gầm phanh','Các sản phầm gầm phanh hệ thống','DangPD','2023-04-22 09:56:37','DangPD','2023-04-22 09:56:37'),(8,'DM4','Hộp số','Các sản phẩm hộp số','DangPD','2023-04-22 09:56:55','DangPD','2023-04-22 09:56:55'),(9,'DM5','Làm mát nhiên liệu','Các sản phầm làm mát hệ thống','DangPD','2023-04-22 09:57:23','DangPD','2023-04-22 09:57:23'),(10,'MD6','Nội thất','Các sản phẩm nội thất','DangPD','2023-04-22 09:57:43','DangPD','2023-04-22 09:57:43');
/*!40000 ALTER TABLE `tb_productcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11  9:45:22
