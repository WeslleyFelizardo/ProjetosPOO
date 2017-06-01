-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.17


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema quiz
--

CREATE DATABASE IF NOT EXISTS quiz;
USE quiz;

--
-- Definition of table `alternative`
--

DROP TABLE IF EXISTS `alternative`;
CREATE TABLE `alternative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `answerCorrect` tinyint(1) DEFAULT NULL,
  `id_question` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alternative_question` (`id_question`),
  CONSTRAINT `fk_alternative_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alternative`
--

/*!40000 ALTER TABLE `alternative` DISABLE KEYS */;
INSERT INTO `alternative` (`id`,`description`,`answerCorrect`,`id_question`) VALUES 
 (17,'Brasil',1,1),
 (18,'Argentina',0,1),
 (19,'Holanda',0,1),
 (20,'Alemanha',0,1),
 (21,'Amarelo',0,2),
 (22,'Verde',0,2),
 (23,'Azul',1,2),
 (24,'Preto',0,2),
 (25,'0',0,3),
 (26,'3',0,3),
 (27,'2',1,3),
 (28,'4',0,3),
 (29,'Rivaldo',0,4),
 (30,'Ronaldo',1,4),
 (31,'Kaká',0,4),
 (32,'Ronaldinho Gaúcho',0,4),
 (37,'1',0,5),
 (38,'2',1,5),
 (39,'3',0,5),
 (40,'0',0,5),
 (41,'Bebeto e Romario',1,6),
 (42,'Ronaldo e Romario',0,6),
 (43,'Bebeto e Ronaldo ',0,6),
 (44,'Edmundo e Bebeto',0,6),
 (46,'Real Madrid',0,7),
 (47,'Milan',0,7),
 (48,'Barcelona',1,7),
 (49,'Madrid',0,7),
 (50,'Barcelona 4 x Santos 0',1,8),
 (51,'Barcelona 0 x Santos 4',0,8),
 (52,'Barcelona 4 x Santos 1',0,8),
 (53,'Barcelona 4 x Santos 2',0,8),
 (54,'Ronaldo',0,9),
 (55,'Rivaldo',0,9),
 (56,'Lampard',0,9),
 (57,'Klose',1,9),
 (58,'Brasil x França',1,10),
 (59,'França x Holanda',0,10),
 (60,'Brasil x Holanda',0,10),
 (61,'Brasil x Argentina',0,10),
 (62,'Seleção 72',1,11),
 (63,'Seleção 94',0,11),
 (64,'Seleção 98',0,11),
 (65,'seleção 2002',0,11),
 (66,'Edson Arantes do Nascimento',1,12),
 (67,'Ronaldo',0,12),
 (68,'Neymar',0,12),
 (69,'Coutinho',0,12),
 (70,'4',1,13),
 (71,'0',0,13),
 (72,'-4',0,13),
 (73,'2',0,13),
 (74,'4',0,14),
 (75,'16',1,14),
 (76,'-16',0,14),
 (77,'2',0,14),
 (78,'4',0,15),
 (79,'6',0,15),
 (80,'-4',0,15),
 (81,'-6',1,15),
 (82,'Impossivel',1,16),
 (83,'10',0,16),
 (84,'0',0,16),
 (85,'-10',0,16),
 (86,'0',0,17),
 (87,'-4',1,17),
 (88,'-2',0,17),
 (89,'2',0,17),
 (148,'8',0,109),
 (149,'10',1,109),
 (150,'9',0,109),
 (151,'0',0,109),
 (152,'20',1,110),
 (153,'10',0,110),
 (154,'25',0,110),
 (155,'30',0,110),
 (156,'50',0,111),
 (157,'20',0,109),
 (158,'0',1,111),
 (159,'30',0,111),
 (160,'80',0,112),
 (161,'8',0,112),
 (162,'0',0,112),
 (163,'800',1,112),
 (180,'One',1,113),
 (181,'Two',0,113),
 (182,'Four',0,113),
 (183,'Six',0,113),
 (184,'Twelve three',0,114),
 (185,'Twenty three',0,114),
 (186,'Thirty-three',1,114),
 (187,'Forty three',0,114),
 (188,'Tomatos',0,115),
 (189,'Potatos',0,115),
 (190,'Apples',0,115),
 (191,'Potatoes',1,115),
 (192,'Eraser',1,116),
 (193,'Ruler',0,116),
 (194,'Borracha',0,116),
 (195,'Watermelon',0,116),
 (216,'fifty one',1,117),
 (217,'fifteen',0,117),
 (218,'fifty three',0,117),
 (219,'fifty four',0,117),
 (220,'ten-hundred',0,118),
 (221,'one-hundred',1,118),
 (222,'thousand-hundred',0,118),
 (223,'one-thousand',0,118),
 (224,'two thousand and seventy',0,119),
 (225,'two thousand and seventy one',0,119),
 (226,'two thousand and seventeen',1,119),
 (227,'teen thousand and two',0,119),
 (228,'ten hundred',0,120),
 (229,'one hundred',0,120),
 (230,'hundred thousand',0,120),
 (231,'one thousand',1,120),
 (232,'Peixe, vaca',0,121),
 (233,'Peixe, gato',0,121),
 (234,'Peixe, cavalo',1,121),
 (235,'Peixe, cachorro',0,121),
 (236,'Alternativa A',1,122),
 (237,'Alternativa B',0,122),
 (238,'Alternativa C',0,122),
 (239,'Alternativa D',0,122);
/*!40000 ALTER TABLE `alternative` ENABLE KEYS */;


