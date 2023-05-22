-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: l2_201945d_khilfi_project
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Temporary view structure for view `availableservices`
--

DROP TABLE IF EXISTS `availableservices`;
/*!50001 DROP VIEW IF EXISTS `availableservices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `availableservices` AS SELECT 
 1 AS `ticketId`,
 1 AS `operatorName`,
 1 AS `destination`,
 1 AS `departingDate`,
 1 AS `departingTime`,
 1 AS `seating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `showusersbookingticket`
--

DROP TABLE IF EXISTS `showusersbookingticket`;
/*!50001 DROP VIEW IF EXISTS `showusersbookingticket`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showusersbookingticket` AS SELECT 
 1 AS `ticketId`,
 1 AS `seating`,
 1 AS `fullName`,
 1 AS `operatorName`,
 1 AS `destination`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `availableservices`
--

/*!50001 DROP VIEW IF EXISTS `availableservices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `availableservices` AS select `a`.`ticketId` AS `ticketId`,`b`.`operatorName` AS `operatorName`,`a`.`destination` AS `destination`,`a`.`departingDate` AS `departingDate`,`a`.`departingTime` AS `departingTime`,`c`.`seating` AS `seating` from ((`services` `a` join `operator` `b` on((`a`.`operatorId` = `b`.`operatorId`))) join `tickets` `c` on((`a`.`ticketId` = `c`.`ticketId`))) where (not(`a`.`ticketId` in (select `bookings`.`ticketId` from `bookings`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `showusersbookingticket`
--

/*!50001 DROP VIEW IF EXISTS `showusersbookingticket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showusersbookingticket` AS select `d`.`ticketId` AS `ticketId`,`d`.`seating` AS `seating`,`a`.`fullName` AS `fullName`,`c`.`operatorName` AS `operatorName`,`b`.`destination` AS `destination` from (((`user` `a` join `services` `b` on(`a`.`userId` in (select `bookings`.`userId` from `bookings`))) join `operator` `c` on((`b`.`operatorId` = `c`.`operatorId`))) join `tickets` `d` on((`b`.`ticketId` = `d`.`ticketId`))) where `b`.`ticketId` in (select `bookings`.`ticketId` from `bookings`) group by `b`.`ticketId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-03 11:28:08
