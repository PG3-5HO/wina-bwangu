-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wina_bwangu
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `booths`
--

DROP TABLE IF EXISTS `booths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booths` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booth_name` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booths`
--

LOCK TABLES `booths` WRITE;
/*!40000 ALTER TABLE `booths` DISABLE KEYS */;
INSERT INTO `booths` VALUES (1,'Wina1','Lusaka CPD'),(2,'Wina2','Libala'),(3,'Wina3','Kabwata'),(4,'Wina4','Mandevu'),(5,'Wina5','Woodlands'),(6,'Wina6','Matero East');
/*!40000 ALTER TABLE `booths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(50) NOT NULL,
  `monthly_limit` decimal(10,2) NOT NULL,
  `revenue_per_kwacha` decimal(5,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Airtel Money',350000.00,0.050),(2,'MTN Money',160000.00,0.060),(3,'Zamtel Money',70000.00,0.045),(4,'Zanaco',80000.00,0.035),(5,'FNB',80000.00,0.040);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(20) NOT NULL,
  `booth` varchar(20) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL,
  `revenue_per_kwacha` decimal(5,3) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `amount_after_tax` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (4,'WB0000001','Wina1','Lusaka CPD','Airtel Money',0.050,964.00,154.24,1118.24,'2026-09-15 17:06:00'),(5,'WB0000002','Wina1','Lusaka CPD','MTN Money',0.060,220.00,35.20,255.20,'2026-09-15 17:06:17'),(6,'WB0000003','Wina2','Libala','MTN Money',0.060,582.00,93.12,675.12,'2026-09-15 17:06:52'),(7,'WB0000004','Wina3','Kabwata','Zamtel Money',0.045,349.00,55.84,404.84,'2026-09-15 17:07:13'),(8,'WB0000005','Wina4','Mandevu','Airtel Money',0.050,328.00,52.48,380.48,'2026-09-15 17:07:36'),(9,'WB0000006','Wina3','Kabwata','MTN Money',0.060,192.00,30.72,222.72,'2026-09-15 17:08:08'),(10,'WB0000007','Wina3','Kabwata','Zanaco',0.035,1519.00,243.04,1762.04,'2026-09-15 17:08:35'),(11,'WB0000008','Wina4','Mandevu','Zamtel Money',0.045,1113.00,178.08,1291.08,'2026-09-15 17:08:54'),(12,'WB0000009','Wina1','Lusaka CPD','FNB',0.040,1999.00,319.84,2318.84,'2026-09-15 17:09:18'),(13,'WB0000010','Wina3','Kabwata','Airtel Money',0.050,3810.00,609.60,4419.60,'2026-09-15 17:09:53'),(14,'WB0000011','Wina6','Matero East','Zamtel Money',0.045,3270.00,523.20,3793.20,'2026-09-15 17:10:17'),(15,'WB0000012','Wina3','Kabwata','Zanaco',0.035,1092.00,174.72,1266.72,'2026-09-15 17:10:57'),(16,'WB0000013','Wina2','Libala','Airtel Money',0.050,1056.00,168.96,1224.96,'2026-09-15 17:12:46'),(17,'WB0000014','Wina3','Kabwata','Airtel Money',0.050,509.00,81.44,590.44,'2026-09-15 17:13:11'),(18,'WB0000015','Wina5','Woodlands','FNB',0.040,34.00,5.44,39.44,'2026-09-15 17:13:40'),(19,'WB0000016','Wina2','Libala','MTN Money',0.060,1658.00,265.28,1923.28,'2026-09-15 17:14:05'),(20,'WB0000017','Wina3','Kabwata','Airtel Money',0.050,2594.00,415.04,3009.04,'2026-09-15 17:16:50'),(21,'WB0000018','Wina4','Mandevu','Airtel Money',0.050,3656.00,584.96,4240.96,'2026-09-15 17:17:14'),(22,'WB0000019','Wina3','Kabwata','Airtel Money',0.050,4030.00,644.80,4674.80,'2026-09-15 17:17:37'),(23,'WB0000020','Wina3','Kabwata','Zanaco',0.035,989.00,158.24,1147.24,'2026-09-15 17:17:58'),(24,'WB0000021','Wina3','Kabwata','Airtel Money',0.050,4081.00,652.96,4733.96,'2026-09-15 17:18:27'),(25,'WB0000022','Wina4','Mandevu','Airtel Money',0.050,925.00,148.00,1073.00,'2026-09-15 17:18:50'),(26,'WB0000023','Wina2','Libala','MTN Money',0.060,2312.00,369.92,2681.92,'2026-09-15 17:19:17'),(27,'WB0000024','Wina3','Kabwata','Zanaco',0.035,3280.00,524.80,3804.80,'2026-09-15 17:19:37'),(28,'WB0000025','Wina4','Mandevu','Airtel Money',0.050,90.00,14.40,104.40,'2026-09-15 17:19:54'),(29,'WB0000026','Wina5','Woodlands','FNB',0.040,2556.00,408.96,2964.96,'2026-09-15 17:20:14'),(30,'WB0000027','Wina3','Kabwata','Zanaco',0.035,673.00,107.68,780.68,'2026-09-15 17:20:35'),(31,'WB0000028','Wina4','Mandevu','MTN Money',0.060,4185.00,669.60,4854.60,'2026-09-15 17:20:57'),(32,'WB0000029','Wina1','Lusaka CPD','Zanaco',0.035,412.00,65.92,477.92,'2026-09-15 17:21:16'),(33,'WB0000030','Wina1','Lusaka CPD','MTN Money',0.060,310.00,49.60,359.60,'2026-09-15 17:21:38'),(34,'WB0000031','Wina2','Libala','MTN Money',0.060,4248.00,679.68,4927.68,'2026-09-15 17:22:03'),(35,'WB0000032','Wina3','Kabwata','Airtel Money',0.050,4105.00,656.80,4761.80,'2026-09-15 17:22:27'),(36,'WB0000033','Wina4','Mandevu','Airtel Money',0.050,1147.00,183.52,1330.52,'2026-09-15 17:22:53'),(37,'WB0000034','Wina3','Kabwata','Zamtel Money',0.045,1815.00,290.40,2105.40,'2026-09-15 17:23:34'),(38,'WB0000035','Wina3','Kabwata','Zanaco',0.035,1653.00,264.48,1917.48,'2026-09-15 17:24:05'),(39,'WB0000036','Wina4','Mandevu','Airtel Money',0.050,1045.00,167.20,1212.20,'2026-09-15 17:24:32'),(40,'WB0000037','Wina1','Lusaka CPD','FNB',0.040,4364.00,698.24,5062.24,'2026-09-15 17:24:56'),(41,'WB0000038','Wina3','Kabwata','MTN Money',0.060,2822.00,451.52,3273.52,'2026-09-15 17:25:35'),(42,'WB0000039','Wina6','Matero East','Airtel Money',0.050,2046.00,327.36,2373.36,'2026-09-15 17:25:58'),(43,'WB0000040','Wina3','Kabwata','Zamtel Money',0.045,1985.00,317.60,2302.60,'2026-09-15 17:27:42'),(44,'WB0000041','Wina2','Libala','MTN Money',0.060,3023.00,483.68,3506.68,'2026-09-15 17:28:16'),(45,'WB0000042','Wina3','Kabwata','Airtel Money',0.050,3728.00,596.48,4324.48,'2026-09-15 17:29:17'),(46,'WB0000043','Wina5','Woodlands','MTN Money',0.060,58.00,9.28,67.28,'2026-09-15 17:29:34'),(47,'WB0000044','Wina2','Libala','Airtel Money',0.050,2744.00,439.04,3183.04,'2026-09-15 17:29:58'),(48,'WB0000045','Wina5','Woodlands','FNB',0.040,1654.00,264.64,1918.64,'2026-09-15 17:30:19'),(49,'WB0000046','Wina3','Kabwata','Airtel Money',0.050,1331.00,212.96,1543.96,'2026-09-15 17:30:58'),(50,'WB0000047','Wina4','Mandevu','Airtel Money',0.050,801.00,128.16,929.16,'2026-09-15 17:32:05'),(51,'WB0000048','Wina3','Kabwata','MTN Money',0.060,967.00,154.72,1121.72,'2026-09-15 17:32:27'),(52,'WB0000049','Wina3','Kabwata','MTN Money',0.060,1988.00,318.08,2306.08,'2026-09-15 17:32:51'),(53,'WB0000050','Wina3','Kabwata','Airtel Money',0.050,3646.00,583.36,4229.36,'2026-09-15 17:33:09'),(54,'WB0000051','Wina4','Mandevu','Airtel Money',0.050,54.00,8.64,62.64,'2026-09-15 17:33:28'),(55,'WB0000052','Wina2','Libala','Zamtel Money',0.045,2121.00,339.36,2460.36,'2026-09-15 17:33:45'),(56,'WB0000053','Wina3','Kabwata','Zanaco',0.035,564.00,90.24,654.24,'2026-09-15 17:36:19'),(57,'WB0000054','Wina4','Mandevu','Airtel Money',0.050,1011.00,161.76,1172.76,'2026-09-15 17:36:38'),(58,'WB0000055','Wina5','Woodlands','FNB',0.040,2950.00,472.00,3422.00,'2026-09-15 17:37:01'),(59,'WB0000056','Wina3','Kabwata','Zanaco',0.035,57.00,9.12,66.12,'2026-09-15 17:37:18'),(60,'WB0000057','Wina4','Mandevu','Airtel Money',0.050,2382.00,381.12,2763.12,'2026-09-15 17:37:38'),(61,'WB0000058','Wina1','Lusaka CPD','MTN Money',0.060,349.00,55.84,404.84,'2026-09-15 17:37:56'),(62,'WB0000059','Wina1','Lusaka CPD','Airtel Money',0.050,2479.00,396.64,2875.64,'2026-09-15 17:38:14'),(63,'WB0000060','Wina2','Libala','Airtel Money',0.050,1537.00,245.92,1782.92,'2026-09-15 17:38:31'),(64,'WB0000061','Wina3','Kabwata','Zamtel Money',0.045,2802.00,448.32,3250.32,'2026-09-15 17:38:49'),(65,'WB0000062','Wina4','Mandevu','Airtel Money',0.050,1290.00,206.40,1496.40,'2026-09-15 17:39:06'),(66,'WB0000063','Wina3','Kabwata','MTN Money',0.060,4331.00,692.96,5023.96,'2026-09-15 17:39:21'),(67,'WB0000064','Wina3','Kabwata','Zanaco',0.035,1338.00,214.08,1552.08,'2026-09-15 17:39:38'),(68,'WB0000065','Wina4','Mandevu','Airtel Money',0.050,1477.00,236.32,1713.32,'2026-09-15 17:39:53'),(69,'WB0000066','Wina1','Lusaka CPD','Airtel Money',0.050,3430.00,548.80,3978.80,'2026-09-15 17:40:11'),(70,'WB0000067','Wina3','Kabwata','MTN Money',0.060,451.00,72.16,523.16,'2026-09-15 17:40:30'),(71,'WB0000068','Wina6','Matero East','Airtel Money',0.050,80.00,12.80,92.80,'2026-09-15 18:23:33'),(72,'WB0000069','Wina3','Kabwata','Zanaco',0.035,2002.00,320.32,2322.32,'2026-09-19 15:15:19'),(73,'WB0000070','Wina2','Libala','Airtel Money',0.050,3235.00,517.60,3752.60,'2026-09-19 15:15:45'),(74,'WB0000071','Wina3','Kabwata','MTN Money',0.060,4156.00,664.96,4820.96,'2026-09-19 15:16:10'),(75,'WB0000072','Wina5','Woodlands','Airtel Money',0.050,22.00,3.52,25.52,'2026-09-19 15:16:29'),(76,'WB0000073','Wina2','Libala','Airtel Money',0.050,2156.00,344.96,2500.96,'2026-09-19 15:16:47'),(77,'WB0000074','Wina5','Woodlands','MTN Money',0.060,2267.00,362.72,2629.72,'2026-09-19 15:17:09'),(78,'WB0000075','Wina3','Kabwata','Zamtel Money',0.045,2419.00,387.04,2806.04,'2026-09-19 15:17:27'),(79,'WB0000076','Wina4','Mandevu','Airtel Money',0.050,1691.00,270.56,1961.56,'2026-09-19 15:18:34'),(80,'WB0000077','Wina3','Kabwata','Airtel Money',0.050,2736.00,437.76,3173.76,'2026-09-19 15:19:40'),(81,'WB0000078','Wina3','Kabwata','MTN Money',0.060,4282.00,685.12,4967.12,'2026-09-19 15:20:02'),(82,'WB0000079','Wina3','Kabwata','Zamtel Money',0.045,2331.00,372.96,2703.96,'2026-09-19 15:20:22'),(83,'WB0000080','Wina4','Mandevu','Airtel Money',0.050,1405.00,224.80,1629.80,'2026-09-19 15:20:38'),(84,'WB0000081','Wina2','Libala','Airtel Money',0.050,945.00,151.20,1096.20,'2026-09-19 15:21:06'),(85,'WB0000082','Wina3','Kabwata','Zanaco',0.035,688.00,110.08,798.08,'2026-09-19 15:21:30'),(86,'WB0000083','Wina4','Mandevu','Airtel Money',0.050,189.00,30.24,219.24,'2026-09-19 15:21:48'),(87,'WB0000084','Wina5','Woodlands','FNB',0.040,3787.00,605.92,4392.92,'2026-09-19 15:22:07'),(88,'WB0000085','Wina3','Kabwata','Zanaco',0.035,3407.00,545.12,3952.12,'2026-10-06 10:02:21'),(89,'WB0000086','Wina4','Mandevu','Airtel Money',0.050,1105.00,176.80,1281.80,'2026-10-06 10:02:37'),(90,'WB0000087','Wina6','Matero East','Airtel Money',0.050,174.00,27.84,201.84,'2026-10-06 10:02:55'),(91,'WB0000088','Wina2','Libala','MTN Money',0.060,1440.00,230.40,1670.40,'2026-10-06 10:03:16'),(92,'WB0000089','Wina6','Matero East','Airtel Money',0.050,3344.00,535.04,3879.04,'2026-10-06 10:03:55'),(93,'WB0000090','Wina2','Libala','Airtel Money',0.050,2676.00,428.16,3104.16,'2026-10-06 10:06:20'),(94,'WB0000091','Wina2','Libala','Airtel Money',0.050,812.00,129.92,941.92,'2026-10-06 10:06:38'),(95,'WB0000092','Wina3','Kabwata','Zanaco',0.035,4224.00,675.84,4899.84,'2026-10-06 10:06:56'),(96,'WB0000093','Wina3','Kabwata','Airtel Money',0.050,592.00,94.72,686.72,'2026-10-06 10:07:17'),(97,'WB0000094','Wina3','Kabwata','Airtel Money',0.050,1662.00,265.92,1927.92,'2026-10-06 10:07:42'),(98,'WB0000095','Wina2','Libala','Airtel Money',0.050,1915.00,306.40,2221.40,'2026-10-06 10:08:13'),(99,'WB0000096','Wina3','Kabwata','Airtel Money',0.050,1866.00,298.56,2164.56,'2026-10-06 10:08:33'),(100,'WB0000097','Wina6','Matero East','MTN Money',0.060,4320.00,691.20,5011.20,'2026-10-06 10:09:06'),(101,'WB0000098','Wina2','Libala','Airtel Money',0.050,228.00,36.48,264.48,'2026-10-06 10:09:26'),(102,'WB0000099','Wina6','Matero East','Airtel Money',0.050,3318.00,530.88,3848.88,'2026-10-06 10:09:45'),(103,'WB0000100','Wina2','Libala','Airtel Money',0.050,3615.00,578.40,4193.40,'2026-10-06 10:11:48'),(104,'WB0000101','Wina2','Libala','Airtel Money',0.050,4156.00,664.96,4820.96,'2026-10-06 10:12:12'),(105,'WB0000102','Wina3','Kabwata','Zamtel Money',0.045,1401.00,224.16,1625.16,'2026-10-06 10:12:33'),(106,'WB0000103','Wina3','Kabwata','Airtel Money',0.050,2014.00,322.24,2336.24,'2026-10-06 10:12:54'),(107,'WB0000104','Wina3','Kabwata','MTN Money',0.060,3475.00,556.00,4031.00,'2026-10-06 10:13:12'),(108,'WB0000105','Wina2','Libala','MTN Money',0.060,2452.00,392.32,2844.32,'2026-10-06 10:13:38'),(109,'WB0000106','Wina3','Kabwata','Zanaco',0.035,1720.00,275.20,1995.20,'2026-10-06 10:14:00'),(110,'WB0000107','Wina2','Libala','Airtel Money',0.050,118.00,18.88,136.88,'2026-10-06 10:14:22');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-06 19:23:29
