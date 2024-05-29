SELECT MAX(Free_Meal_Count_K_12 / Enrollment_K_12) AS Highest_Eligible_Free_Rate FROM frpm WHERE County_Name = 'Alameda';	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT `Zip` FROM schools WHERE `District` = 'Fresno County Office of Education' AND `Charter` = 1	california_schools
SELECT T2.Street FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1	california_schools
SELECT Phone FROM schools WHERE Charter = 1 AND CharterNum IS NOT NULL AND DOC = 'DIR' AND OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*) FROM schools WHERE CHAR_LENGTH(Virtual) - CHAR_LENGTH(REPLACE(Virtual, 'F', '')) = 0 AND AvgScrMath < 400	california_schools
SELECT S.School FROM schools AS S INNER JOIN satscores AS SS ON S.CDSCode = SS.cds WHERE SS.NumTstTakr > 500 AND S.Magnet = 1	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 AND T1.AvgScrMath >= 1500 AND T1.AvgScrWrite >= 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1	california_schools
SELECT SUM(T1.NumTstTakr) FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.rtype = 'K' AND T2.`FRPM Count (K-12)` = ( SELECT MAX(T2.`FRPM Count (K-12)`) FROM frpm AS T2 )	california_schools
SELECT COUNT(T1.CDSCode) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.`Charter Funding Type` = 'Directly funded'	california_schools
SELECT T2.FRPM_Count FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.RType = 'AY' ORDER BY T1.AvgScrRead DESC LIMIT 1	california_schools
SELECT CDSCode FROM frpm WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead > 0 AND T2.AvgScrMath > 0 AND T2.AvgScrWrite > 0 AND T2.NumTstTakr > 0 AND T2.NumGE1500 * 1.0 / T2.NumTstTakr > 0.3	california_schools
SELECT Phone FROM schools WHERE CDSCode IN (SELECT T2.cds FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.NumGE1500 / T1.NumTstTakr DESC LIMIT 3)	california_schools
SELECT T2.NCESSchool FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5	california_schools
SELECT District FROM `satscores` AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.cds WHERE T2.Charter = 0 AND T2.ClosedDate IS NULL GROUP BY District ORDER BY AVG(T1.AvgScrRead) DESC LIMIT 1	california_schools
SELECT count(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.rtype = 'A' AND T2.NumTstTakr < 100	california_schools
SELECT CharterNum FROM schools WHERE CDSCode = ( SELECT T1.CDS FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrWrite = 499 )	california_schools
SELECT COUNT(T1.CDSCode) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Contra Costa' AND T1.`2013-14 CALPADS Fall 1 Certification Status` = 1 AND T1.NumTstTakr <= 250	california_schools
SELECT T3.phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode INNER JOIN frpm AS T3 ON T2.CDSCode = T3.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT count(*) FROM frpm WHERE `Low Grade` = '9' AND `High Grade` = '12' AND "County Name" = 'Amador';	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700	california_schools
SELECT T2.school FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.cdscode = T2.cdscode WHERE T2.county = 'Contra Costa' ORDER BY T1.numtsttakr DESC LIMIT 1	california_schools
SELECT DISTINCT T1.School, T1.Street, T1.City FROM schools AS T1 INNER JOIN frpm AS T2 ON T2.CDSCode = T1.CDSCode WHERE T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)` > 30	california_schools
SELECT T2.sname FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Percent (%) Eligible Free (K-12)` > 0.1 AND T2.`Enrollment (K-12)` > 0 INNER JOIN satscores AS T3 ON T3.cds = T1.CDSCode WHERE T3.`AvgScrRead` >= 1500 AND T3.`NumTstTakr` > 0	california_schools
SELECT T2.FundingType FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Riverside' AND T2.AvgScrMath > 400	california_schools
SELECT DISTINCT T2.school, T2.street, T2.city, T2.state FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.city = 'Monterey' AND T1.`Enrollment (Ages 5-17)` > 800 AND T1.`FRPM Count (Ages 5-17)` > 0	california_schools
SELECT T1.school, T2.Phone FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.OpenDate > '1991-01-01' OR T1.ClosedDate < '2000-12-31'	california_schools
SELECT T2.School, T2.DOC FROM ( SELECT AVG(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) as diff FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.FundingType = 'Directly funded' ) AS T3 INNER JOIN frpm AS T1 ON T3.diff = T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.FundingType = 'Directly funded'	california_schools
SELECT MIN(`OpenDate`) FROM schools WHERE `School Type` = 'K-12 Schools (Public)' ORDER BY `Enrollment (K-12)` DESC LIMIT 1	california_schools
SELECT city FROM schools ORDER BY enrollment(1, 12) ASC LIMIT 5	california_schools
SELECT T.`School Name`, T.`Free Meal Count (K-12)`, T.`Enrollment (K-12)`, T.`Percent (%) Eligible Free (K-12)` FROM ( SELECT T.`School Name`, SUM(T.`Free Meal Count (K-12)`) AS meals, SUM(T.`Enrollment (K-12)`) AS total, ( SELECT CAST(SUM(T.`Free Meal Count (K-12)`) AS REAL) / SUM(T.`Enrollment (K-12)`) FROM frpm AS T WHERE T.Grade BETWEEN '1' AND '12' ORDER BY T.`Percent (%) Eligible Free (K-12)` DESC LIMIT 10 ) AS eligible_free_rate FROM frpm AS T WHERE T.Grade BETWEEN '1' AND '12' ORDER BY T.`Percent (%) Eligible Free (K-12)` DESC LIMIT 10 ) AS T	california_schools
SELECT T2.`Eligible FRPM (K-12)` FROM ( SELECT DISTINCT T1.cds FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Grade = 'K' AND T1.SchoolType = 'High School (Public)' AND T1.`County Code` = 66 ORDER BY T2.NumTstTakr DESC LIMIT 5 ) AS T1 INNER JOIN frpm AS T2 ON T2.CDSCode = T1.cds	california_schools
SELECT T1.Website FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000	california_schools
SELECT T1.`Percent (%) Eligible Free (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson'	california_schools
SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (K-12)` = ( SELECT MIN(T1.`Enrollment (K-12)`) FROM frpm AS T1 WHERE T1.`Charter School (Y/N)` = 1 AND T1.`Enrollment (K-12)` IS NOT NULL AND T1.`Low Grade` = 'K' AND T1.`High Grade` = '12' )	california_schools
SELECT T3.AdmFName1, T3.AdmLName1 FROM satscores AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.cds INNER JOIN frpm AS T3 ON T1.cds = T3.CDSCode WHERE T3.AdmEmail1 IN ( SELECT T1.AdmEmail1 FROM satscores AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.cds WHERE T1.NumGE1500 >= 1500 AND T2.NCESDist = ( SELECT T2.NCESDist FROM frpm AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.CDSCode ORDER BY T1.NumTstTakr DESC LIMIT 1 ) )	california_schools
SELECT T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.NumGE1500 / T2.NumTstTakr LIMIT 1	california_schools
SELECT DISTINCT T1.Website FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.StatusType = 'Fresno' AND YEAR(T1.OpenDate) = 1980 AND YEAR(T1.ClosedDate) = 1980	california_schools
SELECT Phone FROM schools WHERE District = 'Fresno Unified' ORDER BY AvgScrRead LIMIT 1	california_schools
SELECT T3.School, AVG(T2.AvgScrRead) as avg_reading_score FROM schools AS T3 LEFT JOIN satscores AS T2 ON T3.CDSCode = T2.cds WHERE T3.Virtual = 'F' GROUP BY T3.School ORDER BY avg_reading_score DESC LIMIT 5	california_schools
SELECT T2.EducationalOptionType FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT T1.AvgScrMath FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = ( SELECT County FROM satscores ORDER BY AvgScrMath LIMIT 1 ) ORDER BY T1.AvgScrMath ASC LIMIT 1	california_schools
SELECT T2.city FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.rtype = 'total' AND T1.NumTstTakr = ( SELECT MAX(NumTstTakr) FROM satscores WHERE NumTstTakr >= 1500 )	california_schools
SELECT T2.school, AVG(T1.AvgScrWrite) FROM satscores AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.cds WHERE T2.EdOpsName = 'Ricci Ulrich' GROUP BY T2.school	california_schools
SELECT S.State FROM schools AS S WHERE S.DOC = 31 AND S.County IN ( SELECT T.County FROM schools AS T WHERE T.Grades = 'K-12' ) ORDER BY S.Enrollment DESC LIMIT 1	california_schools
SELECT COUNT(CDSCode) / 12 FROM schools WHERE DISTRICT = '52' AND OpenDate >= '1980-01-01' AND OpenDate < '1981-01-01'	california_schools
SELECT CAST(SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT District) FROM schools WHERE County = 'Orange'	california_schools
SELECT T1.DistrictName, T1.SchoolName, T2.ClosedDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' GROUP BY T1.DistrictName ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT DISTINCT T1.Street FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = ( SELECT MAX(AvgScrMath) FROM satscores WHERE AvgScrMath < ( SELECT MAX(AvgScrMath) FROM satscores ) )	california_schools
SELECT Street FROM schools WHERE CDSCode IN ( SELECT T2.CDSCode FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = ( SELECT MIN(AvgScrRead) FROM satscores ) )	california_schools
SELECT COUNT(s.District) FROM schools s INNER JOIN satscores s2 ON s.CDSCode = s2.CDS WHERE s2.AvgScrRead + s2.AvgScrMath + s2.AvgScrWrite >= 1500 AND s.MailCity = 'Lakeport'	california_schools
SELECT COUNT(DISTINCT T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Fresno'	california_schools
SELECT DISTINCT T3.MailCity, T3.MailZip FROM frpm AS T1 INNER JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode INNER JOIN ( SELECT T1.AdmFName1 AS AdmFName, T1.AdmLName1 AS AdmLName FROM frpm AS T1 WHERE T1.AdmEmail1 LIKE '%avetik%' UNION ALL SELECT T1.AdmFName2 AS AdmFName, T1.AdmLName2 AS AdmLName FROM frpm AS T1 WHERE T1.AdmEmail2 LIKE '%avetik%' UNION ALL SELECT T1.AdmFName3 AS AdmFName, T1.AdmLName3 AS AdmLName FROM frpm AS T1 WHERE T1.AdmEmail3 LIKE '%avetik%' ) AS T2 ON T2.AdmFName = T3.AdmFName AND T2.AdmLName = T3.AdmLName	california_schools
SELECT CAST(COUNT(CASE WHEN T1.MailState = 'CA' AND T1.County = 'CO' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN T1.MailState = 'CA' AND T1.County = 'HM' THEN 1 ELSE NULL END) FROM schools AS T1	california_schools
SELECT COUNT(T1.District) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.`District Code` = T2.District WHERE T2.State = 'CA' AND T2.District = 'San Joaquin';	california_schools
SELECT Phone FROM schools WHERE NCESSchool = (SELECT TOP 333 TOP 333 ncesschool FROM SCHOOLLEVEL GROUP BY ncesschool ORDER BY AVG(Avgscrwrite) DESC);	california_schools
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE EdOpsName = 'Mike Larson' OR EdOpsName = 'Dante Alvarez'	california_schools
SELECT Website FROM schools WHERE StatusType = 'Charter' AND Virtual = 'P' AND District = 'SAN JOAQUIN COUNTY'	california_schools
SELECT count(*) FROM schools WHERE CHAR_LENGTH(`City`) - CHAR_LENGTH(REPLACE(`City`, 'Hickman', '')) > 0 AND DOC = '52' AND Charter = 1	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Los Angeles' AND Charter = 0 AND (`Free Meal Count (K-12)` * 100 / `Enrollment (K-12)`) < 0.018	california_schools
SELECT t1.AdmFName1, t1.AdmLName1, t1.AdmFName2, t1.AdmLName2, t1.AdmFName3, t1.AdmLName3, t2.school, t2.city FROM schools AS t1 INNER JOIN frpm AS t2 ON t1.CDSCode = t2.CDSCode WHERE t2.Charter = 1 AND t2.CharterNum = '00D2'	california_schools
SELECT COUNT(CASE WHEN T3.mailcity = 'Hickman' THEN 1 ELSE NULL END) FROM frpm AS T1 INNER JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T1.charternumber = '00D4'	california_schools
SELECT ( SELECT CAST(COUNT(*) AS REAL) FROM frpm WHERE CHARTER_SCHOOL__N_ = 1 AND CHARTER_FUNDING_TYPE = 'Locally Funded' AND `County Name` = 'Santa Clara County' ) / ( SELECT CAST(COUNT(*) AS REAL) FROM frpm WHERE CHARTER_SCHOOL__N_ = 1 AND `County Name` = 'Santa Clara County' ) * 100 AS percentage	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND YEAR(OpenDate) BETWEEN 2000 AND 2005	california_schools
SELECT sum(District) FROM schools WHERE SOC = 'Community College' AND city = 'San Francisco' AND StatusType = 'CLOSED' AND District = 1989	california_schools
SELECT T2.County FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.SOC = '11' AND YEAR(CAST(`Academic Year` AS DATE)) BETWEEN 1980 AND 1989 GROUP BY T2.County ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT DISTINCT T2.NCESDist FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.SOC = 31	california_schools
SELECT COUNT(CASE WHEN DistrictType = 'District Community Day School (Public)' THEN 1 ELSE NULL END) FROM schools WHERE County = 'Alpine';	california_schools
SELECT District FROM schools WHERE Magnet = 0 AND City = 'Fresno';	california_schools
SELECT SUM(T2.`Enrollment (Ages 5-17)`) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.EdOpsCode = 'SSS' AND T2.`Academic Year` = '2014-2015'	california_schools
SELECT T2.`Enrollment (Ages 5-17)`, T2.`Free Meal Count (Ages 5-17)`, T2.`Percent (%) Eligible Free (Ages 5-17)`, T2.`FRPM Count (Ages 5-17)`, T2.`Percent (%) Eligible FRPM (Ages 5-17)` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Mailing Street` = 'PO Box 1040' AND T1.`School Name` = 'Youth Authority School'	california_schools
SELECT `Low Grade` FROM schools WHERE DOC = '613360' AND EdOpsCode = 'SPECON'	california_schools
SELECT T1.EducationalOptionType FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.DistrictCode = 1 AND T2.CountyCode = 37 AND T1.`Educational Option Type` = 'Breakfast Provision 2'	california_schools
SELECT City FROM schools WHERE County = 'Merced' AND EILCode = 'HS' AND LowGrade = '9' AND HighGrade = '12' AND Lunch = 'Lunch Provision 2'	california_schools
SELECT t1.CountyName, t1.DistrictName, t1.`District Type`, t1.`School Name`, t1.`Percent (%) Eligible FRPM (Ages 5-17)`, t1.`Enrollment (Ages 5-17)` * 100.0 / t1.`Free Meal Count (Ages 5-17)` AS FRPM_Percent FROM frpm AS t1 WHERE t1.`Low Grade` = 'K' AND t1.`High Grade` = '9' AND t1.`County Name` = 'Los Angeles'	california_schools
SELECT `Grade Span Served` FROM schools WHERE City = 'Adelanto' GROUP BY `Grade Span Served` ORDER BY count(*) DESC LIMIT 1	california_schools
SELECT COUNT(T1.County) FROM schools AS T1 INNER JOIN ( SELECT County FROM schools WHERE Virtual = 'F' GROUP BY County ORDER BY COUNT(County) DESC LIMIT 1 ) AS T2 ON T1.County = T2.County WHERE T1.State = 'CA' AND T1.County NOT IN ( SELECT County FROM schools WHERE Virtual = 'T' )	california_schools
SELECT T1.school_type, T2.school FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.cds_code = T2.cds WHERE T2.latitude = ( SELECT MAX(latitude) FROM schools )	california_schools
SELECT T2.city, T2.school, T2.lowest_grade FROM schools AS T2 INNER JOIN ( SELECT city, school, lowest_grade, ROW_NUMBER() OVER (PARTITION BY city ORDER BY latitude ASC) AS rn FROM schools ) AS T1 ON T2.city = T1.city AND T2.school = T1.school WHERE T1.rn = 1 AND T2.state = 'CA'	california_schools
SELECT LOWER(`Low Grade`) AS `LowGrade`, LOWER(`High Grade`) AS `HighGrade` FROM frpm ORDER BY Longitude DESC LIMIT 1	california_schools
SELECT COUNT(T1.District) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Low Grade` = 'K' AND T2.`High Grade` = '8' AND T2.Magnet = 1	california_schools
SELECT T1.AdmFName1, T1.AdmFName2, T1.AdmFName3, T2.District FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T1.AdmFName1, T1.AdmFName2, T1.AdmFName3 ORDER BY COUNT(*) DESC LIMIT 2	california_schools
SELECT T1.`District Code`, T1.`Percent (%) Eligible Free (K-12)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`AdmFName1` = 'Alusine'	california_schools
SELECT T3.District, T3.County, T3.School FROM frpm AS T1 INNER JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T1.CharterNum = 40	california_schools
SELECT T2.AdmEmail1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'San Bernardino' AND T1.District = 'District of San Bernardino City Unified' AND T1.OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND T2.SOC = 62	california_schools
SELECT T1.`School Name`, T1.AdmEmail1 FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr = ( SELECT MAX(NumTstTakr) FROM satscores ) AND T2.AvgScrRead >= 1500	california_schools
SELECT COUNT(*) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 = 'East Bohemia' AND T1.frequency = 'POPLATEK PO OBRATU'	financial
SELECT COUNT(T2.account_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'PRAGA'	financial
SELECT T1.A12, T1.A13 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id GROUP BY T1.district_id, T1.A12, T1.A13 HAVING AVG(T1.A12) > AVG(T1.A13)	financial
SELECT COUNT(district_id) FROM ( SELECT T1.district_id FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' AND T1.A11 >= 6000 AND T1.A11 < 10000 ) AS T3	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A3 = 'North Bohemia' AND T2.A11 > 8000	financial
SELECT T3.account_id FROM client AS T1          INNER JOIN trans AS T2 ON T1.client_id = T2.account_id          INNER JOIN account AS T3 ON T3.account_id = T2.account_id WHERE T1.gender = 'F' ORDER BY T1.birth_date DESC LIMIT 1 UNION ALL SELECT T4.account_id FROM account AS T4          INNER JOIN disp AS T5 ON T5.account_id = T4.account_id          INNER JOIN client AS T6 ON T5.client_id = T6.client_id WHERE T6.gender = 'F' GROUP BY T4.account_id HAVING AVG(T2.amount) = (     SELECT MIN(T2.amount)     FROM account AS T4              INNER JOIN disp AS T5 ON T5.account_id = T4.account_id              INNER JOIN client AS T6 ON T5.client_id = T6.client_id              INNER JOIN trans AS T2 ON T4.account_id = T2.account_id     WHERE T6.gender = 'F' ); SELECT DISTINCT T1.account_id, SUM(T2.amount), AVG(T2.amount) FROM account AS T1          INNER JOIN disp AS T3 ON T1.account_id = T3.account_id          INNER JOIN client AS T4 ON T3.client_id = T4.client_id          INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T4.gender = 'F' GROUP BY T1.account_id, T4.birth_date ORDER BY T4.birth_date DESC LIMIT 1; WITH T1 AS (     SELECT T1.account_id     FROM account AS T1              INNER JOIN disp AS T2 ON T1.account_id = T2.account_id              INNER JOIN client AS T3 ON T2.client_id = T3.client_id              INNER JOIN trans AS T4	financial
SELECT T3.account_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.birth_date = ( SELECT MIN(birth_date) FROM client ) GROUP BY T3.account_id ORDER BY AVG(T3.district_id) DESC LIMIT 1	financial
SELECT count(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'	financial
SELECT T1.birth_date, T1.gender FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'POPLATEK PO OBRATU'	financial
SELECT T.account_id FROM ( SELECT T1.account_id, T3.amount FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN loan AS T3 ON T3.amount = ( SELECT MIN(amount) FROM loan WHERE YEAR(T1.date) = 1997 AND T1.account_id = T2.account_id ) WHERE YEAR(T1.date) = 1997 AND T2.frequency = 'POPLATEK TYDNE' ) AS T	financial
SELECT a.account_id, MAX(l.amount)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.date LIKE '1993%' AND l.duration > 12  GROUP BY a.account_id;	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T3.account_id = T2.account_id INNER JOIN district AS T4 ON T4.district_id = T1.district_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T4.A2 = 'Slokolov'	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY T2.date LIMIT 1	financial
SELECT T2.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK MESICNE' AND T1.date < '1997-01-01' AND T2.type = 'OWNER' GROUP BY T2.account_id HAVING SUM(T2.amount) > 3000	financial
SELECT T2.client_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK MESICNE' AND T1.date LIKE '1994/03/03'	financial
SELECT T1.date FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK MESICNE' AND T2.amount = 840 AND strftime('%Y/%m/%d', T2.date) = '1998/10/14'	financial
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25'	financial
SELECT MAX(t1.amount) FROM trans AS t1 INNER JOIN disp AS t2 ON t1.account_id = t2.account_id INNER JOIN card AS t3 ON t2.disp_id = t3.disp_id WHERE t3.issued = '1996-10-21'	financial
SELECT T3.gender FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T3.client_id = T2.client_id INNER JOIN district AS T4 ON T4.district_id = T1.district_id WHERE T1.date = ( SELECT MIN(date) FROM account ) ORDER BY T4.A11 DESC LIMIT 1	financial
SELECT T2.amount FROM loan AS T1 INNER JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'A' ORDER BY T1.amount DESC LIMIT 1	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A2 = 'Jesenik'	financial
SELECT T2.disp_id FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 5100 AND T1.date = '1998-09-02'	financial
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'LITOMERICE' AND strftime('%Y', T1.date) = '1996'	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T2.client_id = T3.client_id INNER JOIN account AS T4 ON T3.account_id = T4.account_id WHERE T2.gender = 'F' AND T2.birth_date = '1976-01-29'	financial
SELECT T4.birth_date FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T4 ON T2.client_id = T4.client_id WHERE T1.loan_id = 98832 AND strftime('%Y', T1.date) = '1996' AND strftime('%m', T1.date) = '01' AND strftime('%d', T1.date) = '03'	financial
SELECT T1.account_id FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id WHERE T2.district_id = ( SELECT T1.district_id FROM district AS T1 WHERE T1.A3 = 'Prague' LIMIT 1 ) LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.gender) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'South Bohemia'	financial
SELECT ROUND(((T1.balance - 1200000) / 1200000) * 100, 2) AS per_increase FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1993-03-22' AND T1.status = 'ACTIVE' AND T2.date = '1998-12-27'	financial
SELECT CAST(SUM(IIF(T1.status = 'A', T2.amount, 0)) AS REAL) / SUM(T2.amount) * 100 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id	financial
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) FROM loan WHERE amount < 100000	financial
SELECT T3.account_id, T3.district_id, T3.A2 AS region FROM account AS T1 INNER JOIN district AS T3 ON T1.district_id = T3.district_id INNER JOIN trans AS T4 ON T4.date = T1.date WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T4.type = 'VYPIS' AND SUBSTR(T4.date, 1, 4) = 1993	financial
SELECT T3.account_id, T2.frequency FROM district AS T1 INNER JOIN account AS T3 ON T1.district_id = T3.district_id INNER JOIN client AS T4 ON T4.district_id = T3.district_id WHERE T1.A2 = 'East Bohemia' AND T3.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT T2.account_id ,  T2.date FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Prachatice'	financial
SELECT T1.A2, T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T2.district_id = T1.district_id INNER JOIN loan AS T3 ON T3.account_id = T2.account_id WHERE T3.loan_id = '4990'	financial
SELECT a1.account_id, a1.district_id, t3.A3 FROM account AS a1  JOIN loan AS a2 ON a1.account_id = a2.account_id  JOIN district AS t3 ON t3.district_id = a1.district_id WHERE a2.amount > 300000;	financial
SELECT L.loan_id ,  D.A3 ,  (SELECT avg(T1.A11) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T2.client_id = T3.client_id INNER JOIN account AS T4 ON T3.account_id = T4.account_id INNER JOIN loan AS T5 ON T4.account_id = T5.account_id WHERE T5.duration = 60 AND T5.loan_id = L.loan_id) FROM loan AS L INNER JOIN account AS T ON L.account_id = T.account_id INNER JOIN district AS D ON D.district_id = T.district_id WHERE L.duration = 60	financial
SELECT T3.district_id, T3.A12 AS y1995, T3.A13 AS y1996, ((T3.A13 - T3.A12) / T3.A12) * 100 AS percent_increase FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T3.district_id = T2.district_id WHERE T1.status = 'D' AND T1.date BETWEEN '1995-01-01' AND '1996-12-31'	financial
SELECT CAST(COUNT(T1.account_id) AS REAL) * 100 / COUNT(T2.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date LIKE '1993%' AND T2.A2 = 'DECIN'	financial
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK MESICNE'	financial
SELECT A2 ,  COUNT(*) FROM client WHERE gender = 'F' GROUP BY A2 ORDER BY COUNT(*) DESC LIMIT 10	financial
SELECT DISTINCT T1.A2, T4.amount FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T2.client_id = T3.client_id INNER JOIN account AS T4 ON T3.account_id = T4.account_id INNER JOIN trans AS T5 ON T4.account_id = T5.account_id WHERE T5.type = 'VYDAJ' AND T5.date LIKE '1996-01%' ORDER BY T5.amount DESC LIMIT 10	financial
SELECT COUNT(T2.client_id) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'South Bohemia' AND NOT EXISTS (SELECT * FROM disp AS T3 INNER JOIN card AS T4 ON T3.disp_id = T4.disp_id WHERE T2.client_id = T3.client_id)	financial
SELECT T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.account_id WHERE T1.status = 'C' AND T2.A3 IS NOT NULL GROUP BY T2.A3 ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN client AS T2 ON T2.client_id = T1.client_id WHERE T2.gender = 'M'	financial
SELECT T1.A2, T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE SUBSTR(T2.date, 1, 4) = '1996' ORDER BY T1.A13 DESC LIMIT 1	financial
SELECT COUNT(*) FROM account WHERE district_id = ( SELECT T2.district_id FROM district AS T1 INNER JOIN crime AS T2 ON T1.district_id = T2.district_id WHERE T2.A16 = ( SELECT MAX(A16) FROM district AS T1 INNER JOIN crime AS T2 ON T1.district_id = T2.district_id WHERE T1.`1996` = 'yes' ) LIMIT 1 )	financial
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN `order` AS T3 ON T3.account_id = T2.account_id INNER JOIN trans AS T4 ON T4.account_id = T3.account_id WHERE T3.operation = 'VYBER KARTOU' AND T1.frequency = 'POPLATEK MESICNE' AND T4.balance < 0	financial
SELECT COUNT(*) FROM loan WHERE date BETWEEN '1995-01-01' AND '1997-12-31' AND amount >= 250000 AND frequency = 'POPLATEK MESICNE' AND status = 'A'	financial
SELECT COUNT(T1.account_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 1 AND T1.status = 'C'	financial
SELECT COUNT(T2.client_id) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 = ( SELECT MAX(T3.A15) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE YEAR(T2.birth_date) = 1995 ) AND T2.birth_date > DATE(1995, 2, 18) AND T2.gender = 'M'	financial
SELECT COUNT(T1.card_id) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'GOLD' AND T2.type = 'disponent'	financial
SELECT COUNT(T2.account_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Pisek'	financial
SELECT T3.A2 FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.amount > 10000 AND strftime('%Y', T1.date) = '1997' GROUP BY T3.A2	financial
SELECT T1.account_id FROM `order` AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.bank_to = 'PISEK' AND T1.k_symbol = 'SIPO'	financial
SELECT T1.account_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'junior' INTERSECT SELECT T3.account_id FROM card AS T3 INNER JOIN disp AS T4 ON T3.disp_id = T4.disp_id WHERE T3.type = 'gold'	financial
SELECT AVG(T2.amount) FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK MESICNE' AND YEAR(T2.date) = 2021 AND T2.operation = 'VYBER KARTOU'	financial
SELECT T2.client_id FROM card AS T1 INNER JOIN disp AS T3 ON T1.disp_id = T3.disp_id INNER JOIN client AS T2 ON T3.client_id = T2.client_id INNER JOIN trans AS T4 ON T3.account_id = T4.account_id WHERE T1.type = 'POPLATEK MESICNE' AND T4.date LIKE '1998%' AND T4.operation = 'VYBER KARTOU' GROUP BY T2.client_id HAVING AVG(T4.amount) < (SELECT AVG(T4.amount) FROM trans AS T4 INNER JOIN disp AS T5 ON T4.account_id = T5.account_id INNER JOIN client AS T6 ON T5.client_id = T6.client_id WHERE T4.date LIKE '1998%' AND T4.operation = 'VYBER KARTOU' AND T1.type = 'POPLATEK MESICNE')	financial
SELECT DISTINCT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T3.disp_id = T2.disp_id INNER JOIN loan AS T4 ON T4.account_id = T2.account_id WHERE T1.gender = 'F'	financial
SELECT COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T1.gender = 'F' AND T4.A3 = 'south Bohemia'	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T1.account_id = T3.account_id WHERE T2.A2 = 'Tabor' AND T1.frequency = 'POPLATEK MESICNE'	financial
SELECT T1.type FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.A11 BETWEEN 8000 AND 9000 AND T1.type NOT LIKE 'OWNER'	financial
SELECT COUNT(T1.trans_id) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'North Bohemia' AND T1.bank = 'AB'	financial
SELECT DISTINCT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'	financial
SELECT AVG(T3.A15) FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T2.`date` >= '1997-01-01' AND T1.`date` BETWEEN '1995-01-01' AND '1995-12-31' AND T3.A3 IN ( SELECT T3.A3 FROM account AS T1 INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.`date` >= '1997-01-01' GROUP BY T3.A3 HAVING COUNT(DISTINCT T1.district_id) > 4000 )	financial
SELECT COUNT(T2.disp_id) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'CLASSIC' AND T2.type = 'OWNER'	financial
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A2 = 'Hl.m. Praha'	financial
SELECT CAST(SUM(IIF(T1.type = 'GOLD' AND STRFTIME('%Y', T1.issued) < '1998', 1, 0)) AS REAL) * 100.0 / COUNT(*) FROM CARD AS T1	financial
SELECT T2.client_id FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id ORDER BY T1.amount DESC LIMIT 1	financial
SELECT SUM(CASE WHEN T2.A15 = 1995 THEN 1 ELSE 0 END) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532	financial
SELECT T2.district_id FROM order AS T1 INNER JOIN account AS T2 ON T2.account_id = T1.account_id WHERE T1.order_id = 33333	financial
SELECT * FROM `order` WHERE client_id = 3356 AND type = 'VYBER'	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE'	financial
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.client_id = 13539	financial
SELECT A3 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541	financial
SELECT T2.A2 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T1.account_id WHERE T1.status = 'A' GROUP BY T2.A2 ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT T1.gender, T1.birth_date, T1.district_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN `order` AS T3 ON T2.account_id = T3.account_id WHERE T3.order_id = 32423	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5)	financial
SELECT COUNT(account_id) FROM account WHERE district_id = ( SELECT district_id FROM district WHERE A3 = 'JESENIK' )	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.issued > '1996-01-01' AND T3.type = 'junior'	financial
SELECT CAST(SUM(IIF(T1.gender = 'F', 1, 0)) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.district_id IN (SELECT district_id FROM district WHERE A11 > 10000)	financial
SELECT CAST(SUM(CASE WHEN SUBSTR(T1.date, 1, 4) = '1997' THEN T1.amount ELSE 0 END) AS REAL) - CAST(SUM(CASE WHEN SUBSTR(T1.date, 1, 4) = '1996' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN SUBSTR(T1.date, 1, 4) = '1996' THEN T1.amount ELSE 0 END) AS growth_rate FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'M' AND T1.status = 'A'	financial
SELECT COUNT(trans_id) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'	financial
SELECT t1.A16 - t2.A16 FROM district AS t1 INNER JOIN account AS t2 ON t1.district_id = t2.district_id WHERE YEAR(t2.date) = 1996 AND t1.A3 = 'East Bohemia' LIMIT 1	financial
SELECT COUNT(type) FROM disp WHERE account_id BETWEEN 1 AND 10	financial
SELECT count(*) FROM `order` WHERE account_id = 3 AND k_symbol = 'pohotovost'  SELECT sum(amount) FROM `order` WHERE account_id = 3 AND k_symbol = 'pohotovost'	financial
SELECT YEAR(birth_date) FROM client WHERE client_id = 130;	financial
SELECT COUNT(*) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.type = 'owner'	financial
SELECT SUM(amount) ,  status FROM loan WHERE client_id =992 GROUP BY status	financial
SELECT t1.balance, t2.gender FROM trans AS t1 INNER JOIN client AS t2 ON t1.account_id = t2.client_id WHERE t1.trans_id = 851	financial
SELECT T2.type FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T3.disp_id = T2.disp_id WHERE T1.client_id = 9	financial
SELECT SUM(amount) FROM trans WHERE client_id = 617 AND YEAR(date) = 1998	financial
SELECT client.client_id FROM client INNER JOIN district ON client.district_id = district.district_id WHERE district.A3 LIKE 'east' AND client.birth_date BETWEEN '1983-01-01' AND '1987-12-31'	financial
SELECT T1.client_id FROM CLIENT AS T1 INNER JOIN LOAN AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3	financial
SELECT COUNT(T2.client_id) FROM loan AS T1 INNER JOIN disp AS T2 ON T2.account_id = T1.account_id WHERE T2.type = 'OWNER' AND T1.`status` = 'PAID' AND T1.`amount` > 4000 AND T2.client_id IN ( SELECT T1.client_id FROM client AS T1 WHERE T1.`gender` = 'M' AND T1.birth_date BETWEEN '1974-01-01' AND '1976-12-31' )	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > '1996-01-01'	financial
SELECT COUNT(*) FROM ( SELECT DISTINCT T2.client_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN account AS T4 ON T2.account_id = T4.account_id INNER JOIN loan AS T5 ON T4.account_id = T5.account_id WHERE T5.status = 'A' AND T5.amount >= 30000 AND T1.type = 'junior' AND T3.gender = 'F' )	financial
SELECT ( SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T1.gender = 'F' AND T4.A3 = 'PRAHA' ) * 100 / ( SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 = 'PRAHA' ) AS percentage	financial
SELECT CAST(COUNT(CASE WHEN T1.gender = 'M' THEN T1.client_id ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T3.account_id = T2.account_id WHERE T3.frequency = 'POPLATEK TYDNE'	financial
SELECT T3.account_id FROM loan AS T1 INNER JOIN account AS T3 ON T3.account_id = T1.account_id WHERE T1.status = 'A' AND T1.duration > 24 INNER JOIN account AS T2 ON T2.account_id = T1.account_id WHERE T2.date < '1997-01-01' AND T2.frequency = 'POPLATEK MESICNE' ORDER BY T1.amount ASC LIMIT 1	financial
SELECT T1.account_id FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id WHERE T1.gender = 'F' ORDER BY T2.A11 ASC LIMIT 1	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date LIKE '1920%' AND T2.A3 LIKE 'east%'	financial
SELECT count(*) FROM loan WHERE duration = 24 AND frequency = 'POPLATEK TYDNE'	financial
SELECT AVG(T2.amount) FROM loan AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'C' AND T2.type = 'POPLATEK PO OBRATU'	financial
SELECT T3.client_id, T3.district_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.frequency = 'POPLATEK MESICNE' EXCEPT SELECT T1.client_id, T1.district_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN order AS T3 ON T3.account_id = T2.account_id WHERE T3.k_symbol = 'POJISTENI A POSUDA'	financial
SELECT C.client_id , C.birth_date FROM client AS C INNER JOIN disp AS D ON C.client_id  =  D.client_id INNER JOIN card AS CARD ON D.disp_id  =  CARD.disp_id WHERE CARD.type  =  'GOLD';	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom AS a WHERE a.element = 'cl' AND a.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT COUNT(T2.atom_id) / COUNT(T1.molecule_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T1.bond_type = '-' AND T3.element = 'o'	toxicology
SELECT CAST(COUNT(CASE WHEN T1.bond_type = 'single' THEN 1 ELSE NULL END) AS REAL) / COUNT(T2.atom_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'na')	toxicology
SELECT a1.atom_id, a2.atom_id, a3.atom_id, m.label FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN atom a2 ON c1.atom_id2 = a2.atom_id JOIN connected c2 ON a2.atom_id = c2.atom_id JOIN atom a3 ON c2.atom_id2 = a3.atom_id JOIN bond b1 ON c1.bond_id = b1.bond_id JOIN bond b2 ON c2.bond_id = b2.bond_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE b1.bond_type = '#' AND b2.bond_type = '#' AND m.label = '+' GROUP BY a1.atom_id, a2.atom_id, a3.atom_id HAVING COUNT(*) = 3	toxicology
SELECT CAST(COUNT(CASE WHEN T1.element = 'c' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT count(atom_id) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT molecule_id FROM atom WHERE element = 'si'	toxicology
SELECT element FROM atom WHERE atom_id IN ( SELECT atom_id FROM connected WHERE bond_id = 'TR004_8_9' )	toxicology
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '='	toxicology
SELECT T1.molecule_id, T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.bond_id = T3.bond_id INNER JOIN atom AS T4 ON T4.atom_id = T3.atom_id WHERE T4.element = 'h' GROUP BY T1.molecule_id ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T3.element = 'te'	toxicology
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T2.atom_id = T1.atom_id INNER JOIN bond AS T3 ON T3.bond_id = T1.bond_id WHERE T3.bond_type = '-';	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id2 IN ( SELECT atom_id FROM atom WHERE element = 'h' ) AND T1.molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' )	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR004_8' INTERSECT SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR004_20'	toxicology
SELECT T2.label FROM molecule AS T1 INNER JOIN atom AS T3 ON T3.molecule_id = T1.molecule_id WHERE T3.element != 'cl' AND T3.element != 'ti' GROUP BY T2.label	toxicology
SELECT COUNT(*) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 'i' OR T1.element = 's' AND T3.bond_type = '-'	toxicology
SELECT C.atom_id, C.atom_id2 FROM connected AS C INNER JOIN bond AS B ON C.bond_id = B.bond_id WHERE B.bond_type = '#'	toxicology
SELECT T1.atom_id  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  WHERE T2.atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')	toxicology
SELECT CAST(SUM(CASE WHEN T2.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percent FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY COUNT(atom_id) DESC LIMIT 3	toxicology
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.molecule_id = 'TR001' AND T1.bond_id = 'TR001_2_6'	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON b.bond_id = c.bond_id WHERE b.bond_id = 'TR000_2_5';	toxicology
SELECT T1.bond_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_2'	toxicology
SELECT T2.label FROM connected AS T1 INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id INNER JOIN molecule AS T2 ON T2.molecule_id = T3.molecule_id WHERE T3.bond_type = '=' GROUP BY T2.molecule_id ORDER BY COUNT(*) DESC LIMIT 5	toxicology
SELECT CAST(SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond.bond_id) AS percent FROM molecule JOIN connected ON molecule.molecule_id = connected.molecule_id JOIN bond ON connected.bond_id = bond.bond_id WHERE molecule.molecule_id = 'TR008'	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) as percent FROM molecule AS T1	toxicology
SELECT CAST(COUNT(CASE WHEN T2.element = 'h' THEN T1.atom_id END) AS REAL) * 100 / COUNT(T1.atom_id) as percent FROM atom AS T1 INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id INNER JOIN connected AS T4 ON T4.atom_id = T1.atom_id WHERE T3.label = 'TR206'	toxicology
SELECT DISTINCT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR000'	toxicology
SELECT T2.label, T3.element FROM molecule AS T1 JOIN `connected` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `atom` AS T3 ON T3.atom_id = T2.atom_id WHERE T1.label = '+' AND T3.element = 'cl'	toxicology
SELECT bond.bond_type FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.molecule_id = 'TR018' GROUP BY bond.bond_type ORDER BY COUNT(bond.bond_type) DESC LIMIT 1	toxicology
SELECT DISTINCT t.label FROM molecule AS t LEFT JOIN atom AS a ON t.molecule_id = a.molecule_id LEFT JOIN bond AS b ON t.molecule_id = b.molecule_id LEFT JOIN connected AS c ON a.atom_id = c.atom_id AND a.molecule_id = c.molecule_id LEFT JOIN atom AS a2 ON c.atom_id2 = a2.atom_id AND c.molecule_id = a2.molecule_id WHERE t.label != '-' AND b.bond_type = '-' AND a.element = 'cl' AND a2.element = 'cl' GROUP BY t.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 3	toxicology
SELECT T3.bond_type FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T1.bond_id = T3.bond_id  JOIN molecule AS T4 ON T2.molecule_id = T4.molecule_id  WHERE T4.molecule_id = 'TR006'  ORDER BY T3.bond_type ASC  LIMIT 2	toxicology
SELECT COUNT(*) FROM bond WHERE bond_id LIKE 'TR009_%' AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12')	toxicology
SELECT COUNT(T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'br';	toxicology
SELECT T2.atom_id, T3.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T2.bond_id = T1.bond_id INNER JOIN atom AS T3 ON T3.atom_id = T1.atom_id OR T3.atom_id = T1.atom_id2 WHERE T2.bond_id = 'TR001_6_9'	toxicology
SELECT T2.label, CASE WHEN T1.element = 'c' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS carbon_status FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10' AND T2.label = '+';	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '#' GROUP BY T1.molecule_id HAVING COUNT(*) = 3	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.label  =  "TR004"	toxicology
SELECT count(*) FROM molecule WHERE label = '-'	toxicology
SELECT t1.label FROM molecule AS t1 JOIN atom AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.atom_id BETWEEN 'TR021' AND 'TR025' AND t1.label = '+'	toxicology
SELECT DISTINCT b.bond_id  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element IN ('p', 'n')	toxicology
SELECT T2.label FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_type = '=' ORDER BY T1.molecule_id ASC LIMIT 1	toxicology
SELECT CAST(COUNT(T2.bond_id) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'	toxicology
SELECT T3.bond_type, T3.bond_id FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T2.atom_id = 45	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 LEFT JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id WHERE T2.atom_id IS NULL	toxicology
SELECT a1.element AS atom_1, a2.element AS atom_2, b.bond_type FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN atom a2 ON a2.atom_id = c1.atom_id2 JOIN bond b ON b.bond_id = c1.bond_id JOIN molecule m ON m.molecule_id = a1.molecule_id WHERE m.label = 'TR447' AND b.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'	toxicology
SELECT T3.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T1.label = '+' AND T4.bond_type = ' = ' GROUP BY T3.label ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT a.element  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+'  GROUP BY a.element  ORDER BY COUNT(*) ASC  LIMIT 1	toxicology
SELECT DISTINCT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb'	toxicology
SELECT a1.element, a2.element, a3.element  FROM atom AS a1  JOIN connected AS c ON a1.atom_id = c.atom_id  JOIN atom AS a2 ON c.atom_id2 = a2.atom_id  JOIN bond AS b ON c.bond_id = b.bond_id  JOIN atom AS a3 ON a3.atom_id = c.atom_id2  WHERE b.bond_type = '#'	toxicology
SELECT DIVIDE(COUNT(bond.bond_id), COUNT(atom.atom_id)) FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id GROUP BY atom.element ORDER BY COUNT(atom.atom_id) DESC LIMIT 1;	toxicology
SELECT COUNT(CASE WHEN b.bond_type = '-' AND m.label = '+' THEN 1 ELSE NULL END) * 100.0 / COUNT(b.bond_id) FROM bond b INNER JOIN molecule m ON b.molecule_id = m.molecule_id	toxicology
SELECT COUNT(*) FROM atom WHERE element IN('c', 'h');	toxicology
SELECT T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'	toxicology
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T3.element = 'sn'	toxicology
SELECT COUNT(T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-';	toxicology
SELECT COUNT(T.atom_id) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN atom AS T4 ON T2.atom_id = T4.atom_id WHERE T3.bond_type = '#' AND (T4.element = 'p' OR T4.element = 'br') AND T2.atom_id < T2.atom_id2	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'	toxicology
SELECT m.molecule_id FROM molecule m WHERE m.label = '-' AND NOT EXISTS (SELECT 1 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.bond_type = 'single' AND b.molecule_id = m.molecule_id)	toxicology
SELECT SUM(CASE WHEN T2.element = 'cl' THEN 1 ELSE 0 END) * 100 / COUNT(T2.atom_id) AS percent FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT T2.label FROM molecule AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030'	toxicology
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'i') OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'i');	toxicology
SELECT MAX(CASE WHEN a.element = 'ca' AND m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic,         MAX(CASE WHEN a.element = 'ca' AND m.label = '-' THEN 1 ELSE 0 END) AS non_carcinogenic  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'ca';	toxicology
SELECT      bond.bond_id FROM      bond  JOIN      connected ON bond.bond_id = connected.bond_id  JOIN      atom ON connected.atom_id = atom.atom_id  WHERE      bond.bond_id = 'TR001_1_8'  AND      atom.element = 'cl'  INTERSECT  SELECT      bond.bond_id FROM      bond  JOIN      connected ON bond.bond_id = connected.bond_id  JOIN      atom ON connected.atom_id = atom.atom_id  WHERE      bond.bond_id = 'TR001_1_8'  AND      atom.element = 'c'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id JOIN atom AS T4 ON T4.atom_id = T2.atom_id WHERE T4.element = 'c' AND T3.bond_type = '#' AND T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) = 3	toxicology
SELECT CAST(SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule.molecule_id) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.molecule_id = 'TR001'	toxicology
SELECT DISTINCT T1.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '='	toxicology
SELECT T1.atom_id, T2.atom_id FROM connected AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id <> T2.atom_id AND T1.bond_id IN ( SELECT bond_id FROM bond WHERE bond_type = '#' ) ORDER BY T1.atom_id	toxicology
SELECT t2.element FROM connected AS t1 JOIN atom AS t2 ON t1.atom_id = t2.atom_id WHERE t1.bond_id = 'TR005_16_26'	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.bond_type = '-';	toxicology
SELECT T3.label FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT b.bond_id FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT COUNT(*) FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id JOIN molecule AS T4 ON T2.molecule_id = T4.molecule_id WHERE T1.atom_id = 'TR000_4' AND T3.bond_type = 's' AND T2.element = 'c'	toxicology
SELECT CAST(SUM(CASE WHEN T2.element = 'H' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) AS ratio,  CASE      WHEN (SELECT label FROM molecule WHERE molecule_id = 'TR006') = '+' THEN 'Carcinogenic'      ELSE 'Non-carcinogenic'  END AS label FROM atom AS T1 INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR006'	toxicology
SELECT CASE WHEN T3.label = '+' THEN 'The compound contains Calcium and it is carcinogenic.'             WHEN T3.label = '-' THEN 'The compound contains Calcium but it is non-carcinogenic.'             ELSE 'The compound contains Calcium but the label is not available.' END AS result  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id  WHERE T1.element = 'ca' GROUP BY T3.label	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'te'	toxicology
SELECT t3.element FROM bond AS t1  JOIN connected AS t2 ON t1.bond_id = t2.bond_id  JOIN atom AS t3 ON t2.atom_id = t3.atom_id  WHERE t1.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM molecule) FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#')	toxicology
SELECT CAST(SUM(CASE WHEN T1.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) AS percent FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.molecule_id = 'TR047'	toxicology
SELECT CASE WHEN T1.label = '+' THEN 'Yes' ELSE 'No' END AS IsCarcinogenic  FROM molecule AS T1  INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.atom_id = 'TR001_1'	toxicology
SELECT CASE WHEN T1.label = '+' THEN 'yes' ELSE 'no' END FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id LIKE 'TR151%'	toxicology
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR151' AND a.element = 'cl'	toxicology
SELECT COUNT(T1.molecule_id) AS num_carcinogenic_molecules FROM molecule AS T1 WHERE T1.label = '+'	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id BETWEEN 'TR010' AND 'TR050' AND T1.element = 'c'	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+';	toxicology
SELECT T2.bond_id FROM molecule AS T1  INNER JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id  INNER JOIN bond AS T2 ON T2.bond_id = T3.bond_id  WHERE T1.label = '+'  AND T2.bond_type = ' = '	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR00_1_2' AND EXISTS (SELECT 1 FROM connected AS T3 WHERE T3.atom_id = 'TR000_1' AND T3.bond_id = T2.bond_id)	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN atom a2 ON c1.atom_id2 = a2.atom_id WHERE a1.element = 'c' AND a2.element = 'c' EXCEPT SELECT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN atom a2 ON c1.atom_id2 = a2.atom_id JOIN molecule m ON m.molecule_id = a1.molecule_id WHERE m.label = '-' AND a1.element = 'c' AND a2.element = 'c'	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'h'	toxicology
SELECT T2.molecule_id FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T2.molecule_id = 'TR124' AND T1.label = '+'	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR007'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_2_4'	toxicology
SELECT T3.label FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.atom_id = 'TR006' AND T1.atom_id2 = 'TR006' AND T2.bond_type = '='	toxicology
SELECT T3.label FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.label = '+' AND (T1.element = 'cl' OR T1.element = 'c' OR T1.element = 'h' OR T1.element = 'o' OR T1.element = 's' OR T1.element = 'n' OR T1.element = 'p' OR T1.element = 'na' OR T1.element = 'br' OR T1.element = 'f' OR T1.element = 'i' OR T1.element = 'sn' OR T1.element = 'pb' OR T1.element = 'te' OR T1.element = 'ca')	toxicology
SELECT T2.atom_id, T2.atom_id2, T3.label FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.bond_type = '-'	toxicology
SELECT t1.label FROM molecule AS t1 JOIN connected AS t2 ON t1.molecule_id  =  t2.molecule_id JOIN atom AS t3 ON t2.atom_id  =  t3.atom_id JOIN bond AS t4 ON t2.bond_id  =  t4.bond_id WHERE t4.bond_type  =  '#' GROUP BY t1.label HAVING COUNT(DISTINCT t3.element)  =  3	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id2 = 'TR000_3' AND T2.bond_id = 'TR000_2'	toxicology
SELECT count(*) FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl'))	toxicology
SELECT atom.atom_id, COUNT(DISTINCT bond.bond_type)  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE atom.molecule_id = 'TR346'	toxicology
SELECT COUNT(T2.molecule_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' AND T2.label = '+'	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id LEFT JOIN bond AS T4 ON T2.bond_id = T4.bond_id WHERE T4.bond_type != '=' AND T3.element != 's'	toxicology
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id  =  'TR005'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT T2.molecule_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl' AND T2.label = '+'	toxicology
SELECT T3.label FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'c' GROUP BY T3.molecule_id HAVING COUNT(DISTINCT T2.atom_id) = ( SELECT COUNT(DISTINCT T2.atom_id) FROM connected AS T2 INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.label = '-' );	toxicology
SELECT CAST(SUM(CASE WHEN molecule.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'cl'	toxicology
SELECT T2.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T2.bond_id = T1.bond_id WHERE T1.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ( SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_3_4' )	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' INTERSECT SELECT bond_id FROM connected WHERE atom_id = 'TR000_2')	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR000_2' INTERSECT SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR000_4'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl'	toxicology
SELECT CAST(COUNT(bond_type) AS REAL) * 100 / COUNT(bond_id) FROM bond WHERE bond_type = '-'	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'n' AND T1.label = '+';	toxicology
SELECT T2.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 's' AND T1.bond_type = '=' GROUP BY T2.molecule_id HAVING COUNT(DISTINCT T2.atom_id) = 2	toxicology
SELECT label FROM molecule WHERE molecule_id IN (SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element != 'c' GROUP BY T1.molecule_id HAVING COUNT(T1.molecule_id) > 5 AND T1.label = '-')	toxicology
SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.atom_id IN (SELECT T1.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '=' AND T1.atom_id IN (SELECT atom_id FROM molecule WHERE molecule_id = 'TR024')) GROUP BY T2.element HAVING COUNT(T2.element) = 2	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T2.molecule_id ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT CAST(COUNT(T2.molecule_id) AS REAL) * 100.0 / COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'h' AND T4.bond_type = '#'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' AND 'TR010' EXCEPT SELECT molecule_id FROM bond WHERE bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM atom WHERE atom_id IN (SELECT atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = ' = ')) AND element = 'o'	toxicology
SELECT COUNT(m.molecule_id) FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id WHERE m.label = '-' AND b.bond_type = '#' AND c.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#'))	toxicology
SELECT T2.element ,  T3.bond_type FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T2.molecule_id = 'TR016'	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN bond b ON a1.molecule_id = b.molecule_id JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'c' AND a2.element = 'c' AND b.bond_type = '=' AND a1.molecule_id = 'TR012' AND a2.molecule_id = 'TR012'	toxicology
SELECT T.atom_id FROM (SELECT atom.atom_id FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON bond.bond_id = connected.bond_id INNER JOIN molecule ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'o') t	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL	card_games
SELECT name FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL	card_games
SELECT faceName FROM cards ORDER BY faceConvertedManaCost DESC	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank < 100 AND T1.frameVersion = '2015' AND T1.releaseDate = '2003-10-17'	card_games
SELECT T2.name FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'gladiator' AND T1.status = 'Banned' AND T2.rarity = 'mythic'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.type = 'Artifact' AND T1.side IS NULL AND T2.format = 'vintage'	card_games
SELECT T2.id, T2.artist FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.power = '*' OR T2.power IS NULL AND T1.format = 'commander' AND T1.status = 'Legal';	card_games
SELECT T2.text, T1.hasContentWarning FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Stephen Daniel'	card_games
SELECT text FROM RULINGS WHERE uuid IN ( SELECT uuid FROM cards WHERE name = 'Sublime Epiphany' AND number = '74s' )	card_games
SELECT T3.name, T3.artist, T1.isPromo FROM rulings AS T1 INNER JOIN cards AS T3 ON T1.uuid = T3.uuid WHERE T3.isPromo = 1 GROUP BY T1.uuid ORDER BY COUNT(T1.uuid) DESC LIMIT 1	card_games
SELECT t1.language FROM foreign_data AS t1 INNER JOIN cards AS t2 ON t1.uuid = t2.uuid WHERE t2.name = 'Annul' AND t2.number = '29'	card_games
SELECT DISTINCT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'japanese';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid	card_games
SELECT T3.name, T1.totalSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T2.setcode = T1.code INNER JOIN sets AS T3 ON T2.setcode = T3.code WHERE T2.language = 'Italian';	card_games
SELECT COUNT(DISTINCT T1.type) FROM cards AS T1 INNER JOIN cards_artist AS T2 ON T1.id = T2.cardId WHERE T2.artist = 'Aaron Boyd'	card_games
SELECT T2.keywords FROM cards AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT T1.promoTypes FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT originaltype FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Angel of Mercy';	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isTextless = 0	card_games
SELECT text FROM cards WHERE name = 'Condemn'	card_games
SELECT COUNT(*) FROM cards WHERE isStarter = 1 AND id IN (SELECT id FROM legalities WHERE status = 'restricted')	card_games
SELECT status FROM legalities WHERE uuid = ( SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle' );	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight'	card_games
SELECT T3.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid INNER JOIN foreign_data AS T3 ON T2.uuid = T3.uuid WHERE T1.name = 'Benalish Knight'	card_games
SELECT T2.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian' AND T2.name = 'Artist'	card_games
SELECT CAST(COUNT(CASE WHEN T2.borderColor = 'borderless' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid	card_games
SELECT COUNT(*) FROM `cards` WHERE TEXT LIKE '%German%' AND isReprint = 1	card_games
SELECT COUNT(*) FROM cards WHERE language = 'Russian' AND borderColor = 'borderless';	card_games
SELECT CAST(COUNT(CASE WHEN language = 'French' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM cards WHERE isStorySpotlight = 1	card_games
SELECT COUNT(t1.id) FROM cards AS t1 INNER JOIN cards AS t2 ON t1.id = t2.id WHERE t1.toughness = '99'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Aaron Boyd'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'	card_games
SELECT id FROM cards WHERE convertedManaCost = 0	card_games
SELECT layout FROM cards WHERE keywords LIKE '%flying%'	card_games
SELECT COUNT(uuid) FROM cards WHERE originalType = 'Summon - Angel' AND NOT subtypes LIKE '%Angel%'	card_games
SELECT DISTINCT T1.id FROM cards AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'zhCN'	card_games
SELECT * FROM cards WHERE availability = 'paper' AND language = 'Japanese';	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'	card_games
SELECT T1.uuid FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language LIKE '%language%'	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'	card_games
SELECT COUNT(T1.id), T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future'	card_games
SELECT colorIdentity FROM cards WHERE setCode = 'OGW'	card_games
SELECT T2.language, T3.translation FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T3.setCode = T1.setCode WHERE T1.setCode = '10E' AND T1.convertedManaCost = 5 AND T3.setCode IS NOT NULL	card_games
SELECT T2.date, T1.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'	card_games
SELECT colors, format FROM cards WHERE id BETWEEN 1 AND 20	card_games
SELECT T3.uuid FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode INNER JOIN foreign_data AS T3 ON T2.uuid = T3.uuid WHERE T2.originalType = 'Artifact' AND T2.colors = 'B' AND T3.language IS NOT NULL	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomId = cardKingdomFoilId	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'paper,mtgo'	card_games
SELECT SUM(T1.convertedManaCost) FROM cards AS T1 INNER JOIN FOREIGN_DATA AS T2 ON T2.uuid = T1.uuid WHERE T2.language = 'en' AND T1.artist = 'Rob Alexander'	card_games
SELECT DISTINCT T1.subtypes, T1.supertypes FROM cards AS T1 WHERE T1.availability = 'arena'	card_games
SELECT T1.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'es'	card_games
SELECT CAST(COUNT(hand = '+3') AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT CAST(SUM(IIF(T2.text IS NULL, 0, 1)) AS REAL) * 100 / COUNT(T1.id) AS p, T1.id FROM cards AS T1 INNER JOIN cards AS T2 ON T2.isStorylight = 1 INNER JOIN cards AS T3 ON T3.isStorylight = 1 AND T3.id = T1.id AND T3.isTextless = 1 GROUP BY T1.id	card_games
SELECT CAST(SUM(CASE WHEN T1.language = 'spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS Percentage, T1.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid GROUP BY T2.name	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Commander' AND T2.language = 'Portuguese (Brasil)'	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.type = 'Creature' INTERSECT SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Legal'	card_games
SELECT DISTINCT t1.type FROM cards AS t1 INNER JOIN sets AS t2 ON t1.setCode = t2.code WHERE t2.language = 'German' AND t1.subtypes IS NOT NULL AND t1.supertypes IS NOT NULL	card_games
SELECT COUNT(T1.power) FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'	card_games
SELECT count(*) FROM cards WHERE format = 'Modern' AND side IS NULL AND rulings LIKE '%This is a triggered mana ability%'	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'pauper' AND T1.artist = 'Erica Yang' AND T1.availability = 'paper'	card_games
SELECT artist FROM cards WHERE TEXT LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.layout = 'normal' AND T1.borderColor = 'black' AND T1.artist = 'Matthew D. Wilson' AND T1.type = 'Creature' AND T2.language = 'French'	card_games
SELECT COUNT(T3.date) FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T3.code = T2.setCode WHERE T2.rarity = 'rare' AND T1.date = '2009-01-10'	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.code WHERE T1.code = (SELECT code FROM sets WHERE baseSetSize = 180)	card_games
SELECT CAST(SUM(CASE WHEN hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE format = 'commander' AND status = 'legal'	card_games
SELECT CAST(SUM(CASE WHEN LOWER(T2.language) = 'french' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid	card_games
SELECT CAST(COUNT(CASE WHEN T2.language = 'Japanese' THEN T1.code ELSE NULL END) AS REAL) * 100 / COUNT(T1.code) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.code WHERE T1.type = 'expansion'	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000	card_games
SELECT COUNT(isOversized) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.multiverseId = 149934;	card_games
SELECT cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards;	card_games
SELECT number FROM cards WHERE subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%' AND faceName IS NULL	card_games
SELECT name FROM sets WHERE (mtgoCode IS NULL OR mtgoCode = '') ORDER BY name ASC LIMIT 3	card_games
SELECT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE setCode = 'ARC')	card_games
SELECT name, translation FROM sets WHERE id = 5	card_games
SELECT language, type FROM sets WHERE id = 206;	card_games
SELECT T3.code, T3.name FROM foreign_data AS T1 INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.language = 'it' AND T3.block = 'Shadowmoor' ORDER BY T3.code ASC LIMIT 2	card_games
SELECT code FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND EXISTS (SELECT 1 FROM foreign_data WHERE language = 'Japanese' AND uuid = cards.uuid)	card_games
SELECT language FROM sets WHERE baseSetSize = ( SELECT MAX(baseSetSize) FROM sets WHERE language = 'Russian' )	card_games
SELECT CAST(SUM(CASE WHEN `language` = 'Chinese Simplified' AND isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND mtgoCode IS NULL OR mtgoCode = ''	card_games
SELECT count(*) AS cnt, T1.id FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'black'	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT faceName FROM cards WHERE borderColor = 'white' AND isFullArt = 1;	card_games
SELECT language FROM sets WHERE code = '174'	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT T1.baseSetSize, T1.code FROM sets AS T1 INNER JOIN block_sets AS T2 ON T1.code = T2.set_code INNER JOIN blocks AS T3 ON T2.block_code = T3.code WHERE T3.name IN ('Masques', 'Mirage')	card_games
SELECT code FROM sets WHERE type = 'expansion'	card_games
SELECT T2.foreignName, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.uuid WHERE T1.watermark = 'boros'	card_games
SELECT language ,  flavor_text FROM cards WHERE watermark = 'colorPie'	card_games
SELECT CAST(COUNT(T2.convertedManaCost = 10) AS REAL) * 100 / COUNT(T2.convertedManaCost) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Abyssal Horror'	card_games
SELECT setCode FROM sets WHERE type = 'expansion commander'	card_games
SELECT foreign_data.name ,  cards.type FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.watermark = 'abzan'	card_games
SELECT language, TYPE FROM cards WHERE watermark = 'azorius'	card_games
SELECT COUNT(T2.id) FROM cards AS T1 INNER JOIN cards AS T2 ON T1.cardKingdomId = T2.cardKingdomId WHERE T1.artist = 'Aaron Miller' AND T2.cardKingdomFoilId = T2.cardKingdomId	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand LIKE '+%'	card_games
SELECT name FROM cards WHERE isTextless = 0	card_games
SELECT CONVERT(FLOAT, convertedManaCost) FROM cards WHERE name = 'Ancestor`s Chosen'	card_games
SELECT COUNT(id) FROM cards WHERE borderColor = 'w' AND (power = '*' OR power IS NULL);	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN cards AS T2 ON T2.side IS NOT NULL AND T2.isPromo = 1 ORDER BY T2.name	card_games
SELECT DISTINCT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.uuid WHERE T1.name = 'Molimo, Maro-Sorcerer';	card_games
SELECT T2.purchaseUrls FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT T1.artist) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.uuid WHERE T1.borderColor = 'black' AND T2.available LIKE '%arena%' AND T2.available LIKE '%mtgo%';	card_games
SELECT name FROM cards WHERE name = 'Serra Angel' OR name = 'Shrine Keeper' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor's Chosen' AND T2.language = 'Italian'	card_games
SELECT COUNT(T2.id) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy'	card_games
SELECT name FROM cards WHERE setCode = ( SELECT code FROM sets WHERE translation = 'Hauptset Zehnte Edition' )	card_games
SELECT COUNT(T2.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Korean';	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'	card_games
SELECT baseSetSize FROM sets WHERE name = 'Hauptset Zehnte Edition'	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Simplified Chinese' AND T1.name = 'Eighth Edition'	card_games
SELECT mtgoCode FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL	card_games
SELECT releaseDate FROM sets WHERE code = ( SELECT setCode FROM cards WHERE name = 'Ancestor''s Chosen' );	card_games
SELECT type FROM sets WHERE name = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE block = 'Ice Age') AND language = 'Italian'	card_games
SELECT isForeignOnly FROM sets WHERE name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(T1.name) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T2.translation IS NOT NULL AND T1.baseSetSize < 10	card_games
SELECT COUNT(id) FROM cards WHERE setCode = 'Coldsnap' AND borderColor = 'black';	card_games
SELECT name FROM cards WHERE setCode = 'COS' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT DISTINCT T2.artist FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' AND T2.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT name FROM cards WHERE setCode = 'Coldsnap' AND number = 4	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)	card_games
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian';	card_games
SELECT T1.language FROM set_translations AS T1 INNER JOIN foreign_data AS T2 ON T1.setCode = T2.setCode INNER JOIN cards AS T3 ON T3.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL;	card_games
SELECT T1.types FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.name = 'Ancestor''s Chosen'	card_games
SELECT T1.text FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T2.code = T1.setCode WHERE T2.name = 'Coldsnap' AND T1.language = 'Italian'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Italian' AND T1.setCode = 'Coldsnap' ORDER BY T1.convertedManaCost DESC	card_games
SELECT date FROM rulings WHERE name = 'Reminisce'	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN T1.cardKingdomFoilId = T1.cardKingdomId AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT T2.mcmName FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.type WHERE T1.releaseDate = '2017-06-09'	card_games
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'	card_games
SELECT parentcode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Jim Pavelec'	card_games
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'	card_games
SELECT baseSetSize FROM sets WHERE name = 'Rinascita di Alara'	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setcode WHERE T2.translation = 'Huitième édition'	card_games
SELECT DISTINCT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T2.setcode = T1.setcode WHERE T1.name = 'Tendo Ice Bridge' AND T2.language = 'French'	card_games
SELECT COUNT(T2.name) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Salvat 2011' AND T2.translation IS NOT NULL	card_games
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese'	card_games
SELECT T2.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Journey into Nyx Hero''s Path' ORDER BY T2.convertedManaCost DESC LIMIT 1	card_games
SELECT releaseDate FROM sets WHERE name = ( SELECT translation FROM set_translations WHERE language = 'english' AND setCode = 'OLA' )	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setcode = T2.code WHERE T1.name = 'Samite Pilgrim'	card_games
SELECT COUNT(T2.name) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'World Championship Decks 2004' AND T2.convertedManaCost = 3	card_games
SELECT name FROM set_translations WHERE language = 'Chinese Simplified' AND setCode IN ( SELECT code FROM sets WHERE name = 'Mirrodin' );	card_games
SELECT CAST(SUM(isNonFoilOnly = 1) AS REAL) * 100 / SUM(language = 'Japanese') FROM cards WHERE language = 'Japanese';	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE EXISTS(SELECT 1 FROM set_translations WHERE language = 'Portuguese (Brazil)' AND setCode = cards.setCode);	card_games
SELECT availability FROM cards WHERE isTextless = 1 AND artist != 'Aleksi Briclot'	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1	card_games
SELECT T2.artist FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.side IS NULL ORDER BY T1.convertedManaCost DESC LIMIT 1	card_games
SELECT T2.frameEffects FROM cards AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL	card_games
SELECT COUNT(id) FROM cards WHERE duelDeck = 'a' AND hasFoil = 0 AND (power IS NULL OR power = '*')	card_games
SELECT code FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT T1.name, T1.manaCost FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' ORDER BY CAST(REPLACE(REPLACE(manaCost, ',', ''), ' ', '') AS INTEGER) DESC LIMIT 10	card_games
SELECT DISTINCT t2.format FROM cards AS t1 INNER JOIN legalities AS t2 ON t1.uuid = t2.uuid WHERE t1.rarity = 'mythic' AND t2.status = 'legal' ORDER BY t1.originalReleaseDate ASC LIMIT 1	card_games
SELECT COUNT(*) FROM foreign_data WHERE uuid = ( SELECT uuid FROM cards WHERE artist = 'Volkan Bağa' ) AND language = 'French'	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T1.types = 'Enchantment' AND T1.name = 'Abundance' AND T2.status = 'Legal'	card_games
SELECT format, uuid FROM legalities WHERE status = 'banned' GROUP BY format ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT language FROM sets WHERE name = 'Battlebond';	card_games
SELECT T1.artist, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid GROUP BY T1.artist ORDER BY COUNT(T1.uuid) LIMIT 1	card_games
SELECT status FROM legalities WHERE uuid IN (SELECT uuid FROM cards WHERE frameVersion = '1997' AND artist = 'D. Alexander Gregory' AND hasContentWarning = 1) AND format = 'legacy'	card_games
SELECT name, T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1	card_games
SELECT COUNT(id) AS `Number Of Sets` FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'	card_games
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena'	card_games
SELECT DISTINCT T2.uuid FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'oldschool' AND T1.status = 'banned' OR T1.status = 'restricted'	card_games
SELECT COUNT(id) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T2.artist = 'Kev Walker' ORDER BY T1.date DESC	card_games
SELECT T2.name FROM sets AS T1 INNER JOIN cards AS T3 ON T1.code = T3.setCode INNER JOIN legalities AS T2 ON T3.uuid = T2.uuid WHERE T1.name = 'Hour of Devastation'	card_games
SELECT DISTINCT T2.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Korean' EXCEPT SELECT DISTINCT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language NOT LIKE '%Japanese%'	card_games
SELECT T2.frameVersion FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'banned'	card_games
SELECT DisplayName, MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon');	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014	codebase_community
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Views > 10 AND YEAR(T1.CreationDate) > 2013	codebase_community
SELECT COUNT(Id) FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT T1.OwnerDisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT T2.Title FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' ORDER BY T2.ViewCount DESC LIMIT 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(T1.CommentCount) FROM posts AS T1 INNER JOIN users AS T2 ON T2.Id = T1.OwnerUserId WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT AnswerCount FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY AnswerCount DESC LIMIT 1	codebase_community
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(T1.ParentId) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT T3.DisplayName FROM posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score >= 20 AND T2.Age > 65	codebase_community
SELECT T3.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id INNER JOIN users AS T3 ON T1.LastEditorUserId = T3.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'bayesian'	codebase_community
SELECT T1.Body FROM posts AS T1 INNER JOIN tags AS T2 ON T2.ExcerptPostId = T1.Id ORDER BY T2.Count DESC LIMIT 1	codebase_community
SELECT COUNT(T1.Name) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT DISTINCT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011	codebase_community
SELECT DisplayName FROM Users WHERE Id IN (SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1)	codebase_community
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(T2.DisplayName) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 20	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT creationDate FROM votes ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT T1.title FROM posts AS T1 INNER JOIN comments AS T2 ON T1.id = T2.postid ORDER BY T2.score DESC LIMIT 1	codebase_community
SELECT CommentCount FROM posts WHERE ViewCount = 1910	codebase_community
SELECT T1.FavoriteCount FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 3025 AND T2.CreationDate = '2014/4/23 20:29:39.0'	codebase_community
SELECT Text FROM comments WHERE PostId = ( SELECT Id FROM posts WHERE ParentId = 107829 ) LIMIT 1	codebase_community
SELECT (CASE WHEN ClosedDate IS NULL THEN 1 ELSE 0 END) AS IsWellFinished FROM posts WHERE UserId = 23853 AND CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT Reputation FROM users WHERE Id = 65041	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347	codebase_community
SELECT SUM(voteTypeId) FROM votes WHERE postId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'DatEpicCoderGuyWhoPrograms')	codebase_community
SELECT CAST(COUNT(T2.PostId) AS REAL) / COUNT(T1.PostId) FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.OwnerUserId = '24'	codebase_community
SELECT T1.ViewCount FROM posts AS T1 INNER JOIN tags AS T2 ON T2.PostId = T1.Id WHERE T1.Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT T2.Text FROM votes AS T1 INNER JOIN comments AS T2 ON T1.PostId = T2.PostId WHERE T1.Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'SilentGhost'	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'thank you user93!'	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'A Lion'	codebase_community
SELECT T3.DisplayName, T3.Reputation FROM Posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT T3.Text FROM posts AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.PostId INNER JOIN comments AS T3 ON T2.Id = T3.Id WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT T3.DisplayName FROM badges AS T1 INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT T3.LastEditorDisplayName FROM posts AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T2.LastEditorUserId = T3.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(posts.Score), users.WebsiteUrl FROM posts INNER JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny'	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'	codebase_community
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'	codebase_community
SELECT T.DisplayName FROM users AS T INNER JOIN votes AS S ON T.Id = S.UserId WHERE S.BountyAmount = 50 AND S.PostId IN ( SELECT U.Id FROM posts AS U WHERE U.Title LIKE '%variance%' )	codebase_community
SELECT AVG(t1.ViewCount), t2.Text FROM posts AS t1 INNER JOIN comments AS t2 ON t2.PostId = t1.Id WHERE t1.Tags LIKE '%humor%'	codebase_community
SELECT COUNT(Id) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT UserId FROM posts ORDER BY Views LIMIT 1	codebase_community
SELECT COUNT(DISTINCT T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Supporter' AND YEAR(T2.CreationDate) = 2011	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges GROUP BY UserId HAVING COUNT(DISTINCT Name) > 5	codebase_community
SELECT COUNT(DISTINCT U.Id) FROM users AS U INNER JOIN badges AS B1 ON U.Id = B1.UserId INNER JOIN badges AS B2 ON U.Id = B2.UserId WHERE U.Location = 'New York' AND B1.Name = 'Teacher' AND B2.Name = 'Supporter'	codebase_community
SELECT T3.Reputation FROM posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.Id = 1	codebase_community
SELECT UserId FROM postHistory GROUP BY PostId HAVING COUNT(*) = 1 AND UserId IN ( SELECT OwnerUserId FROM posts WHERE Views >= 1000 )	codebase_community
SELECT T1.UserId, T1.DisplayName FROM users AS T1 INNER JOIN ( SELECT UserId, COUNT(*) FROM comments GROUP BY UserId ORDER BY COUNT(*) DESC LIMIT 1 ) AS T2 ON T1.Id = T2.UserId	codebase_community
SELECT COUNT(T2.DisplayName) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Teacher' AND T2.Location = 'India'	codebase_community
SELECT (CAST(SUM(IIF(T2.Year = 2010, 1, 0)) AS REAL) / SUM(IIF(T2.Year = 2011, 1, 0))) * 100 - (CAST(SUM(IIF(T2.Year = 2011, 1, 0)) AS REAL) / SUM(IIF(T2.Year = 2010, 1, 0))) * 100 FROM badges AS T1 JOIN (     SELECT T1.Id, YEAR(T1.Date) AS Year     FROM badges AS T1     JOIN users AS T2 ON T1.UserId = T2.Id ) AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Student'	codebase_community
SELECT T1.PostHistoryTypeId, COUNT(DISTINCT T2.UserId) FROM postHistory AS T1 INNER JOIN comments AS T2 ON T1.PostId = T2.PostId WHERE T1.PostId = 3720 GROUP BY T1.PostHistoryTypeId	codebase_community
SELECT T2.ViewCount FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.RelatedPostId = 61217	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395	codebase_community
SELECT DISTINCT T2.PostId, T2.UserId FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score > 60	codebase_community
SELECT SUM(T1.FavoriteCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Id = 686 AND YEAR(T1.CreatioDate) = 2011	codebase_community
SELECT AVG(T1.UpVotes) ,  AVG(T2.Age) FROM users AS T1 INNER JOIN posts AS T3 ON T1.Id = T3.OwnerUserId GROUP BY T3.OwnerUserId HAVING COUNT(T3.Id) > 10	codebase_community
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Announcer'	codebase_community
SELECT T2.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:07'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10	codebase_community
SELECT DISTINCT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = ( SELECT MAX(Reputation) FROM users )	codebase_community
SELECT T2.Reputation FROM badges AS T1  INNER JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T1.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'	codebase_community
SELECT DISTINCT T1.Date FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'	codebase_community
SELECT CAST(COUNT(T2.UserId) AS REAL) * 100 / COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Teacher'	codebase_community
SELECT CAST(SUM(IIF(u.Age BETWEEN 13 AND 18, 1, 0)) AS REAL) * 100 / COUNT(u.Id) FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Organizer'	codebase_community
SELECT SUM(comments.Score) FROM comments INNER JOIN posts ON comments.PostId = posts.Id WHERE posts.CreationDate = '2010-07-19 19:19:56'	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT T3.Age FROM badges AS T1 INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Name = 'Teacher' AND T3.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T2.Id = T1.UserId WHERE T1.Name = 'Supporter' AND T2.Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(T3.Views) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T2.Id = T3.OwnerUserId WHERE T1.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(T2.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T2.Id = T1.UserId WHERE T2.Age > 65 AND T1.Name = 'Supporter'	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(Id) FROM users WHERE Location = 'New York'	codebase_community
SELECT COUNT(Id) FROM votes WHERE YEAR(CreationDate) = 2010	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS REAL) FROM votes;	codebase_community
SELECT T1.TagName FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T3.DisplayName = 'John Stauffer'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(*) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Harlan'	codebase_community
SELECT PostId FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1	codebase_community
SELECT SUM(T1.ViewCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY T2.DisplayName ORDER BY SUM(T1.ViewCount) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerDisplayName = 'Matt Parker' AND T2.VoteTypeId = 1 GROUP BY T1.OwnerDisplayName HAVING COUNT(*) > 4	codebase_community
SELECT COUNT(T1.Id) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T3.DisplayName = 'Neil McGuigan' AND T1.Score < 60	codebase_community
SELECT DISTINCT T1.TagName FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id INNER JOIN posts AS T4 ON T4.Id = T3.Id LEFT JOIN comments AS T5 ON T5.PostId = T4.Id WHERE T3.DisplayName = 'Mark Meckes' AND T5.Id IS NULL	codebase_community
SELECT DISTINCT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'	codebase_community
SELECT CAST(COUNT(CASE WHEN T2.TagName = 'r' THEN T1.PostId ELSE NULL END) AS REAL) * 100 / COUNT(T1.PostId) FROM posts AS T1 INNER JOIN post_tags AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerDisplayName = 'Community'	codebase_community
SELECT SUM(T2.ViewCount) - SUM(T1.ViewCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName IN ('Mornington', 'Amos')	codebase_community
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Commentator' AND STRFTIME('%Y', T1.Date) = '2014'	codebase_community
SELECT COUNT(Id) FROM posts WHERE DATE(CreationDate) = '2010-07-21';	codebase_community
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60	codebase_community
SELECT T3.Title, T4.UserDisplayName FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN posts AS T3 ON T1.PostId = T3.Id INNER JOIN users AS T4 ON T1.UserId = T4.Id WHERE T1.Score > 60	codebase_community
SELECT T3.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T2.Id = T3.OwnerUserId WHERE T2.Location = 'North Pole' AND YEAR(T1.Date) = 2011	codebase_community
SELECT T1.DisplayName, T1.WebsiteUrl FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.FavoriteCount > 150	codebase_community
SELECT COUNT(PostHistoryTypeId) AS post_history_count, MAX(LastEditDate) AS last_edit_date FROM postHistory WHERE Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT T1.LastAccessDate, T1.Location FROM users AS T1 INNER JOIN badges AS T2 ON T1.id = T2.userId WHERE T2.Name = 'Outliers'	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN post_links AS T2 ON T1.Id = T2.RelatedPostId WHERE T2.LinkTypeId = 3 AND T1.Title LIKE '%How%to%tell%if%something%happened%in%a%data%set%which%monitors%a%value%over%time%'	codebase_community
SELECT T1.PostId, T2.Name FROM Posts AS T1 INNER JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE YEAR(T1.CreationDate) = 2013 INNER JOIN users AS T3 ON T2.UserId = T3.Id WHERE T3.UserDisplayName = 'Samuel'	codebase_community
SELECT T1.OwnerDisplayName FROM posts AS T1 ORDER BY T1.ViewCount DESC LIMIT 1	codebase_community
SELECT T1.DisplayName, T1.Location FROM users AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.TagName = 'hypothesis-testing'	codebase_community
SELECT T2.Title, T2.LinkTypeId FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId = ( SELECT Id FROM posts WHERE Title = 'What are principal component scores?' )	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ParentId IS NOT NULL AND T1.Score = ( SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL )	codebase_community
SELECT T2.DisplayName, T2.WebsiteUrl FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.VoteTypeId = 8 ORDER BY T1.BountyAmount DESC LIMIT 1	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId ORDER BY T1.ViewCount DESC LIMIT 5	codebase_community
SELECT count(*) FROM tags WHERE Count BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = ( SELECT MAX(FavoriteCount) FROM posts )	codebase_community
SELECT Age FROM users WHERE Id = (SELECT OwnerUserId FROM (SELECT OwnerUserId, COUNT(*) as Reputation FROM posts GROUP BY OwnerUserId ORDER BY Reputation DESC LIMIT 1))	codebase_community
SELECT COUNT(*) FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE YEAR(T2.CreationDate) = 2011 AND T1.BountyAmount = 50	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1	codebase_community
SELECT p.Score FROM posts p JOIN ( SELECT T.TagName, COUNT(T.TagName) AS TagCount FROM posts_tags pt JOIN tags T ON pt.TagId = T.Id GROUP BY T.TagName ORDER BY TagCount DESC LIMIT 1 ) AS pt ON p.Id = pt.PostId ORDER BY p.ViewCount DESC LIMIT 1	codebase_community
SELECT CAST(COUNT(T1.Id) AS REAL) / 12 FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE STRFTIME('%Y', T2.CreationDate) = '2010' AND T2.AnswerCount <= 2	codebase_community
SELECT T1.Id FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.UserId = 1465 ORDER BY T2.FavoriteCount DESC LIMIT 1	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId ORDER BY T2.CreationDate LIMIT 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId GROUP BY T1.Id ORDER BY COUNT(T2.Name) DESC LIMIT 1	codebase_community
SELECT MIN(T3.CreationDate) FROM users AS T1 INNER JOIN votes AS T3 ON T1.Id = T3.UserId WHERE T1.DisplayName = 'chl'	codebase_community
SELECT MIN(T1.CreationDate) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Autobiographer' ORDER BY T1.Date ASC LIMIT 1	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location = 'United Kingdom' AND T2.FavoriteCount >= 4	codebase_community
SELECT AVG(votes.PostId) FROM votes WHERE votes.UserId IN (SELECT users.Id FROM users ORDER BY users.Age DESC LIMIT 1);	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age >= 19 AND Age <= 65	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Jay Stevens' AND YEAR(T1.CreationDate) = 2010	codebase_community
SELECT id, title FROM posts WHERE owner_user_id = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT T1.Id, T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id ORDER BY T1.Score DESC LIMIT 1	codebase_community
SELECT AVG(t1.Score) FROM posts AS t1 INNER JOIN users AS t2 ON t1.OwnerUserId = t2.Id WHERE t2.DisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.PostId IN ( SELECT Id FROM posts WHERE ViewCount > 20000 AND YEAR(CreationDate) = 2011 )	codebase_community
SELECT T3.OwnerDisplayName FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE YEAR(T1.CreationDate) = 2010 ORDER BY T2.FavoriteCount DESC LIMIT 1	codebase_community
SELECT CAST(SUM(IIF(DATE(T1.CreationDate) = '2011-01-01' AND T2.Reputation > 1000, 1, 0)) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id	codebase_community
SELECT CAST(COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM users	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Computer Game Datasets' ORDER BY T2.LastActivityDate DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)	codebase_community
SELECT COUNT(Id) FROM comments WHERE PostId = ( SELECT PostId FROM posts WHERE Score = ( SELECT MAX(Score) FROM posts ) )	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT DisplayName, Location FROM users WHERE Id = ( SELECT LastEditorUserId FROM posts WHERE Id = 183 ) ORDER BY LastEditDate DESC LIMIT 1	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Emmett' ORDER BY T1.Date DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT U.Id) FROM users U INNER JOIN posts P ON U.Id = P.OwnerUserId WHERE U.Age BETWEEN 19 AND 65 AND P.UpVotes > 5000	codebase_community
SELECT julianday(T2.Date) - julianday(T1.CreationDate) FROM users AS T1 INNER JOIN badges AS T2 ON T2.UserId = T1.Id WHERE T1.DisplayName = 'Zolomon'	codebase_community
SELECT COUNT(T1.Id), COUNT(T2.Id) FROM posts AS T1 LEFT JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId = ( SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1 )	codebase_community
SELECT T3.Text, T2.UserDisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId INNER JOIN postHistory AS T3 ON T2.PostId = T3.PostId WHERE T1.Title = 'Analysing wind data with R' ORDER BY T2.CreationDate DESC LIMIT 1	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE tags LIKE '%<careers>%'	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(CASE WHEN T1.PostTypeId = 1 THEN 1 ELSE NULL END) AS AnswerCount, COUNT(CASE WHEN T1.PostTypeId = 2 THEN 1 ELSE NULL END) AS CommentCount FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(T1.PostId) FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.BountyAmount >= 30	codebase_community
SELECT CAST(SUM(CASE WHEN Score >= 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(stats_posts.Id) FROM posts AS stats_posts INNER JOIN users ON stats_posts.OwnerUserId = users.Id WHERE users.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u WHERE u.Id = (SELECT c.UserId FROM comments c WHERE c.Text = 'fine, you win :)' LIMIT 1)	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'How can I adapt ANOVA for binary data?'	codebase_community
SELECT Text, MAX(Score) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount BETWEEN 100 AND 150)	codebase_community
SELECT T1.CreationDate, T1.Age FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE '%http://%'	codebase_community
SELECT COUNT(T3.PostId) FROM comments AS T1 INNER JOIN posts AS T3 ON T1.PostId = T3.Id WHERE T1.Score = 0 AND T3.ViewCount < 5	codebase_community
SELECT COUNT(T2.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CommentCount = 1 AND T2.Score = 0	codebase_community
SELECT COUNT(DISTINCT T2.accountid) FROM comments AS T1 INNER JOIN users AS T2 ON T1.userid = T2.id WHERE T1.Score = 0 AND T2.age = 40	codebase_community
SELECT T1.Id, T2.Id FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT T3.UpVotes FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Text LIKE 'R is also lazy evaluated'	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky'	codebase_community
SELECT DISTINCT T1.DisplayName FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.DownVotes = 0 AND T2.Score BETWEEN 1 AND 5	codebase_community
SELECT CAST(COUNT(CASE WHEN T1.Score BETWEEN 5 AND 10 THEN T2.UpVotes ELSE NULL END) AS REAL) / COUNT(T1.UserId) FROM comments AS T1 INNER JOIN votes AS T2 ON T1.UserId = T2.UserId WHERE T2.UpVotes = 0 AND T1.Score BETWEEN 5 AND 10	codebase_community
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND power_name = 'Super Strength'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T2.hero_id) > 15	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 2;	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.eye_colour_id = ( SELECT id FROM colour WHERE colour = 'Blue' ) AND T3.power_name = 'Agility'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Blond'	superhero
SELECT COUNT(T1.superhero_name) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT full_name FROM superhero WHERE height_cm = ( SELECT MAX(height_cm) FROM superhero ) AND publisher_name = 'Marvel Comics';	superhero
SELECT T4.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T1.superhero_name = 'Sauron';	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T2.publisher_name = 'Marvel Comics' AND T3.colour = 'Blue'	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_id = 1	superhero
SELECT CAST(SUM(CASE WHEN T1.power_name = 'Super Strength' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.power_id) FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id INNER JOIN publisher AS T4 ON T3.publisher_id = T4.id WHERE T4.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(id) FROM superhero WHERE publisher_name = 'DC Comics'	superhero
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Speed' ORDER BY T3.attribute_value ASC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T2.publisher_name = 'Marvel Comics' AND T3.colour = 'Gold'	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero INNER JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond'	superhero
SELECT T2.superhero_name, T3.attribute_value FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T3.attribute_value ASC LIMIT 1	superhero
SELECT T3.race FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN race AS T3 ON T3.id = T1.race_id WHERE T1.superhero_name = 'Copycat'	superhero
SELECT COUNT(hero_id) FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T2.attribute_name = 'Durability' AND T1.attribute_value < 50	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' AND T2.attribute_value = 100 AND T1.gender_id = ( SELECT id FROM gender WHERE gender = 'Female' )	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(*) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
SELECT CAST(SUM(CASE WHEN T2.alignment_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) AS percentage, COUNT(CASE WHEN T2.publisher_id = 1 THEN 1 ELSE 0 END) AS marvel_comics_count FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id	superhero
SELECT sum(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - sum(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id	superhero
SELECT publisher_id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(T2.attribute_value) FROM hero_attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.hero_id = T2.hero_id	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Deathlok'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'	superhero
SELECT power_name FROM superpower WHERE power_name IN ( SELECT power_name FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.gender_id = 1 ) GROUP BY power_name LIMIT 5	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id != 1	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56	superhero
SELECT DISTINCT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5	superhero
SELECT COUNT(id) FROM superhero WHERE alignment_id = 2	superhero
SELECT race_id FROM superhero WHERE weight_kg = 169	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.race = 'human' AND T1.height_cm = 185	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN T1.publisher_id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) FROM superhero) * 0.79	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id GROUP BY T1.power_name ORDER BY COUNT(T1.power_name) DESC LIMIT 1	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 1	superhero
SELECT COUNT(T1.hero_id) FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'stealth'	superhero
SELECT full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T3.attribute_name = 'strength' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(T1.id) / COUNT(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'N/A'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics' ) AND T3.attribute_name = 'durability' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT T1.eye_colour_id FROM superhero AS T1 INNER JOIN colour AS T2 ON T2.id = T1.eye_colour_id WHERE T1.full_name = 'Abraham Sapien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight';	superhero
SELECT T3.colour, T4.colour, T5.colour FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id INNER JOIN colour AS T4 ON T1.hair_colour_id = T4.id INNER JOIN colour AS T5 ON T1.skin_colour_id = T5.id INNER JOIN publisher AS T6 ON T1.publisher_id = T6.id WHERE T2.gender = 'Female' AND T6.publisher_name = 'Dark Horse Comics'	superhero
SELECT T1.superhero_name, T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN T1.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.gender_id) FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.gender_id = 1	superhero
SELECT T1.superhero_name, T3.race FROM superhero AS T1 INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT T2.gender FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'	superhero
SELECT COUNT(p.power_id) FROM superpower AS p INNER JOIN hero_power AS hp ON p.id = hp.power_id INNER JOIN superhero AS s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo';	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T1.colour = 'Gold'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'	superhero
SELECT T2.superhero_name FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T1.alignment = 'Neutral'	superhero
SELECT COUNT(T2.hero_id) FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id WHERE T1.attribute_name = 'Strength' AND T2.attribute_value = ( SELECT MAX(T4.attribute_value) FROM attribute AS T3 INNER JOIN hero_attribute AS T4 ON T3.id = T4.attribute_id WHERE T3.attribute_name = 'Strength' )	superhero
SELECT T2.race, T2.alignment FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT ( SELECT SUM(T2.weight_kg) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.full_name = 'Emil Blonsky' ) - ( SELECT SUM(T2.weight_kg) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.full_name = 'Charles Chandler' )	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T1.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(superhero.id) FROM superhero WHERE superhero.alignment_id = 3	superhero
SELECT T3.attribute_name, T4.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id INNER JOIN superpower AS T4 ON T1.id = T4.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.id = 7 AND T3.id = 9	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1	superhero
SELECT CAST(COUNT(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) FROM superhero	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id ORDER BY T1.height_cm DESC LIMIT 1	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T1.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188;	superhero
SELECT publisher_name FROM publisher WHERE id = ( SELECT publisher_id FROM superhero WHERE id = 38 );	superhero
SELECT T.race FROM ( SELECT T2.race, SUM(T1.attribute_value) AS t FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' GROUP BY T2.race ORDER BY t DESC LIMIT 1 ) t	superhero
SELECT T.alignment, GROUP_CONCAT(DISTINCT S.power_name) AS superhero_name FROM superhero AS T INNER JOIN hero_power AS H ON T.id = H.hero_id INNER JOIN superpower AS S ON H.power_id = S.id WHERE T.superhero_name = 'Atom IV' AND T.alignment_id = 1	superhero
SELECT full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5	superhero
SELECT AVG(T2.attribute_value) FROM alignment AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id WHERE T1.alignment_id = 3	superhero
SELECT T3.colour FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN colour AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Intelligence' AND T1.attribute_value = 100	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T1.alignment_id = 1 AND T3.id = 2	superhero
SELECT T.superhero_name FROM superhero AS T INNER JOIN hero_attribute AS S ON T.id = S.hero_id WHERE S.attribute_value BETWEEN 75 AND 80	superhero
SELECT race.race FROM superhero INNER JOIN colour ON superhero.hair_colour_id = colour.id INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN race ON superhero.race_id = race.id WHERE gender.gender = 'male' AND colour.colour = 'blue'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.alignment_id) AS percentage FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Bad'	superhero
SELECT SUM(T1.id = 7) - SUM(T1.id = 1) FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.weight_kg = 0 OR T2.weight_kg IS NULL	superhero
SELECT T3.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Ajax'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T3.colour = 'Green' AND T2.alignment = 'Bad'	superhero
SELECT COUNT(superhero_name) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND T2.publisher_name = 'Marvel Comics'	superhero
SELECT T2.superhero_name FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN superpower AS T3 ON T1.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T2.superhero_name	superhero
SELECT T1.gender_name FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T4.id = T3.power_id WHERE T4.power_name = 'Phoenix Force'	superhero
SELECT T2.superhero_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'DC Comics' ORDER BY T2.weight_kg DESC LIMIT 1	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.race_id != 1 AND T2.publisher_name = 'Dark Horse Comics'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' AND T2.attribute_value = 100	superhero
SELECT ( SELECT COUNT(*) FROM superhero WHERE publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'DC Comics' ) ) - ( SELECT COUNT(*) FROM superhero WHERE publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' ) ) AS diff	superhero
SELECT T2.attribute_name FROM superhero AS T1 INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id INNER JOIN attribute AS T2 ON T2.id = T3.attribute_id WHERE T1.superhero_name = 'Black Panther' ORDER BY T3.attribute_value ASC LIMIT 1	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id JOIN gender AS g ON s.gender_id = g.id WHERE p.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN T2.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT T2.hero_id FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id ORDER BY T2.attribute_value LIMIT 1	superhero
SELECT T2.full_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T1.superhero_name = 'Alien'	superhero
SELECT T3.full_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T1.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = 3 AND attribute_value < 100 )	superhero
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T2.superhero_name = 'Aquababy'	superhero
SELECT weight_kg, race FROM superhero WHERE id = 40;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT T1.hero_id FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Blackwulf'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.height_cm > 0.8 * (SELECT AVG(height_cm) FROM superhero)	superhero
SELECT T.driverRef FROM ( SELECT T1.raceId, T2.driverRef FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.position = 1 AND T1.raceId = 18 UNION ALL SELECT T1.raceId, T2.driverRef FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.positionText = 'Disqualified' AND T1.raceId = 18 ORDER BY T1.position ASC LIMIT 5 ) AS T	formula_1
SELECT T2.surname FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19 AND T1.q2 != 'null' ORDER BY T1.q2 ASC LIMIT 1	formula_1
SELECT T2.year FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.location = 'Shanghai'	formula_1
SELECT url FROM races WHERE name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T3.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId INNER JOIN seasons AS T3 ON T1.year = T3.year WHERE T2.country = 'Germany'	formula_1
SELECT T2.position FROM constructors AS T1 INNER JOIN circuits AS T2 ON T1.constructorRef = T2.circuitRef WHERE T1.name = 'Renault'	formula_1
SELECT COUNT(T1.raceId) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND (T2.country NOT IN ('China', 'Singapore', 'South Korea', 'Japan', 'India') OR T2.country NOT LIKE '%USA%' OR T2.country NOT LIKE '%Germany%' OR T2.country NOT LIKE '%United Kingdom%')	formula_1
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Spain'	formula_1
SELECT lat, lng FROM circuits WHERE country = 'Australia'	formula_1
SELECT T2.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.circuitRef = 'sepang'	formula_1
SELECT time FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix';	formula_1
SELECT T3.country FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId INNER JOIN circuits AS T3 ON T2.nationality = T3.country WHERE T1.raceId = 24	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = (SELECT raceId FROM qualifying WHERE round = 354)	formula_1
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 355 AND T1.q2 = '0:01:40'	formula_1
SELECT T1.number FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q3 = '0:01:54' AND T2.raceId = 903	formula_1
SELECT COUNT(T2.driverId) AS num_not_finished FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Bahrain Grand Prix' AND T1.year = 2007 AND T2.time IS NULL	formula_1
SELECT T1.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE YEAR = 2015 AND date = '2015-11-29' AND time IS NOT NULL)	formula_1
SELECT T1.forename, T1.surname, T1.dob FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.position = 1 AND T2.raceId = 592 ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT T1.url FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.time = '0:01:27' AND T2.raceId = 161	formula_1
SELECT T3.nationality FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T3.driverId = T1.driverId WHERE T2.raceId = 933 ORDER BY CAST(T1.fastestLapSpeed AS REAL) DESC LIMIT 1	formula_1
SELECT lat, lng FROM circuits WHERE country = 'Malaysia'	formula_1
SELECT url FROM constructors ORDER BY points DESC LIMIT 1	formula_1
SELECT q1 FROM qualifying WHERE raceId = ( SELECT raceId FROM races WHERE round = 345 ) AND driverId = ( SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi' )	formula_1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 347 AND T2.Q2 = '0:01:15';	formula_1
SELECT T2.code FROM races AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN qualifying AS T3 ON T1.raceId = T3.raceId WHERE T1.raceId = 45 AND T3.q3 = '0:01:33'	formula_1
SELECT T1.time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceId = 743	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 2 AND T2.raceid = (SELECT raceid FROM races WHERE name = 'San Marino Grand Prix' AND year = 2006)	formula_1
SELECT T3.year FROM races AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN seasons AS T3 ON T1.year = T3.year WHERE T1.raceId = 901	formula_1
SELECT COUNT(T2.position) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.date = '2015-11-29'	formula_1
SELECT T3.dob FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.raceId = 872 AND T2.time IS NOT NULL ORDER BY T3.dob ASC LIMIT 1	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 348 ORDER BY T1.time LIMIT 1	formula_1
SELECT T3.nationality FROM results AS T1 INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.raceId = ( SELECT raceId FROM results WHERE fastestLapSpeed = ( SELECT MAX(fastestLapSpeed) FROM results ) )	formula_1
SELECT ( SELECT T1.fastestLapSpeed - T2.fastestLapSpeed FROM results AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId + 1 WHERE T2.raceId = 853 ORDER BY T2.fastestLapSpeed ASC LIMIT 1 ) * 100 / ( SELECT fastestLapSpeed FROM results WHERE raceId = 853 )	formula_1
SELECT CAST(COUNT(DISTINCT CASE WHEN time IS NOT NULL THEN driverId ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN date = '1983-07-16' THEN driverId ELSE NULL END) FROM races WHERE date = '1983-07-16'	formula_1
SELECT MIN(year) FROM races	formula_1
SELECT COUNT(raceId) FROM races WHERE year = 2005 ORDER BY name DESC	formula_1
SELECT T2.name, T2.month, T2.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = ( SELECT MIN(date) FROM races WHERE STRFTIME('%Y-%m', date) = ( SELECT STRFTIME('%Y-%m', date) FROM races ORDER BY date LIMIT 1 ) ) AND STRFTIME('%Y-%m', T2.date) IN ( SELECT STRFTIME('%Y-%m', date) FROM races WHERE STRFTIME('%Y-%m', date) = ( SELECT STRFTIME('%Y-%m', date) FROM races ORDER BY date LIMIT 1 ) )	formula_1
SELECT T2.name ,  T2.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 1999 ORDER BY T1.round DESC LIMIT 1	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(raceId) DESC LIMIT 1	formula_1
SELECT T1.name FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.year = 2017 EXCEPT SELECT T1.name FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.year = 2017 INTERSECT SELECT T1.name FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.year = 2000	formula_1
SELECT T2.name, T2.location FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = ( SELECT min(year) FROM races WHERE country IN ( SELECT country FROM races WHERE country LIKE 'Europe%' ))	formula_1
SELECT T1.year FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.name = 'British Grand Prix' ORDER BY T1.year DESC LIMIT 1	formula_1
SELECT COUNT(DISTINCT T1.year) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'British Grand Prix' AND T2.country = 'United Kingdom'	formula_1
SELECT T3.forename, T3.surname FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.name = 'Singapore Grand Prix' AND T2.year = 2010 ORDER BY T1.position	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname, T2.points FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = ( SELECT raceId FROM races WHERE year = 2017 AND name = 'Chinese Grand Prix' ) ORDER BY T2.points DESC LIMIT 3	formula_1
SELECT t1.driverId, t1.raceId FROM lapTimes AS t1 INNER JOIN races AS t2 ON t1.raceId = t2.raceId WHERE t1.time = (SELECT MIN(time) FROM lapTimes)	formula_1
SELECT AVG(T2.time) FROM results AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.raceId = ( SELECT raceId FROM races WHERE year = 2009 AND name = 'Chinese Grand Prix' ) AND T3.forename = 'Sebastian' AND T3.surname = 'Vettel'	formula_1
SELECT CAST(SUM(CASE WHEN driver.surname = 'Hamilton' THEN CASE WHEN position <= 1 THEN 0 ELSE 1 END ELSE 0 END) AS REAL) * 100 / COUNT(race.raceId) AS percentage FROM races AS race INNER JOIN results AS result ON result.raceId = race.raceId INNER JOIN drivers AS driver ON result.driverId = driver.driverId WHERE race.year >= 2010	formula_1
SELECT T1.nationality, AVG(T2.points) FROM drivers AS T1 INNER JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T2.wins = ( SELECT MAX(wins) FROM driverStandings )	formula_1
SELECT substr(CAST(strftime('%J', dob) - strftime('%J', '2000-01-01') AS REAL) / 365, 1) FROM drivers WHERE nationality = 'Japanese' ORDER BY dob LIMIT 1	formula_1
SELECT T1.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year BETWEEN 1990 AND 2000 GROUP BY T1.circuitId HAVING COUNT(T2.raceId) = 4	formula_1
SELECT T2.name, T2.location, T3.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId INNER JOIN seasons AS T3 ON T1.year = T3.year WHERE T2.country = 'USA' AND T1.year = 2006	formula_1
SELECT DISTINCT T1.name, T2.name, T2.location FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2005 AND T1.month = 9	formula_1
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Alex' AND T3.surname = 'Yoong' AND T1.position < 10	formula_1
SELECT COUNT(T2.raceId) FROM driverStandings AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId INNER JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T3.name = 'Sepang International Circuit' AND T4.forename = 'Michael' AND T4.surname = 'Schumacher' AND T1.points = ( SELECT MAX(points) FROM driverStandings WHERE driverId = T1.driverId );	formula_1
SELECT T2.name AS race, T2.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' AND T1.fastestLap IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T3.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T3.year = 2000	formula_1
SELECT T1.year, T3.name, T3.points FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T1.year LIMIT 1	formula_1
SELECT T2.name ,  T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId  =  T2.circuitId WHERE T1.year  =  2017 ORDER BY T1.date	formula_1
SELECT T1.name, T1.year, T3.location FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T3.circuitId = T1.circuitId GROUP BY T1.name, T1.year, T3.location ORDER BY COUNT(T2.laps) DESC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T2.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.raceId) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits ORDER BY lat DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT T3.country FROM races AS T1 INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId ORDER BY T3.alt DESC LIMIT 1	formula_1
SELECT COUNT(driverId) FROM drivers WHERE code IS NULL	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian'	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT name FROM circuits WHERE circuitId = (SELECT circuitId FROM races WHERE name = 'Spanish Grand Prix' AND year = 2009);	formula_1
SELECT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit'	formula_1
SELECT T2.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.circuitId = ( SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit' )	formula_1
SELECT time FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Abu Dhabi Circuit') AND year = 2010	formula_1
SELECT COUNT(*) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy'	formula_1
SELECT T2.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T2.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'	formula_1
SELECT T2.fastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY CAST(T1.fastestLapTime AS REAL) ASC LIMIT 1	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapSpeed = (SELECT MAX(T3.fastestLapSpeed) FROM results AS T3)	formula_1
SELECT T2.driverRef FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 ORDER BY T2.position LIMIT 1	formula_1
SELECT name FROM races WHERE raceId IN (SELECT raceId FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'))	formula_1
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId = ( SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' ) ORDER BY T1.rank LIMIT 1	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009	formula_1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T1.positionOrder FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.name LIKE 'Australian Grand Prix %' AND T3.forename LIKE 'Lewis%' AND T3.surname LIKE 'Hamilton%' AND T2.year = 2008 ORDER BY T1.positionOrder DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.grid = 4 AND T2.raceId IN ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' )	formula_1
SELECT COUNT(T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T1.time IS NOT NULL	formula_1
SELECT T1.milliseconds FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T3.year = 2008 AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.milliseconds LIMIT 1	formula_1
SELECT T2.time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.position = 2 AND T1.raceId IN ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' )	formula_1
SELECT T1.forename, T1.surname, T1.url FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Australian Grand Prix' AND YEAR(T3.date) = 2008 AND T2.position = 1	formula_1
SELECT COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId INNER JOIN se	formula_1
SELECT COUNT(T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time IS NOT NULL AND T2.year = 2008	formula_1
SELECT SUM(T1.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT avg(T2.fastestLapTime) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT COUNT(T1.raceId) * 100.0 / COUNT(T2.raceId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = '2008 Australian Grand Prix' AND T1.time IS NOT NULL	formula_1
SELECT ((julianday(T2.time) - julianday(T1.time)) * 100.0 / julianday(T3.time)) AS 'percentage difference', T3.forename AS 'Last driver', T2.forename AS 'Champion' FROM results AS T1 INNER JOIN results AS T2 ON T2.raceId = 101 AND T2.position = 1 INNER JOIN results AS T3 ON T3.raceId = 101 ORDER BY T3.position DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne'	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(surname) FROM drivers WHERE nationality = 'British' AND YEAR(dob) > 1980	formula_1
SELECT AVG(T1.points) FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'British'	formula_1
SELECT T2.name FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT DISTINCT T1.name FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0	formula_1
SELECT COUNT(T1.constructorId) FROM constructors AS T1 INNER JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Japanese' AND T2.points = 0 AND T2.raceId IN (SELECT raceId FROM races WHERE year = 2021 LIMIT 2)	formula_1
SELECT T2.name FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.position = 1	formula_1
SELECT COUNT(*) FROM constructors AS t1 INNER JOIN results AS t2 ON t1.constructorId = t2.constructorId WHERE t1.nationality = 'French' AND t2.laps > 50	formula_1
SELECT CAST(COUNT(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.time) FROM races AS T1 INNER JOIN results AS T2 ON T2.raceId = T1.raceId WHERE T2.driverId IN (SELECT T1.driverId FROM drivers AS T1 INNER JOIN results AS T2 ON T2.driverId = T1.driverId INNER JOIN races AS T3 ON T3.raceId = T2.raceId WHERE T3.year BETWEEN 2007 AND 2009 AND T1.nationality = 'Japanese')	formula_1
SELECT T3.year, AVG(T1.time) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.code LIKE 'HAM' GROUP BY T3.year	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE strftime('%Y', T1.dob) > 1975 AND T2.position = 2	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND time IS NULL	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId ORDER BY T2.time LIMIT 1	formula_1
SELECT T1.fastestLap FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.year = 2009 AND T1.positionOrder = 1	formula_1
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT T2.year, T1.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN year(dob) < 1985 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM drivers WHERE driverId IN (SELECT DISTINCT driverId FROM lapTimes WHERE raceId IN (SELECT raceId FROM races WHERE year BETWEEN 2000 AND 2005));	formula_1
SELECT COUNT(T1.constructorId) FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId INNER JOIN races AS T4 ON T1.raceId = T4.raceId WHERE T2.nationality = 'French' AND T1.statusId = 1 AND T1.time < '0:2:00'	formula_1
SELECT code FROM drivers WHERE nationality = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18	formula_1
SELECT TOP 3 d.number, d.dob, d.nationality FROM drivers d ORDER BY d.dob DESC	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Kubica'	formula_1
SELECT COUNT(number) FROM drivers WHERE nationality = 'Australia' AND YEAR(dob) = 1980	formula_1
SELECT T1.forename, T1.surname, T2.time FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.laps = ( SELECT min(laps) FROM lapTimes WHERE T2.driverId = driverId ) AND T1.dob BETWEEN '1980-01-01' AND '1990-12-31' AND T1.nationality = 'Germany' GROUP BY T1.driverId ORDER BY T2.time LIMIT 3	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT T1.driverId, T1.code FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE STRFTIME('%Y', T1.dob) = '1971' ORDER BY T2.fastestLapTime DESC LIMIT 1	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverId WHERE T2.nationality = 'Spain' AND strftime('%Y', T2.dob) < 1982 AND T1.time = ( SELECT MAX(time) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverId WHERE T2.nationality = 'Spain' AND strftime('%Y', T2.dob) < 1982 ) ORDER BY T1.time DESC LIMIT 10	formula_1
SELECT year FROM races WHERE fastestLapTime IS NOT NULL ORDER BY fastestLapTime DESC LIMIT 1	formula_1
SELECT year FROM results ORDER BY time DESC LIMIT 1	formula_1
SELECT driverId FROM ( SELECT T2.driverId, T2.fastestLapTime, ROW_NUMBER() OVER (ORDER BY T2.fastestLapTime ASC) AS RowNum FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId ORDER BY T1.raceId ) WHERE RowNum <= 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 51 AND 99 AND statusId = 2	formula_1
SELECT COUNT(T1.circuitId) ,  T1.lat ,  T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T2.circuitId = T1.circuitId WHERE T1.country = 'Austria' AND T2.year = 2000	formula_1
SELECT MAX(t3.raceId) AS t4, COUNT(t1.position) AS t5 FROM results AS t1 INNER JOIN seasons AS t2 ON t1.raceId = t2.year INNER JOIN races AS t3 ON t1.raceId = t3.raceId WHERE t1.time IS NOT NULL GROUP BY t1.raceId ORDER BY t5 DESC LIMIT 1	formula_1
SELECT T2.driverRef, T2.nationality, T2.dob FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.position = 2 AND T1.raceId = 23	formula_1
SELECT T1.year, T2.forename, T2.surname, T3.name FROM races AS T1 INNER JOIN qualifying AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.dob = ( SELECT max(T2.dob) FROM drivers AS T2 )	formula_1
SELECT COUNT(T2.driverId) FROM status AS T1 INNER JOIN results AS T2 ON T1.statusId = T2.statusId WHERE T1.status = 'Disqualified'	formula_1
SELECT T3.url FROM constructors AS T1 INNER JOIN results AS T2 ON T2.constructorId = T1.constructorId INNER JOIN circuits AS T3 ON T3.circuitId = T2.raceId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT T1.url FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId GROUP BY T1.constructorId ORDER BY SUM(T2.wins) DESC LIMIT 1	formula_1
SELECT T2.forename ,  T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId  =  T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.name = 'French Grand Prix' AND T3.round = 3 AND T1.time IS NOT NULL ORDER BY T1.time ASC LIMIT 1	formula_1
SELECT T2.raceId, T2.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.position = 1 ORDER BY T1.fastestLapTime LIMIT 1	formula_1
SELECT AVG(T2.fastestLapTime) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T1.year = 2006 AND T3.country = 'United States' AND T1.name = 'United States Grand Prix' ORDER BY T2.rank LIMIT 10	formula_1
SELECT T1.forename, T1.surname, T1.dob, AVG(T3.milliseconds)  FROM drivers AS T1  JOIN lapTimes AS T2 ON T1.driverId = T2.driverId  JOIN pitStops AS T3 ON T2.raceId = T3.raceId  WHERE T1.nationality = 'German'  AND T1.dob BETWEEN 1980 AND 1985  GROUP BY T1.driverId  ORDER BY AVG(T3.milliseconds)  LIMIT 5;	formula_1
SELECT T.name ,  T3.time FROM drivers AS T INNER JOIN results AS T1 ON T.driverId = T1.driverId INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T1.positionOrder = 1 AND T2.year = 2008 AND T3.country = 'Canada';	formula_1
SELECT T2.constructorRef FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId IN (SELECT raceId FROM races WHERE year = 2009) ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT T1.forename ,  T1.surname ,  T1.dob FROM drivers AS T1 INNER JOIN races AS T2 ON T2.driverId = T1.driverId WHERE T1.nationality = 'Austrian' AND strftime('%Y', T1.dob) BETWEEN '1981' AND '1991'	formula_1
SELECT T2.forename, T2.surname, T2.url, T2.dob FROM constructors AS T1 INNER JOIN drivers AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'German' AND strftime('%Y', T2.dob) BETWEEN '1971' AND '1985' ORDER BY T2.dob DESC	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'	formula_1
SELECT T3.points, T2.name, T2.nationality FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.name = 'Monaco Grand Prix' AND T3.year BETWEEN 1980 AND 2010 ORDER BY T3.year DESC LIMIT 1	formula_1
SELECT AVG(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T2.driverId = T1.driverId WHERE T1.nationality = 'Turkey' AND T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT AVG(COUNT(raceId)) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY strftime('%Y', date)	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY count(*) DESC LIMIT 1	formula_1
SELECT wins FROM driverStandings WHERE position = 91	formula_1
SELECT name FROM races WHERE raceId IN (SELECT raceId FROM results WHERE fastestLapSpeed = (SELECT MIN(fastestLapSpeed) FROM results))	formula_1
SELECT T2.location ,  T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId  =  T2.circuitId ORDER BY T1.date DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN qualifying AS T3 ON T2.raceId = T3.raceId INNER JOIN circuits AS T4 ON T3.raceId = T4.circuitId WHERE T3.raceId = (SELECT T1.raceId FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 ORDER BY T1.position LIMIT 1) AND T4.circuitRef = 'marina_bay_street_circuit' ORDER BY T2.position LIMIT 1	formula_1
SELECT T1.forename, T1.surname, T1.nationality, T2.name FROM drivers AS T1 INNER JOIN races AS T2 ON T1.driverId = T2.driverId ORDER BY T1.dob LIMIT 1	formula_1
SELECT COUNT(*) FROM results WHERE raceId IN ( SELECT raceId FROM races WHERE name LIKE 'Canadian Grand Prix%' ) AND driverId IN ( SELECT driverId FROM results WHERE statusId = 3 ORDER BY COUNT(statusId) DESC LIMIT 1 );	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 WHERE T1.dob = ( SELECT MIN(dob) FROM drivers )	formula_1
SELECT MAX(T2.duration) FROM races AS T1 INNER JOIN pitStops AS T2 ON T1.raceId = T2.raceId	formula_1
SELECT time FROM lapTimes WHERE raceId IN ( SELECT raceId FROM races ) ORDER BY CAST(REPLACE(REPLACE(time, ':', '.'), '.', '') AS REAL) ASC LIMIT 1	formula_1
SELECT T2.duration FROM pitstops AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId = 3 ORDER BY T2.fastestLapTime DESC LIMIT 1	formula_1
SELECT T3.lap FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN pitstops AS T3 ON T3.raceId = T2.raceId WHERE T1.driverId = 1 AND T2.name = 'Australian Grand Prix' AND T1.year = 2011	formula_1
SELECT T1.forename, T1.surname, SUM(T2.duration) FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = ( SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix' ) GROUP BY T1.driverId	formula_1
SELECT T1.time FROM lapTimes AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.time LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId ORDER BY T2.time LIMIT 1	formula_1
SELECT T3.position FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.time LIMIT 1	formula_1
SELECT MIN(time) FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE name = 'Austrian Grand Prix Circuit')	formula_1
SELECT T1.raceId, T1.driverId, T1.time FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.country = 'Italy'	formula_1
SELECT races.name FROM races INNER JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime = ( SELECT fastestLapTime FROM results WHERE raceId IN ( SELECT raceId FROM races WHERE name = 'Austrian Grand Prix Circuit' ) ORDER BY fastestLapTime ASC LIMIT 1 )	formula_1
SELECT T1.milliseconds / 1000 FROM pitStops AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.lap = 1 AND T3.nationality = 'Austrian' AND T2.name = 'Austrian Grand Prix Circuit';	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN results AS T2 ON T1.circuitId = T2.circuitId WHERE T2.time = '1:29.488'	formula_1
SELECT AVG(T1.milliseconds) FROM pitStops AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT AVG(T1.milliseconds) FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.country = 'Italy'	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT T1.height, T2.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.id = T2.player_fifa_api_id ORDER BY T1.height DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) AND attacking_work_rate = 'medium'	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'	european_football_2
SELECT T1.player_fifa_api_id FROM Player_attributes AS T1 INNER JOIN player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.crossing DESC LIMIT 5	european_football_2
SELECT league_id FROM Match WHERE season = '2016/2017' GROUP BY league_id ORDER BY SUM(home_team_goal + away_team_goal) DESC LIMIT 1	european_football_2
SELECT `home_team_api_id` FROM Match WHERE `season` = '2016/2016' AND (`home_team_goal` - `away_team_goal`) < 0 GROUP BY `home_team_api_id` ORDER BY COUNT(`home_team_api_id`) ASC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.penalties DESC LIMIT 10	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.league_id = ( SELECT id FROM League WHERE name = 'Scotland Premier League' ) AND T2.season = '2009/2010' AND T2.away_team_goal - T2.home_team_goal > 0 ORDER BY T2.away_team_goal - T2.home_team_goal DESC LIMIT 1	european_football_2
SELECT T3.buildUpPlaySpeed FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id OR T1.team_api_id = T2.away_team_api_id INNER JOIN Team_Attributes AS T3 ON T1.team_fifa_api_id = T3.team_fifa_api_id GROUP BY T3.buildUpPlaySpeed ORDER BY COUNT(T3.buildUpPlaySpeed) DESC LIMIT 4	european_football_2
SELECT L.name FROM League AS L JOIN Match AS M ON L.id = M.league_id WHERE M.season = '2016/2016' GROUP BY L.id ORDER BY COUNT(M.id) - COUNT(CASE WHEN M.home_team_goal = M.away_team_goal THEN 1 END) DESC LIMIT 1	european_football_2
SELECT T2.birthday, (julianday('now') - julianday(T2.birthday)) / 365.25 - 13 FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.sprint_speed >= 97 AND T1.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY COUNT(T2.league_id) DESC LIMIT 1	european_football_2
SELECT AVG(T1.height) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.birthday >= '1990-01-01 00:00:00' AND T1.birthday < '1996-01-01 00:00:00'	european_football_2
SELECT T2.player_api_id FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.date) = '2010' ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59	european_football_2
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE STRFTIME('%Y', T1.date) = '2012' AND T2.team_long_name IN ( SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE STRFTIME('%Y', T1.date) = '2012' GROUP BY T2.team_long_name HAVING SUM(T1.buildUpPlayPassing) / COUNT(T2.team_long_name) >= ( SELECT AVG(buildUpPlayPassing) FROM Player_Attributes ) )	european_football_2
SELECT CAST(SUM(CASE WHEN T1.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_fifa_api_id) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE SUBSTR(T2.birthday, 1, 4) BETWEEN 1987 AND 1992	european_football_2
SELECT T1.name FROM Country AS T1 JOIN Match AS T2 ON T1.id = T2.country_id GROUP BY T2.country_id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) ASC LIMIT 5	european_football_2
SELECT AVG(T2.long_shots) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ahmed Samir Farag'	european_football_2
SELECT player_name FROM Player ORDER BY heading_accuracy DESC LIMIT 10	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id OR T1.team_api_id = T2.away_team_api_id JOIN Team_Attributes AS T3 ON T1.team_api_id = T3.team_api_id WHERE T3.date > = '2014-01-01 00:00:00' AND T3.date < = '2014-12-31 00:00:00' AND T3.buildUpPlayDribblingClass = 'Normal' AND T2.chanceCreationPassing < ( SELECT AVG(T3.chanceCreationPassing) FROM Team_Attributes AS T3 WHERE T3.date > = '2014-01-01 00:00:00' AND T3.date < = '2014-12-31 00:00:00' AND T3.buildUpPlayDribblingClass = 'Normal' ) ORDER BY T2.chanceCreationPassing DESC	european_football_2
SELECT T1.name FROM league AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2009/2010' GROUP BY T1.name HAVING AVG(T2.home_team_goal) > AVG(T2.away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE substr(T1.birthday, 1, 4) = '1970' AND substr(T1.birthday, 6, 2) = '10'	european_football_2
SELECT T3.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Player AS T3 ON T2.player_fifa_api_id = T3.player_fifa_api_id WHERE T1.player_name = 'Franco Zennaro'	european_football_2
SELECT AVG(buildUpPlayPositioningClass) FROM Team t1 JOIN Team_Attributes t2 ON t1.team_api_id = t2.team_api_id WHERE t1.team_long_name = 'ADO Den Haag'	european_football_2
SELECT T2.heading_accuracy FROM Match AS T1 INNER JOIN Player_Attributes AS T2 ON T2.player_api_id = T1.home_player_1 WHERE T2.player_name = 'Francois Affolter' AND T1.date = '2014-09-18 00:00:00'	european_football_2
SELECT T1.overall_rating FROM Player_attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.date LIKE '2011-%' AND T2.player_name = 'Gabriel Tamas'	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' AND T2.name = 'Scotland Premier League'	european_football_2
SELECT preferred_foot FROM Player_Attributes ORDER BY date LIMIT 1	european_football_2
SELECT * FROM Player_Attributes ORDER BY potential DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson'	european_football_2
SELECT T2.birthday FROM Player_attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT name FROM League WHERE country_id = ( SELECT id FROM Country WHERE name = 'Netherlands' )	european_football_2
SELECT AVG(T1.home_team_goal) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.finishing DESC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.height > 180	european_football_2
SELECT count(*) FROM Player WHERE strftime('%Y', birthday) = '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT T3.player_name FROM Player_Attributes AS T1 JOIN Player AS T3 ON T1.player_api_id = T3.player_api_id WHERE T1.overall_rating > 80 AND STRFTIME('%Y', T1.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT potential FROM Player_Attributes WHERE player_name = "Aaron Doran"	european_football_2
SELECT player_name FROM Player WHERE preferred_foot = 'left'	european_football_2
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'CLB'	european_football_2
SELECT T2.team_short_name FROM Team_attributes AS T1 INNER JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlayPassing > 70	european_football_2
SELECT avg(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.date) BETWEEN '2010' AND '2015' AND T2.height > 170	european_football_2
SELECT height FROM Player ORDER BY height ASC LIMIT 1	european_football_2
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10'	european_football_2
SELECT team_short_name FROM team WHERE team_api_id IN (SELECT home_team_api_id FROM match WHERE home_team_goal = 10);	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = 61 ORDER BY T2.balance DESC LIMIT 1	european_football_2
SELECT AVG(ball_control) - AVG(ball_control) FROM Player_Attributes WHERE player_name = 'Abdou Diallo' AND player_name = 'Aaron Appindangoye'	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT T1.player_name FROM Player AS T1 WHERE T1.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(T1.id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'left' AND T2.attacking_work_rate = 'low'	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League'	european_football_2
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany'	european_football_2
SELECT T1.player_name FROM player AS T1 INNER JOIN player_attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_attributes WHERE SUBSTR(birthday, 1, 4) < '1986' AND defensive_work_rate = 'high'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.crossing = ( SELECT MAX(crossing) FROM Player_Attributes );	european_football_2
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id WHERE T2.player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE player_api_id IN ( SELECT player_api_id FROM Player WHERE height > 180 ) AND volleys > 70	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.volleys > 70 AND T1.dribbling > 70	european_football_2
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009';	european_football_2
SELECT T1.long_passing FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.birthday IN ( SELECT MAX(birthday) FROM Player )	european_football_2
SELECT COUNT(match_api_id) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND STRFTIME('%Y', date) = '2009' AND STRFTIME('%m', date) = '04'	european_football_2
SELECT league_id FROM Match WHERE season = '2008/2009' GROUP BY league_id ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT CAST(SUM(T1.overall_rating) AS REAL) / COUNT(T1.id) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE STRFTIME('%Y', T2.birthday) < '1986'	european_football_2
SELECT CAST(T2.overall_rating - T1.overall_rating AS REAL) * 100 / T1.overall_rating FROM Player_attributes AS T1 INNER JOIN Player_attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk' AND T2.player_name = 'Paulin Puel'	european_football_2
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T2.crossing) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Lennox'	european_football_2
SELECT T2.chanceCreationPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T2.team_api_id = T1.team_api_id WHERE T1.team_long_name = 'Ajax' ORDER BY T2.chanceCreationPassing DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo'	european_football_2
SELECT MAX(T1.overall_rating) FROM Player_attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(T2.away_team_goal) FROM Country AS T1 INNER JOIN Match AS T2 ON T1.id = T2.country_id INNER JOIN Team AS T3 ON T3.team_api_id = T2.away_team_api_id WHERE T3.team_long_name = 'Parma' AND T1.name = 'Italy'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Mooy' AND T2.date = '2016-02-04 00:00:00';	european_football_2
SELECT potential FROM Player_Attributes WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date = '2015-05-01 00:00:00'	european_football_2
SELECT T1.defensive_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Berigaud' AND T1.date = '2013-02-22 00:00:00'	european_football_2
SELECT T1.date FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Constant' ORDER BY T1.crossing DESC LIMIT 1	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2012-02-22 00:00:00'	european_football_2
SELECT T2.buildUpPlayDribblingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date = '2010-02-22'	european_football_2
SELECT T2.chance_creation_passing_class FROM Team AS T1 JOIN Team_Attributes AS T2 ON T2.team_api_id = T1.team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'	european_football_2
SELECT T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.date = '2010-02-22 00:00:00' AND T2.team_long_name = 'Hull City';	european_football_2
SELECT t1.defence_aggression_class FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date = '2015-09-10 00:00:00'	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Marko Arnautovic') AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'	european_football_2
SELECT CAST(SUM(CASE WHEN T2.date = '2013-07-12' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name IN ('Landon Donovan', 'Jordan Bowery')	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) > 34	european_football_2
SELECT home_team_goal FROM Match WHERE home_player_1 = (SELECT id FROM Player WHERE player_name = 'Aaron Lennon')	european_football_2
SELECT T1.away_team_goal FROM Match AS T1 INNER JOIN Player AS T2 ON T1.away_player_1 = T2.player_api_id OR T1.away_player_2 = T2.player_api_id OR T1.away_player_3 = T2.player_api_id OR T1.away_player_4 = T2.player_api_id OR T1.away_player_5 = T2.player_api_id OR T1.away_player_6 = T2.player_api_id OR T1.away_player_7 = T2.player_api_id OR T1.away_player_8 = T2.player_api_id OR T1.away_player_9 = T2.player_api_id OR T1.away_player_10 = T2.player_api_id OR T1.away_player_11 = T2.player_api_id WHERE T2.player_name = 'Daan Smith' OR T2.player_name = 'Filipe Ferreira'	european_football_2
SELECT SUM(T1.home_team_goal) FROM Match AS T1 INNER JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id WHERE T2.birthday + INTERVAL (30 YEAR) > CURRENT_TIMESTAMP	european_football_2
SELECT player_name FROM Player WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 10)	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T2.potential DESC LIMIT 1	european_football_2
SELECT DISTINCT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.attacking_work_rate = 'high'	european_football_2
SELECT player_name FROM Player WHERE finishing = 1 ORDER BY (JULIANDAY(CURRENT_TIMESTAMP) - JULIANDAY(birthday)) DESC LIMIT 1	european_football_2
SELECT DISTINCT T1.player_name FROM player AS T1 INNER JOIN country AS T2 ON T1.birthday = T2.id WHERE T2.name = 'Belgium'	european_football_2
SELECT T1.country_name FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id WHERE T2.vision > 89	european_football_2
SELECT T3.name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Country AS T3 ON T2.birthday LIKE REPLACE(T3.name, ' ', '%') || '%' GROUP BY T3.name ORDER BY AVG(T2.weight) DESC LIMIT 1	european_football_2
SELECT team_long_name FROM Team_Attributes WHERE buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(height) FROM Player WHERE country_id = (SELECT id FROM Country WHERE name = "Italy")	european_football_2
SELECT T3.player_name FROM player_attributes AS T1 JOIN player AS T3 ON T1.player_fifa_api_id = T3.player_fifa_api_id WHERE T1.height > 180 ORDER BY T3.player_name ASC LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT jumping FROM Player WHERE id = 23 - jumping WHERE id = 6	european_football_2
SELECT player_fifa_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 3	european_football_2
SELECT COUNT(player_api_id) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = ( SELECT MAX(crossing) FROM Player_Attributes )	european_football_2
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM Player) FROM Player WHERE strength > 80 AND stamina > 80	european_football_2
SELECT T2.name FROM `Match` AS T1 INNER JOIN Country AS T2 ON T2.id = T1.country_id WHERE T1.league_id = ( SELECT id FROM League WHERE name = 'Poland Ekstraklasa' )	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%'	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player_Attributes WHERE player_name = 'Alexis Blin'	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Serie A')	european_football_2
SELECT home_team_goal FROM Match WHERE match_api_id IN (SELECT match_api_id FROM Team WHERE team_short_name = 'AZ Alkmaar' AND home_team_goal IS NOT NULL AND season = '2007/2008')	european_football_2
SELECT finishing ,  curve FROM Player ORDER BY weight DESC LIMIT 1	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T1.league_id ORDER BY COUNT(T1.id) DESC LIMIT 1	european_football_2
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id GROUP BY T1.away_team_api_id ORDER BY SUM(T1.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T2.player_name FROM player_attributes AS T1 JOIN player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1	european_football_2
SELECT CAST(COUNT(CASE WHEN height < 180 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(player_fifa_api_id) FROM player_attributes	european_football_2
SELECT IFNULL(SUM(IIF(`Admission` = '+', 1, 0)), 0) - IFNULL(SUM(IIF(`Admission` = '-', 1, 0)), 0) AS DeviationPercentage FROM `Patient` WHERE `SEX` = 'M'	thrombosis_prediction
SELECT COUNT(*) * 100 / SUM(IIF(SUBSTR(Birthday, 1, 4) > '1930', 1, 0)) FROM Patient WHERE SEX = 'F';	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN `First Date` IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE strftime('%Y', Birthday) BETWEEN '1930' AND '1940' AND Admission = '+';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis, T2.Date FROM Patient AS T1 INNER JOIN Examination AS T3 ON T1.ID = T3.ID INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609	thrombosis_prediction
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 163109	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500	thrombosis_prediction
SELECT T2.ID ,  DATEDIFF(YEAR, T2.Birthday, GETDATE()) AS age FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RVVT = '+'	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T3.ID = T2.ID WHERE T1.Birthday LIKE '1937%' AND T3.`T-CHO` >= 250	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB < 3.5	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T1.SEX = 'F' THEN 1 ELSE NULL END) * 100.0 / COUNT(T1.SEX) AS REAL) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE (T2.TP < 6 OR T2.TP > 8.5);	thrombosis_prediction
SELECT AVG(T2.`aCL IgG`) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE SUBTRACT(year(CURRENT_TIMESTAMP), year(T1.Birthday)) >= '50' AND T1.Admission = '+'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND YEAR(T1.Description) = '1997' AND T2.Admission = '-'	thrombosis_prediction
SELECT SUBSTR(T2.`First Date`, 1, 4) - SUBSTR(T1.Birthday, 1, 4) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` = ( SELECT MIN(`First Date`) FROM Examination )	thrombosis_prediction
SELECT SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) FROM Patient AS P INNER JOIN Examination AS E ON P.ID = E.ID WHERE YEAR(E.`Examination Date`) = 1997 AND E.Thrombosis = 1	thrombosis_prediction
SELECT SUBTRACT(MAX(T2.Description) - MIN(T2.Description)) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.tg >= 200	thrombosis_prediction
SELECT T3.SYMPTOMS, T3.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T1.BIRTHDAY = ( SELECT MIN(BIRTHDAY) FROM Patient )	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT T1.ID) AS REAL) / 12 FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` BETWEEN '1998-01-01' AND '1998-12-31' AND T1.SEX = 'M';	thrombosis_prediction
SELECT T2.`Examination Date`, DATEDIFF(year, T2.`First Date`, T2.Birthday)  FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' ORDER BY T2.`Examination Date` DESC LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN `SEX` = 'M' THEN CASE WHEN UA <= 8 THEN 1 ELSE 0 END ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN `SEX` = 'F' THEN CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END ELSE 0 END) AS REAL) FROM `Laboratory`	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 LEFT JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ID IS NULL OR SUBTRACT(YEAR(T2.`Examination Date`), YEAR(T1.`First Date`)) >= 1	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P INNER JOIN Examination AS E ON P.ID = E.ID WHERE P.Birthday BETWEEN DATE('1990-01-01') AND DATE('1993-12-31') AND DATE('1990-01-01') <= E.`Examination Date` AND E.`Examination Date` <= DATE('1993-12-31')	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-BIL` > 2	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE ID IN (SELECT ID FROM Laboratory WHERE Date BETWEEN '1985-01-01' AND '1995-12-31') GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(strftime('%Y', Birthday)) FROM Patient WHERE ID IN (SELECT Patient.ID FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.`Examination Date` BETWEEN '1991-10-01' AND '1991-10-30')	thrombosis_prediction
SELECT T1.Birthday, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.HGB = ( SELECT MAX(T2.HGB) FROM Examination AS T2 )	thrombosis_prediction
SELECT `aCL ANA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN TG > 250 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE Date = '1995-09-04' AND ID = 2927464;	thrombosis_prediction
SELECT T2.SEX FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'AORTITIS' ORDER BY T1.`Examination Date` ASC LIMIT 1	thrombosis_prediction
SELECT T2.`aCL IgM` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.`Examination Date` = '1994-02-19' INNER JOIN Laboratory AS T3 ON T3.ID = T2.ID WHERE T3.`Examination Date` = '1993-11-12'	thrombosis_prediction
SELECT T2.SEX FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT = 9 AND T1.`Date` = '1992-06-12'	thrombosis_prediction
SELECT T2.`Birthday` FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1991-10-21' AND T1.UA = 8.4	thrombosis_prediction
SELECT COUNT(T3.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'SJS' AND T1.`First Date` = '1991-06-13' AND T3.Date = '1995'	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` = '1997-01-27' AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT T1.Symptoms FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.`Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN MONTH(Date) = 11 THEN `T-CHO` END) - SUM(CASE WHEN MONTH(Date) = 12 THEN `T-CHO` END) AS REAL) / SUM(CASE WHEN MONTH(Date) BETWEEN 11 AND 12 THEN `T-CHO` END) * 100 AS DecreaseRate FROM Laboratory WHERE ID = (SELECT ID FROM Patient WHERE Birthday = '1959-02-18')	thrombosis_prediction
SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%Behcet%' AND T2.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T1.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T3.ALB < 4 AND T3.GPT > 30	thrombosis_prediction
SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND YEAR(T1.Birthday) = 1964 AND T1.Admission = '+'	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 2 AND T1.`ANA Pattern` = 'S' AND T1.`aCL IgM` > AVG(T1.`aCL IgM`)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID WHERE `U-PRO` > 0 AND `U-PRO` < 30	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' THEN 1 ELSE 0 END) FILTER (WHERE T1.`FIRST DATE` LIKE '1981%' AND T2.Diagnosis = 'BEHCET') AS REAL) * 100 / CAST(SUM(CASE WHEN T1.SEX = 'M' THEN 1 ELSE 0 END) FILTER (WHERE T1.`FIRST DATE` LIKE '1981%') AS REAL) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT T2.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Admission = '-' AND T3.`Date` LIKE '1991-10%' AND T3.`T-BIL` < 2	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND ID IN (SELECT ID FROM Examination WHERE `ANA Pattern` != 'P')	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123	thrombosis_prediction
SELECT AVG(ALB) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T1.SEX = 'F' AND T3.PLT > 400 AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT symptoms FROM Patient WHERE diagnosis = 'SLE' GROUP BY symptoms ORDER BY COUNT(symptoms) DESC LIMIT 1	thrombosis_prediction
SELECT T1.Description, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE YEAR(T2.`Examination Date`) = 1997 AND T3.TP > 6 AND T3.TP < 8.5	thrombosis_prediction
SELECT CAST(SUM(IIF(Symptoms LIKE '%ITP%', 1, 0)) AS REAL) * 100 / COUNT(ID) AS percentage_of_patients_with_ITP_and_SLE FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Diagnosis LIKE '%SLE%');	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN strftime('%Y', Patient.Birthday) = '1980' AND Patient.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Patient.ID) FROM Patient WHERE Patient.Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` BETWEEN '1995' AND '1997' AND T2.SEX = 'M' AND T1.Diagnosis = 'BEHCET';	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.WBC < 3.5 AND T1.SEX = 'F'	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM Patient WHERE ID = 821298;	thrombosis_prediction
SELECT CASE WHEN T1.SEX = 'M' AND T1.UA > 8.0 THEN 'Yes' ELSE 'No' END AS IsNormal FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 57266	thrombosis_prediction
SELECT T1.`Examination Date` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.ID = '48473' AND T3.GOT >= 60	thrombosis_prediction
SELECT T1.SEX ,  T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T2.Date) = '1994' AND T2.GOT < 60	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GPT >= 60	thrombosis_prediction
SELECT T1.diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.Birthday	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT T2.ID ,  T2.Birthday ,  (STRFTIME('%Y', 'now') - STRFTIME('%Y', T2.Birthday)) AS age FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`LDH` > 600 AND T1.`LDH` < 800	thrombosis_prediction
SELECT CASE WHEN T2.Admission = '+' THEN 'inpatient' ELSE 'outpatient' END AS InOut FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ALP < 300	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' AND T2.ALP < 300	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` < 6.0	thrombosis_prediction
SELECT CAST(SUM(TP - 8.5) AS REAL) / COUNT(TP) AS deviation FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE SEX = 'F' AND TP > 8.5	thrombosis_prediction
SELECT Patient.ID FROM Patient LEFT JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.ALB <= 3.5 OR Laboratory.ALB >= 5.5 ORDER BY Patient.Birthday DESC	thrombosis_prediction
SELECT CASE WHEN T2.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) = 1982	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN UA > 8.0 AND SEX = 'F' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM Patient	thrombosis_prediction
SELECT AVG(T2.UA) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND T2.UA < 8.0) OR (T1.SEX = 'F' AND T2.UA < 6.5)	thrombosis_prediction
SELECT ID, SEX, Birthday FROM Patient WHERE UN = 29	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'RA' AND T2.UN < 30	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CRE >= 1.5	thrombosis_prediction
SELECT CASE WHEN SUM(IIF(P.SEX = 'M' AND L.CRE >= 1.5, 1, 0)) > SUM(IIF(P.SEX = 'F' AND L.CRE >= 1.5, 1, 0)) THEN 1 ELSE 0 END AS Answer FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE L.CRE >= 1	thrombosis_prediction
SELECT T1.ID ,  T1.SEX ,  T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID ORDER BY T2.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT SEX, COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE `T-BIL` >= 2 GROUP BY SEX	thrombosis_prediction
SELECT T1.ID, T2.`T-CHO` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.birthday = ( SELECT MIN(birthday) FROM Patient ) ORDER BY T2.`T-CHO` DESC LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(JULIANDAY('now') - JULIANDAY(T2.birthday)) AS REAL) / COUNT(T2.ID) AS avg_age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-CHO` >= 250	thrombosis_prediction
SELECT T2.diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.id = T2.id WHERE T1.TG > 300	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T3.TG >= 200 AND T1.Birthday < DATE_SUB(CURDATE(), INTERVAL 50 YEAR)	thrombosis_prediction
SELECT DISTINCT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND YEAR(T1.Birthday) BETWEEN 1936 AND 1956 AND T2.CPK >= 250	thrombosis_prediction
SELECT T2.ID, T2.SEX, TIMESTAMPDIFF(YEAR, T2.Birthday, CURDATE()) AS age FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GLU >= 180 AND T1.`T-CHO` < 250	thrombosis_prediction
SELECT T2.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` >= DATE('1991-01-01') AND T2.GLU < 180	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.WBC <= 3.5 OR T1.WBC >= 9.0 ORDER BY T2.Birthday	thrombosis_prediction
SELECT T1.ID, T1.age FROM ( SELECT T3.ID, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T2.Birthday) AS age FROM Patient AS T1 INNER JOIN Examination AS T3 ON T1.ID = T3.ID ) AS T1 WHERE T1.age IS NOT NULL AND T1.age <> '' ORDER BY T1.RBC	thrombosis_prediction
SELECT T2.Admission FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.RBC < 3.5 OR T2.RBC > 6.0 AND DATE_SUB(CURRENT_DATE, INTERVAL 50 YEAR) <= T1.Birthday	thrombosis_prediction
SELECT T2.ID, T2.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '-' AND T2.HGB < 10	thrombosis_prediction
SELECT ID, SEX FROM Patient WHERE Diagnosis = 'SLE' AND HGB BETWEEN 10 AND 17 ORDER BY Birthday ASC LIMIT 1	thrombosis_prediction
SELECT T1.ID, T2.HCT FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T2.ID HAVING COUNT(T1.ID) > 1	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE DATE LIKE '1991%' AND HCT < 29	thrombosis_prediction
SELECT CASE WHEN PLT < 100 THEN 'Platelet level lower than normal range' ELSE 'Platelet level higher than normal range' END AS Platelet_Level, COUNT(*) AS Number_of_Patients FROM Laboratory GROUP BY Platelet_Level ORDER BY Number_of_Patients DESC;	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday <= DATE_SUB('1984-01-01', INTERVAL 50 YEAR) AND T2.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T1.Birthday < date('now','-55 years') THEN T1.ID ELSE NULL END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.PT >= 14 AND T1.SEX = 'F'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.PT < 14 AND T2.`First Date` > 1992	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.APTT > 45 AND T2.Thrombosis = 3	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND T2.FG NOT BETWEEN 150 AND 450	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND T2.FG BETWEEN 150 AND 450	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.`U-PRO` >= 30	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` BETWEEN 1 AND 30 AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Ig G` < 900 AND T1.Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(ID) FROM Examination WHERE ID IN (SELECT ID FROM Patient WHERE `First Date` IS NOT NULL AND SEX IS NOT NULL) AND `aCL IgG` BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`aCL IgA` BETWEEN 80 AND 500 ORDER BY T1.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`IGA` BETWEEN 80 AND 500 AND YEAR(T1.`First Date`) >= 1990	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgM` NOT BETWEEN 40 AND 400 GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description IS NULL AND T2.CRP NOT LIKE '+' AND T2.CRP NOT LIKE '-' AND T2.CRP >= 1.0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.CRP NOT IN ('+-', '-') AND T3.CRP >= 1 AND T1.`Birthday` IS NOT NULL AND DATEDIFF(YEAR(CURDATE()), YEAR(T1.`Birthday`)) < 18	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.RA IN ('-', '+-') AND T1.KCT = '+'	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) >= '1995' AND T2.RA = '-';	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RF = 'normal' AND YEAR(CURRENT_DATE) - YEAR(T1.Birthday) > 60	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND T2.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` = 'P' AND T2.C3 > 35	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` BETWEEN 29 AND 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Thrombosis = 1 AND T3.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RNP = '+-' AND T1.Admission = '+'	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Symptoms` LIKE '%normal anti-SM%' AND `Thrombosis` = 1	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SM NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 3	thrombosis_prediction
SELECT DISTINCT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Female' AND T2.`Examination Date` >= '1997-01-01' AND T2.SC170 IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT T.ID) FROM Patient AS T INNER JOIN Examination AS E ON T.ID = E.ID WHERE T.SEX = 'M' AND E.SC170 IN ('-', '+-') AND E.Symptoms = 'vertigo'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`SSA` IN ('-', '+-') AND YEAR(T1.`First Date`) < 1990	thrombosis_prediction
SELECT ID FROM Patient WHERE ID IN ( SELECT ID FROM Patient WHERE `First Date` ORDER BY `First Date` ASC LIMIT 1 ) AND ID IN ( SELECT ID FROM Laboratory WHERE SSA NOT IN ( '-', '+-' ) )	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SSB IN ('-', '+-') AND Examination.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('-', '+-') AND T2.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`CENTROMEA` IN ('-', '+-') AND T2.SSB IN ('-', '+-')	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T3.ID = T1.ID WHERE T3.DNA >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Description IS NULL AND T1.Description IS NOT NULL	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.`DNA-II` < 8 AND T1.Admission = '+';	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T1.`GOT` >= 60 THEN T2.ID ELSE NULL END) AS REAL) * 100 / COUNT(T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T2.ID = T1.ID WHERE T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.SEX = 'M' AND T3.GOT < 60	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE GOT >= 60) ORDER BY Birthday ASC LIMIT 1)	thrombosis_prediction
SELECT T2.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID IN (SELECT ID FROM Laboratory WHERE GPT < 60 ORDER BY GPT DESC LIMIT 3)	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT < 60) AND SEX = 'M'	thrombosis_prediction
SELECT T1.`First Date` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T2.`LDH` DESC LIMIT 1	thrombosis_prediction
SELECT MAX(`First Date`) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE LDH >= 500);	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ALP >= 300 AND T1.Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE ADMISSION = '-' AND ALP < 300	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SJS' AND T2.`TP` BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT `Examination Date` FROM Examination WHERE `aCL IgA` > 3.5 AND `aCL IgA` < 5.5 ORDER BY `Examination Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Laboratory WHERE ALB BETWEEN 3.5 AND 5.5 AND TP BETWEEN 6.0 AND 8.5)	thrombosis_prediction
SELECT T2.`aCL IgG`, T2.`aCL IgM`, T2.`aCL IgA` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.UA > 6.50 ORDER BY T2.UA DESC LIMIT 1	thrombosis_prediction
SELECT MAX(T1.ANA) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5	thrombosis_prediction
SELECT ID FROM Patient WHERE ID IN (SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` = (SELECT MAX(aCL IgA) FROM Examination)) AND T1.CRE < 1.5	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID IN ( SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` >= 2.0 ) AND T2.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT T1.`ANA IgA` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN ( SELECT `T-BIL` FROM Laboratory AS T3 INNER JOIN Patient AS T4 ON T3.ID = T4.ID ORDER BY `T-BIL` LIMIT 1 ) AS T5 ON T1.ID = T5.ID ORDER BY T2.ADMISSION DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.`T-CHO` >= 250 AND T1.KCT = '-'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID IN ( SELECT ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` < 250 ) AND T2.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 AND T2.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 0 AND T2.CRE < 250	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.CPK < 250 AND T2.KCT LIKE '+' OR T2.RVVT LIKE '+' OR T2.LAC LIKE '+'	thrombosis_prediction
SELECT MIN(T2.Date) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GLU > 180	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GLU < 180 AND T2.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.Admission = '+' AND T3.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Diagnosis = 'SLE' INTERSECT SELECT COUNT(*) FROM Patient AS T2 INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T3.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Admission = '-' AND (T3.RBC <= 3.5 OR T3.RBC >= 6.0)	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE PLT BETWEEN 100 AND 400 ) AND Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT L.PLT FROM Laboratory AS L INNER JOIN Examination AS E ON L.ID = E.ID WHERE L.PLT BETWEEN 100 AND 400 AND E.Diagnosis = 'MCTD'	thrombosis_prediction
SELECT AVG(T.PT) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.SEX = 'M' AND T3.PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis IN (1, 2) AND T2.PT < 14	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering'	student_club
SELECT first_name, last_name FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE department = 'Art and Design' AND college = 'Arts')	student_club
SELECT COUNT(T2.member_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T2.link_to_event = T1.event_id WHERE T1.event_name = 'Women''s Soccer'	student_club
SELECT DISTINCT T1.phone FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer'	student_club
SELECT COUNT(*) FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.major_id IN ( SELECT T1.major_id FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.department = 'Student_Club' ) GROUP BY T1.event_name ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President' AND T2.major_name = 'Student Club'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T3.member_id = T2.link_to_member WHERE T3.email = 'mayamclean@example.com'	student_club
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND YEAR(T2.event_date) = 2019 AND T2.type = 'Student_Club'	student_club
SELECT COUNT(T2.event_id) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.type = 'Meeting' GROUP BY T2.event_id HAVING COUNT(T1.member_id) > 10	student_club
SELECT event_name FROM event WHERE type = 'Student_Club' AND event_id IN ( SELECT link_to_event FROM attendance GROUP BY link_to_event HAVING COUNT(member_id) > 20 )	student_club
SELECT CAST(COUNT(T1.event_id) AS REAL) / COUNT(DISTINCT T1.event_name) FROM event AS T1 WHERE STRFTIME('%Y', T1.event_date) = '2020' AND T1.type = 'Meeting'	student_club
SELECT MAX(T2.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = ( SELECT major_id FROM major WHERE major_name = 'Environmental Engineering' ) AND position = 'Member'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'	student_club
SELECT T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies';	student_club
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey'	student_club
SELECT college FROM major WHERE major_id = (SELECT link_to_major FROM member WHERE first_name = 'Tyler' AND last_name = 'Hewitt')	student_club
SELECT amount FROM income WHERE link_to_member IN ( SELECT member_id FROM member WHERE position = 'Vice President' )	student_club
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.event_name = 'September Meeting'	student_club
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'	student_club
SELECT T2.first_name, T2.last_name FROM budget AS T1 INNER JOIN expense AS T2 ON T1.link_to_budget = T2.link_to_budget INNER JOIN member AS T3 ON T3.member_id = T2.link_to_member WHERE T3.state = 'Illinois' AND T3.major_id = (SELECT major_id FROM major WHERE major_name = 'Student Club')	student_club
SELECT spent FROM budget WHERE event_status = 'Open' AND category = 'Advertisement' AND link_to_event = ( SELECT event_id FROM event WHERE event_name = 'September Meeting' )	student_club
SELECT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Pierce' AND T2.last_name = 'Guidi'	student_club
SELECT SUM(T2.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'October Speaker'	student_club
SELECT T2.approved FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Meeting' AND T2.expense_date = '2019-10-08'	student_club
SELECT AVG(cost) FROM expense WHERE expense_date LIKE '2020-%-%'	student_club
SELECT SUM(T1.spent) - SUM(T2.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE YEAR(T2.event_date) = 2019 AND T2.type = 'Student_Club' UNION ALL SELECT SUM(T1.spent) - SUM(T2.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE YEAR(T2.event_date) = 2020 AND T2.type = 'Student_Club'	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT T2.cost FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Poster' AND T1.event_date = '2019-09-04'	student_club
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'	student_club
SELECT COUNT(T1.major_id) FROM major AS T1 INNER JOIN college AS T2 ON T1.college = T2.college_id WHERE T2.college_name = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'	student_club
SELECT county FROM zip_code WHERE zip IN ( SELECT zip FROM member WHERE first_name = 'Adela' AND last_name = 'O''Gallagher' )	student_club
SELECT SUM(CASE WHEN T2.remaining < 0 THEN 1 ELSE 0 END) AS exceeded_budget_count FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting'	student_club
SELECT SUM(amount) FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Speaker')	student_club
SELECT T2.event_status FROM expense AS T1 INNER JOIN budget AS T2 ON T2.link_to_event = T1.link_to_budget WHERE T1.expense_description = 'Post Cards, Posters' AND T1.expense_date = '2019-08-20'	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T2.major_id = T1.link_to_major WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thompson'	student_club
SELECT COUNT(T1.t_shirt_size) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Human Development and Family Studies' AND T1.t_shirt_size = 'Large'	student_club
SELECT T2.type FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'	student_club
SELECT T3.major_name FROM member AS T1 INNER JOIN event AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'Vice President' AND T2.type = 'Meeting' AND T2.status = 'Closed'	student_club
SELECT T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT DISTINCT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'President';	student_club
SELECT date_received FROM income WHERE source = 'Dues' AND first_name = 'Connor' AND last_name = 'Hilton';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.source = 'Dues' ORDER BY T2.date_received ASC LIMIT 1	student_club
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T1.category = 'Advertisement' AND T2.event_name = 'Yearly Kickoff' AND SUM(amount WHERE category = 'Advertisement' AND event_name = 'October Meeting') > 0	student_club
SELECT CAST(SUM(CASE WHEN T3.category = 'Parking' THEN T4.amount ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T3.event_name = 'November Speaker' THEN T4.amount ELSE 0 END) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN event AS T3 ON T1.event_name = T3.event_name INNER JOIN budget AS T4 ON T1.event_id = T4.link_to_event WHERE T1.event_name = 'November Speaker'	student_club
SELECT SUM(T2.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Pizza'	student_club
SELECT COUNT(city) FROM zip_code WHERE state = 'Virginia' AND county = 'Orange';	student_club
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Humanities and Social Sciences'	student_club
SELECT T2.city, T2.county, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.remaining = (SELECT MIN(remaining) FROM budget)	student_club
SELECT link_to_member FROM attendance WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Meeting')	student_club
SELECT college FROM major GROUP BY college ORDER BY COUNT(major.college) DESC LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1	student_club
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'	student_club
SELECT COUNT(T1.link_to_member) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'	student_club
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason';	student_club
SELECT COUNT(DISTINCT T2.city) FROM member AS T1 INNER JOIN zip_code AS T2 ON T2.zip_code = T1.zip WHERE T2.state = 'Maryland'	student_club
SELECT COUNT(DISTINCT link_to_event) FROM attendance WHERE link_to_member IN ( SELECT member_id FROM member WHERE phone = "954-555-6240" )	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT spent / amount FROM budget WHERE link_to_event IN ( SELECT event_id FROM event WHERE status = 'Closed' ) ORDER BY spent / amount DESC LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE position = 'President' AND link_to_major = (SELECT major_id FROM major WHERE major_name = 'Student Club')	student_club
SELECT max(spent) FROM budget	student_club
SELECT COUNT(event_id) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020';	student_club
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'	student_club
SELECT T2.first_name, T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.first_name, T2.last_name HAVING COUNT(T1.link_to_event) > 7	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN attendance AS T3 ON T3.link_to_member = T1.member_id INNER JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T2.major_name = 'Interior Design' AND T4.event_name = 'Community Theater';	student_club
SELECT T2.first_name, T2.last_name FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T1.city = 'Georgetown' AND T1.state = 'South Carolina'	student_club
SELECT SUM(T2.amount) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Grant' AND T1.last_name = 'Gilmour';	student_club
SELECT T2.first_name, T2.last_name FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.amount > 40	student_club
SELECT SUM(T1.cost) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Yearly Kickoff'	student_club
SELECT T3.first_name, T3.last_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Yearly Kickoff'	student_club
SELECT T1.first_name, T1.last_name, T2.source FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member ORDER BY T2.amount DESC LIMIT 1	student_club
SELECT event_name FROM event ORDER BY cost ASC LIMIT 1	student_club
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) AS REAL) * 100 / SUM(T1.cost) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id	student_club
SELECT CAST(SUM(CASE WHEN T2.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id	student_club
SELECT SOURCE FROM INCOME WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1	student_club
SELECT T1.first_name, T1.last_name, T1.email FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Student Club' AND T1.position = 'Secretary'	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching'	student_club
SELECT COUNT(DISTINCT T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND STRFTIME('%Y', T1.event_date) = '2019'	student_club
SELECT T2.major_name FROM attendance AS T1 INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id INNER JOIN major AS T2 ON T3.link_to_major = T2.major_id WHERE T3.first_name = 'Luisa' AND T3.last_name = 'Guidi'	student_club
SELECT SUM(T1.spent) / COUNT(T1.spent) AS avg_food_expenses FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.status = 'Closed' AND T1.category = 'Food'	student_club
SELECT event_name FROM event WHERE category = 'Advertisement' ORDER BY spent DESC LIMIT 1	student_club
SELECT T2.first_name, T2.last_name FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Women''s Soccer'	student_club
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM event WHERE event_name LIKE '%Student Club%' AND event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(cost) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.expense_description = 'Posters' AND T2.event_name = 'September Speaker'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1;	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.remaining ASC LIMIT 1	student_club
SELECT T1.category, SUM(T2.cost) FROM budget AS T1 INNER JOIN expense AS T2 ON T2.link_to_budget = T1.budget_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T2.approved = 'true' GROUP BY T1.category	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'April Speaker' ORDER BY T1.amount	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food'	student_club
SELECT event_name, MAX(amount) FROM budget WHERE category = 'Advertising' GROUP BY event_name ORDER BY amount DESC LIMIT 3	student_club
SELECT SUM(T1.cost) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Parking'	student_club
SELECT SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.event_status = 'Open' AND T1.expense_date = '2019-08-20'	student_club
SELECT first_name, last_name, SUM(cost) AS total_cost FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.member_id = 'rec4BLdZHS2Blfp4v'	student_club
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T2.link_to_member = T1.member_id WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE t_shirt_size = 'X-Large'	student_club
SELECT T.zip FROM income AS T WHERE T.amount < 50	student_club
SELECT T3.major_name FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'	student_club
SELECT T3.position FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major INNER JOIN event AS T3 ON T1.major_id = T3.type WHERE T1.major_name = 'Business'	student_club
SELECT COUNT(*) FROM member WHERE major_id IN ( SELECT major_id FROM major WHERE major_name = 'Business' ) AND t_shirt_size = 'Medium'	student_club
SELECT category FROM budget WHERE remaining  > 30	student_club
SELECT category FROM event WHERE location = 'MU 215'	student_club
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_date = '2020-03-24T12:00:00';	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT CAST(SUM(CASE WHEN T3.position = 'Member' AND T2.major_name = 'Mathematics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id	student_club
SELECT category FROM event WHERE location = 'MU 215'	student_club
SELECT COUNT(income_id) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'	student_club
SELECT COUNT(DISTINCT T1.major_id) FROM major AS T1 INNER JOIN college AS T2 ON T1.college = T2.college_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T1.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT T2.last_name, T3.department, T3.college FROM major AS T3 INNER JOIN member AS T2 ON T2.link_to_major = T3.major_id WHERE T3.major_name LIKE 'Environmental Engineering'	student_club
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.spent = 0 AND T1.location = 'MU 215' AND T1.type = 'Guest Speaker'	student_club
SELECT T2.city, T2.state FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.department = 'Electrical and Computer Engineering Department' AND T2.position = 'Member'	student_club
SELECT T2.event_name FROM member AS T1 INNER JOIN attendance AS T3 ON T3.link_to_member = T1.member_id INNER JOIN event AS T2 ON T3.link_to_event = T2.event_id WHERE T1.position = 'Vice President' AND T1.zip = 900	student_club
SELECT T1.last_name, T1.position FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Pizza' AND T2.expense_date = '2019-09-10'	student_club
SELECT T2.last_name FROM event AS T1 INNER JOIN attendance AS T3 ON T1.event_id = T3.link_to_event INNER JOIN member AS T2 ON T3.link_to_member = T2.member_id WHERE T1.event_name = 'Women''s Soccer'	student_club
SELECT CAST(SUM(CASE WHEN T1.t_shirt_size = 'Medium' AND T4.position = 'Member' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.member_id) FROM member AS T1 INNER JOIN income AS T4 ON T1.member_id = T4.link_to_member WHERE T4.amount = 50	student_club
SELECT DISTINCT T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip	student_club
SELECT DISTINCT zip FROM zip_code WHERE type = 'PO Box' AND state = 'PUERTO RICO' AND city = 'SAN JUAN MUNICIPIO'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND strftime('%Y-%m-%d', event_date) BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT link_to_event FROM expense WHERE cost > 50	student_club
SELECT T1.member_id, T3.link_to_event FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN attendance AS T3 ON T2.expense_id = T3.link_to_event WHERE T2.approved = 'true' AND T2.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT college FROM member WHERE first_name = 'Katy' AND link_to_major = 'rec1N0upiVLy5esTO'	student_club
SELECT phone FROM member WHERE link_to_major = ( SELECT major_id FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND major_name = 'Business' )	student_club
SELECT DISTINCT T2.email FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND T1.cost > 20	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'education' AND T1.position = 'Member'	student_club
SELECT CAST(COUNT(CASE WHEN remaining < 0 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM budget	student_club
SELECT event_id, location, status FROM event WHERE STRFTIME('%Y-%m-%d', event_date) BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT AVG(T1.cost) FROM expense AS T1	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(COUNT(CASE WHEN T1.type = 'PO Box' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.zip_code) FROM zip_code AS T1	student_club
SELECT T1.event_name, T1.location FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100	student_club
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T3.major_id = T1.link_to_major WHERE T2.cost > 100	student_club
SELECT T1.city, T1.county FROM zip_code AS T1 INNER JOIN event AS T2 ON T1.zip_code = T2.location WHERE T2.event_id IN ( SELECT link_to_event FROM income GROUP BY link_to_event HAVING COUNT(*) > 40 )	student_club
SELECT T2.first_name, T2.last_name FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T1.link_to_member HAVING SUM(T1.cost) = ( SELECT MAX(T.total_amount) FROM ( SELECT SUM(cost) AS total_amount FROM expense WHERE link_to_member IN ( SELECT T3.link_to_member FROM expense AS T3 GROUP BY T3.link_to_member HAVING COUNT(T3.event_id) > 1 ) GROUP BY link_to_member ) AS T )	student_club
SELECT AVG(T1.amount) FROM income AS T1 INNER JOIN member AS T2 ON T2.member_id = T1.link_to_member WHERE T2.position != 'Member'	student_club
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Parking' AND T1.cost < ( SELECT AVG(T1.cost) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Parking' )	student_club
SELECT SUM(T2.cost) * 100.0 / COUNT(T1.event_id) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Game'	student_club
SELECT link_to_budget FROM expense WHERE expense_description = 'Water, chips, cookies' ORDER BY cost DESC LIMIT 1	student_club
SELECT T2.first_name, T2.last_name FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id ORDER BY T1.cost DESC LIMIT 5	student_club
SELECT T2.first_name, T2.last_name, T2.phone FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost > (SELECT avg(T3.cost) FROM expense AS T3)	student_club
SELECT CAST(( SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Maine' AND T1.position = 'Member' ) AS REAL) - CAST(( SELECT COUNT(T3.member_id) FROM member AS T3 INNER JOIN zip_code AS T4 ON T3.zip = T4.zip_code WHERE T4.state = 'Vermont' AND T3.position = 'Member' ) AS REAL)	student_club
SELECT T3.major_name, T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'	student_club
SELECT T3.first_name, T3.last_name, T1.cost FROM expense AS T1 INNER JOIN budget AS T2 ON T2.link_to_event = T1.link_to_budget INNER JOIN member AS T3 ON T3.member_id = T1.link_to_member WHERE T1.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T2.last_name, T2.phone FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Elementary Education'	student_club
SELECT T1.category, T1.amount FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'	student_club
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '2019-09-09';	student_club
SELECT DISTINCT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'	student_club
SELECT T2.first_name, T2.last_name, T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Secretary'	student_club
SELECT e.event_name, SUM(budget.spent) AS total_amount_spent FROM budget AS budget INNER JOIN event AS e ON budget.link_to_event = e.event_id WHERE budget.category = 'Speaker gifts' GROUP BY budget.link_to_event	student_club
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Girke'	student_club
SELECT first_name, last_name, position FROM member WHERE city = 'Lincolnton' AND state = 'North Carolina' AND zip = 28092	student_club
SELECT COUNT(T2.GasStationID) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Country = 'CZE' AND T2.ProductID = 'Premium gas'	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Currency = 'EUR' divided by COUNT(*) FROM customers WHERE Currency = 'CZK'	debit_card_specializing
SELECT T2.CustomerID FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T2.CustomerID = T1.CustomerID WHERE T2.`Date` BETWEEN '201201' AND '201212' AND T2.Consumption = ( SELECT min(Consumption) FROM yearmonth WHERE `Date` BETWEEN '201201' AND '201212' AND Segment = 'LAM' ) AND T2.Segment = 'LAM'	debit_card_specializing
SELECT AVG(T2.Consumption) / 12 FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201301' AND '201312' AND T1.Segment = 'SME'	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.`Date` BETWEEN '201101' AND '201112' AND T2.Price <> 0 AND T1.Currency = 'CZK' GROUP BY T1.CustomerID ORDER BY SUM(T2.Amount) DESC LIMIT 1	debit_card_specializing
SELECT COUNT(DISTINCT T1.CustomerID) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'KAM' AND T1.`Date` BETWEEN '201201' AND '201212' AND T1.Consumption < 30000	debit_card_specializing
SELECT (SELECT SUM(t1.Consumption) FROM yearmonth AS t1 INNER JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Currency = 'CZK' AND strftime('%Y%m', t1.Date) BETWEEN '201201' AND '201212') - (SELECT SUM(t1.Consumption) FROM yearmonth AS t1 INNER JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Currency = 'EUR' AND strftime('%Y%m', t1.Date) BETWEEN '201201' AND '201212') AS difference	debit_card_specializing
SELECT strftime('%Y', `Date`) FROM transactions_1k WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR') GROUP BY strftime('%Y', `Date`) ORDER BY COUNT(DISTINCT TransactionID) DESC LIMIT 1	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY AVG(T2.Consumption) ASC LIMIT 1	debit_card_specializing
SELECT SUBSTR(YEARMONTH.Date, 1, 4) FROM yearmonth ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT T1.Date FROM ( SELECT T2.Date, SUM(T1.Amount * T1.Price) AS Consumption FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '2013%' AND T2.Date < '2014%' AND T3.Segment = 'SME' AND T3.CustomerID = T1.CustomerID GROUP BY T2.Date ORDER BY Consumption DESC LIMIT 1 ) AS T1 INNER JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID	debit_card_specializing
SELECT AVG(T2.Consumption) - AVG(T1.Consumption) FROM yearmonth AS T1 INNER JOIN yearmonth AS T2 ON T2.CustomerID = T1.CustomerID AND T1.Date BETWEEN '201301' AND '201312' AND T2.Date BETWEEN '201301' AND '201312' WHERE T2.Consumption = ( SELECT MIN(Consumption) FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' ) AND T1.Date = CASE WHEN T2.Date = '201301' THEN '201302' ELSE '201212' END AND T1.Segment IN ('SME', 'LAM')	debit_card_specializing
SELECT CASE            WHEN Sum(IIF(Substr(T2.`Date`, 1, 4) = '2013' AND T2.Yearmonth > '201201', T1.Consumption - T2.Consumption, 0)) >=                 Sum(IIF(Substr(T2.`Date`, 1, 4) = '2012' AND T2.Yearmonth > '201201', T1.Consumption - T2.Consumption, 0))               THEN SUM(IIF(T2.`Date` BETWEEN '201201' AND '201312' AND T1.Yearmonth BETWEEN '201201' AND '201312' AND T2.Segment = 'SME', T2.Consumption, 0)) /                    SUM(IIF(T2.`Date` BETWEEN '201201' AND '201312' AND T1.Yearmonth BETWEEN '201201' AND '201312' AND T2.Segment = 'SME' AND T2.`Date` > '201201', T2.Consumption - T1.Consumption, 0)) * 100            ELSE SUM(IIF(T2.`Date` BETWEEN '201201' AND '201312' AND T1.Yearmonth BETWEEN '201201' AND '201312' AND T2.Segment = 'SME', T2.Consumption, 0)) /                    SUM(IIF(T2.`Date` BETWEEN '201201' AND '201312' AND T1.Yearmonth BETWEEN '201201' AND '201312' AND T2.Segment = 'SME' AND T2.`Date` > '201201', T2.Consumption - T1.Consumption, 0)) * 100            END AS '2013',            CASE            WHEN Sum(IIF(Substr(T2.`Date`, 1, 4) = '2013' AND T2.Yearmonth > '201201', T1.Consumption - T2.Consumption, 0)) >=                 Sum(IIF(Substr(	debit_card_specializing
SELECT sum(T2.Amount) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.CustomerID = 6 AND T2.Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT COUNT(T2.GasStationID) - COUNT(T3.GasStationID) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T2.GasStationID = T1.GasStationID INNER JOIN yearmonth AS T3 ON T3.GasStationID = T1.GasStationID WHERE T1.Country = 'Czech' AND T2.Price > T2.Amount ELSE 0 WHERE T1.Country = 'Slovak' AND T2.Price > T2.Amount END	debit_card_specializing
SELECT AVG(T2.Consumption) - AVG(T1.Consumption) FROM yearmonth AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201304' AND T1.CustomerID = 5 AND T2.CustomerID = 7	debit_card_specializing
SELECT sum(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) - sum(CASE WHEN T1.Currency = 'CZK' THEN 1 ELSE 0 END) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN products AS T3 ON T2.ProductID = T3.ProductID WHERE T3.Description LIKE '%premium%'	debit_card_specializing
SELECT T2.Consumption FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Currency = 'EUR' AND T2.Date LIKE '201310%' AND T3.Segment = 'LAM' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT T2.`Segment`, COUNT(T3.CustomerID) AS Consumption  FROM `transactions_1k` AS T1 INNER JOIN `yearmonth` AS T2 ON T2.`CustomerID` = T1.`CustomerID` INNER JOIN customers AS T3 ON T2.`CustomerID` = T3.`CustomerID` WHERE T1.`Price` IS NOT NULL AND T2.`Date` = '2019-06-04' AND T3.`Segment` = 'KAM' GROUP BY T3.`Segment` ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT SUM(T1.Consumption) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '201305' AND T2.Segment = 'KAM'	debit_card_specializing
SELECT CAST(SUM(IIF(T2.Consumption > 46.73, 1, 0)) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'	debit_card_specializing
SELECT t2.Country, COUNT(*) FROM transactions_1k AS t1 INNER JOIN gasstations AS t2 ON t1.GasStationID = t2.GasStationID WHERE t1.Price * t1.Amount / COUNT(*) = ( SELECT AVG(t2.Price * t2.Amount / COUNT(*)) FROM transactions_1k AS t1 INNER JOIN gasstations AS t2 ON t1.GasStationID = t2.GasStationID GROUP BY t2.Country ) GROUP BY t2.Country	debit_card_specializing
SELECT CAST(SUM(IIF(T1.Currency = 'EUR', 1, 0)) AS REAL) * 100 / COUNT(T1.Segment) FROM customers AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM'	debit_card_specializing
SELECT CAST(SUM(IIF(T1.Consumption > 528.3, 1, 0)) AS REAL) * 100 / COUNT(T1.Consumption) FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN DATETIME('2012-02-01 00:00:00') AS T3 ON T1.Date = T3	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN T2.Country = 'Slovakia' AND T2.Segment = 'Premium' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM gasstations AS T1 INNER JOIN yearmonth AS T2 ON T2.GasStationID = T1.GasStationID	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE date LIKE '201309%' ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT T2.segment FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.customerid = T2.customerid WHERE T1.date LIKE '201309%' ORDER BY T1.Consumption ASC LIMIT 1	debit_card_specializing
SELECT T2.customerid FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.customerid = T2.customerid WHERE T1.date = '201206' AND T2.segment = 'SME' GROUP BY T2.customerid ORDER BY SUM(T2.amount) ASC LIMIT 1	debit_card_specializing
SELECT MAX(T2.Consumption) FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON STRFTIME('%Y', T1.Date) = STRFTIME('%Y', T2.Date) AND T1.CustomerID = T2.CustomerID WHERE STRFTIME('%Y', T1.Date) = '2012'	debit_card_specializing
SELECT MAX(T2.sum_consumption) FROM customers AS T1 INNER JOIN ( SELECT T1.CustomerID, SUM(T1.Consumption) AS sum_consumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY T2.CustomerID ) AS T2 ON T1.CustomerID = T2.CustomerID	debit_card_specializing
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Date LIKE '201309%'	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date LIKE '201306%' GROUP BY T2.Country	debit_card_specializing
SELECT DISTINCT T1.ChainID FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID	debit_card_specializing
SELECT DISTINCT T3.Description FROM transactions_1k AS T1 INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T1.Price = T3.Price * 1	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(*) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Consumption > 1000	debit_card_specializing
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID INNER JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T3.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T1.Time FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Country = 'CZE' AND Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'	debit_card_specializing
SELECT avg(T2.Price) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'CZE'	debit_card_specializing
SELECT avg(Amount * Price) FROM transactions_1k WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE DATE(Date) = '2012-08-25' ORDER BY Amount DESC LIMIT 1	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T3.Segment = 'C' AND T2.Date = '2012-08-25' ORDER BY T2.TransactionID LIMIT 1	debit_card_specializing
SELECT T2.Currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE STRFTIME('%Y-%m-%d', T1.Date) = '2012-08-24' AND STRFTIME('%H:%M:%S', T1.Time) = '16:25:00'	debit_card_specializing
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-23' AND T1.time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE STRFTIME('%Y-%m-%d', Date) = '2012-08-26' AND STRFTIME('%H:%M:%S', Time) < '13:00:00'	debit_card_specializing
SELECT T2.Segment FROM customers AS T1 INNER JOIN transactions_1k AS T3 ON T1.CustomerID = T3.CustomerID INNER JOIN customers AS T2 ON T3.CustomerID = T2.CustomerID ORDER BY T3.Date ASC LIMIT 1	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.`Date` = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE strftime('%Y-%m-%d', Date) = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT T2.amount * T2.price, T2.date, T2.amount, T2.price FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.customerid = T2.customerid WHERE T1.customerid = 5 AND T2.date LIKE '2012-08-24'	debit_card_specializing
SELECT COUNT(T1.TransactionID) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date = '2012-08-26' AND T1.Time LIKE '08:%'	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID WHERE T3.Date LIKE '201306%' AND T3.Consumption = 214582.17	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T2.Amount = 548.4 AND T2.Date = '2012-08-24'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25'	debit_card_specializing
SELECT (T1.Consumption - T2.Consumption) * 100 / T1.Consumption AS percent FROM ( SELECT C.CustomerID, YEAR(T.Date) AS year, MONTH(T.Date) AS month, SUM(T.Amount) AS Consumption FROM transactions_1k AS T INNER JOIN yearmonth AS Y ON Y.CustomerID = T.CustomerID INNER JOIN customers AS C ON C.CustomerID = T.CustomerID WHERE Y.Date = '2012-08-24' AND T.CustomerID = 3 GROUP BY C.CustomerID ) AS T1 INNER JOIN ( SELECT C.CustomerID, YEAR(T.Date) AS year, MONTH(T.Date) AS month, SUM(T.Amount) AS Consumption FROM transactions_1k AS T INNER JOIN yearmonth AS Y ON Y.CustomerID = T.CustomerID INNER JOIN customers AS C ON C.CustomerID = T.CustomerID WHERE Y.Date = '2013-08-25' AND T.CustomerID = 3 GROUP BY C.CustomerID ) AS T2 ON T1.CustomerID = T2.CustomerID	debit_card_specializing
SELECT GasStationID, COUNT(TransactionID) as revenue FROM transactions_1k GROUP BY GasStationID ORDER BY revenue DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(IIF(T1.Segment = 'PREMIUM', 1, 0)) AS REAL) * 100 / COUNT(*) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Country = 'SVK';	debit_card_specializing
SELECT SUM(T2.Amount) FROM transactions_1k AS T1 INNER JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.CustomerID = '38508' AND T1.GasStationID = T2.GasStationID AND T1.Date LIKE '2012%';	debit_card_specializing
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.ProductID ORDER BY COUNT(T2.ProductID) DESC LIMIT 5	debit_card_specializing
SELECT T1.CustomerID, SUM(T1.Amount) as Total, SUM(T1.Price) / SUM(T1.Amount) as Average  FROM transactions_1k AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Currency = 'EUR'  GROUP BY T1.CustomerID  ORDER BY Total DESC  LIMIT 1	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.ProductID = 2 ORDER BY T2.Description DESC LIMIT 1	debit_card_specializing
SELECT T3.Consumption FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T2.CustomerID = T1.CustomerID INNER JOIN customers AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.ProductID = 5 AND T3.Segment = 'LAM' AND T1.Price > 29 AND T2.Date LIKE '2012%8%'	debit_card_specializing
