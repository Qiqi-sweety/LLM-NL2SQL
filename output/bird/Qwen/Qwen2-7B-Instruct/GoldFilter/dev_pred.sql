SELECT MAX(`Free Meal Count (K-12)`) / `Enrollment (K-12)` AS Highest_Free_Rate FROM `frpm` WHERE `County Name` = 'Alameda';
SELECT      Educational Option Type,      Free Meal Count (Ages 5-17) / Enrollment (Ages 5-17) AS EligibleFreeRate FROM      frpm WHERE      `Educational Option Type` = 'Traditional' ORDER BY      EligibleFreeRate ASC LIMIT 3;
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.District Name = 'Fresno County Office of Education' AND f.Charter School (Y/N) = 1; 
 SELECT MailStreet FROM schools WHERE CDSCode = (     SELECT CDSCode FROM frpm ORDER BY `FRPM Count (K-12)` DESC LIMIT 1 ) 
SELECT `schools.Phone` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `frpm.Charter School (Y/N)` = 1 AND `schools.OpenDate` > '2000-01-01' 
SELECT COUNT(*) FROM satscores ss JOIN schools sc ON ss.cds = sc.CDSCode WHERE ss.AvgScrMath > 400 AND sc.Virtual = 'F' 
SELECT `School` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `NumTstTakr` > 500 AND `Magnet` = 1; 
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 > (     SELECT MAX(Count)     FROM (         SELECT COUNT(*) AS Count         FROM satscores         WHERE NumGE1500 IS NOT NULL AND NumGE1500 > 1500         GROUP BY cds     ) AS SubQuery ) ORDER BY s.Phone DESC LIMIT 1; 
SELECT COUNT(*)  FROM satscores ss  JOIN frpm fp ON ss.cds = fp.CDSCode  WHERE fp.FRPM_Count_K_12 = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm) 
SELECT COUNT(*) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.CharterFundingType = 'Directly funded' AND satscores.AvgScrMath > 560; 
SELECT T1.FRPM_Count__Ages_5_17__ FROM frpm AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores) 
SELECT T1.CDSCode FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Enrollment (K-12) + T1.Enrollment (Ages 5-17) > 500 
SELECT MAX(`Free Meal Count (Ages 5-17)`) / MAX(`Enrollment (Ages 5-17)`) AS Highest_Free_Rate FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.NumGE1500 / satscores.NumTstTakr > 0.3 
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL AND ss.NumTstTakr > 0 ORDER BY CAST(ss.NumGE1500 AS REAL) / ss.NumTstTakr DESC LIMIT 3; 
 SELECT `NCESSchool` FROM `schools` WHERE `CDSCode` IN (     SELECT `CDSCode`     FROM `frpm`     GROUP BY `CDSCode`     ORDER BY SUM(`Enrollment (Ages 5-17)`) DESC     LIMIT 5 ) 
SELECT s.District, AVG(ss.AvgScrRead) AS AverageScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY AverageScore DESC LIMIT 1; 
SELECT COUNT(*) FROM satscores ss JOIN schools sc ON ss.cds = sc.CDSCode WHERE sc.County = 'Alameda' AND ss.NumTstTakr < 100; 
SELECT S.CDSCode, S.CharterNum FROM schools AS S JOIN satscores AS SS ON S.CDSCode = SS.cds WHERE SS.AvgScrWrite > 499 AND S.CharterNum IS NOT NULL ORDER BY SS.AvgScrWrite DESC; 
 SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.MailCity = 'Fresno'  AND frpm.CharterFundingType = 'Directly funded'  AND frpm.NumTstTakr <= 250 
