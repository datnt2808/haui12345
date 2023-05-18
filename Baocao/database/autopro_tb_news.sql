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
-- Table structure for table `tb_news`
--

DROP TABLE IF EXISTS `tb_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_news` (
  `NewsID` int NOT NULL AUTO_INCREMENT,
  `NewsTitle` varchar(500) DEFAULT NULL,
  `NewsDate` datetime DEFAULT NULL,
  `Image` text,
  `ContentShorted` varchar(500) DEFAULT NULL,
  `Content` text,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NewsID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tin tức';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_news`
--

LOCK TABLES `tb_news` WRITE;
/*!40000 ALTER TABLE `tb_news` DISABLE KEYS */;
INSERT INTO `tb_news` VALUES (1,'Những phụ tùng tăng hiệu suất cho chiếc ô tô của bạn','2023-04-01 00:00:00','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/News%2Ftb.png?alt=media&token=ab0ca7f9-0e53-47a4-9a59-c18fb59500d0','Những phụ tùng tăng hiệu suất cho ô tô là các linh kiện được thiết kế để cải thiện hiệu suất của động cơ và hệ thống lái.','Những phụ tùng tăng hiệu suất cho ô tô là các linh kiện được thiết kế để cải thiện hiệu suất của động cơ và hệ thống lái. Những phụ tùng ô tô này bao gồm các thành phần như turbocharger, supercharger, intercooler, bộ làm mát nước, bộ làm mát dầu, bộ giảm chấn động, bộ tăng áp động cơ, hộp số tăng cường, ly hợp hiệu suất cao, bộ phanh đĩa, bộ phanh thủy lực, động cơ tăng áp, bộ giảm tiếng ồn và nhiều phụ tùng khác.','2023-04-21 18:27:48','DangPD','2023-04-23 19:42:30','DangPD'),(2,'Cách tìm kiếm và chọn mua phụ tùng ô tô chất lượng cao','2023-04-08 00:00:00','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/News%2Fpt.png?alt=media&token=34af0379-597a-4211-8a13-5fadd72bc64d','Bài viết \"Cách tìm kiếm và chọn mua phụ tùng ô tô chất lượng cao\" sẽ cung cấp cho người đọc các thông tin hữu ích để lựa chọn phụ tùng ô tô chất lượng cao và đảm bảo an toàn khi sử dụng xe','Bài viết \"Cách tìm kiếm và chọn mua phụ tùng ô tô chất lượng cao\" sẽ cung cấp cho người đọc các thông tin hữu ích để lựa chọn phụ tùng ô tô chất lượng cao và đảm bảo an toàn khi sử dụng xe. Bài viết sẽ trình bày cách tìm hiểu về nhà sản xuất, kiểm tra độ chính xác và sự hoàn thiện của sản phẩm, tham khảo ý kiến của người sử dụng trước đó, kiểm tra độ bền và độ tin cậy của sản phẩm. Ngoài ra, bài viết cũng đề cập đến việc chọn phụ tùng theo hãng xe và dòng xe, chọn phụ tùng chính hãng hoặc phụ tùng thay thế có chất lượng tương đương, tìm kiếm giá cả hợp lý và các chính sách bảo hành và hậu mãi. Tất cả những thông tin trên sẽ giúp người đọc có được sự tự tin khi tìm kiếm và chọn mua phụ tùng ô tô chất lượng cao.','2023-04-21 18:32:14','DangPD','2023-04-23 19:40:31','DangPD'),(4,'Tháng 3 yêu thương cùng chị em AutoPro','2023-04-02 00:00:00','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/News%2F1.jpg?alt=media&token=3a1474e1-7e17-49e0-bd8c-c09bd71ff325','Hằng năm, cứ đến ngày 8/3 chúng ta lại cùng hướng về sự kiện tri ân đến những người phụ nữ yêu thương trên toàn thế giới.','Hằng năm, cứ đến ngày 8/3 chúng ta lại cùng hướng về sự kiện tri ân đến những người phụ nữ yêu thương trên toàn thế giới. Có thể nói, chị em phụ nữ đóng một vai trò vô cùng quan trong trong cuộc sống mà không gì có thể thay thế được. Ở thời kì nào cũng vậy, phụ nữ luôn mang một vẻ đẹp bất biến. Đó là nét đẹp của sự nhẫn nại, thủy chung, của sự tỉ mỉ chăm sóc yêu thương gia đình  Và ngày nay, phụ nữ càng tự khẳng định bản lĩnh của mình trong công cuộc xây dựng và phát triển đất nước. Phụ nữ là đại diện cho phái đẹp, cả thế giới dành riêng 8/3 là ngày đặc biệt dành cho phụ nữ, và trong trái tim mỗi người luôn có những phần đặc biệt dành cho những người phụ nữ mà mình yêu thương nhất.  Nhân Ngày Quốc tế Phụ nữ 8/3 xin gửi lời chúc tới tất cả phụ nữ nói chung và chị em MAST PRO nói riêng lời chúc mừng tốt đẹp nhất! Chúc cho tất cả chị, em ngày càng xinh đẹp và thành công trong cuộc sống! Mọi người mãi là một nửa trung tâm của thế giới.','2023-04-22 08:56:33','DangPD','2023-04-23 19:38:32','DangPD'),(5,'Sinh nhật Hệ thống Phụ tùng ô tô AutoPro','2023-04-21 00:00:00','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/News%2F1.jpg?alt=media&token=601b20e4-af44-4453-a713-e8f43ddde92c','Trân trọng cảm ơn các anh chị em Khách hàng, Đại lý và Đối tác đang hoạt động trong lĩnh vực kinh doanh phụ tùng - phụ kiện, dịch vụ sửa chữa - bảo dưỡng ô tô đã đến tặng hoa, tặng quà và tham dự buổi Hội nghị khách hàng năm 2023 ','Trân trọng cảm ơn các anh chị em Khách hàng, Đại lý và Đối tác đang hoạt động trong lĩnh vực kinh doanh phụ tùng - phụ kiện, dịch vụ sửa chữa - bảo dưỡng ô tô đã đến tặng hoa, tặng quà và tham dự buổi Hội nghị khách hàng năm 2023 với chủ đề \"9 năm - Một hành trình\" do tập đoàn CTR và Hệ thống phụ tùng ô tô chính hãng MAST đồng phối hợp tổ chức. Tôi thực sự rất vui và vinh hạnh vì sự hiện diện đông đủ của các anh chị em trong buổi tối ngày hôm qua.','2023-04-23 19:44:12','DangPD','2023-04-23 19:44:12','DangPD'),(6,'6 Phụ kiện ô tô nên mua trong mùa mưa bão','2023-04-23 12:54:38','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/News%2F6.jpg?alt=media&token=34e8e056-d3af-4486-bde1-69daac3b6e80','Cứ 1000 người sử dụng ô tô thì có tới 999 người không dưới một lần tìm hiểu và đặt mua các loại phụ kiện cho chiếc xe yêu quý của mình. Đó có thể là phụ kiện nội thất ô tô, phụ kiện ngoại thất ô tô, phụ kiện với nhiều chức năng tiện ích hay đơn giản là những thiết bị trang trí giúp xe thêm sang trọng, phụ kiện theo mùa nóng, mùa mưa… ','Cứ 1000 người sử dụng ô tô thì có tới 999 người không dưới một lần tìm hiểu và đặt mua các loại phụ kiện cho chiếc xe yêu quý của mình. Đó có thể là phụ kiện nội thất ô tô, phụ kiện ngoại thất ô tô, phụ kiện với nhiều chức năng tiện ích hay đơn giản là những thiết bị trang trí giúp xe thêm sang trọng, phụ kiện theo mùa nóng, mùa mưa… Đặc biệt vào mùa mưa, người lái ô tô gặp rất nhiều bất tiện, hơn thế ít nhiều ảnh hưởng đến quá trình di chuyển cũng như an toàn. Để giúp bạn bảo vệ xe và lái xe an toàn trong mùa mưa bão, bạn nên sắm một số phụ kiện ô tô nên mua dưới đây.Cần gạt mưa Cần gạt mưa sẽ giúp người lái dễ dàng gạt nước mưa trên kính chắn gió. Để giúp đảm bảo tầm nhìn cho người lái, loại bỏ hoàn toàn bụi bẩn; lá cây rơi trên kính chắn gió. Đây là món phụ kiện nhất định bạn không thể thiếu mỗi khi trời mưa.  Miếng dán chống nước mưa trên kính chiếu hậu Đây là phụ kiện giúp cho gương chiếu hậu của ô tô không bị nước mưa bám vào gây mất tầm nhìn của người lái xe. Bên cạnh đó; miếng dán chống nước còn có thể tăng độ sáng cho gương; giảm độ chói từ đèn pha xe khác vào ban đêm.  Vè che mưa Vè che mưa là phụ kiện ngoại thất ô tô giúp tránh mưa làm ướt nội thất ô tô cũng như giúp thông gió khi bạn hút thuốc, hoặc khi trời mưa. Bên cạnh đó; vè che mưa còn có thể giảm tiếng ù khi bạn hạ kính xe hoặc cản tiếng ồn khá tốt.  Thảm lót sàn ô tô Thảm lót sàn là phụ kiện nội thất ô tô giúp bảo vệ sàn ô tô không bị ướt gây trơn trượt; nước bẩn bắn ra sàn tạo cơ hội cho vi khuẩn phát triển; xuất hiện mùi hôi  cho xe. Đó là lý do tại sao bạn nên sử dụng thảm trải sàn. ','2023-04-23 19:56:11','DangPD','2023-04-23 19:59:48','DangPD');
/*!40000 ALTER TABLE `tb_news` ENABLE KEYS */;
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
