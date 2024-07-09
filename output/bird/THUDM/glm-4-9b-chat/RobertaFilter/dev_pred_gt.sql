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
SELECT frpm.`Percent (%) Eligible Free (K-12)`, frpm.`District Code` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode JOIN frpm_admin ON schools.AdmFName1 = 'Alusine' WHERE schools.AdmFName1 = 'Alusine';	california_schools
SELECT s.LastUpdate, s.County, s.District, s.School, s.AdmLName1 FROM schools s WHERE s.CharterNum = '40';	california_schools
SELECT s.AdmEmail1, s.AdmEmail2, s.AdmEmail3 FROM schools s WHERE s.County = 'San Bernardino' AND s.District = 'San Bernardino City Unified' AND s.OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (s.SOC = '62' OR s.DOC = '54') AND (s.SOCType = 'Intermediate/Middle Schools' OR s.DOCType = 'Unified Schools') AND (s.AdmEmail1 IS NOT NULL OR s.AdmEmail2 IS NOT NULL OR s.AdmEmail3 IS NOT NULL);	california_schools
SELECT      s.AdmEmail1 AS AdminEmail,      ss.sname AS SchoolName FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      ss.NumGE1500 > 0     AND s.CDSCode IN (SELECT cds FROM satscores WHERE NumGE1500 > 0 GROUP BY cds ORDER BY SUM(NumGE1500) DESC LIMIT 1)	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id WHERE dt.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND NOT EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = a.account_id );	financial
SELECT      (SELECT AVG(A12) FROM district WHERE A12 IS NOT NULL AND A12 != 0) AS avg_unemployment_1995,     (SELECT AVG(A13) FROM district WHERE A13 IS NOT NULL AND A13 != 0) AS avg_unemployment_1996 WHERE      (SELECT AVG(A12) FROM district WHERE A12 IS NOT NULL AND A12 != 0) >      (SELECT AVG(A13) FROM district WHERE A13 IS NOT NULL AND A13 != 0)	financial
SELECT COUNT(*)  FROM district  WHERE A11 > 6000 AND A11 < 10000 AND A7 = 'F';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;	financial
SELECT      c.client_id AS account_number,     d.A11 AS average_salary FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      c.gender = 'F' ORDER BY      c.birth_date DESC,      d.A11 LIMIT 1;  SELECT      (SELECT MAX(d.A11) FROM district d JOIN client c ON c.district_id = d.district_id WHERE c.gender = 'F') -      (SELECT MIN(d.A11) FROM district d JOIN client c ON c.district_id = d.district_id WHERE c.gender = 'F') AS salary_gap;	financial
SELECT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE district_id = d.district_id ) ORDER BY d.A11 DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT DISTINCT d.client_id FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date BETWEEN '1997-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND YEAR(a.date) = 1993 ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Sokolov';	financial
SELECT account_id FROM account WHERE date LIKE '1995%' ORDER BY date ASC LIMIT 1;	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.type = 'PRIJEM' AND t.amount > 3000 GROUP BY a.account_id;	financial
SELECT c.client_id FROM client c JOIN card card ON c.client_id = card.disp_id JOIN disp disp ON disp.disp_id = card.disp_id WHERE disp.issued = '1994-03-03';	financial
SELECT account.date FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.date = '1998-10-14' AND trans.amount = 840	financial
SELECT d.district_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.date = '1994-08-25' AND d.type = 'OWNER';	financial
SELECT MAX(trans.amount) AS max_transaction_amount FROM trans JOIN card ON trans.account_id = card.card_id JOIN disp ON trans.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE DATE(trans.date) = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND d.A11 = (SELECT A11 FROM district ORDER BY A11 DESC LIMIT 1);	financial
SELECT t.amount AS first_transaction_amount FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `account` a ON d.account_id = a.account_id JOIN `loan` l ON a.account_id = l.account_id JOIN `trans` t ON a.account_id = t.account_id WHERE l.amount = (SELECT MAX(amount) FROM `loan`) AND t.date = (SELECT MIN(date) FROM `trans` WHERE account_id = a.account_id)	financial
SELECT COUNT(*) FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A2 = 'Jesenik';	financial
SELECT d.disp_id FROM `disp` d JOIN `client` c ON d.client_id = c.client_id JOIN `trans` t ON d.account_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(*) FROM account WHERE date BETWEEN '1996-01-01' AND '1996-12-31' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice');	financial
SELECT d.A2 AS district_name FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp d2 ON a.account_id = d2.account_id JOIN client c ON d2.client_id = c.client_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1;	financial
SELECT      (SELECT COUNT(*) FROM `client` WHERE `gender` = 'M' AND `district_id` IN (         SELECT `district_id` FROM `district` WHERE `A3` = 'South Bohemia'     )) /      (SELECT COUNT(*) FROM `client` WHERE `district_id` IN (         SELECT `district_id` FROM `district` WHERE `A3` = 'South Bohemia'     )) * 100 AS percentage_male_clients FROM `district` WHERE `A3` = 'South Bohemia' AND `A10` = (     SELECT MAX(`A10`) FROM `district` WHERE `A3` = 'South Bohemia' );	financial
SELECT      ((T1.balance - T2.balance) / T2.balance) * 100 AS increase_rate FROM      (SELECT account_id, balance FROM trans WHERE account_id = (         SELECT account_id FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.date = '1993-07-05'     ) AND date = '1993-03-22'     ) AS T1,     (SELECT balance FROM trans WHERE account_id = (         SELECT account_id FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.date = '1993-07-05'     ) AND date = '1998-12-27'     ) AS T2	financial
SELECT      (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS paid_percentage FROM      loan l;	financial
SELECT      (COUNT(CASE WHEN l.amount < 100000 AND l.status = 'C' THEN 1 END) * 100.0) / COUNT(*) AS percentage_running_no_issue FROM      loan l;	financial
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dt ON c.district_id = dt.district_id WHERE dt.A3 = 'central Bohemia' AND YEAR(a.date) BETWEEN 1995 AND 2000;	financial
SELECT `account.account_id`, `account.date` FROM `account` JOIN `district` ON `account.district_id` = `district.district_id` WHERE `district.A2` = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN district ON d.district_id = district.district_id WHERE l.duration = 60;	financial
SELECT      d.A2 AS district,     ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM      district d JOIN      loan l ON d.district_id = l.account_id WHERE      l.status = 'D' AND     d.A13 IS NOT NULL AND     d.A12 IS NOT NULL;	financial
SELECT      (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM account WHERE YEAR(date) = 1993)) AS percentage_of_1993_accounts FROM      account  WHERE      district_id IN (SELECT district_id FROM district WHERE A2 = 'Decin') AND YEAR(date) = 1993;	financial
SELECT account_id FROM account WHERE `frequency` = 'POPLATEK MESICNE' GROUP BY account_id HAVING COUNT(*) = 1;	financial
SELECT d.A2 AS District, COUNT(c.client_id) AS FemaleAccountHolders FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY FemaleAccountHolders DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND a.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'South Bohemia' AND c.client_id NOT IN (     SELECT DISTINCT cl.client_id     FROM client cl     JOIN disp d ON cl.client_id = d.client_id     JOIN card cr ON d.disp_id = cr.disp_id );	financial
SELECT      d.A3 AS district_name,      COUNT(l.loan_id) AS active_loans_count FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      district d ON a.district_id = d.district_id WHERE      l.status IN ('C', 'D') GROUP BY      d.A3 ORDER BY      active_loans_count DESC LIMIT 1;	financial
SELECT AVG(amount) AS average_loan_amount FROM loan WHERE account_id IN (     SELECT account_id     FROM account     JOIN client ON account.district_id = client.district_id     WHERE client.gender = 'M' );	financial
SELECT `A2`, `A3` FROM `district` WHERE `A13` = (SELECT MAX(`A13`) FROM `district` WHERE `A12` = '1996');	financial
SELECT COUNT(a.account_id) AS num_accounts_opened FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1996 GROUP BY d.district_id ORDER BY SUM(CAST(SUBSTRING(d.A16, 1, 1) AS UNSIGNED)) DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT t.account_id)  FROM `trans` t JOIN `account` a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU'  AND t.balance < 0  AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.status = 'A';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Hl.m. Praha' AND (l.status = 'C' OR l.status = 'D');	financial
SELECT COUNT(c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A15 = (     SELECT MAX(d2.A15) - 1      FROM district d2      WHERE d2.A15 < (SELECT MAX(d3.A15) FROM district d3)     AND d2.A15 > 0 )  AND c.gender = 'M';	financial
SELECT COUNT(DISTINCT c.card_id) FROM card c JOIN disp d ON c.card_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Pisek';	financial
SELECT d.A2 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY d.district_id HAVING SUM(CASE WHEN t.type = 'PRIJEM' THEN t.amount ELSE 0 END) > 10000;	financial
SELECT o.account_id FROM `order` o JOIN account a ON o.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek' AND o.k_symbol = 'SIPO';	financial
SELECT DISTINCT a.account_id FROM account AS a JOIN card AS c ON a.account_id = c.disp_id JOIN disp AS d ON a.account_id = d.account_id WHERE c.type = 'gold';	financial
SELECT AVG(amount) AS avg_credit_card_withdrawn FROM trans WHERE type = 'VYBER KARTOU' AND date >= '2021-01-01' AND date < '2022-01-01';	financial
SELECT DISTINCT t.account_id FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.type = 'PRIJEM' AND t.operation = 'VYBER KARTOU' AND t.date BETWEEN '1998-01-01' AND '1998-12-31' AND t.amount < (SELECT AVG(amount) FROM trans WHERE type = 'PRIJEM' AND operation = 'VYBER KARTOU' AND date BETWEEN '1998-01-01' AND '1998-12-31')	financial
SELECT DISTINCT c.client_id, c.gender FROM client c JOIN account a ON c.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN card cr ON d.client_id = cr.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND cr.type = 'gold' AND l.status = 'A';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 LIKE '%South Bohemia%';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp d2 ON a.account_id = d2.account_id WHERE d.A2 = 'Tabor' AND d2.type = 'OWNER';	financial
SELECT DISTINCT a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency != 'OWNER'  AND d.A11 BETWEEN 8000 AND 9000;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON a.district_id = dt.district_id JOIN trans t ON a.account_id = t.account_id WHERE dt.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(crime_count) AS avg_crimes FROM (     SELECT A15 AS crime_count     FROM district     WHERE A3 IN ('Hl.m. Praha', 'Benesov', 'Beroun', 'Kladno', 'Kolin')     AND A15 > 4000     AND EXISTS (         SELECT 1         FROM account         WHERE district_id = district.district_id         AND YEAR(date) >= 1997     ) ) AS crime_regions;	financial
SELECT COUNT(*)  FROM `card` JOIN `disp` ON `card.disp_id` = `disp.disp_id` JOIN `account` ON `disp.account_id` = `account.account_id` WHERE `card.type` = 'classic'  AND `disp.type` = 'OWNER';	financial
SELECT COUNT(c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Hl.m. Praha' AND c.gender = 'M';	financial
SELECT      (COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0) / COUNT(c.card_id) AS gold_issued_percent FROM      `card` c;	financial
SELECT c.client_id, c.gender, c.birth_date, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT SUM(A15) AS total_crimes_1995 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532);	financial
SELECT account.district_id  FROM account  JOIN order ON account.account_id = order.account_id  WHERE order.order_id = 33333;	financial
SELECT t.account_id, t.date, t.amount FROM `trans` t JOIN `disp` d ON t.account_id = d.account_id JOIN `client` c ON d.client_id = c.client_id WHERE c.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type FROM `card` c JOIN `disp` d ON c.disp_id = d.disp_id JOIN `client` cl ON d.client_id = cl.client_id WHERE cl.client_id = 13539;	financial
SELECT `district`.A3 AS region FROM `client` JOIN `district` ON `client`.district_id = `district`.district_id WHERE `client`.client_id = 3541;	financial
SELECT d.A2 AS district_name, COUNT(a.account_id) AS account_count FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.A2 ORDER BY account_count DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date, d.district_id, d.A2, d.A3 FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `account` a ON d.account_id = a.account_id JOIN `order` o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.account_id, t.date, t.type, t.amount, t.balance, t.k_symbol FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `district` d ON a.district_id = d.district_id WHERE d.district_id = 5;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik');	financial
SELECT c.client_id FROM client c JOIN card card ON c.client_id = card.disp_id JOIN disp disp ON c.client_id = disp.client_id WHERE card.type = 'junior' AND card.issued >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.gender) AS percentage_female FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A11 > 10000;	financial
SELECT      (SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) -       SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) /      SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END) * 100 AS growth_rate FROM      loan l JOIN      client c ON l.account_id IN (SELECT account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client cl ON d.client_id = cl.client_id) WHERE      cl.gender = 'M' AND      YEAR(l.date) BETWEEN 1996 AND 1997	financial
SELECT COUNT(*) FROM `trans` WHERE `type` = 'PRIJEM' AND `operation` = 'VYBER KARTOU' AND `date` > '1995-12-31';	financial
SELECT      (SELECT SUM(A16) FROM `district` WHERE `A3` = 'North Bohemia' AND `A11` = 1996) -      (SELECT SUM(A16) FROM `district` WHERE `A3` = 'East Bohemia' AND `A11` = 1996) AS crime_difference;	financial
SELECT COUNT(*) AS total_dispositions FROM disp WHERE account_id BETWEEN 1 AND 10 AND type IN ('OWNER', 'DISPONENT');	financial
SELECT      COUNT(*) AS statement_requests,     SUM(CASE WHEN `k_symbol` = 'VYDAJ' THEN `amount` ELSE 0 END) AS total_debit_amount FROM      `account` JOIN      `trans` ON `account.account_id` = `trans.account_id` WHERE      `account.account_id` = 3     AND `trans.type` = 'VYDAJ'     AND `trans.k_symbol` = 'VYDAJ';	financial
SELECT      YEAR(c.birth_date) AS birth_year FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id WHERE      a.account_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT     l.amount AS total_loan_amount,     SUM(CASE WHEN t.type = 'PRIJEM' THEN t.amount ELSE 0 END) AS total_payments_received,     (l.amount - SUM(CASE WHEN t.type = 'PRIJEM' THEN t.amount ELSE 0 END)) AS remaining_debt FROM     loan l JOIN     account a ON l.account_id = a.account_id JOIN     disp d ON a.account_id = d.account_id JOIN     client c ON d.client_id = c.client_id LEFT JOIN     trans t ON a.account_id = t.account_id WHERE     c.client_id = 992 GROUP BY     l.amount;	financial
SELECT      (SELECT SUM(`amount`)       FROM `trans`       WHERE `account_id` = (SELECT `account_id`                             FROM `disp`                             WHERE `client_id` = (SELECT `client_id`                                                  FROM `client`                                                  WHERE `client_id` = 4)                            )        AND `trans_id` = 851) AS `total_amount`,     (SELECT `gender`       FROM `client`       WHERE `client_id` = (SELECT `client_id`                            FROM `disp`                            WHERE `account_id` = (SELECT `account_id`                                                 FROM `trans`                                                 WHERE `trans_id` = 851)                           )      ) AS `client_gender`	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 9;	financial
SELECT SUM(`trans`.`amount`) AS total_payment FROM `trans` WHERE `trans`.`account_id` IN (     SELECT `disp`.`account_id`     FROM `disp`     JOIN `client` ON `disp`.`client_id` = `client`.`client_id`     WHERE `client`.`client_id` = 617 ) AND `trans`.`date` BETWEEN '1998-01-01' AND '1998-12-31';	financial
SELECT c.client_id FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A2 = 'Hl.m. Praha' AND d.A3 = 'Prague' AND d.A4 = '1204953';	financial
SELECT client_id FROM client WHERE gender = 'F' AND client_id IN (     SELECT client_id     FROM loan     ORDER BY amount DESC     LIMIT 3 );	financial
SELECT COUNT(DISTINCT c.client_id) AS male_customers_over_4000 FROM client c JOIN disp d ON c.client_id = d.client_id JOIN trans t ON d.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.k_symbol = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND account.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card crd ON d.disp_id = crd.disp_id  WHERE c.gender = 'F' AND crd.type = 'junior';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS female_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'Prague';	financial
SELECT     (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(DISTINCT a.account_id) AS male_clients_percentage FROM     account a JOIN     disp d ON a.account_id = d.account_id JOIN     client c ON d.client_id = c.client_id WHERE     a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `account` a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.account_id = c.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A11 = (SELECT MIN(A11) FROM district) ORDER BY c.birth_date DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT      AVG(l.amount) AS average_loan_amount FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      trans t ON a.account_id = t.account_id WHERE      l.status IN ('C', 'D') AND      a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT c.client_id, d.A2 AS district FROM client c JOIN disp d ON c.district_id = d.district_id JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER';	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id JOIN account acc ON d.account_id = acc.account_id WHERE crd.type = 'gold' AND d.type = 'OWNER' AND acc.account_id IN (SELECT account_id FROM loan);	financial
SELECT `bond_type`, COUNT(`bond_type`) AS `count` FROM `bond` GROUP BY `bond_type` ORDER BY `count` DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS average_oxygen FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN m.label = '+' THEN COUNT(b.bond_type) END)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage_of_carbon FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element <> 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_type = '=';	toxicology
SELECT m.label, COUNT(a.atom_id) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY count DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT `element` FROM `atom` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '-') GROUP BY `element` ORDER BY COUNT(`element`) ASC LIMIT 1;	toxicology
SELECT bond_type FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20')    OR (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8');	toxicology
SELECT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element <> 'sn' ) UNION SELECT m.label FROM molecule m WHERE m.label IN ('+', '-') AND m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element = 'sn' );	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element IN ('i', 's')  AND b.bond_type = '-';	toxicology
SELECT c1.atom_id FROM connected c1 JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#' GROUP BY c1.atom_id;	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181' OR m.molecule_id = 'TR181'	toxicology
SELECT     ROUND((SUM(CASE WHEN a.element = 'f' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT a.atom_id), 2) AS percentage_fluorine_in_carcinogens FROM     atom a JOIN     molecule m ON a.molecule_id = m.molecule_id WHERE     m.label = '+' AND a.element != 'f';	toxicology
SELECT      DIVIDE(SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100, COUNT(bond.bond_id)) AS percent FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT `element`, COUNT(*) AS frequency FROM `atom` WHERE `molecule_id` = 'TR000' GROUP BY `element` ORDER BY `element` ASC LIMIT 3;	toxicology
SELECT a1.atom_id AS Atom1, a2.atom_id AS Atom2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001';	toxicology
SELECT      (SELECT COUNT(*) FROM molecule WHERE label = '+') -      (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;	toxicology
SELECT `atom_id`, `atom_id2` FROM `connected` WHERE `bond_id` = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' OR atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id, m.label ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT      ROUND(         (SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond_id),         5     ) AS percent FROM bond WHERE molecule_id = 'TR008'	toxicology
SELECT ROUND((SUM(CASE WHEN `label` = '+' THEN 1 ELSE 0 END) / COUNT(`molecule_id`)) * 100, 3) AS percent FROM `molecule`;	toxicology
SELECT ROUND((SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id), 4) AS hydrogen_percentage FROM atom a WHERE a.molecule_id = 'TR206';	toxicology
SELECT bond.bond_type FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR060';	toxicology
SELECT bond_type, COUNT(bond_type) AS bond_count,        CASE             WHEN COUNT(bond_type) = (SELECT MAX(bond_count) FROM                                     (SELECT bond_type, COUNT(bond_type) AS bond_count                                      FROM bond                                      INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id                                      WHERE molecule.molecule_id = 'TR010'                                      GROUP BY bond_type) AS subquery) THEN 'Yes'            ELSE 'No'        END AS is_majority FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.molecule_id = 'TR010' GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN atom a2 ON m.molecule_id = a2.molecule_id JOIN bond b ON a1.atom_id = b.molecule_id AND a2.atom_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY m.molecule_id ORDER BY m.molecule_id ASC LIMIT 3;	toxicology
SELECT b.bond_id, b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR006' ORDER BY b.bond_type ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT bond.bond_type, atom1.atom_id AS atom1, atom2.atom_id AS atom2 FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id WHERE connected.bond_id = 'TR001_6_9';	toxicology
SELECT m.label AS molecule_label, m.label AS carcinogenicity FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT c.molecule_id) FROM `connected` c JOIN `bond` b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(DISTINCT c.bond_id) AS connections FROM connected c WHERE c.atom_id LIKE 'TR%_19' OR c.atom_id2 LIKE 'TR%_19';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT b.bond_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'p' OR a.element = 'n';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(bond_count) AS average_bonds FROM (     SELECT COUNT(bond.bond_id) AS bond_count     FROM atom     JOIN connected ON atom.atom_id = connected.atom_id     JOIN bond ON connected.bond_id = bond.bond_id     WHERE atom.element = 'i'     GROUP BY atom.atom_id ) AS bond_counts;	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE SUBSTR(atom.atom_id, 7, 2) + 0 = 45;	toxicology
SELECT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id IS NULL;	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c1.atom_id2 WHERE b.bond_type = '#' AND a1.molecule_id = 'TR041' AND a2.molecule_id = 'TR041';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT `element`, COUNT(*) as frequency FROM `atom` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+') GROUP BY `element` ORDER BY frequency LIMIT 1;	toxicology
SELECT DISTINCT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'pb' AND c.bond_id IS NOT NULL;	toxicology
SELECT a.element FROM atom a JOIN bond b ON a.atom_id = b.atom_id WHERE b.bond_type = '#';	toxicology
SELECT      (COUNT(bond_id) /       (SELECT COUNT(DISTINCT atom_id)        FROM connected        WHERE bond_id = c.bond_id        AND atom_id = (SELECT MAX(COUNT(atom_id))                       FROM connected                       GROUP BY atom_id))) * 100 AS percentage FROM      bond b JOIN      connected c ON b.bond_id = c.bond_id;	toxicology
SELECT ROUND((SUM(CASE WHEN b.`bond_type` = '-' THEN 1 ELSE 0 END) * 100) / COUNT(b.`bond_id`), 5) AS proportion FROM `bond` b JOIN `molecule` m ON b.`molecule_id` = m.`molecule_id` WHERE m.`label` = '+'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT DISTINCT a2.atom_id2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 's';	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) AS element_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND a.molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' );	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS triple_bond_atom_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'    AND (a.element = 'p' OR a.element = 'br')   AND EXISTS (     SELECT 1     FROM atom a2     JOIN connected c2 ON a2.atom_id = c.atom_id OR a2.atom_id = c.atom_id2     WHERE a2.element = 'p' OR a2.element = 'br'       AND b.bond_id = c2.bond_id   );	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100) / COUNT(a.atom_id), 2) AS percent_cl FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-';	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond.bond_type FROM bond WHERE bond.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element, a2.element FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON c.atom_id2 = c2.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'i' AND connected.bond_id IS NOT NULL;	toxicology
SELECT      m.molecule_id,     MAX(m.label) AS carcinogenicity FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.element = 'ca' GROUP BY      m.molecule_id ORDER BY      carcinogenicity DESC;	toxicology
SELECT      COUNT(*)  FROM      connected AS c1  JOIN      connected AS c2  ON      c1.atom_id = c2.atom_id2  JOIN      atom AS a1  ON      c1.atom_id = a1.atom_id  JOIN      atom AS a2  ON      c2.atom_id2 = a2.atom_id  JOIN      bond AS b  ON      c1.bond_id = b.bond_id  WHERE      a1.element = 'cl'      AND a2.element = 'c'      AND b.bond_id = 'TR001_1_8';	toxicology
SELECT DISTINCT c.molecule_id FROM `atom` a JOIN `bond` b ON a.atom_id = b.bond_id JOIN `molecule` m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT      ROUND(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.molecule_id), 2) AS percentage_of_chlorine FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND a.element = 'cl';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001' AND a.element IS NOT NULL;	toxicology
SELECT DISTINCT c.bond_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT DISTINCT c1.atom_id, c2.atom_id FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id AND c1.atom_id < c2.atom_id JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(*) FROM `bond` JOIN `molecule` ON `bond`.molecule_id = `molecule`.molecule_id WHERE `bond`.bond_type = '-' AND `molecule`.label = '+';	toxicology
SELECT `molecule`.`label` FROM `molecule` WHERE `molecule`.`molecule_id` = (     SELECT `bond`.`molecule_id`     FROM `bond`     WHERE `bond`.`bond_id` = 'TR001_10_11' )	toxicology
SELECT b.bond_id, m.label AS molecule_carcinogenicity FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      a.element FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      molecule m ON c.molecule_id = m.molecule_id WHERE      m.label = '+' AND      SUBSTRING(a.atom_id, 7, 1) = '4';	toxicology
SELECT      m.label AS RatioLabel,     (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) AS Ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' AND m.label = '+' GROUP BY      m.label;	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom AS a1 ON connected.atom_id = a1.atom_id  JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id  WHERE a1.element = 'c';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN atom a2 ON a1.atom_id = SUBSTR('TR001_10_11', 7, 2) AND a2.atom_id = SUBSTR('TR001_10_11', 10, 2) WHERE a1.element != a2.element;	toxicology
SELECT     ROUND(         (COUNT(CASE WHEN bond.bond_type = '#' THEN 1 END) * 100.0) / COUNT(DISTINCT molecule.molecule_id),         2     ) AS triple_bond_percentage FROM     molecule LEFT JOIN bond ON molecule.molecule_id = bond.molecule_id;	toxicology
SELECT      ROUND((SUM(CASE WHEN b.bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(b.bond_id), 2) AS percent_double_bond FROM      bond b WHERE      b.molecule_id = 'TR047'	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id = 'TR151' AND label = '+';	toxicology
SELECT DISTINCT a.element  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR151' AND a.element IN ('cl', 'br', 'i', 'sn', 'pb', 'te');	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label BETWEEN 'TR010' AND 'TR050' AND a.element = 'c' AND LENGTH(a.molecule_id) = 6 AND SUBSTR(a.molecule_id, 4, 3) BETWEEN '010' AND '050';	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+';	toxicology
SELECT bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT `molecule_id` FROM `bond` JOIN `connected` ON `bond.bond_id` = `connected.bond_id` WHERE `connected.atom_id` = 'TR000_1' AND `bond.bond_id` = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label <> '-';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' AND m.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.molecule_id) AS percentage_carcinogenic_with_hydrogen FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id	toxicology
SELECT m.label AS molecule_label FROM `molecule` m WHERE m.molecule_id = 'TR124';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR186' UNION SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE a.molecule_id = 'TR186';	toxicology
SELECT `bond_type` FROM `bond` JOIN `connected` ON `bond.bond_id` = `connected.bond_id` WHERE `connected.atom_id` = 'TR007_4' OR `connected.atom_id` = 'TR007_19';	toxicology
SELECT a.element AS Element1, a2.element AS Element2 FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT      COUNT(*) AS double_bonds_count,     CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM      atom a JOIN      bond b ON a.atom_id = b.bond_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' AND      b.bond_type = '='	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id;	toxicology
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element ORDER BY a.element) AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' GROUP BY m.molecule_id;	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM connected AS c JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.element = 'cl';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR346';  SELECT COUNT(DISTINCT b.bond_type) AS bond_types_count FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = 'TR346';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS double_bonded_carcinogens FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE m.label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN (     SELECT molecule_id     FROM atom     WHERE element = 's' ) AND molecule_id NOT IN (     SELECT molecule_id     FROM bond     WHERE bond_type = '=' );	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (SUM(CASE WHEN `label` = '+' AND `element` = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(`molecule_id`) AS percentage FROM      `atom` JOIN      `molecule` ON `atom`.`molecule_id` = `molecule`.`molecule_id` WHERE      `molecule`.`label` = '+';	toxicology
SELECT molecule_id  FROM bond  WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2';	toxicology
SELECT m.label AS molecule FROM atom a1 JOIN atom a2 ON a1.molecule_id = a2.molecule_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE a1.atom_id = 'TR000_2' OR a2.atom_id = 'TR000_4';	toxicology
SELECT `element` FROM `atom` WHERE `atom_id` = 'TR000_1';	toxicology
SELECT CASE WHEN COUNT(*) > 0 THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenicity FROM molecule WHERE molecule_id = 'TR000' AND label = '+';	toxicology
SELECT      (SELECT COUNT(*)       FROM `atom`       JOIN `connected` ON `atom.atom_id` = `connected.atom_id`       JOIN `bond` ON `connected.bond_id` = `bond.bond_id`       WHERE `bond.bond_type` = '-') /      (SELECT COUNT(*)       FROM `atom`) * 100 AS percentage	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM `molecule` m JOIN `atom` a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      ROUND(DIVIDE(SUM(CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN 1 ELSE 0 END), COUNT(DISTINCT m.molecule_id)) * 100.0, 2) AS percentage_carcinogenic_with_triple_bond_h FROM      atom a JOIN      bond b ON a.atom_id = b.atom_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+';	toxicology
SELECT COUNT(*) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.molecule_id BETWEEN 'TR004' AND 'TR010' AND b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON a.atom_id = b.molecule_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT c.molecule_id) FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR002');	toxicology
SELECT DISTINCT c1.atom_id FROM connected c1 JOIN bond b ON c1.bond_id = b.bond_id JOIN atom a ON c1.atom_id = a.atom_id WHERE a.element = 'c' AND b.bond_type = '=' AND EXISTS (     SELECT 1     FROM connected c2     JOIN bond b2 ON c2.bond_id = b2.bond_id     WHERE c2.atom_id = c1.atom_id     AND b2.bond_type = '='     AND c2.atom_id2 != c1.atom_id ) AND a.molecule_id = (SELECT molecule_id FROM molecule WHERE label = 'TR012');	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT id, name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT c.id, c.name FROM cards c WHERE c.borderColor IS NULL AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT name FROM cards WHERE convertedManaCost < (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT `name` FROM `cards` WHERE `frameVersion` = '2015' AND `edhrecRank` < 100;	card_games
SELECT c.name, c.rarity FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT      cards.name,      legalities.status  FROM      cards  JOIN      legalities ON cards.uuid = legalities.uuid  WHERE      cards.types = 'Artifact'      AND cards.side IS NULL      AND legalities.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      c.id,     r.text AS ruling_text,     c.hasContentWarning AS hasContentWarning,     c.hasFoil AS hasFoil,     c.hasNonFoil AS hasNonFoil,     c.isAlternative AS isAlternative,     c.isFullArt AS isFullArt,     c.isOnlineOnly AS isOnlineOnly,     c.isOversized AS isOversized,     c.isPromo AS isPromo,     c.isReprint AS isReprint,     c.isReserved AS isReserved,     c.isStarter AS isStarter,     c.isTextless AS isTextless,     c.isTimeshifted AS isTimeshifted FROM      cards c LEFT JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Stephen Daniel'	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT cards.name, cards.artist, cards.isPromo FROM cards JOIN rulings ON cards.uuid = rulings.uuid GROUP BY cards.uuid ORDER BY COUNT(rulings.uuid) DESC LIMIT 1;	card_games
SELECT `language`, `name`, `number` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.name` = 'Annul' AND `cards.number` = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT      (COUNT(*) FILTER (WHERE `language` = 'Chinese Simplified') * 100.0) / COUNT(*) FROM      cards;	card_games
SELECT      st.setCode,     s.totalSetSize FROM      set_translations st JOIN      sets s ON st.setCode = s.code WHERE      st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT `keywords` FROM `cards` WHERE `name` = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM `cards` WHERE `power` = '*';	card_games
SELECT `promoTypes`  FROM `cards`  WHERE `name` = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `originalType` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT ft.language FROM foreign_data AS fd JOIN cards AS c ON fd.uuid = c.uuid JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.code = st.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT `rulings`.`text` FROM `rulings` JOIN `cards` ON `rulings`.`uuid` = `cards`.`uuid` WHERE `cards`.`name` = 'Benalish Knight' AND `legalities`.`uuid` = `cards`.`uuid` AND `legalities`.`format` = 'commander';	card_games
SELECT DISTINCT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Phyrexian' AND cards.name LIKE '%Phyrexian%';	card_games
SELECT     (SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless') * 100.0 / COUNT(*) AS borderless_percentage FROM cards;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND flavorText LIKE '%Русский%'	card_games
SELECT      (COUNT(CASE WHEN fd.language = 'French' THEN c.id END) * 100.0) /      COUNT(CASE WHEN c.isStorySpotlight = 1 THEN c.id END) AS percentage_french_story_spotlight_cards FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT `name`  FROM `cards`  WHERE `artist` = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%Flying%';	card_games
SELECT COUNT(*) FROM cards WHERE type LIKE '%Summon - Angel%' AND id NOT IN (     SELECT id     FROM cards     WHERE subtypes LIKE '%Angel%' )	card_games
SELECT cards.id FROM cards WHERE cards.hasFoil = 1 AND cards.hasNonFoil = 1 AND (cards.cardKingdomFoilId IS NOT NULL OR cards.cardKingdomId IS NOT NULL) AND cards.id IN (     SELECT legalities.uuid     FROM legalities     WHERE legalities.format = 'commander' AND legalities.status = 'Legal' );	card_games
SELECT id  FROM cards  WHERE duelDeck = 'a';	card_games
SELECT `edhrecRank` FROM `cards` WHERE `frameVersion` = '2015';	card_games
SELECT cards.artist FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.language = 'Chinese Simplified';	card_games
SELECT id, name, artist, availability, `language` FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE availability = 'paper' AND `language` = 'Japanese';	card_games
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT c.uuid, fd.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy' AND fd.language IS NOT NULL;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = 'future' AND id IN (SELECT uuid FROM legalities WHERE status = 'legal');	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT cards.name, rulings.date FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf';	card_games
SELECT      c.colors,      GROUP_CONCAT(DISTINCT l.format SEPARATOR ', ') AS formats FROM      cards c LEFT JOIN      legalities l ON c.uuid = l.uuid WHERE      c.id BETWEEN 1 AND 20 GROUP BY      c.id;	card_games
SELECT c.name, fd.name AS foreignName FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language <> 'English';	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT `manaCost` FROM `cards` WHERE `layout` = 'normal' AND `frameVersion` = '2003' AND `borderColor` = 'black' AND `availability` = 'mtgo,paper';	card_games
SELECT SUM(CAST(manaCost AS REAL)) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT `type` FROM `cards` WHERE `availability` = 'arena';	card_games
SELECT DISTINCT c.setCode FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Spanish';	card_games
SELECT      ROUND(         (SUM(CASE WHEN `cards`.frameEffects = 'legendary' AND `cards`.isOnlineOnly = 1 THEN 1 ELSE 0 END)           / COUNT(`cards`.id)),          2     ) AS percentage_legendary_online_only FROM      `cards` WHERE      `cards`.frameEffects = 'legendary';	card_games
SELECT      (SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) / COUNT(c.id)) * 100 AS percentage FROM      cards c;	card_games
SELECT      name,      ROUND((SUM(CASE WHEN `language` = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_spanish FROM      cards GROUP BY      name ORDER BY      percentage_spanish DESC;	card_games
SELECT t.language FROM set_translations t JOIN sets s ON t.setCode = s.code WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN (     SELECT uuid     FROM legalities     WHERE status = 'Legal' );	card_games
SELECT DISTINCT subtypes, supertypes FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND subtypes IS NOT NULL AND supertypes IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'premodern' AND cards.side IS NULL AND EXISTS (     SELECT 1     FROM rulings     WHERE rulings.uuid = cards.uuid     AND rulings.text LIKE '%triggered mana ability%' );	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper' AND NOT EXISTS (     SELECT 1     FROM legalities     WHERE legalities.uuid = cards.uuid AND format = 'pauper' );	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.flavorText = 'Das perfekte Gegenmittel zu einer dichten Formation'	card_games
SELECT fd.name AS foreign_name FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.artist = 'Matthew D. Wilson' AND fd.language = 'French' AND c.borderColor = 'black' AND c.layout = 'normal' AND c.type = 'Creature';	card_games
SELECT COUNT(*) FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2007-02-01';	card_games
SELECT t.language  FROM sets s  JOIN set_translations t ON s.code = t.setCode  WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id),         2     ) AS percentageWithoutContentWarning FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      (COUNT(CASE WHEN cards.power IS NULL OR cards.power = '*' THEN 1 END AND foreign_data.language = 'French' END) * 100.0) /      COUNT(CASE WHEN cards.power IS NULL OR cards.power = '*' THEN 1 END) AS percentage_french_no_power_cards FROM      cards JOIN      foreign_data ON cards.uuid = foreign_data.uuid;	card_games
SELECT      ROUND((COUNT(CASE WHEN s.type = 'expansion' THEN 1 END) / COUNT(CASE WHEN st.language = 'Japanese' THEN 1 END)) * 100, 2) AS percentage_japanese_expansion_sets FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE `colorIdentity` IS NOT NULL AND `borderColor` = 'borderless' AND `edhrecRank` > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name, power, promoTypes FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT language  FROM foreign_data  WHERE multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN `cards`.`isTextless` = 1 AND `cards`.`layout` = 'normal' THEN 1 END) * 100.0) / COUNT(`cards`.`id`) AS proportion_of_textless_normal_layout_cards FROM      `cards`;	card_games
SELECT id, name, subtypes FROM cards WHERE subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%' AND otherFaceIds IS NULL;	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT DISTINCT `language` FROM `set_translations` WHERE `setCode` = 'ARC';	card_games
SELECT `name`, `translation` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `sets.id` = 5;	card_games
SELECT t.language, s.type FROM set_translations t JOIN sets s ON t.setCode = s.code WHERE s.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND EXISTS (     SELECT 1     FROM set_translations     WHERE sets.code = set_translations.setCode AND language = 'Japanese' );	card_games
SELECT s.name, MAX(s.baseSetSize) as max_cards FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' GROUP BY s.name ORDER BY max_cards DESC LIMIT 1;	card_games
SELECT      ROUND((COUNT(CASE WHEN `isOnlineOnly` = 1 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage FROM      `cards` WHERE      EXISTS (         SELECT 1         FROM `set_translations`         WHERE              `set_translations.setCode` = `cards.setCode`             AND `set_translations.language` = 'Chinese Simplified'     );	card_games
SELECT COUNT(*) FROM sets WHERE `isForeignOnly` = 1 AND language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id  FROM cards  WHERE borderColor = 'black';	card_games
SELECT id  FROM cards  WHERE frameEffects = 'extendedart';	card_games
SELECT `name` FROM `cards` WHERE `borderColor` = 'black' AND `isFullArt` = 1;	card_games
SELECT language FROM set_translations WHERE setCode = '10E';	card_games
SELECT `name` FROM `sets` WHERE `code` = 'ALL';	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT `sets`.`baseSetSize`, `sets`.`code` FROM `sets` WHERE `sets`.`block` IN ('Masques', 'Mirage');	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion';	card_games
SELECT fd.name, c.type FROM foreign_data AS fd JOIN cards AS c ON fd.uuid = c.uuid WHERE fd.language = 'Boros'	card_games
SELECT fd.language, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Colorpie';	card_games
SELECT      (COUNT(*) FILTER (WHERE convertedManaCost = 10) * 100.0) / COUNT(*) AS percentage_with_converted_mana_cost_10 FROM cards WHERE name = 'Abyssal Horror';	card_games
SELECT code  FROM sets  WHERE type = 'expansion' AND code IN (SELECT setCode FROM legalities WHERE format = 'commander');	card_games
SELECT fd.name AS foreign_name, c.type AS card_type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.name LIKE '%Abzan%';	card_games
SELECT      `cards`.`type`,      `foreign_data`.`language` FROM      `cards` JOIN      `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` WHERE      `cards`.`watermark` = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM `cards` WHERE `availability` LIKE '%paper%' AND `hand` = '3';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT faceConvertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'white' AND (`power` = '*' OR `power` IS NULL);	card_games
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL;	card_games
SELECT subtypes, supertypes  FROM cards  WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes LIKE '%bundle%' AND purchaseUrls IS NOT NULL;	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE `availability` LIKE '%arena,mtgo%' AND `borderColor` = 'black';	card_games
SELECT      CASE          WHEN MAX(c1.convertedManaCost) > MAX(c2.convertedManaCost) THEN 'Serra Angel'         ELSE 'Shrine Keeper'     END AS CardWithHigherManaCost FROM      (SELECT MAX(convertedManaCost) AS convertedManaCost FROM cards WHERE name = 'Serra Angel') AS c1,     (SELECT MAX(convertedManaCost) AS convertedManaCost FROM cards WHERE name = 'Shrine Keeper') AS c2;	card_games
SELECT `artist` FROM `cards` WHERE `flavorName` = 'Battra, Dark Destroyer';	card_games
SELECT name, MAX(convertedManaCost) AS maxCMC FROM cards WHERE frameVersion = '2003' GROUP BY name ORDER BY maxCMC DESC LIMIT 3;	card_games
SELECT t.translation  FROM sets s  JOIN set_translations t ON s.code = t.setCode  WHERE s.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*)  FROM cards  JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE cards.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards     JOIN foreign_data ON cards.uuid = foreign_data.uuid     WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Korean' );	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Eighth Edition')  AND language = 'Chinese Simplified';	card_games
SELECT s.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT releaseDate  FROM sets  JOIN cards ON sets.code = cards.setCode  WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT `type` FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `translation` = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets WHERE block = 'Ice Age' AND       EXISTS (SELECT 1 FROM set_translations WHERE sets.code = set_translations.setCode AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL);	card_games
SELECT COUNT(*)  FROM cards  WHERE name = 'Adarkar Valkyrie' AND sets.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards WHERE `name` = 'Coldsnap' AND `borderColor` = 'black';	card_games
SELECT name, MAX(convertedManaCost) as MaxCMC FROM cards WHERE setCode = 'Coldsnap' GROUP BY name ORDER BY MaxCMC DESC LIMIT 1;	card_games
SELECT DISTINCT `artist` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Coldsnap' AND `artist` IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT `number` FROM `cards` WHERE `name` = 'Coldsnap' AND `number` = '4';	card_games
SELECT COUNT(*) FROM cards C JOIN sets S ON C.setCode = S.code WHERE S.name = 'Coldsnap' AND C.convertedManaCost > 5 AND (C.power = '*' OR C.power IS NULL);	card_games
SELECT `flavorText` FROM `foreign_data` WHERE `language` = 'Italian' AND `name` = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT f.language FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND f.flavorText IS NOT NULL;	card_games
SELECT `type` FROM `foreign_data` WHERE `language` = 'German' AND `name` = 'Ancestor''s Chosen';	card_games
SELECT cards.name, rulings.text AS ItalianRuling FROM cards JOIN rulings ON cards.uuid = rulings.uuid JOIN sets ON cards.setCode = sets.code JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Coldsnap' AND set_translations.language = 'Italian';	card_games
SELECT `cards`.`name`, `cards`.`convertedManaCost` FROM `cards` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `sets`.`name` = 'Coldsnap' AND `set_translations`.`language` = 'Italian' ORDER BY `cards`.`convertedManaCost` DESC LIMIT 1;	card_games
SELECT date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT      ROUND((SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_of_cards_with_cmc_7 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap';	card_games
SELECT      ROUND((COUNT(*) FILTER (WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL) * 100.0) / COUNT(*), 2) AS percentage_incredibly_powerful FROM      cards WHERE      name = 'Coldsnap';	card_games
SELECT `code` FROM `sets` WHERE `releaseDate` = '2017-07-14';	card_games
SELECT `keyruneCode` FROM `sets` WHERE `code` = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09';	card_games
SELECT `type` FROM `sets` WHERE `name` LIKE '%From the Vault: Lore%'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, c.hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' ORDER BY c.name;	card_games
SELECT `sets.releaseDate` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `cards.name` = 'Evacuation';	card_games
SELECT `baseSetSize` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `set_translations.translation` = 'Rinascita di Alara';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE translation = 'Huitième édition';	card_games
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON s.code = c.setCode JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Tenth Edition';	card_games
SELECT st.translation FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT name, MAX(convertedManaCost) as MaxCMC FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Journey into Nyx Hero''s Path') GROUP BY name ORDER BY MaxCMC DESC LIMIT 1;	card_games
SELECT `releaseDate` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `set_translations.translation` = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'World Championship Decks 2004') AND convertedManaCost = 3.0;	card_games
SELECT translation FROM set_translations WHERE setCode = 'MIR' AND language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN sets.isNonFoilOnly = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN cards.language = 'Japanese' THEN 1 ELSE 0 END)) * 100 AS percentage_Japanese_non_foil FROM cards JOIN sets ON cards.setCode = sets.code WHERE cards.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN s.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END) AS percentage_online_only_brazil_portuguese FROM      cards c JOIN      sets s ON c.setCode = s.code JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT c.availability  FROM cards c  WHERE c.artist != 'Aleksi Briclot' AND c.isTextless = 1;	card_games
SELECT id  FROM sets  WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT `artist`, MAX(`convertedManaCost`) as max_cost FROM `cards` WHERE `side` IS NULL GROUP BY `artist` ORDER BY max_cost DESC LIMIT 1;	card_games
SELECT MAX(frameEffects) AS most_common_frame_effect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*'   AND hasFoil = 0   AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' AND isFoilOnly = 0 AND isForeignOnly = 0 AND isNonFoilOnly = 0 AND isOnlineOnly = 0 AND isPartialPreview = 0 ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT id, name, MAX(convertedManaCost) AS maxManaCost FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'duel' GROUP BY id, name ORDER BY maxManaCost DESC LIMIT 10;	card_games
SELECT s.releaseDate, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE c.rarity = 'mythic' AND l.status = 'legal' ORDER BY s.releaseDate LIMIT 1;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.artist = 'Volkan Baǵa' AND foreign_data.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT      `legalities.format` AS play_format,     COUNT(`legalities.status = 'Banned'`) AS banned_count FROM      `legalities` WHERE      `legalities.status = 'Banned'` GROUP BY      `legalities.format` ORDER BY      banned_count DESC LIMIT      1;	card_games
SELECT language FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Battlebond';	card_games
SELECT artist, COUNT(*) AS card_count FROM cards GROUP BY artist ORDER BY card_count ASC LIMIT 1;	card_games
SELECT cards.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997' AND cards.artist = 'D. Alexander Gregory' AND cards.hasContentWarning = 1 AND legalities.format = 'legacy';	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.edhrecRank = 1 AND legalities.status = 'Banned';	card_games
SELECT AVG(id) AS annual_avg_sets, MAX(COUNT(language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate);	card_games
SELECT DISTINCT `cards.artist` FROM `cards` WHERE `cards.borderColor` = 'black' AND `cards.availability` = 'arena';	card_games
SELECT l.uuid FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.id, r.text, r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st_japanese ON s.code = st_japanese.setCode AND st_japanese.language = 'Japanese' LEFT JOIN set_translations st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' WHERE st_japanese.id IS NULL AND st_korean.id IS NOT NULL;	card_games
SELECT DISTINCT `cards`.`frameVersion` AS FrameStyle FROM `cards` WHERE `cards`.`artist` = 'Allen Williams';  SELECT `cards`.`name`, `cards`.`frameVersion` AS FrameStyle FROM `cards` JOIN `legalities` ON `cards`.`uuid` = `legalities`.`uuid` WHERE `legalities`.`status` = 'Banned' AND `cards`.`artist` = 'Allen Williams';	card_games
SELECT      CASE          WHEN u1.Reputation > u2.Reputation THEN u1.DisplayName          ELSE u2.DisplayName      END AS UserWithHigherReputation FROM      users u1 JOIN      users u2 ON u1.DisplayName = 'Harlan' AND u2.DisplayName = 'Jarrod Dixon'	codebase_community
SELECT `DisplayName` FROM `users` WHERE YEAR(`CreationDate`) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT `users.DisplayName` FROM `users` JOIN `posts` ON `users.Id` = `posts.OwnerUserId` WHERE `posts.ViewCount` = (     SELECT MAX(`ViewCount`)     FROM `posts` )	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Views > 10 AND YEAR(u.CreationDate) > 2013;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Title = 'Eliciting priors from experts' AND p.OwnerUserId = u.Id AND u.DisplayName = p.OwnerDisplayName;	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT OwnerDisplayName  FROM posts  ORDER BY FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT SUM(c.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN comments c ON p.Id = c.PostId WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT p.Id, p.AnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT `users.DisplayName`  FROM `posts`  JOIN `users` ON `posts.LastEditorUserId` = `users.Id`  WHERE `posts.Title` = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE Age > 65 ) AND Score >= 20;	codebase_community
SELECT u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(b.Id) AS TotalBadges FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011;	codebase_community
SELECT u.DisplayName FROM users u JOIN (     SELECT UserId, COUNT(*) as BadgeCount     FROM badges     GROUP BY UserId     ORDER BY BadgeCount DESC     LIMIT 1 ) b ON u.Id = b.UserId	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(b.Count) AS avg_badges FROM badges b JOIN posts p ON b.UserId = p.OwnerUserId WHERE p.ViewCount > 200 GROUP BY b.UserId	codebase_community
SELECT     (COUNT(CASE WHEN u.Age > 65 THEN p.Id ELSE NULL END) * 100.0) / COUNT(p.Id) AS elder_user_percentage FROM     posts p JOIN     users u ON p.OwnerUserId = u.Id WHERE     p.Score > 5	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate  FROM votes  GROUP BY CreationDate  ORDER BY COUNT(Id) DESC  LIMIT 1;	codebase_community
SELECT COUNT(`Id`) AS NumRevivalBadges FROM `badges` WHERE `Name` = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments);	codebase_community
SELECT      c.CommentCount  FROM      posts p  JOIN      posts pc ON p.Id = pc.ParentId  WHERE      p.ViewCount = 1910	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0';	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1;	codebase_community
SELECT p.Id, p.Title, p.ClosedDate FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NULL;	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Tiago Pasqualini'	codebase_community
SELECT `users.DisplayName`  FROM `users`  JOIN `votes` ON `users.Id` = `votes.UserId`  WHERE `votes.Id` = 6347;	codebase_community
SELECT SUM(v.BountyAmount) + SUM(CASE WHEN v.VoteTypeId = 2 THEN 10 ELSE 0 END) + SUM(CASE WHEN v.VoteTypeId = 3 THEN -2 ELSE 0 END) AS TotalVotes FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) AS PostCount,     (SELECT COUNT(*) FROM votes WHERE UserId = 24) AS VoteCount,     (SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) / (SELECT COUNT(*) FROM votes WHERE UserId = 24) AS PostToVoteRatio FROM      users WHERE      Id = 24;	codebase_community
SELECT ViewCount  FROM posts  WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE `WebsiteUrl` = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT c.UserId, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!'	codebase_community
SELECT `comments.Text` FROM `comments` JOIN `users` ON `comments.UserId` = `users.Id` WHERE `users.DisplayName` = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text AS CommentText FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT p.LastEditorDisplayName AS EditorDisplayName FROM posts p WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.Text, c.CreationDate, u.DisplayName AS CommentatorName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(v.BountyAmount) AS TotalBountyAmount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT      p.Title,      p.Text AS Comment,      AVG(p.ViewCount) AS AverageViewCount FROM      posts p JOIN      tags t ON p.Id = t.ExcerptPostId WHERE      t.TagName = 'humor' GROUP BY      p.Id	codebase_community
SELECT COUNT(c.Id) AS TotalComments FROM comments c WHERE c.UserId = 13;	codebase_community
SELECT `Id` FROM `users` ORDER BY `Reputation` DESC LIMIT 1	codebase_community
SELECT `UserId` FROM `users` ORDER BY `Views` ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  WHERE b.Name = 'Supporter'  AND YEAR(b.Date) = 2011;	codebase_community
SELECT UserId, COUNT(Name) AS NumberOfBadges FROM badges GROUP BY UserId HAVING COUNT(Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York';	codebase_community
SELECT u.DisplayName, u.Reputation  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Id = 1;	codebase_community
SELECT u.Id, u.DisplayName, COUNT(ph.Id) AS PostHistoryCount FROM users u JOIN postHistory ph ON u.Id = ph.UserId JOIN posts p ON ph.PostId = p.Id WHERE p.ViewCount >= 1000 GROUP BY u.Id, u.DisplayName HAVING COUNT(ph.Id) = 1;	codebase_community
SELECT      c.UserId,      u.DisplayName,      b.Name AS Badge FROM      comments c JOIN      users u ON c.UserId = u.Id LEFT JOIN      badges b ON c.UserId = b.UserId WHERE      c.UserId = (SELECT UserId FROM comments GROUP BY UserId ORDER BY COUNT(*) DESC LIMIT 1) ORDER BY      c.UserId;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      ((COUNT(CASE WHEN YEAR(b.Date) = 2010 THEN 1 END) / COUNT(b.Id)) -       (COUNT(CASE WHEN YEAR(b.Date) = 2011 THEN 1 END) / COUNT(b.Id))) * 100 AS PercentageDifference FROM badges b WHERE b.Name = 'Student'	codebase_community
SELECT PostHistoryTypeId FROM postHistory WHERE PostId = 3720;  SELECT COUNT(DISTINCT UserId) FROM comments WHERE PostId = 3720;	codebase_community
SELECT p.Id, p.Title, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT p.Id AS PostId, u.Id AS UserId FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(FavoriteCount) AS TotalFavoriteCount FROM posts WHERE OwnerUserId = 686 AND Year(CreaionDate) = 2011	codebase_community
SELECT AVG(u.UpVotes) + AVG(u.Age) AS avg_upvotes_and_age FROM users u JOIN (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(*) > 10 ) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges`  WHERE `Name` = 'Announcer';	codebase_community
SELECT `Name` FROM `badges` WHERE `Date` = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      (COUNT(CASE WHEN b.Name = 'Teacher' THEN b.UserId END) * 100.0) / COUNT(DISTINCT b.UserId) AS PercentageOfTeachers FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Teacher';	codebase_community
SELECT      (SELECT COUNT(DISTINCT u.Id)       FROM badges b       JOIN users u ON b.UserId = u.Id       WHERE b.Name = 'Organizer' AND u.Age BETWEEN 13 AND 18) * 100.0 /      (SELECT COUNT(DISTINCT b.UserId)       FROM badges b       WHERE b.Name = 'Organizer') AS Teenager_Percentage;	codebase_community
SELECT SUM(c.Score) AS TotalCommentRating FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT users.Age FROM users WHERE users.Location = 'Vienna, Austria' AND users.Id IN (SELECT badges.UserId FROM badges WHERE badges.Name = 'Teacher');	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfAdultSupporters FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65	codebase_community
SELECT u.Views FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND UserId IN (     SELECT Id     FROM users     WHERE Age > 65 );	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Id` = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT `DisplayName`, MAX(`Views`) as MaxViews FROM `users` GROUP BY `DisplayName` ORDER BY MaxViews DESC LIMIT 1;	codebase_community
SELECT   (COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END) / COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END)) AS vote_ratio FROM votes	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE DisplayName = 'Daniel Vassallo' );	codebase_community
SELECT COUNT(*)  FROM votes  WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Harlan');	codebase_community
SELECT p.Id  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'slashnick'  ORDER BY p.AnswerCount DESC  LIMIT 1;	codebase_community
SELECT      (SELECT MAX(SUM(ViewCount))       FROM posts       JOIN users ON posts.OwnerUserId = users.Id       WHERE users.DisplayName = 'Harvey Motulsky') AS HarveyMotulskyPopularity,     (SELECT MAX(SUM(ViewCount))       FROM posts       JOIN users ON posts.OwnerUserId = users.Id       WHERE users.DisplayName = 'Noah Snyder') AS NoahSnyderPopularity FROM dual;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Matt Parker')  AND Id IN (SELECT PostId FROM votes GROUP BY PostId HAVING COUNT(*) > 4);	codebase_community
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
SELECT tags.TagName FROM tags JOIN posts ON tags.ExcerptPostId = posts.Id JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Mark Meckes' AND posts.CommentCount = 0;	codebase_community
SELECT DISTINCT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN T2.TagName = 'r' THEN T1.Id END) * 100.0) / COUNT(T1.Id) AS percentage FROM      posts AS T1 JOIN      tags AS T2 ON T1.Id = T2.ExcerptPostId JOIN      users AS T3 ON T1.OwnerUserId = T3.Id WHERE      T3.DisplayName = 'Community';	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Mornington', 'Amos');	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  WHERE b.Name = 'Commentator'  AND YEAR(b.Date) = 2014;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT      p.LastEditDate,      u.DisplayName AS LastEditorDisplayName FROM      posts p JOIN      users u ON p.LastEditorUserId = u.Id WHERE      p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT      p.Title,      c.UserDisplayName  FROM      comments c  JOIN      posts p ON c.PostId = p.Id  WHERE      c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE YEAR(b.Date) = 2011 AND u.Location = 'North Pole';	codebase_community
SELECT      p.OwnerDisplayName,      u.WebsiteUrl FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.FavoriteCount > 150;	codebase_community
SELECT      COUNT(ph.Id) AS PostHistoryCount,      MAX(ph.LastEditDate) AS LastEditDate FROM      postHistory ph JOIN      posts p ON ph.PostId = p.Id WHERE      p.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' ORDER BY u.LastAccessDate DESC;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId JOIN posts related ON related.Id = pl.RelatedPostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time'	codebase_community
SELECT p.Id, b.Name FROM badges b JOIN users u ON b.UserId = u.Id JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT `OwnerDisplayName` FROM `posts` ORDER BY `ViewCount` DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?'	codebase_community
SELECT p.OwnerDisplayName AS ParentDisplayName FROM posts p WHERE p.ParentId IS NOT NULL ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8)	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId  FROM posts  WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT MAX(Reputation) AS MaxReputation, MAX(Age) AS MaxAge FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50 AND Id IN (SELECT PostId FROM votes WHERE VoteTypeId = 2);	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT SUM(p.Score) AS TotalScore FROM posts p WHERE p.LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT      COUNT(postLinks.Id) / 12 AS AverageMonthlyLinks FROM      postLinks WHERE      YEAR(postLinks.CreationDate) = 2010 AND     EXISTS (         SELECT 1          FROM posts          WHERE posts.Id = postLinks.PostId AND posts.AnswerCount <= 2     )	codebase_community
SELECT PostId  FROM votes  WHERE UserId = 1465  GROUP BY PostId  ORDER BY SUM(CASE WHEN VoteTypeId = 1 THEN 1 ELSE 0 END) DESC  LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks) LIMIT 1;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY b.UserId ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'chl'	codebase_community
SELECT MIN(CreationDate) AS FirstPostDate FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     ORDER BY Age ASC     LIMIT 1 );	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' AND b.Date = (SELECT MIN(Date) FROM badges WHERE Name = 'Autobiographer')	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(V.PostId) as AveragePostsVoted FROM votes V JOIN users U ON V.UserId = U.Id WHERE U.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT `DisplayName`  FROM `users` ORDER BY `Reputation` DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Age` BETWEEN 19 AND 65	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreaionDate) = 2010	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(posts.CreationDate) = 2011 AND users.Reputation > 1000 THEN posts.Id END) * 100.0) / COUNT(posts.Id) AS ReputationOver1000Percentage FROM      posts JOIN      users ON posts.OwnerUserId = users.Id;	codebase_community
SELECT     (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id END) * 100.0) / COUNT(u.Id) AS percentage_of_teenagers FROM     users u;	codebase_community
SELECT p.ViewCount, u.DisplayName AS NameWhoLastEdited FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Body LIKE '%Computer Game Datasets%'	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT MAX(Date) FROM badges WHERE UserId = (     SELECT Id     FROM users     WHERE DisplayName = 'Emmett' ) ORDER BY Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT      u.CreationDate - b.Date AS TimeToBadge FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      u.DisplayName = 'Zolomon';	codebase_community
SELECT      u.Id AS UserId,      (SELECT COUNT(*) FROM posts WHERE posts.OwnerUserId = u.Id) AS PostCount,      (SELECT COUNT(*) FROM comments WHERE comments.UserId = u.Id) AS CommentCount FROM      users u WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users);	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges`  WHERE `Name` = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE Id IN (SELECT ExcerptPostId FROM tags WHERE TagName = 'careers');	codebase_community
SELECT Reputation, ViewCount  FROM users  WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      COALESCE(COUNT(c.Id), 0) AS CommentCount,     COALESCE(COUNT(a.Id), 0) AS AnswerCount FROM      posts p LEFT JOIN      comments c ON p.Id = c.PostId AND p.Title = 'Clustering 1D data' LEFT JOIN      posts a ON p.Id = a.ParentId AND p.Title = 'Clustering 1D data' WHERE      p.Title = 'Clustering 1D data'	codebase_community
SELECT `CreationDate` FROM `users` WHERE `DisplayName` = 'IrishStat' LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30;	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN posts.Score > 50 THEN posts.Id END) * 100.0) /          COUNT(posts.Id),          2     ) AS PercentageOfHighScorePosts FROM      posts JOIN      users ON posts.OwnerUserId = users.Id WHERE      users.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Id, c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT c.PostId) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE PostId IN (SELECT Id FROM posts WHERE CommentCount = 1) AND Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) as TotalUsers40YearsOld FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND TIMESTAMPDIFF(YEAR, u.CreationDate, CURDATE()) = 40;	codebase_community
SELECT p.Id, c.Text AS Comment FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      (COUNT(CASE WHEN c.UserId IN (SELECT u.Id FROM users u WHERE u.UpVotes = 0) THEN c.UserId END) * 100.0) /      COUNT(CASE WHEN c.Score BETWEEN 5 AND 10 THEN c.UserId END) AS PercentageZeroUpVotes FROM comments c;	codebase_community
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT superhero.id) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT `superhero_name` FROM `superhero` JOIN `colour` AS eye_colour ON `superhero`.`eye_colour_id` = `eye_colour`.`id` JOIN `colour` AS hair_colour ON `superhero`.`hair_colour_id` = `hair_colour`.`id` WHERE `eye_colour`.`colour` = 'Blue' AND `hair_colour`.`colour` = 'Blond'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';	superhero
SELECT      s.superhero_name,      c.colour,      COUNT(s.id) AS eye_color_popularity FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics' GROUP BY      s.superhero_name, c.colour ORDER BY      eye_color_popularity DESC, s.superhero_name;	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Speed') GROUP BY p.publisher_name;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Intelligence')	superhero
SELECT race FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT      s.superhero_name,      ha.attribute_value  FROM      superhero s  JOIN      hero_attribute ha ON s.id = ha.hero_id  JOIN      attribute a ON ha.attribute_id = a.id  WHERE      a.attribute_name = 'Durability'      AND ha.attribute_value < 50;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      ROUND((COUNT(CASE WHEN `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Bad') THEN 1 ELSE NULL END) * 100.0) / COUNT(`id`), 2) AS percentage_bad_alignment,     COUNT(CASE WHEN `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Bad') AND `publisher_id` = (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics') THEN 1 ELSE NULL END) AS bad_alignment_marvel_count FROM `superhero`	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference	superhero
SELECT id  FROM publisher  WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute;	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE gender_id = 2;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT `superhero_name` FROM `superhero` WHERE `height_cm` BETWEEN 170 AND 190 AND `eye_colour_id` = (SELECT `id` FROM `colour` WHERE `colour` = 'No Colour');	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.id = 56;	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT `race` FROM `superhero` WHERE `weight_kg` = 169;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE s.height_cm = 185 AND s.race_id = (SELECT id FROM race WHERE race = 'human');	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND((SUM(CASE WHEN superhero.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_marvel_heroes FROM superhero WHERE superhero.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM `superpower` sp JOIN `hero_power` hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM `superhero` s JOIN `hero_power` hp ON s.id = hp.hero_id JOIN `superpower` sp ON hp.power_id = sp.id WHERE s.id = 1;	superhero
SELECT COUNT(DISTINCT h.id)  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(s.id) AS average_no_skin_coloured_heroes FROM superhero s WHERE s.skin_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';	superhero
SELECT      s.superhero_name,      c.eye_colour AS Eyes,      h.hair_colour AS Hair,      k.skin_colour AS Skin FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id JOIN      colour h ON s.hair_colour_id = h.id JOIN      colour k ON s.skin_colour_id = k.id JOIN      gender g ON s.gender_id = g.id JOIN      publisher p ON s.publisher_id = p.id WHERE      g.gender = 'Female'      AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT      s.superhero_name,      p.publisher_name FROM      superhero s JOIN      colour AS eye_colour ON s.eye_colour_id = eye_colour.id JOIN      colour AS hair_colour ON s.hair_colour_id = hair_colour.id JOIN      colour AS skin_colour ON s.skin_colour_id = skin_colour.id JOIN      publisher p ON s.publisher_id = p.id WHERE      s.eye_colour_id = s.hair_colour_id AND      s.hair_colour_id = s.skin_colour_id;	superhero
SELECT `race`.`race` FROM `superhero` JOIN `race` ON `superhero`.`race_id` = `race`.`id` WHERE `superhero_name` = 'A-Bomb';	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) /          (COUNT(DISTINCT s.gender_id) * 100.0),         2     ) AS percentage_blue_female FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.gender_id = 2;	superhero
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT gender.gender FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM hero_power  JOIN superhero ON hero_power.hero_id = superhero.id  WHERE superhero.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT `superhero_name` FROM `superhero` JOIN `colour` AS eye_colour ON `superhero`.`eye_colour_id` = `eye_colour`.`id` JOIN `colour` AS hair_colour ON `superhero`.`hair_colour_id` = `hair_colour`.`id` WHERE `eye_colour`.`colour` = 'Black' AND `hair_colour`.`colour` = 'Black';	superhero
SELECT s.superhero_name, c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'Gold';	superhero
SELECT `superhero.full_name` FROM `superhero` JOIN `race` ON `superhero.race_id` = `race.id` WHERE `race.race` = 'Vampire';	superhero
SELECT superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute     JOIN attribute ON hero_attribute.attribute_id = attribute.id     WHERE attribute.attribute_name = 'Strength' );	superhero
SELECT `race`.`race`, `alignment`.`alignment` FROM `superhero` JOIN `race` ON `superhero`.`race_id` = `race`.`id` JOIN `alignment` ON `superhero`.`alignment_id` = `alignment`.`id` WHERE `superhero`.`superhero_name` = 'Cameron Hicks';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = 2 AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0) /          COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 END),          2     ) AS percentage_female_marvel_heroes FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT      (SELECT SUM(weight_kg)       FROM superhero       WHERE full_name = 'Emil Blonsky') -      (SELECT SUM(weight_kg)       FROM superhero       WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE superhero.race_id = 21 AND gender.id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute_name = 'Speed'  ORDER BY attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE ha.hero_id = (SELECT id FROM superhero WHERE superhero_name = '3-D Man');	superhero
SELECT s.superhero_name FROM superhero s JOIN colour AS eye_colour ON s.eye_colour_id = eye_colour.id AND eye_colour.colour = 'Blue' JOIN colour AS hair_colour ON s.hair_colour_id = hair_colour.id AND hair_colour.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      ROUND((SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id), 2) AS blue_eyes_percentage FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id	superhero
SELECT      SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS male_count,     SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS female_count,     (SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) * 1.0) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS male_female_ratio FROM superhero;	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT `id` FROM `superpower` WHERE `power_name` = 'cryokinesis';	superhero
SELECT superhero_name  FROM superhero  WHERE id = 294;	superhero
SELECT `superhero_name`, `full_name` FROM `superhero` WHERE `weight_kg` = 0 OR `weight_kg` IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT race FROM superhero WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.id = 38;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN race r ON s.race_id = r.id WHERE ha.attribute_value = (     SELECT MAX(attribute_value) FROM hero_attribute )	superhero
SELECT s.alignment, sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) AS avg_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT      s.superhero_name,      c.colour AS skin_colour FROM      superhero s JOIN      colour c ON s.skin_colour_id = c.id JOIN      hero_attribute ha ON s.id = ha.hero_id WHERE      ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Good' AND gender.gender = 'Female';	superhero
SELECT `superhero_name` FROM `superhero` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` WHERE `attribute_value` BETWEEN 75 AND 80;	superhero
SELECT s.full_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN colour c ON s.hair_colour_id = c.id JOIN gender g ON s.gender_id = g.id WHERE c.colour = 'Blue' AND g.gender = 'Male';	superhero
SELECT      (SUM(CASE WHEN `alignment_id` = 2 AND `gender_id` = 2 THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN `alignment_id` = 2 THEN 1 ELSE 0 END) AS percentage_female_bad_heroes FROM `superhero`;	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 7 AND weight_kg IS NULL OR weight_kg = 0) -     (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 1 AND weight_kg IS NULL OR weight_kg = 0) AS eye_colours_difference FROM DUAL;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN colour ON superhero.skin_colour_id = colour.id WHERE alignment.alignment = 'Bad' AND colour.colour = 'Green';	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE power_name = 'Wind Control'  ORDER BY superhero_name ASC;	superhero
SELECT s.gender_id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, MAX(weight_kg) AS max_weight FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') GROUP BY superhero_name ORDER BY max_weight DESC LIMIT 1;	superhero
SELECT AVG(`superhero`.`height_cm`)  FROM `superhero`  JOIN `publisher` ON `superhero`.`publisher_id` = `publisher`.`id`  WHERE `race`.`race` <> 'Human' AND `publisher`.`publisher_name` = 'Dark Horse Comics';	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT   SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS DC_Count,   SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS Marvel_Count,   SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS Difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name IN ('DC Comics', 'Marvel Comics');	superhero
SELECT a.attribute_name, MIN(ha.attribute_value) AS min_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' GROUP BY a.attribute_name ORDER BY min_value ASC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name, full_name, MAX(height_cm) as height FROM superhero ORDER BY height DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND((SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) / COUNT(*)) * 100.0, 2) AS percentage_female FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'George Lucas';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.alignment_id = 1 THEN 1 ELSE 0 END) * 100.0) /          COUNT(*),         2     ) AS good_superhero_percentage FROM superhero s WHERE s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%';	superhero
SELECT hero_id  FROM hero_attribute  ORDER BY attribute_value ASC  LIMIT 1;	superhero
SELECT `superhero_name`, `full_name` FROM `superhero` WHERE `race` = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Auburn' AND s.weight_kg < 100;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT `weight_kg`, `race` FROM `superhero` WHERE `id` = 40;	superhero
SELECT AVG(`height_cm`) AS average_height FROM `superhero` WHERE `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Neutral');	superhero
SELECT hero_id  FROM hero_power  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Intelligence';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 20 AND q.q1 = (SELECT MAX(q1) FROM qualifying WHERE raceId = 20)	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19) AND q.raceId = 19;	formula_1
SELECT DISTINCT s.year  FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.name = 'Shanghai International Circuit';	formula_1
SELECT `url` FROM `circuits` WHERE `name` = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT `r.name` AS RaceName FROM `races` AS r JOIN `circuits` AS c ON r.circuitId = c.circuitId WHERE c.country = 'Germany';	formula_1
SELECT c.name, cs.positionText FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors cs ON cr.constructorId = cs.constructorId WHERE cs.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2010 AND circuits.country NOT IN ('Malaysia', 'Bahrain', 'China', 'Abu Dhabi', 'Singapore', 'Turkey', 'Japan', 'India', 'Bangladesh', 'Thailand', 'Vietnam', 'Indonesia', 'South Korea', 'Australia', 'New Zealand', 'Russia', 'Brazil', 'USA', 'Mexico', 'Canada', 'Argentina', 'Chile', 'Peru', 'Colombia', 'Ecuador', 'Venezuela', 'Paraguay', 'Uruguay', 'Bolivia', 'Guyana', 'Suriname', 'French Guiana', 'Martinique', 'Guadeloupe', 'Réunion', 'Mayotte', 'Saint Pierre and Miquelon', 'Canary Islands', 'Madeira', 'Azores', 'Canary Islands', 'Madeira', 'Azores', 'Greenland', 'Iceland', 'Faroe Islands', 'Albania', 'Bosnia and Herzegovina', 'Croatia', 'Slovenia', 'Montenegro', 'Serbia', 'Macedonia', 'Bulgaria', 'Romania', 'Ukraine', 'Belarus', 'Lithuania', 'Latvia', 'Estonia', 'Poland', 'Czech Republic', 'Slovakia', 'Hungary', 'Slovakia', 'Austria', 'Slovakia', 'Switzerland', 'Liechtenstein', 'Luxembourg', 'Belgium', 'Netherlands', 'France', 'Germany', 'Italy', 'Spain', 'Portugal', 'Ireland', 'United Kingdom', 'Northern Ireland', 'Scotland', 'Wales', 'Isle of Man', 'Jersey', 'Guernsey', 'Channel Islands', 'France', 'Germany', 'Italy', 'Spain', 'Portugal', 'Ireland', 'United Kingdom', 'Northern Ireland', 'Scotland', 'Wales', 'Isle of Man', 'Jersey', 'Guernsey', 'Channel Islands', 'France', 'Germany', 'Italy', 'Spain', 'Portugal', 'Ireland', 'United Kingdom', 'Northern Ireland', 'Scotland', 'Wales', 'Isle of Man', 'Jersey', 'Guernsey', 'Channel Islands', 'France', 'Germany',	formula_1
SELECT DISTINCT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT `lat`, `lng`  FROM `circuits`  WHERE `name` = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.name AS country FROM constructors AS con JOIN constructorResults AS cr ON con.constructorId = cr.constructorId JOIN circuits AS cir ON cr.raceId IN (SELECT raceId FROM races WHERE raceId = 24) JOIN circuits AS c ON cir.country = c.country WHERE cr.points = 1.0;	formula_1
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.forename = 'Bruno' AND drivers.surname = 'Senna' AND qualifying.raceId = (SELECT raceId FROM races WHERE raceId = 354);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '01:40:00' AND q.raceId = (SELECT raceId FROM races WHERE raceId = 355);	formula_1
SELECT d.number FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q3 LIKE '00:01%' AND q.raceId = 903;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Bahrain Grand Prix' AND r.time IS NULL	formula_1
SELECT seasons.url FROM races JOIN seasons ON races.year = seasons.year WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results JOIN races ON results.raceId = races.raceId WHERE races.date = '2015-11-29' AND results.statusId = 1;	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      d.dob FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId JOIN      status s ON r.raceId = s.raceId WHERE      r.raceId = 592     AND s.status = 'Finished'     AND d.dob IS NOT NULL ORDER BY      d.dob ASC LIMIT 1;	formula_1
SELECT      d.driverRef,      d.url FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId JOIN      races r ON lt.raceId = r.raceId WHERE      r.raceId = 161 AND      lt.time LIKE '0:01:27%'	formula_1
SELECT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.raceId = 933 AND results.fastestLap = 1;	formula_1
SELECT `location`, `lat`, `lng` FROM `circuits` JOIN `races` ON `circuits.circuitId` = `races.circuitId` WHERE `races.name` = 'Malaysian Grand Prix';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 9 ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId = (SELECT driverId FROM drivers WHERE driverRef = 'grassi') AND number = 1;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 347 AND q.q2 = '01:15:00';	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = (SELECT raceId FROM races WHERE raceId = 45 AND q3 LIKE '00:01%')	formula_1
SELECT r.time  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE d.surname = 'McLaren' AND c.name = 'McLaren' AND r.raceId = 743;	formula_1
SELECT d.driverRef, d.forename, d.surname FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'San Marino Grand Prix' AND r.year = 2006 AND ds.position = 2;	formula_1
SELECT seasons.url FROM seasons JOIN races ON seasons.year = races.year WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId = (SELECT statusId FROM status WHERE status = 'Finished') AND milliseconds IS NOT NULL;	formula_1
SELECT      d.driverId,      d.forename,      d.surname,      d.dob FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.raceId = 872 AND     r.statusId = 1 ORDER BY      d.dob DESC LIMIT 1;	formula_1
SELECT      d.forename || ' ' || d.surname AS fullName FROM      lapTimes lt JOIN      drivers d ON lt.driverId = d.driverId WHERE      lt.raceId = 348 ORDER BY      lt.time ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.fastestLapSpeed = (     SELECT MAX(lt2.fastestLapSpeed)     FROM lapTimes lt2     JOIN results r2 ON lt2.driverId = r2.driverId     WHERE r2.raceId = r.raceId )	formula_1
SELECT      (CAST(ABS(SPEED(raceId = 853) - SPEED(raceId = 854)) AS REAL) / SPEED(raceId = 853)) * 100 AS percentage_faster FROM      drivers JOIN      results ON drivers.driverId = results.driverId JOIN      races ON results.raceId = races.raceId WHERE      drivers.forename = 'Paul' AND drivers.surname = 'di Resta' AND      (results.raceId = 853 OR results.raceId = 854) ORDER BY      results.raceId;	formula_1
SELECT      d.driverRef,     d.forename,     d.surname,     (COUNT(CASE WHEN rt.time IS NOT NULL THEN 1 END) * 100.0 / COUNT(rt.driverId)) AS completionRate FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId JOIN      lapTimes rt ON d.driverId = rt.driverId AND r.raceId = rt.raceId WHERE      ra.date = '1983-07-16' GROUP BY      d.driverRef, d.forename, d.surname;	formula_1
SELECT MIN(year) as first_singapore_gp_year FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) AS total_races, name FROM races JOIN seasons ON races.year = seasons.year WHERE seasons.year = 2005 GROUP BY name ORDER BY name DESC;	formula_1
SELECT name FROM races WHERE year = (SELECT MIN(year) FROM races)   AND MONTH(date) = (SELECT MIN(MONTH(date)) FROM races);	formula_1
SELECT r.name, r.date FROM races r JOIN seasons s ON r.year = s.year WHERE s.year = 1999 ORDER BY r.round DESC LIMIT 1;	formula_1
SELECT s.year, COUNT(r.round) AS total_rounds FROM seasons s JOIN races r ON s.year = r.year GROUP BY s.year ORDER BY total_rounds DESC LIMIT 1;	formula_1
SELECT r.name FROM races r WHERE r.year = 2017 AND r.raceId NOT IN (     SELECT r2.raceId     FROM races r2     WHERE r2.year = 2000 );	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.url LIKE '%1950%' AND c.country = 'Spain';	formula_1
SELECT MAX(year)  FROM races  WHERE name = 'British Grand Prix'  AND circuitRef = 'brdc';	formula_1
SELECT COUNT(DISTINCT year) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit' AND circuits.country = 'United Kingdom' AND races.name = 'British Grand Prix';	formula_1
SELECT      d.forename,      d.surname,      ds.position FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      r.year = 2010 AND r.name = 'Singapore Grand Prix' ORDER BY      ds.position;	formula_1
SELECT d.forename, d.surname, ds.points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId WHERE ds.points = (SELECT MAX(points) FROM driverStandings);	formula_1
SELECT      d.surname AS DriverName,      ds.points AS Points FROM      driverStandings ds JOIN      drivers d ON ds.driverId = d.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY      ds.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name AS race_name, MIN(l.milliseconds) AS best_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY l.driverId, r.raceId ORDER BY best_lap_time LIMIT 1;	formula_1
SELECT AVG(`milliseconds`) AS average_lap_time FROM `lapTimes` JOIN `drivers` ON `lapTimes.driverId` = `drivers.driverId` JOIN `races` ON `lapTimes.raceId` = `races.raceId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton' AND `races.name` = 'Malaysian Grand Prix';	formula_1
SELECT      (SELECT COUNT(raceId)       FROM races       JOIN results ON races.raceId = results.raceId       JOIN drivers ON results.driverId = drivers.driverId       WHERE drivers.surname = 'Hamilton' AND results.position > 1 AND YEAR(races.date) >= 2010)      /      (SELECT COUNT(raceId)       FROM races       JOIN results ON races.raceId = results.raceId       JOIN drivers ON results.driverId = drivers.driverId       WHERE drivers.surname = 'Hamilton' AND YEAR(races.date) >= 2010) * 100 AS percentage;	formula_1
SELECT      d.forename,      d.surname,      d.nationality,      ddr.wins,      ddr.points FROM      drivers d JOIN      (SELECT           ds.driverId,           COUNT(*) AS wins,           SUM(ds.points) AS points      FROM           driverStandings ds      GROUP BY           ds.driverId      ORDER BY           wins DESC, points DESC      LIMIT 1) ddr  ON      d.driverId = ddr.driverId;	formula_1
SELECT MIN(dob) AS youngest_dob, d.forename, d.surname FROM drivers d WHERE d.nationality = 'Japanese' GROUP BY d.nationality ORDER BY youngest_dob DESC LIMIT 1;	formula_1
SELECT c.circuitRef, c.name, COUNT(r.circuitId) AS raceCount FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitRef, c.name HAVING COUNT(r.circuitId) = 4;	formula_1
SELECT c.name, c.location, r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name AS raceName, c.name AS circuitName, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name  FROM races AS r JOIN results AS res ON r.raceId = res.raceId JOIN drivers AS d ON res.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(*) FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN circuits ON results.circuitId = circuits.circuitId WHERE drivers.surname = 'Schumacher' AND circuits.name = 'Sepang International Circuit' AND results.points = (     SELECT MAX(points)     FROM results AS max_points     JOIN drivers ON max_points.driverId = drivers.driverId     JOIN circuits ON max_points.circuitId = circuits.circuitId     WHERE drivers.surname = 'Schumacher' AND circuits.name = 'Sepang International Circuit' );	formula_1
SELECT r.name AS race_name, s.year AS race_year FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId JOIN seasons s ON r.year = s.year WHERE d.surname = 'Schumacher' AND lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes lt2     JOIN drivers d2 ON lt2.driverId = d2.driverId     WHERE d2.surname = 'Schumacher' );	formula_1
SELECT AVG(points) AS average_points FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.surname = 'Irvine' AND driverStandings.year = 2000;	formula_1
SELECT      r.name AS race_name,      ds.points AS points_recorded FROM      races r JOIN      driverStandings ds ON r.raceId = ds.raceId JOIN      drivers d ON ds.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY      r.year ASC LIMIT 1;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT      r.name AS race_name,     s.year,     c.location AS circuit_location,     MAX(r.laps) AS most_laps FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId JOIN      (SELECT raceId, SUM(laps) AS laps FROM results GROUP BY raceId) AS race_laps ON      r.raceId = race_laps.raceId JOIN      seasons s ON r.year = s.year GROUP BY      r.raceId, r.name, s.year, c.location ORDER BY      most_laps DESC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN circuits.country = 'Germany' THEN 1 END) * 100.0) /      COUNT(*) AS percentage FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT `name`, `lat` FROM `circuits` WHERE `name` IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY `lat` DESC LIMIT 1;	formula_1
SELECT `circuitRef`  FROM `circuits`  WHERE `name` = 'Marina Bay Street Circuit';	formula_1
SELECT `country`, `alt` FROM `circuits` ORDER BY `alt` DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT d.nationality, d.forename, d.surname, d.dob FROM drivers d ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT surname  FROM drivers  WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE `surname` = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT DISTINCT s.year  FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.circuitRef = 'silverstone';	formula_1
SELECT      r.raceId,      r.name AS raceName,      r.date,      r.time,      c.circuitRef,      c.name AS circuitName,      c.url AS circuitUrl FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      c.circuitRef = 'silverstone';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Abu Dhabi Circuit' AND r.year = 2010;	formula_1
SELECT COUNT(*) FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.circuitRef = 'catalunya';	formula_1
SELECT url  FROM circuits  WHERE circuitRef = 'catalunya' AND circuitId IN (     SELECT circuitId      FROM races      WHERE name = 'Spanish Grand Prix' AND year = 2009 );	formula_1
SELECT MIN(`fastestLapTime`) AS fastestLapTime FROM `results` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis')	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId JOIN (     SELECT raceId, MIN(fastestLapSpeed) AS minSpeed     FROM results     WHERE fastestLap IS NOT NULL     GROUP BY raceId ) AS minSpeedRaces ON r.raceId = minSpeedRaces.raceId JOIN results AS fastest ON r.raceId = fastest.raceId AND fastest.fastestLap = 1 WHERE lt.milliseconds = fastest.milliseconds	formula_1
SELECT d.driverRef FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND ds.position = 1 AND r.year = 2007;	formula_1
SELECT r.name, r.date, r.time FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name, ds.rank FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY ds.rank ASC LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) AS fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT s.year FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT ds.positionOrder  FROM driverStandings ds  JOIN drivers d ON ds.driverId = d.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  AND r.name = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND r.time IS NOT NULL;	formula_1
SELECT MIN(`milliseconds`) AS fastestLapTime FROM `lapTimes` WHERE `driverRef` = 'hamilton' AND `raceId` IN (     SELECT `raceId`     FROM `races`     WHERE `name` = 'Australian Grand Prix' AND `year` = 2008 )	formula_1
SELECT r.time  FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.name = 'Chinese Grand Prix'  AND d.surname = 'Alonso'  AND r.position = 2;	formula_1
SELECT d.driverRef, d.url FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN seasons s ON r.year = s.year WHERE s.year = 2008 AND r.name = 'Australian Grand Prix' AND ds.position = 1 AND ds.positionText = '1' AND ds.statusId = 1 AND r.date LIKE '2008-%';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN seasons s ON r.year = s.year WHERE s.year = 2008 AND d.nationality = 'British';	formula_1
SELECT      COUNT(DISTINCT d.driverId)  FROM      drivers d  JOIN      results r ON d.driverId = r.driverId  JOIN      races ra ON r.raceId = ra.raceId  WHERE      ra.year = 2008 AND      ra.name = 'Chinese Grand Prix' AND      r.time IS NOT NULL;	formula_1
SELECT SUM(points) AS total_points FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton'	formula_1
SELECT AVG(STR_TO_DATE(SUBSTRING_INDEX(`fastestLapTime`, ':', 1), '%M')) +         AVG(STR_TO_DATE(SUBSTRING_INDEX(SUBSTRING_INDEX(`fastestLapTime`, ':', -1), '.', 1), '%S')) / 60.0 AS averageFastestLapTime FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT      (SELECT COUNT(DISTINCT raceId)       FROM results       WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 AND time IS NOT NULL)     ) /      (SELECT COUNT(DISTINCT raceId)       FROM results       WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)     ) AS completion_rate;	formula_1
SELECT      ((TIME_TO_SEC(TIMEDIFF(         (SELECT `time` FROM `results` WHERE `position` = 1 AND `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = 'Australian Grand Prix' AND `year` = 2008),         (SELECT `time` FROM `results` WHERE `position` = (SELECT MAX(`position`) FROM `results` WHERE `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = 'Australian Grand Prix' AND `year` = 2008))     )) / TIME_TO_SEC(         (SELECT `time` FROM `results` WHERE `position` = (SELECT MAX(`position`) FROM `results` WHERE `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = 'Australian Grand Prix' AND `year` = 2008))     )) * 100) AS difference_percentage	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT `circuitRef`, `lat`, `lng` FROM `circuits` WHERE `country` = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(points)  FROM constructorResults  JOIN constructors ON constructorResults.constructorId = constructors.constructorId  WHERE constructors.nationality = 'British';	formula_1
SELECT      c.name AS ConstructorName,      SUM(cr.points) AS TotalPoints FROM      constructors c JOIN      constructorResults cr ON c.constructorId = cr.constructorId GROUP BY      c.name ORDER BY      TotalPoints DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(DISTINCT cr.constructorId) FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY cr.constructorId HAVING COUNT(cr.raceId) = 2;	formula_1
SELECT c.constructorRef, c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN constructors c ON r.constructorId = c.constructorId JOIN races rs ON r.raceId = rs.raceId JOIN lapTimes lt ON d.driverId = lt.driverId WHERE c.nationality = 'French' AND lt.lap > 50;	formula_1
SELECT     (COUNT(CASE WHEN d.nationality = 'Japanese' AND r.year BETWEEN 2007 AND 2009 THEN dr.driverId ELSE NULL END) * 100.0) /      COUNT(CASE WHEN d.nationality = 'Japanese' AND r.year BETWEEN 2007 AND 2009 THEN dr.driverId ELSE NULL END) FROM     drivers d JOIN     driverStandings ds ON d.driverId = ds.driverId JOIN     races r ON ds.raceId = r.raceId JOIN     results rsl ON ds.driverId = rsl.driverId AND ds.raceId = rsl.raceId WHERE     d.nationality = 'Japanese'     AND r.year BETWEEN 2007 AND 2009     AND rsl.time IS NOT NULL	formula_1
SELECT      r.year,     AVG(SEC_TO_TIME(TIME_TO_SEC(r.time))) AS avg_champion_time FROM      results r JOIN      constructorStandings cs ON r.constructorId = cs.constructorId AND r.raceId = cs.raceId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.year < 1975 AND     cs.position = 1 AND     r.time IS NOT NULL GROUP BY      r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     JOIN results r ON ds.driverId = d.driverId AND ds.raceId = r.raceId     WHERE ds.positionText = '2' )	formula_1
SELECT COUNT(*) FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN constructors ON constructors.constructorId = results.constructorId WHERE drivers.nationality = 'Italian' AND results.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT lap FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE year = 2009 AND name = 'Australian Grand Prix' ) ORDER BY milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapSpeed) AS averageFastestLapSpeed FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Spanish Grand Prix' );	formula_1
SELECT r.name, s.year FROM races r JOIN seasons s ON r.year = s.year JOIN (     SELECT raceId, MIN(milliseconds) AS minMilliseconds     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) AS shortest ON r.raceId = shortest.raceId WHERE shortest.minMilliseconds = (     SELECT MIN(milliseconds)     FROM results     WHERE milliseconds IS NOT NULL ) ORDER BY r.name, s.year;	formula_1
SELECT      (COUNT(CASE WHEN drivers.dob < '1985-01-01' THEN 1 END) * 100.0) /      COUNT(DISTINCT drivers.driverId) AS percentage FROM      drivers JOIN      results ON drivers.driverId = results.driverId JOIN      races ON results.raceId = races.raceId WHERE      drivers.dob < '1985-01-01'      AND races.year BETWEEN 2000 AND 2005     AND results.laps > 50;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND SUBSTR(lt.time, 1, 2) < 2;	formula_1
SELECT `code` FROM `drivers` WHERE `nationality` = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM driverStandings  WHERE raceId = 18;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d WHERE d.nationality = 'Dutch' ORDER BY d.dob DESC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE surnames = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      MIN(lt.time) AS EarliestLapTime FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY      d.driverRef, d.forename, d.surname ORDER BY      EarliestLapTime ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE YEAR(d.dob) = 1971 AND lt.fastestLapTime IS NOT NULL ORDER BY lt.fastestLapTime ASC LIMIT 1;	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      d.dob,      l.maxTime FROM      drivers d JOIN (     SELECT          lt.driverId,          MAX(STRFTIME('%Y-%m-%d %H:%M:%S', (lt.milliseconds / 1000.0))) AS maxTime     FROM          lapTimes lt     GROUP BY          lt.driverId ) lt_max ON d.driverId = lt_max.driverId WHERE      d.nationality = 'Spanish'      AND d.dob < '1982-01-01' ORDER BY      lt_max.maxTime ASC LIMIT      10;	formula_1
SELECT `year` FROM `seasons` JOIN `races` ON `seasons.year` = `races.year` JOIN `results` ON `races.raceId` = `results.raceId` WHERE `results.fastestLapTime` IS NOT NULL ORDER BY `results.fastestLapTime` ASC LIMIT 1;	formula_1
SELECT s.year, MAX(lt.time) AS slowest_lap_time FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN seasons s ON r.year = s.year GROUP BY s.year ORDER BY MAX(lt.time) ASC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE raceId = 1 AND lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2;	formula_1
SELECT c.name, c.location, c.lat, c.lng  FROM circuits c  WHERE c.country = 'Austria';	formula_1
SELECT raceId, COUNT(*) AS finisher_count FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY finisher_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 IS NOT NULL AND q.raceId = 23;	formula_1
SELECT      d.driverRef AS Driver,     s.year AS Qualifying_Year,     r.name AS Race_Name,     r.date AS Race_Date,     r.time AS Race_Time FROM      drivers d JOIN      qualifying q ON d.driverId = q.driverId JOIN      races r ON q.raceId = r.raceId JOIN      seasons s ON r.year = s.year WHERE      d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY      s.year;	formula_1
SELECT COUNT(*) FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN status ON results.statusId = status.statusId WHERE drivers.nationality = 'American' AND status.status = 'Puncture';	formula_1
SELECT      constructors.name,      constructors.url FROM      constructors WHERE      nationality = 'Italian' ORDER BY      points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.wins = (     SELECT MAX(wins)     FROM constructorStandings )	formula_1
SELECT d.driverRef, d.surname, MAX(lt.time) AS slowestLapTime FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 GROUP BY lt.driverId ORDER BY MAX(lt.time) DESC LIMIT 1;	formula_1
SELECT r.name AS race_name, MIN(lt.milliseconds) AS fastest_lap_time FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE lt.lap = 1 AND lt.position = 1 GROUP BY r.name ORDER BY fastest_lap_time LIMIT 1;	formula_1
SELECT AVG(`fastestLapTime`)  FROM `results`  WHERE `positionOrder` < 11  AND `raceId` IN (SELECT `raceId` FROM `races` WHERE `name` = 'United States Grand Prix' AND `year` = 2006);	formula_1
SELECT      d.forename,      d.surname,      AVG(T2.duration) AS avg_pitstop_duration FROM      drivers d JOIN      pitStops p ON d.driverId = p.driverId WHERE      d.nationality = 'German'      AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY      d.driverId ORDER BY      avg_pitstop_duration ASC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN seasons s ON ra.year = s.year WHERE ra.name = 'Canadian Grand Prix' AND s.year = 2008 AND r.position = 1 AND r.statusId = 1; -- Assuming 'statusId' 1 indicates 'Finished'	formula_1
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON constructorStandings.raceId = races.raceId JOIN seasons ON races.year = seasons.year WHERE races.name = 'Singapore Grand Prix' AND seasons.year = 2009 ORDER BY constructorStandings.position DESC LIMIT 1;	formula_1
SELECT `forename`, `surname`, `dob` FROM `drivers` WHERE `nationality` = 'Austrian' AND `dob` BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT      CONCAT(d.forename, ' ', d.surname) AS fullName,     d.url AS wikiPageLink,     d.dob AS dateOfBirth FROM      drivers d WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY      d.dob DESC;	formula_1
SELECT `location`, `country`, `lat`, `lng` FROM `circuits` WHERE `circuitRef` = 'hungaroring';	formula_1
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId JOIN seasons s ON r.year = s.year JOIN constructorResults cr ON cs.constructorId = cr.constructorId WHERE r.name = 'Circuit de Monaco' AND s.year BETWEEN 1980 AND 2010 GROUP BY c.name, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM races WHERE year BETWEEN 2000 AND 2010;	formula_1
SELECT nationality, COUNT(*) AS count FROM drivers GROUP BY nationality ORDER BY count DESC LIMIT 1;	formula_1
SELECT COUNT(*)  FROM results  WHERE driverId = (     SELECT driverId      FROM driverStandings      WHERE position = 91 ) AND points = (     SELECT points      FROM driverStandings      WHERE position = 91 );	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN lapTimes lt ON res.driverId = lt.driverId AND res.raceId = lt.raceId WHERE lt.fastestLap IS NOT NULL ORDER BY lt.fastestLapTime LIMIT 1;	formula_1
SELECT c.location, c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.name = 'Malaysian Grand Prix' AND q.position = 1 AND r.year = 2008 AND q.q3 IS NOT NULL ORDER BY q.q3 LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.nationality, r.name AS raceName FROM drivers d JOIN (     SELECT MIN(dob) AS min_dob     FROM drivers ) AS youngest ON d.dob = youngest.min_dob JOIN races r ON d.driverId = (     SELECT driverId     FROM results     WHERE driverId = d.driverId     ORDER BY raceId ASC     LIMIT 1 );	formula_1
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE races.name = 'Canadian Grand Prix'  AND results.statusId = 3  AND drivers.driverId = (     SELECT driverId      FROM results      JOIN races ON results.raceId = races.raceId      JOIN drivers ON results.driverId = drivers.driverId      WHERE races.name = 'Canadian Grand Prix'      AND results.statusId = 3      GROUP BY drivers.driverId      ORDER BY COUNT(*) DESC      LIMIT 1 );	formula_1
SELECT d.forename, d.surname, COUNT(*) as wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId	formula_1
SELECT MAX(duration) AS longest_pit_stop_duration FROM `pitStops`	formula_1
SELECT MIN(`milliseconds`) AS fastestLapTime FROM `lapTimes` ORDER BY `milliseconds` ASC LIMIT 1;	formula_1
SELECT MAX(duration) AS longest_pit_stop_duration FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton');	formula_1
SELECT lap FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId JOIN races ON pitStops.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Australian Grand Prix' AND YEAR(races.date) = 2011;	formula_1
SELECT      p.driverId,      d.forename,      d.surname,      p.lap,      p.time,      p.duration  FROM      pitStops p  JOIN      drivers d ON p.driverId = d.driverId  JOIN      races r ON p.raceId = r.raceId  WHERE      r.year = 2011 AND      r.name = 'Australian Grand Prix';	formula_1
SELECT      d.forename,      d.surname,      MIN(l(milliseconds)) AS fastestLapTime FROM      lapTimes l JOIN      drivers d ON l.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY      d.forename, d.surname ORDER BY      fastestLapTime ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes ) ORDER BY lt.milliseconds ASC LIMIT 20;	formula_1
SELECT r.position FROM results r JOIN lapTimes lt ON r.driverId = lt.driverId AND r.raceId = lt.raceId JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Austrian Grand Prix' );	formula_1
SELECT      c.circuitRef,     c.name,     MIN(l.time) AS fastestLap FROM      circuits c JOIN      lapTimes l ON c.circuitId = l.raceId WHERE      c.country = 'Italy' GROUP BY      c.circuitRef, c.name ORDER BY      fastestLap ASC;	formula_1
SELECT r.name  FROM races r  JOIN lapTimes lt ON r.raceId = lt.raceId  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Austrian Grand Prix'  AND lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes lt2 JOIN circuits c2 ON lt2.raceId = c2.circuitId WHERE c2.name = 'Austrian Grand Prix');	formula_1
SELECT      p.`raceId`,     p.driverId,     p.stop,     p.lap,     p.duration FROM      pitStops p JOIN      races r ON p.raceId = r.raceId WHERE      r.name = 'Austrian Grand Prix' AND     p.driverId IN (         SELECT              lt.driverId         FROM              lapTimes lt         WHERE              lt.time = (                 SELECT                      MIN(lt2.time)                 FROM                      lapTimes lt2                 WHERE                      lt2.raceId = p.raceId             )     );	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(`milliseconds`) AS average_pit_stop_time FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis');	formula_1
SELECT AVG(`milliseconds`) AS average_lap_time FROM `lapTimes` JOIN `circuits` ON `lapTimes.raceId` IN (SELECT `raceId` FROM `races` WHERE `circuits.country` = 'Italy')	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT `player_name`, `height` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`);	european_football_2
SELECT preferred_foot  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_api_id = (     SELECT player_api_id      FROM Player_Attributes      ORDER BY potential ASC      LIMIT 1 );	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name IS NOT NULL ORDER BY pa.crossing DESC LIMIT 5;	european_football_2
SELECT L.name FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) AS losses FROM Match WHERE season = '2015/2016' AND (home_team_goal < away_team_goal) GROUP BY home_team_api_id ORDER BY losses ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.penalties = (SELECT MAX(penalties) FROM Player_Attributes) ORDER BY pa.penalties DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM `Team` T1 JOIN `Match` T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.season = '2009/2010' AND T2.league_id = (     SELECT id     FROM `League`     WHERE name = 'Scotland Premier League' ) AND T2.away_team_goal > T2.home_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT      T1.team_long_name,      T1.buildUpPlaySpeed FROM      Team_Attributes T1 JOIN      (SELECT team_api_id, MAX(buildUpPlaySpeed) AS max_speed      FROM Team_Attributes      GROUP BY team_api_id      ORDER BY max_speed DESC      LIMIT 4) T2 ON T1.team_api_id = T2.team_api_id ORDER BY      T1.buildUpPlaySpeed DESC;	european_football_2
SELECT League.name  FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016'  GROUP BY League.name ORDER BY SUM(CASE WHEN Match.home_team_goal = Match.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT     p.player_name,     TIMESTAMPDIFF(YEAR, p.birthday, CURRENT_TIMESTAMP) AS current_age,     pa.sprint_speed FROM     Player p JOIN     Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE     pa.sprint_speed >= 97     AND pa.date BETWEEN '2013-01-01' AND '2015-12-31';	european_football_2
SELECT `name`, COUNT(*) AS total_matches FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` GROUP BY `League.id` ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) as average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE substr(date, 1, 4) = '2010'  AND overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') GROUP BY player_api_id  ORDER BY overall_rating DESC  LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > (     SELECT AVG(T2.buildUpPlayPassing)     FROM Team AS T1     JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id     WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing IS NOT NULL ) AND strftime('%Y', T2.date) = '2012';	european_football_2
SELECT      ROUND((SUM(CASE WHEN `Player_Attributes`.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100) / COUNT(`Player`.`player_fifa_api_id`), 2) AS left_foot_percentage FROM      `Player` INNER JOIN      `Player_Attributes` ON `Player_Attributes`.player_fifa_api_id = `Player`.player_fifa_api_id WHERE      `Player_Attributes`.preferred_foot = 'left' AND      YEAR(`Player`.birthday) BETWEEN 1987 AND 1992;	european_football_2
SELECT      League.name AS league_name,      SUM(Match.home_team_goal + Match.away_team_goal) AS total_goals FROM      Match JOIN      League ON Match.league_id = League.id GROUP BY      League.name ORDER BY      total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots) AS average_long_shots FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT p.player_name, AVG(pa.heading_accuracy) as avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team_Attributes.buildUpPlayDribblingClass = 'Normal' AND Team_Attributes.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND Team_Attributes.chanceCreationPassing < (     SELECT AVG(chanceCreationPassing)     FROM Team_Attributes     WHERE buildUpPlayDribblingClass = 'Normal'     AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' ) ORDER BY Team_Attributes.chanceCreationPassing ASC;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' AND AVG(Match.home_team_goal) > AVG(Match.away_team_goal) GROUP BY League.name;	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Franco Zennaro');	european_football_2
SELECT      `Team_Attributes`.`buildUpPlayPositioningClass` AS `FreedomOfMovement_1st2Thirds` FROM      `Team_Attributes` JOIN      `Team` ON      `Team_Attributes`.`team_api_id` = `Team`.`team_api_id` WHERE      `Team`.`team_long_name` = 'ADO Den Haag';	european_football_2
SELECT `Player_Attributes.heading_accuracy` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Francois Affolter' AND `Player_Attributes.date` = '2014-09-18 00:00:00';	european_football_2
SELECT overall_rating  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id  WHERE Player.player_name = 'Gabriel Tamas' AND strftime('%Y', date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') AND season = '2015/2016';	european_football_2
SELECT pa.preferred_foot FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `weight` < 130 AND `preferred_foot` = 'left';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE Player.player_name = 'David Wilson';	european_football_2
SELECT `birthday` FROM `Player` WHERE `player_api_id` = (     SELECT `player_api_id`     FROM `Player_Attributes`     ORDER BY `overall_rating` DESC     LIMIT 1 );	european_football_2
SELECT `name` FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `Country.name` = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT p.player_name, p.height, pa.AVG_finishing FROM `Player` p JOIN (     SELECT pa.player_api_id, AVG(pa.finishing) AS AVG_finishing     FROM `Player_Attributes` pa     GROUP BY pa.player_api_id ) pa ON p.player_api_id = pa.player_api_id WHERE p.height BETWEEN (SELECT MAX(height) FROM `Player`) AND (SELECT MIN(height) FROM `Player`) ORDER BY pa.AVG_finishing DESC LIMIT 1;	european_football_2
SELECT `player_name` FROM `Player` WHERE `height` > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential`  FROM `Player_Attributes`  WHERE `player_fifa_api_id` = (SELECT `player_fifa_api_id`                               FROM `Player`                               WHERE `player_name` = 'Aaron Doran');	european_football_2
SELECT player_name FROM Player WHERE preferred_foot = 'left';	european_football_2
SELECT DISTINCT T1.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_api_id` IN (     SELECT `team_api_id`     FROM `Team`     WHERE `team_short_name` = 'CLB' );	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` WHERE `buildUpPlayPassing` > 70;	european_football_2
SELECT AVG(t2.overall_rating) AS average_rating FROM Player_Attributes AS t1 JOIN Player AS t2 ON t1.player_fifa_api_id = t2.player_fifa_api_id WHERE strftime('%Y', t1.date) BETWEEN '2010' AND '2015' AND t2.height > 170;	european_football_2
SELECT player_name, height  FROM Player  ORDER BY height ASC  LIMIT 1;	european_football_2
SELECT `Country.name`  FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `League.name` = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Aaron Doran');	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT `Team.team_short_name` FROM `Team` JOIN `Match` ON `Team.team_api_id` = `Match.home_team_api_id` WHERE `Match.home_team_goal` = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 AND pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61);	european_football_2
SELECT     (AVG(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE NULL END) -      AVG(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE NULL END)) AS ball_control_difference FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye') GROUP BY p.player_name;	european_football_2
SELECT `team_long_name`  FROM `Team`  WHERE `team_short_name` = 'GEN';	european_football_2
SELECT      p1.player_name AS PlayerName,     p1.birthday AS Birthday,     p2.player_name AS PlayerNameCompare,     p2.birthday AS BirthdayCompare FROM      Player p1 JOIN      Player p2 ON      p1.player_api_id = 23780 AND p2.player_api_id = 505942 ORDER BY      p1.birthday > p2.birthday DESC LIMIT 1;	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM `Player_Attributes` pa JOIN `Player` p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT `Country.name`  FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `League.name` = 'Belgium Jupiler League';	european_football_2
SELECT `name` FROM `League` WHERE `country_id` IN (SELECT `id` FROM `Country` WHERE `name` = 'Germany');	european_football_2
SELECT player_name, MAX(overall_rating) as max_strength FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id GROUP BY player_name ORDER BY max_strength DESC LIMIT 1;	european_football_2
SELECT DISTINCT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT player_name, MAX(crossing) AS best_crossing FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY player_name ORDER BY best_crossing DESC LIMIT 1;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Ariel Borysiuk' );	european_football_2
SELECT COUNT(*) FROM Player WHERE height > 180 AND Player.player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE volleys > 70 );	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Belgium' AND Match.season = '2008/2009';	european_football_2
SELECT pa.long_passing  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.birthday = (SELECT MIN(birthday) FROM Player);	european_football_2
SELECT COUNT(*) FROM `Match` WHERE `league_id` IN (SELECT `id` FROM `League` WHERE `name` = 'Belgium Jupiler League') AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT `name` FROM `League` WHERE `id` IN (     SELECT `league_id`     FROM `Match`     WHERE `season` = '2008/2009' ) GROUP BY `name` ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id`  WHERE strftime('%Y', `Player.birthday`) < '1986';	european_football_2
SELECT      ROUND(         (             (SELECT overall_rating FROM Player_Attributes pa               JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id               WHERE p.player_name = 'Ariel Borysiuk') -              (SELECT overall_rating FROM Player_Attributes pa               JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id               WHERE p.player_name = 'Paulin Puel')         ) /          (SELECT overall_rating FROM Player_Attributes pa           JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id           WHERE p.player_name = 'Paulin Puel') * 100     ) AS percentage_difference	european_football_2
SELECT AVG(`buildUpPlaySpeed`) AS average_build_up_play_speed FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes`.`team_api_id` = `Team`.`team_api_id` WHERE `Team`.`team_long_name` = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(`Player_Attributes`.`crossing`) AS total_crossing_score FROM `Player_Attributes` INNER JOIN `Player` AS T2 ON `Player_Attributes`.`player_fifa_api_id` = T2.`player_fifa_api_id` WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(`chanceCreationPassing`) AS `HighestChanceCreationPassingScore`, `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax' GROUP BY `chanceCreationPassingClass` ORDER BY `HighestChanceCreationPassingScore` DESC LIMIT 1;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` AS T2 ON `Player_Attributes`.`player_api_id` = T2.`player_api_id`  WHERE T2.`player_name` = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal) AS avg_away_goals FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id JOIN League ON Match.league_id = League.id JOIN Country ON League.country_id = Country.id WHERE Team.team_long_name = 'Parma' AND Country.name = 'Italy';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY STR_TO_DATE(p.birthday, '%Y-%m-%d') ASC LIMIT 1;	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Aaron Mooy' ) AND `date` LIKE '2016-02-04%'	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francesco Parravicini') AND `date` = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francesco Migliore') AND `date` LIKE '2015-05-01%';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Kevin Berigaud' AND `date` = '2013-02-22 00:00:00';	european_football_2
SELECT date  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE Player.player_name = 'Kevin Constant' ORDER BY crossing DESC LIMIT 1;	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Willem II' AND `date` = '2012-02-22';	european_football_2
SELECT `buildUpPlayDribblingClass` FROM `Team_Attributes` WHERE `team_api_id` = (SELECT `team_api_id` FROM `Team` WHERE `team_short_name` = 'LEI') AND `date` = '2015-09-10 00:00:00';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'FC Lorient' AND `date` LIKE '2010-02-22%';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `Team.team_long_name` = 'PEC Zwolle' AND `Team_Attributes.date` = '2013-09-20 00:00:00'	european_football_2
SELECT chanceCreationCrossingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Hull City' AND Team_Attributes.date = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND `date` LIKE '2015-09-10%';	european_football_2
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player_Attributes` WHERE `player_name` = 'Marko Arnautovic' AND SUBSTR(`date`, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21' AND `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Marko Arnautovic' );	european_football_2
SELECT      ((         (SELECT `overall_rating`           FROM `Player_Attributes` pa           INNER JOIN `Player` p ON pa.player_api_id = p.player_api_id           WHERE p.player_name = 'Landon Donovan' AND pa.date = '2013-07-12') -          (SELECT `overall_rating`           FROM `Player_Attributes` pa           INNER JOIN `Player` p ON pa.player_api_id = p.player_api_id           WHERE p.player_name = 'Jordan Bowery' AND pa.date = '2013-07-12')     ) /      (SELECT `overall_rating`       FROM `Player_Attributes` pa       INNER JOIN `Player` p ON pa.player_api_id = p.player_api_id       WHERE p.player_name = 'Landon Donovan' AND pa.date = '2013-07-12')     ) * 100 AS percentage_difference	european_football_2
SELECT player_name  FROM Player  ORDER BY height DESC  LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM `Player` WHERE DATEDIFF(YEAR, birthday, CURRENT_TIMESTAMP) > 34;	european_football_2
SELECT SUM(`home_team_goal`) AS total_home_goals FROM `Match` JOIN `Player` ON `Match.home_player_1` = `Player.player_api_id` OR                `Match.home_player_2` = `Player.player_api_id` OR                `Match.home_player_3` = `Player.player_api_id` OR                `Match.home_player_4` = `Player.player_api_id` OR                `Match.home_player_5` = `Player.player_api_id` OR                `Match.home_player_6` = `Player.player_api_id` OR                `Match.home_player_7` = `Player.player_api_id` OR                `Match.home_player_8` = `Player.player_api_id` OR                `Match.home_player_9` = `Player.player_api_id` OR                `Match.home_player_10` = `Player.player_api_id` OR                `Match.home_player_11` = `Player.player_api_id` WHERE `Player.player_name` = 'Aaron Lennon';	european_football_2
SELECT SUM(M.away_team_goal) AS total_away_goals FROM `Match` M JOIN `Player` P ON M.away_player_1 = P.player_api_id OR M.away_player_2 = P.player_api_id WHERE P.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(M.home_team_goal) AS total_home_goals FROM Match M JOIN Player P ON M.home_player_1 = P.player_api_id OR M.home_player_2 = P.player_api_id      OR M.home_player_3 = P.player_api_id OR M.home_player_4 = P.player_api_id      OR M.home_player_5 = P.player_api_id OR M.home_player_6 = P.player_api_id      OR M.home_player_7 = P.player_api_id OR M.home_player_8 = P.player_api_id      OR M.home_player_9 = P.player_api_id OR M.home_player_10 = P.player_api_id      OR M.home_player_11 = P.player_api_id WHERE (strftime('%Y', 'now') - strftime('%Y', P.birthday)) - (strftime('%m-%d', 'now') < strftime('%m-%d', P.birthday)) < 30;	european_football_2
SELECT `Player.player_name` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `Player_Attributes.overall_rating` = (     SELECT MAX(`overall_rating`)     FROM `Player_Attributes` );	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_X1 OR p.player_api_id = m.away_player_X1 WHERE pa.attacking_work_rate = 'high' AND m.goal IS NOT NULL AND (m.home_team_goal > m.away_team_goal OR m.home_team_api_id = m.away_team_api_id) AND m.home_player_X1 IS NOT NULL AND m.away_player_X1 IS NOT NULL GROUP BY p.player_name ORDER BY COUNT(DISTINCT m.id) DESC;	european_football_2
SELECT p.player_name,         (julianday('now') - julianday(p.birthday)) / 365 AS age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY age DESC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT p.player_name, c.name AS country_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE pa.vision > 89;	european_football_2
SELECT      Country.name AS CountryName,      AVG(Player.weight) AS AverageWeight FROM      Player JOIN      Country ON Player.player_fifa_api_id = Country.id GROUP BY      Country.name ORDER BY      AverageWeight DESC LIMIT 1;	european_football_2
SELECT `Team.team_long_name` FROM `Team` JOIN `Team_Attributes` ON `Team.team_api_id` = `Team_Attributes.team_api_id` WHERE `Team_Attributes.buildUpPlaySpeedClass` = 'Slow';	european_football_2
SELECT `Team.team_short_name` FROM `Team` JOIN `Team_Attributes` ON `Team.team_api_id` = `Team_Attributes.team_api_id` WHERE `Team_Attributes.chanceCreationPassingClass` = 'Safe';	european_football_2
SELECT AVG(height) AS average_height FROM Player JOIN Country ON Player.player_fifa_api_id = Country.id WHERE Country.name = 'Italy';	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01';	european_football_2
SELECT     (SELECT `jumping` FROM `Player_Attributes` WHERE `id` = 6) -      (SELECT `jumping` FROM `Player_Attributes` WHERE `id` = 23) AS `jumping_score_difference;	european_football_2
SELECT p.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'right' AND pa.potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') ORDER BY pa.potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM `Player_Attributes` WHERE `crossing` = (SELECT MAX(`crossing`) FROM `Player_Attributes` WHERE `preferred_foot` = 'left') AND `preferred_foot` = 'left';	european_football_2
SELECT     ROUND((COUNT(*) FILTER (WHERE `strength` > 80 AND `stamina` > 80) * 100.0) / COUNT(*), 2) AS percentage_with_strength_and_stamina_above_80 FROM `Player_Attributes`;	european_football_2
SELECT `name`  FROM `Country`  WHERE `name` = 'Poland';	european_football_2
SELECT home_team_goal, away_team_goal  FROM Match  WHERE date LIKE '2008-09-24%' AND league_name = 'Belgium Jupiler League';	european_football_2
SELECT      pa.sprint_speed,      pa.agility,      pa.acceleration FROM      Player_Attributes pa JOIN      Player p ON pa.player_api_id = p.player_api_id WHERE      p.player_name = 'Alexis Blin';	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_fifa_api_id` = (SELECT `team_fifa_api_id` FROM `Team` WHERE `team_long_name` = 'KSV Cercle Brugge')	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A');	european_football_2
SELECT MAX(home_team_goal) as highest_home_score FROM Match WHERE league_id = 7809;	european_football_2
SELECT `finishing`, `curve` FROM `Player_Attributes` WHERE `weight` = (SELECT MAX(`weight`) FROM `Player`)	european_football_2
SELECT `League.name`, COUNT(`Match.id`) AS `total_games` FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` WHERE `Match.season` = '2015/2016' GROUP BY `League.name` ORDER BY `total_games` DESC LIMIT 4;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT     (COUNT(CASE WHEN `height` < 180 AND `overall_rating` > 70 THEN 1 END) * 100.0) / COUNT(`id`) AS percentage_of_under_180_strong_players FROM `Player_Attributes`;	european_football_2
SELECT     CASE         WHEN SUM(CASE WHEN p.SEX = 'M' AND e.Admission = '+' THEN 1 ELSE 0 END) >              SUM(CASE WHEN p.SEX = 'M' AND e.Admission = '-' THEN 1 ELSE 0 END)         THEN 'In-patient'         ELSE 'Outpatient'     END AS MostCommonAdmission,     ROUND(         (             SUM(CASE WHEN p.SEX = 'M' AND e.Admission = '+' THEN 1 ELSE 0 END) -             SUM(CASE WHEN p.SEX = 'M' AND e.Admission = '-' THEN 1 ELSE 0 END)         ) /         SUM(CASE WHEN p.SEX = 'M' THEN 1 ELSE 0 END) * 100,         2     ) AS PercentageDeviation FROM     Patient p JOIN     Examination e ON p.ID = e.ID WHERE     p.SEX = 'M';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Patient`.`Birthday` > '1930' THEN `Patient`.`ID` END) * 100.0) / COUNT(`Patient`.`ID`) AS Percentage_Female_Born_After_1930 FROM      `Patient` WHERE      `Patient`.`SEX` = 'F';	thrombosis_prediction
SELECT      ROUND((COUNT(CASE WHEN p.Birthday BETWEEN '1930-01-01' AND '1940-12-31' THEN 1 ELSE NULL END) * 100.0) / COUNT(*), 2) AS Inpatient_Percentage FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.Birthday BETWEEN '1930-01-01' AND '1940-12-31'      AND e.Admission = '+';	thrombosis_prediction
SELECT      COUNT(CASE WHEN `Examination.Diagnosis` = 'SLE' AND `Patient.Admission` = '+' THEN `Examination.ID` END) /      COUNT(CASE WHEN `Examination.Diagnosis` = 'SLE' AND `Patient.Admission` = '-' THEN `Examination.ID` END) AS Outpatient_to_Inpatient_Ratio FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Examination.Diagnosis` = 'SLE'	thrombosis_prediction
SELECT p.`Diagnosis` AS Disease, l.`Date` AS Laboratory_Date FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT      P.SEX,      P.Birthday,      E.`Examination Date`,      E.Symptoms FROM      Patient P JOIN      Examination E ON P.ID = E.ID WHERE      P.ID = 163109;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RVVT = '+';	thrombosis_prediction
SELECT      p.ID,      p.SEX,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday BETWEEN '1937-01-01' AND '1937-12-31' AND l.T-CHO >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN P.SEX = 'F' AND L.TP < 6.0 OR L.TP > 8.5 THEN P.ID END) * 100.0) / COUNT(P.ID) AS Percentage_Female_Outside_Normal_TP FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F';	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS avg_aCL_IgG FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'F' AND (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM Patient.Birthday)) >= 50 AND Patient.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND YEAR(p.Description) = 1997 AND e.Admission = '-';	thrombosis_prediction
SELECT      MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS Youngest_Age FROM      Patient WHERE      `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Thrombosis = 1 AND YEAR(Examination.Examination Date) = 1997 AND Patient.SEX = 'F';	thrombosis_prediction
SELECT      MAX(YEAR(P.Birthday)) - MIN(YEAR(P.Birthday)) AS AgeGap FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.TG >= 200 GROUP BY      P.ID ORDER BY      AgeGap DESC LIMIT 1;	thrombosis_prediction
SELECT      p.SEX,      p.Birthday,      e.Symptoms,      e.Diagnosis  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      p.Birthday = (SELECT MIN(Birthday) FROM Patient)      AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT     MONTH(L.Date) AS Month,     COUNT(DISTINCT P.ID) / 12 AS AveragePatients FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     L.Date BETWEEN '1998-01-01' AND '1998-12-31'     AND P.SEX = 'M' GROUP BY     MONTH(L.Date)	thrombosis_prediction
SELECT      L.Date AS LabWorkDate,      P.Birthday AS Birthday,      (YEAR(P.Birthday) - YEAR(L.Date)) AS AgeAtAdmission FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID JOIN      Examination E ON P.ID = E.ID WHERE      E.Diagnosis LIKE '%SJS%' ORDER BY      P.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Patient`.SEX = 'M' AND `Laboratory`.UA <= 8.0 THEN 1 ELSE 0 END) /       SUM(CASE WHEN `Patient`.SEX = 'F' AND `Laboratory`.UA <= 6.5 THEN 1 ELSE 0 END)) AS Male_to_Female_Ratio FROM      `Patient` JOIN      `Laboratory` ON `Patient`.ID = `Laboratory`.ID	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID AND e.Examination_Date > DATE_ADD(p.First_Date, INTERVAL 1 YEAR) WHERE e.ID IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday < '1990-01-01' AND p.Birthday > '1974-12-31' AND e.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.T_BIL >= 2.0;	thrombosis_prediction
SELECT      T1.Diagnosis,      COUNT(T1.Diagnosis) AS Count FROM      Examination AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID WHERE      T1.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY      T1.Diagnosis ORDER BY      Count DESC LIMIT      1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR('1999'), YEAR(`Patient`.`Birthday`))) AS AverageAge FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`Date` BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT      P.Birthday,      E.Diagnosis,      (YEAR(E.Examination_Date) - YEAR(P.Birthday)) AS Age FROM      Examination E JOIN      Patient P ON E.ID = P.ID WHERE      E.HGB = (SELECT MAX(HGB) FROM Examination)	thrombosis_prediction
SELECT `ANA`  FROM `Examination`  WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT      T2.T-CHO AS TotalCholesterol FROM      Examination AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID WHERE      T1.ID = 2927464 AND      T1.`Examination Date` = '1995-09-04' AND      T2.T-CHO < 250;	thrombosis_prediction
SELECT `Patient.SEX`  FROM `Patient`  JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.Diagnosis` LIKE '%AORTITIS%' ORDER BY `Examination.Examination Date` ASC LIMIT 1;	thrombosis_prediction
SELECT aCL_IgM FROM Examination WHERE `Diagnosis` = 'SLE' AND Description = '1994-02-19' AND `Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT `Patient.SEX` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.GPT` = '9' AND `Laboratory.Date` = '1992-06-12' AND `Patient.SEX` IN ('M', 'F');	thrombosis_prediction
SELECT      p.ID,      (YEAR('1991-10-21') - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.Date = '1991-10-21' AND l.UA = '8.4';	thrombosis_prediction
SELECT COUNT(`Laboratory`.`ID`) AS TotalTests FROM `Laboratory` JOIN `Patient` ON `Laboratory`.`ID` = `Patient`.`ID` WHERE `Patient`.`First Date` = '1991-06-13' AND `Patient`.`Diagnosis` = 'SJS' AND `Laboratory`.`Date` BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT p.`Diagnosis` AS OriginalDiagnosis FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE e.`Examination Date` = '1997-01-27' AND p.`First Date` = '1997-01-27' AND e.`Diagnosis` LIKE '%SLE%';	thrombosis_prediction
SELECT e.`Symptoms` FROM `Examination` e JOIN `Patient` p ON e.ID = p.ID WHERE p.`Birthday` = '1959-03-01' AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT     (SUM(CASE WHEN L.Date LIKE '1981-11-%' THEN L.`T-CHO` ELSE 0 END) -      SUM(CASE WHEN L.Date LIKE '1981-12-%' THEN L.`T-CHO` ELSE 0 END)) AS cholesterol_decrease FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     P.Birthday = '1959-02-18'	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis LIKE '%Behcet%' AND e.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT DISTINCT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND `Examination.GPT` > 30 AND `Examination.ALB` < 4;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN (     SELECT ID     FROM Examination     WHERE `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination) ) AS HighIgM ON e.ID = HighIgM.ID WHERE e.Thrombosis = 2 AND e.`ANA Pattern` = 'S';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN T1.UA <= 6.5 THEN 1 END) * 100.0) / COUNT(T1.ID) AS Percentage FROM      Laboratory AS T1 WHERE      T1.U-PRO > 0 AND T1.U-PRO < 30	thrombosis_prediction
SELECT      (SUM(CASE WHEN p.SEX = 'M' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      Patient p WHERE      p.SEX = 'M' AND      YEAR(p.First Date) = 1981 AND      p.Diagnosis LIKE '%BEHCET%'	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.First_Date, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-'    AND l.Date LIKE '1991-10%'   AND l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA IS NOT NULL   AND e.ANA Pattern != 'P'   AND p.SEX = 'F'   AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) AS Average_Blood_Albumin FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'F' AND `Diagnosis` = 'SLE') AND PLT > 400;	thrombosis_prediction
SELECT MAX(Symptoms) as MostCommonSymptom FROM Examination WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT      p.`Birthday`,      pat.`Diagnosis` FROM      `Patient` p JOIN      `Examination` ex ON p.`ID` = ex.`ID` JOIN      (SELECT           MIN(`Examination Date`) AS earliest_exam_date      FROM           `Examination`      WHERE           `ID` = 48473) AS earliest_exam ON      ex.`Examination Date` = earliest_exam.earliest_exam_date WHERE      p.`ID` = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'F' AND Examination.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE YEAR(e.Examination Date) = 1997 AND e.TP > 6 AND e.TP < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Symptoms` LIKE '%ITP%' THEN 1 ELSE 0 END) / SUM(CASE WHEN `Diagnosis` LIKE '%SLE%' THEN 1 ELSE 0 END)) * 100 AS SLE_Patients_With_Thrombocytopenia_Percentage FROM Examination;	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN YEAR(P.Birthday) = '1980' AND P.Diagnosis = 'RA' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS Percentage_Women FROM      Patient P	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'M' AND Examination.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND Examination.Diagnosis LIKE '%Behcet%' AND Examination.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT      p.ID,      p.First_Date,      e.Examination_Date,     DATEDIFF(e.Examination_Date, p.First_Date) AS Days_Between FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID = 821298;	thrombosis_prediction
SELECT      CASE          WHEN p.SEX = 'M' THEN (l.UA > 8.0)         WHEN p.SEX = 'F' THEN (l.UA > 6.5)         ELSE FALSE     END AS IsUricAcidNormal FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID = 57266;	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ID` = (SELECT `ID` FROM `Patient` WHERE `ID` = 48473) AND `GOT` >= 60;	thrombosis_prediction
SELECT      p.SEX,      p.Birthday  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      l.GOT < 60      AND YEAR(l.Date) = 1994;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC;	thrombosis_prediction
SELECT AVG(`LDH`) AS Average_LDH FROM `Laboratory` WHERE `LDH` < 500;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT      p.ID,      p.Admission,      lab.ALP FROM      Patient p JOIN      Laboratory lab ON p.ID = lab.ID WHERE      lab.ALP < 300;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.TP < 6.0;	thrombosis_prediction
SELECT     p.ID,     p.SEX,     l.TP,     l.TP - 8.5 AS TP_Deviation FROM     Patient p JOIN     Laboratory l ON p.ID = l.ID WHERE     p.SEX = 'F'     AND l.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB <= 3.5 OR l.ALB >= 5.5 GROUP BY p.ID, p.SEX, p.Birthday ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      P.ID,     P.Birthday,     L.ALB,     CASE          WHEN L.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'         ELSE 'Not Within Normal Range'     END AS Albumin_Status FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      YEAR(P.Birthday) = 1982;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Laboratory.UA` > 6.5 THEN 1 END) * 100.0) /      COUNT(`Laboratory.ID`) AS PercentageOfFemaleWithHighUA FROM      `Laboratory` INNER JOIN      `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE      `Patient.SEX` = 'F' AND `Laboratory.UA` > 6.5;	thrombosis_prediction
SELECT AVG(UA) AS Average_UA_Index FROM Laboratory WHERE (UA < 8.0 AND SEX = 'M') OR (UA < 6.5 AND SEX = 'F') AND ID IN (     SELECT ID     FROM Laboratory     WHERE UA < 8.0 AND SEX = 'M'        OR UA < 6.5 AND SEX = 'F'     GROUP BY ID     ORDER BY MAX(Date) DESC ) LIMIT 1;	thrombosis_prediction
SELECT `Patient`.`ID`, `Patient`.`SEX`, `Patient`.`Birthday` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`UN` = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'RA' AND e.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5;	thrombosis_prediction
SELECT     SUM(CASE WHEN `SEX` = 'M' THEN 1 ELSE 0 END) AS MaleCount,     SUM(CASE WHEN `SEX` = 'F' THEN 1 ELSE 0 END) AS FemaleCount FROM     `Patient` WHERE     `CRE` >= 1.5;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday,      l.T_BIL FROM      Laboratory l JOIN      Patient p ON l.ID = p.ID WHERE      l.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory)	thrombosis_prediction
SELECT      p.SEX,      GROUP_CONCAT(DISTINCT e.ID) AS PatientIDs FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.T_BIL >= 2.0 GROUP BY      p.SEX;	thrombosis_prediction
SELECT p.ID, l.T-CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.T-CHO = (SELECT MAX(T-CHO) FROM Laboratory)	thrombosis_prediction
SELECT AVG(TIMESTAMPDIFF(YEAR, `Birthday`, CURDATE())) AS average_age FROM `Patient` WHERE `SEX` = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT      p.ID,      p.Diagnosis  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      l.TG > 300;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT `Patient.ID` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.CPK` < 250 AND `Patient.Admission` = '-';	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND EXTRACT(YEAR FROM P.Birthday) BETWEEN 1936 AND 1956 AND L.CPK >= 250;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      EXTRACT(YEAR FROM age(CURRENT_DATE, p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID IN (         SELECT              ID          FROM              Laboratory          WHERE              GLU >= 180 AND T-CHO < 250     );	thrombosis_prediction
SELECT      p.ID,      l.GLU  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      p.Description = '1991-01-01'      AND l.GLU < 180;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY p.SEX, p.Birthday ORDER BY p.SEX, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) ASC;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RBC < 3.5;	thrombosis_prediction
SELECT      P.ID,      P.SEX,      P.Birthday,      P.Admission FROM      Patient P WHERE      P.SEX = 'F' AND      (YEAR(CURRENT_DATE) - YEAR(P.Birthday)) >= 50 AND      EXISTS (         SELECT 1         FROM Laboratory L         WHERE L.ID = P.ID AND                (L.RBC <= 3.5 OR L.RBC >= 6.0)     )	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '-' AND e.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.HGB > 10 AND e.HGB < 17 ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.HCT >= 52 GROUP BY      p.ID HAVING      COUNT(l.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) as AverageHematocritLevel FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT   (SUM(CASE WHEN L.PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN L.PLT > 400 THEN 1 ELSE 0 END)) AS AbnormalPLTComparison FROM   Laboratory AS L WHERE   L.PLT < 100 OR L.PLT > 400;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1984 AND p.Birthday IS NOT NULL AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) < 50 AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN `Examination`.`SEX` = 'F' THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN `Examination`.`PT` >= 14 THEN 1 ELSE 0 END), 2) AS percentage_female_abnormal_PT FROM      `Examination` JOIN      `Patient` ON `Examination`.`ID` = `Patient`.`ID` WHERE      (YEAR(CURRENT_DATE) - YEAR(`Patient`.`Birthday`)) > 55     AND `Examination`.`PT` >= 14;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Description, p.First_Date, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.First_Date > '1992-01-01' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.APTT > 45 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.WBC > 3.5 AND e.WBC < 9.0 AND e.FG <= 150 OR e.FG >= 450;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday > '1980-01-01' AND l.FG < 150 OR l.FG > 450;	thrombosis_prediction
SELECT DISTINCT p.ID, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`U-PRO` >= 30;	thrombosis_prediction
SELECT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.Diagnosis` = 'SLE' AND `Laboratory.U-PRO` BETWEEN 0 AND 30;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e WHERE e.aCL_IgG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` > 900 AND `aCL IgG` < 2000 AND `Symptoms` IS NOT NULL;	thrombosis_prediction
SELECT p.`Diagnosis` FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE e.`aCL IgA` BETWEEN 80 AND 500 AND e.`aCL IgA` = (SELECT MAX(`aCL IgA`)                    FROM `Examination`                    WHERE `aCL IgA` BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgA` IS NOT NULL AND `aCL IgA` > 80 AND `aCL IgA` < 500 AND YEAR(`First Date`) >= 1990;	thrombosis_prediction
SELECT      MAX(COUNT(Diagnosis)) AS most_common_diagnosis FROM      Examination WHERE      (`aCL IgM` <= 40 OR `aCL IgM` >= 400) GROUP BY      Diagnosis ORDER BY      most_common_diagnosis DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.Description IS NULL AND e.CRP = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.CRE >= 1.5  AND SUBDATE(CURDATE(), INTERVAL 70 YEAR) > Patient.Birthday;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.RA IN('-', '+-') AND e.KCT = '+';	thrombosis_prediction
SELECT p.ID, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday > '1985-01-01' AND e.RA IN('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.SEX = 'F' AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 60 AND EXISTS (     SELECT 1     FROM Laboratory l     WHERE l.ID = p.ID     AND l.RF IS NOT NULL     AND l.RF < 20 );	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.RF IS NOT NULL AND e.RF < 20 AND e.Thrombosis = '0';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA = 256 AND e.ANA_Pattern = 'P' AND e.C3 > 35;	thrombosis_prediction
SELECT      p.ID  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      p.ID IN (         SELECT              e.ID          FROM              Examination e          WHERE              e.aCL_IgA IS NOT NULL AND NOT (29 < e.aCL_IgA AND e.aCL_IgA < 52)     )  ORDER BY      e.aCL_IgA DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Thrombosis = 1 AND e.C4 > 10;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RNP IN ('-', '+-') AND P.Admission = '+';	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN('-', '+-') ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE SM IN('-', '+-') AND Thrombosis = 0;	thrombosis_prediction
SELECT      p.ID  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      l.SM NOT IN ('negative', '0')  ORDER BY      p.Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`Examination Date` > '1997-01-01' AND E.`SC170` IN('negative', '0');	thrombosis_prediction
SELECT DISTINCT COUNT(P.ID) AS FemalePatientsWithoutSymptoms FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F' AND E.SEX = 'negative' AND E.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.SSA IN ('-', '+') AND YEAR(p.FirstDate) < 2000;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSA NOT IN ('negative', '0') ORDER BY p.FirstDate LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`ANA` = 256 AND e.`ANA Pattern` LIKE '%S%' AND e.`Diagnosis` = 'SLE' AND e.`SSB` IN('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.CENTROMEA IN('-', '+-') AND e.SSB IN('-', '+-');	thrombosis_prediction
SELECT      p.ID,      e.Diagnosis  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.DNA < 8 AND Patient.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`IGG` BETWEEN 900 AND 2000 AND p.`Admission` = '+';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN E.GOT >= 60 THEN P.ID END) * 1.0) / COUNT(CASE WHEN E.GOT >= 60 THEN 1 END) AS percentage FROM      Examination E JOIN      Patient P ON E.ID = P.ID WHERE      E.GOT >= 60 AND E.Diagnosis LIKE '%SLE%';	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GOT >= 60 ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT < 60 GROUP BY P.ID, P.Birthday ORDER BY L.GPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND P.SEX = 'M';	thrombosis_prediction
SELECT p.ID, MIN(l.Date) AS FirstRecordedDate FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.LDH < 500 GROUP BY p.ID ORDER BY MIN(l.LDH) DESC, MIN(l.Date) LIMIT 1;	thrombosis_prediction
SELECT MAX(`Date`) AS LatestDate FROM `Laboratory` WHERE `LDH` >= 500 AND `ID` IN (SELECT `ID` FROM `Patient` ORDER BY `First Date` DESC LIMIT 1);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.ALP >= 300 AND p.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`)  FROM `Patient`  JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID`  WHERE `Patient.Admission` = '-' AND `Laboratory.ALP` < 300;	thrombosis_prediction
SELECT DISTINCT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5;	thrombosis_prediction
SELECT `Examination.Date` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Examination.ALB` = (SELECT MAX(`ALB`) FROM `Examination` WHERE `ALB` > 3.5 AND `ALB` < 5.5)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB BETWEEN 3.5 AND 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT      E.aCL_IgG,      E.aCL_IgM,      E.aCL_IgA FROM      Examination E JOIN      Patient P ON E.ID = P.ID WHERE      P.SEX = 'F'      AND E.UA > 6.50      AND E.UA <= 8.50     AND P.ID = (         SELECT              P2.ID         FROM              Patient P2         JOIN              Examination E2 ON P2.ID = E2.ID         WHERE              P2.SEX = 'F'              AND E2.UA > 6.50              AND E2.UA <= 8.50         ORDER BY              E2.UA DESC         LIMIT 1     );	thrombosis_prediction
SELECT MAX(`aCL IgG`) AS HighestAnaLevel FROM `Examination` WHERE `CRE` < 1.5 AND `ANA` IS NOT NULL AND `ID` IN (SELECT `ID` FROM `Patient`);	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE < 1.5 AND l.IGA = (SELECT MAX(IGA) FROM Laboratory WHERE ID = p.ID);	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `T-BIL` >= 2.0 AND `ANA Pattern` LIKE '%P%' AND `ID` IN (SELECT `ID` FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID);	thrombosis_prediction
SELECT `Examination.aCL IgG`, `Examination.aCL IgM`, `Examination.ANA` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Examination.T-BIL` < 2.0 AND `Patient.ID` = (     SELECT `Patient.ID`     FROM `Patient`     JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID`     WHERE `Laboratory.T-BIL` < 2.0     ORDER BY `Laboratory.T-BIL` DESC     LIMIT 1 );	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.T-CHO >= 250 AND Examination.KCT = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-CHO` < 250 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.`Diagnosis` FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.ID WHERE l.TG < 200 GROUP BY p.`Diagnosis` ORDER BY MAX(l.TG) DESC LIMIT 1;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 0 AND e.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.GLU > 180;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE L.GLU < 180 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Admission = '+' AND e.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '-' AND (     (e.RBC <= 3.5 OR e.RBC >= 6.0) );	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.PLT > 100 AND e.PLT < 400 AND e.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, e.`PLT` FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'MCTD' AND e.PLT > 100 AND e.PLT < 400;	thrombosis_prediction
SELECT AVG(`PT`) AS AveragePT FROM `Laboratory` WHERE `Patient_ID` IN (     SELECT `ID`     FROM `Patient`     WHERE `SEX` = 'M' ) AND `PT` < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis IN (2, 1) AND PT < 14;	thrombosis_prediction
SELECT m.major_name FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Angela' AND m.last_name = 'Sanders';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design';	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS attending_students FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*) FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT e.event_name, COUNT(a.link_to_event) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT m.link_to_major, m.first_name, m.last_name, m.position, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT e.event_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(e.event_date) = 2019 AND e.event_name LIKE '%Student_Club%';	student_club
SELECT COUNT(*) AS Meeting_Count FROM event WHERE type = 'Meeting' AND event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 10 );	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 20 ) AND type != 'Fundraiser';	student_club
SELECT AVG(COUNT(a.event_id)) / COUNT(DISTINCT e.event_name) AS average_attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT expense_description, MAX(cost) AS max_cost FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE type = 'Club Event')) GROUP BY expense_description ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT `last_name` FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `major.major_name` = 'Law and Constitutional Studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT m.major_name, m.college  FROM major m  JOIN member mbr ON m.major_id = mbr.link_to_major  WHERE mbr.first_name = 'Tyler' AND mbr.last_name = 'Hewitt';	student_club
SELECT SUM(i.amount) AS total_funds_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_food_spent FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM `member` WHERE `zip` IN (     SELECT `zip_code`     FROM `zip_code`     WHERE `state` = 'Illinois' );	student_club
SELECT SUM(b.spent) AS total_spent_on_advertisement FROM `budget` b JOIN `event` e ON b.`link_to_event` = e.`event_id` WHERE e.`event_name` = 'September Meeting' AND b.`category` = 'Advertisement';	student_club
SELECT m.major_name, m.department FROM major m JOIN member mbr ON m.major_id = mbr.link_to_major WHERE mbr.first_name = 'Pierce' OR mbr.last_name = 'Guidi';	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker';	student_club
SELECT expense_id, expense_description, approved FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND event.event_date = '2019-10-08' AND expense.approved = 'true';	student_club
SELECT SUM(e.cost) / COUNT(e.cost) AS average_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE CONCAT(m.first_name, ' ', m.last_name) = 'Elijah Allen' AND SUBSTR(e.expense_date, 6, 2) IN ('09', '10');	student_club
SELECT      (SUM(CASE WHEN LEFT(event_date, 4) = '2019' THEN spent ELSE 0 END) -       SUM(CASE WHEN LEFT(event_date, 4) = '2020' THEN spent ELSE 0 END)) AS total_spent_difference FROM      event JOIN      budget ON event.event_id = budget.link_to_event WHERE      LEFT(event_date, 4) IN ('2019', '2020');	student_club
SELECT location  FROM event  WHERE event_name = 'Spring Budget Review';	student_club
SELECT cost  FROM expense  WHERE expense_description = 'Posters'  AND expense_date = '2019-09-04';	student_club
SELECT `remaining` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT notes  FROM income  WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM `member` WHERE `first_name` = 'Carlo' AND `last_name` = 'Jacobs';	student_club
SELECT      `member.zip`,      `zip_code.county`  FROM      `member`  JOIN      `zip_code` ON `member.zip` = `zip_code.zip_code`  WHERE      `member.first_name` = 'Adela' AND      `member.last_name` = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM `budget` WHERE `link_to_event` IN (     SELECT `event_id`     FROM `event`     WHERE `event_name` = 'November Meeting' ) AND `remaining` < 0;	student_club
SELECT SUM(b.amount) AS total_budget_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Speaker';	student_club
SELECT e.event_status FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT major.major_name FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `member.first_name` = 'Brent' AND `member.last_name` = 'Thomason';	student_club
SELECT COUNT(*) FROM `member` JOIN `major` ON `member`.`link_to_major` = `major`.`major_id` WHERE `major`.`major_name` = 'Business' AND `member`.`t_shirt_size` = 'Medium';	student_club
SELECT `zip_code`.type FROM `member` JOIN `zip_code` ON `member`.zip = `zip_code`.zip_code WHERE `member`.first_name = 'Christof' AND `member`.last_name = 'Nielson';	student_club
SELECT m.link_to_major, m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT m.link_to_major, m.first_name, m.last_name, ma.major_name, ma.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT date_received  FROM income  WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Connor' AND last_name = 'Hilton')  AND source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /       SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS ad_budget_ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement'     AND e.event_name IN ('Yearly Kickoff', 'October Meeting');	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /      (SUM(b.amount) OVER (PARTITION BY e.event_name WHERE e.event_name = 'November Speaker'))) * 100 AS parking_budget_percentage FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'November Speaker';	student_club
SELECT SUM(cost) AS total_pizza_cost FROM `expense` WHERE `expense_description` = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT expense.expense_description, budget.remaining FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.remaining = (SELECT MIN(remaining) FROM budget)	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT `major`.`college`, COUNT(`member`.`link_to_major`) AS `member_count` FROM `member` JOIN `major` ON `member`.`link_to_major` = `major`.`major_id` GROUP BY `major`.`college` ORDER BY `member_count` DESC LIMIT 1;	student_club
SELECT m.link_to_major FROM member m WHERE m.phone = '809-555-3360';	student_club
SELECT `event_name`, MAX(`amount`) AS highest_budget FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` GROUP BY `event_name` ORDER BY highest_budget DESC LIMIT 1;	student_club
SELECT expense.expense_description, expense.expense_date, expense.cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT `attendance.link_to_member`)  FROM `event` JOIN `attendance` ON `event.event_id` = `attendance.link_to_event` WHERE `event.event_name` = 'Women''s Soccer';	student_club
SELECT `date_received` FROM `income` WHERE `link_to_member` = 'rec3pH4DxMcWHMRB7';	student_club
SELECT COUNT(*) FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland');	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT      `event_id`,      `event_name`,      MAX(DIVIDE(`spent`, `amount`)) AS spend_to_budget_ratio FROM      `event` JOIN      `budget` ON `event`.`event_id` = `budget`.`link_to_event` WHERE      `event`.`status` = 'Closed' AND `budget`.`spent` IS NOT NULL AND `budget`.`amount` IS NOT NULL GROUP BY      `event_id`, `event_name` ORDER BY      spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget WHERE event_status = 'Closed';	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent) AS total_spent_on_food FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT first_name, last_name FROM member WHERE zip IN (     SELECT zip_code     FROM zip_code     WHERE city = 'Georgetown' AND state = 'South Carolina' ) AND link_to_major IS NOT NULL;	student_club
SELECT SUM(`amount`) AS total_income FROM `income` JOIN `member` ON `income`.`link_to_member` = `member`.`member_id` WHERE `member`.`first_name` = 'Grant' AND `member`.`last_name` = 'Gilmour';	student_club
SELECT      m.first_name,      m.last_name,      i.amount  FROM      member m  JOIN      income i ON m.member_id = i.link_to_member  WHERE      i.amount > 40;	student_club
SELECT SUM(cost) AS TotalExpense FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS highest_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id ORDER BY highest_income DESC LIMIT 1;	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.amount IS NOT NULL ORDER BY budget.amount ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.cost ELSE 0 END) /       SUM(b.cost)) * 100 AS percentage_of_total_cost FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      e.event_name = 'Yearly Kickoff';	student_club
SELECT      (SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END), 0)) AS finance_to_physics_ratio FROM      member m JOIN      major ma ON m.link_to_major = ma.major_id WHERE      ma.major_name = 'Finance' OR ma.major_name = 'Physics';	student_club
SELECT source, SUM(amount) as total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM `member` WHERE position = 'Secretary';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*) AS number_of_events_attended, m.major_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi';	student_club
SELECT AVG(spent) / COUNT(spent) AS average_spent_per_event FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT `event_name` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.category` = 'Advertisement' ORDER BY `budget.spent` DESC LIMIT 1;	student_club
SELECT      m.first_name,      m.last_name,      e.event_name  FROM      `member` m  JOIN      `attendance` a ON m.member_id = a.link_to_member  JOIN      `event` e ON a.link_to_event = e.event_id  WHERE      m.first_name = 'Maya'      AND m.last_name = 'Mclean'      AND e.event_name = 'Women''s Soccer';	student_club
SELECT      ROUND((SUM(CASE WHEN e.event_date BETWEEN '2019-01-01' AND '2019-12-31' AND e.type = 'Community Service' THEN 1 ELSE 0 END) /             COUNT(e.event_id)) * 100, 2) AS community_service_percentage FROM      event e;	student_club
SELECT SUM(e.cost) AS total_poster_cost FROM expense e JOIN event ev ON e.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Speaker')) WHERE e.expense_description = 'Posters';	student_club
SELECT `t_shirt_size`, COUNT(`t_shirt_size`) AS size_count FROM `member` GROUP BY `t_shirt_size` ORDER BY size_count DESC LIMIT 1;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT      e.event_name,      e.type,      SUM(e.cost) AS total_value FROM      event e JOIN      expense ex ON e.event_id = ex.link_to_budget WHERE      e.event_name = 'October Meeting'     AND e.type = 'Meeting' GROUP BY      e.event_name, e.type;	student_club
SELECT      `category`,      SUM(`amount`) AS total_budgeted FROM      `budget` WHERE      `link_to_event` IN (         SELECT              `event_id`         FROM              `event`         WHERE              `event_name` = 'April Speaker'     ) GROUP BY      `category` ORDER BY      total_budgeted ASC;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Advertisement' ORDER BY `amount` DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_cost_spent_parking FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense_on_082019 FROM `expense` WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50 JOIN zip_code z ON m.zip = z.zip_code;	student_club
SELECT major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT position FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium';	student_club
SELECT `event_name`, `type`, `remaining` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.remaining` > 30;	student_club
SELECT `event_name`, `type` FROM `event` WHERE `location` = 'MU 215';	student_club
SELECT `type` FROM `event` WHERE `event_date` = '2020-03-24T12:00:00';	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0) / COUNT(m.member_id) AS percentage_business_members FROM      `member` m JOIN      `major` ma ON m.link_to_major = ma.major_id	student_club
SELECT `type` FROM `event` WHERE `location` = 'MU 215';	student_club
SELECT COUNT(*)  FROM income  WHERE amount = 50;	student_club
SELECT COUNT(*) FROM `member` WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT `budget.category` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `event.location` = 'MU 215' AND `event.type` = 'Guest Speaker' AND `budget.spent` = 0;	student_club
SELECT m.zip.city, m.zip.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN member m ON e.location = '900 E. Washington St.' JOIN attendance a ON e.event_id = a.link_to_event JOIN member mem ON a.link_to_member = mem.member_id WHERE mem.position = 'Vice President' AND e.type = 'Social';	student_club
SELECT m.last_name, m.position  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      (SELECT COUNT(*)       FROM `income`       WHERE `amount` = 50 AND `link_to_member` IN       (SELECT `member_id`        FROM `member`        WHERE `t_shirt_size` = 'Medium' AND `position` = 'Member')) /      (SELECT COUNT(DISTINCT `member_id`)       FROM `member`       WHERE `t_shirt_size` = 'Medium' AND `position` = 'Member') * 100 AS percentage	student_club
SELECT DISTINCT zc.state FROM zip_code zc WHERE zc.type = 'PO Box';	student_club
SELECT DISTINCT zc.zip_code FROM zip_code zc JOIN member m ON zc.zip = m.zip WHERE zc.state = 'Puerto Rico' AND zc.city = 'San Juan Municipio' AND zc.type = 'PO Box';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.event_id FROM event e JOIN expense ex ON e.event_id = ex.link_to_event JOIN member m ON ex.link_to_member = m.member_id WHERE ex.cost > 50 GROUP BY e.event_id;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_name, e.event_id FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19' AND EXISTS (     SELECT 1     FROM attendance a     WHERE a.link_to_member = m.member_id );	student_club
SELECT m.link_to_major FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 20 AND e.expense_date BETWEEN '2019-09-10' AND '2019-11-19';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Education' AND ma.college = 'College of Education & Human Services' AND m.position = 'Member';	student_club
SELECT      ROUND(DIVIDE(SUM(CASE WHEN `budget`.remaining < 0 THEN 1 ELSE 0 END), COUNT(`event`.event_id)) * 100, 2) AS percentage_over_budget FROM      `event` JOIN      `budget` ON `event`.event_id = `budget`.link_to_event	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, expense_description, expense_date, cost FROM expense WHERE cost / COUNT(expense_id) > 50;	student_club
SELECT first_name, last_name FROM `member` WHERE `t_shirt_size` = 'X-Large';	student_club
SELECT      (SUM(CASE WHEN `type` = 'PO Box' THEN 1 ELSE 0 END) * 100.0) / COUNT(`zip_code`) AS po_box_percentage FROM `zip_code`;	student_club
SELECT event_name, location  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget JOIN budget b ON ex.link_to_budget = b.budget_id WHERE ex.expense_description = 'Pizza' AND b.spent > 50 AND b.spent < 100;	student_club
SELECT      m.first_name,      m.last_name,      ma.major_name FROM      member m JOIN      expense e ON m.member_id = e.link_to_member JOIN      major ma ON m.link_to_major = ma.major_id WHERE      e.cost > 100;	student_club
SELECT z.city, z.state FROM event e JOIN income i ON e.event_id = i.link_to_member JOIN zip_code z ON e.location = z.city GROUP BY e.event_id HAVING COUNT(i.income_id) > 40;	student_club
SELECT      m.member_id,      m.first_name,      m.last_name,      SUM(e.cost) AS total_expense FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      (SELECT COUNT(DISTINCT e2.event_id)       FROM expense e2       WHERE e2.link_to_member = m.member_id) > 1 GROUP BY      m.member_id,      m.first_name,      m.last_name ORDER BY      total_expense DESC LIMIT 1;	student_club
SELECT AVG(i.amount) AS average_amount_paid FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position <> 'Member'	student_club
SELECT event_name FROM event JOIN expense ON event.event_id = expense.link_to_event WHERE expense.expense_description = 'Parking' GROUP BY event.event_id, event.event_name HAVING SUM(expense.cost) < (SELECT SUM(cost) / COUNT(event_id) FROM expense WHERE expense_description = 'Parking')	student_club
SELECT      ROUND((SUM(CASE WHEN e.type = 'Meeting' THEN e.cost ELSE 0 END) / SUM(e.cost)) * 100, 2) AS meeting_cost_percentage FROM      event e;	student_club
SELECT `link_to_budget`, SUM(`cost`) AS total_cost FROM `expense` WHERE `expense_description` = 'Water, chips, cookies' GROUP BY `link_to_budget` ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      (SUM(CASE WHEN `state` = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(`position` = 'Member')) -      (SUM(CASE WHEN `state` = 'Vermont' THEN 1 ELSE 0 END) / COUNT(`position` = 'Member')) AS percentage_difference FROM `member` WHERE `position` = 'Member';	student_club
SELECT m.major_name, m.department  FROM `member` m  JOIN `major` ma ON m.link_to_major = ma.major_id  WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies' GROUP BY m.member_id;	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT budget.category, budget.amount FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_name = 'Officers meeting - January';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT `category` FROM `expense` WHERE `expense_description` = 'Posters';	student_club
SELECT m.first_name, m.last_name, m.position, ma.college FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT `city` FROM `zip_code` JOIN `member` ON `zip_code.zip_code` = `member.zip` WHERE `member.first_name` = 'Garrett' AND `member.last_name` = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.city = 'Lincolnton' AND zc.state = 'North Carolina' AND zc.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN c.Currency = 'CZK' THEN 1 END)) AS EUR_to_CZK_Ratio FROM      customers c;	debit_card_specializing
SELECT CustomerID, MIN(Consumption) AS MinConsumption FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'LAM' ) AND Date BETWEEN '201201' AND '201212' GROUP BY CustomerID ORDER BY MinConsumption LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount * t.Price) AS TotalConsumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date BETWEEN '201101' AND '201112' AND c.Currency = 'CZK' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' AND ym.Consumption < 30000 AND ym.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT      (SELECT SUM(Consumption)       FROM yearmonth       WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK' AND Date BETWEEN '201201' AND '201212')     ) -      (SELECT SUM(Consumption)       FROM yearmonth       WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR' AND Date BETWEEN '201201' AND '201212')     ) AS DifferenceInConsumption	debit_card_specializing
SELECT      YEAR(`Date`) AS Year,      SUM(`Consumption`) AS TotalConsumption FROM      `yearmonth` WHERE      `Currency` = 'EUR' GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) as TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT      SUBSTR(Date, 1, 4) AS Year,      SUM(Consumption) AS TotalConsumption FROM      yearmonth WHERE      Country = 'CZE' GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date, Consumption FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'SME' ) AND Date BETWEEN '201301' AND '201312' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
WITH SegmentLowestConsumption AS (     SELECT          Segment,          MIN(Consumption) AS MinConsumption     FROM yearmonth     WHERE Date BETWEEN '201301' AND '201312'     GROUP BY Segment ), SegmentAnnualAverage AS (     SELECT          ym.Segment,          (SUM(ym.Consumption) / slc.MinConsumption) AS AnnualAverage     FROM yearmonth ym     INNER JOIN SegmentLowestConsumption slc ON ym.Segment = slc.Segment     WHERE ym.Date BETWEEN '201301' AND '201312'     GROUP BY ym.Segment ), SegmentAverageDifference AS (     SELECT          'SME vs LAM' AS DifferenceType,          COALESCE(saa.AnnualAverage_SME, 0) - COALESCE(saa.AnnualAverage_LAM, 0) AS Difference     FROM SegmentAnnualAverage saa     LEFT JOIN (SELECT 'SME' AS Segment, AnnualAverage AS AnnualAverage_SME FROM SegmentAnnualAverage WHERE Segment = 'SME') AS sme ON 1=1     LEFT JOIN (SELECT 'LAM' AS Segment, AnnualAverage AS AnnualAverage_LAM FROM SegmentAnnualAverage WHERE Segment = 'LAM') AS lam ON 1=1     UNION ALL     SELECT          'LAM vs KAM' AS DifferenceType,          COALESCE(saa.AnnualAverage_LAM, 0) - COALESCE(saa.AnnualAverage_KAM, 0) AS Difference     FROM SegmentAnnualAverage saa     LEFT JOIN (SELECT 'LAM' AS Segment, AnnualAverage AS AnnualAverage_LAM FROM SegmentAnnualAverage WHERE Segment = 'LAM') AS lam ON 1=1     LEFT JOIN (SELECT 'KAM' AS Segment, AnnualAverage AS AnnualAverage_KAM FROM SegmentAnnualAverage WHERE Segment = 'KAM') AS kam ON 1=1     UNION ALL     SELECT          'KAM vs SME' AS DifferenceType,          COALESCE(saa.AnnualAverage_KAM, 0) - COALESCE(saa.AnnualAverage_SME, 0) AS Difference     FROM SegmentAnnualAverage saa     LEFT JOIN (SELECT 'KAM' AS Segment, AnnualAverage AS AnnualAverage_KAM FROM SegmentAnnualAverage WHERE Segment = 'KAM') AS	debit_card_specializing
WITH ConsumptionByCustomerSegment AS (     SELECT         c.Segment,         ym1.Consumption AS Consumption2012,         ym2.Consumption AS Consumption2013,         (ym2.Consumption - ym1.Consumption) AS Increase,         (ym2.Consumption - ym1.Consumption) / ym2.Consumption * 100 AS PercentageIncrease     FROM         yearmonth ym1     JOIN yearmonth ym2 ON ym1.CustomerID = ym2.CustomerID AND LEFT(ym2.Date, 4) = '2013'     JOIN customers c ON ym1.CustomerID = c.CustomerID     WHERE         LEFT(ym1.Date, 4) = '2012' ), SegmentStats AS (     SELECT         Segment,         MAX(PercentageIncrease) AS MaxPercentageIncrease,         MIN(PercentageIncrease) AS MinPercentageIncrease     FROM         ConsumptionByCustomerSegment     GROUP BY         Segment ) SELECT     c.Segment,     c.MaxPercentageIncrease,     c.MinPercentageIncrease FROM     SegmentStats c JOIN customers cu ON c.Segment = cu.Segment WHERE     c.MaxPercentageIncrease = (         SELECT MAX(MaxPercentageIncrease)         FROM SegmentStats     )     OR c.MinPercentageIncrease = (         SELECT MIN(MinPercentageIncrease)         FROM SegmentStats     );	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `CustomerID` = 6 AND LEFT(`Date`, 6) BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'CZE' AND Segment = 'Discount') -      (SELECT COUNT(*)       FROM gasstations       WHERE Country = 'SVK' AND Segment = 'Discount') AS Difference	debit_card_specializing
SELECT      (SUM(CASE WHEN ym.CustomerID = 7 THEN ym.Consumption ELSE 0 END) -       SUM(CASE WHEN ym.CustomerID = 5 THEN ym.Consumption ELSE 0 END)) AS ConsumptionDifference FROM      yearmonth AS ym WHERE      ym.Date = '201304';	debit_card_specializing
SELECT     (SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN t.Amount ELSE 0 END)      FROM transactions_1k t      JOIN customers c ON t.CustomerID = c.CustomerID      WHERE c.Segment = 'SME') -     (SELECT SUM(CASE WHEN c.Currency = 'EUR' THEN t.Amount ELSE 0 END)      FROM transactions_1k t      JOIN customers c ON t.CustomerID = c.CustomerID      WHERE c.Segment = 'SME') AS CZK_EUR_difference	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND Date = '201305';	debit_card_specializing
SELECT      (COUNT(CASE WHEN ym.Consumption > 46.73 THEN 1 END) * 100.0) / COUNT(*) AS Percentage FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Segment = 'LAM';	debit_card_specializing
SELECT g.Country, COUNT(*) AS TotalValueForMoneyGasStations FROM gasstations g WHERE g.Segment = 'Value for money' GROUP BY g.Country ORDER BY TotalValueForMoneyGasStations DESC LIMIT 1;	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0) / COUNT(*) AS PercentageOfKAMCustomersUsingEUR FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      c.Segment = 'KAM'	debit_card_specializing
SELECT     ROUND((COUNT(*) * 100.0) / SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END), 2) AS Percentage FROM     yearmonth WHERE     Date = '201202';	debit_card_specializing
SELECT      (COUNT(CASE WHEN `GasStationID` IN (SELECT `GasStationID` FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Premium') THEN 1 END) * 100.0)      / COUNT(`GasStationID`) AS PremiumGasStationPercentage FROM `gasstations` WHERE `Country` = 'CZE';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(ym.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'SME' AND ym.Date = '201206' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(`Consumption`) AS `HighestMonthlyConsumption` FROM `yearmonth` WHERE LEFT(`Date`, 6) = '201201';	debit_card_specializing
SELECT CustomerID, MAX(Consumption) as MaxMonthlyConsumption FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Currency = 'EUR' ) GROUP BY CustomerID ORDER BY MaxMonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN yearmonth y ON t.CustomerID = y.CustomerID JOIN products p ON t.ProductID = p.ProductID WHERE LEFT(y.Date, 6) = '201309';	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date LIKE '201306';	debit_card_specializing
SELECT DISTINCT g.`ChainID` FROM `gasstations` g JOIN `transactions_1k` t ON g.`GasStationID` = t.`GasStationID` JOIN `customers` c ON t.`CustomerID` = c.`CustomerID` WHERE c.`Currency` = 'EUR' AND g.`ChainID` IS NOT NULL;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(`Price` * `Amount`) AS `AverageTotalPrice` FROM `transactions_1k` WHERE `Date` LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.Description  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(TotalPrice) AS AverageTotalPrice FROM (     SELECT t1.Amount * t1.Price AS TotalPrice     FROM `transactions_1k` t1     JOIN `gasstations` t2 ON t1.GasStationID = t2.GasStationID     WHERE t2.Country = 'CZE' ) AS SubQuery;	debit_card_specializing
SELECT AVG(t.Amount * t.Price) AS AverageTotalPrice FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT      ym.CustomerID,      SUM(ym.Consumption) AS TotalPaid FROM      yearmonth ym WHERE      ym.Date = '2012-08-25' GROUP BY      ym.CustomerID ORDER BY      TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-23' AND ym.Consumption IS NOT NULL;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Price * Amount = 672.64;	debit_card_specializing
SELECT Segment FROM customers ORDER BY CustomerID LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k AS t1 JOIN gasstations AS g ON t1.GasStationID = g.GasStationID WHERE t1.Date = '2012-08-24' AND t1.Time = '12:42:00';	debit_card_specializing
SELECT T1.ProductID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00';	debit_card_specializing
SELECT      ym.Consumption,      ym.Date FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      t.Price = 124.05 AND      SUBSTR(ym.Date, 1, 6) = '201201' AND      t.Date = '2012-08-24';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Date = '2012-08-26' AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306' AND SUM(ym.Consumption) = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Segment  FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-24' AND ym.Consumption = 548.4;	debit_card_specializing
SELECT      (COUNT(*) FILTER (WHERE c.Currency = 'EUR') * 100.0) / COUNT(*) FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      ym.Date = '2012-08-25';	debit_card_specializing
SELECT      (a.Consumption_2012 - b.Consumption_2013) / a.Consumption_2012 * 100 AS DecreaseRate FROM (     SELECT          ym1.CustomerID,          ym1.Consumption AS Consumption_2012     FROM          yearmonth ym1     WHERE          ym1.Date BETWEEN '201208' AND '201208' ) a JOIN (     SELECT          ym2.CustomerID,          ym2.Consumption AS Consumption_2013     FROM          yearmonth ym2     WHERE          ym2.Date BETWEEN '201212' AND '201212' ) b ON      a.CustomerID = b.CustomerID WHERE      EXISTS (         SELECT              1         FROM              transactions_1k t         WHERE              t.CustomerID = a.CustomerID AND              t.Date = '2012-08-25' AND              t.Amount * t.Price = 634.8     );	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS TotalRevenue FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS PercentagePremium FROM      transactions_1k t JOIN      gasstations g ON t.GasStationID = g.GasStationID JOIN      customers c ON t.CustomerID = c.CustomerID WHERE      g.Country = 'SVK';	debit_card_specializing
SELECT SUM(t.Amount * t.Price) AS TotalAmountSpent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508;  SELECT Consumption FROM yearmonth WHERE CustomerID = 38508 AND Date = '201201';	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS TotalAmount FROM `transactions_1k` t JOIN `products` p ON t.ProductID = p.ProductID GROUP BY p.ProductID ORDER BY TotalAmount DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,     AVG(t.Price) AS AveragePricePerItem,     c.Currency FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      t.CustomerID ORDER BY      SUM(t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT      ym.CustomerID,      CASE          WHEN ym.Consumption > 29.00 * (t.Price / t.Amount) THEN 'Above Average'         ELSE 'Below Average'     END AS ConsumptionStatus FROM      yearmonth ym JOIN      transactions_1k t ON ym.CustomerID = t.CustomerID WHERE      t.ProductID = 5 AND      SUBSTR(ym.Date, 1, 6) = '201208' AND      t.Price / t.Amount > 29.00;	debit_card_specializing