SELECT T2.Phone FROM `satscores` AS T1 JOIN `schools` AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM `satscores`)
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Amador' AND frpm.LowGrade = '9' AND frpm.HighGrade = '12';
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE County_Name = 'Los Angeles' AND Free_Meal_Count_K_12 > 500 AND Free_Meal_Count_K_12 < 700 
SELECT `sname` FROM `satscores` JOIN (     SELECT `cname`, MAX(`NumTstTakr`) AS max_tests     FROM `satscores`     WHERE `cname` IN (         SELECT `cname`         FROM `satscores`         WHERE `cname` LIKE '%Contra Costa%'     )     GROUP BY `cname` ) AS max_tests_cname ON `satscores`.`cname` = max_tests_cname.`cname` AND `satscores`.`NumTstTakr` = max_tests_cname.max_tests ORDER BY `NumTstTakr` DESC LIMIT 1;
SELECT s.School, s.StreetAbr FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30; 
SELECT s.School_Name FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON f.CDSCode = ss.cds WHERE f.FreeMealCount / f.Enrollment > 0.1 AND ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 >= 1500; 
SELECT T1.CDSCode, T1.CharterFundingType  FROM frpm AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrMath > 400 AND T1.DistrictName = 'Riverside' GROUP BY T1.CDSCode, T1.CharterFundingType 
SELECT `School Name`, `Street`, `City`, `State`, `Zip` FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `School Type` = 'High Schools (Public)' AND `School Name` IN (     SELECT `School Name`     FROM `frpm`     JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`     WHERE `County` = 'Monterey' AND `Free Meal Count (Ages 5-17)` > 800 ) ORDER BY `School Name`; 
SELECT s.School, ss.AvgScrWrite, s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01' ORDER BY s.School; 
SELECT s.School, s.DOC FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE (f."Enrollment (K-12)" - f."Enrollment (Ages 5-17)") >       (         SELECT AVG(e1."Enrollment (K-12)" - e1."Enrollment (Ages 5-17)")         FROM frpm e1         WHERE e1.FundingType = 'Directly funded'       ) AND s.FundingType = 'Directly funded'; 
SELECT `OpenDate` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM `frpm`)
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Enrollment (K-12) IN (     SELECT MIN(Enrollment (K-12)) FROM frpm     ORDER BY Enrollment (K-12) ASC     LIMIT 5 ) ORDER BY T1.Enrollment (K-12) ASC LIMIT 5; 
SELECT T1.FreeMealCount / T1.Enrollment AS EligibleFreeRate FROM frpm T1 JOIN (     SELECT *     FROM frpm     ORDER BY Enrollment DESC     LIMIT 2 ) T2 ON T1.Enrollment >= T2.Enrollment WHERE T1.Enrollment IN (     SELECT Enrollment     FROM frpm     ORDER BY Enrollment DESC     LIMIT 2 OFFSET 8 ) ORDER BY T1.Enrollment DESC LIMIT 1; 
 SELECT s.SOC AS EligibleFreeOrReducedMealRate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.SOC = '66' ORDER BY f.FRPM_Count_K_12 DESC LIMIT 5 
SELECT s.Website, f.School_Name FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Free_Meal_Count_Ages_5_17 BETWEEN 1900 AND 2000; 
SELECT CAST(`Free Meal Count (Ages 5-17)` AS REAL) / `Enrollment (Ages 5-17)` AS FreeRate FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `AdmLName1` = 'Gibson' AND `AdmFName1` = 'Kacey';
SELECT s.`AdmEmail1` FROM `frpm` f JOIN `schools` s ON f.`CDSCode` = s.`CDSCode` WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` ASC LIMIT 1; 
SELECT      s.AdminFName1 || ' ' || s.AdmLName1 AS FullAdminName FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 > 0 GROUP BY      s.CDSCode, s.AdminFName1, s.AdmLName1 ORDER BY      COUNT(CASE WHEN ss.NumGE1500 >= 1500 THEN 1 END) DESC LIMIT 1; 
 SELECT s.Street, sc.City, sc.State, sc.Zip FROM schools sc JOIN satscores ss ON sc.CDSCode = ss.cds WHERE (ss.NumGE1500 / COALESCE(ss.NumTstTakr, 1)) = (     SELECT MIN((NumGE1500 / COALESCE(NumTstTakr, 1))::numeric)      FROM satscores ) 
SELECT `Website` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `County` = 'Los Angeles' AND `NumTstTakr` BETWEEN 2000 AND 3000;
SELECT AVG(T1.NumTstTakr)  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T2.County = 'Fresno' AND T2.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' 
SELECT `schools.Phone` FROM `schools` JOIN `satscores` ON `schools.CDSCode` = `satscores.cds` WHERE `schools.District` = 'Fresno Unified' ORDER BY `satscores.AvgScrRead` ASC LIMIT 1;
SELECT sc.School  FROM schools sc JOIN satscores ss ON sc.CDSCode = ss.cds WHERE sc.Virtual = 'F' AND ss.rtype = 'S' ORDER BY ss.AvgScrRead DESC LIMIT 5 PARTITION BY sc.County 
SELECT T2.EdOpsName  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores) 
SELECT AVG(`satscores`.`AvgScrMath`), `schools`.`County` FROM `satscores` JOIN `schools` ON `satscores`.`cds` = `schools`.`CDSCode` WHERE `satscores`.`AvgScrMath` IN (     SELECT `AvgScrMath`     FROM `satscores`     WHERE `AvgScrRead` IS NOT NULL AND `AvgScrWrite` IS NOT NULL     ORDER BY (`AvgScrMath` + `AvgScrRead` + `AvgScrWrite`) / 3     LIMIT 1 ) 
SELECT AVG(`AvgScrWrite`) AS avg_write_score, `schools`.`City` FROM `satscores` JOIN `schools` ON `satscores`.`cds` = `schools`.`CDSCode` WHERE `satscores`.`NumGE1500` IS NOT NULL AND `NumGE1500` >= 1500 GROUP BY `schools`.`CDSCode` ORDER BY COUNT(`NumGE1500`) DESC LIMIT 1; 
SELECT s.School, AVG(sc.AvgScrWrite) AS AverageWritingScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN (     SELECT CDSCode     FROM schools     WHERE AdmFName1 = 'Ricci' AND AdmLName1 = 'Ulrich' ) adm ON s.CDSCode = adm.CDSCode GROUP BY s.School; 
SELECT s.School FROM `frpm` frp JOIN `schools` s ON frp.CDSCode = s.CDSCode WHERE s.DOC = '31' AND frp.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM `frpm` WHERE DOC = '31') 
SELECT COUNT(*) / 12 AS "Monthly Average" FROM `schools` WHERE `County` = 'Alameda' AND `DOC` = '52' AND YEAR(`OpenDate`) = 1980; 
SELECT      (SUM(CASE WHEN `DOC` = '54' AND `County` = 'Orange' THEN 1 ELSE 0 END) / CAST(SUM(CASE WHEN `DOC` = '52' AND `County` = 'Orange' THEN 1 ELSE 0 END) AS REAL)) * 100 AS Ratio FROM      schools; 
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T1.School, T1.Street, T1.StreetAbr FROM schools AS T1 JOIN (     SELECT sname, AVG(AvgScrMath) AS avg_math_score     FROM satscores     GROUP BY sname     ORDER BY avg_math_score DESC     LIMIT 1 OFFSET 6 ) AS T2 ON T1.CDSCode = T2.sname 
SELECT `MailStreet`, `School` FROM `schools` JOIN `satscores` ON `schools`.`CDSCode` = `satscores`.`cds` WHERE `AvgScrRead` = (SELECT MIN(`AvgScrRead`) FROM `satscores`)
SELECT COUNT(*) FROM satscores ss JOIN schools sc ON ss.cds = sc.CDSCode WHERE (ss.AvgScrRead + ss.AvgScrMath + ss.AvgScrWrite) >= 1500 AND sc.MailCity = 'Lakeport' 
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.MailCity = 'Fresno'
SELECT `School`, `MailZip` FROM `schools` WHERE `AdmFName1` = 'Avetik' AND `AdmLName1` = 'Atoian';
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE MailState = 'CA' 
SELECT COUNT(*)  FROM schools  WHERE State = 'CA' AND MailCity = 'San Joaquin' AND StatusType = 'Active';
SELECT `Schools.Phone`, `Schools.Ext` FROM `Schools` JOIN `Satscores` ON `Schools.CDSCode` = `Satscores.cds` WHERE `Satscores.AvgScrWrite` = (     SELECT `AvgScrWrite`     FROM `Satscores`     ORDER BY `AvgScrWrite` DESC     LIMIT 1 OFFSET 332 ) 
SELECT `School`, `Phone`, `Ext` FROM `schools` WHERE `Zip` = '95203-3704';
SELECT Website FROM `schools` WHERE `AdmFName1` = 'Mike' AND `AdmLName1` = 'Larson' UNION SELECT Website FROM `schools` WHERE `AdmFName1` = 'Dante' AND `AdmLName1` = 'Alvarez';
SELECT `Website` FROM `schools` WHERE `County` = 'San Joaquin' AND `Charter` = 1 AND `Virtual` = 'P'; 
SELECT COUNT(*)  FROM schools  WHERE City = 'Hickman' AND Charter = 1 AND DOC = '52';
SELECT COUNT(*)  FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND s.Charter = 0 AND (f.FreeMealCount_K_12 * 100 / f.Enrollment_K_12) < 0.18 
SELECT S.School, S.City, A.AdmFName1, A.AdmLName1 FROM schools S JOIN (     SELECT `CharterNum`     FROM schools     WHERE `Charter` = 1 AND `CharterNum` = '00D2' ) C ON S.CharterNum = C.CharterNum; 
SELECT COUNT(*) FROM `schools` WHERE `MailCity` = 'Hickman' AND `CharterNum` = '00D4';
SELECT      CAST(SUM(CASE WHEN `FundingType` = 'Locally funded' AND `County` = 'Santa Clara' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN `County` = 'Santa Clara' THEN 1 END) AS Percentage FROM `schools` WHERE `County` = 'Santa Clara'; 
SELECT COUNT(*)  FROM schools  WHERE OpenDate BETWEEN '2000-01-01' AND '2005-12-31'  AND County = 'Stanislaus'  AND FundingType = 'Directly funded'; 
SELECT COUNT(*) AS total_closures FROM schools WHERE DOCType = 'Community College District' AND ClosedDate LIKE '1989%' AND City = 'San Francisco';
SELECT `County` FROM `schools` WHERE `StatusType` = 'Closed' AND `ClosedDate` BETWEEN '1980-01-01' AND '1989-12-31' AND `SOC` = '11' GROUP BY `County` ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT NCESDist FROM schools WHERE SOC = '31' 
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine' AND StatusType IN ('Active', 'Closed') AND `School` LIKE '%District Community Day%' 
SELECT T1.District Code FROM `frpm` AS T1 JOIN `schools` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.City = 'Fresno' AND T2.Magnet = 0;
SELECT COUNT(*)  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE s.City = 'Fremont' AND s.EdOpsCode = 'SSS' AND SUBSTR(f.Academic_Year, -4) = '2014'  AND SUBSTR(f.Academic_Year, -4) = '2015'; 
SELECT T1.FRPM_Count_(Ages_5_17) FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailStreet = 'PO Box 1040' AND T2.SOCType = 'Youth Authority School';
SELECT `Low Grade` FROM schools WHERE EdOpsCode = 'SPECON' AND NCESDist = '0613360';
SELECT `School`, `EILName` FROM `schools` JOIN `frpm` ON `schools.CDSCode` = `frpm.CDSCode` WHERE `frpm.NSLP Provision Status` = '01' AND `frpm.County Code` = '37' AND `frpm.`NSLP Provision Status` = 'Breakfast Provision 2';
SELECT `City` FROM `schools` WHERE `EILCode` = 'HS' AND `County` = 'Merced' AND `CDSCode` IN (     SELECT `CDSCode`     FROM `frpm`     WHERE `NSLP Provision Status` = 'Breakfast Provision 2'     AND `Low Grade` = '9'     AND `High Grade` = '12' ) 
SELECT s.School, (f.FRPM_Count / f.Enrollment * 100) AS Percent_ELIGIBLE_FRPM FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved LIKE '%K%' AND s.GSserved LIKE '%9%' 
SELECT `GSserved`, COUNT(*) AS frequency FROM schools WHERE `City` = 'Adelanto' GROUP BY `GSserved` ORDER BY frequency DESC LIMIT 1;
SELECT County, COUNT(*) AS Number_of_Schools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND `Virtual` = 'N' GROUP BY County ORDER BY Number_of_Schools DESC LIMIT 1;
SELECT `School Type`, `School Name`, `Latitude` FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE `Latitude` = (SELECT MAX(`Latitude`) FROM `schools`)
SELECT `School Name` FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `State` = 'CA' ORDER BY `schools`.`Latitude`, `Low Grade` LIMIT 1; 
SELECT GSoffered FROM schools WHERE ABS(longitude) = (SELECT MAX(ABS(longitude)) FROM schools) LIMIT 1;
SELECT COUNT(DISTINCT s.City) AS Cities, COUNT(DISTINCT frp.CDSCode) AS Schools FROM schools s JOIN frpm frp ON s.CDSCode = frp.CDSCode WHERE s.Magnet = 1 AND frp.NSLP_Provision_Status = 'Multiple Provision Types' AND s.GSoffered = 'K-8'; 
SELECT District, AdmFName1  FROM schools GROUP BY District, AdmFName1 ORDER BY COUNT(*) DESC LIMIT 2; 
SELECT T1.District Code, CAST(T2.Free Meal Count (K-12) AS REAL) / T2.Enrollment (K-12) * 100 AS Percent_Eligible_Free FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine' 
SELECT District, County, School, AdmLName1 FROM schools WHERE CharterNum = '0728' OR CharterNum = '1049';
 SELECT AdmEmail1, AdmEmail2, AdmEmail3  FROM schools  WHERE County = 'San Bernardino'  AND City = 'San Bernardino City Unified'  AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'  AND (SOC = '62' OR DOC = '54')  
SELECT `AdmEmail1` FROM `schools` WHERE `CDSCode` = (     SELECT `cds`     FROM `satscores`     WHERE `NumGE1500` IS NOT NULL AND `NumGE1500` > 0     ORDER BY `NumGE1500` DESC     LIMIT 1 ) 
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK MESICNE' AND d.A3 LIKE 'East Bohemia%' AND a.frequency = 'POPLATEK PO OBRATU';
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague'  AND account_id IN (SELECT account_id FROM loan) 
SELECT AVG(`A12`) AS avg_1995, AVG(`A13`) AS avg_1996,        CASE WHEN AVG(`A12`) > AVG(`A13`) THEN '1995' ELSE '1996' END AS higher_percentage_year FROM `district`; 
SELECT COUNT(*) FROM district d JOIN (     SELECT district_id, AVG(A11) AS avg_salary     FROM district d     JOIN client c ON d.district_id = c.district_id     WHERE c.gender = 'F' ) AS female_avg_salaries ON d.district_id = female_avg_salaries.district_id WHERE female_avg_salaries.avg_salary > 6000 AND female_avg_salaries.avg_salary < 10000; 
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000 
SELECT MIN(a.account_id) AS min_account_id,         MAX(a2.A11) - MIN(a2.A11) AS salary_gap FROM (     SELECT account_id     FROM client     WHERE gender = 'F'     ORDER BY birth_date ASC     LIMIT 1 ) AS c JOIN account AS a ON c.account_id = a.account_id JOIN (     SELECT district_id, AVG(A11) AS A11     FROM district d     JOIN client cl ON d.district_id = cl.district_id     GROUP BY district_id ) AS a2 ON a.district_id = a2.district_id 
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.birth_date IN (     SELECT birth_date     FROM client     WHERE district_id = (         SELECT district_id         FROM client         ORDER BY birth_date DESC         LIMIT 1     ) ) AND a.district_id IN (     SELECT district_id     FROM client     GROUP BY district_id     ORDER BY AVG(1.0 * `A11`) DESC     LIMIT 1 ) 
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER' 
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'DISPONENT';
SELECT a.account_id, a.frequency, a.date FROM account a JOIN (     SELECT account_id, MIN(amount) AS min_amount     FROM loan     WHERE DATE(date) BETWEEN '1997-01-01' AND '1997-12-31'     GROUP BY account_id ) l ON a.account_id = l.account_id WHERE l.min_amount = (     SELECT MIN(amount)     FROM loan     WHERE DATE(date) BETWEEN '1997-01-01' AND '1997-12-31' ) AND a.frequency = 'POPLATEK TYDNE'; 
SELECT l.account_id FROM loan l JOIN disp d ON l.account_id = d.account_id WHERE l.duration > 12 AND YEAR(l.date) = 1993 ORDER BY l.amount DESC LIMIT 1; 
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.A2 = 'Sokolov' 
SELECT account_id FROM trans WHERE date = '1995-01-01' ORDER BY date ASC LIMIT 1; 
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' GROUP BY a.account_id HAVING SUM(CASE WHEN t.amount > 3000 THEN t.amount ELSE 0 END) > 0; 
SELECT `client.client_id` FROM `client` JOIN `disp` ON `client.client_id` = `disp.client_id` JOIN `card` ON `disp.disp_id` = `card.disp_id` WHERE `card.issued` = '1994-03-03'
SELECT t.date  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount = 840 AND t.date = '1998-10-14'
SELECT T1.district_id FROM `account` AS T1  JOIN `loan` AS T2 ON T1.account_id = T2.account_id  WHERE T2.date BETWEEN '1994-08-25' AND '1994-08-25' 
SELECT MAX(amount)  FROM trans  WHERE account_id IN (     SELECT account_id      FROM account      WHERE date >= '1996-10-21' AND date <= '1996-10-21' )
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND d.A11 = (SELECT MAX(A11) FROM district) 
SELECT T1.amount FROM trans AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = (SELECT MAX(amount) FROM loan) AND T1.date > (SELECT date FROM loan WHERE account_id = T1.account_id ORDER BY date LIMIT 1)
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';
SELECT disp.disp_id FROM disp JOIN account ON disp.account_id = account.account_id JOIN trans ON disp.account_id = trans.account_id WHERE trans.amount = 5100 AND DATE(trans.date) = '1998-09-02'
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date LIKE '1996-%'
SELECT T1.A2  FROM district AS T1  JOIN client AS T2 ON T1.district_id = T2.district_id  WHERE T2.gender = 'F' AND T2.birth_date = '1976-01-29' 
SELECT c.birth_date FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = 98832 AND YEAR(l.date) = 1996 AND MONTH(l.date) = 1 AND DAY(l.date) = 3; 
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Prague' ORDER BY account.date ASC LIMIT 1;
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN c.client_id END) * 100.0 / COUNT(c.client_id)) AS male_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'south Bohemia' 
SELECT      c.client_id,      ((t2.balance - t1.balance) / t1.balance) * 100 AS increase_rate FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id JOIN      trans t1 ON a.account_id = t1.account_id AND t1.date <= '1993-07-05' JOIN      trans t2 ON a.account_id = t2.account_id AND t2.date >= '1998-12-27' WHERE      a.date = '1993-07-05' AND      EXISTS (         SELECT 1 FROM loan l WHERE l.account_id = a.account_id AND l.status = 'A' AND l.date <= '1993-07-05'     ) ORDER BY      l.date ASC LIMIT 1; 
SELECT      ((SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / CAST(SUM(amount) AS REAL)) * 100) AS percentage_of_loan_paid_with_no_issue FROM      loan; 
SELECT      ((SELECT COUNT(*) FROM loan WHERE amount < 100000 AND status = 'C')       / (SELECT COUNT(*) FROM loan WHERE amount < 100000)) * 100 AS percentage_of_accounts 
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date = '1993-02-26' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND d.A3 = 'east Bohemia'; 
SELECT `account_id`, `date` FROM `account` JOIN `district` ON `account.district_id` = `district.district_id` WHERE `district.A2` = 'Prachatice'
SELECT d.A2 AS District, d.A3 AS Region FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;
SELECT a.account_id, d.A2 AS district, COALESCE(r.A3, 'Unknown') AS region FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id JOIN (     SELECT district_id, MAX(amount) AS max_amount     FROM loan     GROUP BY district_id ) l_max ON l.amount > l_max.max_amount AND l.account_id = l_max.account_id LEFT JOIN (     SELECT district_id, A3     FROM district ) r ON d.district_id = r.district_id WHERE l.amount > 300000 
SELECT      l.loan_id,      d.A3 AS district,      d.A11 AS average_salary FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      district d ON a.district_id = d.district_id WHERE      l.duration = 60; 
SELECT D.district_id, D.A13 - D.A12 AS unemployment_increment_rate FROM district D JOIN account A ON D.district_id = A.district_id JOIN loan L ON A.account_id = L.account_id WHERE L.status = 'D' AND A.status = 'in_debt'; 
SELECT      (COUNT(*) FILTER (WHERE T1.A2 = 'Decin') * 100.0 / COUNT(T2.account_id)) AS percentage FROM      district AS T1 JOIN      account AS T2 ON T1.district_id = T2.district_id WHERE      T2.date LIKE '1993-%' 
SELECT account_id FROM account WHERE account_id IN (     SELECT account_id     FROM (         SELECT account_id, COUNT(*) AS statement_count         FROM (             SELECT account_id, DATE_TRUNC('month', transaction_date) AS month             FROM transactions         ) t         GROUP BY account_id, month     ) m     WHERE statement_count = MONTHS_BETWEEN(CURRENT_DATE, LEAD(CURRENT_DATE, 1, CURRENT_DATE + INTERVAL 1 MONTH) OVER (PARTITION BY account_id ORDER BY month)) + 1 );
SELECT T3.A2, COUNT(T1.account_id) AS female_account_count FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T2.gender = 'F' GROUP BY T3.A2 ORDER BY female_account_count DESC LIMIT 9; 
SELECT d.A2 AS DistrictName, COUNT(t.account_id) AS WithdrawalsCount FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.district_id ORDER BY WithdrawalsCount DESC LIMIT 10; 
SELECT COUNT(DISTINCT d.account_id)  FROM district d  JOIN client c ON d.district_id = c.district_id  JOIN disp p ON c.client_id = p.client_id  WHERE d.A3 LIKE '%South Bohemia%' AND p.type != 'OWNER'
SELECT D.A3 AS DistrictName, COUNT(*) AS ActiveLoansCount FROM district D JOIN account A ON D.district_id = A.district_id JOIN loan L ON A.account_id = L.account_id WHERE L.status = 'C' OR L.status = 'D' GROUP BY D.district_id, D.A3 ORDER BY ActiveLoansCount DESC LIMIT 1; 
SELECT AVG(loan.amount)  FROM loan  JOIN account ON loan.account_id = account.account_id  JOIN client ON account.district_id = client.district_id  WHERE client.gender = 'M' 
SELECT T1.A2, T1.district_id FROM district AS T1 WHERE T1.A13 = (SELECT MAX(A13) FROM district) 
SELECT COUNT(*)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A16 = (SELECT MAX(A16) FROM district) 
SELECT COUNT(*)  FROM `account` a JOIN `trans` t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND t.balance < 0; 
SELECT COUNT(*)  FROM (     SELECT DISTINCT `account_id`     FROM `account`     WHERE `date` BETWEEN '1995-01-01' AND '1997-12-31'     AND `frequency` = 'POPLATEK MESICNE' ) AS monthly_accounts JOIN `loan` ON monthly_accounts.account_id = `loan`.account_id WHERE `loan`.amount >= 250000; 
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id JOIN district ON account.district_id = district.district_id WHERE district.district_id = 1 AND (loan.status = 'C' OR loan.status = 'D') 
SELECT COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'M' AND d.A15 =  (SELECT MAX(A15)   FROM district   WHERE district_id <>       (SELECT district_id        FROM district        ORDER BY A15 DESC        LIMIT 1)) 
SELECT COUNT(*)  FROM card  JOIN disp ON card.card_id = disp.disp_id  JOIN client ON disp.client_id = client.client_id  WHERE card.type = 'gold' AND disp.type = 'OWNER';
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek');
SELECT DISTINCT d.district_id FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount > 10000 AND t.date LIKE '1997-%' 
SELECT account_id FROM `account` JOIN `district` ON `account`.district_id = `district`.district_id JOIN `trans` ON `account`.account_id = `trans`.account_id WHERE `trans`.k_symbol = 'SIPO' AND `district`.A2 = 'Pisek';
SELECT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.card_id = card.card_id WHERE card.type = 'gold';
SELECT AVG(amount) AS avg_credit_card_amount FROM trans WHERE operation = 'VYBER KARTOU' AND date >= '2021-01-01' AND date < '2022-01-01' 
SELECT T1.account_id FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount < (     SELECT AVG(amount)     FROM trans     WHERE strftime('%Y', date) = '1998' ) AND T2.type = 'VYBER KARTOU'; 
SELECT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F'; 
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A3 LIKE '%south Bohemia%'
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp b ON a.account_id = b.account_id WHERE d.A2 = 'Tabor' AND b.type = 'OWNER' 
SELECT DISTINCT d.type, AVG(CASE WHEN d.A11 BETWEEN 8000 AND 9000 THEN d.A11 ELSE NULL END) AS avg_income FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp p ON a.account_id = p.account_id WHERE p.type = 'OWNER' GROUP BY a.account_id; 
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  JOIN trans ON account.account_id = trans.account_id  WHERE district.A3 LIKE 'North Bohemia' AND trans.bank = 'AB' 
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ' 
SELECT AVG(A15) AS AverageCrimes1995 FROM (     SELECT d.A15, dis.A15     FROM district d     JOIN account a ON d.district_id = a.district_id     JOIN district dis ON d.district_id = dis.district_id     WHERE a.date BETWEEN '1997-01-01' AND '1997-12-31'       AND d.A15 > 4000 ) AS subquery WHERE dis.A15 IS NOT NULL; 
SELECT COUNT(*)  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  WHERE c.type = 'classic' AND d.type = 'OWNER' 
SELECT COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A2 = 'Hl.m. Praha' AND c.gender = 'M'; 
SELECT      (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) * 100.0 / COUNT(*)) AS gold_card_percentage FROM      card; 
SELECT c.client_name FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN (     SELECT account_id, MAX(amount) AS max_amount     FROM loan     GROUP BY account_id ) l ON a.account_id = l.account_id AND a.account_id = d.account_id WHERE d.type = 'OWNER' AND l.max_amount = a.amount;
SELECT T3.A15 FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.account_id = 532
SELECT T1.district_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333;
SELECT * FROM `trans` WHERE `trans_id` IN (     SELECT `trans_id` FROM `trans`     WHERE `account_id` IN (         SELECT `account_id` FROM `disp`         WHERE `client_id` = 3356     )     AND `operation` = 'VYBER' )
SELECT COUNT(*)  FROM account  JOIN loan ON account.account_id = loan.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000; 
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN client cl ON d.client_id = cl.client_id WHERE cl.client_id = 13539;
SELECT T2.A3 FROM `client` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541;
SELECT T1.district_id FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.district_id ORDER BY COUNT(T2.account_id) DESC LIMIT 1; 
SELECT account_id FROM order WHERE order_id = 32423;
SELECT T2.trans_id FROM `account` AS T1 JOIN `trans` AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = 5;
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik');
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE cr.type = 'junior' AND cr.issued >= '1997-01-01' 
SELECT      (COUNT(CASE WHEN T1.gender = 'F' THEN 1 END) * 100.0 / COUNT(T1.client_id)) AS percentage FROM      client AS T1 JOIN      district AS T2 ON T1.district_id = T2.district_id WHERE      T2.A11 > 10000 
SELECT      ((SUM(amount WHERE date BETWEEN '1996-01-01' AND '1996-12-31')       - SUM(amount WHERE date BETWEEN '1997-01-01' AND '1997-12-31'))      / SUM(amount WHERE date BETWEEN '1996-01-01' AND '1996-12-31')) * 100 AS growth_rate FROM      loan WHERE      client_id IN (         SELECT client_id FROM client WHERE gender = 'M'     ); 
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31' 
SELECT ABS((SELECT SUM(`A16`) FROM `district` WHERE `A3`='North Bohemia') - (SELECT SUM(`A16`) FROM `district` WHERE `A3`='East Bohemia')) AS Crime_Difference_1996;
SELECT      SUM(CASE WHEN type = 'OWNER' THEN 1 ELSE 0 END) AS owner_count,     SUM(CASE WHEN type = 'DISPONENT' THEN 1 ELSE 0 END) AS disponte_count FROM      disp WHERE      account_id BETWEEN 1 AND 10; 
SELECT `frequency` FROM `account` WHERE `account_id` = 3;  SELECT SUM(amount) FROM `order` WHERE `account_id` = 3 AND `k_symbol` = 'debit' AND amount = 3539; 
SELECT T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.account_id = 130;
SELECT COUNT(*) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND d.type = 'OWNER'; 
SELECT l.amount, COUNT(l.status) AS payment_status_count FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.account_id = c.client_id WHERE c.client_id = 992 GROUP BY l.amount, l.status; 
SELECT SUM(trans.balance) AS total_sum, client.gender FROM trans JOIN account ON trans.account_id = account.account_id JOIN client ON account.district_id = client.district_id WHERE trans.trans_id = 851 AND client.client_id = 4 
SELECT T1.type FROM `card` AS T1 JOIN `disp` AS T2 ON T1.disp_id = T2.disp_id JOIN `client` AS T3 ON T2.client_id = T3.client_id WHERE T3.client_id = 9;
SELECT SUM(amount) AS total_paid FROM trans JOIN account ON trans.account_id = account.account_id JOIN client ON account.district_id = client.district_id WHERE client.client_id = 617 AND EXTRACT(YEAR FROM date) = 1998;
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'East Bohemia'; 
SELECT c.client_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3; 
SELECT COUNT(*)  FROM client  JOIN account ON client.district_id = account.district_id  JOIN trans ON account.account_id = trans.account_id  WHERE client.gender = 'M'  AND YEAR(trans.amount) > 1974 AND YEAR(trans.amount) < 1977  AND trans.amount > 4000 
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > '1996-12-31';
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN card ON disp.disp_id = card.disp_id  WHERE client.gender = 'F' AND card.type = 'junior'; 
SELECT      CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) AS percentage_female FROM      client AS T1 JOIN      district AS T2 ON T1.district_id = T2.district_id WHERE      T2.A3 = 'Prague'; 
SELECT      CAST(SUM(CASE WHEN T1.gender = 'M' AND T2.frequency = 'POPLATEK TYDNE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.frequency) FROM      client AS T1 JOIN      account AS T2 ON T1.district_id = T2.district_id WHERE      T2.frequency = 'POPLATEK TYDNE' 
SELECT COUNT(*)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 24 AND T1.date < '1997-01-01' ORDER BY T2.amount ASC LIMIT 1; 
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'F' ORDER BY c.birth_date ASC, a.A11 ASC LIMIT 1; 
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A3 LIKE '%East Bohemia%' AND YEAR(client.birth_date) = 1920;
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24; 
SELECT AVG(loan.payments) AS avg_loan_amount FROM loan JOIN account ON loan.account_id = account.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND loan.status IN ('C', 'D') 
SELECT a.account_id, d.A2  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN disp b ON a.account_id = b.account_id  WHERE b.type IN ('OWNER') 
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE cr.type = 'gold' AND d.type = 'OWNER'; 
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '-' AND a.element = 'cl' 
SELECT AVG(CASE WHEN `bond`.`bond_type` = '-' THEN 1 ELSE 0 END) * COUNT(*) / COUNT(DISTINCT `atom`.molecule_id) AS avg_oxygen_atoms FROM `atom` JOIN `bond` ON `atom`.`molecule_id` = `bond`.`molecule_id` WHERE `atom`.`element` = 'O' 
SELECT AVG(COUNT(bond.molecule_id))  FROM (     SELECT molecule_id      FROM bond      WHERE bond_type = '-'  ) AS single_bonded_atoms, atom  WHERE atom.molecule_id = single_bonded_atoms.molecule_id AND        atom.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') 
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '-' AND a.element = 'na'; 
SELECT `molecule.molecule_id` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `bond.bond_type` = '#' AND `molecule.label` = '+';
SELECT CAST(SUM(CASE WHEN atom.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom.atom_id)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  JOIN bond ON molecule.molecule_id = bond.molecule_id  WHERE bond.bond_type = '='; 
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#' AND `bond_type` IS NOT NULL;
SELECT COUNT(*) FROM atom WHERE element != 'br'; 
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+'; 
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' 
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR004_8_9' GROUP BY atom.element; 
SELECT DISTINCT atom.element  FROM atom  JOIN bond ON atom.atom_id = bond.molecule_id  WHERE bond.bond_type = '=';
SELECT m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'h'  GROUP BY m.label  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'cl'
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'; 
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-' 
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8') 
SELECT DISTINCT m.label  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element != 'sn' AND m.label = '+' 
SELECT COUNT(DISTINCT atom.atom_id)  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE atom.element = 'i' OR atom.element = 's'  AND bond.bond_type = '-' 
SELECT DISTINCT atom_id, atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN atom am ON c.atom_id2 = am.atom_id OR c.atom_id = am.atom_id WHERE am.molecule_id = 'TR181'; 
SELECT      (SUM(CASE WHEN element <> 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT molecule_id)) AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+' AND a.element IS NOT NULL 
SELECT      (SUM(CASE WHEN `bond_type` = '#' THEN 1 ELSE 0 END) * 100 / COUNT(`bond_id`)) AS percent FROM      `bond` JOIN      `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE      `molecule.label` = '+'; 
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3; 
SELECT T1.atom_id FROM `atom` AS T1 JOIN `bond` AS T2 ON T1.atom_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_6' AND T2.molecule_id = 'TR001'
SELECT      (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM      molecule; 
SELECT T1.atom_id FROM `connected` AS T1 JOIN `bond` AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT `molecule_id` FROM `bond` WHERE `bond_type` = '=' GROUP BY `molecule_id` ORDER BY `molecule_id` LIMIT 5; 
SELECT CAST(SUM(CASE WHEN T1.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN `label` = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`molecule_id`) AS percent FROM `molecule`;
SELECT      CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) * 100.0 / COUNT(atom_id) AS REAL) AS hydrogen_percentage FROM      atom WHERE      molecule_id = 'TR206'; 
SELECT `bond_type` FROM `bond` WHERE `molecule_id` = 'TR000' 
SELECT atom.element, molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id = 'TR060'; 
SELECT T3.bond_type FROM (     SELECT T2.bond_type, COUNT(T2.bond_type) AS count_bond_type     FROM (         SELECT * FROM molecule WHERE molecule_id = 'TR010'     ) AS T1     JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id     GROUP BY T2.bond_type     ORDER BY count_bond_type DESC     LIMIT 1 ) AS T3 JOIN molecule ON T1.molecule_id = 'TR010' AND T3.bond_type = T2.label WHERE T2.label = '+' 
 SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-' ORDER BY T1.molecule_id LIMIT 3; 
SELECT b.bond_id  FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.molecule_id = 'TR006' ORDER BY b.bond_id LIMIT 2; 
SELECT COUNT(DISTINCT T1.bond_id)  FROM bond AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id  WHERE T3.molecule_id = 'TR009'  AND (T2.atom_id = 'TR009_12' OR T2.atom_id2 = 'TR009_12') 
SELECT COUNT(DISTINCT t1.molecule_id)  FROM atom t1  JOIN molecule t2 ON t1.molecule_id = t2.molecule_id  WHERE t2.label = '+' AND t1.element = 'br' 
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR001_6_9' 
SELECT m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR001_10'; 
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#'; 
SELECT COUNT(*)  FROM connected  WHERE atom_id LIKE 'TR%_19' 
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR004' 
SELECT COUNT(*) FROM `molecule` WHERE `label` = '-'
SELECT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T2.label = '+'; 
SELECT T2.bond_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'p' OR T1.element = 'n' AND T2.bond_id IS NOT NULL;
SELECT COUNT(*) AS double_bond_count, m.label  FROM `bond` b  JOIN `molecule` m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '=' AND m.label = '+' GROUP BY m.label  ORDER BY double_bond_count DESC  LIMIT 1; 
SELECT AVG(COUNT(connected.bond_id) / COUNT(DISTINCT connected.atom_id)) FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'i'; 
SELECT      COALESCE(bond_type, '#') AS bond_type,     CASE          WHEN SUBSTR(atom_id, 7, 2) + 0 = 45 THEN bond_id         ELSE NULL     END AS bond_id FROM      connected c JOIN      bond b ON c.bond_id = b.bond_id WHERE      SUBSTR(c.atom_id, 7, 2) + 0 = 45 
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected) 
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T3.bond_type = '#' AND T4.molecule_id = 'TR041';
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'; 
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_type) DESC LIMIT 1 
SELECT atom.element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'  GROUP BY atom.element  ORDER BY COUNT(*) ASC  LIMIT 1; 
SELECT DISTINCT c.atom_id FROM `atom` a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element = 'pb' AND (a.element IS NOT NULL) AND EXISTS (     SELECT 1 FROM `atom` a2 WHERE a2.element = 'pb' ) AND NOT EXISTS (     SELECT 1 FROM `atom` a3 WHERE a3.element = 'pb' AND a3.atom_id = c.atom_id OR a3.atom_id = c.atom_id2 ) AND c.atom_id <> c.atom_id2;
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#' 
SELECT      CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id)  FROM      (SELECT DISTINCT atom_id FROM connected) T1  JOIN      bond T2 ON T1.atom_id IN (SELECT atom_id FROM connected WHERE bond_id LIKE 'TR000_%')  GROUP BY      T2.bond_type  ORDER BY      COUNT(T1.atom_id) DESC  LIMIT 1; 
SELECT      CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(T2.bond_id) AS REAL) AS proportion FROM      molecule AS T1 JOIN      bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.bond_type = '-' AND T1.label = '+';
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h') 
SELECT T2.atom_id2 FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'
SELECT T3.bond_type FROM `atom` AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 'sn'
SELECT COUNT(DISTINCT atom.element)  FROM atom  JOIN bond ON atom.molecule_id = bond.molecule_id  WHERE bond.bond_type = '-' 
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br') 
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'
SELECT `molecule.molecule_id` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `bond.bond_type` = '-' AND `molecule.label` = '-'
SELECT      (SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) / COUNT(T1.atom_id)) * 100 AS percent FROM      atom T1 JOIN      bond T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.bond_type = '-' AND T1.molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-') 
SELECT `molecule_id`, `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002')
SELECT `molecule_id` FROM `molecule` WHERE `label` = '-';
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';
SELECT      T1.molecule_id,      CASE          WHEN T2.bond_type = '-' THEN 'single bond'         WHEN T2.bond_type = '=' THEN 'double bond'         WHEN T2.bond_type = '#' THEN 'triple bond'         ELSE 'unknown bond type'     END AS bond_type FROM      molecule AS T1 JOIN      bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T1.molecule_id BETWEEN 'TR000' AND 'TR050' ORDER BY      T1.molecule_id; 
SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' GROUP BY T1.element;
SELECT COUNT(*) FROM `bond` b JOIN `atom` a ON b.`molecule_id` = a.`molecule_id` WHERE a.element = 'i' AND b.`bond_id` IN (     SELECT `bond_id` FROM `atom` WHERE element = 'i' )
SELECT      m.label  FROM      atom a  JOIN      molecule m ON a.molecule_id = m.molecule_id  WHERE      a.element = 'ca'  GROUP BY      m.label  ORDER BY      COUNT(*) DESC  LIMIT 1; 
SELECT c.atom_id2, a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR001_1_8' AND (a.element = 'cl' OR a.element = 'c') GROUP BY c.atom_id2, a.element HAVING COUNT(DISTINCT a.element) = 2 
SELECT T1.molecule_id FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `bond` AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element = 'c' AND T3.bond_type = '#' AND T1.label = '-' LIMIT 2; 
SELECT CAST(SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom.molecule_id) AS percentage FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+'; 
SELECT DISTINCT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR001'; 
SELECT `molecule_id` FROM `bond` WHERE `bond_type` = ' = ';
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' 
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR000_1_2'
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '-' AND `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '-') 
SELECT `molecule`.`label` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `bond.bond_id` = 'TR001_10_11';
SELECT T1.bond_id, T3.label  FROM bond AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id  WHERE T1.bond_type = '#' AND T3.label = '+' 
SELECT atom.element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+' AND SUBSTR(atom.atom_id, 7, 1) = '4' 
SELECT      '+' AS label,     CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element) AS ratio FROM      atom AS T1 JOIN      molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.molecule_id = 'TR006' 
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca' AND m.label = '+' 
SELECT T3.bond_type  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN bond AS T3 ON T1.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'c'))) AND T1.molecule_id = T3.molecule_id  WHERE T1.element = 'c'  AND T3.bond_type IN ('-', '=', '#'); 
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_10_11' ORDER BY T1.element; 
SELECT CAST(SUM(CASE WHEN `bond_type` = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`bond_id`) FROM `bond`; 
SELECT      CAST(SUM(CASE WHEN `bond_type` = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`bond_id`) AS percent FROM      `bond` WHERE      `molecule_id` = 'TR047'; 
SELECT COUNT(*) FROM `atom` a JOIN `molecule` m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1' AND m.label = '+'; 
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` = 'TR151';
SELECT atom.element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR151' 
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+';
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id LIKE 'TR%' AND SUBSTR(molecule.molecule_id, 3, 3) BETWEEN 10 AND 50 AND atom.element = 'c'; 
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+'; 
SELECT `bond.bond_id` FROM `bond` JOIN `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE `bond.bond_type` = '=' AND `molecule.label` = '+';
SELECT COUNT(*) FROM atom WHERE element = 'h' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') 
SELECT T3.molecule_id FROM `bond` AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T2.atom_id = 'TR000_1' AND T3.atom_id IN (SELECT atom_id FROM `atom` WHERE atom_id = 'TR000_1_2') AND T3.molecule_id IS NOT NULL;
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-' 
SELECT      CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id)  FROM      molecule AS T1  JOIN      atom AS T2  ON      T1.molecule_id = T2.molecule_id; 
SELECT label FROM molecule WHERE molecule_id = 'TR124';
SELECT atom.atom_id  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR186' 
SELECT bond_type FROM `bond` WHERE `bond_id` = 'TR007_4_19'
SELECT atom.element FROM connected JOIN atom ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_2_4' 
SELECT COUNT(*) AS double_bonds_count,         COALESCE(molecule.label, '-') AS carcinogenicity FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_id LIKE 'TR006_%' AND bond.bond_type = '='; 
SELECT m.molecule_id, m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT DISTINCT b.bond_id, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-'; 
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element ORDER BY a.element ASC SEPARATOR ', ') AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' GROUP BY m.molecule_id HAVING COUNT(*) = 3 AND MAX(LENGTH(a.element)) > 1; 
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_2_3'; 
SELECT COUNT(*)  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'cl' 
SELECT atom.atom_id, COUNT(DISTINCT bond.bond_type) AS bond_types_count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR346' 
SELECT COUNT(*) AS num_molecules_with_double_bond_and_carcinogenic FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+'; 
SELECT COUNT(DISTINCT molecule_id)  FROM atom  WHERE element <> 's'  AND NOT EXISTS (     SELECT 1 FROM bond WHERE molecule_id = atom.molecule_id AND bond_type = '=' ) 
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '-';
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'; 
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-' 
SELECT      CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.element = 'cl'; 
SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_1_7' AND T1.molecule_id IS NOT NULL GROUP BY T1.molecule_id HAVING COUNT(*) > 0;
SELECT COUNT(DISTINCT CASE WHEN a.element IS NOT NULL THEN a.element ELSE '' END) FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_3_4';
SELECT T3.bond_type FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T1.bond_id WHERE (T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1') 
SELECT M.molecule_id  FROM bond B  JOIN connected C ON B.bond_id = C.bond_id  JOIN atom A ON A.atom_id = C.atom_id  JOIN molecule M ON M.molecule_id = B.molecule_id  WHERE A.atom_id IN ('TR000_2', 'TR000_4')  AND A.atom_id2 IN ('TR000_2', 'TR000_4') GROUP BY M.molecule_id HAVING COUNT(*) = 2; 
SELECT element FROM `atom` WHERE atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000'
SELECT      (SUM(CASE WHEN `bond_type` = '-' THEN 1 ELSE 0 END) * 100.0 / COUNT(`bond_id`)) AS percentage FROM `bond` 
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'n' AND m.label = '+'; 
SELECT `molecule_id` FROM `atom` JOIN `bond` ON `atom.molecule_id` = `bond.molecule_id` WHERE `element` = 's' AND `bond.bond_type` = '=';
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5 AND m.label = '-' 
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.bond_type = '-' AND T1.element IN ('Cl', 'C', 'H', 'O', 'S', 'N', 'P', 'Na', 'Br', 'F', 'I', 'Sn', 'Pb', 'Te', 'Ca') AND T2.molecule_id = 'TR024' GROUP BY T1.element HAVING COUNT(T1.element) > 1 
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1; 
SELECT      CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM      atom AS T1 JOIN      bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN      molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE      T1.element = 'h' AND T2.bond_type = '#' AND T3.label = '+' 
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT COUNT(*) FROM `bond`  JOIN `molecule` ON `bond`.molecule_id = `molecule`.molecule_id  WHERE `molecule`.molecule_id BETWEEN 'TR004' AND 'TR010' AND `bond`.bond_type = '-'; 
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c'; 
SELECT T1.element  FROM `atom` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-' 
SELECT COUNT(DISTINCT mol.molecule_id)  FROM atom mol_atm  JOIN molecule mol ON mol.molecule_id = mol_atm.molecule_id  JOIN bond mol_bnd ON mol.molecule_id = mol_bnd.molecule_id  WHERE mol_atm.element = 'o' AND mol_bnd.bond_type = '='; 
SELECT COUNT(*)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND m.label = '-' 
SELECT T1.element, T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR002' UNION SELECT T1.element, 'Molecular Structure' FROM atom AS T1 JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T4.molecule_id = 'TR002' AND T1.element IS NOT NULL; 
SELECT `atom.atom_id` FROM `atom` JOIN `molecule` ON `atom.molecule_id` = `molecule.molecule_id` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `atom.element` = 'c' AND `bond.bond_type` = ' =' AND `molecule.molecule_id` = 'TR012'
SELECT T1.atom_id FROM `atom` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT id FROM cards WHERE borderColor = 'black' AND cardKingdomId IS NULL; 
SELECT name FROM cards WHERE faceConvertedManaCost IS NOT NULL ORDER BY faceConvertedManaCost DESC; 
SELECT id FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned'; 
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.types LIKE '%Artifact%' AND cards.side IS NULL AND legalities.format = 'vintage'
SELECT cards.id, cards.artist  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE cards.power = '*' OR cards.power IS NULL  AND legalities.format = 'commander'  AND legalities.status = 'Legal'; 
SELECT c.id FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 0 AND EXISTS (     SELECT 1 FROM cards c2 WHERE c2.artist = 'Stephen Daniele' AND c2.hasContentWarning = 1 ); 
SELECT r.text  FROM rulings AS r  JOIN cards AS c ON r.uuid = c.uuid  WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'; 
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid HAVING COUNT(r.uuid) = (     SELECT MAX(totalCount)     FROM (         SELECT COUNT(uuid) AS totalCount         FROM rulings         GROUP BY uuid     ) t ) LIMIT 1; 
SELECT foreign_data.language  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.name = 'Annul' AND cards.number = '29'; 
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese' 
SELECT      (SUM(CASE WHEN f.language = 'Chinese Simplified' THEN c.id ELSE 0 END) * 100.0 / COUNT(c.id)) AS percentage FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid WHERE      f.language = 'Chinese Simplified'; 
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' ORDER BY s.name; 
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'Aaron Boyd' AND `type` IS NOT NULL;
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(*) FROM cards WHERE power = '*' ;
SELECT promoTypes FROM cards WHERE name = 'Duress';
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';
SELECT `originalType` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';
SELECT T3.language  FROM cards AS T1  JOIN set_translations AS T3 ON T1.id = T3.id  WHERE T1.name = 'Angel of Mercy' 
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted' AND c.isTextless = 0; 
SELECT r.text FROM rulings AS r WHERE r.uuid IN (SELECT c.uuid FROM cards AS c WHERE c.name = 'Condemn')
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted' AND c.isStarter = 1; 
SELECT `status` FROM `legalities` JOIN `cards` ON `legalities`.`uuid` = `cards`.`uuid` WHERE `cards`.`name` = 'Aven Cloudchaser'
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight';
SELECT `format` FROM `legalities` JOIN `cards` ON `legalities`.`uuid` = `cards`.`uuid` WHERE `cards`.`name` = 'Benalish Knight';
SELECT `artist` FROM `cards` JOIN `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` WHERE `language` = 'Phyrexian';
SELECT CAST(SUM(CASE WHEN `borderColor` = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`id`) FROM `cards`; 
SELECT COUNT(*)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.isReprint = 1 AND fd.language = 'German'; 
SELECT COUNT(*)  FROM `cards` c  JOIN `foreign_data` fd ON c.uuid = fd.uuid  WHERE c.borderColor != 'borderless' AND fd.language = 'Russian';
SELECT      CAST(COUNT(CASE WHEN T2.language = 'French' THEN T1.id ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN T1.isStorySpotlight = 1 THEN T1.id ELSE NULL END) AS percentage FROM      cards AS T1 JOIN      foreign_data AS T2 ON T1.uuid = T2.uuid WHERE      T1.isStorySpotlight = 1 
SELECT COUNT(*) FROM cards WHERE toughness = '99';
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'; 
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT `layout` FROM `cards` WHERE `keywords` = 'Flying' 
SELECT COUNT(*) FROM `cards` WHERE `originalType` LIKE '%Summon - Angel%' AND `subtypes` NOT LIKE '%Angel%'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL 
SELECT id FROM cards WHERE duelDeck = 'a';
SELECT `edhrecRank` FROM `cards` WHERE `frameVersion` = '2015';
SELECT `artist` FROM `cards` WHERE `uuid` IN (SELECT `uuid` FROM `foreign_data` WHERE `language` = 'Chinese Simplified');
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese';
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'Banned' AND cards.borderColor = 'white' 
SELECT c.uuid, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.uuid IN (     SELECT uuid FROM legalities WHERE format = 'legacy' ) 
SELECT `text` FROM `rulings` WHERE `uuid` = (SELECT `uuid` FROM `cards` WHERE `name` = 'Beacon of Immortality');
SELECT COUNT(*) AS future_card_count, 'legal' AS legality_status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' AND legalities.status = 'legal'; 
SELECT c.colors FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.setCode = 'OGW' 
SELECT c.id, c.convertedManaCost, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.convertedManaCost = 5 AND c.setCode = '10E' 
SELECT c.originalType, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf'; 
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20 
SELECT `name` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.colors` = 'B' AND `cards.originalType` = 'Artifact';
SELECT name  FROM cards  JOIN rulings ON cards.uuid = rulings.uuid  WHERE rarity = 'uncommon'  ORDER BY date ASC  LIMIT 3; 
SELECT COUNT(*)  FROM cards c  JOIN (     SELECT `cardKingdomFoilId`     FROM cards      WHERE `artist` = 'John Avon' ) cf ON c.cardKingdomFoilId = cf.`cardKingdomFoilId`  WHERE cf.`cardKingdomFoilId` IS NOT NULL 
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*)  FROM cards  WHERE artist LIKE 'UDON'  AND type = 'availability = \'mtgo\''  AND hand = -1; 
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;
SELECT `manaCost` FROM `cards` WHERE `layout` = 'normal' AND `frameVersion` = '2003' AND `borderColor` = 'black' AND `availability` = 'mtgo,paper';
SELECT SUM(T1.unconvertedManaCost)  FROM cards AS T1  JOIN PRAGMA_TABLE_INFO('cards') AS T2 ON T1.id = T2.id  WHERE T2.name = 'artist' AND T1.artist = 'Rob Alexander';
SELECT DISTINCT      CASE WHEN `availability` = 'arena' THEN `subtypes` ELSE NULL END AS subtypes,     CASE WHEN `availability` = 'arena' THEN `supertypes` ELSE NULL END AS supertypes FROM cards WHERE `availability` LIKE '%arena%' 
SELECT `setCode` FROM `set_translations` WHERE `language` = 'Spanish';
SELECT CAST(SUM(CASE WHEN `isOnlineOnly` = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM `cards` WHERE `frameEffects` = 'legendary' 
SELECT id  FROM cards  WHERE isStorylight = 1 AND isTextless = 0; 
SELECT      `name`,     (COUNT(CASE WHEN `language` = 'Spanish' THEN 1 END) * 100.0 / COUNT(`language`)) AS percentage FROM      `foreign_data` ORDER BY      `name`; 
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309; 
SELECT COUNT(*) FROM `sets` s JOIN `set_translations` st ON s.id = st.id WHERE s.block = 'Commander' AND s.code IS NOT NULL AND st.language = 'Portuguese (Brasil)' AND s.block = st.setCode;
SELECT `cards`.id  FROM `cards` JOIN `legalities` ON `cards.uuid` = `legalities.uuid` WHERE `cards.types` = 'Creature' AND `legalities.status` = 'Legal' 
SELECT DISTINCT c.subtypes, c.supertypes FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL; 
SELECT COUNT(*)  FROM cards  WHERE power IS NULL OR power = '*'  AND text LIKE '%triggered ability%' 
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.format = 'premodern' AND cards.side IS NULL AND cards.text LIKE '%This is a triggered mana ability%' 
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper' 
SELECT `artist` FROM `cards` WHERE `uuid` IN (     SELECT `uuid`     FROM `foreign_data`     WHERE `flavorText` = 'Das perfekte Gegenmittel zu einer dichten Formation' )
SELECT `name`, `language` FROM `foreign_data` JOIN `cards` ON `foreign_data.uuid` = `cards.uuid` WHERE `cards.artist` = 'Matthew D. Wilson' AND `cards.types` = 'Creature' AND `cards.layout` = 'normal' AND `cards.borderColor` = 'black' AND `language` = 'French'
SELECT COUNT(*)  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.rarity = 'rare' AND date = '2007-02-01' 
SELECT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id)  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T2.format = 'commander' AND T2.status = 'Legal' 
SELECT      CAST(COUNT(CASE WHEN f.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 ELSE NULL END) AS Percentage FROM      cards c JOIN      foreign_data f ON c.uuid = f.uuid; 
SELECT      CAST(SUM(CASE WHEN T1.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.setCode) AS Percentage FROM      set_translations AS T1 JOIN      sets AS T2 ON T1.setCode = T2.code WHERE      T2.type = 'expansion'; 
SELECT `availability` FROM `cards` WHERE `artist` = 'Daren Bader';
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless' AND edhrecRank > 12000; 
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1 
SELECT name  FROM cards  WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague'  ORDER BY name  LIMIT 3; 
SELECT language FROM foreign_data WHERE multiverseid = 149934;
SELECT      cardKingdomFoilId, cardKingdomId FROM      cards WHERE      cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY      cardKingdomFoilId ASC LIMIT 3; 
SELECT      CAST(SUM(CASE WHEN `isTextless` = 1 AND `layout` = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`isTextless`) AS proportion FROM `cards` 
SELECT id FROM cards WHERE side = 'Angel' AND subtypes LIKE '%Wizard%' AND side IS NULL 
 SELECT name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name  LIMIT 3; 
SELECT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.code = 'ARC' 
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.id = st.id WHERE s.id = 5;
SELECT `language`, `type` FROM `set_translations` JOIN `sets` ON `set_translations.setCode` = `sets.code` WHERE `sets.id` = 206;
 SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2; 
SELECT `sets`.`id` FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `sets`.`isFoilOnly` = 1 AND `set_translations`.`language` = 'Japanese' AND `set_translations`.`language` <> 'English' AND `sets`.`isForeignOnly` = 1; 
SELECT `sets`.code, MAX(`sets`.baseSetSize) AS max_cards FROM `sets` JOIN `set_translations` ON `sets`.code = `set_translations`.setCode WHERE `set_translations`.language = 'Russian'
SELECT CAST(SUM(CASE WHEN `set_translations.language` = 'Chinese Simplified' AND `sets.isOnlineOnly` = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`sets.isOnlineOnly`) FROM `set_translations` JOIN `sets` ON `set_translations.setCode` = `sets.code`; 
SELECT COUNT(*) FROM sets WHERE code IN (     SELECT setCode FROM set_translations WHERE language = 'Japanese' AND setCode NOT IN (         SELECT code FROM sets WHERE mtgoCode IS NOT NULL OR mtgoCode = ''     ) ) 
SELECT id FROM cards WHERE borderColor = 'black'; 
SELECT id FROM cards WHERE frameEffects = 'extendedart'; 
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1; 
SELECT `language` FROM `set_translations` WHERE `id` = '174';
SELECT `name` FROM `sets` WHERE `code` = 'ALL';
SELECT language FROM `foreign_data` WHERE name = 'A Pedra Fellwar'
SELECT `code` FROM `sets` WHERE `releaseDate` = '2007-07-13'
SELECT `baseSetSize`, `code` FROM `sets` WHERE `block` IN ('Masques', 'Mirage')
SELECT `code` FROM `sets` WHERE `type` = 'expansion'
SELECT f.name, c.type FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE c.watermark = 'Boros'; 
SELECT fd.language, cards.flavorText, cards.uuid FROM foreign_data AS fd JOIN cards ON fd.uuid = cards.uuid WHERE cards.watermark = 'colorpie';
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Abyssal Horror' 
SELECT `code` FROM `sets` WHERE `type` = 'expansion commander';
SELECT `name`, `type` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `watermark` = 'abzan';
SELECT `foreign_data.language`, `cards.type` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.watermark` LIKE '%Azorius%' AND `foreign_data.language` IS NOT NULL;
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM `cards` WHERE `availability` LIKE '%paper%' AND SUBSTRING_INDEX(SUBSTRING_INDEX(`availability`, ',', -1), ' ', 1) = 'hand' AND SUBSTRING_INDEX(SUBSTRING_INDEX(`availability`, ',', -1), ' ', -1) = '3' 
SELECT name FROM cards WHERE isTextless = 0;
SELECT manaCost FROM cards WHERE name = 'Ancestor\'s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL); 
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';
SELECT `purchaseUrls` FROM `cards` WHERE `promoTypes` LIKE '%bundle%' AND `purchaseUrls` IS NOT NULL; 
SELECT COUNT(DISTINCT availability)  FROM cards  WHERE availability LIKE '%arena,mtgo%' AND availability LIKE '%black border%'; 
SELECT `name`, `convertedManaCost` FROM `cards` WHERE (`name` = 'Serra Angel' AND `convertedManaCost` > (SELECT `convertedManaCost` FROM `cards` WHERE `name` = 'Shrine Keeper')) OR (`name` = 'Shrine Keeper' AND `convertedManaCost` > (SELECT `convertedManaCost` FROM `cards` WHERE `name` = 'Serra Angel'));
SELECT `artist` FROM `cards` WHERE `flavorName` = 'Battra, Dark Destroyer';
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3; 
SELECT `translation` FROM `set_translations` WHERE `setCode` IN (     SELECT `setCode`     FROM `cards`     WHERE `name` = 'Ancestor''s Chosen' ) AND `language` = 'Italian';
SELECT COUNT(*)  FROM (     SELECT st.translation      FROM cards c      JOIN set_translations st ON c.setCode = st.setCode      WHERE c.name = 'Angel of Mercy' ) t; 
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'; 
SELECT EXISTS (     SELECT 1     FROM `cards`     JOIN `set_translations` ON `cards.setCode` = `set_translations.setCode`     WHERE `cards.name` = 'Ancestor''s Chosen' AND `set_translations.language` = 'Korean' )
SELECT COUNT(*)  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex'; 
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'
SELECT `translation` FROM `set_translations` JOIN `sets` ON `sets`.`code` = `set_translations`.`setCode` WHERE `sets`.`name` = 'Eighth Edition' AND `set_translations`.`language` = 'Chinese Simplified'
SELECT c.name, s.mtgoCode FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;
SELECT `releaseDate` FROM `sets` JOIN `cards` ON `sets.code` = `cards.setCode` WHERE `cards.name` = 'Ancestor''s Chosen';
SELECT `type` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `set_translations.translation` = 'Hauptset Zehnte Edition';
SELECT COUNT(*) FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `sets`.`block` = 'Ice Age' AND `set_translations`.`language` = 'Italian' AND `set_translations`.`translation` IS NOT NULL;
SELECT s.name FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10 
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black';
SELECT `name` FROM `cards` WHERE `setCode` = 'Coldsnap' ORDER BY `convertedManaCost` DESC LIMIT 1;
SELECT `artist` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Coldsnap' AND `artist` IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');
SELECT `number` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Coldsnap' AND `cards.number` = 4;
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.convertedManaCost > 5 AND c.power = '*' OR c.power IS NULL; 
SELECT `flavorText` FROM `foreign_data` WHERE `language` = 'Italian' AND `name` = 'Ancestor''s Chosen'
SELECT DISTINCT language FROM `foreign_data` WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL;
SELECT `type` FROM `cards` WHERE `uuid` IN (SELECT `uuid` FROM `foreign_data` WHERE `language` = 'German' AND `name` = 'Ancestor''s Chosen')
SELECT `text` FROM `cards` JOIN `foreign_data` ON `cards.uuid` = `foreign_data.uuid` WHERE `cards.setCode` IN (SELECT `code` FROM `sets` WHERE `name` = 'Coldsnap') AND `foreign_data.language` = 'Italian'
SELECT `name` FROM `cards` JOIN `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` WHERE `sets`.`name` = 'Coldsnap' AND `foreign_data`.`language` = 'Italian' ORDER BY `cards`.`convertedManaCost` DESC LIMIT 1; 
SELECT `date` FROM `rulings` JOIN `cards` ON `rulings`.`uuid` = `cards`.`uuid` WHERE `cards`.`name` = 'Reminisce';
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' 
SELECT CAST(SUM(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id)  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap' 
SELECT code FROM sets WHERE releaseDate = '2017-07-14';
SELECT keyruneCode FROM sets WHERE code = 'PKHC';
SELECT mcmId FROM sets WHERE code = 'SS2';
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT `type` FROM `sets` WHERE `name` LIKE 'From the Vault: Lore'
SELECT `parentCode` FROM `sets` WHERE `name` = 'Commander 2014 Oversized';
SELECT c.text, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 0; 
SELECT `releaseDate` FROM `sets` WHERE `code` IN (SELECT `setCode` FROM `cards` WHERE `name` = 'Evacuation')
SELECT `baseSetSize` FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`translation` = 'Rinascita di Alara'
SELECT `type` FROM `sets` WHERE `code` IN (     SELECT `setCode`     FROM `set_translations`     WHERE `translation` = 'Huitième édition' )
SELECT `translation` FROM `cards` JOIN `set_translations` ON `cards.setCode` = `set_translations.setCode` WHERE `name` = 'Tendo Ice Bridge' AND `set_translations.language` = 'French';
 SELECT COUNT(*)  FROM set_translations  WHERE name = 'Tenth Edition' AND translation IS NOT NULL 
SELECT `set_translations.translation` FROM `cards` JOIN `set_translations` ON `cards.setCode` = `set_translations.setCode` WHERE `cards.name` = 'Fellwar Stone' AND `set_translations.language` = 'Japanese';
SELECT `name` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Journey into Nyx Hero''s Path' ORDER BY `convertedManaCost` DESC LIMIT 1; 
SELECT `releaseDate` FROM `sets` WHERE `code` IN (SELECT `setCode` FROM `set_translations` WHERE `translation` = 'Ola de frío')
SELECT `type` FROM `sets` WHERE `name` IN (SELECT `setCode` FROM `cards` WHERE `name` = 'Samite Pilgrim')
SELECT COUNT(*)  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3; 
SELECT `translation` FROM `set_translations` JOIN `sets` ON `set_translations.setCode` = `sets.code` WHERE `sets.name` = 'Mirrodin' AND `set_translations.language` = 'Chinese Simplified';
SELECT      CAST(SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(s.id) AS percentage_japanese_non_foil FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Japanese'; 
SELECT      CAST(SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      sets s  JOIN      set_translations st ON s.code = st.setCode  WHERE      st.language = 'Portuguese (Brazil)'; 
SELECT `availability` FROM `cards` WHERE `artist` = 'Aleksi Briclot' AND `isTextless` = 1; 
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL) 
SELECT frameEffects  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  GROUP BY frameEffects  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT COUNT(*) FROM cards WHERE duelDeck = 'A' AND power IS NULL OR power = '*' AND hasFoil = 0; 
SELECT id FROM sets WHERE type = 'commander' AND totalSetSize = (SELECT MAX(totalSetSize) FROM sets WHERE type = 'commander'); 
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10; 
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;
SELECT COUNT(*) FROM `cards` c JOIN `foreign_data` fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French'
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'rare'  AND c.types = 'Enchantment'  AND c.name = 'Abundance'  AND l.status = 'Legal'; 
SELECT format, COUNT(*) AS banned_count FROM legalities WHERE status = 'Banned' GROUP BY format ORDER BY banned_count DESC LIMIT 1; 
SELECT `language` FROM `set_translations` JOIN `sets` ON `set_translations.id` = `sets.id` WHERE `sets.name` = 'Battlebond';
SELECT T1.artist, GROUP_CONCAT(T2.format)  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  GROUP BY T1.artist  ORDER BY COUNT(*) ASC  LIMIT 1; 
SELECT legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997' AND cards.artist = 'D. Alexander Gregory' AND cards.hasContentWarning = 1 AND legalities.format = 'legacy'
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned' 
SELECT      AVG(s.id) AS average_sets_per_year,     MAX(cnt) AS common_language FROM (     SELECT          COUNT(*) AS cnt     FROM `set_translations` ) AS language_count, (SELECT      DATE_FORMAT(`releaseDate`, '%Y') AS year,     COUNT(`id`) AS id_count FROM `sets` WHERE `releaseDate` BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(`releaseDate`) ) AS set_releases JOIN language_count ON TRUE; 
SELECT artist FROM cards WHERE BorderColor = 'black' AND availability = 'arena';
SELECT `uuid` FROM `legalities` WHERE `format` = 'oldschool' AND `status` IN ('banned', 'restricted') 
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'; 
SELECT `text` FROM `rulings` JOIN `cards` ON `rulings`.`uuid` = `cards`.`uuid` WHERE `artist` = 'Kev Walker' ORDER BY `date` DESC;
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal' 
SELECT `sets`.name FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`language` NOT LIKE '%Japanese%' AND `set_translations`.`language` = 'Korean'
SELECT DISTINCT c.frameVersion, c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' AND l.status = 'Banned'; 
SELECT MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')
 SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011'; 
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1; 
SELECT COUNT(*)  FROM users u JOIN (     SELECT UserId     FROM votes     GROUP BY UserId     HAVING SUM(CASE WHEN Type = 'upvote' THEN 1 ELSE 0 END) > 100 ) upvoted_users ON u.Id = upvoted_users.UserId JOIN (     SELECT UserId     FROM votes     GROUP BY UserId     HAVING SUM(CASE WHEN Type = 'downvote' THEN 1 ELSE 0 END) > 1 ) downvoted_users ON u.Id = downvoted_users.UserId; 
SELECT COUNT(*)  FROM users  WHERE Views > 10 AND YEAR(CreationDate) > 2013; 
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT T1.Title FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;
SELECT u.DisplayName  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts) 
SELECT SUM(T2.CommentCount) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT MAX(Posts.AnswerCount)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie' 
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL;
SELECT u.DisplayName  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ClosedDate IS NOT NULL 
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20 
SELECT T2.Location FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
 SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'; 
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags) 
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND STRFTIME('%Y', Date) = '2011';
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1; 
SELECT AVG(T1.Score) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT AVG(b.Id) / COUNT(DISTINCT u.DisplayName) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200 
SELECT      CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id)  FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5 
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'; 
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1; 
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';
SELECT p.Title FROM posts p JOIN (     SELECT PostId, MAX(Score) AS max_score     FROM comments     GROUP BY PostId ) c ON p.Id = c.PostId WHERE c.max_score = (     SELECT MAX(Score)     FROM comments ) 
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount = 1910); 
SELECT `FavoriteCount` FROM `posts` JOIN `comments` ON `posts`.`Id` = `comments`.`PostId` WHERE `UserId` = 3025 AND `CreationDate` = '2014/4/23 20:29:39.0'; 
SELECT c.Text FROM comments c WHERE c.PostId IN (SELECT p.ParentId FROM posts p WHERE p.Id = 107829) AND c.CommentCount = 1;
SELECT p.ClosedDate FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = '23853' AND c.CreationDate = '2013-07-12 09:08:18.0' 
SELECT users.Reputation  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE posts.Id = '65041'
SELECT COUNT(*) FROM `posts` p JOIN `users` u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini';
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = '6347'
SELECT COUNT(*)  FROM votes v  JOIN posts p ON v.PostId = p.Id  WHERE p.Title LIKE '%data visualization%' 
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT      COUNT(p.Id) / COUNT(v.Id) AS PostToVoteRatio FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id JOIN      votes v ON u.Id = v.UserId WHERE      u.Id = 24; 
SELECT `ViewCount` FROM `posts` WHERE `Title` = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';
SELECT Text FROM comments WHERE Score = 17;
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com'
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'SilentGhost'
SELECT `users.DisplayName` FROM `comments` JOIN `users` ON `comments.UserId` = `users.Id` WHERE `comments.Text` = 'thank you user93'
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'A Lion'; 
SELECT `users`.`Reputation`, `users`.`DisplayName` FROM `posts` JOIN `users` ON `posts`.`OwnerUserId` = `users`.`Id` WHERE `posts`.`Title` = 'Understanding what Dassault iSight is doing?';
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'; 
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Necromancer' LIMIT 10; 
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';
SELECT T1.Title FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Vebjorn Ljosa' AND T1.LastEditorUserId = T2.Id;
SELECT SUM(T1.Score) AS TotalScore, T2.WebsiteUrl FROM posts T1 JOIN users T2 ON T1.OwnerUserId = T2.Id JOIN (     SELECT OwnerUserId     FROM posts     WHERE LastEditorUserId = (SELECT Id FROM users WHERE DisplayName = 'Yevgeny') ) T3 ON T1.OwnerUserId = T3.OwnerUserId 
SELECT Comment FROM postHistory JOIN posts ON postHistory.PostId = posts.Id WHERE posts.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND postHistory.Comment IS NOT NULL;
SELECT SUM(T2.BountyAmount)  FROM `posts` AS T1  JOIN `votes` AS T2 ON T1.Id = T2.PostId  WHERE T1.Title LIKE '%data%' 
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON p.Id = v.PostId WHERE p.Title LIKE '%variance%' AND v.BountyAmount = 50; 
SELECT p.Title, c.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id LEFT JOIN comments c ON p.Id = c.PostId WHERE t.TagName = '<humor>' GROUP BY p.Id, p.Title, c.Text ORDER BY AverageViewCount DESC; 
SELECT COUNT(*) FROM comments WHERE UserId = 13;
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;
SELECT COUNT(DISTINCT Id)  FROM badges  WHERE Name = 'Supporter' AND DATE(Date) BETWEEN '2011-01-01' AND '2011-12-31'
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name IN (SELECT Name FROM badges GROUP BY Name HAVING COUNT(*) > 5); 
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location = 'New York, NY' AND badges.Name IN ('Teacher', 'Supporter') 
SELECT u.Id, u.Reputation FROM users u JOIN posts p ON u.Id = p.UserId WHERE p.Id = 1;
SELECT u.Id AS UserId FROM users u JOIN (     SELECT ph.PostId, COUNT(*) AS count_ph     FROM postHistory ph     GROUP BY ph.PostId     HAVING COUNT(*) = 1 ) ph ON u.Id = ph.UserId JOIN posts p ON ph.PostId = p.Id WHERE p.ViewCount >= 1000; 
SELECT b.Name, COUNT(c.UserId) AS CommentCount FROM badges b JOIN (     SELECT UserId     FROM comments     GROUP BY UserId     HAVING COUNT(UserId) = (         SELECT MAX(CommentCount)         FROM (             SELECT COUNT(UserId) AS CommentCount             FROM comments             GROUP BY UserId         )     ) ) c ON b.UserId = c.UserId GROUP BY b.Name; 
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher'
SELECT      ABS((COUNT(CASE WHEN YEAR(`Date`) = 2010 THEN 1 END) / COUNT(*) -           COUNT(CASE WHEN YEAR(`Date`) = 2011 THEN 1 END) / COUNT(*)) * 100) AS Percentage_Difference FROM      badges WHERE      `Name` = 'Student'; 
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT c.UserId) AS UniqueCommenters FROM postHistory AS ph JOIN comments AS c ON ph.PostId = c.PostId WHERE ph.PostId = 3720 GROUP BY ph.PostHistoryTypeId; 
SELECT p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.PostId = 61217; 
SELECT posts.Score, postLinks.LinkTypeId FROM posts JOIN postLinks ON posts.Id = postLinks.PostId WHERE postLinks.LinkTypeId = 395;
SELECT p.Id AS PostID, u.Id AS UserID FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE p.Score > 60; 
SELECT SUM(p.FavoriteCount) FROM postHistory ph JOIN posts p ON ph.PostId = p.Id JOIN users u ON ph.UserId = u.Id WHERE u.Id = 686 AND YEAR(ph.CreationDate) = 2011 
SELECT      AVG(T3.UpVotes) AS AverageVotes,     AVG(T3.Age) AS AverageAge FROM      (     SELECT          OwnerUserId, COUNT(*) AS PostCount     FROM          posts     GROUP BY          OwnerUserId     ) T1 JOIN      (     SELECT          Id, UpVotes, Age     FROM          users     ) T3 ON T1.OwnerUserId = T3.Id WHERE      T1.PostCount > 10 
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer';
SELECT Name  FROM badges  WHERE Date = '2010-07-19 19:39:08.0'; 
SELECT COUNT(*)  FROM comments  WHERE score > 60; 
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:16:14.0';
SELECT COUNT(*) FROM posts WHERE Score = 10;
 SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = (SELECT MAX(Reputation) FROM users) 
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0' 
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre'
SELECT T1.Date FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'
SELECT      CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM badges)  FROM      badges  WHERE      Name = 'Teacher'; 
SELECT      CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId)  FROM      badges b  JOIN      users u ON b.UserId = u.Id  WHERE      b.Name = 'Organizer' 
SELECT c.Score  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.CreationDate = '2010-07-19 19:19:56.0' 
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:37:33.0'
SELECT u.Age  FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' 
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age BETWEEN 19 AND 65;
SELECT SUM(users.Views)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE DATE(badges.Date) = '2010-07-19' AND TIME(badges.Date) = '19:39:08' 
SELECT T1.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.Reputation = (SELECT MIN(Reputation) FROM users) 
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'
SELECT COUNT(*) FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age > 65;
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York';
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users);
SELECT      CAST(COUNT(CASE WHEN YEAR(`CreationDate`) = 2010 THEN 1 END) AS REAL) /      CAST(COUNT(CASE WHEN YEAR(`CreationDate`) = 2011 THEN 1 END) AS REAL) AS vote_ratio_2010_to_2011 FROM `votes`; 
 SELECT t.TagName FROM tags AS t JOIN posts AS p ON t.ExcerptPostId = p.Id OR t.WikiPostId = p.Id JOIN users AS u ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'John Salvatier' 