--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`,`name`) VALUES 
 (1,'Inglês'),
 (2,'Matemática'),
 (3,'Futebol');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `id_role` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_player_role` (`id_role`),
  CONSTRAINT `fk_player_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` (`id`,`name`,`email`,`password`,`id_role`,`active`) VALUES 
 (1,'Weslley Felizardo','weslleyfelizardo1996@gmail.com','123456',1,1),
 (28,'Lucas','lucas@gmail.com','123',2,1),
 (29,'BrunÃ£o','bruno@fatec.com','1234',2,1),
 (30,'CÃ??Ã?Â©sar','cesar@fatec.com','123456',2,0);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;


--
-- Definition of table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `id_category` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qustion_category` (`id_category`),
  CONSTRAINT `fk_qustion_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`id`,`description`,`id_category`,`active`) VALUES 
 (1,'Quem ganhou a copa do mundo de 2002?',3,1),
 (2,'Qual é a tradução de \"blue\"?',1,0),
 (3,'Qual é o resultado da expressão 2 * 2 / 2?',2,0),
 (4,'Qual o jogador brasileiro com mais titulo de melhor do mundo?',3,1),
 (5,'Quantos titulos mundiais o Corinthians ganhou?',3,1),
 (6,'Qual foi a dupla de ataque do Brasil da Copa de 94?',3,1),
 (7,'Qual o clube da Espanha que o Ronaldinho Gaucho jogou?',3,1),
 (8,'Qual foi o placar do mundial entre Barcelona vs Santos?',3,0),
 (9,'Quem é o maior artilheiro de todas as Copas?',3,0),
 (10,'Quem fez a final da copa de 98?',3,0),
 (11,'Qual a seleção brasileira que é tratada como a melhor de todos os tempos?',3,0),
 (12,'Quem é o rei do futebol?',3,1),
 (13,'Qual é o resultado da expressão 2 + 2?',2,1),
 (14,'Qual é o resultado da expressão 2 ^ 4?',2,1),
 (15,'Qual é o resultado da expressão 2 + 2 - 10?',2,0),
 (16,'Qual é o resultado da expressão 10 / 0?',2,1),
 (17,'Qual é o resultado da expressão -2 + (-2)?',2,0),
 (109,'Qual é o resultado da expressão 18 - 8?',2,1),
 (110,'Qual é o resultado da expressão 30-10?',2,1),
 (111,'Qual é o resultado da expressão 50 - 50',2,1),
 (112,'Qual é o resultado da expressão 100 * 8?',2,1),
 (113,'Como se diz 1 em inglês?',1,1),
 (114,'Como se diz 33 em inglês?',1,1),
 (115,'Qual o plural de \"batata\"?',1,1),
 (116,'Como se diz \'borracha\' em inglês?',1,1),
 (117,'Como se diz 51 em inglês?',1,1),
 (118,'Como se diz 100 em inglês?',1,1),
 (119,'Como se diz 2017 em inglês?',1,1),
 (120,'Como se diz 1000 em inglês?',1,1),
 (121,'Qual a tradução de fish e horse respectivamente?',1,1),
 (122,'DesriÃ?Â§Ã?Â£o da questÃ?Â£o....',1,0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


--
-- Definition of table `question_quiz`
--

DROP TABLE IF EXISTS `question_quiz`;
CREATE TABLE `question_quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_alternative` int(11) NOT NULL,
  `id_quiz` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_quiz_alternative` (`id_alternative`),
  KEY `fk_question_quiz_quiz` (`id_quiz`),
  CONSTRAINT `fk_question_quiz_alternative` FOREIGN KEY (`id_alternative`) REFERENCES `alternative` (`id`),
  CONSTRAINT `fk_question_quiz_quiz` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=692 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_quiz`
--

/*!40000 ALTER TABLE `question_quiz` DISABLE KEYS */;
INSERT INTO `question_quiz` (`id`,`id_alternative`,`id_quiz`) VALUES 
 (672,183,66),
 (673,219,66),
 (674,151,66),
 (675,81,66),
 (676,73,66),
 (677,32,66),
 (678,53,66),
 (679,20,66),
 (680,163,66),
 (681,235,66),
 (682,68,67),
 (683,86,67),
 (684,75,67),
 (685,84,67),
 (686,26,67),
 (687,29,67),
 (688,59,67),
 (689,38,67),
 (690,70,67),
 (691,52,67);
/*!40000 ALTER TABLE `question_quiz` ENABLE KEYS */;


--
-- Definition of table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` double(8,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_player` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quiz_player` (`id_player`),
  CONSTRAINT `fk_quiz_player` FOREIGN KEY (`id_player`) REFERENCES `player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` (`id`,`score`,`date`,`id_player`) VALUES 
 (66,20.00,'2017-05-31 19:48:21',28),
 (67,30.00,'2017-05-31 20:13:31',29);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`,`role`) VALUES 
 (1,'Administrador'),
 (2,'Convidado');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of procedure `validateQuiz`
--

DROP PROCEDURE IF EXISTS `validateQuiz`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateQuiz`(in idQuiz int)
begin

declare linhas_cursor int default 0;
declare acertos int default 0;
declare questao int;
declare alternativa int;
declare respostaCerta int;

DECLARE respostasFinal CURSOR FOR
	SELECT id_alternative FROM question_quiz where id_quiz = idQuiz;

 
 declare continue handler for not found set linhas_cursor = 1;
 
 open respostasFinal;

 cadaResposta: loop
 fetch respostasFinal into alternativa;

if linhas_cursor = 1 THEN
  leave cadaResposta;
end if;

select alternative.answerCorrect as 'Resposta' into respostaCerta
from alternative where id = alternativa;


if respostaCerta = 1 then
  	set acertos = acertos + 1;
end if;

end loop cadaResposta;

/*set saida = acertos;*/

update quiz set score = (10 / 100) * acertos * 100 where id = idQuiz;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
