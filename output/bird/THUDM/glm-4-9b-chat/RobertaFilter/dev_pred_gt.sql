SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM `frpm` WHERE `County Code` = '01' AND `Enrollment (K-12)` > 0;	california_schools
SELECT      `CDSCode`,      `Percent (%) Eligible Free (Ages 5-17)` FROM      `frpm` WHERE      `Educational Option Type` = 'Continuation' ORDER BY      `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT `Zip` FROM `frpm` WHERE `District Code` = 10001 AND `Charter School (Y/N)` = 1;	california_schools
SELECT s.MailStreet, s.MailStreetAbr, s.MailCity, s.MailZip, s.MailState FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.FRPM Count (K-12) = (     SELECT MAX(t.FRPM Count (K-12))     FROM frpm t )	california_schools
SELECT `schools.Phone` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `frpm.Charter School (Y/N)` = 1 AND `frpm.Charter Funding Type` = 'Directly funded' AND `schools.OpenDate` > '2000-01-01';	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F' AND schools.SOCType = 'School';	california_schools
SELECT s.CDSCode, s.School, s.Magnet FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 > 0 ORDER BY ss.NumGE1500 DESC LIMIT 1;	california_schools
SELECT satscores.NumTstTakr FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm )	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath > 560 AND s.FundingType = 'Directly funded';	california_schools
SELECT      f.FRPM_Count_Ages_5_17 FROM      frpm f JOIN      satscores s ON f.CDSCode = s.cds WHERE      s.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)     AND f.Ages_5_17 = 'K-12';	california_schools
SELECT `CDSCode` FROM `frpm` WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) AS HighestFreeMealRate FROM `frpm` WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3 AND `Enrollment (Ages 5-17)` > 0 AND `Free Meal Count (Ages 5-17)` > 0;	california_schools
SELECT s.Phone FROM `schools` s JOIN `satscores` sc ON s.CDSCode = sc.cds WHERE sc.rtype = 'D' ORDER BY (sc.NumGE1500 / sc.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Enrollment (Ages 5-17)` IS NOT NULL ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT dname, AVG(AvgScrRead) AS AvgReadingScore FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Active' GROUP BY dname ORDER BY AvgReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores  WHERE cds IN (     SELECT CDSCode      FROM schools      WHERE County = 'Alameda' AND (StatusType = 'Active' OR StatusType = 'Closed') ) AND NumTstTakr < 100;	california_schools
SELECT      s.CDSCode,      s.CharterNum,     AVG(s.AvgScrWrite) AS AvgWritingScore FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.AvgScrWrite > 499 AND      s.CharterNum IS NOT NULL GROUP BY      s.CDSCode, s.CharterNum ORDER BY      AvgWritingScore DESC;	california_schools
SELECT COUNT(*) FROM `schools` INNER JOIN `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE `schools.County` = 'Fresno' AND `schools.FundingType` = 'Directly funded' AND `satscores.NumTstTakr` <= 250;	california_schools
SELECT `schools`.`Phone` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `satscores`.`rtype` = 'D' AND `satscores`.`AvgScrMath` IS NOT NULL ORDER BY `satscores`.`AvgScrMath` DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12';	california_schools
SELECT COUNT(*) FROM frpm WHERE `Academic Year` = '2014-2015' AND `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;	california_schools
SELECT `schools`.`School`, `satscores`.`NumTstTakr` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `schools`.`County` = 'Contra Costa' ORDER BY `satscores`.`NumTstTakr` DESC LIMIT 1;	california_schools
SELECT      s.School,      s.Street || ', ' || s.City || ', ' || s.Zip AS FullAddress,     fpm.`Enrollment (K-12)` - fpm.`Enrollment (Ages 5-17)` AS EnrollmentDifference FROM      frpm fpm JOIN      schools s ON fpm.CDSCode = s.CDSCode WHERE      ABS(fpm.`Enrollment (K-12)` - fpm.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores st ON f.CDSCode = st.cds WHERE f.`Percent (%) Eligible Free (K-12)` > 0.1 AND st.NumGE1500 >= 1500;	california_schools
SELECT s.School, s.FundingType FROM schools s JOIN (     SELECT AVG(AvgScrMath) AS avg_math     FROM satscores     WHERE sname IS NOT NULL AND sname IN (         SELECT School         FROM schools         WHERE County = 'Riverside'     )     GROUP BY sname ) AS avg_scores ON s.School = avg_scores.sname WHERE avg_scores.avg_math > 400;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Monterey' AND (f.`Free Meal Count (Ages 5-17)` > 800 OR f.`Percent (%) Eligible Free (Ages 5-17)` > 0) AND s.School Type LIKE '%High Schools%' AND s.StatusType = 'Active';	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (s.OpenDate > '1991-01-01' OR (s.ClosedDate < '2000-01-01' AND s.StatusType = 'Closed'))	california_schools
WITH EnrollmentDifferences AS (   SELECT      s.School,      s.DOCType,     (f.Enrollment('K-12') - f.Enrollment('Ages 5-17')) AS Diff   FROM      frpm f   JOIN      schools s ON f.CDSCode = s.CDSCode   WHERE      f.NSLP Provision Status = 'Locally funded' ), AvgDifference AS (   SELECT      AVG(Diff) AS AvgDiff   FROM      EnrollmentDifferences ) SELECT    ed.School,    ed.DOCType FROM    EnrollmentDifferences ed, AvgDifference ad WHERE    ed.Diff > ad.AvgDiff;	california_schools
SELECT `OpenDate` FROM `schools` WHERE `School` IS NOT NULL AND `School Type` = 'K-12 Schools (Public)' ORDER BY `Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT `schools.City`, MIN(`frpm.Enrollment (K-12)`) AS LowestEnrollment FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE `frpm.Low Grade` = '1' AND `frpm.High Grade` = '12' GROUP BY `schools.City` ORDER BY LowestEnrollment ASC LIMIT 5;	california_schools
SELECT      `Percent (%) Eligible Free (K-12)`  FROM      `frpm`  ORDER BY      `Enrollment (K-12)` DESC  LIMIT 10, 2;	california_schools
SELECT      `School Name`,      `FRPM Count (K-12)` / `Enrollment (K-12)` AS EligibleFRPMRate FROM      `frpm` WHERE      `School Type` = 'K-12 Schools (Public)'     AND `Educational Option Type` = 'Traditional'     AND `EdOpsCode` = '66' ORDER BY      `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT `schools`.`School`, `schools`.`Website` FROM `schools` JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode` WHERE `frpm`.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000 AND `frpm`.`CDSCode` IN (SELECT `CDSCode` FROM `frpm`);	california_schools
SELECT      frpm.CDSCode,      frpm.`Percent (%) Eligible Free (Ages 5-17)`  FROM      frpm  JOIN      schools  ON      frpm.CDSCode = schools.CDSCode  WHERE      schools.AdmFName1 = 'Kacey Gibson'      AND frpm.`Percent (%) Eligible Free (Ages 5-17)` IS NOT NULL;	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Enrollment (K-12)` = (SELECT MIN(`Enrollment (K-12)`) FROM frpm WHERE `Charter School (Y/N)` = 1);	california_schools
SELECT      s.AdmFName1, s.AdmLName1,      s.AdmFName2, s.AdmLName2,      s.AdmFName3, s.AdmLName3 FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.NumGE1500 IS NOT NULL AND sc.NumGE1500 > 0     AND s.StatusType = 'Active' ORDER BY      sc.NumGE1500 DESC LIMIT 1;	california_schools
SELECT Street, City, Zip, State FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.StatusType = 'Active' ORDER BY (satscores.NumGE1500 * 1.0 / satscores.NumTstTakr) ASC LIMIT 1;	california_schools
SELECT `schools`.`Website` FROM `schools` WHERE `schools`.`County` = 'Los Angeles' AND `satscores`.`NumTstTakr` BETWEEN 2000 AND 3000 AND `schools`.`CDSCode` = `satscores`.`cds`;	california_schools
SELECT AVG(NumTstTakr) AS AverageTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE YEAR(schools.OpenDate) = 1980;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' AND ss.AvgScrRead IS NOT NULL ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT      s.School FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      s.Virtual = 'F'     AND s.County = sc.dname GROUP BY      s.County, s.School ORDER BY      AVG(sc.AvgScrRead) DESC LIMIT 5;	california_schools
SELECT `schools`.`EdOpsName` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `satscores`.`AvgScrMath` = (     SELECT MAX(`AvgScrMath`)     FROM `satscores` );	california_schools
SELECT s.County, AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AvgAllSubjectScore FROM satscores AS sc JOIN schools AS s ON sc.cds = s.CDSCode WHERE s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite =      (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite)      FROM satscores      JOIN schools ON satscores.cds = schools.CDSCode) GROUP BY s.County;	california_schools
SELECT s.City, AVG(s.AvgScrWrite) AS AvgWritingScore FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.NumTstTakr = (     SELECT MAX(NumTstTakr)     FROM satscores     WHERE AvgScrRead + AvgScrMath + AvgScrWrite >= 1500 ) AND s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite >= 1500 GROUP BY s.City;	california_schools
SELECT      s.School,      AVG(s.AvgScrWrite) AS AverageWritingScore FROM      schools s JOIN      (SELECT           `AdmLName1` AS AdminLastName,           `AdmEmail1` AS AdminEmail      FROM           schools      WHERE           `AdmLName1` = 'Ulrich') admin ON      s.`AdmLName1` = admin.AdminLastName GROUP BY      s.School;	california_schools
SELECT `schools`.State, `frpm`.Enrollment(K-12) AS TotalEnrollment FROM `schools` JOIN `frpm` ON `schools`.CDSCode = `frpm`.CDSCode WHERE `schools`.DOC = '31' AND `frpm`.Academic Year = '2014-2015' ORDER BY `frpm`.Enrollment(K-12) DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS MonthlyAvgOpenings FROM schools WHERE County = 'Alameda'  AND DOC = '52' AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT     (COUNT(CASE WHEN s.DOC = '54' THEN 1 END) / NULLIF(COUNT(CASE WHEN s.DOC = '52' THEN 1 END), 0)) AS Ratio FROM     schools s WHERE     s.County = 'Orange'     AND s.DOC IN ('52', '54');	california_schools
SELECT      `schools.County`,      COUNT(*) AS `ClosedSchoolCount`,      GROUP_CONCAT(`schools.School` ORDER BY `schools.School` ASC SEPARATOR ', ') AS `SchoolNames`,      GROUP_CONCAT(`schools.ClosedDate` ORDER BY `schools.ClosedDate` ASC SEPARATOR ', ') AS `ClosureDates` FROM      `schools` WHERE      `schools.StatusType` = 'Closed' GROUP BY      `schools.County` ORDER BY      `ClosedSchoolCount` DESC LIMIT 1;	california_schools
SELECT      s.`School`,      s.`Street`,      s.`City`,      s.`Zip`,      s.`State` FROM      `schools` s JOIN      (SELECT          s2.CDSCode,          s2.AvgScrMath      FROM          `schools` s2      JOIN          (SELECT               `cname`,               AVG(`AvgScrMath`) AS AvgMath           FROM               `satscores`           GROUP BY               `cname`           ORDER BY               AvgMath DESC           LIMIT 6, 1) s3      ON          s2.CDSCode = s3.cname) s4 ON      s.CDSCode = s4.CDSCode;	california_schools
SELECT      s.MailStreet,      s.MailCity,      s.MailZip,      s.State,      sch.SchoolName FROM      `schools` s JOIN      `satscores` sc ON s.CDSCode = sc.cds JOIN      `frpm` fr ON s.CDSCode = fr.CDSCode JOIN      (SELECT           cds,           MIN(AvgScrRead) AS MinAvgRead      FROM           `satscores`      GROUP BY           cds) AS MinRead ON sc.cds = MinRead.cds JOIN      `schools` sch ON MinRead.cds = sch.CDSCode WHERE      sc.AvgScrRead = MinRead.MinAvgRead;	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Lakeport' AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500;	california_schools
SELECT SUM(s.NumTstTakr) AS TotalTestTakers FROM `schools` s JOIN `satscores` sc ON s.CDSCode = sc.cds WHERE s.MailCity = 'Fresno';	california_schools
SELECT s.CDSCode, s.MailZip FROM schools s JOIN (     SELECT AdmFName1     FROM schools     WHERE AdmFName1 = 'Avetik Atoian' ) AS admins ON s.AdmFName1 = admins.AdmFName1 WHERE s.StatusType = 'Active';	california_schools
SELECT      (COUNT(CASE WHEN s.County = 'Colusa' THEN 1 END) / COUNT(CASE WHEN s.County = 'Humboldt' THEN 1 END)) AS Ratio FROM      schools s WHERE      s.State = 'CA';	california_schools
SELECT COUNT(*) FROM schools WHERE `MailState` = 'CA' AND `City` = 'San Joaquin';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrWrite IS NOT NULL ORDER BY ss.AvgScrWrite DESC LIMIT 333, 1;	california_schools
SELECT `School`, `Phone`, `Ext` FROM `schools` WHERE `Zip` = '95203-3704';	california_schools
SELECT `Website` FROM `schools` WHERE `AdmFName1` = 'Mike' AND `AdmLName1` = 'Larson' UNION SELECT `Website` FROM `schools` WHERE `AdmFName2` = 'Mike' AND `AdmLName2` = 'Larson' UNION SELECT `Website` FROM `schools` WHERE `AdmFName3` = 'Mike' AND `AdmLName3` = 'Larson' UNION SELECT `Website` FROM `schools` WHERE `AdmFName1` = 'Dante' AND `AdmLName1` = 'Alvarez' UNION SELECT `Website` FROM `schools` WHERE `AdmFName2` = 'Dante' AND `AdmLName2` = 'Alvarez' UNION SELECT `Website` FROM `schools` WHERE `AdmFName3` = 'Dante' AND `AdmLName3` = 'Alvarez';	california_schools
SELECT `Website` FROM `schools` WHERE `Charter` = 1 AND `Virtual` = 'P' AND `County` = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Hickman' AND DOC = '52' AND Charter = 1 AND SchoolType LIKE '%Elementary%';	california_schools
SELECT COUNT(*) FROM frpm WHERE `Academic Year` = '2014-2015' AND `County Name` = 'Los Angeles' AND `Charter School (Y/N)` = 0 AND `Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT s.School, s.City, sa.AdmFName1, sa.AdmLName1 FROM schools s JOIN schools sa ON s.CDSCode = sa.CDSCode WHERE s.Charter = 1 AND sa.CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      ROUND(         (COUNT(CASE WHEN frpm.CharterFundingType = 'Locally funded' THEN 1 ELSE NULL END) * 100.0) /          COUNT(*),          2     ) AS PercentageLocallyFunded FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.County = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';	california_schools
SELECT SUM(`ClosedDate` = '1989-12-31') AS TotalClosedDistricts FROM `schools` WHERE `City` = 'San Francisco' AND `StatusType` = 'Closed' AND `DOC` = 'Community College District';	california_schools
SELECT `County` FROM `schools` WHERE `SOC` = '11' AND YEAR(`OpenDate`) BETWEEN 1980 AND 1989 AND `StatusType` = 'Closed' GROUP BY `County` ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT `NCESDist` FROM `schools` WHERE `SOC` = '31' AND `EdOpsCode` = '00';	california_schools
SELECT      SUM(CASE WHEN StatusType = 'Active' THEN 1 ELSE 0 END) AS Active_District_Community_Day_Schools,     SUM(CASE WHEN StatusType = 'Closed' THEN 1 ELSE 0 END) AS Closed_District_Community_Day_Schools FROM      schools WHERE      County = 'Alpine' AND     School LIKE '%Community Day School%';	california_schools
SELECT `District Code` FROM `schools` WHERE `City` = 'Fresno' AND `Magnet` = 0;	california_schools
SELECT      SUM(`Enrollment (Ages 5-17)`) AS TotalEnrollment FROM      `frpm` WHERE      `Academic Year` = '2014-2015'     AND `Educational Option Type` = 'State Special School'     AND `School Code` = '01100170123968';	california_schools
SELECT `FRPM Count (Ages 5-17)` FROM `frpm` WHERE `School Code` IN (     SELECT `School Code`     FROM `schools`     WHERE `MailStreet` = 'PO Box 1040' ) AND `Educational Option Type` = 'Youth Authority';	california_schools
SELECT MIN(`Low Grade`) AS Lowest_Grade FROM `frpm` WHERE `EdOpsCode` = 'SPECON' AND `NCESDist` = '0613360';	california_schools
SELECT `School Name`, `Educational Option Type` FROM `frpm` WHERE `County Code` = '37' AND `Educational Option Type` = 'Breakfast Provision 2';	california_schools
SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.EILCode = 'HS' AND f.`Educational Option Type` = 'Lunch Provision 2' AND f.Low Grade = '9' AND f.High Grade = '12' AND s.County = 'Merced';	california_schools
SELECT      s.School,      f.`Percent (%) Eligible FRPM (Ages 5-17)` FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.County = 'Los Angeles' AND      f.Low_Grade = 'K' AND      f.High_Grade = '9'	california_schools
SELECT `GSoffered` AS Grade_Span, COUNT(*) AS Count FROM `schools` WHERE `City` = 'Adelanto' GROUP BY `GSoffered` ORDER BY Count DESC LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS NumberOfSchools FROM      schools WHERE      County IN ('San Diego', 'Santa Barbara')      AND Virtual = 0 GROUP BY      County ORDER BY      NumberOfSchools DESC LIMIT 1;	california_schools
SELECT `School Name`, `Latitude`, `School Type` FROM `schools` ORDER BY `Latitude` DESC LIMIT 1;	california_schools
SELECT      s.City,      s.School,      s.LowGrade FROM      schools s WHERE      s.State = 'CA' ORDER BY      s.Latitude ASC LIMIT 1;	california_schools
SELECT `schools.CDSCode`, `schools.GSoffered`, `schools.GSserved` FROM `schools` ORDER BY ABS(`schools.Longitude`) DESC LIMIT 1;	california_schools
SELECT      s.City,     COUNT(DISTINCT frpm.CDSCode) AS NumberOfSchools FROM      frpm JOIN      schools s ON frpm.CDSCode = s.CDSCode WHERE      s.Magnet = 1 AND      s.GSoffered LIKE 'K-8%' AND      frpm.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY      s.City;	california_schools
SELECT      AdmFName1,      COUNT(AdmFName1) AS name_count,      District,      RANK() OVER (PARTITION BY District ORDER BY COUNT(AdmFName1) DESC) as district_rank FROM      schools WHERE      AdmFName1 IS NOT NULL AND      District IS NOT NULL GROUP BY      AdmFName1,      District ORDER BY      district_rank,      name_count DESC LIMIT 2;	california_schools
SELECT frpm.`Percent (%) Eligible Free (K-12)`, frpm.`District Code` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Alusine';	california_schools
SELECT s.LastUpdate, frpm.County Name AS County, frpm.School Name AS School, s.District AS District, adm.AdmLName1 AS AdminLastName FROM schools s JOIN frpm ON s.CDSCode = frpm.CDSCode JOIN schools adm ON frpm.CDSCode = adm.CDSCode WHERE frpm.Charter School Number = '40';	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND (DOC = '54' OR SOC = '62') AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (StatusType = 'Active' OR StatusType = 'Closed') AND (EdOpsName LIKE '%Intermediate%' OR EdOpsName LIKE '%Middle%' OR EdOpsName LIKE '%Unified%');	california_schools
SELECT s.AdmEmail1 AS AdminEmail, sname AS SchoolName FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 IS NOT NULL AND satscores.NumGE1500 > 0 ORDER BY satscores.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = a.account_id );	financial
SELECT      CASE          WHEN A12 > A13 THEN '1995'         ELSE '1996'     END AS higher_unemployment_year,     AVG(CASE WHEN year(date) = 1995 THEN A12 ELSE NULL END) AS avg_unemployment_1995,     AVG(CASE WHEN year(date) = 1996 THEN A13 ELSE NULL END) AS avg_unemployment_1996 FROM      district	financial
SELECT COUNT(*)  FROM district  WHERE A11 > 6000 AND A11 < 10000 AND A14 = 'F';	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A10 > 8000;	financial
SELECT a.account_id FROM account AS ac JOIN client AS cl ON ac.district_id = cl.district_id WHERE cl.gender = 'F' ORDER BY cl.birth_date ASC LIMIT 1;  SELECT MAX(cl.A11) - MIN(cl.A11) AS salary_gap FROM client AS cl WHERE cl.gender = 'F';	financial
SELECT c.client_id FROM client c JOIN district d ON c.district_id = d.district_id JOIN (     SELECT client_id, AVG(`A11`) AS avg_salary     FROM client     JOIN district ON client.district_id = district.district_id     GROUP BY client_id ) AS avg_salaries ON c.client_id = avg_salaries.client_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     JOIN district ON client.district_id = district.district_id     WHERE `A11` = avg_salaries.avg_salary )	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.k_symbol = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT';	financial
SELECT a.account_id, MIN(l.amount) AS min_approved_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE YEAR(l.date) = 1997 AND a.frequency = 'POPLATEK TYDNE' GROUP BY a.account_id ORDER BY min_approved_amount ASC LIMIT 1;	financial
SELECT account.account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND account.date LIKE '1993%' ORDER BY loan.amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov';	financial
SELECT `account_id` FROM `account` WHERE `date` BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY `date` ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000 GROUP BY a.account_id HAVING SUM(t.amount) > 3000;	financial
SELECT c.client_id FROM client c JOIN card cd ON c.client_id = cd.disp_id JOIN disp d ON c.client_id = d.client_id WHERE cd.issued = '1994-03-03';	financial
SELECT a.date  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount = 840  AND t.date = '1998-10-14';	financial
SELECT d.district_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS biggest_transaction_amount FROM `trans` t JOIN `card` c ON t.account_id = c.disp_id JOIN `disp` d ON t.account_id = d.account_id JOIN `client` cl ON d.client_id = cl.client_id WHERE c.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.district_id = a.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND d.A11 = (SELECT MAX(A11) FROM district);	financial
SELECT      t.amount  FROM      `trans` t JOIN      `client` c ON t.account_id = c.district_id JOIN      `loan` l ON t.account_id = l.account_id WHERE      l.amount = (SELECT MAX(amount) FROM `loan`) ORDER BY      t.date ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client JOIN account ON client.district_id = account.district_id JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik' AND client.gender = 'F';	financial
SELECT disp.disp_id FROM disp JOIN account ON disp.account_id = account.account_id JOIN trans ON account.account_id = trans.account_id WHERE trans.amount = 5100 AND DATE(trans.date) = '1998-09-02' AND trans.type = 'PRIJEM';	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Litomerice' AND YEAR(a.date) = 1996;	financial
SELECT d.A2 AS district_name FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(c.gender) AS male_clients_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'south Bohemia' AND d.A4 IS NOT NULL ORDER BY      d.A10 DESC LIMIT 1;	financial
SELECT      (a.balance_end - a.balance_start) / a.balance_start * 100 AS balance_increase_rate FROM (     SELECT          t1.balance AS balance_start,          t2.balance AS balance_end     FROM          (SELECT account_id, MAX(date) AS latest_date          FROM account          WHERE date BETWEEN '1993-03-22' AND '1998-12-27'          GROUP BY account_id) AS subq1     JOIN account AS t1 ON t1.account_id = subq1.account_id AND t1.date = subq1.latest_date     JOIN account AS t2 ON t2.account_id = subq1.account_id AND t2.date = '1998-12-27'     JOIN loan ON loan.account_id = t1.account_id     WHERE loan.date = (SELECT MIN(date) FROM loan WHERE date BETWEEN '1993-01-01' AND '1993-12-31') ) AS a;	financial
SELECT      (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS percentage_fully_paid FROM      loan l;	financial
SELECT      (COUNT(CASE WHEN l.amount < 100000 AND l.status = 'C' THEN 1 END) * 100.0) /      (COUNT(CASE WHEN l.amount < 100000 THEN 1 END)) AS running_no_issue_percentage FROM      loan l;	financial
SELECT a.account_id, d.A2, d.A3 FROM `account` a JOIN `district` d ON a.district_id = d.district_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON a.district_id = dt.district_id WHERE dt.A2 = 'Hl.m. Praha' AND a.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3, d.A11 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT      d.A2 AS district,     ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM      loan l JOIN      district d ON l.account_id IN (SELECT account_id FROM account WHERE district_id = d.district_id) WHERE      l.status = 'D' AND     d.A12 IS NOT NULL AND     d.A13 IS NOT NULL AND     YEAR(l.date) = 1996;	financial
SELECT      (COUNT(CASE WHEN T1.A2 = 'Decin' AND T2.date BETWEEN '1993-01-01' AND '1993-12-31' THEN 1 END) * 100.0) / COUNT(T2.account_id) AS percentage FROM      district AS T1 JOIN      account AS T2 ON T1.district_id = T2.district_id;	financial
SELECT `account_id` FROM `account` WHERE `frequency` = 'POPLATEK MESICNE' GROUP BY `account_id` HAVING COUNT(*) > 1;	financial
SELECT      d.A2 AS district,      COUNT(c.client_id) AS female_account_holders FROM      district d JOIN      client c ON d.district_id = c.district_id WHERE      c.gender = 'F' GROUP BY      d.A2 ORDER BY      female_account_holders DESC LIMIT      9;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' AND t.account_id NOT IN (SELECT card_id FROM card) GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.district_id = a.district_id LEFT JOIN card cr ON c.client_id = cr.disp_id JOIN disp d ON c.client_id = d.client_id WHERE d.account_id = a.account_id AND a.district_id IN (     SELECT district_id     FROM district     WHERE A3 = 'Jihočeský kraj' ) AND cr.card_id IS NULL;	financial
SELECT d.A3, COUNT(l.loan_id) AS active_loan_count FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY active_loan_count DESC LIMIT 1;	financial
SELECT AVG(amount) AS average_loan_amount FROM loan WHERE account_id IN (     SELECT account_id     FROM client     WHERE gender = 'M' );	financial
SELECT A2, A13 FROM `district` WHERE A13 = (SELECT MAX(A13) FROM `district` WHERE A11 = '1996')	financial
SELECT COUNT(a.account_id) AS num_accounts_opened FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1996 GROUP BY d.district_id ORDER BY SUM(CASE WHEN d.A16 IS NOT NULL THEN d.A16 ELSE 0 END) DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT account.account_id) FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.operation = 'VYBER KARTOU' AND account.frequency = 'POPLATEK MESICNE' AND trans.balance < 0;	financial
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.amount >= 250000 AND a.frequency = 'POPLATEK MESICNE' AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.status = 'A';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Hl.m. Praha' AND l.status IN ('C', 'D');	financial
SELECT COUNT(c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A15 = (     SELECT MAX(d2.A15) - 1     FROM district d2     WHERE d2.A15 < (SELECT MAX(A15) FROM district) );	financial
SELECT COUNT(*)  FROM `card` c JOIN `disp` d ON c.`disp_id` = d.`disp_id` WHERE c.`type` = 'gold' AND d.`type` = 'OWNER';	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Pisek';	financial
SELECT d.A2, SUM(t.amount) AS total_transactions FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE YEAR(t.date) = 1997 AND t.amount > 10000 GROUP BY d.A2 HAVING total_transactions > 10000;	financial
SELECT DISTINCT o.account_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `disp` d ON a.account_id = d.account_id JOIN `client` c ON d.client_id = c.client_id JOIN `district` dt ON c.district_id = dt.district_id WHERE dt.A2 = 'Pisek' AND o.k_symbol = 'SIPO';	financial
SELECT DISTINCT a.account_id FROM account a JOIN card c ON a.account_id = c.card_id WHERE c.type = 'gold';	financial
SELECT AVG(amount) AS average_credit_card_withdrawn FROM trans WHERE date BETWEEN '2021-01-01' AND '2021-12-31' AND type = 'VYBER KARTOU';	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.date BETWEEN '1998-01-01' AND '1998-12-31' AND t.operation = 'VYBER KARTOU' AND t.amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date BETWEEN '1998-01-01' AND '1998-12-31')	financial
SELECT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card cr ON a.account_id = cr.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND cr.type = 'gold';	financial
SELECT COUNT(DISTINCT account.account_id) FROM account JOIN client ON account.district_id = client.district_id JOIN district ON account.district_id = district.district_id WHERE client.gender = 'F' AND district.A3 LIKE '%south Bohemia%';	financial
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id JOIN disp ON account.account_id = disp.account_id WHERE district.A2 = 'Tabor' AND disp.type = 'OWNER';	financial
SELECT DISTINCT a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A11 BETWEEN 8000 AND 9000 AND a.account_id NOT IN (     SELECT DISTINCT l.account_id     FROM loan l     JOIN account a ON l.account_id = a.account_id     WHERE a.account_id IS NOT NULL     AND a.frequency = 'OWNER' );	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id JOIN trans t ON a.account_id = t.account_id WHERE dt.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT d.A2 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) as avg_crimes FROM district WHERE A3 IN (     SELECT A3     FROM district     WHERE A15 > 4000 ) AND A9 >= 1997	financial
SELECT COUNT(*)  FROM `account` a  JOIN `disp` d ON a.account_id = d.account_id  JOIN `card` c ON d.account_id = c.account_id  WHERE c.type = 'classic' AND d.type = 'OWNER';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT     (COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0) / COUNT(c.card_id) AS gold_card_percentage FROM     card c;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT d.A15 FROM district d JOIN account a ON d.district_id = a.district_id WHERE a.account_id = 532;	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT t.account_id, t.date, t.amount FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.client_id = 3356 AND t.type = 'PRIJEM' AND t.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 13539;	financial
SELECT d.A3 FROM `client` c JOIN `district` d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
SELECT d.A2, COUNT(a.account_id) AS total_accounts FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.A2 ORDER BY total_accounts DESC LIMIT 1;	financial
SELECT `client_id` FROM `order` WHERE `order_id` = 32423;	financial
SELECT trans.* FROM trans JOIN account ON trans.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE district.district_id = 5;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik');	financial
SELECT DISTINCT c.client_id FROM client c JOIN card cd ON c.client_id = cd.disp_id WHERE cd.type = 'junior' AND cd.issued >= '1997-01-01';	financial
SELECT      ROUND((COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_female FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A11 > 10000	financial
SELECT      ((SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) -      SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) /      SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END) * 100) AS growth_rate FROM      loan l JOIN      client c ON l.account_id IN (SELECT account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.gender = 'M') WHERE      YEAR(l.date) IN (1996, 1997);	financial
SELECT COUNT(*) FROM `trans` WHERE `type` = 'VYBER KARTOU' AND `date` > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN T3.A3 = 'North Bohemia' THEN T3.A16 ELSE 0 END) -       SUM(CASE WHEN T3.A3 = 'East Bohemia' THEN T3.A16 ELSE 0 END)) AS crime_difference FROM      T1 INNER JOIN      T2 ON T1.A2 = T2.A2 INNER JOIN      T3 ON T2.A2 = T3.A2 WHERE      T1.A3 = 'East Bohemia' AND T2.A3 = 'North Bohemia' AND T1.A4 = '1996'	financial
SELECT     SUM(CASE WHEN d.type = 'OWNER' THEN 1 ELSE 0 END) AS owners_count,     SUM(CASE WHEN d.type = 'DISPONENT' THEN 1 ELSE 0 END) AS disponents_count FROM     disp d JOIN     account a ON d.account_id = a.account_id WHERE     a.account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) AS statement_requests FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.account_id = 3 AND t.k_symbol = 'SIPO';  SELECT SUM(t.amount) AS total_debit_amount FROM trans t WHERE t.account_id = 3 AND t.k_symbol = 'DEBIT';	financial
SELECT      YEAR(c.birth_date) AS birth_year FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id WHERE      a.account_id = 130 AND d.type = 'OWNER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT      SUM(l.amount) AS total_debt,     AVG(l.payments) AS avg_payments FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.client_id = 992;	financial
SELECT      SUM(t.amount) AS total_sum,     c.gender FROM      trans t JOIN      account a ON t.account_id = a.account_id JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      t.account_id = (         SELECT              account_id          FROM              trans          WHERE              k_symbol = '851'     ) AND      c.client_id = 4 GROUP BY      c.gender;	financial
SELECT c.type FROM `card` c JOIN `disp` d ON c.disp_id = d.disp_id JOIN `client` cl ON d.client_id = cl.client_id WHERE cl.client_id = 9;	financial
SELECT SUM(t.amount) AS total_paid FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `disp` d ON a.account_id = d.account_id JOIN `client` c ON d.client_id = c.client_id WHERE c.client_id = 617 AND t.date BETWEEN '1998-01-01' AND '1998-12-31'	financial
SELECT c.client_id FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) AS male_customers_with_high_payment FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.k_symbol = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun' AND a.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.gender = 'F' AND cr.type = 'junior';	financial
SELECT     ROUND(         (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(*),         2     ) AS female_percentage FROM     client c JOIN     account a ON c.district_id = a.district_id JOIN     district d ON a.district_id = d.district_id WHERE     d.A3 = 'Prague'	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(DISTINCT CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN c.client_id END) AS male_clients_percentage FROM      account a JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A11 = (     SELECT MIN(A11) FROM district d2 JOIN client c2 ON d2.district_id = c2.district_id     WHERE c2.gender = 'F' ) ORDER BY c.birth_date DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE YEAR(client.birth_date) = 1920 AND district.A3 = 'East Bohemia';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24;	financial
SELECT      T.date AS transaction_date,     AVG(L.amount) AS average_loan_amount FROM      trans T JOIN      loan L ON T.account_id = L.account_id WHERE      L.status IN ('C', 'D') AND      T.frequency = 'POPLATEK PO OBRATU' GROUP BY      T.date;	financial
SELECT c.client_id, d.A2 FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER';	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE cr.type = 'gold' AND d.type = 'OWNER' AND EXISTS (     SELECT 1     FROM loan l     JOIN account a ON l.account_id = a.account_id     JOIN disp d ON a.account_id = d.account_id     WHERE c.client_id = d.client_id );	financial
SELECT `bond_type`, COUNT(*) as count FROM `bond` GROUP BY `bond_type` ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'cl' AND molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '-' );	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS average_oxygen_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS avg_single_bonded FROM `connected` c JOIN `bond` b ON c.bond_id = b.bond_id JOIN `molecule` m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage_of_carbon FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '=' GROUP BY      a.molecule_id	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` BETWEEN 'TR000' AND 'TR099' AND `label` = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR004_8_9'  UNION  SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c1.atom_id2 WHERE b.bond_type = '=';	toxicology
SELECT m.label, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT a1.atom_id, a2.atom_id FROM connected AS c1 JOIN connected AS c2 ON c1.bond_id = c2.bond_id JOIN atom AS a1 ON c1.atom_id = a1.atom_id JOIN atom AS a2 ON c2.atom_id2 = a2.atom_id JOIN molecule AS m ON c1.molecule_id = m.molecule_id WHERE m.label = '-' AND a1.atom_id != a2.atom_id;	toxicology
SELECT element, COUNT(*) AS count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element ORDER BY count ASC LIMIT 1;	toxicology
SELECT bond_type  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20')  OR (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element != 'sn' ) AND m.label IN ('+', '-');	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT DISTINCT c.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id OR a1.atom_id = c.atom_id2 JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181' UNION SELECT DISTINCT a2.atom_id FROM atom a2 JOIN connected c ON a2.atom_id = c.atom_id OR a2.atom_id = c.atom_id2 JOIN molecule m ON a2.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'f' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT a.atom_id), 2) AS percentage_fluorine_free_carcinogens FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND a.element <> 'f';	toxicology
SELECT      DIVIDE(SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100, COUNT(bond.bond_id)) AS percent FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT element, COUNT(*) as frequency FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY frequency DESC, element ASC LIMIT 3;	toxicology
SELECT a1.atom_id, a2.atom_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001';	toxicology
SELECT     (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference	toxicology
SELECT a1.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR000_2_5' AND a1.atom_id != a2.atom_id;	toxicology
SELECT bond_id  FROM connected  WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2';	toxicology
SELECT      m.molecule_id,      m.label FROM      molecule m JOIN      bond b ON m.molecule_id = b.molecule_id WHERE      b.bond_type = '=' GROUP BY      m.molecule_id,      m.label ORDER BY      m.label ASC LIMIT 5;	toxicology
SELECT ROUND((SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond_id), 5) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(CASE WHEN `molecule`.`label` = '+' THEN 1 ELSE 0 END) / COUNT(`molecule`.`molecule_id`)) * 100, 3) AS percent FROM `molecule`;	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100, 4) AS hydrogen_percentage FROM      atom a WHERE      a.molecule_id = 'TR206';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.molecule_id = 'TR000' GROUP BY bond.bond_type;	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';	toxicology
SELECT bond_type, COUNT(bond_type) AS bond_count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE m.label = '-' AND b.bond_type = '-' AND c.atom_id <> c.atom_id2 GROUP BY m.molecule_id ORDER BY m.molecule_id ASC LIMIT 3;	toxicology
SELECT bond_id, bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT b.bond_type, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_6_9';	toxicology
SELECT m.label AS molecule_label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(DISTINCT `bond_id`) AS connection_count FROM `connected` WHERE `atom_id` LIKE 'TR%_19' OR `atom_id2` LIKE 'TR%_19';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR004');	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'p' OR a2.element = 'p' OR a1.element = 'n' OR a2.element = 'n';	toxicology
SELECT      m.molecule_id,     COUNT(b.bond_type) AS double_bond_count FROM      molecule m JOIN      bond b ON m.molecule_id = b.molecule_id WHERE      b.bond_type = '=' GROUP BY      m.molecule_id ORDER BY      double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(b.bond_id)) / COUNT(a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'i';	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE SUBSTR(atom.atom_id, 7, 2) + 0 = 45;	toxicology
SELECT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id IS NULL;	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON a2.atom_id = c2.atom_id AND c2.bond_id = b.bond_id JOIN connected c3 ON a2.atom_id = c3.atom_id2 AND c3.bond_id = b.bond_id WHERE b.bond_type = '#' AND a1.molecule_id = 'TR041' AND a2.molecule_id = 'TR041';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT      m.molecule_id,      COUNT(b.bond_type) AS double_bond_count FROM      molecule m JOIN      bond b ON m.molecule_id = b.molecule_id WHERE      m.label = '+' AND b.bond_type = '=' GROUP BY      m.molecule_id ORDER BY      double_bond_count DESC LIMIT 1;	toxicology
SELECT element, COUNT(*) AS count FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY count LIMIT 1;	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a2.element = 'pb';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.atom_id = b.atom_id WHERE b.bond_type = '#' JOIN connected c ON b.bond_id = c.bond_id;	toxicology
SELECT      (COUNT(bond_id) * 100.0) /      (         SELECT COUNT(DISTINCT atom_id)         FROM atom         WHERE element = (             SELECT element             FROM atom             GROUP BY element             ORDER BY COUNT(*) DESC             LIMIT 1         )     ) AS percentage_of_common_bonds FROM bond;	toxicology
SELECT ROUND((SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(b.bond_id), 5) AS single_bond_carcinogenic_proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT COUNT(*) AS total_atoms FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT DISTINCT a2.atom_id2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 's';	toxicology
SELECT b.bond_type FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) AS num_elements FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_triple_bond_atoms FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '#' JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label IN ('p', 'br');	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '+';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id), 2) AS percentage_cl FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-';	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT DISTINCT `molecule_id` FROM `molecule` WHERE `label` = '-';	toxicology
SELECT COUNT(*)  FROM `molecule`  WHERE `molecule_id` BETWEEN 'TR000' AND 'TR030'    AND `label` = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON c.atom_id2 = c2.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 WHERE atom.element = 'i';	toxicology
SELECT      m.molecule_id,     CASE          WHEN MAX(m.label) = '+' THEN 'Carcinogenic'         ELSE 'Non-Carcinogenic'     END AS carcinogenicity FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.element = 'ca' GROUP BY      m.molecule_id	toxicology
SELECT EXISTS (     SELECT 1     FROM connected AS c1     JOIN connected AS c2 ON c1.bond_id = c2.bond_id AND c1.atom_id = c2.atom_id2     JOIN atom AS a1 ON c1.atom_id = a1.atom_id     JOIN atom AS a2 ON c2.atom_id2 = a2.atom_id     WHERE c1.bond_id = 'TR001_1_8'     AND a1.element = 'cl'     AND a2.element = 'c' ) AS has_chlorine_and_carbon;	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.molecule_id)) * 100, 2) AS percentage_cl FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+'	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001';	toxicology
SELECT bond.molecule_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '='	toxicology
SELECT c1.atom_id AS first_atom, c2.atom_id AS second_atom FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#' AND c1.atom_id < c2.atom_id;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      a.element,     m.label FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      molecule m ON c.molecule_id = m.molecule_id WHERE      m.label = '+' AND      a.atom_id LIKE 'TR%4' AND      LENGTH(SUBSTRING(a.atom_id, 7, 1)) = 1;	toxicology
SELECT      m.label,      (SELECT SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) FROM atom a WHERE a.molecule_id = 'TR006') /      (SELECT COUNT(*) FROM atom WHERE a.molecule_id = 'TR006') AS hydrogen_ratio FROM      molecule m  WHERE      m.molecule_id = 'TR006';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom AS a1 ON connected.atom_id = a1.atom_id JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id WHERE a1.element = 'c';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT      ROUND(         (COUNT(CASE WHEN bond.bond_type = '#' THEN 1 END) * 100.0) / COUNT(*),          2     ) AS triple_bond_percentage FROM      bond JOIN      connected ON bond.bond_id = connected.bond_id JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      bond.bond_type = '#';	toxicology
SELECT      (SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) / COUNT(bond.bond_id)) * 100 AS percent FROM      bond JOIN      connected ON bond.bond_id = connected.bond_id JOIN      atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE      atom.molecule_id = 'TR047';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id = 'TR151' AND label = '+';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR151' AND a.element IN ('cl', 'br', 'i', 'pb', 'te');	toxicology
SELECT COUNT(DISTINCT `molecule_id`)  FROM `molecule`  WHERE `label` = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.molecule_id BETWEEN 'TR010' AND 'TR050';	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT molecule.molecule_id  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  JOIN atom AS a1 ON connected.atom_id = a1.atom_id  JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id  WHERE a1.atom_id = 'TR000_1' AND bond.bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT a.molecule_id) AS percentage_carcinogenic_with_hydrogen FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT      CASE          WHEN m.label = '+' THEN 'Yes'         ELSE 'No'     END AS carcinogenicity FROM      molecule m WHERE      m.molecule_id = 'TR124';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR186';	toxicology
SELECT `bond_type` FROM `bond` WHERE `bond_id` = 'TR007_4_19';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT      COUNT(c.bond_id) AS double_bond_count,     m.label AS carcinogenicity FROM      connected c JOIN      bond b ON c.bond_id = b.bond_id JOIN      molecule m ON c.molecule_id = m.molecule_id WHERE      m.molecule_id = 'TR006' AND      b.bond_type = '='	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id;	toxicology
SELECT b.bond_id, a1.atom_id, a2.atom_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element SEPARATOR ', ') AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' GROUP BY m.molecule_id;	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'cl';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR346';  SELECT COUNT(DISTINCT bond.bond_type)  FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR346';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN (     SELECT DISTINCT a.molecule_id     FROM atom a     JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2     JOIN bond b ON c.bond_id = b.bond_id     WHERE b.bond_type = '=' ) AND molecule_id NOT IN (     SELECT DISTINCT a.molecule_id     FROM atom a     WHERE a.element = 's' );	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(T1.molecule_id) AS percentage FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T1.label = '+';	toxicology
SELECT molecule_id  FROM bond  WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2' OR connected.atom_id = 'TR000_2' AND connected.atom_id2 = 'TR000_1';	toxicology
SELECT m.label AS molecule FROM atom a1 JOIN atom a2 ON a1.molecule_id = a2.molecule_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE a1.atom_id = 'TR000_2' OR a2.atom_id = 'TR000_4';	toxicology
SELECT element  FROM atom  WHERE atom_id = 'TR000_1';	toxicology
SELECT `molecule_id`, `label` FROM `molecule` WHERE `molecule_id` = 'TR000';	toxicology
SELECT      ROUND(         (SUM(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond.bond_id),          2     ) AS percentage FROM      bond;	toxicology
SELECT COUNT(*) FROM `atom` a JOIN `molecule` m ON a.molecule_id = m.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN connected c ON m.molecule_id = c.atom_id JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.atom_id > 5 GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.element IN ('c', 'cl', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT a.molecule_id) AS percentage_carcinogenic_with_triple_bond_H FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN connected c ON m.molecule_id = c.atom_id OR m.molecule_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT c.molecule_id) FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR002');	toxicology
SELECT c1.atom_id FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a ON c1.atom_id = a.atom_id WHERE a.element = 'c' AND b.bond_type = '=' AND c1.atom_id != c2.atom_id AND EXISTS (     SELECT 1     FROM connected c3     WHERE c3.atom_id = c1.atom_id AND c3.bond_id != c1.bond_id     AND EXISTS (         SELECT 1         FROM connected c4         WHERE c4.bond_id = c3.bond_id AND c4.bond_type = '='     ) ) AND EXISTS (     SELECT 1     FROM connected c5     WHERE c5.atom_id = c2.atom_id AND c5.bond_id != c2.bond_id     AND EXISTS (         SELECT 1         FROM connected c6         WHERE c6.bond_id = c5.bond_id AND c6.bond_type = '='     ) );	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM `cards` WHERE `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;	card_games
SELECT c.id, c.name, c.borderColor FROM cards c WHERE c.borderColor = 'borderless' AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL	card_games
SELECT name FROM cards WHERE convertedManaCost < MAX(faceConvertedManaCost);	card_games
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT l.uuid, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Artifact%' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.id FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel' AND r.text LIKE '%rulings%' UNION SELECT c.id FROM cards c WHERE c.artist = 'Stephen Daniel' AND c.hasContentWarning = 1;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, COUNT(r.uuid) as ruling_count FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.isPromo = 1 GROUP BY c.name, c.artist ORDER BY ruling_count DESC LIMIT 1;	card_games
SELECT language, name  FROM foreign_data  WHERE name = 'Annul' AND number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN t.language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_of_cards_in_Chinese_Simplified FROM      cards c JOIN      set_translations t ON c.scryfallOracleId = t.uuid;	card_games
SELECT      st.translation AS set_name_italian,     s.totalSetSize AS total_cards FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT `type`) AS NumberOfCardTypes FROM `cards` WHERE `artist` = 'Aaron Boyd';	card_games
SELECT `keywords` FROM `cards` WHERE `name` = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT `promoTypes` FROM `cards` WHERE `name` = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT t.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations t ON s.code = t.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT r.text AS ruling_description FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT type  FROM cards  WHERE name = 'Benalish Knight';	card_games
SELECT `rulings`.`text` FROM `rulings` JOIN `cards` ON `rulings`.`uuid` = `cards`.`uuid` WHERE `cards`.`name` = 'Benalish Knight' AND `legalities`.`format` = 'commander';	card_games
SELECT DISTINCT cards.artist  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE foreign_data.language = 'Phyrexian'  AND cards.name = 'Phyrexian';	card_games
SELECT      (COUNT(CASE WHEN `cards`.`borderColor` = 'borderless' THEN 1 END) * 100.0) / COUNT(`cards`.`id`) AS borderless_percentage FROM      `cards`;	card_games
SELECT COUNT(*) FROM cards WHERE artist IS NOT NULL AND artist LIKE '%German%' AND id IN (SELECT uuid FROM foreign_data WHERE language = 'German') AND isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'borderless' AND `flavorText` LIKE '%Русский%'	card_games
SELECT      (SELECT COUNT(*)       FROM cards       WHERE language = 'French' AND isStorySpotlight = 1) * 100.0 /      (SELECT COUNT(*)       FROM cards       WHERE isStorySpotlight = 1) AS percentage_French_StorySpotlight_cards;	card_games
SELECT COUNT(*) FROM `cards` WHERE `toughness` = '99';	card_games
SELECT name FROM `cards` WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'black' AND `availability` = 'mtgo';	card_games
SELECT id  FROM cards  WHERE convertedManaCost = 0;	card_games
SELECT `layout` FROM `cards` WHERE `keywords` LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE type LIKE '%Summon%' AND type LIKE '%Angel%' AND subtypes NOT LIKE '%Angel%';	card_games
SELECT c.id FROM cards c WHERE c.hasFoil = 1 AND c.hasNonFoil = 1 AND (c.cardKingdomFoilId IS NOT NULL OR c.cardKingdomId IS NOT NULL);	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT `edhrecRank` FROM `cards` WHERE `frameVersion` = '2015';	card_games
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON c.setCode = st.setCode WHERE fd.language = 'Chinese Simplified' AND st.language = 'Chinese Simplified';	card_games
SELECT * FROM cards WHERE availability LIKE '%paper%' AND flavorText LIKE '%日本語%' AND flavorText NOT LIKE '%%日本語%日本語%';	card_games
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT c.uuid, fd.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = 'future' AND id IN (     SELECT uuid     FROM legalities     WHERE status = 'legal' );	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT cards.name, rulings.date FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf';	card_games
SELECT      c.colors,      l.format  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  WHERE      c.id BETWEEN 1 AND 20;	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language IS NOT NULL;	card_games
SELECT name FROM cards WHERE rarity = 'uncommon' ORDER BY (SELECT date FROM rulings WHERE uuid = cards.uuid) LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM `cards` WHERE `frameVersion` = '1993' AND `availability` = 'paper' AND `hasContentWarning` = 1;	card_games
SELECT manaCost  FROM cards  WHERE layout = 'normal'  AND frameVersion = '2003'  AND borderColor = 'black'  AND availability = 'mtgo,paper';	card_games
SELECT SUM(CASE WHEN `artist` = 'Rob Alexander' THEN `manaCost` ELSE 0 END) AS total_unconverted_mana_cost FROM `cards` WHERE `artist` = 'Rob Alexander';	card_games
SELECT DISTINCT `type` FROM `cards` WHERE `availability` = 'arena';	card_games
SELECT DISTINCT s.setCode FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE fd.language = 'Spanish';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN `cards`.`frameEffects` = 'legendary' AND `cards`.`isOnlineOnly` = 1 THEN 1 END) * 100.0) / COUNT(`cards`.`id`),         2     ) AS legendary_frame_effect_cards_percentage FROM      `cards` WHERE      `cards`.`frameEffects` = 'legendary';	card_games
SELECT      ROUND(         (SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) * 100.0) /          (SELECT COUNT(*) FROM cards c WHERE c.isStorySpotlight = 1)     , 2) AS percentage_without_textbox,     c.id FROM      cards c GROUP BY      c.id ORDER BY      c.id;	card_games
SELECT     c.name,     ROUND((SUM(CASE WHEN fd.language = 'Spanish' THEN 1 ELSE 0 END) / COUNT(c.id)) * 100, 2) AS percentage_spanish FROM     cards c LEFT JOIN     foreign_data fd ON c.uuid = fd.uuid GROUP BY     c.name ORDER BY     percentage_spanish DESC;	card_games
SELECT t.language FROM set_translations t JOIN sets s ON t.setCode = s.code WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT id FROM cards WHERE type LIKE '%Creature%' AND id IN (SELECT uuid FROM legalities WHERE status = 'Legal');	card_games
SELECT subtypes, supertypes FROM cards WHERE subtypes IS NOT NULL AND supertypes IS NOT NULL AND (language = 'German' OR flavorText LIKE '%German%') GROUP BY subtypes, supertypes;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'premodern'    AND c.side IS NULL   AND EXISTS (     SELECT 1     FROM rulings r     JOIN cards r_c ON r.uuid = r_c.uuid     WHERE r_c.uuid = c.uuid       AND r.text LIKE '%triggered mana ability%'   );	card_games
SELECT id  FROM cards  WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND uuid IN (SELECT uuid FROM legalities WHERE format = 'pauper' AND status = 'Legal');	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT `name` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.artist` = 'Matthew D. Wilson' AND `foreign_data.language` = 'French' AND `cards.borderColor` = 'black' AND `cards.layout` = 'normal' AND `cards.type` = 'Creature';	card_games
SELECT COUNT(*) FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2007-02-01';	card_games
SELECT language  FROM sets  WHERE baseSetSize = 180 AND block = 'Ravnica';	card_games
SELECT      ROUND((COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id), 2) AS percentageWithoutContentWarning FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      (COUNT(*) FILTER (WHERE `language` = 'French' AND (`power` IS NULL OR `power` = '*')) * 100.0) /      COUNT(*) FILTER (WHERE `power` IS NULL OR `power` = '*') FROM `cards`	card_games
SELECT      ROUND(         (COUNT(CASE WHEN t.language = 'Japanese' THEN 1 END) * 100.0) / COUNT(*),         2     ) AS percentage_japanese_expansion_sets FROM      set_translations t JOIN      sets s ON t.setCode = s.code WHERE      s.type = 'expansion';	card_games
SELECT `availability` FROM `cards` WHERE `artist` = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE `edhrecRank` > 12000 AND `borderColor` = 'borderless' AND `colors` IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name, power FROM cards WHERE (power IS NULL OR power = '*')   AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT `language` FROM `foreign_data` WHERE `multiverseid` = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN cards.isTextless = 1 AND cards.layout = 'normal' THEN 1 END) / COUNT(cards.id)) * 100 AS proportion FROM cards;	card_games
SELECT c.number FROM cards c WHERE c.subtypes LIKE '%Angel%'    AND c.subtypes LIKE '%Wizard%'   AND c.otherFaceIds IS NULL;	card_games
SELECT `name` FROM `sets` WHERE `mtgoCode` IS NULL OR `mtgoCode` = '' ORDER BY `name` ASC LIMIT 3;	card_games
SELECT language  FROM set_translations  WHERE setCode = 'ARC' AND mcmName = 'Archenemy';	card_games
SELECT `name`, `translation` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `sets.id` = 5;	card_games
SELECT t.language, s.type FROM set_translations t JOIN sets s ON t.setCode = s.code WHERE s.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND EXISTS (     SELECT 1     FROM set_translations     WHERE sets.code = set_translations.setCode     AND set_translations.language = 'Japanese' );	card_games
SELECT s.name, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      ROUND((COUNT(CASE WHEN `cards`.isOnlineOnly = 1 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage FROM      `cards` JOIN      `set_translations` ON `cards.setCode` = `set_translations.setCode` WHERE      `set_translations.language` = 'Chinese Simplified';	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language  FROM set_translations  WHERE setCode = '10E';	card_games
SELECT `name`  FROM `sets`  WHERE `code` = 'ALL';	card_games
SELECT `language` FROM `foreign_data` WHERE `name` = 'A Pedra Fellwar';	card_games
SELECT `code` FROM `sets` WHERE `releaseDate` = '2007-07-13';	card_games
SELECT `sets`.`baseSetSize`, `sets`.`code` FROM `sets` WHERE `sets`.`block` IN ('Masques', 'Mirage');	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT fd.name, c.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'Boros' AND c.watermark = 'Boros';	card_games
SELECT      f.language,      f.flavorText,      c.type FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      c.watermark = 'Color Pie';	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(*) AS percentage_of_10cmc_cards FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      c.name = 'Abyssal Horror'	card_games
SELECT code  FROM sets  WHERE type = 'expansion' AND code IN (SELECT setCode FROM legalities WHERE format = 'commander');	card_games
SELECT      fd.name AS foreign_name,      c.type FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.watermark = 'Abzan';	card_games
SELECT      `cards`.`type`,      `foreign_data`.`language` FROM      `cards` JOIN      `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` WHERE      `cards`.`watermark` = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT `name` FROM `cards` WHERE `isTextless` = 0;	card_games
SELECT faceConvertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL;	card_games
SELECT subtypes, supertypes  FROM cards  WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE `availability` LIKE '%arena,mtgo%' AND `borderColor` = 'black';	card_games
SELECT      CASE          WHEN c1.convertedManaCost > c2.convertedManaCost THEN 'Serra Angel'         ELSE 'Shrine Keeper'     END AS CardWithHigherManaCost,     MAX(c1.convertedManaCost) AS HigherManaCost FROM      cards c1 JOIN      cards c2 ON c1.convertedManaCost > c2.convertedManaCost WHERE      c1.name = 'Serra Angel' AND c2.name = 'Shrine Keeper';	card_games
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT t.translation  FROM sets s  JOIN set_translations t ON s.code = t.setCode  WHERE s.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean' );	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Eighth Edition')  AND language = 'Chinese Simplified';	card_games
SELECT s.name  FROM sets s  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT `releaseDate` FROM `sets` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `type` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `translation` = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;	card_games
SELECT * FROM cards WHERE name = 'Adarkar Valkyrie' AND sets.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND setCode = 'Coldsnap';	card_games
SELECT name, MAX(convertedManaCost) as MaxCMC FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') GROUP BY name ORDER BY MaxCMC DESC LIMIT 1;	card_games
SELECT DISTINCT artist  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap'  AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT `number` FROM `cards` WHERE `name` = 'Coldsnap' AND `number` = '4';	card_games
SELECT COUNT(*) FROM cards AS C JOIN sets AS S ON C.setCode = S.code WHERE S.name = 'Coldsnap' AND C.convertedManaCost > 5 AND (C.power = '*' OR C.power IS NULL);	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT `language` FROM `foreign_data` WHERE `name` = 'Ancestor''s Chosen' AND `flavorText` IS NOT NULL;	card_games
SELECT `type` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.name` = 'Ancestor''s Chosen' AND `foreign_data.language` = 'German';	card_games
SELECT cards.name, rulings.text AS ruling FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode JOIN rulings ON cards.uuid = rulings.uuid WHERE set_translations.translation = 'Set Base Decima Edizione' AND set_translations.language = 'Italian' AND cards.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT      t.translation AS cardName_Italian FROM      cards c JOIN      set_translations t ON c.setCode = t.setCode WHERE      c.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND     t.language = 'Italian' AND     c.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap'))	card_games
SELECT date  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Reminisce';	card_games
SELECT      ROUND((SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) / COUNT(cards.id)) * 100, 2) AS percentage_of_cards_with_cmc_7 FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Coldsnap';	card_games
SELECT      ROUND((COUNT(*) FILTER (WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL) * 100.0) / COUNT(*), 2) AS percentage_incredibly_powerful FROM cards WHERE name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT `keyruneCode` FROM `sets` WHERE `code` = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT `type` FROM `sets` WHERE `name` LIKE '%From the Vault: Lore%';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT      c.name,     r.text AS ruling_text,     CASE          WHEN c.hasContentWarning = 1 THEN 'Yes'         ELSE 'No'     END AS has_content_warning FROM      cards c LEFT JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Jim Pavelec';	card_games
SELECT `sets.releaseDate` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `cards.name` = 'Evacuation';	card_games
SELECT baseSetSize FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE translation = 'Huitième édition';	card_games
SELECT t.translation FROM cards c JOIN set_translations t ON c.setCode = t.setCode JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.name = 'Tendo Ice Bridge' AND t.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition');	card_games
SELECT st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT `name`, `convertedManaCost` FROM `cards` WHERE `setCode` = 'Journey into Nyx Hero''s Path' ORDER BY `convertedManaCost` DESC LIMIT 1;	card_games
SELECT releaseDate  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE translation = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;	card_games
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setCode = 'Mirrodin';	card_games
SELECT      (SUM(CASE WHEN t1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN t1.language = 'Japanese' THEN 1 ELSE 0 END) FROM      cards AS t1 JOIN      set_translations AS t2 ON t1.uuid = t2.uuid WHERE      t1.uuid IN (SELECT uuid FROM foreign_data WHERE language = 'Japanese')	card_games
SELECT      (SUM(CASE WHEN sets.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN sets.isOnlineOnly = 1 OR set_translations.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END) FROM      cards JOIN      set_translations ON cards.setCode = sets.setCode WHERE      set_translations.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT c.availability  FROM cards c  WHERE c.artist != 'Aleksi Briclot' AND c.isTextless = 1;	card_games
SELECT id  FROM sets  WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL)	card_games
SELECT MAX(frameEffects) AS most_common_frame_effect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM `cards` WHERE `power` IS NULL OR `power` = '*' AND `hasFoil` = 0 AND `duelDeck` = 'a';	card_games
SELECT id  FROM sets  WHERE type = 'commander'  AND isFoilOnly = 0  AND isForeignOnly = 0  AND isNonFoilOnly = 0  AND isOnlineOnly = 0  AND isPartialPreview = 0  ORDER BY totalSetSize DESC  LIMIT 1;	card_games
SELECT id, name, MAX(convertedManaCost) AS max_cost FROM cards WHERE format = 'duel' GROUP BY id, name ORDER BY max_cost DESC LIMIT 10;	card_games
SELECT s.releaseDate, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE c.rarity = 'mythic' AND l.status = 'legal' ORDER BY s.releaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.artist = 'Volkan Baǵa' AND foreign_data.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT      `legalities.format` AS play_format,      GROUP_CONCAT(`cards.name` ORDER BY `cards.name` ASC) AS banned_cards FROM      `legalities` INNER JOIN      `cards` ON `legalities.uuid` = `cards.uuid` WHERE      `legalities.status` = 'Banned' GROUP BY      `legalities.format` ORDER BY      COUNT(`legalities.status = 'Banned'`) DESC LIMIT 1;	card_games
SELECT language  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.name = 'Battlebond';	card_games
SELECT artist,         (SELECT GROUP_CONCAT(DISTINCT format)         FROM legalities          WHERE legalities.uuid IN (SELECT cards.uuid                                   FROM cards                                   WHERE cards.artist = artist)) FROM cards  GROUP BY artist  ORDER BY COUNT(*) ASC  LIMIT 1;	card_games
SELECT c.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND l.format = 'legacy' AND (c.hasContentWarning = 1 OR c.isOnlineOnly = 1)	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.edhrecRank = 1 AND legalities.status = 'Banned';	card_games
SELECT AVG(id) AS annual_avg_sets, MAX(COUNT(language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate);	card_games
SELECT DISTINCT artist FROM cards WHERE bordercolor = 'black' AND availability = 'arena';	card_games
SELECT DISTINCT l.uuid FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted');	card_games
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'Matthew D. Wilson' AND `availability` = 'paper';	card_games
SELECT r.text, r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' LEFT JOIN set_translations st_japanese ON s.code = st_japanese.setCode AND st_japanese.language = 'Japanese' WHERE st_japanese.id IS NULL;	card_games
SELECT c.name, c.frameVersion FROM cards c WHERE c.artist = 'Allen Williams';  SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned';	card_games
SELECT      CASE WHEN u.DisplayName = 'Harlan' THEN 'Harlan'          WHEN u.DisplayName = 'Jarrod Dixon' THEN 'Jarrod Dixon'     END AS UserName,     MAX(u.Reputation) AS MaxReputation FROM      users u WHERE      u.DisplayName = 'Harlan' OR      u.DisplayName = 'Jarrod Dixon' GROUP BY      u.DisplayName;	codebase_community
SELECT `DisplayName` FROM `users` WHERE YEAR(`CreationDate`) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT `users.DisplayName` FROM `users` WHERE `users.Id` = (SELECT `users.Id`                    FROM `users`                    INNER JOIN `posts` ON `users.Id` = `posts.OwnerUserId`                    GROUP BY `users.Id`                    ORDER BY SUM(`posts.ViewCount`) DESC                    LIMIT 1);	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 10 AND YEAR(u.CreationDate) > 2013	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts' AND OwnerUserId = users.Id AND users.DisplayName = OwnerDisplayName;	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT OwnerDisplayName FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(`CommentCount`) AS TotalComments FROM `posts` WHERE `OwnerDisplayName` = 'csgillespie'	codebase_community
SELECT      p.Id,      p.AnswerCount FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName = 'csgillespie' AND      p.AnswerCount = (SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = u.Id)	codebase_community
SELECT `LastEditorDisplayName` FROM `posts` WHERE `Title` = 'Examples for teaching: Correlation does not mean causation' AND `LastEditorUserId` IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20;	codebase_community
SELECT u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) ORDER BY p.Id LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  GROUP BY u.DisplayName  ORDER BY COUNT(b.Id) DESC  LIMIT 1;	codebase_community
SELECT AVG(posts.Score) AS average_score FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(b.Count) AS average_badges FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200;	codebase_community
SELECT      (COUNT(CASE WHEN u.Age > 65 THEN p.Id ELSE NULL END) * 100.0) / COUNT(p.Id) AS PercentageOfElderUsers FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT MAX(CreationDate)  FROM votes WHERE CreationDate = (SELECT MAX(COUNT(Id)) FROM votes);	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT c.Id, COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount = 1910 GROUP BY c.PostId;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0'	codebase_community
SELECT Text  FROM comments  WHERE PostId = (SELECT Id FROM posts WHERE ParentId = 107829)  AND CommentCount = 1;	codebase_community
SELECT      p.Id AS PostId,      p.Title,      p.ClosedDate,      CASE          WHEN p.ClosedDate IS NULL THEN 'Open'          ELSE 'Closed'      END AS PostStatus FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (     SELECT Id      FROM users      WHERE DisplayName = 'Tiago Pasqualini' );	codebase_community
SELECT `users.DisplayName` FROM `votes` JOIN `users` ON `votes.UserId` = `users.Id` WHERE `votes.Id` = 6347;	codebase_community
SELECT SUM(v.VoteTypeId = 2) AS NumberOfUpVotes FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      (COUNT(posts.Id) / COUNT(votes.Id)) AS post_to_vote_ratio FROM      posts LEFT JOIN      votes ON posts.OwnerUserId = votes.UserId WHERE      posts.OwnerUserId = 24;	codebase_community
SELECT ViewCount  FROM posts  WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT c.UserId, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93'	codebase_community
SELECT `Id`, `PostId`, `Score`, `Text`, `CreationDate`, `UserId`, `UserDisplayName` FROM `comments` WHERE `UserDisplayName` = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text AS CommentText FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT ph.LastEditorDisplayName AS EditorDisplayName FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'Open source tools for visualizing multi-dimensional data' AND ph.Text IS NOT NULL AND ph.LastEditorUserId IS NOT NULL AND ph.LastEditorUserId IN (SELECT Id FROM users WHERE DisplayName IS NOT NULL) ORDER BY ph.CreationDate DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY p.LastEditorUserId, u.WebsiteUrl;	codebase_community
SELECT c.Text, c.CreationDate, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM posts WHERE Title LIKE '%data%' AND PostId IN (SELECT PostId FROM votes WHERE BountyAmount IS NOT NULL);	codebase_community
SELECT u.DisplayName FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, c.Text, AVG(p.ViewCount) as AvgViewCount FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN comments c ON p.Id = c.PostId WHERE t.TagName = 'humor' GROUP BY p.Id, c.Text	codebase_community
SELECT COUNT(*) AS TotalComments FROM comments WHERE UserId = 13;	codebase_community
SELECT `Id` FROM `users` ORDER BY `Reputation` DESC LIMIT 1	codebase_community
SELECT `UserId`, MIN(`Views`) AS MinViews FROM `users` GROUP BY `UserId` ORDER BY MinViews ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Supporter' AND Date BETWEEN '2011-01-01' AND '2011-12-31'	codebase_community
SELECT `UserId`, COUNT(`Name`) as `BadgeCount` FROM `badges` GROUP BY `UserId` HAVING `BadgeCount` > 5;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT p.OwnerUserId FROM posts p WHERE p.ViewCount >= 1000 GROUP BY p.OwnerUserId HAVING COUNT(DISTINCT ph.Id) = 1;	codebase_community
SELECT      c.UserId,      u.DisplayName,      b.Name AS BadgeName FROM      comments c JOIN      users u ON c.UserId = u.Id JOIN      badges b ON u.Id = b.UserId WHERE      c.UserId = (         SELECT              UserId          FROM              comments          GROUP BY              UserId          ORDER BY              COUNT(*) DESC          LIMIT 1     );	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT     (         (SUM(CASE WHEN Year(b.Date) = 2010 THEN 1 ELSE 0 END) / SUM(1)) -          (SUM(CASE WHEN Year(b.Date) = 2011 THEN 1 ELSE 0 END) / SUM(1))     ) * 100 AS PercentageDifference FROM badges b WHERE b.Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT p.Id AS PostId, u.Id AS UserId FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) AS TotalFavoriteCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Id = 686 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT      AVG(u.UpVotes) + AVG(u.Age) AS avg_upvotes_and_age FROM      users u JOIN      (SELECT          OwnerUserId,          COUNT(*) AS post_count      FROM          posts      GROUP BY          OwnerUserId      HAVING          COUNT(*) > 10) AS p ON      u.Id = p.OwnerUserId	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Announcer';	codebase_community
SELECT Name  FROM badges  WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      (COUNT(CASE WHEN b.Name = 'Teacher' THEN b.UserId END) * 100.0) / COUNT(DISTINCT b.UserId) AS TeacherBadgePercentage FROM badges b JOIN users u ON b.UserId = u.Id	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN b.UserId END) * 100.0) / COUNT(b.UserId),         2     ) AS PercentageOfTeenagers FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'	codebase_community
SELECT SUM(c.Score) AS TotalCommentScore FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT users.Age  FROM users  JOIN badges ON users.Id = badges.UserId  WHERE users.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfAdultSupporters FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND UserId IN (     SELECT Id     FROM users     WHERE Age > 65 );	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT `users`.`DisplayName`, MAX(`users`.`Views`) AS `MaxViews` FROM `users` GROUP BY `users`.`DisplayName` ORDER BY `MaxViews` DESC LIMIT 1;	codebase_community
SELECT      DIVIDE(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id END), COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id END)) FROM votes	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo');	codebase_community
SELECT COUNT(*) FROM votes JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'Harlan';	codebase_community
SELECT `posts.Id`  FROM `posts`  JOIN `users` ON `posts.OwnerUserId` = `users.Id`  WHERE `users.DisplayName` = 'slashnick'  ORDER BY `posts.AnswerCount` DESC  LIMIT 1;	codebase_community
SELECT      CASE          WHEN SUM(p.ViewCount) > (SELECT MAX(SUM(p2.ViewCount))                                    FROM posts p2                                    WHERE p2.OwnerDisplayName = 'Harvey Motulsky'                                      OR p2.OwnerDisplayName = 'Noah Snyder')               THEN 'Harvey Motulsky'         ELSE 'Noah Snyder'     END AS MorePopularAuthor,     SUM(p.ViewCount) AS TotalViewCount FROM      posts p WHERE      p.OwnerDisplayName = 'Harvey Motulsky'      OR p.OwnerDisplayName = 'Noah Snyder' GROUP BY      p.OwnerDisplayName	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Matt Parker' AND p.PostId > 4;	codebase_community
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN p.Id IN (SELECT PostId FROM tags WHERE TagName = 'r') THEN 1 END) * 100.0) /      COUNT(CASE WHEN u.DisplayName = 'Community' THEN 1 END) AS percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName = 'Community'	codebase_community
SELECT      (SELECT SUM(ViewCount)       FROM posts       JOIN users ON posts.OwnerUserId = users.Id       WHERE users.DisplayName = 'Mornington') -      (SELECT SUM(ViewCount)       FROM posts       JOIN users ON posts.OwnerUserId = users.Id       WHERE users.DisplayName = 'Amos') AS ViewCountDifference;	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  WHERE b.Name = 'Commentator'  AND YEAR(b.Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT `LastEditorUserId`, `LastEditDate` FROM `posts` WHERE `Title` = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) AS NegativeCommentsCount FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT      c.Text AS CommentText,      u.DisplayName AS CommenterDisplayName FROM      comments c JOIN      users u ON c.UserId = u.Id WHERE      c.Score > 60 JOIN      posts p ON c.PostId = p.Id;	codebase_community
SELECT Name  FROM badges  WHERE Date BETWEEN '2011-01-01' AND '2011-12-31'  AND UserId IN (SELECT Id FROM users WHERE Location = 'North Pole');	codebase_community
SELECT p.OwnerDisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150	codebase_community
SELECT      COUNT(ph.Id) AS PostHistoryCount,      MAX(ph.LastEditDate) AS LastEditDate FROM      postHistory ph JOIN      posts p ON ph.PostId = p.Id WHERE      p.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time' AND pl.LinkedPostId = p.Id;	codebase_community
SELECT p.Id, b.Name FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT `OwnerDisplayName` FROM `posts` WHERE `ViewCount` = (SELECT MAX(`ViewCount`) FROM `posts`);	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN tags t ON u.Id = t.ExcerptPostId JOIN posts p ON t.ExcerptPostId = p.Id WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?'	codebase_community
SELECT      p.OwnerDisplayName  FROM      posts p  WHERE      p.ParentId IS NOT NULL      AND p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL);	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT `Title` FROM `posts` ORDER BY `ViewCount` DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT `OwnerUserId`  FROM `posts`  ORDER BY `FavoriteCount` DESC  LIMIT 1;	codebase_community
SELECT Id, DisplayName, Reputation, Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users) AND Age IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts JOIN votes ON posts.Id = votes.PostId WHERE YEAR(posts.CreationDate) = 2011 AND votes.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT SUM(p.Score) AS TotalScore FROM posts p WHERE p.LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT      COUNT(pl.Id) / 12 AS average_monthly_links FROM      postLinks pl JOIN      posts p ON pl.PostId = p.Id WHERE      YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (     SELECT MIN(CreationDate)     FROM postLinks )	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY b.UserId ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate)  FROM votes  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'chl')  ORDER BY CreationDate ASC LIMIT 1;	codebase_community
SELECT MIN(CreationDate) AS YoungestFirstPostDate FROM posts WHERE OwnerUserId = (SELECT MIN(Age) FROM users)	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UsersWithFavoriteCount4OrMore FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) AS AvgPostsVotedByOldestUsers FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT `DisplayName`  FROM `users` WHERE `Reputation` = (SELECT MAX(`Reputation`) FROM `users`);	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DISTINCT `DisplayName`  FROM `users`  WHERE `Age` BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(p.Id) AS post_count FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN YEAR(posts.CreationDate) = 2011 AND users.Reputation > 1000 THEN posts.Id END) * 100.0)          / COUNT(posts.Id),          2     ) AS ReputationOver1000Percentage FROM      posts JOIN      users ON posts.OwnerUserId = users.Id	codebase_community
SELECT      ROUND(DIVIDE(COUNT(CASE WHEN users.Age BETWEEN 13 AND 18 THEN users.Id ELSE NULL END), COUNT(users.Id)) * 100, 2) AS percentage FROM      users;	codebase_community
SELECT p.ViewCount, u.DisplayName AS LastUserDisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Body LIKE '%Computer Game Datasets%' ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT      c.PostId,      COUNT(c.Id) AS CommentCount FROM      comments c INNER JOIN      posts p ON c.PostId = p.Id WHERE      p.Score = (SELECT MAX(Score) FROM posts) GROUP BY      c.PostId;	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183;	codebase_community
SELECT MAX(`Date`)  FROM `badges`  WHERE `UserId` IN (SELECT `Id` FROM `users` WHERE `DisplayName` = 'Emmett')	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT SUBSTR(b.Date, 1, 10) - SUBSTR(u.CreationDate, 1, 10) AS TimeToGetBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT u.DisplayName, COUNT(p.Id) AS PostCount, COUNT(c.Id) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY u.DisplayName;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE Id IN (SELECT ExcerptPostId FROM tags WHERE TagName = 'careers');	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT SUM(CASE WHEN p.PostTypeId = 1 THEN c.Id ELSE 0 END) AS CommentCount,        SUM(CASE WHEN p.PostTypeId = 2 THEN c.Id ELSE 0 END) AS AnswerCount FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate  FROM users  WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT      (COUNT(CASE WHEN p.Score > 50 THEN p.Id ELSE NULL END) * 100.0) / COUNT(p.Id) AS ScoreAbove50Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT      p.Id AS PostId,     p.Title,     c.Text AS CommentText FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      p.Title LIKE '%linear regression%'	codebase_community
SELECT c.Id, c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT p.Id) AS PostsWithZeroScoreAndLowViewCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers40YearsOld FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.'	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0	codebase_community
SELECT      (COUNT(DISTINCT CASE WHEN c.UserId IN (SELECT u.Id FROM users u WHERE u.UpVotes = 0) THEN c.UserId END) * 100.0) /      COUNT(DISTINCT c.UserId) AS PercentageZeroUpVotes FROM      comments c WHERE      c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM `superhero` sh JOIN `hero_power` hp ON sh.id = hp.hero_id JOIN `superpower` sp ON hp.power_id = sp.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND id IN (     SELECT hero_id     FROM hero_power     JOIN superpower ON hero_power.power_id = superpower.id     WHERE superpower.power_name = 'Super Strength' );	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT `superhero_name` FROM `superhero` JOIN `colour` AS eye_colour ON `superhero.eye_colour_id` = `eye_colour.id` JOIN `colour` AS hair_colour ON `superhero.hair_colour_id` = `hair_colour.id` WHERE `eye_colour.colour` = 'Blue' AND `hair_colour.colour` = 'Blond' JOIN `hero_power` ON `superhero.id` = `hero_power.hero_id` JOIN `superpower` ON `hero_power.power_id` = `superpower.id` WHERE `superpower.power_name` = 'Agility';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT publisher.publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.superhero_name = 'Sauron';	superhero
SELECT s.superhero_name, c.colour, COUNT(s.id) AS color_popularity FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') GROUP BY s.eye_colour_id, s.superhero_name ORDER BY color_popularity DESC;	superhero
SELECT AVG(`height_cm`) AS average_height FROM `superhero` WHERE `publisher_id` = (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics')	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name, s.superhero_name, a.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Speed' AND a.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Speed')	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond';	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' AND ha.attribute_value = (     SELECT MIN(attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Intelligence' )	superhero
SELECT `race` FROM `superhero` WHERE `superhero_name` = 'Copycat';	superhero
SELECT s.superhero_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female' AND attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE `race` = 'Vampire');	superhero
SELECT      ROUND((SUM(CASE WHEN `alignment.alignment` = 'Bad' THEN 1 ELSE 0 END) * 100.0) / COUNT(`superhero.id`), 2) AS percentage_bad_alignment,     COUNT(CASE WHEN `alignment.alignment` = 'Bad' AND `publisher.publisher_name` = 'Marvel Comics' THEN `superhero.id` ELSE NULL END) AS count_marvel_bad_alignment_heroes FROM      `superhero` JOIN      `alignment` ON `superhero.alignment_id` = `alignment.id` JOIN      `publisher` ON `superhero.publisher_id` = `publisher.id`	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;	superhero
SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Star Trek';	superhero
SELECT AVG(`attribute_value`) AS average_attribute_value FROM `hero_attribute`;	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE gender_id = 2;	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id JOIN gender AS g ON s.gender_id = g.id WHERE g.gender = 'Male' GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm BETWEEN 170 AND 190  AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT sp.power_name  FROM `superhero` s  JOIN `hero_power hp ON s.id = hp.hero_id  JOIN `superpower sp ON hp.power_id = sp.id  WHERE s.id = 56;	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT `race` FROM `superhero` WHERE `weight_kg` = 169;	superhero
SELECT `colour.colour` FROM `superhero` JOIN `colour` ON `superhero.hair_colour_id` = `colour.id` WHERE `superhero.race_id` = (SELECT `id` FROM `race` WHERE `race` = 'human') AND `superhero.height_cm` = 185;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND((SUM(CASE WHEN publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_marvel_heroes FROM superhero WHERE height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name  FROM superhero  WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.id = 1;	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Stealth';	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength'  AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Strength');	superhero
SELECT AVG(s.id) AS average_superheroes_no_skin FROM superhero s WHERE s.skin_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name, MAX(ha.attribute_value) AS max_durability FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' GROUP BY s.superhero_name ORDER BY max_durability DESC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE power_name = 'Flight';	superhero
SELECT s.superhero_name, c.eye_colour, h.colour AS hair_colour, sk.colour AS skin_colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id JOIN colour sk ON s.skin_colour_id = sk.id JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT      s.superhero_name,      p.publisher_name FROM      superhero s JOIN      colour AS eye_colour ON s.eye_colour_id = eye_colour.id JOIN      colour AS hair_colour ON s.hair_colour_id = hair_colour.id JOIN      colour AS skin_colour ON s.skin_colour_id = skin_colour.id JOIN      publisher p ON s.publisher_id = p.id WHERE      s.eye_colour_id = s.hair_colour_id AND      s.eye_colour_id = s.skin_colour_id;	superhero
SELECT race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero_name = 'A-Bomb';	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) /          (SELECT COUNT(*) FROM superhero WHERE gender_id = g.id AND skin_colour_id = c.id AND c.colour = 'Blue')     ) AS percentage_blue_females FROM      superhero s JOIN      colour c ON s.skin_colour_id = c.id JOIN      gender g ON s.gender_id = g.id WHERE      g.gender = 'Female';	superhero
SELECT superhero_name, race  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT `gender` FROM `superhero` WHERE `superhero_name` = 'Agent 13' AND `gender_id` = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*) AS `number_of_powers` FROM `hero_power` JOIN `superhero` ON `hero_power.hero_id` = `superhero.id` WHERE `superhero.superhero_name` = 'Amazo';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT `superhero_name` FROM `superhero` JOIN `colour` AS eye_colour ON `superhero.eye_colour_id` = `eye_colour.id` JOIN `colour` AS hair_colour ON `superhero.hair_colour_id` = `hair_colour.id` WHERE `eye_colour.colour` = 'Black' AND `hair_colour.colour` = 'Black';	superhero
SELECT superhero_name, `superhero`.full_name, colour.colour AS eye_colour FROM `superhero` JOIN `colour` ON `superhero`.eye_colour_id = colour.id WHERE `superhero`.skin_colour_id = (SELECT id FROM `colour` WHERE `colour` = 'Gold');	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
SELECT superhero_name  FROM superhero  WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' );	superhero
SELECT s.race, a.alignment FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = 2 AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0) /          COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 END),          2     ) AS percentage_female_marvel_heroes FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(`weight_kg`)  FROM `superhero`  WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Alien');	superhero
SELECT (SUM(weight_kg) - (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler')) AS weight_difference FROM superhero WHERE full_name = 'Emil Blonsky';	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute_name = 'Speed'  ORDER BY hero_attribute.attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour eye_colour ON s.eye_colour_id = eye_colour.id JOIN colour hair_colour ON s.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Brown';	superhero
SELECT publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.eye_colour_id = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),         2     ) AS percentage_blue_eyed_heroes FROM superhero s;	superhero
SELECT      (SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END)) AS male_female_ratio FROM superhero;	superhero
SELECT superhero_name, MAX(height_cm) as tallest_height FROM superhero GROUP BY superhero_name ORDER BY tallest_height DESC LIMIT 1;	superhero
SELECT id FROM `superpower` WHERE `power_name` = 'cryokinesis';	superhero
SELECT superhero_name  FROM superhero  WHERE id = 294;	superhero
SELECT `superhero_name`, `full_name` FROM `superhero` WHERE `weight_kg` IS NULL OR `weight_kg` = 0;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT race  FROM superhero  WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN race r ON s.race_id = r.id WHERE ha.attribute_value = (     SELECT MAX(attribute_value) FROM hero_attribute )	superhero
SELECT s.alignment, sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT s.superhero_name, c.colour  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  JOIN colour c ON s.skin_colour_id = c.id  WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE gender.id = 2 AND alignment.id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.superhero_name, r.race FROM superhero s JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id JOIN gender g ON s.gender_id = g.id WHERE c.colour = 'Blue' AND g.gender = 'Male';	superhero
SELECT      ROUND(         (SUM(CASE WHEN alignment.id = 2 AND gender.id = 2 THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN alignment.id = 2 THEN 1 ELSE 0 END),          2     ) AS percentage_female_bad_heroes FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.alignment = 'Bad';	superhero
SELECT      (SUM(CASE WHEN c.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN c.id = 1 THEN 1 ELSE 0 END)) AS eye_colours_difference FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg IS NULL OR s.weight_kg = 0;	superhero
SELECT ha.attribute_value  FROM hero_attribute ha  JOIN attribute a ON ha.attribute_id = a.id  JOIN superhero s ON ha.hero_id = s.id  WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN colour ON superhero.skin_colour_id = colour.id WHERE alignment.alignment = 'Bad' AND colour.colour = 'Green';	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;	superhero
SELECT s.full_name, g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, MAX(weight_kg) as max_weight FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') GROUP BY superhero_name ORDER BY max_weight DESC LIMIT 1;	superhero
SELECT AVG(`superhero`.`height_cm`)  FROM `superhero` INNER JOIN `publisher` ON `superhero`.`publisher_id` = `publisher`.`id` WHERE `race`.`race` <> 'Human'  AND `publisher`.`publisher_name` = 'Dark Horse Comics' AND `race`.`id` = `superhero`.`race_id`;	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT a.attribute_name, MIN(ha.attribute_value) AS min_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' GROUP BY a.attribute_name ORDER BY min_value ASC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT `superhero_name`, `height_cm` FROM `superhero` ORDER BY `height_cm` DESC LIMIT 1;	superhero
SELECT superhero_name  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) * 100.0) /          COUNT(s.gender_id),         2     ) AS female_percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT      ROUND((COUNT(CASE WHEN alignment_id = 1 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_good_heroes FROM      superhero WHERE      publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' AND alignment_id = 1);	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id  FROM hero_attribute  WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT `full_name` FROM `superhero` WHERE `superhero_name` = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Auburn' AND s.weight_kg < 100;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT `weight_kg`, `race` FROM `superhero` WHERE `id` = 40;	superhero
SELECT AVG(`height_cm`) AS average_height FROM `superhero` WHERE `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Neutral');	superhero
SELECT h.id FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';	superhero
SELECT `colour` FROM `superhero` JOIN `colour` ON `superhero.eye_colour_id` = `colour.id` WHERE `superhero_name` = 'Blackwulf';	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q1 = (SELECT MAX(q1) FROM qualifying WHERE raceId = 20) AND q.raceId = 20 AND q.position IS NULL;	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)	formula_1
SELECT DISTINCT s.year FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.name = 'Shanghai International Circuit';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Germany';	formula_1
SELECT c.name, cs.position FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors con ON cr.constructorId = con.constructorId WHERE con.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId NOT IN (     SELECT circuitId     FROM circuits     WHERE country IN ('Malaysia', 'Bahrain', 'Turkey', 'Monaco', 'Spain') )	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix'	formula_1
SELECT r.name, r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT `lat`, `lng`  FROM `circuits`  WHERE `name` = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.name AS country FROM constructors AS con JOIN constructorResults AS cr ON con.constructorId = cr.constructorId JOIN races AS r ON cr.raceId = r.raceId JOIN circuits AS ct ON r.circuitId = ct.circuitId WHERE cr.points = 1.0 AND r.raceId = 24;	formula_1
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.forename = 'Bruno' AND drivers.surname = 'Senna' AND qualifying.raceId = (SELECT raceId FROM races WHERE raceId = 354);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '01:40:00' AND q.raceId = 355;	formula_1
SELECT d.number  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  JOIN races r ON q.raceId = r.raceId  WHERE r.raceId = 903 AND q.q3 LIKE '0:01:54%'	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Bahrain Grand Prix' AND s.status = 'Finished' AND r.time IS NULL;	formula_1
SELECT seasons.url FROM races JOIN seasons ON races.year = seasons.year WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29' AND r.statusId = 1;	formula_1
SELECT d.driverRef, d.surname, d.forename, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.driverRef, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.raceId = 161 AND lt.time LIKE '0:01:27%'	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 933 AND r.fastestLap = 1 ORDER BY r.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT location, lat, lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 9 AND cr.points = (SELECT MAX(points) FROM constructorResults WHERE raceId = 9);	formula_1
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi');	formula_1
SELECT drivers.nationality FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.q2 = '00:01:15' AND qualifying.raceId = 347;	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 LIKE '0:01:%';	formula_1
SELECT r.time FROM races AS ra JOIN results AS re ON ra.raceId = re.raceId JOIN drivers AS dr ON re.driverId = dr.driverId JOIN constructors AS co ON re.constructorId = co.constructorId WHERE dr.surname = 'McLaren' AND ra.raceId = 743;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT d.driverId) AS drivers_not_finished FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29' AND r.statusId = 1 AND r.milliseconds IS NOT NULL;	formula_1
SELECT      d.driverId,      d.forename,      d.surname,      d.dob FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      r.raceId = 872 AND      r.statusId = 1 ORDER BY      d.dob DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = (SELECT raceId FROM races WHERE raceId = 348) AND lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes lt2 WHERE lt2.raceId = lt.raceId)	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLap IS NOT NULL AND r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT      (100 * ABS((SELECT `fastestLapSpeed`                   FROM `results` r                   JOIN `drivers` d ON r.driverId = d.driverId                   WHERE d.forename = 'Paul' AND d.surname = 'di Resta' AND r.raceId = 853                ) -                 (SELECT `fastestLapSpeed`                   FROM `results` r                   JOIN `drivers` d ON r.driverId = d.driverId                   WHERE d.forename = 'Paul' AND d.surname = 'di Resta' AND r.raceId = 854)               )      ) / NULLIF(         (SELECT `fastestLapSpeed`           FROM `results` r           JOIN `drivers` d ON r.driverId = d.driverId           WHERE d.forename = 'Paul' AND d.surname = 'di Resta' AND r.raceId = 853        ),         0     ) AS percentage_faster FROM      dual;	formula_1
SELECT      d.driverId,     d.forename,     d.surname,     COUNT(CASE WHEN rt.time IS NOT NULL THEN 1 END) AS completedLaps,     COUNT(*) AS totalLaps,     (COUNT(CASE WHEN rt.time IS NOT NULL THEN 1 END) / COUNT(*)) * 100 AS completionRate FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId JOIN      lapTimes rt ON d.driverId = rt.driverId AND r.raceId = rt.raceId WHERE      ra.date = '1983-07-16' GROUP BY      d.driverId	formula_1
SELECT year  FROM races  WHERE name = 'Singapore Grand Prix'  ORDER BY year ASC  LIMIT 1;	formula_1
SELECT COUNT(*) AS total_races, name FROM races JOIN seasons ON races.year = seasons.year WHERE seasons.year = 2005 GROUP BY name ORDER BY name DESC;	formula_1
SELECT name FROM races WHERE year = (SELECT year FROM races WHERE date = (SELECT MIN(date) FROM races)) AND MONTH(date) = (SELECT MONTH(MIN(date)) FROM races);	formula_1
SELECT `name`, `date` FROM `races` WHERE `year` = 1999 AND `round` = (SELECT MAX(`round`) FROM `races` WHERE `year` = 1999)	formula_1
SELECT `seasons`.`year`, COUNT(`races`.`raceId`) AS `numRaces` FROM `seasons` JOIN `races` ON `seasons`.`year` = `races`.`year` GROUP BY `seasons`.`year` ORDER BY `numRaces` DESC LIMIT 1;	formula_1
SELECT r.name FROM races r WHERE r.year = 2017 AND r.circuitId NOT IN (     SELECT c.circuitId     FROM races cr     JOIN circuits c ON cr.circuitId = c.circuitId     WHERE cr.year = 2000 );	formula_1
SELECT circuits.name AS circuit_name, circuits.location AS circuit_location FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN seasons ON races.year = seasons.year WHERE seasons.url LIKE '%1950%' AND circuits.country = 'Spain';	formula_1
SELECT MAX(year)  FROM races  WHERE name = 'British Grand Prix'  AND circuitRef = 'bhr';	formula_1
SELECT COUNT(DISTINCT r.year) AS numberOfSeasons FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit' AND c.country = 'United Kingdom' AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, ds.positionText FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2010 ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.points = (SELECT MAX(points) FROM driverStandings)	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name AS race_name, MIN(l.milliseconds) AS best_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY l.driverId, r.raceId ORDER BY best_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(`milliseconds`) AS average_lap_time FROM `lapTimes` INNER JOIN `drivers` ON `lapTimes.driverId` = `drivers.driverId` INNER JOIN `races` ON `lapTimes.raceId` = `races.raceId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton' AND `races.name` = 'Malaysian Grand Prix';	formula_1
SELECT     ROUND(         (COUNT(CASE WHEN d.surname = 'Hamilton' AND r.position > 1 THEN 1 END) * 100.0) /         COUNT(CASE WHEN d.surname = 'Hamilton' THEN 1 END)         , 2) AS percentage_not_first FROM     results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE     d.surname = 'Hamilton'     AND ra.year >= 2010;	formula_1
SELECT d.forename, d.surname, d.nationality, ds.max_points FROM drivers d JOIN (     SELECT driverId, MAX(points) as max_points     FROM driverStandings     GROUP BY driverId ) ds ON d.driverId = ds.driverId WHERE ds.max_points = (     SELECT MAX(max_points)     FROM (         SELECT driverId, SUM(points) as max_points         FROM driverStandings         GROUP BY driverId     ) as subquery ) ORDER BY ds.max_points DESC LIMIT 1;	formula_1
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS age, forename, surname FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT c.circuitRef, c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitRef, c.name HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name AS RaceName, c.name AS CircuitName, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name AS race_name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(*) FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN circuits ON results.raceId IN (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')) WHERE drivers.surname = 'Schumacher' AND results.points = (SELECT MAX(points) FROM results WHERE driverId = drivers.driverId)	formula_1
SELECT r.name AS race, s.year FROM results r JOIN lapTimes lt ON r.resultId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId JOIN races rs ON r.raceId = rs.raceId JOIN seasons s ON rs.year = s.year WHERE d.surname = 'Schumacher' AND lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes lt2     JOIN drivers d2 ON lt2.driverId = d2.driverId     WHERE d2.surname = 'Schumacher' );	formula_1
SELECT AVG(points)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.surname = 'Irvine' AND races.year = 2000;	formula_1
SELECT      r.name AS RaceName,      ds.points FROM      driverStandings ds JOIN      drivers d ON ds.driverId = d.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY      r.year LIMIT 1;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = 2017 ORDER BY r.date;	formula_1
SELECT      r.name AS RaceName,     s.year AS RaceYear,     c.location AS CircuitLocation,     r.laps AS MostLaps FROM      races AS r JOIN      circuits AS c ON r.circuitId = c.circuitId JOIN      (SELECT           raceId,           MAX(laps) AS laps      FROM           races      GROUP BY           raceId) AS maxlaps ON r.raceId = maxlaps.raceId JOIN      seasons AS s ON r.year = s.year ORDER BY      r.laps DESC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN circuits.country = 'Germany' THEN 1 END) * 100.0) / COUNT(*) AS percentage_german_races FROM      races JOIN      circuits ON races.circuitId = circuits.circuitId WHERE      races.name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT      c.name AS circuitName,     c.lat AS latitude FROM      circuits c WHERE      c.name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY      c.lat DESC LIMIT 1;	formula_1
SELECT `circuitRef` FROM `circuits` WHERE `name` = 'Marina Bay Street Circuit';	formula_1
SELECT `country`, MAX(`alt`) as `max_altitude` FROM `circuits` WHERE `alt` IS NOT NULL GROUP BY `country` ORDER BY `max_altitude` DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT d.nationality FROM drivers d WHERE d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE driverRef = 'davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT `name` FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT s.year  FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT      r.name AS RaceName,      r.date,      r.time,      c.name AS CircuitName,      c.url AS CircuitURL FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      c.circuitRef = 'silverstone';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'abu_dhabi' AND r.year BETWEEN 2010 AND 2019;	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name LIKE '%Italy%';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT url FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN seasons ON races.year = seasons.year WHERE circuits.name = 'Circuit de Barcelona-Catalunya' AND seasons.year = 2009;	formula_1
SELECT MIN(`fastestLapTime`) AS fastestLapTime FROM `results` JOIN `drivers` ON `results.driverId` = `drivers.driverId` WHERE `drivers.surname` = 'Hamilton';	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.fastestLap IS NOT NULL AND lt.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM lapTimes     WHERE raceId IN (SELECT raceId FROM races) )	formula_1
SELECT d.driverRef FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND ds.position = 1 AND r.year = 2007;	formula_1
SELECT r.name AS raceName, r.date, r.time FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT      r.name AS RaceName,     d.forename || ' ' || d.surname AS DriverName,     MIN(dr.rank) AS HighestRank FROM      results dr JOIN      races r ON dr.raceId = r.raceId JOIN      drivers d ON dr.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY      r.name, DriverName ORDER BY      HighestRank ASC LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) AS fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT s.year FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname, r.positionOrder  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  AND ra.name = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId IN (     SELECT raceId      FROM races      WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND r.time IS NOT NULL;	formula_1
SELECT MIN(`milliseconds`) AS fastest_lap_milliseconds, `time` FROM `lapTimes` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton') AND `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = 'Australian Grand Prix' AND `year` = 2008) GROUP BY `raceId`, `driverId`, `lap` ORDER BY `milliseconds` ASC LIMIT 1;	formula_1
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND r.positionOrder = 2 AND ra.year = 2008;	formula_1
SELECT d.forename, d.surname, d.url FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN seasons s ON r.year = s.year WHERE s.year = 2008 AND r.name = 'Australian Grand Prix' AND ds.position = 1 AND ds.positionText = '1' AND d.url IS NOT NULL AND r.url IS NOT NULL;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN `seasons` s ON ra.year = s.year WHERE d.nationality = 'British' AND s.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND s.status = 'Finished';	formula_1
SELECT SUM(points) AS total_points FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT AVG(STR_TO_DATE(SUBSTRING_INDEX(SUBSTRING_INDEX(`fastestLapTime`, ':', 1), '.', 1), '%i')) +         (AVG(STR_TO_DATE(SUBSTRING_INDEX(SUBSTRING_INDEX(`fastestLapTime`, ':', -1), '.', 1), '%s')) / 60) AS averageFastestLapTime FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT      COUNT(CASE WHEN r.laps = 58 THEN 1 END) * 1.0 / COUNT(r.raceId) AS completion_rate FROM      results r JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT      ((         (TIMESTAMPDIFF(SECOND,              (SELECT `time` FROM `results` WHERE `positionOrder` = 1 AND `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = 'Australian Grand Prix' AND `year` = 2008),              (SELECT `time` FROM `results` WHERE `positionOrder` = (SELECT MAX(`positionOrder`) FROM `results` WHERE `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = 'Australian Grand Prix' AND `year` = 2008))         ) /          (SELECT `time` FROM `results` WHERE `positionOrder` = (SELECT MAX(`positionOrder`) FROM `results` WHERE `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = 'Australian Grand Prix' AND `year` = 2008)))     ) * 100) FROM dual;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND name = 'Adelaide';	formula_1
SELECT `lat`, `lng` FROM `circuits` WHERE `country` = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(points) AS max_points FROM constructorStandings WHERE constructorId IN (     SELECT constructorId     FROM constructors     WHERE nationality = 'British' );	formula_1
SELECT c.constructorRef, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId GROUP BY c.constructorRef ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(DISTINCT cr.constructorId) FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY cr.constructorId HAVING COUNT(cr.raceId) = 2;	formula_1
SELECT c.name AS constructor_name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT lt.driverId) FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN constructors c ON d.constructorId = c.constructorId WHERE c.nationality = 'French' AND lt.lap > 50;	formula_1
SELECT      (COUNT(CASE WHEN d.nationality = 'Japanese' THEN ds.driverId ELSE NULL END AND rs.time IS NOT NULL) * 100.0) /      COUNT(CASE WHEN d.nationality = 'Japanese' THEN ds.driverId ELSE NULL END) FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      r.year BETWEEN 2007 AND 2009	formula_1
SELECT      r.year,     AVG(TIMESTAMPDIFF(SECOND, '00:00:00', SUBTIME(r.time, '00:00:00'))) AS avg_time_seconds FROM      results r JOIN      driverStandings ds ON r.driverId = ds.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ds.position = 1 AND ra.year < 1975 AND r.time IS NOT NULL GROUP BY      r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     JOIN results r ON ds.driverId = d.driverId     WHERE ds.position = 2 AND r.resultId = ds.driverStandingsId )	formula_1
SELECT COUNT(DISTINCT d.driverId) AS UnfinishedItalianDrivers FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT lt.lap FROM lapTimes lt JOIN (     SELECT rs.driverId     FROM results rs     JOIN races r ON rs.raceId = r.raceId     WHERE rs.year = 2009 AND rs.position = 1 ) AS champion ON lt.driverId = champion.driverId ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapSpeed) AS averageFastestLapSpeed FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Spanish Grand Prix' );	formula_1
SELECT r.name AS raceName, s.year FROM races r JOIN seasons s ON r.year = s.year JOIN (     SELECT raceId, MIN(milliseconds) AS minTime     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) AS minTimes ON r.raceId = minTimes.raceId ORDER BY minTimes.minTime ASC LIMIT 1;	formula_1
SELECT      ROUND(         (COUNT(CASE WHEN drivers.dob < '1985-01-01' AND lapTimes.lap > 50 THEN drivers.driverId END)          * 100.0) /          COUNT(DISTINCT drivers.driverId),         2     ) AS percentage FROM      drivers JOIN      lapTimes ON drivers.driverId = lapTimes.driverId WHERE      drivers.dob < '1985-01-01'     AND lapTimes.raceId IN (         SELECT              races.raceId          FROM              races          JOIN              seasons ON races.year = seasons.year          WHERE              seasons.year BETWEEN 2000 AND 2005     );	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  WHERE d.nationality = 'French'  AND SUBSTR(lt.time, 1, 2) * 60 + CAST(SUBSTR(lt.time, 4, 2) AS INTEGER) < 120;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM driverStandings  WHERE raceId = 18;	formula_1
SELECT      d.driverId,     d.forename,     d.surname,     d.dob,     d.nationality,     (SELECT          (2019 - STRFTIME('%Y', d.dob)) AS age      FROM drivers d      WHERE d.driverId = t.driverId     ) AS age FROM      (SELECT          d.driverId,         d.forename,         d.surname,         d.dob,         d.nationality      FROM drivers d      JOIN (          SELECT               MIN(STRFTIME('%Y', dob)) AS youngest          FROM drivers          WHERE nationality = 'Dutch'      ) AS min_age ON (STRFTIME('%Y', d.dob) = min_age.youngest)      ORDER BY age ASC     ) AS t ORDER BY age DESC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE surnname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      MIN(lt.time) AS earliestLapTime FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY      d.driverId, d.driverRef, d.forename, d.surname ORDER BY      earliestLapTime ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.dob LIKE '1971%' AND lt.fastestLapTime IS NOT NULL ORDER BY lt.fastestLapTime ASC LIMIT 1;	formula_1
SELECT      d.driverRef,      d.surname,      d.forename,      d.dob,      lt.milliseconds AS latestLapTime FROM      drivers d JOIN      (SELECT          driverId,          MAX(milliseconds) AS milliseconds      FROM          lapTimes      GROUP BY          driverId) lt ON d.driverId = lt.driverId WHERE      d.nationality = 'Spanish'      AND d.dob < '1982-01-01' ORDER BY      lt.milliseconds ASC LIMIT 10;	formula_1
SELECT r.year  FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId WHERE lt.fastestLapTime = (SELECT MIN(fastestLapTime) FROM lapTimes lt2) GROUP BY r.year;	formula_1
SELECT year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE lapTimes.milliseconds = (     SELECT MAX(milliseconds)     FROM lapTimes ) GROUP BY year;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NULL;	formula_1
SELECT COUNT(*), c.name, c.lat, c.lng FROM circuits c WHERE c.country = 'Austria' GROUP BY c.name, c.lat, c.lng;	formula_1
SELECT raceId, COUNT(*) AS finisher_count FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY finisher_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 IS NOT NULL AND q.raceId = 23;	formula_1
SELECT s.year, c.name, r.date, r.time FROM drivers d JOIN races r ON d.driverId = r.driverId JOIN seasons s ON r.year = s.year JOIN qualifying q ON d.driverId = q.driverId AND r.raceId = q.raceId WHERE d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY r.date LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT      c.name AS constructor_name,      c.url AS introduction_website,      SUM(cr.points) AS total_points FROM      constructors c JOIN      constructorResults cr ON c.constructorId = cr.constructorId WHERE      c.nationality = 'Italian' GROUP BY      c.constructorId ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT constructors.url  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  JOIN (     SELECT constructorId, SUM(wins) as total_wins      FROM constructorStandings      GROUP BY constructorId      ORDER BY total_wins DESC      LIMIT 1 ) AS top_constructor  ON constructors.constructorId = top_constructor.constructorId;	formula_1
SELECT d.driverRef, d.surname, lt.time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.time DESC LIMIT 1;	formula_1
SELECT r.name AS raceName, MIN(lt.milliseconds) AS fastestLapTime FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId WHERE lt.lap = 1 AND lt.position = 1 GROUP BY r.raceId ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapTime) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'United States Grand Prix' AND year = 2006) AND rank < 11;	formula_1
SELECT      d.forename,      d.surname,      d.dob,      AVG(SUBSTRING(p.duration, 3, LENGTH(p.duration) - 2)) AS avg_pitstop_duration FROM      drivers d JOIN      pitStops p ON d.driverId = p.driverId WHERE      d.nationality = 'German'      AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY      d.driverId ORDER BY      avg_pitstop_duration ASC LIMIT 3;	formula_1
SELECT d.surname, r.time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1 AND r.statusId = 1;	formula_1
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON constructorStandings.raceId = races.raceId WHERE races.name = 'Singapore Grand Prix' AND races.year = 2009 AND constructorStandings.position = 1;	formula_1
SELECT `forename`, `surname`, `dob` FROM `drivers` WHERE `nationality` = 'Austrian' AND `dob` BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT      CONCAT(d.forename, ' ', d.surname) AS fullName,     d.url AS wikiPageLink,     d.dob AS dateOfBirth FROM      drivers d WHERE      d.nationality = 'German' AND     d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY      d.dob DESC;	formula_1
SELECT location, country, lat, lng  FROM circuits  WHERE circuitRef = 'hungaroring';	formula_1
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE r.name = 'Circuit de Monaco' AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(COUNT(raceId)) AS avg_races_per_year FROM races WHERE year BETWEEN 2000 AND 2010;	formula_1
SELECT nationality  FROM drivers  GROUP BY nationality  ORDER BY COUNT(*) DESC  LIMIT 1;	formula_1
SELECT SUM(CASE WHEN rs.positionOrder = 1 THEN 1 ELSE 0 END) AS victories FROM driverStandings ds JOIN results r ON ds.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE ds.positionText = '91st' AND s.status = 'Finished';	formula_1
SELECT r.name  FROM races r JOIN results res ON r.raceId = res.raceId JOIN lapTimes lt ON res.driverId = lt.driverId AND res.raceId = lt.raceId WHERE lt.fastestLap = 1 ORDER BY lt.fastestLapTime ASC LIMIT 1;	formula_1
SELECT c.location, c.country  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE q.position = 1 AND q.q3 IS NOT NULL AND r.year = 2008 AND r.name = 'Malaysian Grand Prix';	formula_1
SELECT      d.forename || ' ' || d.surname AS fullName,     d.nationality,     r.name AS firstRaceName FROM      drivers d JOIN      (SELECT           driverId, MIN(dob) AS minDob      FROM           drivers      GROUP BY           driverId) youngest ON      d.driverId = youngest.driverId JOIN      (SELECT           driverId, raceId      FROM           results      WHERE           raceId = (SELECT                        MIN(raceId)                    FROM                        results                    WHERE                        driverId = youngest.driverId)) firstRace ON      d.driverId = firstRace.driverId JOIN      races r ON      firstRace.raceId = r.raceId ORDER BY      d.dob DESC LIMIT 1;	formula_1
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  JOIN status ON results.statusId = status.statusId  JOIN drivers ON results.driverId = drivers.driverId  WHERE races.name = 'Canadian Grand Prix' AND status.status = 'Accident'  AND drivers.driverId = (     SELECT driverId      FROM results      JOIN races ON results.raceId = races.raceId      JOIN status ON results.statusId = status.statusId      WHERE races.name = 'Canadian Grand Prix' AND status.status = 'Accident'      GROUP BY drivers.driverId      ORDER BY COUNT(*) DESC      LIMIT 1 );	formula_1
SELECT d.forename, d.surname, COUNT(*) AS wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId;	formula_1
SELECT MAX(`milliseconds`) AS max_pit_stop_time FROM `pitStops` WHERE `duration` IS NOT NULL;	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes;	formula_1
SELECT MAX(`duration`) AS longest_pit_stop_time FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton');	formula_1
SELECT lap FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId JOIN races ON pitStops.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Australian Grand Prix' AND YEAR(races.date) = 2011;	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      p.stop,      p.lap,      p.time,      p.duration FROM      pitStops p JOIN      races r ON p.raceId = r.raceId JOIN      drivers d ON p.driverId = d.driverId WHERE      r.year = 2011 AND      r.name = 'Australian Grand Prix';	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes ) ORDER BY lt.milliseconds ASC LIMIT 20;	formula_1
SELECT r.position FROM lapTimes lt JOIN results res ON lt.driverId = res.driverId AND lt.raceId = res.raceId JOIN drivers d ON lt.driverId = d.driverId JOIN circuits c ON lt.raceId = c.circuitId JOIN races rcs ON lt.raceId = rcs.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND lt.milliseconds = (     SELECT MIN(lt2.milliseconds)     FROM lapTimes lt2     JOIN drivers d2 ON lt2.driverId = d2.driverId     WHERE d2.forename = 'Lewis' AND d2.surname = 'Hamilton'     AND lt2.raceId = lt.raceId ) AND rcs.name LIKE 'Formula%';	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE name = 'Austrian Grand Prix');	formula_1
SELECT circuitId, MIN(milliseconds) AS fastestLapMilliseconds FROM lapTimes JOIN circuits ON lapTimes.raceId IN (     SELECT raceId FROM races WHERE circuitId IN (         SELECT circuitId FROM circuits WHERE country = 'Italy'     ) ) GROUP BY circuitId ORDER BY fastestLapMilliseconds ASC;	formula_1
SELECT      r.name AS race_name,     MIN(l(milliseconds)) AS min_milliseconds FROM      lapTimes l JOIN      races r ON l.raceId = r.raceId WHERE      r.name = 'Austrian Grand Prix' GROUP BY      r.name ORDER BY      min_milliseconds ASC LIMIT 1;	formula_1
SELECT pitStops.driverId, pitStops.duration FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Austrian Grand Prix' AND pitStops.driverId = (     SELECT driverId     FROM lapTimes     WHERE raceId = (         SELECT raceId         FROM races         WHERE name = 'Austrian Grand Prix'     )     ORDER BY milliseconds ASC     LIMIT 1 );	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(`milliseconds`) AS average_pit_stop_time FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton');	formula_1
SELECT AVG(`milliseconds`) as average_lap_time FROM `lapTimes` WHERE `raceId` IN (     SELECT `raceId`     FROM `races`     WHERE `circuitId` IN (         SELECT `circuitId`         FROM `circuits`         WHERE `country` = 'Italy'     ) );	formula_1
SELECT player_api_id  FROM Player_Attributes  WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT `player_name`, `height` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`);	european_football_2
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`);	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT p.id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes) ORDER BY p.id LIMIT 5;	european_football_2
SELECT `League`.`name` FROM `League` JOIN `Match` ON `League`.`id` = `Match`.`league_id` WHERE `Match`.`season` = '2015/2016' GROUP BY `League`.`name` ORDER BY SUM(`Match`.`home_team_goal`) + SUM(`Match`.`away_team_goal`) DESC LIMIT 1;	european_football_2
SELECT      home_team_api_id,     COUNT(*) AS lost_matches FROM      `Match` WHERE      home_team_goal < away_team_goal      AND season = '2015/2016' GROUP BY      home_team_api_id ORDER BY      lost_matches ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.penalties IS NOT NULL GROUP BY p.player_name ORDER BY SUM(pa.penalties) DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM `Team` AS T1 JOIN `Match` AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.season = '2009/2010' AND T2.league_id = (SELECT id FROM `League` WHERE name = 'Scotland Premier League') AND T2.away_team_goal > T2.home_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT      t.team_long_name,      ta.buildUpPlaySpeed FROM      Team t JOIN      Team_Attributes ta ON t.team_fifa_api_id = ta.team_fifa_api_id WHERE      ta.buildUpPlaySpeed = (SELECT MAX(buildUpPlaySpeed) FROM Team_Attributes ta2 JOIN Team t2 ON t2.team_fifa_api_id = ta2.team_fifa_api_id) ORDER BY      ta.buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(CASE WHEN M.home_team_goal = M.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT     P.player_name,     TIMESTAMPDIFF(YEAR, P.birthday, CURRENT_DATE) AS current_age,     PA.sprint_speed FROM     Player P JOIN     Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE     PA.sprint_speed >= 97     AND PA.date BETWEEN '2013-01-01' AND '2015-12-31';	european_football_2
SELECT `name`, COUNT(*) as total_matches FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` GROUP BY `League.id`, `name` ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012');	european_football_2
SELECT      ROUND(         (SUM(CASE WHEN `Player`.`player_fifa_api_id` IS NOT NULL AND `Player_Attributes`.`preferred_foot` = 'left' AND YEAR(`Player`.`birthday`) BETWEEN 1987 AND 1992 THEN 1 ELSE 0 END) * 100.0) /          COUNT(DISTINCT `Player`.`player_fifa_api_id`)     , 2) AS percentage_left_foot_players FROM      `Player` JOIN      `Player_Attributes` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id` WHERE      `Player_Attributes`.`preferred_foot` = 'left'      AND YEAR(`Player`.`birthday`) BETWEEN 1987 AND 1992	european_football_2
SELECT `League`.`name`, SUM(`Match`.`home_team_goal`) + SUM(`Match`.`away_team_goal`) AS total_goals FROM `League` JOIN `Match` ON `League`.`id` = `Match`.`league_id` GROUP BY `League`.`name` ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT      AVG(long_shots) AS average_long_shots FROM      Player_Attributes WHERE      player_api_id IN (         SELECT              player_api_id          FROM              Player          WHERE              player_name = 'Ahmed Samir Farag'     );	european_football_2
SELECT      p.player_name,     AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id OR p.player_fifa_api_id = pa.player_fifa_api_id WHERE      p.height > 180 GROUP BY      p.player_name ORDER BY      avg_heading_accuracy DESC LIMIT      10;	european_football_2
SELECT T1.team_long_name FROM `Team_Attributes` AS T1 JOIN `Team` AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM `Team_Attributes` WHERE date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY T1.chanceCreationPassing ASC;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal);	european_football_2
SELECT `team_short_name` FROM `Team` WHERE `team_long_name` = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE strftime('%Y-%m', birthday) = '1970-10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Franco Zennaro');	european_football_2
SELECT `buildUpPlayPositioningClass` FROM `Team_Attributes` WHERE `team_long_name` = 'ADO Den Haag' AND `buildUpPlayPositioningClass` IS NOT NULL ORDER BY `date` DESC LIMIT 1;	european_football_2
SELECT      pa.player_api_id,      pa.heading_accuracy  FROM      Player_Attributes pa  JOIN      Player p ON pa.player_api_id = p.player_api_id  WHERE      p.player_name = 'Francois Affolter' AND      pa.date = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT `Player`.`player_name`, `Player`.`birthday`, `Player_Attributes`.`preferred_foot` FROM `Player` JOIN `Player_Attributes` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id` WHERE `Player`.`birthday` = (SELECT MIN(`birthday`) FROM `Player`) ORDER BY `Player`.`player_name` LIMIT 1;	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `chanceCreationPassingClass` = 'Risky';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.player_name` = 'David Wilson';	european_football_2
SELECT `Player.birthday` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `Player_Attributes.overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`);	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT      p.player_name,      pa.average_finishing FROM      (SELECT          pa.player_api_id,          AVG(pa.finishing) AS average_finishing      FROM          Player p      JOIN          Player_Attributes pa ON p.player_api_id = pa.player_api_id      WHERE          p.height BETWEEN (SELECT MAX(height) FROM Player) AND (SELECT MIN(height) FROM Player)      GROUP BY          pa.player_api_id     ) AS pa JOIN      Player p ON pa.player_api_id = p.player_api_id ORDER BY      pa.average_finishing DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM `Player` WHERE strftime('%Y', `birthday`) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_fifa_api_id` IN (     SELECT `player_fifa_api_id` FROM `Player` WHERE `player_name` = 'Aaron Doran' );	european_football_2
SELECT player_name  FROM Player  WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'CLB';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlayPassing` > 70;	european_football_2
SELECT AVG(t2.overall_rating) AS avg_overall_rating FROM `Player_Attributes` t2 JOIN `Player` t1 ON t2.player_api_id = t1.player_api_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170;	european_football_2
SELECT player_name, height  FROM Player  ORDER BY height ASC  LIMIT 1;	european_football_2
SELECT `Country.name`  FROM `League`  JOIN `Country` ON `League.country_id` = `Country.id`  WHERE `League.name` = 'Italy Serie A';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` WHERE `buildUpPlaySpeed` = 31 AND `buildUpPlayDribbling` = 53 AND `buildUpPlayPassing` = 32;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id`  WHERE `Player`.`player_name` = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT `Team.team_short_name` FROM `Team` JOIN `Match` ON `Team.team_api_id` = `Match.home_team_api_id` WHERE `Match.home_team_goal` = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 AND pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61);	european_football_2
SELECT      (SELECT AVG(`ball_control`)       FROM `Player_Attributes` pa       JOIN `Player` p ON pa.player_fifa_api_id = p.player_fifa_api_id       WHERE p.player_name = 'Abdou Diallo') -      (SELECT AVG(`ball_control`)       FROM `Player_Attributes` pa       JOIN `Player` p ON pa.player_fifa_api_id = p.player_fifa_api_id       WHERE p.player_name = 'Aaron Appindangoye') AS ball_control_difference;	european_football_2
SELECT team_long_name  FROM Team  WHERE team_short_name = 'GEN';	european_football_2
SELECT   p1.player_name AS player1_name,   p2.player_name AS player2_name,   CASE      WHEN p1.birthday > p2.birthday THEN p1.player_name     ELSE p2.player_name   END AS older_player FROM   Player p1 JOIN   Player p2 ON   p1.player_api_id = 23780 AND p2.player_api_id = 505942;	european_football_2
SELECT player_name, height  FROM Player  ORDER BY height DESC  LIMIT 1;	european_football_2
SELECT COUNT(*) FROM `Player_Attributes` WHERE `preferred_foot` = 'left' AND `attacking_work_rate` = 'low';	european_football_2
SELECT `Country.name` FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `League.name` = 'Belgium Jupiler League';	european_football_2
SELECT `name` FROM `League` WHERE `country_id` IN (SELECT `id` FROM `Country` WHERE `name` = 'Germany');	european_football_2
SELECT player_name, MAX(overall_rating) as max_strength FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id GROUP BY player_name ORDER BY max_strength DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_api_id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, pa.crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_name` = 'Ariel Borysiuk' );	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `height` > 180 AND `player_api_id` IN (SELECT `player_api_id` FROM `Player_Attributes` WHERE `volleys` > 70);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Belgium' AND Match.season = '2008/2009';	european_football_2
SELECT `Player_Attributes`.`long_passing` AS long_passing_score FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` ORDER BY `Player`.`birthday` ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM `Match` WHERE `league_id` IN (SELECT `id` FROM `League` WHERE `name` = 'Belgium Jupiler League') AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT `name`  FROM `League`  JOIN `Match` ON `League.id` = `Match.league_id` WHERE `Match.season` = '2008/2009' GROUP BY `League.name` ORDER BY COUNT(`Match.id`) DESC LIMIT 1;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes` WHERE strftime('%Y', `Player`.`birthday`) < '1986' AND `Player_Attributes`.`player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE strftime('%Y', `Player`.`birthday`) < '1986');	european_football_2
SELECT     (p1.overall_rating - p2.overall_rating) * 100.0 / p2.overall_rating FROM     Player p1 JOIN     Player p2 ON p1.player_name = 'Ariel Borysiuk' AND p2.player_name = 'Paulin Puel'	european_football_2
SELECT AVG(`buildUpPlaySpeed`) AS average_build_up_play_speed FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `Team.team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) AS average_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(`crossing`) AS total_crossing_score FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `Player`.`player_name` = 'Aaron Lennox'	european_football_2
SELECT MAX(`chanceCreationPassing`) AS highest_chance_creation_passing_score, `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax' GROUP BY `chanceCreationPassingClass` ORDER BY `chanceCreationPassing` DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id OR Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id`  WHERE `Player`.`player_name` = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal) AS avg_away_goals FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id JOIN League ON Match.league_id = League.id JOIN Country ON League.country_id = Country.id WHERE Team.team_long_name = 'Parma' AND Country.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Aaron Mooy' AND `Player_Attributes.date` LIKE '2016-02-04%';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Parravicini' AND `date` = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Francesco Migliore' ) AND `date` LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00';	european_football_2
SELECT date FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Kevin Constant' ORDER BY crossing DESC LIMIT 1;	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Willem II' AND `date` = '2012-02-22'	european_football_2
SELECT `buildUpPlayDribblingClass` FROM `Team_Attributes` WHERE `team_api_id` = (SELECT `team_api_id` FROM `Team` WHERE `team_short_name` = 'LEI') AND `date` = '2015-09-10 00:00:00';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'FC Lorient' AND `date` LIKE '2010-02-22%'	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `Team.team_long_name` = 'PEC Zwolle' AND `Team_Attributes.date` = '2013-09-20 00:00:00';	european_football_2
SELECT chanceCreationCrossingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team.team_long_name = 'Hull City' AND Team_Attributes.date = '2010-02-22 00:00:00'	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND `date` LIKE '2015-09-10%'	european_football_2
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Marko Arnautovic' ) AND DATE(`date`, 'yyyy-MM-dd') BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      ((         (SELECT overall_rating           FROM Player_Attributes pa           JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id           WHERE p.player_name = 'Landon Donovan'           AND pa.date = '2013-07-12') -          (SELECT overall_rating           FROM Player_Attributes pa           JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id           WHERE p.player_name = 'Jordan Bowery'           AND pa.date = '2013-07-12')     ) /      (SELECT overall_rating       FROM Player_Attributes pa       JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id       WHERE p.player_name = 'Landon Donovan'       AND pa.date = '2013-07-12')     ) * 100 AS percentage_difference	european_football_2
SELECT `player_name` FROM `Player` ORDER BY `height` DESC LIMIT 1;	european_football_2
SELECT player_api_id  FROM Player  ORDER BY weight DESC  LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE DATEDIFF(year, p.birthday, CURRENT_TIMESTAMP) > 35;	european_football_2
SELECT SUM(`home_team_goal`) as total_home_goals FROM `Match` JOIN `Player` ON `Player`.`player_api_id` = `Match`.`home_player_1` WHERE `Player`.`player_name` = 'Aaron Lennon';	european_football_2
SELECT SUM(a.away_team_goal) AS total_away_goals FROM `Match` a JOIN `Player` p1 ON a.away_player_1 = p1.player_api_id AND p1.player_name = 'Daan Smith' JOIN `Player` p2 ON a.away_player_2 = p2.player_api_id AND p2.player_name = 'Filipe Ferreira' WHERE a.away_team_goal IS NOT NULL;	european_football_2
SELECT SUM(`home_team_goal`) AS total_home_goals FROM `Match` JOIN `Player` ON `home_player_1` = `Player`.`player_api_id` WHERE strftime('%Y', 'now', '-31 year', birthday) > strftime('%Y', birthday) GROUP BY `home_team_api_id`	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_X1 OR p.player_api_id = m.home_player_X2 OR p.player_api_id = m.home_player_X3 OR p.player_api_id = m.home_player_X4 OR p.player_api_id = m.home_player_X5 OR p.player_api_id = m.home_player_X6 OR p.player_api_id = m.home_player_X7 OR p.player_api_id = m.home_player_X8 OR p.player_api_id = m.home_player_X9 OR p.player_api_id = m.home_player_X10 OR p.player_api_id = m.home_player_X11 JOIN Player_Attributes pa2 ON m.home_player_X1 = pa2.player_api_id OR m.home_player_X2 = pa2.player_api_id OR m.home_player_X3 = pa2.player_api_id OR m.home_player_X4 = pa2.player_api_id OR m.home_player_X5 = pa2.player_api_id OR m.home_player_X6 = pa2.player_api_id OR m.home_player_X7 = pa2.player_api_id OR m.home_player_X8 = pa2.player_api_id OR m.home_player_X9 = pa2.player_api_id OR m.home_player_X10 = pa2.player_api_id OR m.home_player_X11 = pa2.player_api_id WHERE pa.attacking_work_rate = 'high' AND pa2.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT p.player_name, c.name AS country FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE pa.vision > 89;	european_football_2
SELECT Country.name, AVG(Player.weight) AS avg_weight FROM Player JOIN Country ON Player.player_fifa_api_id = Country.id GROUP BY Country.name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT `Team.team_short_name` FROM `Team` JOIN `Team_Attributes` ON `Team.team_fifa_api_id` = `Team_Attributes.team_fifa_api_id` WHERE `Team_Attributes.chanceCreationPassingClass` = 'Safe';	european_football_2
SELECT AVG(height) AS average_height FROM Player JOIN Country ON Player.player_fifa_api_id = Country.id WHERE Country.name = 'Italy';	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01'	european_football_2
SELECT      (SELECT jumping FROM `Player_Attributes` WHERE `id` = 6) - (SELECT jumping FROM `Player_Attributes` WHERE `id` = 23) AS JumpingScoreDifference	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes WHERE preferred_foot = 'left') AND pa.preferred_foot = 'left';	european_football_2
SELECT     ROUND((COUNT(*) FILTER (WHERE `strength` > 80 AND `stamina` > 80) * 100.0) / COUNT(*), 2) AS percentage_with_high_strength_and_stamina FROM     `Player_Attributes`;	european_football_2
SELECT `Country.name` FROM `Country` JOIN `League` ON `Country.id` = `League.country_id` WHERE `League.name` = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League');	european_football_2
SELECT sprint_speed, agility, acceleration  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Alexis Blin';	european_football_2
SELECT      `team_long_name`,      `buildUpPlaySpeedClass` FROM      `Team_Attributes`  JOIN      `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE      `team_long_name` = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*)  FROM Match  WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')  AND season = '2015/2016';	european_football_2
SELECT MAX(home_team_goal) AS highest_home_score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie');	european_football_2
SELECT finishing, curve  FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_fifa_api_id` = `Player`.`player_fifa_api_id` WHERE `Player`.`weight` = (SELECT MAX(`weight`) FROM `Player`)	european_football_2
SELECT      League.name,      COUNT(Match.id) AS total_games FROM      Match JOIN      League ON Match.league_id = League.id WHERE      Match.season = '2015/2016' GROUP BY      League.name ORDER BY      total_games DESC LIMIT 4;	european_football_2
SELECT T2.team_long_name FROM `Match` M JOIN `Team` T1 ON M.away_team_api_id = T1.team_api_id JOIN `sqlite_sequence` SQ ON T1.team_api_id = SQ.seq WHERE M.away_team_goal = SQ.seq ORDER BY SQ.seq DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT      (COUNT(CASE WHEN `Player`.height < 180 AND `Player_Attributes`.overall_rating > 70 THEN 1 END) * 100.0 / COUNT(`Player`.id)) AS percentage_of_players_under_180_with_strength_over_70 FROM      `Player` INNER JOIN      `Player_Attributes` ON `Player`.player_api_id = `Player_Attributes`.player_api_id	european_football_2
SELECT      CASE          WHEN SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) >               SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)          THEN 'In-patient'         ELSE 'Outpatient'     END AS More_Frequency,      (SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) -       SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)) /      SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) * 100 AS Percentage_Deviation FROM      Patient;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Patient`.Birthday > '1930' THEN `Patient`.ID ELSE NULL END) * 100.0) /      COUNT(CASE WHEN `Patient`.SEX = 'F' THEN `Patient`.ID ELSE NULL END) AS percentage_female_born_after_1930 FROM `Patient` WHERE `Patient`.SEX = 'F';	thrombosis_prediction
SELECT      ROUND((COUNT(*) FILTER (WHERE `Admission` = '+') * 100.0) / COUNT(*), 2) AS Inpatient_Percentage FROM      `Patient` WHERE      `Birthday` BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Patient.Diagnosis` = 'SLE' AND `Examination.Admission` = '+' THEN `Examination.ID` END)       / COUNT(CASE WHEN `Patient.Diagnosis` = 'SLE' AND `Examination.Admission` = '-' THEN `Examination.ID` END)) AS Ratio FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.Diagnosis` = 'SLE';	thrombosis_prediction
SELECT p.`Diagnosis`, l.`Date` FROM `Patient` p JOIN `Laboratory` l ON p.`ID` = l.`ID` WHERE p.`ID` = 30609;	thrombosis_prediction
SELECT      p.SEX,      p.Birthday,      e.`Examination Date`,      e.`Symptoms` FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RVVT = '+'	thrombosis_prediction
SELECT      p.ID,      p.SEX,      e.Diagnosis  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.First_Date, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday BETWEEN '1937-01-01' AND '1937-12-31' AND l.T-CHO >= 250;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Diagnosis FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN P.SEX = 'F' AND L.TP < 6.0 OR L.TP > 8.5 THEN P.ID END) * 100.0) / COUNT(P.ID) AS percentage_female_out_of_normal_protein FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS avg_aCL_IgG FROM `Examination` WHERE `Admission` = '+' AND SUBSTR(`Birthday`, 6, 5) <= SUBSTR(CURRENT_DATE, 6, 5) - 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND YEAR(p.Description) = 1997 AND e.Admission = '-';	thrombosis_prediction
SELECT      MIN(         (YEAR(`First Date`) - YEAR(`Birthday`))          - (CASE              WHEN MONTH(`First Date`) > MONTH(`Birthday`) THEN 0              WHEN MONTH(`First Date`) = MONTH(`Birthday`) AND DAY(`First Date`) >= DAY(`Birthday`) THEN 0              ELSE 1          END     ) AS YoungestAge FROM      `Patient` WHERE      `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND YEAR(E.Examination Date) = 1997 AND P.SEX = 'F';	thrombosis_prediction
SELECT      MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM      Patient WHERE      ID IN (         SELECT              p.ID         FROM              Patient p         INNER JOIN              Laboratory l ON p.ID = l.ID         WHERE              l.TG >= 200     );	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.Symptoms, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT      MONTH(`Date`) AS Month,      COUNT(`Patient.ID`) / 12 AS AverageMalePatientsTested FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Patient.SEX = 'M' AND      `Date` BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY      Month;	thrombosis_prediction
SELECT Lab.Date, (YEAR(P.Birthday) - YEAR(P.First_Date)) AS Age_At_Admission FROM Patient P JOIN Laboratory Lab ON P.ID = Lab.ID WHERE P.Diagnosis LIKE '%SJS%' ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      SUM(CASE WHEN `Patient.SEX` = 'M' AND `Laboratory.UA` <= 8.0 THEN 1 ELSE 0 END) /      SUM(CASE WHEN `Patient.SEX` = 'F' AND `Laboratory.UA` <= 6.5 THEN 1 ELSE 0 END) AS Male_to_Female_Ratio FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.SEX` IN ('M', 'F') AND `Laboratory.UA` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID AND e.Examination_Date >= DATE_ADD(p.First_Date, INTERVAL 1 YEAR) WHERE e.ID IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday < '1990-01-01' AND Examination.Examination Date BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'M' AND `T-BIL` >= 2.0;	thrombosis_prediction
SELECT `Diagnosis`, COUNT(`Diagnosis`) AS DiagnosisCount FROM `Examination` WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY `Diagnosis` ORDER BY DiagnosisCount DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(CURRENT_DATE), YEAR(`Patient`.`Birthday`))) AS AverageAge FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`Date` BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT      P.Birthday,     P.Diagnosis,     TIMESTAMPDIFF(YEAR, P.Birthday, E.`Examination Date`) AS AgeAtExamination,     MAX(E.HGB) AS HighestHGB FROM      Patient P JOIN      Examination E ON P.ID = E.ID GROUP BY      P.ID ORDER BY      HighestHGB DESC LIMIT 1;	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT T-BIL <= 250 AS Cholesterol_Status FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis LIKE '%Aortitis%' ORDER BY e.Examination_Date ASC LIMIT 1;	thrombosis_prediction
SELECT aCL_IgM FROM Examination WHERE `Examination Date` = '1993-11-12' AND ID IN (     SELECT ID     FROM Patient     WHERE Description = '1994-02-19'     AND Diagnosis = 'SLE' );	thrombosis_prediction
SELECT P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX IN ('M', 'F') AND L.GPT = '9' AND L.Date = '1992-06-12';	thrombosis_prediction
SELECT     p.ID,     (YEAR('1991-10-21') - YEAR(p.Birthday)) AS AgeAtTestDate FROM     Patient p JOIN     Laboratory l ON p.ID = l.ID WHERE     l.UA = '8.4'     AND l.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(`Laboratory.ID`)  FROM `Laboratory` JOIN `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE `Patient.First Date` = '1991-06-13'  AND `Patient.Diagnosis` = 'SJS'  AND YEAR(`Laboratory.Date`) = 1995;	thrombosis_prediction
SELECT p.`Diagnosis` as OriginalDiagnosis FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE p.`First Date` = '1997-01-27' AND e.`Diagnosis` = 'SLE';	thrombosis_prediction
SELECT e.`Symptoms` FROM `Examination` e JOIN `Patient` p ON e.ID = p.ID WHERE p.`Birthday` = '1959-03-01' AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT     (SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN l.T-CHO ELSE 0 END) -      SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-12-%' THEN l.T-CHO ELSE 0 END)) /      SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN l.T-CHO ELSE 1 END) AS cholesterol_decrease_rate FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1959-02-18' AND l.Date BETWEEN '1981-11-01' AND '1981-12-31' AND l.T-CHO IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis LIKE '%Behcet%' AND e.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT `Patient.ID` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Examination.Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND `Examination.GPT` > 30 AND `Examination.ALB` < 4;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 2 AND E.ANA = 'S' AND E.aCL_IgM > (SELECT AVG(aCL_IgM) * 1.2 FROM Examination);	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 AND UA <= 6.5 THEN 1 END) * 100.0) /      COUNT(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 END) AS PercentageWithUricAcidBelowNormal FROM      Laboratory	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Diagnosis` = 'BEHCET' THEN 1 ELSE 0 END) * 100) /      COUNT(`ID`) AS PercentageOfMalePatientsDiagnosedWithBEHCET FROM      `Patient` WHERE      `SEX` = 'M' AND      YEAR(`First Date`) = 1981	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.First_Date, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.ANA IS NOT NULL AND E.ANA_PATTERN != 'P' AND P.SEX = 'F' AND P.Birthday BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS'  AND l.CRP > 2  AND l.CRE = 1  AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) AS Average_Blood_Albumin FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND Laboratory.PLT > 400 AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(Symptoms) AS MostCommonSymptom FROM Examination WHERE Diagnosis LIKE '%SLE%';	thrombosis_prediction
SELECT p.Birthday, pat.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 48473 ORDER BY e.Description ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'F' AND Examination.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE YEAR(Examination.Examination Date) = 1997 AND Examination.TP > 6 AND Examination.TP < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Symptoms` LIKE '%ITP%' THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN `Diagnosis` LIKE '%SLE%' THEN 1 ELSE 0 END) AS proportion FROM Examination;	thrombosis_prediction
SELECT      (SUM(CASE WHEN YEAR(`Birthday`) = '1980' AND `Diagnosis` = 'RA' AND `SEX` = 'F' THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN YEAR(`Birthday`) = '1980' AND `Diagnosis` = 'RA' THEN 1 ELSE 0 END)  FROM `Patient`;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.SEX = 'M' AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND E.Diagnosis LIKE '%Behcet%' AND E.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'F' AND e.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination.Date`, `Patient.First Date`) AS DaysToEvaluation FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.ID` = 821298;	thrombosis_prediction
SELECT EXISTS (     SELECT 1     FROM Laboratory     WHERE `ID` = 57266     AND ((`SEX` = 'M' AND UA > 8.0) OR (`SEX` = 'F' AND UA > 6.5)) ) AS IsUricAcidNormal;	thrombosis_prediction
SELECT Date  FROM Laboratory  WHERE ID = (SELECT ID FROM Patient WHERE `ID` = 48473)  AND GOT >= 60;	thrombosis_prediction
SELECT p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND YEAR(l.Date) = 1994;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT AVG(LDH) AS Average_LDH FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.LDH BETWEEN 600 AND 800     AND p.Birthday IS NOT NULL;	thrombosis_prediction
SELECT      P.ID,     P.Admission,     E.Diagnosis FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID JOIN      Examination E ON P.ID = E.ID WHERE      L.ALP < 300	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT      Patient.ID,      (Lab.TP - 8.5) AS TP_Deviation FROM      Laboratory AS Lab JOIN      Patient ON Lab.ID = Patient.ID WHERE      Patient.SEX = 'F' AND      Lab.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p WHERE p.SEX = 'M' AND p.ALB < 3.5 OR p.ALB >= 5.5 ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,      CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'         ELSE 'Not Within Normal Range'     END AS Albumin_Status FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      YEAR(p.Birthday) = 1982;	thrombosis_prediction
SELECT      ROUND((COUNT(*) FILTER (WHERE `Patient`.SEX = 'F' AND `Laboratory`.UA > 6.5) * 100.0) / COUNT(*), 2) AS percentage_female_beyond_normal_UA FROM      `Patient` JOIN      `Laboratory` ON `Patient`.ID = `Laboratory`.ID	thrombosis_prediction
SELECT AVG(`Laboratory.UA`) AS `Average_UA` FROM `Laboratory` JOIN `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE `Patient.SEX` = 'M' AND `Laboratory.UA` < 8.0    OR `Patient.SEX` = 'F' AND `Laboratory.UA` < 6.5 ORDER BY `Laboratory.Date` DESC LIMIT 1;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'RA' AND e.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT      SUM(CASE WHEN SEX = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END) AS MaleAboveNormal,     SUM(CASE WHEN SEX = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END) AS FemaleAboveNormal FROM      Patient WHERE      SEX IN ('M', 'F') AND CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory);	thrombosis_prediction
SELECT      p.SEX,      GROUP_CONCAT(DISTINCT e.ID) AS PatientIDs FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.T_BIL >= 2.0 GROUP BY      p.SEX;	thrombosis_prediction
SELECT      p.ID,      l.T-CHO  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      p.Birthday = (SELECT MIN(Birthday) FROM Patient)      AND l.T-CHO = (SELECT MAX(T-CHO) FROM Laboratory);	thrombosis_prediction
SELECT AVG(DIVIDE(SUBTRACT(YEAR(NOW()), YEAR(`Birthday`)), COUNT(`Patient.ID`))) AS average_age FROM `Patient` WHERE `SEX` = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT      p.ID,      p.Diagnosis  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      l.TG > 300;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT `Patient.ID` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.Admission` = '-' AND `Laboratory.CPK` < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND p.SEX = 'M' AND l.CPK >= 250;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday IS NOT NULL      AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) > 0      AND l.GLU >= 180      AND l.T-CHO < 250;	thrombosis_prediction
SELECT      p.ID,      l.GLU  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      p.Description LIKE '1991%'      AND l.GLU < 180;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      (l.WBC <= 3.5 OR l.WBC >= 9.0) GROUP BY      p.SEX, p.Birthday ORDER BY      p.SEX, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) ASC;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RBC < 3.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Admission FROM Patient p WHERE p.SEX = 'F' AND       (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday)) >= 50 AND       EXISTS (           SELECT 1           FROM Examination e           WHERE e.ID = p.ID AND                 (e.RBC <= 3.5 OR e.RBC >= 6.0)       );	thrombosis_prediction
SELECT Patient.ID, Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Admission = '-' AND Examination.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND p.Birthday IN (     SELECT MIN(Birthday)     FROM Patient     WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis = 'SLE' AND HGB BETWEEN 10 AND 17) ) ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID IN (         SELECT              ID          FROM              Laboratory          GROUP BY              ID          HAVING              COUNT(*) > 2 AND MAX(HCT) >= 52     );	thrombosis_prediction
SELECT AVG(`HCT`) AS AverageHematocritLevel FROM `Laboratory` WHERE `Date` LIKE '1991%' AND `HCT` < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS 'LowerThanNormalRange',     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS 'HigherThanNormalRange' FROM Laboratory;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1984 AND p.Birthday IS NOT NULL AND DATEDIFF(YEAR, p.Birthday, CURDATE()) < 50 AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END)) * 100, 2) AS PercentageOfFemalesWithAbnormalPT FROM      Patient WHERE      BIRTHDAY <= DATE_SUB(CURRENT_DATE, INTERVAL 55 YEAR)	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.FirstDate > '1992-12-31' AND l.PT < 14 AND p.FirstDate IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  WHERE e.APTT > 45 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND p.ID IN (SELECT ID FROM Laboratory WHERE WBC > 3.5 AND WBC < 9.0) AND p.ID IN (SELECT ID FROM Laboratory WHERE FG <= 150 OR FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Birthday > '1980-01-01' AND Laboratory.FG < 150 OR Laboratory.FG > 450;	thrombosis_prediction
SELECT DISTINCT e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`U-PRO` >= 30;	thrombosis_prediction
SELECT `Patient`.`ID` FROM `Patient` JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE `Examination`.`Diagnosis` = 'SLE' AND `Laboratory`.`U-PRO` BETWEEN 0 AND 30;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e WHERE e.aCL_IgG >= 2000;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE `aCL IgG` > 900 AND `aCL IgG` < 2000 AND `Symptoms` IS NOT NULL;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.IGA BETWEEN 80 AND 500 AND e.IGA = (SELECT MAX(IGA) FROM Examination WHERE IGA BETWEEN 80 AND 500)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`aCL IgA` > 80 AND e.`aCL IgA` < 500  AND p.`First Date` >= '1990-01-01';	thrombosis_prediction
SELECT      T1.Diagnosis,      COUNT(T1.Diagnosis) AS DiseaseCount FROM      Examination AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID WHERE      (T1.aCL_IgM <= 40 OR T1.aCL_IgM >= 400) GROUP BY      T1.Diagnosis ORDER BY      DiseaseCount DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID NOT IN (SELECT ID FROM Laboratory WHERE CRP = '+') AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE >= 1.5  AND (YEAR(CURDATE()) - YEAR(Patient.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE p.RA IN('-', '+-') AND e.KCT = '+';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday > '1985-01-01' AND e.RA IN('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 60 AND l.RF IS NULL OR l.RF < 20;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA = 256 AND e.ANA_Pattern = 'P' AND p.ID IN (     SELECT ID FROM Laboratory l WHERE l.C3 > 35 );	thrombosis_prediction
SELECT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.HCT < 29 OR P.HCT > 52 ORDER BY E.aCL_IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.Thrombosis = 1 AND Examination.C4 > 10;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RNP IN ('-', '+-') AND P.Admission = '+';	thrombosis_prediction
SELECT p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RNP NOT IN('-', '+-')  ORDER BY p.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SM IN('-', '+-') AND e.Thrombosis = 0;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SM NOT IN ('negative', '0') ORDER BY p.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E WHERE E.`Examination Date` > '1997-01-01' AND E.`SC170` IN('negative','0');	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.SC170 IN ('negative', '0') AND e.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.SSA IN('-','+-')  AND YEAR(Patient.First_Date) < 2000;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSA NOT IN('negative', '0') AND p.First_Date IS NOT NULL ORDER BY p.First_Date LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.SSB IN('-', '+-') AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.SSA = 'negative'  AND e.SSB = '0'  AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.CENTROMEA IN('-', '+-') AND E.SSB IN('-', '+-');	thrombosis_prediction
SELECT      p.ID,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.DNA < 8 AND Laboratory.DNA IS NOT NULL AND Patient.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.IGG BETWEEN 900 AND 2000 AND Patient.Admission = '+';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN L.GOT >= 60 AND E.Diagnosis = 'SLE' THEN E.ID ELSE NULL END) * 1.0) /      (COUNT(CASE WHEN L.GOT >= 60 THEN E.ID ELSE NULL END)) AS PercentageOfSLEPatientsWithAbnormalGOT FROM Examination E INNER JOIN Laboratory L ON E.ID = L.ID	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT >= 60 ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT p.Birthday, MAX(l.GPT) AS MaxGPT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 GROUP BY p.ID ORDER BY MaxGPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT < 60 AND p.SEX = 'M';	thrombosis_prediction
SELECT MIN(`First Date`) as FirstRecordedDate FROM `Patient` WHERE `ID` IN (     SELECT `ID`     FROM `Laboratory`     WHERE `LDH` < 500     ORDER BY `LDH` DESC     LIMIT 1 );	thrombosis_prediction
SELECT MAX(`Date`) AS LatestRecordDate FROM `Laboratory` WHERE `LDH` >= 500 AND `ID` = (     SELECT `ID`     FROM `Patient`     WHERE `First Date` = (         SELECT MAX(`First Date`)         FROM `Patient`     ) )	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.ALP >= 300 AND Patient.Admission = '+';	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE `ALP` < 300 AND `ID` IN (SELECT `ID` FROM Patient WHERE `Admission` = '-');	thrombosis_prediction
SELECT DISTINCT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5;	thrombosis_prediction
SELECT `Examination.Date` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Examination.ALB` = (SELECT MAX(`ALB`) FROM `Laboratory` WHERE `ALB` > 3.5 AND `ALB` < 5.5) AND `Examination.ID` IN (SELECT `ID` FROM `Laboratory` WHERE `ALB` > 3.5 AND `ALB` < 5.5);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M'  AND l.ALB > 3.5 AND l.ALB < 5.5  AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA` FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.SEX = 'F' AND E.UA > 6.50 ORDER BY E.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(`ANA`) AS Highest_ANA FROM `Examination` WHERE `CRE` < 1.5;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE < 1.5 AND l.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Laboratory);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT E.ANA FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.T_BIL < 2.0 AND P.ID = (     SELECT P2.ID     FROM Patient P2     JOIN Examination E2 ON P2.ID = E2.ID     WHERE E2.T_BIL < 2.0     ORDER BY E2.T_BIL DESC     LIMIT 1 );	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`T-CHO` >= 250 AND E.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.T-CHO < 250 AND e.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.TG < 200 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.`Diagnosis`  FROM `Patient` p  JOIN `Examination` e ON p.`ID` = e.`ID` WHERE e.`TG` < 200  AND e.`TG` = (SELECT MAX(`TG`) FROM `Examination` WHERE `TG` < 200)	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Thrombosis = 0 AND L.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID IN (SELECT ID FROM Laboratory WHERE GLU < 180) AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE `Admission` = '+' AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND WBC BETWEEN 3.5 AND 9.0 );	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Diagnosis = 'SLE' AND e.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE (e.RBC <= 3.5 OR e.RBC >= 6.0) AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.PLT > 100 AND E.PLT < 400 AND E.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID, e.PLT FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'MCTD' AND e.PLT > 100 AND e.PLT < 400;	thrombosis_prediction
SELECT AVG(`PT`) AS AveragePT FROM `Laboratory` WHERE `Patient_ID` IN (     SELECT `ID`     FROM `Patient`     WHERE `SEX` = 'M' ) AND `PT` < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis IN (1, 2) AND E.PT < 14;	thrombosis_prediction
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `major.college` = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design' AND m.position = 'Member';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*) FROM `member` JOIN `attendance` ON `member.member_id` = `attendance.link_to_member` JOIN `event` ON `attendance.link_to_event` = `event.event_id` WHERE `event.event_name` = 'Women''s Soccer' AND `member.t_shirt_size` = 'Medium';	student_club
SELECT e.event_name, COUNT(a.link_to_event) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.event_name LIKE '%Student_Club%' GROUP BY e.event_id, e.event_name ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT m.link_to_major, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT e.event_id)  FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND e.event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting'  AND event_id IN (     SELECT link_to_event      FROM attendance      GROUP BY link_to_event      HAVING COUNT(link_to_member) > 10 );	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 20 ) AND type != 'Fundraiser';	student_club
SELECT AVG(COUNT(a.event_id)) / COUNT(DISTINCT e.event_name) AS average_attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT `expense_description`, MAX(`cost`) AS `highest_cost` FROM `expense` GROUP BY `expense_description` ORDER BY `highest_cost` DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT      zip_code.county  FROM      member  JOIN      zip_code  ON      member.zip = zip_code.zip_code  WHERE      member.first_name = 'Sherri' AND      member.last_name = 'Ramsey';	student_club
SELECT `college` FROM `major` JOIN `member` ON `major.major_id` = `member.link_to_major` WHERE `member.first_name` = 'Tyler' AND `member.last_name` = 'Hewitt';	student_club
SELECT SUM(i.amount) AS total_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT m.zip, z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois';	student_club
SELECT SUM(b.spent) AS total_advertisement_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT m.link_to_major, ma.department FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Pierce' OR m.last_name = 'Guidi';	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'October Speaker';	student_club
SELECT expense_id, expense_description, expense_date, approved FROM expense JOIN event ON expense.link_to_budget IN (     SELECT budget_id     FROM budget     WHERE link_to_event IN (         SELECT event_id         FROM event         WHERE event_name = 'October Meeting' AND event_date = '2019-10-08'     ) ) WHERE approved = 'true';	student_club
SELECT SUM(cost) / COUNT(*) AS average_cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE CONCAT(SUBSTRING(expense.expense_date, 6, 2), SUBSTRING(expense.expense_date, 9, 2)) IN ('09', '10') AND CONCAT(member.first_name, ' ', member.last_name) = 'Elijah Allen';	student_club
SELECT      SUM(CASE WHEN LEFT(event_date, 4) = '2019' THEN spent ELSE 0 END) AS spent_2019,     SUM(CASE WHEN LEFT(event_date, 4) = '2020' THEN spent ELSE 0 END) AS spent_2020,     SUM(CASE WHEN LEFT(event_date, 4) = '2019' THEN spent ELSE 0 END) -       SUM(CASE WHEN LEFT(event_date, 4) = '2020' THEN spent ELSE 0 END) AS diff_spent FROM      budget WHERE      link_to_event IN (SELECT event_id FROM event WHERE LEFT(event_date, 4) IN ('2019', '2020'))	student_club
SELECT location  FROM event  WHERE event_name = 'Spring Budget Review';	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';	student_club
SELECT spent, remaining  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT notes  FROM income  WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone  FROM member  WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE link_to_event IN (     SELECT event_id     FROM event     WHERE event_name = 'November Meeting' ) AND remaining < 0;	student_club
SELECT SUM(b.amount) AS total_budget_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Speaker';	student_club
SELECT e.event_status FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT `zip_code`.`type` FROM `member` JOIN `zip_code` ON `member`.`zip` = `zip_code`.`zip_code` WHERE `member`.`first_name` = 'Christof' AND `member`.`last_name` = 'Nielson';	student_club
SELECT m.link_to_major, ma.major_name FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT `state` FROM `member` JOIN `zip_code` ON `member.zip` = `zip_code.zip_code` WHERE `first_name` = 'Sacha' AND `last_name` = 'Harrison';	student_club
SELECT m.link_to_major, ma.department FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT `date_received` FROM `income` WHERE `source` = 'Dues' AND `link_to_member` = (SELECT `member_id` FROM `member` WHERE `first_name` = 'Connor' AND `last_name` = 'Hilton');	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' AND i.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues');	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /       SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement' AND      (e.event_name = 'Yearly Kickoff' OR e.event_name = 'October Meeting');	student_club
SELECT     (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /       COUNT(CASE WHEN e.event_name = 'November Speaker' THEN 1 END)) * 100 AS parking_budget_percentage FROM     budget b JOIN     event e ON b.link_to_event = e.event_id WHERE     e.event_name = 'November Speaker'	student_club
SELECT SUM(`cost`) AS total_pizza_cost FROM `expense` WHERE `expense_description` = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) AS number_of_cities FROM zip_code WHERE state = 'Virginia' AND county = 'Orange County';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT b.budget_id, b.expense_description FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE b.remaining = (SELECT MIN(remaining) FROM budget) ORDER BY b.budget_id;	student_club
SELECT m.member_id, m.first_name, m.last_name, m.email, m.position, m.t_shirt_size, m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT m.link_to_major, COUNT(*) AS member_count FROM member m JOIN major ma ON m.link_to_major = ma.major_id GROUP BY m.link_to_major ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360';	student_club
SELECT `event_name`, MAX(`amount`) AS highest_budget FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` GROUP BY `event_name` ORDER BY highest_budget DESC LIMIT 1;	student_club
SELECT e.expense_description, e.expense_date, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT date_received FROM income WHERE link_to_member = 'rec1x5zBFIqoOuPW8' AND first_name = 'Casey' AND last_name = 'Mason';	student_club
SELECT COUNT(*)  FROM `member`  JOIN `zip_code` ON `member`.`zip` = `zip_code`.`zip_code`  WHERE `zip_code`.`state` = 'Maryland';	student_club
SELECT COUNT(*) FROM `attendance` JOIN `member` ON `attendance.link_to_member` = `member.member_id` WHERE `member.phone` = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT      `event_name`,      `event_id`,      (SELECT MAX(DIVIDE(spent, amount))       FROM `budget`       WHERE `link_to_event` = `event`.`event_id` AND `event_status` = 'Closed') FROM      `event`  WHERE      `status` = 'Closed'	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_budget_spent FROM budget WHERE event_status = 'Closed';	student_club
SELECT COUNT(*) FROM `event` WHERE `type` = 'Meeting' AND YEAR(`event_date`) = 2020;	student_club
SELECT SUM(b.spent) AS total_food_spent FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT first_name, last_name FROM `member` WHERE `zip` IN (     SELECT `zip_code`     FROM `zip_code`     WHERE `city` = 'Georgetown' AND `state` = 'South Carolina' ) AND `link_to_major` IS NOT NULL;	student_club
SELECT SUM(amount) AS total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT      m.first_name,      m.last_name,      i.amount  FROM      member m  JOIN      income i ON m.member_id = i.link_to_member  WHERE      i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense AS ex JOIN event AS ev ON ex.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'Yearly Kickoff'))	student_club
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS max_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id, m.first_name, m.last_name, i.source ORDER BY max_income DESC LIMIT 1;	student_club
SELECT `event_name`, MIN(`amount`) AS `lowest_cost` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.amount` IS NOT NULL GROUP BY `event_name` ORDER BY `lowest_cost` ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.cost ELSE 0 END) / SUM(b.cost)) * 100 AS Yearly_Kickoff_Percentage FROM      event e JOIN      budget b ON e.event_id = b.link_to_event;	student_club
SELECT      (SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) / SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END)) AS finance_to_physics_ratio FROM      member m JOIN      major ma ON m.link_to_major = ma.major_id WHERE      ma.major_name = 'Finance' OR      ma.major_name = 'Physics';	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS member_count FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(a.link_to_event) AS events_attended, m.link_to_major FROM `attendance` a JOIN `member` m ON a.link_to_member = m.member_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' GROUP BY m.member_id;	student_club
SELECT AVG(spent) / COUNT(*)  FROM budget  WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT `event_name` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.category` = 'Advertisement' ORDER BY `budget.spent` DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM event JOIN member ON event.event_id = attendance.link_to_event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member AS m ON attendance.link_to_member = m.member_id WHERE event.event_name = 'Women''s Soccer' AND m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT      (SUM(CASE WHEN e.event_name LIKE '%Community Service%' THEN 1 ELSE 0 END) * 100.0) / COUNT(e.event_id) AS community_service_percentage FROM      event e WHERE      e.event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT SUM(e.cost) AS total_cost FROM expense e JOIN event ev ON e.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Speaker')) WHERE e.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(t_shirt_size) AS size_count FROM `member` GROUP BY t_shirt_size ORDER BY size_count DESC LIMIT 1;	student_club
SELECT event_name FROM event WHERE status = 'Closed' AND link_to_event IN (     SELECT link_to_event     FROM budget     WHERE remaining < 0     ORDER BY ABS(remaining) DESC     LIMIT 1 );	student_club
SELECT      e.event_name,      e.type,      SUM(e.cost) AS total_value FROM      expense e JOIN      event ev ON e.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'October Meeting')) GROUP BY      e.event_name, e.type;	student_club
SELECT category, SUM(amount) AS total_amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY category ORDER BY total_amount ASC;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Advertisement' ORDER BY `amount` DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_parking_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT m.major_name FROM major m JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.first_name = 'Phillip' AND mem.last_name = 'Cullen';	student_club
SELECT m.position  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*)  FROM `member` m  JOIN `major` ma ON m.`link_to_major` = ma.`major_id`  WHERE ma.`major_name` = 'Business' AND m.`t_shirt_size` = 'Medium';	student_club
SELECT `event_name`, `type`, `remaining` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.remaining` > 30;	student_club
SELECT DISTINCT `event`.`type` AS event_category FROM `event` WHERE `event`.`location` = 'MU 215';	student_club
SELECT `type` FROM `event` WHERE `event_date` = '2020-03-24T12:00:00';	student_club
SELECT m.link_to_major, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT      ROUND(         (SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.member_id),         2     ) AS percentage_business_members FROM      member m JOIN      major ma ON m.link_to_major = ma.major_id;	student_club
SELECT `event_name`, `type` FROM `event` WHERE `location` = 'MU 215';	student_club
SELECT COUNT(*)  FROM `income`  WHERE `amount` = 50;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.major_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT `budget.category` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `event.location` = 'MU 215' AND `event.type` = 'Guest Speaker' AND `budget.spent` = 0;	student_club
SELECT m.zip, z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN member m ON e.event_id = (     SELECT a.link_to_event     FROM attendance a     JOIN member mem ON a.link_to_member = mem.member_id     WHERE mem.position = 'Vice President' ) WHERE e.type = 'Social' AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      ROUND(         (COUNT(CASE WHEN m.t_shirt_size = 'Medium' AND i.amount = 50 THEN 1 END) * 100.0) /          COUNT(m.member_id),         2     ) AS percentage_of_50_dues_received FROM      member m JOIN      income i ON m.member_id = i.link_to_member WHERE      m.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT zc.state FROM zip_code zc WHERE zc.type = 'PO Box';	student_club
SELECT DISTINCT zc.zip_code FROM zip_code zc JOIN member m ON zc.zip = m.zip WHERE zc.state = 'Puerto Rico' AND zc.city = 'San Juan Municipio' AND zc.type = 'PO Box';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense ex ON ex.link_to_budget = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE ex.cost > 50;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_name, e.event_id FROM member m JOIN expense ex ON m.member_id = ex.link_to_member JOIN event e ON ex.link_to_event = e.event_id WHERE ex.approved = 'true' AND ex.expense_date BETWEEN '2019-01-10' AND '2019-11-19' AND m.member_id IN (     SELECT a.link_to_member     FROM attendance a     WHERE a.link_to_event IN (         SELECT event_id FROM event WHERE event_date BETWEEN '2019-01-10' AND '2019-11-19'     ) );	student_club
SELECT m.link_to_major, ma.college FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Agriculture and Applied Sciences' AND ma.major_name = 'Business';	student_club
SELECT DISTINCT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Education' AND ma.college = 'College of Education & Human Services';	student_club
SELECT      (SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) / COUNT(e.event_id)) * 100 AS over_budget_percentage FROM      event e JOIN      budget b ON e.event_id = b.link_to_event	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, expense_description, expense_date, cost FROM expense WHERE cost > 50 GROUP BY expense_id, expense_description, expense_date, cost HAVING AVG(cost) > 50;	student_club
SELECT first_name, last_name FROM `member` WHERE t_shirt_size = 'X-Large';	student_club
SELECT      (SUM(CASE WHEN `type` = 'PO Box' THEN 1 ELSE 0 END) / COUNT(`zip_code`)) * 100 AS percentage_po_box FROM `zip_code`;	student_club
SELECT `event_name`, `location` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.remaining` > 0 AND `budget.event_status` = 'Closed';	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT      CONCAT(m.first_name, ' ', m.last_name) AS full_name,      ma.major_name FROM      member m JOIN      expense e ON m.member_id = e.link_to_member JOIN      major ma ON m.link_to_major = ma.major_id WHERE      e.cost > 100;	student_club
SELECT z.city, z.state FROM event e JOIN income i ON e.event_id = i.link_to_member JOIN member m ON i.link_to_member = m.member_id JOIN zip_code z ON m.zip = z.zip_code GROUP BY e.event_id HAVING COUNT(i.income_id) > 40;	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id, m.first_name, m.last_name HAVING COUNT(DISTINCT e.link_to_event) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(cost) AS average_amount_paid FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE position <> 'Member';	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT link_to_event     FROM expense     JOIN budget ON expense.link_to_budget = budget.budget_id     WHERE budget.category = 'Parking'     GROUP BY link_to_event     HAVING SUM(cost) < (         SELECT SUM(cost) / COUNT(event_id)         FROM budget         WHERE category = 'Parking'     ) );	student_club
SELECT      (SUM(e.cost) / COUNT(e.event_id)) * 100 AS percentage_cost_of_meetings FROM      event e WHERE      e.type = 'Meeting';	student_club
SELECT      b.budget_id,      b.amount FROM      budget b JOIN      expense e ON b.budget_id = e.link_to_budget WHERE      e.expense_description = 'Water, chips, cookies' GROUP BY      b.budget_id ORDER BY      SUM(e.cost) DESC LIMIT 1;	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,      SUM(e.cost) AS total_spent FROM      expense e JOIN      member m ON e.link_to_member = m.member_id GROUP BY      m.member_id ORDER BY      total_spent DESC LIMIT 5;	student_club
SELECT      m.first_name,      m.last_name,      m.phone FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT     SUBTRACT(         DIVIDE(SUM(CASE WHEN state = 'New Jersey' THEN 1 ELSE 0 END), COUNT(position = 'Member')),         DIVIDE(SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END), COUNT(position = 'Member'))     ) AS percentage_difference FROM     member WHERE     position = 'Member';	student_club
SELECT m.major_name, m.department FROM major m JOIN member me ON m.major_id = me.link_to_major WHERE me.first_name = 'Garrett' AND me.last_name = 'Gerke';	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,      e.cost FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      e.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT `budget`.`category`, `budget`.`amount` FROM `budget` JOIN `event` ON `budget`.`link_to_event` = `event`.`event_id` WHERE `event`.`event_name` = 'January Speaker';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT `category` FROM `budget` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` WHERE `expense.expense_description` = 'Posters';	student_club
SELECT m.first_name, m.last_name, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent_on_gifts FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT m.first_name, m.last_name, z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.city = 'Lincolnton' AND zc.state = 'North Carolina' AND zc.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN c.Currency = 'CZK' THEN 1 END)) AS EUR_to_CZK_Ratio FROM      customers c;	debit_card_specializing
SELECT ym.CustomerID, MIN(ym.Consumption) as MinConsumption FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'LAM' AND ym.Date BETWEEN '201201' AND '201212' GROUP BY ym.CustomerID ORDER BY MinConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS Average_Monthly_Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS TotalConsumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE c.Currency = 'CZK' AND g.Country = 'CZE' AND t.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) AS customers_with_consumption_below_30000 FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' AND ym.Consumption < 30000 AND ym.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT     (SUM(CASE WHEN ym.Date BETWEEN '201201' AND '201212' THEN ym.Consumption ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'CZK' THEN ym.Consumption ELSE 0 END)) AS CZK_EUR_consumption_difference FROM     yearmonth ym JOIN     customers c ON ym.CustomerID = c.CustomerID WHERE     c.Currency = 'CZK'	debit_card_specializing
SELECT      YEAR(`Date`) AS `Year`,      SUM(`Consumption`) AS `TotalConsumption` FROM      `yearmonth` WHERE      `Currency` = 'EUR' GROUP BY      `Year` ORDER BY      `TotalConsumption` DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT      SUBSTR(Date, 1, 4) AS Year,      SUM(Consumption) AS TotalConsumption FROM      yearmonth WHERE      Country = 'CZE' GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT `Date` AS PeakMonth FROM `yearmonth` WHERE `CustomerID` IN (     SELECT `CustomerID`     FROM `customers`     WHERE `Segment` = 'SME' ) AND `Date` BETWEEN '201301' AND '201312' ORDER BY `Consumption` DESC LIMIT 1;	debit_card_specializing
WITH SegmentAverage AS (     SELECT          c.Segment,          AVG(y.Consumption) AS AvgConsumption     FROM          yearmonth y     JOIN          customers c ON y.CustomerID = c.CustomerID     WHERE          y.Date BETWEEN '201301' AND '201312'     GROUP BY          c.Segment ), LowestConsumption AS (     SELECT          Segment,          MIN(AvgConsumption) AS MinAvgConsumption     FROM          SegmentAverage     GROUP BY          Segment ), SegmentLowestAverage AS (     SELECT          sa.Segment,          sa.AvgConsumption     FROM          SegmentAverage sa     JOIN          LowestConsumption lc ON sa.AvgConsumption = lc.MinAvgConsumption ), SMEvsLAM AS (     SELECT          (sla.AvgConsumption - lla.AvgConsumption) AS Difference     FROM          SegmentLowestAverage sla     JOIN          customers c ON sla.Segment = c.Segment     JOIN          LowestConsumption lc ON sla.AvgConsumption = lc.MinAvgConsumption     WHERE          c.Segment = 'SME' AND lc.Segment = 'LAM' ), LAMvsKAM AS (     SELECT          (sla.AvgConsumption - lla.AvgConsumption) AS Difference     FROM          SegmentLowestAverage sla     JOIN          customers c ON sla.Segment = c.Segment     JOIN          LowestConsumption lc ON sla.AvgConsumption = lc.MinAvgConsumption     WHERE          c.Segment = 'LAM' AND lc.Segment = 'KAM' ), KAMvsSME AS (     SELECT          (sla.AvgConsumption - lla.AvgConsumption) AS Difference     FROM          SegmentLowestAverage sla     JOIN          customers c ON sla.Segment = c.Segment     JOIN          LowestConsumption lc ON sla.AvgConsumption = lc.MinAvgConsumption     WHERE          c.Segment = 'KAM' AND lc.Segment = 'SME' ) SELECT      Difference FROM SMEvsLAM UNION ALL SELECT      Difference FROM LAMvsKAM UNION ALL SELECT      Difference FROM KAMvsSME;	debit_card_specializing
WITH ConsumptionBySegment AS (     SELECT          c.Segment,         ym.CustomerID,         SUM(CASE WHEN LEFT(ym.Date, 4) = '2012' THEN ym.Consumption ELSE 0 END) AS Cons_2012,         SUM(CASE WHEN LEFT(ym.Date, 4) = '2013' THEN ym.Consumption ELSE 0 END) AS Cons_2013     FROM yearmonth ym     JOIN customers c ON ym.CustomerID = c.CustomerID     GROUP BY c.Segment, ym.CustomerID ), SegmentIncrease AS (     SELECT          Segment,         Cons_2013,         Cons_2012,         (Cons_2013 - Cons_2012) AS Increase,         (Cons_2013 - Cons_2012) / Cons_2013 * 100 AS PercentageIncrease     FROM ConsumptionBySegment     WHERE Cons_2013 IS NOT NULL AND Cons_2012 IS NOT NULL ), MaxMinSegmentIncrease AS (     SELECT          Segment,         MAX(PercentageIncrease) AS MaxIncrease,         MIN(PercentageIncrease) AS MinIncrease     FROM SegmentIncrease     GROUP BY Segment ) SELECT      si.Segment,     si.MaxIncrease,     si.MinIncrease FROM SegmentIncrease si JOIN MaxMinSegmentIncrease msi ON si.Segment = msi.Segment WHERE si.MaxIncrease = msi.MaxIncrease OR si.MinIncrease = msi.MinIncrease;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount')     - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS DiscountGasStationsDifference;	debit_card_specializing
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference	debit_card_specializing
SELECT      (SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN t.Amount ELSE 0 END)       FROM transactions_1k t      JOIN customers c ON t.CustomerID = c.CustomerID      WHERE c.Segment = 'SME') -      (SELECT SUM(CASE WHEN c.Currency = 'EUR' THEN t.Amount ELSE 0 END)       FROM transactions_1k t      JOIN customers c ON t.CustomerID = c.CustomerID      WHERE c.Segment = 'SME') AS CZK_EUR_Difference;	debit_card_specializing
SELECT ym.CustomerID FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,      SUM(ym.Consumption) AS TotalConsumption FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      c.Segment = 'KAM' GROUP BY      c.CustomerID ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `CustomerID` IN (SELECT `CustomerID` FROM `customers` WHERE `Segment` = 'KAM') AND `Date` = '201305';	debit_card_specializing
SELECT     ROUND(         (COUNT(*) * 100.0) / SUM(CASE WHEN Consumption > 46.73 THEN 1 ELSE 0 END),         2     ) AS Percentage FROM     yearmonth WHERE     CustomerID IN (         SELECT             CustomerID         FROM             customers         WHERE             Segment = 'LAM'     );	debit_card_specializing
SELECT      g.Country,      COUNT(*) AS TotalValueForMoneyGasStations FROM      gasstations g WHERE      g.Segment = 'Value for money' GROUP BY      g.Country ORDER BY      TotalValueForMoneyGasStations DESC;	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0) / COUNT(c.CustomerID) AS EuroPaymentPercentage FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      c.Segment = 'KAM';	debit_card_specializing
SELECT     ROUND(         (COUNT(*) FILTER (WHERE Consumption > 528.3) * 100.0) / COUNT(*),         2     ) AS Percentage FROM     yearmonth WHERE     Date = '201202';	debit_card_specializing
SELECT      (COUNT(CASE WHEN `GasStationID` IN (SELECT `GasStationID` FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Premium') THEN 1 END) * 100.0) / COUNT(`GasStationID`) AS PercentagePremiumGasStations FROM `gasstations` WHERE `Country` = 'CZE';	debit_card_specializing
SELECT CustomerID, SUM(Consumption) as TotalConsumption FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT      c.Segment,      SUM(y.Consumption) AS TotalConsumption FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      y.Date = '201309' GROUP BY      c.Segment ORDER BY      TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'SME' AND ym.Date = '201206' ORDER BY ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) AS Highest_Monthly_Consumption FROM yearmonth WHERE Date LIKE '201201%'	debit_card_specializing
SELECT ym.CustomerID, MAX(ym.Consumption) AS MaxMonthlyConsumption FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY ym.CustomerID ORDER BY MaxMonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE SUBSTR(y.Date, 5, 2) = '09' AND SUBSTR(y.Date, 1, 4) = '2013';	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date LIKE '201306'	debit_card_specializing
SELECT DISTINCT g.`ChainID` FROM `gasstations` g JOIN `transactions_1k` t ON g.`GasStationID` = t.`GasStationID` JOIN `customers` c ON t.`CustomerID` = c.`CustomerID` WHERE c.`Currency` = 'EUR' AND g.`Country` = 'CZE';	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(`Price` * `Amount`) AS AverageTotalPrice FROM `transactions_1k` WHERE `Date` LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t1 JOIN gasstations t2 ON t1.GasStationID = t2.GasStationID WHERE t2.Country = 'CZE' AND t1.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM `transactions_1k` JOIN `gasstations` ON `transactions_1k.GasStationID` = `gasstations.GasStationID` WHERE `gasstations.Country` = 'CZE' AND `transactions_1k.Date` > '2012-01-01';	debit_card_specializing
SELECT AVG(TotalPrice) AS AverageTotalPrice FROM (     SELECT (T.Amount * T.Price) AS TotalPrice     FROM `transactions_1k` AS T     JOIN `gasstations` AS G ON T.GasStationID = G.GasStationID     WHERE G.Country = 'CZE' ) AS PriceSum;	debit_card_specializing
SELECT AVG(T.Price * T.Amount) AS AverageTotalPrice FROM `transactions_1k` AS T JOIN `customers` AS C ON T.CustomerID = C.CustomerID WHERE C.Currency = 'EUR';	debit_card_specializing
SELECT      c.CustomerID,      SUM(t.Amount * t.Price) AS TotalSpent FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      y.Date = '2012-08-25' GROUP BY      c.CustomerID ORDER BY      TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-23' AND ym.Consumption IS NOT NULL;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Price IS NOT NULL;	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT g.Country FROM transactions_1k t1 JOIN gasstations g ON t1.GasStationID = g.GasStationID WHERE t1.Date = '2012-08-24' AND t1.Time = '12:42:00';	debit_card_specializing
SELECT `transactions_1k.ProductID` FROM `transactions_1k` WHERE `Date` = '2012-08-23' AND `Time` = '21:20:00';	debit_card_specializing
SELECT      ym.Consumption AS January_2012_Expenses,     ym.Date AS Date_of_January_2012 FROM      yearmonth ym WHERE      ym.CustomerID = (         SELECT              t1k.CustomerID         FROM              transactions_1k t1k         WHERE              t1k.Price = 124.05 AND              DATE(t1k.Date) = '2012-08-24'     ) AND      ym.Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Time BETWEEN '08:00:00' AND '09:00:00' AND g.Country = 'CZE' AND DATE(t.Date) = '2012-08-26';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-24' AND ym.Consumption = 548.4;	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0) / COUNT(*) AS PercentageOfEURCustomers FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      ym.Date = '2012-08-25';	debit_card_specializing
SELECT     (consumption_2012 - consumption_2013) / consumption_2012 AS ConsumptionDecreaseRate FROM (     SELECT         ym1.Consumption AS consumption_2012,         COALESCE(ym2.Consumption, 0) AS consumption_2013     FROM         yearmonth ym1         LEFT JOIN yearmonth ym2 ON ym1.CustomerID = ym2.CustomerID AND ym2.Date LIKE '2013%'     WHERE         ym1.Date = '201208' ) AS rates WHERE     consumption_2013 > 0	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS Revenue FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      gasstations g WHERE      g.Country = 'SVK';	debit_card_specializing
SELECT SUM(t.Amount * t.Price) AS TotalAmountSpent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508;  SELECT SUM(y.Consumption) AS TotalSpentInJanuary2012 FROM yearmonth y WHERE y.CustomerID = 38508 AND y.Date = '201201';	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS TotalAmount FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.Description ORDER BY TotalAmount DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,     AVG(t.Price / t.Amount) AS avg_price_per_item,     c.Currency FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      c.CustomerID, c.Currency ORDER BY      SUM(t.Price / t.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country, MAX(t.Price) AS MaxPrice FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.ProductID = 2 GROUP BY g.Country ORDER BY MaxPrice DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN products p ON t.ProductID = p.ProductID WHERE t.Date = '201208' AND t.ProductID = 5 AND (t.Price / t.Amount) > 29.00;	debit_card_specializing