SELECT COUNT(*) FROM postHistory p JOIN users u ON p.UserId = u.Id WHERE u.DisplayName = 'Daniel Vassallo';
SELECT COUNT(*) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan';
SELECT `posts`.`Id` FROM `posts` JOIN `postHistory` ON `posts`.`Id` = `postHistory`.`PostId` JOIN `users` ON `postHistory`.`UserId` = `users`.`Id` WHERE `users`.`DisplayName` = 'slashnick' ORDER BY `posts`.`AnswerCount` DESC LIMIT 1;
SELECT p.Id, p.ViewCount FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName IN('Harvey Motulsky', 'Noah Snyder') ORDER BY p.ViewCount DESC LIMIT 1 
SELECT COUNT(*)  FROM (     SELECT p.Id      FROM posts p      JOIN users u ON p.UserId = u.Id      JOIN votes v ON p.Id = v.PostId      WHERE u.DisplayName = 'Matt Parker' AND v.UserId IN (3, 5)      GROUP BY p.Id      HAVING COUNT(v.Id) > 4 ) AS subquery; 
SELECT COUNT(*)  FROM comments c  JOIN posts p ON c.PostId = p.Id  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60 
SELECT p.Tags  FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0 
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'; 
SELECT      CAST((SELECT COUNT(*) FROM tags t            JOIN postHistory ph ON t.ExcerptPostId = ph.PostId            WHERE t.TagName = 'r' AND ph.UserId = -1) AS REAL) * 100 /      (SELECT COUNT(*) FROM postHistory ph WHERE ph.UserId = -1) AS Percentage 
SELECT      (SUM(p.ViewCount WHERE u.DisplayName = 'Mornington') - SUM(p.ViewCount WHERE u.DisplayName = 'Amos')) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id 
SELECT COUNT(*) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014;
SELECT COUNT(*)  FROM postHistory  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59' 
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users) 
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';
SELECT COUNT(*) FROM `comments` WHERE `Score` < 60 AND `UserId` = 13;
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60 
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location LIKE '%North Pole%' AND EXTRACT(YEAR FROM b.Date) = 2011 
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150 
SELECT COUNT(ph.Id) AS PostHistoryCount, phs.LastEditDate FROM postHistory ph JOIN posts ps ON ph.PostId = ps.Id JOIN (     SELECT Id     FROM posts     WHERE Title = 'What is the best introductory Bayesian statistics textbook?' ) ps_title ON ps.Id = ps_title.Id WHERE ps.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY phs.LastEditDate; 
SELECT u.LastAccessDate, u.Location FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Outliers'
SELECT p.Title FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.RelatedPostId WHERE pl.PostId IN (     SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' )
SELECT ph.PostId, b.Name FROM postHistory ph JOIN badges b ON ph.UserId = (     SELECT u.Id     FROM users u     WHERE u.UserDisplayName = 'Samuel' ) WHERE YEAR(ph.CreationDate) = 2013 AND YEAR(b.Date) = 2013; 
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts) 
SELECT `users.DisplayName`, `users.Location` FROM `users` JOIN `posts` ON `users.Id` = `posts.OwnerUserId` JOIN `tags` ON `posts.Id` = `tags.ExcerptPostId` WHERE `tags.TagName` = 'hypothesis-testing';
SELECT T3.Title, T2.LinkTypeId FROM postLinks AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id JOIN posts AS T3 ON T1.RelatedPostId = T3.Id WHERE T2.Title = 'What are principal component scores?';
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NULL) AND p.ParentId IS NOT NULL; 
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8) 
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;
SELECT COUNT(*)  FROM tags  WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts) 
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50; 
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);
SELECT SUM(posts.Score)  FROM posts  WHERE posts.LasActivityDate LIKE '2010-07-19%'
SELECT      COUNT(pl.Id) / 12 AS avg_monthly_links FROM      postLinks pl JOIN      posts p ON pl.PostId = p.Id WHERE      YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2; 
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON v.UserId = u.Id WHERE u.Id = 1465 AND p.FavoriteCount = (     SELECT MAX(FavoriteCount) FROM posts ) 
SELECT Title FROM posts WHERE Id IN (SELECT PostId FROM postLinks) ORDER BY `CreaionDate` ASC LIMIT 1;
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Id = (SELECT MAX(Id) FROM badges) 
 SELECT MIN(T1.CreationDate)  FROM votes AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.DisplayName = 'chl' 
