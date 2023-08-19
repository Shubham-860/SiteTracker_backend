-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: land_development
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `dieselpurchase`
--

DROP TABLE IF EXISTS `dieselpurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieselpurchase` (
  `iddieselPurchase` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `PumpName` varchar(45) DEFAULT NULL,
  `PumpAddress` varchar(450) DEFAULT NULL,
  `Remark` varchar(450) DEFAULT NULL,
  `Rate` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Total` int DEFAULT NULL,
  `uid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddieselPurchase`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieselpurchase`
--

LOCK TABLES `dieselpurchase` WRITE;
/*!40000 ALTER TABLE `dieselpurchase` DISABLE KEYS */;
INSERT INTO `dieselpurchase` VALUES (1,'2023-06-09 22:43:00','shree','phaltan','na',98,100,9800,'ouglbkdlsnl;ndsl;nsdl;nsa;njf'),(2,'2023-06-08 13:37:00','shinde','nirgudi','na',98,24,2352,'a8637f69-4d5b-491c-9f34-c5775cdcc947'),(7,'2023-06-12 11:50:00','kamle','girvi road','na',98,15,1470,'320f6b98-1432-48c8-8b5e-78ff4a006dd9'),(8,'2023-06-15 21:57:00','jadhavvadi pump','jadhavadi','na',100,50,5000,'de5a9109-081b-4f8c-a586-7d9fe65b24ba'),(10,'2023-06-10 10:06:00','Nirgudi Petrol pump','Nirgudi','na',98,60,5880,'567a2d2f-498e-463d-a646-ee6ee9d9d416'),(11,'2023-06-17 16:57:00','Phaltan','phaltan','na',98,20,1960,'904040ae-ddf6-41e1-bb21-a5fc9dd44699'),(14,'2023-06-19 11:52:00','phaltan','phaltan','phaltan',98,1000,98000,'74a6d98e-0081-4b01-9b4c-efd739490824');
/*!40000 ALTER TABLE `dieselpurchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `iddrivers` int NOT NULL AUTO_INCREMENT,
  `DriverName` varchar(45) DEFAULT NULL,
  `DriverContact` double DEFAULT NULL,
  `DriverAddress` varchar(450) DEFAULT NULL,
  `AadharCard` double DEFAULT NULL,
  `DrivingLicense` varchar(45) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `RatePerHour` int DEFAULT NULL,
  `Remark` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`iddrivers`),
  UNIQUE KEY `iddrivers_UNIQUE` (`iddrivers`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Shreeraj lawand',9638527410,'phaltan',951357824635715,'mh11sad4sad4sad','2023-06-10',300,'good at jcb'),(2,'raj',2584563575,'thane',953698745621354,'mh1251asd41sda','2023-05-09',200,'na'),(3,'sonu',654265478,'satara',852456951753952,'sadsadasd','2023-06-16',350,'After vanquishing another boss and stepping through the gates of the fifth floor, the misfit duo Kazuto \"Kirito\" Kirigaya and Asuna Yuuki are greeted with a beautiful landscape of crumbling ruins and catacombs steeped in mystery.');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driverssalary`
--

DROP TABLE IF EXISTS `driverssalary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driverssalary` (
  `iddriverssalary` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) DEFAULT NULL,
  `DriverName` varchar(45) DEFAULT NULL,
  `PayDay` date DEFAULT NULL,
  `Month` date DEFAULT NULL,
  `AmountToPay` int DEFAULT NULL,
  `TotalHours` int DEFAULT NULL,
  PRIMARY KEY (`iddriverssalary`),
  UNIQUE KEY `iddriverssalary_UNIQUE` (`iddriverssalary`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driverssalary`
--

LOCK TABLES `driverssalary` WRITE;
/*!40000 ALTER TABLE `driverssalary` DISABLE KEYS */;
INSERT INTO `driverssalary` VALUES (1,'8f73e5e5-961b-4282-96ee-1749b7b3839c','shree','2023-06-14','2023-06-01',2400,8),(3,'164057a1-c9aa-4cb8-be4c-0b260b4c03e2','sonu','2023-06-14','2023-04-01',2792,8),(6,'8100d525-04b9-4f4e-9f9a-a3591222729f','Shreeraj lawand','2023-06-15','2023-06-01',2400,8),(7,'9665c547-02fe-48ec-8c35-8a6387f15b8a','Shreeraj lawand','2023-08-12','2023-08-01',2400,8);
/*!40000 ALTER TABLE `driverssalary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintainces`
--

DROP TABLE IF EXISTS `maintainces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintainces` (
  `idmaintainces` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `siteSame` varchar(45) DEFAULT NULL,
  `DriverName` varchar(45) DEFAULT NULL,
  `VehicleNumber` varchar(45) DEFAULT NULL,
  `issue` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idmaintainces`),
  UNIQUE KEY `idmaintainces_UNIQUE` (`idmaintainces`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintainces`
--

LOCK TABLES `maintainces` WRITE;
/*!40000 ALTER TABLE `maintainces` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintainces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `idpayments` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `from` varchar(45) DEFAULT NULL,
  `to` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`idpayments`),
  UNIQUE KEY `idpayments_UNIQUE` (`idpayments`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (3,'904040ae-ddf6-41e1-bb21-a5fc9dd44699',1960,'Vishwaraj Enterprise','Phaltan','Purchase Fuel','Fuel','2023-05-17 16:57:00'),(18,'a0d03b4e-c86f-4720-9547-a1016abb5a40',500,'shubham','Vishwaraj Enterprise','Owner Payment','Payment','2023-04-17 18:29:00'),(22,'74a6d98e-0081-4b01-9b4c-efd739490824',98000,'Vishwaraj Enterprise','phaltan','Purchase Fuel','Fuel','2023-06-19 11:52:00'),(26,'539107f1-f182-49cb-91f9-48834786485f',2000,'shubham','Vishwaraj Enterprise','Owner PAyment','Payment','2023-06-22 23:02:00'),(27,'bbb18060-a3db-4e12-8ba6-87f4b1c70935',15000,'shubham','Vishwaraj Enterprise','Owner PAyment','Payment','2023-06-22 23:04:00'),(31,'e830a28a-d23c-473f-ab90-9e14a51b3c5a',15000,'Shantanu','Vishwaraj Enterprise','Owner PAyment','Payment','2023-06-22 23:16:00'),(32,'eba99f7f-c493-400f-88c1-0e59f7780d12',20000,'shubham','Vishwaraj Enterprise','Owner PAyment','Payment','2023-06-23 23:35:00'),(33,'9665c547-02fe-48ec-8c35-8a6387f15b8a',2400,'Vishwaraj Enterprise','Shreeraj lawand','Salary','Salary','2023-08-12 00:00:00');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `siteid` int NOT NULL AUTO_INCREMENT,
  `OwnerName` varchar(45) DEFAULT NULL,
  `SiteName` varchar(45) DEFAULT NULL,
  `Contact` double DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `SiteAddress` varchar(450) DEFAULT NULL,
  `Remark` varchar(450) DEFAULT NULL,
  `FixedAmount` double DEFAULT NULL,
  `PaidAmount` double DEFAULT NULL,
  `EntryDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`siteid`),
  UNIQUE KEY `id_UNIQUE` (`siteid`),
  UNIQUE KEY `SiteName_UNIQUE` (`SiteName`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'shubham','phaltan',1234567890,'asdnasndb','asdnnjc ','.nkcljnc;lsn',52000,22000,'2023-06-10 11:29:24'),(2,'Shubham salunkhe','pancharatna',8600059426,'shubhamsalunkhe860@gmail.com','B-4 Panchratna apartment Jadhavwadi Near Sai Baba Temple','nothing',20000,10000,'2023-06-08 11:29:24'),(3,'Shantanu','villa',951254684,'shantanu@gmail,com','jadhavvadi','na',50000,15000,'2023-06-11 11:30:33');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitepayment`
--

DROP TABLE IF EXISTS `sitepayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitepayment` (
  `idsitepayment` int NOT NULL AUTO_INCREMENT,
  `SiteName` varchar(45) DEFAULT NULL,
  `FixedAmount` int DEFAULT NULL,
  `PayingAmount` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `uid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsitepayment`),
  UNIQUE KEY `idsitepayment_UNIQUE` (`idsitepayment`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitepayment`
--

LOCK TABLES `sitepayment` WRITE;
/*!40000 ALTER TABLE `sitepayment` DISABLE KEYS */;
INSERT INTO `sitepayment` VALUES (1,'phaltan',52000,500,'2023-06-17 18:24:00','8d2b9e78-b844-42d6-9390-159bf03ead04'),(20,'phaltan',52000,500,'2023-06-17 18:29:00','a0d03b4e-c86f-4720-9547-a1016abb5a40'),(23,'phaltan',52000,2000,'2023-06-22 23:02:00','539107f1-f182-49cb-91f9-48834786485f'),(24,'phaltan',52000,15000,'2023-06-22 23:04:00','bbb18060-a3db-4e12-8ba6-87f4b1c70935'),(28,'villa',50000,15000,'2023-06-22 23:16:00','e830a28a-d23c-473f-ab90-9e14a51b3c5a'),(29,'phaltan',52000,20000,'2023-06-23 23:35:00','eba99f7f-c493-400f-88c1-0e59f7780d12');
/*!40000 ALTER TABLE `sitepayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockdiesel`
--

DROP TABLE IF EXISTS `stockdiesel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockdiesel` (
  `idstockDiesel` int NOT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`idstockDiesel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockdiesel`
--

LOCK TABLES `stockdiesel` WRITE;
/*!40000 ALTER TABLE `stockdiesel` DISABLE KEYS */;
INSERT INTO `stockdiesel` VALUES (1,3930);
/*!40000 ALTER TABLE `stockdiesel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `superuser` varchar(4) DEFAULT 'No',
  `InsertDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `id_UNIQUE` (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'abc@gmail.com','123','Yes','2023-06-22 23:38:41'),(2,'shubhamsalunkhe860@gmail.com','123','Yes','2023-06-22 23:38:41'),(3,'abcd@gmail.com','123','No','2023-06-22 23:38:41');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `idvehicles` int NOT NULL AUTO_INCREMENT,
  `VehicleNumber` varchar(45) NOT NULL,
  `VehicleType` varchar(45) DEFAULT NULL,
  `VehicleChassisNumber` varchar(45) NOT NULL,
  `VehiclePurchaseDate` date DEFAULT NULL,
  `VehicleAVG` varchar(45) DEFAULT NULL,
  `Remark` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idvehicles`),
  UNIQUE KEY `idvehicles_UNIQUE` (`idvehicles`),
  UNIQUE KEY `VehicleNumber_UNIQUE` (`VehicleNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'MH11AD5454','jcb','SADCASD45DSA54ADS','2023-04-15','5','NA'),(2,'MH12GG5465','JCB','SA12SAD54SDA12ASD45','2023-05-16','4','NA'),(3,'MH14CC4565','jcb','ADC65ADE854ACC','2023-06-14','5','na'),(4,'MH14HX1851','2 viller','askfvbakjbk,ajbck','2019-11-24','55','NA');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workdone`
--

DROP TABLE IF EXISTS `workdone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workdone` (
  `idworkdone` int NOT NULL AUTO_INCREMENT,
  `VehicleNumber` varchar(45) DEFAULT NULL,
  `DriverName` varchar(45) DEFAULT NULL,
  `SiteName` varchar(45) DEFAULT NULL,
  `WorkDate` varchar(45) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `WorkingStatus` varchar(45) DEFAULT NULL,
  `Remark` varchar(450) DEFAULT NULL,
  `DieselConsumption` int DEFAULT NULL,
  `RatePerHour` int DEFAULT NULL,
  `TotalPayableHours` int DEFAULT NULL,
  `AmountToPay` int DEFAULT NULL,
  PRIMARY KEY (`idworkdone`),
  UNIQUE KEY `idworkdone_UNIQUE` (`idworkdone`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workdone`
--

LOCK TABLES `workdone` WRITE;
/*!40000 ALTER TABLE `workdone` DISABLE KEYS */;
INSERT INTO `workdone` VALUES (3,'MH11AD5454','shree','phaltan','2023-06-11','09:00:00','17:00:00','Working','na',25,300,8,2400),(4,'MH12GG5465','raj ','phaltan','2023-06-09','09:00:00','17:00:00','Maintenance','damaged v',10,300,2,600),(5,'MH11AD5454','sonu','pancharatna','2023-04-10','09:00:00','17:00:00','Working','na',20,349,8,2792),(6,'MH11AD5454','raj ','pancharatna','2023-07-08','09:00:00','17:00:00','Working','na',5,200,8,1600),(7,'MH12GG5465','shree','pancharatna','2023-05-11','09:00:00','17:00:00','Working','na',5,300,8,2400),(8,'MH12GG5465','Shreeraj lawand','villa','2023-06-15','09:00:00','17:00:00','Working','na',5,300,8,2400),(9,'MH12GG5465','Shreeraj lawand','pancharatna','2023-04-15','09:00:00','17:00:00','Working','na',4,300,8,2400),(11,'MH11AD5454','Shreeraj lawand','pancharatna','2023-06-24','09:00:00','17:00:00','Working','na',100,400,8,3200),(12,'MH11AD5454','Shreeraj lawand','phaltan','2023-08-12','09:00:00','17:00:00','Working','na',19,300,8,2400),(13,'MH14CC4565','sonu','pancharatna','2023-08-02','09:00:00','17:00:00','Working','na',50,350,8,2800),(14,'MH12GG5465','Shreeraj lawand','phaltan','2023-07-21','09:00:00','17:00:00','Working','na',51,300,8,2400);
/*!40000 ALTER TABLE `workdone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 11:18:02
