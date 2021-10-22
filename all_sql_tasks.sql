
-- Task 1
-- Display the names of the unique launch sites  in the space mission

SELECT DISTINCT Launch_Site FROM SpaceX; 


-- +--------------+
-- | Launch_Site  |
-- +--------------+
-- | CCAFS LC-40  |
-- | VAFB SLC-4E  |
-- | KSC LC-39A   |
-- | CCAFS SLC-40 |
-- +--------------+

-------------------------------------------------------------------------------

-- Task 2
-- Display 5 records where launch sites begin with the string 'CCA'

SELECT Launch_Site FROM SpaceX WHERE Launch_Site LIKE 'CCA%' LIMIT 5;


-- +-------------+
-- | Launch_Site |
-- +-------------+
-- | CCAFS LC-40 |
-- | CCAFS LC-40 |
-- | CCAFS LC-40 |
-- | CCAFS LC-40 |
-- | CCAFS LC-40 |
-- +-------------+

-------------------------------------------------------------------------------

-- Task 3
-- Display the total payload mass carried by boosters launched by NASA (CRS)

SELECT SUM(PAYLOAD_MASS__KG_) FROM SpaceX WHERE Customer="NASA (CRS)"; 


-- +--------------------------+
-- | COUNT(PAYLOAD_MASS__KG_) |
-- +--------------------------+
-- |                       20 |
-- +--------------------------+


-------------------------------------------------------------------------------

-- Task 4
-- Display average payload mass carried by booster version F9 v1.1

SELECT AVG(PAYLOAD_MASS__KG_) FROM SpaceX WHERE Booster_Version="F9 v1.1";


-- +------------------------+
-- | AVG(PAYLOAD_MASS__KG_) |
-- +------------------------+
-- |              2928.4000 |
-- +------------------------+

-------------------------------------------------------------------------------

-- Task 5
-- List the date when the first successful landing outcome in ground pad was acheived.

SELECT MIN(Date) FROM SpaceX WHERE `Landing _Outcome`="Success (ground pad)";


-- +------------+
-- | MIN(Date)  |
-- +------------+
-- | 2015-12-22 |
-- +------------+

-------------------------------------------------------------------------------

-- Task 6
-- List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000

SELECT Booster_Version FROM SpaceX WHERE `Landing _Outcome`="Success (drone ship)" AND (PAYLOAD_MASS__KG_ > 4000 AND PAYLOAD_MASS__KG_ < 6000); 


-- +-----------------+
-- | Booster_Version |
-- +-----------------+
-- | F9 FT B1022     |
-- | F9 FT B1026     |
-- | F9 FT  B1021.2  |
-- | F9 FT  B1031.2  |
-- +-----------------+


-------------------------------------------------------------------------------

-- Task 7
-- List the total number of successful and failure mission outcomes

-- Success
SELECT COUNT(Mission_Outcome) FROM SpaceX WHERE Mission_Outcome LIKE 'Success%';


-- +------------------------+
-- | COUNT(Mission_Outcome) |
-- +------------------------+
-- |                    100 |
-- +------------------------+

-- Failure
SELECT COUNT(Mission_Outcome) FROM SpaceX WHERE Mission_Outcome NOT LIKE 'Success%';


-- +------------------------+
-- | COUNT(Mission_Outcome) |
-- +------------------------+
-- |                      1 |
-- +------------------------+


-------------------------------------------------------------------------------

-- Task 8
-- List the names of the booster_versions which have carried the maximum payload mass. Use a subquery

SELECT Booster_Version FROM SpaceX WHERE PAYLOAD_MASS__KG_ IN (SELECT MAX(PAYLOAD_MASS__KG_) FROM SpaceX);



-- +-----------------+
-- | Booster_Version |
-- +-----------------+
-- | F9 B5 B1048.4   |
-- | F9 B5 B1049.4   |
-- | F9 B5 B1051.3   |
-- | F9 B5 B1056.4   |
-- | F9 B5 B1048.5   |
-- | F9 B5 B1051.4   |
-- | F9 B5 B1049.5   |
-- | F9 B5 B1060.2   |
-- | F9 B5 B1058.3   |
-- | F9 B5 B1051.6   |
-- | F9 B5 B1060.3   |
-- | F9 B5 B1049.7   |
-- +-----------------+


-------------------------------------------------------------------------------

-- Task 9
-- List the failed landing_outcomes in drone ship, their booster versions, and launch site names for in year 2015

SELECT `Landing _Outcome`, Booster_Version, Launch_Site FROM SpaceX WHERE (`Landing _Outcome`="Failure (drone ship)" AND YEAR(Date) = "2015");


-- +----------------------+-----------------+-------------+
-- | Landing _Outcome     | Booster_Version | Launch_Site |
-- +----------------------+-----------------+-------------+
-- | Failure (drone ship) | F9 v1.1 B1012   | CCAFS LC-40 |
-- | Failure (drone ship) | F9 v1.1 B1015   | CCAFS LC-40 |
-- +----------------------+-----------------+-------------+


-------------------------------------------------------------------------------

-- Task 10
-- Rank the count of landing outcomes (such as Failure (drone ship) or Success (ground pad)) between the date 2010-06-04 and 2017-03-20, in descending order

SELECT `Landing _Outcome`, COUNT(`Landing _Outcome`) FROM SpaceX WHERE DATE BETWEEN' 2010-06-04'AND '2017-03-20' AND `Landing _Outcome` LIKE 'Success%' GROUP BY `Landing _Outcome`;


-- +----------------------+---------------------------+
-- | Landing _Outcome     | COUNT(`Landing _Outcome`) |
-- +----------------------+---------------------------+
-- | Success (drone ship) |                         5 |
-- | Success (ground pad) |                         3 |
-- +----------------------+---------------------------+