SELECT MIN(T1.CreationDate) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM users)
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date LIMIT 1
SELECT COUNT(*)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Location LIKE '%United Kingdom%' AND p.FavoriteCount >= 4; 
SELECT AVG(T2.PostId)  FROM `users` AS T1  JOIN `votes` AS T2 ON T1.Id = T2.UserId  WHERE T1.Age = (SELECT MAX(Age) FROM `users`); 
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000; 
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT COUNT(*) FROM `posts` p JOIN `users` u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010;
SELECT `posts.Id`, `posts.Title` FROM `posts` JOIN `users` ON `posts.OwnerUserId` = `users.Id` WHERE `users.DisplayName` = 'Harvey Motulsky' ORDER BY `posts.ViewCount` DESC LIMIT 1;
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts)
SELECT AVG(T1.Score)  FROM `posts` AS T1  JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id  WHERE T2.DisplayName = 'Stephen Turner'
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND EXTRACT(YEAR FROM p.CreationDate) = 2011 
SELECT p.Id, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE strftime('%Y', u.CreationDate) = '2010'  ORDER BY p.FavoriteCount DESC  LIMIT 1; 
SELECT      (COUNT(CASE WHEN YEAR(p.CreationDate) = 2011 AND u.Reputation > 1000 THEN p.Id ELSE NULL END)      / CAST(COUNT(p.Id) AS REAL)) * 100 AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id; 
SELECT      (COUNT(Id WHERE Age BETWEEN 13 AND 18) / COUNT(Id)) * 100 AS Percentage FROM      users;
SELECT SUM(posts.ViewCount) AS TotalViews, users.DisplayName AS PosterName FROM posts JOIN postHistory ON posts.Id = postHistory.PostId JOIN users ON posts.LastEditorUserId = users.Id WHERE postHistory.Text = 'Computer Game Datasets' AND users.DisplayName IS NOT NULL; 
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts); 
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0; 
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.LastEditDate = (SELECT MAX(l.LastEditDate) FROM posts l WHERE l.Id = 183);
SELECT b.Name FROM badges b WHERE b.Date = (SELECT MAX(b2.Date) FROM badges b2 WHERE b2.UserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'Emmett'));
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000; 
SELECT      (b.Date - u.CreationDate) AS TimeToGetBadge FROM      badges b JOIN      users u ON b.UserId = u.Id WHERE      u.DisplayName = 'Zolomon' 
SELECT COUNT(p.Id) AS NumberOfPosts, COUNT(c.Id) AS NumberOfComments FROM posts p JOIN comments c ON p.OwnerUserId = c.PostId JOIN users u ON p.OwnerUserId = u.Id WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) 
SELECT c.Text, u.DisplayName  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10; 
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol';
SELECT COUNT(*) FROM tags WHERE TagName = 'careers';
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';
SELECT AnswerCount, CommentCount FROM posts WHERE Title = 'Clustering 1D data';
SELECT `CreationDate` FROM `users` WHERE `DisplayName` = 'IrishStat';
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30; 
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN (     SELECT OwnerUserId, MAX(Reputation) as MaxReputation     FROM (         SELECT OwnerUserId, Reputation         FROM posts p         JOIN users u ON p.OwnerUserId = u.Id     )     GROUP BY OwnerUserId ) max_reputation ON p.OwnerUserId = max_reputation.OwnerUserId AND p.Score > 50 GROUP BY max_reputation.MaxReputation ORDER BY max_reputation.MaxReputation DESC LIMIT 1; 
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20; 
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';
SELECT `Reputation`, `UpVotes` FROM `users` WHERE Id IN (     SELECT `UserId`     FROM `comments`     WHERE `Text` = 'fine, you win :)' )
SELECT c.Text  FROM comments AS c  JOIN posts AS p ON c.PostId = p.Id  WHERE p.Title LIKE '%linear regression%' 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1; 
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.CreationDate LIKE '%http://%' 
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5 
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0 
SELECT COUNT(*) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40; 
SELECT `Posts`.`Id`, `Comments`.`Text` FROM `posts` JOIN `comments` ON `comments`.`PostId` = `posts`.`Id` WHERE `posts`.`Title` = 'Group differences on a five point Likert item';
SELECT `UpVotes` FROM `users` WHERE `Id` = (SELECT `UserId` FROM `comments` WHERE `Text` = 'R is also lazy evaluated.');
SELECT `Text` FROM `comments` WHERE `UserId` IN (SELECT `Id` FROM `users` WHERE `DisplayName` = 'Harvey Motulsky');
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0; 
SELECT      CAST(SUM(CASE WHEN u.UpVotes = 0 AND c.Score BETWEEN 5 AND 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.Id) FROM      comments c JOIN      users u ON c.UserId = u.Id; 
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man'; 
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength'
SELECT COUNT(*)  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200; 
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id, T1.full_name HAVING COUNT(T2.power_id) > 15; 
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue' 
SELECT c.colour FROM colour c WHERE c.id = (SELECT sc.skin_colour_id FROM superhero s WHERE s.superhero_name = 'Apocalypse')
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility' 
SELECT s.superhero_name  FROM superhero s JOIN colour e ON s.eye_colour_id = e.id JOIN colour h ON s.hair_colour_id = h.id WHERE e.colour = 'Blue' AND h.colour = 'Blond' 
SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';
SELECT superhero.superhero_name, superhero.height_cm FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC; 
SELECT `publisher_name` FROM `publisher` JOIN `superhero` ON `publisher.id` = `superhero.publisher_id` WHERE `superhero.superhero_name` = 'Sauron';
SELECT c.colour, COUNT(s.id) AS superhero_count FROM colour c JOIN superhero s ON c.id = s.eye_colour_id JOIN publisher p ON p.id = s.publisher_id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY superhero_count DESC; 
SELECT AVG(T2.height_cm)  FROM `superhero` AS T2  JOIN `publisher` AS T1 ON T2.publisher_id = T1.id  WHERE T1.publisher_name = 'Marvel Comics'
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength' 
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');
SELECT `publisher.publisher_name` FROM `publisher` JOIN `superhero` ON `publisher.id` = `superhero.publisher_id` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` WHERE `attribute.attribute_name` = 'Speed' ORDER BY `hero_attribute.attribute_value` ASC LIMIT 1;
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics' 
SELECT `publisher_name` FROM `publisher` JOIN `superhero` ON `publisher.id` = `superhero.publisher_id` WHERE `superhero.superhero_name` = 'Blue Beetle II';
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond';
SELECT `superhero_name` FROM `superhero` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` WHERE `attribute_name` = 'Intelligence' ORDER BY `attribute_value` ASC LIMIT 1;
SELECT T2.race FROM `superhero` AS T1 INNER JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50; 
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch'
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN gender ON superhero.gender_id = gender.id  WHERE gender.gender = 'Female' AND attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100; 
SELECT superhero_name  FROM superhero  WHERE id IN (     SELECT hero_id      FROM hero_power      GROUP BY hero_id      HAVING COUNT(*) = (         SELECT MAX(power_count)          FROM (             SELECT COUNT(*) AS power_count              FROM hero_power              GROUP BY hero_id         ) AS subquery     ) ); 
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Vampire'
SELECT      CAST(COUNT(CASE WHEN T.superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') THEN T.superhero.id ELSE NULL END) AS REAL) * 100 / COUNT(T.superhero.id) AS percentage,     COUNT(CASE WHEN T.superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') THEN T.superhero.id ELSE NULL END) AS count_of_bad_alignment_superheroes,     (SELECT COUNT(*) FROM publisher WHERE publisher_name = 'Marvel Comics') AS total_marvel_superheroes FROM      superhero AS T JOIN      alignment ON T.superhero.alignment_id = alignment.id JOIN      publisher ON T.superhero.publisher_id = publisher.id WHERE      T.superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')     AND publisher.id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'); 
SELECT ABS((SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics') - (SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics')) AS difference; 
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';
SELECT AVG(attribute_value) FROM hero_attribute;
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.id = 75; 
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON sh.id = hp.hero_id WHERE sh.superhero_name = 'Deathlok';
SELECT AVG(T2.weight_kg) FROM `gender` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.gender_id WHERE T1.gender = 'Female'
SELECT sp.power_name FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id JOIN gender g ON s.gender_id = g.id JOIN superpower sp ON hp.power_id = sp.id WHERE g.gender = 'Male' GROUP BY sp.power_name LIMIT 5; 
SELECT s.superhero_name FROM `superhero` s JOIN `race` r ON s.race_id = r.id WHERE r.race = 'Alien'
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'No Colour'); 
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56;
SELECT `full_name` FROM `superhero` JOIN `race` ON `superhero.race_id` = `race.id` WHERE `race.race` = 'Demi-God' LIMIT 5;
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.weight_kg = 169 
SELECT c.colour FROM superhero s JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE r.race = 'human' AND s.height_cm = 185; 
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero) 
SELECT CAST(SUM(CASE WHEN s.publisher_id = p.id THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.height_cm BETWEEN 150 AND 180  AND p.publisher_name = 'Marvel Comics'; 
SELECT superhero_name  FROM superhero  WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero); 
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id GROUP BY power_name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT `attribute_value` FROM `hero_attribute` WHERE `hero_id` IN (SELECT `id` FROM `superhero` WHERE `superhero_name` = 'Abomination');
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1; 
SELECT COUNT(DISTINCT hero_id) FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'stealth');
SELECT s.full_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;
SELECT AVG(1) AS average FROM superhero s LEFT JOIN colour c ON s.skin_colour_id = c.id WHERE c.id IS NULL 
SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics';
SELECT `superhero_name` FROM `superhero` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` JOIN `publisher` ON `superhero.publisher_id` = `publisher.id` WHERE `attribute.name` = 'Durability' AND `publisher.publisher_name` = 'Dark Horse Comics' ORDER BY `hero_attribute.attribute_value` DESC LIMIT 1;
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.full_name = 'Abraham Sapien'
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight'
SELECT c.eye_colour_id AS eyes, c.hair_colour_id AS hair, c.skin_colour_id AS skin FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.eye_colour_id = c.id OR s.hair_colour_id = c.id OR s.skin_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics'; 
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id; 
SELECT T2.race FROM `superhero` AS T1 INNER JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb';
SELECT      (SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.gender)) AS percentage_blue_female FROM      superhero s JOIN      colour c ON s.skin_colour_id = c.id JOIN      gender g ON s.gender_id = g.id WHERE      g.gender = 'Female' 
SELECT superhero.superhero_name, race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.full_name = 'Charles Chandler';
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13';
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation' 
SELECT COUNT(*) FROM hero_power WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Amazo');
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE full_name = 'Hunter Zolomon'))
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber' 
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Black' AND c2.colour = 'Black' 
SELECT DISTINCT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  WHERE c.colour = 'Gold' 
SELECT `full_name` FROM `superhero` JOIN `race` ON `superhero.race_id` = `race.id` WHERE `race.race` = 'Vampire';
SELECT superhero.superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT COUNT(*)  FROM hero_attribute  WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')) 
SELECT `race.race`, `alignment.alignment` FROM `superhero` JOIN `race` ON `superhero.race_id` = `race.id` JOIN `alignment` ON `superhero.alignment_id` = `alignment.id` WHERE `superhero.superhero_name` = 'Cameron Hicks';
SELECT      CAST(SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' AND T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 END)  FROM      publisher AS T1  JOIN      superhero AS T2  ON      T1.id = T2.publisher_id  JOIN      gender AS T3  ON      T2.gender_id = T3.id  WHERE      T1.publisher_name = 'Marvel Comics' 
SELECT AVG(T2.weight_kg)  FROM `race` AS T1  JOIN `superhero` AS T2 ON T1.id = T2.race_id  WHERE T1.race = 'Alien' 
SELECT ABS((SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler')) 
SELECT id, AVG(height_cm) AS average_height FROM superhero GROUP BY id; 
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Abomination'))
SELECT COUNT(*)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN race ON superhero.race_id = race.id  WHERE race.id = 21 AND gender.id = 1; 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT a.attribute_name, h.attribute_value FROM attribute a JOIN hero_attribute ha ON a.id = ha.attribute_id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man'; 
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Brown' 
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') 
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.id = 7; 
SELECT      (SUM(CASE WHEN g.gender = 'Male' THEN 1 ELSE 0 END) / CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL)) AS ratio FROM      gender g JOIN      superhero s ON g.id = s.gender_id; 
SELECT superhero_name FROM `superhero` WHERE height_cm = (SELECT MAX(height_cm) FROM `superhero`);
SELECT id FROM superpower WHERE power_name = 'cryokinesis';
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT `full_name` FROM `superhero` WHERE `weight_kg` IS NULL OR `weight_kg` = 0;
SELECT colour.colour FROM colour JOIN superhero ON colour.id = superhero.eye_colour_id WHERE superhero.full_name = 'Karen Beecher-Duncan';
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.full_name = 'Helen Parr';
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188 
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.id = 38;
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute) 
SELECT sp.power_name FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';
SELECT superhero_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'  LIMIT 5; 
SELECT AVG(T3.attribute_value)  FROM alignment AS T1  JOIN superhero AS T2 ON T1.id = T2.alignment_id  JOIN hero_attribute AS T3 ON T2.id = T3.hero_id  WHERE T1.alignment = 'Neutral' 
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.skin_colour_id JOIN hero_attribute h ON s.id = h.hero_id WHERE h.attribute_value = 100; 
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.id = 1 AND gender.id = 2; 
SELECT `superhero_name` FROM `superhero` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` WHERE `attribute_value` BETWEEN 75 AND 80;
SELECT race.race FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN colour ON superhero.hair_colour_id = colour.id JOIN race ON superhero.race_id = race.id WHERE gender.gender = 'Male' AND colour.colour = 'Blue';
SELECT      CAST(SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.alignment) FROM      superhero AS T1 JOIN      alignment AS T2 ON T1.alignment_id = T2.id JOIN      gender AS T3 ON T1.gender_id = T3.id WHERE      T2.alignment = 'Bad' 
SELECT      (         (             SELECT COUNT(*) FROM superhero s             JOIN colour c ON s.eye_colour_id = c.id             WHERE s.weight_kg IS NULL OR s.weight_kg = 0             AND c.id = 7         ) -          (             SELECT COUNT(*) FROM superhero s             JOIN colour c ON s.eye_colour_id = c.id             WHERE s.weight_kg IS NULL OR s.weight_kg = 0             AND c.id = 1         )     ) AS difference; 
SELECT `attribute_value` FROM `hero_attribute` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` JOIN `superhero` ON `hero_attribute.hero_id` = `superhero.id` WHERE `superhero.superhero_name` = 'Hulk' AND `attribute.attribute_name` = 'Strength';
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON sh.id = hp.hero_id WHERE sh.superhero_name = 'Ajax';
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics' 
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.superhero_name ASC;
SELECT T1.gender FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN hero_power AS T3 ON T2.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force' 
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1;
SELECT AVG(T.superhero.height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN race ON superhero.race_id = race.id  WHERE publisher.publisher_name = 'Dark Horse Comics' AND race.race <> 'Human'
SELECT COUNT(*) FROM hero_attribute h JOIN attribute a ON h.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND h.attribute_value = 100;
SELECT ABS((SELECT COUNT(*) FROM publisher WHERE publisher_name = 'DC Comics') - (SELECT COUNT(*) FROM publisher WHERE publisher_name = 'Marvel Comics')) AS superhero_difference; 
SELECT attribute.attribute_name FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.superhero_name = 'Abomination'
SELECT superhero_name FROM `superhero` WHERE height_cm = (SELECT MAX(height_cm) FROM `superhero`);
SELECT `superhero_name` FROM `superhero` WHERE `full_name` = 'Charles Chandler';
SELECT      CAST(SUM(CASE WHEN `gender` = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      `superhero`  JOIN      `publisher` ON `superhero`.`publisher_id` = `publisher`.`id` WHERE      `publisher`.`publisher_name` = 'George Lucas' 
SELECT      (SUM(CASE WHEN alignment_id = (SELECT id FROM alignment WHERE alignment = 'Good') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE 0 END)      / COUNT(CASE WHEN publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE 0 END)) * 100 AS 'PercentageOfGoodSuperheroes' FROM superhero; 
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';
SELECT hero_id FROM `hero_attribute` WHERE `attribute_value` = (SELECT MIN(`attribute_value`) FROM `hero_attribute`);
SELECT full_name FROM `superhero` WHERE superhero_name = 'Alien';
SELECT t2.full_name FROM superhero AS t2 JOIN colour AS t1 ON t2.eye_colour_id = t1.id WHERE t2.weight_kg < 100 AND t1.colour = 'Brown' 
SELECT hero_attribute.attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Aquababy';
SELECT `superhero`.weight_kg, `race`.race  FROM `superhero`  JOIN `race` ON `superhero`.race_id = `race`.id  WHERE `superhero`.id = 40;
SELECT AVG(T2.height_cm) FROM `alignment` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.alignment_id WHERE T1.alignment = 'Neutral'
SELECT hero_id FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Intelligence');
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.superhero_name = 'Blackwulf';
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero) 
SELECT T2.driverRef FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 20 AND T1.q1 IS NOT NULL ORDER BY T1.q1 LIMIT 5
SELECT drivers.surname  FROM qualifying  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE raceId = 19 AND q2 IS NOT NULL AND q2 != ''  ORDER BY q2  LIMIT 1 OFFSET 1;
SELECT T2.year FROM `circuits` AS T1 JOIN `races` AS T2 ON T1.circuitId = T2.circuitId WHERE T1.location = 'Shanghai';
SELECT circuits.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.name = 'Circuit de Barcelona-Catalunya' AND races.url IS NOT NULL;
SELECT `name` FROM `races` WHERE `circuitId` IN (SELECT `circuitId` FROM `circuits` WHERE `country` = 'Germany');
SELECT `position` FROM `constructorStandings` WHERE `constructorId` IN (SELECT `constructorId` FROM `constructors` WHERE `name` = 'Renault')
SELECT COUNT(*)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2010  AND c.country NOT IN ('Asia', 'Europe')  AND r.raceId IN (     SELECT raceId      FROM results      WHERE position < 11 -- Assuming 10th place or better is considered a Grand Prix ) 
SELECT T2.name FROM `circuits` AS T1 JOIN `races` AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Spain'
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Australian Grand Prix';
 SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit' 
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit' 
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Abu Dhabi Grand Prix';
SELECT T1.nationality FROM constructors AS T1 JOIN constructorresults AS T2 ON T1.constructorid = T2.constructorid WHERE T2.points = 1 AND T2.raceid = 24; 
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna')
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q2 = '0:01:40' AND T2.raceId = 355 
SELECT T2.number FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.q3 LIKE '0:01:54%' AND T1.raceId = 903 
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NOT NULL; 
SELECT `seasons`.year FROM `seasons` JOIN `races` ON `seasons`.year = `races`.year WHERE `races`.raceId = 901;
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId FROM races WHERE date = '2015-11-29' ); 
SELECT T1.surname AS oldest_driver_surname, T1.forename AS oldest_driver_forename FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1; 
SELECT d.forename, d.surname, d.url FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.raceId = 161 AND l.time LIKE '0:01:27%' 
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933) 
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Malaysian Grand Prix'
 SELECT T1.url FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 AND T2.points = (SELECT MAX(points) FROM constructorResults WHERE raceId = 9) 
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceId = 345;
SELECT T2.nationality  FROM qualifying AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T1.raceId = 347 AND T1.q2 = '01:15' 
SELECT T1.code  FROM drivers AS T1  JOIN qualifying AS T2 ON T1.driverId = T2.driverId  WHERE T2.raceId = 45 AND T2.q3 LIKE 'M:SS%' 
SELECT `results`.`time`  FROM `drivers`  JOIN `results` ON `drivers`.`driverId` = `results`.`driverId`  WHERE `drivers`.`forename` = 'Bruce' AND `drivers`.`surname` = 'McLaren' AND `results`.`raceId` = 743;
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2006 AND ra.name = 'San Marino Grand Prix' AND r.position = 2;
SELECT `url` FROM `seasons` JOIN `races` ON `seasons`.year = `races`.year WHERE `races`.raceId = 901; 
SELECT COUNT(*)  FROM results  WHERE raceId IN (     SELECT r.raceId      FROM races r      WHERE r.date = '2015-11-29' ) AND statusId != 1 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1; 
SELECT d.forename || ' ' || d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId = 348 ORDER BY lt.time ASC LIMIT 1; 
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results) 
SELECT      CAST((AVG(CASE WHEN raceId = 853 THEN fastestLapSpeed END) - AVG(CASE WHEN raceId = 854 THEN fastestLapSpeed END)) * 100 AS REAL) / AVG(CASE WHEN raceId = 853 THEN fastestLapSpeed END) * 100 FROM      results; 
SELECT      COUNT(CASE WHEN results.time IS NOT NULL THEN 1 END) * 1.0 / COUNT(*) AS completion_rate FROM      results JOIN      races ON results.raceId = races.raceId WHERE      DATE(races.date) = '1983-07-16'; 
SELECT `year` FROM `races` WHERE `name` = 'Singapore Grand Prix' ORDER BY `year` LIMIT 1;
SELECT COUNT(*) AS race_count, name FROM races WHERE year = 2005 ORDER BY name DESC;
SELECT name FROM races WHERE year = (SELECT MIN(year) FROM races) AND month = (SELECT MIN(month) FROM (SELECT DATE_PART('month', date) AS month FROM races WHERE year = (SELECT MIN(year) FROM races))); 
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);
SELECT `year` FROM `races` GROUP BY `year` ORDER BY COUNT(`round`) DESC LIMIT 1;
SELECT `name` FROM `races` WHERE `year` = 2017 AND NOT EXISTS (     SELECT 1     FROM `races` AS r2     WHERE r2.year = 2000 AND r2.name = `races`.name )
SELECT T2.name AS Circuit, T2.location AS Location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = (SELECT MIN(year) FROM races) AND T2.country = 'Europe' LIMIT 1; 
SELECT MAX(`year`) FROM `races` WHERE `name` = 'British Grand Prix' AND `circuitId` IN (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Brands Hatch');
 SELECT COUNT(*)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone International Circuit' AND r.name = 'British Grand Prix'; 
SELECT d.forename, d.surname, s.position FROM drivers d JOIN driverStandings s ON d.driverId = s.driverId JOIN races r ON s.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2010 ORDER BY s.position; 
SELECT d.forename, d.surname, MAX(ds.points) FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId; 
 SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driver_standings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3; 
SELECT D.forename, D.surname, R.name, MIN(LT.milliseconds)  FROM drivers D  JOIN lapTimes LT ON D.driverId = LT.driverId  JOIN races R ON LT.raceId = R.raceId  GROUP BY D.driverId, R.raceId  ORDER BY MIN(LT.milliseconds) ASC  LIMIT 1;
SELECT AVG(T3milliseconds)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN drivers ON lapTimes.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix'
SELECT      COUNT(DISTINCT ds.raceId) * 100.0 / (         SELECT              COUNT(DISTINCT ds.raceId)          FROM              driverStandings AS ds          WHERE              ds.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton') AND              ds.year >= 2010 AND              ds.position > 1     ) AS percentage_not_first_track_since_2010 FROM      driverStandings AS ds WHERE      ds.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton') AND      ds.year >= 2010 AND      ds.position > 1; 
 SELECT      drivers.forename,      drivers.surname,      drivers.nationality,      MAX(SUM(results.points)) AS max_points FROM      drivers  JOIN      results ON drivers.driverId = results.driverId GROUP BY      drivers.driverId, drivers.forename, drivers.surname, drivers.nationality HAVING      COUNT(results.wins) = (         SELECT              MAX(win_count)          FROM              (                 SELECT                      COUNT(wins) AS win_count                  FROM                      results                  GROUP BY                      driverId              ) AS subquery     ) 
SELECT      `forename`,      `surname`  FROM      `drivers`  WHERE      `nationality` = 'Japanese'  ORDER BY      `dob` DESC  LIMIT 1;
SELECT DISTINCT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY c.circuitId, c.name HAVING COUNT(r.raceId) >= 4; 
SELECT T2.name AS CircuitName, T2.location AS CircuitLocation, T1.name AS RaceName FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2006 AND T2.country = 'USA';
SELECT R.name AS RaceName, C.name AS CircuitName, C.location AS CircuitLocation FROM races R JOIN circuits C ON R.circuitId = C.circuitId WHERE MONTH(R.date) = 9 AND YEAR(R.date) = 2005;
SELECT r.name  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20 
SELECT COUNT(*)  FROM drivers d JOIN driver_standings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit' 
SELECT races.name, races.year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' ORDER BY lapTimes.milliseconds ASC LIMIT 1;
SELECT AVG(driverStandings.points)  FROM driverStandings  JOIN races ON driverStandings.raceId = races.raceId  JOIN seasons ON races.year = seasons.year  JOIN drivers ON driverStandings.driverId = drivers.driverId  WHERE drivers.forename = 'Eddie' AND drivers.surname = 'Irvine' AND seasons.year = 2000;
SELECT MIN(r.year), ds.points FROM races r JOIN driver_standings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'; 
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date; 
SELECT r.name AS RaceName, s.year AS Year, c.location AS CircuitLocation FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN (     SELECT raceId, COUNT(*) AS LapCount     FROM lapTimes     GROUP BY raceId     ORDER BY LapCount DESC     LIMIT 1 ) lt ON r.raceId = lt.raceId ORDER BY r.year DESC; 
SELECT      COUNT(*) FILTER (WHERE country = 'Germany' AND name LIKE 'European Grand Prix') * 100.0 / COUNT(*) AS percentage FROM      races WHERE      name LIKE 'European Grand Prix' 
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';
SELECT name FROM circuits WHERE lat > (SELECT MAX(lat) FROM circuits WHERE name IN('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')) LIMIT 1;
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';
SELECT `country` FROM circuits WHERE `alt` = (SELECT MAX(`alt`) FROM circuits) 
SELECT COUNT(*) FROM drivers WHERE code IS NULL;
SELECT nationality, MIN(dob) AS oldest_date FROM drivers GROUP BY nationality ORDER BY oldest_date DESC LIMIT 1; 
SELECT surname FROM drivers WHERE nationality = 'Italian';
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';
SELECT `driverRef` FROM `drivers` WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton';
SELECT `circuits`.`name` FROM `circuits` JOIN `races` ON `circuits`.`circuitId` = `races`.`circuitId` WHERE `races`.`name` = 'Spanish Grand Prix' AND `races`.`year` = 2009;
SELECT DISTINCT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit';
SELECT circuits.url AS circuit_url, races.url AS race_url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.name = 'Silverstone Circuit';
SELECT `time` FROM `races` WHERE `year` BETWEEN 2010 AND 2019 AND `circuitId` = (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Abu Dhabi Circuit')
SELECT COUNT(*) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy'
SELECT date FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya')
SELECT circuits.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009; 
SELECT MIN(T2.fastestLapTime) FROM `drivers` AS T1 JOIN `results` AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT `forename`, `surname` FROM `drivers` WHERE `driverId` IN (     SELECT `driverId` FROM `results` ORDER BY `fastestLapSpeed` DESC LIMIT 1 )
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Canadian Grand Prix' AND results.position = 1;
SELECT DISTINCT r.name FROM results AS res JOIN drivers AS d ON res.driverId = d.driverId JOIN races AS r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'; 
SELECT T3.name FROM drivers JOIN results AS T1 ON drivers.driverId = T1.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY T1.rank ASC LIMIT 1;
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'; 
SELECT DISTINCT T2.year FROM drivers AS T1 JOIN results AS T3 ON T1.driverId = T3.driverId JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' 
SELECT positionOrder  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix';
 SELECT forename, surname  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.year = 1989 AND races.name LIKE 'Australian Grand Prix' AND results.grid = 4; 
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' AND time IS NOT NULL) AND time IS NOT NULL;
SELECT results.fastestLap FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Australian Grand Prix' AND races.year = 2008;
SELECT time FROM results WHERE position = 2 AND name = 'Chinese Grand Prix' AND SUBSTR(year, 1, 4) = '2008';
SELECT d.forename, d.surname, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.time LIKE '%:%:%.%' LIMIT 1; 
 SELECT COUNT(*)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races rs ON r.raceId = rs.raceId  WHERE d.nationality = 'British' AND rs.year = 2008 AND rs.name = 'Australian Grand Prix' 
SELECT COUNT(*)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE year = 2008 AND name = 'Chinese Grand Prix' ) AND time IS NOT NULL 
SELECT SUM(T2.points)  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' 
SELECT AVG(STR_TO_DATE(SUBSTRING_INDEX(`fastestLapTime`, ':', -1), '%M:%S.%m')) AS average_fastest_lap_time FROM `results` JOIN `drivers` ON `results`.`driverId` = `drivers`.`driverId` WHERE `drivers`.`forename` = 'Hamilton' AND `drivers`.`surname` = 'Lewis'; 
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.raceId)  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' 
SELECT      CAST((CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`results.time`, ':', -1), '.', 1) AS REAL) * 60 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`results.time`, ':', 2), ':', -1) AS REAL)) AS REAL) * 60 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`results.time`, ':', 1), ':', -1) AS REAL) -      CAST((CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`champion_results.time`, ':', -1), '.', 1) AS REAL) * 60 + CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`champion_results.time`, ':', 2), ':', -1) AS REAL)) AS REAL) * 60 - CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`champion_results.time`, ':', 1), ':', -1) AS REAL) AS percentage_faster,     `results.time`,     `champion_results.time` FROM     (         SELECT `results`.*, `races`.`year` FROM `results` JOIN `races` ON `results`.`raceId` = `races`.`raceId` WHERE `races`.`year` = 2008 AND `races`.`name` = 'Australian Grand Prix' AND `results`.`positionOrder` = 1     ) AS champion_results JOIN     (         SELECT `results`.*, `races`.`year` FROM `results` JOIN `races` ON `results`.`raceId` = `races`.`raceId` WHERE `races`.`year` = 2008 AND `races`.`name` = 'Australian Grand Prix' AND `results`.`positionOrder` > 1 ORDER BY `results`.`positionOrder` ASC LIMIT 1     ) AS last_driver_results WHERE     champion_results.time IS NOT NULL AND last_driver_results.time IS NOT NULL; 
SELECT COUNT(*)  FROM circuits  WHERE country = 'Australia' AND location = 'Adelaide';
SELECT lat, lng FROM circuits WHERE country = 'USA';
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-12-31' 
SELECT MAX(T.points)  FROM constructors AS T  JOIN constructorResults AS C ON T.constructorId = C.constructorId  WHERE T.nationality = 'British'
SELECT name FROM constructors WHERE constructorId = (     SELECT constructorId FROM constructorStandings ORDER BY points DESC LIMIT 1 )
SELECT c.name FROM constructors c JOIN constructor_standings cs ON c.constructorId = cs.constructorId WHERE cs.points = 0 AND cs.raceId = 291; 
SELECT COUNT(*)  FROM constructors  JOIN constructor_standings ON constructors.constructorId = constructor_standings.constructorId  WHERE constructors.nationality = 'Japanese' AND constructor_standings.points = 0 AND raceId IN (     SELECT raceId FROM constructor_standings GROUP BY raceId HAVING COUNT(raceId) = 2 )
 SELECT c.name FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE r.rank = 1; 
SELECT COUNT(*)  FROM constructors c  JOIN results r ON c.constructorId = r.constructorId  WHERE c.nationality = 'French' AND r.laps > 50; 
SELECT      COUNT(CASE WHEN T3.time IS NOT NULL AND T2.year BETWEEN 2007 AND 2009 THEN T1.driverId END) * 100.0 / COUNT(T1.driverId) AS race_completion_percentage FROM      drivers AS T1 JOIN      races AS T2 ON T1.driverId = T2.raceId JOIN      results AS T3 ON T2.raceId = T3.raceId WHERE      T1.nationality = 'Japanese' 
SELECT      T1.year,     AVG(SUBSTR(T1.time, 1, INSTR(T1.time, '.') - 1)) AS average_time_seconds FROM      seasons AS T1 JOIN      results AS T2 ON T1.year = T2.year WHERE      T1.year < 1975 AND T2.statusId = 1 GROUP BY      T1.year; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob > '1975-12-31' AND T2.rank = 2; 
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND NOT EXISTS (SELECT 1 FROM results WHERE drivers.driverId = results.driverId AND time IS NOT NULL);
SELECT `forename`, `surname` FROM `drivers` JOIN `results` ON `drivers.driverId` = `results.driverId` WHERE `fastestLapTime` = (SELECT MIN(`fastestLapTime`) FROM `results`);
SELECT T1.fastestLap  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T2.year = 2009  AND T1.time = (SELECT MIN(time) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009)) 
SELECT AVG(T2.fastestLapSpeed) FROM `races` AS T1 JOIN `results` AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'
SELECT T1.name, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1; 
SELECT      CAST(SUM(CASE WHEN T1.dob < '1985-01-01' AND T3.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.driverId)  FROM      drivers AS T1 JOIN      results AS T3 ON T1.driverId = T3.driverId JOIN      races AS T2 ON T3.raceId = T2.raceId WHERE      T2.year BETWEEN 2000 AND 2005; 
SELECT COUNT(*) FROM drivers d LEFT JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.time < 120 
SELECT code FROM drivers WHERE nationality = 'America';
SELECT raceId FROM races WHERE year = 2009; 
SELECT COUNT(DISTINCT driverId) FROM driverStandings WHERE raceId = 18;
SELECT COUNT(*)  FROM (     SELECT nationality      FROM drivers      WHERE nationality = 'Dutch' OR nationality = 'Netherlands' ) AS dutch_drivers  WHERE dob IS NOT NULL  AND EXISTS (     SELECT 1      FROM (         SELECT MAX(YEAR(dob)) AS max_age          FROM drivers          GROUP BY nationality          ORDER BY MAX(YEAR(dob)) DESC          LIMIT 3     ) AS top_3_youngest      WHERE drivers.nationality = top_3_youngest.max_age AND drivers.dob <= top_3_youngest.max_age ) 
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND SUBSTR(dob, 1, 4) = '1980';
SELECT d.driverId, d.nationality, d.dob, MIN(ps.time) AS earliest_lap_time FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY d.driverId, d.nationality, d.dob ORDER BY earliest_lap_time ASC LIMIT 3; 
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;
SELECT d.driverId, d.code  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.dob LIKE '1971-%' AND r.fastestLapTime IS NOT NULL;
SELECT d.driverId, d.nationality, d.dob, MAX(ps.time) AS latest_lap_time FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'Spanish' AND YEAR(d.dob) < 1982 GROUP BY d.driverId, d.nationality, d.dob ORDER BY latest_lap_time DESC LIMIT 10; 
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime LIMIT 1 
SELECT T1.year FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T2.time = (SELECT MAX(time) FROM lapTimes) 
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5; 
SELECT COUNT(*)  FROM results  WHERE raceId BETWEEN 50 AND 100  AND statusId = 2  AND time IS NOT NULL 
SELECT `location`, (lat, lng) FROM `circuits` WHERE `country` = 'Austria';
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL 
 SELECT      DATEDIFF(YEAR, drivers.dob, races.date) AS age,     drivers.forename,     races.date,     races.time FROM      drivers JOIN      results ON drivers.driverId = results.driverId JOIN      races ON results.raceId = races.raceId WHERE      results.position IS NULL ORDER BY      age ASC LIMIT 1; 
SELECT COUNT(*) FROM results WHERE statusId = (SELECT statusId FROM status WHERE status = 'Puncture') AND nationality = 'American';
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1 
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.wins = (SELECT MAX(wins) FROM constructorStandings) 
SELECT driverId, MAX(time) AS slowest_time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId WHERE races.name = 'French Grand Prix' AND lap = 3 LIMIT 1; 
SELECT T1.time, T2.milliseconds FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T2.lap = 1 ORDER BY T2.time LIMIT 1 
SELECT AVG(T2.fastestLapTime)  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.year = 2006 AND T1.name = 'United States Grand Prix' AND T2.rank < 11;
SELECT      d.forename,      d.surname  FROM      drivers d  JOIN      pit_stops ps ON d.driverId = ps.driverId  WHERE      d.nationality = 'German' AND      d.dob BETWEEN '1980-01-01' AND '1985-12-31'  GROUP BY      d.driverId  ORDER BY      AVG(ps.duration) ASC  LIMIT 3; 
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Canadian Grand Prix' AND T2.year = 2008 LIMIT 1
SELECT T1.constructorRef, T1.url FROM constructors AS T1 JOIN (     SELECT raceId, constructorId, MIN(time) AS maxTime FROM results WHERE raceId IN (         SELECT raceId FROM races WHERE year = 2009 AND name = 'Singapore Grand Prix'     ) GROUP BY constructorId ORDER BY SUM(time) ASC LIMIT 1 ) AS T2 ON T1.constructorId = T2.constructorId WHERE T2.maxTime = (SELECT MAX(time) FROM results WHERE raceId IN (     SELECT raceId FROM races WHERE year = 2009 AND name = 'Singapore Grand Prix' ))
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND year(dob) BETWEEN 1981 AND 1991;
SELECT forename + ' ' + surname AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC; 
SELECT `country`, lat, lng FROM circuits WHERE name = 'Hungaroring';
SELECT cr.points, c.name, c.nationality FROM constructors c JOIN constructor_results cr ON c.constructorId = cr.constructorId JOIN races r ON cr.race_id = r.race_id WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 ORDER BY cr.points DESC LIMIT 1; 
SELECT AVG(driverStandings.points)  FROM driverStandings  JOIN races ON driverStandings.raceId = races.raceId  JOIN drivers ON driverStandings.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix';
SELECT AVG(year) AS AverageAnnualRaces FROM (     SELECT year     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31'     GROUP BY year ) AS race_years; 
SELECT `nationality` FROM `drivers` GROUP BY `nationality` ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT wins FROM driverStandings WHERE points = 91.0;
SELECT r.name  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results) 
SELECT circuits.location, circuits.country FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.date = (SELECT MAX(date) FROM races)
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.driverId = r.driverId AND r.year = 2008 AND r.circuitId = (     SELECT c.circuitId FROM circuits c WHERE c.name = 'Marina Bay Street Circuit' ) WHERE q.q3 = (SELECT MIN(q3) FROM qualifying WHERE driverId IN (SELECT driverId FROM races WHERE year = 2008 AND circuitId = (     SELECT c.circuitId FROM circuits c WHERE c.name = 'Marina Bay Street Circuit' )) LIMIT 1 OFFSET 2) 
SELECT      d.forename || ' ' || d.surname AS full_name,     d.nationality,     r.name AS race_name FROM      drivers d JOIN      (         SELECT              driverId, MIN(dob) AS min_dob         FROM              drivers         GROUP BY              driverId     ) AS youngest_drivers ON d.driverId = youngest_drivers.driverId AND d.dob = youngest_drivers.min_dob JOIN      races r ON r.raceId = (         SELECT              raceId         FROM              driverStandings         WHERE              driverId = d.driverId         ORDER BY              raceId ASC         LIMIT 1     ) ORDER BY      d.dob DESC LIMIT 1; 
SELECT COUNT(*)  FROM results r JOIN races r2 ON r.raceId = r2.raceId JOIN status s ON r.statusId = s.statusId WHERE s.status = 'Accident' AND r2.name = 'Canadian Grand Prix' AND r.driverId IN (     SELECT r.driverId      FROM results r     JOIN races r2 ON r.raceId = r2.raceId     JOIN status s ON r.statusId = s.statusId     WHERE r2.name = 'Canadian Grand Prix'     GROUP BY r.driverId     ORDER BY COUNT(*) DESC     LIMIT 1 ) 
SELECT d.forename, d.surname, COUNT(ds.wins) AS total_wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId; 
SELECT MAX(`duration`) FROM `pitStops`;
SELECT MIN(time) FROM lapTimes;
SELECT MAX(`duration`) FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton')
SELECT pitStops.lap FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN drivers ON pitStops.driverId = drivers.driverId WHERE races.name = 'Australian Grand Prix' AND races.year = 2011 AND drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT `duration` FROM `pitStops` JOIN `races` ON `pitStops`.`raceId` = `races`.`raceId` WHERE `races`.`year` = 2011 AND `races`.`name` = 'Australian Grand Prix';
SELECT `time` FROM `lapTimes` JOIN `drivers` ON `lapTimes`.`driverId` = `drivers`.`driverId` WHERE `drivers`.`forename` = 'Lewis' AND `drivers`.`surname` = 'Hamilton' ORDER BY `time` ASC LIMIT 1;
 SELECT drivers.forename, drivers.surname  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE results.fastestLapTime LIKE 'MM:%' OR results.fastestLapTime LIKE 'M:%.%'  ORDER BY CAST(SUBSTR(results.fastestLapTime, 1, INSTR(results.fastestLapTime, ':') - 1) AS INTEGER) * 60 + CAST(SUBSTR(results.fastestLapTime, INSTR(results.fastestLapTime, ':') + 1) AS INTEGER)  LIMIT 20; 
SELECT `position` FROM `lapTimes` JOIN `drivers` ON `lapTimes`.`driverId` = `drivers`.`driverId` WHERE `drivers`.`forename` = 'Lewis' AND `drivers`.`surname` = 'Hamilton' ORDER BY `time` ASC LIMIT 1;
SELECT T1.fastestLapTime FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.name = 'Austrian Grand Prix'
SELECT T1.country, MIN(T2.time) AS lap_record FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Italy' GROUP BY T1.country; 
SELECT r.name  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Austrian Grand Prix' AND r.raceId IN (     SELECT raceId      FROM results      WHERE time = (         SELECT MIN(time)          FROM results          WHERE raceId = r.raceId     ) )
SELECT T3.duration FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId JOIN pitStops AS T3 ON T1.raceId = T3.raceId WHERE T2.name = 'Austrian Grand Prix' AND T3.driverId = <DriverID> 
SELECT `circuits`.`lat`, `circuits`.`lng` FROM `circuits` JOIN `races` ON `circuits`.`circuitId` = `races`.`circuitId` JOIN `lapTimes` ON `races`.`raceId` = `lapTimes`.`raceId` WHERE `lapTimes`.`time` = '1:29.488' 
SELECT AVG(T2.milliseconds)  FROM `drivers` AS T1  JOIN `pitStops` AS T2 ON T1.driverId = T2.driverId  WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' 
SELECT AVG(T3.milliseconds)  FROM `races` AS T1  JOIN `circuits` AS T2 ON T1.circuitId = T2.circuitId  JOIN `lapTimes` AS T3 ON T1.raceId = T3.raceId  WHERE T2.country = 'Italy'
SELECT `player_api_id` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`);
SELECT `player_name`, `height` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`)
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`); 
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating BETWEEN 60 AND 65  AND defensive_work_rate = 'low' 
SELECT id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5;
SELECT league.name  FROM Match  JOIN Team ON Match.home_team_api_id = Team.team_api_id OR Match.away_team_api_id = Team.team_api_id  JOIN League ON League.id = Match.league_id  WHERE Match.season LIKE '2015/2016%'  GROUP BY League.id  ORDER BY SUM(home_team_goal + away_team_goal) DESC  LIMIT 1;
SELECT home_team FROM matches WHERE season = '2015/2016' GROUP BY home_team ORDER BY SUM(CASE WHEN home_team_goal > away_team_goal THEN 1 ELSE 0 END) ASC LIMIT 1; 
SELECT player_name  FROM players  ORDER BY penalties DESC  LIMIT 10; 
SELECT Team.team_long_name FROM Team JOIN Match ON Team.team_api_id = Match.away_team_api_id JOIN League ON Match.league_id = League.league_id WHERE League.name = 'Scotland Premier League' AND Match.season = '2009/2010' GROUP BY Team.team_long_name HAVING COUNT(CASE WHEN away_team_goal > home_team_goal THEN 1 END) = MAX(     SELECT COUNT(*)      FROM Match      JOIN Team ON Match.away_team_api_id = Team.team_api_id      WHERE League.name = 'Scotland Premier League' AND Match.season = '2009/2010' AND away_team_goal > home_team_goal ) 
SELECT      teamName,     buildUpPlaySpeed FROM      teamStats ORDER BY      buildUpPlaySpeed DESC LIMIT 4; 
 SELECT l.name FROM League AS l JOIN Match AS m ON l.id = m.league_id WHERE m.season = '2015/2016' AND m.home_team_goal = m.away_team_goal GROUP BY l.name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT * FROM Player WHERE strftime('%Y', datetime('now')) - strftime('%Y', birthday) >= 18 AND strftime('%Y', datetime('now')) - strftime('%Y', birthday) <= 26 AND (SELECT sprint_speed FROM other_table WHERE Player.player_id = other_table.player_id) >= 97 AND strftime('%Y', datetime('now')) BETWEEN '2013' AND '2015'; 
