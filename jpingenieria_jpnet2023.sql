-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: jpingenieria_jpnet2023
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
-- Table structure for table `adelanto`
--

DROP TABLE IF EXISTS `adelanto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adelanto` (
  `idAdelanto` int NOT NULL AUTO_INCREMENT,
  `CreditoHastaElMomento` float NOT NULL,
  `MontoAAdelantar` float NOT NULL,
  `FechaDeSolicitud` date NOT NULL,
  `LinkDeSolicitud` text NOT NULL,
  `FechaDeDeposito` date NOT NULL,
  PRIMARY KEY (`idAdelanto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adelanto`
--

LOCK TABLES `adelanto` WRITE;
/*!40000 ALTER TABLE `adelanto` DISABLE KEYS */;
/*!40000 ALTER TABLE `adelanto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaciondepersonal`
--

DROP TABLE IF EXISTS `asignaciondepersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaciondepersonal` (
  `idAsignacionDePersonal` int NOT NULL AUTO_INCREMENT,
  `FechaDeInicioDeAsignacion` date DEFAULT NULL,
  `FechaDeFinDeAsignacion` date DEFAULT NULL,
  `idRegistroDePersonal` int DEFAULT NULL,
  PRIMARY KEY (`idAsignacionDePersonal`),
  KEY `FK_AsignacionDePersona_RegistroDePersonal_idx` (`idRegistroDePersonal`),
  CONSTRAINT `FK_AsignacionDePersona_RegistroDePersonal` FOREIGN KEY (`idRegistroDePersonal`) REFERENCES `registrodehabilitacion` (`idRegistroDeHabilitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaciondepersonal`
--

LOCK TABLES `asignaciondepersonal` WRITE;
/*!40000 ALTER TABLE `asignaciondepersonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignaciondepersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonos`
--

DROP TABLE IF EXISTS `bonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonos` (
  `idBonos` int NOT NULL AUTO_INCREMENT,
  `PagoHorasExtras` float DEFAULT '0',
  `Reintegro` float DEFAULT '0',
  `BonoDeclarado` float DEFAULT '0',
  `BonoProduce` float DEFAULT '0',
  `BonoNoche` float DEFAULT '0',
  `BonoConductor` float DEFAULT '0',
  `BonoRotacion` float DEFAULT '0',
  `BonoAsignacionFamiliar` float DEFAULT '0',
  `idGratificacion` int DEFAULT '0',
  PRIMARY KEY (`idBonos`),
  KEY `FK_Bonos_Gratificacion_idx` (`idGratificacion`),
  CONSTRAINT `FK_Bonos_Gratificacion` FOREIGN KEY (`idGratificacion`) REFERENCES `gratificacion` (`idGratificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonos`
--

LOCK TABLES `bonos` WRITE;
/*!40000 ALTER TABLE `bonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campodeestudio`
--

DROP TABLE IF EXISTS `campodeestudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campodeestudio` (
  `idCampoDeEstudio` int NOT NULL,
  `NombreCampoDeEstudio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCampoDeEstudio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campodeestudio`
--

LOCK TABLES `campodeestudio` WRITE;
/*!40000 ALTER TABLE `campodeestudio` DISABLE KEYS */;
/*!40000 ALTER TABLE `campodeestudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato`
--

DROP TABLE IF EXISTS `candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato` (
  `idCandidato` int NOT NULL AUTO_INCREMENT,
  `idPersona` int NOT NULL,
  `PretencionSalaria` int NOT NULL,
  `MesesDeExperiencia` int NOT NULL,
  `EtapaPrevia` tinyint NOT NULL,
  `LinkCurriculum` text NOT NULL,
  `EtapaDeLlamada` tinyint DEFAULT '0',
  `EtapaDeEntrevista` tinyint DEFAULT '0',
  `EtapaDeContratacion` tinyint DEFAULT '0',
  `idCargoAOptar` int DEFAULT NULL,
  PRIMARY KEY (`idCandidato`),
  KEY `FK_Candidato_Persona` (`idPersona`),
  KEY `FK_Candidadto_Cargo_idx` (`idCargoAOptar`),
  CONSTRAINT `FK_Candidadto_Cargo` FOREIGN KEY (`idCargoAOptar`) REFERENCES `cargo` (`idCargo`),
  CONSTRAINT `FK_Candidato_Persona` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` VALUES (6,29,1400,13,1,'No se Registro',1,1,1,3),(7,31,1500,13,1,'AIIB',1,1,1,7),(8,32,1000,13,1,'A1',1,1,NULL,1);
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idCargo` int NOT NULL,
  `NombreCargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Gerente General'),(2,'Gerente Ssoma'),(3,'Supervisor de Operaciones'),(4,'Supervisor Ssoma'),(5,'Jefe de Planeamiento'),(6,'Jefe de Proyectos'),(7,'Técnico HVAC');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriadebrevete`
--

DROP TABLE IF EXISTS `categoriadebrevete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriadebrevete` (
  `idCategoriaDeBrevete` int NOT NULL,
  `NombreCategoriaDeBrevete` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`idCategoriaDeBrevete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriadebrevete`
--

LOCK TABLES `categoriadebrevete` WRITE;
/*!40000 ALTER TABLE `categoriadebrevete` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriadebrevete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condiciondecontrato`
--

DROP TABLE IF EXISTS `condiciondecontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condiciondecontrato` (
  `idCondicionDeContrato` int NOT NULL,
  `NombreCondicionDeContrato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCondicionDeContrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condiciondecontrato`
--

LOCK TABLES `condiciondecontrato` WRITE;
/*!40000 ALTER TABLE `condiciondecontrato` DISABLE KEYS */;
INSERT INTO `condiciondecontrato` VALUES (1,'VIGENTE'),(2,'CESADO');
/*!40000 ALTER TABLE `condiciondecontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condiciondetareo`
--

DROP TABLE IF EXISTS `condiciondetareo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condiciondetareo` (
  `idCondicionDeTareo` int NOT NULL AUTO_INCREMENT,
  `NombreCondicionDeTareo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idCondicionDeTareo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condiciondetareo`
--

LOCK TABLES `condiciondetareo` WRITE;
/*!40000 ALTER TABLE `condiciondetareo` DISABLE KEYS */;
INSERT INTO `condiciondetareo` VALUES (1,'NORMAL'),(2,'TARDANZA'),(3,'FALTA'),(4,'DESCANSO MEDICO'),(5,'SIN LICENCIA DE GOCE DE HABER'),(6,'CON LICENCIA DE GOCE DE HABER'),(7,'DESCANSO PROGRAMADO'),(8,'FERIADO TRABAJADO'),(9,'VACACIONES'),(10,'VIAJE');
/*!40000 ALTER TABLE `condiciondetareo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `idContrato` int NOT NULL AUTO_INCREMENT,
  `idCondicionDeContrato` int NOT NULL,
  `idMotivoDeCese` int DEFAULT NULL,
  `idEmpleado` int NOT NULL,
  `FechaDeInicioDeContrato` date NOT NULL,
  `FechaDeFinDeContrato` date NOT NULL,
  PRIMARY KEY (`idContrato`),
  KEY `FK_Contrato_CondicionDeContrato_idx` (`idCondicionDeContrato`),
  KEY `FK_Contrato_MotivoDeCese_idx` (`idMotivoDeCese`),
  KEY `FK_Contrato_Empleados_idx` (`idEmpleado`),
  CONSTRAINT `FK_Contrato_CondicionDeContrato` FOREIGN KEY (`idCondicionDeContrato`) REFERENCES `condiciondecontrato` (`idCondicionDeContrato`),
  CONSTRAINT `FK_Contrato_Empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Contrato_MotivoCese` FOREIGN KEY (`idMotivoDeCese`) REFERENCES `motivodecese` (`idMotivosDeCese`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,1,NULL,1,'2021-11-16','2023-11-15'),(2,1,NULL,2,'2019-11-18','2023-09-15'),(3,1,NULL,3,'2022-09-13','2023-05-13'),(4,1,NULL,4,'2021-09-20','2030-09-20'),(5,1,NULL,5,'2022-08-22','2023-05-16'),(6,1,NULL,6,'2022-06-20','2030-06-20'),(7,1,NULL,7,'2022-08-22','2023-02-28'),(8,1,NULL,8,'2022-11-15','2023-02-15'),(9,1,NULL,9,'2023-06-01','2023-04-03'),(10,1,NULL,10,'2023-01-03','2023-04-03'),(11,1,NULL,11,'2020-09-12','2030-09-12'),(12,1,NULL,12,'2023-01-19','2023-04-19'),(13,1,NULL,13,'2022-06-16','2023-03-17'),(14,1,NULL,14,'2022-07-18','2023-04-15'),(15,1,NULL,15,'2016-04-01','2030-04-01'),(16,1,NULL,16,'2023-01-19','2023-04-19'),(18,1,NULL,18,'2012-07-01','2030-07-10'),(19,1,NULL,19,'2021-01-01','2030-01-01'),(20,1,NULL,20,'2012-07-01','2030-07-01'),(21,1,NULL,21,'2021-02-17','2023-03-16'),(22,1,NULL,22,'2022-06-16','2023-07-18'),(23,1,NULL,23,'2019-08-01','2023-04-13'),(24,1,NULL,24,'2022-07-12','2030-07-12'),(25,1,NULL,25,'2023-02-02','2023-05-02'),(26,1,NULL,26,'2019-07-01','2030-07-01'),(27,1,NULL,27,'2023-02-02','2023-05-02'),(28,1,NULL,28,'2023-01-26','2023-04-26');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentasporrendir`
--

DROP TABLE IF EXISTS `cuentasporrendir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentasporrendir` (
  `idCuentasPorRendir` int NOT NULL AUTO_INCREMENT,
  `DiaDeRegistro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Motivo` varchar(500) NOT NULL,
  `Monto` float NOT NULL,
  PRIMARY KEY (`idCuentasPorRendir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasporrendir`
--

LOCK TABLES `cuentasporrendir` WRITE;
/*!40000 ALTER TABLE `cuentasporrendir` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentasporrendir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursodehabilitacion`
--

DROP TABLE IF EXISTS `cursodehabilitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursodehabilitacion` (
  `idCursoDeHabilitacion` int NOT NULL,
  `NombreCursoDeHabilitacion` varchar(45) DEFAULT NULL,
  `LinkCurso` text,
  `idProyecto` int NOT NULL,
  PRIMARY KEY (`idCursoDeHabilitacion`),
  KEY `FK_CursoDeHabilitacion_Proyecto_idx` (`idProyecto`),
  CONSTRAINT `FK_CursoDeHabilitacion_Proyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursodehabilitacion`
--

LOCK TABLES `cursodehabilitacion` WRITE;
/*!40000 ALTER TABLE `cursodehabilitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursodehabilitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursoparahabilitacion`
--

DROP TABLE IF EXISTS `cursoparahabilitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursoparahabilitacion` (
  `idCursoParaHabilitacion` int NOT NULL,
  `idProcedimientoDeHabilitacion` int NOT NULL,
  `idCursoDeHabilitacion` int NOT NULL,
  `FechaDeInicioDeCertificacion` date NOT NULL,
  `FechaDeFinDeCertificacion` date NOT NULL,
  `idEstadoDeCurso` int NOT NULL,
  PRIMARY KEY (`idCursoParaHabilitacion`),
  KEY `FK_CursoDeHabilitacion__idx` (`idCursoDeHabilitacion`),
  KEY `FK_CursoParaHabilitacion_EstadoDeCurso_idx` (`idEstadoDeCurso`),
  KEY `FK_CursoParaHabilitacion_Procedimiento_idx` (`idProcedimientoDeHabilitacion`),
  CONSTRAINT `FK_CursoDeHabilitacion_` FOREIGN KEY (`idCursoDeHabilitacion`) REFERENCES `cursodehabilitacion` (`idCursoDeHabilitacion`),
  CONSTRAINT `FK_CursoParaHabilitacion_EstadoDeCurso` FOREIGN KEY (`idEstadoDeCurso`) REFERENCES `estadodecurso` (`idEstadoDeCurso`),
  CONSTRAINT `FK_CursoParaHabilitacion_Procedimiento` FOREIGN KEY (`idProcedimientoDeHabilitacion`) REFERENCES `procedimientodehabilitacion` (`idProcedimientoDeHabilitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursoparahabilitacion`
--

LOCK TABLES `cursoparahabilitacion` WRITE;
/*!40000 ALTER TABLE `cursoparahabilitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursoparahabilitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datoscontables`
--

DROP TABLE IF EXISTS `datoscontables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datoscontables` (
  `idDatosContables` int NOT NULL AUTO_INCREMENT,
  `SueldoBase` float NOT NULL,
  `CISPP` varchar(25) DEFAULT NULL,
  `NHijos` int NOT NULL DEFAULT '0',
  `idContrato` int NOT NULL,
  PRIMARY KEY (`idDatosContables`),
  KEY `FK_DatosContables_Contrato_idx` (`idContrato`),
  CONSTRAINT `FK_DatosContables_Contrato` FOREIGN KEY (`idContrato`) REFERENCES `contrato` (`idContrato`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datoscontables`
--

LOCK TABLES `datoscontables` WRITE;
/*!40000 ALTER TABLE `datoscontables` DISABLE KEYS */;
INSERT INTO `datoscontables` VALUES (1,2500,NULL,0,1),(2,2500,NULL,0,2),(3,2500,NULL,1,3),(4,1500,NULL,1,4),(5,2500,NULL,0,5),(6,1700,NULL,0,6),(7,2200,NULL,0,7),(8,1800,NULL,0,8),(9,1200,NULL,0,9),(10,1800,NULL,0,10),(11,2000,NULL,0,11),(12,1500,NULL,0,12),(13,5000,NULL,0,13),(14,2000,NULL,1,14),(15,1900,NULL,1,15),(16,1500,NULL,0,16),(18,3500,NULL,1,18),(19,1900,NULL,0,19),(20,2500,NULL,1,20),(21,2200,NULL,1,21),(22,1500,NULL,1,22),(23,2500,NULL,0,23),(24,2200,NULL,1,24),(25,1800,NULL,1,25),(26,1900,NULL,1,26),(27,1500,NULL,0,27),(28,1500,NULL,0,28);
/*!40000 ALTER TABLE `datoscontables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosprofesionales`
--

DROP TABLE IF EXISTS `datosprofesionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosprofesionales` (
  `idDatosProfesionales` int NOT NULL,
  `idEmpleado` int DEFAULT NULL,
  `Profesion` varchar(100) DEFAULT NULL,
  `idCampoDeEstudio` int DEFAULT NULL,
  `MesesDeExperiencia` int DEFAULT NULL,
  `idCategoriaDeBrevete` int DEFAULT NULL,
  PRIMARY KEY (`idDatosProfesionales`),
  KEY `FK_DatosProfesionales_CampoDeEstudio_idx` (`idCampoDeEstudio`),
  KEY `FK_DatosProfesionales_CategoriaDeBrevete_idx` (`idCategoriaDeBrevete`),
  KEY `FK_DatosProfesionales_Empleados_idx` (`idEmpleado`),
  CONSTRAINT `FK_DatosProfesionales_CampoDeEstudio` FOREIGN KEY (`idCampoDeEstudio`) REFERENCES `campodeestudio` (`idCampoDeEstudio`),
  CONSTRAINT `FK_DatosProfesionales_CategoriaDeBrevete` FOREIGN KEY (`idCategoriaDeBrevete`) REFERENCES `categoriadebrevete` (`idCategoriaDeBrevete`),
  CONSTRAINT `FK_DatosProfesionales_Empleados` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosprofesionales`
--

LOCK TABLES `datosprofesionales` WRITE;
/*!40000 ALTER TABLE `datosprofesionales` DISABLE KEYS */;
/*!40000 ALTER TABLE `datosprofesionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descansomedico`
--

DROP TABLE IF EXISTS `descansomedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descansomedico` (
  `idDescansoMedico` int NOT NULL AUTO_INCREMENT,
  `FechaDeInicioDescansoMedico` date NOT NULL,
  `FechaDeFinDescansoMedico` date NOT NULL,
  `LinkDocumento` text,
  PRIMARY KEY (`idDescansoMedico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descansomedico`
--

LOCK TABLES `descansomedico` WRITE;
/*!40000 ALTER TABLE `descansomedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `descansomedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descuentos`
--

DROP TABLE IF EXISTS `descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuentos` (
  `idDescuentos` int NOT NULL AUTO_INCREMENT,
  `idPeriodo` int NOT NULL,
  `idContrato` int NOT NULL,
  `ImpuestoDeQuintaCategoria` float NOT NULL DEFAULT '0',
  `Tardanzas` float NOT NULL DEFAULT '0',
  `Faltas` int NOT NULL DEFAULT '0',
  `DescuentoFondoDePension` float NOT NULL DEFAULT '0',
  `idAdelantoOCredito` int DEFAULT NULL,
  `idCuentaPorRendir` int DEFAULT NULL,
  `DescuentoRecursosHumanos` float DEFAULT NULL,
  PRIMARY KEY (`idDescuentos`),
  KEY `FK_Descuentos_Adelantos_idx` (`idAdelantoOCredito`),
  KEY `FK_Descuento_Periodo_idx` (`idPeriodo`),
  KEY `FK_Descuentos_IdContrato_idx` (`idContrato`),
  KEY `FK_Descuentos_CuentasPorRendir_idx` (`idCuentaPorRendir`),
  CONSTRAINT `FK_Descuento_Periodo` FOREIGN KEY (`idPeriodo`) REFERENCES `periodo` (`idPeriodo`),
  CONSTRAINT `FK_Descuentos_Adelantos` FOREIGN KEY (`idAdelantoOCredito`) REFERENCES `adelanto` (`idAdelanto`),
  CONSTRAINT `FK_Descuentos_CuentasPorRendir` FOREIGN KEY (`idCuentaPorRendir`) REFERENCES `cuentasporrendir` (`idCuentasPorRendir`),
  CONSTRAINT `FK_Descuentos_IdContrato` FOREIGN KEY (`idContrato`) REFERENCES `contrato` (`idContrato`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuentos`
--

LOCK TABLES `descuentos` WRITE;
/*!40000 ALTER TABLE `descuentos` DISABLE KEYS */;
INSERT INTO `descuentos` VALUES (914,2,1,5.33,0,0,296,NULL,NULL,NULL),(915,2,2,5.33,0,0,296,NULL,NULL,NULL),(916,2,3,5.33,0,4,283.06,NULL,NULL,NULL),(917,2,4,0,0,2,182.42,NULL,NULL,NULL),(918,2,5,5.33,0,6,238.71,NULL,NULL,NULL),(919,2,6,0,0,8,163.97,NULL,NULL,NULL),(920,2,7,0,0,4,226.87,NULL,NULL,NULL),(921,2,8,0,0,2,199.37,NULL,NULL,NULL),(922,2,9,0,0,2,132.91,NULL,NULL,NULL),(923,2,10,0,0,1,206.25,NULL,NULL,NULL),(924,2,11,0,0,0,236.8,NULL,NULL,NULL),(925,2,12,0,0,10,144.68,NULL,NULL,NULL),(926,2,13,299.17,0,0,592,NULL,NULL,NULL),(927,2,14,0,0,19,106.94,NULL,NULL,NULL),(928,2,15,0,0,27,47.81,NULL,NULL,NULL),(929,2,16,0,0,8,143.23,NULL,NULL,NULL),(930,2,18,99.87,0,1,440.32,NULL,NULL,NULL),(931,2,19,0,0,15,127.48,NULL,NULL,NULL),(932,2,20,5.33,0,28,31.45,NULL,NULL,NULL),(933,2,21,0,0,5,218.47,NULL,NULL,NULL),(934,2,22,0,0,9,138.39,NULL,NULL,NULL),(935,2,23,5.33,0,9,210.06,NULL,NULL,NULL),(936,2,24,0,0,29,16.81,NULL,NULL,NULL),(937,2,25,0,0,0,213.12,NULL,NULL,NULL),(938,2,26,0,0,3,223.1,NULL,NULL,NULL),(939,2,27,0,0,19,68.75,NULL,NULL,NULL),(940,2,28,0,0,15,100.64,NULL,NULL,NULL);
/*!40000 ALTER TABLE `descuentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descuentosderecursoshumanos`
--

DROP TABLE IF EXISTS `descuentosderecursoshumanos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuentosderecursoshumanos` (
  `idDescuentosDeRecursosHumanos` int NOT NULL,
  `Motivo` varchar(500) NOT NULL,
  `Monto` float NOT NULL,
  PRIMARY KEY (`idDescuentosDeRecursosHumanos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuentosderecursoshumanos`
--

LOCK TABLES `descuentosderecursoshumanos` WRITE;
/*!40000 ALTER TABLE `descuentosderecursoshumanos` DISABLE KEYS */;
/*!40000 ALTER TABLE `descuentosderecursoshumanos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `idDireccion` int NOT NULL AUTO_INCREMENT,
  `idTipoDeVia` int DEFAULT NULL,
  `NombreDeVia` varchar(45) DEFAULT NULL,
  `idTipoDeLocalidad` int DEFAULT NULL,
  `NombreLocalidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDireccion`),
  KEY `FK_Direccion_TipoDeVia_idx` (`idTipoDeVia`),
  KEY `FK_Direccion_TipoDeLocalidad_idx` (`idTipoDeLocalidad`),
  CONSTRAINT `FK_Direccion_TipoDeLocalidad` FOREIGN KEY (`idTipoDeLocalidad`) REFERENCES `tipodelocalidad` (`idTipoDeLocalidad`),
  CONSTRAINT `FK_Direccion_TipoDeVia` FOREIGN KEY (`idTipoDeVia`) REFERENCES `tipodevia` (`idTipoDeVia`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,1,'Irlanda',3,'La Colina'),(2,1,'IrlandaSS',3,'La ColinaSS'),(3,1,'Parque Lambramani',2,'Minuciop'),(4,1,'Parque Lambramani',2,'Minuciop'),(5,1,'Parque Lambramani',2,'Minuciop'),(6,1,'Parque Lambramani',2,'Minuciop'),(7,1,'Parque Lambramani',2,'Minuciop'),(8,1,'Parque Lambramani',2,'Minuciop'),(9,1,'Parque Lambramani',2,'Minuciop'),(10,1,'Parque Lambramani',2,'Minuciop'),(11,1,'Parque Lambramani',2,'Minuciop'),(12,1,'Parque Lambramani',2,'Minuciop'),(13,1,'Parque Lambramani',2,'Minuciop'),(14,1,'Parque Lambramani',2,'Minuciop'),(15,1,'Parque Lambramani',2,'Minuciop'),(16,1,'Parque Lambramani',2,'Minuciop'),(17,1,'Parque Lambramani',2,'Minuciop'),(18,1,'Parque Lambramani',2,'Minuciop'),(19,1,'Parque Lambramani',2,'Minuciop'),(20,1,'Parque Lambramani',2,'Minuciop'),(21,1,'Parque Lambramani',2,'Minuciop'),(22,1,'Parque Lambramani',2,'Minuciop'),(23,1,'Parque Lambramani',2,'Minuciop'),(24,NULL,'C',NULL,'Juan Manuel Polar'),(25,NULL,'San Nicolas',NULL,'San Patricio'),(26,NULL,'ss',NULL,'ss'),(27,NULL,'ss',NULL,'ss'),(28,NULL,'ss',NULL,'ss'),(29,NULL,'ss',NULL,'ss'),(30,NULL,'ss',NULL,'ss'),(31,NULL,'ss',NULL,'ss'),(32,NULL,'ss',NULL,'ss'),(33,NULL,'',NULL,''),(34,NULL,'',NULL,''),(35,NULL,'',NULL,''),(36,NULL,'',NULL,''),(37,NULL,'',NULL,''),(38,NULL,'',NULL,''),(39,NULL,'',NULL,''),(40,NULL,'',NULL,''),(41,NULL,'',NULL,''),(42,NULL,'',NULL,''),(43,NULL,'',NULL,''),(44,NULL,'',NULL,''),(45,NULL,'',NULL,''),(46,NULL,'',NULL,''),(47,NULL,'',NULL,''),(48,NULL,'',NULL,''),(49,NULL,'',NULL,''),(50,NULL,'',NULL,''),(51,NULL,'',NULL,''),(52,NULL,'',NULL,''),(53,NULL,'',NULL,''),(54,NULL,'',NULL,''),(55,NULL,'JUAN',NULL,'SILVA'),(56,NULL,'JUAN',NULL,'SILVA'),(57,NULL,'JUAN',NULL,'SILVA'),(58,NULL,'JUAN',NULL,'SILVA'),(59,NULL,'AVELINO',NULL,'SILVA'),(60,NULL,'',NULL,'');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `idPersona` int NOT NULL,
  `idCargo` int NOT NULL,
  `idFondoDePension` int NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `idPersona_UNIQUE` (`idPersona`),
  KEY `FK_Empleado_Cargo_idx` (`idCargo`),
  KEY `FK_FondoDePension_idx` (`idFondoDePension`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Empleado_Cargo` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`),
  CONSTRAINT `FK_FondoDePension` FOREIGN KEY (`idFondoDePension`) REFERENCES `fondodepension` (`idFondoDePension`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,5,2),(2,2,3,2),(3,3,4,1),(4,4,7,1),(5,5,7,2),(6,6,7,1),(7,7,7,4),(8,8,7,2),(9,9,7,2),(10,10,7,2),(11,11,6,3),(12,12,7,1),(13,13,2,2),(14,14,3,4),(15,15,7,1),(16,16,7,2),(17,17,7,1),(18,18,3,1),(19,19,7,1),(20,20,7,1),(21,21,7,3),(22,22,7,1),(23,23,7,2),(24,24,7,4),(25,25,7,2),(26,26,7,1),(27,27,7,2),(28,28,7,1),(32,30,3,1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estaciondetrabajo`
--

DROP TABLE IF EXISTS `estaciondetrabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estaciondetrabajo` (
  `idEstacionDeTrabajo` int NOT NULL AUTO_INCREMENT,
  `NombreEstacionDeTrabajo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idEstacionDeTrabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciondetrabajo`
--

LOCK TABLES `estaciondetrabajo` WRITE;
/*!40000 ALTER TABLE `estaciondetrabajo` DISABLE KEYS */;
INSERT INTO `estaciondetrabajo` VALUES (1,'TALLER  CERRO COLORADO AREQUIPA'),(2,'TIENDA JOSE LUIS BUSTAMANTE Y RIVERO AREQUIPA'),(3,'AREA DE PROYECTO AREQUIPA'),(4,'MINA BAMBAS'),(5,'MINA ANTAPACAY'),(6,'MINA CHINALCO'),(7,'MINA MARCOBRE'),(8,'TISUR'),(9,'LABORATORIO PORTUGAL');
/*!40000 ALTER TABLE `estaciondetrabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadodecurso`
--

DROP TABLE IF EXISTS `estadodecurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadodecurso` (
  `idEstadoDeCurso` int NOT NULL AUTO_INCREMENT,
  `NombreEstadoDeCurso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstadoDeCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadodecurso`
--

LOCK TABLES `estadodecurso` WRITE;
/*!40000 ALTER TABLE `estadodecurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadodecurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadodehabilitacion`
--

DROP TABLE IF EXISTS `estadodehabilitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadodehabilitacion` (
  `idEstadoDeHabilitacion` int NOT NULL AUTO_INCREMENT,
  `NombreEstadoDeHabilitacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstadoDeHabilitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadodehabilitacion`
--

LOCK TABLES `estadodehabilitacion` WRITE;
/*!40000 ALTER TABLE `estadodehabilitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadodehabilitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapadeprocedimientodehabilitacion`
--

DROP TABLE IF EXISTS `etapadeprocedimientodehabilitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapadeprocedimientodehabilitacion` (
  `idEtapaDeProcedimientoDeHabilitacion` int NOT NULL AUTO_INCREMENT,
  `NombreEtapaDeProcedimientoDeHabilitacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEtapaDeProcedimientoDeHabilitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapadeprocedimientodehabilitacion`
--

LOCK TABLES `etapadeprocedimientodehabilitacion` WRITE;
/*!40000 ALTER TABLE `etapadeprocedimientodehabilitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `etapadeprocedimientodehabilitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examenmedico`
--

DROP TABLE IF EXISTS `examenmedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examenmedico` (
  `idExamenMedico` int NOT NULL,
  `idTipoDeExamenMedico` int DEFAULT NULL,
  `FechaDeInicioVigencia` date DEFAULT NULL,
  `FechaDeFinVidencia` date DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  PRIMARY KEY (`idExamenMedico`),
  KEY `FK_ExamenMedico_TipoDeExamenMedico_idx` (`idTipoDeExamenMedico`),
  KEY `FK_ExamenMedico_Empleado_idx` (`idEmpleado`),
  CONSTRAINT `FK_ExamenMedico_Empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `FK_ExamenMedico_TipoDeExamenMedico` FOREIGN KEY (`idTipoDeExamenMedico`) REFERENCES `tipoexamenmedico` (`idTipoExamenMedico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examenmedico`
--

LOCK TABLES `examenmedico` WRITE;
/*!40000 ALTER TABLE `examenmedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `examenmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fondodepension`
--

DROP TABLE IF EXISTS `fondodepension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fondodepension` (
  `idFondoDePension` int NOT NULL AUTO_INCREMENT,
  `NombreEntidad` varchar(45) NOT NULL,
  `TipoDeFondo` varchar(45) NOT NULL,
  `TipoDeEmpresa` varchar(45) NOT NULL,
  `PorcentajeDeDescuento` float NOT NULL,
  PRIMARY KEY (`idFondoDePension`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fondodepension`
--

LOCK TABLES `fondodepension` WRITE;
/*!40000 ALTER TABLE `fondodepension` DISABLE KEYS */;
INSERT INTO `fondodepension` VALUES (1,'ONP','Fondo Unico','PUBLICO',0.13),(2,'AFP INTEGRA','Tipo 3','PRIVADO',0.1184),(3,'AFP HABITAD','Tipo 3','PRIVADO',0.1184),(4,'AFP PRIMA','Tipo 3','PRIVADO',0.1184),(5,'AFP PROFUTURO','Tipo 3','PRIVADO',0.1184);
/*!40000 ALTER TABLE `fondodepension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gratificacion`
--

DROP TABLE IF EXISTS `gratificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gratificacion` (
  `idGratificacion` int NOT NULL AUTO_INCREMENT,
  `MesesConsiderados` int NOT NULL,
  `SueldoConsiderado` float NOT NULL,
  `TotalAConsiderar` float DEFAULT '0',
  PRIMARY KEY (`idGratificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gratificacion`
--

LOCK TABLES `gratificacion` WRITE;
/*!40000 ALTER TABLE `gratificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gratificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horasextras`
--

DROP TABLE IF EXISTS `horasextras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horasextras` (
  `idHorasExtras` int NOT NULL AUTO_INCREMENT,
  `LinkDocumento` text NOT NULL,
  `HoraDeRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ValorDe25` float DEFAULT '0',
  `ValorDe35` float DEFAULT '0',
  PRIMARY KEY (`idHorasExtras`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horasextras`
--

LOCK TABLES `horasextras` WRITE;
/*!40000 ALTER TABLE `horasextras` DISABLE KEYS */;
INSERT INTO `horasextras` VALUES (5,'asdfghjkl','2023-03-17 18:21:56',2,1),(6,'Adjuntar','2023-03-17 18:31:20',2,1),(7,'Adjuntar','2023-03-17 18:33:47',2,1),(8,'Adjuntar','2023-03-17 18:35:08',1,0);
/*!40000 ALTER TABLE `horasextras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenciacongocedehaber`
--

DROP TABLE IF EXISTS `licenciacongocedehaber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenciacongocedehaber` (
  `idLicenciaConGoceDeHaber` int NOT NULL AUTO_INCREMENT,
  `FechaDeInicioConGoceDeHaber` date NOT NULL,
  `FechaDeFinConGoceDeHaber` date NOT NULL,
  `DiasHabiles` int DEFAULT NULL,
  `LinkDelDocumento` text NOT NULL,
  PRIMARY KEY (`idLicenciaConGoceDeHaber`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenciacongocedehaber`
--

LOCK TABLES `licenciacongocedehaber` WRITE;
/*!40000 ALTER TABLE `licenciacongocedehaber` DISABLE KEYS */;
INSERT INTO `licenciacongocedehaber` VALUES (17,'2023-01-18','2023-02-06',NULL,'Por Adjuntar'),(18,'2023-01-18','2023-02-06',NULL,'Por Adjuntar'),(19,'2023-01-18','2023-02-06',NULL,'Por Adjuntar'),(20,'2023-01-18','2023-02-06',NULL,'asjdasld'),(21,'2023-01-28','2023-01-30',NULL,'Justificación por'),(22,'2023-01-28','2023-01-30',NULL,'Justificación por'),(23,'2023-01-28','2023-01-30',NULL,'fghjkl'),(24,'2023-01-28','2023-01-30',NULL,'AdjntoPruebas'),(25,'2023-01-28','2023-01-30',NULL,'AdjntoPruebas');
/*!40000 ALTER TABLE `licenciacongocedehaber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenciasingocedehaber`
--

DROP TABLE IF EXISTS `licenciasingocedehaber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenciasingocedehaber` (
  `idLicenciaSinGoceDeHaber` int NOT NULL AUTO_INCREMENT,
  `FechaDeInicioSinGoceDeHaber` date NOT NULL,
  `FechaDeFinSinGoceDeHaber` date NOT NULL,
  `DiasHabilesAConsiderar` int DEFAULT NULL,
  `LinkDelDocumento` text NOT NULL,
  PRIMARY KEY (`idLicenciaSinGoceDeHaber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenciasingocedehaber`
--

LOCK TABLES `licenciasingocedehaber` WRITE;
/*!40000 ALTER TABLE `licenciasingocedehaber` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenciasingocedehaber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidacion`
--

DROP TABLE IF EXISTS `liquidacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquidacion` (
  `idLiquidacion` int NOT NULL,
  `idContrato` int DEFAULT NULL,
  `FechaDeInicio` date DEFAULT NULL,
  `FechaDeFIn` date DEFAULT NULL,
  `MontoEstimado` float DEFAULT NULL,
  `BeneficiosNoPagados` float DEFAULT NULL,
  PRIMARY KEY (`idLiquidacion`),
  KEY `FK_Liquidacion_Contrato_idx` (`idContrato`),
  CONSTRAINT `FK_Liquidacion_Contrato` FOREIGN KEY (`idContrato`) REFERENCES `contrato` (`idContrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidacion`
--

LOCK TABLES `liquidacion` WRITE;
/*!40000 ALTER TABLE `liquidacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `idLocalidad` int NOT NULL,
  `Ubigeo` varchar(6) DEFAULT NULL,
  `Departamento` varchar(45) DEFAULT NULL,
  `Provincia` varchar(45) DEFAULT NULL,
  `Distrito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'010101','AMAZONAS','CHACHAPOYAS','CHACHAPOYAS'),(2,'010102','AMAZONAS','CHACHAPOYAS','ASUNCION'),(3,'010103','AMAZONAS','CHACHAPOYAS','BALSAS'),(4,'010104','AMAZONAS','CHACHAPOYAS','CHETO'),(5,'010105','AMAZONAS','CHACHAPOYAS','CHILIQUIN'),(6,'010106','AMAZONAS','CHACHAPOYAS','CHUQUIBAMBA'),(7,'010107','AMAZONAS','CHACHAPOYAS','GRANADA'),(8,'010108','AMAZONAS','CHACHAPOYAS','HUANCAS'),(9,'010109','AMAZONAS','CHACHAPOYAS','LA JALCA'),(10,'010110','AMAZONAS','CHACHAPOYAS','LEIMEBAMBA'),(11,'010111','AMAZONAS','CHACHAPOYAS','LEVANTO'),(12,'010112','AMAZONAS','CHACHAPOYAS','MAGDALENA'),(13,'010113','AMAZONAS','CHACHAPOYAS','MARISCAL CASTILLA'),(14,'010114','AMAZONAS','CHACHAPOYAS','MOLINOPAMPA'),(15,'010115','AMAZONAS','CHACHAPOYAS','MONTEVIDEO'),(16,'010116','AMAZONAS','CHACHAPOYAS','OLLEROS'),(17,'010117','AMAZONAS','CHACHAPOYAS','QUINJALCA'),(18,'010118','AMAZONAS','CHACHAPOYAS','SAN FRANCISCO DE DAGUAS'),(19,'010119','AMAZONAS','CHACHAPOYAS','SAN ISIDRO DE MAINO'),(20,'010120','AMAZONAS','CHACHAPOYAS','SOLOCO'),(21,'010121','AMAZONAS','CHACHAPOYAS','SONCHE'),(22,'010205','AMAZONAS','BAGUA','BAGUA'),(23,'010202','AMAZONAS','BAGUA','ARAMANGO'),(24,'010203','AMAZONAS','BAGUA','COPALLIN'),(25,'010204','AMAZONAS','BAGUA','EL PARCO'),(26,'010206','AMAZONAS','BAGUA','IMAZA'),(27,'010201','AMAZONAS','BAGUA','LA PECA'),(28,'010301','AMAZONAS','BONGARA','JUMBILLA'),(29,'010304','AMAZONAS','BONGARA','CHISQUILLA'),(30,'010305','AMAZONAS','BONGARA','CHURUJA'),(31,'010302','AMAZONAS','BONGARA','COROSHA'),(32,'010303','AMAZONAS','BONGARA','CUISPES'),(33,'010306','AMAZONAS','BONGARA','FLORIDA'),(34,'010312','AMAZONAS','BONGARA','JAZAN'),(35,'010307','AMAZONAS','BONGARA','RECTA'),(36,'010308','AMAZONAS','BONGARA','SAN CARLOS'),(37,'010309','AMAZONAS','BONGARA','SHIPASBAMBA'),(38,'010310','AMAZONAS','BONGARA','VALERA'),(39,'010311','AMAZONAS','BONGARA','YAMBRASBAMBA'),(40,'010601','AMAZONAS','CONDORCANQUI','NIEVA'),(41,'010603','AMAZONAS','CONDORCANQUI','EL CENEPA'),(42,'010602','AMAZONAS','CONDORCANQUI','RIO SANTIAGO'),(43,'010401','AMAZONAS','LUYA','LAMUD'),(44,'010402','AMAZONAS','LUYA','CAMPORREDONDO'),(45,'010403','AMAZONAS','LUYA','COCABAMBA'),(46,'010404','AMAZONAS','LUYA','COLCAMAR'),(47,'010405','AMAZONAS','LUYA','CONILA'),(48,'010406','AMAZONAS','LUYA','INGUILPATA'),(49,'010407','AMAZONAS','LUYA','LONGUITA'),(50,'010408','AMAZONAS','LUYA','LONYA CHICO'),(51,'010409','AMAZONAS','LUYA','LUYA'),(52,'010410','AMAZONAS','LUYA','LUYA VIEJO'),(53,'010411','AMAZONAS','LUYA','MARIA'),(54,'010412','AMAZONAS','LUYA','OCALLI'),(55,'010413','AMAZONAS','LUYA','OCUMAL'),(56,'010414','AMAZONAS','LUYA','PISUQUIA'),(57,'010423','AMAZONAS','LUYA','PROVIDENCIA'),(58,'010415','AMAZONAS','LUYA','SAN CRISTOBAL'),(59,'010416','AMAZONAS','LUYA','SAN FRANCISCO DEL YESO'),(60,'010417','AMAZONAS','LUYA','SAN JERONIMO'),(61,'010418','AMAZONAS','LUYA','SAN JUAN DE LOPECANCHA'),(62,'010419','AMAZONAS','LUYA','SANTA CATALINA'),(63,'010420','AMAZONAS','LUYA','SANTO TOMAS'),(64,'010421','AMAZONAS','LUYA','TINGO'),(65,'010422','AMAZONAS','LUYA','TRITA'),(66,'010501','AMAZONAS','RODRIGUEZ DE MENDOZA','SAN NICOLAS'),(67,'010503','AMAZONAS','RODRIGUEZ DE MENDOZA','CHIRIMOTO'),(68,'010502','AMAZONAS','RODRIGUEZ DE MENDOZA','COCHAMAL'),(69,'010504','AMAZONAS','RODRIGUEZ DE MENDOZA','HUAMBO'),(70,'010505','AMAZONAS','RODRIGUEZ DE MENDOZA','LIMABAMBA'),(71,'010506','AMAZONAS','RODRIGUEZ DE MENDOZA','LONGAR'),(72,'010508','AMAZONAS','RODRIGUEZ DE MENDOZA','MARISCAL BENAVIDES'),(73,'010507','AMAZONAS','RODRIGUEZ DE MENDOZA','MILPUC'),(74,'010509','AMAZONAS','RODRIGUEZ DE MENDOZA','OMIA'),(75,'010510','AMAZONAS','RODRIGUEZ DE MENDOZA','SANTA ROSA'),(76,'010511','AMAZONAS','RODRIGUEZ DE MENDOZA','TOTORA'),(77,'010512','AMAZONAS','RODRIGUEZ DE MENDOZA','VISTA ALEGRE'),(78,'010701','AMAZONAS','UTCUBAMBA','BAGUA GRANDE'),(79,'010702','AMAZONAS','UTCUBAMBA','CAJARURO'),(80,'010703','AMAZONAS','UTCUBAMBA','CUMBA'),(81,'010704','AMAZONAS','UTCUBAMBA','EL MILAGRO'),(82,'010705','AMAZONAS','UTCUBAMBA','JAMALCA'),(83,'010706','AMAZONAS','UTCUBAMBA','LONYA GRANDE'),(84,'010707','AMAZONAS','UTCUBAMBA','YAMON'),(85,'020101','ANCASH','HUARAZ','HUARAZ'),(86,'020103','ANCASH','HUARAZ','COCHABAMBA'),(87,'020104','ANCASH','HUARAZ','COLCABAMBA'),(88,'020105','ANCASH','HUARAZ','HUANCHAY'),(89,'020102','ANCASH','HUARAZ','INDEPENDENCIA'),(90,'020106','ANCASH','HUARAZ','JANGAS'),(91,'020107','ANCASH','HUARAZ','LA LIBERTAD'),(92,'020108','ANCASH','HUARAZ','OLLEROS'),(93,'020109','ANCASH','HUARAZ','PAMPAS'),(94,'020110','ANCASH','HUARAZ','PARIACOTO'),(95,'020111','ANCASH','HUARAZ','PIRA'),(96,'020112','ANCASH','HUARAZ','TARICA'),(97,'020201','ANCASH','AIJA','AIJA'),(98,'020203','ANCASH','AIJA','CORIS'),(99,'020205','ANCASH','AIJA','HUACLLAN'),(100,'020206','ANCASH','AIJA','LA MERCED'),(101,'020208','ANCASH','AIJA','SUCCHA'),(102,'021601','ANCASH','ANTONIO RAYMONDI','LLAMELLIN'),(103,'021602','ANCASH','ANTONIO RAYMONDI','ACZO'),(104,'021603','ANCASH','ANTONIO RAYMONDI','CHACCHO'),(105,'021604','ANCASH','ANTONIO RAYMONDI','CHINGAS'),(106,'021605','ANCASH','ANTONIO RAYMONDI','MIRGAS'),(107,'021606','ANCASH','ANTONIO RAYMONDI','SAN JUAN DE RONTOY'),(108,'021801','ANCASH','ASUNCION','CHACAS'),(109,'021802','ANCASH','ASUNCION','ACOCHACA'),(110,'020301','ANCASH','BOLOGNESI','CHIQUIAN'),(111,'020302','ANCASH','BOLOGNESI','ABELARDO PARDO LEZAMETA'),(112,'020321','ANCASH','BOLOGNESI','ANTONIO RAYMONDI'),(113,'020304','ANCASH','BOLOGNESI','AQUIA'),(114,'020305','ANCASH','BOLOGNESI','CAJACAY'),(115,'020322','ANCASH','BOLOGNESI','CANIS'),(116,'020323','ANCASH','BOLOGNESI','COLQUIOC'),(117,'020325','ANCASH','BOLOGNESI','HUALLANCA'),(118,'020311','ANCASH','BOLOGNESI','HUASTA'),(119,'020310','ANCASH','BOLOGNESI','HUAYLLACAYAN'),(120,'020324','ANCASH','BOLOGNESI','LA PRIMAVERA'),(121,'020313','ANCASH','BOLOGNESI','MANGAS'),(122,'020315','ANCASH','BOLOGNESI','PACLLON'),(123,'020317','ANCASH','BOLOGNESI','SAN MIGUEL DE CORPANQUI'),(124,'020320','ANCASH','BOLOGNESI','TICLLOS'),(125,'020401','ANCASH','CARHUAZ','CARHUAZ'),(126,'020402','ANCASH','CARHUAZ','ACOPAMPA'),(127,'020403','ANCASH','CARHUAZ','AMASHCA'),(128,'020404','ANCASH','CARHUAZ','ANTA'),(129,'020405','ANCASH','CARHUAZ','ATAQUERO'),(130,'020406','ANCASH','CARHUAZ','MARCARA'),(131,'020407','ANCASH','CARHUAZ','PARIAHUANCA'),(132,'020408','ANCASH','CARHUAZ','SAN MIGUEL DE ACO'),(133,'020409','ANCASH','CARHUAZ','SHILLA'),(134,'020410','ANCASH','CARHUAZ','TINCO'),(135,'020411','ANCASH','CARHUAZ','YUNGAR'),(136,'021701','ANCASH','CARLOS FERMIN FITZCARRALD','SAN LUIS'),(137,'021703','ANCASH','CARLOS FERMIN FITZCARRALD','SAN NICOLAS'),(138,'021702','ANCASH','CARLOS FERMIN FITZCARRALD','YAUYA'),(139,'020501','ANCASH','CASMA','CASMA'),(140,'020502','ANCASH','CASMA','BUENA VISTA ALTA'),(141,'020503','ANCASH','CASMA','COMANDANTE NOEL'),(142,'020505','ANCASH','CASMA','YAUTAN'),(143,'020601','ANCASH','CORONGO','CORONGO'),(144,'020602','ANCASH','CORONGO','ACO'),(145,'020603','ANCASH','CORONGO','BAMBAS'),(146,'020604','ANCASH','CORONGO','CUSCA'),(147,'020605','ANCASH','CORONGO','LA PAMPA'),(148,'020606','ANCASH','CORONGO','YANAC'),(149,'020607','ANCASH','CORONGO','YUPAN'),(150,'020801','ANCASH','HUARI','HUARI'),(151,'020816','ANCASH','HUARI','ANRA'),(152,'020802','ANCASH','HUARI','CAJAY'),(153,'020803','ANCASH','HUARI','CHAVIN DE HUANTAR'),(154,'020804','ANCASH','HUARI','HUACACHI'),(155,'020806','ANCASH','HUARI','HUACCHIS'),(156,'020805','ANCASH','HUARI','HUACHIS'),(157,'020807','ANCASH','HUARI','HUANTAR'),(158,'020808','ANCASH','HUARI','MASIN'),(159,'020809','ANCASH','HUARI','PAUCAS'),(160,'020810','ANCASH','HUARI','PONTO'),(161,'020811','ANCASH','HUARI','RAHUAPAMPA'),(162,'020812','ANCASH','HUARI','RAPAYAN'),(163,'020813','ANCASH','HUARI','SAN MARCOS'),(164,'020814','ANCASH','HUARI','SAN PEDRO DE CHANA'),(165,'020815','ANCASH','HUARI','UCO'),(166,'021901','ANCASH','HUARMEY','HUARMEY'),(167,'021902','ANCASH','HUARMEY','COCHAPETI'),(168,'021905','ANCASH','HUARMEY','CULEBRAS'),(169,'021903','ANCASH','HUARMEY','HUAYAN'),(170,'021904','ANCASH','HUARMEY','MALVAS'),(171,'020701','ANCASH','HUAYLAS','CARAZ'),(172,'020702','ANCASH','HUAYLAS','HUALLANCA'),(173,'020703','ANCASH','HUAYLAS','HUATA'),(174,'020704','ANCASH','HUAYLAS','HUAYLAS'),(175,'020705','ANCASH','HUAYLAS','MATO'),(176,'020706','ANCASH','HUAYLAS','PAMPAROMAS'),(177,'020707','ANCASH','HUAYLAS','PUEBLO LIBRE'),(178,'020708','ANCASH','HUAYLAS','SANTA CRUZ'),(179,'020710','ANCASH','HUAYLAS','SANTO TORIBIO'),(180,'020709','ANCASH','HUAYLAS','YURACMARCA'),(181,'020901','ANCASH','MARISCAL LUZURIAGA','PISCOBAMBA'),(182,'020902','ANCASH','MARISCAL LUZURIAGA','CASCA'),(183,'020908','ANCASH','MARISCAL LUZURIAGA','ELEAZAR GUZMAN BARRON'),(184,'020904','ANCASH','MARISCAL LUZURIAGA','FIDEL OLIVAS ESCUDERO'),(185,'020905','ANCASH','MARISCAL LUZURIAGA','LLAMA'),(186,'020906','ANCASH','MARISCAL LUZURIAGA','LLUMPA'),(187,'020903','ANCASH','MARISCAL LUZURIAGA','LUCMA'),(188,'020907','ANCASH','MARISCAL LUZURIAGA','MUSGA'),(189,'022007','ANCASH','OCROS','OCROS'),(190,'022001','ANCASH','OCROS','ACAS'),(191,'022002','ANCASH','OCROS','CAJAMARQUILLA'),(192,'022003','ANCASH','OCROS','CARHUAPAMPA'),(193,'022004','ANCASH','OCROS','COCHAS'),(194,'022005','ANCASH','OCROS','CONGAS'),(195,'022006','ANCASH','OCROS','LLIPA'),(196,'022008','ANCASH','OCROS','SAN CRISTOBAL DE RAJAN'),(197,'022009','ANCASH','OCROS','SAN PEDRO'),(198,'022010','ANCASH','OCROS','SANTIAGO DE CHILCAS'),(199,'021001','ANCASH','PALLASCA','CABANA'),(200,'021002','ANCASH','PALLASCA','BOLOGNESI'),(201,'021003','ANCASH','PALLASCA','CONCHUCOS'),(202,'021004','ANCASH','PALLASCA','HUACASCHUQUE'),(203,'021005','ANCASH','PALLASCA','HUANDOVAL'),(204,'021006','ANCASH','PALLASCA','LACABAMBA'),(205,'021007','ANCASH','PALLASCA','LLAPO'),(206,'021008','ANCASH','PALLASCA','PALLASCA'),(207,'021009','ANCASH','PALLASCA','PAMPAS'),(208,'021010','ANCASH','PALLASCA','SANTA ROSA'),(209,'021011','ANCASH','PALLASCA','TAUCA'),(210,'021101','ANCASH','POMABAMBA','POMABAMBA'),(211,'021102','ANCASH','POMABAMBA','HUAYLLAN'),(212,'021103','ANCASH','POMABAMBA','PAROBAMBA'),(213,'021104','ANCASH','POMABAMBA','QUINUABAMBA'),(214,'021201','ANCASH','RECUAY','RECUAY'),(215,'021210','ANCASH','RECUAY','CATAC'),(216,'021202','ANCASH','RECUAY','COTAPARACO'),(217,'021203','ANCASH','RECUAY','HUAYLLAPAMPA'),(218,'021209','ANCASH','RECUAY','LLACLLIN'),(219,'021204','ANCASH','RECUAY','MARCA'),(220,'021205','ANCASH','RECUAY','PAMPAS CHICO'),(221,'021206','ANCASH','RECUAY','PARARIN'),(222,'021207','ANCASH','RECUAY','TAPACOCHA'),(223,'021208','ANCASH','RECUAY','TICAPAMPA'),(224,'021301','ANCASH','SANTA','CHIMBOTE'),(225,'021302','ANCASH','SANTA','CACERES DEL PERU'),(226,'021308','ANCASH','SANTA','COISHCO'),(227,'021303','ANCASH','SANTA','MACATE'),(228,'021304','ANCASH','SANTA','MORO'),(229,'021305','ANCASH','SANTA','NEPEÑA'),(230,'021306','ANCASH','SANTA','SAMANCO'),(231,'021307','ANCASH','SANTA','SANTA'),(232,'021309','ANCASH','SANTA','NUEVO CHIMBOTE'),(233,'021401','ANCASH','SIHUAS','SIHUAS'),(234,'021407','ANCASH','SIHUAS','ACOBAMBA'),(235,'021402','ANCASH','SIHUAS','ALFONSO UGARTE'),(236,'021408','ANCASH','SIHUAS','CASHAPAMPA'),(237,'021403','ANCASH','SIHUAS','CHINGALPO'),(238,'021404','ANCASH','SIHUAS','HUAYLLABAMBA'),(239,'021405','ANCASH','SIHUAS','QUICHES'),(240,'021409','ANCASH','SIHUAS','RAGASH'),(241,'021410','ANCASH','SIHUAS','SAN JUAN'),(242,'021406','ANCASH','SIHUAS','SICSIBAMBA'),(243,'021501','ANCASH','YUNGAY','YUNGAY'),(244,'021502','ANCASH','YUNGAY','CASCAPARA'),(245,'021503','ANCASH','YUNGAY','MANCOS'),(246,'021504','ANCASH','YUNGAY','MATACOTO'),(247,'021505','ANCASH','YUNGAY','QUILLO'),(248,'021506','ANCASH','YUNGAY','RANRAHIRCA'),(249,'021507','ANCASH','YUNGAY','SHUPLUY'),(250,'021508','ANCASH','YUNGAY','YANAMA'),(251,'030101','APURIMAC','ABANCAY','ABANCAY'),(252,'030104','APURIMAC','ABANCAY','CHACOCHE'),(253,'030102','APURIMAC','ABANCAY','CIRCA'),(254,'030103','APURIMAC','ABANCAY','CURAHUASI'),(255,'030105','APURIMAC','ABANCAY','HUANIPACA'),(256,'030106','APURIMAC','ABANCAY','LAMBRAMA'),(257,'030107','APURIMAC','ABANCAY','PICHIRHUA'),(258,'030108','APURIMAC','ABANCAY','SAN PEDRO DE CACHORA'),(259,'030109','APURIMAC','ABANCAY','TAMBURCO'),(260,'030301','APURIMAC','ANDAHUAYLAS','ANDAHUAYLAS'),(261,'030302','APURIMAC','ANDAHUAYLAS','ANDARAPA'),(262,'030303','APURIMAC','ANDAHUAYLAS','CHIARA'),(263,'030304','APURIMAC','ANDAHUAYLAS','HUANCARAMA'),(264,'030305','APURIMAC','ANDAHUAYLAS','HUANCARAY'),(265,'030317','APURIMAC','ANDAHUAYLAS','HUAYANA'),(266,'030306','APURIMAC','ANDAHUAYLAS','KISHUARA'),(267,'030307','APURIMAC','ANDAHUAYLAS','PACOBAMBA'),(268,'030313','APURIMAC','ANDAHUAYLAS','PACUCHA'),(269,'030308','APURIMAC','ANDAHUAYLAS','PAMPACHIRI'),(270,'030314','APURIMAC','ANDAHUAYLAS','POMACOCHA'),(271,'030309','APURIMAC','ANDAHUAYLAS','SAN ANTONIO DE CACHI'),(272,'030310','APURIMAC','ANDAHUAYLAS','SAN JERONIMO'),(273,'030318','APURIMAC','ANDAHUAYLAS','SAN MIGUEL DE CHACCRAMPA'),(274,'030315','APURIMAC','ANDAHUAYLAS','SANTA MARIA DE CHICMO'),(275,'030311','APURIMAC','ANDAHUAYLAS','TALAVERA'),(276,'030316','APURIMAC','ANDAHUAYLAS','TUMAY HUARACA'),(277,'030312','APURIMAC','ANDAHUAYLAS','TURPO'),(278,'030319','APURIMAC','ANDAHUAYLAS','KAQUIABAMBA'),(279,'030320','APURIMAC','ANDAHUAYLAS','JOSE MARIA ARGUEDAS'),(280,'030401','APURIMAC','ANTABAMBA','ANTABAMBA'),(281,'030402','APURIMAC','ANTABAMBA','EL ORO'),(282,'030403','APURIMAC','ANTABAMBA','HUAQUIRCA'),(283,'030404','APURIMAC','ANTABAMBA','JUAN ESPINOZA MEDRANO'),(284,'030405','APURIMAC','ANTABAMBA','OROPESA'),(285,'030406','APURIMAC','ANTABAMBA','PACHACONAS'),(286,'030407','APURIMAC','ANTABAMBA','SABAINO'),(287,'030201','APURIMAC','AYMARAES','CHALHUANCA'),(288,'030202','APURIMAC','AYMARAES','CAPAYA'),(289,'030203','APURIMAC','AYMARAES','CARAYBAMBA'),(290,'030206','APURIMAC','AYMARAES','CHAPIMARCA'),(291,'030204','APURIMAC','AYMARAES','COLCABAMBA'),(292,'030205','APURIMAC','AYMARAES','COTARUSE'),(293,'030207','APURIMAC','AYMARAES','HUAYLLO'),(294,'030217','APURIMAC','AYMARAES','JUSTO APU SAHUARAURA'),(295,'030208','APURIMAC','AYMARAES','LUCRE'),(296,'030209','APURIMAC','AYMARAES','POCOHUANCA'),(297,'030216','APURIMAC','AYMARAES','SAN JUAN DE CHACÑA'),(298,'030210','APURIMAC','AYMARAES','SAÑAYCA'),(299,'030211','APURIMAC','AYMARAES','SORAYA'),(300,'030212','APURIMAC','AYMARAES','TAPAIRIHUA'),(301,'030213','APURIMAC','AYMARAES','TINTAY'),(302,'030214','APURIMAC','AYMARAES','TORAYA'),(303,'030215','APURIMAC','AYMARAES','YANACA'),(304,'030501','APURIMAC','COTABAMBAS','TAMBOBAMBA'),(305,'030503','APURIMAC','COTABAMBAS','COTABAMBAS'),(306,'030502','APURIMAC','COTABAMBAS','COYLLURQUI'),(307,'030504','APURIMAC','COTABAMBAS','HAQUIRA'),(308,'030505','APURIMAC','COTABAMBAS','MARA'),(309,'030506','APURIMAC','COTABAMBAS','CHALLHUAHUACHO'),(310,'030701','APURIMAC','CHINCHEROS','CHINCHEROS'),(311,'030705','APURIMAC','CHINCHEROS','ANCO-HUALLO'),(312,'030704','APURIMAC','CHINCHEROS','COCHARCAS'),(313,'030706','APURIMAC','CHINCHEROS','HUACCANA'),(314,'030703','APURIMAC','CHINCHEROS','OCOBAMBA'),(315,'030702','APURIMAC','CHINCHEROS','ONGOY'),(316,'030707','APURIMAC','CHINCHEROS','URANMARCA'),(317,'030708','APURIMAC','CHINCHEROS','RANRACANCHA'),(318,'030709','APURIMAC','CHINCHEROS','ROCCHACC'),(319,'030710','APURIMAC','CHINCHEROS','EL PORVENIR'),(320,'030711','APURIMAC','CHINCHEROS','LOS CHANKAS'),(321,'030601','APURIMAC','GRAU','CHUQUIBAMBILLA'),(322,'030602','APURIMAC','GRAU','CURPAHUASI'),(323,'030605','APURIMAC','GRAU','GAMARRA'),(324,'030603','APURIMAC','GRAU','HUAYLLATI'),(325,'030604','APURIMAC','GRAU','MAMARA'),(326,'030606','APURIMAC','GRAU','MICAELA BASTIDAS'),(327,'030608','APURIMAC','GRAU','PATAYPAMPA'),(328,'030607','APURIMAC','GRAU','PROGRESO'),(329,'030609','APURIMAC','GRAU','SAN ANTONIO'),(330,'030613','APURIMAC','GRAU','SANTA ROSA'),(331,'030610','APURIMAC','GRAU','TURPAY'),(332,'030611','APURIMAC','GRAU','VILCABAMBA'),(333,'030612','APURIMAC','GRAU','VIRUNDO'),(334,'030614','APURIMAC','GRAU','CURASCO'),(335,'040101','AREQUIPA','AREQUIPA','AREQUIPA'),(336,'040128','AREQUIPA','AREQUIPA','ALTO SELVA ALEGRE'),(337,'040102','AREQUIPA','AREQUIPA','CAYMA'),(338,'040103','AREQUIPA','AREQUIPA','CERRO COLORADO'),(339,'040104','AREQUIPA','AREQUIPA','CHARACATO'),(340,'040105','AREQUIPA','AREQUIPA','CHIGUATA'),(341,'040127','AREQUIPA','AREQUIPA','JACOBO HUNTER'),(342,'040106','AREQUIPA','AREQUIPA','LA JOYA'),(343,'040126','AREQUIPA','AREQUIPA','MARIANO MELGAR'),(344,'040107','AREQUIPA','AREQUIPA','MIRAFLORES'),(345,'040108','AREQUIPA','AREQUIPA','MOLLEBAYA'),(346,'040109','AREQUIPA','AREQUIPA','PAUCARPATA'),(347,'040110','AREQUIPA','AREQUIPA','POCSI'),(348,'040111','AREQUIPA','AREQUIPA','POLOBAYA'),(349,'040112','AREQUIPA','AREQUIPA','QUEQUEÑA'),(350,'040113','AREQUIPA','AREQUIPA','SABANDIA'),(351,'040114','AREQUIPA','AREQUIPA','SACHACA'),(352,'040115','AREQUIPA','AREQUIPA','SAN JUAN DE SIGUAS'),(353,'040116','AREQUIPA','AREQUIPA','SAN JUAN DE TARUCANI'),(354,'040117','AREQUIPA','AREQUIPA','SANTA ISABEL DE SIGUAS'),(355,'040118','AREQUIPA','AREQUIPA','SANTA RITA DE SIGUAS'),(356,'040119','AREQUIPA','AREQUIPA','SOCABAYA'),(357,'040120','AREQUIPA','AREQUIPA','TIABAYA'),(358,'040121','AREQUIPA','AREQUIPA','UCHUMAYO'),(359,'040122','AREQUIPA','AREQUIPA','VITOR'),(360,'040123','AREQUIPA','AREQUIPA','YANAHUARA'),(361,'040124','AREQUIPA','AREQUIPA','YARABAMBA'),(362,'040125','AREQUIPA','AREQUIPA','YURA'),(363,'040129','AREQUIPA','AREQUIPA','JOSE LUIS BUSTAMANTE Y RIVERO'),(364,'040301','AREQUIPA','CAMANA','CAMANA'),(365,'040302','AREQUIPA','CAMANA','JOSE MARIA QUIMPER'),(366,'040303','AREQUIPA','CAMANA','MARIANO NICOLAS VALCARCEL'),(367,'040304','AREQUIPA','CAMANA','MARISCAL CACERES'),(368,'040305','AREQUIPA','CAMANA','NICOLAS DE PIEROLA'),(369,'040306','AREQUIPA','CAMANA','OCOÑA'),(370,'040307','AREQUIPA','CAMANA','QUILCA'),(371,'040308','AREQUIPA','CAMANA','SAMUEL PASTOR'),(372,'040401','AREQUIPA','CARAVELI','CARAVELI'),(373,'040402','AREQUIPA','CARAVELI','ACARI'),(374,'040403','AREQUIPA','CARAVELI','ATICO'),(375,'040404','AREQUIPA','CARAVELI','ATIQUIPA'),(376,'040405','AREQUIPA','CARAVELI','BELLA UNION'),(377,'040406','AREQUIPA','CARAVELI','CAHUACHO'),(378,'040407','AREQUIPA','CARAVELI','CHALA'),(379,'040408','AREQUIPA','CARAVELI','CHAPARRA'),(380,'040409','AREQUIPA','CARAVELI','HUANUHUANU'),(381,'040410','AREQUIPA','CARAVELI','JAQUI'),(382,'040411','AREQUIPA','CARAVELI','LOMAS'),(383,'040412','AREQUIPA','CARAVELI','QUICACHA'),(384,'040413','AREQUIPA','CARAVELI','YAUCA'),(385,'040501','AREQUIPA','CASTILLA','APLAO'),(386,'040502','AREQUIPA','CASTILLA','ANDAGUA'),(387,'040503','AREQUIPA','CASTILLA','AYO'),(388,'040504','AREQUIPA','CASTILLA','CHACHAS'),(389,'040505','AREQUIPA','CASTILLA','CHILCAYMARCA'),(390,'040506','AREQUIPA','CASTILLA','CHOCO'),(391,'040507','AREQUIPA','CASTILLA','HUANCARQUI'),(392,'040508','AREQUIPA','CASTILLA','MACHAGUAY'),(393,'040509','AREQUIPA','CASTILLA','ORCOPAMPA'),(394,'040510','AREQUIPA','CASTILLA','PAMPACOLCA'),(395,'040511','AREQUIPA','CASTILLA','TIPAN'),(396,'040513','AREQUIPA','CASTILLA','UÑON'),(397,'040512','AREQUIPA','CASTILLA','URACA'),(398,'040514','AREQUIPA','CASTILLA','VIRACO'),(399,'040201','AREQUIPA','CAYLLOMA','CHIVAY'),(400,'040202','AREQUIPA','CAYLLOMA','ACHOMA'),(401,'040203','AREQUIPA','CAYLLOMA','CABANACONDE'),(402,'040205','AREQUIPA','CAYLLOMA','CALLALLI'),(403,'040204','AREQUIPA','CAYLLOMA','CAYLLOMA'),(404,'040206','AREQUIPA','CAYLLOMA','COPORAQUE'),(405,'040207','AREQUIPA','CAYLLOMA','HUAMBO'),(406,'040208','AREQUIPA','CAYLLOMA','HUANCA'),(407,'040209','AREQUIPA','CAYLLOMA','ICHUPAMPA'),(408,'040210','AREQUIPA','CAYLLOMA','LARI'),(409,'040211','AREQUIPA','CAYLLOMA','LLUTA'),(410,'040212','AREQUIPA','CAYLLOMA','MACA'),(411,'040213','AREQUIPA','CAYLLOMA','MADRIGAL'),(412,'040214','AREQUIPA','CAYLLOMA','SAN ANTONIO DE CHUCA'),(413,'040215','AREQUIPA','CAYLLOMA','SIBAYO'),(414,'040216','AREQUIPA','CAYLLOMA','TAPAY'),(415,'040217','AREQUIPA','CAYLLOMA','TISCO'),(416,'040218','AREQUIPA','CAYLLOMA','TUTI'),(417,'040219','AREQUIPA','CAYLLOMA','YANQUE'),(418,'040220','AREQUIPA','CAYLLOMA','MAJES'),(419,'040601','AREQUIPA','CONDESUYOS','CHUQUIBAMBA'),(420,'040602','AREQUIPA','CONDESUYOS','ANDARAY'),(421,'040603','AREQUIPA','CONDESUYOS','CAYARANI'),(422,'040604','AREQUIPA','CONDESUYOS','CHICHAS'),(423,'040605','AREQUIPA','CONDESUYOS','IRAY'),(424,'040608','AREQUIPA','CONDESUYOS','RIO GRANDE'),(425,'040606','AREQUIPA','CONDESUYOS','SALAMANCA'),(426,'040607','AREQUIPA','CONDESUYOS','YANAQUIHUA'),(427,'040701','AREQUIPA','ISLAY','MOLLENDO'),(428,'040702','AREQUIPA','ISLAY','COCACHACRA'),(429,'040703','AREQUIPA','ISLAY','DEAN VALDIVIA'),(430,'040704','AREQUIPA','ISLAY','ISLAY'),(431,'040705','AREQUIPA','ISLAY','MEJIA'),(432,'040706','AREQUIPA','ISLAY','PUNTA DE BOMBON'),(433,'040801','AREQUIPA','LA UNION','COTAHUASI'),(434,'040802','AREQUIPA','LA UNION','ALCA'),(435,'040803','AREQUIPA','LA UNION','CHARCANA'),(436,'040804','AREQUIPA','LA UNION','HUAYNACOTAS'),(437,'040805','AREQUIPA','LA UNION','PAMPAMARCA'),(438,'040806','AREQUIPA','LA UNION','PUYCA'),(439,'040807','AREQUIPA','LA UNION','QUECHUALLA'),(440,'040808','AREQUIPA','LA UNION','SAYLA'),(441,'040809','AREQUIPA','LA UNION','TAURIA'),(442,'040810','AREQUIPA','LA UNION','TOMEPAMPA'),(443,'040811','AREQUIPA','LA UNION','TORO'),(444,'050101','AYACUCHO','HUAMANGA','AYACUCHO'),(445,'050111','AYACUCHO','HUAMANGA','ACOCRO'),(446,'050102','AYACUCHO','HUAMANGA','ACOS VINCHOS'),(447,'050103','AYACUCHO','HUAMANGA','CARMEN ALTO'),(448,'050104','AYACUCHO','HUAMANGA','CHIARA'),(449,'050113','AYACUCHO','HUAMANGA','OCROS'),(450,'050114','AYACUCHO','HUAMANGA','PACAYCASA'),(451,'050105','AYACUCHO','HUAMANGA','QUINUA'),(452,'050106','AYACUCHO','HUAMANGA','SAN JOSE DE TICLLAS'),(453,'050107','AYACUCHO','HUAMANGA','SAN JUAN BAUTISTA'),(454,'050108','AYACUCHO','HUAMANGA','SANTIAGO DE PISCHA'),(455,'050112','AYACUCHO','HUAMANGA','SOCOS'),(456,'050110','AYACUCHO','HUAMANGA','TAMBILLO'),(457,'050109','AYACUCHO','HUAMANGA','VINCHOS'),(458,'050115','AYACUCHO','HUAMANGA','JESUS NAZARENO'),(459,'050116','AYACUCHO','HUAMANGA','ANDRES AVELINO CACERES DORREGARAY'),(460,'050201','AYACUCHO','CANGALLO','CANGALLO'),(461,'050204','AYACUCHO','CANGALLO','CHUSCHI'),(462,'050206','AYACUCHO','CANGALLO','LOS MOROCHUCOS'),(463,'050211','AYACUCHO','CANGALLO','MARIA PARADO DE BELLIDO'),(464,'050207','AYACUCHO','CANGALLO','PARAS'),(465,'050208','AYACUCHO','CANGALLO','TOTOS'),(466,'050801','AYACUCHO','HUANCA SANCOS','SANCOS'),(467,'050804','AYACUCHO','HUANCA SANCOS','CARAPO'),(468,'050802','AYACUCHO','HUANCA SANCOS','SACSAMARCA'),(469,'050803','AYACUCHO','HUANCA SANCOS','SANTIAGO DE LUCANAMARCA'),(470,'050301','AYACUCHO','HUANTA','HUANTA'),(471,'050302','AYACUCHO','HUANTA','AYAHUANCO'),(472,'050303','AYACUCHO','HUANTA','HUAMANGUILLA'),(473,'050304','AYACUCHO','HUANTA','IGUAIN'),(474,'050305','AYACUCHO','HUANTA','LURICOCHA'),(475,'050307','AYACUCHO','HUANTA','SANTILLANA'),(476,'050308','AYACUCHO','HUANTA','SIVIA'),(477,'050309','AYACUCHO','HUANTA','LLOCHEGUA'),(478,'050310','AYACUCHO','HUANTA','CANAYRE'),(479,'050311','AYACUCHO','HUANTA','UCHURACCAY'),(480,'050312','AYACUCHO','HUANTA','PUCACOLPA'),(481,'050313','AYACUCHO','HUANTA','CHACA'),(482,'050401','AYACUCHO','LA MAR','SAN MIGUEL'),(483,'050402','AYACUCHO','LA MAR','ANCO'),(484,'050403','AYACUCHO','LA MAR','AYNA'),(485,'050404','AYACUCHO','LA MAR','CHILCAS'),(486,'050405','AYACUCHO','LA MAR','CHUNGUI'),(487,'050407','AYACUCHO','LA MAR','LUIS CARRANZA'),(488,'050408','AYACUCHO','LA MAR','SANTA ROSA'),(489,'050406','AYACUCHO','LA MAR','TAMBO'),(490,'050409','AYACUCHO','LA MAR','SAMUGARI'),(491,'050410','AYACUCHO','LA MAR','ANCHIHUAY'),(492,'050411','AYACUCHO','LA MAR','ORONCCOY'),(493,'050501','AYACUCHO','LUCANAS','PUQUIO'),(494,'050502','AYACUCHO','LUCANAS','AUCARA'),(495,'050503','AYACUCHO','LUCANAS','CABANA'),(496,'050504','AYACUCHO','LUCANAS','CARMEN SALCEDO'),(497,'050506','AYACUCHO','LUCANAS','CHAVIÑA'),(498,'050508','AYACUCHO','LUCANAS','CHIPAO'),(499,'050510','AYACUCHO','LUCANAS','HUAC-HUAS'),(500,'050511','AYACUCHO','LUCANAS','LARAMATE'),(501,'050512','AYACUCHO','LUCANAS','LEONCIO PRADO'),(502,'050514','AYACUCHO','LUCANAS','LLAUTA'),(503,'050513','AYACUCHO','LUCANAS','LUCANAS'),(504,'050516','AYACUCHO','LUCANAS','OCAÑA'),(505,'050517','AYACUCHO','LUCANAS','OTOCA'),(506,'050529','AYACUCHO','LUCANAS','SAISA'),(507,'050532','AYACUCHO','LUCANAS','SAN CRISTOBAL'),(508,'050521','AYACUCHO','LUCANAS','SAN JUAN'),(509,'050522','AYACUCHO','LUCANAS','SAN PEDRO'),(510,'050531','AYACUCHO','LUCANAS','SAN PEDRO DE PALCO'),(511,'050520','AYACUCHO','LUCANAS','SANCOS'),(512,'050524','AYACUCHO','LUCANAS','SANTA ANA DE HUAYCAHUACHO'),(513,'050525','AYACUCHO','LUCANAS','SANTA LUCIA'),(514,'050601','AYACUCHO','PARINACOCHAS','CORACORA'),(515,'050605','AYACUCHO','PARINACOCHAS','CHUMPI'),(516,'050604','AYACUCHO','PARINACOCHAS','CORONEL CASTAÑEDA'),(517,'050608','AYACUCHO','PARINACOCHAS','PACAPAUSA'),(518,'050611','AYACUCHO','PARINACOCHAS','PULLO'),(519,'050612','AYACUCHO','PARINACOCHAS','PUYUSCA'),(520,'050615','AYACUCHO','PARINACOCHAS','SAN FRANCISCO DE RAVACAYCO'),(521,'050616','AYACUCHO','PARINACOCHAS','UPAHUACHO'),(522,'051001','AYACUCHO','PAUCAR DEL SARA SARA','PAUSA'),(523,'051002','AYACUCHO','PAUCAR DEL SARA SARA','COLTA'),(524,'051003','AYACUCHO','PAUCAR DEL SARA SARA','CORCULLA'),(525,'051004','AYACUCHO','PAUCAR DEL SARA SARA','LAMPA'),(526,'051005','AYACUCHO','PAUCAR DEL SARA SARA','MARCABAMBA'),(527,'051006','AYACUCHO','PAUCAR DEL SARA SARA','OYOLO'),(528,'051007','AYACUCHO','PAUCAR DEL SARA SARA','PARARCA'),(529,'051008','AYACUCHO','PAUCAR DEL SARA SARA','SAN JAVIER DE ALPABAMBA'),(530,'051009','AYACUCHO','PAUCAR DEL SARA SARA','SAN JOSE DE USHUA'),(531,'051010','AYACUCHO','PAUCAR DEL SARA SARA','SARA SARA'),(532,'051101','AYACUCHO','SUCRE','QUEROBAMBA'),(533,'051102','AYACUCHO','SUCRE','BELEN'),(534,'051103','AYACUCHO','SUCRE','CHALCOS'),(535,'051110','AYACUCHO','SUCRE','CHILCAYOC'),(536,'051109','AYACUCHO','SUCRE','HUACAÑA'),(537,'051111','AYACUCHO','SUCRE','MORCOLLA'),(538,'051105','AYACUCHO','SUCRE','PAICO'),(539,'051107','AYACUCHO','SUCRE','SAN PEDRO DE LARCAY'),(540,'051104','AYACUCHO','SUCRE','SAN SALVADOR DE QUIJE'),(541,'051106','AYACUCHO','SUCRE','SANTIAGO DE PAUCARAY'),(542,'051108','AYACUCHO','SUCRE','SORAS'),(543,'050701','AYACUCHO','VICTOR FAJARDO','HUANCAPI'),(544,'050702','AYACUCHO','VICTOR FAJARDO','ALCAMENCA'),(545,'050703','AYACUCHO','VICTOR FAJARDO','APONGO'),(546,'050715','AYACUCHO','VICTOR FAJARDO','ASQUIPATA'),(547,'050704','AYACUCHO','VICTOR FAJARDO','CANARIA'),(548,'050706','AYACUCHO','VICTOR FAJARDO','CAYARA'),(549,'050707','AYACUCHO','VICTOR FAJARDO','COLCA'),(550,'050709','AYACUCHO','VICTOR FAJARDO','HUAMANQUIQUIA'),(551,'050710','AYACUCHO','VICTOR FAJARDO','HUANCARAYLLA'),(552,'050708','AYACUCHO','VICTOR FAJARDO','HUAYA'),(553,'050713','AYACUCHO','VICTOR FAJARDO','SARHUA'),(554,'050714','AYACUCHO','VICTOR FAJARDO','VILCANCHOS'),(555,'050901','AYACUCHO','VILCAS HUAMAN','VILCAS HUAMAN'),(556,'050903','AYACUCHO','VILCAS HUAMAN','ACCOMARCA'),(557,'050904','AYACUCHO','VILCAS HUAMAN','CARHUANCA'),(558,'050905','AYACUCHO','VILCAS HUAMAN','CONCEPCION'),(559,'050906','AYACUCHO','VILCAS HUAMAN','HUAMBALPA'),(560,'050908','AYACUCHO','VILCAS HUAMAN','INDEPENDENCIA'),(561,'050907','AYACUCHO','VILCAS HUAMAN','SAURAMA'),(562,'050902','AYACUCHO','VILCAS HUAMAN','VISCHONGO'),(563,'060101','CAJAMARCA','CAJAMARCA','CAJAMARCA'),(564,'060102','CAJAMARCA','CAJAMARCA','ASUNCION'),(565,'060104','CAJAMARCA','CAJAMARCA','CHETILLA'),(566,'060103','CAJAMARCA','CAJAMARCA','COSPAN'),(567,'060105','CAJAMARCA','CAJAMARCA','ENCAÑADA'),(568,'060106','CAJAMARCA','CAJAMARCA','JESUS'),(569,'060108','CAJAMARCA','CAJAMARCA','LLACANORA'),(570,'060107','CAJAMARCA','CAJAMARCA','LOS BAÑOS DEL INCA'),(571,'060109','CAJAMARCA','CAJAMARCA','MAGDALENA'),(572,'060110','CAJAMARCA','CAJAMARCA','MATARA'),(573,'060111','CAJAMARCA','CAJAMARCA','NAMORA'),(574,'060112','CAJAMARCA','CAJAMARCA','SAN JUAN'),(575,'060201','CAJAMARCA','CAJABAMBA','CAJABAMBA'),(576,'060202','CAJAMARCA','CAJABAMBA','CACHACHI'),(577,'060203','CAJAMARCA','CAJABAMBA','CONDEBAMBA'),(578,'060205','CAJAMARCA','CAJABAMBA','SITACOCHA'),(579,'060301','CAJAMARCA','CELENDIN','CELENDIN'),(580,'060303','CAJAMARCA','CELENDIN','CHUMUCH'),(581,'060302','CAJAMARCA','CELENDIN','CORTEGANA'),(582,'060304','CAJAMARCA','CELENDIN','HUASMIN'),(583,'060305','CAJAMARCA','CELENDIN','JORGE CHAVEZ'),(584,'060306','CAJAMARCA','CELENDIN','JOSE GALVEZ'),(585,'060307','CAJAMARCA','CELENDIN','MIGUEL IGLESIAS'),(586,'060308','CAJAMARCA','CELENDIN','OXAMARCA'),(587,'060309','CAJAMARCA','CELENDIN','SOROCHUCO'),(588,'060310','CAJAMARCA','CELENDIN','SUCRE'),(589,'060311','CAJAMARCA','CELENDIN','UTCO'),(590,'060312','CAJAMARCA','CELENDIN','LA LIBERTAD DE PALLAN'),(591,'060601','CAJAMARCA','CHOTA','CHOTA'),(592,'060602','CAJAMARCA','CHOTA','ANGUIA'),(593,'060605','CAJAMARCA','CHOTA','CHADIN'),(594,'060606','CAJAMARCA','CHOTA','CHIGUIRIP'),(595,'060607','CAJAMARCA','CHOTA','CHIMBAN'),(596,'060618','CAJAMARCA','CHOTA','CHOROPAMPA'),(597,'060603','CAJAMARCA','CHOTA','COCHABAMBA'),(598,'060604','CAJAMARCA','CHOTA','CONCHAN'),(599,'060608','CAJAMARCA','CHOTA','HUAMBOS'),(600,'060609','CAJAMARCA','CHOTA','LAJAS'),(601,'060610','CAJAMARCA','CHOTA','LLAMA'),(602,'060611','CAJAMARCA','CHOTA','MIRACOSTA'),(603,'060612','CAJAMARCA','CHOTA','PACCHA'),(604,'060613','CAJAMARCA','CHOTA','PION'),(605,'060614','CAJAMARCA','CHOTA','QUEROCOTO'),(606,'060617','CAJAMARCA','CHOTA','SAN JUAN DE LICUPIS'),(607,'060615','CAJAMARCA','CHOTA','TACABAMBA'),(608,'060616','CAJAMARCA','CHOTA','TOCMOCHE'),(609,'060619','CAJAMARCA','CHOTA','CHALAMARCA'),(610,'060401','CAJAMARCA','CONTUMAZA','CONTUMAZA'),(611,'060403','CAJAMARCA','CONTUMAZA','CHILETE'),(612,'060406','CAJAMARCA','CONTUMAZA','CUPISNIQUE'),(613,'060404','CAJAMARCA','CONTUMAZA','GUZMANGO'),(614,'060405','CAJAMARCA','CONTUMAZA','SAN BENITO'),(615,'060409','CAJAMARCA','CONTUMAZA','SANTA CRUZ DE TOLEDO'),(616,'060407','CAJAMARCA','CONTUMAZA','TANTARICA'),(617,'060408','CAJAMARCA','CONTUMAZA','YONAN'),(618,'060501','CAJAMARCA','CUTERVO','CUTERVO'),(619,'060502','CAJAMARCA','CUTERVO','CALLAYUC'),(620,'060504','CAJAMARCA','CUTERVO','CHOROS'),(621,'060503','CAJAMARCA','CUTERVO','CUJILLO'),(622,'060505','CAJAMARCA','CUTERVO','LA RAMADA'),(623,'060506','CAJAMARCA','CUTERVO','PIMPINGOS'),(624,'060507','CAJAMARCA','CUTERVO','QUEROCOTILLO'),(625,'060508','CAJAMARCA','CUTERVO','SAN ANDRES DE CUTERVO'),(626,'060509','CAJAMARCA','CUTERVO','SAN JUAN DE CUTERVO'),(627,'060510','CAJAMARCA','CUTERVO','SAN LUIS DE LUCMA'),(628,'060511','CAJAMARCA','CUTERVO','SANTA CRUZ'),(629,'060512','CAJAMARCA','CUTERVO','SANTO DOMINGO DE LA CAPILLA'),(630,'060513','CAJAMARCA','CUTERVO','SANTO TOMAS'),(631,'060514','CAJAMARCA','CUTERVO','SOCOTA'),(632,'060515','CAJAMARCA','CUTERVO','TORIBIO CASANOVA'),(633,'060701','CAJAMARCA','HUALGAYOC','BAMBAMARCA'),(634,'060702','CAJAMARCA','HUALGAYOC','CHUGUR'),(635,'060703','CAJAMARCA','HUALGAYOC','HUALGAYOC'),(636,'060801','CAJAMARCA','JAEN','JAEN'),(637,'060802','CAJAMARCA','JAEN','BELLAVISTA'),(638,'060804','CAJAMARCA','JAEN','CHONTALI'),(639,'060803','CAJAMARCA','JAEN','COLASAY'),(640,'060812','CAJAMARCA','JAEN','HUABAL'),(641,'060811','CAJAMARCA','JAEN','LAS PIRIAS'),(642,'060805','CAJAMARCA','JAEN','POMAHUACA'),(643,'060806','CAJAMARCA','JAEN','PUCARA'),(644,'060807','CAJAMARCA','JAEN','SALLIQUE'),(645,'060808','CAJAMARCA','JAEN','SAN FELIPE'),(646,'060809','CAJAMARCA','JAEN','SAN JOSE DEL ALTO'),(647,'060810','CAJAMARCA','JAEN','SANTA ROSA'),(648,'061101','CAJAMARCA','SAN IGNACIO','SAN IGNACIO'),(649,'061102','CAJAMARCA','SAN IGNACIO','CHIRINOS'),(650,'061103','CAJAMARCA','SAN IGNACIO','HUARANGO'),(651,'061105','CAJAMARCA','SAN IGNACIO','LA COIPA'),(652,'061104','CAJAMARCA','SAN IGNACIO','NAMBALLE'),(653,'061106','CAJAMARCA','SAN IGNACIO','SAN JOSE DE LOURDES'),(654,'061107','CAJAMARCA','SAN IGNACIO','TABACONAS'),(655,'061201','CAJAMARCA','SAN MARCOS','PEDRO GALVEZ'),(656,'061207','CAJAMARCA','SAN MARCOS','CHANCAY'),(657,'061205','CAJAMARCA','SAN MARCOS','EDUARDO VILLANUEVA'),(658,'061203','CAJAMARCA','SAN MARCOS','GREGORIO PITA'),(659,'061202','CAJAMARCA','SAN MARCOS','ICHOCAN'),(660,'061204','CAJAMARCA','SAN MARCOS','JOSE MANUEL QUIROZ'),(661,'061206','CAJAMARCA','SAN MARCOS','JOSE SABOGAL'),(662,'061001','CAJAMARCA','SAN MIGUEL','SAN MIGUEL'),(663,'061013','CAJAMARCA','SAN MIGUEL','BOLIVAR'),(664,'061002','CAJAMARCA','SAN MIGUEL','CALQUIS'),(665,'061012','CAJAMARCA','SAN MIGUEL','CATILLUC'),(666,'061009','CAJAMARCA','SAN MIGUEL','EL PRADO'),(667,'061003','CAJAMARCA','SAN MIGUEL','LA FLORIDA'),(668,'061004','CAJAMARCA','SAN MIGUEL','LLAPA'),(669,'061005','CAJAMARCA','SAN MIGUEL','NANCHOC'),(670,'061006','CAJAMARCA','SAN MIGUEL','NIEPOS'),(671,'061007','CAJAMARCA','SAN MIGUEL','SAN GREGORIO'),(672,'061008','CAJAMARCA','SAN MIGUEL','SAN SILVESTRE DE COCHAN'),(673,'061011','CAJAMARCA','SAN MIGUEL','TONGOD'),(674,'061010','CAJAMARCA','SAN MIGUEL','UNION AGUA BLANCA'),(675,'061301','CAJAMARCA','SAN PABLO','SAN PABLO'),(676,'061302','CAJAMARCA','SAN PABLO','SAN BERNARDINO'),(677,'061303','CAJAMARCA','SAN PABLO','SAN LUIS'),(678,'061304','CAJAMARCA','SAN PABLO','TUMBADEN'),(679,'060901','CAJAMARCA','SANTA CRUZ','SANTA CRUZ'),(680,'060910','CAJAMARCA','SANTA CRUZ','ANDABAMBA'),(681,'060902','CAJAMARCA','SANTA CRUZ','CATACHE'),(682,'060903','CAJAMARCA','SANTA CRUZ','CHANCAYBAÑOS'),(683,'060904','CAJAMARCA','SANTA CRUZ','LA ESPERANZA'),(684,'060905','CAJAMARCA','SANTA CRUZ','NINABAMBA'),(685,'060906','CAJAMARCA','SANTA CRUZ','PULAN'),(686,'060911','CAJAMARCA','SANTA CRUZ','SAUCEPAMPA'),(687,'060907','CAJAMARCA','SANTA CRUZ','SEXI'),(688,'060908','CAJAMARCA','SANTA CRUZ','UTICYACU'),(689,'060909','CAJAMARCA','SANTA CRUZ','YAUYUCAN'),(690,'240101','CALLAO','CALLAO','CALLAO'),(691,'240102','CALLAO','CALLAO','BELLAVISTA'),(692,'240104','CALLAO','CALLAO','CARMEN DE LA LEGUA REYNOSO'),(693,'240105','CALLAO','CALLAO','LA PERLA'),(694,'240103','CALLAO','CALLAO','LA PUNTA'),(695,'240106','CALLAO','CALLAO','VENTANILLA'),(696,'240107','CALLAO','CALLAO','MI PERU'),(697,'070101','CUSCO','CUSCO','CUSCO'),(698,'070102','CUSCO','CUSCO','CCORCA'),(699,'070103','CUSCO','CUSCO','POROY'),(700,'070104','CUSCO','CUSCO','SAN JERONIMO'),(701,'070105','CUSCO','CUSCO','SAN SEBASTIAN'),(702,'070106','CUSCO','CUSCO','SANTIAGO'),(703,'070107','CUSCO','CUSCO','SAYLLA'),(704,'070108','CUSCO','CUSCO','WANCHAQ'),(705,'070201','CUSCO','ACOMAYO','ACOMAYO'),(706,'070202','CUSCO','ACOMAYO','ACOPIA'),(707,'070203','CUSCO','ACOMAYO','ACOS'),(708,'070207','CUSCO','ACOMAYO','MOSOC LLACTA'),(709,'070204','CUSCO','ACOMAYO','POMACANCHI'),(710,'070205','CUSCO','ACOMAYO','RONDOCAN'),(711,'070206','CUSCO','ACOMAYO','SANGARARA'),(712,'070301','CUSCO','ANTA','ANTA'),(713,'070309','CUSCO','ANTA','ANCAHUASI'),(714,'070308','CUSCO','ANTA','CACHIMAYO'),(715,'070302','CUSCO','ANTA','CHINCHAYPUJIO'),(716,'070303','CUSCO','ANTA','HUAROCONDO'),(717,'070304','CUSCO','ANTA','LIMATAMBO'),(718,'070305','CUSCO','ANTA','MOLLEPATA'),(719,'070306','CUSCO','ANTA','PUCYURA'),(720,'070307','CUSCO','ANTA','ZURITE'),(721,'070401','CUSCO','CALCA','CALCA'),(722,'070402','CUSCO','CALCA','COYA'),(723,'070403','CUSCO','CALCA','LAMAY'),(724,'070404','CUSCO','CALCA','LARES'),(725,'070405','CUSCO','CALCA','PISAC'),(726,'070406','CUSCO','CALCA','SAN SALVADOR'),(727,'070407','CUSCO','CALCA','TARAY'),(728,'070408','CUSCO','CALCA','YANATILE'),(729,'070501','CUSCO','CANAS','YANAOCA'),(730,'070502','CUSCO','CANAS','CHECCA'),(731,'070503','CUSCO','CANAS','KUNTURKANKI'),(732,'070504','CUSCO','CANAS','LANGUI'),(733,'070505','CUSCO','CANAS','LAYO'),(734,'070506','CUSCO','CANAS','PAMPAMARCA'),(735,'070507','CUSCO','CANAS','QUEHUE'),(736,'070508','CUSCO','CANAS','TUPAC AMARU'),(737,'070601','CUSCO','CANCHIS','SICUANI'),(738,'070603','CUSCO','CANCHIS','CHECACUPE'),(739,'070602','CUSCO','CANCHIS','COMBAPATA'),(740,'070604','CUSCO','CANCHIS','MARANGANI'),(741,'070605','CUSCO','CANCHIS','PITUMARCA'),(742,'070606','CUSCO','CANCHIS','SAN PABLO'),(743,'070607','CUSCO','CANCHIS','SAN PEDRO'),(744,'070608','CUSCO','CANCHIS','TINTA'),(745,'070701','CUSCO','CHUMBIVILCAS','SANTO TOMAS'),(746,'070702','CUSCO','CHUMBIVILCAS','CAPACMARCA'),(747,'070704','CUSCO','CHUMBIVILCAS','CHAMACA'),(748,'070703','CUSCO','CHUMBIVILCAS','COLQUEMARCA'),(749,'070705','CUSCO','CHUMBIVILCAS','LIVITACA'),(750,'070706','CUSCO','CHUMBIVILCAS','LLUSCO'),(751,'070707','CUSCO','CHUMBIVILCAS','QUIÑOTA'),(752,'070708','CUSCO','CHUMBIVILCAS','VELILLE'),(753,'070801','CUSCO','ESPINAR','ESPINAR'),(754,'070802','CUSCO','ESPINAR','CONDOROMA'),(755,'070803','CUSCO','ESPINAR','COPORAQUE'),(756,'070804','CUSCO','ESPINAR','OCORURO'),(757,'070805','CUSCO','ESPINAR','PALLPATA'),(758,'070806','CUSCO','ESPINAR','PICHIGUA'),(759,'070807','CUSCO','ESPINAR','SUYCKUTAMBO'),(760,'070808','CUSCO','ESPINAR','ALTO PICHIGUA'),(761,'070901','CUSCO','LA CONVENCION','SANTA ANA'),(762,'070902','CUSCO','LA CONVENCION','ECHARATE'),(763,'070903','CUSCO','LA CONVENCION','HUAYOPATA'),(764,'070904','CUSCO','LA CONVENCION','MARANURA'),(765,'070905','CUSCO','LA CONVENCION','OCOBAMBA'),(766,'070908','CUSCO','LA CONVENCION','QUELLOUNO'),(767,'070909','CUSCO','LA CONVENCION','QUIMBIRI'),(768,'070906','CUSCO','LA CONVENCION','SANTA TERESA'),(769,'070907','CUSCO','LA CONVENCION','VILCABAMBA'),(770,'070910','CUSCO','LA CONVENCION','PICHARI'),(771,'070911','CUSCO','LA CONVENCION','INKAWASI'),(772,'070912','CUSCO','LA CONVENCION','VILLA VIRGEN'),(773,'070913','CUSCO','LA CONVENCION','VILLA KINTIARINA'),(774,'070915','CUSCO','LA CONVENCION','MEGANTONI'),(775,'071001','CUSCO','PARURO','PARURO'),(776,'071002','CUSCO','PARURO','ACCHA'),(777,'071003','CUSCO','PARURO','CCAPI'),(778,'071004','CUSCO','PARURO','COLCHA'),(779,'071005','CUSCO','PARURO','HUANOQUITE'),(780,'071006','CUSCO','PARURO','OMACHA'),(781,'071008','CUSCO','PARURO','PACCARITAMBO'),(782,'071009','CUSCO','PARURO','PILLPINTO'),(783,'071007','CUSCO','PARURO','YAURISQUE'),(784,'071101','CUSCO','PAUCARTAMBO','PAUCARTAMBO'),(785,'071102','CUSCO','PAUCARTAMBO','CAICAY'),(786,'071104','CUSCO','PAUCARTAMBO','CHALLABAMBA'),(787,'071103','CUSCO','PAUCARTAMBO','COLQUEPATA'),(788,'071106','CUSCO','PAUCARTAMBO','HUANCARANI'),(789,'071105','CUSCO','PAUCARTAMBO','KOSÑIPATA'),(790,'071201','CUSCO','QUISPICANCHI','URCOS'),(791,'071202','CUSCO','QUISPICANCHI','ANDAHUAYLILLAS'),(792,'071203','CUSCO','QUISPICANCHI','CAMANTI'),(793,'071204','CUSCO','QUISPICANCHI','CCARHUAYO'),(794,'071205','CUSCO','QUISPICANCHI','CCATCA'),(795,'071206','CUSCO','QUISPICANCHI','CUSIPATA'),(796,'071207','CUSCO','QUISPICANCHI','HUARO'),(797,'071208','CUSCO','QUISPICANCHI','LUCRE'),(798,'071209','CUSCO','QUISPICANCHI','MARCAPATA'),(799,'071210','CUSCO','QUISPICANCHI','OCONGATE'),(800,'071211','CUSCO','QUISPICANCHI','OROPESA'),(801,'071212','CUSCO','QUISPICANCHI','QUIQUIJANA'),(802,'071301','CUSCO','URUBAMBA','URUBAMBA'),(803,'071302','CUSCO','URUBAMBA','CHINCHERO'),(804,'071303','CUSCO','URUBAMBA','HUAYLLABAMBA'),(805,'071304','CUSCO','URUBAMBA','MACHUPICCHU'),(806,'071305','CUSCO','URUBAMBA','MARAS'),(807,'071306','CUSCO','URUBAMBA','OLLANTAYTAMBO'),(808,'071307','CUSCO','URUBAMBA','YUCAY'),(809,'080101','HUANCAVELICA','HUANCAVELICA','HUANCAVELICA'),(810,'080102','HUANCAVELICA','HUANCAVELICA','ACOBAMBILLA'),(811,'080103','HUANCAVELICA','HUANCAVELICA','ACORIA'),(812,'080104','HUANCAVELICA','HUANCAVELICA','CONAYCA'),(813,'080105','HUANCAVELICA','HUANCAVELICA','CUENCA'),(814,'080106','HUANCAVELICA','HUANCAVELICA','HUACHOCOLPA'),(815,'080108','HUANCAVELICA','HUANCAVELICA','HUAYLLAHUARA'),(816,'080109','HUANCAVELICA','HUANCAVELICA','IZCUCHACA'),(817,'080110','HUANCAVELICA','HUANCAVELICA','LARIA'),(818,'080111','HUANCAVELICA','HUANCAVELICA','MANTA'),(819,'080112','HUANCAVELICA','HUANCAVELICA','MARISCAL CACERES'),(820,'080113','HUANCAVELICA','HUANCAVELICA','MOYA'),(821,'080114','HUANCAVELICA','HUANCAVELICA','NUEVO OCCORO'),(822,'080115','HUANCAVELICA','HUANCAVELICA','PALCA'),(823,'080116','HUANCAVELICA','HUANCAVELICA','PILCHACA'),(824,'080117','HUANCAVELICA','HUANCAVELICA','VILCA'),(825,'080118','HUANCAVELICA','HUANCAVELICA','YAULI'),(826,'080119','HUANCAVELICA','HUANCAVELICA','ASCENSION'),(827,'080120','HUANCAVELICA','HUANCAVELICA','HUANDO'),(828,'080201','HUANCAVELICA','ACOBAMBA','ACOBAMBA'),(829,'080203','HUANCAVELICA','ACOBAMBA','ANDABAMBA'),(830,'080202','HUANCAVELICA','ACOBAMBA','ANTA'),(831,'080204','HUANCAVELICA','ACOBAMBA','CAJA'),(832,'080205','HUANCAVELICA','ACOBAMBA','MARCAS'),(833,'080206','HUANCAVELICA','ACOBAMBA','PAUCARA'),(834,'080207','HUANCAVELICA','ACOBAMBA','POMACOCHA'),(835,'080208','HUANCAVELICA','ACOBAMBA','ROSARIO'),(836,'080301','HUANCAVELICA','ANGARAES','LIRCAY'),(837,'080302','HUANCAVELICA','ANGARAES','ANCHONGA'),(838,'080303','HUANCAVELICA','ANGARAES','CALLANMARCA'),(839,'080312','HUANCAVELICA','ANGARAES','CCOCHACCASA'),(840,'080305','HUANCAVELICA','ANGARAES','CHINCHO'),(841,'080304','HUANCAVELICA','ANGARAES','CONGALLA'),(842,'080307','HUANCAVELICA','ANGARAES','HUANCA-HUANCA'),(843,'080306','HUANCAVELICA','ANGARAES','HUAYLLAY GRANDE'),(844,'080308','HUANCAVELICA','ANGARAES','JULCAMARCA'),(845,'080309','HUANCAVELICA','ANGARAES','SAN ANTONIO DE ANTAPARCO'),(846,'080310','HUANCAVELICA','ANGARAES','SANTO TOMAS DE PATA'),(847,'080311','HUANCAVELICA','ANGARAES','SECCLLA'),(848,'080401','HUANCAVELICA','CASTROVIRREYNA','CASTROVIRREYNA'),(849,'080402','HUANCAVELICA','CASTROVIRREYNA','ARMA'),(850,'080403','HUANCAVELICA','CASTROVIRREYNA','AURAHUA'),(851,'080405','HUANCAVELICA','CASTROVIRREYNA','CAPILLAS'),(852,'080408','HUANCAVELICA','CASTROVIRREYNA','CHUPAMARCA'),(853,'080406','HUANCAVELICA','CASTROVIRREYNA','COCAS'),(854,'080409','HUANCAVELICA','CASTROVIRREYNA','HUACHOS'),(855,'080410','HUANCAVELICA','CASTROVIRREYNA','HUAMATAMBO'),(856,'080414','HUANCAVELICA','CASTROVIRREYNA','MOLLEPAMPA'),(857,'080422','HUANCAVELICA','CASTROVIRREYNA','SAN JUAN'),(858,'080429','HUANCAVELICA','CASTROVIRREYNA','SANTA ANA'),(859,'080427','HUANCAVELICA','CASTROVIRREYNA','TANTARA'),(860,'080428','HUANCAVELICA','CASTROVIRREYNA','TICRAPO'),(861,'080701','HUANCAVELICA','CHURCAMPA','CHURCAMPA'),(862,'080702','HUANCAVELICA','CHURCAMPA','ANCO'),(863,'080703','HUANCAVELICA','CHURCAMPA','CHINCHIHUASI'),(864,'080704','HUANCAVELICA','CHURCAMPA','EL CARMEN'),(865,'080705','HUANCAVELICA','CHURCAMPA','LA MERCED'),(866,'080706','HUANCAVELICA','CHURCAMPA','LOCROJA'),(867,'080707','HUANCAVELICA','CHURCAMPA','PAUCARBAMBA'),(868,'080708','HUANCAVELICA','CHURCAMPA','SAN MIGUEL DE MAYOCC'),(869,'080709','HUANCAVELICA','CHURCAMPA','SAN PEDRO DE CORIS'),(870,'080710','HUANCAVELICA','CHURCAMPA','PACHAMARCA'),(871,'080711','HUANCAVELICA','CHURCAMPA','COSME'),(872,'080604','HUANCAVELICA','HUAYTARA','HUAYTARA'),(873,'080601','HUANCAVELICA','HUAYTARA','AYAVI'),(874,'080602','HUANCAVELICA','HUAYTARA','CORDOVA'),(875,'080603','HUANCAVELICA','HUAYTARA','HUAYACUNDO ARMA'),(876,'080605','HUANCAVELICA','HUAYTARA','LARAMARCA'),(877,'080606','HUANCAVELICA','HUAYTARA','OCOYO'),(878,'080607','HUANCAVELICA','HUAYTARA','PILPICHACA'),(879,'080608','HUANCAVELICA','HUAYTARA','QUERCO'),(880,'080609','HUANCAVELICA','HUAYTARA','QUITO-ARMA'),(881,'080610','HUANCAVELICA','HUAYTARA','SAN ANTONIO DE CUSICANCHA'),(882,'080611','HUANCAVELICA','HUAYTARA','SAN FRANCISCO DE SANGAYAICO'),(883,'080612','HUANCAVELICA','HUAYTARA','SAN ISIDRO'),(884,'080613','HUANCAVELICA','HUAYTARA','SANTIAGO DE CHOCORVOS'),(885,'080614','HUANCAVELICA','HUAYTARA','SANTIAGO DE QUIRAHUARA'),(886,'080615','HUANCAVELICA','HUAYTARA','SANTO DOMINGO DE CAPILLAS'),(887,'080616','HUANCAVELICA','HUAYTARA','TAMBO'),(888,'080501','HUANCAVELICA','TAYACAJA','PAMPAS'),(889,'080502','HUANCAVELICA','TAYACAJA','ACOSTAMBO'),(890,'080503','HUANCAVELICA','TAYACAJA','ACRAQUIA'),(891,'080504','HUANCAVELICA','TAYACAJA','AHUAYCHA'),(892,'080506','HUANCAVELICA','TAYACAJA','COLCABAMBA'),(893,'080509','HUANCAVELICA','TAYACAJA','DANIEL HERNANDEZ'),(894,'080511','HUANCAVELICA','TAYACAJA','HUACHOCOLPA'),(895,'080512','HUANCAVELICA','TAYACAJA','HUARIBAMBA'),(896,'080515','HUANCAVELICA','TAYACAJA','ÑAHUIMPUQUIO'),(897,'080517','HUANCAVELICA','TAYACAJA','PAZOS'),(898,'080518','HUANCAVELICA','TAYACAJA','QUISHUAR'),(899,'080519','HUANCAVELICA','TAYACAJA','SALCABAMBA'),(900,'080526','HUANCAVELICA','TAYACAJA','SALCAHUASI'),(901,'080520','HUANCAVELICA','TAYACAJA','SAN MARCOS DE ROCCHAC'),(902,'080523','HUANCAVELICA','TAYACAJA','SURCUBAMBA'),(903,'080525','HUANCAVELICA','TAYACAJA','TINTAY PUNCU'),(904,'080528','HUANCAVELICA','TAYACAJA','QUICHUAS'),(905,'080529','HUANCAVELICA','TAYACAJA','ANDAYMARCA'),(906,'080530','HUANCAVELICA','TAYACAJA','ROBLE'),(907,'080531','HUANCAVELICA','TAYACAJA','PICHOS'),(908,'080532','HUANCAVELICA','TAYACAJA','SANTIAGO DE TUCUMA'),(909,'090101','HUANUCO','HUANUCO','HUANUCO'),(910,'090110','HUANUCO','HUANUCO','AMARILIS'),(911,'090102','HUANUCO','HUANUCO','CHINCHAO'),(912,'090103','HUANUCO','HUANUCO','CHURUBAMBA'),(913,'090104','HUANUCO','HUANUCO','MARGOS'),(914,'090105','HUANUCO','HUANUCO','QUISQUI'),(915,'090106','HUANUCO','HUANUCO','SAN FRANCISCO DE CAYRAN'),(916,'090107','HUANUCO','HUANUCO','SAN PEDRO DE CHAULAN'),(917,'090108','HUANUCO','HUANUCO','SANTA MARIA DEL VALLE'),(918,'090109','HUANUCO','HUANUCO','YARUMAYO'),(919,'090111','HUANUCO','HUANUCO','PILLCO MARCA'),(920,'090112','HUANUCO','HUANUCO','YACUS'),(921,'090113','HUANUCO','HUANUCO','SAN PABLO DE PILLAO'),(922,'090201','HUANUCO','AMBO','AMBO'),(923,'090202','HUANUCO','AMBO','CAYNA'),(924,'090203','HUANUCO','AMBO','COLPAS'),(925,'090204','HUANUCO','AMBO','CONCHAMARCA'),(926,'090205','HUANUCO','AMBO','HUACAR'),(927,'090206','HUANUCO','AMBO','SAN FRANCISCO'),(928,'090207','HUANUCO','AMBO','SAN RAFAEL'),(929,'090208','HUANUCO','AMBO','TOMAY KICHWA'),(930,'090301','HUANUCO','DOS DE MAYO','LA UNION'),(931,'090307','HUANUCO','DOS DE MAYO','CHUQUIS'),(932,'090312','HUANUCO','DOS DE MAYO','MARIAS'),(933,'090314','HUANUCO','DOS DE MAYO','PACHAS'),(934,'090316','HUANUCO','DOS DE MAYO','QUIVILLA'),(935,'090317','HUANUCO','DOS DE MAYO','RIPAN'),(936,'090321','HUANUCO','DOS DE MAYO','SHUNQUI'),(937,'090322','HUANUCO','DOS DE MAYO','SILLAPATA'),(938,'090323','HUANUCO','DOS DE MAYO','YANAS'),(939,'090901','HUANUCO','HUACAYBAMBA','HUACAYBAMBA'),(940,'090903','HUANUCO','HUACAYBAMBA','CANCHABAMBA'),(941,'090904','HUANUCO','HUACAYBAMBA','COCHABAMBA'),(942,'090902','HUANUCO','HUACAYBAMBA','PINRA'),(943,'090401','HUANUCO','HUAMALIES','LLATA'),(944,'090402','HUANUCO','HUAMALIES','ARANCAY'),(945,'090403','HUANUCO','HUAMALIES','CHAVIN DE PARIARCA'),(946,'090404','HUANUCO','HUAMALIES','JACAS GRANDE'),(947,'090405','HUANUCO','HUAMALIES','JIRCAN'),(948,'090406','HUANUCO','HUAMALIES','MIRAFLORES'),(949,'090407','HUANUCO','HUAMALIES','MONZON'),(950,'090408','HUANUCO','HUAMALIES','PUNCHAO'),(951,'090409','HUANUCO','HUAMALIES','PUÑOS'),(952,'090410','HUANUCO','HUAMALIES','SINGA'),(953,'090411','HUANUCO','HUAMALIES','TANTAMAYO'),(954,'090601','HUANUCO','LEONCIO PRADO','RUPA-RUPA'),(955,'090602','HUANUCO','LEONCIO PRADO','DANIEL ALOMIAS ROBLES'),(956,'090603','HUANUCO','LEONCIO PRADO','HERMILIO VALDIZAN'),(957,'090606','HUANUCO','LEONCIO PRADO','JOSE CRESPO Y CASTILLO'),(958,'090604','HUANUCO','LEONCIO PRADO','LUYANDO'),(959,'090605','HUANUCO','LEONCIO PRADO','MARIANO DAMASO BERAUN'),(960,'090607','HUANUCO','LEONCIO PRADO','PUCAYACU'),(961,'090608','HUANUCO','LEONCIO PRADO','CASTILLO GRANDE'),(962,'090609','HUANUCO','LEONCIO PRADO','PUEBLO NUEVO'),(963,'090610','HUANUCO','LEONCIO PRADO','SANTO DOMINGO DE ANDA'),(964,'090501','HUANUCO','MARAÑON','HUACRACHUCO'),(965,'090502','HUANUCO','MARAÑON','CHOLON'),(966,'090505','HUANUCO','MARAÑON','SAN BUENAVENTURA'),(967,'090506','HUANUCO','MARAÑON','LA MORADA'),(968,'090507','HUANUCO','MARAÑON','SANTA ROSA DE ALTO YANAJANCA'),(969,'090701','HUANUCO','PACHITEA','PANAO'),(970,'090702','HUANUCO','PACHITEA','CHAGLLA'),(971,'090704','HUANUCO','PACHITEA','MOLINO'),(972,'090706','HUANUCO','PACHITEA','UMARI'),(973,'090802','HUANUCO','PUERTO INCA','PUERTO INCA'),(974,'090803','HUANUCO','PUERTO INCA','CODO DEL POZUZO'),(975,'090801','HUANUCO','PUERTO INCA','HONORIA'),(976,'090804','HUANUCO','PUERTO INCA','TOURNAVISTA'),(977,'090805','HUANUCO','PUERTO INCA','YUYAPICHIS'),(978,'091001','HUANUCO','LAURICOCHA','JESUS'),(979,'091002','HUANUCO','LAURICOCHA','BAÑOS'),(980,'091007','HUANUCO','LAURICOCHA','JIVIA'),(981,'091004','HUANUCO','LAURICOCHA','QUEROPALCA'),(982,'091006','HUANUCO','LAURICOCHA','RONDOS'),(983,'091003','HUANUCO','LAURICOCHA','SAN FRANCISCO DE ASIS'),(984,'091005','HUANUCO','LAURICOCHA','SAN MIGUEL DE CAURI'),(985,'091101','HUANUCO','YAROWILCA','CHAVINILLO'),(986,'091103','HUANUCO','YAROWILCA','CAHUAC'),(987,'091104','HUANUCO','YAROWILCA','CHACABAMBA'),(988,'091102','HUANUCO','YAROWILCA','APARICIO POMARES'),(989,'091105','HUANUCO','YAROWILCA','JACAS CHICO'),(990,'091106','HUANUCO','YAROWILCA','OBAS'),(991,'091107','HUANUCO','YAROWILCA','PAMPAMARCA'),(992,'091108','HUANUCO','YAROWILCA','CHORAS'),(993,'100101','ICA','ICA','ICA'),(994,'100102','ICA','ICA','LA TINGUIÑA'),(995,'100103','ICA','ICA','LOS AQUIJES'),(996,'100114','ICA','ICA','OCUCAJE'),(997,'100113','ICA','ICA','PACHACUTEC'),(998,'100104','ICA','ICA','PARCONA'),(999,'100105','ICA','ICA','PUEBLO NUEVO'),(1000,'100106','ICA','ICA','SALAS'),(1001,'100107','ICA','ICA','SAN JOSE DE LOS MOLINOS'),(1002,'100108','ICA','ICA','SAN JUAN BAUTISTA'),(1003,'100109','ICA','ICA','SANTIAGO'),(1004,'100110','ICA','ICA','SUBTANJALLA'),(1005,'100112','ICA','ICA','TATE'),(1006,'100111','ICA','ICA','YAUCA DEL ROSARIO'),(1007,'100201','ICA','CHINCHA','CHINCHA ALTA'),(1008,'100209','ICA','CHINCHA','ALTO LARAN'),(1009,'100202','ICA','CHINCHA','CHAVIN'),(1010,'100203','ICA','CHINCHA','CHINCHA BAJA'),(1011,'100204','ICA','CHINCHA','EL CARMEN'),(1012,'100205','ICA','CHINCHA','GROCIO PRADO'),(1013,'100210','ICA','CHINCHA','PUEBLO NUEVO'),(1014,'100211','ICA','CHINCHA','SAN JUAN DE YANAC'),(1015,'100206','ICA','CHINCHA','SAN PEDRO DE HUACARPANA'),(1016,'100207','ICA','CHINCHA','SUNAMPE'),(1017,'100208','ICA','CHINCHA','TAMBO DE MORA'),(1018,'100301','ICA','NAZCA','NAZCA'),(1019,'100302','ICA','NAZCA','CHANGUILLO'),(1020,'100303','ICA','NAZCA','EL INGENIO'),(1021,'100304','ICA','NAZCA','MARCONA'),(1022,'100305','ICA','NAZCA','VISTA ALEGRE'),(1023,'100501','ICA','PALPA','PALPA'),(1024,'100502','ICA','PALPA','LLIPATA'),(1025,'100503','ICA','PALPA','RIO GRANDE'),(1026,'100504','ICA','PALPA','SANTA CRUZ'),(1027,'100505','ICA','PALPA','TIBILLO'),(1028,'100401','ICA','PISCO','PISCO'),(1029,'100402','ICA','PISCO','HUANCANO'),(1030,'100403','ICA','PISCO','HUMAY'),(1031,'100404','ICA','PISCO','INDEPENDENCIA'),(1032,'100405','ICA','PISCO','PARACAS'),(1033,'100406','ICA','PISCO','SAN ANDRES'),(1034,'100407','ICA','PISCO','SAN CLEMENTE'),(1035,'100408','ICA','PISCO','TUPAC AMARU INCA'),(1036,'110101','JUNIN','HUANCAYO','HUANCAYO'),(1037,'110103','JUNIN','HUANCAYO','CARHUACALLANGA'),(1038,'110106','JUNIN','HUANCAYO','CHACAPAMPA'),(1039,'110107','JUNIN','HUANCAYO','CHICCHE'),(1040,'110108','JUNIN','HUANCAYO','CHILCA'),(1041,'110109','JUNIN','HUANCAYO','CHONGOS ALTO'),(1042,'110112','JUNIN','HUANCAYO','CHUPURO'),(1043,'110104','JUNIN','HUANCAYO','COLCA'),(1044,'110105','JUNIN','HUANCAYO','CULLHUAS'),(1045,'110113','JUNIN','HUANCAYO','EL TAMBO'),(1046,'110114','JUNIN','HUANCAYO','HUACRAPUQUIO'),(1047,'110116','JUNIN','HUANCAYO','HUALHUAS'),(1048,'110118','JUNIN','HUANCAYO','HUANCAN'),(1049,'110119','JUNIN','HUANCAYO','HUASICANCHA'),(1050,'110120','JUNIN','HUANCAYO','HUAYUCACHI'),(1051,'110121','JUNIN','HUANCAYO','INGENIO'),(1052,'110122','JUNIN','HUANCAYO','PARIAHUANCA'),(1053,'110123','JUNIN','HUANCAYO','PILCOMAYO'),(1054,'110124','JUNIN','HUANCAYO','PUCARA'),(1055,'110125','JUNIN','HUANCAYO','QUICHUAY'),(1056,'110126','JUNIN','HUANCAYO','QUILCAS'),(1057,'110127','JUNIN','HUANCAYO','SAN AGUSTIN'),(1058,'110128','JUNIN','HUANCAYO','SAN JERONIMO DE TUNAN'),(1059,'110132','JUNIN','HUANCAYO','SAÑO'),(1060,'110133','JUNIN','HUANCAYO','SAPALLANGA'),(1061,'110134','JUNIN','HUANCAYO','SICAYA'),(1062,'110131','JUNIN','HUANCAYO','SANTO DOMINGO DE ACOBAMBA'),(1063,'110136','JUNIN','HUANCAYO','VIQUES'),(1064,'110201','JUNIN','CONCEPCION','CONCEPCION'),(1065,'110202','JUNIN','CONCEPCION','ACO'),(1066,'110203','JUNIN','CONCEPCION','ANDAMARCA'),(1067,'110206','JUNIN','CONCEPCION','CHAMBARA'),(1068,'110205','JUNIN','CONCEPCION','COCHAS'),(1069,'110204','JUNIN','CONCEPCION','COMAS'),(1070,'110207','JUNIN','CONCEPCION','HEROINAS TOLEDO'),(1071,'110208','JUNIN','CONCEPCION','MANZANARES'),(1072,'110209','JUNIN','CONCEPCION','MARISCAL CASTILLA'),(1073,'110210','JUNIN','CONCEPCION','MATAHUASI'),(1074,'110211','JUNIN','CONCEPCION','MITO'),(1075,'110212','JUNIN','CONCEPCION','NUEVE DE JULIO'),(1076,'110213','JUNIN','CONCEPCION','ORCOTUNA'),(1077,'110215','JUNIN','CONCEPCION','SAN JOSE DE QUERO'),(1078,'110214','JUNIN','CONCEPCION','SANTA ROSA DE OCOPA'),(1079,'110801','JUNIN','CHANCHAMAYO','CHANCHAMAYO'),(1080,'110806','JUNIN','CHANCHAMAYO','PERENE'),(1081,'110805','JUNIN','CHANCHAMAYO','PICHANAQUI'),(1082,'110804','JUNIN','CHANCHAMAYO','SAN LUIS DE SHUARO'),(1083,'110802','JUNIN','CHANCHAMAYO','SAN RAMON'),(1084,'110803','JUNIN','CHANCHAMAYO','VITOC'),(1085,'110301','JUNIN','JAUJA','JAUJA'),(1086,'110302','JUNIN','JAUJA','ACOLLA'),(1087,'110303','JUNIN','JAUJA','APATA'),(1088,'110304','JUNIN','JAUJA','ATAURA'),(1089,'110305','JUNIN','JAUJA','CANCHAYLLO'),(1090,'110331','JUNIN','JAUJA','CURICACA'),(1091,'110306','JUNIN','JAUJA','EL MANTARO'),(1092,'110307','JUNIN','JAUJA','HUAMALI'),(1093,'110308','JUNIN','JAUJA','HUARIPAMPA'),(1094,'110309','JUNIN','JAUJA','HUERTAS'),(1095,'110310','JUNIN','JAUJA','JANJAILLO'),(1096,'110311','JUNIN','JAUJA','JULCAN'),(1097,'110312','JUNIN','JAUJA','LEONOR ORDOÑEZ'),(1098,'110313','JUNIN','JAUJA','LLOCLLAPAMPA'),(1099,'110314','JUNIN','JAUJA','MARCO'),(1100,'110315','JUNIN','JAUJA','MASMA'),(1101,'110332','JUNIN','JAUJA','MASMA CHICCHE'),(1102,'110316','JUNIN','JAUJA','MOLINOS'),(1103,'110317','JUNIN','JAUJA','MONOBAMBA'),(1104,'110318','JUNIN','JAUJA','MUQUI'),(1105,'110319','JUNIN','JAUJA','MUQUIYAUYO'),(1106,'110320','JUNIN','JAUJA','PACA'),(1107,'110321','JUNIN','JAUJA','PACCHA'),(1108,'110322','JUNIN','JAUJA','PANCAN'),(1109,'110323','JUNIN','JAUJA','PARCO'),(1110,'110324','JUNIN','JAUJA','POMACANCHA'),(1111,'110325','JUNIN','JAUJA','RICRAN'),(1112,'110326','JUNIN','JAUJA','SAN LORENZO'),(1113,'110327','JUNIN','JAUJA','SAN PEDRO DE CHUNAN'),(1114,'110333','JUNIN','JAUJA','SAUSA'),(1115,'110328','JUNIN','JAUJA','SINCOS'),(1116,'110329','JUNIN','JAUJA','TUNAN MARCA'),(1117,'110330','JUNIN','JAUJA','YAULI'),(1118,'110334','JUNIN','JAUJA','YAUYOS'),(1119,'110401','JUNIN','JUNIN','JUNIN'),(1120,'110402','JUNIN','JUNIN','CARHUAMAYO'),(1121,'110403','JUNIN','JUNIN','ONDORES'),(1122,'110404','JUNIN','JUNIN','ULCUMAYO'),(1123,'110701','JUNIN','SATIPO','SATIPO'),(1124,'110702','JUNIN','SATIPO','COVIRIALI'),(1125,'110703','JUNIN','SATIPO','LLAYLLA'),(1126,'110704','JUNIN','SATIPO','MAZAMARI'),(1127,'110705','JUNIN','SATIPO','PAMPA HERMOSA'),(1128,'110706','JUNIN','SATIPO','PANGOA'),(1129,'110707','JUNIN','SATIPO','RIO NEGRO'),(1130,'110708','JUNIN','SATIPO','RIO TAMBO'),(1131,'110709','JUNIN','SATIPO','VIZCATAN DEL ENE'),(1132,'110501','JUNIN','TARMA','TARMA'),(1133,'110502','JUNIN','TARMA','ACOBAMBA'),(1134,'110503','JUNIN','TARMA','HUARICOLCA'),(1135,'110504','JUNIN','TARMA','HUASAHUASI'),(1136,'110505','JUNIN','TARMA','LA UNION'),(1137,'110506','JUNIN','TARMA','PALCA'),(1138,'110507','JUNIN','TARMA','PALCAMAYO'),(1139,'110508','JUNIN','TARMA','SAN PEDRO DE CAJAS'),(1140,'110509','JUNIN','TARMA','TAPO'),(1141,'110601','JUNIN','YAULI','LA OROYA'),(1142,'110602','JUNIN','YAULI','CHACAPALPA'),(1143,'110603','JUNIN','YAULI','HUAY-HUAY'),(1144,'110604','JUNIN','YAULI','MARCAPOMACOCHA'),(1145,'110605','JUNIN','YAULI','MOROCOCHA'),(1146,'110606','JUNIN','YAULI','PACCHA'),(1147,'110607','JUNIN','YAULI','SANTA BARBARA DE CARHUACAYAN'),(1148,'110610','JUNIN','YAULI','SANTA ROSA DE SACCO'),(1149,'110608','JUNIN','YAULI','SUITUCANCHA'),(1150,'110609','JUNIN','YAULI','YAULI'),(1151,'110901','JUNIN','CHUPACA','CHUPACA'),(1152,'110902','JUNIN','CHUPACA','AHUAC'),(1153,'110903','JUNIN','CHUPACA','CHONGOS BAJO'),(1154,'110904','JUNIN','CHUPACA','HUACHAC'),(1155,'110905','JUNIN','CHUPACA','HUAMANCACA CHICO'),(1156,'110906','JUNIN','CHUPACA','SAN JUAN DE YSCOS'),(1157,'110907','JUNIN','CHUPACA','SAN JUAN DE JARPA'),(1158,'110908','JUNIN','CHUPACA','TRES DE DICIEMBRE'),(1159,'110909','JUNIN','CHUPACA','YANACANCHA'),(1160,'120101','LA LIBERTAD','TRUJILLO','TRUJILLO'),(1161,'120110','LA LIBERTAD','TRUJILLO','EL PORVENIR'),(1162,'120112','LA LIBERTAD','TRUJILLO','FLORENCIA DE MORA'),(1163,'120102','LA LIBERTAD','TRUJILLO','HUANCHACO'),(1164,'120111','LA LIBERTAD','TRUJILLO','LA ESPERANZA'),(1165,'120103','LA LIBERTAD','TRUJILLO','LAREDO'),(1166,'120104','LA LIBERTAD','TRUJILLO','MOCHE'),(1167,'120109','LA LIBERTAD','TRUJILLO','POROTO'),(1168,'120105','LA LIBERTAD','TRUJILLO','SALAVERRY'),(1169,'120106','LA LIBERTAD','TRUJILLO','SIMBAL'),(1170,'120107','LA LIBERTAD','TRUJILLO','VICTOR LARCO HERRERA'),(1171,'120801','LA LIBERTAD','ASCOPE','ASCOPE'),(1172,'120802','LA LIBERTAD','ASCOPE','CHICAMA'),(1173,'120803','LA LIBERTAD','ASCOPE','CHOCOPE'),(1174,'120805','LA LIBERTAD','ASCOPE','MAGDALENA DE CAO'),(1175,'120806','LA LIBERTAD','ASCOPE','PAIJAN'),(1176,'120807','LA LIBERTAD','ASCOPE','RAZURI'),(1177,'120804','LA LIBERTAD','ASCOPE','SANTIAGO DE CAO'),(1178,'120808','LA LIBERTAD','ASCOPE','CASA GRANDE'),(1179,'120201','LA LIBERTAD','BOLIVAR','BOLIVAR'),(1180,'120202','LA LIBERTAD','BOLIVAR','BAMBAMARCA'),(1181,'120203','LA LIBERTAD','BOLIVAR','CONDORMARCA'),(1182,'120204','LA LIBERTAD','BOLIVAR','LONGOTEA'),(1183,'120206','LA LIBERTAD','BOLIVAR','UCHUMARCA'),(1184,'120205','LA LIBERTAD','BOLIVAR','UCUNCHA'),(1185,'120901','LA LIBERTAD','CHEPEN','CHEPEN'),(1186,'120902','LA LIBERTAD','CHEPEN','PACANGA'),(1187,'120903','LA LIBERTAD','CHEPEN','PUEBLO NUEVO'),(1188,'121001','LA LIBERTAD','JULCAN','JULCAN'),(1189,'121003','LA LIBERTAD','JULCAN','CALAMARCA'),(1190,'121002','LA LIBERTAD','JULCAN','CARABAMBA'),(1191,'121004','LA LIBERTAD','JULCAN','HUASO'),(1192,'120401','LA LIBERTAD','OTUZCO','OTUZCO'),(1193,'120402','LA LIBERTAD','OTUZCO','AGALLPAMPA'),(1194,'120403','LA LIBERTAD','OTUZCO','CHARAT'),(1195,'120404','LA LIBERTAD','OTUZCO','HUARANCHAL'),(1196,'120405','LA LIBERTAD','OTUZCO','LA CUESTA'),(1197,'120413','LA LIBERTAD','OTUZCO','MACHE'),(1198,'120408','LA LIBERTAD','OTUZCO','PARANDAY'),(1199,'120409','LA LIBERTAD','OTUZCO','SALPO'),(1200,'120410','LA LIBERTAD','OTUZCO','SINSICAP'),(1201,'120411','LA LIBERTAD','OTUZCO','USQUIL'),(1202,'120501','LA LIBERTAD','PACASMAYO','SAN PEDRO DE LLOC'),(1203,'120503','LA LIBERTAD','PACASMAYO','GUADALUPE'),(1204,'120504','LA LIBERTAD','PACASMAYO','JEQUETEPEQUE'),(1205,'120506','LA LIBERTAD','PACASMAYO','PACASMAYO'),(1206,'120508','LA LIBERTAD','PACASMAYO','SAN JOSE'),(1207,'120601','LA LIBERTAD','PATAZ','TAYABAMBA'),(1208,'120602','LA LIBERTAD','PATAZ','BULDIBUYO'),(1209,'120603','LA LIBERTAD','PATAZ','CHILLIA'),(1210,'120605','LA LIBERTAD','PATAZ','HUANCASPATA'),(1211,'120604','LA LIBERTAD','PATAZ','HUAYLILLAS'),(1212,'120606','LA LIBERTAD','PATAZ','HUAYO'),(1213,'120607','LA LIBERTAD','PATAZ','ONGON'),(1214,'120608','LA LIBERTAD','PATAZ','PARCOY'),(1215,'120609','LA LIBERTAD','PATAZ','PATAZ'),(1216,'120610','LA LIBERTAD','PATAZ','PIAS'),(1217,'120613','LA LIBERTAD','PATAZ','SANTIAGO DE CHALLAS'),(1218,'120611','LA LIBERTAD','PATAZ','TAURIJA'),(1219,'120612','LA LIBERTAD','PATAZ','URPAY'),(1220,'120301','LA LIBERTAD','SANCHEZ CARRION','HUAMACHUCO'),(1221,'120304','LA LIBERTAD','SANCHEZ CARRION','CHUGAY'),(1222,'120302','LA LIBERTAD','SANCHEZ CARRION','COCHORCO'),(1223,'120303','LA LIBERTAD','SANCHEZ CARRION','CURGOS'),(1224,'120305','LA LIBERTAD','SANCHEZ CARRION','MARCABAL'),(1225,'120306','LA LIBERTAD','SANCHEZ CARRION','SANAGORAN'),(1226,'120307','LA LIBERTAD','SANCHEZ CARRION','SARIN'),(1227,'120308','LA LIBERTAD','SANCHEZ CARRION','SARTIMBAMBA'),(1228,'120701','LA LIBERTAD','SANTIAGO DE CHUCO','SANTIAGO DE CHUCO'),(1229,'120708','LA LIBERTAD','SANTIAGO DE CHUCO','ANGASMARCA'),(1230,'120702','LA LIBERTAD','SANTIAGO DE CHUCO','CACHICADAN'),(1231,'120703','LA LIBERTAD','SANTIAGO DE CHUCO','MOLLEBAMBA'),(1232,'120704','LA LIBERTAD','SANTIAGO DE CHUCO','MOLLEPATA'),(1233,'120705','LA LIBERTAD','SANTIAGO DE CHUCO','QUIRUVILCA'),(1234,'120706','LA LIBERTAD','SANTIAGO DE CHUCO','SANTA CRUZ DE CHUCA'),(1235,'120707','LA LIBERTAD','SANTIAGO DE CHUCO','SITABAMBA'),(1236,'121101','LA LIBERTAD','GRAN CHIMU','CASCAS'),(1237,'121102','LA LIBERTAD','GRAN CHIMU','LUCMA'),(1238,'121103','LA LIBERTAD','GRAN CHIMU','MARMOT'),(1239,'121104','LA LIBERTAD','GRAN CHIMU','SAYAPULLO'),(1240,'121201','LA LIBERTAD','VIRU','VIRU'),(1241,'121202','LA LIBERTAD','VIRU','CHAO'),(1242,'121203','LA LIBERTAD','VIRU','GUADALUPITO'),(1243,'130101','LAMBAYEQUE','CHICLAYO','CHICLAYO'),(1244,'130102','LAMBAYEQUE','CHICLAYO','CHONGOYAPE'),(1245,'130103','LAMBAYEQUE','CHICLAYO','ETEN'),(1246,'130104','LAMBAYEQUE','CHICLAYO','ETEN PUERTO'),(1247,'130112','LAMBAYEQUE','CHICLAYO','JOSE LEONARDO ORTIZ'),(1248,'130115','LAMBAYEQUE','CHICLAYO','LA VICTORIA'),(1249,'130105','LAMBAYEQUE','CHICLAYO','LAGUNAS'),(1250,'130106','LAMBAYEQUE','CHICLAYO','MONSEFU'),(1251,'130107','LAMBAYEQUE','CHICLAYO','NUEVA ARICA'),(1252,'130108','LAMBAYEQUE','CHICLAYO','OYOTUN'),(1253,'130109','LAMBAYEQUE','CHICLAYO','PICSI'),(1254,'130110','LAMBAYEQUE','CHICLAYO','PIMENTEL'),(1255,'130111','LAMBAYEQUE','CHICLAYO','REQUE'),(1256,'130113','LAMBAYEQUE','CHICLAYO','SANTA ROSA'),(1257,'130114','LAMBAYEQUE','CHICLAYO','SAÑA'),(1258,'130116','LAMBAYEQUE','CHICLAYO','CAYALTI'),(1259,'130117','LAMBAYEQUE','CHICLAYO','PATAPO'),(1260,'130118','LAMBAYEQUE','CHICLAYO','POMALCA'),(1261,'130119','LAMBAYEQUE','CHICLAYO','PUCALA'),(1262,'130120','LAMBAYEQUE','CHICLAYO','TUMAN'),(1263,'130201','LAMBAYEQUE','FERREÑAFE','FERREÑAFE'),(1264,'130203','LAMBAYEQUE','FERREÑAFE','CAÑARIS'),(1265,'130202','LAMBAYEQUE','FERREÑAFE','INCAHUASI'),(1266,'130206','LAMBAYEQUE','FERREÑAFE','MANUEL ANTONIO MESONES MURO'),(1267,'130204','LAMBAYEQUE','FERREÑAFE','PITIPO'),(1268,'130205','LAMBAYEQUE','FERREÑAFE','PUEBLO NUEVO'),(1269,'130301','LAMBAYEQUE','LAMBAYEQUE','LAMBAYEQUE'),(1270,'130302','LAMBAYEQUE','LAMBAYEQUE','CHOCHOPE'),(1271,'130303','LAMBAYEQUE','LAMBAYEQUE','ILLIMO'),(1272,'130304','LAMBAYEQUE','LAMBAYEQUE','JAYANCA'),(1273,'130305','LAMBAYEQUE','LAMBAYEQUE','MOCHUMI'),(1274,'130306','LAMBAYEQUE','LAMBAYEQUE','MORROPE'),(1275,'130307','LAMBAYEQUE','LAMBAYEQUE','MOTUPE'),(1276,'130308','LAMBAYEQUE','LAMBAYEQUE','OLMOS'),(1277,'130309','LAMBAYEQUE','LAMBAYEQUE','PACORA'),(1278,'130310','LAMBAYEQUE','LAMBAYEQUE','SALAS'),(1279,'130311','LAMBAYEQUE','LAMBAYEQUE','SAN JOSE'),(1280,'130312','LAMBAYEQUE','LAMBAYEQUE','TUCUME'),(1281,'140101','LIMA','LIMA','LIMA'),(1282,'140102','LIMA','LIMA','ANCON'),(1283,'140103','LIMA','LIMA','ATE'),(1284,'140125','LIMA','LIMA','BARRANCO'),(1285,'140104','LIMA','LIMA','BREÑA'),(1286,'140105','LIMA','LIMA','CARABAYLLO'),(1287,'140107','LIMA','LIMA','CHACLACAYO'),(1288,'140108','LIMA','LIMA','CHORRILLOS'),(1289,'140139','LIMA','LIMA','CIENEGUILLA'),(1290,'140106','LIMA','LIMA','COMAS'),(1291,'140135','LIMA','LIMA','EL AGUSTINO'),(1292,'140134','LIMA','LIMA','INDEPENDENCIA'),(1293,'140133','LIMA','LIMA','JESUS MARIA'),(1294,'140110','LIMA','LIMA','LA MOLINA'),(1295,'140109','LIMA','LIMA','LA VICTORIA'),(1296,'140111','LIMA','LIMA','LINCE'),(1297,'140142','LIMA','LIMA','LOS OLIVOS'),(1298,'140112','LIMA','LIMA','LURIGANCHO'),(1299,'140113','LIMA','LIMA','LURIN'),(1300,'140114','LIMA','LIMA','MAGDALENA DEL MAR'),(1301,'140117','LIMA','LIMA','PUEBLO LIBRE'),(1302,'140115','LIMA','LIMA','MIRAFLORES'),(1303,'140116','LIMA','LIMA','PACHACAMAC'),(1304,'140118','LIMA','LIMA','PUCUSANA'),(1305,'140119','LIMA','LIMA','PUENTE PIEDRA'),(1306,'140120','LIMA','LIMA','PUNTA HERMOSA'),(1307,'140121','LIMA','LIMA','PUNTA NEGRA'),(1308,'140122','LIMA','LIMA','RIMAC'),(1309,'140123','LIMA','LIMA','SAN BARTOLO'),(1310,'140140','LIMA','LIMA','SAN BORJA'),(1311,'140124','LIMA','LIMA','SAN ISIDRO'),(1312,'140137','LIMA','LIMA','SAN JUAN DE LURIGANCHO'),(1313,'140136','LIMA','LIMA','SAN JUAN DE MIRAFLORES'),(1314,'140138','LIMA','LIMA','SAN LUIS'),(1315,'140126','LIMA','LIMA','SAN MARTIN DE PORRES'),(1316,'140127','LIMA','LIMA','SAN MIGUEL'),(1317,'140143','LIMA','LIMA','SANTA ANITA'),(1318,'140128','LIMA','LIMA','SANTA MARIA DEL MAR'),(1319,'140129','LIMA','LIMA','SANTA ROSA'),(1320,'140130','LIMA','LIMA','SANTIAGO DE SURCO'),(1321,'140131','LIMA','LIMA','SURQUILLO'),(1322,'140141','LIMA','LIMA','VILLA EL SALVADOR'),(1323,'140132','LIMA','LIMA','VILLA MARIA DEL TRIUNFO'),(1325,'140901','LIMA','BARRANCA','BARRANCA'),(1326,'140902','LIMA','BARRANCA','PARAMONGA'),(1327,'140903','LIMA','BARRANCA','PATIVILCA'),(1328,'140904','LIMA','BARRANCA','SUPE'),(1329,'140905','LIMA','BARRANCA','SUPE PUERTO'),(1330,'140201','LIMA','CAJATAMBO','CAJATAMBO'),(1331,'140205','LIMA','CAJATAMBO','COPA'),(1332,'140206','LIMA','CAJATAMBO','GORGOR'),(1333,'140207','LIMA','CAJATAMBO','HUANCAPON'),(1334,'140208','LIMA','CAJATAMBO','MANAS'),(1335,'140301','LIMA','CANTA','CANTA'),(1336,'140302','LIMA','CANTA','ARAHUAY'),(1337,'140303','LIMA','CANTA','HUAMANTANGA'),(1338,'140304','LIMA','CANTA','HUAROS'),(1339,'140305','LIMA','CANTA','LACHAQUI'),(1340,'140306','LIMA','CANTA','SAN BUENAVENTURA'),(1341,'140307','LIMA','CANTA','SANTA ROSA DE QUIVES'),(1342,'140401','LIMA','CAÑETE','SAN VICENTE DE CAÑETE'),(1343,'140416','LIMA','CAÑETE','ASIA'),(1344,'140402','LIMA','CAÑETE','CALANGO'),(1345,'140403','LIMA','CAÑETE','CERRO AZUL'),(1346,'140405','LIMA','CAÑETE','CHILCA'),(1347,'140404','LIMA','CAÑETE','COAYLLO'),(1348,'140406','LIMA','CAÑETE','IMPERIAL'),(1349,'140407','LIMA','CAÑETE','LUNAHUANA'),(1350,'140408','LIMA','CAÑETE','MALA'),(1351,'140409','LIMA','CAÑETE','NUEVO IMPERIAL'),(1352,'140410','LIMA','CAÑETE','PACARAN'),(1353,'140411','LIMA','CAÑETE','QUILMANA'),(1354,'140412','LIMA','CAÑETE','SAN ANTONIO'),(1355,'140413','LIMA','CAÑETE','SAN LUIS'),(1356,'140414','LIMA','CAÑETE','SANTA CRUZ DE FLORES'),(1357,'140415','LIMA','CAÑETE','ZUÑIGA'),(1358,'140801','LIMA','HUARAL','HUARAL'),(1359,'140802','LIMA','HUARAL','ATAVILLOS ALTO'),(1360,'140803','LIMA','HUARAL','ATAVILLOS BAJO'),(1361,'140804','LIMA','HUARAL','AUCALLAMA'),(1362,'140805','LIMA','HUARAL','CHANCAY'),(1363,'140806','LIMA','HUARAL','IHUARI'),(1364,'140807','LIMA','HUARAL','LAMPIAN'),(1365,'140808','LIMA','HUARAL','PACARAOS'),(1366,'140809','LIMA','HUARAL','SAN MIGUEL DE ACOS'),(1367,'140811','LIMA','HUARAL','SANTA CRUZ DE ANDAMARCA'),(1368,'140812','LIMA','HUARAL','SUMBILCA'),(1369,'140810','LIMA','HUARAL','VEINTISIETE DE NOVIEMBRE'),(1370,'140601','LIMA','HUAROCHIRI','MATUCANA'),(1371,'140602','LIMA','HUAROCHIRI','ANTIOQUIA'),(1372,'140603','LIMA','HUAROCHIRI','CALLAHUANCA'),(1373,'140604','LIMA','HUAROCHIRI','CARAMPOMA'),(1374,'140607','LIMA','HUAROCHIRI','CHICLA'),(1375,'140606','LIMA','HUAROCHIRI','CUENCA'),(1376,'140630','LIMA','HUAROCHIRI','HUACHUPAMPA'),(1377,'140608','LIMA','HUAROCHIRI','HUANZA'),(1378,'140609','LIMA','HUAROCHIRI','HUAROCHIRI'),(1379,'140610','LIMA','HUAROCHIRI','LAHUAYTAMBO'),(1380,'140611','LIMA','HUAROCHIRI','LANGA'),(1381,'140631','LIMA','HUAROCHIRI','LARAOS'),(1382,'140612','LIMA','HUAROCHIRI','MARIATANA'),(1383,'140613','LIMA','HUAROCHIRI','RICARDO PALMA'),(1384,'140614','LIMA','HUAROCHIRI','SAN ANDRES DE TUPICOCHA'),(1385,'140615','LIMA','HUAROCHIRI','SAN ANTONIO'),(1386,'140616','LIMA','HUAROCHIRI','SAN BARTOLOME'),(1387,'140617','LIMA','HUAROCHIRI','SAN DAMIAN'),(1388,'140632','LIMA','HUAROCHIRI','SAN JUAN DE IRIS'),(1389,'140619','LIMA','HUAROCHIRI','SAN JUAN DE TANTARANCHE'),(1390,'140620','LIMA','HUAROCHIRI','SAN LORENZO DE QUINTI'),(1391,'140621','LIMA','HUAROCHIRI','SAN MATEO'),(1392,'140622','LIMA','HUAROCHIRI','SAN MATEO DE OTAO'),(1393,'140605','LIMA','HUAROCHIRI','SAN PEDRO DE CASTA'),(1394,'140623','LIMA','HUAROCHIRI','SAN PEDRO DE HUANCAYRE'),(1395,'140618','LIMA','HUAROCHIRI','SANGALLAYA'),(1396,'140624','LIMA','HUAROCHIRI','SANTA CRUZ DE COCACHACRA'),(1397,'140625','LIMA','HUAROCHIRI','SANTA EULALIA'),(1398,'140626','LIMA','HUAROCHIRI','SANTIAGO DE ANCHUCAYA'),(1399,'140627','LIMA','HUAROCHIRI','SANTIAGO DE TUNA'),(1400,'140628','LIMA','HUAROCHIRI','SANTO DOMINGO DE LOS OLLEROS'),(1401,'140629','LIMA','HUAROCHIRI','SURCO'),(1402,'140501','LIMA','HUAURA','HUACHO'),(1403,'140502','LIMA','HUAURA','AMBAR'),(1404,'140504','LIMA','HUAURA','CALETA DE CARQUIN'),(1405,'140505','LIMA','HUAURA','CHECRAS'),(1406,'140506','LIMA','HUAURA','HUALMAY'),(1407,'140507','LIMA','HUAURA','HUAURA'),(1408,'140508','LIMA','HUAURA','LEONCIO PRADO'),(1409,'140509','LIMA','HUAURA','PACCHO'),(1410,'140511','LIMA','HUAURA','SANTA LEONOR'),(1411,'140512','LIMA','HUAURA','SANTA MARIA'),(1412,'140513','LIMA','HUAURA','SAYAN'),(1413,'140516','LIMA','HUAURA','VEGUETA'),(1414,'141001','LIMA','OYON','OYON'),(1415,'141004','LIMA','OYON','ANDAJES'),(1416,'141003','LIMA','OYON','CAUJUL'),(1417,'141006','LIMA','OYON','COCHAMARCA'),(1418,'141002','LIMA','OYON','NAVAN'),(1419,'141005','LIMA','OYON','PACHANGARA'),(1420,'140701','LIMA','YAUYOS','YAUYOS'),(1421,'140702','LIMA','YAUYOS','ALIS'),(1422,'140703','LIMA','YAUYOS','AYAUCA'),(1423,'140704','LIMA','YAUYOS','AYAVIRI'),(1424,'140705','LIMA','YAUYOS','AZANGARO'),(1425,'140706','LIMA','YAUYOS','CACRA'),(1426,'140707','LIMA','YAUYOS','CARANIA'),(1427,'140733','LIMA','YAUYOS','CATAHUASI'),(1428,'140710','LIMA','YAUYOS','CHOCOS'),(1429,'140708','LIMA','YAUYOS','COCHAS'),(1430,'140709','LIMA','YAUYOS','COLONIA'),(1431,'140730','LIMA','YAUYOS','HONGOS'),(1432,'140711','LIMA','YAUYOS','HUAMPARA'),(1433,'140712','LIMA','YAUYOS','HUANCAYA'),(1434,'140713','LIMA','YAUYOS','HUANGASCAR'),(1435,'140714','LIMA','YAUYOS','HUANTAN'),(1436,'140715','LIMA','YAUYOS','HUAÑEC'),(1437,'140716','LIMA','YAUYOS','LARAOS'),(1438,'140717','LIMA','YAUYOS','LINCHA'),(1439,'140731','LIMA','YAUYOS','MADEAN'),(1440,'140718','LIMA','YAUYOS','MIRAFLORES'),(1441,'140719','LIMA','YAUYOS','OMAS'),(1442,'140732','LIMA','YAUYOS','PUTINZA'),(1443,'140720','LIMA','YAUYOS','QUINCHES'),(1444,'140721','LIMA','YAUYOS','QUINOCAY'),(1445,'140722','LIMA','YAUYOS','SAN JOAQUIN'),(1446,'140723','LIMA','YAUYOS','SAN PEDRO DE PILAS'),(1447,'140724','LIMA','YAUYOS','TANTA'),(1448,'140725','LIMA','YAUYOS','TAURIPAMPA'),(1449,'140727','LIMA','YAUYOS','TOMAS'),(1450,'140726','LIMA','YAUYOS','TUPE'),(1451,'140728','LIMA','YAUYOS','VIÑAC'),(1452,'140729','LIMA','YAUYOS','VITIS'),(1453,'150101','LORETO','MAYNAS','IQUITOS'),(1454,'150102','LORETO','MAYNAS','ALTO NANAY'),(1455,'150103','LORETO','MAYNAS','FERNANDO LORES'),(1456,'150110','LORETO','MAYNAS','INDIANA'),(1457,'150104','LORETO','MAYNAS','LAS AMAZONAS'),(1458,'150105','LORETO','MAYNAS','MAZAN'),(1459,'150106','LORETO','MAYNAS','NAPO'),(1460,'150111','LORETO','MAYNAS','PUNCHANA'),(1461,'150108','LORETO','MAYNAS','TORRES CAUSANA'),(1462,'150112','LORETO','MAYNAS','BELEN'),(1463,'150113','LORETO','MAYNAS','SAN JUAN BAUTISTA'),(1464,'150201','LORETO','ALTO AMAZONAS','YURIMAGUAS'),(1465,'150202','LORETO','ALTO AMAZONAS','BALSAPUERTO'),(1466,'150205','LORETO','ALTO AMAZONAS','JEBEROS'),(1467,'150206','LORETO','ALTO AMAZONAS','LAGUNAS'),(1468,'150210','LORETO','ALTO AMAZONAS','SANTA CRUZ'),(1469,'150211','LORETO','ALTO AMAZONAS','TENIENTE CESAR LOPEZ ROJAS'),(1470,'150301','LORETO','LORETO','NAUTA'),(1471,'150302','LORETO','LORETO','PARINARI'),(1472,'150303','LORETO','LORETO','TIGRE'),(1473,'150305','LORETO','LORETO','TROMPETEROS'),(1474,'150304','LORETO','LORETO','URARINAS'),(1475,'150601','LORETO','MARISCAL RAMON CASTILLA','RAMON CASTILLA'),(1476,'150602','LORETO','MARISCAL RAMON CASTILLA','PEBAS'),(1477,'150603','LORETO','MARISCAL RAMON CASTILLA','YAVARI'),(1478,'150604','LORETO','MARISCAL RAMON CASTILLA','SAN PABLO'),(1479,'150401','LORETO','REQUENA','REQUENA'),(1480,'150402','LORETO','REQUENA','ALTO TAPICHE'),(1481,'150403','LORETO','REQUENA','CAPELO'),(1482,'150404','LORETO','REQUENA','EMILIO SAN MARTIN'),(1483,'150405','LORETO','REQUENA','MAQUIA'),(1484,'150406','LORETO','REQUENA','PUINAHUA'),(1485,'150407','LORETO','REQUENA','SAQUENA'),(1486,'150408','LORETO','REQUENA','SOPLIN'),(1487,'150409','LORETO','REQUENA','TAPICHE'),(1488,'150410','LORETO','REQUENA','JENARO HERRERA'),(1489,'150411','LORETO','REQUENA','YAQUERANA'),(1490,'150501','LORETO','UCAYALI','CONTAMANA'),(1491,'150506','LORETO','UCAYALI','INAHUAYA'),(1492,'150503','LORETO','UCAYALI','PADRE MARQUEZ'),(1493,'150504','LORETO','UCAYALI','PAMPA HERMOSA'),(1494,'150505','LORETO','UCAYALI','SARAYACU'),(1495,'150502','LORETO','UCAYALI','VARGAS GUERRA'),(1496,'150701','LORETO','DATEM DEL MARAÑON','BARRANCA'),(1497,'150703','LORETO','DATEM DEL MARAÑON','CAHUAPANAS'),(1498,'150704','LORETO','DATEM DEL MARAÑON','MANSERICHE'),(1499,'150705','LORETO','DATEM DEL MARAÑON','MORONA'),(1500,'150706','LORETO','DATEM DEL MARAÑON','PASTAZA'),(1501,'150702','LORETO','DATEM DEL MARAÑON','ANDOAS'),(1502,'150901','LORETO','PUTUMAYO','PUTUMAYO'),(1503,'150902','LORETO','PUTUMAYO','ROSA PANDURO'),(1504,'150903','LORETO','PUTUMAYO','TENIENTE MANUEL CLAVERO'),(1505,'150904','LORETO','PUTUMAYO','YAGUAS'),(1506,'160101','MADRE DE DIOS','TAMBOPATA','TAMBOPATA'),(1507,'160102','MADRE DE DIOS','TAMBOPATA','INAMBARI'),(1508,'160103','MADRE DE DIOS','TAMBOPATA','LAS PIEDRAS'),(1509,'160104','MADRE DE DIOS','TAMBOPATA','LABERINTO'),(1510,'160201','MADRE DE DIOS','MANU','MANU'),(1511,'160202','MADRE DE DIOS','MANU','FITZCARRALD'),(1512,'160203','MADRE DE DIOS','MANU','MADRE DE DIOS'),(1513,'160204','MADRE DE DIOS','MANU','HUEPETUHE'),(1514,'160301','MADRE DE DIOS','TAHUAMANU','IÑAPARI'),(1515,'160302','MADRE DE DIOS','TAHUAMANU','IBERIA'),(1516,'160303','MADRE DE DIOS','TAHUAMANU','TAHUAMANU'),(1517,'170101','MOQUEGUA','MARISCAL NIETO','MOQUEGUA'),(1518,'170102','MOQUEGUA','MARISCAL NIETO','CARUMAS'),(1519,'170103','MOQUEGUA','MARISCAL NIETO','CUCHUMBAYA'),(1520,'170106','MOQUEGUA','MARISCAL NIETO','SAMEGUA'),(1521,'170104','MOQUEGUA','MARISCAL NIETO','SAN CRISTOBAL'),(1522,'170105','MOQUEGUA','MARISCAL NIETO','TORATA'),(1523,'170201','MOQUEGUA','GENERAL SANCHEZ CERRO','OMATE'),(1524,'170203','MOQUEGUA','GENERAL SANCHEZ CERRO','CHOJATA'),(1525,'170202','MOQUEGUA','GENERAL SANCHEZ CERRO','COALAQUE'),(1526,'170204','MOQUEGUA','GENERAL SANCHEZ CERRO','ICHUÑA'),(1527,'170205','MOQUEGUA','GENERAL SANCHEZ CERRO','LA CAPILLA'),(1528,'170206','MOQUEGUA','GENERAL SANCHEZ CERRO','LLOQUE'),(1529,'170207','MOQUEGUA','GENERAL SANCHEZ CERRO','MATALAQUE'),(1530,'170208','MOQUEGUA','GENERAL SANCHEZ CERRO','PUQUINA'),(1531,'170209','MOQUEGUA','GENERAL SANCHEZ CERRO','QUINISTAQUILLAS'),(1532,'170210','MOQUEGUA','GENERAL SANCHEZ CERRO','UBINAS'),(1533,'170211','MOQUEGUA','GENERAL SANCHEZ CERRO','YUNGA'),(1534,'170301','MOQUEGUA','ILO','ILO'),(1535,'170302','MOQUEGUA','ILO','EL ALGARROBAL'),(1536,'170303','MOQUEGUA','ILO','PACOCHA'),(1537,'180101','PASCO','PASCO','CHAUPIMARCA'),(1538,'180103','PASCO','PASCO','HUACHON'),(1539,'180104','PASCO','PASCO','HUARIACA'),(1540,'180105','PASCO','PASCO','HUAYLLAY'),(1541,'180106','PASCO','PASCO','NINACACA'),(1542,'180107','PASCO','PASCO','PALLANCHACRA'),(1543,'180108','PASCO','PASCO','PAUCARTAMBO'),(1544,'180109','PASCO','PASCO','SAN FRANCISCO DE ASIS DE YARUSYACAN'),(1545,'180110','PASCO','PASCO','SIMON BOLIVAR'),(1546,'180111','PASCO','PASCO','TICLACAYAN'),(1547,'180112','PASCO','PASCO','TINYAHUARCO'),(1548,'180113','PASCO','PASCO','VICCO'),(1549,'180114','PASCO','PASCO','YANACANCHA'),(1550,'180201','PASCO','DANIEL ALCIDES CARRION','YANAHUANCA'),(1551,'180202','PASCO','DANIEL ALCIDES CARRION','CHACAYAN'),(1552,'180203','PASCO','DANIEL ALCIDES CARRION','GOYLLARISQUIZGA'),(1553,'180204','PASCO','DANIEL ALCIDES CARRION','PAUCAR'),(1554,'180205','PASCO','DANIEL ALCIDES CARRION','SAN PEDRO DE PILLAO'),(1555,'180206','PASCO','DANIEL ALCIDES CARRION','SANTA ANA DE TUSI'),(1556,'180207','PASCO','DANIEL ALCIDES CARRION','TAPUC'),(1557,'180208','PASCO','DANIEL ALCIDES CARRION','VILCABAMBA'),(1558,'180301','PASCO','OXAPAMPA','OXAPAMPA'),(1559,'180302','PASCO','OXAPAMPA','CHONTABAMBA'),(1560,'180303','PASCO','OXAPAMPA','HUANCABAMBA'),(1561,'180307','PASCO','OXAPAMPA','PALCAZU'),(1562,'180306','PASCO','OXAPAMPA','POZUZO'),(1563,'180304','PASCO','OXAPAMPA','PUERTO BERMUDEZ'),(1564,'180305','PASCO','OXAPAMPA','VILLA RICA'),(1565,'180308','PASCO','OXAPAMPA','CONSTITUCION'),(1566,'190101','PIURA','PIURA','PIURA'),(1567,'190103','PIURA','PIURA','CASTILLA'),(1568,'190104','PIURA','PIURA','CATACAOS'),(1569,'190113','PIURA','PIURA','CURA MORI'),(1570,'190114','PIURA','PIURA','EL TALLAN'),(1571,'190105','PIURA','PIURA','LA ARENA'),(1572,'190106','PIURA','PIURA','LA UNION'),(1573,'190107','PIURA','PIURA','LAS LOMAS'),(1574,'190109','PIURA','PIURA','TAMBO GRANDE'),(1575,'190115','PIURA','PIURA','VEINTISEIS DE OCTUBRE'),(1576,'190201','PIURA','AYABACA','AYABACA'),(1577,'190202','PIURA','AYABACA','FRIAS'),(1578,'190209','PIURA','AYABACA','JILILI'),(1579,'190203','PIURA','AYABACA','LAGUNAS'),(1580,'190204','PIURA','AYABACA','MONTERO'),(1581,'190205','PIURA','AYABACA','PACAIPAMPA'),(1582,'190210','PIURA','AYABACA','PAIMAS'),(1583,'190206','PIURA','AYABACA','SAPILLICA'),(1584,'190207','PIURA','AYABACA','SICCHEZ'),(1585,'190208','PIURA','AYABACA','SUYO'),(1586,'190301','PIURA','HUANCABAMBA','HUANCABAMBA'),(1587,'190302','PIURA','HUANCABAMBA','CANCHAQUE'),(1588,'190306','PIURA','HUANCABAMBA','EL CARMEN DE LA FRONTERA'),(1589,'190303','PIURA','HUANCABAMBA','HUARMACA'),(1590,'190308','PIURA','HUANCABAMBA','LALAQUIZ'),(1591,'190307','PIURA','HUANCABAMBA','SAN MIGUEL DE EL FAIQUE'),(1592,'190304','PIURA','HUANCABAMBA','SONDOR'),(1593,'190305','PIURA','HUANCABAMBA','SONDORILLO'),(1594,'190401','PIURA','MORROPON','CHULUCANAS'),(1595,'190402','PIURA','MORROPON','BUENOS AIRES'),(1596,'190403','PIURA','MORROPON','CHALACO'),(1597,'190408','PIURA','MORROPON','LA MATANZA'),(1598,'190404','PIURA','MORROPON','MORROPON'),(1599,'190405','PIURA','MORROPON','SALITRAL'),(1600,'190410','PIURA','MORROPON','SAN JUAN DE BIGOTE'),(1601,'190406','PIURA','MORROPON','SANTA CATALINA DE MOSSA'),(1602,'190407','PIURA','MORROPON','SANTO DOMINGO'),(1603,'190409','PIURA','MORROPON','YAMANGO'),(1604,'190501','PIURA','PAITA','PAITA'),(1605,'190502','PIURA','PAITA','AMOTAPE'),(1606,'190503','PIURA','PAITA','ARENAL'),(1607,'190505','PIURA','PAITA','COLAN'),(1608,'190504','PIURA','PAITA','LA HUACA'),(1609,'190506','PIURA','PAITA','TAMARINDO'),(1610,'190507','PIURA','PAITA','VICHAYAL'),(1611,'190601','PIURA','SULLANA','SULLANA'),(1612,'190602','PIURA','SULLANA','BELLAVISTA'),(1613,'190608','PIURA','SULLANA','IGNACIO ESCUDERO'),(1614,'190603','PIURA','SULLANA','LANCONES'),(1615,'190604','PIURA','SULLANA','MARCAVELICA'),(1616,'190605','PIURA','SULLANA','MIGUEL CHECA'),(1617,'190606','PIURA','SULLANA','QUERECOTILLO'),(1618,'190607','PIURA','SULLANA','SALITRAL'),(1619,'190701','PIURA','TALARA','PARIÑAS'),(1620,'190702','PIURA','TALARA','EL ALTO'),(1621,'190703','PIURA','TALARA','LA BREA'),(1622,'190704','PIURA','TALARA','LOBITOS'),(1623,'190706','PIURA','TALARA','LOS ORGANOS'),(1624,'190705','PIURA','TALARA','MANCORA'),(1625,'190801','PIURA','SECHURA','SECHURA'),(1626,'190804','PIURA','SECHURA','BELLAVISTA DE LA UNION'),(1627,'190803','PIURA','SECHURA','BERNAL'),(1628,'190805','PIURA','SECHURA','CRISTO NOS VALGA'),(1629,'190802','PIURA','SECHURA','VICE'),(1630,'190806','PIURA','SECHURA','RINCONADA LLICUAR'),(1631,'200101','PUNO','PUNO','PUNO'),(1632,'200102','PUNO','PUNO','ACORA'),(1633,'200115','PUNO','PUNO','AMANTANI'),(1634,'200103','PUNO','PUNO','ATUNCOLLA'),(1635,'200104','PUNO','PUNO','CAPACHICA'),(1636,'200106','PUNO','PUNO','CHUCUITO'),(1637,'200105','PUNO','PUNO','COATA'),(1638,'200107','PUNO','PUNO','HUATA'),(1639,'200108','PUNO','PUNO','MAÑAZO'),(1640,'200109','PUNO','PUNO','PAUCARCOLLA'),(1641,'200110','PUNO','PUNO','PICHACANI'),(1642,'200114','PUNO','PUNO','PLATERIA'),(1643,'200111','PUNO','PUNO','SAN ANTONIO'),(1644,'200112','PUNO','PUNO','TIQUILLACA'),(1645,'200113','PUNO','PUNO','VILQUE'),(1646,'200201','PUNO','AZANGARO','AZANGARO'),(1647,'200202','PUNO','AZANGARO','ACHAYA'),(1648,'200203','PUNO','AZANGARO','ARAPA'),(1649,'200204','PUNO','AZANGARO','ASILLO'),(1650,'200205','PUNO','AZANGARO','CAMINACA'),(1651,'200206','PUNO','AZANGARO','CHUPA'),(1652,'200207','PUNO','AZANGARO','JOSE DOMINGO CHOQUEHUANCA'),(1653,'200208','PUNO','AZANGARO','MUÑANI'),(1654,'200210','PUNO','AZANGARO','POTONI'),(1655,'200212','PUNO','AZANGARO','SAMAN'),(1656,'200213','PUNO','AZANGARO','SAN ANTON'),(1657,'200214','PUNO','AZANGARO','SAN JOSE'),(1658,'200215','PUNO','AZANGARO','SAN JUAN DE SALINAS'),(1659,'200216','PUNO','AZANGARO','SANTIAGO DE PUPUJA'),(1660,'200217','PUNO','AZANGARO','TIRAPATA'),(1661,'200301','PUNO','CARABAYA','MACUSANI'),(1662,'200302','PUNO','CARABAYA','AJOYANI'),(1663,'200303','PUNO','CARABAYA','AYAPATA'),(1664,'200304','PUNO','CARABAYA','COASA'),(1665,'200305','PUNO','CARABAYA','CORANI'),(1666,'200306','PUNO','CARABAYA','CRUCERO'),(1667,'200307','PUNO','CARABAYA','ITUATA'),(1668,'200308','PUNO','CARABAYA','OLLACHEA'),(1669,'200309','PUNO','CARABAYA','SAN GABAN'),(1670,'200310','PUNO','CARABAYA','USICAYOS'),(1671,'200401','PUNO','CHUCUITO','JULI'),(1672,'200402','PUNO','CHUCUITO','DESAGUADERO'),(1673,'200403','PUNO','CHUCUITO','HUACULLANI'),(1674,'200412','PUNO','CHUCUITO','KELLUYO'),(1675,'200406','PUNO','CHUCUITO','PISACOMA'),(1676,'200407','PUNO','CHUCUITO','POMATA'),(1677,'200410','PUNO','CHUCUITO','ZEPITA'),(1678,'201201','PUNO','EL COLLAO','ILAVE'),(1679,'201204','PUNO','EL COLLAO','CAPAZO'),(1680,'201202','PUNO','EL COLLAO','PILCUYO'),(1681,'201203','PUNO','EL COLLAO','SANTA ROSA'),(1682,'201205','PUNO','EL COLLAO','CONDURIRI'),(1683,'200501','PUNO','HUANCANE','HUANCANE'),(1684,'200502','PUNO','HUANCANE','COJATA'),(1685,'200511','PUNO','HUANCANE','HUATASANI'),(1686,'200504','PUNO','HUANCANE','INCHUPALLA'),(1687,'200506','PUNO','HUANCANE','PUSI'),(1688,'200507','PUNO','HUANCANE','ROSASPATA'),(1689,'200508','PUNO','HUANCANE','TARACO'),(1690,'200509','PUNO','HUANCANE','VILQUE CHICO'),(1691,'200601','PUNO','LAMPA','LAMPA'),(1692,'200602','PUNO','LAMPA','CABANILLA'),(1693,'200603','PUNO','LAMPA','CALAPUJA'),(1694,'200604','PUNO','LAMPA','NICASIO'),(1695,'200605','PUNO','LAMPA','OCUVIRI'),(1696,'200606','PUNO','LAMPA','PALCA'),(1697,'200607','PUNO','LAMPA','PARATIA'),(1698,'200608','PUNO','LAMPA','PUCARA'),(1699,'200609','PUNO','LAMPA','SANTA LUCIA'),(1700,'200610','PUNO','LAMPA','VILAVILA'),(1701,'200701','PUNO','MELGAR','AYAVIRI'),(1702,'200702','PUNO','MELGAR','ANTAUTA'),(1703,'200703','PUNO','MELGAR','CUPI'),(1704,'200704','PUNO','MELGAR','LLALLI'),(1705,'200705','PUNO','MELGAR','MACARI'),(1706,'200706','PUNO','MELGAR','NUÑOA'),(1707,'200707','PUNO','MELGAR','ORURILLO'),(1708,'200708','PUNO','MELGAR','SANTA ROSA'),(1709,'200709','PUNO','MELGAR','UMACHIRI'),(1710,'201301','PUNO','MOHO','MOHO'),(1711,'201302','PUNO','MOHO','CONIMA'),(1712,'201304','PUNO','MOHO','HUAYRAPATA'),(1713,'201303','PUNO','MOHO','TILALI'),(1714,'201101','PUNO','SAN ANTONIO DE PUTINA','PUTINA'),(1715,'201104','PUNO','SAN ANTONIO DE PUTINA','ANANEA'),(1716,'201102','PUNO','SAN ANTONIO DE PUTINA','PEDRO VILCA APAZA'),(1717,'201103','PUNO','SAN ANTONIO DE PUTINA','QUILCAPUNCU'),(1718,'201105','PUNO','SAN ANTONIO DE PUTINA','SINA'),(1719,'200901','PUNO','SAN ROMAN','JULIACA'),(1720,'200902','PUNO','SAN ROMAN','CABANA'),(1721,'200903','PUNO','SAN ROMAN','CABANILLAS'),(1722,'200904','PUNO','SAN ROMAN','CARACOTO'),(1723,'200905','PUNO','SAN ROMAN','SAN MIGUEL'),(1724,'200801','PUNO','SANDIA','SANDIA'),(1725,'200803','PUNO','SANDIA','CUYOCUYO'),(1726,'200804','PUNO','SANDIA','LIMBANI'),(1727,'200806','PUNO','SANDIA','PATAMBUCO'),(1728,'200805','PUNO','SANDIA','PHARA'),(1729,'200807','PUNO','SANDIA','QUIACA'),(1730,'200808','PUNO','SANDIA','SAN JUAN DEL ORO'),(1731,'200810','PUNO','SANDIA','YANAHUAYA'),(1732,'200811','PUNO','SANDIA','ALTO INAMBARI'),(1733,'200812','PUNO','SANDIA','SAN PEDRO DE PUTINA PUNCO'),(1734,'201001','PUNO','YUNGUYO','YUNGUYO'),(1735,'201003','PUNO','YUNGUYO','ANAPIA'),(1736,'201004','PUNO','YUNGUYO','COPANI'),(1737,'201005','PUNO','YUNGUYO','CUTURAPI'),(1738,'201006','PUNO','YUNGUYO','OLLARAYA'),(1739,'201007','PUNO','YUNGUYO','TINICACHI'),(1740,'201002','PUNO','YUNGUYO','UNICACHI'),(1741,'210101','SAN MARTIN','MOYOBAMBA','MOYOBAMBA'),(1742,'210102','SAN MARTIN','MOYOBAMBA','CALZADA'),(1743,'210103','SAN MARTIN','MOYOBAMBA','HABANA'),(1744,'210104','SAN MARTIN','MOYOBAMBA','JEPELACIO'),(1745,'210105','SAN MARTIN','MOYOBAMBA','SORITOR'),(1746,'210106','SAN MARTIN','MOYOBAMBA','YANTALO'),(1747,'210701','SAN MARTIN','BELLAVISTA','BELLAVISTA'),(1748,'210704','SAN MARTIN','BELLAVISTA','ALTO BIAVO'),(1749,'210706','SAN MARTIN','BELLAVISTA','BAJO BIAVO'),(1750,'210705','SAN MARTIN','BELLAVISTA','HUALLAGA'),(1751,'210703','SAN MARTIN','BELLAVISTA','SAN PABLO'),(1752,'210702','SAN MARTIN','BELLAVISTA','SAN RAFAEL'),(1753,'211001','SAN MARTIN','EL DORADO','SAN JOSE DE SISA'),(1754,'211002','SAN MARTIN','EL DORADO','AGUA BLANCA'),(1755,'211004','SAN MARTIN','EL DORADO','SAN MARTIN'),(1756,'211005','SAN MARTIN','EL DORADO','SANTA ROSA'),(1757,'211003','SAN MARTIN','EL DORADO','SHATOJA'),(1758,'210201','SAN MARTIN','HUALLAGA','SAPOSOA'),(1759,'210205','SAN MARTIN','HUALLAGA','ALTO SAPOSOA'),(1760,'210206','SAN MARTIN','HUALLAGA','EL ESLABON'),(1761,'210202','SAN MARTIN','HUALLAGA','PISCOYACU'),(1762,'210203','SAN MARTIN','HUALLAGA','SACANCHE'),(1763,'210204','SAN MARTIN','HUALLAGA','TINGO DE SAPOSOA'),(1764,'210301','SAN MARTIN','LAMAS','LAMAS'),(1765,'210315','SAN MARTIN','LAMAS','ALONSO DE ALVARADO'),(1766,'210303','SAN MARTIN','LAMAS','BARRANQUITA'),(1767,'210304','SAN MARTIN','LAMAS','CAYNARACHI'),(1768,'210305','SAN MARTIN','LAMAS','CUÑUMBUQUI'),(1769,'210306','SAN MARTIN','LAMAS','PINTO RECODO'),(1770,'210307','SAN MARTIN','LAMAS','RUMISAPA'),(1771,'210316','SAN MARTIN','LAMAS','SAN ROQUE DE CUMBAZA'),(1772,'210311','SAN MARTIN','LAMAS','SHANAO'),(1773,'210313','SAN MARTIN','LAMAS','TABALOSOS'),(1774,'210314','SAN MARTIN','LAMAS','ZAPATERO'),(1775,'210401','SAN MARTIN','MARISCAL CACERES','JUANJUI'),(1776,'210402','SAN MARTIN','MARISCAL CACERES','CAMPANILLA'),(1777,'210403','SAN MARTIN','MARISCAL CACERES','HUICUNGO'),(1778,'210404','SAN MARTIN','MARISCAL CACERES','PACHIZA'),(1779,'210405','SAN MARTIN','MARISCAL CACERES','PAJARILLO'),(1780,'210901','SAN MARTIN','PICOTA','PICOTA'),(1781,'210902','SAN MARTIN','PICOTA','BUENOS AIRES'),(1782,'210903','SAN MARTIN','PICOTA','CASPISAPA'),(1783,'210904','SAN MARTIN','PICOTA','PILLUANA'),(1784,'210905','SAN MARTIN','PICOTA','PUCACACA'),(1785,'210906','SAN MARTIN','PICOTA','SAN CRISTOBAL'),(1786,'210907','SAN MARTIN','PICOTA','SAN HILARION'),(1787,'210910','SAN MARTIN','PICOTA','SHAMBOYACU'),(1788,'210908','SAN MARTIN','PICOTA','TINGO DE PONASA'),(1789,'210909','SAN MARTIN','PICOTA','TRES UNIDOS'),(1790,'210501','SAN MARTIN','RIOJA','RIOJA'),(1791,'210509','SAN MARTIN','RIOJA','AWAJUN'),(1792,'210506','SAN MARTIN','RIOJA','ELIAS SOPLIN VARGAS'),(1793,'210505','SAN MARTIN','RIOJA','NUEVA CAJAMARCA'),(1794,'210508','SAN MARTIN','RIOJA','PARDO MIGUEL'),(1795,'210502','SAN MARTIN','RIOJA','POSIC'),(1796,'210507','SAN MARTIN','RIOJA','SAN FERNANDO'),(1797,'210503','SAN MARTIN','RIOJA','YORONGOS'),(1798,'210504','SAN MARTIN','RIOJA','YURACYACU'),(1799,'210601','SAN MARTIN','SAN MARTIN','TARAPOTO'),(1800,'210602','SAN MARTIN','SAN MARTIN','ALBERTO LEVEAU'),(1801,'210604','SAN MARTIN','SAN MARTIN','CACATACHI'),(1802,'210606','SAN MARTIN','SAN MARTIN','CHAZUTA'),(1803,'210607','SAN MARTIN','SAN MARTIN','CHIPURANA'),(1804,'210608','SAN MARTIN','SAN MARTIN','EL PORVENIR'),(1805,'210609','SAN MARTIN','SAN MARTIN','HUIMBAYOC'),(1806,'210610','SAN MARTIN','SAN MARTIN','JUAN GUERRA'),(1807,'210621','SAN MARTIN','SAN MARTIN','LA BANDA DE SHILCAYO'),(1808,'210611','SAN MARTIN','SAN MARTIN','MORALES'),(1809,'210612','SAN MARTIN','SAN MARTIN','PAPAPLAYA'),(1810,'210616','SAN MARTIN','SAN MARTIN','SAN ANTONIO'),(1811,'210619','SAN MARTIN','SAN MARTIN','SAUCE'),(1812,'210620','SAN MARTIN','SAN MARTIN','SHAPAJA'),(1813,'210801','SAN MARTIN','TOCACHE','TOCACHE'),(1814,'210802','SAN MARTIN','TOCACHE','NUEVO PROGRESO'),(1815,'210803','SAN MARTIN','TOCACHE','POLVORA'),(1816,'210804','SAN MARTIN','TOCACHE','SHUNTE'),(1817,'210805','SAN MARTIN','TOCACHE','UCHIZA'),(1818,'220101','TACNA','TACNA','TACNA'),(1819,'220111','TACNA','TACNA','ALTO DE LA ALIANZA'),(1820,'220102','TACNA','TACNA','CALANA'),(1821,'220112','TACNA','TACNA','CIUDAD NUEVA'),(1822,'220104','TACNA','TACNA','INCLAN'),(1823,'220107','TACNA','TACNA','PACHIA'),(1824,'220108','TACNA','TACNA','PALCA'),(1825,'220109','TACNA','TACNA','POCOLLAY'),(1826,'220110','TACNA','TACNA','SAMA'),(1827,'220113','TACNA','TACNA','CORONEL GREGORIO ALBARRACIN LANCHIP'),(1828,'220114','TACNA','TACNA','LA YARADA LOS PALOS'),(1829,'220401','TACNA','CANDARAVE','CANDARAVE'),(1830,'220402','TACNA','CANDARAVE','CAIRANI'),(1831,'220406','TACNA','CANDARAVE','CAMILACA'),(1832,'220403','TACNA','CANDARAVE','CURIBAYA'),(1833,'220404','TACNA','CANDARAVE','HUANUARA'),(1834,'220405','TACNA','CANDARAVE','QUILAHUANI'),(1835,'220301','TACNA','JORGE BASADRE','LOCUMBA'),(1836,'220303','TACNA','JORGE BASADRE','ILABAYA'),(1837,'220302','TACNA','JORGE BASADRE','ITE'),(1838,'220201','TACNA','TARATA','TARATA'),(1839,'220205','TACNA','TARATA','CHUCATAMANI'),(1840,'220206','TACNA','TARATA','ESTIQUE'),(1841,'220207','TACNA','TARATA','ESTIQUE-PAMPA'),(1842,'220210','TACNA','TARATA','SITAJARA'),(1843,'220211','TACNA','TARATA','SUSAPAYA'),(1844,'220212','TACNA','TARATA','TARUCACHI'),(1845,'220213','TACNA','TARATA','TICACO'),(1846,'230101','TUMBES','TUMBES','TUMBES'),(1847,'230102','TUMBES','TUMBES','CORRALES'),(1848,'230103','TUMBES','TUMBES','LA CRUZ'),(1849,'230104','TUMBES','TUMBES','PAMPAS DE HOSPITAL'),(1850,'230105','TUMBES','TUMBES','SAN JACINTO'),(1851,'230106','TUMBES','TUMBES','SAN JUAN DE LA VIRGEN'),(1852,'230201','TUMBES','CONTRALMIRANTE VILLAR','ZORRITOS'),(1853,'230202','TUMBES','CONTRALMIRANTE VILLAR','CASITAS'),(1854,'230203','TUMBES','CONTRALMIRANTE VILLAR','CANOAS DE PUNTA SAL'),(1855,'230301','TUMBES','ZARUMILLA','ZARUMILLA'),(1856,'230304','TUMBES','ZARUMILLA','AGUAS VERDES'),(1857,'230302','TUMBES','ZARUMILLA','MATAPALO'),(1858,'230303','TUMBES','ZARUMILLA','PAPAYAL'),(1859,'250101','UCAYALI','CORONEL PORTILLO','CALLERIA'),(1860,'250104','UCAYALI','CORONEL PORTILLO','CAMPOVERDE'),(1861,'250105','UCAYALI','CORONEL PORTILLO','IPARIA'),(1862,'250103','UCAYALI','CORONEL PORTILLO','MASISEA'),(1863,'250102','UCAYALI','CORONEL PORTILLO','YARINACOCHA'),(1864,'250106','UCAYALI','CORONEL PORTILLO','NUEVA REQUENA'),(1865,'250107','UCAYALI','CORONEL PORTILLO','MANANTAY'),(1866,'250301','UCAYALI','ATALAYA','RAYMONDI'),(1867,'250304','UCAYALI','ATALAYA','SEPAHUA'),(1868,'250302','UCAYALI','ATALAYA','TAHUANIA'),(1869,'250303','UCAYALI','ATALAYA','YURUA'),(1870,'250201','UCAYALI','PADRE ABAD','PADRE ABAD'),(1871,'250202','UCAYALI','PADRE ABAD','IRAZOLA'),(1872,'250203','UCAYALI','PADRE ABAD','CURIMANA'),(1873,'250204','UCAYALI','PADRE ABAD','NESHUYA'),(1874,'250205','UCAYALI','PADRE ABAD','ALEXANDER VON HUMBOLDT'),(1875,'250401','UCAYALI','PURUS','PURUS'),(1876,'050314','AYACUCHO','HUANTA','PUTIS'),(1877,'050412','AYACUCHO','LA MAR','UNION PROGRESO'),(1878,'050415','AYACUCHO','LA MAR','RIO MAGDALENA'),(1879,'050414','AYACUCHO','LA MAR','NINABAMBA'),(1880,'050413','AYACUCHO','LA MAR','PATIBAMBA'),(1881,'250207','UCAYALI','PADRE ABAD','HUIPOCA'),(1882,'250206','UCAYALI','PADRE ABAD','BOQUERON'),(1883,'170107','MOQUEGUA','MARISCAL NIETO','SAN ANTONIO'),(1884,'080533','HUANCAVELICA','TAYACAJA','LAMBRAS'),(1885,'080534','HUANCAVELICA','TAYACAJA','COCHABAMBA'),(1886,NULL,'LIMA','LIMA','SANTA MARIA DE HUACHIPA'),(1887,'070916','CUSCO','LA CONVENCION','KUMPIRUSHIATO'),(1888,'070917','CUSCO','LA CONVENCION','CIELO PUNCO'),(1889,'070918','CUSCO','LA CONVENCION','MANITEA'),(1890,'070919','CUSCO','LA CONVENCION','UNION ASHÁNINKA'),(1891,'030712','APURIMAC','CHINCHEROS','AHUAYRO'),(1892,'210806','SAN MARTIN','TOCACHE','SANTA LUCIA'),(1893,'150107','LORETO','MAYNAS','PUTUMAYO'),(1894,'150114','LORETO','MAYNAS','TENIENTE MANUEL CLAVERO');
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `idLogin` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `PersonaId` int DEFAULT NULL,
  PRIMARY KEY (`idLogin`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'pevv2016@gmail.com','root',1),(2,'jpingenieria@gmail.com','HolaMundo',1),(4,'pevv','$2a$10$nFnxs5NpmBod5aeUNTpCbeuRl9cDjR2ad0ISEM95sUJt7WiQwYiWq',1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivodecese`
--

DROP TABLE IF EXISTS `motivodecese`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivodecese` (
  `idMotivosDeCese` int NOT NULL,
  `NombreMotivosDeCese` varchar(19) NOT NULL,
  PRIMARY KEY (`idMotivosDeCese`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivodecese`
--

LOCK TABLES `motivodecese` WRITE;
/*!40000 ALTER TABLE `motivodecese` DISABLE KEYS */;
INSERT INTO `motivodecese` VALUES (1,'RENUNCIA'),(2,'FIN DE CONTRATO'),(3,'ABANDONO DE TRABAJO'),(4,'MALA CONDUCTA'),(5,'JUBILACION');
/*!40000 ALTER TABLE `motivodecese` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagotareo`
--

DROP TABLE IF EXISTS `pagotareo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagotareo` (
  `idPagoTareo` int NOT NULL AUTO_INCREMENT,
  `idTareo` int NOT NULL,
  `CantidadDePago` float NOT NULL,
  `idPeriodo` int NOT NULL,
  PRIMARY KEY (`idPagoTareo`),
  UNIQUE KEY `idTareo_UNIQUE` (`idTareo`),
  KEY `FK_PagoTareo_Tareo_idx` (`idTareo`),
  KEY `FK_PagoTareo_Periodo_idx` (`idPeriodo`),
  CONSTRAINT `FK_PagoTareo_Periodo` FOREIGN KEY (`idPeriodo`) REFERENCES `periodo` (`idPeriodo`),
  CONSTRAINT `FK_PagoTareo_Tareo` FOREIGN KEY (`idTareo`) REFERENCES `tareo` (`idTareo`)
) ENGINE=InnoDB AUTO_INCREMENT=141467 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagotareo`
--

LOCK TABLES `pagotareo` WRITE;
/*!40000 ALTER TABLE `pagotareo` DISABLE KEYS */;
INSERT INTO `pagotareo` VALUES (140311,564,80.6452,2),(140312,565,80.6452,2),(140313,566,80.6452,2),(140314,567,80.6452,2),(140315,568,80.6452,2),(140316,569,80.6452,2),(140317,570,80.6452,2),(140318,571,80.6452,2),(140319,572,80.6452,2),(140320,573,80.6452,2),(140321,574,80.6452,2),(140322,575,80.6452,2),(140323,576,80.6452,2),(140324,577,80.6452,2),(140325,578,80.6452,2),(140326,579,80.6452,2),(140327,580,80.6452,2),(140328,581,80.6452,2),(140329,582,80.6452,2),(140330,583,80.6452,2),(140331,584,80.6452,2),(140332,585,80.6452,2),(140333,586,80.6452,2),(140334,587,80.6452,2),(140335,588,80.6452,2),(140336,589,80.6452,2),(140337,590,80.6452,2),(140338,591,80.6452,2),(140339,592,80.6452,2),(140340,593,80.6452,2),(140341,594,80.6452,2),(140342,595,80.6452,2),(140343,596,80.6452,2),(140344,597,80.6452,2),(140345,598,80.6452,2),(140346,599,80.6452,2),(140347,600,80.6452,2),(140348,601,80.6452,2),(140349,602,80.6452,2),(140350,603,80.6452,2),(140351,604,80.6452,2),(140352,605,80.6452,2),(140353,606,80.6452,2),(140354,607,80.6452,2),(140355,608,80.6452,2),(140357,609,80.6452,2),(140359,610,80.6452,2),(140361,611,80.6452,2),(140363,612,80.6452,2),(140365,613,80.6452,2),(140366,614,80.6452,2),(140368,615,80.6452,2),(140369,616,80.6452,2),(140370,617,80.6452,2),(140371,618,80.6452,2),(140372,619,80.6452,2),(140373,620,80.6452,2),(140374,621,80.6452,2),(140375,622,80.6452,2),(140376,623,80.6452,2),(140377,624,80.6452,2),(140378,625,80.6452,2),(140379,1184,80.6452,2),(140381,1185,80.6452,2),(140383,1186,80.6452,2),(140385,1187,80.6452,2),(140387,1188,80.6452,2),(140389,1189,80.6452,2),(140391,1190,0,2),(140393,1191,0,2),(140395,1192,0,2),(140397,1193,0,2),(140399,1194,80.6452,2),(140400,1195,80.6452,2),(140401,1196,80.6452,2),(140402,1197,80.6452,2),(140403,1198,80.6452,2),(140404,1199,80.6452,2),(140405,1200,80.6452,2),(140406,1201,80.6452,2),(140407,1202,80.6452,2),(140408,1203,80.6452,2),(140409,1204,80.6452,2),(140410,1205,80.6452,2),(140411,1206,80.6452,2),(140413,1207,80.6452,2),(140415,1208,80.6452,2),(140417,1209,80.6452,2),(140419,1210,80.6452,2),(140421,1211,80.6452,2),(140423,1212,80.6452,2),(140424,1213,80.6452,2),(140425,1214,80.6452,2),(140426,1215,48.3871,2),(140427,1216,48.3871,2),(140428,1217,48.3871,2),(140429,1218,48.3871,2),(140430,1219,48.3871,2),(140431,1220,48.3871,2),(140432,1221,48.3871,2),(140433,1222,48.3871,2),(140434,1223,48.3871,2),(140435,1224,48.3871,2),(140436,1225,48.3871,2),(140437,1226,0,2),(140439,1227,48.3871,2),(140440,1228,48.3871,2),(140441,1229,48.3871,2),(140442,1230,48.3871,2),(140444,1231,48.3871,2),(140446,1232,48.3871,2),(140448,1233,48.3871,2),(140450,1234,48.3871,2),(140452,1235,48.3871,2),(140454,1236,0,2),(140456,1237,48.3871,2),(140457,1238,48.3871,2),(140458,1239,48.3871,2),(140459,1240,48.3871,2),(140460,1241,48.3871,2),(140461,1242,48.3871,2),(140462,1243,48.3871,2),(140463,1244,48.3871,2),(140464,1245,48.3871,2),(140465,1246,80.6452,2),(140467,1247,80.6452,2),(140469,1248,80.6452,2),(140471,1249,80.6452,2),(140473,1250,80.6452,2),(140475,1251,80.6452,2),(140477,1252,0,2),(140479,1253,0,2),(140481,1254,0,2),(140483,1255,0,2),(140485,1256,80.6452,2),(140486,1257,80.6452,2),(140487,1258,80.6452,2),(140488,1259,80.6452,2),(140489,1260,80.6452,2),(140490,1261,80.6452,2),(140491,1262,80.6452,2),(140492,1263,80.6452,2),(140493,1264,80.6452,2),(140494,1265,80.6452,2),(140495,1266,80.6452,2),(140496,1267,80.6452,2),(140497,1268,80.6452,2),(140499,1269,80.6452,2),(140501,1270,80.6452,2),(140503,1271,80.6452,2),(140505,1272,80.6452,2),(140507,1273,80.6452,2),(140509,1274,0,2),(140511,1275,80.6452,2),(140512,1276,0,2),(140514,688,54.8387,2),(140516,689,54.8387,2),(140518,690,54.8387,2),(140520,691,54.8387,2),(140522,692,54.8387,2),(140524,693,54.8387,2),(140526,694,0,2),(140528,695,0,2),(140530,696,54.8387,2),(140531,697,0,2),(140533,698,0,2),(140535,699,0,2),(140537,700,0,2),(140539,701,0,2),(140541,702,0,2),(140543,703,54.8387,2),(140544,704,54.8387,2),(140545,705,54.8387,2),(140546,706,54.8387,2),(140547,707,54.8387,2),(140548,708,54.8387,2),(140549,709,54.8387,2),(140550,710,54.8387,2),(140551,711,54.8387,2),(140552,712,54.8387,2),(140553,713,54.8387,2),(140554,714,54.8387,2),(140555,715,54.8387,2),(140556,716,54.8387,2),(140557,717,54.8387,2),(140559,718,54.8387,2),(140561,1277,70.9677,2),(140562,1278,70.9677,2),(140563,1279,70.9677,2),(140564,1280,70.9677,2),(140565,1281,70.9677,2),(140566,1282,70.9677,2),(140567,1283,70.9677,2),(140568,1284,70.9677,2),(140569,1285,70.9677,2),(140570,1286,70.9677,2),(140571,1287,70.9677,2),(140572,1288,70.9677,2),(140573,1289,70.9677,2),(140575,1290,70.9677,2),(140577,1291,70.9677,2),(140579,1292,70.9677,2),(140581,1293,70.9677,2),(140583,1294,70.9677,2),(140585,1295,70.9677,2),(140587,1296,0,2),(140589,1297,0,2),(140591,1298,0,2),(140593,1299,0,2),(140595,1300,70.9677,2),(140596,1301,70.9677,2),(140597,1302,70.9677,2),(140598,1303,70.9677,2),(140599,1304,70.9677,2),(140600,1305,70.9677,2),(140601,1306,70.9677,2),(140602,1307,70.9677,2),(140603,1308,58.0645,2),(140604,1309,58.0645,2),(140605,1310,58.0645,2),(140606,1311,58.0645,2),(140607,1312,58.0645,2),(140608,1313,58.0645,2),(140609,1314,58.0645,2),(140610,1315,58.0645,2),(140611,1316,58.0645,2),(140612,1317,58.0645,2),(140613,1318,58.0645,2),(140614,1319,58.0645,2),(140615,1320,58.0645,2),(140616,1321,58.0645,2),(140617,1322,58.0645,2),(140618,1323,58.0645,2),(140619,1324,58.0645,2),(140620,1325,58.0645,2),(140622,1326,58.0645,2),(140624,1327,58.0645,2),(140626,1328,58.0645,2),(140628,1329,58.0645,2),(140630,1330,58.0645,2),(140632,1331,58.0645,2),(140634,1332,58.0645,2),(140636,1333,58.0645,2),(140638,1334,58.0645,2),(140640,1335,0,2),(140642,1336,0,2),(140644,1337,58.0645,2),(140645,1338,58.0645,2),(140646,905,0,2),(140648,906,38.7097,2),(140649,907,38.7097,2),(140650,908,38.7097,2),(140651,909,38.7097,2),(140652,910,38.7097,2),(140653,911,38.7097,2),(140654,912,38.7097,2),(140655,913,38.7097,2),(140656,914,38.7097,2),(140657,915,38.7097,2),(140658,916,38.7097,2),(140659,917,38.7097,2),(140660,918,38.7097,2),(140661,919,38.7097,2),(140662,920,0,2),(140664,921,38.7097,2),(140665,922,38.7097,2),(140666,923,38.7097,2),(140667,924,38.7097,2),(140668,925,38.7097,2),(140669,926,38.7097,2),(140670,927,38.7097,2),(140671,928,38.7097,2),(140672,929,38.7097,2),(140673,930,38.7097,2),(140674,931,38.7097,2),(140675,932,38.7097,2),(140676,933,38.7097,2),(140677,934,38.7097,2),(140678,935,38.7097,2),(140679,874,0,2),(140681,875,58.0645,2),(140682,876,58.0645,2),(140683,877,58.0645,2),(140684,878,58.0645,2),(140685,879,58.0645,2),(140686,880,58.0645,2),(140687,881,58.0645,2),(140688,882,58.0645,2),(140689,883,58.0645,2),(140690,884,58.0645,2),(140691,885,58.0645,2),(140692,886,58.0645,2),(140693,887,58.0645,2),(140694,888,58.0645,2),(140695,889,58.0645,2),(140696,890,58.0645,2),(140697,891,58.0645,2),(140698,892,58.0645,2),(140699,893,58.0645,2),(140700,894,58.0645,2),(140701,895,58.0645,2),(140702,896,58.0645,2),(140703,897,58.0645,2),(140704,898,58.0645,2),(140705,899,58.0645,2),(140706,900,58.0645,2),(140707,901,58.0645,2),(140708,902,58.0645,2),(140709,903,58.0645,2),(140710,904,58.0645,2),(140711,626,64.5161,2),(140712,627,64.5161,2),(140713,628,64.5161,2),(140714,629,64.5161,2),(140715,630,64.5161,2),(140716,631,64.5161,2),(140717,632,64.5161,2),(140718,633,64.5161,2),(140719,634,64.5161,2),(140720,635,64.5161,2),(140721,636,64.5161,2),(140722,637,64.5161,2),(140723,638,64.5161,2),(140724,639,64.5161,2),(140725,640,64.5161,2),(140726,641,64.5161,2),(140727,642,64.5161,2),(140728,643,64.5161,2),(140729,644,64.5161,2),(140730,645,64.5161,2),(140731,646,64.5161,2),(140732,647,64.5161,2),(140733,648,64.5161,2),(140734,649,64.5161,2),(140735,650,64.5161,2),(140736,651,64.5161,2),(140737,652,64.5161,2),(140738,653,64.5161,2),(140739,654,64.5161,2),(140740,655,64.5161,2),(140741,656,64.5161,2),(140742,812,0,2),(140744,813,0,2),(140746,814,0,2),(140748,815,0,2),(140750,816,0,2),(140752,817,0,2),(140754,818,0,2),(140756,819,48.3871,2),(140757,820,48.3871,2),(140758,821,48.3871,2),(140759,822,48.3871,2),(140760,823,0,2),(140762,824,0,2),(140764,825,48.3871,2),(140765,826,0,2),(140767,827,48.3871,2),(140768,828,48.3871,2),(140769,829,48.3871,2),(140770,830,48.3871,2),(140771,831,48.3871,2),(140772,832,48.3871,2),(140773,833,48.3871,2),(140774,834,48.3871,2),(140775,835,48.3871,2),(140776,836,48.3871,2),(140777,837,48.3871,2),(140778,838,48.3871,2),(140779,839,48.3871,2),(140780,840,48.3871,2),(140781,841,48.3871,2),(140782,842,48.3871,2),(140783,719,161.29,2),(140784,720,161.29,2),(140785,721,161.29,2),(140786,722,161.29,2),(140787,723,161.29,2),(140788,724,161.29,2),(140789,725,161.29,2),(140790,726,161.29,2),(140791,727,161.29,2),(140792,728,161.29,2),(140793,729,161.29,2),(140794,730,161.29,2),(140795,731,161.29,2),(140796,732,161.29,2),(140797,733,161.29,2),(140798,734,161.29,2),(140799,735,161.29,2),(140800,736,161.29,2),(140801,737,161.29,2),(140802,738,161.29,2),(140803,739,161.29,2),(140804,740,161.29,2),(140805,741,161.29,2),(140806,742,161.29,2),(140807,743,161.29,2),(140808,744,161.29,2),(140809,745,161.29,2),(140810,746,161.29,2),(140811,747,161.29,2),(140812,748,161.29,2),(140813,749,161.29,2),(140814,750,0,2),(140816,751,0,2),(140818,752,64.5161,2),(140819,753,64.5161,2),(140820,754,0,2),(140822,755,0,2),(140824,756,0,2),(140826,757,64.5161,2),(140827,758,64.5161,2),(140828,759,64.5161,2),(140829,760,0,2),(140831,761,0,2),(140833,762,64.5161,2),(140834,763,0,2),(140836,764,64.5161,2),(140837,765,64.5161,2),(140838,766,64.5161,2),(140839,767,0,2),(140841,768,0,2),(140843,769,0,2),(140845,770,0,2),(140847,771,0,2),(140849,772,64.5161,2),(140850,773,64.5161,2),(140851,774,0,2),(140853,775,0,2),(140855,776,0,2),(140857,777,0,2),(140859,778,0,2),(140861,779,64.5161,2),(140862,780,0,2),(140864,1339,61.2903,2),(140866,1340,61.2903,2),(140868,1341,0,2),(140870,1342,0,2),(140872,1343,0,2),(140874,1344,0,2),(140876,1345,0,2),(140878,1346,0,2),(140880,1347,0,2),(140882,1348,0,2),(140884,1349,0,2),(140886,1350,0,2),(140888,1351,0,2),(140890,1352,0,2),(140892,1353,0,2),(140894,1354,0,2),(140896,1355,0,2),(140898,1356,0,2),(140900,1357,0,2),(140902,1358,0,2),(140904,1359,0,2),(140906,1360,0,2),(140908,1361,0,2),(140910,1362,0,2),(140912,1363,0,2),(140914,1364,0,2),(140916,1365,0,2),(140918,1366,0,2),(140920,1367,0,2),(140922,1368,61.2903,2),(140923,1369,61.2903,2),(140924,843,0,2),(140926,844,0,2),(140928,845,0,2),(140930,846,0,2),(140932,847,0,2),(140934,848,0,2),(140936,849,0,2),(140938,850,48.3871,2),(140939,851,48.3871,2),(140940,852,48.3871,2),(140941,853,48.3871,2),(140942,854,0,2),(140944,855,48.3871,2),(140945,856,48.3871,2),(140946,857,48.3871,2),(140947,858,48.3871,2),(140948,859,48.3871,2),(140949,860,48.3871,2),(140950,861,48.3871,2),(140951,862,48.3871,2),(140952,863,48.3871,2),(140953,864,48.3871,2),(140954,865,48.3871,2),(140955,866,48.3871,2),(140956,867,48.3871,2),(140957,868,48.3871,2),(140958,869,48.3871,2),(140959,870,48.3871,2),(140960,871,48.3871,2),(140961,872,48.3871,2),(140962,873,48.3871,2),(140963,657,112.903,2),(140965,658,112.903,2),(140967,659,112.903,2),(140969,660,112.903,2),(140970,661,112.903,2),(140971,662,112.903,2),(140972,663,112.903,2),(140973,664,112.903,2),(140974,665,112.903,2),(140975,666,112.903,2),(140976,667,112.903,2),(140977,668,112.903,2),(140978,669,112.903,2),(140979,670,0,2),(140981,671,112.903,2),(140982,672,112.903,2),(140983,673,112.903,2),(140984,674,112.903,2),(140985,675,112.903,2),(140986,676,112.903,2),(140987,677,112.903,2),(140988,678,112.903,2),(140989,679,112.903,2),(140990,680,112.903,2),(140991,681,112.903,2),(140992,682,112.903,2),(140993,683,112.903,2),(140994,684,112.903,2),(140995,685,112.903,2),(140996,686,112.903,2),(140997,687,112.903,2),(140998,1122,0,2),(141000,1123,0,2),(141002,1124,0,2),(141004,1125,0,2),(141006,1126,0,2),(141008,1127,0,2),(141010,1128,0,2),(141012,1129,0,2),(141014,1130,0,2),(141016,1131,0,2),(141018,1132,0,2),(141020,1133,0,2),(141022,1134,61.2903,2),(141024,1135,61.2903,2),(141026,1136,61.2903,2),(141028,1137,61.2903,2),(141029,1138,61.2903,2),(141030,1139,61.2903,2),(141031,1140,61.2903,2),(141032,1141,61.2903,2),(141033,1142,61.2903,2),(141034,1143,61.2903,2),(141035,1144,61.2903,2),(141036,1145,61.2903,2),(141037,1146,61.2903,2),(141038,1147,61.2903,2),(141039,1148,61.2903,2),(141040,1149,61.2903,2),(141041,1150,61.2903,2),(141042,1151,61.2903,2),(141043,1152,61.2903,2),(141044,781,0,2),(141046,782,0,2),(141048,783,0,2),(141050,784,0,2),(141052,785,0,2),(141054,786,0,2),(141056,787,0,2),(141058,788,0,2),(141060,789,0,2),(141062,790,0,2),(141064,791,0,2),(141066,792,0,2),(141068,793,80.6452,2),(141070,794,80.6452,2),(141072,795,80.6452,2),(141074,796,0,2),(141076,797,0,2),(141078,798,0,2),(141080,799,0,2),(141082,800,0,2),(141084,801,0,2),(141086,802,0,2),(141088,803,0,2),(141090,804,0,2),(141092,805,0,2),(141094,806,0,2),(141096,807,0,2),(141098,808,0,2),(141100,809,80.6452,2),(141101,810,80.6452,2),(141102,811,80.6452,2),(141103,1029,70.9677,2),(141104,1030,70.9677,2),(141105,1031,70.9677,2),(141106,1032,70.9677,2),(141107,1033,70.9677,2),(141108,1034,70.9677,2),(141109,1035,70.9677,2),(141110,1036,70.9677,2),(141111,1037,70.9677,2),(141112,1038,70.9677,2),(141113,1039,70.9677,2),(141114,1040,70.9677,2),(141115,1041,70.9677,2),(141116,1042,70.9677,2),(141117,1043,70.9677,2),(141118,1044,70.9677,2),(141120,1045,70.9677,2),(141122,1046,70.9677,2),(141124,1047,70.9677,2),(141126,1048,70.9677,2),(141128,1049,70.9677,2),(141130,1050,70.9677,2),(141132,1051,70.9677,2),(141134,1052,70.9677,2),(141136,1053,70.9677,2),(141138,1054,70.9677,2),(141140,1055,0,2),(141142,1056,0,2),(141144,1057,0,2),(141146,1058,0,2),(141148,1059,0,2),(141150,1091,48.3871,2),(141152,1092,48.3871,2),(141154,1093,48.3871,2),(141156,1094,48.3871,2),(141158,1095,48.3871,2),(141160,1096,48.3871,2),(141162,1097,48.3871,2),(141164,1098,48.3871,2),(141166,1099,48.3871,2),(141168,1100,48.3871,2),(141170,1101,48.3871,2),(141172,1102,48.3871,2),(141174,1103,48.3871,2),(141176,1104,48.3871,2),(141178,1105,48.3871,2),(141180,1106,48.3871,2),(141182,1107,48.3871,2),(141184,1108,48.3871,2),(141186,1109,48.3871,2),(141188,1110,48.3871,2),(141190,1111,48.3871,2),(141192,1112,48.3871,2),(141194,1113,0,2),(141196,1114,0,2),(141198,1115,0,2),(141200,1116,0,2),(141202,1117,0,2),(141204,1118,0,2),(141206,1119,0,2),(141208,1120,0,2),(141210,1121,0,2),(141212,1060,80.6452,2),(141214,1061,80.6452,2),(141216,1062,80.6452,2),(141218,1063,80.6452,2),(141220,1064,80.6452,2),(141222,1065,80.6452,2),(141224,1066,0,2),(141226,1067,0,2),(141228,1068,0,2),(141230,1069,0,2),(141232,1070,0,2),(141234,1071,0,2),(141236,1072,0,2),(141238,1073,0,2),(141240,1074,0,2),(141242,1075,80.6452,2),(141243,1076,80.6452,2),(141244,1077,80.6452,2),(141245,1078,80.6452,2),(141246,1079,80.6452,2),(141247,1080,80.6452,2),(141248,1081,80.6452,2),(141249,1082,80.6452,2),(141250,1083,80.6452,2),(141251,1084,80.6452,2),(141252,1085,80.6452,2),(141253,1086,80.6452,2),(141254,1087,80.6452,2),(141255,1088,80.6452,2),(141256,1089,80.6452,2),(141257,1090,80.6452,2),(141258,1153,70.9677,2),(141260,1154,70.9677,2),(141262,1155,0,2),(141264,1156,0,2),(141266,1157,0,2),(141268,1158,0,2),(141270,1159,0,2),(141272,1160,0,2),(141274,1161,0,2),(141276,1162,0,2),(141278,1163,0,2),(141280,1164,0,2),(141282,1165,0,2),(141284,1166,0,2),(141286,1167,0,2),(141288,1168,0,2),(141290,1169,0,2),(141292,1170,0,2),(141294,1171,0,2),(141296,1172,0,2),(141298,1173,0,2),(141300,1174,0,2),(141302,1175,0,2),(141304,1176,0,2),(141306,1177,0,2),(141308,1178,0,2),(141310,1179,0,2),(141312,1180,0,2),(141314,1181,0,2),(141316,1182,0,2),(141318,1183,0,2),(141320,1371,360,2),(141321,1372,360,2),(141322,1373,360,2),(141323,1374,360,2),(141324,1375,360,2),(141325,936,61.2903,2),(141326,937,61.2903,2),(141327,938,61.2903,2),(141328,939,61.2903,2),(141329,940,61.2903,2),(141330,941,61.2903,2),(141332,942,61.2903,2),(141334,943,61.2903,2),(141335,944,61.2903,2),(141336,945,61.2903,2),(141337,946,61.2903,2),(141338,947,61.2903,2),(141339,948,61.2903,2),(141341,949,61.2903,2),(141343,950,61.2903,2),(141344,951,61.2903,2),(141345,952,0,2),(141347,953,0,2),(141349,954,0,2),(141351,955,61.2903,2),(141353,956,61.2903,2),(141355,957,61.2903,2),(141356,958,61.2903,2),(141357,959,61.2903,2),(141358,960,61.2903,2),(141359,961,61.2903,2),(141360,962,61.2903,2),(141362,963,61.2903,2),(141364,964,61.2903,2),(141365,965,61.2903,2),(141366,966,61.2903,2),(141367,998,0,2),(141369,999,0,2),(141371,1000,0,2),(141373,1001,0,2),(141375,1002,0,2),(141377,1003,0,2),(141379,1004,0,2),(141381,1005,0,2),(141383,1006,0,2),(141385,1007,0,2),(141387,1008,0,2),(141389,1009,0,2),(141391,1010,0,2),(141393,1011,0,2),(141395,1012,0,2),(141397,1013,0,2),(141399,1014,0,2),(141401,1015,0,2),(141403,1016,0,2),(141405,1017,48.3871,2),(141406,1018,48.3871,2),(141407,1019,48.3871,2),(141408,1020,48.3871,2),(141409,1021,48.3871,2),(141410,1022,48.3871,2),(141411,1023,48.3871,2),(141412,1024,48.3871,2),(141413,1025,48.3871,2),(141414,1026,48.3871,2),(141415,1027,48.3871,2),(141416,1028,48.3871,2),(141417,967,0,2),(141419,968,0,2),(141421,969,0,2),(141423,970,0,2),(141425,971,0,2),(141427,972,0,2),(141429,973,0,2),(141431,974,0,2),(141433,975,0,2),(141435,976,0,2),(141437,977,0,2),(141439,978,0,2),(141441,979,0,2),(141443,980,0,2),(141445,981,48.3871,2),(141446,982,48.3871,2),(141447,983,0,2),(141449,984,48.3871,2),(141450,985,48.3871,2),(141451,986,48.3871,2),(141453,987,48.3871,2),(141455,988,48.3871,2),(141456,989,48.3871,2),(141457,990,48.3871,2),(141458,991,48.3871,2),(141459,992,48.3871,2),(141460,993,48.3871,2),(141462,994,48.3871,2),(141464,995,48.3871,2),(141465,996,48.3871,2),(141466,997,48.3871,2);
/*!40000 ALTER TABLE `pagotareo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `idPeriodo` int NOT NULL AUTO_INCREMENT,
  `NombrePeriodo` varchar(45) NOT NULL,
  `DiaDeInicioDelPeriodo` date NOT NULL,
  `DiaDeFinDelPeriodo` date NOT NULL,
  `CantidadDeDias` int NOT NULL,
  PRIMARY KEY (`idPeriodo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'DICIEMBRE 2022 - ENERO 2023','2022-12-16','2023-01-15',30),(2,'ENERO 2023 - FEBRERO 2023','2023-01-16','2023-02-15',30),(3,'FEBRERO 2023 - MARZO 2023','2023-02-16','2023-03-15',27),(4,'MARZO 2023 - ABRIL 2023','2023-03-16','2023-04-15',30),(5,'ABRIL 2023 - MAYO 2023','2023-04-16','2023-05-15',29),(6,'MAYO 2023 - JUNIO 2023','2023-05-16','2023-06-15',30),(7,'JUNIO 2023 - JULIO 2023','2023-06-16','2023-07-15',29),(8,'JULIO 2023 - AGOSTO 2023','2023-07-16','2023-08-15',30),(9,'AGOSTO 2023 - SEPTIEMBRE 2023','2023-08-16','2023-09-15',30),(10,'SEPTIEMBRE 2023 - OCTUBRE 2023','2023-09-16','2023-10-15',29),(11,'OCTUBRE 2023 - NOVIEMBRE 2023','2023-10-16','2023-11-15',30),(12,'NOVIEMBRE 2023 - DICIEMBRE 2023','2023-11-16','2023-12-15',29);
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(45) NOT NULL,
  `ApellidoPaterno` varchar(45) NOT NULL,
  `ApellidoMaterno` varchar(45) NOT NULL,
  `DNI` varchar(10) NOT NULL,
  `Telefono` varchar(13) NOT NULL,
  `TelefonoFijo` varchar(10) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ContactoDeEmergencia` varchar(100) DEFAULT NULL,
  `NumeroDeEmergencia` varchar(13) DEFAULT NULL,
  `idLocalidadDeNacimiento` int DEFAULT NULL,
  `idLocalidadActual` int DEFAULT NULL,
  `idDireccion` int DEFAULT NULL,
  `FechaDeNacimiento` date DEFAULT NULL,
  `idTipoDeSangre` int DEFAULT NULL,
  `Alergias` varchar(100) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  KEY `FKPersona_Localidad` (`idLocalidadDeNacimiento`) /*!80000 INVISIBLE */,
  KEY `FK_Persona_TipoDeSangre_idx` (`idTipoDeSangre`),
  KEY `FK_Persona_LocalidadActual_idx` (`idLocalidadActual`),
  KEY `FK_Persona_Direccion_idx` (`idDireccion`),
  CONSTRAINT `FK_Persona_Direccion` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`idDireccion`),
  CONSTRAINT `FK_Persona_LocalidadActual` FOREIGN KEY (`idLocalidadActual`) REFERENCES `localidad` (`idLocalidad`),
  CONSTRAINT `FK_Persona_LocalidadNacimiento` FOREIGN KEY (`idLocalidadDeNacimiento`) REFERENCES `localidad` (`idLocalidad`),
  CONSTRAINT `FK_Persona_TipoDeSangre` FOREIGN KEY (`idTipoDeSangre`) REFERENCES `tipodesangre` (`idTipoDeSangre`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Marco','Arenas','Paredes','72234614','977304124','1','1marcoarenas@gmail.com','1','1',NULL,1,1,'1996-01-04',1,'1',NULL,NULL),(2,'Yulissa Fernanda','Portilla','Zenteno','71892788','982533550','1','zenteno.1608@hotmail.com','1','1',NULL,1,1,'1995-08-16',1,'1',NULL,NULL),(3,'Darwin Gabriel','Ponce','Bravo','73665141','993021598','996891993','darwin.poncebg@gmail.com','1','1',NULL,1,1,'1995-04-09',1,'1',NULL,NULL),(4,'Agabito Lucho','Huamani','Gonzales','46196819','989281583','1','agabitoluchoh@gmail.com','1','1',NULL,1,1,'1988-08-18',1,'1',NULL,NULL),(5,'Darlis','Cruz','Chinchay','76807957','996761084','1','darlis155@gmail.com','1','1',NULL,1,1,'1996-10-15',1,'1',NULL,NULL),(6,'Alex Alejandro','Sayre','Salcedo','72798502','960903897','1','alejandroalexxx26@gmail.com','1','1',NULL,1,1,'1993-08-26',1,'1',NULL,NULL),(7,'Jhon Yosmeil','Juno','Huamani','74545082','968592430','1','yosmeiljuno@gmail.com','1','1',NULL,1,1,'1999-12-16',1,'1',NULL,NULL),(8,'Yasmany Franco','Pacheco','Ruiz','44643645','962719632','1','pachecoyf30@gmail.com','1','1',NULL,1,1,'1987-01-05',1,'1',NULL,NULL),(9,'Sergio Manuel','Barreda','Quispe','75614709','913215147','1','sergiob.010501@gmail.com','1','1',NULL,1,1,'2001-05-01',1,'1',NULL,NULL),(10,'Cesar David','Paiva','Rivera','62684482','973596248','1','cesar_45paiva@hotmail.com','1','1',NULL,1,1,'1995-01-07',1,'1',NULL,NULL),(11,'Edwin Joel','Guevara','Pacheco','72766645','953839493','1','72766645@ucsm.edu.pe','1','1',NULL,1,1,'1996-07-13',1,'1',NULL,NULL),(12,'Oscar Bruno','Flores','Huarcallo','70947233','920050499','1','oscarlibra94@gmail.com','1','1',NULL,1,1,'1994-06-10',1,'1',NULL,NULL),(13,'Brian Hector','Barrios','Medina','70693038','942123429','1','bbarriosm@outlook.com','1','1',NULL,1,1,'1993-03-11',1,'1',NULL,NULL),(14,'Moises Adan','Zevallos','Zapana','44709459','934144522','1','mzevallos08@gmail.com','1','1',NULL,1,1,'1987-10-02',1,'1',NULL,NULL),(15,'Jorge','Torres','Huilca','43035965','941155978','1','jorgetorreshuillca@gmail.com','1','1',NULL,1,1,'1981-01-18',1,'1',NULL,NULL),(16,'Jimmy Miguel','Quispe','Asencio','73673915','952725993','1','elsenior05@gmail.com','1','1',NULL,1,1,'1996-09-23',1,'1',NULL,NULL),(17,'Amilcar','Romero','Ancalla','47266814','988893177','1','Amilcarromeroancalla@gmail.com','1','1',NULL,1,1,'1991-08-24',1,'1',NULL,NULL),(18,'Carlos Hernan','Chancafe','Angeles','42074946','974792794','1','Carlos.Chancafe@jpingenieria.pe','1','1',NULL,1,1,'1983-09-14',1,'1',NULL,NULL),(19,'Diego Armando','Masias','Perez','47124542','983385155','1','conejito_la_muerte_156@hotmail.com','1','1',NULL,1,1,'1992-07-15',1,'1',NULL,NULL),(20,'Johnny','Chata','Gonzales','46296286','957745711','1','jondra2690@hotmail.com','1','1',NULL,1,1,'1990-04-26',1,'1',NULL,NULL),(21,'Mario David','Ovalle','Chancolla','73938513','988428687','1','vicokataleya100pre@gmail.com','1','1',NULL,1,1,'1995-11-03',1,'1',NULL,NULL),(22,'Mechil','Chilingano','Damiano','47229770','956413364','1','Chilingano2017@gmail.com','1','1',NULL,1,1,'1992-03-03',1,'1',NULL,NULL),(23,'Willian','Araujo','Yallercco','47536746','953445937','1','arunwill3.0@gmail.com','1','1',NULL,1,1,'1989-12-09',1,'1',NULL,NULL),(24,'Luis Armando','Islache','Ortiz','44668891','965280441','1','lislache210@gmail.com','1','1',NULL,1,1,'1986-12-10',1,'1',NULL,NULL),(25,'Arturo','Carcausto','Machicado','47490509','980344293','1','arturto.carcausto@gmail.com','1','1',NULL,1,1,'1991-09-23',1,'1',NULL,NULL),(26,'Ebert','Rivera','Maque','46522287','944901821','1','ebertrm@hotmail.com','1','1',NULL,1,1,'1990-09-05',1,'1',NULL,NULL),(27,'Brayan Junior','Vizarreta','Huayapa','72397293','993743375','1','junior.vizarreta.19@gmail.com','1','1',NULL,1,1,'1998-07-08',1,'1',NULL,NULL),(28,'Ricardo Sebastian','Ranilla','Mejía','71094780','951098128','1','rranilla@unsa.edu.pe','1','1',NULL,1,1,'1999-08-08',1,'1',NULL,NULL),(29,'MARCO','ARENAS','PAREDES','88997766','993399445','','PEVV2016@GMAIL.COM','','',1,1,1,'2000-01-01',1,'',NULL,NULL),(30,'MARCO','ARENAS','PAREDES','99887766','987654876','','pevv2016@gmail.com','DIEGO','1345',335,12,23,'1994-06-08',3,'',NULL,NULL),(31,'ALEX','ARAPA','MENDOZA','77221745','99999999','','ADSAD@GMAIL.COM','','',1,1,1,'2000-01-01',1,'',NULL,NULL),(32,'AD','QE','QRE','8765345','98898989','','KLJK@GMAIL','','',1,1,1,'2000-01-01',1,'',NULL,NULL);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planilla`
--

DROP TABLE IF EXISTS `planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planilla` (
  `idPlanilla` int NOT NULL AUTO_INCREMENT,
  `idPeriodo` int NOT NULL,
  `idDatosContables` int NOT NULL,
  `TotalNetoAPagar` float NOT NULL DEFAULT '0',
  `PagoEsSalud` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`idPlanilla`),
  KEY `FK_Planilla_DatosContables_idx` (`idDatosContables`),
  KEY `FK_Planilla_Periodo_idx` (`idPeriodo`),
  CONSTRAINT `FK_Planilla_DatosContables` FOREIGN KEY (`idDatosContables`) REFERENCES `datoscontables` (`idDatosContables`),
  CONSTRAINT `FK_Planilla_Periodo` FOREIGN KEY (`idPeriodo`) REFERENCES `periodo` (`idPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planilla`
--

LOCK TABLES `planilla` WRITE;
/*!40000 ALTER TABLE `planilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `planilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimientodehabilitacion`
--

DROP TABLE IF EXISTS `procedimientodehabilitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimientodehabilitacion` (
  `idProcedimientoDeHabilitacion` int NOT NULL AUTO_INCREMENT,
  `idProyecto` int DEFAULT NULL,
  `Nombre` text,
  `idEtapaDeProcemientoDeHabilitacion` int DEFAULT NULL,
  PRIMARY KEY (`idProcedimientoDeHabilitacion`),
  KEY `FK_ProcedimientoDeHabilitacion_Proyecto_idx` (`idProyecto`),
  KEY `FK_ProcdimientoDeHabilitacion_EtapaDeProcedimiento_idx` (`idEtapaDeProcemientoDeHabilitacion`),
  CONSTRAINT `FK_ProcdimientoDeHabilitacion_EtapaDeProcedimiento` FOREIGN KEY (`idEtapaDeProcemientoDeHabilitacion`) REFERENCES `etapadeprocedimientodehabilitacion` (`idEtapaDeProcedimientoDeHabilitacion`),
  CONSTRAINT `FK_ProcedimientoDeHabilitacion_Proyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimientodehabilitacion`
--

LOCK TABLES `procedimientodehabilitacion` WRITE;
/*!40000 ALTER TABLE `procedimientodehabilitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `procedimientodehabilitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `idProyecto` int NOT NULL AUTO_INCREMENT,
  `NombreProyecto` varchar(100) NOT NULL,
  PRIMARY KEY (`idProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrodehabilitacion`
--

DROP TABLE IF EXISTS `registrodehabilitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrodehabilitacion` (
  `idRegistroDeHabilitacion` int NOT NULL AUTO_INCREMENT,
  `idEmpleado` int NOT NULL,
  `idEstadoDeHabiliatacion` int NOT NULL,
  `idProcedimientoDeHabilitacion` int NOT NULL,
  PRIMARY KEY (`idRegistroDeHabilitacion`),
  KEY `FK_RegistroDeHabiliatacion_EstadoDeHabilitacion_idx` (`idEstadoDeHabiliatacion`),
  KEY `FK_RegistroDeHabiliatacion_ProcedimientoDeHabilitacion_idx` (`idProcedimientoDeHabilitacion`),
  KEY `FK_RegistroDeHabiliatacion_Empleado_idx` (`idEmpleado`),
  CONSTRAINT `FK_RegistroDeHabiliatacion_Empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `FK_RegistroDeHabiliatacion_EstadoDeHabilitacion` FOREIGN KEY (`idEstadoDeHabiliatacion`) REFERENCES `estadodehabilitacion` (`idEstadoDeHabilitacion`),
  CONSTRAINT `FK_RegistroDeHabiliatacion_ProcedimientoDeHabilitacion` FOREIGN KEY (`idProcedimientoDeHabilitacion`) REFERENCES `procedimientodehabilitacion` (`idProcedimientoDeHabilitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrodehabilitacion`
--

LOCK TABLES `registrodehabilitacion` WRITE;
/*!40000 ALTER TABLE `registrodehabilitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrodehabilitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segurocomplementariodetrabajoderiesgo`
--

DROP TABLE IF EXISTS `segurocomplementariodetrabajoderiesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segurocomplementariodetrabajoderiesgo` (
  `idSeguroComplementarioDeTrabajoDeRiesgo` int NOT NULL AUTO_INCREMENT,
  `idEmpleado` int NOT NULL,
  `idProyecto` int NOT NULL,
  `FechaDeEmisionDeCetificado` date DEFAULT NULL,
  `FechaDeCaducidadDeCertificado` date DEFAULT NULL,
  PRIMARY KEY (`idSeguroComplementarioDeTrabajoDeRiesgo`),
  KEY `FK_SCTR_Proyecto_idx` (`idProyecto`),
  KEY `FK_SCTR_Empleado_idx` (`idEmpleado`),
  CONSTRAINT `FK_SCTR_Empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `FK_SCTR_Proyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`idProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segurocomplementariodetrabajoderiesgo`
--

LOCK TABLES `segurocomplementariodetrabajoderiesgo` WRITE;
/*!40000 ALTER TABLE `segurocomplementariodetrabajoderiesgo` DISABLE KEYS */;
/*!40000 ALTER TABLE `segurocomplementariodetrabajoderiesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareo`
--

DROP TABLE IF EXISTS `tareo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareo` (
  `idTareo` int NOT NULL AUTO_INCREMENT,
  `idContrato` int NOT NULL,
  `Fecha` date NOT NULL,
  `HoraDeIngreso` time NOT NULL,
  `HoraDeInicioDeAlmuerzo` time NOT NULL,
  `HoraDeFinDeAlmuerzo` time NOT NULL,
  `HoraDeSalida` time NOT NULL,
  `idCondicionDeTareo` int DEFAULT NULL,
  `idEstacionDeTrabajo` int NOT NULL,
  `idLicenciaConGoceDeHaber` int DEFAULT NULL,
  `idLicenciaSinGoceDeHaber` int DEFAULT NULL,
  `idDescansoMedico` int DEFAULT NULL,
  `idHorasExtras` int DEFAULT NULL,
  `idVacaciones` int DEFAULT NULL,
  PRIMARY KEY (`idTareo`),
  KEY `FK_Tareo_CondicionDeTareo_idx` (`idCondicionDeTareo`),
  KEY `FK_Tareo_EstacionDeTrabajo_idx` (`idEstacionDeTrabajo`),
  KEY `FK_Tareo_LicenciaSinGoceDeHaber_idx` (`idLicenciaSinGoceDeHaber`),
  KEY `FK_Tareo_DescansoMedico_idx` (`idDescansoMedico`),
  KEY `FK_Tareo_Contrato_idx` (`idContrato`),
  KEY `FK_Tareo_HorasExtras_idx` (`idHorasExtras`),
  KEY `FK_Tareo_Vacaciones_idx` (`idVacaciones`),
  CONSTRAINT `FK_Tareo_CondicionDeTareo` FOREIGN KEY (`idCondicionDeTareo`) REFERENCES `condiciondetareo` (`idCondicionDeTareo`),
  CONSTRAINT `FK_Tareo_Contrato` FOREIGN KEY (`idContrato`) REFERENCES `contrato` (`idContrato`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Tareo_DescansoMedico` FOREIGN KEY (`idDescansoMedico`) REFERENCES `descansomedico` (`idDescansoMedico`),
  CONSTRAINT `FK_Tareo_EstacionDeTrabajo` FOREIGN KEY (`idEstacionDeTrabajo`) REFERENCES `estaciondetrabajo` (`idEstacionDeTrabajo`),
  CONSTRAINT `FK_Tareo_HorasExtras` FOREIGN KEY (`idHorasExtras`) REFERENCES `horasextras` (`idHorasExtras`),
  CONSTRAINT `FK_Tareo_LicenciaConGoceDeHaber` FOREIGN KEY (`idLicenciaSinGoceDeHaber`) REFERENCES `licenciacongocedehaber` (`idLicenciaConGoceDeHaber`),
  CONSTRAINT `FK_Tareo_LicenciaSinGoceDeHaber` FOREIGN KEY (`idLicenciaSinGoceDeHaber`) REFERENCES `licenciasingocedehaber` (`idLicenciaSinGoceDeHaber`),
  CONSTRAINT `FK_Tareo_Vacaciones` FOREIGN KEY (`idVacaciones`) REFERENCES `vacaciones` (`idVacaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=1376 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareo`
--

LOCK TABLES `tareo` WRITE;
/*!40000 ALTER TABLE `tareo` DISABLE KEYS */;
INSERT INTO `tareo` VALUES (564,1,'2023-01-16','07:30:00','13:30:00','14:00:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(565,1,'2023-01-17','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(566,1,'2023-01-18','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(567,1,'2023-01-19','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(568,1,'2023-01-20','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(569,1,'2023-01-21','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(570,1,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(571,1,'2023-01-23','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(572,1,'2023-01-24','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(573,1,'2023-01-25','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(574,1,'2023-01-26','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(575,1,'2023-01-27','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(576,1,'2023-01-28','07:30:00','13:00:00','13:00:00','13:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(577,1,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(578,1,'2023-01-30','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(579,1,'2023-01-31','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(580,1,'2023-02-01','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(581,1,'2023-02-02','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(582,1,'2023-02-03','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(583,1,'2023-02-04','07:30:00','13:00:00','13:00:00','13:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(584,1,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(585,1,'2023-02-06','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(586,1,'2023-02-07','07:30:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(587,1,'2023-02-08','07:30:00','13:00:00','14:00:00','20:00:00',10,7,NULL,NULL,NULL,NULL,NULL),(588,1,'2023-02-09','07:30:00','12:00:00','13:00:00','18:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(589,1,'2023-02-10','07:30:00','12:00:00','13:00:00','18:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(590,1,'2023-02-11','07:00:00','13:00:00','14:00:00','20:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(591,1,'2023-02-12','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(592,1,'2023-02-13','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(593,1,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(594,1,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(595,2,'2023-01-16','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(596,2,'2023-01-17','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(597,2,'2023-01-18','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(598,2,'2023-01-19','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(599,2,'2023-01-20','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(600,2,'2023-01-21','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(601,2,'2023-01-22','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(602,2,'2023-01-23','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(603,2,'2023-01-24','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(604,2,'2023-01-25','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(605,2,'2023-01-26','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(606,2,'2023-01-27','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(607,2,'2023-01-28','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(608,2,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(609,2,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(610,2,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(611,2,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(612,2,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(613,2,'2023-02-03','11:00:00','16:30:00','16:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(614,2,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(615,2,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(616,2,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(617,2,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(618,2,'2023-02-08','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(619,2,'2023-02-09','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(620,2,'2023-02-10','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(621,2,'2023-02-11','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(622,2,'2023-02-12','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(623,2,'2023-02-13','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(624,2,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(625,2,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(626,11,'2023-01-16','07:00:00','13:30:00','14:00:00','17:00:00',1,1,NULL,NULL,NULL,8,NULL),(627,11,'2023-01-17','08:30:00','15:00:00','15:30:00','17:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(628,11,'2023-01-18','08:00:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(629,11,'2023-01-19','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(630,11,'2023-01-20','08:00:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(631,11,'2023-01-21','08:00:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(632,11,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(633,11,'2023-01-23','08:00:00','13:00:00','13:30:00','19:45:00',1,1,NULL,NULL,NULL,7,NULL),(634,11,'2023-01-24','08:00:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(635,11,'2023-01-25','08:00:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(636,11,'2023-01-26','08:00:00','13:00:00','13:30:00','17:15:00',1,1,NULL,NULL,NULL,NULL,NULL),(637,11,'2023-01-27','08:00:00','13:00:00','13:30:00','17:15:00',1,1,NULL,NULL,NULL,NULL,NULL),(638,11,'2023-01-28','08:15:00','13:30:00','13:30:00','13:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(639,11,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(640,11,'2023-01-30','08:00:00','17:00:00','17:00:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(641,11,'2023-01-31','08:00:00','17:30:00','17:30:00','17:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(642,11,'2023-02-01','08:15:00','13:00:00','13:30:00','17:15:00',1,1,NULL,NULL,NULL,NULL,NULL),(643,11,'2023-02-02','08:15:00','16:50:00','16:50:00','16:50:00',1,1,NULL,NULL,NULL,NULL,NULL),(644,11,'2023-02-03','08:00:00','17:15:00','17:15:00','17:15:00',1,1,NULL,NULL,NULL,NULL,NULL),(645,11,'2023-02-04','07:15:00','13:15:00','13:15:00','13:15:00',1,1,NULL,NULL,NULL,NULL,NULL),(646,11,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(647,11,'2023-02-06','07:40:00','13:30:00','14:00:00','17:15:00',1,1,NULL,NULL,NULL,NULL,NULL),(648,11,'2023-02-07','07:40:00','13:00:00','13:30:00','18:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(649,11,'2023-02-08','08:30:00','18:30:00','18:30:00','18:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(650,11,'2023-02-09','08:30:00','16:00:00','16:00:00','16:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(651,11,'2023-02-10','07:30:00','12:00:00','13:00:00','18:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(652,11,'2023-02-11','07:00:00','13:00:00','14:00:00','20:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(653,11,'2023-02-12','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(654,11,'2023-02-13','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(655,11,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(656,11,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(657,18,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(658,18,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(659,18,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(660,18,'2023-01-19','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(661,18,'2023-01-20','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(662,18,'2023-01-21','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(663,18,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(664,18,'2023-01-23','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(665,18,'2023-01-24','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(666,18,'2023-01-25','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(667,18,'2023-01-26','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(668,18,'2023-01-27','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(669,18,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(670,18,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(671,18,'2023-01-30','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(672,18,'2023-01-31','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(673,18,'2023-02-01','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(674,18,'2023-02-02','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(675,18,'2023-02-03','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(676,18,'2023-02-04','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(677,18,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(678,18,'2023-02-06','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(679,18,'2023-02-07','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(680,18,'2023-02-08','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(681,18,'2023-02-09','07:30:00','14:00:00','15:00:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(682,18,'2023-02-10','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(683,18,'2023-02-11','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(684,18,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(685,18,'2023-02-13','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(686,18,'2023-02-14','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(687,18,'2023-02-15','07:30:00','15:30:00','15:30:00','15:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(688,6,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(689,6,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(690,6,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(691,6,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(692,6,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(693,6,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(694,6,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(695,6,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(696,6,'2023-01-24','07:30:00','13:00:00','14:00:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(697,6,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(698,6,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(699,6,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(700,6,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(701,6,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(702,6,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(703,6,'2023-01-31','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(704,6,'2023-02-01','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(705,6,'2023-02-02','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(706,6,'2023-02-03','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(707,6,'2023-02-04','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(708,6,'2023-02-05','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(709,6,'2023-02-06','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(710,6,'2023-02-07','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(711,6,'2023-02-08','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(712,6,'2023-02-09','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(713,6,'2023-02-10','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(714,6,'2023-02-11','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(715,6,'2023-02-12','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(716,6,'2023-02-13','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(717,6,'2023-02-14','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(718,6,'2023-02-15','00:00:00','00:00:00','00:00:00','00:00:00',7,1,NULL,NULL,NULL,NULL,NULL),(719,13,'2023-01-16','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(720,13,'2023-01-17','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(721,13,'2023-01-18','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(722,13,'2023-01-19','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(723,13,'2023-01-20','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(724,13,'2023-01-21','07:30:00','13:00:00','13:00:00','13:00:00',1,1,19,NULL,NULL,NULL,NULL),(725,13,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',1,1,19,NULL,NULL,NULL,NULL),(726,13,'2023-01-23','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(727,13,'2023-01-24','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(728,13,'2023-01-25','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(729,13,'2023-01-26','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(730,13,'2023-01-27','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(731,13,'2023-01-28','07:30:00','13:00:00','13:00:00','13:00:00',1,1,19,NULL,NULL,NULL,NULL),(732,13,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',1,1,19,NULL,NULL,NULL,NULL),(733,13,'2023-01-30','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(734,13,'2023-01-31','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(735,13,'2023-02-01','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(736,13,'2023-02-02','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(737,13,'2023-02-03','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(738,13,'2023-02-04','07:30:00','13:00:00','13:00:00','13:00:00',1,1,19,NULL,NULL,NULL,NULL),(739,13,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,19,NULL,NULL,NULL,NULL),(740,13,'2023-02-06','07:30:00','13:00:00','13:30:00','16:30:00',1,1,19,NULL,NULL,NULL,NULL),(741,13,'2023-02-07','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(742,13,'2023-02-08','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(743,13,'2023-02-09','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(744,13,'2023-02-10','00:00:00','00:00:00','00:00:00','00:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(745,13,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(746,13,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(747,13,'2023-02-13','00:00:00','00:00:00','00:00:00','00:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(748,13,'2023-02-14','00:00:00','00:00:00','00:00:00','00:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(749,13,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(750,14,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(751,14,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(752,14,'2023-01-18','11:00:00','13:00:00','13:30:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(753,14,'2023-01-19','07:50:00','12:30:00','13:00:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(754,14,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(755,14,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(756,14,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(757,14,'2023-01-23','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(758,14,'2023-01-24','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(759,14,'2023-01-25','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(760,14,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(761,14,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(762,14,'2023-01-28','10:00:00','13:00:00','13:00:00','13:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(763,14,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(764,14,'2023-01-30','08:30:00','13:00:00','13:30:00','17:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(765,14,'2023-01-31','08:10:00','13:00:00','13:30:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(766,14,'2023-02-01','10:30:00','13:00:00','13:30:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(767,14,'2023-02-02','07:00:00','13:00:00','14:00:00','20:00:00',3,8,NULL,NULL,NULL,NULL,NULL),(768,14,'2023-02-03','07:00:00','13:00:00','14:00:00','20:00:00',3,8,NULL,NULL,NULL,NULL,NULL),(769,14,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(770,14,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(771,14,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(772,14,'2023-02-07','07:30:00','13:00:00','13:30:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(773,14,'2023-02-08','07:30:00','13:00:00','13:30:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(774,14,'2023-02-09','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(775,14,'2023-02-10','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(776,14,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(777,14,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(778,14,'2023-02-13','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(779,14,'2023-02-14','00:00:00','00:00:00','00:00:00','00:00:00',10,6,NULL,NULL,NULL,NULL,NULL),(780,14,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',3,6,NULL,NULL,NULL,NULL,NULL),(781,20,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(782,20,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(783,20,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(784,20,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(785,20,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(786,20,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(787,20,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(788,20,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(789,20,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(790,20,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(791,20,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(792,20,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(793,20,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',6,1,23,NULL,NULL,NULL,NULL),(794,20,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',6,1,23,NULL,NULL,NULL,NULL),(795,20,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',6,1,23,NULL,NULL,NULL,NULL),(796,20,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(797,20,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(798,20,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(799,20,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(800,20,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(801,20,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(802,20,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(803,20,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(804,20,'2023-02-08','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(805,20,'2023-02-09','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(806,20,'2023-02-10','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(807,20,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(808,20,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(809,20,'2023-02-13','07:30:00','18:00:00','18:00:00','18:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(810,20,'2023-02-14','08:00:00','17:30:00','17:30:00','17:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(811,20,'2023-02-15','08:00:00','12:00:00','13:00:00','17:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(812,12,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(813,12,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(814,12,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(815,12,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(816,12,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(817,12,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(818,12,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(819,12,'2023-01-23','07:30:00','13:20:00','14:00:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(820,12,'2023-01-24','07:30:00','13:15:00','13:50:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(821,12,'2023-01-25','07:50:00','13:25:00','14:00:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(822,12,'2023-01-26','07:30:00','13:20:00','14:00:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(823,12,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(824,12,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(825,12,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(826,12,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(827,12,'2023-01-31','07:30:00','13:20:00','13:50:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(828,12,'2023-02-01','07:30:00','13:10:00','13:40:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(829,12,'2023-02-02','07:30:00','13:00:00','13:30:00','16:50:00',1,1,NULL,NULL,NULL,NULL,NULL),(830,12,'2023-02-03','07:30:00','14:15:00','14:50:00','16:50:00',1,1,NULL,NULL,NULL,NULL,NULL),(831,12,'2023-02-04','07:30:00','13:15:00','13:15:00','13:15:00',1,1,NULL,NULL,NULL,NULL,NULL),(832,12,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(833,12,'2023-02-06','07:30:00','13:30:00','14:10:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(834,12,'2023-02-07','07:30:00','13:00:00','13:30:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(835,12,'2023-02-08','00:00:00','00:00:00','00:00:00','00:00:00',10,7,NULL,NULL,NULL,NULL,NULL),(836,12,'2023-02-09','07:30:00','12:00:00','13:00:00','18:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(837,12,'2023-02-10','07:30:00','12:00:00','13:00:00','18:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(838,12,'2023-02-11','07:00:00','13:00:00','14:00:00','20:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(839,12,'2023-02-12','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(840,12,'2023-02-13','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(841,12,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(842,12,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(843,16,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(844,16,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(845,16,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(846,16,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(847,16,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(848,16,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(849,16,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(850,16,'2023-01-23','07:30:00','13:20:00','14:00:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(851,16,'2023-01-24','07:30:00','13:20:00','13:50:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(852,16,'2023-01-25','07:30:00','16:30:00','16:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(853,16,'2023-01-26','07:30:00','13:20:00','14:00:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(854,16,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(855,16,'2023-01-28','07:30:00','13:00:00','13:00:00','13:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(856,16,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(857,16,'2023-01-30','07:30:00','13:20:00','13:50:00','16:50:00',1,1,NULL,NULL,NULL,NULL,NULL),(858,16,'2023-01-31','07:30:00','13:20:00','13:50:00','16:55:00',1,1,NULL,NULL,NULL,NULL,NULL),(859,16,'2023-02-01','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(860,16,'2023-02-02','07:30:00','13:00:00','13:30:00','16:50:00',1,1,NULL,NULL,NULL,NULL,NULL),(861,16,'2023-02-03','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(862,16,'2023-02-04','07:30:00','13:15:00','13:15:00','13:15:00',1,1,NULL,NULL,NULL,NULL,NULL),(863,16,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(864,16,'2023-02-06','07:30:00','13:30:00','14:00:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(865,16,'2023-02-07','07:30:00','13:20:00','13:50:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(866,16,'2023-02-08','07:30:00','13:20:00','13:50:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(867,16,'2023-02-09','07:30:00','13:20:00','13:50:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(868,16,'2023-02-10','07:30:00','13:20:00','13:50:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(869,16,'2023-02-11','07:30:00','14:00:00','14:00:00','14:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(870,16,'2023-02-12','00:00:00','01:00:00','02:00:00','03:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(871,16,'2023-02-13','07:30:00','13:20:00','13:50:00','21:20:00',1,1,NULL,NULL,NULL,NULL,NULL),(872,16,'2023-02-14','00:00:00','00:00:00','00:00:00','00:00:00',10,6,NULL,NULL,NULL,NULL,NULL),(873,16,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,6,NULL,NULL,NULL,NULL,NULL),(874,10,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(875,10,'2023-01-17','07:30:00','12:00:00','12:30:00','17:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(876,10,'2023-01-18','07:30:00','12:00:00','12:30:00','17:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(877,10,'2023-01-19','07:30:00','12:00:00','12:30:00','15:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(878,10,'2023-01-20','07:30:00','12:00:00','12:30:00','18:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(879,10,'2023-01-21','07:30:00','15:00:00','15:00:00','15:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(880,10,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(881,10,'2023-01-23','07:30:00','12:00:00','12:30:00','17:30:00',1,3,NULL,NULL,NULL,NULL,NULL),(882,10,'2023-01-24','07:30:00','12:00:00','12:30:00','18:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(883,10,'2023-01-25','07:30:00','12:00:00','12:30:00','16:30:00',1,3,NULL,NULL,NULL,NULL,NULL),(884,10,'2023-01-26','07:30:00','12:00:00','12:30:00','16:30:00',1,3,NULL,NULL,NULL,NULL,NULL),(885,10,'2023-01-27','07:30:00','14:00:00','14:30:00','18:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(886,10,'2023-01-28','07:30:00','13:00:00','13:00:00','13:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(887,10,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(888,10,'2023-01-30','07:30:00','13:00:00','13:30:00','17:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(889,10,'2023-01-31','07:30:00','13:00:00','13:30:00','16:50:00',1,1,NULL,NULL,NULL,NULL,NULL),(890,10,'2023-02-01','07:30:00','13:15:00','13:45:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(891,10,'2023-02-02','07:30:00','13:15:00','13:45:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(892,10,'2023-02-03','07:30:00','14:10:00','14:40:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(893,10,'2023-02-04','07:30:00','13:20:00','13:20:00','13:20:00',1,1,NULL,NULL,NULL,NULL,NULL),(894,10,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(895,10,'2023-02-06','07:30:00','13:30:00','14:00:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(896,10,'2023-02-07','07:30:00','13:30:00','14:00:00','17:10:00',1,1,NULL,NULL,NULL,NULL,NULL),(897,10,'2023-02-08','07:30:00','13:00:00','13:30:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(898,10,'2023-02-09','07:30:00','13:00:00','13:30:00','17:10:00',1,1,NULL,NULL,NULL,NULL,NULL),(899,10,'2023-02-10','07:30:00','12:00:00','13:00:00','18:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(900,10,'2023-02-11','07:00:00','13:00:00','14:00:00','20:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(901,10,'2023-02-12','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(902,10,'2023-02-13','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(903,10,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(904,10,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(905,9,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(906,9,'2023-01-17','07:30:00','12:00:00','12:30:00','17:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(907,9,'2023-01-18','07:30:00','12:00:00','12:30:00','17:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(908,9,'2023-01-19','07:30:00','12:00:00','12:30:00','15:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(909,9,'2023-01-20','07:30:00','12:00:00','12:30:00','18:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(910,9,'2023-01-21','07:30:00','15:00:00','15:00:00','15:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(911,9,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(912,9,'2023-01-23','07:30:00','12:00:00','12:30:00','17:30:00',1,3,NULL,NULL,NULL,NULL,NULL),(913,9,'2023-01-24','07:30:00','12:00:00','12:30:00','18:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(914,9,'2023-01-25','07:30:00','12:00:00','12:30:00','16:30:00',1,3,NULL,NULL,NULL,NULL,NULL),(915,9,'2023-01-26','07:30:00','12:00:00','12:30:00','16:30:00',1,3,NULL,NULL,NULL,NULL,NULL),(916,9,'2023-01-27','07:30:00','14:00:00','14:30:00','18:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(917,9,'2023-01-28','07:30:00','13:00:00','13:00:00','13:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(918,9,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(919,9,'2023-01-30','07:30:00','13:00:00','13:30:00','17:00:00',1,3,NULL,NULL,NULL,NULL,NULL),(920,9,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(921,9,'2023-02-01','07:30:00','13:15:00','13:45:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(922,9,'2023-02-02','07:30:00','13:10:00','13:45:00','16:45:00',1,1,NULL,NULL,NULL,NULL,NULL),(923,9,'2023-02-03','07:30:00','14:10:00','14:40:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(924,9,'2023-02-04','07:30:00','13:20:00','13:20:00','13:20:00',1,1,NULL,NULL,NULL,NULL,NULL),(925,9,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(926,9,'2023-02-06','07:30:00','13:30:00','14:00:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(927,9,'2023-02-07','07:30:00','13:30:00','14:00:00','17:10:00',1,1,NULL,NULL,NULL,NULL,NULL),(928,9,'2023-02-08','07:30:00','13:00:00','13:30:00','17:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(929,9,'2023-02-09','07:30:00','13:00:00','13:30:00','16:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(930,9,'2023-02-10','07:30:00','12:00:00','13:00:00','18:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(931,9,'2023-02-11','07:00:00','13:00:00','14:00:00','20:00:00',1,7,NULL,NULL,NULL,NULL,NULL),(932,9,'2023-02-12','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(933,9,'2023-02-13','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(934,9,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(935,9,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(936,26,'2023-01-16','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(937,26,'2023-01-17','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(938,26,'2023-01-18','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(939,26,'2023-01-19','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(940,26,'2023-01-20','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(941,26,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(942,26,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(943,26,'2023-01-23','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(944,26,'2023-01-24','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(945,26,'2023-01-25','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(946,26,'2023-01-26','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(947,26,'2023-01-27','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(948,26,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(949,26,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(950,26,'2023-01-30','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(951,26,'2023-01-31','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(952,26,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',3,8,NULL,NULL,NULL,NULL,NULL),(953,26,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',3,8,NULL,NULL,NULL,NULL,NULL),(954,26,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',3,8,NULL,NULL,NULL,NULL,NULL),(955,26,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(956,26,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(957,26,'2023-02-06','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(958,26,'2023-02-07','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(959,26,'2023-02-08','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(960,26,'2023-02-09','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(961,26,'2023-02-10','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(962,26,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(963,26,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(964,26,'2023-02-13','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(965,26,'2023-02-14','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(966,26,'2023-02-15','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(967,28,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(968,28,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(969,28,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(970,28,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(971,28,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(972,28,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(973,28,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(974,28,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(975,28,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(976,28,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(977,28,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(978,28,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(979,28,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(980,28,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(981,28,'2023-01-30','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(982,28,'2023-01-31','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(983,28,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',3,8,NULL,NULL,NULL,NULL,NULL),(984,28,'2023-02-02','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(985,28,'2023-02-03','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(986,28,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(987,28,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(988,28,'2023-02-06','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(989,28,'2023-02-07','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(990,28,'2023-02-08','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(991,28,'2023-02-09','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(992,28,'2023-02-10','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(993,28,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(994,28,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',7,8,NULL,NULL,NULL,NULL,NULL),(995,28,'2023-02-13','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(996,28,'2023-02-14','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(997,28,'2023-02-15','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(998,27,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(999,27,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1000,27,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1001,27,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1002,27,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1003,27,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1004,27,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1005,27,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1006,27,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1007,27,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1008,27,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1009,27,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1010,27,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1011,27,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1012,27,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1013,27,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1014,27,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1015,27,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1016,27,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1017,27,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(1018,27,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(1019,27,'2023-02-06','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1020,27,'2023-02-07','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1021,27,'2023-02-08','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1022,27,'2023-02-09','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1023,27,'2023-02-10','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1024,27,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1025,27,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1026,27,'2023-02-13','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1027,27,'2023-02-14','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1028,27,'2023-02-15','07:00:00','13:00:00','14:00:00','20:00:00',1,8,NULL,NULL,NULL,NULL,NULL),(1029,21,'2023-01-16','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1030,21,'2023-01-17','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1031,21,'2023-01-18','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1032,21,'2023-01-19','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1033,21,'2023-01-20','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1034,21,'2023-01-21','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1035,21,'2023-01-22','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1036,21,'2023-01-23','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1037,21,'2023-01-24','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1038,21,'2023-01-25','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1039,21,'2023-01-26','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1040,21,'2023-01-27','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1041,21,'2023-01-28','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1042,21,'2023-01-29','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1043,21,'2023-01-30','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1044,21,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1045,21,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1046,21,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1047,21,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1048,21,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1049,21,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1050,21,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1051,21,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1052,21,'2023-02-08','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1053,21,'2023-02-09','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1054,21,'2023-02-10','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1055,21,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1056,21,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1057,21,'2023-02-13','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1058,21,'2023-02-14','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1059,21,'2023-02-15','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1060,23,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1061,23,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1062,23,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1063,23,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1064,23,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1065,23,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1066,23,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1067,23,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1068,23,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1069,23,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1070,23,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1071,23,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1072,23,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1073,23,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1074,23,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1075,23,'2023-01-31','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1076,23,'2023-02-01','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1077,23,'2023-02-02','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1078,23,'2023-02-03','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1079,23,'2023-02-04','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1080,23,'2023-02-05','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1081,23,'2023-02-06','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1082,23,'2023-02-07','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1083,23,'2023-02-08','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1084,23,'2023-02-09','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1085,23,'2023-02-10','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1086,23,'2023-02-11','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1087,23,'2023-02-12','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1088,23,'2023-02-13','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1089,23,'2023-02-14','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1090,23,'2023-02-15','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1091,22,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1092,22,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1093,22,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1094,22,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1095,22,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1096,22,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1097,22,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1098,22,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1099,22,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1100,22,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1101,22,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1102,22,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1103,22,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1104,22,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1105,22,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1106,22,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1107,22,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1108,22,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1109,22,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1110,22,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1111,22,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1112,22,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',6,1,20,NULL,NULL,NULL,NULL),(1113,22,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1114,22,'2023-02-08','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1115,22,'2023-02-09','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1116,22,'2023-02-10','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1117,22,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1118,22,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1119,22,'2023-02-13','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1120,22,'2023-02-14','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1121,22,'2023-02-15','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1122,19,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1123,19,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1124,19,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1125,19,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1126,19,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1127,19,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1128,19,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1129,19,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1130,19,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1131,19,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1132,19,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1133,19,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,1,NULL,NULL,NULL,NULL,NULL),(1134,19,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',6,1,25,NULL,NULL,NULL,NULL),(1135,19,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',6,1,25,NULL,NULL,NULL,NULL),(1136,19,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',6,1,25,NULL,NULL,NULL,NULL),(1137,19,'2023-01-31','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1138,19,'2023-02-01','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1139,19,'2023-02-02','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1140,19,'2023-02-03','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1141,19,'2023-02-04','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1142,19,'2023-02-05','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1143,19,'2023-02-06','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1144,19,'2023-02-07','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1145,19,'2023-02-08','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1146,19,'2023-02-09','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1147,19,'2023-02-10','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1148,19,'2023-02-11','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1149,19,'2023-02-12','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1150,19,'2023-02-13','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1151,19,'2023-02-14','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1152,19,'2023-02-15','07:00:00','12:00:00','13:00:00','20:00:00',1,4,NULL,NULL,NULL,NULL,NULL),(1153,24,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1154,24,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',7,4,NULL,NULL,NULL,NULL,NULL),(1155,24,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1156,24,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1157,24,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1158,24,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1159,24,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1160,24,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1161,24,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1162,24,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1163,24,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1164,24,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1165,24,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1166,24,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1167,24,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1168,24,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1169,24,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1170,24,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1171,24,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1172,24,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1173,24,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1174,24,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1175,24,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1176,24,'2023-02-08','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1177,24,'2023-02-09','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1178,24,'2023-02-10','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1179,24,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1180,24,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1181,24,'2023-02-13','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1182,24,'2023-02-14','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1183,24,'2023-02-15','00:00:00','00:00:00','00:00:00','00:00:00',3,4,NULL,NULL,NULL,NULL,NULL),(1184,3,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1185,3,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1186,3,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1187,3,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1188,3,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1189,3,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1190,3,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1191,3,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1192,3,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1193,3,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1194,3,'2023-01-26','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1195,3,'2023-01-27','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1196,3,'2023-01-28','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1197,3,'2023-01-29','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1198,3,'2023-01-30','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1199,3,'2023-01-31','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1200,3,'2023-02-01','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1201,3,'2023-02-02','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1202,3,'2023-02-03','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1203,3,'2023-02-04','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1204,3,'2023-02-05','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1205,3,'2023-02-06','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1206,3,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1207,3,'2023-02-08','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1208,3,'2023-02-09','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1209,3,'2023-02-10','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1210,3,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1211,3,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1212,3,'2023-02-13','00:00:00','00:00:00','00:00:00','00:00:00',10,7,NULL,NULL,NULL,NULL,NULL),(1213,3,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1214,3,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1215,4,'2023-01-16','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1216,4,'2023-01-17','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1217,4,'2023-01-18','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1218,4,'2023-01-19','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1219,4,'2023-01-20','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1220,4,'2023-01-21','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1221,4,'2023-01-22','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1222,4,'2023-01-23','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1223,4,'2023-01-24','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1224,4,'2023-01-25','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1225,4,'2023-01-26','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1226,4,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1227,4,'2023-01-28','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1228,4,'2023-01-29','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1229,4,'2023-01-30','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1230,4,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1231,4,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1232,4,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1233,4,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1234,4,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1235,4,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1236,4,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1237,4,'2023-02-07','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1238,4,'2023-02-08','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1239,4,'2023-02-09','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1240,4,'2023-02-10','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1241,4,'2023-02-11','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1242,4,'2023-02-12','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1243,4,'2023-02-13','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1244,4,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1245,4,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1246,5,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1247,5,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1248,5,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1249,5,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1250,5,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1251,5,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1252,5,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1253,5,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1254,5,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1255,5,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1256,5,'2023-01-26','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1257,5,'2023-01-27','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1258,5,'2023-01-28','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1259,5,'2023-01-29','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1260,5,'2023-01-30','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1261,5,'2023-01-31','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1262,5,'2023-02-01','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1263,5,'2023-02-02','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1264,5,'2023-02-03','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1265,5,'2023-02-04','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1266,5,'2023-02-05','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1267,5,'2023-02-06','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1268,5,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1269,5,'2023-02-08','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1270,5,'2023-02-09','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1271,5,'2023-02-10','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1272,5,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1273,5,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1274,5,'2023-02-13','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1275,5,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1276,5,'2023-02-15','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1277,7,'2023-01-16','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1278,7,'2023-01-17','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1279,7,'2023-01-18','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1280,7,'2023-01-19','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1281,7,'2023-01-20','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1282,7,'2023-01-21','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1283,7,'2023-01-22','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1284,7,'2023-01-23','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1285,7,'2023-01-24','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1286,7,'2023-01-25','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1287,7,'2023-01-26','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1288,7,'2023-01-27','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1289,7,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1290,7,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1291,7,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1292,7,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1293,7,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1294,7,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1295,7,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1296,7,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1297,7,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1298,7,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1299,7,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',3,7,NULL,NULL,NULL,NULL,NULL),(1300,7,'2023-02-08','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1301,7,'2023-02-09','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1302,7,'2023-02-10','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1303,7,'2023-02-11','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1304,7,'2023-02-12','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1305,7,'2023-02-13','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1306,7,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1307,7,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1308,8,'2023-01-16','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1309,8,'2023-01-17','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1310,8,'2023-01-18','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1311,8,'2023-01-19','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1312,8,'2023-01-20','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1313,8,'2023-01-21','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1314,8,'2023-01-22','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1315,8,'2023-01-23','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1316,8,'2023-01-24','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1317,8,'2023-01-25','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1318,8,'2023-01-26','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1319,8,'2023-01-27','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1320,8,'2023-01-28','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1321,8,'2023-01-29','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1322,8,'2023-01-30','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1323,8,'2023-01-31','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1324,8,'2023-02-01','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1325,8,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1326,8,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1327,8,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1328,8,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1329,8,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1330,8,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',7,7,NULL,NULL,NULL,NULL,NULL),(1331,8,'2023-02-08','00:00:00','00:00:00','00:00:00','19:30:00',7,7,NULL,NULL,NULL,NULL,NULL),(1332,8,'2023-02-09','00:00:00','00:00:00','00:00:00','19:30:00',7,7,NULL,NULL,NULL,NULL,NULL),(1333,8,'2023-02-10','00:00:00','00:00:00','00:00:00','19:30:00',7,7,NULL,NULL,NULL,NULL,NULL),(1334,8,'2023-02-11','00:00:00','00:00:00','00:00:00','19:30:00',7,7,NULL,NULL,NULL,NULL,NULL),(1335,8,'2023-02-12','00:00:00','00:00:00','00:00:00','19:30:00',3,7,NULL,NULL,NULL,NULL,NULL),(1336,8,'2023-02-13','00:00:00','00:00:00','00:00:00','19:30:00',3,7,NULL,NULL,NULL,NULL,NULL),(1337,8,'2023-02-14','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1338,8,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,7,NULL,NULL,NULL,NULL,NULL),(1339,15,'2023-01-16','00:00:00','00:00:00','00:00:00','00:00:00',7,6,NULL,NULL,NULL,NULL,NULL),(1340,15,'2023-01-17','00:00:00','00:00:00','00:00:00','00:00:00',7,6,NULL,NULL,NULL,NULL,NULL),(1341,15,'2023-01-18','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1342,15,'2023-01-19','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1343,15,'2023-01-20','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1344,15,'2023-01-21','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1345,15,'2023-01-22','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1346,15,'2023-01-23','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1347,15,'2023-01-24','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1348,15,'2023-01-25','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1349,15,'2023-01-26','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1350,15,'2023-01-27','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1351,15,'2023-01-28','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1352,15,'2023-01-29','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1353,15,'2023-01-30','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1354,15,'2023-01-31','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1355,15,'2023-02-01','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1356,15,'2023-02-02','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1357,15,'2023-02-03','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1358,15,'2023-02-04','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1359,15,'2023-02-05','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1360,15,'2023-02-06','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1361,15,'2023-02-07','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1362,15,'2023-02-08','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1363,15,'2023-02-09','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1364,15,'2023-02-10','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1365,15,'2023-02-11','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1366,15,'2023-02-12','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1367,15,'2023-02-13','00:00:00','00:00:00','00:00:00','00:00:00',3,6,NULL,NULL,NULL,NULL,NULL),(1368,15,'2023-02-14','00:00:00','00:00:00','00:00:00','00:00:00',10,6,NULL,NULL,NULL,NULL,NULL),(1369,15,'2023-02-15','06:30:00','13:00:00','14:00:00','19:30:00',1,6,NULL,NULL,NULL,NULL,NULL),(1371,25,'2023-02-02','07:30:00','07:30:00','07:30:00','13:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(1372,25,'2023-02-06','07:30:00','13:30:00','14:00:00','16:00:00',1,1,NULL,NULL,NULL,NULL,NULL),(1373,25,'2023-02-08','07:30:00','07:30:00','07:30:00','09:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(1374,25,'2023-02-09','07:30:00','07:30:00','07:30:00','09:30:00',1,1,NULL,NULL,NULL,NULL,NULL),(1375,25,'2023-02-10','07:30:00','07:30:00','07:30:00','11:30:00',1,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tareo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodelocalidad`
--

DROP TABLE IF EXISTS `tipodelocalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodelocalidad` (
  `idTipoDeLocalidad` int NOT NULL AUTO_INCREMENT,
  `NombreTipoDeLocalidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoDeLocalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodelocalidad`
--

LOCK TABLES `tipodelocalidad` WRITE;
/*!40000 ALTER TABLE `tipodelocalidad` DISABLE KEYS */;
INSERT INTO `tipodelocalidad` VALUES (1,'URB'),(2,'AAHH'),(3,'PPJJ'),(4,'ASOC'),(5,'ZONA'),(6,'GRUPO'),(7,'SECTOR'),(8,'CONJ.HAB'),(9,'RESIDENC.'),(10,'COOP.'),(11,'UNID.VEC'),(12,'CASERIO'),(13,'CAMPAMENTO'),(14,'FUNDO'),(15,'COMUNIDAD');
/*!40000 ALTER TABLE `tipodelocalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodesangre`
--

DROP TABLE IF EXISTS `tipodesangre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodesangre` (
  `idTipoDeSangre` int NOT NULL,
  `NombreTipoDeSangre` varchar(3) NOT NULL,
  PRIMARY KEY (`idTipoDeSangre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodesangre`
--

LOCK TABLES `tipodesangre` WRITE;
/*!40000 ALTER TABLE `tipodesangre` DISABLE KEYS */;
INSERT INTO `tipodesangre` VALUES (1,'O+'),(2,'O-'),(3,'A+'),(4,'A-'),(5,'B+'),(6,'B-'),(7,'AB+'),(8,'AB-');
/*!40000 ALTER TABLE `tipodesangre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodevia`
--

DROP TABLE IF EXISTS `tipodevia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodevia` (
  `idTipoDeVia` int NOT NULL,
  `NombreTipoDeVia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoDeVia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodevia`
--

LOCK TABLES `tipodevia` WRITE;
/*!40000 ALTER TABLE `tipodevia` DISABLE KEYS */;
INSERT INTO `tipodevia` VALUES (1,'JR'),(2,'CL'),(3,'AV'),(4,'PSJE'),(5,'MZ'),(6,'PROLONG'),(7,'BLOCK'),(8,'CONDOMINIO'),(9,'PARQUE'),(10,'MALECON'),(11,'ALAMEDA'),(12,'CARRETERA'),(13,'AUTOPISTA'),(14,'C.P.'),(15,'CASERIO'),(16,'PLAZA'),(17,'OVALO'),(18,'BOULEVARD'),(19,'PASEO'),(20,'EDIFICIO'),(21,'SUPERMZ');
/*!40000 ALTER TABLE `tipodevia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoexamenmedico`
--

DROP TABLE IF EXISTS `tipoexamenmedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoexamenmedico` (
  `idTipoExamenMedico` int NOT NULL,
  `NombreTipoExamenMedico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTipoExamenMedico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoexamenmedico`
--

LOCK TABLES `tipoexamenmedico` WRITE;
/*!40000 ALTER TABLE `tipoexamenmedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoexamenmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacaciones`
--

DROP TABLE IF EXISTS `vacaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacaciones` (
  `idVacaciones` int NOT NULL AUTO_INCREMENT,
  `FechaDeInicioVacaciones` date NOT NULL,
  `FechaDeFinVacaciones` date NOT NULL,
  `LinkDeDocumento` text NOT NULL,
  `DiasAConsiderar` int DEFAULT NULL,
  PRIMARY KEY (`idVacaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacaciones`
--

LOCK TABLES `vacaciones` WRITE;
/*!40000 ALTER TABLE `vacaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29 16:02:45
