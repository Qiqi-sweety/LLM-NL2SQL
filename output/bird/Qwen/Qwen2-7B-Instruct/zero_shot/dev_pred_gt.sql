SELECT MAX(`Percent (%) Eligible Free (K-12)`)  FROM frpm  WHERE `County Name` = 'Alameda'	california_schools
SELECT      `School Name`,     `School Code`,     `Percent (%) Eligible Free (Ages 5-17)`  FROM      frpm  WHERE      `School Type` LIKE '%Continuation%'  ORDER BY      `Percent (%) Eligible Free (Ages 5-17)` ASC  LIMIT 3	california_schools
SELECT T1.Zip  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.MailState = 'CA' AND T1.County = 'Fresno' AND T2.Charter = 1	california_schools
SELECT T1.MailStreet, T1.MailStrAbr, T1.MailCity, T1.MailState, T1.MailZip FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FRPM_Count_K_12 = (SELECT MAX(FRPM_Count_K_12) FROM frpm)	california_schools
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T2.OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*)  FROM satscores  WHERE AvgScrMath < 400 AND Virtual = 'F'	california_schools
SELECT s.name FROM schools s JOIN satscores sc ON s.cds = sc.cds WHERE sc.NumTstTakers > 500 AND s.Magnet = 1	california_schools
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead > 1500 OR T2.AvgScrMath > 1500 OR T2.AvgScrWrite > 1500 ORDER BY T2.NumTstTakr DESC LIMIT 1;	california_schools
SELECT MAX(satscores.NumTstTakr)  FROM satscores  JOIN frpm ON satscores.cds = frpm.CDSCode  WHERE frpm.FRPM_Count_(K-12) = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT COUNT(*)  FROM (     SELECT s.cds      FROM satscores s      WHERE s.AvgScrMath > 560      AND s.FundingType = 'Directly Charter-Funded' ) AS filtered_schools;	california_schools
SELECT T1.FRPM_Count_Ages_5_17 FROM frpm AS T1 JOIN (     SELECT cds, AVG(AvgScrRead) AS avg_scr_read     FROM satscores     GROUP BY cds     ORDER BY avg_scr_read DESC     LIMIT 1 ) AS T2 ON T1.CDSCode = T2.cds	california_schools
SELECT CDSCode  FROM frpm  WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`)  FROM frpm  WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3;	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 / CAST(T1.NumTstTakr AS REAL) IN (     SELECT TOP 3 T1.NumGE1500 / CAST(T1.NumTstTakr AS REAL) AS Rate     FROM satscores AS T1     GROUP BY T1.cds     ORDER BY Rate DESC ) ORDER BY T1.NumGE1500 / CAST(T1.NumTstTakr AS REAL) DESC LIMIT 3;	california_schools
SELECT NCESSchool FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.rtype = 'ages 5-17' ORDER BY satscores.enroll12 DESC LIMIT 5;	california_schools
SELECT s.District, AVG(s.AvgScrRead) AS AverageReadingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY AverageReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.County = 'Alameda' AND frpm.FRPM_Count_Ages_5_17 < 100	california_schools
SELECT T2.CharterNum FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite = 499	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.MailState = 'CA'  AND schools.County = 'Contra Costa'  AND frpm.Charter = 0  AND frpm.NumTstTakr <= 250;	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12'	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700	california_schools
SELECT T1.School FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Contra Costa' ORDER BY T2.NumTstTakr DESC LIMIT 1;	california_schools
SELECT      T1.School,     T1.Street,     T1.StreetAbr,     T1.City,     T1.Zip,     T1.State,     T1.Latitude,     T1.Longitude FROM      schools AS T1 JOIN      frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE      ABS(T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT T1.SchoolName FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`Percent (%) Eligible Free (K-12)` > 0.1 AND T2.AvgScrRead >= 1500 AND T2.AvgScrMath >= 1500 AND T2.AvgScrWrite >= 1500;	california_schools
SELECT T2.FundingType FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL AND T1.AvgScrMath > 400 GROUP BY T2.FundingType HAVING COUNT(T1.cds) > 1;	california_schools
SELECT      `School Name`,     `Street`, `StreetAbr`, `City`, `State`, `Zip` FROM      `frpm` JOIN      `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE      `School Type` LIKE '%High School%'     AND `County Name` = 'Monterey'     AND `Age Group` = 'Ages 15-17'     AND `Free Meal Count (Ages 15-17)` > 800;	california_schools
SELECT T2.sname, T2.AvgScrWrite, T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.OpenDate > '1991-01-01' OR T1.ClosedDate < '2000-01-01' ORDER BY T2.AvgScrWrite DESC;	california_schools
SELECT      T1.School,      T1.DOCType  FROM      schools AS T1  JOIN      frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE      T1.FundingType = 'Local' AND      ABS(T2.Enrollment(K-12) - T2.Enrollment(Ages 5-17)) >      (SELECT AVG(ABS(Enrollment(K-12) - Enrollment(Ages 5-17))) FROM frpm);	california_schools
SELECT OpenDate  FROM frpm  WHERE Enrollment_K_12 = (SELECT MAX(Enrollment_K_12) FROM frpm);	california_schools
SELECT T1.MailCity FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Enrollment_K_12 IS NOT NULL ORDER BY T2.Enrollment_K_12 ASC LIMIT 5;	california_schools
SELECT      `School Name`,     `School Code`,     (`Free Meal Count (K-12)` / `Enrollment (K-12)`) * 100 AS EligibleFreeRate FROM      frpm WHERE      `Enrollment (K-12)` IN (         SELECT `Enrollment (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10 OFFSET 9     ) ORDER BY      `Enrollment (K-12)` DESC LIMIT 10;	california_schools
SELECT      `School Name`,     `School Code`,     (`FRPM Count (K-12)` / `Enrollment (K-12)`) * 100 AS EligibleFreeOrReducedPriceMealRate FROM      frpm WHERE      `Charter School (Y/N)` = 66 ORDER BY      `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT T1.Website, T1.SchoolName FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FREE_MEAL_COUNT(Ages 5-17) BETWEEN 1900 AND 2000	california_schools
SELECT CAST(`Free Meal Count (Ages 5-17)` AS REAL) / `Enrollment (Ages 5-17)` * 100 AS FreeRate FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE `DOC` = 'Gibson' AND `DOCType` = 'Kacey'	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.CharterSchool(Y/N) = 1 AND frpm.Enrollment(K-12) = (     SELECT MIN(Enrollment(K-12))      FROM frpm     WHERE CharterSchool(Y/N) = 1 ) LIMIT 1;	california_schools
SELECT T2.AdmFName1, T2.AdmLName1 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL AND T1.NumGE1500 >= 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1	california_schools
SELECT      T1.Street,     T1.City,     T1.State,     T1.Zip FROM      schools AS T1 JOIN      satscores AS T2 ON T1.CDSCode = T2.cds WHERE      T2.NumGE1500 / T2.NumTstTakr = (SELECT MIN(T2.NumGE1500 / T2.NumTstTakr) FROM satscores AS T2)	california_schools
SELECT T1.Website FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Los Angeles County' AND T2.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(satscores.NumTstTakr)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.State = 'CA'  AND schools.City = 'Fresno'  AND schools.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT T1.Phone  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.rtype = 'Reading' AND T1.District = 'Fresno Unified'  ORDER BY T2.AvgScrRead ASC  LIMIT 1	california_schools
SELECT s.name AS School_Name, AVG(s.avg_scr_read) AS Average_Reading_Score FROM schools s JOIN satscores ss ON s.cds = ss.cds WHERE s.virtual = 'F' GROUP BY s.cds, s.name ORDER BY Average_Reading_Score DESC LIMIT 5;	california_schools
SELECT T2.GSserved FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores) AND T2.Virtual IS NOT TRUE AND T2.Magnet = 0	california_schools
SELECT AVG(satscores.AvgScrMath), schools.County FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE (satscores.AvgScrMath + satscores.AvgScrRead + satscores.AvgScrWrite) =      (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM satscores);	california_schools
SELECT AVG(satscores.AvgScrWrite), schools.City FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 IS NOT NULL AND satscores.NumGE1500 >= 1500 GROUP BY schools.CDSCode, schools.City ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT T1.sname, AVG(T2.AvgScrWrite) AS avg_writing_score FROM satscores AS T2 JOIN schools AS T1 ON T2.cds = T1.CDSCode WHERE T1.AdmEmail1 LIKE '%Ricci Ulrich%' OR T1.AdmEmail2 LIKE '%Ricci Ulrich%' OR T1.AdmEmail3 LIKE '%Ricci Ulrich%' GROUP BY T1.sname;	california_schools
SELECT      T1.State FROM      schools AS T1 JOIN      frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T1.Doc = '31' AND T2.HighGrade IS NOT NULL AND T2.LowGrade IS NOT NULL GROUP BY      T1.State ORDER BY      SUM(T2.Enrollment) DESC LIMIT 1;	california_schools
SELECT CAST(COUNT(*) AS REAL) / 12 AS "Monthly Average" FROM schools WHERE County = 'Alameda' AND DOC = 52 AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31';	california_schools
SELECT      COUNT(CASE WHEN T1.DOC = '52' THEN T1.CDSCode END) AS ElementarySchoolCount,     COUNT(CASE WHEN T1.DOC = '54' THEN T1.CDSCode END) AS UnifiedSchoolCount,     COUNT(CASE WHEN T1.DOC = '52' THEN T1.CDSCode END) / COUNT(CASE WHEN T1.DOC = '54' THEN T1.CDSCode END) AS Ratio FROM      schools T1 WHERE      T1.County = 'Orange'	california_schools
SELECT      T1.County,      T1.CDSCode,      T1.ClosedDate FROM      schools AS T1 WHERE      T1.StatusType = 'Closed' GROUP BY      T1.County ORDER BY      COUNT(T1.CDSCode) DESC LIMIT 1;	california_schools
SELECT T2.MailStreet FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (     SELECT T1.AvgScrMath     FROM satscores AS T1     ORDER BY T1.AvgScrMath DESC     LIMIT 1 OFFSET 5 )	california_schools
SELECT T1.MailStreet, T2.sname FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores);	california_schools
SELECT COUNT(*)  FROM satscores  WHERE (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500  AND satscores.cds IN (     SELECT schools.CDSCode      FROM schools      WHERE MailCity = 'Lakeport' )	california_schools
SELECT COUNT(*)  FROM satscores ss  JOIN schools sc ON ss.cds = sc.CDSCode  WHERE sc.MailCity = 'Fresno'	california_schools
SELECT T1.School, T1.MailCity, T1.MailZip FROM schools AS T1 JOIN (     SELECT AdmFName1, AdmLName1, AdmEmail1     FROM schools     WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'     UNION ALL     SELECT AdmFName2, AdmLName2, AdmEmail2     FROM schools     WHERE AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian'     UNION ALL     SELECT AdmFName3, AdmLName3, AdmEmail3     FROM schools     WHERE AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian' ) AS T2 ON T1.AdmFName1 = T2.AdmFName AND T1.AdmLName1 = T2.AdmLName AND T1.AdmEmail1 = T2.AdmEmail OR T1.AdmFName2 = T2.AdmFName AND T1.AdmLName2 = T2.AdmLName AND T1.AdmEmail2 = T2.AdmEmail OR T1.AdmFName3 = T2.AdmFName AND T1.AdmLName3 = T2.AdmLName AND T1.AdmEmail3 = T2.AdmEmail;	california_schools
SELECT CAST(SUM(CASE WHEN T1.MailState = 'CA' AND T1.County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.MailState = 'CA' AND T1.County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools AS T1	california_schools
SELECT COUNT(*)  FROM schools  WHERE State = 'CA' AND MailState = 'San Joaquin' AND StatusType = 'Active'	california_schools
SELECT T2.Phone, T2.Ext FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite = (SELECT AVG(T1.AvgScrWrite) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 1 OFFSET 332)	california_schools
SELECT T1.Phone, T1.Ext FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Zip = '95203-3704'	california_schools
SELECT T2.Website FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.AdmFName1 = 'Mike Larson' OR T1.AdmFName1 = 'Dante Alvarez' UNION SELECT T2.Website FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.AdmFName2 = 'Mike Larson' OR T1.AdmFName2 = 'Dante Alvarez' UNION SELECT T2.Website FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.AdmFName3 = 'Mike Larson' OR T1.AdmFName3 = 'Dante Alvarez'	california_schools
SELECT T1.Website  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.Virtual = 'P' AND T1.Charter = 1 AND T1.County = 'San Joaquin'	california_schools
SELECT COUNT(*)  FROM schools  WHERE City = 'Hickman' AND DOC = '52' AND Charter = 1;	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Code` = 'LA'  AND `Charter School (Y/N)` = 0  AND (`Free Meal Count (K-12)` * 100 / `Enrollment (K-12)`) < 0.18	california_schools
SELECT      T1.School AS SchoolName,     T1.City AS City,     T2.AdmFName1 || ' ' || T2.AdmLName1 AS AdministratorName FROM      schools AS T1 JOIN      frpm AS T2 ON T1.CDSCode = T2.CDSCode JOIN      (         SELECT              CDSCode,             MAX(AdmFName1) AS AdmFName1,             MAX(AdmLName1) AS AdmLName1         FROM              schools         WHERE              Charter = 1 AND CharterNum = '00D2'         GROUP BY              CDSCode     ) AS T3 ON T1.CDSCode = T3.CDSCode LEFT JOIN      (         SELECT              CDSCode,             AdmFName1,             AdmLName1         FROM              schools         WHERE              Charter = 1 AND CharterNum = '00D2' AND AdmFName1 IS NOT NULL     ) AS T4 ON T1.CDSCode = T4.CDSCode AND T3.AdmFName1 = T4.AdmFName1 AND T3.AdmLName1 = T4.AdmLName1 WHERE      T4.AdmFName1 IS NOT NULL;	california_schools
SELECT COUNT(*)  FROM schools  WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN `FundingType` = 'Local' THEN 1 END) * 100.0 / COUNT(T1.CDSCode)) AS Percentage FROM      frpm T1 JOIN      schools T2 ON T1.CDSCode = T2.CDSCode WHERE      T2.County = 'Santa Clara'	california_schools
SELECT COUNT(*)  FROM schools  WHERE StatusType = 'Open'  AND County = 'Stanislaus'  AND (OpenDate BETWEEN '2000-01-01' AND '2005-12-31')  AND FundingType = 'Directly Funded';	california_schools
SELECT SUM(CASE WHEN `ClosedDate` BETWEEN '1989-01-01' AND '1989-12-31' THEN 1 ELSE 0 END) AS TotalClosure FROM schools WHERE `City` = 'San Francisco' AND `StatusType` = 'Community College District';	california_schools
SELECT T1.County  FROM schools AS T1  JOIN (     SELECT CDSCode      FROM frpm      WHERE `Academic Year` BETWEEN '1980' AND '1989'      AND `Charter School (Y/N)` = 0      AND T1.CDSCode = frpm.CDSCode ) AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.SOC = '11'  GROUP BY T1.County  ORDER BY COUNT(*) DESC  LIMIT 1;	california_schools
SELECT NCESSchool FROM schools WHERE SOC = '31'	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine' AND (StatusType = 'Active' OR StatusType = 'Closed') AND Virtual = 'District Community Day'	california_schools
SELECT `District Code` FROM schools WHERE `Magnet` = 0 AND `City` = 'Fresno';	california_schools
SELECT      SUM(`Enrollment (Ages 5-17)`)  FROM      frpm  WHERE      `Academic Year` = '2014-2015' AND      `School Name` = 'State Special School' AND      `District Name` = 'Fremont' AND      `EdOpsCode` = 'SSS';	california_schools
SELECT `FRPM Count (Ages 5-17)` FROM frpm WHERE `MailStreet` = 'PO Box 1040' AND `School Name` LIKE '%Youth Authority%'	california_schools
SELECT `Low Grade` FROM frpm WHERE `EdOpsCode` = 'SPECON' AND NCESDist = '613360';	california_schools
SELECT `School Name` FROM frpm WHERE `County Code` = '37' AND `Educational Option Type` = 'Breakfast Provision 2';	california_schools
SELECT T1.City  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T2.LowGrade = '9'  AND T2.HighGrade = '12'  AND T1.EILCode = 'HS'  AND T1.County = 'Merced'  AND T2.NSLP_Provision_Status = '2'	california_schools
SELECT      T1.CDSCode,     T1.`County Name`,     T1.`School Name`,     (T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)` * 100) AS `Percent (%) Eligible FRPM (Ages 5-17)` FROM      frpm AS T1 JOIN      schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T1.`Low Grade` = 'K'     AND T1.`High Grade` = '9'     AND T2.County = 'Los Angeles'	california_schools
SELECT `Low Grade`, `High Grade` FROM frpm WHERE `City` = 'Adelanto' GROUP BY `Low Grade`, `High Grade` ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT COUNT(*) AS NumberOfSchools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F'	california_schools
SELECT T1.SchoolName, T1.Latitude FROM schools AS T1 JOIN (     SELECT Latitude, CDSCode FROM schools     ORDER BY Latitude DESC LIMIT 1 ) AS T2 ON T1.CDSCode = T2.CDSCode	california_schools
SELECT `School Name` FROM schools WHERE `State` = 'CA' AND Latitude = (     SELECT MIN(Latitude)     FROM schools     WHERE `State` = 'CA' ) AND `Low Grade` IS NOT NULL;	california_schools
SELECT `Low Grade`, `High Grade` FROM frpm WHERE Longitude = (SELECT MAX(Longitude) FROM frpm);	california_schools
SELECT COUNT(DISTINCT s.City), s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.HighGrade = 'K-8' AND s.Magnet = 1 AND f.EducationalOptionType LIKE '%Multiple Provision Types%' GROUP BY s.City;	california_schools
SELECT AdmFName1, District FROM schools WHERE AdmFName1 IS NOT NULL UNION SELECT AdmFName2, District FROM schools WHERE AdmFName2 IS NOT NULL UNION SELECT AdmFName3, District FROM schools WHERE AdmFName3 IS NOT NULL ORDER BY District, AdmFName1 LIMIT 2;	california_schools
SELECT T1.`District Code`, CAST(T2.`Free Meal Count (K-12)` AS REAL) / T2.`Enrollment (K-12)` * 100 AS Percent_Free_K_12 FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode JOIN (     SELECT CDSCode, AdmFName1, AdmFName2, AdmFName3     FROM schools     WHERE AdmFName1 LIKE 'Alusine%' OR AdmFName2 LIKE 'Alusine%' OR AdmFName3 LIKE 'Alusine%' ) AS T3 ON T1.CDSCode = T3.CDSCode WHERE T3.AdmFName1 IS NOT NULL OR T3.AdmFName2 IS NOT NULL OR T3.AdmFName3 IS NOT NULL	california_schools
SELECT T2.AdmLName3, T2.District, T2.County, T2.SchoolName FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterSchoolNumber = '40' ORDER BY T2.LastUpdate DESC LIMIT 1;	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3  FROM schools  WHERE County = 'San Bernardino'  AND District = 'San Bernardino City Unified'  AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'  AND SOC IN ('62', '84')  AND DOC = '54';	california_schools
SELECT T2.AdmEmail1, T2.AdmEmail2, T2.AdmEmail3 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL AND T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);	california_schools
SELECT COUNT(*)  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district d2 ON c.district_id = d2.district_id  WHERE d.type = 'POPLATEK PO OBRATU' AND d2.A3 = 'East Bohemia'	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague' AND account_id IN (SELECT account_id FROM loan);	financial
SELECT      AVG(CASE WHEN A12 IS NOT NULL THEN A12 ELSE 0 END) AS unemployment_rate_1995,     AVG(CASE WHEN A13 IS NOT NULL THEN A13 ELSE 0 END) AS unemployment_rate_1996 FROM district;	financial
SELECT COUNT(DISTINCT A.district_id) FROM district AS D JOIN client AS C ON D.district_id = C.district_id WHERE C.gender = 'F' AND D.A11 > 6000 AND D.A11 < 10000;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;	financial
WITH FemaleClients AS (     SELECT client_id, AVG(`A11`) AS avg_salary     FROM client     WHERE gender = 'F' ), OldestFemaleClient AS (     SELECT MIN(client_id) AS oldest_client_id     FROM client     WHERE gender = 'F' ), LowestAverageSalary AS (     SELECT MIN(avg_salary) AS min_avg_salary     FROM FemaleClients ), HighestAverageSalary AS (     SELECT MAX(avg_salary) AS max_avg_salary     FROM FemaleClients ), GapCalculation AS (     SELECT (max_avg_salary - min_avg_salary) AS salary_gap     FROM HighestAverageSalary, LowestAverageSalary ) SELECT DISTINCT T1.account_id FROM account T1 JOIN disp T2 ON T1.account_id = T2.account_id JOIN client T3 ON T2.client_id = T3.client_id JOIN FemaleClients T4 ON T3.client_id = T4.client_id WHERE T4.client_id = (SELECT oldest_client_id FROM OldestFemaleClient) AND T4.avg_salary = (SELECT min_avg_salary FROM LowestAverageSalary) AND EXISTS (SELECT * FROM GapCalculation)	financial
SELECT account_id FROM client  WHERE (gender, A11) IN (     SELECT gender, MAX(A11) FROM client      WHERE gender IS NOT NULL      GROUP BY gender ) AND (gender, birth_date) IN (     SELECT gender, MIN(birth_date) FROM client      WHERE gender IS NOT NULL      GROUP BY gender )	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  WHERE client.gender = 'Owner' AND account.frequency = 'POPLATEK TYDNE'	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'Disponent' AND c.client_id IN (     SELECT t.account_id     FROM trans t     WHERE t.type = 'POPLATEK PO OBRATU' );	financial
SELECT account_id FROM loan WHERE strftime('%Y', date) = '1997' AND status = 'approved' ORDER BY amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND YEAR(a.date) = 1993 ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.A2 = 'Slokolov'	financial
SELECT account_id, MIN(date) AS earliest_trading_date FROM trans WHERE date >= '1995-01-01' AND date < '1996-01-01' GROUP BY account_id ORDER BY earliest_trading_date ASC LIMIT 1;	financial
SELECT DISTINCT account_id FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.balance > 3000 AND YEAR(trans.date) < 1997;	financial
SELECT client_id FROM card WHERE issued = '1994-03-03'	financial
SELECT T1.date FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'	financial
SELECT T1.district_id FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.date = '1994-08-25'	financial
SELECT MAX(amount)  FROM trans  JOIN disp ON trans.account_id = disp.account_id  JOIN card ON disp.disp_id = card.disp_id  WHERE card.issued = '1996-10-21'	financial
SELECT c.gender  FROM client c JOIN (     SELECT d.district_id, AVG(d.A11) AS avg_salary     FROM district d     GROUP BY d.district_id     ORDER BY avg_salary DESC     LIMIT 1 ) AS high_salary_branch ON c.district_id = high_salary_branch.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)      FROM client      WHERE district_id = high_salary_branch.district_id )	financial
SELECT T1.amount FROM trans AS T1 JOIN (     SELECT account_id, MAX(amount) AS max_loan_amount     FROM loan ) AS T2 ON T1.account_id = T2.account_id AND T1.date > (     SELECT MIN(date)      FROM account AS T3     WHERE T3.account_id = T1.account_id ) ORDER BY T2.max_loan_amount DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Jesenik' AND client.gender = 'F'	financial
SELECT T2.disp_id FROM trans AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 5100 AND T1.date = '1998-09-02'	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice' AND YEAR(account.date) = 1996;	financial
SELECT T3.A2  FROM client AS T1  JOIN disp AS T2 ON T1.client_id = T2.client_id  JOIN district AS T3 ON T3.district_id = T1.district_id  WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT c.birth_date FROM client AS c JOIN loan AS l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03'	financial
SELECT t.account_id  FROM account t  JOIN disp d ON t.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district d2 ON c.district_id = d2.district_id  WHERE d2.A3 = 'Prague'  ORDER BY t.date ASC  LIMIT 1;	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id)  FROM client AS T1  JOIN district AS T2 ON T1.district_id = T2.district_id  WHERE T2.A3 = 'South Bohemia' AND T2.A4 > ALL (SELECT T2.A4 FROM district AS T2 WHERE T2.A3 = 'South Bohemia')  AND T2.A4 IS NOT NULL	financial
SELECT      ((t1.balance - t2.balance) / t2.balance) * 100 AS balance_increase_rate FROM      (     SELECT          account_id,          MAX(date) AS loan_date     FROM          loan     WHERE          date <= '1993-07-05'     GROUP BY          account_id     ) AS t3 JOIN      (     SELECT          account_id,          MIN(date) AS first_loan_date,          balance     FROM          (         SELECT              account_id,              date,              balance,              RANK() OVER(PARTITION BY account_id ORDER BY date) AS rnk         FROM              trans         WHERE              date >= '1993-03-22' AND date <= '1998-12-27'         ) AS subquery     WHERE          rnk = 1     ) AS t2 ON t2.account_id = t3.account_id AND t2.date = t3.first_loan_date JOIN      (     SELECT          account_id,          MAX(date) AS last_date     FROM          trans     WHERE          date <= '1998-12-27'     GROUP BY          account_id     ) AS t1 ON t1.account_id = t2.account_id AND t1.last_date = t2.date	financial
SELECT      CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) OVER () AS percentage_paid FROM      loan WHERE      status = 'A'	financial
SELECT      (SUM(CASE WHEN amount < 100000 AND status = 'C' THEN 1 ELSE 0 END)      / CAST(SUM(amount) AS REAL)) * 100 FROM      loan WHERE      amount < 100000;	financial
SELECT T1.account_id, T3.A2, T3.A3 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.date < (SELECT T4.date FROM trans AS T4 WHERE T4.type = 'POPLATEK PO OBRATU') AND YEAR(T1.date) = 1993;	financial
SELECT T1.account_id, COUNT(T1.account_id) AS frequency FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'east Bohemia' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY T1.account_id;	financial
SELECT T1.account_id, T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'	financial
SELECT T1.A2, T1.A3 FROM district AS T1 JOIN loan AS T2 ON T1.district_id = T2.account_id WHERE T2.loan_id = 4990;	financial
SELECT T1.account_id, T3.A2, T3.A3 FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 300000 AND T3.A13 IS NOT NULL;	financial
SELECT      loan.loan_id,      district.A3,      district.A11 AS average_salary FROM      loan JOIN      account ON loan.account_id = account.account_id JOIN      disp ON disp.account_id = account.account_id JOIN      client ON client.client_id = disp.client_id JOIN      district ON district.district_id = client.district_id WHERE      loan.duration = 60;	financial
SELECT T1.A3 AS district,         ((T1.A13 - T1.A12) / T1.A12) * 100 AS unemployment_increment_rate FROM district AS T1 JOIN (     SELECT DISTINCT D.client_id     FROM disp AS D     JOIN account AS AC ON D.account_id = AC.account_id     JOIN loan AS L ON AC.account_id = L.account_id     WHERE L.status = 'D' ) AS T2 ON T1.district_id = T2.client_id WHERE T1.A12 IS NOT NULL AND T1.A13 IS NOT NULL;	financial
SELECT      SUM(CASE WHEN T1.A2 = 'Decin' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS percentage FROM      district AS T1 JOIN      account AS T2 ON T1.district_id = T2.district_id WHERE      YEAR(T2.date) = 1993;	financial
SELECT DISTINCT account_id  FROM trans  WHERE type = 'POPLATEK MESICNE';	financial
SELECT T1.A2, COUNT(*) AS FemaleAccountHolders FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.A2 ORDER BY FemaleAccountHolders DESC LIMIT 10;	financial
SELECT T3.A2 AS DistrictName, SUM(T1.amount) AS TotalWithdrawals FROM trans AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.client_id = T3.client_id WHERE T1.type = 'VYDAJ' AND T1.date LIKE '1996-01%' GROUP BY T3.A2 ORDER BY TotalWithdrawals DESC LIMIT 10;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'South Bohemia' AND account.card_id IS NULL;	financial
SELECT T3.A3  FROM trans AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T2.status = 'C'  GROUP BY T3.district_id, T3.A3  ORDER BY COUNT(T1.trans_id) DESC  LIMIT 1;	financial
SELECT AVG(amount)  FROM loan  JOIN client ON loan.account_id = client.client_id  WHERE client.gender = 'M'	financial
SELECT T1.A2 AS BranchLocation, T1.A3 AS DistrictName  FROM district AS T1  WHERE T1.A13 = (SELECT MAX(A13) FROM district WHERE strftime('%Y', date) = '1996')	financial
SELECT COUNT(*)  FROM (     SELECT T1.district_id, SUM(T2.A16) AS total_crimes     FROM account AS T1     JOIN district AS T2 ON T1.district_id = T2.district_id     WHERE YEAR(T1.date) = 1996 AND T2.A16 IS NOT NULL     GROUP BY T1.district_id     ORDER BY total_crimes DESC     LIMIT 1 ) AS T3 JOIN account AS T4 ON T3.district_id = T4.district_id;	financial
SELECT DISTINCT t1.account_id FROM trans t1 JOIN (     SELECT account_id     FROM trans     WHERE type = 'VYBER KARTOU' ) t2 ON t1.account_id = t2.account_id JOIN (     SELECT account_id     FROM trans     WHERE type = 'POPLATEK MESICNE' AND balance < 0 ) t3 ON t1.account_id = t3.account_id	financial
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE date BETWEEN '1995-01-01' AND '1997-12-31'  AND amount >= 250000  AND frequency = 'POPLATEK MESICNE'  AND status = 'APPROVED';	financial
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN district ON disp.disp_id = district.district_id  WHERE district.A2 = 'Branch location 1' AND account.status = 'C' UNION SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN district ON disp.disp_id = district.district_id  WHERE district.A2 = 'Branch location 1' AND account.status = 'D'	financial
SELECT COUNT(*)  FROM client  WHERE client_id IN (     SELECT d.client_id      FROM (         SELECT disp_id, COUNT(*) AS crime_count          FROM (             SELECT disp_id, date, COUNT(*) AS crime_count              FROM (                 SELECT account_id, date, SUM(CASE WHEN type = 'crime' THEN 1 ELSE 0 END) AS crime_count                  FROM trans                  WHERE date BETWEEN '1995-01-01' AND '1995-12-31'                  GROUP BY account_id, date             ) t              GROUP BY disp_id         ) t2          JOIN disp ON t2.disp_id = disp.disp_id          WHERE t2.crime_count > (SELECT MIN(crime_count) FROM (SELECT DISTINCT crime_count FROM (SELECT COUNT(*) AS crime_count FROM trans WHERE date BETWEEN '1995-01-01' AND '1995-12-31' GROUP BY disp_id) AS subquery ORDER BY crime_count DESC LIMIT 1 OFFSET 1))     ) d     AND client.gender = 'M' )	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'gold' AND disp.type = 'disponent'	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Pisek'	financial
SELECT T1.A2, T1.A3 FROM district AS T1 JOIN trans AS T2 ON T1.district_id = T2.account_id WHERE T2.amount > 10000 AND YEAR(T2.date) = 1997 GROUP BY T1.district_id HAVING SUM(T2.amount) > 10000;	financial
SELECT DISTINCT t1.account_id FROM trans AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id JOIN district AS t3 ON t2.district_id = t3.district_id JOIN `order` AS t4 ON t1.account_id = t4.account_id WHERE t3.A3 = 'Pisek' AND t4.k_symbol = 'SIPO';	financial
SELECT DISTINCT account_id FROM card WHERE type = 'gold' INTERSECT SELECT DISTINCT account_id FROM card WHERE type = 'junior'	financial
SELECT AVG(amount) AS average_credit_card_amount FROM trans JOIN account ON trans.account_id = account.account_id JOIN card ON account.account_id = card.account_id WHERE trans.type = 'VYBER KARTOU' AND YEAR(trans.date) = 2021	financial
SELECT DISTINCT T1.account_id  FROM trans AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  WHERE T1.type = 'VYBER KARTOU' AND        (SELECT AVG(amount) FROM trans WHERE type = 'VYBER KARTOU' AND date BETWEEN '1998-01-01' AND '1998-12-31') > T1.amount	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE c.gender = 'F' AND EXISTS (     SELECT 1 FROM loan l WHERE l.account_id = a.account_id ) AND EXISTS (     SELECT 1 FROM card ca WHERE ca.disp_id = d.disp_id );	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A3 = 'south Bohemia';	financial
SELECT a.account_id  FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp p ON a.account_id = p.account_id WHERE d.A2 = 'Tabor' AND p.type = 'OWNER'	financial
SELECT DISTINCT T1.type FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.type != 'OWNER' AND T3.A11 BETWEEN 8000 AND 9000;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  JOIN trans ON account.account_id = trans.account_id  WHERE district.A3 = 'North Bohemia'  AND trans.bank LIKE 'AB%'	financial
SELECT T3.A2 FROM trans AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.type = 'VYDAJ'	financial
SELECT AVG(T1.A15)  FROM district AS T1  JOIN account AS T2 ON T1.district_id = T2.district_id  WHERE T1.A8 > 4000 AND T2.date >= '1997-01-01'	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  JOIN account ON disp.account_id = account.account_id  WHERE type = 'classic' AND account.type = 'OWNER'	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT      CAST(SUM(CASE WHEN type = 'Gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage' FROM      card	financial
SELECT T1.client_id AS owner_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = (SELECT MAX(amount) FROM loan)	financial
SELECT T1.A15 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532	financial
SELECT T3.district_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.order_id = 33333	financial
SELECT t1.amount, t1.balance FROM trans AS t1 JOIN disp AS t2 ON t1.account_id = t2.account_id WHERE t1.type = 'VYBER' AND t2.client_id = 3356;	financial
SELECT COUNT(*)  FROM (     SELECT DISTINCT account_id      FROM account      WHERE frequency = 'POPLATEK TYDNE' ) AS weekly_account_ids JOIN loan ON account_id = loan.account_id  WHERE amount < 200000	financial
SELECT t2.type FROM client AS t1 JOIN card AS t2 ON t1.client_id = t2.disp_id WHERE t1.client_id = 13539;	financial
SELECT district.A3 FROM client JOIN district ON client.district_id = district.district_id WHERE client.client_id = 3541;	financial
SELECT T1.district_id AS district_id, COUNT(*) AS total_accounts FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN disp AS T3 ON T2.client_id = T3.client_id JOIN account AS T4 ON T3.account_id = T4.account_id JOIN loan AS T5 ON T4.account_id = T5.account_id WHERE T5.status = 'A' GROUP BY T1.district_id ORDER BY total_accounts DESC LIMIT 1;	financial
SELECT `order`.account_id FROM `order` WHERE `order`.order_id = 32423;	financial
SELECT t.trans_id, a.account_id, t.date, t.type, t.operation, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.district_id = 5;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik')	financial
SELECT DISTINCT client_id  FROM card  WHERE issued >= '1997-01-01'	financial
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.client_id)  FROM      client c  JOIN      account a ON c.district_id = a.district_id  JOIN      district d ON a.district_id = d.district_id  WHERE      d.A11 > 10000;	financial
SELECT      ((SUM(amount WHERE date BETWEEN '1997-01-01' AND '1997-12-31') - SUM(amount WHERE date BETWEEN '1996-01-01' AND '1996-12-31')) /      (SUM(amount WHERE date BETWEEN '1996-01-01' AND '1996-12-31'))) * 100 AS growth_rate FROM      client  JOIN      disp ON client.client_id = disp.client_id JOIN      account ON disp.account_id = account.account_id JOIN      loan ON account.account_id = loan.account_id WHERE      client.gender = 'M';	financial
SELECT COUNT(*)  FROM trans  JOIN card ON trans.account_id = card.card_id  WHERE trans.date > '1995-12-31' AND trans.type = 'VYBER KARTOU'	financial
SELECT      (SELECT A16 FROM district WHERE A3 = 'North Bohemia') -      (SELECT A16 FROM district WHERE A3 = 'East Bohemia')	financial
SELECT COUNT(*)  FROM `order`  WHERE account_id = 1 AND account_to BETWEEN 1 AND 10	financial
SELECT t.type, SUM(t.amount) AS total_debit_amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.account_id = 3 AND t.amount < 0 AND t.k_symbol = 'statement' GROUP BY t.type;	financial
SELECT T1.birth_date YEAR(T1.birth_date) FROM client AS T1 WHERE T1.client_id = 130	financial
SELECT COUNT(*)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE d.type = 'POPLATEK PO OBRATU' AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT SUM(amount), payments FROM loan WHERE account_id IN (     SELECT account_id FROM disp WHERE client_id = 992 )	financial
SELECT SUM(amount),         CASE WHEN client.gender = 'M' THEN 'Man' ELSE 'Woman' END AS Account_Owner FROM trans JOIN disp ON trans.account_id = disp.account_id JOIN account ON disp.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE trans.trans_id = 851 AND disp.client_id = 4;	financial
SELECT T2.type FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.disp_id WHERE T1.client_id = 9	financial
SELECT SUM(amount) AS total_payment FROM trans JOIN account ON trans.account_id = account.account_id WHERE account.client_id = 617 AND YEAR(trans.date) = 1998;	financial
SELECT DISTINCT c.client_id FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'East Bohemia'	financial
SELECT client_id FROM client WHERE gender = 'F' ORDER BY amount DESC LIMIT 3	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  JOIN trans ON account.account_id = trans.account_id  WHERE client.gender = 'M'  AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND trans.type = 'SIPO'  AND trans.amount > 4000	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Beroun' AND account.date > '1996-12-31'	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  WHERE client.gender = 'F' AND disp.type = 'junior'	financial
SELECT      COUNT(CASE WHEN T1.gender = 'F' THEN T1.client_id END) * 100.0 / COUNT(T1.client_id) AS percentage_female FROM      client AS T1 JOIN      account AS T2 ON T1.district_id = T2.district_id JOIN      district AS T3 ON T3.district_id = T1.district_id WHERE      T3.A3 = 'Prague';	financial
SELECT      (COUNT(CASE WHEN T1.gender = 'M' AND T2.type = 'POPLATEK TYDNE' THEN 1 END)      / CAST(COUNT(*) AS REAL) * 100) AS percentage_male_clients_weekly FROM      client AS T1 JOIN      disp AS T2 ON T1.client_id = T2.client_id WHERE      T2.type = 'POPLATEK TYDNE';	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  WHERE account.frequency = 'POPLATEK TYDNE'	financial
SELECT DISTINCT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT T1.account_id FROM account AS T1  JOIN client AS T2 ON T1.account_id = T2.client_id  WHERE T2.gender = 'F'  ORDER BY T2.birth_date ASC, T1.A11 ASC  LIMIT 1;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE YEAR(client.birth_date) = 1920 AND district.A3 = 'east Bohemia'	financial
SELECT COUNT(*)  FROM loan  WHERE duration = 24 AND status = 'PRE-PAYMENT' AND frequency = 'POPLATEK TYDNE'	financial
SELECT AVG(amount) AS avg_loan_amount FROM (     SELECT loan.amount     FROM loan     JOIN account ON loan.account_id = account.account_id     WHERE account.account_id IN (         SELECT trans.account_id         FROM trans         WHERE type = 'POPLATEK PO OBRATU'     )     AND loan.status = 'C' OR loan.status = 'D' ) AS loan_details;	financial
SELECT DISTINCT c.client_id, d.A1 FROM client c JOIN district d ON c.district_id = d.district_id WHERE EXISTS (     SELECT 1     FROM disp dsp     WHERE dsp.client_id = c.client_id AND d.A1 IN ('permanent_order', 'loan_application') );	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age  FROM client c  JOIN disp d ON c.client_id = d.client_id  WHERE d.type = 'gold'  AND EXISTS (     SELECT 1 FROM loan l WHERE l.account_id = d.account_id AND l.status = 'eligible' );	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '-' AND a.element = 'cl'	toxicology
SELECT AVG(CASE WHEN T3.element = 'O' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T2.bond_id = T3.bond_id WHERE T2.bond_type = '-'	toxicology
SELECT      AVG(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS avg_single_bonded_carcinogenic_molecules FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND b.bond_type = '-'	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE m.label = '-' AND a.element = 'Na';	toxicology
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+';	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'C' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100 AS percentage_carbon_double_bond FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'Br';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'si'	toxicology
SELECT T3.element  FROM `bond` AS T1  JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id  JOIN `atom` AS T3 ON (T2.atom_id = T3.atom_id OR T2.atom_id2 = T3.atom_id)  WHERE T1.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT atom.element  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_type = '=='	toxicology
SELECT `label` FROM `atom` JOIN `molecule` ON `atom.molecule_id` = `molecule.molecule_id` WHERE `element` = 'H' GROUP BY `label` ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT T3.bond_type  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id  JOIN bond AS T3 ON T3.bond_id = T2.bond_id  WHERE T1.element = 'Te' AND T4.element = 'Te'	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'	toxicology
SELECT DISTINCT atom_id, atom_id2 FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '-'	toxicology
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '-'  GROUP BY element  ORDER BY COUNT(element) ASC  LIMIT 1;	toxicology
SELECT T3.bond_type  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T1.bond_id = T3.bond_id  WHERE T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20'	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element != 'sn' AND (m.label = '+' OR m.label = '-')	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON a.atom_id = ANY(b.atom_id) JOIN connected c ON b.bond_id = c.bond_id WHERE m.label IS NOT NULL AND (a.element = 'I' OR a.element = 'S') AND b.bond_type = '-'	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181'	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'F' THEN 1 ELSE 0 END) / COUNT(molecule.molecule_id)) * 100 AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+' AND atom.element IS NOT NULL;	toxicology
SELECT      (SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) / COUNT(bond.bond_id)) * 100 AS percentage_of_carcinogenic_molecules_in_triple_bonds FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR000'  ORDER BY element ASC  LIMIT 3;	toxicology
SELECT T1.atom_id, T1.element  FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.molecule_id = 'TR001' AND T3.bond_id = 'TR001_2_6' UNION SELECT T4.atom_id2, T4.element  FROM atom AS T4 JOIN connected AS T5 ON T4.atom_id2 = T5.atom_id2 JOIN bond AS T6 ON T6.bond_id = T5.bond_id WHERE T6.molecule_id = 'TR001' AND T6.bond_id = 'TR001_2_6' ORDER BY T1.atom_id;	toxicology
SELECT      (SUM(CASE WHEN `molecule`.`label` = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN `molecule`.`label` = '-' THEN 1 ELSE 0 END)) AS `difference` FROM      `molecule`	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR_000_2_5' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR_000_2_5'	toxicology
SELECT DISTINCT bond_id  FROM connected  WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = ' ORDER BY m.molecule_id  LIMIT 5;	toxicology
SELECT      (SUM(CASE WHEN `bond_type` = ' = ' THEN 1 ELSE 0 END) * 100.0 / COUNT(`bond_id`)) AS percentage FROM `bond` JOIN `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE `molecule.molecule_id` = 'TR008'	toxicology
SELECT      CAST(SUM(CASE WHEN `molecule`.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`molecule`.molecule_id) AS percent FROM      `molecule` WHERE      `molecule`.label = '+';	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'H' THEN 1 ELSE 0 END) / CAST(COUNT(atom.atom_id) AS REAL)) * 100 AS hydrogen_percentage FROM      atom JOIN      connected ON atom.atom_id = connected.atom_id JOIN      bond ON connected.bond_id = bond.bond_id JOIN      molecule ON molecule.molecule_id = atom.molecule_id WHERE      molecule.molecule_id = 'TR206';	toxicology
SELECT T3.bond_type  FROM molecule AS T1  JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id  JOIN bond AS T3 ON T3.bond_id = T2.bond_id  WHERE T1.molecule_id = 'TR000'	toxicology
SELECT T1.element, T3.label  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T2.bond_id = T3.bond_id  JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id  WHERE T4.molecule_id = 'TR060'	toxicology
SELECT      MAX(COUNT(bond.bond_type)) AS majority_bond_type,     molecule.label FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.molecule_id = 'TR018'	toxicology
SELECT m1.molecule_id FROM molecule AS m1 JOIN atom AS a1 ON m1.molecule_id = a1.molecule_id JOIN connected AS c ON a1.atom_id = c.atom_id JOIN connected AS c2 ON a1.atom_id = c2.atom_id2 JOIN bond AS b ON c.bond_id = b.bond_id JOIN bond AS b2 ON c2.bond_id = b2.bond_id WHERE b.bond_type = '-' AND b2.bond_type = '-' AND m1.label = '-'  ORDER BY m1.molecule_id ASC LIMIT 3;	toxicology
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR006' ORDER BY b.bond_type LIMIT 2;	toxicology
SELECT COUNT(DISTINCT T3.bond_id)  FROM connected AS T1  JOIN atom AS T2 ON (T1.atom_id = T2.atom_id OR T1.atom_id2 = T2.atom_id)  JOIN bond AS T3 ON T3.bond_id = T1.bond_id  JOIN molecule AS T4 ON T4.molecule_id = T3.molecule_id  WHERE T4.molecule_id = 'TR009' AND (T2.atom_id = 'TR009_12' OR T2.atom_id2 = 'TR009_12')	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+' AND EXISTS (     SELECT 1      FROM atom      WHERE molecule_id = molecule.molecule_id AND element = 'br' )	toxicology
SELECT      T3.bond_id,      CASE          WHEN T2.bond_type = ' = ' THEN 'double bond'         WHEN T2.bond_type = '-' THEN 'single bond'         WHEN T2.bond_type = '#' THEN 'triple bond'     END AS bond_type,     T1.atom_id,      T4.element AS atom_element1,     T5.element AS atom_element2 FROM      connected AS T1 JOIN      atom AS T2 ON T1.atom_id = T2.atom_id JOIN      atom AS T3 ON T1.atom_id2 = T3.atom_id JOIN      bond AS T4 ON T1.bond_id = T4.bond_id JOIN      atom AS T5 ON T2.molecule_id = T5.molecule_id AND T2.atom_id <> T5.atom_id WHERE      T4.molecule_id = 'TR001_6_9'	toxicology
SELECT m.label, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-carcinogenic' END AS carcinogenic_status FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(*) FROM `molecule` m JOIN `bond` b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(*)  FROM connected  WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19'	toxicology
SELECT T1.element  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.molecule_id = 'TR004'	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '-'	toxicology
SELECT DISTINCT T1.molecule_id  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN connected AS T3 ON T2.bond_id = T3.bond_id  JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id  WHERE SUBSTRING(T1.atom_id, 7, 2) BETWEEN '21' AND '25'  AND T4.label = '+';	toxicology
SELECT DISTINCT b.bond_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON b.bond_id = c.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.element = 'p' AND a2.element = 'n';	toxicology
SELECT T1.label  FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1	toxicology
SELECT AVG(T3.bond_id_count) AS avg_bonds FROM (     SELECT COUNT(T1.atom_id) AS bond_id_count     FROM atom T1     JOIN molecule T2 ON T1.molecule_id = T2.molecule_id     JOIN connected T4 ON T1.atom_id = T4.atom_id     JOIN bond T3 ON T3.bond_id = T4.bond_id     WHERE T1.element = 'I'     GROUP BY T1.atom_id ) AS T5	toxicology
SELECT      T3.bond_id,     CASE          WHEN T1.bond_type = ' = ' THEN 'double'         WHEN T1.bond_type = '-' THEN 'single'         WHEN T1.bond_type = '#' THEN 'triple'         ELSE 'unknown'     END AS bond_type FROM      connected AS T1 JOIN      atom AS T2 ON T1.atom_id = T2.atom_id AND SUBSTRING(T2.atom_id, 7, 2) + 0 = 45 JOIN      bond AS T3 ON T1.bond_id = T3.bond_id	toxicology
SELECT DISTINCT element  FROM atom  WHERE atom_id NOT IN (SELECT atom_id FROM connected) AND element IN ('Cl', 'C', 'H', 'O', 'S', 'N', 'P', 'Na', 'Br', 'F', 'I', 'Sn', 'Pb', 'Te', 'Ca')	toxicology
SELECT T1.atom_id FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T2.bond_id = T3.bond_id  WHERE T3.molecule_id = 'TR447' AND T3.bond_type = '#'	toxicology
SELECT T3.element FROM `connected` AS T1 JOIN `bond` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T1.atom_id = T3.atom_id WHERE T2.molecule_id = 'TR144_8_19' OR T1.atom_id2 = 'TR144_8_19' OR T1.atom_id2 = 'TR144_8_19' AND T1.bond_id IS NOT NULL	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=:' GROUP BY m.molecule_id ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label LIKE '+%'  GROUP BY element  ORDER BY COUNT(*) ASC  LIMIT 1;	toxicology
SELECT T1.atom_id  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T3.bond_id = T2.bond_id  WHERE T1.element = 'pb' AND T3.bond_type != 'non-bonded'	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN connected ON atom.atom_id = connected.atom_id2 JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#' AND EXISTS (     SELECT 1 FROM molecule WHERE molecule.molecule_id = atom.molecule_id AND (         atom.element IN ('Cl', 'C', 'H', 'O', 'S', 'N', 'P', 'Na', 'Br', 'F', 'I', 'Sn', 'Pb', 'Te', 'Ca')      ) ) GROUP BY atom.element HAVING COUNT(*) > 1	toxicology
SELECT      CAST(SUM(CASE          WHEN atom1.element = atom2.element THEN 1         ELSE 0         END) AS REAL) * 100 / COUNT(bond.bond_id) AS percentage_common_element_combination FROM      bond JOIN      connected ON bond.bond_id = connected.bond_id JOIN      atom AS atom1 ON atom1.atom_id = connected.atom_id JOIN      atom AS atom2 ON atom2.atom_id = connected.atom_id2;	toxicology
SELECT      SUM(CASE WHEN `molecule`.`label` = '+' AND `bond`.`bond_type` = '-' THEN 1 ELSE 0 END) AS carcinogenic_single_bonds_count,     COUNT(`bond`.`bond_id`) AS total_single_bonds_count,     CAST(SUM(CASE WHEN `molecule`.`label` = '+' AND `bond`.`bond_type` = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(`bond`.`bond_id`) AS proportion_carcinogenic_single_bonds FROM      `bond` JOIN      `molecule` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE      `bond`.`bond_type` = '-';	toxicology
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE element IN ('C', 'H')	toxicology
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 's';	toxicology
SELECT T3.bond_type FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T3.bond_id = T2.bond_id  WHERE T1.element = 'sn'	toxicology
SELECT COUNT(DISTINCT atom.element) FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '-';	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON a.atom_id = ANY (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#') AND atom_id2 IN (SELECT atom_id FROM atom WHERE element IN ('p', 'br'))) WHERE m.molecule_id IS NOT NULL;	toxicology
SELECT T3.bond_id FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T2.atom_id = T3.atom_id  WHERE T1.label = '+'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(connected.atom_id)) AS chlorine_percentage FROM      connected JOIN      atom ON connected.atom_id = atom.atom_id JOIN      bond ON connected.bond_id = bond.bond_id WHERE      bond.bond_type = '-';	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT `molecule_id` FROM `molecule` WHERE `label` = '-'	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'	toxicology
SELECT DISTINCT b.bond_type  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE m.molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T3.element FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR001_10_11' OR T2.atom_id2 = 'TR001_10_11'	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'I'	toxicology
SELECT      m.molecule_id,      MAX(CASE WHEN atom.element = 'Ca' THEN m.label ELSE NULL END) AS element_status FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id GROUP BY      m.molecule_id HAVING      COUNT(a.atom_id) > 1 ORDER BY      element_status DESC;	toxicology
SELECT COUNT(*)  FROM connected c1  JOIN atom a1 ON c1.atom_id = a1.atom_id  JOIN atom a2 ON c1.atom_id2 = a2.atom_id  JOIN bond b ON c1.bond_id = b.bond_id  JOIN molecule m ON b.molecule_id = m.molecule_id  JOIN atom a3 ON c1.atom_id = a3.atom_id  JOIN atom a4 ON c1.atom_id2 = a4.atom_id  JOIN bond b2 ON c1.bond_id = b2.bond_id  JOIN molecule m2 ON b2.molecule_id = m2.molecule_id  WHERE b2.bond_id = 'TR001_1_8' AND a1.element = 'cl' AND a4.element = 'c'	toxicology
SELECT T1.molecule_id  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  JOIN bond AS T3 ON T2.atom_id = T3.atom_id AND T2.atom_id <> T3.atom_id2  WHERE T2.element = 'C' AND T3.bond_type = '#' AND T1.label = '-'  GROUP BY T1.molecule_id  LIMIT 2;	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'Cl' THEN 1 ELSE 0 END)       OVER () * 100.0 / COUNT(DISTINCT molecule.molecule_id) OVER ()) AS chlorine_percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT T3.element FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T1.molecule_id = 'TR001' AND T3.element LIKE '%toxic%'	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_type` = 'double'	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' LIMIT 1;	toxicology
SELECT T3.element  FROM bond AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id  WHERE T1.bond_id = 'TR005_16_26'  AND (T3.element = 'cl' OR T3.element = 'c' OR T3.element = 'h' OR T3.element = 'o' OR T3.element = 's' OR T3.element = 'n' OR T3.element = 'p' OR T3.element = 'na' OR T3.element = 'br' OR T3.element = 'f' OR T3.element = 'i' OR T4.element = 'cl' OR T4.element = 'c' OR T4.element = 'h' OR T4.element = 'o' OR T4.element = 's' OR T4.element = 'n' OR T4.element = 'p' OR T4.element = 'na' OR T4.element = 'br' OR T4.element = 'f' OR T4.element = 'i')	toxicology
SELECT COUNT(*)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT `molecule`.`label` FROM `bond` JOIN `molecule` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond`.`bond_id` = 'TR001_10_11'	toxicology
SELECT      T3.bond_id,     CASE          WHEN T1.label = '+' THEN 'Carcinogenic'         WHEN T1.label = '-' THEN 'Non-carcinogenic'         ELSE 'Unknown'     END AS carcinogenic_status FROM      atom AS T1 JOIN      connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN      bond AS T3 ON T3.bond_id = T2.bond_id JOIN      molecule AS T4 ON T4.molecule_id = T1.molecule_id WHERE      T3.bond_type = '#' AND T4.label IN ('+', '-')	toxicology
SELECT      molecule_id,      element  FROM      atom  JOIN      molecule ON atom.molecule_id = molecule.molecule_id  JOIN      connected ON atom.atom_id = connected.atom_id  JOIN      bond ON connected.bond_id = bond.bond_id  WHERE      molecule.label = '+' AND      SUBSTR(atom.atom_id, 7, 1) = 4 AND      element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT      SUM(CASE WHEN atom.element = 'H' THEN 1 ELSE 0 END) / COUNT(atom.element) AS hydrogen_ratio,     (SELECT label FROM molecule WHERE molecule.molecule_id = 'TR006') AS label FROM      atom JOIN      connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN      bond ON bond.bond_id = connected.bond_id JOIN      molecule ON molecule.molecule_id = bond.molecule_id WHERE      molecule.molecule_id = 'TR006'	toxicology
SELECT m.label  FROM molecule AS m  JOIN atom AS a ON m.molecule_id = a.molecule_id  WHERE a.element = 'Ca'  AND m.label = '+'	toxicology
SELECT      b.bond_type FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.element = 'Te' GROUP BY      b.bond_id, b.bond_type ORDER BY      COUNT(*) DESC;	toxicology
SELECT DISTINCT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T3.bond_id = T2.bond_id  WHERE T3.bond_id = 'TR001_10_11'  AND (T1.element = 'cl' OR T1.element = 'c' OR T1.element = 'h' OR T1.element = 'o' OR T1.element = 's' OR T1.element = 'n' OR T1.element = 'p' OR T1.element = 'na' OR T1.element = 'br' OR T1.element = 'f' OR T1.element = 'i' OR T1.element = 'sn' OR T1.element = 'pb' OR T1.element = 'te' OR T1.element = 'ca')	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT      (SUM(CASE WHEN `bond.bond_type` = ' = ' THEN 1 ELSE 0 END) / CAST(COUNT(`bond.bond_id`) AS REAL)) * 100 AS percent FROM      `bond` JOIN      `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE      `molecule.molecule_id` = 'TR047'	toxicology
SELECT T3.label  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN molecule AS T3 ON T3.molecule_id = T2.molecule_id  WHERE T1.atom_id = 'TR001_1' AND T3.label = '+';	toxicology
SELECT m.label  FROM molecule AS m  WHERE m.molecule_id = 'TR151' AND m.label = '+';	toxicology
SELECT atom.element  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN connected ON atom.atom_id = connected.atom_id2  JOIN bond ON connected.bond_id = bond.bond_id  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR151'  AND atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.molecule_id BETWEEN 'TR010' AND 'TR050' AND T1.element = 'C';	toxicology
SELECT COUNT(DISTINCT T1.atom_id)  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN connected AS T3 ON T2.atom_id2 = T3.atom_id2  JOIN bond AS T4 ON T4.bond_id = T2.bond_id  JOIN molecule AS T5 ON T5.molecule_id = T1.molecule_id AND T5.label = '+'	toxicology
SELECT T3.bond_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T1.label = '+' AND T4.bond_type = '==';	toxicology
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE molecule.label = '+' AND atom.element = 'h'	toxicology
SELECT T3.molecule_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T2.atom_id = 'TR00_1' AND T3.bond_id = 'TR00_1_2'	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'C' AND molecule.label = '-'	toxicology
SELECT      (COUNT(CASE WHEN T3.label = '+' AND T1.element = 'h' THEN T2.molecule_id ELSE NULL END) * 100.0 / COUNT(T2.molecule_id)) FROM      atom AS T1 JOIN      molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN      connected AS T3 ON T1.atom_id = T3.atom_id OR T1.atom_id = T3.atom_id2 WHERE      T3.bond_id IS NOT NULL;	toxicology
SELECT `molecule`.`label` FROM `molecule` WHERE `molecule.molecule_id` = 'TR124' AND `molecule.label` = '+';	toxicology
SELECT atom.atom_id  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR186'	toxicology
SELECT `bond_type` FROM `bond` WHERE `molecule_id` = 'TR007_4_19'	toxicology
SELECT T3.element  FROM bond AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id  WHERE T1.bond_id = 'TR001_2_4'  AND T3.element IS NOT NULL  AND T4.element IS NOT NULL;	toxicology
SELECT COUNT(*) AS double_bonds_count, `molecule`.label  FROM `bond`  JOIN `connected` ON `bond.bond_id` = `connected.bond_id` JOIN `atom` ON `atom.atom_id` = `connected.atom_id` JOIN `atom` ON `atom.atom_id` = `connected.atom_id2` JOIN `molecule` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `molecule.molecule_id` = 'TR006' AND `bond.bond_type` = '= ='	toxicology
SELECT `molecule`.`label`, `atom`.`element` FROM `molecule` JOIN `atom` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE `molecule`.`label` = '+' AND (`atom`.`element` IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'))	toxicology
SELECT c.atom_id, c.atom_id2, b.bond_id, a.element, a2.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id, GROUP_CONCAT(DISTINCT a.element) AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '#' GROUP BY m.molecule_id HAVING COUNT(*) > 1	toxicology
SELECT atom.element  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(*)  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN molecule m2 ON a2.molecule_id = m2.molecule_id  JOIN atom at ON c.bond_id = at.bond_id  WHERE at.element = 'cl'	toxicology
SELECT      a.atom_id,     COUNT(DISTINCT b.bond_type) AS num_bond_types FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id JOIN      bond b ON a.molecule_id = b.molecule_id WHERE      m.molecule_id = 'TR346'	toxicology
SELECT COUNT(DISTINCT mol.molecule_id) AS num_double_bond_molecules,        SUM(CASE WHEN mol.label = '+' THEN 1 ELSE 0 END) AS num_carcinogenic_double_bond_molecules FROM molecule mol JOIN bond bnd ON mol.molecule_id = bnd.molecule_id WHERE bnd.bond_type = '='	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON b.bond_id = c.bond_id WHERE m.label IS NULL  AND a.element <> 'S'  AND b.bond_type != '= ='	toxicology
SELECT `molecule`.`label`  FROM `bond`  JOIN `connected` ON `bond.bond_id` = `connected.bond_id`  JOIN `atom` ON `atom.atom_id` = `connected.atom_id` AND `atom.molecule_id` = `bond.molecule_id`  JOIN `molecule` ON `molecule.molecule_id` = `atom.molecule_id`  WHERE `bond.bond_id` = 'TR001_2_4' AND `molecule.label` = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT m.molecule_id FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.element LIKE '%cl%' AND m.label = '+'	toxicology
SELECT m.molecule_id FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT      (SUM(CASE WHEN T3.label = '+' AND T1.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(T2.molecule_id)) AS percentage FROM      atom AS T1 JOIN      molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN      (SELECT * FROM molecule WHERE label = '+') AS T3 ON T2.molecule_id = T3.molecule_id	toxicology
SELECT T1.molecule_id FROM `bond` AS T1 WHERE T1.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT atom.element)  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id  WHERE connected.bond_id = 'TR001_3_4'	toxicology
SELECT T3.bond_type  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T1.bond_id = T3.bond_id  WHERE T2.atom_id = 'TR000_1' OR T2.atom_id = 'TR000_2'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR000_2' OR T2.atom_id2 = 'TR000_2' AND T2.atom_id = 'TR000_4' OR T2.atom_id2 = 'TR000_4'	toxicology
SELECT `element` FROM `atom` WHERE `atom_id` = 'TR000_1'	toxicology
SELECT T1.label  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T1.molecule_id = 'TR000';	toxicology
SELECT      (SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) / COUNT(b.bond_id)) * 100 AS percentage_single_bond FROM      bond b JOIN      atom a ON a.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IS NOT NULL AND EXISTS (SELECT 1 FROM bond WHERE bond_id = b.bond_id)) JOIN      molecule m ON m.molecule_id = a.molecule_id JOIN      connected c ON c.bond_id = b.bond_id	toxicology
SELECT COUNT(*)  FROM molecule  JOIN atom ON molecule.molecule_id = atom.molecule_id  WHERE atom.element = 'N' AND molecule.label LIKE '+';	toxicology
SELECT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T4 ON T2.bond_id = T4.bond_id JOIN molecule AS T3 ON T3.molecule_id = T1.molecule_id WHERE T1.element = 'S' AND T4.bond_type = '=='	toxicology
SELECT `molecule.molecule_id` FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` GROUP BY `molecule.molecule_id` HAVING COUNT(`atom.atom_id`) > 5 AND `molecule.label` = '-'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id JOIN molecule AS T4 ON T4.molecule_id = T1.molecule_id WHERE T4.molecule_id = 'TR024' AND T3.bond_type = '='	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY COUNT(a.atom_id) DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(T2.molecule_id)) AS percentage FROM      atom AS T1 JOIN      molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN      bond AS T3 ON T1.bond_id = T3.bond_id WHERE      T1.element = 'H' AND T3.bond_type = '#'	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+'	toxicology
SELECT COUNT(DISTINCT mol.molecule_id)  FROM molecule mol  JOIN bond bd ON mol.molecule_id = bd.molecule_id  WHERE mol.molecule_id BETWEEN 'TR004' AND 'TR010' AND bd.bond_type = '-'	toxicology
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR008' AND atom.element = 'C'	toxicology
SELECT T1.element  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T4 ON T3.bond_id = T4.bond_id  WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'  LIMIT 1;	toxicology
SELECT COUNT(DISTINCT mol.molecule_id)  FROM molecule mol  JOIN bond b ON mol.molecule_id = b.molecule_id  JOIN atom a1 ON b.bond_id = a1.bond_id  JOIN atom a2 ON b.bond_id = a2.bond_id  WHERE a1.element = 'O' AND a2.element = 'O' AND b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT mol.molecule_id)  FROM molecule AS mol JOIN bond AS bd ON mol.molecule_id = bd.molecule_id WHERE bd.bond_type = '#' AND mol.label = '-'	toxicology
SELECT T3.element, T4.bond_type  FROM molecule AS T1  JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id  JOIN connected AS T2 ON T3.atom_id = T2.atom_id  JOIN bond AS T4 ON T2.bond_id = T4.bond_id  WHERE T1.molecule_id = 'TR016'	toxicology
SELECT T3.atom_id FROM `molecule` AS T1  JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id  JOIN `atom` AS T3 ON T3.molecule_id = T2.molecule_id  WHERE T1.molecule_id = 'TR012' AND T2.bond_id IN (SELECT bond_id FROM `bond` WHERE bond_type = '==') AND T3.element = 'C'	toxicology
SELECT T1.atom_id  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T4 ON T3.bond_id = T4.bond_id  WHERE T2.label = '+' AND T1.element = 'O' AND T4.bond_type = 'cancerous'	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT c.name FROM cards c WHERE c.borderColor = 'borderless' AND c.cardKingdomFoilId IS NULL AND c.cardKingdomId IS NULL	card_games
SELECT name  FROM cards  WHERE faceConvertedManaCost > convertedManaCost;	card_games
SELECT name FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'EDHREC' AND legalities.status < 100 AND cards.frameVersion = '2015'	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT T1.uuid, T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Artifact' AND T1.side IS NULL AND T2.format = 'vintage'	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power LIKE '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.name, c.text, r.date, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Sublime Epiphany' AND number = '74s')	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.isPromo = 1 GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1;	card_games
SELECT T1.language  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T2.name = 'Annul' AND T2.number = '29'	card_games
SELECT T1.name FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese' AND T2.type = 'card'	card_games
SELECT      (SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.id)) AS percentage FROM      cards AS T1 JOIN      foreign_data AS T2 ON T1.uuid = T2.uuid	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Italian' ORDER BY s.name;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor\'s Chosen';	card_games
SELECT `type` FROM `cards` WHERE `name` = 'Ancestor\'s Chosen' AND `originalType` IS NOT NULL;	card_games
SELECT DISTINCT T3.language  FROM cards AS T1  JOIN set_translations AS T2 ON T1.setCode = T2.setCode AND T2.language IN ('English', 'French', 'German', 'Italian', 'Spanish', 'Portuguese') JOIN sets AS T3 ON T3.code = T1.setCode WHERE T1.name = 'Angel of Mercy'	card_games
SELECT COUNT(*)  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT T3.text FROM cards AS T1 INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T1.name = 'Condemn'	card_games
SELECT COUNT(*)  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE legalities.status = 'restricted' AND cards.isStarter = 1	card_games
SELECT T3.status FROM cards AS T1 JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T1.name = 'Cloudchaser Eagle'	card_games
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight';	card_games
SELECT T2.date, T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight' AND T2.format IS NOT NULL	card_games
SELECT artist FROM cards WHERE name = 'Phyrexian';	card_games
SELECT CAST(SUM(CASE WHEN `borderColor` = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`borderColor`) FROM `cards`;	card_games
SELECT COUNT(*)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'German' AND c.isReprint = 1	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' AND T1.isStorySpotlight = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black' AND availability = 'mtgo'	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT `cards`.layout FROM `cards` WHERE `cards`.keywords LIKE '%flying%'	card_games
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel' AND SUBSTR(subtypes, 1, INSTR(subtypes, ',')-1) NOT LIKE '%Angel%'	card_games
SELECT `cards`.id  FROM `cards`  JOIN `foreign_data` ON `cards`.uuid = `foreign_data`.uuid  WHERE `cards`.cardKingdomFoilId IS NOT NULL AND `cards`.cardKingdomId IS NOT NULL AND `foreign_data`.type = 'powerful'	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT artist FROM cards WHERE language = 'Chinese Simplified' AND name LIKE '%中文%';	card_games
SELECT c.uuid FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese'	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.format = 'All Formats' AND legalities.status = 'Banned' AND cards.borderColor = 'white'	card_games
SELECT T1.uuid, T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name LIKE '%Legacy%' OR T1.name LIKE '%legacy%' AND T2.language <> 'English'	card_games
SELECT text FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Beacon of Immortality')	card_games
SELECT COUNT(*) AS num_future_cards, legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' AND legalities.status = 'legal'	card_games
SELECT c.name, c.colors  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.setCode = 'OGW'	card_games
SELECT T2.name, T3.translation  FROM cards AS T1  JOIN set_translations AS T3 ON T3.setCode = T1.setCode AND T3.language IN ('English', 'French', 'German', 'Spanish', 'Italian', 'Portuguese', 'Chinese')  JOIN legalities AS T2 ON T2.uuid = T1.uuid  WHERE T1.setCode = '10E' AND T1.convertedManaCost = 5	card_games
SELECT T1.name, T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf';	card_games
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20	card_games
SELECT c.* FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.colors = 'B' AND c.type = 'Artifact' AND fd.language <> 'EN'	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon' AND (cardKingdomFoilId IS NOT NULL OR cardKingdomId IS NOT NULL);	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND        cardKingdomFoilId = cardKingdomId AND        cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'  AND availability = 'mtgo'  AND hand = -1	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT c.manaCost  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.layout = 'normal'  AND c.frameVersion = '2003'  AND c.borderColor = 'black'  AND c.availability LIKE 'paper%'  AND c.availability LIKE 'mtgo%'	card_games
SELECT SUM(STRFTIME('%f', manaCost) / 1000000) AS total_unconverted_mana FROM cards WHERE artist = 'Rob Alexander'	card_games
SELECT DISTINCT      CASE          WHEN `subtypes` IS NOT NULL THEN `subtypes`         WHEN `supertypes` IS NOT NULL THEN `supertypes`     END AS Card_Type FROM `cards` WHERE `availability` = 'arena'	card_games
SELECT T2.setCode FROM `foreign_data` AS T1 JOIN sets AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Spanish'	card_games
SELECT      CAST(SUM(CASE WHEN T1.hand = '+3' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id)  FROM      cards AS T1  JOIN      legalities AS T2  ON      T1.uuid = T2.uuid  WHERE      T1.frameEffects = 'legendary';	card_games
SELECT c.id  FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'Story Spotlight' AND c.isTextless = 1	card_games
SELECT      c.name,     (COUNT(f.id) / (SELECT COUNT(*) FROM cards c2 WHERE c2.language = 'Spanish') * 100) AS percentage_in_spanish FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      f.language = 'Spanish' GROUP BY      c.name ORDER BY      percentage_in_spanish DESC;	card_games
SELECT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T1.baseSetSize = 309	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)' AND set_translations.translation = 'Português (Brasil)'	card_games
SELECT c.* FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%' AND l.status = 'legal'	card_games
SELECT DISTINCT      c.types, c.supertypes, c.subtypes  FROM      cards c  JOIN      foreign_data fd ON c.uuid = fd.uuid  WHERE      fd.language = 'German' AND      (c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL)	card_games
SELECT COUNT(*)  FROM cards  WHERE power IS NULL AND (power = '' OR power LIKE '%*%')	card_games
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'premodern'  AND c.faceName IS NULL  AND c.rarity != 'basic'  AND c.rarity != 'token'  AND (SELECT COUNT(*) FROM foreign_data fd WHERE fd.uuid = c.uuid) = 1  AND (SELECT COUNT(*) FROM rulings r WHERE r.uuid = c.uuid AND text = 'This is a triggered mana ability') > 0;	card_games
SELECT c.id  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper'	card_games
SELECT artist FROM cards WHERE text = "Das perfekte Gegenmittel zu einer dichten Formation";	card_games
SELECT ffl.name FROM `foreign_data` ffl JOIN cards c ON ffl.uuid = c.uuid WHERE c.language = 'French' AND c.type = 'Creature' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson' AND c.layout = 'normal'	card_games
SELECT COUNT(*)  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.rarity = 'rare' AND date = '2009-01-10';	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica' AND T1.baseSetSize = 180;	card_games
SELECT      CAST(SUM(CASE WHEN c.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id)  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  WHERE      l.format = 'commander' AND l.status = 'legal';	card_games
SELECT      CAST(SUM(CASE WHEN T1.language = 'French' AND (T1.power IS NULL OR T1.power = '*') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      cards AS T1 JOIN      foreign_data AS T2 ON T1.uuid = T2.uuid WHERE      T1.power IN ('*', NULL);	card_games
SELECT      CAST(SUM(CASE WHEN s.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.type)  FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Japanese';	card_games
SELECT `availability` FROM `cards` WHERE `artist` = 'Daren Bader'	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT T1.name  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T2.uuid = T3.uuid  WHERE T1.power IS NULL OR T1.power = '*'  AND T1.promoTypes = 'arenaleague'  AND T3.type = 'promotional'  ORDER BY T1.name  LIMIT 3;	card_games
SELECT T2.language FROM `foreign_data` AS T1 INNER JOIN `cards` AS T2 ON T1.uuid = T2.uuid WHERE T2.multiverseId = 149934;	card_games
SELECT c1.id AS kingdom_foil_id, c2.id AS kingdom_card_id FROM cards c1 JOIN cards c2 ON c1.name = c2.faceName WHERE c1.cardKingdomFoilId IS NOT NULL AND c2.cardKingdomId IS NOT NULL ORDER BY c1.cardKingdomFoilId LIMIT 3;	card_games
SELECT      CAST(SUM(CASE WHEN c.isTextless = 1 AND c.layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      cards c	card_games
SELECT c.number  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.subtypes LIKE '%Angel%'  AND c.subtypes LIKE '%Wizard%'  AND c.side IS NULL  AND c.variations IS NULL;	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT T2.language FROM `sets` AS T1 INNER JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.setCode = 'ARC';	card_games
SELECT T1.name, T2.translation FROM `sets` AS T1 INNER JOIN `set_translations` AS T2 ON T1.id = T2.setCode WHERE T1.id = 5	card_games
SELECT `language`, `type` FROM `sets` WHERE `id` = 206	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Italian' WHERE s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id FROM sets s WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND EXISTS (     SELECT 1     FROM foreign_data fd     WHERE fd.language = 'Japanese' AND fd.uuid = s.uuid )	card_games
SELECT T1.setCode FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'	card_games
SELECT COUNT(*)  FROM sets  WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '')	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.borderColor = 'black' AND c.isFullArt = 1;	card_games
SELECT `translation` FROM `set_translations` WHERE `setCode` = '174'	card_games
SELECT s.name FROM sets s WHERE s.setCode = 'ALL';	card_games
SELECT T2.language  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13'	card_games
SELECT s.baseSetSize, s.setCode  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'en' AND st.translation IN ('Masques', 'Mirage')	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion' AND `isFoilOnly` = 0 AND `isForeignOnly` = 0 AND `isNonFoilOnly` = 0 AND `isOnlineOnly` = 0;	card_games
SELECT T2.name, T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'boros'	card_games
SELECT T2.language, T2.flavorText, T3.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'	card_games
SELECT      CAST(SUM(CASE WHEN c.convertedManaCost = 16 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id)  FROM      cards c JOIN      legalities l ON c.uuid = l.uuid JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Abyssal Horror'	card_games
SELECT code FROM sets WHERE type = 'expansion commander';	card_games
SELECT T2.name, T1.types FROM cards AS T1 JOIN cards AS T2 ON T1.watermark = 'abzan' WHERE T2.uuid = T1.uuid;	card_games
SELECT T2.type FROM `foreign_data` AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'azorius'	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%' AND hand = '+%'	card_games
SELECT name FROM cards WHERE isTextless = 0	card_games
SELECT `convertedManaCost` FROM `cards` WHERE `name` = 'Ancestor`s Chosen' AND `convertedManaCost` IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.isPromo = 1 AND c.side IS NOT NULL;	card_games
SELECT subtypes, supertypes  FROM cards  WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT T1.purchaseUrls FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format LIKE '%Promo%' AND T2.status = 'legal' AND T1.promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'  AND (availability LIKE '%arena%' AND availability LIKE '%mtgo%')	card_games
SELECT MAX(convertedManaCost) AS Max_Cost FROM cards WHERE name = 'Serra Angel' OR name = 'Shrine Keeper';	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3;	card_games
SELECT T2.name FROM `sets` AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor\'s Chosen' AND EXISTS (SELECT * FROM `set_translations` AS T3 WHERE T3.setCode = T1.code AND T3.language = 'Italian')	card_games
SELECT COUNT(*)  FROM set_translations  JOIN sets ON set_translations.setCode = sets.code  JOIN cards ON sets.uuid = cards.uuid  WHERE cards.name = 'Angel of Mercy'	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode AND st.language = 'de' AND st.translation = 'Hauptset Zehnte Edition'	card_games
SELECT EXISTS (     SELECT 1     FROM cards c     JOIN set_translations st ON c.setCode = st.setCode AND st.language = 'Korean'     WHERE c.name = 'Ancestor\'s Chosen' ) AS KoreanVersionExists;	card_games
SELECT COUNT(*)  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  JOIN rulings r ON c.uuid = r.uuid  WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex';	card_games
SELECT SUM(baseSetSize) FROM sets WHERE name = 'Hauptset Zehnte Edition' AND translation = 'Hauptset Zehnte Edition'	card_games
SELECT translation FROM set_translations WHERE setCode = 'Eighth Edition' AND language = 'Simplified Chinese'	card_games
SELECT EXISTS (     SELECT 1     FROM cards c     WHERE c.name = 'Angel of Mercy'     AND EXISTS (         SELECT 1         FROM sets s         WHERE s.name = c.setCode         AND s.mtgoCode IS NOT NULL     ) ) AS appears_online;	card_games
SELECT releaseDate FROM sets WHERE code IN (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen')	card_games
SELECT T2.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Hauptset Zehnte Edition' AND T2.translation = ' Hauptset Zehnte Edition'	card_games
SELECT COUNT(*)  FROM sets  WHERE block = 'Ice Age' AND language = 'Italian';	card_games
SELECT s.id, s.name, s.isForeignOnly  FROM sets s  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10;	card_games
SELECT COUNT(*)  FROM cards  WHERE name = 'Coldsnap' AND borderColor = 'black';	card_games
SELECT name  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap'  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT DISTINCT artist FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Coldsnap' AND cards.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT * FROM cards WHERE setCode = 'Coldsnap' AND number = 4;	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.convertedManaCost > 5 AND cards.power = '*' OR cards.power IS NULL;	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen'	card_games
SELECT T2.language  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL;	card_games
SELECT T2.type FROM `cards` AS T1 INNER JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'	card_games
SELECT T1.text FROM rulings AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.setCode = 'Coldsnap' AND T1.language = 'Italian'	card_games
SELECT T1.name FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T3.code = T1.setCode  WHERE T1.colors IS NOT NULL AND T3.name = 'Coldsnap' AND T2.language = 'Italian'  ORDER BY CAST(REPLACE(T1.manaCost, ' ', '') AS REAL) DESC  LIMIT 1;	card_games
SELECT date FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Reminisce')	card_games
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id)  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  JOIN sets s ON s.code = st.setCode  WHERE s.name = 'Coldsnap'	card_games
SELECT      CAST(SUM(CASE WHEN cards.name = 'Coldsnap' AND cards.cardKingdomFoilId = cards.cardKingdomId AND cards.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(cards.name)  FROM      cards WHERE      cards.name = 'Coldsnap';	card_games
SELECT `code` FROM `sets` WHERE `releaseDate` = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT T1.mcmId FROM sets AS T1 WHERE T1.setCode = 'SS2'	card_games
SELECT T3.mcmName FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode JOIN cards AS T3 ON T3.setCode = T1.code WHERE T1.releaseDate = '2017-06-09' AND T2.language = 'en' AND T2.translation = 'magic card market'	card_games
SELECT `sets`.type FROM `sets` WHERE `sets`.name LIKE '%From the Vault: Lore%' AND `sets`.type IS NOT NULL;	card_games
SELECT `parentCode` FROM `sets` WHERE `name` = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 1;	card_games
SELECT T2.releaseDate FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'en' AND set_translations.translation = 'Rinascita di Alara' AND sets.baseSetSize IS NOT NULL;	card_games
SELECT T2.type FROM `sets` AS T1 INNER JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Huitième édition' AND T2.language = 'French' AND T2.translation = 'Huitième édition'	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'French' WHERE EXISTS (     SELECT * FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE c.name = 'Tendo Ice Bridge' AND fd.type = 'translatedName' )	card_games
SELECT COUNT(*)  FROM `set_translations`  WHERE name = 'Salvat 2011' AND translation IS NOT NULL	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Japanese' JOIN cards c ON c.setCode = s.code AND c.name = 'Fellwar Stone'	card_games
SELECT T1.name FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Journey into Nyx Hero''s Path' ORDER BY T1.convertedManaCost DESC LIMIT 1;	card_games
SELECT `sets`.releaseDate FROM `sets` JOIN `set_translations` ON `sets`.code = `set_translations`.setCode WHERE `set_translations.translation` = 'Ola de frío' AND `sets.name` LIKE '%Ola de frío%'	card_games
SELECT T2.type FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*)  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3	card_games
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setCode = 'Mirrodin'	card_games
SELECT      CAST(SUM(CASE WHEN S.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      sets S  JOIN      set_translations ST ON S.code = ST.setCode  WHERE      ST.language = 'Japanese';	card_games
SELECT      CAST(SUM(CASE WHEN S.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_online_only FROM      sets S JOIN      set_translations ST ON S.code = ST.setCode AND ST.language = 'Portuguese (Brazil)' WHERE      ST.translation = 'Brazil Portuguese';	card_games
SELECT DISTINCT availability  FROM cards  WHERE artist = 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)	card_games
SELECT T1.artist FROM cards AS T1 JOIN (     SELECT MAX(T2.convertedManaCost) AS max_cost     FROM cards AS T2     WHERE T2.side IS NULL ) AS T3 ON T1.id = T3.id WHERE T1.convertedManaCost = T3.max_cost	card_games
SELECT MAX(frameEffects) FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*)  FROM cards  WHERE power IN ('*', NULL) AND hasFoil = 0 AND duelDeck = 'a'	card_games
SELECT `sets`.id FROM `sets` WHERE `sets`.type = 'commander' AND `sets`.totalSetSize = (SELECT MAX(`sets`.totalSetSize) FROM `sets`)	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10;	card_games
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.artist = 'Volkan Baga' AND foreign_data.language = 'French'	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE cards.rarity = 'rare'  AND cards.types = 'Enchantment'  AND cards.name = 'Abundance'  AND legalities.status = 'Legal';	card_games
SELECT T2.format, T1.name FROM legalities AS T1 JOIN sets AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'banned' GROUP BY T1.uuid ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT `translation` FROM `set_translations` WHERE `setCode` = 'Battlebond' AND `language` = 'en'	card_games
SELECT T1.artist, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid GROUP BY T1.artist ORDER BY COUNT(T1.uuid) ASC LIMIT 1;	card_games
SELECT T1.status FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid JOIN rulings AS T3 ON T2.uuid = T3.uuid WHERE T2.frameVersion = '1997' AND T2.artist = 'D. Alexander Gregory' AND T1.format = 'legacy' AND T2.hasContentWarning = 1;	card_games
SELECT T1.name, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'banned'	card_games
SELECT AVG(s.id) AS average_sets_per_year, MAX(COUNT(f.language)) AS common_language FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN foreign_data fd ON s.name = fd.uuid WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31';	card_games
SELECT artist  FROM cards  WHERE BorderColor = 'black' AND availability = 'arena'	card_games
SELECT T1.uuid FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'oldschool' AND (T2.status = 'banned' OR T2.status = 'restricted')	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT T2.text  FROM cards AS T1  JOIN rulings AS T2 ON T1.uuid = T2.uuid  WHERE T1.artist = 'Kev Walker'  ORDER BY T2.date DESC	card_games
SELECT T1.name, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.setCode = 'Hour of Devastation' AND T2.status = 'legal'	card_games
SELECT s.name  FROM sets s JOIN set_translations st ON s.code = st.setCode  WHERE st.language NOT LIKE '%Japanese%' AND st.language = 'Korean'	card_games
SELECT DISTINCT T2.frameVersion, T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'banned';	card_games
SELECT Id FROM users WHERE DisplayName = 'Harlan' OR DisplayName = 'Jarrod Dixon' ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014;	codebase_community
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01 00:00:00';	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1	codebase_community
SELECT COUNT(*)  FROM users  WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie'	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(T2.CommentCount)  FROM comments AS T2  JOIN posts AS T1 ON T2.PostId = T1.Id  WHERE T1.OwnerDisplayName = 'csgillespie'	codebase_community
SELECT MAX(AnswerCount) FROM posts WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT T3.DisplayName  FROM posts AS T1  JOIN postHistory AS T2 ON T1.Id = T2.PostId  JOIN users AS T3 ON T3.Id = T2.LastEditorUserId  WHERE T1.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*)  FROM (     SELECT p.Id      FROM posts p      INNER JOIN users u ON p.OwnerUserId = u.Id      WHERE u.Age > 65 AND p.Score >= 20 ) AS post_scores	codebase_community
SELECT u.Location  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie'	codebase_community
SELECT T3.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  JOIN tags AS T3 ON T3.ExcerptPostId = T1.Id  WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND EXTRACT(YEAR FROM badges.Date) = 2011;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(T2.Score)  FROM users AS T1  JOIN posts AS T2 ON T1.Id = T2.OwnerUserId  WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(T1.Count)  FROM (     SELECT COUNT(T3.Id) AS Count      FROM users AS T1      JOIN badges AS T3 ON T1.Id = T3.UserId      WHERE T1.Views > 200      GROUP BY T1.DisplayName ) AS T2	codebase_community
SELECT CAST(COUNT(CASE WHEN u.Age > 65 THEN p.Id ELSE NULL END) AS REAL) * 100 / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Score > 20	codebase_community
SELECT COUNT(*)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.Id = 58  AND CreationDate = '2010-07-19'	codebase_community
SELECT MAX(T1.CreationDate) FROM votes AS T1 GROUP BY T1.CreationDate ORDER BY COUNT(T1.Id) DESC LIMIT 1	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Revival'	codebase_community
SELECT p.Title FROM posts p JOIN (     SELECT Comment.PostId, MAX(c.Score) AS max_score     FROM comments c     GROUP BY Comment.PostId ) AS cm ON p.Id = cm.PostId WHERE cm.max_score IS NOT NULL;	codebase_community
SELECT COUNT(*)  FROM comments  JOIN posts ON comments.PostId = posts.Id  WHERE posts.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.000'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ParentId = 107829 AND p.CommentCount = 1 LIMIT 1;	codebase_community
SELECT p.Id, p.Title, p.Score, p.ViewCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NULL	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = '65041')	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT T2.DisplayName FROM votes AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = '6347'	codebase_community
SELECT COUNT(*)  FROM posts  JOIN votes ON posts.Id = votes.PostId  WHERE posts.Title LIKE '%data visualization%'	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      COUNT(posts.Id) / COUNT(votes.Id) AS PostToVoteRatio FROM      posts JOIN      users ON posts.OwnerUserId = users.Id WHERE      users.Id = 24;	codebase_community
SELECT ViewCount  FROM posts  WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com'	codebase_community
SELECT T3.Name  FROM users AS T1  JOIN badges AS T3 ON T1.Id = T3.UserId  WHERE T1.DisplayName = 'SilentGhost'	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93'	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'A Lion'	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Text  FROM comments AS c  JOIN posts AS p ON c.PostId = p.Id  WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT `LastEditorDisplayName`  FROM posts  WHERE Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT Title FROM posts WHERE LastEditorUserId = (SELECT Id FROM users WHERE DisplayName = 'Vebjorn Ljosa');	codebase_community
SELECT SUM(p.Score), u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'	codebase_community
SELECT c.Text  FROM comments AS c  JOIN posts AS p ON c.PostId = p.Id  JOIN users AS u ON c.UserId = u.Id  WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND u.DisplayName IS NOT NULL  AND EXISTS (     SELECT 1      FROM posts AS p2      WHERE p2.OwnerUserId = u.Id AND p2.Id = p.ParentId );	codebase_community
SELECT SUM(T3.BountyAmount) AS TotalBountyAmount FROM posts AS T1 JOIN postHistory AS T2 ON T1.Id = T2.PostId JOIN votes AS T3 ON T1.Id = T3.PostId AND T2.PostHistoryTypeId IN (4, 5) -- Assuming type 4 is for bounties set by the owner, and type 5 is for community bounties WHERE T1.Title LIKE '%data%'	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%' AND v.PostId = p.Id	codebase_community
SELECT AVG(p.ViewCount), p.Title, c.Text, p.Score FROM posts p JOIN tags t ON p.Tags LIKE '%humor%' JOIN postLinks pl ON p.Id = pl.PostId JOIN comments c ON p.Id = c.PostId WHERE p.PostTypeId = 1 GROUP BY p.Id ORDER BY AVG(p.ViewCount) DESC;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Supporter' AND Date BETWEEN '2011-01-01 00:00:00' AND '2011-12-31 23:59:59'	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  GROUP BY UserId  HAVING COUNT(Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b1 ON u.Id = b1.UserId  JOIN badges b2 ON u.Id = b2.UserId  WHERE u.Location = 'New York'  AND b1.Name = 'Supporter'  AND b2.Name = 'Teacher'	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN (     SELECT p.OwnerUserId, COUNT(ph.PostId) AS hist_count     FROM posts p     JOIN postHistory ph ON p.Id = ph.PostId     GROUP BY p.OwnerUserId     HAVING COUNT(ph.PostId) = 1 ) AS subq ON u.Id = subq.OwnerUserId WHERE u.Views >= 1000;	codebase_community
SELECT u.DisplayName, b.Name FROM users u JOIN (     SELECT UserId, COUNT(*) AS CommentCount     FROM comments     GROUP BY UserId     HAVING COUNT(*) = (         SELECT MAX(CommentCount)         FROM (             SELECT COUNT(*) AS CommentCount             FROM comments             GROUP BY UserId         ) t1     ) ) c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher'	codebase_community
SELECT      ABS((COUNT(CASE WHEN T1.Date BETWEEN '2010-01-01' AND '2010-12-31' THEN 1 ELSE NULL END) * 100.0 / COUNT(*) -           COUNT(CASE WHEN T1.Date BETWEEN '2011-01-01' AND '2011-12-31' THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS PercentageDifference FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Students'	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId)  FROM postHistory  WHERE PostId = 3720;	codebase_community
SELECT p1.Id, p1.ViewCount  FROM posts p1  JOIN postLinks pl ON p1.Id = pl.PostId  JOIN posts p2 ON pl.RelatedPostId = p2.Id  WHERE p2.Id = 61217  ORDER BY p1.ViewCount DESC;	codebase_community
SELECT Score, LinkTypeId FROM posts WHERE Id = 395;	codebase_community
SELECT p.Id, u.Id  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Score > 60;	codebase_community
SELECT SUM(Tags.FavoriteCount) FROM posts JOIN users ON posts.OwnerUserId = users.Id JOIN tags ON posts.Id = tags.ExcerptPostId WHERE users.Id = 686 AND YEAR(posts.CreationDate) = 2011	codebase_community
SELECT      AVG(T1.UpVotes) AS AverageUpVotes,     AVG(T2.Age) AS AverageAge FROM      votes T1 JOIN      users T2 ON T1.UserId = T2.Id WHERE      T1.VoteTypeId = 2 -- Assuming VoteTypeId 2 represents upvotes GROUP BY      T2.Id HAVING      COUNT(T2.Id) > 10 -- Filtering users who have created more than 10 posts	codebase_community
SELECT COUNT(DISTINCT T1.UserId)  FROM badges AS T1  WHERE T1.Name = 'Announcer'	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08'	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60;	codebase_community
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10	codebase_community
SELECT T3.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id JOIN badges AS T3 ON T1.UserId = T3.UserId AND T1.Date <= T3.Date WHERE T2.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre'	codebase_community
SELECT T3.Date  FROM users AS T1  JOIN badges AS T3 ON T1.Id = T3.UserId  WHERE T1.Location = 'Rochester, NY'	codebase_community
SELECT      CAST(SUM(CASE WHEN T2.Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id)  FROM      users AS T1 JOIN      badges AS T2 ON T1.Id = T2.UserId;	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'	codebase_community
SELECT c.Score  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' AND b.Name = 'YourBadgeNameHere';	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Age BETWEEN 19 AND 65 AND Name = 'Supporter'	codebase_community
SELECT COUNT(*)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T3.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id JOIN badges AS T3 ON T1.UserId = T3.UserId AND T1.Date = (SELECT MIN(Date) FROM badges WHERE UserId = T1.UserId) WHERE T2.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT T1.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Age > 65 AND badges.Name = 'Supporter'	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'New York';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Views = (SELECT MAX(_views) FROM (SELECT MAX(Views) AS _views FROM users) AS subquery)	codebase_community
SELECT      CAST(SUM(CASE WHEN YEAR(v.CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN YEAR(v.CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio_2010_2011 FROM      votes v	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Stauffer'	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(*)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'Harlan'	codebase_community
SELECT Posts.Id FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1;	codebase_community
SELECT      p1.Id AS PostId,     p1.Title AS PostTitle,     p1.ViewCount AS ViewCount FROM      posts p1 JOIN      users u1 ON p1.OwnerUserId = u1.Id WHERE      u1.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ORDER BY      p1.ViewCount DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Matt Parker' AND votes.VoteTypeId IN (2, 3) AND votes.PostId > 4	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId IN (     SELECT Id      FROM users      WHERE DisplayName = 'Neil McGuigan' ) AND Score < 60;	codebase_community
SELECT DISTINCT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT T1.DisplayName FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'	codebase_community
SELECT      CAST((SELECT COUNT(*) FROM posts p JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id WHERE t.TagName = 'r') AS REAL) * 100 / (     SELECT COUNT(*) FROM posts p JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id WHERE t.TagName = 'r' OR p.OwnerDisplayName = 'Community' ) AS Percentage FROM posts JOIN postTags ON posts.Id = postTags.PostId JOIN tags ON postTags.TagId = tags.Id	codebase_community
SELECT      (         (SELECT SUM(posts.ViewCount) FROM posts WHERE posts.OwnerDisplayName = 'Mornington')         -         (SELECT SUM(posts.ViewCount) FROM posts WHERE posts.OwnerDisplayName = 'Amos')     ) AS ViewCountDifference	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT `LastEditDate`, `LastEditorUserId` FROM `posts` WHERE `Title` = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60	codebase_community
SELECT p.Title, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE c.Score > 60	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location LIKE '%North Pole%' AND YEAR(b.Date) = 2011	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(*) AS post_history_count, MAX(`LastEditDate`) AS last_edit_date FROM posts WHERE Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location  FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers'	codebase_community
SELECT p.Title FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.PostId WHERE pl.RelatedPostId IN (     SELECT Id FROM posts WHERE Title LIKE '%How to tell if something happened in a data set which monitors a value over time%' ) AND p.PostTypeId = 1;	codebase_community
SELECT p.Id AS "Post ID", b.Name AS "Badge Name" FROM badges b JOIN users u ON b.UserId = u.Id JOIN posts p ON b.Date = p.CreationDate WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013	codebase_community
SELECT u.DisplayName  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?'	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ParentId IS NOT NULL  AND p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId = p.Id)	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8)	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*)  FROM (     SELECT COUNT(*) AS Count      FROM tags      WHERE Count BETWEEN 5000 AND 7000 ) AS tag_counts;	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM votes  JOIN posts ON votes.PostId = posts.Id  WHERE YEAR(votes.CreationDate) = 2011 AND votes.BountyAmount = 50	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT p.Id, p.Score  FROM posts p  JOIN (     SELECT t.TagName, COUNT(*) AS Count      FROM tags t      JOIN posts_tags pt ON t.Id = pt.TagId      GROUP BY t.TagName      ORDER BY Count DESC      LIMIT 1 ) max_tag_popularity ON p.Id = max_tag_popularity.TagId  WHERE p.Id = max_tag_popularity.Id	codebase_community
SELECT AVG(COUNT(Id))  FROM (     SELECT Id     FROM postLinks     WHERE YEAR(postLinks.CreationDate) = 2010     AND EXISTS (         SELECT 1         FROM posts p         WHERE p.Id = postLinks.PostId         AND p.AnswerCount <= 2     ) ) AS subquery	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON u.Id = v.UserId WHERE u.Id = 1465 AND p.FavoriteCount = (     SELECT MAX(q.FavoriteCount)     FROM posts q     JOIN votes vq ON q.Id = vq.PostId     WHERE vq.UserId = 1465 )	codebase_community
SELECT Title FROM posts JOIN postLinks ON posts.Id = postLinks.PostId WHERE postLinks.CreationDate = (SELECT MIN(CreationDate) FROM postLinks) LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(votes.CreationDate)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'chl'	codebase_community
SELECT MIN(T1.CreationDate)  FROM posts AS T1  JOIN users AS T2 ON T1.OwnerUserId = T2.Id  WHERE T2.Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE users.Location = 'United Kingdom' AND posts.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Jay Stevens' AND YEAR(posts.CreationDate) = 2010	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title  FROM posts p  WHERE p.Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(T2.Score)  FROM users AS T1  JOIN posts AS T2 ON T1.Id = T2.OwnerUserId  WHERE T1.DisplayName = 'Stephen Turner'	codebase_community
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount > 20000 AND T1.CreationDate BETWEEN '2011-01-01' AND '2011-12-31'	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.CreationDate BETWEEN '2010-01-01' AND '2010-12-31' ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN p.CreationDate BETWEEN '2011-01-01' AND '2011-12-31' AND u.Reputation > 1000 THEN p.Id ELSE NULL END)      / CAST(COUNT(p.Id) AS REAL)) * 100 AS Percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.CreationDate BETWEEN '2011-01-01' AND '2011-12-31'	codebase_community
SELECT      CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 AS percentage FROM      users	codebase_community
SELECT u.DisplayName, p.ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets' AND p.OwnerUserId = (     SELECT OwnerUserId     FROM posts     WHERE Title = 'Computer Game Datasets'     ORDER BY LastActivityDate DESC     LIMIT 1 );	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT b.Name, b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65  AND UpVotes > 5000;	codebase_community
SELECT      (SELECT Date FROM badges WHERE Name = 'your_badge_name' AND UserId = (SELECT Id FROM users WHERE DisplayName = 'Zolomon')) -      (SELECT CreationDate FROM users WHERE DisplayName = 'Zolomon')	codebase_community
SELECT COUNT(*) AS num_posts, COUNT(*) AS num_comments FROM (     SELECT u.Id, p.Id AS post_id, c.Id AS comment_id     FROM users u     JOIN posts p ON u.Id = p.OwnerUserId     JOIN comments c ON u.Id = c.UserId     WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) ) AS subquery;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT T2.UserId)  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T1.Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(*)  FROM posts  JOIN postTags ON posts.Id = postTags.PostId  JOIN tags ON postTags.TagId = tags.Id  WHERE tags.TagName = 'careers'	codebase_community
SELECT u.Reputation, p.ViewCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(*) AS TotalComments, SUM(CASE WHEN p.PostTypeId = 2 THEN 1 ELSE 0 END) AS TotalAnswers FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Clustering 1D data'	codebase_community
SELECT `CreationDate` FROM `users` WHERE `DisplayName` = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT      CAST(SUM(CASE WHEN p.Score >= 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (         SELECT              MAX(Reputation)          FROM              users     )	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT u.Reputation, u.UpVotes  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT c.Text  FROM comments AS c  JOIN posts AS p ON c.PostId = p.Id  WHERE p.Title = 'How can I adapt ANOVA for binary data?' AND c.Text LIKE '%linear regression%'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(*)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score = 0 AND p.ViewCount < 5	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CommentCount = 1  AND EXISTS (     SELECT 1      FROM comments      WHERE comments.PostId = posts.Id      AND Score = 0 )	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS postId, c.Text AS commentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT COUNT(*) AS up_vote_number FROM comments WHERE Text = 'R is also lazy evaluated.' AND UserId IN (     SELECT DISTINCT u.Id     FROM users u     JOIN votes v ON u.Id = v.UserId     WHERE v.VoteTypeId = 2 -- Assuming 2 is the type ID for upvotes )	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT DISTINCT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      CAST(COUNT(CASE WHEN u.UpVotes = 0 AND c.Score BETWEEN 5 AND 10 THEN c.UserId ELSE NULL END) AS REAL) * 100 / COUNT(c.UserId) AS Percentage FROM      comments c JOIN      users u ON c.UserId = u.Id WHERE      c.Score BETWEEN 5 AND 10;	codebase_community
SELECT T3.power_name FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(*)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT T1.full_name  FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  GROUP BY T1.id  HAVING COUNT(T3.id) > 15;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.skin_colour_id WHERE s.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN superpower p ON s.id = ANY (SELECT hp.hero_id FROM hero_power hp WHERE hp.power_id = (SELECT id FROM superpower WHERE power_name = 'Agility'))) WHERE c.colour = 'Blue';	superhero
SELECT s.superhero_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON ha.attribute_value = c.id AND c.colour = 'Blue' JOIN hero_attribute ha2 ON s.id = ha2.hero_id JOIN attribute a2 ON ha2.attribute_id = a2.id JOIN colour c2 ON ha2.attribute_value = c2.id AND c2.colour = 'Blond'	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'	superhero
SELECT full_name  FROM superhero  WHERE publisher_id IN (     SELECT id      FROM publisher      WHERE publisher_name = 'Marvel Comics')  ORDER BY height_cm DESC  LIMIT 1;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron'	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics' AND colour.colour = 'Blue'	superhero
SELECT AVG(T.superhero.alignment_id) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'	superhero
SELECT      (SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.id)) AS percentage FROM      superhero s JOIN      hero_power hp ON s.id = hp.hero_id JOIN      superpower sp ON hp.power_id = sp.id JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics' AND      sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'DC Comics';	superhero
SELECT T.publisher_name FROM (     SELECT S.publisher_id, P.publisher_name, H.attribute_value, A.attribute_name     FROM superhero AS H     JOIN attribute AS A ON H.alignment_id = A.id     JOIN publisher AS P ON H.publisher_id = P.id     WHERE A.attribute_name = 'Speed'     ORDER BY H.attribute_value ASC     LIMIT 1 ) AS T;	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE publisher.publisher_name = 'Marvel Comics' AND colour.colour = 'Gold'	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id IN (     SELECT a.id FROM attribute a     WHERE a.attribute_name = 'Intelligence' ) ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT race.race  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'Copycat';	superhero
SELECT COUNT(*)  FROM hero_attribute  WHERE attribute_id IN (     SELECT id      FROM attribute      WHERE attribute_name = 'Durability' ) AND attribute_value < 50;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch'	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND hero_attribute.attribute_value = 100;	superhero
SELECT T.superhero_name  FROM (     SELECT T.superhero_id, COUNT(T.power_id) AS power_count      FROM superhero AS S      JOIN hero_power AS HP ON S.id = HP.hero_id      GROUP BY T.superhero_id      ORDER BY power_count DESC      LIMIT 1 ) AS T  JOIN superhero AS S ON T.superhero_id = S.id	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Vampire'	superhero
SELECT      CAST(COUNT(CASE WHEN T.superhero.alignment = 'Bad' THEN T.superhero.id ELSE NULL END) AS REAL) * 100 / COUNT(T.superhero.id) AS percentage,     SUM(CASE WHEN T.publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS marvel_count FROM superhero AS T JOIN alignment ON T.alignment_id = alignment.id JOIN publisher ON T.publisher_id = publisher.id	superhero
SELECT ABS(     (         (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (             SELECT id FROM publisher WHERE publisher_name = 'DC Comics'         ))         -         (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (             SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'         ))     ) ) AS difference;	superhero
SELECT publisher_id FROM superhero WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(T2.attribute_value)  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.id = 75;	superhero
SELECT T3.power_name FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T1.superhero_name = 'Deathlok';	superhero
SELECT AVG(T.superhero_id.weight_kg)  FROM superhero AS T  JOIN gender ON T.gender_id = gender.id  WHERE gender.gender = 'female'	superhero
SELECT sp.power_name  FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero h ON hp.hero_id = h.id JOIN gender g ON h.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race = 'Alien'	superhero
SELECT s.superhero_name  FROM superhero s  WHERE s.height_cm BETWEEN 170 AND 190  AND s.eye_colour_id = 1;	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56;	superhero
SELECT full_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Demi-God'  LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 'Bad';	superhero
SELECT T1.race  FROM race AS T1  JOIN superhero AS T2 ON T1.id = T2.race_id  WHERE T2.weight_kg = 169;	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.hair_colour_id  JOIN alignment a ON s.alignment_id = a.id  WHERE s.height_cm = 185 AND s.race = 'human';	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      (COUNT(CASE WHEN s.height_cm BETWEEN 150 AND 180 THEN s.id ELSE NULL END)      * 100.0 / COUNT(s.id)) AS percentage FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics'	superhero
SELECT full_name  FROM superhero  WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'male')  AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT power_name  FROM superpower  JOIN hero_power ON superpower.id = hero_power.power_id  GROUP BY power_name  ORDER BY COUNT(*) DESC  LIMIT 1;	superhero
SELECT T1.attribute_value  FROM hero_attribute AS T1  JOIN superhero AS T2 ON T1.hero_id = T2.id  WHERE T2.superhero_name = 'Abomination'	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.id = 1;	superhero
SELECT COUNT(*)  FROM hero_power  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'stealth';	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_id IN (SELECT T3.id FROM attribute AS T3 WHERE T3.attribute_name = 'strength') ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT AVG(NULLIF(s.skin_colour_id, 0)) AS avg_superheroes_no_skin_colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.id = 1	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id IN    (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'durability' AND s.publisher_id IN (     SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics' ) GROUP BY s.id ORDER BY MAX(ha.attribute_value) DESC LIMIT 1;	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.full_name = 'Abraham Sapien'	superhero
SELECT DISTINCT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight'	superhero
SELECT      c.colour AS Eye_Colour,     d.colour AS Hair_Colour,     e.colour AS Skin_Colour FROM      superhero s JOIN      gender g ON s.gender_id = g.id JOIN      colour c ON s.eye_colour_id = c.id JOIN      colour d ON s.hair_colour_id = d.id JOIN      colour e ON s.skin_colour_id = e.id JOIN      publisher p ON s.publisher_id = p.id WHERE      g.gender = 'Female' AND     p.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name, p.publisher_name  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN colour h ON s.hair_colour_id = h.id  JOIN colour sk ON s.skin_colour_id = sk.id  JOIN publisher p ON s.publisher_id = p.id  WHERE c.id = h.id AND h.id = sk.id;	superhero
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb'	superhero
SELECT      (SUM(CASE WHEN colour.id = (SELECT id FROM colour WHERE colour = 'Blue') AND gender.id = (SELECT id FROM gender WHERE gender = 'Female') THEN 1 ELSE 0 END)      * 100.0 / COUNT(CASE WHEN gender.id = (SELECT id FROM gender WHERE gender = 'Female') THEN 1 ELSE 0 END)) AS percentage FROM      superhero JOIN      colour ON superhero.skin_colour_id = colour.id JOIN      gender ON superhero.gender_id = gender.id;	superhero
SELECT superhero_name, race  FROM superhero  WHERE full_name = 'Charles Chandler'	superhero
SELECT gender FROM superhero WHERE superhero_name = 'Agent 13';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM hero_power  WHERE hero_id IN (     SELECT id      FROM superhero      WHERE superhero_name = 'Amazo' )	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON ha.attribute_value = c.id WHERE c.colour = 'Black' AND s.eye_colour_id = c.id AND s.hair_colour_id = c.id;	superhero
SELECT T1.eye_colour_id FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'	superhero
SELECT `full_name`  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.`race` = 'Vampire'	superhero
SELECT superhero_name  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Neutral'	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_attribute WHERE attribute_name = 'Strength' AND attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute     WHERE attribute_name = 'Strength' );	superhero
SELECT T1.race, T1.alignment FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Cameron Hicks'	superhero
SELECT      CAST(SUM(CASE WHEN T.superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND T.superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T.superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE 0 END) AS FemaleHeroPercentage FROM      superhero AS T JOIN      hero_attribute AS H ON T.id = H.hero_id JOIN      attribute AS A ON H.attribute_id = A.id WHERE      A.attribute_name = 'Gender'     AND T.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT AVG(superhero.weight_kg)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Alien'	superhero
SELECT      (SUM(CASE WHEN superhero_name = 'Emil Blonsky' THEN weight_kg ELSE 0 END) -       SUM(CASE WHEN superhero_name = 'Charles Chandler' THEN weight_kg ELSE 0 END)) AS weight_difference FROM      superhero;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T3 ON T1.id = T3.hero_id JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  JOIN gender ON superhero.gender_id = gender.id  WHERE race.id = 21 AND gender.id = 1	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Speed' ORDER BY hero_power.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 3;	superhero
SELECT T1.attribute_name, T2.attribute_value  FROM attribute AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id  JOIN superhero AS T3 ON T3.id = T2.hero_id  WHERE T3.superhero_name = '3-D Man'  AND T1.attribute_name IN ('height_cm', 'weight_kg')	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON ha.attribute_id = c.id WHERE c.colour = 'blue' AND a.attribute_name = 'Eye Colour' AND a.id = s.eye_colour_id AND EXISTS (     SELECT 1     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     JOIN colour c2 ON ha2.attribute_id = c2.id     WHERE ha2.hero_id = s.id AND a2.attribute_name = 'Hair Colour' AND c2.colour = 'brown' AND a2.id = s.hair_colour_id )	superhero
SELECT T.publisher_name FROM (     SELECT T.superhero_id, T.publisher_id     FROM superhero AS T     WHERE T.superhero_name = 'Hawkman' OR T.superhero_name = 'Karate Kid' OR T.superhero_name = 'Speedy' ) AS T JOIN publisher ON T.publisher_id = publisher.id;	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      CAST(SUM(CASE WHEN t1.eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(t1.id)  FROM      superhero t1	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT power_id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT T4.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T1.race  FROM race AS T1  JOIN superhero AS T2 ON T1.id = T2.race_id  WHERE T2.weight_kg = 108 AND T2.height_cm = 188;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38;	superhero
SELECT T3.race FROM (     SELECT hero_id, MAX(attribute_value) AS max_value     FROM hero_attribute     GROUP BY hero_id ) AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN race AS T3 ON T2.race_id = T3.id WHERE T1.max_value = (     SELECT MAX(attribute_value)     FROM hero_attribute )	superhero
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name  FROM superhero s JOIN attribute_value a ON s.eye_colour_id = a.attribute_id JOIN attribute a2 ON a.attribute_id = a2.id JOIN colour c ON a2.id = c.id WHERE c.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(T1.attribute_value)  FROM hero_attribute AS T1  JOIN superhero AS T2 ON T1.hero_id = T2.id  JOIN alignment AS T3 ON T2.alignment_id = T3.id  WHERE T3.alignment = 'neutral'	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.skin_colour_id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = 100	superhero
SELECT COUNT(*)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.id = 1 AND gender.id = 2;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80;	superhero
SELECT T1.race  FROM superhero AS T1  JOIN colour AS T2 ON T1.hair_colour_id = T2.id  JOIN gender AS T3 ON T1.gender_id = T3.id  WHERE T2.colour = 'blue' AND T3.gender = 'male';	superhero
SELECT      CAST(SUM(CASE WHEN S.gender.id = 2 AND S.alignment.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN S.alignment.id = 2 THEN 1 END)  FROM      superhero S JOIN      gender G ON S.gender_id = G.id JOIN      alignment A ON S.alignment_id = A.id WHERE      A.id = 2;	superhero
SELECT      COUNT(T2.id) - COUNT(T4.id) AS difference FROM      superhero AS T1 JOIN      colour AS T2 ON T1.eye_colour_id = T2.id JOIN      attribute AS T3 ON T3.id = 7 JOIN      colour AS T4 ON T4.id = 1 WHERE      T1.weight_kg = 0 OR T1.weight_kg IS NULL AND      (T2.id = 7 AND T3.id = T2.id) OR (T2.id = 1 AND T3.id = T4.id)	superhero
SELECT attribute_value  FROM hero_attribute  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute_name = 'Strength' AND superhero_name = 'Hulk'	superhero
SELECT sp.power_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  WHERE colour.colour = 'Green' AND superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.gender_id IN (SELECT id FROM gender WHERE gender = 'Female')  AND publisher.publisher_name = 'Marvel Comics'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Wind Control' ORDER BY s.superhero_name;	superhero
SELECT T1.gender FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Phoenix Force'	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(T.superhero_name) AS average_height FROM superhero T JOIN publisher P ON T.publisher_id = P.id WHERE T.race <> 'Human' AND P.publisher_name = 'Dark Horse Comics'	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = 100;	superhero
SELECT      (         (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (             SELECT id FROM publisher WHERE publisher_name = 'DC Comics'         ))         -         (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (             SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'         ))     ) AS difference	superhero
SELECT T3.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' AND T2.attribute_value = (     SELECT MIN(attribute_value)     FROM hero_attribute     WHERE hero_id = (         SELECT id         FROM superhero         WHERE superhero_name = 'Black Panther'     ) )	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      (SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PercentageOfFemaleSuperheroes FROM      superhero JOIN      publisher ON superhero.publisher_id = publisher.id WHERE      publisher.publisher_name = 'George Lucas'	superhero
SELECT      (SUM(CASE WHEN T.superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND T.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Good')) * 100.0 / COUNT(T.superhero_id)) AS percentage_good_superheroes FROM      superhero T JOIN      alignment A ON T.alignment_id = A.id WHERE      T.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT T1.full_name  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  JOIN attribute AS T3 ON T2.attribute_id = T3.id  JOIN colour AS T4 ON T2.attribute_id = T4.id  WHERE T1.weight_kg < 100 AND T4.colour = 'brown' AND T3.attribute_name = 'eye_colour'	superhero
SELECT T1.attribute_value FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Aquababy'	superhero
SELECT `superhero`.weight_kg, `race`.race FROM `superhero` JOIN `race` ON `superhero`.race_id = `race`.id WHERE `superhero`.id = 40;	superhero
SELECT AVG(T.superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'neutral')) * T.height_cm FROM superhero AS T JOIN alignment ON T.alignment_id = alignment.id GROUP BY T.alignment_id HAVING T.alignment_id = (SELECT id FROM alignment WHERE alignment = 'neutral')	superhero
SELECT superhero.id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence';	superhero
SELECT c.colour  FROM colour AS c  JOIN superhero AS s ON c.id = s.eye_colour_id  WHERE s.superhero_name = 'Blackwulf'	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT T2.driverRef  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  JOIN qualifying AS T3 ON T2.driverId = T3.driverId AND T1.raceId = T3.raceId  WHERE T1.raceId = 18 AND T3.number <= 5 AND T3.q1 IS NOT NULL	formula_1
SELECT T3.surname  FROM results AS T1  JOIN drivers AS T3 ON T1.driverId = T3.driverId  JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T1.position = 1 AND T2.raceId = 19 AND T2.date > (SELECT MAX(date) FROM races WHERE raceId < 19) AND T1.fastestLapTime = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)	formula_1
SELECT DISTINCT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.location = 'Shanghai' AND T1.name = 'Shanghai'	formula_1
SELECT `url` FROM `races` WHERE `name` = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Germany'	formula_1
SELECT T1.name FROM circuits AS T1 JOIN constructorResults AS T2 ON T1.circuitId = T2.raceId JOIN races AS T3 ON T2.raceId = T3.raceId JOIN results AS T4 ON T4.raceId = T3.raceId JOIN constructors AS T5 ON T5.constructorId = T4.constructorId WHERE T5.name = 'Renault'	formula_1
SELECT COUNT(*)  FROM races  WHERE year = 2010  AND name LIKE '%Grand Prix%'  AND location NOT LIKE '%Asia%'  AND location NOT LIKE '%Europe%'	formula_1
SELECT T2.name  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  WHERE T1.country = 'Spain'	formula_1
SELECT location, lat, lng FROM circuits WHERE name = 'Australian Grand Prix'	formula_1
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT races.time  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Sepang International Circuit'	formula_1
SELECT T1.lat, T1.lng  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  WHERE T2.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T3.country  FROM constructorStandings AS T1  JOIN constructors AS T2 ON T1.constructorId = T2.constructorId  JOIN races AS T4 ON T1.raceId = T4.raceId  WHERE T4.round = 24 AND T1.points = 1	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Senna') AND raceId = 354 AND number = 354;	formula_1
SELECT T3.nationality  FROM qualifying AS T1  JOIN drivers AS T3 ON T1.driverId = T3.driverId  WHERE T1.number = 355 AND T1.q2 = '0:01:40'	formula_1
SELECT T1.number  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN qualifying AS T3 ON T2.raceId = T3.raceId AND T2.driverId = T3.driverId  WHERE T3.number = 903 AND T2.time = '0:01:54' AND T2.position = 3	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007 ) AND statusId != (SELECT statusId FROM status WHERE status = 'Did Not Finish')	formula_1
SELECT T2.url FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE year = 2015 AND date = '2015-11-29' )	formula_1
SELECT T1.surname, T1.forename  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T2.raceId = 592 AND T2.time IS NOT NULL  ORDER BY T1.dob ASC  LIMIT 1;	formula_1
SELECT T2.forename, T2.surname, T2.url FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.lap = 161 AND T1.time = "0:01:27"	formula_1
SELECT T3.nationality  FROM results AS T1  JOIN drivers AS T3 ON T1.driverId = T3.driverId  WHERE T1.raceId = 933 AND T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933)	formula_1
SELECT location, lat, lng  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.name = 'Malaysian Grand Prix'	formula_1
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT q1 FROM qualifying WHERE driverId IN (SELECT driverId FROM drivers WHERE surname = 'di Grassi' AND forename = 'Lucas') AND raceId = 345;	formula_1
SELECT T3.nationality  FROM races AS T1  JOIN qualifying AS T2 ON T1.raceId = T2.raceId  JOIN drivers AS T3 ON T2.driverId = T3.driverId  WHERE T1.raceId = 347 AND T2.q2 = '0:01:15'	formula_1
SELECT T2.code  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  JOIN qualifying AS T3 ON T2.driverId = T3.driverId AND T1.raceId = T3.raceId  WHERE T1.raceId = 45 AND T3.q3 = '01:33'  LIMIT 1	formula_1
SELECT `time` FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'McLaren' AND forename = 'Bruce') AND raceId = 743;	formula_1
SELECT      d.forename, d.surname  FROM      drivers d  JOIN      results r ON d.driverId = r.driverId  JOIN      races rs ON r.raceId = rs.raceId  WHERE      rs.name = 'San Marino Grand Prix' AND      rs.year = 2006 AND      r.position = 2	formula_1
SELECT T2.url  FROM races AS T1  JOIN seasons AS T2 ON T1.year = T2.year  WHERE T1.raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2015 AND date = '2015-11-29')	formula_1
SELECT      d.forename, d.surname  FROM      drivers d  JOIN      results r ON d.driverId = r.driverId  WHERE      r.raceId = 872 AND r.time IS NOT NULL  ORDER BY      d.dob DESC  LIMIT 1;	formula_1
SELECT T3.forename, T3.surname FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.raceId = 348 ORDER BY T1.time LIMIT 1	formula_1
SELECT nationality  FROM drivers  WHERE driverId = (     SELECT driverId      FROM results      WHERE fastestLapSpeed = (         SELECT MAX(fastestLapSpeed)          FROM results     ) );	formula_1
SELECT      CAST((SUBTRACT(results.fastestLapSpeed, LAG(results.fastestLapSpeed, 1, results.fastestLapSpeed) OVER (ORDER BY results.raceId)) / LAG(results.fastestLapSpeed, 1, results.fastestLapSpeed) OVER (ORDER BY results.raceId)) * 100 AS REAL) AS percentage_faster FROM      results WHERE      results.driverId = (SELECT driverId FROM drivers WHERE surname = 'di Resta') AND     results.fastestLapSpeed IN (         SELECT fastestLapSpeed FROM results WHERE raceId = 853,         SELECT fastestLapSpeed FROM results WHERE raceId = 854     ) ORDER BY      results.raceId;	formula_1
SELECT      COUNT(CASE WHEN T1.time IS NOT NULL THEN T1.driverId ELSE NULL END) * 1.0 / COUNT(T1.driverId) AS completion_rate FROM      races AS T1 JOIN      results AS T2 ON T1.raceId = T2.raceId WHERE      T1.date = '1983-07-16'	formula_1
SELECT year  FROM races  WHERE name = 'Singapore Grand Prix'  ORDER BY year ASC  LIMIT 1;	formula_1
SELECT COUNT(*) AS num_races, name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT r1.name AS first_race_name, r2.name AS other_races_name FROM races r1 JOIN races r2 ON r1.year = r2.year AND r1.month = r2.month AND r1.raceId != r2.raceId;	formula_1
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1;	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT r.name  FROM races r  WHERE r.year = 2017  AND r.raceId NOT IN (SELECT rr.raceId FROM races rr WHERE rr.year = 2000)	formula_1
SELECT T1.country, T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name LIKE '%European Grand Prix%' AND T2.year = (SELECT MIN(YEAR) FROM races WHERE name LIKE '%European Grand Prix%')	formula_1
SELECT MAX(year) FROM races WHERE name = 'British Grand Prix' AND circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Brands Hatch');	formula_1
SELECT COUNT(DISTINCT T2.year)  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  WHERE T1.name = 'Silverstone Circuit' AND T2.name = 'British Grand Prix'	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2010 AND ra.name = 'Singapore Grand Prix' ORDER BY r.position;	formula_1
SELECT T2.forename, T2.surname, T1.points  FROM results AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T1.points = (SELECT MAX(points) FROM results)	formula_1
SELECT d.surname, d.forename, r.points  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races rs ON r.raceId = rs.raceId  WHERE rs.year = 2017 AND rs.name = 'Chinese Grand Prix'  ORDER BY r.points DESC  LIMIT 3;	formula_1
SELECT T1.forename, T2.name, T2.date, T2.time  FROM drivers AS T1  JOIN results AS T3 ON T1.driverId = T3.driverId  JOIN races AS T2 ON T3.raceId = T2.raceId  WHERE T3.fastestLap IS NOT NULL AND T3.fastestLapTime IS NOT NULL  ORDER BY T3.fastestLapTime  LIMIT 1;	formula_1
SELECT AVG(milliseconds)  FROM lapTimes  JOIN drivers ON lapTimes.driverId = drivers.driverId  JOIN races ON lapTimes.raceId = races.raceId  WHERE drivers.surname = 'Vettel' AND drivers.forename = 'Sebastian' AND races.year = 2009 AND races.name = 'Chinese Grand Prix'	formula_1
SELECT      COUNT(CASE          WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN T1.raceId     END) * 100.0 / COUNT(T1.raceId) AS percentage FROM      drivers AS T1 JOIN      results AS T2 ON T1.driverId = T2.driverId WHERE      T2.year >= 2010	formula_1
SELECT      d.surname || ', ' || d.forename AS driver_name,     d.nationality,     AVG(r.points) AS avg_points FROM      drivers d JOIN      driver_standings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      ds.wins = (         SELECT MAX(wins) FROM driver_standings     ) GROUP BY      d.driverId;	formula_1
SELECT      MAX(YEAR(CURRENT_DATE) - YEAR(dob)) + 1 AS age,     surname,     forename FROM      drivers WHERE      nationality = 'Japanese' ORDER BY      dob DESC LIMIT 1;	formula_1
SELECT DISTINCT circuits.name  FROM circuits  JOIN races ON races.circuitId = circuits.circuitId  WHERE year(date) BETWEEN 1990 AND 2000  GROUP BY circuits.circuitId  HAVING COUNT(races.raceId) = 4;	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name AS RaceName, c.name AS CircuitName, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2005 AND MONTH(r.date) = 9;	formula_1
SELECT T2.name  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T1.surname = 'Yoong' AND T2.position < 10	formula_1
SELECT COUNT(*)  FROM races  JOIN results ON races.raceId = results.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.surname = 'Schumacher' AND drivers.forename = 'Michael' AND races.name = 'Malaysian Grand Prix' AND races.circuitId = (SELECT circuits.circuitId FROM circuits WHERE circuits.name = 'Sepang International Circuit')	formula_1
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T2.fastestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(T1.points)  FROM results AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T2.surname = 'Irvine' AND T1.year = 2000;	formula_1
SELECT T1.year, T3.points  FROM races AS T1  JOIN results AS T3 ON T1.raceId = T3.raceId  JOIN drivers AS T2 ON T3.driverId = T2.driverId  WHERE T2.surname = 'Hamilton' AND T2.forename = 'Lewis'  ORDER BY T1.year ASC LIMIT 1;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name, s.year, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.laps = (SELECT MAX(laps) FROM races)  LIMIT 1;	formula_1
SELECT CAST(COUNT(CASE WHEN T2.country = 'Germany' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT      circuits.name  FROM      circuits  WHERE      circuits.name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') AND      circuits.lat = (         SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')     )	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country  FROM circuits  WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT T1.nationality  FROM drivers AS T1 ORDER BY T1.dob DESC LIMIT 1;	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian'	formula_1
SELECT url FROM drivers WHERE surname = 'Davidson' AND forename = 'Anthony'	formula_1
SELECT surname || ', ' || forename AS reference_name FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis';	formula_1
SELECT circuits.name  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone'	formula_1
SELECT races.name, circuits.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT T2.time  FROM seasons AS T1  JOIN races AS T2 ON T1.year = T2.year AND T1.url = T2.url  JOIN circuits AS T3 ON T2.circuitId = T3.circuitId  WHERE T1.year BETWEEN 2010 AND 2019 AND T3.name = 'Abu Dhabi'	formula_1
SELECT COUNT(*) FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy');	formula_1
SELECT DISTINCT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Barcelona-Catalunya'	formula_1
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix' AND T1.country = 'Spain'	formula_1
SELECT MIN(T.fastestLapTime) FROM results AS T WHERE T.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton') AND T.position = '1'	formula_1
SELECT `forename`, `surname` FROM `drivers` WHERE `drivers.driverId` IN (SELECT `driverId` FROM `results` WHERE `fastestLapSpeed` IS NOT NULL ORDER BY `fastestLapSpeed` DESC LIMIT 1)	formula_1
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Australian Grand Prix' AND races.year = 2008 AND results.position = 1;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis'	formula_1
SELECT T.raceId, T.rank  FROM (     SELECT races.raceId, drivers.surname || ', ' || drivers.forename AS driverName, races.name AS raceName, results.rank      FROM results      JOIN drivers ON results.driverId = drivers.driverId      JOIN races ON results.raceId = races.raceId      WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis'     ORDER BY results.rank, races.year DESC ) AS T  WHERE T.rank = (SELECT MIN(rank) FROM (     SELECT results.rank      FROM results      JOIN drivers ON results.driverId = drivers.driverId      WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis'     GROUP BY results.raceId ))	formula_1
SELECT MAX(T.fastestLapSpeed)  FROM results T  JOIN races R ON T.raceId = R.raceId  WHERE R.year = 2009 AND R.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT T2.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.surname = 'Hamilton' AND T1.forename = 'Lewis'	formula_1
SELECT T2.positionOrder  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.raceId IN (     SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' )	formula_1
SELECT forename, surname  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.grid = 4;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND time IS NOT NULL;	formula_1
SELECT fastestLap FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'  AND year = 2008 AND name = 'Australian Grand Prix';	formula_1
SELECT time  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND position = 2;	formula_1
SELECT d.surname, d.forename, c.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races rs ON r.raceId = rs.raceId JOIN constructors c ON r.constructorId = c.constructorId WHERE rs.year = 2008 AND rs.name = 'Australian Grand Prix' AND r.position = 1;	formula_1
SELECT COUNT(*)  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.nationality = 'American' AND races.year = 2008 AND races.name = 'Australian Grand Prix'	formula_1
SELECT COUNT(*)  FROM (     SELECT DISTINCT driverId      FROM results      WHERE raceId IN (         SELECT raceId          FROM races          WHERE year = 2008 AND name = 'Australian Grand Prix'     ) AND time IS NOT NULL ) AS drivers_in_2008_australian_gp;	formula_1
SELECT SUM(T2.points)  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T1.surname = 'Hamilton' AND T1.forename = 'Lewis'	formula_1
SELECT AVG(STR_TO_TIME(SUBSTRING_INDEX(fastestLapTime, ':', 1), '%M:%S.%m') * 60 + STR_TO_TIME(SUBSTRING_INDEX(fastestLapTime, ':', -1), '%.mmm')) FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.raceId)  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'	formula_1
SELECT      100 * (AVG(TIME(time) - TIME(results.fastestLapTime)) - AVG(TIME(results.fastestLapTime))) / AVG(TIME(results.fastestLapTime)) AS percentage_faster FROM      races JOIN      results ON races.raceId = results.raceId WHERE      races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.position = 1 OR results.position = (SELECT MAX(position) FROM results WHERE raceId = races.raceId)	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Melbourne, Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01'	formula_1
SELECT AVG(T1.points)  FROM constructors AS T1  JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId  WHERE T1.nationality = 'British'	formula_1
SELECT T2.name FROM `constructorStandings` AS T1 INNER JOIN `constructors` AS T2 ON T1.constructorId = T2.constructorId ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT T2.name FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.points = 0 AND T1.raceId = 291	formula_1
SELECT COUNT(*)  FROM (     SELECT constructorId     FROM constructorResults     WHERE nationality = 'Japanese'     GROUP BY constructorId     HAVING COUNT(DISTINCT raceId) = 2 AND SUM(points) = 0 ) AS JapaneseConstructorsWithZeroPointsInTwoRaces;	formula_1
SELECT DISTINCT T2.name FROM `results` AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.rank = 1	formula_1
SELECT COUNT(*)  FROM constructors  JOIN results ON constructors.constructorId = results.constructorId  JOIN races ON results.raceId = races.raceId  WHERE constructors.nationality = 'French' AND results.laps > 50	formula_1
SELECT      (COUNT(CASE WHEN T1.time IS NOT NULL THEN T1.driverId ELSE NULL END) * 100.0 / COUNT(T1.driverId)) AS completion_percentage FROM      results AS T1 JOIN      drivers AS T2 ON T1.driverId = T2.driverId WHERE      T2.nationality = 'Japanese' AND      T1.year BETWEEN 2007 AND 2009;	formula_1
SELECT AVG(TIMESTAMPDIFF(SECOND, '00:00:00', `time`)) AS average_time_seconds FROM results WHERE `position` = 1 GROUP BY YEAR(date);	formula_1
SELECT surname, forename  FROM drivers  WHERE year(dob) > 1975 AND driverStandingsId IN (     SELECT driverStandingsId      FROM driverStandings      WHERE position = 2 )	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND NOT EXISTS (     SELECT 1 FROM results WHERE drivers.driverId = results.driverId AND results.time IS NOT NULL );	formula_1
SELECT `forename`, `surname` FROM `drivers` WHERE `driverId` IN (SELECT `driverId` FROM `results` WHERE `fastestLapTime` IS NOT NULL ORDER BY `fastestLapTime` ASC LIMIT 1)	formula_1
SELECT T3.fastestLap  FROM seasons AS T1  JOIN results AS T2 ON T1.year = 2009 AND T1.url = T2.raceId  JOIN drivers AS T3 ON T3.driverId = T2.driverId  WHERE T2.position = 1	formula_1
SELECT AVG(T1.fastestLapSpeed)  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'	formula_1
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2milliseconds IS NOT NULL ORDER BY T2milliseconds ASC LIMIT 1	formula_1
SELECT      COUNT(CASE WHEN T1.dob < '1985-01-01' AND T2.laps > 50 THEN T1.driverId END) * 100.0 / COUNT(T1.driverId) AS percentage FROM      drivers AS T1 JOIN      results AS T2 ON T1.driverId = T2.driverId WHERE      T2.year BETWEEN 2000 AND 2005	formula_1
SELECT COUNT(*)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races rs ON r.raceId = rs.raceId JOIN lapTimes lt ON r.driverId = lt.driverId AND rs.raceId = lt.raceId WHERE d.nationality = 'French' AND lt.time < '01:00.00'	formula_1
SELECT `code` FROM drivers WHERE `nationality` = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18	formula_1
SELECT COUNT(*)  FROM (     SELECT d.driverId, d.surname, d.nationality     FROM drivers d     WHERE d.nationality = 'Netherlands'     ORDER BY d.dob ASC     LIMIT 3 ) AS youngest_Netherlands_drivers	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Kubica' AND forename = 'Robert';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'Australian' AND dob = '1980-01-01'	formula_1
SELECT d.surname, d.forename  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races rs ON r.raceId = rs.raceId WHERE d.nationality = 'German' AND rs.year BETWEEN 2000 AND 2020 AND YEAR(d.dob) BETWEEN 1980 AND 1990 ORDER BY r.laps, r.time LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' AND dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT driverId, code  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE year(dob) = 1971 AND fastestLapTime IS NOT NULL	formula_1
SELECT      d.surname, d.forename FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      d.nationality = 'Spanish' AND      YEAR(d.dob) < 1982 AND      r.fastestLap IS NOT NULL ORDER BY      r.fastestLapTime DESC LIMIT 10;	formula_1
SELECT year FROM races WHERE fastestLapTime IS NOT NULL;	formula_1
SELECT year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId GROUP BY year ORDER BY MAX(lapTimes.time) LIMIT 1;	formula_1
SELECT T.driverId  FROM (     SELECT driverId, MIN(time) AS fastest_time      FROM lapTimes      WHERE lap = 1      ORDER BY fastest_time      LIMIT 5 ) AS T;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId BETWEEN 50 AND 100  AND statusId = 2  AND time IS NOT NULL	formula_1
SELECT T1.location, T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Austria' GROUP BY T1.circuitId;	formula_1
SELECT raceId, COUNT(*) AS num_finishers FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY num_finishers DESC LIMIT 1;	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL	formula_1
SELECT      T3.year AS "race_year",     T1.forename,     T1.surname,     T4.name,     T4.date,     T4.time FROM     drivers AS T1 JOIN     results AS T2 ON T1.driverId = T2.driverId JOIN     races AS T3 ON T2.raceId = T3.raceId JOIN     qualifying AS T4 ON T1.driverId = T4.driverId AND T2.raceId = T4.raceId WHERE     T1.dob = '1998-12-27' ORDER BY     T3.year ASC,     T2.position ASC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE statusId = 2 AND nationality = 'American'	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT T2.url  FROM constructorStandings AS T1  JOIN constructors AS T2 ON T1.constructorId = T2.constructorId  WHERE T1.wins = (SELECT MAX(wins) FROM constructorStandings)	formula_1
SELECT      d.surname, d.forename, r.time  FROM      races AS r  JOIN      results AS res ON r.raceId = res.raceId  JOIN      drivers AS d ON res.driverId = d.driverId  WHERE      r.name = 'French Grand Prix' AND      res.positionOrder = 3 AND      r.lap = 3  ORDER BY      r.time DESC  LIMIT 1;	formula_1
SELECT T2.time, T2.milliseconds  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T1.fastestLap = 1 AND T1.fastestLapTime IS NOT NULL  ORDER BY T1.fastestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(T1.fastestLapTime)  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  JOIN circuits AS T3 ON T2.circuitId = T3.circuitId  WHERE T2.year = 2006 AND T2.name = 'United States Grand Prix' AND T1.rank <= 10	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN pit_stops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' ORDER BY AVG(ps.duration) ASC LIMIT 5;	formula_1
SELECT T1.surname, T1.forename, T2.time  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN races AS T3 ON T2.raceId = T3.raceId  WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2008 AND T2.position = 1 ORDER BY T2.position LIMIT 1;	formula_1
SELECT T1.constructorRef, T1.url  FROM constructors AS T1  JOIN results AS T2 ON T1.constructorId = T2.constructorId  JOIN races AS T3 ON T2.raceId = T3.raceId  WHERE T3.year = 2009 AND T3.name = 'Singapore Grand Prix' AND T2.position = 1 ORDER BY T3.time LIMIT 1;	formula_1
SELECT      forename,      surname,      dob  FROM      drivers  WHERE      nationality = 'Austria' AND      year(dob) BETWEEN 1981 AND 1991	formula_1
SELECT      forename + ' ' + surname AS full_name,     url AS wikipedia_page_link,     dob FROM      drivers WHERE      nationality = 'German' AND      year(dob) BETWEEN 1971 AND 1985 ORDER BY      dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT T2.points, T1.name, T1.nationality  FROM constructors AS T1  JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId  JOIN races AS T3 ON T2.raceId = T3.raceId  WHERE T3.name = 'Monaco Grand Prix' AND T3.year BETWEEN 1980 AND 2010  ORDER BY T2.points DESC LIMIT 1;	formula_1
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.surname = 'Hamilton' AND T2.name = 'Turkish Grand Prix'	formula_1
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM (     SELECT year     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31'     GROUP BY year ) AS yearly_races	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT SUM(results.points)  FROM results  WHERE results.position = 91	formula_1
SELECT T1.name FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  JOIN results AS T3 ON T2.raceId = T3.raceId  WHERE T3.fastestLapSpeed IS NOT NULL  ORDER BY T3.fastestLapSpeed ASC  LIMIT 1	formula_1
SELECT `location`, `country`  FROM `circuits`  JOIN `races` ON `circuits.circuitId` = `races.circuitId`  WHERE `races.date` = (SELECT MAX(`date`) FROM `races`);	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T3.year = 2008 AND T3.round = 3 AND T4.name = 'Marina Bay Street Circuit' AND T2.position = 1	formula_1
SELECT      T1.forename || ' ' || T1.surname AS full_name,     T1.nationality,     T2.name AS first_race FROM      drivers AS T1 JOIN      (         SELECT              driverId,             MIN(year) AS first_year         FROM              results         GROUP BY              driverId     ) AS T2 ON T1.driverId = T2.driverId WHERE      T1.dob = (SELECT MAX(dob) FROM drivers) ORDER BY      T2.first_year ASC LIMIT 1;	formula_1
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  JOIN status ON results.statusId = status.statusId  WHERE races.name = 'Canadian Grand Prix' AND status.status = 'Accident'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.wins > 0 ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT MAX(`duration`) AS longest_time_spent_at_pit_stop FROM pitStops;	formula_1
SELECT T1.time FROM lapTimes AS T1 WHERE T1.lap = (SELECT MAX(lap) FROM lapTimes) ORDER BY T1.milliseconds LIMIT 1	formula_1
SELECT MAX(`duration`) FROM pitStops WHERE `driverId` = (SELECT `driverId` FROM drivers WHERE `surname` = 'Hamilton') AND `forename` = 'Lewis';	formula_1
SELECT lap FROM pitStops WHERE raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix') AND driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton');	formula_1
SELECT T1.time, T2.duration FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2011 AND T1.name = 'Australian Grand Prix';	formula_1
SELECT T1.lap, T2.time  FROM lapTimes AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId  WHERE T2.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton')  ORDER BY T1.lapTime ASC  LIMIT 1;	formula_1
SELECT T1.forename, T1.surname  FROM drivers AS T1  JOIN lapTimes AS T2 ON T1.driverId = T2.driverId  WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes);	formula_1
SELECT T1.position FROM results AS T1 JOIN circuits AS T2 ON T2.circuitId = T1.circuitId WHERE T1.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis') AND T1.fastestLapTime IS NOT NULL ORDER BY T1.fastestLapTime LIMIT 1	formula_1
SELECT MIN(time) AS lap_record FROM lapTimes WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Austrian Grand Prix') AND milliseconds IS NULL;	formula_1
SELECT T1.name AS circuit_name, MIN(T2.time) AS lap_record_time FROM circuits AS T1 JOIN lapTimes AS T2 ON T1.circuitId = T2.raceId WHERE T1.country = 'Italy' GROUP BY T1.circuitId ORDER BY T1.circuitId;	formula_1
SELECT T1.name AS Race_Name, T2.time AS Lap_Time  FROM races AS T1  JOIN laptimes AS T2  ON T1.raceid = T2.raceid  JOIN circuits AS T3  ON T1.circuitid = T3.circuitid  WHERE T3.name = 'Austrian Grand Prix' AND T2.lap = 1 AND T2.time IS NOT NULL;	formula_1
SELECT T1.duration  FROM pitStops AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId AND T1.raceId = T2.raceId  JOIN races AS T3 ON T2.raceId = T3.raceId  JOIN circuits AS T4 ON T3.circuitId = T4.circuitId  WHERE T3.name = 'Austrian Grand Prix' AND T2.time IS NOT NULL AND T1.time IS NOT NULL  ORDER BY T2.fastestLapTime  LIMIT 1	formula_1
SELECT lat, lng FROM circuits WHERE name IN (     SELECT raceId FROM results WHERE fastestLapTime = '1:29.488' );	formula_1
SELECT AVG(milliseconds)  FROM pitStops  WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis')	formula_1
SELECT AVG(T1milliseconds)  FROM lapTimes  WHERE T2lat BETWEEN 41.7867 AND 41.9985  AND T2lng BETWEEN 12.1444 AND 12.5577;	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT MAX(height), player_name FROM Player;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating BETWEEN 60 AND 65  AND defensive_work_rate = 'low'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) LIMIT 5	european_football_2
SELECT T2.name FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.id ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id FROM Match WHERE season = '2015/2016' GROUP BY home_team_api_id ORDER BY SUM(CASE WHEN home_team_goal < away_team_goal THEN 1 ELSE 0 END) ASC LIMIT 1;	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.penalties = (SELECT MAX(penalties) FROM Player_Attributes) LIMIT 10;	european_football_2
SELECT T1.away_team_api_id  FROM Match AS T1  JOIN League AS T2 ON T1.league_id = T2.id  WHERE T2.name = 'Scotland Premier League' AND T1.season = '2009/2010'  GROUP BY T1.away_team_api_id  HAVING SUM(CASE WHEN T1.away_team_goal > T1.home_team_goal THEN 1 ELSE 0 END)  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT MAX(T1.buildUpPlaySpeed)  FROM Team_Attributes AS T1  JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id  WHERE T2.team_short_name IN ('Top4Team1', 'Top4Team2', 'Top4Team3', 'Top4Team4')	european_football_2
SELECT T2.name FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' AND T1.home_team_goal = T1.away_team_goal GROUP BY T2.name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT      T1.player_name,     DATEDIFF(CURRENT_DATE(), T1.birthday) / 365 AS age FROM      Player_Attributes AS T2 JOIN      Player AS T1 ON T1.player_api_id = T2.player_api_id WHERE      T2.sprint_speed >= 97 AND     T2.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'	european_football_2
SELECT League.name, COUNT(T.match_api_id) AS total_matches FROM Match AS T JOIN League ON T.league_id = League.id GROUP BY League.name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(T1.height)  FROM Player AS T1  WHERE T1.birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes) AND SUBSTR(date, 1, 4) = '2010'	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing IS NOT NULL AND T2.buildUpPlayPassing > (SELECT AVG(T2.buildUpPlayPassing) FROM Team_Attributes AS T2 WHERE T2.buildUpPlayPassing IS NOT NULL) AND strftime('%Y', T2.date) = '2012'	european_football_2
SELECT      CAST(SUM(CASE WHEN T1.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_fifa_api_id)  FROM      Player_Attributes AS T1 JOIN      Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE      strftime('%Y', T2.birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT league_id, SUM(home_team_goal + away_team_goal) AS total_goals FROM Match GROUP BY league_id ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(Player_Attributes.long_shots) AS average_long_shots FROM Player_Attributes JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE height > 180 GROUP BY player_api_id ORDER BY AVG(heading_accuracy) DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date >= '2014-01-01 00:00:00' AND T1.date <= '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (   SELECT AVG(T1.chanceCreationPassing)    FROM Team_Attributes AS T1   JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id   WHERE T1.date >= '2014-01-01 00:00:00'   AND T1.date <= '2014-01-31 00:00:00' ) ORDER BY T1.chanceCreationPassing DESC	european_football_2
SELECT League.name  FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(home_team_goal) > AVG(away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Franco Zennaro')	european_football_2
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date BETWEEN '2018-01-01' AND '2018-12-31' AND T2.buildUpPlayPositioningClass != 'None' AND T2.buildUpPlayPositioningClass IS NOT NULL;	european_football_2
SELECT `Player_Attributes`.`heading_accuracy` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `Player`.`player_name` = 'Francois Affolter' AND `date` = '2014-09-18 00:00:00'	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Gabriel Tamas') AND strftime('%Y', `date`) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season LIKE '2015/2016' AND League.name = 'Scotland Premier League'	european_football_2
SELECT `preferred_foot` FROM `Player` WHERE `birthday` = (SELECT MAX(`birthday`) FROM `Player`)	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN(SELECT player_api_id FROM Player_Attributes ORDER BY potential DESC LIMIT 1)	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE player_api_id IN (     SELECT player_api_id      FROM Player      WHERE weight < 130 ) AND preferred_foot = 'left'	european_football_2
SELECT DISTINCT T.team_short_name FROM Team_Attributes TA JOIN Team T ON TA.team_fifa_api_id = T.team_fifa_api_id WHERE TA.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'David Wilson' AND `preferred_foot` = 'R' OR `preferred_foot` = 'L';	european_football_2
SELECT `birthday` FROM `Player` WHERE `player_api_id` = (     SELECT `player_api_id` FROM `Player_Attributes` ORDER BY `overall_rating` DESC LIMIT 1 )	european_football_2
SELECT League.name FROM League WHERE League.country_id = (SELECT id FROM Country WHERE Country.name = 'Netherlands')	european_football_2
SELECT AVG(home_team_goal)  FROM Match  WHERE country_id IN      (SELECT id FROM Country WHERE name = 'Poland') AND      season = '2010/2011';	european_football_2
SELECT AVG(T2.finishing) AS avg_finishing_rate  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T1.height = (SELECT MAX(height) FROM Player)  OR T1.height = (SELECT MIN(height) FROM Player)	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT T2.player_name FROM `Player_Attributes` AS T1 JOIN `Player` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT Potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (     SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'left' )	european_football_2
SELECT DISTINCT T.team_long_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_short_name` = 'CLB'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  WHERE strftime('%Y', date) BETWEEN '2010' AND '2015'  AND height > 170	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)	european_football_2
SELECT `name` FROM `League` WHERE `name` = 'Italy Serie A';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')	european_football_2
SELECT COUNT(*)  FROM Match  WHERE strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10' AND country_id IN (SELECT id FROM Country WHERE name = 'Germany') AND league_id IN (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga');	european_football_2
SELECT T2.team_short_name FROM `Match` AS T1 JOIN `Team` AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10;	european_football_2
SELECT player_name  FROM Player  WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM Player_Attributes);	european_football_2
SELECT      AVG(`ball_control`) - (         SELECT              AVG(`ball_control`)          FROM              `Player_Attributes`          WHERE              `player_name` = 'Abdou Diallo'     ) AS `Difference_Ball_Control_Abdou_Diallo`,     (         SELECT              AVG(`ball_control`)          FROM              `Player_Attributes`          WHERE              `player_name` = 'Aaron Appindangoye'     ) AS `Average_Ball_Control_Aaron_Appindangoye` FROM      `Player_Attributes`;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_name  FROM Player  WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada'))  ORDER BY birthday ASC  LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT COUNT(DISTINCT player_api_id)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT `Country.name` FROM `Country` JOIN `League` ON `Country.id` = `League.country_id` WHERE `League.name` = 'Belgium Jupiler League'	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany';	european_football_2
SELECT player_name FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT COUNT(*)  FROM Player  WHERE strftime('%Y', `birthday`) < '1986' AND        EXISTS (         SELECT 1          FROM Player_Attributes          WHERE Player_Attributes.player_api_id = Player.player_api_id AND                defensive_work_rate = 'high'       )	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (     SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'R' AND name LIKE 'Alexis' ) UNION SELECT player_name FROM Player WHERE player_api_id IN (     SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'R' AND name LIKE 'Ariel Borysiuk' ) UNION SELECT player_name FROM Player WHERE player_api_id IN (     SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'R' AND name LIKE 'Arouna Kone' ) ORDER BY MAX(crossing) DESC LIMIT 1;	european_football_2
SELECT Heading_Accuracy FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk')	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player.height > 180 AND Player_Attributes.volleys > 70	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  JOIN Country ON League.country_id = Country.id  WHERE League.name = 'Belgium' AND SUBSTR(Match.date, 1, INSTR(Match.date, '/') - 1) = '2008' AND SUBSTR(Match.date, 6, INSTR(Match.date, '/') - 6) = '2009';	european_football_2
SELECT MAX(T1.long_passing) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT COUNT(*)  FROM Match  WHERE strftime('%Y', date) = '2009' AND strftime('%m', date) = '04' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium') AND league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League');	european_football_2
SELECT league_id  FROM Match  WHERE season = '2008/2009'  GROUP BY league_id  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.player_api_id = `Player`.player_api_id WHERE strftime('%Y', `Player`.birthday) < '1986'	european_football_2
SELECT      ((SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk') -       (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel')) * 100 /      (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel') AS percentage_increase	european_football_2
SELECT AVG(Team_Attributes.buildUpPlaySpeed)  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id  WHERE Team.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_name = 'Pietro Marino'	european_football_2
SELECT SUM(`crossing`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes`.player_api_id = `Player`.player_api_id  WHERE `Player`.player_name = 'Aaron Lennox'	european_football_2
SELECT MAX(T2.chanceCreationPassing), T2.chanceCreationPassingClass  FROM Team AS T1  JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id  WHERE T1.team_long_name = 'Ajax'	european_football_2
SELECT t.preferred_foot FROM `Player` AS p JOIN Player_Attributes AS t ON p.player_api_id = t.player_api_id WHERE p.player_name = 'Abdou Diallo'	european_football_2
SELECT MAX(`overall_rating`) FROM `Player_Attributes` WHERE `player_name` = 'Dorlan Pabon'	european_football_2
SELECT AVG(T2.away_team_goal)  FROM `Team` AS T1  JOIN `Match` AS T2 ON T1.team_api_id = T2.away_team_api_id  JOIN `Country` AS T3 ON T2.country_id = T3.id  WHERE T1.team_long_name = 'Parma' AND T3.name = 'Italy'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date = '2016-06-23' AND T1.height IS NOT NULL AND T1.weight IS NOT NULL ORDER BY T1.birthday ASC LIMIT 1;	european_football_2
SELECT T1.overall_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Mooy' AND T1.date = '2016-02-04 00:00:00'	european_football_2
SELECT potential  FROM Player_Attributes  WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'	european_football_2
SELECT      `attacking_work_rate` FROM      `Player_Attributes` WHERE      `player_name` = 'Francesco Migliore' AND      `date` = '2015-05-01 00:00:00'	european_football_2
SELECT Player_Attributes.defensive_work_rate FROM Player_Attributes JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name = 'Kevin Berigaud' AND Player_Attributes.date = '2013-02-22 00:00:00'	european_football_2
SELECT date  FROM Player_Attributes  WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant')	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22 00:00:00'	european_football_2
SELECT T2.buildUpPlayDribblingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_short_name` = 'FC Lorient' AND STRFTIME('%Y-%m-%d', `date`) = '2010-02-22'	european_football_2
SELECT `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'	european_football_2
SELECT `chanceCreationCrossingClass` FROM `Team_Attributes`  JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id`  WHERE `Team.team_long_name` = 'Hull City' AND `date` = '2010-02-22 00:00:00'	european_football_2
SELECT T2.defenceAggressionClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date = '2015-09-10 00:00:00'	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes T1  JOIN Player T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Marko Arnautovic'  AND T1.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';	european_football_2
SELECT      CAST((AVG(T1.overall_rating) - AVG(T2.overall_rating)) AS REAL) * 100 / AVG(T1.overall_rating)  FROM      Player_Attributes T1  JOIN      Player_Attributes T2 ON T2.player_api_id = T1.player_api_id  WHERE      T1.date = '2013-07-12' AND T1.player_name = 'Landon Donovan' AND T2.player_name = 'Jordan Bowery'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE datetime('current_timestamp', 'localtime') - datetime(birthday) > 34	european_football_2
SELECT COUNT(T1.home_team_goal) FROM `Match` AS T1 JOIN `Player` AS T2 ON T1.home_player_Y1 = T2.player_api_id WHERE T2.player_name = 'Aaron Lennon'	european_football_2
SELECT SUM(T.away_team_goal)  FROM `Match` M  JOIN `Team` T ON M.away_team_api_id = T.team_api_id  JOIN `Player` P ON M.away_player_1 = P.player_api_id OR                   M.away_player_2 = P.player_api_id OR                   M.away_player_3 = P.player_api_id OR                   M.away_player_4 = P.player_api_id OR                   M.away_player_5 = P.player_api_id OR                   M.away_player_6 = P.player_api_id OR                   M.away_player_7 = P.player_api_id OR                   M.away_player_8 = P.player_api_id OR                   M.away_player_9 = P.player_api_id OR                   M.away_player_10 = P.player_api_id OR                   M.away_player_11 = P.player_api_id  WHERE P.player_name IN ('Daan Smith', 'Filipe Ferreira')	european_football_2
SELECT SUM(T.home_team_goal)  FROM Match AS T  JOIN Player_Attributes AS PA ON T.home_player_1 = PA.player_api_id  WHERE EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM PA.birthday) <= 30	european_football_2
SELECT player_name FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN(SELECT player_api_id FROM Player_Attributes ORDER BY potential DESC LIMIT 1)	european_football_2
SELECT T1.player_name FROM `Player` AS T1 JOIN `Player_Attributes` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'high' AND T2.player_api_id IN (SELECT player_api_id FROM `Player_Attributes` WHERE attacking_work_rate = 'high')	european_football_2
SELECT player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE finishing = 1  ORDER BY datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday) DESC  LIMIT 1;	european_football_2
SELECT T1.player_name FROM `Player` AS T1 JOIN `Country` AS T2 ON T1.birthday LIKE '%Belgium%' WHERE T2.name = 'Belgium'	european_football_2
SELECT DISTINCT T1.player_name, T3.name  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  JOIN Country AS T3 ON T2.country_id = T3.id  WHERE T1.vision > 89;	european_football_2
SELECT T2.country.name FROM Player AS T1 JOIN Player_Attributes AS T3 ON T1.player_api_id = T3.player_api_id JOIN Country AS T2 ON T2.id = T1.country_id GROUP BY T1.country_id ORDER BY AVG(T3.weight) DESC LIMIT 1;	european_football_2
SELECT `team_long_name` FROM `Team_Attributes` WHERE `buildUpPlaySpeedClass` = 'Slow'	european_football_2
SELECT T1.team_short_name FROM `Team` AS T1 JOIN `Team_Attributes` AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T1.height)  FROM Player AS T1  JOIN Country AS T2 ON T1.country_id = T2.id  WHERE T2.name = 'Italy'	european_football_2
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name  LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%' AND SUBSTR(birthday, 1, 4) > '1990'	european_football_2
SELECT      (SELECT overall_rating FROM Player_Attributes WHERE player_api_id = 6 AND preferred_foot = 'R' AND attacking_work_rate = 'medium' AND defensive_work_rate = 'medium') -      (SELECT overall_rating FROM Player_Attributes WHERE player_api_id = 23 AND preferred_foot = 'L' AND attacking_work_rate = 'low' AND defensive_work_rate = 'high') AS difference_in_scores;	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)  AND preferred_foot = 'right'  LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE potential = (SELECT MAX(potential) FROM Player_Attributes WHERE preferred_foot = 'left')  AND preferred_foot = 'left'  AND attacking_work_rate IS NOT NULL;	european_football_2
SELECT CAST(SUM(CASE WHEN stamina > 80 AND strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Poland Ekstraklasa'	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%' AND        league_id = (SELECT id FROM League WHERE name = 'Belgian Jupiler League')	european_football_2
SELECT T1.sprint_speed, T1.agility, T1.acceleration FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Alexis Blin'	european_football_2
SELECT buildUpPlaySpeedClass FROM Team WHERE team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A')	european_football_2
SELECT MAX(home_team_goal) FROM `Match` WHERE country_id = (SELECT id FROM `Country` WHERE name = 'Netherlands') AND league_id = (SELECT id FROM `League` WHERE name = 'Eredivisie')	european_football_2
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.weight = (SELECT MAX(weight) FROM Player)	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY COUNT(Match.id) DESC LIMIT 1;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(goal) FROM Match)	european_football_2
SELECT player_name FROM Player WHERE player_api_id = (     SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1 )	european_football_2
SELECT      (COUNT(CASE WHEN height < 180 AND overall_strength > 70 THEN 1 END)      / COUNT(id)) * 100 AS percentage FROM      Player_Attributes WHERE      height < 180 AND overall_strength > 70;	european_football_2
SELECT      100 * (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) - COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) /      COUNT(CASE WHEN SEX = 'M' THEN 1 END) AS PercentageDeviation FROM      Patient;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN YEAR(Patient.Birthday) > '1930' AND Patient.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN Patient.SEX = 'F' THEN Patient.ID END) AS PercentageFemaleBornAfter1930 FROM      Patient;	thrombosis_prediction
SELECT      COUNT(CASE WHEN Admission = '+' THEN ID END) * 100.0 / COUNT(ID) AS inpatient_percentage FROM      Patient WHERE      strftime('%Y', Birthday) BETWEEN '1930' AND '1940';	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Ratio FROM      Patient WHERE      Diagnosis = 'SLE'	thrombosis_prediction
SELECT Patient.Diagnosis, Laboratory.Date  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.ID = '30609'	thrombosis_prediction
SELECT      Patient.SEX,      Patient.Birthday,      Examination.`Examination Date`,      Examination.Symptoms  FROM      Patient  JOIN      Examination ON Patient.ID = Examination.ID  WHERE      Patient.ID = '163109';	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH > 500	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+';	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 2 AND P.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.Birthday) = '1937' AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALB < 3.5	thrombosis_prediction
SELECT      CAST(COUNT(CASE WHEN T1.SEX = 'F' AND (T2.TP < '6.0' OR T2.TP > '8.5') THEN T1.ID ELSE NULL END) AS REAL) * 100 / COUNT(T1.ID) AS Percentage FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT AVG(`aCL IgG`) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Admission = '+' AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM Patient.Birthday) >= 50;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SUBSTR(Description, 1, 4) = '1997' AND Admission = '-' AND SEX = 'F';	thrombosis_prediction
SELECT MIN(T1.Birthday) - MAX(T1.`First Date`) AS Age FROM Patient AS T1 JOIN (     SELECT ID, MIN(`First Date`) AS MinFirstDate     FROM Patient     GROUP BY ID ) AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT P.ID      FROM Patient P      JOIN Examination E ON P.ID = E.ID      WHERE E.Thrombosis = 1 AND YEAR(E.`Examination Date`) = 1997 AND P.SEX = 'F' ) AS Subquery	thrombosis_prediction
SELECT      MAX(YEAR(Patient.Birthday)) - MIN(YEAR(Patient.Birthday))  FROM      Patient  JOIN      Laboratory ON Patient.ID = Laboratory.ID  WHERE      Laboratory.TG >= 200;	thrombosis_prediction
SELECT T1.Symptoms, T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY T2.Examination_Date ASC LIMIT 1;	thrombosis_prediction
SELECT      COUNT(DISTINCT l.ID) / 12 AS Average_Male_Patients_Testing_per_month FROM      Laboratory l JOIN      Patient p ON l.ID = p.ID WHERE      p.Birthday BETWEEN '1998-01-01' AND '1998-12-31' AND      p.SEX = 'M' AND      l.Date BETWEEN '1998-01-01' AND '1998-12-31';	thrombosis_prediction
SELECT MAX(T1.Birthday),         DATEDIFF(YEAR, T1.Birthday, T1.`First Date`) AS initial_arrival_age FROM Examination AS T2 JOIN Patient AS T1 ON T2.ID = T1.ID WHERE T2.Diagnosis = 'SJS' ORDER BY T1.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN UA <= '8.0' AND SEX = 'M' THEN 1 ELSE 0 END) AS REAL) /      CAST(SUM(CASE WHEN UA <= '6.5' AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) AS Ratio FROM      Patient  JOIN      Examination ON Patient.ID = Examination.ID JOIN      Laboratory ON Examination.ID = Laboratory.ID	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  WHERE NOT EXISTS (     SELECT 1      FROM Examination e      WHERE e.ID = p.ID AND            p.`First Date` + INTERVAL 1 YEAR <= e.Examination Date );	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE YEAR(p.Birthday) < 18 AND e.Examination_Date BETWEEN '1990-01-01' AND '1993-12-31'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.`T-BIL` > 2.0	thrombosis_prediction
SELECT Diagnosis  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.Examination_Date BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis  ORDER BY COUNT(*) DESC  LIMIT 1;	thrombosis_prediction
SELECT AVG(DATE_PART('year', AGE(Patient.Birthday)) + '1991')  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE EXTRACT(YEAR FROM Examination.Examination_Date) = 1991  AND EXTRACT(MONTH FROM Examination.Examination_Date) IN (10);	thrombosis_prediction
SELECT      CAST((EXTRACT(YEAR FROM `Examination Date`) - EXTRACT(YEAR FROM Birthday)) AS INT) AS Age,     Diagnosis FROM      Examination e JOIN      Patient p ON e.ID = p.ID JOIN      Laboratory l ON e.ID = l.ID AND l.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = e.ID) WHERE      l.HGB = (SELECT MAX(HGB) FROM Laboratory WHERE ID = e.ID)	thrombosis_prediction
SELECT `ANA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT      LAB.ID  FROM      Laboratory AS LAB  JOIN      Patient AS PAT ON LAB.ID = PAT.ID  WHERE      LAB.ID = 2927464 AND LAB.Date = '1995-09-04' AND LAB.`T-CHO` < 250	thrombosis_prediction
SELECT T2.SEX  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.Diagnosis = 'AORTITIS'  ORDER BY T2.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT L.ANA  FROM Laboratory AS L  JOIN Patient AS P ON L.ID = P.ID  WHERE P.Diagnosis = 'SLE' AND P.Description = '1994-02-19' AND L.Date = '1993-11-12' AND L.`aCL IgM` IS NOT NULL	thrombosis_prediction
SELECT Patient.SEX  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.Date = '1992-06-12' AND Laboratory.GPT = '9'	thrombosis_prediction
SELECT      DATEDIFF('1992', Birthday) AS Age FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.UA = '8.4' AND Laboratory.Date = '1991-10-21'	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT DISTINCT Lab.ID      FROM Laboratory Lab      JOIN Patient Pat ON Lab.ID = Pat.ID      WHERE Pat.`First Date` = '1991-06-13' AND Pat.Diagnosis = 'SJS' AND Lab.Date BETWEEN '1995-01-01' AND '1995-12-31' ) AS TestsIn1995	thrombosis_prediction
SELECT T2.Diagnosis  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.Examination_Date = '1997-01-27' AND T2.Description = (     SELECT MIN(Description) FROM Patient WHERE Admission IS NOT NULL )	thrombosis_prediction
SELECT T3.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.Birthday = '1959-03-01' AND T2.Examination_Date = '1993-09-27'	thrombosis_prediction
SELECT      ((SUM(CASE WHEN Date LIKE '1981-11-%' THEN `T-CHO` END) - SUM(CASE WHEN Date LIKE '1981-12-%' THEN `T-CHO` END)) / SUM(CASE WHEN Date LIKE '1981-12-%' THEN `T-CHO` END)) * 100 AS DecreaseRate FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Patient.Birthday = '1959-02-18'	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE P.Diagnosis = 'Behcet'  AND E.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.Examination_Date BETWEEN '1987-07-06' AND '1996-01-31' AND Laboratory.GPT > 30 AND Laboratory.ALB < 4;	thrombosis_prediction
SELECT P.ID  FROM Patient P  WHERE P.SEX = 'F' AND EXTRACT(YEAR FROM P.Birthday) = 1964 AND P.Admission = '+' ORDER BY P.ID;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Patient P ON E.ID = P.ID JOIN Laboratory L ON E.ID = L.ID AND E.Examination_Date = L.Date WHERE E.Thrombosis = 2 AND P.ANA = 'S' AND L.`aCL IgM` > (SELECT AVG(`aCL IgM`) FROM Examination E2 JOIN Laboratory L2 ON E2.ID = L2.ID WHERE L2.Date = E2.Examination_Date) * 1.2;	thrombosis_prediction
SELECT      COUNT(*) * 100.0 / (         SELECT COUNT(*)         FROM Laboratory     ) AS percentage FROM      Laboratory WHERE      `U-PRO` BETWEEN 0 AND 30 AND      UA <= 6.5;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END)           OVER () * 100.0 / COUNT(*) OVER () AS DECIMAL(5,2)) FROM      Patient WHERE      SUBSTR(Description, 1, 4) = '1981' AND     SEX = 'M'	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Admission = '-'  AND L.Date LIKE '1991-10%'  AND L.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT *      FROM Examination e     JOIN Patient p ON e.ID = p.ID     WHERE e.ANA IS NOT NULL     AND e.ANA_PATTERN <> 'P'     AND p.SEX = 'F'     AND p.BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' ) subquery;	thrombosis_prediction
SELECT Patient.SEX  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.Diagnosis = 'PSS'  AND Laboratory.CRP LIKE '%2+'  AND Laboratory.CRE = 1  AND Laboratory.LDH = 123;	thrombosis_prediction
SELECT AVG(Laboratory.ALB) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND Laboratory.PLT > 400 AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Diagnosis = 'SLE'  GROUP BY Symptoms  ORDER BY COUNT(*) DESC  LIMIT 1;	thrombosis_prediction
SELECT `First Date`, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'F' AND Examination.Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  WHERE YEAR(Date) = '1997' AND TP BETWEEN 6 AND 8.5	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN PATIENT.Diagnosis LIKE '%ITP%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Examination EXAM JOIN      Patient PAT ON EXAM.ID = PAT.ID WHERE      PAT.Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN `Patient`.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`Patient`.ID)  FROM      `Patient` JOIN      Examination ON `Patient`.ID = Examination.ID WHERE      YEAR(`Patient`.Birthday) = 1980 AND `Examination.Diagnosis` LIKE '%RA%'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE p.SEX = 'M'  AND e.Examination_Date BETWEEN '1995' AND '1997'  AND e.Diagnosis = 'BEHCET'  AND p.Admission = '-'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5	thrombosis_prediction
SELECT  DATEDIFF(T1.`Examination Date`, T1.`First Date`) AS TimeToEvaluation FROM  Patient T1 JOIN  Examination T2 ON T1.ID = T2.ID WHERE  T1.ID = 821298 AND T1.`First Date` IS NOT NULL AND T2.Examination Date IS NOT NULL ORDER BY  T1.`First Date` LIMIT 1	thrombosis_prediction
SELECT      LAB.ID  FROM      Laboratory AS LAB  JOIN      Patient AS PAT ON LAB.ID = PAT.ID  WHERE      PAT.ID = 57266 AND      (LAB.UA > 8.0 AND PAT.SEX = 'M') OR      (LAB.UA > 6.5 AND PAT.SEX = 'F')	thrombosis_prediction
SELECT L.Date FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.ID = '48473' AND L.GOT >= 60	thrombosis_prediction
SELECT P.SEX, P.Birthday  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND YEAR(L.Date) = 1994	thrombosis_prediction
SELECT P.ID  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60	thrombosis_prediction
SELECT P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT > 60 ORDER BY P.Birthday ASC;	thrombosis_prediction
SELECT AVG(`LDH`)  FROM Laboratory  WHERE `LDH` < 500	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT      p.ID,     p.Admission FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.ALP < 300 AND p.Admission IN ('+', '-')	thrombosis_prediction
SELECT ID FROM Patient WHERE Birthday = '1982-04-01' AND ALP < 300	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0;	thrombosis_prediction
SELECT      LAB.ID,     LAB.TP,     (LAB.TP - 8.5) AS DeviationFromNormal FROM      Laboratory LAB JOIN      Patient PAT ON LAB.ID = PAT.ID WHERE      PAT.SEX = 'F' AND LAB.TP > 8.5;	thrombosis_prediction
SELECT P.ID, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE EXTRACT(YEAR FROM Patient.Birthday) = '1982' AND Laboratory.ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Laboratory  WHERE      SEX = 'F'	thrombosis_prediction
SELECT AVG(Lab.UA) AS Average_UA_Index FROM Laboratory Lab JOIN Patient Pat ON Lab.ID = Pat.ID WHERE Lab.UA < CASE WHEN Pat.SEX = 'M' THEN 8.0 ELSE 6.5 END AND Lab.Date = (SELECT MAX(Lab2.Date) FROM Laboratory Lab2 WHERE Lab2.ID = Lab.ID)	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UN = 29;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Diagnosis = 'RA' AND L.UN < 30;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5	thrombosis_prediction
SELECT      (SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END)) AS result FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.CRE >= 1.5	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)	thrombosis_prediction
SELECT Patient.SEX, COUNT(Patient.ID) AS TotalPatients FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`T-BIL` >= 2.0 GROUP BY Patient.SEX;	thrombosis_prediction
SELECT P.ID, LA.`T-CHO` FROM Patient P JOIN Laboratory LA ON P.ID = LA.ID WHERE P.Birthday = (SELECT MIN(Birthday) FROM Patient) AND LA.`T-CHO` = (SELECT MAX(`T-CHO`) FROM Laboratory LA2 WHERE LA2.ID = P.ID)	thrombosis_prediction
SELECT AVG(DATE_PART('year', AGE(Patient.Birthday))) AS AverageAge FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'M' AND Examination.`T-CHO` >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday) > 50	thrombosis_prediction
SELECT DISTINCT L.ID  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Admission = '-' AND L.CPK < 250	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Birthday BETWEEN '1936-01-01' AND '1956-12-31'  AND Patient.SEX = 'M'  AND Laboratory.CPK >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250	thrombosis_prediction
SELECT P.ID, Lab.GLU  FROM Patient P JOIN Laboratory Lab ON P.ID = Lab.ID WHERE Lab.GLU < 180 AND STRFTIME('%Y', P.Description) >= '1991'	thrombosis_prediction
SELECT      P.ID,     P.SEX,     P.Birthday,     DATE_PART('year', AGE(P.Birthday)) AS Age FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY      P.SEX,     P.Birthday ORDER BY      P.SEX,     Age ASC;	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.RBC < 3.5 AND P.Diagnosis IS NOT NULL	thrombosis_prediction
SELECT DISTINCT P.ID, P.Admission FROM Patient P JOIN (     SELECT ID, Date     FROM Laboratory     WHERE RBC <= 3.5 OR RBC >= 6.0 ) Lab ON P.ID = Lab.ID WHERE P.SEX = 'F' AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday) >= 50;	thrombosis_prediction
SELECT P.ID, P.SEX  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.HGB < 10	thrombosis_prediction
SELECT P.ID, P.SEX  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17 AND P.Birthday = (     SELECT MIN(Birthday) FROM Patient WHERE Diagnosis = 'SLE' )	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age  FROM Patient P  JOIN (     SELECT ID, COUNT(*) AS LabExamCount      FROM (         SELECT DISTINCT ID          FROM Laboratory          WHERE HCT >= 52          GROUP BY ID          HAVING COUNT(*) > 2     ) AS LabExamsAboveNormal      GROUP BY ID  ) AS LabCounts ON P.ID = LabCounts.ID;	thrombosis_prediction
SELECT AVG(HCT)  FROM Laboratory  WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `LABORATORY.PLT` < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN `LABORATORY.PLT` > 400 THEN 1 ELSE 0 END)) AS difference FROM      LABORATORY WHERE      `PATIENT.ID` = `LABORATORY.ID` AND      EXISTS (         SELECT 1 FROM EXAMINATION WHERE `EXAMINATION.ID` = `PATIENT.ID` AND `EXAMINATION.Thrombosis` = 1     );	thrombosis_prediction
SELECT DISTINCT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.Date LIKE '1984%' AND        SUBSTR(CURRENT_TIMESTAMP, 1, 4) - SUBSTR(Patient.Birthday, 1, 4) < 50 AND        Laboratory.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM      Patient WHERE      EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM Birthday) > 55	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` > '1992-12-31' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.`Examination Date` > '1997-01-01' AND l.APTT >= 45	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.APTT > 45 AND e.Thrombosis = 3  AND p.ID NOT IN (     SELECT DISTINCT ID      FROM Examination e2      JOIN Patient p2 ON e2.ID = p2.ID      JOIN Laboratory l2 ON p2.ID = l2.ID      WHERE l2.APTT > 45 AND e2.Thrombosis = 3 )	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT DISTINCT l.ID      FROM Laboratory l      JOIN Patient p ON l.ID = p.ID      WHERE p.SEX = 'M'      AND l.WBC BETWEEN 3.5 AND 9.0      AND (l.FG <= 150 OR l.FG >= 450) ) subquery;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Birthday > '1980-01-01' AND L.FG < 150 OR L.FG > 450;	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.`U-PRO` >= 30;	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.`U-PRO` BETWEEN 0 AND 30 AND P.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE e.`aCL IgG` < 900 AND l.`U-PRO` LIKE '%abortion%'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.IGG BETWEEN 900 AND 2000  AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis  FROM Patient JOIN (     SELECT ID, MAX(IGA) AS max_iga     FROM Laboratory     WHERE IGA BETWEEN 80 AND 500     GROUP BY ID     ORDER BY max_iga DESC     LIMIT 1 ) AS maxIgA ON Patient.ID = maxIgA.ID;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA BETWEEN 80 AND 500 AND p.`First Date` >= '1990-01-01'	thrombosis_prediction
SELECT Diagnosis FROM (     SELECT Diagnosis, COUNT(*) AS Count     FROM Examination e     JOIN Patient p ON e.ID = p.ID     WHERE `aCL IgM` NOT BETWEEN 40 AND 400     GROUP BY Diagnosis ) AS subquery ORDER BY Count DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE NOT EXISTS (     SELECT 1 FROM Laboratory WHERE Patient.ID = Laboratory.ID AND CRP LIKE '+' OR CRP LIKE '-' OR CRP < 1.0 AND Patient.Description IS NULL );	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRPT NOT IN ('+-', '-') AND L.CRPT >= 1.0 AND DATEDIFF(YEAR(CURRENT_DATE()), YEAR(P.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.RF = '-+' AND L.KCT = '+'	thrombosis_prediction
SELECT T1.Diagnosis  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE EXTRACT(YEAR FROM T1.Birthday) >= 1995 AND T2.RF = '-+'	thrombosis_prediction
SELECT P.ID  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RF < 20 AND DATEDIFF(YEAR(CURRENT_DATE()), YEAR(P.Birthday)) > 60	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RF < 20 AND p.Thrombosis = '0'	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.C3 > 35 AND Examination.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT BETWEEN 29 AND 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 1 AND e.`C4` > 10	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`ANA Pattern` LIKE '%RNP%' AND p.Admission = '+'	thrombosis_prediction
SELECT Birthday  FROM Patient  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE RNP NOT IN ('-', '+-') ) ORDER BY Birthday DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON e.ID = l.ID  WHERE l.SM IN ('-', '+-') AND l.SM != '1' AND e.Thrombosis = 1;	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.SM NOT IN ('-', '+-') AND L.SM IS NOT NULL AND P.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE ID = P.ID) LIMIT 3;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Examination_Date >= '1997-01-01' AND l.SC170 IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.`SC170` IN ('-', '+-')  AND Patient.SEX = 'M'  AND Examination.Symptoms LIKE '%vertigo%';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.`ANA Pattern` LIKE '%normal%' AND l.SSA IN ('-', '+-') AND YEAR(p.`First Date`) < 1990;	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Symptoms LIKE '%anti-SSA%' AND L.SSA NOT IN ('-', '+-') AND P.ID = (SELECT MIN(ID) FROM Patient)	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`ANA Pattern` LIKE '%anti-SSB%' AND Examination.Diagnosis = 'SLE' AND Examination.`ANA Pattern` NOT LIKE '%positive%'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`SSB` IN ('-', '+-') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT p.ID      FROM Patient p      JOIN Examination e ON p.ID = e.ID      JOIN Laboratory l ON p.ID = l.ID      WHERE e.`DNA-II` = 0 AND l.CENTROMEA IN ('-', '+-') AND l.SSB IN ('-', '+-') AND p.SEX = 'M' ) subquery;	thrombosis_prediction
SELECT P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.`DNA` >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.`DNA` < 8 AND P.Description IS NULL	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.`DNA-II` >= 8 AND Patient.Admission = '+'	thrombosis_prediction
SELECT      CAST(COUNT(CASE WHEN `GOT` >= 60 AND Diagnosis = 'SLE' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN `GOT` >= 60 THEN 1 ELSE NULL END) AS Percentage FROM      Laboratory WHERE      Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.GOT < 60	thrombosis_prediction
SELECT MAX(Patient.Birthday)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GOT >= 60;	thrombosis_prediction
SELECT P.Birthday  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT < 60 ORDER BY L.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M'	thrombosis_prediction
SELECT L.Date  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.LDH < 500 AND P.Description IS NOT NULL AND P.Description = (SELECT MIN(P.Description) FROM Patient WHERE ID = L.ID) ORDER BY L.Date ASC LIMIT 1;	thrombosis_prediction
SELECT MAX(`First Date`) FROM Patient WHERE ID IN (     SELECT ID FROM Laboratory WHERE LDH >= 500 );	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.ALP >= 300 AND Patient.Admission = '+'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '-' AND l.ALP < 300	thrombosis_prediction
SELECT Patient.Diagnosis  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON e.ID = l.ID  WHERE p.Diagnosis = 'SJS' AND l.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT L.Date FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE L.ALB > 3.5 AND L.ALB < 5.5 ORDER BY L.ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT MAX(`aCL IgG`) AS MaxACLIGG, MAX(`aCL IgM`) AS MaxACLIM, MAX(`aCL IgA`) AS MaxACLIA  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE p.SEX = 'F' AND EXISTS (     SELECT * FROM Laboratory l      WHERE l.ID = e.ID AND l.UA > 6.50 )	thrombosis_prediction
SELECT MAX(L.ANA)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE L.CRE < 1.5	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM Examination) AND L.CRE < 1.5;	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT DISTINCT p.ID      FROM Patient p      JOIN Laboratory l ON p.ID = l.ID      WHERE l.`T-BIL` >= 2.0      AND p.ID IN (         SELECT DISTINCT l.ID          FROM Laboratory l          JOIN Examination e ON l.ID = e.ID          WHERE e.`ANA Pattern` LIKE '%P%'     ) ) subquery;	thrombosis_prediction
SELECT Patient.ID, Examination.ANA FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0) AND Laboratory.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT DISTINCT LAB.ID      FROM Laboratory AS LAB      JOIN Patient AS PAT ON LAB.ID = PAT.ID      WHERE LAB.`T-CHO` >= 250 AND LAB.KCT = '-' ) AS RESULT;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON e.ID = l.ID  WHERE l.`T-CHO` < 250 AND e.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT *      FROM Patient p     JOIN Examination e ON p.ID = e.ID     JOIN Laboratory l ON p.ID = l.ID     WHERE l.`T-CHO` IS NOT NULL AND l.TG < 200 AND l.Symptoms IS NOT NULL ) AS subquery	thrombosis_prediction
SELECT Diagnosis FROM Patient WHERE ID IN (     SELECT ID FROM Laboratory WHERE TG < 200 ORDER BY TG DESC LIMIT 1 )	thrombosis_prediction
SELECT Patient.ID  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Thrombosis = 0 AND Examination.CPK < 250	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT *      FROM Laboratory      WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+') ) AS filtered_data;	thrombosis_prediction
SELECT MIN(`Birthday`)  FROM `Patient`  JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID`  WHERE `Laboratory`.`GLU` > 180;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GLU < 180 AND e.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC <= 3.5 OR l.RBC >= 6.0 AND p.Admission = '-'	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT *      FROM Patient      WHERE Diagnosis IS NOT NULL      AND EXISTS (         SELECT 1          FROM Examination          WHERE Examination.ID = Patient.ID          AND Examination.Thrombosis = 0          AND Examination.`Platelet` BETWEEN 100 AND 400     ) ) AS subquery;	thrombosis_prediction
SELECT DISTINCT P.ID, LAB.PLT FROM Patient P JOIN Laboratory LAB ON P.ID = LAB.ID WHERE P.Diagnosis = 'MCTD' AND LAB.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT AVG(Laboratory.PT)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.SEX = 'M' AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis IN (1, 2) AND p.ID IN (     SELECT l.ID      FROM Laboratory l     WHERE l.PT < 14 )	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.college = 'College of Engineering' AND position = 'Student' AND department = 'Engineering';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design' AND T1.position = 'Student_Club'	student_club
SELECT COUNT(*)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE e.event_name = 'Women\'s Soccer' AND m.link_to_major LIKE 'Student_Club%'	student_club
SELECT T4.phone  FROM event AS T1  JOIN attendance AS T2 ON T1.event_id = T2.link_to_event  JOIN member AS T3 ON T2.link_to_member = T3.member_id  JOIN major AS T4 ON T3.link_to_major = T4.major_id  WHERE T1.event_name = 'Women\'s Soccer' AND T4.major_name = 'Student_Club'	student_club
SELECT COUNT(*)  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  JOIN major ON member.link_to_major = major.major_id  WHERE event.event_name = 'Women\'s Soccer' AND member.t_shirt_size = 'Medium';	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id JOIN major AS T4 ON T3.link_to_major = T4.major_id WHERE T4.major_name = 'Student_Club' GROUP BY T1.event_id ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1;	student_club
SELECT college  FROM member  WHERE position = 'Vice President' AND member_id IN (     SELECT link_to_member      FROM attendance      WHERE link_to_event IN (         SELECT event_id          FROM event          WHERE event_name = 'Student_Club'     ) );	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*)  FROM event AS e JOIN attendance AS a ON e.event_id = a.link_to_event JOIN member AS m ON a.link_to_member = m.member_id JOIN major AS ma ON m.link_to_major = ma.major_id WHERE e.type = 'Student_Club' AND m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND EXTRACT(YEAR FROM e.event_date) = 2019;	student_club
SELECT COUNT(DISTINCT e.event_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'Student_Club' AND e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 10;	student_club
SELECT event.event_name  FROM event  JOIN attendance ON event.event_id = attendance.link_to_event  GROUP BY event.event_id, event.event_name  HAVING COUNT(attendance.link_to_event) > 20  AND event.status = 'Student_Club';	student_club
SELECT AVG(a.link_to_event) AS average_attendance FROM "attendance" a JOIN event e ON a.link_to_event = e.event_id WHERE e.type = 'Meeting' AND EXTRACT(YEAR FROM e.event_date) = 2020;	student_club
SELECT expense_description  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.event_status = 'club'  ORDER BY cost DESC  LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering' AND major.college = 'Student_Club'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id JOIN major AS T4 ON T1.link_to_major = T4.major_id WHERE T4.college = 'Student_Club' AND T3.event_name = 'Laugh Out Loud'	student_club
SELECT last_name FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Law and Constitutional Studies')	student_club
SELECT T3.county FROM `member` AS T1 INNER JOIN `major` AS T2 ON T1.link_to_major = T2.major_id INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'	student_club
SELECT college FROM major WHERE major_id = (SELECT link_to_major FROM member WHERE first_name = 'Tyler' AND last_name = 'Hewitt')	student_club
SELECT amount FROM `income` WHERE link_to_member IN (SELECT member_id FROM `member` WHERE position = 'Vice President')	student_club
SELECT SUM(T2.cost)  FROM budget AS T1  JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget  JOIN event AS T3 ON T1.link_to_event = T3.event_id  JOIN member AS T4 ON T2.link_to_member = T4.member_id  WHERE T1.event_status = 'closed' AND T3.event_name = 'September Meeting' AND T1.category = 'Food'	student_club
SELECT T3.city, T3.state FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.position = 'President' AND T2.college = 'Student_Club'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois' AND T1.position = 'Student_Club'	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id JOIN member m ON m.member_id = b.link_to_member JOIN major ma ON ma.major_id = m.link_to_major WHERE e.event_name = 'September Meeting' AND ma.major_name = 'Student_Club' AND b.category = 'Advertisement';	student_club
SELECT m.department FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.first_name IN ('Pierce', 'Guidi') AND mem.last_name IN ('Pierce', 'Guidi')	student_club
SELECT SUM(b.remaining) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker'	student_club
SELECT COUNT(*)  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.link_to_event IN (     SELECT event_id      FROM event      WHERE event_name = 'October Meeting' AND event_date = '2019-10-08' ) AND expense.approved = 'True'	student_club
SELECT AVG(T2.cost)  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  WHERE T1.first_name = 'Elijah'  AND T1.last_name = 'Allen'  AND MONTH(T2.expense_date) IN (9, 10)	student_club
SELECT      SUM(CASE WHEN DATE(event_date) BETWEEN '2019-01-01' AND '2019-12-31' THEN spent ELSE 0 END) -      SUM(CASE WHEN DATE(event_date) BETWEEN '2020-01-01' AND '2020-12-31' THEN spent ELSE 0 END) AS total_spent_difference FROM      budget JOIN      event ON budget.link_to_event = event.event_id	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT T2.cost  FROM expense AS T2  JOIN budget AS T1 ON T1.budget_id = T2.link_to_budget  WHERE T1.event_status = 'Posters' AND T2.expense_date = '2019-09-04'	student_club
SELECT remaining  FROM budget  WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(DISTINCT major_id) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'	student_club
SELECT T3.county FROM `member` AS T1 INNER JOIN `major` AS T2 ON T1.link_to_major = T2.major_id INNER JOIN `zip_code` AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O\'Gallagher'	student_club
SELECT COUNT(*)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'November Meeting' AND budget.remaining < 0;	student_club
SELECT SUM(b.remaining)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Speaker'	student_club
SELECT T1.event_status  FROM budget AS T1  JOIN expense AS T2 ON T1.link_to_event = T2.expense_id  WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'	student_club
SELECT `major_name` FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `first_name` = 'Brent' AND `last_name` = 'Thomason'	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Human Development and Family Studies' AND member.t_shirt_size = 'Large'	student_club
SELECT T3.type FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielsen'	student_club
SELECT T3.major_name FROM `member` AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'Vice President'	student_club
SELECT T3.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN member AS T4 ON T4.member_id = T1.link_to_major WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T3.department  FROM member AS T1  JOIN major AS T3 ON T1.link_to_major = T3.major_id  WHERE T1.position = 'President'	student_club
SELECT `date_received` FROM `income` WHERE `source` = 'Dues' AND `link_to_member` = 'Connor Hilton'	student_club
SELECT first_name, last_name FROM `income` WHERE source = 'Dues' ORDER BY date_received ASC LIMIT 1;	student_club
SELECT      SUM(CASE          WHEN b.event_name = 'Yearly Kickoff' AND b.category = 'Advertisement' THEN b.amount          ELSE 0      END) /      SUM(CASE          WHEN b.event_name = 'October Meeting' AND b.category = 'Advertisement' THEN b.amount          ELSE 0      END) AS frequency FROM      budget b	student_club
SELECT      (SUM(CASE WHEN budget.category = 'Parking' AND budget.event_status = 'Approved' THEN budget.amount ELSE 0 END) /      SUM(CASE WHEN budget.event_status = 'Approved' THEN budget.amount ELSE 0 END)) * 100 AS parking_budget_percentage FROM      budget;	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department  FROM major  WHERE college = 'Humanities and Social Sciences'	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  WHERE b.remaining = (SELECT MIN(remaining) FROM budget)	student_club
SELECT T3.first_name, T3.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'October Meeting'	student_club
SELECT T1.college  FROM major AS T1  JOIN member AS T2 ON T1.major_id = T2.link_to_major  GROUP BY T1.college  ORDER BY COUNT(T2.member_id) DESC  LIMIT 1;	student_club
SELECT T1.major_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.amount = (SELECT MAX(amount) FROM budget)	student_club
SELECT T2.expense_description  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  WHERE T1.position = 'Vice President'	student_club
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women\'s Soccer'	student_club
SELECT date_received  FROM income  WHERE link_to_member = 'Casey Mason';	student_club
SELECT COUNT(*) FROM `member` m JOIN `zip_code` z ON m.zip = z.zip_code WHERE z.state = 'Maryland'	student_club
SELECT COUNT(*)  FROM attendance  WHERE link_to_member IN (     SELECT member_id      FROM member      WHERE phone = '954-555-6240' )	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'School of Applied Sciences, Technology and Education';	student_club
SELECT T1.event_name  FROM event AS T1  JOIN budget AS T2 ON T1.event_id = T2.link_to_event  WHERE T1.status = 'Closed'  ORDER BY CAST(T2.spent AS REAL) / T2.amount DESC  LIMIT 1;	student_club
SELECT COUNT(*) FROM `member` WHERE position = 'president' AND link_to_major IS NOT NULL;	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting' AND SUBSTR(event_date, 1, 4) = '2020'	student_club
SELECT SUM(T1.spent)  FROM `budget` AS T1  JOIN `expense` AS T2 ON T1.budget_id = T2.link_to_budget  WHERE T1.category = 'Food'	student_club
SELECT T1.first_name, T1.last_name  FROM member AS T1  JOIN attendance AS T2 ON T1.member_id = T2.link_to_member  GROUP BY T2.link_to_member  HAVING COUNT(T2.link_to_event) > 7;	student_club
SELECT DISTINCT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'	student_club
SELECT COUNT(income_id) FROM income JOIN member ON income.link_to_member = member.member_id WHERE first_name = 'Grant' AND last_name = 'Gilmour';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 40;	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_description LIKE '%Yearly Kickoff%' OR event_name = 'Baseball game';	student_club
SELECT T2.first_name, T2.last_name FROM budget AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff';	student_club
SELECT T1.first_name, T1.last_name, T2.source FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.cost = (SELECT MIN(cost) FROM `expense`)	student_club
SELECT      (SUM(cost WHERE event_name = 'Yearly Kickoff') /       (SELECT SUM(cost) FROM "expense")) * 100 AS percentage_of_cost	student_club
SELECT      CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM      major	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email  FROM member  WHERE position = 'Secretary' AND position = 'Student_Club'	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching' AND member.position = 'Student_Club'	student_club
SELECT COUNT(DISTINCT link_to_member)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater' AND STRFTIME('%Y', event.event_date) = '2019';	student_club
SELECT COUNT(*)  FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi';	student_club
SELECT AVG(T2.spent)  FROM budget AS T2  JOIN event AS T1 ON T2.link_to_event = T1.event_id  WHERE T1.status = 'Closed' AND T2.category = 'Food'	student_club
SELECT event_name FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Advertisement'  ORDER BY budget.spent DESC  LIMIT 1;	student_club
SELECT T1.link_to_event FROM `attendance` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Maya' AND T2.last_name = 'Mclean' AND T1.link_to_event = 'Women\'s Soccer'	student_club
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0 / COUNT(event_id)) AS percentage_share FROM      event WHERE      event_name LIKE '%Student_Club%' AND     event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT T2.cost FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T1.event_name = 'September Speaker' AND T2.expense_description = 'Posters'	student_club
SELECT t_shirt_size  FROM member  GROUP BY t_shirt_size  ORDER BY COUNT(*) DESC  LIMIT 1;	student_club
SELECT T1.event_name  FROM event AS T1  JOIN budget AS T2 ON T1.event_id = T2.link_to_event  WHERE T2.remaining < 0  ORDER BY T2.remaining ASC  LIMIT 1;	student_club
SELECT e.expense_description, SUM(e.cost) AS total_value FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND e.approved = 'true'	student_club
SELECT category  FROM budget  WHERE link_to_event IN (     SELECT event_id      FROM event      WHERE event_name = 'April Speaker' )  ORDER BY amount ASC;	student_club
SELECT budget_id  FROM budget  WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT T1.expense_id, T1.expense_description, T1.cost FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.category = 'Advertising' ORDER BY T2.amount DESC LIMIT 3;	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_date = '2019-08-20'	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) AS total_cost FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.member_id = 'rec4BLdZHS2Blfp4v'	student_club
SELECT expense_description  FROM expense  JOIN member ON expense.link_to_member = member.member_id  WHERE first_name = 'Sacha' AND last_name = 'Harrison';	student_club
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'X-Large'	student_club
SELECT T3.zip_code FROM `expense` AS T1  JOIN `member` AS T2 ON T1.link_to_member = T2.member_id  JOIN `zip_code` AS T3 ON T2.zip = T3.zip_code  WHERE T1.cost < 50	student_club
SELECT T3.major_name FROM member AS T1 JOIN major AS T3 ON T1.link_to_major = T3.major_id JOIN member AS T2 ON T1.member_id = T2.member_id WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'	student_club
SELECT T3.position FROM major AS T1 JOIN member AS T3 ON T1.major_id = T3.link_to_major WHERE T1.major_name = 'Business'	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT T1.type  FROM event AS T1  JOIN budget AS T2 ON T1.event_id = T2.link_to_event  WHERE T2.remaining > 30	student_club
SELECT b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215';	student_club
SELECT T1.category FROM `budget` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_date = '2020-03-24T12:00:00'	student_club
SELECT T3.major_name FROM member AS T1 JOIN major AS T3 ON T1.link_to_major = T3.major_id JOIN event AS T2 ON T1.member_id = (     SELECT T4.link_to_member      FROM event AS T2      JOIN attendance AS T4 ON T2.event_id = T4.link_to_event      WHERE T2.type = 'Student Club' AND T2.status = 'Vice President'     LIMIT 1 )	student_club
SELECT      (SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Mathematics' THEN 1 ELSE 0 END)      / CAST(COUNT(m.member_id) AS REAL)) * 100 AS percentage_members_major_mathematics FROM      member m JOIN      major ma ON m.link_to_major = ma.major_id JOIN      zip_code zc ON m.zip = zc.zip_code;	student_club
SELECT T1.category  FROM budget AS T1  JOIN event AS T2 ON T1.link_to_event = T2.event_id  WHERE T2.location = 'MU 215'	student_club
SELECT COUNT(income_id)  FROM income  WHERE amount = 50;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large'	student_club
SELECT COUNT(*)  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE major.department = 'School of Applied Sciences, Technology and Education' AND member.college = 'College of Agriculture and Applied Sciences'	student_club
SELECT m.last_name, ma.department, ma.college  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT T2.category FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215' AND T1.type = 'Guest Speaker' AND T2.spent = 0;	student_club
SELECT T3.city, T3.state FROM `member` AS T1  JOIN `major` AS T2 ON T1.link_to_major = T2.major_id  JOIN `zip_code` AS T3 ON T1.zip = T3.zip_code  WHERE T2.department = 'Electrical and Computer Engineering' AND T1.position = 'Member'	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  JOIN zip_code z ON m.zip = z.zip_code  JOIN major d ON m.link_to_major = d.major_id  WHERE m.position = 'Vice President' AND d.college = 'Student_Club' AND z.location = '900 E. Washington St.' AND e.type = 'Social'	student_club
SELECT T1.last_name, T1.position  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.expense_description = 'Pizza' AND T2.expense_date = '2019-09-10'	student_club
SELECT T1.last_name  FROM member AS T1  JOIN attendance AS T2 ON T1.member_id = T2.link_to_member  JOIN event AS T3 ON T2.link_to_event = T3.event_id  WHERE T3.event_name = 'Women\'s Soccer' AND T1.position = 'Member';	student_club
SELECT      CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id)  FROM      member AS T1  JOIN      income AS T2 ON T1.member_id = T2.link_to_member  WHERE      T1.t_shirt_size = 'Medium' AND T1.position = 'Member'	student_club
SELECT DISTINCT T2.state FROM zip_code AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.type = 'PO Box'	student_club
SELECT DISTINCT z.zip_code FROM zip_code z JOIN city c ON z.city = c.city JOIN county co ON c.county_id = co.county_id WHERE c.name = 'San Juan Municipio' AND co.state = 'Puerto Rico' AND z.type = 'PO Box';	student_club
SELECT event_name  FROM event  WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT T2.link_to_event FROM `expense` AS T1 JOIN `event` AS T2 ON T1.link_to_budget = T2.event_id WHERE T1.cost > 50	student_club
SELECT T1.first_name, T1.last_name, T2.link_to_event FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE EXISTS (     SELECT 1 FROM expense AS T3     WHERE T3.link_to_member = T1.member_id AND T3.approved = 'true' AND T3.expense_date BETWEEN '2019-01-10' AND '2019-11-19' )	student_club
SELECT T3.college  FROM member AS T1  JOIN major AS T3 ON T1.link_to_major = T3.major_id  WHERE T1.first_name = 'Katy' AND T3.major_name = 'rec1N0upiVLy5esTO'	student_club
SELECT T2.phone FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major JOIN zip_code AS T3 ON T2.zip = T3.zip_code WHERE T1.major_name = 'Business' AND T1.college = 'College of Agriculture and Applied Sciences'	student_club
SELECT T2.email  FROM expense AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  WHERE T1.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND T1.cost > 20;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'education' AND major.college = 'College of Education & Human Services'  AND position = 'Member';	student_club
SELECT      CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(budget_id)  FROM      budget;	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense WHERE DIVIDE(SUM(cost), COUNT(expense_id)) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT      CAST(SUM(CASE WHEN zip_code.type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code.zip_code)  FROM      zip_code;	student_club
SELECT T1.event_name, T1.location FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0;	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100;	student_club
SELECT T1.first_name, T1.last_name, T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN expense AS T3 ON T1.member_id = T3.link_to_member WHERE T3.cost > 100	student_club
SELECT T1.city, T1.county, T2.event_name FROM zip_code AS T1 JOIN event AS T2 ON T1.zip_code = T2.location JOIN (     SELECT link_to_event, COUNT(*) AS income_count     FROM income     GROUP BY link_to_event     HAVING COUNT(*) > 40 ) AS T3 ON T2.event_id = T3.link_to_event;	student_club
SELECT T2.first_name, T2.last_name, MAX(T3.cost) FROM (     SELECT T1.link_to_member AS member_id     FROM expense AS T1     GROUP BY T1.link_to_member     HAVING COUNT(DISTINCT T1.link_to_event) > 1 ) AS T4 JOIN member AS T2 ON T2.member_id = T4.member_id JOIN expense AS T3 ON T3.link_to_member = T4.member_id	student_club
SELECT AVG(e.cost) FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position != 'Member'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description LIKE '%Parking%' AND T3.cost < (SELECT AVG(T3.cost) FROM expense AS T3 WHERE T3.expense_description LIKE '%Parking%')	student_club
SELECT      (SUM(cost) OVER () / COUNT(event_id) OVER ()) * 100 AS percentage_cost_for_game_events FROM      expense JOIN      event ON expense.link_to_budget = event.event_id WHERE      event.type = 'Game';	student_club
SELECT T1.link_to_event FROM budget AS T1 JOIN expense AS T2 ON T1.link_to_event = T2.link_to_budget WHERE T2.expense_description = 'Water, chips, cookies' ORDER BY T2.cost DESC LIMIT 1	student_club
SELECT T1.first_name, T1.last_name  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  GROUP BY T1.member_id, T1.first_name, T1.last_name  ORDER BY SUM(T2.cost) DESC  LIMIT 5	student_club
SELECT T2.first_name, T2.last_name, T2.phone FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT      (SUM(CASE WHEN zip_code.state = 'Maine' THEN 1 ELSE 0 END) / COUNT(CASE WHEN position = 'Member' THEN 1 END)) -      (SUM(CASE WHEN zip_code.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(CASE WHEN position = 'Member' THEN 1 END)) FROM      member JOIN      zip_code ON member.zip = zip_code.zip_code;	student_club
SELECT major_name, department FROM member JOIN major ON member.link_to_major = major.major_id WHERE first_name = 'Garrett' AND last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name  FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T1.last_name, T1.phone  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T2.major_name = 'Elementary Education'	student_club
SELECT T2.category, T2.amount FROM "budget" AS T1 JOIN "event" AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker'	student_club
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food';	student_club
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '9/9/2019'	student_club
SELECT T1.category FROM `budget` AS T1 JOIN `expense` AS T2 ON T1.link_to_event = T2.link_to_budget WHERE T2.expense_description = 'Posters';	student_club
SELECT T1.first_name || ' ' || T1.last_name AS full_name, T3.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.position = 'Secretary'	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT T2.city FROM `member` AS T1 INNER JOIN `zip_code` AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Girke'	student_club
SELECT T1.first_name, T1.last_name, T1.position  FROM member AS T1  JOIN zip_code AS T2 ON T1.zip = T2.zip_code  WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T2.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT      COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) AS RatioEURtoCZK FROM      customers WHERE      Currency IS NOT NULL;	debit_card_specializing
SELECT T1.CustomerID, SUM(T3.Consumption) AS TotalConsumption FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN (     SELECT *     FROM transactions_1k     WHERE Date BETWEEN '201201' AND '201212' ) AS T3 ON T1.CustomerID = T3.CustomerID GROUP BY T1.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND CustomerID IN (     SELECT CustomerID FROM customers WHERE Segment = 'SME' );	debit_card_specializing
SELECT T1.CustomerID, SUM(T3.Consumption) AS TotalConsumption FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN (     SELECT Date, Amount, Price, CASE WHEN T4.Currency = 'CZK' THEN true ELSE false END AS IsCZK     FROM transactions_1k AS T4     JOIN yearmonth AS T5 ON T4.TransactionID = T5.Date ) AS T3 ON T1.Date = T3.Date AND T1.CustomerID = T3.CustomerID WHERE STRFTIME('%Y', T1.Date) BETWEEN '201101' AND '201112' GROUP BY T1.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(*)  FROM yearmonth  JOIN customers ON yearmonth.CustomerID = customers.CustomerID  WHERE customers.Segment = 'KAM' AND Consumption < 30000 AND Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT      SUM(CASE WHEN T3.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) -      SUM(CASE WHEN T3.Currency = 'EUR' THEN T2.Consumption ELSE 0 END) AS Consumption_Difference FROM     yearmonth AS T1 JOIN     customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN     transactions_1k AS T3 ON T1.Date = T3.Date AND T1.CustomerID = T3.CustomerID WHERE     T1.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT strftime('%Y', Date) AS Year FROM yearmonth WHERE Consumption * Price > 0 GROUP BY Year ORDER BY SUM(Consumption * Price) DESC LIMIT 1;	debit_card_specializing
SELECT t.yearmonth.CustomerID, t.yearmonth.Date, t.yearmonth.Consumption, c.Segment FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment IN (     SELECT Segment     FROM (         SELECT Segment, SUM(Consumption) AS total_consumption         FROM yearmonth         GROUP BY Segment     ) s     ORDER BY total_consumption ASC     LIMIT 1 )	debit_card_specializing
SELECT Year(Date) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Currency = 'CZK' GROUP BY Year(Date) ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT T.yearmonth.Date  FROM yearmonth  JOIN customers ON yearmonth.CustomerID = customers.CustomerID  WHERE customers.Segment = 'SME' AND SUBSTR(T.yearmonth.Date, 1, 4) = '2013'  ORDER BY yearmonth.Consumption DESC  LIMIT 1	debit_card_specializing
WITH ConsumptionByYearSegment AS (     SELECT          y.Date,          c.Segment,          SUM(y.Consumption) / COUNT(c.CustomerID) AS AnnualAverageConsumption     FROM          yearmonth y     JOIN          customers c ON y.CustomerID = c.CustomerID     WHERE          y.Date BETWEEN '201301' AND '201312'     GROUP BY          c.Segment,          y.Date ), MinConsumptionPerSegment AS (     SELECT          Segment,          MIN(AnnualAverageConsumption) AS MinAnnualAverage     FROM          ConsumptionByYearSegment     GROUP BY          Segment ), SegmentComparison AS (     SELECT          CASE              WHEN m1.Segment = 'SME' THEN m1.MinAnnualAverage             ELSE NULL         END AS SME_Average,         CASE              WHEN m2.Segment = 'LAM' THEN m2.MinAnnualAverage             ELSE NULL         END AS LAM_Average,         CASE              WHEN m3.Segment = 'KAM' THEN m3.MinAnnualAverage             ELSE NULL         END AS KAM_Average     FROM          MinConsumptionPerSegment m1     CROSS JOIN          MinConsumptionPerSegment m2     CROSS JOIN          MinConsumptionPerSegment m3     WHERE          m1.Segment IN ('SME', 'LAM', 'KAM') AND          m2.Segment IN ('LAM', 'SME', 'KAM') AND          m3.Segment IN ('KAM', 'LAM', 'SME') ) SELECT      (SELECT SME_Average FROM SegmentComparison) - (SELECT LAM_Average FROM SegmentComparison) AS SME_LAM_Difference,     (SELECT LAM_Average FROM SegmentComparison) - (SELECT KAM_Average FROM SegmentComparison) AS LAM_KAM_Difference,     (SELECT KAM_Average FROM SegmentComparison) - (SELECT SME_Average FROM SegmentComparison) AS KAM_SME_Difference FROM      dual;	debit_card_specializing
WITH ConsumptionData AS (     SELECT          ym.Date,         c.Segment,         SUM(ym.Consumption) AS TotalConsumption,         SUM(CASE WHEN ym.Date LIKE '2012%' THEN ym.Consumption ELSE 0 END) AS Year2012Consumption,         SUM(CASE WHEN ym.Date LIKE '2013%' THEN ym.Consumption ELSE 0 END) AS Year2013Consumption     FROM yearmonth ym     JOIN customers c ON ym.CustomerID = c.CustomerID     WHERE c.Currency = 'EUR'     GROUP BY ym.Date, c.Segment ), PercentageChange AS (     SELECT          Date,         Segment,         (Year2013Consumption - Year2012Consumption) AS ConsumptionIncrease,         (Year2013Consumption - Year2012Consumption) / Year2013Consumption * 100 AS PercentageIncrease     FROM ConsumptionData ), SegmentMaxMin AS (     SELECT          Segment,         MAX(PercentageIncrease) AS MaxPercentageIncrease,         MIN(PercentageIncrease) AS MinPercentageIncrease     FROM PercentageChange     GROUP BY Segment ) SELECT      s.Segment,     CASE          WHEN s.MaxPercentageIncrease IS NOT NULL THEN s.MaxPercentageIncrease         ELSE 0     END AS MaxPercentageIncrease,     CASE          WHEN s.MinPercentageIncrease IS NOT NULL THEN s.MinPercentageIncrease         ELSE 0     END AS MinPercentageIncrease FROM SegmentMaxMin s;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  WHERE CustomerID = 6 AND Date LIKE '201308%' OR Date LIKE '201309%' OR Date LIKE '201310%' OR Date LIKE '201311%'	debit_card_specializing
SELECT      SUM(CASE WHEN Country = 'Czech Republic' THEN 1 ELSE 0 END) - SUM(CASE WHEN Country = 'Slovakia' THEN 1 ELSE 0 END)  FROM      gasstations  WHERE      Segment = 'discount'	debit_card_specializing
SELECT      (SELECT SUM(Consumption) FROM yearmonth WHERE Date = '201304' AND CustomerID = 7) -      (SELECT SUM(Consumption) FROM yearmonth WHERE Date = '201304' AND CustomerID = 5) AS Difference	debit_card_specializing
SELECT      SUM(CASE WHEN `yearmonth`.Currency = 'CZK' AND customers.Segment = 'SME' THEN 1 ELSE 0 END) AS czk_smes,     SUM(CASE WHEN `yearmonth`.Currency = 'EUR' AND customers.Segment = 'SME' THEN 1 ELSE 0 END) AS eur_smes,     czk_smes - eur_smes AS difference FROM `yearmonth` JOIN customers ON `yearmonth`.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME'	debit_card_specializing
SELECT T1.CustomerID, T1.Consumption  FROM yearmonth AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Currency = 'Euro' AND T1.Date = '201310' AND T1.Consumption = (     SELECT MAX(Consumption)      FROM yearmonth      WHERE Date = '201310' AND T2.Currency = 'Euro' )	debit_card_specializing
SELECT T1.CustomerID, SUM(T2.Consumption) AS TotalConsumption FROM `yearmonth` AS T2 JOIN customers AS T1 ON T2.CustomerID = T1.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T1.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(T3.Consumption)  FROM yearmonth AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  JOIN transactions_1k AS T3 ON T1.CustomerID = T3.CustomerID AND T1.Date = T3.Date  WHERE T2.Segment = 'KAM' AND T1.Date = '201305'	debit_card_specializing
SELECT      (COUNT(*) FILTER (WHERE `Consumption` > 46.73) * 100.0 / COUNT(*)) AS percentage_of_lam_customers_consumed_more_than_46_73 FROM      yearmonth WHERE      `CustomerID` IN (         SELECT `CustomerID` FROM customers WHERE `Segment` = 'LAM'     );	debit_card_specializing
SELECT g.Country, COUNT(DISTINCT g.GasStationID) AS ValueForMoneyGasStations FROM gasstations g JOIN (     SELECT DISTINCT GasStationID     FROM transactions_1k     WHERE (Price / (SELECT Amount FROM transactions_1k WHERE transactions_1k.TransactionID = transactions_1k.transactions_1k.TransactionID - 1)) > 1 ) t ON g.GasStationID = t.GasStationID GROUP BY g.Country;	debit_card_specializing
SELECT      (COUNT(*) FILTER (WHERE T1.Currency = 'EUR' AND T2.Segment = 'KAM') * 100.0 / COUNT(*) FILTER (WHERE T2.Segment = 'KAM')) AS percentage FROM      customers AS T1 JOIN      yearmonth AS T2 ON T1.CustomerID = T2.CustomerID	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth WHERE Date = '201202'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN g.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(g.GasStationID) FROM gasstations g JOIN yearmonth ym ON g.GasStationID = ym.CustomerID AND SUBSTR(ym.Date, 1, INSTR(ym.Date, '-') - 1) = 'Slovakia' WHERE g.Country = 'Slovakia' AND g.Segment = 'Premium';	debit_card_specializing
SELECT T1.CustomerID  FROM yearmonth AS T1  JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date  WHERE T1.Date = '201309'  GROUP BY T1.CustomerID  ORDER BY SUM(T2.Amount) DESC  LIMIT 1;	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID JOIN transactions_1k AS T3 ON T1.CustomerID = T3.CustomerID AND T2.Date = T3.Date WHERE T1.Segment = 'SME' AND T2.Date = '201206' ORDER BY T2.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption)  FROM yearmonth  WHERE Date LIKE '2012%'	debit_card_specializing
SELECT SUM(T.yearmonth.Consumption) / 12 AS 'Biggest Monthly Consumption' FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'Euro';	debit_card_specializing
SELECT T3.Description  FROM yearmonth AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  JOIN products AS T3 ON T3.ProductID = T1.ProductID  WHERE T1.Date LIKE '201309%'	debit_card_specializing
SELECT T2.Country  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  JOIN yearmonth AS T3 ON T3.CustomerID = T1.CustomerID AND T3.Date = '201306'  WHERE T3.Date = '201306'	debit_card_specializing
SELECT T2.ChainID FROM "transactions_1k" AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Price > 0 AND T1.Price <> '' AND T1.Amount > 0 AND T1.Amount <> '' AND T2.Currency = 'EUR'	debit_card_specializing
SELECT T4.Description FROM `transactions_1k` AS T1 JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID JOIN products AS T4 ON T1.ProductID = T4.ProductID WHERE T3.Currency = 'EUR'	debit_card_specializing
SELECT AVG(T1.Price * T1.Amount) AS AverageTotalPrice FROM transactions_1k T1 JOIN yearmonth T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date WHERE T2.Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT y.CustomerID)  FROM yearmonth y  JOIN customers c ON y.CustomerID = c.CustomerID  WHERE c.Currency = 'Euro' AND y.Consumption > 1000	debit_card_specializing
SELECT T4.Description  FROM "transactions_1k" AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  JOIN products AS T4 ON T1.ProductID = T4.ProductID  WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT T1.Time  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T2.ChainID = 11  GROUP BY T1.Time;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000	debit_card_specializing
SELECT COUNT(*)  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE g.Country = 'CZE' AND t.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(T1.Price * T1.Amount) AS AverageTotalPrice FROM transactions_1k T1 JOIN gasstations T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE';	debit_card_specializing
SELECT AVG(T1.Amount) AS AverageTotalPrice FROM `transactions_1k` T1 JOIN customers T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'Euro'	debit_card_specializing
SELECT T1.CustomerID FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = '2012-08-25' WHERE T2.Date = '2012-08-25' ORDER BY T1.Amount DESC LIMIT 1;	debit_card_specializing
SELECT T3.Country  FROM transactions_1k AS T1  JOIN gasstations AS T3 ON T3.GasStationID = T1.GasStationID  JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date  WHERE T2.Date = '2012-08-25'  ORDER BY T1.Time  LIMIT 1;	debit_card_specializing
SELECT T1.Currency  FROM customers AS T1  JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Time = '16:25:00' AND T2.Date = '2012-08-24'	debit_card_specializing
SELECT T2.Segment  FROM yearmonth AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID AND transactions_1k.Date = '2012-08-26'  JOIN customers ON transactions_1k.CustomerID = customers.CustomerID  WHERE yearmonth.Date = '2012-08-26'  AND customers.Currency = 'EUR'  AND transactions_1k.Time < '13:00:00'	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 WHERE T1.CustomerID = (SELECT MIN(CustomerID) FROM customers) LIMIT 1	debit_card_specializing
SELECT T2.Country  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT T2.ProductID FROM `transactions_1k` AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
SELECT      t1.Date,      t1.Consumption,      SUM(t1.Amount) AS TotalSpent FROM      yearmonth t1 JOIN      transactions_1k t2 ON t1.CustomerID = t2.CustomerID AND t1.Date BETWEEN '2012-01-01' AND '2012-01-31' WHERE      t2.Amount = 124.05 AND t1.Date = '2012-08-24'	debit_card_specializing
SELECT COUNT(*)  FROM (     SELECT *      FROM transactions_1k t     JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND ym.Date = '2012-08-26'     JOIN gasstations g ON t.GasStationID = g.GasStationID     WHERE t.Time BETWEEN '08:00:00' AND '09:00:00' AND g.Country = 'CZE' ) subquery;	debit_card_specializing
SELECT T1.Currency  FROM customers AS T1  JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID  JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID AND T2.Date = T3.Date  WHERE T3.Date LIKE '201306%' AND T2.Amount = 214582.17	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467	debit_card_specializing
SELECT T1.Currency  FROM customers AS T1  JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Amount = 548.4 AND T2.Date = '2012-08-24'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25'	debit_card_specializing
SELECT      ((t1.Consumption - t2.Consumption) / t1.Consumption) * 100 AS ConsumptionDecreaseRate FROM      yearmonth t1 JOIN      yearmonth t2 ON t1.CustomerID = t2.CustomerID AND SUBSTR(t1.Date, 1, 10) = '2012-08-24' AND SUBSTR(t2.Date, 1, 10) = '2013-08-24' WHERE      t1.Date = '2012-08-25' AND t1.Amount = 634.8	debit_card_specializing
SELECT T2.GasStationID, SUM(T1.Amount * T1.Price) AS TotalRevenue FROM transactions_1k T1 JOIN gasstations T2 ON T1.GasStationID = T2.GasStationID GROUP BY T2.GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      SUM(CASE WHEN t2.Segment = 'premium' THEN 1 ELSE 0 END) * 100.0 / COUNT(t2.Segment) AS percentage FROM      yearmonth AS t1 JOIN      customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE      t2.Country = 'SVK'	debit_card_specializing
SELECT SUM(T1.Amount) AS TotalSpent FROM transactions_1k T1 JOIN yearmonth T2 ON T1.CustomerID = T2.CustomerID AND T2.Date = '201201' WHERE T1.CustomerID = '38508';	debit_card_specializing
SELECT T3.Description  FROM transactions_1k AS T1  JOIN products AS T3 ON T3.ProductID = T1.ProductID  GROUP BY T3.ProductID  ORDER BY SUM(T1.Amount) DESC  LIMIT 5;	debit_card_specializing
SELECT T1.Currency, AVG(T2.Price / T2.Amount) AS AveragePricePerItem FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.CustomerID, T1.Currency ORDER BY SUM(T2.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T3.ProductID = 2 AND T1.ProductID = T3.ProductID WHERE T1.Amount = (     SELECT MAX(T1.Amount)     FROM transactions_1k AS T1     JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID     JOIN products AS T3 ON T3.ProductID = 2 AND T1.ProductID = T3.ProductID )	debit_card_specializing
SELECT T2.Consumption FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T3.ProductID = 5 AND T1.Price / T1.Amount > 29.00 AND SUBSTR(T2.Date, 1, 6) = '201208'	debit_card_specializing