SELECT league_name, COUNT(*) AS total_matches FROM matches GROUP BY league_id, league_name ORDER BY total_matches DESC LIMIT 1; 
SELECT AVG(height) AS average_height FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59';
SELECT player_api_id FROM Player_Attributes WHERE overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes) AND SUBSTR(date, 1, 4) = '2010' 
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60; 
SELECT team_long_name FROM (     SELECT team_long_name, SUM(buildUpPlayPassing) / COUNT(*) AS avg_buildUpPlayPassing     FROM table_name     WHERE buildUpPlayPassing IS NOT NULL     GROUP BY team_long_name ) AS subquery WHERE subquery.avg_buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM table_name WHERE buildUpPlayPassing IS NOT NULL) AND strftime('%Y', date) = '2012' 
SELECT      (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0 / COUNT(player_fifa_api_id)) AS percentage_left_foot_players FROM      players_table WHERE      YEAR(birthday) BETWEEN 1987 AND 1992; 
SELECT league, SUM(home_team_goal + away_team_goal) AS total_goals FROM matches GROUP BY league ORDER BY total_goals ASC LIMIT 5; 
SELECT AVG(COUNT(long_shots))  FROM (     SELECT player_fifa_api_id, COUNT(long_shots) AS long_shot_count      FROM matches      WHERE player_fifa_api_id = (SELECT fifa_api_id FROM players WHERE name = 'Ahmed Samir Farag')     GROUP BY player_fifa_api_id ) subquery 
SELECT TOP 10 Player.name  FROM Player  JOIN Stats ON Player.player_fifa_api_id = Stats.player_fifa_api_id  WHERE Player.height > 180  GROUP BY Player.player_fifa_api_id, Player.name  ORDER BY AVG(Stats.heading_accuracy) DESC; 
SELECT team_long_name  FROM (     SELECT team_long_name, AVG(chanceCreationPassing) OVER () AS avg_chance_creation_passing,            chanceCreationPassing     FROM football_data     WHERE buildUpPlayDribblingClass = 'Normal'       AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' ) subquery WHERE chanceCreationPassing < avg_chance_creation_passing ORDER BY chanceCreationPassing DESC; 
SELECT DISTINCT League.name  FROM League  JOIN Match ON League.id = Match.league_id  WHERE season = '2009/2010'  GROUP BY League.name  HAVING AVG(home_team_goal) > AVG(away_team_goal); 
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10';
SELECT attacking_work_rate  FROM players  WHERE player_name = 'Franco Zennaro'; 
SELECT buildUpPlayPositioningClass  FROM match_data  WHERE team_long_name = 'ADO Den Haag'  AND match_period <= 2/3; 
SELECT      header_finishing_rate FROM      football_player_stats WHERE      player_name = 'Francois Affolter' AND      date = '2014-09-18 00:00:00'; 
SELECT AVG(rating)  FROM football_players  JOIN player_ratings ON football_players.player_id = player_ratings.player_id  WHERE strftime('%Y', player_ratings.date) = '2011'  AND football_players.name = 'Gabriel Tamas'; 
SELECT COUNT(*)  FROM matches  JOIN leagues ON matches.league_id = leagues.id  WHERE matches.season = '2015/2016' AND leagues.name = 'Scotland Premier League' 
SELECT preferred_foot  FROM players  WHERE latest_birthday = (SELECT MIN(latest_birthday) FROM players); 
SELECT potential FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes); 
SELECT COUNT(*)  FROM players  WHERE weight < 130 AND preferred_foot = 'left'; 
SELECT team_short_name  FROM football_teams  JOIN passing_classes ON football_teams.passing_class_id = passing_classes.id  WHERE passing_classes.chance_creation_passing_class = 'Risky'; 
SELECT defensive_work_rate  FROM football_players  WHERE name = 'David Wilson'; 
SELECT birthday  FROM players  WHERE overall_rating = (SELECT MAX(overall_rating) FROM players); 
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Netherlands'; 
SELECT AVG(home_team_goal)  FROM matches  WHERE name = 'Poland' AND season = '2010/2011'; 
SELECT AVG(TA.finishing) AS avg_finishing_rate FROM Player_Attributes TA JOIN Player P ON TA.player_api_id = P.player_api_id WHERE P.height = (SELECT MAX(height) FROM Player) UNION SELECT AVG(TA.finishing) AS avg_finishing_rate FROM Player_Attributes TA JOIN Player P ON TA.player_api_id = P.player_api_id WHERE P.height = (SELECT MIN(height) FROM Player) LIMIT 1; 
SELECT player_name FROM Player WHERE height > 180; 
SELECT COUNT(*) FROM Player WHERE strftime('%Y', `birthday`) > '1990'; 
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%' AND weight > 170; 
SELECT player_name FROM player_table WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010' 
SELECT potential  FROM players  WHERE name = 'Aaron Doran'; 
SELECT player_name  FROM players  WHERE preferred_foot = 'left'; 
SELECT team_long_name  FROM teams  WHERE buildUpPlaySpeedClass = 'Fast'; 
SELECT buildUpPlayPassingClass FROM team_stats WHERE team_short_name = 'CLB'; 
SELECT team_short_name FROM team_stats WHERE buildUpPlayPassing > 70; 
SELECT AVG(t2.overall_rating)  FROM (     SELECT player_id, MAX(height) AS height      FROM players      WHERE date BETWEEN '2010-01-01' AND '2015-12-31'     GROUP BY player_id ) t1  JOIN players t2 ON t1.player_id = t2.id  WHERE t1.height > 170  GROUP BY t2.id  HAVING MAX(t2.date) BETWEEN '2010-01-01' AND '2015-12-31'; 
SELECT PlayerName  FROM FootballPlayers  WHERE Height = (SELECT MIN(Height) FROM FootballPlayers) 
SELECT Country  FROM League  WHERE Name = 'Italy Serie A'; 
SELECT team_short_name  FROM teams  WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32; 
SELECT AVG(overall_rating) AS average_overall_rating FROM football_players WHERE name = 'Aaron Doran'; 
SELECT COUNT(*)  FROM matches  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10'; 
SELECT DISTINCT team_short_name  FROM matches  WHERE home_team_goal = 10; 
SELECT player_name FROM football_players WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM football_players WHERE potential = 61); 
SELECT      (AVG(T1.ball_control) - AVG(T2.ball_control)) AS avg_ball_control_difference FROM      (SELECT ball_control FROM players WHERE player_name = 'Abdou Diallo') AS T1,     (SELECT ball_control FROM players WHERE player_name = 'Aaron Appindangoye') AS T2; 
SELECT `team_long_name` FROM `Team` WHERE `team_short_name` = 'GEN';
SELECT player_name FROM Player WHERE birthday < (SELECT birthday FROM Player WHERE player_name = 'Aaron Lennon') AND birthday > (SELECT birthday FROM Player WHERE player_name = 'Abdelaziz Barrada')
SELECT `player_name` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`)
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low' 
SELECT Country FROM Leagues WHERE name = 'Belgium Jupiler League';
SELECT League  FROM Teams  JOIN Leagues ON Teams.league_id = Leagues.id  WHERE Leagues.country_id IN (SELECT id FROM Countries WHERE name = 'Germany'); 
SELECT PlayerName  FROM Players  WHERE overall_rating = (SELECT MAX(overall_rating) FROM Players); 
SELECT COUNT(DISTINCT player_id) FROM players WHERE strftime('%Y', birthday) < '1986' AND defensive_work_rate = 'high'; 
SELECT MAX(crossing) AS BestCrossing FROM players WHERE name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone'); 
SELECT heading_accuracy  FROM players  WHERE name = 'Ariel Borysiuk' 
SELECT COUNT(*)  FROM players  WHERE height > 180 AND volleys > 70; 
SELECT player_name  FROM players  WHERE volleys > 70 AND dribbling > 70; 
SELECT COUNT(*)  FROM matches  JOIN seasons ON matches.season_id = seasons.id  JOIN locations ON matches.location_id = locations.id  JOIN countries ON locations.country_id = countries.id  WHERE seasons.season_year IN (2008, 2009) AND countries.name = 'Belgium'; 
SELECT MAX(long_passing)  FROM players  WHERE birthday = (SELECT MIN(birthday) FROM players); 
SELECT COUNT(*)  FROM matches  WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04' 
 SELECT league.name  FROM Match  JOIN League AS league ON Match.league_id = League.id  WHERE Match.season = '2008/2009'  GROUP BY league.name  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT AVG(overall_rating)  FROM players  WHERE strftime('%Y', birthday) < '1986'; 
SELECT      ((SELECT overall_rating FROM players WHERE player_name = 'Ariel Borysiuk') -       (SELECT overall_rating FROM players WHERE player_name = 'Paulin Puel')) /      (SELECT overall_rating FROM players WHERE player_name = 'Paulin Puel') * 100 AS percentage_difference FROM     (SELECT overall_rating FROM players WHERE player_name IN ('Ariel Borysiuk', 'Paulin Puel')) subquery; 
SELECT AVG(buildUpPlaySpeed) AS average_build_up_play_speed FROM team_stats WHERE team_long_name = 'Heart of Midlothian'; 
SELECT AVG(T1.overall_rating)  FROM your_table_name AS T1  WHERE T1.player_name = 'Pietro Marino'; 
SELECT SUM(T2.crossing)  FROM players AS T1  JOIN player_stats AS T2 ON T1.player_id = T2.player_id  WHERE T1.player_name = 'Aaron Lennox'; 
SELECT MAX(chanceCreationPassing) AS highest_chance_creation_passing_score, chanceCreationPassingClass  FROM your_table_name  WHERE team_long_name = 'Ajax'; 
SELECT preferred_foot  FROM players  WHERE player_name = 'Abdou Diallo'; 
SELECT MAX(overall_rating)  FROM T2  WHERE player_name = 'Dorlan Pabon'; 
SELECT AVG(away_team_goal) AS average_goals FROM "Match" WHERE away_team = 'Parma' AND home_country_id IN (     SELECT id FROM Country WHERE name = 'Italy' ); 
SELECT player_name  FROM players  WHERE overall_rating = 77 AND date LIKE '2016-06-23%'  ORDER BY birthday ASC  LIMIT 1; 
SELECT AVG(rating) AS overall_rating FROM player_ratings WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%'; 
SELECT potential  FROM players  WHERE player_name = 'Francesco Parravicini'  AND date = '2010-08-30 00:00:00'; 
SELECT attacking_work_rate FROM player_stats WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%'; 
SELECT defensive_work_rate FROM match_stats WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'; 
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant') ORDER BY date LIMIT 1;
SELECT build_up_play_speed_class  FROM match_data  WHERE team_long_name = 'Willem II'  AND date = '2012-02-22'; 
SELECT build_up_play_dribbling_class  FROM match_data  WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00'; 
SELECT build_up_play_passing_class  FROM matches  WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%' 
SELECT chance_creation_passing_class  FROM match_statistics  WHERE team_long_name = 'PEC Zwolle'  AND date = '2013-09-20 00:00:00'; 
SELECT crossing_class  FROM your_table_name  WHERE team_long_name = 'Hull City'  AND date = '2010-02-22 00:00:00'; 
SELECT defence_aggression_class  FROM match_data  WHERE team_long_name = 'Hannover 96'  AND date LIKE '2015-09-10%'; 
SELECT AVG(overall_rating)  FROM player_ratings  WHERE player_name = 'Marko Arnautovic'  AND DATE(date_recorded) BETWEEN '2007-02-22' AND '2016-04-21'; 
SELECT      ((         SELECT overall_rating FROM players WHERE player_name = 'Landon Donovan'     ) - (         SELECT overall_rating FROM players WHERE player_name = 'Jordan Bowery'     )) * 100 / (         SELECT overall_rating FROM players WHERE player_name = 'Landon Donovan'     ) AS percentage_difference; 
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;
SELECT player_name FROM Player WHERE DATEDIFF(CURRENT_TIMESTAMP, birthday) >= 34; 
SELECT COUNT(*)  FROM matches  JOIN goals ON matches.match_id = goals.match_id  JOIN players ON goals.player_id = players.player_id  WHERE players.player_name = 'Aaron Lennon'; 
SELECT SUM(goal_scored)  FROM (     SELECT goal_scored      FROM match_details      WHERE player_name = 'Daan Smith' OR player_name = 'Filipe Ferreira' ) AS subquery; 
SELECT SUM(home_team_goals)  FROM (     SELECT p.birthday, h.home_team_goals     FROM Player p     JOIN (         SELECT DISTINCT player_id, MAX(game_date) AS latest_game_date         FROM games         GROUP BY player_id     ) g ON p.player_id = g.player_id     JOIN games USING (player_id, game_date)     WHERE EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.birthday) <= 30 ) subquery; 
SELECT player_name FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT player_name  FROM players  WHERE potential = (SELECT MAX(potential) FROM players); 
SELECT p.player_name  FROM players p  JOIN matches m ON p.player_id = m.player_id  JOIN actions a ON m.match_id = a.match_id  WHERE a.action_type = 'attack' AND a.attacking_work_rate = 'high' GROUP BY p.player_name HAVING COUNT(*) > 0; 
SELECT player_name  FROM players  WHERE finishing = 1  AND TIMESTAMPDIFF(SECOND, birthday, CURRENT_TIMESTAMP) = (SELECT MAX(TIMESTAMPDIFF(SECOND, birthday, CURRENT_TIMESTAMP))                                                               FROM players                                                               WHERE finishing = 1); 
SELECT player_name  FROM players  WHERE country = 'Belgium' 
SELECT Country  FROM Players  WHERE Vision > 89; 
SELECT Country FROM Players GROUP BY Country ORDER BY AVG(Weight) DESC LIMIT 1; 
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Slow'; 
SELECT team_short_name FROM team_stats WHERE chanceCreationPassingClass = 'Safe'; 
SELECT AVG(T1.height)  FROM Player AS T1  JOIN Match AS T2 ON T1.id = T2.country_id  JOIN Country AS T3 ON T2.country_id = T3.id  WHERE T3.name = 'Italy'
 SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3; 
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND STRFTIME('%Y', birthday) > '1990' 
SELECT ABS((SELECT jumping FROM players WHERE id = 6) - (SELECT jumping FROM players WHERE id = 23)) AS score_difference; 
SELECT player_api_id  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)  AND preferred_foot = 'right'  ORDER BY potential  LIMIT 5 
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)  AND preferred_foot = 'left'; 
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Player_Attributes WHERE stamina > 80 AND strength > 80) AS percentage FROM Player_Attributes WHERE stamina > 80 AND strength > 80 
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Poland Ekstraklasa'
SELECT home_team_goal, away_team_goal  FROM matches  JOIN League ON matches.league_id = League.id  WHERE League.name = 'Belgium Jupiler League'  AND date LIKE '2008-09-24%'; 
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` WHERE `player_api_id` IN (     SELECT `player_api_id`     FROM `Player`     WHERE `player_name` = 'Alexis Blin' )
SELECT buildUpPlaySpeedClass  FROM team_stats  WHERE team_long_name = 'KSV Cercle Brugge'; 
SELECT COUNT(*)  FROM games  WHERE season = '2015/2016' AND league = 'Italian Serie A'; 
SELECT MAX(home_team_goal) AS highest_home_score FROM matches WHERE competition = 'Netherlands Eredivisie'; 
SELECT T2.finishing, T2.curve FROM `Player` AS T1 JOIN `Player_Attributes` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight = (SELECT MAX(weight) FROM `Player`); 
 SELECT L.name FROM League AS L JOIN Match AS M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY COUNT(M.id) DESC LIMIT 4; 
