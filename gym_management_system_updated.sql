-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: gym_management_system
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `Attendance_ID` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT (curdate()),
  `Status` enum('Present','Absent') DEFAULT 'Present',
  `Remarks` text,
  PRIMARY KEY (`Attendance_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'2024-10-13','Present','Morning session attended'),(2,'2024-10-13','Present','Evening session attended'),(3,'2024-10-12','Absent','Informed leave'),(4,'2024-10-13','Present','On time'),(5,'2024-10-13','Present','Regular workout'),(6,'2024-10-11','Present','Completed full workout'),(7,'2024-10-12','Present','Early morning session'),(8,'2025-10-13','Present','Payment received: Rs.1800.00'),(9,'2025-10-13','Present','Payment received: Rs.4500.00'),(10,'2025-10-13','Present','Payment received: Rs.7500.00'),(11,'2025-10-13','Present','Payment received: Rs.14000.00'),(12,'2025-10-13','Present','Payment received: Rs.1200.00'),(13,'2025-10-13','Present','Payment received: Rs.1600.00'),(14,'2025-10-13','Present','Payment received: Rs.3800.00'),(15,'2025-11-01','Present','Payment received: Rs.2500.00'),(16,'2025-11-01','Present','Payment received: Rs.3200.00'),(17,'2025-11-01','Present','Payment received: Rs.4800.00'),(18,'2025-11-01','Present','Payment received: Rs.1900.00'),(19,'2025-11-01','Present','Payment received: Rs.5500.00'),(20,'2025-11-01','Present','Payment received: Rs.2100.00'),(21,'2025-11-01','Present','Payment received: Rs.6200.00');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet_plan`
--

DROP TABLE IF EXISTS `diet_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_plan` (
  `Diet_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Calorie` int DEFAULT '2000',
  `Duration` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Detailed_Plan` text,
  PRIMARY KEY (`Diet_ID`),
  CONSTRAINT `chk_diet_calorie` CHECK ((`Calorie` between 1000 and 5000))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_plan`
--

LOCK TABLES `diet_plan` WRITE;
/*!40000 ALTER TABLE `diet_plan` DISABLE KEYS */;
INSERT INTO `diet_plan` VALUES (1,'Weight Loss Plan',1500,'12 weeks','2024-10-01','High protein, low carb diet with intermittent fasting. Meals: 6 small portions throughout the day.'),(2,'Muscle Gain Plan',2500,'16 weeks','2024-10-01','High protein, moderate carbs. Focus on lean meats, eggs, and protein shakes. 5-6 meals daily.'),(3,'Balanced Nutrition',2000,'8 weeks','2024-10-03','Balanced macros: 40% carbs, 30% protein, 30% fats. Whole foods, minimal processing.'),(4,'Keto Diet Plan',1800,'12 weeks','2024-10-05','Very low carb, high fat diet. Under 50g carbs daily. Focus on healthy fats and moderate protein.'),(5,'Vegan Athlete Plan',2200,'10 weeks','2024-10-05','Plant-based, high protein from legumes, tofu, tempeh. Rich in vegetables and whole grains.');
/*!40000 ALTER TABLE `diet_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `Equipment_ID` int NOT NULL AUTO_INCREMENT,
  `Equipment_Name` varchar(100) NOT NULL,
  `Equipment_Type` varchar(50) DEFAULT 'Cardio',
  `Condition_Status` enum('Good','Fair','Poor','Under Maintenance') DEFAULT 'Good',
  `Last_Service_Date` date DEFAULT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Next_Service_Date` date DEFAULT NULL,
  `Equipment_Manual` blob,
  PRIMARY KEY (`Equipment_ID`),
  CONSTRAINT `chk_equipment_dates` CHECK (((`Last_Service_Date` is null) or (`Next_Service_Date` is null) or (`Next_Service_Date` > `Last_Service_Date`)))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Treadmill Pro X1','Cardio','Good','2024-09-01','2024-01-15','2025-11-03',NULL),(2,'Bench Press Station','Strength','Good','2024-09-15','2024-02-20','2025-11-05',NULL),(3,'Rowing Machine','Cardio','Fair','2024-08-20','2023-12-10','2025-11-07',NULL),(4,'Leg Press Machine','Strength','Good','2024-09-10','2024-03-05','2025-11-02',NULL),(5,'Cable Crossover','Strength','Under Maintenance','2024-10-01','2024-01-25','2025-11-08',NULL),(6,'Elliptical Trainer','Cardio','Fair','2025-10-25','2024-05-10','2025-11-02',NULL),(7,'Smith Machine','Strength','Good','2025-10-28','2024-06-15','2025-11-04',NULL),(8,'Spin Bike Pro','Cardio','Good','2025-10-30','2024-07-20','2025-11-06',NULL);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` text,
  `Join_Date` date NOT NULL,
  `Age` int DEFAULT '18',
  `Gender` enum('Male','Female','Other') NOT NULL,
  `DOB` date DEFAULT NULL,
  `Trainer_ID` int DEFAULT NULL,
  `Sub_ID` int DEFAULT NULL,
  `Member_Photo` blob,
  `Medical_History` text,
  PRIMARY KEY (`Member_ID`),
  KEY `FK_Member_Trainer` (`Trainer_ID`),
  KEY `FK_Member_Subscription` (`Sub_ID`),
  CONSTRAINT `FK_Member_Subscription` FOREIGN KEY (`Sub_ID`) REFERENCES `subscription` (`Sub_ID`) ON DELETE SET NULL,
  CONSTRAINT `FK_Member_Trainer` FOREIGN KEY (`Trainer_ID`) REFERENCES `trainer` (`Trainer_ID`) ON DELETE SET NULL,
  CONSTRAINT `chk_contact` CHECK (regexp_like(`Phone`,_utf8mb4'^[0-9]{10}$')),
  CONSTRAINT `chk_member_age` CHECK (((`Age` >= 16) and (`Age` <= 100)))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Amit','Verma ✓','9876543210','amit.verma@gmail.com','123 MG Road, Chennai','2024-10-01',28,'Male','1996-11-15',1,1,NULL,'No major medical issues'),(2,'Kavya','Nair ✓','9876543211','kavya.nair@gmail.com','45 Anna Nagar, Chennai','2024-10-01',25,'Female','1999-11-20',2,2,NULL,'Mild asthma, carries inhaler'),(3,'Rohan','Gupta ✓','9876543212','rohan.gupta@gmail.com','78 T Nagar, Chennai','2024-10-03',32,'Male','1992-11-25',3,3,NULL,'Previous knee injury, fully recovered'),(4,'Divya','Iyer ✓','9876543213','divya.iyer@gmail.com','90 Adyar, Chennai','2024-10-05',27,'Female','1997-12-05',4,4,NULL,'Healthy, no restrictions'),(5,'Karan','Malhotra ✓','9876543214','karan.malhotra@gmail.com','56 Velachery, Chennai','2024-10-05',30,'Male','1994-11-10',5,5,NULL,'Diabetic, monitors blood sugar'),(6,'Ananya','Reddy ✓','9876543220','ananya.reddy@gmail.com','101 Besant Nagar, Chennai','2025-10-15',26,'Female','1998-11-08',1,6,NULL,NULL),(7,'Vikram','Joshi ✓','9876543221','vikram.joshi@gmail.com','202 Mylapore, Chennai','2025-10-20',29,'Male','1995-11-12',2,7,NULL,NULL),(8,'Pooja','Menon','9876543222','pooja.menon@gmail.com','303 Nungambakkam, Chennai','2025-10-25',24,'Female','2000-11-28',3,3,NULL,NULL),(9,'Aditya','Kapoor','9876543223','aditya.kapoor@gmail.com','404 Egmore, Chennai','2025-11-01',31,'Male','1993-11-18',4,1,NULL,NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `Member_ID` int NOT NULL,
  `Diet_ID` int NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Member_ID`,`Diet_ID`),
  KEY `FK_Membership_Diet` (`Diet_ID`),
  CONSTRAINT `FK_Membership_Diet` FOREIGN KEY (`Diet_ID`) REFERENCES `diet_plan` (`Diet_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Membership_Member` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (1,1,'2024-10-01','2024-12-24'),(2,3,'2024-10-01','2024-11-26'),(3,2,'2024-10-03','2025-01-26'),(4,4,'2024-10-05','2024-12-28'),(5,5,'2024-10-05','2024-12-14');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_ID` int NOT NULL AUTO_INCREMENT,
  `Status` enum('Paid','Pending','Overdue') DEFAULT 'Pending',
  `Amount` decimal(10,2) NOT NULL,
  `Mode` enum('Cash','Card','UPI','Bank Transfer') NOT NULL,
  `Member_ID` int DEFAULT NULL,
  `Transaction_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `FK_Payment_Member` (`Member_ID`),
  CONSTRAINT `FK_Payment_Member` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE,
  CONSTRAINT `chk_payment_amount` CHECK ((`Amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Paid',1500.00,'UPI',1,'TXN1001234567'),(2,'Paid',4000.00,'Card',2,'TXN1001234568'),(3,'Paid',7500.00,'Bank Transfer',3,'TXN1001234569'),(4,'Pending',14000.00,'Cash',4,NULL),(5,'Paid',1500.00,'Card',5,'TXN1001234570'),(6,'Paid',1800.00,'UPI',1,'TXN1001234567'),(7,'Paid',4500.00,'Card',2,'TXN1001234568'),(8,'Paid',7500.00,'Bank Transfer',3,'TXN1001234569'),(9,'Paid',14000.00,'Cash',4,'TXN1001234570'),(10,'Paid',1200.00,'Card',5,'TXN1001234571'),(11,'Paid',1600.00,'UPI',1,'TXN1001234572'),(12,'Paid',3800.00,'Card',2,'TXN1001234573'),(13,'Paid',2500.00,'Cash',1,'TXN1001234574'),(14,'Paid',3200.00,'UPI',2,'TXN1001234575'),(15,'Paid',4800.00,'Bank Transfer',3,'TXN1001234576'),(16,'Paid',1900.00,'Card',4,'TXN1001234577'),(17,'Paid',5500.00,'UPI',5,'TXN1001234578'),(18,'Paid',2100.00,'Cash',6,'TXN1001234579'),(19,'Paid',6200.00,'Bank Transfer',7,'TXN1001234580');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_payment_insert` AFTER INSERT ON `payment` FOR EACH ROW BEGIN
    -- Update subscription status based on payment
    IF NEW.Status = 'Paid' THEN
        UPDATE Member 
        SET Last_Name = CONCAT(Last_Name, ' ✓')
        WHERE Member_ID = NEW.Member_ID 
        AND Last_Name NOT LIKE '%✓';
    END IF;
    
    -- Log the payment
    INSERT INTO Attendance (Date, Status, Remarks)
    VALUES (CURDATE(), 'Present', CONCAT('Payment received: Rs.', NEW.Amount));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `Session_ID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Session_Type` varchar(50) DEFAULT 'General Training',
  `Start_Time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  `Room_No` varchar(10) DEFAULT NULL,
  `Trainer_ID` int DEFAULT NULL,
  PRIMARY KEY (`Session_ID`),
  KEY `FK_Session_Trainer` (`Trainer_ID`),
  CONSTRAINT `FK_Session_Trainer` FOREIGN KEY (`Trainer_ID`) REFERENCES `trainer` (`Trainer_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'2024-10-13','Strength Training','06:00:00','07:00:00','A101',1),(2,'2024-10-13','Yoga','07:00:00','08:00:00','A102',2),(3,'2024-10-13','Cardio','08:00:00','09:00:00','B201',3),(4,'2024-10-13','CrossFit','09:00:00','10:00:00','B202',4),(5,'2024-10-13','Bodybuilding','10:00:00','11:00:00','A103',5),(6,'2024-10-14','HIIT','06:00:00','07:00:00','A101',1),(7,'2024-10-14','Pilates','17:00:00','18:00:00','A102',2),(8,'2025-12-10','Personal Training','09:00:00','10:00:00','Room-101',1),(9,'2025-12-10','Group Class','11:00:00','12:00:00','Room-102',1),(10,'2025-12-10','Weight Loss','14:00:00','15:00:00','Room-103',1),(11,'2025-12-10','Yoga Flow','07:00:00','08:00:00','Room-201',2),(12,'2025-12-10','Power Yoga','15:00:00','16:00:00','Room-202',2),(13,'2025-12-10','Meditation','18:00:00','19:00:00','Room-203',2),(14,'2025-12-10','Cardio Blast','08:00:00','09:00:00','Room-301',3),(15,'2025-12-10','Fat Burning','14:00:00','15:00:00','Room-302',3),(16,'2025-12-10','Running Club','17:00:00','18:00:00','Room-303',3),(17,'2025-12-11','Morning Bootcamp','05:00:00','06:00:00','Room-104',1),(18,'2025-12-11','Advanced Strength','16:00:00','17:00:00','Room-105',1),(19,'2025-12-11','Personal Training','19:00:00','20:00:00','Room-106',1);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_trainer_overbooking` BEFORE INSERT ON `session` FOR EACH ROW BEGIN
    DECLARE session_count INT;
    
    -- Check if trainer already has 3 or more sessions on the same date
    SELECT COUNT(*) INTO session_count
    FROM Session
    WHERE Trainer_ID = NEW.Trainer_ID
    AND Date = NEW.Date;
    
    IF session_count >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Trainer already has maximum sessions (3) scheduled for this date';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `session_equipment`
--

DROP TABLE IF EXISTS `session_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_equipment` (
  `Session_ID` int NOT NULL,
  `Equipment_ID` int NOT NULL,
  PRIMARY KEY (`Session_ID`,`Equipment_ID`),
  KEY `FK_SessionEquip_Equipment` (`Equipment_ID`),
  CONSTRAINT `FK_SessionEquip_Equipment` FOREIGN KEY (`Equipment_ID`) REFERENCES `equipment` (`Equipment_ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SessionEquip_Session` FOREIGN KEY (`Session_ID`) REFERENCES `session` (`Session_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_equipment`
--

LOCK TABLES `session_equipment` WRITE;
/*!40000 ALTER TABLE `session_equipment` DISABLE KEYS */;
INSERT INTO `session_equipment` VALUES (1,1),(5,1),(1,2),(2,3),(3,4),(4,5);
/*!40000 ALTER TABLE `session_equipment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_equipment_maintenance` BEFORE INSERT ON `session_equipment` FOR EACH ROW BEGIN
    DECLARE equip_condition VARCHAR(30);
    
    -- Check equipment condition
    SELECT Condition_Status INTO equip_condition 
    FROM Equipment 
    WHERE Equip_ID = NEW.Equip_ID;
    
    -- Prevent using equipment that needs maintenance
    IF equip_condition IN ('Poor', 'Under Maintenance') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot use this equipment: Currently under maintenance or in poor condition';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Staff_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Address` text,
  `Contact_No` varchar(15) NOT NULL,
  `Role` enum('Manager','Receptionist','Cleaner','Maintenance','Admin') DEFAULT 'Receptionist',
  `Staff_Photo` blob,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Suresh Kumar','12 Park Street, Chennai','9988776655','Manager',NULL),(2,'Meena Lakshmi','34 Beach Road, Chennai','9988776656','Receptionist',NULL),(3,'Ganesh Babu','67 Gandhi Street, Chennai','9988776657','Cleaner',NULL),(4,'Ramesh Rao','89 Nehru Nagar, Chennai','9988776658','Maintenance',NULL),(5,'Lakshmi Devi','23 Patel Road, Chennai','9988776659','Receptionist',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `Sub_ID` int NOT NULL AUTO_INCREMENT,
  `Sub_Type` enum('Monthly','Quarterly','Half-Yearly','Yearly') NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Price` decimal(10,2) DEFAULT '1500.00',
  PRIMARY KEY (`Sub_ID`),
  CONSTRAINT `chk_subscription_dates` CHECK ((`End_Date` > `Start_Date`)),
  CONSTRAINT `chk_subscription_price` CHECK ((`Price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,'Monthly','2024-10-01','2025-10-25',1500.00),(2,'Quarterly','2024-10-01','2024-12-31',4000.00),(3,'Half-Yearly','2024-10-01','2025-03-31',7500.00),(4,'Yearly','2024-10-01','2025-09-30',14000.00),(5,'Monthly','2024-10-05','2025-10-28',1500.00),(6,'Monthly','2025-09-01','2025-09-30',1500.00),(7,'Quarterly','2025-07-01','2025-09-30',4000.00);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `Trainer_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT '30000.00',
  `Years_of_Experience` int DEFAULT '0',
  `Trainer_Link` varchar(100) DEFAULT NULL,
  `Trainer_Photo` blob,
  `Certificates` text,
  PRIMARY KEY (`Trainer_ID`),
  CONSTRAINT `chk_trainer_experience` CHECK ((`Years_of_Experience` >= 0)),
  CONSTRAINT `chk_trainer_salary` CHECK ((`Salary` >= 20000))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (1,'Rajesh','Kumar','Strength Training',45000.00,5,'rajesh.trainer@gym.com',NULL,'Certified Personal Trainer (CPT), Strength & Conditioning Specialist'),(2,'Priya','Sharma','Yoga & Flexibility',40000.00,4,'priya.trainer@gym.com',NULL,'RYT 500 Yoga Alliance, Pilates Instructor'),(3,'Arjun','Singh','Cardio & Weight Loss',42000.00,3,'arjun.trainer@gym.com',NULL,'Certified Fitness Trainer, Nutrition Coach'),(4,'Sneha','Patel','CrossFit & HIIT',48000.00,6,'sneha.trainer@gym.com',NULL,'CrossFit Level 2, HIIT Specialist'),(5,'Vikram','Reddy','Bodybuilding',50000.00,7,'vikram.trainer@gym.com',NULL,'IFBB Pro Card, Sports Nutritionist');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-01 16:37:19
