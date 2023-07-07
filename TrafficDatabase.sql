/* USE SCHEMA mercedes */
USE mercedes;

/* Create the table trafficobjects */
CREATE TABLE `trafficobjects` (
  `Identifier` int(11) NOT NULL AUTO_INCREMENT,
  `SITUATION` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Type` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `ObjectId` int(11) DEFAULT NULL,
  `Road` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `UpStreamPos` int(11) DEFAULT NULL,
  `DownStreamPos` int(11) DEFAULT NULL,
  `UpStreamSpeed` double DEFAULT NULL,
  `DownStreamSpeed` double DEFAULT NULL,
  `TrafficSpeed` double DEFAULT NULL,
  `QLKW` float DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `SumDeltaQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`Identifier`)
) 

/* insert rows with given INSERT INTO.. */

/* Query "all" data FROM trafficobjects  */
SELECT * 
FROM trafficobjects 
WHERE `date`='2009-12-10' 
    AND type='JAM' 
    AND time BETWEEN '06:00:00' AND '11:00:00' 
    AND upstreampos < 130000 
    AND road = 29
LIMIT 100000