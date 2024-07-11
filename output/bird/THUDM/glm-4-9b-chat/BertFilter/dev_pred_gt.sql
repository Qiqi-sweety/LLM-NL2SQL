SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM `frpm` WHERE `Academic Year` = '2014-2015' AND `District Code` = 10017;	california_schools
SELECT      CDSCode,      `Percent (%) Eligible Free (Ages 5-17)`  FROM      `frpm`  WHERE      `Educational Option Type` = 'Continuation Schools'  ORDER BY      `Percent (%) Eligible Free (Ages 5-17)` ASC  LIMIT 3;	california_schools
SELECT `schools.Zip` FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE `frpm.County Name` = 'Fresno' AND `frpm.Charter School (Y/N)` = 1;	california_schools
SELECT      s.MailStreet,      s.MailStrAbr,      s.MailCity,      s.MailZip,      s.MailState  FROM      frpm f  JOIN      schools s ON f.CDSCode = s.CDSCode  WHERE      f.FRPM Count (K-12) = (SELECT MAX(FRPM Count (K-12)) FROM frpm)	california_schools
SELECT      s.Phone  FROM      frpm f  JOIN      schools s ON f.CDSCode = s.CDSCode  WHERE      f.Charter_School_(Y/N) = 1      AND f.Charter_Funding_Type = 'Directly funded'      AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.AvgScrMath > 400 AND sch.GSserved = 'F';	california_schools
SELECT s.CDSCode, s.NCESSchool FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.enroll12 > 500 AND s.Magnet = 1;	california_schools
SELECT      s.AdmEmail1  FROM      `schools` s  JOIN      `satscores` sc ON s.CDSCode = sc.cds  WHERE      sc.NumGE1500 > 0  ORDER BY      sc.NumGE1500 DESC  LIMIT 1;	california_schools
SELECT s.CDSCode, SUM(satscores.cds) AS SAT_Takers FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode JOIN satscores ON schools.CDSCode = satscores.cds WHERE frpm.FRPM_Count_(K-12) = (SELECT MAX(FRPM_Count_(K-12)) FROM frpm) GROUP BY s.CDSCode;	california_schools
SELECT COUNT(DISTINCT frpm.CDSCode) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.`Enrollment (K-12)` IS NOT NULL AND frpm.`Percent (%) Eligible Free (K-12)` IS NOT NULL AND frpm.`FRPM Count (K-12)` IS NOT NULL AND (frpm.`Enrollment (K-12)` * frpm.`Percent (%) Eligible Free (K-12) / 100) >= frpm.`FRPM Count (K-12)` AND satscores.cds IN (SELECT cds FROM satscores) AND frpm.`Percent (%) Eligible FRPM (K-12)` IS NOT NULL AND (frpm.`Enrollment (K-12)` * frpm.`Percent (%) Eligible FRPM (K-12) / 100) >= frpm.`FRPM Count (K-12)` AND frpm.`Percent (%) Eligible FRPM (K-12) > 560 AND schools.Charter = 1;	california_schools
SELECT frpm.FRM_Count__Ages_5_17 FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds JOIN (     SELECT cds, AVG(Reading) as AvgScore     FROM satscores     JOIN schools ON satscores.cds = schools.CDSCode     WHERE schools.NCESDist = '0691051'     GROUP BY cds ) AS school_scores ON frpm.CDSCode = school_scores.cds WHERE school_scores.AvgScore = (     SELECT MAX(AvgScore)     FROM (         SELECT cds, AVG(Reading) as AvgScore         FROM satscores         JOIN schools ON satscores.cds = schools.CDSCode         WHERE schools.NCESDist = '0691051'         GROUP BY cds     ) AS max_score_schools )	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT      MAX(`Percent (%) Eligible Free (Ages 5-17)`) AS HighestEligibleFreeRate FROM      frpm WHERE      `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.rtype = 'S' ORDER BY (ss.NumGE1500 / ss.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT s.NCESDist, AVG(sat.ReadingScore) AS AvgReadingScore FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.NCESDist IS NOT NULL AND sat.ReadingScore IS NOT NULL GROUP BY s.NCESDist ORDER BY AvgReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores WHERE enroll12 < 100;	california_schools
SELECT      s.CDSCode,     s.Charter,     AVG(s.AvgScrWrite) AS AvgWriteScore FROM      satscores s JOIN      schools sch ON s.cds = sch.CDSCode WHERE      s.AvgScrWrite > 499 AND      s.cds IN (SELECT CDSCode FROM frpm WHERE `Charter School (Y/N)` = 1 AND `Charter School Number` IS NOT NULL) GROUP BY      s.CDSCode, s.Charter ORDER BY      AvgWriteScore DESC;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.State = 'CA' AND s.FundingType = 'Directly funded' AND s.CountyCode = '01' AND ss.enroll12 <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.rtype = 'S' AND ss.sname IS NOT NULL GROUP BY s.CDSCode, s.Phone ORDER BY AVG(ss.NumGE1500) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Code` = '01' AND `Low Grade` = '9' AND `High Grade` = '12';	california_schools
SELECT COUNT(*) FROM frpm WHERE `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700 AND `CDSCode` IN (SELECT `CDSCode` FROM schools WHERE `NCESDist` = '0691051');	california_schools
SELECT s.NCESSchool, s.NCESDist, SUM(satscores.enroll12) AS TotalTestTakers FROM satscores JOIN schools s ON s.CDSCode = satscores.cds WHERE s.NCESDist = '0691051' GROUP BY s.NCESSchool ORDER BY TotalTestTakers DESC LIMIT 1;	california_schools
SELECT      s.School,      s.Street,      s.StreetAbr,      s.City,      s.Zip FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.CDSCode, s.CDSCode AS SchoolName FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sat ON s.CDSCode = sat.cds WHERE f.`Percent (%) Eligible Free (K-12)` > 0.1 AND sat.cds IN (SELECT cds FROM satscores WHERE cds IN (SELECT CDSCode FROM frpm WHERE `Percent (%) Eligible Free (K-12)` > 0.1) AND cds IN (SELECT CDSCode FROM satscores WHERE cds IN (SELECT CDSCode FROM frpm WHERE `Percent (%) Eligible Free (K-12)` > 0.1) AND `2013-14 CALPADS Fall 1 Certification Status` = 1) AND `2013-14 CALPADS Fall 1 Certification Status` = 1) AND `2013-14 CALPADS Fall 1 Certification Status` = 1 GROUP BY s.CDSCode	california_schools
SELECT      s.NCESDist,      s.NCESSchool,      s.FundingType FROM      schools s JOIN      (SELECT           s.CDSCode,           AVG(satscores.AvgScrRead) AS AvgMathScore      FROM           schools s      JOIN           satscores ON s.CDSCode = satscores.cds      WHERE           s.State = 'CA' AND s.NCESDist = '0691051'      GROUP BY           s.CDSCode      HAVING           AvgMathScore > 400) AS high_math_avg ON      s.CDSCode = high_math_avg.CDSCode;	california_schools
SELECT      s.`School Name`,      s.`MailStreet`,      s.`District`,      s.`State`,      s.`MailZip` FROM      `frpm` f JOIN      `schools` s ON f.CDSCode = s.CDSCode WHERE      s.`State` = 'CA'      AND s.`DOCType` = 'HS'     AND f.`Free Meal Count (Ages 5-17)` > 800     AND f.`School Name` LIKE 'Monterey%'	california_schools
SELECT      s.School,      ss.AvgScrWrite,      s.Phone FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      (s.OpenDate > '1991-01-01' OR s.StatusType = 'Closed' AND s.OpenDate < '2000-01-01')     AND ss.rtype = 'S'     AND ss.sname IS NOT NULL	california_schools
WITH K12vs15_17 AS (     SELECT          s.School,          s.DOCType,          (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) AS K12vs15_17Diff     FROM          frpm f     JOIN          schools s ON f.CDSCode = s.CDSCode     WHERE          f.`Charter School (Y/N)` = 0 ), AvgDiff AS (     SELECT          AVG(K12vs15_17Diff) AS AvgDifference     FROM          K12vs15_17 ) SELECT      k.School,      k.DOCType FROM      K12vs15_17 k, AvgDiff a WHERE      k.K12vs15_17Diff > a.AvgDifference;	california_schools
SELECT      s.LastUpdate  FROM      frpm f  JOIN      schools s ON f.CDSCode = s.CDSCode  WHERE      f.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm)      AND s.`StatusType` = 'Active'      AND s.`Charter` IS NOT NULL ORDER BY      s.LastUpdate  LIMIT 1;	california_schools
SELECT s.State, s.NCESSchool, frpm.`Enrollment (K-12)` FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE s.StatusType = 'Active' ORDER BY frpm.`Enrollment (K-12)` ASC LIMIT 5;	california_schools
SELECT `Percent (%) Eligible Free (K-12)`  FROM `frpm`  ORDER BY `Enrollment (K-12)` DESC  LIMIT 10, 2;	california_schools
SELECT      `School Name`,      `Percent (%) Eligible FRPM (K-12)`  FROM      `frpm`  WHERE      `School Type` = 'K-12 Schools (Public)'      AND `NSLP Provision Status` = '66'  ORDER BY      `FRPM Count (K-12)` DESC  LIMIT 5;	california_schools
SELECT `School Name`, `Website` FROM `frpm` WHERE `Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT      (t1.`Free Meal Count (Ages 5-17)` / t1.`Enrollment (Ages 5-17)` * 100) AS Free_Rate FROM      `frpm` AS t1 JOIN      `schools` AS t2 ON      t1.CDSCode = t2.CDSCode WHERE      t2.AdmFName1 = 'Kacey' AND t2.AdmLName1 = 'Gibson';	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Enrollment (K-12)` = (SELECT MIN(`Enrollment (K-12)`) FROM frpm WHERE `Charter School (Y/N)` = 1) AND f.`Low Grade` = '1' AND f.`High Grade` = '12';	california_schools
SELECT      s.AdmFName1,      s.AdmLName1,      s.AdmEmail1,      s.AdmFName2,      s.AdmLName2,      s.AdmEmail2,      s.AdmFName3,      s.AdmLName3,      s.AdmEmail3 FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      ss.NumGE1500 IS NOT NULL     AND ss.NumGE1500 > 0 GROUP BY      s.CDSCode, s.AdmFName1, s.AdmLName1, s.AdmEmail1, s.AdmFName2, s.AdmLName2, s.AdmEmail2, s.AdmFName3, s.AdmLName3, s.AdmEmail3 ORDER BY      SUM(ss.NumGE1500) DESC LIMIT 1;	california_schools
SELECT      Street,      City,      Zip,      State FROM      schools JOIN      satscores ON schools.CDSCode = satscores.cds WHERE      (NumGE1500 / NumTstTakr) = (         SELECT              MIN((NumGE1500 / NumTstTakr))         FROM              satscores         WHERE              rtype = 'S' -- Only consider schools, not districts     );	california_schools
SELECT s.CDSCode, s.NCESDist, s.NCESSchool, s.StatusType, s.StreetAbr, s.MailStreet, s.MailState, s.FundingType, s.DOCType, s.GSserved, s.Magnet, s.LastUpdate FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.NCESDist = '0691051' AND sc.enroll12 BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(enroll12) AS AverageTestTakers FROM satscores WHERE YEAR(`LastUpdate`) = 1980;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.District = 'Fresno Unified' AND sc.AvgScrRead IS NOT NULL ORDER BY sc.AvgScrRead ASC LIMIT 1;	california_schools
SELECT sname FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.Virtual = 'F' GROUP BY schools.County, satscores.sname ORDER BY schools.County, AVG(satscores.AvgScrRead) DESC LIMIT 5;	california_schools
SELECT      s.CDSCode,     s.Type FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds JOIN      (SELECT           cds,           AVG(Math) as AvgMath      FROM           satscores      GROUP BY           cds) AS highest_math ON      s.CDSCode = highest_math.cds WHERE      highest_math.AvgMath = (SELECT                                 MAX(AvgMath)                            FROM                                 (SELECT                                      cds,                                      AVG(Math) as AvgMath                                 FROM                                      satscores                                 GROUP BY                                      cds) as max_avg) JOIN      (SELECT           Type      FROM           schools) AS school_type ON      s.CDSCode = school_type.CDSCode;	california_schools
SELECT      s.CountyName,      AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AvgAllSubjectScore FROM      frpm f JOIN      satscores s ON f.CDSCode = s.cds GROUP BY      s.CountyName ORDER BY      AvgAllSubjectScore LIMIT 1;	california_schools
SELECT s.NCESDist, AVG(satscores.AvgScrWrite) AS AvgWritingScore FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 IS NOT NULL GROUP BY s.NCESDist ORDER BY SUM(satscores.NumGE1500) DESC LIMIT 1;	california_schools
SELECT s.School, AVG(s.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN (     SELECT AdmFName1, AdmLName1     FROM schools     WHERE AdmLName1 = 'Ulrich' ) ricci ON s.AdmLName1 = ricci.AdmLName1 OR s.AdmLName2 = ricci.AdmLName1 OR s.AdmLName3 = ricci.AdmLName1 GROUP BY s.School;	california_schools
SELECT      s.NCESSchool,      fpm.`Enrollment (K-12)` FROM      frpm fpm JOIN      schools s ON fpm.CDSCode = s.CDSCode WHERE      s.DOCType = '31' AND      fpm.Low_Grade = '1' AND      fpm.High_Grade = '12' ORDER BY      fpm.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT      COUNT(*) / 12 AS MonthlyAvgOpenings FROM      schools WHERE      `StatusType` = 'Open'     AND `Year` = '1980'     AND `DOCType` = '52'     AND `County` = 'Alameda';	california_schools
SELECT     SUM(CASE WHEN s.DOCType = 'ELEM' THEN 1 ELSE 0 END) AS ElemDistrictCount,     SUM(CASE WHEN s.DOCType = 'UNI' THEN 1 ELSE 0 END) AS UniDistrictCount FROM     schools s WHERE     s.County = 'Orange'     AND s.District = 'Merged';	california_schools
SELECT      `schools.County Name`,      COUNT(*) AS `Closed Schools Count`,      GROUP_CONCAT(`schools.School` ORDER BY `schools.School`) AS `Schools` FROM      `schools` WHERE      `schools.StatusType` = 'Closed' GROUP BY      `schools.County Name` ORDER BY      `Closed Schools Count` DESC LIMIT 1;	california_schools
SELECT `schools.Street`, `schools.School` FROM `schools` JOIN `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE `satscores.AvgScrMath` = (     SELECT MAX(`satscores.AvgScrMath`) - (         SELECT COUNT(DISTINCT `satscores.AvgScrMath`)         FROM `satscores`         WHERE `satscores.AvgScrMath` < (             SELECT `satscores.AvgScrMath`             FROM `satscores`             ORDER BY `satscores.AvgScrMath` DESC             LIMIT 6         )     ) ) ORDER BY `satscores.AvgScrMath` DESC LIMIT 1;	california_schools
SELECT s.MailStreet, s.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores) ORDER BY s.MailStreet ASC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.MailCity = 'Lakeport' AND (sc.AvgScrRead + sc.AvgScrMath + sc.AvgScrWrite) >= 1500;	california_schools
SELECT SUM(`NumTstTakr`) AS TotalTestTakers FROM `schools` JOIN `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE `schools.MailCity` = 'Fresno';	california_schools
SELECT s.CDSCode, s.District, s.State FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Avetik Atoian';	california_schools
SELECT      (SELECT COUNT(*)       FROM schools s       JOIN frpm f ON s.CDSCode = f.CDSCode       WHERE s.State = 'CA' AND f.County Code = '01') /      (SELECT COUNT(*)       FROM schools s       JOIN frpm f ON s.CDSCode = f.CDSCode       WHERE s.State = 'CA' AND f.County Code = '02') AS Ratio;	california_schools
SELECT COUNT(*) FROM schools WHERE `State` = 'CA' AND `City` = 'San Joaquin';	california_schools
SELECT `schools`.`MailStreet`, `schools`.`MailState`, `schools`.`AdmFName1`, `schools`.`AdmLName1`, `schools`.`AdmEmail1` FROM `schools` JOIN (     SELECT `cds`     FROM `satscores`     WHERE `rtype` = 'D' AND `AvgScrWrite` IS NOT NULL     ORDER BY `AvgScrWrite` DESC     LIMIT 1 OFFSET 332 ) AS subquery ON `schools`.`CDSCode` = subquery.cds;	california_schools
SELECT `School`, `Phone`, `StreetAbr` FROM `schools` WHERE `Zip` = '95203-3704';	california_schools
SELECT s.Website  FROM schools s  JOIN (     SELECT AdmFName1, AdmLName1, AdmEmail1      FROM schools      WHERE AdmLName1 = 'Larson' OR AdmLName1 = 'Alvarez' ) adm ON s.AdmFName1 = adm.AdmFName1 AND s.AdmLName1 = adm.AdmLName1;	california_schools
SELECT `Website` FROM `schools` WHERE `Charter` = 1 AND `Virtual` = 'P' AND `County` = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND DOC = '52' AND City = 'Hickman';	california_schools
SELECT COUNT(*) FROM frpm WHERE `Percent (%) Eligible Free (K-12)` < 0.18 AND `Charter School (Y/N)` = 0 AND `County Code` = '01' AND `School Code` LIKE '010%'	california_schools
SELECT      s.School,      s.City,      a.AdmFName1,      a.AdmLName1,      a.AdmFName2,      a.AdmLName2,      a.AdmFName3,      a.AdmLName3 FROM      schools s JOIN      schools a ON s.CDSCode = a.CDSCode WHERE      s.Charter = 1 AND      s.CharterNum = '00D2' AND      (a.AdmFName1 IS NOT NULL OR a.AdmLName1 IS NOT NULL OR       a.AdmFName2 IS NOT NULL OR a.AdmLName2 IS NOT NULL OR       a.AdmFName3 IS NOT NULL OR a.AdmLName3 IS NOT NULL);	california_schools
SELECT COUNT(DISTINCT s.CDSCode)  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.MailCity = 'Hickman' AND f.Charter School Number = '00D4';	california_schools
SELECT     (COUNT(CASE WHEN s.FundingType = 'Locally funded' THEN 1 END) * 100.0) / COUNT(*) AS PercentageLocallyFunded FROM     schools s WHERE     s.State = 'CA' AND     s.District = 'Santa Clara County Office of Education';	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND District = 'Stanislaus';	california_schools
SELECT SUM(`Enrollment (K-12)`) AS TotalClosureEnrollment FROM `frpm` WHERE `Academic Year` = '1989-1990' AND `District Code` = (SELECT `District Code` FROM `schools` WHERE `City` = 'San Francisco' AND `StatusType` = 'Closed') AND `District Code` IN (SELECT `District Code` FROM `schools` WHERE `FundingType` LIKE '%Community College%');	california_schools
SELECT `County` FROM `schools` WHERE `SOCType` = '11' AND `OpenDate` BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY `County` ORDER BY COUNT(`CDSCode`) DESC LIMIT 1;	california_schools
SELECT `NCESDist` FROM `schools` WHERE `StatusType` = 'Active' AND `Charter` IS NOT NULL AND `FundingType` = 'Directly funded' AND `EILCode` = '31';	california_schools
SELECT      SUM(CASE WHEN `StatusType` = 'Active' THEN 1 ELSE 0 END) AS ActiveCount,     SUM(CASE WHEN `StatusType` = 'Closed' THEN 1 ELSE 0 END) AS ClosedCount FROM      `schools` WHERE      `County` = 'Alpine' AND      `School` LIKE 'District Community Day School%';	california_schools
SELECT `District Code` FROM `schools` WHERE `City` = 'Fresno' AND `Magnet` = 0;	california_schools
SELECT `Enrollment (Ages 5-17)` FROM `frpm` WHERE `Academic Year` = '2014-2015' AND `EdOpsCode` = 'SSS' AND `School Name` LIKE '%Fremont%';	california_schools
SELECT frpm.`Free Meal Count (Ages 5-17)` FROM `frpm` JOIN `schools` ON frpm.CDSCode = schools.CDSCode WHERE schools.`MailStreet` = 'PO Box 1040' AND schools.`District` = 'Youth Authority School';	california_schools
SELECT MIN(`High Grade`) AS LowestGrade FROM `schools` WHERE `EdOpsCode` = 'SPECON' AND `NCESDist` = '0613360';	california_schools
SELECT `schools`.`School`, `schools`.`EdOpsName` FROM `schools` JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode` WHERE `frpm`.`Educational Option Type` = 'Breakfast Provision 2' AND `schools`.`County Code` = '37';	california_schools
SELECT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.EILCode = 'HS' AND f.Low_Grade = '9' AND f.High_Grade = '12' AND f.NSLP_Provision_Status = '2' AND s.District = 'Merced';	california_schools
SELECT      `School Name`,      `Percent (%) Eligible FRPM (Ages 5-17)` FROM      `frpm` WHERE      `County Code` = '01'     AND `High Grade` IN ('9', '12')     AND `District Name` = 'Los Angeles Unified School District'	california_schools
SELECT `GSoffered` AS GradeSpan, COUNT(`GSoffered`) AS Count FROM `schools` WHERE `City` = 'Adelanto' GROUP BY `GSoffered` ORDER BY Count DESC LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS NumSchools FROM      schools WHERE      County IN ('San Diego', 'Santa Barbara')      AND Virtual = 'F' GROUP BY      County ORDER BY      NumSchools DESC LIMIT 1;	california_schools
SELECT s.`NCESDist`, s.`CDSCode`, l.latitude FROM `schools` s JOIN `locations` l ON s.CDSCode = l.CDSCode ORDER BY l.latitude DESC LIMIT 1;	california_schools
SELECT      s.City,      s.School,      MIN(s.Latitude) AS MinLatitude,      MIN(s.GSoffered) AS LowestGrade FROM      schools s WHERE      s.State = 'CA' GROUP BY      s.City ORDER BY      MinLatitude ASC LIMIT 1;	california_schools
SELECT      `schools`.`CDSCode`,      `schools`.`GSoffered`,      `schools`.`GSserved` FROM      `schools` ORDER BY      ABS(`schools`.`Longitude`) DESC LIMIT 1;	california_schools
SELECT      s.State,      s.District,      COUNT(DISTINCT s.CDSCode) AS NumberOfSchools,     COUNT(DISTINCT CASE WHEN frpm.NSLP_Provision_Status = 'Multiple Provision Types' THEN s.CDSCode ELSE NULL END) AS NumberOfSchoolsWithMultipleProvisionTypes FROM      schools s JOIN      frpm ON s.CDSCode = frpm.CDSCode WHERE      s.GSoffered LIKE '%K-8%' GROUP BY      s.State, s.District;	california_schools
SELECT      AdmFName1,      District,      COUNT(*) AS AdminCount FROM      schools WHERE      AdmFName1 IS NOT NULL GROUP BY      AdmFName1,      District ORDER BY      AdminCount DESC LIMIT 2;	california_schools
SELECT      frpm.`Percent (%) Eligible Free (K-12)`,      schools.NCESDist FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode JOIN      (         SELECT              CDSCode          FROM              schools          WHERE              AdmFName1 = 'Alusine'     ) AS admins ON frpm.CDSCode = admins.CDSCode;	california_schools
SELECT      s.AdmLName1 AS AdminLastName,      s.District AS District,      s.CountyCode AS County,      sc.SchoolName AS SchoolName FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.SchoolName = 'Charter number 40';	california_schools
SELECT      s.AdmEmail1,      s.AdmEmail2,      s.AdmEmail3 FROM      schools s WHERE      s.State = 'CA' AND     s.MailStreet LIKE '%San Bernardino%' AND     s.DOCType = '54' AND     s.StatusType = 'Active' AND     s.NCESDist = '0700050' AND     s.LastUpdate BETWEEN '2009-01-01' AND '2010-12-31'	california_schools
SELECT s.CDSCode, s.AdministratorEmail FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE EXISTS (     SELECT 1     FROM frpm f     WHERE f.CDSCode = s.CDSCode       AND (f.`Percent (%) Eligible FRPM (K-12)` > 0 OR f.`Percent (%) Eligible FRPM (Ages 5-17)` > 0) ) AND (     SELECT COUNT(*)     FROM satscores ss2     WHERE ss2.cds = s.CDSCode       AND (SELECT SUM(CASE WHEN sc.Score >= 1500 THEN 1 ELSE 0 END) FROM satscores sc WHERE sc.cds = s.CDSCode) ) = (     SELECT MAX(test_takers)     FROM (         SELECT COUNT(*) AS test_takers         FROM satscores ss3         WHERE EXISTS (             SELECT 1             FROM frpm f2             WHERE f2.CDSCode = ss3.cds               AND (f2.`Percent (%) Eligible FRPM (K-12)` > 0 OR f2.`Percent (%) Eligible FRPM (Ages 5-17)` > 0)         )         GROUP BY ss3.cds     ) AS subquery )	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = a.account_id );	financial
SELECT      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         ELSE '1996'     END AS higher_unemployment_year FROM     (SELECT          district_id,          AVG(A12) AS A12,          AVG(A13) AS A13     FROM         (SELECT              d.district_id,             a12.value AS A12,             a13.value AS A13         FROM             (SELECT                  district_id,                 (SELECT AVG(unemployment_rate)                   FROM unemployment                   WHERE year = 1995 AND district_id = district.district_id) AS A12,             (SELECT AVG(unemployment_rate)               FROM unemployment               WHERE year = 1996 AND district_id = district.district_id) AS A13         FROM district) a     ) b GROUP BY district_id) c GROUP BY      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         ELSE '1996'     END;	financial
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND A16 = 'F';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A10 > 8000;	financial
SELECT a.account_id,         c.gender,         d.A11 AS average_salary FROM account a JOIN client c ON a.account_id = c.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' ORDER BY d.A11 ASC LIMIT 1 INTO @lowest_avg_salary; SELECT a.account_id,         c.gender,         d.A11 AS average_salary FROM account a JOIN client c ON a.account_id = c.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' ORDER BY d.A11 DESC LIMIT 1 INTO @highest_avg_salary; SELECT @highest_avg_salary - @lowest_avg_salary AS salary_gap;	financial
SELECT c.client_id FROM client c JOIN (     SELECT district_id     FROM client     ORDER BY birth_date DESC     LIMIT 1 ) youngest_district ON c.district_id = youngest_district.district_id JOIN (     SELECT a.account_id     FROM account a     JOIN (         SELECT district_id, AVG(amount) as avg_salary         FROM account a         JOIN loan l ON a.account_id = l.account_id         GROUP BY district_id         ORDER BY avg_salary DESC         LIMIT 1     ) highest_avg_salary ON c.district_id = highest_avg_salary.district_id	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE YEAR(l.date) = 1997 AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT account.account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND account.date BETWEEN '1993-01-01' AND '1993-12-31' AND (SELECT MAX(loan.amount) FROM loan WHERE loan.account_id = account.account_id AND loan.duration > 12) ORDER BY loan.amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov';	financial
SELECT DISTINCT a.account_id FROM account a WHERE a.date BETWEEN '1995-01-01' AND '1995-12-31' AND a.date = (SELECT MIN(date) FROM account WHERE date BETWEEN '1995-01-01' AND '1995-12-31');	financial
SELECT DISTINCT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date < '1997-01-01' AND l.amount > 3000;	financial
SELECT c.client_id FROM `client` c JOIN `card` crd ON c.client_id = crd.disp_id WHERE crd.issued = '1994-03-03';	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.date = '1998-10-14' AND t.account_id = (     SELECT account_id     FROM trans     WHERE amount = 840 );	financial
SELECT a.district_id FROM loan l JOIN account ac ON l.account_id = ac.account_id JOIN disp d ON ac.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dt ON c.district_id = dt.district_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS max_transaction_amount FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `card` crd ON d.disp_id = crd.disp_id JOIN `trans` t ON d.account_id = t.account_id WHERE crd.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND d.A10 = (SELECT MAX(A10) FROM district);	financial
SELECT t1.amount FROM `loan` AS l1 JOIN `account` AS a ON l1.account_id = a.account_id JOIN `trans` AS t1 ON t1.account_id = a.account_id WHERE l1.amount = (SELECT MAX(amount) FROM `loan`) AND t1.trans_id IN (     SELECT MIN(trans_id)      FROM `trans`      WHERE account_id = l1.account_id ) ORDER BY t1.trans_id LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT d.disp_id FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.date = '1998-09-02' AND t.k_symbol = '5100' AND d.client_id IN (SELECT client_id FROM client WHERE birth_date BETWEEN '1960-01-01' AND '1969-12-31');	financial
SELECT COUNT(*)  FROM account  WHERE DATE_FORMAT(date, '%Y') = '1996' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice');	financial
SELECT d.A2 AS district_name FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dt ON c.district_id = dt.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.duration = 12 AND l.payments = 2523.0 AND l.date = '1996-01-03';	financial
SELECT account.account_id  FROM account  JOIN district ON account.district_id = district.district_id  JOIN client ON account.account_id = client.account_id  WHERE district.A3 = 'Prague'  ORDER BY account.date ASC  LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(c.client_id) AS male_clients_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'South Bohemia'     AND d.A4 = (SELECT MAX(A4) FROM district WHERE A3 = 'South Bohemia');	financial
SELECT      ((SELECT balance FROM account WHERE account_id = (SELECT account_id FROM loan ORDER BY date ASC LIMIT 1) AND date = '1998-12-27')      - (SELECT balance FROM account WHERE account_id = (SELECT account_id FROM loan ORDER BY date ASC LIMIT 1) AND date = '1993-03-22'))      / (SELECT balance FROM account WHERE account_id = (SELECT account_id FROM loan ORDER BY date ASC LIMIT 1) AND date = '1993-03-22') * 100 AS increase_rate;	financial
SELECT     (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS paid_loan_percentage FROM     loan l;	financial
SELECT      (COUNT(CASE WHEN l.amount < 100000 AND l.status = 'C' THEN 1 END) * 100.0) / COUNT(DISTINCT l.account_id) AS running_accounts_percentage FROM      loan l	financial
SELECT      a.account_id,     d.A2 AS district_name,     d.A3 AS district_region FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      a.date = '1993-02-26'     AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE d.district_id = 5 -- Assuming 'east Bohemia' corresponds to district_id 5 AND YEAR(a.date) BETWEEN 1995 AND 2000;	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3 AS district, d.A10 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN district d2 ON d.district_id = d2.district_id WHERE l.duration = 60;	financial
SELECT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_rate FROM district d JOIN client c ON d.district_id = c.district_id JOIN loan l ON c.client_id = l.account_id WHERE d.A12 IS NOT NULL AND d.A13 IS NOT NULL AND l.status = 'D';	financial
SELECT      (COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 END) * 100.0) / COUNT(*) FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      a.date BETWEEN '1993-01-01' AND '1993-12-31';	financial
SELECT DISTINCT `account_id` FROM `account` WHERE `frequency` = 'POPLATEK MESICNE';	financial
SELECT      d.district_id,      COUNT(c.client_id) AS num_female_account_holders FROM      district d JOIN      client c ON d.district_id = c.district_id WHERE      c.gender = 'F' GROUP BY      d.district_id ORDER BY      num_female_account_holders DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, SUM(o.amount) AS total_withdrawals FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `district` d ON a.district_id = d.district_id WHERE o.k_symbol = 'VYDAJ' AND a.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'South Bohemia' AND a.account_id NOT IN (     SELECT c.card_id     FROM card c     JOIN disp d ON c.disp_id = d.disp_id     JOIN account a ON d.account_id = a.account_id     WHERE a.account_id = d.account_id );	financial
SELECT d.A2 AS district_name, COUNT(l.loan_id) AS active_loan_count FROM district d JOIN loan l ON d.district_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.district_id ORDER BY active_loan_count DESC LIMIT 1;	financial
SELECT AVG(`loan.amount`) AS average_loan_amount FROM `loan` JOIN `client` ON `loan.account_id` = `client.client_id` WHERE `client.gender` = 'M';	financial
SELECT A2 AS branch_location, A5 AS district_name, A13 AS unemployment_rate FROM `district` WHERE A13 = (SELECT MAX(A13) FROM `district` WHERE YEAR(`date`) = 1996) AND YEAR(`date`) = 1996;	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A16 = (SELECT MAX(A16) FROM district WHERE A16 IS NOT NULL AND A2 = 'Hl.m. Praha' AND A3 = 'Prague' AND A4 = '1204953')	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND t.k_symbol = 'VYBER KARTOU' AND a.account_id IN (     SELECT account_id     FROM account     WHERE account_id NOT IN (         SELECT account_id         FROM `loan`         WHERE duration > 0     ) ) AND (SELECT SUM(CASE WHEN t.k_symbol = 'VYBER KARTOU' THEN -t.amount ELSE 0 END) - SUM(CASE WHEN t.k_symbol != 'VYBER KARTOU' THEN t.amount ELSE 0 END)       FROM trans t WHERE t.account_id = a.account_id) < 0;	financial
SELECT COUNT(DISTINCT l.loan_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND l.status IN ('C', 'D');	financial
SELECT COUNT(c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A15 = (     SELECT A15      FROM district      WHERE A15 = (         SELECT MAX(A15)          FROM district          WHERE A15 < (SELECT MAX(A15) FROM district)     ) ) AND c.gender = 'M';	financial
SELECT COUNT(DISTINCT c.card_id) FROM `card` c JOIN `disp` d ON c.card_id = d.disp_id JOIN `client` cl ON d.client_id = cl.client_id WHERE c.type = 'gold' AND cl.gender = 'OWNER';	financial
SELECT COUNT(*) FROM `account` WHERE `district_id` IN (SELECT `district_id` FROM `district` WHERE `A2` = 'Pisek');	financial
SELECT d.A2, SUM(o.amount) AS total_amount FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `client` c ON a.account_id = c.district_id JOIN `district` d ON c.district_id = d.district_id WHERE a.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY d.A2 HAVING SUM(o.amount) > 10000;	financial
SELECT DISTINCT o.account_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `client` c ON a.district_id = c.district_id JOIN `district` d ON c.district_id = d.district_id WHERE d.A2 = 'Pisek' AND o.k_symbol = 'SIPO';	financial
SELECT DISTINCT a.account_id FROM account AS a JOIN disp AS d ON a.account_id = d.account_id JOIN card AS c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT AVG(amount) AS average_credit_card_amount FROM `order` WHERE k_symbol = 'VYBER KARTOU' AND date BETWEEN '2021-01-01' AND '2021-12-31';	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id JOIN `order` o ON a.account_id = o.account_id WHERE o.amount < (SELECT AVG(amount) FROM `order` WHERE k_symbol = 'VYBER KARTOU' AND date LIKE '1998%') AND o.k_symbol = 'VYBER KARTOU' AND date LIKE '1998%';	financial
SELECT DISTINCT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card cr ON a.account_id = cr.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND cr.type = 'gold';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.account_id = c.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 LIKE '%south Bohemia%';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT a.account_id, d.district_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency != 'OWNER' AND d.A11 BETWEEN 8000 AND 9000 AND a.account_id NOT IN (     SELECT l.account_id     FROM loan l );	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON d.district_id = dt.district_id JOIN trans t ON a.account_id = t.account_id WHERE dt.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.k_symbol = 'VYDAJ';	financial
SELECT AVG(d.A15) AS average_crimes FROM district d JOIN account a ON d.district_id = a.district_id WHERE d.A15 > 4000 AND a.date >= '1997-01-01';	financial
SELECT COUNT(*) FROM account a JOIN card c ON a.account_id = c.card_id JOIN disp d ON a.account_id = d.account_id JOIN client cl ON d.client_id = cl.client_id WHERE c.type = 'classic' AND a.frequency = 'OWNER';	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha';	financial
SELECT      (COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0) / COUNT(c.card_id) AS gold_card_percent FROM      `card` c;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT `district`.A15 FROM `account` JOIN `district` ON `account`.district_id = `district`.district_id WHERE `account`.account_id = 532 AND `account`.date = '1995-01-01';	financial
SELECT `account`.district_id FROM `account` JOIN `order` ON `account`.account_id = `order`.account_id WHERE `order`.order_id = 33333;	financial
SELECT t.account_id FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `disp` d ON a.account_id = d.account_id JOIN `client` c ON d.client_id = c.client_id WHERE c.client_id = 3356 AND t.k_symbol = 'VYBER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 13539;	financial
SELECT `district`.`A3` AS `region` FROM `client` JOIN `district` ON `client`.`district_id` = `district`.`district_id` WHERE `client`.`client_id` = 3541;	financial
SELECT d.district_id, COUNT(a.account_id) AS account_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY account_count DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date, d.district_id, d.A2 FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `account` a ON d.account_id = a.account_id JOIN `order` o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT trans.trans_id FROM trans JOIN account ON trans.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE district.district_id = 5;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Jesenik';	financial
SELECT DISTINCT c.client_id FROM client c JOIN card crd ON c.client_id = crd.disp_id WHERE crd.type = 'junior' AND crd.issued >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) /      COUNT(c.gender) AS women_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A11 > 10000;	financial
SELECT     ROUND(((SUM(CASE WHEN l.date BETWEEN '1997-01-01' AND '1997-12-31' THEN l.amount ELSE 0 END) - SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END)) /      SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END) * 100), 2) AS growth_rate FROM     loan l JOIN     client c ON l.account_id IN (SELECT account_id FROM account WHERE district_id IN (SELECT district_id FROM district)) WHERE     c.gender = 'M'	financial
SELECT COUNT(*) FROM `order` WHERE `k_symbol` = 'VYBER KARTOU' AND `date` > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN T1.A3 = 'North Bohemia' THEN T1.A16 ELSE 0 END) -       SUM(CASE WHEN T1.A3 = 'East Bohemia' THEN T1.A16 ELSE 0 END)) AS crime_difference FROM      `district` T1 WHERE      T1.A3 IN ('North Bohemia', 'East Bohemia') AND     T1.A4 = '1996';	financial
SELECT COUNT(*)  FROM `disp`  WHERE `account_id` BETWEEN 1 AND 10;	financial
SELECT      COUNT(`account_id`) AS statement_requests,     SUM(CASE WHEN `k_symbol` = '3539' THEN `amount` ELSE 0 END) AS total_debit_3539 FROM      `trans` WHERE      `account_id` = 3     AND `k_symbol` IN ('', '3539');	financial
SELECT      YEAR(birth_date) AS birth_year FROM      client WHERE      client_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT     l.amount AS total_debt,     SUM(l.payments) AS total_payments FROM     loan l JOIN     account a ON l.account_id = a.account_id JOIN     disp d ON a.account_id = d.account_id JOIN     client c ON d.client_id = c.client_id WHERE     c.client_id = 992 GROUP BY     l.loan_id;	financial
SELECT      SUM(t.amount) AS total_sum,     c.gender FROM      `trans` t JOIN      `account` a ON t.account_id = a.account_id JOIN      `loan` l ON a.account_id = l.account_id JOIN      `client` c ON a.district_id = c.district_id WHERE      t.trans_id = 851     AND c.client_id = 4 GROUP BY      c.client_id;	financial
SELECT c.card_id FROM `card` c JOIN `disp` d ON c.card_id = d.disp_id JOIN `client` cl ON d.client_id = cl.client_id WHERE cl.client_id = 9;	financial
SELECT SUM(amount) AS total_payment FROM `trans` WHERE `account_id` IN (     SELECT `account_id`     FROM `disp`     WHERE `client_id` = 617 )	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.district_id = 1;	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN order o ON a.account_id = o.account_id WHERE c.gender = 'M' AND c.district_id = d.district_id AND c.district_id = a.district_id AND YEAR(o.date) BETWEEN 1974 AND 1976 AND o.k_symbol = 'SIPO' AND o.amount > 4000;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A4 = '1204953' AND date > '1996-12-31');	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN card crd ON c.client_id = crd.disp_id WHERE c.gender = 'F' AND crd.type = 'junior';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS percentage_female FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'Prague'	financial
SELECT     ROUND(         (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN 1 END),         2     ) AS percentage_male_weekly_statements FROM     account a JOIN     client c ON a.account_id = c.district_id WHERE     a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' AND l.amount = (     SELECT MIN(loans.amount)     FROM loan loans     WHERE loans.duration > 24 ) ORDER BY l.amount ASC LIMIT 1;	financial
SELECT ac.account_id FROM account ac JOIN client cl ON ac.district_id = cl.district_id JOIN district dis ON cl.district_id = dis.district_id WHERE cl.gender = 'F' AND dis.A11 = (SELECT MIN(A11) FROM district dis2 JOIN client cl2 ON dis2.district_id = cl2.district_id WHERE cl2.gender = 'F') ORDER BY cl.birth_date ASC LIMIT 1;	financial
SELECT COUNT(c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.birth_date BETWEEN '1920-01-01' AND '1920-12-31'  AND d.A3 = 'East Bohemia';	financial
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration = 24 AND account.frequency = 'POPLATEK TYDNE';	financial
SELECT AVG(l.amount) AS average_loan_amount FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status IN ('C', 'D') AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT c.client_id, d.district_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK MESICNE';	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id WHERE crd.type = 'gold' AND d.type = 'OWNER';	financial
SELECT bond_type, COUNT(bond_type) as count FROM bond GROUP BY bond_type ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.molecule_id NOT IN (     SELECT m.molecule_id     FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id     WHERE a.element = 'cl'     JOIN molecule_label ml ON m.molecule_id = ml.molecule_id     WHERE ml.label = 'carcinogenic' );	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS average_oxygen_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN a.molecule_id IN (SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '+') THEN 1 ELSE 0 END)  FROM atom a;	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.molecule_id IN (     SELECT m.molecule_id     FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id     WHERE a.element = 'cl' )	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) /          COUNT(a.atom_id),         2     ) AS percentage_of_carbon FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element <> 'br';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` BETWEEN 'TR000' AND 'TR099' AND `label` = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_type = '=';	toxicology
SELECT `element`, COUNT(`atom_id`) AS `count` FROM `atom` WHERE `element` = 'h' GROUP BY `element` ORDER BY `count` DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl';	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON a1.atom_id = c2.atom_id2 AND c1.bond_id = c2.bond_id JOIN atom a2 ON c2.atom_id = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN molecule m ON c1.molecule_id = m.molecule_id AND c2.molecule_id = m.molecule_id WHERE m.molecule_id LIKE 'TR%' AND m.molecule_id NOT IN ('TR001') GROUP BY a1.atom_id, a2.atom_id HAVING COUNT(DISTINCT a1.atom_id) > 1 OR COUNT(DISTINCT a2.atom_id) > 1;	toxicology
SELECT `element` FROM `atom` WHERE `molecule_id` IN (     SELECT `molecule_id`     FROM `molecule`     WHERE `label` = '-' ) GROUP BY `element` ORDER BY COUNT(`element`) ASC LIMIT 1;	toxicology
SELECT bond_type FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20') OR       (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT b.bond_type FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id AND a.element <> 'sn' WHERE b.bond_type NOT IN ('+', '-')	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS atom_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR181') OR       c.atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') UNION SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') OR       a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR181');	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'f' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT a.atom_id), 2) AS percentage_carcinogenic_no_fluorine FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')     AND a.element <> 'f';	toxicology
SELECT      DIVIDE(SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100, COUNT(bond.bond_id)) AS percent FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.label = '+'	toxicology
SELECT element, COUNT(*) AS count FROM atom WHERE molecule_id = 'TR000' AND element IN ('cl', 'c', 'h') GROUP BY element ORDER BY element ASC LIMIT 3;	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR001' AND b.bond_id = 'TR001_2_6';	toxicology
SELECT      (SELECT COUNT(*) FROM molecule WHERE label = '+') -      (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;	toxicology
SELECT a1.atom_id FROM connected AS c JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_2_5';	toxicology
SELECT c.bond_id FROM connected c WHERE c.atom_id = 'TR000_2' OR c.atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY m.molecule_id ASC LIMIT 5;	toxicology
SELECT CAST(SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) / COUNT(bond.bond_id) * 100 AS percent FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.molecule_id), 3) AS carcinogenic_percentage FROM (     SELECT a.molecule_id, CASE WHEN m.label = '+' THEN 1 ELSE 0 END AS label     FROM `atom` a     JOIN `molecule` m ON a.molecule_id = m.molecule_id ) AS m	toxicology
SELECT ROUND(DIVIDE(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END), COUNT(a.atom_id)) * 100, 4) AS percent FROM atom a WHERE a.molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.atom_id2 = (SELECT atom_id FROM atom WHERE molecule_id = 'TR060') OR c.atom_id = (SELECT atom_id FROM atom WHERE molecule_id = 'TR060');	toxicology
SELECT bond_type,         COUNT(bond_type) AS bond_count,        CASE             WHEN COUNT(bond_type) = (SELECT MAX(bond_count) FROM (SELECT bond_type, COUNT(bond_type) AS bond_count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type) AS subquery) THEN 'Yes'            ELSE 'No'        END AS is_majority FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type;	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN atom a2 ON m.molecule_id = a2.molecule_id JOIN bond b ON a1.atom_id = b.bond_id OR a2.atom_id = b.bond_id WHERE b.bond_type = '-' AND m.molecule_id IN (SELECT molecule_id FROM molecule) GROUP BY m.molecule_id HAVING COUNT(DISTINCT a1.atom_id, a2.atom_id) = 2 ORDER BY m.molecule_id ASC LIMIT 3;	toxicology
SELECT `bond_id`, COUNT(`bond_id`) as count FROM `connected` JOIN `bond` ON `connected`.`bond_id` = `bond`.`bond_id` WHERE `bond`.`molecule_id` = 'TR006' GROUP BY `bond_id` ORDER BY `bond_id` ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'br' AND m.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT bond.`bond_type`, atom1.`atom_id` AS atom1, atom2.`atom_id` AS atom2 FROM bond JOIN connected ON bond.`bond_id` = connected.`bond_id` JOIN atom AS atom1 ON connected.`atom_id` = atom1.`atom_id` JOIN atom AS atom2 ON connected.`atom_id2` = atom2.`atom_id` WHERE bond.`bond_id` = 'TR001_6_9';	toxicology
SELECT m.molecule_id, CASE WHEN m.molecule_id = 'TR001' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS carcinogenicity FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(`bond_id`) AS connection_count FROM `connected` WHERE `atom_id` = 'TR%_19' OR `atom_id2` = 'TR%_19';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT c.bond_id FROM connected AS c JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'p' OR a2.element = 'p' OR a1.element = 'n' OR a2.element = 'n';	toxicology
SELECT      m.molecule_id,     COUNT(b.bond_type) AS double_bond_count,     CASE          WHEN COUNT(b.bond_type) = 0 THEN 0          ELSE 1      END AS is_carcinogenic FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      b.bond_type = '=' GROUP BY      m.molecule_id ORDER BY      double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(b.bond_id)) / COUNT(a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'i';	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE SUBSTR(atom.atom_id, 7, 2) + 0 = 45 OR SUBSTR(atom.atom_id, 7, 2) + 0 = 45;	toxicology
SELECT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id IS NULL;	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN bond b ON a1.atom_id = b.bond_id OR a1.atom_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#' AND a1.molecule_id = 'TR041' AND a2.molecule_id = 'TR041';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT      m.molecule_id,      COUNT(b.bond_type = '=') AS double_bond_count FROM      molecule m JOIN      bond b ON m.molecule_id = b.molecule_id WHERE      m.molecule_id IN (         SELECT              molecule_id          FROM              atom          WHERE              element = '+'     )     AND b.bond_type = '=' GROUP BY      m.molecule_id ORDER BY      double_bond_count DESC LIMIT 1;	toxicology
SELECT element, COUNT(*) AS frequency FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY frequency ASC LIMIT 1;	toxicology
SELECT DISTINCT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'pb' AND c.bond_id IS NOT NULL;	toxicology
SELECT a.element FROM atom a JOIN bond b ON a.atom_id = b.bond_id WHERE b.bond_type = '#' GROUP BY a.atom_id;	toxicology
SELECT      (COUNT(bond_id) * 100) /      (SELECT COUNT(DISTINCT a.atom_id)       FROM atom a       INNER JOIN connected c ON a.atom_id = c.atom_id       WHERE a.element =         (SELECT element          FROM atom          GROUP BY element          ORDER BY COUNT(atom_id) DESC          LIMIT 1)) AS percentage_of_common_bonds FROM bond;	toxicology
SELECT      ROUND((SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100) / COUNT(b.bond_id), 5) AS single_bond_carcinogenic_proportion FROM      bond b JOIN      connected c ON b.bond_id = c.bond_id WHERE      b.bond_type = '-' AND      EXISTS (         SELECT 1         FROM molecule m         WHERE m.molecule_id = b.molecule_id         AND m.molecule_id IN ('TR001', 'TR002', 'TR004', 'TR006')     );	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE a1.element = 's';	toxicology
SELECT bond.bond_type FROM atom JOIN bond ON atom.atom_id = bond.molecule_id WHERE atom.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) AS unique_elements FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '-' JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element IS NOT NULL;	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br');	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id IN ('TR001', 'TR004', 'TR006')	toxicology
SELECT DISTINCT b.molecule_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-' AND c.atom_id2 = c.atom_id;	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100,          2     ) AS percentage_chlorine FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-';	toxicology
SELECT `molecule_id`, CASE WHEN `molecule_id` = 'TR000' THEN '+' ELSE '-' END AS label FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE m.molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'cl')	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_carcinogenic_molecules FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE m.molecule_id BETWEEN 'TR000' AND 'TR030' AND b.bond_type = '+';	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN atom a2 ON a1.atom_id = a2.atom_id JOIN connected c ON c.atom_id = a1.atom_id OR c.atom_id = a2.atom_id WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(bond.bond_id)  FROM bond  JOIN atom ON bond.molecule_id = atom.molecule_id  WHERE atom.element = 'i';	toxicology
SELECT     m.molecule_id,     MAX(CASE WHEN a.element = 'ca' THEN c.label ELSE NULL END) AS most_common_carcinogenicity FROM     molecule m JOIN     atom a ON m.molecule_id = a.molecule_id JOIN     connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 GROUP BY     m.molecule_id ORDER BY     most_common_carcinogenicity = '+' DESC, m.molecule_id;	toxicology
SELECT COUNT(*)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'cl'  AND b.bond_id = 'TR001_1_8'  AND EXISTS (     SELECT 1      FROM atom a2      JOIN connected c2 ON a2.atom_id = c.atom_id OR a2.atom_id = c.atom_id2      JOIN bond b2 ON c2.bond_id = b2.bond_id      WHERE a2.element = 'c'      AND b2.bond_id = 'TR001_1_8' );	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c' AND b.bond_type = '#' AND b.molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%') AND b.molecule_id NOT IN (SELECT molecule_id FROM bond WHERE bond_type = '-' AND molecule_id LIKE 'TR%');	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.molecule_id)) * 100, 2) AS percentage_cl FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%')     AND m.molecule_id IN (SELECT molecule_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '+'))	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR001') AND a.element IN ('Hg', 'Pb', 'Cd', 'As', 'Cr', 'Se', 'Ni', 'Sn', 'Sb', 'Bi', 'F', 'Cl', 'Br', 'I', 'At', 'Be', 'B', 'Al', 'S', 'O', 'N', 'P', 'Te', 'Po', 'Au', 'Pt', 'Ag', 'H', 'Li', 'Be', 'B', 'C', 'N', 'O', 'F', 'Ne', 'Na', 'Mg', 'Al', 'Si', 'P', 'S', 'Cl', 'Ar', 'K', 'Ca', 'Sc', 'Ti', 'V', 'Cr', 'Mn', 'Fe', 'Co', 'Ni', 'Cu', 'Zn', 'Ga', 'Ge', 'As', 'Se', 'Br', 'Kr', 'Rb', 'Sr', 'Y', 'Zr', 'Nb', 'Mo', 'Tc', 'Ru', 'Rh', 'Pd', 'Ag', 'Cd', 'In', 'Sn', 'Sb', 'Te', 'I', 'Xe', 'Cs', 'Ba', 'La', 'Ce', 'Pr', 'Nd', 'Pm', 'Sm', 'Eu', 'Gd', 'Tb', 'Dy', 'Ho', 'Er', 'Tm', 'Yb', 'Lu', 'Hf', 'Ta', 'W', 'Re', 'Os', 'Ir', 'Pt', 'Au', 'Hg', 'Tl', 'Pb', 'Bi', 'Po', 'At', 'Rn', 'Fr', 'Ra', 'Ac', 'Th', 'Pa', 'U', 'Np', 'Pu', 'Am', 'Cm', 'Bk', 'Cf', 'Es', 'Fm', 'Md', 'No', 'Lr', 'Rf', 'Db', 'Sg', 'Bh', 'Hs', 'Mt', 'Ds', 'Rg', 'Cn', 'Nh', 'Fl', 'Mc	toxicology
SELECT DISTINCT b.molecule_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '=';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a.element AS toxicology_element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(*) FROM atom a JOIN bond b ON a.atom_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.molecule_id IN (     SELECT molecule_id     FROM connected     WHERE bond_id IN (         SELECT bond_id         FROM bond         WHERE bond_type = '-' AND molecule_id = m.molecule_id         GROUP BY bond_id         HAVING COUNT(*) = 1     ) );	toxicology
SELECT bond_type  FROM bond  WHERE bond_id = 'TR001_10_11';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.molecule_id IN (     SELECT molecule_id     FROM molecule     JOIN atom ON molecule.molecule_id = atom.molecule_id     GROUP BY molecule.molecule_id     HAVING COUNT(DISTINCT atom.atom_id) = 3 ) UNION SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.molecule_id IN (     SELECT molecule.molecule_id     FROM molecule     JOIN atom ON molecule.molecule_id = atom.molecule_id     JOIN bond ON atom.molecule_id = bond.molecule_id     GROUP BY molecule.molecule_id     HAVING COUNT(DISTINCT bond.bond_id) = 2 ) JOIN molecule AS carcinogenic ON bond.molecule_id = carcinogenic.molecule_id WHERE carcinogenic.label = '+';	toxicology
SELECT atom.element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id IN (     SELECT molecule_id     FROM molecule     JOIN (         SELECT DISTINCT substr(atom_id, 7, 1) AS atom_number         FROM atom         JOIN connected ON atom.atom_id = connected.atom_id         JOIN bond ON connected.bond_id = bond.bond_id         WHERE substr(atom_id, 7, 1) = '4'     ) AS fourth_atoms ON molecule.molecule_id = fourth_atoms.molecule_id     WHERE molecule.label = '+' );	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) AS ratio,     CASE          WHEN m.label = '+' THEN '+'         WHEN m.label = '-' THEN '-'         ELSE 'Unknown'     END AS label FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006'	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND EXISTS (     SELECT 1     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     JOIN atom a2 ON c.atom_id = a2.atom_id OR c.atom_id2 = a2.atom_id     WHERE m.molecule_id = b.molecule_id     GROUP BY a2.atom_id     HAVING COUNT(DISTINCT b.bond_id) = 1 AND SUM(CASE WHEN a2.element = '+' THEN 1 ELSE 0 END) > 0 );	toxicology
SELECT b.bond_type FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id AND a.element = 'c' JOIN connected c ON b.bond_id = c.bond_id;	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN atom a2 ON a1.atom_id = SUBSTR('TR001_10_11', 7, 2) WHERE a2.atom_id = SUBSTR('TR001_10_11', 10, 2) AND a1.element IN ('c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a2.element IN ('c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT      (SELECT COUNT(*)       FROM `bond`       WHERE `bond_type` = '#') /      (SELECT COUNT(DISTINCT `molecule_id`)       FROM `molecule`) * 100 AS triple_bond_percentage;	toxicology
SELECT      ROUND(         (SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) / COUNT(bond.bond_id)) * 100,         2     ) AS percent_double_bond FROM      bond WHERE      bond.molecule_id = 'TR047';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id WHERE a.atom_id = 'TR001_1' AND m.label = '+';	toxicology
SELECT      CASE          WHEN c.molecule_id = 'TR151' THEN 'Yes'         ELSE 'No'     END AS is_carcinogenic FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      molecule m ON c.molecule_id = m.molecule_id WHERE      m.molecule_id = 'TR151' AND a.element = '+';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'i', 'pb', 'te');	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.molecule_id >= 'TR010' AND m.molecule_id <= 'TR050';	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id IN (     SELECT molecule_id      FROM molecule      WHERE `label` = '+' ) AND a.molecule_id IS NOT NULL;	toxicology
SELECT b.bond_id FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN connected c2 ON c1.atom_id = c2.atom_id2 AND c1.bond_id = c2.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id IN ('TR001') AND b.bond_type = '!';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.molecule_id IN (     SELECT molecule_id     FROM connected c     JOIN bond b ON c.bond_id = b.bond_id     WHERE b.bond_type = '+' );	toxicology
SELECT molecule_id  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.atom_id = 'TR000_1' AND bond.bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c' AND b.bond_type = '-' GROUP BY a.atom_id HAVING COUNT(DISTINCT b.bond_id) = (SELECT COUNT(DISTINCT bond_id) FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '=')) - 1;	toxicology
SELECT      ROUND(DIVIDE(SUM(CASE WHEN `atom`.`element` = 'h' THEN 1 ELSE 0 END AND `molecule`.`molecule_id` IN (SELECT `molecule_id` FROM `connected` WHERE `bond_id` IN (SELECT `bond_id` FROM `bond` WHERE `bond_type` = '+')))           OVER(),           COUNT(`molecule`.`molecule_id`)) * 100.0, 2) AS percentage_carcinogenic_with_hydrogen FROM `molecule`;	toxicology
SELECT CASE WHEN COUNT(*) > 0 THEN '+' ELSE '-' END AS carcinogenicity FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR124' AND atom.element = 'cl';	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR186';	toxicology
SELECT `bond_type` FROM `bond` WHERE `bond_id` = 'TR007_4_19';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN atom a2 ON a1.atom_id = a2.atom_id JOIN bond b ON b.bond_id = a1.atom_id AND b.bond_id = a2.atom_id WHERE b.bond_id = 'TR001_2_4' AND a1.element != a2.element;	toxicology
SELECT COUNT(*) AS double_bonds_count,         CASE WHEN SUM(CASE WHEN `molecule_id` = 'TR006' AND `bond_type` = '=' THEN 1 ELSE 0 END) > 0 THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM bond WHERE `molecule_id` = 'TR006' AND `bond_type` = '=';	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id IN ('TR000', 'TR001', 'TR002', 'TR004', 'TR006') AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND m.molecule_id LIKE 'TR%+'	toxicology
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id, GROUP_CONCAT(DISTINCT a.element ORDER BY a.element) AS elements FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_id LIKE '%#%' AND a.element IN ('c', 'n', 'o', 's', 'p', 'se', 'sn', 'pb', 'te', 'po', 'at', 'h', 'li', 'be', 'b', 'c', 'n', 'o', 'f', 'ne', 'na', 'mg', 'al', 'si', 'p', 's', 'cl', 'ar', 'k', 'ca', 'sc', 'ti', 'v', 'cr', 'mn', 'fe', 'co', 'ni', 'cu', 'zn', 'ga', 'ge', 'as', 'se', 'rb', 'sr', 'y', 'zr', 'nb', 'mo', 'tc', 'ru', 'rh', 'pd', 'ag', 'cd', 'in', 'sn', 'sb', 'te', 'i', 'x', 'cs', 'ba', 'la', 'ce', 'pr', 'nd', 'pm', 'sm', 'eu', 'gd', 'tb', 'dy', 'ho', 'er', 'tm', 'yb', 'lu', 'hf', 'ta', 'w', 're', 'os', 'ir', 'pt', 'au', 'hg', 'tl', 'pb', 'bi', 'po', 'at', 'rn', 'fr', 'ra', 'ac', 'th', 'pa', 'u', 'np', 'pu', 'am', 'cm', 'bk', 'cf', 'es', 'fm', 'md', 'no', 'lr', 'rf', 'db', 'sg', 'bh', 'hs', 'mt', 'ds', 'rg', 'cn', 'fl', 'mc', 'lv', 'ts', 'og') GROUP BY m.molecule_id	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'cl';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR346';  SELECT COUNT(DISTINCT c.bond_id)  FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.molecule_id = 'TR346' AND a2.molecule_id = 'TR346';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS double_bond_molecules,         SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'c' AND a2.element = 'c';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN (     SELECT DISTINCT a.molecule_id     FROM atom a     JOIN bond b ON a.molecule_id = b.molecule_id     WHERE b.bond_type = '=' ) AND molecule_id NOT IN (     SELECT DISTINCT a.molecule_id     FROM atom a     WHERE a.element = 's' );	toxicology
SELECT b.bond_type FROM bond b WHERE b.bond_id = 'TR001_2_4' AND b.bond_type = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id AND a.element = 'cl' JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m_carcinogenic ON m.molecule_id = m_carcinogenic.molecule_id AND m_carcinogenic.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT      DIVIDE(SUM(CASE WHEN label = '+' AND element = 'cl' THEN 1 ELSE 0 END), COUNT(DISTINCT molecule_id)) AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      label = '+';	toxicology
SELECT molecule_id  FROM bond  WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT `bond_type` FROM `bond` JOIN `connected` ON `bond.bond_id` = `connected.bond_id` WHERE `connected.atom_id` = 'TR000_1' OR `connected.atom_id2` = 'TR000_1' AND `connected.atom_id` = 'TR000_2' OR `connected.atom_id2` = 'TR000_2';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE a1.atom_id = 'TR000_2' OR a2.atom_id = 'TR000_4';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT m.molecule_id, m.label FROM molecule m WHERE m.molecule_id = 'TR000';	toxicology
SELECT      DIVIDE(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END), COUNT(a.atom_id)) AS percentage FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id WHERE      b.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM `molecule` m JOIN `atom` a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND EXISTS (     SELECT 1      FROM `molecule` m2     JOIN `atom` a2 ON m2.molecule_id = a2.molecule_id     WHERE m2.molecule_id = m.molecule_id     AND a2.element = '+' );	toxicology
SELECT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element != 'c' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_2_3' AND a.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0) /      COUNT(DISTINCT a.molecule_id) AS percentage_carcinogenic_triple_bond_hydrogens FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%' AND molecule_id NOT LIKE '%TR00%' AND molecule_id NOT LIKE '%TR0%')	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id IN (     SELECT molecule_id     FROM atom     JOIN connected ON atom.atom_id = connected.atom_id     JOIN bond ON connected.bond_id = bond.bond_id     GROUP BY molecule_id     HAVING COUNT(DISTINCT atom_id) = 1 ) AND molecule_id IN (     SELECT molecule_id     FROM molecule     WHERE label = '+' );	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT c.molecule_id) FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND NOT EXISTS (     SELECT 1     FROM atom a     JOIN molecule m2 ON a.molecule_id = m2.molecule_id     WHERE m2.molecule_id = m.molecule_id     AND a.element = 'c' );	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR002' UNION SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR002';	toxicology
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR012' AND atom.element = 'c' AND bond.bond_type = '=';	toxicology
SELECT a.atom_id  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id LIKE 'TR%' AND a.element = 'o' AND m.molecule_id IN ('TR004', 'TR006');	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id, name FROM cards WHERE borderColor IS NULL AND cardKingdomFoilId IS NULL AND cardKingdomId IS NULL;	card_games
SELECT      c.name,      MAX(c.faceConvertedManaCost) AS max_face_mana_cost FROM      cards c GROUP BY      c.name HAVING      MAX(c.faceConvertedManaCost) > c.convertedManaCost;	card_games
SELECT `name` FROM `cards` WHERE `frameVersion` = '2015' AND `edhrecRank` < 100;	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type LIKE '%Artifact%' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT cards.id FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.artist = 'Stephen Daniel' AND rulings.text IS NOT NULL;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT      c.name AS card_name,     c.artist AS artist_name,     COUNT(r.id) AS ruling_count,     c.isPromo AS is_promo FROM      cards c JOIN      rulings r ON c.uuid = r.uuid GROUP BY      c.id ORDER BY      ruling_count DESC LIMIT 1;	card_games
SELECT `name`, `language` FROM `foreign_data` WHERE `name` = 'Annul' AND `multiverseid` = 29;	card_games
SELECT card_name FROM cards WHERE language = 'Japanese';	card_games
SELECT      (COUNT(*) FILTER (WHERE language = 'Chinese Simplified') * 100.0) / COUNT(*) AS percentageChineseSimplified FROM cards;	card_games
SELECT      st.code,     st.translation AS setName,     s.totalSetSize FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT card_type)  FROM card_art  WHERE artist = 'Aaron Boyd';	card_games
SELECT keyword FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT `promoTypes` FROM `cards` WHERE `name` = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `originalType`  FROM `cards`  WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT t.language FROM foreign_data f JOIN cards c ON f.uuid = c.uuid JOIN sets s ON c.setCode = s.code JOIN set_translations t ON s.code = t.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT text  FROM cards  WHERE name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT status  FROM Cards  WHERE name = 'Cloudchaser Eagle';	card_games
SELECT card_type FROM cards WHERE card_name = 'Benalish Knight';	card_games
SELECT rule_format FROM card_rules WHERE card_name = 'Benalish Knight';	card_games
SELECT DISTINCT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Phyrexian' AND cards.name LIKE '%Phyrexian%';	card_games
SELECT      (COUNT(CASE WHEN `borderColor` = 'borderless' THEN 1 END) * 100.0) / COUNT(`id`) AS percentage_borderless_cards FROM      `cards`;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*) FROM Cards WHERE borderColor = 'borderless' AND language = 'Russian';	card_games
SELECT     (COUNT(CASE WHEN fd.language = 'French' AND c.isStorySpotlight = 1 THEN c.id END) * 100.0) / COUNT(CASE WHEN c.isStorySpotlight = 1 THEN c.id END) FROM     cards c JOIN     foreign_data fd ON c.uuid = fd.uuid WHERE     c.isStorySpotlight = 1;	card_games
SELECT COUNT(*)  FROM Cards  WHERE toughness = 99;	card_games
SELECT card_name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'black' AND `availability` = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT card_layout FROM cards WHERE keyword = 'flying';	card_games
SELECT COUNT(*) FROM Cards WHERE OriginalType = 'Summon - Angel' AND Subtype <> 'Angel';	card_games
SELECT c.id FROM cards c WHERE c.hasFoil = 1 AND c.hasNonFoil = 1 AND (c.cardKingdomFoilId IS NOT NULL OR c.cardKingdomId IS NOT NULL);	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT `edhrecRank`  FROM `cards`  WHERE `frameVersion` = '2015';	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.language = 'Chinese Simplified' AND foreign_data.language = 'Chinese Simplified';	card_games
SELECT card_name FROM cards WHERE availability = 'paper' AND language = 'Japanese' AND NOT EXISTS (     SELECT 1     FROM cards     WHERE card_name = cards.card_name AND (availability = 'digital' OR language != 'Japanese') );	card_games
SELECT COUNT(*) FROM Cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT c.uuid, fd.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy' AND fd.language IS NOT NULL;	card_games
SELECT ruling FROM card_table WHERE name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) AS total_cards_with_future_frame_version,        GROUP_CONCAT(DISTINCT l.status ORDER BY l.status ASC) AS legality_statuses FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal';	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT color, format FROM cards WHERE id BETWEEN 1 AND 20;	card_games
SELECT c.name, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language != 'English';	card_games
SELECT `cards.name` FROM `cards` JOIN `rulings` ON `cards.uuid` = `rulings.uuid` WHERE `cards.rarity` = 'uncommon' ORDER BY `rulings.date` ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL AND power IS NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM `cards` WHERE `frameVersion` = '1993' AND `availability` LIKE '%paper%' AND `hasContentWarning` = 1;	card_games
SELECT `manaCost` FROM `cards` WHERE `layout` = 'normal' AND `frameVersion` = '2003' AND `borderColor` = 'black' AND `availability` = 'mtgo,paper';	card_games
SELECT SUM(CAST(manaCost AS REAL)) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT type FROM cards WHERE availability LIKE '%arena%';	card_games
SELECT s.setCode FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'Spanish';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN `cards`.frameEffects = 'legendary' AND `cards`.isOnlineOnly = 1 THEN 1 END) / COUNT(`cards`.id)) * 100,          2     ) AS legendary_frame_effect_online_percentage FROM      `cards` WHERE      `cards`.frameEffects = 'legendary';	card_games
SELECT      (SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN c.isStorySpotlight = 1 THEN 1 ELSE 0 END) AS Percentage FROM      cards c UNION ALL SELECT      c.id FROM      cards c WHERE      c.isStorySpotlight = 1 AND c.isTextless = 0 ORDER BY      c.id;	card_games
SELECT     name,     ROUND((SUM(CASE WHEN fd.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(c.id), 2) AS percentage_Spanish FROM     cards c LEFT JOIN     foreign_data fd ON c.uuid = fd.uuid GROUP BY     c.name ORDER BY     percentage_Spanish DESC;	card_games
SELECT t.language FROM set_translations t JOIN sets s ON t.setCode = s.code WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT id FROM cards WHERE type = 'Creature' AND uuid IN (     SELECT uuid     FROM legalities     WHERE status = 'Legal' );	card_games
SELECT cards.name, cards.subtypes, cards.supertypes FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.subtypes IS NOT NULL AND cards.supertypes IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND EXISTS (     SELECT 1     FROM foreign_data     WHERE foreign_data.uuid = cards.uuid     AND foreign_data.text LIKE '%triggered ability%' );	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'premodern' AND c.side IS NULL AND EXISTS (     SELECT 1     FROM rulings r     WHERE r.uuid = c.uuid     AND r.text LIKE '%triggered mana ability%' );	card_games
SELECT `cards`.`id` FROM `cards` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` WHERE `cards.artist` = 'Erica Yang' AND `sets.name` = 'Pauper' AND `cards.availability` LIKE '%paper%';	card_games
SELECT artist  FROM cards  JOIN artist_cards ON cards.id = artist_cards.card_id JOIN artists ON artist_cards.artist_id = artists.id WHERE cards.text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT fd.name AS foreign_name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Matthew D. Wilson' AND fd.language = 'French' AND c.borderColor = 'black' AND c.layout = 'normal' AND c.type LIKE '%Creature%'	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT language FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.baseSetSize = 180;	card_games
SELECT      (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id) AS percentageWithoutContentWarning FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.format = 'commander' AND      l.status = 'Legal'	card_games
SELECT      (COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END AND fd.language = 'French' END) /       COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END) * 100) AS percentage_of_cards_without_power_in_French FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.power IS NULL OR c.power = '*';	card_games
SELECT      ROUND((COUNT(CASE WHEN s.type = 'expansion' THEN 1 END) * 100.0) / COUNT(CASE WHEN st.language = 'Japanese' THEN 1 END), 2) AS percentage_japanese_expansion_sets FROM      set_translations st JOIN      sets s ON st.setCode = s.code WHERE      st.language = 'Japanese';	card_games
SELECT `availability` FROM `cards` WHERE `artist` = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE `colorIdentity` IS NOT NULL AND borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name, id FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT `cardKingdomFoilId`, `cardKingdomId` FROM `cards` WHERE `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL ORDER BY `cardKingdomFoilId` ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN `cards`.`isTextless` = 1 AND `cards`.`layout` = 'normal' THEN 1 END) / COUNT(`cards`.`isTextless`)) * 100 AS proportion_of_textless_normal_layout_cards FROM      `cards`;	card_games
SELECT id FROM cards WHERE subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%' AND faceName IS NULL;	card_games
SELECT `name` FROM `sets` WHERE `mtgoCode` IS NULL OR `mtgoCode` = '' ORDER BY `name` LIMIT 3;	card_games
SELECT DISTINCT `language` FROM `set_translations` WHERE `setCode` = 'ARC' AND `translation` = 'Archenemy';	card_games
SELECT `name`, `translation` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `sets.id` = 5;	card_games
SELECT t.language, s.type FROM set_translations t JOIN sets s ON t.setCode = s.code WHERE s.id = 206;	card_games
SELECT card_id, card_set FROM cards WHERE language = 'Italian' AND block = 'Shadowmoor' ORDER BY card_set ASC LIMIT 2;	card_games
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND EXISTS (     SELECT 1     FROM set_translations     WHERE sets.code = set_translations.setCode     AND language = 'Japanese' );	card_games
SELECT      s.name,      s.baseSetSize  FROM      sets s  JOIN      set_translations st  ON      s.code = st.setCode  WHERE      st.language = 'Russian'  ORDER BY      s.baseSetSize DESC  LIMIT 1;	card_games
SELECT      ROUND((COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage_of_online_only_cards_with_chinese_simplified FROM      cards  WHERE      EXISTS (         SELECT 1          FROM set_translations          WHERE              set_translations.setCode = cards.setCode              AND set_translations.language = 'Chinese Simplified'     )      AND cards.isOnlineOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id  FROM cards  WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT `name` FROM `cards` WHERE `borderColor` = 'black' AND `isFullArt` = 1;	card_games
SELECT language FROM set_translations WHERE setCode = '174';	card_games
SELECT name  FROM sets  WHERE code = 'ALL';	card_games
SELECT DISTINCT fl.name FROM authors AS a JOIN author_languages AS al ON a.author_id = al.author_id JOIN languages AS fl ON al.language_id = fl.language_id WHERE a.name = 'A Pedra Fellwar';	card_games
SELECT `code` FROM `sets` WHERE `releaseDate` = '2007-07-13';	card_games
SELECT `sets.baseSetSize`, `sets.code` FROM `sets` WHERE `sets.block` IN ('Masques', 'Mirage');	card_games
SELECT code  FROM sets  WHERE type = 'expansion';	card_games
SELECT fd.name AS foreign_name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Boros'	card_games
SELECT      fd.language,      fd.flavorText,      c.type FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.watermark = 'colorpie';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) /          COUNT(*),          2     ) AS percentage_with_converted_mana_cost_10 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      c.name = 'Abyssal Horror';	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion' AND `name` LIKE '%Commander%';	card_games
SELECT      fd.name AS foreign_name,      c.type AS card_type FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.watermark = 'Abzan';	card_games
SELECT      f.language,      c.type FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      c.watermark = 'Azorius'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT `name`  FROM `cards`  WHERE `isTextless` = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT `purchaseUrls` FROM `cards` WHERE `promoTypes` LIKE '%bundle%';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE `borderColor` = 'black'  AND availability LIKE '%arena,mtgo%';	card_games
SELECT      CASE          WHEN MAX(c1.convertedManaCost) > MAX(c2.convertedManaCost) THEN 'Serra Angel'         WHEN MAX(c1.convertedManaCost) < MAX(c2.convertedManaCost) THEN 'Shrine Keeper'         ELSE 'Equal'     END AS CardWithHigherManaCost FROM      (SELECT MAX(convertedManaCost) AS convertedManaCost FROM Cards WHERE name = 'Serra Angel') c1,     (SELECT MAX(convertedManaCost) AS convertedManaCost FROM Cards WHERE name = 'Shrine Keeper') c2;	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT t.translation FROM sets s JOIN set_translations t ON s.code = t.setCode JOIN cards c ON s.code = c.set_code WHERE c.name = 'Ancestor''s Chosen' AND t.language = 'Italian';	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Angel of Mercy';	card_games
SELECT card_name FROM cards WHERE translation = 'Hauptset Zehnte Edition';	card_games
SELECT      f.name AS koreanName FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      c.name = 'Ancestor''s Chosen' AND f.language = 'Korean';	card_games
SELECT COUNT(*) FROM cards WHERE translation = 'Hauptset Zehnte Edition' AND artist = 'Adam Rex';	card_games
SELECT COUNT(*)  FROM cards  WHERE translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation.chinese_simplified FROM card_set JOIN translation ON card_set.name = translation.original_name WHERE card_set.name = 'Eighth Edition' AND translation.language = 'Chinese Simplified';	card_games
SELECT c.id, c.asciiName, s.mtgoCode FROM cards c JOIN sets s ON c.mtgoFoilId = s.code WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT releaseDate FROM sets WHERE name = 'Ancestor''s Chosen';	card_games
SELECT `sets`.`code`  FROM `sets`  JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`translation` = 'Hauptset Zehnte Edition' LIMIT 1;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;	card_games
SELECT name  FROM cards  WHERE name = 'Adarkar Valkyrie' AND `sets`.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE id IN (SELECT id FROM set_translations WHERE language = 'Italian' AND translation IS NOT NULL) AND baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards WHERE `setCode` = '10E' AND `borderColor` = 'black';	card_games
SELECT name  FROM cards  WHERE setCode = 'Coldsnap'  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT DISTINCT artist FROM card_artists WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') AND card_set = 'Coldsnap';	card_games
SELECT `number` FROM `cards` WHERE `name` = 'Coldsnap' AND `number` = '4';	card_games
SELECT COUNT(*) FROM cards C JOIN sets S ON C.setCode = S.code WHERE S.name = 'Coldsnap' AND C.convertedManaCost > 5 AND (C.power = '*' OR C.power IS NULL);	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';	card_games
SELECT `language` FROM `foreign_data` WHERE `name` = 'Ancestor''s Chosen' AND `flavorText` IS NOT NULL;	card_games
SELECT `type` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.name` = 'Ancestor''s Chosen' AND `foreign_data.language` = 'German';	card_games
SELECT t.translation FROM `set_translations` t JOIN `sets` s ON t.setCode = s.code WHERE s.name = 'Coldsnap' AND t.language = 'Italian';	card_games
SELECT `name` AS 'ItalianName' FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `sets.name` = 'Coldsnap' AND `set_translations.language` = 'Italian' ORDER BY `cards.convertedManaCost` DESC LIMIT 1;	card_games
SELECT date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce';	card_games
SELECT      (SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_of_cards_with_mana_cost_7 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap';	card_games
SELECT      (SUM(CASE WHEN `cards`.`cardKingdomFoilId` IS NOT NULL AND `cards`.`cardKingdomId` IS NOT NULL THEN 1 ELSE 0 END) * 100.0) /      COUNT(`cards`.`id`) AS percentage_incredibly_powerful FROM `cards` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` WHERE `sets`.`name` = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09';	card_games
SELECT `type` FROM `sets` WHERE `name` LIKE '%From the Vault: Lore%';	card_games
SELECT parentCode  FROM sets  WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.id, c.name, r.text AS ruling, c.hasContentWarning AS hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' ORDER BY c.id;	card_games
SELECT s.releaseDate FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM card  WHERE translation = 'Rinascita di Alara';	card_games
SELECT type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE translation = 'Huitième édition';	card_games
SELECT st.translation  FROM cards c  JOIN set_translations st ON c.name = st.translation  JOIN sets s ON c.setCode = s.code  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.name = 'Tendo Ice Bridge' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition');	card_games
SELECT st.translation  FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT card_name FROM cards WHERE set_name = 'Journey into Nyx Hero''s Path' ORDER BY converted_mana_cost DESC LIMIT 1;	card_games
SELECT `releaseDate` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `set_translations.translation` = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards WHERE `name` = 'World Championship Decks 2004' AND `convertedManaCost` = 3.0;	card_games
SELECT translation FROM set_translations WHERE setCode = 'MIR' AND language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN c.language = 'Japanese' THEN 1 ELSE 0 END) FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      c.language = 'Japanese'	card_games
SELECT      (SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) /      SUM(CASE WHEN s.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END) AS online_only_percentage FROM      cards c JOIN      sets s ON c.setCode = s.code JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Portuguese (Brazil)'	card_games
SELECT c.name, c.availability FROM cards c WHERE c.artist = 'Aleksi Briclot' AND c.isTextless = 1 AND c.availability IS NOT NULL;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT `artist` FROM `cards` WHERE `side` IS NULL AND `convertedManaCost` = (SELECT MAX(`convertedManaCost`) FROM `cards` WHERE `side` IS NULL) ORDER BY `convertedManaCost` DESC LIMIT 1;	card_games
SELECT MAX(frameEffects) AS most_common_effect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT set_id FROM sets WHERE expansion_type = 'commander'   AND totalSetSize > 0   AND set_id NOT IN (SELECT set_id FROM cards WHERE type = 'Alchemy') ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT c.name, c.manaCost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.convertedManaCost DESC LIMIT 10;	card_games
SELECT      MIN(originalReleaseDate) AS oldest_release_date,     GROUP_CONCAT(DISTINCT legalities.format ORDER BY legalities.format SEPARATOR ', ') AS legal_formats FROM      cards JOIN      legalities ON cards.uuid = legalities.uuid WHERE      cards.rarity = 'mythic' AND      legalities.status = 'Legal' GROUP BY      cards.rarity;	card_games
SELECT COUNT(*)  FROM Cards  WHERE artist = 'Volkan Baǡa' AND language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT `format`, COUNT(*) as banned_count FROM `legalities` WHERE `status` = 'Banned' GROUP BY `format` ORDER BY banned_count DESC LIMIT 1;	card_games
SELECT language  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond');	card_games
SELECT artist, format FROM artists JOIN (     SELECT illustrator, COUNT(*) as card_count     FROM cards     GROUP BY illustrator     ORDER BY card_count ASC     LIMIT 1 ) AS min_cards_illustrator ON artists.artist_id = min_cards_illustrator.illustrator;	card_games
SELECT c.name, l.format, c.hasContentWarning FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND l.format = 'legacy' AND c.hasContentWarning = 1;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT AVG(id), MAX(COUNT(language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY releaseDate	card_games
SELECT DISTINCT artist FROM cards WHERE `borderColor` = 'black' AND `availability` LIKE '%arena%';	card_games
SELECT l.uuid FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.text, r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st_japanese ON s.code = st_japanese.setCode AND st_japanese.language = 'Japanese' LEFT JOIN set_translations st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' WHERE st_japanese.id IS NULL AND st_korean.id IS NOT NULL;	card_games
SELECT c.frameVersion, c.name FROM cards c WHERE c.artist = 'Allen Williams';  SELECT c.frameVersion, c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned';	card_games
SELECT      CASE          WHEN u1.Reputation > u2.Reputation THEN u1.DisplayName          WHEN u1.Reputation < u2.Reputation THEN u2.DisplayName          ELSE 'Equal Reputation'      END AS HigherReputationUser FROM      users u1 JOIN      users u2 ON      (u1.DisplayName = 'Harlan' AND u2.DisplayName = 'Jarrod Dixon') OR      (u1.DisplayName = 'Jarrod Dixon' AND u2.DisplayName = 'Harlan')	codebase_community
SELECT DisplayName  FROM users  WHERE YEAR(CreationDate) = 2011;	codebase_community
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT `DisplayName`  FROM `users`  ORDER BY `Views` DESC  LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.OwnerDisplayName  FROM posts p  WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT OwnerDisplayName FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(`CommentCount`) AS TotalComments FROM `posts` WHERE `OwnerDisplayName` = 'csgillespie';	codebase_community
SELECT p.Id, p.AnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id AND u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT `OwnerDisplayName`  FROM `posts`  WHERE `Title` = 'Examples for teaching: Correlation does not mean causation'  AND `LastEditorUserId` IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body, t.TagName, MAX(t.Count) as MaxCount FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id GROUP BY t.TagName ORDER BY MaxCount DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Teacher' AND Date >= '2011-01-01' AND Date < '2012-01-01' AND UserId IN (     SELECT Id     FROM users     WHERE DisplayName = 'csgillespie' );	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(`Score`) AS AverageScore FROM `posts` WHERE `OwnerDisplayName` = 'csgillespie';	codebase_community
SELECT AVG(badges_count) AS average_badges FROM (     SELECT COUNT(b.Id) AS badges_count     FROM badges     JOIN users ON badges.UserId = users.Id     GROUP BY badges.UserId     HAVING users.Views > 200 ) AS subquery;	codebase_community
SELECT      (COUNT(CASE WHEN u.Age > 65 THEN p.Id ELSE NULL END) * 100.0) / COUNT(p.Id) AS PercentageElderUsers FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5	codebase_community
SELECT COUNT(*) AS TotalVotes FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT `CreationDate` FROM `votes` GROUP BY `CreationDate` ORDER BY COUNT(`Id`) DESC LIMIT 1;	codebase_community
SELECT COUNT(`Id`) AS `RevivalBadgeCount` FROM `badges` WHERE `Name` = 'Revival';	codebase_community
SELECT p.Title FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 LIMIT 1;	codebase_community
SELECT p.Id, p.CreaionDate, p.LasActivityDate, p.ClosedDate FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0' AND (p.ClosedDate IS NULL OR p.ClosedDate IS NOT NULL);	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);	codebase_community
SELECT COUNT(p.Id) AS NumberOfPosts FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT `users.DisplayName` FROM `votes` JOIN `users` ON `votes.UserId` = `users.Id` WHERE `votes.Id` = 6347;	codebase_community
SELECT SUM(CASE WHEN p.Title LIKE '%data visualization%' THEN v.VoteTypeId ELSE 0 END) AS VoteCount FROM posts p LEFT JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT `Name`  FROM `badges`  INNER JOIN `users` ON `badges.UserId` = `users.Id`  WHERE `users.DisplayName` = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS post_to_vote_ratio FROM      posts LEFT JOIN      votes ON posts.Id = votes.PostId WHERE      posts.OwnerUserId = 24	codebase_community
SELECT `posts.ViewCount` FROM `posts` WHERE `posts.OwnerDisplayName` = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com';	codebase_community
SELECT `Name` FROM `badges` INNER JOIN `users` ON `badges.UserId` = `users.Id` WHERE `users.DisplayName` = 'SilentGhost'	codebase_community
SELECT c.UserDisplayName FROM comments c WHERE c.Text = 'thank you user93'	codebase_community
SELECT c.Text AS Comment FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Body LIKE '%Understanding what Dassault iSight is doing%'	codebase_community
SELECT c.Text AS Comment FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT DISTINCT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT p.LastEditorDisplayName FROM posts p WHERE p.OwnerDisplayName = 'Open source tools for visualizing multi-dimensional data' AND p.LastEditorUserId IS NOT NULL;	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.Id;	codebase_community
SELECT c.Text AS CommentText, c.CreationDate AS CommentDate, u.DisplayName AS CommenterDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.OwnerDisplayName = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM posts JOIN votes ON posts.Id = votes.PostId WHERE posts.Title LIKE '%data%' AND votes.BountyAmount IS NOT NULL;	codebase_community
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%';	codebase_community
SELECT AVG(ViewCount) AS AvgViewCount, posts.Title, comments.Text FROM posts JOIN tags ON posts.Id = tags.ExcerptPostId JOIN comments ON posts.Id = comments.PostId WHERE tags.TagName = 'humor' GROUP BY posts.Id;	codebase_community
SELECT COUNT(*) AS TotalComments FROM comments WHERE UserId = 13;	codebase_community
SELECT `Id` AS `UserId`, MAX(`Reputation`) AS `MaxReputation` FROM `users` GROUP BY `Id` ORDER BY `MaxReputation` DESC LIMIT 1;	codebase_community
SELECT `Id`, `Views` FROM `users` ORDER BY `Views` ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  WHERE b.Name = 'Supporter'  AND YEAR(b.Date) = 2011;	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges` WHERE `UserId` IS NOT NULL GROUP BY `UserId` HAVING COUNT(`Name`) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT u.DisplayName, COUNT(DISTINCT ph.PostId) AS PostCount FROM users u JOIN postHistory ph ON u.Id = ph.UserId WHERE ph.PostId IN (SELECT PostId FROM posts WHERE Views >= 1000) GROUP BY u.DisplayName HAVING COUNT(DISTINCT ph.PostId) = 1;	codebase_community
SELECT      c.UserId,      u.DisplayName,      b.Name AS BadgeName FROM      comments c JOIN      users u ON c.UserId = u.Id LEFT JOIN      badges b ON c.UserId = b.UserId GROUP BY      c.UserId ORDER BY      COUNT(c.Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfTeachersFromIndia FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      ((COUNT(CASE WHEN YEAR(b.Date) = 2010 THEN 1 END) - COUNT(CASE WHEN YEAR(b.Date) = 2011 THEN 1 END) * 100.0) /      (COUNT(CASE WHEN YEAR(b.Date) = 2010 THEN 1 END) + COUNT(CASE WHEN YEAR(b.Date) = 2011 THEN 1 END)) AS PercentageDifference FROM badges b WHERE b.Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT p.Id, p.OwnerUserId FROM posts p WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) AS TotalFavoriteCount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 686 AND YEAR(v.CreationDate) = 2011;	codebase_community
SELECT      AVG(u.UpVotes) AS avg_upvotes,      AVG(u.Age) AS avg_age FROM      users u JOIN      (SELECT          OwnerUserId       FROM          posts       GROUP BY          OwnerUserId       HAVING          COUNT(*) > 10) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges`  WHERE `Name` = 'Announcer';	codebase_community
SELECT `badges`.`Id`, `badges`.`UserId` FROM `badges` WHERE DATE(`badges`.`Id`) = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Id, u.Name, SUM(CASE WHEN v.PostId IS NOT NULL THEN v.VoteValue ELSE 0 END) AS Reputation FROM users u JOIN badges b ON u.Id = b.UserId LEFT JOIN votes v ON u.Id = v.UserId AND v.PostId IS NOT NULL WHERE b.Id = 1 AND v.CreationDate = '2010-07-19 19:39:08.0' GROUP BY u.Id, u.Name;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'	codebase_community
SELECT badges.Date FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Location = 'Rochester, NY';	codebase_community
SELECT      (SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Teacher') /      (SELECT COUNT(DISTINCT UserId) FROM badges) * 100 AS TeacherBadgePercentage	codebase_community
SELECT      ROUND((COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id ELSE NULL END) * 100.0) / COUNT(DISTINCT b.UserId), 2) AS Teenager_Percentage FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT c.Score AS CommentRatingScore FROM comments c WHERE c.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT `users`.`Age` FROM `users` WHERE `users`.`Location` = 'Vienna, Austria' AND `users`.`Id` IN (     SELECT `badges`.`UserId`     FROM `badges`     WHERE `badges`.`Name` = 'Teacher' );	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfAdultSupporters FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Id, SUM(p.ViewCount) AS TotalViews FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN badges b ON u.Id = b.UserId WHERE b.Id = 1 AND p.LasActivityDate = '2010-07-19 19:39:08.0' GROUP BY u.Id;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND        (SELECT Age FROM users WHERE badges.UserId = users.Id AND users.Id = badges.UserId) > 65;	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE `Id` = 30;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT `DisplayName`, MAX(`Views`) as MaxViews FROM `users` GROUP BY `DisplayName` ORDER BY MaxViews DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END) / COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END)) AS votes_ratio FROM votes;	codebase_community
SELECT tags.TagName FROM tags JOIN posts ON tags.ExcerptPostId = posts.Id JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')	codebase_community
SELECT COUNT(*) AS TotalVotes FROM votes WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Harlan')	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT      CASE          WHEN SUM(CASE WHEN p.OwnerDisplayName = 'Harvey Motulsky' THEN p.ViewCount ELSE 0 END)               > SUM(CASE WHEN p.OwnerDisplayName = 'Noah Snyder' THEN p.ViewCount ELSE 0 END)         THEN 'Harvey Motulsky'          ELSE 'Noah Snyder'      END AS MorePopularAuthor,     MAX(SUM(CASE WHEN p.OwnerDisplayName = 'Harvey Motulsky' THEN p.ViewCount ELSE 0 END)) -      MAX(SUM(CASE WHEN p.OwnerDisplayName = 'Noah Snyder' THEN p.ViewCount ELSE 0 END)) AS PopularityDifference FROM      posts p;	codebase_community
SELECT COUNT(p.Id) AS PostsWithMoreThanFourVotes FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.Score > 4;	codebase_community
SELECT COUNT(c.Id) AS NegativeCommentCount FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan';	codebase_community
SELECT p.Tags FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN p.Id IN (SELECT PostId FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'r') THEN p.Id ELSE NULL END) /      COUNT(CASE WHEN u.DisplayName = 'Community' THEN p.Id ELSE NULL END) * 100 AS PercentageOfRPostsByCommunity FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName = 'Community';	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -       SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Mornington', 'Amos');	codebase_community
SELECT COUNT(DISTINCT b.UserId) AS CommentatorUsersReceivedIn2014 FROM badges b WHERE b.Name = 'Commentator' AND YEAR(b.Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59'	codebase_community
SELECT `DisplayName`, `Age` FROM `users` WHERE `Views` = (SELECT MAX(`Views`) FROM `users`);	codebase_community
SELECT p.LastEditorUserId, p.LastEditDate FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score < 60 AND UserId = 13;	codebase_community
SELECT p.Title, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60;	codebase_community
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location = 'North Pole' AND YEAR(badges.Date) = 2011;	codebase_community
SELECT      u.DisplayName,      u.WebsiteUrl FROM      users u JOIN      posts p ON u.Id = p.OwnerUserId WHERE      p.FavoriteCount > 150;	codebase_community
SELECT      COUNT(ph.Id) AS PostHistoryCount,      MAX(ph.CreationDate) AS LastEditDate FROM      postHistory ph JOIN      posts p ON ph.PostId = p.Id WHERE      p.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title AS RelatedPostTitle FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time'	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreaionDate) = 2013 AND YEAR(b.Date) = 2013;	codebase_community
SELECT `OwnerDisplayName` FROM `posts` ORDER BY `ViewCount` DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT p.OwnerDisplayName AS ParentDisplayName FROM posts p WHERE p.Id = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL) AND p.ParentId IS NOT NULL;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title, ViewCount FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM posts WHERE EXISTS (     SELECT 1     FROM tags     WHERE tags.ExcerptPostId = posts.Id     GROUP BY tags.ExcerptPostId     HAVING COUNT(*) BETWEEN 5000 AND 7000 );	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT MAX(Age) as OldestUserAge FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreaionDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT SUM(Score) AS TotalScore FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT      COUNT(pl.Id) / 12 AS AverageMonthlyLinks FROM      postLinks pl INNER JOIN      posts p ON pl.PostId = p.Id WHERE      YEAR(pl.CreationDate) = 2010 AND      p.AnswerCount <= 2;	codebase_community
SELECT PostId  FROM posts  WHERE OwnerUserId = 1465  ORDER BY FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (     SELECT MIN(CreationDate)     FROM postLinks )	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY b.UserId, u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate) FROM votes JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'chl';	codebase_community
SELECT MIN(CreationDate) AS FirstPostDate FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     ORDER BY Age ASC     LIMIT 1 );	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) AS avg_posts_voted FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName  FROM users  ORDER BY Reputation DESC  LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Age` BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens') AND YEAR(CreaionDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ViewCount > 20000 AND YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(posts.CreationDate) = 2011 AND users.Reputation > 1000 THEN posts.Id END) * 100.0) / COUNT(posts.Id) AS ReputationOver1000Percentage FROM      posts JOIN      users ON posts.OwnerUserId = users.Id;	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) * 100.0) / COUNT(u.Id),         2     ) AS percentage FROM      users u;	codebase_community
SELECT p.ViewCount, u.DisplayName AS LastTimePosterDisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Body LIKE '%Computer Game Datasets%'	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT COUNT(*) AS PostsWithoutComments FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT MAX(`Date`)  FROM `badges`  WHERE `UserId` IN (SELECT `Id` FROM `users` WHERE `DisplayName` = 'Emmett')  ORDER BY `Date` DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT     u.CreationDate,     b.Date,     TIMESTAMPDIFF(SECOND, u.CreationDate, b.Date) AS TimeToGetBadge FROM     users u JOIN badges b ON u.Id = b.UserId WHERE     u.DisplayName = 'Zolomon'	codebase_community
SELECT u.Id, COUNT(p.Id) AS PostCount, COUNT(c.Id) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY u.Id;	codebase_community
SELECT c.Text AS CommentText, u.DisplayName AS UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE Id IN (SELECT ExcerptPostId FROM tags WHERE TagName = 'careers');	codebase_community
SELECT u.Reputation, p.ViewCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jarrod Dixon';	codebase_community
SELECT SUM(CASE WHEN p.Title = 'Clustering 1D data' THEN c.CommentCount ELSE 0 END) AS TotalComments,        SUM(CASE WHEN p.Title = 'Clustering 1D data' THEN p.AnswerCount ELSE 0 END) AS TotalAnswers FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Clustering 1D data' GROUP BY p.Title;	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30;	codebase_community
SELECT     ROUND((COUNT(CASE WHEN posts.Score > 50 THEN posts.Id END) * 100.0) / COUNT(posts.Id), 2) AS PercentageOfHighScoringPosts FROM     posts JOIN     users ON posts.OwnerUserId = users.Id WHERE     users.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT ph.Text FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title LIKE '%linear regression%' AND ph.Text IS NOT NULL;	codebase_community
SELECT c.Text, MAX(c.Score) as HighestScore FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 GROUP BY c.PostId ORDER BY HighestScore DESC LIMIT 1;	codebase_community
SELECT      c.CreationDate,      u.Age  FROM      comments c  JOIN      users u ON c.UserId = u.Id  WHERE      c.UserDisplayName LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT c.PostId) AS PostsWithLowViewCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CommentCount = 1 AND Score = 0);	codebase_community
SELECT COUNT(DISTINCT u.Id) AS total_users_40_years_old FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.'	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT UserDisplayName FROM comments JOIN users ON comments.UserId = users.Id WHERE comments.Score BETWEEN 1 AND 5 AND users.DownVotes = 0;	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN c.UserId IN (SELECT u.Id FROM users u WHERE u.UpVotes = 0) THEN 1 END) / COUNT(c.UserId)) * 100,          2     ) AS PercentageZeroUpVotes FROM      comments c WHERE      c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;	superhero
SELECT COUNT(DISTINCT superhero.id) AS blue_eyed_heroes_count FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT superhero.id)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE colour.attribute_name = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c_eye ON s.eye_colour_id = c_eye.id JOIN colour c_hair ON s.hair_colour_id = c_hair.id WHERE c_eye.colour = 'Blue' AND c_hair.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (     SELECT id     FROM publisher     WHERE publisher_name = 'Marvel Comics' ) ORDER BY height_cm DESC;	superhero
SELECT p.publisher_name  FROM superhero AS s  JOIN publisher AS p ON s.publisher_id = p.id  WHERE s.superhero_name = 'Sauron';	superhero
SELECT      superhero_name,      eye_colour_id,      COUNT(superhero.id) AS eye_color_popularity FROM      superhero JOIN      publisher ON superhero.publisher_id = publisher.id WHERE      publisher_name = 'Marvel Comics' GROUP BY      eye_colour_id ORDER BY      eye_color_popularity DESC;	superhero
SELECT AVG(`height_cm`)  FROM `superhero` WHERE `publisher_id` = (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics')	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Speed')	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Intelligence');	superhero
SELECT `race` FROM `superhero` WHERE `superhero_name` = 'Copycat';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN gender g ON s.gender_id = g.id WHERE g.id = 2 AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  GROUP BY superhero_name  ORDER BY COUNT(hero_power.power_id) DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE id = 5);	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0) /          COUNT(s.id),          2     ) AS percentage_of_marauders,     SUM(CASE WHEN s.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS marauders_count FROM superhero s WHERE s.alignment_id = 2;	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;	superhero
SELECT id FROM `publisher` WHERE `publisher_name` = 'Star Trek';	superhero
SELECT AVG(`attribute_value`) AS average_attribute_value FROM `hero_attribute`;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg) AS average_female_weight FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id JOIN gender AS g ON s.gender_id = g.id WHERE g.gender = 'Male' GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT `power_name` FROM `superpower` JOIN `hero_power` ON `superpower`.`id` = `hero_power`.`power_id` WHERE `hero_power`.`hero_id` = 56;	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `id` = 2);	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT `race_id`, `race`.`id`, `race`.`id` AS race_number, `race`.`id` AS race_code, `race`.`id` AS race_value FROM `superhero` JOIN `race` ON `superhero`.`race_id` = `race`.`id` WHERE `weight_kg` = 169;	superhero
SELECT `colour.colour` FROM `superhero` JOIN `colour` ON `superhero.hair_colour_id` = `colour.id` WHERE `superhero.height_cm` = 185 AND `race.race` = 'human' AND `superhero.race_id` = `race.id`;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND((SUM(CASE WHEN s.height_cm BETWEEN 150 AND 180 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_marvel_heroes FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      s.height_cm BETWEEN 150 AND 180 AND p.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name  FROM superhero  WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.id = 1;	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' )	superhero
SELECT AVG(sup.id) AS average_superheroes_no_skin FROM superhero sup WHERE sup.skin_colour_id = (SELECT id FROM colour WHERE colour.id = 1)	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, h.max_durability FROM superhero s JOIN (     SELECT ha.hero_id, MAX(ha.attribute_value) as max_durability     FROM hero_attribute ha     JOIN attribute a ON ha.attribute_id = a.id     WHERE a.attribute_name = 'Durability'     GROUP BY ha.hero_id ) h ON s.id = h.hero_id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics' ORDER BY h.max_durability DESC LIMIT 1;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';	superhero
SELECT s.superhero_name, c.eye_colour_id, h.hair_colour_id, sk.skin_colour_id FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id JOIN colour sk ON s.skin_colour_id = sk.id JOIN publisher p ON s.publisher_id = p.id WHERE g.id = 2 AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT      s.superhero_name,      s.full_name,      c1.colour AS eye_colour,      c2.colour AS hair_colour,      c3.colour AS skin_colour,      p.publisher_name FROM      superhero s JOIN      colour c1 ON s.eye_colour_id = c1.id JOIN      colour c2 ON s.hair_colour_id = c2.id AND s.eye_colour_id = c2.id JOIN      colour c3 ON s.skin_colour_id = c3.id AND s.eye_colour_id = c3.id JOIN      publisher p ON s.publisher_id = p.id WHERE      s.eye_colour_id = s.hair_colour_id AND s.eye_colour_id = s.skin_colour_id;	superhero
SELECT race.id, race.race_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb';	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) /           (SELECT COUNT(*) FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.gender_id = 2)         ) * 100, 2     ) AS blue_female_percentage FROM      superhero s  JOIN      colour c ON s.skin_colour_id = c.id WHERE      s.gender_id = 2;	superhero
SELECT superhero_name, race_id FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT gender_id  FROM superhero  WHERE superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM `hero_power`  JOIN `superhero` ON `hero_power.hero_id` = `superhero.id`  WHERE `superhero.superhero_name` = 'Amazo';	superhero
SELECT sp.power_name FROM superhero AS sz JOIN hero_power AS hp ON sz.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sz.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT superhero_name  FROM superhero  JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id  JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id  WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black';	superhero
SELECT s.superhero_name, c.colour  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE c.colour = 'Gold';	superhero
SELECT `superhero`.`full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Vampire');	superhero
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Strength');	superhero
SELECT s.race_id, s.alignment_id  FROM superhero s  WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND((SUM(CASE WHEN s.gender_id = 2 AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0) / COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 END), 2) AS female_hero_percentage FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(`weight_kg`) AS average_weight FROM `superhero` WHERE `race_id` IN (SELECT `id` FROM `race` WHERE `id` = 1);	superhero
SELECT (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') -         (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id AND eye_colour.colour = 'Blue' JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id AND hair_colour.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      ROUND((SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id), 2) AS blue_eyes_percentage FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id;	superhero
SELECT SUM(CASE WHEN `gender_id` = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN `gender_id` = 2 THEN 1 ELSE 0 END) AS male_female_ratio FROM `superhero`	superhero
SELECT superhero_name, MAX(height_cm) AS tallest_height FROM superhero GROUP BY superhero_name ORDER BY tallest_height DESC LIMIT 1;	superhero
SELECT `id` FROM `superpower` WHERE `power_name` = 'cryokinesis';	superhero
SELECT superhero_name  FROM superhero  WHERE id = 294;	superhero
SELECT `full_name`  FROM `superhero`  WHERE `weight_kg` IS NULL OR `weight_kg` = 0;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero AS sh JOIN hero_power AS hp ON sh.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sh.full_name = 'Helen Parr';	superhero
SELECT `race_id` FROM `superhero` WHERE `weight_kg` = 108 AND `height_cm` = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT s.race_id FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT s.alignment_id, sp.power_name FROM superhero s JOIN superpower sp ON s.alignment_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT s.superhero_name, c.colour FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE gender.id = 2 AND alignment.id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.full_name, r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN colour c ON s.hair_colour_id = c.id JOIN gender g ON s.gender_id = g.id WHERE c.colour = 'Blue' AND g.gender = 'Male';	superhero
SELECT      ROUND((SUM(CASE WHEN a.alignment_id = 2 AND g.id = 2 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN a.alignment_id = 2 THEN 1 ELSE 0 END), 2) AS percentage_female_bad_heroes FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id JOIN      gender g ON s.gender_id = g.id WHERE      a.alignment = 'Bad';	superhero
SELECT      (SELECT COUNT(*)       FROM superhero AS T1       JOIN colour AS T2 ON T1.eye_colour_id = T2.id       WHERE T2.id = 7 AND T1.weight_kg = 0 OR T1.weight_kg IS NULL) -      (SELECT COUNT(*)       FROM superhero AS T1       JOIN colour AS T2 ON T1.eye_colour_id = T2.id       WHERE T2.id = 1 AND T1.weight_kg = 0 OR T1.weight_kg IS NULL) AS eye_colour_difference;	superhero
SELECT `attribute_value` FROM `hero_attribute` JOIN `attribute` ON `hero_attribute`.`attribute_id` = `attribute`.`id` WHERE `attribute_name` = 'Strength' AND `superhero_name` = 'Hulk';	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Bad'  AND superhero.skin_colour_id = (SELECT id FROM colour WHERE colour = 'Green');	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;	superhero
SELECT s.gender_id FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, weight_kg FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE race_id <> (SELECT id FROM race WHERE id = 1)  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT     (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))     - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS diff_superheroes;	superhero
SELECT a.attribute_name, MIN(ha.attribute_value) as MinValue FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' GROUP BY a.attribute_name ORDER BY MinValue ASC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name, full_name, height_cm FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND(         (SUM(CASE WHEN gender_id = 2 AND publisher_id = 5 THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN publisher_id = 5 THEN 1 ELSE 0 END), 2     ) AS percentage_female FROM superhero WHERE publisher_id = 5;	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.publisher_name = 'Marvel Comics' AND s.alignment_id = 1 THEN 1 ELSE 0 END) * 100.0) /          COUNT(s.publisher_name = 'Marvel Comics'),          2     ) AS percentage_good_superheroes FROM      superhero s;	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%';	superhero
SELECT ha.hero_id FROM hero_attribute ha JOIN (     SELECT MIN(attribute_value) AS min_value     FROM hero_attribute ) AS min_values ON ha.attribute_value = min_values.min_value GROUP BY ha.hero_id;	superhero
SELECT `full_name` FROM `superhero` WHERE `superhero_name` = 'Alien';	superhero
SELECT `superhero`.`full_name` FROM `superhero` JOIN `colour` AS `eye_colour` ON `superhero`.`eye_colour_id` = `eye_colour`.`id` WHERE `superhero`.`weight_kg` < 100 AND `eye_colour`.`attribute_name` = 'Brown'	superhero
SELECT ha.attribute_value FROM superhero AS sh JOIN hero_attribute AS ha ON sh.id = ha.hero_id WHERE sh.superhero_name = 'Aquababy';	superhero
SELECT `weight_kg`, `race_id` FROM `superhero` WHERE `id` = 40;	superhero
SELECT AVG(`height_cm`) AS average_height FROM `superhero` WHERE `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Neutral');	superhero
SELECT h.id FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT s.superhero_name, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 20 AND q.q1 = (SELECT MAX(q1) FROM qualifying q2 WHERE q2.raceId = 20)	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 19 AND q.position = 2 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19 AND position = 2);	formula_1
SELECT DISTINCT s.year  FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN seasons s ON r.year = s.year WHERE c.location = 'Shanghai';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name  FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Germany';	formula_1
SELECT c.name AS CircuitName, c.country AS Country, cs.positionText AS PositionText FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorStandings cs ON r.raceId = cs.raceId JOIN constructors con ON cs.constructorId = con.constructorId WHERE con.name = 'Renault' ORDER BY c.name;	formula_1
SELECT COUNT(*)  FROM races  WHERE year = 2010  AND circuitId NOT IN (     SELECT circuitId      FROM circuits      WHERE country = 'Malaysia'      OR country = 'Bahrain'      OR country = 'Spain'      OR country = 'Turkey'      OR country = 'Monaco' );	formula_1
SELECT c.name  FROM circuits AS cir  JOIN races AS r ON cir.circuitId = r.circuitId  WHERE cir.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT races.url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT races.date, races.time FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT `lat`, `lng` FROM `circuits` WHERE `name` = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.country FROM circuits c JOIN constructorResults cr ON c.circuitId = cr.raceId JOIN constructors con ON cr.constructorId = con.constructorId WHERE cr.points = 1.0 AND cr.raceId = 24;	formula_1
SELECT q1  FROM qualifying  JOIN drivers ON drivers.driverId = qualifying.driverId  WHERE drivers.surname = 'Senna' AND drivers.forename = 'Bruno'  AND qualifying.raceId = (SELECT raceId FROM races WHERE raceId = 354);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '00:01:40' AND q.raceId = (SELECT raceId FROM races WHERE raceId = 355);	formula_1
SELECT d.number  FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 903 AND q.q3 LIKE '0:01%'	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Bahrain Grand Prix' AND r.time IS NULL;	formula_1
SELECT s.year FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT `results.driverId`)  FROM `results`  JOIN `races` ON `results.raceId` = `races.raceId`  WHERE `races.date` = '2015-11-29'  AND `results.statusId` IN (SELECT `statusId` FROM `status` WHERE `status` = 'Finished');	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.raceId = 592   AND d.dob IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.driverRef, d.url FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.time LIKE '0:1%' AND lt.raceId = 161;	formula_1
SELECT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.raceId = 933 AND results.fastestLap = 1;	formula_1
SELECT location, lat, lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = (SELECT raceId FROM races WHERE raceId = 9 AND position = 1) ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'di Grassi' AND forename = 'Lucas') AND raceId = (SELECT raceId FROM races WHERE raceId = 345);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE q.q2 = '00:01:15' AND r.raceId = 347;	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 LIKE '0:01:%'	formula_1
SELECT time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'McLaren' AND results.raceId = 743;	formula_1
SELECT d.driverId, d.forename, d.surname FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'San Marino Grand Prix' AND r.year = 2006 AND ds.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (     SELECT raceId     FROM races     WHERE date = '2015-11-29' ) AND statusId = (     SELECT statusId     FROM status     WHERE status = 'Finished' ) AND driverId NOT IN (     SELECT driverId     FROM results     WHERE raceId = (         SELECT raceId         FROM races         WHERE date = '2015-11-29'     )     AND statusId = (         SELECT statusId         FROM status         WHERE status = 'Finished'     ) );	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.surname || ' ' || d.forename AS fullName FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = 348 AND lt.time = (SELECT MIN(time) FROM lapTimes WHERE raceId = 348)	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN (     SELECT raceId, MAX(fastestLapSpeed) AS max_speed     FROM results     WHERE fastestLap IS NOT NULL     GROUP BY raceId ) AS max_speed_races ON r.raceId = max_speed_races.raceId AND r.fastestLapSpeed = max_speed_races.max_speed;	formula_1
SELECT      ((         (SELECT fastestLapSpeed           FROM results           WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')             AND raceId = 853         ) -          (SELECT fastestLapSpeed           FROM results           WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')             AND raceId = 854         )     ) / (         (SELECT fastestLapSpeed           FROM results           WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')             AND raceId = 853         )     ) * 100) AS percentFaster	formula_1
SELECT      d.driverId,     d.driverRef,     d.forename,     (COUNT(CASE WHEN rt.time IS NOT NULL THEN 1 END) * 100.0 / COUNT(d.driverId)) AS completionRate FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      ra.date = '1983-07-16' GROUP BY      d.driverId, d.driverRef, d.forename;	formula_1
SELECT year  FROM races  WHERE name = 'Singapore Grand Prix'  ORDER BY year ASC  LIMIT 1;	formula_1
SELECT COUNT(*) AS total_races, name FROM races JOIN seasons ON races.year = seasons.year WHERE seasons.year = 2005 GROUP BY name ORDER BY name DESC;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = (SELECT MIN(year) FROM races) AND MONTH(c.location) = (SELECT MONTH(MIN(SUBSTR(c.location, 1, INSTR(c.location, ' ') - 1)))  ORDER BY r.year, MONTH(c.location);	formula_1
SELECT      r.name,      r.date  FROM      races r  JOIN      seasons s ON r.year = s.year  WHERE      r.year = 1999      AND r.round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT seasons.year, COUNT(races.raceId) as race_count FROM seasons JOIN races ON seasons.year = races.year GROUP BY seasons.year ORDER BY race_count DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year = 2017 AND circuitId NOT IN (     SELECT circuitId     FROM races     WHERE year = 2000 );	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = (SELECT MIN(year) FROM seasons WHERE name LIKE '%European Grand Prix%') AND c.country = 'Europe';	formula_1
SELECT MAX(year) AS last_british_grand_prix_year FROM circuits WHERE country = 'Britain' AND circuitId IN (     SELECT circuitId     FROM races     JOIN circuits ON races.circuitId = circuits.circuitId     WHERE races.name = 'British Grand Prix' );	formula_1
SELECT COUNT(DISTINCT r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT d.surname, d.forename, ds.position FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.points = (SELECT MAX(points) FROM driverStandings);	formula_1
SELECT d.surname, d.forename, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name AS race_name, MIN(l.milliseconds) AS best_lap_time FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY l.driverId, r.raceId ORDER BY best_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(`milliseconds`) as average_lap_time FROM `lapTimes` WHERE `raceId` IN (     SELECT `raceId`     FROM `races`     WHERE `name` = 'Malaysian Grand Prix' ) AND `driverId` IN (     SELECT `driverId`     FROM `drivers`     WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton' );	formula_1
SELECT      (COUNT(CASE WHEN rs.surname = 'Hamilton' AND r.position > 1 THEN 1 END) * 100.0) /      COUNT(CASE WHEN rs.surname = 'Hamilton' THEN 1 END) AS percentage_not_first FROM      results r JOIN      drivers rs ON r.driverId = rs.driverId WHERE      rs.surname = 'Hamilton' AND      r.raceId IN (SELECT raceId FROM races WHERE year >= 2010);	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(s.points) as max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN (     SELECT driverId, SUM(wins) as total_wins     FROM driverStandings     GROUP BY driverId     ORDER BY total_wins DESC     LIMIT 1 ) AS top_winners ON d.driverId = top_winners.driverId JOIN (     SELECT driverId, MAX(points) as max_points     FROM driverStandings     GROUP BY driverId ) AS top_points ON d.driverId = top_points.driverId WHERE d.driverId = top_winners.driverId	formula_1
SELECT d.forename, d.surname,         (strftime('%Y', 'now') - strftime('%Y', d.dob)) AS age FROM drivers d WHERE d.nationality = 'Japanese' ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT DISTINCT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.name, c.location HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name AS raceName, c.location, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name  FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND rs.position < 20;	formula_1
SELECT COUNT(*) FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN circuits c ON c.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit') WHERE d.surname = 'Schumacher' AND ds.points = (SELECT MAX(points) FROM driverStandings WHERE raceId IN (SELECT raceId FROM races WHERE circuitId = c.circuitId))	formula_1
SELECT r.name AS race, s.year FROM results AS res JOIN drivers AS d ON res.driverId = d.driverId JOIN races AS r ON res.raceId = r.raceId JOIN seasons AS s ON r.year = s.year WHERE d.surname = 'Schumacher' AND res.milliseconds = (     SELECT MIN(milliseconds)     FROM results     WHERE driverId = d.driverId )	formula_1
SELECT AVG(points)  FROM driverStandings  JOIN races ON driverStandings.raceId = races.raceId  JOIN seasons ON races.year = seasons.year  JOIN drivers ON driverStandings.driverId = drivers.driverId  WHERE drivers.surname = 'Irvine' AND seasons.year = 2000;	formula_1
SELECT r.name AS RaceName, d.forename || ' ' || d.surname AS DriverName, rs.points FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId JOIN constructorStandings cs ON ds.constructorId = cs.constructorId JOIN constructors c ON cs.constructorId = c.constructorId JOIN seasons s ON r.year = s.year WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY s.year ASC LIMIT 1;	formula_1
SELECT r.name, c.country, r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name AS RaceName, s.year AS RaceYear, c.location AS CircuitLocation, MAX(l.laps) AS MostLaps FROM races r JOIN results res ON r.raceId = res.raceId JOIN lapTimes l ON res.resultId = l.raceId JOIN circuits c ON r.circuitId = c.circuitId GROUP BY r.raceId ORDER BY MostLaps DESC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN circuits.country = 'Germany' THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM      races JOIN      circuits ON races.circuitId = circuits.circuitId WHERE      races.name = 'European Grand Prix';	formula_1
SELECT `lat`, `lng` FROM `circuits` WHERE `name` = 'Silverstone Circuit';	formula_1
SELECT name, lat FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef  FROM circuits  WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT `country`, `alt` FROM `circuits` WHERE `alt` = (SELECT MAX(`alt`) FROM `circuits`);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT c.country, d.surname, d.forename, d.dob FROM drivers d JOIN circuits c ON d.nationality = c.country ORDER BY d.dob LIMIT 1;	formula_1
SELECT `surname` FROM `drivers` WHERE `nationality` = 'Italian';	formula_1
SELECT url  FROM drivers  WHERE driverRef = 'davidson'	formula_1
SELECT `driverRef` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis';	formula_1
SELECT name  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT year FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'Silverstone'	formula_1
SELECT r.raceId, r.name, r.date, r.time, r.url, c.circuitRef, c.name AS circuitName, c.country, c.url AS circuitUrl FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'silverstone';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'abu_dhabi' AND r.year LIKE '201%';	formula_1
SELECT COUNT(*)  FROM races  WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy');	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT url  FROM circuits  WHERE name = 'Circuit de Barcelona-Catalunya'  AND circuitId IN (     SELECT circuitId      FROM races      WHERE year = 2009 AND name = 'Spanish Grand Prix' );	formula_1
SELECT MIN(fastestLapTime) AS fastestLapTime FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Lewis Hamilton')	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.fastestLap IS NOT NULL ORDER BY CAST(SUBSTRING(lt.fastestLapTime, 1, LENGTH(lt.fastestLapTime) - 2) AS REAL) ASC LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND ds.position = 1 AND r.year = 2007;	formula_1
SELECT r.name AS RaceName, r.date AS RaceDate FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.driverRef = 'hamilton';	formula_1
SELECT      r.name AS race_name,      d.forename,      d.surname,      MIN(r.rank) AS highest_rank FROM      results r JOIN      drivers d ON r.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY      r.name ORDER BY      highest_rank ASC LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) as fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT seasons.year FROM seasons JOIN races ON seasons.year = races.year JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis';	formula_1
SELECT `positionOrder`  FROM `driverStandings`  JOIN `drivers` ON `driverStandings.driverId` = `drivers.driverId`  JOIN `races` ON `driverStandings.raceId` = `races.raceId`  WHERE `drivers.surname` = 'Hamilton' AND `drivers.forename` = 'Lewis' AND `races.name` = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM results r JOIN driverStandings ds ON r.driverId = ds.driverId JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year = 2008 AND r.time IS NOT NULL;	formula_1
SELECT fastestLapTime, fastestLapSpeed FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.year = 2008 AND races.name = 'Australian Grand Prix' ORDER BY milliseconds ASC LIMIT 1;	formula_1
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.name = 'Chinese Grand Prix' AND d.driverRef = 'alonso' AND r.positionOrder = 2	formula_1
SELECT d.driverRef, d.surname, d.url FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN seasons s ON r.year = s.year WHERE s.year = 2008 AND r.name = 'Australian Grand Prix' AND ds.position = 1 AND ds.positionText = '1';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'British' AND ra.year = 2008 AND ra.name = 'Australian Grand Prix';	formula_1
SELECT      COUNT(DISTINCT d.driverId)  FROM      results r  JOIN      drivers d ON r.driverId = d.driverId  JOIN      races ra ON r.raceId = ra.raceId  WHERE      ra.year = 2008 AND      r.time IS NOT NULL;	formula_1
SELECT SUM(points) AS total_points FROM driverStandings JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.driverRef = 'hamilton';	formula_1
SELECT AVG(TIME_TO_SEC(`fastestLapTime`)) AS average_fastest_lap_time FROM `lapTimes` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis');	formula_1
SELECT      (COUNT(CASE WHEN r.time IS NOT NULL THEN 1 END) * 1.0) / COUNT(r.raceId) AS completion_rate FROM      results r WHERE      r.raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008);	formula_1
SELECT      (100 * (LEAST(LEAD(time, 1) OVER (ORDER BY milliseconds), LEAST(time, LEAST(LEAD(time, 1) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 2) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 3) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 4) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 5) OVER (ORDER BY milliseconds), time)))) - LEAST(time, LEAST(LEAD(time, 1) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 2) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 3) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 4) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 5) OVER (ORDER BY milliseconds), time))))) / LEAST(time, LEAST(LEAD(time, 1) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 2) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 3) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 4) OVER (ORDER BY milliseconds), LEAST(LEAD(time, 5) OVER (ORDER BY milliseconds), time)))))) AS percentage_faster FROM      lapTimes WHERE      raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 AND positionOrder = 1)	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT `circuitRef`, `name`, `lat`, `location` FROM `circuits` WHERE `country` = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(points)  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  WHERE constructors.nationality = 'British' GROUP BY constructors.constructorId;	formula_1
SELECT c.name, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 291 AND cr.points = 0;	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors AS c  JOIN constructorStandings AS cs ON c.constructorId = cs.constructorId  JOIN races AS r ON cs.raceId = r.raceId  WHERE c.nationality = 'Japanese'  AND cs.points = 0  GROUP BY c.constructorId  HAVING COUNT(r.raceId) = 2;	formula_1
SELECT constructors.name FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructorStandings.position = 1;	formula_1
SELECT COUNT(DISTINCT c.constructorId) FROM constructors c JOIN driverStandings ds ON c.constructorId = ds.constructorId JOIN drivers d ON ds.driverId = d.driverId JOIN lapTimes lt ON d.driverId = lt.driverId WHERE c.nationality = 'French' AND lt.lap > 50;	formula_1
SELECT      (COUNT(DISTINCT d.driverId)      / COUNT(DISTINCT r.driverId)) * 100 AS race_completion_percentage FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      d.nationality = 'Japanese'      AND r.time IS NOT NULL      AND r.raceId IN (         SELECT              raceId          FROM              races          WHERE              year BETWEEN 2007 AND 2009     )	formula_1
SELECT      s.year,      AVG(TIMESTAMPDIFF(SECOND, '00:00:00', SUBSTRING_INDEX(SUBSTRING_INDEX(results.time, ':', 2), ':', -1)) *      3600 +      AVG(TIMESTAMPDIFF(SECOND, '00:00:00', SUBSTRING_INDEX(SUBSTRING_INDEX(results.time, ':', 3), ':', -1)) *      60 +      AVG(TIMESTAMPDIFF(SECOND, '00:00:00', SUBSTRING_INDEX(results.time, '.', 1))) AS avg_champion_time FROM      results JOIN      driverStandings ON results.driverId = driverStandings.driverId JOIN      races ON results.raceId = races.raceId JOIN      seasons s ON races.year = s.year WHERE      results.time IS NOT NULL     AND s.year < 1975     AND driverStandings.position = 1 GROUP BY      s.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     WHERE ds.driverId = d.driverId     AND ds.position = 2 );	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN constructors c ON d.driverId = c.constructorId WHERE c.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT lap FROM lapTimes JOIN results ON lapTimes.driverId = results.driverId JOIN driverStandings ON results.driverId = driverStandings.driverId JOIN races ON results.raceId = races.raceId WHERE races.year = 2009 AND driverStandings.position = 1 AND results.position = 1 ORDER BY SUBSTR(lapTimes.time, 1, 8) DESC LIMIT 1;	formula_1
SELECT AVG(fastestLapSpeed) as averageFastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix' AND results.fastestLap IS NOT NULL;	formula_1
SELECT r.name, r.year FROM races r JOIN (     SELECT raceId, MIN(milliseconds) AS min_milliseconds     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) AS shortest_time ON r.raceId = shortest_time.raceId ORDER BY shortest_time.min_milliseconds ASC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN drivers.dob < '1985-01-01' THEN drivers.driverId END) * 100.0) /      COUNT(drivers.driverId) AS percentage FROM drivers WHERE drivers.dob < '1985-01-01' AND drivers.driverId IN (     SELECT driverStandings.driverId     FROM driverStandings     JOIN races ON driverStandings.raceId = races.raceId     WHERE races.year BETWEEN 2000 AND 2005 AND driverStandings.laps > 50 );	formula_1
SELECT COUNT(DISTINCT d.driverId) AS FrenchDriversWithLapTimesUnderTwoHours FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN constructors c ON d.driverId = c.constructorId WHERE d.nationality = 'French' AND lt.milliseconds < 720000;	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) AS numberOfDrivers FROM driverStandings WHERE raceId = 18;	formula_1
SELECT      d.driverId,      d.code  FROM      drivers d  WHERE      d.nationality = 'Dutch'      AND d.driverId IN (         SELECT              d2.driverId          FROM              drivers d2          ORDER BY              d2.dob DESC          LIMIT 3     ) ORDER BY      d.driverId;	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND SUBSTR(dob, 1, 4) = '1980';	formula_1
SELECT      d.driverId,      d.forename,      d.surname,      d.dob,      MIN(lt.time) as EarliestLapTime FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY      d.driverId, d.forename, d.surname, d.dob ORDER BY      EarliestLapTime ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.dob LIKE '1971%' AND lt.fastestLapTime IS NOT NULL ORDER BY lt.fastestLapTime ASC LIMIT 1;	formula_1
SELECT      d.driverId,     d.driverRef,     d.forename,     d.surname,     d.dob,     lt.time AS latestLapTime FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      d.nationality = 'Spanish' AND      d.dob < '1982-01-01' GROUP BY      d.driverId ORDER BY      lt.milliseconds DESC LIMIT      10;	formula_1
SELECT year FROM races JOIN results ON races.raceId = results.raceId WHERE fastestLap IS NOT NULL ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId GROUP BY year ORDER BY MAX(lapTimes.milliseconds) ASC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2009) ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NOT NULL;	formula_1
SELECT c.circuitId, c.location, (c.lat, c.lng) as coordinates FROM circuits c WHERE c.country = 'Austria';	formula_1
SELECT `races`.`round` AS race_number, COUNT(`results`.`resultId`) AS finishers_count FROM `races` JOIN `results` ON `races`.`raceId` = `results`.`raceId` WHERE `results`.`time` IS NOT NULL GROUP BY `races`.`round` ORDER BY finishers_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT s.year, r.name, r.date, r.time FROM drivers JOIN driverStandings ds ON drivers.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN seasons s ON r.year = s.year WHERE drivers.dob = (     SELECT MIN(dob) FROM drivers ) ORDER BY s.year ASC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN status ON results.statusId = status.statusId WHERE drivers.nationality = 'American' AND status.statusId = 4;	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN (SELECT constructorId, SUM(points) AS total_points       FROM constructorStandings       GROUP BY constructorId) AS total_points_table ON c.constructorId = total_points_table.constructorId WHERE c.nationality = 'Italian' ORDER BY total_points_table.total_points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN (     SELECT constructorId, SUM(wins) as total_wins     FROM constructorStandings     GROUP BY constructorId     ORDER BY total_wins DESC     LIMIT 1 ) AS top_wins ON c.constructorId = top_wins.constructorId;	formula_1
SELECT d.driverRef, d.surname, lt.time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = (     SELECT raceId     FROM races     WHERE name = 'French Grand Prix' ) AND lt.lap = 3 ORDER BY lt.time DESC LIMIT 1;	formula_1
SELECT r.name, MIN(lt.milliseconds) AS fastest_time_milliseconds FROM races AS r JOIN lapTimes AS lt ON r.raceId = lt.raceId WHERE lt.position = 1 GROUP BY r.raceId, r.name ORDER BY fastest_time_milliseconds LIMIT 1;	formula_1
SELECT AVG(`fastestLapTime`)  FROM `results`  WHERE `rank` < 11 AND `raceId` = (     SELECT `raceId`      FROM `races`      WHERE `name` = 'United States Grand Prix' AND `year` = 2006 );	formula_1
SELECT      d.forename,      d.surname,      d.dob,      AVG(PIT.duration) AS avg_pit_stop_duration FROM      drivers d JOIN      pitStops PIT ON d.driverId = PIT.driverId WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY      d.driverId ORDER BY      avg_pit_stop_duration ASC LIMIT 3;	formula_1
SELECT d.driverRef, r.time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1 ORDER BY r.positionOrder;	formula_1
SELECT c.constructorRef, c.url FROM constructors c JOIN driverStandings ds ON c.constructorId = ds.constructorId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2009 AND ds.position = 1;	formula_1
SELECT forename, surname, dob  FROM drivers  WHERE nationality = 'Austrian' AND dob BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT CONCAT(d.forename, ' ', d.surname) AS fullName, d.url AS wikipediaLink, d.dob FROM drivers d WHERE d.nationality = 'German' AND d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY d.dob DESC;	formula_1
SELECT `location`, `country`, `lat`, `lng`  FROM `circuits`  WHERE `circuitRef` = 'hungaroring';	formula_1
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId JOIN seasons s ON r.year = s.year JOIN constructorResults cr ON cs.raceId = cr.raceId AND cs.constructorId = cr.constructorId WHERE r.name = 'Circuit de Monaco' AND s.year BETWEEN 1980 AND 2010 GROUP BY c.name, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM driverStandings JOIN races ON driverStandings.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.name = 'Lewis Hamilton' AND circuits.name = 'Istanbul Park';	formula_1
SELECT AVG(COUNT(raceId)) as annual_avg_races FROM races WHERE year BETWEEN 2000 AND 2010;	formula_1
SELECT nationality, COUNT(*) as count FROM drivers GROUP BY nationality ORDER BY count DESC LIMIT 1;	formula_1
SELECT SUM(CASE WHEN ds.position = 91 THEN cs.points ELSE 0 END) AS total_points FROM driverStandings ds JOIN constructorStandings cs ON ds.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT r.name FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN lapTimes lt ON rs.raceId = lt.raceId AND rs.driverId = lt.driverId WHERE lt.fastestLapTime = (SELECT MIN(fastestLapTime) FROM lapTimes lt2)	formula_1
SELECT CONCAT(c.name, ' ', COALESCE(ct.country, '')) AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE q.position = 1 AND r.round = 3 AND r.name = 'Malaysian Grand Prix' AND r.year = 2008;	formula_1
SELECT      d.forename || ' ' || d.surname AS fullName,     d.nationality,     r.name AS raceName FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY      d.dob DESC LIMIT 1;	formula_1
SELECT COUNT(*) AS accidents_count FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.driverRef = 'alonso' AND races.name = 'Canadian Grand Prix' AND results.statusId = 3;	formula_1
SELECT d.forename, d.surname, SUM(CASE WHEN ds.wins > 0 THEN 1 ELSE 0 END) AS wins_count FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId GROUP BY d.driverId ORDER BY d.forename, d.surname, wins_count DESC LIMIT 1;	formula_1
SELECT MAX(duration) AS longest_pit_stop_time FROM pitStops;	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes;	formula_1
SELECT MAX(duration) AS longest_pit_stop_duration FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Lewis Hamilton');	formula_1
SELECT lap FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId JOIN races ON pitStops.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.year = 2011 AND races.name = 'Australian Grand Prix';	formula_1
SELECT     d.driverId,     d.surname,     d.forename,     p.raceId,     p.stop,     p.duration FROM     pitStops p JOIN drivers d ON p.driverId = d.driverId JOIN races r ON p.raceId = r.raceId WHERE     r.year = 2011 AND     r.name = 'Australian Grand Prix';	formula_1
SELECT d.driverRef, l.time, l.milliseconds FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.driverRef = 'hamilton' ORDER BY l.milliseconds ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname, MIN(lt.time) as shortest_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId GROUP BY d.driverId ORDER BY shortest_time ASC LIMIT 20;	formula_1
SELECT position  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN drivers ON lapTimes.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'  ORDER BY lapTimes.milliseconds ASC  LIMIT 1;	formula_1
SELECT raceId, driverId, position, time, milliseconds FROM lapTimes WHERE raceId = (     SELECT raceId     FROM races     WHERE name = 'Austrian Grand Prix' ) AND milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes     WHERE raceId = (         SELECT raceId         FROM races         WHERE name = 'Austrian Grand Prix'     ) );	formula_1
SELECT drivers.forename, drivers.surname, drivers.url, lapTimes.time FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId JOIN circuits ON lapTimes.raceId IN (     SELECT raceId FROM races WHERE circuitId IN (         SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya'     ) ) ORDER BY lapTimes.milliseconds;	formula_1
SELECT      r.name AS RaceName,      MIN(l(milliseconds)) AS FastestLapTime FROM      lapTimes lt JOIN      races r ON lt.raceId = r.raceId WHERE      r.name = 'Austrian Grand Prix' GROUP BY      r.name ORDER BY      FastestLapTime ASC LIMIT 1;	formula_1
SELECT pitStops.duration FROM lapTimes JOIN pitStops ON lapTimes.raceId = pitStops.raceId AND lapTimes.driverId = pitStops.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE lapTimes.time = (SELECT MIN(time) FROM lapTimes WHERE raceId = races.raceId) AND races.name = 'Austrian Grand Prix';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(milliseconds)  FROM pitStops  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT AVG(milliseconds)  FROM lapTimes  WHERE circuitId IN (     SELECT circuitId      FROM circuits      WHERE country = 'Italy' );	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT p.player_name, p.height FROM Player p WHERE p.height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT `Player_Attributes`.`preferred_foot` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_fifa_api_id` = `Player`.`player_fifa_api_id` ORDER BY `Player_Attributes`.`potential` LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY pa.crossing DESC LIMIT 5;	european_football_2
SELECT League.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY SUM(Match.home_team_goal + Match.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) as lost_matches FROM Match WHERE season = '2015/2016' AND home_team_goal < away_team_goal GROUP BY home_team_api_id ORDER BY lost_matches ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.penalties = (SELECT MAX(penalties) FROM Player_Attributes) ORDER BY p.player_name LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.season = '2009/2010' AND T2.league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') AND T2.away_team_goal > T2.home_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT      T.team_long_name,      T.team_short_name,      TA.buildUpPlaySpeed FROM      Team T JOIN      Team_Attributes TA ON T.team_fifa_api_id = TA.team_fifa_api_id WHERE      TA.buildUpPlaySpeed = (SELECT MAX(buildUpPlaySpeed) FROM Team_Attributes) ORDER BY      TA.buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' AND Match.home_team_goal = Match.away_team_goal GROUP BY League.name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT     p.player_name,     TIMESTAMPDIFF(YEAR, p.birthday, CURRENT_TIMESTAMP) AS current_age FROM     Player p JOIN     Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE     pa.sprint_speed >= 97     AND pa.date BETWEEN '2013-01-01' AND '2015-12-31';	european_football_2
SELECT `name`, COUNT(*) as total_matches FROM `League` JOIN `Match` ON `League`.`id` = `Match`.`league_id` GROUP BY `League`.`name` ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) as average_height FROM Player WHERE player_name LIKE '_______%1990_______' OR player_name LIKE '_______%1991_______' OR       player_name LIKE '_______%1992_______' OR player_name LIKE '_______%1993_______' OR       player_name LIKE '_______%1994_______' OR player_name LIKE '_______%1995_______';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T1.team_long_name FROM Team T1 JOIN Team_Attributes T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > (     SELECT AVG(T3.buildUpPlayPassing)     FROM Team_Attributes T3     WHERE strftime('%Y', T3.date) = '2012' AND T3.buildUpPlayPassing IS NOT NULL ) AND strftime('%Y', T2.date) = '2012';	european_football_2
SELECT      (SUM(CASE WHEN `Player`.`birthday` BETWEEN '1987-01-01' AND '1992-12-31' THEN 1 ELSE 0 END) / COUNT(`Player`.`player_fifa_api_id`)) * 100 AS left_foot_percentage FROM      `Player` WHERE      `Player`.`preferred_foot` = 'left';	european_football_2
SELECT      League.name,      SUM(Match.home_team_goal + Match.away_team_goal) AS total_goals FROM      League JOIN      Match ON League.id = Match.league_id GROUP BY      League.name ORDER BY      total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots) AS average_long_shots FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT      p.player_name,      AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      p.height > 180 GROUP BY      p.player_name ORDER BY      avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT team_long_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id WHERE Team_Attributes.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND Team_Attributes.buildUpPlayDribblingClass = 'Normal' AND Team_Attributes.chanceCreationPassing < (     SELECT AVG(chanceCreationPassing)     FROM Team_Attributes     WHERE Team_Attributes.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00'     AND Team_Attributes.buildUpPlayDribblingClass = 'Normal' ) ORDER BY Team_Attributes.chanceCreationPassing DESC;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal)	european_football_2
SELECT `team_short_name` FROM `Team` WHERE `team_long_name` = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE substr(birthday, 1, 7) = '1970-10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_name` = 'Franco Zennaro' );	european_football_2
SELECT `Team_Attributes`.`buildUpPlayPositioningClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes`.`team_api_id` = `Team`.`team_api_id` WHERE `Team`.`team_long_name` = 'ADO Den Haag';	european_football_2
SELECT `heading_accuracy`  FROM `Player_Attributes`  WHERE `player_fifa_api_id` IN (     SELECT `player_fifa_api_id`      FROM `Player`      WHERE `player_name` = 'Francois Affolter' ) AND `date` = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT preferred_foot FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.birthday = (SELECT MIN(birthday) FROM Player) ORDER BY Player_Attributes.date DESC LIMIT 1;	european_football_2
SELECT `player_name`, `potential` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `Player_Attributes.potential` = (SELECT MAX(`potential`) FROM `Player_Attributes`);	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `weight` < 130 AND `preferred_foot` = 'left';	european_football_2
SELECT `team_short_name` FROM `Team` JOIN `Team_Attributes` ON `Team.team_api_id` = `Team_Attributes.team_api_id` WHERE `Team_Attributes.chanceCreationPassingClass` = 'Risky';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (SELECT `player_fifa_api_id`                               FROM `Player`                               WHERE `player_name` = 'David Wilson');	european_football_2
SELECT p.birthday  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT `League.name` FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `Country.name` = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal) AS average_home_team_goals FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT p.player_name, pa.finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height = (SELECT MAX(height) FROM Player)    OR p.height = (SELECT MIN(height) FROM Player) ORDER BY pa.finishing DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential`  FROM `Player_Attributes`  WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Aaron Doran');	european_football_2
SELECT `player_name`, `player_api_id`, `player_fifa_api_id`, `height` FROM `Player` WHERE `preferred_foot` = 'left';	european_football_2
SELECT team_long_name  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team_Attributes.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `Team.team_short_name` = 'CLB';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlayPassing` > 70;	european_football_2
SELECT AVG(t2.overall_rating) AS avg_overall_rating FROM Player_Attributes t1 JOIN Player t2 ON t1.player_api_id = t2.player_api_id WHERE strftime('%Y', t1.date) BETWEEN '2010' AND '2015' AND t2.height > 170;	european_football_2
SELECT player_name, MIN(height) AS shortest_height FROM Player WHERE height = (SELECT MIN(height) FROM Player) GROUP BY player_name;	european_football_2
SELECT `Country.name`  FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `League.name` = 'Italy Serie A';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes`.`team_api_id` = `Team`.`team_api_id` WHERE `buildUpPlaySpeed` = 31 AND `buildUpPlayDribbling` = 53 AND `buildUpPlayPassing` = 32;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes`.`player_fifa_api_id` = `Player`.`player_fifa_api_id`  WHERE `Player`.`player_name` = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT t.team_short_name FROM Team t JOIN Match m ON t.team_api_id = m.home_team_api_id WHERE m.home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 AND pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE player_api_id = p.player_api_id AND potential = 61);	european_football_2
SELECT      (AVG(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE NULL END) -      AVG(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE NULL END)) AS diff_ball_control FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT `team_long_name` FROM `Team` WHERE `team_short_name` = 'GEN';	european_football_2
SELECT      P1.player_name AS Older_Player,      P2.player_name AS Younger_Player FROM      Player P1 JOIN      Player P2 ON      P1.player_name = 'Aaron Lennon' AND P2.player_name = 'Abdelaziz Barrada' WHERE      P1.birthday > P2.birthday;	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT Country.name FROM League JOIN Country ON League.country_id = Country.id WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT `name` FROM `League` JOIN `Country` ON `League`.`country_id` = `Country`.`id` WHERE `Country`.`name` = 'Germany';	european_football_2
SELECT `player_name`, MAX(`overall_rating`) as strongest_strength FROM `Player_Attributes` pa JOIN `Player` p ON pa.player_api_id = p.player_api_id GROUP BY p.player_api_id ORDER BY strongest_strength DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_api_id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, pa.crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk');	european_football_2
SELECT COUNT(*) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height > 180 AND Player_Attributes.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium') AND season = '2008/2009';	european_football_2
SELECT pa.long_passing FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League')  AND SUBSTR(date, 1, 7) = '2009-04';	european_football_2
SELECT `name`  FROM `League`  WHERE `id` IN (     SELECT `league_id`      FROM `Match`      WHERE `season` = '2008/2009' )  GROUP BY `name`  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT AVG(`overall_rating`) AS average_rating FROM `Player_Attributes` WHERE strftime('%Y', `Player_Attributes`.`date`) < '1986';	european_football_2
SELECT   (p1.overall_rating - p2.overall_rating) * 100.0 / p2.overall_rating AS percentage_difference FROM Player p1 JOIN Player p2 ON p1.player_name = 'Ariel Borysiuk' AND p2.player_name = 'Paulin Puel';	european_football_2
SELECT AVG(`buildUpPlaySpeed`) as average_build_up_speed FROM `Team_Attributes` WHERE `team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(`crossing`) AS total_crossing_score FROM `Player_Attributes` INNER JOIN `Player` AS T2 ON `Player_Attributes`.`player_api_id` = T2.`player_api_id` WHERE T2.`player_name` = 'Aaron Lennox'	european_football_2
SELECT MAX(`chanceCreationPassing`), `chanceCreationPassingClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `Team.team_long_name` = 'Ajax';	european_football_2
SELECT preferred_foot FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating)  FROM Player_Attributes  JOIN Player AS T2 ON T2.player_api_id = Player_Attributes.player_api_id  WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(`home_team_goal`) AS avg_goals_scored FROM `Match` JOIN `Team` ON `home_team_api_id` = `Team`.`team_api_id` JOIN `League` ON `league_id` = `League`.`id` JOIN `Country` ON `Country`.`id` = `League`.`country_id` WHERE `Team`.`team_long_name` = 'Parma' AND `Country`.`name` = 'Italy'	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY STR_TO_DATE(p.birthday, '%Y-%m-%d') DESC LIMIT 1;	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.player_name` = 'Aaron Mooy' AND `Player_Attributes.date` LIKE '2016-02-04%'	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Francesco Parravicini' ) AND `date` = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francesco Migliore') AND `date` LIKE '2015-05-01%';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Kevin Berigaud' ) AND `date` = '2013-02-22 00:00:00';	european_football_2
SELECT `date` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.player_name` = 'Kevin Constant' ORDER BY `crossing` DESC LIMIT 1;	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_fifa_api_id` IN (SELECT `team_fifa_api_id` FROM `Team` WHERE `team_long_name` = 'Willem II') AND `date` = '2012-02-22'	european_football_2
SELECT `buildUpPlayDribblingClass` FROM `Team_Attributes` WHERE `team_api_id` IN (     SELECT `team_api_id`     FROM `Team`     WHERE `team_short_name` = 'LEI' ) AND `date` = '2015-09-10 00:00:00';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'FC Lorient' AND `date` LIKE '2010-02-22%';	european_football_2
SELECT chanceCreationPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'PEC Zwolle' AND Team_Attributes.date = '2013-09-20 00:00:00'	european_football_2
SELECT chanceCreationCrossingClass  FROM Team_Attributes  WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND `date` LIKE '2015-09-10%';	european_football_2
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Marko Arnautovic') AND SUBSTR(`date`, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT      ((         (SELECT overall_rating           FROM Player_Attributes           WHERE player_api_id = (SELECT player_api_id                                  FROM Player                                  WHERE player_name = 'Landon Donovan')           AND date = '2013-07-12'         ) -          (SELECT overall_rating           FROM Player_Attributes           WHERE player_api_id = (SELECT player_api_id                                  FROM Player                                  WHERE player_name = 'Jordan Bowery')           AND date = '2013-07-12'         )     ) /      (SELECT overall_rating       FROM Player_Attributes       WHERE player_api_id = (SELECT player_api_id                              FROM Player                              WHERE player_name = 'Landon Donovan')       AND date = '2013-07-12'     )     ) * 100 AS percentage_difference	european_football_2
SELECT `player_name` FROM `Player` ORDER BY `height` DESC LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE (strftime('%Y', 'now') - strftime('%Y', p.birthday)) > 34;	european_football_2
SELECT SUM(home_team_goal) AS home_team_goals_scored_by_aaron_lennon FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id OR               Match.home_player_2 = Player.player_api_id OR               Match.home_player_3 = Player.player_api_id OR               Match.home_player_4 = Player.player_api_id OR               Match.home_player_5 = Player.player_api_id OR               Match.home_player_6 = Player.player_api_id OR               Match.home_player_7 = Player.player_api_id OR               Match.home_player_8 = Player.player_api_id OR               Match.home_player_9 = Player.player_api_id OR               Match.home_player_10 = Player.player_api_id OR               Match.home_player_11 = Player.player_api_id WHERE Player.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(away_team_goal) as total_away_goals FROM Match JOIN Player ON Player.player_api_id = Match.away_player_1 OR Player.player_api_id = Match.away_player_2 WHERE Player.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON home_player_1 = player_api_id OR home_player_2 = player_api_id OR              home_player_3 = player_api_id OR home_player_4 = player_api_id OR              home_player_5 = player_api_id OR home_player_6 = player_api_id OR              home_player_7 = player_api_id OR home_player_8 = player_api_id OR              home_player_9 = player_api_id OR home_player_10 = player_api_id OR              home_player_11 = player_api_id WHERE (strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', birthday)) < 31 GROUP BY home_team_api_id;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_1 OR p.player_api_id = m.home_player_2 OR p.player_api_id = m.home_player_3 JOIN (     SELECT home_player_api_id     FROM Match     WHERE home_player_1 IS NOT NULL OR home_player_2 IS NOT NULL OR home_player_3 IS NOT NULL     GROUP BY home_player_api_id     HAVING SUM(CASE WHEN pa.attacking_work_rate = 'high' THEN 1 ELSE 0 END) > 0 ) AS high_attackers ON p.player_api_id = high_attackers.home_player_api_id WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY p.birthday LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id WHERE c.name = 'Belgium';	european_football_2
SELECT p.player_name, c.name AS country_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE pa.vision >= 90;	european_football_2
SELECT Country.name, AVG(Player.weight) AS avg_weight FROM Player JOIN Country ON Player.player_fifa_api_id = Country.id GROUP BY Country.name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT `team_long_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `buildUpPlaySpeedClass` = 'Slow';	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE player_api_id IN (     SELECT player_api_id     FROM Player     JOIN Country ON Player.player_fifa_api_id = Country.id     WHERE Country.name = 'Italy' );	european_football_2
SELECT `player_name` FROM `Player` WHERE `height` > 180 ORDER BY `player_name` ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6) - (SELECT jumping FROM Player_Attributes WHERE id = 23) AS jumping_score_difference;	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left') AND pa.preferred_foot = 'left'	european_football_2
SELECT      (COUNT(*) FILTER (WHERE `strength` > 80 AND `stamina` > 80)) * 100.0 / COUNT(*) AS percentage_players_with_high_strength_stamina FROM      Player_Attributes;	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League');	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Alexis Blin';	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `Team.team_long_name` = 'KSV Cercle Brugge' LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A');	european_football_2
SELECT MAX(home_team_goal) AS highest_score FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Netherlands Eredivisie';	european_football_2
SELECT `Player_Attributes`.`finishing`, `Player_Attributes`.`curve` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `Player`.`weight` = (SELECT MAX(`weight`) FROM `Player`);	european_football_2
SELECT League.name, COUNT(Match.id) as game_count FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY game_count DESC LIMIT 4;	european_football_2
SELECT T1.team_long_name FROM Team T1 JOIN Match T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match);	european_football_2
SELECT `player_name` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`)	european_football_2
SELECT      (COUNT(CASE WHEN `height` < 180 AND `overall_rating` > 70 THEN 1 END) * 100.0) / COUNT(`id`) AS percentage_of_players_under_180cm_with_strength_over_70 FROM `Player_Attributes`	european_football_2
SELECT   (SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND Admission = '+') /    (SELECT COUNT(*) FROM Patient WHERE SEX = 'M') * 100 AS InPatientPercentage,   (SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND Admission = '-') /    (SELECT COUNT(*) FROM Patient WHERE SEX = 'M') * 100 AS OutPatientPercentage FROM DUAL;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN p.Birthday > '1930-01-01' THEN p.ID END) * 100.0) / COUNT(p.ID) AS Percentage_Female_Born_After_1930 FROM      Patient p WHERE      p.SEX = 'F';	thrombosis_prediction
SELECT      ROUND((COUNT(CASE WHEN P.Birthday BETWEEN '1930-01-01' AND '1940-12-31' AND P.Admission = '+' THEN 1 ELSE NULL END) * 100.0) / COUNT(CASE WHEN P.Birthday BETWEEN '1930-01-01' AND '1940-12-31' THEN 1 ELSE NULL END), 2) AS Inpatient_Percentage FROM      Patient P WHERE      P.Birthday BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN E.Diagnosis = 'SLE' AND P.Admission = '+' THEN P.ID END)      / COUNT(CASE WHEN E.Diagnosis = 'SLE' AND P.Admission = '-' THEN P.ID END)) AS OutpatientToInpatientRatio FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.`Diagnosis`, l.`Date` FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT      p.SEX,      p.Birthday,      e.`Examination Date`,      e.Symptoms FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RVVT = '+';	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE YEAR(p.Birthday) = '1937' AND e.T-CHO >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT      ROUND(         (COUNT(CASE WHEN `Patient`.SEX = 'F' THEN `Laboratory`.ID END AND          (`Laboratory`.T-BIL < 6.0 OR `Laboratory`.T-BIL > 8.5)) / COUNT(CASE WHEN `Patient`.SEX = 'F' THEN `Patient`.ID END) * 100, 2     ) AS PercentageOfFemalesWithAbnormalTotalProtein FROM      `Patient` JOIN      `Laboratory` ON `Patient`.ID = `Laboratory`.ID WHERE      `Patient`.SEX = 'F';	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS avg_anti_cardiolipin_igg FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.Admission` = '+' AND (`Patient.Birthday` IS NOT NULL AND (YEAR(CURRENT_TIMESTAMP) - YEAR(`Patient.Birthday`) >= 50)) AND `aCL IgG` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND YEAR(p.Description) = 1997 AND e.Admission = '-';	thrombosis_prediction
SELECT      (YEAR('1997-08-13') - YEAR(`Birthday`)) AS AgeAtAdmission FROM      `Patient` WHERE      `First Date` = (SELECT MIN(`First Date`) FROM `Patient`);	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND P.SEX = 'F' AND YEAR(E.Date) = 1997;	thrombosis_prediction
SELECT      MAX(YEAR(P.Birthday)) - MIN(YEAR(P.Birthday)) AS AgeGap FROM      Patient P WHERE      P.ID IN (SELECT E.ID FROM Examination E WHERE E.`T-BIL` >= 200)	thrombosis_prediction
SELECT      p.SEX,      p.Birthday,      e.Symptoms,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.Birthday = (SELECT MIN(Birthday) FROM Patient)     AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT      COUNT(Laboratory.ID) / 12 AS average_patients_per_month FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Patient.SEX = 'M'      AND Laboratory.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY      MONTH(Laboratory.Date);	thrombosis_prediction
SELECT      p.Birthday AS InitialHospitalArrivalDate,      TIMESTAMPDIFF(YEAR, p.Birthday, p.FirstDate) AS AgeAtInitialAdmission FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.Diagnosis LIKE '%SJS%' ORDER BY      p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) / SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS Male_to_Female_Ratio FROM      Patient WHERE      (SEX = 'M' AND aCL_IgG <= 8.0) OR (SEX = 'F' AND aCL_IgM <= 6.5);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  LEFT JOIN Examination e ON p.ID = e.ID  WHERE e.Examination_Date IS NULL  AND p.First_Date IS NOT NULL  AND (p.First_Date + INTERVAL 1 YEAR) < COALESCE(e.Examination_Date, '9999-12-31');	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday < '1974-01-01' AND YEAR(E.`Examination Date`) BETWEEN 1990 AND 1993;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.T-BIL >= 2.0;	thrombosis_prediction
SELECT `Diagnosis`, COUNT(`Diagnosis`) AS `Count` FROM `Examination` WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY `Diagnosis` ORDER BY `Count` DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(CURDATE()), YEAR(`Birthday`))) AS AvgAge FROM `Patient` WHERE `ID` IN (     SELECT `ID`     FROM `Laboratory`     WHERE `Date` BETWEEN '1991-10-01' AND '1991-10-30' )	thrombosis_prediction
SELECT      (YEAR(`Examination Date`) - YEAR(`Birthday`)) AS AgeAtExamination,     p.`Diagnosis` AS Diagnosis FROM      `Examination` e JOIN      `Patient` p ON e.ID = p.ID WHERE      (SELECT MAX(`HCT`) FROM `Laboratory` l WHERE l.ID = e.ID) = `HCT` ORDER BY      `HCT` DESC LIMIT 1;	thrombosis_prediction
SELECT `ANA Pattern` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT     `ID`,     `Date`,     `T-BIL` FROM     `Laboratory` WHERE     `ID` = 2927464     AND `Date` = '1995-09-04'     AND `T-BIL` < 250;	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis LIKE '%AORTITIS%' ORDER BY e.Examination Date LIMIT 1;	thrombosis_prediction
SELECT aCL_IgM  FROM Examination  WHERE ID IN (SELECT ID FROM Patient WHERE Description = '1994-02-19')  AND Examination_Date = '1993-11-12';	thrombosis_prediction
SELECT p.Description, p.First_Date, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.GPT = '9' AND e.Date = '1992-06-12' AND p.SEX IN ('M', 'F');	thrombosis_prediction
SELECT     (YEAR('1991-10-21') - YEAR(p.Birthday)) - (RIGHT('1991-10-21', 5) < RIGHT(p.Birthday, 5)) AS Age FROM     Patient p JOIN     Laboratory l ON p.ID = l.ID WHERE     l.Date = '1991-10-21' AND     l.GPT = 8.4;	thrombosis_prediction
SELECT COUNT(`Laboratory.ID`) AS TotalTests FROM `Laboratory` JOIN `Patient` ON `Laboratory.ID` = `Patient.ID` WHERE `Patient.First Date` = '1991-06-13' AND `Laboratory.Date` BETWEEN '1995-01-01' AND '1995-12-31' AND `Examination.Diagnosis` = 'SJS';	thrombosis_prediction
SELECT p.`Diagnosis` as OriginalDiagnosis FROM `Patient` p JOIN `Examination` e ON p.ID = e.ID WHERE e.`Examination Date` = '1997-01-27' AND e.Diagnosis = 'SLE' AND p.`First Date` = (SELECT MIN(`First Date`) FROM `Patient` WHERE ID = p.ID);	thrombosis_prediction
SELECT Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = '1959-03-01' AND Examination.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT      (SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-11-%' THEN L.TAT2 ELSE 0 END) -      SUM(CASE WHEN P.Birthday = '1959-02-18' AND L.Date LIKE '1981-12-%' THEN L.TAT2 ELSE 0 END)) AS CholesterolDecreaseRate FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.Birthday = '1959-02-18'     AND L.Date BETWEEN '1981-11-01' AND '1981-12-31';	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Diagnosis LIKE '%Behcet%' AND YEAR(E.`Examination Date`) BETWEEN 1997 AND 1997;	thrombosis_prediction
SELECT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.Date` BETWEEN '1987-07-06' AND '1996-01-31' AND `Examination.GPT` > 30 AND `Examination.ALB` < 4;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Thrombosis` = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination)	thrombosis_prediction
SELECT      ROUND(         (SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 ELSE 0 END),          2     ) AS percentage_within_normal_proteinuria_with_low_uric_acid FROM      Examination	thrombosis_prediction
SELECT      (SUM(CASE WHEN P.`Diagnosis` = 'BEHCET' AND YEAR(P.`First Date`) = '1981' THEN 1 ELSE 0 END) * 100.0) / COUNT(P.`ID`) AS PercentageBEHCET FROM      `Patient` P WHERE      P.`SEX` = 'M' AND      YEAR(P.`First Date`) = '1981'	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.ANA_Pattern != 'P' AND P.SEX = 'F' AND P.Birthday BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT p.Description FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Symptoms = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) AS AverageAlbuminLevel FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND P.Diagnosis = 'SLE' AND L.PLT > 400;	thrombosis_prediction
SELECT MAX(Symptoms) AS MostCommonSymptom FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT      p.`Description` AS FirstDocumentationDate,     e.`Diagnosis` AS Disease FROM      `Patient` p JOIN      `Examination` e ON p.`ID` = e.`ID` WHERE      p.`ID` = 48473 ORDER BY      p.`Description` LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND `Diagnosis` = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31' AND e.`aCL IgG` > 6 OR e.`aCL IgG` < 8.5 OR e.`aCL IgM` > 6 OR e.`aCL IgM` < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Examination.Symptoms LIKE '%ITP%' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN Patient.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END), 0)) * 100 AS proportion FROM      Examination JOIN      Patient ON Examination.ID = Patient.ID;	thrombosis_prediction
SELECT     ROUND(         (SUM(CASE WHEN `Patient`.SEX = 'F' THEN 1 ELSE 0 END) / COUNT(`Patient`.SEX)) * 100,         2     ) AS Percentage_Women_Born_1980_Diagnosed_with_RA FROM     `Patient` WHERE     YEAR(`Patient`.Birthday) = 1980 AND     `Patient`.Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M'  AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Diagnosis LIKE '%Behcet%' AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.HGB < 3.5;	thrombosis_prediction
SELECT      p.ID,     p.FirstDate,     e.ExaminationDate,     DATEDIFF(e.ExaminationDate, p.FirstDate) AS DaysToEvaluation FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID = 821298;	thrombosis_prediction
SELECT      CASE          WHEN p.SEX = 'M' AND l.UA > 8.0 THEN 'Yes'         WHEN p.SEX = 'F' AND l.UA > 6.5 THEN 'Yes'         ELSE 'No'     END AS UricAcidInRange FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID = 57266;	thrombosis_prediction
SELECT `Laboratory.Date` FROM `Laboratory` JOIN `Examination` ON `Laboratory.ID` = `Examination.ID` WHERE `Examination.ID` = 48473 AND `Examination.aCL IgG` >= 60;	thrombosis_prediction
SELECT p.ID, p.Sex, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1994 AND NOT EXISTS (     SELECT 1     FROM Examination e     WHERE e.ID = p.ID AND e.AST_GOT > 60 );	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.GPT >= 60;	thrombosis_prediction
SELECT p.ID, p.ID AS DateOfBirth FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG > 60 OR e.aCL_IgM > 60 ORDER BY p.ID;	thrombosis_prediction
SELECT AVG(`LDH`) as Average_LDH FROM `Examination` WHERE `LDH` < 500;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURDATE()) - YEAR(p.FirstDate)) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.LDH BETWEEN 600 AND 800 AND      (YEAR(CURDATE()) - YEAR(p.FirstDate)) BETWEEN 100 AND 300;	thrombosis_prediction
SELECT p.Admission FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.aCL_IgG < 300 OR e.aCL_IgM < 300 OR e.aCL_IgA < 300 GROUP BY p.Admission;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.First_Date BETWEEN '1982-04-01' AND '1982-04-30' AND l.ALKALIPHOSPHATASE < 300;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.GPT < 6.0;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      l.TP,      l.TP - 8.5 AS TP_Deviation FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.SEX = 'F' AND      l.TP > 8.5;	thrombosis_prediction
SELECT P.ID, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.ALB <= 3.5 OR L.ALB >= 5.5 ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,      CASE          WHEN p.Birthday BETWEEN '1982-01-01' AND '1982-12-31' THEN              CASE                  WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes'                 ELSE 'No'             END         ELSE 'Not Born in 1982'     END AS AlbuminStatus FROM      Patient p LEFT JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday BETWEEN '1982-01-01' AND '1982-12-31'	thrombosis_prediction
SELECT     CAST(COUNT(*) AS REAL) / COUNT(DISTINCT p.ID) * 100 AS percentage_of_females_with_high_UA FROM     Examination e JOIN     Patient p ON e.ID = p.ID WHERE     p.SEX = 'F' AND (         e.aCL_IgG > 8.0 OR e.aCL_IgM > 6.5     );	thrombosis_prediction
SELECT AVG(`Laboratory`.UA) as Average_UA FROM `Laboratory` JOIN `Patient` ON `Laboratory`.ID = `Patient`.ID WHERE (`Laboratory`.UA < 8.0 AND `Patient`.SEX = 'M') OR (`Laboratory`.UA < 6.5 AND `Patient`.SEX = 'F') AND `Laboratory`.Date = (SELECT MAX(`Date`) FROM `Laboratory` WHERE `Laboratory`.ID = `Patient`.ID) GROUP BY `Patient`.ID;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG BETWEEN 29 AND 30 OR e.aCL_IgM BETWEEN 29 AND 30;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Diagnosis = 'RA' AND E.aCL_IgG < 30 AND E.aCL_IgM < 30 AND E.aCL_IgA < 30;	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Patient.SEX` = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN `Patient.SEX` = 'F' THEN 1 ELSE 0 END))      AND EXISTS (         SELECT 1          FROM `Laboratory`          WHERE `Laboratory.CRE` >= 1.5          AND `Laboratory.ID` = `Patient.ID`     ) AS more_males_with_high_creatinine FROM `Patient`;	thrombosis_prediction
SELECT      Patient.ID,      Patient.SEX,      Patient.Birthday,      Examination.T_BIL FROM      Examination JOIN      Patient ON Examination.ID = Patient.ID WHERE      Examination.T_BIL = (SELECT MAX(T_BIL) FROM Examination);	thrombosis_prediction
SELECT GROUP_CONCAT(DISTINCT p.ID) AS PatientID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL >= 2.0 GROUP BY p.SEX;	thrombosis_prediction
SELECT      p.ID,      p.Birthday  FROM      Patient p  WHERE      p.Birthday = (SELECT MIN(Birthday) FROM Patient)      AND p.ID IN (SELECT ID FROM Laboratory WHERE T-BIL IS NOT NULL ORDER BY T-BIL DESC LIMIT 1);	thrombosis_prediction
SELECT      AVG(DIVIDE(SUBTRACT(YEAR(NOW()), YEAR(`Birthday`)), COUNT(`ID`))) AS average_age FROM      `Patient` WHERE      `SEX` = 'M' AND      `T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.Description, p.First_Date, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG > 300 OR e.aCL_IgM > 300 OR e.aCL_IgA > 300;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.T-BIL >= 200 AND year(CURRENT_TIMESTAMP) - year(P.Birthday) > 50;	thrombosis_prediction
SELECT DISTINCT `Examination.ID` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.Admission` = '-' AND `Laboratory.CRE` < 250;	thrombosis_prediction
SELECT DISTINCT COUNT(P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M'  AND YEAR(P.First Date) BETWEEN 1936 AND 1956 AND E.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID IN (     SELECT l.ID     FROM Laboratory l     WHERE l.GPT >= 180 AND l.TAT2 < 250 ) AND p.ID NOT IN (     SELECT l.ID     FROM Laboratory l     WHERE l.GPT < 180 OR l.TAT2 >= 250 );	thrombosis_prediction
SELECT Patient.ID, Examination.aCL_IgG AS GLU FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE STRFTIME('%Y', Patient.Description) = '1991' AND Examination.aCL_IgG < 180;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      (l.HCT <= 3.5 OR l.HCT >= 9.0) GROUP BY      p.SEX, p.Birthday ORDER BY      p.SEX, (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) ASC;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID IN (         SELECT              l.ID          FROM              Laboratory l          WHERE              l.HCT < 35     )     AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday,      p.Admission FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.SEX = 'F' AND      (p.Birthday IS NOT NULL AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) >= 50) AND      ((l.HCT <= 3.5 OR l.HCT >= 6.0) OR (l.HGB <= 3.5 OR l.HGB >= 6.0))	thrombosis_prediction
SELECT `Patient.ID`, `Patient.SEX` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Patient.Admission` = '-' AND `Laboratory.HGB` < 10;	thrombosis_prediction
SELECT      p.ID,      p.SEX  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      p.Diagnosis = 'SLE'      AND e.HGB > 10      AND e.HGB < 17  ORDER BY      p.Birthday  LIMIT 1;	thrombosis_prediction
SELECT L.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.HCT >= 52 GROUP BY L.ID HAVING COUNT(L.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) as AverageHCT FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN `PLT` < 100 THEN 1 ELSE 0 END) AS 'LowerThanNormal',     SUM(CASE WHEN `PLT` > 400 THEN 1 ELSE 0 END) AS 'HigherThanNormal' FROM      `Laboratory` WHERE      `PLT` < 100 OR `PLT` > 400;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1984 AND p.Birthday <= DATE_SUB(CURDATE(), INTERVAL 50 YEAR) AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      ROUND(         (SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END),          2     ) AS Percentage_Female_Abnormal_PT FROM      Examination  JOIN      Patient ON Examination.ID = Patient.ID WHERE      (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) > 55;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.First_Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.First_Date > '1992-12-31' AND l.DNA-II < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  WHERE e.`aCL IgG` > 45 OR e.`aCL IgM` > 45 OR e.`aCL IgA` > 0  AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.WBC > 3.5 AND e.WBC < 9.0 AND e.FG <= 150 OR e.FG >= 450;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND Laboratory.FG < 150 OR Laboratory.FG > 450;	thrombosis_prediction
SELECT DISTINCT p.`Diagnosis` FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE e.`U-PRO` >= 30;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.U_PRO > 0 AND l.U_PRO < 30;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.IGG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` > 900 AND `aCL IgG` < 2000 AND `Symptoms` IS NOT NULL;	thrombosis_prediction
SELECT      p.`Diagnosis`  FROM      `Examination` e  JOIN      `Patient` p ON e.ID = p.ID  WHERE      e.`aCL IgA` BETWEEN 80 AND 500      AND e.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM `Examination` WHERE `aCL IgA` BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`aCL IgA` > 80 AND E.`aCL IgA` < 500 AND P.`First Date` > '1990-01-01';	thrombosis_prediction
SELECT MAX(COUNT(Diagnosis)) as MostCommonDisease, Diagnosis FROM Examination WHERE `aCL IgM` <= 40 OR `aCL IgM` >= 400 GROUP BY Diagnosis ORDER BY MostCommonDisease DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID AND e.Symptoms LIKE '%CRP=%' WHERE e.Symptoms IS NULL AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE >= 1.5 AND SUBDATE(CURDATE(), INTERVAL 70 YEAR) > Patient.Birthday;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Symptoms IN ('-', '+-') AND p.Description LIKE '%RA%' AND e.Thrombosis = '+';	thrombosis_prediction
SELECT DISTINCT e.Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday > '1985-01-01' AND e.Diagnosis LIKE '%RA%' AND e.Diagnosis LIKE '%+-%' AND p.ID IN (     SELECT ID     FROM Examination     WHERE Diagnosis LIKE '%RA%'     AND (aCL_IgG IS NULL OR aCL_IgG = 0)     AND (aCL_IgM IS NULL OR aCL_IgM = 0)     AND (aCL_IgA IS NULL OR aCL_IgA = 0) );	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.Birthday IS NOT NULL AND        TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) > 60 AND        NOT EXISTS (           SELECT 1           FROM Laboratory l           WHERE l.ID = p.ID AND l.GPT >= 20       );	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.aCL_IgG < 20 AND e.aCL_IgM < 20 AND e.aCL_IgA < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ANA = 'P' AND l.C3 > 35;	thrombosis_prediction
SELECT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description IS NOT NULL AND p.Description BETWEEN 29 AND 52 ORDER BY e.aCL_IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 1 AND e.C4 > 10;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.RNP = '-' OR E.RNP = '+-' AND P.Admission = '+';	thrombosis_prediction
SELECT p.First_Date  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RNP NOT IN('-', '+-')  ORDER BY p.First_Date DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` IN('-', '+-') AND `Thrombosis` = 0;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSB = 'abnormal' ORDER BY p.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`Examination Date` > '1997-01-01' AND e.SC170 IN('negative','0');	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.aCL_IgG IN('negative', '0') AND P.SEX = 'F' AND E.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.SSA IN('-','+-') AND p.First_Date < '2000-01-01';	thrombosis_prediction
SELECT p.ID FROM `Patient` p JOIN `Examination` e ON p.ID = e.ID WHERE e.ANA_Pattern LIKE '%SSA%' AND e.ANA_Pattern NOT IN ('negative', '0') AND p.First_Date = (SELECT MIN(`First Date`) FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Examination` WHERE `ANA_Pattern` LIKE '%SSA%' AND `ANA_Pattern` NOT IN ('negative', '0'))) ORDER BY p.First_Date ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.ANA_Pattern IN('-', '+-') AND e.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.SSB IN ('negative', '0') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.CENTROMEA IN('-', '+-') AND e.SSB IN('-', '+-');	thrombosis_prediction
SELECT e.Diagnosis FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.DNA IS NULL AND p.Description IS NULL AND e.DNA < 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.aCL_IgG BETWEEN 900 AND 2000  AND p.Admission = '+';	thrombosis_prediction
SELECT      (COUNT(E.ID) * 1.0) / COUNT(DISTINCT P.ID) AS percentage FROM      Examination E JOIN      Patient P ON E.ID = P.ID WHERE      E.`aCL IgG` >= 60 AND P.Description = 'SLE';	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Sex = 'M' AND E.GOT < 60;	thrombosis_prediction
SELECT p.ID, p.Date FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG >= 60 OR e.aCL_IgM >= 60 ORDER BY p.Date ASC LIMIT 1;	thrombosis_prediction
SELECT      p.ID,     p.Date FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID IN (SELECT ID FROM Examination WHERE aCL_IgG < 60 AND aCL_IgM < 60) ORDER BY      (aCL_IgG + aCL_IgM) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG < 60 AND p.Sex = 'M';	thrombosis_prediction
SELECT MIN(L.Date) as FirstRecordDate FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.DNA-II < 500 AND P.ID IN (SELECT ID FROM Examination E WHERE E.aCL_IgG < 500 AND E.aCL_IgM < 500 AND E.Thrombosis = 0) ORDER BY FirstRecordDate ASC LIMIT 1;	thrombosis_prediction
SELECT MAX(`First Date`) as LatestRecordedDate FROM `Patient` WHERE `ID` IN (     SELECT `ID`     FROM `Examination`     WHERE `aCL IgG` >= 500 OR `aCL IgM` >= 500 OR `aCL IgA` >= 500 );	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`)  FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.GPT` >= 300 AND `Patient.Admission` = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`)  FROM `Patient`  JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID`  WHERE `Patient.Admission` = '-' AND `Laboratory.CRE` < 300;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis IN ('MCTD', 'SLE', 'PSS', 'SjS', 'vertigo') AND e.T-BIL IS NOT NULL AND e.T-BIL < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Diagnosis = 'SJS' AND E.TP > 6.0 AND E.TP < 8.5;	thrombosis_prediction
SELECT `Examination.Date` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Examination.aCL_IgG` BETWEEN 3.5 AND 5.5 AND `Examination.aCL_IgG` = (SELECT MAX(`Examination.aCL_IgG`)                           FROM `Examination`                           WHERE `Examination.aCL_IgG` BETWEEN 3.5 AND 5.5) AND `Patient.ID` IN (SELECT `Examination.ID`                     FROM `Examination`                     WHERE `Examination.aCL_IgG` BETWEEN 3.5 AND 5.5) ORDER BY `Examination.aCL_IgG` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M'  AND Laboratory.ALB > 3.5  AND Laboratory.ALB < 5.5  AND Laboratory.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT e.aCL_IgG, e.aCL_IgM, e.aCL_IgA FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Description = 'F' AND p.ID IN (     SELECT ID     FROM Laboratory     WHERE T_BIL BETWEEN 3.5 AND 7.0     ORDER BY T_BIL DESC     LIMIT 1 );	thrombosis_prediction
SELECT MAX(`aCL IgG`) AS HighestAntiNucleusAntibody FROM Examination WHERE `ID` IN (SELECT `ID` FROM Patient WHERE `Description` IS NOT NULL) AND `aCL IgG` IS NOT NULL;	thrombosis_prediction
SELECT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Examination) AND p.ID IN (SELECT ID FROM Examination WHERE `aCL IgG` < 1.5 AND `aCL IgM` < 1.5 AND `aCL IgA` < 1.5);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.T_BIL >= 2.0 AND e.ANA_Pattern LIKE '%P%'	thrombosis_prediction
SELECT e.aCL_IgG, e.aCL_IgM FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ID = (     SELECT ID     FROM Laboratory     WHERE T_BIL < 2.0     ORDER BY T_BIL DESC     LIMIT 1 );	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.aCL_IgG < 0 AND EXISTS (     SELECT 1     FROM Examination AS E2     WHERE E2.ID = Patient.ID     AND E2.T_CHo > 250 );	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.T_BIL < 250 AND e.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.T-BIL < 200 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.aCL_IgG < 200 AND e.aCL_IgG = (SELECT MAX(aCL_IgG) FROM Examination WHERE aCL_IgG < 200)	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 0 AND E.aCL_IgG < 250 OR E.aCL_IgM < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+');	thrombosis_prediction
SELECT p.Birthday  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.GLU > 180  ORDER BY p.Birthday  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`aCL IgG` < 180 AND E.`aCL IgM` < 180 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.HCT BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE p.Diagnosis = 'SLE'  AND e.HGB BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE (e.aCL_IgA IS NOT NULL AND (e.aCL_IgA <= 3.5 OR e.aCL_IgA >= 6.0)) AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgA > 100 AND E.aCL_IgA < 400 AND P.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT      p.ID,      p.Description,      p.First_Date,      e.aCL_IgG,      e.aCL_IgM,      e.aCL_IgA,      e.Symptoms,      e.Thrombosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.Description = 'MCTD'      AND e.aCL_IgG BETWEEN 100 AND 400      AND e.aCL_IgM BETWEEN 100 AND 400      AND e.aCL_IgA BETWEEN 100 AND 400;	thrombosis_prediction
SELECT AVG(`PT`) AS AverageProthrombinTime FROM `Examination` WHERE `SEX` = 'M' AND `PT` < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis IN (1, 2) AND E.aCL_IgG < 14;	thrombosis_prediction
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.college = 'College of Engineering';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Art and Design';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone  FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*)  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT      e.event_name,      COUNT(a.link_to_event) AS attendance_count FROM      event e JOIN      attendance a ON e.event_id = a.link_to_event WHERE      a.link_to_member IN (         SELECT              m.member_id          FROM              member m          WHERE              m.link_to_major IN (                 SELECT                      m.major_id                  FROM                      major m                  WHERE                      m.college = 'Student_Club'             )     ) GROUP BY      e.event_id ORDER BY      attendance_count DESC LIMIT 1;	student_club
SELECT m.link_to_major, m.first_name, m.last_name, m.position, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President' AND m.member_id IN (SELECT member_id FROM member WHERE position = 'Vice President' AND link_to_major IS NOT NULL);	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT e.event_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*)  FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 10;	student_club
SELECT event_name  FROM event  WHERE type != 'Fundraiser'  AND event_id IN (     SELECT link_to_event      FROM attendance      GROUP BY link_to_event      HAVING COUNT(link_to_member) > 20 );	student_club
SELECT AVG(ATTENDANCE_COUNT) as average_attendance FROM (     SELECT COUNT(a.link_to_member) as ATTENDANCE_COUNT     FROM event e     JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020     GROUP BY e.event_name ) as meeting_attendance;	student_club
SELECT expense_description, MAX(cost) AS max_cost FROM expense WHERE link_to_budget IS NOT NULL GROUP BY expense_description ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT `last_name` FROM `member` JOIN `major` ON `member`.`link_to_major` = `major`.`major_id` WHERE `major_name` = 'Law and Constitutional Studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.member_id = 'rec280Sk7o31iG0Tx';	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.member_id = 'Tyler Hewitt';	student_club
SELECT SUM(i.amount) AS total_funds_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(b.spent) as total_spent_on_food FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT      m.city,      m.state FROM      member m JOIN      major ma ON m.link_to_major = ma.major_id WHERE      m.position = 'President' AND      ma.college = 'College of Natural Resources';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois';	student_club
SELECT SUM(b.spent) AS total_advertisement_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT major.department  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.member_id IN ('rec1x5zBFIqoOuPW8', 'rec280Sk7o31iG0Tx');	student_club
SELECT SUM(b.amount) AS total_budgeted_amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'October Speaker';	student_club
SELECT expense_id, expense_description, expense_date, approved FROM expense JOIN event ON expense.link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Meeting' AND event_date = '2019-10-08')) WHERE approved = 'true';	student_club
SELECT      SUM(e.cost) / COUNT(e.expense_id) AS average_cost FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      m.first_name = 'Elijah' AND m.last_name = 'Allen'     AND CAST(SUBSTRING(e.expense_date, 6, 2) AS INTEGER) IN (9, 10);	student_club
SELECT      SUM(CASE WHEN YEAR(SUBSTRING(event_date, 1, 4)) = 2019 THEN spent ELSE 0 END) AS spent_2019,     SUM(CASE WHEN YEAR(SUBSTRING(event_date, 1, 4)) = 2020 THEN spent ELSE 0 END) AS spent_2020,     SUM(CASE WHEN YEAR(SUBSTRING(event_date, 1, 4)) = 2019 THEN spent ELSE 0 END) -      SUM(CASE WHEN YEAR(SUBSTRING(event_date, 1, 4)) = 2020 THEN spent ELSE 0 END) AS difference FROM      budget WHERE      link_to_event IN (SELECT event_id FROM event WHERE YEAR(SUBSTRING(event_date, 1, 4)) IN (2019, 2020));	student_club
SELECT location  FROM event  WHERE event_name = 'Spring Budget Review';	student_club
SELECT SUM(`amount`) AS total_cost FROM `budget` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` JOIN `event` ON `budget.link_to_event` = `event.event_id` WHERE `event.event_name` = 'Posters' AND `expense.expense_date` = '2019-09-04' AND `budget.category` = 'Advertisement';	student_club
SELECT `remaining` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT notes  FROM income  WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone_number FROM `member` WHERE `first_name` = 'Carlo' AND `last_name` = 'Jacobs';	student_club
SELECT `county` FROM `member` JOIN `zip_code` ON `member.zip` = `zip_code.zip_code` WHERE `first_name` = 'Adela' AND `last_name` = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE event_status = 'Closed'    AND `link_to_event` IN (SELECT `event_id` FROM `event` WHERE `event_name` = 'November Meeting')   AND `remaining` < 0;	student_club
SELECT SUM(b.amount) AS total_budget_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Speaker';	student_club
SELECT e.event_status FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium';	student_club
SELECT `zip_code` FROM `member` WHERE `member_id` = 'rec3pH4DxMcWHMRB7' AND `zip` IS NOT NULL;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT `state` FROM `member` JOIN `zip_code` ON `member.zip` = `zip_code.zip_code` WHERE `first_name` = 'Sacha' AND `last_name` = 'Harrison';	student_club
SELECT m.link_to_major, ma.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT date_received FROM income WHERE first_name = 'Connor' AND last_name = 'Hilton' AND source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /      SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement';	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /       COUNT(CASE WHEN e.event_name = 'November Speaker' THEN 1 END)) * 100 AS parking_budget_percentage FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'November Speaker'	student_club
SELECT SUM(cost) AS total_pizza_cost FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT DISTINCT major_id FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description FROM `budget` b JOIN `expense` e ON b.budget_id = e.link_to_budget WHERE b.remaining = (SELECT MIN(remaining) FROM `budget`);	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT `college` FROM `member` JOIN `major` ON `member`.`link_to_major` = `major`.`major_id` GROUP BY `college` ORDER BY COUNT(`member`.`member_id`) DESC LIMIT 1;	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360';	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.amount = (SELECT MAX(amount) FROM budget);	student_club
SELECT e.expense_description, e.expense_date, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT date_received  FROM income  WHERE `link_to_member` = 'rec3pH4DxMcWHMRB7';	student_club
SELECT COUNT(*)  FROM `member`  WHERE `zip` IN (     SELECT `zip_code`      FROM `zip_code`      WHERE `state` = 'Maryland' );	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT      `event_id`,      `event_name`,      MAX(DIVIDE(`spent`, `amount`)) AS spend_to_budget_ratio FROM      `event`  JOIN      `budget` ON `event.event_id` = `budget.link_to_event` WHERE      `event.status` = 'Closed' AND      `budget.amount` IS NOT NULL AND      `budget.spent` IS NOT NULL GROUP BY      `event_id`, `event_name` ORDER BY      spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget WHERE event_status = 'Closed';	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(e.cost) AS total_spent_on_food FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.event_status = 'Closed' AND e.expense_description LIKE '%Food%';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(amount) AS total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT      CONCAT(m.first_name, ' ', m.last_name) AS full_name,      SUM(i.amount) AS total_income FROM      income i JOIN      member m ON i.link_to_member = m.member_id WHERE      i.amount > 40 GROUP BY      m.member_id ORDER BY      total_income DESC;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN event ev ON e.link_to_budget IN (     SELECT budget_id     FROM budget b     WHERE b.link_to_event IN (         SELECT event_id         FROM event         WHERE event_name = 'Yearly Kickoff'     ) );	student_club
SELECT      CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM      member m JOIN      event e ON m.member_id = e.event_id JOIN      budget b ON e.event_id = b.link_to_event WHERE      e.event_name = 'Yearly Kickoff'     AND b.event_status = 'Closed';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS max_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id ORDER BY max_income DESC LIMIT 1;	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.amount IS NOT NULL ORDER BY budget.amount ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.cost ELSE 0 END) / SUM(b.cost)) * 100 AS percentage_of_total_cost FROM      event e JOIN      budget b ON e.event_id = b.link_to_event	student_club
SELECT      (SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) / SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END)) AS finance_to_physics_ratio FROM      member m;	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM `member` WHERE position = 'Secretary';	student_club
SELECT COUNT(*)  FROM `member`  JOIN `major` ON `member`.`link_to_major` = `major`.`major_id`  WHERE `major`.`major_name` = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*) AS num_events_attended, m.major_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' GROUP BY m.major_name;	student_club
SELECT AVG(spent)  FROM budget  WHERE category = 'Food'  AND event_status = 'Closed' GROUP BY link_to_event;	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1;	student_club
SELECT      COUNT(*) FROM      `attendance` JOIN      `event` ON `attendance.link_to_event` = `event.event_id` JOIN      `member` ON `attendance.link_to_member` = `member.member_id` WHERE      `event.event_name` = 'Women''s Soccer'      AND `member.first_name` = 'Maya'      AND `member.last_name` = 'Mclean';	student_club
SELECT      (SUM(CASE WHEN `type` = 'Community Service' THEN 1 ELSE 0 END) * 100.0) / COUNT(`event_id`)  FROM      `event`  WHERE      `event_date` BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT SUM(e.cost) AS total_poster_cost FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE e.event_name = 'September Speaker' AND ex.expense_description = 'Posters';	student_club
SELECT `t_shirt_size`, COUNT(`t_shirt_size`) AS `size_count` FROM `member` GROUP BY `t_shirt_size` ORDER BY `size_count` DESC LIMIT 1;	student_club
SELECT event_name FROM event WHERE status = 'Closed' AND remaining < 0 ORDER BY remaining ASC LIMIT 1;	student_club
SELECT e.type, SUM(e.cost) AS total_value FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE e.event_name = 'October Meeting' AND ex.approved = 'true' GROUP BY e.type;	student_club
SELECT budget_category, SUM(amount) AS total_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY budget_category ORDER BY total_budgeted ASC;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_cost_spent_on_parking FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM `expense` WHERE `expense_date` = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT position FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*) FROM `member` WHERE `link_to_major` = (SELECT `major_id` FROM `major` WHERE `major_name` = 'Business') AND `t_shirt_size` = 'Medium';	student_club
SELECT `type` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.remaining` > 30;	student_club
SELECT `type` FROM `event` WHERE `location` = 'MU 215';	student_club
SELECT event_name, event_category FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT m.first_name, m.last_name, m.email, m.position, ma.major_name FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT      ROUND((SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.member_id)) * 100, 2) AS percentage_business_members FROM      member m JOIN      major ma ON m.link_to_major = ma.major_id;	student_club
SELECT `type`  FROM `event`  WHERE `location` = 'MU 215';	student_club
SELECT COUNT(*)  FROM `income`  WHERE `amount` = 50;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large';	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN event e ON ma.college = 'School of Applied Sciences, Technology and Education' WHERE ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT      m.last_name,      m.major_name,      m.department,      m.college FROM      `member` m JOIN      `major` ma ON m.link_to_major = ma.major_id WHERE      ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND b.spent = 0 AND e.type = 'Guest Speaker';	student_club
SELECT m.zip, z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name  FROM event e  JOIN member m ON e.location = '900 E. Washington St' AND m.position = 'Vice President'  WHERE e.type = 'Social';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      ROUND((COUNT(CASE WHEN `income`.`amount` = 50 THEN 1 END) * 100.0) / COUNT(`member`.`member_id`), 2) AS percentage_50_amount_received FROM `member` JOIN `income` ON `member`.`member_id` = `income`.`link_to_member` WHERE `member`.`t_shirt_size` = 'Medium' AND `member`.`position` = 'Member' AND `income`.`amount` = 50;	student_club
SELECT DISTINCT zc.state, zc.short_state FROM zip_code zc WHERE zc.type = 'PO Box';	student_club
SELECT DISTINCT z.zip_code FROM zip_code z WHERE z.city = 'San Juan' AND z.county = 'San Juan Municipio' AND z.state = 'Puerto Rico' AND z.zip_code LIKE '%PO Box%';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN expense ex ON a.link_to_member = ex.link_to_member WHERE ex.cost > 50 JOIN member m ON a.link_to_member = m.member_id;	student_club
SELECT      m.member_id,      m.first_name,      m.last_name,      e.event_id,      e.event_name FROM      member m JOIN      attendance a ON m.member_id = a.link_to_member JOIN      expense e ON a.link_to_event = e.link_to_budget WHERE      e.expense_date BETWEEN '2019-01-10' AND '2019-11-19' AND      e.expense_description = 'Approved'	student_club
SELECT m.link_to_major  FROM `member` m  WHERE m.first_name = 'Katy' AND m.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Agriculture and Applied Sciences' AND ma.major_name = 'Business';	student_club
SELECT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Education'  AND ma.college = 'College of Education & Human Services'  AND m.position = 'Member';	student_club
SELECT     (SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) * 100.0) / COUNT(e.event_id) AS percentage_over_budget FROM     event e JOIN     budget b ON e.event_id = b.link_to_event	student_club
SELECT `event_id`, `location`, `event_status` FROM `event` WHERE `event_date` BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, expense_description, expense_date, cost FROM expense WHERE cost > 50 GROUP BY expense_id, expense_description, expense_date, cost HAVING SUM(cost) / COUNT(expense_id) > 50;	student_club
SELECT first_name, last_name FROM `member` WHERE t_shirt_size = 'X-Large';	student_club
SELECT      (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) / COUNT(zip_code)) * 100 AS percentage_po_box FROM      zip_code;	student_club
SELECT `event_name`, `location` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.amount` - `budget.spent` > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, m.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100;	student_club
SELECT z.city, z.short_state FROM event e JOIN income i ON e.event_id = i.link_to_member JOIN member m ON i.link_to_member = m.member_id JOIN zip_code z ON m.zip = z.zip_code GROUP BY e.event_id HAVING COUNT(i.income_id) > 40;	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id IN (     SELECT link_to_member     FROM expense     GROUP BY link_to_member     HAVING COUNT(DISTINCT link_to_event) > 1 ) GROUP BY m.member_id, m.first_name, m.last_name ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(T.cost) AS average_amount_paid FROM (     SELECT SUM(E.cost) AS cost     FROM expense E     JOIN member M ON E.link_to_member = M.member_id     WHERE M.position <> 'Member' ) AS T;	student_club
SELECT event_name FROM event WHERE cost < (SELECT SUM(cost) / COUNT(event_id) FROM expense WHERE category = 'Parking') AND event_id IN (SELECT link_to_event FROM expense WHERE category = 'Parking');	student_club
SELECT      (SUM(CASE WHEN e.type = 'Meeting' THEN e.cost ELSE 0 END) /       (SELECT COUNT(*) FROM event)) * 100 AS meeting_cost_percentage FROM      event e;	student_club
SELECT      b.budget_id,      b.amount  FROM      budget b  JOIN      expense e ON b.budget_id = e.link_to_budget  WHERE      e.expense_description = 'Water, chips, cookies'  ORDER BY      b.amount DESC  LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT      m.first_name,      m.last_name,      m.phone FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      (SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.member_id)) -     (SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.member_id)) AS percentage_difference FROM      member m JOIN      zip_code z ON m.zip = z.zip_code WHERE      m.link_to_major IS NOT NULL;	student_club
SELECT major.major_name, major.department FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT      m.first_name || ' ' || m.last_name AS full_name,      e.cost FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT b.event_status, SUM(e.amount) AS total_amount_budgeted FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'January Speaker' GROUP BY b.event_status;	student_club
SELECT DISTINCT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT `category` FROM `budget` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` WHERE `expense.expense_description` = 'Posters';	student_club
SELECT m.first_name, m.last_name, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent_on_gifts FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name, position FROM member WHERE city = 'Lincolnton' AND state = 'North Carolina' AND zip = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') /      (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS EUR_to_CZK_ratio;	debit_card_specializing
SELECT CustomerID, MIN(Consumption) AS MinConsumption FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' GROUP BY CustomerID ORDER BY MinConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS Average_Monthly_Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID) AS NumCustomers FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' AND ym.Date BETWEEN '201201' AND '201212' AND ym.Consumption < 30000;	debit_card_specializing
SELECT      (SUM(CASE WHEN ym.Date BETWEEN '201201' AND '201212' AND c.Currency = 'CZK' THEN ym.Consumption ELSE 0 END)      - SUM(CASE WHEN ym.Date BETWEEN '201201' AND '201212' AND c.Currency = 'EUR' THEN ym.Consumption ELSE 0 END)) AS DifferenceInConsumption FROM      yearmonth AS ym JOIN      customers AS c ON ym.CustomerID = c.CustomerID	debit_card_specializing
SELECT      YEAR(`Date`) AS `Year`,      SUM(`Consumption`) AS `TotalConsumption` FROM      `yearmonth` WHERE      `Currency` = 'EUR' GROUP BY      `Year` ORDER BY      `TotalConsumption` DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT LEFT(Date, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK') GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT `Date`, `Consumption` FROM `yearmonth` WHERE `CustomerID` IN (     SELECT `CustomerID`     FROM `customers`     WHERE `Currency` = 'EUR' ) AND `Date` BETWEEN '201301' AND '201312' ORDER BY `Consumption` DESC LIMIT 1;	debit_card_specializing
WITH   lowest_consumption AS (     SELECT        Segment,        MIN(Consumption) AS MinConsumption     FROM        yearmonth     WHERE        Date BETWEEN '201301' AND '201312'     GROUP BY        Segment   ),   annual_consumption AS (     SELECT        c.Segment,        SUM(y.Consumption) AS AnnualConsumption     FROM        yearmonth y     JOIN        customers c ON y.CustomerID = c.CustomerID     WHERE        y.Date BETWEEN '201301' AND '201312'     GROUP BY        c.Segment   ),   segment_average AS (     SELECT        ac.Segment,        ac.AnnualConsumption / lc.MinConsumption AS AvgConsumption     FROM        annual_consumption ac     JOIN        lowest_consumption lc ON ac.Segment = lc.Segment   ),   segment_comparison AS (     SELECT        'SME vs LAM' AS Comparison,        COALESCE(sa.AvgConsumption_SME - sa.AvgConsumption_LAM, 0) AS Difference     FROM        segment_average sa     WHERE        sa.Segment = 'SME' AND        EXISTS (SELECT 1 FROM segment_average WHERE Segment = 'LAM')     UNION ALL     SELECT        'LAM vs KAM' AS Comparison,        COALESCE(sa.AvgConsumption_LAM - sa.AvgConsumption_KAM, 0) AS Difference     FROM        segment_average sa     WHERE        sa.Segment = 'LAM' AND        EXISTS (SELECT 1 FROM segment_average WHERE Segment = 'KAM')     UNION ALL     SELECT        'KAM vs SME' AS Comparison,        COALESCE(sa.AvgConsumption_KAM - sa.AvgConsumption_SME, 0) AS Difference     FROM        segment_average sa     WHERE        sa.Segment = 'KAM' AND        EXISTS (SELECT 1 FROM segment_average WHERE Segment = 'SME')   ) SELECT    Comparison,    Difference FROM    segment_comparison ORDER BY    Comparison;	debit_card_specializing
SELECT      Segment,     MAX(PercentageIncrease) AS HighestPercentageIncrease,     MIN(PercentageIncrease) AS LowestPercentageIncrease FROM (     SELECT          c.Segment,         (SUM(y3.Consumption) - SUM(y2.Consumption)) / SUM(y3.Consumption) * 100 AS PercentageIncrease     FROM          yearmonth y1     JOIN          yearmonth y2 ON y1.CustomerID = y2.CustomerID AND LEFT(y1.Date, 4) = LEFT(y2.Date, 4) + 1     JOIN          yearmonth y3 ON y1.CustomerID = y3.CustomerID AND LEFT(y1.Date, 4) = LEFT(y3.Date, 4) + 2     JOIN          customers c ON y1.CustomerID = c.CustomerID     WHERE          c.Currency = 'EUR' AND         c.Segment IN ('SME', 'LAM', 'KAM') AND         y1.Date LIKE '2012%' AND         y2.Date LIKE '2013%'     GROUP BY          c.Segment ) AS Increases GROUP BY      Segment;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `CustomerID` = 6 AND `Date` BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount') -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS Difference	debit_card_specializing
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS DifferenceInConsumption	debit_card_specializing
SELECT      (SELECT SUM(t.Amount)       FROM transactions_1k t       JOIN customers c ON t.CustomerID = c.CustomerID       WHERE c.Segment = 'SME' AND c.Currency = 'CZK') -     (SELECT SUM(t.Amount)       FROM transactions_1k t       JOIN customers c ON t.CustomerID = c.CustomerID       WHERE c.Segment = 'SME' AND c.Currency = 'EUR')  AS Difference;	debit_card_specializing
SELECT ym.CustomerID FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `Date` = '201305' AND `CustomerID` IN (     SELECT `CustomerID`     FROM `customers`     WHERE `Segment` = 'KAM' );	debit_card_specializing
SELECT     (COUNT(*) FILTER (WHERE Consumption > 46.73) * 100.0) / COUNT(*) AS Percentage FROM     yearmonth JOIN     customers ON yearmonth.CustomerID = customers.CustomerID WHERE     customers.Segment = 'LAM';	debit_card_specializing
SELECT `Country`, COUNT(`GasStationID`) AS `ValueForMoneyCount` FROM `gasstations` WHERE `Segment` = 'Value for money' GROUP BY `Country` ORDER BY `ValueForMoneyCount` DESC;	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0) / COUNT(*) AS PercentageOfKAMInEUR FROM      customers c WHERE      c.Segment = 'KAM';	debit_card_specializing
SELECT      (SELECT COUNT(*)       FROM `yearmonth`       WHERE `Date` = '201202' AND `Consumption` > 528.3) * 100.0 /      (SELECT COUNT(*)       FROM `yearmonth`       WHERE `Date` = '201202') AS Percentage;	debit_card_specializing
SELECT      (COUNT(CASE WHEN `Country` = 'CZE' AND `Segment` = 'Premium' THEN 1 END) * 100.0) /      COUNT(*) AS PercentageOfPremiumGasStations FROM      `gasstations` WHERE      `Country` = 'CZE';	debit_card_specializing
SELECT `CustomerID` FROM `yearmonth` WHERE `Date` = '201309' ORDER BY `Consumption` DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'SME' AND ym.Date = '201206' ORDER BY ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) as HighestMonthlyConsumption FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012';	debit_card_specializing
SELECT      ym.CustomerID,      (ym.Consumption / 12) AS MonthlyConsumption FROM      yearmonth ym INNER JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' ORDER BY      MonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE LEFT(y.Date, 6) = '201309';	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE LEFT(ym.Date, 6) = '201306'	debit_card_specializing
SELECT g ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY g.ChainID;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(`Price` * `Amount`) AS `AverageTotalPrice` FROM `transactions_1k` WHERE `Date` LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11);	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE GasStationID IN (     SELECT GasStationID     FROM gasstations     WHERE Country = 'CZE' ) AND Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(`Price` * `Amount`) AS AverageTotalPrice FROM `transactions_1k` INNER JOIN `gasstations` ON `transactions_1k`.`GasStationID` = `gasstations`.`GasStationID` WHERE `gasstations`.`Country` = 'CZE';	debit_card_specializing
SELECT AVG(T.Amount * T.Price) as AverageTotalPrice FROM transactions_1k T JOIN customers C ON T.CustomerID = C.CustomerID WHERE C.Currency = 'EUR';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount * t.Price) AS TotalSpent FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25' GROUP BY t.CustomerID ORDER BY TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' AND t.Amount > 0 ORDER BY t.TransactionID LIMIT 1;	debit_card_specializing
SELECT `Price` FROM `transactions_1k` WHERE `Date` = '2012-08-24' AND `Time` = '16:25:00';	debit_card_specializing
SELECT      c.CustomerID,     ym.Consumption FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      ym.Date = '2012-08-23'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26'   AND Time < '13:00:00'   AND Price * Amount = 672.64;	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (     SELECT MIN(CustomerID)     FROM customers );	debit_card_specializing
SELECT g.Country FROM transactions_1k t1 JOIN gasstations g ON t1.GasStationID = g.GasStationID WHERE t1.Date = '2012-08-24' AND t1.Time = '12:42:00';	debit_card_specializing
SELECT `ProductID` FROM `transactions_1k` AS T1 WHERE T1.`Date` = '2012-08-23' AND T1.`Time` = '21:20:00';	debit_card_specializing
SELECT      ym.Consumption,      ym.Date AS ExpenseDate FROM      yearmonth ym WHERE      ym.CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Amount * Price = 124.05)     AND LEFT(ym.Date, 7) = '201201'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00'   AND transactions_1k.Date = '2012-08-26'   AND gasstations.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.CustomerID, g.Country FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE ym.Consumption = 548.4 AND ym.Date = '2012-08-24';	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0) / COUNT(c.CustomerID) AS Percentage_EUR_Users FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      ym.Date = '2012-08-25';	debit_card_specializing
SELECT      ((a.Consumption - b.Consumption) / a.Consumption) * 100 AS ConsumptionDecreaseRate FROM      yearmonth a JOIN      yearmonth b ON a.CustomerID = b.CustomerID AND a.Date = DATE('2012-08-24') AND b.Date = DATE('2013-08-24') WHERE      a.CustomerID = (         SELECT              CustomerID          FROM              yearmonth          WHERE              Date = DATE('2012-08-24') AND Consumption = 634.8     )	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) as Revenue FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1;	debit_card_specializing
SELECT     (SUM(CASE WHEN g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Premium_Percentage FROM     gasstations g WHERE     g.Country = 'SVK';	debit_card_specializing
SELECT SUM(`Amount` * `Price`) AS TotalAmountSpent FROM `transactions_1k` WHERE `CustomerID` = 38508;  SELECT SUM(`Consumption`) AS TotalConsumptionJanuary2012 FROM `yearmonth` WHERE `CustomerID` = 38508 AND `Date` = '201201';	debit_card_specializing
SELECT      p.ProductID,      p.Description AS ProductName,      SUM(t.Amount) AS TotalAmountSold FROM      transactions_1k t JOIN      products p ON t.ProductID = p.ProductID GROUP BY      p.ProductID, p.Description ORDER BY      TotalAmountSold DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,      AVG(t.Price / t.Amount) AS avg_price_per_item,      c.Currency FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY      c.CustomerID, c.Currency ORDER BY      avg_price_per_item DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym JOIN transactions_1k t ON ym.CustomerID = t.CustomerID WHERE t.ProductID = 5 AND t.Price / t.Amount > 29.00 AND ym.Date = '201208';	debit_card_specializing
