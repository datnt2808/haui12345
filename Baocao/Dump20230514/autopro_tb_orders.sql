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
-- Table structure for table `tb_orders`
--

DROP TABLE IF EXISTS `tb_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderCode` varchar(100) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `IdUser` int DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL COMMENT 'Lưu ý',
  `totalAmount` int DEFAULT NULL,
  `StatusOrders` int DEFAULT NULL COMMENT 'Trạng thái đơn hàng\r\n(1-Thành công,2-Chờ tiếp nhận,3-Đã tiếp nhận,4-Chờ giao hàng,5-Đang giao hàng,6-Giao hàng thất bại,7-Đổi hàng,8-Trả hàng,9-Hủy)\r\n',
  `StatusOrdersName` varchar(255) DEFAULT NULL,
  `CheckOutTypeID` int DEFAULT NULL COMMENT 'Hình thức thanh toán',
  `CheckOutTypeName` varchar(255) DEFAULT NULL COMMENT 'Hình thức thanh toán (2-Tại nhà,1-VNpay)',
  `CheckOutStatusID` int DEFAULT NULL COMMENT 'Trạng thái thanh toán',
  `CheckOutStatusName` varchar(255) DEFAULT NULL COMMENT 'Trạng thái phương thức thanh toán(1-Thanh toán,2-Chưa thanh toán)',
  `Reason` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_tb_orders_CustomerID` (`IdUser`),
  CONSTRAINT `FK_tb_orders_CustomerID` FOREIGN KEY (`IdUser`) REFERENCES `tb_user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Đơn đặt hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_orders`
--

LOCK TABLES `tb_orders` WRITE;
/*!40000 ALTER TABLE `tb_orders` DISABLE KEYS */;
INSERT INTO `tb_orders` VALUES (6,'DH100001','2023-04-27 05:59:53',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:00:00','DangPD','2023-04-27 13:00:00','DangPD'),(7,'DH100002','2023-04-27 06:01:41',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:01:54','DangPD','2023-04-27 13:01:54','DangPD'),(8,'DH100003','2023-04-27 06:02:03',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:02:17','DangPD','2023-04-27 13:02:17','DangPD'),(9,'DH100004','2023-04-27 06:04:03',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:04:33','DangPD','2023-04-27 13:04:33','DangPD'),(10,'DH100005','2023-04-27 06:24:21',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:24:32','DangPD','2023-04-27 13:24:32','DangPD'),(11,'DH100006','2023-04-27 06:24:43',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:25:02','DangPD','2023-04-27 13:25:02','DangPD'),(12,'DH100007','2023-04-27 06:25:16',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:25:21','DangPD','2023-04-27 13:25:21','DangPD'),(13,'DH100008','2023-04-27 06:25:27',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:25:31','DangPD','2023-04-27 13:25:31','DangPD'),(14,'DH100009','2023-04-27 06:25:59',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:26:14','DangPD','2023-04-27 13:26:14','DangPD'),(15,'DH100010','2023-04-27 06:26:21',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:26:30','DangPD','2023-04-27 13:26:30','DangPD'),(16,'DH100011','2023-04-27 06:26:53',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:27:04','DangPD','2023-04-27 13:27:04','DangPD'),(17,'DH100012','2023-04-27 06:27:14',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:27:22','DangPD','2023-04-27 13:27:22','DangPD'),(18,'DH100013','2023-04-27 06:28:03',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:28:12','DangPD','2023-04-27 13:28:12','DangPD'),(19,'DH100014','2023-04-27 06:30:53',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:31:07','DangPD','2023-04-27 13:31:07','DangPD'),(20,'DH100015','2023-04-27 06:35:30',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 13:35:35','DangPD','2023-04-27 13:35:35','DangPD'),(21,'DH100016','2023-04-27 07:05:36',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 14:05:46','DangPD','2023-04-27 14:05:46','DangPD'),(22,'DH100017','2023-04-27 07:14:05',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 14:14:10','DangPD','2023-04-27 14:14:10','DangPD'),(23,'DH100018','2023-04-27 07:25:08',0,'dang','Nam Định','123789',NULL,NULL,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 14:25:20','DangPD','2023-04-27 14:25:20','DangPD'),(24,'DH100019','2023-04-27 07:36:38',0,'dang','Nam Định','123789',NULL,0,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 21:25:33','DangPD'),(25,'DH100020','2023-04-27 09:57:59',0,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 16:59:54','DangPD','2023-04-27 16:59:54','DangPD'),(26,'DH100021','2023-04-27 10:00:06',1,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 17:00:23','DangPD','2023-04-27 17:00:23','DangPD'),(27,'DH100022','2023-04-27 10:00:41',1,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 17:00:45','DangPD','2023-04-27 17:00:45','DangPD'),(28,'DH100023','2023-04-27 10:00:50',1,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 17:01:01','DangPD','2023-04-27 17:01:01','DangPD'),(29,'DH100024','2023-04-27 10:01:23',1,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 17:02:12','DangPD','2023-04-27 17:02:12','DangPD'),(30,'DH100025','2023-04-27 10:05:26',1,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 17:05:35','DangPD','2023-04-27 17:05:35','DangPD'),(31,'DH100026','2023-04-27 10:05:43',1,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 17:06:04','DangPD','2023-04-27 17:06:04','DangPD'),(32,'DH100027','2023-04-27 10:06:37',1,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 17:06:39','DangPD','2023-04-27 17:06:39','DangPD'),(33,'DH100028','2023-04-27 10:06:55',1,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 17:06:58','DangPD','2023-04-27 17:06:58','DangPD'),(34,'DH100029','2023-04-27 10:07:06',1,'dang','Nam Định','123789',NULL,350000,2,'Chờ tiếp nhận',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-04-27 17:07:27','DangPD','2023-04-27 17:07:27','DangPD'),(35,'DH100030','2023-04-27 10:07:31',0,'dang','Nam Định','123789',NULL,350000,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 00:59:11','DangPD'),(36,'DH100031','2023-04-27 10:09:40',0,'dang','Nam Định','123789',NULL,350000,3,'Hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 00:57:32','DangPD'),(37,'DH100032','2023-04-27 10:09:52',0,'dang','Nam Định','123789',NULL,350000,3,'Hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 00:57:26','DangPD'),(38,'DH100033','2023-04-27 10:10:47',0,'dang','Nam Định','123789',NULL,350000,3,'Hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 00:57:22','DangPD'),(39,'DH100034','2023-04-27 10:10:56',0,'dang','Nam Định','123789',NULL,350000,3,'Hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 00:57:16','DangPD'),(40,'DH100035','2023-04-27 10:12:22',0,'dang','Nam Định','123789',NULL,350000,3,'Hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 00:57:10','DangPD'),(41,'DH100036','2023-04-27 11:14:32',0,'dang','Nam Định','123789',NULL,4800000,3,'Hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 00:55:18','DangPD'),(42,'DH100036','2023-04-27 11:14:32',0,'dang','Nam Định','123789',NULL,4800000,3,'Hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 00:54:55','DangPD'),(43,'DH100037','2023-04-28 05:58:38',0,'dang','Nam Định','123789',NULL,7950000,1,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 00:51:00','DangPD'),(44,'DH100038','2023-04-28 06:21:14',0,'dang','Nam Định','123789','lưu ý',700000,1,'Đặt hàng thành công',1,'Thanh toán qua VNPAY',0,'Đã thanh toán',NULL,NULL,NULL,'2023-04-29 00:48:54','DangPD'),(45,'DH100039','2023-04-28 18:11:46',0,'dang','Nam Định','123789','Test mua hàng',1650000,1,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 01:12:38','DangPD'),(46,'DH100040','2023-04-28 19:35:49',1,'dang','Nam Định','123789','id 1',450000,1,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-04-29 02:40:28','DangPD'),(51,'DH100041','2023-05-03 15:14:34',1,'dang','Nam Định','123789','mua 1015',600000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:14:34','DangPD','2023-05-03 22:14:34','DangPD'),(52,'DH100042','2023-05-03 15:17:04',1,'dang','Nam Định','123789','12345',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:17:04','DangPD','2023-05-03 22:17:04','DangPD'),(53,'DH100043','2023-05-03 15:20:45',1,'dang','Nam Định','123789','123456',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:20:45','DangPD','2023-05-03 22:20:45','DangPD'),(54,'DH100044','2023-05-03 15:23:05',1,'dang','Nam Định','123789','123456',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:23:05','DangPD','2023-05-03 22:23:05','DangPD'),(55,'DH100045','2023-05-03 15:23:22',1,'dang','Nam Định','123789','123456',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:23:32','DangPD','2023-05-03 22:23:32','DangPD'),(56,'DH100046','2023-05-03 15:24:13',1,'dang','Nam Định','123789','123456',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:24:53','DangPD','2023-05-03 22:24:53','DangPD'),(57,'DH100047','2023-05-03 15:25:46',1,'dang','Nam Định','123789','123456',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:25:54','DangPD','2023-05-03 22:25:54','DangPD'),(58,'DH100048','2023-05-03 15:26:32',1,'dang','Nam Định','123789','123456',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:26:34','DangPD','2023-05-03 22:26:34','DangPD'),(59,'DH100049','2023-05-03 15:26:41',1,'dang','Nam Định','123789','123456',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:26:43','DangPD','2023-05-03 22:26:43','DangPD'),(60,'DH100050','2023-05-03 15:26:50',1,'dang','Nam Định','123789','123456',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:28:00','DangPD','2023-05-03 22:28:00','DangPD'),(61,'DH100051','2023-05-03 15:31:56',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:31:59','DangPD','2023-05-03 22:31:59','DangPD'),(62,'DH100052','2023-05-03 15:32:37',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:32:57','DangPD','2023-05-03 22:32:57','DangPD'),(63,'DH100053','2023-05-03 15:33:49',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:33:52','DangPD','2023-05-03 22:33:52','DangPD'),(64,'DH100054','2023-05-03 15:34:02',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:34:18','DangPD','2023-05-03 22:34:18','DangPD'),(65,'DH100055','2023-05-03 15:33:58',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:34:35','DangPD','2023-05-03 22:34:35','DangPD'),(66,'DH100056','2023-05-03 15:34:42',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:34:59','DangPD','2023-05-03 22:34:59','DangPD'),(67,'DH100057','2023-05-03 15:35:10',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:37:12','DangPD','2023-05-03 22:37:12','DangPD'),(68,'DH100058','2023-05-03 15:37:06',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:37:58','DangPD','2023-05-03 22:37:58','DangPD'),(69,'DH100059','2023-05-03 15:38:05',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:39:02','DangPD','2023-05-03 22:39:02','DangPD'),(70,'DH100060','2023-05-03 15:39:27',1,'dang','Nam Định','123789','123',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:39:33','DangPD','2023-05-03 22:39:33','DangPD'),(71,'DH100061','2023-05-03 15:40:40',1,'dang','Nam Định','123789','12345678',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:42:01','DangPD','2023-05-03 22:42:01','DangPD'),(72,'DH100062','2023-05-03 15:43:56',1,'dang','Nam Định','123789','12345678',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:44:08','DangPD','2023-05-03 22:44:08','DangPD'),(73,'DH100063','2023-05-03 15:45:20',1,'dang','Nam Định','123789','12345678',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:45:24','DangPD','2023-05-03 22:45:24','DangPD'),(74,'DH100064','2023-05-03 15:47:07',1,'dang','Nam Định','123789','12345678',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-03 22:47:15','DangPD','2023-05-03 22:47:15','DangPD'),(75,'DH100065','2023-05-03 15:47:58',1,'dang','Nam Định','123789','12345678',300000,1,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán','thay doi',NULL,NULL,'2023-05-03 23:27:33','DangPD'),(76,'DH100066','2023-05-03 15:52:16',1,'dang','Nam Định','123789','Tset mazaf',450000,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-03 23:24:59','DangPD'),(77,'DH100067','2023-05-03 16:34:28',1,'dang','Nam Định','123789','Check than toan',3350000,1,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-04 09:33:06','DangPD'),(78,'DH100068','2023-05-04 14:18:17',1,'dang','Nam Định','123789','vnpay',300000,2,'Đang chờ xử lí',1,'Thanh toán qua VNPAY',0,'Đã thanh toán',NULL,'2023-05-04 21:18:17','DangPD','2023-05-04 21:18:17','DangPD'),(79,'DH100069','2023-05-04 14:36:11',1,'dang','Nam Định','123789','than toan vnpay',1500000,1,'Đặt hàng thành công',1,'Thanh toán qua VNPAY',0,'Đã thanh toán',NULL,NULL,NULL,'2023-05-12 13:37:56','DangPD'),(80,'DH100070','2023-05-04 14:44:54',1,'dang','Nam Định','123789','VNPAY',4450000,1,'Đặt hàng thành công',1,'Thanh toán qua VNPAY',0,'Đã thanh toán',NULL,NULL,NULL,'2023-05-04 21:47:15','DangPD'),(81,'DH100071','2023-05-04 14:46:20',1,'dang','Nam Định','123789','taij nha',3000000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-04 21:46:20','DangPD','2023-05-04 21:46:20','DangPD'),(82,'DH100072','2023-05-04 18:14:16',1,'dang','Nam Định','123789','test email',450000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:14:16','DangPD','2023-05-05 01:14:16','DangPD'),(83,'DH100073','2023-05-04 18:22:44',1,'dang','Nam Định','123789','15000',150000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:22:44','DangPD','2023-05-05 01:22:44','DangPD'),(84,'DH100074','2023-05-04 18:24:02',1,'dang','Nam Định','123789','152',150000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:24:02','DangPD','2023-05-05 01:24:02','DangPD'),(85,'DH100075','2023-05-04 18:26:28',1,'dang','Nam Định','123789','sd',150000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:26:28','DangPD','2023-05-05 01:26:28','DangPD'),(86,'DH100076','2023-05-04 18:27:54',1,'dang','Nam Định','123789','s',150000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:27:54','DangPD','2023-05-05 01:27:54','DangPD'),(87,'DH100077','2023-05-04 18:28:26',1,'dang','Nam Định','123789','c',150000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:28:26','DangPD','2023-05-05 01:28:26','DangPD'),(88,'DH100078','2023-05-04 18:31:02',1,'dang','Nam Định','123789','sd',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:31:02','DangPD','2023-05-05 01:31:02','DangPD'),(89,'DH100079','2023-05-04 18:33:09',1,'dang','Nam Định','123789','',150000,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-05 02:27:25','DangPD'),(90,'DH100080','2023-05-04 18:38:58',1,'dang','Nam Định','123789','test',2150000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:38:58','DangPD','2023-05-05 01:38:58','DangPD'),(91,'DH100081','2023-05-04 18:40:00',1,'dang','Nam Định','123789','ds',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:40:00','DangPD','2023-05-05 01:40:00','DangPD'),(92,'DH100082','2023-05-04 18:41:36',1,'dang','Nam Định','123789','',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:41:36','DangPD','2023-05-05 01:41:36','DangPD'),(93,'DH100083','2023-05-04 18:43:18',1,'dang','Nam Định','123789','',150000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:43:18','DangPD','2023-05-05 01:43:18','DangPD'),(94,'DH100084','2023-05-04 18:44:23',1,'dang','Nam Định','123789','csaaac',150000,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-05 02:32:04','DangPD'),(95,'DH100085','2023-05-04 18:45:36',1,'dang','Nam Định','123789','',600000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:45:36','DangPD','2023-05-05 01:45:36','DangPD'),(96,'DH100086','2023-05-04 18:51:26',1,'dang','Nam Định','123789','',400000,6,'Đơn hàng hoàn',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán','lỗi',NULL,NULL,'2023-05-12 13:39:48','DangPD'),(97,'DH100087','2023-05-04 18:52:18',1,'dang','Nam Định','123789','',400000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:52:18','DangPD','2023-05-05 01:52:18','DangPD'),(98,'DH100088','2023-05-04 18:52:35',1,'dang','Nam Định','123789','',400000,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-05 02:31:55','DangPD'),(99,'DH100089','2023-05-04 18:53:31',1,'dang','Nam Định','123789','',400000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 01:53:31','DangPD','2023-05-05 01:53:31','DangPD'),(100,'DH100090','2023-05-04 19:04:21',1,'dang','Nam Định','123789','',300000,1,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-12 13:16:37','DangPD'),(101,'DH100091','2023-05-04 19:06:53',1,'dang','Nam Định','123789','',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 02:06:53','DangPD','2023-05-05 02:06:53','DangPD'),(102,'DH100092','2023-05-04 19:08:19',1,'dang','Nam Định','123789','',300000,3,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 02:08:19','DangPD','2023-05-05 02:08:19','DangPD'),(103,'DH100093','2023-05-04 19:08:57',1,'dang','Nam Định','123789','',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 02:08:57','DangPD','2023-05-05 02:08:57','DangPD'),(104,'DH100094','2023-05-04 19:12:20',1,'dang','Nam Định','123789','',300000,6,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán','hoan hàng do lỗi',NULL,NULL,'2023-05-12 13:16:32','DangPD'),(105,'DH100095','2023-05-04 19:14:10',1,'dang','Nam Định','123789','',300000,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-05 02:31:47','DangPD'),(106,'DH100096','2023-05-04 19:14:31',1,'dang','Nam Định','123789','',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 02:14:31','DangPD','2023-05-05 02:14:31','DangPD'),(107,'DH100097','2023-05-04 19:16:45',1,'dang','Nam Định','123789','',300000,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-06 18:21:10','DangPD'),(108,'DH100098','2023-05-04 19:23:06',1,'dang','Nam Định','123789','',300000,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-05 02:27:40','DangPD'),(109,'DH100099','2023-05-04 19:24:29',1,'dang','Nam Định','123789','',300000,3,'Đơn hàng đã bị hủy',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-05 02:31:42','DangPD'),(110,'DH100100','2023-05-05 02:55:07',1,'dang','Nam Định','123789','',300000,1,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-12 13:16:27','DangPD'),(111,'DH100101','2023-05-05 02:59:52',1,'dang','Nam Định','123789','ok email',300000,1,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-12 11:48:00','DangPD'),(112,'DH100102','2023-05-05 03:13:28',1,'dang','Nam Định','123789','oke done email',300000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-05 10:13:28','DangPD','2023-05-05 10:13:28','DangPD'),(113,'DH100103','2023-05-05 03:19:04',1,'dang','Nam Định','123789','ghi chú',300000,3,'Đơn hàng đã bị hủy',1,'Thanh toán qua VNPAY',0,'Đã thanh toán',NULL,NULL,NULL,'2023-05-05 18:46:35','DangPD'),(114,'DH100104','2023-05-05 11:57:13',1,'dang','Nam Định','123789','vnpay 600000',600000,3,'Đang chờ xử lí',1,'Thanh toán qua VNPAY',0,'Đã thanh toán',NULL,'2023-05-05 18:57:14','DangPD','2023-05-05 18:57:14','DangPD'),(115,'DH100105','2023-05-06 07:38:42',1,'dang','Nam Định','123789','60000',600000,6,'Đơn hàng hoàn',1,'Thanh toán qua VNPAY',0,'Đã thanh toán','Lỗi sản phẩm',NULL,NULL,'2023-05-12 13:26:00','DangPD'),(116,'DH100106','2023-05-06 11:39:09',1,'dang','Nam Định','123789','',0,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-06 18:39:13','DangPD','2023-05-06 18:39:13','DangPD'),(117,'DH100107','2023-05-07 13:48:56',1,'dang','Nam Định','123789','Giao can thanh',300000,1,'Đặt hàng thành công',1,'Thanh toán qua VNPAY',0,'Đã thanh toán',NULL,NULL,NULL,'2023-05-07 20:50:47','DangPD'),(118,'DH100108','2023-05-07 14:10:58',1,'dang','Nam Định','123789','oke',350000,6,'Đặt hàng thành công',1,'Thanh toán qua VNPAY',0,'Đã thanh toán','thay od',NULL,NULL,'2023-05-07 21:13:20','DangPD'),(119,'DH100109','2023-05-07 14:12:43',1,'dang','Nam Định','123789','tai nha',350000,1,'Đặt hàng thành công',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,NULL,NULL,'2023-05-07 21:13:25','DangPD'),(120,'DH100110','2023-05-11 13:35:52',1,'dang','Nam Định','123789','',600000,3,'Đơn hàng đã bị hủy',1,'Thanh toán qua VNPAY',0,'Đã thanh toán',NULL,NULL,NULL,'2023-05-12 11:48:26','DangPD'),(121,'DH100111','2023-05-11 13:37:33',1,'dang','Nam Định','123789','',600000,6,'Đặt hàng thành công',1,'Thanh toán qua VNPAY',0,'Đã thanh toán','thay doi ',NULL,NULL,'2023-05-11 20:54:28','DangPD'),(122,'DH100112','2023-05-12 04:02:34',1,'dang','Nam Định','123789','',750000,1,'Đặt hàng thành công',1,'Thanh toán qua VNPAY',0,'Đã thanh toán',NULL,NULL,NULL,'2023-05-12 11:04:27','DangPD'),(123,'DH100113','2023-05-13 12:38:32',1,'dang1','Nam Định','123789','',700000,2,'Đang chờ xử lí',2,'Thanh toán khi nhận hàng',0,'Chưa thanh toán',NULL,'2023-05-13 19:38:32','DangPD','2023-05-13 19:38:32','DangPD');
/*!40000 ALTER TABLE `tb_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-14  9:32:41