SELECT team_long_name  FROM matches  WHERE away_team_api_id IN (     SELECT away_team_api_id      FROM matches      GROUP BY away_team_api_id      ORDER BY SUM(CASE WHEN away_team_goal > home_team_goal THEN 1 ELSE 0 END) DESC      LIMIT 1 ) AND MAX(away_team_goal) = away_team_goal; 
SELECT Player_Name FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);
SELECT      (COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END)       OVER ()      / COUNT(*)       OVER ()) * 100 AS percentage FROM      players; 
SELECT      (COUNT(*) WHERE `SEX` = 'M' AND `Admission` = '+') * 100.0 / SUM(COUNT(*)     OVER () WHERE `SEX` = 'M') - (COUNT(*) WHERE `SEX` = 'M' AND `Admission` = '-') * 100.0 / SUM(COUNT(*)     OVER () WHERE `SEX` = 'M') AS PercentageDeviation; 
SELECT CAST(COUNT(CASE WHEN YEAR(`Birthday`) > '1930' AND `SEX` = 'F' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN `SEX` = 'F' THEN 1 ELSE NULL END) AS Percentage FROM `Patient`; 
SELECT      COUNT(CASE WHEN YEAR(`Birthday`) BETWEEN 1930 AND 1940 THEN 1 END) * 100.0 / COUNT(*) AS PercentageOfInpatients FROM `Patient` WHERE `Admission` = '+'; 
SELECT      CAST(SUM(CASE WHEN `Admission` = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN `Diagnosis` = 'SLE' THEN 1 ELSE 0 END) AS Ratio FROM      `Patient` WHERE      `Diagnosis` = 'SLE'; 
SELECT T1.Diagnosis, T2.Date  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.ID = '30609' 
SELECT      Patient.SEX,      Patient.Birthday,      Examination.Examination_Date,      Examination.Symptoms  FROM      Patient  JOIN      Examination ON Patient.ID = Examination.ID  WHERE      Patient.ID = 163109;
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500; 
SELECT P.ID,         (strftime('%Y', 'now') - strftime('%Y', B.Birthday)) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+' 
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 2 AND P.Diagnosis IS NOT NULL; 
SELECT P.ID, P.Birthday, L.T_CHO FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday LIKE '1937-%' AND L.T_CHO >= 250; 
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALB < 3.5; 
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID; 
SELECT AVG(`aCL IgG`)  FROM `Examination`  JOIN `Patient` ON `Examination.ID` = `Patient.ID`  WHERE `Patient.Admission` = '+' AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM `Patient.Birthday`) >= 50; 
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(`Description`) = 1997 AND Admission = '-' 
SELECT MIN(TIMESTAMPDIFF(YEAR, Birthday, First_Date)) AS Age_When_Arrived FROM Patient;
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Examination_Date LIKE '1997-%' AND e.Thrombosis = 1 AND p.SEX = 'F' 
SELECT      (EXTRACT(YEAR FROM MAX(Patient.Birthday)) - EXTRACT(YEAR FROM MIN(Patient.Birthday))) AS AgeGap FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.TG >= 200; 
SELECT T2.Diagnosis, T1.Symptoms FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Symptoms IS NOT NULL AND T2.Birthday = (SELECT MIN(Birthday) FROM Patient) 
SELECT AVG(COUNT(l.ID) / 12) AS AverageMalePatientsTestedPerMonth FROM (     SELECT DISTINCT p.ID     FROM Patient p     JOIN Laboratory l ON p.ID = l.ID     WHERE p.SEX = 'M'         AND l.Date BETWEEN '1998-01-01' AND '1998-12-31' ) AS m 
SELECT MAX(Laboratory.Date) AS LastLabDate,         (STRFTIME('%Y', Patient.Birthday) - STRFTIME('%Y', Patient.First_Date)) AS AgeAtFirstVisit FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SJS' ORDER BY Patient.Birthday ASC LIMIT 1; 
SELECT      CAST(SUM(CASE WHEN LAB.UA <= 8.0 AND PAT.SEX = 'M' THEN 1 ELSE 0 END) AS REAL) /      CAST(SUM(CASE WHEN LAB.UA <= 6.5 AND PAT.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) AS Ratio FROM      Patient PAT JOIN      Laboratory LAB ON PAT.ID = LAB.ID; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.`First Date` IS NOT NULL AND        (e.Examination Date IS NULL OR         EXTRACT(YEAR FROM e.Examination Date) - EXTRACT(YEAR FROM p.`First Date`) >= 1) 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE YEAR(e.Examination_Date) BETWEEN 1990 AND 1993  AND YEAR(p.Birthday) < 18; 
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.T_BIL >= 2.0 
SELECT Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Examination_Date BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT AVG(DATE_PART('year', '1999'::text - Birthday))  FROM Patient  WHERE ID IN (     SELECT DISTINCT ID FROM Examination      WHERE Examination.Date BETWEEN '1991-10-01'::date AND '1991-10-30'::date ) 
SELECT      (strftime('%Y', 'Laboratory.Date') - strftime('%Y', `Patient.Birthday`)) AS Age,     `Patient.Diagnosis` FROM      `Patient` JOIN      `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE      `Laboratory.HGB` = (SELECT MAX(HGB) FROM `Laboratory`); 
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT T-CHO  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.ID = 2927464 AND Date = '1995-09-04' AND T-CHO < 250 
SELECT `SEX` FROM `Patient` WHERE `Diagnosis` = 'AORTITIS' ORDER BY `First Date` ASC LIMIT 1;
SELECT `aCL IgM` FROM `Examination` JOIN `Patient` ON `Examination.ID` = `Patient.ID` WHERE `Patient.Diagnosis` = 'SLE' AND `Patient.Description` LIKE '1994-02-19%' AND `Examination.Examination Date` = '1993-11-12'
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'F' AND Laboratory.GPT = 9 AND Laboratory.Date = '1992-06-12'; 
SELECT Patient.ID,         (EXTRACT(YEAR FROM '1991-10-21') - EXTRACT(YEAR FROM Patient.Birthday)) AS age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UA = 8.4 AND Laboratory.Date = '1991-10-21'; 
SELECT COUNT(T2.ID)  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.First_Date = '1991-06-13' AND T1.Diagnosis = 'SJS' AND YEAR(T2.Date) = 1995 
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T1.Examination_Date = '1997-01-27' AND T2.First_Date IS NOT NULL ORDER BY T2.First_Date LIMIT 1
SELECT T1.Symptoms FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.Examination_Date = '1993-09-27' 
SELECT      (SUM(CASE WHEN Date LIKE '1981-11-%' THEN T_CHO END) - SUM(CASE WHEN Date LIKE '1981-12-%' THEN T_CHO END)) / NULLIF(SUM(CASE WHEN Date LIKE '1981-11-%' THEN T_CHO END), 0) * 100 AS Decrease_Rate FROM      Laboratory l JOIN      Patient p ON l.ID = p.ID WHERE      p.Birthday = '1959-02-18' 
SELECT DISTINCT T1.ID  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T1.Diagnosis = 'Behcet\'s'  AND STRFTIME('%Y-%m-%d', T1.Examination Date) BETWEEN '1997-01-01' AND '1997-12-31'; 
SELECT `ID` FROM `Laboratory` WHERE `Date` BETWEEN '1987-07-06' AND '1996-01-31' AND `GPT` > 30 AND `ALB` < 4; 
SELECT ID  FROM Patient  WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'  ORDER BY ID; 
SELECT COUNT(*)  FROM Examination  WHERE Thrombosis = 2 AND ANA_Pattern = 'S' AND `aCL IgM` > (AVG(`aCL IgM`) * 1.2) 
SELECT      CAST(SUM(CASE          WHEN `UA` <= 6.5 AND (`U-PRO` > 0 AND `U-PRO` < 30) THEN 1          ELSE 0      END) AS REAL) * 100 / COUNT(*) FROM      `Laboratory` WHERE      `U-PRO` BETWEEN 0 AND 30; 
SELECT      (SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END)       OVER () * 100.0 / COUNT(CASE WHEN YEAR(`First Date`) = 1981 THEN 1 ELSE 0 END) OVER ()) AS Percentage_BEHCET_1981 FROM      Patient WHERE      `SEX` = 'M'; 
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.T_BIL < 2.0; 
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.ANA_Pattern != 'P' AND p.SEX = 'F' AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31' 
SELECT T2.SEX FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T1.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123; 
SELECT AVG(T2.ALB)  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.SEX = 'F' AND T1.Diagnosis = 'SLE' AND T2.PLT > 400; 
SELECT MAX(Symptoms) AS MostCommonSign FROM Examination WHERE Diagnosis = 'SLE'; 
SELECT `First Date`, `Diagnosis` FROM `Patient` WHERE `ID` = '48473' AND `First Date` IS NOT NULL;
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE strftime('%Y', Date) = '1997' AND ALB NOT BETWEEN 6 AND 8.5; 
SELECT CAST(SUM(CASE WHEN Diagnosis LIKE '%ITP%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS proportion FROM Examination WHERE Diagnosis LIKE '%SLE%' 
SELECT      CAST(SUM(CASE WHEN T.Birthday LIKE '%-1980-%' AND T.Diagnosis = 'RA' AND T.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T.Birthday LIKE '%-1980-%' AND T.Diagnosis = 'RA' THEN 1 END) AS PercentageOfWomenWithRABornIn1980 FROM Patient T; 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.Diagnosis = 'Behcet' AND e.Examination_Date BETWEEN '1995' AND '1997' AND p.Admission = '-' AND p.SEX = 'M'
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5; 
SELECT DATEDIFF(`Examination.Date`, `Patient.First Date`)  FROM `Examination`, `Patient`  WHERE `Examination.ID` = '821298' AND `Examination.ID` = `Patient.ID`  AND `Patient.First Date` IS NOT NULL  ORDER BY `Examination.Date` ASC LIMIT 1;
SELECT EXISTS (     SELECT 1 FROM Patient p     JOIN Laboratory l ON p.ID = l.ID     WHERE p.ID = 57266 AND (p.SEX = 'M' AND l.UA > 8.0 OR p.SEX = 'F' AND l.UA > 6.5) ); 
SELECT Date FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.ID = '48473' AND GOT >= 60; 
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT < 60 AND SUBSTR(T2.Date, 1, 4) = '1994' 
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60 
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC; 
SELECT AVG(LDH)  FROM Laboratory  WHERE LDH < 500;
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800 
SELECT p.Admission, COUNT(*) as PatientCount FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP < 300 AND p.Admission != '' GROUP BY p.Admission; 
SELECT P.ID  FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = '1982-04-01' AND L.ALP < 300; 
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0; 
SELECT      LAB.TP - 8.5 AS TP_deviation FROM      Patient JOIN      Laboratory LAB ON Patient.ID = LAB.ID WHERE      Patient.SEX = 'F' AND LAB.TP > 8.5; 
SELECT P.ID, P.Birthday, L.ALB FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC; 
SELECT p.ID, p.Birthday, l.ALB FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1982 AND l.ALB BETWEEN 3.5 AND 5.5; 
SELECT      COUNT(CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 1 END) AS abnormal_count,     COUNT(CASE WHEN SEX = 'F' THEN 1 END) AS total_female_count,     CAST(COUNT(CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN SEX = 'F' THEN 1 END) AS percentage FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE SEX = 'F'; 
SELECT AVG(l.UA)  FROM (     SELECT t2.UA FROM (         SELECT * FROM Patient WHERE SEX IN ('M', 'F')     ) AS t1     JOIN Laboratory AS l ON t1.ID = l.ID     WHERE t1.SEX IN ('M', 'F') AND (t1.SEX = 'M' AND l.UA < 8.0 OR t1.SEX = 'F' AND l.UA < 6.5)     ORDER BY l.Date DESC LIMIT 1 ) AS t3; 
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.UN WHERE T2.UN = 29 
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'RA' AND T2.UN < 30; 
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5; 
SELECT      (COUNT(CASE WHEN T1.SEX = 'M' AND T2.CRE >= 1.5 THEN 1 END) > COUNT(CASE WHEN T1.SEX = 'F' AND T2.CRE >= 1.5 THEN 1 END)) AS result FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID; 
SELECT P.ID, P.SEX, P.Birthday, MAX(L.T-BIL) AS Highest_T_Bil FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.T_BIL IS NOT NULL GROUP BY P.ID, P.SEX, P.Birthday ORDER BY Highest_T_Bil DESC LIMIT 1; 
SELECT      T1.SEX,     GROUP_CONCAT(DISTINCT T1.ID) AS PatientIDs FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID WHERE      T2.T_BIL >= 2.0 GROUP BY      T1.SEX; 
SELECT p.ID, l.T_CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.T_CHO = (SELECT MAX(T_CHO) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient)) 
SELECT AVG(DATEDIFF(CURRENT_DATE, Birthday)) AS AverageAge FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE SEX = 'M' AND T_CHO >= 250; 
SELECT P.ID, P.Diagnosis, L.TG FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG > 300; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday) > 50; 
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.CPK < 250; 
SELECT COUNT(DISTINCT ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE YEAR(Birthday) BETWEEN 1936 AND 1956  AND Sex = 'M'  AND CPK >= 250; 
SELECT P.ID, P.SEX,         (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GLU >= 180 AND L.T_CHO < 250; 
SELECT P.ID, L.GLU FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.First_Date BETWEEN '1991-01-01' AND '1991-12-31' AND L.GLU IS NOT NULL AND L.GLU < 180; 
SELECT T1.ID, T1.SEX, T1.Birthday,         CASE             WHEN T2.WBC <= 3.5 THEN 'Abnormal Low'            WHEN T2.WBC >= 9.0 THEN 'Abnormal High'            ELSE 'Normal'        END AS WBC_Status,        TIMESTAMPDIFF(YEAR, T1.Birthday, CURDATE()) AS Age FROM Patient T1 JOIN Laboratory T2 ON T1.ID = T2.ID WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 GROUP BY T1.SEX ORDER BY T1.SEX, Age ASC; 
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RBC < 3.5 
SELECT p.ID, p.Birthday, p.Admission, l.RBC FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND       EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) >= 50 AND       (l.RBC <= 3.5 OR l.RBC >= 6.0) AND p.Admission = '+'; 
SELECT T1.ID, T1.SEX FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.HGB < 10 
SELECT P.ID, P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.HGB BETWEEN 10 AND 17 AND P.Birthday = (     SELECT MIN(Birthday) FROM Patient WHERE Diagnosis = 'SLE' ) 
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age  FROM Patient P  JOIN (     SELECT ID      FROM Laboratory      WHERE HCT >= 52      GROUP BY ID      HAVING COUNT(*) >= 2 ) L ON P.ID = L.ID 
SELECT AVG(Laboratory.HCT) AS Average_Hematocrit FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.Date LIKE '1991%' AND Laboratory.HCT < 29; 
SELECT ABS((SUM(Laboratory.PLT < 100) - SUM(Laboratory.PLT > 400)) AS Comparison) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.PLT <= 100 OR Laboratory.PLT >= 400; 
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T2.Date) = '1984' AND strftime('%Y', datetime('now')) - strftime('%Y', T1.Birthday) < 50 AND T2.PLT BETWEEN 100 AND 400 
SELECT      CAST(SUM(CASE WHEN T1.SEX = 'F' AND T2.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID)  FROM      Patient T1  JOIN      Laboratory T2  ON      T1.ID = T2.ID  WHERE      EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM T1.Birthday) > 55; 
SELECT p.ID, p.First_Date, l.PT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.First_Date > '1992-12-31' AND l.PT < 14; 
SELECT COUNT(*)  FROM (     SELECT *      FROM Laboratory      WHERE Date > '1997-01-01' AND APTT IS NOT NULL AND APTT >= 45 ) AS filtered_examinations 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.APTT IS NOT NULL AND e.APTT > 45 AND p.Thrombosis = 0 
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.WBC BETWEEN 3.5 AND 9.0 AND l.FG <= 150 OR l.FG >= 450 GROUP BY p.ID HAVING COUNT(*) = 1 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Birthday > '1980-01-01' AND l.FG < 150 OR l.FG > 450; 
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.U_PRO >= 30; 
SELECT `Patient`.`ID` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Patient`.`Diagnosis` = 'SLE' AND `Laboratory`.`U-PRO` BETWEEN 0 AND 30; 
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000 
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.IGG BETWEEN 900 AND 2000 AND e.Symptoms IS NOT NULL 
SELECT Diagnosis FROM PatientTestResults WHERE IGA BETWEEN 80 AND 500 AND IGA = (SELECT MAX(IGA) FROM PatientTestResults WHERE IGA BETWEEN 80 AND 500); 
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA BETWEEN 80 AND 500 AND STRFTIME('%Y', p.`First Date`) >= '1990' 
SELECT T1.Diagnosis, COUNT(*) AS frequency FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGM <= 40 OR T2.IGM >= 400 GROUP BY T1.Diagnosis ORDER BY frequency DESC LIMIT 1; 
SELECT COUNT(*) FROM Patient WHERE CRP = '+' AND Description IS NULL;
SELECT COUNT(*)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRE >= 1.5 AND DATEDIFF(YEAR(CURDATE()), p.Birthday) < 70 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.RA IN ('-', '+-') AND e.KCT = '+' 
SELECT Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE EXTRACT(YEAR FROM Birthday) >= 1985 AND Examination.RA IN ('-', '+-') 
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RF < 20 AND DATEDIFF(YEAR(CURRENT_DATE(), P.Birthday)) > 60 
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON l.ID = p.ID WHERE l.RF < '20' AND e.Thrombosis = '0' 
SELECT COUNT(DISTINCT T1.ID)  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  JOIN Laboratory AS T3 ON T2.ID = T3.ID  WHERE T3.C3 > 35 AND T1.ANA_Pattern = 'P' 
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.HCT BETWEEN 29 AND 52 ORDER BY T2.aCL_IgA DESC LIMIT 1; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis LIKE '%APS%' AND l.C4 > 10; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RNP IN ('-', '+-') AND p.Admission = '+' 
SELECT `Birthday` FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.ID` WHERE `Laboratory.RNP` NOT IN ('-', '+-') ORDER BY `Patient.Birthday` ASC LIMIT 1; 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.SM IN ('-', '+-') AND p.Thrombosis = 0; 
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') AND T1.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE SM NOT IN ('negative', '0')) LIMIT 3) ORDER BY T1.Birthday ASC LIMIT 3; 
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date > '1997-01-01' AND T2.SC170 IN ('negative', '0') 
SELECT COUNT(DISTINCT ID) FROM Patient WHERE `SC170` IN ('negative', '0')  AND Sex = 'F' AND Symptoms IS NULL; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Symptoms LIKE '%normal anti-SSA%' AND strftime('%Y', p.`First Date`) < '2000' 
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T1.`First Date` LIMIT 1 
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.SSB IN ('-', '0') AND Patient.Diagnosis = 'SLE' 
SELECT COUNT(DISTINCT Examination.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.SSB IN ('negative', '0') AND Examination.Symptoms IS NOT NULL; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CENTROMEA IN ('-', '+-') AND l.SSB IN ('-', '+-') AND p.SEX = 'M' 
SELECT T1.Diagnosis  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.DNA IS NOT NULL AND CAST(SUBSTRING(T2.DNA, CHARINDEX(' ', T2.DNA) + 1, LEN(T2.DNA)) AS INTEGER) >= 8 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA < 8 AND p.Description IS NULL; 
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.IGG BETWEEN 900 AND 2000 AND Patient.Admission = '+' 
SELECT CAST(COUNT(CASE WHEN L.GOT >= 60 AND P.Diagnosis = 'SLE' THEN L.ID ELSE NULL END) AS REAL) * 100 / COUNT(L.ID) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Diagnosis = 'SLE'; 
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60 
SELECT Birthday FROM Patient JOIN (     SELECT ID     FROM Laboratory     WHERE GOT >= 60 ) AS AbnormalGOT ON Patient.ID = AbnormalGOT.ID ORDER BY Patient.Birthday ASC LIMIT 1; 
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3 
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M' 
SELECT T1.First_Date, T2.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T1.First_Date ASC LIMIT 1; 
SELECT p.First_Date, lab.LDH FROM Patient p JOIN Laboratory lab ON p.ID = lab.ID WHERE p.ID = (     SELECT MAX(ID) FROM Patient ) AND lab.LDH >= 500 LIMIT 1; 
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP >= 300 AND p.Admission = '+'; 
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Admission = '-' AND Laboratory.ALP < 300 
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0 
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' AND l.TP BETWEEN 6.0 AND 8.5; 
SELECT Date FROM Laboratory WHERE ALB BETWEEN 3.5 AND 5.5 ORDER BY ALB DESC LIMIT 1;
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M'  AND l.ALB > 3.5  AND l.ALB < 5.5  AND l.TP BETWEEN 6.0 AND 8.5; 
SELECT e.`aCL IgG`, e.`aCL IgM`, e.`aCL IgA` FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.UA > 6.50 ORDER BY l.UA DESC LIMIT 1; 
SELECT MAX(T1.ANA)  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  JOIN Laboratory AS T3 ON T2.ID = T3.ID  WHERE T3.CRE < 1.5 
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.CRE < 1.5 AND T2.aCL_IgA = (     SELECT MAX(aCL_IgA)     FROM Examination     WHERE ID = T1.ID ) 
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL >= 2.0 AND e.ANA_Pattern LIKE '%P%' 
SELECT T1.ANA FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T3.T_BIL <= 2.0 AND T3.T_BIL IN (     SELECT MAX(T_BIL)     FROM Laboratory     WHERE T_BIL IS NOT NULL AND T_BIL <= 2.0 ) ORDER BY T3.T_BIL DESC LIMIT 1; 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.T_CHO >= 250 AND e.KCT = '-' 
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.T_CHO < 250 AND e.ANA_Pattern = 'P' 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG < 200 AND e.Symptoms IS NOT NULL; 
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN (     SELECT ID, MAX(TG) AS max_triglyceride     FROM Laboratory     WHERE TG < 200     GROUP BY ID ) AS T3 ON T2.ID = T3.ID WHERE T1.ID = T3.ID AND T3.max_triglyceride IS NOT NULL ORDER BY T3.max_triglyceride DESC LIMIT 1; 
SELECT T1.ID FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T2.CPK < 250 
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN (     SELECT ID     FROM Laboratory     WHERE CPK < 250 ) l ON p.ID = l.ID WHERE e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+'; 
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = (SELECT MIN(Birthday) FROM Patient) AND T2.GLU > 180;
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU < 180 AND e.Thrombosis = 0 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0; 
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Diagnosis = 'SLE' AND Laboratory.WBC BETWEEN 3.5 AND 9.0 
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0 AND Patient.Admission = '-' 
SELECT COUNT(*) FROM (     SELECT DISTINCT `Patient`.`ID`     FROM `Patient`     JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID`     WHERE `Laboratory`.`PLT` BETWEEN 100 AND 400     AND `Patient`.`Diagnosis` IS NOT NULL ) 
SELECT p.ID, l.PLT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'MCTD' AND l.PLT BETWEEN 100 AND 400; 
SELECT AVG(Lab.PT)  FROM Patient  JOIN Laboratory Lab ON Patient.ID = Lab.ID  WHERE Patient.SEX = 'M' AND Lab.PT < 14; 
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Thrombosis IN (1, 2) AND l.PT < 14 
SELECT m.major_name FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Angela' AND mem.last_name = 'Sanders';
SELECT COUNT(*) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering';
SELECT T2.first_name, T2.last_name FROM `major` AS T1 JOIN `member` AS T2 ON T1.major_id = T2.link_to_major WHERE T1.department = 'Art and Design Department';
SELECT COUNT(*) FROM `attendance` WHERE `link_to_event` IN (SELECT `event_id` FROM `event` WHERE `event_name` = 'Women''s Soccer')
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' 
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium' 
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.event_id IN (     SELECT a.link_to_event     FROM attendance a     GROUP BY a.link_to_event     ORDER BY COUNT(*) DESC     LIMIT 1 ) AND e.event_name LIKE '%Student_Club%' 
SELECT `college` FROM `major` WHERE `major_id` = (SELECT `link_to_major` FROM `member` WHERE `position` = 'Vice President')
SELECT `event.event_name` FROM `event` JOIN `attendance` ON `event.event_id` = `attendance.link_to_event` JOIN `member` ON `attendance.link_to_member` = `member.member_id` WHERE `member.first_name` = 'Maya' AND `member.last_name` = 'Mclean';
SELECT COUNT(*)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(e.event_date) = 2019;
SELECT COUNT(*)  FROM (     SELECT event.event_id     FROM event     JOIN attendance ON event.event_id = attendance.link_to_event     WHERE event.type = 'Meeting'     GROUP BY event.event_id     HAVING COUNT(attendance.link_to_event) > 10 ) AS subquery; 
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_id, event.event_name HAVING COUNT(*) > 20 AND event.type != 'Fundraiser'; 
SELECT AVG(COUNT(DISTINCT e.event_id)) AS average_attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' AND strftime('%Y', e.event_date) = '2020'; 
SELECT expense_description, MAX(cost)  FROM `expense`  WHERE expense_description LIKE '%club events%'
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering'
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud'; 
SELECT `last_name` FROM `member` WHERE `link_to_major` = (SELECT `major_id` FROM `major` WHERE `major_name` = 'Law and Constitutional Studies')
SELECT `county` FROM `zip_code` WHERE `zip_code` IN (SELECT `zip` FROM `member` WHERE `first_name` = 'Sherri' AND `last_name` = 'Ramsey')
SELECT T1.college FROM `major` AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt';
SELECT SUM(T1.amount) FROM `income` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';
SELECT `city`, `state` FROM `zip_code` JOIN `member` ON `zip_code.zip_code` = `member.zip` WHERE `position` = 'President' AND `member.position` = 'Member';
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois'
SELECT SUM(`spent`) AS total_spent_on_advertisement FROM `budget` JOIN `event` ON `budget`.`link_to_event` = `event`.`event_id` WHERE `event`.`event_name` = 'September Meeting';
SELECT T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.last_name IN ('Pierce', 'Guidi') 
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'October Speaker'
SELECT e.approved  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08' 
SELECT AVG(T1.cost) AS average_cost FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND MONTH(T1.expense_date) IN (9, 10); 
SELECT      (SUM(b.spent WHERE LEFT(e.event_date, 4) = '2019') - SUM(b.spent WHERE LEFT(e.event_date, 4) = '2020')) AS difference_spent_2019_2020 FROM      event e JOIN      budget b ON e.event_id = b.link_to_event; 
SELECT `location` FROM `event` WHERE `event_name` = 'Spring Budget Review';
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';
SELECT MAX(amount) - remaining FROM budget WHERE category = 'Food';
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';
SELECT `county` FROM `zip_code` WHERE `zip_code` = (SELECT `zip` FROM `member` WHERE `first_name` = 'Adela' AND `last_name` = 'O\'Gallagher')
SELECT COUNT(*)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'November Meeting' AND budget.remaining < 0; 
SELECT SUM(T2.amount) FROM `budget` AS T2 JOIN `event` AS T1 ON T2.link_to_event = T1.event_id WHERE T1.event_name = 'September Speaker'
SELECT T1.event_status FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20'; 
SELECT `major.major_name` FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `member.first_name` = 'Brent' AND `member.last_name` = 'Thomason';
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium' 
SELECT T1.type FROM `zip_code` AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielson'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President';
SELECT t2.state FROM member AS t1 JOIN zip_code AS t2 ON t1.zip = t2.zip_code WHERE t1.first_name = 'Sacha' AND t1.last_name = 'Harrison'
SELECT m.department FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.position = 'President';
SELECT `date_received` FROM `income` JOIN `member` ON `income.link_to_member` = `member.member_id` WHERE `member.first_name` = 'Connor' AND `member.last_name` = 'Hilton' AND income.source = 'Dues';
 SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' AND i.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues') 
