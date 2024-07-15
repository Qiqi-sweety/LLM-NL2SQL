SELECT MAX(`Free Meal Count (K-12)`) / `Enrollment (K-12)` AS Highest_Free_Rate FROM `frpm` WHERE `County Name` = 'Alameda';	california_schools
SELECT      Educational Option Type,      Free Meal Count (Ages 5-17) / Enrollment (Ages 5-17) AS EligibleFreeRate FROM      frpm WHERE      `Educational Option Type` = 'Traditional' ORDER BY      EligibleFreeRate ASC LIMIT 3;	california_schools
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.District Name = 'Fresno County Office of Education' AND f.Charter School (Y/N) = 1;	california_schools
SELECT MailStreet FROM schools WHERE CDSCode = (     SELECT CDSCode FROM frpm ORDER BY `FRPM Count (K-12)` DESC LIMIT 1 )	california_schools
SELECT `schools.Phone` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `frpm.Charter School (Y/N)` = 1 AND `schools.OpenDate` > '2000-01-01'	california_schools
SELECT COUNT(*) FROM satscores ss JOIN schools sc ON ss.cds = sc.CDSCode WHERE ss.AvgScrMath > 400 AND sc.Virtual = 'F'	california_schools
SELECT `School` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `NumTstTakr` > 500 AND `Magnet` = 1;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 > (     SELECT MAX(Count)     FROM (         SELECT COUNT(*) AS Count         FROM satscores         WHERE NumGE1500 IS NOT NULL AND NumGE1500 > 1500         GROUP BY cds     ) AS SubQuery ) ORDER BY s.Phone DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores ss  JOIN frpm fp ON ss.cds = fp.CDSCode  WHERE fp.FRPM_Count_K_12 = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT COUNT(*) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.CharterFundingType = 'Directly funded' AND satscores.AvgScrMath > 560;	california_schools
SELECT T1.FRPM_Count__Ages_5_17__ FROM frpm AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)	california_schools
SELECT T1.CDSCode FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Enrollment (K-12) + T1.Enrollment (Ages 5-17) > 500	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)`) / MAX(`Enrollment (Ages 5-17)`) AS Highest_Free_Rate FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.NumGE1500 / satscores.NumTstTakr > 0.3	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL AND ss.NumTstTakr > 0 ORDER BY CAST(ss.NumGE1500 AS REAL) / ss.NumTstTakr DESC LIMIT 3;	california_schools
SELECT `NCESSchool` FROM `schools` WHERE `CDSCode` IN (     SELECT `CDSCode`     FROM `frpm`     GROUP BY `CDSCode`     ORDER BY SUM(`Enrollment (Ages 5-17)`) DESC     LIMIT 5 )	california_schools
SELECT s.District, AVG(ss.AvgScrRead) AS AverageScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY AverageScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores ss JOIN schools sc ON ss.cds = sc.CDSCode WHERE sc.County = 'Alameda' AND ss.NumTstTakr < 100;	california_schools
SELECT S.CDSCode, S.CharterNum FROM schools AS S JOIN satscores AS SS ON S.CDSCode = SS.cds WHERE SS.AvgScrWrite > 499 AND S.CharterNum IS NOT NULL ORDER BY SS.AvgScrWrite DESC;	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.MailCity = 'Fresno'  AND frpm.CharterFundingType = 'Directly funded'  AND frpm.NumTstTakr <= 250	california_schools
SELECT T2.Phone FROM `satscores` AS T1 JOIN `schools` AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM `satscores`)	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Amador' AND frpm.LowGrade = '9' AND frpm.HighGrade = '12';	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE County_Name = 'Los Angeles' AND Free_Meal_Count_K_12 > 500 AND Free_Meal_Count_K_12 < 700	california_schools
SELECT `sname` FROM `satscores` JOIN (     SELECT `cname`, MAX(`NumTstTakr`) AS max_tests     FROM `satscores`     WHERE `cname` IN (         SELECT `cname`         FROM `satscores`         WHERE `cname` LIKE '%Contra Costa%'     )     GROUP BY `cname` ) AS max_tests_cname ON `satscores`.`cname` = max_tests_cname.`cname` AND `satscores`.`NumTstTakr` = max_tests_cname.max_tests ORDER BY `NumTstTakr` DESC LIMIT 1;	california_schools
SELECT s.School, s.StreetAbr FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.School_Name FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON f.CDSCode = ss.cds WHERE f.FreeMealCount / f.Enrollment > 0.1 AND ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 >= 1500;	california_schools
SELECT T1.CDSCode, T1.CharterFundingType  FROM frpm AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrMath > 400 AND T1.DistrictName = 'Riverside' GROUP BY T1.CDSCode, T1.CharterFundingType	california_schools
SELECT `School Name`, `Street`, `City`, `State`, `Zip` FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `School Type` = 'High Schools (Public)' AND `School Name` IN (     SELECT `School Name`     FROM `frpm`     JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`     WHERE `County` = 'Monterey' AND `Free Meal Count (Ages 5-17)` > 800 ) ORDER BY `School Name`;	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01' ORDER BY s.School;	california_schools
SELECT s.School, s.DOC FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE (f."Enrollment (K-12)" - f."Enrollment (Ages 5-17)") >       (         SELECT AVG(e1."Enrollment (K-12)" - e1."Enrollment (Ages 5-17)")         FROM frpm e1         WHERE e1.FundingType = 'Directly funded'       ) AND s.FundingType = 'Directly funded';	california_schools
SELECT `OpenDate` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM `frpm`)	california_schools
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Enrollment (K-12) IN (     SELECT MIN(Enrollment (K-12)) FROM frpm     ORDER BY Enrollment (K-12) ASC     LIMIT 5 ) ORDER BY T1.Enrollment (K-12) ASC LIMIT 5;	california_schools
SELECT T1.FreeMealCount / T1.Enrollment AS EligibleFreeRate FROM frpm T1 JOIN (     SELECT *     FROM frpm     ORDER BY Enrollment DESC     LIMIT 2 ) T2 ON T1.Enrollment >= T2.Enrollment WHERE T1.Enrollment IN (     SELECT Enrollment     FROM frpm     ORDER BY Enrollment DESC     LIMIT 2 OFFSET 8 ) ORDER BY T1.Enrollment DESC LIMIT 1;	california_schools
SELECT s.SOC AS EligibleFreeOrReducedMealRate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.SOC = '66' ORDER BY f.FRPM_Count_K_12 DESC LIMIT 5	california_schools
SELECT s.Website, f.School_Name FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Free_Meal_Count_Ages_5_17 BETWEEN 1900 AND 2000;	california_schools
SELECT CAST(`Free Meal Count (Ages 5-17)` AS REAL) / `Enrollment (Ages 5-17)` AS FreeRate FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `AdmLName1` = 'Gibson' AND `AdmFName1` = 'Kacey';	california_schools
SELECT s.`AdmEmail1` FROM `frpm` f JOIN `schools` s ON f.`CDSCode` = s.`CDSCode` WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` ASC LIMIT 1;	california_schools
SELECT      s.AdminFName1 || ' ' || s.AdmLName1 AS FullAdminName FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 > 0 GROUP BY      s.CDSCode, s.AdminFName1, s.AdmLName1 ORDER BY      COUNT(CASE WHEN ss.NumGE1500 >= 1500 THEN 1 END) DESC LIMIT 1;	california_schools
SELECT s.Street, sc.City, sc.State, sc.Zip FROM schools sc JOIN satscores ss ON sc.CDSCode = ss.cds WHERE (ss.NumGE1500 / COALESCE(ss.NumTstTakr, 1)) = (     SELECT MIN((NumGE1500 / COALESCE(NumTstTakr, 1))::numeric)      FROM satscores )	california_schools
SELECT `Website` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `County` = 'Los Angeles' AND `NumTstTakr` BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(T1.NumTstTakr)  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T2.County = 'Fresno' AND T2.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT `schools.Phone` FROM `schools` JOIN `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE `schools.District` = 'Fresno Unified' ORDER BY `satscores.AvgScrRead` ASC LIMIT 1;	california_schools
SELECT sc.School  FROM schools sc JOIN satscores ss ON sc.CDSCode = ss.cds WHERE sc.Virtual = 'F' AND ss.rtype = 'S' ORDER BY ss.AvgScrRead DESC LIMIT 5 PARTITION BY sc.County	california_schools
SELECT T2.EdOpsName  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT AVG(`satscores`.`AvgScrMath`), `schools`.`County` FROM `satscores` JOIN `schools` ON `satscores`.`cds` = `schools`.`CDSCode` WHERE `satscores`.`AvgScrMath` IN (     SELECT `AvgScrMath`     FROM `satscores`     WHERE `AvgScrRead` IS NOT NULL AND `AvgScrWrite` IS NOT NULL     ORDER BY (`AvgScrMath` + `AvgScrRead` + `AvgScrWrite`) / 3     LIMIT 1 )	california_schools
SELECT AVG(`AvgScrWrite`) AS avg_write_score, `schools`.`City` FROM `satscores` JOIN `schools` ON `satscores`.`cds` = `schools`.`CDSCode` WHERE `satscores`.`NumGE1500` IS NOT NULL AND `NumGE1500` >= 1500 GROUP BY `schools`.`CDSCode` ORDER BY COUNT(`NumGE1500`) DESC LIMIT 1;	california_schools
SELECT s.School, AVG(sc.AvgScrWrite) AS AverageWritingScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN (     SELECT CDSCode     FROM schools     WHERE AdmFName1 = 'Ricci' AND AdmLName1 = 'Ulrich' ) adm ON s.CDSCode = adm.CDSCode GROUP BY s.School;	california_schools
SELECT s.School FROM `frpm` frp JOIN `schools` s ON frp.CDSCode = s.CDSCode WHERE s.DOC = '31' AND frp.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM `frpm` WHERE DOC = '31')	california_schools
SELECT COUNT(*) / 12 AS "Monthly Average" FROM `schools` WHERE `County` = 'Alameda' AND `DOC` = '52' AND YEAR(`OpenDate`) = 1980;	california_schools
SELECT      (SUM(CASE WHEN `DOC` = '54' AND `County` = 'Orange' THEN 1 ELSE 0 END) / CAST(SUM(CASE WHEN `DOC` = '52' AND `County` = 'Orange' THEN 1 ELSE 0 END) AS REAL)) * 100 AS Ratio FROM      schools;	california_schools
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT T1.School, T1.Street, T1.StreetAbr FROM schools AS T1 JOIN (     SELECT sname, AVG(AvgScrMath) AS avg_math_score     FROM satscores     GROUP BY sname     ORDER BY avg_math_score DESC     LIMIT 1 OFFSET 6 ) AS T2 ON T1.CDSCode = T2.sname	california_schools
SELECT `MailStreet`, `School` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `AvgScrRead` = (SELECT MIN(`AvgScrRead`) FROM `satscores`)	california_schools
SELECT COUNT(*) FROM satscores ss JOIN schools sc ON ss.cds = sc.CDSCode WHERE (ss.AvgScrRead + ss.AvgScrMath + ss.AvgScrWrite) >= 1500 AND sc.MailCity = 'Lakeport'	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.MailCity = 'Fresno'	california_schools
SELECT `School`, `MailZip` FROM `schools` WHERE `AdmFName1` = 'Avetik' AND `AdmLName1` = 'Atoian';	california_schools
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE MailState = 'CA'	california_schools
SELECT COUNT(*)  FROM schools  WHERE State = 'CA' AND MailCity = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT `Schools.Phone`, `Schools.Ext` FROM `Schools` JOIN `Satscores` ON `Schools.CDSCode` = `Satscores.cds` WHERE `Satscores.AvgScrWrite` = (     SELECT `AvgScrWrite`     FROM `Satscores`     ORDER BY `AvgScrWrite` DESC     LIMIT 1 OFFSET 332 )	california_schools
SELECT `School`, `Phone`, `Ext` FROM `schools` WHERE `Zip` = '95203-3704';	california_schools
SELECT Website FROM `schools` WHERE `AdmFName1` = 'Mike' AND `AdmLName1` = 'Larson' UNION SELECT Website FROM `schools` WHERE `AdmFName1` = 'Dante' AND `AdmLName1` = 'Alvarez';	california_schools
SELECT `Website` FROM `schools` WHERE `County` = 'San Joaquin' AND `Charter` = 1 AND `Virtual` = 'P';	california_schools
SELECT COUNT(*)  FROM schools  WHERE City = 'Hickman' AND Charter = 1 AND DOC = '52';	california_schools
SELECT COUNT(*)  FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND s.Charter = 0 AND (f.FreeMealCount_K_12 * 100 / f.Enrollment_K_12) < 0.18	california_schools
SELECT S.School, S.City, A.AdmFName1, A.AdmLName1 FROM schools S JOIN (     SELECT `CharterNum`     FROM schools     WHERE `Charter` = 1 AND `CharterNum` = '00D2' ) C ON S.CharterNum = C.CharterNum;	california_schools
SELECT COUNT(*) FROM `schools` WHERE `MailCity` = 'Hickman' AND `CharterNum` = '00D4';	california_schools
SELECT      CAST(SUM(CASE WHEN `FundingType` = 'Locally funded' AND `County` = 'Santa Clara' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN `County` = 'Santa Clara' THEN 1 END) AS Percentage FROM `schools` WHERE `County` = 'Santa Clara';	california_schools
SELECT COUNT(*)  FROM schools  WHERE OpenDate BETWEEN '2000-01-01' AND '2005-12-31'  AND County = 'Stanislaus'  AND FundingType = 'Directly funded';	california_schools
SELECT COUNT(*) AS total_closures FROM schools WHERE DOCType = 'Community College District' AND ClosedDate LIKE '1989%' AND City = 'San Francisco';	california_schools
SELECT `County` FROM `schools` WHERE `StatusType` = 'Closed' AND `ClosedDate` BETWEEN '1980-01-01' AND '1989-12-31' AND `SOC` = '11' GROUP BY `County` ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31'	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine' AND StatusType IN ('Active', 'Closed') AND `School` LIKE '%District Community Day%'	california_schools
SELECT T1.District Code FROM `frpm` AS T1 JOIN `schools` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.City = 'Fresno' AND T2.Magnet = 0;	california_schools
SELECT COUNT(*)  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE s.City = 'Fremont' AND s.EdOpsCode = 'SSS' AND SUBSTR(f.Academic_Year, -4) = '2014'  AND SUBSTR(f.Academic_Year, -4) = '2015';	california_schools
SELECT T1.FRPM_Count_(Ages_5_17) FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailStreet = 'PO Box 1040' AND T2.SOCType = 'Youth Authority School';	california_schools
SELECT `Low Grade` FROM schools WHERE EdOpsCode = 'SPECON' AND NCESDist = '0613360';	california_schools
SELECT `School`, `EILName` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `frpm.NSLP Provision Status` = '01' AND `frpm.County Code` = '37' AND `frpm.`NSLP Provision Status` = 'Breakfast Provision 2';	california_schools
SELECT `City` FROM `schools` WHERE `EILCode` = 'HS' AND `County` = 'Merced' AND `CDSCode` IN (     SELECT `CDSCode`     FROM `frpm`     WHERE `NSLP Provision Status` = 'Breakfast Provision 2'     AND `Low Grade` = '9'     AND `High Grade` = '12' )	california_schools
SELECT s.School, (f.FRPM_Count / f.Enrollment * 100) AS Percent_ELIGIBLE_FRPM FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved LIKE '%K%' AND s.GSserved LIKE '%9%'	california_schools
SELECT `GSserved`, COUNT(*) AS frequency FROM schools WHERE `City` = 'Adelanto' GROUP BY `GSserved` ORDER BY frequency DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) AS Number_of_Schools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND `Virtual` = 'N' GROUP BY County ORDER BY Number_of_Schools DESC LIMIT 1;	california_schools
SELECT `School Type`, `School Name`, `Latitude` FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE `Latitude` = (SELECT MAX(`Latitude`) FROM `schools`)	california_schools
SELECT `School Name` FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `State` = 'CA' ORDER BY `schools`.`Latitude`, `Low Grade` LIMIT 1;	california_schools
SELECT GSoffered FROM schools WHERE ABS(longitude) = (SELECT MAX(ABS(longitude)) FROM schools) LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.City) AS Cities, COUNT(DISTINCT frp.CDSCode) AS Schools FROM schools s JOIN frpm frp ON s.CDSCode = frp.CDSCode WHERE s.Magnet = 1 AND frp.NSLP_Provision_Status = 'Multiple Provision Types' AND s.GSoffered = 'K-8';	california_schools
SELECT District, AdmFName1  FROM schools GROUP BY District, AdmFName1 ORDER BY COUNT(*) DESC LIMIT 2;	california_schools
SELECT T1.District Code, CAST(T2.Free Meal Count (K-12) AS REAL) / T2.Enrollment (K-12) * 100 AS Percent_Eligible_Free FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine'	california_schools
SELECT District, County, School, AdmLName1 FROM schools WHERE CharterNum = '0728' OR CharterNum = '1049';	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3  FROM schools  WHERE County = 'San Bernardino'  AND City = 'San Bernardino City Unified'  AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'  AND (SOC = '62' OR DOC = '54')	california_schools
SELECT `AdmEmail1` FROM `schools` WHERE `CDSCode` = (     SELECT `cds`     FROM `satscores`     WHERE `NumGE1500` IS NOT NULL AND `NumGE1500` > 0     ORDER BY `NumGE1500` DESC     LIMIT 1 )	california_schools
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK MESICNE' AND d.A3 LIKE 'East Bohemia%' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague'  AND account_id IN (SELECT account_id FROM loan)	financial
SELECT AVG(`A12`) AS avg_1995, AVG(`A13`) AS avg_1996,        CASE WHEN AVG(`A12`) > AVG(`A13`) THEN '1995' ELSE '1996' END AS higher_percentage_year FROM `district`;	financial
SELECT COUNT(*) FROM district d JOIN (     SELECT district_id, AVG(A11) AS avg_salary     FROM district d     JOIN client c ON d.district_id = c.district_id     WHERE c.gender = 'F' ) AS female_avg_salaries ON d.district_id = female_avg_salaries.district_id WHERE female_avg_salaries.avg_salary > 6000 AND female_avg_salaries.avg_salary < 10000;	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000	financial
SELECT MIN(a.account_id) AS min_account_id,         MAX(a2.A11) - MIN(a2.A11) AS salary_gap FROM (     SELECT account_id     FROM client     WHERE gender = 'F'     ORDER BY birth_date ASC     LIMIT 1 ) AS c JOIN account AS a ON c.account_id = a.account_id JOIN (     SELECT district_id, AVG(A11) AS A11     FROM district d     JOIN client cl ON d.district_id = cl.district_id     GROUP BY district_id ) AS a2 ON a.district_id = a2.district_id	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.birth_date IN (     SELECT birth_date     FROM client     WHERE district_id = (         SELECT district_id         FROM client         ORDER BY birth_date DESC         LIMIT 1     ) ) AND a.district_id IN (     SELECT district_id     FROM client     GROUP BY district_id     ORDER BY AVG(1.0 * `A11`) DESC     LIMIT 1 )	financial
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER'	financial
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'DISPONENT';	financial
SELECT a.account_id, a.frequency, a.date FROM account a JOIN (     SELECT account_id, MIN(amount) AS min_amount     FROM loan     WHERE DATE(date) BETWEEN '1997-01-01' AND '1997-12-31'     GROUP BY account_id ) l ON a.account_id = l.account_id WHERE l.min_amount = (     SELECT MIN(amount)     FROM loan     WHERE DATE(date) BETWEEN '1997-01-01' AND '1997-12-31' ) AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT l.account_id FROM loan l JOIN disp d ON l.account_id = d.account_id WHERE l.duration > 12 AND YEAR(l.date) = 1993 ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.A2 = 'Sokolov'	financial
SELECT account_id FROM trans WHERE date = '1995-01-01' ORDER BY date ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' GROUP BY a.account_id HAVING SUM(CASE WHEN t.amount > 3000 THEN t.amount ELSE 0 END) > 0;	financial
SELECT `client.client_id` FROM `client` JOIN `disp` ON `client.client_id` = `disp.client_id` JOIN `card` ON `disp.disp_id` = `card.disp_id` WHERE `card.issued` = '1994-03-03'	financial
SELECT t.date  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount = 840 AND t.date = '1998-10-14'	financial
SELECT T1.district_id FROM `account` AS T1  JOIN `loan` AS T2 ON T1.account_id = T2.account_id  WHERE T2.date BETWEEN '1994-08-25' AND '1994-08-25'	financial
SELECT MAX(amount)  FROM trans  WHERE account_id IN (     SELECT account_id      FROM account      WHERE date >= '1996-10-21' AND date <= '1996-10-21' )	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND d.A11 = (SELECT MAX(A11) FROM district)	financial
SELECT T1.amount FROM trans AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = (SELECT MAX(amount) FROM loan) AND T1.date > (SELECT date FROM loan WHERE account_id = T1.account_id ORDER BY date LIMIT 1)	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT disp.disp_id FROM disp JOIN account ON disp.account_id = account.account_id JOIN trans ON disp.account_id = trans.account_id WHERE trans.amount = 5100 AND DATE(trans.date) = '1998-09-02'	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date LIKE '1996-%'	financial
SELECT T1.A2  FROM district AS T1  JOIN client AS T2 ON T1.district_id = T2.district_id  WHERE T2.gender = 'F' AND T2.birth_date = '1976-01-29'	financial
SELECT c.birth_date FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = 98832 AND YEAR(l.date) = 1996 AND MONTH(l.date) = 1 AND DAY(l.date) = 3;	financial
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Prague' ORDER BY account.date ASC LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN c.client_id END) * 100.0 / COUNT(c.client_id)) AS male_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'south Bohemia'	financial
SELECT      c.client_id,      ((t2.balance - t1.balance) / t1.balance) * 100 AS increase_rate FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id JOIN      trans t1 ON a.account_id = t1.account_id AND t1.date <= '1993-07-05' JOIN      trans t2 ON a.account_id = t2.account_id AND t2.date >= '1998-12-27' WHERE      a.date = '1993-07-05' AND      EXISTS (         SELECT 1 FROM loan l WHERE l.account_id = a.account_id AND l.status = 'A' AND l.date <= '1993-07-05'     ) ORDER BY      l.date ASC LIMIT 1;	financial
SELECT      ((SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / CAST(SUM(amount) AS REAL)) * 100) AS percentage_of_loan_paid_with_no_issue FROM      loan;	financial
SELECT      ((SELECT COUNT(*) FROM loan WHERE amount < 100000 AND status = 'C')       / (SELECT COUNT(*) FROM loan WHERE amount < 100000)) * 100 AS percentage_of_accounts	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date = '1993-02-26' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND d.A3 = 'east Bohemia';	financial
SELECT `account_id`, `date` FROM `account` JOIN `district` ON `account.district_id` = `district.district_id` WHERE `district.A2` = 'Prachatice'	financial
SELECT d.A2 AS District, d.A3 AS Region FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, COALESCE(r.A3, 'Unknown') AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id JOIN (     SELECT district_id, MAX(amount) AS max_amount     FROM loan     GROUP BY district_id ) l_max ON l.amount > l_max.max_amount AND l.account_id = l_max.account_id LEFT JOIN (     SELECT district_id, A3     FROM district ) r ON d.district_id = r.district_id WHERE l.amount > 300000	financial
SELECT      l.loan_id,      d.A3 AS district,      d.A11 AS average_salary FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      district d ON a.district_id = d.district_id WHERE      l.duration = 60;	financial
SELECT D.district_id, D.A13 - D.A12 AS unemployment_increment_rate FROM district D JOIN account A ON D.district_id = A.district_id JOIN loan L ON A.account_id = L.account_id WHERE L.status = 'D' AND A.status = 'in_debt';	financial
SELECT      (COUNT(*) FILTER (WHERE T1.A2 = 'Decin') * 100.0 / COUNT(T2.account_id)) AS percentage FROM      district AS T1 JOIN      account AS T2 ON T1.district_id = T2.district_id WHERE      T2.date LIKE '1993-%'	financial
SELECT account_id FROM account WHERE account_id IN (     SELECT account_id     FROM (         SELECT account_id, COUNT(*) AS statement_count         FROM (             SELECT account_id, DATE_TRUNC('month', transaction_date) AS month             FROM transactions         ) t         GROUP BY account_id, month     ) m     WHERE statement_count = MONTHS_BETWEEN(CURRENT_DATE, LEAD(CURRENT_DATE, 1, CURRENT_DATE + INTERVAL 1 MONTH) OVER (PARTITION BY account_id ORDER BY month)) + 1 );	financial
SELECT T3.A2, COUNT(T1.account_id) AS female_account_count FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T2.gender = 'F' GROUP BY T3.A2 ORDER BY female_account_count DESC LIMIT 9;	financial
SELECT d.A2 AS DistrictName, COUNT(t.account_id) AS WithdrawalsCount FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.district_id ORDER BY WithdrawalsCount DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT d.account_id)  FROM district d  JOIN client c ON d.district_id = c.district_id  JOIN disp p ON c.client_id = p.client_id  WHERE d.A3 LIKE '%South Bohemia%' AND p.type != 'OWNER'	financial
SELECT D.A3 AS DistrictName, COUNT(*) AS ActiveLoansCount FROM district D JOIN account A ON D.district_id = A.district_id JOIN loan L ON A.account_id = L.account_id WHERE L.status = 'C' OR L.status = 'D' GROUP BY D.district_id, D.A3 ORDER BY ActiveLoansCount DESC LIMIT 1;	financial
SELECT AVG(loan.amount)  FROM loan  JOIN account ON loan.account_id = account.account_id  JOIN client ON account.district_id = client.district_id  WHERE client.gender = 'M'	financial
SELECT T1.A2, T1.district_id FROM district AS T1 WHERE T1.A13 = (SELECT MAX(A13) FROM district)	financial
SELECT COUNT(*)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A16 = (SELECT MAX(A16) FROM district)	financial
SELECT COUNT(*)  FROM `account` a JOIN `trans` t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND t.balance < 0;	financial
SELECT COUNT(*)  FROM (     SELECT DISTINCT `account_id`     FROM `account`     WHERE `date` BETWEEN '1995-01-01' AND '1997-12-31'     AND `frequency` = 'POPLATEK MESICNE' ) AS monthly_accounts JOIN `loan` ON monthly_accounts.account_id = `loan`.account_id WHERE `loan`.amount >= 250000;	financial
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id JOIN district ON account.district_id = district.district_id WHERE district.district_id = 1 AND (loan.status = 'C' OR loan.status = 'D')	financial
SELECT COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'M' AND d.A15 =  (SELECT MAX(A15)   FROM district   WHERE district_id <>       (SELECT district_id        FROM district        ORDER BY A15 DESC        LIMIT 1))	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.card_id = disp.disp_id  JOIN client ON disp.client_id = client.client_id  WHERE card.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek');	financial
SELECT DISTINCT d.district_id FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount > 10000 AND t.date LIKE '1997-%'	financial
SELECT account_id FROM `account` JOIN `district` ON `account`.district_id = `district`.district_id JOIN `trans` ON `account`.account_id = `trans`.account_id WHERE `trans`.k_symbol = 'SIPO' AND `district`.A2 = 'Pisek';	financial
SELECT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.card_id = card.card_id WHERE card.type = 'gold';	financial
SELECT AVG(amount) AS avg_credit_card_amount FROM trans WHERE operation = 'VYBER KARTOU' AND date >= '2021-01-01' AND date < '2022-01-01'	financial
SELECT T1.account_id FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount < (     SELECT AVG(amount)     FROM trans     WHERE strftime('%Y', date) = '1998' ) AND T2.type = 'VYBER KARTOU';	financial
SELECT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F';	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A3 LIKE '%south Bohemia%'	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp b ON a.account_id = b.account_id WHERE d.A2 = 'Tabor' AND b.type = 'OWNER'	financial
SELECT DISTINCT d.type, AVG(CASE WHEN d.A11 BETWEEN 8000 AND 9000 THEN d.A11 ELSE NULL END) AS avg_income FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp p ON a.account_id = p.account_id WHERE p.type = 'OWNER' GROUP BY a.account_id;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  JOIN trans ON account.account_id = trans.account_id  WHERE district.A3 LIKE 'North Bohemia' AND trans.bank = 'AB'	financial
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ'	financial
SELECT AVG(A15) AS AverageCrimes1995 FROM (     SELECT d.A15, dis.A15     FROM district d     JOIN account a ON d.district_id = a.district_id     JOIN district dis ON d.district_id = dis.district_id     WHERE a.date BETWEEN '1997-01-01' AND '1997-12-31'       AND d.A15 > 4000 ) AS subquery WHERE dis.A15 IS NOT NULL;	financial
SELECT COUNT(*)  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  WHERE c.type = 'classic' AND d.type = 'OWNER'	financial
SELECT COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A2 = 'Hl.m. Praha' AND c.gender = 'M';	financial
SELECT      (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) * 100.0 / COUNT(*)) AS gold_card_percentage FROM      card;	financial
SELECT c.client_name FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN (     SELECT account_id, MAX(amount) AS max_amount     FROM loan     GROUP BY account_id ) l ON a.account_id = l.account_id AND a.account_id = d.account_id WHERE d.type = 'OWNER' AND l.max_amount = a.amount;	financial
SELECT T3.A15 FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.account_id = 532	financial
SELECT T1.district_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333;	financial
SELECT * FROM `trans` WHERE `trans_id` IN (     SELECT `trans_id` FROM `trans`     WHERE `account_id` IN (         SELECT `account_id` FROM `disp`         WHERE `client_id` = 3356     )     AND `operation` = 'VYBER' )	financial
SELECT COUNT(*)  FROM account  JOIN loan ON account.account_id = loan.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 13539;	financial
SELECT T2.A3 FROM `client` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541;	financial
SELECT T1.district_id FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.district_id ORDER BY COUNT(T2.account_id) DESC LIMIT 1;	financial
SELECT account_id FROM order WHERE order_id = 32423;	financial
SELECT T2.trans_id FROM `account` AS T1 JOIN `trans` AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = 5;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik');	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE cr.type = 'junior' AND cr.issued >= '1997-01-01'	financial
SELECT      (COUNT(CASE WHEN T1.gender = 'F' THEN 1 END) * 100.0 / COUNT(T1.client_id)) AS percentage FROM      client AS T1 JOIN      district AS T2 ON T1.district_id = T2.district_id WHERE      T2.A11 > 10000	financial
SELECT      ((SUM(amount WHERE date BETWEEN '1996-01-01' AND '1996-12-31')       - SUM(amount WHERE date BETWEEN '1997-01-01' AND '1997-12-31'))      / SUM(amount WHERE date BETWEEN '1996-01-01' AND '1996-12-31')) * 100 AS growth_rate FROM      loan WHERE      client_id IN (         SELECT client_id FROM client WHERE gender = 'M'     );	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'	financial
SELECT ABS((SELECT SUM(`A16`) FROM `district` WHERE `A3`='North Bohemia') - (SELECT SUM(`A16`) FROM `district` WHERE `A3`='East Bohemia')) AS Crime_Difference_1996;	financial
SELECT      SUM(CASE WHEN type = 'OWNER' THEN 1 ELSE 0 END) AS owner_count,     SUM(CASE WHEN type = 'DISPONENT' THEN 1 ELSE 0 END) AS disponte_count FROM      disp WHERE      account_id BETWEEN 1 AND 10;	financial
SELECT `frequency` FROM `account` WHERE `account_id` = 3;  SELECT SUM(amount) FROM `order` WHERE `account_id` = 3 AND `k_symbol` = 'debit' AND amount = 3539;	financial
SELECT T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.account_id = 130;	financial
SELECT COUNT(*) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND d.type = 'OWNER';	financial
SELECT l.amount, COUNT(l.status) AS payment_status_count FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.account_id = c.client_id WHERE c.client_id = 992 GROUP BY l.amount, l.status;	financial
SELECT SUM(trans.balance) AS total_sum, client.gender FROM trans JOIN account ON trans.account_id = account.account_id JOIN client ON account.district_id = client.district_id WHERE trans.trans_id = 851 AND client.client_id = 4	financial
SELECT T1.type FROM `card` AS T1 JOIN `disp` AS T2 ON T1.disp_id = T2.disp_id JOIN `client` AS T3 ON T2.client_id = T3.client_id WHERE T3.client_id = 9;	financial
SELECT SUM(amount) AS total_paid FROM trans JOIN account ON trans.account_id = account.account_id JOIN client ON account.district_id = client.district_id WHERE client.client_id = 617 AND EXTRACT(YEAR FROM date) = 1998;	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'East Bohemia';	financial
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(*)  FROM client  JOIN account ON client.district_id = account.district_id  JOIN trans ON account.account_id = trans.account_id  WHERE client.gender = 'M'  AND YEAR(trans.amount) > 1974 AND YEAR(trans.amount) < 1977  AND trans.amount > 4000	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > '1996-12-31';	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN card ON disp.disp_id = card.disp_id  WHERE client.gender = 'F' AND card.type = 'junior';	financial
SELECT      CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) AS percentage_female FROM      client AS T1 JOIN      district AS T2 ON T1.district_id = T2.district_id WHERE      T2.A3 = 'Prague';	financial
SELECT      CAST(SUM(CASE WHEN T1.gender = 'M' AND T2.frequency = 'POPLATEK TYDNE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.frequency) FROM      client AS T1 JOIN      account AS T2 ON T1.district_id = T2.district_id WHERE      T2.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(*)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 24 AND T1.date < '1997-01-01' ORDER BY T2.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, a.A11 ASC LIMIT 1;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A3 LIKE '%East Bohemia%' AND YEAR(client.birth_date) = 1920;	financial
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24;	financial
SELECT AVG(loan.payments) AS avg_loan_amount FROM loan JOIN account ON loan.account_id = account.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND loan.status IN ('C', 'D')	financial
SELECT a.account_id, d.A2  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN disp b ON a.account_id = b.account_id  WHERE b.type IN ('OWNER')	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE cr.type = 'gold' AND d.type = 'OWNER';	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '-' AND a.element = 'cl'	toxicology
SELECT AVG(CASE WHEN `bond`.`bond_type` = '-' THEN 1 ELSE 0 END) * COUNT(*) / COUNT(DISTINCT `atom`.molecule_id) AS avg_oxygen_atoms FROM `atom` JOIN `bond` ON `atom`.`molecule_id` = `bond`.`molecule_id` WHERE `atom`.`element` = 'O'	toxicology
SELECT AVG(COUNT(bond.molecule_id))  FROM (     SELECT molecule_id      FROM bond      WHERE bond_type = '-'  ) AS single_bonded_atoms, atom  WHERE atom.molecule_id = single_bonded_atoms.molecule_id AND        atom.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '-' AND a.element = 'na';	toxicology
SELECT `molecule.molecule_id` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `bond.bond_type` = '#' AND `molecule.label` = '+';	toxicology
SELECT CAST(SUM(CASE WHEN atom.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom.atom_id)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  JOIN bond ON molecule.molecule_id = bond.molecule_id  WHERE bond.bond_type = '=';	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#' AND `bond_type` IS NOT NULL;	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c'	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR004_8_9' GROUP BY atom.element;	toxicology
SELECT DISTINCT atom.element  FROM atom  JOIN bond ON atom.atom_id = bond.molecule_id  WHERE bond.bond_type = '=';	toxicology
SELECT m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'h'  GROUP BY m.label  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'cl'	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-'	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8')	toxicology
SELECT DISTINCT m.label  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element != 'sn' AND m.label = '+'	toxicology
SELECT COUNT(DISTINCT atom.atom_id)  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE atom.element = 'i' OR atom.element = 's'  AND bond.bond_type = '-'	toxicology
SELECT DISTINCT atom_id, atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN atom am ON c.atom_id2 = am.atom_id OR c.atom_id = am.atom_id WHERE am.molecule_id = 'TR181';	toxicology
SELECT      (SUM(CASE WHEN element <> 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT molecule_id)) AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND a.element IS NOT NULL	toxicology
SELECT      (SUM(CASE WHEN `bond_type` = '#' THEN 1 ELSE 0 END) * 100 / COUNT(`bond_id`)) AS percent FROM      `bond` JOIN      `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE      `molecule.label` = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3;	toxicology
SELECT T1.atom_id FROM `atom` AS T1 JOIN `bond` AS T2 ON T1.atom_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_6' AND T2.molecule_id = 'TR001'	toxicology
SELECT      (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM      molecule;	toxicology
SELECT T1.atom_id FROM `connected` AS T1 JOIN `bond` AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_type` = '=' GROUP BY `molecule_id` ORDER BY `molecule_id` LIMIT 5;	toxicology
SELECT CAST(SUM(CASE WHEN T1.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR008'	toxicology
SELECT CAST(SUM(CASE WHEN `label` = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`molecule_id`) AS percent FROM `molecule`;	toxicology
SELECT      CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) * 100.0 / COUNT(atom_id) AS REAL) AS hydrogen_percentage FROM      atom WHERE      molecule_id = 'TR206';	toxicology
SELECT `bond_type` FROM `bond` WHERE `molecule_id` = 'TR000'	toxicology
SELECT atom.element, molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id = 'TR060';	toxicology
SELECT T3.bond_type FROM (     SELECT T2.bond_type, COUNT(T2.bond_type) AS count_bond_type     FROM (         SELECT * FROM molecule WHERE molecule_id = 'TR010'     ) AS T1     JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id     GROUP BY T2.bond_type     ORDER BY count_bond_type DESC     LIMIT 1 ) AS T3 JOIN molecule ON T1.molecule_id = 'TR010' AND T3.bond_type = T2.label WHERE T2.label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-' ORDER BY T1.molecule_id LIMIT 3;	toxicology
SELECT b.bond_id  FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.molecule_id = 'TR006' ORDER BY b.bond_id LIMIT 2;	toxicology
SELECT COUNT(DISTINCT T1.bond_id)  FROM bond AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id  WHERE T3.molecule_id = 'TR009'  AND (T2.atom_id = 'TR009_12' OR T2.atom_id2 = 'TR009_12')	toxicology
SELECT COUNT(DISTINCT t1.molecule_id)  FROM atom t1  JOIN molecule t2 ON t1.molecule_id = t2.molecule_id  WHERE t2.label = '+' AND t1.element = 'br'	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_6_9'	toxicology
SELECT m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#';	toxicology
SELECT COUNT(*)  FROM connected  WHERE atom_id LIKE 'TR%_19'	toxicology
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR004'	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '-'	toxicology
SELECT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T2.label = '+';	toxicology
SELECT T2.bond_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'p' OR T1.element = 'n' AND T2.bond_id IS NOT NULL;	toxicology
SELECT COUNT(*) AS double_bond_count, m.label  FROM `bond` b  JOIN `molecule` m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '=' AND m.label = '+' GROUP BY m.label  ORDER BY double_bond_count DESC  LIMIT 1;	toxicology
SELECT AVG(COUNT(connected.bond_id) / COUNT(DISTINCT connected.atom_id)) FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'i';	toxicology
SELECT      COALESCE(bond_type, '#') AS bond_type,     CASE          WHEN SUBSTR(atom_id, 7, 2) + 0 = 45 THEN bond_id         ELSE NULL     END AS bond_id FROM      connected c JOIN      bond b ON c.bond_id = b.bond_id WHERE      SUBSTR(c.atom_id, 7, 2) + 0 = 45	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected)	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T3.bond_type = '#' AND T4.molecule_id = 'TR041';	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_type) DESC LIMIT 1	toxicology
SELECT atom.element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'  GROUP BY atom.element  ORDER BY COUNT(*) ASC  LIMIT 1;	toxicology
SELECT DISTINCT c.atom_id FROM `atom` a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element = 'pb' AND (a.element IS NOT NULL) AND EXISTS (     SELECT 1 FROM `atom` a2 WHERE a2.element = 'pb' ) AND NOT EXISTS (     SELECT 1 FROM `atom` a3 WHERE a3.element = 'pb' AND a3.atom_id = c.atom_id OR a3.atom_id = c.atom_id2 ) AND c.atom_id <> c.atom_id2;	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#'	toxicology
SELECT      CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id)  FROM      (SELECT DISTINCT atom_id FROM connected) T1  JOIN      bond T2 ON T1.atom_id IN (SELECT atom_id FROM connected WHERE bond_id LIKE 'TR000_%')  GROUP BY      T2.bond_type  ORDER BY      COUNT(T1.atom_id) DESC  LIMIT 1;	toxicology
SELECT      CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(T2.bond_id) AS REAL) AS proportion FROM      molecule AS T1 JOIN      bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.bond_type = '-' AND T1.label = '+';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h')	toxicology
SELECT T2.atom_id2 FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'	toxicology
SELECT T3.bond_type FROM `atom` AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 'sn'	toxicology
SELECT COUNT(DISTINCT atom.element)  FROM atom  JOIN bond ON atom.molecule_id = bond.molecule_id  WHERE bond.bond_type = '-'	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br')	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'	toxicology
SELECT `molecule.molecule_id` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `bond.bond_type` = '-' AND `molecule.label` = '-'	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) / COUNT(T1.atom_id)) * 100 AS percent FROM      atom T1 JOIN      bond T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.bond_type = '-' AND T1.molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-')	toxicology
SELECT `molecule_id`, `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT `molecule_id` FROM `molecule` WHERE `label` = '-';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT      T1.molecule_id,      CASE          WHEN T2.bond_type = '-' THEN 'single bond'         WHEN T2.bond_type = '=' THEN 'double bond'         WHEN T2.bond_type = '#' THEN 'triple bond'         ELSE 'unknown bond type'     END AS bond_type FROM      molecule AS T1 JOIN      bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T1.molecule_id BETWEEN 'TR000' AND 'TR050' ORDER BY      T1.molecule_id;	toxicology
SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' GROUP BY T1.element;	toxicology
SELECT COUNT(*) FROM `bond` b JOIN `atom` a ON b.`molecule_id` = a.`molecule_id` WHERE a.element = 'i' AND b.`bond_id` IN (     SELECT `bond_id` FROM `atom` WHERE element = 'i' )	toxicology
SELECT      m.label  FROM      atom a  JOIN      molecule m ON a.molecule_id = m.molecule_id  WHERE      a.element = 'ca'  GROUP BY      m.label  ORDER BY      COUNT(*) DESC  LIMIT 1;	toxicology
SELECT c.atom_id2, a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_1_8' AND (a.element = 'cl' OR a.element = 'c') GROUP BY c.atom_id2, a.element HAVING COUNT(DISTINCT a.element) = 2	toxicology
SELECT T1.molecule_id FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `bond` AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element = 'c' AND T3.bond_type = '#' AND T1.label = '-' LIMIT 2;	toxicology
SELECT CAST(SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom.molecule_id) AS percentage FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT DISTINCT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR001';	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_type` = ' = ';	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '-' AND `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '-')	toxicology
SELECT `molecule`.`label` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `bond.bond_id` = 'TR001_10_11';	toxicology
SELECT T1.bond_id, T3.label  FROM bond AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id  WHERE T1.bond_type = '#' AND T3.label = '+'	toxicology
SELECT atom.element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+' AND SUBSTR(atom.atom_id, 7, 1) = '4'	toxicology
SELECT      '+' AS label,     CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element) AS ratio FROM      atom AS T1 JOIN      molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.molecule_id = 'TR006'	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca' AND m.label = '+'	toxicology
SELECT T3.bond_type  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN bond AS T3 ON T1.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'c'))) AND T1.molecule_id = T3.molecule_id  WHERE T1.element = 'c'  AND T3.bond_type IN ('-', '=', '#');	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_10_11' ORDER BY T1.element;	toxicology
SELECT CAST(SUM(CASE WHEN `bond_type` = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`bond_id`) FROM `bond`;	toxicology
SELECT      CAST(SUM(CASE WHEN `bond_type` = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`bond_id`) AS percent FROM      `bond` WHERE      `molecule_id` = 'TR047';	toxicology
SELECT COUNT(*) FROM `atom` a JOIN `molecule` m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` = 'TR151';	toxicology
SELECT atom.element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR151'	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id LIKE 'TR%' AND SUBSTR(molecule.molecule_id, 3, 3) BETWEEN 10 AND 50 AND atom.element = 'c';	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT `bond.bond_id` FROM `bond` JOIN `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE `bond.bond_type` = '=' AND `molecule.label` = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'h' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT T3.molecule_id FROM `bond` AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T2.atom_id = 'TR000_1' AND T3.atom_id IN (SELECT atom_id FROM `atom` WHERE atom_id = 'TR000_1_2') AND T3.molecule_id IS NOT NULL;	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT      CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id)  FROM      molecule AS T1  JOIN      atom AS T2  ON      T1.molecule_id = T2.molecule_id;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT atom.atom_id  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR186'	toxicology
SELECT bond_type FROM `bond` WHERE `bond_id` = 'TR007_4_19'	toxicology
SELECT atom.element FROM connected JOIN atom ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) AS double_bonds_count,         COALESCE(molecule.label, '-') AS carcinogenicity FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_id LIKE 'TR006_%' AND bond.bond_type = '=';	toxicology
SELECT m.molecule_id, m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT DISTINCT b.bond_id, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element ORDER BY a.element ASC SEPARATOR ', ') AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' GROUP BY m.molecule_id HAVING COUNT(*) = 3 AND MAX(LENGTH(a.element)) > 1;	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*)  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'cl'	toxicology
SELECT atom.atom_id, COUNT(DISTINCT bond.bond_type) AS bond_types_count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR346'	toxicology
SELECT COUNT(*) AS num_molecules_with_double_bond_and_carcinogenic FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT molecule_id)  FROM atom  WHERE element <> 's'  AND NOT EXISTS (     SELECT 1 FROM bond WHERE molecule_id = atom.molecule_id AND bond_type = '=' )	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '-';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT      CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.element = 'cl';	toxicology
SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_1_7' AND T1.molecule_id IS NOT NULL GROUP BY T1.molecule_id HAVING COUNT(*) > 0;	toxicology
SELECT COUNT(DISTINCT CASE WHEN a.element IS NOT NULL THEN a.element ELSE '' END) FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT T3.bond_type FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T1.bond_id WHERE (T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1')	toxicology
SELECT M.molecule_id  FROM bond B  JOIN connected C ON B.bond_id = C.bond_id  JOIN atom A ON A.atom_id = C.atom_id  JOIN molecule M ON M.molecule_id = B.molecule_id  WHERE A.atom_id IN ('TR000_2', 'TR000_4')  AND A.atom_id2 IN ('TR000_2', 'TR000_4') GROUP BY M.molecule_id HAVING COUNT(*) = 2;	toxicology
SELECT element FROM `atom` WHERE atom_id = 'TR000_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000'	toxicology
SELECT      (SUM(CASE WHEN `bond_type` = '-' THEN 1 ELSE 0 END) * 100.0 / COUNT(`bond_id`)) AS percentage FROM `bond`	toxicology
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT `molecule_id` FROM `atom` JOIN `bond` ON `atom.molecule_id` = `bond.molecule_id` WHERE `element` = 's' AND `bond.bond_type` = '=';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5 AND m.label = '-'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.bond_type = '-' AND T1.element IN ('Cl', 'C', 'H', 'O', 'S', 'N', 'P', 'Na', 'Br', 'F', 'I', 'Sn', 'Pb', 'Te', 'Ca') AND T2.molecule_id = 'TR024' GROUP BY T1.element HAVING COUNT(T1.element) > 1	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM      atom AS T1 JOIN      bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN      molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE      T1.element = 'h' AND T2.bond_type = '#' AND T3.label = '+'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM `bond`  JOIN `molecule` ON `bond`.molecule_id = `molecule`.molecule_id  WHERE `molecule`.molecule_id BETWEEN 'TR004' AND 'TR010' AND `bond`.bond_type = '-';	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT T1.element  FROM `atom` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'	toxicology
SELECT COUNT(DISTINCT mol.molecule_id)  FROM atom mol_atm  JOIN molecule mol ON mol.molecule_id = mol_atm.molecule_id  JOIN bond mol_bnd ON mol.molecule_id = mol_bnd.molecule_id  WHERE mol_atm.element = 'o' AND mol_bnd.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND m.label = '-'	toxicology
SELECT T1.element, T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR002' UNION SELECT T1.element, 'Molecular Structure' FROM atom AS T1 JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T4.molecule_id = 'TR002' AND T1.element IS NOT NULL;	toxicology
SELECT `atom.atom_id` FROM `atom` JOIN `molecule` ON `atom.molecule_id` = `molecule.molecule_id` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `atom.element` = 'c' AND `bond.bond_type` = ' =' AND `molecule.molecule_id` = 'TR012'	toxicology
SELECT T1.atom_id FROM `atom` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'	toxicology
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT id FROM cards WHERE borderColor = 'black' AND cardKingdomId IS NULL;	card_games
SELECT name FROM cards WHERE faceConvertedManaCost IS NOT NULL ORDER BY faceConvertedManaCost DESC;	card_games
SELECT id FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned';	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.types LIKE '%Artifact%' AND cards.side IS NULL AND legalities.format = 'vintage'	card_games
SELECT cards.id, cards.artist  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE cards.power = '*' OR cards.power IS NULL  AND legalities.format = 'commander'  AND legalities.status = 'Legal';	card_games
SELECT c.id FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 0 AND EXISTS (     SELECT 1 FROM cards c2 WHERE c2.artist = 'Stephen Daniele' AND c2.hasContentWarning = 1 );	card_games
SELECT r.text  FROM rulings AS r  JOIN cards AS c ON r.uuid = c.uuid  WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid HAVING COUNT(r.uuid) = (     SELECT MAX(totalCount)     FROM (         SELECT COUNT(uuid) AS totalCount         FROM rulings         GROUP BY uuid     ) t ) LIMIT 1;	card_games
SELECT foreign_data.language  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.name = 'Annul' AND cards.number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese'	card_games
SELECT      (SUM(CASE WHEN f.language = 'Chinese Simplified' THEN c.id ELSE 0 END) * 100.0 / COUNT(c.id)) AS percentage FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      f.language = 'Chinese Simplified';	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' ORDER BY s.name;	card_games
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'Aaron Boyd' AND `type` IS NOT NULL;	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*' ;	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `originalType` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT T3.language  FROM cards AS T1  JOIN set_translations AS T3 ON T1.id = T3.id  WHERE T1.name = 'Angel of Mercy'	card_games
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted' AND c.isTextless = 0;	card_games
SELECT r.text FROM rulings AS r WHERE r.uuid IN (SELECT c.uuid FROM cards AS c WHERE c.name = 'Condemn')	card_games
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted' AND c.isStarter = 1;	card_games
SELECT `status` FROM `legalities` JOIN `cards` ON `legalities`.`uuid` = `cards`.`uuid` WHERE `cards`.`name` = 'Aven Cloudchaser'	card_games
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight';	card_games
SELECT `format` FROM `legalities` JOIN `cards` ON `legalities`.`uuid` = `cards`.`uuid` WHERE `cards`.`name` = 'Benalish Knight';	card_games
SELECT `artist` FROM `cards` JOIN `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` WHERE `language` = 'Phyrexian';	card_games
SELECT CAST(SUM(CASE WHEN `borderColor` = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`id`) FROM `cards`;	card_games
SELECT COUNT(*)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.isReprint = 1 AND fd.language = 'German';	card_games
SELECT COUNT(*)  FROM `cards` c  JOIN `foreign_data` fd ON c.uuid = fd.uuid  WHERE c.borderColor != 'borderless' AND fd.language = 'Russian';	card_games
SELECT      CAST(COUNT(CASE WHEN T2.language = 'French' THEN T1.id ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN T1.isStorySpotlight = 1 THEN T1.id ELSE NULL END) AS percentage FROM      cards AS T1 JOIN      foreign_data AS T2 ON T1.uuid = T2.uuid WHERE      T1.isStorySpotlight = 1	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT `layout` FROM `cards` WHERE `keywords` = 'Flying'	card_games
SELECT COUNT(*) FROM `cards` WHERE `originalType` LIKE '%Summon - Angel%' AND `subtypes` NOT LIKE '%Angel%'	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT `edhrecRank` FROM `cards` WHERE `frameVersion` = '2015';	card_games
SELECT `artist` FROM `cards` WHERE `uuid` IN (SELECT `uuid` FROM `foreign_data` WHERE `language` = 'Chinese Simplified');	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'Banned' AND cards.borderColor = 'white'	card_games
SELECT c.uuid, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.uuid IN (     SELECT uuid FROM legalities WHERE format = 'legacy' )	card_games
SELECT `text` FROM `rulings` WHERE `uuid` = (SELECT `uuid` FROM `cards` WHERE `name` = 'Beacon of Immortality');	card_games
SELECT COUNT(*) AS future_card_count, 'legal' AS legality_status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' AND legalities.status = 'legal';	card_games
SELECT c.colors FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.setCode = 'OGW'	card_games
SELECT c.id, c.convertedManaCost, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.convertedManaCost = 5 AND c.setCode = '10E'	card_games
SELECT c.originalType, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20	card_games
SELECT `name` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.colors` = 'B' AND `cards.originalType` = 'Artifact';	card_games
SELECT name  FROM cards  JOIN rulings ON cards.uuid = rulings.uuid  WHERE rarity = 'uncommon'  ORDER BY date ASC  LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards c  JOIN (     SELECT `cardKingdomFoilId`     FROM cards      WHERE `artist` = 'John Avon' ) cf ON c.cardKingdomFoilId = cf.`cardKingdomFoilId`  WHERE cf.`cardKingdomFoilId` IS NOT NULL	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist LIKE 'UDON'  AND type = 'availability = \'mtgo\''  AND hand = -1;	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT `manaCost` FROM `cards` WHERE `layout` = 'normal' AND `frameVersion` = '2003' AND `borderColor` = 'black' AND `availability` = 'mtgo,paper';	card_games
SELECT SUM(T1.unconvertedManaCost)  FROM cards AS T1  JOIN PRAGMA_TABLE_INFO('cards') AS T2 ON T1.id = T2.id  WHERE T2.name = 'artist' AND T1.artist = 'Rob Alexander';	card_games
SELECT DISTINCT      CASE WHEN `availability` = 'arena' THEN `subtypes` ELSE NULL END AS subtypes,     CASE WHEN `availability` = 'arena' THEN `supertypes` ELSE NULL END AS supertypes FROM cards WHERE `availability` LIKE '%arena%'	card_games
SELECT `setCode` FROM `set_translations` WHERE `language` = 'Spanish';	card_games
SELECT CAST(SUM(CASE WHEN `isOnlineOnly` = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM `cards` WHERE `frameEffects` = 'legendary'	card_games
SELECT id  FROM cards  WHERE isStorylight = 1 AND isTextless = 0;	card_games
SELECT      `name`,     (COUNT(CASE WHEN `language` = 'Spanish' THEN 1 END) * 100.0 / COUNT(`language`)) AS percentage FROM      `foreign_data` ORDER BY      `name`;	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM `sets` s JOIN `set_translations` st ON s.id = st.id WHERE s.block = 'Commander' AND s.code IS NOT NULL AND st.language = 'Portuguese (Brasil)' AND s.block = st.setCode;	card_games
SELECT `cards`.id  FROM `cards` JOIN `legalities` ON `cards.uuid` = `legalities.uuid` WHERE `cards.types` = 'Creature' AND `legalities.status` = 'Legal'	card_games
SELECT DISTINCT c.subtypes, c.supertypes FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE power IS NULL OR power = '*'  AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.format = 'premodern' AND cards.side IS NULL AND cards.text LIKE '%This is a triggered mana ability%'	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper'	card_games
SELECT `artist` FROM `cards` WHERE `uuid` IN (     SELECT `uuid`     FROM `foreign_data`     WHERE `flavorText` = 'Das perfekte Gegenmittel zu einer dichten Formation' )	card_games
SELECT `name`, `language` FROM `foreign_data` JOIN `cards` ON `foreign_data.uuid` = `cards.uuid` WHERE `cards.artist` = 'Matthew D. Wilson' AND `cards.types` = 'Creature' AND `cards.layout` = 'normal' AND `cards.borderColor` = 'black' AND `language` = 'French'	card_games
SELECT COUNT(*)  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.rarity = 'rare' AND date = '2007-02-01'	card_games
SELECT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'	card_games
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id)  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T2.format = 'commander' AND T2.status = 'Legal'	card_games
SELECT      CAST(COUNT(CASE WHEN f.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 ELSE NULL END) AS Percentage FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid;	card_games
SELECT      CAST(SUM(CASE WHEN T1.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.setCode) AS Percentage FROM      set_translations AS T1 JOIN      sets AS T2 ON T1.setCode = T2.code WHERE      T2.type = 'expansion';	card_games
SELECT `availability` FROM `cards` WHERE `artist` = 'Daren Bader';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1	card_games
SELECT name  FROM cards  WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague'  ORDER BY name  LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT      cardKingdomFoilId, cardKingdomId FROM      cards WHERE      cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY      cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      CAST(SUM(CASE WHEN `isTextless` = 1 AND `layout` = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`isTextless`) AS proportion FROM `cards`	card_games
SELECT id FROM cards WHERE side = 'Angel' AND subtypes LIKE '%Wizard%' AND side IS NULL	card_games
SELECT name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name  LIMIT 3;	card_games
SELECT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.code = 'ARC'	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.id = st.id WHERE s.id = 5;	card_games
SELECT `language`, `type` FROM `set_translations` JOIN `sets` ON `set_translations.setCode` = `sets.code` WHERE `sets.id` = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT `sets`.`id` FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `sets`.`isFoilOnly` = 1 AND `set_translations`.`language` = 'Japanese' AND `set_translations`.`language` <> 'English' AND `sets`.`isForeignOnly` = 1;	card_games
SELECT `sets`.code, MAX(`sets`.baseSetSize) AS max_cards FROM `sets` JOIN `set_translations` ON `sets`.code = `set_translations`.setCode WHERE `set_translations`.language = 'Russian'	card_games
SELECT CAST(SUM(CASE WHEN `set_translations.language` = 'Chinese Simplified' AND `sets.isOnlineOnly` = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`sets.isOnlineOnly`) FROM `set_translations` JOIN `sets` ON `set_translations.setCode` = `sets.code`;	card_games
SELECT COUNT(*) FROM sets WHERE code IN (     SELECT setCode FROM set_translations WHERE language = 'Japanese' AND setCode NOT IN (         SELECT code FROM sets WHERE mtgoCode IS NOT NULL OR mtgoCode = ''     ) )	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT `language` FROM `set_translations` WHERE `id` = '174';	card_games
SELECT `name` FROM `sets` WHERE `code` = 'ALL';	card_games
SELECT language FROM `foreign_data` WHERE name = 'A Pedra Fellwar'	card_games
SELECT `code` FROM `sets` WHERE `releaseDate` = '2007-07-13'	card_games
SELECT `baseSetSize`, `code` FROM `sets` WHERE `block` IN ('Masques', 'Mirage')	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion'	card_games
SELECT f.name, c.type FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.watermark = 'Boros';	card_games
SELECT fd.language, cards.flavorText, cards.uuid FROM foreign_data AS fd JOIN cards ON fd.uuid = cards.uuid WHERE cards.watermark = 'colorpie';	card_games
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Abyssal Horror'	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion commander';	card_games
SELECT `name`, `type` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `watermark` = 'abzan';	card_games
SELECT `foreign_data.language`, `cards.type` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.watermark` LIKE '%Azorius%' AND `foreign_data.language` IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM `cards` WHERE `availability` LIKE '%paper%' AND SUBSTRING_INDEX(SUBSTRING_INDEX(`availability`, ',', -1), ' ', 1) = 'hand' AND SUBSTRING_INDEX(SUBSTRING_INDEX(`availability`, ',', -1), ' ', -1) = '3'	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor\'s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT `purchaseUrls` FROM `cards` WHERE `promoTypes` LIKE '%bundle%' AND `purchaseUrls` IS NOT NULL;	card_games
SELECT COUNT(DISTINCT availability)  FROM cards  WHERE availability LIKE '%arena,mtgo%' AND availability LIKE '%black border%';	card_games
SELECT `name`, `convertedManaCost` FROM `cards` WHERE (`name` = 'Serra Angel' AND `convertedManaCost` > (SELECT `convertedManaCost` FROM `cards` WHERE `name` = 'Shrine Keeper')) OR (`name` = 'Shrine Keeper' AND `convertedManaCost` > (SELECT `convertedManaCost` FROM `cards` WHERE `name` = 'Serra Angel'));	card_games
SELECT `artist` FROM `cards` WHERE `flavorName` = 'Battra, Dark Destroyer';	card_games
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3;	card_games
SELECT `translation` FROM `set_translations` WHERE `setCode` IN (     SELECT `setCode`     FROM `cards`     WHERE `name` = 'Ancestor''s Chosen' ) AND `language` = 'Italian';	card_games
SELECT COUNT(*)  FROM (     SELECT st.translation      FROM cards c      JOIN set_translations st ON c.setCode = st.setCode      WHERE c.name = 'Angel of Mercy' ) t;	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM `cards`     JOIN `set_translations` ON `cards.setCode` = `set_translations.setCode`     WHERE `cards.name` = 'Ancestor''s Chosen' AND `set_translations.language` = 'Korean' )	card_games
SELECT COUNT(*)  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex';	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'	card_games
SELECT `translation` FROM `set_translations` JOIN `sets` ON `sets`.`code` = `set_translations`.`setCode` WHERE `sets`.`name` = 'Eighth Edition' AND `set_translations`.`language` = 'Chinese Simplified'	card_games
SELECT c.name, s.mtgoCode FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT `releaseDate` FROM `sets` JOIN `cards` ON `sets.code` = `cards.setCode` WHERE `cards.name` = 'Ancestor''s Chosen';	card_games
SELECT `type` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `set_translations.translation` = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `sets`.`block` = 'Ice Age' AND `set_translations`.`language` = 'Italian' AND `set_translations`.`translation` IS NOT NULL;	card_games
SELECT s.name FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black';	card_games
SELECT `name` FROM `cards` WHERE `setCode` = 'Coldsnap' ORDER BY `convertedManaCost` DESC LIMIT 1;	card_games
SELECT `artist` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Coldsnap' AND `artist` IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT `number` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Coldsnap' AND `cards.number` = 4;	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.convertedManaCost > 5 AND c.power = '*' OR c.power IS NULL;	card_games
SELECT `flavorText` FROM `foreign_data` WHERE `language` = 'Italian' AND `name` = 'Ancestor''s Chosen'	card_games
SELECT DISTINCT language FROM `foreign_data` WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL;	card_games
SELECT `type` FROM `cards` WHERE `uuid` IN (SELECT `uuid` FROM `foreign_data` WHERE `language` = 'German' AND `name` = 'Ancestor''s Chosen')	card_games
SELECT `text` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.setCode` IN (SELECT `code` FROM `sets` WHERE `name` = 'Coldsnap') AND `foreign_data.language` = 'Italian'	card_games
SELECT `name` FROM `cards` JOIN `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` WHERE `sets`.`name` = 'Coldsnap' AND `foreign_data`.`language` = 'Italian' ORDER BY `cards`.`convertedManaCost` DESC LIMIT 1;	card_games
SELECT `date` FROM `rulings` JOIN `cards` ON `rulings`.`uuid` = `cards`.`uuid` WHERE `cards`.`name` = 'Reminisce';	card_games
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id)  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT `type` FROM `sets` WHERE `name` LIKE 'From the Vault: Lore'	card_games
SELECT `parentCode` FROM `sets` WHERE `name` = 'Commander 2014 Oversized';	card_games
SELECT c.text, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 0;	card_games
SELECT `releaseDate` FROM `sets` WHERE `code` IN (SELECT `setCode` FROM `cards` WHERE `name` = 'Evacuation')	card_games
SELECT `baseSetSize` FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`translation` = 'Rinascita di Alara'	card_games
SELECT `type` FROM `sets` WHERE `code` IN (     SELECT `setCode`     FROM `set_translations`     WHERE `translation` = 'Huitième édition' )	card_games
SELECT `translation` FROM `cards` JOIN `set_translations` ON `cards.setCode` = `set_translations.setCode` WHERE `name` = 'Tendo Ice Bridge' AND `set_translations.language` = 'French';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE name = 'Tenth Edition' AND translation IS NOT NULL	card_games
SELECT `set_translations.translation` FROM `cards` JOIN `set_translations` ON `cards.setCode` = `set_translations.setCode` WHERE `cards.name` = 'Fellwar Stone' AND `set_translations.language` = 'Japanese';	card_games
SELECT `name` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Journey into Nyx Hero''s Path' ORDER BY `convertedManaCost` DESC LIMIT 1;	card_games
SELECT `releaseDate` FROM `sets` WHERE `code` IN (SELECT `setCode` FROM `set_translations` WHERE `translation` = 'Ola de frío')	card_games
SELECT `type` FROM `sets` WHERE `name` IN (SELECT `setCode` FROM `cards` WHERE `name` = 'Samite Pilgrim')	card_games
SELECT COUNT(*)  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3;	card_games
SELECT `translation` FROM `set_translations` JOIN `sets` ON `set_translations.setCode` = `sets.code` WHERE `sets.name` = 'Mirrodin' AND `set_translations.language` = 'Chinese Simplified';	card_games
SELECT      CAST(SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(s.id) AS percentage_japanese_non_foil FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Japanese';	card_games
SELECT      CAST(SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      sets s  JOIN      set_translations st ON s.code = st.setCode  WHERE      st.language = 'Portuguese (Brazil)';	card_games
SELECT `availability` FROM `cards` WHERE `artist` = 'Aleksi Briclot' AND `isTextless` = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)	card_games
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL)	card_games
SELECT frameEffects  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  GROUP BY frameEffects  ORDER BY COUNT(*) DESC  LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE duelDeck = 'A' AND power IS NULL OR power = '*' AND hasFoil = 0;	card_games
SELECT id FROM sets WHERE type = 'commander' AND totalSetSize = (SELECT MAX(totalSetSize) FROM sets WHERE type = 'commander');	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10;	card_games
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*) FROM `cards` c JOIN `foreign_data` fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French'	card_games
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'rare'  AND c.types = 'Enchantment'  AND c.name = 'Abundance'  AND l.status = 'Legal';	card_games
SELECT format, COUNT(*) AS banned_count FROM legalities WHERE status = 'Banned' GROUP BY format ORDER BY banned_count DESC LIMIT 1;	card_games
SELECT `language` FROM `set_translations` JOIN `sets` ON `set_translations.id` = `sets.id` WHERE `sets.name` = 'Battlebond';	card_games
SELECT T1.artist, GROUP_CONCAT(T2.format)  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  GROUP BY T1.artist  ORDER BY COUNT(*) ASC  LIMIT 1;	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997' AND cards.artist = 'D. Alexander Gregory' AND cards.hasContentWarning = 1 AND legalities.format = 'legacy'	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned'	card_games
SELECT      AVG(s.id) AS average_sets_per_year,     MAX(cnt) AS common_language FROM (     SELECT          COUNT(*) AS cnt     FROM `set_translations` ) AS language_count, (SELECT      DATE_FORMAT(`releaseDate`, '%Y') AS year,     COUNT(`id`) AS id_count FROM `sets` WHERE `releaseDate` BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(`releaseDate`) ) AS set_releases JOIN language_count ON TRUE;	card_games
SELECT artist FROM cards WHERE BorderColor = 'black' AND availability = 'arena';	card_games
SELECT `uuid` FROM `legalities` WHERE `format` = 'oldschool' AND `status` IN ('banned', 'restricted')	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT `text` FROM `rulings` JOIN `cards` ON `rulings`.`uuid` = `cards`.`uuid` WHERE `artist` = 'Kev Walker' ORDER BY `date` DESC;	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'	card_games
SELECT `sets`.name FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`language` NOT LIKE '%Japanese%' AND `set_translations`.`language` = 'Korean'	card_games
SELECT DISTINCT c.frameVersion, c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' AND l.status = 'Banned';	card_games
SELECT MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')	codebase_community
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011';	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users u JOIN (     SELECT UserId     FROM votes     GROUP BY UserId     HAVING SUM(CASE WHEN Type = 'upvote' THEN 1 ELSE 0 END) > 100 ) upvoted_users ON u.Id = upvoted_users.UserId JOIN (     SELECT UserId     FROM votes     GROUP BY UserId     HAVING SUM(CASE WHEN Type = 'downvote' THEN 1 ELSE 0 END) > 1 ) downvoted_users ON u.Id = downvoted_users.UserId;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT T1.Title FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(T2.CommentCount) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT MAX(Posts.AnswerCount)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL;	codebase_community
SELECT u.DisplayName  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20	codebase_community
SELECT T2.Location FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND STRFTIME('%Y', Date) = '2011';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(T1.Score) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(b.Id) / COUNT(DISTINCT u.DisplayName) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200	codebase_community
SELECT      CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id)  FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN (     SELECT PostId, MAX(Score) AS max_score     FROM comments     GROUP BY PostId ) c ON p.Id = c.PostId WHERE c.max_score = (     SELECT MAX(Score)     FROM comments )	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount = 1910);	codebase_community
SELECT `FavoriteCount` FROM `posts` JOIN `comments` ON `posts`.`Id` = `comments`.`PostId` WHERE `UserId` = 3025 AND `CreationDate` = '2014/4/23 20:29:39.0';	codebase_community
SELECT c.Text FROM comments c WHERE c.PostId IN (SELECT p.ParentId FROM posts p WHERE p.Id = 107829) AND c.CommentCount = 1;	codebase_community
SELECT p.ClosedDate FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = '23853' AND c.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT users.Reputation  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE posts.Id = '65041'	codebase_community
SELECT COUNT(*) FROM `posts` p JOIN `users` u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = '6347'	codebase_community
SELECT COUNT(*)  FROM votes v  JOIN posts p ON v.PostId = p.Id  WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      COUNT(p.Id) / COUNT(v.Id) AS PostToVoteRatio FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id JOIN      votes v ON u.Id = v.UserId WHERE      u.Id = 24;	codebase_community
SELECT `ViewCount` FROM `posts` WHERE `Title` = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com'	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'SilentGhost'	codebase_community
SELECT `users.DisplayName` FROM `comments` JOIN `users` ON `comments.UserId` = `users.Id` WHERE `comments.Text` = 'thank you user93'	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT `users`.`Reputation`, `users`.`DisplayName` FROM `posts` JOIN `users` ON `posts`.`OwnerUserId` = `users`.`Id` WHERE `posts`.`Title` = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT T1.Title FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Vebjorn Ljosa' AND T1.LastEditorUserId = T2.Id;	codebase_community
SELECT SUM(T1.Score) AS TotalScore, T2.WebsiteUrl FROM posts T1 JOIN users T2 ON T1.OwnerUserId = T2.Id JOIN (     SELECT OwnerUserId     FROM posts     WHERE LastEditorUserId = (SELECT Id FROM users WHERE DisplayName = 'Yevgeny') ) T3 ON T1.OwnerUserId = T3.OwnerUserId	codebase_community
SELECT Comment FROM postHistory JOIN posts ON postHistory.PostId = posts.Id WHERE posts.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND postHistory.Comment IS NOT NULL;	codebase_community
SELECT SUM(T2.BountyAmount)  FROM `posts` AS T1  JOIN `votes` AS T2 ON T1.Id = T2.PostId  WHERE T1.Title LIKE '%data%'	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON p.Id = v.PostId WHERE p.Title LIKE '%variance%' AND v.BountyAmount = 50;	codebase_community
SELECT p.Title, c.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id LEFT JOIN comments c ON p.Id = c.PostId WHERE t.TagName = '<humor>' GROUP BY p.Id, p.Title, c.Text ORDER BY AverageViewCount DESC;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT Id)  FROM badges  WHERE Name = 'Supporter' AND DATE(Date) BETWEEN '2011-01-01' AND '2011-12-31'	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name IN (SELECT Name FROM badges GROUP BY Name HAVING COUNT(*) > 5);	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location = 'New York, NY' AND badges.Name IN ('Teacher', 'Supporter')	codebase_community
SELECT u.Id, u.Reputation FROM users u JOIN posts p ON u.Id = p.UserId WHERE p.Id = 1;	codebase_community
SELECT u.Id AS UserId FROM users u JOIN (     SELECT ph.PostId, COUNT(*) AS count_ph     FROM postHistory ph     GROUP BY ph.PostId     HAVING COUNT(*) = 1 ) ph ON u.Id = ph.UserId JOIN posts p ON ph.PostId = p.Id WHERE p.ViewCount >= 1000;	codebase_community
SELECT b.Name, COUNT(c.UserId) AS CommentCount FROM badges b JOIN (     SELECT UserId     FROM comments     GROUP BY UserId     HAVING COUNT(UserId) = (         SELECT MAX(CommentCount)         FROM (             SELECT COUNT(UserId) AS CommentCount             FROM comments             GROUP BY UserId         )     ) ) c ON b.UserId = c.UserId GROUP BY b.Name;	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher'	codebase_community
SELECT      ABS((COUNT(CASE WHEN YEAR(`Date`) = 2010 THEN 1 END) / COUNT(*) -           COUNT(CASE WHEN YEAR(`Date`) = 2011 THEN 1 END) / COUNT(*)) * 100) AS Percentage_Difference FROM      badges WHERE      `Name` = 'Student';	codebase_community
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT c.UserId) AS UniqueCommenters FROM postHistory AS ph JOIN comments AS c ON ph.PostId = c.PostId WHERE ph.PostId = 3720 GROUP BY ph.PostHistoryTypeId;	codebase_community
SELECT p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.PostId = 61217;	codebase_community
SELECT posts.Score, postLinks.LinkTypeId FROM posts JOIN postLinks ON posts.Id = postLinks.PostId WHERE postLinks.LinkTypeId = 395;	codebase_community
SELECT p.Id AS PostID, u.Id AS UserID FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount) FROM postHistory ph JOIN posts p ON ph.PostId = p.Id JOIN users u ON ph.UserId = u.Id WHERE u.Id = 686 AND YEAR(ph.CreationDate) = 2011	codebase_community
SELECT      AVG(T3.UpVotes) AS AverageVotes,     AVG(T3.Age) AS AverageAge FROM      (     SELECT          OwnerUserId, COUNT(*) AS PostCount     FROM          posts     GROUP BY          OwnerUserId     ) T1 JOIN      (     SELECT          Id, UpVotes, Age     FROM          users     ) T3 ON T1.OwnerUserId = T3.Id WHERE      T1.PostCount > 10	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name  FROM badges  WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE score > 60;	codebase_community
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10;	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre'	codebase_community
SELECT T1.Date FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'	codebase_community
SELECT      CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM badges)  FROM      badges  WHERE      Name = 'Teacher';	codebase_community
SELECT      CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId)  FROM      badges b  JOIN      users u ON b.UserId = u.Id  WHERE      b.Name = 'Organizer'	codebase_community
SELECT c.Score  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age  FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age BETWEEN 19 AND 65;	codebase_community
SELECT SUM(users.Views)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE DATE(badges.Date) = '2010-07-19' AND TIME(badges.Date) = '19:39:08'	codebase_community
SELECT T1.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(*) FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT      CAST(COUNT(CASE WHEN YEAR(`CreationDate`) = 2010 THEN 1 END) AS REAL) /      CAST(COUNT(CASE WHEN YEAR(`CreationDate`) = 2011 THEN 1 END) AS REAL) AS vote_ratio_2010_to_2011 FROM `votes`;	codebase_community
SELECT t.TagName FROM tags AS t JOIN posts AS p ON t.ExcerptPostId = p.Id OR t.WikiPostId = p.Id JOIN users AS u ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'John Salvatier'	codebase_community
SELECT COUNT(*) FROM postHistory p JOIN users u ON p.UserId = u.Id WHERE u.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT `posts`.`Id` FROM `posts` JOIN `postHistory` ON `posts`.`Id` = `postHistory`.`PostId` JOIN `users` ON `postHistory`.`UserId` = `users`.`Id` WHERE `users`.`DisplayName` = 'slashnick' ORDER BY `posts`.`AnswerCount` DESC LIMIT 1;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName IN('Harvey Motulsky', 'Noah Snyder') ORDER BY p.ViewCount DESC LIMIT 1	codebase_community
SELECT COUNT(*)  FROM (     SELECT p.Id      FROM posts p      JOIN users u ON p.UserId = u.Id      JOIN votes v ON p.Id = v.PostId      WHERE u.DisplayName = 'Matt Parker' AND v.UserId IN (3, 5)      GROUP BY p.Id      HAVING COUNT(v.Id) > 4 ) AS subquery;	codebase_community
SELECT COUNT(*)  FROM comments c  JOIN posts p ON c.PostId = p.Id  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60	codebase_community
SELECT p.Tags  FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer';	codebase_community
SELECT      CAST((SELECT COUNT(*) FROM tags t            JOIN postHistory ph ON t.ExcerptPostId = ph.PostId            WHERE t.TagName = 'r' AND ph.UserId = -1) AS REAL) * 100 /      (SELECT COUNT(*) FROM postHistory ph WHERE ph.UserId = -1) AS Percentage	codebase_community
SELECT      (SUM(p.ViewCount WHERE u.DisplayName = 'Mornington') - SUM(p.ViewCount WHERE u.DisplayName = 'Amos')) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*)  FROM postHistory  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM `comments` WHERE `Score` < 60 AND `UserId` = 13;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location LIKE '%North Pole%' AND EXTRACT(YEAR FROM b.Date) = 2011	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150	codebase_community
SELECT COUNT(ph.Id) AS PostHistoryCount, phs.LastEditDate FROM postHistory ph JOIN posts ps ON ph.PostId = ps.Id JOIN (     SELECT Id     FROM posts     WHERE Title = 'What is the best introductory Bayesian statistics textbook?' ) ps_title ON ps.Id = ps_title.Id WHERE ps.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY phs.LastEditDate;	codebase_community
SELECT u.LastAccessDate, u.Location FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Outliers'	codebase_community
SELECT p.Title FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.RelatedPostId WHERE pl.PostId IN (     SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' )	codebase_community
SELECT ph.PostId, b.Name FROM postHistory ph JOIN badges b ON ph.UserId = (     SELECT u.Id     FROM users u     WHERE u.UserDisplayName = 'Samuel' ) WHERE YEAR(ph.CreationDate) = 2013 AND YEAR(b.Date) = 2013;	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT `users.DisplayName`, `users.Location` FROM `users` JOIN `posts` ON `users.Id` = `posts.OwnerUserId` JOIN `tags` ON `posts.Id` = `tags.ExcerptPostId` WHERE `tags.TagName` = 'hypothesis-testing';	codebase_community
SELECT T3.Title, T2.LinkTypeId FROM postLinks AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id JOIN posts AS T3 ON T1.RelatedPostId = T3.Id WHERE T2.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NULL) AND p.ParentId IS NOT NULL;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8)	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(posts.Score)  FROM posts  WHERE posts.LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT      COUNT(pl.Id) / 12 AS avg_monthly_links FROM      postLinks pl JOIN      posts p ON pl.PostId = p.Id WHERE      YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2;	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON v.UserId = u.Id WHERE u.Id = 1465 AND p.FavoriteCount = (     SELECT MAX(FavoriteCount) FROM posts )	codebase_community
SELECT Title FROM posts WHERE Id IN (SELECT PostId FROM postLinks) ORDER BY `CreaionDate` ASC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Id = (SELECT MAX(Id) FROM badges)	codebase_community
SELECT MIN(T1.CreationDate)  FROM votes AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.DisplayName = 'chl'	codebase_community
SELECT MIN(T1.CreationDate) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date LIMIT 1	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Location LIKE '%United Kingdom%' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(T2.PostId)  FROM `users` AS T1  JOIN `votes` AS T2 ON T1.Id = T2.UserId  WHERE T1.Age = (SELECT MAX(Age) FROM `users`);	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM `posts` p JOIN `users` u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010;	codebase_community
SELECT `posts.Id`, `posts.Title` FROM `posts` JOIN `users` ON `posts.OwnerUserId` = `users.Id` WHERE `users.DisplayName` = 'Harvey Motulsky' ORDER BY `posts.ViewCount` DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(T1.Score)  FROM `posts` AS T1  JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id  WHERE T2.DisplayName = 'Stephen Turner'	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND EXTRACT(YEAR FROM p.CreationDate) = 2011	codebase_community
SELECT p.Id, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE strftime('%Y', u.CreationDate) = '2010'  ORDER BY p.FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(p.CreationDate) = 2011 AND u.Reputation > 1000 THEN p.Id ELSE NULL END)      / CAST(COUNT(p.Id) AS REAL)) * 100 AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT      (COUNT(Id WHERE Age BETWEEN 13 AND 18) / COUNT(Id)) * 100 AS Percentage FROM      users;	codebase_community
SELECT SUM(posts.ViewCount) AS TotalViews, users.DisplayName AS PosterName FROM posts JOIN postHistory ON posts.Id = postHistory.PostId JOIN users ON posts.LastEditorUserId = users.Id WHERE postHistory.Text = 'Computer Game Datasets' AND users.DisplayName IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.LastEditDate = (SELECT MAX(l.LastEditDate) FROM posts l WHERE l.Id = 183);	codebase_community
SELECT b.Name FROM badges b WHERE b.Date = (SELECT MAX(b2.Date) FROM badges b2 WHERE b2.UserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'Emmett'));	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT      (b.Date - u.CreationDate) AS TimeToGetBadge FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      u.DisplayName = 'Zolomon'	codebase_community
SELECT COUNT(p.Id) AS NumberOfPosts, COUNT(c.Id) AS NumberOfComments FROM posts p JOIN comments c ON p.OwnerUserId = c.PostId JOIN users u ON p.OwnerUserId = u.Id WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users)	codebase_community
SELECT c.Text, u.DisplayName  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM tags WHERE TagName = 'careers';	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT AnswerCount, CommentCount FROM posts WHERE Title = 'Clustering 1D data';	codebase_community
SELECT `CreationDate` FROM `users` WHERE `DisplayName` = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN (     SELECT OwnerUserId, MAX(Reputation) as MaxReputation     FROM (         SELECT OwnerUserId, Reputation         FROM posts p         JOIN users u ON p.OwnerUserId = u.Id     )     GROUP BY OwnerUserId ) max_reputation ON p.OwnerUserId = max_reputation.OwnerUserId AND p.Score > 50 GROUP BY max_reputation.MaxReputation ORDER BY max_reputation.MaxReputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT `Reputation`, `UpVotes` FROM `users` WHERE Id IN (     SELECT `UserId`     FROM `comments`     WHERE `Text` = 'fine, you win :)' )	codebase_community
SELECT c.Text  FROM comments AS c  JOIN posts AS p ON c.PostId = p.Id  WHERE p.Title LIKE '%linear regression%'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.CreationDate LIKE '%http://%'	codebase_community
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0	codebase_community
SELECT COUNT(*) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT `Posts`.`Id`, `Comments`.`Text` FROM `posts` JOIN `comments` ON `comments`.`PostId` = `posts`.`Id` WHERE `posts`.`Title` = 'Group differences on a five point Likert item';	codebase_community
SELECT `UpVotes` FROM `users` WHERE `Id` = (SELECT `UserId` FROM `comments` WHERE `Text` = 'R is also lazy evaluated.');	codebase_community
SELECT `Text` FROM `comments` WHERE `UserId` IN (SELECT `Id` FROM `users` WHERE `DisplayName` = 'Harvey Motulsky');	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      CAST(SUM(CASE WHEN u.UpVotes = 0 AND c.Score BETWEEN 5 AND 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.Id) FROM      comments c JOIN      users u ON c.UserId = u.Id;	codebase_community
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*)  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id, T1.full_name HAVING COUNT(T2.power_id) > 15;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'	superhero
SELECT c.colour FROM colour c WHERE c.id = (SELECT sc.skin_colour_id FROM superhero s WHERE s.superhero_name = 'Apocalypse')	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility'	superhero
SELECT s.superhero_name  FROM superhero s JOIN colour e ON s.eye_colour_id = e.id JOIN colour h ON s.hair_colour_id = h.id WHERE e.colour = 'Blue' AND h.colour = 'Blond'	superhero
SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT superhero.superhero_name, superhero.height_cm FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC;	superhero
SELECT `publisher_name` FROM `publisher` JOIN `superhero` ON `publisher.id` = `superhero.publisher_id` WHERE `superhero.superhero_name` = 'Sauron';	superhero
SELECT c.colour, COUNT(s.id) AS superhero_count FROM colour c JOIN superhero s ON c.id = s.eye_colour_id JOIN publisher p ON p.id = s.publisher_id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY superhero_count DESC;	superhero
SELECT AVG(T2.height_cm)  FROM `superhero` AS T2  JOIN `publisher` AS T1 ON T2.publisher_id = T1.id  WHERE T1.publisher_name = 'Marvel Comics'	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT `publisher.publisher_name` FROM `publisher` JOIN `superhero` ON `publisher.id` = `superhero.publisher_id` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` WHERE `attribute.attribute_name` = 'Speed' ORDER BY `hero_attribute.attribute_value` ASC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'	superhero
SELECT `publisher_name` FROM `publisher` JOIN `superhero` ON `publisher.id` = `superhero.publisher_id` WHERE `superhero.superhero_name` = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond';	superhero
SELECT `superhero_name` FROM `superhero` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` WHERE `attribute_name` = 'Intelligence' ORDER BY `attribute_value` ASC LIMIT 1;	superhero
SELECT T2.race FROM `superhero` AS T1 INNER JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch'	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN gender ON superhero.gender_id = gender.id  WHERE gender.gender = 'Female' AND attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100;	superhero
SELECT superhero_name  FROM superhero  WHERE id IN (     SELECT hero_id      FROM hero_power      GROUP BY hero_id      HAVING COUNT(*) = (         SELECT MAX(power_count)          FROM (             SELECT COUNT(*) AS power_count              FROM hero_power              GROUP BY hero_id         ) AS subquery     ) );	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Vampire'	superhero
SELECT      CAST(COUNT(CASE WHEN T.superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') THEN T.superhero.id ELSE NULL END) AS REAL) * 100 / COUNT(T.superhero.id) AS percentage,     COUNT(CASE WHEN T.superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') THEN T.superhero.id ELSE NULL END) AS count_of_bad_alignment_superheroes,     (SELECT COUNT(*) FROM publisher WHERE publisher_name = 'Marvel Comics') AS total_marvel_superheroes FROM      superhero AS T JOIN      alignment ON T.superhero.alignment_id = alignment.id JOIN      publisher ON T.superhero.publisher_id = publisher.id WHERE      T.superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')     AND publisher.id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT ABS((SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics') - (SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics')) AS difference;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON sh.id = hp.hero_id WHERE sh.superhero_name = 'Deathlok';	superhero
SELECT AVG(T2.weight_kg) FROM `gender` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.gender_id WHERE T1.gender = 'Female'	superhero
SELECT sp.power_name FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id JOIN gender g ON s.gender_id = g.id JOIN superpower sp ON hp.power_id = sp.id WHERE g.gender = 'Male' GROUP BY sp.power_name LIMIT 5;	superhero
SELECT s.superhero_name FROM `superhero` s JOIN `race` r ON s.race_id = r.id WHERE r.race = 'Alien'	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'No Colour');	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56;	superhero
SELECT `full_name` FROM `superhero` JOIN `race` ON `superhero.race_id` = `race.id` WHERE `race.race` = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')	superhero
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.weight_kg = 169	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE r.race = 'human' AND s.height_cm = 185;	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)	superhero
SELECT CAST(SUM(CASE WHEN s.publisher_id = p.id THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.height_cm BETWEEN 150 AND 180  AND p.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name  FROM superhero  WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id GROUP BY power_name ORDER BY COUNT(*) DESC LIMIT 1;	superhero
SELECT `attribute_value` FROM `hero_attribute` WHERE `hero_id` IN (SELECT `id` FROM `superhero` WHERE `superhero_name` = 'Abomination');	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'stealth');	superhero
SELECT s.full_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(1) AS average FROM superhero s LEFT JOIN colour c ON s.skin_colour_id = c.id WHERE c.id IS NULL	superhero
SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics';	superhero
SELECT `superhero_name` FROM `superhero` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` JOIN `publisher` ON `superhero.publisher_id` = `publisher.id` WHERE `attribute.name` = 'Durability' AND `publisher.publisher_name` = 'Dark Horse Comics' ORDER BY `hero_attribute.attribute_value` DESC LIMIT 1;	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.full_name = 'Abraham Sapien'	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight'	superhero
SELECT c.eye_colour_id AS eyes, c.hair_colour_id AS hair, c.skin_colour_id AS skin FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.eye_colour_id = c.id OR s.hair_colour_id = c.id OR s.skin_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id;	superhero
SELECT T2.race FROM `superhero` AS T1 INNER JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb';	superhero
SELECT      (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.gender)) AS percentage_blue_female FROM      superhero s JOIN      colour c ON s.skin_colour_id = c.id JOIN      gender g ON s.gender_id = g.id WHERE      g.gender = 'Female'	superhero
SELECT superhero.superhero_name, race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.full_name = 'Charles Chandler';	superhero
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation'	superhero
SELECT COUNT(*) FROM hero_power WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Amazo');	superhero
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE full_name = 'Hunter Zolomon'))	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber'	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Black' AND c2.colour = 'Black'	superhero
SELECT DISTINCT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  WHERE c.colour = 'Gold'	superhero
SELECT `full_name` FROM `superhero` JOIN `race` ON `superhero.race_id` = `race.id` WHERE `race.race` = 'Vampire';	superhero
SELECT superhero.superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'	superhero
SELECT COUNT(*)  FROM hero_attribute  WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'))	superhero
SELECT `race.race`, `alignment.alignment` FROM `superhero` JOIN `race` ON `superhero.race_id` = `race.id` JOIN `alignment` ON `superhero.alignment_id` = `alignment.id` WHERE `superhero.superhero_name` = 'Cameron Hicks';	superhero
SELECT      CAST(SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' AND T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 END)  FROM      publisher AS T1  JOIN      superhero AS T2  ON      T1.id = T2.publisher_id  JOIN      gender AS T3  ON      T2.gender_id = T3.id  WHERE      T1.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(T2.weight_kg)  FROM `race` AS T1  JOIN `superhero` AS T2 ON T1.id = T2.race_id  WHERE T1.race = 'Alien'	superhero
SELECT ABS((SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler'))	superhero
SELECT id, AVG(height_cm) AS average_height FROM superhero GROUP BY id;	superhero
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Abomination'))	superhero
SELECT COUNT(*)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN race ON superhero.race_id = race.id  WHERE race.id = 21 AND gender.id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, h.attribute_value FROM attribute a JOIN hero_attribute ha ON a.id = ha.attribute_id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Brown'	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.id = 7;	superhero
SELECT      (SUM(CASE WHEN g.gender = 'Male' THEN 1 ELSE 0 END) / CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL)) AS ratio FROM      gender g JOIN      superhero s ON g.id = s.gender_id;	superhero
SELECT superhero_name FROM `superhero` WHERE height_cm = (SELECT MAX(height_cm) FROM `superhero`);	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT `full_name` FROM `superhero` WHERE `weight_kg` IS NULL OR `weight_kg` = 0;	superhero
SELECT colour.colour FROM colour JOIN superhero ON colour.id = superhero.eye_colour_id WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.full_name = 'Helen Parr';	superhero
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.id = 38;	superhero
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT sp.power_name FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT superhero_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'  LIMIT 5;	superhero
SELECT AVG(T3.attribute_value)  FROM alignment AS T1  JOIN superhero AS T2 ON T1.id = T2.alignment_id  JOIN hero_attribute AS T3 ON T2.id = T3.hero_id  WHERE T1.alignment = 'Neutral'	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.skin_colour_id JOIN hero_attribute h ON s.id = h.hero_id WHERE h.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.id = 1 AND gender.id = 2;	superhero
SELECT `superhero_name` FROM `superhero` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` WHERE `attribute_value` BETWEEN 75 AND 80;	superhero
SELECT race.race FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN colour ON superhero.hair_colour_id = colour.id JOIN race ON superhero.race_id = race.id WHERE gender.gender = 'Male' AND colour.colour = 'Blue';	superhero
SELECT      CAST(SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.alignment) FROM      superhero AS T1 JOIN      alignment AS T2 ON T1.alignment_id = T2.id JOIN      gender AS T3 ON T1.gender_id = T3.id WHERE      T2.alignment = 'Bad'	superhero
SELECT      (         (             SELECT COUNT(*) FROM superhero s             JOIN colour c ON s.eye_colour_id = c.id             WHERE s.weight_kg IS NULL OR s.weight_kg = 0             AND c.id = 7         ) -          (             SELECT COUNT(*) FROM superhero s             JOIN colour c ON s.eye_colour_id = c.id             WHERE s.weight_kg IS NULL OR s.weight_kg = 0             AND c.id = 1         )     ) AS difference;	superhero
SELECT `attribute_value` FROM `hero_attribute` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` JOIN `superhero` ON `hero_attribute.hero_id` = `superhero.id` WHERE `superhero.superhero_name` = 'Hulk' AND `attribute.attribute_name` = 'Strength';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON sh.id = hp.hero_id WHERE sh.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.superhero_name ASC;	superhero
SELECT T1.gender FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN hero_power AS T3 ON T2.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(T.superhero.height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN race ON superhero.race_id = race.id  WHERE publisher.publisher_name = 'Dark Horse Comics' AND race.race <> 'Human'	superhero
SELECT COUNT(*) FROM hero_attribute h JOIN attribute a ON h.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND h.attribute_value = 100;	superhero
SELECT ABS((SELECT COUNT(*) FROM publisher WHERE publisher_name = 'DC Comics') - (SELECT COUNT(*) FROM publisher WHERE publisher_name = 'Marvel Comics')) AS superhero_difference;	superhero
SELECT attribute.attribute_name FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM `superhero` WHERE height_cm = (SELECT MAX(height_cm) FROM `superhero`);	superhero
SELECT `superhero_name` FROM `superhero` WHERE `full_name` = 'Charles Chandler';	superhero
SELECT      CAST(SUM(CASE WHEN `gender` = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      `superhero`  JOIN      `publisher` ON `superhero`.`publisher_id` = `publisher`.`id` WHERE      `publisher`.`publisher_name` = 'George Lucas'	superhero
SELECT      (SUM(CASE WHEN alignment_id = (SELECT id FROM alignment WHERE alignment = 'Good') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE 0 END)      / COUNT(CASE WHEN publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE 0 END)) * 100 AS 'PercentageOfGoodSuperheroes' FROM superhero;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM `hero_attribute` WHERE `attribute_value` = (SELECT MIN(`attribute_value`) FROM `hero_attribute`);	superhero
SELECT full_name FROM `superhero` WHERE superhero_name = 'Alien';	superhero
SELECT t2.full_name FROM superhero AS t2 JOIN colour AS t1 ON t2.eye_colour_id = t1.id WHERE t2.weight_kg < 100 AND t1.colour = 'Brown'	superhero
SELECT hero_attribute.attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Aquababy';	superhero
SELECT `superhero`.weight_kg, `race`.race  FROM `superhero`  JOIN `race` ON `superhero`.race_id = `race`.id  WHERE `superhero`.id = 40;	superhero
SELECT AVG(T2.height_cm) FROM `alignment` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.alignment_id WHERE T1.alignment = 'Neutral'	superhero
SELECT hero_id FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Intelligence');	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT T2.driverRef FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 20 AND T1.q1 IS NOT NULL ORDER BY T1.q1 LIMIT 5	formula_1
SELECT drivers.surname  FROM qualifying  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE raceId = 19 AND q2 IS NOT NULL AND q2 != ''  ORDER BY q2  LIMIT 1 OFFSET 1;	formula_1
SELECT T2.year FROM `circuits` AS T1 JOIN `races` AS T2 ON T1.circuitId = T2.circuitId WHERE T1.location = 'Shanghai';	formula_1
SELECT circuits.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.name = 'Circuit de Barcelona-Catalunya' AND races.url IS NOT NULL;	formula_1
SELECT `name` FROM `races` WHERE `circuitId` IN (SELECT `circuitId` FROM `circuits` WHERE `country` = 'Germany');	formula_1
SELECT `position` FROM `constructorStandings` WHERE `constructorId` IN (SELECT `constructorId` FROM `constructors` WHERE `name` = 'Renault')	formula_1
SELECT COUNT(*)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2010  AND c.country NOT IN ('Asia', 'Europe')  AND r.raceId IN (     SELECT raceId      FROM results      WHERE position < 11 -- Assuming 10th place or better is considered a Grand Prix )	formula_1
SELECT T2.name FROM `circuits` AS T1 JOIN `races` AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Spain'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Australian Grand Prix';	formula_1
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT T1.nationality FROM constructors AS T1 JOIN constructorresults AS T2 ON T1.constructorid = T2.constructorid WHERE T2.points = 1 AND T2.raceid = 24;	formula_1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna')	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q2 = '0:01:40' AND T2.raceId = 355	formula_1
SELECT T2.number FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.q3 LIKE '0:01:54%' AND T1.raceId = 903	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NOT NULL;	formula_1
SELECT `seasons`.year FROM `seasons` JOIN `races` ON `seasons`.year = `races`.year WHERE `races`.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId FROM races WHERE date = '2015-11-29' );	formula_1
SELECT T1.surname AS oldest_driver_surname, T1.forename AS oldest_driver_forename FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.url FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.raceId = 161 AND l.time LIKE '0:01:27%'	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933)	formula_1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Malaysian Grand Prix'	formula_1
SELECT T1.url FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 AND T2.points = (SELECT MAX(points) FROM constructorResults WHERE raceId = 9)	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceId = 345;	formula_1
SELECT T2.nationality  FROM qualifying AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T1.raceId = 347 AND T1.q2 = '01:15'	formula_1
SELECT T1.code  FROM drivers AS T1  JOIN qualifying AS T2 ON T1.driverId = T2.driverId  WHERE T2.raceId = 45 AND T2.q3 LIKE 'M:SS%'	formula_1
SELECT `results`.`time`  FROM `drivers`  JOIN `results` ON `drivers`.`driverId` = `results`.`driverId`  WHERE `drivers`.`forename` = 'Bruce' AND `drivers`.`surname` = 'McLaren' AND `results`.`raceId` = 743;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2006 AND ra.name = 'San Marino Grand Prix' AND r.position = 2;	formula_1
SELECT `url` FROM `seasons` JOIN `races` ON `seasons`.year = `races`.year WHERE `races`.raceId = 901;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId IN (     SELECT r.raceId      FROM races r      WHERE r.date = '2015-11-29' ) AND statusId != 1	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename || ' ' || d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId = 348 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT      CAST((AVG(CASE WHEN raceId = 853 THEN fastestLapSpeed END) - AVG(CASE WHEN raceId = 854 THEN fastestLapSpeed END)) * 100 AS REAL) / AVG(CASE WHEN raceId = 853 THEN fastestLapSpeed END) * 100 FROM      results;	formula_1
SELECT      COUNT(CASE WHEN results.time IS NOT NULL THEN 1 END) * 1.0 / COUNT(*) AS completion_rate FROM      results JOIN      races ON results.raceId = races.raceId WHERE      DATE(races.date) = '1983-07-16';	formula_1
SELECT `year` FROM `races` WHERE `name` = 'Singapore Grand Prix' ORDER BY `year` LIMIT 1;	formula_1
SELECT COUNT(*) AS race_count, name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT name FROM races WHERE year = (SELECT MIN(year) FROM races) AND month = (SELECT MIN(month) FROM (SELECT DATE_PART('month', date) AS month FROM races WHERE year = (SELECT MIN(year) FROM races)));	formula_1
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);	formula_1
SELECT `year` FROM `races` GROUP BY `year` ORDER BY COUNT(`round`) DESC LIMIT 1;	formula_1
SELECT `name` FROM `races` WHERE `year` = 2017 AND NOT EXISTS (     SELECT 1     FROM `races` AS r2     WHERE r2.year = 2000 AND r2.name = `races`.name )	formula_1
SELECT T2.name AS Circuit, T2.location AS Location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = (SELECT MIN(year) FROM races) AND T2.country = 'Europe' LIMIT 1;	formula_1
SELECT MAX(`year`) FROM `races` WHERE `name` = 'British Grand Prix' AND `circuitId` IN (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Brands Hatch');	formula_1
SELECT COUNT(*)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone International Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, s.position FROM drivers d JOIN driverStandings s ON d.driverId = s.driverId JOIN races r ON s.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2010 ORDER BY s.position;	formula_1
SELECT d.forename, d.surname, MAX(ds.points) FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId;	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driver_standings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT D.forename, D.surname, R.name, MIN(LT.milliseconds)  FROM drivers D  JOIN lapTimes LT ON D.driverId = LT.driverId  JOIN races R ON LT.raceId = R.raceId  GROUP BY D.driverId, R.raceId  ORDER BY MIN(LT.milliseconds) ASC  LIMIT 1;	formula_1
SELECT AVG(T3milliseconds)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN drivers ON lapTimes.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix'	formula_1
SELECT      COUNT(DISTINCT ds.raceId) * 100.0 / (         SELECT              COUNT(DISTINCT ds.raceId)          FROM              driverStandings AS ds          WHERE              ds.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton') AND              ds.year >= 2010 AND              ds.position > 1     ) AS percentage_not_first_track_since_2010 FROM      driverStandings AS ds WHERE      ds.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton') AND      ds.year >= 2010 AND      ds.position > 1;	formula_1
SELECT      drivers.forename,      drivers.surname,      drivers.nationality,      MAX(SUM(results.points)) AS max_points FROM      drivers  JOIN      results ON drivers.driverId = results.driverId GROUP BY      drivers.driverId, drivers.forename, drivers.surname, drivers.nationality HAVING      COUNT(results.wins) = (         SELECT              MAX(win_count)          FROM              (                 SELECT                      COUNT(wins) AS win_count                  FROM                      results                  GROUP BY                      driverId              ) AS subquery     )	formula_1
SELECT      `forename`,      `surname`  FROM      `drivers`  WHERE      `nationality` = 'Japanese'  ORDER BY      `dob` DESC  LIMIT 1;	formula_1
SELECT DISTINCT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY c.circuitId, c.name HAVING COUNT(r.raceId) >= 4;	formula_1
SELECT T2.name AS CircuitName, T2.location AS CircuitLocation, T1.name AS RaceName FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2006 AND T2.country = 'USA';	formula_1
SELECT R.name AS RaceName, C.name AS CircuitName, C.location AS CircuitLocation FROM races R JOIN circuits C ON R.circuitId = C.circuitId WHERE MONTH(R.date) = 9 AND YEAR(R.date) = 2005;	formula_1
SELECT r.name  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20	formula_1
SELECT COUNT(*)  FROM drivers d JOIN driver_standings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit'	formula_1
SELECT races.name, races.year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' ORDER BY lapTimes.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(driverStandings.points)  FROM driverStandings  JOIN races ON driverStandings.raceId = races.raceId  JOIN seasons ON races.year = seasons.year  JOIN drivers ON driverStandings.driverId = drivers.driverId  WHERE drivers.forename = 'Eddie' AND drivers.surname = 'Irvine' AND seasons.year = 2000;	formula_1
SELECT MIN(r.year), ds.points FROM races r JOIN driver_standings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name AS RaceName, s.year AS Year, c.location AS CircuitLocation FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN (     SELECT raceId, COUNT(*) AS LapCount     FROM lapTimes     GROUP BY raceId     ORDER BY LapCount DESC     LIMIT 1 ) lt ON r.raceId = lt.raceId ORDER BY r.year DESC;	formula_1
SELECT      COUNT(*) FILTER (WHERE country = 'Germany' AND name LIKE 'European Grand Prix') * 100.0 / COUNT(*) AS percentage FROM      races WHERE      name LIKE 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name FROM circuits WHERE lat > (SELECT MAX(lat) FROM circuits WHERE name IN('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')) LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT `country` FROM circuits WHERE `alt` = (SELECT MAX(`alt`) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality, MIN(dob) AS oldest_date FROM drivers GROUP BY nationality ORDER BY oldest_date DESC LIMIT 1;	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT `driverRef` FROM `drivers` WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton';	formula_1
SELECT `circuits`.`name` FROM `circuits` JOIN `races` ON `circuits`.`circuitId` = `races`.`circuitId` WHERE `races`.`name` = 'Spanish Grand Prix' AND `races`.`year` = 2009;	formula_1
SELECT DISTINCT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit';	formula_1
SELECT circuits.url AS circuit_url, races.url AS race_url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT `time` FROM `races` WHERE `year` BETWEEN 2010 AND 2019 AND `circuitId` = (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Abu Dhabi Circuit')	formula_1
SELECT COUNT(*) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy'	formula_1
SELECT date FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya')	formula_1
SELECT circuits.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT MIN(T2.fastestLapTime) FROM `drivers` AS T1 JOIN `results` AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT `forename`, `surname` FROM `drivers` WHERE `driverId` IN (     SELECT `driverId` FROM `results` ORDER BY `fastestLapSpeed` DESC LIMIT 1 )	formula_1
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Canadian Grand Prix' AND results.position = 1;	formula_1
SELECT DISTINCT r.name FROM results AS res JOIN drivers AS d ON res.driverId = d.driverId JOIN races AS r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT T3.name FROM drivers JOIN results AS T1 ON drivers.driverId = T1.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY T1.rank ASC LIMIT 1;	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT T2.year FROM drivers AS T1 JOIN results AS T3 ON T1.driverId = T3.driverId JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT positionOrder  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix';	formula_1
SELECT forename, surname  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.year = 1989 AND races.name LIKE 'Australian Grand Prix' AND results.grid = 4;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' AND time IS NOT NULL) AND time IS NOT NULL;	formula_1
SELECT results.fastestLap FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Australian Grand Prix' AND races.year = 2008;	formula_1
SELECT time FROM results WHERE position = 2 AND name = 'Chinese Grand Prix' AND SUBSTR(year, 1, 4) = '2008';	formula_1
SELECT d.forename, d.surname, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.time LIKE '%:%:%.%' LIMIT 1;	formula_1
SELECT COUNT(*)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races rs ON r.raceId = rs.raceId  WHERE d.nationality = 'British' AND rs.year = 2008 AND rs.name = 'Australian Grand Prix'	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE year = 2008 AND name = 'Chinese Grand Prix' ) AND time IS NOT NULL	formula_1
SELECT SUM(T2.points)  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT AVG(STR_TO_DATE(SUBSTRING_INDEX(`fastestLapTime`, ':', -1), '%M:%S.%m')) AS average_fastest_lap_time FROM `results` JOIN `drivers` ON `results`.`driverId` = `drivers`.`driverId` WHERE `drivers`.`forename` = 'Hamilton' AND `drivers`.`surname` = 'Lewis';	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.raceId)  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'	formula_1
SELECT      CAST((CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`results.time`, ':', -1), '.', 1) AS REAL) * 60 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`results.time`, ':', 2), ':', -1) AS REAL)) AS REAL) * 60 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`results.time`, ':', 1), ':', -1) AS REAL) -      CAST((CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`champion_results.time`, ':', -1), '.', 1) AS REAL) * 60 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`champion_results.time`, ':', 2), ':', -1) AS REAL)) AS REAL) * 60 - CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`champion_results.time`, ':', 1), ':', -1) AS REAL) AS percentage_faster,     `results.time`,     `champion_results.time` FROM     (         SELECT `results`.*, `races`.`year` FROM `results` JOIN `races` ON `results`.`raceId` = `races`.`raceId` WHERE `races`.`year` = 2008 AND `races`.`name` = 'Australian Grand Prix' AND `results`.`positionOrder` = 1     ) AS champion_results JOIN     (         SELECT `results`.*, `races`.`year` FROM `results` JOIN `races` ON `results`.`raceId` = `races`.`raceId` WHERE `races`.`year` = 2008 AND `races`.`name` = 'Australian Grand Prix' AND `results`.`positionOrder` > 1 ORDER BY `results`.`positionOrder` ASC LIMIT 1     ) AS last_driver_results WHERE     champion_results.time IS NOT NULL AND last_driver_results.time IS NOT NULL;	formula_1
SELECT COUNT(*)  FROM circuits  WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-12-31'	formula_1
SELECT MAX(T.points)  FROM constructors AS T  JOIN constructorResults AS C ON T.constructorId = C.constructorId  WHERE T.nationality = 'British'	formula_1
SELECT name FROM constructors WHERE constructorId = (     SELECT constructorId FROM constructorStandings ORDER BY points DESC LIMIT 1 )	formula_1
SELECT c.name FROM constructors c JOIN constructor_standings cs ON c.constructorId = cs.constructorId WHERE cs.points = 0 AND cs.raceId = 291;	formula_1
SELECT COUNT(*)  FROM constructors  JOIN constructor_standings ON constructors.constructorId = constructor_standings.constructorId  WHERE constructors.nationality = 'Japanese' AND constructor_standings.points = 0 AND raceId IN (     SELECT raceId FROM constructor_standings GROUP BY raceId HAVING COUNT(raceId) = 2 )	formula_1
SELECT c.name FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE r.rank = 1;	formula_1
SELECT COUNT(*)  FROM constructors c  JOIN results r ON c.constructorId = r.constructorId  WHERE c.nationality = 'French' AND r.laps > 50;	formula_1
SELECT      COUNT(CASE WHEN T3.time IS NOT NULL AND T2.year BETWEEN 2007 AND 2009 THEN T1.driverId END) * 100.0 / COUNT(T1.driverId) AS race_completion_percentage FROM      drivers AS T1 JOIN      races AS T2 ON T1.driverId = T2.raceId JOIN      results AS T3 ON T2.raceId = T3.raceId WHERE      T1.nationality = 'Japanese'	formula_1
SELECT      T1.year,     AVG(SUBSTR(T1.time, 1, INSTR(T1.time, '.') - 1)) AS average_time_seconds FROM      seasons AS T1 JOIN      results AS T2 ON T1.year = T2.year WHERE      T1.year < 1975 AND T2.statusId = 1 GROUP BY      T1.year;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob > '1975-12-31' AND T2.rank = 2;	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND NOT EXISTS (SELECT 1 FROM results WHERE drivers.driverId = results.driverId AND time IS NOT NULL);	formula_1
SELECT `forename`, `surname` FROM `drivers` JOIN `results` ON `drivers.driverId` = `results.driverId` WHERE `fastestLapTime` = (SELECT MIN(`fastestLapTime`) FROM `results`);	formula_1
SELECT T1.fastestLap  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T2.year = 2009  AND T1.time = (SELECT MIN(time) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009))	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM `races` AS T1 JOIN `results` AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'	formula_1
SELECT T1.name, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1;	formula_1
SELECT      CAST(SUM(CASE WHEN T1.dob < '1985-01-01' AND T3.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.driverId)  FROM      drivers AS T1 JOIN      results AS T3 ON T1.driverId = T3.driverId JOIN      races AS T2 ON T3.raceId = T2.raceId WHERE      T2.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(*) FROM drivers d LEFT JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.time < 120	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM driverStandings WHERE raceId = 18;	formula_1
SELECT COUNT(*)  FROM (     SELECT nationality      FROM drivers      WHERE nationality = 'Dutch' OR nationality = 'Netherlands' ) AS dutch_drivers  WHERE dob IS NOT NULL  AND EXISTS (     SELECT 1      FROM (         SELECT MAX(YEAR(dob)) AS max_age          FROM drivers          GROUP BY nationality          ORDER BY MAX(YEAR(dob)) DESC          LIMIT 3     ) AS top_3_youngest      WHERE drivers.nationality = top_3_youngest.max_age AND drivers.dob <= top_3_youngest.max_age )	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND SUBSTR(dob, 1, 4) = '1980';	formula_1
SELECT d.driverId, d.nationality, d.dob, MIN(ps.time) AS earliest_lap_time FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY d.driverId, d.nationality, d.dob ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.dob LIKE '1971-%' AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT d.driverId, d.nationality, d.dob, MAX(ps.time) AS latest_lap_time FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'Spanish' AND YEAR(d.dob) < 1982 GROUP BY d.driverId, d.nationality, d.dob ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime LIMIT 1	formula_1
SELECT T1.year FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T2.time = (SELECT MAX(time) FROM lapTimes)	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId BETWEEN 50 AND 100  AND statusId = 2  AND time IS NOT NULL	formula_1
SELECT `location`, (lat, lng) FROM `circuits` WHERE `country` = 'Austria';	formula_1
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL	formula_1
SELECT      DATEDIFF(YEAR, drivers.dob, races.date) AS age,     drivers.forename,     races.date,     races.time FROM      drivers JOIN      results ON drivers.driverId = results.driverId JOIN      races ON results.raceId = races.raceId WHERE      results.position IS NULL ORDER BY      age ASC LIMIT 1;	formula_1
SELECT COUNT(*) FROM results WHERE statusId = (SELECT statusId FROM status WHERE status = 'Puncture') AND nationality = 'American';	formula_1
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.wins = (SELECT MAX(wins) FROM constructorStandings)	formula_1
SELECT driverId, MAX(time) AS slowest_time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId WHERE races.name = 'French Grand Prix' AND lap = 3 LIMIT 1;	formula_1
SELECT T1.time, T2.milliseconds FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T2.lap = 1 ORDER BY T2.time LIMIT 1	formula_1
SELECT AVG(T2.fastestLapTime)  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.year = 2006 AND T1.name = 'United States Grand Prix' AND T2.rank < 11;	formula_1
SELECT      d.forename,      d.surname  FROM      drivers d  JOIN      pit_stops ps ON d.driverId = ps.driverId  WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1985-12-31'  GROUP BY      d.driverId  ORDER BY      AVG(ps.duration) ASC  LIMIT 3;	formula_1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Canadian Grand Prix' AND T2.year = 2008 LIMIT 1	formula_1
SELECT T1.constructorRef, T1.url FROM constructors AS T1 JOIN (     SELECT raceId, constructorId, MIN(time) AS maxTime FROM results WHERE raceId IN (         SELECT raceId FROM races WHERE year = 2009 AND name = 'Singapore Grand Prix'     ) GROUP BY constructorId ORDER BY SUM(time) ASC LIMIT 1 ) AS T2 ON T1.constructorId = T2.constructorId WHERE T2.maxTime = (SELECT MAX(time) FROM results WHERE raceId IN (     SELECT raceId FROM races WHERE year = 2009 AND name = 'Singapore Grand Prix' ))	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND year(dob) BETWEEN 1981 AND 1991;	formula_1
SELECT forename + ' ' + surname AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC;	formula_1
SELECT `country`, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT cr.points, c.name, c.nationality FROM constructors c JOIN constructor_results cr ON c.constructorId = cr.constructorId JOIN races r ON cr.race_id = r.race_id WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT AVG(driverStandings.points)  FROM driverStandings  JOIN races ON driverStandings.raceId = races.raceId  JOIN drivers ON driverStandings.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix';	formula_1
SELECT AVG(year) AS AverageAnnualRaces FROM (     SELECT year     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31'     GROUP BY year ) AS race_years;	formula_1
SELECT `nationality` FROM `drivers` GROUP BY `nationality` ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT wins FROM driverStandings WHERE points = 91.0;	formula_1
SELECT r.name  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT circuits.location, circuits.country FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.date = (SELECT MAX(date) FROM races)	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.driverId = r.driverId AND r.year = 2008 AND r.circuitId = (     SELECT c.circuitId FROM circuits c WHERE c.name = 'Marina Bay Street Circuit' ) WHERE q.q3 = (SELECT MIN(q3) FROM qualifying WHERE driverId IN (SELECT driverId FROM races WHERE year = 2008 AND circuitId = (     SELECT c.circuitId FROM circuits c WHERE c.name = 'Marina Bay Street Circuit' )) LIMIT 1 OFFSET 2)	formula_1
SELECT      d.forename || ' ' || d.surname AS full_name,     d.nationality,     r.name AS race_name FROM      drivers d JOIN      (         SELECT              driverId, MIN(dob) AS min_dob         FROM              drivers         GROUP BY              driverId     ) AS youngest_drivers ON d.driverId = youngest_drivers.driverId AND d.dob = youngest_drivers.min_dob JOIN      races r ON r.raceId = (         SELECT              raceId         FROM              driverStandings         WHERE              driverId = d.driverId         ORDER BY              raceId ASC         LIMIT 1     ) ORDER BY      d.dob DESC LIMIT 1;	formula_1
SELECT COUNT(*)  FROM results r JOIN races r2 ON r.raceId = r2.raceId JOIN status s ON r.statusId = s.statusId WHERE s.status = 'Accident' AND r2.name = 'Canadian Grand Prix' AND r.driverId IN (     SELECT r.driverId      FROM results r     JOIN races r2 ON r.raceId = r2.raceId     JOIN status s ON r.statusId = s.statusId     WHERE r2.name = 'Canadian Grand Prix'     GROUP BY r.driverId     ORDER BY COUNT(*) DESC     LIMIT 1 )	formula_1
SELECT d.forename, d.surname, COUNT(ds.wins) AS total_wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId;	formula_1
SELECT MAX(`duration`) FROM `pitStops`;	formula_1
SELECT MIN(time) FROM lapTimes;	formula_1
SELECT MAX(`duration`) FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton')	formula_1
SELECT pitStops.lap FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN drivers ON pitStops.driverId = drivers.driverId WHERE races.name = 'Australian Grand Prix' AND races.year = 2011 AND drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT `duration` FROM `pitStops` JOIN `races` ON `pitStops`.`raceId` = `races`.`raceId` WHERE `races`.`year` = 2011 AND `races`.`name` = 'Australian Grand Prix';	formula_1
SELECT `time` FROM `lapTimes` JOIN `drivers` ON `lapTimes`.`driverId` = `drivers`.`driverId` WHERE `drivers`.`forename` = 'Lewis' AND `drivers`.`surname` = 'Hamilton' ORDER BY `time` ASC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE results.fastestLapTime LIKE 'MM:%' OR results.fastestLapTime LIKE 'M:%.%'  ORDER BY CAST(SUBSTR(results.fastestLapTime, 1, INSTR(results.fastestLapTime, ':') - 1) AS INTEGER) * 60 + CAST(SUBSTR(results.fastestLapTime, INSTR(results.fastestLapTime, ':') + 1) AS INTEGER)  LIMIT 20;	formula_1
SELECT `position` FROM `lapTimes` JOIN `drivers` ON `lapTimes`.`driverId` = `drivers`.`driverId` WHERE `drivers`.`forename` = 'Lewis' AND `drivers`.`surname` = 'Hamilton' ORDER BY `time` ASC LIMIT 1;	formula_1
SELECT T1.fastestLapTime FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.name = 'Austrian Grand Prix'	formula_1
SELECT T1.country, MIN(T2.time) AS lap_record FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Italy' GROUP BY T1.country;	formula_1
SELECT r.name  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Austrian Grand Prix' AND r.raceId IN (     SELECT raceId      FROM results      WHERE time = (         SELECT MIN(time)          FROM results          WHERE raceId = r.raceId     ) )	formula_1
SELECT T3.duration FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId JOIN pitStops AS T3 ON T1.raceId = T3.raceId WHERE T2.name = 'Austrian Grand Prix' AND T3.driverId = <DriverID>	formula_1
SELECT `circuits`.`lat`, `circuits`.`lng` FROM `circuits` JOIN `races` ON `circuits`.`circuitId` = `races`.`circuitId` JOIN `lapTimes` ON `races`.`raceId` = `lapTimes`.`raceId` WHERE `lapTimes`.`time` = '1:29.488'	formula_1
SELECT AVG(T2.milliseconds)  FROM `drivers` AS T1  JOIN `pitStops` AS T2 ON T1.driverId = T2.driverId  WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT AVG(T3.milliseconds)  FROM `races` AS T1  JOIN `circuits` AS T2 ON T1.circuitId = T2.circuitId  JOIN `lapTimes` AS T3 ON T1.raceId = T3.raceId  WHERE T2.country = 'Italy'	formula_1
SELECT `player_api_id` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`);	european_football_2
SELECT `player_name`, `height` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`)	european_football_2
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`);	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating BETWEEN 60 AND 65  AND defensive_work_rate = 'low'	european_football_2
SELECT id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT league.name  FROM Match  JOIN Team ON Match.home_team_api_id = Team.team_api_id OR Match.away_team_api_id = Team.team_api_id  JOIN League ON League.id = Match.league_id  WHERE Match.season LIKE '2015/2016%'  GROUP BY League.id  ORDER BY SUM(home_team_goal + away_team_goal) DESC  LIMIT 1;	european_football_2
SELECT home_team FROM matches WHERE season = '2015/2016' GROUP BY home_team ORDER BY SUM(CASE WHEN home_team_goal > away_team_goal THEN 1 ELSE 0 END) ASC LIMIT 1;	european_football_2
SELECT player_name  FROM players  ORDER BY penalties DESC  LIMIT 10;	european_football_2
SELECT Team.team_long_name FROM Team JOIN Match ON Team.team_api_id = Match.away_team_api_id JOIN League ON Match.league_id = League.league_id WHERE League.name = 'Scotland Premier League' AND Match.season = '2009/2010' GROUP BY Team.team_long_name HAVING COUNT(CASE WHEN away_team_goal > home_team_goal THEN 1 END) = MAX(     SELECT COUNT(*)      FROM Match      JOIN Team ON Match.away_team_api_id = Team.team_api_id      WHERE League.name = 'Scotland Premier League' AND Match.season = '2009/2010' AND away_team_goal > home_team_goal )	european_football_2
SELECT      teamName,     buildUpPlaySpeed FROM      teamStats ORDER BY      buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT l.name FROM League AS l JOIN Match AS m ON l.id = m.league_id WHERE m.season = '2015/2016' AND m.home_team_goal = m.away_team_goal GROUP BY l.name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT * FROM Player WHERE strftime('%Y', datetime('now')) - strftime('%Y', birthday) >= 18 AND strftime('%Y', datetime('now')) - strftime('%Y', birthday) <= 26 AND (SELECT sprint_speed FROM other_table WHERE Player.player_id = other_table.player_id) >= 97 AND strftime('%Y', datetime('now')) BETWEEN '2013' AND '2015';	european_football_2
SELECT league_name, COUNT(*) AS total_matches FROM matches GROUP BY league_id, league_name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes) AND SUBSTR(date, 1, 4) = '2010'	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT team_long_name FROM (     SELECT team_long_name, SUM(buildUpPlayPassing) / COUNT(*) AS avg_buildUpPlayPassing     FROM table_name     WHERE buildUpPlayPassing IS NOT NULL     GROUP BY team_long_name ) AS subquery WHERE subquery.avg_buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM table_name WHERE buildUpPlayPassing IS NOT NULL) AND strftime('%Y', date) = '2012'	european_football_2
SELECT      (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0 / COUNT(player_fifa_api_id)) AS percentage_left_foot_players FROM      players_table WHERE      YEAR(birthday) BETWEEN 1987 AND 1992;	european_football_2
SELECT league, SUM(home_team_goal + away_team_goal) AS total_goals FROM matches GROUP BY league ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(COUNT(long_shots))  FROM (     SELECT player_fifa_api_id, COUNT(long_shots) AS long_shot_count      FROM matches      WHERE player_fifa_api_id = (SELECT fifa_api_id FROM players WHERE name = 'Ahmed Samir Farag')     GROUP BY player_fifa_api_id ) subquery	european_football_2
SELECT TOP 10 Player.name  FROM Player  JOIN Stats ON Player.player_fifa_api_id = Stats.player_fifa_api_id  WHERE Player.height > 180  GROUP BY Player.player_fifa_api_id, Player.name  ORDER BY AVG(Stats.heading_accuracy) DESC;	european_football_2
SELECT team_long_name  FROM (     SELECT team_long_name, AVG(chanceCreationPassing) OVER () AS avg_chance_creation_passing,            chanceCreationPassing     FROM football_data     WHERE buildUpPlayDribblingClass = 'Normal'       AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' ) subquery WHERE chanceCreationPassing < avg_chance_creation_passing ORDER BY chanceCreationPassing DESC;	european_football_2
SELECT DISTINCT League.name  FROM League  JOIN Match ON League.id = Match.league_id  WHERE season = '2009/2010'  GROUP BY League.name  HAVING AVG(home_team_goal) > AVG(away_team_goal);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10';	european_football_2
SELECT attacking_work_rate  FROM players  WHERE player_name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass  FROM match_data  WHERE team_long_name = 'ADO Den Haag'  AND match_period <= 2/3;	european_football_2
SELECT      header_finishing_rate FROM      football_player_stats WHERE      player_name = 'Francois Affolter' AND      date = '2014-09-18 00:00:00';	european_football_2
SELECT AVG(rating)  FROM football_players  JOIN player_ratings ON football_players.player_id = player_ratings.player_id  WHERE strftime('%Y', player_ratings.date) = '2011'  AND football_players.name = 'Gabriel Tamas';	european_football_2
SELECT COUNT(*)  FROM matches  JOIN leagues ON matches.league_id = leagues.id  WHERE matches.season = '2015/2016' AND leagues.name = 'Scotland Premier League'	european_football_2
SELECT preferred_foot  FROM players  WHERE latest_birthday = (SELECT MIN(latest_birthday) FROM players);	european_football_2
SELECT potential FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*)  FROM players  WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT team_short_name  FROM football_teams  JOIN passing_classes ON football_teams.passing_class_id = passing_classes.id  WHERE passing_classes.chance_creation_passing_class = 'Risky';	european_football_2
SELECT defensive_work_rate  FROM football_players  WHERE name = 'David Wilson';	european_football_2
SELECT birthday  FROM players  WHERE overall_rating = (SELECT MAX(overall_rating) FROM players);	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM matches  WHERE name = 'Poland' AND season = '2010/2011';	european_football_2
SELECT AVG(TA.finishing) AS avg_finishing_rate FROM Player_Attributes TA JOIN Player P ON TA.player_api_id = P.player_api_id WHERE P.height = (SELECT MAX(height) FROM Player) UNION SELECT AVG(TA.finishing) AS avg_finishing_rate FROM Player_Attributes TA JOIN Player P ON TA.player_api_id = P.player_api_id WHERE P.height = (SELECT MIN(height) FROM Player) LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', `birthday`) > '1990';	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT player_name FROM player_table WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010'	european_football_2
SELECT potential  FROM players  WHERE name = 'Aaron Doran';	european_football_2
SELECT player_name  FROM players  WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name  FROM teams  WHERE buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM team_stats WHERE team_short_name = 'CLB';	european_football_2
SELECT team_short_name FROM team_stats WHERE buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating)  FROM (     SELECT player_id, MAX(height) AS height      FROM players      WHERE date BETWEEN '2010-01-01' AND '2015-12-31'     GROUP BY player_id ) t1  JOIN players t2 ON t1.player_id = t2.id  WHERE t1.height > 170  GROUP BY t2.id  HAVING MAX(t2.date) BETWEEN '2010-01-01' AND '2015-12-31';	european_football_2
SELECT PlayerName  FROM FootballPlayers  WHERE Height = (SELECT MIN(Height) FROM FootballPlayers)	european_football_2
SELECT Country  FROM League  WHERE Name = 'Italy Serie A';	european_football_2
SELECT team_short_name  FROM teams  WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM football_players WHERE name = 'Aaron Doran';	european_football_2
SELECT COUNT(*)  FROM matches  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT DISTINCT team_short_name  FROM matches  WHERE home_team_goal = 10;	european_football_2
SELECT player_name FROM football_players WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM football_players WHERE potential = 61);	european_football_2
SELECT      (AVG(T1.ball_control) - AVG(T2.ball_control)) AS avg_ball_control_difference FROM      (SELECT ball_control FROM players WHERE player_name = 'Abdou Diallo') AS T1,     (SELECT ball_control FROM players WHERE player_name = 'Aaron Appindangoye') AS T2;	european_football_2
SELECT `team_long_name` FROM `Team` WHERE `team_short_name` = 'GEN';	european_football_2
SELECT player_name FROM Player WHERE birthday < (SELECT birthday FROM Player WHERE player_name = 'Aaron Lennon') AND birthday > (SELECT birthday FROM Player WHERE player_name = 'Abdelaziz Barrada')	european_football_2
SELECT `player_name` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`)	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT Country FROM Leagues WHERE name = 'Belgium Jupiler League';	european_football_2
SELECT League  FROM Teams  JOIN Leagues ON Teams.league_id = Leagues.id  WHERE Leagues.country_id IN (SELECT id FROM Countries WHERE name = 'Germany');	european_football_2
SELECT PlayerName  FROM Players  WHERE overall_rating = (SELECT MAX(overall_rating) FROM Players);	european_football_2
SELECT COUNT(DISTINCT player_id) FROM players WHERE strftime('%Y', birthday) < '1986' AND defensive_work_rate = 'high';	european_football_2
SELECT MAX(crossing) AS BestCrossing FROM players WHERE name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone');	european_football_2
SELECT heading_accuracy  FROM players  WHERE name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(*)  FROM players  WHERE height > 180 AND volleys > 70;	european_football_2
SELECT player_name  FROM players  WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM matches  JOIN seasons ON matches.season_id = seasons.id  JOIN locations ON matches.location_id = locations.id  JOIN countries ON locations.country_id = countries.id  WHERE seasons.season_year IN (2008, 2009) AND countries.name = 'Belgium';	european_football_2
SELECT MAX(long_passing)  FROM players  WHERE birthday = (SELECT MIN(birthday) FROM players);	european_football_2
SELECT COUNT(*)  FROM matches  WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04'	european_football_2
SELECT league.name  FROM Match  JOIN League AS league ON Match.league_id = League.id  WHERE Match.season = '2008/2009'  GROUP BY league.name  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT AVG(overall_rating)  FROM players  WHERE strftime('%Y', birthday) < '1986';	european_football_2
SELECT      ((SELECT overall_rating FROM players WHERE player_name = 'Ariel Borysiuk') -       (SELECT overall_rating FROM players WHERE player_name = 'Paulin Puel')) /      (SELECT overall_rating FROM players WHERE player_name = 'Paulin Puel') * 100 AS percentage_difference FROM     (SELECT overall_rating FROM players WHERE player_name IN ('Ariel Borysiuk', 'Paulin Puel')) subquery;	european_football_2
SELECT AVG(buildUpPlaySpeed) AS average_build_up_play_speed FROM team_stats WHERE team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM your_table_name AS T1  WHERE T1.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(T2.crossing)  FROM players AS T1  JOIN player_stats AS T2 ON T1.player_id = T2.player_id  WHERE T1.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing) AS highest_chance_creation_passing_score, chanceCreationPassingClass  FROM your_table_name  WHERE team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot  FROM players  WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating)  FROM T2  WHERE player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal) AS average_goals FROM "Match" WHERE away_team = 'Parma' AND home_country_id IN (     SELECT id FROM Country WHERE name = 'Italy' );	european_football_2
SELECT player_name  FROM players  WHERE overall_rating = 77 AND date LIKE '2016-06-23%'  ORDER BY birthday ASC  LIMIT 1;	european_football_2
SELECT AVG(rating) AS overall_rating FROM player_ratings WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%';	european_football_2
SELECT potential  FROM players  WHERE player_name = 'Francesco Parravicini'  AND date = '2010-08-30 00:00:00';	european_football_2
SELECT attacking_work_rate FROM player_stats WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate FROM match_stats WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00';	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant') ORDER BY date LIMIT 1;	european_football_2
SELECT build_up_play_speed_class  FROM match_data  WHERE team_long_name = 'Willem II'  AND date = '2012-02-22';	european_football_2
SELECT build_up_play_dribbling_class  FROM match_data  WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00';	european_football_2
SELECT build_up_play_passing_class  FROM matches  WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%'	european_football_2
SELECT chance_creation_passing_class  FROM match_statistics  WHERE team_long_name = 'PEC Zwolle'  AND date = '2013-09-20 00:00:00';	european_football_2
SELECT crossing_class  FROM your_table_name  WHERE team_long_name = 'Hull City'  AND date = '2010-02-22 00:00:00';	european_football_2
SELECT defence_aggression_class  FROM match_data  WHERE team_long_name = 'Hannover 96'  AND date LIKE '2015-09-10%';	european_football_2
SELECT AVG(overall_rating)  FROM player_ratings  WHERE player_name = 'Marko Arnautovic'  AND DATE(date_recorded) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      ((         SELECT overall_rating FROM players WHERE player_name = 'Landon Donovan'     ) - (         SELECT overall_rating FROM players WHERE player_name = 'Jordan Bowery'     )) * 100 / (         SELECT overall_rating FROM players WHERE player_name = 'Landon Donovan'     ) AS percentage_difference;	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE DATEDIFF(CURRENT_TIMESTAMP, birthday) >= 34;	european_football_2
SELECT COUNT(*)  FROM matches  JOIN goals ON matches.match_id = goals.match_id  JOIN players ON goals.player_id = players.player_id  WHERE players.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(goal_scored)  FROM (     SELECT goal_scored      FROM match_details      WHERE player_name = 'Daan Smith' OR player_name = 'Filipe Ferreira' ) AS subquery;	european_football_2
SELECT SUM(home_team_goals)  FROM (     SELECT p.birthday, h.home_team_goals     FROM Player p     JOIN (         SELECT DISTINCT player_id, MAX(game_date) AS latest_game_date         FROM games         GROUP BY player_id     ) g ON p.player_id = g.player_id     JOIN games USING (player_id, game_date)     WHERE EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.birthday) <= 30 ) subquery;	european_football_2
SELECT player_name FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT player_name  FROM players  WHERE potential = (SELECT MAX(potential) FROM players);	european_football_2
SELECT p.player_name  FROM players p  JOIN matches m ON p.player_id = m.player_id  JOIN actions a ON m.match_id = a.match_id  WHERE a.action_type = 'attack' AND a.attacking_work_rate = 'high' GROUP BY p.player_name HAVING COUNT(*) > 0;	european_football_2
SELECT player_name  FROM players  WHERE finishing = 1  AND TIMESTAMPDIFF(SECOND, birthday, CURRENT_TIMESTAMP) = (SELECT MAX(TIMESTAMPDIFF(SECOND, birthday, CURRENT_TIMESTAMP))                                                               FROM players                                                               WHERE finishing = 1);	european_football_2
SELECT player_name  FROM players  WHERE country = 'Belgium'	european_football_2
SELECT Country  FROM Players  WHERE Vision > 89;	european_football_2
SELECT Country FROM Players GROUP BY Country ORDER BY AVG(Weight) DESC LIMIT 1;	european_football_2
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT team_short_name FROM team_stats WHERE chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(T1.height)  FROM Player AS T1  JOIN Match AS T2 ON T1.id = T2.country_id  JOIN Country AS T3 ON T2.country_id = T3.id  WHERE T3.name = 'Italy'	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND STRFTIME('%Y', birthday) > '1990'	european_football_2
SELECT ABS((SELECT jumping FROM players WHERE id = 6) - (SELECT jumping FROM players WHERE id = 23)) AS score_difference;	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)  AND preferred_foot = 'right'  ORDER BY potential  LIMIT 5	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)  AND preferred_foot = 'left';	european_football_2
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Player_Attributes WHERE stamina > 80 AND strength > 80) AS percentage FROM Player_Attributes WHERE stamina > 80 AND strength > 80	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Poland Ekstraklasa'	european_football_2
SELECT home_team_goal, away_team_goal  FROM matches  JOIN League ON matches.league_id = League.id  WHERE League.name = 'Belgium Jupiler League'  AND date LIKE '2008-09-24%';	european_football_2
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Alexis Blin' )	european_football_2
SELECT buildUpPlaySpeedClass  FROM team_stats  WHERE team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*)  FROM games  WHERE season = '2015/2016' AND league = 'Italian Serie A';	european_football_2
SELECT MAX(home_team_goal) AS highest_home_score FROM matches WHERE competition = 'Netherlands Eredivisie';	european_football_2
SELECT T2.finishing, T2.curve FROM `Player` AS T1 JOIN `Player_Attributes` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight = (SELECT MAX(weight) FROM `Player`);	european_football_2
SELECT L.name FROM League AS L JOIN Match AS M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY COUNT(M.id) DESC LIMIT 4;	european_football_2
SELECT team_long_name  FROM matches  WHERE away_team_api_id IN (     SELECT away_team_api_id      FROM matches      GROUP BY away_team_api_id      ORDER BY SUM(CASE WHEN away_team_goal > home_team_goal THEN 1 ELSE 0 END) DESC      LIMIT 1 ) AND MAX(away_team_goal) = away_team_goal;	european_football_2
SELECT Player_Name FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT      (COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END)       OVER ()      / COUNT(*)       OVER ()) * 100 AS percentage FROM      players;	european_football_2
SELECT      (COUNT(*) WHERE `SEX` = 'M' AND `Admission` = '+') * 100.0 / SUM(COUNT(*)     OVER () WHERE `SEX` = 'M') - (COUNT(*) WHERE `SEX` = 'M' AND `Admission` = '-') * 100.0 / SUM(COUNT(*)     OVER () WHERE `SEX` = 'M') AS PercentageDeviation;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN YEAR(`Birthday`) > '1930' AND `SEX` = 'F' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN `SEX` = 'F' THEN 1 ELSE NULL END) AS Percentage FROM `Patient`;	thrombosis_prediction
SELECT      COUNT(CASE WHEN YEAR(`Birthday`) BETWEEN 1930 AND 1940 THEN 1 END) * 100.0 / COUNT(*) AS PercentageOfInpatients FROM `Patient` WHERE `Admission` = '+';	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN `Admission` = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN `Diagnosis` = 'SLE' THEN 1 ELSE 0 END) AS Ratio FROM      `Patient` WHERE      `Diagnosis` = 'SLE';	thrombosis_prediction
SELECT T1.Diagnosis, T2.Date  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.ID = '30609'	thrombosis_prediction
SELECT      Patient.SEX,      Patient.Birthday,      Examination.Examination_Date,      Examination.Symptoms  FROM      Patient  JOIN      Examination ON Patient.ID = Examination.ID  WHERE      Patient.ID = 163109;	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500;	thrombosis_prediction
SELECT P.ID,         (strftime('%Y', 'now') - strftime('%Y', B.Birthday)) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 2 AND P.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT P.ID, P.Birthday, L.T_CHO FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday LIKE '1937-%' AND L.T_CHO >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALB < 3.5;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT AVG(`aCL IgG`)  FROM `Examination`  JOIN `Patient` ON `Examination.ID` = `Patient.ID`  WHERE `Patient.Admission` = '+' AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM `Patient.Birthday`) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(`Description`) = 1997 AND Admission = '-'	thrombosis_prediction
SELECT MIN(TIMESTAMPDIFF(YEAR, Birthday, First_Date)) AS Age_When_Arrived FROM Patient;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Examination_Date LIKE '1997-%' AND e.Thrombosis = 1 AND p.SEX = 'F'	thrombosis_prediction
SELECT      (EXTRACT(YEAR FROM MAX(Patient.Birthday)) - EXTRACT(YEAR FROM MIN(Patient.Birthday))) AS AgeGap FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.TG >= 200;	thrombosis_prediction
SELECT T2.Diagnosis, T1.Symptoms FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Symptoms IS NOT NULL AND T2.Birthday = (SELECT MIN(Birthday) FROM Patient)	thrombosis_prediction
SELECT AVG(COUNT(l.ID) / 12) AS AverageMalePatientsTestedPerMonth FROM (     SELECT DISTINCT p.ID     FROM Patient p     JOIN Laboratory l ON p.ID = l.ID     WHERE p.SEX = 'M'         AND l.Date BETWEEN '1998-01-01' AND '1998-12-31' ) AS m	thrombosis_prediction
SELECT MAX(Laboratory.Date) AS LastLabDate,         (STRFTIME('%Y', Patient.Birthday) - STRFTIME('%Y', Patient.First_Date)) AS AgeAtFirstVisit FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SJS' ORDER BY Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN LAB.UA <= 8.0 AND PAT.SEX = 'M' THEN 1 ELSE 0 END) AS REAL) /      CAST(SUM(CASE WHEN LAB.UA <= 6.5 AND PAT.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) AS Ratio FROM      Patient PAT JOIN      Laboratory LAB ON PAT.ID = LAB.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.`First Date` IS NOT NULL AND        (e.Examination Date IS NULL OR         EXTRACT(YEAR FROM e.Examination Date) - EXTRACT(YEAR FROM p.`First Date`) >= 1)	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE YEAR(e.Examination_Date) BETWEEN 1990 AND 1993  AND YEAR(p.Birthday) < 18;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.T_BIL >= 2.0	thrombosis_prediction
SELECT Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Examination_Date BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(DATE_PART('year', '1999'::text - Birthday))  FROM Patient  WHERE ID IN (     SELECT DISTINCT ID FROM Examination      WHERE Examination.Date BETWEEN '1991-10-01'::date AND '1991-10-30'::date )	thrombosis_prediction
SELECT      (strftime('%Y', 'Laboratory.Date') - strftime('%Y', `Patient.Birthday`)) AS Age,     `Patient.Diagnosis` FROM      `Patient` JOIN      `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE      `Laboratory.HGB` = (SELECT MAX(HGB) FROM `Laboratory`);	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT T-CHO  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.ID = 2927464 AND Date = '1995-09-04' AND T-CHO < 250	thrombosis_prediction
SELECT `SEX` FROM `Patient` WHERE `Diagnosis` = 'AORTITIS' ORDER BY `First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.Diagnosis` = 'SLE' AND `Patient.Description` LIKE '1994-02-19%' AND `Examination.Examination Date` = '1993-11-12'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'F' AND Laboratory.GPT = 9 AND Laboratory.Date = '1992-06-12';	thrombosis_prediction
SELECT Patient.ID,         (EXTRACT(YEAR FROM '1991-10-21') - EXTRACT(YEAR FROM Patient.Birthday)) AS age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UA = 8.4 AND Laboratory.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT(T2.ID)  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.First_Date = '1991-06-13' AND T1.Diagnosis = 'SJS' AND YEAR(T2.Date) = 1995	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T1.Examination_Date = '1997-01-27' AND T2.First_Date IS NOT NULL ORDER BY T2.First_Date LIMIT 1	thrombosis_prediction
SELECT T1.Symptoms FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.Examination_Date = '1993-09-27'	thrombosis_prediction
SELECT      (SUM(CASE WHEN Date LIKE '1981-11-%' THEN T_CHO END) - SUM(CASE WHEN Date LIKE '1981-12-%' THEN T_CHO END)) / NULLIF(SUM(CASE WHEN Date LIKE '1981-11-%' THEN T_CHO END), 0) * 100 AS Decrease_Rate FROM      Laboratory l JOIN      Patient p ON l.ID = p.ID WHERE      p.Birthday = '1959-02-18'	thrombosis_prediction
SELECT DISTINCT T1.ID  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.Diagnosis = 'Behcet\'s'  AND STRFTIME('%Y-%m-%d', T1.Examination Date) BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT `ID` FROM `Laboratory` WHERE `Date` BETWEEN '1987-07-06' AND '1996-01-31' AND `GPT` > 30 AND `ALB` < 4;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'  ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE Thrombosis = 2 AND ANA_Pattern = 'S' AND `aCL IgM` > (AVG(`aCL IgM`) * 1.2)	thrombosis_prediction
SELECT      CAST(SUM(CASE          WHEN `UA` <= 6.5 AND (`U-PRO` > 0 AND `U-PRO` < 30) THEN 1          ELSE 0      END) AS REAL) * 100 / COUNT(*) FROM      `Laboratory` WHERE      `U-PRO` BETWEEN 0 AND 30;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END)       OVER () * 100.0 / COUNT(CASE WHEN YEAR(`First Date`) = 1981 THEN 1 ELSE 0 END) OVER ()) AS Percentage_BEHCET_1981 FROM      Patient WHERE      `SEX` = 'M';	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.ANA_Pattern != 'P' AND p.SEX = 'F' AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31'	thrombosis_prediction
SELECT T2.SEX FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T1.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123;	thrombosis_prediction
SELECT AVG(T2.ALB)  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.SEX = 'F' AND T1.Diagnosis = 'SLE' AND T2.PLT > 400;	thrombosis_prediction
SELECT MAX(Symptoms) AS MostCommonSign FROM Examination WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT `First Date`, `Diagnosis` FROM `Patient` WHERE `ID` = '48473' AND `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE strftime('%Y', Date) = '1997' AND ALB NOT BETWEEN 6 AND 8.5;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis LIKE '%ITP%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS proportion FROM Examination WHERE Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN T.Birthday LIKE '%-1980-%' AND T.Diagnosis = 'RA' AND T.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T.Birthday LIKE '%-1980-%' AND T.Diagnosis = 'RA' THEN 1 END) AS PercentageOfWomenWithRABornIn1980 FROM Patient T;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.Diagnosis = 'Behcet' AND e.Examination_Date BETWEEN '1995' AND '1997' AND p.Admission = '-' AND p.SEX = 'M'	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination.Date`, `Patient.First Date`)  FROM `Examination`, `Patient`  WHERE `Examination.ID` = '821298' AND `Examination.ID` = `Patient.ID`  AND `Patient.First Date` IS NOT NULL  ORDER BY `Examination.Date` ASC LIMIT 1;	thrombosis_prediction
SELECT EXISTS (     SELECT 1 FROM Patient p     JOIN Laboratory l ON p.ID = l.ID     WHERE p.ID = 57266 AND (p.SEX = 'M' AND l.UA > 8.0 OR p.SEX = 'F' AND l.UA > 6.5) );	thrombosis_prediction
SELECT Date FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.ID = '48473' AND GOT >= 60;	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT < 60 AND SUBSTR(T2.Date, 1, 4) = '1994'	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH)  FROM Laboratory  WHERE LDH < 500;	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800	thrombosis_prediction
SELECT p.Admission, COUNT(*) as PatientCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP < 300 AND p.Admission != '' GROUP BY p.Admission;	thrombosis_prediction
SELECT P.ID  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = '1982-04-01' AND L.ALP < 300;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0;	thrombosis_prediction
SELECT      LAB.TP - 8.5 AS TP_deviation FROM      Patient JOIN      Laboratory LAB ON Patient.ID = LAB.ID WHERE      Patient.SEX = 'F' AND LAB.TP > 8.5;	thrombosis_prediction
SELECT P.ID, P.Birthday, L.ALB FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT p.ID, p.Birthday, l.ALB FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1982 AND l.ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT      COUNT(CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 1 END) AS abnormal_count,     COUNT(CASE WHEN SEX = 'F' THEN 1 END) AS total_female_count,     CAST(COUNT(CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN SEX = 'F' THEN 1 END) AS percentage FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE SEX = 'F';	thrombosis_prediction
SELECT AVG(l.UA)  FROM (     SELECT t2.UA FROM (         SELECT * FROM Patient WHERE SEX IN ('M', 'F')     ) AS t1     JOIN Laboratory AS l ON t1.ID = l.ID     WHERE t1.SEX IN ('M', 'F') AND (t1.SEX = 'M' AND l.UA < 8.0 OR t1.SEX = 'F' AND l.UA < 6.5)     ORDER BY l.Date DESC LIMIT 1 ) AS t3;	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.UN WHERE T2.UN = 29	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'RA' AND T2.UN < 30;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN T1.SEX = 'M' AND T2.CRE >= 1.5 THEN 1 END) > COUNT(CASE WHEN T1.SEX = 'F' AND T2.CRE >= 1.5 THEN 1 END)) AS result FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, MAX(L.T-BIL) AS Highest_T_Bil FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.T_BIL IS NOT NULL GROUP BY P.ID, P.SEX, P.Birthday ORDER BY Highest_T_Bil DESC LIMIT 1;	thrombosis_prediction
SELECT      T1.SEX,     GROUP_CONCAT(DISTINCT T1.ID) AS PatientIDs FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID WHERE      T2.T_BIL >= 2.0 GROUP BY      T1.SEX;	thrombosis_prediction
SELECT p.ID, l.T_CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.T_CHO = (SELECT MAX(T_CHO) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient))	thrombosis_prediction
SELECT AVG(DATEDIFF(CURRENT_DATE, Birthday)) AS AverageAge FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE SEX = 'M' AND T_CHO >= 250;	thrombosis_prediction
SELECT P.ID, P.Diagnosis, L.TG FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday) > 50;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Birthday) BETWEEN 1936 AND 1956  AND Sex = 'M'  AND CPK >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX,         (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GLU >= 180 AND L.T_CHO < 250;	thrombosis_prediction
SELECT P.ID, L.GLU FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.First_Date BETWEEN '1991-01-01' AND '1991-12-31' AND L.GLU IS NOT NULL AND L.GLU < 180;	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday,         CASE             WHEN T2.WBC <= 3.5 THEN 'Abnormal Low'            WHEN T2.WBC >= 9.0 THEN 'Abnormal High'            ELSE 'Normal'        END AS WBC_Status,        TIMESTAMPDIFF(YEAR, T1.Birthday, CURDATE()) AS Age FROM Patient T1 JOIN Laboratory T2 ON T1.ID = T2.ID WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 GROUP BY T1.SEX ORDER BY T1.SEX, Age ASC;	thrombosis_prediction
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RBC < 3.5	thrombosis_prediction
SELECT p.ID, p.Birthday, p.Admission, l.RBC FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND       EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) >= 50 AND       (l.RBC <= 3.5 OR l.RBC >= 6.0) AND p.Admission = '+';	thrombosis_prediction
SELECT T1.ID, T1.SEX FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.HGB < 10	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.HGB BETWEEN 10 AND 17 AND P.Birthday = (     SELECT MIN(Birthday) FROM Patient WHERE Diagnosis = 'SLE' )	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age  FROM Patient P  JOIN (     SELECT ID      FROM Laboratory      WHERE HCT >= 52      GROUP BY ID      HAVING COUNT(*) >= 2 ) L ON P.ID = L.ID	thrombosis_prediction
SELECT AVG(Laboratory.HCT) AS Average_Hematocrit FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.Date LIKE '1991%' AND Laboratory.HCT < 29;	thrombosis_prediction
SELECT ABS((SUM(Laboratory.PLT < 100) - SUM(Laboratory.PLT > 400)) AS Comparison) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.PLT <= 100 OR Laboratory.PLT >= 400;	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T2.Date) = '1984' AND strftime('%Y', datetime('now')) - strftime('%Y', T1.Birthday) < 50 AND T2.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN T1.SEX = 'F' AND T2.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID)  FROM      Patient T1  JOIN      Laboratory T2  ON      T1.ID = T2.ID  WHERE      EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM T1.Birthday) > 55;	thrombosis_prediction
SELECT p.ID, p.First_Date, l.PT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.First_Date > '1992-12-31' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT *      FROM Laboratory      WHERE Date > '1997-01-01' AND APTT IS NOT NULL AND APTT >= 45 ) AS filtered_examinations	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.APTT IS NOT NULL AND e.APTT > 45 AND p.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.WBC BETWEEN 3.5 AND 9.0 AND l.FG <= 150 OR l.FG >= 450 GROUP BY p.ID HAVING COUNT(*) = 1	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Birthday > '1980-01-01' AND l.FG < 150 OR l.FG > 450;	thrombosis_prediction
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.U_PRO >= 30;	thrombosis_prediction
SELECT `Patient`.`ID` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Patient`.`Diagnosis` = 'SLE' AND `Laboratory`.`U-PRO` BETWEEN 0 AND 30;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.IGG BETWEEN 900 AND 2000 AND e.Symptoms IS NOT NULL	thrombosis_prediction
SELECT Diagnosis FROM PatientTestResults WHERE IGA BETWEEN 80 AND 500 AND IGA = (SELECT MAX(IGA) FROM PatientTestResults WHERE IGA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA BETWEEN 80 AND 500 AND STRFTIME('%Y', p.`First Date`) >= '1990'	thrombosis_prediction
SELECT T1.Diagnosis, COUNT(*) AS frequency FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGM <= 40 OR T2.IGM >= 400 GROUP BY T1.Diagnosis ORDER BY frequency DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE CRP = '+' AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRE >= 1.5 AND DATEDIFF(YEAR(CURDATE()), p.Birthday) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.RA IN ('-', '+-') AND e.KCT = '+'	thrombosis_prediction
SELECT Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE EXTRACT(YEAR FROM Birthday) >= 1985 AND Examination.RA IN ('-', '+-')	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RF < 20 AND DATEDIFF(YEAR(CURRENT_DATE(), P.Birthday)) > 60	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON l.ID = p.ID WHERE l.RF < '20' AND e.Thrombosis = '0'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID)  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  JOIN Laboratory AS T3 ON T2.ID = T3.ID  WHERE T3.C3 > 35 AND T1.ANA_Pattern = 'P'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.HCT BETWEEN 29 AND 52 ORDER BY T2.aCL_IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis LIKE '%APS%' AND l.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RNP IN ('-', '+-') AND p.Admission = '+'	thrombosis_prediction
SELECT `Birthday` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.RNP` NOT IN ('-', '+-') ORDER BY `Patient.Birthday` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.SM IN ('-', '+-') AND p.Thrombosis = 0;	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') AND T1.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE SM NOT IN ('negative', '0')) LIMIT 3) ORDER BY T1.Birthday ASC LIMIT 3;	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date > '1997-01-01' AND T2.SC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE `SC170` IN ('negative', '0')  AND Sex = 'F' AND Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Symptoms LIKE '%normal anti-SSA%' AND strftime('%Y', p.`First Date`) < '2000'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T1.`First Date` LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.SSB IN ('-', '0') AND Patient.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.SSB IN ('negative', '0') AND Examination.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CENTROMEA IN ('-', '+-') AND l.SSB IN ('-', '+-') AND p.SEX = 'M'	thrombosis_prediction
SELECT T1.Diagnosis  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.DNA IS NOT NULL AND CAST(SUBSTRING(T2.DNA, CHARINDEX(' ', T2.DNA) + 1, LEN(T2.DNA)) AS INTEGER) >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA < 8 AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.IGG BETWEEN 900 AND 2000 AND Patient.Admission = '+'	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN L.GOT >= 60 AND P.Diagnosis = 'SLE' THEN L.ID ELSE NULL END) AS REAL) * 100 / COUNT(L.ID) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60	thrombosis_prediction
SELECT Birthday FROM Patient JOIN (     SELECT ID     FROM Laboratory     WHERE GOT >= 60 ) AS AbnormalGOT ON Patient.ID = AbnormalGOT.ID ORDER BY Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M'	thrombosis_prediction
SELECT T1.First_Date, T2.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T1.First_Date ASC LIMIT 1;	thrombosis_prediction
SELECT p.First_Date, lab.LDH FROM Patient p JOIN Laboratory lab ON p.ID = lab.ID WHERE p.ID = (     SELECT MAX(ID) FROM Patient ) AND lab.LDH >= 500 LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP >= 300 AND p.Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Admission = '-' AND Laboratory.ALP < 300	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ALB BETWEEN 3.5 AND 5.5 ORDER BY ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M'  AND l.ALB > 3.5  AND l.ALB < 5.5  AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT e.`aCL IgG`, e.`aCL IgM`, e.`aCL IgA` FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.UA > 6.50 ORDER BY l.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(T1.ANA)  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  JOIN Laboratory AS T3 ON T2.ID = T3.ID  WHERE T3.CRE < 1.5	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.CRE < 1.5 AND T2.aCL_IgA = (     SELECT MAX(aCL_IgA)     FROM Examination     WHERE ID = T1.ID )	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL >= 2.0 AND e.ANA_Pattern LIKE '%P%'	thrombosis_prediction
SELECT T1.ANA FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T3.T_BIL <= 2.0 AND T3.T_BIL IN (     SELECT MAX(T_BIL)     FROM Laboratory     WHERE T_BIL IS NOT NULL AND T_BIL <= 2.0 ) ORDER BY T3.T_BIL DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.T_CHO >= 250 AND e.KCT = '-'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.T_CHO < 250 AND e.ANA_Pattern = 'P'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN (     SELECT ID, MAX(TG) AS max_triglyceride     FROM Laboratory     WHERE TG < 200     GROUP BY ID ) AS T3 ON T2.ID = T3.ID WHERE T1.ID = T3.ID AND T3.max_triglyceride IS NOT NULL ORDER BY T3.max_triglyceride DESC LIMIT 1;	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN (     SELECT ID     FROM Laboratory     WHERE CPK < 250 ) l ON p.ID = l.ID WHERE e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+';	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = (SELECT MIN(Birthday) FROM Patient) AND T2.GLU > 180;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU < 180 AND e.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Diagnosis = 'SLE' AND Laboratory.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0 AND Patient.Admission = '-'	thrombosis_prediction
SELECT COUNT(*) FROM (     SELECT DISTINCT `Patient`.`ID`     FROM `Patient`     JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID`     WHERE `Laboratory`.`PLT` BETWEEN 100 AND 400     AND `Patient`.`Diagnosis` IS NOT NULL )	thrombosis_prediction
SELECT p.ID, l.PLT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'MCTD' AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT AVG(Lab.PT)  FROM Patient  JOIN Laboratory Lab ON Patient.ID = Lab.ID  WHERE Patient.SEX = 'M' AND Lab.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Thrombosis IN (1, 2) AND l.PT < 14	thrombosis_prediction
SELECT m.major_name FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Angela' AND mem.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering';	student_club
SELECT T2.first_name, T2.last_name FROM `major` AS T1 JOIN `member` AS T2 ON T1.major_id = T2.link_to_major WHERE T1.department = 'Art and Design Department';	student_club
SELECT COUNT(*) FROM `attendance` WHERE `link_to_event` IN (SELECT `event_id` FROM `event` WHERE `event_name` = 'Women''s Soccer')	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'	student_club
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium'	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.event_id IN (     SELECT a.link_to_event     FROM attendance a     GROUP BY a.link_to_event     ORDER BY COUNT(*) DESC     LIMIT 1 ) AND e.event_name LIKE '%Student_Club%'	student_club
SELECT `college` FROM `major` WHERE `major_id` = (SELECT `link_to_major` FROM `member` WHERE `position` = 'Vice President')	student_club
SELECT `event.event_name` FROM `event` JOIN `attendance` ON `event.event_id` = `attendance.link_to_event` JOIN `member` ON `attendance.link_to_member` = `member.member_id` WHERE `member.first_name` = 'Maya' AND `member.last_name` = 'Mclean';	student_club
SELECT COUNT(*)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(*)  FROM (     SELECT event.event_id     FROM event     JOIN attendance ON event.event_id = attendance.link_to_event     WHERE event.type = 'Meeting'     GROUP BY event.event_id     HAVING COUNT(attendance.link_to_event) > 10 ) AS subquery;	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_id, event.event_name HAVING COUNT(*) > 20 AND event.type != 'Fundraiser';	student_club
SELECT AVG(COUNT(DISTINCT e.event_id)) AS average_attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' AND strftime('%Y', e.event_date) = '2020';	student_club
SELECT expense_description, MAX(cost)  FROM `expense`  WHERE expense_description LIKE '%club events%'	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT `last_name` FROM `member` WHERE `link_to_major` = (SELECT `major_id` FROM `major` WHERE `major_name` = 'Law and Constitutional Studies')	student_club
SELECT `county` FROM `zip_code` WHERE `zip_code` IN (SELECT `zip` FROM `member` WHERE `first_name` = 'Sherri' AND `last_name` = 'Ramsey')	student_club
SELECT T1.college FROM `major` AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt';	student_club
SELECT SUM(T1.amount) FROM `income` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'	student_club
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT `city`, `state` FROM `zip_code` JOIN `member` ON `zip_code.zip_code` = `member.zip` WHERE `position` = 'President' AND `member.position` = 'Member';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois'	student_club
SELECT SUM(`spent`) AS total_spent_on_advertisement FROM `budget` JOIN `event` ON `budget`.`link_to_event` = `event`.`event_id` WHERE `event`.`event_name` = 'September Meeting';	student_club
SELECT T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.last_name IN ('Pierce', 'Guidi')	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'October Speaker'	student_club
SELECT e.approved  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08'	student_club
SELECT AVG(T1.cost) AS average_cost FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND MONTH(T1.expense_date) IN (9, 10);	student_club
SELECT      (SUM(b.spent WHERE LEFT(e.event_date, 4) = '2019') - SUM(b.spent WHERE LEFT(e.event_date, 4) = '2020')) AS difference_spent_2019_2020 FROM      event e JOIN      budget b ON e.event_id = b.link_to_event;	student_club
SELECT `location` FROM `event` WHERE `event_name` = 'Spring Budget Review';	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';	student_club
SELECT MAX(amount) - remaining FROM budget WHERE category = 'Food';	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT `county` FROM `zip_code` WHERE `zip_code` = (SELECT `zip` FROM `member` WHERE `first_name` = 'Adela' AND `last_name` = 'O\'Gallagher')	student_club
SELECT COUNT(*)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'November Meeting' AND budget.remaining < 0;	student_club
SELECT SUM(T2.amount) FROM `budget` AS T2 JOIN `event` AS T1 ON T2.link_to_event = T1.event_id WHERE T1.event_name = 'September Speaker'	student_club
SELECT T1.event_status FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20';	student_club
SELECT `major.major_name` FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `member.first_name` = 'Brent' AND `member.last_name` = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'	student_club
SELECT T1.type FROM `zip_code` AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielson'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President';	student_club
SELECT t2.state FROM member AS t1 JOIN zip_code AS t2 ON t1.zip = t2.zip_code WHERE t1.first_name = 'Sacha' AND t1.last_name = 'Harrison'	student_club
SELECT m.department FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.position = 'President';	student_club
SELECT `date_received` FROM `income` JOIN `member` ON `income.link_to_member` = `member.member_id` WHERE `member.first_name` = 'Connor' AND `member.last_name` = 'Hilton' AND income.source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' AND i.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues')	student_club
SELECT      (SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) /       SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END)) AS ratio FROM      event AS T1 JOIN      budget AS T2 ON T1.event_id = T2.link_to_event WHERE      T2.category = 'Advertisement';	student_club
SELECT      (SUM(CASE WHEN `category` = 'Parking' AND `event_name` = 'November Speaker' THEN `amount` ELSE 0 END) /       SUM(CASE WHEN `event_name` = 'November Speaker' THEN `amount` ELSE 0 END)) * 100 AS percentage_budget_for_parking FROM `budget`;	student_club
SELECT SUM(cost) FROM `expense` WHERE `expense_description` = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT `department` FROM `major` WHERE `college` = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget)	student_club
SELECT T3.member_id FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'October Meeting';	student_club
SELECT major.college FROM member LEFT JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT m.major_name FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.phone = '809-555-3360'	student_club
SELECT `event_name` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `amount` = (SELECT MAX(`amount`) FROM `budget`)	student_club
SELECT `expense.description` FROM `expense` JOIN `member` ON `expense.link_to_member` = `member.member_id` WHERE `member.position` = 'Vice President'	student_club
SELECT COUNT(*) FROM `attendance` WHERE `link_to_event` IN (SELECT `event_id` FROM `event` WHERE `event_name` = 'Women''s Soccer');	student_club
SELECT `date_received` FROM `income` JOIN `member` ON `income.link_to_member` = `member.member_id` WHERE `member.first_name` = 'Casey' AND `member.last_name` = 'Mason';	student_club
SELECT COUNT(*)  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE z.state = 'Maryland'	student_club
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  WHERE member.phone = '(954) 555-6240'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major d ON m.link_to_major = d.major_id WHERE d.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' ORDER BY budget.spent / budget.amount DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020';	student_club
SELECT SUM(`spent`) FROM `budget` WHERE `category` = 'Food';	student_club
SELECT T1.first_name, T1.last_name  FROM member AS T1  JOIN attendance AS T2  ON T1.member_id = T2.link_to_member  GROUP BY T1.member_id, T1.first_name, T1.last_name  HAVING COUNT(T2.link_to_event) > 7;	student_club
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id JOIN `event` AS T3 ON T3.event_id = ANY (SELECT T4.link_to_event FROM `attendance` AS T4 WHERE T4.link_to_member IN (SELECT T1.member_id FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Interior Design') GROUP BY T4.link_to_event) WHERE T2.major_name = 'Interior Design' AND T3.event_name = 'Community Theater';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina';	student_club
SELECT COUNT(*) FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour')	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost)  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'Yearly Kickoff'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member JOIN budget AS T3 ON T2.link_to_budget = T3.budget_id JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T4.event_name = 'Yearly Kickoff';	student_club
SELECT T2.first_name, T2.last_name, T1.source FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT `event.event_name` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` WHERE `expense.cost` = (SELECT MIN(`cost`) FROM `expense`)	student_club
SELECT      (SUM(cost WHERE event_name = 'Yearly Kickoff') /       (SELECT SUM(cost) FROM expense)) * 100 AS percentage	student_club
SELECT CAST(COUNT(CASE WHEN major_name = 'Finance' THEN 1 END) AS REAL) / COUNT(CASE WHEN major_name = 'Physics' THEN 1 END) FROM `major`;	student_club
SELECT `source`, COUNT(`source`) AS source_count FROM `income` WHERE `date_received` BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY `source` ORDER BY source_count DESC LIMIT 1;	student_club
SELECT first_name, last_name, email  FROM member  WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Physics Teaching')	student_club
SELECT COUNT(DISTINCT link_to_member)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater' AND STRFTIME('%Y', event.event_date) = '2019';	student_club
SELECT COUNT(*) AS num_events_attended, m.major_name FROM member AS mem JOIN attendance AS att ON mem.member_id = att.link_to_member JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi'	student_club
SELECT AVG(`spent`)  FROM `budget`  WHERE `category` = 'Food' AND `event_status` = 'Closed';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' ORDER BY b.spent DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM `attendance` a JOIN `event` e ON a.link_to_event = e.event_id JOIN `member` m ON a.link_to_member = m.member_id WHERE e.event_name = 'Women''s Soccer' AND m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) / CAST(COUNT(*) AS REAL)) * 100  FROM      event  WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31' AND      type = 'Student_Club';	student_club
SELECT T3.cost FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'September Speaker' AND T3.expense_description = 'Posters';	student_club
SELECT t_shirt_size  FROM member  GROUP BY t_shirt_size  ORDER BY COUNT(*) DESC  LIMIT 1;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.event_status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT e.type, SUM(exp.cost) AS total_value FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense exp ON b.budget_id = exp.link_to_budget WHERE e.event_name = 'October Meeting' GROUP BY e.type;	student_club
SELECT category  FROM budget  WHERE link_to_event = 'recI43CzsZ0Q625ma'  ORDER BY amount ASC;	student_club
SELECT * FROM `budget` WHERE `category` = 'Food' AND `amount` = (SELECT MAX(`amount`) FROM `budget` WHERE `category` = 'Food');	student_club
SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison';	student_club
SELECT T1.expense_description  FROM expense AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  WHERE T2.t_shirt_size = 'X-Large'	student_club
SELECT T2.zip FROM `expense` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost < 50	student_club
SELECT m.major_name FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Phillip' AND mem.last_name = 'Cullen';	student_club
SELECT `position` FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `major.major_name` = 'Business';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30	student_club
SELECT T1.category FROM `budget` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215';	student_club
SELECT `category` FROM `budget` JOIN `event` ON `budget`.`link_to_event` = `event`.`event_id` WHERE `event`.`event_date` = '2020-03-24T12:00:00';	student_club
SELECT T.major_name FROM member AS M JOIN major AS T ON M.link_to_major = T.major_id WHERE M.position = 'Vice President';	student_club
SELECT      CAST(SUM(CASE WHEN position = 'Member' AND major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_members_in_Business FROM      member JOIN      major ON member.link_to_major = major.major_id WHERE      major.major_name = 'Finance';	student_club
SELECT DISTINCT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large';	student_club
SELECT COUNT(*)  FROM `major`  WHERE `college` = 'College of Agriculture and Applied Sciences'  AND `department` = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.major_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE ma.department = 'School of Applied Sciences, Technology and Education' AND ma.major_id IN ('rec06DF6vZ1CyPKpc', 'rec09LedkREyskCNv') AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Social' AND m.position = 'Vice President' AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10'	student_club
SELECT T2.last_name  FROM attendance AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  JOIN event AS T3 ON T1.link_to_event = T3.event_id  WHERE T3.event_name = 'Women''s Soccer' AND T2.position = 'Member'	student_club
SELECT      CAST(SUM(CASE WHEN m.t_shirt_size = 'Medium' AND i.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(i.member_id)  FROM      income i  JOIN      member m ON i.link_to_member = m.member_id;	student_club
SELECT county FROM zip_code WHERE type = 'PO Box'	student_club
SELECT zip_code  FROM zip_code  WHERE county = 'San Juan Municipio' AND state = 'Puerto Rico' AND type = 'PO Box';	student_club
SELECT event_name  FROM event  WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT T1.link_to_event FROM `attendance` AS T1 JOIN `expense` AS T2 ON T1.link_to_member = T2.link_to_member WHERE T2.cost > 50	student_club
SELECT T1.member_id, T2.link_to_member FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN expense AS T3 ON T2.link_to_member = T3.link_to_member WHERE T3.approved = 'true' AND T3.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT T2.college FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T2.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT member.email  FROM member  JOIN expense ON member.member_id = expense.link_to_member  WHERE expense.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND expense.cost > 20;	student_club
SELECT COUNT(*)  FROM `member` m  JOIN `major` ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'education' AND m.position = 'Member';	student_club
SELECT      (SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) / CAST(COUNT(*) AS REAL)) * 100 AS percentage_over_budget FROM      budget;	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description FROM expense WHERE cost > (SELECT AVG(cost) FROM expense) * 50 / 100;	student_club
SELECT `first_name`, `last_name` FROM `member` WHERE `t_shirt_size` = 'X-Large';	student_club
SELECT      (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 100.0 / COUNT(zip_code)) AS percentage_PO_boxes FROM      zip_code;	student_club
SELECT T1.event_name, T1.location FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100;	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100	student_club
SELECT z.city, z.county FROM zip_code z JOIN member m ON z.zip_code = m.zip JOIN income i ON m.member_id = i.link_to_member GROUP BY z.zip_code HAVING COUNT(i.amount) > 40;	student_club
SELECT m.member_id, SUM(e.cost) AS total_expense FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_expense DESC LIMIT 1;	student_club
SELECT AVG(`cost`)  FROM `expense`  JOIN `member` ON `expense.link_to_member` = `member.member_id`  WHERE `member.position` != 'Member'  GROUP BY `member.member_id`, `member.position`;	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN `expense` AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.cost < (SELECT AVG(T3.cost) FROM `expense` AS T3 WHERE T3.link_to_budget IN (SELECT budget_id FROM `budget` WHERE category = 'Parking')) AND T2.category = 'Parking'	student_club
SELECT      (SUM(cost) OVER () * 100 / COUNT(event_id) OVER ()) AS percentage_cost_meeting_events FROM      event WHERE      type = 'Meeting';	student_club
SELECT `budget_id` FROM `budget` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` WHERE `expense_description` = 'Water, chips, cookies' GROUP BY `budget_id` ORDER BY SUM(`cost`) DESC LIMIT 1;	student_club
SELECT T3.first_name, T3.last_name  FROM expense AS T1  JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id  JOIN member AS T3 ON T3.member_id = T1.link_to_member  GROUP BY T1.link_to_member  ORDER BY SUM(T2.spent) DESC  LIMIT 5	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN (     SELECT link_to_member, AVG(cost) AS avg_cost     FROM expense     GROUP BY link_to_member ) e ON m.member_id = e.link_to_member WHERE e.avg_cost < (SELECT AVG(cost) FROM expense) AND cost > e.avg_cost;	student_club
SELECT      (         CAST(SUM(CASE WHEN state = 'New Jersey' THEN 1 ELSE 0 END) AS REAL) / COUNT(CASE WHEN position = 'Member' THEN 1 END) -         CAST(SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) / COUNT(CASE WHEN position = 'Member' THEN 1 END)     ) * 100	student_club
SELECT `major_name`, `department` FROM `major` WHERE `major_id` = (SELECT `link_to_major` FROM `member` WHERE `first_name` = 'Garrett' AND `last_name` = 'Gerke')	student_club
SELECT m.first_name, m.last_name, e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT `last_name`, `phone` FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `major.major_name` = 'Elementary Education'	student_club
SELECT T2.category, T2.amount FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Officers meeting - January';	student_club
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09'	student_club
SELECT `category` FROM `budget` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` WHERE `expense.expense_description` = 'Posters';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary'	student_club
SELECT T2.event_name, SUM(T1.spent) AS total_spent FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts'	student_club
SELECT z.city  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT `first_name`, `last_name`, `position` FROM `member` JOIN `zip_code` ON `member.zip` = `zip_code.zip_code` WHERE `zip_code.city` = 'Lincolnton' AND `zip_code.state` = 'North Carolina' AND `zip_code.zip_code` = 28092;	student_club
SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Premium';	debit_card_specializing
SELECT      COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / NULLIF(SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END), 0) AS Ratio FROM      customers	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND LEFT(y.Date, 6) BETWEEN '201201' AND '201212' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(T2.Consumption) / 12 AS AverageMonthlyConsumption FROM `yearmonth` AS T1 JOIN `customers` AS T2 ON T1.CustomerID = T2.CustomerID WHERE LEFT(T1.Date, 4) BETWEEN '201301' AND '201312' AND T2.Segment = 'SME';	debit_card_specializing
SELECT `customers.CustomerID` FROM `customers` JOIN `yearmonth` ON `customers.CustomerID` = `yearmonth.CustomerID` WHERE `customers.Currency` = 'CZK' AND `yearmonth.Date` BETWEEN '201101' AND '201112' GROUP BY `customers.CustomerID` ORDER BY SUM(`yearmonth.Consumption`) DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(*)  FROM customers  JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID  WHERE customers.Segment = 'KAM' AND yearmonth.Consumption < 30000 AND yearmonth.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT      SUM(CASE WHEN T2.Currency = 'CZK' THEN T1.Consumption ELSE 0 END) - SUM(T1.Consumption) FROM      (SELECT `Consumption` FROM `yearmonth` WHERE LEFT(`Date`, 4) BETWEEN '201201' AND '201212') AS T1 JOIN      `customers` AS T2 ON T1.CustomerID = T2.CustomerID WHERE      T2.Currency = 'CZK' GROUP BY      T1.CustomerID;	debit_card_specializing
SELECT T2.year, SUM(T1.Consumption) AS TotalConsumption FROM yearmonth T1 JOIN customers T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY T2.year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Segment, MIN(Consumption) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY Segment ORDER BY MIN(Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(`Date`, 1, 4) AS Year, SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` JOIN `customers` ON `yearmonth.CustomerID` = `customers.CustomerID` WHERE `Currency` = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT T2.Date, T2.Consumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
WITH cte AS (     SELECT          c.CustomerID,          c.Segment,          AVG(ym.Consumption) AS AvgConsumption      FROM          customers c      JOIN          yearmonth ym ON c.CustomerID = ym.CustomerID      WHERE          ym.Date LIKE '2013%'      GROUP BY          c.Segment, c.CustomerID ), cte2 AS (     SELECT          Segment,          MIN(AvgConsumption) OVER (PARTITION BY Segment) AS MinAvgConsumption      FROM          cte ) SELECT      CASE          WHEN cte2.Segment = 'SME' THEN cte2.MinAvgConsumption          ELSE NULL      END AS SME_MinAvg,     CASE          WHEN cte2.Segment = 'LAM' THEN cte2.MinAvgConsumption          ELSE NULL      END AS LAM_MinAvg,     CASE          WHEN cte2.Segment = 'KAM' THEN cte2.MinAvgConsumption          ELSE NULL      END AS KAM_MinAvg FROM      cte2;	debit_card_specializing
WITH ConsumptionData AS (     SELECT          c.Segment,         ym.Date,         ym.Consumption,         LEAD(ym.Consumption, 1) OVER (PARTITION BY c.CustomerID ORDER BY ym.Date) AS NextYearConsumption     FROM          customers c     JOIN          yearmonth ym ON c.CustomerID = ym.CustomerID ), YearlyConsumptionChanges AS (     SELECT          Segment,         Date,         Consumption,         NextYearConsumption,         (NextYearConsumption - Consumption) / NextYearConsumption * 100 AS PercentageChange     FROM          ConsumptionData ) SELECT      Segment,     MAX(PercentageChange) AS MaxPercentageChange,     MIN(PercentageChange) AS MinPercentageChange FROM      YearlyConsumptionChanges WHERE      Date LIKE '2012%'     AND Date LIKE '2013%' GROUP BY      Segment ORDER BY      Segment;	debit_card_specializing
SELECT SUM(`Consumption`)  FROM `yearmonth`  WHERE `CustomerID` = 6 AND `Date` LIKE '201308%' OR `Date` LIKE '201309%' OR `Date` LIKE '201310%' OR `Date` LIKE '201311%'	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Value for money') -      (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'SVK' AND `Segment` = 'Value for money')	debit_card_specializing
SELECT (SELECT `Consumption` FROM `yearmonth` WHERE `CustomerID` = 7 AND `Date` = '201304') - (SELECT `Consumption` FROM `yearmonth` WHERE `CustomerID` = 5 AND `Date` = '201304') AS ConsumptionDifference;	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND `Currency` = 'CZK') -     (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND `Currency` = 'EUR')	debit_card_specializing
SELECT ym.CustomerID FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, c.Segment, MAX(ym.Consumption) AS MaxConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY MaxConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(T2.Consumption)  FROM customers AS T1  JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T1.Segment = 'KAM' AND T2.Date = '201305'	debit_card_specializing
SELECT      100 * SUM(CASE WHEN c.Segment = 'LAM' AND ym.Consumption > 46.73 THEN 1 ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN c.CustomerID END) AS percentage FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID;	debit_card_specializing
SELECT Country, COUNT(*) AS ValueForMoneyCount FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country;	debit_card_specializing
SELECT      CAST(SUM(CASE WHEN Segment = 'KAM' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      customers WHERE      Segment = 'KAM' AND      Currency = 'EUR';	debit_card_specializing
SELECT      COUNT(*) * 100.0 / (         SELECT COUNT(*)         FROM yearmonth         WHERE Date LIKE '201202'     ) AS percentage FROM yearmonth WHERE Date LIKE '201202' AND Consumption > 528.3;	debit_card_specializing
SELECT      (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*) AS PremiumPercentage FROM      gasstations WHERE      Country = 'CZE';	debit_card_specializing
SELECT `CustomerID` FROM `yearmonth` WHERE `Date` = '201309' ORDER BY `Consumption` DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201309' ORDER BY ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT `consumption` FROM `yearmonth` JOIN `customers` ON `yearmonth.CustomerID` = `customers.CustomerID` WHERE `customers.Segment` = 'SME' AND `yearmonth.Date` = '201206' ORDER BY `consumption` ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) FROM `yearmonth` WHERE LEFT(Date, 4) = '2012'	debit_card_specializing
SELECT MAX(T2.Consumption) * 12 AS MaxAnnualConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR'	debit_card_specializing
SELECT T2.Description  FROM transactions_1k AS T1  JOIN products AS T2 ON T1.ProductID = T2.ProductID  JOIN yearmonth AS T3 ON T1.Date LIKE CONCAT(T3.Date, '%')  WHERE T3.Date LIKE '201309%'	debit_card_specializing
SELECT DISTINCT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID JOIN yearmonth AS T3 ON T2.Date = T3.Date AND SUBSTR(T3.Date, 1, 4) = '2013' AND SUBSTR(T3.Date, 5, 2) = '06'	debit_card_specializing
SELECT DISTINCT gs.ChainID FROM gasstations gs JOIN transactions_1k t ON gs.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT AVG(`Amount`) AS AverageTotalPrice FROM `transactions_1k` WHERE `Date` LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(*) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT T3.Description  FROM gasstations AS T1  JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID  JOIN products AS T3 ON T2.ProductID = T3.ProductID  WHERE T1.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT Time  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.ChainID = 11	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.Country = 'CZE' AND t.Price > 1000	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(t.Price) AS AveragePrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(Price)  FROM transactions_1k  JOIN customers ON transactions_1k.CustomerID = customers.CustomerID  WHERE customers.Currency = 'EUR'	debit_card_specializing
SELECT `CustomerID`, SUM(`Price`) AS TotalPaid FROM `transactions_1k` WHERE `Date` = '2012-08-25' GROUP BY `CustomerID` ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT T1.Country FROM `gasstations` AS T1 JOIN `transactions_1k` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-25' ORDER BY T2.Time LIMIT 1;	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Time = '16:25:00' AND T2.Date = '2012-08-24'	debit_card_specializing
SELECT c.`Segment` FROM `customers` c JOIN `transactions_1k` t ON c.`CustomerID` = t.`CustomerID` WHERE t.`CustomerID` IN (     SELECT `CustomerID`     FROM `transactions_1k`     WHERE DATE_FORMAT(`timestamp`, '%Y-%m-%d') = '2012-08-23' ) AND DATE_FORMAT(`timestamp`, '%Y-%m-%d') = '2012-08-23'	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  JOIN customers ON transactions_1k.CustomerID = customers.CustomerID  WHERE transactions_1k.Date = '2012-08-26'  AND gasstations.Country = 'CZE'  AND transactions_1k.Time < '13:00:00'  AND customers.Currency = 'CZK';	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT `ProductID` FROM `transactions_1k` AS T1 JOIN `gasstations` AS T2 ON T1.`GasStationID` = T2.`GasStationID` WHERE T1.`Date` = '2012-08-23' AND T1.`Time` = '21:20:00';	debit_card_specializing
SELECT ym.Consumption, t.Date FROM transactions_1k t JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND STRFTIME('%Y-%m', t.Date) = '2012-08' WHERE t.Price = 124.05 UNION SELECT ym.Consumption, t.Date FROM transactions_1k t JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND STRFTIME('%Y-%m', t.Date) = '2012-01' WHERE t.Price = 124.05 LIMIT 1;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE Date = '2012-08-26'  AND Time BETWEEN '08:00:00' AND '09:00:00'  AND g.Country = 'CZE';	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE ym.Date LIKE '201306%' AND ym.Consumption = (SELECT SUM(ym.Consumption) FROM yearmonth ym WHERE ym.Date LIKE '201306%')  LIMIT 1;	debit_card_specializing
SELECT T1.Country FROM `gasstations` AS T1 JOIN `transactions_1k` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = '667467'	debit_card_specializing
SELECT T1.Country  FROM gasstations AS T1  JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T2.Date = '2012-08-24' AND T2.Price * COUNT(*) = 548.4	debit_card_specializing
SELECT      COUNT(DISTINCT t1.CustomerID) * 100.0 / (         SELECT              COUNT(DISTINCT t2.CustomerID)          FROM              transactions_1k t2          WHERE              DATE(t2.Date) = '2012-08-25'     ) AS percentage_of_customers_EUR FROM      transactions_1k t1  JOIN      customers c ON t1.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' AND DATE(t1.Date) = '2012-08-25'	debit_card_specializing
SELECT      ((t2.Consumption - t1.Consumption) / t1.Consumption) * 100 AS ConsumptionDecreaseRate FROM      transactions_1k t1 JOIN      yearmonth t2 ON t1.CustomerID = t2.CustomerID AND STRFTIME('%Y-%m', t1.Date) = '2012-08-25' JOIN      yearmonth t3 ON t2.CustomerID = t3.CustomerID AND STRFTIME('%Y-%m', t3.Date) IN ('2012-08', '2013-08') WHERE      t1.Price = 634.8 AND t3.Consumption IS NOT NULL ORDER BY      t2.Date DESC LIMIT 1	debit_card_specializing
SELECT GasStationID, SUM(Price) AS TotalRevenue FROM transactions_1k GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      COUNT(*) FILTER (WHERE Segment = 'Premium') * 100.0 / COUNT(*) AS premium_percentage FROM      gasstations WHERE      Country = 'SVK'	debit_card_specializing
SELECT SUM(t.Price) AS AmountSpent FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CustomerID = '38508';  SELECT SUM(t.Price) AS AmountSpentInJan2012 FROM transactions_1k t JOIN yearmonth ym ON t.Date = ym.Date WHERE t.CustomerID = '38508' AND ym.Date = '201201';	debit_card_specializing
SELECT p.Description AS ProductName, SUM(t.Amount) AS TotalSales FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID, p.Description ORDER BY TotalSales DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, c.Currency, AVG(t.Price) AS AveragePricePerItem, COUNT(*) OVER (PARTITION BY t.CustomerID) AS NumberOfItemsPurchased FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(t.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT T1.Country FROM `gasstations` AS T1 JOIN (     SELECT `GasStationID`, MAX(`Price`) as max_price     FROM `transactions_1k`     WHERE `ProductID` = 2     GROUP BY `GasStationID` ) AS T2 ON T1.GasStationID = T2.`GasStationID` WHERE T2.max_price = (     SELECT MAX(`Price`)     FROM `transactions_1k`     WHERE `ProductID` = 2 )	debit_card_specializing
SELECT ym.Consumption FROM transactions_1k t JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND ym.Date = '201208' WHERE t.ProductID = 5 AND t.Price / t.Amount > 29.00;	debit_card_specializing
