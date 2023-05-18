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
-- Table structure for table `tb_brand`
--

DROP TABLE IF EXISTS `tb_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_brand` (
  `BrandID` int NOT NULL AUTO_INCREMENT,
  `BrandCode` varchar(100) DEFAULT NULL,
  `BrandName` varchar(255) NOT NULL DEFAULT '',
  `Image` text,
  `Description` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BrandID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Nhãn hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_brand`
--

LOCK TABLES `tb_brand` WRITE;
/*!40000 ALTER TABLE `tb_brand` DISABLE KEYS */;
INSERT INTO `tb_brand` VALUES (12,'NH1','Vinfast','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Brand%2Fbr2_iconthuonghieuz8.png?alt=media&token=a7c845a4-50c7-4e80-9233-068539e88f37','Nhãn hàng vinfast','2023-04-22 09:50:31','DangPD','2023-04-22 09:50:31','DangPD'),(13,'NH2','HuynDai','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Brand%2Fbr2_iconthuonghieuz1.png?alt=media&token=559f6d8b-146b-433c-8a67-f647f8cf05f5','Nhãn hàng Huyndai','2023-04-22 09:51:11','DangPD','2023-05-02 18:39:50','DangPD'),(14,'NH3','Toyota','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Brand%2Fbr2_iconthuonghieuz10.png?alt=media&token=f5102b2c-cc63-4701-abcd-211c4334b90d','Nhãn hàng toyota','2023-04-22 09:51:41','DangPD','2023-04-22 09:51:41','DangPD'),(15,'Nh4','Honda','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Brand%2Fbr2_iconthuonghieuz11.png?alt=media&token=daa53141-592e-45d2-aa9d-b5dbc18c9b9d','Nhãn hàng Honda','2023-04-22 09:52:12','DangPD','2023-05-06 11:40:00','DangPD'),(16,'NH5','Mazda','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Brand%2Fbr2_iconthuonghieuz9.png?alt=media&token=5afaa951-1233-4c12-9bcc-48d42f0bb060','Nhãn hàng mazda','2023-05-02 18:37:02','','2023-05-02 18:39:30','DangPD'),(18,'Nh6','KiA','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Brand%2Fbr2_iconthuonghieuz6.png?alt=media&token=86344d58-8ded-4a14-9ff8-75d0b124066c','Nhãn hàng kia','2023-05-02 18:40:47','DangPD','2023-05-02 18:40:47','DangPD');
/*!40000 ALTER TABLE `tb_brand` ENABLE KEYS */;
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
