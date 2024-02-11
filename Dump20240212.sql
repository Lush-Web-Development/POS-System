-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: pos
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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (5,'Bakery'),(7,'Beverages'),(3,'Dairy'),(6,'Frozen Foods'),(1,'Groceries'),(8,'Household'),(4,'Meat'),(9,'Personal Care'),(2,'Produce'),(10,'Snacks');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` text NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Doe','john.doe@example.com','1234567890','123 Main St, Cityville'),(2,'Jane','Smith','jane.smith@example.com','9876543210','456 Oak St, Townsville'),(3,'Bob','Johnson','bob.johnson@example.com','5551112233','789 Pine St, Villagetown'),(4,'Alice','Williams','alice.williams@example.com','9998887777','101 Maple Ave, Suburbia'),(5,'Charlie','Brown','charlie.brown@example.com','1112223333','202 Cedar Rd, Hamletville'),(6,'Eva','Martinez','eva.martinez@example.com','7776665555','303 Oakwood Ln, Countryside'),(7,'Daniel','Lee','daniel.lee@example.com','3334445555','404 Birch St, Uptown'),(8,'Olivia','Anderson','olivia.anderson@example.com','8889990000','505 Elm Blvd, Downtown'),(9,'Samuel','Nguyen','samuel.nguyen@example.com','6665554444','606 Pine Ridge, Midtown'),(10,'Sophia','Garcia','sophia.garcia@example.com','2223334444','707 Maple Dr, Riverside');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerfeedback`
--

DROP TABLE IF EXISTS `customerfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerfeedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `Date` datetime NOT NULL,
  `Rating` int NOT NULL,
  `Comments` text,
  PRIMARY KEY (`FeedbackID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `customerfeedback_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerfeedback`
--

