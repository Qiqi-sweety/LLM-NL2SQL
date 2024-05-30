SELECT MAX(Free_Meal_Count_K_12 / Enrollment_K_12) AS Highest_Eligible_Free_Rate FROM frpm WHERE County_Name = 'Alameda';
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;
SELECT `Zip` FROM schools WHERE `District` = 'Fresno County Office of Education' AND `Charter` = 1
SELECT T2.Street FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1
SELECT Phone FROM schools WHERE Charter = 1 AND CharterNum IS NOT NULL AND DOC = 'DIR' AND OpenDate > '2000-01-01'
SELECT COUNT(*) FROM schools WHERE CHAR_LENGTH(Virtual) - CHAR_LENGTH(REPLACE(Virtual, 'F', '')) = 0 AND AvgScrMath < 400
SELECT S.School FROM schools AS S INNER JOIN satscores AS SS ON S.CDSCode = SS.cds WHERE SS.NumTstTakr > 500 AND S.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 AND T1.AvgScrMath >= 1500 AND T1.AvgScrWrite >= 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT SUM(T1.NumTstTakr) FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.rtype = 'K-12' AND T2.FRPMCount = ( SELECT MAX(FRPMCount) FROM frpm WHERE "Low Grade" = 'K' AND "High Grade" = '12' )
SELECT COUNT(T1.cds) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.FundingType = 'Directly funded';
SELECT T3.`FRPM Count (Ages 5-17)` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN satscores AS T3 ON T1.CDSCode = T3.cds WHERE T3.AvgScrRead = ( SELECT max(T1.AvgScrRead) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.Grade = 'Reading' )
SELECT CDSCode FROM frpm WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500
SELECT t3.`Percent (%) Eligible Free (Ages 5-17)` FROM satscores AS t1 INNER JOIN schools AS t2 ON t1.cds = t2.CDSCode INNER JOIN frpm AS t3 ON t2.CDSCode = t3.CDSCode WHERE t3.`Free Meal Count (Ages 5-17)` <> 0 AND t3.`Enrollment (Ages 5-17)` <> 0 AND t1.AvgScrMath / t1.NumTstTakr > 0.3 ORDER BY t3.`Percent (%) Eligible Free (Ages 5-17)` DESC LIMIT 1
SELECT Phone FROM schools ORDER BY AVG(NumGE1500 / NumTstTakr) DESC LIMIT 3
SELECT T2.NCESSchool FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Grade = 'Ages 5-17' ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T2.`District Name` FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.cds WHERE T1.rtype = 'AY' AND T1.AvgScrRead IS NOT NULL AND T2.District != '' ORDER BY T1.AvgScrRead DESC LIMIT 1
SELECT SUM(T1.NumTstTakr < 100) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.county = 'Alameda'
SELECT CHARTERNUM FROM schools WHERE CDSCODE IN (SELECT cds FROM satscores WHERE AvgScrWrite = 499)
SELECT COUNT(DISTINCT T2.CDSCode) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`District Type` = 'District Office (DO)' AND T1.`District Name` = 'Contra Costa' AND T1.`Funding Type` = 'Directly funded' AND T1.`County Name` = 'Contra Costa County' AND T2.`City` = 'Contra Costa'
SELECT Phone FROM schools WHERE CDSCode = ( SELECT CDS FROM satscores WHERE AvgScrMath = ( SELECT MAX(AvgScrMath) FROM satscores ) )
SELECT COUNT(*) FROM schools WHERE Counties = "Amador" AND Low_Grade = '9' AND High_Grade = '12'
SELECT COUNT(*) FROM frpm WHERE (`County Name` = 'Los Angeles' AND (`Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700));
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Contra Costa' ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT T1.School, T1.Street FROM schools AS T1 INNER JOIN frpm AS T2 ON T2.CDSCode = T1.CDSCode WHERE T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)` > 30
SELECT T3.sname FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds INNER JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T1.`Percent (%) Eligible Free (K-12)` > 0.1 AND T2.`NumTstTakr` >= 1500
SELECT DISTINCT T1.fundingtype FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.cdscode = T2.cds WHERE T1.county = 'Riverside' GROUP BY T1.cdscode HAVING AVG(T2.avgscrmath) > 400
SELECT DISTINCT T2.County, T2.School, T2.Street, T2.City, T2.State, T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.StatusType = 'High School (Public)' AND T2.District = 'MONTEREY DISTRICT' AND T1.`Enrollment (Ages 5-17)` > 800 AND T1.`Free Meal Count (Ages 5-17)` > T1.`FRPM Count (Ages 5-17)`
SELECT T2.School, T2.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T2.cds = T1.CDSCode WHERE T1.OpenDate > '1991-12-31' OR T1.ClosedDate < '2000-01-01' AND T2.AvgScrWrite IS NOT NULL
SELECT T1.DistrictName, T2.DOCType, T2.SchoolName FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Funding Type` = 'Local' AND T1.`County Name` = T2.County AND T1.`District Name` = T2.District AND T1.`School Name` = T2.School ORDER BY T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` DESC
SELECT OpenDate FROM schools ORDER BY (Enroll12 - 1) * 0.12 / 13 ASC LIMIT 1
SELECT city FROM schools ORDER BY enrollment DESC LIMIT 5
SELECT T2.`Free Meal Count (K-12)`, T2.`Enrollment (K-12)`, T2.`Eligible FRPM (K-12)` FROM ( SELECT T1.Enrollment, T1.SchoolName, T1.Grade, SUM(`Free Meal Count (K-12)`) OVER (PARTITION BY T1.Grade ORDER BY T1.Enrollment DESC ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) as `Eligible FRPM (K-12)` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Grade BETWEEN 'K' AND '12' ORDER BY T1.Enrollment DESC LIMIT 10 ) AS T3
SELECT TOP 5 frpm.`FRPM Count (K-12)`, frpm.`Enrollment (K-12)`, frpm.`Percent (%) Eligible FRPM (K-12)` FROM frpm WHERE frpm.Grade BETWEEN 'K' AND '12' AND frpm.`District Type` = 'County Office of Education (COE)' AND frpm.`School Type` IN ('Elementary Schools (Public)', 'K-12 Schools (Public)') AND ( SELECT COUNT(DISTINCT frpm2.SchoolCode) FROM frpm AS frpm2 WHERE frpm2.Grade BETWEEN 'K' AND '12' AND frpm2.`District Type` = 'County Office of Education (COE)' AND frpm2.`School Type` IN ('Elementary Schools (Public)', 'K-12 Schools (Public)') AND frpm2.`Educational Option Type` LIKE 'Highest School(%)%' AND frpm2.`Free Meal Count (K-12)` > frpm.`Free Meal Count (K-12)` ) = 5 AND frpm.`District Type` = 'County Office of Education (COE)'
SELECT T2.Website FROM schools AS T1 INNER JOIN frpm AS T2 ON T2.CDSCode = T1.CDSCode WHERE T2.`Enrollment (Ages 5-17)` BETWEEN 1900 AND 2000 AND T2.`Free Meal Count (Ages 5-17)` = 1
SELECT CAST(`Free Meal Count (Ages 5-17)` AS REAL) / `Enrollment (Ages 5-17)` FROM frpm WHERE `School Name` = 'Elite Prep Academy';
SELECT T1.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 ORDER BY T2.`Enrollment (K-12)` ASC LIMIT 1
SELECT T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.AdmFName1 IS NOT NULL AND T1.AdmFName1 != '' AND T1.AdmLName1 IS NOT NULL AND T1.AdmLName1 != '' AND T2.NumGE1500 > 0 AND T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500 ORDER BY T2.NumTstTakr DESC LIMIT 1
SELECT T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.NumGE1500 / T2.NumTstTakr ASC LIMIT 1
SELECT Website FROM schools WHERE NCESDist LIKE 'Los Angeles %' AND NCESSchool BETWEEN 2000 AND 3000
SELECT AVG(NumTstTakr) FROM satscores WHERE cds IN (SELECT CDSCode FROM schools WHERE District LIKE 'Fresno%' AND YEAR(OpenDate) = 1980)
SELECT phone FROM schools WHERE district = 'Fresno Unified' ORDER BY AvgScrRead ASC LIMIT 1;
SELECT T2.school FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Virtual = 'F' ORDER BY T2.AvgScrRead DESC LIMIT 5
SELECT T2.EducationalOptionType FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN satscores AS T3 ON T1.CDSCode = T3.cds ORDER BY T3.AvgScrMath DESC LIMIT 1
SELECT avg(s.AvgScrMath), s.cname FROM schools s WHERE s.sid = ( SELECT sid FROM ( SELECT s.sid, AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS avg_score FROM schools s ORDER BY avg_score LIMIT 1 ) )
SELECT T2.City FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 0 AND T1.NumGE1500 >= 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT T1.School, AVG(T2.AvgScrWrite)  FROM schools AS T1  JOIN satscores AS T2  ON T1.CDSCode = T2.cds  WHERE T1.EdOpsName = 'Ricci Ulrich'  GROUP BY T1.School
SELECT T1.State FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.DOC = 31 AND T2.`Low Grade` = 'K' AND T2.`High Grade` = '12' GROUP BY T1.State ORDER BY SUM(T2.`Enrollment (K-12)`) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.School) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = 52 AND T1.OpenDate LIKE '1980%'
SELECT AVG(CASE WHEN T2.DOC = 54 THEN 1 ELSE 0 END) AS ORANGE_COVERED_U, AVG(CASE WHEN T2.DOC = 52 THEN 1 ELSE 0 END) AS ORANGE_COVERED_ES FROM frpm AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.CDSCode WHERE T1.`District Type` IN ('Unified School District', 'Charter School (Y/N)') AND T2.District LIKE 'Orange County%' GROUP BY T1.`County Code`
SELECT T1.County, T1.School, T1.ClosedDate FROM schools AS T1 WHERE T1.StatusType = 'Closed' ORDER BY T1.County DESC LIMIT 1
SELECT Street FROM schools ORDER BY AvgScrMath DESC LIMIT 6, 1
SELECT s.MailStreet, s.School FROM schools s INNER JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrRead ASC LIMIT 1
SELECT COUNT(T2.School) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 0 AND T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500 AND T1.MailingCity = 'LAKEPORT'
SELECT DISTINCT t2.NumTstTakr FROM schools AS t1 INNER JOIN satscores AS t2 ON t1.CDSCode = t2.cds WHERE t1.MailCity = 'Fresno'
SELECT sname, mailzip FROM schools WHERE admfname1 = 'Avetik' AND admfname2 = 'Atoian'
SELECT COUNT(CASE WHEN T2.County = 'Colusa' THEN T1.School ELSE NULL END) / COUNT(CASE WHEN T2.County = 'Humboldt' THEN T1.School ELSE NULL END) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.MailState = 'CA'
SELECT COUNT(*) FROM schools WHERE CHAR_LENGTH(MailState) = 2 AND MailState = 'CA' AND District = (SELECT District FROM schools WHERE School = 'San Joaquin');
SELECT T3.Phone, T3.Ext FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds INNER JOIN frpm AS T3 ON T1.CDSCode = T3.CDSCode ORDER BY T2.AvgScrWrite DESC LIMIT 2
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT T2.Website FROM edopschools AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Mike' AND T1.AdmLName1 = 'Larson' OR T1.AdmFName2 = 'Mike' AND T1.AdmLName2 = 'Larson' OR T1.AdmFName3 = 'Mike' AND T1.AdmLName3 = 'Larson' UNION SELECT T2.Website FROM edopschools AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Dante' AND T1.AdmLName1 = 'Alvarez' OR T1.AdmFName2 = 'Dante' AND T1.AdmLName2 = 'Alvarez' OR T1.AdmFName3 = 'Dante' AND T1.AdmLName3 = 'Alvarez';
SELECT DISTINCT T1.Website FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'San Joaquin' AND T1.Virtual = 'P' AND T1.Charter = 1
SELECT COUNT(CDSCode) FROM schools WHERE County = 'Hickman' AND DOC = '52' AND Charter = 1
SELECT SUM(T1.enroll12) FROM schools AS T1 INNER JOIN frpm AS T2 ON T2.cds = T1.CDSCode WHERE T1.County = 'Los Angeles' AND T1.charter = 0 AND T2.`Free Meal Count (K-12)` * 100.0 / T2.`Enrollment (K-12)` < 0.18
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3, T2.AdmEmail1, T2.AdmEmail2, T2.AdmEmail3, T1.School, T1.City FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T2.CharterNumber = '00D2'
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';
SELECT CAST(SUM(CASE WHEN FundingType = 'Locally Funded' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM schools WHERE County = 'Santa Clara County'
SELECT COUNT(DISTINCT T2.District) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Academic Year` BETWEEN '2000-2001' AND '2005-2006' AND T2.County = 'Stanislaus' AND T1.FundingType = 'Directly Funded'
SELECT COUNT(*) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'County of San Francisco' AND T1.Zip LIKE '941%'
SELECT T2.`County Name`, COUNT(DISTINCT T1.CDSCode) AS closure_count FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`District Type` = 'Youth Authority Facilities (CEA)'   AND T1.`Open Date` >= '1980-01-01' AND T1.`Open Date` <= '1989-12-31' GROUP BY T2.`County Name` ORDER BY closure_count DESC LIMIT 1;
SELECT DISTINCT district FROM schools WHERE SOC = '31'
SELECT COUNT(StatusType) FROM schools WHERE County = 'Alpine' AND StatusType IN ('Active District Community Day School', 'Closed District Community Day School');
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0
SELECT SUM(T2.`Enrollment (Ages 5-17)`) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.EdOpsCode = 'SSS' AND T1.LastUpdate = '2014-12-31'
SELECT Free_Meal_Count__Ages_5_17 FROM frpm WHERE Mailing_Street_Address_ = 'PO Box 1040';
SELECT MIN(LowGrade) FROM frpm WHERE EdOpsCode = 'SPECON' AND NCESDist = '613360';
SELECT t2.`School Type` FROM frpm AS t1 INNER JOIN schools AS t2 ON t1.CDSCode = t2.CDSCode WHERE t2.CountyCode = '37' AND t2.Magnet = 1
SELECT T2.city FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.EILCode = 'HS' AND T2.`Low Grade` = '9' AND T2.`High Grade` = '12' AND T1.County = 'Merced'
SELECT T3.`Percent (%) Eligible FRPM (Ages 5-17)` FROM satscores AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.cds INNER JOIN frpm AS T3 ON T3.CDSCode = T1.cds WHERE T2.`School Name` IN ( SELECT T2.`School Name` FROM frpm AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.CDSCode WHERE T2.County = 'Los Angeles' AND T1.Low_Grade = 'K' AND T1.High_Grade = '9' ) AND T2.Grade_Span = 'Kindergarten to 9th grade'
SELECT MAX(T2.Grade) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.City = 'Adelanto'
SELECT COUNT(school) FROM schools WHERE county IN ('San Diego', 'Santa Barbara') AND Virtual = 'F'
SELECT DISTINCT T2.School, T2.Latitude FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.Latitude DESC LIMIT 1
SELECT T2.City, T2.Lowest_Grade, T1.School  FROM frpm AS T1  INNER JOIN schools AS T2 ON T2.CDSCode = T1.CDSCode  WHERE T2.State = 'CA'  ORDER BY T2.Latitude ASC  LIMIT 1
SELECT High_Grade - Low_Grade FROM frpm ORDER BY Longitude DESC LIMIT 1
SELECT T2.City, T2.County, COUNT(T1.CDSCode) AS NumberOfSchools FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Magnet = 1 AND T1.LowGrade = 'K' AND T1.HighGrade = '8' GROUP BY T2.City
SELECT TOP 2 a.AdmFName1, b.District FROM schools AS a INNER JOIN frpm AS b ON a.CDSCode = b.CDSCode GROUP BY a.AdmFName1, b.District ORDER BY COUNT(a.AdmFName1) DESC
SELECT T2.`District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`AdmFName1` = 'Alusine';
SELECT T3.AdmLName1, T4.County, T4.District, T4.`School Name` FROM frpm AS T1 INNER JOIN schools AS T4 ON T1.CDSCode = T4.CDSCode INNER JOIN admins AS T3 ON T3.ID = T4.AdmID WHERE T3.AdmFname = 'Cynthia' AND T3.AdmName = 'Miller'
SELECT DISTINCT T1.admfname1, T1.admlname1, T1.admemail1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.cdscode = T2.cdscode WHERE T1.city = 'San Bernardino' AND T1.district = 'District of San Bernardino City Unified' AND T1.statustype = 'Public' AND T2.schooltype IN ('Intermediate/Middle Schools', 'Unified School') AND T1.openDate BETWEEN '2009-01-01' AND '2010-12-31'
SELECT T1.`AdmEmail3`, T2.school FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.NumTstTakr DESC LIMIT 1
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id INNER JOIN `order` AS T5 ON T3.account_id = T5.account_id WHERE T4.A3 = 'East Bohemia' AND T5.type = 'POPLATEK PO OBRATU'
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.district_id WHERE T2.A3 = 'PRAGUE' AND T1.status = 'OPEN'
SELECT (MAX(T1.A12) - MIN(T1.A12)) / MIN(T1.A12) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.frequency = 'POPLATEK MESICNE' AND YEAR(T2.date) IN (1995, 1996)
SELECT COUNT(*) FROM (SELECT T1.district_id FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id WHERE T1.gender = 'F' AND T2.frequency = 'POPLATEK MESICNE' GROUP BY T1.district_id HAVING AVG(T2.A11) > 6000 AND AVG(T2.A11) < 10000) AS T3
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'North Bohemia' AND T2.A11 > 8000
SELECT T3.account_id FROM client AS T1 JOIN account AS T3 ON T1.client_id = T3.client_id JOIN `order` AS T4 ON T3.account_id = T4.account_id WHERE T1.gender = 'F' AND T3.frequency = 'POPLATEK MESICNE' ORDER BY T1.birth_date LIMIT 1 UNION SELECT T3.account_id FROM client AS T1 JOIN account AS T3 ON T1.client_id = T3.client_id JOIN `order` AS T4 ON T3.account_id = T4.account_id WHERE T1.gender = 'F' AND T3.frequency = 'POPLATEK MESICNE' ORDER BY T1.birth_date DESC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id GROUP BY T1.account_id ORDER BY T2.birth_date ASC LIMIT 1
SELECT COUNT(CASE WHEN T2.gender = 'OWNER' THEN T1.district_id END) FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK TYDNE'
SELECT T2.client_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'POPLATEK PO OBRATU'
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE strftime('%Y', T2.date) = '1997' ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1993-02-26' AND T2.duration > 12 ORDER BY T2.amount DESC LIMIT 1
SELECT COUNT(T2.account_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T2.account_id IN (SELECT T3.account_id FROM account AS T3 INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A2 = 'Slokolov')
SELECT account_id FROM account WHERE date LIKE '1995%' ORDER BY date LIMIT 1
SELECT T2.account_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date < '1997-01-01' AND T1.amount > 3000
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.issued = '1994-03-03'
SELECT DISTINCT T2.date FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'PRIJEM' AND T1.amount = 840 AND T1.date LIKE '1998-10-14%'
SELECT T1.district_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1994-08-25%'
SELECT MAX(amount) FROM trans WHERE date = '1996-10-21'
SELECT T2.gender FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id ORDER BY T1.A11 DESC LIMIT 1
SELECT t1.amount FROM trans AS t1 INNER JOIN account AS t2 ON t1.account_id = t2.account_id ORDER BY t1.amount DESC LIMIT 1
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T1.client_id = T3.client_id INNER JOIN account AS T4 ON T3.account_id = T4.account_id WHERE T2.A2 = 'Jesenik' AND T1.gender = 'F'
SELECT DISTINCT t3.disp_id FROM trans AS t1 INNER JOIN account AS t2 ON t1.account_id = t2.account_id INNER JOIN disp AS t3 ON t3.account_id = t1.account_id WHERE t2.date LIKE '1998/9/2%' AND t1.amount = 5100
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK MESICNE' AND YEAR(T1.date) = 1996 AND T2.A2 = 'Litomerice'
SELECT T3.a2 FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.birth_date = '1976-01-29' AND T1.gender = 'F';
SELECT T1.birth_date FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T2.amount = 98832 AND SUBSTR(T2.date, 1, 4) = '1996' AND SUBSTR(T2.date, 6, 2) = '01' AND SUBSTR(T2.date, 9, 2) = '03'
SELECT t3.account_id FROM district AS t1 INNER JOIN account AS t3 ON t1.district_id = t3.district_id INNER JOIN client AS t2 ON t3.district_id = t2.district_id WHERE t1.A3 = 'Prague' AND t2.birth_date = ( SELECT MIN(birth_date) FROM client )
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE 'south Bohemia'
SELECT (T2.balance - T3.balance) / T3.balance * 100 AS increase_rate FROM loan AS T1          JOIN trans AS T2 ON T1.account_id = T2.account_id          JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T1.date = '1993-07-05' AND T2.date = '1993-03-22' AND T3.date = '1998-12-27'
SELECT CAST(SUM(IIF(T1.status = 'A', 1, 0)) AS REAL) * 100 / COUNT(T1.loan_id) FROM loan AS T1
SELECT CAST(SUM(IIF(T2.status = 'C', 1, 0)) AS REAL) * 100 / COUNT(T2.loan_id) FROM loan AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.amount < 1000000
SELECT T1.account_id, T4.A2, T4.A3 FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T1.date LIKE '1993%' AND T3.gender LIKE 'F' AND T5.type LIKE 'POPLATEK PO OBRATU'
SELECT T3.account_id, T4.frequency  FROM district AS T1  JOIN account AS T3 ON T1.district_id = T3.district_id  JOIN client AS T4 ON T3.client_id = T4.client_id  WHERE T3.frequency = 'POPLATEK MESICNE'  AND T1.A2 = 'east Bohemia'  AND T3.date >= '1995-01-01'  AND T3.date <= '2000-12-31';
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T2.A2, T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.district_id WHERE T1.loan_id = '4990'
SELECT T1.account_id ,  T2.A3, T2.A2 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.A1 WHERE T1.amount = 300000
SELECT T1.loan_id, T3.A3, AVG(T1.amount) AS avg_salary FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.duration = 60 GROUP BY T1.loan_id
SELECT T1.district_id, T4.A13 - T4.A12 AS increment_rate FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T3.account_id = T2.account_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id INNER JOIN loan AS T5 ON T3.account_id = T5.account_id WHERE T5.status = 'D' AND T4.A13 IS NOT NULL AND T4.A12 IS NOT NULL
SELECT      SUM(CASE WHEN T2.A2 = 'Decin' THEN 1 ELSE 0 END) / COUNT(T1.account_id) * 100 FROM      account AS T1 JOIN      district AS T2 ON T1.district_id = T2.district_id WHERE      YEAR(T1.date) = 1993
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';
SELECT T3.district_id ,  COUNT(T2.gender) FROM account AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T2.gender = 'F' GROUP BY T2.district_id ORDER BY COUNT(T2.gender) DESC LIMIT 10
SELECT T1.A2 AS district_name, SUM(T4.amount) AS total_amount FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T2.account_id = T4.account_id WHERE T3.type = 'VYDAJ' AND T4.status != 'ok' AND T3.date LIKE '1996-01%' GROUP BY T1.A2 ORDER BY total_amount DESC LIMIT 10
SELECT COUNT(DISTINCT T2.client_id) FROM district AS T1 INNER JOIN client AS T2 ON T2.district_id = T1.district_id INNER JOIN disp AS T3 ON T3.client_id = T2.client_id WHERE T2.district_id IN (SELECT district_id FROM district WHERE A3 = 'South Bohemia') AND T3.client_id NOT IN (SELECT DISTINCT T4.client_id FROM card AS T4 INNER JOIN disp AS T5 ON T4.disp_id = T5.disp_id WHERE T5.type = 'disp')
SELECT T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T3.district_id = T2.district_id WHERE T1.status = 'C' ORDER BY T1.loan_id DESC LIMIT 1
SELECT AVG(T2.amount) FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M'
SELECT T1.A2 AS District_Name, T1.A3 AS Branch_Location FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A13 = ( SELECT MAX(T3.A13) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE YEAR(T2.date) = 1996 ) AND YEAR(T2.date) = 1996
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A16 = ( SELECT MAX(A16) FROM district WHERE A16 = ( SELECT MAX(A16) FROM district WHERE A16 = ( SELECT MAX(A16) FROM district WHERE A2 = 'NIEP' ) ) )
SELECT COUNT(T1.account_id) FROM trans AS T1 INNER JOIN disp AS T2 ON T2.account_id = T1.account_id WHERE T1.operation = 'VYBER KARTOU' AND T2.type = 'DISPONENCIA' AND T1.balance < 0 AND T1.date LIKE '____-01-__' AND T1.k_symbol = 'PLATBA KARTOU'
SELECT COUNT(T1.loan_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T2.frequency = 'POPLATEK MESICNE' AND T1.amount >= 250000
SELECT COUNT(T1.account_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 1 AND T1.status = 'C'
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T3.account_id = T2.account_id INNER JOIN district AS T4 ON T4.district_id = T1.district_id WHERE T1.gender = 'M' AND T4.A15 = ( SELECT MAX(A15) FROM district WHERE A15 < ( SELECT MAX(A15) FROM district ) ) AND YEAR(T3.date) = 1995
SELECT COUNT(t1.disp_id) FROM disp AS t1 INNER JOIN card AS t2 ON t1.disp_id = t2.disp_id WHERE t2.type = 'gold' AND t1.type = 'disponent'
SELECT COUNT(*) FROM district WHERE A2 = 'PISEK'
SELECT T1.district_id FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'VYVEDENA ZPRATA' AND T2.amount > 10000 AND STRFTIME('%Y', T1.date) = '1997' GROUP BY T1.district_id
SELECT T3.account_id FROM `order` AS T1 INNER JOIN district AS T2 ON T1.bank = T2.A2 INNER JOIN account AS T3 ON T1.account_id = T3.account_id WHERE T1.k_symbol = 'SIPO' AND T2.A3 = 'Pisek'
SELECT T1.account_id FROM card AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold' AND T2.type = 'junior'
SELECT AVG(amount) FROM trans WHERE date LIKE '2021%' AND type = 'VYBER KARTOU';
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN trans AS T4 ON T3.account_id = T4.account_id WHERE T4.type = 'VYBER KARTOU' AND T4.operation = 'VYBER KARTOU' AND strftime('%Y', T4.date) = '1998' GROUP BY T1.client_id HAVING AVG(T4.amount) < ( SELECT AVG(T4.amount) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN trans AS T4 ON T3.account_id = T4.account_id WHERE T4.type = 'VYBER KARTOU' AND T4.operation = 'VYBER KARTOU' AND strftime('%Y', T4.date) = '1998' )
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id INNER JOIN loan AS T4 ON T2.account_id = T4.account_id WHERE T1.gender = 'F'
SELECT COUNT(C.client_id) FROM client AS C LEFT JOIN district AS D ON C.district_id = D.district_id WHERE C.gender = 'F' AND D.A3 = 'south Bohemia'
SELECT T2.account_id FROM district AS T1 INNER JOIN account AS T2 ON T2.district_id = T1.district_id WHERE T2.type = 'OWNER' AND T1.A2 = 'Tabor'
SELECT type FROM account WHERE status = 'O' AND T2.A11 BETWEEN 8000 AND 9000;
SELECT COUNT(DISTINCT T2.account_id) FROM account AS T1 INNER JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.bank_to = 'AB' AND T1.district_id = (SELECT district_id FROM district WHERE A3 = 'NORTH BOOHMIA')
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'
SELECT AVG(T2.A15) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 IN ( SELECT T1.A3 FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE YEAR(T1.date) >= 1997 GROUP BY T2.A3 HAVING COUNT(*) > 4000 ) AND YEAR(T1.date) = 1995
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'CLASSIC' AND T2.type = 'OWNER'
SELECT COUNT(*) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Hl.m. Praha' AND T2.gender = 'M'
SELECT CAST(SUM(CASE WHEN TYPE = 'GOLD' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card
SELECT T2.gender, T2.birth_date, T2.district_id FROM loan AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id ORDER BY T1.amount DESC LIMIT 1
SELECT SUM(CASE WHEN T1.type = 'COMMITTED' AND T2.A15 = 1995 THEN 1 ELSE 0 END) FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount = 532
SELECT T3.district_id FROM `order` AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T1.order_id = 33333
SELECT amount FROM trans WHERE account_id = 3356 AND type = 'VYBER';
SELECT COUNT(*) FROM ( SELECT t1.account_id FROM account AS t1 INNER JOIN loan AS t2 ON t1.account_id = t2.account_id WHERE t2.amount < 200000 AND t1.frequency = 'POPLATEK TYDNE' )
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.client_id = 13539
SELECT T3.A3 FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.client_id = 3541
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'A' GROUP BY T2.district_id ORDER BY count(*) DESC LIMIT 1
SELECT client_id FROM client WHERE client_id IN (SELECT client_id FROM orders WHERE order_id = 32423)
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5)
SELECT SUM(CASE WHEN T1.district_id = 4 THEN 1 ELSE 0 END) FROM account AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.district_id WHERE T2.A3 = 'JESENIK'
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'junior' AND T3.issued > '1996-01-01'
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.district_id) FROM client AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.date BETWEEN DATE('now', 'start of year', '-10 years') AND DATE('now') AND T2.frequency = 'POPLATEK MESICNE' AND T2.district_id IN ( SELECT district_id FROM district WHERE A11 > 10000 )
SELECT CAST(SUM(CASE WHEN strftime('%Y', T2.date) = '1997' THEN T2.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END) FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M'
SELECT COUNT(T1.operation) FROM trans AS T1 INNER JOIN card AS T2 ON T1.account_id = T2.disp_id WHERE T1.type = 'VYBER KARTOU' AND T1.date > '1995-12-31'
SELECT SUM(IIF(A3 = 'NOVICA', 1, 0)) - SUM(IIF(A3 = 'KARLUHOVSKY', 1, 0)) FROM district WHERE A3 IN ('NOVICA', 'KARLUHOVSKY') AND A5 = '1996';
SELECT COUNT(T2.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T2.account_id = T1.account_id WHERE T1.account_id BETWEEN 1 AND 10
SELECT COUNT(T1.k_symbol) FROM `order` AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.account_id = 3 AND T1.k_symbol = 'ACCOUNT_STATEMENT' UNION ALL SELECT SUM(T2.amount) FROM `order` AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.account_id = 3 AND T1.k_symbol = 'DEBIT'
SELECT strftime('%Y', birth_date) FROM client WHERE client_id = 130;
SELECT COUNT(account_id) FROM account WHERE frequency = 'POPLATEK PO OBRATU'
SELECT T1.amount, T1.payments FROM loan AS T1 INNER JOIN disp AS T2 ON T2.account_id = T1.account_id WHERE T2.client_id = 992
SELECT sum(t1.balance) FROM trans AS t1 INNER JOIN account AS t2 ON t1.account_id = t2.account_id INNER JOIN client AS t3 ON t2.district_id = t3.district_id WHERE t1.trans_id = 851 AND t2.account_id = 4
SELECT T2.type FROM client AS T1 INNER JOIN disp AS T3 ON T1.client_id = T3.client_id INNER JOIN card AS T2 ON T3.disp_id = T2.disp_id WHERE T1.client_id = 9
SELECT SUM(T1.amount) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1998-%' AND T2.client_id = 617
SELECT DISTINCT t3.client_id FROM district AS t1 INNER JOIN account AS t2 ON t1.district_id = t2.district_id INNER JOIN disp AS t3 ON t2.account_id = t3.account_id INNER JOIN client AS t4 ON t4.client_id = t3.client_id WHERE t1.A4 = 'East Bohemia' AND t4.birth_date BETWEEN '1983-01-01' AND '1987-12-31'
SELECT T1.client_id FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3
SELECT COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'M' AND T1.birth_date >= DATE('1974-01-01') AND T1.birth_date <= DATE('1976-12-31') AND T3.type = 'PMTT' AND T3.operation = 'PAYMENT' AND T3.k_symbol = 'SIPO' AND T3.amount > 4000
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date > '1996-12-31' AND T2.A2 LIKE '%beroun%'
SELECT COUNT(T2.district_id) FROM client AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.district_id INNER JOIN disp AS T3 ON T3.client_id = T1.client_id INNER JOIN card AS T4 ON T3.disp_id = T4.disp_id WHERE T1.gender = 'F' AND T4.type = 'junior'
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.gender) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T4.A3 = 'Prague'
SELECT CAST(SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client WHERE client_id IN ( SELECT client_id FROM disp WHERE disp_id IN ( SELECT disp_id FROM account WHERE frequency = 'POPLATEK TYDNE' ))
SELECT COUNT(T2.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE';
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status = 'A' AND T2.duration > 24 AND strftime('%Y', T1.date) < '1997' ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'F' ORDER BY T3.birth_date DESC LIMIT 1
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date LIKE '192%' AND T2.A3 = 'OB EC'
SELECT COUNT(*) FROM loan WHERE duration = 24 AND frequency = 'POPLATEK TYDNE';
SELECT AVG(T2.amount) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status = 'C' AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT T2.client_id, T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id IN ( SELECT T3.client_id FROM order AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.k_symbol = 'Permanent' OR T3.client_id IN ( SELECT T4.client_id FROM loan AS T4 INNER JOIN disp AS T5 ON T4.account_id = T5.account_id INNER JOIN client AS T6 ON T5.client_id = T6.client_id ) )
SELECT C.client_id, T2.birth_date FROM card AS T1 INNER JOIN client AS C ON T1.client_id = C.client_id INNER JOIN loan AS T3 ON T3.account_id = T1.disp_id.disp_id INNER JOIN trans AS T2 ON T2.account_id = C.client_id WHERE T1.type = 'GOLD'
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id GROUP BY T1.bond_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT t2.atom_id) FROM molecule AS t1 INNER JOIN connected AS t2 ON t1.molecule_id = t2.molecule_id INNER JOIN atom AS t3 ON t2.atom_id = t3.atom_id WHERE t3.element = 'cl' AND t1.label = '-'
SELECT AVG(T2.element) FROM bond AS T1 INNER JOIN atom AS T2 ON T2.atom_id = T1.atom_id WHERE T1.bond_type = '-'
SELECT AVG(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) FROM molecule AS T1 INNER JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.label = '+'
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'na' AND T1.label = '-'
SELECT a.molecule_id FROM atom a INNER JOIN connected c ON a.atom_id = c.atom_id INNER JOIN bond b ON c.bond_id = b.bond_id INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+' GROUP BY a.molecule_id HAVING COUNT(c.bond_id) = 3
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT count(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM ( SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id LIKE 'TR%' GROUP BY T1.molecule_id ORDER BY T1.molecule_id LIMIT 100 ) AS T1
SELECT molecule_id FROM atom WHERE element = 'si'
SELECT T2.element FROM bond AS T1 INNER JOIN connected AS T3 ON T1.bond_id = T3.bond_id INNER JOIN atom AS T2 ON T3.atom_id = T2.atom_id WHERE T1.bond_id = 'TR004_8_9'
SELECT T2.element FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' = '
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'h' GROUP BY T1.label ORDER BY COUNT(T1.label) DESC LIMIT 1
SELECT bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'te'
SELECT DISTINCT t1.atom_id, t1.atom_id2 FROM connected AS t1 JOIN bond AS t2 ON t1.bond_id = t2.bond_id WHERE t2.bond_type = '-'
SELECT a.atom_id, a.molecule_id  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE a.molecule_id IN (SELECT m.molecule_id                         FROM molecule m                         WHERE m.label = '-')
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element <> 'c' AND T2.molecule_id IN ( SELECT T3.molecule_id FROM molecule AS T3 WHERE T3.label = '-' ) GROUP BY T2.element ORDER BY COUNT(T2.atom_id) ASC LIMIT 1
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id IN ('TR004_8', 'TR004_20') AND T1.atom_id2 IN ('TR004_8', 'TR004_20');
SELECT label FROM molecule WHERE NOT EXISTS (SELECT * FROM atom WHERE molecule_id = molecule.molecule_id AND element != 'sn')
SELECT COUNT(*) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element IN ('i', 's') AND T3.bond_type = '-'
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#';
SELECT T2.atom_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR181' AND T2.molecule_id = 'TR181'
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'f'
SELECT CAST(COUNT(b.molecule_id) FILTER (WHERE b.bond_type = '#' AND a.label = '+') AS REAL) * 100 / COUNT(b.molecule_id) FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id JOIN atom AS a ON (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id)
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T2.bond_id = 'TR001_2_6' AND T3.molecule_id = 'TR001'
SELECT SUM(IIF(label = '+', 1, 0)) - SUM(IIF(label = '-', 1, 0)) AS 'difference' FROM molecule
SELECT T1.atom_id FROM ATOM AS T1 INNER JOIN CONNECTED AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' = ' GROUP BY T2.label ORDER BY COUNT(T1.bond_type) DESC LIMIT 5
SELECT CAST(SUM(bond_type = '=') AS REAL) / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id
SELECT    CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent  FROM    atom AS T1    JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE    T2.molecule_id = 'TR206'
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR000'
SELECT t1.element, t4.label FROM atom AS t1 INNER JOIN connected AS t2 ON t1.atom_id = t2.atom_id INNER JOIN bond AS t3 ON t2.bond_id = t3.bond_id INNER JOIN molecule AS t4 ON t1.molecule_id = t4.molecule_id WHERE t4.label IN ('+', '-') AND t1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND t1.molecule_id = 'TR060'
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T1.molecule_id = 'TR018' GROUP BY T2.bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-' GROUP BY T1.molecule_id HAVING COUNT(*) = 2 AND T1.label != '-' ORDER BY T1.label LIMIT 3
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id LIMIT 2
SELECT COUNT(*) FROM bond WHERE bond_id LIKE 'TR009_%' AND bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12')
SELECT COUNT(T1.label) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'
SELECT bond_type, atom_id, atom_id2 FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR001_6_9'
SELECT T2.molecule_id ,  T1.label FROM molecule AS T1  INNER JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id  INNER JOIN atom AS T4 ON T3.atom_id = T4.atom_id  WHERE T4.atom_id = 'TR001_10' AND T1.label = '+';
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id LIKE 'TR%_19'
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT T3.label FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN 21 AND 25 AND T3.label = '+'
SELECT T2.bond_type FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T2 ON T3.bond_id = T2.bond_id  WHERE T1.element = 'p'  INTERSECT  SELECT T2.bond_type FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T2 ON T3.bond_id = T2.bond_id  WHERE T1.element = 'n'
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id GROUP BY T2.bond_type HAVING COUNT(*) = (SELECT COUNT(*) FROM bond AS T3 JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T4.label = '+' GROUP BY T3.bond_type ORDER BY COUNT(*) DESC LIMIT 1)
SELECT AVG(T1.count) FROM ( SELECT COUNT(T2.bond_id) AS count FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'i' GROUP BY T1.atom_id ) AS T1
SELECT T2.bond_type FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE SUBSTR(atom_id, 7, 2) + 0 = 45
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id NOT IN (SELECT T2.atom_id FROM connected AS T2)
SELECT a1.element FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN atom a2 ON a2.atom_id = c1.atom_id2 JOIN bond b ON c1.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = 'TR447' AND b.bond_type = '#'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.label = 'TR144_8_19'
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_type = '=' GROUP BY T2.label ORDER BY COUNT(T3.bond_type) DESC LIMIT 1
SELECT atom.element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY atom.element ORDER BY COUNT(atom.element) ASC LIMIT 1
SELECT T2.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT COUNT(bond_id) * 100.0 / COUNT(atom_id) AS percentage_with_most_common_combination FROM connected WHERE (atom_id, atom_id2) IN ( SELECT atom_id, atom_id2 FROM connected WHERE (atom_id, atom_id2) IN ( SELECT atom_id, atom_id2 FROM connected GROUP BY atom_id, atom_id2 ORDER BY COUNT(*) DESC LIMIT 1 ) GROUP BY atom_id, atom_id2 )
SELECT CAST(COUNT(CASE WHEN bond.bond_type = '-' THEN 1 END) AS REAL) / COUNT(bond.bond_id) FROM bond WHERE bond.molecule_id IN (SELECT molecule.molecule_id FROM molecule WHERE molecule.label = '+');
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')
SELECT T2.atom_id2 FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'
SELECT T2.bond_type FROM molecule AS T1  JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id  JOIN atom AS T4 ON T3.atom_id = T4.atom_id  JOIN bond AS T2 ON T3.bond_id = T2.bond_id  WHERE T4.element = 'sn'
SELECT COUNT(DISTINCT T2.element) FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id IN ( SELECT bond_id FROM bond WHERE bond_type = '-' )
SELECT COUNT(atom.atom_id) FROM connected AS connected JOIN bond AS bond ON connected.bond_id = bond.bond_id JOIN atom AS atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '#' AND atom.element = 'p' UNION SELECT COUNT(atom.atom_id) FROM connected AS connected JOIN bond AS bond ON connected.bond_id = bond.bond_id JOIN atom AS atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '#' AND atom.element = 'br'
SELECT b.bond_id  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  JOIN molecule m ON a1.molecule_id = m.molecule_id  WHERE m.label = '+'
SELECT m.molecule_id  FROM molecule m  LEFT JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '-'  GROUP BY m.molecule_id  HAVING COUNT(DISTINCT b.bond_id) = 1 AND COUNT(DISTINCT a.atom_id) = 2
SELECT COUNT(atom_id) / (SELECT COUNT(bond_id) FROM bond WHERE bond_type = '-') * 100 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'cl' AND T1.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-')
SELECT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-'
SELECT count(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR030' AND T2.element = 'cl'
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM bond WHERE EXISTS (SELECT 1 FROM atom WHERE atom.molecule_id = bond.molecule_id AND atom.element = 'i')
SELECT CASE WHEN label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS Result FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'ca' GROUP BY molecule.molecule_id HAVING MAX(label);
SELECT COUNT(T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_1_8' AND T1.element IN ('cl', 'c')
SELECT T.molecule_id FROM ( SELECT molecule_id FROM bond WHERE bond_type = '#' GROUP BY molecule_id HAVING COUNT(DISTINCT bond_id) = 3 ) AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'c' GROUP BY T1.molecule_id HAVING COUNT(DISTINCT T3.atom_id) = 3 AND COUNT(DISTINCT T2.bond_id) = 3 AND T1.molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' )
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+';
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id INNER JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T4.molecule_id = 'TR001'
SELECT molecule_id FROM bond WHERE bond_type = '='
SELECT DISTINCT T3.atom_id, T4.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id INNER JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_type = '#'
SELECT T2.element FROM bond AS T1  INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id  INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T1.bond_id = 'TR005_16_26' AND T3.element = 'cl'
SELECT COUNT(*) FROM molecule AS t1 JOIN connected AS t2 ON t1.molecule_id = t2.molecule_id JOIN bond AS t3 ON t2.bond_id = t3.bond_id WHERE t1.label = '-' AND t3.bond_type = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_10_11'
SELECT T1.bond_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T1.bond_type = '#' GROUP BY T1.bond_id HAVING COUNT(*) = 3
SELECT SUM(CASE WHEN element = 'cl' THEN 1 ELSE 0 END) as Chlorine,         SUM(CASE WHEN element = 'c' THEN 1 ELSE 0 END) as Carbon,         SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) as Hydrogen,         SUM(CASE WHEN element = 'o' THEN 1 ELSE 0 END) as Oxygen,         SUM(CASE WHEN element = 's' THEN 1 ELSE 0 END) as Sulfur,         SUM(CASE WHEN element = 'n' THEN 1 ELSE 0 END) as Nitrogen,         SUM(CASE WHEN element = 'p' THEN 1 ELSE 0 END) as Phosphorus,         SUM(CASE WHEN element = 'na' THEN 1 ELSE 0 END) as Sodium,         SUM(CASE WHEN element = 'br' THEN 1 ELSE 0 END) as Bromine,         SUM(CASE WHEN element = 'f' THEN 1 ELSE 0 END) as Fluorine,         SUM(CASE WHEN element = 'i' THEN 1 ELSE 0 END) as Iodine,         SUM(CASE WHEN element = 'sn' THEN 1 ELSE 0 END) as Tin,         SUM(CASE WHEN element = 'pb' THEN 1 ELSE 0 END) as Lead,         SUM(CASE WHEN element = 'te' THEN 1 ELSE 0 END) as Tellurium,         SUM(CASE WHEN element = 'ca' THEN 1 ELSE 0 END) as Calcium  FROM      atom  JOIN      connected ON atom.atom_id = connected.atom_id  JOIN      molecule ON atom.molecule_id = molecule.molecule_id  WHERE      molecule.label = '+' AND      substr(atom.atom_id, 7, 
SELECT SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) * 100.0 / COUNT(element) AS ratio, label FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR006'
SELECT T3.carcinogenic FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.element = 'ca' AND T3.label = '+'
SELECT b.bond_type FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.element = 'te'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.molecule_id = SUBSTR('TR001_10_11', 1, 5) AND T2.atom_id = SUBSTR('TR001_10_11', 7, 2) OR T2.atom_id2 = SUBSTR('TR001_10_11', 10, 2)
SELECT CAST(COUNT(DISTINCT CASE WHEN EXISTS (SELECT 1 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id AND T2.bond_type = '#' WHERE T1.atom_id = A.atom_id OR T1.atom_id2 = A.atom_id) THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT A.atom_id) AS percent_of_compounds FROM atom AS A
SELECT CAST(SUM(CASE WHEN T1.bond_type = ' = ' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent  FROM bond AS T1  INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id  INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T3.molecule_id = 'TR047' AND T2.atom_id2 = T2.atom_id
SELECT CASE WHEN t2.label = '+' THEN 'Yes' ELSE 'No' END FROM atom t1  JOIN molecule t2 ON t1.molecule_id = t2.molecule_id  WHERE t1.atom_id = 'TR001_1'
SELECT molecule.label FROM molecule WHERE molecule.molecule_id = 'TR151'
SELECT DISTINCT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE a.molecule_id = 'TR151' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id BETWEEN 'TR010' AND 'TR050' AND T1.element = 'c'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT DISTINCT T3.bond_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T2.element IN ('h', 'cl') AND T1.atom_id = ( SELECT atom_id FROM atom WHERE element = 'cl' GROUP BY atom_id HAVING COUNT(*) = 2 ) AND T3.bond_type = '=' AND T2.molecule_id IN ( SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' )
SELECT COUNT(DISTINCT T2.atom_id) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.atom_id IN (SELECT atom_id FROM atom WHERE element = 'h')
SELECT a.molecule_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'TR000_1' AND b.bond_id = 'TR00_1_2'
SELECT a.atom_id FROM atom AS a LEFT JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label != '-' AND a.atom_id NOT IN (SELECT a.atom_id FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id WHERE a.element = 'c' AND m.label = '-')
SELECT CAST(COUNT(CASE WHEN label = '+' THEN 1 END) * 100.0 / COUNT(molecule_id) AS REAL) AS 'percentage' FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE element = 'h';
SELECT T1.molecule_id, T1.label FROM molecule AS T1 INNER JOIN ( SELECT molecule_id FROM atom WHERE element = 'cl' OR element = 'h' ) AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT a.atom_id  FROM atom a  INNER JOIN connected c ON a.atom_id = c.atom_id  INNER JOIN molecule m ON m.molecule_id = a.molecule_id  WHERE m.molecule_id = 'TR186';
SELECT bond_type FROM bond WHERE molecule_id = 'TR007'
SELECT DISTINCT t1.element FROM atom AS t1 INNER JOIN connected AS t2 ON t1.atom_id = t2.atom_id INNER JOIN bond AS t3 ON t3.bond_id = t2.bond_id WHERE t3.bond_id = 'TR001_2_4'
SELECT COUNT(T1.bond_id) FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.molecule_id = 'TR006' AND T2.bond_type = '=';
SELECT molecule.label, atom.element FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT bond.bond_type,atom.atom_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id INNER JOIN atom AS T4 ON T2.atom_id = T4.atom_id WHERE T3.bond_type = '#' AND T4.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY T1.label HAVING COUNT(DISTINCT T4.element) = 3
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_2_3'
SELECT COUNT(b.bond_id) FROM bond AS b INNER JOIN connected AS c ON b.bond_id = c.bond_id INNER JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.element = 'cl'
SELECT T1.atom_id, COUNT(*) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id
SELECT COUNT(DISTINCT T2.molecule_id) FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_type = ' = ' AND T2.label = '+'
SELECT COUNT(T1.molecule_id)  FROM molecule AS T1  LEFT JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id  LEFT JOIN bond AS T3 ON T2.bond_id = T3.bond_id  LEFT JOIN atom AS T4 ON T2.atom_id = T4.atom_id  WHERE T3.bond_type != '=' AND T4.element != 's' AND T4.atom_id IS NULL
SELECT molecule.label FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR001_2_4'
SELECT COUNT(DISTINCT atom_id) FROM atom WHERE molecule_id = 'TR005';
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '-'
SELECT DISTINCT T1.label  FROM molecule AS T1  JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T3.element = 'cl' AND T1.label = '+'
SELECT DISTINCT T2.label FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T3.atom_id = T1.atom_id WHERE T3.element = 'c' GROUP BY T2.label HAVING COUNT(DISTINCT T3.atom_id) = (SELECT COUNT(atom_id) FROM atom WHERE element = 'c' INTERSECT SELECT atom_id FROM connected WHERE molecule_id IN (SELECT molecule_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'c')))
SELECT CAST(COUNT(T1.molecule_id) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'cl'
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_id = 'TR001_3_4')
SELECT T3.bond_type FROM connected AS T1 JOIN bond AS T3 ON T1.bond_id = T3.bond_id JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T1.atom_id = 'TR000_1' AND T2.atom_id = 'TR000_2'
SELECT T2.molecule_id FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN molecule AS T2 ON T2.molecule_id = T3.molecule_id WHERE T1.atom_id IN ('TR000_2', 'TR000_4') GROUP BY T2.molecule_id HAVING COUNT(T3.atom_id) = 2
SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON T2.atom_id = T1.atom_id WHERE T2.atom_id = 'TR000_1'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' GROUP BY T1.label HAVING COUNT(*) > 3
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) FROM bond
SELECT COUNT(DISTINCT T2.molecule_id) AS num_carcinogenic_nitrogen FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'n' AND T2.label = '+'
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 's' AND b.bond_type = ' = '
SELECT molecule_id FROM molecule WHERE label = '-' GROUP BY molecule_id HAVING COUNT(molecule_id) > 5
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR024' AND T3.bond_type = '='
SELECT T1.molecule_id, COUNT(*) FROM ATOM AS T1 JOIN Molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT CAST(SUM(T1.label = '+') AS REAL) * 100.0 / COUNT(T2.molecule_id) FROM molecule AS T1 INNER JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id INNER JOIN atom AS T4 ON T3.atom_id = T4.atom_id INNER JOIN bond AS T5 ON T3.bond_id = T5.bond_id WHERE T4.element = 'h' AND T5.bond_type = '#' AND T4.molecule_id = T1.molecule_id
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T3.molecule_id = T1.molecule_id WHERE T1.label = '+';
SELECT COUNT(T1.molecule_id) FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.bond_type = '-' AND T3.molecule_id BETWEEN 'TR004' AND 'TR010'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(T2.molecule_id) FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'o' AND T2.bond_type = '=' GROUP BY T2.molecule_id
SELECT COUNT(T2.molecule_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.label = '-'
SELECT DISTINCT T2.element, T3.bond_type FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id  =  T2.atom_id JOIN bond AS T3 ON T3.bond_id  =  T1.bond_id WHERE T2.molecule_id  =  'TR016'
SELECT DISTINCT T1.atom_id FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c' AND T2.bond_type = '= ' AND T3.atom_id IN ( SELECT atom_id FROM atom WHERE molecule_id = 'TR012' )
SELECT T2.atom_id FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.element = 'o' AND T3.label = '+'
SELECT T1.name FROM cards AS T1 INNER JOIN cards AS T2 ON T1.cardKingdomFoilId = T2.cardKingdomId WHERE T1.cardKingdomId IS NOT NULL
SELECT * FROM cards WHERE borderColor = 'borderless' AND NOT cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL
SELECT name FROM cards ORDER BY CAST(faceConvertedManaCost AS REAL) DESC
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100
SELECT T2.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.type = 'expansion' AND T2.rarity = 'mythic' AND T2.uuid IN ( SELECT DISTINCT T3.uuid FROM legalities AS T3 INNER JOIN formats AS T4 ON T3.format = T4.name WHERE T4.name = 'gladiator' AND T3.status = 'Banned' )
SELECT T1.format, T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'vintage' AND T2.types = 'Artifact' AND T2.side IS NULL
SELECT id, artist FROM cards WHERE (power = '*' OR power IS NULL) AND EXISTS(SELECT 1 FROM legalities WHERE uuid = cards.uuid AND format = 'commander' AND status = 'Legal')
SELECT T1.text, T2.date, T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Stephen Daniel' AND T1.hasContentWarning = 1
SELECT text FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Sublime Epiphany' AND number = '74s')
SELECT name, artist FROM cards WHERE isPromo = 1 ORDER BY strlen(rulingText) DESC LIMIT 1
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29';
SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards
SELECT T2.name, SUM(T2.totalSetSize) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T2.code = T1.setCode WHERE T1.language = 'Italian' GROUP BY T2.name
SELECT COUNT(DISTINCT T2.type) FROM cards AS T1 INNER JOIN cards AS T2 ON T1.artist = T2.artist WHERE T2.artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(id) FROM cards WHERE power = '*'
SELECT T2.promoTypes FROM cards AS T1 INNER JOIN sets AS T2 ON T2.code = T1.setCode WHERE T1.name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originaltype FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT T2.language FROM sets AS T1 INNER JOIN card_translations AS T2 ON T1.code = T2.setcode WHERE T2.name = 'Angel of Mercy'
SELECT COUNT(id) FROM cards WHERE legalities LIKE '%"status": "restricted"%' AND isTextless = 0
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen'
SELECT COUNT(*) FROM cards WHERE isStarter = 1 AND status = 'restricted'
SELECT status FROM legalities WHERE uuid = ( SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle' )
SELECT type FROM cards WHERE name = 'Benalish Knight';
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T1.language = 'Phyrexian'
SELECT CAST(COUNT(CASE WHEN borderColor = 'borderless' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(id) FROM cards
SELECT COUNT(T1.language) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'German' AND T2.isReprint = 1
SELECT COUNT(uuid) FROM cards WHERE borderColor = 'borderless' AND language = 'Russian'
SELECT CAST(SUM(CASE WHEN language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE isStorySpotlight = 1
SELECT COUNT(uuid) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'
SELECT id FROM cards WHERE convertedManaCost = 0
SELECT layout FROM cards WHERE keywords LIKE '%flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel'
SELECT T1.cardKingdomId FROM cards AS T1 INNER JOIN cards AS T2 ON T1.id = T2.id WHERE T1.cardKingdomFoilId IS NOT NULL AND T2.cardKingdomFoilId IS NULL
SELECT T2.id FROM cards AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.duelDeck WHERE T1.duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT DISTINCT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.uuid WHERE T2.language = 'zh'
SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T1.language = 'Japanese' AND T2.availability = 'paper'
SELECT count(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white'
SELECT T1.uuid, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy'
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'
SELECT COUNT(T1.id), T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future'
SELECT T1.name ,  T1.colorIdentity FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.setCode = 'OGW'
SELECT T2.language, T1.name FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.setCode = '10E' AND T1.convertedManaCost = 5
SELECT T1.name, T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT colors FROM cards WHERE id BETWEEN 1 AND 20; SELECT format FROM cards WHERE id BETWEEN 1 AND 20;
SELECT COUNT(T1.name) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B' AND T2.language <> ''
SELECT name FROM cards WHERE rarity = 'uncommon' ORDER BY rulingDate ASC LIMIT 3
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL
SELECT COUNT(id) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId
SELECT COUNT(*) FROM cards WHERE artist = 'U D O N' AND availability = 'mtgo' AND hand = -1
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability = 'paper' AND availability = 'mtgo'
SELECT SUM(T1.convertedManaCost) FROM cards AS T1 INNER JOIN artist AS T2 ON T1.artist = T2.name WHERE T2.name = 'Rob Alexander'
SELECT DISTINCT T2.type FROM cards AS T1 INNER JOIN cards AS T2 ON T1.subtypes = T2.subtypes WHERE T1.availability = 'arena' AND T1.type != 'Other';
SELECT setCode FROM set_translations WHERE language = 'Spanish';
SELECT CAST(SUM(CASE WHEN T2.hand = '+3' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.frameEffects = 'legendary'
SELECT ROUND(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(id), 2) AS percent, id FROM cards WHERE isStorySpotlight = 1 GROUP BY id ORDER BY percent;
SELECT CAST(SUM(CASE WHEN language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage, name FROM cards WHERE language = 'Spanish' ORDER BY name
SELECT t1.language FROM set_translations AS t1 INNER JOIN sets AS t2 ON t1.setCode = t2.code WHERE t2.baseSetSize = 309
SELECT COUNT(*) FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)'
SELECT uuid FROM cards WHERE type LIKE '%Creature%' AND status = 'legal'
SELECT DISTINCT T2.types FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'German' AND T2.subtypes IS NOT NULL AND T2.supertypes IS NOT NULL
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL AND T2.power = '*'
SELECT count(*) FROM cards WHERE format = 'premodern' AND rulingText LIKE 'This is a triggered mana ability' AND side IS NULL
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Erica Yang' AND T2.format = 'pauper' AND T1.availability = 'paper'
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation'
SELECT T2.text FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Matthew D. Wilson' AND T1.type = 'Creature' AND T1.layout = 'normal' AND T1.borderColor = 'black' AND T2.language = 'French'
SELECT COUNT(T1.uuid) FROM ruling_texts AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.rarity = 'rare' AND T1.date = '2009-01-10'
SELECT T3.language FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode INNER JOIN set_translations AS T3 ON T1.code = T3.setCode WHERE T2.baseSetSize = 180
SELECT CAST(SUM(CASE WHEN `hasContentWarning` = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM legalities AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T2.`hasContentWarning` = 0 AND T1.format = 'commander' AND T1.status = 'legal'
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.power) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'
SELECT CAST(SUM(IIF(T2.type = 'expansion', 1, 0)) AS REAL) * 100 / COUNT(T1.language) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese'
SELECT availability FROM cards WHERE artist = 'Daren Bader'
SELECT count(*) FROM cards WHERE (edhrecRank > 12000) AND (borderColor = 'borderless')
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.multiverseId = 149934
SELECT T2.name, T2.uuid FROM cards AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL ORDER BY T2.name ASC LIMIT 3
SELECT CAST(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(uuid) FROM cards
SELECT number FROM cards WHERE subtypes = 'angel' AND subtypes = 'wizard' AND side IS NULL
SELECT T2.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.mtgoCode IS NULL OR T1.mtgoCode = '' GROUP BY T1.setCode ORDER BY COUNT(T1.id) DESC LIMIT 3
SELECT language FROM foreign_data WHERE setCode = 'ARC' AND mcmName = 'Archenemy';
SELECT name, translation FROM sets WHERE id = 5 AND translation IS NOT NULL
SELECT language, type FROM sets WHERE id = 206
SELECT T1.code, T1.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Shadowmoor' AND T2.language = 'Italian' GROUP BY T1.code ORDER BY COUNT(T2.language) DESC LIMIT 2
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 AND EXISTS (SELECT 1 FROM foreign_data WHERE language = 'Japanese')
SELECT language FROM sets WHERE language = 'Russian' ORDER BY baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.language = 'Chinese (Simplified)' AND T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1
SELECT COUNT(*) FROM sets WHERE LOWER(language) = 'japanese' AND (mtgoCode IS NULL OR mtgoCode = '');
SELECT id FROM cards WHERE borderColor = 'black'
SELECT id FROM cards WHERE frameEffects = 'extendedart'
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setcode = T2.code WHERE T1.borderColor = 'white' AND T1.isFullArt = 1
SELECT language FROM sets WHERE id = 174
SELECT name FROM sets WHERE code = 'ALL'
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar';
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')
SELECT code FROM sets WHERE type = 'expansion'
SELECT foreign_data.language, foreign_data.text, cards.type FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.watermark = 'boros'
SELECT T2.language, T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'
SELECT CAST(COUNT(convertedManaCost = 10) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode = '10E'
SELECT setCode FROM sets WHERE type = 'expansion commander'
SELECT T1.foreignName, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'abzan'
SELECT T1.language FROM set_translations AS T1 INNER JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T2.watermark = 'azorius'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL
SELECT COUNT(id) FROM cards WHERE availability LIKE '%paper%' AND hand LIKE '+%';
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT DISTINCT t2.supertypes, t2.subtypes FROM cards AS t1 INNER JOIN card_faces AS t2 ON t1.uuid = t2.uuid WHERE t1.name = 'Molimo, Maro-Sorcerer'
SELECT purchaseUrls FROM cards WHERE promotionalTypes = 'bundle';
SELECT COUNT(T1.artist) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.borderColor = 'black' AND T2.availability LIKE '%arena,mtgo%'
SELECT T2.convertedManaCost FROM cards AS T1 INNER JOIN cards AS T2 ON T1.name = T2.name WHERE T1.name = 'Serra Angel' AND T2.name = 'Shrine Keeper' AND T1.convertedManaCost > T2.convertedManaCost
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '2003' ORDER BY T1.convertedManaCost DESC LIMIT 3
SELECT T2.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT COUNT(*) FROM set_translations AS T1 INNER JOIN cards AS T2 ON T2.name = 'Angel of Mercy'
SELECT name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setcode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT EXISTS(SELECT 1 FROM foreign_data WHERE uuid IN ( SELECT uuid FROM cards WHERE name = 'Ancestor's Chosen' ) AND language = 'Korean')
SELECT COUNT(*) FROM cards WHERE setCode = 'hauptset zehnte edition' AND artist = 'Adam Rex'
SELECT baseSetSize FROM sets WHERE translation = 'Hauptset Zehnte Edition'
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T2.code = T1.setCode WHERE T2.name = 'Eighth Edition' AND T1.language = 'Simplified Chinese'
SELECT EXISTS (SELECT 1 FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL)
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor''s Chosen'
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T2.code = T1.setCode WHERE T1.translation = ' Hauptset Zehnte Edition'
SELECT COUNT(T1.name) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.block = 'Ice Age';
SELECT isForeignOnly FROM sets WHERE name = 'Adarkar Valkyrie'
SELECT COUNT(T1.code) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.baseSetSize < 10
SELECT COUNT(*) FROM cards WHERE name = 'Coldsnap' AND borderColor = 'black'
SELECT T2.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' ORDER BY T2.convertedManaCost DESC LIMIT 1
SELECT T2.name FROM cards AS T1 INNER JOIN sets AS T2 ON T2.code = T1.setCode WHERE T2.name = 'Coldsnap' AND T1.artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy')
SELECT * FROM cards WHERE setCode = 'Coldsnap' AND number = 4;
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.power = '*'
SELECT flavorText FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND language = 'Italian'
SELECT T2.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.flavorText IS NOT NULL
SELECT type FROM foreign_data WHERE language = 'German' AND name = 'Ancestor''s Chosen'
SELECT t2.text FROM set_translations AS t1 INNER JOIN foreign_data AS t2 ON t2.uuid = t1.uuid INNER JOIN sets AS t3 ON t3.code = t2.code WHERE t3.name = 'Coldsnap' AND t1.language = 'Italian'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.uuid WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce';
SELECT CAST(SUM(CASE WHEN T2.name = 'Coldsnap' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T2.code = T1.setCode WHERE T1.convertedManaCost = 7
SELECT CAST(SUM(CASE WHEN T2.name = 'Coldsnap' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.cardKingdomId = T1.cardKingdomFoilId AND T1.cardKingdomId IS NOT NULL
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT text FROM cards WHERE artist = 'Jim Pavelec';  SELECT * FROM cards WHERE hasContentWarning = 1 AND artist = 'Jim Pavelec';
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'
SELECT baseSetSize FROM sets WHERE translation = 'Rinascita di Alara'
SELECT TYPE FROM sets WHERE translation = 'Huitième édition'
SELECT s.name FROM sets AS s INNER JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Tendo Ice Bridge' AND st.language = 'French'
SELECT COUNT(*) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Salvat 2011' AND T1.translation IS NOT NULL
SELECT T2.name FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese';
SELECT name FROM cards WHERE setCode = 'JPNH' ORDER BY convertedManaCost DESC LIMIT 1
SELECT releaseDate FROM sets WHERE code = ( SELECT code FROM set_translations WHERE translation = 'Ola de frío' )
SELECT T1.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards WHERE setName = 'World Championship Decks 2004' AND convertedManaCost = '3'
SELECT T1.translations FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Mirrodin' AND T1.language = 'Chinese Simplified';
SELECT CAST(SUM(CASE WHEN T3.language = 'Japanese' THEN T1.isNonFoilOnly ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T3.setCode = T1.setCode WHERE T3.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.name) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.setCode WHERE T2.language = 'Portuguese (Brazil)'
SELECT DISTINCT T2.availability FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Aleksi Briclot' AND T1.isTextless = 1
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'
SELECT code FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT name FROM cards WHERE format = 'duel' ORDER BY CAST(manaCost AS REAL) DESC LIMIT 10
SELECT T1.originalReleaseDate, T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'legal' ORDER BY T1.originalReleaseDate LIMIT 1
SELECT COUNT(*) FROM foreign_data WHERE uuid IN ( SELECT uuid FROM cards WHERE artist = 'Volkan Baçağa' ) AND language = 'French'
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T1.types = 'Enchantment' AND T1.name = 'Abundance' AND T2.format = 'Legal'
SELECT T2.format FROM legalities AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.status = 'banned' GROUP BY T2.format ORDER BY COUNT(T1.status = 'banned') DESC LIMIT 1
SELECT language FROM sets WHERE name = 'Battlebond';
SELECT T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid GROUP BY T1.artist ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.status FROM foreign_data AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '1997' AND T1.name = 'D. Alexander Gregory' AND T1.hasContentWarning = 1 AND T2.format = 'legacy'
SELECT T1.name, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'banned'
SELECT AVG(T1.id) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language
SELECT DISTINCT T1.artist FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.borderColor = 'black' AND T1.availability = 'arena'
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status = 'banned' OR status = 'restricted';
SELECT COUNT(T2.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T2.code = T1.setCode WHERE T1.artist = 'Matthew D. Wilson' AND T1.availability = 'paper'
SELECT T1.text, T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T2.artist = 'Kev Walker' ORDER BY T1.date DESC
SELECT name, T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T3.name = 'Hour of Devastation'
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Korean' AND T2.language NOT LIKE '%Japanese%'
SELECT T2.frameVersion FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' UNION SELECT DISTINCT T2.frameVersion FROM foreign_data AS T2 INNER JOIN legalities AS T3 ON T3.uuid = T2.uuid INNER JOIN sets AS T4 ON T4.code = T3.setCode WHERE T3.status = 'banned' AND T4.name = 'Ninth Edition'
SELECT DisplayName FROM users WHERE Reputation = ( SELECT MAX(Reputation) FROM users ) AND DisplayName IN ('Harlan', 'Jarrod Dixon')
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.UpVotes > 100 AND T2.DownVotes > 1
SELECT COUNT(*) FROM users WHERE CreationDate > '2013-12-31' AND Views > 10
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT T3.DisplayName FROM posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' ORDER BY T1.ViewCount DESC LIMIT 1
SELECT OwnerDisplayName FROM posts WHERE FavoriteCount = ( SELECT MAX(FavoriteCount) FROM posts );
SELECT SUM(T1.CommentCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT T1.AnswerCount FROM Posts AS T1 INNER JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' ORDER BY T1.AnswerCount DESC LIMIT 1
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T2.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL
SELECT DISTINCT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN ( SELECT Id FROM users WHERE Age > 65 ) AND Score > 19
SELECT T3.Location FROM posts AS T1 INNER JOIN users AS T3 ON T3.Id = T1.OwnerUserId WHERE T1.Title = 'Eliciting priors from experts'
SELECT T1.Body FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.TagName = 'bayesian'
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id ORDER BY T1.Count DESC LIMIT 1
SELECT COUNT(badges.Name) FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie'
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT COUNT(T1.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND YEAR(T1.Date) = 2011
SELECT UserDisplayName FROM badges GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT AVG(T1.Count) FROM (SELECT T2.DisplayName, COUNT(T3.Id) AS Count FROM users AS T2 INNER JOIN badges AS T3 ON T2.Id = T3.UserId WHERE T2.Views > 200 GROUP BY T2.Id) AS T1
SELECT CAST(COUNT(CASE WHEN T3.Age > 65 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T3.Id) FROM posts AS T1 INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.Score > 20
SELECT SUM(T1.UpVotes + T1.DownVotes) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Id = 58 AND T1.CreationDate = '2010-07-19'
SELECT DISTINCT T3.CreationDate FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN badges AS T3 ON T1.UserId = T3.UserId ORDER BY COUNT(T1.UserId) DESC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';
SELECT T1.Title FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score = ( SELECT MAX(Score) FROM comments )
SELECT COUNT(Id) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910)
SELECT T2.FavoriteCount FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 3025 AND T1.CreationDate = '2014-04-23 20:29:39.0'
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ParentId = 107829 AND T2.CommentCount = 1
SELECT CASE          WHEN ClosedDate IS NULL THEN 'Yes'         ELSE 'No'       END AS WellFinished  FROM posts  WHERE UserId = 23853    AND CreationDate = '2013-07-12 09:08:18.0'
SELECT t1.Reputation FROM users AS t1 INNER JOIN posts AS t2 ON t1.Id = t2.OwnerUserId WHERE t2.Id = 65041
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini'
SELECT UserDisplayName FROM votes WHERE Id = 6347
SELECT COUNT(VoteTypeId) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(SUM(IIF(T1.OwnerUserId = 24, 1, 0)) AS REAL) / COUNT(T1.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'SilentGhost'
SELECT DISTINCT T2.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'thank you user93!'
SELECT T1.Text FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'A Lion'
SELECT T1.DisplayName, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Understanding what Dassault iSight is doing?'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10
SELECT t1.DisplayName FROM Users AS t1 INNER JOIN Posts AS t2 ON t1.Id = t2.LastEditorUserId WHERE t2.Title = 'Open source tools for visualizing multi-dimensional data'
SELECT T3.title FROM votes AS T1 INNER JOIN posts AS T2 ON T1.postid = T2.id INNER JOIN posts AS T3 ON T3.id = T2.id WHERE T1.lasteditoruserid = ( SELECT id FROM users WHERE displayname = 'Vebjorn Ljosa' )
SELECT T1.LastEditorDisplayName, T2.WebsiteUrl, SUM(T2.Score)  FROM posts AS T1  JOIN users AS T2 ON T1.LastEditorUserId = T2.Id  WHERE T2.DisplayName = 'Yevgeny'  GROUP BY T2.Id
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%variance%' AND T2.BountyAmount = 50
SELECT AVG(T1.ViewCount) FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Tags = T2.TagName WHERE T2.TagName = 'humor'
SELECT COUNT(*) FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT MIN(Views) FROM users
SELECT COUNT(DISTINCT T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Supporter' AND STRFTIME('%Y', T1.Date) = '2011'
SELECT COUNT(DISTINCT T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T2.Id HAVING COUNT(T1.UserId) > 5
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'New York' AND T2.Name = 'Teacher'
SELECT reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 1)
SELECT T.UserId FROM ( SELECT UserId, COUNT(PostId) AS PostCount FROM postHistory GROUP BY UserId ) AS T WHERE T.PostCount = 1 AND ( SELECT SUM(ViewCount) FROM posts WHERE Id = T.UserId ) >= 1000
SELECT T1.BadgeName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN ( SELECT UserId, COUNT(*) AS user_comment_count FROM comments GROUP BY UserId ORDER BY user_comment_count DESC LIMIT 1 ) AS T3 ON T2.Id = T3.UserId
SELECT COUNT(T3.Location) FROM badges AS T1 INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Name = 'Teacher' AND T3.Location = 'India'
SELECT CAST(SUBTRACT(DIVIDE(COUNT(CASE WHEN strftime('%Y', badges.Date) = '2010' THEN 1 END), COUNT(badges.Name)) * 100, DIVIDE(COUNT(CASE WHEN strftime('%Y', badges.Date) = '2011' THEN 1 END), COUNT(badges.Name)) * 100) AS REAL) FROM badges
SELECT PostHistoryTypeId FROM postHistory WHERE PostId = 3720; SELECT DISTINCT UserId FROM comments WHERE PostId = 3720;
SELECT T2.ViewCount FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId = 61217
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395
SELECT p.Id, u.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60
SELECT SUM(t2.FavoriteCount) FROM posts AS t1 INNER JOIN users AS t2 ON t1.OwnerUserId = t2.Id WHERE YEAR(t1.CreationDate) = 2011 AND t2.Id = 686
SELECT CAST(SUM(T1.UpVotes) AS REAL) / COUNT(T2.Id) AS `Avg Upvotes`, AVG(T2.Age) AS `Avg Age` FROM votes AS T1 INNER JOIN users AS T2 ON T2.Id = T1.UserId WHERE T1.PostId IN ( SELECT T1.Id FROM posts AS T1 GROUP BY T1.OwnerUserId HAVING COUNT(T1.OwnerUserId) > 10 )
SELECT COUNT(DISTINCT T2.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08';
SELECT COUNT(T1.Id) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score > 60
SELECT TEXT FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10;
SELECT T.Name FROM badges AS T INNER JOIN users AS A ON T.UserId = A.Id WHERE A.Reputation = ( SELECT MAX(Reputation) FROM users )
SELECT u.Reputation FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'
SELECT T1.Date FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'
SELECT CAST(COUNT(CASE WHEN T1.Name = 'Teacher' THEN T3.UserId ELSE NULL END) AS REAL) * 100 / COUNT(T3.UserId) AS score FROM badges AS T1 INNER JOIN users AS T3 ON T1.UserId = T3.UserId
SELECT ( COUNT( CASE WHEN users.Age BETWEEN 13 AND 18 THEN 1 ELSE NULL END ) * 100 ) / COUNT( users.Id ) FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Organizer'
SELECT SUM(T2.Score) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CreationDate = '2010-07-19 19:19:56.0'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CreationDate = '2010-07-19 19:37:33.0'
SELECT DISTINCT T2.Age FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Vienna, Austria'
SELECT COUNT(DISTINCT U.Id) FROM Users AS U INNER JOIN badges AS B ON U.Id = B.UserId WHERE U.Age BETWEEN 19 AND 65 AND B.Name = 'Supporter'
SELECT T2.Views FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:07.0'
SELECT T2.Name FROM posts AS T1 INNER JOIN badges AS T2 ON T1.OwnerUserId = T2.UserId WHERE T1.OwnerUserId IN ( SELECT OwnerUserId FROM posts ORDER BY Reputation LIMIT 1 )
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')
SELECT COUNT(T1.Name) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Age > 65 AND T1.Name = 'Supporter'
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE LOCATION = 'New York'
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(T1.Id) * 1.0 / COUNT(T2.Id) FROM votes AS T1 INNER JOIN votes AS T2 ON T1.CreationDate LIKE '2010%' INNER JOIN votes AS T3 ON T2.CreationDate LIKE '2011%';
SELECT T1.TagName FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T3.DisplayName = 'John Stauffer'
SELECT COUNT(Id) FROM posts WHERE OwnerDisplayName = 'Daniel Vassallo'
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan');
SELECT T1.Id FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'slashnick' ORDER BY T1.AnswerCount DESC LIMIT 1
SELECT TOP 1 SUM(T1.ViewCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky' OR T2.DisplayName = 'Noah Snyder' GROUP BY T1.OwnerUserId ORDER BY SUM(T1.ViewCount) DESC
SELECT COUNT(DISTINCT T1.PostId) FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T3.DisplayName = 'Matt Parker' AND T1.VoteTypeId = 2 AND T1.PostId > 4
SELECT COUNT(c.id) FROM users u JOIN posts p ON u.id = p.owneruserid JOIN comments c ON p.id = c.postid WHERE u.displayname = 'Neil McGuigan' AND c.score < 60;
SELECT T2.TagName FROM votes AS T1 INNER JOIN posts AS T3 ON T1.PostId = T3.Id INNER JOIN tags AS T2 ON T3.Tags = T2.TagName WHERE T3.OwnerDisplayName = 'Mark Meckes' AND T3.CommentCount = 0
SELECT T3.DisplayName FROM badges AS T1 INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Name = 'Organizer'
SELECT CAST(COUNT(T1.PostId) AS REAL) / COUNT(T2.PostId) AS Percentage FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Tags LIKE '%<R>%' AND T2.DisplayName = 'Community'
SELECT COALESCE(SUM(CASE WHEN T3.DisplayName = 'Mornington' THEN T1.ViewCount ELSE 0 END),0) - COALESCE(SUM(CASE WHEN T3.DisplayName = 'Amos' THEN T1.ViewCount ELSE 0 END),0) FROM posts AS T1 INNER JOIN users AS T3 ON T3.Id = T1.OwnerUserId
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN comments AS T2 ON T1.UserId = T2.UserId WHERE T1.Name = 'Commentator' AND T2.CreationDate BETWEEN '2014-01-01' AND '2014-12-31'
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT DisplayName, Age FROM users WHERE Views = ( SELECT MAX(Views) FROM users );
SELECT T1.LastEditDate , T1.LastEditorUserId FROM posts AS T1 INNER JOIN votes AS T2 ON T1.LastEditorUserId = T2.UserId WHERE T1.Title = 'Detecting a given face in a database of facial images';
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60
SELECT T1.Title, T2.UserDisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score > 60
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE YEAR(T1.Date) = 2011 AND T2.Location = 'North Pole'
SELECT DisplayName, WebsiteUrl FROM users WHERE Id IN (SELECT OwnerUserId FROM posts WHERE FavoriteCount > 150)
SELECT T3.LastEditDate, COUNT(T2.PostId) FROM posts AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.PostId INNER JOIN posts AS T3 ON T2.PostId = T3.Id WHERE T1.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY T2.PostId;
SELECT T1.DisplayName, T1.LastAccessDate, T1.Location FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Outlier' ORDER BY T1.LastAccessDate DESC
SELECT T1.Title FROM posts AS T1 INNER JOIN post_links AS T2 ON T1.Id = T2.RelatedPostId INNER JOIN posts AS T3 ON T2.PostId = T3.Id WHERE T3.Title = 'How to tell if something happened in a data set which monitors a value over time'
SELECT T1.PostId, T2.Name FROM postHistory AS T1 INNER JOIN badges AS T2 ON T1.UserId = T2.UserId WHERE YEAR(T1.CreationDate) = 2013 AND T2.Name = 'Samuel'
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1
SELECT T4.DisplayName, T4.Location FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId INNER JOIN users AS T4 ON T1.OwnerUserId = T4.Id WHERE T2.TagName = 'hypothesis-testing'
SELECT T1.Title, T2.LinkTypeId FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.RelatedPostId WHERE T1.Title = 'What are principal component scores?'
SELECT T2.ParentId, T2.Score, T2.OwnerDisplayName FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ParentId IS NOT NULL ORDER BY T2.Score DESC LIMIT 1
SELECT u.DisplayName, u.WebsiteUrl FROM users AS u INNER JOIN votes AS v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1
SELECT Title FROM Posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);
SELECT T2.age FROM users AS T1 INNER JOIN posts AS T2 ON T1.id = T2.owneruserid GROUP BY T1.id ORDER BY AVG(T1.reputation) DESC LIMIT 1
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE YEAR(T1.CreationDate) = 2012 AND T2.BountyAmount = 50
SELECT Age, Id FROM users ORDER BY Age ASC LIMIT 1;
SELECT T1.Score FROM posts AS T1 INNER JOIN tags AS T2 ON T2.ExcerptPostId = T1.Id OR T2.WikiPostId = T1.Id ORDER BY T2.Count DESC LIMIT 1
SELECT AVG(SUM(IIF(EXTRACT(YEAR FROM CreationDate) = 2010 AND AnswerCount <= 2, 1, 0))) FROM posts
SELECT T1.Id FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 1465 ORDER BY T1.FavoriteCount DESC LIMIT 1
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id ORDER BY T1.CreationDate ASC LIMIT 1
SELECT T3.DisplayName FROM badges AS T1 INNER JOIN users AS T3 ON T1.UserId = T3.Id GROUP BY T3.DisplayName ORDER BY COUNT(T1.Name) DESC LIMIT 1
SELECT MIN(T3.CreationDate) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T1.PostId = T3.Id WHERE T2.DisplayName = 'chl';
SELECT MIN(CreationDate) AS "date when the youngest user made his or her first post" FROM users;
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date ASC LIMIT 1
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location = 'United Kingdom' AND T2.FavoriteCount >= 4
SELECT AVG(T1.PostId) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id ORDER BY T2.Age DESC LIMIT 1
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;
SELECT COUNT(id) FROM users WHERE reputation > 2000 AND views > 1000
SELECT DISTINCT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Age BETWEEN 19 AND 65
SELECT COUNT(*) FROM posts WHERE LastEditorDisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010;
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1
SELECT T1.Id, T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id ORDER BY T1.Score DESC LIMIT 1
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner'
SELECT DISTINCT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount > 20000 AND YEAR(T1.CreationDate) = 2011
SELECT T1.id, T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE strftime('%Y', T1.CreationDate) = '2010' ORDER BY T1.FavoriteCount DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T1.CreationDate BETWEEN '2011-01-01' AND '2011-12-31' AND T1.Reputation > 1000 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.Id) FROM users AS T1
SELECT CAST(COUNT(IIF(Age BETWEEN 13 AND 18, 1, NULL)) AS REAL) * 100 / COUNT(Id) FROM users
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Computer Game Datasets' ORDER BY T2.CreationDate DESC LIMIT 1
SELECT COUNT(1) FROM posts WHERE ViewCount > ( SELECT AVG(ViewCount) FROM posts );
SELECT COUNT(Id) FROM comments WHERE PostId = ( SELECT Id FROM posts WHERE Score = ( SELECT MAX(Score) FROM posts ) )
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT T2.DisplayName, T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Id = 183 ORDER BY T1.LastEditDate DESC LIMIT 1
SELECT T3.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN badges AS T3 ON T1.UserId = T3.UserId WHERE T2.DisplayName = 'Emmett' ORDER BY T3.Date DESC LIMIT 1
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age BETWEEN 19 AND 65 AND T2.VoteTypeId = 1 AND T2.UpVotes > 5000
SELECT DATEDIFF(T2.Date, T1.CreationDate) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Zolomon'
SELECT COUNT(T2.Id) AS num_posts, COUNT(T3.Id) AS num_comments FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN comments AS T3 ON T1.Id = T3.UserId WHERE T1.CreationDate = (SELECT MAX(CreationDate) FROM users)
SELECT T1.Text, T2.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.PostId IN (SELECT Id FROM posts WHERE Title = 'Analysing wind data with R') ORDER BY T1.CreationDate DESC LIMIT 1
SELECT COUNT(T2.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Citizen Patrol'
SELECT COUNT(*) FROM posts WHERE SUBSTR(tags, 2, INSTR(tags, ',', 2) - 2) = 'careers' OR SUBSTR(tags, INSTR(tags, ',', -1) + 1) = 'careers';
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT SUM(IIF(PostTypeId = 1, 1, 0)) AS 'Answers', SUM(IIF(PostTypeId = 2, 1, 0)) AS 'Comments' FROM posts WHERE Title = 'Clustering 1D data';
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';
SELECT COUNT(Id) FROM votes WHERE BountyAmount >= 30
SELECT DIVIDE(COUNT(CASE WHEN T2.Score >= 50 THEN T1.Id ELSE NULL END), COUNT(T1.Id)) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.OwnerUserId = ( SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1 )
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*) FROM tags WHERE Count <= 20 AND Id < 15
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT T2.Reputation, T2.UpVotes FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'fine, you win :)'
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'How can I adapt ANOVA for binary data?'
SELECT T3.Text FROM posts AS T1 INNER JOIN comments AS T3 ON T1.Id = T3.PostId WHERE T1.ViewCount BETWEEN 100 AND 150 ORDER BY T3.Score DESC LIMIT 1;
SELECT T1.CreationDate, T1.Age FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE '%http://%'
SELECT COUNT(T1.PostId) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score = 0 AND T2.ViewCount < 5
SELECT COUNT(T2.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CommentCount = 1 AND T2.Score = 0
SELECT COUNT(T1.OwnerUserId) FROM comments AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score = 0 AND T2.Age = 40
SELECT T2.PostId FROM Posts AS T1 INNER JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Group differences on a five point Likert item'
SELECT T1.UpVotes FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'R is also lazy evaluated.'
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky'
SELECT T2.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0
SELECT CAST(COUNT(CASE WHEN T1.UpVotes = 0 THEN T1.UserId ELSE NULL END) AS REAL) * 100 / COUNT(T1.UserId) FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Score BETWEEN 5 AND 10
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(T2.hero_id) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero AS t1 INNER JOIN hero_power AS t2 ON t1.id = t2.hero_id INNER JOIN superpower AS t3 ON t3.id = t2.power_id WHERE t1.height_cm > 200 AND t3.power_name = 'Super Strength'
SELECT T2.full_name FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id GROUP BY T1.hero_id HAVING COUNT(T2.full_name) > 15
SELECT COUNT(superhero_name) FROM superhero WHERE eye_colour_id = 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(T2.power_name) FROM colour AS T1 INNER JOIN hero_power AS T2 ON T2.hero_id = T1.id INNER JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.colour = 'Blue' AND T3.power_name = 'Agility'
SELECT T2.superhero_name FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Agility' AND T1.colour = 'Blue' AND T2.hair_colour_id = 1
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics';
SELECT full_name FROM superhero WHERE height_cm = ( SELECT MAX(height_cm) FROM superhero WHERE publisher_name = 'Marvel Comics' ) AND publisher_name = 'Marvel Comics'
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.superhero_name = 'Sauron'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T1.eye_colour_id = 3 AND T2.publisher_name = 'Marvel Comics'
SELECT AVG(T2.height_cm) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics'
SELECT CAST(SUM(CASE WHEN T2.power_name = 'Super Strength' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' )
SELECT COUNT(*) FROM superhero WHERE publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'DC Comics' )
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id INNER JOIN attribute AS T4 ON T4.id = T3.attribute_id WHERE T4.attribute_name = 'Speed' ORDER BY T3.attribute_value ASC LIMIT 1
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.eye_colour_id = (SELECT id FROM colour WHERE colour = 'Gold') AND T2.publisher_name = 'Marvel Comics'
SELECT publisher_name FROM publisher WHERE id = (SELECT publisher_id FROM superhero WHERE superhero_name = 'Blue Beetle II')
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = ( SELECT id FROM colour WHERE colour = 'Blond' )
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Intelligence' ) ORDER BY T1.attribute_value LIMIT 1
SELECT T3.race FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.superhero_name = 'Copycat';
SELECT COUNT(*) FROM hero_attribute WHERE attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Durability' ) AND attribute_value < 50
SELECT superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.gender_id = 2 AND T3.attribute_name = 'Strength' AND T2.attribute_value = 100
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race = 'Vampire'
SELECT CAST(SUM(T1.alignment_id = 2) AS REAL) * 100 / COUNT(T2.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT publisher_name, COUNT(*) FROM superhero WHERE publisher_name = 'DC Comics' OR publisher_name = 'Marvel Comics' GROUP BY publisher_name
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(T1.attribute_value) FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id
SELECT count(*) FROM superhero WHERE full_name IS NULL
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Deathlok'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female';
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.gender_id = 1 LIMIT 5
SELECT T2.superhero_name FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Alien'
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id != 1
SELECT power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 56
SELECT full_name FROM superhero WHERE race_id = ( SELECT id FROM race WHERE race = 'Demi-God' ) LIMIT 5
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2
SELECT T1.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T4.colour FROM superhero AS T1 INNER JOIN colour AS T4 ON T1.hair_colour_id = T4.id WHERE T1.race = 'human' AND T1.height_cm = 185
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T2.publisher_id = 13 THEN 1 END) AS REAL) * 100 / COUNT(T2.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T2.id = T1.publisher_id WHERE T1.height_cm BETWEEN 150 AND 180
SELECT full_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) FROM superhero) * 0.79
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id GROUP BY T1.id ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1
SELECT COUNT(T2.hero_id) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'stealth'
SELECT T3.full_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'strength' ORDER BY T1.attribute_value DESC LIMIT 1
SELECT COUNT(T1.id) / (SELECT COUNT(*) FROM colour WHERE id = 1) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.id != 1
SELECT COUNT(*) FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id WHERE publisher_name = 'Dark Horse Comics';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T3.attribute_name = 'Durability' AND T4.publisher_name = 'Dark Horse Comics' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT T.colour FROM ( SELECT `colour`.colour FROM superhero AS T INNER JOIN colour AS `colour` ON T.eye_colour_id = `colour`.id WHERE T.full_name = 'Abraham Sapien' ) AS T
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T3.power_name = 'Flight'
SELECT t1.eye_colour_id, t1.hair_colour_id, t1.skin_colour_id FROM superhero AS t1 INNER JOIN gender AS t2 ON t2.id = t1.gender_id INNER JOIN publisher AS t3 ON t3.id = t1.publisher_id WHERE t2.gender = 'Female' AND t3.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name, T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' AND T2.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.gender) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13';
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(T1.power_id) FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Amazo'
SELECT T4.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T4 ON T2.power_id = T4.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T3.superhero_name FROM hero_attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.hero_id = T2.hero_id INNER JOIN superhero AS T3 ON T3.id = T1.hero_id INNER JOIN colour AS T4 ON T4.id = T1.hair_colour_id INNER JOIN colour AS T5 ON T5.id = T2.eye_colour_id WHERE T5.colour = 'black' AND T4.colour = 'black'
SELECT T1.eye_colour_id FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'
SELECT full_name FROM superhero WHERE race = 'Vampire'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(T2.attribute_id) FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T2.attribute_name = 'Strength' AND T1.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute AS T3 INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Strength' )
SELECT race.race, alignment.alignment FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT AVG(weight_kg) FROM superhero WHERE race = 'Alien';
SELECT ( SELECT SUM(T2.weight_kg) FROM superhero AS T2 WHERE T2.full_name = 'Emil Blonsky' ) - ( SELECT SUM(T1.weight_kg) FROM superhero AS T1 WHERE T1.full_name = 'Charles Chandler' )
SELECT AVG(T1.height_cm) FROM superhero AS T1
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination';
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.race = 'god/eternal' AND T3.gender = 'Male'
SELECT T2.superhero_name FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id WHERE T1.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3
SELECT T3.attribute_name, T4.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T3 ON T3.id = T1.attribute_id INNER JOIN superhero AS T2 ON T2.id = T1.hero_id WHERE T2.superhero_name = '3-D Man'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Brown'
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(id) FROM superhero WHERE publisher_id IS NULL;
SELECT CAST(SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(superhero_name) FROM superhero
SELECT SUM(gender_id = 1) / SUM(gender_id = 2) AS ratio FROM superhero;
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT T1.id FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Helen Parr'
SELECT T1.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.id = 38
SELECT T1.race FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id ORDER BY T2.attribute_value DESC LIMIT 1
SELECT T2.alignment, T3.power_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN hero_power AS T4 ON T1.id = T4.hero_id INNER JOIN superpower AS T3 ON T4.power_id = T3.id WHERE T1.superhero_name = 'Atom IV'
SELECT T2.full_name FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T1.colour = 'Blue' LIMIT 5
SELECT AVG(T1.attribute_value) FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.alignment_id = 3
SELECT T2.colour FROM hero_attribute AS T1 INNER JOIN colour AS T2 ON T2.id = T1.attribute_id WHERE T1.attribute_value = 100
SELECT COUNT(superhero.id) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE gender.id = 2 AND alignment.id = 1
SELECT DISTINCT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80
SELECT T1.race FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.colour = 'blue' AND T3.gender = 'male'
SELECT CAST(COUNT(CASE WHEN T2.gender_id = 2 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.id = 2
SELECT SUM(CASE WHEN T2.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.eye_colour_id = 1 THEN 1 ELSE 0 END) FROM superhero AS T1 INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T1.weight_kg = 0
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Ajax';
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Green' AND T1.alignment_id = 2
SELECT COUNT(*) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superhero.gender_id = 1
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'
SELECT MAX(T2.weight_kg) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'DC Comics'
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race_id != 1
SELECT count(*) FROM hero_attribute WHERE attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Speed' ) AND attribute_value = 100
SELECT COALESCE(MAX(CASE WHEN T1.publisher_name = 'DC Comics' THEN SUM(T2.superhero_name) ELSE 0 END) - COALESCE(MAX(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN SUM(T2.superhero_name) ELSE 0 END), 0) AS 'difference' FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id GROUP BY T1.publisher_name
SELECT t1.attribute_name FROM attribute AS t1 INNER JOIN hero_attribute AS t2 ON t1.id = t2.attribute_id INNER JOIN superhero AS t3 ON t3.id = t2.hero_id WHERE t3.superhero_name = 'Black Panther' ORDER BY t2.attribute_value ASC LIMIT 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT T2.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_id = 1 AND T1.full_name = 'Charles Chandler'
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS gender_ratio FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas'
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT T3.id FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id INNER JOIN superhero AS T3 ON T3.id = T2.hero_id ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T2.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Alien' AND T2.attribute_value = 10
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'brown'
SELECT T2.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Aquababy'
SELECT T2.weight_kg, T3.race FROM superhero AS T1 INNER JOIN `character` AS T2 ON T1.id = T2.superhero_id INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.id = 40
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT T2.hero_id FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Intelligence'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Blackwulf'
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.height_cm > 0.8 * (SELECT AVG(height_cm) FROM superhero)
SELECT T3.driverRef FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.raceId = 18 AND T1.rank = 5
SELECT T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 19 AND T2.position = 2 ORDER BY T2.q2 ASC LIMIT 1
SELECT year FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE location = 'Shanghai');
SELECT url FROM races WHERE circuitId = ( SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya' )
SELECT name FROM races WHERE circuitId IN ( SELECT circuitId FROM circuits WHERE country = 'Germany' )
SELECT T1.circuitId, T2.constructorId FROM circuits AS T1 INNER JOIN constructor_results AS T2 ON T1.circuitId = T2.circuitId WHERE T2.constructorId = (SELECT constructorId FROM constructors WHERE name = 'Renault')
SELECT COUNT(*) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND T1.url LIKE '%gp%' AND T2.country NOT IN ('Asia', 'Europe');
SELECT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Spain'
SELECT T2.lat, T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Australia'
SELECT url FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')
SELECT T2.time FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit'
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix'
SELECT DISTINCT T2.country FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 24 AND T1.points = 1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = (SELECT raceId FROM races WHERE name LIKE 'Australian Grand Prix%') AND round = 354
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 355 AND T1.q2 = '0:01:40'
SELECT T.number FROM drivers AS T INNER JOIN qualifying AS U ON T.driverId = U.driverId WHERE U.q3 = '0:01:54' AND U.raceId = 903
SELECT COUNT(*) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Bahrain Grand Prix' AND T2.time IS NULL AND T2.rank IS NULL AND T2.points IS NULL
SELECT url FROM races WHERE raceId = 901
SELECT COUNT(*) FROM results WHERE DATE(races.date) = '2015-11-29'
SELECT T2.forename, T2.surname, T2.dob FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 592 ORDER BY T2.dob LIMIT 1
SELECT T1.url FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.time = '0:01:27' AND T2.raceId = 161
SELECT T2.nationality FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 ORDER BY T1.fastestLapSpeed DESC LIMIT 1
SELECT T2.lat ,  T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "Malaysian Grand Prix"
SELECT T1.url FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 ORDER BY T2.points DESC LIMIT 1
SELECT q1 FROM qualifying WHERE driverRef = 'diagrassi' AND raceId = 345
SELECT T3.nationality FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T2.raceId = 347 AND T2.q2 = '0:01:15'
SELECT T1.code FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T2.q3 = '0:01:33' AND T3.raceId = 45
SELECT T2.time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceId = 743
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.position = 2 AND T2.raceId = (SELECT raceId FROM races WHERE circuitRef = 'san_marino_grand_prix' AND year = 2006)
SELECT T1.url FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901
SELECT COUNT(T2.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.date = 2015-11-29
SELECT MIN(dob) FROM drivers WHERE time IS NOT NULL AND raceId = 872
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 348 ORDER BY T2.milliseconds ASC LIMIT 1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = ( SELECT MAX(fastestLapSpeed) FROM results )
SELECT CAST(( SELECT T2.fastestLapSpeed FROM results AS T1 INNER JOIN results AS T2 ON T1.fastestLapSpeed > T2.fastestLapSpeed WHERE T1.raceId = 853 ORDER BY T1.fastestLapSpeed DESC LIMIT 1 ) - ( SELECT T1.fastestLapSpeed FROM results AS T1 INNER JOIN results AS T2 ON T1.fastestLapSpeed > T2.fastestLapSpeed WHERE T1.raceId = 853 ORDER BY T1.fastestLapSpeed DESC LIMIT 1, 1 ) AS REAL) / ( SELECT T1.fastestLapSpeed FROM results AS T1 INNER JOIN results AS T2 ON T1.fastestLapSpeed > T2.fastestLapSpeed WHERE T1.raceId = 853 ORDER BY T1.fastestLapSpeed DESC LIMIT 1 ) FROM results AS T1
SELECT CAST(SUM(IIF(T2.time IS NOT NULL, 1, 0)) AS REAL) * 100 / COUNT(T1.raceid) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.date = '1983-07-16'
SELECT year FROM races ORDER BY year LIMIT 1
SELECT COUNT(*) FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC
SELECT T1.name FROM races AS T1 INNER JOIN ( SELECT MIN(T2.date) FROM races AS T2 ) AS T3 ON T3.date = T1.date
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1;
SELECT year FROM races GROUP BY year ORDER BY count(year) DESC LIMIT 1
SELECT T1.name FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.year = 2017 AND T2.year NOT IN ( SELECT T3.year FROM races AS T3 INNER JOIN seasons AS T4 ON T3.year = T4.year WHERE T3.year = 2000)
SELECT name, location FROM circuits ORDER BY substr(name, 0, -4) ASC LIMIT 1
SELECT MAX(year) FROM races WHERE name LIKE 'British Grand Prix%' AND circuitId IN (SELECT circuitId FROM circuits WHERE name LIKE 'Brands Hatch%');
SELECT COUNT(T1.year) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'British Grand Prix' AND T2.name = 'Silverstone Circuit'
SELECT DISTINCT d.forename, d.surname FROM results AS r INNER JOIN drivers AS d ON r.driverId = d.driverId INNER JOIN races AS ra ON r.raceId = ra.raceId INNER JOIN circuits AS ci ON ra.circuitId = ci.circuitId WHERE ra.year = 2010 AND ci.name = 'Singapore International Circuit' ORDER BY r.position ASC
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.points DESC LIMIT 1
SELECT T1.forename, T1.surname, T2.points FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = ( SELECT raceId FROM races WHERE year = 2017 AND name = 'Chinese Grand Prix' ) ORDER BY T2.points DESC LIMIT 3
SELECT T3.forename, T3.surname, T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId ORDER BY T2.time LIMIT 1
SELECT AVG(T1.time) FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.name LIKE '2009%Chinese Grand Prix' AND T2.forename = 'Sebastian' AND T2.surname = 'Vettel'
SELECT CAST(COUNT(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE NULL END) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.surname = 'Hamilton' AND T2.position > 1
SELECT T2.forename, T2.surname, T2.nationality, AVG(T4.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId INNER JOIN driverStandings AS T4 ON T1.raceId = T4.raceId AND T1.driverId = T4.driverId WHERE T1.wins > 0 GROUP BY T1.driverId, T2.forename, T2.surname, T2.nationality ORDER BY COUNT(T1.driverId) DESC LIMIT 1;
SELECT T2.name, T2.forename FROM seasons AS T1 INNER JOIN results AS T3 ON T1.year = T3.raceId INNER JOIN drivers AS T2 ON T3.driverId = T2.driverId WHERE T2.nationality = 'Japanese' ORDER BY T1.year - T2.dob DESC LIMIT 1
SELECT COUNT(CASE WHEN year BETWEEN 1990 AND 2000 THEN 1 ELSE 0 END) FROM races WHERE circuitId IN (SELECT circuitId FROM races GROUP BY circuitId HAVING COUNT(*) = 4
SELECT circuits.name, circuits.location, races.name FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2006 AND circuits.country = 'USA'
SELECT r.name, c.name, c.location FROM races AS r INNER JOIN circuits AS c ON r.circuitId = c.circuitId WHERE r.date BETWEEN '2005-09-01' AND '2005-09-30'
SELECT T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T3.forename = 'Alex' AND T3.surname = 'Yoong' AND T2.position < 10
SELECT COUNT(*) FROM driver_standings WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher') AND positionOrder = 1 AND raceId IN (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit'))
SELECT T1.year, T1.name FROM races AS T1 INNER JOIN results AS T2 ON T2.raceId = T1.raceId INNER JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T2.milliseconds ASC LIMIT 1
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Eddie' AND T3.surname = 'Irvine' AND T2.year = 2000
SELECT T1.name ,  T3.points FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T1.year LIMIT 1
SELECT T1.name ,  T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2017 ORDER BY T1.date
SELECT T1.name , T1.year , T2.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId ORDER BY T1.laps DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T1.country = 'Germany' THEN T2.name ELSE NULL END) AS REAL) * 100 / COUNT(T2.name) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits ORDER BY lat DESC LIMIT 1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';
SELECT T2.country FROM circuits AS T1 INNER JOIN circuits AS T2 ON T1.alt = T2.alt WHERE T1.alt = ( SELECT max(alt) FROM circuits )
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT nationality FROM drivers WHERE dob = (SELECT min(dob) FROM drivers)
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T1.raceId = 18 AND T2.year = 2009
SELECT DISTINCT YEAR FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')
SELECT name, url FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')
SELECT time FROM races WHERE name = '2010 Abu Dhabi Grand Prix' AND circuitId = (SELECT circuitId FROM circuits WHERE name = 'Abu Dhabi Circuit');
SELECT COUNT(T1.circuitId) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy'
SELECT T2.date FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009
SELECT T2.fastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1
SELECT T2.driverRef FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 ORDER BY T2.position ASC LIMIT 1
SELECT DISTINCT r.name FROM races AS r INNER JOIN results AS res ON r.raceId = res.raceId INNER JOIN drivers AS dr ON res.driverId = dr.driverId WHERE dr.forename = 'Lewis' AND dr.surname = 'Hamilton'
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T1.position ASC LIMIT 1
SELECT fastestLapSpeed FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009 AND circuitId IN (SELECT circuitId FROM races WHERE year = 2009 AND name = 'Circuit de Barcelona-Catalunya'))
SELECT DISTINCT YEAR FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T1.positionOrder FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.year = 2008 AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2008 AND T3.name = 'Australian Grand Prix' AND T2.grid = 4
SELECT COUNT(*) FROM results WHERE raceId = ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND time IS NOT NULL
SELECT T1.fastestLapTime FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.name = '2008 Australian Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T.time FROM results AS T INNER JOIN races AS R ON R.raceId = T.raceId INNER JOIN ( SELECT D.driverId FROM results AS T1 INNER JOIN races AS R1 ON R1.raceId = T1.raceId INNER JOIN drivers AS D ON T1.driverId = D.driverId WHERE R1.year = 2008 AND R1.name = 'Australian Grand Prix' AND T1.position = 2 ) AS T2 ON T.driverId = T2.driverId
SELECT T1.forename, T1.surname, T1.url FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Australian Grand Prix' AND T2.position = 1 AND T3.year = 2008;
SELECT COUNT(T1.drivernationality) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'American' AND T2.raceId IN ( SELECT T3.raceId FROM races AS T3 INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T4.country = 'Australia' AND T3.year = 2008 )
SELECT COUNT(DISTINCT T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.raceId IN ( SELECT T3.raceId FROM races AS T3 WHERE T3.year = 2008 AND T3.name = 'Australian Grand Prix' ) AND T1.time IS NOT NULL
SELECT sum(T1.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT CAST(SUM(CAST(REPLACE(fastestLapTime, ':', '.') AS REAL)) AS REAL) / COUNT(fastestLapTime) AS avg_fastest_lap_time_seconds FROM results WHERE driverId = ( SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' )
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.raceId) FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008
SELECT CAST(TIME(SUBTRACT(T1.time, T2.time), 'unixepoch') AS REAL) * 100 / T2.time FROM results AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.position = 1 AND T2.position = (SELECT COUNT(*) FROM results WHERE raceId = T1.raceId)
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > 1980
SELECT AVG(t1.points) FROM constructorResults AS t1 INNER JOIN constructors AS t2 ON t1.constructorId = t2.constructorId WHERE t2.nationality = 'British';
SELECT name FROM constructors ORDER BY points DESC LIMIT 1
SELECT T2.name FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.points = 0 AND T1.raceId = 291
SELECT COUNT(DISTINCT T1.constructorId) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.points = 0 AND T2.raceId IN ( SELECT raceId FROM results WHERE raceId IN ( SELECT raceId FROM results WHERE year = 2021 AND position = 1 ) AND year = 2019 AND position = 1 )
SELECT DISTINCT T2.name FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.position = 1
SELECT COUNT(T1.constructorId) FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'French' AND T1.laps > 50
SELECT CAST(COUNT(DISTINCT T2.driverId) AS REAL) * 100 / COUNT(DISTINCT T3.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year BETWEEN 2007 AND 2009 AND T3.nationality = 'Japanese'
SELECT year, AVG(T2.milliseconds / 1000) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.position = 1 AND T2.time IS NOT NULL AND T2.milliseconds IS NOT NULL GROUP BY year
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T2.driverId = T1.driverId WHERE year(T2.dob) > 1975 AND T1.position = 2
SELECT COUNT(d.driverId) FROM drivers d WHERE d.nationality = 'Italian' AND time IS NULL
SELECT T3.forename ,  T3.surname FROM results AS T1  INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId  INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId  WHERE T2.time = (SELECT min(time) FROM lapTimes)
SELECT T1.fastestLap FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T2.winner = T1.driverId
SELECT AVG(T3.fastestLapSpeed) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN results AS T3 ON T1.raceId = T3.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT T2.name ,  T2.year FROM results AS T1  INNER JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T1.milliseconds IS NOT NULL  ORDER BY T1.milliseconds ASC  LIMIT 1
SELECT CAST(COUNT(DISTINCT CASE WHEN T1.dob < 1985 AND T3.laps > 50 THEN T1.driverId ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN T1.dob BETWEEN 2000 AND 2005 THEN T1.driverId ELSE NULL END) FROM drivers AS T1 INNER JOIN results AS T3 ON T1.driverId = T3.driverId
SELECT COUNT(T2.forename) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.nationality = 'French' AND T1.seconds < 120
SELECT code FROM drivers WHERE nationality = 'America'
SELECT raceId FROM races WHERE YEAR = 2009
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18
SELECT T1.code FROM drivers AS T1 INNER JOIN races AS T2 ON T1.dob = T2.date WHERE T2.year IN ( SELECT MAX (year) FROM races ) ORDER BY T1.dob LIMIT 3
SELECT driverRef FROM drivers WHERE surname = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE nationality = 'Australia' AND strftime('%Y', dob) = '1980'
SELECT T2.forename, T2.surname, T2.dob, T1.time FROM lap_times AS T1 INNER JOIN drivers AS T2 ON T2.driverid = T1.driverid WHERE T2.nationality = 'German' AND T2.dob BETWEEN '1980-01-01' AND '1990-12-31' ORDER BY T1.time ASC LIMIT 3
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY strftime('%J', dob) ASC LIMIT 1
SELECT DISTINCT T2.driverId, T2.code FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE STRFTIME('%Y', T2.dob) = '1971' ORDER BY T1.fastestLapTime DESC LIMIT 1
SELECT T3.forename ,  T3.surname FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId  =  T2.raceId INNER JOIN drivers AS T3 ON T1.driverId  =  T3.driverId WHERE T2.year  =  2010 AND T3.nationality  =  'Spain' AND strftime('%Y', T3.dob)  <  '1982' AND T1.position  =  1 ORDER BY T1.time LIMIT 10
SELECT YEAR FROM races WHERE fastestLapTime IS NOT NULL ORDER BY fastestLapTime ASC LIMIT 1
SELECT T2.year FROM lap_times AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceId GROUP BY T2.year ORDER BY AVG(T1.time) LIMIT 1
SELECT T3.driverId FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId ORDER BY T1.time ASC LIMIT 5
SELECT SUM(IIF(T1.time IS NULL AND T2.status = 'disqualified', 1, 0)) FROM results AS T1 INNER JOIN status AS T2 ON T1.statusId = T2.statusId WHERE T1.raceId BETWEEN 50 AND 100
SELECT location, lat, lng FROM circuits WHERE country = 'Austria'
SELECT MIN(T2.positionOrder) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.time IS NOT NULL
SELECT T1.driverRef, T2.nationality, T2.dob FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL
SELECT T1.year, T2.name, T1.q1 FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T2.dob DESC LIMIT 1
SELECT COUNT(T3.statusId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId INNER JOIN status AS T4 ON T4.statusId = T3.statusId WHERE T4.status = 'Disqualified'
SELECT c.url FROM constructors AS c JOIN constructorResults AS cr ON c.constructorId = cr.constructorId ORDER BY cr.points DESC LIMIT 1
SELECT url FROM constructors ORDER BY wins DESC LIMIT 1
SELECT T3.forename, T3.surname, T4.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId INNER JOIN lapTimes AS T4 ON T1.raceId = T4.raceId INNER JOIN circuits AS T5 ON T2.circuitId = T5.circuitId WHERE T5.country = 'France' AND T4.lap = 3 ORDER BY T4.time DESC LIMIT 1
SELECT T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.positionOrder = 1 ORDER BY T2.time LIMIT 1
SELECT AVG(T2.fastestLapTime) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = '2006 United States Grand Prix' AND T2.rank < 11
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' AND T1.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY T1.driverId ORDER BY AVG(T2.duration) ASC LIMIT 5
SELECT T2.time FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T2.position = 1 AND T1.circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Canada')
SELECT T2.constructorRef FROM results AS T1 INNER JOIN races AS T3 ON T1.raceId = T3.raceId INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.position = 1 AND T3.year = 2009
SELECT T2.forename, T2.surname, T2.dob FROM constructors AS T1 INNER JOIN drivers AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Austrian' AND strftime('%Y', T2.dob) BETWEEN '1981' AND '1991'
SELECT T2.forename, T2.surname, T2.dob, T2.url FROM constructors AS T1 INNER JOIN drivers AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'German' AND strftime('%Y', T2.dob) BETWEEN '1971' AND '1985' ORDER BY T2.dob DESC
SELECT T2.location ,  T2.country ,  T2.lat ,  T2.lng FROM constructors AS T1 INNER JOIN circuits AS T2 ON T2.circuitId = T1.circuitId WHERE T1.name = 'Hungaroring';
SELECT T4.name, T4.nationality, T3.points FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructorResults AS T3 ON T1.raceId = T3.raceId JOIN constructors AS T4 ON T3.constructorId = T4.constructorId WHERE T1.name = 'Monaco Grand Prix' AND T1.year BETWEEN 1980 AND 2010 ORDER BY T3.points DESC LIMIT 1
SELECT AVG(T3.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId INNER JOIN constructors AS T4 ON T2.constructorId = T4.constructorId WHERE T4.nationality = 'Turkish' AND T3.name = 'Turkish Grand Prix'
SELECT COUNT(*) AS total_races, YEAR(races.date) as year FROM races WHERE races.date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY YEAR(races.date)
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.wins FROM results AS T1 INNER JOIN driverStandings AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId WHERE T2.position = 91
SELECT r.name FROM races AS r JOIN results AS res ON r.raceId = res.raceId ORDER BY STRFTIME('%M:%S', res.fastestLapTime) LIMIT 1
SELECT T2.location, T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId ORDER BY T1.date DESC LIMIT 1
SELECT T2.forename, T2.surname FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.position = 1 AND T1.raceId = 3 AND YEAR(T1.date) = 2008
SELECT T3.forename ,  T3.surname ,  T3.nationality ,  T2.name ,  T1.raceId FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId ORDER BY T3.dob ASC LIMIT 1
SELECT COUNT(T1.statusid) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Canadian Grand Prix' AND T1.statusid = 3
SELECT forename, surname FROM drivers ORDER BY dob LIMIT 1
SELECT max(T1.duration) FROM pitStops AS T1
SELECT T2.time FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId ORDER BY CAST(REPLACE(T2.milliseconds, ',', '.') AS REAL) ASC LIMIT 1
SELECT MAX(T1.duration) FROM pitStops AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT T1.lap FROM pitStops AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.name = 'Australian Grand Prix' AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT T2.time FROM results AS T1 INNER JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix')
SELECT T1.name ,  T2.position ,  T2.time FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T2.forename, T2.surname FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T1.time ASC LIMIT 1
SELECT p.position FROM positions p JOIN results r ON p.raceId = r.raceId AND p.position = r.fastestLap WHERE r.driverId = (   SELECT d.driverId FROM drivers d   WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' )
SELECT T1.time FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId INNER JOIN circuits AS T4 ON T1.circuitId = T4.circuitId WHERE T4.name = 'Australian Grand Prix Circuit' AND T3.nationality = 'Austrian' ORDER BY T2.time ASC LIMIT 1
SELECT T1.circuitRef, T1.country, T1.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.time = ( SELECT MIN(T2.time) FROM races AS T2 WHERE T2.country = 'Italy' )
SELECT T3.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.name LIKE 'Austrian Grand Prix Circuit' ORDER BY T1.milliseconds ASC LIMIT 1
SELECT T.duration FROM ( SELECT duration FROM pitStops WHERE raceId = ( SELECT raceId FROM races WHERE name = 'Austrian Grand Prix Circuit' ) AND driverId = ( SELECT driverId FROM results WHERE constructorId = 1 AND positionOrder = 1 ) ORDER BY duration LIMIT 1 ) AS T
SELECT T1.lat ,  T1.lng FROM circuits AS T1 INNER JOIN ( SELECT T2.circuitId FROM results AS T2 INNER JOIN laptimes AS T3 ON T2.resultId = T3.resultId WHERE T3.time = '1:29.488' ) AS T4 ON T4.circuitId = T1.circuitId
SELECT AVG(T1.milliseconds) FROM pitStops AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(T1.milliseconds) FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.country = 'Italy'
SELECT MAX(overall_rating) FROM Player_Attributes
SELECT height, player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT T1.preferred_foot FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.potential = ( SELECT MIN(potential) FROM Player_Attributes )
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low';
SELECT T1.player_api_id FROM Player_Attributes AS T1 ORDER BY T1.crossing DESC LIMIT 5
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T2.id = T1.league_id WHERE T1.season = '2016/2017' GROUP BY T2.name ORDER BY SUM(T1.home_team_goal, T1.away_team_goal) DESC LIMIT 1
SELECT home_team_api_id, COUNT(*) AS num_matches_lost FROM Match WHERE season = 2016 AND home_team_goal - away_team_goal < 0 GROUP BY home_team_api_id ORDER BY num_matches_lost ASC LIMIT 1
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.penalties DESC LIMIT 10
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.name = 'Scotland Premier League' AND T2.season = '2009/2010' ORDER BY T2.away_team_goal - T2.home_team_goal DESC LIMIT 1
SELECT T1.buildUpPlaySpeed FROM Team_Attributes AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id INNER JOIN Match AS T3 ON T1.team_api_id = T3.away_team_api_id ORDER BY T1.buildUpPlaySpeed DESC LIMIT 4
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2016' AND T1.home_team_goal = T1.away_team_goal GROUP BY T1.league_id ORDER BY COUNT(T1.home_team_goal) DESC LIMIT 1
SELECT DIVIDE(DATETIME(), SUBTRACT(birthday)) AS age FROM Player_Attributes WHERE sprint_speed >= 97 AND date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'
SELECT T1.name, COUNT(T2.league_id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY COUNT(T2.league_id) DESC LIMIT 1
SELECT avg(T2.height) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.birthday >= '1990-01-01 00:00:00' AND T1.birthday < '1996-01-01 00:00:00'
SELECT T2.player_api_id FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.date LIKE '2010%' AND T1.overall_rating > ( SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%' )
SELECT team_fifa_api_id FROM team_attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > ( SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE buildUpPlayPassing IS NOT NULL );
SELECT CAST(SUM(CASE WHEN T1.preferred_foot = 'left' AND strftime('%Y', T2.birthday) BETWEEN '1987' AND '1992' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.preferred_foot) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id
SELECT l.name FROM League l JOIN Team t ON l.id = t.league_id JOIN Match m ON t.team_api_id = m.home_team_api_id OR t.team_api_id = m.away_team_api_id GROUP BY l.name ORDER BY SUM(m.home_team_goal, m.away_team_goal) ASC LIMIT 5
SELECT AVG(T1.long_shots) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Ahmed Samir Farag'
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 ORDER BY T2.heading_accuracy DESC LIMIT 10
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_api_id IN ( SELECT team_api_id FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' ) AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00' GROUP BY T2.team_long_name HAVING AVG(T1.chanceCreationPassing) < ( SELECT AVG(chanceCreationPassing) FROM Team_Attributes ) ORDER BY AVG(T1.chanceCreationPassing) DESC
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2009/2010' GROUP BY T1.name HAVING AVG(T2.home_team_goal) > AVG(T2.away_team_goal)
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN `Match` AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.team_long_name = 'Queens Park Rangers'
SELECT T2.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.id = T2.player_api_id WHERE SUBSTR(T1.birthday, 1, 4) AS year = '1970' AND SUBSTR(T1.birthday, 6, 2) AS month = '10'
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id WHERE T2.player_name = 'Franco Zennaro'
SELECT T1.name FROM Country AS T1 INNER JOIN Match AS T2 ON T1.id = T2.country_id INNER JOIN Team AS T3 ON T3.team_api_id = T2.home_team_api_id INNER JOIN Team_Attributes AS T4 ON T4.team_api_id = T3.team_api_id WHERE T3.team_long_name = 'ADO Den Haag' AND T4.buildUpPlayPositioningClass = 'medium' LIMIT 2
SELECT CAST(COUNT(CASE WHEN player_name = 'Francois Affolter' AND date = '2014-09-18 00:00:00' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.player_name) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT T2.overall_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.date LIKE '2011%' AND T2.player_name = 'Gabriel Tamas'
SELECT COUNT(*) FROM League INNER JOIN Match ON League.id = Match.league_id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016'
SELECT T3.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T3 ON T1.player_fifa_api_id = T3.player_fifa_api_id INNER JOIN ( SELECT T1.player_fifa_api_id, MAX(T1.birthday) AS max_birthday FROM Player AS T1 WHERE T3.attacking_work_rate = 'high' ) AS T2 ON T2.player_fifa_api_id = T1.player_fifa_api_id WHERE T1.birthday = T2.max_birthday AND T3.attacking_work_rate = 'high';
SELECT T1.player_name, T2.potential FROM player AS T1 JOIN player_attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.potential DESC LIMIT 1
SELECT count(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky'
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson'
SELECT birthday FROM Player WHERE id = ( SELECT player_id FROM Player_Attributes WHERE overall_rating = ( SELECT MAX(overall_rating) FROM Player_Attributes ) );
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Netherlands'
SELECT AVG(T1.home_team_goal) FROM `Match` AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.season = '2010/2011' AND T2.name = 'Poland'
SELECT AVG(T1.finishing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id ORDER BY T2.height DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday)  =  '1990';
SELECT COUNT(*) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name LIKE 'Adam%' AND T2.weight > 170
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE date BETWEEN '2008-01-01' AND '2010-12-31' AND overall_rating > 80)
SELECT T2.potential FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT * FROM Player WHERE preferred_foot = 'left'
SELECT team_long_name FROM Team_Attributes WHERE buildUpPlaySpeedClass = 'Fast'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB'
SELECT team_short_name FROM Team WHERE team_api_id IN (SELECT team_api_id FROM Team_Attributes WHERE buildUpPlayPassing > 70)
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 170 AND STRFTIME('%Y', T2.date) BETWEEN '2010' AND '2015'
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1
SELECT T3.name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Country AS T3 ON T1.birthday LIKE STRFTIME('%Y', 'now') || '-' || SUBSTR(T1.birthday, INSTR(T1.birthday, '-') + 1) || '%'
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10'
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.balance = 58 AND T2.potential = 61
SELECT CAST(SUM(T2.ball_control) AS REAL) - SUM(T1.ball_control) FROM player AS T1 INNER JOIN player_attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo' OR T1.player_name = 'Aaron Appindangoye';
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT CASE WHEN T3.birthday < T2.birthday THEN T3.player_name ELSE T2.player_name END FROM Player AS T1 INNER JOIN Player AS T2 ON T2.player_name = 'Aaron Lennon' INNER JOIN Player AS T3 ON T3.player_name = 'Abdelaziz Barrada'
SELECT player_name, MAX(height) FROM Player
SELECT COUNT(T1.id) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'left' AND T1.attacking_work_rate = 'low'
SELECT T2.name FROM Player AS T1 JOIN Country AS T2 ON T2.id = T1.player_nationality_id JOIN Team_Attributes AS T3 ON T3.team_api_id = T1.player_team_id JOIN League AS T4 ON T4.id = T3.league_id WHERE T4.name = 'Belgium Jupiler League'
SELECT T2.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Germany'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1
SELECT COUNT(T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.defensive_work_rate = 'high' AND T1.birthday LIKE '____-%-%' AND strftime('%Y', T1.birthday) < '1986' AND T2.attacking_work_rate = 'high';
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE crossing = (SELECT max(crossing) FROM Player_Attributes))
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk')
SELECT COUNT(T1.player_api_id) FROM player AS T1 INNER JOIN player_attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009'
SELECT MAX(long_passing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id WHERE T2.birthday = ( SELECT MAX(birthday) FROM Player );
SELECT COUNT(T2.id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Belgium Jupiler League' AND strftime('%Y', T2.date) = '2009' AND strftime('%m', T2.date) = '04'
SELECT league_id FROM Match WHERE season = '2008/2009' GROUP BY league_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT avg(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T2.birthday) < '1986'
SELECT CAST(100 AS REAL) * (((SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk' LIMIT 1) - (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel' LIMIT 1)) / (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel' LIMIT 1)) AS "Higher Percentage"
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Lennox';
SELECT T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax' ORDER BY T2.chanceCreationPassing DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo'
SELECT T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon' ORDER BY T1.overall_rating DESC LIMIT 1
SELECT AVG(T2.away_team_goal) FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.team_long_name = 'Parma' AND T2.country_id = (SELECT id FROM Country WHERE name = 'Italy')
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.id = T2.player_fifa_api_id WHERE T1.birthday = ( SELECT MIN(birthday) FROM Player_Attributes AS T3 WHERE T3.overall_rating = 77 AND SUBSTR(T3.date, 1, 4) = 2016 AND SUBSTR(T3.date, 6, 2) = 6 AND SUBSTR(T3.date, 9, 2) = 23 )
SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Aaron Mooy' AND date = '2016-02-04 00:00:00'
SELECT t3.potential FROM Match AS t1 INNER JOIN Team AS t2 ON t1.home_team_api_id = t2.team_api_id INNER JOIN Player_Attributes AS t3 ON t3.player_api_id = t1.home_player_1 WHERE t2.team_short_name = 'Torino' AND t3.date = '2010-08-30 00:00:00'
SELECT attacking_work_rate FROM Player_Attributes WHERE player_name = 'Francesco Migliore' AND date = '2015-05-01 00:00:00'
SELECT DISTINCT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'
SELECT T1.date FROM player_attributes AS T1 JOIN player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Kevin Constant' ORDER BY T1.crossing DESC LIMIT 1
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_long_name = 'Willem II' AND T1.date = '2012-02-22 00:00:00'
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE date = '2015-09-10 00:00:00' AND team_short_name = 'LEI'
SELECT T2.buildUpPlayPassingClass FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T2.team_long_name = 'FC Lorient' AND T1.date = '2010-02-22'
SELECT T2.chanceCreationPassingClass FROM Match AS T1 INNER JOIN Team_Attributes AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T2.date = '2013-09-20 00:00:00' AND T2.team_long_name = 'PEC Zwolle'
SELECT T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hull City' AND T1.date = '2010-02-22 00:00:00'
SELECT T3.defenceAggressionClass FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id INNER JOIN Team_Attributes AS T3 ON T3.team_api_id = T2.team_api_id WHERE T1.date = '2015-09-10 00:00:00' AND T2.team_long_name = 'Hannover 96'
SELECT avg(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Marko Arnautovic' AND T1.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'
SELECT CAST(SUM(CASE WHEN T1.date = '2013-07-12' AND T1.player_name = 'Landon Donovan' THEN T1.overall_rating ELSE 0 END) - SUM(CASE WHEN T1.date = '2013-07-12' AND T1.player_name = 'Jordan Bowery' THEN T1.overall_rating ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.date = '2013-07-12' AND T1.player_name = 'Landon Donovan' THEN T1.overall_rating ELSE 0 END) AS percentage FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.height DESC LIMIT 5
SELECT T1.player_api_id FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.weight DESC LIMIT 10
SELECT player_name FROM Player WHERE strftime('%Y', datetime(CURRENT_TIMESTAMP, 'localtime')) - strftime('%Y', birthday) > 34
SELECT count(*) FROM `Match` WHERE home_player_1 = (SELECT id FROM Player WHERE player_name = 'Aaron Lennon')
SELECT SUM(T1.away_team_goal) FROM Match AS T1 INNER JOIN Player AS T2 ON T1.away_player_1 = T2.player_api_id OR T1.away_player_2 = T2.player_api_id OR T1.away_player_3 = T2.player_api_id OR T1.away_player_4 = T2.player_api_id OR T1.away_player_5 = T2.player_api_id OR T1.away_player_6 = T2.player_api_id OR T1.away_player_7 = T2.player_api_id OR T1.away_player_8 = T2.player_api_id OR T1.away_player_9 = T2.player_api_id OR T1.away_player_10 = T2.player_api_id OR T1.away_player_11 = T2.player_api_id WHERE T2.player_name = 'Daan Smith' OR T2.player_name = 'Filipe Ferreira'
SELECT SUM(T1.home_team_goal) FROM Match AS T1 INNER JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id OR T1.home_player_2 = T2.player_api_id OR T1.home_player_3 = T2.player_api_id OR T1.home_player_4 = T2.player_api_id OR T1.home_player_5 = T2.player_api_id OR T1.home_player_6 = T2.player_api_id OR T1.home_player_7 = T2.player_api_id OR T1.home_player_8 = T2.player_api_id OR T1.home_player_9 = T2.player_api_id OR T1.home_player_10 = T2.player_api_id OR T1.home_player_11 = T2.player_api_id WHERE SUBSTR(birthday, -4) - CASE WHEN DATE('now') < STRFTIME('%Y-%m-%d', SUBSTR(birthday, -4) || '-' || SUBSTR(birthday, -7, 2) || '-' || SUBSTR(birthday, -10, 2)) THEN 1 ELSE 0 END <= 30
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 10
SELECT T2.player_name FROM Player_attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.potential DESC LIMIT 1
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'high'
SELECT player_name FROM Player WHERE finishing = 1 ORDER BY datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) DESC LIMIT 1
SELECT T2.player_name FROM Country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.player_fifa_api_id WHERE T1.name = 'Belgium'
SELECT T1.country_name FROM country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.country_id INNER JOIN Player_Attributes AS T3 ON T2.player_fifa_api_id = T3.player_fifa_api_id WHERE T3.vision > 89
SELECT T2.name FROM Player AS T1 JOIN Country AS T2 ON T1.height = T2.id GROUP BY T2.id ORDER BY AVG(T1.weight) DESC LIMIT 1
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T2.team_api_id = T1.team_api_id WHERE T1.chanceCreationPassingClass = 'Safe';
SELECT AVG(height) FROM Player WHERE player_fifa_api_id IN (SELECT player_fifa_api_id FROM Player WHERE player_fifa_api_id IN (SELECT player_fifa_api_id FROM Team WHERE country_id IN (SELECT id FROM Country WHERE name = 'Italy')))
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'
SELECT SUBTRACT(T1.jumping, T2.jumping) FROM Player_Attributes AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_api_id = 6 AND T2.player_api_id = 23
SELECT player_fifa_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 3
SELECT COUNT(*) FROM Player_attributes WHERE preferred_foot = 'left' AND crossing = ( SELECT MAX(crossing) FROM Player_attributes )
SELECT CAST(SUM(CASE WHEN strength > 80 AND stamina > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id INNER JOIN Match AS T3 ON T2.id = T3.league_id WHERE T3.home_team_api_id IN (SELECT team_api_id FROM Team WHERE team_short_name = "Poland Ekstraklasa") OR T3.away_team_api_id IN (SELECT team_api_id FROM Team WHERE team_short_name = "Poland Ekstraklasa")
SELECT home_team_goal, away_team_goal FROM `Match` WHERE date LIKE '2008-09-24%'
SELECT sprint_speed, agility, acceleration FROM Player_Attributes WHERE player_name = 'Alexis Blin';
SELECT CASE WHEN T2.buildUpPlaySpeedClass = 'low' THEN 'slow' WHEN T2.buildUpPlaySpeedClass = 'medium' THEN 'balanced' WHEN T2.buildUpPlaySpeedClass = 'high' THEN 'fast' END AS Speed_Class FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge'
SELECT COUNT(*) FROM `Match` WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A')
SELECT home_team_goal FROM `Match` WHERE league_id = (SELECT id FROM League WHERE name = "Netherlands Eredivisie") ORDER BY home_team_goal DESC LIMIT 1
SELECT finishing, curve FROM Player ORDER BY weight DESC LIMIT 1
SELECT t3.name FROM Match AS t1 INNER JOIN Team AS t2 ON t1.home_team_api_id = t2.team_api_id INNER JOIN League AS t3 ON t2.league_id = t3.id WHERE t1.season = '2015/2016' GROUP BY t3.name ORDER BY COUNT(t1.id) DESC LIMIT 1
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = ( SELECT MAX(T2.away_team_goal) FROM Match AS T2 )
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.height < 180 AND T2.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT AVG((CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END) - (CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END)) * 100.0 / NULLIF(SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END) + SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END), 0)
SELECT CAST(COUNT(CASE                          WHEN STRFTIME('%Y', Birthday) > '1930' THEN 1                          ELSE NULL                      END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE SEX = 'F'
SELECT CAST(SUM(CASE WHEN SUBSTR(Patient.Admission, 1, 1) = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Patient.ID) FROM Patient WHERE STRFTIME('%Y', Birthday) BETWEEN '1930' AND '1940'
SELECT SUM(IIF(T2.Diagnosis = 'SLE' AND T2.Admission = '+', 1, 0))      / SUM(IIF(T2.Diagnosis = 'SLE' AND T2.Admission = '-', 1, 0)) FROM Patient AS T2
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 163109
SELECT T2.ID, T2.SEX, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH > 500
SELECT T2.ID ,  strftime('%Y', 'now') - T2.Birthday AS age FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RVVT = '+'
SELECT T1.ID ,  T1.SEX ,  T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2
SELECT P.ID FROM Patient AS P LEFT JOIN Examination AS E ON P.ID = E.ID LEFT JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) = '1937' AND (CASE WHEN L.`T-CHO` > 250 THEN 'T' ELSE 'F' END) = 'T'
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB < 3.5
SELECT CAST(COUNT(T1.ID) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND (T2.TP < '6.0' OR T2.TP > '8.5')
SELECT AVG(`aCL IgG`) FROM Examination WHERE ADMISSION = '+' AND STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', Birthday) >= 50
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND YEAR(T1.Description) = 1997 AND T2.Admission = '-'
SELECT MIN(CAST(strftime('%J', `First Date`) AS INT) - CAST(strftime('%J', Birthday) AS INT)) AS age FROM Patient
SELECT COUNT(T.ID) FROM Patient AS T WHERE T.SEX = 'F' AND ( SELECT COUNT(*) FROM Examination WHERE `Examination Date` = '1997-01-01' AND Thrombosis = 1 ) = ( SELECT MAX(T1.c) FROM ( SELECT COUNT(*) AS c FROM Examination WHERE `Examination Date` LIKE '1997%' AND Thrombosis = 1 GROUP BY ID ) AS T1 )
SELECT MAX(YEAR(T1.Birthday)) - MIN(YEAR(T1.Birthday)) AS age_gap FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG >= 200
SELECT T1.Symptoms, T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T2.BIRTHDAY ASC LIMIT 1
SELECT CAST(COUNT(ID) AS REAL) / 12 AS average_patients_tested FROM Patient WHERE ID IN ( SELECT Patient FROM Laboratory WHERE Date BETWEEN '1998-01-01' AND '1998-12-31' ) AND SEX = 'M'
SELECT T2.Date, YEAR(T2.Date) - YEAR(T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SJS%' ORDER BY T1.Birthday DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' THEN IIF(T2.UA <= 8.0, 1, 0) ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' THEN IIF(T2.UA <= 6.5, 1, 0) ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` IS NULL OR SUBTRACT(year(T2.`Examination Date`), year(T1.`First Date`)) >= 1
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) < 18 AND T2.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-BIL` > 2.0
SELECT T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1
SELECT AVG(T1.Birthday) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT T1.SEX , T1.Birthday , T2.`HGB` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T2.`HGB` DESC LIMIT 1
SELECT `aCL IgA` FROM Examination WHERE `Examination Date` = '1996-12-02' AND ID = 3605340
SELECT COUNT(*) FROM Patient WHERE ID = 2927464 AND Birthday = '1995-9-4' AND Description < '1995-9-4' AND ADMISSION = 'normal'
SELECT T1.SEX FROM PATIENT AS T1 INNER JOIN EXAMINATION AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'AORTITIS' ORDER BY T2.`Examination Date` LIMIT 1
SELECT T1.aCL FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` = '1993-11-12' AND T1.Diagnosis = 'SLE'
SELECT T2.SEX FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`GPT` = 9 AND T1.Date = '1992-06-12'
SELECT T2.Birthday - 1992 FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1991-10-21' AND T1.UA = '8.4'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` = '1991-06-13' AND T2.Diagnosis = 'SJS' AND T2.`Examination Date` = '1995-04-20'
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T2.`Examination Date` = '1997-01-27' ORDER BY T1.`First Date` LIMIT 1
SELECT T1.symptoms FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.`Examination Date` = '1993-09-27'
SELECT (SUM(`T-CHO`) - SUM(`T-CHO`) WHERE DATE LIKE '1981-12-%') / SUM(`T-CHO`) WHERE DATE LIKE '1981-11-%' AND `Birthday` = '1959-02-18';
SELECT ID FROM Patient WHERE Diagnosis = 'Behcet' AND YEAR(Description) >= 1997 AND YEAR(Description) < 1998
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T3.GPT > 30 AND T3.ALB < 4
SELECT DISTINCT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` >= '1964-01-01' AND T2.`Examination Date` < '1965-01-01' AND T1.SEX = 'F' AND T1.Admission = '+'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2 AND T2.`ANA Pattern` = 'S' AND T2.`aCL IgM` > ( SELECT AVG(T2.`aCL IgM`) FROM Examination AS T2 WHERE T2.`aCL IgM` IS NOT NULL )
SELECT CAST(SUM(IIF(`U-PRO` > 0 AND `U-PRO` < 30 AND UA <= 6.5, 1, 0)) AS REAL) * 100 / COUNT(*) FROM Examination;
SELECT CAST(SUM(CASE WHEN T2.Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / CAST(COUNT(T1.`First Date`) AS REAL) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND STRFTIME('%Y', T1.`First Date`) = '1981'
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T1.Admission = '-' AND STRFTIME('%Y', T3.Date) = '1991' AND STRFTIME('%m', T3.Date) = '10' AND T3.`T-BIL` < 2
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND strftime('%Y', BIRTHDAY) BETWEEN '1980' AND '1989' AND ID NOT IN (SELECT ID FROM Patient WHERE `ANA Pattern` = 'P' AND SEX = 'F' AND strftime('%Y', BIRTHDAY) BETWEEN '1980' AND '1989')
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123
SELECT AVG(T2.ALB) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T1.Diagnosis = 'SLE'
SELECT T2.symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.diagnosis = 'SLE' GROUP BY T2.symptoms ORDER BY COUNT(T2.symptoms) DESC LIMIT 1
SELECT T1.Description, T2.diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 48473;
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE YEAR(T3.Date) = '1997' AND T3.tp > 6 AND T3.tp < 8.5
SELECT CAST(SUM(CASE WHEN (Thrombosis = 1 AND Diagnosis LIKE '%SLE%') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Examination
SELECT CAST(SUM(CASE WHEN YEAR(T2.`Birthday`) = '1980' AND T1.SEX = 'F' AND T1.Diagnosis = 'RA' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.SEX) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND T2.Diagnosis = 'BEHCET' AND T1.Admission = '-'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 821298
SELECT CASE WHEN UA > 8.0 AND SEX = 'M' THEN 1 ELSE CASE WHEN UA > 6.5 AND SEX = 'F' THEN 1 ELSE 0 END END AS within_range FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 57266;
SELECT DISTINCT T1.Date FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473 AND T1.GOT >= 60
SELECT T2.SEX, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GOT < 60 AND DATEPART(YEAR, T1.Date) = 1994
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`GPT` >= 60
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500
SELECT DISTINCT T1.ID, T2.age FROM Patient AS T1 INNER JOIN ( SELECT DISTINCT ID, SUBTRACT(year(current_timestamp), year(Birthday)) AS age FROM Patient WHERE LDH BETWEEN 600 AND 800 ) AS T2 ON T1.ID = T2.ID;
SELECT CASE         WHEN T1.ALP < 300 THEN             CASE                 WHEN T2.admission = '+' THEN 'inpatient'                ELSE 'outpatient'            END         ELSE 'ALP not within normal range'         END AS Patient_Status  FROM Patient AS T2  JOIN Examination AS T1 ON T2.ID = T1.ID
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y-%m-%d', T1.Birthday) = '1982-04-01' AND T2.ALP < 300
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Total Protein` < 6
SELECT CAST(SUBTRACT(T1.TP, 8.5) AS REAL) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.TP > 8.5
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'M' AND NOT (Examination.ALB BETWEEN 3.5 AND 5.5) ORDER BY Patient.Birthday DESC
SELECT CASE WHEN AVG(ALB) BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END AS IsNormal FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) = 1982
SELECT CAST(SUM(CASE WHEN UA > 8.0 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'
SELECT AVG(T2.UA) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (CASE WHEN T1.SEX = 'M' THEN T2.UA < 8.0 ELSE T2.UA < 6.5 END) ORDER BY T1.ID DESC LIMIT 1
SELECT ID, SEX, Birthday FROM Patient WHERE UN = 29
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'RA' AND T2.UN < 30
SELECT COUNT(*) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'M' AND Examination.CRE >= 1.5
SELECT CASE WHEN SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) THEN 1 ELSE 0 END
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T2.`T-BIL` DESC LIMIT 1
SELECT SEX, COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE `T-BIL` >= 2.0) GROUP BY SEX
SELECT T2.ID, T2.`T-CHO` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` = ( SELECT MAX(`T-CHO`) FROM Laboratory ) ORDER BY T1.Birthday ASC LIMIT 1
SELECT COUNT(T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.`T-CHO` >= 250
SELECT DISTINCT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG > 300
SELECT COUNT(*) FROM Patient WHERE SUBSTR(Birthday, 1, 4) <= YEAR(DATE('now')) - 50 AND ID IN (SELECT ID FROM Laboratory WHERE TG >= 200)
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T1.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND T2.CPK >= 250
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN ( SELECT ID FROM Laboratory WHERE GLU >= 180 AND `T-CHO` < 250 ) AS T2 ON T1.ID = T2.ID
SELECT T2.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Description) >= 1991 AND T2.GLU < 180
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE WBC < = 3.5 OR WBC > = 9.0  GROUP BY P.SEX  ORDER BY P.Birthday;
SELECT T1.ID, T2.age FROM Patient AS T1 INNER JOIN ( SELECT ID, ( DATE_PART(YEAR, CURRENT_TIMESTAMP) - DATE_PART(YEAR, Birthday) ) AS age FROM Patient ) AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%lower red blood cell%' AND T2.age IS NOT NULL
SELECT T2.Admission FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.RBC BETWEEN 3.5 AND 6.0 AND T2.Admission = '+' AND SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(T1.Birthday)) > 50
SELECT T2.ID, T2.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Hemoglobin Level` < 10 AND T1.Admission = '-'
SELECT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T1.Birthday = ( SELECT MIN(Birthday) FROM Patient WHERE Diagnosis = 'SLE' ) AND T2.HGB BETWEEN 10 AND 17
SELECT T1.ID, T1.Birthday FROM Patient AS T1 INNER JOIN ( SELECT Patient FROM Laboratory GROUP BY Patient HAVING COUNT(Patient)  >=  2 ) AS T2 ON T1.ID  =  T2.Patient
SELECT AVG(T1.HCT) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T2.ID = T1.ID WHERE T2.`Examination Date` LIKE '1991%' AND T1.HCT < 29
SELECT      SUM(IIF(PLT < 100, 1, 0)) AS lower,     SUM(IIF(PLT > 400, 1, 0)) AS higher,     SUM(IIF(PLT < 100, 1, 0)) - SUM(IIF(PLT > 400, 1, 0)) AS difference FROM      Laboratory AS T1  JOIN      Patient AS T2  ON      T1.ID = T2.ID
SELECT P.ID FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE SUBSTR(L.Date, 1, 4) = '1984' AND P.Birthday IS NOT NULL AND P.Birthday > DATE('now', 'start of year', '-50 years') AND L.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(CASE WHEN SUBTRACT(YEAR(GETDATE()), YEAR(T1.Birthday)) > 55 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PT >= 14
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.`First Date`) > '1992' AND T2.PT < 14
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45
SELECT COUNT(*) FROM Examination WHERE APTT > 45 AND Thrombosis = 3 AND (SELECT COUNT(*) FROM Examination WHERE ID = Patient.ID AND Thrombosis IS NOT NULL AND Thrombosis != 0) = 1
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.SEX = 'M' AND T3.`WBC` BETWEEN 3.5 AND 9.0 AND (T3.FG <= 150 OR T3.FG >= 450)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.Birthday > '1980-01-01' AND T3.FG NOT BETWEEN 150 AND 450
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` >= 30
SELECT T.ID FROM Patient AS T INNER JOIN Examination AS T1 ON T.ID = T1.ID WHERE T.Diagnosis = 'SLE' AND T1.`U-PRO` > 0 AND T1.`U-PRO` < 30
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`IgG` < 900 AND T1.Symptoms = 'Abortion'
SELECT COUNT(ID) FROM Examination WHERE `aCL IgG` BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`IGA` BETWEEN 80 AND 500 ORDER BY T2.`IGA` DESC LIMIT 1
SELECT COUNT(*) FROM Patient WHERE `First Date` > '1990-01-01' AND ID IN (SELECT ID FROM Examination WHERE IGA BETWEEN 80 AND 500)
SELECT T1.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`aCL IgM` NOT BETWEEN 40 AND 400 GROUP BY T1.Diagnosis ORDER BY COUNT(T1.Diagnosis) DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description IS NULL AND (T2.CRP LIKE '+' OR T2.CRP LIKE '-' OR T2.CRP < 1.0);
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE (T3.CRP NOT IN ('+-', '-') AND CAST(T3.CRP AS FLOAT) >= 1.0 AND T3.CRP IS NOT NULL) AND CAST(YEAR(CURDATE()) - YEAR(T1.Birthday) AS INT) >= 18
SELECT COUNT(DISTINCT T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.KCT = '+' AND T2.RA IN('-', '+-')
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RA IN ('-', '+-') AND YEAR(T1.Birthday) >= 1995
SELECT DISTINCT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND T2.`Examination Date` = ( SELECT `Examination Date` FROM Patient AS T3 WHERE T3.`Examination Date` > 0 ORDER BY T3.`Examination Date` DESC LIMIT 1 )
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND T2.Thrombosis = 0
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.C3 > 35 AND T2.`ANA Pattern` = 'P'
SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` >= '1997-05-27' AND T1.`First Date` <= '1998-04-02' AND T2.`aCL IgA` BETWEEN 29 AND 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 1 AND T2.C4 > 10
SELECT COUNT(DISTINCT ID) FROM Patient WHERE `First Date` IN ( SELECT ID FROM Examination WHERE RNP = '-' AND Admission = '+' )
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 1;
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SM IN ('-', '+-') AND T2.Thrombosis = 1
SELECT ID FROM Patient WHERE SM NOT IN ('-', '+-') ORDER BY Birthday DESC LIMIT 3
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` >= '1997-01-01' AND T2.SC170 IN ('-', '+-')
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND T2.symptoms = 'vertigo'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN ('-', '+-') AND YEAR(T1.`First Date`) < 1990
SELECT T2.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.SSA NOT IN ('-', '+-') ORDER BY T2.`First Date` ASC LIMIT 1
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.`SSB` IN ('-', '+-')
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('-', '+-') AND T2.Symptoms IS NOT NULL
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.CENTROMEA IN ('-', '+-') AND T2.SSB IN ('-', '+-') AND T1.SEX = 'M'
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.DNA >= 8
SELECT COUNT(DISTINCT T.ID) FROM Patient AS T WHERE T.Description IS NULL AND NOT EXISTS (SELECT 1 FROM Laboratory AS L WHERE L.ID = T.ID AND L.DNA < 8)
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.`DNA-II` >= 8
SELECT CAST(COUNT(CASE WHEN T1.GOT >= 60 AND T2.Diagnosis = 'SLE' THEN T1.ID ELSE NULL END) AS REAL) * 100 / COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60
SELECT MIN(T1.Birthday) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60
SELECT T1.Description FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T1.Description DESC LIMIT 3
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT < 60 AND T1.SEX = 'M';
SELECT MIN(`First Date`) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE LDH < 500 ORDER BY LDH ASC LIMIT 1);
SELECT MAX(`First Date`) FROM Patient WHERE ID IN (SELECT Patient.ID FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.LDH >= 500)
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ALP >= 300 AND T1.Admission = '+'
SELECT COUNT(T2.ALP) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.ALP < 300
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SJS' AND T1.TP > 6.0 AND T1.TP < 8.5
SELECT T1.`Examination Date` FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB > 3.5 AND T2.ALB < 5.5 ORDER BY T2.ALB DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.ALB BETWEEN 3.5 AND 5.5 AND T2.TP BETWEEN 6 AND 8.5
SELECT T1.ID, T1.`aCL IgG`, T1.`aCL IgM`, T1.`aCL IgA` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.UA > 6.50 ORDER BY T1.`aCL IgG` DESC, T1.`aCL IgM` DESC, T1.`aCL IgA` DESC LIMIT 1
SELECT MAX(T2.ANA) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5
SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.`T-BIL` >= 2.0 AND T1.`ANA Pattern` LIKE '%P%'
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T1.`T-BIL` DESC LIMIT 1
SELECT COUNT(L.ID) FROM Laboratory AS L WHERE L.`T-CHO` >= 250 AND L.KCT = '-'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` < 250 AND T2.`ANA Pattern` = 'P'
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 AND T2.Symptoms IS NOT NULL
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T2.TG DESC LIMIT 1
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 0 AND T2.CPK < 250
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.KCT = '+' OR T2.RVVT = '+' OR T2.LAC = '+' AND T1.SEX IS NOT NULL AND T1.Description IS NOT NULL
SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GLU > 180)
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T2.Thrombosis = 0
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.WBC BETWEEN 3.5 AND 9.0
SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND (T2.RBC < 3.5 OR T2.RBC > 6.0)
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.PLT > 100 AND T2.PLT < 400 AND T2.Diagnosis IS NOT NULL
SELECT T1.PLT FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.PLT > 100 AND T2.PLT < 400 AND T2.Diagnosis = 'MCTD';
SELECT AVG(T1.PT) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14
SELECT COUNT(ID) FROM Examination WHERE Thrombosis IN (1, 2) AND PT < 14
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.status = 'student' AND T1.status = 'active' AND T2.college = 'College of Engineering'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design'
SELECT count(T1.member_id) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T3.event_id = T2.link_to_event WHERE T3.event_name = 'Women''s Soccer';
SELECT T2.phone FROM event AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Women''s Soccer';
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.t_shirt_size = 'Medium'
SELECT T2.event_name FROM income AS T1 INNER JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member WHERE T1.source = 'Student_Club' GROUP BY T2.link_to_event ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T2.position = 'Vice President'
SELECT T2.event_name FROM member AS T1 INNER JOIN attendance AS T3 ON T1.member_id = T3.link_to_member INNER JOIN event AS T2 ON T2.event_id = T3.link_to_event WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean'
SELECT COUNT(DISTINCT T1.event_id) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND YEAR(T2.event_date) = 2019 AND T2.type = 'Student_Club'
SELECT COUNT(T1.event_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' GROUP BY T1.event_id HAVING COUNT(T2.link_to_member) > 10
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Student_Club' GROUP BY T1.event_id HAVING COUNT(T2.link_to_member) > 20
SELECT CAST(COUNT(T1.event_id) AS REAL) / COUNT(DISTINCT T1.event_name) FROM event AS T1 WHERE STRFTIME('%Y', T1.event_date) = '2020' AND T1.type = 'Meeting'
SELECT expense_description FROM expense ORDER BY cost DESC LIMIT 1
SELECT COUNT(T2.first_name) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Environmental Engineering'
SELECT T2.first_name, T2.last_name FROM event AS T1 INNER JOIN attendance AS T3 ON T1.event_id = T3.link_to_event INNER JOIN member AS T2 ON T3.link_to_member = T2.member_id WHERE T1.event_name = 'Laugh Out Loud'
SELECT last_name FROM member WHERE link_to_major = ( SELECT major_id FROM major WHERE major_name = 'Law and Constitutional Studies' )
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'
SELECT college FROM major WHERE major_name = (SELECT major_name FROM member WHERE first_name = 'Tyler' AND last_name = 'Hewitt')
SELECT amount FROM income WHERE link_to_member IN ( SELECT member_id FROM member WHERE position = 'Vice President' )
SELECT T.spent FROM ( SELECT SUM(b.spent) AS spent FROM budget AS b WHERE b.link_to_event IN ( SELECT e.event_id FROM event AS e WHERE e.event_name = 'September Meeting' ) AND b.category = 'Food' ) AS T
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois';
SELECT T.spent FROM budget AS T INNER JOIN event AS S ON T.link_to_event = S.event_id WHERE T.category = 'Advertisement' AND S.event_name = 'September Meeting'
SELECT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Pierce' AND T2.last_name = 'Guidi'
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker';
SELECT CASE WHEN T1.approved = 'True' THEN 'True' ELSE 'False' END FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T3.event_date = '2019-10-08'
SELECT avg(T3.cost) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member INNER JOIN expense AS T3 ON T1.member_id = T3.link_to_member WHERE T1.first_name = 'Elijah' AND T1.last_name = 'Allen' AND strftime('%m', T3.expense_date) IN ('09', '10');
SELECT SUM(T1.spent) - SUM(T2.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE SUBSTR(T2.event_date, 1, 4) = '2019' AND T1.category = 'Student_Club' UNION SELECT SUM(T1.spent) - SUM(T2.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE SUBSTR(T2.event_date, 1, 4) = '2020' AND T1.category = 'Student_Club'
SELECT location FROM event WHERE event_name = 'Spring Budget Review';
SELECT T2.cost FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T2.expense_description = 'Poster' AND T1.event_date = '2019-09-04'
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'
SELECT COUNT(major_id) FROM major WHERE college = 'College of Humanities and Social Sciences';
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT T3.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code INNER JOIN zip_code AS T3 ON T3.zip_code = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'
SELECT COUNT(event_status) FROM budget WHERE link_to_event IN ( SELECT event_id FROM event WHERE event_name = 'November Meeting' ) AND remaining < 0
SELECT SUM(amount) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Speaker')
SELECT T2.event_status FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Post Cards, Posters' AND T1.expense_date = '2019-08-20'
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'
SELECT COUNT(member_id) FROM member WHERE link_to_major = ( SELECT major_id FROM major WHERE major_name = 'Human Development and Family Studies' ) AND t_shirt_size = 'Large'
SELECT T2.type FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielsen'
SELECT T3.major_name FROM member AS T1 INNER JOIN event AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'Vice President' AND T2.type = 'Meeting'
SELECT state FROM zip_code WHERE zip = ( SELECT zip FROM member WHERE first_name = 'Sacha' AND last_name = 'Harrison' )
SELECT DISTINCT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T2.position = 'President'
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.source = 'Dues' AND T2.first_name = 'Connor' AND T2.last_name = 'Hilton';
SELECT first_name, last_name FROM member WHERE DATE(date_received) = ( SELECT MIN(DATE(date_received)) FROM income WHERE source = 'Dues' )
SELECT SUM(CASE WHEN T2.category = 'Advertisement' AND T2.event_name = 'Yearly Kickoff' THEN 1 ELSE 0 END) / SUM(CASE WHEN T2.category = 'Advertisement' AND T2.event_name = 'October Meeting' THEN 1 ELSE 0 END) FROM budget AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T1.category = 'Advertisement'
SELECT CAST(SUM(IIF(T2.category = 'Parking' AND T1.event_name = 'November Speaker', T2.amount, 0)) AS REAL) * 100 / CAST(SUM(IIF(T1.event_name = 'November Speaker', T2.amount, 0)) AS REAL) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event
SELECT SUM(T1.cost) FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.expense_description = 'Pizza'
SELECT COUNT(DISTINCT T2.city) FROM zip_code AS T1 INNER JOIN event AS T2 ON T1.zip_code = T2.location WHERE T1.county = 'Orange County' AND T1.state = 'Virginia'
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT T2.city, T2.county, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T2.expense_description FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget ORDER BY T1.remaining ASC LIMIT 1
SELECT T2.first_name, T2.last_name FROM event AS T1 INNER JOIN attendance AS T3 ON T1.event_id = T3.link_to_event INNER JOIN member AS T2 ON T3.link_to_member = T2.member_id WHERE T1.event_name = 'October Meeting'
SELECT college FROM member GROUP BY college ORDER BY COUNT(college) DESC LIMIT 1
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1
SELECT T3.expense_description FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN expense AS T3 ON T3.link_to_budget = T1.budget_id INNER JOIN member AS T4 ON T4.member_id = T3.link_to_member WHERE T4.position = 'Vice President'
SELECT COUNT(T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women''s Soccer'
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'
SELECT COUNT(*) FROM member WHERE SUBSTR(zip, 1, 2) = 'MD'
SELECT COUNT(T1.link_to_event) FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.phone = '954-555-6240';
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President' AND link_to_major IS NOT NULL AND LOWER(position) = 'president'
SELECT MAX(spent) FROM budget
SELECT COUNT(*) FROM event WHERE event_date LIKE '2020%' AND type = 'Meeting';
SELECT SUM(T2.spent) FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T1.category = 'Food'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(T2.link_to_event)  >  7
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN attendance AS T3 ON T1.member_id = T3.link_to_member INNER JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T2.major_name = 'Interior Design' AND T4.event_name = 'Community Theater'
SELECT T2.first_name, T2.last_name FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T1.city = 'Georgetown' AND T1.state = 'South Carolina'
SELECT amount FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour')
SELECT T2.first_name, T2.last_name FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.amount > 40
SELECT SUM(T3.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Baseball game'
SELECT T2.link_to_budget FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member ORDER BY T2.amount DESC LIMIT 1
SELECT event_name FROM budget ORDER BY cost ASC LIMIT 1
SELECT CAST(SUM(T2.cost) AS REAL) * 100 / SUM(T3.cost) AS Percentage FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff'
SELECT CAST(SUM(IIF(major_name = 'Finance', 1, 0)) AS REAL) / SUM(IIF(major_name = 'Physics', 1, 0)) FROM major
SELECT MAX(source) FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30'
SELECT T1.first_name, T1.last_name, T1.email FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Student Club' AND T1.position = 'Secretary'
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching'
SELECT COUNT(DISTINCT T1.link_to_member) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Community Theater' AND YEAR(T2.event_date) = 2019
SELECT COUNT(T1.event_id) ,  T3.major_name FROM attendance AS T1 INNER JOIN member AS T2 ON T2.member_id = T1.link_to_member INNER JOIN major AS T3 ON T3.major_id = T2.link_to_major WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'
SELECT SUM(T2.spent) / COUNT(T2.spent) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_status = 'Closed' AND T2.category = 'Food'
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement' ORDER BY T1.spent DESC LIMIT 1
SELECT T1.first_name, T1.last_name, T2.event_name FROM member AS T1 INNER JOIN attendance AS T3 ON T1.member_id = T3.link_to_member INNER JOIN event AS T2 ON T3.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer' AND T1.first_name = 'Maya' AND T1.last_name = 'Mclean'
SELECT CAST(SUM(CASE WHEN T1.type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE STRFTIME('%Y', T1.event_date) = '2019'
SELECT cost FROM expense WHERE expense_description = 'Posters' AND link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Speaker');
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining LIMIT 1
SELECT T2.expense_description, SUM(T2.cost) AS total_value FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Meeting' AND T2.approved = 'Yes' GROUP BY T2.expense_description
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'April Speaker' ORDER BY T2.category ASC
SELECT amount FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT T1.link_to_event FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement' ORDER BY T1.amount DESC LIMIT 3
SELECT SUM(T2.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Parking'
SELECT SUM(T2.cost) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_date = '2019-08-20'
SELECT T1.first_name, T1.last_name, SUM(T3.cost) FROM member AS T1 INNER JOIN expense AS T3 ON T1.member_id = T3.link_to_member WHERE T1.member_id = 'rec4BLdZHS2Blfp4v'
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison';
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'X-Large'
SELECT T1.zip FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost < 50
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'
SELECT T1.position FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'
SELECT COUNT(*) FROM member WHERE major_id = ( SELECT major_id FROM major WHERE major_name = 'Business' ) AND t_shirt_size = 'Medium'
SELECT T1.type FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_date = '2020-03-24T12:00:00'
SELECT T3.major_name FROM member AS T1 INNER JOIN major AS T3 ON T3.major_id = T1.link_to_major WHERE T1.position = 'Vice President'
SELECT CAST(SUM(CASE WHEN T2.position = 'Member' AND T1.major_name = 'Mathematics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major
SELECT category FROM event WHERE location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN event AS T2 ON T1.member_id = T2.event_id WHERE T2.t_shirt_size = 'X-Large' AND T2.position = 'Member'
SELECT COUNT(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences';
SELECT T1.last_name, T3.department, T3.college FROM member AS T1 INNER JOIN major AS T3 ON T3.major_id = T1.link_to_major WHERE T3.major_name = 'Environmental Engineering'
SELECT DISTINCT T3.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN major AS T3 ON T2.location = 'MU 215' WHERE T2.type = 'Guest Speaker' AND T1.spent = 0
SELECT T2.city, T2.state FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.department = 'Electrical and Computer Engineering' AND T2.position = 'Member'
SELECT event_name FROM event WHERE type = 'Social' AND location = '900 E. Washington St.'
SELECT T2.last_name, T2.position FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_date = '2019-09-10' AND T1.expense_description = 'Pizza'
SELECT T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer'
SELECT CAST(SUM(IIF(amount = 50, 1, 0)) AS REAL) * 100 / COUNT(DISTINCT member_id) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Member' AND T1.t_shirt_size = 'Medium'
SELECT COUNT(T2.zip_code), T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip GROUP BY T2.zip_code
SELECT zip FROM zip_code WHERE type = 'PO Box' AND state = 'PR';
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'
SELECT T1.link_to_event FROM expense AS T1 INNER JOIN member AS T2 ON T2.member_id = T1.link_to_member WHERE T1.cost > 50
SELECT T2.first_name, T2.last_name, T3.link_to_event FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN attendance AS T3 ON T2.member_id = T3.link_to_member WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Katy' AND T2.link_to_major = 'rec1N0upiVLy5esTO'
SELECT phone FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND major_name = 'Business')
SELECT T1.email FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received BETWEEN '2019-09-10' AND '2019-11-19' AND T2.amount > 20
SELECT COUNT(T2.member_id) FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T1.major_name = 'Education' AND T2.position = 'Member';
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM budget
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT AVG(spend) FROM  (SELECT cost FROM expense WHERE cost > 50);
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT CAST(COUNT(CASE WHEN type = 'PO Box' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code
SELECT event_name, location FROM event WHERE event_id IN ( SELECT link_to_event FROM budget WHERE remaining > 0 )
SELECT T1.event_name, T1.event_date FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100
SELECT T1.first_name, T1.last_name, T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN expense AS T3 ON T1.member_id = T3.link_to_member WHERE T3.cost > 100
SELECT T2.city, T2.country FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN income AS T3 ON T1.link_to_event = T3.link_to_event WHERE T1.event_status = 'Open' GROUP BY T2.event_id HAVING count(*) > 40
SELECT T1.first_name, T1.last_name, MAX(T3.cost) FROM member AS T1 INNER JOIN expense AS T3 ON T1.member_id = T3.link_to_member GROUP BY T1.member_id HAVING COUNT(DISTINCT T3.link_to_event) > 1 ORDER BY MAX(T3.cost) DESC LIMIT 1
SELECT CAST(SUM(T1.amount) AS REAL) / COUNT(T2.event_id) FROM income AS T1 INNER JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member WHERE T2.link_to_event IN (SELECT link_to_event FROM event WHERE position != 'Member')
SELECT event_name FROM event WHERE event_id IN ( SELECT link_to_event FROM budget WHERE category = 'Parking' AND cost < ( SELECT AVG(cost) FROM budget WHERE category = 'Parking' ) )
SELECT CAST(SUM(T2.cost) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T1.type = 'Game'
SELECT link_to_budget FROM expense WHERE expense_description = 'Water, chips, cookies' GROUP BY link_to_budget ORDER BY SUM(cost) DESC LIMIT 1
SELECT T1.first_name, T1.last_name, SUM(T3.cost) as TotalExpenses FROM member AS T1 INNER JOIN expense AS T3 ON T1.member_id = T3.link_to_member GROUP BY T1.member_id ORDER BY TotalExpenses DESC LIMIT 5
SELECT T3.first_name, T3.last_name, T3.phone FROM expense AS T1 INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T1.cost > (SELECT AVG(T1.cost) FROM expense AS T1 INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id)
SELECT CAST(SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) - CAST(SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_difference FROM zip_code
SELECT T1.major_name, T2.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'
SELECT T2.first_name, T2.last_name, T3.cost FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN income AS T3 ON T1.link_to_member = T3.link_to_member WHERE T1.expense_description = 'Water, Veggie tray, supplies'
SELECT last_name, phone FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Elementary Education')
SELECT category, amount FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker'
SELECT event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food';
SELECT T3.first_name, T3.last_name, T2.amount FROM income AS T1 INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T1.date_received = '2019-09-09'
SELECT DISTINCT category FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Posters';
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'
SELECT T2.event_name, SUM(T3.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN expense AS T3 ON T3.link_to_budget = T1.budget_id WHERE T3.expense_description = 'Speaker Gift' GROUP BY T2.event_name
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T2.zip_code = T1.zip WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Girke'
SELECT T2.first_name, T2.last_name, T2.position FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T1.city = 'Lincolnton' AND T1.state = 'North Carolina' AND T1.zip_code = 28092
SELECT COUNT(T3.GasStationID) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN gasstations AS T3 ON T3.GasStationID = T2.GasStationID WHERE T1.Currency = 'EUR' AND T1.Segment = 'LAM' AND T2.ProductID = 1 AND T3.Country = 'CZE'
SELECT COUNT(CASE WHEN T1.Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN T1.Currency = 'CZK' THEN 1 END) AS Ratio FROM customers AS T1
SELECT T1.CustomerID, T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T2.`Date` BETWEEN '2012-01-01' AND '2012-12-31' ORDER BY T2.Consumption LIMIT 1
SELECT AVG(T3.Consumption) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T1.Date = T3.Date WHERE T2.Segment = 'SME' AND T1.Date BETWEEN '201301' AND '201312'
SELECT T2.CustomerID FROM `transactions_1k` AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'CZK' AND T1.Date BETWEEN '201101' AND '201112' GROUP BY T2.CustomerID ORDER BY SUM(T1.Amount) DESC LIMIT 1
SELECT COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201201' AND '201212' AND T2.Consumption < 30000 AND T1.Segment = 'KAM'
SELECT CAST(SUM(IIF(T1.CustomerID IN (SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Date BETWEEN '201201' AND '201212'), T2.Consumption, 0)) - SUM(IIF(T1.CustomerID IN (SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND T2.Date BETWEEN '201201' AND '201212'), T2.Consumption, 0)) AS diff FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201201' AND '201212'
SELECT strftime('%Y', Date) FROM yearmonth GROUP BY strftime('%Y', Date) ORDER BY COUNT(CustomerID) DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY AVG(T2.Consumption) ASC LIMIT 1
SELECT CAST(strftime('%Y', T2.Date) AS INTEGER) AS YEAR, sum(T2.Consumption) FROM yearmonth AS T2 INNER JOIN customers AS T1 ON T2.CustomerID = T1.CustomerID WHERE T1.Currency = 'CZK' GROUP BY CAST(strftime('%Y', T2.Date) AS INTEGER) ORDER BY sum(T2.Consumption) DESC LIMIT 1
SELECT T2.Date FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption DESC LIMIT 1
SELECT SUM(CASE WHEN T2.segment = 'SME' THEN T3.Consumption ELSE 0 END) -         SUM(CASE WHEN T2.segment = 'LAM' THEN T3.Consumption ELSE 0 END) AS SME_vs_LAM,        SUM(CASE WHEN T2.segment = 'LAM' THEN T3.Consumption ELSE 0 END) -         SUM(CASE WHEN T2.segment = 'KAM' THEN T3.Consumption ELSE 0 END) AS LAM_vs_KAM,        SUM(CASE WHEN T2.segment = 'KAM' THEN T3.Consumption ELSE 0 END) -         SUM(CASE WHEN T2.segment = 'SME' THEN T3.Consumption ELSE 0 END) AS KAM_vs_SME FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE SUBSTR(T1.Date, 1, 4) = '2013'  GROUP BY T2.segment
SELECT T1.Segment, CASE      WHEN T1.Segment = 'SME' THEN COUNT(*) ELSE 0      END AS "In 2013",      CASE      WHEN T1.Segment = 'LAM' THEN COUNT(*) ELSE 0      END AS "In 2012",      CASE      WHEN T1.Segment = 'KAM' THEN COUNT(*) ELSE 0      END AS "In 2012"  FROM      customers AS T1  WHERE      T1.Segment IN ('SME', 'LAM', 'KAM')      AND T1.Currency = 'EUR'  GROUP BY      T1.Segment;
SELECT SUM(T3.Amount) FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.CustomerID = 6 AND T2.Date BETWEEN '201308' AND '201311'
SELECT SUM(CASE WHEN T2.Country = 'Czech Republic' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.Country = 'Slovakia' THEN 1 ELSE 0 END) FROM gasstations AS T1 INNER JOIN customers AS T3 ON T1.Segment = T3.Segment INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID
SELECT CASE WHEN SUM(T1.Consumption) - SUM(T2.Consumption) > 0 THEN SUM(T1.Consumption) - SUM(T2.Consumption) ELSE 0 END AS "Difference in Consumption" FROM yearmonth AS T1 INNER JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID INNER JOIN transactions_1k AS T4 ON T1.Date = T4.Date AND T3.CustomerID = T4.CustomerID INNER JOIN gasstations AS T5 ON T4.GasStationID = T5.GasStationID INNER JOIN products AS T6 ON T4.ProductID = T6.ProductID WHERE T1.Date LIKE '2013-04%' AND T3.CustomerID = 7 AND T3.CustomerID = 5
SELECT CASE WHEN COUNT(CASE WHEN customers.Currency = 'EUR' THEN 1 ELSE NULL END) > COUNT(CASE WHEN customers.Currency = 'CZK' THEN 1 ELSE NULL END) THEN COUNT(CASE WHEN customers.Currency = 'CZK' THEN 1 ELSE NULL END) - COUNT(CASE WHEN customers.Currency = 'EUR' THEN 1 ELSE NULL END) ELSE 0 END AS "Total of SMEs uses Czech Koruna - Total of SMEs uses Euro" FROM customers JOIN transactions_1k ON customers.CustomerID = transactions_1k.CustomerID WHERE customers.Segment = 'SME'
SELECT T2.customerid FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.customerid = T2.customerid WHERE T1.currency = 'EUR' AND T2.date LIKE '2013-10%' AND T1.segment = 'LAM' ORDER BY T2.consumption DESC LIMIT 1
SELECT T3.CustomerID, SUM(T3.Consumption) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN transactions_1k AS T3 ON T3.Date = T1.Date WHERE T2.Segment = 'KAM' GROUP BY T3.CustomerID ORDER BY SUM(T3.Consumption) DESC LIMIT 1
SELECT SUM(Amount * Price) FROM transactions_1k WHERE CustomerID IN ( SELECT CustomerID FROM customers WHERE Segment = 'KAM' ) AND Date BETWEEN '2013-05-01' AND '2013-05-31'
SELECT CAST(SUM(IIF(Amount > 4673, 1, 0)) AS REAL) * 100 / COUNT(CustomerID) AS percent FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'
SELECT T2.Country, SUM(T1.Price) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T2.Country ORDER BY SUM(T1.Price) ASC LIMIT 1
SELECT CAST(SUM(IIF(T1.Currency = 'EUR', 1, 0)) AS REAL) * 100 / COUNT(T1.Currency) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM'
SELECT CAST(SUM(IIF(t1.Consumption > 528.3, 1, 0)) AS REAL) * 100 / COUNT(DISTINCT t2.CustomerID) FROM yearmonth AS t1 INNER JOIN transactions_1k AS t2 ON t1.CustomerID = t2.CustomerID INNER JOIN customers AS t3 ON t1.CustomerID = t3.CustomerID INNER JOIN gasstations AS t4 ON t2.GasStationID = t4.GasStationID WHERE t1.Date LIKE '2012%' AND t1.Date LIKE '%-02-%'
SELECT CAST(SUM(CASE WHEN T1.Country = 'Slovakia' AND T1.Segment = 'premium' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T2.GasStationID) FROM gasstations AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.GasStationID = T2.GasStationID
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1
SELECT T3.segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.customerid = T2.customerid INNER JOIN yearmonth AS T3 ON T1.date = T3.date WHERE T3.date LIKE '201309' GROUP BY T3.segment ORDER BY AVG(T1.amount) ASC LIMIT 1
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND strftime('%Y%m', T2.Date) = '201206' ORDER BY T2.Consumption LIMIT 1
SELECT MAX(Consumption), SUBSTR(Date, 1, 4) FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012';
SELECT T2.Consumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' ORDER BY T2.Consumption DESC LIMIT 1
SELECT T3.Description FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T2.CustomerID = T1.CustomerID INNER JOIN transactions_1k AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Date LIKE '201309%' AND T3.Date LIKE '201309%'
SELECT DISTINCT T1.Country FROM gasstations AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '201306'
SELECT DISTINCT t2.ChainID FROM yearmonth AS t1 INNER JOIN transactions_1k AS t2 ON t1.CustomerID = t2.CustomerID INNER JOIN gasstations AS t3 ON t2.GasStationID = t3.GasStationID WHERE t3.Segment = 'EUR'
SELECT T3.Description FROM transactions_1k AS T1 INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T1.Currency = 'EUR'
SELECT AVG(T2.Price * T2.Amount) FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T1.Date LIKE '2012-01%'
SELECT COUNT(DISTINCT CustomerID) FROM customers WHERE Currency = 'EUR' AND CustomerID IN (SELECT CustomerID FROM yearmonth WHERE Consumption > 1000)
SELECT t3.Description FROM transactions_1k AS t1 INNER JOIN gasstations AS t2 ON t1.GasStationID = t2.GasStationID INNER JOIN products AS t3 ON t1.ProductID = t3.ProductID WHERE t2.Country = 'CZE'
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11)
SELECT COUNT(T1.ProductID) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000
SELECT COUNT(T1.TransactionID) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date > '2012-01-01' AND T2.Country = 'CZE'
SELECT avg(Price * Amount) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE')
SELECT AVG(Amount * Price) FROM transactions_1k WHERE Currency = 'EUR'
SELECT CustomerID FROM transactions_1k WHERE DATE(Date) = '2012-08-25' GROUP BY CustomerID ORDER BY SUM(Amount) DESC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' GROUP BY T2.Country
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Time = '16:25:00' AND strftime('%Y-%m-%d', T2.Date) = '2012-08-24'
SELECT t1.segment FROM customers AS t1 INNER JOIN transactions_1k AS t2 ON t1.customerid = t2.customerid WHERE DATE(T2.Date) = '2012-08-23' AND t2.time = '21:20:00'
SELECT SUM(CASE WHEN SUBSTR(Time, 1, 2) < '13' THEN 1 ELSE 0 END) FROM transactions_1k WHERE DATE(Date) = '2012-08-26' AND Currency = 'EUR'
SELECT Segment FROM customers WHERE CustomerID = ( SELECT MIN(CustomerID) FROM customers )
SELECT T2.country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.gasstationid = T2.gasstationid WHERE T1.`date` = '2012-08-24' AND T1.time = '12:42:00'
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND time = '21:20:00'
SELECT SUM(T2.Price * T1.Amount), DATE(T1.Date) FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-01-01' AND T2.CustomerID = 5
SELECT SUM(IIF(T2.Country = 'CZE', 1, 0)) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00' AND '09:00'
SELECT Currency FROM customers WHERE CustomerID IN (SELECT CustomerID FROM yearmonth WHERE Date LIKE '2013-06%')
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE strftime('%Y-%m-%d', T1.Date) = '2012-08-24' AND T1.Amount * T1.Price = 548.4
SELECT COUNT(CASE WHEN T1.Date = '2012-08-25' AND T1.Currency = 'EUR' THEN 1 ELSE NULL END) * 100.0 / COUNT(*) FROM customers AS T1
SELECT T2.Consumption - T3.Consumption * 1.0 / T2.Consumption FROM yearmonth AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.CustomerID = 3 AND T1.Date = '2012-08-25' AND T2.Date = '2012-12-31' AND T3.Date = '2013-12-31'
SELECT T1.GasStationID FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T1.GasStationID ORDER BY SUM(T1.Amount * T1.Price) DESC LIMIT 1
SELECT SUM(IIF(T1.ProductID = 11, 1, 0)) AS "PREMIUM_SEG", SUM(IIF(T1.ProductID = 7, 1, 0)) AS "OIL_SEG", SUM(IIF(T2.Description = 'Oil', 1, 0)) AS "OIL", SUM(IIF(T2.Description = 'Premium', 1, 0)) AS "PREMIUM", SUM(IIF(T2.Description = 'Diesel', 1, 0)) AS "DIESEL", SUM(IIF(T1.Price * T1.Amount < 0, 1, 0)) AS "OVERALL", T2.Segment FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Segment = 'SME' AND T1.Price * T1.Amount < 0 GROUP BY T2.Segment
SELECT SUM(T1.Price * T1.Amount) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.CustomerID = '38508' UNION SELECT SUM(T1.Price * T1.Amount) FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201201' AND T1.CustomerID = '38508';
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID GROUP BY T1.Description ORDER BY COUNT(T2.ProductID) DESC LIMIT 5
SELECT T1.CustomerID ,  avg(T3.Price / T3.Amount) ,  T2.Currency FROM transactions_1k AS T3 INNER JOIN customers AS T2 ON T2.CustomerID = T3.CustomerID INNER JOIN yearmonth AS T1 ON T1.CustomerID = T3.CustomerID GROUP BY T1.CustomerID ORDER BY SUM(T3.Price) DESC LIMIT 1
SELECT Country FROM gasstations WHERE GasStationID IN (SELECT T1.GasStationID FROM `transactions_1k` AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T2.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1)
SELECT YM.Consumption FROM yearmonth AS YM INNER JOIN `transactions_1k` AS T ON YM.CustomerID = T.CustomerID WHERE T.ProductID = 5 AND T.Price / T.Amount > 29 AND STRFTIME('%Y%m', YM.Date) = '201208'
