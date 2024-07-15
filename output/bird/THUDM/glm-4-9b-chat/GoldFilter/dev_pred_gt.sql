SELECT      MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS `Highest Eligible Free Rate` FROM      `frpm` WHERE      `County Name` = 'Alameda';	california_schools
SELECT `Educational Option Type`,         (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS Free_Rate FROM `frpm` WHERE `Educational Option Type` = 'Continuation' ORDER BY Free_Rate ASC LIMIT 3;	california_schools
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`District Name` = 'Fresno County Office of Education';	california_schools
SELECT s.`MailStreet` FROM `frpm` f JOIN `schools` s ON f.CDSCode = s.CDSCode ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 1;	california_schools
SELECT s.Phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f."Charter School (Y/N)" = 1 AND f."Charter Funding Type" = 'Directly funded' AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores AS sc JOIN schools AS s ON sc.cds = s.CDSCode WHERE sc.AvgScrMath > 400 AND s.Virtual = 'F';	california_schools
SELECT s.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumGE1500 IS NOT NULL AND sc.NumGE1500 > 1500 ORDER BY sc.NumGE1500 DESC LIMIT 1;	california_schools
SELECT s.NumTstTakr  FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.FRPM_Count_(K-12) = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm);	california_schools
SELECT COUNT(DISTINCT frpm.CDSCode) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm."Charter Funding Type" = 'Directly funded' AND satscores.AvgScrMath > 560;	california_schools
SELECT frpm.FRPM_Count_(Ages_5_17) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores);	california_schools
SELECT `CDSCode` FROM `frpm` WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)`) / `Enrollment (Ages 5-17)` AS highest_free_rate FROM `frpm` WHERE `CDSCode` IN (     SELECT `CDSCode`     FROM `satscores`     WHERE `NumGE1500` / `NumTstTakr` > 0.3 );	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumTstTakr IS NOT NULL AND sc.NumGE1500 IS NOT NULL ORDER BY (sc.NumGE1500 / NULLIF(sc.NumTstTakr, 0)) DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT s.District, AVG(sc.AvgScrRead) AS AvgScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.StatusType = 'Active' AND sc.AvgScrRead IS NOT NULL GROUP BY s.District ORDER BY AvgScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100;	california_schools
SELECT s.CDSCode, s.CharterNum, AVG(s.AvgScrWrite) AS AvgWriteScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL GROUP BY s.CDSCode, s.CharterNum ORDER BY AvgWriteScore DESC;	california_schools
SELECT COUNT(*) FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Fresno' AND schools.FundingType = 'Directly funded' AND satscores.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Amador' AND frpm.Low_Grade = '9' AND frpm.High_Grade = '12';	california_schools
SELECT COUNT(*) FROM frpm WHERE `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700 AND `County Name` = 'Los Angeles';	california_schools
SELECT sname, MAX(`NumTstTakr`) AS MaxTakers FROM satscores WHERE `cname` = 'Contra Costa' GROUP BY sname ORDER BY MaxTakers DESC LIMIT 1;	california_schools
SELECT s.School, s.StreetAbr FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT `School Name` FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE (`Free Meal Count (K-12)` / `Enrollment (K-12)`) > 0.1 AND EXISTS (     SELECT 1     FROM `satscores`     WHERE `satscores.cds` = `schools.CDSCode`     AND `satscores.NumGE1500` >= 1500 )	california_schools
SELECT      s.`sname`,      f.`Charter Funding Type` FROM      `schools` s JOIN      (SELECT           `cds`,           AVG(`AvgScrMath`) AS avg_math      FROM           `satscores`      WHERE           `AvgScrMath` IS NOT NULL      GROUP BY           `cds`      HAVING           avg_math > 400) AS avg_scores ON      s.`CDSCode` = avg_scores.`cds` JOIN      `frpm` f ON      s.`CDSCode` = f.`CDSCode` WHERE      s.`District Name` = 'Riverside';	california_schools
SELECT      frpm.School Name,      schools.Street,      schools.City,      schools.State,      schools.Zip  FROM      frpm  JOIN      schools ON frpm.CDSCode = schools.CDSCode  WHERE      frpm.School Type = 'High Schools (Public)'      AND frpm.Free Meal Count (Ages 5-17) > 800      AND schools.County = 'Monterey';	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (s.OpenDate > '1991-01-01' OR (s.ClosedDate < '2000-01-01' AND s.ClosedDate IS NOT NULL));	california_schools
SELECT      s.School,      s.DOC  FROM      schools AS s  JOIN      (SELECT           `CDSCode`,           (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) AS diff       FROM           frpm       WHERE           `CDSCode` IN (SELECT `CDSCode` FROM schools WHERE `FundingType` = 'Directly funded')     ) AS diff_frpm  ON      s.CDSCode = diff_frpm.CDSCode  WHERE      diff_frpm.diff > (SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)                        FROM frpm                        WHERE `CDSCode` IN (SELECT `CDSCode` FROM schools WHERE `FundingType` = 'Directly funded'))	california_schools
SELECT `schools`.`OpenDate` FROM `schools` INNER JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode` WHERE `frpm`.`Enrollment (K-12)` = (     SELECT MAX(`frpm`.`Enrollment (K-12)`)     FROM `frpm` ) AND `schools`.`CDSCode` IS NOT NULL ORDER BY `schools`.`OpenDate` LIMIT 1;	california_schools
SELECT s.City, MIN(f.Enrollment (K-12)) as MinEnrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode GROUP BY s.City ORDER BY MinEnrollment ASC LIMIT 5;	california_schools
SELECT `Free Meal Count (K-12)`, `Enrollment (K-12)`, (`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS Eligible_Free_Rate FROM `frpm` ORDER BY `Enrollment (K-12)` DESC LIMIT 11 OFFSET 9;	california_schools
SELECT      s.CDSCode,      (f.FRPM_Count_K_12 / f.Enrollment_K_12) AS Eligible_Free_or_Reduced_Price_Meal_Rate FROM      frpm f INNER JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.SOC = '66' ORDER BY      f.FRPM_Count_K_12 DESC LIMIT 5;	california_schools
SELECT s.`Website`, f.`School Name` FROM `frpm` f JOIN `schools` s ON f.CDSCode = s.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT      (t1.`Free Meal Count (Ages 5-17)`) / (t1.`Enrollment (Ages 5-17)`) AS FreeRate FROM      frpm AS t1 JOIN      schools AS t2 ON t1.CDSCode = t2.CDSCode WHERE      t2.AdmFName1 = 'Kacey' AND t2.AdmLName1 = 'Gibson';	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`Enrollment (K-12)` = (SELECT MIN(`Enrollment (K-12)`) FROM frpm WHERE `Charter School (Y/N)` = 1);	california_schools
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 > 0 GROUP BY s.CDSCode ORDER BY SUM(ss.NumGE1500) DESC LIMIT 1;	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumGE1500 IS NOT NULL AND sc.NumTstTakr > 0 ORDER BY (sc.NumGE1500 / sc.NumTstTakr) ASC LIMIT 1;	california_schools
SELECT `schools`.`Website` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `schools`.`County` = 'Los Angeles' AND `satscores`.`NumTstTakr` BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(`NumTstTakr`) AS average_test_takers FROM `satscores` JOIN `schools` ON `satscores`.`cds` = `schools`.`CDSCode` WHERE `schools`.`County` = 'Fresno' AND YEAR(`schools`.`OpenDate`) = 1980;	california_schools
SELECT `schools`.`Phone` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `schools`.`District` = 'Fresno Unified' ORDER BY `satscores`.`AvgScrRead` ASC LIMIT 1;	california_schools
SELECT      s.School  FROM      frpm f  JOIN      schools s ON f.CDSCode = s.CDSCode  WHERE      s.Virtual = 'F'      AND f.AvgScrRead IS NOT NULL      AND f.AvgScrRead >= (         SELECT              MAX(f2.AvgScrRead)          FROM              frpm f2          JOIN              schools s2 ON f2.CDSCode = s2.CDSCode          WHERE              s2.Virtual = 'F'              AND f2.AvgScrRead IS NOT NULL              AND f.County = s2.County          GROUP BY              s2.County          ORDER BY              MAX(f2.AvgScrRead) DESC          LIMIT 5     ) ORDER BY      f.County,      f.AvgScrRead DESC;	california_schools
SELECT s.`EdOpsName`  FROM `satscores` AS sm  JOIN `schools` AS s ON sm.cds = s.CDSCode  WHERE sm.AvgScrMath = (SELECT MAX(`AvgScrMath`) FROM `satscores`);	california_schools
SELECT      s.County,      AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS TotalAvgScore FROM      satscores s JOIN      schools sch ON s.cds = sch.CDSCode GROUP BY      s.cds ORDER BY      TotalAvgScore ASC LIMIT 1;	california_schools
SELECT s.City, AVG(s.AvgScrWrite) AS AvgWritingScore FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.NumGE1500 = (     SELECT MAX(NumGE1500)     FROM satscores )	california_schools
SELECT      s.School,      AVG(sc.AvgScrWrite) AS AvgWritingScore FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY      s.School;	california_schools
SELECT s.School, SUM(f.Enrollment (K-12)) AS TotalEnrollment FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.DOC = '31' GROUP BY s.School ORDER BY TotalEnrollment DESC LIMIT 1;	california_schools
SELECT      COUNT(*) / 12 AS MonthlyAverageSchools FROM      schools WHERE      `County` = 'Alameda'      AND `DOC` = '52'      AND YEAR(`OpenDate`) = 1980;	california_schools
SELECT      (COUNT(CASE WHEN `DOC` = '54' THEN 1 END) * 1.0) /      COUNT(CASE WHEN `DOC` = '52' THEN 1 END) AS Ratio FROM      `schools` WHERE      `DOC` IN ('52', '54')	california_schools
SELECT County, School, ClosedDate  FROM schools  WHERE StatusType = 'Closed' GROUP BY County  ORDER BY COUNT(*) DESC  LIMIT 1;	california_schools
SELECT s.Street, s.StreetAbr, s.City, s.Zip, s.State, s.School FROM schools s JOIN (     SELECT sname, AVGScrMath     FROM satscores sc     JOIN schools s ON sc.sname = s.School     WHERE AVGScrMath IS NOT NULL     ORDER BY AVGScrMath DESC     LIMIT 6, 1 ) AS top6math ON s.School = top6math.sname;	california_schools
SELECT s.MailStreet, s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrRead = (     SELECT MIN(AvgScrRead)     FROM satscores )	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores sc JOIN schools s ON sc.cds = s.CDSCode WHERE (sc.AvgScrRead + sc.AvgScrMath + sc.AvgScrWrite) >= 1500 AND s.MailCity = 'Lakeport';	california_schools
SELECT SUM(s.NumTstTakr) AS TotalTestTakers FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.MailCity = 'Fresno';	california_schools
SELECT `School`, `MailZip` FROM `schools` WHERE `AdmFName1` = 'Avetik' AND `AdmLName1` = 'Atoian';	california_schools
SELECT      (SELECT COUNT(*) FROM `schools` WHERE `County` = 'Colusa' AND `MailState` = 'CA') /      (SELECT COUNT(*) FROM `schools` WHERE `County` = 'Humboldt' AND `MailState` = 'CA') AS Ratio;	california_schools
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds ORDER BY sc.AvgScrWrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT `Phone`, `Ext`, `School` FROM `schools` WHERE `Zip` = '95203-3704';	california_schools
SELECT `Website` FROM `schools` WHERE `AdmFName1` = 'Mike Larson' OR `AdmLName1` = 'Mike Larson' OR `AdmFName1` = 'Dante Alvarez' OR `AdmLName1` = 'Dante Alvarez';	california_schools
SELECT Website FROM schools WHERE County = 'San Joaquin' AND Charter = 1 AND Virtual = 'P';	california_schools
SELECT COUNT(*) FROM schools WHERE `City` = 'Hickman' AND `Charter` = 1 AND `DOC` = 52;	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Los Angeles' AND schools.Charter = 0 AND (`Free Meal Count (K-12)` * 100 / `Enrollment (K-12)`) < 0.18;	california_schools
SELECT `School`, `City`, CONCAT(`AdmFName1`, ' ', `AdmLName1`) AS `AdminName` FROM `schools` WHERE `Charter` = 1 AND `CharterNum` = '00D2';	california_schools
SELECT COUNT(*) FROM `schools` WHERE `MailCity` = 'Hickman' AND `CharterNum` = '00D4';	california_schools
SELECT      ROUND(         (COUNT(CASE WHEN `FundingType` = 'Locally funded' THEN 1 END) / COUNT(*) * 100),         2     ) AS PercentageLocallyFunded FROM      `schools` WHERE      `County` = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools WHERE `OpenDate` BETWEEN '2000-01-01' AND '2005-12-31' AND `FundingType` = 'Directly Funded' AND `County` = 'Stanislaus';	california_schools
SELECT COUNT(*) FROM schools WHERE School LIKE '%Community College%'   AND City = 'San Francisco'   AND YEAR(ClosedDate) = 1989;	california_schools
SELECT County, COUNT(*) AS ClosureCount FROM schools WHERE StatusType = 'Closed'   AND SOC = '11'   AND YEAR(ClosedDate) BETWEEN 1980 AND 1989 GROUP BY County ORDER BY ClosureCount DESC LIMIT 1;	california_schools
SELECT `NCESDist` FROM `schools` WHERE `SOC` = '31';	california_schools
SELECT COUNT(*)  FROM `schools`  WHERE `StatusType` IN ('Active', 'Closed')    AND `School` = 'Alpine District Community Day School';	california_schools
SELECT `District Code` FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE `schools.City` = 'Fresno' AND `schools.Magnet` = 0;	california_schools
SELECT SUM(`Enrollment (Ages 5-17)`)  FROM `frpm`  JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`  WHERE `schools`.`City` = 'Fremont' AND `schools`.`EdOpsCode` = 'SSS' AND `frpm`.`Academic Year` = '2014-2015';	california_schools
SELECT frpm.FRPM_Count__Ages_5_17  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.SOCType = 'Youth Authority School' AND schools.MailStreet = 'PO Box 1040';	california_schools
SELECT MIN(`Low Grade`) AS Lowest_Grade FROM frpm WHERE `Educational Option Type` = 'SPECON' AND `District Code` = (SELECT `District Code` FROM schools WHERE `NCESDist` = '0613360');	california_schools
SELECT      s.EILName AS EducationalLevelName,      s.School AS SchoolName FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.`NSLP Provision Status` = '01' AND     f.`County Code` = '37' AND     f.CDSCode = '01100170123968';	california_schools
SELECT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.NSLP_Provision_Status = 'Lunch Provision 2' AND f.Low_Grade = '9' AND f.High_Grade = '12' AND s.EILCode = 'HS' AND s.County = 'Merced';	california_schools
SELECT      s.School,      (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)` * 100) AS 'Percent (%) Eligible FRPM (Ages 5-17)' FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.County = 'Los Angeles' AND      s.GSserved LIKE '%K-9%'	california_schools
SELECT `GSserved`, COUNT(*) as frequency FROM `schools` WHERE `City` = 'Adelanto' GROUP BY `GSserved` ORDER BY frequency DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE Virtual = 'N' GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1;	california_schools
SELECT `schools.CDSCode`, `School Type`, `Latitude` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` ORDER BY `Latitude` DESC LIMIT 1;	california_schools
SELECT      s.City,      f.`School Name`,      f.`Low Grade` FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.State = 'CA' ORDER BY      s.Latitude ASC LIMIT 1;	california_schools
SELECT `GSoffered` FROM `schools` WHERE ABS(SUBSTRING_INDEX(`GSoffered`, '-', 1) - 0) =      (SELECT MAX(ABS(SUBSTRING_INDEX(`GSoffered`, '-', 1) - 0))      FROM `schools`)	california_schools
SELECT      s.City,      COUNT(f.CDSCode) AS NumberOfSchools FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.Magnet = 1 AND s.GSoffered = 'K-8' GROUP BY      s.City;  SELECT      f.CDSCode FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.Magnet = 1 AND s.GSoffered = 'K-8' AND f.NSLP Provision Status = 'Multiple Provision Types';	california_schools
SELECT District, AdmFName1, COUNT(*) as Count FROM schools WHERE AdmFName1 IS NOT NULL GROUP BY District, AdmFName1 ORDER BY Count DESC LIMIT 2;	california_schools
SELECT     s.`District Code`,     ROUND((f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) * 100, 2) AS Percent_Eligible_Free FROM     frpm f JOIN     schools s ON f.CDSCode = s.CDSCode WHERE     s.AdmFName1 = 'Alusine';	california_schools
SELECT      `District`,      `County`,      `School`,      `AdmLName1` FROM      `schools` WHERE      `CharterNum` = '40';	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino'   AND District = 'San Bernardino City Unified'   AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'   AND (SOC = '62' OR DOC = '54')   AND (SchoolType = 'Intermediate/Middle Schools' OR SchoolType = 'Unified Schools');	california_schools
SELECT s.AdmEmail1, s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 >= 1500 ORDER BY ss.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND a.account_id IN (SELECT account_id FROM loan);	financial
SELECT   CASE      WHEN AVG(A12) > AVG(A13) THEN '1995'     ELSE '1996'   END AS higher_unemployment_year FROM district;	financial
SELECT COUNT(DISTINCT d.district_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000;	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id AND c.gender = 'F' JOIN district d ON a.district_id = d.district_id ORDER BY c.birth_date ASC LIMIT 1;  SELECT (SELECT AVG(d.A11) FROM district d JOIN account a ON d.district_id = a.district_id         JOIN client c ON a.district_id = c.district_id         WHERE c.gender = 'F' ORDER BY c.birth_date ASC LIMIT 1) -         (SELECT AVG(d.A11) FROM district d JOIN account a ON d.district_id = a.district_id         JOIN client c ON a.district_id = c.district_id         WHERE c.gender = 'F' ORDER BY c.birth_date DESC LIMIT 1) AS salary_gap;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE district_id = d.district_id ) ORDER BY d.A11 DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'DISPONOVANI' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, MIN(l.amount) AS min_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE YEAR(l.date) = 1997 AND a.frequency = 'POPLATEK TYDNE' GROUP BY a.account_id ORDER BY min_amount LIMIT 1;	financial
SELECT account_id FROM loan WHERE duration > 12   AND account_id IN (SELECT account_id FROM account WHERE year(account_opening_date) = 1993) ORDER BY amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov';	financial
SELECT DISTINCT account_id FROM trans WHERE date BETWEEN '1995-01-01' AND '1995-12-31' GROUP BY account_id HAVING MIN(date) = date;	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.amount > 3000 GROUP BY a.account_id;	financial
SELECT d.client_id FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.issued = '1994-03-03';	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14' LIMIT 1;	financial
SELECT a.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date = '1994-08-25' AND l.date = '1994-08-25';	financial
SELECT MAX(amount) AS max_amount FROM trans WHERE account_id = (     SELECT account_id     FROM account     WHERE date = '1996-10-21' )	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND d.A11 = (SELECT MAX(A11) FROM district);	financial
SELECT a.account_id, MIN(t.amount) AS first_transaction_amount FROM account a JOIN loan l ON a.account_id = l.account_id JOIN trans t ON a.account_id = t.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) AND t.date = (SELECT MIN(date) FROM trans WHERE account_id = l.account_id) GROUP BY a.account_id;	financial
SELECT COUNT(*) FROM `client` c JOIN `district` d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT d.disp_id FROM disp d JOIN trans t ON d.account_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(*)  FROM `account`  JOIN `district` ON `account.district_id` = `district.district_id` WHERE `district.A2` = 'Litomerice' AND YEAR(`account.date`) = 1996;	financial
SELECT d.A2 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29';	financial
SELECT c.birth_date  FROM client c  JOIN loan l ON c.district_id = l.account_id  WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT account_id  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague'  ORDER BY date ASC  LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(*) AS male_client_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'south Bohemia' ORDER BY      d.A4 DESC LIMIT 1;	financial
SELECT      (MAX(trans.balance) - MIN(trans.balance)) / MIN(trans.balance) * 100 AS increase_rate FROM      trans JOIN      loan ON trans.account_id = loan.account_id JOIN      client ON loan.account_id IN (SELECT account_id FROM account WHERE date = '1993-07-05') WHERE      trans.date BETWEEN '1993-03-22' AND '1998-12-27' GROUP BY      trans.account_id;	financial
SELECT     ROUND((SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) * 100.0 / SUM(amount)), 2) AS percentage_fully_paid FROM     loan;	financial
SELECT      CAST(SUM(CASE WHEN amount < 100000 AND status = 'C' THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN amount < 100000 THEN 1 ELSE 0 END) * 100 AS percentage_of_accounts_running_no_issue FROM      loan;	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'east Bohemia' AND YEAR(a.date) BETWEEN 1995 AND 2000;	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2, d.A3  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A2 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60;	financial
SELECT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_rate FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'D';	financial
SELECT     (SUM(CASE WHEN a.district_id = d.district_id THEN 1 ELSE 0 END) * 100.0) / COUNT(a.account_id) AS percentage FROM     account a JOIN     district d ON a.district_id = d.district_id WHERE     a.date BETWEEN '1993-01-01' AND '1993-12-31'     AND d.A2 = 'Decin';	financial
SELECT account_id FROM account WHERE account_id IN (     SELECT account_id     FROM some_other_table     WHERE issuance_type = 'POPLATEK MESICNE'     GROUP BY account_id, YEAR(issue_date), MONTH(issue_date)     HAVING COUNT(*) > 0 );	financial
SELECT d.A2 AS district, COUNT(c.client_id) AS female_account_holders FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2 AS District, SUM(t.account) AS TotalWithdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND a.date LIKE '1996-01%' AND t.account IS NOT NULL GROUP BY d.A2 ORDER BY TotalWithdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT d.client_id) FROM client c JOIN district d ON c.district_id = d.district_id LEFT JOIN disp disp ON c.client_id = disp.client_id AND disp.type = 'OWNER' WHERE d.A3 = 'South Bohemia' AND disp.client_id IS NULL;	financial
SELECT d.A3, SUM(l.amount) AS total_active_loan FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY total_active_loan DESC LIMIT 1;	financial
SELECT AVG(amount)  FROM loan  JOIN client ON loan.account_id = client.account_id  WHERE client.gender = 'M';	financial
SELECT A2, `district_id` FROM district WHERE A13 = (SELECT MAX(A13) FROM district);	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (SELECT MAX(A16) FROM district);	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND t.operation = 'VYBER KARTOU' AND t.balance < 0;	financial
SELECT COUNT(DISTINCT l.account_id)  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE a.frequency = 'POPLATEK MESICNE'  AND l.amount >= 250000  AND l.date BETWEEN '1995-01-01' AND '1997-12-31';	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.district_id = 1 AND (l.status = 'C' OR l.status = 'D');	financial
SELECT COUNT(c.client_id)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A15 = (     SELECT A15      FROM district      WHERE A15 < (SELECT MAX(A15) FROM district)     ORDER BY A15 DESC      LIMIT 1 ) AND c.gender = 'M';	financial
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER';	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Pisek';	financial
SELECT d.district_id FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY d.district_id HAVING SUM(t.amount) > 10000;	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.k_symbol = 'SIPO' AND a.district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek');	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold';	financial
SELECT AVG(amount)  FROM trans  WHERE date >= '2021-01-01' AND date < '2022-01-01'  AND operation = 'VYBER KARTOU' AND account_id IN (SELECT account_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card));	financial
SELECT DISTINCT account.account_id FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.date BETWEEN '1998-01-01' AND '1998-12-31' AND trans.type = 'PRIJEM' AND trans.operation = 'VYBER KARTOU' AND trans.amount < (SELECT AVG(trans.amount) FROM trans WHERE trans.date BETWEEN '1998-01-01' AND '1998-12-31' AND trans.type = 'PRIJEM' AND trans.operation = 'VYBER KARTOU');	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F';	financial
SELECT COUNT(*) FROM `client` WHERE `gender` = 'F' AND `district_id` IN (     SELECT `district_id`     FROM `district`     WHERE `A3` = 'south Bohemia' );	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp b ON a.account_id = b.account_id WHERE d.A2 = 'Tabor' AND b.type = 'OWNER';	financial
SELECT d.type, d.A11 FROM disp AS d JOIN account AS a ON d.account_id = a.account_id JOIN district AS dt ON a.district_id = dt.district_id WHERE d.type != 'OWNER' AND dt.A11 BETWEEN 8000 AND 9000;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(d.A15) as avg_crimes FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1995 AND d.A15 > 4000 AND YEAR(a.date) >= 1997;	financial
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'classic' AND d.type = 'OWNER';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT     ROUND(         (SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) / COUNT(*)) * 100,         2     ) AS percent_gold_before_1998 FROM card;	financial
SELECT c.client_id, c.name FROM disp AS d JOIN client AS c ON d.client_id = c.client_id JOIN loan AS l ON d.account_id = l.account_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT SUM(d.A15) AS total_crimes FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id = 532;	financial
SELECT a.district_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT t.trans_id, t.account_id, t.operation, t.account FROM `trans` t JOIN `client` c ON t.account_id = c.client_id WHERE c.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type  FROM card AS crd  JOIN disp AS d ON crd.disp_id = d.disp_id  JOIN client AS cl ON d.client_id = cl.client_id  WHERE cl.client_id = 13539;	financial
SELECT `A3`  FROM `district`  JOIN `client` ON `district.district_id` = `client.district_id`  WHERE `client.client_id` = 3541;	financial
SELECT `district`.district_id, COUNT(`account`.account_id) AS accounts_with_no_problem_loans FROM `account` JOIN `district` ON `account`.district_id = `district`.district_id JOIN `loan` ON `account`.account_id = `loan`.account_id WHERE `loan`.status = 'A' GROUP BY `district`.district_id ORDER BY accounts_with_no_problem_loans DESC LIMIT 1;	financial
SELECT account_id  FROM `order`  WHERE `order_id` = 32423;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.district_id = 5;	financial
SELECT COUNT(*)  FROM `account`  JOIN `district` ON `account.district_id` = `district.district_id`  WHERE `district.A2` = 'Jesenik';	financial
SELECT d.client_id FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'junior' AND c.issued >= '1997-01-01';	financial
SELECT     (SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM     client c JOIN     district d ON c.district_id = d.district_id WHERE     d.A11 > 10000;	financial
SELECT      ((SUM(CASE WHEN l.date BETWEEN '1997-01-01' AND '1997-12-31' THEN l.amount ELSE 0 END) -        SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END)) /       SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END) * 100) AS growth_rate FROM      loan l JOIN      disp d ON l.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.gender = 'M';	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END) -      SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END)) AS crime_difference FROM      district WHERE      A16 = 1996;	financial
SELECT type, COUNT(*) as count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type;	financial
SELECT     `account_id`,     COUNT(`k_symbol`) AS statement_requests,     SUM(CASE WHEN `k_symbol` = '3539' THEN `amount` ELSE 0 END) AS total_debit_3539 FROM     `order` WHERE     `account_id` = 3 GROUP BY     `account_id`;	financial
SELECT YEAR(birth_date)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  WHERE account.account_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE a.frequency = 'POPLATEK PO OBRATU'  AND d.type = 'OWNER';	financial
SELECT SUM(l.amount) AS total_debt, l.status FROM `loan` l JOIN `client` c ON l.account_id = c.client_id WHERE c.client_id = 992;	financial
SELECT      SUM(t.balance) AS total_sum,     c.gender FROM      account a JOIN      trans t ON a.account_id = t.account_id JOIN      client c ON a.district_id = c.district_id WHERE      c.client_id = 4 AND t.trans_id = 851 GROUP BY      c.gender;	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 9;	financial
SELECT SUM(t.amount) AS total_payment FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.account_id = c.client_id WHERE c.client_id = 617 AND YEAR(t.date) = 1998;	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.amount > 4000;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Beroun' AND account.date > '1996-12-31';	financial
SELECT COUNT(c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cd ON d.disp_id = cd.disp_id  WHERE c.gender = 'F' AND cd.type = 'junior';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(*) FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'Prague'	financial
SELECT      (COUNT(CASE WHEN C.gender = 'M' THEN 1 END) / COUNT(CASE WHEN A.frequency = 'POPLATEK TYDNE' THEN 1 END)) * 100 AS percentage_of_male_clients_requesting_weekly_statements FROM      account A JOIN      client C ON A.district_id = C.district_id WHERE      A.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT l.account_id FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' AND l.amount = (SELECT MIN(amount) FROM loan WHERE account_id = l.account_id AND duration > 24) GROUP BY l.account_id;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND d.A11 = (     SELECT MIN(A11)     FROM district     WHERE A11 IS NOT NULL ) ORDER BY c.birth_date ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE YEAR(client.birth_date) = 1920 AND district.A3 = 'east Bohemia';	financial
SELECT COUNT(*) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT      L.account_id,     L.payments,     L.status,     AVG(L.payments) OVER (ORDER BY L.account_id) AS avg_loan_amount FROM      loan L JOIN      account A ON L.account_id = A.account_id WHERE      A.frequency = 'POPLATEK PO OBRATU'     AND L.status IN ('C', 'D') ORDER BY      L.account_id;	financial
SELECT a.account_id, d.A2 FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp d2 ON a.account_id = d2.account_id WHERE d2.type = 'OWNER';	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id WHERE crd.type = 'gold' AND d.type = 'OWNER';	financial
SELECT `bond_type`, COUNT(*) as count FROM `bond` GROUP BY `bond_type` ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(COUNT(a.element) / COUNT(b.bond_type)) AS avg_oxygen_atoms FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND a.element = 'o';	toxicology
SELECT AVG(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END)  FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.molecule_id;	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.label = '-';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id),          2     ) AS percentage_of_carbon FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id WHERE      b.bond_type = '=' GROUP BY      a.molecule_id;	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#';	toxicology
SELECT COUNT(*) FROM `atom` WHERE `element` != 'br';	toxicology
SELECT COUNT(*)  FROM `molecule` WHERE `molecule_id` BETWEEN 'TR000' AND 'TR099' AND `label` = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id AND b.bond_type = '=' JOIN connected c ON a.atom_id = c.atom_id;	toxicology
SELECT m.label, COUNT(a.molecule_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'cl';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.element ORDER BY COUNT(a.element) LIMIT 1;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element = 'sn' ) AND m.label IN ('+', '-');	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id OR a1.atom_id = c.atom_id2 WHERE a1.molecule_id = 'TR181' UNION SELECT a2.atom_id FROM atom a2 JOIN connected c ON a2.atom_id = c.atom_id OR a2.atom_id = c.atom_id2 WHERE a2.molecule_id = 'TR181';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'f' THEN 1 ELSE 0 END) * 100.0) /      COUNT(DISTINCT a.molecule_id) AS percentage_of_carcinogenic_no_fluorine FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+'	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.molecule_id = m.molecule_id THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT b.bond_id),          2     ) AS percentage_carcinogenic_triple_bonds FROM      bond b JOIN      atom a ON b.molecule_id = a.molecule_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND b.bond_type = '#'	toxicology
SELECT `element`, COUNT(*) as frequency FROM `atom` WHERE `molecule_id` = 'TR000' GROUP BY `element` ORDER BY frequency DESC, `element` ASC LIMIT 3;	toxicology
SELECT b1.bond_id, b1.molecule_id, b2.bond_id, b2.molecule_id FROM bond b1 JOIN bond b2 ON b1.molecule_id = b2.molecule_id WHERE b1.bond_id = 'TR001_2_6' AND b2.bond_id LIKE 'TR001_%' GROUP BY b1.bond_id, b1.molecule_id, b2.bond_id, b2.molecule_id;	toxicology
SELECT (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule;	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2' GROUP BY bond_id;	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '=' GROUP BY molecule_id ORDER BY molecule_id ASC LIMIT 5;	toxicology
SELECT ROUND((SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond.bond_id), 5) AS percent FROM bond WHERE bond.molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(CASE WHEN `molecule`.`label` = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT(`molecule`.`molecule_id`), 3) AS percent FROM `molecule`	toxicology
SELECT ROUND((SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100, 4) AS percent FROM atom a WHERE a.molecule_id = 'TR206';	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR060';	toxicology
SELECT      bond_type,      COUNT(bond_type) as count,     CASE          WHEN COUNT(bond_type) > (SELECT MAX(count) FROM (SELECT bond_type, COUNT(bond_type) as count FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR010' GROUP BY bond_type) as subquery) THEN 'Majority'         ELSE 'Not Majority'     END as is_majority,     CASE          WHEN molecule.label = '+' THEN 'Carcinogenic'         ELSE 'Non-Carcinogenic'     END as is_carcinogenic FROM      bond  JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      bond.molecule_id = 'TR010' GROUP BY      bond_type ORDER BY      count DESC LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY m.molecule_id ORDER BY m.molecule_id ASC LIMIT 3;	toxicology
SELECT bond_id, COUNT(*) as count FROM connected WHERE atom_id LIKE 'TR006_%' GROUP BY bond_id ORDER BY count DESC, bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM `connected` WHERE `bond_id` IN (     SELECT `bond_id`     FROM `bond`     WHERE `molecule_id` = 'TR009' ) AND (`atom_id` = 'TR009_12' OR `atom_id2` = 'TR009_12');	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT molecule_id)  FROM bond  WHERE bond_type = '-';	toxicology
SELECT COUNT(`bond_id`) AS connection_count FROM `connected` WHERE `atom_id` LIKE 'TR%_19';	toxicology
SELECT DISTINCT `element` FROM `atom` WHERE `molecule_id` = 'TR004';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE CAST(SUBSTR(a.atom_id, 7, 2) AS INTEGER) BETWEEN 21 AND 25 AND m.label = '+';	toxicology
SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.bond_id = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n';	toxicology
SELECT m.label, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.label ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT AVG(COUNT(c.bond_id) / COUNT(c.atom_id)) AS avg_bonds_per_atom FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 'i';	toxicology
SELECT b.bond_type, b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE SUBSTR(c.atom_id, 7, 2) + 0 = 45;	toxicology
SELECT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id IS NULL;	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'pb';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT      (COUNT(CASE WHEN bond_id = 'TR000_1_2' THEN 1 END) / COUNT(DISTINCT connected.atom_id)) * 100 AS percentage FROM      connected JOIN      bond ON connected.bond_id = bond.bond_id WHERE      bond.bond_type = '='	toxicology
SELECT      ROUND((SUM(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) * 100) / COUNT(bond.bond_id), 5) AS carcinogenic_single_bond_proportion FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h');	toxicology
SELECT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 's';	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-';	toxicology
SELECT COUNT(a.atom_id) AS total_triple_bond_atoms FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br') AND a.molecule_id IN (     SELECT m.molecule_id     FROM molecule m     WHERE m.molecule_id NOT IN (         SELECT b.molecule_id         FROM bond b         WHERE b.bond_type != '#'     ) );	toxicology
SELECT bond.bond_id  FROM bond  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE molecule.label = '+';	toxicology
SELECT m.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '+';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.atom_id), 2) AS cl_percentage FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id WHERE      a.element = 'cl' AND b.bond_type = '-';	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT `molecule_id`  FROM `molecule`  WHERE `label` = '-';	toxicology
SELECT COUNT(*)  FROM `molecule`  WHERE `molecule_id` BETWEEN 'TR000' AND 'TR030'  AND `label` = '+';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN connected c2 ON c1.bond_id = c2.bond_id AND c2.atom_id = a1.atom_id WHERE c1.bond_id = 'TR001_10_11' AND c2.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(*)  FROM `atom` a  JOIN `bond` b ON a.molecule_id = b.molecule_id  WHERE a.element = 'i';	toxicology
SELECT      CASE          WHEN MAX(CASE WHEN `label` = '+' THEN 1 ELSE 0 END) > 0 THEN 'Carcinogenic'         ELSE 'Non-Carcinogenic'     END AS carcinogenicity FROM      atom INNER JOIN      molecule  ON      atom.molecule_id = molecule.molecule_id WHERE      atom.element = 'ca';	toxicology
SELECT COUNT(*)  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR001_1_8'  AND (a1.element = 'cl' OR a2.element = 'cl')  AND (a1.element = 'c' OR a2.element = 'c');	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '#' AND m.molecule_id IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element = 'c' ) GROUP BY m.molecule_id HAVING COUNT(DISTINCT b.bond_type) = 1;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.molecule_id)) * 100 AS percentage_cl FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+'	toxicology
SELECT element  FROM atom  WHERE molecule_id = 'TR001';	toxicology
SELECT molecule_id  FROM bond  WHERE bond_type = '=';	toxicology
SELECT DISTINCT c1.atom_id, c2.atom_id2 FROM `connected` c1 JOIN `connected` c2 ON c1.bond_id = c2.bond_id WHERE c1.bond_id IN (SELECT bond_id FROM `bond` WHERE bond_type = '#') AND c1.atom_id < c2.atom_id AND c1.atom_id != c2.atom_id2;	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, m.label AS carcinogenicity FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.atom_id LIKE '____4' ORDER BY m.molecule_id;	toxicology
SELECT      m.label AS label,     CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) AS hydrogen_ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' GROUP BY      m.label;	toxicology
SELECT m.label AS compound_label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE atom.element = 'c';	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_10_11';	toxicology
SELECT      (SELECT COUNT(*) FROM bond WHERE bond_type = '#') /      (SELECT COUNT(*) FROM bond) * 100 AS triple_bond_percentage	toxicology
SELECT      (SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR047'	toxicology
SELECT m.label AS MoleculeLabel, m.label = '+' AS IsCarcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` = 'TR151' AND `label` = '+';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'br', 'i', 'pb', 'te');	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+';	toxicology
SELECT `atom_id`, `element` FROM `atom` WHERE `element` = 'c' AND `molecule_id` BETWEEN 'TR010' AND 'TR050'	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT molecule.molecule_id FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN atom AS a1 ON connected.atom_id = a1.atom_id JOIN atom AS a2 ON connected.atom_id2 = a2.atom_id WHERE a1.atom_id = 'TR000_1' AND bond.bond_id = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '+';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT m.molecule_id)  FROM      atom a  JOIN      molecule m ON a.molecule_id = m.molecule_id  WHERE      m.label = '+';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+' AND molecule_id = 'TR124';	toxicology
SELECT a.atom_id FROM atom a WHERE a.molecule_id = 'TR186';	toxicology
SELECT `bond_type`  FROM `bond`  WHERE `bond_id` = 'TR007_4_19';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(b.bond_id) AS double_bonds_count, m.label AS molecule_carcinogenicity FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = '=' AND m.molecule_id = 'TR006';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY m.molecule_id;	toxicology
SELECT b.bond_id, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-';	toxicology
SELECT b.molecule_id, GROUP_CONCAT(DISTINCT a.element ORDER BY a.element) AS elements FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE b.bond_type = '#' GROUP BY b.molecule_id;	toxicology
SELECT atom.element  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  WHERE connected.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(c.bond_id) FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'cl';	toxicology
SELECT atom.atom_id FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.molecule_id = 'TR346';  SELECT COUNT(DISTINCT bond.bond_type) AS bond_types_count FROM bond WHERE bond.molecule_id = 'TR346';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     JOIN bond b ON a.molecule_id = b.molecule_id     WHERE a.element = 's' OR b.bond_type = '=' );	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) AS single_bonds_count FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT     DIVIDE(SUM(CASE WHEN label = '+' AND element = 'cl' THEN 1 ELSE 0 END), COUNT(molecule_id)) AS percentage FROM     atom WHERE     EXISTS (SELECT 1 FROM molecule WHERE atom.molecule_id = molecule.molecule_id AND label = '+');	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT `atom`.`element`)  FROM `atom` JOIN `connected` ON `atom`.`atom_id` = `connected`.`atom_id` WHERE `connected`.`bond_id` = 'TR001_3_4';	toxicology
SELECT bond_type  FROM bond WHERE bond_id = (     SELECT bond_id      FROM connected      WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2' OR            atom_id = 'TR000_2' AND atom_id2 = 'TR000_1' );	toxicology
SELECT DISTINCT b.molecule_id  FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id AND c1.atom_id = 'TR000_2' JOIN connected c2 ON b.bond_id = c2.bond_id AND c2.atom_id = 'TR000_4';	toxicology
SELECT `element`  FROM `atom`  WHERE `atom_id` = 'TR000_1';	toxicology
SELECT label = '+' AS carcinogenic FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT      (SUM(CASE WHEN `bond_type` = '-' THEN 1 ELSE 0 END) * 100.0) / COUNT(`bond_id`) AS percentage FROM `bond`;	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'n';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE a.element = 's' AND b.bond_type = ' = ';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND (SELECT COUNT(*) FROM atom WHERE molecule_id = a.molecule_id) > 5 GROUP BY m.molecule_id;	toxicology
SELECT a.element FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) as atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN 1 ELSE 0 END) /       COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage_carcinogenic_with_triple_bonded_h FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+';	toxicology
SELECT COUNT(*) FROM bond WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR004_7' AND m.label = '-';	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element = 'o' AND b.bond_type = ' = ';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-' AND molecule_id IN (     SELECT molecule_id     FROM bond     WHERE bond_type = '#' );	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule_id = 'TR002');	toxicology
SELECT a.atom_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element = 'c' AND b.bond_type = '=' AND a.molecule_id = 'TR012';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT id, cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE borderColor IS NULL AND cardKingdomId IS NOT NULL AND cardKingdomId NOT IN (     SELECT cardKingdomId     FROM cards     WHERE cardKingdomFoilId IS NOT NULL );	card_games
SELECT `name` FROM `cards` WHERE `faceConvertedManaCost` = (SELECT MAX(`faceConvertedManaCost`) FROM `cards`);	card_games
SELECT `id`, `edhrecRank`, `frameVersion` FROM `cards` WHERE `edhrecRank` < 100 AND `frameVersion` = '2015';	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.types LIKE '%Artifact%'   AND cards.side IS NULL   AND legalities.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power IS NULL OR c.power = '*' AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT      c.id,     r.text AS ruling_text,     c.hasContentWarning FROM      cards c JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Stephen Daniel' AND      c.hasContentWarning = 1;	card_games
SELECT      r.text  FROM      cards c  JOIN      rulings r ON c.uuid = r.uuid  WHERE      c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT cards.name, cards.artist, cards.isPromo FROM cards JOIN rulings ON cards.uuid = rulings.uuid GROUP BY cards.uuid ORDER BY COUNT(rulings.uuid) DESC LIMIT 1;	card_games
SELECT `language` FROM `foreign_data` WHERE `name` = 'Annul' AND `cards.number` = '29';	card_games
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN fd.language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0) / COUNT(c.id) AS percentage_chinese_simplified FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid;	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords  FROM cards  WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM `cards` WHERE `power` = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT `borderColor`  FROM `cards`  WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `originalType` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT st.language FROM set_translations st JOIN cards c ON st.id = c.id WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(c.id) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Condemn');	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.isStarter = 1 AND legalities.status = 'restricted';	card_games
SELECT `status` FROM `cards` JOIN `legalities` ON `cards.uuid` = `legalities.uuid` WHERE `cards.name` = 'Cloudchaser Eagle';	card_games
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight';	card_games
SELECT `legalities.format` FROM `cards` JOIN `legalities` ON `cards.uuid` = `legalities.uuid` WHERE `cards.name` = 'Benalish Knight';	card_games
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Phyrexian';	card_games
SELECT      (COUNT(*) FILTER (WHERE `borderColor` = 'borderless') * 100.0) / COUNT(*) AS percentage_of_borderless_cards FROM      `cards`;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND EXISTS (     SELECT 1     FROM foreign_data     WHERE cards.uuid = foreign_data.uuid AND foreign_data.language = 'Russian' );	card_games
SELECT      (SELECT COUNT(*) FROM `cards` WHERE `isStorySpotlight` = 1 AND `language` = 'French') /      (SELECT COUNT(*) FROM `cards` WHERE `isStorySpotlight` = 1) * 100 AS `FrenchStorySpotlightPercentage`	card_games
SELECT COUNT(*)  FROM `cards`  WHERE `toughness` = '99';	card_games
SELECT `name`  FROM `cards`  WHERE `artist` = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords = 'Flying'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND FIND_IN_SET('Angel', REPLACE(subtypes, ',', '')) = 0;	card_games
SELECT c1.id FROM cards c1 JOIN cards c2 ON c1.cardKingdomFoilId = c2.cardKingdomId OR c1.cardKingdomId = c2.cardKingdomFoilId WHERE c1.cardKingdomFoilId IS NOT NULL AND c1.cardKingdomId IS NOT NULL AND c2.cardKingdomFoilId IS NOT NULL AND c2.cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank  FROM cards  WHERE frameVersion = '2015';	card_games
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese' AND NOT EXISTS (     SELECT 1     FROM foreign_data fd2     WHERE c.uuid = fd2.uuid AND fd2.language <> 'Japanese' );	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND uuid IN (     SELECT uuid     FROM legalities     WHERE status = 'Banned' );	card_games
SELECT cards.uuid, foreign_data.language FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE legalities.format = 'legacy';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT c.id, c.frameVersion, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal';	card_games
SELECT cards.colors  FROM cards  JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE set_translations.setCode = 'OGW';	card_games
SELECT c.id, c.convertedManaCost, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT cards.uuid, rulings.date FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf';	card_games
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.name  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact'  AND c.colors = 'B';	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL;	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'white' AND `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND type LIKE 'Creature%' AND hand = -1	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT `manaCost` FROM `cards` WHERE `availability` = 'mtgo,paper' AND `frameVersion` = '2003' AND `borderColor` = 'black' AND `layout` = 'normal';	card_games
SELECT SUM(convertedManaCost) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT      CASE          WHEN availability = 'arena' THEN 'mtgo'         WHEN availability = 'arena' THEN 'paper'     END AS card_type FROM      cards WHERE      availability = 'arena';	card_games
SELECT `setCode` FROM `set_translations` WHERE `language` = 'Spanish';	card_games
SELECT      (COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) * 100.0) / COUNT(id)  FROM cards  WHERE frameEffects = 'legendary';	card_games
SELECT      id,      (SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) /       SUM(CASE WHEN isStorySpotlight = 1 THEN 1 ELSE 0 END)) * 100 AS percentage FROM      cards GROUP BY      id ORDER BY      percentage DESC;	card_games
SELECT name,        (SUM(CASE WHEN language = 'Spanish' THEN 1 ELSE 0 END) / COUNT(id)) * 100 AS percentage_spanish FROM foreign_data GROUP BY name;	card_games
SELECT language  FROM set_translations  WHERE setCode IN (     SELECT code      FROM sets      WHERE baseSetSize = 309 );	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal';	card_games
SELECT DISTINCT subtypes, supertypes FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND subtypes IS NOT NULL AND supertypes IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'premodern' AND cards.side IS NULL AND EXISTS (     SELECT 1     FROM rulings     WHERE rulings.uuid = cards.uuid     AND rulings.text LIKE '%triggered mana ability%' );	card_games
SELECT c.id  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.artist = 'Erica Yang'  AND l.format = 'pauper'  AND c.availability = 'paper';	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.flavorText = 'La volontà di tutti, eseguita per mano mia.'	card_games
SELECT `name` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `artist` = 'Matthew D. Wilson' AND `layout` = 'normal' AND `borderColor` = 'black' AND `foreign_data.language` = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2007-02-01';	card_games
SELECT t.language FROM sets s JOIN set_translations t ON s.code = t.setCode WHERE s.baseSetSize = 180;	card_games
SELECT      (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id) AS percentage FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT   (COUNT(CASE WHEN fd.language = 'French' THEN 1 END) / COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END) * 100) AS percentage_of_cards_without_power_in_French FROM   cards c JOIN   foreign_data fd ON c.uuid = fd.uuid WHERE   c.power IS NULL OR c.power = '*'	card_games
SELECT      ROUND(         (COUNT(CASE WHEN t.language = 'Japanese' THEN 1 END) * 100.0) / COUNT(*),         2     ) AS percentage_japanese_expansion_sets FROM      set_translations t JOIN      sets s ON t.setCode = s.code WHERE      s.type = 'expansion'	card_games
SELECT `availability`  FROM `cards`  WHERE `artist` = 'Daren Bader'	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` IS NULL AND `edhrecRank` > 12000;	card_games
SELECT      SUM(isOversized) AS Oversized,     SUM(isReprint) AS Reprinted,     SUM(isPromo) AS Promotions FROM cards;	card_games
SELECT `name`, `power`, `promoTypes` FROM `cards` WHERE `power` IS NULL OR `power` = '*' AND `promoTypes` = 'arenaleague' ORDER BY `name` ASC LIMIT 3;	card_games
SELECT `language` FROM `foreign_data` WHERE `multiverseid` = 149934;	card_games
SELECT `cardKingdomFoilId`, `cardKingdomId` FROM `cards` WHERE `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL ORDER BY `cardKingdomFoilId` ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) * 100.0) / COUNT(*) AS proportion FROM      cards WHERE      isTextless = 1;	card_games
SELECT id FROM cards WHERE side IS NULL AND (subtypes = 'Angel' OR subtypes = 'Wizard');	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;	card_games
SELECT language  FROM set_translations  WHERE setCode = 'ARC' AND mcmName = 'Archenemy';	card_games
SELECT s.name, t.translation FROM sets s JOIN set_translations t ON s.code = t.setCode WHERE s.id = 5;	card_games
SELECT st.language, s.type FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese';	card_games
SELECT s.code, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      ROUND((COUNT(CASE WHEN s.isOnlineOnly = 1 THEN 1 END) / COUNT(s.code)) * 100, 2) AS percentage FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Chinese Simplified'	card_games
SELECT COUNT(*) FROM sets WHERE code NOT IN (SELECT setCode FROM set_translations WHERE language = 'Japanese') AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT COUNT(*) AS num_cards_with_extendedart, id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id;	card_games
SELECT id  FROM cards  WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT `language` FROM `set_translations` WHERE `id` = 174;	card_games
SELECT `name` FROM `sets` WHERE `code` = 'ALL';	card_games
SELECT `language` FROM `foreign_data` WHERE `name` = 'A Pedra Fellwar';	card_games
SELECT `code` FROM `sets` WHERE `releaseDate` = '2007-07-13';	card_games
SELECT s.baseSetSize, s.code  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.block IN ('Masques', 'Mirage');	card_games
SELECT s.code  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.type = 'expansion';	card_games
SELECT fd.name, c.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.name IS NOT NULL AND c.watermark = 'Boros';	card_games
SELECT fd.language, fd.flavorText FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'colorpie';	card_games
SELECT      ROUND((COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(c.id), 2) AS percentageOfManaCost10 FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Abyssal Horror';	card_games
SELECT s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.type = 'expansion' AND s.code = 'commander';	card_games
SELECT fd.name AS foreign_name, c.type FROM foreign_data AS fd JOIN cards AS c ON fd.uuid = c.uuid WHERE c.watermark = 'Abzan';	card_games
SELECT fd.language, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT `name` FROM `cards` WHERE `isTextless` = 0;	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'white' AND (`power` IS NULL OR `power` = '*');	card_games
SELECT `name` FROM `cards` WHERE `isPromo` = 1 AND `side` IS NOT NULL GROUP BY `name` HAVING COUNT(*) > 1;	card_games
SELECT `subtypes`, `supertypes`  FROM `cards`  WHERE `name` = 'Molimo, Maro-Sorcerer';	card_games
SELECT `purchaseUrls` FROM `cards` WHERE `promoTypes` = 'bundle';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE availability LIKE '%mtgo%' AND availability LIKE '%arena%'	card_games
SELECT      MAX(convertedManaCost) as max_cost,     name FROM      cards WHERE      name IN ('Serra Angel', 'Shrine Keeper') GROUP BY      name ORDER BY      max_cost DESC LIMIT 1;	card_games
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT `name` FROM `cards` WHERE `frameVersion` = '2003' ORDER BY `convertedManaCost` DESC LIMIT 3;	card_games
SELECT `translation` FROM `set_translations` WHERE `setCode` IN (     SELECT `setCode`     FROM `cards`     WHERE `name` = 'Ancestor''s Chosen' ) AND `language` = 'Italian';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode IN (     SELECT setCode      FROM cards      WHERE name = 'Angel of Mercy' );	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM `cards` AS c     INNER JOIN `set_translations` AS st ON c.setCode = st.setCode     WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Korean' );	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Adam Rex' AND setCode IN (     SELECT setCode     FROM set_translations     WHERE translation = 'Hauptset Zehnte Edition' );	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation  FROM set_translations  JOIN sets ON sets.code = set_translations.setCode  WHERE sets.name = 'Eighth Edition' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT      s.name AS SetName,      s.mtgoCode AS MTGOCode FROM      sets s JOIN      cards c ON s.code = c.setCode WHERE      c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;	card_games
SELECT s.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black';	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT artist  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT `name`, `number` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Coldsnap' AND `cards.number` = '4' LIMIT 1;	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND T1.power = '*' OR T1.power IS NULL;	card_games
SELECT `flavorText`  FROM `foreign_data`  JOIN `cards` ON `foreign_data.uuid` = `cards.uuid`  WHERE `cards.name` = 'Ancestor''s Chosen' AND `foreign_data.language` = 'Italian';	card_games
SELECT DISTINCT `language` FROM `foreign_data` WHERE `name` = 'Ancestor''s Chosen' AND `flavorText` IS NOT NULL;	card_games
SELECT `type` FROM `foreign_data` WHERE `name` = 'Ancestor''s Chosen' AND `language` = 'German';	card_games
SELECT `foreign_data`.`text` AS `ItalianText` FROM `foreign_data` JOIN `cards` ON `foreign_data`.`uuid` = `cards`.`uuid` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` WHERE `sets`.`name` = 'Coldsnap' AND `foreign_data`.`language` = 'Italian';	card_games
SELECT fd.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND fd.language = 'Italian' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT `date` FROM `rulings` JOIN `cards` ON `rulings.uuid` = `cards.uuid` WHERE `cards.name` = 'Reminisce'	card_games
SELECT      (SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Coldsnap';	card_games
SELECT      (SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentageIncredibly Powerful FROM      cards WHERE      setCode = (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT `code`  FROM `sets`  WHERE `releaseDate` = '2017-07-14';	card_games
SELECT `keyruneCode` FROM `sets` WHERE `code` = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT `mcmName` FROM `sets` WHERE `releaseDate` = '2017-06-09'	card_games
SELECT `type` FROM `sets` WHERE `name` LIKE '%From the Vault: Lore%';	card_games
SELECT parentCode  FROM sets  WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.artist, c.text AS card_text, r.text AS ruling_text, c.hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation';	card_games
SELECT s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Rinascita di Alara';	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition';	card_games
SELECT st.translation FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN (     SELECT c.setCode     FROM cards c     JOIN set_translations st ON c.setCode = st.setCode     WHERE st.translation = 'Tendo Ice Bridge' ) AS tib ON c.setCode = tib.setCode WHERE st.language = 'French';	card_games
SELECT COUNT(*) FROM set_translations WHERE translation = 'Tenth Edition';	card_games
SELECT st.translation  FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT `name` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Journey into Nyx Hero''s Path' ORDER BY `convertedManaCost` DESC LIMIT 1;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío';	card_games
SELECT s.type  FROM sets s  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards WHERE name = 'World Championship Decks 2004' AND convertedManaCost = 3.0;	card_games
SELECT translation  FROM set_translations  JOIN sets ON sets.code = set_translations.setCode  WHERE sets.name = 'Mirrodin' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Japanese' AND s.isNonFoilOnly = 1	card_games
SELECT      (SUM(CASE WHEN sets.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN sets.isOnlineOnly = 1 OR sets.isOnlineOnly = 0 THEN 1 END) AS percentage_online_only FROM      sets JOIN      set_translations ON sets.code = set_translations.setCode WHERE      set_translations.language = 'Portuguese (Brazil)';	card_games
SELECT `availability` FROM `cards` WHERE `artist` != 'Aleksi Briclot' AND `isTextless` = 1;	card_games
SELECT `id` FROM `sets` ORDER BY `baseSetSize` DESC LIMIT 1;	card_games
SELECT `artist` FROM `cards` WHERE `side` IS NULL ORDER BY `convertedManaCost` DESC LIMIT 1;	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE duelDeck = 'a' AND (power IS NULL OR power = '*') AND hasFoil = 0;	card_games
SELECT `id` FROM `sets` WHERE `type` = 'commander' ORDER BY `totalSetSize` DESC LIMIT 1;	card_games
SELECT      c.name,      c.manaCost,      LENGTH(c.manaCost) - LENGTH(REPLACE(c.manaCost, '{', '')) AS unconverted_mana_cost FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      l.format = 'duel' ORDER BY      unconverted_mana_cost DESC LIMIT      10;	card_games
SELECT MIN(`originalReleaseDate`), `format` FROM `cards` JOIN `legalities` ON `cards.uuid` = `legalities.uuid` WHERE `rarity` = 'mythic' AND `status` = 'Legal' GROUP BY `format` ORDER BY MIN(`originalReleaseDate`) LIMIT 1;	card_games
SELECT COUNT(c.id) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT format, COUNT(*) as banned_count FROM legalities WHERE status = 'Banned' GROUP BY format ORDER BY banned_count DESC LIMIT 1;	card_games
SELECT `language` FROM `set_translations` JOIN `sets` ON `sets.id` = `set_translations.id` WHERE `sets.name` = 'Battlebond';	card_games
SELECT c.artist, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid GROUP BY c.artist, l.format HAVING COUNT(c.uuid) = (     SELECT MIN(card_count)     FROM (         SELECT artist, COUNT(uuid) as card_count         FROM cards         GROUP BY artist     ) as subquery ) ORDER BY c.artist;	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997' AND cards.artist = 'D. Alexander Gregory' AND legalities.format = 'legacy' AND cards.hasContentWarning = 1 AND legalities.status IN ('Wizards of the Coast', 'Legal');	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT      COUNT(s.id) / (COUNT(DISTINCT YEAR(s.releaseDate)) - 1) AS avg_sets_per_year,     MAX(st.language) AS common_language FROM      sets s JOIN      set_translations st ON s.id = st.id WHERE      s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY      YEAR(s.releaseDate);	card_games
SELECT artist FROM cards WHERE availability = 'arena' AND artist IN (     SELECT artist     FROM cards     WHERE `artist` IS NOT NULL     AND `availability` = 'mtgo'     AND `artist` NOT IN (         SELECT artist         FROM cards         WHERE `artist` IS NOT NULL         AND `availability` = 'mtgo'         AND `availability` = 'paper'     ) );	card_games
SELECT `uuid` FROM `legalities` WHERE `format` = 'oldschool' AND `status` IN ('banned', 'restricted');	card_games
SELECT COUNT(*)  FROM `cards`  WHERE `artist` = 'Matthew D. Wilson' AND `availability` = 'paper';	card_games
SELECT r.date, r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language NOT LIKE '%Japanese%' AND st.language = 'Korean';	card_games
SELECT DISTINCT frameVersion FROM cards WHERE artist = 'Allen Williams';  SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned';	card_games
SELECT `DisplayName`, MAX(`Reputation`) as MaxReputation FROM `users` WHERE `DisplayName` = 'Harlan' OR `DisplayName` = 'Jarrod Dixon' GROUP BY `DisplayName` ORDER BY `DisplayName` = 'Jarrod Dixon' DESC, `DisplayName` = 'Harlan' DESC LIMIT 1;	codebase_community
SELECT DisplayName  FROM users  WHERE year(CreationDate) = 2011;	codebase_community
SELECT COUNT(*)  FROM `users` WHERE `LastAccessDate` > '2014-09-01'	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Views` = (SELECT MAX(`Views`) FROM `users`);	codebase_community
SELECT COUNT(*)  FROM users  WHERE (SELECT COUNT(*) FROM upvotes WHERE users.Id = upvotes.userId AND upvotes.upvoteType = 'up' AND upvotes.value > 100) > 100  AND (SELECT COUNT(*) FROM upvotes WHERE users.Id = upvotes.userId AND upvotes.upvoteType = 'down' AND upvotes.value > 1) > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT `Title`  FROM `posts`  INNER JOIN `users` ON `posts.OwnerUserId` = `users.Id`  WHERE `users.DisplayName` = 'csgillespie';	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie'  ORDER BY ViewCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(`CommentCount`) as TotalComments FROM `posts` WHERE `OwnerUserId` IN (SELECT `Id` FROM `users` WHERE `DisplayName` = 'csgillespie')	codebase_community
SELECT AnswerCount FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') ORDER BY AnswerCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.Age > 65 AND posts.Score >= 20;	codebase_community
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body  FROM posts p  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie' AND YEAR(badges.Date) = 2011;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(p.Score) AS AverageScore FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(b.CountBadges) AS AvgBadges FROM (     SELECT COUNT(b.Id) AS CountBadges     FROM badges b     JOIN users u ON b.UserId = u.Id     WHERE u.Views > 200     GROUP BY b.UserId ) AS b;	codebase_community
SELECT     (COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0) / COUNT(p.Id) AS ElderUserPercentage FROM     posts p JOIN     users u ON p.OwnerUserId = u.Id WHERE     p.Score > 5	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT `CreationDate` FROM `votes` GROUP BY `CreationDate` ORDER BY COUNT(`Id`) DESC LIMIT 1;	codebase_community
SELECT COUNT(`Id`)  FROM `badges`  WHERE `Name` = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0'	codebase_community
SELECT Text  FROM comments  WHERE PostId = (SELECT Id FROM posts WHERE ParentId = 107829 AND CommentCount = 1);	codebase_community
SELECT      p.Id AS PostId,     p.ClosedDate IS NULL AS IsPostWellFinished FROM      comments c JOIN      posts p ON c.PostId = p.Id WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = 6347;	codebase_community
SELECT COUNT(v.Id) AS VoteCount FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE OwnerUserId = 24) /      (SELECT COUNT(*) FROM votes WHERE UserId = 24) AS post_vote_ratio	codebase_community
SELECT ViewCount  FROM posts  WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93'	codebase_community
SELECT `Text` FROM `comments` JOIN `users` ON `comments.UserId` = `users.Id` WHERE `users.DisplayName` = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName AS Editor FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Yevgeny' AND p.Id = (SELECT Id FROM posts WHERE LastEditorUserId = (SELECT Id FROM users WHERE DisplayName = 'Yevgeny'))	codebase_community
SELECT ph.Comment FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(`BountyAmount`) AS TotalBountyAmount FROM `votes` WHERE `PostId` IN (SELECT `Id` FROM `posts` WHERE `Title` LIKE '%data%');	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, c.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN tags t ON p.Tags LIKE '%<humor>%' JOIN comments c ON p.Id = c.PostId GROUP BY p.Id, c.Text	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT `Id` FROM `users` WHERE `Reputation` = (SELECT MAX(`Reputation`) FROM `users`);	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011;	codebase_community
SELECT COUNT(DISTINCT `UserId`)  FROM `badges`  WHERE (`UserId` IN (     SELECT `UserId`      FROM `badges`      GROUP BY `UserId`      HAVING COUNT(`Name`) > 5 ));	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'New York' AND b.Name IN ('Teacher', 'Supporter');	codebase_community
SELECT u.Id, u.Reputation FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.PostId = 1;	codebase_community
SELECT ph.UserId FROM postHistory ph JOIN (     SELECT PostId, COUNT(DISTINCT UserId) as UserCount     FROM postHistory     GROUP BY PostId ) AS uniqueUsers ON ph.PostId = uniqueUsers.PostId AND uniqueUsers.UserCount = 1 JOIN posts p ON ph.PostId = p.Id WHERE p.ViewCount >= 1000;	codebase_community
SELECT c.UserId, b.Name as Badge FROM comments c LEFT JOIN badges b ON c.UserId = b.UserId WHERE c.UserId IN (     SELECT UserId     FROM comments     GROUP BY UserId     ORDER BY COUNT(*) DESC     LIMIT 1 );	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      (         (COUNT(*) FILTER (WHERE Name = 'Student' AND YEAR(Date) = 2010) * 100 /           COUNT(Name)) -          (COUNT(*) FILTER (WHERE Name = 'Student' AND YEAR(Date) = 2011) * 100 /           COUNT(Name))     ) AS PercentageDifference FROM badges;	codebase_community
SELECT `PostHistoryTypeId` FROM `postHistory` WHERE `PostId` = 3720;  SELECT COUNT(DISTINCT `UserId`)  FROM `comments` WHERE `PostId` = 3720;	codebase_community
SELECT p.Id AS PostId, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.PostId = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.PostId = 395;	codebase_community
SELECT p.Id AS PostId, u.Id AS UserId FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) AS FavoriteCountGained FROM postHistory ph JOIN posts p ON ph.PostId = p.Id JOIN users u ON ph.UserId = u.Id WHERE u.Id = 686 AND YEAR(ph.CreationDate) = 2011;	codebase_community
SELECT      AVG(u.UpVotes) AS avg_upvotes,     AVG(u.Age) AS avg_age FROM      users u JOIN      (SELECT OwnerUserId      FROM posts      GROUP BY OwnerUserId      HAVING COUNT(*) > 10) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(UserId)  FROM badges  WHERE Name = 'Announcer';	codebase_community
SELECT `Name` FROM `badges` WHERE `Date` = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE score > 60;	codebase_community
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      ROUND((COUNT(b.UserId) * 100.0) / (SELECT COUNT(*) FROM `users`), 2) AS PercentageOfTeachers FROM      `badges` b WHERE      b.Name = 'Teacher';	codebase_community
SELECT      (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN b.UserId END) * 100.0) / COUNT(b.UserId) AS Teenager_Percentage FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      b.Name = 'Organizer'	codebase_community
SELECT c.Score AS CommentRating FROM comments c WHERE c.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(b.Id)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Id` = 30;	codebase_community
SELECT COUNT(*)  FROM `users`  WHERE `Location` = 'New York, NY';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT `DisplayName`, `Views` FROM `users` WHERE `Views` = (SELECT MAX(`Views`) FROM `users`);	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END) / NULLIF(COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END), 0)) AS votes_ratio FROM votes;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(ph.Id)  FROM postHistory ph  JOIN users u ON ph.UserId = u.Id  WHERE u.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'Harlan';	codebase_community
SELECT p.Id  FROM posts p  JOIN users u ON p.Id = p.PostId  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u2 ON ph.UserId = u2.Id  WHERE u2.DisplayName = 'slashnick'  ORDER BY p.AnswerCount DESC  LIMIT 1;	codebase_community
SELECT      MAX(SUM(p.ViewCount)) AS HighestViewCount FROM      posts p JOIN      users u ON p.ViewCount IS NOT NULL AND p.Id = (SELECT Id FROM postHistory WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') OR UserId = (SELECT Id FROM users WHERE DisplayName = 'Noah Snyder')) GROUP BY      u.DisplayName ORDER BY      HighestViewCount DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.Id > 4;	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
SELECT DISTINCT p.Tags FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(ph.PostId) * 100.0) /      (SELECT COUNT(*) FROM postHistory ph JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName = 'Community') AS percentage FROM      postHistory ph JOIN      tags t ON ph.PostId = t.ExcerptPostId WHERE      t.TagName = 'r' AND ph.UserId = (         SELECT Id FROM users WHERE DisplayName = 'Community'     );	codebase_community
SELECT      (SELECT SUM(ViewCount)       FROM posts       JOIN users ON posts.OwnerUserId = users.Id       WHERE users.DisplayName = 'Mornington') -      (SELECT SUM(ViewCount)       FROM posts       JOIN users ON posts.OwnerUserId = users.Id       WHERE users.DisplayName = 'Amos') AS ViewCountDifference;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*)  FROM `postHistory` WHERE `CreationDate` BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59';	codebase_community
SELECT `DisplayName`, `Age`  FROM `users`  WHERE `Views` = (SELECT MAX(`Views`) FROM `users`);	codebase_community
SELECT `LastEditDate`, `LastEditorUserId` FROM `posts` WHERE `Title` = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT      p.Title,      c.UserDisplayName FROM      comments c JOIN      posts p ON c.PostId = p.Id WHERE      c.Score > 60;	codebase_community
SELECT badges.Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location = 'on the server farm' AND YEAR(badges.Date) = 2011;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
SELECT      ph.PostId,      COUNT(*) AS HistoryCount,      p.LastEditDate  FROM      postHistory ph  JOIN      posts p ON ph.PostId = p.Id  WHERE      p.Title = 'What is the best introductory Bayesian statistics textbook?'  GROUP BY      ph.PostId;	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title AS RelatedPostTitle FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time'	codebase_community
SELECT ph.PostId, b.Name FROM postHistory ph JOIN badges b ON ph.UserId = b.UserId WHERE ph.UserDisplayName = 'Samuel' AND YEAR(ph.CreationDate) = 2013 AND YEAR(b.Date) = 2013;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.ParentId IS NOT NULL ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8);	codebase_community
SELECT `Title`  FROM `posts`  ORDER BY `ViewCount` DESC  LIMIT 5;	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT `OwnerUserId` FROM `posts` WHERE `FavoriteCount` = (SELECT MAX(`FavoriteCount`) FROM `posts`);	codebase_community
SELECT MAX(`Age`) AS OldestUserAge FROM `users` WHERE `Reputation` = (SELECT MAX(`Reputation`) FROM `users`);	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(v.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(Score) as TotalScore FROM posts WHERE LasActivityDate LIKE '2010-07-19%';	codebase_community
SELECT      COUNT(postLinks.Id) / 12 AS AverageMonthlyLinks FROM      postLinks JOIN      posts ON postLinks.PostId = posts.Id WHERE      YEAR(postLinks.CreationDate) = 2010 AND      posts.AnswerCount <= 2;	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.PostId = (     SELECT MIN(PostId) FROM postLinks )	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate) FROM votes JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'chl'	codebase_community
SELECT MIN(`CreationDate`)  FROM `posts`  WHERE `OwnerUserId` IN (SELECT `Id` FROM `users` ORDER BY `Age` ASC LIMIT 1);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(CASE WHEN v.PostId IS NULL THEN 1 ELSE 0 END) AS avg_votes FROM users u LEFT JOIN votes v ON u.Id = v.UserId WHERE u.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT `DisplayName`  FROM `users`  WHERE `Reputation` = (SELECT MAX(`Reputation`) FROM `users`);	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Age` BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Jay Stevens' AND YEAR(posts.CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT `posts.Id`, `posts.Title` FROM `posts` JOIN `users` ON `posts.OwnerUserId` = `users.Id` WHERE `posts.Score` IS NOT NULL AND `posts.Score` = (SELECT MAX(`Score`) FROM `posts`) ORDER BY `posts.Score` DESC LIMIT 1;	codebase_community
SELECT AVG(Score)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Stephen Turner'	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(u.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(`CreationDate`) = 2011 AND `users.Reputation` > 1000 THEN `posts.Id` END) * 100.0) / COUNT(`posts.Id`) AS Percentage FROM      `posts` JOIN      `users` ON `posts.OwnerUserId` = `users.Id`	codebase_community
SELECT      (COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 END) / COUNT(*)) * 100 AS percentage_of_teenage_users FROM      users;	codebase_community
SELECT      p.ViewCount AS TotalViews,      u.DisplayName AS LastEditorDisplayName FROM      posts p JOIN      postHistory ph ON p.Id = ph.PostId JOIN      users u ON p.LastEditorUserId = u.Id WHERE      ph.Text = 'Computer Game Datasets' LIMIT      1;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 183 AND p.LastEditDate = (SELECT MAX(LastEditDate) FROM posts WHERE Id = 183);	codebase_community
SELECT b.Name, b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM `users` WHERE `Age` BETWEEN 19 AND 65 AND `UpVotes` > 5000;	codebase_community
SELECT TIMESTAMPDIFF(SECOND, u.CreationDate, b.Date) AS TimeToGetBadge FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT      u.Id,      COUNT(c.Id) AS CommentCount,      (SELECT COUNT(p.Id) FROM posts p WHERE p.OwnerUserId = u.Id) AS PostCount FROM      users u LEFT JOIN      posts p ON u.Id = p.OwnerUserId LEFT JOIN      comments c ON p.Id = c.PostId WHERE      u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY      u.Id;	codebase_community
SELECT c.Text AS CommentText, u.DisplayName AS CommentatorDisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE tag_id IN (SELECT Id FROM tags WHERE TagName = 'careers');	codebase_community
SELECT Reputation, Views  FROM users  WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT SUM(`AnswerCount`) AS TotalAnswers, SUM(`CommentCount`) AS TotalComments FROM `posts` WHERE `Title` = 'Clustering 1D data'	codebase_community
SELECT `CreationDate`  FROM `users`  WHERE `DisplayName` = 'IrishStat';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30;	codebase_community
SELECT      (SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) * 100.0) /      COUNT(p.Id) AS PercentageOfHighScorePosts FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM `posts` WHERE `Score` < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT `ExcerptPostId`, `WikiPostId` FROM `tags` WHERE `TagName` = 'sample'	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.CreationDate LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT c.PostId)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT c.UserId)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT c.PostId, c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      (COUNT(CASE WHEN U.UpVotes = 0 THEN C.UserId END) / COUNT(C.UserId)) * 100 AS PercentageZeroUpVotes FROM      comments C JOIN      users U ON C.UserId = U.Id WHERE      C.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM `superpower` sp JOIN `hero_power` hp ON sp.id = hp.power_id JOIN `superhero` sh ON hp.hero_id = sh.id WHERE sh.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hero_id)  FROM hero_power  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.full_name HAVING COUNT(hero_power.power_id) > 15;	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT superhero_name  FROM superhero  JOIN colour AS eye_colour ON eye_colour.id = superhero.eye_colour_id  JOIN colour AS hair_colour ON hair_colour.id = superhero.hair_colour_id  WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name, height_cm FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT `publisher_name`  FROM `publisher`  INNER JOIN `superhero` ON `publisher.id` = `superhero.publisher_id`  WHERE `superhero_name` = 'Sauron';	superhero
SELECT s.superhero_name, c.colour, COUNT(s.id) AS popularity FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY s.superhero_name, c.colour ORDER BY COUNT(s.id) DESC;	superhero
SELECT AVG(`height_cm`)  FROM `superhero`  WHERE `publisher_id` IN (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher_name = 'Marvel Comics' AND power_name = 'Super Strength';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Speed') GROUP BY p.publisher_name;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond');	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT r.race FROM superhero AS sh JOIN race AS r ON sh.race_id = r.id WHERE sh.superhero_name = 'Copycat';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.hero_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')) * 100.0 /      (SELECT COUNT(*) FROM superhero) AS percentage_bad_alignment,     (SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS count_bad_alignment_marvel	superhero
SELECT   (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))   - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS diff_superheroes;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  WHERE gender.gender = 'Female';	superhero
SELECT sp.power_name FROM `superpower` sp JOIN `hero_power` hp ON sp.id = hp.power_id JOIN `superhero` s ON hp.hero_id = s.id JOIN `gender` g ON s.gender_id = g.id WHERE g.gender = 'Male' GROUP BY sp.power_name ORDER BY COUNT(*) DESC LIMIT 5;	superhero
SELECT superhero_name  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56;	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Bad';	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.weight_kg = 169;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.hair_colour_id = c.id  JOIN race r ON s.race_id = r.id  WHERE s.height_cm = 185 AND r.race = 'human';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT     ROUND(         (SUM(CASE WHEN superhero.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),         2     ) AS percentage_marvel_heroes FROM superhero WHERE superhero.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT `attribute_value` FROM `hero_attribute` INNER JOIN `superhero` ON `hero_attribute`.`hero_id` = `superhero`.`id` WHERE `superhero_name` = 'Abomination';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hero_id)  FROM hero_power  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(s.id) AS average_superheroes_no_skin FROM superhero s WHERE s.skin_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';	superhero
SELECT s.eye_colour_id, s.hair_colour_id, s.skin_colour_id FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.skin_colour_id AND s.hair_colour_id = s.eye_colour_id;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) / SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END)) * 100,         2     ) AS blue_female_percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.skin_colour_id = c.id WHERE g.gender = 'Female';	superhero
SELECT superhero_name, race FROM superhero JOIN race ON superhero.race_id = race.id WHERE full_name = 'Charles Chandler';	superhero
SELECT g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM hero_power  JOIN superhero ON hero_power.hero_id = superhero.id  WHERE superhero.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superhero AS sz JOIN hero_power AS hp ON sz.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sz.full_name = 'Hunter Zolomon';	superhero
SELECT superhero.height_cm  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Amber';	superhero
SELECT superhero_name  FROM superhero  JOIN colour AS eyes ON superhero.eye_colour_id = eyes.id  JOIN colour AS hair ON superhero.hair_colour_id = hair.id  WHERE eyes.colour = 'Black' AND hair.colour = 'Black';	superhero
SELECT superhero.eye_colour_id FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Gold';	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Vampire');	superhero
SELECT superhero_name  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(DISTINCT ha.hero_id) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute ha2 WHERE ha2.attribute_id = a.id)	superhero
SELECT r.race, a.alignment FROM superhero AS sh JOIN race AS r ON sh.race_id = r.id JOIN alignment AS a ON sh.alignment_id = a.id WHERE sh.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND(         (SUM(CASE WHEN g.gender = 'Female' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END),         2     ) AS female_hero_percentage FROM superhero AS sh JOIN gender AS g ON sh.gender_id = g.id JOIN publisher AS p ON sh.publisher_id = p.id	superhero
SELECT AVG(weight_kg)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Alien';	superhero
SELECT      (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') -      (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT id, AVG(height_cm) AS average_height FROM superhero GROUP BY id;	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' ORDER BY attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero_name FROM superhero JOIN colour AS eye_colour ON eye_colour.id = superhero.eye_colour_id JOIN colour AS hair_colour ON hair_colour.id = superhero.hair_colour_id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL OR publisher_id = 1;	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.id = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id),          2     ) AS percentage_of_blue_eyed_superheroes FROM superhero s JOIN colour c ON s.eye_colour_id = c.id;	superhero
SELECT      SUM(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) /      SUM(CASE WHEN gender.gender = 'Male' THEN 1 ELSE 0 END) AS ratio FROM superhero JOIN gender ON superhero.gender_id = gender.id;	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT `full_name` FROM `superhero` WHERE `weight_kg` IS NULL OR `weight_kg` = 0;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.full_name = 'Helen Parr';	superhero
SELECT race FROM race JOIN superhero ON race.id = superhero.race_id WHERE superhero.weight_kg = 108 AND superhero.height_cm = 188;	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.id = 38;	superhero
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(attribute_value)  FROM hero_attribute  JOIN superhero ON hero_attribute.hero_id = superhero.id  WHERE superhero.alignment_id = 3;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id JOIN gender ON superhero.gender_id = gender.id WHERE colour.colour = 'Blue' AND gender.gender = 'Male';	superhero
SELECT      ROUND(         (SUM(CASE WHEN `alignment_id` = 2 AND `gender_id` = 2 THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN `alignment_id` = 2 THEN 1 ELSE 0 END)     , 2) AS percentage_female_bad_superheroes FROM `superhero` WHERE `alignment_id` = 2;	superhero
SELECT      (SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) -       SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END)) AS difference FROM      superhero T1 WHERE      T1.weight_kg IS NULL OR T1.weight_kg = 0;	superhero
SELECT `attribute_value` FROM `hero_attribute` INNER JOIN `superhero` ON `hero_attribute.hero_id` = `superhero.id` INNER JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` WHERE `superhero.superhero_name` = 'Hulk' AND `attribute.attribute_name` = 'Strength';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*)  FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE power_name = 'Wind Control' ORDER BY superhero_name ASC;	superhero
SELECT g.gender  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, MAX(weight_kg) AS max_weight FROM superhero WHERE publisher_name = 'DC Comics' GROUP BY superhero_name ORDER BY max_weight DESC LIMIT 1;	superhero
SELECT AVG(`height_cm`) AS average_height FROM `superhero` JOIN `race` ON `superhero.race_id` = `race.id` JOIN `publisher` ON `superhero.publisher_id` = `publisher.id` WHERE `race.race` <> 'Human' AND `publisher.publisher_name` = 'Dark Horse Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) -     (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'George Lucas')) AS difference;	superhero
SELECT a.attribute_name FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour  FROM superhero AS s  JOIN colour AS c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) * 100.0) /          COUNT(*),          2     ) AS female_percentage FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'George Lucas';	superhero
SELECT      ROUND(         (SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),         2     ) AS percentage_good_superheroes FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%';	superhero
SELECT `hero_id` FROM `hero_attribute` ORDER BY `attribute_value` LIMIT 1;	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Auburn';	superhero
SELECT ha.attribute_value  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT s.weight_kg, r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.id = 40;	superhero
SELECT AVG(height_cm)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Neutral';	superhero
SELECT hp.hero_id FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q1 = (     SELECT MAX(q1)     FROM qualifying     WHERE raceId = 20 ) AND q.raceId = 20;	formula_1
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19) AND q.raceId = 19;	formula_1
SELECT r.year  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai';	formula_1
SELECT `url` FROM `races` JOIN `circuits` ON `races.circuitId` = `circuits.circuitId` WHERE `circuits.name` = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany';	formula_1
SELECT cs.position  FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId  WHERE c.name = 'Renault';	formula_1
SELECT COUNT(*)  FROM races  WHERE year = 2010  AND circuitId NOT IN (     SELECT circuitId      FROM circuits      WHERE country IN ('Malaysia', 'Bahrain', 'Turkey', 'Monaco') );	formula_1
SELECT r.name  FROM races AS r  JOIN circuits AS c ON r.circuitId = c.circuitId  WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.points = 1.0 AND cr.raceId = 24;	formula_1
SELECT q.q1  FROM qualifying q  JOIN drivers d ON q.driverId = d.driverId  WHERE d.forename = 'Bruno' AND d.surname = 'Senna'  AND q.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40';	formula_1
SELECT q.number FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.q3 LIKE '01:54%' AND q.raceId = 903;	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Bahrain Grand Prix'  AND ra.year = 2007  AND r.time IS NULL;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.time LIKE '0:01:27%' AND lt.raceId = 161;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933);	formula_1
SELECT circuits.lat, circuits.lng  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  WHERE cr.raceId = 9  ORDER BY cr.points DESC  LIMIT 1;	formula_1
SELECT q1  FROM qualifying  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi')  AND raceId = 345;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '0:01:15';	formula_1
SELECT d.code  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 45 AND q.q3 LIKE '0:01:33%';	formula_1
SELECT r.time  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE d.forename = 'Bruce' AND d.surname = 'McLaren' AND r.raceId = 743;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.date = '2015-11-29'  AND ds.points = 0;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId = 348 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results);	formula_1
SELECT      (SUBSTR(MAX(CAST(`results`.fastestLapSpeed AS REAL)), 1, LENGTH(MAX(CAST(`results`.fastestLapSpeed AS REAL))) - 2) -      SUBSTR(MAX(CAST((SELECT `results2`.fastestLapSpeed FROM `results` AS `results2` WHERE `results2`.raceId = 854), 1, LENGTH(MAX(CAST(`results2`.fastestLapSpeed AS REAL))) - 2)) * 100 /      SUBSTR(MAX(CAST((SELECT `results2`.fastestLapSpeed FROM `results` AS `results2` WHERE `results2`.raceId = 854), 1, LENGTH(MAX(CAST(`results2`.fastestLapSpeed AS REAL))) - 2)) FROM `results` WHERE `driverId` IN (     SELECT `driverId` FROM `drivers` WHERE `forename` = 'Paul' AND `surname` = 'di Resta' ) AND `raceId` = 853;	formula_1
SELECT      SUM(CASE WHEN r.time IS NOT NULL THEN 1 ELSE 0 END) AS completed,     COUNT(r.driverId) AS total_drivers FROM      results r JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.date = '1983-07-16' GROUP BY      r.driverId	formula_1
SELECT year  FROM races  WHERE name = 'Singapore Grand Prix'  ORDER BY year ASC  LIMIT 1;	formula_1
SELECT COUNT(*) AS total_races, GROUP_CONCAT(name ORDER BY name DESC) AS races_list FROM races WHERE year = 2005;	formula_1
SELECT name  FROM races  WHERE year = (SELECT year FROM races WHERE date = (SELECT MIN(date) FROM races));	formula_1
SELECT name, date  FROM races  WHERE year = 1999  ORDER BY round DESC  LIMIT 1;	formula_1
SELECT year, COUNT(*) AS race_count FROM races GROUP BY year ORDER BY race_count DESC LIMIT 1;	formula_1
SELECT `name` FROM `races` WHERE `year` = 2017 AND `name` NOT IN (     SELECT `name`     FROM `races`     WHERE `year` = 2000 );	formula_1
SELECT circuits.country, circuits.name, circuits.location  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.year = (SELECT MIN(year) FROM races WHERE year > 2008 AND circuits.country = 'Europe');	formula_1
SELECT `date` FROM `races` JOIN `circuits` ON `races.circuitId` = `circuits.circuitId` WHERE `circuits.name` = 'Brands Hatch' ORDER BY `races.year` DESC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT YEAR(raceDate)) AS seasons_hosted FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit' AND races.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, ds.position FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2010 ORDER BY ds.position;	formula_1
SELECT drivers.forename, drivers.surname, MAX(driverStandings.points) as max_points FROM drivers JOIN driverStandings ON drivers.driverId = driverStandings.driverId GROUP BY drivers.driverId ORDER BY max_points DESC LIMIT 1;	formula_1
SELECT      d.forename,      d.surname,      ds.points FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY      ds.points DESC LIMIT 3;	formula_1
SELECT drivers.forename, drivers.surname, races.name, MIN(lapTimes.milliseconds) AS best_time FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId JOIN races ON lapTimes.raceId = races.raceId GROUP BY drivers.driverId, races.raceId ORDER BY best_time ASC LIMIT 1;	formula_1
SELECT AVG(milliseconds) as average_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis' AND races.name = 'Malaysian Grand Prix';	formula_1
SELECT      (COUNT(CASE WHEN d.surname = 'Hamilton' AND ds.position > 1 THEN 1 END) * 100.0) /      COUNT(CASE WHEN d.surname = 'Hamilton' THEN 1 END) AS percentage FROM      drivers d JOIN      driverStandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      d.surname = 'Hamilton' AND      r.year >= 2010;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(dr.points) as max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN results r ON d.driverId = r.driverId GROUP BY d.driverId ORDER BY MAX(ds.wins) DESC LIMIT 1;	formula_1
SELECT      `forename`,      `surname`,      (YEAR(CURRENT_TIMESTAMP) - YEAR(`dob`)) AS `age` FROM      `drivers` WHERE      `nationality` = 'Japanese' ORDER BY      `dob` DESC LIMIT 1;	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE YEAR(r.date) BETWEEN 1990 AND 2000 GROUP BY c.name HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name AS CircuitName, c.location, r.name AS RaceName FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name AS RaceName, c.name AS CircuitName, c.location AS CircuitLocation FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name AS race_name FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.surname = 'Yoong' AND d.forename = 'Alex' AND ds.position < 20;	formula_1
SELECT SUM(`wins`) AS total_wins FROM `driverStandings` JOIN `drivers` ON `driverStandings.driverId` = `drivers.driverId` JOIN `races` ON `driverStandings.raceId` = `races.raceId` JOIN `circuits` ON `races.circuitId` = `circuits.circuitId` WHERE `drivers.surname` = 'Schumacher' AND `circuits.name` = 'Sepang International Circuit';	formula_1
SELECT r.name AS race, r.year FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(points)  FROM driverStandings  JOIN drivers ON driverStandings.driverId = drivers.driverId  WHERE drivers.surname = 'Irvine' AND driverStandings.year = 2000;	formula_1
SELECT r.name, ds.points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT r.name AS race_name, c.name AS hosting_country, r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name AS raceName, r.year, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN lapTimes lt ON r.raceId = lt.raceId GROUP BY r.raceId ORDER BY COUNT(lt.lap) DESC LIMIT 1;	formula_1
SELECT      (SELECT COUNT(*)       FROM races       WHERE name = 'European Grand Prix' AND circuitId IN (         SELECT circuitId          FROM circuits          WHERE country = 'Germany'      )     ) /      (SELECT COUNT(*)       FROM races       WHERE name = 'European Grand Prix'     ) * 100 AS percentage	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name, lat FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality  FROM drivers  WHERE dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT `surname` FROM `drivers` WHERE `nationality` = 'Italian'	formula_1
SELECT url  FROM drivers  WHERE `surname` = 'Davidson';	formula_1
SELECT `driverRef` FROM `drivers` WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton';	formula_1
SELECT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT DISTINCT year  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT r.name, r.url FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT `races`.`time` FROM `races` JOIN `circuits` ON `races`.`circuitId` = `circuits`.`circuitId` WHERE `circuits`.`name` = 'Abu Dhabi Circuit' AND `races`.`year` BETWEEN 2010 AND 2019;	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy';	formula_1
SELECT r.date FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT url  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.name = 'Spanish Grand Prix' AND year = 2009;	formula_1
SELECT MIN(`fastestLapTime`) AS `fastestLapTime` FROM `results` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis');	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results);	formula_1
SELECT d.driverRef FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND ds.position = 1 AND ds.year = 2007;	formula_1
SELECT r.name AS raceName FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name AS RaceName, MIN(r.rank) AS HighestRank FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' GROUP BY r.name ORDER BY HighestRank ASC LIMIT 1;	formula_1
SELECT MAX(`fastestLapSpeed`) AS fastestLapSpeed FROM `races` JOIN `results` ON `races.raceId` = `results.raceId` WHERE `races.name` = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT r.year  FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surname, r.positionOrder FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Chinese Grand Prix' ORDER BY r.positionOrder DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN seasons se ON ra.year = se.year WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (     SELECT raceId     FROM races     WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND time IS NOT NULL;	formula_1
SELECT r.fastestLap  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  AND ra.name = 'Australian Grand Prix' AND ra.year = 2008;	formula_1
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN driverStandings ds ON r.driverId = ds.driverId AND r.raceId = ds.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND ds.positionText = '2' AND ds.driverId IN (     SELECT driverId     FROM results     JOIN races ON results.raceId = races.raceId     WHERE races.name = 'Australian Grand Prix'     AND races.year = 2008     ORDER BY points DESC     LIMIT 1 );	formula_1
SELECT d.forename, d.surname, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time LIKE 'HH:%';	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN seasons s ON r.year = s.year WHERE d.nationality = 'British' AND s.year = 2008 AND r.name = 'Australian Grand Prix';	formula_1
SELECT      d.driverId,      d.name,      COUNT(DISTINCT r.raceId) AS raceCount FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      r.position IS NOT NULL AND     r.time IS NOT NULL AND     EXTRACT(YEAR FROM r.date) = 2008 AND     r.raceId IN (SELECT raceId FROM races WHERE year = 2008) GROUP BY      d.driverId,      d.name HAVING      COUNT(DISTINCT r.raceId) > 0;	formula_1
SELECT SUM(points)  FROM results  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT AVG(SUBSTRING_INDEX(`fastestLapTime`, ':', 1) * 60 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`fastestLapTime`, ':', -1), '.', 1) AS UNSIGNED)) AS avgFastestLapTime FROM `results` JOIN `drivers` ON `results.driverId` = `drivers.driverId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton';	formula_1
SELECT     (COUNT(CASE WHEN r.time IS NOT NULL THEN r.raceId END) * 1.0) / COUNT(r.raceId) AS completion_rate FROM     races r WHERE     r.year = 2008 AND r.name = 'Australian Grand Prix'	formula_1
SELECT      ((SUBTIME(SUBSTRING_INDEX(MAX(time), ':', -1), SUBSTRING_INDEX(SUM(time), ':', -1)) / SUBSTRING_INDEX(SUM(time), ':', -1)) * 100) AS percentage_faster FROM      results r JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.year = 2008 AND ra.name = 'Australian Grand Prix'	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT `lat`, `lng` FROM `circuits` WHERE `country` = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT MAX(points) AS max_points FROM constructorStandings JOIN constructors ON constructorStandings.constructorId = constructors.constructorId WHERE constructors.nationality = 'British';	formula_1
SELECT `constructors.name`, MAX(`constructorStandings.points`) AS max_points FROM `constructors` JOIN `constructorStandings` ON `constructors.constructorId` = `constructorStandings.constructorId` GROUP BY `constructors.name` ORDER BY max_points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.raceId = 291 AND cs.points = 0;	formula_1
SELECT COUNT(DISTINCT cs.constructorId) FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE c.nationality = 'Japanese' AND cs.points = 0 GROUP BY cs.constructorId HAVING COUNT(cs.raceId) = 2;	formula_1
SELECT c.name FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE r.rank = 1;	formula_1
SELECT COUNT(*) FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE c.nationality = 'French' AND r.laps > 50;	formula_1
SELECT      ROUND(         (COUNT(CASE WHEN d.driverId IN (SELECT r.driverId FROM results r INNER JOIN drivers d ON r.driverId = d.driverId WHERE d.nationality = 'Japanese' AND r.time IS NOT NULL AND r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.year BETWEEN 2007 AND 2009))           / COUNT(DISTINCT d.driverId FROM drivers d WHERE d.nationality = 'Japanese' AND d.driverId IN (SELECT r.driverId FROM results r WHERE r.raceId IN (SELECT r2.raceId FROM races r2 WHERE r2.year BETWEEN 2007 AND 2009))))         * 100,         2     ) AS race_completion_percentage FROM      drivers d;	formula_1
SELECT     s.year,     AVG(EXTRACT(EPOCH FROM TIMESTAMP(time))) AS average_time_seconds FROM     results r JOIN     seasons s ON r.raceId IN (         SELECT raceId FROM races WHERE year < 1975     ) JOIN     driverStandings ds ON r.driverId = ds.driverId AND r.raceId = ds.raceId JOIN     drivers d ON r.driverId = d.driverId JOIN     status st ON r.statusId = st.statusId WHERE     ds.position = 1 AND st.status = 'Finished' GROUP BY     s.year;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob > '1975-01-01' AND r.rank = 2;	formula_1
SELECT COUNT(*) FROM drivers d LEFT JOIN results r ON d.driverId = r.driverId WHERE d.nationality != 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results);	formula_1
SELECT r.fastestLap FROM races r JOIN results res ON r.raceId = res.raceId WHERE r.year = 2009 AND res.time = (SELECT MIN(time) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009))	formula_1
SELECT AVG(CAST(`fastestLapSpeed` AS REAL))  FROM `results`  JOIN `races` ON `results.raceId` = `races.raceId`  WHERE `races.name` = 'Spanish Grand Prix' AND `races.year` = 2009;	formula_1
SELECT r.name, r.year FROM races r JOIN (     SELECT raceId, MIN(milliseconds) AS min_milliseconds     FROM results     WHERE milliseconds IS NOT NULL     GROUP BY raceId ) AS shortest ON r.raceId = shortest.raceId ORDER BY shortest.min_milliseconds ASC LIMIT 1;	formula_1
SELECT     ROUND(         (COUNT(DISTINCT r.driverId) /           (SELECT COUNT(DISTINCT d.driverId)            FROM drivers d            WHERE d.dob < '1985-01-01' AND                  (YEAR(d.dob) BETWEEN 2000 AND 2005)          )) * 100, 2     ) AS percentage_of_qualified_drivers FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.laps > 50 AND d.dob < '1985-01-01' AND       (YEAR(d.dob) BETWEEN 2000 AND 2005)	formula_1
SELECT COUNT(*) FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE drivers.nationality = 'French' AND LENGTH(lapTimes.time) - LENGTH(REPLACE(lapTimes.time, ':', '')) < 3;	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM driverStandings  WHERE raceId = 18;	formula_1
SELECT      dob,      (YEAR(CURRENT_DATE) - YEAR(dob)) AS age,      nationality,     CASE          WHEN nationality = 'Dutch' THEN 1          ELSE 0      END AS isDutch FROM      drivers ORDER BY      age ASC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT      d.driverId,      d.nationality,      MIN(ps.time) AS earliest_lap_time FROM      drivers d JOIN      pitStops ps ON d.driverId = ps.driverId WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY      d.driverId ORDER BY      earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob LIKE '1971%' AND r.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results );	formula_1
SELECT d.driverId, d.nationality, d.dob, MAX(p.time) as latestLapTime FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'Spanish' AND YEAR(d.dob) < 1982 GROUP BY d.driverId ORDER BY latestLapTime DESC LIMIT 10;	formula_1
SELECT `year` FROM `races` JOIN `results` ON `races.raceId` = `results.raceId` WHERE `fastestLapTime` = (SELECT MIN(`fastestLapTime`) FROM `results`) GROUP BY `year` ORDER BY `year` LIMIT 1;	formula_1
SELECT r.year, MAX(lt.time) AS slowestLapTime FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId GROUP BY r.year ORDER BY slowestLapTime ASC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NULL;	formula_1
SELECT `location`, `lat`, `lng` FROM circuits WHERE `country` = 'Austria' GROUP BY `location`, `lat`, `lng`;	formula_1
SELECT raceId, COUNT(*) as finisher_count FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY finisher_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT s.year, d.name AS driver_name, r.date, r.time FROM drivers d JOIN races r ON d.driverId = r.driverId JOIN seasons s ON r.year = s.year WHERE d.dob = (SELECT MIN(dob) FROM drivers) AND r.position = 1 AND r.raceId IN (     SELECT raceId     FROM qualifying     GROUP BY raceId     HAVING COUNT(*) = 1 ) ORDER BY s.year ASC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN status ON results.statusId = status.statusId WHERE drivers.nationality = 'American' AND status.status = 'Puncture';	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId ORDER BY cs.wins DESC LIMIT 1;	formula_1
SELECT driverId, MAX(time) AS slowestLap3Time FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE name = 'French Grand Prix') AND lap = 3 GROUP BY driverId ORDER BY slowestLap3Time DESC LIMIT 1;	formula_1
SELECT      rt.raceId,      MIN(rt.milliseconds) as fastestLapTime FROM      lapTimes rt WHERE      rt.lap = 1 GROUP BY      rt.raceId ORDER BY      fastestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapTime)  FROM results  WHERE raceId IN (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix')  AND rank < 11;	formula_1
SELECT      d.forename || ' ' || d.surname AS fullName,     AVG(PS.duration) AS avgPitStopDuration FROM      drivers d JOIN      pitStops PS ON d.driverId = PS.driverId WHERE      d.nationality = 'German' AND     d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY      d.driverId ORDER BY      avgPitStopDuration ASC LIMIT 3;	formula_1
SELECT r.name, res.time FROM races r JOIN results res ON r.raceId = res.raceId WHERE r.name = 'Canadian Grand Prix' AND r.year = 2008 AND res.time LIKE '%%:%%:%%.%' ORDER BY CAST(SUBSTRING_INDEX(res.time, ':', 1) AS UNSIGNED) * 3600 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(res.time, ':', -2), ':', 1) AS UNSIGNED) * 60 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(res.time, ':', -1), '.', 1) AS UNSIGNED) LIMIT 1;	formula_1
SELECT c.constructorRef, c.url FROM constructors c JOIN results r ON c.constructorId = r.constructorId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = '2009 Singapore Grand Prix' AND r.time = (SELECT MIN(time) FROM results WHERE raceId = ra.raceId)	formula_1
SELECT `forename`, `surname`, `dob` FROM `drivers` WHERE `nationality` = 'Austrian' AND YEAR(`dob`) BETWEEN 1981 AND 1991;	formula_1
SELECT CONCAT(forename, ' ', surname) AS `full_name`, `url`, `dob` FROM `drivers` WHERE `nationality` = 'German' AND YEAR(`dob`) BETWEEN '1971' AND '1985' ORDER BY `dob` DESC;	formula_1
SELECT `country`, `lat`, `lng` FROM `circuits` WHERE `name` = 'Hungaroring';	formula_1
SELECT c.name, c.nationality, cr.points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.constructorId = c.constructorId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT AVG(points)  FROM driverStandings  JOIN drivers ON driverStandings.driverId = drivers.driverId  JOIN races ON driverStandings.raceId = races.raceId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(COUNT(`year`)) AS average_races FROM `races` WHERE `date` BETWEEN '2000-01-01' AND '2010-12-31';	formula_1
SELECT nationality  FROM drivers  GROUP BY nationality  ORDER BY COUNT(*) DESC  LIMIT 1;	formula_1
SELECT wins  FROM driverStandings  WHERE points = (SELECT MAX(points) FROM driverStandings WHERE points < (SELECT MAX(points) FROM driverStandings)) ORDER BY points DESC  LIMIT 1;	formula_1
SELECT r.name  FROM races r  JOIN results rs ON r.raceId = rs.raceId  WHERE rs.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results);	formula_1
SELECT c.location, r.date FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races)	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.driverId = r.circuitId WHERE r.year = 2008 AND r.name = 'Malaysian Grand Prix' AND q.q3 = (     SELECT MIN(q3)     FROM qualifying     WHERE driverId IN (         SELECT driverId         FROM races         WHERE year = 2008 AND circuitId = 2     ) );	formula_1
SELECT d.forename, d.surname, d.nationality, r.name AS raceName FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.name = 'Canadian Grand Prix'  AND results.statusId = (SELECT statusId FROM status WHERE status = 'Accident');	formula_1
SELECT d.forename, d.surname, ds.wins  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  WHERE d.dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT MAX(duration) AS longest_pit_stop FROM pitStops;	formula_1
SELECT MIN(time) AS fastestLapTime FROM `lapTimes`	formula_1
SELECT MAX(`duration`) AS longest_pit_stop_duration FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton');	formula_1
SELECT `pitStops.lap` FROM `pitStops` JOIN `races` ON `pitStops.raceId` = `races.raceId` JOIN `drivers` ON `pitStops.driverId` = `drivers.driverId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton' AND `races.year` = 2011 AND `races.name` = 'Australian Grand Prix';	formula_1
SELECT `duration` FROM `pitStops` JOIN `races` ON `pitStops.raceId` = `races.raceId` WHERE `races.year` = 2011 AND `races.name` = 'Australian Grand Prix';	formula_1
SELECT MIN(`time`) AS `lap_record` FROM `lapTimes` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis');	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN (     SELECT MIN(TIMESTAMPDIFF(SECOND, '00:00:00', time)) as minTime     FROM lapTimes ) as shortestLap ON lt.milliseconds = shortestLap.minTime WHERE d.driverId IN (     SELECT driverId     FROM lapTimes     GROUP BY driverId     ORDER BY lt.milliseconds ASC     LIMIT 20 );	formula_1
SELECT `position` FROM `lapTimes` INNER JOIN `drivers` ON `lapTimes.driverId` = `drivers.driverId` WHERE `drivers.forename` = 'Lewis' AND `drivers.surname` = 'Hamilton' ORDER BY `lapTimes.time` ASC LIMIT 1;	formula_1
SELECT MIN(`fastestLapTime`) AS `lapRecord` FROM `results` WHERE `raceId` IN (     SELECT `raceId`     FROM `races`     WHERE `name` = 'Austrian Grand Prix' );	formula_1
SELECT c.circuitId, c.country FROM circuits c WHERE c.country = 'Italy';	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit';	formula_1
SELECT pitStops.duration FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Austrian Grand Prix' AND pitStops.duration IS NOT NULL ORDER BY CAST(pitStops.duration AS REAL) ASC LIMIT 1;	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes lt ON r.raceId = lt.raceId WHERE lt.time = '1:29.488';	formula_1
SELECT AVG(`milliseconds`)  FROM `pitStops`  WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `surname` = 'Hamilton' AND `forename` = 'Lewis');	formula_1
SELECT AVG(l.milliseconds)  FROM lapTimes AS l  JOIN circuits AS c ON l.raceId IN (SELECT raceId FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy'))	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name, height  FROM Player  WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT `preferred_foot`  FROM `Player_Attributes` WHERE `potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`)	european_football_2
SELECT COUNT(*) FROM `Player_Attributes` WHERE `overall_rating` BETWEEN 60 AND 65 AND `defensive_work_rate` = 'low';	european_football_2
SELECT id  FROM `Player_Attributes` ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT L.name  FROM League L  JOIN Match M ON L.id = M.league_id  WHERE M.season = '2015/2016'  GROUP BY L.name  ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC  LIMIT 1;	european_football_2
SELECT home_team, COUNT(*) FROM matches WHERE season = '2015/2016' AND (home_team_goal < away_team_goal) GROUP BY home_team ORDER BY COUNT(*) ASC LIMIT 1;	european_football_2
SELECT player_name FROM players ORDER BY penalties DESC LIMIT 10;	european_football_2
SELECT Team.team_long_name FROM Team JOIN Match ON Team.team_api_id = Match.away_team_api_id WHERE Match.season = '2009/2010' AND Match.home_team_goal < Match.away_team_goal GROUP BY Team.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT TeamName, buildUpPlaySpeed FROM Teams WHERE TeamID IN (     SELECT TeamID     FROM Teams     ORDER BY buildUpPlaySpeed DESC     LIMIT 4 ) ORDER BY buildUpPlaySpeed DESC;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(CASE WHEN M.home_team_goal = M.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT      Player.birthday,     TIMESTAMPDIFF(YEAR, Player.birthday, CURDATE()) AS Age FROM      Player WHERE      TIMESTAMPDIFF(YEAR, Player.birthday, CURDATE()) >= TIMESTAMPDIFF(YEAR, '1989-12-15', CURDATE()) - 2     AND TIMESTAMPDIFF(YEAR, Player.birthday, CURDATE()) <= TIMESTAMPDIFF(YEAR, '1992-02-29', CURDATE())     AND Player.birthday IN (         SELECT birthday         FROM Player         WHERE sprint_speed >= 97         AND YEAR(date) BETWEEN 2013 AND 2015     );	european_football_2
SELECT league_name, COUNT(league_id) AS total_matches FROM leagues GROUP BY league_name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT team_long_name FROM matches WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing > (SELECT SUM(buildUpPlayPassing) / COUNT(team_long_name)                           FROM matches                           WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012') AND buildUpPlayPassing IS NOT NULL;	european_football_2
SELECT      (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100) / COUNT(player_fifa_api_id) AS left_foot_prefer_percentage FROM players WHERE YEAR(birthday) BETWEEN 1987 AND 1992;	european_football_2
SELECT league, SUM(home_team_goal + away_team_goal) AS total_goals FROM matches GROUP BY league ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT DIVIDE(SUM(long_shots), COUNT(player_fifa_api_id))  FROM matches  WHERE player_name = 'Ahmed Samir Farag';	european_football_2
SELECT Player.name,         (SUM(HeadingAccuracy.heading_accuracy) / COUNT(HeadingAccuracy.player_fifa_api_id)) AS avg_heading_accuracy FROM Player JOIN HeadingAccuracy ON Player.player_fifa_api_id = HeadingAccuracy.player_fifa_api_id WHERE Player.height > 180 GROUP BY Player.player_fifa_api_id, Player.name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT team_long_name FROM matches WHERE buildUpPlayDribblingClass = 'Normal' AND date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00' GROUP BY team_long_name HAVING chanceCreationPassing < (SUM(chanceCreationPassing) / COUNT(id)) ORDER BY chanceCreationPassing DESC;	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal)	european_football_2
SELECT `team_short_name` FROM `Team` WHERE `team_long_name` = 'Queens Park Rangers'	european_football_2
SELECT `player_name` FROM `Player` WHERE SUBSTR(`birthday`, 1, 7) = '1970-10';	european_football_2
SELECT     p.name,     (SUM(pp.shots_on_target) + SUM(pp.key_passes) + SUM(pp.tackles_won_attacking_third)) / SUM(m.minutes_played) AS attacking_work_rate FROM     players p JOIN     matches m ON p.player_id = m.player_id JOIN     player_performance pp ON p.player_id = pp.player_id AND m.match_id = pp.match_id WHERE     p.name = 'Franco Zennaro' GROUP BY     p.player_id	european_football_2
SELECT     SUM(CASE WHEN buildUpPlayPositioningClass = 'First Two Thirds' THEN 1 ELSE 0 END) AS freedom_of_movement_first_two_thirds FROM     match_data WHERE     team_long_name = 'ADO Den Haag';	european_football_2
SELECT header_accuracy FROM player_performance WHERE player_name = 'Francois Affolter' AND date = '2014-09-18 00:00:00';	european_football_2
SELECT AVG(rating) AS overall_rating FROM player_ratings WHERE player_name = 'Gabriel Tamas' AND strftime('%Y', date) = '2011';	european_football_2
SELECT COUNT(*) FROM Matches WHERE Season = '2015/2016' AND League.name = 'Scotland Premier League';	european_football_2
SELECT preferred_foot FROM players WHERE birthday = (SELECT MIN(birthday) FROM players)	european_football_2
SELECT * FROM `Player_Attributes` WHERE `potential` = (SELECT MAX(`potential`) FROM `Player_Attributes`);	european_football_2
SELECT COUNT(*) FROM players WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT team_short_name FROM football_teams WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate FROM football_players WHERE name = 'David Wilson';	european_football_2
SELECT birthday FROM players WHERE overall_rating = (SELECT MAX(overall_rating) FROM players);	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM Match  WHERE name = 'Poland' AND season = '2010/2011' GROUP BY season;	european_football_2
SELECT pa.player_api_id, AVG(pa.finishing) as avg_finishing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.height BETWEEN (SELECT MAX(height) FROM Player) AND (SELECT MIN(height) FROM Player) GROUP BY pa.player_api_id ORDER BY avg_finishing DESC LIMIT 1;	european_football_2
SELECT `player_name` FROM `Player` WHERE `height` > 180;	european_football_2
SELECT COUNT(*) FROM `Player` WHERE strftime('%Y', `birthday`) > '1990';	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `player_name` LIKE 'Adam%' AND `weight` > 170;	european_football_2
SELECT DISTINCT name FROM players WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010';	european_football_2
SELECT potential FROM players WHERE first_name = 'Aaron' AND last_name = 'Doran';	european_football_2
SELECT * FROM players WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name  FROM teams  WHERE buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM TeamStats WHERE team_short_name = 'CLB' AND match_result = 'Win';	european_football_2
SELECT team_short_name FROM teams WHERE buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating)  FROM players t1 JOIN ratings t2 ON t1.id = t2.player_id WHERE Player.height > 170  AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015'	european_football_2
SELECT player_name FROM players ORDER BY height ASC LIMIT 1;	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Italy Serie A';	european_football_2
SELECT team_short_name  FROM football_teams  WHERE buildUpPlaySpeed = 31    AND buildUpPlayDribbling = 53    AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating)  FROM players  WHERE name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Matches WHERE League_name = 'Germany 1. Bundesliga' AND       strftime('%Y-%m', Match_date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT team_short_name FROM football_teams WHERE home_team_goal = 10;	european_football_2
SELECT * FROM football_players WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM football_players);	european_football_2
SELECT      ABS(AVG(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE NULL END) - AVG(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE NULL END)) AS diff_avg_ball_control FROM      your_table_name;	european_football_2
SELECT `team_long_name`  FROM `Team`  WHERE `team_short_name` = 'GEN';	european_football_2
SELECT      CASE          WHEN birthday < '1989-12-15 00:00:00' THEN 'Aaron Lennon'          ELSE 'Abdelaziz Barrada'      END AS older_player FROM      Player  WHERE      player_name = 'Aaron Lennon' OR      player_name = 'Abdelaziz Barrada';	european_football_2
SELECT `player_name`, `height` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`)	european_football_2
SELECT COUNT(*) FROM `Player_Attributes` WHERE `preferred_foot` = 'left' AND `attacking_work_rate` = 'low';	european_football_2
SELECT country FROM league WHERE name = 'Belgium Jupiler League';	european_football_2
SELECT DISTINCT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany';	european_football_2
SELECT player_name FROM players WHERE overall_rating = (SELECT MAX(overall_rating) FROM players);	european_football_2
SELECT COUNT(DISTINCT player_id) FROM players WHERE strftime('%Y', birthday) < '1986' AND defensive_work_rate = 'high';	european_football_2
SELECT      p.player_name,     COUNT(*) AS total_crossings,     ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rank FROM      crossing_actions ca JOIN      players p ON ca.player_id = p.id WHERE      p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY      p.player_name ORDER BY      rank = 1;	european_football_2
SELECT      SUM(CASE WHEN heading = 'Correct' THEN 1 ELSE 0 END) AS correct_headings,     COUNT(*) AS total_headings,     (SUM(CASE WHEN heading = 'Correct' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) AS heading_accuracy FROM      heading_data WHERE      player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(*) FROM players WHERE height > 180 AND volleys > 70;	european_football_2
SELECT name FROM players WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Matches WHERE Season = '2008/2009' AND Country.name = 'Belgium';	european_football_2
SELECT MAX(long_passing) AS max_long_passing FROM players WHERE birthday = (SELECT MIN(birthday) FROM players);	european_football_2
SELECT COUNT(*) FROM matches WHERE League_name = 'Belgium Jupiler League' AND SUBSTR(date, 1, 7) = '2009-04';	european_football_2
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2008/2009' GROUP BY League.name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM players WHERE strftime('%Y', birthday) < '1986';	european_football_2
SELECT      (         (SELECT overall_rating           FROM players           WHERE player_name = 'Ariel Borysiuk') -          (SELECT overall_rating           FROM players           WHERE player_name = 'Paulin Puel')     ) / (SELECT overall_rating           FROM players           WHERE player_name = 'Paulin Puel') * 100	european_football_2
SELECT AVG(buildUpPlaySpeed)  FROM TeamPerformance  WHERE team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) FROM players AS T1 WHERE T1.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(crossing) AS total_crossing_score FROM table_name WHERE player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass FROM matches WHERE team_long_name = 'Ajax' GROUP BY chanceCreationPassingClass ORDER BY chanceCreationPassing DESC LIMIT 1;	european_football_2
SELECT preferred_foot  FROM players  WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating)  FROM T2  WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal)  FROM Matches  WHERE team_long_name = 'Parma' AND home_team_id = (SELECT id FROM Country WHERE name = 'Italy');	european_football_2
SELECT name FROM players WHERE overall_rating = 77 AND date LIKE '2016-06-23%' ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT overall_rating FROM ratings WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%';	european_football_2
SELECT potential FROM player_performance WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00';	european_football_2
SELECT attacking_work_rate FROM player_performance WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate  FROM player_performance  WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' ORDER BY crossing DESC LIMIT 1;	european_football_2
SELECT build_up_play_speed_class FROM match_data WHERE team_long_name = 'Willem II' AND date = '2012-02-22'	european_football_2
SELECT      play_dribbling_class FROM      matches WHERE      team_short_name = 'LEI'      AND date = '2015-09-10 00:00:00';	european_football_2
SELECT play_passing_class  FROM matches  WHERE team_long_name = 'FC Lorient'  AND date LIKE '2010-02-22%';	european_football_2
SELECT   SUM(CASE WHEN event_type = 'Pass' THEN 1 ELSE 0 END) AS passing_attempts,   SUM(CASE WHEN event_type = 'Goal' THEN 1 ELSE 0 END) AS goals_scored FROM   matches WHERE   team_long_name = 'PEC Zwolle'   AND date = '2013-09-20 00:00:00'	european_football_2
SELECT chance_creation FROM matches WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00'	european_football_2
SELECT defence_aggression_class FROM matches WHERE team_long_name = 'Hannover 96' AND date LIKE '2015-09-10%';	european_football_2
SELECT AVG(overall_rating)  FROM player_ratings  WHERE player_name = 'Marko Arnautovic'  AND date BETWEEN '2007-02-22' AND '2016-04-21' AND date LIKE '____-__-__' LIMIT 10;	european_football_2
SELECT      ROUND(         (             (SELECT overall_rating               FROM player_ratings               WHERE player_name = 'Landon Donovan' AND date = '2013-07-12') -              (SELECT overall_rating               FROM player_ratings               WHERE player_name = 'Jordan Bowery' AND date = '2013-07-12')         ) /          (SELECT overall_rating           FROM player_ratings           WHERE player_name = 'Landon Donovan' AND date = '2013-07-12') * 100, 2     ) AS percentage_difference FROM      dual;	european_football_2
SELECT player_name  FROM Player  ORDER BY height DESC  LIMIT 1;	european_football_2
SELECT `player_api_id` FROM `Player` ORDER BY `weight` DESC LIMIT 10;	european_football_2
SELECT `player_name`  FROM `Player`  WHERE DATEDIFF(CURRENT_TIMESTAMP, STR_TO_DATE(`birthday`, '%Y-%m-%d %H:%i:%s')) > 34 * 365;	european_football_2
SELECT SUM(goals_scored) AS total_goals FROM match_stats WHERE player_name = 'Aaron Lennon' AND team_position = 'Home Team';	european_football_2
SELECT SUM(g Goals)  FROM Matches m JOIN Goals g ON m.MatchID = g.MatchID JOIN Players p ON g.PlayerID = p.PlayerID WHERE p.PlayerName IN ('Daan Smith', 'Filipe Ferreira') AND g.Team = 'Away';	european_football_2
SELECT SUM(home_team_goals) AS total_goals FROM (     SELECT home_team_goals     FROM Match     WHERE TIMESTAMPDIFF(YEAR, birthday, CURRENT_TIMESTAMP) < 31 ) AS eligible_players_goals	european_football_2
SELECT `Player.player_name` FROM `Player` JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `Player_Attributes.overall_rating` = (     SELECT MAX(`overall_rating`)     FROM `Player_Attributes` )	european_football_2
SELECT name FROM players WHERE potential = (SELECT MAX(potential) FROM players);	european_football_2
SELECT DISTINCT P.player_name FROM players P JOIN game_actions GA ON P.player_id = GA.player_id JOIN game_stats GS ON GA.game_id = GS.game_id WHERE GS.attack_work_rate = 'high' AND GS.action_type = 'attack' AND P.player_id IN (     SELECT GA2.player_id     FROM game_actions GA2     JOIN game_stats GS2 ON GA2.game_id = GS2.game_id     WHERE GS2.attack_work_rate = 'high'     AND GS2.action_type = 'attack' )	european_football_2
SELECT name FROM players WHERE finishing = 1 AND (SUBTRACT(datetime(CURRENT_TIMESTAMP,'localtime'), datetime(birthday)) =      (SELECT MAX(SUBTRACT(datetime(CURRENT_TIMESTAMP,'localtime'), datetime(birthday)))       FROM players WHERE finishing = 1)) ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT player_name FROM players WHERE country = 'Belgium';	european_football_2
SELECT country, name FROM players WHERE vision > 89;	european_football_2
SELECT country FROM players GROUP BY country ORDER BY AVG(weight) DESC LIMIT 1;	european_football_2
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT team_short_name FROM matches WHERE chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height) AS avg_height FROM Player JOIN Country ON Player.id = Country.id WHERE Country.id = (SELECT id FROM Country WHERE name = 'Italy');	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM `Player` WHERE `player_name` LIKE 'Aaron%' AND `birthday` > '1990'	european_football_2
SELECT (j JumpingScorePlayer6, j JumpingScorePlayer23) FROM Players WHERE id = 6 OR id = 23 UNION ALL SELECT (j JumpingScorePlayer6, j JumpingScorePlayer23) FROM Players WHERE id = 6 AND id = 23 ORDER BY id;	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' AND potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') LIMIT 5;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left';	european_football_2
SELECT      ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM Player_Attributes), 2) AS percentage FROM      Player_Attributes WHERE      stamina > 80 AND strength > 80;	european_football_2
SELECT `Country`.`name` FROM `League` JOIN `Country` ON `League`.`country_id` = `Country`.`id` WHERE `League`.`name` = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal FROM matches WHERE match_date = '2008-09-24' AND league_name = 'Belgium Jupiler League'	european_football_2
SELECT acceleration, agility, sprint_speed FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Alexis Blin';	european_football_2
SELECT     CASE         WHEN AVG(buildUpPlaySpeedClass) < 50 THEN 'slow'         WHEN AVG(buildUpPlaySpeedClass) BETWEEN 50 AND 80 THEN 'balanced'         ELSE 'fast'     END AS speed_class FROM     TeamStats WHERE     team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*)  FROM matches  WHERE season = '2015/2016'  AND league = 'Serie A';	european_football_2
SELECT MAX(home_team_goal) AS highest_home_team_score FROM Eredivisie WHERE home_team IS NOT NULL;	european_football_2
SELECT pa.finishing, pa.curve FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT L.name, COUNT(M.id) AS total_games FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY total_games DESC LIMIT 4;	european_football_2
SELECT team_long_name FROM match WHERE away_team_api_id = (     SELECT away_team_api_id     FROM match     GROUP BY away_team_api_id     ORDER BY SUM(away_team_goal) DESC     LIMIT 1 );	european_football_2
SELECT MAX(overall_rating) FROM `Player_Attributes`	european_football_2
SELECT      (COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END) * 100.0) / COUNT(id) AS percentage FROM      players;	european_football_2
SELECT      (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) -       COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) /      (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) +       COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) * 100 AS PercentageDeviation FROM      Patient;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Birthday` > '1930' THEN 1 END) / COUNT(`SEX`)) * 100 AS PercentageOfFemalesBornAfter1930 FROM      `Patient` WHERE      `SEX` = 'F';	thrombosis_prediction
SELECT     (SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN 1930 AND 1940 AND Admission = '+') * 100.0 /     (SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN 1930 AND 1940)	thrombosis_prediction
SELECT      (COUNT(CASE WHEN Admission = '+' THEN 1 END) / COUNT(CASE WHEN Admission = '-' THEN 1 END)) AS Ratio FROM Patient WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT p.Diagnosis, l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.`Symptoms` FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT      p.ID,      TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RVVT = '+';	thrombosis_prediction
SELECT      p.ID,      p.SEX,      e.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.Thrombosis = 2;	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(P.Birthday) = 1937 AND L.T-CHO >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALB < 3.5;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Laboratory.TP` < 6.0 OR `Laboratory.TP` > 8.5 THEN 1 END) / COUNT(`Patient.ID`)) * 100 AS Percentage FROM `Patient` INNER JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.SEX` = 'F'	thrombosis_prediction
SELECT AVG(`aCL IgG`)  FROM `Examination`  JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.Admission` = '+' AND `Patient.Birthday` <= DATE_SUB(CURDATE(), INTERVAL 50 YEAR);	thrombosis_prediction
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'F'   AND YEAR(`Description`) = 1997   AND `Admission` = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS YoungestPatientAge FROM `Patient` WHERE `First Date` IS NOT NULL ORDER BY YoungestPatientAge ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`Examination Date` = '1997-05-27'  AND E.Thrombosis = 1  AND P.SEX = 'F';	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE TG >= 200 )	thrombosis_prediction
SELECT      P.Diagnosis,      E.Symptoms FROM      Examination E JOIN      Patient P ON E.ID = P.ID WHERE      E.Symptoms IS NOT NULL AND      P.Birthday = (SELECT MIN(Birthday) FROM Patient);	thrombosis_prediction
SELECT      COUNT(DISTINCT L.ID) / 12 AS AverageMonthlyMalePatients FROM      Laboratory L JOIN      Patient P ON L.ID = P.ID WHERE      P.SEX = 'M' AND      L.Date BETWEEN '1998-01-01' AND '1998-12-31';	thrombosis_prediction
SELECT      p.Birthday,      l.Date AS LabWorkDate,      (YEAR(l.Date) - YEAR(p.Birthday)) AS AgeAtArrival FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Diagnosis = 'SJS' ORDER BY      p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Patient.SEX` = 'M' AND `Laboratory.UA` <= 8.0 THEN 1 ELSE 0 END)      / NULLIF(SUM(CASE WHEN `Patient.SEX` = 'F' AND `Laboratory.UA` <= 6.5 THEN 1 ELSE 0 END), 0)) AS male_to_female_ratio FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID`	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE NOT EXISTS (     SELECT 1     FROM Examination     WHERE Examination.ID = Patient.ID AND           Examination.ExaminationDate >= DATE_SUB(Patient.FirstDate, INTERVAL 1 YEAR) )	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday < '1975-01-01' AND YEAR(E.Examination Date) BETWEEN 1990 AND 1993;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.T_BIL >= 2.0;	thrombosis_prediction
SELECT E.Diagnosis, COUNT(E.Diagnosis) as Count FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY E.Diagnosis ORDER BY Count DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(CURRENT_DATE), YEAR(Birthday))) AS AverageAge FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT      (YEAR(CURRENT_DATE) - YEAR(Birthday)) AS Age,      Diagnosis FROM      Patient  JOIN      Laboratory  ON      Patient.ID = Laboratory.ID WHERE      HGB = (SELECT MAX(HGB) FROM Laboratory)	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT `T-CHO` FROM `Laboratory`  WHERE `ID` = 2927464 AND `Date` = '1995-09-04' AND `T-CHO` < 250;	thrombosis_prediction
SELECT SEX  FROM Patient  WHERE Diagnosis = 'AORTITIS'  ORDER BY `First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM `Examination` WHERE `Examination Date` = '1993-11-12' AND `ID` IN (     SELECT `ID`     FROM `Patient`     WHERE `Description` = '1994-02-19'     AND `Diagnosis` = 'SLE' );	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.GPT = 9 AND l.Date = '1992-06-12';	thrombosis_prediction
SELECT      (YEAR('1991-10-21') - YEAR(`Birthday`)) AS AgeAtTest FROM      `Patient` JOIN      `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE      `Laboratory.Date` = '1991-10-21' AND      `Laboratory.UA` = 8.4;	thrombosis_prediction
SELECT COUNT(`Laboratory.ID`)  FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.First Date` = '1991-06-13'  AND `Patient.Diagnosis` = 'SJS'  AND YEAR(`Laboratory.Date`) = 1995;	thrombosis_prediction
SELECT p.`Diagnosis` AS Original_Diagnosis FROM `Patient` p JOIN `Examination` e ON p.ID = e.ID WHERE e.`Examination Date` = '1997-01-27' AND p.`First Date` = (SELECT MIN(`First Date`) FROM `Patient` WHERE ID = p.ID) AND e.Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT e.Symptoms FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.Birthday = '1959-03-01' AND e.Examination_Date = '1993-09-27';	thrombosis_prediction
SELECT     (         SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN l.T-CHO ELSE 0 END) -         SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-12-%' THEN l.T-CHO ELSE 0 END)     ) / NULLIF(         SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN 1 ELSE 0 END),         0     ) AS DecreaseRate FROM     Patient p JOIN     Laboratory l ON p.ID = l.ID WHERE     p.Birthday = '1959-02-18';	thrombosis_prediction
SELECT DISTINCT `ID` FROM `Examination` WHERE `Diagnosis` LIKE '%Behcet%' AND `Examination Date` BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT `ID` FROM `Laboratory` WHERE `Date` BETWEEN '1987-07-06' AND '1996-01-31' AND `GPT` > 30 AND `ALB` < 4 GROUP BY `ID`;	thrombosis_prediction
SELECT ID  FROM `Patient`  WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'  ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > AVG(`aCL IgM`) * 1.2;	thrombosis_prediction
SELECT      ROUND(         (COUNT(CASE WHEN UA <= 6.5 THEN 1 ELSE NULL END) /           COUNT(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 ELSE NULL END) * 100),          2     ) AS percentage FROM      Laboratory WHERE      `U-PRO` > 0 AND `U-PRO` < 30	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Diagnosis` = 'BEHCET' THEN 1 ELSE 0 END) / COUNT(`Diagnosis` = 'BEHCET' AND `First Date` BETWEEN '1981-01-01' AND '1981-12-31')) * 100 AS PercentageOfMalePatientsDiagnosedWithBEHCET FROM      `Patient` WHERE      `SEX` = 'M' AND      `First Date` BETWEEN '1981-01-01' AND '1981-12-31';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND ID NOT IN (     SELECT ID     FROM Examination     WHERE `ANA Pattern` = 'P' );	thrombosis_prediction
SELECT p.SEX  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Diagnosis = 'PSS'  AND l.CRP > 2  AND l.CRE = 1  AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB)  FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'F' AND P.Diagnosis = 'SLE' AND L.PLT > 400;	thrombosis_prediction
SELECT MAX(Symptoms)  FROM Examination  WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT `First Date`, `Diagnosis`  FROM `Patient`  WHERE `ID` = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT `ID`) FROM `Laboratory` WHERE `Date` BETWEEN '1997-01-01' AND '1997-12-31' AND `ALB` > 6 OR `ALB` < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) * 1.0) /      SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) * 100 AS Proportion_SLE_With_Thrombocytopenia FROM Examination;	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      `Patient` WHERE      YEAR(Birthday) = 1980 AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M'    AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'   AND E.Diagnosis LIKE '%Behcet%'   AND E.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination.Date`, `Patient.First Date`)  FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.ID` = 821298;	thrombosis_prediction
SELECT      CASE          WHEN L.UA > 8.0 AND P.SEX = 'M' OR L.UA > 6.5 AND P.SEX = 'F' THEN 'Within Normal Range'         ELSE 'Not Within Normal Range'     END AS Uric_Acid_Range FROM      Patient P LEFT JOIN      Laboratory L ON P.ID = L.ID WHERE      P.ID = 57266;	thrombosis_prediction
SELECT Date  FROM Laboratory  WHERE ID = 27654 AND GOT >= 60;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND YEAR(Laboratory.Date) = 1994;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60;	thrombosis_prediction
SELECT `Patient.Diagnosis` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.GPT` > 60 ORDER BY `Patient.Birthday` ASC;	thrombosis_prediction
SELECT AVG(LDH)  FROM Laboratory  WHERE LDH < 500;	thrombosis_prediction
SELECT p.ID, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT      P.Admission,      CASE          WHEN L.ALP < 300 THEN 'Inpatient'         ELSE 'Outpatient'     END AS TreatmentType FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.ALP IS NOT NULL;	thrombosis_prediction
SELECT      p.ID,      l.ALP FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday = '1982-04-01'     AND l.ALP < 300;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT ID, (TP - 8.5) AS TP_Deviation FROM Laboratory WHERE SEX = 'F' AND TP > 8.5;	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB <= 3.5 OR l.ALB >= 5.5 ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT p.ID, CASE WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range' ELSE 'Not in Normal Range' END AS AlbuminStatus FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1982;	thrombosis_prediction
SELECT      ROUND(         (COUNT(*) FILTER (WHERE `Laboratory.UA` > 6.5 AND `Patient.SEX` = 'F') * 100.0) / COUNT(*),         2     ) AS percentage_beyond_normal_range FROM      `Patient` JOIN      `Laboratory` ON      `Patient.ID` = `Laboratory.ID` WHERE      `Patient.SEX` = 'F';	thrombosis_prediction
SELECT AVG(UA) AS Average_UA FROM Laboratory WHERE ID IN (     SELECT ID     FROM Patient     WHERE (SEX = 'M' AND UA < 8.0) OR (SEX = 'F' AND UA < 6.5) ) AND Date = (     SELECT MAX(Date)     FROM Laboratory     WHERE ID IN (         SELECT ID         FROM Patient         WHERE (SEX = 'M' AND UA < 8.0) OR (SEX = 'F' AND UA < 6.5)     )     AND ID = Laboratory.ID );	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN < 30 AND Patient.Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN SEX = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END)) >      (SUM(CASE WHEN SEX = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END)) AS male_not_normal_count_greater FROM      Laboratory  JOIN      Patient ON Laboratory.ID = Patient.ID;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday  FROM      Patient p  JOIN      Laboratory l ON p.ID = l.ID  WHERE      l.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory)	thrombosis_prediction
SELECT      p.SEX,      GROUP_CONCAT(DISTINCT p.ID) AS Patient_IDs,      SUM(CASE WHEN l.T_BIL >= 2.0 THEN 1 ELSE 0 END) AS Abnormal_Bilirubin_Count FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID GROUP BY      p.SEX;	thrombosis_prediction
SELECT p.ID, SUM(l.T-CHO) AS TotalTCHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID ORDER BY p.Birthday ASC, TotalTCHO DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(SUBTRACT(YEAR(NOW()), YEAR(`Birthday`)), COUNT(`ID`))) FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.SEX` = 'M' AND `Laboratory.T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.Diagnosis, l.TG FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient.ID`)  FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Patient.Birthday` BETWEEN '1936-01-01' AND '1956-12-31' AND `Patient.SEX` = 'M' AND `Laboratory.CPK` >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.T-CHO < 250;	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.First_Date) = 1991 AND l.GLU < 180;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY p.SEX ORDER BY p.Birthday;	thrombosis_prediction
SELECT p.ID, p.Diagnosis, (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC < 3.5;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday,      p.Admission,      l.RBC,      CASE          WHEN l.RBC <= 3.5 OR l.RBC >= 6.0 THEN 'Yes'          ELSE 'No'      END AS AbnormalRBC FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.SEX = 'F'      AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) >= 50      AND (l.RBC <= 3.5 OR l.RBC >= 6.0);	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.HGB < 10;	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P WHERE P.Diagnosis = 'SLE' AND P.Birthday = (     SELECT MIN(Birthday)     FROM Patient     WHERE Diagnosis = 'SLE'     AND HGB BETWEEN 10 AND 17 ) AND EXISTS (     SELECT 1     FROM Laboratory L     WHERE L.ID = P.ID     AND L.HGB BETWEEN 10 AND 17 );	thrombosis_prediction
SELECT p.ID, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID HAVING COUNT(l.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) AS average_hematocrit_below_normal FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT     SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS 'LowerThanNormal',     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS 'HigherThanNormal' FROM Laboratory WHERE PLT < 100 OR PLT > 400;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = 1984 AND SUBSTR(p.Birthday, 6, 2) < 50 AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      (SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END)  FROM      Patient  JOIN      Laboratory ON Patient.ID = Laboratory.ID  WHERE      (YEAR(CURDATE()) - YEAR(Birthday)) > 55	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.First_Date > '1992-01-01' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE `Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  WHERE e.APTT > 45 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT l.ID)  FROM Laboratory AS l JOIN Patient AS p ON l.ID = p.ID WHERE p.SEX = 'M'  AND l.WBC > 3.5 AND l.WBC < 9.0  AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Birthday > '1980-01-01'  AND Laboratory.FG IS NOT NULL  AND Laboratory.FG < 150 OR Laboratory.FG > 450;	thrombosis_prediction
SELECT `Patient`.`Diagnosis` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`U-PRO` >= 30;	thrombosis_prediction
SELECT `Patient.ID` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.U-PRO` BETWEEN 0 AND 30 AND `Patient.Diagnosis` = 'SLE'	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL_IgG >= 2000;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.IGG > 900 AND L.IGG < 2000 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis FROM Patients WHERE IGA = (SELECT MAX(IGA) FROM Patients WHERE IGA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.IGA BETWEEN 80 AND 500 AND YEAR(P.First_Date) >= 1990;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) as DiseaseCount FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGM <= 40 OR Laboratory.IGM >= 400 GROUP BY Diagnosis ORDER BY DiseaseCount DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID AND e.CRP = '+' WHERE e.CRP IS NULL AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5 AND SUBTRACT(YEAR(CURDATE()), YEAR(P.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE e.KCT = '+' AND l.RA IN('-', '+-');	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday > '1985-01-01' AND e.RA IN('-', '+-');	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF < 20 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 0 AND l.RF < 20;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.ANA_Pattern = 'P' AND L.C3 > 35;	thrombosis_prediction
SELECT E.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.ID IN (     SELECT L.ID     FROM Laboratory L     WHERE L.HCT < 29 OR L.HCT > 52 ) ORDER BY E.aCL_IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis LIKE '%APS%' AND Laboratory.C4 > 10;	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND l.RNP IN ('-', '+-');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN('-', '+-') ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE SM IN('-', '+-') AND Thrombosis = 0;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SM NOT IN ('negative', '0') ORDER BY p.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT L.ID FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.Date > '1997-01-01' AND L.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND e.`SC170` IN('negative', '0') AND e.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'F' AND        Examination.SSA IN('-','+-') AND        YEAR(Patient.`First Date`) < 2000;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA NOT IN ('negative', '0') ORDER BY p.First_Date LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.SSB IN('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.SSB IN ('negative', '0') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CENTROMEA IN('-', '+-') AND l.SSB IN('-', '+-');	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.Description IS NULL AND l.DNA < 8;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`aCL IgG` BETWEEN 900 AND 2000 AND p.Admission = '+';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN `Laboratory.GOT` >= 60 AND `Patient.Diagnosis` = 'SLE' THEN `Patient.ID` END) * 1.0) /      COUNT(CASE WHEN `Laboratory.GOT` >= 60 THEN `Patient.ID` END) AS Percentage FROM      `Patient` INNER JOIN      `Laboratory` ON `Patient.ID` = `Laboratory.ID`;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60 ORDER BY P.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT `Patient`.`Birthday` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Laboratory`.`GPT` < 60 GROUP BY `Patient`.`ID` ORDER BY MAX(`Laboratory`.`GPT`) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND P.SEX = 'M';	thrombosis_prediction
SELECT MIN(P.First_Date)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH < 500  GROUP BY P.First_Date  ORDER BY MIN(P.First_Date) DESC  LIMIT 1;	thrombosis_prediction
SELECT p.First_Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH >= 500 ORDER BY p.First_Date DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Admission = '+' AND L.ALP >= 300;	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.Admission = '-' AND Laboratory.ALP < 300;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5;	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ALB` > 3.5 AND `ALB` < 5.5 ORDER BY `ALB` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB BETWEEN 3.5 AND 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT E.aCL_IgG, E.aCL_IgM, E.aCL_IgA  FROM Examination E JOIN Patient P ON E.ID = P.ID JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.UA > 6.50 AND L.UA = (SELECT MAX(UA) FROM Laboratory WHERE UA > 6.50) GROUP BY P.ID ORDER BY L.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(ANA)  FROM Examination  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Laboratory.CRE < 1.5;	thrombosis_prediction
SELECT e1.ID FROM Examination e1 WHERE e1.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Examination e2 WHERE e2.CRE < 1.5) AND e1.CRE < 1.5;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL >= 2.0 AND e.ANA_Pattern LIKE '%P%';	thrombosis_prediction
SELECT E.ANA FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory WHERE T_BIL < 2.0) AND E.ANA IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.T-CHO >= 250 AND e.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.T-CHO < 250 AND e.ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT e.Diagnosis  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.TG < 200 AND l.TG = (SELECT MAX(TG) FROM Laboratory WHERE TG < 200)	thrombosis_prediction
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 0 AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU > 180 ORDER BY p.Birthday LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID JOIN Examination E ON P.ID = E.ID WHERE L.GLU < 180 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*)  FROM `Patient`  JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID`  WHERE `Patient.Admission` = '+' AND `Laboratory.WBC` BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SLE' AND Laboratory.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC <= 3.5 OR l.RBC >= 6.0 AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.PLT > 100 AND L.PLT < 400 AND P.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT `Laboratory.PLT` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.PLT` BETWEEN 100 AND 400 AND `Patient.Diagnosis` = 'MCTD';	thrombosis_prediction
SELECT AVG(PT)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.SEX = 'M' AND PT < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Thrombosis IN (1, 2) AND l.PT < 14;	thrombosis_prediction
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Angela' AND m.last_name = 'Sanders';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design Department'	student_club
SELECT COUNT(DISTINCT a.link_to_event)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone  FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT `event_name`, COUNT(`link_to_event`) as attendance FROM `event` JOIN `attendance` ON `event.event_id` = `attendance.link_to_event` GROUP BY `event_name` ORDER BY attendance DESC LIMIT 1;	student_club
SELECT m.position, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(DISTINCT e.event_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*)  FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' AND COUNT(a.link_to_event) > 10;	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(link_to_member) > 20 ) AND type != 'Fundraiser';	student_club
SELECT COUNT(DISTINCT a.link_to_event) / (SELECT COUNT(*) FROM event WHERE YEAR(event_date) = 2020 AND type = 'Meeting') AS average_attendance FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT `expense_description`, MAX(`cost`)  FROM `expense`  WHERE `expense_description` LIKE '%Club Events%' ORDER BY `cost` DESC  LIMIT 1;	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Law and Constitutional Studies';	student_club
SELECT `zip_code`.`county` FROM `zip_code` JOIN `member` ON `zip_code`.`zip_code` = `member`.`zip` WHERE `member`.`first_name` = 'Sherri' AND `member`.`last_name` = 'Ramsey';	student_club
SELECT m.first_name, m.last_name, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Tyler' AND m.last_name = 'Hewitt';	student_club
SELECT SUM(`amount`) AS total_funds_received FROM `income` WHERE `link_to_member` IN (     SELECT `member_id`     FROM `member`     WHERE `position` = 'Vice President' );	student_club
SELECT SUM(b.spent)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT `city`, `state` FROM `zip_code` JOIN `member` ON `zip_code`.`zip_code` = `member`.`zip` WHERE `member`.`position` = 'President';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Illinois');	student_club
SELECT SUM(`spent`) AS total_advertisement_spent FROM `budget` WHERE `category` = 'Advertisement' AND `link_to_event` IN (     SELECT `event_id`     FROM `event`     WHERE `event_name` = 'September Meeting' );	student_club
SELECT major.department  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.last_name IN ('Pierce', 'Guidi');	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'October Speaker';	student_club
SELECT e.event_name, e.event_date, ex.approved FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE e.event_name = 'October Meeting' AND e.event_date = '2019-10-08' AND ex.approved = 'true';	student_club
SELECT AVG(cost) as average_cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE CONCAT(SUBSTRING(expense.expense_date, 6, 2), SUBSTRING(expense.expense_date, 9, 2)) IN ('09', '10') AND CONCAT(member.first_name, ' ', member.last_name) = 'Elijah Allen';	student_club
SELECT      (SUM(CASE WHEN SUBSTRING(event_date, 1, 4) = '2019' THEN spent ELSE 0 END) -      SUM(CASE WHEN SUBSTRING(event_date, 1, 4) = '2020' THEN spent ELSE 0 END)) AS total_difference FROM      budget  JOIN      event ON budget.link_to_event = event.event_id;	student_club
SELECT `location` FROM `event` WHERE `event_name` = 'Spring Budget Review';	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';	student_club
SELECT remaining  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT `notes`  FROM `income`  WHERE `date_received` = '2019-09-14' AND `source` = 'Fundraising';	student_club
SELECT COUNT(*)  FROM `major`  WHERE `college` = 'College of Humanities and Social Sciences';	student_club
SELECT phone  FROM member  WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT `zip_code`.`county` FROM `member` JOIN `zip_code` ON `member`.`zip` = `zip_code`.`zip_code` WHERE `member`.`first_name` = 'Adela' AND `member`.`last_name` = 'O\'Gallagher';	student_club
SELECT COUNT(*) FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'November Meeting' AND budget.remaining < 0;	student_club
SELECT SUM(`amount`) AS total_budget FROM `budget` WHERE `link_to_event` IN (     SELECT `event_id`     FROM `event`     WHERE `event_name` = 'September Speaker' );	student_club
SELECT b.event_status FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Post Cards, Posters' AND e.expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Brent' AND m.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium';	student_club
SELECT zc.type FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson';	student_club
SELECT m.position, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT zip_code.state  FROM zip_code  JOIN member ON zip_code.zip_code = member.zip  WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';	student_club
SELECT m.link_to_major, m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT date_received  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /       SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)) AS comparison_ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement'	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /       (SUM(CASE WHEN b.category = 'Parking' THEN 1 ELSE 0 END) *        (SELECT COUNT(*) FROM event e WHERE e.event_name = 'November Speaker'))) * 100 AS percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker'	student_club
SELECT SUM(`cost`) AS `total_pizza_cost` FROM `expense` WHERE `expense_description` = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT `department`  FROM `major`  WHERE `college` = 'College of Humanities and Social Sciences';	student_club
SELECT `city`, `county`, `state` FROM `zip_code` JOIN `member` ON `zip_code`.`zip_code` = `member`.`zip` WHERE `member`.`first_name` = 'Amy' AND `member`.`last_name` = 'Firth';	student_club
SELECT e.expense_description FROM `budget` b JOIN `expense` e ON b.budget_id = e.link_to_budget WHERE b.remaining = (SELECT MIN(remaining) FROM `budget`);	student_club
SELECT m.member_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT major.college, COUNT(*) AS member_count FROM major JOIN member ON major.major_id = member.link_to_major GROUP BY major.college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT major.major_name  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE member.phone = '809-555-3360';	student_club
SELECT `event_name` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` ORDER BY `budget.amount` DESC LIMIT 1;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT date_received FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason');	student_club
SELECT COUNT(*)  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.state = 'Maryland';	student_club
SELECT COUNT(DISTINCT a.link_to_event)  FROM attendance a  JOIN member m ON a.link_to_member = m.member_id  WHERE m.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event_name, spent / amount AS spend_to_budget_ratio FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM `member`  WHERE `position` = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget;	student_club
SELECT COUNT(*) FROM `event` WHERE `type` = 'Meeting' AND YEAR(`event_date`) = 2020;	student_club
SELECT SUM(spent)  FROM budget  WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN `event` e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina');	student_club
SELECT SUM(`amount`) AS total_income FROM `income` WHERE `link_to_member` IN (     SELECT `member_id`     FROM `member`     WHERE `first_name` = 'Grant' AND `last_name` = 'Gilmour' );	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = (SELECT link_to_member FROM expense WHERE link_to_budget = (SELECT budget_id FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Yearly Kickoff')))	student_club
SELECT m.first_name, m.last_name, i.amount AS highest_income, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (SELECT MAX(amount) FROM income) GROUP BY m.first_name, m.last_name, i.amount, i.source;	student_club
SELECT event.event_name, MIN(expense.cost) as lowest_cost FROM event JOIN expense ON event.event_id = expense.link_to_budget GROUP BY event.event_name ORDER BY lowest_cost ASC LIMIT 1;	student_club
SELECT      (SUM(e.cost) /       (SELECT SUM(cost) FROM expense WHERE link_to_budget IN        (SELECT budget_id FROM budget WHERE link_to_event IN         (SELECT event_id FROM event WHERE event_name = 'Yearly Kickoff')))) * 100 AS percentage_cost FROM      expense e WHERE      e.link_to_budget IN      (SELECT budget_id FROM budget WHERE link_to_event IN       (SELECT event_id FROM event WHERE event_name = 'Yearly Kickoff'));	student_club
SELECT SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS finance_to_physics_ratio FROM major;	student_club
SELECT source, COUNT(*) as amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*)  FROM `member`  JOIN `major` ON `member`.`link_to_major` = `major`.`major_id`  WHERE `major`.`major_name` = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(a.link_to_event) AS event_count, m.major_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' GROUP BY m.member_id, ma.major_name;	student_club
SELECT AVG(spent)  FROM budget  WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Advertisement'  ORDER BY budget.spent DESC  LIMIT 1;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer';	student_club
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100) / COUNT(*)  FROM      event  WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT SUM(e.cost) as total_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'September Speaker' AND e.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(*) as count FROM member GROUP BY t_shirt_size ORDER BY count DESC LIMIT 1;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.event_status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT      e.type,     SUM(e.cost) AS total_value FROM      expense e JOIN      budget b ON e.link_to_budget = b.budget_id JOIN      event ev ON b.link_to_event = ev.event_id WHERE      ev.event_name = 'October Meeting' GROUP BY      e.type;	student_club
SELECT category, SUM(amount) AS total_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY category ORDER BY total_budgeted ASC;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Food' ORDER BY `amount` DESC LIMIT 1;	student_club
SELECT `budget_id`, `amount` FROM `budget` WHERE `category` = 'Advertisement' ORDER BY `amount` DESC LIMIT 3;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT major_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';	student_club
SELECT m.position  FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*)  FROM `member`  JOIN `major` ON `member`.`link_to_major` = `major`.`major_id`  WHERE `major`.`major_name` = 'Finance' AND `member`.`t_shirt_size` = 'Medium';	student_club
SELECT e.type  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 30;	student_club
SELECT b.category FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215';	student_club
SELECT b.category  FROM budget AS b  JOIN event AS e ON b.link_to_event = e.event_id  WHERE e.event_date = '2020-03-24T12:00:00';	student_club
SELECT m.link_to_major, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT     ROUND(         (SUM(CASE WHEN m.position = 'Member' AND m.link_to_major = 'rec0xRZtkzxrg8kj2' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.member_id)) * 100,         2     ) AS percentage_of_business_majors FROM member m;	student_club
SELECT b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215';	student_club
SELECT COUNT(*)  FROM `income`  WHERE `amount` = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM `major` WHERE `department` = 'School of Applied Sciences, Technology and Education' AND `college` = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.last_name, m.position, m.link_to_major, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT zip_code.city, zip_code.state FROM member JOIN zip_code ON member.zip = zip_code.zip_code JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education' AND member.position = 'Member';	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.position = 'Vice President'  AND e.type = 'Social'  AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT      (COUNT(CASE WHEN amount = 50 THEN 1 END) * 100.0) / COUNT(member_id) AS percentage_of_income_50 FROM      income JOIN      member ON income.link_to_member = member.member_id WHERE      member.t_shirt_size = 'Medium' AND member.position = 'Member';	student_club
SELECT DISTINCT `county` FROM `zip_code` WHERE `type` = 'PO Box';	student_club
SELECT `zip_code` FROM `zip_code` WHERE `state` = 'Puerto Rico' AND `type` = 'PO Box' AND `county` = (SELECT `county` FROM `zip_code` WHERE `type` = 'PO Box' AND `county` = 'San Juan Municipio');	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT a.link_to_event FROM attendance a JOIN expense e ON a.link_to_member = e.link_to_member WHERE e.cost > 50;	student_club
SELECT m.member_id, a.link_to_event FROM attendance a JOIN expense e ON a.link_to_member = e.link_to_member JOIN member m ON a.link_to_member = m.member_id WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT m.first_name, m.link_to_major, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND m.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.email FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.cost > 20 AND e.expense_date BETWEEN '2019-09-10' AND '2019-11-19';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Education' AND member.position = 'Member';	student_club
SELECT      (SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) / COUNT(budget_id)) * 100 AS over_budget_percentage FROM      budget;	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description, AVG(cost) as average_cost FROM expense GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT DIVIDE(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END), COUNT(zip_code)) * 100 AS percentage_po_box FROM zip_code;	student_club
SELECT event.event_name, event.location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN major ma ON m.link_to_major = ma.major_id WHERE e.cost > 100;	student_club
SELECT z.city, z.county FROM zip_code z JOIN member m ON z.zip_code = m.zip JOIN income i ON m.member_id = i.link_to_member GROUP BY z.city, z.county HAVING COUNT(i.amount) > 40;	student_club
SELECT m.member_id, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id GROUP BY m.member_id HAVING COUNT(DISTINCT ev.event_id) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(cost)  FROM expense  WHERE link_to_member IN (     SELECT member_id      FROM member      WHERE position <> 'Member' );	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT link_to_event     FROM budget     JOIN expense ON budget.budget_id = expense.link_to_budget     WHERE category = 'Parking'     GROUP BY link_to_event     HAVING SUM(expense.cost) < (         SELECT SUM(cost) / COUNT(event_id)         FROM budget         JOIN expense ON budget.budget_id = expense.link_to_budget         WHERE category = 'Parking'     ) );	student_club
SELECT     (SUM(e.cost) / COUNT(e.event_id)) * 100 AS meeting_cost_percentage FROM     event e WHERE     e.type = 'Meeting';	student_club
SELECT link_to_budget FROM expense WHERE expense_description IN ('Water, chips, cookies') GROUP BY link_to_budget ORDER BY SUM(cost) DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(b.spent) as total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT      (SUM(CASE WHEN state = 'New Jersey' THEN 1 ELSE 0 END) * 100.0 / COUNT(position = 'Member')) -      (SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) * 100.0 / COUNT(position = 'Member')) AS diff_percentage FROM member WHERE position = 'Member';	student_club
SELECT m.first_name, m.last_name, ma.major_name, ma.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.expense_description = 'Water, Veggie tray, supplies' GROUP BY e.link_to_member;	student_club
SELECT `member`.`last_name`, `member`.`phone` FROM `member` JOIN `major` ON `member`.`link_to_major` = `major`.`major_id` WHERE `major`.`major_name` = 'Elementary Education';	student_club
SELECT `category`, `amount` FROM `budget` INNER JOIN `event` ON `budget.link_to_event` = `event.event_id` WHERE `event.event_name` = 'January Speaker';	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT b.category FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Posters';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name,         ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary';	student_club
SELECT SUM(spent) AS total_spent_on_gifts, event_name  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE category = 'Speaker Gifts'  GROUP BY event_name;	student_club
SELECT zip_code.city FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.city = 'Lincolnton' AND zc.state = 'North Carolina' AND zc.zip_code = 28092;	student_club
SELECT COUNT(*)  FROM `gasstations`  WHERE `Country` = 'CZE' AND `Segment` = 'Premium';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') /      (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS Ratio_EUR_to_CZK	debit_card_specializing
SELECT c.CustomerID, MIN(y.Consumption) AS MinConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.Consumption BETWEEN 201201 AND 201212 GROUP BY c.CustomerID ORDER BY MinConsumption LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS Average_Monthly_Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' AND ym.Consumption < 30000 AND ym.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Currency = 'CZK' THEN ym.Consumption ELSE 0 END) -       SUM(CASE WHEN c.Currency = 'EUR' THEN ym.Consumption ELSE 0 END)) AS DifferenceInConsumption FROM      yearmonth ym JOIN      customers c ON ym.CustomerID = c.CustomerID WHERE      ym.Date BETWEEN '201201' AND '201212' AND c.Currency IN ('CZK', 'EUR')	debit_card_specializing
SELECT      YEAR(`Date`) AS `Year`,      SUM(`Consumption`) AS `TotalConsumption` FROM      `yearmonth` WHERE      `Currency` = 'EUR' GROUP BY      `Year` ORDER BY      `TotalConsumption` DESC LIMIT 1;	debit_card_specializing
SELECT Segment, MIN(Consumption) AS MinConsumption FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID GROUP BY Segment ORDER BY MinConsumption LIMIT 1;	debit_card_specializing
SELECT LEFT(Date, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK') GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT `Date`, MAX(`Consumption`) AS PeakConsumption FROM `yearmonth` WHERE `CustomerID` IN (SELECT `CustomerID` FROM `customers` WHERE `Segment` = 'SME') AND `Date` BETWEEN '201301' AND '201312' GROUP BY `Date` ORDER BY PeakConsumption DESC LIMIT 1;	debit_card_specializing
WITH YearlyConsumption AS (     SELECT          CustomerID,         SUM(Consumption) AS TotalConsumption,         Segment,         CASE              WHEN LEFT(Date, 4) = '2013' THEN 1              ELSE 0          END AS Is2013     FROM yearmonth     JOIN customers ON yearmonth.CustomerID = customers.CustomerID     GROUP BY CustomerID, Segment ), LowestConsumptionPerSegment AS (     SELECT          Segment,         MIN(TotalConsumption) AS MinConsumption     FROM YearlyConsumption     WHERE Is2013 = 1     GROUP BY Segment ), SegmentAverages AS (     SELECT          YearlyConsumption.CustomerID,         YearlyConsumption.Segment,         YearlyConsumption.TotalConsumption / LowestConsumptionPerSegment.MinConsumption AS AvgConsumption     FROM YearlyConsumption     JOIN LowestConsumptionPerSegment ON YearlyConsumption.Segment = LowestConsumptionPerSegment.Segment     WHERE Is2013 = 1 ), SME_LAM_Difference AS (     SELECT          (SegmentAverages.AvgConsumption_SME - SegmentAverages.AvgConsumption_LAM) AS Difference     FROM SegmentAverages     CROSS JOIN (         SELECT              AvgConsumption AS AvgConsumption_SME         FROM SegmentAverages         WHERE SegmentAverages.CustomerID = 'SME'     )     CROSS JOIN (         SELECT              AvgConsumption AS AvgConsumption_LAM         FROM SegmentAverages         WHERE SegmentAverages.CustomerID = 'LAM'     )     WHERE SegmentAverages.CustomerID IN ('SME', 'LAM') ), LAM_KAM_Difference AS (     SELECT          (SegmentAverages.AvgConsumption_LAM - SegmentAverages.AvgConsumption_KAM) AS Difference     FROM SegmentAverages     CROSS JOIN (         SELECT              AvgConsumption AS AvgConsumption_LAM         FROM SegmentAverages         WHERE SegmentAverages.CustomerID = 'LAM'     )     CROSS JOIN (         SELECT              AvgConsumption AS AvgConsumption_KAM         FROM SegmentAverages         WHERE SegmentAverages.CustomerID = 'KAM'     )     WHERE SegmentAverages.CustomerID IN ('LAM', 'KAM') ), KAM_SME_Difference AS (     SELECT          (SegmentAverages.A	debit_card_specializing
WITH ConsumptionByCustomer AS (     SELECT          c.CustomerID,          c.Segment,          SUBSTR(ym.Date, 1, 4) AS Year,         ym.Consumption     FROM          customers c     JOIN          yearmonth ym ON c.CustomerID = ym.CustomerID     WHERE          c.Segment IN ('SME', 'LAM') AND         (SUBSTR(ym.Date, 1, 4) = '2012' OR SUBSTR(ym.Date, 1, 4) = '2013') ), ConsumptionChanges AS (     SELECT          Segment,          Year,         Consumption,         LAG(Consumption, 1) OVER (PARTITION BY Segment ORDER BY Year) AS PreviousYearConsumption     FROM          ConsumptionByCustomer     WHERE          Year = '2013' ), PercentageIncreases AS (     SELECT          Segment,          (Consumption - PreviousYearConsumption) / Consumption * 100 AS PercentageIncrease     FROM          ConsumptionChanges     WHERE          PreviousYearConsumption IS NOT NULL ), MaxMinPercentageIncrease AS (     SELECT          MAX(PercentageIncrease) AS MaxPercentageIncrease,          MIN(PercentageIncrease) AS MinPercentageIncrease     FROM          PercentageIncreases ), SegmentMaxMinIncrease AS (     SELECT          c.Segment,          pi.PercentageIncrease     FROM          customers c     JOIN          PercentageIncreases pi ON c.Segment = pi.Segment     JOIN          MaxMinPercentageIncrease mmi ON pi.PercentageIncrease = mmi.MaxPercentageIncrease OR pi.PercentageIncrease = mmi.MinPercentageIncrease ) SELECT      SegmentMaxMinIncrease.Segment,      PercentageIncrease FROM      SegmentMaxMinIncrease JOIN      PercentageIncreases ON SegmentMaxMinIncrease.Segment = PercentageIncreases.Segment AND SegmentMaxMinIncrease.PercentageIncrease = PercentageIncreases.PercentageIncrease ORDER BY      PercentageIncrease DESC;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `CustomerID` = 6 AND LEFT(`Date`, 6) BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount') -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS Difference	debit_card_specializing
SELECT      (SUM(CASE WHEN CustomerID = 7 AND Date = '201304' THEN Consumption ELSE 0 END) -      SUM(CASE WHEN CustomerID = 5 AND Date = '201304' THEN Consumption ELSE 0 END)) AS Difference FROM      yearmonth WHERE      Date = '201304'	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK')      -      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR')      AS More_SMEs_Paying_CZK_than_EUR;	debit_card_specializing
SELECT c.CustomerID, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM'  AND c.Currency = 'EUR'  AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,      SUM(ym.Consumption) AS TotalConsumption FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      c.Segment = 'KAM' GROUP BY      c.CustomerID ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` WHERE `Date` = '201305' AND `CustomerID` IN (SELECT `CustomerID` FROM `customers` WHERE `Segment` = 'KAM');	debit_card_specializing
SELECT     (SUM(CASE WHEN Consumption > 46.73 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS PercentageOfLAMConsumedMoreThan4673 FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM');	debit_card_specializing
SELECT `Country`, COUNT(`GasStationID`) AS `ValueForMoneyCount` FROM `gasstations` WHERE `Segment` = 'Value for money' GROUP BY `Country` ORDER BY `ValueForMoneyCount` DESC LIMIT 1;	debit_card_specializing
SELECT      (COUNT(CASE WHEN Segment = 'KAM' AND Currency = 'EUR' THEN 1 END) * 100.0) /      COUNT(CASE WHEN Segment = 'KAM' THEN 1 END) AS EuroPaymentPercentage FROM customers;	debit_card_specializing
SELECT      (COUNT(*) * 100.0) / SUM(CASE WHEN `Consumption` > 528.3 THEN 1 ELSE 0 END) AS Percentage FROM `yearmonth` WHERE `Date` = '201202';	debit_card_specializing
SELECT      (COUNT(CASE WHEN `Segment` = 'Premium' THEN 1 END) * 100.0) / COUNT(*) AS PercentageOfPremiumGasStations FROM      `gasstations` WHERE      `Country` = 'CZE'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, MIN(y.Consumption) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY MIN(y.Consumption) LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, ym.Consumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'SME' AND ym.Date = '201206' ORDER BY ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(`Consumption`)  FROM `yearmonth`  WHERE LEFT(`Date`, 6) = '201201';	debit_card_specializing
SELECT MAX(Consumption) AS MaxMonthlyConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR');	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN yearmonth y ON LEFT(t.Date, 6) = y.Date WHERE LEFT(t.Date, 6) = '201309';	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE y.Date = '201306';	debit_card_specializing
SELECT DISTINCT g ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT p.Description  FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(`Amount`) AS average_total_price FROM `transactions_1k` WHERE `Date` LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Currency = 'EUR' AND CustomerID IN (SELECT CustomerID FROM yearmonth WHERE Consumption > 1000);	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT `Time` FROM `transactions_1k` WHERE `GasStationID` IN (SELECT `GasStationID` FROM `gasstations` WHERE `ChainID` = 11)	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE') AND Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(T.Price) AS AverageTotalPrice FROM `transactions_1k` T JOIN `gasstations` G ON T.GasStationID = G.GasStationID WHERE G.Country = 'CZE';	debit_card_specializing
SELECT AVG(T.Price) AS AverageTotalPrice FROM `transactions_1k` T JOIN `customers` C ON T.CustomerID = C.CustomerID WHERE C.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID, SUM(Price) AS TotalPrice FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY TotalPrice DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.Time ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment  FROM customers c  JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.CustomerID IN (31543, 46707, 7654, 17373) AND c.Segment IS NOT NULL;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Price * Amount = TotalAmount AND Currency = 'EUR';	debit_card_specializing
SELECT c.Segment  FROM customers c  JOIN (     SELECT MIN(CustomerID) AS MinCustomerID      FROM customers  ) AS subq ON c.CustomerID = subq.MinCustomerID;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00';	debit_card_specializing
SELECT `ProductID` FROM `transactions_1k` WHERE `Date` = '2012-08-23' AND `Time` = '21:20:00';	debit_card_specializing
SELECT ym.Consumption, ym.Date FROM yearmonth ym WHERE ym.CustomerID = (     SELECT t.CustomerID     FROM transactions_1k t     WHERE t.Price = 124.05 AND t.Date = '2012-08-24' ) AND ym.Date = '201201';	debit_card_specializing
SELECT COUNT(t1.TransactionID)  FROM transactions_1k t1  JOIN gasstations t2 ON t1.GasStationID = t2.GasStationID  WHERE t2.Country = 'CZE'  AND t1.Time BETWEEN '08:00:00' AND '09:00:00'  AND DATE(t1.Date) = '2012-08-26';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306' AND SUM(ym.Consumption) = 214582.17;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.CardID = 667467;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Price = 548.4 AND t.Date = '2012-08-24';	debit_card_specializing
SELECT      (COUNT(DISTINCT c.CustomerID) / (SELECT COUNT(DISTINCT CustomerID) FROM customers)) * 100 AS PercentageOfEURUsers FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      c.Currency = 'EUR' AND      t.Date = '2012-08-25';	debit_card_specializing
SELECT      ((SELECT Consumption FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND GasStationID = (SELECT GasStationID FROM transactions_1k WHERE Date = '2012-08-25' AND Price = 634.8)) AND Date LIKE '2012%')     - (SELECT Consumption FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND GasStationID = (SELECT GasStationID FROM transactions_1k WHERE Date = '2012-08-25' AND Price = 634.8)) AND Date LIKE '2013%'))     /     (SELECT Consumption FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND GasStationID = (SELECT GasStationID FROM transactions_1k WHERE Date = '2012-08-25' AND Price = 634.8)) AND Date LIKE '2012%') AS ConsumptionDecreaseRate;	debit_card_specializing
SELECT GasStationID, SUM(Price) AS TotalRevenue FROM transactions_1k GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Premium_Percentage FROM      transactions_1k t JOIN      gasstations g ON t.GasStationID = g.GasStationID JOIN      customers c ON t.CustomerID = c.CustomerID WHERE      g.Country = 'SVK' GROUP BY      c.Segment;	debit_card_specializing
SELECT SUM(`Price`) AS TotalSpent FROM `transactions_1k` WHERE `CustomerID` = 38508;  SELECT SUM(`Price`) AS TotalSpentInJanuary FROM `transactions_1k` WHERE `CustomerID` = 38508 AND SUBSTR(`Date`, 1, 6) = '201201';	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS TotalAmount FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID ORDER BY TotalAmount DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, AVG(t.Amount / t.Price) AS avg_price_per_item, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(t.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country, MAX(t.Price) as MaxPrice FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.ProductID = 2 GROUP BY g.Country ORDER BY MaxPrice DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym JOIN (     SELECT t.CustomerID, (t.Price / t.Amount) AS PricePerUnit     FROM transactions_1k t     WHERE t.ProductID = 5 AND MONTH(t.Date) = 8 AND YEAR(t.Date) = 2012 ) t ON ym.CustomerID = t.CustomerID AND ym.Date = '201208' WHERE t.PricePerUnit > 29.00;	debit_card_specializing