LOCK TABLES `customerfeedback` WRITE;
/*!40000 ALTER TABLE `customerfeedback` DISABLE KEYS */;
INSERT INTO `customerfeedback` VALUES (1,1,'2023-01-01 10:30:00',4,'Good service overall'),(2,2,'2023-01-02 12:45:00',5,'Excellent product selection'),(3,3,'2023-01-03 14:20:00',3,'Could improve cleanliness'),(4,4,'2023-01-04 16:10:00',5,'Friendly staff'),(5,5,'2023-01-05 09:55:00',4,'Quick checkout process'),(6,6,'2023-01-06 11:30:00',2,'Out of stock for some items'),(7,7,'2023-01-07 13:15:00',5,'Great discounts'),(8,8,'2023-01-08 15:40:00',4,'Nice atmosphere'),(9,9,'2023-01-09 17:25:00',3,'Long waiting lines'),(10,10,'2023-01-10 19:00:00',4,'Helpful customer service');
/*!40000 ALTER TABLE `customerfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `DiscountID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Type` enum('percentage','fixed_amount') NOT NULL,
  `Value` decimal(5,2) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`DiscountID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'Summer Sale','percentage',15.00,'2023-06-01','2023-08-31'),(2,'Weekend Special','fixed_amount',5.00,'2023-03-10','2023-03-12'),(3,'Back-to-School Discount','percentage',10.00,'2023-08-15','2023-09-15'),(4,'Holiday Bonanza','fixed_amount',7.50,'2023-12-01','2023-12-31'),(5,'Customer Appreciation Day','percentage',20.00,'2023-05-05','2023-05-05'),(6,'Spring Clearance','fixed_amount',10.00,'2023-04-01','2023-04-15'),(7,'Black Friday Deals','percentage',25.00,'2023-11-24','2023-11-24'),(8,'Cyber Monday Special','fixed_amount',8.00,'2023-11-27','2023-11-27'),(9,'New Years Discount','percentage',12.00,'2024-01-01','2024-01-01'),(10,'Midnight Madness Sale','fixed_amount',15.00,'2023-07-15','2023-07-16');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeattendance`
--

DROP TABLE IF EXISTS `employeeattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeattendance` (
  `AttendanceID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `CheckInDateTime` datetime NOT NULL,
  `CheckOutDateTime` datetime NOT NULL,
  PRIMARY KEY (`AttendanceID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `employeeattendance_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeattendance`
--

LOCK TABLES `employeeattendance` WRITE;
/*!40000 ALTER TABLE `employeeattendance` DISABLE KEYS */;
INSERT INTO `employeeattendance` VALUES (21,1,'2023-01-01 08:00:00','2023-01-01 17:00:00'),(22,2,'2023-01-02 08:15:00','2023-01-02 16:45:00'),(23,3,'2023-01-03 09:00:00','2023-01-03 18:30:00'),(24,4,'2023-01-04 07:45:00','2023-01-04 16:15:00'),(25,5,'2023-01-05 08:30:00','2023-01-05 17:30:00'),(26,6,'2023-01-06 08:15:00','2023-01-06 16:45:00'),(27,7,'2023-01-07 09:30:00','2023-01-07 18:00:00'),(28,8,'2023-01-08 07:45:00','2023-01-08 16:15:00'),(29,9,'2023-01-09 08:30:00','2023-01-09 17:30:00'),(30,10,'2023-01-10 08:15:00','2023-01-10 16:45:00');
/*!40000 ALTER TABLE `employeeattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventoryadjustment`
--

DROP TABLE IF EXISTS `inventoryadjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventoryadjustment` (
  `AdjustmentID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `AdjustmentDate` datetime NOT NULL,
  `QuantityAdjusted` int NOT NULL,
  `Reason` varchar(255) NOT NULL,
  PRIMARY KEY (`AdjustmentID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `inventoryadjustment_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventoryadjustment`
--

LOCK TABLES `inventoryadjustment` WRITE;
/*!40000 ALTER TABLE `inventoryadjustment` DISABLE KEYS */;
INSERT INTO `inventoryadjustment` VALUES (1,1,'2023-01-01 10:30:00',-10,'Expired milk'),(2,2,'2023-01-02 12:45:00',-20,'Stale bread'),(3,3,'2023-01-03 14:20:00',15,'New stock of eggs'),(4,4,'2023-01-04 16:10:00',-5,'Damaged chicken'),(5,5,'2023-01-05 09:55:00',30,'Fresh bananas delivery'),(6,6,'2023-01-06 11:30:00',-10,'Melting ice cream'),(7,7,'2023-01-07 13:15:00',-8,'Expired orange juice'),(8,8,'2023-01-08 15:40:00',5,'Restocked laundry detergent'),(9,9,'2023-01-09 17:25:00',-12,'Reduced shampoo stock'),(10,10,'2023-01-10 19:00:00',10,'New batch of potato chips');
/*!40000 ALTER TABLE `inventoryadjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `CategoryID` int NOT NULL,
  `CostPrice` decimal(10,2) NOT NULL,
  `SellingPrice` decimal(10,2) NOT NULL,
  `QuantityInStock` int NOT NULL,
  `ReorderLevel` int NOT NULL,
  `Barcode` varchar(20) NOT NULL,
  `LastRestockDate` date DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Milk','Fresh whole milk',2,1.60,2.10,90,20,'123456789012','2024-02-07'),(2,'Bread','Whole wheat bread',5,1.00,1.50,150,30,'234567890123','2023-01-02'),(3,'Eggs','Large brown eggs',2,0.75,1.25,200,40,'345678901234','2023-01-03'),(4,'Chicken','Boneless chicken breast',4,3.50,5.00,50,10,'456789012345','2023-01-04'),(5,'Bananas','Fresh bananas',1,0.30,0.50,120,25,'567890123456','2023-01-05'),(6,'Ice Cream','Vanilla ice cream',6,2.00,3.00,75,15,'678901234567','2023-01-06'),(7,'Orange Juice','100% orange juice',7,2.50,3.50,80,18,'789012345678','2023-01-07'),(8,'Laundry Detergent','Liquid laundry detergent',8,5.00,7.00,30,5,'890123456789','2023-01-08'),(9,'Shampoo','Moisturizing shampoo',9,3.00,4.50,60,12,'901234567890','2023-01-09'),(10,'Potato Chips','Classic potato chips',10,1.25,2.00,100,20,'012345678901','2023-01-10'),(11,'Tomatoes','Fresh red tomatoes',1,0.50,0.75,90,15,'123450987601','2023-01-11'),(12,'Cheese','Cheddar cheese block',5,2.50,3.50,80,10,'234509876012','2023-01-12'),(13,'Pasta','Whole grain spaghetti',3,1.00,1.75,120,25,'345098760123','2023-01-13'),(14,'Apples','Crisp red apples',1,0.75,1.25,100,20,'450987601234','2023-01-14'),(15,'Yogurt','Greek yogurt',2,1.25,2.00,80,15,'509876012345','2023-01-15'),(16,'Toothpaste','Fluoride toothpaste',9,2.00,3.00,40,8,'98760123450','2023-01-16'),(17,'Salmon','Fresh salmon fillet',4,6.00,9.00,30,5,'987601234509','2023-01-17'),(18,'Cereal','Whole grain cereal',3,2.50,4.00,60,12,'876012345098','2023-01-18'),(19,'Toilet Paper','Soft toilet paper',8,3.50,5.50,50,10,'760123450987','2023-01-19'),(20,'Orange','Juicy oranges',1,0.60,1.00,70,14,'601234509876','2023-01-20'),(21,'Coffee','Arabica ground coffee',6,4.00,6.50,40,8,'12345678901','2023-01-21'),(22,'Avocado','Ripe avocados',1,1.20,2.00,60,12,'123456789012','2023-01-22'),(23,'Honey','Pure honey',7,3.50,5.00,50,10,'234567890123','2023-01-23'),(24,'Broccoli','Fresh broccoli',1,1.80,2.50,30,6,'345678901234','2023-01-24'),(25,'Chips Ahoy Cookies','Chocolate chip cookies',10,2.00,3.50,80,15,'456789012345','2023-01-25'),(26,'Lettuce','Crisp iceberg lettuce',1,0.90,1.50,40,8,'567890123456','2023-01-26'),(27,'Yogurt Smoothie','Mixed berry yogurt smoothie',2,2.50,4.00,60,12,'678901234567','2023-01-27'),(28,'Cucumber','Fresh cucumber',1,0.60,1.00,70,14,'789012345678','2023-01-28'),(29,'Almond Milk','Unsweetened almond milk',2,2.00,3.00,50,10,'890123456789','2023-01-29'),(30,'Salsa','Medium salsa',3,1.50,2.50,40,8,'901234567890','2023-01-30'),(31,'Pineapple','Fresh pineapple',1,1.75,2.75,45,9,'12345678901','2023-01-31'),(32,'Granola Bars','Mixed nut granola bars',3,2.20,3.75,60,12,'123456789012','2023-02-01'),(33,'Facial Tissues','Soft facial tissues',8,1.80,2.50,70,14,'234567890123','2023-02-02'),(34,'Salad Dressing','Balsamic vinaigrette',3,2.50,4.00,50,10,'345678901234','2023-02-03'),(35,'Ground Turkey','Lean ground turkey',4,3.00,5.00,40,8,'456789012345','2023-02-04'),(36,'Blueberries','Fresh blueberries',1,2.50,4.00,30,6,'567890123456','2023-02-05'),(37,'White Rice','Long-grain white rice',3,1.00,1.75,80,15,'678901234567','2023-02-06'),(38,'Paper Towels','Absorbent paper towels',8,2.20,3.50,60,12,'789012345678','2023-02-07'),(39,'Cantaloupe','Ripe cantaloupe',1,1.80,2.75,40,8,'890123456789','2023-02-08'),(40,'Soy Sauce','Low-sodium soy sauce',7,1.50,2.50,50,10,'901234567890','2023-02-09');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorder` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `SupplierID` int NOT NULL,
  `Date` datetime NOT NULL,
  `ExpectedDeliveryDate` datetime NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (1,1,'2023-01-01 10:30:00','2023-01-10 10:00:00',1500.00,'Pending'),(2,2,'2023-01-02 12:45:00','2023-01-11 11:30:00',1200.00,'Shipped'),(3,3,'2023-01-03 14:20:00','2023-01-12 12:15:00',800.00,'Received'),(4,4,'2023-01-04 16:10:00','2023-01-13 14:00:00',2000.00,'Pending'),(5,5,'2023-01-05 09:55:00','2023-01-14 15:45:00',950.00,'Shipped'),(6,6,'2023-01-06 11:30:00','2023-01-15 17:30:00',600.00,'Received'),(7,7,'2023-01-07 13:15:00','2023-01-16 19:15:00',1800.00,'Pending'),(8,8,'2023-01-08 15:40:00','2023-01-17 21:00:00',300.00,'Shipped'),(9,9,'2023-01-09 17:25:00','2023-01-18 22:45:00',1200.00,'Received'),(10,10,'2023-01-10 19:00:00','2023-01-19 23:30:00',700.00,'Pending');
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorderitem`
--

DROP TABLE IF EXISTS `purchaseorderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorderitem` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `purchaseorderitem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `purchaseorder` (`OrderID`),
  CONSTRAINT `purchaseorderitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorderitem`
--

LOCK TABLES `purchaseorderitem` WRITE;
/*!40000 ALTER TABLE `purchaseorderitem` DISABLE KEYS */;
INSERT INTO `purchaseorderitem` VALUES (1,1,1,50,2.00,100.00),(2,1,2,30,1.50,45.00),(3,2,3,20,3.00,60.00),(4,3,4,10,5.00,50.00),(5,4,5,40,0.75,30.00),(6,5,6,15,2.50,37.50),(7,6,7,25,1.00,25.00),(8,7,8,5,7.00,35.00),(9,8,9,18,4.50,81.00),(10,9,10,12,2.00,24.00);
/*!40000 ALTER TABLE `purchaseorderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `ReturnID` int NOT NULL AUTO_INCREMENT,
  `SaleID` int NOT NULL,
  `Date` datetime NOT NULL,
  `TotalRefund` decimal(10,2) NOT NULL,
  `RestockingFee` decimal(10,2) DEFAULT NULL,
  `ReturnReason` varchar(255) NOT NULL,
  PRIMARY KEY (`ReturnID`),
  KEY `SaleID` (`SaleID`),
  CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,1,'2023-01-01 10:30:00',25.00,2.50,'Defective product'),(2,2,'2023-01-02 12:45:00',15.00,1.50,'Changed mind'),(3,3,'2023-01-03 14:20:00',40.00,NULL,'Unsatisfactory quality'),(4,4,'2023-01-04 16:10:00',10.00,1.00,'Wrong size'),(5,5,'2023-01-05 09:55:00',30.00,3.00,'Duplicate purchase'),(6,6,'2023-01-06 11:30:00',5.00,NULL,'Not as described'),(7,7,'2023-01-07 13:15:00',18.00,1.80,'Item damaged during shipping'),(8,8,'2023-01-08 15:40:00',8.00,NULL,'Received wrong item'),(9,9,'2023-01-09 17:25:00',12.00,1.20,'Allergic reaction'),(10,10,'2023-01-10 19:00:00',20.00,2.00,'Changed color preference');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `SaleID` int NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `CustomerID` int NOT NULL,
  `PaymentMethod` varchar(50) NOT NULL,
  `DiscountApplied` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'2023-01-15 00:00:00',150.00,1,'Credit Card',10.00),(2,'2023-01-16 00:00:00',75.50,2,'Cash',5.00),(3,'2023-01-17 00:00:00',200.00,3,'Debit Card',15.00),(4,'2023-01-18 00:00:00',50.25,4,'Cash',2.50),(5,'2023-01-19 00:00:00',120.75,5,'Credit Card',8.25),(6,'2023-01-20 00:00:00',90.00,6,'Debit Card',5.00),(7,'2023-01-21 00:00:00',180.50,7,'Cash',10.50),(8,'2023-01-22 00:00:00',95.25,8,'Credit Card',7.75),(9,'2023-01-23 00:00:00',60.30,9,'Debit Card',4.30),(10,'2023-01-24 00:00:00',110.80,10,'Cash',6.20);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saleitem`
--

DROP TABLE IF EXISTS `saleitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleitem` (
  `SaleItemID` int NOT NULL AUTO_INCREMENT,
  `SaleID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`SaleItemID`),
  KEY `SaleID` (`SaleID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `saleitem_ibfk_1` FOREIGN KEY (`SaleID`) REFERENCES `sale` (`SaleID`),
  CONSTRAINT `saleitem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saleitem`
--

LOCK TABLES `saleitem` WRITE;
/*!40000 ALTER TABLE `saleitem` DISABLE KEYS */;
INSERT INTO `saleitem` VALUES (2,1,1,3,2.50,7.50),(3,1,2,2,1.75,3.50),(4,2,3,5,4.00,20.00),(5,3,4,1,8.50,8.50),(6,4,5,4,1.20,4.80),(7,5,6,2,3.25,6.50),(8,6,7,3,2.00,6.00),(9,7,8,1,6.75,6.75),(10,8,9,6,5.50,33.00),(11,9,10,2,1.80,3.60);
/*!40000 ALTER TABLE `saleitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeinformation`
--

DROP TABLE IF EXISTS `storeinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storeinformation` (
  `StoreID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `ContactNumber` varchar(20) NOT NULL,
  `BusinessHours` varchar(255) NOT NULL,
  `TaxRate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`StoreID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeinformation`
--

LOCK TABLES `storeinformation` WRITE;
/*!40000 ALTER TABLE `storeinformation` DISABLE KEYS */;
INSERT INTO `storeinformation` VALUES (1,'SuperMart','123 Main St, Cityville, USA','555-123-4567','Mon-Sat: 8:00 AM - 10:00 PM, Sun: 9:00 AM - 8:00 PM',7.50),(2,'FreshFoods','456 Fresh St, Townsville, USA','555-987-6543','Mon-Fri: 7:00 AM - 9:00 PM, Sat-Sun: 8:00 AM - 8:00 PM',8.00),(3,'MeatPalace','789 Butcher Ave, Meatropolis, USA','555-567-8901','Mon-Sun: 9:00 AM - 7:00 PM',6.50),(4,'DairyDelight','101 Dairy Lane, Milkburg, USA','555-234-5678','Mon-Sat: 10:00 AM - 8:00 PM, Sun: 11:00 AM - 6:00 PM',7.00),(5,'FrozenFoods','321 Ice St, Frozenville, USA','555-876-5432','Mon-Fri: 8:00 AM - 7:00 PM, Sat-Sun: 9:00 AM - 6:00 PM',6.00),(6,'BeverageBarn','567 Sip St, Drinksville, USA','555-345-6789','Mon-Sun: 10:00 AM - 9:00 PM',7.50),(7,'HouseholdHaven','789 Home St, Cleanville, USA','555-654-3210','Mon-Sat: 9:00 AM - 8:00 PM, Sun: 10:00 AM - 7:00 PM',8.50),(8,'PersonalCareParadise','987 Pamper St, Groomington, USA','555-432-1098','Mon-Fri: 10:00 AM - 7:00 PM, Sat-Sun: 11:00 AM - 6:00 PM',6.50),(9,'SnackShack','654 Crunch St, Snackville, USA','555-789-0123','Mon-Sun: 8:00 AM - 10:00 PM',7.00),(10,'GeneralGoods','210 Supply St, Goodsburg, USA','555-210-9876','Mon-Sat: 9:00 AM - 9:00 PM, Sun: 10:00 AM - 8:00 PM',8.00);
/*!40000 ALTER TABLE `storeinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `ContactPerson` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Address` text NOT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Fresh Produce Distributors','John Smith','freshproduce@email.com','555-123-4567','123 Main St, Cityville, USA'),(2,'Bakery Delights Co.','Emma Baker','bakerydelights@email.com','555-987-6543','456 Baker St, Townsville, USA'),(3,'Meat Masters Inc.','Bob Butcher','meatmasters@email.com','555-567-8901','789 Butcher Ave, Meatropolis, USA'),(4,'Dairy Farms Ltd.','Alice Dairy','dairyfarms@email.com','555-234-5678','101 Dairy Lane, Milkburg, USA'),(5,'Frozen Foods International','Frank Frost','frozenfoods@email.com','555-876-5432','321 Ice St, Frozenville, USA'),(6,'Beverage Distributors Co.','Chris Cheers','beveragedistributors@email.com','555-345-6789','567 Sip St, Drinksville, USA'),(7,'Household Essentials Supply','Helen Home','householdessentials@email.com','555-654-3210','789 Home St, Cleanville, USA'),(8,'Personal Care Products Ltd.','Peter Pamper','personalcare@email.com','555-432-1098','987 Pamper St, Groomington, USA'),(9,'Snacktime Snacks Inc.','Sally Snacker','snacktimesnacks@email.com','555-789-0123','654 Crunch St, Snackville, USA'),(10,'General Supply Co.','George Supplier','generalsupply@email.com','555-210-9876','210 Supply St, Goodsburg, USA');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionlog`
--

DROP TABLE IF EXISTS `transactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionlog` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `Date` datetime NOT NULL,
  `Action` varchar(50) NOT NULL,
  `Details` text,
  PRIMARY KEY (`TransactionID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `transactionlog_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionlog`
--

LOCK TABLES `transactionlog` WRITE;
/*!40000 ALTER TABLE `transactionlog` DISABLE KEYS */;
INSERT INTO `transactionlog` VALUES (2,1,'2023-01-01 10:30:00','Login','User logged in successfully'),(3,2,'2023-01-02 12:45:00','Purchase','Customer bought groceries worth $50.00'),(4,3,'2023-01-03 14:20:00','Logout','User logged out'),(5,4,'2023-01-04 16:10:00','Inventory Adjustment','Reduced quantity of damaged goods'),(6,5,'2023-01-05 09:55:00','Return','Refund processed for defective product'),(7,6,'2023-01-06 11:30:00','Sale','Customer purchased electronics worth $300.00'),(8,7,'2023-01-07 13:15:00','Inventory Adjustment','Added new stock of fresh produce'),(9,8,'2023-01-08 15:40:00','Purchase Order','New purchase order created for supplies'),(10,9,'2023-01-09 17:25:00','Employee Check-In','Employee started the shift'),(11,10,'2023-01-10 19:00:00','Employee Check-Out','Employee ended the shift');
/*!40000 ALTER TABLE `transactionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `LastLoginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john_doe','hashed_password_1','Cashier','john.doe@email.com','123-456-7890','2023-01-01 08:30:00'),(2,'jane_smith','hashed_password_2','Manager','jane.smith@email.com','987-654-3210','2023-01-02 09:15:00'),(3,'bob_jones','hashed_password_3','StockClerk','bob.jones@email.com','555-123-4567','2023-01-03 10:00:00'),(4,'alice_green','hashed_password_4','Cashier','alice.green@email.com','111-222-3333','2023-01-04 11:45:00'),(5,'sam_wilson','hashed_password_5','Manager','sam.wilson@email.com','999-888-7777','2023-01-05 12:30:00'),(6,'emily_davis','hashed_password_6','StockClerk','emily.davis@email.com','444-555-6666','2023-01-06 13:15:00'),(7,'mike_jackson','hashed_password_7','Cashier','mike.jackson@email.com','777-666-5555','2023-01-07 14:00:00'),(8,'susan_white','hashed_password_8','Manager','susan.white@email.com','222-333-4444','2023-01-08 15:45:00'),(9,'peter_adams','hashed_password_9','StockClerk','peter.adams@email.com','888-999-0000','2023-01-09 16:30:00'),(10,'linda_brown','hashed_password_10','Cashier','linda.brown@email.com','333-444-5555','2023-01-10 17:15:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-12  3:30:08
