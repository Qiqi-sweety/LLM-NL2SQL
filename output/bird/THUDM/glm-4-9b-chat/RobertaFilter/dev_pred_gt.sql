SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM `frpm` WHERE `County Name` = 'Alameda' AND `Enrollment (K-12)` > 0;	california_schools
SELECT `School Name`, `Percent (%) Eligible Free (Ages 5-17)` FROM `frpm` WHERE `Educational Option Type` = 'Continuation' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT `schools.Zip` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `frpm.Charter School (Y/N)` = 1 AND `schools.County` = 'Fresno' AND `schools.District` = 'Fresno County Office of Education';	california_schools
SELECT MailStreet, MailStrAbr, MailCity, MailZip, MailState FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.FRPM Count (K-12) = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.CharterSchool(Y/N) = 1 AND f.Charter Funding Type = 'Directly funded' AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F';	california_schools
SELECT s.CDSCode, s.School, s.Magnet FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT `schools.Phone` FROM `schools` JOIN `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE `satscores.NumGE1500` > 0 ORDER BY `satscores.NumGE1500` DESC LIMIT 1;	california_schools
SELECT satscores.NumTstTakr FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode WHERE frpm.FRPM Count (K-12) = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm )	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath > 560 AND s.FundingType = 'Directly funded';	california_schools
SELECT frpm.FRPM_Count__Ages_5_17 FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead = (     SELECT MAX(AvgScrRead)     FROM satscores )	california_schools
SELECT CDSCode  FROM frpm  WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) AS HighestEligibleFreeRate FROM `frpm` WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3 AND `Enrollment (Ages 5-17)` > 0 AND `Percent (%) Eligible Free (Ages 5-17)` IS NOT NULL;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' ORDER BY (ss.NumGE1500 / NULLIF(ss.NumTstTakr, 0)) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, frpm.Enrollment_Ages_5_17 FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode ORDER BY frpm.Enrollment_Ages_5_17 DESC LIMIT 5;	california_schools
SELECT      s.District,      AVG(s.AvgScrRead) AS AvgReadScore FROM      satscores s JOIN      schools sch ON s.cds = sch.CDSCode WHERE      sch.StatusType = 'Active' GROUP BY      s.District ORDER BY      AvgReadScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores WHERE `NumTstTakr` < 100 AND `dname` = 'Alameda';	california_schools
SELECT      `schools.CDSCode`,     `schools.CharterNum` AS CharterNumber,     AVG(`satscores.AvgScrWrite`) AS AvgWriteScore FROM      `schools` JOIN      `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE      `satscores.AvgScrWrite` > 499 AND     `schools.CharterNum` IS NOT NULL GROUP BY      `schools.CDSCode`, `schools.CharterNum` ORDER BY      AvgWriteScore DESC;	california_schools
SELECT COUNT(*) FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Fresno' AND s.FundingType = 'Directly funded' AND sc.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrMath IS NOT NULL ORDER BY sc.AvgScrMath DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE `Low Grade` = '9'    AND `High Grade` = '12'    AND `District Code` = (SELECT `District Code` FROM schools WHERE `County` = 'Amador' AND `District` = 'Amador County Office of Education');	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;	california_schools
SELECT s.School, sname, NumTstTakr FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1;	california_schools
SELECT      s.School,      s.Street,      s.StreetAbr,      s.City,      s.Zip FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT      s.School  FROM      frpm f  JOIN      schools s ON f.CDSCode = s.CDSCode  JOIN      satscores sc ON f.CDSCode = sc.cds  WHERE      (f.Percent (%) Eligible Free (K-12) > 0.1 OR f.Percent (%) Eligible FRPM (K-12) > 0.1)      AND sc.NumGE1500 >= 1500;	california_schools
SELECT s.School, s.FundingType FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Riverside' GROUP BY s.School, s.FundingType HAVING AVG(ss.AvgScrMath) > 400;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Monterey' AND f.`Percent (%) Eligible FRPM (Ages 5-17)` > 0 AND f.FRPMMonthlyCount (Ages 5-17) > 800 AND s.SchoolType = 'High Schools (Public)';	california_schools
SELECT      s.School,      s.Phone AS CommunicationNumber,      ss.AvgScrWrite FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      (s.OpenDate > '1991-01-01' OR (s.ClosedDate < '2000-01-01' AND s.ClosedDate IS NOT NULL))	california_schools
SELECT      s.School,      s.DOCType FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.FundingType = 'Locally funded'     AND f.`Enrollment (K-12)` IS NOT NULL      AND f.`Enrollment (Ages 5-17)` IS NOT NULL GROUP BY      s.School,      s.DOCType HAVING      ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (         SELECT              AVG(ABS(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)         FROM              frpm         WHERE              `Enrollment (K-12)` IS NOT NULL              AND `Enrollment (Ages 5-17)` IS NOT NULL     ) ORDER BY      ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) DESC;	california_schools
SELECT OpenDate FROM schools WHERE `StatusType` = 'Active'   AND `School Type` = 'K-12 Schools (Public)' ORDER BY `Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT `School Name`, `City` FROM `frpm` WHERE `Enrollment (K-12)` IS NOT NULL ORDER BY `Enrollment (K-12)` ASC LIMIT 5;	california_schools
SELECT      `Percent (%) Eligible FRPM (K-12)` AS EligibleFreeRate FROM      `frpm` ORDER BY      `Enrollment (K-12)` DESC LIMIT 10;	california_schools
SELECT      `School Name`,      `FRPM Count (K-12)` / `Enrollment (K-12)` AS EligibleFreeMealRate FROM      `frpm` WHERE      `School Type` = 'Traditional'      AND `Educational Option Type` = 'K-12 Schools (Public)'      AND `2013-14 CALPADS Fall 1 Certification Status` = 1     AND `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `DOC` = '66') ORDER BY      `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.School, s.Website FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.FreeMealCount_Ages_5_17 BETWEEN 1900 AND 2000;	california_schools
SELECT      frpm.CDSCode,      frpm.County Name,      frpm.District Name,      frpm.School Name,      (frpm.Free Meal Count (Ages 5-17) / frpm.Enrollment (Ages 5-17)) * 100 AS FreeRate FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.AdmLName1 = 'Gibson' AND     frpm.Academic Year = (SELECT MAX(Academic Year) FROM frpm);	california_schools
SELECT `schools.AdmEmail1` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `frpm.`Charter School (Y/N)` = 1 AND `frpm.`Enrollment (K-12)` = (SELECT MIN(`Enrollment (K-12)`) FROM `frpm` WHERE `frpm.`Charter School (Y/N)` = 1) AND `schools.CDSCode` IN (SELECT `CDSCode` FROM `frpm` WHERE `frpm.`Low Grade` <= '12' AND `frpm.`High Grade` >= '1');	california_schools
SELECT      s.AdmFName1,      s.AdmLName1,      s.AdmFName2,      s.AdmLName2,      s.AdmFName3,      s.AdmLName3  FROM      schools s  JOIN      satscores sc ON s.CDSCode = sc.cds  WHERE      sc.NumGE1500 IS NOT NULL      AND sc.NumGE1500 > 0      AND (s.AdmFName1 IS NOT NULL OR s.AdmLName1 IS NOT NULL OR           s.AdmFName2 IS NOT NULL OR s.AdmLName2 IS NOT NULL OR           s.AdmFName3 IS NOT NULL OR s.AdmLName3 IS NOT NULL) ORDER BY      sc.NumGE1500 DESC  LIMIT 1;	california_schools
SELECT      s.Street,      s.City,      s.Zip,      s.State  FROM      schools s  JOIN      satscores sc ON s.CDSCode = sc.cds  WHERE      (sc.NumGE1500 / sc.NumTstTakr) = (SELECT MIN((NumGE1500 / NumTstTakr)) FROM satscores WHERE NumTstTakr > 0)	california_schools
SELECT `schools`.`Website` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `schools`.`County` = 'Los Angeles' AND `satscores`.`NumTstTakr` BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(`NumTstTakr`) AS avg_test_takers FROM `satscores` JOIN `schools` ON `satscores`.`cds` = `schools`.`CDSCode` WHERE YEAR(`schools`.`OpenDate`) = 1980;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.District = 'Fresno Unified' ORDER BY sc.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' AND s.County IN (     SELECT County     FROM satscores     GROUP BY County     ORDER BY AVG(AvgScrRead) DESC     LIMIT 5 ) ORDER BY ss.AvgScrRead DESC LIMIT 5;	california_schools
SELECT      s.`EdOpsCode`,      s.`EdOpsName` FROM      satscores AS sc JOIN      schools AS s ON sc.cds = s.CDSCode WHERE      sc.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT      s.County,      AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AvgAllScores FROM      satscores AS sc JOIN      schools AS s ON sc.cds = s.CDSCode WHERE      s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite = (         SELECT              MIN(AvgScrMath + AvgScrRead + AvgScrWrite)          FROM              satscores AS sc2          JOIN              schools AS s2 ON sc2.cds = s2.CDSCode     ) GROUP BY      s.County;	california_schools
SELECT      s.City,      AVG(s.AvgScrWrite) AS AvgWritingScore FROM      satscores s JOIN      schools sch ON s.cds = sch.CDSCode WHERE      s.NumGE1500 IS NOT NULL GROUP BY      s.City ORDER BY      SUM(s.NumGE1500) DESC LIMIT 1;	california_schools
SELECT s.School, AVG(s.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN (     SELECT AdmLName1     FROM schools     WHERE AdmLName1 = 'Ulrich' ) AS adm ON s.AdmLName1 = adm.AdmLName1 GROUP BY s.School;	california_schools
SELECT `schools`.`State`, SUM(`frpm`.`Enrollment (K-12)`) AS TotalEnrollment FROM `schools` JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode` WHERE `schools`.`DOC` = 31 GROUP BY `schools`.`State` ORDER BY TotalEnrollment DESC LIMIT 1;	california_schools
SELECT      COUNT(CASE WHEN Year(`OpenDate`) = 1980 THEN 1 END) / 12 AS MonthlyAvgOpenings FROM      schools WHERE      `DOC` = '52' AND      `OpenDate` BETWEEN '1980-01-01' AND '1980-12-31';	california_schools
SELECT      SUM(CASE WHEN `DOC` = '54' THEN 1 ELSE 0 END) /      SUM(CASE WHEN `DOC` = '52' THEN 1 ELSE 0 END) AS Ratio_MergedUSD_to_MergedESD FROM      schools WHERE      `DOC` IN ('54', '52');	california_schools
SELECT      s.County,      s.School,      s.ClosedDate FROM      schools s WHERE      s.StatusType = 'Closed' GROUP BY      s.County ORDER BY      COUNT(*) DESC LIMIT 1;	california_schools
SELECT `schools`.`Street`, `schools`.`School` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `satscores`.`AvgScrMath` IS NOT NULL ORDER BY `satscores`.`AvgScrMath` DESC LIMIT 1 OFFSET 6;	california_schools
SELECT s.MailStreet, s.MailCity, s.State, s.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrRead IS NOT NULL AND sc.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL);	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.MailCity = 'Lakeport' AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500;	california_schools
SELECT SUM(NumTstTakr) AS TotalTestTakers FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.City = 'Fresno';	california_schools
SELECT      s.CDSCode,      s.Zip AS MailingZipCode FROM      schools s JOIN      (         SELECT              AdmFName1, AdmLName1         FROM              schools         WHERE              AdmLName1 = 'Atoian' AND AdmFName1 = 'Avetik'     ) a ON s.AdmFName1 = a.AdmFName1 AND s.AdmLName1 = a.AdmLName1;	california_schools
SELECT      (COUNT(CASE WHEN `schools.County` = 'Colusa' THEN 1 END) * 1.0) /      COUNT(CASE WHEN `schools.County` = 'Humboldt' THEN 1 END) AS Ratio FROM      `schools` WHERE      `schools.State` = 'CA';	california_schools
SELECT COUNT(*) FROM schools WHERE `State` = 'CA' AND `City` = 'San Joaquin' AND `StatusType` = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrWrite IS NOT NULL ORDER BY ss.AvgScrWrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT `schools`.`School`, `schools`.`Phone`, `schools`.`Ext` FROM `schools` WHERE `schools`.`Zip` = '95203-3704';	california_schools
SELECT s.Website  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE (s.AdmFName1 = 'Mike Larson' OR s.AdmFName2 = 'Mike Larson' OR s.AdmFName3 = 'Mike Larson'         OR s.AdmLName1 = 'Mike Larson' OR s.AdmLName2 = 'Mike Larson' OR s.AdmLName3 = 'Mike Larson'         OR s.AdmFName1 = 'Dante Alvarez' OR s.AdmFName2 = 'Dante Alvarez' OR s.AdmFName3 = 'Dante Alvarez'         OR s.AdmLName1 = 'Dante Alvarez' OR s.AdmLName2 = 'Dante Alvarez' OR s.AdmLName3 = 'Dante Alvarez');	california_schools
SELECT Website  FROM schools  WHERE County = 'San Joaquin'  AND Charter = 1  AND Virtual = 'P';	california_schools
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND DOC = '52' AND City = 'Hickman';	california_schools
SELECT COUNT(*)  FROM frpm  WHERE County = 'Los Angeles'  AND `Charter` = 0  AND `Percent (%) Eligible Free (K-12)` < 0.18;	california_schools
SELECT s.School, s.City, a.AdmFName1, a.AdmLName1, a.AdmFName2, a.AdmLName2, a.AdmFName3, a.AdmLName3 FROM schools s JOIN (     SELECT CDSCode, AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3     FROM schools     WHERE Charter = 1 AND CharterNum = '00D2' ) a ON s.CDSCode = a.CDSCode;	california_schools
SELECT COUNT(*) FROM schools WHERE `CharterNum` = '00D4' AND `MailCity` = 'Hickman';	california_schools
SELECT      ROUND(         (COUNT(CASE WHEN frpm.CharterFundingType = 'Locally funded' THEN 1 END) * 100.0) /          COUNT(*),          2     ) AS Percentage_Locally_Funded_Charter_Schools FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.County = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools WHERE `FundingType` = 'Directly funded' AND `OpenDate` BETWEEN '2000-01-01' AND '2005-12-31' AND `County` = 'Stanislaus';	california_schools
SELECT      SUM(CASE WHEN `ClosedDate` = '1989-12-31' AND `City` = 'San Francisco' AND `StatusType` = 'Closed' THEN 1 ELSE 0 END) AS TotalClosedCommunityColleges FROM      `schools` WHERE      `DOC` = 'CC' AND `StatusType` = 'Closed';	california_schools
SELECT `County` FROM `schools` WHERE `SOC` = '11' AND YEAR(`OpenDate`) BETWEEN 1980 AND 1989 GROUP BY `County` ORDER BY COUNT(`CDSCode`) DESC LIMIT 1;	california_schools
SELECT `NCESDist` FROM `schools` WHERE `SOC` = '31';	california_schools
SELECT      COUNT(CASE WHEN `StatusType` = 'Active' THEN 1 END) AS ActiveCount,     COUNT(CASE WHEN `StatusType` = 'Closed' THEN 1 END) AS ClosedCount FROM      `schools` WHERE      `County` = 'Alpine' AND      `School` LIKE '%Community Day School%';	california_schools
SELECT `District` FROM `schools` WHERE `City` = 'Fresno' AND `Magnet` = 0;	california_schools
SELECT `Enrollment (Ages 5-17)` FROM `frpm` WHERE `Academic Year` = '2014-2015' AND `EdOpsCode` = 'SSS' AND `School Name` LIKE '%Fremont%';	california_schools
SELECT      `frpm`.`Free Meal Count (Ages 5-17)`  FROM      `frpm`  INNER JOIN      `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`  WHERE      `schools`.`School` = 'Youth Authority School'      AND `schools`.`MailStreet` LIKE 'PO Box 1040';	california_schools
SELECT MIN(`Low Grade`) AS LowestGrade FROM `frpm` WHERE `Educational Option Type` = 'SPECON' AND `SOC` = '0613360';	california_schools
SELECT `frpm`.`School Name`, `schools`.`EdOpsName` FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `frpm`.`Educational Option Type` = 'Breakfast Provision 2' AND `schools`.`County` = '37';	california_schools
SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.EILCode = 'HS' AND f.`Educational Option Type` = 'Lunch Provision 2' AND f.Low Grade = '9' AND f.High Grade = '12' AND s.County = 'Merced';	california_schools
SELECT      frpm.School Name,      frpm.`Percent (%) Eligible FRPM (Ages 5-17)` FROM      frpm INNER JOIN      schools  ON      frpm.CDSCode = schools.CDSCode WHERE      schools.County = 'Los Angeles'      AND frpm.Low Grade = 'K'      AND frpm.High Grade = '9';	california_schools
SELECT `GSoffered` AS GradeSpan, COUNT(`GSoffered`) AS Count FROM `schools` WHERE `City` = 'Adelanto' GROUP BY `GSoffered` ORDER BY Count DESC LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS NumberOfSchools FROM      schools WHERE      Virtual = 'F'      AND County BETWEEN 'San Diego' AND 'Santa Barbara' GROUP BY      County ORDER BY      NumberOfSchools DESC LIMIT 1;	california_schools
SELECT `School Name`, `Latitude` FROM `schools` WHERE `Latitude` = (     SELECT MAX(`Latitude`)     FROM `schools` )	california_schools
SELECT      s.City,      s.School,      frpm.Low_Grade  FROM      schools s  JOIN      frpm ON s.CDSCode = frpm.CDSCode  WHERE      s.State = 'CA'  ORDER BY      s.Latitude  LIMIT 1;	california_schools
SELECT      `schools.CDSCode`,      `schools.GSoffered`,      `schools.GSserved` FROM      `schools` WHERE      `schools.Longitude` = (SELECT MAX(ABS(`schools.Longitude`)) FROM `schools`)	california_schools
SELECT      s.City,      COUNT(DISTINCT s.CDSCode) AS NumberOfSchools FROM      schools AS s JOIN      frpm AS f ON s.CDSCode = f.CDSCode WHERE      s.Magnet = 1 AND      f.Low_Grade = 'K' AND f.High_Grade = '8' AND      f.NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY      s.City;	california_schools
SELECT      AdmFName1,      COUNT(AdmFName1) AS Count,      District  FROM      schools  GROUP BY      AdmFName1, District  ORDER BY      Count DESC,      District  LIMIT 2;	california_schools
SELECT      frpm.County_Code,      frpm.District_Code,      frpm.`Percent (%) Eligible Free (K-12)` FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.AdmFName1 = 'Alusine'	california_schools
SELECT      s.LastUpdate,     s.District,     s.County,     s.School,     a.AdmLName1 FROM      schools s JOIN      schools a ON s.CDSCode = a.CDSCode WHERE      s.CharterNum = '40'	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino'    AND District = 'San Bernardino City Unified'    AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'    AND (DOC = 54 OR SOC = 62)   AND StatusType = 'Active';	california_schools
SELECT      s.AdmEmail1 FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.NumGE1500 IS NOT NULL AND sc.NumGE1500 > 0 ORDER BY      sc.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN card c ON a.account_id = c.card_id WHERE d.A3 = 'East Bohemia' AND c.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = a.account_id );	financial
SELECT      CASE          WHEN AVG(`A12`) > AVG(`A13`) THEN '1995'         ELSE '1996'     END AS higher_unemployment_year,     AVG(`A12`) AS avg_unemployment_1995,     AVG(`A13`) AS avg_unemployment_1996 FROM `district`;	financial
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND A7 = 'F';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;	financial
SELECT      a.account_id,     c.gender,     d.A11 AS average_salary FROM      account a JOIN      disp d ON a.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.gender = 'F' ORDER BY      c.birth_date DESC, d.A11 LIMIT 1;	financial
SELECT c.client_id FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.district_id = a.district_id JOIN (     SELECT district_id, AVG(A11) AS avg_salary     FROM district     GROUP BY district_id ) avg_salary ON d.district_id = avg_salary.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE district_id = c.district_id ) ORDER BY avg_salary DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE YEAR(l.date) = 1997 AND l.status = 'A' AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT account.account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND YEAR(account.date) = 1993 ORDER BY loan.amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov';	financial
SELECT account_id FROM account WHERE date LIKE '1995%' ORDER BY date ASC LIMIT 1;	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000 GROUP BY a.account_id;	financial
SELECT c.client_id FROM client c JOIN card cd ON c.client_id = cd.disp_id JOIN disp d ON c.client_id = d.client_id WHERE cd.issued = '1994-03-03';	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14' AND t.type = 'PRIJEM';	financial
SELECT d.district_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.date = '1994-08-25' AND d.type = 'OWNER';	financial
SELECT MAX(amount) AS max_transaction_amount FROM trans JOIN card ON trans.account_id = card.card_id JOIN disp ON trans.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.birth_date = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.district_id = a.district_id JOIN disp d1 ON a.account_id = d1.account_id JOIN (     SELECT district_id, AVG(A11) AS avg_salary     FROM district     GROUP BY district_id     ORDER BY avg_salary DESC     LIMIT 1 ) d_avg ON c.district_id = d_avg.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     JOIN district d2 ON client.district_id = d2.district_id     WHERE d2.A11 = d_avg.avg_salary )	financial
SELECT      c.client_id,      t.amount AS first_transaction_amount FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id JOIN      loan l ON a.account_id = l.account_id JOIN      trans t ON a.account_id = t.account_id WHERE      l.amount = (SELECT MAX(amount) FROM loan) ORDER BY      t.date ASC LIMIT 1;	financial
SELECT COUNT(c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT d.disp_id FROM `disp` d JOIN `client` c ON d.client_id = c.client_id JOIN `account` a ON d.account_id = a.account_id JOIN `order` o ON a.account_id = o.account_id WHERE o.amount = 5100 AND o.date = '1998-09-02' AND c.gender = 'M';	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND YEAR(account.date) = 1996;	financial
SELECT d.A2 AS district_name FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN client c ON a.district_id = c.district_id WHERE d.A3 = 'Prague' ORDER BY c.birth_date ASC LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0 / COUNT(c.gender)) AS male_client_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'South Bohemia' ORDER BY      d.A9 DESC LIMIT 1;	financial
SELECT      (MAX(trans.balance) - MIN(trans.balance)) / MIN(trans.balance) * 100 AS increase_rate FROM      trans JOIN      account ON trans.account_id = account.account_id WHERE      account.date BETWEEN '1993-03-22' AND '1998-12-27'     AND trans.date = (SELECT MIN(date) FROM loan WHERE date BETWEEN '1993-01-01' AND '1993-12-31' AND status = 'A')     AND trans.account_id IN (         SELECT account_id FROM loan         WHERE date BETWEEN '1993-01-01' AND '1993-12-31'         AND status = 'A'         ORDER BY date ASC         LIMIT 1     )	financial
SELECT      (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100 AS percentage_paid_loans FROM      loan l;	financial
SELECT      ROUND(         (COUNT(CASE WHEN l.amount < 100000 THEN 1 END) * 100.0) / COUNT(*),         2     ) AS percentage_running_no_issue FROM      loan l WHERE      l.status = 'C';	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT      d.account_id,      a.frequency FROM      disp d JOIN      account a ON d.account_id = a.account_id JOIN      client c ON d.client_id = c.client_id JOIN      district dt ON c.district_id = dt.district_id WHERE      dt.A2 = 'Hl.m. Praha' AND     a.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3, d.A11 FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT d.A2 AS district, (d.A13 - d.A12) / d.A12 * 100 AS unemployment_rate_increment FROM district d JOIN loan l ON d.district_id = (SELECT district_id FROM account a JOIN disp p ON a.account_id = p.account_id WHERE l.account_id = a.account_id) WHERE l.status = 'D' AND d.A12 IS NOT NULL AND d.A13 IS NOT NULL AND YEAR(l.date) = 1995;	financial
SELECT     (COUNT(*) FILTER (WHERE d.A2 = 'Decin' AND a.date BETWEEN '1993-01-01' AND '1993-12-31')) * 100.0 / COUNT(*) FROM     account a JOIN     district d ON a.district_id = d.district_id;	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE' GROUP BY account_id HAVING COUNT(*) > 1;	financial
SELECT      d.A2 AS District,      COUNT(c.client_id) AS FemaleAccountHolders FROM      district d JOIN      client c ON d.district_id = c.district_id WHERE      c.gender = 'F' GROUP BY      d.district_id, d.A2 ORDER BY      FemaleAccountHolders DESC LIMIT 9;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' AND NOT EXISTS (     SELECT 1     FROM card c     JOIN disp d ON c.card_id = d.disp_id     JOIN account ac ON d.account_id = ac.account_id     WHERE ac.account_id = a.account_id ) GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'South Bohemia' AND c.client_id NOT IN (     SELECT DISTINCT d.client_id     FROM disp d     JOIN card crd ON d.client_id = crd.disp_id     WHERE crd.type = 'gold' OR crd.type = 'classic' OR crd.type = 'junior' );	financial
SELECT d.A2 AS district_name, COUNT(l.loan_id) AS active_loan_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A2 ORDER BY active_loan_count DESC LIMIT 1;	financial
SELECT AVG(amount) AS average_loan_amount FROM loan JOIN client ON loan.account_id = client.client_id WHERE client.gender = 'M';	financial
SELECT      `district`.A2 AS branch_location,      `district`.A13 AS district_name FROM      `district` WHERE      `district`.A13 = (SELECT MAX(`district`.A13) FROM `district` WHERE `district`.A4 = '1996');	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1996 GROUP BY d.district_id ORDER BY SUM(CASE WHEN d.A16 IS NOT NULL THEN d.A16 ELSE 0 END) DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT account.account_id) FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.operation = 'VYBER KARTOU' AND account.frequency = 'POPLATEK MESICNE' AND trans.balance < 0;	financial
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.amount >= 250000 AND a.frequency = 'POPLATEK MESICNE' AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.status = 'A';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN disp d ON a.account_id = d.account_id JOIN district dt ON a.district_id = dt.district_id WHERE dt.A2 = 'Hl.m. Praha' AND l.status IN ('C', 'D');	financial
SELECT COUNT(c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M'  AND d.A15 = (     SELECT MAX(d2.A15)      FROM district d2      WHERE d2.A15 < (SELECT MAX(d3.A15) FROM district d3) );	financial
SELECT COUNT(DISTINCT c.card_id) FROM card c JOIN disp d ON c.card_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek');	financial
SELECT d.A2, SUM(t.amount) AS total_amount FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE YEAR(t.date) = 1997 AND t.amount > 10000 GROUP BY d.A2 HAVING total_amount > 10000;	financial
SELECT DISTINCT a.account_id FROM account a JOIN order o ON a.account_id = o.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek' AND o.k_symbol = 'SIPO';	financial
SELECT a.account_id FROM account a JOIN card c ON a.account_id = c.card_id WHERE c.type = 'gold';	financial
SELECT AVG(amount) AS average_credit_card_amount FROM trans WHERE operation = 'VYBER KARTOU' AND YEAR(date) = 2021;	financial
SELECT DISTINCT t.account_id FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.date BETWEEN '1998-01-01' AND '1998-12-31' AND t.operation = 'VYBER KARTOU' AND t.amount < (     SELECT AVG(amount)     FROM trans     WHERE date BETWEEN '1998-01-01' AND '1998-12-31'     AND operation = 'VYBER KARTOU' )	financial
SELECT DISTINCT c.client_id, c.gender FROM client c JOIN account a ON c.district_id = a.district_id JOIN disp d ON a.account_id = d.account_id JOIN card cr ON d.disp_id = cr.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND cr.type = 'gold';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 LIKE '%South Bohemia%';	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON a.district_id = dt.district_id WHERE dt.A2 = 'Tabor' AND d.type = 'OWNER';	financial
SELECT account.account_id, account.frequency FROM account JOIN district ON account.district_id = district.district_id WHERE district.A11 BETWEEN 8000 AND 9000 AND account.account_id NOT IN (     SELECT account_id     FROM disp     WHERE type = 'OWNER' );	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dt ON c.district_id = dt.district_id JOIN trans t ON a.account_id = t.account_id WHERE dt.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 FROM account a JOIN trans t ON a.account_id = t.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) AS average_crimes FROM `district` WHERE A15 > 4000 AND EXISTS (     SELECT 1     FROM `account`     WHERE `account`.district_id = `district`.district_id     AND YEAR(`account`.date) >= 1997 )	financial
SELECT COUNT(*) FROM `card` JOIN `disp` ON `card.disp_id` = `disp.disp_id` JOIN `account` ON `disp.account_id` = `account.account_id` WHERE `card.type` = 'classic' AND `disp.type` = 'OWNER';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT     (SUM(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 ELSE 0 END) * 100.0) / COUNT(c.card_id) AS gold_card_percentage FROM card c;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' ORDER BY l.amount DESC LIMIT 1;	financial
SELECT      d.A15 AS crime_count FROM      district d JOIN      account a ON d.district_id = a.district_id JOIN      disp disp ON a.account_id = disp.account_id JOIN      loan l ON disp.account_id = l.account_id WHERE      l.date BETWEEN '1995-01-01' AND '1995-12-31' AND     a.account_id = 532;	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT t.date, t.amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND account_id IN (     SELECT account_id     FROM loan     WHERE amount < 200000 );	financial
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 13539;	financial
SELECT `district`.A3 AS region FROM `client` JOIN `district` ON `client`.district_id = `district`.district_id WHERE `client`.client_id = 3541;	financial
SELECT d.A2, COUNT(a.account_id) AS account_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY account_count DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT trans.trans_id, trans.date, trans.amount, trans.type, trans.operation FROM trans JOIN account ON trans.account_id = account.account_id JOIN client ON account.district_id = client.district_id JOIN district ON client.district_id = district.district_id WHERE district.district_id = 5;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik';	financial
SELECT c.client_id FROM client c JOIN card crd ON c.client_id = crd.disp_id WHERE crd.type = 'junior' AND crd.issued >= '1997-01-01';	financial
SELECT      ROUND(         (SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) * 100.0) /          COUNT(*),         2     ) AS percentage_female FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A11 > 10000	financial
SELECT     (SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) -       SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) /       SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END) * 100 AS growth_rate FROM     loan l JOIN     client c ON l.account_id IN (SELECT account_id FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Benesov')) WHERE     c.gender = 'M';	financial
SELECT COUNT(*) FROM `trans` WHERE `type` = 'VYBER' AND `operation` = 'VYBER KARTOU' AND `date` > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN T1.A3 = 'North Bohemia' AND T1.A16 IS NOT NULL THEN T1.A16 ELSE 0 END) -      SUM(CASE WHEN T1.A3 = 'East Bohemia' AND T1.A16 IS NOT NULL THEN T1.A16 ELSE 0 END)) AS crime_difference FROM      district AS T1 WHERE      T1.A3 IN ('East Bohemia', 'North Bohemia') AND     T1.A4 = '1996';	financial
SELECT      SUM(CASE WHEN d.type = 'OWNER' THEN 1 ELSE 0 END) AS owners,     SUM(CASE WHEN d.type = 'DISPONENT' THEN 1 ELSE 0 END) AS disponents FROM      disp d JOIN      account a ON d.account_id = a.account_id WHERE      a.account_id BETWEEN 1 AND 10;	financial
-- Query to determine how often account number 3 requests an account statement SELECT COUNT(*) as statement_requests FROM `account` WHERE `account_id` = 3 AND `frequency` = 'POPLATEK MESICNE';  -- Query to find the total amount debited for k_symbol '3539' SELECT SUM(`amount`) as total_debited FROM `trans` WHERE `operation` = 'DEBIT' AND `k_symbol` = '3539';	financial
SELECT YEAR(birth_date) AS birth_year FROM client WHERE client_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT     SUM(l.amount) AS total_debt,     COUNT(CASE WHEN l.status = 'A' THEN 1 END) AS payments_paid,     COUNT(*) AS total_payments FROM     loan l WHERE     l.account_id IN (         SELECT             d.account_id         FROM             disp d         JOIN             client c ON d.client_id = c.client_id         WHERE             c.client_id = 992     );	financial
SELECT SUM(t.amount) AS total_sum, c.gender FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `disp` d ON a.account_id = d.account_id JOIN `client` c ON d.client_id = c.client_id WHERE t.trans_id = 851 AND c.client_id = 4 GROUP BY c.gender;	financial
SELECT c.type FROM `card` c JOIN `disp` d ON c.card_id = d.card_id JOIN `client` cl ON d.client_id = cl.client_id WHERE cl.client_id = 9;	financial
SELECT SUM(`amount`) AS total_paid FROM `trans` WHERE `account_id` IN (     SELECT `account_id`     FROM `disp`     WHERE `client_id` = 617 ) AND `date` BETWEEN '1998-01-01' AND '1998-12-31';	financial
SELECT client.client_id FROM client JOIN district ON client.district_id = district.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.A2 = 'Hl.m. Pardubice';	financial
SELECT client_id FROM client WHERE gender = 'F' AND client_id IN (     SELECT client_id     FROM loan     ORDER BY amount DESC     LIMIT 3 );	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN order o ON a.account_id = o.account_id WHERE c.gender = 'M'    AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'    AND o.k_symbol = 'SIPO'    AND o.amount > 4000;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND account.date > '1996-12-31';	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.client_id = cr.disp_id WHERE c.gender = 'F' AND cr.type = 'junior';	financial
SELECT     (SELECT COUNT(*)       FROM client c      JOIN account a ON c.district_id = a.district_id      JOIN district d ON a.district_id = d.district_id      WHERE d.A3 = 'Prague' AND c.gender = 'F') * 100.0 /     (SELECT COUNT(*)       FROM client c      JOIN account a ON c.district_id = a.district_id      JOIN district d ON a.district_id = d.district_id      WHERE d.A3 = 'Prague') AS percentage_female_in_prague	financial
SELECT     (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN 1 END) AS male_clients_weekly_statement_percentage FROM     account a JOIN     disp d ON a.account_id = d.account_id JOIN     client c ON d.client_id = c.client_id WHERE     a.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN client c ON d.client_id = c.client_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, d.A11 ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND d.A3 = 'east Bohemia';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24;	financial
SELECT      T.date AS transaction_date,     AVG(L.amount) AS average_loan_amount FROM      `trans` T JOIN      `loan` L ON T.account_id = L.account_id WHERE      L.status IN ('C', 'D') AND      T.`frequency` = 'POPLATEK PO OBRATU' GROUP BY      T.date;	financial
SELECT c.client_id, d.A2 AS district FROM client c JOIN disp d ON c.district_id = d.client_id WHERE d.type = 'OWNER'	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id WHERE crd.type = 'gold' AND d.type = 'OWNER' AND EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = c.district_id );	financial
SELECT `bond_type`, COUNT(`bond_type`) AS bond_count FROM `bond` GROUP BY `bond_type` ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) as avg_oxygen_atoms FROM atom a JOIN bond b ON a.atom_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS average_single_bonded FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.molecule_id;	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.label = '-';	toxicology
SELECT c.molecule_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE      a.element = 'c'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT m.label, COUNT(a.atom_id) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY count DESC LIMIT 1;	toxicology
SELECT bond.bond_type FROM atom JOIN bond ON atom.atom_id = bond.bond_id WHERE atom.element = 'cl';	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN connected c2 ON c1.atom_id2 = c2.atom_id JOIN molecule m ON c2.atom_id2 = m.molecule_id WHERE m.label = '-';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.element ORDER BY COUNT(a.element) ASC LIMIT 1;	toxicology
SELECT bond_type  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20')  OR (connected.atom_id = 'TR004_20' AND connected.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element <> 'sn' ) AND m.label IN ('+', '-');	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#' JOIN connected c2 ON a1.atom_id = c2.atom_id2 JOIN bond b2 ON c2.bond_id = b2.bond_id WHERE b2.bond_type = '#' JOIN connected c3 ON a1.atom_id = c3.atom_id2 JOIN bond b3 ON c3.bond_id = b3.bond_id WHERE b3.bond_type = '#';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.molecule_id = 'TR181' OR c.atom_id = 'TR181' OR c.atom_id2 = 'TR181';	toxicology
SELECT      (SELECT COUNT(DISTINCT a.atom_id)       FROM atom a       JOIN molecule m ON a.molecule_id = m.molecule_id       WHERE m.label = '+' AND a.element = 'f') /      (SELECT COUNT(DISTINCT a.atom_id)       FROM atom a       JOIN molecule m ON a.molecule_id = m.molecule_id       WHERE m.label = '+') * 100 AS percentage_not_containing_fluorine;	toxicology
SELECT      DIVIDE(SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100, COUNT(bond.bond_id)) AS percent FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.label = '+' AND bond.bond_type = '#';	toxicology
SELECT `element` FROM `atom` WHERE `molecule_id` = 'TR000' GROUP BY `element` ORDER BY COUNT(*) DESC, `element` LIMIT 3;	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001';	toxicology
SELECT      (SELECT COUNT(*) FROM molecule WHERE label = '+') -      (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;	toxicology
SELECT a1.atom_id, a2.atom_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR000_2_5';	toxicology
SELECT c.bond_id FROM connected c WHERE c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id, m.label ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT      ROUND((SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) / COUNT(bond_id)) * 100, 5) AS percent FROM      bond WHERE      molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(CASE WHEN t1.label = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(t1.molecule_id), 3) AS percent FROM `molecule` t1;	toxicology
SELECT ROUND(DIVIDE(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END), COUNT(a.atom_id)) * 100, 4) AS percent_hydrogen FROM atom a WHERE a.molecule_id = 'TR206';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';	toxicology
SELECT bond_type, COUNT(*) AS bond_count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT molecule_id FROM atom a JOIN bond b ON a.atom_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY a.molecule_id ORDER BY molecule_id LIMIT 3;	toxicology
SELECT bond_id, bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT b.bond_type, a1.atom_id, a2.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT m.label, m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT c.molecule_id) FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(DISTINCT `bond_id`) AS connection_count FROM `connected` WHERE `atom_id` = 'TR%_19' OR `atom_id2` = 'TR%_19';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id AND b.bond_id = a1.atom_id JOIN atom a2 ON b.molecule_id = a2.molecule_id AND b.bond_id = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id HAVING m.label = '+' ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(b.bond_id) OVER (PARTITION BY a.atom_id)) / COUNT(a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'i';	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE atom.atom_id = 'TR000_45' OR atom.atom_id = CONCAT(SUBSTR(atom.atom_id, 1, 6), '45') AND bond.bond_type IN ('-', '=', '#');	toxicology
SELECT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id IS NULL;	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN bond b ON a1.atom_id = b.atom_id OR a1.atom_id = b.atom_id2 JOIN connected c ON b.bond_id = c.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#' AND c.atom_id = (SELECT atom_id FROM connected WHERE bond_id = (SELECT bond_id FROM bond WHERE bond_type = '#' AND molecule_id = 'TR041')) AND c.atom_id2 = (SELECT atom_id FROM connected WHERE bond_id = (SELECT bond_id FROM bond WHERE bond_type = '#' AND molecule_id = 'TR041')) AND a1.molecule_id = 'TR041' AND a2.molecule_id = 'TR041';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT      m.molecule_id,      COUNT(b.bond_type = '=') AS double_bond_count FROM      molecule m JOIN      bond b ON m.molecule_id = b.molecule_id WHERE      m.label = '+' AND b.bond_type = '=' GROUP BY      m.molecule_id ORDER BY      double_bond_count DESC LIMIT 1;	toxicology
SELECT element, COUNT(*) as frequency FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY frequency LIMIT 1;	toxicology
SELECT DISTINCT c.atom_id2 AS bondable_atom FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'pb';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.atom_id = b.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT      (COUNT(bond_id) /       (SELECT COUNT(DISTINCT atom_id)        FROM atom        WHERE atom_id IN (SELECT atom_id                         FROM connected                         WHERE bond_id IN (SELECT bond_id                                          FROM bond                                          WHERE bond_type =                                          (SELECT bond_type                                           FROM bond                                           GROUP BY bond_type                                           ORDER BY COUNT(bond_id) DESC                                           LIMIT 1))))     ) * 100 AS percentage_of_most_common_bond_combination FROM      bond;	toxicology
SELECT      ROUND((SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100) / COUNT(b.bond_id), 5) AS single_bond_carcinogenic_proportion FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_atoms FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element IN ('c', 'h');	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id OR a1.atom_id = c.atom_id2 JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 's';	toxicology
SELECT bond.bond_type FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN bond b ON a.atom_id = b.bond_id  JOIN connected c ON b.bond_id = c.bond_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE b.bond_type = '-' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'  AND (a.element = 'p' OR a.element = 'br') AND a.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '-' JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id) AS percent FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '-' WHERE      a.element = 'cl';	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` BETWEEN 'TR000' AND 'TR030' AND `label` = '+';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT bond.bond_id) FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'i';	toxicology
SELECT      COUNT(*) AS total钙元素分子,     SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS 癌症分子数,     SUM(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) AS 非癌症分子数 FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.element = 'ca';	toxicology
SELECT EXISTS (   SELECT 1   FROM atom a1   JOIN connected c ON a1.atom_id = c.atom_id   JOIN bond b ON c.bond_id = b.bond_id   WHERE a1.element = 'cl'   AND a1.atom_id = 'TR001_1'   AND EXISTS (     SELECT 1     FROM atom a2     JOIN connected c2 ON a2.atom_id = c2.atom_id     JOIN bond b2 ON c2.bond_id = b2.bond_id     WHERE a2.element = 'c'     AND b2.bond_id = b.bond_id   ) ) AND EXISTS (   SELECT 1   FROM atom a3   JOIN connected c3 ON a3.atom_id = c3.atom_id   JOIN bond b3 ON c3.bond_id = b3.bond_id   WHERE a3.element = 'c'   AND a3.atom_id = 'TR001_1'   AND EXISTS (     SELECT 1     FROM atom a4     JOIN connected c4 ON a4.atom_id = c4.atom_id     JOIN bond b4 ON c4.bond_id = b4.bond_id     WHERE a4.element = 'cl'     AND b4.bond_id = b3.bond_id   )	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN bond b ON a.atom_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.molecule_id) AS percentage_of_cl FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+'	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001' AND a.element IS NOT NULL;	toxicology
SELECT bond.molecule_id FROM bond WHERE bond.bond_type = '=';	toxicology
SELECT DISTINCT a1.atom_id AS first_atom_id, a2.atom_id AS second_atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#' AND a1.atom_id < a2.atom_id;	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(*) FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '+';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      a.element  FROM      atom a  JOIN      molecule m ON a.molecule_id = m.molecule_id  WHERE      m.label = '+'      AND SUBSTR(a.atom_id, 7, 1) = '4'	toxicology
SELECT      m.label AS Molecule_Label,      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 1.0) / COUNT(a.atom_id) AS Hydrogen_Ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' GROUP BY      m.label;	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'c';	toxicology
SELECT a.element AS Element1, a2.element AS Element2 FROM atom a JOIN atom a2 ON a.atom_id = SUBSTR('TR001_10_11', 7, 2) AND a2.atom_id = SUBSTR('TR001_10_11', 10, 2) WHERE a.molecule_id = SUBSTR('TR001_10_11', 1, 5) AND a2.molecule_id = SUBSTR('TR001_10_11', 1, 5);	toxicology
SELECT      ROUND((COUNT(CASE WHEN bond.bond_type = '#' THEN 1 ELSE NULL END) * 100.0) / COUNT(*), 2) AS triple_bond_percentage FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id;	toxicology
SELECT      COUNT(CASE WHEN b.bond_type = '=' THEN 1 END) * 100.0 / COUNT(b.bond_id) AS percent FROM      bond b JOIN      connected c ON b.bond_id = c.bond_id JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.molecule_id = 'TR047'	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id = 'TR151' AND label = '+';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'i', 'sn', 'pb', 'te');	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  WHERE m.label = '+';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.molecule_id >= 'TR010' AND m.molecule_id <= 'TR050'	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '=';	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' AND molecule.label = '+';	toxicology
SELECT bond.molecule_id  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom AS a1 ON connected.atom_id = a1.atom_id  JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id  WHERE a1.atom_id = 'TR000_1' AND a2.atom_id = 'TR000_2';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '+';	toxicology
SELECT      ROUND(         (SUM(CASE WHEN `molecule_id` IN (SELECT `molecule_id` FROM `atom` WHERE `element` = 'h') AND `label` = '+' THEN 1 ELSE 0 END) /           COUNT(DISTINCT `molecule_id`)) * 100.0,          2     ) AS percentage_carcinogenic_with_hydrogen FROM `molecule`;	toxicology
SELECT EXISTS(     SELECT 1 FROM molecule WHERE molecule_id = 'TR124' AND label = '+' ) AS is_carcinogenic;	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR186';	toxicology
SELECT `bond_type` FROM `bond` WHERE `bond_id` = 'TR007_4_19';	toxicology
SELECT DISTINCT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS double_bonds_count,         CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenicity FROM atom a JOIN bond b ON a.atom_id = b.bond_id OR a.atom_id2 = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR006' AND b.bond_type = '='	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id AND a.atom_id = c.atom_id WHERE b.bond_type = '#' AND a.element IN ('c', 'n', 'o', 's', 'p', 'f', 'cl', 'br', 'i', 'sn', 'pb', 'te', 'ca', 'h') GROUP BY m.molecule_id;	toxicology
SELECT a.element AS AtomElement FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(DISTINCT b.bond_id) FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'cl';	toxicology
SELECT a.atom_id, COUNT(b.bond_type) AS bond_types_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id LEFT JOIN connected c ON a.atom_id = c.atom_id LEFT JOIN bond b ON c.bond_id = b.bond_id WHERE m.label = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id AND a.element = 's' LEFT JOIN bond b ON m.molecule_id = b.molecule_id AND b.bond_type = '=' WHERE a.atom_id IS NULL AND b.bond_id IS NULL;	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      (SUM(CASE WHEN `molecule`.`label` = '+' AND `atom`.`element` = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(`molecule`.`molecule_id`) AS percentage FROM      `molecule` JOIN      `atom` ON `molecule`.`molecule_id` = `atom`.`molecule_id` WHERE      `molecule`.`label` = '+';	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element) AS distinct_elements FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT `bond_type` FROM `connected` JOIN `bond` ON `connected`.`bond_id` = `bond`.`bond_id` WHERE `connected`.`atom_id` = 'TR000_1' AND `connected`.`atom_id2` = 'TR000_2';	toxicology
SELECT m.label AS molecule FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id IN ('TR000_2', 'TR000_4');	toxicology
SELECT `element` FROM `atom` WHERE `atom_id` = 'TR000_1';	toxicology
SELECT m.label AS molecule_label, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR000' GROUP BY m.molecule_id HAVING m.label = '+'	toxicology
SELECT      ROUND(         (SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id),          2     ) AS single_bond_percentage FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id AND a.atom_id = SUBSTRING(b.bond_id, 1, LENGTH(b.bond_id) - 2) WHERE      b.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element = 's' AND b.bond_type = ' = ';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.atom_id IS NOT NULL GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT a.element FROM atom a JOIN bond b ON a.atom_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SELECT COUNT(*) FROM molecule WHERE label = '+') * 100.0 /      (SELECT COUNT(DISTINCT molecule_id) FROM atom WHERE element = 'h' AND bond_id IN          (SELECT bond_id FROM bond WHERE bond_type = '#')     ) AS percentage_carcinogenic_with_triple_bonded_H	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` BETWEEN 'TR004' AND 'TR010' AND EXISTS (     SELECT 1     FROM `bond`     WHERE `bond_type` = '-' AND `molecule_id` = `molecule`.`molecule_id` );	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m JOIN connected c ON m.molecule_id = c.atom_id JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'o' AND b.bond_type = '=';	toxicology
SELECT COUNT(*) FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR002');	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b1 ON c1.bond_id = b1.bond_id JOIN connected c2 ON a1.atom_id = c2.atom_id2 AND c1.bond_id = c2.bond_id JOIN bond b2 ON c2.bond_id = b2.bond_id WHERE a1.element = 'c' AND b1.bond_type = '=' AND b2.bond_type = '=' AND a1.molecule_id = 'TR012';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM `cards` WHERE `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;	card_games
SELECT c.name, c.id FROM cards c WHERE c.borderColor = 'borderless' AND (c.cardKingdomFoilId IS NULL OR c.cardKingdomId IS NULL) AND c.hasFoil = 0;	card_games
SELECT name FROM cards WHERE convertedManaCost < MAX(faceConvertedManaCost);	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT c.uuid, c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type LIKE '%Artifact%' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.id FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel' AND c.hasContentWarning = 1 AND r.text IS NULL;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, COUNT(r.id) AS ruling_count FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.isPromo = 1 GROUP BY c.name, c.artist ORDER BY ruling_count DESC LIMIT 1;	card_games
SELECT `language`, `name`, `number` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.name` = 'Annul' AND `cards.number` = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN t.language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0) / COUNT(t.id) AS percentage_of_chinese_simplified_cards FROM      cards c JOIN      set_translations t ON c.uuid = t.setCode;	card_games
SELECT      s.name,     s.totalSetSize FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT `type`)  FROM `cards`  WHERE `artist` = 'Aaron Boyd';	card_games
SELECT `keywords` FROM `cards` WHERE `name` = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE `power` = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `originalType`  FROM `cards`  WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT t.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations t ON s.code = t.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Cloudchaser Eagle';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT legalities.format, legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Benalish Knight';	card_games
SELECT artist FROM cards WHERE asciiName LIKE '%Phyrexian%';	card_games
SELECT      (COUNT(CASE WHEN `borderColor` = 'borderless' THEN 1 END) * 100.0) / COUNT(`id`) AS borderless_percentage FROM      `cards`;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'borderless' AND EXISTS (     SELECT 1     FROM foreign_data     WHERE cards.uuid = foreign_data.uuid     AND `language` = 'Russian' );	card_games
SELECT      (COUNT(CASE WHEN f.language = 'French' THEN c.id END) * 100.0) / COUNT(c.id) AS percentage_french_story_spotlight_cards FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'black' AND `availability` = 'mtgo';	card_games
SELECT id  FROM cards  WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%';	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.hasFoil = 1 AND c.hasNonFoil = 1 AND l.format = 'commander' AND (c.cardKingdomFoilId IS NOT NULL OR c.cardKingdomId IS NOT NULL);	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT `edhrecRank` FROM `cards` WHERE `frameVersion` = '2015';	card_games
SELECT cards.artist FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.language = 'Chinese Simplified';	card_games
SELECT c.id, c.name, c.asciiName FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability LIKE '%paper%' AND fd.language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT c.uuid, fd.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy';	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) AS total_cards_with_future_frame, GROUP_CONCAT(DISTINCT c.name) AS card_names, l.status AS legality_status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal' GROUP BY c.uuid;	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW';	card_games
SELECT c.name, st.language FROM cards c JOIN set_translations st ON c.scryfallId = st.scryfallId WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT cards.name, rulings.date FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf';	card_games
SELECT `colors`, `format` FROM `cards` WHERE `id` BETWEEN 1 AND 20;	card_games
SELECT c.name, c.colors, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language <> 'English';	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL AND power = '';	card_games
SELECT COUNT(*) FROM cards WHERE `borderColor` = 'white' AND `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON'    AND availability LIKE '%mtgo%'   AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1;	card_games
SELECT `manaCost` FROM `cards` WHERE `layout` = 'normal' AND `frameVersion` = 2003 AND `borderColor` = 'black' AND `availability` = 'mtgo,paper';	card_games
SELECT SUM(COALESCE(CAST(manaCost AS REAL), 0)) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT `type`, `supertypes`, `subtypes` FROM `cards` WHERE `availability` = 'arena' ORDER BY `type`, `supertypes`, `subtypes`;	card_games
SELECT c.setCode FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'Spanish';	card_games
SELECT      (COUNT(CASE WHEN `cards`.frameEffects = 'legendary' AND `cards`.isOnlineOnly = 1 THEN 1 END) * 100.0) /      COUNT(CASE WHEN `cards`.frameEffects = 'legendary' THEN 1 END) AS legendaryOnlinePercentage FROM      `cards` WHERE      `cards`.frameEffects = 'legendary';	card_games
SELECT      (SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) / SUM(COUNT(c.id))) * 100 AS percentage,     c.id FROM      cards c GROUP BY      c.id ORDER BY      percentage DESC;	card_games
SELECT     name,     ROUND((SUM(CASE WHEN f.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(c.id), 2) AS percentage_spanish FROM     cards c LEFT JOIN     foreign_data f ON c.uuid = f.uuid GROUP BY     c.name ORDER BY     percentage_spanish DESC;	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE baseSetSize = 309);	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT id FROM cards WHERE type LIKE '%Creature%' AND id IN (SELECT uuid FROM legalities WHERE status = 'Legal');	card_games
SELECT DISTINCT `cards`.type FROM `cards` JOIN `foreign_data` ON `cards`.uuid = `foreign_data`.uuid WHERE `foreign_data`.language = 'German' AND (`cards`.subtypes IS NOT NULL AND `cards`.supertypes IS NOT NULL);	card_games
SELECT COUNT(*) FROM `cards` WHERE `power` IS NULL OR `power` = '*' AND `text` LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'premodern' AND c.side IS NULL AND EXISTS (     SELECT 1     FROM rulings r     JOIN cards cr ON r.uuid = cr.uuid     WHERE cr.uuid = c.uuid     AND r.text LIKE '%triggered mana ability%' )	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability LIKE '%paper%';	card_games
SELECT `cards.artist` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `foreign_data.text` = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT fd.name AS foreign_name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Matthew D. Wilson' AND fd.language = 'French' AND c.type = 'Creature' AND c.layout = 'normal' AND c.borderColor = 'black';	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id),         2     ) AS percentageWithoutContentWarning FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      l.format = 'commander' AND      l.status = 'Legal';	card_games
SELECT      (COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END AND fd.language = 'French' ELSE NULL END) * 100.0) /      COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END) AS percentage_of_french_cards_without_power FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.power IS NULL OR c.power = '*';	card_games
SELECT      ROUND((COUNT(CASE WHEN sets.type = 'expansion' THEN 1 END) * 100.0) / COUNT(CASE WHEN `set_translations.language` = 'Japanese' THEN 1 END), 2) AS percentage_of_japanese_translated_expansion_sets FROM      sets JOIN      `set_translations` ON sets.code = `set_translations.setCode` WHERE      `set_translations.language` = 'Japanese'	card_games
SELECT availability  FROM cards  WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE `colorIdentity` IS NOT NULL AND `borderColor` = 'borderless' AND `edhrecRank` > 12000;	card_games
SELECT COUNT(*) FROM `cards` WHERE `isOversized` = 1 OR `isReprint` = 1 OR `isPromo` = 1;	card_games
SELECT name FROM cards WHERE power IN (NULL, '*') AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT language  FROM foreign_data  WHERE multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      ROUND((COUNT(CASE WHEN `isTextless` = 1 AND `layout` = 'normal' THEN 1 END) / COUNT(`id`)) * 100, 2) AS proportion_of_textless_normal_layout_cards FROM      `cards`;	card_games
SELECT c.id, c.name FROM cards c WHERE c.otherFaceIds IS NULL AND c.subtypes LIKE '%Angel%' AND c.subtypes LIKE '%Wizard%';	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM set_translations WHERE setCode = 'ARC' AND translation = 'Archenemy';	card_games
SELECT `name`, `translation` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `sets.id` = 5;	card_games
SELECT t.language, s.type FROM set_translations t JOIN sets s ON t.setCode = s.code WHERE s.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND code IN (     SELECT setCode     FROM set_translations     WHERE language = 'Japanese' );	card_games
SELECT      s.name AS set_name,      s.baseSetSize AS total_cards FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Russian' ORDER BY      s.baseSetSize DESC LIMIT 1;	card_games
SELECT      ROUND((COUNT(CASE WHEN cards.isOnlineOnly = 1 THEN 1 END) / COUNT(*)) * 100, 2) AS percentage_of_online_only_cards_with_chinese_simplified FROM      cards JOIN      set_translations ON cards.uuid = set_translations.setCode WHERE      set_translations.language = 'Chinese Simplified' AND     cards.isOnlineOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT name  FROM cards  WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language  FROM set_translations  WHERE setCode = '10E';	card_games
SELECT `name` FROM `sets` WHERE `code` = 'ALL';	card_games
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT s.baseSetSize, s.code  FROM sets s  JOIN blocks b ON s.block = b.name  WHERE b.name IN ('Masques', 'Mirage');	card_games
SELECT `code`  FROM `sets`  WHERE `type` = 'expansion';	card_games
SELECT fd.name AS foreign_name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE s.watermark = 'boros';	card_games
SELECT fd.language, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Colorpie';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(*),         2     ) AS percentage_with_cmc_10 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      c.name = 'Abyssal Horror';	card_games
SELECT `code`  FROM `sets`  WHERE `type` = 'expansion' AND `name` = 'Commander';	card_games
SELECT fd.name, c.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.flavorText LIKE '%Abzan%'	card_games
SELECT f.language, c.type FROM cards c JOIN watermark w ON c.watermark = w.id JOIN set_translations st ON w.setCode = st.setCode WHERE st.translation LIKE '%Azorius%';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM `cards` WHERE `availability` LIKE '%paper%' AND `hand` = '3';	card_games
SELECT `name` FROM `cards` WHERE `isTextless` = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'white' AND (`power` = '*' OR `power` IS NULL);	card_games
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL;	card_games
SELECT `subtypes`, `supertypes` FROM `cards` WHERE `name` = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE `availability` LIKE '%arena,mtgo%'  AND `borderColor` = 'black';	card_games
SELECT      CASE          WHEN MAX(c1.convertedManaCost) > MAX(c2.convertedManaCost) THEN 'Serra Angel'         WHEN MAX(c1.convertedManaCost) < MAX(c2.convertedManaCost) THEN 'Shrine Keeper'         ELSE 'Equal'     END AS CardWithHigherManaCost FROM      (SELECT MAX(convertedManaCost) AS convertedManaCost FROM cards WHERE name = 'Serra Angel') AS c1,     (SELECT MAX(convertedManaCost) AS convertedManaCost FROM cards WHERE name = 'Shrine Keeper') AS c2;	card_games
SELECT `cards.artist` FROM `cards` WHERE `cards.flavorName` = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian';	card_games
SELECT COUNT(*)  FROM cards  JOIN set_translations ON cards.setCode = sets.code  WHERE cards.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean' );	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Eighth Edition') AND language = 'Chinese Simplified';	card_games
SELECT s.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT releaseDate FROM sets JOIN cards ON sets.code = cards.setCode WHERE cards.name = 'Ancestor''s Chosen';	card_games
SELECT `type`  FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `translation` = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;	card_games
SELECT      c.name  FROM      cards c  JOIN      sets s ON c.setCode = s.code  WHERE      c.name = 'Adarkar Valkyrie'      AND s.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE id IN (     SELECT id     FROM set_translations     WHERE language = 'Italian' ) AND baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards WHERE `name` = 'Coldsnap' AND `borderColor` = 'black';	card_games
SELECT `name` FROM `cards` WHERE `setCode` = 'Coldsnap' ORDER BY `convertedManaCost` DESC LIMIT 1;	card_games
SELECT DISTINCT `artist` FROM `cards` WHERE `name` = 'Coldsnap' AND `artist` IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT `number` FROM `cards` WHERE `name` = 'Coldsnap' AND `number` = '4';	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);	card_games
SELECT flavorText FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Italian';	card_games
SELECT DISTINCT language  FROM foreign_data  WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL;	card_games
SELECT type FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'German';	card_games
SELECT cards.name, rulings.text AS ruling FROM cards JOIN rulings ON cards.uuid = rulings.uuid JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Coldsnap' AND set_translations.language = 'Italian';	card_games
SELECT `foreign_data.name` AS ItalianName FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Coldsnap' AND `foreign_data.language` = 'Italian' ORDER BY `cards.convertedManaCost` DESC LIMIT 1;	card_games
SELECT date  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Reminisce';	card_games
SELECT      ROUND(         (SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) / SUM(1)) * 100,          2     ) AS percentage_with_cmc_7 FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Coldsnap';	card_games
SELECT      ROUND((SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS percentage_incredibly_powerful FROM      cards WHERE      name = 'Coldsnap';	card_games
SELECT `code`  FROM `sets`  WHERE `releaseDate` = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId  FROM sets  WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT `type` FROM `sets` WHERE `name` LIKE '%From the Vault: Lore%'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.id, c.name, r.text AS ruling, c.hasContentWarning AS hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate  FROM sets s  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT `type` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `set_translations.translation` = 'Huitième édition';	card_games
SELECT st.translation FROM cards c JOIN set_translations st ON c.name = st.translation WHERE st.language = 'French' AND c.name = 'Tendo Ice Bridge';	card_games
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition');	card_games
SELECT st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT name, MAX(convertedManaCost) AS highestCMC FROM cards WHERE name = 'Journey into Nyx Hero''s Path' GROUP BY name ORDER BY highestCMC DESC LIMIT 1;	card_games
SELECT releaseDate  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE translation = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards WHERE name = 'World Championship Decks 2004' AND convertedManaCost = 3.0;	card_games
SELECT translation FROM set_translations WHERE setCode = 'Mirrodin' AND language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN sets.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN cards.language = 'Japanese' THEN 1 ELSE 0 END)  FROM      cards  JOIN      sets ON cards.setCode = sets.code  WHERE      cards.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN s.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END) FROM      cards c JOIN      set_translations st ON c.uuid = st.setCode JOIN      sets s ON st.setCode = s.code WHERE      s.language = 'Portuguese (Brazil)';	card_games
SELECT c.name, c.availability FROM cards c WHERE c.artist = 'Aleksi Briclot' AND c.isTextless = 1 GROUP BY c.name, c.availability;	card_games
SELECT id  FROM sets  WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT `artist`, MAX(`convertedManaCost`) AS max_cost FROM `cards` WHERE `side` IS NULL AND `artist` IS NOT NULL GROUP BY `artist` ORDER BY max_cost DESC LIMIT 1;	card_games
SELECT MAX(frameEffects) as most_common_frame_effect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM `cards` WHERE `power` IS NULL OR `power` = '*' AND `hasFoil` = 0 AND `duelDeck` = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT id, name, MAX(convertedManaCost) AS maxConvertedManaCost FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'duel' GROUP BY id, name ORDER BY maxConvertedManaCost DESC LIMIT 10;	card_games
SELECT      MIN(originalReleaseDate) AS OldestReleaseDate,      GROUP_CONCAT(DISTINCT l.format ORDER BY l.format ASC SEPARATOR ', ') AS LegalPlayFormats FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.rarity = 'mythic' AND      l.status = 'legal'	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.artist = 'Volkan Baǵa' AND foreign_data.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types LIKE '%Enchantment%' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT `format`, COUNT(`uuid`) AS banned_cards_count FROM `legalities` WHERE `status` = 'Banned' GROUP BY `format` ORDER BY banned_cards_count DESC LIMIT 1;	card_games
SELECT language  FROM set_translations  WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond');	card_games
SELECT artist, COUNT(*) as card_count FROM cards GROUP BY artist ORDER BY card_count ASC LIMIT 1;	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND l.format = 'legacy' AND c.hasContentWarning = 1;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT AVG(id), MAX(COUNT(language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate);	card_games
SELECT DISTINCT artist  FROM cards  WHERE `borderColor` = 'black' AND `availability` LIKE '%arena%';	card_games
SELECT DISTINCT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%'	card_games
SELECT r.text, r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name FROM sets s LEFT JOIN set_translations st_japanese ON s.code = st_japanese.setCode AND st_japanese.language = 'Japanese' LEFT JOIN set_translations st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' WHERE st_japanese.id IS NULL AND st_korean.id IS NOT NULL;	card_games
SELECT DISTINCT `frameVersion` AS FrameStyle FROM `cards` WHERE `artist` = 'Allen Williams';  SELECT `name` FROM `cards` JOIN `legalities` ON `cards.uuid` = `legalities.uuid` WHERE `legalities.status` = 'Banned';	card_games
SELECT      CASE          WHEN u1.Reputation > u2.Reputation THEN u1.DisplayName          ELSE u2.DisplayName      END AS HigherReputationUser FROM      users u1 JOIN      users u2 ON u1.DisplayName = 'Harlan' AND u2.DisplayName = 'Jarrod Dixon' WHERE      u1.Reputation > u2.Reputation;	codebase_community
SELECT `DisplayName` FROM `users` WHERE YEAR(`CreationDate`) = 2011;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT p.OwnerDisplayName  FROM posts p  WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT SUM(`CommentCount`) AS TotalComments FROM `posts` WHERE `OwnerDisplayName` = 'csgillespie';	codebase_community
SELECT p.Id, p.AnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body  FROM posts p  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.TagName = 'bayesian';	codebase_community
SELECT      p.Body  FROM      posts p  JOIN      tags t ON p.Id = t.ExcerptPostId  WHERE      t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie' AND YEAR(badges.Date) = 2011;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(`Score`) as AverageScore FROM `posts` WHERE `OwnerDisplayName` = 'csgillespie'	codebase_community
SELECT AVG(badgeCount) AS averageBadges FROM (     SELECT u.Id, COUNT(b.Id) AS badgeCount     FROM users u     JOIN badges b ON u.Id = b.UserId     WHERE u.Views > 200     GROUP BY u.Id ) AS userBadges;	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE Age > 65 AND Score > 5) /      (SELECT COUNT(*) FROM posts WHERE Score > 5) * 100 AS ElderUserPercentage FROM      dual;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes GROUP BY YEAR(CreationDate), MONTH(CreationDate), DAY(CreationDate) ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(`Id`) AS NumRevivalBadges FROM `badges` WHERE `Name` = 'Revival';	codebase_community
SELECT p.Title FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0';	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1;	codebase_community
SELECT      p.Id AS PostId,     p.Title,     p.ClosedDate,     CASE          WHEN p.ClosedDate IS NULL THEN 'Not closed'          ELSE 'Closed'      END AS PostStatus FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT Reputation  FROM users  WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041);	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT `users.DisplayName` FROM `users` JOIN `votes` ON `users.Id` = `votes.UserId` WHERE `votes.Id` = 6347;	codebase_community
SELECT SUM(CASE WHEN p.Title LIKE '%data visualization%' THEN v.VoteTypeId ELSE 0 END) AS TotalVotes FROM posts p JOIN votes v ON p.Id = v.PostId	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) AS PostCount,     (SELECT COUNT(*) FROM votes WHERE UserId = 24) AS VoteCount,     CAST((SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) AS REAL) /      CAST((SELECT COUNT(*) FROM votes WHERE UserId = 24) AS REAL) AS PostVoteRatio FROM      dual;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT `Text` FROM `comments` WHERE `Score` = 17;	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE `WebsiteUrl` = 'http://stackoverflow.com';	codebase_community
SELECT `Name` FROM `badges` INNER JOIN `users` ON `badges.UserId` = `users.Id` WHERE `users.DisplayName` = 'SilentGhost'	codebase_community
SELECT `UserDisplayName` FROM `comments` WHERE `Text` = 'thank you user93!'	codebase_community
SELECT c.Text AS Comment FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT      u.DisplayName,      u.Reputation FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text AS CommentText FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT ph.LastEditorDisplayName FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'Open source tools for visualizing multi-dimensional data' AND ph.LastEditorUserId IS NOT NULL;	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY p.LastEditorUserId, u.WebsiteUrl;	codebase_community
SELECT c.Text AS CommentText, c.CreationDate AS CommentDate, u.DisplayName AS CommenterDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM posts WHERE Title LIKE '%data%' AND PostId IN (SELECT PostId FROM votes WHERE VoteTypeId = 2);	codebase_community
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, AVG(p.ViewCount) AS AvgViewCount FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'humor' GROUP BY p.Id	codebase_community
SELECT COUNT(*) AS TotalComments FROM comments WHERE UserId = 13;	codebase_community
SELECT `Id`  FROM `users`  ORDER BY `Reputation` DESC  LIMIT 1;	codebase_community
SELECT `Id`, `Views` FROM `users` ORDER BY `Views` ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Supporter' AND YEAR(`Date`) = 2011;	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges` WHERE `Id` IN (     SELECT `Id`     FROM `badges`     GROUP BY `UserId`     HAVING COUNT(`Name`) > 5 );	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York';	codebase_community
SELECT u.DisplayName, u.Reputation  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Id = 1;	codebase_community
SELECT u.DisplayName, p.ViewCount FROM users u JOIN postHistory ph ON u.Id = ph.UserId JOIN posts p ON ph.PostId = p.Id GROUP BY ph.UserId, p.Id HAVING COUNT(ph.Id) = 1 AND p.ViewCount >= 1000;	codebase_community
SELECT      c.UserId,      u.DisplayName,      b.Name AS BadgeName FROM      comments c JOIN      users u ON c.UserId = u.Id JOIN      badges b ON u.Id = b.UserId WHERE      c.UserId = (         SELECT              UserId          FROM              comments          GROUP BY              UserId          ORDER BY              COUNT(Id) DESC          LIMIT 1     ) ORDER BY      b.Name;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Teacher' AND u.Location = 'India';	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(b.Date) = 2010 THEN 1 END) / COUNT(*) * 100 -       COUNT(CASE WHEN YEAR(b.Date) = 2011 THEN 1 END) / COUNT(*) * 100) AS PercentageDifference FROM badges b WHERE b.Name = 'Student'	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostId;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;	codebase_community
SELECT p.Id AS PostId, u.Id AS UserId FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(`FavoriteCount`)  FROM `posts`  WHERE `LastEditorUserId` = 686 AND YEAR(`LastEditDate`) = 2011	codebase_community
SELECT      AVG(u.UpVotes) + AVG(u.Age) AS AvgUpVotesAndAge FROM      users u JOIN      (         SELECT              OwnerUserId         FROM              posts         GROUP BY              OwnerUserId         HAVING              COUNT(*) > 10     ) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Announcer';	codebase_community
SELECT `Name` FROM `badges` WHERE `Date` = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT `badges.Date` FROM `badges` JOIN `users` ON `badges.UserId` = `users.Id` WHERE `users.Location` = 'Rochester, NY' ORDER BY `badges.Date`;	codebase_community
SELECT      (COUNT(DISTINCT CASE WHEN b.Name = 'Teacher' THEN b.UserId END) * 100.0) / COUNT(DISTINCT b.UserId) AS TeacherBadgePercentage FROM badges b;	codebase_community
SELECT     ROUND((COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN u.Id END) * 100.0) / COUNT(u.Id), 2) AS Teenager_Percentage FROM     badges b JOIN     users u ON b.UserId = u.Id WHERE     b.Name = 'Organizer';	codebase_community
SELECT c.Score AS CommentRatingScore FROM comments c WHERE c.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT users.Age FROM users JOIN badges ON users.Id = badges.UserId WHERE users.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age > 65;	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE `Id` = 30;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) AS AdultUserCount FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT `DisplayName`, MAX(`Views`) as MaxViews FROM `users` GROUP BY `DisplayName` ORDER BY MaxViews DESC LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id ELSE NULL END), COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id ELSE NULL END)) AS VoteRatio FROM votes;	codebase_community
SELECT TagName FROM tags WHERE ExcerptPostId IN (     SELECT Id     FROM posts     WHERE OwnerUserId = (         SELECT Id         FROM users         WHERE DisplayName = 'John Salvatier'     ) );	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo');	codebase_community
SELECT COUNT(*) FROM votes JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'Harlan';	codebase_community
SELECT p.Id  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'slashnick'  ORDER BY p.AnswerCount DESC  LIMIT 1;	codebase_community
SELECT      MAX(SUM(p.ViewCount)) AS MaxViewCount FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName = 'Harvey Motulsky' OR u.DisplayName = 'Noah Snyder' GROUP BY      u.DisplayName;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Matt Parker') AND Id IN (SELECT PostId FROM votes GROUP BY PostId HAVING COUNT(*) > 4);	codebase_community
SELECT COUNT(c.Id) AS NegativeCommentCount FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan';	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN p.Tags LIKE '%<r>%' THEN p.Id END) / COUNT(CASE WHEN u.DisplayName = 'Community' THEN p.Id END)) * 100 AS percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName = 'Community'	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Mornington', 'Amos');	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges`  WHERE `Name` = 'Commentator' AND YEAR(`Date`) = 2014;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users u ORDER BY u.Views DESC LIMIT 1;	codebase_community
SELECT p.LastEditDate, p.LastEditorUserId FROM posts p WHERE p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score > 60;	codebase_community
SELECT Name FROM badges WHERE Date BETWEEN '2011-01-01 00:00:00.0' AND '2011-12-31 23:59:59.0' AND UserId IN (SELECT Id FROM users WHERE Location = 'North Pole');	codebase_community
SELECT      p.OwnerDisplayName,      u.WebsiteUrl  FROM      posts p  JOIN      users u ON p.OwnerUserId = u.Id  WHERE      p.FavoriteCount > 150;	codebase_community
SELECT      COUNT(*) AS PostHistoryCount,     MAX(`LastEditDate`) AS LastEditDate FROM      `postHistory` JOIN      `posts` ON `postHistory.PostId` = `posts.Id` WHERE      `posts.Title` = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT      p.Title AS RelatedPostTitle FROM      posts p JOIN      postLinks pl ON p.Id = pl.PostId WHERE      p.Title = 'How to tell if something happened in a data set which monitors a value over time'	codebase_community
SELECT p.Id, b.Name FROM badges b JOIN users u ON b.UserId = u.Id JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT `OwnerDisplayName` FROM `posts` ORDER BY `ViewCount` DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT p.OwnerDisplayName AS ParentDisplayName FROM posts p WHERE p.Id = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL) AND p.ParentId IS NOT NULL;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId  FROM posts  WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT MAX(Reputation) AS MaxReputation, Age FROM users WHERE Reputation IS NOT NULL AND Age IS NOT NULL ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreaionDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT SUM(Score) as TotalScoreOnDate FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT      COUNT(pl.Id) / 12 AS AverageMonthlyLinks FROM      postLinks pl JOIN      posts p ON pl.PostId = p.Id WHERE      YEAR(pl.CreationDate) = 2010     AND p.AnswerCount <= 2;	codebase_community
SELECT PostId  FROM posts  WHERE OwnerUserId = 1465  ORDER BY FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks)	codebase_community
SELECT users.DisplayName FROM badges JOIN users ON badges.UserId = users.Id GROUP BY badges.UserId ORDER BY COUNT(badges.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate) AS FirstVoteDate FROM votes WHERE UserId = (     SELECT Id     FROM users     WHERE DisplayName = 'chl' )	codebase_community
SELECT MIN(CreationDate)  FROM posts  WHERE OwnerUserId IN (     SELECT Id      FROM users      ORDER BY Age ASC      LIMIT 1 );	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(v.PostId) AS AvgPostsVotedByOldestUsers FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT `DisplayName`, `Reputation` FROM `users` ORDER BY `Reputation` DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Age` BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreaionDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Stephen Turner'	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.ViewCount > 20000 AND YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN YEAR(posts.CreaionDate) = 2011 AND users.Reputation > 1000 THEN 1 END) * 100.0) / COUNT(posts.Id),         2     ) AS PercentageOfHighReputationPosts FROM      posts JOIN      users ON posts.OwnerUserId = users.Id;	codebase_community
SELECT      DIVIDE(COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END), COUNT(u.Id)) AS percentage FROM      users u;	codebase_community
SELECT p.ViewCount, u.DisplayName AS LastTimePoster FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Body LIKE '%Computer Game Datasets%' AND p.LastEditDate = (     SELECT MAX(ph.CreationDate)     FROM postHistory ph     WHERE ph.PostId = p.Id )	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT Name  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett')  ORDER BY Date DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT DATEDIFF(b.Date, u.CreationDate) AS TimeToGetBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon' ORDER BY b.Date LIMIT 1;	codebase_community
SELECT      u.DisplayName,      (SELECT COUNT(*) FROM posts p WHERE p.OwnerUserId = u.Id) AS PostCount,      (SELECT COUNT(*) FROM comments c WHERE c.UserId = u.Id) AS CommentCount FROM      users u WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users);	codebase_community
SELECT c.Text AS CommentText, u.DisplayName AS UserName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT `UserId`) FROM `badges` WHERE `Name` = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'careers';	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT     SUM(CASE WHEN p.Title = 'Clustering 1D data' THEN c.Id ELSE 0 END) AS CommentCount,     SUM(CASE WHEN p.Title = 'Clustering 1D data' THEN a.Id ELSE 0 END) AS AnswerCount FROM     posts p LEFT JOIN comments c ON p.Id = c.PostId LEFT JOIN posts a ON p.Id = a.ParentId AND a.PostTypeId = 2 WHERE     p.Title = 'Clustering 1D data';	codebase_community
SELECT `CreationDate` FROM `users` WHERE `DisplayName` = 'IrishStat' LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30;	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE posts.OwnerUserId = users.Id AND posts.Score > 50) * 100.0 /      (SELECT COUNT(*) FROM posts WHERE posts.OwnerUserId = users.Id) AS percentage FROM      users ORDER BY      (SELECT MAX(Reputation) FROM users) DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId  FROM tags  WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT ph.Text FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.UserDisplayName LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT c.PostId) AS PostsWithZeroScoreAndLowViewCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.CommentCount = 1 AND comments.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers40YearsOld FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Text AS Comment FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT c.UserId, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      ROUND((COUNT(CASE WHEN c.UserId IN (SELECT u.Id FROM users u WHERE u.UpVotes = 0) THEN c.UserId END) * 100.0) / COUNT(c.UserId), 2) AS PercentageZeroUpVotes FROM      comments c WHERE      c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.full_name HAVING COUNT(hero_power.power_id) > 15;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue';	superhero
SELECT `colour.colour` FROM `superhero` JOIN `colour` ON `superhero.skin_colour_id` = `colour.id` WHERE `superhero.superhero_name` = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT superhero.id) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour eye_colour ON s.eye_colour_id = eye_colour.id AND eye_colour.colour = 'Blue' JOIN colour hair_colour ON s.hair_colour_id = hair_colour.id AND hair_colour.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.superhero_name = 'Sauron';	superhero
SELECT      c.colour,     COUNT(s.id) AS color_popularity FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics' GROUP BY      c.colour ORDER BY      color_popularity DESC;	superhero
SELECT AVG(`height_cm`) AS average_height FROM `superhero` WHERE `publisher_id` = 1;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name, a.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Speed' ORDER BY a.attribute_value LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT s.superhero_name, s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT race FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN gender ON superhero.gender_id = gender.id  WHERE gender.gender = 'Female'  AND attribute.attribute_name = 'Strength'  AND hero_attribute.attribute_value = 100;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name  ORDER BY COUNT(hero_power.power_id) DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE `race` = 'Vampire');	superhero
SELECT      ROUND(         (SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),          2     ) AS bad_alignment_percentage,     COUNT(CASE WHEN s.publisher_id = 13 THEN 1 END) AS marvel_comics_bad_allignments FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;	superhero
SELECT id  FROM publisher  WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(`attribute_value`) as average_attribute_value FROM `hero_attribute`;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';	superhero
SELECT `superhero_name` FROM `superhero` WHERE `height_cm` BETWEEN 170 AND 190 AND `eye_colour_id` = (SELECT `id` FROM `colour` WHERE `colour` = 'No Colour');	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.id = 56;	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT `race` FROM `superhero` WHERE `weight_kg` = 169;	superhero
SELECT `colour.colour` FROM `superhero` JOIN `colour` ON `superhero.hair_colour_id` = `colour.id` JOIN `race` ON `superhero.race_id` = `race.id` WHERE `superhero.height_cm` = 185 AND `race.race` = 'human';	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id),         2     ) AS percentage_marvel_heroes FROM      superhero s WHERE      s.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM `superpower` sp JOIN `hero_power` hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(ha2.attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' )	superhero
SELECT AVG(s.id)  FROM superhero s  WHERE s.skin_colour_id = (SELECT id FROM colour WHERE colour.id = 1);	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT      superhero.superhero_name,      superhero.full_name,      MAX(hero_attribute.attribute_value) AS max_durability FROM      superhero JOIN      hero_attribute ON superhero.id = hero_attribute.hero_id JOIN      attribute ON hero_attribute.attribute_id = attribute.id JOIN      publisher ON superhero.publisher_id = publisher.id WHERE      attribute.attribute_name = 'Durability'      AND publisher.publisher_name = 'Dark Horse Comics' GROUP BY      superhero.id ORDER BY      max_durability DESC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Flight';	superhero
SELECT s.full_name, c.eye_colour, h.colour AS hair_colour, sc.colour AS skin_colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id JOIN colour sc ON s.skin_colour_id = sc.id JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT      s.superhero_name,      p.publisher_name FROM      superhero s JOIN      colour AS eye_colour ON s.eye_colour_id = eye_colour.id JOIN      colour AS hair_colour ON s.hair_colour_id = hair_colour.id JOIN      colour AS skin_colour ON s.skin_colour_id = skin_colour.id JOIN      publisher p ON s.publisher_id = p.id WHERE      s.eye_colour_id = s.hair_colour_id     AND s.eye_colour_id = s.skin_colour_id;	superhero
SELECT race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb';	superhero
SELECT      (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) /      COUNT(DISTINCT s.id) AS blue_female_percentage FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Female');	superhero
SELECT superhero_name, race  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT `gender` FROM `superhero` WHERE `superhero_name` = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*) AS number_of_powers FROM `hero_power` JOIN `superhero` ON `hero_power.hero_id` = `superhero.id` WHERE `superhero.superhero_name` = 'Amazo';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT `superhero_name` FROM `superhero` JOIN `colour` AS eye_colour ON `superhero`.`eye_colour_id` = `eye_colour`.`id` JOIN `colour` AS hair_colour ON `superhero`.`hair_colour_id` = `hair_colour`.`id` WHERE `eye_colour`.`colour` = 'Black' AND `hair_colour`.`colour` = 'Black';	superhero
SELECT s.superhero_name, c.colour  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE c.colour = 'Gold';	superhero
SELECT `superhero`.`full_name` FROM `superhero` JOIN `race` ON `superhero`.`race_id` = `race`.`id` WHERE `race`.`race` = 'Vampire';	superhero
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT COUNT(DISTINCT h.id)  FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(attribute_value)      FROM hero_attribute      WHERE attribute_id = (         SELECT id          FROM attribute          WHERE attribute_name = 'Strength'     ) );	superhero
SELECT s.race, a.alignment FROM superhero s JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END),         2     ) AS percentage_female_marvel_heroes FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(`weight_kg`) AS average_weight FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Alien');	superhero
SELECT      (SUM(CASE WHEN superhero.full_name = 'Emil Blonsky' THEN superhero.weight_kg ELSE 0 END) -       SUM(CASE WHEN superhero.full_name = 'Charles Chandler' THEN superhero.weight_kg ELSE 0 END)) AS weight_difference FROM superhero;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Speed'  ORDER BY hero_attribute.attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour eye_colour ON s.eye_colour_id = eye_colour.id AND eye_colour.colour = 'Blue' JOIN colour hair_colour ON s.hair_colour_id = hair_colour.id AND hair_colour.colour = 'Brown';	superhero
SELECT publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      ROUND(         (COUNT(CASE WHEN s.eye_colour_id = 7 THEN 1 END) * 100.0) / COUNT(*),         2     ) AS blue_eyes_percentage FROM      superhero s;	superhero
SELECT      (SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END)) AS male_female_ratio FROM      superhero;	superhero
SELECT superhero_name, MAX(height_cm) AS tallest_height FROM superhero WHERE height_cm IS NOT NULL GROUP BY superhero_name ORDER BY tallest_height DESC LIMIT 1;	superhero
SELECT id FROM `superpower` WHERE `power_name` = 'cryokinesis';	superhero
SELECT superhero_name  FROM superhero  WHERE id = 294;	superhero
SELECT `full_name` FROM `superhero` WHERE `weight_kg` = 0 OR `weight_kg` IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero AS sh JOIN hero_power AS hp ON sh.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sh.full_name = 'Helen Parr';	superhero
SELECT `race` FROM `superhero` WHERE `weight_kg` = 108 AND `height_cm` = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT s.race_id, r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN (     SELECT hero_id, MAX(attribute_value) AS max_value     FROM hero_attribute     GROUP BY hero_id ) ha ON s.id = ha.hero_id ORDER BY ha.max_value DESC LIMIT 1;	superhero
SELECT s.alignment, sp.power_name FROM superhero su JOIN alignment a ON su.alignment_id = a.id JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Atom IV';	superhero
SELECT superhero_name, full_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT s.superhero_name, c.colour FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.superhero_name, r.race  FROM superhero s  JOIN colour c ON s.hair_colour_id = c.id  JOIN gender g ON s.gender_id = g.id  JOIN race r ON s.race_id = r.id  WHERE c.colour = 'Blue' AND g.gender = 'Male';	superhero
SELECT      ROUND(         (SUM(CASE WHEN alignment.id = 2 AND gender.id = 2 THEN 1 ELSE 0 END) /           SUM(CASE WHEN alignment.id = 2 THEN 1 ELSE 0 END)) * 100.0,         2     ) AS percentage_female_bad_heroes FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 2;	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 7 AND weight_kg IS NULL OR weight_kg = 0) -      (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 1 AND weight_kg IS NULL OR weight_kg = 0) AS eye_colour_difference	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk';	superhero
SELECT sp.power_name FROM superhero AS sh JOIN hero_power AS hp ON sh.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN colour ON superhero.skin_colour_id = colour.id WHERE alignment.alignment = 'Bad' AND colour.colour = 'Green';	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE power_name = 'Wind Control' ORDER BY superhero_name ASC;	superhero
SELECT s.gender FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher_name = 'DC Comics' ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE race_id <> 1 AND publisher_id = 3;	superhero
SELECT superhero_name, full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT      SUM(CASE WHEN publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS DC_Count,     SUM(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS Marvel_Count,     SUM(CASE WHEN publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS Difference FROM      superhero JOIN      publisher ON superhero.publisher_id = publisher.id WHERE      publisher_name = 'DC Comics' OR publisher_name = 'Marvel Comics';	superhero
SELECT a.attribute_name FROM attribute a JOIN hero_attribute ha ON a.id = ha.attribute_id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT `superhero_name`, `full_name`, `height_cm` FROM `superhero` WHERE `height_cm` = (SELECT MAX(`height_cm`) FROM `superhero`);	superhero
SELECT superhero_name  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.publisher_id = p.id AND s.gender_id = g.id THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN s.publisher_id = p.id THEN 1 ELSE 0 END),          2     ) AS percentage_female FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN gender g ON s.gender_id = g.id WHERE p.publisher_name = 'George Lucas';	superhero
SELECT      ROUND(         (COUNT(CASE WHEN alignment_id = 1 THEN 1 END) * 100.0) / COUNT(*),          2     ) AS percentage_good_superheroes FROM      superhero WHERE      publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*) FROM superhero WHERE `full_name` LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value LIMIT 1;	superhero
SELECT `full_name` FROM `superhero` WHERE `superhero_name` = 'Alien';	superhero
SELECT `superhero`.`full_name` FROM `superhero` JOIN `colour` AS `eye_colour` ON `superhero`.`eye_colour_id` = `eye_colour`.`id` WHERE `superhero`.`weight_kg` < 100 AND `eye_colour`.`colour` = 'Auburn'	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT `weight_kg`, `race` FROM `superhero` WHERE `id` = 40;	superhero
SELECT AVG(`height_cm`) AS average_height FROM `superhero` WHERE `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Neutral');	superhero
SELECT hero_id FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero AS sh JOIN hero_power AS hp ON sh.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 20 AND q.q1 = (SELECT MAX(q1) FROM qualifying WHERE raceId = 20)	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)	formula_1
SELECT DISTINCT s.year  FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN seasons s ON r.year = s.year WHERE c.location = 'Shanghai';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country = 'Germany';	formula_1
SELECT c.name, c.positionText FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN constructorResults cr ON r.raceId = cr.raceId JOIN constructors co ON cr.constructorId = co.constructorId WHERE co.name = 'Renault';	formula_1
SELECT COUNT(*)  FROM races  WHERE year = 2010  AND circuitId NOT IN (     SELECT circuitId      FROM circuits      WHERE country IN ('Malaysia', 'Bahrain', 'Turkey', 'Monaco', 'Spain') );	formula_1
SELECT r.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 24 AND cr.points = 1;	formula_1
SELECT `q1` FROM `qualifying` JOIN `drivers` ON `qualifying.driverId` = `drivers.driverId` WHERE `drivers.surname` = 'Senna' AND `qualifying.raceId` = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '00:01:40' AND q.raceId = 355;	formula_1
SELECT d.number FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q3 LIKE '0:01:54%' AND q.raceId = (SELECT raceId FROM races WHERE raceId = 903);	formula_1
SELECT COUNT(DISTINCT driverId) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND results.time IS NULL;	formula_1
SELECT seasons.url FROM races JOIN seasons ON races.year = seasons.year WHERE races.raceId = 901;	formula_1
SELECT COUNT(DISTINCT `driverId`) FROM `results` WHERE `raceId` = (SELECT `raceId` FROM `races` WHERE `date` = '2015-11-29' AND `name` = 'Brazilian Grand Prix') AND `statusId` IN (SELECT `statusId` FROM `status` WHERE `status` = 'Finished');	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT      d.driverId,      d.url FROM      lapTimes lt JOIN      drivers d ON lt.driverId = d.driverId WHERE      lt.time LIKE '0:01:27%'     AND lt.raceId = 161;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 933 AND r.fastestLap = (SELECT MAX(fastestLap) FROM results WHERE raceId = 933)	formula_1
SELECT `location`, `lat`, `lng` FROM `circuits` JOIN `races` ON `circuits.circuitId` = `races.circuitId` WHERE `races.name` = 'Malaysian Grand Prix'	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 9 AND cr.points = (SELECT MAX(points) FROM constructorResults cr2 WHERE cr2.raceId = r.raceId);	formula_1
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.surname = 'di Grassi' AND qualifying.raceId = (SELECT raceId FROM races WHERE raceId = 345);	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE q.q2 = '00:01:15' AND r.raceId = 347;	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q3 LIKE '0:01:33%' AND q.raceId = (SELECT raceId FROM races WHERE raceId = 45);	formula_1
SELECT time  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN constructors ON results.constructorId = constructors.constructorId  WHERE drivers.surname = 'McLaren' AND results.raceId = 743;	formula_1
SELECT d.driverRef, d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId) AS drivers_not_finished FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29' AND time IS NOT NULL) AND statusId = (SELECT statusId FROM status WHERE status = 'Finished') AND position = 0;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 872   AND r.statusId = (SELECT statusId FROM status WHERE status = 'Finished') ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.raceId = (SELECT raceId FROM races WHERE raceId = 348 AND position = 1) ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLap IS NOT NULL ORDER BY r.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT      (100 * (r1.fastestLapSpeed - r2.fastestLapSpeed)) / r1.fastestLapSpeed AS percentage_faster FROM      results r1 JOIN      drivers d ON r1.driverId = d.driverId JOIN      results r2 ON r1.raceId = r2.raceId + 1 WHERE      d.forename = 'Paul' AND      d.surname = 'di Resta' AND      r1.raceId = 853 AND      r2.raceId = 854	formula_1
SELECT      d.driverId,     d.forename,     d.surname,     COUNT(CASE WHEN rt.time IS NOT NULL THEN 1 END) AS completedLaps,     COUNT(d.driverId) AS totalLaps,     (COUNT(CASE WHEN rt.time IS NOT NULL THEN 1 END) * 100.0 / COUNT(d.driverId)) AS completionRate FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId JOIN      lapTimes rt ON d.driverId = rt.driverId AND r.raceId = rt.raceId WHERE      ra.date = '1983-07-16' GROUP BY      d.driverId, d.forename, d.surname	formula_1
SELECT year  FROM races  WHERE name = 'Singapore Grand Prix'  ORDER BY year ASC  LIMIT 1;	formula_1
SELECT COUNT(*) AS total_races,         GROUP_CONCAT(name ORDER BY name DESC SEPARATOR ', ') AS race_names FROM races WHERE year = 2005;	formula_1
SELECT r.name  FROM races r  WHERE r.date = (SELECT MIN(r2.date) FROM races r2);	formula_1
SELECT `r`.name, `r`.date  FROM `races` AS `r` WHERE `r`.year = 1999 ORDER BY `r`.round DESC LIMIT 1;	formula_1
SELECT `year` FROM `seasons` GROUP BY `year` ORDER BY COUNT(`year`) DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year = 2017 AND circuitId NOT IN (     SELECT circuitId     FROM races     WHERE year = 2000 );	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year = (SELECT MIN(year) FROM seasons WHERE url LIKE '%European%Grand%Prix%') AND c.country != 'Monaco';	formula_1
SELECT year FROM circuits WHERE name = 'Brands Hatch' AND country = 'United Kingdom' ORDER BY year DESC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit'  AND c.country = 'United Kingdom'  AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, ds.position FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2010 AND r.name = 'Singapore Grand Prix' ORDER BY ds.position;	formula_1
SELECT d.forename, d.surname, MAX(rs.points) as highest_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN results rs ON ds.driverId = rs.driverId GROUP BY d.driverId ORDER BY highest_points DESC LIMIT 1;	formula_1
SELECT d.surname, d.forename, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, MIN(l.milliseconds) AS best_milliseconds FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId GROUP BY l.driverId, r.raceId ORDER BY best_milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(`milliseconds`) as average_lap_time FROM `lapTimes` JOIN `drivers` ON `lapTimes.driverId` = `drivers.driverId` JOIN `races` ON `lapTimes.raceId` = `races.raceId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton' AND `races.name` = 'Malaysian Grand Prix';	formula_1
SELECT      (COUNT(CASE WHEN drivers.surname = 'Hamilton' AND results.position > 1 THEN 1 END) * 100.0) /      COUNT(CASE WHEN drivers.surname = 'Hamilton' THEN 1 END) AS percentage FROM      results JOIN      drivers ON results.driverId = drivers.driverId WHERE      drivers.surname = 'Hamilton'      AND results.raceId IN (         SELECT              raceId          FROM              races          JOIN              circuits ON races.circuitId = circuits.circuitId          WHERE              circuits.circuitRef NOT IN ('bahrain', 'catalunya', 'monaco')              AND races.year >= 2010     );	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(r.wins) AS max_wins, MAX(ds.points) AS max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId GROUP BY d.driverId ORDER BY max_wins DESC, max_points DESC LIMIT 1;	formula_1
SELECT `forename`, `surname`,         (strftime('%Y', 'now') - strftime('%Y', `dob`)) AS age FROM `drivers` WHERE `nationality` = 'Japanese' ORDER BY `dob` DESC LIMIT 1;	formula_1
SELECT c.circuitId, c.circuitRef, c.name, c.location, c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId HAVING COUNT(r.circuitId) = 4;	formula_1
SELECT c.name AS CircuitName, c.location AS CircuitLocation, r.name AS RaceName FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name AS raceName, c.name AS circuitName, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name AS race_name FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND rs.position < 20;	formula_1
SELECT COUNT(*) FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN circuits ON circuits.circuitId = races.circuitId JOIN races ON results.raceId = races.raceId WHERE drivers.surname = 'Schumacher' AND circuits.circuitRef = 'sepang' AND results.points = (     SELECT MAX(points)     FROM results AS max_points     JOIN drivers ON max_points.driverId = drivers.driverId     JOIN races ON max_points.raceId = races.raceId     JOIN circuits ON circuits.circuitId = races.circuitId     WHERE drivers.surname = 'Schumacher' AND circuits.circuitRef = 'sepang' );	formula_1
SELECT r.name AS race_name, s.year AS race_year FROM results r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId JOIN seasons s ON r.year = s.year WHERE d.surname = 'Schumacher' AND lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes lt2 WHERE lt2.driverId = d.driverId);	formula_1
SELECT AVG(points) AS average_points FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Irvine' AND YEAR(races.date) = 2000;	formula_1
SELECT      MIN(r.year) AS first_race_year,     SUM(cr.points) AS total_points FROM      races r JOIN      constructorResults cr ON r.raceId = cr.raceId JOIN      constructors c ON cr.constructorId = c.constructorId JOIN      drivers d ON c.constructorId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY      d.driverId;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name, s.year, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN (     SELECT raceId, MAX(laps) AS maxLaps     FROM results     GROUP BY raceId ) AS maxLapsRace ON r.raceId = maxLapsRace.raceId JOIN (     SELECT raceId, laps     FROM results     GROUP BY raceId ) AS raceLaps ON r.raceId = raceLaps.raceId AND raceLaps.laps = maxLapsRace.maxLaps ORDER BY maxLapsRace.maxLaps DESC LIMIT 1;	formula_1
SELECT      (SELECT COUNT(*)       FROM races       WHERE name = 'European Grand Prix' AND country = 'Germany') * 100.0 /      (SELECT COUNT(*)       FROM races       WHERE name = 'European Grand Prix') AS percentage	formula_1
SELECT `lat`, `lng`  FROM `circuits`  WHERE `name` = 'Silverstone Circuit';	formula_1
SELECT      `name`,      `lat` FROM      `circuits` WHERE      `name` IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY      `lat` DESC LIMIT 1;	formula_1
SELECT `circuitRef`  FROM `circuits`  WHERE `name` = 'Marina Bay Street Circuit';	formula_1
SELECT `country`, MAX(`alt`) AS `max_altitude` FROM `circuits` WHERE `alt` IS NOT NULL GROUP BY `country` ORDER BY `max_altitude` DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT d.nationality  FROM drivers d  WHERE d.dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT `name` FROM `circuits` JOIN `races` ON `circuits.circuitId` = `races.circuitId` WHERE `races.name` = 'Spanish Grand Prix' AND `races.year` = 2009;	formula_1
SELECT DISTINCT s.year FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE c.circuitRef = 'silverstone';	formula_1
SELECT      r.raceId,      r.name AS raceName,      r.date,      r.time,      c.name AS circuitName,      c.url AS circuitUrl FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      c.circuitRef = 'silverstone';	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year BETWEEN 2010 AND 2019 AND c.circuitRef = 'abu_dhabi';	formula_1
SELECT COUNT(*) FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'catalunya';	formula_1
SELECT url  FROM circuits  WHERE circuitRef = 'catalunya'  AND circuitId IN (     SELECT circuitId      FROM races      WHERE year = 2009 AND name = 'Spanish Grand Prix' );	formula_1
SELECT MIN(`fastestLapTime`) AS fastestLapTime FROM `results` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis');	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.fastestLap IS NOT NULL ORDER BY CAST(SUBSTR(lt.fastestLapSpeed, 3) AS REAL) DESC LIMIT 1;	formula_1
SELECT d.driverRef FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND ds.position = 1 AND r.year = 2007;	formula_1
SELECT r.name AS race_name, r.date AS race_date FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis';	formula_1
SELECT r.name AS RaceName, d.forename || ' ' || d.surname AS DriverName, MIN(r.rank) AS HighestRank FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY r.name, DriverName ORDER BY HighestRank ASC LIMIT 1;	formula_1
SELECT MAX(`fastestLapSpeed`) AS fastestLapSpeed FROM `results` WHERE `raceId` IN (     SELECT `raceId`     FROM `races`     WHERE `name` = 'Spanish Grand Prix' )	formula_1
SELECT DISTINCT s.year  FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname, r.positionOrder FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Chinese Grand Prix';	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT `fastestLapTime` FROM `lapTimes` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis') AND `raceId` = (SELECT `raceId` FROM `races` WHERE `name` = 'Australian Grand Prix' AND `year` = 2008) ORDER BY `milliseconds` ASC LIMIT 1;	formula_1
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN driverStandings ds ON r.driverId = ds.driverId WHERE ra.name = 'Australian Grand Prix' AND ds.positionText = '2' AND ra.year = 2008	formula_1
SELECT d.driverId, d.surname, d.forename, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND s.status = 'Finished' AND r.position = 1 AND r.time LIKE 'HH:%' AND r.fastestLapTime LIKE 'HH:%';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND d.nationality = 'British';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.time IS NOT NULL;	formula_1
SELECT SUM(`points`) AS total_points FROM `driverStandings` JOIN `drivers` ON `driverStandings.driverId` = `drivers.driverId` WHERE `drivers.surname` = 'Hamilton';	formula_1
SELECT AVG(TIME_TO_SEC(`fastestLapTime`)) AS average_fastest_lap_time_seconds FROM `lapTimes` JOIN `drivers` ON `lapTimes.driverId` = `drivers.driverId` WHERE `drivers.surname` = 'Hamilton';	formula_1
SELECT      (COUNT(CASE WHEN r.time IS NOT NULL THEN r.raceId END) * 1.0) / COUNT(r.raceId) AS completion_rate FROM      races r WHERE      r.year = 2008 AND r.name = 'Australian Grand Prix';	formula_1
SELECT      (100.0 * (SUBTIME('00:01:00:000', champion.time) - SUBTIME('00:00:00:000', last_driver.time)) / SUBTIME('00:00:00:000', last_driver.time)) AS percent_faster FROM      (SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 AND position = 1) AND statusId = 1) AS champion CROSS JOIN      (SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 ORDER BY position DESC LIMIT 1) AND statusId = 1) AS last_driver;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT `lat`, `lng`  FROM `circuits`  WHERE `country` = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(points) AS max_points FROM constructors WHERE nationality = 'British';	formula_1
SELECT `constructors`.`name`, SUM(`constructorStandings`.`points`) AS total_points FROM `constructors` JOIN `constructorStandings` ON `constructors`.`constructorId` = `constructorStandings`.`constructorId` GROUP BY `constructors`.`constructorId` ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE cr.points = 0 AND r.raceId = 291;	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE c.nationality = 'Japanese'  AND cs.points = 0 GROUP BY c.constructorId HAVING COUNT(r.raceId) = 2;	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1;	formula_1
SELECT COUNT(*) FROM lapTimes JOIN constructors ON lapTimes.driverId IN (     SELECT driverId     FROM drivers     WHERE nationality = 'French' ) WHERE lap > 50;	formula_1
SELECT      (COUNT(CASE WHEN drivers.nationality = 'Japanese' AND results.time IS NOT NULL AND seasons.year BETWEEN 2007 AND 2009 THEN 1 END)      / COUNT(CASE WHEN drivers.nationality = 'Japanese' AND seasons.year BETWEEN 2007 AND 2009 THEN 1 END)) * 100 AS raceCompletionPercentage FROM      drivers JOIN      results ON drivers.driverId = results.driverId JOIN      races ON results.raceId = races.raceId JOIN      seasons ON races.year = seasons.year WHERE      drivers.nationality = 'Japanese' AND      seasons.year BETWEEN 2007 AND 2009;	formula_1
SELECT      r.year,     AVG(SEC_TO_TIME(TIME_TO_SEC(time))) AS average_time_seconds FROM      results r JOIN      driverStandings ds ON r.driverId = ds.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ds.position = 1     AND ra.year < 1975     AND r.time IS NOT NULL GROUP BY      r.year;	formula_1
SELECT d.forename, d.surname FROM drivers d WHERE d.dob > '1975-01-01' AND EXISTS (     SELECT 1     FROM driverStandings ds     JOIN results r ON ds.driverId = d.driverId     WHERE ds.position = 2     AND r.resultId = ds.driverStandingsId );	formula_1
SELECT COUNT(DISTINCT d.driverId) AS italian_drivers_not_finished FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId WHERE lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes );	formula_1
SELECT lap FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE year = 2009     AND circuitId IN (         SELECT circuitId         FROM races         JOIN constructorStandings ON races.raceId = constructorStandings.raceId         WHERE constructorStandings.position = 1     ) ) ORDER BY milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(`fastestLapSpeed`) AS averageFastestLapSpeed FROM `results` JOIN `races` ON `results.raceId` = `races.raceId` WHERE `races.name` = 'Spanish Grand Prix' AND `results.year` = 2009;	formula_1
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId JOIN status s ON res.statusId = s.statusId WHERE s.status = 'Finished' AND res.milliseconds IS NOT NULL ORDER BY res.milliseconds ASC LIMIT 1;	formula_1
SELECT      ROUND(         (COUNT(CASE WHEN d.dob < '1985-01-01' THEN 1 END) / COUNT(d.driverId)) * 100, 2     ) AS percentage_of_qualified_drivers FROM      drivers d WHERE      d.dob < '1985-01-01'     AND EXISTS (         SELECT 1         FROM results r         JOIN races ra ON r.raceId = ra.raceId         WHERE r.driverId = d.driverId         AND ra.year BETWEEN 2000 AND 2005         AND r.laps > 50     );	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.milliseconds < 120;	formula_1
SELECT code FROM drivers WHERE nationality = 'American';	formula_1
SELECT raceId  FROM races  WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT `driverId`) AS numberOfDrivers FROM `results` WHERE `raceId` = 18;	formula_1
SELECT d.driverId, d.number FROM drivers d WHERE d.nationality = 'Dutch' ORDER BY d.dob DESC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE surnname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND SUBSTR(dob, 1, 4) = '1980';	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob, lt.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY d.driverId ORDER BY lt.time ASC LIMIT 3;	formula_1
SELECT d.driverRef FROM drivers d WHERE d.nationality = 'German' ORDER BY d.dob LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.dob = '1971-01-01' AND lt.fastestLap IS NOT NULL;	formula_1
SELECT      d.driverId,      d.forename,      d.surname,      d.dob,      lt.time FROM      drivers d JOIN      lapTimes lt ON d.driverId = lt.driverId WHERE      d.nationality = 'Spanish' AND      d.dob < '1982-01-01' ORDER BY      lt.milliseconds DESC LIMIT      10;	formula_1
SELECT `races`.`year` FROM `races` JOIN `lapTimes` ON `races`.`raceId` = `lapTimes`.`raceId` WHERE `lapTimes`.`fastestLapTime` IS NOT NULL ORDER BY `lapTimes`.`fastestLapTime` ASC LIMIT 1;	formula_1
SELECT races.year, MAX(TIMESTAMPDIFF(SECOND, '00:00:00', time)) AS max_time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId GROUP BY races.year ORDER BY max_time LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY milliseconds ASC LIMIT 5;	formula_1
SELECT COUNT(DISTINCT `resultId`)  FROM `results`  WHERE `raceId` > 50 AND `raceId` < 100 AND `statusId` = 2;	formula_1
SELECT COUNT(*), circuits.name, circuits.lat, circuits.lng FROM circuits WHERE circuits.country = 'Austria' GROUP BY circuits.name, circuits.lat, circuits.lng;	formula_1
SELECT `r`.round, COUNT(`r`.round) AS finisher_count FROM `races` AS `r` JOIN `results` AS `res` ON `r`.raceId = `res`.raceId WHERE `res`.time IS NOT NULL GROUP BY `r`.round ORDER BY finisher_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 IS NOT NULL AND q.raceId = 23;	formula_1
SELECT s.year, r.name, r.date, r.time FROM drivers d JOIN races r ON d.driverId = r.raceId JOIN (     SELECT MIN(dob) as min_dob     FROM drivers ) as min_dob_query ON d.dob = min_dob_query.min_dob JOIN seasons s ON r.year = s.year WHERE d.driverId IN (     SELECT driverId     FROM races     GROUP BY driverId     HAVING MIN(raceId) = MIN(raceId) ) ORDER BY s.year LIMIT 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN (     SELECT constructorId, SUM(wins) AS totalWins     FROM constructorStandings     GROUP BY constructorId     ORDER BY totalWins DESC     LIMIT 1 ) AS cs ON c.constructorId = cs.constructorId;	formula_1
SELECT d.forename, d.surname, lt.time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.time DESC LIMIT 1;	formula_1
SELECT r.name, MIN(lt.milliseconds) AS fastest_lap_time_milliseconds FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId WHERE lt.position = 1 GROUP BY r.name ORDER BY fastest_lap_time_milliseconds LIMIT 1;	formula_1
SELECT AVG(`fastestLapTime`)  FROM `results`  JOIN `races` ON `results.raceId` = `races.raceId`  WHERE `races.name` = 'United States Grand Prix'  AND `results.rank` < 11;	formula_1
SELECT d.forename, d.surname, AVG(SUBSTRING(p.duration, 3, 2)) AS avg_pitstop_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId ORDER BY avg_pitstop_duration ASC LIMIT 3;	formula_1
SELECT d.surname, d.forename, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN seasons se ON ra.year = se.year WHERE ra.name = 'Canadian Grand Prix' AND se.year = 2008 AND r.position = 1 ORDER BY r.positionOrder LIMIT 1;	formula_1
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN results ON constructors.constructorId = results.constructorId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Singapore Grand Prix' AND results.position = 1;	formula_1
SELECT `forename`, `surname`, `dob` FROM `drivers` WHERE `nationality` = 'Austrian' AND `dob` BETWEEN '1981-01-01' AND '1991-12-31';	formula_1
SELECT CONCAT(d.forename, ' ', d.surname) AS fullName, d.url AS wikiLink, d.dob FROM drivers d WHERE d.nationality = 'German' AND d.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY d.dob DESC;	formula_1
SELECT `location`, `country`, `lat` AS `latitude`, `lng` AS `longitude` FROM `circuits` WHERE `circuitRef` = 'hungaroring';	formula_1
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Circuit de Monaco' AND r.date >= '1980-01-01' AND r.date <= '2010-12-31' GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) AS average_score FROM results JOIN races ON results.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND circuits.circuitRef = 'istanbul'	formula_1
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY year;	formula_1
SELECT nationality, COUNT(*) as total FROM drivers GROUP BY nationality ORDER BY total DESC LIMIT 1;	formula_1
SELECT SUM(CASE WHEN rs.points = 25 THEN 1 ELSE 0 END) AS victories FROM driverStandings ds JOIN results r ON ds.driverId = r.driverId JOIN drivers d ON ds.driverId = d.driverId JOIN status s ON r.statusId = s.statusId WHERE d.driverRef = '91st' AND s.status = 'Finished' AND r.points = 25;	formula_1
SELECT r.name  FROM races r JOIN results res ON r.raceId = res.raceId JOIN lapTimes lt ON res.resultId = lt.raceId WHERE lt.fastestLap IS NOT NULL ORDER BY lt.fastestLapTime ASC LIMIT 1;	formula_1
SELECT `circuitRef`, `location`, `country`, MAX(`date`) as latest_date FROM `races` JOIN `circuits` ON `races.circuitId` = `circuits.circuitId` ORDER BY `date` DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE q.position = 1 AND r.year = 2008 AND r.name = 'Singapore Grand Prix' AND q.q3 IS NOT NULL ORDER BY q.q3 ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.nationality, r.name AS raceName FROM drivers d JOIN races r ON d.driverId = r.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT      (SELECT COUNT(*)       FROM results       JOIN status ON results.statusId = status.statusId       WHERE results.driverId =         (SELECT driverId          FROM results          JOIN status ON results.statusId = status.statusId          WHERE status.status = 'Accident'          AND results.raceId =            (SELECT raceId             FROM races             WHERE name = 'Canadian Grand Prix')         GROUP BY driverId          ORDER BY COUNT(*) DESC          LIMIT 1)      AND status.status = 'Accident')  AS accident_count;	formula_1
SELECT d.forename, d.surname, COUNT(*) AS wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId;	formula_1
SELECT MAX(`milliseconds`) AS max_duration FROM `pitStops` WHERE `duration` IS NOT NULL;	formula_1
SELECT MIN(milliseconds) AS fastestLapTime FROM lapTimes;	formula_1
SELECT MAX(duration) AS longest_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT lap FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId JOIN races ON pitStops.raceId = races.raceId WHERE drivers.surname = 'Hamilton' AND races.name = 'Australian Grand Prix' AND races.year = 2011;	formula_1
SELECT      d.forename,     d.surname,     p.stop,     p.lap,     p.duration FROM      pitStops p JOIN      drivers d ON p.driverId = d.driverId JOIN      races r ON p.raceId = r.raceId WHERE      r.name = 'Australian Grand Prix' AND      r.year = 2011;	formula_1
SELECT raceId, lap, time, milliseconds  FROM lapTimes  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')  ORDER BY milliseconds ASC  LIMIT 1;	formula_1
SELECT d.forename, d.surname, MIN(LEAST(STRFTIME('%s', lt.time), STRFTIME('%s', lt.time))) AS shortest_time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId GROUP BY d.driverId, d.forename, d.surname ORDER BY shortest_time ASC LIMIT 20;	formula_1
SELECT      `results.position` FROM      `results` JOIN      `drivers` ON `results.driverId` = `drivers.driverId` WHERE      `drivers.forename` = 'Lewis' AND      `drivers.surname` = 'Hamilton' AND      `results.time` = (SELECT MIN(`lapTimes.time`)                         FROM `lapTimes`                         JOIN `results` ON `lapTimes.driverId` = `results.driverId`                         WHERE `results.resultId` = `results.resultId`)	formula_1
SELECT raceId, MIN(milliseconds) AS fastestTime FROM lapTimes WHERE raceId IN (     SELECT circuitId     FROM circuits     WHERE name = 'Austrian Grand Prix Circuit' ) GROUP BY raceId ORDER BY fastestTime ASC LIMIT 1;	formula_1
SELECT r.circuitId, c.name, c.location, MIN(l.time) AS fastestLapTime FROM lapTimes l JOIN circuits c ON l.raceId IN (     SELECT raceId FROM races WHERE circuitId IN (         SELECT circuitId FROM circuits WHERE country = 'Italy'     ) ) GROUP BY r.circuitId, c.name, c.location ORDER BY fastestLapTime;	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'austria' AND r.name LIKE '%Grand Prix%';	formula_1
SELECT      p.driverId,      p.stop,      p.lap,      p.time,      p.duration FROM      pitStops p JOIN      races r ON p.raceId = r.raceId WHERE      r.name = 'Austrian Grand Prix' AND     EXISTS (         SELECT 1         FROM lapTimes lt         WHERE lt.raceId = p.raceId AND               lt.driverId = p.driverId AND               lt.position = 1     ) ORDER BY      p.driverId,      p.stop;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(`milliseconds`) AS average_pit_stop_time FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis');	formula_1
SELECT AVG(milliseconds) as average_lap_time FROM lapTimes WHERE circuitId IN (     SELECT circuitId     FROM circuits     WHERE country = 'Italy' );	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT `Player_Attributes`.preferred_foot FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.player_api_id = `Player`.player_api_id ORDER BY `Player_Attributes`.potential ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT `player_api_id` FROM `Player_Attributes` ORDER BY `crossing` DESC LIMIT 5;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) as lost_matches FROM Match WHERE home_team_goal < away_team_goal AND season = '2015/2016' GROUP BY home_team_api_id ORDER BY lost_matches ASC LIMIT 1;	european_football_2
SELECT p.player_name, COUNT(m.player_api_id) AS penalties FROM Player p JOIN Match m ON p.player_api_id = m.home_player_1 OR p.player_api_id = m.home_player_2 OR p.player_api_id = m.home_player_3 OR p.player_api_id = m.home_player_4 OR p.player_api_id = m.home_player_5 OR p.player_api_id = m.home_player_6 OR p.player_api_id = m.home_player_7 OR p.player_api_id = m.home_player_8 OR p.player_api_id = m.home_player_9 OR p.player_api_id = m.home_player_10 OR p.player_api_id = m.home_player_11 OR p.player_api_id = m.away_player_1 OR p.player_api_id = m.away_player_2 OR p.player_api_id = m.away_player_3 OR p.player_api_id = m.away_player_4 OR p.player_api_id = m.away_player_5 OR p.player_api_id = m.away_player_6 OR p.player_api_id = m.away_player_7 OR p.player_api_id = m.away_player_8 OR p.player_api_id = m.away_player_9 OR p.player_api_id = m.away_player_10 OR p.player_api_id = m.away_player_11 GROUP BY p.player_name ORDER BY penalties DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.season = '2009/2010' AND T2.league_id = (SELECT id FROM League WHERE name = 'Scotland Premier League') AND T2.away_team_goal > T2.home_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT      MAX(buildUpPlaySpeed) AS max_build_up_speed,     team_api_id FROM      Team_Attributes WHERE      buildUpPlaySpeedClass = 'Fast' GROUP BY      team_api_id ORDER BY      max_build_up_speed DESC LIMIT 4;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' AND M.home_team_goal = M.away_team_goal GROUP BY L.name ORDER BY SUM(M.home_team_goal = M.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT      p.player_name,      TIMESTAMPDIFF(YEAR, p.birthday, CURRENT_TIMESTAMP) AS age,     pa.sprint_speed FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      pa.sprint_speed >= 97     AND pa.date BETWEEN '2013-01-01' AND '2015-12-31';	european_football_2
SELECT `name`, COUNT(`match_api_id`) AS total_matches FROM `League`  JOIN `Match` ON `League`.`id` = `Match`.`league_id` GROUP BY `League`.`name` ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id OR T1.team_api_id = T2.team_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > (     SELECT AVG(T3.buildUpPlayPassing)     FROM Team_Attributes AS T3     WHERE strftime('%Y', T3.date) = '2012' AND T3.buildUpPlayPassing IS NOT NULL )	european_football_2
SELECT     (SUM(CASE WHEN PA.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0) / COUNT(P.player_fifa_api_id) AS left_foot_percentage FROM     Player PA JOIN     Player P ON PA.player_fifa_api_id = P.player_fifa_api_id WHERE     P.birthday BETWEEN '1987-01-01' AND '1992-12-31'	european_football_2
SELECT League.name, SUM(Match.home_team_goal + Match.away_team_goal) AS total_goals FROM League JOIN Match ON League.id = Match.league_id GROUP BY League.name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(`Player_Attributes`.`long_shots`) AS average_long_shots FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_fifa_api_id` = `Player`.`player_fifa_api_id` WHERE `Player`.`player_name` = 'Ahmed Samir Farag';	european_football_2
SELECT      P.player_name,      AVG(PA.heading_accuracy) AS avg_heading_accuracy FROM      Player P JOIN      Player_Attributes PA ON P.player_fifa_api_id = PA.player_fifa_api_id WHERE      P.height > 180 GROUP BY      P.player_name ORDER BY      avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY T1.chanceCreationPassing DESC;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' AND AVG(M.home_team_goal) > AVG(M.away_team_goal) GROUP BY L.name;	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE substr(birthday, 1, 7) = '1970-10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Franco Zennaro');	european_football_2
SELECT `buildUpPlayPositioningClass` FROM `Team_Attributes` WHERE `team_long_name` = 'ADO Den Haag' AND `buildUpPlayPositioningClass` LIKE '%1st two thirds%' AND `date` = (     SELECT MAX(`date`)     FROM `Team_Attributes`     WHERE `team_long_name` = 'ADO Den Haag'     AND `buildUpPlayPositioningClass` LIKE '%1st two thirds%' );	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (     SELECT `player_fifa_api_id`     FROM `Player`     WHERE `player_name` = 'Francois Affolter' ) AND `date` = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT p.preferred_foot FROM Player p JOIN (     SELECT player_api_id, MIN(birthday) as min_birthday     FROM Player     GROUP BY player_api_id ) youngest ON p.player_api_id = youngest.player_api_id AND p.birthday = youngest.min_birthday;	european_football_2
SELECT player_name, potential FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.potential = (     SELECT MAX(potential)     FROM Player_Attributes );	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `weight` < 130 AND `preferred_foot` = 'left';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT `Player_Attributes`.`defensive_work_rate` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_fifa_api_id` = `Player`.`player_fifa_api_id` WHERE `Player`.`player_name` = 'David Wilson';	european_football_2
SELECT `Player.birthday` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `Player_Attributes.overall_rating` = (     SELECT MAX(`overall_rating`)     FROM `Player_Attributes` ) LIMIT 1;	european_football_2
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal) AS average_home_team_goals FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT      p.player_name,      pa.AVG_finishing_rate FROM      Player p JOIN      (SELECT           player_api_id,           AVG(finishing) AS AVG_finishing_rate      FROM           Player_Attributes      GROUP BY           player_api_id) pa ON      p.player_api_id = pa.player_api_id WHERE      p.height = (SELECT MAX(height) FROM Player) OR      p.height = (SELECT MIN(height) FROM Player) ORDER BY      pa.AVG_finishing_rate DESC LIMIT 1;	european_football_2
SELECT `player_name` FROM `Player` WHERE `height` > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_fifa_api_id` = (SELECT `player_fifa_api_id` FROM `Player` WHERE `player_name` = 'Aaron Doran');	european_football_2
SELECT player_name FROM Player WHERE preferred_foot = 'left';	european_football_2
SELECT DISTINCT T1.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_api_id` IN (     SELECT `team_api_id`     FROM `Team`     WHERE `team_short_name` = 'CLB' );	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlayPassing` > 70;	european_football_2
SELECT AVG(t2.overall_rating) AS average_rating FROM Player_Attributes t2 JOIN Player t1 ON t2.player_api_id = t1.player_api_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170;	european_football_2
SELECT player_name, MIN(height) AS shortest_height FROM Player WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT `Country`.`name`  FROM `League`  JOIN `Country` ON `League`.`country_id` = `Country`.`id`  WHERE `League`.`name` = 'Italy Serie A';	european_football_2
SELECT `team_short_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `buildUpPlaySpeed` = 31 AND `buildUpPlayDribbling` = 53 AND `buildUpPlayPassing` = 32;	european_football_2
SELECT AVG(`overall_rating`) AS avg_overall_rating FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Aaron Doran');	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Match AS M ON T.team_api_id = M.home_team_api_id WHERE M.home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.balance, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61) AND pa.potential = 61;	european_football_2
SELECT      (AVG(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE NULL END) -       AVG(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE NULL END)) AS ball_control_diff FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT `team_long_name` FROM `Team` WHERE `team_short_name` = 'GEN';	european_football_2
SELECT      P1.player_name AS Player1,      P2.player_name AS Player2,      CASE          WHEN P1.birthday < P2.birthday THEN P1.player_name          ELSE P2.player_name      END AS OlderPlayer FROM      Player P1 JOIN      Player P2 ON P1.player_api_id < P2.player_api_id WHERE      P1.player_name = 'Aaron Lennon' OR P2.player_name = 'Aaron Lennon'     AND P1.player_name = 'Abdelaziz Barrada' OR P2.player_name = 'Abdelaziz Barrada';	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT `name` FROM `League` WHERE `country_id` IN (SELECT `id` FROM `Country` WHERE `name` = 'Germany');	european_football_2
SELECT `player_name`, MAX(`overall_rating`) AS `max_strength` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` GROUP BY `player_name` ORDER BY `max_strength` DESC LIMIT 1;	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT      p.player_name,      pa.crossing FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY      pa.crossing DESC LIMIT 1;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Ariel Borysiuk');	european_football_2
SELECT COUNT(*) FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.height > 180 AND Player_Attributes.volleys > 70;	european_football_2
SELECT player_name FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT pa.long_passing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT COUNT(*) FROM `Match` WHERE `league_id` = (SELECT `id` FROM `League` WHERE `name` = 'Belgium Jupiler League') AND SUBSTR(`date`, 1, 7) = '2009-04'	european_football_2
SELECT `name` FROM `League` WHERE `id` IN (     SELECT `league_id`     FROM `Match`     WHERE `season` = '2008/2009' ) GROUP BY `name` ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE strftime('%Y', `Player.birthday`) < '1986';	european_football_2
SELECT      ROUND(         (             (SELECT `overall_rating`               FROM `Player_Attributes` pa               JOIN `Player` p ON pa.player_fifa_api_id = p.player_fifa_api_id               WHERE p.player_name = 'Ariel Borysiuk'             ) -              (SELECT `overall_rating`               FROM `Player_Attributes` pa               JOIN `Player` p ON pa.player_fifa_api_id = p.player_fifa_api_id               WHERE p.player_name = 'Paulin Puel'             )         ) /          (SELECT `overall_rating`           FROM `Player_Attributes` pa           JOIN `Player` p ON pa.player_fifa_api_id = p.player_fifa_api_id           WHERE p.player_name = 'Paulin Puel'         ) * 100     ) AS difference_percentage	european_football_2
SELECT AVG(`buildUpPlaySpeed`) AS average_build_up_play_speed FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_api_id` = `Team.team_api_id` WHERE `Team.team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(`Player_Attributes.crossing`) AS total_crossing_score FROM `Player_Attributes` INNER JOIN `Player` AS T2 ON `Player_Attributes.player_fifa_api_id` = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(`chanceCreationPassing`) AS highest_chance_creation_passing_score,         `chanceCreationPassingClass`  FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax' GROUP BY `chanceCreationPassingClass` ORDER BY `chanceCreationPassing` DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes INNER JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(`away_team_goal`) AS average_away_goals FROM `Match` JOIN `Team` ON `Match.home_team_api_id` = `Team.team_api_id` JOIN `League` ON `Match.league_id` = `League.id` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `Team.team_long_name` = 'Parma' AND `Country.name` = 'Italy';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday DESC LIMIT 1;	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Aaron Mooy' AND `Player_Attributes.date` LIKE '2016-02-04%'	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francesco Parravicini') AND `date` = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Francesco Migliore' AND `Player_Attributes.date` LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00';	european_football_2
SELECT date  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Kevin Constant'  ORDER BY pa.crossing DESC  LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22';	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'LEI' AND Team_Attributes.date = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%';	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'PEC Zwolle' AND `date` = '2013-09-20 00:00:00';	european_football_2
SELECT `chanceCreationCrossingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hull City' AND `date` = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND `date` LIKE '2015-09-10%'	european_football_2
SELECT AVG(`overall_rating`) AS avg_overall_rating FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Marko Arnautovic') AND SUBSTR(`date`, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      (         (p1.overall_rating - p2.overall_rating) / p1.overall_rating * 100     ) AS percentage_difference FROM      Player_Attributes AS p1 JOIN      Player AS pl1 ON p1.player_api_id = pl1.player_api_id AND pl1.player_name = 'Landon Donovan' JOIN      Player_Attributes AS p2 ON p2.player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery') WHERE      p1.date = '2013-07-12' AND p2.date = '2013-07-12';	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE DATEDIFF(YEAR, p.birthday, CURRENT_TIMESTAMP) > 34;	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id OR               Match.home_player_2 = Player.player_api_id OR               Match.home_player_3 = Player.player_api_id OR               Match.home_player_4 = Player.player_api_id OR               Match.home_player_5 = Player.player_api_id OR               Match.home_player_6 = Player.player_api_id OR               Match.home_player_7 = Player.player_api_id OR               Match.home_player_8 = Player.player_api_id OR               Match.home_player_9 = Player.player_api_id OR               Match.home_player_10 = Player.player_api_id OR               Match.home_player_11 = Player.player_api_id WHERE Player.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(`away_team_goal`) AS `TotalAwayGoals` FROM `Match` JOIN `Player` ON `Match.away_player_1` = `Player.player_api_id` OR `Match.away_player_2` = `Player.player_api_id` WHERE `Player.player_name` IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(M.home_team_goal) AS total_home_goals FROM Match M JOIN Player P ON M.home_player_1 = P.player_api_id OR M.home_player_2 = P.player_api_id OR M.home_player_3 = P.player_api_id OR M.home_player_4 = P.player_api_id OR M.home_player_5 = P.player_api_id OR M.home_player_6 = P.player_api_id OR M.home_player_7 = P.player_api_id OR M.home_player_8 = P.player_api_id OR M.home_player_9 = P.player_api_id OR M.home_player_10 = P.player_api_id OR M.home_player_11 = P.player_api_id WHERE TIMESTAMPDIFF(YEAR, P.birthday, CURRENT_TIMESTAMP) < 31;	european_football_2
SELECT `Player.player_name` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `Player_Attributes.overall_rating` = (     SELECT MAX(`overall_rating`)     FROM `Player_Attributes` )	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id = m.home_player_1 OR p.player_api_id = m.home_player_2 OR p.player_api_id = m.home_player_3 OR  p.player_api_id = m.home_player_4 OR p.player_api_id = m.home_player_5 OR p.player_api_id = m.home_player_6 OR  p.player_api_id = m.home_player_7 OR p.player_api_id = m.home_player_8 OR p.player_api_id = m.home_player_9 OR  p.player_api_id = m.home_player_10 OR p.player_api_id = m.home_player_11 OR  p.player_api_id = m.away_player_1 OR p.player_api_id = m.away_player_2 OR p.player_api_id = m.away_player_3 OR  p.player_api_id = m.away_player_4 OR p.player_api_id = m.away_player_5 OR p.player_api_id = m.away_player_6 OR  p.player_api_id = m.away_player_7 OR p.player_api_id = m.away_player_8 OR p.player_api_id = m.away_player_9 OR  p.player_api_id = m.away_player_10 OR p.player_api_id = m.away_player_11 WHERE pa.attacking_work_rate = 'high' AND m.home_team_goal > m.away_team_goal OR m.home_team_goal = m.away_team_goal;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY p.birthday ASC LIMIT 1;	european_football_2
SELECT player_name FROM Player JOIN Country ON Player.player_fifa_api_id = Country.id WHERE Country.name = 'Belgium';	european_football_2
SELECT p.player_name, c.name AS country FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Country c ON p.player_fifa_api_id = c.id WHERE pa.vision > 89;	european_football_2
SELECT Country.name, AVG(P.weight) AS avg_weight FROM Player P JOIN Country C ON P.player_fifa_api_id = C.id GROUP BY Country.name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT `team_long_name` FROM `Team` JOIN `Team_Attributes` ON `Team.team_api_id` = `Team_Attributes.team_api_id` WHERE `Team_Attributes.buildUpPlaySpeedClass` = 'Slow'	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(`height`) AS average_height FROM `Player` JOIN `Country` ON `Player`.`player_fifa_api_id` = `Country`.`id` WHERE `Country`.`name` = 'Italy';	european_football_2
SELECT `player_name` FROM `Player` WHERE `height` > 180 ORDER BY `player_name` ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT      (SELECT jumping FROM `Player_Attributes` WHERE `id` = 6) -      (SELECT jumping FROM `Player_Attributes` WHERE `id` = 23) AS jump_score_difference;	european_football_2
SELECT p.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes pa2 WHERE pa2.preferred_foot = 'right') AND pa.preferred_foot = 'right' ORDER BY pa.potential ASC LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left');	european_football_2
SELECT      ROUND(         (COUNT(CASE WHEN P.stamina > 80 AND P.strength > 80 THEN 1 ELSE NULL END) * 100.0) / COUNT(*),         2     ) AS percentage_above_80_strength_stamina FROM      Player_Attributes AS PA JOIN      Player AS P ON PA.player_api_id = P.player_api_id;	european_football_2
SELECT `name`  FROM `Country`  WHERE `id` = (SELECT `country_id`                FROM `League`                WHERE `name` = 'Poland Ekstraklasa');	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%' AND league_name = 'Belgium Jupiler League' AND home_team_api_id = 9987 OR away_team_api_id = 9987;	european_football_2
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.player_name` = 'Alexis Blin';	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_fifa_api_id` = (SELECT `team_fifa_api_id` FROM `Team` WHERE `team_long_name` = 'KSV Cercle Brugge');	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A');	european_football_2
SELECT MAX(home_team_goal) AS highest_score FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie');	european_football_2
SELECT `finishing` AS finishing_rate, `curve` AS curve_score FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.weight` = (SELECT MAX(`weight`) FROM `Player`);	european_football_2
SELECT League.name, COUNT(Match.id) AS total_games FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY total_games DESC LIMIT 4;	european_football_2
SELECT T1.team_long_name FROM `Team` AS T1 JOIN `Match` AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM `Match`);	european_football_2
SELECT `player_name` FROM `Player_Attributes` pa JOIN `Player` p ON pa.player_api_id = p.player_api_id WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`) LIMIT 1;	european_football_2
SELECT      ROUND(         (COUNT(CASE WHEN `Player`.`height` < 180 AND `Player_Attributes`.`overall_rating` > 70 THEN 1 END) * 100.0) / COUNT(`Player`.`id`),         2     ) AS percentage FROM      `Player` JOIN      `Player_Attributes` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id` WHERE      `Player`.`height` < 180 AND `Player_Attributes`.`overall_rating` > 70;	european_football_2
SELECT      (SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'M' AND `Admission` = '+') AS InPatients,     (SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'M' AND `Admission` = '-') AS OutPatients,     ((SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'M' AND `Admission` = '+') -       (SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'M' AND `Admission` = '-')) /       (SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'M') * 100 AS PercentageDeviation	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Birthday` > '1930' THEN 1 END) * 100.0) / COUNT(`ID`) AS Percentage_Female_Born_After_1930 FROM      `Patient` WHERE      `SEX` = 'F';	thrombosis_prediction
SELECT      ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN 1930 AND 1940), 2) AS PercentageInpatients FROM      Patient WHERE      YEAR(Birthday) BETWEEN 1930 AND 1940     AND Admission = '+';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Examination`.`Diagnosis` = 'SLE' AND `Patient`.`Admission` = '+' THEN `Examination`.`ID` END)      / COUNT(CASE WHEN `Examination`.`Diagnosis` = 'SLE' AND `Patient`.`Admission` = '-' THEN `Examination`.`ID` END)) AS OutpatientToInpatientRatio FROM      `Examination` JOIN      `Patient` ON `Examination`.`ID` = `Patient`.`ID` WHERE      `Examination`.`Diagnosis` = 'SLE';	thrombosis_prediction
SELECT p.`Diagnosis`, l.`Date` FROM `Patient` p JOIN `Laboratory` l ON p.`ID` = l.`ID` WHERE p.`ID` = 30609;	thrombosis_prediction
SELECT      p.SEX,      p.Birthday,      e.`Examination Date`,      e.Symptoms FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID = 163109;	thrombosis_prediction
SELECT `Patient`.`ID`, `Patient`.`SEX`, `Patient`.`Birthday` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`LDH` > 500;	thrombosis_prediction
SELECT p.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RVVT = '+';	thrombosis_prediction
SELECT      `Patient.ID`,      `Patient.SEX`,      `Patient.Diagnosis` FROM      `Patient` INNER JOIN      `Examination` ON `Patient.ID` = `Examination.ID` WHERE      `Examination.Thrombosis` = 2;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday BETWEEN '1937-01-01' AND '1937-12-31' AND l.T-CHO >= 250;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Diagnosis FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.ALB < 3.5;	thrombosis_prediction
SELECT      ROUND((COUNT(CASE WHEN `Patient.SEX` = 'F' AND `Laboratory.TP` < 6.0 OR `Laboratory.TP` > 8.5 THEN 1 END) * 100.0) / COUNT(`Patient.ID`), 2) AS PercentageOfFemalesWithAbnormalTP FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.SEX` = 'F' AND (`Laboratory.TP` < 6.0 OR `Laboratory.TP` > 8.5);	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS avg_aCL_IgG FROM `Examination` WHERE `Diagnosis` LIKE '%MCTD%' AND SUBSTR(`Birthday`, 6, 2) - SUBSTR(CURRENT_DATE, 6, 2) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-';	thrombosis_prediction
SELECT      MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS YoungestAge FROM      Patient WHERE      `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND YEAR(E.Examination Date) = 1997 AND P.SEX = 'F';	thrombosis_prediction
SELECT      MAX(YEAR(P.Birthday)) - MIN(YEAR(P.Birthday)) AS AgeGap FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.TG >= 200	thrombosis_prediction
SELECT      p.`Description` AS Symptoms,      e.`Diagnosis` AS Diagnosis FROM      `Patient` p JOIN      `Examination` e ON p.`ID` = e.`ID` WHERE      p.`Birthday` = (SELECT MIN(`Birthday`) FROM `Patient` WHERE `Birthday` IS NOT NULL)     AND e.`Symptoms` IS NOT NULL;	thrombosis_prediction
SELECT      MONTH(`Date`) AS Month,      COUNT(`ID`) / 12 AS AveragePatients FROM      Laboratory WHERE      `Date` BETWEEN '1998-01-01' AND '1998-12-31'      AND `SEX` = 'M' GROUP BY      Month;	thrombosis_prediction
SELECT      p.Birthday AS InitialHospitalArrivalDate,      (SUBTRACT(year(p.Birthday), year(l.Date))) AS AgeAtArrival FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID JOIN      Examination e ON p.ID = e.ID WHERE      e.Diagnosis LIKE '%SJS%' ORDER BY      p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Patient.SEX` = 'M' AND `Laboratory.UA` <= 8.0 THEN 1 ELSE 0 END) /       SUM(CASE WHEN `Patient.SEX` = 'F' AND `Laboratory.UA` <= 6.5 THEN 1 ELSE 0 END)) AS Male_to_Female_Ratio FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID`	thrombosis_prediction
SELECT      p.ID,     p.Birthday,     p.First Date,     MIN(e.`Examination Date`) AS FirstExaminationDate FROM      Patient p LEFT JOIN      Examination e ON p.ID = e.ID WHERE      e.`Examination Date` >= DATE_ADD(p.First Date, INTERVAL 1 YEAR) GROUP BY      p.ID HAVING      FirstExaminationDate IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday < '1990-01-01' AND E.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.T_BIL >= 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(Diagnosis) AS DiagnosisCount FROM Examination WHERE ExaminationDate BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY DiagnosisCount DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(CURRENT_DATE), YEAR(`Birthday`))) AS AverageAge FROM `Patient` WHERE `ID` IN (     SELECT `ID`     FROM `Laboratory`     WHERE `Date` BETWEEN '1991-10-01' AND '1991-10-30' );	thrombosis_prediction
SELECT      (YEAR(`Examination.Date`) - YEAR(`Patient.Birthday`)) AS Age,      `Examination.Diagnosis` FROM      `Examination` JOIN      `Patient` ON `Examination.ID` = `Patient.ID` WHERE      `Examination.HGB` = (SELECT MAX(`HGB`) FROM `Examination`) ORDER BY      Age DESC LIMIT 1;	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT `T-CHO` FROM `Laboratory` WHERE `ID` = 2927464 AND `Date` = '1995-09-04' AND `T-CHO` < 250;	thrombosis_prediction
SELECT `Patient`.SEX  FROM `Patient`  JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.Diagnosis` LIKE '%AORTITIS%' ORDER BY `Examination.Examination Date` LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM `Examination` WHERE `Examination.Date` = '1993-11-12' AND `Patient.Description` = '1994-02-19' AND `Patient.Diagnosis` = 'SLE';	thrombosis_prediction
SELECT P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT = '9' AND L.Date = '1992-06-12';	thrombosis_prediction
SELECT      (YEAR('1991-10-21') - YEAR(P.Birthday)) AS Age FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.UA = '8.4' AND      L.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(`ID`) AS TotalTests FROM `Laboratory` WHERE `ID` IN (     SELECT `ID`     FROM `Patient`     WHERE `First Date` = '1991-06-13' AND `Diagnosis` = 'SJS' ) AND YEAR(`Date`) = 1995;	thrombosis_prediction
SELECT p.`Diagnosis` as OriginalDiagnosis FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE p.`First Date` = '1997-01-27' AND e.`Diagnosis` = 'SLE';	thrombosis_prediction
SELECT e.Symptoms FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01' AND e.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT     (SUM(CASE WHEN T.Date LIKE '1981-11-%' THEN T.`T-CHO` ELSE 0 END) -       SUM(CASE WHEN T.Date LIKE '1981-12-%' THEN T.`T-CHO` ELSE 0 END)) /      SUM(CASE WHEN T.Date LIKE '1981-11-%' THEN T.`T-CHO` ELSE 1 END) AS DecreaseRate FROM     Laboratory T JOIN     Patient P ON T.ID = P.ID WHERE     P.Birthday = '1959-02-18'     AND T.Date BETWEEN '1981-11-01' AND '1981-12-31';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis LIKE '%Behcet%'  AND e.Examination_Date BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND E.GPT > 30 AND E.ALB < 4;	thrombosis_prediction
SELECT `ID` FROM `Patient` WHERE `SEX` = 'F' AND YEAR(`Birthday`) = 1964 AND `Admission` = '+' ORDER BY `ID`;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND ANA = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 AND UA <= 6.5 THEN 1 END) * 100.0) /      COUNT(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 END) AS PercentageOfPatientsWithNormalProteinuriaAndLowUricAcid FROM Laboratory;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Patient.Diagnosis` = 'BEHCET' THEN 1 ELSE 0 END) / COUNT(`Patient.ID`)) * 100 AS PercentageOfMalePatientsDiagnosedWithBEHCET FROM      `Patient` WHERE      `Patient.SEX` = 'M'      AND YEAR(`Patient.First Date`) = 1981;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.First Date, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) BETWEEN 1980 AND 1989 AND ID NOT IN (     SELECT ID     FROM Examination     WHERE `ANA Pattern` = 'P' );	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(`ALB`) AS Average_Blood_Albumin FROM `Laboratory` l JOIN `Patient` p ON l.ID = p.ID WHERE p.SEX = 'F' AND p.Diagnosis = 'SLE' AND l.PLT > 400;	thrombosis_prediction
SELECT MAX(`Symptoms`) as MostCommonSymptom FROM `Examination` WHERE `Diagnosis` = 'SLE';	thrombosis_prediction
SELECT      p.Description AS FirstDocumented,     e.Diagnosis AS Disease FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.ID = 48473 ORDER BY      e.Examination_Date ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'F' AND Examination.Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE YEAR(e.`Examination Date`) = 1997 AND e.TP > 6 AND e.TP < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Symptoms` LIKE '%ITP%' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN `Diagnosis` LIKE '%SLE%' THEN 1 ELSE 0 END), 0)) * 100 AS proportion_of_thrombocytopenia_with_SLE FROM      Examination	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN YEAR(`Birthday`) = '1980' AND `Diagnosis` = 'RA' AND `SEX` = 'F' THEN 1 ELSE 0 END) * 100.0) / COUNT(`ID`), 2) AS PercentageOfWomenWithRA FROM `Patient`	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M'  AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Diagnosis LIKE '%Behcet%' AND e.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.SEX = 'F' AND Examination.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination.Date`, P.`First Date`) AS Days_Between FROM `Examination` E JOIN `Patient` P ON E.ID = P.ID WHERE P.ID = 821298;	thrombosis_prediction
SELECT      CASE          WHEN p.SEX = 'M' AND l.UA > 8.0               OR p.SEX = 'F' AND l.UA > 6.5          THEN 'Yes, uric acid is within the normal range'          ELSE 'No, uric acid is not within the normal range'      END AS Uric_Acid_Range FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID WHERE      p.ID = 57266;	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ID` = 48473 AND `GOT` >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1994 AND l.GOT < 60;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT p.`ID`, p.`Birthday`, p.`Diagnosis` FROM `Patient` p JOIN `Laboratory` l ON p.`ID` = l.`ID` WHERE l.`GPT` > 60 ORDER BY p.`Birthday` ASC;	thrombosis_prediction
SELECT AVG(LDH) AS avg_ldh FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT     P.`Admission`,     COUNT(P.`Admission`) AS TotalCount FROM     Patient P JOIN     Laboratory L ON P.ID = L.ID WHERE     L.ALP < 300 GROUP BY     P.`Admission`;	thrombosis_prediction
SELECT      p.ID  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      p.Birthday = '1982-04-01'      AND l.ALP < 300;	thrombosis_prediction
SELECT `Patient.ID`, `Patient.SEX`, `Patient.Birthday` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.TP` < 6.0;	thrombosis_prediction
SELECT     p.ID,     p.SEX,     l.TP,     l.TP - 8.5 AS TP_Deviation FROM     Patient p JOIN     Laboratory l ON p.ID = l.ID WHERE     p.SEX = 'F'     AND l.TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5) ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,     CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes'         ELSE 'No'     END AS IsAlbuminWithinNormalRange FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday BETWEEN '1982-01-01' AND '1982-12-31'	thrombosis_prediction
SELECT      ROUND(         (COUNT(CASE WHEN P.SEX = 'F' AND L.UA > 6.5 THEN 1 ELSE NULL END) * 100.0) /          COUNT(CASE WHEN P.SEX = 'F' THEN 1 ELSE NULL END),         2     ) AS PercentageOfFemalesWithHighUA FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F';	thrombosis_prediction
SELECT AVG(UA) AS Average_UA_Index FROM Laboratory WHERE (UA < 8.0 AND SEX = 'M') OR (UA < 6.5 AND SEX = 'F') AND ID IN (     SELECT ID     FROM Laboratory     WHERE UA < 8.0 AND SEX = 'M' OR UA < 6.5 AND SEX = 'F'     GROUP BY ID     ORDER BY MAX(Date) DESC ) GROUP BY ID;	thrombosis_prediction
SELECT `Patient.ID`, `Patient.SEX`, `Patient.Birthday` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.UN` = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis LIKE '%RA%' AND p.ID IN (SELECT ID FROM Laboratory WHERE UN < 30);	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5;	thrombosis_prediction
SELECT     (SUM(CASE WHEN `SEX` = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN `SEX` = 'F' THEN 1 ELSE 0 END)) AS MaleWithHighCreatinineExceedsFemale FROM     `Laboratory` WHERE     `CRE` >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory);	thrombosis_prediction
SELECT      p.SEX,      GROUP_CONCAT(DISTINCT e.ID) AS PatientIDs FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      e.T_BIL >= 2.0 GROUP BY      p.SEX;	thrombosis_prediction
SELECT p.ID, p.T-CHO FROM Patient p WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND p.T-CHO = (SELECT MAX(T-CHO) FROM Patient);	thrombosis_prediction
SELECT AVG(DIVIDE(SUBTRACT(YEAR(NOW()), YEAR(`Birthday`)), COUNT(`ID`)))  FROM `Patient`  WHERE `SEX` = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT      p.ID,     p.Diagnosis FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.TG > 300;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT `ID` FROM `Laboratory` WHERE `Admission` = '-' AND `CPK` < 250;	thrombosis_prediction
SELECT DISTINCT COUNT(`Patient`.`ID`)  FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE YEAR(`Patient`.`Birthday`) BETWEEN 1936 AND 1956 AND `Patient`.`SEX` = 'M' AND `Laboratory`.`CPK` >= 250;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.GLU >= 180      AND l.T-CHO < 250;	thrombosis_prediction
SELECT      p.ID,      lab.GLU  FROM      Patient p  JOIN      Laboratory lab  ON      p.ID = lab.ID  WHERE      lab.GLU < 180 AND      YEAR(p.Description) = 1991;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY      p.SEX, p.Birthday ORDER BY      p.SEX, p.Birthday;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age,      e.Diagnosis  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.RBC < 3.5;	thrombosis_prediction
SELECT      p.ID,     p.SEX,     p.Birthday,     p.Admission FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.SEX = 'F'      AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday)) >= 50     AND (e.RBC <= 3.5 OR e.RBC >= 6.0)	thrombosis_prediction
SELECT      p.ID,      p.SEX  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      p.Admission = '-'      AND l.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND p.Birthday = (     SELECT MIN(Birthday)     FROM Patient p2     JOIN Examination e2 ON p2.ID = e2.ID     WHERE e2.Diagnosis = 'SLE'     AND p2.Birthday > p.Birthday     AND e2.HGB > 10 AND e2.HGB < 17 ) ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      `Patient.ID`,      TIMESTAMPDIFF(YEAR, `Patient.Birthday`, CURDATE()) AS Age FROM      `Patient` JOIN      `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE      `Laboratory.HCT` >= 52 GROUP BY      `Patient.ID` HAVING      COUNT(`Laboratory.ID`) > 2;	thrombosis_prediction
SELECT AVG(HCT) as AverageHCT FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT     SUM(CASE WHEN `PLT` < 100 THEN 1 ELSE 0 END) AS 'BelowNormalRangeCount',     SUM(CASE WHEN `PLT` > 400 THEN 1 ELSE 0 END) AS 'AboveNormalRangeCount' FROM `Laboratory` WHERE `PLT` < 100 OR `PLT` > 400;	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1984 AND       (YEAR(CURRENT_DATE) - YEAR(p.Birthday)) < 50 AND       l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      ROUND(         (SUM(CASE WHEN `Patient`.`SEX` = 'F' AND `Examination`.`PT` >= 14 THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN `Examination`.`PT` >= 14 THEN 1 ELSE 0 END), 2     ) AS PercentageOfFemalesWithAbnormalPT FROM      `Patient` JOIN      `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE      `Patient`.`Birthday` <= DATE_SUB(CURDATE(), INTERVAL 55 YEAR)      AND `Examination`.`PT` >= 14;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.First_Date > '1992-01-01' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND `APTT` < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E WHERE E.APTT > 45 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.WBC > 3.5 AND e.WBC < 9.0 AND (e.FG <= 150 OR e.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`)  FROM `Patient`  JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID`  WHERE `Patient.Birthday` > '1980-01-01'  AND `Laboratory.FG` < 150 OR `Laboratory.FG` > 450;	thrombosis_prediction
SELECT DISTINCT e.Diagnosis  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE e.Diagnosis IS NOT NULL AND l.U_PRO >= 30;	thrombosis_prediction
SELECT `Patient.ID` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.U-PRO` BETWEEN 0 AND 30 AND `Examination.Diagnosis` = 'SLE';	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E WHERE E.aCL_IgG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` > 900 AND `aCL IgG` < 2000 AND `Symptoms` IS NOT NULL;	thrombosis_prediction
SELECT P.ID, E.Diagnosis FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgA BETWEEN 80 AND 500 AND E.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Examination WHERE aCL_IgA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.`First Date` >= '1990-01-01' AND e.`aCL IgA` > 80 AND e.`aCL IgA` < 500;	thrombosis_prediction
SELECT Diagnosis, MAX(COUNT(Diagnosis)) as MostCommonDisease FROM Examination WHERE `aCL IgM` <= 40 OR `aCL IgM` >= 400 GROUP BY Diagnosis ORDER BY MostCommonDisease DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE l.CRP = '+' AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRE >= 1.5 AND SUBDATE(CURDATE(), INTERVAL 70 YEAR) > p.Birthday;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE p.RA IN('-', '+-') AND e.KCT = '+';	thrombosis_prediction
SELECT DISTINCT p.ID, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday > '1985-01-01' AND e.RA IN('-', '+-');	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF IS NULL OR l.RF < 20 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.RF < 20 AND e.Thrombosis = '0';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ANA = 'P' AND l.C3 > 35;	thrombosis_prediction
SELECT `Patient`.`ID` FROM `Patient` JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE `HCT` NOT BETWEEN 29 AND 52 ORDER BY `Examination`.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.Thrombosis = 1 AND p.C4 > 10;	thrombosis_prediction
SELECT DISTINCT `Patient.ID` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.RNP` IN ('-', '+-') AND `Patient.Admission` = '+';	thrombosis_prediction
SELECT p.Birthday FROM Patient p WHERE p.ID IN (SELECT e.ID FROM Examination e WHERE e.RNP NOT IN('-', '+-') AND e.ID = p.ID) ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.SM IN('-', '+-') AND E.Thrombosis = 0;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE SM NOT IN ('negative', '0')  ORDER BY Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E WHERE E.`Examination Date` > '1997-01-01' AND E.`SC170` IN('negative', '0');	thrombosis_prediction
SELECT DISTINCT p.SEX  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'F'  AND e.SC170 IN('negative', '0')  AND e.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.SSA IN('-','+-')  AND YEAR(Patient.First Date) < 2000;	thrombosis_prediction
SELECT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.SSA` NOT IN ('negative', '0') ORDER BY `Patient.First Date` LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.SSB IN('-', '+-') AND Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'F' AND e.SSB IN ('negative', '0') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.SEX = 'M'  AND Examination.CENTROMEA IN('-', '+-')  AND Examination.SSB IN('-', '+-');	thrombosis_prediction
SELECT E.ID, P.Diagnosis FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`)  FROM `Patient`  WHERE `Patient.ID` NOT IN (     SELECT `Laboratory.ID`      FROM `Laboratory`      WHERE `Laboratory.DNA` >= 8 ) AND `Patient.Description` IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG BETWEEN 900 AND 2000 AND P.Admission = '+';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Laboratory`.GOT >= 60 AND `Examination`.Diagnosis = 'SLE' THEN 1 END) /       COUNT(CASE WHEN `Laboratory`.GOT >= 60 THEN 1 END)) * 1.0 AS SLE_Patients_Percentage FROM `Laboratory` INNER JOIN `Examination` ON `Laboratory`.ID = `Examination`.ID;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT p.Birthday  FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE l.GOT >= 60 ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT p.Birthday, MAX(l.GPT) as MaxGPT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 GROUP BY p.ID ORDER BY MaxGPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60;	thrombosis_prediction
SELECT MIN(`First Date`)  FROM `Laboratory`  WHERE `LDH` < 500  AND `ID` IN (SELECT `ID` FROM `Patient`) ORDER BY MIN(`First Date`) ASC  LIMIT 1;	thrombosis_prediction
SELECT MAX(`Date`) AS LatestMedicalDataRecorded FROM `Laboratory` WHERE `LDH` >= 500 AND `ID` IN (     SELECT `ID`     FROM `Patient`     ORDER BY `First Date` DESC     LIMIT 1 );	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE ALP >= 300 AND `Admission` = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`)  FROM `Patient`  JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID`  WHERE `Patient.Admission` = '-' AND `Laboratory.ALP` < 300;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE `ID` IN (SELECT `ID` FROM Examination WHERE `Diagnosis` = 'SJS') AND `TP` > 6.0 AND `TP` < 8.5;	thrombosis_prediction
SELECT `Examination.Date` FROM `Examination` JOIN `Laboratory` ON `Examination.ID` = `Laboratory.ID` WHERE `Laboratory.ALB` BETWEEN 3.5 AND 5.5 GROUP BY `Examination.ID`, `Examination.Date` HAVING MAX(`Laboratory.ALB`) = `Laboratory.ALB` ORDER BY `Laboratory.ALB` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE `ID` IN (SELECT `ID` FROM Patient WHERE `SEX` = 'M') AND ALB > 3.5 AND ALB < 5.5 AND TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT      E.`aCL IgG`,      E.`aCL IgM`,      E.`aCL IgA` FROM      Examination E JOIN      Patient P ON E.ID = P.ID WHERE      P.SEX = 'F'      AND P.UA > 6.50     AND P.UA = (SELECT MAX(UA) FROM Patient WHERE SEX = 'F' AND UA > 6.50)	thrombosis_prediction
SELECT MAX(`aCL IgG`) AS highest_anti_nucleus_concentration FROM `Examination` WHERE `CRE` < 1.5 AND `ANA` IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.CRE < 1.5 AND e.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Examination);	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.T_BIL >= 2.0 AND E.ANA_Pattern LIKE '%P%';	thrombosis_prediction
SELECT      E.ANA,      E.aCL_IgG,      E.aCL_IgM,      E.aCL_IgA  FROM      Examination E  JOIN      Laboratory L ON E.ID = L.ID  WHERE      E.ANA IS NOT NULL      AND L.T_BIL < 2.0      AND L.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory WHERE T_BIL < 2.0) ORDER BY      L.T_BIL DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-CHO` >= 250 AND e.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.T_CHO < 250 AND e.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.TG < 200 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.`Diagnosis` FROM `Patient` p JOIN `Examination` e ON p.`ID` = e.`ID` WHERE e.`TG` < 200 AND e.`TG` = (     SELECT MAX(TG)     FROM `Examination`     WHERE TG < 200 );	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 0 AND e.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`)  FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.Admission` = '+' AND `Laboratory.WBC` BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Diagnosis = 'SLE' AND e.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.RBC <= 3.5 OR e.RBC >= 6.0 AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.PLT > 100 AND E.PLT < 400 AND E.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT      p.ID,      e.PLT  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.Diagnosis = 'MCTD'      AND e.PLT > 100      AND e.PLT < 400;	thrombosis_prediction
SELECT AVG(`PT`) AS average_prothrombin_time FROM `Laboratory` WHERE `Patient_ID` IN (     SELECT `ID`     FROM `Patient`     WHERE `SEX` = 'M' ) AND `PT` < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis IN (1, 2) AND e.PT < 14;	thrombosis_prediction
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*) FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium';	student_club
SELECT      `event_id`,      `event_name`,      COUNT(`link_to_event`) AS attendance FROM      `event`  JOIN      `attendance` ON `event.event_id` = `attendance.link_to_event` GROUP BY      `event_id`, `event_name` ORDER BY      attendance DESC LIMIT 1;	student_club
SELECT m.link_to_major, m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT e.event_id)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Sacha'  AND m.last_name = 'Harrison'  AND e.event_date LIKE '2019%';	student_club
SELECT COUNT(*) FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 10;	student_club
SELECT event_name  FROM event  WHERE event_id IN (     SELECT link_to_event      FROM attendance      GROUP BY link_to_event      HAVING COUNT(link_to_member) > 20 ) AND type != 'Fundraiser';	student_club
SELECT AVG(attendance_count) AS average_attendance FROM (     SELECT COUNT(a.link_to_member) AS attendance_count     FROM event e     JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020     GROUP BY e.event_id ) AS subquery;	student_club
SELECT `expense_description`, MAX(`cost`) AS max_cost FROM `expense` GROUP BY `expense_description` ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT m.major_id, m.college FROM member m WHERE m.first_name = 'Tyler' AND m.last_name = 'Hewitt' LIMIT 1;	student_club
SELECT SUM(amount) AS total_funds_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President';	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT      m.zip,     z.city,     z.state FROM      member m JOIN      zip_code z ON m.zip = z.zip_code WHERE      m.position = 'President';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member WHERE zip IN (     SELECT zip_code     FROM zip_code     WHERE state = 'Illinois' );	student_club
SELECT SUM(b.spent) AS total_advertisement_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT m.link_to_major, ma.department FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Pierce' OR m.last_name = 'Guidi';	student_club
SELECT SUM(`amount`) AS total_budgeted_amount FROM `budget` WHERE `event_status` = 'Closed' AND `event_name` = 'October Speaker';	student_club
SELECT      e.event_name,      e.event_date,      e.type,      e.notes,      e.location,      e.status,      exp.expense_description,      exp.expense_date,      exp.cost,      exp.approved FROM      expense AS exp JOIN      event AS e ON exp.link_to_budget = e.event_id WHERE      e.event_name = 'October Meeting'      AND e.event_date = '2019-10-08'      AND exp.approved = 'true';	student_club
SELECT AVG(cost) AS avg_cost_spent FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE LEFT(member.first_name, 5) = 'Elijah' AND       LEFT(member.last_name, 6) = 'Allen' AND       CAST(SUBSTRING(expense.expense_date, 6, 2) AS INTEGER) IN (9, 10);	student_club
SELECT      (SUM(CASE WHEN LEFT(event_date, 4) = '2019' THEN spent ELSE 0 END) -       SUM(CASE WHEN LEFT(event_date, 4) = '2020' THEN spent ELSE 0 END)) AS total_spent_difference FROM      budget WHERE      event_status = 'Closed';	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT e.event_name, e.event_date, e.notes, e.location, e.status, e.type, SUM(e.cost) AS total_cost FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE e.event_name = 'Posters' AND e.event_date = '2019-09-04' GROUP BY e.event_id;	student_club
SELECT budget.remaining  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT notes  FROM income  WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT z.county  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE `event_status` = 'Closed' AND `event_name` = 'November Meeting' AND `remaining` < 0;	student_club
SELECT SUM(`amount`) as total_budget_amount FROM `budget` WHERE `event_status` = 'Closed' AND `event_name` = 'September Speaker';	student_club
SELECT e.status  FROM event e  JOIN expense ex ON e.event_id = ex.link_to_budget  WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Brent' AND m.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium';	student_club
SELECT zip_code.type FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';	student_club
SELECT `state`  FROM `member`  JOIN `zip_code` ON `member`.`zip` = `zip_code`.`zip_code`  WHERE `first_name` = 'Sacha' AND `last_name` = 'Harrison';	student_club
SELECT m.link_to_major, m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT `date_received` FROM `income` WHERE `source` = 'Dues' AND `link_to_member` = (     SELECT `member_id`     FROM `member`     WHERE `first_name` = 'Connor' AND `last_name` = 'Hilton' );	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /       SUM(CASE WHEN b.category = 'Advertisement' AND e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement';	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' AND e.event_name = 'November Speaker' THEN b.amount ELSE 0 END) /      (SELECT SUM(amount) FROM budget AS b2 JOIN event AS e2 ON b2.link_to_event = e2.event_id WHERE e2.event_name = 'November Speaker')) * 100 AS parking_percentage FROM      budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE      b.category = 'Parking' AND e.event_name = 'November Speaker';	student_club
SELECT SUM(cost) AS total_pizza_cost FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT expense.expense_description FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT college, COUNT(*) AS member_count FROM major JOIN member ON major.major_id = member.link_to_major GROUP BY college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.phone = '809-555-3360';	student_club
SELECT `event_name`, MAX(`amount`) AS max_budget FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` GROUP BY `event_name` ORDER BY max_budget DESC LIMIT 1;	student_club
SELECT e.expense_description, e.expense_date, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT `link_to_member`)  FROM `attendance`  JOIN `event` ON `attendance.link_to_event` = `event.event_id` WHERE `event.event_name` = 'Women''s Soccer';	student_club
SELECT date_received FROM income WHERE `link_to_member` = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason');	student_club
SELECT COUNT(*) FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland');	student_club
SELECT COUNT(DISTINCT a.link_to_event)  FROM attendance a  JOIN member m ON a.link_to_member = m.member_id  WHERE m.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event_id, event_name,         (spent / amount) AS spend_to_budget_ratio FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget WHERE event_status = 'Closed';	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(b.spent) AS total_spent_for_food FROM budget b WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT first_name, last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(`amount`) AS total_income FROM `income` JOIN `member` ON `income`.`link_to_member` = `member`.`member_id` WHERE `member`.`first_name` = 'Grant' AND `member`.`last_name` = 'Gilmour';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN event e ON m.member_id = e.event_id WHERE e.event_name = 'Yearly Kickoff' AND m.position = 'Member';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS highest_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id ORDER BY highest_income DESC LIMIT 1;	student_club
SELECT event_name, MIN(cost) AS lowest_cost FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.event_status = 'Closed' GROUP BY event_name ORDER BY lowest_cost LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN event_name = 'Yearly Kickoff' THEN cost ELSE 0 END) / SUM(cost)) * 100 AS percentage_of_yearly_kickoff_cost FROM      event	student_club
SELECT      (SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) * 1.0) /      SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS finance_to_physics_ratio FROM      major WHERE      major_name = 'Finance' OR major_name = 'Physics';	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(a.link_to_event) AS number_of_events, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' JOIN major ma ON m.link_to_major = ma.major_id GROUP BY m.member_id, ma.major_name;	student_club
SELECT AVG(spent) / COUNT(spent) AS average_spent_per_event FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1;	student_club
SELECT      COUNT(*) AS attendance_count FROM      `attendance` JOIN      `event` ON `attendance.link_to_event` = `event.event_id` JOIN      `member` ON `attendance.link_to_member` = `member.member_id` WHERE      `event.event_name` = 'Women''s Soccer'      AND `member.first_name` = 'Maya'      AND `member.last_name` = 'Mclean';	student_club
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0) / COUNT(event_id) AS percentage_of_community_service_events FROM      event WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT SUM(e.cost) AS total_cost_of_posters FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE e.event_name = 'September Speaker' AND ex.expense_description = 'Posters';	student_club
SELECT `t_shirt_size`, COUNT(`t_shirt_size`) AS size_count FROM `member` WHERE `t_shirt_size` IS NOT NULL GROUP BY `t_shirt_size` ORDER BY size_count DESC LIMIT 1;	student_club
SELECT event_name FROM event WHERE status = 'Closed' ORDER BY remaining ASC LIMIT 1;	student_club
SELECT expense.expense_description, SUM(expense.cost) AS total_value FROM expense JOIN event ON expense.link_to_budget IN (     SELECT budget_id     FROM budget     JOIN event ON budget.link_to_event = event.event_id     WHERE event.event_name = 'October Meeting' ) GROUP BY expense.expense_description;	student_club
SELECT category, SUM(amount) AS total_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY category ORDER BY total_budgeted ASC;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_parking_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) as total_expense_on_aug_20_2019 FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT      m.first_name,      m.last_name,      SUM(e.cost) AS total_cost FROM      expense e JOIN      member m ON e.link_to_member = m.member_id WHERE      e.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY      m.first_name,      m.last_name;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE first_name = 'Phillip' AND last_name = 'Cullen';	student_club
SELECT position FROM member WHERE link_to_major IN (     SELECT major_id     FROM major     WHERE major_name = 'Business' );	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium';	student_club
SELECT `event`.`type` FROM `event` JOIN `budget` ON `event`.`event_id` = `budget`.`link_to_event` WHERE `budget`.`remaining` > 30;	student_club
SELECT `event`.`type`  FROM `event`  WHERE `event`.`location` = 'MU 215';	student_club
SELECT `type` FROM `event` WHERE `event_date` = '2020-03-24T12:00:00';	student_club
SELECT m.link_to_major, m.first_name, m.last_name FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN m.position = 'Member' AND m.link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business') THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.member_id) AS percentage_business_members FROM      member m;	student_club
SELECT type  FROM event  WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM `income` WHERE `amount` = 50;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.major_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND b.spent = 0 AND e.type = 'Guest Speaker';	student_club
SELECT m.zip, z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name  FROM event e  JOIN member m ON e.event_id = (SELECT link_to_event FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE position = 'Vice President' AND zip = (SELECT zip_code FROM zip_code WHERE city = 'Student_Club' AND street = '900 E. Washington St.')) WHERE e.type = 'Social';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      (COUNT(CASE WHEN income.amount = 50 THEN 1 END) * 100.0) / COUNT(member.member_id) AS percentage_of_50_received FROM      member JOIN      income ON member.member_id = income.link_to_member WHERE      member.t_shirt_size = 'Medium' AND     member.position = 'Member'	student_club
SELECT DISTINCT z.state FROM zip_code z WHERE z.type = 'PO Box';	student_club
SELECT zc.zip_code FROM zip_code zc WHERE zc.city = 'San Juan' AND zc.county = 'San Juan Municipio' AND zc.state = 'Puerto Rico' AND zc.type = 'PO Box';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.event_id FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget JOIN member m ON ex.link_to_member = m.member_id WHERE ex.cost > 50;	student_club
SELECT      m.member_id,      m.first_name,      m.last_name,      e.event_name,      e.event_id  FROM      member m  JOIN      expense e ON m.member_id = e.link_to_member  WHERE      e.approved = 'true'      AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19'      AND EXISTS (         SELECT 1          FROM attendance a          WHERE a.link_to_member = m.member_id      );	student_club
SELECT m.link_to_major FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Agriculture and Applied Sciences' AND ma.major_name = 'Business';	student_club
SELECT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Education'  AND major.college = 'College of Education & Human Services'  AND member.position = 'Member';	student_club
SELECT      (SUM(CASE WHEN `remaining` < 0 THEN 1 ELSE 0 END) * 100.0) / COUNT(`event_id`) AS percentage_over_budget FROM      `event`	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING SUM(cost) / COUNT(expense_id) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT     (SUM(CASE WHEN `type` = 'PO Box' THEN 1 ELSE 0 END) * 100.0) / COUNT(`zip_code`) AS po_box_percentage FROM `zip_code`;	student_club
SELECT `event_name`, `location` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `budget.remaining` > 0 AND `event.status` = 'Closed';	student_club
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, m.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100;	student_club
SELECT z.city, z.county FROM event e JOIN income i ON e.event_id = i.link_to_member JOIN member m ON i.link_to_member = m.member_id JOIN zip_code z ON m.zip = z.zip_code GROUP BY e.event_id HAVING COUNT(i.income_id) > 40;	student_club
SELECT      m.member_id,      m.first_name,      m.last_name,      SUM(e.cost) AS total_expense FROM      member m JOIN      expense e ON m.member_id = e.link_to_member GROUP BY      m.member_id, m.first_name, m.last_name HAVING      COUNT(DISTINCT e.event_id) > 1 ORDER BY      total_expense DESC LIMIT 1;	student_club
SELECT AVG(TotalCost) AS AverageAmountPaid FROM (     SELECT SUM(E.cost) AS TotalCost     FROM expense E     JOIN member M ON E.link_to_member = M.member_id     WHERE M.position <> 'Member' ) AS SubQuery;	student_club
SELECT event_name FROM event JOIN expense ON event.event_id = expense.link_to_budget JOIN budget ON budget.budget_id = expense.link_to_budget WHERE budget.category = 'Parking' AND expense.cost < (SELECT SUM(cost) / COUNT(event_id) FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.category = 'Parking') GROUP BY event_name;	student_club
SELECT      (SUM(e.cost) / COUNT(e.event_id)) * 100 AS meeting_cost_percentage FROM      event e WHERE      e.type = 'Meeting';	student_club
SELECT      b.budget_id,      b.amount FROM      budget b JOIN      expense e ON b.budget_id = e.link_to_budget WHERE      e.expense_description LIKE '%Water, chips, cookies%' GROUP BY      b.budget_id ORDER BY      SUM(e.cost) DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT      m.first_name,      m.last_name,      m.phone  FROM      expense e  JOIN      member m ON e.link_to_member = m.member_id  WHERE      e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      (SUM(CASE WHEN `member.zip` IN (SELECT `zip_code` FROM `zip_code` WHERE `state` = 'New Jersey') AND `member.position` = 'Member' THEN 1 ELSE 0 END) /       (SELECT COUNT(*) FROM `member` WHERE `member.position` = 'Member')) -      (SUM(CASE WHEN `member.zip` IN (SELECT `zip_code` FROM `zip_code` WHERE `state` = 'Vermont') AND `member.position` = 'Member' THEN 1 ELSE 0 END) /       (SELECT COUNT(*) FROM `member` WHERE `member.position` = 'Member')) FROM `member`	student_club
SELECT major_name, department  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies' GROUP BY m.member_id;	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT `budget`.`category`, `budget`.`amount` FROM `event` JOIN `budget` ON `event`.`event_id` = `budget`.`link_to_event` WHERE `event`.`event_name` = 'January Speaker';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT `category` FROM `expense` WHERE `expense_description` = 'Posters' LIMIT 1;	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT      e.event_name,      SUM(b.spent) AS total_spent_on_gifts FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      b.category = 'Speaker Gifts' GROUP BY      e.event_name;	student_club
SELECT m.first_name, m.last_name, z.city FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM `member` m JOIN `zip_code` z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.short_state = 'NC' AND z.zip_code = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND `Segment` = 'Premium';	debit_card_specializing
SELECT      (COUNT(*) FILTER (WHERE `Currency` = 'EUR')) /      (COUNT(*) FILTER (WHERE `Currency` = 'CZK')) AS Ratio_EUR_to_CZK FROM      `customers`;	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM') AND Date BETWEEN '201201' AND '201212' ORDER BY Consumption LIMIT 1;	debit_card_specializing
SELECT AVG(`Consumption`) / 12 AS `Average_Monthly_Consumption` FROM `yearmonth` WHERE `CustomerID` IN (SELECT `CustomerID` FROM `customers` WHERE `Segment` = 'SME') AND `Date` BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'CZK' AND ym.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY SUM(ym.Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date BETWEEN '201201' AND '201212' AND ym.Consumption < 30000 AND c.Segment = 'KAM';	debit_card_specializing
SELECT      (SUM(CASE WHEN ym.Date BETWEEN '201201' AND '201212' AND c.Currency = 'CZK' THEN ym.Consumption ELSE 0 END) -      SUM(CASE WHEN ym.Date BETWEEN '201201' AND '201212' AND c.Currency = 'EUR' THEN ym.Consumption ELSE 0 END)) AS CZK_to_EUR_consumption_difference FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      ym.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT      strftime('%Y', `yearmonth.Date`) AS `Year`,      SUM(`yearmonth.Consumption`) AS `TotalConsumption` FROM      `yearmonth` JOIN      `customers` ON      `yearmonth.CustomerID` = `customers.CustomerID` WHERE      `customers.Currency` = 'EUR' GROUP BY      `Year` ORDER BY      `TotalConsumption` DESC LIMIT      1;	debit_card_specializing
SELECT `Segment`, SUM(`Consumption`) as TotalConsumption FROM `yearmonth` JOIN `customers` ON `yearmonth.CustomerID` = `customers.CustomerID` GROUP BY `Segment` ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT      LEFT(Date, 4) AS Year,     SUM(Consumption) AS TotalConsumption FROM      yearmonth WHERE      Country = 'CZE' GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date AS PeakMonth, Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
WITH SME_Avg AS (     SELECT AVG(Consumption) AS AvgConsumption     FROM yearmonth     WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME')       AND Date BETWEEN '201301' AND '201312'     GROUP BY CustomerID     ORDER BY Consumption ASC     LIMIT 1 ), LAM_Avg AS (     SELECT AVG(Consumption) AS AvgConsumption     FROM yearmonth     WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM')       AND Date BETWEEN '201301' AND '201312'     GROUP BY CustomerID     ORDER BY Consumption ASC     LIMIT 1 ), KAM_Avg AS (     SELECT AVG(Consumption) AS AvgConsumption     FROM yearmonth     WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM')       AND Date BETWEEN '201301' AND '201312'     GROUP BY CustomerID     ORDER BY Consumption ASC     LIMIT 1 ), Differences AS (     SELECT         (SELECT AvgConsumption FROM SME_Avg) - (SELECT AvgConsumption FROM LAM_Avg) AS SME_LAM_Diff,         (SELECT AvgConsumption FROM LAM_Avg) - (SELECT AvgConsumption FROM KAM_Avg) AS LAM_KAM_Diff,         (SELECT AvgConsumption FROM KAM_Avg) - (SELECT AvgConsumption FROM SME_Avg) AS KAM_SME_Diff ) SELECT * FROM Differences;	debit_card_specializing
SELECT      Segment,      MAX(PercentageIncrease) AS MaxPercentageIncrease,     MIN(PercentageIncrease) AS MinPercentageIncrease FROM (     SELECT          c.Segment,          (y2013.Consumption - y2012.Consumption) / y2013.Consumption * 100 AS PercentageIncrease     FROM          customers c     JOIN          yearmonth y2012 ON c.CustomerID = y2012.CustomerID AND LEFT(y2012.Date, 4) = '2012'     JOIN          yearmonth y2013 ON c.CustomerID = y2013.CustomerID AND LEFT(y2013.Date, 4) = '2013'     WHERE          c.Currency = 'EUR' AND c.Segment IN ('SME', 'LAM') ) AS SubQuery GROUP BY      Segment;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `CustomerID` = 6 AND `Date` BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount')     -     (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS DiscountGasStationsDifference;	debit_card_specializing
SELECT      (SELECT Consumption FROM `yearmonth` WHERE `CustomerID` = 7 AND `Date` = '201304') -      (SELECT Consumption FROM `yearmonth` WHERE `CustomerID` = 5 AND `Date` = '201304') AS DifferenceInConsumption	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') -      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR')      AS More_SMEs_Paying_CZK;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,      SUM(y.Consumption) AS TotalConsumption FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Segment = 'KAM' GROUP BY      c.CustomerID ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(yearmonth.Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'KAM' AND yearmonth.Date = '201305';	debit_card_specializing
SELECT      (COUNT(*) FILTER (WHERE Consumption > 46.73) * 100.0 / COUNT(*)) AS PercentageOfLAMCustomersConsumedMoreThan4673 FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'LAM' );	debit_card_specializing
SELECT `Country`, COUNT(`GasStationID`) as TotalValueForMoneyStations FROM `gasstations` WHERE `Segment` = 'Value for money' GROUP BY `Country` ORDER BY TotalValueForMoneyStations DESC LIMIT 1;	debit_card_specializing
SELECT     (SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS EuroPaymentPercentage FROM     customers c WHERE     c.Segment = 'KAM';	debit_card_specializing
SELECT      ROUND(         (COUNT(*) * 100.0) /          (SELECT COUNT(*) FROM `yearmonth` WHERE LEFT(`Date`, 6) = '201202'),          2     ) AS PercentageConsumedMoreThan5283 FROM      `yearmonth` WHERE      `Date` = '201202' AND      `Consumption` > 528.3;	debit_card_specializing
SELECT      (COUNT(CASE WHEN g.Country = 'SLO' AND g.Segment = 'Premium' THEN 1 END) * 100.0) / COUNT(*) AS PercentageOfPremiumGasStations FROM gasstations g;	debit_card_specializing
SELECT `CustomerID`, SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `Date` = '201309' GROUP BY `CustomerID` ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT `customers`.`Segment`, SUM(`yearmonth`.`Consumption`) AS `TotalConsumption` FROM `customers` JOIN `yearmonth` ON `customers`.`CustomerID` = `yearmonth`.`CustomerID` WHERE `yearmonth`.`Date` = '201309' GROUP BY `customers`.`Segment` ORDER BY `TotalConsumption` ASC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,     c.Segment,     ym.Consumption FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      c.Segment = 'SME'      AND ym.Date = '201206' ORDER BY      ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012';	debit_card_specializing
SELECT      ym.CustomerID,     MAX(ym.Consumption) AS MaxMonthlyConsumption FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      ym.CustomerID ORDER BY      MaxMonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE y.Date LIKE '201309%'	debit_card_specializing
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID WHERE LEFT(ym.Date, 6) = '201306';	debit_card_specializing
SELECT DISTINCT gs.ChainID FROM gasstations gs JOIN transactions_1k t ON gs.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID WHERE t.Currency = 'EUR';	debit_card_specializing
SELECT AVG(`Price` * `Amount`) AS AverageTotalPrice FROM `transactions_1k` WHERE `Date` LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(DISTINCT ym.CustomerID)  FROM yearmonth ym  JOIN customers c ON ym.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(`Price` * `Amount`) AS `AverageTotalPrice` FROM `transactions_1k` INNER JOIN `gasstations` ON `transactions_1k`.`GasStationID` = `gasstations`.`GasStationID` WHERE `gasstations`.`Country` = 'CZE';	debit_card_specializing
SELECT AVG(`Price` * `Amount`) AS AverageTotalPrice FROM `transactions_1k` WHERE `CustomerID` IN (     SELECT `CustomerID`     FROM `customers`     WHERE `Currency` = 'EUR' );	debit_card_specializing
SELECT      t.CustomerID,     SUM(t.Amount * t.Price) AS TotalAmount FROM      transactions_1k t WHERE      t.Date = '2012-08-25' GROUP BY      t.CustomerID ORDER BY      TotalAmount DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-23';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND       (SELECT Currency FROM customers WHERE customers.CustomerID = transactions_1k.CustomerID) = 'CZK';	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT `ProductID` FROM `transactions_1k` WHERE `Date` = '2012-08-23' AND `Time` = '21:20:00';	debit_card_specializing
SELECT      ym.Consumption AS Jan2012_Expenses,      ym.Date AS Jan2012_Date FROM      `yearmonth` ym WHERE      ym.CustomerID = (SELECT `CustomerID` FROM `transactions_1k` t1k WHERE t1k.Price = 124.05 AND t1k.Date = '2012-08-24')     AND ym.Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Date = '2012-08-26' AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.CardID = 667467;	debit_card_specializing
SELECT c.Country  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE ym.Consumption = 548.4 AND ym.Date = '2012-08-24';	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0) / COUNT(*) FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      ym.Date = '2012-08-25';	debit_card_specializing
SELECT      ((y2012 - y2013) / y2012) * 100 AS ConsumptionDecreaseRate FROM (     SELECT          (SELECT Consumption FROM yearmonth WHERE CustomerID = c.CustomerID AND Date = '201208') AS y2012,         (SELECT Consumption FROM yearmonth WHERE CustomerID = c.CustomerID AND Date = '201309') AS y2013     FROM customers c     WHERE c.CustomerID = (         SELECT CustomerID FROM transactions_1k          WHERE Date = '2012-08-25' AND Amount * Price = 634.8     ) );	debit_card_specializing
SELECT GasStationID, SUM(`Price` * `Amount`) AS Revenue FROM `transactions_1k` JOIN `gasstations` ON `transactions_1k.GasStationID` = `gasstations.GasStationID` GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1;	debit_card_specializing
SELECT      (COUNT(CASE WHEN g.Segment = 'Premium' THEN 1 END) * 100.0) / COUNT(*) AS Premium_Percentage FROM      gasstations g JOIN      customers c ON g.Segment = c.Segment WHERE      g.Country = 'SVK';	debit_card_specializing
SELECT SUM(`Price` * `Amount`) AS TotalSpent FROM `transactions_1k` WHERE `CustomerID` = 38508;  SELECT SUM(`Consumption`) AS TotalSpentInJanuary FROM `yearmonth` WHERE `CustomerID` = 38508 AND `Date` = '201201';	debit_card_specializing
SELECT p.Description AS ProductName, SUM(t.Amount * t.Price) AS TotalSales FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY p.Description ORDER BY TotalSales DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,      AVG(t.Price) AS AveragePricePerItem,      c.Currency FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      c.CustomerID ORDER BY      SUM(t.Price * t.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym WHERE ym.Date = '201208' AND EXISTS (     SELECT 1     FROM transactions_1k t1     JOIN customers c ON t1.CustomerID = c.CustomerID     WHERE t1.ProductID = 5     AND t1.Price / t1.Amount > 29.00     AND t1.CustomerID = ym.CustomerID );	debit_card_specializing
