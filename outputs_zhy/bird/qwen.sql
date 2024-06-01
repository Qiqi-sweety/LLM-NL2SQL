SELECT MAX(T1.`Percent (%) Eligible Free (K-12)`) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Alameda'
SELECT * FROM frpm ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3
SELECT DISTINCT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.`School Code` = T2.CDSCode WHERE T2.District = 'Fresno County Office of Education' AND T1.`Charter School (Y/N)` = 1
SELECT T2.MailStreet, T2.MailStrAbr, T2.MailCity FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1
SELECT Phone FROM schools WHERE `Charter School (Y/N)` = 1 AND strftime('%Y', OpenDate) > '2000';
SELECT COUNT(*) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath < 400 AND T1.Virtual = 'F'
SELECT DISTINCT T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T2.CDSCode = T1.CDSCode INNER JOIN satscores AS T3 ON T3.cds = T1.CDSCode WHERE T3.NumTstTakr > 500 AND T1.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.avgscrread > 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT T1.NumTstTakr FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 1
SELECT COUNT(T1.CDSCode) FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.CDS = T2.CDSCode WHERE T2.Charter = 1 AND T1.AvgScrMath > 560 AND T1.rtype = 'S'
SELECT T4.`FRPM Count (Ages 5-17)` FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode INNER JOIN frpm AS T4 ON T2.CDSCode = T4.CDSCode WHERE T2.School = 'Community School for Creative Education' ORDER BY T1.AvgScrRead DESC LIMIT 1
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500
SELECT MAX(T1.`Percent (%) Eligible Free (Ages 5-17)`) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead > 0 AND T2.AvgScrMath > 0 AND T2.AvgScrWrite > 0 AND T2.`NumGE1500` > 0 AND T2.`NumTstTakr` > 0 AND T2.`AvgScrRead` - T2.`AvgScrMath` - T2.`AvgScrWrite` > 0 AND T2.`NumGE1500` * 100.0 / T2.`NumTstTakr` > 0.3
SELECT T3.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode INNER JOIN frpm AS T3 ON T2.CDSCode = T3.CDSCode ORDER BY (T1.NumGE1500 / T1.NumTstTakr) DESC LIMIT 3
SELECT T1.School, T2.NCESSchool FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Enrollment >= 5 ORDER BY T1.Enrollment DESC LIMIT 5
SELECT T1.`District Name` FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`District Type` = 'County Office of Education (COE)' AND T1.StatusType = 'Active' ORDER BY T2.AvgScrRead DESC LIMIT 1
SELECT COUNT(*) FROM satscores WHERE NumTstTakr < 100
SELECT CharterNum FROM schools WHERE CDSCode IN (SELECT CDS FROM satscores WHERE AvgScrWrite = 499)
SELECT COUNT(*) FROM frpm WHERE FundingType = 'Directly funded' AND (`2013-14 CalPADS Fall 1 Certification Status` IS NULL OR `2013-14 CalPADS Fall 1 Certification Status` <= 250)
SELECT Phone FROM schools WHERE CDSCode IN (SELECT T2.CDSCode FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores))
SELECT COUNT(CDSCode) FROM frpm WHERE `Low Grade` = '9' AND `High Grade` = '12'
SELECT COUNT(T2.CDSCode) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.`Free Meal Count (K-12)` > 500 AND T1.`Free Meal Count (K-12)` < 700
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Contra Costa' ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT T1.School, T1.Street, T1.StreetAbr, T1.City, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) > 30
SELECT S.School FROM schools S INNER JOIN frpm F ON S.CDSCode = F.CDSCode INNER JOIN satscores SCO ON S.CDSCode = SCO.cds WHERE F.`Percent (%) Eligible Free (K-12)` > 0.1 AND SCO.AvgScrRead >= 1500 AND SCO.AvgScrMath >= 1500 AND SCO.AvgScrWrite >= 1500
SELECT T3.fundingType FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds INNER JOIN frpm AS T3 ON T1.CDSCode = T3.CDSCode WHERE T1.County = 'Riverside' AND T2.avgscrmath > 400
SELECT T1.city, T1.street, T1.zip, T1.state, T2.school FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.cdscode = T2.cdscode WHERE T2.high_grade = '17' AND T2.free_meal_count_ages_15_17 > 800 AND T1.district = 'Monterey';
SELECT T1.school, T1.avgscrwrite, T2.phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE (T2.opendate > '1991-01-01' OR T2.closedate < '2000-01-01')
SELECT DISTINCT T1.School, T1.DOCType FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 0 AND T2.`Free Meal Count (K-12)` IS NOT NULL AND T2.`Enrollment (K-12)` IS NOT NULL AND T2.`Enrollment (Ages 5-17)` IS NOT NULL ORDER BY ABS(T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) - (SELECT AVG(T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) FROM frpm AS T2 WHERE T2.Charter = 0 AND T2.`Free Meal Count (K-12)` IS NOT NULL AND T2.`Enrollment (K-12)` IS NOT NULL AND T2.`Enrollment (Ages 5-17)` IS NOT NULL);
SELECT MIN(OpenDate) FROM schools WHERE SchoolType = 'K-12';
SELECT DISTINCT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`High Grade` = '12' AND T1.`Enrollment (K-12)` > 0 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT T2.Free_Meal_Count_K_12, T2.Enrollment_K_12 FROM ( SELECT TOP 10 CASE WHEN `High Grade` = '10' THEN '10th' WHEN `High Grade` = '11' THEN '11th' ELSE 'others' END AS schooltype, AVG(`Free Meal Count (K-12)`) as Free_Meal_Count_K_12, AVG(`Enrollment (K-12)`) as Enrollment_K_12 FROM frpm GROUP BY CASE WHEN `High Grade` = '10' THEN '10th' WHEN `High Grade` = '11' THEN '11th' ELSE 'others' END ORDER BY Enrollment_K_12 DESC ) AS T2
SELECT T1.CDSCode, T1.`School Name`, T1.`Enrollment (K-12)`, T1.`Free Meal Count (K-12)`, (T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)`) AS `Eligible Free or Reduced Price Meal Rate` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`School Type` LIKE '%Public%' AND T1.`District Type` LIKE '%County%' AND T2.`School Type` LIKE '%Public%' AND T2.`District Type` LIKE '%County%' AND T1.`Educational Option Type` LIKE '%K-12%' AND T1.`Ownership Code` = '66' ORDER BY T2.`Free Meal Count (K-12)` DESC LIMIT 5
SELECT T3.school FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds INNER JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T1.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE School_Name = 'Kacey Gibson'
SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter = 1 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1
SELECT T3.AdmFName1, T3.AdmLName1 FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.CDS LEFT JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T2.NumGE1500 >= 1500 ORDER BY T2.NumTstTakr DESC LIMIT 1
SELECT T1.Street, T1.City, T1.Zip, T1.State FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY (CAST(T2.NumGE1500 AS REAL) / CAST(T2.NumTstTakr AS REAL)) ASC LIMIT 1
SELECT DISTINCT T3.Website FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds INNER JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T2.NumTstTakr BETWEEN 2000 AND 3000
SELECT avg(NumTstTakr) FROM satscores WHERE cds IN (SELECT CDSCode FROM schools WHERE District = 'Fresno' AND YEAR(`OpenDate`) = 1980)
SELECT Phone FROM schools WHERE DISTRICT = 'Fresno Unified' ORDER BY AvgScrRead LIMIT 1
SELECT T2.school FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.virtual = 'F' ORDER BY T1.AvgScrRead DESC LIMIT 5
SELECT T3.EducationalOptionType FROM satscores AS T1 INNER JOIN frpm AS T2 ON T2.CDSCode = T1.cds INNER JOIN schools AS T3 ON T3.CDSCode = T2.CDSCode WHERE T1.AvgScrMath = ( SELECT MAX(AvgScrMath) FROM satscores )
SELECT AVG(AvgScrMath + AvgScrRead + AvgScrWrite) AS AvgScore, County FROM schools WHERE CDSCode IN (SELECT T1.CDSCode FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite ASC LIMIT 1)
SELECT T2.city FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.cds WHERE T1.NumTstTakr = ( SELECT MAX(T3.NumTstTakr) FROM satscores AS T3 WHERE T3.NumGE1500 >= 1500 )
SELECT S.school, AVG(S.AvgScrWrite) AS Avg_Write_Score FROM schools S INNER JOIN frpm F ON S.CDSCode = F.CDSCode WHERE F.EdOpsName = 'Ricci Ulrich' GROUP BY S.school
SELECT T3.State FROM frpm AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.CDSCode INNER JOIN schools AS T3 ON T3.District = T2.District WHERE T3.DOC = '31' AND T1.Grade = 'K' AND T1.Grade = '1' AND T1.Grade = '2' AND T1.Grade = '3' AND T1.Grade = '4' AND T1.Grade = '5' AND T1.Grade = '6' AND T1.Grade = '7' AND T1.Grade = '8' AND T1.Grade = '9' AND T1.Grade = '10' AND T1.Grade = '11' AND T1.Grade = '12' GROUP BY T3.State ORDER BY SUM(T1.`Enrollment (K-12)`) DESC
SELECT COUNT(DISTINCT t2.CDSCode) AS avg_schools_count  FROM frpm AS t1  INNER JOIN schools AS t2 ON t1.CDSCode = t2.CDSCode  WHERE t2.DOC = 52 AND t1.`Academic Year` = '1980'
SELECT COUNT(DISTINCT CASE WHEN DOC = '52' THEN T1.NCESDist ELSE NULL END) / CAST(COUNT(DISTINCT CASE WHEN DOC = '54' THEN T1.NCESDist ELSE NULL END) AS REAL) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.DOC IN ('52', '54');
SELECT DISTINCT `County Name`, T1.School , T1.`Closed Date` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' ORDER BY `County Name` DESC
SELECT MailingStreet FROM schools ORDER BY AvgScrMath DESC LIMIT 1 OFFSET 5
SELECT T1.MailStreet FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead ASC LIMIT 1
SELECT SUM(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.City = 'Lakeport' AND T1.MailCity = 'Lakeport' AND T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500
SELECT COUNT(T1.NumTstTakr) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Fresno'
SELECT city, zip FROM schools WHERE EdOpsName = 'Avetik Atoian'
SELECT CAST(COUNT(CASE WHEN T2.county = 'Colusa' THEN 1 END) AS REAL) / COUNT(CASE WHEN T2.county = 'Humboldt' THEN 1 END) FROM schools AS T2 INNER JOIN ( SELECT MailState FROM schools WHERE LENGTH(MailState) = 2 ) AS T1 ON T1.MailState = T2.State
SELECT COUNT(*) FROM schools WHERE MailingState = 'CA' AND StatusType = 'Active';
SELECT Phone, Ext FROM schools ORDER BY AvgScrWrite DESC LIMIT 1 OFFSET 332
SELECT T2.Phone, T2.Ext FROM schools AS T1 INNER JOIN frpm AS T2 ON T2.CDSCode = T1.CDSCode WHERE T1.Zip = '95203-3704'
SELECT Website FROM schools WHERE EdOpsName = 'Mike Larson' OR EdOpsName = 'Dante Alvarez';
SELECT Website FROM schools WHERE CHARTER = 1 AND Virtual = 'P'
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND CHARTER = 1;
SELECT COUNT(CASE WHEN CHARTER = 0 AND Percent_Eligible_Free_K12 < 0.18 THEN 1 ELSE NULL END) FROM frpm WHERE City = 'Los Angeles'
SELECT T1.AdmFName1 || ' ' || T1.AdmLName1, T1.AdmFName2 || ' ' || T1.AdmLName2, T1.AdmFName3 || ' ' || T1.AdmLName3, T3.School, T3.City FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN satscores AS T3 ON T3.cds = T2.CDSCode WHERE T1.charter = 1 AND T2.CharterNumber = '00D2'
SELECT COUNT(*) FROM schools WHERE MailingCity = 'Hickman' AND CharterNum = '00D4';
SELECT CAST(COUNT(CASE WHEN FundingType = 'Breakfast Provision 2' AND District = 'Santa Clara' THEN 1 END) AS REAL) / COUNT(CASE WHEN District = 'Santa Clara' THEN 1 END) * 100 AS Percentage FROM schools WHERE District = 'Santa Clara';
SELECT COUNT(*) FROM schools WHERE DOC LIKE 'Stanislaus%' AND DOCType = 'County' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT COUNT(*) FROM schools WHERE DISTRICT = 'Santa Clara' AND CHARTER = 0 AND YEAR(ClosedDate) = 1989
SELECT T1.County FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOC = '11' AND strftime('%Y', T1.OpenDate) BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY T1.County ORDER BY COUNT(T1.County) DESC LIMIT 1
SELECT `NCESDist` FROM schools WHERE `SOC` = 31
SELECT SUM(CASE WHEN DISTRICT = 'Alpine' THEN 1 ELSE 0 END) FROM schools WHERE StatusType = 'Active' OR StatusType = 'Closed' AND DISTRICT = 'Alpine'
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0
SELECT SUM(T1.`Enrollment (Ages 5-17)`) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Academic Year` = '2014-2015' AND T2.EdOpsCode = 'SSS'
SELECT T1.FreeMealCount_Ages_5_to_17 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailStreet = 'PO Box 1040' AND T1.LowGrade = '5' AND T1.HighGrade = '17'
SELECT `Low Grade` FROM schools WHERE EDOPSCODE = 'SPECON' AND NCESDIST = '613360';
SELECT T2.EducationalOptionType FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Breakfast Provision 2` = 1 AND T1.CountyCode = 37
SELECT City FROM schools WHERE EILCode = 'HS' AND LowGrade = '9' AND HighGrade = '12' AND County = 'Merced'
SELECT DISTINCT T2.sname, (SELECT Free_Meal_Count_Ages_5_17 FROM frpm WHERE T1.CDSCode = CDSCode) / (SELECT Enrollment_Ages_5_17 FROM frpm WHERE T1.CDSCode = CDSCode) * 100 AS percentage_eligible_FRPM FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Low_Grade = 'K' AND T2.High_Grade = '9' AND T1.County = 'Los Angeles';
SELECT TYPE FROM frpm GROUP BY TYPE ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT T2.county) FROM schools AS T1 INNER JOIN schools AS T2 ON T1.district = T2.district WHERE T2.county IN ('San Diego County', 'Santa Barbara County') AND T2.virtual = 0
SELECT School_Type, School FROM schools ORDER BY Latitude DESC LIMIT 1
SELECT cname FROM schools WHERE state = 'CA' ORDER BY latitude LIMIT 1
SELECT "High Grade" FROM frpm WHERE Longitude = ( SELECT MAX(Longitude) FROM frpm )
SELECT COUNT(DISTINCT T2.City), SUM(CASE WHEN T1.GSserved = 'K-8' THEN 1 ELSE 0 END), SUM(CASE WHEN T1.GSserved = 'K-8' AND T1.Magnet = 1 THEN 1 ELSE 0 END) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.GSoffered = 'GSoffered' AND T1.GSserved = 'K-8' AND T1.Magnet = 1
SELECT AdmFName1, CNT(DISTINCT DOC) AS DistrictCount, DOC FROM schools GROUP BY AdmFName1 ORDER BY DistrictCount DESC LIMIT 2 UNION SELECT AdmFName2, CNT(DISTINCT DOC) AS DistrictCount, DOC FROM schools GROUP BY AdmFName2 ORDER BY DistrictCount DESC LIMIT 2
SELECT T2.`District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`AdmFName1` = 'Alusine'
SELECT T1.AdmLName1, T1.District, T1.County, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.CharterNum = 40
SELECT T3.AdmEmail1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T1.SOC = '62' AND T2.`Open Date` >= '2009-01-01' AND T2.`Close Date` <= '2010-12-31' AND T2.`District Type` = 'County Office of Education (COE)' AND T2.`School Type` IN ('Unified school', 'Intermediate/Middle School', 'Elementary school', 'High school', 'Middle school', 'Ungraded Prep Program') AND T2.County = 'San Bernardino County' AND T2.`District Name` = 'District of San Bernardino City Unified'
SELECT AdmEmail1 FROM schools WHERE NCESSchool = ( SELECT NCESSchool FROM satscores WHERE AvgScrRead >= 1500 AND NumTstTakr = ( SELECT MAX(NumTstTakr) FROM satscores ) )
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN card AS T2 ON T1.account_id = T2.disp_id INNER JOIN disp AS T3 ON T2.disp_id = T3.disp_id INNER JOIN district AS T4 ON T4.district_id = T3.district_id WHERE T4.A3 = 'Pohrebí' AND T2.type = 'POPLATEK PO OBRATU'
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' AND T1.district_id IN ( SELECT T3.district_id FROM loan AS T3 INNER JOIN account AS T4 ON T3.account_id = T4.account_id WHERE T3.status = 'A' )
SELECT AVG(T1.A12), AVG(T1.A13) FROM district AS T1
SELECT COUNT(*) FROM ( SELECT District_id FROM client WHERE Gender = 'F' GROUP BY District_id HAVING AVG(A11) > 6000 AND AVG(A11) < 10000 )
SELECT COUNT(T1.gender) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A3 = 'North Bohemia' AND T2.A11 > 8000
SELECT T1.account_id FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN ( SELECT T4.district_id, T4.gender, AVG(T3.amount) AS avg_salary, ROW_NUMBER() OVER ( PARTITION BY T4.district_id, T4.gender ORDER BY T4.birth_date ASC ) AS r FROM account AS T3 INNER JOIN client AS T4 ON T3.district_id = T4.district_id GROUP BY T4.district_id, T4.gender ) AS T5 ON T1.district_id = T5.district_id AND T5.gender = T2.gender AND T5.avg_salary = ( SELECT AVG(T6.amount) FROM account AS T6 INNER JOIN client AS T7 ON T6.district_id = T7.district_id WHERE T7.gender = 'F' AND T6.district_id = T7.district_id ) WHERE T2.gender = 'F' ORDER BY T2.birth_date ASC LIMIT 1;
SELECT T1.account_id FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date = ( SELECT MIN(birth_date) FROM client ) ORDER BY T2.birth_date ASC LIMIT 1
SELECT count(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T3.account_id = T2.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT T4.gender FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T3.client_id = T1.client_id INNER JOIN card AS T4 ON T1.disp_id = T4.disp_id WHERE T4.type = 'Disponent' AND T2.frequency = 'POPLATEK PO OBRATU';
SELECT T4.account_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id INNER JOIN card AS T4 ON T3.disp_id = T4.disp_id WHERE T2.date LIKE '1997%' AND T4.type = 'POPLATEK TYDNE' GROUP BY T4.account_id ORDER BY MIN(T1.amount)
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 12 AND strftime('%Y', T1.date) = '1993' ORDER BY T2.amount DESC LIMIT 1
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.district_id INNER JOIN client AS T3 ON T3.district_id = T2.district_id WHERE T3.birth_date < '1950-01-01' AND T2.A2 LIKE '%Slokolov%' AND T3.gender = 'F'
SELECT T1.account_id FROM account AS T1 INNER JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T1.date LIKE '1995-%' ORDER BY T2.date ASC LIMIT 1
SELECT t1.account_id FROM account AS t1 INNER JOIN disp AS t2 ON t1.account_id = t2.account_id WHERE t1.frequency = 'POPLATEK MESICNE' AND t1.date < '1997-01-01' INTERSECT SELECT t1.account_id FROM account AS t1 INNER JOIN loan AS t2 ON t1.account_id = t2.account_id WHERE t2.amount > 3000
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.issued = '1994-03-03'
SELECT T1.date FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.`date` = '1998-10-14'
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25'
SELECT MAX(amount) FROM trans WHERE date LIKE '1996-10-21%'
SELECT gender FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN ( SELECT account_id FROM account WHERE date = (SELECT date FROM account WHERE date <= ( SELECT date FROM account ORDER BY date DESC LIMIT 1 ) ) ) ) GROUP BY gender ORDER BY count(*) DESC LIMIT 1
SELECT MIN(t1.amount) FROM `order` AS t1 INNER JOIN account AS t2 ON t1.account_id = t2.account_id INNER JOIN client AS t3 ON t2.district_id = t3.district_id ORDER BY t1.amount DESC LIMIT 1
SELECT COUNT(T3.client_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T1.A2 = 'Jesenik' AND T4.gender = 'F'
SELECT T2.disp_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN `order` AS T3 ON T3.account_id = T2.account_id INNER JOIN trans AS T4 ON T4.account_id = T2.account_id WHERE T4.type = 'VKLAD' AND T4.operation = 'PREVOD Z UCTU' AND T4.date = '1998-09-02' AND T4.amount = 5100
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Litomerice' AND STRFTIME('%Y', T1.date) = '1996'
SELECT T1.district_id FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date = '1976-01-29' AND T2.gender = 'F'
SELECT T2.birth_date FROM loan AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.amount = 98832 AND T1.date LIKE '1996%'
SELECT T2.account_id FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 = 'Prague' ORDER BY T2.account_id ASC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T2.gender = 'M' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.gender) FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.date BETWEEN '1995-04-01' AND '1995-06-30' AND T2.gender = 'M'
SELECT (julianday(SUBSTR(T3.date, 1, 10)) - julianday(T1.date)) * 100 / julianday(T2.date) AS 'rate' FROM account AS T1 JOIN account AS T2 ON T2.account_id = T1.account_id JOIN loan AS T3 ON T3.account_id = T2.account_id WHERE T3.date = '1993-03-22' AND T2.date = '1998-12-27'
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) FROM loan
SELECT (COUNT(*) - SUM(CASE WHEN status = 'C' THEN 0 ELSE 1 END)) * 100.0 / COUNT(*) FROM loan WHERE amount < 100000
SELECT T3.account_id, T4.A2, T4.A3 FROM account AS T1 INNER JOIN card AS T2 ON T2.disp_id = T1.disp_id INNER JOIN disp AS T3 ON T3.disp_id = T2.disp_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE strftime('%Y', T1.date) = '1993' AND T2.issued > T1.date
SELECT T1.account_id, T1.frequency, COUNT(T2.date) FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK MESICNE' AND T2.date BETWEEN '1995-01-01' AND '2000-12-31' AND T1.district_id IN (SELECT district_id FROM district WHERE A3 = 'east Bohemia') GROUP BY T1.account_id;
SELECT T2.account_id, T2.date FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Prachatice'
SELECT T1.A2, T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.loan_id = '4990'
SELECT T1.account_id, T2.A2, T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.account_id WHERE T1.amount > 300000
SELECT T1.loan_id, T2.A3, T2.A11 FROM loan AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.account_id WHERE T1.duration = 60
SELECT T3.A3, T3.A12 * 100 - T2.A12 * 100 FROM loan AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.status = 'D'
SELECT CAST(COUNT(CASE WHEN T1.district_id = (SELECT district_id FROM district WHERE A2 = 'Decin') THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date LIKE '1993%'
SELECT T2.account_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'POPLATEK MESICNE'
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.A2 ORDER BY count(T2.district_id) DESC LIMIT 10
SELECT T2.A2, T5.district_id FROM trans AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.account_id INNER JOIN client AS T3 ON T3.client_id = T2.district_id INNER JOIN account AS T4 ON T4.account_id = T1.account_id INNER JOIN loan AS T5 ON T5.account_id = T4.account_id WHERE T1.k_symbol = 'VYDAJ' AND T1.date LIKE '1996-01%' ORDER BY T4.amount DESC LIMIT 10
SELECT COUNT(T2.account_id) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id LEFT JOIN disp AS T3 ON T2.client_id = T3.client_id LEFT JOIN card AS T4 ON T3.disp_id = T4.disp_id WHERE T1.A3 = 'Jihocesky kraj' AND T4.card_id IS NULL
SELECT T3.A3 FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.status = 'D' OR T2.status = 'C' GROUP BY T3.A3 ORDER BY count(*) DESC LIMIT 1
SELECT AVG(amount) FROM loan WHERE client_id IN (SELECT client_id FROM client WHERE gender = 'M')
SELECT T2.A2, T2.A3 FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.date) = '1996' GROUP BY T2.district_id ORDER BY AVG(T2.A13) DESC LIMIT 1
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date LIKE '1996%' AND T2.A16 = ( SELECT MAX(A16) FROM district )
SELECT COUNT(T2.account_id) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN trans AS T4 ON T3.account_id = T4.account_id WHERE T1.type = 'classic' AND T4.operation = 'VYBER KARTOU' AND T3.frequency = 'POPLATEK MESICNE' AND T4.balance < 0
SELECT COUNT(*) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount >= 250000 AND T2.frequency = 'POPLATEK MESICNE' AND T1.status = 'A' AND T1.date BETWEEN '1995-01-01' AND '1997-12-31';
SELECT COUNT(*) FROM loan WHERE status IN ('C', 'D') AND district_id = 1
SELECT count(*) FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM loan WHERE date LIKE '1995-%' GROUP BY account_id ORDER BY COUNT(*) DESC LIMIT 2 OFFSET 1)) AND gender = 'M'
SELECT COUNT(T3.type) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold' AND T2.type = 'disponent'
SELECT COUNT(account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Pisek'
SELECT DISTINCT t1.district_id FROM account AS t1 INNER JOIN trans AS t2 ON t1.account_id = t2.account_id WHERE t1.date LIKE '1997%' AND t2.amount > 10000
SELECT t2.account_id FROM order AS t1 INNER JOIN account AS t2 ON t1.account_id = t2.account_id INNER JOIN district AS t3 ON t2.district_id = t3.district_id WHERE t3.A3 = 'Pisek' AND t1.k_symbol = 'SIPO'
SELECT T1.account_id FROM card AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold' AND T2.type = 'junior'
SELECT AVG(T1.amount) FROM card AS T1 INNER JOIN trans AS T2 ON T1.card_id = T2.card_id WHERE T2.date LIKE '2021%' AND T2.operation = 'VYBER KARTOU'
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN card AS T4 ON T2.disp_id = T4.disp_id INNER JOIN ( SELECT account_id, SUM(amount) AS S FROM trans WHERE type = 'VYBER KARTOU' AND strftime('%Y', date) = '1998' GROUP BY account_id HAVING COUNT(*) = ( SELECT COUNT(*) FROM ( SELECT account_id FROM trans WHERE type = 'VYBER KARTOU' AND strftime('%Y', date) = '1998' GROUP BY account_id ) ) ) AS T5 ON T3.account_id = T5.account_id
SELECT T2.gender, T2.birth_date FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' AND T1.frequency = 'POPLATEK MESICNE'
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 = 'South Bohemia'
SELECT T3.account_id FROM district AS T1 INNER JOIN account AS T3 ON T1.district_id = T3.district_id WHERE T1.A2 = 'Tabor' AND T3.type = 'OWNER'
SELECT T3.frequency FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN client AS T3 ON T3.district_id = T2.district_id WHERE T3.gender = 'M' AND T2.A11 BETWEEN 8000 AND 9000 EXCEPT SELECT T1.frequency FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id
SELECT COUNT(DISTINCT T2.account_id) FROM district AS T1 INNER JOIN trans AS T2 ON T2.account_id = T1.district_id WHERE T1.A3 = 'North Bohemia' AND T2.bank = 'AB'
SELECT T3.A2 FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T3.district_id = T2.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2
SELECT AVG(T1.A15) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.district_id IN (SELECT DISTINCT T2.district_id FROM account AS T2 WHERE strftime('%Y', T2.date) = '1997') AND T1.A15 > 4000
SELECT COUNT(T1.type) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Hl.m. Praha' AND T1.gender = 'M'
SELECT CAST(COUNT(CASE WHEN TYPE = 'gold' AND issued < '1998-01-01' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM card
SELECT T1.name FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T3.account_id = T2.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id ORDER BY T4.amount DESC LIMIT 1
SELECT t3.A15 FROM account AS t1 INNER JOIN district AS t3 ON t1.district_id = t3.district_id INNER JOIN `order` AS t2 ON t2.account_id = t1.account_id WHERE t1.account_id = 532;
SELECT T3.district_id FROM `order` AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.order_id = 33333
SELECT amount FROM trans WHERE client_id = 3356 AND operation = 'VYBER'
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.amount < 200000 AND T1.frequency = 'POPLATEK TYDNE'
SELECT T3.type FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.client_id = 13539
SELECT T1.A3 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541
SELECT district_id FROM account WHERE status = 'A' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.name FROM client AS T1 INNER JOIN `order` AS T2 ON T1.client_id = T2.client_id WHERE T2.order_id = 32423
SELECT t2.type, t2.operation, t2.amount, t2.balance, t2.k_symbol FROM client AS t1 INNER JOIN disp AS t3 ON t1.client_id = t3.client_id INNER JOIN account AS t4 ON t3.account_id = t4.account_id INNER JOIN district AS t5 ON t4.district_id = t5.district_id INNER JOIN trans AS t2 ON t4.account_id = t2.account_id WHERE t5.district_id = 5
SELECT COUNT(district_id) FROM client WHERE district_id = 15
SELECT T1.client_id FROM client AS T1 INNER JOIN card AS T2 ON T1.client_id = T2.client_id WHERE T2.issued > '1996-01-01' AND T2.type = 'junior'
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.district_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.district_id IN (SELECT T1.district_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A11 > 10000)
SELECT      CASE          WHEN SUM(CASE                      WHEN strftime('%Y', date) = '1996' THEN amount                      ELSE 0                  END) = 0 THEN 0          ELSE (             SUM(CASE                      WHEN strftime('%Y', date) = '1997' THEN amount                      ELSE 0                  END) - SUM(CASE                               WHEN strftime('%Y', date) = '1996' THEN amount                               ELSE 0                           END)             ) / SUM(CASE                          WHEN strftime('%Y', date) = '1996' THEN amount                          ELSE 0                      END) * 100     END AS growth_rate  FROM      account  JOIN      loan ON account.account_id = loan.account_id  WHERE      account.account_id IN (         SELECT              account_id          FROM              disp          JOIN              client ON disp.client_id = client.client_id          WHERE              client.gender = 'M'     )
SELECT COUNT(*) FROM trans WHERE type = 'VYBER KARTOU' AND date > '1995-12-31'
SELECT SUM(T1.A16) - SUM(T2.A16) FROM district AS T1 INNER JOIN account AS T3 ON T1.district_id = T3.district_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T1.A3 = 'East' AND T1.A4 = '1996' INNER JOIN district AS T5 ON T5.A3 = 'North' AND T5.A4 = '1996' INNER JOIN account AS T6 ON T5.district_id = T6.district_id INNER JOIN loan AS T7 ON T6.account_id = T7.account_id
SELECT SUM(CASE WHEN T2.type = 'OWNER' THEN 1 ELSE 0 END) ,  SUM(CASE WHEN T2.type = 'DISPONENT' THEN 1 ELSE 0 END) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id  =  T2.account_id WHERE T1.account_id  BETWEEN 1 AND 10
SELECT COUNT(*) , SUM(t1.amount) FROM order AS t1 INNER JOIN trans AS t2 ON t1.account_id = t2.account_id WHERE t1.account_to = 3 AND t1.bank = 'AB' AND t2.k_symbol = 'UVER'
SELECT T2.birth_date FROM account AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.account_id = 130
SELECT COUNT(T3.client_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN `order` AS T4 ON T4.loan_id = T1.loan_id WHERE T3.type = 'OWNER' AND T4.k_symbol = 'PO PRIJEMU'
SELECT SUM(amount) AS total_debt, status FROM loan WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 992) GROUP BY status
SELECT T1.amount FROM trans AS T1 INNER JOIN account AS T2 ON T2.account_id = T1.account_id WHERE T2.account_id = 4 AND T1.trans_id = 851
SELECT T2.type FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.client_id = 9
SELECT SUM(amount) FROM trans WHERE client_id = 617 AND date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT T2.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.birth_date >= '1983-01-01' AND T1.birth_date <= '1987-12-31' AND T3.A2 = 'Hlavni mesto Praha'
SELECT T2.client_id FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'F' GROUP BY T2.client_id ORDER BY SUM(T1.amount) DESC LIMIT 3
SELECT COUNT(T2.client_id) FROM `order` AS T1 INNER JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T2.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T1.k_symbol = 'SIPO' AND T2.gender = 'M'
SELECT COUNT(*) FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'beroun' AND strftime('%Y', date) > '1996'
SELECT COUNT(T1.gender) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.gender = 'F' AND T3.type = 'junior'
SELECT CAST(COUNT(CASE WHEN T1.gender = 'F' THEN T1.client_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 = 'Prague';
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T1.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE'
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'USER'
SELECT T2.account_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 24 AND T2.date < '1998-01-01' ORDER BY T1.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'F' ORDER BY T3.birth_date LIMIT 1
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE 'E' AND T1.birth_date BETWEEN '1920-01-01' AND '1929-12-31'
SELECT COUNT(T2.account_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration = 24 AND T2.frequency = 'POPLATEK TYDNE'
SELECT avg(l.amount) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status = 'C' AND a.frequency = 'POPLATEK PO OBRATU'
SELECT t3.client_id ,  t1.district_id FROM account AS t1 INNER JOIN disp AS t2 ON t1.account_id = t2.account_id INNER JOIN client AS t3 ON t3.client_id = t2.client_id WHERE t2.type = 'OWNER'
SELECT client_id, birth_date FROM client WHERE client_id IN ( SELECT client_id FROM disp WHERE type = 'OWNER' ) AND client_id IN ( SELECT client_id FROM card WHERE type = 'gold' ) AND client_id IN ( SELECT client_id FROM loan WHERE status = 'A' )
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl'
SELECT AVG(T1.element) FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.element = 'o'
SELECT COUNT(atom_id) FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-') GROUP BY molecule_id HAVING COUNT(atom_id) = 2
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '-'
SELECT t1.atom_id FROM atom AS t1 JOIN connected AS t2 ON t1.atom_id = t2.atom_id JOIN bond AS t3 ON t3.bond_id = t2.bond_id WHERE t3.bond_type = '#' INTERSECT SELECT t1.atom_id FROM atom AS t1 JOIN connected AS t2 ON t1.atom_id = t2.atom_id JOIN bond AS t3 ON t3.bond_id = t2.bond_id JOIN molecule AS t4 ON t4.molecule_id = t1.molecule_id WHERE t4.label = '+'
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='
SELECT count(*) FROM bond WHERE bond_type = '#'
SELECT count(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT DISTINCT molecule_id FROM atom WHERE element = 'si';
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR004_8_9'
SELECT T2.element FROM bond AS T1  JOIN connected AS T3 ON T1.bond_id = T3.bond_id  JOIN atom AS T4 ON T4.atom_id = T3.atom_id  WHERE T1.bond_type = '=' AND T4.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');
SELECT COUNT(T1.label), T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'h' AND T1.label = '+' OR T1.label = '-' GROUP BY T1.label ORDER BY COUNT(T1.label) DESC LIMIT 1
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'te'
SELECT T2.atom_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-' GROUP BY T2.atom_id
SELECT DISTINCT a1.atom_id, a2.atom_id  FROM atom a1  JOIN connected c1 ON a1.atom_id = c1.atom_id  JOIN atom a2 ON a2.atom_id = c1.atom_id2  JOIN molecule m ON a1.molecule_id = m.molecule_id  WHERE m.label = '-'
SELECT element FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element != 'Sn' GROUP BY T1.label
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element IN ('i', 's') AND T3.bond_type = '-'
SELECT t1.atom_id, t1.atom_id2 FROM connected AS t1 JOIN bond AS t2 ON t1.bond_id = t2.bond_id WHERE t2.bond_type = '#'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.label = '+' AND T2.atom_id2 IN ( SELECT atom_id FROM atom WHERE molecule_id = 'TR181' )
SELECT CAST(SUM(CASE WHEN T2.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.label = '+'
SELECT CAST(SUM(CASE WHEN bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY element ASC LIMIT 3
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6' AND molecule_id = 'TR001'
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) FROM molecule
SELECT atom_id FROM connected WHERE bond_id = 'TR_000_2_5'
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' GROUP BY T1.label ORDER BY COUNT(T2.bond_id) DESC LIMIT 5
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id INNER JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR206';
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT a.element, m.label FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id = 'TR060';
SELECT bond_type, COUNT(bond_type) FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1  -- The SQL query above retrieves the bond type and the count of occurrences for each type in molecule 'TR018'. It then sorts the results in descending order based on the count and retrieves the top result, which represents the bond type with the highest occurrence.
SELECT DISTINCT T2.label FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T2.label != '-' AND T3.bond_type = '-' GROUP BY T2.label ORDER BY COUNT(T1.atom_id) ASC LIMIT 3
SELECT T2.bond_id FROM molecule AS T1 INNER JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id INNER JOIN bond AS T2 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR006' ORDER BY T2.bond_id LIMIT 2
SELECT COUNT(*) FROM bond WHERE molecule_id LIKE 'TR009_%' AND (atom_id LIKE 'TR009_12' OR atom_id2 LIKE 'TR009_12')
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) AND element = 'br'
SELECT b.bond_type, a.atom_id, a2.atom_id FROM bond b, atom a, atom a2, connected c WHERE b.bond_id = 'TR001_6_9' AND b.molecule_id = c.bond_id AND a.atom_id = c.atom_id AND a2.atom_id = c.atom_id2
SELECT T2.label FROM connected AS T1  INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T1.atom_id = 'TR001_10'
SELECT count(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.atom_id LIKE 'TR%_19'
SELECT t1.element FROM atom AS t1 JOIN molecule AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.label = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT DISTINCT m.molecule_id, m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'
SELECT T1.bond_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T3.element IN ('p', 'n') GROUP BY T1.bond_id HAVING COUNT(DISTINCT T3.element) = 2
SELECT molecule.molecule_id FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '=' GROUP BY molecule.molecule_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T3.count) FROM molecule AS T1 INNER JOIN ( SELECT molecule_id, COUNT(atom_id) AS count FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i' GROUP BY molecule_id ) AS T3 ON T1.molecule_id = T3.molecule_id
SELECT T1.bond_id, T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T3.atom_id LIKE 'TR045_%'
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected)
SELECT T3.atom_id, T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T1.molecule_id = 'TR447' AND T2.bond_type = '#'
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'
SELECT T1.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.label = '+' AND T1.bond_type = '=' GROUP BY T1.bond_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T3.molecule_id = T2.molecule_id WHERE T3.label = '+' GROUP BY T1.element ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.atom_id FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'pb'
SELECT T2.element FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' ORDER BY T2.element
SELECT CAST(COUNT(T1.bond_id) AS REAL) / COUNT(T2.atom_id) FROM bond AS T1 INNER JOIN connected AS T3 ON T1.bond_id = T3.bond_id INNER JOIN atom AS T2 ON T3.atom_id = T2.atom_id GROUP BY T3.atom_id2 ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(COUNT(T1.bond_id) AS REAL) / COUNT(T2.molecule_id) AS proportion FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '+';
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'Sn')
SELECT count(DISTINCT atom.element) FROM connected AS connected_1 INNER JOIN bond AS bond_1 ON connected_1.bond_id = bond_1.bond_id INNER JOIN molecule AS molecule_1 ON connected_1.molecule_id = molecule_1.molecule_id INNER JOIN atom ON connected_1.atom_id = atom.atom_id WHERE bond_1.bond_type = '-'
SELECT COUNT(T2.atom_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '#' AND T3.element IN ('p', 'br')
SELECT T1.bond_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id HAVING COUNT(*) = 1 AND T1.label = '-'
SELECT COUNT(T1.atom_id) * 100.0 / COUNT(DISTINCT T1.atom_id) AS percent FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T3.element = 'cl' AND T2.bond_type = '-'
SELECT t1.label FROM molecule AS t1 INNER JOIN connected AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.atom_id IN ('TR000_1', 'TR000_2', 'TR000_3', 'TR000_4', 'TR001_10_11') AND t2.bond_id IN ('TR000_1_2', 'TR000_2_3', 'TR000_2_4', 'TR000_2_5', 'TR001_10_11') AND t1.label = '+'
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'
SELECT DISTINCT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id IN ( SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR000' AND 'TR050' )
SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'i'))
SELECT CASE WHEN MAX(T2.label) = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca' GROUP BY T2.label
SELECT COUNT(DISTINCT t1.atom_id) FROM ATOM AS t1 JOIN CONNECTED AS t2 ON t1.atom_id = t2.atom_id WHERE t1.element = 'cl' AND t2.bond_id = 'TR001_1_8' INTERSECT SELECT COUNT(DISTINCT t1.atom_id) FROM ATOM AS t1 JOIN CONNECTED AS t2 ON t1.atom_id = t2.atom_id WHERE t1.element = 'c' AND t2.bond_id = 'TR001_1_8'
SELECT DISTINCT a1.molecule_id, a2.molecule_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#' AND a1.element = 'c' AND a2.element = 'c' AND a1.molecule_id = a2.molecule_id AND a1.molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' )
SELECT CAST(SUM(T1.atom_id IN (SELECT T2.atom_id FROM `atom` AS T2 WHERE T2.molecule_id = T1.molecule_id AND T2.element = 'cl')) AS REAL) / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1;
SELECT T3.element FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.molecule_id = 'TR001';
SELECT molecule_id FROM bond WHERE bond_type = '='
SELECT T1.atom_id ,  T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'
SELECT DISTINCT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR005_16_26' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.label = '+'
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE SUBSTR(T2.atom_id, 7, 1) = 4 AND T1.bond_id = ( SELECT bond_id FROM connected AS T3 INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T3.atom_id = T2.atom_id AND T4.bond_type = '-' ) AND T1.atom_id2 = ( SELECT atom_id FROM connected AS T3 WHERE T3.atom_id = T2.atom_id AND T3.bond_id = ( SELECT bond_id FROM connected AS T4 INNER JOIN bond AS T5 ON T4.bond_id = T5.bond_id WHERE T4.atom_id = T2.atom_id AND T5.bond_type = '-' ) ) AND T2.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element) , T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'
SELECT 1 FROM molecule WHERE label = '+' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'ca')
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE element = 'te'
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_10_11'
SELECT CAST(COUNT(CASE WHEN T1.bond_type = '#' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id
SELECT CAST(SUM(bond.bond_type = '=') AS REAL) * 100 / COUNT(bond.bond_id) FROM molecule INNER JOIN connected ON molecule.molecule_id = connected.molecule_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE molecule.molecule_id = 'TR047'
SELECT T3.label FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.atom_id = 'TR001_1'
SELECT molecule_id FROM molecule WHERE label = '+' AND molecule_id = 'TR151'
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR151' AND T2.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IN ('cl', 'c', 'h')
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.molecule_id BETWEEN 'TR010' AND 'TR050'
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT DISTINCT T1.bond_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.bond_type = '=' AND T3.label = '+'
SELECT COUNT(*) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.label = '+' AND T3.element = 'h'
SELECT T1.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.atom_id = 'TR000_1' AND T1.bond_id = 'TR000_1_2'
SELECT T2.atom_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'c'
SELECT CAST(SUM(CASE WHEN molecule.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule.molecule_id) FROM molecule AS molecule INNER JOIN connected AS connected ON molecule.molecule_id = connected.molecule_id INNER JOIN atom AS atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'h'
SELECT label FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id LIKE 'TR007_4_19'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_id = 'TR001_2_4'
SELECT COUNT(b.bond_id) FROM bond b INNER JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '=' AND c.atom_id IN (SELECT atom_id FROM connected WHERE molecule_id = 'TR006')
SELECT DISTINCT T1.molecule_id, T2.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '=') GROUP BY bond_id HAVING COUNT(*) > 3) AND T1.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '=') GROUP BY bond_id HAVING COUNT(*) > 3)
SELECT T2.molecule_id, T3.atom_id, T3.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN connected AS T3 ON T3.bond_id = T1.bond_id WHERE T1.bond_type = '-'
SELECT T.label FROM molecule AS T JOIN atom AS R ON T.molecule_id = R.molecule_id WHERE T.molecule_id IN ( SELECT T.molecule_id FROM molecule AS T JOIN bond AS S ON T.molecule_id = S.molecule_id WHERE S.bond_type = '#' GROUP BY T.molecule_id HAVING COUNT(*) = 3 ) AND R.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT T3.element FROM bond AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T1.bond_id = 'TR000_2_3'
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'cl'
SELECT T3.atom_id, COUNT(DISTINCT T1.bond_type) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T4.label = 'TR346'
SELECT COUNT(T2.molecule_id) FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.bond_type = '=' AND T3.label = '+'
SELECT COUNT(T1.label) FROM molecule AS T1 LEFT JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element IS NULL AND T1.molecule_id NOT IN (SELECT T1.molecule_id FROM molecule AS T1 LEFT JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=')
SELECT t3.label FROM bond AS t1 INNER JOIN connected AS t2 ON t1.bond_id = t2.bond_id INNER JOIN molecule AS t3 ON t1.molecule_id = t3.molecule_id WHERE t2.bond_id = 'TR001_2_4'
SELECT COUNT(atom_id) FROM atom WHERE molecule_id = 'TR005'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT molecule.molecule_id FROM connected JOIN atom ON connected.atom_id = atom.atom_id JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE atom.element = 'cl' AND molecule.label = '+'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' EXCEPT SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' INNER JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.bond_type = '='
SELECT CAST(COUNT(CASE WHEN molecule.label = '+' AND atom.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(molecule.molecule_id) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT COUNT(T2.element) FROM bond AS T1 INNER JOIN atom AS T2 ON T2.molecule_id = T1.molecule_id WHERE T1.bond_id = 'TR001_3_4'
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T2.bond_id = T1.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2'
SELECT T2.molecule_id FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id IN ('TR000_2', 'TR000_4') GROUP BY T2.molecule_id HAVING COUNT(*) = 2
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.atom_id  =  'TR000_1'
SELECT CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR000';
SELECT CAST(SUM(bond_type = '-') AS REAL) * 100 / COUNT(bond_id) FROM bond
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'n'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.bond_id = T3.bond_id INNER JOIN atom AS T4 ON T3.atom_id = T4.atom_id WHERE T4.element = 's' AND T2.bond_type = '=' GROUP BY T1.label
SELECT label FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM ( SELECT molecule_id FROM atom WHERE element <> 'c' GROUP BY molecule_id HAVING COUNT(*) > 5 ) )
SELECT DISTINCT T2.element FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id  JOIN bond AS T4 ON T1.bond_id = T4.bond_id  WHERE T3.label = 'TR024' AND T4.bond_type = '='
SELECT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element IN ('cl', 'c', 'h') AND T2.label = '+' GROUP BY T2.molecule_id ORDER BY COUNT(T2.molecule_id) DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T2.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T1.bond_id = T4.bond_id WHERE T3.element = 'h' AND T4.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010'
SELECT COUNT(*) FROM atom WHERE element = 'c' AND molecule_id = 'TR008'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(*) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id  =  T2.molecule_id JOIN atom AS T3 ON T2.atom_id  =  T3.atom_id JOIN atom AS T4 ON T2.atom_id2  =  T4.atom_id JOIN bond AS T5 ON T2.bond_id  =  T5.bond_id WHERE T3.element  =  'o' AND T4.element  =  'o' AND T5.bond_type  =  '='
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.bond_type = '#'
SELECT t3.element, t4.bond_type FROM molecule AS t1  JOIN connected AS t2 ON t1.molecule_id = t2.molecule_id  JOIN atom AS t3 ON t2.atom_id = t3.atom_id  JOIN bond AS t4 ON t2.bond_id = t4.bond_id  WHERE t1.molecule_id = 'TR016'
SELECT atom1.atom_id FROM connected AS conn1 JOIN atom AS atom1 ON conn1.atom_id = atom1.atom_id JOIN connected AS conn2 ON conn1.atom_id = conn2.atom_id2 AND conn1.bond_id = conn2.bond_id JOIN atom AS atom2 ON conn2.atom_id = atom2.atom_id JOIN bond ON bond.bond_id = conn1.bond_id WHERE atom1.element = 'c' AND atom2.element = 'c' AND bond.bond_type = '=' AND EXISTS (SELECT 1 FROM connected AS conn3 JOIN atom AS atom3 ON conn3.atom_id = atom3.atom_id WHERE conn3.atom_id = conn1.atom_id AND conn3.bond_id = conn1.bond_id AND atom3.element = 'c')
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND element = 'o'
SELECT count(*) FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL
SELECT COUNT(id) FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NOT NULL AND cardKingdomFoilId != '';
SELECT faceName FROM cards ORDER BY faceConvertedManaCost DESC
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = 2015
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T2.uuid = T1.uuid INNER JOIN sets AS T3 ON T3.code = T1.setCode WHERE T2.format = 'gladiator' AND T1.rarity = 'mythic' AND T2.status = 'Banned'
SELECT format FROM legalities WHERE uuid IN ( SELECT uuid FROM cards WHERE types LIKE '%Artifact%' AND side IS NULL ) AND format = 'vintage'
SELECT T2.id, T2.artist FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE (T1.power = '*' OR T1.power IS NULL) AND T2.format = 'commander'
SELECT name, ruling, hasContentWarning FROM cards WHERE artist = 'Stephen Daniel';
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Sublime Epiphany' AND T2.number LIKE '74%'
SELECT name, artist FROM cards WHERE uuid IN ( SELECT T1.uuid FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T2.uuid ORDER BY COUNT(T2.uuid) DESC LIMIT 1 ) AND isPromo = 1
SELECT DISTINCT T3.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T1.setCode = T3.setCode WHERE T1.name = 'Annul' AND T1.number = '29'
SELECT name FROM cards WHERE json_extract(foreign_data, '$.language') = 'Japanese'
SELECT CAST(COUNT(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid
SELECT name, totalSetSize FROM sets WHERE language = 'Italian'
SELECT COUNT(T1.name) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(id) FROM cards WHERE power = '*';
SELECT T2.promoTypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Duress';
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originaltype FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Angel of Mercy';
SELECT COUNT(*) FROM cards WHERE isTextless = 0 AND legality LIKE '%restricted%';
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T2.uuid = T1.uuid WHERE T1.name = 'Ancestor's Chosen'
SELECT COUNT(T2.status) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.isStarter = 1 AND T2.status = 'restricted'
SELECT status FROM legalities WHERE uuid IN ( SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle' )
SELECT type FROM cards WHERE name = 'Benalish Knight'
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight'
SELECT artist FROM cards WHERE language = 'Phyrexian'
SELECT CAST(SUM(IIF(borderColor = 'borderless', 1, 0)) AS REAL) * 100 / COUNT(*) FROM cards;
SELECT COUNT(T1.name) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.isReprint = 1
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND language = 'Russian'
SELECT CAST(SUM(CASE WHEN language = 'French' AND isStorySpotlight = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards
SELECT COUNT(t1.id) FROM cards AS t1 INNER JOIN foreign_data AS t2 ON t1.uuid = t2.uuid WHERE t2.toughness = '99';
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT Layout FROM cards WHERE Keywords LIKE '%Flying%'
SELECT COUNT(CASE WHEN substr(subtypes, ' ,Angel ',', ') IS NULL THEN 1 ELSE NULL END) FROM cards WHERE originaltype = 'Summon - Angel';
SELECT T2.id FROM cards AS T1 INNER JOIN cards AS T2 ON T2.cardKingdomId = T1.uuid WHERE T2.cardKingdomFoilId IS NOT NULL
SELECT id FROM cards WHERE duelDeck = 'a';
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT artist FROM cards WHERE language = 'Chinese Simplified'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese' AND T2.availability = 'paper'
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'white' AND T2.status = 'Banned'
SELECT T1.uuid, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy'
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Beacon of Immortality'
SELECT count(*) ,  T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.frameVersion = 'future' GROUP BY T1.status
SELECT T2.name, T2.colors FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.setCode = 'OGW'
SELECT T3.translation, T1.language FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.convertedManaCost = 5 AND T2.setCode = '10E'
SELECT T2.name, T2.rulings FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT colors FROM cards WHERE id BETWEEN 1 AND 20; SELECT format FROM cards WHERE id BETWEEN 1 AND 20;
SELECT foreign_data.language FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.colors = 'B' AND cards.type = 'Artifact'
SELECT name FROM cards WHERE rarity = 'uncommon' ORDER BY date ASC LIMIT 3
SELECT COUNT(CASE WHEN T1.artist = 'John Avon' THEN T1.id ELSE NULL END) FROM cards T1 INNER JOIN cards T2 ON T1.cardKingdomFoilId = T2.id
SELECT COUNT(T2.uuid) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.borderColor = 'white' AND T2.cardKingdomFoilId = T2.cardKingdomId
SELECT COUNT(id) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1
SELECT COUNT(id) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1
SELECT T1.manaCost FROM cards AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.setCode WHERE T1.frameVersion = 2003 AND T1.borderColor = 'black' AND T1.availability LIKE '%paper%' AND T1.availability LIKE '%mtgo%' AND T2.translation = 'Tenth Edition' AND T1.layout = 'normal';
SELECT SUM(T2.convertedManaCost) FROM cards AS T1 INNER JOIN cards AS T2 ON T2.artist = T1.artist WHERE T1.artist = 'Rob Alexander'
SELECT T2.types FROM cards AS T1 INNER JOIN types AS T2 ON T2.uuid = T1.uuid WHERE T1.availability = 'arena'
SELECT T2.setCode FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Spanish'
SELECT CAST(SUM(CASE WHEN T1.hand = '+3' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN FOREIGN_DATA AS T2 ON T1.uuid = T2.uuid WHERE T2.frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT language FROM cards WHERE language = 'Spanish' UNION SELECT DIVIDE(SUM(language = 'Spanish'), COUNT(id)) * 100 AS percentage FROM cards
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.baseSetSize = 309
SELECT COUNT(*) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Portuguese (Brasil)' AND T2.block = 'Commander'
SELECT uuid FROM cards WHERE type LIKE '%Creature%' AND status LIKE '%legal%';
SELECT DISTINCT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T1.language = 'German' AND T2.subtypes IS NOT NULL AND T2.supertypes IS NOT NULL
SELECT COUNT(CASE WHEN T1.power IS NULL OR T1.power = '*' THEN 1 END) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid
SELECT COUNT(*) FROM foreign_data WHERE formatting = 'triggered mana ability' AND side IS NULL
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper' AND format = 'pauper'
SELECT artist FROM cards WHERE name = 'Aven Cloudchaser' AND text = 'Flying (This creature can''t be blocked except by creatures with flying or reach.\nWhen Aven Cloudchaser comes into play, destroy target enchantment.'
SELECT fd.name FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE fd.language = 'French' AND c.borderColor = 'black' AND c.type LIKE '%Creature%' AND c.layout = 'normal' AND c.artist = 'Matthew D. Wilson';
SELECT COUNT(*) FROM `cards` WHERE printings LIKE '%10/01/2009%' AND rarity = 'rare'
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setcode WHERE T1.baseSetSize = 180
SELECT CAST(SUM(CASE WHEN hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE TYPE = 'card' AND format = 'commander' AND status = 'legal';
SELECT CAST(SUM(IIF(T1.language = 'French' AND (T1.power IS NULL OR T1.power = '*'), 1, 0)) AS REAL) * 100 / COUNT(T1.power IS NULL OR T1.power = '*') FROM cards AS T1
SELECT CAST(SUM(CASE WHEN type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese';
SELECT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'modern' AND T1.borderColor = 'borderless' AND T1.edhrecRank > 12000
SELECT count(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT name FROM cards WHERE (power IS NULL OR power = '*') AND promoTypes = 'arenaleague' ORDER BY name LIMIT 3
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.multiverseId = 149934
SELECT T1.id FROM cards AS T1 INNER JOIN cards AS T2 ON T2.cardKingdomId = T1.cardKingdomId WHERE T1.cardKingdomFoilId IS NOT NULL AND T2.cardKingdomId IS NOT NULL GROUP BY T1.cardKingdomFoilId ORDER BY T1.cardKingdomFoilId LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT number FROM cards WHERE subtypes = 'Angel, Wizard' AND faces IS NULL
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.setCode = 'ARC' AND T2.mcmName = 'Archenemy'
SELECT T2.name ,  T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setcode = T2.code WHERE T2.id = 5
SELECT language, type FROM sets WHERE id = 206
SELECT code FROM sets WHERE block = 'Shadowmoor' AND name IN ( SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Italian' ) ORDER BY T1.name LIMIT 2
SELECT id FROM sets WHERE isForeignOnly = 1 AND isFoilOnly = 1 ORDER BY id
SELECT name FROM sets WHERE language = 'Russian' ORDER BY baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN LANGUAGE = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(isOnlineOnly) FROM sets WHERE isOnlineOnly = 1
SELECT count(*) FROM sets WHERE language = 'Japanese' AND mtgoCode IS NULL OR mtgoCode = ''
SELECT COUNT(*) ,  id FROM cards WHERE borderColor = 'black'
SELECT id FROM cards WHERE frameEffects = 'extendedart'
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'white' AND T1.isFullArt = 1
SELECT language FROM sets WHERE code = '174';
SELECT name FROM sets WHERE code = 'ALL'
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar';
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block = 'Masques' OR block = 'Mirage'
SELECT code FROM sets WHERE type = 'expansion'
SELECT foreign_data.flavorText, cards.type FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.watermark = 'boros'
SELECT DISTINCT T1.language, T1.flavorText, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'colorpie'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'
SELECT code FROM sets WHERE type = 'expansion commander'
SELECT DISTINCT T3.foreignName ,  T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T3.name LIKE '%abzan%'
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'azorius'
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Aaron Miller' AND T2.status = 'Legal' AND T1.cardKingdomId = T1.cardKingdomFoilId
SELECT count(*) FROM cards WHERE availability LIKE '%paper%' AND hand LIKE '+%'
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'
SELECT SUM(CASE WHEN power = '*' OR power IS NULL THEN 1 ELSE 0 END) FROM cards WHERE border_color = 'white'
SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.isPromo = 1 AND T2.side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT purchaseUrls FROM cards WHERE promotionalType = 'bundle';
SELECT COUNT(T1.artist) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.available LIKE '%arena,mtgo%' AND T1.borderColor = 'black'
SELECT T2.convertedManaCost FROM cards AS T1 INNER JOIN cards AS T2 ON T2.name = 'Shrine Keeper' WHERE T1.name = 'Serra Angel' AND T1.convertedManaCost > T2.convertedManaCost
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = '10th Edition' AND T2.language = 'Italian'
SELECT count(*) FROM set_translations AS T1 INNER JOIN cards AS T2 ON T1.setcode = T2.setcode WHERE T2.name = 'Angel of Mercy'
SELECT name FROM sets WHERE translation = 'Hauptset Zehnte Edition'
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor's Chosen' AND T2.language = 'Korean'
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'
SELECT baseSetSize FROM sets WHERE translation = 'Hauptset Zehnte Edition'
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Eighth Edition' AND T1.language = 'Chinese Simplified'
SELECT CASE WHEN T2.mtgoCode IS NULL THEN 'no' ELSE 'yes' END FROM cards AS T1 INNER JOIN sets AS T2 ON T2.code = T1.setCode WHERE T1.name = 'Angel of Mercy';
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor''s Chosen'
SELECT type FROM sets WHERE translation = ' Hauptset Zehnte Edition'
SELECT count(*) FROM sets WHERE block = 'Ice Age' AND language = 'Italian'
SELECT COUNT(T1.id) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Adarkar Valkyrie' AND T1.isForeignOnly = 1
SELECT COUNT(T1.code) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.code WHERE T2.language = 'Italian' AND T1.baseSetSize < 10
SELECT COUNT(*) FROM cards WHERE setName = 'Coldsnap' AND borderColor = 'black'
SELECT name FROM cards WHERE setCode = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1
SELECT T2.artist FROM sets AS T1 INNER JOIN cards AS T2 ON T2.setCode = T1.code WHERE T1.name = 'Coldsnap' INTERSECT SELECT T2.artist FROM sets AS T1 INNER JOIN cards AS T2 ON T2.setCode = T1.code WHERE T2.artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy')
SELECT * FROM cards WHERE number = 4 AND name = 'Coldsnap'
SELECT COUNT(T1.power) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);
SELECT T1.flavorText FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Italian' AND T2.name = 'Ancestor''s Chosen';
SELECT language FROM foreign_data WHERE uuid = ( SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL )
SELECT type FROM foreign_data WHERE language = 'German' AND name = 'Ancestor''s Chosen';
SELECT T1.text FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.setCode = 'CEL' AND T1.language = 'Italian'
SELECT name FROM foreign_data WHERE language = 'Italian' AND uuid IN (SELECT uuid FROM cards WHERE setCode = 'C02') ORDER BY convertedManaCost DESC LIMIT 1
SELECT date FROM rulings WHERE uuid = ( SELECT uuid FROM cards WHERE name = 'Reminisce' )
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap';
SELECT CAST(SUM(CASE WHEN T1.name = 'Coldsnap' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.cardKingdomId = T2.cardKingdomFoilId AND T2.cardKingdomId IS NOT NULL
SELECT code FROM sets WHERE releaseDate = '2017-07-14';
SELECT keyruneCode FROM sets WHERE code = 'PKHC';
SELECT mcmId FROM sets WHERE code = 'SS2';
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentcode FROM sets WHERE name = 'Commander 2014 Oversized';
SELECT T1.text FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Jim Pavelec'
SELECT releaseDate FROM sets WHERE card WHERE name = 'Evacuation';
SELECT baseSetSize FROM sets WHERE translation = 'Rinascita di Alara';
SELECT type FROM sets WHERE translation = 'Huitième édition'
SELECT t2.translation FROM sets AS t1 INNER JOIN set_translations AS t2 ON t1.code = t2.setCode WHERE t2.translation LIKE 'Tendo Ice Bridge' AND t2.language LIKE 'French';
SELECT COUNT(T2.name) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setcode WHERE T1.name = 'Salvat 2011' AND T2.name IS NOT NULL
SELECT t1.name FROM sets AS t1 INNER JOIN cards AS t2 ON t2.setCode = t1.code INNER JOIN foreign_data AS t3 ON t3.uuid = t2.uuid WHERE t3.language = 'Japanese' AND t2.name = 'Fellwar Stone'
SELECT name FROM cards WHERE setCode = 'JOUR' ORDER BY convertedManaCost DESC LIMIT 1
SELECT releaseDate FROM sets WHERE translation = 'Ola de frío'
SELECT type FROM sets WHERE name = 'Samite Pilgrim';
SELECT COUNT(*) FROM cards WHERE setName = 'World Championship Decks 2004' AND convertedManaCost = 3
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND name = 'Mirrodin';
SELECT 100 * SUM(T2.isNonFoilOnly = 1) / SUM(T2.language = 'Japanese') AS percentage FROM set_translations AS T1 INNER JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T1.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode INNER JOIN foreign_data AS T3 ON T2.uuid = T3.uuid WHERE T3.language = 'Portuguese (Brazil)'
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.type = 'Instant' AND T2.flavorText IS NOT NULL AND T2.text IS NOT NULL AND T1.side IS NULL ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT MAX(T3.frameEffects) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN cards AS T3 ON T3.uuid = T1.uuid WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL
SELECT COUNT(id) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT T3.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T2.uuid = T1.uuid INNER JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T2.format = 'duel' GROUP BY T3.name ORDER BY T1.convertedManaCost DESC LIMIT 10
SELECT MIN(originalReleaseDate), format FROM legalities WHERE rarity = 'mythic' GROUP BY format
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'French' AND T1.artist = 'Volkan Bağa';
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Enchantment' AND T1.name = 'Abundance' AND T2.status = 'Legal'
SELECT T1.name FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'banned' GROUP BY T1.format ORDER BY COUNT(*) DESC LIMIT 1
SELECT language FROM sets WHERE name = 'Battlebond'
SELECT T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T2.uuid = T1.uuid GROUP BY T2.format ORDER BY COUNT(T1.id) ASC LIMIT 1
SELECT status FROM cards WHERE frameVersion = '1997' AND artist = 'D. Alexander Gregory' AND hasContentWarning = 1 AND format = 'legacy'
SELECT c.name, l.format FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'banned'
SELECT AVG(T1.id) FROM sets AS T1 INNER JOIN ( SELECT T2.language FROM sets AS T1 INNER JOIN ( SELECT language, COUNT(language) AS frequency FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY language ) AS T2 ORDER BY T2.frequency DESC LIMIT 1 ) AS T3 ON T3.language = T1.language WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31'
SELECT T1.artist FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'black' AND T1.availability = 'arena' AND T2.format = 'arena'
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');
SELECT COUNT(availability) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT MAX(T1.date) ,  T2.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Kev Walker'
SELECT T3.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T2.name = 'Hour of Devastation'
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language <> 'Japanese' AND T2.language = 'Korean'
SELECT frameVersion FROM cards WHERE artist = 'Allen Williams' UNION SELECT t3.name FROM legalities AS t1 INNER JOIN cards AS t2 ON t1.uuid = t2.uuid INNER JOIN sets AS t3 ON t2.setCode = t3.code WHERE t1.format = 'modern' AND t1.status = 'banned' AND t2.artist = 'Allen Williams';
SELECT T1.Reputation, T1.DisplayName FROM users AS T1 INNER JOIN postHistory AS T2 ON T1.AccountId = T2.UserId INNER JOIN comments AS T3 ON T2.UserId = T3.UserId WHERE T1.DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY T1.Reputation DESC LIMIT 1
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014
SELECT COUNT(UserId) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'
SELECT DisplayName FROM users WHERE Views = ( SELECT max(Views) FROM users );
SELECT COUNT(t1.Id) FROM users AS t1 INNER JOIN votes AS t2 ON t1.Id = t2.UserId WHERE t1.Upvotes > 100 AND t2.Downvotes > 1;
SELECT COUNT(DISTINCT OwnerUserId) FROM posts WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie';
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts';
SELECT T2.Title FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' ORDER BY T2.ViewCount DESC LIMIT 1
SELECT T1.OwnerDisplayName FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId ORDER BY T2.FavoriteCount DESC LIMIT 1
SELECT SUM(T1.CommentCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT T3.AnswerCount FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN posts AS T3 ON T2.PostTypeId = 2 AND T2.AnswerCount = ( SELECT MAX(T4.AnswerCount) FROM posts AS T4 WHERE T4.PostTypeId = 2 AND T4.OwnerUserId = T1.Id ) WHERE T1.DisplayName = 'csgillespie'
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation';
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL
SELECT T5.DisplayName FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN posts AS T3 ON T1.RelatedPostId = T3.Id INNER JOIN users AS T4 ON T2.OwnerUserId = T4.Id INNER JOIN users AS T5 ON T3.OwnerUserId = T5.Id WHERE T2.ClosedDate IS NOT NULL
SELECT COUNT(T3.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T2.OwnerUserId = T1.Id INNER JOIN votes AS T3 ON T3.PostId = T2.Id WHERE T1.Age > 65 AND T2.Score >= 20
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT T1.Body FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.TagName = 'bayesian'
SELECT t1.Body FROM posts AS t1 INNER JOIN tags AS t2 ON t1.Id = t2.ExcerptPostId GROUP BY t2.ExcerptPostId ORDER BY COUNT(t2.TagName) DESC LIMIT 1
SELECT COUNT(T1.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT DISTINCT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT COUNT(T1.Name) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND YEAR(T1.Date) = 2011
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId GROUP BY T2.UserId ORDER BY COUNT(T2.UserId) DESC LIMIT 1
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT AVG(T2.Id) FROM posts AS T1 INNER JOIN badges AS T2 ON T1.OwnerUserId = T2.UserId WHERE T1.Views > 200;
SELECT CAST(SUM(CASE WHEN users.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(posts.Id) AS pct_elderly_posts FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Score > 20
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(Name) FROM badges WHERE Name = 'Revival'
SELECT T1.Title FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId ORDER BY T2.Score DESC LIMIT 1
SELECT COMMENT_COUNT FROM POSTS WHERE VIEW_COUNT = 1910
SELECT T2.FavoriteCount FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = '3025' AND T1.CreationDate = '2014-04-23 20:29:39.0'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ParentId = 107829
SELECT CASE WHEN t2.ClosedDate IS NULL THEN 1 ELSE 0 END AS 'Well finished' FROM comments AS t1 INNER JOIN posts AS t2 ON t1.PostId = t2.Id WHERE t1.UserId = '23853' AND t1.CreationDate = '2013-07-12 09:08:18'
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041)
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini'
SELECT DisplayName FROM users WHERE Id = 6347
SELECT SUM(v.VoteTypeId) FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT SUM(t1.PostCount) / SUM(t1.VoteCount) FROM ( SELECT COUNT(p.Id) AS PostCount, t.VoteCount FROM posts AS p INNER JOIN ( SELECT PostId, COUNT(Id) AS VoteCount FROM votes GROUP BY PostId ) t ON t.PostId = p.Id WHERE p.OwnerUserId = 24 GROUP BY p.OwnerUserId ) t1
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';
SELECT Text FROM comments WHERE Score = 17
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT T2.name FROM users AS T1 INNER JOIN badges AS T2 ON T1.id = T2.userid WHERE T1.DisplayName = 'SilentGhost'
SELECT DisplayName FROM users WHERE DisplayName IN ( SELECT T2.UserDisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T2.Id = T1.UserId WHERE T1.Text = 'thank you user93!' )
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion'
SELECT u.DisplayName, u.Reputation FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT DisplayName FROM users WHERE DisplayName IN (SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Necromancer')
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'
SELECT SUM(T1.Score), T2.WebsiteUrl FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Yevgeny'
SELECT T2.Text FROM postHistory AS T1 INNER JOIN comments AS T2 ON T1.PostId = T2.PostId INNER JOIN posts AS T3 ON T3.Id = T1.PostId WHERE T3.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT SUM(votes.BountyAmount) FROM votes INNER JOIN posts ON votes.PostId = posts.Id WHERE posts.Title LIKE '%data%'
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.BountyAmount = 50 AND T2.PostId IN ( SELECT Id FROM posts WHERE Title LIKE '%variance%' )
SELECT T2.Title, T2.Text, T1.Score FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN TAGS AS T3 ON T2.Tags LIKE '%' || T3.TagName || '%' WHERE T3.TagName = 'humor'
SELECT COUNT(*) FROM comments WHERE UserId = 13;
SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1
SELECT MIN(Views) FROM posts
SELECT COUNT(T2.UserId) FROM badges AS T1 INNER JOIN posts AS T2 ON T1.UserId = T2.OwnerUserId WHERE YEAR(T1.Date) = 2011 AND T1.Name = 'Supporter'
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId HAVING COUNT(T1.Name) > 5
SELECT COUNT(*) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York' AND b.Name IN ('Supporter', 'Teachers')
SELECT u.DisplayName ,  u.Reputation FROM users u WHERE u.Id = ( SELECT T1.OwnerUserId FROM posts T1 WHERE T1.Id = 1 );
SELECT UserId FROM posts WHERE Views >= 1000 GROUP BY UserId HAVING COUNT(DISTINCT PostHistoryId) = 1
SELECT T3.Name FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN badges AS T3 ON T2.OwnerUserId = T3.UserId GROUP BY T2.OwnerUserId ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT COUNT(T2.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Teacher' AND T2.Location = 'India'
SELECT ((SUBTRACT(DIVIDE((SELECT COUNT(Name) FROM badges AS T1 WHERE T1.Name LIKE 'Student' AND Year(T1.Date) = 2010), (SELECT COUNT(Name) FROM badges AS T2 WHERE T2.Name LIKE 'Student' AND Year(T2.Date) = 2010))) * 100)) - (DIVIDE((SELECT COUNT(Name) FROM badges AS T3 WHERE T3.Name LIKE 'Student' AND Year(T3.Date) = 2011), (SELECT COUNT(Name) FROM badges AS T4 WHERE T4.Name LIKE 'Student' AND Year(T4.Date) = 2011))) * 100)) FROM badges AS T5 WHERE T5.Name LIKE 'Student';
SELECT T2.PostHistoryTypeId, COUNT(DISTINCT T1.UserId) FROM comments AS T1 INNER JOIN postHistory AS T2 ON T1.PostId = T2.PostId WHERE T2.PostId = 3720
SELECT T1.Title ,  T1.ViewCount FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id  =  T2.RelatedPostId WHERE T2.PostId  =  61217
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395
SELECT PostId, UserId FROM posts WHERE Score > 60
SELECT SUM(FavoriteCount) FROM users WHERE Id = 686 AND YEAR(CreatinDate) = 2011
SELECT AVG(T2.UpVotes), AVG(T1.Age) FROM Users AS T1 INNER JOIN Votes AS T2 ON T1.Id = T2.UserId GROUP BY T1.UserId HAVING COUNT(T1.PostId) > 10
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer';
SELECT T3.Name FROM votes AS T1 INNER JOIN badges AS T3 ON T1.UserId = T3.UserId INNER JOIN posts AS T4 ON T3.Id = T4.OwnerUserId WHERE T3.Date = '2010-07-19 19:39:08'
SELECT COUNT(*) FROM comments WHERE Score > 60
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10
SELECT T3.name FROM votes AS T1 INNER JOIN users AS T2 ON T1.userid = T2.id INNER JOIN badges AS T3 ON T1.postid = T3.userid WHERE T2.reputation = ( SELECT MAX(reputation) FROM users );
SELECT Reputation FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Date = '2010-07-19 19:39:08.0')
SELECT T3.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId INNER JOIN tags AS T3 ON T2.Name = T3.TagName WHERE T1.DisplayName = 'Pierre'
SELECT DISTINCT DATE(T1.Date) AS DATE FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'
SELECT CAST(COUNT(T1.UserId) AS REAL) * 100 / COUNT(T2.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Teacher'
SELECT CAST(SUM(CASE WHEN T1.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM users AS T1 INNER JOIN badges AS T2 ON T1.UserId = T2.UserId WHERE T2.Name = 'Organizer'
SELECT T2.Score FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CreaionDate = '2010-07-19 19:19:56'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CreationDate = '2010-07-19 19:37:33.0'
SELECT T1.age FROM users AS T1 INNER JOIN badges AS T2 ON T1.id = T2.userid WHERE T2.name = 'Teacher' AND T1.location = 'Vienna, Austria'
SELECT COUNT(T1.UserId) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Age BETWEEN 19 AND 65 AND T2.Name = 'Supporter'
SELECT SUM(T3.ViewCount) FROM badges AS T1 INNER JOIN posts AS T2 ON T1.UserId = T2.OwnerUserId INNER JOIN posts AS T3 ON T1.PostId = T3.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT DISTINCT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = ( SELECT MIN(Reputation) FROM users )
SELECT T3.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId INNER JOIN posts AS T3 ON T2.Id = T3.AcceptedAnswerId WHERE T1.DisplayName = 'Sharpie'
SELECT COUNT(*) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Supporter' AND T1.Age > 65
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(Location) FROM users WHERE Location = 'New York'
SELECT count(*) FROM votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65
SELECT TOP 1 DisplayName FROM Users ORDER BY Views DESC
SELECT CAST(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE NULL END) FROM votes
SELECT T1.TagName FROM tags AS T1 INNER JOIN poststags AS T2 ON T1.Id = T2.TagId INNER JOIN posts AS T3 ON T2.PostId = T3.Id INNER JOIN users AS T4 ON T3.OwnerUserId = T4.Id WHERE T4.DisplayName = 'John Stauffer'
SELECT COUNT(posts.Id) FROM posts WHERE posts.DisplayName = 'Daniel Vassallo'
SELECT COUNT(T1.Id) FROM votes AS T1 INNER JOIN users AS T2 ON T2.Id = T1.UserId WHERE T2.DisplayName = 'Harlan'
SELECT T1.Id FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'slashnick' ORDER BY T1.AnswerCount DESC LIMIT 1
SELECT PostId FROM posts WHERE OwnerDisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY PostId ORDER BY SUM(ViewCount) DESC LIMIT 1
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Matt Parker' AND Score > 4
SELECT COUNT(*) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN users AS T3 ON T3.Id = T1.UserId WHERE T1.Score < 60 AND T3.DisplayName = 'Neil McGuigan'
SELECT t.TagName FROM tags AS t INNER JOIN posts AS p ON t.Id = ANY ( SELECT REPLACE(SUBSTR(REPLACE(SUBSTR(tags, 2), '</t>', ', '), ', ,', ', '), ', <t>', ', ') FROM posts WHERE Body LIKE '%<t>Mark Meckes%' ) INNER JOIN comments AS c ON p.Id = c.PostId WHERE c.PostId IS NULL
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT CAST(COUNT(CASE WHEN T.TagName = 'r' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(p.Id) FROM posts p LEFT JOIN tags T ON p.Tags LIKE '%' || T.TagName || '%' WHERE p.OwnerDisplayName = 'Community'
SELECT SUM(t1.ViewCount) - SUM(t2.ViewCount) FROM posts AS t1 INNER JOIN users AS t2 ON t1.OwnerUserId = t2.Id WHERE t2.DisplayName = 'Mornington' OR t2.DisplayName = 'Amos'
SELECT COUNT(T2.UserId) FROM badges AS T1 INNER JOIN comments AS T2 ON T1.UserId = T2.UserId WHERE T1.Name = 'Commentator' AND YEAR(T2.CreationDate) = 2014
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59';
SELECT T1.DisplayName, T1.Age FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId ORDER BY T2.Views DESC LIMIT 1
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';
SELECT COUNT(Id) FROM comments WHERE Score < 60 AND UserId = 13
SELECT T2.Title, T3.DisplayName FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Score > 60
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE STRFTIME('%Y', T1.Date) = '2011' AND T2.Location = 'North Pole';
SELECT DisplayName, WebsiteUrl FROM USERS INNER JOIN POSTS ON USERS.Id = POSTS.OwnerUserId WHERE POSTS.FavoriteCount > 150;
SELECT COUNT(Id) ,  MAX(LastEditDate) FROM postHistory WHERE PostId IN (SELECT Id FROM posts WHERE Title = 'What is the best introductory Bayesian statistics textbook?')
SELECT last_access_date, location FROM users WHERE id IN (SELECT UserId FROM badges WHERE name = 'Outliers' ORDER BY Date DESC LIMIT 1)
SELECT T1.Title FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.RelatedPostId WHERE T1.Title LIKE '%How to tell if something happened in a data set which monitors a value over time%'
SELECT T1.PostId, T2.Name FROM postHistory AS T1 INNER JOIN badges AS T2 ON T1.PostId = T2.PostId INNER JOIN users AS T3 ON T3.UserId = T2.UserId WHERE T3.UserDisplayName = 'Samuel' AND STRFTIME('%Y', T1.CreationDate) = '2013' AND STRFTIME('%Y', T2.Date) = '2013'
SELECT OwnerDisplayName FROM Posts ORDER BY ViewCount DESC LIMIT 1
SELECT T2.DisplayName, T2.Location FROM tags AS T1 INNER JOIN users AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'hypothesis-testing'
SELECT T2.Title, T1.LinkTypeId FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T2.Title = 'What are principal component scores?'
SELECT T3.DisplayName FROM posts AS T1 INNER JOIN posts AS T2 ON T1.ParentId = T2.Id INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T1.ParentId IS NOT NULL ORDER BY T1.Score DESC LIMIT 1
SELECT u.DisplayName, u.WebsiteUrl FROM users u INNER JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE count BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT age FROM users ORDER BY reputation DESC LIMIT 1
SELECT COUNT(T2.Id) FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE YEAR(T2.CreationDate) = 2011 AND T1.BountyAmount = 50
SELECT MIN(age) FROM users
SELECT Score FROM posts WHERE Id IN (SELECT PostId FROM posttags WHERE TagId = (SELECT Id FROM tags WHERE Count = (SELECT MAX(Count) FROM tags)))
SELECT CAST(COUNT(Id) AS REAL) / 12 FROM postLinks WHERE YEAR(CreationDate) = 2010 AND PostId IN (SELECT Id FROM posts WHERE AnswerCount <= 2);
SELECT T2.PostId FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Id = 1465 ORDER BY T2.FavoriteCount DESC LIMIT 1
SELECT T1.title FROM posts AS T1 INNER JOIN postlinks AS T2 ON T1.id = T2.postid ORDER BY T2.creationdate ASC LIMIT 1
SELECT T2.DisplayName FROM badges AS T1  INNER JOIN users AS T2 ON T2.Id = T1.UserId  GROUP BY T2.DisplayName  ORDER BY COUNT(T1.Name) DESC  LIMIT 1
SELECT MIN(T1.CreationDate) FROM votes AS T1 INNER JOIN users AS T2 ON T2.Id = T1.UserId WHERE T2.DisplayName = 'chl'
SELECT MIN(CreationDate) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users))
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Autobiographer' ORDER BY T1.Date ASC LIMIT 1
SELECT COUNT(DISTINCT T1.OwnerUserId) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Location = 'United Kingdom' AND T1.FavoriteCount >= 4
SELECT AVG(PostId) FROM votes WHERE UserId IN ( SELECT Id FROM users ORDER BY Age DESC LIMIT 1 )
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(Id) FROM users WHERE Reputation > 2000 AND Views > 1000
SELECT DISTINCT T2.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age BETWEEN 19 AND 65
SELECT COUNT(*) FROM posts WHERE DisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010
SELECT Id ,  Title FROM posts WHERE OwnerDisplayName  =  'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner'
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE YEAR(T1.CreationDate) = 2011 AND T1.ViewCount > 20000
SELECT T1.PostId, T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE STRFTIME('%Y', T1.CreationDate) = '2010' AND T1.FavoriteCount = ( SELECT MAX(FavoriteCount) FROM posts WHERE STRFTIME('%Y', CreationDate) = '2010' )
SELECT CAST(SUM(IIF(CASE WHEN YEAR(posts.CreationDate) = 2011 THEN 1 ELSE 0 END) = 1 AND users.Reputation > 1000, 1, 0)) * 100.0 / COUNT(posts.Id) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id
SELECT CAST(COUNT(CASE WHEN age BETWEEN 13 AND 18 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(Id) FROM users
SELECT T1.ViewCount, T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Computer Game Datasets' ORDER BY T1.LastAccessDate DESC LIMIT 1
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);
SELECT COUNT(*) FROM comments WHERE PostId = ( SELECT Id FROM posts ORDER BY Score DESC LIMIT 1 )
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT T3.DisplayName, T3.Location FROM posts AS T1 INNER JOIN posthistory AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T1.LastEditorUserId = T3.Id WHERE T1.Id = 183 ORDER BY T2.LastEditDate DESC LIMIT 1
SELECT Name FROM badges WHERE UserId = ( SELECT Id FROM users WHERE DisplayName = 'Emmett' ) AND Date = ( SELECT MAX(Date) FROM badges WHERE UserId = ( SELECT Id FROM users WHERE DisplayName = 'Emmett' ) )
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age BETWEEN 19 AND 65 AND T2.VoteTypeId = 1 AND T2.UpVotes > 5000
SELECT STRFTIME('%J', julianday(badges.Date), '-', julianday(users.CreationDate)) AS duration FROM users INNER JOIN badges ON users.DisplayName = badges.Name WHERE users.DisplayName = 'Zolomon'
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users));
SELECT T4.Text, T4.UserDisplayName FROM posts AS T1 INNER JOIN comments AS T4 ON T1.Id = T4.PostId WHERE T1.Title = 'Analysing wind data with R' ORDER BY T4.CreationDate DESC LIMIT 1
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(*) FROM tags WHERE TagName = 'careers'
SELECT reputation ,  viewcount FROM users WHERE displayname = 'Jarrod Dixon'
SELECT SUM(IIF(PostTypeId = 1, 1, 0)) AS NumberOfAnswers, SUM(IIF(PostTypeId = 2, 1, 0)) AS NumberOfComments FROM posts WHERE Title = 'Clustering 1D data';
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(Id) FROM votes WHERE BountyAmount >= 30
SELECT CAST(COUNT(CASE WHEN T2.Score >= 50 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Reputation = ( SELECT MAX(Reputation) FROM users )
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20
SELECT T1.ExcerptPostId, T1.WikiPostId FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'sample'
SELECT T1.Reputation, T1.UpVotes FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE '%fine, you win :)%'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How can I adapt ANOVA for binary data?'
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ViewCount BETWEEN 100 AND 150 ORDER BY T1.Score DESC LIMIT 1
SELECT T1.CreationDate, T1.Age FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE '%http://%'
SELECT COUNT(T1.PostId) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score = 0 AND T2.ViewCount < 5
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CommentCount = 1) AND Score = 0
SELECT SUM(IIF(T4.YEAR(T3.Age) = 40, 1, 0)) AS total FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId LEFT JOIN users AS T3 ON T3.Id = T2.UserId WHERE T2.Score = 0
SELECT p.Id, COUNT(c.Id) FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item' GROUP BY p.Id
SELECT T1.Reputation FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE 'R is also lazy evaluated.'
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky'
SELECT DISTINCT t2.DisplayName FROM comments AS t1 INNER JOIN users AS t2 ON t1.UserId = t2.Id WHERE t1.Score BETWEEN 1 AND 5 AND t1.DownVotes = 0
SELECT CAST(COUNT(CASE WHEN T1.Score BETWEEN 5 AND 10 THEN T2.UpVotes ELSE NULL END) AS FLOAT) * 100 / COUNT(T1.UserId) FROM comments AS T1 INNER JOIN votes AS T2 ON T1.UserId = T2.UserId WHERE T2.UpVotes = 0
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'
SELECT COUNT(T1.hero_id) FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND (SELECT power_name FROM superpower WHERE power_id = (SELECT power_id FROM hero_power WHERE hero_id = superhero.id)) = 'Super Strength'
SELECT T2.full_name FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id GROUP BY T2.full_name HAVING COUNT(T2.full_name) > 15
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue')
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM colour AS T1 INNER JOIN superhero AS T2 ON T2.eye_colour_id = T1.id INNER JOIN hero_power AS T3 ON T3.hero_id = T2.id INNER JOIN superpower AS T4 ON T4.id = T3.power_id WHERE T1.colour = 'Blue' AND T4.power_name = 'Agility'
SELECT superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN hero_power AS T4 ON T1.id = T4.hero_id INNER JOIN superpower AS T5 ON T4.power_id = T5.id WHERE T2.colour = 'Blue' AND T3.colour = 'Blond' AND T5.power_name = 'Agility'
SELECT COUNT(*) FROM superhero AS t1 INNER JOIN publisher AS t2 ON t1.publisher_id = t2.id WHERE t2.publisher_name = 'Marvel Comics'
SELECT full_name FROM superhero WHERE publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' ) ORDER BY height_cm DESC LIMIT 1
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron';
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T2.publisher_name = 'Marvel Comics' AND T3.colour = 'Blue'
SELECT AVG(height_cm) FROM superhero WHERE publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' );
SELECT CAST(COUNT(T1.superhero_name) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id INNER JOIN superpower AS T4 ON T2.power_id = T4.id WHERE T3.publisher_name = 'Marvel Comics' AND T4.power_name = 'Super Strength';
SELECT COUNT(*) FROM superhero WHERE publisher_id = 4
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN hero_attribute AS T3 ON T3.hero_id = T2.id INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Speed' ORDER BY T3.attribute_value ASC LIMIT 1
SELECT COUNT(*) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE publisher.publisher_name = 'Marvel Comics' AND colour.colour = 'Gold';
SELECT publisher_name FROM publisher WHERE publisher_id = ( SELECT publisher_id FROM superhero WHERE superhero_name = 'Blue Beetle II' );
SELECT COUNT(superhero.id) FROM superhero INNER JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.id = 2
SELECT T3.superhero_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Intelligence' ORDER BY T1.attribute_value ASC LIMIT 1
SELECT race FROM superhero WHERE superhero_name = 'Copycat';
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T2.attribute_value < 50
SELECT T2.superhero_name FROM superpower AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.gender_id = 2 AND T3.attribute_name = 'Strength' AND T3.attribute_value = 100
SELECT T3.superhero_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id GROUP BY T3.superhero_name ORDER BY COUNT(T1.hero_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race_id = 5
SELECT CAST(SUM(CASE WHEN T1.alignment_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT CASE WHEN COUNT(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN T1.publisher_name ELSE NULL END) - COUNT(CASE WHEN T1.publisher_name = 'DC Comics' THEN T1.publisher_name ELSE NULL END) > 0 THEN 'Marvel Comics' ELSE 'DC Comics' END AS "Publisher with more superheroes", COUNT(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN T1.publisher_name ELSE NULL END) - COUNT(CASE WHEN T1.publisher_name = 'DC Comics' THEN T1.publisher_name ELSE NULL END) AS "Difference in number of superheroes" FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(T1.attribute_value) FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT colour FROM colour WHERE id = (SELECT eye_colour_id FROM superhero WHERE id = 75);
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok';
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.gender_id = 1 LIMIT 5
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.id = 1 AND T1.height_cm BETWEEN 170 AND 190
SELECT power_name FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 56;
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2
SELECT race FROM superhero WHERE weight_kg = 169
SELECT T1.hair_colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T2.id = T1.hair_colour_id WHERE T1.height_cm = 185 AND T1.race_id = 1
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T1.weight_kg = ( SELECT MAX(weight_kg) FROM superhero )
SELECT CAST(SUM(CASE WHEN T1.publisher_id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 WHERE T1.height_cm BETWEEN 150 AND 180
SELECT full_name FROM superhero WHERE gender_id = 1 AND weight_kg > ( SELECT AVG(weight_kg) FROM superhero ) * 0.79
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT attribute_value FROM hero_attribute WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Abomination') AND attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence');
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.id = 1;
SELECT COUNT(DISTINCT T2.hero_id) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'stealth'
SELECT t3.full_name FROM attribute AS t1 INNER JOIN hero_attribute AS t2 ON t1.id = t2.attribute_id INNER JOIN superhero AS t3 ON t2.hero_id = t3.id WHERE t1.attribute_name = 'Strength' ORDER BY t2.attribute_value DESC LIMIT 1
SELECT COUNT(id) / SUM(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) FROM superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T1.publisher_id = 3 AND T3.attribute_name = 'Durability' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T2.superhero_name FROM superpower AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.power_name = 'Flight'
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.gender_id = 2 AND T2.publisher_name = 'Dark Horse Comics';
SELECT T1.superhero_name, T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id
SELECT T2.race_id FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb';
SELECT CAST(SUM(CASE WHEN T1.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.hair_colour_id WHERE T2.gender_id = 2
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'
SELECT T2.superhero_name FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN superpower AS T3 ON T1.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(*) FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Amazo'
SELECT power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T3.height_cm FROM colour AS T1 INNER JOIN superhero AS T3 ON T1.id = T3.eye_colour_id WHERE T1.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'
SELECT T1.eye_colour_id FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Gold'
SELECT full_name FROM superhero WHERE race_id = 2
SELECT superhero_name FROM superhero WHERE alignment_id = 3
SELECT COUNT(*) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'));
SELECT T3.race, T4.alignment FROM superhero AS T1 INNER JOIN race AS T3 ON T1.race_id = T3.id INNER JOIN alignment AS T4 ON T1.alignment_id = T4.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(COUNT(CASE WHEN T1.gender_id = 2 THEN T1.id ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT AVG(T2.weight_kg) FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Alien'
SELECT ( SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky' ) - ( SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler' )
SELECT AVG(height_cm) FROM superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(id) FROM superhero WHERE race_id = 21 AND gender_id = 1
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3
SELECT attribute_name, attribute_value FROM hero_attribute WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = '3-D Man')
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.id = 7 AND T3.id = 9
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(id) FROM superhero WHERE publisher_id = 1
SELECT CAST(SUM(IIF(eye_colour_id = 7, 1, 0)) AS FLOAT) * 100.0 / COUNT(*) FROM superhero
SELECT SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) FROM superhero;
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.height_cm = 188 AND T1.weight_kg = 108
SELECT publisher_name FROM publisher WHERE id = (SELECT publisher_id FROM superhero WHERE id = 38);
SELECT T2.race FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id ORDER BY T1.attribute_value DESC LIMIT 1
SELECT t.alignment, t1.power_name FROM alignment AS t INNER JOIN hero_superpower AS t2 ON t.id = t2.alignment_id INNER JOIN superpower AS t1 ON t1.id = t2.power_name WHERE t2.superhero_name = 'Atom IV'
SELECT full_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') LIMIT 5
SELECT AVG(T1.attribute_value) FROM hero_attribute AS T1 INNER JOIN alignment AS T2 ON T1.hero_id = T2.id WHERE T2.alignment_id = 3
SELECT T3.colour FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN colour AS T3 ON T1.hero_id = T3.id WHERE T1.attribute_value = 100
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1;
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80
SELECT T2.race FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN colour AS T3 ON T2.hair_colour_id = T3.id WHERE T3.colour = 'Blue' AND T1.gender = 'Male'
SELECT CAST(COUNT(CASE WHEN t1.gender_id = 2 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS t1 INNER JOIN alignment AS t2 ON t1.alignment_id = t2.id WHERE t2.alignment = 'Bad'
SELECT SUM(IIF(T1.eye_colour_id = 1, 1, 0)) - SUM(IIF(T1.eye_colour_id = 7, 1, 0)) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT T1.attribute_value FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id INNER JOIN superhero AS T3 ON T3.id = T2.hero_id WHERE T1.attribute_name = 'Strength' AND T3.superhero_name = 'Hulk'
SELECT T2.power_name FROM hero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T3.colour = 'Green' AND T2.alignment = 'Bad';
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.gender_id = 2 AND T2.publisher_name = 'Marvel Comics'
SELECT T3.superhero_name FROM hero_power AS T1 INNER JOIN power AS T2 ON T1.power_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.power_name = 'Wind Control' ORDER BY T3.superhero_name
SELECT T1.gender_id FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Phoenix Force'
SELECT T1.superhero_name, T1.weight_kg FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.weight_kg = ( SELECT MAX(T1.weight_kg) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' )
SELECT AVG(height_cm) FROM superhero WHERE race_id != 1 AND publisher_name = 'Dark Horse Comics'
SELECT COUNT(*) FROM (SELECT T1.id AS superhero_id FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T1.attribute_value = 100 AND T2.attribute_name = 'Speed') AS T3
SELECT CASE WHEN COUNT(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 END) > COUNT(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 END) THEN 'DC Comics' ELSE 'Marvel Comics' END AS publisher_with_more_superheroes, COUNT(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 END) - COUNT(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 END) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id
SELECT T2.attribute_name FROM superhero AS T1 INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id INNER JOIN attribute AS T2 ON T2.id = T3.attribute_id WHERE T1.superhero_name = 'Black Panther' ORDER BY T3.attribute_value ASC LIMIT 1
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT COUNT(CASE WHEN T2.gender = 'Female' THEN 1 END) * 100.0 / COUNT(T2.gender) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'George Lucas'
SELECT COUNT(*) * 100.0 / SUM(CASE WHEN alignment = 'Good' THEN 1 ELSE 0 END) AS percentage FROM superhero WHERE publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T3.id = T1.attribute_id WHERE T2.superhero_name = 'Aquababy'
SELECT weight_kg, race_id FROM superhero WHERE id = 40
SELECT avg(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT hero_id FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf';
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.height_cm > ( SELECT AVG(height_cm) FROM superhero ) * 0.8
SELECT T2.driverRef FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 18 ORDER BY T1.q1 ASC LIMIT 5
SELECT T2.surname FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19 AND T1.q2 = ( SELECT MIN(q2) FROM qualifying WHERE raceId = 19 )
SELECT YEAR FROM races WHERE circuitID IN (SELECT circuitID FROM circuits WHERE LOCATION = 'Shanghai')
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya'
SELECT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Germany'
SELECT T1.position FROM constructors AS T1 INNER JOIN constructorResults AS T2 ON T2.constructorId = T1.constructorId WHERE T1.name = 'Renault'
SELECT COUNT(*) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND T2.country NOT IN ('Asia', 'Europe');
SELECT name FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Spain')
SELECT T2.lat, T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Australian Grand Prix'
SELECT url FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')
SELECT time FROM races WHERE circuitId = ( SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit' );
SELECT T2.lat, T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Abu Dhabi Grand Prix'
SELECT T2.country FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 24
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354
SELECT T3.nationality FROM qualifying AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T1.q2 = '0:01:40' AND T2.raceId = 355
SELECT T1.number FROM results AS T1 INNER JOIN qualifying AS T2 ON T1.raceId = T2.raceId INNER JOIN races AS T3 ON T3.raceId = T2.raceId WHERE T3.round = 903 AND T2.q3 = '0:01:54'
SELECT COUNT(d.driverId) FROM drivers AS d WHERE NOT EXISTS (SELECT 1 FROM results AS r WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007) AND r.driverId = d.driverId)
SELECT T3.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T1.raceId = 901
SELECT count(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE DATE(date) = '2015-11-29')
SELECT T2.forename, T2.surname, T2.dob FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 592 AND T1.time IS NOT NULL ORDER BY T2.dob ASC LIMIT 1
SELECT T2.url FROM races AS T1 INNER JOIN drivers AS T2 ON T1.raceId = T2.driverId WHERE T1.raceId = 161 AND T1.time = '1:27:00'
SELECT T1.nationality FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 933
SELECT lat, lng FROM circuits WHERE name = 'Malaysian Grand Prix'
SELECT T1.url FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 ORDER BY T2.points DESC LIMIT 1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Lucas Di Grassi') AND raceId = (SELECT raceId FROM races WHERE round = 345);
SELECT T3.country FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.raceId = 347 AND T1.q2 = '01:15:00'
SELECT T2.code FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T1.raceId = 45 AND T1.q3 = '0:01:33'
SELECT T2.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.constructorId = 3 AND T2.raceId = 743
SELECT DISTINCT T3.forename, T3.surname FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId INNER JOIN circuits AS T4 ON T2.circuitId = T4.circuitId WHERE T4.name = 'San Marino Grand Prix' AND T2.year = 2006 AND T1.position = 2
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901
SELECT COUNT(T2.position) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2015 AND T1.month = 11 AND T1.day = 29
SELECT * FROM drivers WHERE driverId IN (SELECT DISTINCT driverId FROM results WHERE raceId = 872) ORDER BY dob LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 348 ORDER BY T2.time LIMIT 1
SELECT nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1
SELECT CAST((SELECT SUBTRACT(T1.fastestLapSpeed, (SELECT fastestLapSpeed FROM results WHERE raceId = T1.raceId + 1)) FROM results AS T1 WHERE T1.position = 1 AND T1.raceId = 853) AS REAL) * 100 / (SELECT fastestLapSpeed FROM results WHERE position = 1 AND raceId = 853)
SELECT CAST(COUNT(CASE WHEN time IS NOT NULL AND strftime('%Y-%m-%d', date) = '1983-07-16' THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN strftime('%Y-%m-%d', date) = '1983-07-16' THEN 1 END) FROM races WHERE strftime('%Y-%m-%d', date) = '1983-07-16'
SELECT min(YEAR) FROM races
SELECT COUNT(raceId) ,  name FROM races WHERE year = 2005 ORDER BY name DESC
SELECT name, year, month FROM races WHERE date = (SELECT MIN(date) FROM races)
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1
SELECT year FROM races GROUP BY year ORDER BY COUNT(year) DESC LIMIT 1
SELECT name FROM races WHERE year IN (2017) EXCEPT SELECT T1.name FROM races AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year = 2000
SELECT T1.name, T1.location FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId INNER JOIN driverStandings AS T3 ON T3.raceId = T2.raceId WHERE T3.positionText = '1' AND T2.country IN ('Austria', 'Belgium', 'Denmark', 'Finland', 'France', 'Germany', 'Hungary', 'Italy', 'Netherlands', 'Norway', 'Poland', 'Portugal', 'Spain', 'Sweden', 'United Kingdom') ORDER BY T2.year ASC LIMIT 1
SELECT MAX(T2.year) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'UK' AND T2.name = 'British Grand Prix'
SELECT COUNT(T1.year) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'British Grand Prix' AND T2.country = 'United Kindom'
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Singapore Grand Prix' AND T3.year = 2010 ORDER BY T2.position
SELECT DISTINCT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T1.points DESC LIMIT 1
SELECT T1.forename , T1.surname, T2.points FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T2.position BETWEEN 1 AND 3 AND T3.name = 'Chinese Grand Prix' AND T3.year = 2017
SELECT T1.forename ,  T1.surname ,  T2.name ,  MIN(T2.time) FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId
SELECT AVG(T1.time) FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Sebastian' AND T2.surname = 'Vettel' AND T1.raceId = ( SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND year = 2009 )
SELECT CAST(COUNT(CASE WHEN r.position > 1 THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN r.surname = 'Hamilton' AND r.year >= 2010 THEN 1 END) FROM results AS r INNER JOIN races AS ra ON r.raceId = ra.raceId INNER JOIN drivers AS d ON r.driverId = d.driverId
SELECT T3.forename, T3.surname, T3.nationality, avg(T1.points) as avg_points FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.wins = ( SELECT count(*) FROM results AS T4 WHERE T4.wins = 1 ) GROUP BY T1.driverId ORDER BY avg_points DESC LIMIT 1
SELECT T2.name, T2.dob FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.nationality = 'Japanese' ORDER BY T2.dob ASC LIMIT 1
SELECT T1.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year BETWEEN 1990 AND 2000 GROUP BY T1.circuitId HAVING count(*)  =  4
SELECT T1.name, T1.location, T4.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId INNER JOIN seasons AS T3 ON T2.year = T3.year INNER JOIN races AS T4 ON T1.circuitId = T4.circuitId WHERE T3.year = 2006 AND T1.country = 'USA'
SELECT T2.name ,  T2.location ,  T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId  =  T2.circuitId WHERE T1.year  =  2005 AND T1.month  =  9;
SELECT name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE forename = 'Alex' AND surname = 'Yoong' AND T3.number < 10
SELECT COUNT(r.raceId) FROM races AS r INNER JOIN results AS res ON r.raceId = res.raceId WHERE res.wins = 1 AND r.circuitId = ( SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit' )
SELECT T1.name, T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.surname = 'Schumacher' ORDER BY T2.milliseconds LIMIT 1
SELECT AVG(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId IN (SELECT T1.raceId FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T2.year = 2000) AND T1.surname = 'Irvine'
SELECT T1.year, T1.raceId, T4.forename, T4.surname, T3.points FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN driverStandings AS T3 ON T2.driverId = T3.driverId INNER JOIN drivers AS T4 ON T3.driverId = T4.driverId ORDER BY T1.year LIMIT 1
SELECT T2.name ,  T3.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId  =  T2.circuitId JOIN countries AS T3 ON T2.country  =  T3.country WHERE T1.year  =  2017 ORDER BY T1.date
SELECT T2.name, T1.year, T3.location FROM races AS T1 INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId ORDER BY T1.laps DESC LIMIT 1
SELECT CAST(SUM(IIF(T2.country = 'Germany' AND T1.name = 'European Grand Prix', 1, 0)) AS REAL) * 100 / COUNT(T1.raceId) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits ORDER BY lat DESC LIMIT 1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT T1.country FROM circuits AS T1 ORDER BY T1.alt DESC LIMIT 1
SELECT count(driverId) FROM drivers WHERE code IS NULL
SELECT country FROM drivers ORDER BY dob ASC LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT T4.url FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN seasons AS T3 ON T1.raceId = T3.year INNER JOIN circuits AS T4 ON T1.raceId = T4.circuitId WHERE T2.forename = 'Anthony' AND T2.surname = 'Davidson'
SELECT driverRef FROM drivers WHERE surname = 'Hamilton'
SELECT name FROM circuits WHERE circuitId IN (SELECT circuitId FROM races WHERE name = 'Spanish Grand Prix' AND year = 2009);
SELECT YEAR FROM races WHERE circuitid IN (SELECT circuitid FROM circuits WHERE name = 'Silverstone Circuit')
SELECT name, url FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name LIKE 'Silverstone%')
SELECT time FROM races WHERE year = 2010 AND name = 'Abu Dhabi Grand Prix'
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy'
SELECT T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'
SELECT T3.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId INNER JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.year = 2009 AND T2.nationality = 'Spanish'
SELECT fastestLapTime FROM results WHERE driverId = 1 ORDER BY fastestLapTime ASC LIMIT 1
SELECT T3.forename, T3.surname FROM results AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T2.milliseconds = ( SELECT MIN(milliseconds) FROM lapTimes )
SELECT T1.driverRef FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Australian Grand Prix' AND T2.position = 1 AND T3.year = 2008
SELECT r.name, d.forename, d.surname FROM races AS r JOIN results AS res ON r.raceId = res.raceId JOIN drivers AS d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'
SELECT T2.name FROM driver_standings AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T1.rank LIMIT 1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009
SELECT YEAR FROM races INNER JOIN results ON races.raceID = results.raceID INNER JOIN drivers ON results.driverID = drivers.driverID WHERE drivers.forename = 'Lewis'
SELECT positionOrder FROM results WHERE driverId = 1 AND raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')
SELECT T2.forename, T2.surname FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.grid = 4
SELECT COUNT(DISTINCT T2.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T2.time IS NOT NULL
SELECT fastestLapTime FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008
SELECT time FROM results WHERE raceId = 1 ORDER BY position ASC LIMIT 1, 1
SELECT T1.surname, T4.url FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId INNER JOIN constructors AS T4 ON T4.constructorId = T2.constructorId INNER JOIN season AS T5 ON T3.year = T5.year WHERE T3.name = 'Australian Grand Prix' AND T5.year = 2008
SELECT COUNT(T1.driverId) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.year = 2008 AND T2.nationality = 'American';
SELECT COUNT(T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Australian Grand Prix' AND T1.time IS NOT NULL
SELECT SUM(T1.points) FROM driverStandings AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.surname = 'Hamilton'
SELECT AVG(CAST(REPLACE(REPLACE(fastestLapTime, ':', '.'), ',', '.') AS REAL)) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');
SELECT CAST(SUM(CASE WHEN time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(raceId) FROM races
SELECT      CASE          WHEN ((STRFTIME('%H', L1.time) * 3600 + STRFTIME('%M', L1.time) * 60 + STRFTIME('%S', L1.time)) -                (STRFTIME('%H', L2.time) * 3600 + STRFTIME('%M', L2.time) * 60 + STRTFIME('%S', L2.time))) < 0 THEN              (100.0 *               ((STRFTIME('%H', L1.time) * 3600 + STRFTIME('%M', L1.time) * 60 + STRFTIME('%S', L1.time)) -                (STRFTIME('%H', L2.time) * 3600 + STRFTIME('%M', L2.time) * 60 + STRTFIME('%S', L2.time))) /               (STRFTIME('%H', L1.time) * 3600 + STRFTIME('%M', L1.time) * 60 + STRTFIME('%S', L1.time)))          ELSE NULL      END AS percentage_faster FROM      results AS R1  JOIN      drivers AS D1 ON R1.driverId = D1.driverId  JOIN      results AS R2 ON R2.raceId = R1.raceId AND R2.position = 18  JOIN      lapTimes AS L1 ON L1.raceId = R1.raceId AND L1.driverId = R1.driverId AND L1.lap = R1.laps  JOIN      lapTimes AS L2 ON L2.raceId = R2.raceId AND L2.driverId = R2.driverId AND L2.lap = R2.laps  WHERE      R1.raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 LIMIT 1);
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne'
SELECT lat ,  lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) > '1980'
SELECT AVG(T1.points) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'British';
SELECT name FROM constructors ORDER BY points DESC LIMIT 1
SELECT T2.name FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.points = 0 AND T1.raceId = 18
SELECT count(T3.constructorId) FROM races AS T1 INNER JOIN constructorStandings AS T2 ON T2.raceId = T1.raceId INNER JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.year = 2009 AND T3.nationality = 'Japanese' AND T3.points = 0 AND T1.round <= 2
SELECT T1.name FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.positionText = '1'
SELECT COUNT(*) FROM constructors INNER JOIN results ON constructors.constructorId = results.constructorId INNER JOIN driverStandings ON results.resultId = driverStandings.resultId WHERE constructors.nationality = 'French' AND results.laps > 50
SELECT CAST(COUNT(CASE WHEN T1.year BETWEEN 2007 AND 2009 AND T4.nationality = 'Japanese' THEN T1.raceId END) AS REAL) * 100 / COUNT(CASE WHEN T1.year BETWEEN 2007 AND 2009 THEN T1.raceId END) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T4 ON T2.driverId = T4.driverId
SELECT T2.year, CAST(SUM(JULIANDAY(strftime('%s', T1.time)) - JULIANDAY(strftime('%s', '00:00:00'))) AS REAL) / COUNT(T1.time) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId INNER JOIN driverstandings AS T4 ON T1.driverId = T4.driverId WHERE T4.position = 1 GROUP BY T2.year
SELECT forename, surname FROM drivers WHERE year(dob) > 1975 AND position = 2
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND time IS NULL
SELECT T3.forename ,  T3.surname FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId ORDER BY T1.milliseconds ASC LIMIT 1
SELECT lap FROM results WHERE year = 2009 AND position = 1 ORDER BY time LIMIT 1
SELECT AVG(fastestLapSpeed) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Spanish Grand Prix' AND year = 2009)
SELECT T3.name, T1.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T3.circuitId = T2.circuitId WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds LIMIT 1
SELECT CAST(COUNT(T1.driverId) AS REAL) * 100 / COUNT(T2.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob < DATE('1985-01-01') AND T2.laps > 50 AND T2.raceId BETWEEN 1 AND 10
SELECT count(*) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'French' AND T2.milliseconds < 120
SELECT driverRef FROM drivers WHERE nationality = 'America'
SELECT raceId FROM races WHERE year = 2009
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18
SELECT T2.country, COUNT(T1.dob) FROM drivers AS T1 INNER JOIN circuits AS T2 ON T1.dob = T2.name ORDER BY T1.dob DESC LIMIT 3
SELECT driverRef FROM drivers WHERE surname = 'Kubica'
SELECT count(*) FROM drivers WHERE SUBSTR(dob, 1, 4) = 1980 AND nationality = 'Australian'
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' AND T1.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY T1.driverId ORDER BY MIN(T2.time) LIMIT 3
SELECT T1.driverRef FROM drivers AS T1 INNER JOIN races AS T2 ON T1.driverId = T2.raceId INNER JOIN seasons AS T3 ON T2.year = T3.year WHERE T1.nationality = 'German' ORDER BY T3.year ASC LIMIT 1
SELECT driverId, code FROM results WHERE fastestLapTime IS NOT NULL ORDER BY fastestLapTime DESC LIMIT 1
SELECT T2.driverId, T2.forename, T2.surname, T2.dob FROM ( SELECT driverId, MAX(milliseconds) AS mm FROM lapTimes GROUP BY driverId ) AS T1 JOIN drivers AS T2 ON T2.driverId = T1.driverId WHERE T2.nationality = 'Spain' AND EXTRACT(YEAR FROM T2.dob) < 1982 ORDER BY T1.mm DESC LIMIT 10
SELECT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT year FROM races ORDER BY time DESC LIMIT 1
SELECT T1.driverId FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY CAST(REPLACE(SUBSTR(time, 1, INSTR(time, ':') - 1), ',', '.') AS REAL) ASC, T1.fastestLapTime ASC LIMIT 5
SELECT COUNT(T1.time) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.statusId = 2 AND T1.raceId > 50 AND T1.raceId < 100
SELECT lat, lng FROM circuits WHERE country = 'Austria'
SELECT MAX(T2.laps) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time IS NOT NULL
SELECT DISTINCT T2.driverRef, T2.nationality, T2.dob FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 23 AND T1.q2 IS NOT NULL
SELECT T1.name, T2.date, T2.time FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T1.dob = ( SELECT min(T1.dob) FROM drivers AS T1 INNER JOIN races AS T2 ON T1.driverId = T2.driverId )
SELECT COUNT(statusId) FROM results WHERE statusId = 2
SELECT T1.name, T1.url FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId ORDER BY T1.wins DESC LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'French Grand Prix' AND T3.raceId IN ( SELECT T2.raceId FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'French Grand Prix' AND T2.raceId IN ( SELECT raceId FROM results WHERE position = 3 ) ) ORDER BY T2.time DESC LIMIT 1
SELECT T2.name, T1.time FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY time LIMIT 1
SELECT AVG(T3.fastestLapTime) FROM races AS T1 INNER JOIN results AS T3 ON T1.raceId = T3.raceId WHERE T1.name LIKE 'United States Grand Prix' AND T3.positionOrder < 11
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T2.duration IS NOT NULL AND T1.nationality = 'German' AND T1.dob BETWEEN 1980 AND 1985 GROUP BY T1.forename, T1.surname ORDER BY AVG(T2.duration) LIMIT 5
SELECT T2.time FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2008 AND T1.name LIKE 'Canadian Grand Prix' ORDER BY T2.milliseconds LIMIT 1
SELECT T1.constructorRef, T2.url FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = ( SELECT raceId FROM races WHERE name = 'Singapore Grand Prix' AND YEAR = 2009 ) ORDER BY T2.points DESC LIMIT 1
SELECT T1.forname, T1.surname, T1.dob FROM drivers AS T1 INNER JOIN countries AS T2 ON T1.nationality = T2.country WHERE T2.name = 'Austrian' AND strftime('%Y', T1.dob) BETWEEN '1981' AND '1991';
SELECT forename, surname, url, dob FROM drivers WHERE nationality = 'German' AND SUBSTR(dob, 1, 4) BETWEEN '1971' AND '1985' ORDER BY dob DESC
SELECT T1.location, T1.country, T1.lat, T1.lng FROM circuits AS T1 WHERE T1.circuitRef = 'hungaroring'
SELECT T.points, T.name, T.nationality FROM  (SELECT cs.points, c.name, c.nationality FROM constructorResults AS cs JOIN constructors AS c ON cs.constructorId = c.constructorId JOIN races AS r ON cs.raceId = r.raceId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 ORDER BY points DESC LIMIT 1) T
SELECT AVG(T3.points) FROM races AS T1 INNER JOIN results AS T3 ON T1.raceId = T3.raceId INNER JOIN drivers AS T4 ON T3.driverId = T4.driverId WHERE T4.nationality = 'Turkish'
SELECT AVG(COUNT(1)) FROM races WHERE date >= '2000-01-01' AND date <= '2010-12-31' GROUP BY EXTRACT(YEAR FROM date)
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT wins FROM driver_standings WHERE position = 91
SELECT name FROM races WHERE fastestLapTime = ( SELECT MIN(fastestLapTime) FROM results )
SELECT location, country FROM circuits ORDER BY date DESC LIMIT 1
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN qualifying AS T3 ON T1.raceId = T3.raceId WHERE T1.position = 1 AND T3.position = 3 AND T3.raceId = ( SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND year = 2008 )
SELECT T2.forename ,  T2.surname ,  T2.nationality ,  T1.name FROM races AS T1 INNER JOIN drivers AS T2 ON T2.driverId = T1.driverId ORDER BY T2.dob LIMIT 1
SELECT COUNT(T2.statusid) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.statusId = 3 AND T1.name = 'Canadian Grand Prix'
SELECT COUNT(*) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.dob = ( SELECT MIN(dob) FROM drivers )
SELECT T2.time FROM pitStops AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY CAST(SUBSTR(T1.time, 1, 2) AS INTEGER) * 3600 + CAST(SUBSTR(T1.time, 4, 2) AS INTEGER) * 60 + CAST(SUBSTR(T1.time, 7, 2) AS INTEGER) LIMIT 1
SELECT T2.time FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T2.lap = ( SELECT min(lap) FROM lapTimes )
SELECT MAX(CAST(SUBSTR(time, INSTR(time, ':') + 1) AS REAL));
SELECT time FROM pitStops WHERE driverId = ( SELECT driverId FROM drivers WHERE surname = 'Hamilton' ) AND raceId = ( SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix' ) LIMIT 1
SELECT T1.name ,  T2.time FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T3.raceId = T2.raceId WHERE T3.year = 2011 AND T3.name = 'Australian Grand Prix'
SELECT name,MIN(time) FROM races INNER JOIN lapTimes ON races.raceId = lapTimes.raceId INNER JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.driverRef = 'hamilton'
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.time = ( SELECT MIN(time) FROM results )
SELECT T3.position FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN driverStandings AS T3 ON T1.driverId = T3.driverId WHERE T3.points = ( SELECT points FROM driverStandings WHERE position = 1 ORDER BY points DESC LIMIT 1 ) AND T1.fastestLap = ( SELECT fastestLap FROM results ORDER BY fastestLapTime LIMIT 1 )
SELECT time FROM lapTimes WHERE raceId = (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix Circuit'));
SELECT T1.circuitId, T1.name, T2.time FROM circuits AS T1 INNER JOIN races AS T3 ON T1.circuitId = T3.circuitId INNER JOIN lapTimes AS T2 ON T3.raceId = T2.raceId WHERE T1.country = 'Italy'
SELECT T2.raceId FROM circuits AS T1 INNER JOIN results AS T2 ON T1.circuitId = T2.raceId WHERE T1.name = 'Austrian Grand Prix Circuit' ORDER BY T2.time LIMIT 1
SELECT T2.time, T2.duration FROM driverStandings AS T1 INNER JOIN races AS T3 ON T1.raceId = T3.raceId INNER JOIN pitStops AS T2 ON T3.raceId = T2.raceId INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T4.name = 'Austrian Grand Prix Circuit' AND T1.driverId = T2.driverId
SELECT T2.lat, T2.lng FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.fastestLapTime = '1:29.488'
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');
SELECT AVG(T1.milliseconds) FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.country = 'Italy'
SELECT T2.player_api_id FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.overall_rating DESC LIMIT 1
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE potential = ( SELECT MIN(potential) FROM Player_Attributes )
SELECT COUNT(id) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'
SELECT player_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5
SELECT league_id FROM Match WHERE season = '2015/2016' GROUP BY league_id ORDER BY SUM(home_team_goal, away_team_goal) DESC LIMIT 1
SELECT home_team_api_id FROM Match WHERE season = '2016/2017' AND SUBTRACT(home_team_goal, away_team_goal) < 0 GROUP BY home_team_api_id ORDER BY COUNT(home_team_api_id) ASC LIMIT 1
SELECT player_name FROM Player ORDER BY penalties DESC LIMIT 10
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T2.team_api_id = T1.away_team_api_id WHERE T1.season = '2009/2010' AND T2.team_api_id = T1.away_team_api_id AND T1.away_team_goal - T1.home_team_goal > 0 GROUP BY T1.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T4.buildUpPlaySpeed FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id INNER JOIN Match AS T3 ON T1.team_api_id = T3.away_team_api_id INNER JOIN Team_Attributes AS T4 ON T1.team_fifa_api_id = T4.team_fifa_api_id WHERE T4.buildUpPlaySpeed = ( SELECT MAX(T4.buildUpPlaySpeed) FROM Team_Attributes AS T4 UNION SELECT MAX(T4.buildUpPlaySpeed) FROM Team_Attributes AS T4 INNER JOIN Match AS T2 ON T4.team_fifa_api_id = T2.home_team_api_id INNER JOIN Match AS T3 ON T4.team_fifa_api_id = T3.away_team_api_id ) ORDER BY T4.buildUpPlaySpeed DESC LIMIT 4
SELECT T2.name FROM MATCH AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2016/2017' AND T1.home_team_goal = T1.away_team_goal GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T2.player_name, T2.birthday FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.sprint_speed >= 97 AND T1.date >= '2013-01-01 00:00:00' AND T1.date <= '2015-12-31 00:00:00'
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';
SELECT T1.player_api_id FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE substr(date, 1, 4) = '2010' GROUP BY T1.player_api_id HAVING avg(T1.overall_rating) = ( SELECT avg(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' )
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name IN ( SELECT team_long_name FROM Team_Attributes WHERE buildUpPlayPassing > 52 AND strftime('%Y', date) = '2012' ) AND strftime('%Y', T1.date) = '2012' GROUP BY T2.team_long_name HAVING AVG(buildUpPlayPassing) > ( SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' )
SELECT CAST(SUM(preferred_foot = 'left') AS REAL) / COUNT(player_fifa_api_id) * 100 FROM Player WHERE preferred_foot = 'left' AND STRFTIME('%Y', birthday) BETWEEN '1987' AND '1992'
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.name ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) ASC LIMIT 5
SELECT AVG(T1.long_shots) FROM Player_attributes AS T1 JOIN Player AS T2 ON T2.player_fifa_api_id = T1.player_fifa_api_id WHERE T2.player_name = 'Ahmed Samir Farag'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.height > 180 ORDER BY CAST(SUM(T1.heading_accuracy) AS REAL) / COUNT(T1.player_fifa_api_id) DESC LIMIT 10
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00' ORDER BY T2.chanceCreationPassing ASC
SELECT name FROM League WHERE id IN (SELECT league_id FROM Match WHERE season = '2009/2010' GROUP BY league_id HAVING AVG(home_team_goal) > AVG(away_team_goal))
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT T2.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE CAST(SUBSTR(birthday, 1, 4) AS INTEGER) = 1970 AND CAST(SUBSTR(birthday, 6, 2) AS INTEGER) = 10;
SELECT attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Franco Zennaro'
SELECT buildUpPlayPositioningClass FROM Team WHERE team_long_name  =  'ADO Den Haag'
SELECT T2.heading_accuracy FROM player AS T1 INNER JOIN player_attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.date = '2014-09-18 00:00:00' AND T1.player_name = 'Francois Affolter'
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Gabriel Tamas' AND strftime('%Y', T2.date) = '2011'
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League');
SELECT preferred_foot FROM Player ORDER BY birthday DESC LIMIT 1
SELECT player_name FROM Player ORDER BY potential DESC LIMIT 1
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'
SELECT t1.team_short_name FROM team AS t1 INNER JOIN team_attributes AS t2 ON t2.team_api_id = t1.team_api_id WHERE t2.chanceCreationPassingClass = 'Risky'
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'David Wilson';
SELECT T2.birthday FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T2.id = T1.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1
SELECT name FROM League WHERE country_id = (SELECT id FROM Country WHERE name = "Netherlands")
SELECT avg(T1.home_team_goal) FROM Country AS T2 INNER JOIN Match AS T1 ON T2.id = T1.country_id WHERE T2.name = 'Poland' AND T1.season = '2010/2011';
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height = ( SELECT max(height) FROM Player ) OR T1.height = ( SELECT min(height) FROM Player ) ORDER BY T2.finishing DESC
SELECT player_name FROM Player WHERE height  >  180;
SELECT COUNT(player_api_id) FROM Player WHERE strftime('%Y', birthday) = '1990'
SELECT COUNT(DISTINCT T1.player_name) FROM Player AS T1 INNER JOIN Team AS T2 ON T1.player_api_id = T2.team_api_id WHERE T1.player_name = 'Adam' AND T1.weight > 170
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating > 80 AND T2.date BETWEEN '2008-01-01' AND '2011-01-01'
SELECT potential FROM Player WHERE player_name = 'Aaron Doran'
SELECT player_name FROM Player WHERE preferred_foot = 'left'
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast';
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB';
SELECT T2.team_short_name FROM Team_attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > 70
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.date BETWEEN '2010-02-22 00:00:00' AND '2015-12-31 00:00:00' AND T2.height > 170
SELECT MIN(height) FROM Player
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A'
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Doran';
SELECT COUNT(*) FROM MATCH AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10'
SELECT DISTINCT T3.team_short_name FROM MATCH AS T1 INNER JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id INNER JOIN Team AS T3 ON T3.team_api_id = T1.home_team_api_id WHERE T1.home_team_goal = 10
SELECT player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id  =  T2.player_api_id WHERE T2.balance  =  (SELECT balance FROM Player_Attributes ORDER BY balance DESC LIMIT 1) AND T2.potential  =  61
SELECT AVG(T2.ball_control) - AVG(T1.ball_control) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo' AND T1.player_api_id = 505942
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_name FROM Player WHERE player_name = 'Aaron Lennon' UNION SELECT player_name FROM Player WHERE player_name = 'Abdelaziz Barrada' ORDER BY birthday DESC LIMIT 1
SELECT height FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.preferred_foot = 'left' AND T2.attacking_work_rate = 'low'
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Belgium Jupiler League'
SELECT T3.name FROM COUNTRY AS T1 JOIN LEAGUE AS T2 ON T1.id = T2.country_id JOIN COUNTRY AS T3 ON T3.id = T2.country_id WHERE T3.name = 'Germany'
SELECT player_name FROM Player ORDER BY overall_rating DESC LIMIT 1;
SELECT COUNT(T2.player_api_id) FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.birthday_id WHERE T2.birthday LIKE '____-01-__' AND T2.birthday_id LIKE '____-02-__' AND T2.birthday_id LIKE '____-03-__' AND T2.birthday_id LIKE '____-04-__' AND T2.birthday_id LIKE '____-05-__' AND T2.birthday_id LIKE '____-06-__' AND T2.birthday_id LIKE '____-07-__' AND T2.birthday_id LIKE '____-08-__' AND T2.birthday_id LIKE '____-09-__' AND T2.birthday_id LIKE '____-10-__' AND T2.birthday_id LIKE '____-11-__' AND T2.birthday_id LIKE '____-12-__' AND T2.birthday_id LIKE '____-01-__' AND T2.birthday_id LIKE '____-02-__' AND T2.birthday_id LIKE '____-03-__' AND T2.birthday_id LIKE '____-04-__' AND T2.birthday_id LIKE '____-05-__' AND T2.birthday_id LIKE '____-06-__' AND T2.birthday_id LIKE '____-07-__' AND T2.birthday_id LIKE '____-08-__' AND T2.birthday_id LIKE '____-09-__' AND T2.birthday_id LIKE '____-10-__' AND T2.birthday_id LIKE '____-11-__' AND T2.birthday_id LIKE '____-12-__' AND T2.birthday_id LIKE '____-01-__' AND T2.birthday_id LIKE '____-02-__' AND T2.birthday_id LIKE '____-03-
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.crossing = ( SELECT MAX(crossing) FROM Player_Attributes )
SELECT T2.heading_accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T2.player_api_id = T1.player_api_id WHERE T1.player_name = 'Ariel Borysiuk'
SELECT COUNT(T2.volleys) FROM player_attributes AS T2 INNER JOIN player AS T1 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id  =  T2.player_api_id WHERE T2.volleys  >  70 AND T2.dribbling  >  70
SELECT COUNT(*) FROM Match AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009'
SELECT T1.long_passing FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday ASC LIMIT 1
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04'
SELECT league_id FROM Match WHERE season = '2008/2009' GROUP BY league_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'
SELECT CAST(SUM(CASE WHEN T1.player_name = 'Ariel Borysiuk' THEN T1.overall_rating ELSE 0 END) - SUM(CASE WHEN T1.player_name = 'Paulin Puel' THEN T1.overall_rating ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.player_name = 'Paulin Puel' THEN T1.overall_rating ELSE 0 END) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'Heart of Midlothian';
SELECT AVG(T1.overall_rating) FROM Player_attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';
SELECT SUM(T1.crossing) FROM Match AS T1 INNER JOIN Player AS T2 ON T1.away_player_1 = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'
SELECT T1.chanceCreationPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Ajax' ORDER BY T1.chanceCreationPassing DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE player_id = (SELECT id FROM Player WHERE player_name = 'Abdou Diallo')
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Dorlan Pabon' ORDER BY T2.overall_rating DESC LIMIT 1
SELECT AVG(T1.away_team_goal) FROM match AS T1 INNER JOIN team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Parma'
SELECT T2.player_name FROM player_attributes AS T1 JOIN player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = 77 AND strftime('%Y-%m-%d', T1.`date`) = '2016-06-23' ORDER BY T2.birthday LIMIT 1
SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Aaron Mooy' AND date = '2016-02-04 00:00:00'
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00'
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.date = '2015-05-01 00:00:00' AND T2.player_name = 'Francesco Migliore'
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'
SELECT MIN(T1.date) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.crossing = ( SELECT MAX(crossing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Kevin Constant' );
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.date = '2012-02-22 00:00:00' AND T1.team_long_name = 'Willem II'
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00'
SELECT T1.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.date = '2010-02-22' AND T1.team_long_name = 'FC Lorient'
SELECT T4.chanceCreationPassingClass FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id INNER JOIN Team_Attributes AS T3 ON T3.team_api_id = T2.team_api_id INNER JOIN Player_Attributes AS T4 ON T4.player_api_id = T1.home_player_1 WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date = '2013-09-20 00:00:00'
SELECT T1.ChanceCreationCrossingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hull City' AND T1.date = '2010-02-22 00:00:00'
SELECT T4.defenceAggressionClass FROM Player AS T1 INNER JOIN Match AS T2 ON T1.player_api_id = T2.home_player_1 OR T1.player_api_id = T2.home_player_2 OR T1.player_api_id = T2.home_player_3 OR T1.player_api_id = T2.home_player_4 OR T1.player_api_id = T2.home_player_5 OR T1.player_api_id = T2.home_player_6 OR T1.player_api_id = T2.home_player_7 OR T1.player_api_id = T2.home_player_8 OR T1.player_api_id = T2.home_player_9 OR T1.player_api_id = T2.home_player_10 OR T1.player_api_id = T2.home_player_11 OR T1.player_api_id = T2.away_player_1 OR T1.player_api_id = T2.away_player_2 OR T1.player_api_id = T2.away_player_3 OR T1.player_api_id = T2.away_player_4 OR T1.player_api_id = T2.away_player_5 OR T1.player_api_id = T2.away_player_6 OR T1.player_api_id = T2.away_player_7 OR T1.player_api_id = T2.away_player_8 OR T1.player_api_id = T2.away_player_9 OR T1.player_api_id = T2.away_player_10 OR T1.player_api_id = T2.away_player_11 INNER JOIN Team AS T3 ON T3.team_api_id = T2.home_team_api_id OR T3.team_api_id = T2.away_team_api_id INNER JOIN Team_Attributes AS T4 ON T4.team_api_id = T3.team_api_id WHERE T3.team_long_name = 'Hannover 96' AND T2.
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND T2.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';
SELECT CAST(100 * ( SELECT T2.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player_Attributes AS T2 ON T1.date = T2.date WHERE T1.player_name = 'Landon Donovan' AND T2.player_name = 'Jordan Bowery' AND T1.date BETWEEN '2013-07-12' AND '2013-07-12' ) AS REAL) / T1.overall_rating FROM Player_Attributes AS T1 WHERE T1.player_name = 'Landon Donovan'
SELECT T2.player_name FROM player_attributes AS T1 JOIN player AS T2 ON T2.player_api_id = T1.player_api_id ORDER BY T1.height DESC LIMIT 5
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT T1.player_name FROM Player AS T1 INNER JOIN Country AS T2 ON T1.birthday = T2.id WHERE datetime('now','localtime') - datetime(T1.birthday) >= 35
SELECT home_team_goal FROM Match WHERE away_player_11 = 162549
SELECT SUM(T1.away_team_goal) FROM Match AS T1 INNER JOIN Player AS T2 ON T1.away_player_1 = T2.player_api_id WHERE T2.player_name = 'Daan Smith' INTERSECT SELECT SUM(T1.away_team_goal) FROM Match AS T1 INNER JOIN Player AS T2 ON T1.away_player_1 = T2.player_api_id WHERE T2.player_name = 'Filipe Ferreira'
SELECT COUNT(home_team_goal) FROM Match WHERE SUBSTR(strftime('%Y', DATETIME('now')), 1, 4) - SUBSTR(birthday, 1, 4) - (strftime('%m', DATETIME('now')) - strftime('%m', birthday) < 0) - (strftime('%m', DATETIME('now')) - strftime('%m', birthday) = 0 AND strftime('%d', DATETIME('now')) - strftime('%d', birthday) < 30) < 31
SELECT player_name FROM player ORDER BY overall_rating DESC LIMIT 10
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.potential DESC LIMIT 1
SELECT DISTINCT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id WHERE T1.attacking_work_rate = 'high'
SELECT player_name FROM Player WHERE player_api_id IN ( SELECT player_api_id FROM Player_Attributes WHERE finishing = 1 ORDER BY CAST(strftime('%s', birthday) AS INTEGER) DESC LIMIT 1 )
SELECT T1.player_name FROM player AS T1 JOIN country AS T2 ON T1.birthday = T2.id WHERE T2.name = 'Belgium'
SELECT T2.name FROM Player AS T1 JOIN Country AS T2 ON T1.birthday = T2.name WHERE T1.vision > 89
SELECT T1.name FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id GROUP BY T2.country_id ORDER BY AVG(T2.weight) DESC LIMIT 1
SELECT T1.team_long_name FROM team AS T1 INNER JOIN team_attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow';
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.chanceCreationPassingClass = 'Safe'
SELECT AVG(T1.height) FROM player AS T1 INNER JOIN country AS T2 ON T1.birthday = T2.id WHERE T2.name = 'Italy'
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 ORDER BY T2.player_name LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'
SELECT jumping - 23 FROM Player WHERE id = 6
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 3
SELECT COUNT(id) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = ( SELECT MAX(crossing) FROM Player_Attributes )
SELECT CAST(COUNT(CASE WHEN stamina > 80 AND strength > 80 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id JOIN Match AS T3 ON T2.id = T3.league_id WHERE T3.away_team_api_id = ( SELECT team_api_id FROM Team WHERE team_long_name = 'Poland Ekstraklasa' )
SELECT T2.home_team_goal, T2.away_team_goal FROM Team AS T1 INNER JOIN Match AS T2 ON T2.home_team_api_id = T1.team_api_id WHERE T2.date LIKE '2008-09-24%' AND T1.team_long_name = 'KRC Genk'
SELECT sprint_speed ,  agility ,  acceleration FROM Player WHERE player_name = 'Alexis Blin'
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'KSV Cercle Brugge'
SELECT COUNT(*) FROM Match WHERE season = '2015/2016'
SELECT MAX(home_team_goal) FROM Match WHERE country_id IN (SELECT id FROM Country WHERE name = 'Netherlands') AND league_id IN (SELECT id FROM League WHERE name = 'Netherlands Eredivisie')
SELECT CAST(SUM(finishing) AS REAL) * 100 / COUNT(*) AS finishing_rate, curve FROM Player_Attributes WHERE weight = ( SELECT MAX(weight) FROM Player )
SELECT T.name FROM League AS T INNER JOIN Match AS S ON T.id = S.league_id WHERE S.season = '2015/2016' GROUP BY T.id ORDER BY COUNT(S.id) DESC LIMIT 1
SELECT T4.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id INNER JOIN Team AS T4 ON T2.team_api_id = T4.team_api_id ORDER BY T1.away_team_goal DESC LIMIT 1
SELECT player_name FROM Player ORDER BY overall_rating DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.height < 180 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id
SELECT CASE WHEN COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN ID ELSE NULL END) > COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN ID ELSE NULL END) THEN 'In-patient' ELSE 'Outpatient' END AS 'More in-patient or outpatient',        CAST(ABS(COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN ID ELSE NULL END) - COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN ID ELSE NULL END)) AS REAL) * 100 / GREATEST(COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN ID ELSE NULL END), COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN ID ELSE NULL END)) AS 'Deviation in percentage' FROM Patient
SELECT CAST(COUNT(CASE WHEN SUBSTR(Birthday, 1, 4) > '1930' AND SEX = 'F' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(ID) FROM Patient
SELECT CAST(COUNT(CASE WHEN Admission = '+' THEN ID ELSE NULL END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE STRFTIME('%Y', Birthday) BETWEEN '1930' AND '1940';
SELECT CAST(COUNT(CASE WHEN Admission = '+' THEN 1 ELSE NULL END) AS REAL) / COUNT(ID) FROM Patient WHERE Diagnosis = 'SLE'
SELECT T1.Diagnosis, T2.`Date` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609;
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 163109;
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500
SELECT T1.ID, EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+';
SELECT T2.ID, T2.SEX, T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 2
SELECT T1.ID, T2.Description FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) = 1937 AND T2.`T-CHO` >= 250
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ALB < 3.5
SELECT CAST(COUNT(CASE WHEN T1.SEX = 'F' AND (T1.TP < '6.0' OR T1.TP > '8.5') THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID
SELECT AVG(T1.`aCL IgG`) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+' AND YEAR(CURRENT_TIMESTAMP) - YEAR(T2.Birthday) >= 50
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-';
SELECT T2.YEAR - T1.YEAR FROM Patient AS T1 INNER JOIN ( SELECT ID, MAX(YEAR(`First Date`)) AS YEAR FROM Patient GROUP BY ID ) AS T2 ON T1.ID = T2.ID
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE `Thrombosis` = 1) AND SEX = 'F' AND `Examination Date` = '1997-05-27'
SELECT t1.YEAR(Birthday) FROM ( SELECT EXTRACT(YEAR FROM Birthday) FROM Patient ORDER BY YEAR(Birthday) ASC LIMIT 1 ) t1 , ( SELECT EXTRACT(YEAR FROM Birthday) FROM Patient ORDER BY YEAR(Birthday) DESC LIMIT 1 ) t2;
SELECT T1.SYMPTOMS FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T1.Birthday ASC LIMIT 1;
SELECT CAST(COUNT(T1.ID) AS REAL) / 12 AS AVG_TESTED FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT T2.Date, YEAR(Birthday) - YEAR(T1.`First Date`) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' ORDER BY T1.Birthday ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN SEX = 'M' AND UA <= 8 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN SEX = 'F' AND UA <= 6.5 THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT COUNT(T1.ID) FROM Patient AS T1 LEFT JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` IS NULL OR YEAR(T2.`Examination Date`) - YEAR(T2.`First Date`) >= 1
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > DATE('1990-01-01') AND T1.Birthday < DATE('1993-12-31') AND T2.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31'
SELECT count(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-BIL` > '2.0'
SELECT TOP 1 COUNT(DISTINCT e.Diagnosis) as cnt, e.Diagnosis FROM Examination AS e WHERE e.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY e.Diagnosis ORDER BY cnt DESC
SELECT AVG(YEAR(Birthday)) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE Date BETWEEN '1991-10-01' AND '1991-10-30');
SELECT T1.Sex, T1.Description - T1.First_Date AS age, T3.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID ORDER BY T3.HGB DESC LIMIT 1
SELECT T2.`ANA` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` = '1996-12-02' AND T1.ID = 3605340
SELECT T1.TG FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`Date` = '1995-09-04' AND T1.ID = 2927464
SELECT T2.SEX FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'AORTITIS' ORDER BY T1.ID ASC LIMIT 1
SELECT T2.`aCL IgM` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Description = '1993-11-12' AND T1.Diagnosis = 'SLE'
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date = '1992-06-12' AND T2.GPT = 9
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UA = '8.4' AND T2.`Date` = '1991-10-21'
SELECT COUNT(*) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE `First Date` = '1991-06-13' AND Diagnosis = 'SJS') AND YEAR(Date) = 1995
SELECT T1.diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.`First Date` = '1997-01-27'
SELECT t1.symptoms FROM examination AS t1 INNER JOIN patient AS t2 ON t1.id = t2.id WHERE t2.birthday = '1959-03-01' AND t1.`examination date` = '1993-09-27'
SELECT SUM(T1.`T-CHO`) - SUM(T2.`T-CHO`) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date LIKE '1981-11-%' AND T2.Birthday = '1959-02-18' AND T2.Description = '1981-12-%'
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Description >= '1970-01-01' AND T2.Description <= '1997-12-31' AND T1.Diagnosis = 'Behcet'
SELECT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1987-07-06' AND '1996-01-31' AND T1.GPT > 30 AND T1.ALB < 4
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2 AND T2.ANA = 'S' AND T2.`aCL IgM` > (SELECT AVG(`aCL IgM`) FROM Examination WHERE Thrombosis = 2)
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.`U-PRO` > 0 AND T3.`U-PRO` < 30
SELECT CAST(COUNT(CASE WHEN T2.SEX = 'M' THEN T1.ID END) AS REAL) * 100 / COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.`First Date`) = '1981' AND T1.Diagnosis = 'BEHCET'
SELECT T1.SEX, T2.T_BIL FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date LIKE '1991-10%' AND T2.T_BIL < 2.0 AND T1.Admission = '-'
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T1.Birthday BETWEEN '1980-01-01' AND '1989-12-31'
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123
SELECT AVG(T1.ALB) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.SEX = 'F' AND T1.Diagnosis = 'SLE' AND T3.PLT > 400
SELECT Symptoms FROM Patient WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(Symptoms) DESC LIMIT 1
SELECT T1.Description, T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473 ORDER BY T1.Description ASC LIMIT 1
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE YEAR(T2.`Examination Date`) = '1997' AND T3.TP > 6 AND T3.TP < 8.5
SELECT CAST(SUM(CASE WHEN T.Symptoms LIKE '%Thrombocytopenia%' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Patient AS P INNER JOIN Examination AS E ON P.ID = E.ID INNER JOIN Laboratory AS T ON P.ID = T.ID
SELECT CAST(COUNT(*) FILTER (WHERE (strftime('%Y', BIRTHDAY) = '1980') AND (SEX = 'F') AND (Diagnosis = 'RA')) AS REAL) * 100 / COUNT(*) FROM Patient
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`Examination Date` BETWEEN '1995' AND '1997' AND T2.Diagnosis = 'BEHCET' AND T1.Admission = '-';
SELECT count(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM Patient WHERE ID = 821298
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.UA > 8.0 OR T1.SEX = 'F' AND T2.UA > 6.5 AND T1.ID = 57266
SELECT `Examination Date` FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE ID = 48473 AND GOT >= 60
SELECT T2.SEX, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`GOT` < 60 AND YEAR(T1.Date) = 1994
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.SEX = 'M' AND T3.GPT >= 60
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday DESC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500
SELECT T2.ID ,  YEAR(CURRENT_TIMESTAMP) - YEAR(T2.Birthday) AS age FROM Patient AS T2 INNER JOIN Examination AS T1 ON T1.ID = T2.ID WHERE T1.`Lactate Dehydrogenase` BETWEEN 600 AND 800
SELECT T1.admission, COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ALP < 300 GROUP BY T1.admission
SELECT t1.id FROM Patient AS t1 INNER JOIN Examination AS t2 ON t1.id = t2.id WHERE strftime('%m-%d', t1.birthday) = '04-01' AND t2.ALP < 300
SELECT T1.ID ,  T1.SEX ,  T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6
SELECT T1.SEX, T1.Tp - 8.5 AS deviation FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.Tp > 8
SELECT T2.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.ALB <= 3.5 OR T2.ALB >= 5.5 ORDER BY T2.Birthday DESC
SELECT CASE WHEN T1.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) = 1982
SELECT CAST(SUM(CASE WHEN UA > 8.0 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID
SELECT AVG(T1.UA) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` IS NOT NULL AND T2.`aCL IgM` IS NOT NULL AND T2.`Examination Date` IN ( SELECT T2.`Examination Date` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` IS NOT NULL AND T2.`aCL IgM` IS NOT NULL ORDER BY T2.`Examination Date` DESC LIMIT 1 )
SELECT T1.ID ,  T1.SEX ,  T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID  =  T2.ID WHERE T2.UN = 29
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'RA' AND T2.UN < 30
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.CRE >= 1.5 AND T1.SEX = 'M'
SELECT CASE WHEN SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) THEN 1 ELSE 0 END FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.CRE >= 1.5
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` = ( SELECT MAX(`T-BIL`) FROM Examination )
SELECT SEX FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE `T-BIL` >= 2.0 ) GROUP BY SEX
SELECT T.ID, T.T_CHO FROM ( SELECT P.ID, L.`T-CHO` FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID ORDER BY P.Birthday ASC ) AS T ORDER BY T.`T-CHO` DESC LIMIT 1
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(T2.birthday))  FROM Patient AS T1  INNER JOIN Examination AS T3 ON T1.ID = T3.ID  WHERE T1.SEX = 'M' AND T3.`T-CHO` >= 250
SELECT T2.diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.TG > 300
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG >= 200 AND (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday)) > 50
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) BETWEEN 1936 AND 1956 AND T1.SEX = 'M' AND T2.CPK >= 250
SELECT T2.ID, T2.SEX, T2.Birthday, TIMESTAMPDIFF(YEAR, T2.Birthday, CURRENT_DATE) AS age FROM Patient AS T2 INNER JOIN Laboratory AS T1 ON T2.ID = T1.ID WHERE T1.GLU >= 180 AND T1.`T-CHO` < 250
SELECT T2.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` > '1990-12-31' AND T2.GLU < 180
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.WBC < = 3.5 OR T2.WBC > = 9.0 GROUP BY T1.SEX ORDER BY T1.Birthday
SELECT ID, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', Birthday) AS age FROM Patient WHERE Diagnosis IS NOT NULL AND RBC < 3.5
SELECT T2.Admission FROM Patient AS T1  INNER JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T1.SEX = 'F' AND  T1.Birthday <= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 50 YEAR) AND  (T2.RBC <= 3.5 OR T2.RBC >= 6.0)
SELECT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.HGB < 10
SELECT ID, SEX FROM Patient WHERE Diagnosis = 'SLE' ORDER BY Birthday DESC LIMIT 1
SELECT T1.ID, T2.HCT FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T1.ID) >= 2
SELECT AVG(HCT) FROM Laboratory WHERE STRFTIME('%Y', `Date`) = '1991' AND HCT < 29
SELECT SUM(IIF(PLT < 100, 1, 0)) AS lower_than_normal, SUM(IIF(PLT > 400, 1, 0)) AS higher_than_normal, SUM(IIF(PLT < 100, 1, 0)) - SUM(IIF(PLT > 400, 1, 0)) AS difference FROM Laboratory
SELECT T2.ID, T2.SEX, T2.Birthday, T2.Description, T2.`First Date`, T2.Admission, T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date LIKE '1984%' AND T2.Birthday IS NOT NULL AND SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(T2.Birthday)) < 50 AND T1.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(IIF(YEAR(GETDATE()) - YEAR(T2.Birthday) > 55, IIF(T1.Sex = 'F' AND T1.PT >= 14, 1, 0), 0)) AS FLOAT) * 100 / COUNT(IIF(YEAR(GETDATE()) - YEAR(T2.Birthday) > 55, IIF(T1.Sex = 'F' AND T1.PT >= 14, 1, 0), 0)) AS [Percentage of female who has abnormal prothrombin time] FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID
SELECT P.* FROM Patient AS P INNER JOIN Examination AS E ON P.ID = E.ID WHERE YEAR(P.`First Date`) > 1992 AND E.PT < 14
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID NOT IN (SELECT ID FROM Patient GROUP BY ID HAVING COUNT(ID) > 1) AND T2.APTT > 45 AND T2.Thrombosis = 3
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND T2.FG BETWEEN 150 AND 450
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T2.ID = T1.ID WHERE T1.`U-PRO` >= 30
SELECT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.`U-PRO` BETWEEN 0 AND 30
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgG` < 900 AND T2.Symptoms = 'abortion'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgG` BETWEEN 900 AND 2000 AND T2.Symptoms IS NOT NULL
SELECT T1.diagnosis FROM patient AS T1 INNER JOIN Examination AS T2 ON T1.id = T2.id WHERE T2.`aCL IgA` BETWEEN 80 AND 500 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` BETWEEN 80 AND 500 AND YEAR(T1.`First Date`) >= 1990
SELECT Diagnosis FROM Examination WHERE IGM NOT BETWEEN 40 AND 400 GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRP LIKE '+' OR T2.CRP LIKE '-' OR T2.CRP < 1.0 AND T1.Description IS NULL
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T3.CRP NOT IN ('+-', '-') AND T3.CRP >= 1.0 AND T1.Description > 0 AND ((CURRENT_DATE - T1.Birthday) / INTERVAL 1 YEAR < 18);
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.KCT = '+' AND T2.`Rh` LIKE '%-%'
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1995-01-01' AND T2.RA = '-';
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RF = 'normal' AND T1.Birthday > DATE_SUB(CURDATE(), INTERVAL 60 YEAR)
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.RF < 20 AND T2.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description > 0 AND T2.ANA Pattern = 'P'
SELECT `aCL IgA` FROM Examination WHERE `aCL IgA` > 0 ORDER BY `aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = 'APS' AND T1.C4 > 10
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RNP = '-' AND T1.Admission = '+';
SELECT `First Date` FROM Patient WHERE ID = ( SELECT ID FROM Laboratory WHERE `RNP` NOT IN ('-', '+-') ORDER BY `RNP` DESC LIMIT 1 )
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.`SM 0` IS NULL AND T3.`SM 1` IS NULL AND T2.Thrombosis = 1
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('-', '+-') AND T2.`Examination Date` IN ( SELECT T2.`Examination Date` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 3 ) ORDER BY T1.Birthday LIMIT 3
SELECT T2.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` >= '1997-01-01' AND T1.SC170 IN ('-', '+-')
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.SC170 = '-' AND T2.symptoms LIKE '%vertigo%'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.`SSA` IN ('-', '+-') AND YEAR(T1.`First Date`) < 1990
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`SSA Pattern` NOT IN ('-', '+-') ORDER BY T1.`First Date` LIMIT 1
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T2.SSB IN ('-', '0')
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSB = '-' OR T2.SSB = '+-' AND T2.Symptoms IS NOT NULL
SELECT COUNT(T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND T1.CENTROMEA IN ('-', '+-') AND T1.SSB IN ('-', '+-')
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA >= 8
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.Description IS NULL AND T3.DNA >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.`DNA-II` < 8 AND T2.Admission = '+'
SELECT CAST(COUNT(DISTINCT T2.ID) AS REAL) * 100 / COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`GOT` >= 60 AND T2.Diagnosis = 'SLE'
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60
SELECT MIN(T2.Birthday) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GOT >= 60
SELECT T1.Birthday, T1.Description, T1.`First Date`, T1.Admission, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60
SELECT MIN(`First Date`) FROM Patient WHERE ID IN ( SELECT ID FROM Patient WHERE LDH < 500 AND `First Date` IS NOT NULL )
SELECT T2.`First Date` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH >= 500 ORDER BY T2.`First Date` DESC LIMIT 1
SELECT COUNT(T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALP >= 300 AND T2.Admission = '+'
SELECT COUNT(ID) FROM Patient WHERE Admission = '-' AND ALP < 300;
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.TP < 6.0
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T3.ID = T2.ID WHERE T1.Diagnosis = 'SJS' AND T3.TP BETWEEN 6.0 AND 8.5
SELECT `Examination Date` FROM Examination WHERE `aCL IgA` > 3.5 AND `aCL IgA` < 5.5 ORDER BY `aCL IgA` DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.ALB > 3.5 AND T2.ALB < 5.5 AND T2.TP BETWEEN 6.0 AND 8.5
SELECT T1.`aCL IgG`, T1.`aCL IgM`, T1.`aCL IgA` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.SEX = 'F' AND T3.UA > 6.5 ORDER BY T3.UA DESC LIMIT 1
SELECT MAX(ANA) FROM Examination WHERE CRE < 1.5
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.CRE < 1.5 ORDER BY T3.aCL_IgA DESC LIMIT 1
SELECT COUNT(T2.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` >= 2.0 AND T2.`ANA Pattern` LIKE '%P%'
SELECT T1.`aCL IgA` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` < 2 ORDER BY T1.`T-BIL` DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`T-CHO` >= 250 AND T1.KCT = '-'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` < 250 AND T2.`ANA Pattern` = 'P'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 AND T2.Symptoms IS NOT NULL
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T2.TG DESC LIMIT 1
SELECT ID FROM Patient WHERE Thrombosis = 0 AND CPK < 250
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` IS NOT NULL AND T2.`aCL IgA` < 250 AND (T2.KCT = '+' OR T2.RVVT = '+' OR T2.LAC = '+')
SELECT MIN(T1.Birthday) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU > 180
SELECT COUNT(*) FROM Patient WHERE ID IN ( SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GLU < 180 ) AND Thrombosis = 0;
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT T2.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE (T3.RBC <= 3.5 OR T3.RBC >= 6.0) AND T2.Admission = '-'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.PLT > 100 AND T3.PLT < 400 AND T2.Diagnosis IS NOT NULL
SELECT T1.PLT FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'MCTD' AND T1.PLT >= 100 AND T1.PLT <= 400
SELECT AVG(PT) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND PT < 14
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 1 OR T2.Thrombosis = 2 AND T2.PT < 14
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Angela' AND T2.last_name = 'Sanders'
SELECT COUNT(DISTINCT T2.member_id) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.college = 'College of Engineering';
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design'
SELECT COUNT(*) FROM ATTENDANCE WHERE LINK_TO_EVENT = (SELECT event_id FROM EVENT WHERE event_name = 'Women''s Soccer')
SELECT T2.phone FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women''s Soccer'
SELECT COUNT(CASE WHEN T2.t_shirt_size = 'Medium' THEN 1 ELSE NULL END) FROM event AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Women''s Soccer'
SELECT T2.event_name FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN attendance AS T3 ON T2.member_id = T3.link_to_member
SELECT college FROM major WHERE position = 'Vice President' AND major_name = 'Student Club';
SELECT T2.event_name FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean'
SELECT count(*) FROM `event` AS T1 INNER JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event INNER JOIN `member` AS T3 ON T3.member_id = T2.link_to_member WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND YEAR(T1.event_date) = 2019
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND event_id IN (SELECT link_to_event FROM attendance GROUP BY link_to_event HAVING COUNT(link_to_member) > 10)
SELECT T2.event_name FROM attendance AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T2.type = 'Student_Club' GROUP BY T2.event_id HAVING COUNT(T2.event_id) > 20
SELECT CAST(COUNT(DISTINCT T2.event_name) AS REAL) * 100 / COUNT(T2.event_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE strftime('%Y', T1.event_date) = '2020'
SELECT MAX(cost) FROM expense
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering' AND T1.email LIKE 'student_club%'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'
SELECT T2.last_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name LIKE 'Law and Constitutional Studies'
SELECT T3.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code INNER JOIN zip_code AS T3 ON T3.zip_code = T1.zip WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'
SELECT college FROM major WHERE major_id IN ( SELECT link_to_major FROM member WHERE first_name = 'Tyler' AND last_name = 'Hewitt' )
SELECT SUM(T1.amount) FROM income AS T1 INNER JOIN member AS T2 ON T2.member_id = T1.link_to_member WHERE T2.position = 'Vice President'
SELECT T2.spent FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Food'
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'
SELECT T3.first_name, T3.last_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T2.location = 'Illinois'
SELECT SUM(T2.spent) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Advertisement'
SELECT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Pierce' AND T2.last_name = 'Guidi'
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'
SELECT expense_id FROM expense WHERE expense_date = '2019-10-08' AND approved = True
SELECT AVG(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Elijah' AND T1.last_name = 'Allen' AND STRFTIME('%m', T2.expense_date) IN ('09', '10')
SELECT SUM(T1.spent) - SUM(T1.spent) AS diff FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE SUBSTR(T2.event_date, 1, 4) = '2019'
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT cost FROM expense WHERE expense_description = 'Poster' AND expense_date = '2019-09-04';
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Adela' AND T2.last_name = 'O''Gallagher'
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.remaining < 0 AND T2.event_name = 'November Meeting'
SELECT SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker';
SELECT T1.event_status FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_date = '2019-08-20' AND T3.expense_description = 'Post Cards, Posters'
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'
SELECT count(*) FROM member WHERE link_to_major = ( SELECT major_id FROM major WHERE major_name = 'Human Development and Family Studies' ) AND t_shirt_size = 'Large'
SELECT T1.type FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielsen';
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'
SELECT T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T2.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'President'
SELECT DISTINCT date_received FROM income WHERE source = 'Dues' AND first_name = 'Connor' AND last_name = 'Hilton'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.source = 'Dues' ORDER BY T2.date_received ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement'
SELECT ( SELECT CAST(SUM(T1.amount) AS REAL) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.category = 'Parking' AND T2.event_name = 'November Speaker' ) * 100.0 / ( SELECT SUM(amount) FROM expense WHERE link_to_budget = ( SELECT budget_id FROM budget WHERE event_name = 'November Speaker' ) )
SELECT SUM(T2.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Pizza'
SELECT COUNT(city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT T2.city, T2.county, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T1.expense_description FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.remaining = ( SELECT MIN(remaining) FROM budget )
SELECT T3.first_name, T3.last_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'October Meeting'
SELECT college FROM major GROUP BY college ORDER BY count(*) DESC LIMIT 1
SELECT T3.major_name FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.phone = '809-555-3360'
SELECT event_name FROM event ORDER BY amount DESC LIMIT 1
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'
SELECT count(*) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer';
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'
SELECT count(T1.zip) FROM member AS T1 INNER JOIN zip_code AS T2 ON T2.zip_code = T1.zip WHERE T2.state = 'Maryland'
SELECT count(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event INNER JOIN member AS T3 ON T3.member_id = T1.link_to_member WHERE T3.phone = '954-555-6240'
SELECT T2.first_name, T2.last_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.department = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President';
SELECT MAX(spent) FROM budget
SELECT COUNT(event_id) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food';
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T2.link_to_member HAVING COUNT(T2.link_to_event) > 7
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN attendance AS T3 ON T1.member_id = T3.link_to_member INNER JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T2.major_name = 'Interior Design' AND T4.event_name = 'Community Theater'
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina')
SELECT amount FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour')
SELECT first_name, last_name FROM member WHERE member_id IN ( SELECT link_to_member FROM income WHERE amount > 50 )
SELECT SUM(T2.cost) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T1.event_name LIKE 'Baseball game' AND T1.type = 'Game'
SELECT first_name, last_name FROM member INNER JOIN budget ON member.member_id = budget.link_to_member WHERE event_name = 'Yearly Kickoff';
SELECT T2.first_name, T2.last_name, T1.source FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id ORDER BY T1.amount DESC LIMIT 1
SELECT event_name FROM event ORDER BY cost ASC LIMIT 1
SELECT CAST(SUM(T1.cost) AS REAL) * 100 / SUM(T2.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.event_status = 'Closed'
SELECT SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major
SELECT TOP 1 source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'
SELECT COUNT(*) FROM member WHERE link_to_major = ( SELECT major_id FROM major WHERE major_name = 'Physics Teaching' )
SELECT COUNT(T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND YEAR(T1.event_date) = 2019
SELECT COUNT(T1.link_to_event) AS num_events, T2.major_name FROM attendance AS T1 INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id INNER JOIN major AS T2 ON T3.link_to_major = T2.major_id WHERE T3.first_name = 'Luisa' AND T3.last_name = 'Guidi' GROUP BY T2.major_name
SELECT AVG(T2.spent) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_status = 'Closed' AND T2.category = 'Food'
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement' ORDER BY T1.spent DESC LIMIT 1
SELECT CASE WHEN link_to_event = 'rec2N69DMcrqN9PJC' THEN 'Yes' ELSE 'No' END FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Maya' AND last_name = 'Mclean');
SELECT CAST(SUM(CASE WHEN T2.type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 INNER JOIN event AS T2 ON T2.event_date BETWEEN '2019-01-01' AND '2019-12-31'
SELECT T2.cost FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name LIKE '%September Speaker%' AND T1.expense_description = 'Posters'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1
SELECT event_name FROM event WHERE status = 'Closed' ORDER BY remaining ASC LIMIT 1
SELECT T1.expense_description, SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' GROUP BY T1.expense_description
SELECT category FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'April Speaker') ORDER BY amount
SELECT MAX(amount) FROM budget WHERE category = 'Food';
SELECT TOP 3 amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC
SELECT sum(cost) FROM expense WHERE expense_description = 'Parking'
SELECT SUM(T2.cost) FROM expense AS T1 INNER JOIN event AS T3 ON T1.link_to_budget = T3.event_id WHERE T3.event_date = '2019-08-20'
SELECT T2.first_name, T2.last_name, SUM(T1.cost) FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.member_id = 'rec4BLdZHS2Blfp4v'
SELECT expense_description FROM expense WHERE link_to_member IN ( SELECT member_id FROM member WHERE first_name = 'Sacha' AND last_name = 'Harrison' )
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'
SELECT T1.zip FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount < 50
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'
SELECT position FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'
SELECT count(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium'
SELECT T2.type FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.remaining > 30
SELECT category FROM budget WHERE link_to_event IN ( SELECT event_id FROM event WHERE LOCATION = 'MU 215' )
SELECT category FROM event WHERE event_date = '2020-03-24T12:00:00';
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT CAST(SUM(CASE WHEN T2.major_name = 'Mathematics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 LEFT JOIN major AS T2 ON T2.major_id = T1.link_to_major
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'
SELECT count(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'
SELECT T2.last_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Environmental Engineering'
SELECT b.category FROM budget AS b INNER JOIN event AS e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0
SELECT T1.city, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.position = 'Member' AND T2.link_to_major IN ( SELECT major_id FROM major WHERE department = 'Electrical and Computer Engineering Department' )
SELECT T1.event_name FROM event AS T1 INNER JOIN member AS T2 ON T1.link_to_event = T2.member_id WHERE T2.position = 'Vice President' AND T2.position = 'Student_Club'
SELECT T1.last_name, T1.position FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_date = '2019-09-10' AND T2.expense_description = 'Pizza'
SELECT t1.last_name FROM member AS t1 INNER JOIN attendance AS t2 ON t1.member_id = t2.link_to_member INNER JOIN event AS t3 ON t2.link_to_event = t3.event_id WHERE t3.event_name = 'Women''s Soccer'
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'
SELECT T2.state FROM zip_code AS T1 INNER JOIN event AS T2 ON T1.zip_code = T2.zip WHERE T1.type = 'PO Box'
SELECT T1.zip_code FROM zip_code AS T1 INNER JOIN event AS T2 ON T1.city = T2.location WHERE T1.type = 'PO Box' AND T1.short_state = 'PR'
SELECT event_name FROM event WHERE event_date BETWEEN '2019-03-15' AND '2020-03-20' AND type = 'Game' AND status = 'Closed'
SELECT link_to_event FROM expense WHERE cost > 50
SELECT T2.first_name, T2.last_name, T2.email, T2.position, T2.t_shirt_size, T2.phone, T2.zip, T2.link_to_major, T1.link_to_member, T1.link_to_budget FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT college FROM major WHERE major_id = ( SELECT link_to_major FROM member WHERE first_name = 'Katy' AND link_to_major = 'rec1N0upiVLy5esTO' )
SELECT phone FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND major_name = 'Business')
SELECT T2.email FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND T1.cost > 20
SELECT count(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Education' AND member.position = 'Member';
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM budget
SELECT event_id, location, status FROM event WHERE strftime('%Y', event_date) BETWEEN '2019' AND '2020'
SELECT AVG(cost) FROM expense WHERE cost > 50;
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code
SELECT T2.event_name, T2.location FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.remaining > 0
SELECT T1.event_name, T1.event_date FROM event AS T1 INNER JOIN expense AS T2 ON T2.link_to_event = T1.event_id WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100
SELECT T3.first_name, T3.last_name, T2.major_name FROM expense AS T1 INNER JOIN budget AS T2 ON T2.budget_id = T1.link_to_budget INNER JOIN member AS T3 ON T3.member_id = T1.link_to_member WHERE T1.cost > 100
SELECT T1.city, T1.county FROM zip_code AS T1 INNER JOIN event AS T2 ON T2.location = T1.zip_code WHERE T2.event_id IN ( SELECT link_to_event FROM income GROUP BY link_to_event HAVING COUNT(amount) > 40 )
SELECT T2.first_name, T2.last_name FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost = ( SELECT MAX(T3.cost) FROM expense AS T3 INNER JOIN ( SELECT link_to_member FROM expense GROUP BY link_to_member HAVING COUNT(event_id) > 1 ) AS T4 ON T3.link_to_member = T4.link_to_member )
SELECT AVG(t1.cost) FROM expense AS t1 INNER JOIN member AS t2 ON t1.link_to_member = t2.member_id WHERE t2.position != 'Member'
SELECT T1.event_name FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' AND T2.cost < ( SELECT AVG(T2.cost) FROM expense AS T2 WHERE T2.category = 'Parking' );
SELECT SUM(T2.cost) * 100 / COUNT(T1.event_id) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T1.type = 'Game'
SELECT MAX(t2.cost) FROM expense AS t1 INNER JOIN budget AS t2 ON t1.link_to_budget = t2.budget_id WHERE t1.expense_description = 'Water, chips, cookies'
SELECT T3.first_name, T3.last_name, SUM(T2.cost) FROM expense AS T1 INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id INNER JOIN budget AS T4 ON T1.link_to_budget = T4.budget_id GROUP BY T3.member_id ORDER BY SUM(T2.cost) DESC LIMIT 5
SELECT T2.first_name, T2.last_name, T2.phone FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id ORDER BY T1.amount DESC
SELECT CAST(SUM(CASE WHEN T2.state = 'Maine' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) - CAST(SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) AS percentage FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip
SELECT T3.major_name ,  T2.department FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id INNER JOIN department AS T2 ON T2.department_id = T3.department WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T3.first_name, T3.last_name, SUM(T2.cost) FROM expense AS T2 INNER JOIN member AS T3 ON T3.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies' GROUP BY T3.member_id
SELECT first_name FROM member WHERE major_id = (SELECT major_id FROM major WHERE major_name = 'Elementary Education')
SELECT T2.category, T2.amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'January Speaker'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'
SELECT T2.first_name, T2.last_name, T1.amount FROM income AS T1 INNER JOIN member AS T2 ON T2.member_id = T1.link_to_member WHERE T1.date_received = '2019-09-09'
SELECT T1.category FROM budget AS T1 INNER JOIN expense AS T2 ON T1.link_to_event = T2.link_to_budget WHERE T2.expense_description = 'Posters'
SELECT first_name, last_name, college FROM member WHERE position = 'Secretary'
SELECT T2.event_name, SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.category = 'Speaker Gifts' GROUP BY T2.event_name
SELECT T3.city FROM income AS T1 INNER JOIN member AS T2 ON T2.member_id = T1.link_to_member INNER JOIN zip_code AS T3 ON T3.zip_code = T2.zip WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Girke'
SELECT first_name, last_name, position FROM member WHERE city = 'Lincolnton' AND state = 'North Carolina' AND zip = 28092
SELECT COUNT(*) FROM gasstations WHERE Segment = 'Premium' AND Country = 'CZE'
SELECT COUNT(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE NULL END) * 100 / COUNT(*) FROM customers AS T1
SELECT CustomerID FROM customers WHERE Segment = 'LAM' INTERSECT SELECT CustomerID FROM yearmonth WHERE `Date` BETWEEN '201201' AND '201212' ORDER BY Consumption LIMIT 1
SELECT AVG(T2.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312'
SELECT t2.CustomerID FROM transactions_1k AS t1 INNER JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Currency = 'CZK' AND STRFTIME('%Y%m', t1.Date) BETWEEN '201101' AND '201112' GROUP BY t2.CustomerID ORDER BY SUM(t1.Amount) DESC LIMIT 1
SELECT count(*) FROM ( SELECT T2.CustomerID FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Year BETWEEN '201201' AND '201212' AND T2.Month BETWEEN '01' AND '12' AND T2.Consumption < 30000 GROUP BY T2.CustomerID ) AS T3 WHERE T3.CustomerID IN ( SELECT CustomerID FROM customers WHERE Segment = 'KAM' )
SELECT SUM(CASE WHEN T2.Currency = 'CZK' THEN T3.Consumption ELSE 0 END) - SUM(CASE WHEN T2.Currency = 'EUR' THEN T3.Consumption ELSE 0 END) AS Difference FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Date BETWEEN '201201' AND '201212'
SELECT strftime('%Y', Date) as year FROM transactions_1k GROUP BY year ORDER BY SUM(Amount) DESC LIMIT 1
SELECT segment FROM customers GROUP BY segment ORDER BY SUM(consumption) ASC LIMIT 1
SELECT SUBSTR(T1.Date, 1, 4) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'CZK' GROUP BY SUBSTR(T1.Date, 1, 4) ORDER BY SUM(T1.Consumption) DESC LIMIT 1
SELECT T1.CustomerID FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '2013%' AND T2.Segment = 'SME' ORDER BY T1.Consumption DESC LIMIT 1
SELECT CASE             WHEN T1.segment = 'SME' THEN 'SME and LAM'            WHEN T1.segment = 'KAM' THEN 'KAM and SME'            ELSE 'LAM and KAM'         END AS 'Segment',        AVG(T1.Consumption) - AVG(T2.Consumption) AS 'Difference'  FROM (        SELECT T3.Year,               T4.Segment,               SUM(T5.Amount * T5.Price) AS Consumption         FROM yearmonth AS T1              INNER JOIN transactions_1k AS T2                  ON T1.CustomerID = T2.CustomerID              INNER JOIN (                         SELECT T1.CustomerID,                                SUBSTR(T1.Date, 1, 4) AS Year                          FROM yearmonth AS T1                                 INNER JOIN transactions_1k AS T2                                     ON T1.CustomerID = T2.CustomerID                          WHERE T1.Date BETWEEN '201301' AND '201312'                          GROUP BY T1.CustomerID                          HAVING T1.Consumption = (                             SELECT MIN(Consumption)                              FROM yearmonth AS T4                                     INNER JOIN transactions_1k AS T5                                         ON T4.CustomerID = T5.CustomerID                              WHERE T4.Date BETWEEN '201301' AND '201312'                                                  AND T4.Segment = T3.Segment                         )                        ) AS T3                  ON T1.CustomerID = T3.CustomerID              INNER JOIN gasstations AS T4                  ON T2.GasStationID = T4.GasStationID              INNER JOIN products AS T5                  ON T2.ProductID = T5.ProductID         WHERE T1.Date BETWEEN '
SELECT      CASE          WHEN c.Segment = 'SME' THEN 'SME'         WHEN c.Segment = 'KAM' THEN 'KAM'         WHEN c.Segment = 'LAM' THEN 'LAM'     END as Segment,      AVG(t1.Consumption) as AvgConsumption,     SUM(CASE WHEN SUBSTR(y.Date, 1, 4) = '2012' THEN y.Consumption ELSE 0 END) as Consumption2012,      SUM(CASE WHEN SUBSTR(y.Date, 1, 4) = '2013' THEN y.Consumption ELSE 0 END) as Consumption2013 FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      y.Date BETWEEN '201201' AND '201312' GROUP BY      Segment ORDER BY      (Consumption2013 - Consumption2012) * 100.0 / Consumption2013 DESC LIMIT 1
SELECT SUM(T2.Consumption) FROM yearmonth AS T2 INNER JOIN customers AS T1 ON T2.CustomerID = T1.CustomerID WHERE T2.Date >= '201308' AND T2.Date <= '201311' AND T1.CustomerID = 6
SELECT COUNT(*) FROM ( SELECT T1.ChainID FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date LIKE '2012%' AND T1.Country = 'CZE' ) - ( SELECT T1.ChainID FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date LIKE '2012%' AND T1.Country = 'SVK' )
SELECT T2.consumption - T1.consumption FROM yearmonth AS T1 INNER JOIN yearmonth AS T2 ON T1.customerid = T2.customerid WHERE T1.date = '201304' AND T2.date = '201304' AND T1.customerid = 5 AND T2.customerid = 7
SELECT COUNT(CASE WHEN T1.currency = 'EUR' THEN 1 ELSE NULL END) - COUNT(CASE WHEN T1.currency = 'CZE' THEN 1 ELSE NULL END) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.customerid = T2.customerid WHERE T2.amount = T2.price
SELECT T2.CustomerID FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Currency = 'EUR' AND T2.Segment = 'LAM' AND T3.Date = '201310' ORDER BY T3.Consumption DESC LIMIT 1
SELECT T2.CustomerID, T1.CustomerID , sum(T1.Consumption) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'KAM' GROUP BY T1.CustomerID ORDER BY sum(T1.Consumption) DESC LIMIT 1
SELECT SUM(t1.Consumption) FROM yearmonth AS t1 INNER JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Date = '201305' AND t2.Segment = 'KAM'
SELECT CAST(COUNT(CASE WHEN customers.Segment = 'LAM' AND yearmonth.Consumption > 46.73 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(customers.CustomerID) AS p  FROM transactions_1k  JOIN customers ON transactions_1k.CustomerID = customers.CustomerID  JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID  WHERE customers.Segment = 'LAM'
SELECT T1.country FROM gasstations AS T1 INNER JOIN products AS T2 ON T1.segment = T2.description GROUP BY T1.country ORDER BY COUNT(*) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T3.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.CustomerID) FROM transactions_1k AS T1 INNER JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T3.Segment = 'KAM'
SELECT CAST(COUNT(CASE WHEN consumption > 528.3 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE strftime('%Y%m', Date) = '201202'
SELECT COUNT(CASE WHEN T2.Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(T2.Segment) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T3.Country = 'CZE'
SELECT T2.CustomerID FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201309' GROUP BY T2.CustomerID ORDER BY SUM(T2.Amount) DESC LIMIT 1
SELECT t3.Segment FROM yearmonth AS t1 INNER JOIN transactions_1k AS t2 ON t1.CustomerID = t2.CustomerID INNER JOIN customers AS t3 ON t2.CustomerID = t3.CustomerID WHERE strftime('%Y%m', t1.Date) = '201309' ORDER BY t1.Consumption ASC LIMIT 1
SELECT customers.Segment, SUM(yearmonth.Consumption) FROM yearmonth INNER JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE yearmonth.Date = '201206' AND customers.Segment = 'SME' GROUP BY customers.Segment ORDER BY SUM(yearmonth.Consumption) ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012'
SELECT T1.currency, SUM(T3.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.currency = 'EUR' GROUP BY T1.currency ORDER BY SUM(T3.Consumption) DESC LIMIT 1
SELECT T3.Description FROM yearmonth AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN products AS T3 ON T3.ProductID = T2.ProductID WHERE T2.Date LIKE '201309%'
SELECT DISTINCT T3.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date LIKE '2013-06-%'
SELECT DISTINCT T3.ChainID FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN gasstations AS T3 ON T2.ChainID = T3.ChainID WHERE T3.Currency = 'EUR'
SELECT T4.Description FROM transactions_1k AS T1 INNER JOIN products AS T4 ON T1.ProductID = T4.ProductID INNER JOIN gasstations AS T2 ON T2.GasStationID = T1.GasStationID INNER JOIN customers AS T3 ON T3.CustomerID = T1.CustomerID WHERE T3.Currency = 'EUR'
SELECT AVG(Price) FROM transactions_1k WHERE strftime('%Y-%m', Date) = '2012-01'
SELECT COUNT(DISTINCT t1.CustomerID) FROM transactions_1k AS t1 INNER JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Currency = 'EUR' AND t1.Amount * t1.Price > 1000
SELECT DISTINCT T2.description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T3.Country = 'CZE'
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID = ( SELECT GasStationID FROM gasstations WHERE ChainID = 11 )
SELECT COUNT(*) FROM transactions_1k WHERE Price > 1000 AND Country = 'CZE'
SELECT COUNT(*) FROM transactions_1k INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01'
SELECT AVG(Price * Amount) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T2.GasStationID = T1.GasStationID WHERE T2.Country = 'CZE'
SELECT AVG(Price * Amount) FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY SUM(Amount) DESC LIMIT 1
SELECT Country FROM gasstations WHERE GasStationID = (SELECT GasStationID FROM transactions_1k WHERE Date = '2012-08-25' LIMIT 1)
SELECT T2.currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T2.customerid = T1.customerid WHERE T1.date = '2012-08-24' AND T1.time = '16:25:00'
SELECT T2.segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.customerid = T2.customerid WHERE T1.time = '21:20:00' AND T1.`date` = '2012-08-23'
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.Currency = 'EUR' AND T1.`Time` < '13:00:00' AND DATE(T1.Date) = '2012-08-26'
SELECT Segment FROM customers WHERE CustomerID = ( SELECT MIN(CustomerID) FROM customers )
SELECT T3.country FROM transactions_1k AS T1 INNER JOIN gasstations AS T3 ON T1.gasstationid = T3.gasstationid WHERE T1.time = '12:42:00' AND T1.`date` = '2012-08-24';
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'
SELECT T1.Date, T1.Price * T1.Amount AS TotalExpense FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.CustomerID = 3 AND T1.Date = '2012-08-24'
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND STRFTIME('%Y-%m-%d', T1.Date) = '2012-08-26' AND STRFTIME('%H:%M', T1.Time) BETWEEN '08:00' AND '09:00';
SELECT t1.Currency FROM customers AS t1 INNER JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE STRFTIME('%Y%m', t2.Date) = '201306' AND t2.Consumption = 214582.17
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.`Date` = '2012-08-24' GROUP BY T1.CustomerID HAVING SUM(T1.Amount * T1.Price) = 548.4
SELECT CAST(COUNT(CASE WHEN T1.Amount > 0 THEN T1.CustomerID END) AS REAL) * 100 / COUNT(*) FROM transactions_1k AS T1 INNER JOIN DATETIME_FUNCTION(T1.`Date`) AS T2 ON T1.`Date` = T2.Date WHERE STRFTIME('%Y-%m-%d', T2.Date) = '2012-08-25'
SELECT CAST(SUM(t.Amount * t.Price) AS REAL) / SUM(t1.Amount * t1.Price) FROM transactions_1k t INNER JOIN transactions_1k t1 ON t.CustomerID = t1.CustomerID AND t.ProductID = t1.ProductID AND t.GasStationID = t1.GasStationID AND t.Time = t1.Time AND t.Date != t1.Date AND SUBSTR(t.Date, 1, 7) = '2012-08' AND SUBSTR(t1.Date, 1, 7) = '2013-08'
SELECT T1.GasStationID, SUM(T2.Price) AS Revenue FROM transactions_1k AS T1 INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID GROUP BY T1.GasStationID ORDER BY Revenue DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth AS T1 INNER JOIN gasstations AS T2 ON T1.CustomerID = T2.GasStationID WHERE T2.Country = 'SVK'
SELECT sum(Amount) FROM transactions_1k WHERE CustomerID = 38508 UNION ALL SELECT sum(Amount) FROM transactions_1k WHERE CustomerID = 38508 AND strftime('%Y%m', Date) = '201201'
SELECT T4.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID INNER JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID INNER JOIN products AS T4 ON T4.ProductID = T2.ProductID WHERE T3.Consumption = ( SELECT MAX(T3.Consumption) FROM yearmonth AS T3 ) ORDER BY T4.Description LIMIT 5
SELECT T1.CustomerID ,  T1.avg ,  T2.Currency FROM ( SELECT CustomerID ,  AVG(Price) AS avg FROM transactions_1k GROUP BY CustomerID ORDER BY avg DESC LIMIT 1 ) AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID
SELECT t1.Country FROM gasstations AS t1 INNER JOIN transactions_1k AS t2 ON t1.GasStationID = t2.GasStationID INNER JOIN products AS t3 ON t3.ProductID = t2.ProductID WHERE t2.ProductID = 2 ORDER BY t2.Price DESC LIMIT 1
SELECT T2.segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.customerid = T2.customerid INNER JOIN yearmonth AS T3 ON T1.date = T3.date WHERE T1.price / T1.amount > 29 AND STRFTIME('%m', T1.date) = '08' AND T1.productid = 5 AND T3.date LIKE '2012%';