SELECT      (SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) /       SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END)) AS ratio FROM      event AS T1 JOIN      budget AS T2 ON T1.event_id = T2.link_to_event WHERE      T2.category = 'Advertisement';
SELECT      (SUM(CASE WHEN `category` = 'Parking' AND `event_name` = 'November Speaker' THEN `amount` ELSE 0 END) /       SUM(CASE WHEN `event_name` = 'November Speaker' THEN `amount` ELSE 0 END)) * 100 AS percentage_budget_for_parking FROM `budget`;
SELECT SUM(cost) FROM `expense` WHERE `expense_description` = 'Pizza'; 
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';
SELECT `department` FROM `major` WHERE `college` = 'College of Humanities and Social Sciences';
SELECT z.city, z.county, z.state  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';
 SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget) 
SELECT T3.member_id FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'October Meeting'; 
SELECT major.college FROM member LEFT JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT m.major_name FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.phone = '809-555-3360'
SELECT `event_name` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` WHERE `amount` = (SELECT MAX(`amount`) FROM `budget`)
SELECT `expense.description` FROM `expense` JOIN `member` ON `expense.link_to_member` = `member.member_id` WHERE `member.position` = 'Vice President'
SELECT COUNT(*) FROM `attendance` WHERE `link_to_event` IN (SELECT `event_id` FROM `event` WHERE `event_name` = 'Women''s Soccer');
SELECT `date_received` FROM `income` JOIN `member` ON `income.link_to_member` = `member.member_id` WHERE `member.first_name` = 'Casey' AND `member.last_name` = 'Mason';
SELECT COUNT(*)  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE z.state = 'Maryland' 
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  WHERE member.phone = '(954) 555-6240'
SELECT m.first_name, m.last_name FROM member m JOIN major d ON m.link_to_major = d.major_id WHERE d.department = 'School of Applied Sciences, Technology and Education'; 
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' ORDER BY budget.spent / budget.amount DESC LIMIT 1; 
SELECT COUNT(*) FROM `member` WHERE `position` = 'President';
SELECT MAX(spent) FROM budget;
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'; 
SELECT SUM(`spent`) FROM `budget` WHERE `category` = 'Food'; 
SELECT T1.first_name, T1.last_name  FROM member AS T1  JOIN attendance AS T2  ON T1.member_id = T2.link_to_member  GROUP BY T1.member_id, T1.first_name, T1.last_name  HAVING COUNT(T2.link_to_event) > 7; 
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id JOIN `event` AS T3 ON T3.event_id = ANY (SELECT T4.link_to_event FROM `attendance` AS T4 WHERE T4.link_to_member IN (SELECT T1.member_id FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Interior Design') GROUP BY T4.link_to_event) WHERE T2.major_name = 'Interior Design' AND T3.event_name = 'Community Theater';
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina';
SELECT COUNT(*) FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour')
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40; 
SELECT SUM(e.cost)  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member JOIN budget AS T3 ON T2.link_to_budget = T3.budget_id JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T4.event_name = 'Yearly Kickoff'; 
SELECT T2.first_name, T2.last_name, T1.source FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.amount = (SELECT MAX(amount) FROM income) 
SELECT `event.event_name` FROM `event` JOIN `budget` ON `event.event_id` = `budget.link_to_event` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` WHERE `expense.cost` = (SELECT MIN(`cost`) FROM `expense`)
SELECT      (SUM(cost WHERE event_name = 'Yearly Kickoff') /       (SELECT SUM(cost) FROM expense)) * 100 AS percentage 
SELECT CAST(COUNT(CASE WHEN major_name = 'Finance' THEN 1 END) AS REAL) / COUNT(CASE WHEN major_name = 'Physics' THEN 1 END) FROM `major`;
SELECT `source`, COUNT(`source`) AS source_count FROM `income` WHERE `date_received` BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY `source` ORDER BY source_count DESC LIMIT 1; 
SELECT first_name, last_name, email  FROM member  WHERE position = 'Secretary';
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Physics Teaching')
SELECT COUNT(DISTINCT link_to_member)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater' AND STRFTIME('%Y', event.event_date) = '2019'; 
SELECT COUNT(*) AS num_events_attended, m.major_name FROM member AS mem JOIN attendance AS att ON mem.member_id = att.link_to_member JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi' 
 SELECT AVG(`spent`)  FROM `budget`  WHERE `category` = 'Food' AND `event_status` = 'Closed'; 
 SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' ORDER BY b.spent DESC LIMIT 1; 
