-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table numer_test.states
CREATE TABLE IF NOT EXISTS `states` (
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table numer_test.states: 51 rows
DELETE FROM `states`;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` (`code`, `name`) VALUES
	('DC', 'District of Columbia'),
	('AL', 'Alabama'),
	('AK', 'Alaska'),
	('AZ', 'Arizona'),
	('AR', 'Arkansas'),
	('CA', 'California'),
	('CO', 'Colorado'),
	('CT', 'Connecticut'),
	('DE', 'Delaware'),
	('FL', 'Florida'),
	('GA', 'Georgia'),
	('HI', 'Hawaii'),
	('ID', 'Idaho'),
	('IL', 'Illinois'),
	('IN', 'Indiana'),
	('IA', 'Iowa'),
	('KS', 'Kansas'),
	('KY', 'Kentucky'),
	('LA', 'Louisiana'),
	('ME', 'Maine'),
	('MD', 'Maryland'),
	('MA', 'Massachusetts'),
	('MI', 'Michigan'),
	('MN', 'Minnesota'),
	('MS', 'Mississippi'),
	('MO', 'Missouri'),
	('MT', 'Montana'),
	('NE', 'Nebraska'),
	('NV', 'Nevada'),
	('NH', 'New Hampshire'),
	('NJ', 'New Jersey'),
	('NM', 'New Mexico'),
	('NY', 'New York'),
	('NC', 'North Carolina'),
	('ND', 'North Dakota'),
	('OH', 'Ohio'),
	('OK', 'Oklahoma'),
	('OR', 'Oregon'),
	('PA', 'Pennsylvania'),
	('RI', 'Rhode Island'),
	('SC', 'South Carolina'),
	('SD', 'South Dakota'),
	('TN', 'Tennessee'),
	('TX', 'Texas'),
	('UT', 'Utah'),
	('VT', 'Vermont'),
	('VA', 'Virginia'),
	('WA', 'Washington'),
	('WV', 'West Virginia'),
	('WI', 'Wisconsin'),
	('WY', 'Wyoming');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;

-- Dumping structure for view numer_test.states_with_esoterica
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `states_with_esoterica` (
	`NAME` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`code` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`numerology(name)` SMALLINT(6) NULL
) ENGINE=MyISAM;

-- Dumping structure for function numer_test.numerology
DELIMITER //
CREATE FUNCTION `numerology`(`p_text` VARCHAR(50)
) RETURNS smallint(6)
    DETERMINISTIC
BEGIN

	DECLARE COMBINED_VAL INT;
	DECLARE charIndex INT;
	
	SET COMBINED_VAL = 0;
	SET charIndex = 0;

	WHILE (charIndex < LENGTh(p_text)) DO
	
		SET charIndex = charIndex + 1;
	
		CASE (SUBSTRING(p_text, charIndex, 1))
			WHEN '1' then SET COMBINED_VAL = COMBINED_VAL + 1;
			WHEN '2' then SET COMBINED_VAL = COMBINED_VAL + 2;
			WHEN '3' then SET COMBINED_VAL = COMBINED_VAL + 3;
			WHEN '4' then SET COMBINED_VAL = COMBINED_VAL + 4;
			WHEN '5' then SET COMBINED_VAL = COMBINED_VAL + 5;
			WHEN '6' then SET COMBINED_VAL = COMBINED_VAL + 6;
			WHEN '7' then SET COMBINED_VAL = COMBINED_VAL + 7;
			WHEN '8' then SET COMBINED_VAL = COMBINED_VAL + 8;
			WHEN '9' then SET COMBINED_VAL = COMBINED_VAL + 9;
			WHEN '0' then SET COMBINED_VAL = COMBINED_VAL + 0;
			WHEN 'A' then SET COMBINED_VAL = COMBINED_VAL + 1;
			WHEN 'B' then SET COMBINED_VAL = COMBINED_VAL + 2;
			WHEN 'C' then SET COMBINED_VAL = COMBINED_VAL + 3;
			WHEN 'D' then SET COMBINED_VAL = COMBINED_VAL + 4;
			WHEN 'E' then SET COMBINED_VAL = COMBINED_VAL + 5;
			WHEN 'F' then SET COMBINED_VAL = COMBINED_VAL + 6;
			WHEN 'G' then SET COMBINED_VAL = COMBINED_VAL + 7;
			WHEN 'H' then SET COMBINED_VAL = COMBINED_VAL + 8;
			WHEN 'I' then SET COMBINED_VAL = COMBINED_VAL + 9;
			WHEN 'J' then SET COMBINED_VAL = COMBINED_VAL + 1;
			WHEN 'K' then SET COMBINED_VAL = COMBINED_VAL + 2;
			WHEN 'L' then SET COMBINED_VAL = COMBINED_VAL + 3;
			WHEN 'M' then SET COMBINED_VAL = COMBINED_VAL + 4;
			WHEN 'N' then SET COMBINED_VAL = COMBINED_VAL + 5;
			WHEN 'O' then SET COMBINED_VAL = COMBINED_VAL + 6;
			WHEN 'P' then SET COMBINED_VAL = COMBINED_VAL + 7;
			WHEN 'Q' then SET COMBINED_VAL = COMBINED_VAL + 8;
			WHEN 'R' then SET COMBINED_VAL = COMBINED_VAL + 9;
			WHEN 'S' then SET COMBINED_VAL = COMBINED_VAL + 1;
			WHEN 'T' then SET COMBINED_VAL = COMBINED_VAL + 2;
			WHEN 'U' then SET COMBINED_VAL = COMBINED_VAL + 3;
			WHEN 'V' then SET COMBINED_VAL = COMBINED_VAL + 4;
			WHEN 'W' then SET COMBINED_VAL = COMBINED_VAL + 5;
			WHEN 'X' then SET COMBINED_VAL = COMBINED_VAL + 6;
			WHEN 'Y' then SET COMBINED_VAL = COMBINED_VAL + 7;
			WHEN 'Z' then SET COMBINED_VAL = COMBINED_VAL + 8;
			ELSE          SET COMBINED_VAL = COMBINED_VAL + 0;
		END CASE;
		
		IF COMBINED_VAL > 9 THEN
			SET COMBINED_VAL = COMBINED_VAL - 9;
		END IF;
		
	END WHILE;
	
	RETURN COMBINED_VAL;
END//
DELIMITER ;

-- Dumping structure for function numer_test.sun_sign
DELIMITER //
CREATE FUNCTION `sun_sign`(`p_date` DATE
) RETURNS varchar(100) CHARSET latin1
    DETERMINISTIC
BEGIN

	DECLARE comparer VARCHAR(100);
	
	SET comparer = CONCAT(LPAD(MONTH(p_date), 2, '0'), LPAD(DAY(p_date), 2, '0'));
		
--	RETURN comparer;
	
	if comparer >= '1221' THEN
		RETURN 'Capricorn';
	END IF;
	
	if comparer >= '1122' THEN
		RETURN 'Sagittarius';
	END IF;
	
	if comparer >= '1023' THEN
		RETURN 'Scorpio';
	END IF;
	
	if comparer >= '0923' THEN
		RETURN 'Libra';
	END IF;
	
	if comparer >= '0823' THEN
		RETURN 'Virgo';
	END IF;
	
	if comparer >= '0723' THEN
		RETURN 'Leo';
	END IF;
	
	if comparer >= '0621' THEN
		RETURN 'Cancer';
	END IF;

	if comparer >= '0521' THEN
		RETURN 'Gemini';
	END IF;
	
	if comparer >= '0420' THEN
		RETURN 'Taurus';
	END IF;
	
	if comparer >= '0321' THEN
		RETURN 'Aries';
	END IF;
	
	if comparer >= '0219' THEN
		RETURN 'Pisces';
	END IF;
	
	if comparer >= '0121' THEN
		RETURN 'Aquarius';
	END IF;
	
	if comparer >= '0101' THEN
		RETURN 'Capricorn';
	END IF;
	
	RETURN comparer;

END//
DELIMITER ;

-- Dumping structure for view numer_test.states_with_esoterica
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `states_with_esoterica`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `states_with_esoterica` AS select `states`.`name` AS `NAME`,`states`.`code` AS `code`,`numerology`(`states`.`name`) AS `numerology(name)` from `states`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
