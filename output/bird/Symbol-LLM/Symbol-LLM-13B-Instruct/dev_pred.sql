SELECT MAX(EligibleFreeRate) FROM frpm WHERE County = "Alameda" AND EnrollmentType = "K-12"
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM frpm ORDER BY `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` LIMIT 3
SELECT zip FROM schools WHERE County = "Fresno" AND StatusType = "Charter"
SELECT T2.MailStreet, T2.MailStrAbr FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.FRPMCount (K-12) DESC LIMIT 1
SELECT Phone FROM schools WHERE OpenDate > '2000-01-01' AND Charter = 1
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath < 400 AND T2.Virtual = 'F'
SELECT s.School, s.Magnet FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.Enroll12 > 500 AND s.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead > 1500 ORDER BY T1.AvgScrRead DESC LIMIT 1
SELECT t1.cname, t1.School, t1.CDSCode, COUNT(*) AS "Number of SAT Test Takers" FROM (SELECT schools.CDSCode, schools.School, schools.County, schools.District, schools.SchoolType, schools.EducationalOptionType, schools.Enrollment, schools.FreeMealCount, schools.Percent(%)_Eligible_Free(K-12), schools.FRPM_Count(K-12), schools.Percent(%)_Eligible_FRPM(K-12), schools.2013_14_CALPADS_Fall_1_Certification_Status FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.SchoolType = 'K-12' AND schools.EducationalOptionType = 'Traditional' AND schools.Enrollment >= 1000 GROUP BY schools.CDSCode, schools.School, schools.County, schools.District, schools.SchoolType, schools.EducationalOptionType, schools.Enrollment, schools.FreeMealCount, schools.Percent(%)_Eligible_Free(K-12), schools.FRPM_Count(K-12), schools.Percent(%)_Eligible_FRPM(K-12), schools.2013_14_CALPADS_Fall_1_Certification_Status) AS t1 JOIN satscores ON t1.CDSCode = satscores.CDS WHERE t1.Enrollment >= 1000 GROUP BY t1.cname, t1.School, t1.CDSCode ORDER BY t1.FRPM_Count(K-12) DESC LIMIT 1;
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.Charter (Y/N) = 'Y'
SELECT frpm.CDSCode, frpm.FRPMCount, frpm.Percent(%)_Elgible_FRPM, frpm.2013_14_CALPADS_Fall_1_Certification_Status FROM frpm INNER JOIN satscores ON frpm.CDSCode = satscores.CDS WHERE satscores.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores) AND frpm.CDSCode IN (SELECT CDSCode FROM frpm)
SELECT cds FROM frpm WHERE Enrollment (K-12) + Enrollment (Ages 5-17) > 500;
SELECT MAX(EligibleFree(Ages5to17)) FROM frpm WHERE ExcellenceRate > 0.3;
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead DESC LIMIT 3
SELECT cds, COUNT(*) AS enrollment_k_12 FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode GROUP BY cds ORDER BY enrollment_k_12 DESC LIMIT 5; SELECT cds, COUNT(*) AS enrollment_k_12 FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode GROUP BY cds ORDER BY enrollment_k_12 DESC LIMIT 5;
SELECT DistrictName, AVG(satscores.AvgScrRead) AS AvgReadingScore FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Active' GROUP BY DistrictName ORDER BY AvgReadingScore DESC LIMIT 1; SELECT DistrictName, AVG(satscores.AvgScrRead) AS AvgReadingScore FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Active' GROUP BY DistrictName ORDER BY AvgReadingScore DESC LIMIT 1;
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Alameda' AND T1.NumTstTakr < 100
SELECT T2.CharterNum FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite = 499
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr <= 250 AND T2.County = "Contra Costa" AND T1.rtype = "Direct"
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY AVG(T1.AvgScrMath) DESC LIMIT 1
SELECT COUNT(*) FROM frpm WHERE `Academic Year` = 2014 AND `County Name` = 'Amador' AND `Low Grade` = 9 AND `High Grade` = 12
SELECT COUNT(*) FROM frpm WHERE `County Name` = "Los Angeles" AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;
SELECT s.School, COUNT(*) AS NumTstTakr FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.rtype = 'Contra Costa' GROUP BY s.School ORDER BY NumTstTakr DESC LIMIT 1;
SELECT s.School, s.Street, s.StreetAbr, s.City, s.Zip, s.State, s.MailStreet, s.MailStrAbr, s.MailCity, s.MailZip, s.MailState, s.Phone, s.Ext, s.Website, s.OpenDate, s.ClosedDate, s.Charter, s.CharterNum, s.FundingType, s.SOC, s.SOCType, s.EdOpsCode, s.EdOpsName, s.EILCode, s.EILName, s.GSoffered, s.GSserved, s.Virtual, s.Magnet, s.Latitude, s.Longitude, s.AdmFName1, s.AdmLName1, s.AdmEmail1, s.AdmFName2, s.AdmLName2, s.AdmEmail2, s.AdmFName3, s.AdmLName3, s.AdmEmail3 FROM frpm AS f INNER JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE f.Enrollment (K-12) - f.Enrollment (Ages 5-17) > 30;
SELECT T2.School, T2.Percent_Eligible_Free_Meals_K_12, T1.AvgScrRead, T1.AvgScrMath, T1.AvgScrWrite, T1.NumGE1500 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 AND T2.Percent_Eligible_Free_Meals_K_12 > 0.1
SELECT T2.FundingType FROM satscores AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = "Riverside" AND T1.AvgScrMath > 400
SELECT T2.Street, T2.City, T2.State, T2.Zip, T2.StreetAbr, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState FROM frpm AS T1 JOIN schools AS T2 ON T1.School = T2.CDSCode WHERE T1.County = "Monterey" AND T1.SchoolType = "High" AND T1.FreeMealCount(15) > 800
SELECT s.School, AVG(s.AvgScrWrite) AS AvgScore FROM satscores AS s INNER JOIN schools AS s2 ON s.cds = s2.CDSCode WHERE s2.OpenDate > 1991 OR s2.ClosedDate < 2000 GROUP BY s.School;
SELECT schools.SOC, schools.SOCType, schools.AdmFName1, schools.AdmLName1, schools.AdmEmail1, schools.AdmFName2, schools.AdmLName2, schools.AdmEmail2, schools.AdmFName3, schools.AdmLName3, schools.AdmEmail3, schools.OpenDate, schools.ClosedDate, schools.Charter, schools.CharterNum, schools.FundingType, schools.CDSCode FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.CharterFundingType = 'Directly funded' AND schools.Enrollment(K-12) - schools.Enrollment(Ages 5-17) > (SELECT AVG(frpm.Enrollment(K-12) - frpm.Enrollment(Ages 5-17)) FROM frpm WHERE frpm.CharterFundingType = 'Directly funded') AND schools.SOCType != 'Elementary School' AND schools.SOCType != 'High School' AND schools.SOCType != 'Middle School' AND schools.SOCType != 'Junior High School' AND schools.SOCType != 'Kindergarten' AND schools.SOCType != 'Preschool' AND schools.SOCType != 'Vocational School' AND schools.SOCType != 'Other' AND schools.SOCType != 'Private School' AND schools.SOCType != 'Charter School' AND schools.SOCType != 'Magnet School' AND schools.SOCType != 'Alternative School' AND schools.SOCType != 'Community School' AND schools.SOCType != 'Jewish School' AND schools.SOCType != 'Catholic School' AND schools.SOCType != 'Christian School' AND schools.SOCType != 'Islamic School' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SO
SELECT OpenDate FROM schools ORDER BY Enroll12 DESC LIMIT 1
SELECT City, MIN(Enroll12) FROM satscores GROUP BY City ORDER BY Enroll12 LIMIT 5;
SELECT `Free Meal Count (K-12)` / `Enrollment (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10, 11
SELECT `FRPM Count (K-12)` / `Enrollment (K-12)` FROM frpm WHERE `CDSCode` IN (SELECT `CDSCode` FROM schools WHERE `Ownership Code` = 66 ORDER BY `Free Meal Count (K-12)` DESC LIMIT 5)
SELECT T2.Website, T2.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.FreeMealCount (5 - 17) BETWEEN 1900 AND 2000
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM frpm WHERE `School Name` = 'Kacey Gibson'
SELECT AdmEmail1 FROM schools WHERE School = (SELECT T2.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterSchool = 1 ORDER BY T1.Enrollment (K-12) LIMIT 1)
SELECT T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr = (SELECT MAX(NumTstTakr) FROM satscores) AND T2.AvgScrRead >= 1500 AND T2.AvgScrMath >= 1500 AND T2.AvgScrWrite >= 1500
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead LIMIT 1;
SELECT T2.Website FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.enroll12 BETWEEN 2000 AND 3000 AND T2.County = "Los Angeles"
SELECT AVG(t1.NumTstTakr) FROM satscores AS t1 JOIN schools AS t2 ON t1.cds = t2.CDSCode WHERE t2.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND t2.County = 'Fresno'
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T1.CDSCode = T3.CDSCode GROUP BY T2.CDSCode ORDER BY AVG(T3.AvgScrRead) LIMIT 1
SELECT TOP 5 s.SchoolName, AVG(s.ScrRead) AS AvgReadingScore FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.rtype = 'Virtual' GROUP BY s.SchoolName ORDER BY AvgReadingScore DESC
SELECT T2.EducationalOptionType FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT satscores.AvgScrMath, schools.County FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode GROUP BY schools.County ORDER BY AVG(satscores.AvgScrMath) LIMIT 1;
SELECT s.City, AVG(t1.AvgScrWrite) FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.NumTstTakr >= 1500 GROUP BY s.City ORDER BY AVG(t1.AvgScrWrite) DESC LIMIT 1
SELECT s.School, AVG(s.AvgScrWrite) FROM satscores AS s INNER JOIN schools AS m ON s.cds = m.CDSCode WHERE m.AdmFName1 = 'Ricci Ulrich' GROUP BY s.School
SELECT State, COUNT(*) AS Enrollment FROM schools WHERE DOC = 31 AND StatusType = 'State Special' GROUP BY State ORDER BY Enrollment DESC LIMIT 1;
SELECT AVG(COUNT(*)) FROM schools WHERE County = "Alameda" AND District = "Elementary School District" AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31'
SELECT (SELECT COUNT(*) FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE DOC = 54) AND DistrictType = 'Unified') / (SELECT COUNT(*) FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE DOC = 52) AND DistrictType = 'Elementary')
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.Street, T2.StreetAbr, T2.City, T2.Zip, T2.State, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState, T1.School, T1.Street, T1.StreetAbr, T1.City, T1.Zip, T1.State, T1.MailStreet, T1.MailStrAbr, T1.MailCity, T1.MailZip, T1.MailState, T1.Phone, T1.Ext, T1.Website, T1.OpenDate, T1.ClosedDate, T1.Charter, T1.CharterNum, T1.FundingType, T1.SOC, T1.SOCType, T1.EdOpsCode, T1.EdOpsName, T1.EILCode, T1.EILName, T1.GSoffered, T1.GSserved, T1.Virtual, T1.Magnet, T1.Latitude, T1.Longitude, T1.AdmFName1, T1.AdmLName1, T1.AdmEmail1, T1.AdmFName2, T1.AdmLName2, T1.AdmEmail2, T1.AdmFName3, T1.AdmLName3, T1.AdmEmail3, T1.LastUpdate FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.RType = 'Math' ORDER BY T1.AvgScrMath DESC LIMIT 6, 1;
SELECT T2.MailStreet, T2.MailStrAbr, T1.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T2.MailStreet, T2.MailStrAbr ORDER BY AVG(T1.AvgScrRead) LIMIT 1; SELECT T2.MailStreet, T2.MailStrAbr, T1.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T2.MailStreet, T2.MailStrAbr ORDER BY AVG(T1.AvgScrRead) LIMIT 1;
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite >= 1500 AND T2.MailCity = "Lakeport"
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Fresno'
SELECT School, MailZip FROM schools WHERE DOCType = 'Traditional' AND DOC = 'Avetik Atoian'
SELECT (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Colusa') / (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Humboldt')
SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND StatusType = 'Active'
SELECT Phone, Ext FROM schools ORDER BY AvgScrWrite DESC LIMIT 333
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE AdmFName1 = "Mike Larson" AND AdmLName1 = "Dante Alvarez"
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1
SELECT COUNT(*) FROM schools WHERE City = "Hickman" AND DOC = 52 AND Charter = 1;
SELECT COUNT(*) FROM frpm WHERE County = "Los Angeles" AND Charter = 0 AND `Free Meal Count (K-12)` * 100 / `Enrollment (K-12)` < 0.18
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmEmail1, T1.School, T1.City FROM schools AS T1 JOIN administrators AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T1.CharterNum = '00D2';
SELECT COUNT(*) FROM schools WHERE MailCity = "Hickman" AND CharterNum = "00D4"
SELECT (SELECT COUNT(*) FROM frpm WHERE County = "Santa Clara" AND FundingType = "Locally Funded" AND Charter = 1) / (SELECT COUNT(*) FROM frpm WHERE County = "Santa Clara" AND FundingType != "Locally Funded" AND Charter = 1) * 100
SELECT COUNT(*) FROM frpm WHERE County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND FundingType = 'Directly Funded'
SELECT COUNT(*) FROM schools WHERE District = 'Community college' AND ClosedDate LIKE '%1989%' AND City = 'San Francisco'
SELECT County, COUNT(*) AS ClosedSchools FROM schools WHERE YEAR(ClosedDate) BETWEEN 1980 AND 1989 AND SOC = 11 GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;
SELECT NCESSchool FROM schools WHERE SOC = 31
SELECT COUNT(*) FROM schools WHERE County = "Alpine" AND StatusType = "District Community Day School" AND ClosedDate IS NULL
SELECT DistrictCode FROM schools WHERE City = "Fresno" AND Magnet = 0
SELECT SUM(Enrollment) FROM frpm WHERE School = 'State Special School' AND AcademicYear = '2014-2015'
SELECT `Free Meal Count (Ages 5-17)` FROM frpm WHERE `School Name` = 'Youth Authority School'
SELECT MIN(LowGrade) FROM frpm WHERE CDSCode IN (SELECT cds FROM schools WHERE EdOpsCode = 'SPECON' AND NCESSchool = 613360)
SELECT T2.Educational_Option_Type, T2.School_Name FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Breakfast_Provision_2 = '2' AND T2.County_Code = 37
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SchoolType = 'HS' AND T1.LowGrade = 9 AND T1.HighGrade = 12 AND T2.County = 'Merced' AND T2.SOCType = 'Lunch Provision 2'
SELECT schools.School, schools.Percent (%) Eligible FRPM (Ages 5-17) FROM frpm INNER JOIN schools ON frpm.School = schools.CDSCode WHERE schools.County = "Los Angeles" AND frpm.Grade_Span = "Kindergarten to 9th Grade"
SELECT cds, COUNT(*) AS cnt FROM satscores WHERE dname = 'Adelanto' GROUP BY cds ORDER BY cnt DESC LIMIT 1; SELECT cds, COUNT(*) AS cnt FROM satscores WHERE dname = 'Adelanto' GROUP BY cds ORDER BY cnt DESC LIMIT 1;
SELECT County, COUNT(*) FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;
SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1; SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1;
SELECT SchoolName, MIN(LowGrade) FROM frpm WHERE State = 'CA' GROUP BY SchoolName;
SELECT MIN(HighGrade), MAX(LowGrade) FROM frpm WHERE NOT HighGrade IS NULL AND NOT LowGrade IS NULL
SELECT COUNT(*), City, COUNT(*) FROM schools WHERE Magnet = 1 AND (Kindergarten = 1 OR Kindergarten = 1) AND (8thGrade = 1 OR 8thGrade = 1) GROUP BY City
SELECT AdmFName1, AdmFName2, District FROM schools GROUP BY AdmFName1, AdmFName2 ORDER BY COUNT(*) DESC LIMIT 2; SELECT AdmFName1, AdmFName2, District FROM schools GROUP BY AdmFName1, AdmFName2 ORDER BY COUNT(*) DESC LIMIT 2;
SELECT district_code, `Free Meal Count (K-12)` / `Enrollment (K-12)` * 100 AS Percent_Eligible_Free_K_12 FROM frpm WHERE `AdmFName1` = 'Alusine'
SELECT T2.AdmLName2, T1.District, T1.County, T1.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterNum = 40
SELECT AdmEmail1 FROM schools WHERE County = "San Bernardino" AND District = "San Bernardino City Unified" AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND SOC = 62 AND DOC = 54
SELECT T2.AdmEmail1, T1.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 GROUP BY T2.AdmEmail1 ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.region = 'East Bohemia' AND T1.type = 'POPLATEK PO OBRATU'
SELECT COUNT(*) FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T5.A3 = 'Prague'
SELECT AVG(A12) FROM district WHERE A2 = 'POPLATEK MESICNE' UNION SELECT AVG(A13) FROM district WHERE A2 = 'POPLATEK MESICNE'
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND gender = 'F';
SELECT COUNT(*) FROM client WHERE gender = 'M' AND A3 = 'North Bohemia' AND A11 > 8000
SELECT account_id, AVG(A11) FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY AVG(A11) LIMIT 1 SELECT account_id, AVG(A11) FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY AVG(A11) LIMIT 1 SELECT MAX(A11) FROM client WHERE gender = 'F', AVG(A11) FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY AVG(A11) LIMIT 1
SELECT client_id, AVG(A11) FROM client GROUP BY client_id ORDER BY AVG(A11) DESC LIMIT 1 SELECT account_id, AVG(A11) FROM client GROUP BY account_id ORDER BY AVG(A11) DESC LIMIT 1
SELECT COUNT(*) FROM client WHERE gender = 'Owner' AND birth_date BETWEEN '1990-01-01' AND '1999-12-31' AND district_id IN (SELECT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')
SELECT * FROM client WHERE gender = 'POPLATEK PO OBRATU'
SELECT account.account_id, account.frequency, MIN(loan.amount) AS min_amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.date LIKE '%1997%' AND loan.status = 'Approved' GROUP BY account.account_id, account.frequency ORDER BY min_amount
SELECT account.account_id, account.date, MAX(loan.amount) AS max_amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND loan.status = 'valid' AND account.date BETWEEN '1993-01-01' AND '1993-12-31' GROUP BY account.account_id ORDER BY max_amount DESC
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < 1950 AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Slokolov')
SELECT * FROM account WHERE date = (SELECT MIN(date) FROM account WHERE YEAR(date) = 1995)
SELECT * FROM account WHERE date < 1997 AND amount > 3000 SELECT * FROM account WHERE date < 1997 AND amount > 3000;
SELECT client_id FROM card WHERE issued = '1994-03-03'
SELECT date FROM account WHERE account_id = 4
SELECT district_id FROM account WHERE date = '1994-08-25'
SELECT MAX(T2.amount) FROM card AS T1 JOIN trans AS T2 ON T1.card_id = T2.card_id WHERE T1.disp_id = (SELECT client_id FROM client WHERE birth_date = '1970-01-01') AND T1.issued = '1996-10-21'
SELECT T1.gender FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.district_id = (SELECT MAX(district_id) FROM account) ORDER BY T1.birth_date LIMIT 1
SELECT SUM(t1.amount) FROM `order` AS t1 JOIN client AS t2 ON t1.account_id = t2.client_id JOIN loan AS t3 ON t1.account_id = t3.account_id WHERE t3.amount = (SELECT MAX(amount) FROM loan) AND t1.date < t3.date ORDER BY t1.date LIMIT 1
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T2.district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik')
SELECT T2.disp_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.amount = 5100 AND T2.date = '1998-09-02'
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date = 1996
SELECT district_id FROM client WHERE birth_date = '1976-01-29'
SELECT T1.birth_date FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T2.amount = 98832 AND T2.date = '1996-01-03'
SELECT account_id FROM account WHERE district_id = (SELECT district_id FROM district WHERE A3 = 'Prague' ORDER BY date LIMIT 1) ORDER BY date LIMIT 1
SELECT A4, COUNT(CASE WHEN gender = 'M' THEN 1 END) * 100.0 / COUNT(*) AS percentage FROM client WHERE district_id IN (SELECT district_id FROM district                     WHERE A3 = 'South Bohemia'                     ORDER BY A14 DESC                     LIMIT 1) GROUP BY A4;
SELECT (SELECT SUM(trans.amount) FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.client_id = (SELECT client.client_id FROM client WHERE client.client_id IN (SELECT loan.account_id FROM loan WHERE loan.date = '1993-07-05')) AND trans.date < '1998-12-27' AND trans.date > '1993-02-26') / (SELECT SUM(trans.amount) FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.client_id = (SELECT client.client_id FROM client WHERE client.client_id IN (SELECT loan.account_id FROM loan WHERE loan.date = '1993-07-05')) AND trans.date < '1998-12-27' AND trans.date > '1993-02-26') * 100
SELECT SUM(CASE WHEN loan.status = 'A' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS percentage_paid_with_no_issue FROM loan
SELECT SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS percentage FROM loan WHERE amount < 100000
SELECT account.account_id, district.A2, district.A3 FROM account, card, district WHERE account.date > (SELECT MAX(card.issued) FROM card) AND account.date < (SELECT MAX(card.issued) FROM card) AND district.district_id = account.district_id AND district.A2 = 'POPLATEK PO OBRATU'
SELECT account_id, frequency FROM account WHERE district_id IN (SELECT district_id FROM client WHERE region = 'east bohemia') AND date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT account_id, date FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prachatice')
SELECT district.A2, district.A3 FROM district, loan WHERE loan.account_id = district.district_id AND loan.loan_id = 4990
SELECT T1.account_id, T1.district_id, T2.A2, T2.A3 FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T1.account_id = T3.account_id WHERE T3.amount > 300000
SELECT loan_id, district_id, AVG(A11) FROM loan WHERE duration = 60 GROUP BY district_id;
SELECT district.A2, district.A3, district.A4, district.A5, district.A6, district.A7, district.A8, district.A9, district.A10, district.A11, district.A12, district.A13, district.A14, district.A15, district.A16 FROM district, loan WHERE loan.status = 'D' AND loan.date BETWEEN '1995-01-01' AND '1996-12-31' AND loan.district_id = district.district_id AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.type = 'loan' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id AND account.frequency = 'D') AND loan.district_id = district.district_id AND loan.date BETWEEN '1995-01-01' AND '1996-12-31' AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.type = 'loan' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id AND account.frequency = 'D') AND loan.district_id = district.district_id AND loan.date BETWEEN '1995-01-01' AND '1996-12-31' AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.type = 'loan' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id AND account.frequency = 'D') AND loan.district_id = district.district_id AND loan.date BETWEEN '1995-01-01'
SELECT SUM(account.amount) * 100.0 / SUM(account.amount) FROM account, district WHERE district.A2 = 'Decin' AND account.district_id = district.district_id AND account.date = 1993
SELECT account_id FROM account WHERE frequency = 'monthly'
SELECT district_id, COUNT(*) AS female_account_holders FROM account WHERE district_id IN (     SELECT district_id FROM client     WHERE gender = 'F' ) GROUP BY district_id ORDER BY female_account_holders DESC LIMIT 10;
SELECT district.A2, SUM(trans.amount) AS sum_withdraws FROM district JOIN trans ON district.district_id = trans.district_id WHERE district.A2 IN (     SELECT district.A2     FROM district     JOIN trans ON district.district_id = trans.district_id     WHERE MONTH(trans.date) = 1 AND YEAR(trans.date) = 1996     GROUP BY district.A2     ORDER BY SUM(trans.amount) DESC     LIMIT 10 ) GROUP BY district.A2
SELECT COUNT(*) FROM client WHERE NOT client_id IN (SELECT client_id FROM disp WHERE type = 'credit')
SELECT district_id, MAX(A3) FROM district AS T1 JOIN loan AS T2 ON T1.district_id = T2.district_id WHERE T2.status = 'C' GROUP BY T1.district_id
SELECT AVG(amount) FROM loan WHERE gender = 'M'
SELECT district_name, branch_location FROM district WHERE A13 = (SELECT MAX(A13) FROM district)
SELECT SUM(A16) FROM district WHERE A2 = 'Branch'
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK MESICNE' AND balance < 0
SELECT COUNT(*) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T2.frequency = 'POPLATEK MESICNE' AND T1.amount >= 250000
SELECT COUNT(*) FROM loan WHERE status = 'C' AND bank = '1'
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM account WHERE date = '1995-03-24' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 2)
SELECT COUNT(*) FROM card WHERE type = 'disponent'
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = "Pisek"
SELECT DISTINCT T1.A2, T1.A3, T1.A4, T1.A5, T1.A6, T1.A7, T1.A8, T1.A9, T1.A10, T1.A11, T1.A12, T1.A13, T1.A14, T1.A15, T1.A16 FROM district AS T1 JOIN trans AS T2 ON T1.district_id = T2.district_id WHERE T2.amount > 10000 AND T2.date = 1997
SELECT account_id FROM `order` WHERE k_symbol = 'SIPO'
SELECT * FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'gold' INTERSECT SELECT * FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'junior'
SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND YEAR(date) = 2021
SELECT DISTINCT account_id FROM account WHERE date < '1998-12-31' AND date >= '1998-01-01' AND frequency = 'POPLATEK MESICNE' AND amount < (SELECT AVG(amount) FROM account WHERE date < '1998-12-31' AND date >= '1998-01-01' AND frequency = 'POPLATEK MESICNE')
SELECT * FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T1.client_id = T3.client_id JOIN loan AS T4 ON T1.client_id = T4.client_id WHERE T1.gender = 'F' AND T3.type = 'Credit' AND T4.status = 'Active'
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T4.A3 = 'south Bohemia'
SELECT * FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Tabor') AND type = 'OWNER'
SELECT type FROM card WHERE type <> 'OWNER' AND district_id IN (SELECT district_id FROM district WHERE A11 BETWEEN 8000 AND 9000)
SELECT COUNT(*) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.bank = 'AB'
SELECT T1.A2 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'
SELECT AVG(A15) FROM district WHERE A2 = 'POPLATEK MESICNE' AND A15 > 4000 AND A15 > (SELECT AVG(A15) FROM district WHERE A2 = 'POPLATEK MESICNE' AND A15 > 0)
SELECT COUNT(*) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha') AND gender = 'M'
SELECT COUNT(*) FROM card WHERE type = 'gold' AND issued < 1998
SELECT T1.name FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T2.account_id = T3.account_id ORDER BY T3.amount DESC LIMIT 1
SELECT A15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532)
SELECT T1.district_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 3356) AND operation = 'VYBER'
SELECT COUNT(*) FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 13539)
SELECT district.A3 FROM district, client WHERE client.client_id = district.client_id AND client.client_id = 3541
SELECT T1.A2, T1.A3, T1.A4, T1.A5, T1.A6, T1.A7, T1.A8, T1.A9, T1.A10, T1.A11, T1.A12, T1.A13, T1.A14, T1.A15, T1.A16 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.district_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT account.client_id FROM account JOIN `order` ON `order`.account_id = account.account_id WHERE `order`.order_id = 32423
SELECT * FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = 5
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik')
SELECT DISTINCT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'junior' AND T2.issued > '1996-01-01'
SELECT AVG(A11) FROM district WHERE A11 > 10000 SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T2.district_id = (SELECT AVG(A11) FROM district WHERE A11 > 10000)
SELECT SUM(amount_1997) - SUM(amount_1996) / SUM(amount_1996) * 100 AS growth_rate FROM loan WHERE account_id IN (SELECT account_id FROM client WHERE gender = 'M') AND date BETWEEN '1996-01-01' AND '1997-12-31';
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > 1995
SELECT (SELECT A16 FROM district WHERE A3 = 'North' AND A2 = 'Bohemia') - (SELECT A16 FROM district WHERE A3 = 'East' AND A2 = 'Bohemia')
SELECT COUNT(*) FROM account WHERE account_id IN (1,2,3,4,5,6,7,8,9,10)
SELECT frequency, SUM(amount) FROM account WHERE account_id = 3 GROUP BY frequency
SELECT birth_date FROM client WHERE client_id = 130
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU'
SELECT SUM(t2.amount) AS total_debt, SUM(t2.payments) AS total_payments FROM client AS t1 JOIN loan AS t2 ON t1.client_id = t2.client_id WHERE t1.client_id = 992
SELECT SUM(t1.amount) FROM account AS t1 JOIN client AS t2 ON t1.client_id = t2.client_id WHERE t1.account_id = 851 AND t2.client_id = 4
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 9)
SELECT SUM(amount) FROM trans WHERE year(date) = 1998
SELECT client_id, birth_date FROM client WHERE birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district_id IN (SELECT district_id FROM account WHERE branch = 'East Bohemia');
SELECT T1.client_id FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3;
SELECT COUNT(*) FROM client WHERE birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND gender = 'M' AND client_id IN (SELECT T1.client_id FROM loan AS T1 JOIN trans AS T2 ON T1.loan_id = T2.loan_id WHERE T2.amount > 4000)
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > 1996
SELECT COUNT(*) FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T2.type = 'junior'
SELECT A3, COUNT(*) AS count, COUNT(CASE WHEN gender = 'F' THEN 1 END) AS count_female FROM client WHERE district_id IN (SELECT district_id FROM account WHERE bank = 'PRAGUE') GROUP BY A3;
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT DISTINCT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')) FROM client WHERE gender = 'M' AND district_id IN (SELECT DISTINCT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')
SELECT COUNT(*) FROM client WHERE gender = 'User' AND frequency = 'POPLATEK TYDNE'
SELECT account.account_id, account.date, loan.amount, loan.date FROM account, loan WHERE loan.duration > 24 AND loan.status = 'valid' AND loan.account_id = account.account_id AND loan.date < account.date AND loan.amount = (SELECT MIN(loan.amount) FROM loan WHERE loan.duration > 24 AND loan.status = 'valid' AND loan.account_id = account.account_id AND loan.date < account.date)
SELECT account_id FROM client WHERE gender = 'F' ORDER BY A11 LIMIT 1
SELECT COUNT(*) FROM client WHERE birth_date = 1920 AND district_id IN (SELECT district_id FROM district WHERE A3 = 'East Bohemia')
SELECT COUNT(*) FROM loan WHERE duration < 24 AND payments > 0
SELECT AVG(amount) FROM loan WHERE status = 'C' AND POPLATEK PO OBRATU = 'POPLATEK PO OBRATU'
SELECT T1.client_id, T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.type = 'owner'
SELECT T1.client_id, T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'gold'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl';
SELECT AVG(element = 'o') FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-')
SELECT AVG(bond_type = '-') FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');
SELECT COUNT(*) FROM molecule WHERE label = '-' AND element = 'na';
SELECT * FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = '#' AND T1.label = '+'
SELECT DIVIDE(SUM(element = 'c'), COUNT(atom_id)) FROM connected WHERE bond_type = ' = ';
SELECT COUNT(*) FROM bond WHERE bond_type = '#';
SELECT COUNT(*) FROM atom WHERE element != 'br';
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR099';
SELECT molecule_id FROM atom WHERE element = 'si';
SELECT element FROM atom WHERE bond_id = 'TR004_8_9'
SELECT element FROM atom WHERE bond_type = ' = ';
SELECT label FROM atom WHERE element = 'h' GROUP BY label ORDER BY COUNT(label) DESC LIMIT 1;
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te');
SELECT atom.atom_id, atom.element, bond.bond_type, bond.molecule_id FROM atom, bond WHERE bond.bond_type = '-' AND bond.molecule_id = atom.molecule_id;
SELECT atom.atom_id FROM atom, bond, molecule WHERE bond.bond_type = 'non-carcinogenic' AND molecule.molecule_id = bond.molecule_id AND molecule.label = '-' AND NOT atom.atom_id IN (SELECT atom_id FROM connected)
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(*) LIMIT 1; SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(*) LIMIT 1;
SELECT bond_type FROM bond WHERE atom_id = 'TR004_8' AND atom_id = 'TR004_20';
SELECT label FROM molecule WHERE NOT molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'sn');
SELECT COUNT(*) FROM atom WHERE element = 'i' OR element = 's' AND NOT molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-');
SELECT * FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#');
SELECT atom_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')
SELECT SUM(element = 'f') FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT SUM(bond_type = '#') AS percent FROM bond WHERE label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6'
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) FROM molecule;
SELECT T1.atom_id FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.molecule_id WHERE T2.bond_id = 'TR_000_2_5'
SELECT bond_id FROM connected WHERE atom_id = (SELECT atom_id FROM atom WHERE atom_id = 'TR000_2')
SELECT T2.label FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = ' = ' ORDER BY T2.label
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(bond_id)) as percent FROM bond WHERE molecule_id = 'TR008';
SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE label = '+'; SELECT DIVIDE(SUM(label = '+'), COUNT(molecule_id)) AS percent FROM molecule WHERE label = '+';
SELECT SUM(element = 'h') FROM atom WHERE molecule_id = 'TR206'
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';
SELECT element FROM atom WHERE molecule_id = 'TR060';
SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label
SELECT T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = '-' ORDER BY T1.label
SELECT bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type
SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR009' AND bond_id LIKE 'TR009_%';
SELECT COUNT(*) FROM molecule WHERE label = '+' AND element = 'br';
SELECT bond.bond_type, connected.atom_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.molecule_id = (SELECT molecule.molecule_id FROM molecule WHERE molecule.label = 'TR001_6_9')
SELECT `label` FROM `molecule` WHERE `molecule_id` = 'TR001_10'
SELECT COUNT(*) FROM bond WHERE bond_type = '#';
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19';
SELECT element FROM atom WHERE molecule_id = 'TR004';
SELECT COUNT(*) FROM molecule WHERE label = '-';
SELECT molecule_id FROM atom WHERE SUBSTRING(atom_id, 7, 2) BETWEEN 21 AND 25 AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');
SELECT * FROM bond WHERE bond_type IN ('P', 'N')
SELECT molecule_id FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1 SELECT molecule_id FROM molecule WHERE label = '+' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(bond_id) FROM bond WHERE molecule_id IN (SELECT atom_id FROM atom WHERE element = 'i');
SELECT bond_type, bond_id FROM bond WHERE atom_id = SUBSTR(atom_id, 7, 2) + 0 = 45; SELECT bond_type, bond_id FROM bond WHERE atom_id = 45;
SELECT element FROM atom WHERE NOT atom_id IN (SELECT atom_id FROM connected);
SELECT atom.atom_id FROM atom, bond, molecule WHERE bond.bond_type = 'triple' AND bond.molecule_id = molecule.molecule_id AND molecule.molecule_id = 'TR447';
SELECT element FROM atom WHERE molecule_id = 'TR144_8_19'
SELECT molecule_id FROM molecule WHERE label = '+' AND bond_type = ' = ' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) LIMIT 1
SELECT atom_id FROM atom WHERE element = 'pb'
SELECT element FROM bond WHERE bond_type = '#';
SELECT bond_id, COUNT(bond_id) FROM bond GROUP BY bond_id
SELECT DIVIDE(SUM(label = '+'), COUNT(bond_id)) FROM bond WHERE bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN('c', 'h');
SELECT atom_id2 FROM atom WHERE element = 's'
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'sn');
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-');
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '#' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'p' OR element = 'br'))
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT molecule_id FROM bond WHERE bond_type = '-' EXCEPT SELECT molecule_id FROM molecule WHERE label = '-'
SELECT SUM(element) AS percent FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-') AND element = 'cl';
SELECT label FROM molecule WHERE molecule_id = 'TR000' OR molecule_id = 'TR001' OR molecule_id = 'TR002'
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030';
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR000' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR001' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR002' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR003' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR004' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR005' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR006' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR007' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR008' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR009' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR010' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR011' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR012' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR013' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR014' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR015' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR016' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR017' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR018' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR019' AND molecule_id
SELECT element FROM atom WHERE bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM atom WHERE element = 'i'
SELECT MAX(label) FROM molecule WHERE element = 'ca';
SELECT * FROM atom WHERE atom_id = 'TR001_1_8' SELECT * FROM atom WHERE atom_id = 'TR001_1_8' AND element = 'cl' INTERSECT SELECT * FROM atom WHERE atom_id = 'TR001_1_8' AND element = 'c'
SELECT molecule_id FROM bond WHERE bond_type = '#' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'c' AND label = '-')
SELECT DIVIDE(SUM(element = 'pb'), COUNT(molecule_id)) as percentage FROM atom WHERE label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001'
SELECT molecule_id FROM bond WHERE bond_type = ' = ';
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'; SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#';
SELECT element FROM atom WHERE bond_id = 'TR005_16_26'
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-';
SELECT label FROM molecule WHERE molecule_id = 'TR001_10_11'
SELECT bond_id, label FROM molecule WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element = 'cl' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');
SELECT molecule_id, label FROM molecule WHERE molecule_id = 'TR006' SELECT SUM(element = 'h'), COUNT(element) FROM atom WHERE molecule_id = 'TR006'
SELECT * FROM molecule WHERE label = '+' AND element = 'ca'; SELECT * FROM molecule WHERE label = '+' AND element = 'ca';
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te');
SELECT element FROM atom WHERE molecule_id = 'TR001_10_11'
SELECT COUNT(*) FROM bond WHERE bond_type = '#' / COUNT(*) * 100
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(all bond_id)) as percent FROM bond WHERE molecule_id = 'TR047'
SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1' SELECT molecule_id FROM molecule WHERE label = '+'
SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR151'; SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR151';
SELECT element FROM atom WHERE molecule_id = 'TR151'
SELECT COUNT(*) FROM molecule WHERE label = '+';
SELECT * FROM atom WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE substr(molecule_id, 3, 3)>10 AND substr(molecule_id, 3, 3) < 50) AND element = 'c';
SELECT COUNT(*) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT bond_id FROM bond WHERE bond_type = ' = ';
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+' AND element = 'h')
SELECT T2.molecule_id FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T4 ON T1.bond_id = T4.bond_id WHERE T3.element = 'TR00_1' AND T4.molecule_id = 'TR000_1' SELECT T2.molecule_id FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T4 ON T1.bond_id = T4.bond_id WHERE T3.element = 'TR00_1' AND T4.molecule_id = 'TR000_1' AND T4.bond_type = 'single'
SELECT atom_id FROM atom WHERE element = 'c' AND NOT molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT SUM(label = '+' and element = 'h') AS percentage FROM molecule WHERE label = '+' AND element = 'h';
SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR124'; SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR124';
SELECT * FROM atom WHERE molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT element FROM atom WHERE molecule_id = 'TR001_2_4'
SELECT COUNT(*) FROM bond WHERE bond_type = ' = ' AND molecule_id = 'TR006'; SELECT label FROM molecule WHERE molecule_id = 'TR006';
SELECT * FROM molecule WHERE label = '+' AND element = 'cl'; SELECT * FROM molecule WHERE label = '+' AND element = 'c'; SELECT * FROM molecule WHERE label = '+' AND element = 'cl'; SELECT * FROM molecule WHERE label = '+' AND element = 'c'; SELECT * FROM molecule WHERE label = '+' AND element = 'h'; SELECT * FROM molecule WHERE label = '+' AND element = 'o'; SELECT * FROM molecule WHERE label = '+' AND element = 's'; SELECT * FROM molecule WHERE label = '+' AND element = 'n'; SELECT * FROM molecule WHERE label = '+' AND element = 'p'; SELECT * FROM molecule WHERE label = '+' AND element = 'na'; SELECT * FROM molecule WHERE label = '+' AND element = 'br'; SELECT * FROM molecule WHERE label = '+' AND element = 'f'; SELECT * FROM molecule WHERE label = '+' AND element = 'i'; SELECT * FROM molecule WHERE label = '+' AND element = 'sn'; SELECT * FROM molecule WHERE label = '+' AND element = 'pb'; SELECT * FROM molecule WHERE label = '+' AND element = 'te'; SELECT * FROM molecule WHERE label = '+' AND element = 'ca';
SELECT b.molecule_id, b.bond_type, a.atom_id, a.atom_id2, c.label FROM bond b JOIN connected c ON c.bond_id = b.bond_id WHERE b.bond_type = '-'
SELECT * FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = '#'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*) FROM atom WHERE element = 'cl'
SELECT atom_id, COUNT(DISTINCT bond_type) FROM bond WHERE molecule_id = 'TR346' GROUP BY atom_id SELECT atom_id, COUNT(DISTINCT bond_type) FROM bond WHERE molecule_id = 'TR346' GROUP BY atom_id;
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.label = '+'
SELECT COUNT(*) FROM molecule WHERE NOT label LIKE '%s%' AND NOT molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = ' = ')
SELECT label FROM molecule WHERE molecule_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';
SELECT COUNT(*) FROM bond WHERE bond_type = '-';
SELECT * FROM atom WHERE element = 'cl' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');
SELECT * FROM molecule WHERE label = '-' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'c');
SELECT SUM(label = '+' and element = 'cl') FROM molecule WHERE label = '+'
SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_1_7'
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id = 'TR001_3_4';
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2'); SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2');
SELECT `molecule` FROM `atom` WHERE `atom_id` = 'TR000_2' SELECT `molecule` FROM `atom` WHERE `atom_id` = 'TR000_4' SELECT `molecule` FROM `atom` WHERE `atom_id` = 'TR000_2' INTERSECT SELECT `molecule` FROM `atom` WHERE `atom_id` = 'TR000_4'
SELECT element FROM atom WHERE atom_id = 'TR000_1';
SELECT label FROM molecule WHERE molecule_id = 'TR000'; SELECT label FROM molecule WHERE molecule_id = 'TR000';
SELECT percentage FROM bond WHERE bond_type = '-';
SELECT COUNT(*) FROM molecule WHERE label = '+' AND element = 'n';
SELECT molecule_id FROM bond WHERE bond_type = ' = '; SELECT molecule_id FROM atom WHERE element = 's'; SELECT molecule_id FROM connected WHERE atom_id = (SELECT atom_id FROM atom WHERE element = 's') AND bond_id = (SELECT bond_id FROM bond WHERE bond_type = ' = ');
SELECT * FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5;
SELECT element FROM atom WHERE molecule_id = 'TR024' AND bond_type = '=' AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT molecule_id FROM atom GROUP BY molecule_id ORDER BY COUNT(atom.molecule_id) DESC LIMIT 1;
SELECT SUM(label) AS percentage FROM molecule WHERE bond_type = '#' AND element = 'h';
SELECT COUNT(*) FROM molecule WHERE label = '+';
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.molecule_id BETWEEN 'TR004' AND 'TR010';
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT COUNT(*) FROM molecule AS t1 JOIN bond AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.bond_type = ' = ' AND t1.label = 'oxygen';
SELECT COUNT(*) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.bond_id = '##'
SELECT T1.element, T2.bond_type FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.molecule_id WHERE T1.molecule_id = 'TR016';
SELECT atom_id FROM atom WHERE molecule_id = 'TR012' AND element = 'c' AND bond_type = ' = ';
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+' AND element = 'o')
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECTED
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT
SELECT DisplayName, MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY DisplayName ORDER BY MAX(Reputation) DESC LIMIT 1
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1
SELECT COUNT(*) FROM users WHERE Views > 10 AND CreationDate > 2013
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'
SELECT Title FROM posts WHERE OwnerUserId = '##UserId##'
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts'
SELECT Title FROM posts WHERE OwnerUserId = '##UserId##' AND ViewCount = (SELECT MAX(ViewCount) FROM posts WHERE OwnerUserId = '##UserId##')
SELECT OwnerDisplayName FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT SUM(CommentCount) FROM posts WHERE OwnerUserId = '##UserId##'
SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = '##UserId##'
SELECT LastEditorDisplayName FROM posts WHERE Id = 10144
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL
SELECT OwnerDisplayName FROM posts WHERE ClosedDate IS NOT NULL
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Age > 65 AND p.Score > 20
SELECT Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts')
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian')
SELECT p.Body FROM posts AS p INNER JOIN tags AS t ON p.Id = t.ExcerptPostId WHERE t.TagName = '##tagname:string##' ORDER BY p.Score DESC LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Teacher' AND UserId = 101
SELECT Name FROM badges WHERE UserId = 101
SELECT COUNT(*) FROM badges WHERE YEAR(Date) = 2011 AND UserId = '##UserId##'
SELECT DisplayName FROM users WHERE Id = (SELECT MAX(UserId) FROM badges)
SELECT AVG(Score) FROM posts WHERE OwnerUserId = '##UserId##'
SELECT AVG(COUNT(Id)) AS average_badges, COUNT(DisplayName) AS total_users FROM users WHERE Views > 200 GROUP BY DisplayName
SELECT COUNT(Id) AS "count", (COUNT(Id) / (SELECT COUNT(*) FROM posts WHERE Score > 20)) * 100 AS "percentage" FROM posts WHERE Score > 20 AND Age > 65;
SELECT COUNT(*) FROM votes WHERE PostId = 1 AND VoteTypeId = 2 AND CreationDate = '2010-07-19' AND UserId = 58
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'
SELECT p.Title FROM posts AS p INNER JOIN comments AS c ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)
SELECT COUNT(*) FROM comments WHERE PostId = 1910
SELECT COUNT(*) FROM votes WHERE PostId = '##PostId##' AND VoteTypeId = 5 AND CreationDate > '##CreationDate##'
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = '1'
SELECT * FROM posts WHERE Id = 102444 AND CreationDate = '2013-07-12 09:08:18.0' AND ClosedDate IS NULL
SELECT Reputation FROM users WHERE Id = '65041'
SELECT COUNT(*) FROM users WHERE DisplayName = 'Tiago Pasqualini'
SELECT DisplayName FROM users WHERE Id = '6347'
SELECT COUNT(*) FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'DatEpicCoderGuyWhoPrograms')
SELECT COUNT(p.Id) / COUNT(v.Id) FROM posts AS p INNER JOIN votes AS v ON p.Id = v.PostId WHERE p.OwnerUserId = '24'
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT Name FROM badges WHERE UserId = '##UserId##'
SELECT UserDisplayName FROM comments WHERE Text LIKE '%thank you user93%'
SELECT * FROM comments WHERE UserId = '##UserId##'
SELECT u.DisplayName, u.Reputation FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'
SELECT c.Text FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT u.DisplayName, b.Name, b.Date FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer'
SELECT OwnerUserId FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data'
SELECT Title FROM Posts WHERE LastEditorUserId = '##UserId##'
SELECT SUM(Score) AS TotalScore, Users.WebsiteUrl FROM Posts INNER JOIN Users ON Posts.LastEditorUserId = Users.Id WHERE Users.DisplayName = 'Yevgeny' AND Posts.LastEditorUserId != 0 GROUP BY Users.WebsiteUrl
SELECT c.Text FROM comments AS c INNER JOIN postHistory AS ph ON c.PostId = ph.PostId INNER JOIN posts AS p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND ph.PostHistoryTypeId = 5 AND ph.UserId = '##UserId##'
SELECT SUM(v.BountyAmount) FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data%'
SELECT u.DisplayName FROM users AS u INNER JOIN votes AS v ON v.UserId = u.Id WHERE v.PostId = 101 AND v.BountyAmount = 50 AND v.VoteTypeId = 8 AND v.CreationDate > '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' SELECT u.DisplayName FROM users AS u INNER JOIN votes AS v ON v.UserId = u.Id WHERE v.PostId = 101 AND v.BountyAmount = 50 AND v.VoteTypeId = 8 AND v.CreationDate > '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-0
SELECT AVG(ViewCount) AS average_view_count, t.TagName, p.Title, p.Body, p.Score, c.Text FROM posts AS p INNER JOIN tags AS t ON p.Tags LIKE '%humor%' INNER JOIN comments AS c ON c.PostId = p.Id WHERE p.PostTypeId = 1 GROUP BY t.TagName, p.Title, p.Body, p.Score, c.Text ORDER BY average_view_count DESC
SELECT COUNT(*) FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT Id FROM users ORDER BY Views LIMIT 1
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011
SELECT COUNT(UserId) FROM badges WHERE Count(Name) > 5;
SELECT COUNT(*) AS users FROM users WHERE Location LIKE '%New York%' AND (SELECT COUNT(*) FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Teacher' OR badges.Name = 'Supporter') > 0
SELECT u.DisplayName, u.Reputation FROM users AS u WHERE u.Id = 1
SELECT u.Id AS "user_link", u.DisplayName, u.Reputation, u.Views, COUNT(p.Id) AS "number_of_posts" FROM users AS u INNER JOIN postHistory AS ph ON ph.UserId = u.Id INNER JOIN posts AS p ON p.Id = ph.PostId WHERE ph.PostHistoryTypeId = 5 AND u.Reputation > 1000 AND u.Views > 1000 GROUP BY u.Id, u.DisplayName, u.Reputation, u.Views HAVING COUNT(p.Id) = 1 ORDER BY u.Reputation DESC
SELECT c.UserId AS "user_link", COUNT(c.Id) AS "comments" FROM comments AS c WHERE c.UserId != -1 GROUP BY c.UserId ORDER BY COUNT(c.Id) DESC LIMIT 100
SELECT COUNT(*) FROM users WHERE Location LIKE '%India%' AND EXISTS (SELECT * FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Teacher')
SELECT (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2010) - (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2011) * 100 / (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2010)
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId
SELECT * FROM postLinks WHERE PostId = 61217 SELECT * FROM posts WHERE Id = 61217
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395
SELECT p.Id AS "post_link", p.OwnerUserId AS "user_link" FROM posts AS p WHERE p.Score > 60 ORDER BY p.Id
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND CreationDate = 2011
SELECT AVG(UpVotes) AS "average_upvotes", AVG(Age) AS "average_age" FROM users WHERE Count(UserId) > 10;
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08'
SELECT COUNT(*) FROM comments WHERE Score > 60
SELECT * FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(*) FROM posts WHERE Score = 10
SELECT b.Name, u.DisplayName, u.Reputation, u.Location, u.WebsiteUrl, u.Views, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AccountId, u.CreationDate, u.LastAccessDate FROM badges b INNER JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users) AND b.Name IN ('Teacher', 'Famous Question', 'Famous Answer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer',
SELECT SUM(Reputation) FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Date = '2010-07-19 19:39:08.0');
SELECT b.Name FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'
SELECT DISTINCT b.Date FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE u.Location LIKE '%Rochester, NY%'
SELECT COUNT(UserId) AS "Teacher", COUNT(UserId) AS "Total Users", (COUNT(UserId) / COUNT(UserId)) * 100 AS "Percentage" FROM badges WHERE Name = 'Teacher'
SELECT COUNT(UserId) AS "Number of Users", COUNT(UserId) * 100.0 / (SELECT COUNT(UserId) FROM users WHERE Age BETWEEN 13 AND 18) AS "Percentage" FROM users WHERE Age BETWEEN 13 AND 18 AND UserId IN (SELECT UserId FROM badges WHERE Name = 'Organizer');
SELECT c.Score FROM comments AS c WHERE c.PostId = 1
SELECT Text FROM comments WHERE PostId = 1
SELECT u.Age FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE u.Location LIKE '%Vienna%' AND b.Name = 'Teacher'
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND Reputation >= 15000
SELECT SUM(u.Views) FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT b.Name, u.DisplayName, u.Reputation, u.Id, u.Location, u.WebsiteUrl, u.Views, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')
SELECT COUNT(*) FROM users WHERE Age > 65 AND EXISTS(SELECT * FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Supporter')
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%'
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 10;
SELECT (COUNT(Id where YEAR(CreationDate) = 2010) / COUNT(Id where YEAR(CreationDate) = 2011)) AS Ratio FROM votes;
SELECT t.TagName FROM users AS u INNER JOIN tags AS t ON t.TagName = u.DisplayName WHERE u.DisplayName = 'John Stauffer';
SELECT COUNT(*) FROM users WHERE DisplayName = 'Daniel Vassallo';
SELECT COUNT(*) FROM votes WHERE UserId = 101
SELECT Id FROM posts WHERE OwnerUserId = 101 AND AnswerCount = (SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = 101)
SELECT MAX(SUM(ViewCount)) FROM posts WHERE PostTypeId = 1 AND (DisplayName = 'Harvey Motulsky' OR DisplayName = 'Noah Snyder');
SELECT COUNT(*) FROM users INNER JOIN posts ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Matt Parker' AND posts.Score > 4;
SELECT COUNT(*) FROM comments WHERE Score < 60 AND PostId IN (SELECT Id FROM posts WHERE OwnerUserId = '##UserId##') AND UserDisplayName = 'Neil McGuigan';
SELECT t.TagName, t.Count FROM tags AS t INNER JOIN posts AS p ON t.WikiPostId = p.Id WHERE p.OwnerUserId = '##UserId##' AND p.PostTypeId = 2 AND p.ClosedDate IS NULL AND p.CommentCount = 0 AND p.AnswerCount = 0 AND p.FavoriteCount = 0 AND p.LastEditorUserId = '##UserId##' AND p.LastEditDate > '2015-01-01 00:00:00' AND p.LastEditDate < '2015-12-31 23:59:59' ORDER BY t.TagName
SELECT DISTINCT Name FROM badges WHERE Name = 'Organizer'
SELECT DIVIDE(COUNT(PostId WHERE TagName = 'r'), COUNT(PostId WHERE DisplayName = 'Community')) AS percentage FROM posts WHERE PostTypeId = 1 AND OwnerUserId = 101
SELECT (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Mornington') - (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Amos');
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'commentator' AND YEAR(Date) = 2014
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59';
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1;
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;
SELECT c.PostId AS "post_link", c.Text AS "comment_text", c.UserId AS "user_link" FROM comments AS c WHERE c.Score > 60 ORDER BY c.PostId DESC LIMIT 100;
SELECT b.Name FROM badges AS b WHERE b.UserId = '##UserId##' AND YEAR(b.Date) = 2011
SELECT p.OwnerDisplayName, p.WebsiteUrl FROM posts AS p WHERE p.FavoriteCount > 150;
SELECT ph.CreationDate, ph.PostId, ph.PostHistoryTypeId, ph.Text, ph.Comment, ph.UserId, ph.UserDisplayName, ph.RevisionGUID, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.
SELECT u.LastAccessDate, u.Location FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Outliers'
SELECT Title FROM posts WHERE PostId = 10144
SELECT p.Id AS "post_link", b.Name FROM badges AS b INNER JOIN posts AS p ON p.Id = b.UserId WHERE b.UserId = '##UserId##' AND YEAR(b.Date) = 2013
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;
SELECT DisplayName, Location FROM users WHERE OwnerUserId = 101
SELECT t.TagName, t.Count, p.Title, p.Body, p.Score, p.ViewCount, p.Tags, p.AnswerCount, p.CommentCount, p.FavoriteCount, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.Owner
SELECT p.DisplayName FROM Posts AS p WHERE p.Id = (SELECT MAX(ParentId) FROM Posts)
SELECT u.DisplayName, u.WebsiteUrl FROM users AS u INNER JOIN votes AS v ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1;
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50
SELECT Id FROM users ORDER BY Age LIMIT 1;
SELECT p.Score, p.ViewCount, p.Tags, MAX(t.Count) AS MostPopularTag FROM posts AS p INNER JOIN tags AS t ON p.Tags LIKE '%' + t.TagName + '%' GROUP BY p.Score, p.ViewCount, p.Tags ORDER BY p.ViewCount DESC LIMIT 1;
SELECT AVG(CAST(COUNT(Id) AS FLOAT)) FROM postLinks WHERE YEAR(CreationDate) = 2010 AND LinkTypeId = 1
SELECT MAX(FavoriteCount) FROM posts WHERE OwnerUserId = 1465
SELECT Title FROM Posts WHERE Id = (SELECT MIN(PostId) FROM PostLinks)
SELECT DisplayName FROM users WHERE Id = (SELECT MAX(UserId) FROM badges)
SELECT MIN(CreationDate) FROM votes WHERE UserId = '##UserId##' AND VoteTypeId = 2
SELECT MIN(CreaionDate) FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE users.Age = (SELECT MIN(Age) FROM users);
SELECT DisplayName FROM users WHERE Id = (SELECT MIN(UserId) FROM badges WHERE Name = 'Autobiographer')
SELECT COUNT(u.Id) AS "number_of_users" FROM users AS u INNER JOIN (SELECT p.OwnerUserId, SUM(p.FavoriteCount) AS "total_favorite_count" FROM posts AS p WHERE p.OwnerUserId != -1 GROUP BY p.OwnerUserId) AS p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.total_favorite_count >= 4;
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT MAX(Age) FROM users);
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010;
SELECT Id, Title FROM posts WHERE OwnerUserId = '##UserId##' AND PostTypeId = 1 ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1;
SELECT AVG(Score) FROM posts WHERE OwnerUserId = 101
SELECT u.DisplayName FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE YEAR(p.CreationDate) = 2011 AND p.ViewCount > 20000;
SELECT Id, OwnerDisplayName FROM posts WHERE YEAR(CreationDate) = 2010 ORDER BY FavoriteCount DESC LIMIT 1;
SELECT DIVIDE(COUNT(Id) where CreationDate = 2011 and Reputation > 1000, COUNT(Id)) * 100 as percentage;
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 13 AND 18;
SELECT SUM(ViewCount) AS total_views, OwnerUserId, OwnerDisplayName, LastEditorUserId, LastEditDate FROM posts WHERE Title = 'Computer Game Datasets' GROUP BY OwnerUserId, OwnerDisplayName, LastEditorUserId, LastEditDate ORDER BY total_views DESC LIMIT 10
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);
SELECT c.PostId, c.Text, c.CreationDate, c.UserId, c.UserDisplayName, c.Score, c.Score + c.Score AS TotalScore FROM comments AS c INNER JOIN posts AS p ON c.PostId = p.Id WHERE c.PostId = (SELECT MAX(p.Id) FROM posts AS p) AND c.Score > 0 ORDER BY c.Score DESC
SELECT COUNT(*) AS "Number of Posts" FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT DisplayName, Location FROM users WHERE Id = (SELECT MAX(LastEditorUserId) FROM posts WHERE Id = 183)
SELECT MAX(Date) FROM badges WHERE Name = 'Emmett'
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
SELECT DATEDIFF(stats_badges.Date, users.CreationDate) FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Zolomon';
SELECT COUNT(p.Id) AS Posts, COUNT(c.Id) AS Comments FROM Posts AS p INNER JOIN Comments AS c ON c.PostId = p.Id WHERE p.OwnerUserId = (SELECT MAX(Id) FROM Users) GROUP BY p.Id, c.Id;
SELECT Text, UserDisplayName FROM comments WHERE PostId = 101 ORDER BY CreationDate DESC LIMIT 1
SELECT COUNT(DISTINCT Name) FROM badges WHERE Name = 'Citizen Patrol';
SELECT COUNT(*) FROM posts WHERE Tags.TagName = 'careers';
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT c.Text, c.Score, c.CreationDate, c.UserId AS "user_link", c.UserDisplayName AS "user_name" FROM comments AS c INNER JOIN posts AS p ON c.PostId = p.Id WHERE p.Title = 'Clustering 1D data' AND c.UserId IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';
SELECT COUNT(*) FROM votes WHERE BountyAmount > 30;
SELECT (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS total_posts, (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS posts_with_score_above_50, (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS posts_with_score_above_50_and_reputation_above_##reputation##, (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS posts_with_score_above_50_and_reputation_above_##reputation##_and_reputation_above_##reputation##, (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS posts_with_score_above_50_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count < 20;
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';
SELECT u.Reputation, u.UpVotes FROM users AS u INNER JOIN comments AS c ON c.UserId = u.Id WHERE c.Text = 'fine, you win :)';
SELECT c.Text FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.Id = 10144
SELECT MAX(Score) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount BETWEEN 100 AND 150);
SELECT c.CreationDate, u.Age FROM comments c INNER JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'
SELECT COUNT(c.PostId) AS "count" FROM comments AS c WHERE c.Score = 0 AND c.PostId IN (SELECT Id FROM posts WHERE ViewCount < 5);
SELECT COUNT(*) FROM comments WHERE PostId = 1 AND Score = 0
SELECT COUNT(c.UserId) AS "total_users" FROM users AS u INNER JOIN comments AS c ON c.UserId = u.Id WHERE u.Age = 40 AND c.Score = 0
SELECT PostId, Text FROM comments WHERE PostId = 101
SELECT SUM(UpVotes) FROM users WHERE Users.Id = 126
SELECT c.Id AS "comment_link", c.Text, c.CreationDate, c.PostId AS "post_link" FROM comments AS c WHERE c.UserId = '##UserId##' AND c.Text LIKE '%##CommentText##%' ORDER BY c.CreationDate DESC
SELECT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND DownVotes = 0;
SELECT DIVIDE(COUNT(UserId where UpVotes = 0 and Score BETWEEN 5 and 10)), (COUNT(UserId where Score BETWEEN 5 and 10)) as percentage;
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man';
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND superhero_name IN (SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength');
SELECT superhero_name, full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(T1.id) > 15
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse';
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN power_attribute AS T3 ON T2.power_id = T3.power_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Agility' AND T1.eye_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blue')
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blue') AND hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blond') AND superhero.superpower_id = (SELECT superpower.id FROM superpower WHERE superpower.power_name = 'Agility');
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC LIMIT 1
SELECT publisher_name FROM publisher WHERE publisher_name = 'Sauron'
SELECT COUNT(*) FROM superhero WHERE publisher_name = 'Marvel Comics' AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');
SELECT AVG(height_cm) FROM superhero WHERE publisher_name = 'Marvel Comics';
SELECT publisher_name, COUNT(id) FROM superhero WHERE publisher_name = 'Marvel Comics' AND superhero_name IN ('Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor',
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')
SELECT publisher_name FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Speed' GROUP BY T1.publisher_name ORDER BY MIN(T4.attribute_value) LIMIT 1
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold')
SELECT publisher_name FROM publisher WHERE publisher_name IN (SELECT publisher_name FROM superhero WHERE superhero_name = 'Blue Beetle II');
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blond')
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T3.attribute_value LIMIT 1
SELECT race_id FROM superhero WHERE superhero_name = 'Copycat';
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t3.attribute_name = 'Durability' AND t3.attribute_value < 50
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t1.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND t3.attribute_name = 'Strength' AND t3.attribute_value = 100
SELECT superhero_name FROM superhero GROUP BY superhero_name ORDER BY COUNT(superhero_name) DESC LIMIT 1;
SELECT COUNT(*) FROM superhero WHERE race = 'Vampire'
SELECT SUM(CASE WHEN alignment = 'Bad' THEN 1 ELSE 0 END) * 100 / COUNT(*) AS percentage_of_superheroes_who_act_in_their_own_self_interest_or_make_decisions_based_on_their_own_moral_code, COUNT(*) AS number_of_superheroes_published_by_marvel_comics FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') GROUP BY alignment;
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))
SELECT publisher_id FROM publisher WHERE publisher_name = 'Star Trek';
SELECT AVG(attribute_value) FROM hero_attribute
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.id = 75
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = 2;
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.gender_id = (SELECT id FROM gender WHERE gender = 'Male');
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 56
SELECT superhero_name FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Demi-God');
SELECT COUNT(*) FROM superhero WHERE alignment_id = 'Bad'
SELECT race_id FROM superhero WHERE weight_kg = 169
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T1.race = 'human' AND T1.height_cm = 185;
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1;
SELECT AVG(CASE WHEN height_cm BETWEEN 150 AND 180 THEN 1 ELSE 0 END) * 100 / COUNT(*) FROM superhero WHERE publisher_id = 13;
SELECT superhero_name FROM superhero WHERE weight_kg > (SELECT AVG(weight_kg) FROM superhero) AND gender_id IN (SELECT id FROM gender WHERE gender = 'Male');
SELECT power_name FROM superpower GROUP BY power_name ORDER BY COUNT(power_name) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination';
SELECT superpower.power_name FROM superpower, hero_power WHERE hero_power.hero_id = 1 AND hero_power.power_id = superpower.id
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'stealth';
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'strength' GROUP BY T1.id ORDER BY T3.attribute_value DESC LIMIT 1;
SELECT AVG(height_cm) FROM superhero WHERE skin_colour_id IS NULL;
SELECT COUNT(*) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Dark Horse Comics';
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'durability' AND T1.publisher_id = (SELECT publisher_id FROM publisher WHERE publisher_name = 'Dark Horse Comics') GROUP BY T1.superhero_name ORDER BY MAX(T3.attribute_value) DESC LIMIT 1
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abraham Sapien';
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight';
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Female' AND T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')
SELECT T1.publisher_name FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.hair_colour_id = T2.skin_colour_id AND T2.eye_colour_id = T2.skin_colour_id AND T2.superhero_name = 'Superman';
SELECT race_id FROM superhero WHERE superhero_name = 'A-Bomb';
SELECT percentage FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue');
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler'
SELECT gender.gender FROM gender JOIN superhero ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T2.power_id = (SELECT id FROM superpower WHERE power_name = 'Adaptation');
SELECT COUNT(*) FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Amazo';
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber';
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN colour AS T3 ON T2.eye_colour_id = T3.id AND T2.hair_colour_id = T3.id WHERE T3.colour = 'Black';
SELECT T1.eye_colour_id FROM colour AS T1 JOIN superhero AS T2 ON T1.colour = 'Gold' WHERE T2.skin_colour_id = T1.id
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');
SELECT superhero_name FROM superhero WHERE alignment = 'Neutral';
SELECT COUNT(*) FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Strength';
SELECT T1.race, T2.alignment FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Cameron Hicks';
SELECT percent FROM hero_attribute WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');
SELECT AVG(weight_kg) FROM superhero WHERE race = 'Alien';
SELECT difference FROM superhero WHERE full_name = 'Emil Blonsky' - SELECT difference FROM superhero WHERE full_name = 'Charles Chandler';
SELECT AVG(height_cm) FROM superhero; SELECT AVG(height_cm) FROM superhero;
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Abomination';
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed';
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT T1.attribute_name, T2.attribute_value FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man';
SELECT superhero_name FROM superhero WHERE eye_colour_id = 7 AND hair_colour_id = 9
SELECT publisher_name FROM publisher WHERE publisher_name IN ('Hawkman', 'Karate Kid', 'Speedy');
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL;
SELECT percentage FROM superhero WHERE eye_colour_id = 7;
SELECT ratio FROM superhero WHERE gender_id = 1 OR gender_id = 2;
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;
SELECT power_id FROM superpower WHERE power_name = 'cryokinesis';
SELECT superhero_name FROM superhero WHERE superhero.id = 294
SELECT superhero_name FROM superhero WHERE weight_kg IS NULL;
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.full_name = 'Helen Parr'
SELECT race_id FROM superhero WHERE weight_kg = 108 AND height_cm = 188;
SELECT publisher_name FROM publisher WHERE publisher_id = (SELECT publisher_id FROM superhero WHERE id = 38);
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id GROUP BY T1.race ORDER BY MAX(T4.attribute_value) DESC LIMIT 1;
SELECT T2.alignment, T3.power_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Atom IV'
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');
SELECT AVG(t2.attribute_value) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN alignment AS t3 ON t1.alignment_id = t3.id WHERE t3.alignment = 'Neutral';
SELECT T1.skin_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value = 100
SELECT COUNT(*) FROM superhero AS t1 JOIN gender AS t2 ON t1.gender_id = t2.id JOIN alignment AS t3 ON t1.alignment_id = t3.id WHERE t2.gender = 'Female' AND t3.alignment = 'Good';
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value BETWEEN 75 AND 80;
SELECT race_id FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'male');
SELECT percentage FROM superhero AS t1 JOIN alignment AS t2 ON t1.alignment_id = t2.id JOIN gender AS t3 ON t1.gender_id = t3.id WHERE t2.alignment = 'Bad' AND t3.gender = 'Female';
SELECT (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 7 AND weight_kg != 0) - (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 1 AND weight_kg != 0)
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Hulk' AND T2.attribute_name = 'Strength';
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Ajax';
SELECT COUNT(*) FROM superhero WHERE skin_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Green') AND alignment = 'Bad';
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');
SELECT superhero_name FROM superhero WHERE superhero_name IN (SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control'); ORDER BY superhero_name
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.id = T2.id JOIN hero_attribute AS T3 ON T1.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Phoenix Force';
SELECT superhero_name FROM superhero WHERE publisher_name = 'DC Comics' ORDER BY weight_kg DESC LIMIT 1;
SELECT AVG(height_cm) FROM superhero WHERE race_id <> 'Human' AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');
SELECT COUNT(*) FROM hero_attribute WHERE attribute_value = 100 WHERE attribute_name = 'Speed';
SELECT publisher_name, COUNT(*) AS num_heroes FROM superhero GROUP BY publisher_name ORDER BY num_heroes DESC; SELECT publisher_name, COUNT(*) AS num_heroes FROM superhero GROUP BY publisher_name ORDER BY num_heroes DESC;
SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination';
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';
SELECT publisher_name, COUNT(*) AS num_superheroes FROM superhero WHERE publisher_name = 'George Lucas' GROUP BY publisher_name; SELECT publisher_name, COUNT(*) AS num_female_superheroes FROM superhero WHERE publisher_name = 'George Lucas' AND gender_id IN (SELECT id FROM gender WHERE gender = 'Female') GROUP BY publisher_name; SELECT publisher_name, MULTIPLY(DIVIDE(COUNT(*) AS num_female_superheroes, COUNT(*) AS total_superheroes), 100.0) AS percentage FROM superhero WHERE publisher_name = 'George Lucas' AND gender_id IN (SELECT id FROM gender WHERE gender = 'Female')
SELECT percentage FROM superhero WHERE publisher_name = 'Marvel Comics' AND alignment = 'Good';
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';
SELECT T1.id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id GROUP BY T1.id ORDER BY MIN(T3.attribute_value) LIMIT 1
SELECT superhero_name FROM superhero WHERE superhero_name = 'Alien' SELECT superhero_name FROM superhero WHERE superhero_name = 'Alien'
SELECT superhero_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'brown')
SELECT t2.attribute_value FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id WHERE t1.superhero_name = "Aquababy"
SELECT weight_kg, race_id FROM superhero WHERE superhero.id = 40; SELECT weight_kg, race_id FROM superhero WHERE superhero.id = 40;
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT T1.hero_id FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Intelligence';
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Blackwulf';
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.height_cm > MULTIPLY(AVG(T3.height_cm), 0.8);
SELECT DISTINCT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 18 AND T2.q1 = (SELECT MAX(q1) FROM results WHERE raceId = 18)
SELECT T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19 AND T1.q2 = (SELECT MIN(q2) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19)
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = "Shanghai"
SELECT results.url FROM results JOIN races ON results.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = "Circuit de Barcelona-Catalunya"
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = "Germany"
SELECT DISTINCT T2.position FROM constructors AS T1 JOIN circuits AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = "Renault"
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId IN (SELECT circuitId FROM circuits WHERE location LIKE '%grand prix%' AND continent <> 'Asia' AND continent <> 'Europe')
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = "Spain"
SELECT location FROM circuits WHERE name = "Australian grand prix"
SELECT url FROM circuits WHERE circuitRef = 'sepang international circuit';
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "Sepang International Circuit"
SELECT location, lat, lng FROM circuits WHERE name = "abu dhabi grand prix"
SELECT T1.nationality FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 24 AND T2.points = 1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId = 2
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.number = 355 AND T2.time = "0:01:40"
SELECT T1.number FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.number = 903 AND T2.time = '0:01:54'
SELECT COUNT(*) FROM results WHERE raceId = 3 AND time IS NULL
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.result = 901
SELECT COUNT(DISTINCT drivers.driverId) FROM drivers INNER JOIN results ON drivers.driverId = results.driverId INNER JOIN races ON results.raceId = races.raceId WHERE races.date = "2015-11-29" AND results.time = "00:00:00"
SELECT MAX(dob) FROM drivers WHERE NOT time IS NULL AND driverId IN (SELECT driverId FROM results WHERE raceId = 592)
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, T1.url FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 161 AND T2.milliseconds = 0 ORDER BY T2.milliseconds
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 AND T2.nationality <> "British"
SELECT location FROM circuits WHERE name = "sepang"
SELECT MAX(T2.points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9; SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 ORDER BY T2.points DESC LIMIT 1;
SELECT results.time FROM results WHERE results.raceId = 345 AND results.driverId = 10 AND results.q1 = 'Pit'
SELECT DISTINCT drivers.nationality FROM drivers, results, races WHERE results.driverId = drivers.driverId AND results.raceId = races.raceId AND results.time = '0:01:15' AND races.raceId = 347
SELECT T2.code FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 45 AND T2.surname = "Hamilton"
SELECT results.time FROM results WHERE results.raceId = 743 AND results.driverId = 1
SELECT DISTINCT T2.driverId FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 3 AND T1.year = 2006 AND T1.position = 2
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.result = 901
SELECT COUNT(DISTINCT driverId) FROM results WHERE date = "2015-11-29"
SELECT MAX(dob) FROM drivers WHERE NOT time IS NULL AND raceId = 872
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 348 ORDER BY T2.milliseconds LIMIT 1
SELECT drivers.nationality FROM drivers, results WHERE results.driverId = drivers.driverId AND results.raceId = 348 AND results.fastestLapSpeed = (SELECT MAX(results.fastestLapSpeed) FROM results)
SELECT (SELECT fastestLapSpeed(raceId = 853) FROM results WHERE raceId = 853) - (SELECT fastestLapSpeed(raceId = 854) FROM results WHERE raceId = 854)
SELECT DISTINCT T1.driverId, T1.number, T1.forename, T1.surname, T1.dob, T1.nationality, T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.time LIKE '%1983-07-16%'
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';
SELECT COUNT(*) FROM races WHERE year = 2005 ORDER BY name DESC
SELECT * FROM races WHERE year = (SELECT MIN(year) FROM races) AND month = (SELECT MIN(month) FROM races); SELECT * FROM races WHERE year = (SELECT MIN(year) FROM races) AND month = (SELECT MIN(month) FROM races) AND date != (SELECT MIN(date) FROM races);
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1;
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT DISTINCT name FROM races WHERE year != 2000
SELECT T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "European Grand Prix" ORDER BY T2.year LIMIT 1;
SELECT MAX(year) FROM races WHERE circuitId = (SELECT MAX(circuitId) FROM circuits WHERE name = 'Brands Hatch')
SELECT COUNT(*) FROM circuits WHERE circuitRef = 'silverstone'
SELECT DISTINCT T2.driverId, T2.forename, T2.surname, T2.dob, T2.nationality, T2.url FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 2010 AND T1.circuitId = 4 ORDER BY T1.position
SELECT T1.forename, T1.surname, MAX(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId
SELECT TOP 3 drivers.forename, TOP 3 drivers.surname, SUM(results.points) AS total_points FROM results, races, drivers WHERE races.year = 2017 AND races.name = 'Chinese Grand Prix' AND results.raceId = races.raceId AND results.driverId = drivers.driverId GROUP BY drivers.forename, drivers.surname ORDER BY total_points DESC LIMIT 3
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, T2.name, T2.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM results)
SELECT AVG(time) FROM results WHERE raceId IN (SELECT races.raceId FROM races WHERE races.year = 2009 AND races.name = 'Chinese Grand Prix') AND driverId IN (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Sebastian' AND drivers.surname = 'Vettel')
SELECT DISTINCT (position) FROM results WHERE surname = 'Hamilton' AND year >= 2010; SELECT DISTINCT (position) FROM results WHERE surname = 'Hamilton' AND year >= 2010;
SELECT T1.forename, T1.surname, T1.nationality, AVG(T2.points) FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY MAX(T2.wins) DESC LIMIT 1;
SELECT forename, surname FROM drivers WHERE nationality = 'Japanese' AND age = 2022 - YEAR(dob) + 1
SELECT DISTINCT T2.name FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year >= 1990 AND T1.year <= 2000 GROUP BY T2.name HAVING COUNT(*) = 4;
SELECT T1.name, T1.location, T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = "USA" AND T2.year = 2006
SELECT T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.date LIKE "2005-09%"
SELECT races.name FROM results, races WHERE results.driverId = 2 AND results.position < 10 AND results.raceId = races.raceId
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T4.forename = "Michael" AND T4.surname = "Schumacher" AND T3.name = "Sepang International Circuit" AND T1.rank = 1
SELECT races.year, races.name FROM races JOIN results ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = "Michael" AND drivers.surname = "Schumacher" AND results.milliseconds = (SELECT MIN(milliseconds) FROM results WHERE raceId = races.raceId AND driverId = drivers.driverId)
SELECT AVG(points) FROM results WHERE year = 2000
SELECT MIN(year), MIN(points) FROM results WHERE driverId = 44
SELECT races.name, races.country, races.date FROM races WHERE YEAR(races.date) = 2017 ORDER BY races.date
SELECT races.name, races.year, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.laps = (SELECT MAX(laps) FROM races)
SELECT percentage FROM races WHERE name = 'Europearn Grand Prix' AND country = 'Germany';
SELECT location FROM circuits WHERE name = "Silverstone"
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY max(lat) DESC LIMIT 1;
SELECT circuitRef FROM circuits WHERE name = "marina bay street circuit"
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1;
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT nationality FROM drivers ORDER BY dob LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'italian'
SELECT url FROM drivers WHERE forename = "Anthony" AND surname = "Davidson"
SELECT driverRef FROM drivers WHERE forename = "Lewis" AND surname = "Hamilton"
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year = 2009 AND races.name = "Spanish Grand Prix"
SELECT DISTINCT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Silverstone Circuit")
SELECT * FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "Abu Dhabi Circuit" AND T1.year = 2010
SELECT COUNT(*) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = "Italy" AND T2.sport = "Formula_1"
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "Barcelona-Catalunya"
SELECT url FROM circuits WHERE circuitRef = 'Valencia Street Circuit'
SELECT MIN(T2.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT T2.driverRef FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 1 AND T1.year = 2008 AND T1.rank = 1
SELECT results.raceId, results.year, results.month, results.day, results.time, results.milliseconds, results.points, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed, results.rank, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results
SELECT races.name, results.rank FROM races INNER JOIN results ON results.raceId = races.raceId WHERE results.driverId = 43 AND results.rank = (SELECT MIN(results.rank) FROM results WHERE results.driverId = 43 AND results.raceId = races.raceId)
SELECT MAX(T2.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T2.name = "Spanish Grand Prix"
SELECT DISTINCT year FROM results WHERE driverId = 44
SELECT positionOrder FROM results WHERE raceId = 1 AND year = 2008 AND driverId = 44
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 1 AND T1.year = 2008 AND T1.grid = 4
SELECT COUNT(DISTINCT driverId) FROM results WHERE time <> "null" AND raceId = 1
SELECT MAX(T2.fastestLap) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.name = "2008 Australian Grand Prix" AND T3.forename = "Lewis" AND T3.surname = "Hamilton"
SELECT results.time FROM results WHERE results.rank = 2 AND results.raceId = 1 AND results.year = 2008
SELECT T2.name, T2.url FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 1 AND T1.year = 2008 AND T1.time LIKE '%HH:MM:SS.mmm%'
SELECT COUNT(*) FROM drivers WHERE nationality = 'American' AND date LIKE '%2008%'
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = '2008 Australian Grand Prix' AND T2.time LIKE '%finished the race%' AND T1.nationality = 'Formula_1'
SELECT SUM(points) FROM results WHERE driverId = 44
SELECT AVG(milliseconds) FROM lapTimes WHERE driverId = 44 AND raceId IN (SELECT raceId FROM races WHERE name LIKE '%Formula_1%')
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 1 AND time IS NOT NULL
SELECT (SELECT MAX(time) FROM results WHERE raceId = 1 AND year = 2008) - (SELECT MAX(time) FROM results WHERE raceId = 1 AND year = 2008 AND rank = (SELECT MAX(rank) FROM results WHERE raceId = 1 AND year = 2008)) * 100 / (SELECT MAX(time) FROM results WHERE raceId = 1 AND year = 2008)
SELECT COUNT(*) FROM circuits WHERE country = "Australia" AND location = "Melbourne";
SELECT location FROM circuits WHERE country = 'USA';
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > 1980;
SELECT AVG(points) FROM constructors WHERE nationality = "British"
SELECT * FROM constructorStandings ORDER BY points DESC LIMIT 1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0
SELECT COUNT(*) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Japanese" AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(*) = 2
SELECT DISTINCT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1
SELECT COUNT(*) FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "French" AND T2.number > 50
SELECT COUNT(DISTINCT results.driverId) AS "Number of Drivers", results.year AS "Year", results.time AS "Time", results.points AS "Points", results.rank AS "Rank", results.fastestLapTime AS "Fastest Lap Time", results.fastestLapSpeed AS "Fastest Lap Speed", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS
SELECT year, AVG(TIMEDIFF(finished_time, start_time)) AS average_time FROM results WHERE NOT finished_time IS NULL GROUP BY year
SELECT forename, surname FROM drivers WHERE year(dob) > 1975 AND rank = 2;
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Italian" AND T2.time IS NULL;
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapTime LIMIT 1
SELECT MAX(T2.fastestLap) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = "Spanish Grand Prix"
SELECT races.name, races.year FROM races JOIN results ON races.raceId = results.raceId WHERE results.milliseconds IS NOT NULL ORDER BY results.milliseconds LIMIT 1;
SELECT AVG(percentage) FROM results WHERE year BETWEEN 2000 AND 2005 AND laps > 50 AND (year(dob) < 1985 OR year(dob) = 1985)
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "French" AND T2.milliseconds < 02000000
SELECT * FROM drivers WHERE nationality = 'America'
SELECT raceId FROM races WHERE year = 2009
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18
SELECT COUNT(*) FROM drivers WHERE nationality = 'Netherlandic' AND year(dob) = (SELECT MAX(year(dob)) FROM drivers)
SELECT driverRef FROM drivers WHERE forename = "Robert" AND surname = "Kubica";
SELECT COUNT(*) FROM drivers WHERE nationality = 'Australian' AND year(dob) = 1980;
SELECT * FROM drivers WHERE nationality = 'German' AND year(dob) BETWEEN 1980 AND 1990 ORDER BY MIN(time) LIMIT 3;
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY year(dob) LIMIT 1;
SELECT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob LIKE "1971%" AND T2.fastestLapTime = (SELECT MAX(fastestLapTime) FROM results)
SELECT * FROM drivers WHERE nationality = 'Spanish' AND year(dob) < 1982 ORDER BY MAX(time) DESC LIMIT 10;
SELECT year FROM results ORDER BY fastestLapTime LIMIT 1
SELECT year FROM lapTimes GROUP BY year ORDER BY AVG(milliseconds) DESC LIMIT 1;
SELECT T1.driverId, MIN(T2.time) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.laps = 1 GROUP BY T1.driverId ORDER BY MIN(T2.time) DESC LIMIT 5
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NULL
SELECT COUNT(*) FROM circuits WHERE country = 'Austria' AND location LIKE '%A%' AND lat > 48.2 AND lng > 16.2
SELECT MAX(number) FROM results
SELECT drivers.nationality, drivers.dob FROM drivers INNER JOIN results ON drivers.driverId = results.driverId INNER JOIN races ON results.raceId = races.raceId WHERE races.raceId = 23 AND results.q2 IS NOT NULL;
SELECT T1.name, T1.date, T1.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = "Max" AND T3.surname = "Verstappen" AND T1.year = 2015 ORDER BY T3.dob DESC LIMIT 1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "American" AND T2.statusId = 2;
SELECT MAX(t.points) AS max_points, t.constructorId AS constructor_id, t.constructorRef AS constructor_ref, t.nationality, t.url FROM constructorStandings AS t WHERE t.nationality = 'Italian' AND t.constructorId IN (SELECT MAX(c.constructorId) FROM constructors AS c) GROUP BY t.constructorId, t.constructorRef, t.nationality, t.url ORDER BY max_points DESC
SELECT constructors.url FROM constructors WHERE constructors.constructorId = (SELECT MAX(constructors.constructorId) FROM constructors)
SELECT MAX(T2.time) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 3
SELECT races.name, MIN(milliseconds) FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId WHERE lap = 1 GROUP BY races.name
SELECT AVG(fastestLapTime) FROM results WHERE raceId = 2 AND year = 2006 AND rank < 11
SELECT T1.forename, T1.surname, AVG(T2.duration) AS avg_duration, COUNT(T2.duration) AS count, MAX(T2.duration) AS max_duration, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX
SELECT T2.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = "Canadian Grand Prix" AND YEAR(T1.year) = 2008 ORDER BY T1.rank LIMIT 1
SELECT MAX(T2.time), T1.constructorRef, T1.url FROM constructorStandings AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 2009 AND T2.position = 1
SELECT forename, surname, dob FROM drivers WHERE year(dob) BETWEEN '1981' AND '1991' AND nationality = 'Austrian'
SELECT forename, surname, nationality, dob, year(dob) FROM drivers WHERE nationality = 'German' AND year(dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC
SELECT location, country, lat, lng FROM circuits WHERE name = "Hungaroring"
SELECT MAX(T2.points) AS score, T2.name, T2.nationality FROM results AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = (SELECT MAX(raceId) FROM races WHERE year BETWEEN 1980 AND 2010) GROUP BY T2.name, T2.nationality
SELECT AVG(T2.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = (SELECT races.raceId FROM races WHERE races.name = "Turkish Grand Prix") AND T2.forename = "Lewis" AND T2.surname = "Hamilton";
SELECT AVG(year) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31'
SELECT MAX(nationality) FROM drivers
SELECT COUNT(*) FROM results WHERE points = (SELECT MAX(points) FROM results WHERE rank = 91)
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT T2.name, T2.location, T2.country FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date = (SELECT MAX(date) FROM results)
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = (SELECT MIN(raceId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008) AND T1.position = 1
SELECT forename, surname, nationality, name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = (SELECT MAX(raceId) FROM results)
SELECT COUNT(*) FROM results WHERE results.driverId = (SELECT MAX(results.driverId) FROM results WHERE results.raceId = (SELECT races.raceId FROM races WHERE races.name = 'Canadian Grand Prix')) AND results.statusId = 3
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.dob = (SELECT MIN(dob) FROM drivers) AND T2.year = 2015
SELECT MAX(duration) FROM pitStops
SELECT MAX(time) FROM lapTimes
SELECT MAX(duration) FROM pitStops WHERE driverId = 44
SELECT lap FROM pitStops WHERE raceId = 1 AND driverId = 1 AND stop = 1
SELECT drivers.driverId, drivers.surname, drivers.forename, pitStops.time FROM pitStops JOIN results ON pitStops.raceId = results.raceId JOIN drivers ON pitStops.driverId = drivers.driverId WHERE results.year = 2011 AND results.raceId = 1
SELECT MIN(milliseconds) FROM lapTimes WHERE raceId IN (SELECT races.raceId FROM races JOIN results ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton')
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT T2.position FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.driverId = 44 AND T1.constructorId = 13 AND T1.points = (SELECT MIN(T1.points) FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.driverId = 44 AND T1.constructorId = 13)
SELECT MAX(milliseconds) FROM lapTimes WHERE raceId = 4
SELECT c.name, c.location, MIN(t.milliseconds) AS fastest_milliseconds FROM circuits c JOIN lapTimes t ON c.circuitId = t.circuitId WHERE c.country = 'Italy' GROUP BY c.name, c.location
SELECT races.name FROM circuits, races WHERE circuits.name = 'Austrian Grand Prix Circuit' AND races.circuitId = circuits.circuitId AND races.year = (SELECT MAX(year) FROM races WHERE races.circuitId = circuits.circuitId)
SELECT MAX(T2.duration) FROM results AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId = (SELECT MAX(T1.driverId) FROM results AS T1 JOIN circuits AS T2 ON T1.raceId = T2.circuitId WHERE T2.name = 'Austrian Grand Prix Circuit')
SELECT DISTINCT T1.location FROM circuits AS T1 JOIN lapTimes AS T2 ON T1.circuitId = T2.circuitId WHERE T2.time = '1:29.488'
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = 44
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1;
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;
SELECT preferred_foot FROM Player_Attributes WHERE date = (SELECT MIN(date) FROM Player_Attributes);
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating > = 60 AND overall_rating < 65 AND defensive_work_rate = 'low';
SELECT player_api_id FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)
SELECT league_id, MAX(SUM(home_team_goal, away_team_goal)) AS goals FROM Match WHERE season = '2015/2016' GROUP BY league_id ORDER BY goals DESC
SELECT home_team_api_id, COUNT(*) AS home_team_lost FROM Match WHERE season = '2015/2016' AND home_team_api_id IN (SELECT home_team_api_id FROM Team) AND away_team_api_id IN (SELECT away_team_api_id FROM Team) GROUP BY home_team_api_id ORDER BY COUNT(*) LIMIT 1;
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'T1.player_name' GROUP BY T1.player_api_id ORDER BY MAX(T2.penalties) DESC LIMIT 10;
SELECT MAX(SUBTRACT(T2.away_team_goal, T2.home_team_goal) > 0) FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Scotland Premier League' AND T2.season = '2009/2010';
SELECT T1.team_api_id, T1.team_fifa_api_id, MAX(T2.buildUpPlaySpeed) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id GROUP BY T1.team_api_id ORDER BY MAX(T2.buildUpPlaySpeed) DESC LIMIT 4;
SELECT T2.name FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(T1.home_team_goal = T1.away_team_goal) DESC LIMIT 1;
SELECT * FROM Player_Attributes WHERE date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00' AND sprint_speed > = 97; SELECT * FROM Player_Attributes WHERE date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00' AND sprint_speed > = 97;
SELECT League.name, MAX(COUNT(league_id)) FROM League INNER JOIN Match ON League.id = Match.league_id GROUP BY League.id ORDER BY MAX(COUNT(league_id)) DESC LIMIT 1;
SELECT AVG(height) FROM Player WHERE birthday > '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '%2010%' GROUP BY player_api_id HAVING AVG(overall_rating) > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '%2010%') ORDER BY AVG(overall_rating) DESC LIMIT 10
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59;
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012')
SELECT DIVIDE(MULTIPLY((SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND date BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00'), 1.0), (SELECT COUNT(*) FROM Player_Attributes WHERE date BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00')); SELECT DIVIDE(MULTIPLY((SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND date BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00'), 1.0), (SELECT COUNT(*) FROM Player_Attributes WHERE date BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00'));
SELECT League.name, COUNT(*) AS goals_made FROM League JOIN Match ON League.id = Match.league_id GROUP BY League.id ORDER BY goals_made DESC LIMIT 5;
SELECT AVG(long_shots) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');
SELECT player_name FROM Player WHERE height > 180 ORDER BY average_heading_accuracy DESC LIMIT 10;
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date > '2014-01-01 00:00:00' AND T2.date < '2014-01-31 00:00:00' GROUP BY T1.team_api_id HAVING AVG(T2.chanceCreationPassing) < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date > '2014-01-01 00:00:00' AND date < '2014-01-31 00:00:00') ORDER BY chanceCreationPassing DESC;
SELECT League.name FROM League, Match WHERE League.season = '2009/2010' AND Match.league_id = League.id AND Match.home_team_api_id = Team.team_api_id AND Match.away_team_api_id = Team.team_api_id AND Team.team_name = 'home' GROUP BY League.name HAVING AVG(home_team_goal) > AVG(away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';
SELECT * FROM Player WHERE year = '1970' AND month = '10';
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Franco Zennaro"
SELECT AVG(buildUpPlayPositioningClass) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag';
SELECT Player_Attributes.finishing FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Francois Affolter' AND Player_Attributes.date = '2014-09-18 00:00:00';
SELECT SUM(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id JOIN Player AS T3 ON T1.player_api_id = T3.player_api_id WHERE T3.player_name = 'Gabriel Tamas' AND T1.date = '2011';
SELECT COUNT(*) FROM Match WHERE season LIKE '%2015/2016%' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League');
SELECT preferred_foot FROM Player_Attributes WHERE date = (SELECT MAX(date) FROM Player_Attributes);
SELECT player_api_id, MAX(potential) FROM Player_Attributes GROUP BY player_api_id;
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky';
SELECT DISTINCT T1.defensive_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "David Wilson"
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = "Netherlands";
SELECT AVG(home_team_goal) FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Poland') AND season = '2010/2011';
SELECT T1.player_name, AVG(T1.finishing) AS average_finishing_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_name ORDER BY average_finishing_rate DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990';
SELECT COUNT(*) FROM Player WHERE weight > 170 AND player_name LIKE 'Adam%';
SELECT player_name FROM Player_Attributes WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010';
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Doran'
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left';
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast';
SELECT buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = "CLB";
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70
SELECT AVG(overall_rating) FROM Player_Attributes WHERE date BETWEEN '2010-01-01' AND '2015-12-31' AND height > 170;
SELECT player_api_id, player_name, height FROM Player ORDER BY height LIMIT 1;
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A';
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = 218353;
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND date BETWEEN strftime('%Y-%m', date) AND '2008-10';
SELECT T1.team_short_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10
SELECT player_api_id, MAX(balance) AS highest_balance, MAX(potential) AS highest_potential FROM Player_Attributes WHERE potential = 61 GROUP BY player_api_id ORDER BY highest_balance DESC
SELECT difference FROM (SELECT AVG(ball_control) FROM Player WHERE player_name = 'Abdou Diallo') AS T1, (SELECT AVG(ball_control) FROM Player WHERE player_name = 'Aaron Appindangoye') AS T2;
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';
SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY birthday LIMIT 1;
SELECT player_api_id FROM Player ORDER BY height DESC LIMIT 1;
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League';
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany';
SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating > 80 AND defensive_work_rate = 'high' AND players.player_api_id IN (SELECT players.player_api_id FROM players WHERE strftime('%Y', birthday)<'1986');
SELECT player_api_id, MAX(crossing) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone')) GROUP BY player_api_id ORDER BY MAX(crossing) DESC LIMIT 1;
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Ariel Borysiuk"
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70;
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70
SELECT COUNT(*) FROM Match WHERE season = '2008/09' AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium');
SELECT MAX(T1.long_passing) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.birthday = (SELECT MAX(birthday) FROM Player);
SELECT COUNT(*) FROM Match WHERE League.name = 'Belgium Jupiler League' AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04';
SELECT league_id FROM Match WHERE season = '2008/2009' GROUP BY league_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT AVG(overall_rating) FROM Player_Attributes WHERE birthday < '1986';
SELECT (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel') * 100 / (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel')
SELECT AVG(buildUpPlaySpeed) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian';
SELECT AVG(overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';
SELECT SUM(T2.crossing) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Lennox';
SELECT MAX(chanceCreationPassing) AS score, chanceCreationPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax'
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo';
SELECT MAX(overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon';
SELECT AVG(T2.away_team_goal) FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'Parma' AND T2.country_id = (SELECT Country_ID FROM Country WHERE Country_Name = 'Italy')
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date = '2016-06-23' ORDER BY T1.birthday LIMIT 1
SELECT overall_rating FROM Player_Attributes WHERE date = '2016-02-04 00:00:00' AND player_name = 'Aaron Mooy';
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00';
SELECT T1.player_api_id, T1.player_name, T1.player_fifa_api_id, T1.date, T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date = '2015-05-01 00:00:00';
SELECT Player_Attributes.defensive_work_rate FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Kevin Berigaud' AND Player_Attributes.date = '2013-02-22 00:00:00';
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant')
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_long_name = 'Willem II' AND T1.date = '2012-02-22 00:00:00'
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00';
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_long_name = 'FC Lorient') AND date = '2010-02-22'
SELECT chanceCreationPassingClass FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_long_name = 'PEC Zwolle') AND date = '2013-09-20 00:00:00'
SELECT T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_long_name = 'Hull City' AND T1.date = '2010-02-22 00:00:00';
SELECT T2.defenceAggressionClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date = '2015-09-10 00:00:00';
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Marko Arnautovic') AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';
SELECT (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan') AS player_api_id, (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery') AS player_api_id, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating_higher, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating_lower, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating_higher_percentage, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating_lower_percentage FROM Player WHERE date = '2013-07-12' AND player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE date = '2013-07-12' AND player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AND player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery') ORDER BY overall_rating DESC LIMIT 1; SELECT (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating FROM Player WHERE date = '2013-07-12'; SELECT (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Don
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5;
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE birthday < datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday) > 34
SELECT SUM(T1.home_team_goal) FROM Match AS T1 JOIN Player AS T2 ON T1.home_team_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennon'
SELECT SUM(T2.away_team_goal) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.home_player_api_id WHERE T1.player_name = 'Daan Smith' OR T1.player_name = 'Filipe Ferreira'
SELECT SUM(home_team_goal) FROM Match WHERE age < 30
SELECT player_name FROM Player ORDER BY overall_rating DESC LIMIT 10;
SELECT player_name FROM Player ORDER BY potential DESC LIMIT 1
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'high'
SELECT player_name FROM Player WHERE finishing = 1 ORDER BY age DESC LIMIT 1;
SELECT player_name FROM Player WHERE country_api_id IN (SELECT id FROM Country WHERE name = 'Belgium')
SELECT T1.name, T1.vision, T1.country_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.vision > 89
SELECT country_id, AVG(weight) FROM Player GROUP BY country_id ORDER BY AVG(weight) DESC LIMIT 1;
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow';
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'
SELECT AVG(T1.height) FROM Player AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_name = 'Italy';
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990';
SELECT (SELECT jumping FROM Player WHERE id = 6) - (SELECT jumping FROM Player WHERE id = 23)
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' AND potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') LIMIT 3; SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' AND potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') LIMIT 3;
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left');
SELECT COUNT(*) FROM Player_Attributes WHERE strength > 80 AND stamina > 80
SELECT country_id FROM Match WHERE league_id = 101
SELECT home_team_goal, away_team_goal FROM Match WHERE date = '2008-09-24%' AND league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Belgian')) AND home_team_api_id IN (SELECT id FROM Team WHERE team_api_id IN (SELECT id FROM Team WHERE team_fifa_api_id IN (SELECT id FROM Team_Attributes WHERE team_fifa_api_id = 1))) AND away_team_api_id IN (SELECT id FROM Team WHERE team_api_id IN (SELECT id FROM Team WHERE team_fifa_api_id IN (SELECT id FROM Team_Attributes WHERE team_fifa_api_id = 1)))
SELECT Player_Attributes.sprint_speed, Player_Attributes.agility, Player_Attributes.acceleration FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Alexis Blin'
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'KSV Cercle Brugge';
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A')
SELECT MAX(home_team_goal) FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Netherlands'))
SELECT T1.finishing, T1.curve FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight = (SELECT MAX(weight) FROM Player)
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.date = '2015/2016' GROUP BY T1.team_long_name ORDER BY COUNT(T1.team_api_id) DESC LIMIT 1;
SELECT T2.team_long_name FROM Match AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id GROUP BY T1.away_team_api_id ORDER BY SUM(T1.away_team_goal) DESC LIMIT 1;
SELECT player_api_id, player_name, overall_rating, MAX(overall_rating) FROM Player_Attributes JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id GROUP BY player_api_id, player_name ORDER BY overall_rating DESC LIMIT 1;
SELECT AVG(percentage) FROM (SELECT DIVIDE(COUNT(*),COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END)) AS percentage FROM Player_Attributes WHERE overall_rating > 70) AS T
SELECT (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') - (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-')
SELECT (SELECT COUNT(ID) FROM Patient WHERE year(Birthday) > '1930' AND SEX = 'F') / (SELECT COUNT(ID) FROM Patient WHERE SEX = 'F')
SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31' AND Admission = '+'
SELECT (SELECT COUNT(ID) FROM Examination WHERE Diagnosis = 'SLE' AND Admission = '+') / (SELECT COUNT(ID) FROM Examination WHERE Diagnosis = 'SLE' AND Admission = '-')
SELECT Examination.Diagnosis, Laboratory.Date FROM Examination INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.ID = 30609
SELECT Patient.SEX, Patient.Birthday, Examination.Examination_Date, Examination.Symptoms FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.ID = 163109
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;
SELECT Patient.ID, Patient.Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RVVT = '+'
SELECT ID, SEX, Diagnosis FROM Patient WHERE Thrombosis > 2;
SELECT * FROM Patient WHERE YEAR(Birthday) = '1937' AND `T-CHO` > = 250;
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALB < 3.5;
SELECT COUNT(*) FROM Laboratory WHERE (SEX = 'F' AND TP < '6.0' OR TP > '8.5')
SELECT AVG(aCL IgG) FROM Examination WHERE Admission = '+' AND SUBTRACT(year(CURRENT_TIMESTAMP), year(Birthday)) >= 50
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND year(Description) = '1997' AND Admission = '-'
SELECT MIN(age) FROM Patient WHERE NOT `First Date` IS NULL
SELECT COUNT(*) FROM Examination WHERE YEAR(Examination.Examination_Date) = 1997 AND Examination.Thrombosis = 1 AND Examination.Sex = 'F';
SELECT MAX(year(Birthday)) - MIN(year(Birthday)) FROM Patient WHERE NOT TG IS NULL;
SELECT T1.Symptoms, T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T2.Birthday DESC LIMIT 1;
SELECT AVG(COUNT(ID)) FROM Patient WHERE SEX = 'M' AND Date BETWEEN '1998-01-01' AND '1998-12-31' AND NOT Date IS NULL
SELECT MAX(Laboratory.Date), MAX(Patient.Birthday) - (YEAR(Patient.Birthday) - YEAR(Laboratory.Date)) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Diagnosis = 'SJS'
SELECT (SELECT SUM(UA <= '8.0' and SEX = 'M') FROM Laboratory) / (SELECT SUM(UA <= '6.5' and SEX = 'F') FROM Laboratory)
SELECT COUNT(DISTINCT Patient.ID) FROM Patient LEFT JOIN Examination ON Patient.ID = Examination.ID WHERE NOT Examination.ID IS NULL AND YEAR(Patient.First_Date) - YEAR(Examination.Examination_Date) >= 1
SELECT COUNT(*) FROM Examination WHERE YEAR(Birthday) < 18 AND `Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND `T-BIL` > 2.0
SELECT MAX(COUNT(Diagnosis)) FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31';
SELECT AVG(SUBTRACT('1999', year(Birthday))) FROM Patient WHERE NOT Birthday IS NULL AND MONTH(Birthday) = 10 AND YEAR(Birthday) = 1991
SELECT T1.Birthday, T1.Description, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.HGB = (SELECT MAX(HGB) FROM Examination)
SELECT `aCL IgA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT COUNT(*) FROM Examination WHERE Examination.ID = 2927464 AND Examination.TG < 250 AND Examination.Date = '1995-09-04'
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY 'First Date' LIMIT 1;
SELECT aCL IgM FROM Examination WHERE Patient.ID = (SELECT Patient.ID FROM Patient WHERE Patient.Description = '1994-02-19') AND Examination.Description = '1993/11/12'
SELECT Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT = '9' AND Laboratory.Date = '1992-06-12'
SELECT SUBTRACT('1992', year(Birthday)) FROM Patient WHERE Patient.ID IN (SELECT Laboratory.ID FROM Laboratory WHERE Laboratory.UA = '8.4' AND Laboratory.Date = '1991-10-21');
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SJS' AND Patient.First_Date = '1991-06-13' AND NOT Patient.First_Date IS NULL AND STRFTIME('%y', Laboratory.Date) = '1995'
SELECT patient.diagnosis FROM patient JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'SLE' AND examination.examination_date = '1997-01-27' AND NOT patient.diagnosis IS NULL ORDER BY patient.first_date LIMIT 1
SELECT Symptoms FROM Examination WHERE `Examination Date` = '1993-09-27' AND Patient.Birthday = '1959-03-01'
SELECT (SELECT SUM(Laboratory.T-CHO) FROM Laboratory WHERE Laboratory.Date BETWEEN '1981-11-01' AND '1981-11-30' AND Laboratory.Date BETWEEN '1981-12-01' AND '1981-12-31') - (SELECT SUM(Laboratory.T-CHO) FROM Laboratory WHERE Laboratory.Date BETWEEN '1981-11-01' AND '1981-11-30' AND Laboratory.Date BETWEEN '1981-12-01' AND '1981-12-31')
SELECT * FROM Patient WHERE Diagnosis = 'Behcet' INTERSECT SELECT * FROM Examination WHERE YEAR(Description) > = '1997-1-1' AND YEAR(Description) < '1998-1-1'
SELECT * FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4 ORDER BY ID
SELECT ID, SEX, Birthday, Admission, COUNT(*) FROM Patient WHERE YEAR(Birthday) = 1964 AND SEX = 'F' GROUP BY ID, SEX, Birthday, Admission;
SELECT COUNT(*) FROM Examination WHERE Thrombosis > 2 AND ANA = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) FROM Examination)
SELECT AVG(UA < = 6.5) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30;
SELECT AVG(CASE WHEN SEX = 'M' AND YEAR(`FIRST DATE`) = '1981' THEN (SELECT COUNT(*) FROM Patient WHERE YEAR(`FIRST DATE`) = '1981' AND SEX = 'M') * (SELECT COUNT(*) FROM Examination WHERE YEAR(`FIRST DATE`) = '1981' AND SEX = 'M' AND Diagnosis = 'BEHCET') / (SELECT COUNT(*) FROM Patient WHERE YEAR(`FIRST DATE`) = '1981' AND SEX = 'M') END) FROM Examination WHERE YEAR(`FIRST DATE`) = '1981' AND Diagnosis = 'BEHCET';
SELECT * FROM Patient WHERE Admission = '-' AND Date LIKE '1991-10%' AND T-BIL < 2.0
SELECT COUNT(*) FROM Examination WHERE ANA_PATTERN != 'p' AND BIRTHDAY BETWEEN 1980 AND 1989
SELECT Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'PSS' AND Laboratory.CRP > 2 AND Laboratory.CRE = 1 AND Laboratory.LDH = 123
SELECT AVG(ALB) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T2.Diagnosis = 'SLE';
SELECT MAX(symptoms) FROM Examination WHERE diagnosis = 'SLE';
SELECT Patient.Description, Patient.Diagnosis FROM Patient WHERE Patient.ID = 48473 ORDER BY Patient.Description LIMIT 1
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';
SELECT COUNT(*) FROM Examination WHERE YEAR(DATE) = '1997' AND (tp > 6 AND tp < 8.5)
SELECT AVG(CASE WHEN Thrombosis IS NULL THEN 0 ELSE 1 END) FROM Examination WHERE Diagnosis LIKE '%SLE%'
SELECT COUNT(SEX) FROM Patient WHERE YEAR(BIRTHDAY) = '1980' AND diagnosis = 'RA' AND SEX = 'F'
SELECT COUNT(*) FROM Examination WHERE SEX = 'M' AND `Examination Date` BETWEEN '1995' AND '1997' AND Diagnosis = 'BEHCET' AND Admission = '-';
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5
SELECT DATEDIFF(Examination Date, First Date) FROM Examination WHERE Examination.ID = 821298
SELECT COUNT(*) FROM Examination WHERE Examination.ID = 57266 AND (Examination.UA > 8.0 AND Examination.SEX = 'M') OR (Examination.UA > 6.5 AND Examination.SEX = 'F');
SELECT Date FROM Laboratory WHERE ID IN (SELECT Patient.ID FROM Patient WHERE Patient.ID = 48473) AND GOT > 60
SELECT Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND YEAR(Laboratory.Date) = 1994
SELECT ID FROM Patient WHERE SEX = 'M' AND GPT > 60
SELECT * FROM Patient WHERE GPT > 60 ORDER BY Birthday DESC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500
SELECT Patient.ID, Patient.Age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH >= 600 AND Laboratory.LDH <= 800;
SELECT * FROM Laboratory WHERE ALP < 300 AND Admission = '+'; SELECT * FROM Laboratory WHERE ALP < 300 AND Admission = '-';
SELECT Patient.ID FROM Patient WHERE Patient.Birthday = '1982-04-01' AND NOT Patient.ALP IS NULL AND Patient.ALP < 300
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0
SELECT (SELECT SUM(CASE WHEN TP > 8.5 THEN (TP - 8.5) ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F')
SELECT * FROM Patient WHERE SEX = 'M' AND ALB < = 3.5 OR ALB > = 5.5 ORDER BY Birthday DESC
SELECT * FROM Patient WHERE YEAR(Birthday) = '1982' AND (ALB >= 3.5 AND ALB <= 5.5);
SELECT COUNT(*) FROM Laboratory WHERE Sex = 'F' AND UA > 8.0 OR Sex = 'F' AND UA > 6.5;
SELECT AVG(UA) FROM Laboratory WHERE UA < 8.0 AND SEX = 'M' OR UA < 6.5 AND SEX = 'F' AND NOT UA IS NULL ORDER BY Date DESC LIMIT 1;
SELECT ID, SEX, Birthday FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE UN = 29)
SELECT ID, SEX, Birthday FROM Patient WHERE Diagnosis = 'RA' AND UN < 30;
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT CRE IS NULL AND CRE > 1.5;
SELECT ( (SELECT SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) FROM Patient WHERE NOT CRE IS NULL AND CRE > 1.5) > (SELECT SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) FROM Patient WHERE NOT CRE IS NULL AND CRE > 1.5) ) True
SELECT MAX(T-BIL) FROM Laboratory
SELECT Sex, SUM(T-BIL) FROM Laboratory WHERE T-BIL > = 2.0 GROUP BY Sex;
SELECT patient_id, T-CHO FROM Laboratory ORDER BY T-CHO DESC LIMIT 1; SELECT patient_id, T-CHO FROM Laboratory ORDER BY T-CHO DESC LIMIT 1;
SELECT AVG(DISTINCT T1.Birthday) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.T-CHO > = 250;
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 100;
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'male' AND T2.TG > 200 AND T1.Birthday < CURRENT_DATE AND T1.Birthday >= '1960-01-01';
SELECT DISTINCT ID FROM Examination WHERE ANA < 16 AND KCT = 'outpatient' AND CPK < 250
SELECT COUNT(*) FROM Patient WHERE Birthday BETWEEN '1936' AND '1956' AND SEX = 'M' AND NOT CPK IS NULL AND CPK > 250;
SELECT Patient.ID, Patient.SEX, Patient.AGE FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'female' AND Patient.AGE >= 18 AND Laboratory.GLU > 180 AND Laboratory.T-CHO < 250;
SELECT Patient.ID, Laboratory.GLU FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Description) > = 1991 AND Laboratory.GLU < 180;
SELECT Patient.ID, Patient.SEX, Patient.Birthday, COUNT(Patient.ID) AS c1 FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.WBC < 3.5 OR Laboratory.WBC > 9.0 GROUP BY Patient.SEX ORDER BY Patient.Birthday;
SELECT patient.ID, patient.Age, patient.Diagnosis FROM patient WHERE patient.RBC < 3.5;
SELECT * FROM Patient WHERE Sex = 'F' AND age(Birthday) >= 50 AND (RBC < 3.5 OR RBC > 6.0) AND Admission = '+'
SELECT ID, SEX FROM Patient WHERE Admission = '-' AND HBG < 10;
SELECT ID, SEX FROM Patient WHERE Diagnosis = 'SLE' AND HGB < 10 AND HGB > 17 ORDER BY Birthday LIMIT 1;
SELECT patient.ID, patient.Age FROM Patient JOIN Laboratory ON patient.ID = Laboratory.ID WHERE patient.Age > (SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(patient.Birthday) FROM Patient WHERE patient.ID = Laboratory.ID) AND Laboratory.HCT >= 52 GROUP BY patient.ID HAVING COUNT(*) > 2;
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;
SELECT COUNT(*) FROM Laboratory WHERE PLT < 100 - (SELECT COUNT(*) FROM Laboratory WHERE PLT > 400);
SELECT * FROM Patient WHERE YEAR(CURRENT_TIMESTAMP) = 1984 AND SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(Birthday)) < 50 AND PLT BETWEEN 100 AND 400;
SELECT AVG(percentage) FROM (SELECT SUM(CASE WHEN PT > = 14 AND SEX = 'F' THEN 1 ELSE 0 END) AS percentage FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Patient.AGE > 55) AS t
SELECT * FROM Patient WHERE `First Date` > 1992 AND PT < 14;
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;
SELECT COUNT(*) FROM Examination WHERE APTT > 45 AND Thrombosis = 3
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND WBC BETWEEN 3.5 AND 9.0 AND FG < = 150 OR FG > = 450
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND Laboratory.FG < 150 OR Laboratory.FG > 450;
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.U-PRO > 30;
SELECT patient_id FROM Patient WHERE NOT `U-PRO` IS NULL AND `U-PRO` < 30 AND Diagnosis = 'SLE';
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` < 900 AND Symptoms = 'abortion';
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL;
SELECT Diagnosis FROM Examination WHERE `aCL IgA` = (SELECT MAX(aCL IgA) FROM Examination WHERE `aCL IgA` BETWEEN 80 AND 500);
SELECT COUNT(*) FROM Patient WHERE YEAR(`First Date`) > = 1990 AND IGA BETWEEN 80 AND 500;
SELECT Diagnosis FROM Examination WHERE `aCL IgM` < 40 OR `aCL IgM` > 400 GROUP BY Diagnosis ORDER BY MAX(COUNT(Diagnosis)) DESC LIMIT 1;
SELECT COUNT(*) FROM Patient WHERE NOT Description IS NULL; SELECT COUNT(*) FROM Patient WHERE NOT Description IS NULL;
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Patient.Birthday IS NULL AND Laboratory.CRP > 1.0 AND YEAR(CURDATE()) - YEAR(Patient.Birthday) < 18;
SELECT COUNT(DISTINCT ID) FROM Examination WHERE RVVT = '+-' AND KCT = '+';
SELECT Disease FROM Examination WHERE YEAR(Birthday) > = 1995 AND RA = '-' OR RA = '+-';
SELECT Patient.ID FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Patient.Birthday < CURDATE() - INTERVAL 1 YEAR AND Laboratory.RF < 20;
SELECT COUNT(*) FROM Examination WHERE RF < 20 AND Thrombosis = 0;
SELECT COUNT(DISTINCT t1.ID) FROM (SELECT Patient.ID, Examination.ANA_Pattern, Examination.Examination_Date FROM Examination JOIN Patient ON Examination.Patient_ID = Patient.ID WHERE Examination.aCL_IgG > 35 AND Examination.aCL_IgM > 35 AND Examination.ANA_Pattern = 'P') AS t1
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.HCT < 29 OR Examination.HCT > 52 AND Examination.ANA = 'N' AND Examination.aCL IgA = (SELECT MAX(Examination.aCL IgA) FROM Examination WHERE Examination.HCT < 29 OR Examination.HCT > 52 AND Examination.ANA = 'N')
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Diagnosis = 'APS' AND Examination.C4 > 10
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '+' AND Laboratory.RNP = '-'
SELECT Birthday FROM Patient WHERE RNP <> '-' ORDER BY Birthday DESC LIMIT 1;
SELECT COUNT(*) FROM Examination WHERE SM = 'negative' AND Thrombosis = '1';
SELECT ID FROM Patient WHERE NOT SEX IS NULL AND Birthday IS NULL ORDER BY Birthday DESC LIMIT 3;
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Examination_Date > '1997-01-01' AND Examination.SC170 = '-'
SELECT COUNT(DISTINCT t1.ID) FROM (SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Examination.Thrombosis, Examination.Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.aCL_IgG = 0 AND Examination.aCL_IgM = 0 AND Examination.ANA = 0 AND Examination.Thrombosis = 0 AND Examination.Symptoms = 'vertigo') AS t1 WHERE t1.SEX = 'M';
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE NOT Patient.Description IS NULL AND Patient.First Date < 1990
SELECT Patient.ID FROM Patient WHERE NOT Patient.Description IS NULL ORDER BY Patient.First Date LIMIT 1; SELECT Patient.ID FROM Patient WHERE NOT Patient.Description IS NULL ORDER BY Patient.First Date LIMIT 1;
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN('-', '+-') AND Diagnosis = 'SLE';
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN('-', '+-') AND Symptoms IS NOT NULL
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND CENTROMEA IN('-', '+-') AND SSB IN('-', '+-');
SELECT DISTINCT Diagnosis FROM Examination WHERE `DNA-II` > 8;
SELECT COUNT(DISTINCT ID) FROM Patient WHERE NOT Description IS NULL AND NOT DNA IS NULL AND DNA < 8
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA_II < 8 AND T1.Admission = '+'
SELECT MULTIPLY(DIVIDE(COUNT(ID WHERE GOT > = 60 AND Diagnosis = 'SLE'), COUNT(ID WHERE GOT > = 60)), 1.0) FROM Laboratory WHERE GOT > = 60 AND Diagnosis = 'SLE';
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT GOT < 60;
SELECT MIN(Birthday) FROM Patient WHERE NOT GOT > = 60;
SELECT TOP 3 Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT < 60 ORDER BY Patient.Birthday DESC
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT GOT < 60;
SELECT MIN(Patient.First Date) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'male' AND Laboratory.LDH < 500;
SELECT MAX(Patient.First_Date) FROM Patient WHERE Patient.ID IN (SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.Patient_ID WHERE Laboratory.LDH > = 500);
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND ALP > = 300;
SELECT COUNT(*) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.ALP < 300;
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.TP < 6.0
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'SJS' AND TP > 6.0 AND TP < 8.5;
SELECT MAX(ALB > 3.5 and ALB < 5.5) AS Examination_Date FROM Examination
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND (ALB > 3.5 AND ALB < 5.5) AND (TP > 6.0 AND TP < 8.5);
SELECT MAX(UA) FROM Laboratory WHERE Sex = 'F' AND UA > 6.50; SELECT MAX(UA) FROM Laboratory WHERE Sex = 'F' AND UA > 6.50;
SELECT MAX(ANA) FROM Examination WHERE CRE < 1.5;
SELECT Patient.ID, MAX(Laboratory.aCL IgA) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5 GROUP BY Patient.ID;
SELECT COUNT(*) FROM Examination WHERE `T-BIL` > = 2.0 AND ANA Pattern = 'P';
SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0 SELECT MAX(aCL IgA) FROM Examination WHERE ID IN (SELECT MAX(ID) FROM Examination WHERE `T-BIL` < 2.0);
SELECT COUNT(*) FROM Examination WHERE `T-CHO` > = 250 AND KCT = '-';
SELECT COUNT(*) FROM Examination WHERE `T-CHO` < 250 AND ANA Pattern = 'P';
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms <> '';
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 ORDER BY T1.TG DESC LIMIT 1
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CPK < 250;
SELECT COUNT(*) FROM Examination WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+')
SELECT Birthday FROM Patient WHERE NOT Birthday IS NULL AND (SELECT MAX(Birthday) FROM Patient WHERE NOT Birthday IS NULL AND (SELECT MAX(GLU) FROM Laboratory WHERE NOT Date IS NULL AND (GLU > 180)) = Patient.ID) = Patient.ID;
SELECT COUNT(*) FROM Examination WHERE ALP < 180 AND Thrombosis = 0;
SELECT COUNT(*) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0;
SELECT COUNT(*) FROM Patient WHERE Diagnosis = 'SLE' AND WBC BETWEEN 3.5 AND 9.0;
SELECT Patient.ID FROM Patient WHERE Patient.Admission = '-' AND (RBC < = 3.5 OR RBC > = 6.0);
SELECT COUNT(*) FROM Examination WHERE PLT > 100 AND PLT < 400 AND Diagnosis IS NOT NULL;
SELECT * FROM Examination WHERE PLT > 100 AND PLT < 400 AND Diagnosis = 'MCTD';
SELECT AVG(PT) FROM Patient WHERE Sex = 'M' AND PT < 14;
SELECT COUNT(*) FROM Examination WHERE Thrombosis > 1 AND PT < 14
SELECT major_name FROM major WHERE department = 'EECS' AND college = 'CSU'
SELECT COUNT(*) FROM member WHERE member.club = 'Student_Club' AND member.college = 'Engineering'
SELECT T2.first_name, T2.last_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.department = "Art and Design"
SELECT COUNT(*) FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = "Women's Soccer" AND T2.first_name = "Student" AND T2.last_name = "Club"
SELECT T2.phone FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = "Women's Soccer"
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = "Women's Soccer" AND T1.t_shirt_size = "Medium"
SELECT T1.event_name, T1.event_date, T1.type, T1.notes, T1.location, T1.status FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = (SELECT MAX(T1.event_name) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event)
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.major_id = T2.major_id WHERE T1.position = "Vice President"
SELECT T2.event_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'McLean'
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND YEAR(T1.event_date) = 2019
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND COUNT(T2.link_to_event) > 10
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Student_Club'
SELECT AVG(COUNT(DISTINCT event_id)) FROM event WHERE YEAR(event_date) = 2020
SELECT MAX(cost) FROM expense
SELECT COUNT(*) FROM major WHERE major_name = 'Environmental Engineering'
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = "Laugh Out Loud"
SELECT last_name FROM member WHERE major = 'Law and Constitutional Studies'
SELECT zip_code.county FROM zip_code JOIN member ON member.zip = zip_code.zip_code WHERE member.first_name = "Sherri" AND member.last_name = "Ramsey"
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Tyler" AND T1.last_name = "Hewitt"
SELECT amount FROM income WHERE source = 'Vice President'
SELECT SUM(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed' AND event_name = 'September Meeting'
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'
SELECT first_name, last_name FROM member WHERE zip = (SELECT zip_code FROM zip_code WHERE state = 'Illinois')
SELECT SUM(spent) FROM budget WHERE category = 'Advertisement' AND event_status = 'Closed' AND event_name = 'September Meeting'
SELECT DISTINCT department FROM major WHERE major_name = 'Computer Science'
SELECT SUM(amount) FROM budget WHERE event_status = 'Approved' AND event_name = 'October Speaker'
SELECT COUNT(*) FROM expense WHERE event_id IN (SELECT event_id FROM event WHERE event_name = 'October Meeting' AND event_date = '2019-10-08') AND approved = True
SELECT AVG(cost) FROM expense WHERE link_to_member = 'Elijah Allen' AND MONTH(expense_date) = 9 OR MONTH(expense_date) = 10
SELECT (SELECT SUM(spent) FROM budget WHERE category = 'Student_Club' AND YEAR(event_date) = 2019) - (SELECT SUM(spent) FROM budget WHERE category = 'Student_Club' AND YEAR(event_date) = 2020)
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT cost FROM expense WHERE link_to_event = 'Posters' AND expense_date = '2019-09-14'
SELECT MAX(budget.remaining) FROM budget WHERE budget.category = 'Food'
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'
SELECT COUNT(*) FROM major WHERE department = "College of Humanities and Social Sciences"
SELECT phone FROM member WHERE first_name = "Carlo" AND last_name = "Jacobs"
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Adela" AND T1.last_name = "O'Gallagher"
SELECT COUNT(*) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0
SELECT SUM(amount) FROM budget WHERE budget.event_status = 'September Speaker'
SELECT T1.status FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'
SELECT major_name FROM major WHERE department = 'EECS' AND college = 'MU'
SELECT COUNT(*) FROM member WHERE major = "Human Development and Family Studies" AND t_shirt_size = "Large"
SELECT zip_code.type FROM zip_code JOIN member ON member.zip = zip_code.zip_code WHERE member.first_name = "Christof" AND member.last_name = "Nielson"
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT zip_code.state FROM zip_code WHERE zip_code.city = "Sacha Harrison"
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'
SELECT date_received FROM income WHERE source = 'Dues'
SELECT first_name, last_name FROM member WHERE member_id IN (SELECT MIN(member_id) FROM income WHERE source = 'Dues')
SELECT (SELECT SUM(amount WHERE category = 'Advertisement' AND event_name = 'Yearly Kickoff') FROM budget) - (SELECT SUM(amount WHERE event_name = 'October Meeting' AND category = 'Advertisement') FROM budget)
SELECT SUM( amount ) FROM budget WHERE category = 'Parking' AND event_name = 'November Speaker'
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'
SELECT COUNT(*) FROM zip_code WHERE county = "Orange" AND state = "Virginia"
SELECT DISTINCT department FROM major WHERE college = 'Humanities and Social Sciences'
SELECT T2.city, T2.county, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Amy" AND T1.last_name = "Firth"
SELECT T1.expense_description FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id ORDER BY T2.remaining LIMIT 1
SELECT name FROM member WHERE member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event = 'October Meeting')
SELECT major.college FROM major GROUP BY major ORDER BY COUNT(major.college) DESC LIMIT 1
SELECT major_name FROM major WHERE zip = "809-555-3360"
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id GROUP BY T1.event_id ORDER BY SUM(T2.amount) DESC LIMIT 1;
SELECT expense_description FROM expense WHERE link_to_member = 'Vice President'
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women's Soccer'
SELECT income.date_received FROM income WHERE income.member_id = 'Casey Mason'
SELECT COUNT(*) FROM zip_code WHERE state = 'Maryland'
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.phone = "954-555-6240"
SELECT first_name, last_name FROM member WHERE department = "School of Applied Sciences, Technology and Education"
SELECT event.event_name, MAX(DIVIDE(expense.spent, budget.amount)) AS spend_to_budget_ratio FROM event JOIN expense ON event.event_id = expense.link_to_event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' GROUP BY event.event_name
SELECT COUNT(*) FROM member WHERE position = 'President'
SELECT MAX(spent) FROM budget
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020
SELECT SUM(spent) FROM budget WHERE category = 'Food';
SELECT T2.first_name, T2.last_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.member_id HAVING COUNT(T1.link_to_event) > 7
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Community Theater' AND T2.major_name = 'Interior Design'
SELECT first_name, last_name FROM member WHERE zip = (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina')
SELECT SUM(income.amount) FROM income WHERE income.source = 'Grant Gilmour'
SELECT first_name, last_name FROM member WHERE member_id IN (SELECT link_to_member FROM income WHERE amount > 40)
SELECT SUM(cost) FROM expense WHERE link_to_event = 'Baseball game'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN budget AS T2 ON T1.member_id = T2.link_to_member WHERE T2.event_status = 'Yearly Kickoff'
SELECT T2.first_name, T2.last_name, T1.source FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.member_id ORDER BY MAX(T1.amount) DESC LIMIT 1;
SELECT event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id ORDER BY SUM(T2.cost) LIMIT 1;
SELECT SUM(cost) FROM event WHERE event_name = 'Yearly Kickoff'
SELECT major_name, COUNT(*) AS count FROM major WHERE department = 'Finance' OR department = 'Physics' GROUP BY major_name
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1;
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.major_id = T2.major_id WHERE T2.major_name = 'Physics Teaching'
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND YEAR(T1.event_date) = 2019
SELECT COUNT(*) FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T2.first_name = "Luisa" AND T2.last_name = "Guidi"
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed';
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Advertisement' GROUP BY T1.event_id ORDER BY SUM(T2.spent) DESC LIMIT 1;
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean' AND T1.event_name = 'Women''s Soccer'
SELECT SUM(type = 'Community Service') FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31' AND event_name = 'Student_Club'
SELECT expense_cost FROM expense WHERE expense_description = 'Posters' AND link_to_event = 'September Speaker'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T1.status = 'Closed' AND T2.remaining < 0 GROUP BY T1.event_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(t1.cost) FROM expense AS t1 JOIN event AS t2 ON t1.link_to_event = t2.event_id WHERE t2.event_name = 'October Meeting' AND t1.approved = 'Yes';
SELECT category, SUM(amount) FROM budget WHERE link_to_event = 'April Speaker' GROUP BY category ORDER BY SUM(amount)
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT budget_id, category, spent, remaining, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT first_name, last_name, SUM(cost) FROM expense WHERE link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY first_name, last_name
SELECT expense_description FROM expense WHERE link_to_member = 'Sacha Harrison'
SELECT DISTINCT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'
SELECT zip_code FROM member WHERE zip < 50
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Phillip" AND T1.last_name = "Cullen"
SELECT position FROM member WHERE major = 'Business'
SELECT COUNT(*) FROM member WHERE major_name = 'Business' AND t_shirt_size = 'Medium'
SELECT T1.type FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining > 30
SELECT event_category FROM event WHERE location = 'MU 215'
SELECT category FROM event WHERE event_date = '2020-03-24T12:00:00'
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T2.position = 'Vice President'
SELECT SUM(position = 'Member' and major_name = 'Mathematics') FROM member WHERE major_name = 'Mathematics'
SELECT type FROM event WHERE location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large'
SELECT COUNT(*) FROM major WHERE department = "School of Applied Sciences, Technology and Education" AND college = "Agriculture and Applied Sciences"
SELECT T2.last_name, T1.department, T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.major_name = 'Environmental Engineering'
SELECT budget.category FROM budget, event WHERE budget.spent = 0 AND event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.link_to_event = event.event_id
SELECT T2.city, T2.state FROM major AS T1 JOIN zip_code AS T2 ON T1.major_id = T2.major_id JOIN member AS T3 ON T1.major_id = T3.major_id WHERE T1.department = 'Electrical and Computer Engineering'
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T3.organization = 'Student_Club' AND T3.location = '900 E. Washington St.' AND T1.type = 'Social'
SELECT T2.last_name, T2.position FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'
SELECT T2.last_name FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Women's Soccer'
SELECT percentage FROM member WHERE t_shirt_size = 'Medium' AND position = 'Member' AND amount = 50;
SELECT county, state, short_state FROM zip_code WHERE type = 'PO Box'
SELECT zip_code.zip_code FROM zip_code WHERE zip_code.type = 'PO Box' AND zip_code.country = (SELECT country.country FROM country WHERE country.country = 'Puerto Rico')
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';
SELECT T1.link_to_event FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.paid > 50
SELECT T1.first_name, T1.last_name, T2.link_to_event FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.approved = 'true' AND T2.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T2.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T2.first_name = "Katy" AND T1.major_name = "rec1N0upiVLy5esTO"
SELECT phone FROM member WHERE link_to_major = 'Business' AND college = 'College of Agriculture and Applied Sciences'
SELECT T1.email FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND T2.cost > 20
SELECT COUNT(*) FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.major_name = 'education' AND T1.college = 'Education & Human Services';
SELECT SUM(remaining) FROM budget WHERE event_status = 'over budget'
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';
SELECT * FROM expense WHERE DIVIDE( SUM(cost), COUNT(expense_id) ) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT SUM(type = 'PO Box'), COUNT(zip_code) FROM zip_code GROUP BY zip_code
SELECT T1.event_name, T1.location FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining > 0
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100
SELECT T1.first_name, T1.last_name, T1.major_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > 100
SELECT T1.city, T1.country FROM zip_code AS T1 JOIN event AS T2 ON T1.zip_code = T2.location WHERE T2.income > 50
SELECT T1.first_name, T1.last_name, MAX(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(DISTINCT T2.link_to_event) > 1
SELECT AVG(cost) FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position != 'Member')
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' GROUP BY T1.event_id HAVING AVG(T2.cost) < (SELECT AVG(cost) FROM expense WHERE category = 'Parking')
SELECT SUM(cost) / COUNT(event_id) * 100 FROM expense WHERE event_id IN (SELECT event_id FROM event WHERE type = 'Game')
SELECT budget_id FROM expense WHERE expense_description = 'Water, chips, cookies' GROUP BY budget_id ORDER BY MAX(cost) DESC LIMIT 1
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING AVG(T2.cost) > (SELECT AVG(cost) FROM expense)
SELECT (SELECT SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END) FROM zip_code) - (SELECT SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) FROM zip_code)
SELECT major.major_name, major.department FROM major INNER JOIN member ON member.major_id = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'
SELECT first_name, last_name FROM member WHERE member_id IN (SELECT link_to_member FROM expense WHERE expense_description = 'Water, Veggie tray, supplies')
SELECT T2.last_name, T2.phone FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.major_name = "Elementary Education"
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker'
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'
SELECT T2.first_name, T2.last_name, T1.amount FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.date_received = '2019-09-09'
SELECT budget.category FROM budget, expense WHERE expense.expense_description = 'Posters' AND expense.link_to_budget = budget.budget_id
SELECT first_name, last_name, college FROM member WHERE position = 'Secretary'
SELECT T2.event_name, SUM(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts' GROUP BY T2.event_name
SELECT zip_code.city FROM zip_code JOIN member ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Girke'
SELECT first_name, last_name, position FROM member WHERE zip = 28092
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';
SELECT Currency, COUNT(*) AS Ratio FROM customers WHERE Currency IN ('EUR', 'CZK') GROUP BY Currency;
SELECT CustomerID, MIN(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM') GROUP BY CustomerID
SELECT AVG(Consumption) FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME' AND Currency = 'EUR');
SELECT c.CustomerID, c.Segment, c.Currency, SUM(y.Consumption) AS Total_Consumption FROM customers c INNER JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID, c.Segment, c.Currency ORDER BY Total_Consumption DESC
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Segment = 'KAM' AND t2.Consumption < 30000 AND YEAR(t2.Date) = 2012;
SELECT (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')) - (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR'))
SELECT YearMonth.Date, MAX(YearMonth.Consumption) FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID JOIN products ON yearmonth.ProductID = products.ProductID WHERE customers.Currency = 'EUR' GROUP BY YearMonth.Date;
SELECT Segment FROM customers GROUP BY Segment ORDER BY SUM(Consumption) LIMIT 1; SELECT Segment FROM customers GROUP BY Segment ORDER BY SUM(Consumption) LIMIT 1;
SELECT Date, MAX(Consumption) FROM yearmonth WHERE Currency = 'CZK' GROUP BY Date;
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2013%' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME' AND Currency = 'EUR');
SELECT (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '20130101' AND '20131231' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') GROUP BY CustomerID) - (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '20130101' AND '20131231' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM' AND Currency = 'CZK') GROUP BY CustomerID) - (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '20130101' AND '20131231' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM' AND Currency = 'CZK') GROUP BY CustomerID)
SELECT Segment, MAX(Consumption) AS Max_Consumption, MAX(Consumption) * 100.0 / MAX(Consumption) AS Percentage_Increase FROM yearmonth WHERE Date BETWEEN '201201' AND '201312' AND Currency = 'EUR' GROUP BY Segment ORDER BY Percentage_Increase DESC LIMIT 1; SELECT Segment, MAX(Consumption) AS Max_Consumption, MAX(Consumption) * 100.0 / MAX(Consumption) AS Percentage_Increase FROM yearmonth WHERE Date BETWEEN '201201' AND '201312' AND Currency = 'EUR' GROUP BY Segment ORDER BY Percentage_Increase LIMIT 1;
SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201308' AND '201311' AND CustomerID = 6;
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'Czech Republic' AND Segment = 'discount') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'discount')
SELECT (SELECT Consumption FROM yearmonth WHERE Date = '201304' AND CustomerID = 7) - (SELECT Consumption FROM yearmonth WHERE Date = '201304' AND CustomerID = 5)
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') - (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR')
SELECT MAX(Consumption) FROM yearmonth WHERE Date = '201310' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM' AND Currency = 'EUR');
SELECT c.CustomerID, c.Segment, c.Currency, MAX(c.Consumption) AS MaxConsumption FROM customers c INNER JOIN yearmonth ym ON c.CustomerID = ym.CustomerID GROUP BY c.CustomerID, c.Segment, c.Currency; SELECT c.CustomerID, c.Segment, c.Currency, MAX(c.Consumption) AS MaxConsumption FROM customers c INNER JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID, c.Segment, c.Currency;
SELECT SUM(Consumption) FROM yearmonth WHERE Date = '201305'
SELECT COUNT(*) FROM customers WHERE Segment = 'LAM' AND Currency = 'EUR' AND Consumption > 46.73;
SELECT Country, COUNT(*) AS "Value for Money" FROM gasstations WHERE Segment = 'Value for Money' GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1;
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'KAM' AND Currency = 'EUR') / (SELECT COUNT(*) FROM customers WHERE Segment = 'KAM') * 100
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Consumption > 528.3
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'premium') / (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia') * 100;
SELECT CustomerID FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY SUM(Consumption) DESC LIMIT 1;
SELECT Segment FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Date = '201309' GROUP BY t1.Segment ORDER BY SUM(t2.Consumption) LIMIT 1;
SELECT c.CustomerID, c.Segment, c.Currency, MIN(y.Consumption) AS Consumption FROM customers c INNER JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' GROUP BY c.CustomerID, c.Segment, c.Currency;
SELECT MAX(Consumption) FROM yearmonth WHERE YEAR(Date) = 2012
SELECT MAX(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR') AND Date = YEAR(CURDATE()) - MONTH(CURDATE()) + 1
SELECT T1.Description FROM products AS T1 JOIN yearmonth AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Date = '201309';
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '20130601';
SELECT DISTINCT T1.ChainID FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Price = (SELECT CURRENT_RATE FROM customers AS T3 WHERE T3.Currency = 'EUR')
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Currency = 'EUR';
SELECT AVG(Amount) FROM transactions_1k WHERE Date LIKE '%2012-01%'
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Currency = 'EUR' AND t2.Consumption > 1000
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T3.GasStationID = T2.GasStationID WHERE T3.Country = 'CZE'
SELECT T1.Time, T1.Date FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11
SELECT COUNT(*) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE') AND Price > 1000
SELECT COUNT(*) FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'CZE' AND T2.Date > '2012-01-01';
SELECT AVG(Amount) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE');
SELECT AVG(Amount) FROM transactions WHERE Currency = 'EUR';
SELECT c.CustomerID, c.Segment, c.Currency, MAX(t.Amount) AS Amount FROM customers c JOIN transactions t ON c.CustomerID = t.CustomerID JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-25' GROUP BY c.CustomerID, c.Segment, c.Currency;
SELECT Country FROM gasstations WHERE Date = '2012-08-25' ORDER BY Date LIMIT 1;
SELECT T2.Currency FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '16:25:00'
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'
SELECT COUNT(*) FROM transactions_1k WHERE Date LIKE '%2012-08-26%' AND Price > 0
SELECT Segment FROM customers ORDER BY CustomerID LIMIT 1; SELECT Segment FROM customers ORDER BY CustomerID LIMIT 1;
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24 12:42:00'
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'; SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';
SELECT SUM(Consumption) AS total_spent, Date FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24') AND Date = '2012-01-01';
SELECT COUNT(*) FROM transactions_1k WHERE Date BETWEEN '2012-08-26 08:00:00' AND '2012-08-26 09:00:00' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE');
SELECT T1.Currency FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17
SELECT Country FROM gasstations WHERE GasStationID = 667467
SELECT t1.Segment, t1.Currency, t1.CustomerID FROM customers AS t1 JOIN transactions_1k AS t2 ON t1.CustomerID = t2.CustomerID JOIN yearmonth AS t3 ON t1.CustomerID = t3.CustomerID WHERE t2.Date = '2012-08-24' AND t2.Amount = 548.4
SELECT COUNT(*) FROM customers WHERE Currency = 'EUR' AND Date = '2012-08-25'
SELECT (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-24' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8)) - (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-25' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8)) / (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-24' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8))
SELECT GasStationID, SUM(Amount) AS Revenue FROM transactions_1k GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1
SELECT Segment, COUNT(*) AS "premium" FROM customers WHERE Segment = 'SVK' GROUP BY Segment SELECT Segment, COUNT(*) AS "premium" FROM customers WHERE Segment = 'SVK' GROUP BY Segment;
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '%201201%';
SELECT ProductID, Description FROM products ORDER BY Amount DESC LIMIT 5;
SELECT c.CustomerID, AVG(p.Price) AS AveragePricePerSingleItem FROM customers c INNER JOIN transactions t ON c.CustomerID = t.CustomerID INNER JOIN products p ON t.ProductID = p.ProductID WHERE c.Currency = 'EUR' GROUP BY c.CustomerID ORDER BY AVG(p.Price) DESC LIMIT 1;
SELECT T2.Country FROM products AS T1 JOIN gasstations AS T2 ON T1.ProductID = T2.GasStationID WHERE T1.ProductID = 2
SELECT Consumption FROM yearmonth WHERE Date LIKE '%201208%' AND CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE ProductID = 5 AND Amount > 29.00)