SELECT COUNT(*) FROM `attendance` a JOIN `event` e ON a.link_to_event = e.event_id JOIN `member` m ON a.link_to_member = m.member_id WHERE e.event_name = 'Women''s Soccer' AND m.first_name = 'Maya' AND m.last_name = 'Mclean';
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) / CAST(COUNT(*) AS REAL)) * 100  FROM      event  WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31' AND      type = 'Student_Club'; 
SELECT T3.cost FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'September Speaker' AND T3.expense_description = 'Posters';
SELECT t_shirt_size  FROM member  GROUP BY t_shirt_size  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.event_status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1; 
SELECT e.type, SUM(exp.cost) AS total_value FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense exp ON b.budget_id = exp.link_to_budget WHERE e.event_name = 'October Meeting' GROUP BY e.type; 
SELECT category  FROM budget  WHERE link_to_event = 'recI43CzsZ0Q625ma'  ORDER BY amount ASC; 
SELECT * FROM `budget` WHERE `category` = 'Food' AND `amount` = (SELECT MAX(`amount`) FROM `budget` WHERE `category` = 'Food');
 SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3; 
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'; 
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id; 
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison';
SELECT T1.expense_description  FROM expense AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  WHERE T2.t_shirt_size = 'X-Large' 
SELECT T2.zip FROM `expense` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost < 50 
SELECT m.major_name FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Phillip' AND mem.last_name = 'Cullen';
SELECT `position` FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `major.major_name` = 'Business'; 
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30 
 SELECT T1.category FROM `budget` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'; 
SELECT `category` FROM `budget` JOIN `event` ON `budget`.`link_to_event` = `event`.`event_id` WHERE `event`.`event_date` = '2020-03-24T12:00:00';
SELECT T.major_name FROM member AS M JOIN major AS T ON M.link_to_major = T.major_id WHERE M.position = 'Vice President';
SELECT      CAST(SUM(CASE WHEN position = 'Member' AND major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_members_in_Business FROM      member JOIN      major ON member.link_to_major = major.major_id WHERE      major.major_name = 'Finance'; 
SELECT DISTINCT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' 
SELECT COUNT(*) FROM income WHERE amount = 50; 
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large';
SELECT COUNT(*)  FROM `major`  WHERE `college` = 'College of Agriculture and Applied Sciences'  AND `department` = 'School of Applied Sciences, Technology and Education';
SELECT m.last_name, ma.major_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering'; 
SELECT b.category FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0; 
SELECT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE ma.department = 'School of Applied Sciences, Technology and Education' AND ma.major_id IN ('rec06DF6vZ1CyPKpc', 'rec09LedkREyskCNv') AND m.position = 'Member';
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Social' AND m.position = 'Vice President' AND e.location = '900 E. Washington St.'; 
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10' 
SELECT T2.last_name  FROM attendance AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  JOIN event AS T3 ON T1.link_to_event = T3.event_id  WHERE T3.event_name = 'Women''s Soccer' AND T2.position = 'Member' 
SELECT      CAST(SUM(CASE WHEN m.t_shirt_size = 'Medium' AND i.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(i.member_id)  FROM      income i  JOIN      member m ON i.link_to_member = m.member_id; 
SELECT county FROM zip_code WHERE type = 'PO Box' 
SELECT zip_code  FROM zip_code  WHERE county = 'San Juan Municipio' AND state = 'Puerto Rico' AND type = 'PO Box'; 
SELECT event_name  FROM event  WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'; 
SELECT T1.link_to_event FROM `attendance` AS T1 JOIN `expense` AS T2 ON T1.link_to_member = T2.link_to_member WHERE T2.cost > 50 
SELECT T1.member_id, T2.link_to_member FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN expense AS T3 ON T2.link_to_member = T3.link_to_member WHERE T3.approved = 'true' AND T3.expense_date BETWEEN '2019-01-10' AND '2019-11-19'; 
SELECT T2.college FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T2.major_id = 'rec1N0upiVLy5esTO';
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';
SELECT member.email  FROM member  JOIN expense ON member.member_id = expense.link_to_member  WHERE expense.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND expense.cost > 20; 
SELECT COUNT(*)  FROM `member` m  JOIN `major` ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'education' AND m.position = 'Member';
SELECT      (SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) / CAST(COUNT(*) AS REAL)) * 100 AS percentage_over_budget FROM      budget; 
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31' 
SELECT expense_description FROM expense WHERE cost > (SELECT AVG(cost) FROM expense) * 50 / 100; 
SELECT `first_name`, `last_name` FROM `member` WHERE `t_shirt_size` = 'X-Large'; 
SELECT      (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 100.0 / COUNT(zip_code)) AS percentage_PO_boxes FROM      zip_code; 
SELECT T1.event_name, T1.location FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0 
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100; 
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100 
SELECT z.city, z.county FROM zip_code z JOIN member m ON z.zip_code = m.zip JOIN income i ON m.member_id = i.link_to_member GROUP BY z.zip_code HAVING COUNT(i.amount) > 40; 
SELECT m.member_id, SUM(e.cost) AS total_expense FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_expense DESC LIMIT 1; 
SELECT AVG(`cost`)  FROM `expense`  JOIN `member` ON `expense.link_to_member` = `member.member_id`  WHERE `member.position` != 'Member'  GROUP BY `member.member_id`, `member.position`; 
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN `expense` AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.cost < (SELECT AVG(T3.cost) FROM `expense` AS T3 WHERE T3.link_to_budget IN (SELECT budget_id FROM `budget` WHERE category = 'Parking')) AND T2.category = 'Parking' 
 SELECT      (SUM(cost) OVER () * 100 / COUNT(event_id) OVER ()) AS percentage_cost_meeting_events FROM      event WHERE      type = 'Meeting'; 
SELECT `budget_id` FROM `budget` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` WHERE `expense_description` = 'Water, chips, cookies' GROUP BY `budget_id` ORDER BY SUM(`cost`) DESC LIMIT 1;
 SELECT T3.first_name, T3.last_name  FROM expense AS T1  JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id  JOIN member AS T3 ON T3.member_id = T1.link_to_member  GROUP BY T1.link_to_member  ORDER BY SUM(T2.spent) DESC  LIMIT 5 
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN (     SELECT link_to_member, AVG(cost) AS avg_cost     FROM expense     GROUP BY link_to_member ) e ON m.member_id = e.link_to_member WHERE e.avg_cost < (SELECT AVG(cost) FROM expense) AND cost > e.avg_cost; 
 SELECT      (         CAST(SUM(CASE WHEN state = 'New Jersey' THEN 1 ELSE 0 END) AS REAL) / COUNT(CASE WHEN position = 'Member' THEN 1 END) -         CAST(SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) / COUNT(CASE WHEN position = 'Member' THEN 1 END)     ) * 100 
SELECT `major_name`, `department` FROM `major` WHERE `major_id` = (SELECT `link_to_major` FROM `member` WHERE `first_name` = 'Garrett' AND `last_name` = 'Gerke')
SELECT m.first_name, m.last_name, e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies'
SELECT `last_name`, `phone` FROM `member` JOIN `major` ON `member.link_to_major` = `major.major_id` WHERE `major.major_name` = 'Elementary Education' 
SELECT T2.category, T2.amount FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Officers meeting - January';
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'; 
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09' 
SELECT `category` FROM `budget` JOIN `expense` ON `budget.budget_id` = `expense.link_to_budget` WHERE `expense.expense_description` = 'Posters';
SELECT m.first_name || ' ' || m.last_name AS full_name, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary' 
SELECT T2.event_name, SUM(T1.spent) AS total_spent FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts' 
SELECT z.city  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';
SELECT `first_name`, `last_name`, `position` FROM `member` JOIN `zip_code` ON `member.zip` = `zip_code.zip_code` WHERE `zip_code.city` = 'Lincolnton' AND `zip_code.state` = 'North Carolina' AND `zip_code.zip_code` = 28092;
SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Premium';
SELECT      COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / NULLIF(SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END), 0) AS Ratio FROM      customers 
SELECT c.CustomerID, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND LEFT(y.Date, 6) BETWEEN '201201' AND '201212' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;
SELECT AVG(T2.Consumption) / 12 AS AverageMonthlyConsumption FROM `yearmonth` AS T1 JOIN `customers` AS T2 ON T1.CustomerID = T2.CustomerID WHERE LEFT(T1.Date, 4) BETWEEN '201301' AND '201312' AND T2.Segment = 'SME'; 
SELECT `customers.CustomerID` FROM `customers` JOIN `yearmonth` ON `customers.CustomerID` = `yearmonth.CustomerID` WHERE `customers.Currency` = 'CZK' AND `yearmonth.Date` BETWEEN '201101' AND '201112' GROUP BY `customers.CustomerID` ORDER BY SUM(`yearmonth.Consumption`) DESC LIMIT 1;
SELECT COUNT(*)  FROM customers  JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID  WHERE customers.Segment = 'KAM' AND yearmonth.Consumption < 30000 AND yearmonth.Date BETWEEN '201201' AND '201212' 
SELECT      SUM(CASE WHEN T2.Currency = 'CZK' THEN T1.Consumption ELSE 0 END) - SUM(T1.Consumption) FROM      (SELECT `Consumption` FROM `yearmonth` WHERE LEFT(`Date`, 4) BETWEEN '201201' AND '201212') AS T1 JOIN      `customers` AS T2 ON T1.CustomerID = T2.CustomerID WHERE      T2.Currency = 'CZK' GROUP BY      T1.CustomerID; 
SELECT T2.year, SUM(T1.Consumption) AS TotalConsumption FROM yearmonth T1 JOIN customers T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY T2.year ORDER BY TotalConsumption DESC LIMIT 1;
SELECT Segment, MIN(Consumption) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY Segment ORDER BY MIN(Consumption) ASC LIMIT 1;
SELECT SUBSTR(`Date`, 1, 4) AS Year, SUM(`Consumption`) AS TotalConsumption FROM `yearmonth` JOIN `customers` ON `yearmonth.CustomerID` = `customers.CustomerID` WHERE `Currency` = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;
SELECT T2.Date, T2.Consumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption DESC LIMIT 1 
WITH cte AS (     SELECT          c.CustomerID,          c.Segment,          AVG(ym.Consumption) AS AvgConsumption      FROM          customers c      JOIN          yearmonth ym ON c.CustomerID = ym.CustomerID      WHERE          ym.Date LIKE '2013%'      GROUP BY          c.Segment, c.CustomerID ), cte2 AS (     SELECT          Segment,          MIN(AvgConsumption) OVER (PARTITION BY Segment) AS MinAvgConsumption      FROM          cte ) SELECT      CASE          WHEN cte2.Segment = 'SME' THEN cte2.MinAvgConsumption          ELSE NULL      END AS SME_MinAvg,     CASE          WHEN cte2.Segment = 'LAM' THEN cte2.MinAvgConsumption          ELSE NULL      END AS LAM_MinAvg,     CASE          WHEN cte2.Segment = 'KAM' THEN cte2.MinAvgConsumption          ELSE NULL      END AS KAM_MinAvg FROM      cte2; 
WITH ConsumptionData AS (     SELECT          c.Segment,         ym.Date,         ym.Consumption,         LEAD(ym.Consumption, 1) OVER (PARTITION BY c.CustomerID ORDER BY ym.Date) AS NextYearConsumption     FROM          customers c     JOIN          yearmonth ym ON c.CustomerID = ym.CustomerID ), YearlyConsumptionChanges AS (     SELECT          Segment,         Date,         Consumption,         NextYearConsumption,         (NextYearConsumption - Consumption) / NextYearConsumption * 100 AS PercentageChange     FROM          ConsumptionData ) SELECT      Segment,     MAX(PercentageChange) AS MaxPercentageChange,     MIN(PercentageChange) AS MinPercentageChange FROM      YearlyConsumptionChanges WHERE      Date LIKE '2012%'     AND Date LIKE '2013%' GROUP BY      Segment ORDER BY      Segment; 
SELECT SUM(`Consumption`)  FROM `yearmonth`  WHERE `CustomerID` = 6 AND `Date` LIKE '201308%' OR `Date` LIKE '201309%' OR `Date` LIKE '201310%' OR `Date` LIKE '201311%' 
SELECT      (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Value for money') -      (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'SVK' AND `Segment` = 'Value for money') 
SELECT (SELECT `Consumption` FROM `yearmonth` WHERE `CustomerID` = 7 AND `Date` = '201304') - (SELECT `Consumption` FROM `yearmonth` WHERE `CustomerID` = 5 AND `Date` = '201304') AS ConsumptionDifference;
SELECT      (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND `Currency` = 'CZK') -     (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND `Currency` = 'EUR') 
SELECT ym.CustomerID FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1; 
SELECT c.CustomerID, c.Segment, MAX(ym.Consumption) AS MaxConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY MaxConsumption DESC LIMIT 1; 
SELECT SUM(T2.Consumption)  FROM customers AS T1  JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T1.Segment = 'KAM' AND T2.Date = '201305' 
SELECT      100 * SUM(CASE WHEN c.Segment = 'LAM' AND ym.Consumption > 46.73 THEN 1 ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN c.CustomerID END) AS percentage FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID; 
SELECT Country, COUNT(*) AS ValueForMoneyCount FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country; 
SELECT      CAST(SUM(CASE WHEN Segment = 'KAM' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      customers WHERE      Segment = 'KAM' AND      Currency = 'EUR'; 
SELECT      COUNT(*) * 100.0 / (         SELECT COUNT(*)         FROM yearmonth         WHERE Date LIKE '201202'     ) AS percentage FROM yearmonth WHERE Date LIKE '201202' AND Consumption > 528.3; 
SELECT      (COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(*) AS PremiumPercentage FROM      gasstations WHERE      Country = 'CZE'; 
SELECT `CustomerID` FROM `yearmonth` WHERE `Date` = '201309' ORDER BY `Consumption` DESC LIMIT 1; 
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201309' ORDER BY ym.Consumption ASC LIMIT 1; 
SELECT `consumption` FROM `yearmonth` JOIN `customers` ON `yearmonth.CustomerID` = `customers.CustomerID` WHERE `customers.Segment` = 'SME' AND `yearmonth.Date` = '201206' ORDER BY `consumption` ASC LIMIT 1;
SELECT MAX(Consumption) FROM `yearmonth` WHERE LEFT(Date, 4) = '2012'
SELECT MAX(T2.Consumption) * 12 AS MaxAnnualConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' 
SELECT T2.Description  FROM transactions_1k AS T1  JOIN products AS T2 ON T1.ProductID = T2.ProductID  JOIN yearmonth AS T3 ON T1.Date LIKE CONCAT(T3.Date, '%')  WHERE T3.Date LIKE '201309%'  
SELECT DISTINCT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID JOIN yearmonth AS T3 ON T2.Date = T3.Date AND SUBSTR(T3.Date, 1, 4) = '2013' AND SUBSTR(T3.Date, 5, 2) = '06' 
SELECT DISTINCT gs.ChainID FROM gasstations gs JOIN transactions_1k t ON gs.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' 
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'
SELECT AVG(`Amount`) AS AverageTotalPrice FROM `transactions_1k` WHERE `Date` LIKE '2012-01%' 
SELECT COUNT(*) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000; 
SELECT T3.Description  FROM gasstations AS T1  JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID  JOIN products AS T3 ON T2.ProductID = T3.ProductID  WHERE T1.Country = 'CZE' 
SELECT DISTINCT Time  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.ChainID = 11 
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.Country = 'CZE' AND t.Price > 1000 
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01' 
SELECT AVG(t.Price) AS AveragePrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'; 
SELECT AVG(Price)  FROM transactions_1k  JOIN customers ON transactions_1k.CustomerID = customers.CustomerID  WHERE customers.Currency = 'EUR' 
SELECT `CustomerID`, SUM(`Price`) AS TotalPaid FROM `transactions_1k` WHERE `Date` = '2012-08-25' GROUP BY `CustomerID` ORDER BY TotalPaid DESC LIMIT 1;
SELECT T1.Country FROM `gasstations` AS T1 JOIN `transactions_1k` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-25' ORDER BY T2.Time LIMIT 1; 
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Time = '16:25:00' AND T2.Date = '2012-08-24'
SELECT c.`Segment` FROM `customers` c JOIN `transactions_1k` t ON c.`CustomerID` = t.`CustomerID` WHERE t.`CustomerID` IN (     SELECT `CustomerID`     FROM `transactions_1k`     WHERE DATE_FORMAT(`timestamp`, '%Y-%m-%d') = '2012-08-23' ) AND DATE_FORMAT(`timestamp`, '%Y-%m-%d') = '2012-08-23'
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  JOIN customers ON transactions_1k.CustomerID = customers.CustomerID  WHERE transactions_1k.Date = '2012-08-26'  AND gasstations.Country = 'CZE'  AND transactions_1k.Time < '13:00:00'  AND customers.Currency = 'CZK'; 
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT `ProductID` FROM `transactions_1k` AS T1 JOIN `gasstations` AS T2 ON T1.`GasStationID` = T2.`GasStationID` WHERE T1.`Date` = '2012-08-23' AND T1.`Time` = '21:20:00';
SELECT ym.Consumption, t.Date FROM transactions_1k t JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND STRFTIME('%Y-%m', t.Date) = '2012-08' WHERE t.Price = 124.05 UNION SELECT ym.Consumption, t.Date FROM transactions_1k t JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND STRFTIME('%Y-%m', t.Date) = '2012-01' WHERE t.Price = 124.05 LIMIT 1; 
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE Date = '2012-08-26'  AND Time BETWEEN '08:00:00' AND '09:00:00'  AND g.Country = 'CZE'; 
SELECT c.Currency  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE ym.Date LIKE '201306%' AND ym.Consumption = (SELECT SUM(ym.Consumption) FROM yearmonth ym WHERE ym.Date LIKE '201306%')  LIMIT 1; 
SELECT T1.Country FROM `gasstations` AS T1 JOIN `transactions_1k` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = '667467'
SELECT T1.Country  FROM gasstations AS T1  JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T2.Date = '2012-08-24' AND T2.Price * COUNT(*) = 548.4 
SELECT      COUNT(DISTINCT t1.CustomerID) * 100.0 / (         SELECT              COUNT(DISTINCT t2.CustomerID)          FROM              transactions_1k t2          WHERE              DATE(t2.Date) = '2012-08-25'     ) AS percentage_of_customers_EUR FROM      transactions_1k t1  JOIN      customers c ON t1.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' AND DATE(t1.Date) = '2012-08-25' 
SELECT      ((t2.Consumption - t1.Consumption) / t1.Consumption) * 100 AS ConsumptionDecreaseRate FROM      transactions_1k t1 JOIN      yearmonth t2 ON t1.CustomerID = t2.CustomerID AND STRFTIME('%Y-%m', t1.Date) = '2012-08-25' JOIN      yearmonth t3 ON t2.CustomerID = t3.CustomerID AND STRFTIME('%Y-%m', t3.Date) IN ('2012-08', '2013-08') WHERE      t1.Price = 634.8 AND t3.Consumption IS NOT NULL ORDER BY      t2.Date DESC LIMIT 1 
SELECT GasStationID, SUM(Price) AS TotalRevenue FROM transactions_1k GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;
SELECT      COUNT(*) FILTER (WHERE Segment = 'Premium') * 100.0 / COUNT(*) AS premium_percentage FROM      gasstations WHERE      Country = 'SVK' 
SELECT SUM(t.Price) AS AmountSpent FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CustomerID = '38508';  SELECT SUM(t.Price) AS AmountSpentInJan2012 FROM transactions_1k t JOIN yearmonth ym ON t.Date = ym.Date WHERE t.CustomerID = '38508' AND ym.Date = '201201'; 
 SELECT p.Description AS ProductName, SUM(t.Amount) AS TotalSales FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID, p.Description ORDER BY TotalSales DESC LIMIT 5; 
SELECT c.CustomerID, c.Currency, AVG(t.Price) AS AveragePricePerItem, COUNT(*) OVER (PARTITION BY t.CustomerID) AS NumberOfItemsPurchased FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(t.Amount) DESC LIMIT 1; 
SELECT T1.Country FROM `gasstations` AS T1 JOIN (     SELECT `GasStationID`, MAX(`Price`) as max_price     FROM `transactions_1k`     WHERE `ProductID` = 2     GROUP BY `GasStationID` ) AS T2 ON T1.GasStationID = T2.`GasStationID` WHERE T2.max_price = (     SELECT MAX(`Price`)     FROM `transactions_1k`     WHERE `ProductID` = 2 ) 
SELECT ym.Consumption FROM transactions_1k t JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND ym.Date = '201208' WHERE t.ProductID = 5 AND t.Price / t.Amount > 29.00; 
