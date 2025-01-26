-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table esoterica.states
DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `founding_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table esoterica.states: 51 rows
DELETE FROM `states`;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` (`code`, `name`, `founding_date`) VALUES
	('DC', 'District of Columbia', '1790-07-16'),
	('AL', 'Alabama', '1819-12-14'),
	('AK', 'Alaska', '1959-01-03'),
	('AZ', 'Arizona', '1912-02-14'),
	('AR', 'Arkansas', '1836-06-15'),
	('CA', 'California', '1850-09-09'),
	('CO', 'Colorado', '1876-08-01'),
	('CT', 'Connecticut', '1788-01-09'),
	('DE', 'Delaware', '1787-12-07'),
	('FL', 'Florida', '1845-03-03'),
	('GA', 'Georgia', '1788-01-02'),
	('HI', 'Hawaii', '1959-08-21'),
	('ID', 'Idaho', '1890-07-03'),
	('IL', 'Illinois', '1818-12-03'),
	('IN', 'Indiana', '1816-12-11'),
	('IA', 'Iowa', '1846-12-28'),
	('KS', 'Kansas', '1861-01-29'),
	('KY', 'Kentucky', '1792-06-01'),
	('LA', 'Louisiana', '1812-04-30'),
	('ME', 'Maine', '1820-03-15'),
	('MD', 'Maryland', '1788-04-28'),
	('MA', 'Massachusetts', '1788-02-06'),
	('MI', 'Michigan', '1837-01-26'),
	('MN', 'Minnesota', '1858-05-11'),
	('MS', 'Mississippi', '1817-12-10'),
	('MO', 'Missouri', '1821-08-10'),
	('MT', 'Montana', '1889-11-08'),
	('NE', 'Nebraska', '1867-03-01'),
	('NV', 'Nevada', '1864-10-31'),
	('NH', 'New Hampshire', '1788-06-21'),
	('NJ', 'New Jersey', '1787-12-18'),
	('NM', 'New Mexico', '1912-01-06'),
	('NY', 'New York', '1788-07-26'),
	('NC', 'North Carolina', '1789-11-21'),
	('ND', 'North Dakota', '1889-11-02'),
	('OH', 'Ohio', '1803-03-01'),
	('OK', 'Oklahoma', '1907-11-16'),
	('OR', 'Oregon', '1859-02-14'),
	('PA', 'Pennsylvania', '1787-12-12'),
	('RI', 'Rhode Island', '1790-05-29'),
	('SC', 'South Carolina', '1788-05-23'),
	('SD', 'South Dakota', '1889-11-02'),
	('TN', 'Tennessee', '1796-06-01'),
	('TX', 'Texas', '1845-12-29'),
	('UT', 'Utah', '1896-01-04'),
	('VT', 'Vermont', '1791-03-04'),
	('VA', 'Virginia', '1788-06-25'),
	('WA', 'Washington', '1889-11-11'),
	('WV', 'West Virginia', '1863-06-20'),
	('WI', 'Wisconsin', '1848-05-29'),
	('WY', 'Wyoming', '1890-07-10');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;

