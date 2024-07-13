SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestFreeMealRate FROM `frpm` WHERE `Academic Year` = '2014-2015' AND `District Code` = 10017;	california_schools
SELECT `CDSCode`,         `Percent (%) Eligible Free (Ages 5-17)` AS EligibleFreeRate FROM `frpm` WHERE `School Type` = 'Continuation Schools' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT `Zip` FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE `schools.County` = 'Fresno' AND `frpm.`Charter School (Y/N)` = 1;	california_schools
SELECT `schools`.`MailStreet`, `schools`.`MailCity`, `schools`.`MailZip`, `schools`.`MailState` FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `frpm`.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM `frpm` ) AND `schools`.`StatusType` = 'Active';	california_schools
SELECT `schools.Phone` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `frpm.Charter School (Y/N)` = 1 AND `frpm.Charter Funding Type` = 'Directly funded' AND `schools.OpenDate` > '2000-01-01';	california_schools
SELECT COUNT(*) FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrMath > 400 AND s.GSserved = 'F' AND s.StatusType = 'Active';	california_schools
SELECT s.CDSCode, s.NCESSchool, s.StatusType, s.Magnet FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.enroll12 > 500 AND s.Magnet = 1;	california_schools
SELECT s.MailStreet  FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 > 0 ORDER BY ss.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.CDSCode, SUM(satscores.cds_count) AS total_sat_takers FROM schools s JOIN (     SELECT CDSCode, SUM(`FRPM Count (K-12)`) AS frpm_count     FROM frpm     GROUP BY CDSCode     ORDER BY frpm_count DESC     LIMIT 1 ) frpm_highest ON s.CDSCode = frpm_highest.CDSCode JOIN (     SELECT `cds`, COUNT(*) AS cds_count     FROM satscores     GROUP BY `cds` ) satscores ON s.CDSCode = satscores.`cds` GROUP BY s.CDSCode;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.Charter = 1 AND EXISTS (     SELECT 1     FROM satscores     WHERE satscores.cds = s.CDSCode     AND satscores.cds IN (         SELECT cds         FROM satscores         GROUP BY cds         HAVING AVG(MathScore) > 560     ) );	california_schools
SELECT frpm.FRPM_Count__Ages_5_17 FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.cds = (     SELECT satscores.cds     FROM satscores     JOIN schools ON satscores.cds = schools.CDSCode     ORDER BY (frpm.FRPM_Count__Ages_5_17 / frpm.Enrollment__Ages_5_17) DESC     LIMIT 1 );	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`)  FROM `frpm`  WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3 AND `Enrollment (Ages 5-17)` > 0 AND `Free Meal Count (Ages 5-17)` > 0;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.rtype = 'S' ORDER BY (sc.NumGE1500 / sc.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT      s.NCESSchool,      f.`Enrollment (Ages 5-17)` FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode ORDER BY      f.`Enrollment (Ages 5-17)` DESC LIMIT      5;	california_schools
SELECT s.NCESDist, AVG(satscores.ReadingScore) as AvgReadingScore FROM satscores JOIN schools s ON s.CDSCode = satscores.cds WHERE s.NCESDist IS NOT NULL AND satscores.ReadingScore IS NOT NULL GROUP BY s.NCESDist ORDER BY AvgReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.enroll12 < 100;	california_schools
SELECT `schools.CDSCode`, `schools.Charter`, AVG(`satscores.AvgScrWrite`) AS AvgWriteScore FROM `schools` JOIN `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE `satscores.AvgScrWrite` > 499 AND `schools.Charter` IS NOT NULL GROUP BY `schools.CDSCode` ORDER BY AvgWriteScore DESC;	california_schools
SELECT COUNT(DISTINCT s.CDSCode)  FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.State = 'CA'  AND s.FundingType = 'Directly funded' AND s.NCESDist = '0691051' AND sc.enroll12 <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.rtype = 'M' -- Assuming 'M' indicates Math scores GROUP BY s.CDSCode, s.Phone ORDER BY AVG(ss.NumGE1500) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE `District Code` = 10017 AND `Low Grade` = '9' AND `High Grade` = '12';	california_schools
SELECT COUNT(*) FROM frpm WHERE `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;	california_schools
SELECT      s.NCESSchool,      s.NCESDist,      SUM(satscores.enroll12) AS total_test_takers FROM      schools AS s JOIN      satscores AS sc ON s.CDSCode = sc.cds WHERE      s.NCESDist = '0691051' GROUP BY      s.NCESSchool,      s.NCESDist ORDER BY      total_test_takers DESC LIMIT 1;	california_schools
SELECT      s.School,      s.Street,      s.StreetAbr,      s.City,      s.Zip,      s.State FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.CDSCode FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sat ON s.CDSCode = sat.cds WHERE f.`Percent (%) Eligible Free (K-12)` > 0.1 AND sat.cds IN (SELECT cds FROM satscores WHERE cds IN ('10101080000000', '10101080109991', '10101080111682', '10101080119628', '10621170000000') AND satscores > 1500);	california_schools
SELECT s.NCESSchool, s.FundingType FROM schools s JOIN (     SELECT s.CDSCode, AVG(satscores.AvgScrRead) as AvgMathScore     FROM schools s     JOIN satscores ON s.CDSCode = satscores.cds     WHERE s.State = 'CA' AND s.NCESDist = '0691051' AND satscores.AvgScrRead IS NOT NULL     GROUP BY s.CDSCode     HAVING AVG(satscores.AvgScrRead) > 400 ) AS subquery ON s.CDSCode = subquery.CDSCode;	california_schools
SELECT      s.School Name,      s.MailStreet AS Street,      s.District AS City,      s.State,      s.MailZip AS ZipCode FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.School Type = 'High Schools (Public)' AND      f.County Code = '01' AND      f.`Percent (%) Eligible Free (Ages 5-17)` > 0 AND      f.`Free Meal Count (Ages 5-17)` > 800 AND      s.State = 'CA';	california_schools
SELECT s.School, s.Phone AS CommunicationNumber, s.LastUpdate AS SchoolOpenedOrClosedDate, sname, AvgScrRead FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (s.LastUpdate > '1991-12-31' OR s.LastUpdate < '2000-01-01') AND s.SOCType = 'Writing' ORDER BY s.School;	california_schools
SELECT s.School, s.DOCType FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 0 AND f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)` >  (SELECT AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`) FROM frpm f2 JOIN schools s2 ON f2.CDSCode = s2.CDSCode WHERE f2.`Charter School (Y/N)` = 0);	california_schools
SELECT      s.LastUpdate FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm WHERE `Charter School (Y/N)` = 1 AND `Enrollment (K-12)` IS NOT NULL)     AND f.`Charter School (Y/N)` = 1 ORDER BY      s.LastUpdate ASC LIMIT 1;	california_schools
SELECT s.State, s.NCESDist, s.NCESSchool, MIN(`Enrollment (K-12)`) AS LowestEnrollment FROM `frpm` f JOIN `schools` s ON f.CDSCode = s.CDSCode WHERE `Enrollment (K-12)` IS NOT NULL GROUP BY s.State, s.NCESDist, s.NCESSchool ORDER BY LowestEnrollment ASC LIMIT 5;	california_schools
SELECT      `Percent (%) Eligible Free (K-12)` AS EligibleFreeRate FROM      `frpm` ORDER BY      `Enrollment (K-12)` DESC LIMIT 10, 1;	california_schools
SELECT      `frpm`.`CDSCode`,      `frpm`.`School Name`,      `frpm`.`Percent (%) Eligible FRPM (K-12)` AS EligibleFRPMRate FROM      `frpm` JOIN      `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE      `schools`.`Charter` = 1     AND `frpm`.`Percent (%) Eligible FRPM (K-12)` IS NOT NULL     AND `frpm`.`FRPM Count (K-12)` IS NOT NULL     AND `frpm`.`Enrollment (K-12)` IS NOT NULL ORDER BY      (`frpm`.`FRPM Count (K-12)` / `frpm`.`Enrollment (K-12)`) DESC LIMIT 5;	california_schools
SELECT      s.School,      s.Website FROM      frpm frpm JOIN      schools s ON frpm.CDSCode = s.CDSCode WHERE      frpm.FreeMealCount_Ages5_17 BETWEEN 1900 AND 2000	california_schools
SELECT      s.CDSCode,     (f.`Free Meal Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) AS Free_Rate FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.AdmFName1 = 'Kacey Gibson' AND     s.AdmFName2 = 'Kacey Gibson' OR     s.AdmFName3 = 'Kacey Gibson' AND     s.AdmLName1 = 'Gibson' OR     s.AdmLName2 = 'Gibson' OR     s.AdmLName3 = 'Gibson';	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Enrollment (K-12)` = (SELECT MIN(`Enrollment (K-12)`) FROM frpm WHERE `Charter School (Y/N)` = 1);	california_schools
SELECT      s.AdmFName1,      s.AdmLName1,      s.AdmFName2,      s.AdmLName2,      s.AdmFName3,      s.AdmLName3 FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.NumGE1500 IS NOT NULL GROUP BY      s.CDSCode ORDER BY      SUM(sc.NumGE1500) DESC LIMIT 1;	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.rtype = 'D' AND sc.NumTstTakr > 0 ORDER BY (sc.NumGE1500 / sc.NumTstTakr) ASC LIMIT 1;	california_schools
SELECT s.NCESDist, s.NCESSchool, s.LastUpdate FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.NCESDist = '0691052' -- Los Angeles County NCES District code AND sc.enroll12 BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(enroll12) AS avg_test_takers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.LastUpdate BETWEEN '1980-01-01' AND '1980-12-31' AND schools.StatusType = 'Active';	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' AND ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores ss2 WHERE s2.District = 'Fresno Unified') AND s.County = 'Fresno'	california_schools
SELECT sname FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.Virtual = 'F' GROUP BY schools.County, satscores.sname ORDER BY schools.County, AVG(satscores.AvgScrRead) DESC PARTITION BY schools.County LIMIT 5;	california_schools
SELECT      s.CDSCode,     s.Type FROM      schools s JOIN      (SELECT          frpm.CDSCode,         AVG(satscores.Score) AS avg_math_score      FROM          frpm      JOIN          schools s ON frpm.CDSCode = s.CDSCode      JOIN          satscores ON s.CDSCode = satscores.cds      GROUP BY          frpm.CDSCode      ORDER BY          avg_math_score DESC      LIMIT 1) AS top_schools ON      s.CDSCode = top_schools.CDSCode;	california_schools
SELECT s.County Name, AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AverageScore FROM `satscores` AS sc JOIN `schools` AS s ON sc.cds = s.CDSCode GROUP BY s.County Name ORDER BY AverageScore ASC LIMIT 1;	california_schools
SELECT s.NCESDist, AVG(s.AvgScrRead) AS AvgWritingScore FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.NumGE1500 IS NOT NULL GROUP BY s.NCESDist ORDER BY SUM(s.NumGE1500) DESC LIMIT 1;	california_schools
SELECT s.School, AVG(s.AvgScrWrite) AS AvgWritingScore FROM `schools` s JOIN `satscores` sc ON s.CDSCode = sc.cds WHERE s.AdmLName1 = 'Ulrich' OR s.AdmLName2 = 'Ulrich' OR s.AdmLName3 = 'Ulrich' GROUP BY s.School;	california_schools
SELECT      s.CDSCode,      s.School Name,      frpm.`Enrollment (K-12)` FROM      frpm JOIN      schools s ON frpm.CDSCode = s.CDSCode WHERE      s.DOCType = '31' AND     frpm.`Enrollment (K-12)` IS NOT NULL ORDER BY      frpm.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT      COUNT(*) / 12 AS MonthlyAverageOpenings FROM      schools WHERE      `StatusType` = 'Active'     AND `DOCType` = 'ELEM'     AND YEAR(`OpenDate`) = 1980     AND `County` = 'Alameda'	california_schools
SELECT      SUM(CASE WHEN s.DOCType = '54' THEN 1 ELSE 0 END) AS UnifiedSchoolDistricts,     SUM(CASE WHEN s.DOCType = '52' THEN 1 ELSE 0 END) AS ElementarySchoolDistricts,     (SUM(CASE WHEN s.DOCType = '54' THEN 1 ELSE 0 END) / SUM(CASE WHEN s.DOCType = '52' THEN 1 ELSE 0 END)) AS Ratio FROM      schools s WHERE      s.County = 'Orange';	california_schools
SELECT      CountyName,      COUNT(*) AS ClosedSchoolsCount,      GROUP_CONCAT(School ORDER BY School SEPARATOR '; ') AS ClosedSchools FROM      frpm  JOIN      schools  ON      frpm.CDSCode = schools.CDSCode  WHERE      schools.StatusType = 'Closed'  GROUP BY      CountyName  ORDER BY      ClosedSchoolsCount DESC  LIMIT 1;	california_schools
SELECT sname, Street, StreetAbr, City, Zip, State FROM schools WHERE CDSCode = (     SELECT cds     FROM satscores     ORDER BY AvgScrMath DESC     LIMIT 6, 1 );	california_schools
SELECT s.Street, s.StreetAbr, s.City, s.Zip, s.State, sch.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores) ORDER BY sc.AvgScrRead ASC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Lakeport' AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500;	california_schools
SELECT SUM(`NumTstTakr`) AS TotalTestTakers FROM `schools` JOIN `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE `schools.City` = 'Fresno';	california_schools
SELECT s.CDSCode, s.NCESDist FROM schools s JOIN (     SELECT CDSCode     FROM schools     WHERE `State` = 'CA' AND `District` = 'Alameda County Office of Education' AND `NCESSchool` = '10546' ) a ON s.CDSCode = a.CDSCode;	california_schools
SELECT      (SELECT COUNT(*)       FROM schools       WHERE `State` = 'CA' AND `NCESDist` = '0691063') /      (SELECT COUNT(*)       FROM schools       WHERE `State` = 'CA' AND `NCESDist` = '0691062') AS Ratio	california_schools
SELECT COUNT(*) FROM schools WHERE `MailState` = 'CA' AND `City` = 'San Joaquin' AND `StatusType` = 'Active';	california_schools
SELECT s.MailStreet, s.MailState FROM schools s JOIN (     SELECT s.CDSCode, s.MailStreet, s.MailState     FROM schools s     JOIN satscores ss ON s.CDSCode = ss.cds     WHERE ss.rtype = 'D' AND ss.AvgScrRead IS NOT NULL     ORDER BY ss.AvgScrRead DESC     LIMIT 333 ) AS subquery WHERE s.CDSCode = subquery.CDSCode;	california_schools
SELECT `School`, `Phone`, `Phone` AS `Extension`  FROM `schools`  WHERE `Zip` = '95203-3704';	california_schools
SELECT s.Website FROM schools s JOIN (     SELECT CDSCode     FROM schools     WHERE AdmLName1 = 'Larson' AND AdmLName2 = 'Alvarez' ) a ON s.CDSCode = a.CDSCode;	california_schools
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND DOC = '52' AND City = 'Hickman';	california_schools
SELECT COUNT(*) FROM frpm WHERE `Percent (%) Eligible Free (K-12)` < 0.18 AND `School Code` IN (SELECT `School Code` FROM schools WHERE State = 'CA' AND Charter = 0);	california_schools
SELECT s.School, s.City, a.AdmFName1, a.AdmLName1, a.AdmFName2, a.AdmLName2, a.AdmFName3, a.AdmLName3 FROM schools s JOIN schools a ON s.CDSCode = a.CDSCode WHERE s.Charter = 1 AND s.CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE `MailCity` = 'Hickman' AND `CharterNum` = '00D4';	california_schools
SELECT      (COUNT(CASE WHEN FundingType = 'Locally funded' THEN 1 END) * 100.0) /      COUNT(*) * 100 AS PercentageOfLocallyFundedSchools FROM      schools WHERE      State = 'CA' AND     District = 'Santa Clara County Office of Education';	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND District = 'Stanislaus';	california_schools
SELECT SUM(`Enrollment (K-12)`) AS TotalClosureEnrollment FROM `frpm` WHERE `Academic Year` = '1989-1990' AND `City` = 'San Francisco' AND `StatusType` = 'Closed' AND `District Code` IN (     SELECT `District Code`     FROM `schools`     WHERE `City` = 'San Francisco'     AND `FundingType` = 'Community College District' );	california_schools
SELECT `County` FROM `schools` WHERE `SOCType` = '11' AND `StatusType` = 'Closed' AND YEAR(`OpenDate`) BETWEEN 1980 AND 1989 GROUP BY `County` ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT `NCESDist` FROM `schools` WHERE `StatusType` = 'Active' AND `Charter` IS NOT NULL AND `FundingType` = 'Directly funded' AND `EILCode` = '31';	california_schools
SELECT      SUM(CASE WHEN StatusType = 'Active' THEN 1 ELSE 0 END) AS Active_District_Community_Day_Schools,     SUM(CASE WHEN StatusType = 'Closed' THEN 1 ELSE 0 END) AS Closed_District_Community_Day_Schools FROM      schools WHERE      County = 'Alpine' AND     School LIKE '%Community Day School%';	california_schools
SELECT `District Code` FROM `schools` WHERE `City` = 'Fresno' AND `Magnet` = 0;	california_schools
SELECT `Enrollment (Ages 5-17)` FROM `frpm` WHERE `Academic Year` = '2014-2015' AND `EdOpsCode` = 'SSS' AND `School Name` = 'Fremont State Special School';	california_schools
SELECT      frpm.`Free Meal Count (Ages 5-17)`  FROM      frpm  JOIN      schools  ON      frpm.CDSCode = schools.CDSCode  WHERE      schools.MailingStreet = 'PO Box 1040'      AND schools.District = 'Youth Authority';	california_schools
SELECT MIN(`GSoffered`) AS LowestGrade FROM `schools` WHERE `EdOpsCode` = 'SPECON' AND `NCESDist` = '0613360';	california_schools
SELECT      frpm.School Name,      schools.SOCType AS Educational_Level_Name FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      frpm.`Educational Option Type` = 'Breakfast Provision 2'     AND frpm.County Code = '37';	california_schools
SELECT `schools`.`City` FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `frpm`.`Low Grade` = '09' AND `frpm`.`High Grade` = '12' AND `frpm`.`Educational Option Type` = 'High Schools (Public)' AND `frpm`.`NSLP Provision Status` = 'Lunch Provision 2' AND `schools`.`EILCode` = 'HS' AND `schools`.`District` = 'Merced';	california_schools
SELECT      s.School Name,      f Percent (%) Eligible FRPM (Ages 5-17) FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.State = 'CA' AND      s.County Code = 'Los Angeles' AND      s.GSoffered LIKE '%K-9%'	california_schools
SELECT `GSoffered` AS GradeSpan, COUNT(*) AS Frequency FROM `schools` WHERE `City` = 'Adelanto' GROUP BY `GSoffered` ORDER BY Frequency DESC LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS NumberOfSchools FROM      schools WHERE      County IN ('San Diego', 'Santa Barbara') AND      Virtual = 0 GROUP BY      County ORDER BY      NumberOfSchools DESC LIMIT 1;	california_schools
SELECT      s.NCESDist,      s.LastUpdate,      sc.Latitude FROM      schools s JOIN      (SELECT          `CDSCode`,          MAX(Latitude) AS MaxLatitude      FROM          schools      GROUP BY          `CDSCode`     ) sc ON s.CDSCode = sc.CDSCode WHERE      s.Latitude = sc.MaxLatitude;	california_schools
SELECT      s.City,      s.School,      MIN(s.Latitude) AS LowestLatitude,      s.GSoffered AS LowestGrade FROM      schools s WHERE      s.State = 'CA' GROUP BY      s.City, s.School, s.GSoffered ORDER BY      s.Latitude ASC LIMIT 1;	california_schools
SELECT `GSoffered`  FROM `schools` ORDER BY ABS(`Longitude`) DESC LIMIT 1;	california_schools
SELECT      `schools`.`City`,      COUNT(`schools`.`CDSCode`) AS `TotalSchools` FROM      `schools` INNER JOIN      `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode` WHERE      `schools`.`Magnet` = 1 AND      `frpm`.`Educational Option Type` = 'Multiple Provision Types' AND      `schools`.`GSserved` LIKE '%K-8%' GROUP BY      `schools`.`City` ORDER BY      `schools`.`City`;	california_schools
SELECT      AdmFName1,      COUNT(AdmFName1) AS Count,      District FROM      schools WHERE      AdmFName1 IS NOT NULL AND      AdmFName1 != '' GROUP BY      AdmFName1, District ORDER BY      Count DESC, District LIMIT 2;	california_schools
SELECT      frpm.`Percent (%) Eligible Free (K-12)`,      schools.`NCESDist` AS DistrictCode FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.AdmFName1 = 'Alusine';	california_schools
SELECT      s.`AdmLName1` AS AdminLastName,     sch.District,     sch.County,     sch.SchoolName FROM      `schools` sch JOIN      `frpm` frpm ON sch.CDSCode = frpm.CDSCode WHERE      frpm.`Charter School Number` = '40';	california_schools
SELECT DISTINCT `AdmEmail1`, `AdmEmail2`, `AdmEmail3` FROM `schools` WHERE `State` = 'CA' AND `MailStreet` LIKE 'San Bernardino%' AND `LastUpdate` BETWEEN '2009-01-01' AND '2010-12-31' AND (`DOCType` = '54' OR `DOCType` = '62') AND `StatusType` = 'Active' AND `FundingType` = 'Public';	california_schools
SELECT s.AdministratorEmail, s.SchoolName FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds JOIN (     SELECT CDSCode     FROM satscores     WHERE cds IN (SELECT CDSCode FROM frpm WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0)     GROUP BY CDSCode     ORDER BY COUNT(*) DESC     LIMIT 1 ) AS top_schools ON s.CDSCode = top_schools.CDSCode;	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = a.account_id );	financial
SELECT   AVG(A12) AS avg_unemployment_1995,   AVG(A13) AS avg_unemployment_1996 FROM   (     SELECT       A12,       A13     FROM       unemployment_data     WHERE       YEAR(date) IN (1995, 1996)   ) AS subquery WHERE   A12 IS NOT NULL AND A13 IS NOT NULL;	financial
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND EXISTS (     SELECT 1     FROM client     JOIN district ON district.district_id = client.district_id     WHERE client.gender = 'F' );	financial
SELECT COUNT(c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M'  AND d.A3 = 'North Bohemia'  AND d.A10 > 8000;	financial
SELECT      a.account_id FROM      client c JOIN      account ac ON c.client_id = ac.account_id JOIN      district d ON c.district_id = d.district_id WHERE      c.gender = 'F' ORDER BY      c.birth_date ASC,      d.A11 ASC LIMIT 1;  SELECT      MAX(d.A11) - MIN(d.A11) AS salary_gap FROM      district d JOIN      client c ON d.district_id = c.district_id JOIN      account ac ON c.client_id = ac.account_id WHERE      c.gender = 'F';	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN (     SELECT district_id, MIN(birth_date) AS youngest_birth_date     FROM client     GROUP BY district_id ) youngest ON c.district_id = youngest.district_id AND c.birth_date = youngest.youngest_birth_date JOIN (     SELECT district_id, AVG(amount) AS avg_salary     FROM loan     GROUP BY district_id ) avg_salaries ON youngest.district_id = avg_salaries.district_id ORDER BY avg_salaries.avg_salary DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN account a ON c.district_id = a.district_id WHERE a.frequency = 'POPLATEK TYDNE' AND c.gender = 'Owner';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date BETWEEN '1997-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND l.duration > 12 ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov';	financial
SELECT account_id FROM account WHERE date = (SELECT MIN(date) FROM account WHERE YEAR(date) = 1995)	financial
SELECT DISTINCT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date < '1997-01-01' AND l.amount > 3000;	financial
SELECT c.client_id FROM client c JOIN card cd ON c.client_id = cd.disp_id JOIN disp d ON c.client_id = d.client_id WHERE cd.issued = '1994-03-03';	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.date = '1998-10-14' AND t.account_id = (SELECT account_id FROM trans WHERE amount = 840 AND date = '1998-10-14');	financial
SELECT d.district_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(amount)  FROM `order`  JOIN `account` ON `order.account_id` = `account.account_id` JOIN `card` ON `account.account_id` = `card.account_id` JOIN `client` ON `account.district_id` = `client.district_id` WHERE `card.issued` = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND d.A11 = (SELECT MAX(A11) FROM district);	financial
SELECT MIN(trans.trans_id), trans.amount FROM trans JOIN account ON trans.account_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE loan.amount = (SELECT MAX(amount) FROM loan) ORDER BY trans.trans_id ASC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT d.disp_id FROM `account` a JOIN `disp` d ON a.account_id = d.account_id JOIN `trans` t ON d.account_id = t.account_id WHERE t.k_symbol = '5100' AND t.date = '1998-09-02';	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Litomerice' AND YEAR(a.date) = 1996;	financial
SELECT d.A2 AS district_name FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.duration = 48 AND l.payments = 2307.0 AND l.date = '1996-01-03';	financial
SELECT account.account_id  FROM account  JOIN district ON account.district_id = district.district_id  JOIN disp ON account.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  WHERE district.A3 = 'Prague'  ORDER BY account.date  LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(c.gender) AS male_clients_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'Jihoceske' ORDER BY      d.A10 DESC LIMIT 1;	financial
SELECT      (MAX(district.A10) - MIN(district.A10)) / MIN(district.A10) * 100 AS increase_rate FROM      district JOIN      account ON district.district_id = account.district_id JOIN      client ON account.district_id = client.district_id JOIN      loan ON account.account_id = loan.account_id WHERE      loan.date = (SELECT MIN(loan.date) FROM loan WHERE loan.date BETWEEN '1993-07-05' AND '1998-12-27')     AND account.date BETWEEN '1993-03-22' AND '1998-12-27';	financial
SELECT      (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS paid_in_full_percentage FROM      loan l;	financial
SELECT     round((COUNT(CASE WHEN l.amount < 100000 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_accounts FROM     loan l WHERE     l.status = 'C';	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM `account` a JOIN `district` d ON a.district_id = d.district_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU' ORDER BY a.account_id;	financial
SELECT a.account_id, a.frequency FROM account a JOIN client c ON a.account_id = c.account_id JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND d.district_id = 1;	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3, d.A11 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.duration = 60;	financial
SELECT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_rate FROM district d JOIN loan l ON d.district_id = (SELECT district_id FROM client WHERE client_id = l.account_id) WHERE l.status = 'D' AND d.A13 IS NOT NULL AND d.A12 IS NOT NULL;	financial
SELECT      (COUNT(*) FILTER (WHERE d.A2 = 'Decin' AND a.date = '1993-01-01') * 100.0) / COUNT(*) FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      a.date = '1993-01-01';	financial
SELECT account.account_id FROM account WHERE account.frequency = 'POPLATEK MESICNE' GROUP BY account.account_id;	financial
SELECT district_id, COUNT(account_id) AS female_account_holders FROM account JOIN client ON account.district_id = client.district_id AND client.gender = 'F' GROUP BY district_id ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, SUM(o.amount) AS total_withdrawals FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `district` d ON a.district_id = d.district_id WHERE o.k_symbol = 'VYDAJ' AND d.A2 IS NOT NULL AND a.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id LEFT JOIN card cr ON c.client_id = cr.disp_id WHERE d.A3 = 'South Bohemia' AND cr.card_id IS NULL;	financial
SELECT d.A3 AS district_name, COUNT(l.loan_id) AS active_loan_count FROM district d JOIN loan l ON d.district_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.district_id ORDER BY active_loan_count DESC LIMIT 1;	financial
SELECT AVG(`amount`) AS average_loan_amount FROM `loan` WHERE `account_id` IN (     SELECT `account_id`     FROM `account`     JOIN `client` ON `account.district_id` = `client.district_id`     WHERE `client.gender` = 'M' );	financial
SELECT `A2`, `A3` FROM `district` WHERE `A13` = (     SELECT MAX(`A13`)     FROM `district`     WHERE YEAR(`date`) = 1996 );	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A16 = (SELECT MAX(A16) FROM district WHERE A16 IS NOT NULL AND YEAR(date) = 1996);	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.k_symbol = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND EXISTS (     SELECT 1     FROM (         SELECT a.account_id, SUM(CASE WHEN o.amount < 0 THEN o.amount ELSE 0 END) AS withdraw_amount         FROM account a         JOIN order o ON a.account_id = o.account_id         GROUP BY a.account_id     ) AS withdraws     WHERE withdraws.account_id = a.account_id     AND withdraws.withdraw_amount < 0 );	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000 AND a.date BETWEEN '1995-01-01' AND '1997-12-31';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND (l.status = 'C' OR l.status = 'D');	financial
SELECT COUNT(c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A15 = (     SELECT MAX(A15)     FROM district     WHERE A15 < (         SELECT MAX(A15) FROM district     ) );	financial
SELECT COUNT(*) FROM `card` JOIN `disp` ON `card.disp_id` = `disp.disp_id` JOIN `client` ON `disp.client_id` = `client.client_id` WHERE `card.type` = 'gold' AND `client.gender` = 'OWNER';	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Pisek';	financial
SELECT d.A2 AS district_name, SUM(o.amount) AS total_amount FROM district d JOIN account a ON d.district_id = a.district_id JOIN order o ON a.account_id = o.account_id WHERE a.date = '1997-12-31' GROUP BY d.A2 HAVING SUM(o.amount) > 10000;	financial
SELECT o.account_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `district` d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek' AND o.k_symbol = 'SIPO';	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.card_id = c.card_id WHERE c.type = 'gold';	financial
SELECT AVG(amount) AS average_credit_card_withdrawn FROM `account` JOIN `order` ON `account.account_id` = `order.account_id` JOIN `trans` ON `account.account_id` = `trans.account_id` WHERE `order.k_symbol` = 'VYBER KARTOU' AND YEAR(`account.date`) = 2021 AND MONTH(`account.date`) = 12;	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date BETWEEN '1998-01-01' AND '1998-12-31' AND t.trans_id IN (     SELECT trans_id     FROM trans     JOIN `order` o ON trans.account_id = o.account_id     WHERE o.k_symbol = 'VYBER KARTOU' ) AND EXISTS (     SELECT 1     FROM `order` o     WHERE o.account_id = a.account_id     AND o.date BETWEEN '1998-01-01' AND '1998-12-31'     AND o.k_symbol = 'VYBER KARTOU' ) AND o.amount < (     SELECT AVG(o.amount)     FROM `order` o     WHERE o.k_symbol = 'VYBER KARTOU'     AND o.date BETWEEN '1998-01-01' AND '1998-12-31' );	financial
SELECT c.client_id, c.gender FROM client c JOIN account a ON c.client_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN card crd ON d.disp_id = crd.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND crd.type = 'gold';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 LIKE '%South Bohemia%';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.frequency = 'POPLATEK MESICNE' AND a.account_id IN (     SELECT DISTINCT account_id     FROM account     WHERE frequency = 'POPLATEK MESICNE' AND account_id NOT IN (         SELECT account_id         FROM account         WHERE frequency != 'POPLATEK MESICNE'     ) );	financial
SELECT DISTINCT a.account_id, a.frequency FROM account a WHERE a.account_id NOT IN (     SELECT l.account_id     FROM loan l ) AND EXISTS (     SELECT 1     FROM district d     WHERE d.district_id = a.district_id     AND (         SELECT AVG(A11)          FROM client c         WHERE c.district_id = d.district_id     ) BETWEEN 8000 AND 9000	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id JOIN trans t ON a.account_id = t.account_id WHERE dt.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.k_symbol = 'VYDAJ';	financial
SELECT AVG(`A15`) as avg_crimes FROM `district` WHERE `A3` IN ('Prague', 'central Bohemia') AND `A15` > 4000 AND EXISTS (     SELECT 1     FROM `account`     WHERE `account`.`district_id` = `district`.`district_id`     AND YEAR(`account`.`date`) >= 1997 );	financial
SELECT COUNT(*) FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE card.type = 'classic' AND disp.account_id IN (     SELECT account_id     FROM account     WHERE frequency = 'OWNER' );	financial
SELECT COUNT(c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A2 = 'Hl.m. Praha';	financial
SELECT      ROUND((COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0) / COUNT(c.card_id), 2) AS gold_card_percentage FROM      `card` c;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT d.A15 FROM district d JOIN account a ON d.district_id = a.district_id WHERE a.account_id = 532 AND a.date = '1995-01-01';	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT `account_id`, `date`, `amount` FROM `trans` WHERE `account_id` IN (     SELECT `account_id`     FROM `disp`     WHERE `client_id` = 3356 ) AND `k_symbol` = 'VYBER';	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND account_id IN (SELECT account_id FROM loan WHERE amount < 200000);	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 13539;	financial
SELECT d.A3 AS region FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541;	financial
SELECT d.district_id, COUNT(a.account_id) AS account_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY account_count DESC LIMIT 1;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.trans_id, a.account_id, a.date FROM account a JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE d.district_id = 5;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Jesenik';	financial
SELECT c.client_id FROM client c JOIN card cd ON c.client_id = cd.disp_id JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE cd.type = 'junior' AND cd.issued >= '1997-01-01';	financial
SELECT      ROUND((COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) /            (SELECT COUNT(*) FROM client c2             JOIN district d ON c2.district_id = d.district_id             WHERE d.A11 > 10000), 2) AS percentage_female_clients FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A11 > 10000;	financial
SELECT      ((SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) - SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) /      SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END) * 100) AS growth_rate FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.gender = 'M' AND      YEAR(l.date) IN (1996, 1997);	financial
SELECT COUNT(*) FROM `account` JOIN `disp` ON `account.account_id` = `disp.account_id` JOIN `card` ON `disp.disp_id` = `card.disp_id` WHERE `card.type` = 'gold' OR `card.type` = 'classic' AND `account.date` > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN d.A3 = 'North Bohemia' AND a.date = '1996-12-31' THEN d.A16 ELSE 0 END) -      SUM(CASE WHEN d.A3 = 'East Bohemia' AND a.date = '1996-12-31' THEN d.A16 ELSE 0 END)) AS crime_difference FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      a.date = '1996-12-31';	financial
SELECT COUNT(DISTINCT d.disp_id) AS total_dispositions FROM disp d JOIN account a ON d.account_id = a.account_id WHERE a.account_id BETWEEN 1 AND 10;	financial
SELECT      COUNT(*) AS statement_requests FROM      `account` WHERE      `account_id` = 3 AND `frequency` = 'POPLATEK MESICNE';  SELECT      SUM(`amount`) AS total_debit FROM      `order` WHERE      `account_id` = 3 AND `k_symbol` = '3539';	financial
SELECT YEAR(birth_date) AS birth_year FROM client WHERE client_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND t.k_symbol IS NOT NULL;	financial
SELECT l.amount - l.payments AS total_debt,         l.payments AS total_paid FROM loan l JOIN client c ON l.account_id = c.district_id WHERE c.client_id = 992;	financial
SELECT      SUM(t.amount) AS total_sum,     c.gender FROM      trans t JOIN      account a ON t.account_id = a.account_id JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.client_id = 4 AND t.trans_id = 851 GROUP BY      c.gender;	financial
SELECT card_id FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 9;	financial
SELECT SUM(t.amount) AS total_amount FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `client` c ON a.account_id = c.account_id WHERE c.client_id = 617 AND YEAR(t.trans_date) = 1998;	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.district_id = 5;	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.district_id = 1 -- Assuming 'home' refers to a specific district AND YEAR(t.date) BETWEEN 1974 AND 1976 AND t.k_symbol = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A4 = '1204953' AND a.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN card crd ON c.client_id = crd.disp_id JOIN disp d ON c.client_id = d.client_id WHERE c.gender = 'F' AND crd.type = 'junior';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS female_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'Prague'	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) / COUNT(DISTINCT a.account_id)) * 100 AS male_clients_percentage FROM      account a JOIN      client c ON a.district_id = c.district_id WHERE      a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.account_id = c.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, d.A11 ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*) FROM `account` a JOIN `loan` l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24;	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status IN ('C', 'D') AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT c.client_id, d.district_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.account_id IN (     SELECT a.account_id     FROM account a     JOIN loan l ON a.account_id = l.account_id     UNION     SELECT a.account_id     FROM account a     JOIN order o ON a.account_id = o.account_id );	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id WHERE crd.type = 'gold' AND d.type = 'OWNER';	financial
SELECT `bond_type`, COUNT(*) AS count FROM `bond` GROUP BY `bond_type` ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'cl' AND EXISTS (SELECT 1 FROM molecule WHERE molecule_id = m.molecule_id AND label = '-');	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS average_oxygen_atoms FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS avg_single_bonded FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE molecule_id NOT IN (         SELECT molecule_id         FROM atom         JOIN molecule ON atom.molecule_id = molecule.molecule_id         WHERE atom.element = 'na' AND molecule.label = 'carcinogenic'     ) );	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND EXISTS (     SELECT 1     FROM connected c     WHERE c.bond_id = b.bond_id AND c.bond_id IN (         SELECT bond_id         FROM connected         GROUP BY bond_id         HAVING COUNT(*) = 3     ) ) AND EXISTS (     SELECT 1     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     JOIN molecule m ON b.molecule_id = m.molecule_id     WHERE c.bond_id IN (         SELECT bond_id         FROM connected         GROUP BY bond_id         HAVING COUNT(*) = 3     )     AND m.molecule_id = m.molecule_id AND m.label = '+' );	toxicology
SELECT      (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100 AS percentage_of_carbon FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT molecule.molecule_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '=' AND a1.atom_id <> a2.atom_id;	toxicology
SELECT `element` FROM `atom` WHERE `element` = 'h' GROUP BY `element` ORDER BY COUNT(`element`) DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM atom a JOIN bond b ON a.bond_id = b.bond_id WHERE a.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT c1.atom_id, c2.atom_id FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id WHERE c1.atom_id < c2.atom_id AND EXISTS (     SELECT 1     FROM molecule     WHERE molecule.molecule_id = c1.molecule_id     AND molecule.molecule_id LIKE 'TR%'     AND SUBSTRING(molecule.molecule_id, 2, 1) = '-' );	toxicology
SELECT element FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '-' ) GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT bond_type  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20') OR        (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8');	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (     SELECT molecule_id     FROM atom     WHERE element != 'sn' ) AND bond_type = '+' GROUP BY bond_type;	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#' AND EXISTS (     SELECT 1     FROM connected c2     WHERE c1.atom_id2 = c2.atom_id     AND c2.bond_id IS NULL );	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.molecule_id = 'TR181' UNION SELECT DISTINCT a2.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN atom a2 ON a2.atom_id = c.atom_id2 OR a2.atom_id = c.atom_id WHERE a2.molecule_id = 'TR181';	toxicology
SELECT      (COUNT(DISTINCT CASE WHEN `element` = 'f' THEN `atom_id` END) * 100) /      (SELECT COUNT(DISTINCT `atom_id`) FROM `atom` WHERE `molecule_id` IN          (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+')     ) AS percentage_of_carcinogenic_with_fluorine FROM      `atom` WHERE      `molecule_id` IN          (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+')	toxicology
SELECT      COUNT(DISTINCT m.molecule_id) AS total_carcinogenic_molecules,     COUNT(DISTINCT CASE WHEN b.bond_type = '#' THEN m.molecule_id END) AS total_triple_bond_carcinogens,     (COUNT(DISTINCT CASE WHEN b.bond_type = '#' THEN m.molecule_id END) * 100.0) / COUNT(DISTINCT m.molecule_id) AS percentage_triple_bond_carcinogens FROM      molecule m LEFT JOIN      bond b ON m.molecule_id = b.molecule_id WHERE      m.molecule_id IN (SELECT molecule_id FROM atom a WHERE a.element = '+')	toxicology
SELECT element, COUNT(*) as count FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY count DESC, element ASC LIMIT 3;	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001';	toxicology
SELECT      (SELECT COUNT(*) FROM molecule WHERE label = '+') -      (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;	toxicology
SELECT `atom_id` FROM `connected` WHERE `bond_id` = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2';	toxicology
SELECT DISTINCT c.molecule_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' GROUP BY c.molecule_id ORDER BY c.molecule_id ASC LIMIT 5;	toxicology
SELECT ROUND((SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond.bond_id), 5) AS percent FROM bond WHERE bond.molecule_id = 'TR008'	toxicology
SELECT ROUND(DIVIDE(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END), COUNT(m.molecule_id)) * 100, 3) AS percent FROM (     SELECT m.molecule_id, CASE WHEN c.bond_id IS NOT NULL THEN '+' ELSE '-' END AS label     FROM molecule m     LEFT JOIN connected c ON m.molecule_id = c.bond_id     GROUP BY m.molecule_id ) m;	toxicology
SELECT ROUND(DIVIDE(SUM(CASE WHEN `element` = 'h' THEN 1 ELSE 0 END), COUNT(`atom_id`)) * 100, 4) AS hydrogen_percentage FROM `atom` WHERE `molecule_id` = 'TR206'	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.molecule_id = 'TR000';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR060') UNION SELECT b.element FROM atom b JOIN connected c ON b.atom_id = c.atom_id OR b.atom_id = c.atom_id2 WHERE b.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR060');	toxicology
SELECT bond_type,         CASE             WHEN COUNT(bond_type) = (SELECT MAX(bond_count) FROM                                     (SELECT COUNT(*) AS bond_count                                      FROM bond                                      WHERE molecule_id = 'TR010') AS subquery) THEN 'Majority'            ELSE 'Not Majority'        END AS is_majority,        CASE             WHEN bond_type = '-' THEN 'Yes'            ELSE 'No'        END AS is_carcinogenic FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type;	toxicology
SELECT DISTINCT c.molecule_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND c.atom_id != c.atom_id2 ORDER BY c.molecule_id LIMIT 3;	toxicology
SELECT bond_id, COUNT(*) as count FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.molecule_id = 'TR006' GROUP BY bond_id ORDER BY count DESC, bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'br' AND m.molecule_id IN (     SELECT c.molecule_id     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     JOIN atom a2 ON c.atom_id = a2.atom_id     WHERE a2.element = '+' );	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE c.atom_id IN (     SELECT atom_id     FROM connected     WHERE bond_id = 'TR001_6_9' ) OR c.atom_id2 IN (     SELECT atom_id     FROM connected     WHERE bond_id = 'TR001_6_9' );	toxicology
SELECT m.molecule_id, CASE WHEN b.bond_type = '+' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS carcinogenicity FROM `atom` a JOIN `molecule` m ON a.molecule_id = m.molecule_id LEFT JOIN `bond` b ON a.molecule_id = b.molecule_id AND CONCAT(a.atom_id, '_10') = CONCAT(b.bond_id, '_10') WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT c.molecule_id) FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(DISTINCT c.bond_id) AS connections_count FROM connected c WHERE c.atom_id = 'TR%_19' OR c.atom_id2 = 'TR%_19';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR004');	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN (     SELECT molecule_id     FROM molecule     JOIN connected ON molecule.molecule_id = connected.molecule_id     JOIN bond ON connected.bond_id = bond.bond_id     WHERE bond_id LIKE 'TR%' );	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n' UNION SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'n' AND a2.element = 'p';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' JOIN (     SELECT molecule_id     FROM molecule     WHERE molecule_id IN (         SELECT molecule_id         FROM connected         WHERE bond_id IN (             SELECT bond_id             FROM bond             WHERE bond_type = '='         )     ) ) AS subq ON m.molecule_id = subq.molecule_id JOIN (     SELECT molecule_id     FROM molecule     WHERE molecule_id IN (         SELECT molecule_id         FROM connected         WHERE bond_id IN (             SELECT bond_id             FROM bond             WHERE bond_type = '='         )     )     AND molecule_id IN (         SELECT molecule_id         FROM molecule         WHERE molecule_id LIKE '%carcinogenic%'     ) ) AS carcinogenic_subq ON m.molecule_id = carcinogenic_subq.molecule_id GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(b.bond_id) / COUNT(a.atom_id))  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'i';	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.atom_id = 'TR000_45';	toxicology
SELECT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id IS NULL;	toxicology
SELECT a1.atom_id AS Atom1, a2.atom_id AS Atom2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR041' AND b.bond_type = '#';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.molecule_id IN ('TR000', 'TR001', 'TR002', 'TR004', 'TR006') AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT element FROM atom WHERE molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE molecule_id LIKE '%+' ) GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT DISTINCT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'pb';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.atom_id = SUBSTRING(b.bond_id, 1, LENGTH(b.bond_id) - 2) WHERE b.bond_type = '#';	toxicology
SELECT      bond_type,     COUNT(bond_id) AS total_bonds,     (COUNT(bond_id) * 100) / (         SELECT COUNT(DISTINCT atom_id)          FROM atom          WHERE atom_id IN (SELECT atom_id FROM connected)     ) AS percentage FROM      bond GROUP BY      bond_type ORDER BY      percentage DESC LIMIT 1;	toxicology
SELECT ROUND(DIVIDE(SUM(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) * 100, COUNT(bond.bond_id)), 5) AS carcinogenic_single_bond_percentage FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id WHERE bond.bond_type = '-' AND atom1.element = '+' AND atom2.element = '+';	toxicology
SELECT COUNT(*) AS total_carbon_hydrogen_atoms FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 's';	toxicology
SELECT bond.bond_type FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'sn'	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br');	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id IN ('TR001', 'TR004', 'TR006');	toxicology
SELECT DISTINCT c.molecule_id FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND NOT EXISTS (     SELECT 1     FROM molecule AS m     WHERE m.molecule_id = c.molecule_id AND m.molecule_id IN (         SELECT m2.molecule_id         FROM molecule AS m2         JOIN connected AS c2 ON m2.molecule_id = c2.molecule_id         JOIN bond AS b2 ON c2.bond_id = b2.bond_id         WHERE b2.bond_type = '='     ) );	toxicology
SELECT      ROUND(DIVIDE(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END), COUNT(a.atom_id)), 2) AS percent_cl FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-';	toxicology
SELECT `molecule_id`,         CASE WHEN `molecule_id` IN ('TR000', 'TR001', 'TR002') THEN              CASE `label`                 WHEN '+' THEN 'Carcinogenic'                 WHEN '-' THEN 'Non-Carcinogenic'                 ELSE 'Unknown'             END        ELSE 'N/A'        END AS label FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element = 'cl' AND c.bond_id IS NULL UNION SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element = 'h' AND c.bond_id IS NULL;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_carcinogenic_molecules FROM molecule m WHERE m.molecule_id BETWEEN 'TR000' AND 'TR030' AND EXISTS (     SELECT 1     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     WHERE b.molecule_id = m.molecule_id AND b.bond_type = '+' );	toxicology
SELECT b.bond_type FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(bond.bond_id) FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id AND atom.element = 'i';	toxicology
SELECT      m.molecule_id,     MAX(CASE WHEN a.element = 'ca' THEN b.label ELSE NULL END) AS carcinogenic_label FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id JOIN      bond b ON a.molecule_id = b.molecule_id GROUP BY      m.molecule_id ORDER BY      carcinogenic_label DESC;	toxicology
SELECT EXISTS (     SELECT 1     FROM atom AS a     JOIN connected AS c ON a.atom_id = c.atom_id     JOIN bond AS b ON c.bond_id = b.bond_id     WHERE b.bond_id = 'TR001_1_8' AND a.element = 'cl' ) AND EXISTS (     SELECT 1     FROM atom AS a     JOIN connected AS c ON a.atom_id = c.atom_id2     JOIN bond AS b ON c.bond_id = b.bond_id     WHERE b.bond_id = 'TR001_1_8' AND a.element = 'c' );	toxicology
SELECT DISTINCT a1.molecule_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a1.element = 'c' AND b.bond_type = '#' AND b.molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%') AND a1.molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%') AND a1.molecule_id NOT IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%')	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) /          COUNT(DISTINCT a.molecule_id),          2     ) AS percentage_chlorine_in_carcinogens FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.molecule_id IN (         SELECT              molecule_id          FROM              molecule          WHERE              label = '+'     );	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR001');	toxicology
SELECT DISTINCT c.molecule_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT DISTINCT c1.atom_id AS first_atom_id, c2.atom_id AS second_atom_id FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#' AND c1.atom_id < c2.atom_id;	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON c.atom_id2 = c2.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(DISTINCT c.molecule_id) FROM `connected` c JOIN `bond` b ON c.bond_id = b.bond_id JOIN `molecule` m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.molecule_id IN (SELECT `molecule_id` FROM `molecule` WHERE `molecule_id` NOT IN (SELECT `molecule_id` FROM `atom` WHERE `element` = 'cl'))	toxicology
SELECT `bond_type`  FROM `bond`  WHERE `bond_id` = 'TR001_10_11';	toxicology
SELECT bond.bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#' AND connected.bond_id IN (     SELECT bond_id     FROM connected     GROUP BY bond_id     HAVING COUNT(bond_id) = 3 ) JOIN molecule ON bond.molecule_id = molecule.molecule_id JOIN (     SELECT molecule_id     FROM molecule     JOIN atom ON molecule.molecule_id = atom.molecule_id     GROUP BY molecule.molecule_id     HAVING COUNT(DISTINCT atom.element) = 1 ) AS mono_elements ON molecule.molecule_id = mono_elements.molecule_id JOIN (     SELECT molecule_id     FROM molecule     WHERE label = '+' ) AS carcinogens ON molecule.molecule_id = carcinogens.molecule_id;	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id LIKE 'TR%4'  AND m.molecule_id LIKE 'TR%+'  AND a.element IS NOT NULL;	toxicology
SELECT      SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(*) AS ratio,     CASE          WHEN SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(*) > 0.5 THEN '+'          ELSE '-'      END AS label FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.molecule_id = 'TR006';	toxicology
SELECT m.molecule_id, CASE WHEN a.element = 'ca' THEN '+' ELSE '-' END AS carcinogenic_label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca';	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'c';	toxicology
SELECT DISTINCT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT     (SELECT COUNT(*)      FROM bond      WHERE bond_type = '#'      AND molecule_id IN (SELECT molecule_id FROM molecule)) / (SELECT COUNT(*)                                                              FROM molecule) * 100 AS triple_bond_percentage;	toxicology
SELECT      COUNT(CASE WHEN b.`bond_type` = '=' THEN 1 END) * 100.0 / COUNT(b.`bond_id`) AS percent FROM      `bond` b WHERE      b.`molecule_id` = 'TR047';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1' AND m.label = '+';	toxicology
SELECT COUNT(*)  FROM molecule AS m  JOIN atom AS a ON m.molecule_id = a.molecule_id  JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond AS b ON c.bond_id = b.bond_id  WHERE m.molecule_id = 'TR151' AND b.bond_type = '+';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN connected c ON m.molecule_id = c.atom_id OR m.molecule_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '+' AND m.molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%');	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND substr(m.molecule_id, 3, 3) BETWEEN 10 AND 50;	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id IN ('TR001', 'TR004', 'TR006')	toxicology
SELECT bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '=' AND molecule.molecule_id IN ('TR000', 'TR001', 'TR002', 'TR004', 'TR006') AND molecule.molecule_id LIKE '+%';	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'h' AND m.molecule_id IN (SELECT molecule_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '+');	toxicology
SELECT `molecule_id` FROM `connected` JOIN `bond` ON `connected.bond_id` = `bond.bond_id` JOIN `atom` AS atom1 ON `connected.atom_id` = atom1.atom_id JOIN `atom` AS atom2 ON `connected.atom_id2` = atom2.atom_id WHERE atom1.atom_id = 'TR000_1' AND `bond.bond_id` = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c' AND b.bond_type = '-' AND NOT EXISTS (     SELECT 1     FROM atom a2     JOIN connected c2 ON a2.atom_id = c2.atom_id     JOIN bond b2 ON c2.bond_id = b2.bond_id     WHERE a2.atom_id = a.atom_id     AND b2.bond_type = '=' )	toxicology
SELECT      COUNT(CASE WHEN T1.element = 'h' THEN 1 END) / COUNT(T1.molecule_id) * 100.0 AS percentage FROM      atom AS T1 JOIN      connected AS T2 ON T1.atom_id = T2.atom_id JOIN      bond AS T3 ON T2.bond_id = T3.bond_id JOIN      molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE      T4.molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%')     AND T3.bond_type = '+'	toxicology
SELECT COUNT(*)  FROM `molecule` m  JOIN `atom` a ON m.molecule_id = a.molecule_id  WHERE m.molecule_id = 'TR124'  AND a.element = '+';	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id2 = 'TR186' OR c.atom_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';	toxicology
SELECT a.element AS Element1, a2.element AS Element2 FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.molecule_id = 'TR001' AND c.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS double_bonds_count FROM bond WHERE molecule_id = 'TR006' AND bond_type = '=';	toxicology
SELECT m.molecule_id, a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id IN (     SELECT m.molecule_id     FROM molecule m     JOIN connected c ON m.molecule_id = c.atom_id     WHERE c.atom_id2 = 'TR000' ) AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT b.bond_id, a1.atom_id, a2.atom_id FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id AND c2.atom_id = c1.atom_id1 JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element) AS elements FROM molecule m JOIN connected c ON m.molecule_id = c.bond_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_id LIKE '%_1_%_2_%' -- Triple bond pattern GROUP BY m.molecule_id	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM `connected` WHERE `bond_id` IN (     SELECT `bond_id`     FROM `connected`     JOIN `atom` ON `connected`.atom_id = `atom`.atom_id     WHERE `atom.element` = 'cl'     )	toxicology
SELECT      a.atom_id,     COUNT(DISTINCT b.bond_type) AS bond_types_count FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id WHERE      a.molecule_id = 'TR346' GROUP BY      a.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS double_bond_molecule_count,        SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' JOIN (     SELECT DISTINCT atom.molecule_id     FROM atom     JOIN connected ON atom.atom_id = connected.atom_id     JOIN bond ON connected.bond_id = bond.bond_id     WHERE bond.bond_type = '=' ) AS double_bond_atoms ON m.molecule_id = double_bond_atoms.molecule_id JOIN molecule AS m2 ON m.molecule_id = m2.molecule_id AND m2.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id AND a.element = 's' LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE a.atom_id IS NULL AND b.bond_id IS NULL;	toxicology
SELECT bond_type  FROM bond  WHERE bond_id = 'TR001_2_4' AND bond_type = '+';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' JOIN molecule m2 ON m.molecule_id = m2.molecule_id AND m2.molecule_id = 'TR001'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.molecule_id NOT IN (     SELECT m.molecule_id     FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id     JOIN molecule_carcinogenic mc ON m.molecule_id = mc.molecule_id     WHERE mc.label = '-' );	toxicology
SELECT      COUNT(CASE WHEN m.molecule_id IN (SELECT a.molecule_id FROM atom a WHERE a.element = 'cl') AND m.label = '+' THEN 1 END) / COUNT(m.molecule_id) AS percentage FROM      molecule m;	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id FROM atom a1 JOIN atom a2 ON a1.molecule_id = a2.molecule_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4';	toxicology
SELECT element  FROM atom  WHERE atom_id = 'TR000_1';	toxicology
SELECT      CASE          WHEN COUNT(*) > 0 THEN 'Carcinogenic'         ELSE 'Non-carcinogenic'     END AS carcinogenicity FROM      connected      JOIN bond ON connected.bond_id = bond.bond_id      JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.molecule_id = 'TR000'      AND molecule.label = '+';	toxicology
SELECT      (SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percentage FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'n' AND EXISTS (     SELECT 1     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     WHERE b.molecule_id = m.molecule_id     AND EXISTS (         SELECT 1         FROM connected c2         JOIN bond b2 ON c2.bond_id = b2.bond_id         WHERE c2.atom_id = a.atom_id         AND c2.atom_id2 = b2.atom_id         AND c2.bond_id = b.bond_id         AND EXISTS (             SELECT 1             FROM connected c3             WHERE c3.atom_id = b2.atom_id             AND c3.atom_id2 = a.atom_id         )     ) );	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' OR a.element = 'c' OR a.element = 'h' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR024' AND b.bond_id LIKE '%_2' AND a.element IN ('c', 'o', 's', 'n', 'p', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT     (SUM(CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.molecule_id) FROM     atom a JOIN     connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN     bond b ON c.bond_id = b.bond_id JOIN     molecule m ON a.molecule_id = m.molecule_id WHERE     m.molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%')	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id IN (     SELECT DISTINCT m.molecule_id     FROM molecule m     JOIN connected c ON m.molecule_id = c.bond_id     WHERE c.atom_id LIKE 'TR000_%'     AND m.molecule_id LIKE 'TR%'     AND m.molecule_id IN (         SELECT molecule_id         FROM atom         WHERE element = '+'     ) );	toxicology
SELECT COUNT(*) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.molecule_id NOT IN (     SELECT m.molecule_id     FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id     WHERE a.element IN ('c', 'h', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') ) AND m.molecule_id IN (     SELECT m.molecule_id     FROM molecule m     WHERE m.molecule_id = 'TR000' OR m.molecule_id = 'TR001' OR m.molecule_id = 'TR002' OR m.molecule_id = 'TR004' OR m.molecule_id = 'TR006' );	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN connected c ON m.molecule_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND NOT EXISTS (     SELECT 1     FROM bond b2     JOIN connected c ON b2.bond_id = c.bond_id     WHERE b2.molecule_id = m.molecule_id     AND c.bond_id IS NULL );	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR002');	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c' AND b.bond_type = '=' AND a.molecule_id = 'TR012';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id IN ('TR000', 'TR001', 'TR002', 'TR004', 'TR006')   AND a.element = 'o'   AND m.molecule_id LIKE '%+'	toxicology
SELECT id, name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT c.name, c.manaCost FROM cards c WHERE c.borderColor IS NULL AND (c.cardKingdomFoilId IS NULL OR c.cardKingdomId IS NULL) AND c.isFoil = 0;	card_games
SELECT name FROM cards WHERE convertedManaCost < (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT l.uuid, l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      cards.id,     rulings.text AS ruling_text,     cards.hasContentWarning AS has_content_warning FROM      cards LEFT JOIN      rulings ON cards.uuid = rulings.uuid WHERE      cards.artist = 'Stephen Daniel'	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, COUNT(r.uuid) AS ruling_count, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.name, c.artist, c.isPromo ORDER BY ruling_count DESC LIMIT 1;	card_games
SELECT language  FROM foreign_data  WHERE name = 'Annul' AND number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT     (SUM(CASE WHEN `language` = 'Chinese Simplified' THEN 1 ELSE 0 END) / COUNT(`id`)) * 100 AS percentageChineseSimplified FROM     cards;	card_games
SELECT st.translation AS setName, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT `type`)  FROM `cards`  WHERE `artist` = 'Aaron Boyd';	card_games
SELECT `keywords` FROM `cards` WHERE `name` = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT `promoTypes` FROM `cards` WHERE `name` = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `originalType` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT t.language FROM foreign_data AS fd JOIN cards AS c ON fd.uuid = c.uuid JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS t ON s.code = t.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT      rulings.text AS description FROM      rulings JOIN      cards  ON      rulings.uuid = cards.uuid WHERE      cards.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.faceName = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT      r.text AS ruling FROM      rulings r JOIN      cards c ON r.uuid = c.uuid WHERE      c.name = 'Benalish Knight' AND     EXISTS (         SELECT 1         FROM legalities l         WHERE l.uuid = c.uuid AND l.format = 'commander'     );	card_games
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Phyrexian' AND fd.name = 'Phyrexian';	card_games
SELECT      (COUNT(CASE WHEN `cards.borderColor` = 'borderless' THEN `cards.id` END) * 100.0) / COUNT(`cards.id`) AS percentage_borderless FROM `cards`;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'borderless' AND EXISTS (     SELECT 1     FROM foreign_data     WHERE cards.uuid = foreign_data.uuid     AND foreign_data.language = 'Russian' );	card_games
SELECT      (COUNT(CASE WHEN fd.language = 'French' THEN c.id END) * 100.0) / COUNT(c.id) FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM `cards` WHERE `toughness` = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout  FROM cards  WHERE keywords LIKE '%Flying%';	card_games
SELECT COUNT(*) FROM cards WHERE type LIKE '%Summon%'   AND type LIKE '%Angel%'   AND subtypes NOT LIKE '%Angel%';	card_games
SELECT c.id FROM cards c WHERE c.hasFoil = 1 AND c.hasNonFoil = 1 AND c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT `edhrecRank` FROM `cards` WHERE `frameVersion` = '2015';	card_games
SELECT cards.artist  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE set_translations.language = 'Chinese Simplified';	card_games
SELECT c.id, c.name, c.asciiName FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability LIKE '%paper%' AND fd.language = 'Japanese' AND c.availability NOT LIKE '%mtgo%' AND c.availability NOT LIKE '%online%'	card_games
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT      c.uuid,      fd.language  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  JOIN      foreign_data fd ON c.uuid = fd.uuid  WHERE      l.format = 'legacy';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*), GROUP_CONCAT(DISTINCT `cards.id`) AS card_ids, GROUP_CONCAT(DISTINCT `legalities.status`) AS legality_statuses FROM `cards` JOIN `legalities` ON `cards.uuid` = `legalities.uuid` WHERE `cards.frameVersion` = 'future' AND `legalities.status` = 'legal' GROUP BY `cards.id`;	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT `colors`, `format`  FROM `cards`  WHERE `id` BETWEEN 1 AND 20;	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language != 'English';	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NULL;	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'white' AND `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM `cards` WHERE `frameVersion` = '1993' AND `availability` = 'paper' AND `hasContentWarning` = 1;	card_games
SELECT `manaCost` FROM `cards` WHERE `layout` = 'normal' AND `frameVersion` = '2003' AND `borderColor` = 'black' AND `availability` = 'mtgo,paper';	card_games
SELECT SUM(CASE WHEN artist = 'Rob Alexander' THEN convertedManaCost ELSE 0 END) AS total_unconverted_mana_cost FROM cards;	card_games
SELECT DISTINCT type FROM cards WHERE availability = 'arena';	card_games
SELECT cards.setCode FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Spanish';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN `cards`.frameEffects = 'legendary' AND `cards`.isOnlineOnly = 1 THEN 1 END) * 100.0) /          COUNT(CASE WHEN `cards`.frameEffects = 'legendary' THEN 1 END),          2     ) AS legendary_online_percentage FROM      `cards` WHERE      `cards`.frameEffects = 'legendary';	card_games
SELECT      (SUM(CASE WHEN cards.isStorySpotlight = 1 AND cards.isTextless = 0 THEN 1 ELSE 0 END) / COUNT(cards.id)) * 100 AS percentage FROM      cards;	card_games
SELECT      cards.name,     (SUM(CASE WHEN foreign_data.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(cards.id) AS percentage_Spanish FROM      cards JOIN      foreign_data ON cards.uuid = foreign_data.uuid GROUP BY      cards.name ORDER BY      percentage_Spanish DESC;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT id FROM cards WHERE type LIKE '%Creature%' AND id IN (     SELECT uuid     FROM legalities     WHERE status = 'Legal' );	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE subtypes IS NOT NULL AND supertypes IS NOT NULL AND (subtypes LIKE '%Mensch%' OR subtypes LIKE '%Kreatur%' OR subtypes LIKE '%Gott%' OR subtypes LIKE '%Zauber%' OR subtypes LIKE '%Lore%' OR subtypes LIKE '%Land%' OR subtypes LIKE '%Auras%' OR subtypes LIKE '%Enchantments%' OR subtypes LIKE '%Artifacts%' OR subtypes LIKE '%Planeswalkers%') AND (supertypes LIKE '%Creature%' OR supertypes LIKE '%Instant%' OR supertypes LIKE '%Sorcery%' OR supertypes LIKE '%Enchantment%' OR supertypes LIKE '%Artifact%' OR supertypes LIKE '%Land%') AND flavorText LIKE '%German%'	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND EXISTS (     SELECT 1     FROM foreign_data     WHERE cards.uuid = foreign_data.uuid     AND text LIKE '%triggered ability%' );	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'premodern' AND cards.side IS NULL AND EXISTS (     SELECT 1     FROM rulings     WHERE rulings.uuid = cards.uuid     AND rulings.text LIKE '%triggered mana ability%' );	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND EXISTS (     SELECT 1     FROM legalities     WHERE legalities.uuid = cards.uuid AND legalities.format = 'pauper' );	card_games
SELECT ca.artist FROM cards c JOIN card_artists ca ON c.uuid = ca.uuid WHERE c.uuid IN (     SELECT uuid     FROM cards     WHERE text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%' );	card_games
SELECT fd.name AS foreign_name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Matthew D. Wilson'    AND fd.language = 'French'   AND c.borderColor = 'black'   AND c.layout = 'normal'   AND c.type = 'Creature';	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT `language` FROM `sets` WHERE `baseSetSize` = 180 AND `block` = 'Ravnica';	card_games
SELECT      (COUNT(CASE WHEN hasContentWarning = 0 THEN 1 END) * 100.0 / COUNT(id)) AS percentageWithoutContentWarning FROM      cards  JOIN      legalities ON cards.uuid = legalities.uuid WHERE      format = 'commander'      AND status = 'Legal'	card_games
SELECT      (COUNT(CASE WHEN cards.power IS NULL OR cards.power = '*' AND foreign_data.language = 'French' THEN 1 END)      / COUNT(CASE WHEN cards.power IS NULL OR cards.power = '*' THEN 1 END)) * 100 AS percentage_of_cards_without_power_in_French FROM      cards JOIN      foreign_data ON cards.uuid = foreign_data.uuid WHERE      cards.power IS NULL OR cards.power = '*';	card_games
SELECT      (COUNT(CASE WHEN t.language = 'Japanese' THEN 1 END) * 100.0) / COUNT(t.setCode) AS percentage_Japanese_Translated_Expansion_Sets FROM      set_translations t JOIN      sets s ON t.setCode = s.code WHERE      s.type = 'expansion';	card_games
SELECT availability  FROM cards  WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE colorIdentity IS NOT NULL AND borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT      c.id,     c.name,     c.power FROM      cards c WHERE      c.power IS NULL OR c.power = '*'     AND c.promoTypes LIKE '%arenaleague%' ORDER BY      c.name ASC LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN cards.isTextless = 1 AND cards.layout = 'normal' THEN 1 END) * 100.0) / COUNT(cards.id) AS proportion FROM cards;	card_games
SELECT id FROM cards WHERE subtypes LIKE '%Angel%'  AND subtypes LIKE '%Wizard%' AND otherFaceIds IS NULL;	card_games
SELECT `name` FROM `sets` WHERE `mtgoCode` IS NULL OR `mtgoCode` = '' ORDER BY `name` ASC LIMIT 3;	card_games
SELECT DISTINCT t.language FROM sets s JOIN set_translations t ON s.code = t.setCode WHERE s.mcmName = 'Archenemy' AND s.setCode = 'ARC';	card_games
SELECT name, translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.id = 5;	card_games
SELECT      st.language,      s.type FROM      set_translations st JOIN      sets s ON st.setCode = s.code WHERE      s.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND st.translation LIKE '%Shadowmoor%' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT id FROM sets WHERE isFoilOnly = 1 AND isForeignOnly = 1 AND       EXISTS (SELECT 1               FROM set_translations               WHERE sets.code = set_translations.setCode AND language = 'Japanese');	card_games
SELECT s.name, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      (COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM      cards WHERE      language = 'Chinese Simplified';	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT c.name, c.borderColor FROM cards c WHERE c.borderColor = 'black' AND c.isFullArt = 1;	card_games
SELECT `language` FROM `set_translations` WHERE `setCode` = '10E';	card_games
SELECT `name`  FROM `sets`  WHERE `code` = 'ALL';	card_games
SELECT fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.asciiName = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT `sets.baseSetSize`, `sets.code` FROM `sets` WHERE `sets.block` IN ('Masques', 'Mirage');	card_games
SELECT `code`  FROM `sets`  WHERE `type` = 'expansion';	card_games
SELECT      fd.name AS foreign_name,      c.type AS card_type FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.watermark = 'Boros';	card_games
SELECT f.language, f.flavorText, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(c.id) FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Abyssal Horror'	card_games
SELECT code  FROM sets  WHERE type = 'expansion' AND code IN (SELECT setCode FROM legalities WHERE format = 'commander');	card_games
SELECT fd.name AS foreign_name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Abzan';	card_games
SELECT `cards`.`type` FROM `cards` JOIN `set_translations` ON `cards`.`setCode` = `set_translations`.`setCode` WHERE `set_translations`.`translation` LIKE '%Azorius%' AND `cards`.`watermark` = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name  FROM cards  WHERE isTextless = 0;	card_games
SELECT faceConvertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'white' AND (`power` = '*' OR `power` IS NULL);	card_games
SELECT cards.name FROM cards WHERE cards.isPromo = 1 AND cards.side IS NOT NULL;	card_games
SELECT `subtypes`, `supertypes`  FROM `cards`  WHERE `name` = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT c.artist)  FROM cards c WHERE c.borderColor = 'black'  AND c.availability LIKE '%arena,mtgo%';	card_games
SELECT      MAX(c1.convertedManaCost) AS max_convertedManaCost_SerraAngel,      MAX(c2.convertedManaCost) AS max_convertedManaCost_ShrineKeeper FROM      cards c1 JOIN      cards c2 ON c1.convertedManaCost < c2.convertedManaCost WHERE      c1.name = 'Serra Angel' AND      c2.name = 'Shrine Keeper';	card_games
SELECT `artist` FROM `cards` WHERE `flavorName` = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT t.translation  FROM sets s  JOIN set_translations t ON s.code = t.setCode  JOIN cards c ON s.id = c.id  WHERE c.name = 'Ancestor''s Chosen' AND t.language = 'Italian';	card_games
SELECT COUNT(*)  FROM cards  JOIN set_translations ON cards.uuid = set_translations.uuid  WHERE cards.name = 'Angel of Mercy';	card_games
SELECT c.faceName FROM cards c JOIN set_translations st ON c.cardKingdomId = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards     JOIN foreign_data ON cards.uuid = foreign_data.uuid     WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Korean' );	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.uuid = set_translations.translation WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Eighth Edition')  AND language = 'Chinese Simplified';	card_games
SELECT EXISTS (     SELECT 1 FROM cards      JOIN sets ON cards.mtgoFoilId = sets.mtgoCode      WHERE cards.name = 'Angel of Mercy' );	card_games
SELECT `releaseDate` FROM `sets` JOIN `cards` ON `sets.code` = `cards.setCode` WHERE `cards.name` = 'Ancestor''s Chosen';	card_games
SELECT s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;	card_games
SELECT * FROM cards WHERE name = 'Adarkar Valkyrie' AND id IN (     SELECT id     FROM sets     WHERE isForeignOnly = 1 );	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'US' AND borderColor = 'black';	card_games
SELECT name, MAX(convertedManaCost) AS max_cmc FROM cards WHERE setCode = 'Coldsnap' GROUP BY name ORDER BY max_cmc DESC LIMIT 1;	card_games
SELECT DISTINCT artist FROM cards JOIN set_translations ON cards.uuid = set_translations.uuid JOIN sets ON sets.code = set_translations.setCode WHERE sets.code = '10E' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT `cards`.`number` FROM `cards` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` WHERE `sets`.`name` = 'Coldsnap' AND `cards`.`number` = '4';	card_games
SELECT COUNT(*) FROM cards C JOIN sets S ON C.setCode = S.code WHERE S.name = 'Coldsnap' AND C.convertedManaCost > 5 AND (C.power = '*' OR C.power IS NULL);	card_games
SELECT `flavorText` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.name` = 'Ancestor''s Chosen' AND `foreign_data.language` = 'Italian';	card_games
SELECT DISTINCT f.language FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND f.flavorText IS NOT NULL;	card_games
SELECT type FROM foreign_data WHERE language = 'German' AND name = 'Ancestor''s Chosen';	card_games
SELECT      c.name,      st.translation  FROM      cards c  JOIN      set_translations st ON c.setCode = st.setCode  WHERE      st.language = 'Italian' AND      st.setCode = (         SELECT              code          FROM              sets          WHERE              name = 'Coldsnap'     );	card_games
SELECT ft.translation AS cardName FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'Italian' AND c.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT      (SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) /      COUNT(cards.id) AS percentage_of_cards_with_converted_mana_cost_7 FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Coldsnap';	card_games
SELECT   ROUND((SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS incredibly_powerful_percentage FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT `keyruneCode` FROM `sets` WHERE `code` = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT `type` FROM `sets` WHERE `name` LIKE '%From the Vault: Lore%'	card_games
SELECT parentCode  FROM sets  WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, c.hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' ORDER BY c.name;	card_games
SELECT s.releaseDate FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Huitième édition';	card_games
SELECT st.translation FROM `set_translations` st JOIN `sets` s ON st.setCode = s.code JOIN `cards` c ON s.code = c.setCode JOIN `foreign_data` fd ON c.uuid = fd.uuid WHERE fd.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Tenth Edition';	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT `faceName` FROM `cards` WHERE `faceName` = 'Journey into Nyx Hero''s Path' ORDER BY `convertedManaCost` DESC LIMIT 1;	card_games
SELECT releaseDate  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE translation = 'Ola de frío';	card_games
SELECT `sets`.`type`  FROM `cards`  JOIN `sets` ON `cards`.`setCode` = `sets`.`code`  WHERE `cards`.`name` = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'WCD2004' AND convertedManaCost = 3.0;	card_games
SELECT translation FROM set_translations WHERE setCode = 'MIR' AND language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN isNonFoilOnly = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN language = 'Japanese' THEN 1 ELSE 0 END)) * 100 AS percentage_japanese_non_foil FROM      cards JOIN      foreign_data ON cards.uuid = foreign_data.uuid WHERE      language = 'Japanese' AND     isNonFoilOnly = 1;	card_games
SELECT      (SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN s.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END) FROM      cards c JOIN      set_translations st ON c.setCode = st.setCode JOIN      sets s ON st.setCode = s.code WHERE      s.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT c.availability FROM cards c WHERE c.artist = 'Aleksi Briclot' AND c.isTextless = 1;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT `cards.artist` AS Illustrator, `cards.convertedManaCost` AS Cost FROM `cards` WHERE `cards.side` IS NULL AND `cards.convertedManaCost` = (     SELECT MAX(`cards.convertedManaCost`)     FROM `cards`     WHERE `cards.side` IS NULL ) ORDER BY `cards.convertedManaCost` DESC LIMIT 1;	card_games
SELECT MAX(frameEffects) AS most_common_effect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id  FROM sets  WHERE code IN (SELECT setCode FROM set_translations WHERE translation = 'Commander')  ORDER BY totalSetSize DESC  LIMIT 1;	card_games
SELECT      `cards`.`name`,      MAX(`cards`.`convertedManaCost`) AS `highestManaCost` FROM      `cards` JOIN      `legalities` ON `cards`.`uuid` = `legalities`.`uuid` WHERE      `legalities`.`format` = 'duel' GROUP BY      `cards`.`name` ORDER BY      `highestManaCost` DESC LIMIT      10;	card_games
SELECT MIN(originalReleaseDate), legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'mythic' AND legalities.status = 'legal' GROUP BY cards.uuid ORDER BY MIN(originalReleaseDate) LIMIT 1;	card_games
SELECT COUNT(c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT `format`, COUNT(`status = 'Banned'`) AS banned_count FROM `legalities` WHERE `status` = 'Banned' GROUP BY `format` ORDER BY banned_count DESC LIMIT 1;	card_games
SELECT language FROM sets WHERE name = 'Battlebond';	card_games
SELECT      artist,      COUNT(*) AS card_count,      GROUP_CONCAT(DISTINCT format ORDER BY format) AS formats FROM      cards GROUP BY      artist ORDER BY      card_count ASC LIMIT 1;	card_games
SELECT c.name, c.hasContentWarning FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND l.format = 'legacy' AND c.hasContentWarning = 1;	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.edhrecRank = 1 AND legalities.status = 'Banned';	card_games
SELECT AVG(id) AS average_sets_per_year, MAX(COUNT(language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate);	card_games
SELECT DISTINCT `cards.artist` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `cards.borderColor` = 'black' AND `sets.availability` = 'arena';	card_games
SELECT DISTINCT l.uuid FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%';	card_games
SELECT r.id, r.date, r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name AS card_name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language != 'Japanese' AND st.language = 'Korean';	card_games
SELECT DISTINCT frameVersion AS FrameStyle FROM cards WHERE artist = 'Allen Williams';  SELECT name, type FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned';	card_games
SELECT      CASE WHEN u.DisplayName = 'Harlan' THEN 'Harlan' ELSE 'Jarrod Dixon' END AS DisplayName,      MAX(u.Reputation) AS MaxReputation FROM      users u WHERE      u.DisplayName = 'Harlan' OR u.DisplayName = 'Jarrod Dixon' GROUP BY      u.DisplayName;	codebase_community
SELECT `DisplayName` FROM `users` WHERE YEAR(`CreationDate`) = 2011	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT `users.DisplayName` FROM `users` WHERE `users.Id` IN (     SELECT `UserId`     FROM `posts`     GROUP BY `UserId`     ORDER BY SUM(`posts.Views`) DESC     LIMIT 1 );	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.OwnerDisplayName FROM posts p ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT SUM(`CommentCount`) AS TotalComments FROM `posts` WHERE `OwnerDisplayName` = 'csgillespie';	codebase_community
SELECT MAX(AnswerCount)  FROM posts  WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT `LastEditorDisplayName` FROM `posts` WHERE `Tags` LIKE '%Examples for teaching: Correlation does not mean causation%' AND `Id` = (SELECT `ParentId` FROM `posts` WHERE `Tags` LIKE '%Examples for teaching: Correlation does not mean causation%') AND `LastEditorUserId` IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = (SELECT TagName FROM tags GROUP BY TagName ORDER BY MAX(Count) DESC LIMIT 1) ORDER BY t.Count DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(b.badgesCount) AS averageBadges FROM (     SELECT u.Id, COUNT(b.Id) AS badgesCount     FROM users u     JOIN badges b ON u.Id = b.UserId     JOIN posts p ON u.Id = p.OwnerUserId     GROUP BY u.Id     HAVING SUM(p.ViewCount) > 200 ) AS b;	codebase_community
SELECT      (SELECT COUNT(*)       FROM posts p       INNER JOIN users u ON p.OwnerUserId = u.Id       WHERE p.Score > 5 AND u.Age > 65) /      (SELECT COUNT(*)       FROM posts       WHERE Score > 5) * 100 AS PercentageOfElderUsers	codebase_community
SELECT COUNT(*) AS TotalVotes FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT MAX(`CreationDate`)  FROM `votes` WHERE `CreationDate` = (SELECT MAX(`CreationDate`) FROM `votes`);	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments) LIMIT 1;	codebase_community
SELECT c.CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910 AND p.Id = 3;	codebase_community
SELECT SUM(p.FavoriteCount) AS TotalFavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/4/23 20:29:39.0';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND c.CommentCount = 1;	codebase_community
SELECT      p.Id AS PostId,      p.CreaionDate,      p.LastActivityDate,      p.ClosedDate IS NULL AS IsOpen FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT Reputation  FROM users  WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Tiago Pasqualini'	codebase_community
SELECT `users.DisplayName` FROM `votes` JOIN `users` ON `votes.UserId` = `users.Id` WHERE `votes.Id` = 6347;	codebase_community
SELECT SUM(v.VoteTypeId = 2) AS TotalUpvotes FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) AS PostCount,     (SELECT COUNT(*) FROM votes WHERE UserId = 24) AS VoteCount,     (SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) FROM posts JOIN votes ON posts.OwnerUserId = votes.UserId WHERE posts.OwnerUserId = 24) AS PostVoteRatio FROM      posts JOIN votes ON posts.OwnerUserId = 24 GROUP BY      posts.OwnerUserId;	codebase_community
SELECT p.ViewCount FROM posts p WHERE p.OwnerDisplayName = 'user123' AND p.Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName  FROM users  WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT `Name` FROM `badges` JOIN `users` ON `badges.UserId` = `users.Id` WHERE `users.DisplayName` = 'SilentGhost'	codebase_community
SELECT c.UserId, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!'	codebase_community
SELECT `comments.Text` FROM `comments` JOIN `users` ON `comments.UserId` = `users.Id` WHERE `users.DisplayName` = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Body LIKE '%Understanding what Dassault iSight is doing%' AND p.OwnerUserId = u.Id	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT DISTINCT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT p.OwnerDisplayName AS Editor FROM posts p WHERE p.OwnerDisplayName = 'Open source tools for visualizing multi-dimensional data' AND p.LastEditorUserId IS NOT NULL;	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY p.LastEditorUserId, u.WebsiteUrl;	codebase_community
SELECT c.Text AS CommentText, c.UserId, c.CreationDate FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.OwnerDisplayName = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(v.BountyAmount) AS TotalBountyAmount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, p.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'humor' GROUP BY p.Id	codebase_community
SELECT COUNT(c.Id) AS TotalComments FROM comments c WHERE c.UserId = 13;	codebase_community
SELECT `Id` FROM `users` ORDER BY `Reputation` DESC LIMIT 1;	codebase_community
SELECT `UserId`, MIN(`Views`) AS LowestViews FROM `users` WHERE `Views` IS NOT NULL GROUP BY `UserId` ORDER BY LowestViews ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Supporter' AND YEAR(`Date`) = 2011;	codebase_community
SELECT `UserId`, COUNT(`Name`) AS `BadgeCount` FROM `badges` GROUP BY `UserId` HAVING `BadgeCount` > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TeacherSupporterUsersFromNY FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York'	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT p.OwnerUserId FROM posts p WHERE p.ViewCount >= 1000 GROUP BY p.OwnerUserId HAVING COUNT(DISTINCT ph.Id) = 1;	codebase_community
SELECT      c.UserId,      u.DisplayName,      b.Name AS BadgeName FROM      comments c JOIN      users u ON c.UserId = u.Id JOIN      badges b ON c.UserId = b.UserId WHERE      c.UserId IN (         SELECT              UserId          FROM              comments          GROUP BY              UserId          ORDER BY              COUNT(Id) DESC          LIMIT 1     )	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Teacher' AND u.Location = 'India';	codebase_community
SELECT     (         (COUNT(CASE WHEN Year(b.Date) = 2010 THEN 1 END) -           COUNT(CASE WHEN Year(b.Date) = 2011 THEN 1 END)     ) * 100.0 /      (COUNT(CASE WHEN Year(b.Date) = 2010 THEN 1 END) +       COUNT(CASE WHEN Year(b.Date) = 2011 THEN 1 END)     ) AS PercentageDifference FROM badges b WHERE b.Name = 'Student';	codebase_community
SELECT PostHistoryTypeId FROM postHistory WHERE PostId = 3720;  SELECT COUNT(DISTINCT UserId) FROM comments WHERE PostId = 3720;	codebase_community
SELECT p.Id, p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217 UNION SELECT p.Id, p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217;	codebase_community
SELECT `Score`, `LinkTypeId` FROM `posts` WHERE `Id` = 395;	codebase_community
SELECT p.Id, p.OwnerUserId FROM posts p WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Id = 686 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT AVG(u.UpVotes) + AVG(u.Age) / COUNT(DISTINCT p.OwnerUserId) AS AvgUpVotesAndAge FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.OwnerUserId IN (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(*) > 10 );	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges`  WHERE `Name` = 'Announcer';	codebase_community
SELECT b.Id, b.UserId FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Id IN (     SELECT Id     FROM badges     WHERE CAST(CreationDate AS DATETIME) = '2010-07-19 19:39:08.0' )	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Id, SUM(v.VoteType) AS Reputation FROM users u JOIN badges b ON u.Id = b.UserId LEFT JOIN votes v ON u.Id = v.UserId AND v.CreationDate = '2010-07-19 19:39:08.0' WHERE b.CreationDate = '2010-07-19 19:39:08.0' GROUP BY u.Id;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      (COUNT(CASE WHEN b.Name = 'Teacher' THEN b.UserId END) * 100.0) / COUNT(b.UserId) AS TeacherBadgePercentage FROM badges b;	codebase_community
SELECT     ROUND((COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id END) * 100.0) / COUNT(DISTINCT b.UserId), 2) AS Teenager_Percentage FROM     badges b JOIN     users u ON b.UserId = u.Id WHERE     b.Name = 'Organizer'	codebase_community
SELECT c.Score  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.CreaionDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT c.Text FROM comments c WHERE c.CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT `users`.`Age` FROM `users` WHERE `users`.`Location` = 'Vienna, Austria' AND `users`.`Id` IN (     SELECT `badges`.`UserId`     FROM `badges` );	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(p.ViewCount) AS TotalViews FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId WHERE b.Id IN (SELECT Id FROM badges WHERE UserId = (     SELECT UserId FROM badges WHERE CreationDate = '2010-07-19 19:39:08.0' ));	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age > 65;	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE `Id` = 30;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT `users`.`DisplayName`, MAX(`users`.`Views`) AS `MaxViews` FROM `users` GROUP BY `users`.`DisplayName` ORDER BY `MaxViews` DESC;	codebase_community
SELECT      DIVIDE(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END), COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END)) FROM votes;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(v.Id) AS VoteCount FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT `posts`.`Id`  FROM `posts`  JOIN `users` ON `posts`.`OwnerUserId` = `users`.`Id`  WHERE `users`.`DisplayName` = 'slashnick'  ORDER BY `posts`.`AnswerCount` DESC  LIMIT 1;	codebase_community
SELECT      (SELECT MAX(SUM(ViewCount))       FROM posts       WHERE OwnerDisplayName = 'Harvey Motulsky') AS HarveyMotulskyPopularity,     (SELECT MAX(SUM(ViewCount))       FROM posts       WHERE OwnerDisplayName = 'Noah Snyder') AS NoahSnyderPopularity WHERE      HarveyMotulskyPopularity > NoahSnyderPopularity;	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Matt Parker' AND p.PostId > 4	codebase_community
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;	codebase_community
SELECT DISTINCT t.TagName FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN p.Id = p2.PostId AND t.TagName = 'r' THEN 1 END) * 100.0) /          COUNT(CASE WHEN p.OwnerDisplayName = 'Community' THEN 1 END),         2     ) AS percentage FROM      posts p JOIN      tags t ON p.Id = t.ExcerptPostId JOIN      posts p2 ON p2.Id = p.Id WHERE      p.OwnerDisplayName = 'Community' AND      t.TagName = 'r'	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -       SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Mornington', 'Amos')	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Commentator' AND STRFTIME('%Y', `Date`) = '2014';	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT `users.DisplayName`, `users.Age` FROM `users` JOIN `posts` ON `users.Id` = `posts.OwnerUserId` ORDER BY `posts.Views` DESC LIMIT 1;	codebase_community
SELECT `LastEditorUserId`, `LastEditDate` FROM `posts` WHERE `Title` = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score < 60 AND UserId = 13;	codebase_community
SELECT      c.Text AS CommentText,     u.DisplayName AS CommentatorDisplayName FROM      comments c JOIN      users u ON c.UserId = u.Id JOIN      posts p ON c.PostId = p.Id WHERE      c.Score > 60 AND p.Title IS NOT NULL;	codebase_community
SELECT Name FROM badges JOIN users ON badges.UserId = users.Id WHERE YEAR(badges.Date) = 2011 AND users.Location = 'North Pole';	codebase_community
SELECT p.OwnerDisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
SELECT      p.Title,      COUNT(ph.Id) AS PostHistoryCount,      MAX(ph.LastEditDate) AS LastEditDate FROM      posts p JOIN      postHistory ph ON p.Id = ph.PostId WHERE      p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY      p.Id;	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId JOIN posts related_p ON pl.RelatedPostId = related_p.Id WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time';	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreationDate) = 2013 AND YEAR(b.Date) = 2013;	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN tags t ON u.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT      p.Title,      pl.LinkTypeId FROM      posts p JOIN      postLinks pl ON p.Id = pl.PostId WHERE      p.Title = 'What are principal component scores?';	codebase_community
SELECT p.OwnerDisplayName  FROM posts p  WHERE p.ParentId IS NOT NULL  ORDER BY p.Score DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8)	codebase_community
SELECT `Title` FROM `posts` ORDER BY `ViewCount` DESC LIMIT 5;	codebase_community
SELECT COUNT(*) AS tag_count FROM tags JOIN (     SELECT ExcerptPostId, COUNT(*) AS post_count     FROM posts     GROUP BY ExcerptPostId ) AS post_counts ON tags.ExcerptPostId = post_counts.ExcerptPostId WHERE post_counts.post_count BETWEEN 5000 AND 7000;	codebase_community
SELECT `OwnerUserId`  FROM `posts`  WHERE `FavoriteCount` = (SELECT MAX(`FavoriteCount`) FROM `posts`);	codebase_community
SELECT MAX(Age) AS OldestUserAge FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts JOIN votes ON posts.Id = votes.PostId WHERE YEAR(posts.CreationDate) = 2011 AND votes.BountyAmount = 50;	codebase_community
SELECT MIN(Age) AS YoungestUserId FROM `users`	codebase_community
SELECT SUM(`Score`) AS TotalScore FROM `posts` WHERE `LasActivityDate` LIKE '2010-07-19%';	codebase_community
SELECT      COUNT(pl.Id) / 12 AS AverageMonthlyLinks FROM      postLinks pl WHERE      YEAR(pl.CreationDate) = 2010 AND      (SELECT COUNT(c.Id)       FROM comments c       WHERE c.PostId = pl.PostId) <= 2	codebase_community
SELECT PostId FROM posts WHERE OwnerUserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks)	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate) AS FirstVoteDate FROM votes WHERE UserId = (     SELECT Id     FROM users     WHERE DisplayName = 'chl' )	codebase_community
SELECT MIN(CreationDate) AS YoungestUserFirstPostDate FROM posts WHERE OwnerUserId = (SELECT MIN(Id) FROM users);	codebase_community
SELECT users.DisplayName FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Autobiographer' AND badges.Date = (SELECT MIN(Date) FROM badges WHERE Name = 'Autobiographer')	codebase_community
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) AS avg_posts_voted FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT `DisplayName` FROM `users` ORDER BY `Reputation` DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Age` BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens')  AND YEAR(CreaionDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner';	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT      p.Id,      u.DisplayName AS OwnerDisplayName FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      YEAR(p.CreationDate) = 2010 ORDER BY      p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      ROUND((COUNT(CASE WHEN YEAR(posts.CreationDate) = 2011 AND users.Reputation > 1000 THEN 1 END) * 100.0) / COUNT(posts.Id), 2) AS ReputationOver1000Percentage FROM posts JOIN users ON posts.OwnerUserId = users.Id;	codebase_community
SELECT      DIVIDE(COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id ELSE NULL END), COUNT(u.Id)) AS percentage FROM      users u;	codebase_community
SELECT p.ViewCount, u.DisplayName AS LastEditorDisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Body LIKE '%Computer Game Datasets%' AND p.LastEditDate = (     SELECT MAX(LastEditDate)     FROM posts     WHERE Body LIKE '%Computer Game Datasets%' );	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT MAX(Score) AS HighestScore FROM posts UNION ALL SELECT CommentCount FROM posts WHERE Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183;	codebase_community
SELECT `Name` FROM `badges` WHERE `UserId` = (     SELECT `Id`     FROM `users`     WHERE `DisplayName` = 'Emmett' ) ORDER BY `Date` DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT DATEDIFF(b.Date, u.CreationDate) AS TimeToGetBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT      u.Id AS UserId,      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = u.Id) AS PostCount,      (SELECT COUNT(*) FROM comments WHERE UserId = u.Id) AS CommentCount  FROM      users u  WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users);	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT badges.UserId)  FROM badges  WHERE badges.Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts JOIN tags ON posts.Id = tags.ExcerptPostId WHERE tags.TagName = 'careers';	codebase_community
SELECT u.Reputation, p.ViewCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      SUM(CASE WHEN p.Title = 'Clustering 1D data' THEN c.CommentCount ELSE 0 END) AS CommentCount,     SUM(CASE WHEN p.Title = 'Clustering 1D data' THEN p.AnswerCount ELSE 0 END) AS AnswerCount FROM      posts p LEFT JOIN      comments c ON p.Id = c.PostId WHERE      p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate  FROM users  WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30;	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN p.Score > 50 THEN p.Id END) * 100.0) / COUNT(p.Id),         2     ) AS PercentageOfHighScorePosts FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text, MAX(c.Score) as HighestScore FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 GROUP BY c.Text ORDER BY HighestScore DESC LIMIT 1;	codebase_community
SELECT      c.CreationDate,      u.Age FROM      comments c JOIN      users u ON c.UserId = u.Id WHERE      c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT c.PostId)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM posts WHERE CommentCount = 1 AND Id IN (     SELECT PostId     FROM comments     WHERE Score = 0 );	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0	codebase_community
SELECT      ROUND((COUNT(CASE WHEN c.UserId IN (SELECT u.Id FROM users u WHERE u.UpVotes = 0) THEN c.UserId END) * 100.0) /            COUNT(CASE WHEN c.Score BETWEEN 5 AND 10 THEN c.UserId END), 2) AS percentage_users_with_0_upvotes FROM comments c WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM `superpower` sp JOIN `hero_power` hp ON sp.id = hp.power_id JOIN `superhero` sh ON hp.hero_id = sh.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT h.id)  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE c.id = (SELECT id FROM colour WHERE colour_name = 'Blue')  AND sp.power_name = 'Agility';	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name, height_cm FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher_name = 'Marvel Comics' ORDER BY height_cm DESC;	superhero
SELECT `publisher_name`  FROM `publisher`  JOIN `superhero` ON `publisher.id` = `superhero.publisher_id`  WHERE `superhero.superhero_name` = 'Sauron';	superhero
SELECT superhero_name, eye_colour_id, COUNT(*) AS popularity FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher_name = 'Marvel Comics' GROUP BY superhero_name, eye_colour_id ORDER BY popularity DESC;	superhero
SELECT AVG(`height_cm`) AS average_height FROM `superhero` WHERE `publisher_id` = (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics')	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = (     SELECT MIN(ha2.attribute_value)     FROM superhero s2     JOIN hero_attribute ha2 ON s2.id = ha2.hero_id     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Speed' )	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond';	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT race FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT s.superhero_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN gender g ON s.gender_id = g.id WHERE g.id = 2 AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.power_id) DESC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE id = 4);	superhero
SELECT      ROUND(         (COUNT(CASE WHEN s.alignment_id = 2 THEN 1 END) * 100.0) / COUNT(*),          2     ) AS bad_alignment_percentage,     COUNT(CASE WHEN s.alignment_id = 2 THEN 1 END) AS bad_alignment_count FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics';	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT s.power_name FROM superhero AS h JOIN hero_power AS hp ON h.id = hp.hero_id JOIN superpower AS s ON hp.power_id = s.id JOIN gender AS g ON h.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm BETWEEN 170 AND 190  AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT sp.power_name FROM `superpower` sp JOIN `hero_power hp` ON sp.id = hp.power_id WHERE hp.hero_id = 56;	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `id` = 2) LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT `race_id` FROM `superhero` WHERE `weight_kg` = 169;	superhero
SELECT      c.colour  FROM      superhero s  JOIN      colour c ON s.hair_colour_id = c.id  WHERE      s.height_cm = 185      AND s.race_id = (SELECT id FROM race WHERE race = 'human');	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id),         2     ) AS percentage_marvel_heroes FROM      superhero s WHERE      s.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM `superpower` sp JOIN `hero_power` hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value  FROM hero_attribute ha  JOIN superhero s ON ha.hero_id = s.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM `superpower` sp JOIN `hero_power` hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' )	superhero
SELECT AVG(s.id)  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE c.id = 1;	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour  FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';	superhero
SELECT      s.superhero_name,      c1.colour_name AS eye_colour,      c2.colour_name AS hair_colour,      c3.colour_name AS skin_colour FROM      superhero s JOIN      colour c1 ON s.eye_colour_id = c1.id JOIN      colour c2 ON s.hair_colour_id = c2.id JOIN      colour c3 ON s.skin_colour_id = c3.id JOIN      gender g ON s.gender_id = g.id JOIN      publisher p ON s.publisher_id = p.id WHERE      g.id = 2 AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id JOIN publisher p ON s.publisher_id = p.id WHERE c1.id = c2.id AND c1.id = c3.id;	superhero
SELECT `race`.`id`, `race`.`race_name` FROM `superhero` JOIN `race` ON `superhero`.`race_id` = `race`.`id` WHERE `superhero`.`superhero_name` = 'A-Bomb';	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END),          2     ) AS percentage_blue_female FROM      superhero s JOIN      colour c ON s.skin_colour_id = c.id WHERE      s.gender_id = 2;	superhero
SELECT `superhero_name`, `race_id` FROM `superhero` WHERE `full_name` = 'Charles Chandler';	superhero
SELECT gender_id  FROM superhero  WHERE superhero_name = 'Agent 13';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM `hero_power`  JOIN `superhero` ON `hero_power.hero_id` = `superhero.id`  WHERE `superhero.superhero_name` = 'Amazo';	superhero
SELECT sp.power_name FROM superhero AS sz JOIN hero_power AS hp ON sz.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sz.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND superhero.hair_colour_id = colour.id WHERE colour.colour = 'Black';	superhero
SELECT `superhero_name`, `colour.colour` FROM `superhero` JOIN `colour` ON `superhero.skin_colour_id` = `colour.id` WHERE `colour.colour` = 'Gold';	superhero
SELECT `superhero`.`full_name` FROM `superhero` JOIN `race` ON `superhero`.`race_id` = `race`.`id` WHERE `race`.`race` = 'Vampire';	superhero
SELECT superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(DISTINCT ha.hero_id) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' );	superhero
SELECT      s.race_id,      a.alignment_name FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id WHERE      s.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = 2 AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END),         2     ) AS percentage_female_heroes_by_marvel FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE race_id IN (SELECT id FROM race WHERE id = 33);	superhero
SELECT (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') -         (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT `superhero_name` FROM `superhero` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` WHERE `attribute_name` = 'Speed' AND `attribute_value` = (     SELECT MAX(`attribute_value`)     FROM `hero_attribute`     JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id`     WHERE `attribute_name` = 'Speed' )	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE ha.hero_id = (SELECT id FROM superhero WHERE superhero_name = '3-D Man');	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id AND eye_colour.colour = 'Blue' JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id AND hair_colour.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = 1;	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id),          2     ) AS blue_eyes_percentage FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id;	superhero
SELECT      (SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END)) AS male_female_ratio FROM superhero;	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT id FROM `superpower` WHERE `power_name` = 'cryokinesis';	superhero
SELECT superhero_name  FROM superhero  WHERE id = 294;	superhero
SELECT `superhero_name`, `full_name` FROM `superhero` WHERE `weight_kg` IS NULL OR `weight_kg` = 0;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT race_id  FROM superhero  WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT p.publisher_name  FROM superhero AS s  JOIN publisher AS p ON s.publisher_id = p.id  WHERE s.id = 38;	superhero
SELECT s.race_id FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute )	superhero
SELECT      s.alignment_id,      sp.power_name FROM      superhero s JOIN      hero_power hp ON s.id = hp.hero_id JOIN      superpower sp ON hp.power_id = sp.id WHERE      s.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.alignment_id = 3;	superhero
SELECT s.superhero_name, c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id = 2 AND alignment_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.full_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN colour c ON s.hair_colour_id = c.id JOIN gender g ON s.gender_id = g.id WHERE c.colour = 'Blue' AND g.gender = 'Male';	superhero
SELECT      ROUND((SUM(CASE WHEN alignment.id = 2 AND gender.id = 2 THEN 1 ELSE 0 END) / SUM(CASE WHEN alignment.id = 2 THEN 1 ELSE 0 END)) * 100.0, 2) AS percentage_female_bad_heroes FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.alignment = 'Bad';	superhero
SELECT      (SELECT COUNT(*) FROM superhero AS T2 WHERE T2.eye_colour_id = 7 AND T2.weight_kg IS NULL OR T2.weight_kg = 0) -      (SELECT COUNT(*) FROM superhero AS T2 WHERE T2.eye_colour_id = 1 AND T2.weight_kg IS NULL OR T2.weight_kg = 0) AS difference FROM DUAL;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk';	superhero
SELECT sp.power_name FROM superhero AS sup JOIN hero_power AS hp ON sup.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sup.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Wind Control'  ORDER BY superhero_name ASC;	superhero
SELECT s.gender_id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, MAX(weight_kg) as MaxWeight FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') GROUP BY superhero_name ORDER BY MaxWeight DESC LIMIT 1;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE race_id NOT IN (SELECT id FROM race WHERE id = 1) AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT s.id, s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) -      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference	superhero
SELECT a.attribute_name FROM `attribute` a JOIN `hero_attribute` ha ON a.id = ha.attribute_id JOIN `superhero` s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name, `full_name`, height_cm FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.publisher_name = 'George Lucas' AND g.gender_name = 'Female' THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN s.publisher_name = 'George Lucas' THEN 1 ELSE 0 END),         2     ) AS female_percentage FROM      superhero s JOIN      gender g ON s.gender_id = g.id WHERE      s.publisher_name = 'George Lucas';	superhero
SELECT      ROUND((COUNT(CASE WHEN alignment_id = 1 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_good_heroes FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id  FROM hero_attribute  ORDER BY attribute_value  LIMIT 1;	superhero
SELECT `superhero_name`, `full_name` FROM `superhero` WHERE `superhero_name` = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.id = 1 AND s.weight_kg < 100;	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT weight_kg, race_id FROM superhero WHERE id = 40;	superhero
SELECT AVG(`height_cm`) AS avg_height FROM `superhero` WHERE `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Neutral');	superhero
SELECT hp.hero_id FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';	superhero
SELECT `colour.colour` FROM `superhero` JOIN `colour` ON `superhero.eye_colour_id` = `colour.id` WHERE `superhero.superhero_name` = 'Blackwulf';	superhero
SELECT s.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower s ON hp.power_id = s.id WHERE su.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q1 IN (     SELECT MAX(q1)     FROM qualifying     WHERE raceId = 20     GROUP BY raceId     ORDER BY MAX(q1) DESC     LIMIT 5 );	formula_1
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19) AND d.driverRef LIKE '%s';	formula_1
SELECT DISTINCT s.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN circuits AS shanghai ON shanghai.name = 'Shanghai' WHERE c.name = shanghai.name;	formula_1
SELECT `url` FROM `circuits` WHERE `url` LIKE '%Circuit de Barcelona-Catalunya%';	formula_1
SELECT r.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country = 'Germany';	formula_1
SELECT c.name, cs.position FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors con ON cr.constructorId = con.constructorId JOIN constructorStandings cs ON cr.constructorId = cs.constructorId WHERE con.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId NOT IN (     SELECT circuitId     FROM circuits     WHERE country IN ('Malaysia', 'Bahrain', 'Turkey', 'Monaco', 'Spain') )	formula_1
SELECT r.name  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.country = 'Spain';	formula_1
SELECT `circuits`.`lat`, `circuits`.`lng` FROM `circuits` INNER JOIN `races` ON `circuits`.`circuitId` = `races`.`circuitId` WHERE `races`.`name` = 'Australian Grand Prix';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Malaysia';	formula_1
SELECT `lat`, `lng` FROM `circuits` WHERE `name` = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors co ON cr.constructorId = co.constructorId JOIN constructorStandings cs ON cr.constructorId = cs.constructorId WHERE cr.points = 1.0 AND r.raceId = 24;	formula_1
SELECT `q1` FROM `qualifying` JOIN `drivers` ON `qualifying.driverId` = `drivers.driverId` WHERE `drivers.surname` = 'Senna' AND `qualifying.raceId` = (SELECT `raceId` FROM `races` WHERE `raceId` = 354);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '00:01:40' AND q.raceId = 355;	formula_1
SELECT q.driverId FROM qualifying q WHERE q.q3 LIKE '0:01:54%' AND q.raceId = 903;	formula_1
SELECT COUNT(*) FROM `results` JOIN `races` ON `results.raceId` = `races.raceId` WHERE `races.name` = 'Bahrain Grand Prix' AND `results.time` IS NULL;	formula_1
SELECT seasons.year FROM seasons JOIN races ON seasons.year = races.year WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT `driverId`)  FROM `results`  WHERE `raceId` IN (     SELECT `raceId`      FROM `races`      WHERE `date` = '2015-11-29' AND `statusId` = (         SELECT `statusId`          FROM `status`          WHERE `status` = 'Finished'     ) )	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.raceId = 592 AND d.dob IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT      d.driverRef,      d.url  FROM      lapTimes lt  JOIN      drivers d ON lt.driverId = d.driverId  JOIN      races r ON lt.raceId = r.raceId  WHERE      lt.time LIKE '0:01:27%'      AND r.raceId = 161;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933);	formula_1
SELECT `location`, `lat`, `lng` FROM `circuits` JOIN `races` ON `circuits.circuitId` = `races.circuitId` WHERE `races.name` = 'Malaysian Grand Prix'	formula_1
SELECT constructors.url FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId JOIN races ON races.raceId = constructorResults.raceId WHERE races.raceId = 9 ORDER BY constructorResults.points DESC LIMIT 1;	formula_1
SELECT position  FROM qualifying  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE drivers.forename = 'Lucas' AND drivers.surname = 'di Grassi'  AND qualifying.raceId = (SELECT raceId FROM races WHERE raceId = 345);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 347 AND q.q2 = '00:01:15';	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 LIKE '0:01%'	formula_1
SELECT `results`.`time` FROM `results` JOIN `drivers` ON `results`.`driverId` = `drivers`.`driverId` WHERE `drivers`.`surname` = 'McLaren' AND `results`.`raceId` = 743;	formula_1
SELECT d.driverRef, d.surname FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'San Marino Grand Prix' AND r.year = 2006 AND ds.position = 2;	formula_1
SELECT seasons.url FROM seasons JOIN races ON seasons.year = races.year WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29' AND r.statusId = 1;	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      d.dob FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.raceId = 872 AND      r.time IS NOT NULL ORDER BY      d.dob ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = (SELECT raceId FROM races WHERE `number` = 348) AND lt.time = (SELECT MIN(time) FROM lapTimes lt2 WHERE lt2.raceId = lt.raceId)	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN (     SELECT MAX(fastestLapSpeed) AS max_speed     FROM results ) AS max_speed_query ON r.fastestLapSpeed = max_speed_query.max_speed;	formula_1
SELECT      (SUBSTR(MAX(`fastestLapSpeed`), 1, LENGTH(MAX(`fastestLapSpeed`)) - 2) * 100.0 /      SUBSTR((SELECT `fastestLapSpeed` FROM `results` WHERE `driverId` =          (SELECT `driverId` FROM `drivers` WHERE `forename` = 'Paul' AND `surname` = 'di Resta'), 1, LENGTH(MAX(`fastestLapSpeed`)) - 2) -      SUBSTR((SELECT `fastestLapSpeed` FROM `results` WHERE `raceId` =          (SELECT `raceId` FROM `races` WHERE `name` = 'No. 854'), 1, LENGTH(MAX(`fastestLapSpeed`)) - 2))      ) AS percentage_faster FROM `results` WHERE `driverId` =      (SELECT `driverId` FROM `drivers` WHERE `forename` = 'Paul' AND `surname` = 'di Resta')	formula_1
SELECT      d.driverRef,     (COUNT(CASE WHEN lt.time IS NOT NULL THEN 1 END) * 100.0 / COUNT(d.driverId)) AS completionRate FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      lt.raceId IN (         SELECT              raceId          FROM              races          WHERE              DATE(date) = '1983-07-16'     ) GROUP BY      d.driverRef;	formula_1
SELECT MIN(year)  FROM races  WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) AS TotalRaces, r.name AS RaceName FROM races r JOIN seasons s ON r.year = s.year WHERE s.year = 2005 ORDER BY r.name DESC;	formula_1
SELECT r.name FROM races r JOIN seasons s ON r.year = s.year WHERE r.year = (SELECT MIN(year) FROM seasons) AND       MONTH(r.time) = (SELECT MONTH(MIN(time)) FROM races WHERE year = (SELECT MIN(year) FROM seasons));	formula_1
SELECT      r.name,      r.date FROM      races r JOIN      seasons s ON r.year = s.year WHERE      s.year = 1999 ORDER BY      r.round DESC LIMIT 1;	formula_1
SELECT `seasons`.`year`, COUNT(`races`.`round`) AS `race_count` FROM `seasons` JOIN `races` ON `seasons`.`year` = `races`.`year` GROUP BY `seasons`.`year` ORDER BY `race_count` DESC LIMIT 1;	formula_1
SELECT r.name FROM races r WHERE r.year = 2017 AND r.raceId NOT IN (     SELECT r2.raceId     FROM races r2     WHERE r2.year = 2000 );	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = (SELECT MIN(year) FROM seasons WHERE name LIKE '%European Grand Prix%') AND c.country = 'Europe';	formula_1
SELECT MAX(year)  FROM races  WHERE circuitId = (SELECT circuitId FROM circuits WHERE country = 'Britain')  AND name = 'British Grand Prix';	formula_1
SELECT COUNT(DISTINCT r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.country = 'United Kingdom' AND r.name = 'British Grand Prix';	formula_1
SELECT      d.driverRef,      ds.position FROM      driverStandings ds JOIN      drivers d ON ds.driverId = d.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      r.name = 'Singapore Grand Prix' AND      r.year = 2010 ORDER BY      ds.position;	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.points = (SELECT MAX(points) FROM driverStandings);	formula_1
SELECT d.driverId, d.name, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name AS race_name, MIN(l(milliseconds)) AS best_lap_milliseconds FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId GROUP BY d.driverId, r.raceId ORDER BY best_lap_milliseconds LIMIT 1;	formula_1
SELECT AVG(lt.milliseconds) AS average_lap_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Malaysian Grand Prix';	formula_1
SELECT      (COUNT(CASE WHEN d.surname = 'Hamilton' AND r.position > 1 THEN r.raceId END) * 100.0) /      COUNT(CASE WHEN d.surname = 'Hamilton' THEN r.raceId END) AS percentage FROM      results r JOIN      drivers d ON r.driverId = d.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.year >= 2010	formula_1
SELECT      d.forename,      d.surname,      d.nationality,      ddr.wins,      ddr.points FROM      drivers d JOIN      (SELECT           ds.driverId,           MAX(ds.wins) AS wins,           MAX(ds.points) AS points      FROM           driverStandings ds      GROUP BY           ds.driverId) ddr ON d.driverId = ddr.driverId WHERE      ddr.wins = (SELECT                       MAX(wins)                   FROM                       driverStandings);	formula_1
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS age, surname, forename FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT c.circuitId, c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId, c.country HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name AS CircuitName, c.location AS CircuitLocation, r.name AS RaceName FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2006 AND c.country = 'USA';	formula_1
SELECT r.name AS RaceName, c.location AS CircuitLocation FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name AS RaceName FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND rs.position < 20;	formula_1
SELECT COUNT(*) FROM `driverStandings` ds JOIN `drivers` d ON ds.driverId = d.driverId JOIN `races` r ON ds.raceId = r.raceId JOIN `circuits` c ON r.circuitId = c.circuitId JOIN `results` res ON ds.driverId = res.driverId AND ds.raceId = res.raceId WHERE d.surname = 'Schumacher' AND c.country = 'Malaysia' AND res.points = (     SELECT MAX(points)     FROM `driverStandings`     WHERE driverId = ds.driverId AND raceId = ds.raceId );	formula_1
SELECT r.name AS race, r.year FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(points)  FROM driverStandings  JOIN seasons ON driverStandings.raceId IN (SELECT raceId FROM races WHERE year = 2000)  JOIN drivers ON driverStandings.driverId = drivers.driverId  WHERE drivers.surname = 'Irvine';	formula_1
SELECT      r.name AS RaceName,      ds.points FROM      driverStandings ds JOIN      races r ON ds.raceId = r.raceId JOIN      drivers d ON ds.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY      r.year ASC LIMIT 1;	formula_1
SELECT r.name, c.country FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name AS RaceName, s.year AS RaceYear, c.location AS CircuitLocation, MAX(r.laps) AS MostLaps FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN (     SELECT raceId, SUM(laps) AS laps     FROM results     GROUP BY raceId ) AS res ON r.raceId = res.raceId GROUP BY r.name, s.year, c.location ORDER BY MostLaps DESC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN circuits.country = 'Germany' THEN 1 END) * 100.0) / COUNT(*) AS percentage_german_races FROM      races JOIN      circuits ON races.circuitId = circuits.circuitId WHERE      races.name = 'European Grand Prix';	formula_1
SELECT lat, lng  FROM circuits  WHERE name = 'Silverstone Circuit';	formula_1
SELECT `location` FROM `circuits` WHERE `location` IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY ABS(69.3226) DESC LIMIT 1;	formula_1
SELECT `circuitRef`  FROM `circuits`  WHERE `name` = 'Marina Bay Street Circuit';	formula_1
SELECT `country` FROM circuits WHERE `alt` = (SELECT MAX(`alt`) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT d.surname, c.country FROM drivers d JOIN circuits c ON d.nationality = c.country ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT `surname` FROM `drivers` WHERE `nationality` = 'Italian';	formula_1
SELECT url  FROM drivers  WHERE driverRef = 'davidson';	formula_1
SELECT driverRef  FROM drivers  WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT `country`  FROM `circuits`  JOIN `races` ON `circuits.circuitId` = `races.circuitId`  WHERE `races.year` = 2009 AND `races.name` = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Silverstone';	formula_1
SELECT      r.raceId,      r.name AS raceName,      r.date,      r.time,      c.name AS circuitName,      c.url AS circuitURL FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      c.circuitRef = 'silverstone';	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Abu Dhabi Circuit' AND YEAR(r.year) = 2010;	formula_1
SELECT COUNT(*) FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT r.date  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.country = 'Spain' AND r.name = 'Spanish Grand Prix';	formula_1
SELECT url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Spanish Grand Prix' AND YEAR(races.date) = 2009;	formula_1
SELECT MIN(`fastestLapTime`) AS `fastestLapTime` FROM `results` JOIN `drivers` ON `results.driverId` = `drivers.driverId` WHERE `drivers.driverRef` = 'hamilton'	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM lapTimes);	formula_1
SELECT d.driverRef FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND ds.position = 1 AND ds.year = 2007;	formula_1
SELECT r.name AS RaceName, r.date AS RaceDate FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT      r.name AS race_name,      ds.positionText AS position FROM      results r JOIN      driverStandings ds ON r.driverId = ds.driverId JOIN      drivers d ON ds.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY      ds.rank ASC LIMIT 1;	formula_1
SELECT MAX(`fastestLapSpeed`)  FROM `results`  JOIN `races` ON `results.raceId` = `races.raceId`  WHERE `races.name` = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT s.year  FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.driverRef = 'hamilton';	formula_1
SELECT `positionOrder` FROM `driverStandings` JOIN `drivers` ON `driverStandings.driverId` = `drivers.driverId` JOIN `races` ON `driverStandings.raceId` = `races.raceId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton' AND `races.name` = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.grid = 4 AND r.raceId = (SELECT raceId FROM races WHERE year = 1989 AND name = 'Australian Grand Prix');	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM results r  JOIN driverStandings ds ON r.driverId = ds.driverId  JOIN drivers d ON ds.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Australian Grand Prix'  AND r.time IS NOT NULL;	formula_1
SELECT MIN(`lap`) AS `fastestLap` FROM `lapTimes` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `driverRef` = 'hamilton') AND `raceId` = (SELECT `raceId` FROM `races` WHERE `year` = 2008 AND `circuitId` = 1);	formula_1
SELECT r.time FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE r.name = 'Australian Grand Prix'    AND d.driverRef = 'alonso'    AND r.year = 2008;	formula_1
SELECT      d.forename,      d.surname,      d.url FROM      driverStandings ds JOIN      drivers d ON ds.driverId = d.driverId JOIN      races r ON ds.raceId = r.raceId JOIN      seasons s ON r.year = s.year WHERE      s.year = 2008 AND     r.name = 'Australian Grand Prix' AND     ds.position = 1 AND     d.time LIKE 'HH:%';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'British' AND ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.position IS NOT NULL;	formula_1
SELECT SUM(`points`) AS total_points FROM `driverStandings` JOIN `drivers` ON `driverStandings.driverId` = `drivers.driverId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton';	formula_1
SELECT AVG(TIME_TO_SEC(`fastestLapTime`)) AS average_fastest_lap_time FROM `results` JOIN `drivers` ON `results.driverId` = `drivers.driverId` WHERE `drivers.surname` = 'Hamilton';	formula_1
SELECT      (SELECT COUNT(*)       FROM results AS r       INNER JOIN races AS ra ON r.raceId = ra.raceId       WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time IS NOT NULL)      /      (SELECT COUNT(DISTINCT r.raceId)       FROM results AS r       INNER JOIN races AS ra ON r.raceId = ra.raceId       WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix') AS completionRate;	formula_1
SELECT      ((TIME_TO_SEC(TIMEDIFF(last_driver_time, champion_time)) / TIME_TO_SEC(champion_time)) * 100) AS percentage_faster FROM (     SELECT          (SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 AND position = 1)) AS champion_time,         (SELECT time FROM results r1           JOIN (              SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 ORDER BY position DESC LIMIT 1          ) AS last_race ON r1.raceId = last_race.raceId          WHERE r1.position = (SELECT MAX(position) FROM results WHERE raceId = last_race.raceId)         ) AS last_driver_time ) AS time_diff;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT `location` FROM `circuits` WHERE `country` = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(points) AS max_points FROM constructorStandings WHERE nationality = 'British' AND raceId IN (     SELECT raceId     FROM races     JOIN circuits ON races.circuitId = circuits.circuitId     WHERE circuits.country = 'United Kingdom' )	formula_1
SELECT c.name, SUM(cr.points) AS total_points FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name  FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(DISTINCT cr.constructorId) FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY cr.constructorId HAVING COUNT(DISTINCT cr.raceId) = 2;	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT constructorId)  FROM lapTimes  JOIN constructors ON lapTimes.driverId IN (SELECT driverId FROM drivers WHERE nationality = 'French')  WHERE lap > 50;	formula_1
SELECT      (COUNT(DISTINCT d.driverId)      / (SELECT COUNT(DISTINCT d.driverId)         FROM drivers d         INNER JOIN driverStandings ds ON d.driverId = ds.driverId         INNER JOIN races r ON ds.raceId = r.raceId         WHERE d.nationality = 'Japanese'         AND r.year BETWEEN 2007 AND 2009 AND ds.time IS NOT NULL)) * 100 AS race_completion_percentage FROM      drivers d  INNER JOIN      driverStandings ds ON d.driverId = ds.driverId  INNER JOIN      races r ON ds.raceId = r.raceId  WHERE      d.nationality = 'Japanese'      AND r.year BETWEEN 2007 AND 2009      AND ds.time IS NOT NULL;	formula_1
SELECT      s.year,     AVG(TIMESTAMPDIFF(SECOND, '00:00:00', SUBSTRING_INDEX(results.time, '.', 1))) AS avg_champion_time FROM      results JOIN      seasons s ON results.raceId IN (SELECT raceId FROM races WHERE year < 1975) JOIN      (SELECT raceId, MAX(position) as position FROM results WHERE statusId = 1 GROUP BY raceId) AS champions ON      results.raceId = champions.raceId AND results.position = champions.position WHERE      results.statusId = 1 GROUP BY      s.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     WHERE ds.driverId = d.driverId     AND ds.position = 2 )	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  JOIN constructors c ON c.constructorId = ds.constructorId  WHERE c.nationality = 'Italian'  AND ds.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.time = (SELECT MIN(time) FROM lapTimes);	formula_1
SELECT lap FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN driverStandings ON lapTimes.driverId = driverStandings.driverId JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE races.year = 2009 AND driverStandings.position = 1 AND drivers.driverRef = (SELECT driverRef FROM driverStandings JOIN results ON driverStandings.driverId = results.driverId WHERE results.raceId = races.raceId AND results.position = 1) ORDER BY lapTimes.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapSpeed) AS averageFastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT r.name, r.year FROM races r JOIN (     SELECT raceId, MIN(milliseconds) AS MinTime     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) AS rt ON r.raceId = rt.raceId ORDER BY rt.MinTime ASC LIMIT 1;	formula_1
SELECT     ROUND(         (COUNT(CASE WHEN drivers.dob < '1985-01-01' AND lapTimes.lap > 50 THEN drivers.driverId END) * 100.0) /         COUNT(DISTINCT drivers.driverId),         2     ) AS percentage_of_drivers FROM     drivers JOIN     lapTimes ON drivers.driverId = lapTimes.driverId JOIN     results ON drivers.driverId = results.driverId JOIN     races ON results.raceId = races.raceId JOIN     seasons ON races.year = seasons.year WHERE     seasons.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(*) FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE drivers.forename LIKE 'S%' AND SUBSTRING(lapTimes.time, 1, 2) < 2;	formula_1
SELECT code  FROM drivers  WHERE nationality = 'American';	formula_1
SELECT raceId  FROM races  WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT `driverId`)  FROM `driverStandings`  WHERE `raceId` = 18;	formula_1
SELECT d.driverId, d.number FROM drivers d WHERE d.nationality = 'Dutch' AND d.dob = (SELECT MIN(dob) FROM drivers) OR d.dob = (SELECT MIN(dob) FROM drivers d2 WHERE d2.nationality = 'Dutch' AND d2.dob > (SELECT MIN(dob) FROM drivers)) OR d.dob = (SELECT MIN(dob) FROM drivers d3 WHERE d3.nationality = 'Dutch' AND d3.dob > (SELECT MIN(dob) FROM drivers d2 WHERE d2.nationality = 'Dutch' AND d2.dob > (SELECT MIN(dob) FROM drivers))) ORDER BY d.dob DESC LIMIT 3;	formula_1
SELECT `driverRef` FROM `drivers` WHERE `surname` = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT      d.driverRef,      d.forename,      d.surname,      MIN(lt.time) AS EarliestLapTime FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId JOIN      constructors c ON d.nationality = c.nationality WHERE      c.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY      d.driverId, d.driverRef, d.forename, d.surname ORDER BY      EarliestLapTime ASC LIMIT 3;	formula_1
SELECT d.driverRef  FROM drivers d  WHERE d.nationality = 'German'  ORDER BY d.dob  LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob BETWEEN '1971-01-01' AND '1971-12-31' AND r.fastestLap IS NOT NULL ORDER BY r.fastestLapTime ASC LIMIT 1;	formula_1
SELECT d.driverRef, d.forename, d.surname, d.dob, lt.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish' AND d.dob < '1982-01-01' ORDER BY lt.time DESC LIMIT 10;	formula_1
SELECT r.year FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN lapTimes lt ON rs.driverId = lt.driverId AND rs.raceId = lt.raceId WHERE lt.fastestLap IS NOT NULL ORDER BY lt.fastestLapTime ASC LIMIT 1;	formula_1
SELECT races.year, MAX(STR_TO_REAL(SUBSTRING(time, 1, LENGTH(time) - 3))) AS max_lap_time FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId GROUP BY races.year ORDER BY max_lap_time LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r JOIN status s ON r.statusId = s.statusId WHERE r.raceId > 50 AND r.raceId < 100 AND r.time IS NULL AND s.status = 'Disqualified';	formula_1
SELECT c.name, c.location, (c.lat, c.lng) AS coordinates FROM circuits c WHERE c.country = 'Austria';	formula_1
SELECT      r.round  FROM      races r  JOIN      results res ON r.raceId = res.raceId  WHERE      res.time IS NOT NULL  GROUP BY      r.round  ORDER BY      COUNT(*) DESC  LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT s.year, d.forename, d.surname, r.date, r.time FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN (     SELECT MIN(dob) as min_dob     FROM drivers ) youngest ON d.dob = youngest.min_dob JOIN seasons s ON r.year = s.year WHERE d.driverId = (     SELECT driverId     FROM drivers     ORDER BY dob DESC     LIMIT 1 );	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.statusId = 3;	formula_1
SELECT c.name, c.url FROM constructors c WHERE c.nationality = 'Italian' ORDER BY c.points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN (     SELECT constructorId, SUM(wins) as total_wins     FROM constructorStandings     GROUP BY constructorId     ORDER BY total_wins DESC     LIMIT 1 ) AS topConstructor ON c.constructorId = topConstructor.constructorId;	formula_1
SELECT d.driverRef, d.surname, MAX(lt.time) AS slowest_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 GROUP BY d.driverRef, d.surname ORDER BY slowest_time;	formula_1
SELECT r.name, MIN(lt.milliseconds) AS fastestLapTime FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE lt.position = 1 AND lt.lap = 1 GROUP BY r.raceId, r.name ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(`fastestLapTime`) AS avg_fastest_lap_time FROM `results` WHERE `positionOrder` < 11 AND `raceId` IN (     SELECT `raceId`     FROM `races`     WHERE `name` = 'United States Grand Prix'     AND `year` = 2006 );	formula_1
SELECT d.driverRef, AVG(T.duration) AS avg_pit_stop_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverRef ORDER BY avg_pit_stop_duration ASC LIMIT 3;	formula_1
SELECT d.driverRef, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1 ORDER BY r.points DESC LIMIT 1;	formula_1
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON constructorStandings.raceId = races.raceId WHERE races.name = 'Singapore Grand Prix' AND races.year = 2009 AND constructorStandings.position = 1;	formula_1
SELECT `forename`, `surname` FROM `drivers` WHERE `nationality` = 'Austrian' AND `dob` BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT CONCAT(d.forename, ' ', d.surname) AS fullName, d.url, d.dob FROM drivers d WHERE d.nationality = 'German' AND d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY d.dob DESC;	formula_1
SELECT location, country, lat, `lng` FROM circuits WHERE circuitRef = 'hungaroring';	formula_1
SELECT      c.constructorId,      c.nationality,      SUM(cr.points) AS total_points FROM      constructors c JOIN      constructorResults cr ON c.constructorId = cr.constructorId JOIN      races r ON cr.raceId = r.raceId WHERE      r.name = 'Monaco Grand Prix' AND     r.year BETWEEN 1980 AND 2010 GROUP BY      c.constructorId ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM driverStandings JOIN races ON driverStandings.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.driverRef = 'hamilton' AND circuits.country = 'Turkey';	formula_1
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM races WHERE year BETWEEN 2000 AND 2010;	formula_1
SELECT nationality  FROM drivers  GROUP BY nationality  ORDER BY COUNT(*) DESC  LIMIT 1;	formula_1
SELECT SUM(CASE WHEN ds.position = 1 THEN 1 ELSE 0 END) AS victories FROM driverStandings ds WHERE ds.points = 91;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId JOIN lapTimes lt ON d.driverId = lt.driverId AND res.raceId = lt.raceId WHERE lt.fastestLapTime = (SELECT MIN(fastestLapTime) FROM lapTimes) ORDER BY lt.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT CONCAT(c.name, ', ', ci.country) AS full_location FROM races r JOIN circuits ci ON r.circuitId = ci.circuitId WHERE r.date = (SELECT MAX(date) FROM races)	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.name = 'Malaysian Grand Prix' AND r.year = 2008 AND q.position = 1 AND q.q3 IS NOT NULL ORDER BY q.q3 LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.nationality, r.name AS raceName FROM drivers d JOIN races r ON d.driverId = (     SELECT driverId     FROM driverStandings ds     JOIN races ra ON ds.raceId = ra.raceId     WHERE d.driverId = ds.driverId     ORDER BY ra.year ASC, ra.round ASC     LIMIT 1 ) WHERE d.dob = (     SELECT MIN(dob)     FROM drivers )	formula_1
SELECT      d.driverId,      COUNT(*) AS accident_count FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.name = 'Canadian Grand Prix' AND      r.statusId = 3 GROUP BY      d.driverId ORDER BY      accident_count DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, COUNT(*) AS wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.driverId = (     SELECT driverId     FROM drivers     ORDER BY MIN(dob)     LIMIT 1 ) GROUP BY d.driverId;	formula_1
SELECT MAX(`duration`) AS longest_pitstop_time FROM `pitStops` WHERE `duration` IS NOT NULL;	formula_1
SELECT MIN(`milliseconds`) AS fastestLapTime FROM `lapTimes` ORDER BY `milliseconds` ASC LIMIT 1;	formula_1
SELECT MAX(duration) AS longest_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE driverRef = 'hamilton');	formula_1
SELECT pitStops.lap FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN drivers ON pitStops.driverId = drivers.driverId WHERE races.year = 2011 AND races.name = 'Australian Grand Prix' AND drivers.driverRef = 'hamilton';	formula_1
SELECT driverId, time, duration FROM pitStops WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2011);	formula_1
SELECT MIN(time) AS fastest_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.driverRef = 'hamilton';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes ) ORDER BY d.forename, d.surname LIMIT 20;	formula_1
SELECT lap.position  FROM lapTimes  JOIN drivers ON lap.driverId = drivers.driverId  JOIN races ON lap.raceId = races.raceId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE drivers.driverRef = 'hamilton'  AND lap.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes WHERE driverId = drivers.driverId);	formula_1
SELECT MIN(time) AS lap_record FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Austrian Grand Prix' );	formula_1
SELECT      c.circuitId,      c.country,      MIN(lt.milliseconds) AS fastestLapMilliseconds FROM      circuits c JOIN      lapTimes lt ON c.circuitId = lt.raceId JOIN      races r ON c.circuitId = r.circuitId WHERE      c.country = 'Italy' GROUP BY      c.circuitId, c.country ORDER BY      fastestLapMilliseconds;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Austrian Grand Prix Circuit' AND r.name LIKE '%Grand Prix%';	formula_1
SELECT      p.pitStops.time,      p.pitStops.duration FROM      pitStops p JOIN      races r ON p.raceId = r.raceId JOIN      circuits c ON r.circuitId = c.circuitId JOIN      lapTimes lt ON p.driverId = lt.driverId WHERE      c.country = 'Austria'     AND lt.time = (         SELECT              MIN(time)         FROM              lapTimes         WHERE              raceId = r.raceId     );	formula_1
SELECT c.circuitId, c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes lt ON r.raceId = lt.raceId WHERE lt.time = '1:29.488'	formula_1
SELECT AVG(milliseconds) AS average_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE driverRef = 'hamilton');	formula_1
SELECT AVG(`milliseconds`) AS average_lap_time FROM `lapTimes` WHERE `raceId` IN (     SELECT `raceId`     FROM `races`     WHERE `circuitId` IN (         SELECT `circuitId`         FROM `circuits`         WHERE `country` = 'Italy'     ) );	formula_1
SELECT player_api_id  FROM Player_Attributes  WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT p.player_name, p.height FROM Player p WHERE p.height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY potential ASC LIMIT 1)	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id OR pa.player_api_id = p.player_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes pa2) ORDER BY p.player_api_id LIMIT 5;	european_football_2
SELECT League.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY SUM(Match.home_team_goal + Match.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) AS loss_count FROM Match WHERE season = '2015/2016' AND home_team_goal < away_team_goal GROUP BY home_team_api_id ORDER BY loss_count ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.penalties = (SELECT MAX(penalties) FROM Player_Attributes) ORDER BY pa.penalties DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Team AS T JOIN Match AS M ON T.team_api_id = M.away_team_api_id WHERE M.season = '2009/2010' AND M.league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') AND M.away_team_goal > M.home_team_goal GROUP BY T.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT T1.team_long_name, T1.buildUpPlaySpeed FROM `Team_Attributes` AS T1 JOIN `Team` AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlaySpeed = (SELECT MAX(buildUpPlaySpeed) FROM `Team_Attributes`) LIMIT 4;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(CASE WHEN M.home_team_goal = M.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT     P.player_name,     TIMESTAMPDIFF(YEAR, P.birthday, CURRENT_DATE) AS current_age,     PA.sprint_speed FROM     Player P JOIN     Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE     PA.sprint_speed >= 97     AND PA.date BETWEEN '2013-01-01' AND '2015-12-31';	european_football_2
SELECT      League.name AS league_name,     COUNT(Match.id) AS total_matches FROM      League JOIN      Match ON League.id = Match.league_id GROUP BY      League.name ORDER BY      total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > (SELECT AVG(T2.buildUpPlayPassing)                               FROM Team_Attributes AS T2                               JOIN Team AS T1 ON T2.team_api_id = T1.team_api_id                               WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing IS NOT NULL) AND strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing IS NOT NULL;	european_football_2
SELECT      ROUND((SUM(CASE WHEN `Player`.`player_fifa_api_id` IS NOT NULL AND `Player`.`preferred_foot` = 'left' THEN 1 ELSE 0 END) * 100.0) / COUNT(`Player`.`player_fifa_api_id`), 2) AS left_foot_percentage FROM      `Player` WHERE      YEAR(`Player`.`birthday`) BETWEEN 1987 AND 1992;	european_football_2
SELECT `league_id`, SUM(`home_team_goal`) + SUM(`away_team_goal`) AS total_goals FROM `Match` GROUP BY `league_id` ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots)  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT P.player_name, AVG(PA.heading_accuracy) AS avg_heading_accuracy FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_api_id, P.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND buildUpPlayDribblingClass = 'Normal') ORDER BY chanceCreationPassing ASC;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal)	european_football_2
SELECT `team_short_name` FROM `Team` WHERE `team_long_name` = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(player_name, 1, 7) = '1970-10';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (SELECT `player_fifa_api_id` FROM `Player` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_api_id` = 505942 AND `player_fifa_api_id` = 218353));	european_football_2
SELECT      Team_Attributes.buildUpPlayPositioningClass  FROM      Team_Attributes  JOIN      Team  ON      Team_Attributes.team_api_id = Team.team_api_id  WHERE      Team.team_long_name = 'ADO Den Haag'  AND      Team_Attributes.date = (         SELECT              MAX(Team_Attributes.date)          FROM              Team_Attributes          JOIN              Team          ON              Team_Attributes.team_api_id = Team.team_api_id          WHERE              Team.team_long_name = 'ADO Den Haag'      );	european_football_2
SELECT heading_accuracy  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Francois Affolter')  AND date = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') AND season = '2015/2016';	european_football_2
SELECT `Player`.`player_name`, `Player_Attributes`.`preferred_foot` FROM `Player` JOIN `Player_Attributes` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id` WHERE `Player`.`birthday` = (     SELECT MIN(`birthday`)     FROM `Player` )	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'David Wilson';	european_football_2
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT `League.name` FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `Country.name` = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT      p.player_name,      pa.average_finishing FROM      Player p JOIN      (SELECT           player_api_id,           AVG(finishing) AS average_finishing      FROM           Player_Attributes pa      WHERE           pa.player_api_id IN (              SELECT player_api_id               FROM Player_Attributes               WHERE height = (SELECT MAX(height) FROM Player)              OR height = (SELECT MIN(height) FROM Player)          )      GROUP BY           player_api_id) pa ON p.player_api_id = pa.player_api_id WHERE      pa.average_finishing = (SELECT MAX(AVG(finishing)) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player) OR p.height = (SELECT MIN(height) FROM Player))	european_football_2
SELECT `player_name` FROM `Player` WHERE `height` > 180;	european_football_2
SELECT COUNT(*) FROM `Player` WHERE strftime('%Y', `birthday`) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential`  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id`  WHERE `Player.player_api_id` = 23780;	european_football_2
SELECT player_name  FROM Player  WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team_Attributes.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'CLB';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlayPassing` > 70;	european_football_2
SELECT AVG(t2.overall_rating) AS avg_rating FROM Player_Attributes t2 JOIN Player t1 ON t2.player_fifa_api_id = t1.player_fifa_api_id OR t2.player_api_id = t1.player_api_id WHERE t1.height > 170 AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015';	european_football_2
SELECT player_name, height FROM Player ORDER BY height ASC LIMIT 1;	european_football_2
SELECT Country.name FROM League JOIN Country ON League.country_id = Country.id WHERE League.name = 'Italy Serie A';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlaySpeed` = 31 AND `buildUpPlayDribbling` = 53 AND `buildUpPlayPassing` = 32;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id`  WHERE `Player`.`player_name` = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT `Team.team_short_name` FROM `Match` JOIN `Team` ON `Match.home_team_api_id` = `Team.team_api_id` WHERE `Match.home_team_goal` = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 AND pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61);	european_football_2
SELECT     (AVG(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE 0 END) -       AVG(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE 0 END)) AS ball_control_difference FROM     Player p JOIN     Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE     p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT team_long_name  FROM Team  WHERE team_short_name = 'GEN';	european_football_2
SELECT      p1.player_api_id, p1.player_fifa_api_id, p1.player_fifa_api_id AS 'PlayerFIFAID',      p2.player_api_id, p2.player_fifa_api_id AS 'PlayerFIFAID',     CASE          WHEN p1.player_fifa_api_id = 505942 THEN 'Aaron Lennon'         ELSE 'Abdelaziz Barrada'     END AS 'PlayerName' FROM      Player p1 JOIN      Player p2 ON p1.player_fifa_api_id = 505942 OR p2.player_fifa_api_id = 505942 WHERE      p1.player_fifa_api_id = 505942 OR p2.player_fifa_api_id = 505942 ORDER BY      (p1.player_fifa_api_id = 505942) DESC,      (p2.player_fifa_api_id = 505942) DESC LIMIT 1;	european_football_2
SELECT `player_name`, `height` FROM `Player` ORDER BY `height` DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id OR pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT `Country`.`id`, `Country`.`name` FROM `Country` JOIN `League` ON `Country`.`id` = `League`.`country_id` WHERE `League`.`name` = 'Belgium Jupiler League';	european_football_2
SELECT `name` FROM `League` WHERE `country_id` = (SELECT `id` FROM `Country` WHERE `name` = 'Germany');	european_football_2
SELECT p.player_name, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id OR p.player_fifa_api_id = pa.player_fifa_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT      p.player_name, pa.crossing FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY      pa.crossing DESC LIMIT 1;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (SELECT `player_fifa_api_id`                               FROM `Player`                               WHERE `player_api_id` = (SELECT `player_api_id`                                                        FROM `Player`                                                        WHERE `player_long_name` = 'Ariel Borysiuk'));	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Belgium' AND Match.season = '2008/2009';	european_football_2
SELECT `Player_Attributes`.long_passing FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.player_api_id = `Player`.player_api_id ORDER BY `Player`.birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League')  AND SUBSTR(date, 1, 7) = '2009-04';	european_football_2
SELECT `name` FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` WHERE `Match.season` = '2008/2009' GROUP BY `League.name` ORDER BY COUNT(`Match.id`) DESC LIMIT 1;	european_football_2
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player` WHERE strftime('%Y', `birthday`) < '1986';	european_football_2
SELECT      (SELECT overall_rating       FROM Player_Attributes       WHERE player_api_id IN       (SELECT player_api_id        FROM Player        WHERE player_name = 'Ariel Borysiuk')      ORDER BY date DESC       LIMIT 1) -      (SELECT overall_rating       FROM Player_Attributes       WHERE player_api_id IN       (SELECT player_api_id        FROM Player        WHERE player_name = 'Paulin Puel')      ORDER BY date DESC       LIMIT 1) * 100 /      (SELECT overall_rating       FROM Player_Attributes       WHERE player_api_id IN       (SELECT player_api_id        FROM Player        WHERE player_name = 'Paulin Puel')      ORDER BY date DESC       LIMIT 1)	european_football_2
SELECT AVG(`buildUpPlaySpeed`)  FROM `Team_Attributes`  WHERE `team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(`crossing`) AS total_crossing_score FROM `Player_Attributes` JOIN `Player` AS T2 ON `Player_Attributes`.`player_api_id` = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(`chanceCreationPassing`), `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax' GROUP BY `chanceCreationPassingClass` ORDER BY `chanceCreationPassing` DESC LIMIT 1;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id  WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(`overall_rating`) AS highest_overall_rating FROM `Player_Attributes` JOIN `Player` AS P ON `Player_Attributes`.`player_api_id` = P.`player_api_id` WHERE P.`player_name` = 'Dorlan Pabon';	european_football_2
SELECT AVG(`away_team_goal`) AS average_goals_away FROM `Match` JOIN `Team` ON `Match.away_team_api_id` = `Team.team_api_id` JOIN `League` ON `Match.league_id` = `League.id` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `Team.team_long_name` = 'Parma' AND `Country.name` = 'Italy';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Aaron Mooy' AND `Player_Attributes.date` LIKE '2016-02-04%'	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Parravicini' AND `date` = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Francesco Migliore' AND `date` LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  WHERE player_api_id = (     SELECT player_api_id      FROM Player      WHERE player_name = 'Kevin Berigaud' ) AND date = '2013-02-22 00:00:00';	european_football_2
SELECT `date` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` OR `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Kevin Constant' ORDER BY `crossing` DESC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  WHERE team_long_name = 'Willem II' AND date = '2012-02-22';	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'LEI' AND Team_Attributes.date = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes  WHERE team_long_name = 'FC Lorient'  AND date LIKE '2010-02-22%';	european_football_2
SELECT `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'PEC Zwolle' AND `date` = '2013-09-20 00:00:00';	european_football_2
SELECT chanceCreationCrossingClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'Hull City' AND Team_Attributes.date = '2010-02-22 00:00:00';	european_football_2
SELECT `defence_aggression_class` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND `date` LIKE '2015-09-10%'	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes` pa  JOIN `Player` p ON pa.player_fifa_api_id = p.player_fifa_api_id  WHERE p.player_name = 'Marko Arnautovic'  AND DATE(pa.date) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT      (         (SELECT `overall_rating` FROM `Player_Attributes` WHERE `date` = '2013-07-12' AND `player_api_id` IN (             SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Landon Donovan'         )     ) -      (SELECT `overall_rating` FROM `Player_Attributes` WHERE `date` = '2013-07-12' AND `player_api_id` IN (             SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Jordan Bowery'         )     )     / (SELECT `overall_rating` FROM `Player_Attributes` WHERE `date` = '2013-07-12' AND `player_api_id` IN (             SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Landon Donovan'         )     )     * 100 ) AS percentage_difference	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE (strftime('%Y', 'now') - strftime('%Y', p.birthday)) > 35;	european_football_2
SELECT SUM(home_team_goal) AS home_goals_scored_by_aaron FROM Match JOIN Player ON Player.player_api_id = Match.home_player_1 OR Player.player_api_id = Match.home_player_2 OR Player.player_api_id = Match.home_player_3 OR Player.player_api_id = Match.home_player_4 OR Player.player_api_id = Match.home_player_5 OR Player.player_api_id = Match.home_player_6 OR Player.player_api_id = Match.home_player_7 OR Player.player_api_id = Match.home_player_8 OR Player.player_api_id = Match.home_player_9 OR Player.player_api_id = Match.home_player_10 OR Player.player_api_id = Match.home_player_11 WHERE Player.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(a.away_team_goal) AS total_away_goals FROM Match a JOIN Player p ON a.away_player_1 = p.player_api_id OR a.away_player_2 = p.player_api_id WHERE p.player_name = 'Daan Smith' OR p.player_name = 'Filipe Ferreira';	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON home_player_1 = player_api_id OR home_player_2 = player_api_id OR home_player_3 = player_api_id OR        home_player_4 = player_api_id OR home_player_5 = player_api_id OR home_player_6 = player_api_id OR        home_player_7 = player_api_id OR home_player_8 = player_api_id OR home_player_9 = player_api_id OR        home_player_10 = player_api_id OR home_player_11 = player_api_id JOIN Player_Attributes ON player_api_id = player_api_id WHERE strftime('%Y', CURRENT_TIMESTAMP, 'localtime') - strftime('%Y', birthday) < 31;	european_football_2
SELECT `Player.player_name` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `Player_Attributes.overall_rating` = (     SELECT MAX(`overall_rating`)     FROM `Player_Attributes` )	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_X1 OR p.player_api_id = m.away_player_X1 WHERE pa.attacking_work_rate = 'high' AND (m.home_player_X2 IS NOT NULL OR m.away_player_X2 IS NOT NULL) AND (m.home_player_X3 IS NOT NULL OR m.away_player_X3 IS NOT NULL) AND (m.home_player_X4 IS NOT NULL OR m.away_player_X4 IS NOT NULL) AND (m.home_player_X5 IS NOT NULL OR m.away_player_X5 IS NOT NULL) AND (m.home_player_X6 IS NOT NULL OR m.away_player_X6 IS NOT NULL) AND (m.home_player_X7 IS NOT NULL OR m.away_player_X7 IS NOT NULL) AND (m.home_player_X8 IS NOT NULL OR m.away_player_X8 IS NOT NULL) AND (m.home_player_X9 IS NOT NULL OR m.away_player_X9 IS NOT NULL) AND (m.home_player_X10 IS NOT NULL OR m.away_player_X10 IS NOT NULL) AND (m.home_player_X11 IS NOT NULL OR m.away_player_X11 IS NOT NULL);	european_football_2
SELECT p.player_name, MAX(SUBTRACT(datetime(CURRENT_TIMESTAMP, 'localtime'), datetime(p.birthday))) AS age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 GROUP BY p.player_name ORDER BY age DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT P.player_name, C.id AS country_id, C.name AS country_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id JOIN Country C ON P.player_fifa_api_id = C.id WHERE PA.vision >= 90;	european_football_2
SELECT `Country`.`id`, `Country`.`name`, AVG(`Player`.`weight`) AS avg_weight FROM `Player` JOIN `Country` ON `Player`.`country_id` = `Country`.`id` GROUP BY `Country`.`id` ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T2.team_short_name FROM `Match` AS M JOIN `Team` AS T1 ON M.home_team_api_id = T1.team_api_id OR M.away_team_api_id = T1.team_api_id JOIN `Team_Attributes` AS TA ON T1.team_fifa_api_id = TA.team_fifa_api_id WHERE TA.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(`height`) AS average_height FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` JOIN `Team` ON `Player.team_api_id` = `Team.team_api_id` JOIN `League` ON `Team.league_id` = `League.id` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `Country.name` = 'Italy';	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `player_name` LIKE 'Aaron%' AND `birthday` > '1990-01-01';	european_football_2
SELECT      (SELECT `jumping` FROM `Player_Attributes` WHERE `id` = 6) - (SELECT `jumping` FROM `Player_Attributes` WHERE `id` = 23) AS `jumping_difference`	european_football_2
SELECT `Player`.`player_api_id` FROM `Player` JOIN `Player_Attributes` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id` WHERE `Player_Attributes`.`preferred_foot` = 'right' AND `Player_Attributes`.`potential` = (SELECT MIN(`potential`) FROM `Player_Attributes` WHERE `preferred_foot` = 'right') ORDER BY `Player_Attributes`.`potential` LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left') AND pa.preferred_foot = 'left';	european_football_2
SELECT      ROUND((COUNT(*) FILTER (WHERE `strength` > 80 AND `stamina` > 80) * 100.0) / COUNT(*), 2) AS percentage_strength_stamina_above_80 FROM      `Player_Attributes`;	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Poland Ekstraklasa';	european_football_2
SELECT      m.home_team_goal AS home_score,      m.away_team_goal AS away_score  FROM      Match m  JOIN      League l ON m.league_id = l.id  WHERE      m.date LIKE '2008-09-24%'      AND l.name = 'Belgium Jupiler League';	european_football_2
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.player_name` = 'Alexis Blin';	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `Team.team_long_name` = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016'  AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A');	european_football_2
SELECT MAX(home_team_goal) as highest_home_score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie');	european_football_2
SELECT `finishing`, `curve` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.weight` = (SELECT MAX(`weight`) FROM `Player`);	european_football_2
SELECT      League.name,      COUNT(Match.id) AS total_games FROM      League  JOIN      Match ON League.id = Match.league_id WHERE      Match.season = '2015/2016' GROUP BY      League.name ORDER BY      total_games DESC LIMIT 4;	european_football_2
SELECT `Team.team_long_name` FROM `Match` JOIN `Team` ON `Match.away_team_api_id` = `Team.team_api_id` WHERE `away_team_goal` = (SELECT MAX(`away_team_goal`) FROM `Match`)	european_football_2
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1);	european_football_2
SELECT     ROUND(         (COUNT(CASE WHEN `Player`.height < 180 AND `Player_Attributes`.overall_rating > 70 THEN 1 END) * 100.0) / COUNT(`Player`.id),         2     ) AS percentage_under_180_stronger_than_70 FROM     `Player` JOIN     `Player_Attributes` ON `Player`.player_api_id = `Player_Attributes`.player_api_id	european_football_2
SELECT      CASE          WHEN SUM(CASE WHEN p.SEX = 'M' AND e.Admission = '+' THEN 1 ELSE 0 END) >               SUM(CASE WHEN p.SEX = 'M' AND e.Admission = '-' THEN 1 ELSE 0 END)         THEN 'In-patient'         ELSE 'Outpatient'     END AS DominantStatus,     (SUM(CASE WHEN p.SEX = 'M' AND e.Admission = '+' THEN 1 ELSE 0 END) -       SUM(CASE WHEN p.SEX = 'M' AND e.Admission = '-' THEN 1 ELSE 0 END)) /       SUM(CASE WHEN p.SEX = 'M' THEN 1 ELSE 0 END) * 100 AS PercentageDeviation FROM Patient p JOIN Examination e ON p.ID = e.ID;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Patient`.`Birthday` > '1930' THEN 1 END) / COUNT(`Patient`.`ID`)) * 100 AS PercentageOfFemalesBornAfter1930 FROM `Patient` WHERE `Patient`.`SEX` = 'F';	thrombosis_prediction
SELECT      ROUND((COUNT(*) * 100.0) / SUM(CASE WHEN p.Admission = '+' THEN 1 ELSE 0 END), 2) AS Inpatient_Percentage FROM      Patient p WHERE      p.Birthday BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT      (SELECT COUNT(ID) FROM Examination WHERE Diagnosis = 'SLE' AND Admission = '+') /      (SELECT COUNT(ID) FROM Examination WHERE Diagnosis = 'SLE' AND Admission = '-') AS OutpatientToInpatientRatio;	thrombosis_prediction
SELECT p.`Diagnosis`, l.`Date` FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109;	thrombosis_prediction
SELECT      l.ID,      p.SEX,      p.Birthday FROM      Laboratory l JOIN      Patient p ON l.ID = p.ID WHERE      l.GPT > 500	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RVVT = '+';	thrombosis_prediction
SELECT      p.ID,      p.Diagnosis FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      e.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday BETWEEN '1937-01-01' AND '1937-12-31' AND e.TCHO >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.T-BIL < 3.5;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `aCL IgG` < 6.0 OR `aCL IgG` > 8.5 THEN 1 END) * 100.0) / COUNT(`ID`) AS Percentage_Female_With_Abnormal_TP FROM      Examination WHERE      `ID` IN (SELECT `ID` FROM Patient WHERE `SEX` = 'F');	thrombosis_prediction
SELECT AVG(`aCL IgG`) as AverageAntiCardiolipinIgG FROM `Examination` WHERE `Symptoms` = '+' AND (SUBSTR(`Birthday`, 1, 4) - YEAR(CURRENT_TIMESTAMP) >= 50);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'F' AND YEAR(p.Description) = 1997 AND p.Admission = '-';	thrombosis_prediction
SELECT      MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS YoungestAgeAtAdmission FROM      Patient WHERE      `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND P.SEX = 'F' AND YEAR(P.Description) = 1997;	thrombosis_prediction
SELECT MAX(YEAR(P.Birthday)) - MIN(YEAR(P.Birthday)) AS AgeGap FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.T-BIL >= 200 AND P.Birthday IS NOT NULL;	thrombosis_prediction
SELECT      p.Birthday,      p.Diagnosis,      e.Symptoms FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.Birthday = (SELECT MIN(Birthday) FROM Patient)     AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT      COUNT(Lab.ID) / 12 AS AvgMonthlyMalePatients FROM      Laboratory Lab JOIN      Patient Pat ON Lab.ID = Pat.ID WHERE      Pat.SEX = 'M' AND      Lab.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY      MONTH(Lab.Date)	thrombosis_prediction
SELECT      L.Date AS LabWorkDate,     P.Birthday AS BirthDate,     TIMESTAMPDIFF(YEAR, P.Birthday, P.FirstDate) AS AgeAtAdmission FROM      Patient P JOIN      Examination E ON P.ID = E.ID JOIN      Laboratory L ON P.ID = L.ID WHERE      E.Diagnosis LIKE '%SJS%' ORDER BY      P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Patient.SEX` = 'M' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN `Patient.SEX` = 'F' THEN 1 ELSE 0 END), 0)) AS Male_to_Female_Ratio FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE (`Examination.aCL IgG` <= 8.0 AND `Patient.SEX` = 'M') OR (`Examination.aCL IgM` <= 6.5 AND `Patient.SEX` = 'F');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  LEFT JOIN Examination e ON p.ID = e.ID  WHERE e.Examination_Date IS NULL  AND p.First_Date IS NOT NULL  AND DATEDIFF(YEAR, p.First_Date, e.Examination_Date) >= 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday < '1970-01-01' AND YEAR(e.`Examination Date`) BETWEEN 1990 AND 1993;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.T_BIL >= 2.0;	thrombosis_prediction
SELECT      T1.Diagnosis,      COUNT(T1.Diagnosis) AS DiagnosisCount FROM      Examination T1 JOIN      Patient T2 ON T1.ID = T2.ID WHERE      T1.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY      T1.Diagnosis ORDER BY      DiagnosisCount DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(CURDATE()), YEAR(`Patient`.`Birthday`))) AS average_age FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE MONTH(`Laboratory`.`Date`) = 10 AND YEAR(`Laboratory`.`Date`) = 1991;	thrombosis_prediction
SELECT      p.Birthday,      p.Diagnosis,     (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID JOIN      Laboratory l ON p.ID = l.ID WHERE      l.HCT = (         SELECT MAX(HCT)          FROM Laboratory          WHERE ID = p.ID AND Date = (SELECT `Examination Date` FROM Examination WHERE ID = p.ID)     ) ORDER BY      Age DESC LIMIT 1;	thrombosis_prediction
SELECT `aCL IgG`, `aCL IgM`, `aCL IgA` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT     (CASE WHEN L.GPT < 250 THEN 'Normal' ELSE 'Abnormal' END) AS CholesterolStatus FROM     Laboratory L WHERE     L.ID = 2927464 AND     L.Date = '1995-09-04' AND     L.GPT IS NOT NULL;	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis LIKE '%AORTITIS%' ORDER BY e.Examination_Date LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM `Examination` WHERE `Symptoms` LIKE '%SLE%' AND `Description` = '1994-02-19' AND `Examination.Date` = '1993-11-12';	thrombosis_prediction
SELECT p.Description FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' OR p.SEX = 'F' AND e.aCL_IgG = 9 AND e.aCL_IgM = 9 AND e.aCL_IgA = 9 AND e.Symptoms = 'ALT Glutamic Pylvic Transaminase' AND e.Thrombosis = 1 AND p.First_Date = '1992-06-12';	thrombosis_prediction
SELECT     P.Birthday,     DATEDIFF('1991-10-21', P.Birthday) / 365 AS AgeAtTest FROM     Patient P JOIN     Laboratory L ON P.ID = L.ID WHERE     L.Date = '1991-10-21'     AND L.GPT = 8.4;	thrombosis_prediction
SELECT COUNT(`Laboratory.ID`) AS TotalTests FROM `Laboratory` WHERE `Laboratory.ID` IN (     SELECT `Patient.ID`     FROM `Patient`     WHERE `Patient.First Date` = '1991-06-13' ) AND `Laboratory.Date` BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT p.`Diagnosis` AS Original_Diagnosis FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE e.`Examination Date` = '1997-01-27' AND p.`First Date` = '1997-01-27';	thrombosis_prediction
SELECT Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = '1959-03-01' AND Examination.Examination_Date = '1993-09-27';	thrombosis_prediction
SELECT     (SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-11-%' THEN L.TAT2 ELSE 0 END) -      SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-12-%' THEN L.TAT2 ELSE 0 END)) AS CholesterolDecreaseRate FROM     Laboratory L JOIN     Patient P ON L.ID = P.ID WHERE     P.Birthday = '1959-02-18'     AND L.Date BETWEEN '1981-11-01' AND '1981-12-31';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'Behcet\'s' AND e.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG > 30 AND E.aCL_IgM < 4 AND P.First_Date BETWEEN '1987-07-06' AND '1996-01-31';	thrombosis_prediction
SELECT `ID` FROM `Patient` WHERE `SEX` = 'F' AND YEAR(`Birthday`) = 1964 AND `Admission` = '+' ORDER BY `ID`;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`ANA Pattern` = 'S' AND e.`Thrombosis` = 2 AND e.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT      ROUND(         (COUNT(CASE WHEN E.`U-PRO` > 0 AND E.`U-PRO` < 30 AND L.UA <= 6.5 THEN 1 ELSE NULL END) * 100.0) /          COUNT(CASE WHEN E.`U-PRO` > 0 AND E.`U-PRO` < 30 THEN 1 ELSE NULL END),          2     ) AS percentage FROM      Examination E JOIN      Laboratory L ON E.ID = L.ID WHERE      E.`U-PRO` > 0 AND E.`U-PRO` < 30	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN p.SEX = 'M' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_behecet_male_patients FROM      Patient p WHERE      p.SEX = 'M' AND      YEAR(p.First_Date) = 1981 AND      p.Diagnosis LIKE '%BEHCET%'	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND       l.Date LIKE '1991-10%' AND       l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) BETWEEN 1980 AND 1989 AND ID NOT IN (SELECT ID FROM Examination WHERE `ANA Pattern` = 'P');	thrombosis_prediction
SELECT p.Description FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Symptoms = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) AS AverageAlbuminLevel FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(Symptoms) as MostCommonSymptom FROM Examination WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Description, pa.Diagnosis FROM `Patient` pa JOIN `Examination` e ON pa.ID = e.ID WHERE pa.ID = 48473 ORDER BY p.Description LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.SEX = 'F' AND Examination.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE YEAR(E.`Examination Date`) = 1997 AND (L.`GPT` > 6 OR L.`GPT` < 8.5);	thrombosis_prediction
SELECT     (SUM(CASE WHEN e.Symptoms LIKE '%ITP%' THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN p.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS proportion FROM Examination e JOIN Patient p ON e.ID = p.ID;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Patient.SEX` = 'F' THEN 1 ELSE 0 END) * 100.0) / COUNT(`Patient.ID`)  FROM      `Patient`  WHERE      YEAR(`Patient.Birthday`) = 1980 AND      `Patient.Diagnosis` = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Diagnosis LIKE '%Behcet%' AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.HGB < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination.Date`, `Patient.First Date`) AS DaysUntilEvaluation FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.ID` = 821298;	thrombosis_prediction
SELECT      CASE          WHEN p.SEX = 'M' THEN l.GPT > 8.0         WHEN p.SEX = 'F' THEN l.GPT > 6.5     END AS UricAcidInRange FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID = 57266;	thrombosis_prediction
SELECT L.Date FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE E.ID = (SELECT ID FROM Patient WHERE ID = 48473) AND E.`aCL IgG` >= 60;	thrombosis_prediction
SELECT p.ID, p.sex, p.birthday FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.GOT < 60 AND YEAR(l.Date) = 1994;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.aCL_IgG >= 60 OR e.aCL_IgM >= 60;	thrombosis_prediction
SELECT p.ID, p.ID AS PatientID, l.Date, e.aCL_IgG, e.aCL_IgM, e.Thrombosis FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.aCL_IgG > 60 OR e.aCL_IgM > 60 ORDER BY p.ID ASC, l.Date ASC;	thrombosis_prediction
SELECT AVG(`aCL IgG`) as avg_ldh FROM `Examination` WHERE `aCL IgG` < 500;	thrombosis_prediction
SELECT p.ID, TIMESTAMPDIFF(YEAR, p.First_Date, CURDATE()) AS Age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG BETWEEN 600 AND 800 AND TIMESTAMPDIFF(YEAR, p.First_Date, CURDATE()) BETWEEN 100 AND 300;	thrombosis_prediction
SELECT      p.ID,      p.Admission  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.aCL_IgG < 300 OR e.aCL_IgM < 300 OR e.aCL_IgA < 300      OR (e.aCL_IgG IS NULL AND e.aCL_IgM < 300 OR e.aCL_IgM IS NULL AND e.aCL_IgG < 300);	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.First_Date = '1982-04-01' AND EXISTS (     SELECT 1     FROM Laboratory l     WHERE l.ID = p.ID     AND l.DNA-II < 300 );	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 6.0;	thrombosis_prediction
SELECT     p.ID,     p.SEX,     l.TP,     (l.TP - 8.5) AS TP_Deviation FROM     Patient p JOIN     Laboratory l ON p.ID = l.ID WHERE     p.SEX = 'F'     AND l.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,     p.SEX,     p.Birthday,     CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'         ELSE 'Not Within Normal Range'     END AS AlbuminStatus FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      YEAR(p.Birthday) = 1982;	thrombosis_prediction
SELECT      ROUND((COUNT(CASE WHEN `Examination`.`aCL IgM` > 6.5 THEN 1 END) * 100.0) / COUNT(`Patient`.`ID`), 2) AS Percentage_Female_UA_Beyond_Normal FROM      `Examination` JOIN      `Patient` ON `Examination`.`ID` = `Patient`.`ID` WHERE      `Patient`.`SEX` = 'F'	thrombosis_prediction
SELECT AVG(UA) AS Average_UA_Index FROM Laboratory WHERE ID IN (     SELECT ID     FROM Patient     WHERE (SEX = 'M' AND UA < 8.0) OR (SEX = 'F' AND UA < 6.5) ) AND EXISTS (     SELECT 1     FROM Laboratory AS L2     WHERE L2.ID = Laboratory.ID     AND L2.Date = (         SELECT MAX(Date)         FROM Laboratory         WHERE ID = Laboratory.ID     ) );	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG = 29 OR e.aCL_IgM = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis = 'RA' AND e.aCL_IgM < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5;	thrombosis_prediction
SELECT     SUM(CASE WHEN SEX = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END) AS Male_CreatinineAboveNormal,     SUM(CASE WHEN SEX = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END) AS Female_CreatinineAboveNormal FROM     Laboratory WHERE     SEX IN ('M', 'F');	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory);	thrombosis_prediction
SELECT      GROUP_CONCAT(DISTINCT p.ID) AS PatientIDs,      p.SEX  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      l.T_BIL >= 2.0  GROUP BY      p.SEX;	thrombosis_prediction
SELECT p.ID, MAX(l.T-BIL) AS T_CHOL_INDEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) GROUP BY p.ID ORDER BY T_CHOL_INDEX DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(SUBTRACT(YEAR(NOW()), YEAR(`Birthday`)), COUNT(`Patient`.`ID`))) AS average_age FROM `Patient` WHERE `SEX` = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.Description, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG > 300 OR e.aCL_IgM > 300 OR e.aCL_IgA > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG >= 200 AND (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT `Patient`.`ID` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`CRE` < 250 AND `Patient`.`Admission` = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'M'  AND YEAR(Patient.First_Date) BETWEEN 1936 AND 1956  AND Examination.CPK >= 250;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.GPT >= 180     AND e.TAT2 < 250;	thrombosis_prediction
SELECT      p.ID,      e.aCL_IgG,      e.aCL_IgM FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.aCL_IgG < 180 OR e.aCL_IgM < 180     AND YEAR(p.Description) = 1991;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      (l.GPT < 3.5 OR l.GPT >= 9.0) GROUP BY      p.ID, p.SEX, p.Birthday ORDER BY      p.SEX, (YEAR(CURRENT_DATE) - YEAR(p.Birthday));	thrombosis_prediction
SELECT p.ID, (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.HCT < 3.5;	thrombosis_prediction
SELECT      P.ID,      P.SEX,      P.Birthday,      P.Admission FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F' AND      (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) >= 50 AND      (L.HGB <= 3.5 OR L.HGB >= 6.0) AND      P.Admission = '+'	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '-' AND e.HGB < 10;	thrombosis_prediction
SELECT      p.ID,      p.SEX  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.Diagnosis = 'SLE'      AND p.Birthday = (         SELECT              MAX(Birthday)          FROM              Patient          WHERE              ID IN (SELECT                         e2.ID                     FROM                         Examination e2                     WHERE                         e2.Diagnosis = 'SLE'                         AND e2.HGB BETWEEN 10 AND 17)     );	thrombosis_prediction
SELECT p.ID,         (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID HAVING COUNT(l.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) as AverageHematocritLevel FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT     SUM(CASE WHEN `PLT` < 100 THEN 1 ELSE 0 END) AS 'BelowNormalRange',     SUM(CASE WHEN `PLT` > 400 THEN 1 ELSE 0 END) AS 'AboveNormalRange' FROM `Laboratory` WHERE `PLT` < 100 OR `PLT` > 400;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Laboratory.PLT FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Laboratory.Date) = 1984 AND Patient.Birthday IS NOT NULL AND SUBSTR(Patient.Birthday, 6, 2) - SUBSTR(CURRENT_DATE, 6, 2) < 50 AND Laboratory.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END) AS PercentageOfFemalesWithAbnormalPT FROM      Examination  JOIN      Patient ON Examination.ID = Patient.ID WHERE      SUBSTR(Patient.Birthday, 1, 4) < YEAR(CURRENT_DATE) - 55;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.First_Date > '1992-12-31' AND e.`PT` < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`aCL IgG` > 45 AND E.`Thrombosis` = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.WBC > 3.5 AND l.WBC < 9.0 AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Birthday > '1980-01-01' AND Examination.FG < 150 OR Examination.FG > 450;	thrombosis_prediction
SELECT DISTINCT p.`Diagnosis` FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE e.`Diagnosis` IS NOT NULL AND e.`Diagnosis` LIKE '%Proteinuria%' AND p.`ID` IN (SELECT `ID` FROM `Examination` WHERE `aCL IgG` >= 30 OR `aCL IgM` >= 30);	thrombosis_prediction
SELECT Patient.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`U-PRO` BETWEEN 0 AND 30 AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT DISTINCT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.IGG` >= 2000;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG > 900 AND E.aCL_IgG < 2000 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgA BETWEEN 80 AND 500 AND e.aCL_IgA = (SELECT MAX(e2.aCL_IgA) FROM Examination e2 WHERE e2.aCL_IgA BETWEEN 80 AND 500)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.IGA > 80 AND e.IGA < 500 AND YEAR(p.First_Date) >= 1990;	thrombosis_prediction
SELECT T2.Diagnosis, COUNT(*) AS DiseaseFrequency FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.aCL_IgM <= 40 OR T1.aCL_IgM >= 400 GROUP BY T2.Diagnosis ORDER BY DiseaseFrequency DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG IS NULL OR E.aCL_IgM IS NULL OR E.ANA_Pattern IS NULL AND P.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE >= 1.5 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'F' AND e.aCL_IgG IN('-', '+-') AND e.Thrombosis = '+';	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, P.Birthday, E.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Birthday > '1985-01-01' AND E.Diagnosis LIKE '%RA%' AND E.Diagnosis LIKE '%+-' ORDER BY P.ID;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgM < 20 AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.aCL_IgG < 20 AND e.aCL_IgM < 20 AND e.aCL_IgA < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.C3 > 35 AND Examination.ANA_Pattern = 'P';	thrombosis_prediction
SELECT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `aCL IgA` IS NOT NULL AND (`aCL IgA` < 29 OR `aCL IgA` > 52) ORDER BY `aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.Thrombosis = 1 AND e.C4 > 10;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.ANA_Pattern IN ('-', '+-') AND P.Admission = '+';	thrombosis_prediction
SELECT p.`First Date`  FROM `Patient` p  JOIN `Examination` e ON p.`ID` = e.`ID` WHERE e.`aCL IgG` NOT IN('-', '+-') OR e.`aCL IgM` NOT IN('-', '+-') OR e.`aCL IgA` NOT IN('-', '+-') ORDER BY p.`First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG IN('-', '+-') AND E.Thrombosis = 0;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA_Pattern = 'S' AND e.aCL_IgG NOT IN ('negative', '0') ORDER BY p.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT `Patient.ID` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Examination.Examination Date` > '1997-01-01' AND `Examination.SC170` IN('negative','0');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'F'  AND e.aCL_IgG = 'negative'  AND e.aCL_IgM = '0'  AND e.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient`.`ID`)  FROM `Patient`  JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`SSA` IN('-','+-') AND YEAR(`Patient`.`First Date`) < 2000;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA_Pattern LIKE '%SSA%'   AND e.ANA_Pattern NOT IN ('negative', '0')   AND p.First_Date = (SELECT MIN(First_Date) FROM Patient WHERE First_Date IS NOT NULL) ORDER BY p.First_Date LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.SSB IN('-', '+-') AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.CENTROMEA IN('-', '+-') AND e.SSB IN('-', '+-') AND p.SEX = 'M';	thrombosis_prediction
SELECT p.`Diagnosis` FROM `Patient` p JOIN `Laboratory` l ON p.`ID` = l.`ID` WHERE l.`DNA` >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.DNA < 8 AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.IGG BETWEEN 900 AND 2000 AND e.Admission = '+';	thrombosis_prediction
SELECT      MULTIPLY(         DIVIDE(COUNT(E.ID),          (SELECT COUNT(*) FROM Examination WHERE `aCL IgG` >= 60 OR `aCL IgM` >= 60)     ), 1.0) AS percentage_abnormal_SLE_patients FROM      Examination E JOIN      Patient P ON E.ID = P.ID WHERE      E.`aCL IgG` >= 60 OR E.`aCL IgM` >= 60 AND P.Description LIKE '%SLE%';	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Sex = 'M' AND E.GOT < 60;	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG >= 60 OR e.aCL_IgM >= 60 ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT p.ID, p.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG < 60 GROUP BY p.ID, p.Date ORDER BY e.aCL_IgG DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG < 60 AND p.Sex = 'M';	thrombosis_prediction
SELECT MIN(Laboratory.Date)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Laboratory.DNA-II < 500  AND Laboratory.DNA-II IS NOT NULL  ORDER BY MIN(Laboratory.Date) ASC  LIMIT 1;	thrombosis_prediction
SELECT MAX(`Date`) AS LatestMedicalData FROM `Laboratory` WHERE `ID` IN (     SELECT `ID`     FROM `Examination`     WHERE `Symptoms` LIKE '%LDH%' ) ORDER BY `Date` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID JOIN Patient P ON E.ID = P.ID WHERE L.GPT >= 300 AND P.Admission = '+';	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Admission = '-' AND E.GPT < 300;	thrombosis_prediction
SELECT DISTINCT P.ID, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Diagnosis = 'SJS' AND E.TP > 6.0 AND E.TP < 8.5;	thrombosis_prediction
SELECT `Examination.Date` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Examination.aCL_IgG` BETWEEN 3.5 AND 5.5 AND `Examination.aCL_IgG` = (SELECT MAX(`aCL_IgG`) FROM `Examination` WHERE `aCL_IgG` BETWEEN 3.5 AND 5.5) AND `Patient.ID` IN (SELECT `ID` FROM `Examination` WHERE `aCL_IgG` BETWEEN 3.5 AND 5.5);	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.ALB > 3.5 AND L.ALB < 5.5 AND L.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT e.aCL_IgG, e.aCL_IgM, e.aCL_IgA FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description IS NOT NULL AND p.Description LIKE 'F%' AND (     (SELECT MAX(T_BIL) FROM Laboratory l WHERE l.ID = p.ID AND T_BIL BETWEEN 3.5 AND 7.0)     IN (SELECT T_BIL FROM Laboratory l WHERE l.ID = p.ID AND T_BIL BETWEEN 3.5 AND 7.0) ) ORDER BY T_BIL DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(`aCL IgG`) AS HighestANAConz FROM `Examination` WHERE `aCL IgA` < 1.5;	thrombosis_prediction
SELECT e.ID FROM Examination e JOIN (     SELECT MAX(`aCL IgA`) AS max_aCL_IgA     FROM Examination ) max_aCL_IgA WHERE e.`aCL IgA` = max_aCL_IgA.max_aCL_IgA AND e.`CRE < 1.5`	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.T_BIL >= 2.0 AND E.ANA_Pattern LIKE '%P%';	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM` FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0) AND E.`aCL IgG` IS NOT NULL AND E.`aCL IgM` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG > 1.3 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.SEX = 'F' AND E.aCL_IgG < 250 AND E.aCL_IgM < 250 AND E.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`aCL IgG` < 200 OR e.`aCL IgM` < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.`Diagnosis` AS DiseaseName FROM `Examination` e JOIN `Patient` p ON e.ID = p.ID WHERE e.`aCL IgG` < 200 OR e.`aCL IgM` < 200 OR e.`aCL IgA` < 200 GROUP BY p.ID ORDER BY MAX(e.`aCL IgG` + e.`aCL IgM` + e.`aCL IgA`) DESC LIMIT 1;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 0 AND E.aCL_IgG < 250 OR E.aCL_IgM < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG IS NOT NULL AND E.aCL_IgM IS NOT NULL AND E.Thrombosis IS NOT NULL AND E.aCL_IgG < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG > 180 OR e.aCL_IgM > 180 ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` < 180 AND `Thrombosis` = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.HGB BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.HGB BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE (e.HCT <= 3.5 OR e.HCT >= 6.0) AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgA > 100 AND E.aCL_IgA < 400 AND E.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT E.aCL_IgA, P.Description FROM Examination AS E JOIN Patient AS P ON E.ID = P.ID WHERE E.aCL_IgA BETWEEN 100 AND 400 AND P.Description = 'MCTD';	thrombosis_prediction
SELECT AVG(TAT2) AS average_prothrombin_time FROM Laboratory WHERE `ID` IN (SELECT `ID` FROM Patient WHERE `SEX` = 'M') AND TAT2 < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis IN (1, 2) AND e.aCL_IgG < 14;	thrombosis_prediction
SELECT m.link_to_major, ma.major_name FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Angela' AND m.last_name = 'Sanders';	student_club
SELECT COUNT(*)  FROM `member`  JOIN `major` ON `member`.`link_to_major` = `major`.`major_id`  WHERE `major`.`college` = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Fine Arts and Design';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*)  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT event.event_name, COUNT(attendance.link_to_event) AS attendance_count FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.position = 'Member' AND event.event_name LIKE 'Student_Club%' GROUP BY event.event_id, event.event_name ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT m.link_to_major, m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*) FROM `attendance` a JOIN `event` e ON a.`link_to_event` = e.`event_id` JOIN `member` m ON a.`link_to_member` = m.`member_id` WHERE m.`first_name` = 'Sacha' AND m.`last_name` = 'Harrison' AND e.`event_name` LIKE '%Student_Club%' AND YEAR(e.`event_date`) = 2019;	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting'  AND event_id IN (     SELECT link_to_event      FROM attendance      GROUP BY link_to_event      HAVING COUNT(link_to_member) > 10 );	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 20 ) AND type != 'Fundraiser';	student_club
SELECT      COUNT(DISTINCT e.event_id) / COUNT(DISTINCT e.event_name) AS average_attendance FROM      event e JOIN      attendance a ON e.event_id = a.link_to_event WHERE      e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT expense_description, MAX(cost) AS highest_cost FROM expense WHERE expense_description IS NOT NULL GROUP BY expense_description ORDER BY highest_cost DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT `county` FROM `zip_code` JOIN `member` ON `zip_code.zip_code` = `member.zip` WHERE `member.member_id` = 'rec280Sk7o31iG0Tx';	student_club
SELECT m.major_id, m.college FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.member_id = 'rec2a03QXbFQAUZ7X';	student_club
SELECT SUM(i.amount) AS total_received FROM `income` i JOIN `member` m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT m.city, m.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Outdoor Product Design and Development' AND m.position = 'President' AND m.zip = (SELECT zip FROM zip_code WHERE city = 'Holtsville' AND state = 'New York');	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Illinois');	student_club
SELECT SUM(b.spent) AS total_spent_on_advertisement FROM `budget` b JOIN `event` e ON b.`link_to_event` = e.`event_id` WHERE e.`event_name` = 'September Meeting' AND b.`category` = 'Advertisement';	student_club
SELECT m.major_id, ma.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.member_id = 'rec1x5zBFIqoOuPW8' OR m.member_id = 'rec280Sk7o31iG0Tx';	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker';	student_club
SELECT e.event_name, e.event_date, e.type, e.location, e.status, ex.approved FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE e.event_name = 'October Meeting' AND e.event_date = '2019-10-08' AND ex.approved = 'true';	student_club
SELECT      SUM(exp.cost) AS total_spent,     AVG(exp.cost) AS average_spent FROM      expense AS exp JOIN      member AS mem ON      exp.link_to_member = mem.member_id WHERE      CONCAT(SUBSTRING(exp.expense_date, 6, 2), SUBSTRING(exp.expense_date, 9, 2)) IN ('09', '10')     AND CONCAT(mem.first_name, ' ', mem.last_name) = 'Elijah Allen';	student_club
SELECT      SUM(CASE WHEN LEFT(event_date, 4) = '2019' THEN spent ELSE 0 END) AS spent_2019,     SUM(CASE WHEN LEFT(event_date, 4) = '2020' THEN spent ELSE 0 END) AS spent_2020,     (SUM(CASE WHEN LEFT(event_date, 4) = '2019' THEN spent ELSE 0 END) - SUM(CASE WHEN LEFT(event_date, 4) = '2020' THEN spent ELSE 0 END)) AS diff_spent FROM      event     JOIN budget ON event.event_id = budget.link_to_event WHERE      event.status = 'Closed'	student_club
SELECT `location` FROM `event` WHERE `event_name` = 'Spring Budget Review';	student_club
SELECT SUM(`amount`) AS total_cost FROM `budget` JOIN `event` ON `budget.link_to_event` = `event.event_id` WHERE `event_name` = 'Posters' AND `event_date` = '2019-09-04';	student_club
SELECT `remaining` FROM `budget` WHERE `category` = 'Food' AND `amount` = (SELECT MAX(`amount`) FROM `budget` WHERE `category` = 'Food');	student_club
SELECT notes  FROM income  WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*) FROM major WHERE `college` = 'College of Humanities and Social Sciences';	student_club
SELECT `phone_number`  FROM `member`  WHERE `first_name` = 'Carlo' AND `last_name` = 'Jacobs';	student_club
SELECT `county` FROM `member` JOIN `zip_code` ON `member.zip` = `zip_code.zip_code` WHERE `first_name` = 'Adela' AND `last_name` = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE event_status = 'Closed' AND spent > remaining AND event_name = 'November Meeting';	student_club
SELECT SUM(b.amount) AS total_budget_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Speaker';	student_club
SELECT e.status FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget JOIN budget b ON ex.link_to_budget = b.budget_id WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT m.major_name FROM `member` m JOIN `major` ma ON m.`link_to_major` = ma.`major_id` WHERE m.first_name = 'Brent' AND m.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium';	student_club
SELECT m.zip FROM member m WHERE m.member_id = 'rec1x5zBFIqoOuPW8'	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT state  FROM `member`  JOIN `zip_code` ON `member`.`zip` = `zip_code`.`zip_code`  WHERE `member`.`first_name` = 'Sacha' AND `member`.`last_name` = 'Harrison';	student_club
SELECT m.link_to_major, m.first_name, m.last_name, ma.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT `date_received` FROM `income` WHERE `link_to_member` = 'rec3pH4DxMcWHMRB7' AND `source` = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' AND i.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues')	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /       SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement' AND     (e.event_name = 'Yearly Kickoff' OR e.event_name = 'October Meeting');	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /       COUNT(CASE WHEN e.event_name = 'November Speaker' THEN 1 ELSE NULL END)) * 100 AS parking_budget_percentage FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'November Speaker';	student_club
SELECT SUM(cost) AS total_pizza_cost FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT major_id, college  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT      z.city,      z.county,      z.state  FROM      `member` m  JOIN      `zip_code` z ON m.zip = z.zip_code  WHERE      m.first_name = 'Amy' AND      m.last_name = 'Firth';	student_club
SELECT expense.expense_description, expense.cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT m.member_id, m.first_name, m.last_name, m.email FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT m.link_to_major, COUNT(*) as member_count FROM member m JOIN major ma ON m.link_to_major = ma.major_id GROUP BY m.link_to_major ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360';	student_club
SELECT `event_name`, MAX(`amount`) as `highest_budget` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` GROUP BY `event_name` ORDER BY `highest_budget` DESC LIMIT 1;	student_club
SELECT e.expense_description, e.expense_date, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT `member.member_id`)  FROM `member` JOIN `attendance` ON `member.member_id` = `attendance.link_to_member` JOIN `event` ON `attendance.link_to_event` = `event.event_id` WHERE `event.event_name` = 'Women''s Soccer';	student_club
SELECT date_received  FROM income  WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason');	student_club
SELECT COUNT(*) FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland');	student_club
SELECT COUNT(a.link_to_event)  FROM attendance a  JOIN member m ON a.link_to_member = m.member_id  WHERE m.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT      `event_id`,      `event_name`,      MAX(DIVIDE(`spent`, `amount`)) AS spend_to_budget_ratio FROM      `event`      JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE      `event.status` = 'Closed'      AND `budget.amount` > 0 GROUP BY      `event_id`,      `event_name` ORDER BY      spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget WHERE event_status = 'Closed';	student_club
SELECT COUNT(*) FROM `event` WHERE `type` = 'Meeting' AND YEAR(`event_date`) = 2020;	student_club
SELECT SUM(e.cost) AS total_food_spent FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.event_status = 'Closed' AND e.expense_description LIKE '%Food%';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT first_name, last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(`amount`) AS total_income FROM `income` JOIN `member` ON `income.link_to_member` = `member.member_id` WHERE `member.first_name` = 'Grant' AND `member.last_name` = 'Gilmour';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT      CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM      member m JOIN      budget b ON m.member_id = b.link_to_member JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS highest_income FROM income i JOIN member m ON i.link_to_member = m.member_id GROUP BY m.member_id, m.first_name, m.last_name, i.source ORDER BY highest_income DESC LIMIT 1;	student_club
SELECT `event_name`, MIN(`amount`) AS `lowest_cost` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.category` = 'Food' GROUP BY `event_name` ORDER BY `lowest_cost` ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN e.cost ELSE 0 END) / SUM(e.cost)) * 100 AS percentage_cost_yearly_kickoff FROM      event e;	student_club
SELECT      (SUM(CASE WHEN m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Finance') THEN 1 ELSE 0 END) /       SUM(CASE WHEN m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Physics') THEN 1 ELSE 0 END)) AS finance_to_physics_ratio FROM      member m WHERE      m.link_to_major IS NOT NULL;	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM `member` WHERE position = 'Secretary';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(a.link_to_event) AS event_count, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' JOIN major ma ON m.link_to_major = ma.major_id;	student_club
SELECT AVG(spent) / COUNT(*) AS average_spent_on_food FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT `event_name` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.category` = 'Advertisement' ORDER BY `budget.spent` DESC LIMIT 1;	student_club
SELECT EXISTS (     SELECT 1     FROM `attendance` a     JOIN `member` m ON a.`link_to_member` = m.`member_id`     JOIN `event` e ON a.`link_to_event` = e.`event_id`     WHERE m.`first_name` = 'Maya' AND m.`last_name` = 'Mclean' AND e.`event_name` = 'Women''s Soccer' ) AS attended;	student_club
SELECT      (SUM(CASE WHEN e.type = 'Community Service' THEN 1 ELSE 0 END) * 100.0) / COUNT(e.event_id) AS percentage_community_service FROM      event e WHERE      e.event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(e.cost) AS total_poster_cost FROM expense e JOIN event ev ON e.link_to_event = ev.event_id WHERE ev.event_name = 'September Speaker' AND e.expense_description = 'Posters';	student_club
SELECT `t_shirt_size`, COUNT(`t_shirt_size`) AS `size_count` FROM `member` GROUP BY `t_shirt_size` ORDER BY `size_count` DESC LIMIT 1;	student_club
SELECT event_name FROM event WHERE status = 'Closed' AND link_to_event IN (     SELECT link_to_event     FROM budget     WHERE remaining < 0     ORDER BY ABS(remaining) DESC     LIMIT 1 );	student_club
SELECT expense.expense_description, SUM(expense.cost) AS total_value FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'true' GROUP BY expense.expense_description;	student_club
SELECT `budget_category`, SUM(`amount`) AS `total_budgeted` FROM (     SELECT `budget_id`, `expense_description` AS `budget_category`, `amount`     FROM `budget`     JOIN `event` ON `budget`.`link_to_event` = `event`.`event_id`     WHERE `event_name` = 'April Speaker' ) AS budget_expenses GROUP BY `budget_category` ORDER BY `total_budgeted` ASC;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Advertisement' ORDER BY `amount` DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_parking_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT      m.first_name,      m.last_name,      SUM(e.cost) AS total_cost FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY      m.first_name,      m.last_name;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT m.position  FROM `member` m  JOIN `major` ma ON m.`link_to_major` = ma.`major_id`  WHERE ma.`major_name` = 'Business';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT `type`  FROM `event`  WHERE `location` = 'MU 215';	student_club
SELECT event_name FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT m.link_to_major, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN position = 'Member' AND major_name = 'Business' THEN 1 ELSE 0 END) * 100.0) / COUNT(member_id) AS percentage_business_members FROM      `member` JOIN      `major` ON `member`.`link_to_major` = `major`.`major_id`;	student_club
SELECT `event_name`, `type` FROM `event` WHERE `location` = 'MU 215';	student_club
SELECT COUNT(*)  FROM `income`  WHERE `amount` = 50;	student_club
SELECT COUNT(*) FROM `member` WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM `member` m JOIN `major` ma ON m.`link_to_major` = ma.`major_id` JOIN `event` e ON m.`zip` = e.`event_id` WHERE ma.`college` = 'College of Agriculture and Applied Sciences' AND e.`event_id` = 'rec0akZnLLpGUloLH';	student_club
SELECT m.last_name, ma.major_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND b.spent = 0 AND e.type = 'Guest Speaker';	student_club
SELECT m.zip.city, m.zip.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN member m ON e.location = '900 E. Washington St.' JOIN attendance a ON e.event_id = a.link_to_event JOIN member mem ON a.link_to_member = mem.member_id WHERE mem.position = 'Vice President' AND e.type = 'Social';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      (COUNT(CASE WHEN income.amount = 50 THEN 1 END) * 100.0) / COUNT(DISTINCT member.member_id) AS percentage FROM      income JOIN      member ON income.link_to_member = member.member_id WHERE      member.t_shirt_size = 'Medium' AND      member.position = 'Member';	student_club
SELECT DISTINCT zc.state FROM zip_code zc WHERE zc.type = 'PO Box';	student_club
SELECT DISTINCT zc.zip_code FROM zip_code zc JOIN member m ON zc.zip = m.zip WHERE zc.state = 'Puerto Rico' AND zc.city = 'San Juan Municipio' AND m.t_shirt_size LIKE '%PO Box%';	student_club
SELECT event_name FROM `event` WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense ex ON a.link_to_member = ex.link_to_member WHERE ex.cost > 50;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_name, e.event_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN expense ex ON m.member_id = ex.link_to_member WHERE ex.expense_date BETWEEN '2019-01-10' AND '2019-11-19' AND ex.expense_description = 'Approved'	student_club
SELECT m.link_to_major FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone_number FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Education' AND ma.college = 'College of Education & Human Services';	student_club
SELECT      ROUND((SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) / COUNT(e.event_id)) * 100, 2) AS over_budget_percentage FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      b.remaining < 0;	student_club
SELECT `event_id`, `location`, `event_status` FROM `event` WHERE `event_date` BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, expense_description, expense_date, cost FROM expense WHERE cost > 50 GROUP BY expense_id, expense_description, expense_date, cost HAVING SUM(cost) / COUNT(expense_id) > 50;	student_club
SELECT first_name, last_name FROM `member` WHERE t_shirt_size = 'X-Large';	student_club
SELECT      (SUM(CASE WHEN `type` = 'PO Box' THEN 1 ELSE 0 END) / COUNT(`zip_code`)) * 100 AS percentage_po_box FROM      `zip_code`;	student_club
SELECT event.event_name, event.location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.amount - budget.spent > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, m.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.spent > 100;	student_club
SELECT      e.event_name,      z.city,      z.short_state FROM      event e JOIN      income i ON e.event_id = i.link_to_member JOIN      member m ON i.link_to_member = m.member_id JOIN      zip_code z ON m.zip = z.zip_code GROUP BY      e.event_id,      z.city,      z.short_state HAVING      COUNT(i.income_id) > 40;	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_expense FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id HAVING COUNT(DISTINCT e.event_id) > 1 ORDER BY total_expense DESC LIMIT 1;	student_club
SELECT AVG(CASE WHEN m.position <> 'Member' THEN e.cost END) AS avg_amount_paid FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.position <> 'Member';	student_club
SELECT event_name  FROM event  WHERE cost < (SELECT AVG(cost) FROM expense WHERE expense_description = 'Parking' AND link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event = event.event_id))	student_club
SELECT      ROUND((SUM(CASE WHEN e.type = 'Meeting' THEN e.cost ELSE 0 END) /             (SELECT SUM(cost) FROM event) * 100), 2) AS meeting_cost_percentage FROM      event e;	student_club
SELECT      b.budget_id,     b.amount FROM      budget b JOIN      expense e ON b.budget_id = e.link_to_budget WHERE      e.expense_description LIKE '%Water, chips, cookies%' GROUP BY      b.budget_id ORDER BY      SUM(e.cost) DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT      m.first_name,      m.last_name,      m.phone FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      (SUM(CASE WHEN `state` = 'New Jersey' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) -      (SUM(CASE WHEN `state` = 'Vermont' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_difference FROM      `member` WHERE      `state` IN ('New Jersey', 'Vermont');	student_club
SELECT major.major_name, major.department  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT      CONCAT(m.first_name, ' ', m.last_name) AS full_name,      SUM(e.cost) AS total_spent FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      e.expense_description LIKE '%Water%'      AND e.expense_description LIKE '%Veggie tray%'     AND e.expense_description LIKE '%supplies%' GROUP BY      m.member_id;	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education' AND m.phone IS NOT NULL;	student_club
SELECT b.event_status, b.budget_id, SUM(e.amount) AS total_budgeted FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE b.link_to_event = (     SELECT event_id     FROM event     WHERE event_name = 'January Speaker' ) GROUP BY b.budget_id;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT `category` FROM `expense` WHERE `expense_description` = 'Posters' AND `link_to_budget` IN (SELECT `budget_id` FROM `budget` WHERE `link_to_event` IN (SELECT `event_id` FROM `event`));	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, m.position, ma.college FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT SUM(spent) AS total_spent, event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Speaker Gifts' GROUP BY event_name;	student_club
SELECT zip_code.city FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.city = 'Lincolnton' AND zc.state = 'North Carolina' AND zc.zip_code = 28092;	student_club
SELECT COUNT(*)  FROM gasstations  WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT     (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') /      (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS RatioEURtoCZK	debit_card_specializing
SELECT `CustomerID`, MIN(`Consumption`) AS MinConsumption FROM `yearmonth` WHERE LEFT(`Date`, 6) BETWEEN '201201' AND '201212' GROUP BY `CustomerID` ORDER BY MinConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS Average_Monthly_Consumption FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'SME' ) AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'CZK' AND ym.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY SUM(t.Amount * t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) FROM yearmonth ym WHERE ym.Date BETWEEN '201201' AND '201212' AND ym.Consumption < 30000;	debit_card_specializing
SELECT      (SUM(CASE WHEN yearmonth.Date BETWEEN '201201' AND '201212' THEN Consumption ELSE 0 END)      - SUM(CASE WHEN yearmonth.Date BETWEEN '201201' AND '201212' THEN Consumption ELSE 0 END)) FROM      yearmonth JOIN      customers ON yearmonth.CustomerID = customers.CustomerID WHERE      (customers.Currency = 'CZK' AND yearmonth.Date BETWEEN '201201' AND '201212')     OR (customers.Currency = 'EUR' AND yearmonth.Date BETWEEN '201201' AND '201212') GROUP BY      customers.Currency;	debit_card_specializing
SELECT      YEAR(`Date`) AS `Year`,      SUM(`Consumption`) AS `TotalConsumption` FROM      `yearmonth` WHERE      `Currency` = 'EUR' GROUP BY      `Year` ORDER BY      `TotalConsumption` DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT LEFT(Date, 4) as Year, SUM(Consumption) as TotalConsumption FROM yearmonth WHERE LEFT(Date, 2) = '12' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT `Date` AS PeakMonth, MAX(`Consumption`) AS MaxConsumption FROM `yearmonth` WHERE LEFT(`Date`, 4) = '2013' GROUP BY `Date` ORDER BY MaxConsumption DESC LIMIT 1;	debit_card_specializing
WITH YearlyConsumption AS (     SELECT         SUBSTR(Date, 1, 4) AS Year,         CustomerID,         AVG(Consumption) AS AnnualAverage     FROM yearmonth     WHERE         SUBSTR(Date, 1, 4) = '2013'     GROUP BY CustomerID ), LowestConsumption AS (     SELECT         Segment,         MIN(AnnualAverage) AS MinAnnualAverage     FROM YearlyConsumption     GROUP BY Segment ), SegmentAverages AS (     SELECT         YearlyConsumption.Year,         YearlyConsumption.Segment,         YearlyConsumption.AnnualAverage     FROM YearlyConsumption     JOIN LowestConsumption ON YearlyConsumption.AnnualAverage = LowestConsumption.MinAnnualAverage ), SME_LAM_Difference AS (     SELECT         (SELECT AnnualAverage FROM SegmentAverages WHERE Segment = 'SME') - (SELECT AnnualAverage FROM SegmentAverages WHERE Segment = 'LAM') AS Difference ), LAM_KAM_Difference AS (     SELECT         (SELECT AnnualAverage FROM SegmentAverages WHERE Segment = 'LAM') - (SELECT AnnualAverage FROM SegmentAverages WHERE Segment = 'KAM') AS Difference ), KAM_SME_Difference AS (     SELECT         (SELECT AnnualAverage FROM SegmentAverages WHERE Segment = 'KAM') - (SELECT AnnualAverage FROM SegmentAverages WHERE Segment = 'SME') AS Difference ) SELECT     SME_LAM_Difference.Difference AS SME_LAM,     LAM_KAM_Difference.Difference AS LAM_KAM,     KAM_SME_Difference.Difference AS KAM_SME FROM SME_LAM_Difference, LAM_KAM_Difference, KAM_SME_Difference;	debit_card_specializing
WITH Consumption2012 AS (     SELECT CustomerID, SUM(Consumption) AS TotalConsumption2012     FROM yearmonth     WHERE LEFT(Date, 4) = '2012'     GROUP BY CustomerID ), Consumption2013 AS (     SELECT CustomerID, SUM(Consumption) AS TotalConsumption2013     FROM yearmonth     WHERE LEFT(Date, 4) = '2013'     GROUP BY CustomerID ), SegmentConsumption AS (     SELECT c.CustomerID, c.Segment,             (COALESCE(c2.TotalConsumption2013, 0) - COALESCE(c1.TotalConsumption2012, 0)) AS ConsumptionIncrease,            COALESCE(c2.TotalConsumption2013, 0) AS Consumption2013     FROM customers c     LEFT JOIN Consumption2012 c1 ON c.CustomerID = c1.CustomerID     LEFT JOIN Consumption2013 c2 ON c.CustomerID = c2.CustomerID     WHERE c.Segment IN ('SME', 'LAM', 'KAM') ), SegmentPercentageIncrease AS (     SELECT Segment,             (ConsumptionIncrease / Consumption2013) * 100 AS PercentageIncrease     FROM SegmentConsumption     WHERE Consumption2013 > 0 ) SELECT Segment,         MAX(PercentageIncrease) AS MaxPercentageIncrease,         MIN(PercentageIncrease) AS MinPercentageIncrease FROM SegmentPercentageIncrease GROUP BY Segment;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `CustomerID` = 6 AND `Date` BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount')      -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS DiscountDifference	debit_card_specializing
SELECT   (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -   (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS ConsumptionDifference	debit_card_specializing
SELECT      SUM(CASE WHEN c.Currency = 'CZK' THEN 1 ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      c.CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR' OR Currency = 'CZK')	debit_card_specializing
SELECT c.CustomerID, ym.Consumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,      SUM(y.Consumption) AS TotalConsumption FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      c.CustomerID IN (SELECT CustomerID FROM yearmonth GROUP BY CustomerID HAVING COUNT(*) > 1) GROUP BY      c.CustomerID ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `CustomerID` IN (SELECT `CustomerID` FROM `customers` WHERE `Segment` = 'KAM') AND `Date` = '201305'	debit_card_specializing
SELECT     (COUNT(CASE WHEN ym.Consumption > 46.73 THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM     yearmonth ym JOIN     customers c ON ym.CustomerID = c.CustomerID WHERE     c.Segment = 'LAM';	debit_card_specializing
SELECT g.Country, COUNT(*) AS TotalValueForMoneyGasStations FROM gasstations g WHERE g.Segment = 'Value for money' GROUP BY g.Country ORDER BY TotalValueForMoneyGasStations DESC LIMIT 1;	debit_card_specializing
SELECT   (SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) / COUNT(c.CustomerID)) * 100 AS Percentage_of_KAM_using_Euro FROM   customers c JOIN   yearmonth ym ON c.CustomerID = ym.CustomerID WHERE   c.Segment = 'KAM';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM yearmonth WHERE `Date` = '201202' AND Consumption > 528.3) * 100.0 /      (SELECT COUNT(*) FROM yearmonth WHERE `Date` = '201202') AS PercentageOfCustomersConsumedMoreThanThreshold;	debit_card_specializing
SELECT      (SUM(CASE WHEN g.Country = 'SLO' AND g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN g.Country = 'SLO' THEN 1 ELSE 0 END) AS PremiumGasStationPercentage FROM gasstations g;	debit_card_specializing
SELECT CustomerID, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT      c.Segment,      SUM(ym.Consumption) AS TotalConsumption FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      ym.Date = '201309' GROUP BY      c.Segment ORDER BY      TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201206' AND c.Segment = 'SME' ORDER BY ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) as HighestMonthlyConsumption FROM yearmonth WHERE Date LIKE '201201%'	debit_card_specializing
SELECT      ym.CustomerID,     (ym.Consumption / 12) AS MonthlyConsumption,     MAX(ym.Consumption / 12) AS MaxMonthlyConsumption FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      ym.CustomerID ORDER BY      MaxMonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE LEFT(y.Date, 6) = '201309';	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE ym.Date LIKE '201306';	debit_card_specializing
SELECT DISTINCT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID WHERE t.Price IS NOT NULL;	debit_card_specializing
SELECT AVG(`Price`) AS AverageTotalPrice FROM `transactions_1k` WHERE `Date` LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT p.Description  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  JOIN products p ON t.ProductID = p.ProductID  WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM `transactions_1k` JOIN `gasstations` ON `transactions_1k`.`GasStationID` = `gasstations`.`GasStationID` WHERE `gasstations`.`Country` = 'CZE' AND `transactions_1k`.`Price` > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(`Price`) AS average_total_price FROM `transactions_1k` WHERE `GasStationID` IN (     SELECT `GasStationID`     FROM `gasstations`     WHERE `Country` = 'CZE' );	debit_card_specializing
SELECT      c.CustomerID,      AVG(t.Price * t.Amount) AS AvgTotalPrice FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      c.CustomerID;	debit_card_specializing
SELECT ym.CustomerID, SUM(ym.Consumption) AS TotalPaid FROM yearmonth ym WHERE ym.Date = '2012-08-25' GROUP BY ym.CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT GasStationID, GasStation.Country FROM transactions_1k JOIN GasStation ON transactions_1k.GasStationID = GasStation.GasStationID JOIN GasStationID ON GasStation.GasStationID = GasStationID.GasStationID WHERE transactions_1k.Date = '2012-08-25' ORDER BY transactions_1k.TransactionID LIMIT 1;	debit_card_specializing
SELECT `Price` FROM `transactions_1k` WHERE `Date` = '2012-08-24' AND `Time` = '16:25:00';	debit_card_specializing
SELECT      p.ProductID AS ProductSegment FROM      transactions_1k t JOIN      products p ON t.ProductID = p.ProductID WHERE      t.Date = '2012-08-23' AND      t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Price * Amount = 672.64;	debit_card_specializing
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM transactions_1k AS t1 JOIN customers AS c ON t1.CardID = c.CustomerID JOIN yearmonth AS ym ON c.CustomerID = ym.CustomerID WHERE t1.Date = '2012-08-24' AND t1.Time = '12:42:00' AND ym.Date = '201112';	debit_card_specializing
SELECT ProductID  FROM `transactions_1k`  WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT      ym.Consumption,      ym.Date  FROM      yearmonth ym  WHERE      ym.CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Price = 124.05)      AND ym.Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time BETWEEN '08:00:00' AND '09:00:00' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE');	debit_card_specializing
SELECT c.Currency FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date = '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.CustomerID, g.Country FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE ym.Consumption = 548.4 AND ym.Date = '2012-08-24';	debit_card_specializing
SELECT     (COUNT(DISTINCT t1.CustomerID) / (SELECT COUNT(DISTINCT c.CustomerID) FROM customers c WHERE c.Currency = 'EUR')) * 100 AS percentage FROM     customers c JOIN     yearmonth ym ON c.CustomerID = ym.CustomerID JOIN     transactions_1k t1 ON c.CustomerID = t1.CustomerID WHERE     ym.Date = '2012-08-25'     AND c.Currency = 'EUR';	debit_card_specializing
SELECT   (     (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201208' - INTERVAL 1 MONTH) -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201309')   ) /    (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201208' - INTERVAL 1 MONTH) AS ConsumptionDecreaseRate FROM yearmonth WHERE CustomerID = 5 AND Date = '201208' AND Consumption - (SELECT Amount * Price FROM transactions_1k WHERE Date = '2012-08-25' AND CustomerID = 5) = 634.8	debit_card_specializing
SELECT      `gasstations`.`GasStationID`,      SUM(`transactions_1k`.`Amount` * `transactions_1k`.`Price`) AS `TotalRevenue` FROM      `transactions_1k` JOIN      `gasstations` ON `transactions_1k`.`GasStationID` = `gasstations`.`GasStationID` GROUP BY      `gasstations`.`GasStationID` ORDER BY      `TotalRevenue` DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      gasstations AS g JOIN      customers AS c ON g.Segment = c.Segment WHERE      g.Country = 'SVK'	debit_card_specializing
SELECT SUM(t.Amount * t.Price) AS TotalAmountSpent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508;  SELECT Consumption FROM yearmonth WHERE CustomerID = 38508 AND Date = '201201';	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS TotalAmount FROM `transactions_1k` t JOIN `products` p ON t.ProductID = p.ProductID GROUP BY p.Description ORDER BY TotalAmount DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,      AVG(t.Price) / SUM(t.Amount) AS avg_price_per_item,      c.Currency FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      c.CustomerID, c.Currency ORDER BY      (AVG(t.Price) / SUM(t.Amount)) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country, MAX(t.Price) AS MaxPrice FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.ProductID = 2 GROUP BY g.Country ORDER BY MaxPrice DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 5 AND t.Price / t.Amount > 29.00 AND ym.Date = '201208';	debit_card_specializing
