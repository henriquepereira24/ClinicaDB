CREATE DATABASE  IF NOT EXISTS `ClinicaDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ClinicaDB`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 44.223.120.134    Database: ClinicaDB
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.24.04.1

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
-- Table structure for table `Consultas`
--

DROP TABLE IF EXISTS `Consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Consultas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PacienteID` int NOT NULL,
  `MédicoID` int NOT NULL,
  `DataConsulta` datetime NOT NULL,
  `Diagnóstico` text,
  PRIMARY KEY (`ID`),
  KEY `PacienteID` (`PacienteID`),
  KEY `MédicoID` (`MédicoID`),
  CONSTRAINT `Consultas_ibfk_1` FOREIGN KEY (`PacienteID`) REFERENCES `Pacientes` (`ID`),
  CONSTRAINT `Consultas_ibfk_2` FOREIGN KEY (`MédicoID`) REFERENCES `Médicos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consultas`
--

LOCK TABLES `Consultas` WRITE;
/*!40000 ALTER TABLE `Consultas` DISABLE KEYS */;
INSERT INTO `Consultas` VALUES (1,1,1,'2023-07-10 10:00:00','Hipertensão'),(2,2,2,'2023-07-11 11:00:00','Dermatite'),(3,3,3,'2023-08-15 14:00:00','Gripe'),(4,4,4,'2023-08-16 09:00:00','Fratura'),(5,1,1,'2023-09-01 10:00:00','Gripe'),(6,2,2,'2023-09-02 11:00:00','Dor de cabeça'),(11,4,4,'2023-09-04 11:00:00','Dor de cabeça'),(12,1,1,'2023-09-06 10:00:00','Pé'),(13,1,1,'2023-09-08 10:00:00','Dor'),(14,2,2,'2023-09-10 11:00:00','Dor de cabeça');
/*!40000 ALTER TABLE `Consultas` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `VerificarDisponibilidadeMedico` BEFORE INSERT ON `Consultas` FOR EACH ROW BEGIN
    DECLARE disponibilidade INT;
    SELECT COUNT(*) INTO disponibilidade
    FROM Consultas
    WHERE MédicoID = NEW.MédicoID AND DataConsulta = NEW.DataConsulta;
    
    IF disponibilidade > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Médico não disponível nesta data e hora';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AtualizarHistoricoConsultas` AFTER INSERT ON `Consultas` FOR EACH ROW BEGIN
    -- Código para atualizar histórico
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Médicos`
--

DROP TABLE IF EXISTS `Médicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Médicos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Especialidade` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Médicos`
--

LOCK TABLES `Médicos` WRITE;
/*!40000 ALTER TABLE `Médicos` DISABLE KEYS */;
INSERT INTO `Médicos` VALUES (1,'Dr. Pedro Costa','Cardiologia'),(2,'Dr. Ana Souza','Dermatologia'),(3,'Dr. Joana Almeida','Pediatria'),(4,'Dr. Luís Pereira','Ortopedia');
/*!40000 ALTER TABLE `Médicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pacientes`
--

DROP TABLE IF EXISTS `Pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pacientes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `DataNascimento` date NOT NULL,
  `Telefone` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pacientes`
--

LOCK TABLES `Pacientes` WRITE;
/*!40000 ALTER TABLE `Pacientes` DISABLE KEYS */;
INSERT INTO `Pacientes` VALUES (1,'João da Silva','1980-05-15','919988999'),(2,'Maria Oliveira','1975-10-23','913456789'),(3,'Carlos Ferreira','1990-03-10','914567890'),(4,'Ana Martins','1985-07-19','915678901');
/*!40000 ALTER TABLE `Pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescrições`
--

DROP TABLE IF EXISTS `Prescrições`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prescrições` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ConsultaID` int NOT NULL,
  `TratamentoID` int NOT NULL,
  `Quantidade` int NOT NULL,
  `Preço` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ConsultaID` (`ConsultaID`),
  KEY `TratamentoID` (`TratamentoID`),
  CONSTRAINT `Prescrições_ibfk_1` FOREIGN KEY (`ConsultaID`) REFERENCES `Consultas` (`ID`),
  CONSTRAINT `Prescrições_ibfk_2` FOREIGN KEY (`TratamentoID`) REFERENCES `Tratamentos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescrições`
--

LOCK TABLES `Prescrições` WRITE;
/*!40000 ALTER TABLE `Prescrições` DISABLE KEYS */;
INSERT INTO `Prescrições` VALUES (1,1,1,1,100.00),(2,2,2,2,300.00),(3,3,3,1,200.00),(4,4,4,1,250.00);
/*!40000 ALTER TABLE `Prescrições` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tratamentos`
--

DROP TABLE IF EXISTS `Tratamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tratamentos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Descrição` text,
  `Preço` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tratamentos`
--

LOCK TABLES `Tratamentos` WRITE;
/*!40000 ALTER TABLE `Tratamentos` DISABLE KEYS */;
INSERT INTO `Tratamentos` VALUES (1,'Tratamento A','Descrição do Tratamento A',100.00),(2,'Tratamento B','Descrição do Tratamento B',150.00),(3,'Tratamento C','Descrição do Tratamento C',200.00),(4,'Tratamento D','Descrição do Tratamento D',250.00);
/*!40000 ALTER TABLE `Tratamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ClinicaDB'
--

--
-- Dumping routines for database 'ClinicaDB'
--
/*!50003 DROP PROCEDURE IF EXISTS `AtualizarPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AtualizarPaciente`(IN pID INT, IN pNome VARCHAR(100), IN pDataNascimento DATE, IN pTelefone VARCHAR(15))
BEGIN
    UPDATE Pacientes
    SET Nome = pNome, DataNascimento = pDataNascimento, Telefone = pTelefone
    WHERE ID = pID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarConsulta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RegistrarConsulta`(IN pPacienteID INT, IN pMédicoID INT, IN pDataConsulta DATETIME, IN pDiagnóstico TEXT)
BEGIN
    INSERT INTO Consultas (PacienteID, MédicoID, DataConsulta, Diagnóstico)
    VALUES (pPacienteID, pMédicoID, pDataConsulta, pDiagnóstico);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RelatorioPacientesConsultas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `RelatorioPacientesConsultas`(IN pInicio DATE, IN pFim DATE)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pID INT;
    DECLARE pNome VARCHAR(100);
    DECLARE cur CURSOR FOR
        SELECT Pacientes.ID, Pacientes.Nome
        FROM Pacientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO pID, pNome;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT pNome AS Paciente, Consultas.DataConsulta, Consultas.Diagnóstico
        FROM Consultas
        WHERE Consultas.PacienteID = pID AND Consultas.DataConsulta BETWEEN pInicio AND pFim;
    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TotalConsultas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `TotalConsultas`(IN pInicio DATE, IN pFim DATE, OUT pTotal INT)
BEGIN
    SELECT COUNT(*) INTO pTotal
    FROM Consultas
    WHERE DataConsulta BETWEEN pInicio AND pFim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-16 11:04:46
