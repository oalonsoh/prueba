-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EMPLEADOS_MODELOS
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `EMPLEADOS_MODELOS` ;

-- -----------------------------------------------------
-- Schema EMPLEADOS_MODELOS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EMPLEADOS_MODELOS` DEFAULT CHARACTER SET utf8 ;
USE `EMPLEADOS_MODELOS` ;

-- -----------------------------------------------------
-- Table `EMPLEADOS_MODELOS`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EMPLEADOS_MODELOS`.`departamento` (
  `codigo` INT(10) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `presupuesto` DOUBLE NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EMPLEADOS_MODELOS`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EMPLEADOS_MODELOS`.`EMPLEADO` (
  `codigo` BIGINT(10) NOT NULL,
  `nifl` VARCHAR(9) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido1` VARCHAR(100) NOT NULL,
  `apellido2` VARCHAR(100) NULL,
  `codigo_departamento` INT(10) NOT NULL,
  PRIMARY KEY (`codigo`),
    CONSTRAINT `fk_EMPLEADO_departamento`
    FOREIGN KEY (`codigo_departamento`)
    REFERENCES `EMPLEADOS_MODELOS`.`departamento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `EMPLEADOS_MODELOS`.`departamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `EMPLEADOS_MODELOS`;
INSERT INTO `EMPLEADOS_MODELOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (111111111, 'Compras', 1500000);
INSERT INTO `EMPLEADOS_MODELOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (222222222, 'Logistica', 3500000);
INSERT INTO `EMPLEADOS_MODELOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (333333333, 'Marketing', 15000000);
INSERT INTO `EMPLEADOS_MODELOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (444444444, 'Contabilidad', 2750000);
INSERT INTO `EMPLEADOS_MODELOS`.`departamento` (`codigo`, `nombre`, `presupuesto`) VALUES (555555555, 'Dirección', 50000000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `EMPLEADOS_MODELOS`.`EMPLEADO`
-- -----------------------------------------------------
START TRANSACTION;
USE `EMPLEADOS_MODELOS`;
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (0000000000, '00000000A', 'Oscar', 'Alonso', 'Hervás', 111111111);
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (1111111111, '11111111B', 'Jose', 'Alvarez', 'Responso', 111111111);
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (2222222222, '22222222C', 'Marcos', 'Cruz', 'Velazquez', 222222222);
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (3333333333, '33333333D', 'Anna', 'Del Castillo', 'Aragon', 222222222);
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (4444444444, '44444444E', 'Maria', 'Sanchez', 'Sanchez', 333333333);
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (5555555555, '55555555F', 'Luis', 'Alvarez', 'Cruz', 333333333);
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (6666666666, '66666666G', 'Lucia', 'Martinez', 'Castro', 444444444);
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (7777777777, '77777777H', 'Beatriz', 'Sanchez', 'Martinica', 444444444);
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (8888888888, '88888888I', 'Sandra', 'Tenna', 'Siller', 555555555);
INSERT INTO `EMPLEADOS_MODELOS`.`EMPLEADO` (`codigo`, `nifl`, `nombre`, `apellido1`, `apellido2`, `codigo_departamento`) VALUES (9999999999, '99999999J', 'Juan', 'Dalmau', 'Soler', 555555555);

COMMIT;