-- Dumping structure for view esoterica.states_with_esoterica
DROP VIEW IF EXISTS `states_with_esoterica`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `states_with_esoterica` (
	`code` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`NAME` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`founding_date` DATE NULL,
	`numerology(name)` SMALLINT(6) NULL,
	`numerology_traits_from_name` TINYTEXT NULL COLLATE 'latin1_swedish_ci',
	`founding_month` INT(2) NULL,
	`state_sun_sign` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`state_element_type` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for function esoterica.element_type
DROP FUNCTION IF EXISTS `element_type`;
DELIMITER //
CREATE FUNCTION `element_type`(`p_zodiac` VARCHAR(20)
) RETURNS varchar(10) CHARSET latin1
    DETERMINISTIC
BEGIN
	if p_zodiac = 'Capricorn' THEN
		RETURN 'Earth';
	END IF;
	
	if p_zodiac = 'Sagittarius' THEN
		RETURN 'Fire';
	END IF;
	
	if p_zodiac = 'Scorpio' THEN
		RETURN 'Water';
	END IF;
	
	if p_zodiac = 'Libra' THEN
		RETURN 'Air';
	END IF;
	
	if p_zodiac = 'Virgo' THEN
		RETURN 'Earth';
	END IF;
	
	if p_zodiac = 'Leo' THEN
		RETURN 'Fire';
	END IF;
	
	if p_zodiac = 'Cancer' THEN
		RETURN 'Water';
	END IF;

	if p_zodiac = 'Gemini' THEN
		RETURN 'Air';
	END IF;
	
	if p_zodiac = 'Taurus' THEN
		RETURN 'Earth';
	END IF;
	
	if p_zodiac = 'Aries' THEN
		RETURN 'Fire';
	END IF;
	
	if p_zodiac = 'Pisces' THEN
		RETURN 'Water';
	END IF;
	
	if p_zodiac = 'Aquarius' THEN
		RETURN 'Air';
	END IF;
	


	RETURN NULL;
END//
DELIMITER ;

-- Dumping structure for function esoterica.numerology
DROP FUNCTION IF EXISTS `numerology`;
DELIMITER //
CREATE FUNCTION `numerology`(`p_text` VARCHAR(50)
) RETURNS smallint(6)
    DETERMINISTIC
BEGIN

	DECLARE COMBINED_VAL INT;
	DECLARE tmp_char_index INT;
	DECLARE tmp_text TEXT;
	
	SET tmp_text = CAST(p_text AS CHAR CHARACTER SET ASCII);
	SET tmp_char_index = LENGTh(tmp_text);
	SET COMBINED_VAL = 0;

	WHILE (tmp_char_index >= 0) DO
	
		SET tmp_char_index = tmp_char_index - 1;
	
		CASE (SUBSTRING(tmp_text, tmp_char_index, 1))
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

-- Dumping structure for function esoterica.numerology_traits
DROP FUNCTION IF EXISTS `numerology_traits`;
DELIMITER //
CREATE FUNCTION `numerology_traits`(`p_digroot` TINYINT
) RETURNS tinytext CHARSET latin1
    DETERMINISTIC
BEGIN

	-- https://www.numerology.com/articles/about-numerology/single-digit-number-1-meaning/

	if p_digroot = 0 THEN
		RETURN 'Pos, Pos, Pos - Neg, Neg, Neg';
	END IF;
	
	if p_digroot = 1 THEN
		RETURN 'Independent, Goal-oriented, Innovative - Forceful, Risky, Doubtful';
	END IF;
	
	if p_digroot = 2 THEN
		RETURN 'Intuitive, Unifying, Influential - Indecisive, Easily hurt, Unassertive';
	END IF;
	
	if p_digroot = 3 THEN
		RETURN 'Communicative, Artistic, Charming - Naive, Unfocused, Shallow';
	END IF;
	
	if p_digroot = 4 THEN
		RETURN 'Practical, Loyal, Service-oriented - Dogmatic, Dull, Rigid';
	END IF;
	
	if p_digroot = 5 THEN
		RETURN 'Curious, Adaptable, Social - Non-committal, Unreliable, Directionless';
	END IF;
	
	if p_digroot = 6 THEN
		RETURN 'Supportive, Protective, Romantic - Passive, Self-sacrificing, Idealistic';
	END IF;
	
	if p_digroot = 7 THEN
		RETURN 'Spiritual, Curious, Analytical - Reclusive, Secretive, Suspicious';
	END IF;

	if p_digroot = 8 THEN
		RETURN 'Ambitious, Karmic, Enduring - Materialistic, Authoritative, Entitled';
	END IF;
	
	if p_digroot = 9 THEN
		RETURN 'Awakening, Tolerant, Supportive - Resentful, Sacrificing, Suffering';
	END IF;


	RETURN NULL;
END//
DELIMITER ;

-- Dumping structure for function esoterica.sun_sign
DROP FUNCTION IF EXISTS `sun_sign`;
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

-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `states_with_esoterica`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `states_with_esoterica` AS select `states`.`code` AS `code`,`states`.`name` AS `NAME`,`states`.`founding_date` AS `founding_date`,`numerology`(`states`.`name`) AS `numerology(name)`,`numerology_traits`(`numerology`(`states`.`name`)) AS `numerology_traits_from_name`,month(`states`.`founding_date`) AS `founding_month`,`sun_sign`(`states`.`founding_date`) AS `state_sun_sign`,`element_type`(`sun_sign`(`states`.`founding_date`)) AS `state_element_type` from `states`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
