SELECT MAX(Free_Meal_Count_K_12 / Enrollment_K_12) AS Highest_Eligible_Free_Rate FROM frpm WHERE County_Name = 'Alameda County';	california_schools
SELECT `Free Meal Count (Ages 5-17)`, `Enrollment (Ages 5-17)`, `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3	california_schools
SELECT Zip FROM schools WHERE DOC = 'Fresno County Office of Education' AND Charter = 1	california_schools
SELECT T1.Street, T1.StreetAbr, T1.City, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`FRPM Count (K-12)` = ( SELECT MAX(`FRPM Count (K-12)`) FROM frpm )	california_schools
SELECT DISTINCT Phone FROM schools WHERE CHARTER = 1 AND OpenDate > '2000-01-01'	california_schools
SELECT COUNT(s.School) FROM schools AS s INNER JOIN satscores AS ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath < 400 AND s.Virtual = 'F'	california_schools
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.CDSCode WHERE T1.NumTstTakr > 500 AND T2.Magnet = 1	california_schools
SELECT T2.phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead > 1500 AND T2.AvgScrMath > 1500 AND T2.AvgScrWrite > 1500 ORDER BY T2.NumTstTakr DESC LIMIT 1	california_schools
SELECT t1.NumTstTakr FROM satscores AS t1 INNER JOIN frpm AS t2 ON t1.cds = t2.CDSCode ORDER BY t2.FRPMcount DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM `satscores` WHERE `AvgScrMath` > 560 AND cds IN ( SELECT T1.CDSCode FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter = 1 )	california_schools
SELECT `frpm`.`FRPM Count (Ages 5-17)` FROM `frpm` INNER JOIN `satscores` ON `frpm`.`CDSCode` = `satscores`.`cds` WHERE `satscores`.`rtype` = 'AY' ORDER BY `satscores`.`AvgScrRead` DESC LIMIT 1	california_schools
SELECT T1.CDSCode FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE (T1.`Enrollment (K-12)` + T1.`Enrollment (Ages 5-17)`) > 500	california_schools
SELECT T.`Percent (%) Eligible Free (Ages 5-17)` FROM frpm AS T INNER JOIN satscores AS S ON T.CDSCode = S.cds WHERE S.NumTstTakr > 0 AND S.NumGE1500 / S.NumTstTakr > 0.3 ORDER BY T.`Percent (%) Eligible Free (Ages 5-17)` DESC LIMIT 1	california_schools
SELECT T2.Phone FROM ( SELECT T3.cds, AVG(T3.NumGE1500) * 100.0 / T3.NumTstTakr AS rate FROM satscores AS T3 GROUP BY T3.cds ORDER BY rate DESC LIMIT 3 ) AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode	california_schools
SELECT TOP 5 schools.NCESSchool FROM schools ORDER BY schools.`Enrollment (Ages 5-17)` DESC	california_schools
SELECT T3.`District Name` FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`District Type` = 'Active' ORDER BY T2.AvgScrRead DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM ( SELECT s.CDSCode, sc.NumTstTakr FROM schools s INNER JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Alameda' AND sc.rtype = 'AY' ) t WHERE t.NumTstTakr < 100	california_schools
SELECT CHARTERNUM FROM schools INNER JOIN satscores ON schools.CDSCode = satscores.cds WHERE AvgScrWrite = 499	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.SchoolCode = T2.CDSCode INNER JOIN satscores AS T3 ON T1.SchoolCode = T3.cds WHERE T2.District = 'Contra Costa' AND T3.NumTstTakr <= 250	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.cds ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(CDSCode) FROM schools WHERE LowGrade = '9' AND HighGrade = '12'	california_schools
SELECT COUNT(*) FROM frpm WHERE "County Name" = 'Los Angeles' AND CAST(`Free Meal Count (K-12)` AS INTEGER) > 500 AND CAST(`Free Meal Count (K-12)` AS INTEGER) < 700	california_schools
SELECT t2.sname FROM schools AS t1 INNER JOIN satscores AS t2 ON t1.CDSCode = t2.cds WHERE t1.County = 'Contra Costa' ORDER BY t2.NumTstTakr DESC LIMIT 1	california_schools
SELECT T2.School, T2.Street, T2.StreetAbr, T2.City, T2.Zip FROM frpm AS T1 JOIN schools AS T2 ON T2.CDSCode = T1.CDSCode WHERE T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` > 30	california_schools
SELECT T2.School  FROM schools AS T1  INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T2.`Percent (%) Eligible Free (K-12)` > 0.1 AND EXISTS (SELECT 1                                                            FROM satscores AS T3                                                            WHERE T3.cds = T2.CDSCode AND T3.NumTstTakr >= 1500)	california_schools
SELECT T2.FundingType FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Riverside' AND T2.AvgScrMath > 400 AND T2.rtype = 'A' GROUP BY T1.FundingType	california_schools
SELECT DISTINCT T2.Street, T2.StreetAbr, T2.City, T2.State, T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.CDSCode WHERE T2.City = 'Monterey' AND T2.SchoolType = 'HIGH SCHOOL' AND T1.`Enrollment (Ages 5-17)` > 800 AND T1.`Free Meal Count (Ages 5-17)` IS NOT NULL	california_schools
SELECT T2.sname, T1.AvgScrWrite, T2.phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.OpenDate > '1991-12-31' OR T2.ClosedDate < '2000-01-01'	california_schools
SELECT T1.School, T1.DOCType FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.FundingType = 'Locally Funded' GROUP BY T1.School, T1.DOCType HAVING AVG(T1.`Enrollment (K-12)`) - AVG(T1.`Enrollment (Ages 5-17)`) > ( SELECT AVG(AVG(T2.`Enrollment (K-12)`) - AVG(T2.`Enrollment (Ages 5-17)`)) AS `Avg(Difference)` FROM frpm AS T2 WHERE T2.FundingType = 'Locally Funded' )	california_schools
SELECT MIN(`OpenDate`) FROM schools WHERE `School Type` LIKE 'Public %';	california_schools
SELECT City FROM schools WHERE Grade = '1 - 12' ORDER BY Enrollment ASC LIMIT 5	california_schools
SELECT T3.`Enrollment (K-12)`, T3.`Free Meal Count (K-12)`, SUM(T3.`Free Meal Count (K-12)`) / SUM(T3.`Enrollment (K-12)`) AS eligible_free_rate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN ( SELECT CDSCode, SUM(`Free Meal Count (K-12)`) AS total_count, SUM(`Enrollment (K-12)`) AS total_enrollment FROM frpm GROUP BY CDSCode ORDER BY total_enrollment DESC LIMIT 10 ) AS T3 ON T1.CDSCode = T3.CDSCode	california_schools
SELECT T2.CDS, `FRPM Count (K-12)`, `Enrollment (K-12)`, (`FRPM Count (K-12)` / `Enrollment (K-12)`) AS eligible FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE `School Type` = 'Public' AND `Educational Option Type` = 'Elementary' AND `Grade` = 'K-12' AND `Charter School (Y/N)` = 0 AND `County Code` = 66 ORDER BY `Free Meal Count (K-12)` DESC LIMIT 5	california_schools
SELECT T1.`School Name`, T1.Website FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000	california_schools
SELECT CAST(`Free Meal Count (Ages 5-17)` AS REAL) / `Enrollment (Ages 5-17)` AS free_rate FROM schools WHERE school = 'Kacey Gibson' AND statusType = 'School'	california_schools
SELECT T3.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN schools AS T3 ON T3.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.`Enrollment (K-12)` = ( SELECT MIN(T1.`Enrollment (K-12)`) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 )	california_schools
SELECT T1.`District Name`, T3.AdmFName1, T3.AdmLName1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN schools AS T3 ON T3.NCESDist = T1.NCESDist WHERE T2.NumTstTakr >= 1 AND T2.NumGE1500 >= 1 ORDER BY T2.NumTstTakr DESC LIMIT 1	california_schools
SELECT T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead > 0 ORDER BY (CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr) ASC LIMIT 1	california_schools
SELECT T2.Website FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Los Angeles County' AND T2.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(T1.NumTstTakr) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.rtype = 'FRESNO' AND T2.District = 'Fresno' AND YEAR(T2.OpenDate) = 1980 AND YEAR(T2.ClosedDate) = 1980	california_schools
SELECT Phone FROM schools WHERE District = 'Fresno Unified' ORDER BY CAST(SUBSTRING_INDEX(AvgScrRead, ' ', -1) AS UNSIGNED) LIMIT 1	california_schools
SELECT T2.school FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.cdscode = T2.CDSCode INNER JOIN satscores AS T3 ON T2.CDSCode = T3.cds WHERE T1.Virtual = 'T' AND T3.rtype = 'AY' GROUP BY T2.school ORDER BY AVG(T3.avgscrread) DESC LIMIT 5	california_schools
SELECT T1.`Educational Option Type` FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1	california_schools
SELECT AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) as AvgMathScore, sc.County FROM satscores s INNER JOIN schools sc ON s.cds = sc.CDSCode WHERE s.cds = (SELECT ss.cds FROM satscores ss ORDER BY ss.AvgScrRead + ss.AvgScrMath + ss.AvgScrWrite ASC LIMIT 1)	california_schools
SELECT T1.School, T3.City FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds INNER JOIN frpm AS T3 ON T1.CDSCode = T3.CDSCode WHERE T1.AdmFName1 = 'Austin' AND T1.AdmLName1 = 'Pena' AND T3.`Enrollment (Ages 5-17)` = (SELECT MAX(`Enrollment (Ages 5-17)`) FROM frpm) AND T2.NumTstTakr >= 1500	california_schools
SELECT T2.School, AVG(T1.AvgScrWrite) AS AvgWrite FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.EdOpsName = 'Ricci Ulrich' GROUP BY T2.School	california_schools
SELECT COUNT(*) AS total_enrollment, T2.State FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`School Type` = 'State Special School' AND T1.`High Grade` = '12' GROUP BY T2.State ORDER BY total_enrollment DESC LIMIT 1	california_schools
SELECT CAST(COUNT(CASE WHEN DISTINCT YEAR(OpenDate) = 1980 THEN 1 END) AS REAL) / 12 FROM schools WHERE County = 'Alameda County' AND DOC = 52	california_schools
SELECT CAST(SUM(IIF(DOC = 54, 1, 0)) AS REAL) / SUM(IIF(DOC = 52, 1, 0)) AS Ratio FROM schools WHERE County = 'ORANGE COUNTY'	california_schools
SELECT T1.County, T3.School, T3.ClosedDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN satscores AS T3 ON T1.CDSCode = T3.cds WHERE T1.StatusType = 'Closed' GROUP BY T1.County ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT Street, StreetAbr, cname, District FROM schools ORDER BY AvgScrMath DESC LIMIT 1 OFFSET 5	california_schools
SELECT T2.Street FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead LIMIT 1	california_schools
SELECT SUM(CASE WHEN T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500 THEN 1 ELSE 0 END) as total FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Lakeport'	california_schools
SELECT SUM(NumTstTakr) FROM satscores WHERE cname = 'Fresno'	california_schools
SELECT s.*, sm.`MailZip` FROM schools AS s LEFT JOIN `schools-mailing addresses` AS sm ON s.`District` = sm.`District` WHERE s.`AdmFName3` = 'Avetik' AND s.`AdmLName3` = 'Atoian' AND sm.`MailZip` IS NOT NULL	california_schools
SELECT CAST(SUM(CASE WHEN T1.MailState = 'CA' AND T1.County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.MailState = 'CA' AND T1.County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools AS T1	california_schools
SELECT COUNT(T2.District) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.MailState = 'CA' AND T2.`District Name` = 'SAN JOAQUIN COUNTY PUBLIC SCHOOL DISTRICT'	california_schools
SELECT Phone, Ext FROM schools INNER JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY AvgScrWrite DESC LIMIT 1 OFFSET 332	california_schools
SELECT t1.Phone, t1.Ext FROM schools AS t1 INNER JOIN frpm AS t2 ON t1.CDSCode = t2.CDSCode WHERE t1.Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE EdOpsName IN ('Mike Larson', 'Dante Alvarez')	california_schools
SELECT Website FROM schools WHERE CHARTER = 1 AND Virtual = 'P' AND County = 'SAN JOAQUIN';	california_schools
SELECT COUNT(*) FROM schools WHERE CHARTER = 1 AND DOC = 52 AND City = 'Hickman'	california_schools
SELECT SUM(IIF(Charter = 0, 1, 0)) AS total_number FROM schools WHERE County = 'Los Angeles'  AND `Free Meal Count (K-12)` * 100 / `Enrollment (K-12)` < 0.018	california_schools
SELECT T2.school, T2.city, T1.AdmFName1, T1.AdmLName1, T1.AdmEmail1, T1.AdmFName2, T1.AdmLName2, T1.AdmEmail2, T1.AdmFName3, T1.AdmLName3, T1.AdmEmail3 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.cdsCode = T2.CDSCode WHERE T1.charter = 1 AND T2.charter_number = '00D2'	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'	california_schools
SELECT CAST(SUM(IIF(`Charter Funding Type` = 'Locally Funded', 1, 0)) AS REAL) * 100 / COUNT(*) FROM frpm WHERE `County Name` = 'Santa Clara County'	california_schools
SELECT COUNT(DISTINCT District) FROM schools WHERE FundingType = 'Directly Funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT COUNT(DISTINCT T1.DistrictCode) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.DistrictCode = T2.District WHERE T1.SchoolType LIKE '%Community College%' AND T2.City = 'San Francisco' AND T1.`Academic Year` = '1989'	california_schools
SELECT T1.County FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOC = '11' AND T1.StatusType = 'Closed' AND T2.`Academic Year` BETWEEN '1980' AND '1989' GROUP BY T1.County ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT T2.NCESDist FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.SOC = '31';	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND (DistrictType = 'Active' OR DistrictType = 'Closed Community Day School')	california_schools
SELECT DistrictCode FROM schools WHERE City = 'Fresno' AND Magnet = 0	california_schools
SELECT Enrollment_Ages_5_17 FROM frpm WHERE School_Type = 'State Special School' AND School_Name = 'Fremont';	california_schools
SELECT SUM(t1.`Free Meal Count (Ages 5-17)`), SUM(t1.`FRPM Count (Ages 5-17)`), t1.district  FROM frpm t1  JOIN schools t2 ON t1.CDSCode = t2.CDSCode  WHERE t2.`Mailing Street Address` = 'PO Box 1040' AND t2.school = 'Youth Authority School'	california_schools
SELECT Low_Grade FROM frpm WHERE District = ( SELECT District FROM schools WHERE EdOpsCode = 'SPECON' AND NCESDist = '613360' )	california_schools
SELECT `Educational Option Type` FROM frpm WHERE `County Code` = 37 AND `Educational Option Type` LIKE '%Breakfast Provision 2%'	california_schools
SELECT T2.city FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.LowGrade = '9' AND T2.HighGrade = '12' AND T2.`NSLP Provision Status` = '2' AND T2.`Educational Option Type` = 'High School Level' AND T1.County = 'Merced' AND T1.EILCode = 'HS'	california_schools
SELECT T3.`County Name`, ROUND(T1.`FRPM Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)` * 100, 2) AS percent FROM frpm AS T1 INNER JOIN schools AS T3 ON T1.`County Name` = T3.County WHERE T3.County = 'Los Angeles' AND T1.`High Grade` = '9' AND T1.`Low Grade` = 'K'	california_schools
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.city = 'Adelanto' GROUP BY T1.Highgrade ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F'	california_schools
SELECT T3.school_type, T3.school FROM frpm AS T1 INNER JOIN schools AS T3 ON T1.cdscode = T3.cdscode ORDER BY T3.latitude DESC LIMIT 1	california_schools
SELECT City, School, `Low Grade` FROM schools WHERE State = 'CA' ORDER BY Latitude ASC LIMIT 1	california_schools
SELECT MAX(T1.LowGrade), MAX(T1.HighGrade) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.Longitude	california_schools
SELECT COUNT(T1.District), COUNT(T1.City) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.District = T2.DistrictCode WHERE T1.Magnet = 1 AND T1.GradeSpan = 'K-8'	california_schools
SELECT T1.AdmFName1, T2.District  FROM schools AS T1  LEFT JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  GROUP BY T1.AdmFName1  ORDER BY COUNT(*) DESC  LIMIT 2  SELECT T1.AdmFName2, T2.District  FROM schools AS T1  LEFT JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  GROUP BY T1.AdmFName2  ORDER BY COUNT(*) DESC  LIMIT 2  SELECT T1.AdmFName3, T2.District  FROM schools AS T1  LEFT JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  GROUP BY T1.AdmFName3  ORDER BY COUNT(*) DESC  LIMIT 2	california_schools
SELECT T1.District_Code FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine'	california_schools
SELECT T3.AdmLName1, T2.DistrictName, T2.CountyName, T2.SchoolName FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN schools AS T3 ON T3.CDSCode = T1.CDSCode WHERE T1.CharterNum = 40	california_schools
SELECT T2.AdmEmail1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T2.CDSCode = T1.CDSCode WHERE T1.County = 'San Bernardino County' AND T1.District = 'District of San Bernardino City Unified' AND T2.`Open Date` >= '2009-01-01' AND T2.`Open Date` <= '2010-12-31' AND T2.`School Type` = 'Public Intermediate/Middle School' AND T2.`District Type` = 'Unified School'	california_schools
SELECT s.school, s.admfname1, s.admlname1, s.admemail1 FROM schools s JOIN satscores sa ON s.cdscode = sa.cds WHERE sa.avgscrread >= 1500 AND sa.avgscrmath >= 1500 AND sa.avgscrwrite >= 1500 ORDER BY sa.numtsttakr DESC LIMIT 1	california_schools
SELECT COUNT(T1.account_id) FROM district AS T1 INNER JOIN disp AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T3.account_id = T2.account_id WHERE T3.type = 'withdrawal' AND T1.A3 = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(t3.account_id) FROM district AS t1 INNER JOIN client AS t2 ON t1.district_id = t2.district_id INNER JOIN disp AS t3 ON t2.client_id = t3.client_id INNER JOIN loan AS t4 ON t3.account_id = t4.account_id WHERE t1.A3 = 'Prague'	financial
SELECT CASE             WHEN AVG(A12) > AVG(A13) THEN 'A12'             ELSE 'A13'         END AS higher_percentage_unemployment_rate FROM district	financial
SELECT COUNT(*) FROM ( SELECT T1.district_id FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.district_id ) AS T2 INNER JOIN ( SELECT T1.district_id, AVG(T2.A11) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN account AS T3 ON T2.client_id = T3.client_id GROUP BY T1.district_id ) AS T3 ON T2.district_id = T3.district_id WHERE T3.avg < 10000 AND T3.avg > 6000	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A3 = 'North Bohemia' AND T2.A11 > 8000	financial
SELECT T3.account_id, AVG(T4.A11) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.client_id INNER JOIN disp AS T3 ON T1.client_id = T3.client_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T1.gender = 'F' GROUP BY T3.account_id ORDER BY T4.A11 ASC LIMIT 1, 1; SELECT MAX(T5.A11), MIN(T5.A11) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.client_id INNER JOIN disp AS T3 ON T1.client_id = T3.client_id INNER JOIN district AS T5 ON T1.district_id = T5.district_id WHERE T1.gender = 'F'	financial
SELECT T1.account_id FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id ORDER BY T1.birth_date DESC, T2.A11 DESC LIMIT 1	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER' AND T2.disp_id IN (SELECT disp_id FROM disp WHERE issued LIKE 'POPLATEK TYDNE')	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'POPLATEK PO OBRATU'	financial
SELECT T2.account_id FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T1.date) = '1997' ORDER BY T1.amount ASC LIMIT 1	financial
SELECT T.account_id FROM loan AS T WHERE T.duration > 12 AND STRFTIME('%Y', T.date) = '1993' ORDER BY T.amount DESC LIMIT 1	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.gender = 'F' AND T3.A2 = 'Slokolov' AND T1.birth_date < '1950-01-01'	financial
SELECT T2.account_id FROM district AS T1 INNER JOIN account AS T2 ON T2.district_id = T1.district_id WHERE T1.A6 LIKE '1995%' ORDER BY T2.date LIMIT 1	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T1.date) < '1997' AND T2.amount > 3000	financial
SELECT DISTINCT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE DATE_FORMAT(T3.date, '%Y-%m-%d') = '1994-03-03'	financial
SELECT t2.date FROM trans AS t1 INNER JOIN account AS t2 ON t1.account_id = t2.account_id WHERE t1.amount = 840 AND DATE_FORMAT(t1.date, '%Y/%m/%d') = '1998-10-14'	financial
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'A' AND T1.date = '1994-08-25'	financial
SELECT MAX(amount) FROM trans WHERE date LIKE '1996-10-21%'	financial
SELECT T2.gender FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN ( SELECT district_id, AVG(age) AS avg_age FROM client GROUP BY district_id ) AS T3 ON T2.district_id = T3.district_id ORDER BY T3.avg_age ASC LIMIT 1	financial
SELECT MAX(T1.amount) FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'owner' ORDER BY T1.date ASC LIMIT 1	financial
SELECT COUNT(client.client_id) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' AND district.A2 = 'Jesenik'	financial
SELECT DISTINCT T2.disp_id FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.balance = 5100 AND STRFTIME('%Y-%m-%d', T1.date) = '1998-09-02'	financial
SELECT COUNT(account_id) FROM account WHERE DATE_PART('year', date) = 1996 AND T2.A2 = 'Litomerice' FROM district AS T2 ON T2.district_id = T1.district_id	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' AND T2.birth_date = '1976-01-29'	financial
SELECT T2.birth_date FROM loan AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.loan_id = '98832' AND T1.date = '1996/1/3'	financial
SELECT account_id FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' AND T2.birth_date > '1970-01-01' AND T1.date < '2012-08-01' AND T2.district_id IN ( SELECT T3.district_id FROM district AS T3 WHERE T3.A3 = 'Prague' ) ORDER BY T1.date LIMIT 1	financial
SELECT ( SELECT COUNT(T1.client_id) * 100.0 / COUNT(T2.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'M' AND T2.account_id IN ( SELECT account_id FROM account WHERE district_id IN ( SELECT district_id FROM district WHERE A3 = 'SOUTH BOHEMIA' ORDER BY A11 DESC LIMIT 1 ) ) )	financial
SELECT      t1.balance - t2.balance as increase,      t1.balance as end_balance,      t2.balance as start_balance FROM      (SELECT          d1.balance,          d1.date     FROM          trans d1      INNER JOIN          disp d2 ON d1.account_id = d2.account_id      INNER JOIN          client c ON d2.client_id = c.client_id      WHERE          c.birth_date = '1993-07-05'          AND d1.`type` = 'PAYMENT'          AND d1.`date` = '1993-03-22'     LIMIT 1) as t1,     (SELECT          d1.balance,          d1.date     FROM          trans d1      INNER JOIN          disp d2 ON d1.account_id = d2.account_id      INNER JOIN          client c ON d2.client_id = c.client_id      WHERE          c.birth_date = '1993-07-05'          AND d1.`type` = 'PAYMENT'          AND d1.`date` = '1998-12-27'     LIMIT 1) as t2	financial
SELECT CAST(SUM(IIF(T3.status = 'A', T2.amount, 0)) AS REAL) * 100 / SUM(T2.amount) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN `order` AS T3 ON T1.account_id = T3.account_id	financial
SELECT (SELECT CAST(COUNT(T2.loan_id) AS REAL) * 100 / COUNT(T1.loan_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount < 100000 AND T2.status = 'C') AS Result	financial
SELECT T3.district_id, T4.A2, T4.A3 FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id INNER JOIN T4 ON T3.district_id = T4.district_id WHERE T2.date BETWEEN '1993-01-01' AND '1993-12-31' AND T1.date > T2.date	financial
SELECT T1.account_id, T1.frequency FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'East Bohemia' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'	financial
SELECT T1.A2, T1.A3 FROM district AS T1 INNER JOIN loan AS T2 ON T1.district_id = T2.account_id WHERE T2.loan_id = '4990'	financial
SELECT T1.account_id, T4.A2, T4.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T4 ON T2.district_id = T4.district_id WHERE T1.amount > 300000	financial
SELECT loan_id, T1.district_id, A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.duration = 60 AND T1.status = 'A'	financial
SELECT t1.A2 AS district_name, t1.A13 - t1.A12 AS unemployment_increment FROM district AS t1 INNER JOIN client AS t2 ON t1.district_id = t2.district_id INNER JOIN loan AS t3 ON t2.client_id = t3.account_id WHERE t3.status = 'D'	financial
SELECT CAST(SUM(CASE WHEN SUBSTR(T1.date, 1, 4) = '1993' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.district_id WHERE T2.A2 = 'Decin'	financial
SELECT account_id FROM disp WHERE type = 'POPLATEK MESICNE'	financial
SELECT T2.A2, COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T1.district_id ORDER BY COUNT(T1.client_id) DESC LIMIT 10	financial
SELECT T1.A2, SUM(T3.amount)  FROM district AS T1  JOIN client AS T2 ON T1.district_id = T2.district_id  JOIN disp AS T3 ON T2.client_id = T3.client_id  JOIN account AS T4 ON T3.account_id = T4.account_id  JOIN trans AS T5 ON T4.account_id = T5.account_id  WHERE T5.type = 'VYDAJ' AND T5.date LIKE '1996-01%'  GROUP BY T1.A2  ORDER BY SUM(T3.amount) DESC  LIMIT 10	financial
SELECT COUNT(c.client_id) FROM client AS c INNER JOIN district AS d ON c.district_id = d.district_id WHERE d.A3 = 'South Bohemia' AND NOT EXISTS (SELECT 1 FROM disp AS di INNER JOIN card AS ca ON di.disp_id = ca.disp_id WHERE di.client_id = c.client_id)	financial
SELECT A3 FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'C' AND loan.status <> 'D' GROUP BY district.A3 ORDER BY count(loan.account_id) DESC LIMIT 1	financial
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'M'	financial
SELECT D2.A2, D1.district_id, D1.A13 FROM district AS D1 INNER JOIN district AS D2 ON D1.A2 = D2.A2 WHERE D1.A13 IN ( SELECT MAX(A13) FROM district WHERE substr(A1, - 2) = '96' )	financial
SELECT SUM(CASE WHEN T1.A16 = ( SELECT MAX(A16) FROM district WHERE district_id IN ( SELECT T2.district_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE YEAR(T2.date) = 1996 ) ) THEN 1 ELSE 0 END) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE YEAR(T2.date) = 1996	financial
SELECT COUNT(T3.account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN `order` AS T3 ON T3.account_id = T2.account_id WHERE T2.type = 'VUB' AND T3.k_symbol = 'POJISTENI'	financial
SELECT COUNT(*) FROM loan WHERE status = 'APPROVED' AND amount >= 250000 AND date BETWEEN '1995-01-01' AND '1997-12-31'	financial
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status = 'C'	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'D' AND T1.birth_date <= '1994-12-31' AND T1.gender = 'M' AND T3.date BETWEEN '1995-01-01' AND '1995-12-31'	financial
SELECT COUNT(T1.card_id) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.type = 'disponent' AND T1.type = 'gold'	financial
SELECT COUNT(account_id) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek')	financial
SELECT T2.A3 FROM trans AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.type = 'VKLAD' AND T1.date BETWEEN '1997-01-01' AND '1997-12-31' AND T1.amount > 10000	financial
SELECT T1.account_id FROM order AS T1 INNER JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO'	financial
SELECT T1.account_id FROM `order` AS T1 INNER JOIN card AS T2 ON T1.account_id = T2.disp_id WHERE T2.type = 'junior' INTERSECT SELECT T1.account_id FROM `order` AS T1 INNER JOIN card AS T2 ON T1.account_id = T2.disp_id WHERE T2.type = 'gold'	financial
SELECT AVG(amount) FROM trans WHERE type = 'VYBER KARTOU' AND date BETWEEN '2021-01-01' AND '2021-12-31'	financial
SELECT DISTINCT T1.account_id FROM `trans` AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'VYBER KARTOU' AND T2.date BETWEEN '1998-01-01' AND '1998-12-31' AND T1.balance / T2.frequency < ( SELECT AVG(balance / frequency) FROM `trans` WHERE type = 'VYBER KARTOU' AND date BETWEEN '1998-01-01' AND '1998-12-31' )	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id INNER JOIN card AS T4 ON T2.disp_id = T4.disp_id WHERE T1.gender = 'F'	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district di ON a.district_id = di.district_id  WHERE c.gender = 'F' AND di.A3 = 'south Bohemia';	financial
SELECT DISTINCT T2.account_id FROM district AS T1 INNER JOIN loan AS T2 ON T2.account_id = T3.account_id WHERE T1.A2 = 'Tabor' AND T2.amount = ( SELECT MAX(amount) FROM loan )	financial
SELECT T3.type FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T2.A11 BETWEEN 8000 AND 9000 AND T4.gender = 'female' GROUP BY T3.type HAVING COUNT(*) > 1	financial
SELECT COUNT(DISTINCT T1.account_id) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'North Bohemia' AND T1.bank = 'AB'	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'	financial
SELECT avg(T1.A15) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 IN ( SELECT T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.date LIKE '1997%' GROUP BY T1.A3 HAVING count(*) > 4000 ) AND T2.date LIKE '1995%'	financial
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN account AS T3 ON T3.account_id = T2.account_id WHERE T3.type = 'OWNER' AND T1.type = 'classic'	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Hl.m. Praha' AND T1.gender = 'M'	financial
SELECT CAST(COUNT(CASE WHEN T1.type = 'gold' AND T1.issued < '1998-01-01' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.card_id) FROM card AS T1	financial
SELECT T1.client_id, T2.gender FROM client AS T1 INNER JOIN disp AS T3 ON T1.client_id = T3.client_id INNER JOIN loan AS T4 ON T4.account_id = T3.account_id ORDER BY T4.amount DESC LIMIT 1	financial
SELECT t.A15 FROM district t INNER JOIN account a ON t.district_id = a.district_id WHERE a.account_id = 532 AND EXTRACT(YEAR FROM a.date) = 1995	financial
SELECT T1.district_id FROM account AS T1 INNER JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333	financial
SELECT t1.date, t1.balance, t1.operation, t1.amount FROM trans AS t1 INNER JOIN account AS t2 ON t1.account_id = t2.account_id INNER JOIN client AS t3 ON t2.district_id = t3.district_id WHERE t3.client_id = 3356 AND t1.operation = 'VYBER'	financial
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000	financial
SELECT T2.type FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T3.disp_id = T2.disp_id WHERE T1.client_id = 13539	financial
SELECT A3 FROM district WHERE district_id = (SELECT district_id FROM client WHERE client_id = 3541);	financial
SELECT T2.district_id, T2.A2 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status = 'A' GROUP BY T2.district_id ORDER BY COUNT(T1.loan_id) DESC LIMIT 1	financial
SELECT T3.name FROM order AS T1 INNER JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T1.order_id = 32423	financial
SELECT * FROM trans  WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5)	financial
SELECT count(account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Jesenik'	financial
SELECT DISTINCT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'junior' AND T3.issued >= '1997-01-01'	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.gender) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A11 > 10000	financial
SELECT (SUM(T1.amount) - SUM(T2.amount)) * 100 / SUM(T2.amount) AS growth_rate FROM ( SELECT loan_id, account_id, amount FROM loan WHERE SUBSTR(date, 1, 4) = '1997' ) AS T1 INNER JOIN ( SELECT loan_id, account_id, amount FROM loan WHERE SUBSTR(date, 1, 4) = '1996' ) AS T2 ON T1.account_id = T2.account_id INNER JOIN disp ON T1.account_id = disp.account_id INNER JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'M'	financial
SELECT COUNT(*) FROM trans WHERE type = 'PRIJEM' AND date > '1995-12-31' AND k_symbol = 'VYBER KARTOU'	financial
SELECT SUM(T1.A16) - SUM(T2.A16) FROM district AS T1 INNER JOIN account AS T3 ON T1.district_id = T3.district_id INNER JOIN trans AS T4 ON T3.account_id = T4.account_id WHERE T1.A3 LIKE 'E' AND YEAR(T4.date) = 1996 INNER JOIN district AS T5 ON T5.district_id = T3.district_id WHERE T5.A3 LIKE 'N' AND YEAR(T4.date) = 1996	financial
SELECT COUNT(disp_id) FROM disp WHERE client_id IN (SELECT client_id FROM account WHERE account_id BETWEEN 1 AND 10)	financial
SELECT COUNT(T1.trans_id) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'N' AND T2.account_id = 3 AND T1.k_symbol = 'ACCOUNT STATEMENT' AND T1.operation = 'DBIT' AND T1.amount = 3539	financial
SELECT YEAR(birth_date) FROM client WHERE client_id = 130	financial
SELECT COUNT(T1.account_id) FROM disp AS T1 INNER JOIN `order` AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'OWNER' AND T2.k_symbol = 'PO PRIJATÉM OBRAZEČKEM'	financial
SELECT T1.amount , T2.status FROM loan AS T1 INNER JOIN `order` AS T2 ON T1.loan_id = T2.loan_id WHERE T2.client_id = 992	financial
SELECT SUM(t1.amount), t3.gender FROM trans AS t1 INNER JOIN client AS t3 ON t1.account_id = t3.client_id WHERE t1.trans_id = 851 AND t3.client_id = 4 AND t3.gender IN ('M', 'F')	financial
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.client_id = 9	financial
SELECT SUM(amount) FROM `trans` WHERE client_id = 617 AND date BETWEEN '1998-01-01' AND '1998-12-31'	financial
SELECT T2.client_id FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T1.A3 = 'east bohemia'	financial
SELECT T3.client_id FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'F' GROUP BY T3.client_id ORDER BY SUM(T1.amount) DESC LIMIT 3	financial
SELECT COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T3.account_id = T2.account_id INNER JOIN trans AS T4 ON T3.account_id = T4.account_id WHERE T1.gender = 'M' AND YEAR(T1.birth_date) BETWEEN 1974 AND 1976 AND T4.type = 'PAYMENT' AND T4.amount > 4000 AND T4.k_symbol = 'SIPO'	financial
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Beroun' AND T1.date > '1996-12-31'	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.gender = 'F' AND T3.type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague')	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.date) FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T1.gender = 'U'	financial
SELECT T1.account_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id < 5 AND T1.status = 'A' AND T1.duration > 24 AND STRFTIME('%Y', T2.date) < '1997' AND T2.frequency = 'M' ORDER BY T1.amount ASC LIMIT 1	financial
SELECT T1.account_id FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' ORDER BY T1.birth_date ASC LIMIT 1	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T1.birth_date LIKE '1920-%' AND T2.A3 = 'East Bohemia'	financial
SELECT COUNT(T2.loan_id) FROM loan AS T2 INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.duration = 24	financial
SELECT AVG(t1.amount) FROM loan AS t1 INNER JOIN order AS t2 ON t1.loan_id = t2.loan_id WHERE t1.status = 'C' AND t2.k_symbol = 'POPLATEK PO OBRATU'	financial
SELECT T1.client_id, T3.district_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.type IN ('owner')	financial
SELECT T3.client_id ,  T3.birth_date FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.type = 'gold'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl'	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) FROM connected c JOIN atom a ON a.atom_id = c.atom_id JOIN bond b ON b.bond_id = c.bond_id WHERE b.bond_type = '-'	toxicology
SELECT AVG(CASE WHEN `bond`.`bond_type` = '-' THEN 1 ELSE 0 END) FROM `bond` JOIN `molecule` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `molecule`.`label` = '+'	toxicology
SELECT COUNT(*) FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.label = '-' AND T2.element = 'na'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T2.bond_type = '#' GROUP BY T1.molecule_id HAVING COUNT(T3.bond_id) = 3	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(DISTINCT b.atom_id) AS Percentage FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(*) FROM ( SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id INNER JOIN atom AS T4 ON T2.atom_id = T4.atom_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR099' AND T1.label = '+' GROUP BY T1.molecule_id HAVING COUNT(*) = SUM(CASE WHEN T4.element IN ('C', 'H', 'N', 'O', 'F', 'S', 'Cl', 'Br') THEN 0 ELSE 1 END) ) AS T	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'si'	toxicology
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = ' = '	toxicology
SELECT label FROM molecule WHERE molecule_id IN (SELECT DISTINCT molecule_id FROM atom WHERE element = 'h') GROUP BY label ORDER BY COUNT(label) DESC LIMIT 1	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'te'	toxicology
SELECT DISTINCT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.atom_id2 IN ( SELECT DISTINCT T2.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-' )	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.label = '-'	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(*) LIMIT 1	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id IN ('TR004_8', 'TR004_20'))	toxicology
SELECT T1.molecule_id, T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element != 'sn' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) = SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END)	toxicology
SELECT COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id INNER JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T1.element = 'i' AND T1.element = 's' AND T3.bond_type = '-'	toxicology
SELECT t1.atom_id, t1.atom_id2 FROM connected AS t1 JOIN bond AS t2 ON t1.bond_id = t2.bond_id WHERE t2.bond_type = '#'	toxicology
SELECT a1.* FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN molecule m ON m.molecule_id = a1.molecule_id WHERE m.label = 'TR181'	toxicology
SELECT CAST(SUM(CASE WHEN element = 'f' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(DISTINCT m.molecule_id) * 100 AS percent FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id WHERE m.label = '+'	toxicology
SELECT SUM(CASE WHEN T3.bond_type = '#' THEN 1 ELSE 0 END) AS triple_bonds, COUNT(T3.bond_id) AS total_bonds, SUM(CASE WHEN T3.bond_type = '#' THEN 1 ELSE 0 END) * 100 / COUNT(T3.bond_id) AS percentage FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.label = '+'	toxicology
SELECT element FROM ATOM WHERE molecule_id = 'TR000' GROUP BY element ORDER BY COUNT(*) DESC LIMIT 3	toxicology
SELECT a1.atom_id, a1.element, a2.atom_id, a2.element FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_6'	toxicology
SELECT COUNT(*) - COUNT(*) as difference  FROM molecule WHERE label = '+' OR label = '-' GROUP BY label	toxicology
SELECT T2.atom_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR_000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = '2'	toxicology
SELECT DISTINCT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.label ORDER BY COUNT(*) DESC, m.label ASC LIMIT 5	toxicology
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(bond_id)) * 100 AS percent FROM bond WHERE molecule_id = 'TR008'	toxicology
SELECT DIVIDE(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END), COUNT(molecule_id)) AS percent FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN element = 'H' THEN 1 ELSE 0 END) * 100 AS REAL) / COUNT(atom_id) as percent  FROM atom  WHERE molecule_id = 'TR206';	toxicology
SELECT T2.bond_type  FROM connected AS T1  INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id  INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id  WHERE T3.label = 'TR000'	toxicology
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T3.molecule_id = T1.molecule_id WHERE T3.label = '+' AND T3.molecule_id = 'TR060' UNION SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T3.molecule_id = T1.molecule_id WHERE T3.label = '-' AND T3.molecule_id = 'TR060'	toxicology
SELECT bond_type FROM connected WHERE molecule_id = 'TR018' GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1 AS majority_bond	toxicology
SELECT T4.label FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T4 ON T2.molecule_id = T4.molecule_id JOIN atom AS T5 ON T1.atom_id = T5.atom_id WHERE T2.bond_type = '-' AND T5.atom_id IN (SELECT T1.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-' GROUP BY T1.atom_id HAVING COUNT(T1.atom_id) = 2) AND T4.label != '-' ORDER BY T4.label ASC LIMIT 3	toxicology
SELECT T2.bond_type, T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.label = 'TR006' ORDER BY T2.bond_type ASC LIMIT 2	toxicology
SELECT COUNT(DISTINCT bond.bond_id) FROM bond WHERE bond.bond_id LIKE 'TR009_%' INTERSECT SELECT bond.bond_id FROM connected WHERE connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12'	toxicology
SELECT COUNT(m.molecule_id) FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id WHERE m.label = '+' AND a.element = 'br'	toxicology
SELECT bond_type, atom_id, atom_id2 FROM bond WHERE bond_id = 'TR001_6_9'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_10' AND T1.label = '+'	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#' GROUP BY T1.molecule_id	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = 'TR004'	toxicology
SELECT COUNT(m.molecule_id) FROM molecule m WHERE m.label = '-'	toxicology
SELECT DISTINCT T3.label  FROM molecule AS T1  JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE SUBSTRING(T3.atom_id, 7, 2) BETWEEN 21 AND 25  AND T1.label = '+'	toxicology
SELECT bond_id FROM atom a1 INNER JOIN connected c ON a1.atom_id = c.atom_id INNER JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n'	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T2.bond_type = '=' GROUP BY T1.label ORDER BY COUNT(T3.atom_id) DESC LIMIT 1	toxicology
SELECT COUNT(bond_id) / COUNT(DISTINCT atom_id) FROM connected JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'i'	toxicology
SELECT T3.bond_type, T3.bond_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.atom_id = 45;	toxicology
SELECT element  FROM atom WHERE atom_id NOT IN (     SELECT atom_id      FROM connected )	toxicology
SELECT A.atom_id  FROM atom A  JOIN connected C ON A.atom_id = C.atom_id  JOIN bond B ON C.bond_id = B.bond_id  JOIN molecule M ON B.molecule_id = M.molecule_id  WHERE M.label = 'TR447' AND B.bond_type = '#'	toxicology
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR144_8_19')	toxicology
SELECT T.molecule_id FROM (   SELECT C.molecule_id, SUM(IF(B.bond_type = '=', 1, 0)) as double_bond_count   FROM connected C   INNER JOIN bond B ON C.bond_id = B.bond_id   GROUP BY C.molecule_id ) AS T JOIN molecule M ON T.molecule_id = M.molecule_id WHERE M.label = '+' ORDER BY T.double_bond_count DESC LIMIT 1	toxicology
SELECT a.element, COUNT(*) as occurrence FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.element ORDER BY occurrence ASC LIMIT 1	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'pb' AND a2.element != 'pb';	toxicology
SELECT DISTINCT T1.element, T2.element  FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T4 ON T3.bond_id = T4.bond_id  JOIN atom AS T2 ON T3.atom_id2 = T2.atom_id  WHERE T4.bond_type = '##'	toxicology
SELECT CAST(COUNT(T1.bond_id) AS REAL) * 100 / COUNT(T2.atom_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T3.atom_id = T2.atom_id GROUP BY T2.bond_id HAVING T3.element = ( SELECT MAX(COUNT(T4.element)) FROM connected AS T5 INNER JOIN atom AS T4 ON T5.atom_id = T4.atom_id GROUP BY T4.bond_id )	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.bond_id) AS Proportion FROM bond AS T1 LEFT JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'	toxicology
SELECT SUM(CASE WHEN `element` = 'c' THEN 1 ELSE 0 END) + SUM(CASE WHEN `element` = 'h' THEN 1 ELSE 0 END) FROM atom	toxicology
SELECT a.atom_id2 FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id JOIN element AS e ON a.atom_id = e.atom_id WHERE e.element = 's'	toxicology
SELECT DISTINCT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'Sn'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT COUNT(T3.atom_id)  FROM molecule AS T1  JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  JOIN bond AS T4 ON T2.bond_id = T4.bond_id  WHERE T3.element IN ('p', 'br') AND T4.bond_type = '#' AND T4.molecule_id IN (      SELECT T5.molecule_id      FROM molecule AS T5      JOIN connected AS T6 ON T5.molecule_id = T6.molecule_id      GROUP BY T6.bond_id      HAVING COUNT(DISTINCT T6.atom_id) >= 3 )	toxicology
SELECT T1.bond_id  FROM bond AS T1  INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.label = '+'	toxicology
SELECT b.molecule_id  FROM bond AS b  INNER JOIN molecule AS m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT DIVIDE(SUM(T2.element = 'cl'), COUNT(T1.atom_id)) * 100 as percent FROM connected AS T1  INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id  INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id  WHERE T3.bond_type = '-'	toxicology
SELECT t2.label FROM connected AS t1 INNER JOIN molecule AS t2 ON t1.molecule_id = t2.molecule_id WHERE t1.atom_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(*) FROM ( SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element LIKE 'C%' AND T1.label = '+' INTERSECT SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id INNER JOIN atom AS T5 ON T5.atom_id = T3.atom_id2 WHERE T5.element LIKE 'C%' AND T4.bond_type LIKE 'S%' AND T1.label = '+' AND T1.molecule_id BETWEEN 'TR000' AND 'TR030' ) AS A	toxicology
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON T2.atom_id = T1.atom_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(*) FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'i')	toxicology
SELECT CASE      WHEN COUNT(CASE WHEN T2.label = '+' THEN 1 END) > COUNT(CASE WHEN T2.label = '-' THEN 1 END) THEN 'Carcinogenic'      ELSE 'Non-carcinogenic'  END AS 'Molecule Type' FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'cl' AND molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_8' ) INTERSECT SELECT COUNT(*) FROM atom WHERE element = 'c' AND molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_8' )	toxicology
SELECT M.molecule_id FROM molecule M JOIN connected C ON M.molecule_id = C.molecule_id JOIN bond B ON C.bond_id = B.bond_id JOIN atom A ON C.atom_id = A.atom_id JOIN atom A2 ON C.atom_id2 = A2.atom_id WHERE M.label = '-'  AND A.element = 'c' AND A2.element = 'c' AND B.bond_type = '#' GROUP BY M.molecule_id HAVING COUNT(DISTINCT B.bond_type) = 3 LIMIT 2	toxicology
SELECT CAST(SUM(atom.element = 'cl') AS REAL) * 100 / COUNT(molecule.molecule_id) AS percentage FROM molecule INNER JOIN connected ON molecule.molecule_id = connected.molecule_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE molecule.label = '+'	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'toxicology' AND b.molecule_id = 'TR001'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '='	toxicology
SELECT T1.atom_id, T3.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '#'	toxicology
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR005_16_26'	toxicology
SELECT COUNT(DISTINCT c.molecule_id) AS count_molecules FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND c.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT T3.label FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT DISTINCT T1.bond_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.bond_type = '#' AND T1.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#') AND T3.label = '+'	toxicology
SELECT COUNT(*) FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id INNER JOIN molecule AS T4 ON T2.molecule_id = T4.molecule_id WHERE T4.label = '+' AND T2.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND substr(T2.atom_id, 7, 1) = 4	toxicology
SELECT LABEL  FROM molecule  WHERE molecule_id = 'TR006'  AND element = 'H'  AND COUNT(*) / (SELECT COUNT(*) FROM connected WHERE molecule_id = 'TR006') * 100 > 0.05	toxicology
SELECT T3.label FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element = 'ca' AND T3.label = '+'	toxicology
```sql SELECT bond.bond_type FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'te' ```	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN bond AS T3 ON T2.bond_id  =  T3.bond_id WHERE T2.bond_id  =  'TR001_10_11' AND T3.molecule_id = SUBSTR(T2.bond_id,1,5)	toxicology
To solve this problem, we need to count the number of triple-bond compounds and divide it by the total number of molecules. To get the total number of molecules, we can simply count the number of unique molecule_id in the 'molecule' table. To count the number of triple-bond compounds, we can use a subquery to first find all molecules with three or more atoms and then join that with the 'bond' table to find the number of triple bonds. Here's the SQL query to achieve this: ``` SELECT    COUNT(DISTINCT m.molecule_id) / COUNT(DISTINCT m.molecule_id) * 100.0 AS percentage FROM    molecule m WHERE    (     SELECT        COUNT(*)      FROM        atom a      WHERE        a.molecule_id = m.molecule_id   ) >= 3 AND    (     SELECT        COUNT(*)      FROM        bond b      WHERE        b.molecule_id = m.molecule_id      AND        b.bond_type = '#'   ) >= 3; ``` This query first filters out the molecules with three or more atoms using a subquery in the WHERE clause. It then counts the number of triple-bond bonds for each of these molecules using another subquery. Finally, it calculates the percentage of molecules with triple-bond bonds by dividing the number of triple-bond molecules by the total number of molecules and multiplying by 100.	toxicology
SELECT SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond.bond_id) AS percent  FROM connected  INNER JOIN bond ON connected.bond_id = bond.bond_id  INNER JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.molecule_id = 'TR047'  AND atom.element IS NOT NULL  AND bond.molecule_id = 'TR047';	toxicology
SELECT CASE WHEN t1.label = '+' THEN 'Yes' ELSE 'No' END AS carcinogenic FROM molecule AS t1 INNER JOIN connected AS t2 ON t1.molecule_id = t2.molecule_id INNER JOIN atom AS t3 ON t3.atom_id = t2.atom_id WHERE t3.atom_id = 'TR001_1'	toxicology
SELECT M.label = '+' as is_carcinogenic FROM molecule M WHERE M.molecule_id = ( SELECT m.molecule_id FROM molecule m INNER JOIN connected c ON m.molecule_id = c.molecule_id WHERE c.bond_id IN ( SELECT b.bond_id FROM bond b INNER JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'C' ) GROUP BY m.molecule_id HAVING COUNT(DISTINCT a.element) >= 2 )	toxicology
SELECT DISTINCT e.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN connected c2 ON a2.atom_id = c2.atom_id JOIN bond b ON c2.bond_id = b.bond_id JOIN connected c3 ON b.bond_id = c3.bond_id JOIN atom a3 ON c3.atom_id = a3.atom_id JOIN element e ON a3.element = e.element WHERE m.label = 'TR151' AND (e.element = 'cl' OR e.element = 'c' OR e.element = 'h' OR e.element = 'o' OR e.element = 's' OR e.element = 'n' OR e.element = 'p' OR e.element = 'na' OR e.element = 'br' OR e.element = 'f' OR e.element = 'i' OR e.element = 'sn' OR e.element = 'pb' OR e.element = 'te' OR e.element = 'ca')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.molecule_id BETWEEN 'TR010' AND 'TR050'	toxicology
SELECT count(*) FROM connected JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT DISTINCT b.bond_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON c.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+'	toxicology
SELECT COUNT(a.atom_id)  FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'H' AND m.label = '+';	toxicology
SELECT connected.molecule_id FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'TR00_1' AND bond.bond_type = 'TR00_1_2'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'c' GROUP BY T1.atom_id HAVING COUNT(T3.label) = COUNT(DISTINCT T3.label) OR SUM(T3.label) <> '-'	toxicology
SELECT CAST(SUM(T1.label = '+' AND T2.element = 'h') AS DECIMAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id INNER JOIN atom AS T2 ON T3.atom_id = T2.atom_id	toxicology
SELECT DISTINCT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS Result  FROM molecule AS T1  WHERE T1.molecule_id = 'TR124'	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN molecule m ON c1.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR186'	toxicology
SELECT CASE WHEN t2.bond_type = '= ' THEN 'double bond' WHEN t2.bond_type = '-' THEN 'single bond' WHEN t2.bond_type = '#' THEN 'triple bond' END FROM bond AS t2 INNER JOIN connected AS t1 ON t1.bond_id = t2.bond_id WHERE t1.atom_id = ( SELECT atom_id FROM atom WHERE molecule_id = 'TR007_4_19' )	toxicology
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_2_4'	toxicology
SELECT M.label as Carcinogenic, COUNT(*) as DoubleBondCount FROM molecule M JOIN connected C ON M.molecule_id = C.molecule_id JOIN bond B ON C.bond_id = B.bond_id WHERE M.label IN ('+', '-') AND B.bond_type = ' = ' AND C.atom_id IN (     SELECT A.atom_id     FROM connected C     JOIN bond B ON C.bond_id = B.bond_id     JOIN atom A ON C.atom_id = A.atom_id     WHERE B.molecule_id = 'TR006'     GROUP BY A.atom_id     HAVING COUNT(*) > 1 ) GROUP BY M.label	toxicology
SELECT DISTINCT T2.molecule_id, T1.element  FROM atom AS T1  INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id  WHERE T1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT bond_id, atom_id, atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-')	toxicology
SELECT M.label, A1.element, A2.element, A3.element FROM molecule M JOIN atom A1 ON M.molecule_id = A1.molecule_id JOIN connected C ON A1.atom_id = C.atom_id JOIN bond B ON C.bond_id = B.bond_id JOIN atom A2 ON C.atom_id2 = A2.atom_id JOIN connected C2 ON A2.atom_id = C2.atom_id JOIN bond B2 ON C2.bond_id = B2.bond_id JOIN atom A3 ON C2.atom_id2 = A3.atom_id WHERE B.bond_type = '#' AND B2.bond_type = '#'	toxicology
SELECT t1.element FROM atom AS t1 INNER JOIN connected AS t2 ON t1.atom_id = t2.atom_id INNER JOIN bond AS t3 ON t2.bond_id = t3.bond_id WHERE t3.bond_type = 'TR000_2_3'	toxicology
SELECT COUNT(b.bond_id) FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON a.atom_id = c.atom_id WHERE a.element = 'cl'	toxicology
SELECT T.atom_id  FROM (   SELECT atom_id FROM connected    WHERE bond_id IN (     SELECT bond_id FROM bond      WHERE molecule_id IN (       SELECT molecule_id FROM molecule        WHERE label = 'TR346'     )   ) ) T  UNION ALL  SELECT atom_id2  FROM (   SELECT atom_id2 FROM connected    WHERE bond_id IN (     SELECT bond_id FROM bond      WHERE molecule_id IN (       SELECT molecule_id FROM molecule        WHERE label = 'TR346'     )   ) ) T	toxicology
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T3.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' AND T1.label = '+'	toxicology
SELECT COUNT(DISTINCT t.molecule_id) AS cnt FROM   (SELECT m.molecule_id FROM molecule m   LEFT JOIN connected c ON m.molecule_id = c.molecule_id   LEFT JOIN atom a1 ON c.atom_id = a1.atom_id   LEFT JOIN atom a2 ON c.atom_id2 = a2.atom_id   LEFT JOIN bond b ON c.bond_id = b.bond_id   WHERE b.bond_type != '='   AND (a1.element != 's' OR a2.element != 's')) t	toxicology
SELECT t1.label FROM molecule AS t1 INNER JOIN bond AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT DISTINCT T2.molecule_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T1.element = 'cl' AND T2.label = '+'	toxicology
SELECT `label`  FROM `molecule` AS `m`  JOIN `atom` AS `a` ON `m`.`molecule_id` = `a`.`molecule_id`  WHERE `a`.`element` = 'c'  GROUP BY `m`.`molecule_id`  HAVING COUNT(`m`.`molecule_id`) > 1	toxicology
SELECT SUM(m.label = '+' AND a.element = 'cl') * 100.0 / COUNT(DISTINCT a.molecule_id) AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element IN ('Cl', 'C', 'H', 'O', 'S', 'N', 'P', 'Na', 'Br', 'F', 'I', 'Sn', 'Pb', 'Te', 'Ca') AND T2.bond_id = 'TR001_3_4'	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id IN ('TR000_1', 'TR000_2'))	toxicology
SELECT molecule.molecule_id FROM molecule JOIN connected ON molecule.molecule_id = connected.molecule_id WHERE connected.atom_id = 'TR000_2' AND connected.atom_id2 = 'TR000_4'	toxicology
SELECT T3.element FROM connected AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T1.atom_id = T3.atom_id  WHERE T2.label = 'Toxicology' AND T1.atom_id = 'TR000_1'	toxicology
SELECT CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-carcinogenic' END AS result FROM molecule m WHERE m.molecule_id = 'TR000';	toxicology
SELECT CAST(SUM(bond_type = '-') AS REAL) / COUNT(bond_id) AS percentage FROM bond	toxicology
SELECT COUNT(T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'N' AND T2.label = '+';	toxicology
SELECT molecule.molecule_id FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN atom ON connected.atom_id = atom.atom_id JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 's' AND bond.bond_type = '=';	toxicology
SELECT L2.label FROM molecule AS L2 INNER JOIN ( SELECT L1.molecule_id FROM connected AS L1 INNER JOIN atom AS L3 ON L1.atom_id = L3.atom_id WHERE L3.element != 'C' GROUP BY L1.molecule_id HAVING COUNT(L1.molecule_id) > 5 ) AS L4 ON L2.molecule_id = L4.molecule_id WHERE L2.label = '-'	toxicology
SELECT DISTINCT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T2.bond_id = T3.bond_id  JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id  WHERE T4.label = 'TR024' AND T3.bond_type = '='	toxicology
SELECT T1.label, COUNT(T2.atom_id) AS num FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id, T1.label ORDER BY num DESC LIMIT 1	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) AS percentage  FROM molecule AS T1  INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id  INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id  INNER JOIN atom AS T4 ON T4.atom_id = T2.atom_id AND T4.element = 'h'  INNER JOIN atom AS T5 ON T5.atom_id = T2.atom_id2 AND T5.element = 'h'  WHERE T3.bond_type = '#'	toxicology
SELECT COUNT(DISTINCT T1.molecule_id)  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T1.label = '+'	toxicology
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.molecule_id BETWEEN 'TR004' AND 'TR010'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'c' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = 'TR008')	toxicology
SELECT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id  WHERE T2.atom_id2 = 'TR004_7' AND T3.label = '-'	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = ' = ';	toxicology
SELECT COUNT(*) FROM molecule AS t1 INNER JOIN bond AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.bond_type = '#' AND t1.label = '-'	toxicology
SELECT T1.element, T2.bond_type FROM ATOM AS T1 JOIN CONNECTED AS T3 ON T1.atom_id = T3.atom_id JOIN BOND AS T2 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR016'	toxicology
SELECT atom_id FROM atom WHERE element = 'C' INTERSECT SELECT a1.atom_id FROM connected AS a1 JOIN connected AS a2 ON a1.atom_id2 = a2.atom_id AND a1.bond_id = a2.bond_id JOIN bond AS b ON b.bond_id = a1.bond_id WHERE b.bond_type = '= ' AND molecule_id = 'TR012'	toxicology
SELECT a.atom_id FROM atom a INNER JOIN connected c ON a.atom_id = c.atom_id INNER JOIN molecule m ON c.molecule_id = m.molecule_id INNER JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'o' AND m.label = '+'	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL	card_games
SELECT count(*) FROM cards WHERE borderColor = 'borderless' AND NOT (cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL)	card_games
SELECT name FROM cards ORDER BY faceConvertedManaCost DESC LIMIT 1	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN edhrec AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '2015' AND T2.ranking < 100	card_games
SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T2.uuid = T3.uuid WHERE T2.rarity = 'mythic' AND T3.status = 'Banned' AND T3.format = 'gladiator'	card_games
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'vintage' AND T2.type = 'Artifact' AND T2.side IS NULL	card_games
SELECT id, artist FROM cards WHERE power IN ('*', NULL) AND EXISTS (SELECT 1 FROM legalities WHERE format = 'commander' AND status = 'Legal' AND uuid = cards.uuid)	card_games
SELECT T1.name, T3.text, T1.hasContentWarning FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T1.artist = 'Stephen Daniel' AND T3.date = ( SELECT MAX(date) FROM rulings WHERE uuid = T1.uuid )	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T2.uuid = T1.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'	card_games
SELECT cards.name, cards.artist FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.isPromo = 1 GROUP BY cards.name, cards.artist ORDER BY COUNT(rulings.uuid) DESC LIMIT 1	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'annul' AND T1.number = '29'	card_games
SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards	card_games
SELECT T2.name, T1.totalSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian'	card_games
SELECT COUNT(DISTINCT T1.type) FROM cards AS T1 INNER JOIN `set` AS T2 ON T1.setCode = T2.code INNER JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T1.artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT T2.promoTypes FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT originaltype FROM cards WHERE name = 'Ancestor\'s Chosen';	card_games
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN cards AS T3 ON T3.setCode = T2.code WHERE T3.name = 'Angel of Mercy'	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isTextless = 0	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isStarter = 1	card_games
SELECT status FROM legalities WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle')	card_games
SELECT TYPE FROM cards WHERE name = 'Benalish Knight'	card_games
SELECT T3.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.name = 'Benalish Knight'	card_games
SELECT artist FROM foreign_data WHERE language = 'Phyrexian'	card_games
SELECT CAST(COUNT(CASE WHEN borderColor = 'borderless' THEN 1 END) AS REAL) * 100 / COUNT(id) FROM cards	card_games
SELECT COUNT(uuid) FROM cards WHERE language = 'German' AND isReprint = 1	card_games
SELECT COUNT(*) FROM cards WHERE language = 'Russian' AND borderColor = 'borderless'	card_games
SELECT CAST(COUNT(T1.id) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'French' AND T1.isStorySpotlight = 1	card_games
SELECT COUNT(*) FROM cards WHERE toughness = 99	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'	card_games
SELECT id FROM cards WHERE convertedManaCost = 0	card_games
SELECT layout FROM cards WHERE keywords LIKE '%flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND NOT (subtypes LIKE '%Angel%' AND subtypes NOT LIKE '%Angel%')	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL AND T2.type = 'normal'	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'	card_games
SELECT artist FROM cards WHERE language = 'Chinese Simplified'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese'	card_games
SELECT count(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white'	card_games
SELECT DISTINCT T2.uuid, T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'legacy'	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'	card_games
SELECT COUNT(T1.uuid), T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future'	card_games
SELECT colorIndicator FROM cards WHERE setCode = 'OGW'	card_games
SELECT T1.name, T2.language, T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.convertedManaCost = 5 AND T3.setCode = '10E'	card_games
SELECT T1.name, T2.date, T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'	card_games
SELECT colors FROM cards WHERE id BETWEEN 1 AND 20 AND layout = 'normal';  SELECT format FROM legalities WHERE uuid IN (SELECT uuid FROM cards WHERE id BETWEEN 1 AND 20);	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors LIKE '%B%'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability = 'paper,mtgo'	card_games
SELECT SUM(T1.convertedManaCost) FROM cards AS T1 INNER JOIN artists AS T2 ON T1.artist = T2.name WHERE T2.name = 'Rob Alexander'	card_games
SELECT DISTINCT T2.subtypes, T2.supertypes FROM cards AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'arena'	card_games
SELECT T2.setCode FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Spanish'	card_games
SELECT CAST(SUM(CASE WHEN T1.hand = '+3' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameEffects = 'legendary' AND T2.status = 'legal'	card_games
SELECT CAST(SUM(CASE WHEN T1.isStorySpotlight = 1 AND T1.isTextless = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage, T1.id FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.isStorySpotlight = 1 GROUP BY T1.id;	card_games
SELECT      (SUM(CASE WHEN language = 'Spanish' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage,     name FROM      cards WHERE      language = 'Spanish' ORDER BY      name	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE baseSetSize = 309)	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Portuguese (Brasil)' AND T1.block = 'Commander'	card_games
SELECT id FROM cards WHERE type = 'Creature' AND status = 'legal'	card_games
SELECT DISTINCT T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'de' AND T2.subtypes IS NOT NULL AND T2.supertypes IS NOT NULL	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 WHERE T1.power IS NULL OR T1.power = '*'	card_games
SELECT COUNT(*) FROM cards WHERE `format` = 'premodern' AND rulingText = 'This is a triggered mana ability' AND side IS NULL	card_games
SELECT DISTINCT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper';	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.text = 'Das perfekte Gegenmittel zu einer dichten Formation'	card_games
SELECT f.flavorText FROM foreign_data f INNER JOIN cards c ON f.uuid = c.uuid WHERE f.language = 'French' AND c.borderColor = 'black' AND c.type LIKE '%Creature%' AND c.layout = 'normal'	card_games
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND DATE(rulings.date) = '2009-01-10' INNER JOIN rulings ON cards.uuid = rulings.uuid	card_games
SELECT language FROM sets WHERE code IN (SELECT code FROM sets WHERE baseSetSize = 180)	card_games
SELECT CAST(SUM(CASE WHEN hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE format = 'commander' AND status = 'legal'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.power) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.setCode) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.type = 'expansion'	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000	card_games
SELECT COUNT(uuid) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT number FROM cards WHERE subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%' AND side IS NULL	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3	card_games
SELECT DISTINCT language FROM foreign_data WHERE uuid IN ( SELECT uuid FROM cards WHERE setCode = 'ARC' AND mcmName = 'Archenemy' )	card_games
SELECT T1.name, T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setcode WHERE T1.id = 5;	card_games
SELECT language, type FROM sets WHERE code = ( SELECT setCode FROM cards WHERE number = 206 )	card_games
SELECT T1.id, T1.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode INNER JOIN foreign_data AS T3 ON T2.uuid = T3.uuid WHERE T1.block = 'Shadowmoor' AND T3.language = 'Italian' ORDER BY T1.name LIMIT 2	card_games
SELECT T1.code FROM sets AS T1 INNER JOIN cards AS T2 ON T2.setCode = T1.code WHERE T1.isForeignOnly = 1 AND T1.isFoilOnly = 1 AND T2.language = 'Japanese'	card_games
SELECT language FROM sets WHERE language = 'Russian' GROUP BY language ORDER BY baseSetSize DESC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE language = 'Chinese Simplified'	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '')	card_games
SELECT COUNT(id) FROM cards WHERE borderColor = 'black'	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT name FROM cards WHERE borderColor = 'white' AND isFullArt = 1	card_games
SELECT language FROM set_translations WHERE setCode = '174';	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.setCode = 'ALL'	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13'	card_games
SELECT baseSetSize, code FROM sets WHERE block = 'Masques' INTERSECT SELECT baseSetSize, code FROM sets WHERE block = 'Mirage'	card_games
SELECT T2.code FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.type = 'expansion'	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'boros'	card_games
SELECT T1.language, T1.flavorText, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'colorpie'	card_games
SELECT CAST(COUNT(CASE WHEN T1.convertedManaCost = 16 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.convertedManaCost) AS 'percentage' FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror';	card_games
SELECT code FROM sets WHERE type = 'expansion_commander'	card_games
SELECT DISTINCT T2.name FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.setCode WHERE T1.abzan_watermark = 1	card_games
SELECT T2.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setcode WHERE T2.watermark = 'azorius'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND (cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL)	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '+%'	card_games
SELECT name FROM cards WHERE isTextless = 0	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE border_color = 'White' AND (power = '*' OR power IS NULL)	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL	card_games
SELECT DISTINCT T2.subtypes, T2.supertypes FROM cards AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T1.name = 'Molimo, Maro-Sorcerer'	card_games
SELECT T3.purchaseUrls FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T3.promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT T1.artist) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'Black' AND T2.status = 'Legal' AND T1.availability LIKE '%arena,mtgo%'	card_games
SELECT T1.convertedManaCost FROM cards AS T1 INNER JOIN cards AS T2 ON T1.name = 'Shrine Keeper' AND T2.name = 'Serra Angel' WHERE T1.convertedManaCost > T2.convertedManaCost ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'paper' AND T2.status = 'legal' AND T1.frameVersion = '2003' ORDER BY T1.convertedManaCost DESC LIMIT 3	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'Italian'	card_games
SELECT COUNT(T2.id) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.setCode WHERE T1.name = 'Angel of Mercy'	card_games
SELECT name FROM sets WHERE translation = 'Hauptset Zehnte Edition'	card_games
SELECT language FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND language = 'Korean'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode INNER JOIN cards AS T3 ON T2.translation = 'Hauptset Zehnte Edition' WHERE T3.artist = 'Adam Rex'	card_games
SELECT baseSetSize FROM sets WHERE translation = 'Hauptset Zehnte Edition'	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Simplified Chinese'	card_games
SELECT CASE WHEN COUNT(CASE WHEN T2.mtgoCode IS NOT NULL THEN 1 ELSE NULL END) > 0 THEN 'Yes' ELSE 'No' END FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Angel of Mercy'	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T2.setCode = T1.code WHERE T2.name = 'Ancestor''s Chosen'	card_games
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setcode = T2.code WHERE T1.translation = ' Hauptset Zehnte Edition'	card_games
SELECT count(*) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.set_code = T2.code WHERE T2.block = 'Ice Age' AND T1.language = 'Italian'	card_games
SELECT T2.isForeignOnly FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T2.translation IS NOT NULL AND T1.baseSetSize < 10	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND borderColor = 'black'	card_games
SELECT name FROM cards WHERE setCode = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT DISTINCT artist FROM cards WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') AND name = 'Coldsnap'	card_games
SELECT * FROM cards WHERE name = 'Coldsnap' AND number = '4';	card_games
SELECT COUNT(*) FROM cards WHERE convertedManaCost > 5 AND name = 'Coldsnap' AND (power = '*' OR power IS NULL)	card_games
SELECT T1.flavorText FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'Italian'	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.flavorText IS NOT NULL	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T1.language = 'Italian' AND T2.name = 'Coldsnap'	card_games
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.setCode = 'Coldsnap' AND T2.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT date FROM rulings WHERE uuid IN ( SELECT uuid FROM cards WHERE name = 'Reminisce' )	card_games
SELECT SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0 / SUM(T1.convertedManaCost) AS percentage FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.name WHERE T2.name = 'Coldsnap'	card_games
SELECT CAST(COUNT(CASE WHEN T2.cardKingdomFoilId = T2.cardKingdomId AND T2.cardKingdomId IS NOT NULL THEN 1 END) AS REAL) * 100 / COUNT(T2.*) AS percentage FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT T2.mcmName FROM sets AS T1 INNER JOIN sets AS T2 ON T1.releaseDate = '2017-06-09' WHERE T2.mcmName != ''	card_games
SELECT TYPE FROM sets WHERE name LIKE '%From the Vault: Lore%'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT T1.text, T1.hasContentWarning FROM ruling AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Jim Pavelec'	card_games
SELECT releaseDate FROM sets WHERE EXISTS (SELECT 1 FROM cards WHERE cards.setCode = sets.code AND cards.name = 'Evacuation')	card_games
SELECT COUNT(T1.baseSetSize) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'	card_games
SELECT T2.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'	card_games
SELECT T2.name FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'French' AND T1.text LIKE '%Tendo Ice Bridge%'	card_games
SELECT COUNT(T1.id) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Salvat 2011' AND T1.translation IS NOT NULL	card_games
SELECT s.name FROM sets AS s INNER JOIN cards AS c ON c.setCode = s.code WHERE c.name = 'Fellwar Stone' AND s.language = 'Japanese'	card_games
SELECT name FROM cards WHERE setCode = 'JOUR' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT t2.releaseDate FROM set_translations AS t1 INNER JOIN sets AS t2 ON t1.setCode = t2.code WHERE t1.translation = 'Ola de frío'	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'	card_games
SELECT COUNT(id) FROM cards WHERE setcode = 'wc04' AND convertedmanacost = 3	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setcode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified'	card_games
SELECT CAST(SUM(T2.isNonFoilOnly = 1) AS REAL) * 100 / COUNT(T1.language = 'Japanese') FROM set_translations AS T1 INNER JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T1.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN language = 'Portuguese (Brazil)' AND isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END) FROM cards	card_games
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1	card_games
SELECT T1.id FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode GROUP BY T2.setCode ORDER BY COUNT(T2.setCode) DESC LIMIT 1	card_games
SELECT T1.artist FROM cards AS T1 WHERE T1.side IS NULL AND T1.hasalternativedecklimit = 0 ORDER BY T1.convertedmanaCost DESC LIMIT 1	card_games
SELECT T1.frameEffects FROM cards AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL GROUP BY T1.frameEffects ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT COUNT(id) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'	card_games
SELECT T1.id FROM sets AS T1 INNER JOIN cards AS T2 ON T2.setCode = T1.code WHERE T1.type = 'Commander' GROUP BY T1.code ORDER BY SUM(T2.isPromo + T2.isOnlineOnly + T2.isPartialPreview) DESC LIMIT 1	card_games
SELECT name FROM cards WHERE format = 'duel' ORDER BY SUBSTR(manaCost, 2, LENGTH(manaCost) - 2) + 0 DESC LIMIT 10	card_games
SELECT MIN(T2.originalReleaseDate) AS originalReleaseDate, T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'Legacy' AND T2.rarity = 'mythic'	card_games
SELECT COUNT(T1.id) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Volkan Baga' AND T1.language = 'French'	card_games
SELECT COUNT(T2.status) FROM cards AS T1 INNER JOIN legalities AS T2 ON T2.uuid = T1.uuid WHERE T1.rarity = 'rare' AND T1.type = 'Enchantment' AND T1.name = 'Abundance'	card_games
SELECT format, T1.name FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE status = 'banned' GROUP BY format ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT language FROM sets WHERE name = 'Battlebond'	card_games
SELECT T1.artist, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid GROUP BY T1.artist ORDER BY COUNT(T1.uuid) ASC LIMIT 1	card_games
SELECT status FROM legalities WHERE uuid IN ( SELECT T2.uuid FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'D. Alexander Gregory' AND T1.frameVersion = '1997' AND T2.hasContentWarning = 1 AND T1.tcgplayerGroupId = 1 )	card_games
SELECT T2.name, T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'banned' AND T2.edhrecRank = 1	card_games
SELECT AVG(T1.baseSetSize) FROM sets AS T1 INNER JOIN ( SELECT language FROM sets GROUP BY language ORDER BY COUNT(language) DESC LIMIT 1 ) AS T2 ON T1.language = T2.language WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31'	card_games
SELECT artist FROM cards WHERE BorderColor = 'black' AND availability = 'arena'	card_games
SELECT uuid FROM legalities WHERE status IN ('banned', 'restricted') AND format = 'oldschool'	card_games
SELECT COUNT(uuid) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'and designed by Kev Walker'	card_games
SELECT c.name, l.format FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.setCode = 'HDO'	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Korean' AND T1.code NOT IN (SELECT T1.code FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese')	card_games
SELECT T1.name FROM frames AS T1 INNER JOIN cards AS T2 ON T2.frameVersion = T1.name WHERE T2.artist = 'Allen Williams' UNION SELECT T3.name FROM rulings AS T3 INNER JOIN cards AS T4 ON T4.uuid = T3.uuid WHERE T4.artist = 'Allen Williams' AND T3.text LIKE '%banned%'	card_games
SELECT DisplayName, MAX(Reputation) FROM users WHERE DisplayName = 'Harlan' OR DisplayName = 'Jarrod Dixon'	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.UpVotes > 100 AND T2.DownVotes > 1	codebase_community
SELECT COUNT(DISTINCT OwnerUserId) FROM posts WHERE Views > 10 AND YEAR(CreationDate) > 2013	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT T2.OwnerDisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT T2.title FROM users AS T1 INNER JOIN posts AS T2 ON T1.id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' ORDER BY T2.ViewCount DESC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM Posts AS T1 INNER JOIN Users AS T2 ON T1.OwnerUserId = T2.Id ORDER BY T1.FavoriteCount DESC LIMIT 1	codebase_community
SELECT SUM(T1.CommentCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(T2.AnswerCount) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' AND T2.PostTypeId = 2 ORDER BY T2.AnswerCount DESC LIMIT 1	codebase_community
SELECT T1.LastEditorDisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*) FROM posts AS T1 INNER JOIN users AS T2 ON T2.Id = T1.OwnerUserId WHERE T2.DisplayName = 'csgillespie' AND T1.ParentId IS NULL	codebase_community
SELECT DISTINCT T3.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id INNER JOIN users AS T3 ON T2.Id = T3.Id WHERE T1.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age > 65 AND T1.Score >= 20	codebase_community
SELECT T3.Location FROM posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT T3.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id INNER JOIN posts AS T3 ON T3.Id = T2.ExcerptPostId WHERE T1.TagName = 'bayesian'	codebase_community
SELECT T1.Body FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId GROUP BY T2.TagName ORDER BY COUNT(T2.TagName) DESC LIMIT 1	codebase_community
SELECT COUNT(b.Id) FROM badges b INNER JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT T1.name FROM badges AS T1 INNER JOIN users AS T2 ON T1.userid = T2.id WHERE T2.displayname = 'csgillespie'	codebase_community
SELECT COUNT(T1.Name) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND YEAR(T1.Date) = 2011	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T2.DisplayName ORDER BY COUNT(T1.Id) DESC LIMIT 1	codebase_community
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(T2.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Views > 200	codebase_community
SELECT CAST(SUM(IIF(T3.Age > 65, 1, 0)) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.Score > 20	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes ORDER BY CreationDate DESC LIMIT 1	codebase_community
SELECT COUNT(T2.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Revival'	codebase_community
SELECT T2.Title FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score = ( SELECT MAX(T3.Score) FROM comments AS T3 )	codebase_community
SELECT COALESCE(SUM(`CommentCount`), 0) FROM `posts` WHERE `ViewCount` = 1910	codebase_community
SELECT T2.FavoriteCount FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 3025 AND T1.CreationDate = '2014/4/23 20:29:39.0'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1	codebase_community
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = '65041'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini'	codebase_community
SELECT T3.DisplayName FROM votes AS T1 INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Id = '6347'	codebase_community
SELECT COUNT(v.Id) AS NumberOfVotes FROM votes AS v JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(T2.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.OwnerUserId = T2.UserId WHERE T1.OwnerUserId = 24	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'SilentGhost'	codebase_community
SELECT T3.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Text = 'thank you user93!'	codebase_community
SELECT T2.Text FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'A Lion'	codebase_community
SELECT users.DisplayName, users.Reputation FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT T1.LastEditorDisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T2.Id = T1.LastEditorUserId WHERE T2.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT u.WebsiteUrl, SUM(p.Score) as TotalScore FROM posts p INNER JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.Id	codebase_community
SELECT DISTINCT T1.UserDisplayName FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'	codebase_community
SELECT SUM(T1.BountyAmount) FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%data%'	codebase_community
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T1.PostId = T3.Id WHERE T1.BountyAmount = 50 AND T3.Title LIKE '%variance%'	codebase_community
SELECT T2.Body, T2.Text, T2.Score FROM posts AS T1 INNER JOIN tags AS T3 ON T3.TagName LIKE '%humor%' INNER JOIN posts AS T4 ON T4.ParentId = T1.Id INNER JOIN comments AS T5 ON T5.PostId = T4.Id WHERE T1.Tags LIKE '%humor%' GROUP BY T4.Id	codebase_community
SELECT SUM(CASE WHEN UserId = 13 THEN 1 ELSE 0 END) AS TotalComments FROM comments;	codebase_community
SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT MIN(Views), UserId FROM posts	codebase_community
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Supporter' AND YEAR(T2.CreationDate) = 2011	codebase_community
SELECT COUNT(DISTINCT T2.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T2.Id HAVING COUNT(T1.Name) > 5	codebase_community
SELECT COUNT(DISTINCT T.UserId) FROM ( SELECT P.UserId FROM users AS U INNER JOIN badges AS B ON U.Id = B.UserId INNER JOIN posts AS P ON P.OwnerUserId = U.Id WHERE P.Location = 'New York' AND B.Name IN ('Supporter', 'Teachers') GROUP BY P.UserId ) T	codebase_community
SELECT DISTINCT T1.DisplayName, T2.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 1	codebase_community
SELECT T3.UserId FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN postHistory AS T3 ON T2.Id = T3.PostId WHERE T2.ViewCount >= 1000 GROUP BY T1.Id HAVING COUNT(DISTINCT T3.PostId) = 1	codebase_community
SELECT u.DisplayName, u.Age, b.Name FROM users u JOIN ( SELECT UserId FROM comments GROUP BY UserId ORDER BY COUNT(UserId) DESC LIMIT 1 ) c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId;	codebase_community
SELECT COUNT(DISTINCT users.Id) FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.Location = 'India' AND badges.Name = 'Teacher'	codebase_community
SELECT CAST(SUBTRACT(DIVIDE(COUNT(CASE WHEN YEAR(badges.`Date`) = 2010 THEN badges.Name ELSE NULL END), COUNT(badges.Name)) * 100, DIVIDE(COUNT(CASE WHEN YEAR(badges.`Date`) = 2011 THEN badges.Name ELSE NULL END), COUNT(badges.Name)) * 100) AS REAL) FROM badges WHERE badges.Name LIKE '%Student%'	codebase_community
SELECT T1.PostHistoryTypeId, COUNT(DISTINCT T3.UserId) FROM postHistory AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN comments AS T3 ON T2.Id = T3.PostId WHERE T2.Id = 3720 GROUP BY T1.PostHistoryTypeId	codebase_community
SELECT T1.ViewCount FROM posts AS T1 INNER JOIN postlinks AS T2 ON T1.Id = T2.PostId WHERE T2.RelatedPostId = 61217	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395	codebase_community
SELECT T1.PostId, T1.UserId FROM posts AS T1 WHERE T1.Score > 60	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE CreationDate >= '2011-01-01' AND CreationDate <= '2011-12-31' AND OwnerUserId = 686	codebase_community
SELECT AVG(T1.UpVotes), AVG(T3.Age) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id GROUP BY T1.Id HAVING COUNT(T2.OwnerUserId) > 10	codebase_community
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Announcer'	codebase_community
SELECT T2.Name FROM postHistory AS T1 INNER JOIN badges AS T2 ON T2.Id = T1.UserId WHERE T1.CreationDate = '2010-07-19 19:39:08'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.CreationDate = '2010-07-19 19:25:47'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10	codebase_community
SELECT Name FROM badges WHERE UserId IN ( SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1 )	codebase_community
SELECT T1.Reputation FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'	codebase_community
SELECT DISTINCT T2.Date FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'	codebase_community
SELECT CAST(COUNT(CASE WHEN T2.Name = 'Teacher' THEN 1 END) AS FLOAT) * 100 / COUNT(T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId	codebase_community
SELECT CAST(COUNT(T1.Id) AS REAL) * 100 / COUNT(T2.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Age BETWEEN 13 AND 18 AND T2.Name = 'Organizer'	codebase_community
SELECT AVG(Score) FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT T2.Age FROM badges AS T1 INNER JOIN users AS T2 ON T2.Id = T1.UserId WHERE T2.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(T1.UserId)  FROM users AS T1  INNER JOIN badges AS T2 ON T1.Id = T2.UserId  WHERE T2.Name = 'Supporter' AND T1.Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(T1.Views) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = ( SELECT MIN(Reputation) FROM users )	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Age > 65 AND T1.Name = 'Supporter'	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location = 'New York'	codebase_community
SELECT SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS number_of_votes FROM votes	codebase_community
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT T3.DisplayName FROM posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.PostTypeId = 1 ORDER BY T1.Views DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) FROM votes	codebase_community
SELECT DISTINCT T1.TagName FROM tags AS T1 INNER JOIN posts AS T2 ON TRIM(T1.TagName) = TRIM(T2.Tags) INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T3.DisplayName = 'John Stauffer'	codebase_community
SELECT COUNT(Id) FROM posts WHERE OwnerDisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan')	codebase_community
SELECT PostId FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1	codebase_community
SELECT MAX(SUM(T1.ViewCount)) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky' OR T2.DisplayName = 'Noah Snyder'	codebase_community
SELECT COUNT(*) FROM ( SELECT T1.PostId FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Matt Parker' GROUP BY T1.PostId HAVING COUNT(*) > 4 ) AS T3	codebase_community
SELECT SUM(CASE WHEN T2.Score < 60 THEN 1 ELSE 0 END) FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Neil McGuigan'	codebase_community
SELECT T3.TagName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id INNER JOIN post_tags AS T4 ON T1.Id = T4.PostId INNER JOIN tags AS T3 ON T3.Id = T4.TagId WHERE T2.DisplayName = 'Mark Meckes' AND T1.Id NOT IN (SELECT PostId FROM comments)	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'	codebase_community
SELECT CAST(COUNT(T1.PostId) AS REAL) * 100 / COUNT(T2.Id) FROM tags AS T1 INNER JOIN users AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'r' AND T2.DisplayName = 'Community'	codebase_community
SELECT SUM(T1.ViewCount) - SUM(T2.ViewCount) FROM posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id INNER JOIN users AS T4 ON T2.OwnerUserId = T4.Id WHERE T3.DisplayName = 'Mornington' AND T4.DisplayName = 'Amos'	codebase_community
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN comments AS T2 ON T1.UserId = T2.UserId WHERE YEAR(T2.Date) = 2014 AND T1.Name = 'Commentator'	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT t3.LastEditDate, t3.LastEditorUserId FROM posts AS t1 INNER JOIN postHistory AS t2 ON t1.Id = t2.PostId INNER JOIN posts AS t3 ON t2.PostId = t3.Id WHERE t1.Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.Id = 13 AND T2.Score < 60	codebase_community
SELECT DISTINCT T2.Title, T2.OwnerDisplayName FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score > 60	codebase_community
SELECT T3.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId INNER JOIN postHistory AS T3 ON T2.UserId = T3.UserId WHERE YEAR(T3.CreationDate) = 2011 AND T1.Location LIKE '%North Pole%'	codebase_community
SELECT DISTINCT T2.DisplayName, T2.WebsiteUrl FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount > 150	codebase_community
SELECT COUNT(T1.Id), T1.LastEditDate  FROM Posts AS T1 INNER JOIN PostHistory AS T2 ON T1.Id = T2.PostId  WHERE T1.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT t1.LastAccessDate, t1.Location FROM users AS t1 INNER JOIN badges AS t2 ON t1.Id = t2.UserId WHERE t2.Name = 'Outlier'	codebase_community
SELECT T3.Title FROM Posts AS T1 INNER JOIN PostLinks AS T2 ON T1.Id = T2.RelatedPostId INNER JOIN Posts AS T3 ON T2.PostId = T3.Id WHERE T1.Title = 'How to tell if something happened in a data set which monitors a value over time'	codebase_community
SELECT T1.PostId, T2.Name FROM postHistory AS T1 INNER JOIN badges AS T2 ON T1.UserId = T2.UserId WHERE T1.UserDisplayName = 'Samuel' AND YEAR(T1.CreationDate) = 2013	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT T2.DisplayName, T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id INNER JOIN tags AS T3 ON T1.ExcerptPostId = T3.ExcerptPostId WHERE T3.TagName = 'hypothesis-testing'	codebase_community
SELECT T1.Title, T2.RelatedPostId, T2.LinkTypeId FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'What are principal component scores?'	codebase_community
SELECT T2.ParentId, MAX(T1.Score) FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId GROUP BY T2.ParentId	codebase_community
SELECT DisplayName, WebsiteUrl FROM users WHERE Id = (SELECT UserId FROM votes WHERE VoteTypeId = 8 ORDER BY BountyAmount DESC LIMIT 1)	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);	codebase_community
SELECT T1.Reputation, T2.Age FROM users AS T1 JOIN (   SELECT T3.Age, MAX(T1.Reputation) AS MaxReputation   FROM users AS T1   JOIN posts AS T2 ON T1.Id = T2.OwnerUserId   JOIN users AS T3 ON T2.OwnerUserId = T3.Id   WHERE T2.PostTypeId = 1   GROUP BY T3.Age ) AS T4 ON T1.Reputation = T4.MaxReputation	codebase_community
SELECT COUNT(DISTINCT T1.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE YEAR(T1.CreationDate) = 2011 AND T2.BountyAmount = 50	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1	codebase_community
SELECT T2.Score FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id OR T1.WikiPostId = T2.Id ORDER BY T1.Count DESC LIMIT 1	codebase_community
SELECT CAST(COUNT(Id) AS REAL) / 12 FROM postLinks WHERE YEAR(CreationDate) = 2010 AND AnswerCount <= 2	codebase_community
SELECT T1.Id FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 1465 ORDER BY T1.FavoriteCount DESC LIMIT 1	codebase_community
SELECT T3.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN posts AS T3 ON T1.RelatedPostId = T3.Id ORDER BY T2.CreationDate ASC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(Name) DESC LIMIT 1)	codebase_community
SELECT MIN(T3.CreationDate) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId INNER JOIN posts AS T3 ON T2.PostId = T3.Id WHERE T1.DisplayName = 'chl'	codebase_community
SELECT MIN(T2.CreationDate) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId ORDER BY T1.Age ASC LIMIT 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date ASC LIMIT 1	codebase_community
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location = 'United Kingdom' AND T2.FavoriteCount >= 4	codebase_community
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT Id FROM users ORDER BY Age DESC LIMIT 1)	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Jay Stevens' AND YEAR(T1.CreationDate) = 2010	codebase_community
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT T1.Id, T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id ORDER BY T1.Score DESC LIMIT 1	codebase_community
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T2.Id = T1.OwnerUserId WHERE T2.DisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T2.Id = T1.OwnerUserId WHERE T1.ViewCount > 20000 AND YEAR(T1.CreaionDate) = 2011	codebase_community
SELECT T2.id, T2.OwnerDisplayName FROM postHistory AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.id WHERE T1.CreationDate BETWEEN '2010-01-01' AND '2010-12-31' ORDER BY T2.FavoriteCount DESC LIMIT 1	codebase_community
SELECT CAST(COUNT(CASE WHEN YEAR(CreaionDate) = 2011 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(Id) * 100	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users	codebase_community
SELECT T3.DisplayName, T1.ViewCount FROM posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.Title = 'Computer Game Datasets' ORDER BY T1.LastActivityDate DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount &gt; (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(Text) FROM comments WHERE PostId IN (SELECT PostId FROM posts WHERE Score = (SELECT MAX(Score) FROM posts))	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT DisplayName, Location FROM users WHERE Id IN (SELECT LastEditorUserId FROM posts WHERE Id = 183)	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') ORDER BY Date DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT T2.OwnerUserId) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Age BETWEEN 19 AND 65 AND T2.UpVotes > 5000	codebase_community
SELECT T2.CreationDate, DATEDIFF(T2.CreationDate, T1.Date) AS TimeTaken FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Zolomon'	codebase_community
SELECT COUNT(T1.Id) ,  COUNT(T2.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)	codebase_community
SELECT T2.Text, T1.DisplayName FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId INNER JOIN posts AS T3 ON T2.PostId = T3.Id WHERE T3.Title = 'Analysing wind data with R' ORDER BY T2.CreationDate DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(Id) FROM posts WHERE FIND_IN_SET('careers', REPLACE(Tags, ',', ' ')) > 0	codebase_community
SELECT reputation, viewcount FROM users WHERE displayname = 'Jarrod Dixon'	codebase_community
SELECT SUM(CASE WHEN t3.Title = 'Clustering 1D data' THEN 1 ELSE 0 END) AS answer_count, COUNT(t1.Text) AS comment_count  FROM comments t1  LEFT JOIN posts t3 ON t3.Id = t1.PostId	codebase_community
SELECT T1.CreationDate FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T2.BountyAmount >= 30	codebase_community
SELECT CAST(SUM(IIF(Score >= 50, 1, 0)) AS REAL) * 100 / COUNT(*) FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId ORDER BY users.Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(T1.Id) FROM tags AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.Tags WHERE T1.Count <= 20 AND T1.Id < 15	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'How can I adapt ANOVA for binary data?'	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ViewCount BETWEEN 100 AND 150 ORDER BY T1.Score DESC LIMIT 1	codebase_community
SELECT DISTINCT T1.DisplayName, T1.CreationDate, T1.Age FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE '%http://%'	codebase_community
SELECT COUNT(t1.PostId) FROM comments AS t1 INNER JOIN posts AS t2 ON t1.PostId = t2.Id WHERE t1.Score = 0 AND t2.ViewCount < 5	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CommentCount = 1) AND Score = 0;	codebase_community
SELECT COUNT(DISTINCT T4.UserId) FROM comments AS T1 INNER JOIN users AS T4 ON T4.Id = T1.UserId WHERE T1.Score = 0 AND T4.Age = 40	codebase_community
SELECT T3.PostId, T3.Text  FROM posts AS T1  INNER JOIN comments AS T3 ON T1.Id = T3.PostId  WHERE T1.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT T1.UpVotes FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN comments AS T3 ON T2.Id = T3.PostId WHERE T3.Text = 'R is also lazy evaluated.'	codebase_community
SELECT T3.Text FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId INNER JOIN posthistory AS T3 ON T2.Id = T3.Id WHERE T1.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0	codebase_community
SELECT CAST(SUM(IIF(T2.UpVotes = 0, 1, 0)) AS REAL) * 100 / COUNT(T1.UserId) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10	codebase_community
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(hero_id) FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND superhero_name IN ( SELECT s.superhero_name FROM superhero s INNER JOIN hero_power hp ON s.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' )	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T1.full_name) > 15	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue')	superhero
SELECT colour.colour FROM colour JOIN superhero ON colour.id = superhero.skin_colour_id WHERE superhero.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.eye_colour_id = ( SELECT id FROM colour WHERE colour = 'Blue' ) AND T3.power_name = 'Agility'	superhero
SELECT t2.superhero_name FROM colour AS t1 INNER JOIN superhero AS t2 ON t1.id = t2.eye_colour_id INNER JOIN superhero AS t3 ON t3.hair_colour_id = t1.id WHERE t1.colour = 'Blue' AND t3.hair_colour_id = 'Blond'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT `full_name` FROM `superhero` WHERE `publisher_name` = 'Marvel Comics' ORDER BY `height_cm` DESC LIMIT 1	superhero
SELECT T3.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T3 ON T3.id = T1.publisher_id WHERE T1.superhero_name = 'Sauron'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT CAST(COUNT(CASE WHEN T3.power_name = 'Super Strength' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')	superhero
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id INNER JOIN attribute AS T4 ON T4.id = T3.attribute_id WHERE T4.attribute_name = 'Speed' ORDER BY T3.attribute_value LIMIT 1	superhero
SELECT COUNT(*) FROM `superhero` AS T1 INNER JOIN `publisher` AS T2 ON T1.`publisher_id` = T2.`id` WHERE T2.`publisher_name` LIKE 'Marvel Comics' INNER JOIN `colour` AS T3 ON T3.`id` = T1.`eye_colour_id` WHERE T3.`colour` = 'Gold'	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'	superhero
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value ASC LIMIT 1	superhero
SELECT T3.race FROM superhero AS T1 INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.superhero_name = 'Copycat'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T2.attribute_value < 50	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T1.gender_id = 2 AND T3.attribute_name = 'Strength' AND T2.attribute_value = 100	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T1.superhero_name) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE race = 'Vampire'	superhero
SELECT SUM(alignment = 'Bad') * 100 / COUNT(id) FROM superhero WHERE publisher_name = 'Marvel Comics'	superhero
SELECT COALESCE(SUM(CASE WHEN publisher_name = 'DC Comics' THEN 1 ELSE 0 END), 0) - COALESCE(SUM(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END), 0) FROM publisher	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(T1.attribute_value) FROM hero_attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.hero_id = T2.hero_id	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT c.colour FROM colour c INNER JOIN superhero s ON c.id = s.eye_colour_id WHERE s.id = 75	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(T2.weight_kg) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T2.gender_id = 2	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id INNER JOIN gender AS T4 ON T4.id = T3.gender_id WHERE T3.gender = 'Male' LIMIT 5	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.height_cm BETWEEN 170 AND 190 AND T1.attribute_id = 2 AND T1.attribute_value = 1	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56	superhero
SELECT DISTINCT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5	superhero
SELECT COUNT(T1.superhero_name) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Bad'	superhero
SELECT T1.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169	superhero
SELECT T.colour FROM ( SELECT T1.hair_colour_id, T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T1.height_cm = 185 AND T2.race = 'human' ) AS T	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = ( SELECT MAX(weight_kg) FROM superhero )	superhero
SELECT COUNT(CASE WHEN T1.publisher_id = 13 THEN 1 ELSE NULL END) * 100.0 / COUNT(*) AS percentage FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180	superhero
SELECT T.full_name FROM superhero AS T WHERE T.gender_id = 1 AND T.weight_kg > ( SELECT AVG(U.weight_kg) * 0.79 FROM superhero AS U WHERE U.gender_id = 1 )	superhero
SELECT T4.power_name FROM hero_power AS T1 INNER JOIN superpower AS T4 ON T1.power_id = T4.id GROUP BY T4.power_name ORDER BY COUNT(T4.power_name) DESC LIMIT 1	superhero
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Abomination';	superhero
SELECT T3.power_name FROM hero_power AS T1 INNER JOIN superpower AS T3 ON T1.power_id = T3.id WHERE T1.hero_id = 1	superhero
SELECT COUNT(*) FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'stealth';	superhero
SELECT T.full_name FROM `superhero` AS T, `hero_attribute` AS T1 WHERE T.id = T1.hero_id AND T1.attribute_id = ( SELECT T3.id FROM `attribute` AS T3 WHERE T3.attribute_name = 'strength' ) AND T1.attribute_value = ( SELECT MAX(T2.attribute_value) FROM `hero_attribute` AS T2 WHERE T2.attribute_id = ( SELECT T3.id FROM `attribute` AS T3 WHERE T3.attribute_name = 'strength' ) )	superhero
SELECT AVG(CASE WHEN T2.skin_colour_id = 1 THEN 1 ELSE 0 END) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id	superhero
SELECT COUNT(superhero_name) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T1.publisher_name = 'Dark Horse Comics' AND T4.attribute_name = 'Durability' ORDER BY T3.attribute_value DESC LIMIT 1	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Abraham Sapien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'	superhero
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T1.gender_id = 1 AND T2.publisher_name = 'Dark Horse Comics'	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN T2.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.gender_id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.gender_id = 2	superhero
SELECT T2.superhero_name, T2.race FROM full_name AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT T2.gender FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'	superhero
SELECT DISTINCT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'	superhero
SELECT COUNT(*) FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo')	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Hunter Zolomon'	superhero
SELECT T2.height_cm FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T1.colour = 'Amber'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'	superhero
SELECT T1.eye_colour_id FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT COUNT(DISTINCT t.hero_id) FROM hero_attribute t INNER JOIN attribute a ON t.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND t.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Strength' )	superhero
SELECT race.race, alignment.alignment FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.publisher_name) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT SUM(T1.weight_kg) - SUM(T2.weight_kg) FROM superhero AS T1 INNER JOIN superhero AS T2 ON T1.full_name = 'Emil Blonsky' AND T2.full_name = 'Charles Chandler'	superhero
SELECT AVG(height_cm) FROM superhero	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3	superhero
SELECT T2.attribute_name, T1.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.id = 7 AND T3.id = 9	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Hawkman' OR T1.superhero_name = 'Karate Kid' OR T1.superhero_name = 'Speedy'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1	superhero
SELECT SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS percentage FROM superhero AS T1	superhero
SELECT CAST(COUNT(CASE WHEN T1.gender_id = 1 THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN T1.gender_id = 2 THEN 1 ELSE NULL END) FROM superhero AS T1	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT T1.id FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT c.colour FROM superhero AS s INNER JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T1.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38	superhero
SELECT t3.race FROM hero_attribute AS t1 INNER JOIN hero_power AS t2 ON t1.hero_id = t2.hero_id INNER JOIN superhero AS t3 ON t2.hero_id = t3.id INNER JOIN race AS t4 ON t3.race_id = t4.id GROUP BY t4.race ORDER BY AVG(t1.attribute_value) DESC LIMIT 1	superhero
SELECT T1.alignment, T3.power_name FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN hero_power AS T4 ON T2.id = T4.hero_id INNER JOIN superpower AS T3 ON T4.power_id = T3.id WHERE T2.superhero_name = 'Atom IV'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5	superhero
SELECT AVG(T2.attribute_value) FROM alignment AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T1.alignment = 'neutral'	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id WHERE T3.attribute_id = 1 AND T3.attribute_value = 100	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.id = 1 AND T3.id = 2	superhero
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_value BETWEEN 75 AND 80	superhero
SELECT T1.race FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'male' AND T2.colour = 'blue'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.gender_id) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.id = 2	superhero
SELECT SUM(IIF(CASE WHEN T1.weight_kg = 0 OR T1.weight_kg IS NULL THEN 1 ELSE 0 END = 1, IFF(T2.id = 1, 1, 0), 0)) - SUM(IIF(CASE WHEN T1.weight_kg = 0 OR T1.weight_kg IS NULL THEN 1 ELSE 0 END = 1, IFF(T2.id = 7, 1, 0), 0)) AS difference FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id	superhero
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Hulk' AND T2.attribute_name = 'Strength'	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Ajax'	superhero
SELECT COUNT(superhero.id) FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.gender_id = 2 AND T2.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name	superhero
SELECT T2.gender FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN superpower AS T3 ON T1.power_id = T3.id WHERE T3.power_name = 'Phoenix Force'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race_id <> (SELECT id FROM race WHERE race = 'Human')	superhero
SELECT COUNT(h.id) FROM hero_attribute ha INNER JOIN attribute a ON ha.attribute_id = a.id INNER JOIN superhero h ON ha.hero_id = h.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100	superhero
SELECT SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id	superhero
SELECT T3.attribute_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.attribute_value LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT COUNT(T1.gender) * 100.0 / COUNT(T1.publisher_name) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.gender = 'Female' AND T2.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN T2.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT T2.hero_id FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id ORDER BY T2.attribute_value LIMIT 1	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT T3.full_name FROM color AS T1 INNER JOIN superhero AS T3 ON T1.id = T3.eye_colour_id INNER JOIN alignment AS T2 ON T3.alignment_id = T2.id WHERE T3.weight_kg < 100 AND T1.colour = 'brown'	superhero
SELECT attribute_value FROM hero_attribute WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Aquababy')	superhero
SELECT T2.weight_kg, T3.race FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.id = 40	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT hero_id FROM hero_power INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE power_name = 'Intelligence'	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.height_cm > ( SELECT AVG(height_cm) FROM superhero WHERE height_cm IS NOT NULL ) * 0.8	superhero
SELECT T1.driverRef FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 18 AND T2.q1 IS NOT NULL AND T2.q1 != 'n/a' AND T2.q1 != '9999:99:99' ORDER BY T2.q1 LIMIT 5	formula_1
SELECT T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId INNER JOIN qualifying AS T3 ON T2.raceId = T3.raceId WHERE T3.raceId = 19 AND T3.q2 = ( SELECT MIN(q2) FROM qualifying ) AND T2.position = 2	formula_1
SELECT YEAR FROM races WHERE CIRCUITID IN (SELECT circuitId FROM circuits WHERE location = 'Shanghai')	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Germany'	formula_1
SELECT T1.name, T2.position  FROM circuits AS T1  JOIN results AS T2  ON T1.circuitId = T2.circuitId  JOIN constructors AS T3  ON T2.constructorId = T3.constructorId  WHERE T3.name = 'Renault'	formula_1
SELECT COUNT(DISTINCT T2.raceId) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year = 2010 AND T1.country NOT IN ('Asia', 'Europe')	formula_1
SELECT DISTINCT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Spain'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Australian Grand Prix'	formula_1
SELECT url FROM races WHERE name = 'Sepang International Circuit'	formula_1
SELECT time FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T2.country FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 24 AND T1.position = 1	formula_1
SELECT T1.q1 FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 354 AND T2.surname = 'Senna' AND T2.forename = 'Bruno'	formula_1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN qualifying AS T3 ON T2.raceId = T3.raceId INNER JOIN races AS T4 ON T3.raceId = T4.raceId WHERE T3.raceId = 355 AND T3.q2 = '0:01:40'	formula_1
SELECT number FROM drivers WHERE driverId IN (SELECT driverId FROM qualifying WHERE position = 1 AND q3 = '0:01:54' AND raceId = 903)	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = ( SELECT raceId FROM races WHERE year = 2007 AND name = 'Bahrain Grand Prix' ) AND time IS NULL	formula_1
SELECT YEAR FROM races WHERE raceId = 901	formula_1
SELECT COUNT(DISTINCT resultId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL	formula_1
SELECT T1.forename, T1.surname, T1.dob FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592 AND T2.time IS NOT NULL ORDER BY T1.dob LIMIT 1	formula_1
SELECT T1.url FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.time = '0:01:27' AND T2.raceId = 161	formula_1
SELECT T2.nationality FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 ORDER BY T1.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT T2.lat, T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Malaysian Grand Prix'	formula_1
SELECT T2.url FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT q1 FROM qualifying WHERE driverId = ( SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grasso' ) AND raceId = 345	formula_1
SELECT T2.nationality FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 347 AND T1.q2 = '0:01:15'	formula_1
SELECT T3.code FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.raceId = 45 AND T1.q3 = '0:01:33'	formula_1
SELECT time FROM results WHERE driverId = ( SELECT driverId FROM drivers WHERE forename = 'Bruce' AND surname = 'McLaren' ) AND raceId = ( SELECT raceId FROM races WHERE round = 743 )	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.position = 2 AND T1.raceId = ( SELECT T3.raceId FROM races AS T3 INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T4.circuitRef = 'san_marino' AND T3.year = 2006 )	formula_1
SELECT T1.year FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901	formula_1
SELECT COUNT(T3.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2015 AND T1.date = '2015-11-29' AND T2.positionText = 'Finish'	formula_1
SELECT T2.forename, T2.surname, T2.dob FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 872 ORDER BY T2.dob LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T3.raceId = T2.raceId WHERE T3.raceId = 348 ORDER BY T2.time ASC LIMIT 1	formula_1
SELECT T2.nationality FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapSpeed = ( SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 )	formula_1
SELECT DIVIDE(SUBTRACT(fastestLapSpeed, (SELECT T1.fastestLapSpeed FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = (SELECT raceId FROM results WHERE driverId = 854) ORDER BY T1.fastestLapSpeed DESC LIMIT 1)), fastestLapSpeed) * 100 FROM results WHERE driverId = 853 ORDER BY fastestLapSpeed DESC LIMIT 1	formula_1
SELECT CAST(COUNT(T2.driverId) AS REAL) / COUNT(T1.driverId) AS percentage FROM races AS T1 INNER JOIN results AS T2 ON T2.raceId = T1.raceId WHERE T1.date = '1983-07-16' AND T2.time IS NOT NULL	formula_1
SELECT min(T1.year) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Singapore International Circuit'	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC	formula_1
SELECT T1.name FROM races AS T1 INNER JOIN races AS T2 ON T1.date = T2.date WHERE YEAR(T1.date) = ( SELECT YEAR(min(date)) FROM races ) AND MONTH(T1.date) = ( SELECT MONTH(min(date)) FROM races ) ORDER BY T1.date	formula_1
SELECT T2.name, T2.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 1999 ORDER BY T1.round DESC LIMIT 1	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(raceId) DESC LIMIT 1	formula_1
SELECT DISTINCT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2017 AND NOT EXISTS (SELECT 1 FROM races AS T3 INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T3.year = 2000 AND T4.name = T2.name)	formula_1
SELECT T1.name, T1.location FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId ORDER BY T2.year LIMIT 1	formula_1
SELECT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Brands Hatch' ORDER BY T1.year DESC LIMIT 1	formula_1
SELECT COUNT(DISTINCT t1.year) FROM races AS t1 INNER JOIN circuits AS t2 ON t1.circuitId = t2.circuitId WHERE t1.name = 'British Grand Prix' AND t2.country = 'United Kingdom'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Singapore Grand Prix 2010' ORDER BY T2.position	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY SUM(T1.points) DESC LIMIT 1	formula_1
SELECT T1.name, T2.points FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T3.raceId = T2.raceId INNER JOIN seasons AS T4 ON T4.year = T3.year WHERE T3.name = '2017 Chinese Grand Prix' AND T4.year = '2017' ORDER BY T2.points DESC LIMIT 3	formula_1
SELECT T1.forename, T1.surname, T2.name AS race_name, T1.time FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY CAST(REPLACE(T1.time, ':', '.') AS REAL) ASC LIMIT 1	formula_1
SELECT AVG(T2.time) FROM results AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId = (SELECT driverId FROM drivers WHERE forename = 'Sebastian' AND surname = 'Vettel') AND T1.raceId IN (SELECT raceId FROM races WHERE year = 2009 AND circuitRef = 'sepang' AND name = 'Chinese Grand Prix')	formula_1
SELECT CAST(SUM(IIF(T1.surname = 'Hamilton' AND T1.position > 1, 1, 0)) AS REAL) * 100 / COUNT(T1.raceId) FROM results AS T1 INNER JOIN races AS T2 ON T2.raceId = T1.raceId WHERE T2.year >= 2010	formula_1
SELECT T2.nationality, AVG(T4.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T2.driverId = T1.driverId INNER JOIN races AS T3 ON T3.raceId = T1.raceId INNER JOIN results AS T4 ON T4.raceId = T1.raceId WHERE T1.position = 1 GROUP BY T1.driverId ORDER BY COUNT(T1.wins) DESC LIMIT 1	formula_1
SELECT forename, surname, 2022 - EXTRACT(YEAR FROM dob) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY age ASC LIMIT 1	formula_1
SELECT COUNT(circuits.circuitId), circuits.* FROM circuits INNER JOIN races ON circuits.circuitId = races.circuitId WHERE races.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY races.circuitId HAVING COUNT(circuits.circuitId) = 4	formula_1
SELECT c.name, c.location, r.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country = 'USA' AND r.year = 2006	formula_1
SELECT r.name, c.name, c.location FROM races AS r INNER JOIN circuits AS c ON r.circuitId = c.circuitId WHERE r.date LIKE '2005-09%'	formula_1
SELECT T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = ( SELECT driverId FROM drivers WHERE forename = 'Alex' AND surname = 'Yoong' ) AND T2.position < 10	formula_1
SELECT COUNT(T1.name), T1.circuitRef FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.position = 1 AND T1.circuitRef = 'sepang_international_circuit' AND T2.driverId = ( SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher' )	formula_1
SELECT T3.year, T3.name FROM lap_times AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Michael' AND T2.surname = 'Schumacher' ORDER BY T1.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId = ( SELECT driverId FROM drivers WHERE forename = 'Eddie' AND surname = 'Irvine' ) AND T2.year = 2000	formula_1
SELECT T.year, T1.points FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.year LIMIT 1	formula_1
SELECT T2.name, T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2017 ORDER BY T1.date	formula_1
SELECT T1.year, T1.name, T3.circuitRef, T3.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId GROUP BY T1.raceId, T1.year, T3.circuitRef, T3.name ORDER BY COUNT(T2.laps) DESC LIMIT 1	formula_1
SELECT CAST(COUNT(T1.circuitId) AS REAL) * 100 / COUNT(T1.circuitId) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Germany' AND T2.name = 'Emuron Grand Prix'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE lat = ( SELECT MAX(lat) FROM circuits )	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT T2.nationality FROM drivers AS T1 INNER JOIN races AS T3 ON T1.driverId = T3.driverId WHERE T1.dob = ( SELECT MIN(dob) FROM drivers )	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian'	formula_1
SELECT T2.url FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Anthony' AND T1.surname = 'Davidson'	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Hamilton'	formula_1
SELECT c.name FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.year = 2009 AND r.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT t3.year FROM races AS t1 INNER JOIN circuits AS t2 ON t1.circuitId = t2.circuitId INNER JOIN seasons AS t3 ON t1.year = t3.year WHERE t2.name = 'Silverstone'	formula_1
SELECT name, url FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name LIKE 'Silverstone Circuit')	formula_1
SELECT t1.time FROM races AS t1 INNER JOIN circuits AS t2 ON t1.circuitId = t2.circuitId WHERE t2.name = 'Abu Dhabi Circuit' AND t1.year = 2010	formula_1
SELECT COUNT(*) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy'	formula_1
SELECT T2.name ,  T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.circuitRef = 'barcelona'	formula_1
SELECT url FROM circuits WHERE nationality = 'Spain' AND circuitId IN ( SELECT circuitId FROM races WHERE year = 2009 AND url IS NOT NULL )	formula_1
SELECT fastestLapTime FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = ( SELECT MAX(fastestLapSpeed) FROM results )	formula_1
SELECT T2.driverRef FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.position = 1	formula_1
SELECT T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.driverRef = 'hamilton' AND T1.name LIKE 'Formula 1 %'	formula_1
SELECT r.name FROM races AS r INNER JOIN results AS res ON r.raceId = res.raceId INNER JOIN drivers AS d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name LIKE '2009 Spanish Grand Prix'	formula_1
SELECT DISTINCT YEAR FROM races WHERE POSITION LIKE '1' AND DRIVERID = ( SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' )	formula_1
SELECT T5.positionOrder FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId INNER JOIN positions AS T5 ON T2.positionOrder = T5.positionId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T4.name = 'Australian Grand Prix' AND T3.year = 2008	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId IN (SELECT T3.raceId FROM races AS T3 INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T4.name = 'Australian Grand Prix' AND T3.year = 2008) AND T1.grid = 4	formula_1
SELECT COUNT(T1.time) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time IS NOT NULL AND T2.year = 2008 AND T2.name = 'Australian Grand Prix';	formula_1
SELECT T3.time, T1.name FROM races AS T1  INNER JOIN results AS T2 ON T1.raceId = T2.raceId  INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId  WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' AND T1.year = 2008  ORDER BY T2.fastestLapTime DESC  LIMIT 1	formula_1
SELECT T1.time FROM lapTimes AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.position = 2 AND T1.driverId = ( SELECT T2.driverId FROM results AS T2 INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2008 AND T3.name = 'Australian Grand Prix' ORDER BY T2.position LIMIT 1 )	formula_1
SELECT T1.forename, T1.surname, T1.url FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T2.position = 1 AND T3.year = 2008	formula_1
SELECT COUNT(*) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.nationality = 'American' AND T3.name = 'Australian Grand Prix' AND T3.year = 2008	formula_1
SELECT COUNT(T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time IS NOT NULL AND T1.year = 2008	formula_1
SELECT SUM(T3.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN constructorStandings AS T3 ON T3.raceId = T1.raceId INNER JOIN constructors AS T4 ON T4.constructorId = T3.constructorId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT AVG(CAST(SUBSTR(fastestLapTime, 1, 2) AS INTEGER) * 60 + CAST(SUBSTR(fastestLapTime, 4, 2) AS INTEGER) + CAST(SUBSTR(fastestLapTime, 7) AS REAL) / 1000) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT CAST(SUM(CASE WHEN time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')	formula_1
SELECT (100 * (TIME(T1.time) - TIME(T2.time)) / TIME(T2.time)) AS Faster_Percent FROM results AS T1 INNER JOIN results AS T2 ON T2.raceId = T1.raceId WHERE T1.position = 1 AND T2.position = 2 AND T1.year = 2008	formula_1
SELECT COUNT(circuitId) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne'	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN races AS T2 ON T1.dob > '1980' WHERE T1.nationality = 'British'	formula_1
SELECT AVG(T2.points) FROM constructors AS T1 INNER JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'British'	formula_1
SELECT constructorId, name, SUM(points) as Total_Points FROM constructors, results WHERE constructorId = constructorId GROUP BY name ORDER BY Total_Points DESC LIMIT 1	formula_1
SELECT T2.name FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 291 AND T1.points = 0	formula_1
SELECT COUNT(*) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Japan' AND T2.points = 0 AND T2.raceId IN (SELECT raceId FROM races WHERE year = 2019)	formula_1
SELECT T1.constructorId, T1.constructorRef FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1	formula_1
SELECT COUNT(*) FROM constructors c INNER JOIN results r ON c.constructorId = r.constructorId WHERE c.nationality = 'French' AND r.laps > 50	formula_1
SELECT CAST(SUM(CASE WHEN time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year BETWEEN 2007 AND 2009)	formula_1
SELECT T1.year, AVG(T3.time) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.positionText = '1' AND T3.time IS NOT NULL GROUP BY T1.year	formula_1
SELECT T2.forename, T2.surname FROM driverStandings AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.position = 2 AND YEAR(T2.dob) > 1975	formula_1
SELECT COUNT(driverId) FROM results WHERE nationality = 'Italian' AND time IS NULL	formula_1
SELECT T3.forename ,  T3.surname FROM results AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId  =  T2.raceId INNER JOIN drivers AS T3 ON T2.driverId  =  T3.driverId ORDER BY T2.time LIMIT 1	formula_1
SELECT T2.fastestLap FROM results AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.year = 2009 AND T2.position = 1 AND T2.fastestLap IS NOT NULL ORDER BY T2.fastestLapTime DESC LIMIT 1	formula_1
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT name, year FROM races WHERE milliseconds IS NOT NULL ORDER BY milliseconds ASC LIMIT 1	formula_1
SELECT COUNT(T1.driverId) * 100.0 / COUNT(T2.driverId) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.dob < '1985' AND YEAR(T1.raceId) BETWEEN 2000 AND 2005 AND T1.laps > 50	formula_1
SELECT COUNT(T1.driverId) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'French' AND TIME_TO_SEC(T1.time) < 120	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 18	formula_1
SELECT T1.code FROM drivers AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.dob = ( SELECT max(dob) FROM drivers ) ORDER BY T1.dob LIMIT 3	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'	formula_1
SELECT COUNT(T3.nationality) FROM driverStandings AS T1 INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE year(T3.dob) = 1980 AND T3.nationality = 'Australian'	formula_1
SELECT t1.forename, t1.surname FROM drivers AS t1 INNER JOIN lap_times AS t2 ON t1.driverid = t2.driverid WHERE t2.time = ( SELECT min(time) FROM lap_times ) AND t1.nationality = 'German' AND strftime('%Y', t1.dob) BETWEEN '1980' AND '1990' ORDER BY t2.time LIMIT 3	formula_1
SELECT T.driverRef FROM ( SELECT driverId, min(YEAR(dob)) AS min_dob FROM drivers WHERE nationality = 'German' ) AS T JOIN drivers ON T.driverId = drivers.driverId ORDER BY T.min_dob LIMIT 1	formula_1
SELECT T4.driverId, T4.code FROM drivers AS T4 WHERE T4.dob LIKE '1971%' ORDER BY T4.driverId LIMIT 1	formula_1
SELECT T1.forename, T1.surname, T2.name FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Spain' AND YEAR(T1.dob) < 1982 ORDER BY T2.time DESC LIMIT 10	formula_1
SELECT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId ORDER BY T2.fastestLapTime LIMIT 1	formula_1
SELECT year FROM races WHERE time = ( SELECT time FROM races ORDER BY time LIMIT 1 )	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 GROUP BY driverId ORDER BY MIN(time) DESC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2	formula_1
SELECT COUNT(*), location, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY location	formula_1
SELECT COUNT(DISTINCT time) FROM results	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL	formula_1
SELECT DISTINCT T2.date, T2.time FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T1.dob LIMIT 1	formula_1
SELECT COUNT(*) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'American' AND T1.statusId = 2	formula_1
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'Italian' ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId ORDER BY T1.wins DESC LIMIT 1	formula_1
SELECT d.forename, d.surname, l.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId JOIN lap_times l ON r.raceId = l.raceId AND d.driverId = l.driverId WHERE c.name = 'Albert Park Grand Prix de France' AND l.lap = 3 ORDER BY l.time DESC LIMIT 1	formula_1
SELECT T1.name, T2.milliseconds FROM races AS T1 INNER JOIN lap_times AS T2 ON T1.raceId = T2.raceId ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.name = '2006 United States Grand Prix' AND T2.year = 2006 AND T3.nationality = 'United States' AND T1.rank < 11	formula_1
SELECT T1.forename, T1.surname, AVG(T3.duration) as average_duration FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.nationality = 'Germany' AND T1.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY T1.driverId ORDER BY average_duration ASC LIMIT 5	formula_1
SELECT DISTINCT T1.name, T2.time FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.nationality = 'Canadian' AND T3.year = 2008 ORDER BY T2.position ORDER BY T2.milliseconds LIMIT 1	formula_1
SELECT T2.constructorRef, T2.url FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T1.position = 1 AND T3.year = 2009	formula_1
SELECT T1.forname, T1.surname, T1.dob FROM drivers AS T1 WHERE T1.nationality = 'Austrian' AND YEAR(T1.dob) BETWEEN '1981' AND '1991'	formula_1
SELECT T3.forename, T3.surname, T3.nationality, T3.dob, T3.url FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.nationality = 'German' AND T3.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY T3.dob DESC	formula_1
SELECT location, country, lat, lng FROM circuits WHERE circuitRef = 'hungaroring'	formula_1
SELECT T1.name, T1.nationality, MAX(T2.points) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Monaco Grand Prix' AND T3.date BETWEEN '1980-01-01' AND '2010-12-31'	formula_1
SELECT AVG(T3.points) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN driver_standings AS T3 ON T2.resultId = T3.resultId WHERE T2.driverId = ( SELECT driverId FROM drivers WHERE name = 'Hamilton' )	formula_1
SELECT AVG(COUNT(*)) FROM races WHERE YEAR BETWEEN 2000 AND 2010	formula_1
SELECT T2.nationality FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId GROUP BY T2.nationality ORDER BY COUNT(T2.nationality) DESC LIMIT 1	formula_1
SELECT T1.wins FROM ( SELECT driverId, COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.rank = 91 AND T2.year = 2002 GROUP BY T1.driverId ) AS T1	formula_1
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.fastestLapSpeed = ( SELECT MIN(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId )	formula_1
SELECT T1.location, T1.country FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId ORDER BY T2.date DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T4.circuitRef = 'marina_bay_street' AND T3.year = 2008 AND T4.name = 'Marina Bay Street Circuit' AND T3.round = 3 ORDER BY T2.rank ASC LIMIT 1	formula_1
SELECT T2.forename, T2.surname, T2.nationality, T4.name FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId ORDER BY T2.dob LIMIT 1	formula_1
SELECT COUNT(*) FROM results WHERE statusid = 3 AND raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix')	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT MAX(T2.duration) FROM pitStops AS T1 INNER JOIN races AS T3 ON T1.raceId = T3.raceId ORDER BY T3.date	formula_1
SELECT min(T1.time) FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId	formula_1
SELECT MAX(T2.duration) FROM pitStops AS T1 INNER JOIN races AS T3 ON T1.raceId = T3.raceId INNER JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T4.forename = 'Lewis' AND T4.surname = 'Hamilton'	formula_1
SELECT lap FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix')	formula_1
SELECT T1.name, T2.time FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1	formula_1
SELECT MIN(T2.time) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.surname = 'Hamilton' AND T1.statusId = 1	formula_1
SELECT T3.forename, T3.surname FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.time = ( SELECT MIN(time) FROM results )	formula_1
SELECT T2.position FROM results AS T1 INNER JOIN driverStandings AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId = 1 ORDER BY T1.time ASC LIMIT 1	formula_1
SELECT T1.time FROM lapTimes AS T1 INNER JOIN races AS T2 ON T2.raceId = T1.raceId INNER JOIN circuits AS T3 ON T3.circuitId = T2.circuitId WHERE T3.name = 'Australian Grand Prix Circuit' ORDER BY T1.time ASC LIMIT 1	formula_1
SELECT T.time FROM lapTimes AS T INNER JOIN races AS R ON T.raceId = R.raceId INNER JOIN circuits AS C ON R.circuitId = C.circuitId WHERE C.country = 'Italy'	formula_1
SELECT T1.name FROM races AS T1 INNER JOIN lap_times AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T3.name = 'Austrian Grand Prix Circuit' ORDER BY T2.time ASC LIMIT 1	formula_1
SELECT T1.duration FROM pit_stops AS T1 INNER JOIN races AS T2 ON T1.race_id = T2.race_id INNER JOIN drivers AS T3 ON T1.driver_id = T3.driver_id INNER JOIN circuits AS T4 ON T2.circuit_id = T4.circuit_id WHERE T4.name = 'Austrian Grand Prix Circuit' AND T3.forename = 'Michael' AND T3.surname = 'Schumacher'	formula_1
SELECT T3.lat ,  T3.lng FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T1.fastestLap = 29 AND T1.fastestLapTime LIKE '1:29.488%'	formula_1
SELECT AVG(T1.milliseconds) FROM pitStops AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT AVG(T1.milliseconds) FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.country = 'Italy'	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT height, player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player_Attributes ORDER BY potential ASC LIMIT 1	european_football_2
SELECT COUNT(T2.player_fifa_api_id) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.defensive_work_rate = 'low' AND T1.overall_rating BETWEEN 60 AND 65	european_football_2
SELECT T1.player_id FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.crossing DESC LIMIT 5	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT home_team_api_id FROM Match WHERE season = '2016/2016' GROUP BY home_team_api_id ORDER BY SUM(CASE WHEN home_team_goal < away_team_goal THEN 1 ELSE 0 END) ASC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.penalties DESC LIMIT 10	european_football_2
SELECT T2.team_short_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id INNER JOIN League AS T3 ON T3.id = T1.league_id WHERE T1.season = '2009/2010' AND T3.name = 'Scotland Premier League' AND T1.away_team_goal > T1.home_team_goal ORDER BY (T1.away_team_goal - T1.home_team_goal) DESC LIMIT 1	european_football_2
SELECT buildUpPlaySpeed FROM Team_Attributes WHERE team_api_id IN (SELECT team_api_id FROM ( SELECT home_team_api_id AS team_api_id, AVG(buildUpPlaySpeed) AS avg_speed FROM Match WHERE home_team_api_id IN ( SELECT home_team_api_id FROM Match GROUP BY home_team_api_id ORDER BY COUNT(home_team_api_id) DESC LIMIT 4 ) GROUP BY home_team_api_id ) UNION SELECT team_api_id FROM ( SELECT away_team_api_id AS team_api_id, AVG(buildUpPlaySpeed) AS avg_speed FROM Match WHERE away_team_api_id IN ( SELECT away_team_api_id FROM Match GROUP BY away_team_api_id ORDER BY COUNT(away_team_api_id) DESC LIMIT 4 ) GROUP BY away_team_api_id )) ORDER BY avg_speed DESC	european_football_2
SELECT T4.name FROM Match AS T1 INNER JOIN League AS T4 ON T1.league_id = T4.id WHERE T1.season = '2015/2016' GROUP BY T4.name HAVING SUM(CASE WHEN T1.home_team_goal = T1.away_team_goal THEN 1 ELSE 0 END) = ( SELECT MAX(COUNT(CASE WHEN T2.home_team_goal = T2.away_team_goal THEN 1 ELSE 0 END)) FROM Match AS T2 WHERE T2.season = '2015/2016' GROUP BY T2.league_id )	european_football_2
SELECT T3.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id INNER JOIN Player AS T3 ON T2.player_fifa_api_id = T3.player_fifa_api_id WHERE T2.sprint_speed >= 97 AND T3.birthday <= DATE('now') AND T3.birthday >= DATE('now', '-5 years') AND T2.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'	european_football_2
SELECT T1.name ,  COUNT(T2.league_id) FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.name ORDER BY COUNT(T2.league_id) DESC LIMIT 1	european_football_2
SELECT AVG(T1.height) FROM Player AS T1 INNER JOIN Country AS T2 ON T1.birthday BETWEEN '1990-01-01' AND '1995-12-31'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE overall_rating > ( SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' ) AND substr(date, 1, 4) = '2010'	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing >= ( SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' ) AND strftime('%Y', date) = '2012'	european_football_2
SELECT CAST(SUM(CASE WHEN T1.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_fifa_api_id) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00'	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY SUM(T2.home_team_goal, T2.away_team_goal) ASC LIMIT 5	european_football_2
SELECT AVG(T3.long_shots) FROM Player AS T1 INNER JOIN Player_Attributes AS T3 ON T1.player_fifa_api_id = T3.player_fifa_api_id WHERE T1.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.height > 180 GROUP BY T2.player_fifa_api_id ORDER BY AVG(T2.heading_accuracy) DESC LIMIT 10	european_football_2
SELECT T.team_long_name FROM ( SELECT T1.team_api_id, AVG(T2.chanceCreationPassing) AS avg_chanceCreationPassing FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date >= '2014-01-01 00:00:00' AND T2.date <= '2014-01-31 00:00:00' GROUP BY T1.team_api_id ) AS T WHERE T.avg_chanceCreationPassing > ( SELECT AVG(T2.chanceCreationPassing) FROM Team_Attributes AS T2 WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date >= '2014-01-01 00:00:00' AND T2.date <= '2014-01-31 00:00:00' ) ORDER BY T.avg_chanceCreationPassing ASC	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2009/2010' AND T1.home_team_goal > T1.away_team_goal	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Match AS T2 ON T1.birthday = T2.birthday WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10'	european_football_2
SELECT T1.attacking_work_rate FROM Player_attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Franco Zennaro'	european_football_2
SELECT buildUpPlayPositioningClass FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' ORDER BY date LIMIT 2	european_football_2
SELECT AVG(T1.heading_accuracy) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.date = '2014-09-18 00:00:00' AND T2.player_name = 'Francois Affolter'	european_football_2
SELECT T3.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T3 ON T1.player_api_id = T3.player_api_id WHERE T3.date LIKE '2011%' AND T1.player_name = 'Gabriel Tamas'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Scotland Premier League' AND T1.season = '2015/2016'	european_football_2
SELECT preferred_foot FROM Player WHERE birthday = ( SELECT MAX(birthday) FROM Player )	european_football_2
SELECT player_name, potential FROM player ORDER BY potential DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM player_attributes WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT T4.team_short_name FROM Match AS T1 INNER JOIN Player_Attributes AS T2 ON T1.home_player_1 = T2.player_api_id INNER JOIN Player AS T3 ON T2.player_api_id = T3.player_api_id INNER JOIN Team_Attributes AS T4 ON T2.team_fifa_api_id = T4.team_fifa_api_id WHERE T2.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT DISTINCT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson'	european_football_2
SELECT T2.birthday FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT t1.name FROM LEAGUE AS t1 JOIN COUNTRY AS t2 ON t1.country_id = t2.id WHERE t2.name = 'Netherlands'	european_football_2
SELECT AVG(T1.home_team_goal) FROM `Match` AS T1 INNER JOIN Country AS T2 ON T2.id = T1.country_id WHERE T1.season = '2010/2011' AND T2.name = 'Poland'	european_football_2
SELECT P.player_name FROM Player AS P WHERE P.player_api_id IN (SELECT player_api_id FROM Player_Attributes ORDER BY finishing DESC LIMIT 1) AND P.height = (SELECT MIN(height) FROM Player)	european_football_2
SELECT player_name FROM Player WHERE height > 180	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT DISTINCT T3.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T3 ON T1.player_fifa_api_id = T3.player_fifa_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT potential FROM Player_Attributes WHERE player_name = "Aaron Doran"	european_football_2
SELECT player_name FROM Player WHERE preferred_foot = 'left'	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'CLB'	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > 70	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.height > 170 AND STRFTIME('%Y', T1.date) BETWEEN '2010' AND '2015'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.height LIMIT 1	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A'	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(DISTINCT T1.id) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND STRFTIME('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10'	european_football_2
SELECT T2.team_short_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.balance = ( SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61 )	european_football_2
SELECT AVG(T1.ball_control) - AVG(T2.ball_control) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Abdou Diallo' INNER JOIN Player AS T3 ON T1.player_api_id = T3.player_api_id WHERE T3.player_name = 'Aaron Appindangoye'	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday DESC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.height DESC LIMIT 1	european_football_2
SELECT COUNT(T2.player_api_id) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.preferred_foot = 'left' AND T1.attacking_work_rate = 'low'	european_football_2
SELECT t1.name FROM country AS t1 INNER JOIN league AS t2 ON t1.id = t2.country_id WHERE t2.name = 'Belgium Jupiler League'	european_football_2
SELECT name FROM LEAGUE WHERE country_id IN (SELECT id FROM COUNTRY WHERE name = 'Germany')	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id OR T1.player_api_id = T2.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT COUNT(T2.player_id) FROM Country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.country_id WHERE STRFTIME('%Y', T2.birthday) < '1986' AND T2.player_api_id IN ( SELECT T3.player_api_id FROM Team_Attributes AS T3 INNER JOIN Match AS T4 ON T3.team_api_id = T4.home_team_api_id WHERE T4.stage = 1 AND T4.home_player_positioning = 'high' UNION SELECT T5.player_api_id FROM Team_Attributes AS T5 INNER JOIN Match AS T6 ON T5.team_api_id = T6.away_team_api_id WHERE T6.stage = 1 AND T6.away_player_positioning = 'high' )	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND T1.player_name IN ('Alexis Sánchez', 'Ariel Borysiuk', 'Arouna Kone')	european_football_2
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(T2.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T1.height > 180	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id WHERE T1.volleys > 70 AND T1.dribbling > 70	european_football_2
SELECT COUNT(*) FROM match AS T1 INNER JOIN country AS T2 ON T1.country_id = T2.id WHERE T1.season = '2008/2009' AND T2.name = 'Belgium'	european_football_2
SELECT T1.long_passing FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id ORDER BY T2.birthday ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Match INNER JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04'	european_football_2
SELECT league_id FROM Match WHERE season = '2008/2009' ORDER BY COUNT(id) DESC LIMIT 1	european_football_2
SELECT CAST(SUM(T2.overall_rating) AS REAL) / COUNT(T2.id) AS avg_overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'	european_football_2
SELECT CAST(T1.overall_rating - T2.overall_rating AS REAL) * 100 / T2.overall_rating AS percentage  FROM Player_Attributes AS T1  JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id  WHERE T1.player_name = 'Ariel Borysiuk' AND T2.player_name = 'Paulin Puel'	european_football_2
SELECT AVG(T1.buildUpPlaySpeed) FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT T1.total_crossing FROM ( SELECT home_player_1 AS player, SUM(T3.crossing) AS total_crossing FROM Match AS T1 JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id JOIN Player_Attributes AS T3 ON T2.player_api_id = T3.player_api_id WHERE T2.player_name = 'Aaron Lennox' GROUP BY T1.home_player_1 UNION SELECT home_player_2, SUM(crossing) FROM Match AS T1 JOIN Player AS T2 ON T1.home_player_2 = T2.player_api_id JOIN Player_Attributes AS T3 ON T2.player_api_id = T3.player_api_id WHERE T2.player_name = 'Aaron Lennox' GROUP BY T1.home_player_2 UNION SELECT home_player_3, SUM(crossing) FROM Match AS T1 JOIN Player AS T2 ON T1.home_player_3 = T2.player_api_id JOIN Player_Attributes AS T3 ON T2.player_api_id = T3.player_api_id WHERE T2.player_name = 'Aaron Lennox' GROUP BY T1.home_player_3 UNION SELECT home_player_4, SUM(crossing) FROM Match AS T1 JOIN Player AS T2 ON T1.home_player_4 = T2.player_api_id JOIN Player_Attributes AS T3 ON T2.player_api_id = T3.player_api_id WHERE T2.player_name = 'Aaron Lennox' GROUP BY T1.home_player_4 UNION SELECT home_player_5, SUM(crossing) FROM Match AS T1 JOIN Player AS T2 ON T1.home_player_5 = T2.player_api_id JOIN Player_Attributes AS T3 ON T2.player_api_id = T3.player_api_id WHERE T2.player_name = 'Aaron Lennox' GROUP BY T1.home_player_5 UNION SELECT home_player_6, SUM(crossing) FROM Match AS T1 JOIN Player AS T2 ON T1.	european_football_2
SELECT T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax' ORDER BY T2.chanceCreationPassing DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Abdou Diallo')	european_football_2
SELECT T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T2.player_id = T1.player_id WHERE T2.player_name = 'Dorlan Pabon' ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT AVG(away_team_goal) FROM Match WHERE away_team_api_id IN (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma') AND country_id IN (SELECT id FROM Country WHERE name = 'Italy')	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T1.birthday = ( SELECT MIN(birthday) FROM Player WHERE birthday LIKE '2016-06-23%' )	european_football_2
SELECT T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Mooy' AND T1.date = '2016-02-04 00:00:00'	european_football_2
SELECT T1.potential FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.date = '2010-08-30' AND T2.player_name = 'Francesco Parravicini'	european_football_2
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Migliore' AND T1.date = '2015-05-01 00:00:00'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'	european_football_2
SELECT T2.date FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Constant' AND T2.crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) ORDER BY T2.date ASC LIMIT 1	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Willem II' AND T1.date = '2012-02-22 00:00:00'	european_football_2
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Match AS T1 INNER JOIN Team_Attributes AS T2 ON T1.home_team_api_id = T2.team_api_id INNER JOIN Team AS T3 ON T3.team_api_id = T1.home_team_api_id WHERE T3.team_long_name = 'FC Lorient' AND T1.date = '2010-02-22';	european_football_2
SELECT T1.chanceCreationPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date = '2013-09-20 00:00:00'	european_football_2
SELECT T2.chance_creation_crossing_class FROM Match AS T1 INNER JOIN Team_Attributes AS T2 ON T1.home_team_api_id = T2.team_api_id INNER JOIN Team AS T3 ON T1.home_team_api_id = T3.team_api_id WHERE T2.date = '2010-02-22 00:00:00' AND T3.team_long_name = 'Hull City'	european_football_2
SELECT T2.defence_aggression_class FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date = '2015-09-10'	european_football_2
SELECT AVG(T3.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T3 ON T1.player_api_id = T3.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND T3.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'	european_football_2
SELECT      CASE          WHEN T1.overall_rating > T2.overall_rating THEN CAST(100 AS REAL) - CAST(T1.overall_rating AS REAL) * 100 / CAST(T2.overall_rating AS REAL)         ELSE CAST(T2.overall_rating AS REAL) * 100 / CAST(T1.overall_rating AS REAL) - 100     END  FROM      Player_Attributes AS T1 JOIN      Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE      T1.player_name = 'Landon Donovan'     AND T2.player_name = 'Jordan Bowery'     AND T1.date = '2013/7/12'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM player WHERE datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) > 34	european_football_2
SELECT SUM(T2.home_team_goal) FROM Player AS T1 INNER JOIN Match AS T2 ON T2.home_player_1 = T1.player_api_id OR T2.home_player_2 = T1.player_api_id OR T2.home_player_3 = T1.player_api_id OR T2.home_player_4 = T1.player_api_id OR T2.home_player_5 = T1.player_api_id OR T2.home_player_6 = T1.player_api_id OR T2.home_player_7 = T1.player_api_id OR T2.home_player_8 = T1.player_api_id OR T2.home_player_9 = T1.player_api_id OR T2.home_player_10 = T1.player_api_id OR T2.home_player_11 = T1.player_api_id WHERE T1.player_name = 'Aaron Lennon'	european_football_2
SELECT SUM(T1.away_team_goal) FROM Match AS T1 INNER JOIN Player AS T2 ON T1.away_player_1 = T2.player_api_id OR T1.away_player_2 = T2.player_api_id OR T1.away_player_3 = T2.player_api_id OR T1.away_player_4 = T2.player_api_id OR T1.away_player_5 = T2.player_api_id OR T1.away_player_6 = T2.player_api_id OR T1.away_player_7 = T2.player_api_id OR T1.away_player_8 = T2.player_api_id OR T1.away_player_9 = T2.player_api_id OR T1.away_player_10 = T2.player_api_id OR T1.away_player_11 = T2.player_api_id WHERE T2.player_name = 'Daan Smith' OR T2.player_name = 'Filipe Ferreira'	european_football_2
SELECT COUNT(T1.home_team_goal) FROM `Match` AS T1 INNER JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id WHERE datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(T2.birthday) < 31	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 10	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id ORDER BY T1.potential DESC LIMIT 1	european_football_2
SELECT DISTINCT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'high'	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id WHERE T1.finishing = 1 ORDER BY strftime('%s', datetime(CURRENT_TIMESTAMP, 'localtime')) - strftime('%s', T2.birthday) DESC LIMIT 1	european_football_2
SELECT T2.player_name FROM Country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Belgium'	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.country_id INNER JOIN Player_Attributes AS T3 ON T2.player_api_id = T3.player_api_id WHERE T3.vision > 89	european_football_2
SELECT T2.name FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_fifa_api_id = T2.id GROUP BY T2.name ORDER BY AVG(T1.weight) DESC LIMIT 1	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T2.height) FROM COUNT country AS T1 INNER JOIN player AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Italy'	european_football_2
SELECT DISTINCT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.height > 180 ORDER BY T1.player_name ASC LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT SUM(T1.jumping) - SUM(T2.jumping) FROM Player AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.id IN (6, 23)	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = ( SELECT MAX(crossing) FROM Player_Attributes )	european_football_2
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM Player) AS percentage FROM Player WHERE strength > 80 AND stamina > 80	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id INNER JOIN Match AS T3 ON T2.id = T3.league_id WHERE T3.home_team_api_id IN (SELECT player_api_id FROM Player WHERE player_name = "Poland Ekstraklasa")	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%'	european_football_2
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` WHERE `player_name` = 'Alexis Blin'	european_football_2
SELECT CASE      WHEN T2.buildUpPlaySpeedClass = 'Slow' THEN 'Slow, Balanced, Fast'      WHEN T2.buildUpPlaySpeedClass = 'Balanced' THEN 'Slow, Balanced, Fast'      WHEN T2.buildUpPlaySpeedClass = 'Fast' THEN 'Slow, Balanced, Fast'      ELSE 'Unknown'  END  FROM Team AS T1  INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id  WHERE T1.team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italian Serie A')	european_football_2
SELECT MAX(T3.home_team_goal) FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id INNER JOIN Match AS T3 ON T1.id = T3.league_id WHERE T2.name = 'Netherlands' AND T1.name = 'Eredivisie'	european_football_2
SELECT T2.finishing, T2.curve FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.weight DESC LIMIT 1	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id GROUP BY T2.away_team_api_id ORDER BY SUM(T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT player_name FROM Player ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT CAST(COUNT(CASE WHEN T1.height < 180 AND T2.overall_rating > 70 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.height) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT CASE WHEN COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) > COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END) THEN 'In-patient' ELSE 'Out-patient' END AS patient_type, (100 * ABS(COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) - COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) / GREATEST(COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END), COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END))) AS deviation FROM Patient	thrombosis_prediction
SELECT CAST(COUNT(ID) AS FLOAT) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) > '1930'	thrombosis_prediction
SELECT CAST(COUNT(T1.ID) AS REAL) * 100 / COUNT(T2.ID) AS p FROM Patient AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.`First Date` BETWEEN '1930-01-01' AND '1940-12-31' AND T1.Admission = '+'	thrombosis_prediction
SELECT CAST(COUNT(IIF(T2.Admission = '+', 1, NULL)) AS REAL) / COUNT(IIF(T2.Admission = '-', 1, NULL)) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE'	thrombosis_prediction
SELECT T2.Diagnosis, T1.Date FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = '30609'	thrombosis_prediction
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '163109'	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH > '500'	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday, (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday)) AS age  FROM Patient AS T1  INNER JOIN Examination AS T2  ON T1.ID = T2.ID  WHERE T2.RVVT = '+';	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(P.Birthday) = '1937' AND L.`T-CHO` >= 250	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALB < 3.5	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T2.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN T2.ID END) AS REAL) * 100 / COUNT(T2.ID) AS percentage FROM Patient AS T2 INNER JOIN Laboratory AS T1 ON T2.ID = T1.ID	thrombosis_prediction
SELECT AVG(`aCL IgG`) FROM Patient WHERE Admission = '+' AND SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(Birthday)) >= 50	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-';	thrombosis_prediction
SELECT MIN(T2.`First Date`) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 1 AND T1.SEX = 'F' AND T2.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT SUBTRACT(MAX(YEAR(Birthday)) - MIN(YEAR(Birthday))) AS age_gap FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG >= 200)	thrombosis_prediction
SELECT Symptoms, Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Birthday = ( SELECT MIN(BIRTHDAY) FROM Patient )	thrombosis_prediction
SELECT CAST(COUNT(T1.ID) AS REAL) / 12 FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT T2.Date, T1.age  FROM (      SELECT YEAR(T1.Birthday) AS age      FROM Patient AS T1      WHERE T1.diagnosis = 'SJS'      ORDER BY T1.`First Date` DESC      LIMIT 1  ) AS T1  INNER JOIN Laboratory AS T2  ON T2.ID = T1.ID;	thrombosis_prediction
SELECT SUM(CASE WHEN SEX = 'M' AND UA <= 8 THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN SEX = 'F' AND UA <= 6.5 THEN 1 ELSE 0 END)	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS patient_count  FROM Patient  WHERE NOT EXISTS (     SELECT 1      FROM Examination      WHERE Examination.ID = Patient.ID      AND SUBTRACT(YEAR(Examination.`Examination Date`), YEAR(Patient.`First Date`)) < 1 )	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday BETWEEN '1990-01-01' AND '1993-12-31' AND YEAR(T2.Birthday) < 18	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-BIL` > 2	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY T1.Diagnosis ORDER BY COUNT(T1.Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(TIMESTAMPDIFF(YEAR, Patient.Birthday, Examination.`Examination Date`)) AS average_age FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE MONTH(`Examination Date`) = 10 AND YEAR(`Examination Date`) = 1991	thrombosis_prediction
SELECT T2.Description FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T1.HGB DESC LIMIT 1	thrombosis_prediction
SELECT `aCL IgA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.ID = 2927464 AND T2.`Examination Date` = '1995-09-04' AND T3.`T-CHO` < 250	thrombosis_prediction
SELECT T2.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'AORTITIS' ORDER BY T2.`First Date` LIMIT 1	thrombosis_prediction
SELECT t1.`aCL IgM` FROM Examination AS t1 INNER JOIN Patient AS t2 ON t1.ID = t2.ID WHERE t2.Description = '1994-02-19' AND t2.Diagnosis = 'SLE' INTERSECT SELECT t3.`aCL IgM` FROM Laboratory AS t3 INNER JOIN Patient AS t4 ON t3.ID = t4.ID WHERE t4.Description = '1993-11-12' AND t4.Diagnosis = 'SLE'	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT = '9' AND T2.Date = '1992-06-12'	thrombosis_prediction
SELECT T2.Birthday, YEAR(T2.Birthday) - 1992 FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1991-10-21' AND T1.UA = '8.4'	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T2.`First Date` = '1991-06-13' AND T2.Diagnosis = 'SJS' AND T3.Date BETWEEN '1995-01-01' AND '1995-12-31'	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` = '1997-01-27' AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT t1.symptoms FROM examination AS t1 INNER JOIN patient AS t2 ON t1.ID = t2.ID WHERE t2.birthday = '1959-03-01' AND t1.`Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT 100.0 * (SUM(`T-CHO` WHERE Date LIKE '1981-11-%') - SUM(`T-CHO` WHERE Date LIKE '1981-12-%')) / SUM(`T-CHO` WHERE Date LIKE '1981-11-%') FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-02-18';	thrombosis_prediction
SELECT ID FROM Patient WHERE Diagnosis LIKE '%Behcet%' AND YEAR(Description) >= 1997 AND YEAR(Description) < 1998	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T2.ALB < 4 AND T2.GPT > 30 ORDER BY T1.ID	thrombosis_prediction
SELECT T1.ID, T1.Birthday, T1.Admission FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND YEAR(T1.Birthday) = 1964 AND T1.Admission = '+'	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgM` > (SELECT AVG(`aCL IgM`) FROM Examination) AND T2.ANA = 'S' AND T2.Thrombosis = 2	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN UA <= 6.5 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN p.SEX = 'M' AND YEAR(e.`First Date`) = '1981' AND e.Diagnosis = 'BEHCET' THEN 1 ELSE NULL END) AS FLOAT) / COUNT(CASE WHEN p.SEX = 'M' AND YEAR(e.`First Date`) = '1981' THEN 1 ELSE NULL END) * 100 FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID;	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p  WHERE p.Admission = '-'    AND YEAR(l.Date) = 1991    AND MONTH(l.Date) = 10    AND l.`T-BIL` < 2.0	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T1.Birthday BETWEEN '1980-01-01' AND '1989-12-31' AND T2.`ANA Pattern` <> 'p'	thrombosis_prediction
SELECT SEX FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis LIKE '%PSS%') AND ID IN (SELECT ID FROM Laboratory WHERE CRP > 2 AND CRE = 1 AND LDH = 123)	thrombosis_prediction
SELECT AVG(T1.ALB) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T1.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T2.Symptoms) AS cnt, T2.Symptoms  FROM Patient AS T1  INNER JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T1.Diagnosis = 'SLE'  GROUP BY T2.Symptoms  ORDER BY cnt DESC  LIMIT 1	thrombosis_prediction
SELECT T1.Description, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '48473' ORDER BY T1.Description LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE YEAR(T2.Date) = 1997 AND T2.TP NOT BETWEEN 6 AND 8.5	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T1.Symptoms LIKE '%ITP%' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.Diagnosis) AS result FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) = 1980 AND Diagnosis = 'RA' AND SEX = 'F') FROM Patient WHERE YEAR(Birthday) = 1980 AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND T2.Diagnosis = 'BEHCET' AND T1.Admission = '-'	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM Examination WHERE ID = 821298 LIMIT 1	thrombosis_prediction
SELECT CASE WHEN UA > 8.0 AND SEX = 'M' THEN 'Normal' ELSE 'Not Normal' END AS 'Uric Acid Range' FROM Patient WHERE ID = 57266	thrombosis_prediction
SELECT `Date` FROM Laboratory WHERE ID = 48473 AND GOT >= 60	thrombosis_prediction
SELECT T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE YEAR(T2.Date) = 1994 AND T2.GOT < 60	thrombosis_prediction
SELECT P.ID FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.Birthday ASC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT p.ID, DATEDIFF(CURRENT_DATE, p.Birthday) AS age  FROM Patient p  JOIN Laboratory l  ON p.ID = l.ID  WHERE l.LDH BETWEEN 600 AND 800	thrombosis_prediction
SELECT T1.admission FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.id = T2.ID WHERE T2.ALP < 300	thrombosis_prediction
SELECT T2.ID, (CASE WHEN T1.ALP < 300 THEN 'Yes' ELSE 'No' END) AS NormalRange FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1982-04-01';	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6	thrombosis_prediction
SELECT T2.TP - 8.5 FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.TP > 8.5	thrombosis_prediction
SELECT *  FROM Patient  WHERE SEX = 'M'  AND NOT (ALB >= 3.5 AND ALB <= 5.5)  ORDER BY Birthday DESC;	thrombosis_prediction
SELECT ID FROM Patient WHERE YEAR(Birthday) = '1982' AND ALB BETWEEN 3.5 AND 5.5	thrombosis_prediction
SELECT AVG(CASE WHEN UA > 6.5 AND SEX = 'F' THEN 1 ELSE 0 END) * 100.0 AS percentage FROM Patient	thrombosis_prediction
SELECT AVG(`T-CHO`) FROM Laboratory WHERE `T-CHO` IS NOT NULL AND `T-CHO` < 450	thrombosis_prediction
SELECT `SEX`, `Birthday`, `ID` FROM Patient WHERE UA = 29	thrombosis_prediction
SELECT DISTINCT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'RA' AND T2.UN < 30	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CRE >= 1.5	thrombosis_prediction
SELECT ( SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN ( SELECT ID FROM Laboratory WHERE CRE >= 1.5 ) ) > ( SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND ID IN ( SELECT ID FROM Laboratory WHERE CRE >= 1.5 ) );	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID ORDER BY L.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT T1.SEX, SUM(T2.`T-BIL`) AS TOTAL_BILIRUBIN FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` >= 2.0 GROUP BY T1.SEX	thrombosis_prediction
SELECT ID, `T-CHO` FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday = ( SELECT MIN(Birthday) FROM Patient ) GROUP BY Patient.ID, `T-CHO` ORDER BY `T-CHO` DESC LIMIT 1	thrombosis_prediction
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(T2.Birthday)) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-CHO` >= 250	thrombosis_prediction
SELECT T2.ID, T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG > 300	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday < DATE_SUB(CURDATE(), INTERVAL 50 YEAR) AND T2.TG >= 200	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.`CPK` < 250	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND YEAR(T1.Birthday) BETWEEN 1936 AND 1956 AND T2.CPK >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, TIMESTAMPDIFF(YEAR, P.Birthday, NOW()) AS age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250	thrombosis_prediction
SELECT T1.ID ,  T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.`First Date`) >= 1991 AND T2.GLU < 180	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.WBC < = 3.5 OR L.WBC > = 9.0 ORDER BY P.Birthday ASC, P.SEX	thrombosis_prediction
SELECT T2.ID, TIMESTAMPDIFF(YEAR, T2.Birthday, NOW()) AS age FROM Patient AS T2 INNER JOIN ( SELECT ID FROM Laboratory WHERE RBC < 3.5 ) AS T1 ON T2.ID = T1.ID	thrombosis_prediction
SELECT T1.Admission FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5 OR T2.RBC > 6.0 AND T1.SEX = 'F' AND SUBTRACT(year(current_timestamp), year(T1.Birthday)) >= 50	thrombosis_prediction
SELECT T2.SEX, T2.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '-' AND T1.HGB < 10	thrombosis_prediction
SELECT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT DISTINCT T2.ID, DATEDIFF(YEAR, T2.Birthday, GETDATE()) AS age FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.HCT > 52	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29	thrombosis_prediction
SELECT SUM(IIF(PLT < 100, 1, 0)) - SUM(IIF(PLT > 400, 1, 0)) AS diff FROM Laboratory	thrombosis_prediction
SELECT T2.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE YEAR(T1.`Examination Date`) = 1984 AND YEAR(T2.Birthday) + 50 > YEAR(CURRENT_TIMESTAMP) AND T3.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.PT >= 14 AND T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 55 YEAR)	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.`First Date`) > 1992 AND T2.PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.`First Date` IS NOT NULL AND T1.APTT > 45 AND T1.Thrombosis = 3 AND NOT EXISTS (SELECT T1.ID FROM Examination AS T1 WHERE T1.ID = T2.ID AND T1.Thrombosis = 3);	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG < 150 OR T2.FG > 450)	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND T2.FG BETWEEN 150 AND 450	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T3.`U-PRO` >= 30	thrombosis_prediction
SELECT P.ID FROM Patient AS P WHERE P.Diagnosis = 'SLE' AND EXISTS (SELECT 1 FROM Laboratory AS L WHERE L.ID = P.ID AND L.`U-PRO` BETWEEN 0 AND 30)	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgG` < 900 AND T2.Symptoms = 'abortion'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgG` BETWEEN 900 AND 2000 AND T2.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`IGA` BETWEEN 80 AND 500 ORDER BY T2.`IGA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T2.ID) AS `Number of Patients` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` >= '1990-01-01' AND T2.`aCL IgA` BETWEEN 80 AND 500	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `aCL IgM` NOT BETWEEN 40 AND 400 GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID NOT IN (SELECT DISTINCT ID FROM Laboratory WHERE CRP LIKE '+' OR CRP LIKE '-' OR CRP < 1.0) AND Description IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE (T1.CRP NOT IN ('+-', '-') AND CAST(REPLACE(REPLACE(T1.CRP, ',', ''), '.', '') AS FLOAT) >= 1) AND (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM T2.Birthday)) < 18	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` > '1995-01-01' AND T2.RA = '-'	thrombosis_prediction
SELECT t1.ID FROM Patient AS t1 INNER JOIN Laboratory AS t2 ON t1.ID = t2.ID WHERE t1.Birthday IS NOT NULL AND t2.RF < 20 AND DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), t1.Birthday)), '%Y') + INTERVAL 0 YEAR > 60	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`RF` < 20 AND T1.Thrombosis = '0'	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` = 'P' AND T1.ID IN ( SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.C3 > 35 )	thrombosis_prediction
SELECT ID FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE `aCL IgA` BETWEEN 29 AND 52) ORDER BY `aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T3.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Admission = 'APS' AND T3.C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RNP = '0' AND T1.Admission = '+'	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Male' AND T2.SM = 'positive' AND T1.Birthday > DATE_SUB(CURRENT_DATE, INTERVAL 30 YEAR) AND T2.Thrombosis = 1	thrombosis_prediction
SELECT T2.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 3	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` >= '1997-01-01' AND T1.SC170 IN('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Symptoms = 'vertigo' AND T2.SC170 = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` < '1990-01-01' AND T2.`SSA` IN ('-', '+-')	thrombosis_prediction
SELECT `Patient`.ID FROM `Patient` INNER JOIN `Examination` ON `Patient`.ID = `Examination`.ID WHERE `Examination`.`SSA` NOT IN ( '-', '+-' ) ORDER BY `Patient`.`First Date` ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('-', '+-') AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.SSB IN ('-', '+-') AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND `CENTROMEA` IN ('-', '+-') AND SSB IN ('-', '+-')	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.DNA >= 8	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8 AND T2.`Description` IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE `DNA-II` >= 8) AND Admission = '+';	thrombosis_prediction
SELECT CAST(SUM(IIF(Diagnosis = 'SLE' AND GOT >= 60, 1, 0)) AS REAL) * 100 / COUNT(ID) AS Percentage FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60)	thrombosis_prediction
SELECT T1.Birthday, T3.GPT FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.GPT < 60 ORDER BY T1.Birthday DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(Patient.SEX) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M'	thrombosis_prediction
SELECT MIN(`First Date`) FROM Patient WHERE ID = (SELECT ID FROM Patient WHERE LDH < 500 ORDER BY LDH DESC LIMIT 1)	thrombosis_prediction
SELECT MAX(`First Date`) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE LDH >= 500);	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ALP >= 300 AND T1.Admission = '+'	thrombosis_prediction
SELECT COUNT(T.ID) FROM ( SELECT P.ID FROM Patient AS P INNER JOIN Examination AS E ON P.ID = E.ID WHERE P.Admission = '-' GROUP BY P.ID HAVING AVG(E.ALP) < 300 ) AS T	thrombosis_prediction
SELECT T1.diagnosis FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE Diagnosis = 'SJS' AND TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT `Examination Date` FROM Examination WHERE `aCL IgA` = ( SELECT MAX(`aCL IgA`) FROM Examination WHERE `aCL IgA` BETWEEN 3.5 AND 5.5 )	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.ALB > 3.5 AND T2.ALB < 5.5 AND T2.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT aCL_IgG, aCL_IgM, aCL_IgA FROM Examination WHERE Sex = 'F' AND UA > 6.50 ORDER BY UA DESC LIMIT 1	thrombosis_prediction
SELECT MAX(T1.ANA) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5	thrombosis_prediction
SELECT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 ORDER BY T1.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN ( SELECT ID FROM Patient WHERE ID IN ( SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` >= 2.0 ) INTERSECT SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` LIKE '%P%' )	thrombosis_prediction
SELECT T1.ANA FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(Patient.ID) AS total FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.`T-CHO` >= 250 AND Laboratory.KCT = '-'	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.`T-CHO` < 250 AND T2.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description < '2000-01-01' AND T2.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T2.TG DESC LIMIT 1	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Thrombosis = 0 AND T3.CPK < 250	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX IS NOT NULL AND T1.Birthday IS NOT NULL AND T1.Description IS NOT NULL AND T1.`First Date` IS NOT NULL AND T1.Admission IS NOT NULL AND T1.Diagnosis IS NOT NULL AND T2.`Examination Date` IS NOT NULL AND T2.`aCL IgG` IS NOT NULL AND T2.`aCL IgM` IS NOT NULL AND T2.ANA IS NOT NULL AND T2.`ANA Pattern` IS NOT NULL AND T2.`aCL IgA` IS NOT NULL AND T2.Diagnosis IS NOT NULL AND T2.KCT IS NOT NULL AND T2.RVVT IS NOT NULL AND T2.LAC IS NOT NULL AND T2.Symptoms IS NOT NULL AND T2.Thrombosis IS NOT NULL AND T2.CRE >= 250	thrombosis_prediction
SELECT T2.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU > 180 ORDER BY T2.GLU DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T3.ID = T2.ID WHERE T2.GLU < 180 AND T2.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.RBC >= 6.0 OR T3.RBC <= 3.5 AND T2.`Examination Date` > T1.Description AND T1.Admission = '-'	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE (PLT > 100 AND PLT < 400) AND (Diagnosis IS NOT NULL);	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PLT > 100 AND T2.PLT < 400 AND T1.Diagnosis = 'MCTD'	thrombosis_prediction
SELECT AVG(T1.PT) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.PT < 14	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Thrombosis IN (1, 2) AND T3.PT < 14	thrombosis_prediction
SELECT major_name FROM major WHERE major_id = ( SELECT link_to_major FROM member WHERE first_name = 'Angela' AND last_name = 'Sanders' )	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE college = 'College of Engineering')	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art & Design' AND T1.member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event IN (SELECT event_id FROM event WHERE type = 'Student_Club'))	student_club
SELECT COUNT(a.link_to_member) FROM attendance AS a JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women's Soccer'	student_club
SELECT T.phone FROM member AS T INNER JOIN attendance AS T1 ON T.member_id = T1.link_to_member INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer' AND T.position = 'Student Club'	student_club
SELECT COUNT(T1.t_shirt_size) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women's Soccer' AND T1.t_shirt_size = 'Medium'	student_club
SELECT e.event_name, COUNT(a.link_to_member) AS attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Student_Club') GROUP BY e.event_name ORDER BY attendance DESC LIMIT 1	student_club
SELECT DISTINCT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President' AND T2.department = 'Student_Club'	student_club
SELECT DISTINCT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean'	student_club
SELECT COUNT(T1.link_to_event) FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_date LIKE '2019%' AND T3.type = 'Student_Club' AND T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT COUNT(event_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' GROUP BY event_id HAVING COUNT(member_id) > 10	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T2.link_to_event = T1.event_id AND T1.type = 'Student_Club' GROUP BY T2.link_to_event HAVING COUNT(T2.link_to_member) > 20	student_club
SELECT AVG(1.0 * COUNT(event_id) / COUNT(DISTINCT event_name)) FROM event WHERE type = 'Meeting' AND YEAR(CAST(event_date AS DATE)) = 2020	student_club
SELECT MAX(expense_description) FROM expense	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering' AND T1.position = 'Student_Club'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'	student_club
SELECT T3.last_name FROM major AS T1 INNER JOIN member AS T3 ON T1.major_id = T3.link_to_major WHERE T1.major_name = 'Law and Constitutional Studies'	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey'	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'	student_club
SELECT T2.amount FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'	student_club
SELECT T1.spent FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.event_name = 'September Meeting'	student_club
SELECT T1.city, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.position = 'President of the Student Club'	student_club
SELECT T2.first_name, T2.last_name FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T1.state = 'Illinois'	student_club
SELECT SUM(T2.spent) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_date LIKE 'September %' AND T1.expense_description = 'Advertisement'	student_club
SELECT T2.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major INNER JOIN event AS T3 ON T3.event_id = T1.major_id INNER JOIN major AS T4 ON T3.notes = T4.major_id WHERE T2.first_name = 'Pierce' AND T2.last_name = 'Guidi' AND T4.major_name = 'CIS'	student_club
SELECT SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'October Speaker'	student_club
SELECT T1.expense_id, T1.expense_date, T1.cost, T1.approved FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.expense_date = '2019-10-08' AND T2.event_name = 'October Meeting'	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member IN ( SELECT member_id FROM member WHERE first_name = 'Elijah' AND last_name = 'Allen' ) AND MONTH(expense_date) = 9 OR MONTH(expense_date) = 10	student_club
SELECT SUM(IIF(YEAR(event_date) = 2019, spent, 0)) - SUM(IIF(YEAR(event_date) = 2020, spent, 0)) FROM budget WHERE category = 'Student_Club'	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT T2.cost FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_date = '2019-09-04' AND T2.expense_description = 'Poster'	student_club
SELECT T2.remaining FROM budget AS T1 INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T1.category = 'Food' ORDER BY T1.amount DESC LIMIT 1	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'	student_club
SELECT count(major_id) FROM major WHERE department = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'	student_club
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0	student_club
SELECT SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker';	student_club
SELECT T2.event_status FROM expense AS T1 INNER JOIN budget AS T3 ON T1.link_to_budget = T3.budget_id INNER JOIN event AS T2 ON T3.link_to_event = T2.event_id WHERE T1.expense_description = 'Post Cards, Posters' AND T1.expense_date = '2019-08-20'	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Brent' AND T2.last_name = 'Thomason'	student_club
SELECT COUNT(first_name) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Human Development and Family Studies') AND t_shirt_size = 'Large'	student_club
SELECT T2.type FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President of the club'	student_club
SELECT T1.short_state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT DISTINCT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'President'	student_club
SELECT T2.received_date FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'	student_club
SELECT T2.first_name, T2.last_name FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.source = 'Dues' ORDER BY T1.date_received LIMIT 1	student_club
SELECT COUNT(*) FROM budget WHERE category = 'Advertisement' AND event_name = 'Yearly Kickoff' AND amount > (SELECT amount FROM budget WHERE category = 'Advertisement' AND event_name = 'October Meeting')	student_club
SELECT CAST(SUM(CASE WHEN category = 'Parking' THEN amount ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Speaker'	student_club
SELECT SUM(T2.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Pizza'	student_club
SELECT COUNT(*) FROM zip_code WHERE county = 'Orange' AND state = 'Virginia'	student_club
SELECT DISTINCT T2.department FROM major AS T1 INNER JOIN event AS T2 ON T1.major_id = T2.location WHERE T2.college = 'College of Humanities and Social Sciences'	student_club
SELECT T1.city, T1.county, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Amy' AND T2.last_name = 'Firth';	student_club
SELECT T3.expense_description FROM budget AS T1 INNER JOIN expense AS T3 ON T1.budget_id = T3.link_to_budget ORDER BY T1.remaining LIMIT 1	student_club
SELECT T2.first_name, T2.last_name FROM event AS T1 INNER JOIN attendance AS T3 ON T1.event_id = T3.link_to_event INNER JOIN member AS T2 ON T2.member_id = T3.link_to_member WHERE T1.event_name = 'October Meeting'	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major GROUP BY T1.college ORDER BY COUNT(T2.member_id) DESC LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT T3.event_name FROM budget AS T1 INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id ORDER BY T1.amount DESC LIMIT 1	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'	student_club
SELECT COUNT(*) FROM member AS t1 INNER JOIN attendance AS t2 ON t1.member_id = t2.link_to_member INNER JOIN event AS t3 ON t2.link_to_event = t3.event_id WHERE t3.event_name = 'Women''s Soccer'	student_club
SELECT date_received FROM income WHERE link_to_member = ( SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason' )	student_club
SELECT COUNT(*) FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T1.state = 'MD'	student_club
SELECT COUNT(T1.link_to_event) FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.phone = '954-555-6240'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT event_name FROM event WHERE status = 'Closed' ORDER BY DIVIDE(spent, amount) DESC LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE position = 'President'	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020';	student_club
SELECT SUM(T2.spent) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.category = 'Food'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T2.link_to_member HAVING COUNT(T2.link_to_event) > 7	student_club
SELECT T.first_name, T.last_name FROM ( SELECT first_name, last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Interior Design' ) AS T3 INNER JOIN attendance AS T4 ON T3.member_id = T4.link_to_member INNER JOIN event AS T5 ON T4.link_to_event = T5.event_id WHERE T5.event_name = 'Community Theater'	student_club
SELECT T2.first_name, T2.last_name FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.zip = 29430 AND T1.state = 'SC';	student_club
SELECT SUM(T1.amount) FROM income AS T1 INNER JOIN member AS T2 ON T2.member_id = T1.link_to_member WHERE T2.first_name = 'Grant' AND T2.last_name = 'Gilmour'	student_club
SELECT DISTINCT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 40	student_club
SELECT SUM(T2.cost) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Baseball game'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN event AS T2 ON T1.member_id = T2.event_id WHERE T2.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name, i.source FROM member m INNER JOIN income i ON m.member_id = i.link_to_member ORDER BY i.amount DESC LIMIT 1	student_club
SELECT event_name FROM event WHERE cost = ( SELECT MIN(cost) FROM event )	student_club
SELECT ( SUM( T1.cost ) * 100.0 / SUM( T2.cost ) ) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Yearly Kickoff'	student_club
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.major_name = 'Physics' THEN 1 ELSE 0 END) FROM major AS T1	student_club
SELECT source, MAX(amount) AS max_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY max_amount DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(T2.member_id) FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T1.major_name = 'Physics Teaching'	student_club
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Community Theater' AND strftime('%Y', T2.event_date) = '2019'	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major INNER JOIN attendance AS T3 ON T2.member_id = T3.link_to_member WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'	student_club
SELECT SUM(T1.spent) / COUNT(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_status = 'Closed' AND T1.category = 'Food'	student_club
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE category = 'Advertisement' ORDER BY spent DESC LIMIT 1)	student_club
SELECT CASE WHEN EXISTS(SELECT 1 FROM event AS t1 INNER JOIN attendance AS t2 ON t1.event_id = t2.link_to_event WHERE t1.event_name = 'Women''s Soccer' AND t2.link_to_member IN (SELECT member_id FROM member WHERE first_name = 'Maya' AND last_name = 'Mclean')) THEN 'Yes' ELSE 'No' END	student_club
SELECT CAST(SUM(CASE WHEN TYPE = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31' AND event_name LIKE '%Student_Club%'	student_club
SELECT T1.cost FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker' AND T1.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(t_shirt_size) as cnt FROM member GROUP BY t_shirt_size ORDER BY cnt DESC LIMIT 1	student_club
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.status = 'Closed' ORDER BY T1.remaining ASC LIMIT 1	student_club
SELECT expense_description, SUM(cost) FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'Yes' GROUP BY expense_description	student_club
SELECT T1.amount, T2.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'April Speaker' ORDER BY T1.amount ASC	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food'	student_club
SELECT link_to_event, SUM(amount) AS total_spent FROM budget WHERE category = 'Advertising' GROUP BY link_to_event ORDER BY total_spent DESC LIMIT 3	student_club
SELECT SUM(T1.cost) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.expense_description = 'Parking'	student_club
SELECT SUM(T2.cost) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE STRFTIME('%Y-%m-%d', T1.event_date) = '2019-08-20'	student_club
SELECT T1.first_name, T1.last_name, SUM(T3.cost) AS Total_Cost FROM member AS T1 INNER JOIN expense AS T3 ON T3.link_to_member = T1.member_id WHERE T1.member_id = 'rec4BLdZHS2Blfp4v'	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT expense_description FROM expense AS t1 INNER JOIN member AS t2 ON t1.link_to_member = t2.member_id WHERE t2.t_shirt_size = 'X-Large'	student_club
SELECT T1.zip FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost < 50	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'	student_club
SELECT T1.position FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'	student_club
SELECT COUNT(T2.member_id) FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T1.major_name = 'Business' AND T2.t_shirt_size = 'Medium'	student_club
SELECT T1.type FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30	student_club
SELECT category FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE location = 'MU 215')	student_club
SELECT category FROM budget AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T2.event_date = '2020-03-24T12:00:00'	student_club
SELECT T3.major_name FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'Vice President'	student_club
SELECT COUNT(CASE WHEN T1.position = 'Member' AND T2.major_name = 'Mathematics' THEN 1 ELSE 0 END) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id	student_club
SELECT category FROM event WHERE location = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 WHERE t_shirt_size = 'X-Large' AND position = 'Member'	student_club
SELECT COUNT(*) FROM major AS T1 INNER JOIN college AS T2 ON T1.college = T2.college_name WHERE T2.department = 'College of Agriculture and Applied Sciences'	student_club
SELECT T2.last_name, T1.department, T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Environmental Engineering'	student_club
SELECT DISTINCT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0	student_club
SELECT city, state FROM ZIP_CODE AS T1 INNER JOIN MEMBER AS T2 ON T1.zip_code = T2.zip INNER JOIN MAJOR AS T3 ON T2.link_to_major = T3.major_id WHERE T2.position = 'Member' AND T3.department = 'Electrical and Computer Engineering Department'	student_club
SELECT T2.event_name FROM member AS T1 INNER JOIN attendance AS T3 ON T1.member_id = T3.link_to_member INNER JOIN event AS T2 ON T3.link_to_event = T2.event_id WHERE T1.position = 'Vice President' AND T1.zip = ( SELECT T.zip_code FROM zip_code AS T WHERE T.city = 'Washington' AND T.state = 'DC' ) AND T2.location = '900 E. Washington St.'	student_club
SELECT T1.last_name, T1.position FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Pizza' AND T2.expense_date = '2019-09-10'	student_club
SELECT T3.last_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer'	student_club
SELECT SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'	student_club
SELECT DISTINCT T2.county FROM zip_code AS T1 INNER JOIN zip_code AS T2 ON T2.zip_code = T1.zip_code WHERE T1.type = 'PO Box'	student_club
SELECT DISTINCT T2.zip  FROM zip_code AS T1  INNER JOIN member AS T2 ON T1.zip_code = T2.zip  WHERE T1.type = 'PO Box' AND T1.state = 'Puerto Rico' AND T1.county = 'San Juan Municipio'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT link_to_event FROM expense WHERE cost > 50	student_club
SELECT T1.member_id, T2.link_to_event FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN expense AS T3 ON T3.link_to_member = T1.member_id WHERE T3.approved = 'true' AND T3.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Katy' AND T2.link_to_major = 'rec1N0upiVLy5esTO'	student_club
SELECT phone FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND major_name = 'Business')	student_club
SELECT T3.email FROM income AS T1 INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T1.date_received BETWEEN '2019-09-10' AND '2019-11-19' AND T1.amount > 200	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name LIKE '%education%' AND T1.position = 'member'	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM budget	student_club
SELECT event_id, location, status FROM event WHERE event_date >= '2019-11-01' AND event_date <= '2020-03-31'	student_club
SELECT expense_description FROM expense WHERE cost > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(SUM(CASE WHEN T2.type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.zip_code) AS percentage FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip	student_club
SELECT T2.event_name, T2.location FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.remaining > 0	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100	student_club
SELECT T2.first_name, T2.last_name, T3.major_name FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T1.cost > 100	student_club
SELECT T2.city, T2.country FROM income AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_id IN ( SELECT T1.event_id FROM income AS T1 GROUP BY T1.link_to_event HAVING COUNT(*) > 50 )	student_club
SELECT T.first_name, T.last_name, MAX(T.cost)  FROM (      SELECT M.first_name, M.last_name, E.cost      FROM member AS M      JOIN expense AS E ON M.member_id = E.link_to_member      JOIN budget AS B ON E.link_to_budget = B.budget_id      GROUP BY M.member_id      HAVING COUNT(B.link_to_event) > 1  ) AS T	student_club
SELECT AVG(T1.cost) FROM expense AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T2.type <> 'Member'	student_club
SELECT T2.event_name FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Parking' AND T1.cost < ( SELECT AVG(cost) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Parking' )	student_club
SELECT CAST(SUM(T1.cost) AS REAL) / COUNT(T1.event_id) * 100 FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.type = 'Game'	student_club
SELECT link_to_budget FROM expense WHERE expense_description = 'Water, chips, cookies' GROUP BY link_to_budget ORDER BY SUM(cost) DESC LIMIT 1	student_club
SELECT first_name, last_name, SUM(cost) as total_expense FROM member JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.member_id, first_name, last_name ORDER BY total_expense DESC LIMIT 5	student_club
SELECT T2.first_name, T2.last_name, T2.phone FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost > ( SELECT AVG(cost) FROM expense )	student_club
SELECT (CASE WHEN SUM(CASE WHEN T2.state = 'Maine' THEN 1 ELSE 0 END) > 0 THEN SUM(CASE WHEN T2.state = 'Maine' THEN 1 ELSE 0 END) ELSE 0 END) * 100.0 / (CASE WHEN COUNT(T1.member_id) > 0 THEN COUNT(T1.member_id) ELSE 0 END), (CASE WHEN SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) > 0 THEN SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) ELSE 0 END) * 100.0 / (CASE WHEN COUNT(T1.member_id) > 0 THEN COUNT(T1.member_id) ELSE 0 END) FROM member AS T1 LEFT JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member'	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, T2.cost FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T2.last_name, T2.phone FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T1.major_name = 'Elementary Education'	student_club
SELECT category, amount FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'January Speaker')	student_club
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE category = 'Food')	student_club
SELECT T2.first_name, T2.last_name, T1.amount FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE STRFTIME('%m/%d/%Y', T1.date_received) = '09/09/2019'	student_club
SELECT category FROM budget WHERE expense_description = 'Posters';	student_club
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'	student_club
SELECT event_name, SUM(spent) AS total_spent FROM budget WHERE category = 'Speaker Gifts' GROUP BY link_to_event	student_club
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Girke'	student_club
SELECT first_name, last_name, position FROM member WHERE city = 'Lincolnton' AND state = 'North Carolina' AND zip = 28092	student_club
SELECT COUNT(CASE WHEN T1.Segment = 'Premium' THEN 1 ELSE NULL END) FROM gasstations AS T1 INNER JOIN yearmonth AS T2 ON T2.GasStationID = T1.GasStationID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) * 1.0 / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) FROM customers	debit_card_specializing
SELECT T2.CustomerID FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE STRFTIME('%Y%m', T1.Date) BETWEEN '201201' AND '201212' GROUP BY T1.CustomerID ORDER BY COUNT(DISTINCT T1.ProductID) ASC, T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT AVG(T1.Consumption) / 12 FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T2.Currency = 'EUR' AND T1.Date BETWEEN '2013-01-01' AND '2013-12-31'	debit_card_specializing
SELECT T3.CustomerID FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T2.CustomerID = T1.CustomerID INNER JOIN customers AS T3 ON T3.CustomerID = T1.CustomerID WHERE T1.Date BETWEEN 201101 AND 201112 AND T3.Currency = 'CZK' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.`Date` BETWEEN 201201 AND 201212 AND T2.Consumption < 30000 AND T1.Segment = 'KAM'	debit_card_specializing
SELECT SUM(IIF(t1.Currency = 'CZK', t2.Consumption, 0)) - SUM(IIF(t1.Currency = 'EUR', t2.Consumption, 0)) FROM customers AS t1 INNER JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.`Date` BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT DATE FROM `transactions_1k` WHERE CURRENCY = 'EUR' GROUP BY DATE ORDER BY COUNT(*) DESC LIMIT 1	debit_card_specializing
SELECT T3.Segment FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T2.CustomerID = T1.CustomerID INNER JOIN customers AS T3 ON T3.CustomerID = T2.CustomerID GROUP BY T3.Segment ORDER BY SUM(T1.Consumption) ASC LIMIT 1	debit_card_specializing
SELECT T1.`1st_year` FROM ( SELECT SUBSTR(T2.Date, 1, 4) AS `1st_year`, SUM(T2.Consumption) AS total_consumption FROM yearmonth T2 GROUP BY `1st_year` ) T1 WHERE T1.total_consumption = ( SELECT MAX(T2.total_consumption) FROM ( SELECT SUBSTR(T1.Date, 1, 4) AS `1st_year`, SUM(T1.Consumption) AS total_consumption FROM yearmonth T1 GROUP BY `1st_year` ) T2 )	debit_card_specializing
SELECT MAX(T1.Consumption) ,  SUBSTR(T1.Date, 1, 5) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND SUBSTR(T1.Date, 1, 4) = '2013'	debit_card_specializing
SELECT t2.Segment, t3.Year, ( SUM(T1.Amount) * 1000 / COUNT(T2.CustomerID) ) - ( SELECT SUM(T1.Amount) * 1000 / COUNT(T2.CustomerID) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T1.Date = T3.Date WHERE T3.Year BETWEEN '201301' AND '201312' AND T2.Currency = 'CZK' AND T2.Segment = 'SME' ) AS C FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T1.Date = T3.Date WHERE T3.Year BETWEEN '201301' AND '201312' AND T2.Currency = 'CZK' AND T2.Segment IN ( SELECT Segment FROM customers WHERE CustomerID IN ( SELECT CustomerID FROM yearmonth ORDER BY Consumption ASC LIMIT 5 ) )	debit_card_specializing
SELECT T1.Segment, ROUND(T2.count_201312 * 100 / T1.count_201301 - 100, 2) AS percentage FROM ( SELECT SUM(IIF(T1.Segment = 'SME', 1, 0)) AS count_201301, SUM(IIF(T1.Segment = 'LAM', 1, 0)) AS count_201301_LAM, SUM(IIF(T1.Segment = 'KAM', 1, 0)) AS count_201301_KAM FROM customers T1 INNER JOIN yearmonth T2 ON T2.CustomerID = T1.CustomerID WHERE T2.Date BETWEEN '201201' AND '201312' ) T1 INNER JOIN ( SELECT SUM(IIF(T1.Segment = 'SME', 1, 0)) AS count_201312, SUM(IIF(T1.Segment = 'LAM', 1, 0)) AS count_201312_LAM, SUM(IIF(T1.Segment = 'KAM', 1, 0)) AS count_201312_KAM FROM customers T1 INNER JOIN yearmonth T2 ON T2.CustomerID = T1.CustomerID WHERE T2.Date BETWEEN '201301' AND '201312' ) T2 ON 1 = 1	debit_card_specializing
SELECT SUM(T1.Amount) FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date >= '2013-08-01' AND T1.Date <= '2013-11-01'	debit_card_specializing
SELECT COUNT(CASE WHEN T2.Country = 'Czech Republic' THEN 1 ELSE NULL END) - COUNT(CASE WHEN T2.Country = 'Slovakia' THEN 1 ELSE NULL END) FROM products AS T1 INNER JOIN gasstations AS T2 ON T1.ProductID = T2.ProductID WHERE T1.Description = 'discount'	debit_card_specializing
SELECT t2.Consumption - t1.Consumption FROM yearmonth AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.`Date` = '201304' AND T2.`Date` = '201304' AND T1.CustomerID = 7 AND T2.CustomerID = 5	debit_card_specializing
SELECT CAST(SUM(IIF(C.Segment = 'SME', I.Amount, 0)) AS REAL) - CAST(SUM(IIF(C.Segment <> 'SME', I.Amount, 0)) AS REAL) FROM transactions_1k AS I LEFT JOIN customers AS C ON I.CustomerID = C.CustomerID	debit_card_specializing
SELECT C.customerid FROM customers AS C INNER JOIN transactions_1k AS T ON C.customerid = T.customerid INNER JOIN yearmonth AS YM ON T.date = YM.date WHERE C.currency = 'Euro' AND YM.date LIKE '2013-10-%' GROUP BY C.customerid ORDER BY SUM(T.amount * T.price) DESC LIMIT 1	debit_card_specializing
SELECT CustomerID, SUM(Amount) FROM transactions_1k WHERE GASStationID IN ( SELECT GasStationID FROM gasstations WHERE Segment = 'KAM' ) AND Amount > 0 GROUP BY CustomerID ORDER BY SUM(Amount) DESC LIMIT 1	debit_card_specializing
SELECT SUM(Price * Amount) FROM transactions_1k INNER JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE yearmonth.Date = '201305' AND yearmonth.Consumption IN ( SELECT Consumption FROM yearmonth WHERE yearmonth.CustomerID = 19 AND yearmonth.Date = '201305' )	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Price * T1.Amount > 4673 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Description = 'LAM'	debit_card_specializing
SELECT T2.Country ,  COUNT(*) FROM products AS T1 INNER JOIN gasstations AS T2 ON T1.ProductID = T2.ChainID GROUP BY T2.Country	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'Euro' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM'	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN T2.Consumption > 528.3 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '201202%'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations AS T1 INNER JOIN yearmonth AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'Slovakia'	debit_card_specializing
SELECT T2.CustomerID FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.`Date` = '201309' GROUP BY T1.CustomerID ORDER BY SUM(T1.Consumption) DESC LIMIT 1	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1	debit_card_specializing
SELECT T2.`Segment` FROM `yearmonth` AS T1 INNER JOIN customers AS T2 ON T2.`CustomerID` = T1.`CustomerID` WHERE T1.`Date` = '201206' ORDER BY T1.`Consumption` ASC LIMIT 1	debit_card_specializing
SELECT MAX(CASE WHEN SUBSTR(T1.Date, 1, 4) = '2012' THEN T1.Consumption ELSE NULL END) AS monthly_consumption FROM yearmonth AS T1	debit_card_specializing
SELECT SUM(T2.Consumption) / COUNT(DISTINCT T1.Date) AS 'Result' FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'euro'	debit_card_specializing
SELECT T2.description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.productid = T2.productid WHERE T1.date BETWEEN '2013-09-01' AND '2013-09-30'	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date LIKE '2013%06%' GROUP BY T2.Country	debit_card_specializing
SELECT DISTINCT T2.ChainID FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Currency = 'EURO'	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID INNER JOIN customers AS T4 ON T1.CustomerID = T4.CustomerID WHERE T4.Currency = 'Euro'	debit_card_specializing
SELECT AVG(T2.Price) FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date WHERE T1.Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.ProductID IN ( SELECT ProductID FROM products WHERE Description LIKE '%fuel%' OR Description LIKE '%petrol%' )	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T3.Country = 'CZE'	debit_card_specializing
SELECT T2.Date FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11)	debit_card_specializing
SELECT COUNT(*) FROM `transactions_1k` WHERE `GasStationID` IN ( SELECT `GasStationID` FROM `gasstations` WHERE `Country` = 'CZE' ) AND `Price` > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date > '2012-01-01' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE')	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE'	debit_card_specializing
SELECT AVG(T2.Price * T2.Amount) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'Euro'	debit_card_specializing
SELECT T3.CustomerID FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T2.Date = '2012-08-25' GROUP BY T2.CustomerID ORDER BY SUM(T1.Amount) DESC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.`Date` = '2012-08-25'	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'	debit_card_specializing
SELECT T2.segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.customerid = T2.customerid WHERE T1.date = '2012-08-23' AND T1.time = '21:20:00'	debit_card_specializing
SELECT COUNT(Amount) FROM transactions_1k WHERE strftime('%Y-%m-%d', Date) = '2012-08-26' AND Time < '13:00:00' AND Currency = 'EUR'	debit_card_specializing
SELECT Segment FROM customers ORDER BY CustomerID LIMIT 1	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN gasstations AS T3 ON T2.Country = T3.Country WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT T2.ProductID FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE strftime('%Y-%m-%d', T1.Date) = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
SELECT T3.Amount * T3.Price AS total_expenses, T3.Date FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN transactions_1k AS T3 ON T2.TransactionID = T3.TransactionID WHERE T1.Consumption = 124.05 AND T2.Date = '2012-08-24'	debit_card_specializing
SELECT COUNT(T2.GasStationID) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date = '2012-08-26' AND STRFTIME('%H', T1.Time) >= '08' AND STRFTIME('%H', T1.Time) < '09'	debit_card_specializing
SELECT T2.currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.customerid = T2.customerid INNER JOIN yearmonth AS T3 ON T1.date = T3.date WHERE T3.date = '201306' AND T2.segment = '1'	debit_card_specializing
SELECT T1.country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.gasstationid = T2.gasstationid WHERE T2.cardid = 667467	debit_card_specializing
SELECT T2.Nationality FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Amount = 5484	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Currency) AS Percentage FROM customers WHERE STRFTIME('%Y-%m-%d', Date) = '2012-08-25'	debit_card_specializing
SELECT strftime('%Y-%m-%d', Date) AS Date, (t2.consumption - t1.consumption) / t1.consumption * 100 AS 'Rate(%)' FROM ( SELECT Year, CustomerID, SUM(Consumption) AS Consumption FROM yearmonth WHERE Year = 2012 AND CustomerID = 634.8 GROUP BY Year, CustomerID ) t1, ( SELECT Year, CustomerID, SUM(Consumption) AS Consumption FROM yearmonth WHERE Year = 2013 AND CustomerID = 634.8 GROUP BY Year, CustomerID ) t2	debit_card_specializing
SELECT T2.GasStationID, T2.ChainID FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T1.GasStationID ORDER BY SUM(T1.Amount * T1.Price) DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN transactions_1k AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Segment = 'premium' AND T1.Currency = 'svk'	debit_card_specializing
SELECT SUM(Amount * Price) AS total_spent FROM transactions_1k WHERE CustomerID = 38508; SELECT SUM(Amount * Price) AS total_spent FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '201201%';	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID INNER JOIN products AS T3 ON T2.Description = T3.Description GROUP BY T1.ProductID ORDER BY SUM(T1.Amount) DESC LIMIT 5	debit_card_specializing
SELECT T1.CustomerID, AVG(T2.Price / T2.Amount) AS AveragePricePerItem, T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.CustomerID, T1.Currency ORDER BY SUM(T2.Amount) DESC LIMIT 1	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1	debit_card_specializing
SELECT T1.Consumption FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.ProductID = 5 AND T2.Price / T2.Amount > 29 AND strftime('%Y%m', T1.Date) = '201208'	debit_card_specializing
