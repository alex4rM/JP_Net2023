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
  CONSTRAINT `FK_Candidato_Persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Empleado_Cargo` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`),
  CONSTRAINT `FK_FondoDePension` FOREIGN KEY (`idFondoDePension`) REFERENCES `fondodepension` (`idFondoDePension`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=142623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  KEY `FKPersona_Localidad` (`idLocalidadDeNacimiento`) /*!80000 INVISIBLE */,
  KEY `FK_Persona_TipoDeSangre_idx` (`idTipoDeSangre`),
  KEY `FK_Persona_LocalidadActual_idx` (`idLocalidadActual`),
  KEY `FK_Persona_Direccion_idx` (`idDireccion`),
  CONSTRAINT `FK_Persona_Direccion` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`idDireccion`),
  CONSTRAINT `FK_Persona_LocalidadActual` FOREIGN KEY (`idLocalidadActual`) REFERENCES `localidad` (`idLocalidad`),
  CONSTRAINT `FK_Persona_LocalidadNacimiento` FOREIGN KEY (`idLocalidadDeNacimiento`) REFERENCES `localidad` (`idLocalidad`),
  CONSTRAINT `FK_Persona_TipoDeSangre` FOREIGN KEY (`idTipoDeSangre`) REFERENCES `tipodesangre` (`idTipoDeSangre`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-30 11:47:45
