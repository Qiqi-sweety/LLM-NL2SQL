SELECT MAX(EligibleFreeRate) FROM frpm WHERE County = "Alameda" AND EnrollmentType = "K-12"	california_schools
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM frpm ORDER BY `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` LIMIT 3	california_schools
SELECT zip FROM schools WHERE County = "Fresno" AND StatusType = "Charter"	california_schools
SELECT T2.MailStreet, T2.MailStrAbr FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.FRPMCount (K-12) DESC LIMIT 1	california_schools
SELECT Phone FROM schools WHERE OpenDate > '2000-01-01' AND Charter = 1	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath < 400 AND T2.Virtual = 'F'	california_schools
SELECT s.School, s.Magnet FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.Enroll12 > 500 AND s.Magnet = 1	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead > 1500 ORDER BY T1.AvgScrRead DESC LIMIT 1	california_schools
SELECT t1.cname, t1.School, t1.CDSCode, COUNT(*) AS "Number of SAT Test Takers" FROM (SELECT schools.CDSCode, schools.School, schools.County, schools.District, schools.SchoolType, schools.EducationalOptionType, schools.Enrollment, schools.FreeMealCount, schools.Percent(%)_Eligible_Free(K-12), schools.FRPM_Count(K-12), schools.Percent(%)_Eligible_FRPM(K-12), schools.2013_14_CALPADS_Fall_1_Certification_Status FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.SchoolType = 'K-12' AND schools.EducationalOptionType = 'Traditional' AND schools.Enrollment >= 1000 GROUP BY schools.CDSCode, schools.School, schools.County, schools.District, schools.SchoolType, schools.EducationalOptionType, schools.Enrollment, schools.FreeMealCount, schools.Percent(%)_Eligible_Free(K-12), schools.FRPM_Count(K-12), schools.Percent(%)_Eligible_FRPM(K-12), schools.2013_14_CALPADS_Fall_1_Certification_Status) AS t1 JOIN satscores ON t1.CDSCode = satscores.CDS WHERE t1.Enrollment >= 1000 GROUP BY t1.cname, t1.School, t1.CDSCode ORDER BY t1.FRPM_Count(K-12) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.Charter (Y/N) = 'Y'	california_schools
SELECT frpm.CDSCode, frpm.FRPMCount, frpm.Percent(%)_Elgible_FRPM, frpm.2013_14_CALPADS_Fall_1_Certification_Status FROM frpm INNER JOIN satscores ON frpm.CDSCode = satscores.CDS WHERE satscores.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores) AND frpm.CDSCode IN (SELECT CDSCode FROM frpm)	california_schools
SELECT cds FROM frpm WHERE Enrollment (K-12) + Enrollment (Ages 5-17) > 500;	california_schools
SELECT MAX(EligibleFree(Ages5to17)) FROM frpm WHERE ExcellenceRate > 0.3;	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead DESC LIMIT 3	california_schools
SELECT cds, COUNT(*) AS enrollment_k_12 FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode GROUP BY cds ORDER BY enrollment_k_12 DESC LIMIT 5; SELECT cds, COUNT(*) AS enrollment_k_12 FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode GROUP BY cds ORDER BY enrollment_k_12 DESC LIMIT 5;	california_schools
SELECT DistrictName, AVG(satscores.AvgScrRead) AS AvgReadingScore FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Active' GROUP BY DistrictName ORDER BY AvgReadingScore DESC LIMIT 1; SELECT DistrictName, AVG(satscores.AvgScrRead) AS AvgReadingScore FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Active' GROUP BY DistrictName ORDER BY AvgReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Alameda' AND T1.NumTstTakr < 100	california_schools
SELECT T2.CharterNum FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite = 499	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr <= 250 AND T2.County = "Contra Costa" AND T1.rtype = "Direct"	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY AVG(T1.AvgScrMath) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm WHERE `Academic Year` = 2014 AND `County Name` = 'Amador' AND `Low Grade` = 9 AND `High Grade` = 12	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = "Los Angeles" AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;	california_schools
SELECT s.School, COUNT(*) AS NumTstTakr FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.rtype = 'Contra Costa' GROUP BY s.School ORDER BY NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.StreetAbr, s.City, s.Zip, s.State, s.MailStreet, s.MailStrAbr, s.MailCity, s.MailZip, s.MailState, s.Phone, s.Ext, s.Website, s.OpenDate, s.ClosedDate, s.Charter, s.CharterNum, s.FundingType, s.SOC, s.SOCType, s.EdOpsCode, s.EdOpsName, s.EILCode, s.EILName, s.GSoffered, s.GSserved, s.Virtual, s.Magnet, s.Latitude, s.Longitude, s.AdmFName1, s.AdmLName1, s.AdmEmail1, s.AdmFName2, s.AdmLName2, s.AdmEmail2, s.AdmFName3, s.AdmLName3, s.AdmEmail3 FROM frpm AS f INNER JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE f.Enrollment (K-12) - f.Enrollment (Ages 5-17) > 30;	california_schools
SELECT T2.School, T2.Percent_Eligible_Free_Meals_K_12, T1.AvgScrRead, T1.AvgScrMath, T1.AvgScrWrite, T1.NumGE1500 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 AND T2.Percent_Eligible_Free_Meals_K_12 > 0.1	california_schools
SELECT T2.FundingType FROM satscores AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = "Riverside" AND T1.AvgScrMath > 400	california_schools
SELECT T2.Street, T2.City, T2.State, T2.Zip, T2.StreetAbr, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState FROM frpm AS T1 JOIN schools AS T2 ON T1.School = T2.CDSCode WHERE T1.County = "Monterey" AND T1.SchoolType = "High" AND T1.FreeMealCount(15) > 800	california_schools
SELECT s.School, AVG(s.AvgScrWrite) AS AvgScore FROM satscores AS s INNER JOIN schools AS s2 ON s.cds = s2.CDSCode WHERE s2.OpenDate > 1991 OR s2.ClosedDate < 2000 GROUP BY s.School;	california_schools
SELECT schools.SOC, schools.SOCType, schools.AdmFName1, schools.AdmLName1, schools.AdmEmail1, schools.AdmFName2, schools.AdmLName2, schools.AdmEmail2, schools.AdmFName3, schools.AdmLName3, schools.AdmEmail3, schools.OpenDate, schools.ClosedDate, schools.Charter, schools.CharterNum, schools.FundingType, schools.CDSCode FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.CharterFundingType = 'Directly funded' AND schools.Enrollment(K-12) - schools.Enrollment(Ages 5-17) > (SELECT AVG(frpm.Enrollment(K-12) - frpm.Enrollment(Ages 5-17)) FROM frpm WHERE frpm.CharterFundingType = 'Directly funded') AND schools.SOCType != 'Elementary School' AND schools.SOCType != 'High School' AND schools.SOCType != 'Middle School' AND schools.SOCType != 'Junior High School' AND schools.SOCType != 'Kindergarten' AND schools.SOCType != 'Preschool' AND schools.SOCType != 'Vocational School' AND schools.SOCType != 'Other' AND schools.SOCType != 'Private School' AND schools.SOCType != 'Charter School' AND schools.SOCType != 'Magnet School' AND schools.SOCType != 'Alternative School' AND schools.SOCType != 'Community School' AND schools.SOCType != 'Jewish School' AND schools.SOCType != 'Catholic School' AND schools.SOCType != 'Christian School' AND schools.SOCType != 'Islamic School' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SOCType != 'Other' AND schools.SO	california_schools
SELECT OpenDate FROM schools ORDER BY Enroll12 DESC LIMIT 1	california_schools
SELECT City, MIN(Enroll12) FROM satscores GROUP BY City ORDER BY Enroll12 LIMIT 5;	california_schools
SELECT `Free Meal Count (K-12)` / `Enrollment (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10, 11	california_schools
SELECT `FRPM Count (K-12)` / `Enrollment (K-12)` FROM frpm WHERE `CDSCode` IN (SELECT `CDSCode` FROM schools WHERE `Ownership Code` = 66 ORDER BY `Free Meal Count (K-12)` DESC LIMIT 5)	california_schools
SELECT T2.Website, T2.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.FreeMealCount (5 - 17) BETWEEN 1900 AND 2000	california_schools
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM frpm WHERE `School Name` = 'Kacey Gibson'	california_schools
SELECT AdmEmail1 FROM schools WHERE School = (SELECT T2.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterSchool = 1 ORDER BY T1.Enrollment (K-12) LIMIT 1)	california_schools
SELECT T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr = (SELECT MAX(NumTstTakr) FROM satscores) AND T2.AvgScrRead >= 1500 AND T2.AvgScrMath >= 1500 AND T2.AvgScrWrite >= 1500	california_schools
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead LIMIT 1;	california_schools
SELECT T2.Website FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.enroll12 BETWEEN 2000 AND 3000 AND T2.County = "Los Angeles"	california_schools
SELECT AVG(t1.NumTstTakr) FROM satscores AS t1 JOIN schools AS t2 ON t1.cds = t2.CDSCode WHERE t2.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND t2.County = 'Fresno'	california_schools
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T1.CDSCode = T3.CDSCode GROUP BY T2.CDSCode ORDER BY AVG(T3.AvgScrRead) LIMIT 1	california_schools
SELECT TOP 5 s.SchoolName, AVG(s.ScrRead) AS AvgReadingScore FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.rtype = 'Virtual' GROUP BY s.SchoolName ORDER BY AvgReadingScore DESC	california_schools
SELECT T2.EducationalOptionType FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT satscores.AvgScrMath, schools.County FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode GROUP BY schools.County ORDER BY AVG(satscores.AvgScrMath) LIMIT 1;	california_schools
SELECT s.City, AVG(t1.AvgScrWrite) FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.NumTstTakr >= 1500 GROUP BY s.City ORDER BY AVG(t1.AvgScrWrite) DESC LIMIT 1	california_schools
SELECT s.School, AVG(s.AvgScrWrite) FROM satscores AS s INNER JOIN schools AS m ON s.cds = m.CDSCode WHERE m.AdmFName1 = 'Ricci Ulrich' GROUP BY s.School	california_schools
SELECT State, COUNT(*) AS Enrollment FROM schools WHERE DOC = 31 AND StatusType = 'State Special' GROUP BY State ORDER BY Enrollment DESC LIMIT 1;	california_schools
SELECT AVG(COUNT(*)) FROM schools WHERE County = "Alameda" AND District = "Elementary School District" AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT (SELECT COUNT(*) FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE DOC = 54) AND DistrictType = 'Unified') / (SELECT COUNT(*) FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE DOC = 52) AND DistrictType = 'Elementary')	california_schools
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT T2.Street, T2.StreetAbr, T2.City, T2.Zip, T2.State, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState, T1.School, T1.Street, T1.StreetAbr, T1.City, T1.Zip, T1.State, T1.MailStreet, T1.MailStrAbr, T1.MailCity, T1.MailZip, T1.MailState, T1.Phone, T1.Ext, T1.Website, T1.OpenDate, T1.ClosedDate, T1.Charter, T1.CharterNum, T1.FundingType, T1.SOC, T1.SOCType, T1.EdOpsCode, T1.EdOpsName, T1.EILCode, T1.EILName, T1.GSoffered, T1.GSserved, T1.Virtual, T1.Magnet, T1.Latitude, T1.Longitude, T1.AdmFName1, T1.AdmLName1, T1.AdmEmail1, T1.AdmFName2, T1.AdmLName2, T1.AdmEmail2, T1.AdmFName3, T1.AdmLName3, T1.AdmEmail3, T1.LastUpdate FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.RType = 'Math' ORDER BY T1.AvgScrMath DESC LIMIT 6, 1;	california_schools
SELECT T2.MailStreet, T2.MailStrAbr, T1.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T2.MailStreet, T2.MailStrAbr ORDER BY AVG(T1.AvgScrRead) LIMIT 1; SELECT T2.MailStreet, T2.MailStrAbr, T1.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T2.MailStreet, T2.MailStrAbr ORDER BY AVG(T1.AvgScrRead) LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite >= 1500 AND T2.MailCity = "Lakeport"	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Fresno'	california_schools
SELECT School, MailZip FROM schools WHERE DOCType = 'Traditional' AND DOC = 'Avetik Atoian'	california_schools
SELECT (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Colusa') / (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Humboldt')	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND StatusType = 'Active'	california_schools
SELECT Phone, Ext FROM schools ORDER BY AvgScrWrite DESC LIMIT 333	california_schools
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE AdmFName1 = "Mike Larson" AND AdmLName1 = "Dante Alvarez"	california_schools
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1	california_schools
SELECT COUNT(*) FROM schools WHERE City = "Hickman" AND DOC = 52 AND Charter = 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE County = "Los Angeles" AND Charter = 0 AND `Free Meal Count (K-12)` * 100 / `Enrollment (K-12)` < 0.18	california_schools
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmEmail1, T1.School, T1.City FROM schools AS T1 JOIN administrators AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T1.CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = "Hickman" AND CharterNum = "00D4"	california_schools
SELECT (SELECT COUNT(*) FROM frpm WHERE County = "Santa Clara" AND FundingType = "Locally Funded" AND Charter = 1) / (SELECT COUNT(*) FROM frpm WHERE County = "Santa Clara" AND FundingType != "Locally Funded" AND Charter = 1) * 100	california_schools
SELECT COUNT(*) FROM frpm WHERE County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND FundingType = 'Directly Funded'	california_schools
SELECT COUNT(*) FROM schools WHERE District = 'Community college' AND ClosedDate LIKE '%1989%' AND City = 'San Francisco'	california_schools
SELECT County, COUNT(*) AS ClosedSchools FROM schools WHERE YEAR(ClosedDate) BETWEEN 1980 AND 1989 AND SOC = 11 GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT NCESSchool FROM schools WHERE SOC = 31	california_schools
SELECT COUNT(*) FROM schools WHERE County = "Alpine" AND StatusType = "District Community Day School" AND ClosedDate IS NULL	california_schools
SELECT DistrictCode FROM schools WHERE City = "Fresno" AND Magnet = 0	california_schools
SELECT SUM(Enrollment) FROM frpm WHERE School = 'State Special School' AND AcademicYear = '2014-2015'	california_schools
SELECT `Free Meal Count (Ages 5-17)` FROM frpm WHERE `School Name` = 'Youth Authority School'	california_schools
SELECT MIN(LowGrade) FROM frpm WHERE CDSCode IN (SELECT cds FROM schools WHERE EdOpsCode = 'SPECON' AND NCESSchool = 613360)	california_schools
SELECT T2.Educational_Option_Type, T2.School_Name FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Breakfast_Provision_2 = '2' AND T2.County_Code = 37	california_schools
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SchoolType = 'HS' AND T1.LowGrade = 9 AND T1.HighGrade = 12 AND T2.County = 'Merced' AND T2.SOCType = 'Lunch Provision 2'	california_schools
SELECT schools.School, schools.Percent (%) Eligible FRPM (Ages 5-17) FROM frpm INNER JOIN schools ON frpm.School = schools.CDSCode WHERE schools.County = "Los Angeles" AND frpm.Grade_Span = "Kindergarten to 9th Grade"	california_schools
SELECT cds, COUNT(*) AS cnt FROM satscores WHERE dname = 'Adelanto' GROUP BY cds ORDER BY cnt DESC LIMIT 1; SELECT cds, COUNT(*) AS cnt FROM satscores WHERE dname = 'Adelanto' GROUP BY cds ORDER BY cnt DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1; SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1;	california_schools
SELECT SchoolName, MIN(LowGrade) FROM frpm WHERE State = 'CA' GROUP BY SchoolName;	california_schools
SELECT MIN(HighGrade), MAX(LowGrade) FROM frpm WHERE NOT HighGrade IS NULL AND NOT LowGrade IS NULL	california_schools
SELECT COUNT(*), City, COUNT(*) FROM schools WHERE Magnet = 1 AND (Kindergarten = 1 OR Kindergarten = 1) AND (8thGrade = 1 OR 8thGrade = 1) GROUP BY City	california_schools
SELECT AdmFName1, AdmFName2, District FROM schools GROUP BY AdmFName1, AdmFName2 ORDER BY COUNT(*) DESC LIMIT 2; SELECT AdmFName1, AdmFName2, District FROM schools GROUP BY AdmFName1, AdmFName2 ORDER BY COUNT(*) DESC LIMIT 2;	california_schools
SELECT district_code, `Free Meal Count (K-12)` / `Enrollment (K-12)` * 100 AS Percent_Eligible_Free_K_12 FROM frpm WHERE `AdmFName1` = 'Alusine'	california_schools
SELECT T2.AdmLName2, T1.District, T1.County, T1.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterNum = 40	california_schools
SELECT AdmEmail1 FROM schools WHERE County = "San Bernardino" AND District = "San Bernardino City Unified" AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND SOC = 62 AND DOC = 54	california_schools
SELECT T2.AdmEmail1, T1.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 GROUP BY T2.AdmEmail1 ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.region = 'East Bohemia' AND T1.type = 'POPLATEK PO OBRATU'	financial
SELECT COUNT(*) FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T5.A3 = 'Prague'	financial
SELECT AVG(A12) FROM district WHERE A2 = 'POPLATEK MESICNE' UNION SELECT AVG(A13) FROM district WHERE A2 = 'POPLATEK MESICNE'	financial
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND gender = 'F';	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND A3 = 'North Bohemia' AND A11 > 8000	financial
SELECT account_id, AVG(A11) FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY AVG(A11) LIMIT 1 SELECT account_id, AVG(A11) FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY AVG(A11) LIMIT 1 SELECT MAX(A11) FROM client WHERE gender = 'F', AVG(A11) FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY AVG(A11) LIMIT 1	financial
SELECT client_id, AVG(A11) FROM client GROUP BY client_id ORDER BY AVG(A11) DESC LIMIT 1 SELECT account_id, AVG(A11) FROM client GROUP BY account_id ORDER BY AVG(A11) DESC LIMIT 1	financial
SELECT COUNT(*) FROM client WHERE gender = 'Owner' AND birth_date BETWEEN '1990-01-01' AND '1999-12-31' AND district_id IN (SELECT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')	financial
SELECT * FROM client WHERE gender = 'POPLATEK PO OBRATU'	financial
SELECT account.account_id, account.frequency, MIN(loan.amount) AS min_amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.date LIKE '%1997%' AND loan.status = 'Approved' GROUP BY account.account_id, account.frequency ORDER BY min_amount	financial
SELECT account.account_id, account.date, MAX(loan.amount) AS max_amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND loan.status = 'valid' AND account.date BETWEEN '1993-01-01' AND '1993-12-31' GROUP BY account.account_id ORDER BY max_amount DESC	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < 1950 AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Slokolov')	financial
SELECT * FROM account WHERE date = (SELECT MIN(date) FROM account WHERE YEAR(date) = 1995)	financial
SELECT * FROM account WHERE date < 1997 AND amount > 3000 SELECT * FROM account WHERE date < 1997 AND amount > 3000;	financial
SELECT client_id FROM card WHERE issued = '1994-03-03'	financial
SELECT date FROM account WHERE account_id = 4	financial
SELECT district_id FROM account WHERE date = '1994-08-25'	financial
SELECT MAX(T2.amount) FROM card AS T1 JOIN trans AS T2 ON T1.card_id = T2.card_id WHERE T1.disp_id = (SELECT client_id FROM client WHERE birth_date = '1970-01-01') AND T1.issued = '1996-10-21'	financial
SELECT T1.gender FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.district_id = (SELECT MAX(district_id) FROM account) ORDER BY T1.birth_date LIMIT 1	financial
SELECT SUM(t1.amount) FROM `order` AS t1 JOIN client AS t2 ON t1.account_id = t2.client_id JOIN loan AS t3 ON t1.account_id = t3.account_id WHERE t3.amount = (SELECT MAX(amount) FROM loan) AND t1.date < t3.date ORDER BY t1.date LIMIT 1	financial
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T2.district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik')	financial
SELECT T2.disp_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.amount = 5100 AND T2.date = '1998-09-02'	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date = 1996	financial
SELECT district_id FROM client WHERE birth_date = '1976-01-29'	financial
SELECT T1.birth_date FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T2.amount = 98832 AND T2.date = '1996-01-03'	financial
SELECT account_id FROM account WHERE district_id = (SELECT district_id FROM district WHERE A3 = 'Prague' ORDER BY date LIMIT 1) ORDER BY date LIMIT 1	financial
SELECT A4, COUNT(CASE WHEN gender = 'M' THEN 1 END) * 100.0 / COUNT(*) AS percentage FROM client WHERE district_id IN (SELECT district_id FROM district                     WHERE A3 = 'South Bohemia'                     ORDER BY A14 DESC                     LIMIT 1) GROUP BY A4;	financial
SELECT (SELECT SUM(trans.amount) FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.client_id = (SELECT client.client_id FROM client WHERE client.client_id IN (SELECT loan.account_id FROM loan WHERE loan.date = '1993-07-05')) AND trans.date < '1998-12-27' AND trans.date > '1993-02-26') / (SELECT SUM(trans.amount) FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.client_id = (SELECT client.client_id FROM client WHERE client.client_id IN (SELECT loan.account_id FROM loan WHERE loan.date = '1993-07-05')) AND trans.date < '1998-12-27' AND trans.date > '1993-02-26') * 100	financial
SELECT SUM(CASE WHEN loan.status = 'A' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS percentage_paid_with_no_issue FROM loan	financial
SELECT SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS percentage FROM loan WHERE amount < 100000	financial
SELECT account.account_id, district.A2, district.A3 FROM account, card, district WHERE account.date > (SELECT MAX(card.issued) FROM card) AND account.date < (SELECT MAX(card.issued) FROM card) AND district.district_id = account.district_id AND district.A2 = 'POPLATEK PO OBRATU'	financial
SELECT account_id, frequency FROM account WHERE district_id IN (SELECT district_id FROM client WHERE region = 'east bohemia') AND date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT account_id, date FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prachatice')	financial
SELECT district.A2, district.A3 FROM district, loan WHERE loan.account_id = district.district_id AND loan.loan_id = 4990	financial
SELECT T1.account_id, T1.district_id, T2.A2, T2.A3 FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T1.account_id = T3.account_id WHERE T3.amount > 300000	financial
SELECT loan_id, district_id, AVG(A11) FROM loan WHERE duration = 60 GROUP BY district_id;	financial
SELECT district.A2, district.A3, district.A4, district.A5, district.A6, district.A7, district.A8, district.A9, district.A10, district.A11, district.A12, district.A13, district.A14, district.A15, district.A16 FROM district, loan WHERE loan.status = 'D' AND loan.date BETWEEN '1995-01-01' AND '1996-12-31' AND loan.district_id = district.district_id AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.type = 'loan' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id AND account.frequency = 'D') AND loan.district_id = district.district_id AND loan.date BETWEEN '1995-01-01' AND '1996-12-31' AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.type = 'loan' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id AND account.frequency = 'D') AND loan.district_id = district.district_id AND loan.date BETWEEN '1995-01-01' AND '1996-12-31' AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.type = 'loan' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id AND account.frequency = 'D') AND loan.district_id = district.district_id AND loan.date BETWEEN '1995-01-01'	financial
SELECT SUM(account.amount) * 100.0 / SUM(account.amount) FROM account, district WHERE district.A2 = 'Decin' AND account.district_id = district.district_id AND account.date = 1993	financial
SELECT account_id FROM account WHERE frequency = 'monthly'	financial
SELECT district_id, COUNT(*) AS female_account_holders FROM account WHERE district_id IN (     SELECT district_id FROM client     WHERE gender = 'F' ) GROUP BY district_id ORDER BY female_account_holders DESC LIMIT 10;	financial
SELECT district.A2, SUM(trans.amount) AS sum_withdraws FROM district JOIN trans ON district.district_id = trans.district_id WHERE district.A2 IN (     SELECT district.A2     FROM district     JOIN trans ON district.district_id = trans.district_id     WHERE MONTH(trans.date) = 1 AND YEAR(trans.date) = 1996     GROUP BY district.A2     ORDER BY SUM(trans.amount) DESC     LIMIT 10 ) GROUP BY district.A2	financial
SELECT COUNT(*) FROM client WHERE NOT client_id IN (SELECT client_id FROM disp WHERE type = 'credit')	financial
SELECT district_id, MAX(A3) FROM district AS T1 JOIN loan AS T2 ON T1.district_id = T2.district_id WHERE T2.status = 'C' GROUP BY T1.district_id	financial
SELECT AVG(amount) FROM loan WHERE gender = 'M'	financial
SELECT district_name, branch_location FROM district WHERE A13 = (SELECT MAX(A13) FROM district)	financial
SELECT SUM(A16) FROM district WHERE A2 = 'Branch'	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK MESICNE' AND balance < 0	financial
SELECT COUNT(*) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T2.frequency = 'POPLATEK MESICNE' AND T1.amount >= 250000	financial
SELECT COUNT(*) FROM loan WHERE status = 'C' AND bank = '1'	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM account WHERE date = '1995-03-24' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 2)	financial
SELECT COUNT(*) FROM card WHERE type = 'disponent'	financial
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = "Pisek"	financial
SELECT DISTINCT T1.A2, T1.A3, T1.A4, T1.A5, T1.A6, T1.A7, T1.A8, T1.A9, T1.A10, T1.A11, T1.A12, T1.A13, T1.A14, T1.A15, T1.A16 FROM district AS T1 JOIN trans AS T2 ON T1.district_id = T2.district_id WHERE T2.amount > 10000 AND T2.date = 1997	financial
SELECT account_id FROM `order` WHERE k_symbol = 'SIPO'	financial
SELECT * FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'gold' INTERSECT SELECT * FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'junior'	financial
SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND YEAR(date) = 2021	financial
SELECT DISTINCT account_id FROM account WHERE date < '1998-12-31' AND date >= '1998-01-01' AND frequency = 'POPLATEK MESICNE' AND amount < (SELECT AVG(amount) FROM account WHERE date < '1998-12-31' AND date >= '1998-01-01' AND frequency = 'POPLATEK MESICNE')	financial
SELECT * FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T1.client_id = T3.client_id JOIN loan AS T4 ON T1.client_id = T4.client_id WHERE T1.gender = 'F' AND T3.type = 'Credit' AND T4.status = 'Active'	financial
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T4.A3 = 'south Bohemia'	financial
SELECT * FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Tabor') AND type = 'OWNER'	financial
SELECT type FROM card WHERE type <> 'OWNER' AND district_id IN (SELECT district_id FROM district WHERE A11 BETWEEN 8000 AND 9000)	financial
SELECT COUNT(*) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.bank = 'AB'	financial
SELECT T1.A2 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'	financial
SELECT AVG(A15) FROM district WHERE A2 = 'POPLATEK MESICNE' AND A15 > 4000 AND A15 > (SELECT AVG(A15) FROM district WHERE A2 = 'POPLATEK MESICNE' AND A15 > 0)	financial
SELECT COUNT(*) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'classic' AND issued < (SELECT MAX	financial
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha') AND gender = 'M'	financial
SELECT COUNT(*) FROM card WHERE type = 'gold' AND issued < 1998	financial
SELECT T1.name FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T2.account_id = T3.account_id ORDER BY T3.amount DESC LIMIT 1	financial
SELECT A15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532)	financial
SELECT T1.district_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 3356) AND operation = 'VYBER'	financial
SELECT COUNT(*) FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000	financial
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 13539)	financial
SELECT district.A3 FROM district, client WHERE client.client_id = district.client_id AND client.client_id = 3541	financial
SELECT T1.A2, T1.A3, T1.A4, T1.A5, T1.A6, T1.A7, T1.A8, T1.A9, T1.A10, T1.A11, T1.A12, T1.A13, T1.A14, T1.A15, T1.A16 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT account.client_id FROM account JOIN `order` ON `order`.account_id = account.account_id WHERE `order`.order_id = 32423	financial
SELECT * FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = 5	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik')	financial
SELECT DISTINCT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'junior' AND T2.issued > '1996-01-01'	financial
SELECT AVG(A11) FROM district WHERE A11 > 10000 SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T2.district_id = (SELECT AVG(A11) FROM district WHERE A11 > 10000)	financial
SELECT SUM(amount_1997) - SUM(amount_1996) / SUM(amount_1996) * 100 AS growth_rate FROM loan WHERE account_id IN (SELECT account_id FROM client WHERE gender = 'M') AND date BETWEEN '1996-01-01' AND '1997-12-31';	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > 1995	financial
SELECT (SELECT A16 FROM district WHERE A3 = 'North' AND A2 = 'Bohemia') - (SELECT A16 FROM district WHERE A3 = 'East' AND A2 = 'Bohemia')	financial
SELECT COUNT(*) FROM account WHERE account_id IN (1,2,3,4,5,6,7,8,9,10)	financial
SELECT frequency, SUM(amount) FROM account WHERE account_id = 3 GROUP BY frequency	financial
SELECT birth_date FROM client WHERE client_id = 130	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU'	financial
SELECT SUM(t2.amount) AS total_debt, SUM(t2.payments) AS total_payments FROM client AS t1 JOIN loan AS t2 ON t1.client_id = t2.client_id WHERE t1.client_id = 992	financial
SELECT SUM(t1.amount) FROM account AS t1 JOIN client AS t2 ON t1.client_id = t2.client_id WHERE t1.account_id = 851 AND t2.client_id = 4	financial
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 9)	financial
SELECT SUM(amount) FROM trans WHERE year(date) = 1998	financial
SELECT client_id, birth_date FROM client WHERE birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district_id IN (SELECT district_id FROM account WHERE branch = 'East Bohemia');	financial
SELECT T1.client_id FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3;	financial
SELECT COUNT(*) FROM client WHERE birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND gender = 'M' AND client_id IN (SELECT T1.client_id FROM loan AS T1 JOIN trans AS T2 ON T1.loan_id = T2.loan_id WHERE T2.amount > 4000)	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > 1996	financial
SELECT COUNT(*) FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T2.type = 'junior'	financial
SELECT A3, COUNT(*) AS count, COUNT(CASE WHEN gender = 'F' THEN 1 END) AS count_female FROM client WHERE district_id IN (SELECT district_id FROM account WHERE bank = 'PRAGUE') GROUP BY A3;	financial
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT DISTINCT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')) FROM client WHERE gender = 'M' AND district_id IN (SELECT DISTINCT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')	financial
SELECT COUNT(*) FROM client WHERE gender = 'User' AND frequency = 'POPLATEK TYDNE'	financial
SELECT account.account_id, account.date, loan.amount, loan.date FROM account, loan WHERE loan.duration > 24 AND loan.status = 'valid' AND loan.account_id = account.account_id AND loan.date < account.date AND loan.amount = (SELECT MIN(loan.amount) FROM loan WHERE loan.duration > 24 AND loan.status = 'valid' AND loan.account_id = account.account_id AND loan.date < account.date)	financial
SELECT account_id FROM client WHERE gender = 'F' ORDER BY A11 LIMIT 1	financial
SELECT COUNT(*) FROM client WHERE birth_date = 1920 AND district_id IN (SELECT district_id FROM district WHERE A3 = 'East Bohemia')	financial
SELECT COUNT(*) FROM loan WHERE duration < 24 AND payments > 0	financial
SELECT AVG(amount) FROM loan WHERE status = 'C' AND POPLATEK PO OBRATU = 'POPLATEK PO OBRATU'	financial
SELECT T1.client_id, T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.type = 'owner'	financial
SELECT T1.client_id, T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'gold'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl';	toxicology
SELECT AVG(element = 'o') FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-')	toxicology
SELECT AVG(bond_type = '-') FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-' AND element = 'na';	toxicology
SELECT * FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = '#' AND T1.label = '+'	toxicology
SELECT DIVIDE(SUM(element = 'c'), COUNT(atom_id)) FROM connected WHERE bond_type = ' = ';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR099';	toxicology
SELECT molecule_id FROM atom WHERE element = 'si';	toxicology
SELECT element FROM atom WHERE bond_id = 'TR004_8_9'	toxicology
SELECT element FROM atom WHERE bond_type = ' = ';	toxicology
SELECT label FROM atom WHERE element = 'h' GROUP BY label ORDER BY COUNT(label) DESC LIMIT 1;	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te');	toxicology
SELECT atom.atom_id, atom.element, bond.bond_type, bond.molecule_id FROM atom, bond WHERE bond.bond_type = '-' AND bond.molecule_id = atom.molecule_id;	toxicology
SELECT atom.atom_id FROM atom, bond, molecule WHERE bond.bond_type = 'non-carcinogenic' AND molecule.molecule_id = bond.molecule_id AND molecule.label = '-' AND NOT atom.atom_id IN (SELECT atom_id FROM connected)	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(*) LIMIT 1; SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(*) LIMIT 1;	toxicology
SELECT bond_type FROM bond WHERE atom_id = 'TR004_8' AND atom_id = 'TR004_20';	toxicology
SELECT label FROM molecule WHERE NOT molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'sn');	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'i' OR element = 's' AND NOT molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-');	toxicology
SELECT * FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#');	toxicology
SELECT atom_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')	toxicology
SELECT SUM(element = 'f') FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT SUM(bond_type = '#') AS percent FROM bond WHERE label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6'	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) FROM molecule;	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.molecule_id WHERE T2.bond_id = 'TR_000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id = (SELECT atom_id FROM atom WHERE atom_id = 'TR000_2')	toxicology
SELECT T2.label FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = ' = ' ORDER BY T2.label	toxicology
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(bond_id)) as percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE label = '+'; SELECT DIVIDE(SUM(label = '+'), COUNT(molecule_id)) AS percent FROM molecule WHERE label = '+';	toxicology
SELECT SUM(element = 'h') FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR060';	toxicology
SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type; SELECT bond_type, COUNT(*) AS count, MAX(count) AS max_count, label	toxicology
SELECT T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = '-' ORDER BY T1.label	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type	toxicology
SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR009' AND bond_id LIKE 'TR009_%';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND element = 'br';	toxicology
SELECT bond.bond_type, connected.atom_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.molecule_id = (SELECT molecule.molecule_id FROM molecule WHERE molecule.label = 'TR001_6_9')	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` = 'TR001_10'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT molecule_id FROM atom WHERE SUBSTRING(atom_id, 7, 2) BETWEEN 21 AND 25 AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT * FROM bond WHERE bond_type IN ('P', 'N')	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1 SELECT molecule_id FROM molecule WHERE label = '+' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT AVG(bond_id) FROM bond WHERE molecule_id IN (SELECT atom_id FROM atom WHERE element = 'i');	toxicology
SELECT bond_type, bond_id FROM bond WHERE atom_id = SUBSTR(atom_id, 7, 2) + 0 = 45; SELECT bond_type, bond_id FROM bond WHERE atom_id = 45;	toxicology
SELECT element FROM atom WHERE NOT atom_id IN (SELECT atom_id FROM connected);	toxicology
SELECT atom.atom_id FROM atom, bond, molecule WHERE bond.bond_type = 'triple' AND bond.molecule_id = molecule.molecule_id AND molecule.molecule_id = 'TR447';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR144_8_19'	toxicology
SELECT molecule_id FROM molecule WHERE label = '+' AND bond_type = ' = ' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) LIMIT 1	toxicology
SELECT atom_id FROM atom WHERE element = 'pb'	toxicology
SELECT element FROM bond WHERE bond_type = '#';	toxicology
SELECT bond_id, COUNT(bond_id) FROM bond GROUP BY bond_id	toxicology
SELECT DIVIDE(SUM(label = '+'), COUNT(bond_id)) FROM bond WHERE bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN('c', 'h');	toxicology
SELECT atom_id2 FROM atom WHERE element = 's'	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'sn');	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-');	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '#' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'p' OR element = 'br'))	toxicology
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '-' EXCEPT SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT SUM(element) AS percent FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-') AND element = 'cl';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000' OR molecule_id = 'TR001' OR molecule_id = 'TR002'	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR000' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR001' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR002' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR003' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR004' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR005' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR006' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR007' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR008' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR009' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR010' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR011' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR012' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR013' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR014' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR015' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR016' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR017' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR018' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'TR019' AND molecule_id	toxicology
SELECT element FROM atom WHERE bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'i'	toxicology
SELECT MAX(label) FROM molecule WHERE element = 'ca';	toxicology
SELECT * FROM atom WHERE atom_id = 'TR001_1_8' SELECT * FROM atom WHERE atom_id = 'TR001_1_8' AND element = 'cl' INTERSECT SELECT * FROM atom WHERE atom_id = 'TR001_1_8' AND element = 'c'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '#' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'c' AND label = '-')	toxicology
SELECT DIVIDE(SUM(element = 'pb'), COUNT(molecule_id)) as percentage FROM atom WHERE label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = ';	toxicology
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'; SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#';	toxicology
SELECT element FROM atom WHERE bond_id = 'TR005_16_26'	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR001_10_11'	toxicology
SELECT bond_id, label FROM molecule WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'cl' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT molecule_id, label FROM molecule WHERE molecule_id = 'TR006' SELECT SUM(element = 'h'), COUNT(element) FROM atom WHERE molecule_id = 'TR006'	toxicology
SELECT * FROM molecule WHERE label = '+' AND element = 'ca'; SELECT * FROM molecule WHERE label = '+' AND element = 'ca';	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te');	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001_10_11'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#' / COUNT(*) * 100	toxicology
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(all bond_id)) as percent FROM bond WHERE molecule_id = 'TR047'	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1' SELECT molecule_id FROM molecule WHERE label = '+'	toxicology
SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR151'; SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR151';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR151'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT * FROM atom WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE substr(molecule_id, 3, 3)>10 AND substr(molecule_id, 3, 3) < 50) AND element = 'c';	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT bond_id FROM bond WHERE bond_type = ' = ';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+' AND element = 'h')	toxicology
SELECT T2.molecule_id FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T4 ON T1.bond_id = T4.bond_id WHERE T3.element = 'TR00_1' AND T4.molecule_id = 'TR000_1' SELECT T2.molecule_id FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T4 ON T1.bond_id = T4.bond_id WHERE T3.element = 'TR00_1' AND T4.molecule_id = 'TR000_1' AND T4.bond_type = 'single'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND NOT molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT SUM(label = '+' and element = 'h') AS percentage FROM molecule WHERE label = '+' AND element = 'h';	toxicology
SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR124'; SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR124';	toxicology
SELECT * FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = ' = ' AND molecule_id = 'TR006'; SELECT label FROM molecule WHERE molecule_id = 'TR006';	toxicology
SELECT * FROM molecule WHERE label = '+' AND element = 'cl'; SELECT * FROM molecule WHERE label = '+' AND element = 'c'; SELECT * FROM molecule WHERE label = '+' AND element = 'cl'; SELECT * FROM molecule WHERE label = '+' AND element = 'c'; SELECT * FROM molecule WHERE label = '+' AND element = 'h'; SELECT * FROM molecule WHERE label = '+' AND element = 'o'; SELECT * FROM molecule WHERE label = '+' AND element = 's'; SELECT * FROM molecule WHERE label = '+' AND element = 'n'; SELECT * FROM molecule WHERE label = '+' AND element = 'p'; SELECT * FROM molecule WHERE label = '+' AND element = 'na'; SELECT * FROM molecule WHERE label = '+' AND element = 'br'; SELECT * FROM molecule WHERE label = '+' AND element = 'f'; SELECT * FROM molecule WHERE label = '+' AND element = 'i'; SELECT * FROM molecule WHERE label = '+' AND element = 'sn'; SELECT * FROM molecule WHERE label = '+' AND element = 'pb'; SELECT * FROM molecule WHERE label = '+' AND element = 'te'; SELECT * FROM molecule WHERE label = '+' AND element = 'ca';	toxicology
SELECT b.molecule_id, b.bond_type, a.atom_id, a.atom_id2, c.label FROM bond b JOIN connected c ON c.bond_id = b.bond_id WHERE b.bond_type = '-'	toxicology
SELECT * FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = '#'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'cl'	toxicology
SELECT atom_id, COUNT(DISTINCT bond_type) FROM bond WHERE molecule_id = 'TR346' GROUP BY atom_id SELECT atom_id, COUNT(DISTINCT bond_type) FROM bond WHERE molecule_id = 'TR346' GROUP BY atom_id;	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.label = '+'	toxicology
SELECT COUNT(*) FROM molecule WHERE NOT label LIKE '%s%' AND NOT molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = ' = ')	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT * FROM atom WHERE element = 'cl' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT * FROM molecule WHERE label = '-' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'c');	toxicology
SELECT SUM(label = '+' and element = 'cl') FROM molecule WHERE label = '+'	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id = 'TR001_3_4';	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2'); SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2');	toxicology
SELECT `molecule` FROM `atom` WHERE `atom_id` = 'TR000_2' SELECT `molecule` FROM `atom` WHERE `atom_id` = 'TR000_4' SELECT `molecule` FROM `atom` WHERE `atom_id` = 'TR000_2' INTERSECT SELECT `molecule` FROM `atom` WHERE `atom_id` = 'TR000_4'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000'; SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT percentage FROM bond WHERE bond_type = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND element = 'n';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = '; SELECT molecule_id FROM atom WHERE element = 's'; SELECT molecule_id FROM connected WHERE atom_id = (SELECT atom_id FROM atom WHERE element = 's') AND bond_id = (SELECT bond_id FROM bond WHERE bond_type = ' = ');	toxicology
SELECT * FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5;	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR024' AND bond_type = '=' AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT molecule_id FROM atom GROUP BY molecule_id ORDER BY COUNT(atom.molecule_id) DESC LIMIT 1;	toxicology
SELECT SUM(label) AS percentage FROM molecule WHERE bond_type = '#' AND element = 'h';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT COUNT(*) FROM molecule AS t1 JOIN bond AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.bond_type = ' = ' AND t1.label = 'oxygen';	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.bond_id = '##'	toxicology
SELECT T1.element, T2.bond_type FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.molecule_id WHERE T1.molecule_id = 'TR016';	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR012' AND element = 'c' AND bond_type = ' = ';	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+' AND element = 'o')	toxicology
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECTED	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT	card_games
SELECT DisplayName, MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY DisplayName ORDER BY MAX(Reputation) DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND CreationDate > 2013	codebase_community
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = '##UserId##'	codebase_community
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = '##UserId##' AND ViewCount = (SELECT MAX(ViewCount) FROM posts WHERE OwnerUserId = '##UserId##')	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT SUM(CommentCount) FROM posts WHERE OwnerUserId = '##UserId##'	codebase_community
SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = '##UserId##'	codebase_community
SELECT LastEditorDisplayName FROM posts WHERE Id = 10144	codebase_community
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL	codebase_community
SELECT OwnerDisplayName FROM posts WHERE ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Age > 65 AND p.Score > 20	codebase_community
SELECT Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts')	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian')	codebase_community
SELECT p.Body FROM posts AS p INNER JOIN tags AS t ON p.Id = t.ExcerptPostId WHERE t.TagName = '##tagname:string##' ORDER BY p.Score DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Teacher' AND UserId = 101	codebase_community
SELECT Name FROM badges WHERE UserId = 101	codebase_community
SELECT COUNT(*) FROM badges WHERE YEAR(Date) = 2011 AND UserId = '##UserId##'	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT MAX(UserId) FROM badges)	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = '##UserId##'	codebase_community
SELECT AVG(COUNT(Id)) AS average_badges, COUNT(DisplayName) AS total_users FROM users WHERE Views > 200 GROUP BY DisplayName	codebase_community
SELECT COUNT(Id) AS "count", (COUNT(Id) / (SELECT COUNT(*) FROM posts WHERE Score > 20)) * 100 AS "percentage" FROM posts WHERE Score > 20 AND Age > 65;	codebase_community
SELECT COUNT(*) FROM votes WHERE PostId = 1 AND VoteTypeId = 2 AND CreationDate = '2010-07-19' AND UserId = 58	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT p.Title FROM posts AS p INNER JOIN comments AS c ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = 1910	codebase_community
SELECT COUNT(*) FROM votes WHERE PostId = '##PostId##' AND VoteTypeId = 5 AND CreationDate > '##CreationDate##'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = '1'	codebase_community
SELECT * FROM posts WHERE Id = 102444 AND CreationDate = '2013-07-12 09:08:18.0' AND ClosedDate IS NULL	codebase_community
SELECT Reputation FROM users WHERE Id = '65041'	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT DisplayName FROM users WHERE Id = '6347'	codebase_community
SELECT COUNT(*) FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'DatEpicCoderGuyWhoPrograms')	codebase_community
SELECT COUNT(p.Id) / COUNT(v.Id) FROM posts AS p INNER JOIN votes AS v ON p.Id = v.PostId WHERE p.OwnerUserId = '24'	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT Name FROM badges WHERE UserId = '##UserId##'	codebase_community
SELECT UserDisplayName FROM comments WHERE Text LIKE '%thank you user93%'	codebase_community
SELECT * FROM comments WHERE UserId = '##UserId##'	codebase_community
SELECT u.DisplayName, u.Reputation FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Text FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT u.DisplayName, b.Name, b.Date FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer'	codebase_community
SELECT OwnerUserId FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT Title FROM Posts WHERE LastEditorUserId = '##UserId##'	codebase_community
SELECT SUM(Score) AS TotalScore, Users.WebsiteUrl FROM Posts INNER JOIN Users ON Posts.LastEditorUserId = Users.Id WHERE Users.DisplayName = 'Yevgeny' AND Posts.LastEditorUserId != 0 GROUP BY Users.WebsiteUrl	codebase_community
SELECT c.Text FROM comments AS c INNER JOIN postHistory AS ph ON c.PostId = ph.PostId INNER JOIN posts AS p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND ph.PostHistoryTypeId = 5 AND ph.UserId = '##UserId##'	codebase_community
SELECT SUM(v.BountyAmount) FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data%'	codebase_community
SELECT u.DisplayName FROM users AS u INNER JOIN votes AS v ON v.UserId = u.Id WHERE v.PostId = 101 AND v.BountyAmount = 50 AND v.VoteTypeId = 8 AND v.CreationDate > '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' SELECT u.DisplayName FROM users AS u INNER JOIN votes AS v ON v.UserId = u.Id WHERE v.PostId = 101 AND v.BountyAmount = 50 AND v.VoteTypeId = 8 AND v.CreationDate > '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-07-19 19:39:07.0' AND v.CreationDate < '2010-0	codebase_community
SELECT AVG(ViewCount) AS average_view_count, t.TagName, p.Title, p.Body, p.Score, c.Text FROM posts AS p INNER JOIN tags AS t ON p.Tags LIKE '%humor%' INNER JOIN comments AS c ON c.PostId = p.Id WHERE p.PostTypeId = 1 GROUP BY t.TagName, p.Title, p.Body, p.Score, c.Text ORDER BY average_view_count DESC	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT Id FROM users ORDER BY Views LIMIT 1	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Count(Name) > 5;	codebase_community
SELECT COUNT(*) AS users FROM users WHERE Location LIKE '%New York%' AND (SELECT COUNT(*) FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Teacher' OR badges.Name = 'Supporter') > 0	codebase_community
SELECT u.DisplayName, u.Reputation FROM users AS u WHERE u.Id = 1	codebase_community
SELECT u.Id AS "user_link", u.DisplayName, u.Reputation, u.Views, COUNT(p.Id) AS "number_of_posts" FROM users AS u INNER JOIN postHistory AS ph ON ph.UserId = u.Id INNER JOIN posts AS p ON p.Id = ph.PostId WHERE ph.PostHistoryTypeId = 5 AND u.Reputation > 1000 AND u.Views > 1000 GROUP BY u.Id, u.DisplayName, u.Reputation, u.Views HAVING COUNT(p.Id) = 1 ORDER BY u.Reputation DESC	codebase_community
SELECT c.UserId AS "user_link", COUNT(c.Id) AS "comments" FROM comments AS c WHERE c.UserId != -1 GROUP BY c.UserId ORDER BY COUNT(c.Id) DESC LIMIT 100	codebase_community
SELECT COUNT(*) FROM users WHERE Location LIKE '%India%' AND EXISTS (SELECT * FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Teacher')	codebase_community
SELECT (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2010) - (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2011) * 100 / (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2010)	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId	codebase_community
SELECT * FROM postLinks WHERE PostId = 61217 SELECT * FROM posts WHERE Id = 61217	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395	codebase_community
SELECT p.Id AS "post_link", p.OwnerUserId AS "user_link" FROM posts AS p WHERE p.Score > 60 ORDER BY p.Id	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND CreationDate = 2011	codebase_community
SELECT AVG(UpVotes) AS "average_upvotes", AVG(Age) AS "average_age" FROM users WHERE Count(UserId) > 10;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT * FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10	codebase_community
SELECT b.Name, u.DisplayName, u.Reputation, u.Location, u.WebsiteUrl, u.Views, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AccountId, u.CreationDate, u.LastAccessDate FROM badges b INNER JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users) AND b.Name IN ('Teacher', 'Famous Question', 'Famous Answer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer', 'Necromancer',	codebase_community
SELECT SUM(Reputation) FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Date = '2010-07-19 19:39:08.0');	codebase_community
SELECT b.Name FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'	codebase_community
SELECT DISTINCT b.Date FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE u.Location LIKE '%Rochester, NY%'	codebase_community
SELECT COUNT(UserId) AS "Teacher", COUNT(UserId) AS "Total Users", (COUNT(UserId) / COUNT(UserId)) * 100 AS "Percentage" FROM badges WHERE Name = 'Teacher'	codebase_community
SELECT COUNT(UserId) AS "Number of Users", COUNT(UserId) * 100.0 / (SELECT COUNT(UserId) FROM users WHERE Age BETWEEN 13 AND 18) AS "Percentage" FROM users WHERE Age BETWEEN 13 AND 18 AND UserId IN (SELECT UserId FROM badges WHERE Name = 'Organizer');	codebase_community
SELECT c.Score FROM comments AS c WHERE c.PostId = 1	codebase_community
SELECT Text FROM comments WHERE PostId = 1	codebase_community
SELECT u.Age FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE u.Location LIKE '%Vienna%' AND b.Name = 'Teacher'	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND Reputation >= 15000	codebase_community
SELECT SUM(u.Views) FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT b.Name, u.DisplayName, u.Reputation, u.Id, u.Location, u.WebsiteUrl, u.Views, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, u.AboutMe, u.LastAccessDate, u.CreationDate, u.UpVotes, u.DownVotes	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')	codebase_community
SELECT COUNT(*) FROM users WHERE Age > 65 AND EXISTS(SELECT * FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Supporter')	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%'	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 10;	codebase_community
SELECT (COUNT(Id where YEAR(CreationDate) = 2010) / COUNT(Id where YEAR(CreationDate) = 2011)) AS Ratio FROM votes;	codebase_community
SELECT t.TagName FROM users AS u INNER JOIN tags AS t ON t.TagName = u.DisplayName WHERE u.DisplayName = 'John Stauffer';	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 101	codebase_community
SELECT Id FROM posts WHERE OwnerUserId = 101 AND AnswerCount = (SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = 101)	codebase_community
SELECT MAX(SUM(ViewCount)) FROM posts WHERE PostTypeId = 1 AND (DisplayName = 'Harvey Motulsky' OR DisplayName = 'Noah Snyder');	codebase_community
SELECT COUNT(*) FROM users INNER JOIN posts ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Matt Parker' AND posts.Score > 4;	codebase_community
SELECT COUNT(*) FROM comments WHERE Score < 60 AND PostId IN (SELECT Id FROM posts WHERE OwnerUserId = '##UserId##') AND UserDisplayName = 'Neil McGuigan';	codebase_community
SELECT t.TagName, t.Count FROM tags AS t INNER JOIN posts AS p ON t.WikiPostId = p.Id WHERE p.OwnerUserId = '##UserId##' AND p.PostTypeId = 2 AND p.ClosedDate IS NULL AND p.CommentCount = 0 AND p.AnswerCount = 0 AND p.FavoriteCount = 0 AND p.LastEditorUserId = '##UserId##' AND p.LastEditDate > '2015-01-01 00:00:00' AND p.LastEditDate < '2015-12-31 23:59:59' ORDER BY t.TagName	codebase_community
SELECT DISTINCT Name FROM badges WHERE Name = 'Organizer'	codebase_community
SELECT DIVIDE(COUNT(PostId WHERE TagName = 'r'), COUNT(PostId WHERE DisplayName = 'Community')) AS percentage FROM posts WHERE PostTypeId = 1 AND OwnerUserId = 101	codebase_community
SELECT (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Mornington') - (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Amos');	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'commentator' AND YEAR(Date) = 2014	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT c.PostId AS "post_link", c.Text AS "comment_text", c.UserId AS "user_link" FROM comments AS c WHERE c.Score > 60 ORDER BY c.PostId DESC LIMIT 100;	codebase_community
SELECT b.Name FROM badges AS b WHERE b.UserId = '##UserId##' AND YEAR(b.Date) = 2011	codebase_community
SELECT p.OwnerDisplayName, p.WebsiteUrl FROM posts AS p WHERE p.FavoriteCount > 150;	codebase_community
SELECT ph.CreationDate, ph.PostId, ph.PostHistoryTypeId, ph.Text, ph.Comment, ph.UserId, ph.UserDisplayName, ph.RevisionGUID, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.UserId, ph.UserDisplayName, ph.CreationDate, ph.	codebase_community
SELECT u.LastAccessDate, u.Location FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Outliers'	codebase_community
SELECT Title FROM posts WHERE PostId = 10144	codebase_community
SELECT p.Id AS "post_link", b.Name FROM badges AS b INNER JOIN posts AS p ON p.Id = b.UserId WHERE b.UserId = '##UserId##' AND YEAR(b.Date) = 2013	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT DisplayName, Location FROM users WHERE OwnerUserId = 101	codebase_community
SELECT t.TagName, t.Count, p.Title, p.Body, p.Score, p.ViewCount, p.Tags, p.AnswerCount, p.CommentCount, p.FavoriteCount, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerUserId, p.LastEditorDisplayName, p.Owner	codebase_community
SELECT p.DisplayName FROM Posts AS p WHERE p.Id = (SELECT MAX(ParentId) FROM Posts)	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users AS u INNER JOIN votes AS v ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50	codebase_community
SELECT Id FROM users ORDER BY Age LIMIT 1;	codebase_community
SELECT p.Score, p.ViewCount, p.Tags, MAX(t.Count) AS MostPopularTag FROM posts AS p INNER JOIN tags AS t ON p.Tags LIKE '%' + t.TagName + '%' GROUP BY p.Score, p.ViewCount, p.Tags ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT AVG(CAST(COUNT(Id) AS FLOAT)) FROM postLinks WHERE YEAR(CreationDate) = 2010 AND LinkTypeId = 1	codebase_community
SELECT MAX(FavoriteCount) FROM posts WHERE OwnerUserId = 1465	codebase_community
SELECT Title FROM Posts WHERE Id = (SELECT MIN(PostId) FROM PostLinks)	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT MAX(UserId) FROM badges)	codebase_community
SELECT MIN(CreationDate) FROM votes WHERE UserId = '##UserId##' AND VoteTypeId = 2	codebase_community
SELECT MIN(CreaionDate) FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE users.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT MIN(UserId) FROM badges WHERE Name = 'Autobiographer')	codebase_community
SELECT COUNT(u.Id) AS "number_of_users" FROM users AS u INNER JOIN (SELECT p.OwnerUserId, SUM(p.FavoriteCount) AS "total_favorite_count" FROM posts AS p WHERE p.OwnerUserId != -1 GROUP BY p.OwnerUserId) AS p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.total_favorite_count >= 4;	codebase_community
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010;	codebase_community
SELECT Id, Title FROM posts WHERE OwnerUserId = '##UserId##' AND PostTypeId = 1 ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1;	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = 101	codebase_community
SELECT u.DisplayName FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE YEAR(p.CreationDate) = 2011 AND p.ViewCount > 20000;	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE YEAR(CreationDate) = 2010 ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(Id) where CreationDate = 2011 and Reputation > 1000, COUNT(Id)) * 100 as percentage;	codebase_community
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 13 AND 18;	codebase_community
SELECT SUM(ViewCount) AS total_views, OwnerUserId, OwnerDisplayName, LastEditorUserId, LastEditDate FROM posts WHERE Title = 'Computer Game Datasets' GROUP BY OwnerUserId, OwnerDisplayName, LastEditorUserId, LastEditDate ORDER BY total_views DESC LIMIT 10	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT c.PostId, c.Text, c.CreationDate, c.UserId, c.UserDisplayName, c.Score, c.Score + c.Score AS TotalScore FROM comments AS c INNER JOIN posts AS p ON c.PostId = p.Id WHERE c.PostId = (SELECT MAX(p.Id) FROM posts AS p) AND c.Score > 0 ORDER BY c.Score DESC	codebase_community
SELECT COUNT(*) AS "Number of Posts" FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT DisplayName, Location FROM users WHERE Id = (SELECT MAX(LastEditorUserId) FROM posts WHERE Id = 183)	codebase_community
SELECT MAX(Date) FROM badges WHERE Name = 'Emmett'	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT DATEDIFF(stats_badges.Date, users.CreationDate) FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Zolomon';	codebase_community
SELECT COUNT(p.Id) AS Posts, COUNT(c.Id) AS Comments FROM Posts AS p INNER JOIN Comments AS c ON c.PostId = p.Id WHERE p.OwnerUserId = (SELECT MAX(Id) FROM Users) GROUP BY p.Id, c.Id;	codebase_community
SELECT Text, UserDisplayName FROM comments WHERE PostId = 101 ORDER BY CreationDate DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT Name) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts WHERE Tags.TagName = 'careers';	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT c.Text, c.Score, c.CreationDate, c.UserId AS "user_link", c.UserDisplayName AS "user_name" FROM comments AS c INNER JOIN posts AS p ON c.PostId = p.Id WHERE p.Title = 'Clustering 1D data' AND c.UserId IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109,	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount > 30;	codebase_community
SELECT (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS total_posts, (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS posts_with_score_above_50, (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS posts_with_score_above_50_and_reputation_above_##reputation##, (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS posts_with_score_above_50_and_reputation_above_##reputation##_and_reputation_above_##reputation##, (SELECT COUNT(stats_posts.Id) FROM (SELECT * FROM posts WHERE OwnerUserId = '##UserId##' AND Score > = 50) AS stats_posts) AS posts_with_score_above_50_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##reputation##_and_reputation_above_##	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count < 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users AS u INNER JOIN comments AS c ON c.UserId = u.Id WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.Id = 10144	codebase_community
SELECT MAX(Score) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount BETWEEN 100 AND 150);	codebase_community
SELECT c.CreationDate, u.Age FROM comments c INNER JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(c.PostId) AS "count" FROM comments AS c WHERE c.Score = 0 AND c.PostId IN (SELECT Id FROM posts WHERE ViewCount < 5);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = 1 AND Score = 0	codebase_community
SELECT COUNT(c.UserId) AS "total_users" FROM users AS u INNER JOIN comments AS c ON c.UserId = u.Id WHERE u.Age = 40 AND c.Score = 0	codebase_community
SELECT PostId, Text FROM comments WHERE PostId = 101	codebase_community
SELECT SUM(UpVotes) FROM users WHERE Users.Id = 126	codebase_community
SELECT c.Id AS "comment_link", c.Text, c.CreationDate, c.PostId AS "post_link" FROM comments AS c WHERE c.UserId = '##UserId##' AND c.Text LIKE '%##CommentText##%' ORDER BY c.CreationDate DESC	codebase_community
SELECT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND DownVotes = 0;	codebase_community
SELECT DIVIDE(COUNT(UserId where UpVotes = 0 and Score BETWEEN 5 and 10)), (COUNT(UserId where Score BETWEEN 5 and 10)) as percentage;	codebase_community
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man';	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND superhero_name IN (SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength');	superhero
SELECT superhero_name, full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(T1.id) > 15	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN power_attribute AS T3 ON T2.power_id = T3.power_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Agility' AND T1.eye_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blue')	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blue') AND hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blond') AND superhero.superpower_id = (SELECT superpower.id FROM superpower WHERE superpower.power_name = 'Agility');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC LIMIT 1	superhero
SELECT publisher_name FROM publisher WHERE publisher_name = 'Sauron'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_name = 'Marvel Comics' AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_name = 'Marvel Comics';	superhero
SELECT publisher_name, COUNT(id) FROM superhero WHERE publisher_name = 'Marvel Comics' AND superhero_name IN ('Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor', 'Captain America', 'Iron Man', 'Thor', 'Spider-Man', 'Black Widow', 'Thor',	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')	superhero
SELECT publisher_name FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Speed' GROUP BY T1.publisher_name ORDER BY MIN(T4.attribute_value) LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold')	superhero
SELECT publisher_name FROM publisher WHERE publisher_name IN (SELECT publisher_name FROM superhero WHERE superhero_name = 'Blue Beetle II');	superhero
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blond')	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T3.attribute_value LIMIT 1	superhero
SELECT race_id FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t3.attribute_name = 'Durability' AND t3.attribute_value < 50	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t1.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND t3.attribute_name = 'Strength' AND t3.attribute_value = 100	superhero
SELECT superhero_name FROM superhero GROUP BY superhero_name ORDER BY COUNT(superhero_name) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race = 'Vampire'	superhero
SELECT SUM(CASE WHEN alignment = 'Bad' THEN 1 ELSE 0 END) * 100 / COUNT(*) AS percentage_of_superheroes_who_act_in_their_own_self_interest_or_make_decisions_based_on_their_own_moral_code, COUNT(*) AS number_of_superheroes_published_by_marvel_comics FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') GROUP BY alignment;	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))	superhero
SELECT publisher_id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.id = 75	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = 2;	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.gender_id = (SELECT id FROM gender WHERE gender = 'Male');	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 56	superhero
SELECT superhero_name FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Demi-God');	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 'Bad'	superhero
SELECT race_id FROM superhero WHERE weight_kg = 169	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T1.race = 'human' AND T1.height_cm = 185;	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(CASE WHEN height_cm BETWEEN 150 AND 180 THEN 1 ELSE 0 END) * 100 / COUNT(*) FROM superhero WHERE publisher_id = 13;	superhero
SELECT superhero_name FROM superhero WHERE weight_kg > (SELECT AVG(weight_kg) FROM superhero) AND gender_id IN (SELECT id FROM gender WHERE gender = 'Male');	superhero
SELECT power_name FROM superpower GROUP BY power_name ORDER BY COUNT(power_name) DESC LIMIT 1	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination';	superhero
SELECT superpower.power_name FROM superpower, hero_power WHERE hero_power.hero_id = 1 AND hero_power.power_id = superpower.id	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'stealth';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'strength' GROUP BY T1.id ORDER BY T3.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(height_cm) FROM superhero WHERE skin_colour_id IS NULL;	superhero
SELECT COUNT(*) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Dark Horse Comics';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'durability' AND T1.publisher_id = (SELECT publisher_id FROM publisher WHERE publisher_name = 'Dark Horse Comics') GROUP BY T1.superhero_name ORDER BY MAX(T3.attribute_value) DESC LIMIT 1	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abraham Sapien';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight';	superhero
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Female' AND T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')	superhero
SELECT T1.publisher_name FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.hair_colour_id = T2.skin_colour_id AND T2.eye_colour_id = T2.skin_colour_id AND T2.superhero_name = 'Superman';	superhero
SELECT race_id FROM superhero WHERE superhero_name = 'A-Bomb';	superhero
SELECT percentage FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT gender.gender FROM gender JOIN superhero ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T2.power_id = (SELECT id FROM superpower WHERE power_name = 'Adaptation');	superhero
SELECT COUNT(*) FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Amazo';	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN colour AS T3 ON T2.eye_colour_id = T3.id AND T2.hair_colour_id = T3.id WHERE T3.colour = 'Black';	superhero
SELECT T1.eye_colour_id FROM colour AS T1 JOIN superhero AS T2 ON T1.colour = 'Gold' WHERE T2.skin_colour_id = T1.id	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT superhero_name FROM superhero WHERE alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Strength';	superhero
SELECT T1.race, T2.alignment FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Cameron Hicks';	superhero
SELECT percent FROM hero_attribute WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race = 'Alien';	superhero
SELECT difference FROM superhero WHERE full_name = 'Emil Blonsky' - SELECT difference FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT AVG(height_cm) FROM superhero; SELECT AVG(height_cm) FROM superhero;	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed';	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT T1.attribute_name, T2.attribute_value FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man';	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = 7 AND hair_colour_id = 9	superhero
SELECT publisher_name FROM publisher WHERE publisher_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL;	superhero
SELECT percentage FROM superhero WHERE eye_colour_id = 7;	superhero
SELECT ratio FROM superhero WHERE gender_id = 1 OR gender_id = 2;	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT power_id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE superhero.id = 294	superhero
SELECT superhero_name FROM superhero WHERE weight_kg IS NULL;	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT race_id FROM superhero WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT publisher_name FROM publisher WHERE publisher_id = (SELECT publisher_id FROM superhero WHERE id = 38);	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id GROUP BY T1.race ORDER BY MAX(T4.attribute_value) DESC LIMIT 1;	superhero
SELECT T2.alignment, T3.power_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT AVG(t2.attribute_value) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN alignment AS t3 ON t1.alignment_id = t3.id WHERE t3.alignment = 'Neutral';	superhero
SELECT T1.skin_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value = 100	superhero
SELECT COUNT(*) FROM superhero AS t1 JOIN gender AS t2 ON t1.gender_id = t2.id JOIN alignment AS t3 ON t1.alignment_id = t3.id WHERE t2.gender = 'Female' AND t3.alignment = 'Good';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race_id FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'male');	superhero
SELECT percentage FROM superhero AS t1 JOIN alignment AS t2 ON t1.alignment_id = t2.id JOIN gender AS t3 ON t1.gender_id = t3.id WHERE t2.alignment = 'Bad' AND t3.gender = 'Female';	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 7 AND weight_kg != 0) - (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 1 AND weight_kg != 0)	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Hulk' AND T2.attribute_name = 'Strength';	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero WHERE skin_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Green') AND alignment = 'Bad';	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero WHERE superhero_name IN (SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control'); ORDER BY superhero_name	superhero
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.id = T2.id JOIN hero_attribute AS T3 ON T1.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Phoenix Force';	superhero
SELECT superhero_name FROM superhero WHERE publisher_name = 'DC Comics' ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(height_cm) FROM superhero WHERE race_id <> 'Human' AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT COUNT(*) FROM hero_attribute WHERE attribute_value = 100 WHERE attribute_name = 'Speed';	superhero
SELECT publisher_name, COUNT(*) AS num_heroes FROM superhero GROUP BY publisher_name ORDER BY num_heroes DESC; SELECT publisher_name, COUNT(*) AS num_heroes FROM superhero GROUP BY publisher_name ORDER BY num_heroes DESC;	superhero
SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Black Panther'; SELECT T2.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT publisher_name, COUNT(*) AS num_superheroes FROM superhero WHERE publisher_name = 'George Lucas' GROUP BY publisher_name; SELECT publisher_name, COUNT(*) AS num_female_superheroes FROM superhero WHERE publisher_name = 'George Lucas' AND gender_id IN (SELECT id FROM gender WHERE gender = 'Female') GROUP BY publisher_name; SELECT publisher_name, MULTIPLY(DIVIDE(COUNT(*) AS num_female_superheroes, COUNT(*) AS total_superheroes), 100.0) AS percentage FROM superhero WHERE publisher_name = 'George Lucas' AND gender_id IN (SELECT id FROM gender WHERE gender = 'Female')	superhero
SELECT percentage FROM superhero WHERE publisher_name = 'Marvel Comics' AND alignment = 'Good';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT T1.id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id GROUP BY T1.id ORDER BY MIN(T3.attribute_value) LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE superhero_name = 'Alien' SELECT superhero_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT superhero_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'brown')	superhero
SELECT t2.attribute_value FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id WHERE t1.superhero_name = "Aquababy"	superhero
SELECT weight_kg, race_id FROM superhero WHERE superhero.id = 40; SELECT weight_kg, race_id FROM superhero WHERE superhero.id = 40;	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT T1.hero_id FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Intelligence';	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Blackwulf';	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.height_cm > MULTIPLY(AVG(T3.height_cm), 0.8);	superhero
SELECT DISTINCT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 18 AND T2.q1 = (SELECT MAX(q1) FROM results WHERE raceId = 18)	formula_1
SELECT T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19 AND T1.q2 = (SELECT MIN(q2) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19)	formula_1
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = "Shanghai"	formula_1
SELECT results.url FROM results JOIN races ON results.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = "Circuit de Barcelona-Catalunya"	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = "Germany"	formula_1
SELECT DISTINCT T2.position FROM constructors AS T1 JOIN circuits AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = "Renault"	formula_1
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId IN (SELECT circuitId FROM circuits WHERE location LIKE '%grand prix%' AND continent <> 'Asia' AND continent <> 'Europe')	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = "Spain"	formula_1
SELECT location FROM circuits WHERE name = "Australian grand prix"	formula_1
SELECT url FROM circuits WHERE circuitRef = 'sepang international circuit';	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "Sepang International Circuit"	formula_1
SELECT location, lat, lng FROM circuits WHERE name = "abu dhabi grand prix"	formula_1
SELECT T1.nationality FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 24 AND T2.points = 1	formula_1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId = 2	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.number = 355 AND T2.time = "0:01:40"	formula_1
SELECT T1.number FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.number = 903 AND T2.time = '0:01:54'	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 3 AND time IS NULL	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.result = 901	formula_1
SELECT COUNT(DISTINCT drivers.driverId) FROM drivers INNER JOIN results ON drivers.driverId = results.driverId INNER JOIN races ON results.raceId = races.raceId WHERE races.date = "2015-11-29" AND results.time = "00:00:00"	formula_1
SELECT MAX(dob) FROM drivers WHERE NOT time IS NULL AND driverId IN (SELECT driverId FROM results WHERE raceId = 592)	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, T1.url FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 161 AND T2.milliseconds = 0 ORDER BY T2.milliseconds	formula_1
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 AND T2.nationality <> "British"	formula_1
SELECT location FROM circuits WHERE name = "sepang"	formula_1
SELECT MAX(T2.points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9; SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 ORDER BY T2.points DESC LIMIT 1;	formula_1
SELECT results.time FROM results WHERE results.raceId = 345 AND results.driverId = 10 AND results.q1 = 'Pit'	formula_1
SELECT DISTINCT drivers.nationality FROM drivers, results, races WHERE results.driverId = drivers.driverId AND results.raceId = races.raceId AND results.time = '0:01:15' AND races.raceId = 347	formula_1
SELECT T2.code FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 45 AND T2.surname = "Hamilton"	formula_1
SELECT results.time FROM results WHERE results.raceId = 743 AND results.driverId = 1	formula_1
SELECT DISTINCT T2.driverId FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 3 AND T1.year = 2006 AND T1.position = 2	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.result = 901	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE date = "2015-11-29"	formula_1
SELECT MAX(dob) FROM drivers WHERE NOT time IS NULL AND raceId = 872	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 348 ORDER BY T2.milliseconds LIMIT 1	formula_1
SELECT drivers.nationality FROM drivers, results WHERE results.driverId = drivers.driverId AND results.raceId = 348 AND results.fastestLapSpeed = (SELECT MAX(results.fastestLapSpeed) FROM results)	formula_1
SELECT (SELECT fastestLapSpeed(raceId = 853) FROM results WHERE raceId = 853) - (SELECT fastestLapSpeed(raceId = 854) FROM results WHERE raceId = 854)	formula_1
SELECT DISTINCT T1.driverId, T1.number, T1.forename, T1.surname, T1.dob, T1.nationality, T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.time LIKE '%1983-07-16%'	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005 ORDER BY name DESC	formula_1
SELECT * FROM races WHERE year = (SELECT MIN(year) FROM races) AND month = (SELECT MIN(month) FROM races); SELECT * FROM races WHERE year = (SELECT MIN(year) FROM races) AND month = (SELECT MIN(month) FROM races) AND date != (SELECT MIN(date) FROM races);	formula_1
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1;	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT DISTINCT name FROM races WHERE year != 2000	formula_1
SELECT T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "European Grand Prix" ORDER BY T2.year LIMIT 1;	formula_1
SELECT MAX(year) FROM races WHERE circuitId = (SELECT MAX(circuitId) FROM circuits WHERE name = 'Brands Hatch')	formula_1
SELECT COUNT(*) FROM circuits WHERE circuitRef = 'silverstone'	formula_1
SELECT DISTINCT T2.driverId, T2.forename, T2.surname, T2.dob, T2.nationality, T2.url FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 2010 AND T1.circuitId = 4 ORDER BY T1.position	formula_1
SELECT T1.forename, T1.surname, MAX(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId	formula_1
SELECT TOP 3 drivers.forename, TOP 3 drivers.surname, SUM(results.points) AS total_points FROM results, races, drivers WHERE races.year = 2017 AND races.name = 'Chinese Grand Prix' AND results.raceId = races.raceId AND results.driverId = drivers.driverId GROUP BY drivers.forename, drivers.surname ORDER BY total_points DESC LIMIT 3	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, T2.name, T2.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM results)	formula_1
SELECT AVG(time) FROM results WHERE raceId IN (SELECT races.raceId FROM races WHERE races.year = 2009 AND races.name = 'Chinese Grand Prix') AND driverId IN (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Sebastian' AND drivers.surname = 'Vettel')	formula_1
SELECT DISTINCT (position) FROM results WHERE surname = 'Hamilton' AND year >= 2010; SELECT DISTINCT (position) FROM results WHERE surname = 'Hamilton' AND year >= 2010;	formula_1
SELECT T1.forename, T1.surname, T1.nationality, AVG(T2.points) FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY MAX(T2.wins) DESC LIMIT 1;	formula_1
SELECT forename, surname FROM drivers WHERE nationality = 'Japanese' AND age = 2022 - YEAR(dob) + 1	formula_1
SELECT DISTINCT T2.name FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year >= 1990 AND T1.year <= 2000 GROUP BY T2.name HAVING COUNT(*) = 4;	formula_1
SELECT T1.name, T1.location, T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = "USA" AND T2.year = 2006	formula_1
SELECT T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.date LIKE "2005-09%"	formula_1
SELECT races.name FROM results, races WHERE results.driverId = 2 AND results.position < 10 AND results.raceId = races.raceId	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T4.forename = "Michael" AND T4.surname = "Schumacher" AND T3.name = "Sepang International Circuit" AND T1.rank = 1	formula_1
SELECT races.year, races.name FROM races JOIN results ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = "Michael" AND drivers.surname = "Schumacher" AND results.milliseconds = (SELECT MIN(milliseconds) FROM results WHERE raceId = races.raceId AND driverId = drivers.driverId)	formula_1
SELECT AVG(points) FROM results WHERE year = 2000	formula_1
SELECT MIN(year), MIN(points) FROM results WHERE driverId = 44	formula_1
SELECT races.name, races.country, races.date FROM races WHERE YEAR(races.date) = 2017 ORDER BY races.date	formula_1
SELECT races.name, races.year, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.laps = (SELECT MAX(laps) FROM races)	formula_1
SELECT percentage FROM races WHERE name = 'Europearn Grand Prix' AND country = 'Germany';	formula_1
SELECT location FROM circuits WHERE name = "Silverstone"	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY max(lat) DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = "marina bay street circuit"	formula_1
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT nationality FROM drivers ORDER BY dob LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian'	formula_1
SELECT url FROM drivers WHERE forename = "Anthony" AND surname = "Davidson"	formula_1
SELECT driverRef FROM drivers WHERE forename = "Lewis" AND surname = "Hamilton"	formula_1
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year = 2009 AND races.name = "Spanish Grand Prix"	formula_1
SELECT DISTINCT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Silverstone Circuit")	formula_1
SELECT * FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "Abu Dhabi Circuit" AND T1.year = 2010	formula_1
SELECT COUNT(*) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = "Italy" AND T2.sport = "Formula_1"	formula_1
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "Barcelona-Catalunya"	formula_1
SELECT url FROM circuits WHERE circuitRef = 'Valencia Street Circuit'	formula_1
SELECT MIN(T2.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT T2.driverRef FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 1 AND T1.year = 2008 AND T1.rank = 1	formula_1
SELECT results.raceId, results.year, results.month, results.day, results.time, results.milliseconds, results.points, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed, results.rank, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results.grid, results.position, results.positionText, results.laps, results.time, results.milliseconds, results.statusId, results	formula_1
SELECT races.name, results.rank FROM races INNER JOIN results ON results.raceId = races.raceId WHERE results.driverId = 43 AND results.rank = (SELECT MIN(results.rank) FROM results WHERE results.driverId = 43 AND results.raceId = races.raceId)	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T2.name = "Spanish Grand Prix"	formula_1
SELECT DISTINCT year FROM results WHERE driverId = 44	formula_1
SELECT positionOrder FROM results WHERE raceId = 1 AND year = 2008 AND driverId = 44	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 1 AND T1.year = 2008 AND T1.grid = 4	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE time <> "null" AND raceId = 1	formula_1
SELECT MAX(T2.fastestLap) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.name = "2008 Australian Grand Prix" AND T3.forename = "Lewis" AND T3.surname = "Hamilton"	formula_1
SELECT results.time FROM results WHERE results.rank = 2 AND results.raceId = 1 AND results.year = 2008	formula_1
SELECT T2.name, T2.url FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 1 AND T1.year = 2008 AND T1.time LIKE '%HH:MM:SS.mmm%'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'American' AND date LIKE '%2008%'	formula_1
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = '2008 Australian Grand Prix' AND T2.time LIKE '%finished the race%' AND T1.nationality = 'Formula_1'	formula_1
SELECT SUM(points) FROM results WHERE driverId = 44	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE driverId = 44 AND raceId IN (SELECT raceId FROM races WHERE name LIKE '%Formula_1%')	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 1 AND time IS NOT NULL	formula_1
SELECT (SELECT MAX(time) FROM results WHERE raceId = 1 AND year = 2008) - (SELECT MAX(time) FROM results WHERE raceId = 1 AND year = 2008 AND rank = (SELECT MAX(rank) FROM results WHERE raceId = 1 AND year = 2008)) * 100 / (SELECT MAX(time) FROM results WHERE raceId = 1 AND year = 2008)	formula_1
SELECT COUNT(*) FROM circuits WHERE country = "Australia" AND location = "Melbourne";	formula_1
SELECT location FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > 1980;	formula_1
SELECT AVG(points) FROM constructors WHERE nationality = "British"	formula_1
SELECT * FROM constructorStandings ORDER BY points DESC LIMIT 1	formula_1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0	formula_1
SELECT COUNT(*) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Japanese" AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(*) = 2	formula_1
SELECT DISTINCT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1	formula_1
SELECT COUNT(*) FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "French" AND T2.number > 50	formula_1
SELECT COUNT(DISTINCT results.driverId) AS "Number of Drivers", results.year AS "Year", results.time AS "Time", results.points AS "Points", results.rank AS "Rank", results.fastestLapTime AS "Fastest Lap Time", results.fastestLapSpeed AS "Fastest Lap Speed", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS "Milliseconds", results.statusId AS "Status ID", results.laps AS "Laps", results.time AS "Time", results.milliseconds AS	formula_1
SELECT year, AVG(TIMEDIFF(finished_time, start_time)) AS average_time FROM results WHERE NOT finished_time IS NULL GROUP BY year	formula_1
SELECT forename, surname FROM drivers WHERE year(dob) > 1975 AND rank = 2;	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Italian" AND T2.time IS NULL;	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapTime LIMIT 1	formula_1
SELECT MAX(T2.fastestLap) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = "Spanish Grand Prix"	formula_1
SELECT races.name, races.year FROM races JOIN results ON races.raceId = results.raceId WHERE results.milliseconds IS NOT NULL ORDER BY results.milliseconds LIMIT 1;	formula_1
SELECT AVG(percentage) FROM results WHERE year BETWEEN 2000 AND 2005 AND laps > 50 AND (year(dob) < 1985 OR year(dob) = 1985)	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "French" AND T2.milliseconds < 02000000	formula_1
SELECT * FROM drivers WHERE nationality = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Netherlandic' AND year(dob) = (SELECT MAX(year(dob)) FROM drivers)	formula_1
SELECT driverRef FROM drivers WHERE forename = "Robert" AND surname = "Kubica";	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Australian' AND year(dob) = 1980;	formula_1
SELECT * FROM drivers WHERE nationality = 'German' AND year(dob) BETWEEN 1980 AND 1990 ORDER BY MIN(time) LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY year(dob) LIMIT 1;	formula_1
SELECT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob LIKE "1971%" AND T2.fastestLapTime = (SELECT MAX(fastestLapTime) FROM results)	formula_1
SELECT * FROM drivers WHERE nationality = 'Spanish' AND year(dob) < 1982 ORDER BY MAX(time) DESC LIMIT 10;	formula_1
SELECT year FROM results ORDER BY fastestLapTime LIMIT 1	formula_1
SELECT year FROM lapTimes GROUP BY year ORDER BY AVG(milliseconds) DESC LIMIT 1;	formula_1
SELECT T1.driverId, MIN(T2.time) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.laps = 1 GROUP BY T1.driverId ORDER BY MIN(T2.time) DESC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NULL	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Austria' AND location LIKE '%A%' AND lat > 48.2 AND lng > 16.2	formula_1
SELECT MAX(number) FROM results	formula_1
SELECT drivers.nationality, drivers.dob FROM drivers INNER JOIN results ON drivers.driverId = results.driverId INNER JOIN races ON results.raceId = races.raceId WHERE races.raceId = 23 AND results.q2 IS NOT NULL;	formula_1
SELECT T1.name, T1.date, T1.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = "Max" AND T3.surname = "Verstappen" AND T1.year = 2015 ORDER BY T3.dob DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "American" AND T2.statusId = 2;	formula_1
SELECT MAX(t.points) AS max_points, t.constructorId AS constructor_id, t.constructorRef AS constructor_ref, t.nationality, t.url FROM constructorStandings AS t WHERE t.nationality = 'Italian' AND t.constructorId IN (SELECT MAX(c.constructorId) FROM constructors AS c) GROUP BY t.constructorId, t.constructorRef, t.nationality, t.url ORDER BY max_points DESC	formula_1
SELECT constructors.url FROM constructors WHERE constructors.constructorId = (SELECT MAX(constructors.constructorId) FROM constructors)	formula_1
SELECT MAX(T2.time) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 3	formula_1
SELECT races.name, MIN(milliseconds) FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId WHERE lap = 1 GROUP BY races.name	formula_1
SELECT AVG(fastestLapTime) FROM results WHERE raceId = 2 AND year = 2006 AND rank < 11	formula_1
SELECT T1.forename, T1.surname, AVG(T2.duration) AS avg_duration, COUNT(T2.duration) AS count, MAX(T2.duration) AS max_duration, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX(T2.milliseconds) AS max_milliseconds, MAX(T2.stop) AS max_stop, MAX(T2.lap) AS max_lap, MAX(T2.time) AS max_time, MAX	formula_1
SELECT T2.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = "Canadian Grand Prix" AND YEAR(T1.year) = 2008 ORDER BY T1.rank LIMIT 1	formula_1
SELECT MAX(T2.time), T1.constructorRef, T1.url FROM constructorStandings AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 2009 AND T2.position = 1	formula_1
SELECT forename, surname, dob FROM drivers WHERE year(dob) BETWEEN '1981' AND '1991' AND nationality = 'Austrian'	formula_1
SELECT forename, surname, nationality, dob, year(dob) FROM drivers WHERE nationality = 'German' AND year(dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = "Hungaroring"	formula_1
SELECT MAX(T2.points) AS score, T2.name, T2.nationality FROM results AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = (SELECT MAX(raceId) FROM races WHERE year BETWEEN 1980 AND 2010) GROUP BY T2.name, T2.nationality	formula_1
SELECT AVG(T2.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = (SELECT races.raceId FROM races WHERE races.name = "Turkish Grand Prix") AND T2.forename = "Lewis" AND T2.surname = "Hamilton";	formula_1
SELECT AVG(year) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31'	formula_1
SELECT MAX(nationality) FROM drivers	formula_1
SELECT COUNT(*) FROM results WHERE points = (SELECT MAX(points) FROM results WHERE rank = 91)	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT T2.name, T2.location, T2.country FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date = (SELECT MAX(date) FROM results)	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = (SELECT MIN(raceId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008) AND T1.position = 1	formula_1
SELECT forename, surname, nationality, name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = (SELECT MAX(raceId) FROM results)	formula_1
SELECT COUNT(*) FROM results WHERE results.driverId = (SELECT MAX(results.driverId) FROM results WHERE results.raceId = (SELECT races.raceId FROM races WHERE races.name = 'Canadian Grand Prix')) AND results.statusId = 3	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.dob = (SELECT MIN(dob) FROM drivers) AND T2.year = 2015	formula_1
SELECT MAX(duration) FROM pitStops	formula_1
SELECT MAX(time) FROM lapTimes	formula_1
SELECT MAX(duration) FROM pitStops WHERE driverId = 44	formula_1
SELECT lap FROM pitStops WHERE raceId = 1 AND driverId = 1 AND stop = 1	formula_1
SELECT drivers.driverId, drivers.surname, drivers.forename, pitStops.time FROM pitStops JOIN results ON pitStops.raceId = results.raceId JOIN drivers ON pitStops.driverId = drivers.driverId WHERE results.year = 2011 AND results.raceId = 1	formula_1
SELECT MIN(milliseconds) FROM lapTimes WHERE raceId IN (SELECT races.raceId FROM races JOIN results ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton')	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT T2.position FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.driverId = 44 AND T1.constructorId = 13 AND T1.points = (SELECT MIN(T1.points) FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.driverId = 44 AND T1.constructorId = 13)	formula_1
SELECT MAX(milliseconds) FROM lapTimes WHERE raceId = 4	formula_1
SELECT c.name, c.location, MIN(t.milliseconds) AS fastest_milliseconds FROM circuits c JOIN lapTimes t ON c.circuitId = t.circuitId WHERE c.country = 'Italy' GROUP BY c.name, c.location	formula_1
SELECT races.name FROM circuits, races WHERE circuits.name = 'Austrian Grand Prix Circuit' AND races.circuitId = circuits.circuitId AND races.year = (SELECT MAX(year) FROM races WHERE races.circuitId = circuits.circuitId)	formula_1
SELECT MAX(T2.duration) FROM results AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId = (SELECT MAX(T1.driverId) FROM results AS T1 JOIN circuits AS T2 ON T1.raceId = T2.circuitId WHERE T2.name = 'Austrian Grand Prix Circuit')	formula_1
SELECT DISTINCT T1.location FROM circuits AS T1 JOIN lapTimes AS T2 ON T1.circuitId = T2.circuitId WHERE T2.time = '1:29.488'	formula_1
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = 44	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE date = (SELECT MIN(date) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating > = 60 AND overall_rating < 65 AND defensive_work_rate = 'low';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)	european_football_2
SELECT league_id, MAX(SUM(home_team_goal, away_team_goal)) AS goals FROM Match WHERE season = '2015/2016' GROUP BY league_id ORDER BY goals DESC	european_football_2
SELECT home_team_api_id, COUNT(*) AS home_team_lost FROM Match WHERE season = '2015/2016' AND home_team_api_id IN (SELECT home_team_api_id FROM Team) AND away_team_api_id IN (SELECT away_team_api_id FROM Team) GROUP BY home_team_api_id ORDER BY COUNT(*) LIMIT 1;	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'T1.player_name' GROUP BY T1.player_api_id ORDER BY MAX(T2.penalties) DESC LIMIT 10;	european_football_2
SELECT MAX(SUBTRACT(T2.away_team_goal, T2.home_team_goal) > 0) FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Scotland Premier League' AND T2.season = '2009/2010';	european_football_2
SELECT T1.team_api_id, T1.team_fifa_api_id, MAX(T2.buildUpPlaySpeed) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id GROUP BY T1.team_api_id ORDER BY MAX(T2.buildUpPlaySpeed) DESC LIMIT 4;	european_football_2
SELECT T2.name FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(T1.home_team_goal = T1.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT * FROM Player_Attributes WHERE date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00' AND sprint_speed > = 97; SELECT * FROM Player_Attributes WHERE date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00' AND sprint_speed > = 97;	european_football_2
SELECT League.name, MAX(COUNT(league_id)) FROM League INNER JOIN Match ON League.id = Match.league_id GROUP BY League.id ORDER BY MAX(COUNT(league_id)) DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday > '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '%2010%' GROUP BY player_api_id HAVING AVG(overall_rating) > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '%2010%') ORDER BY AVG(overall_rating) DESC LIMIT 10	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012')	european_football_2
SELECT DIVIDE(MULTIPLY((SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND date BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00'), 1.0), (SELECT COUNT(*) FROM Player_Attributes WHERE date BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00')); SELECT DIVIDE(MULTIPLY((SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND date BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00'), 1.0), (SELECT COUNT(*) FROM Player_Attributes WHERE date BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00'));	european_football_2
SELECT League.name, COUNT(*) AS goals_made FROM League JOIN Match ON League.id = Match.league_id GROUP BY League.id ORDER BY goals_made DESC LIMIT 5;	european_football_2
SELECT AVG(long_shots) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY average_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date > '2014-01-01 00:00:00' AND T2.date < '2014-01-31 00:00:00' GROUP BY T1.team_api_id HAVING AVG(T2.chanceCreationPassing) < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date > '2014-01-01 00:00:00' AND date < '2014-01-31 00:00:00') ORDER BY chanceCreationPassing DESC;	european_football_2
SELECT League.name FROM League, Match WHERE League.season = '2009/2010' AND Match.league_id = League.id AND Match.home_team_api_id = Team.team_api_id AND Match.away_team_api_id = Team.team_api_id AND Team.team_name = 'home' GROUP BY League.name HAVING AVG(home_team_goal) > AVG(away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT * FROM Player WHERE year = '1970' AND month = '10';	european_football_2
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Franco Zennaro"	european_football_2
SELECT AVG(buildUpPlayPositioningClass) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag';	european_football_2
SELECT Player_Attributes.finishing FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Francois Affolter' AND Player_Attributes.date = '2014-09-18 00:00:00';	european_football_2
SELECT SUM(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id JOIN Player AS T3 ON T1.player_api_id = T3.player_api_id WHERE T3.player_name = 'Gabriel Tamas' AND T1.date = '2011';	european_football_2
SELECT COUNT(*) FROM Match WHERE season LIKE '%2015/2016%' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League');	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE date = (SELECT MAX(date) FROM Player_Attributes);	european_football_2
SELECT player_api_id, MAX(potential) FROM Player_Attributes GROUP BY player_api_id;	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT DISTINCT T1.defensive_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "David Wilson"	european_football_2
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = "Netherlands";	european_football_2
SELECT AVG(home_team_goal) FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Poland') AND season = '2010/2011';	european_football_2
SELECT T1.player_name, AVG(T1.finishing) AS average_finishing_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_name ORDER BY average_finishing_rate DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE weight > 170 AND player_name LIKE 'Adam%';	european_football_2
SELECT player_name FROM Player_Attributes WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010';	european_football_2
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Doran'	european_football_2
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left';	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = "CLB";	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE date BETWEEN '2010-01-01' AND '2015-12-31' AND height > 170;	european_football_2
SELECT player_api_id, player_name, height FROM Player ORDER BY height LIMIT 1;	european_football_2
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A';	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = 218353;	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND date BETWEEN strftime('%Y-%m', date) AND '2008-10';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10	european_football_2
SELECT player_api_id, MAX(balance) AS highest_balance, MAX(potential) AS highest_potential FROM Player_Attributes WHERE potential = 61 GROUP BY player_api_id ORDER BY highest_balance DESC	european_football_2
SELECT difference FROM (SELECT AVG(ball_control) FROM Player WHERE player_name = 'Abdou Diallo') AS T1, (SELECT AVG(ball_control) FROM Player WHERE player_name = 'Aaron Appindangoye') AS T2;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY birthday LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League';	european_football_2
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany';	european_football_2
SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes WHERE overall_rating IS NOT NULL GROUP BY player_api_id; SELECT player_api_id, MAX(overall_rating) FROM Player_	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating > 80 AND defensive_work_rate = 'high' AND players.player_api_id IN (SELECT players.player_api_id FROM players WHERE strftime('%Y', birthday)<'1986');	european_football_2
SELECT player_api_id, MAX(crossing) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone')) GROUP BY player_api_id ORDER BY MAX(crossing) DESC LIMIT 1;	european_football_2
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Ariel Borysiuk"	european_football_2
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70;	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/09' AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT MAX(T1.long_passing) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.birthday = (SELECT MAX(birthday) FROM Player);	european_football_2
SELECT COUNT(*) FROM Match WHERE League.name = 'Belgium Jupiler League' AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04';	european_football_2
SELECT league_id FROM Match WHERE season = '2008/2009' GROUP BY league_id ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE birthday < '1986';	european_football_2
SELECT (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel') * 100 / (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel')	european_football_2
SELECT AVG(buildUpPlaySpeed) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(T2.crossing) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing) AS score, chanceCreationPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax'	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(T2.away_team_goal) FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'Parma' AND T2.country_id = (SELECT Country_ID FROM Country WHERE Country_Name = 'Italy')	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date = '2016-06-23' ORDER BY T1.birthday LIMIT 1	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE date = '2016-02-04 00:00:00' AND player_name = 'Aaron Mooy';	european_football_2
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00';	european_football_2
SELECT T1.player_api_id, T1.player_name, T1.player_fifa_api_id, T1.date, T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date = '2015-05-01 00:00:00';	european_football_2
SELECT Player_Attributes.defensive_work_rate FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Kevin Berigaud' AND Player_Attributes.date = '2013-02-22 00:00:00';	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant')	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_long_name = 'Willem II' AND T1.date = '2012-02-22 00:00:00'	european_football_2
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_long_name = 'FC Lorient') AND date = '2010-02-22'	european_football_2
SELECT chanceCreationPassingClass FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_long_name = 'PEC Zwolle') AND date = '2013-09-20 00:00:00'	european_football_2
SELECT T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_long_name = 'Hull City' AND T1.date = '2010-02-22 00:00:00';	european_football_2
SELECT T2.defenceAggressionClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date = '2015-09-10 00:00:00';	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Marko Arnautovic') AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';	european_football_2
SELECT (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan') AS player_api_id, (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery') AS player_api_id, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating_higher, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating_lower, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating_higher_percentage, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating_lower_percentage FROM Player WHERE date = '2013-07-12' AND player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE date = '2013-07-12' AND player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AND player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery') ORDER BY overall_rating DESC LIMIT 1; SELECT (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating FROM Player WHERE date = '2013-07-12'; SELECT (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Don	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE birthday < datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday) > 34	european_football_2
SELECT SUM(T1.home_team_goal) FROM Match AS T1 JOIN Player AS T2 ON T1.home_team_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennon'	european_football_2
SELECT SUM(T2.away_team_goal) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.home_player_api_id WHERE T1.player_name = 'Daan Smith' OR T1.player_name = 'Filipe Ferreira'	european_football_2
SELECT SUM(home_team_goal) FROM Match WHERE age < 30	european_football_2
SELECT player_name FROM Player ORDER BY overall_rating DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player ORDER BY potential DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'high'	european_football_2
SELECT player_name FROM Player WHERE finishing = 1 ORDER BY age DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE country_api_id IN (SELECT id FROM Country WHERE name = 'Belgium')	european_football_2
SELECT T1.name, T1.vision, T1.country_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.vision > 89	european_football_2
SELECT country_id, AVG(weight) FROM Player GROUP BY country_id ORDER BY AVG(weight) DESC LIMIT 1;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T1.height) FROM Player AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_name = 'Italy';	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990';	european_football_2
SELECT (SELECT jumping FROM Player WHERE id = 6) - (SELECT jumping FROM Player WHERE id = 23)	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' AND potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') LIMIT 3; SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' AND potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left');	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE strength > 80 AND stamina > 80	european_football_2
SELECT country_id FROM Match WHERE league_id = 101	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date = '2008-09-24%' AND league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Belgian')) AND home_team_api_id IN (SELECT id FROM Team WHERE team_api_id IN (SELECT id FROM Team WHERE team_fifa_api_id IN (SELECT id FROM Team_Attributes WHERE team_fifa_api_id = 1))) AND away_team_api_id IN (SELECT id FROM Team WHERE team_api_id IN (SELECT id FROM Team WHERE team_fifa_api_id IN (SELECT id FROM Team_Attributes WHERE team_fifa_api_id = 1)))	european_football_2
SELECT Player_Attributes.sprint_speed, Player_Attributes.agility, Player_Attributes.acceleration FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Alexis Blin'	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A')	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Netherlands'))	european_football_2
SELECT T1.finishing, T1.curve FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight = (SELECT MAX(weight) FROM Player)	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.date = '2015/2016' GROUP BY T1.team_long_name ORDER BY COUNT(T1.team_api_id) DESC LIMIT 1;	european_football_2
SELECT T2.team_long_name FROM Match AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id GROUP BY T1.away_team_api_id ORDER BY SUM(T1.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT player_api_id, player_name, overall_rating, MAX(overall_rating) FROM Player_Attributes JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id GROUP BY player_api_id, player_name ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT AVG(percentage) FROM (SELECT DIVIDE(COUNT(*),COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END)) AS percentage FROM Player_Attributes WHERE overall_rating > 70) AS T	european_football_2
SELECT (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') - (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-')	thrombosis_prediction
SELECT (SELECT COUNT(ID) FROM Patient WHERE year(Birthday) > '1930' AND SEX = 'F') / (SELECT COUNT(ID) FROM Patient WHERE SEX = 'F')	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31' AND Admission = '+'	thrombosis_prediction
SELECT (SELECT COUNT(ID) FROM Examination WHERE Diagnosis = 'SLE' AND Admission = '+') / (SELECT COUNT(ID) FROM Examination WHERE Diagnosis = 'SLE' AND Admission = '-')	thrombosis_prediction
SELECT Examination.Diagnosis, Laboratory.Date FROM Examination INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.ID = 30609	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday, Examination.Examination_Date, Examination.Symptoms FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.ID = 163109	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT Patient.ID, Patient.Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RVVT = '+'	thrombosis_prediction
SELECT ID, SEX, Diagnosis FROM Patient WHERE Thrombosis > 2;	thrombosis_prediction
SELECT * FROM Patient WHERE YEAR(Birthday) = '1937' AND `T-CHO` > = 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALB < 3.5;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE (SEX = 'F' AND TP < '6.0' OR TP > '8.5')	thrombosis_prediction
SELECT AVG(aCL IgG) FROM Examination WHERE Admission = '+' AND SUBTRACT(year(CURRENT_TIMESTAMP), year(Birthday)) >= 50	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND year(Description) = '1997' AND Admission = '-'	thrombosis_prediction
SELECT MIN(age) FROM Patient WHERE NOT `First Date` IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE YEAR(Examination.Examination_Date) = 1997 AND Examination.Thrombosis = 1 AND Examination.Sex = 'F';	thrombosis_prediction
SELECT MAX(year(Birthday)) - MIN(year(Birthday)) FROM Patient WHERE NOT TG IS NULL;	thrombosis_prediction
SELECT T1.Symptoms, T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID ORDER BY T2.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(COUNT(ID)) FROM Patient WHERE SEX = 'M' AND Date BETWEEN '1998-01-01' AND '1998-12-31' AND NOT Date IS NULL	thrombosis_prediction
SELECT MAX(Laboratory.Date), MAX(Patient.Birthday) - (YEAR(Patient.Birthday) - YEAR(Laboratory.Date)) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Diagnosis = 'SJS'	thrombosis_prediction
SELECT (SELECT SUM(UA <= '8.0' and SEX = 'M') FROM Laboratory) / (SELECT SUM(UA <= '6.5' and SEX = 'F') FROM Laboratory)	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient LEFT JOIN Examination ON Patient.ID = Examination.ID WHERE NOT Examination.ID IS NULL AND YEAR(Patient.First_Date) - YEAR(Examination.Examination_Date) >= 1	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE YEAR(Birthday) < 18 AND `Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND `T-BIL` > 2.0	thrombosis_prediction
SELECT MAX(COUNT(Diagnosis)) FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT AVG(SUBTRACT('1999', year(Birthday))) FROM Patient WHERE NOT Birthday IS NULL AND MONTH(Birthday) = 10 AND YEAR(Birthday) = 1991	thrombosis_prediction
SELECT T1.Birthday, T1.Description, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.HGB = (SELECT MAX(HGB) FROM Examination)	thrombosis_prediction
SELECT `aCL IgA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Examination.ID = 2927464 AND Examination.TG < 250 AND Examination.Date = '1995-09-04'	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY 'First Date' LIMIT 1;	thrombosis_prediction
SELECT aCL IgM FROM Examination WHERE Patient.ID = (SELECT Patient.ID FROM Patient WHERE Patient.Description = '1994-02-19') AND Examination.Description = '1993/11/12'	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT = '9' AND Laboratory.Date = '1992-06-12'	thrombosis_prediction
SELECT SUBTRACT('1992', year(Birthday)) FROM Patient WHERE Patient.ID IN (SELECT Laboratory.ID FROM Laboratory WHERE Laboratory.UA = '8.4' AND Laboratory.Date = '1991-10-21');	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SJS' AND Patient.First_Date = '1991-06-13' AND NOT Patient.First_Date IS NULL AND STRFTIME('%y', Laboratory.Date) = '1995'	thrombosis_prediction
SELECT patient.diagnosis FROM patient JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'SLE' AND examination.examination_date = '1997-01-27' AND NOT patient.diagnosis IS NULL ORDER BY patient.first_date LIMIT 1	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE `Examination Date` = '1993-09-27' AND Patient.Birthday = '1959-03-01'	thrombosis_prediction
SELECT (SELECT SUM(Laboratory.T-CHO) FROM Laboratory WHERE Laboratory.Date BETWEEN '1981-11-01' AND '1981-11-30' AND Laboratory.Date BETWEEN '1981-12-01' AND '1981-12-31') - (SELECT SUM(Laboratory.T-CHO) FROM Laboratory WHERE Laboratory.Date BETWEEN '1981-11-01' AND '1981-11-30' AND Laboratory.Date BETWEEN '1981-12-01' AND '1981-12-31')	thrombosis_prediction
SELECT * FROM Patient WHERE Diagnosis = 'Behcet' INTERSECT SELECT * FROM Examination WHERE YEAR(Description) > = '1997-1-1' AND YEAR(Description) < '1998-1-1'	thrombosis_prediction
SELECT * FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4 ORDER BY ID	thrombosis_prediction
SELECT ID, SEX, Birthday, Admission, COUNT(*) FROM Patient WHERE YEAR(Birthday) = 1964 AND SEX = 'F' GROUP BY ID, SEX, Birthday, Admission;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis > 2 AND ANA = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) FROM Examination)	thrombosis_prediction
SELECT AVG(UA < = 6.5) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30;	thrombosis_prediction
SELECT AVG(CASE WHEN SEX = 'M' AND YEAR(`FIRST DATE`) = '1981' THEN (SELECT COUNT(*) FROM Patient WHERE YEAR(`FIRST DATE`) = '1981' AND SEX = 'M') * (SELECT COUNT(*) FROM Examination WHERE YEAR(`FIRST DATE`) = '1981' AND SEX = 'M' AND Diagnosis = 'BEHCET') / (SELECT COUNT(*) FROM Patient WHERE YEAR(`FIRST DATE`) = '1981' AND SEX = 'M') END) FROM Examination WHERE YEAR(`FIRST DATE`) = '1981' AND Diagnosis = 'BEHCET';	thrombosis_prediction
SELECT * FROM Patient WHERE Admission = '-' AND Date LIKE '1991-10%' AND T-BIL < 2.0	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE ANA_PATTERN != 'p' AND BIRTHDAY BETWEEN 1980 AND 1989	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'PSS' AND Laboratory.CRP > 2 AND Laboratory.CRE = 1 AND Laboratory.LDH = 123	thrombosis_prediction
SELECT AVG(ALB) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.PLT > 400 AND T2.Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(symptoms) FROM Examination WHERE diagnosis = 'SLE';	thrombosis_prediction
SELECT Patient.Description, Patient.Diagnosis FROM Patient WHERE Patient.ID = 48473 ORDER BY Patient.Description LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE YEAR(DATE) = '1997' AND (tp > 6 AND tp < 8.5)	thrombosis_prediction
SELECT AVG(CASE WHEN Thrombosis IS NULL THEN 0 ELSE 1 END) FROM Examination WHERE Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT COUNT(SEX) FROM Patient WHERE YEAR(BIRTHDAY) = '1980' AND diagnosis = 'RA' AND SEX = 'F'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE SEX = 'M' AND `Examination Date` BETWEEN '1995' AND '1997' AND Diagnosis = 'BEHCET' AND Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(Examination Date, First Date) FROM Examination WHERE Examination.ID = 821298	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Examination.ID = 57266 AND (Examination.UA > 8.0 AND Examination.SEX = 'M') OR (Examination.UA > 6.5 AND Examination.SEX = 'F');	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID IN (SELECT Patient.ID FROM Patient WHERE Patient.ID = 48473) AND GOT > 60	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND YEAR(Laboratory.Date) = 1994	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'M' AND GPT > 60	thrombosis_prediction
SELECT * FROM Patient WHERE GPT > 60 ORDER BY Birthday DESC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT Patient.ID, Patient.Age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH >= 600 AND Laboratory.LDH <= 800;	thrombosis_prediction
SELECT * FROM Laboratory WHERE ALP < 300 AND Admission = '+'; SELECT * FROM Laboratory WHERE ALP < 300 AND Admission = '-';	thrombosis_prediction
SELECT Patient.ID FROM Patient WHERE Patient.Birthday = '1982-04-01' AND NOT Patient.ALP IS NULL AND Patient.ALP < 300	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0	thrombosis_prediction
SELECT (SELECT SUM(CASE WHEN TP > 8.5 THEN (TP - 8.5) ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F')	thrombosis_prediction
SELECT * FROM Patient WHERE SEX = 'M' AND ALB < = 3.5 OR ALB > = 5.5 ORDER BY Birthday DESC	thrombosis_prediction
SELECT * FROM Patient WHERE YEAR(Birthday) = '1982' AND (ALB >= 3.5 AND ALB <= 5.5);	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE Sex = 'F' AND UA > 8.0 OR Sex = 'F' AND UA > 6.5;	thrombosis_prediction
SELECT AVG(UA) FROM Laboratory WHERE UA < 8.0 AND SEX = 'M' OR UA < 6.5 AND SEX = 'F' AND NOT UA IS NULL ORDER BY Date DESC LIMIT 1;	thrombosis_prediction
SELECT ID, SEX, Birthday FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE UN = 29)	thrombosis_prediction
SELECT ID, SEX, Birthday FROM Patient WHERE Diagnosis = 'RA' AND UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT CRE IS NULL AND CRE > 1.5;	thrombosis_prediction
SELECT ( (SELECT SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) FROM Patient WHERE NOT CRE IS NULL AND CRE > 1.5) > (SELECT SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) FROM Patient WHERE NOT CRE IS NULL AND CRE > 1.5) ) True	thrombosis_prediction
SELECT MAX(T-BIL) FROM Laboratory	thrombosis_prediction
SELECT Sex, SUM(T-BIL) FROM Laboratory WHERE T-BIL > = 2.0 GROUP BY Sex;	thrombosis_prediction
SELECT patient_id, T-CHO FROM Laboratory ORDER BY T-CHO DESC LIMIT 1; SELECT patient_id, T-CHO FROM Laboratory ORDER BY T-CHO DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(DISTINCT T1.Birthday) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.T-CHO > = 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 100;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'male' AND T2.TG > 200 AND T1.Birthday < CURRENT_DATE AND T1.Birthday >= '1960-01-01';	thrombosis_prediction
SELECT DISTINCT ID FROM Examination WHERE ANA < 16 AND KCT = 'outpatient' AND CPK < 250	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Birthday BETWEEN '1936' AND '1956' AND SEX = 'M' AND NOT CPK IS NULL AND CPK > 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.AGE FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'female' AND Patient.AGE >= 18 AND Laboratory.GLU > 180 AND Laboratory.T-CHO < 250;	thrombosis_prediction
SELECT Patient.ID, Laboratory.GLU FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Description) > = 1991 AND Laboratory.GLU < 180;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, COUNT(Patient.ID) AS c1 FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.WBC < 3.5 OR Laboratory.WBC > 9.0 GROUP BY Patient.SEX ORDER BY Patient.Birthday;	thrombosis_prediction
SELECT patient.ID, patient.Age, patient.Diagnosis FROM patient WHERE patient.RBC < 3.5;	thrombosis_prediction
SELECT * FROM Patient WHERE Sex = 'F' AND age(Birthday) >= 50 AND (RBC < 3.5 OR RBC > 6.0) AND Admission = '+'	thrombosis_prediction
SELECT ID, SEX FROM Patient WHERE Admission = '-' AND HBG < 10;	thrombosis_prediction
SELECT ID, SEX FROM Patient WHERE Diagnosis = 'SLE' AND HGB < 10 AND HGB > 17 ORDER BY Birthday LIMIT 1;	thrombosis_prediction
SELECT patient.ID, patient.Age FROM Patient JOIN Laboratory ON patient.ID = Laboratory.ID WHERE patient.Age > (SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(patient.Birthday) FROM Patient WHERE patient.ID = Laboratory.ID) AND Laboratory.HCT >= 52 GROUP BY patient.ID HAVING COUNT(*) > 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE PLT < 100 - (SELECT COUNT(*) FROM Laboratory WHERE PLT > 400);	thrombosis_prediction
SELECT * FROM Patient WHERE YEAR(CURRENT_TIMESTAMP) = 1984 AND SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(Birthday)) < 50 AND PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT AVG(percentage) FROM (SELECT SUM(CASE WHEN PT > = 14 AND SEX = 'F' THEN 1 ELSE 0 END) AS percentage FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Patient.AGE > 55) AS t	thrombosis_prediction
SELECT * FROM Patient WHERE `First Date` > 1992 AND PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE APTT > 45 AND Thrombosis = 3	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND WBC BETWEEN 3.5 AND 9.0 AND FG < = 150 OR FG > = 450	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND Laboratory.FG < 150 OR Laboratory.FG > 450;	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.U-PRO > 30;	thrombosis_prediction
SELECT patient_id FROM Patient WHERE NOT `U-PRO` IS NULL AND `U-PRO` < 30 AND Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` < 900 AND Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `aCL IgA` = (SELECT MAX(aCL IgA) FROM Examination WHERE `aCL IgA` BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE YEAR(`First Date`) > = 1990 AND IGA BETWEEN 80 AND 500;	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `aCL IgM` < 40 OR `aCL IgM` > 400 GROUP BY Diagnosis ORDER BY MAX(COUNT(Diagnosis)) DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE NOT Description IS NULL; SELECT COUNT(*) FROM Patient WHERE NOT Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Patient.Birthday IS NULL AND Laboratory.CRP > 1.0 AND YEAR(CURDATE()) - YEAR(Patient.Birthday) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE RVVT = '+-' AND KCT = '+';	thrombosis_prediction
SELECT Disease FROM Examination WHERE YEAR(Birthday) > = 1995 AND RA = '-' OR RA = '+-';	thrombosis_prediction
SELECT Patient.ID FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Patient.Birthday < CURDATE() - INTERVAL 1 YEAR AND Laboratory.RF < 20;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE RF < 20 AND Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM (SELECT Patient.ID, Examination.ANA_Pattern, Examination.Examination_Date FROM Examination JOIN Patient ON Examination.Patient_ID = Patient.ID WHERE Examination.aCL_IgG > 35 AND Examination.aCL_IgM > 35 AND Examination.ANA_Pattern = 'P') AS t1	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.HCT < 29 OR Examination.HCT > 52 AND Examination.ANA = 'N' AND Examination.aCL IgA = (SELECT MAX(Examination.aCL IgA) FROM Examination WHERE Examination.HCT < 29 OR Examination.HCT > 52 AND Examination.ANA = 'N')	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Diagnosis = 'APS' AND Examination.C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '+' AND Laboratory.RNP = '-'	thrombosis_prediction
SELECT Birthday FROM Patient WHERE RNP <> '-' ORDER BY Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE SM = 'negative' AND Thrombosis = '1';	thrombosis_prediction
SELECT ID FROM Patient WHERE NOT SEX IS NULL AND Birthday IS NULL ORDER BY Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Examination_Date > '1997-01-01' AND Examination.SC170 = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM (SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Examination.Thrombosis, Examination.Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.aCL_IgG = 0 AND Examination.aCL_IgM = 0 AND Examination.ANA = 0 AND Examination.Thrombosis = 0 AND Examination.Symptoms = 'vertigo') AS t1 WHERE t1.SEX = 'M';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE NOT Patient.Description IS NULL AND Patient.First Date < 1990	thrombosis_prediction
SELECT Patient.ID FROM Patient WHERE NOT Patient.Description IS NULL ORDER BY Patient.First Date LIMIT 1; SELECT Patient.ID FROM Patient WHERE NOT Patient.Description IS NULL ORDER BY Patient.First Date LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN('-', '+-') AND Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN('-', '+-') AND Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND CENTROMEA IN('-', '+-') AND SSB IN('-', '+-');	thrombosis_prediction
SELECT DISTINCT Diagnosis FROM Examination WHERE `DNA-II` > 8;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE NOT Description IS NULL AND NOT DNA IS NULL AND DNA < 8	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA_II < 8 AND T1.Admission = '+'	thrombosis_prediction
SELECT MULTIPLY(DIVIDE(COUNT(ID WHERE GOT > = 60 AND Diagnosis = 'SLE'), COUNT(ID WHERE GOT > = 60)), 1.0) FROM Laboratory WHERE GOT > = 60 AND Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT GOT < 60;	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient WHERE NOT GOT > = 60;	thrombosis_prediction
SELECT TOP 3 Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT < 60 ORDER BY Patient.Birthday DESC	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT GOT < 60;	thrombosis_prediction
SELECT MIN(Patient.First Date) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'male' AND Laboratory.LDH < 500;	thrombosis_prediction
SELECT MAX(Patient.First_Date) FROM Patient WHERE Patient.ID IN (SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.Patient_ID WHERE Laboratory.LDH > = 500);	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND ALP > = 300;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.ALP < 300;	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.TP < 6.0	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'SJS' AND TP > 6.0 AND TP < 8.5;	thrombosis_prediction
SELECT MAX(ALB > 3.5 and ALB < 5.5) AS Examination_Date FROM Examination	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND (ALB > 3.5 AND ALB < 5.5) AND (TP > 6.0 AND TP < 8.5);	thrombosis_prediction
SELECT MAX(UA) FROM Laboratory WHERE Sex = 'F' AND UA > 6.50; SELECT MAX(UA) FROM Laboratory WHERE Sex = 'F' AND UA > 6.50;	thrombosis_prediction
SELECT MAX(ANA) FROM Examination WHERE CRE < 1.5;	thrombosis_prediction
SELECT Patient.ID, MAX(Laboratory.aCL IgA) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5 GROUP BY Patient.ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `T-BIL` > = 2.0 AND ANA Pattern = 'P';	thrombosis_prediction
SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0 SELECT MAX(aCL IgA) FROM Examination WHERE ID IN (SELECT MAX(ID) FROM Examination WHERE `T-BIL` < 2.0);	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `T-CHO` > = 250 AND KCT = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `T-CHO` < 250 AND ANA Pattern = 'P';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms <> '';	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 ORDER BY T1.TG DESC LIMIT 1	thrombosis_prediction
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+')	thrombosis_prediction
SELECT Birthday FROM Patient WHERE NOT Birthday IS NULL AND (SELECT MAX(Birthday) FROM Patient WHERE NOT Birthday IS NULL AND (SELECT MAX(GLU) FROM Laboratory WHERE NOT Date IS NULL AND (GLU > 180)) = Patient.ID) = Patient.ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE ALP < 180 AND Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Diagnosis = 'SLE' AND WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT Patient.ID FROM Patient WHERE Patient.Admission = '-' AND (RBC < = 3.5 OR RBC > = 6.0);	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE PLT > 100 AND PLT < 400 AND Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT * FROM Examination WHERE PLT > 100 AND PLT < 400 AND Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(PT) FROM Patient WHERE Sex = 'M' AND PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis > 1 AND PT < 14	thrombosis_prediction
SELECT major_name FROM major WHERE department = 'EECS' AND college = 'CSU'	student_club
SELECT COUNT(*) FROM member WHERE member.club = 'Student_Club' AND member.college = 'Engineering'	student_club
SELECT T2.first_name, T2.last_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.department = "Art and Design"	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = "Women's Soccer" AND T2.first_name = "Student" AND T2.last_name = "Club"	student_club
SELECT T2.phone FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = "Women's Soccer"	student_club
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = "Women's Soccer" AND T1.t_shirt_size = "Medium"	student_club
SELECT T1.event_name, T1.event_date, T1.type, T1.notes, T1.location, T1.status FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = (SELECT MAX(T1.event_name) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event)	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.major_id = T2.major_id WHERE T1.position = "Vice President"	student_club
SELECT T2.event_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'McLean'	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND YEAR(T1.event_date) = 2019	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND COUNT(T2.link_to_event) > 10	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Student_Club'	student_club
SELECT AVG(COUNT(DISTINCT event_id)) FROM event WHERE YEAR(event_date) = 2020	student_club
SELECT MAX(cost) FROM expense	student_club
SELECT COUNT(*) FROM major WHERE major_name = 'Environmental Engineering'	student_club
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = "Laugh Out Loud"	student_club
SELECT last_name FROM member WHERE major = 'Law and Constitutional Studies'	student_club
SELECT zip_code.county FROM zip_code JOIN member ON member.zip = zip_code.zip_code WHERE member.first_name = "Sherri" AND member.last_name = "Ramsey"	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Tyler" AND T1.last_name = "Hewitt"	student_club
SELECT amount FROM income WHERE source = 'Vice President'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed' AND event_name = 'September Meeting'	student_club
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'	student_club
SELECT first_name, last_name FROM member WHERE zip = (SELECT zip_code FROM zip_code WHERE state = 'Illinois')	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Advertisement' AND event_status = 'Closed' AND event_name = 'September Meeting'	student_club
SELECT DISTINCT department FROM major WHERE major_name = 'Computer Science'	student_club
SELECT SUM(amount) FROM budget WHERE event_status = 'Approved' AND event_name = 'October Speaker'	student_club
SELECT COUNT(*) FROM expense WHERE event_id IN (SELECT event_id FROM event WHERE event_name = 'October Meeting' AND event_date = '2019-10-08') AND approved = True	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member = 'Elijah Allen' AND MONTH(expense_date) = 9 OR MONTH(expense_date) = 10	student_club
SELECT (SELECT SUM(spent) FROM budget WHERE category = 'Student_Club' AND YEAR(event_date) = 2019) - (SELECT SUM(spent) FROM budget WHERE category = 'Student_Club' AND YEAR(event_date) = 2020)	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT cost FROM expense WHERE link_to_event = 'Posters' AND expense_date = '2019-09-14'	student_club
SELECT MAX(budget.remaining) FROM budget WHERE budget.category = 'Food'	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'	student_club
SELECT COUNT(*) FROM major WHERE department = "College of Humanities and Social Sciences"	student_club
SELECT phone FROM member WHERE first_name = "Carlo" AND last_name = "Jacobs"	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Adela" AND T1.last_name = "O'Gallagher"	student_club
SELECT COUNT(*) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0	student_club
SELECT SUM(amount) FROM budget WHERE budget.event_status = 'September Speaker'	student_club
SELECT T1.status FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'	student_club
SELECT major_name FROM major WHERE department = 'EECS' AND college = 'MU'	student_club
SELECT COUNT(*) FROM member WHERE major = "Human Development and Family Studies" AND t_shirt_size = "Large"	student_club
SELECT zip_code.type FROM zip_code JOIN member ON member.zip = zip_code.zip_code WHERE member.first_name = "Christof" AND member.last_name = "Nielson"	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT zip_code.state FROM zip_code WHERE zip_code.city = "Sacha Harrison"	student_club
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'	student_club
SELECT date_received FROM income WHERE source = 'Dues'	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (SELECT MIN(member_id) FROM income WHERE source = 'Dues')	student_club
SELECT (SELECT SUM(amount WHERE category = 'Advertisement' AND event_name = 'Yearly Kickoff') FROM budget) - (SELECT SUM(amount WHERE event_name = 'October Meeting' AND category = 'Advertisement') FROM budget)	student_club
SELECT SUM( amount ) FROM budget WHERE category = 'Parking' AND event_name = 'November Speaker'	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(*) FROM zip_code WHERE county = "Orange" AND state = "Virginia"	student_club
SELECT DISTINCT department FROM major WHERE college = 'Humanities and Social Sciences'	student_club
SELECT T2.city, T2.county, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Amy" AND T1.last_name = "Firth"	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id ORDER BY T2.remaining LIMIT 1	student_club
SELECT name FROM member WHERE member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event = 'October Meeting')	student_club
SELECT major.college FROM major GROUP BY major ORDER BY COUNT(major.college) DESC LIMIT 1	student_club
SELECT major_name FROM major WHERE zip = "809-555-3360"	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id GROUP BY T1.event_id ORDER BY SUM(T2.amount) DESC LIMIT 1;	student_club
SELECT expense_description FROM expense WHERE link_to_member = 'Vice President'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women's Soccer'	student_club
SELECT income.date_received FROM income WHERE income.member_id = 'Casey Mason'	student_club
SELECT COUNT(*) FROM zip_code WHERE state = 'Maryland'	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.phone = "954-555-6240"	student_club
SELECT first_name, last_name FROM member WHERE department = "School of Applied Sciences, Technology and Education"	student_club
SELECT event.event_name, MAX(DIVIDE(expense.spent, budget.amount)) AS spend_to_budget_ratio FROM event JOIN expense ON event.event_id = expense.link_to_event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' GROUP BY event.event_name	student_club
SELECT COUNT(*) FROM member WHERE position = 'President'	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT T2.first_name, T2.last_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.member_id HAVING COUNT(T1.link_to_event) > 7	student_club
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Community Theater' AND T2.major_name = 'Interior Design'	student_club
SELECT first_name, last_name FROM member WHERE zip = (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina')	student_club
SELECT SUM(income.amount) FROM income WHERE income.source = 'Grant Gilmour'	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (SELECT link_to_member FROM income WHERE amount > 40)	student_club
SELECT SUM(cost) FROM expense WHERE link_to_event = 'Baseball game'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN budget AS T2 ON T1.member_id = T2.link_to_member WHERE T2.event_status = 'Yearly Kickoff'	student_club
SELECT T2.first_name, T2.last_name, T1.source FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.member_id ORDER BY MAX(T1.amount) DESC LIMIT 1;	student_club
SELECT event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id ORDER BY SUM(T2.cost) LIMIT 1;	student_club
SELECT SUM(cost) FROM event WHERE event_name = 'Yearly Kickoff'	student_club
SELECT major_name, COUNT(*) AS count FROM major WHERE department = 'Finance' OR department = 'Physics' GROUP BY major_name	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.major_id = T2.major_id WHERE T2.major_name = 'Physics Teaching'	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND YEAR(T1.event_date) = 2019	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T2.first_name = "Luisa" AND T2.last_name = "Guidi"	student_club
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Advertisement' GROUP BY T1.event_id ORDER BY SUM(T2.spent) DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean' AND T1.event_name = 'Women''s Soccer'	student_club
SELECT SUM(type = 'Community Service') FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31' AND event_name = 'Student_Club'	student_club
SELECT expense_cost FROM expense WHERE expense_description = 'Posters' AND link_to_event = 'September Speaker'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T1.status = 'Closed' AND T2.remaining < 0 GROUP BY T1.event_name ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT SUM(t1.cost) FROM expense AS t1 JOIN event AS t2 ON t1.link_to_event = t2.event_id WHERE t2.event_name = 'October Meeting' AND t1.approved = 'Yes';	student_club
SELECT category, SUM(amount) FROM budget WHERE link_to_event = 'April Speaker' GROUP BY category ORDER BY SUM(amount)	student_club
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT budget_id, category, spent, remaining, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT first_name, last_name, SUM(cost) FROM expense WHERE link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY first_name, last_name	student_club
SELECT expense_description FROM expense WHERE link_to_member = 'Sacha Harrison'	student_club
SELECT DISTINCT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'	student_club
SELECT zip_code FROM member WHERE zip < 50	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Phillip" AND T1.last_name = "Cullen"	student_club
SELECT position FROM member WHERE major = 'Business'	student_club
SELECT COUNT(*) FROM member WHERE major_name = 'Business' AND t_shirt_size = 'Medium'	student_club
SELECT T1.type FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining > 30	student_club
SELECT event_category FROM event WHERE location = 'MU 215'	student_club
SELECT category FROM event WHERE event_date = '2020-03-24T12:00:00'	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T2.position = 'Vice President'	student_club
SELECT SUM(position = 'Member' and major_name = 'Mathematics') FROM member WHERE major_name = 'Mathematics'	student_club
SELECT type FROM event WHERE location = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT COUNT(*) FROM major WHERE department = "School of Applied Sciences, Technology and Education" AND college = "Agriculture and Applied Sciences"	student_club
SELECT T2.last_name, T1.department, T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.major_name = 'Environmental Engineering'	student_club
SELECT budget.category FROM budget, event WHERE budget.spent = 0 AND event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.link_to_event = event.event_id	student_club
SELECT T2.city, T2.state FROM major AS T1 JOIN zip_code AS T2 ON T1.major_id = T2.major_id JOIN member AS T3 ON T1.major_id = T3.major_id WHERE T1.department = 'Electrical and Computer Engineering'	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T3.organization = 'Student_Club' AND T3.location = '900 E. Washington St.' AND T1.type = 'Social'	student_club
SELECT T2.last_name, T2.position FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'	student_club
SELECT T2.last_name FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Women's Soccer'	student_club
SELECT percentage FROM member WHERE t_shirt_size = 'Medium' AND position = 'Member' AND amount = 50;	student_club
SELECT county, state, short_state FROM zip_code WHERE type = 'PO Box'	student_club
SELECT zip_code.zip_code FROM zip_code WHERE zip_code.type = 'PO Box' AND zip_code.country = (SELECT country.country FROM country WHERE country.country = 'Puerto Rico')	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT T1.link_to_event FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.paid > 50	student_club
SELECT T1.first_name, T1.last_name, T2.link_to_event FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.approved = 'true' AND T2.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T2.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T2.first_name = "Katy" AND T1.major_name = "rec1N0upiVLy5esTO"	student_club
SELECT phone FROM member WHERE link_to_major = 'Business' AND college = 'College of Agriculture and Applied Sciences'	student_club
SELECT T1.email FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND T2.cost > 20	student_club
SELECT COUNT(*) FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.major_name = 'education' AND T1.college = 'Education & Human Services';	student_club
SELECT SUM(remaining) FROM budget WHERE event_status = 'over budget'	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT * FROM expense WHERE DIVIDE( SUM(cost), COUNT(expense_id) ) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT SUM(type = 'PO Box'), COUNT(zip_code) FROM zip_code GROUP BY zip_code	student_club
SELECT T1.event_name, T1.location FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining > 0	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100	student_club
SELECT T1.first_name, T1.last_name, T1.major_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > 100	student_club
SELECT T1.city, T1.country FROM zip_code AS T1 JOIN event AS T2 ON T1.zip_code = T2.location WHERE T2.income > 50	student_club
SELECT T1.first_name, T1.last_name, MAX(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(DISTINCT T2.link_to_event) > 1	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position != 'Member')	student_club
SELECT T1.event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' GROUP BY T1.event_id HAVING AVG(T2.cost) < (SELECT AVG(cost) FROM expense WHERE category = 'Parking')	student_club
SELECT SUM(cost) / COUNT(event_id) * 100 FROM expense WHERE event_id IN (SELECT event_id FROM event WHERE type = 'Game')	student_club
SELECT budget_id FROM expense WHERE expense_description = 'Water, chips, cookies' GROUP BY budget_id ORDER BY MAX(cost) DESC LIMIT 1	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 5	student_club
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING AVG(T2.cost) > (SELECT AVG(cost) FROM expense)	student_club
SELECT (SELECT SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END) FROM zip_code) - (SELECT SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) FROM zip_code)	student_club
SELECT major.major_name, major.department FROM major INNER JOIN member ON member.major_id = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (SELECT link_to_member FROM expense WHERE expense_description = 'Water, Veggie tray, supplies')	student_club
SELECT T2.last_name, T2.phone FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.major_name = "Elementary Education"	student_club
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker'	student_club
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'	student_club
SELECT T2.first_name, T2.last_name, T1.amount FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.date_received = '2019-09-09'	student_club
SELECT budget.category FROM budget, expense WHERE expense.expense_description = 'Posters' AND expense.link_to_budget = budget.budget_id	student_club
SELECT first_name, last_name, college FROM member WHERE position = 'Secretary'	student_club
SELECT T2.event_name, SUM(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts' GROUP BY T2.event_name	student_club
SELECT zip_code.city FROM zip_code JOIN member ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Girke'	student_club
SELECT first_name, last_name, position FROM member WHERE zip = 28092	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT Currency, COUNT(*) AS Ratio FROM customers WHERE Currency IN ('EUR', 'CZK') GROUP BY Currency;	debit_card_specializing
SELECT CustomerID, MIN(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM') GROUP BY CustomerID	debit_card_specializing
SELECT AVG(Consumption) FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME' AND Currency = 'EUR');	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, SUM(y.Consumption) AS Total_Consumption FROM customers c INNER JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID, c.Segment, c.Currency ORDER BY Total_Consumption DESC	debit_card_specializing
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Segment = 'KAM' AND t2.Consumption < 30000 AND YEAR(t2.Date) = 2012;	debit_card_specializing
SELECT (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')) - (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR'))	debit_card_specializing
SELECT YearMonth.Date, MAX(YearMonth.Consumption) FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID JOIN products ON yearmonth.ProductID = products.ProductID WHERE customers.Currency = 'EUR' GROUP BY YearMonth.Date;	debit_card_specializing
SELECT Segment FROM customers GROUP BY Segment ORDER BY SUM(Consumption) LIMIT 1; SELECT Segment FROM customers GROUP BY Segment ORDER BY SUM(Consumption) LIMIT 1;	debit_card_specializing
SELECT Date, MAX(Consumption) FROM yearmonth WHERE Currency = 'CZK' GROUP BY Date;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2013%' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME' AND Currency = 'EUR');	debit_card_specializing
SELECT (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '20130101' AND '20131231' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') GROUP BY CustomerID) - (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '20130101' AND '20131231' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM' AND Currency = 'CZK') GROUP BY CustomerID) - (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '20130101' AND '20131231' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM' AND Currency = 'CZK') GROUP BY CustomerID)	debit_card_specializing
SELECT Segment, MAX(Consumption) AS Max_Consumption, MAX(Consumption) * 100.0 / MAX(Consumption) AS Percentage_Increase FROM yearmonth WHERE Date BETWEEN '201201' AND '201312' AND Currency = 'EUR' GROUP BY Segment ORDER BY Percentage_Increase DESC LIMIT 1; SELECT Segment, MAX(Consumption) AS Max_Consumption, MAX(Consumption) * 100.0 / MAX(Consumption) AS Percentage_Increase FROM yearmonth WHERE Date BETWEEN '201201' AND '201312' AND Currency = 'EUR' GROUP BY Segment ORDER BY Percentage_Increase LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201308' AND '201311' AND CustomerID = 6;	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'Czech Republic' AND Segment = 'discount') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'discount')	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE Date = '201304' AND CustomerID = 7) - (SELECT Consumption FROM yearmonth WHERE Date = '201304' AND CustomerID = 5)	debit_card_specializing
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') - (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR')	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date = '201310' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM' AND Currency = 'EUR');	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, MAX(c.Consumption) AS MaxConsumption FROM customers c INNER JOIN yearmonth ym ON c.CustomerID = ym.CustomerID GROUP BY c.CustomerID, c.Segment, c.Currency; SELECT c.CustomerID, c.Segment, c.Currency, MAX(c.Consumption) AS MaxConsumption FROM customers c INNER JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID, c.Segment, c.Currency;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE Date = '201305'	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Segment = 'LAM' AND Currency = 'EUR' AND Consumption > 46.73;	debit_card_specializing
SELECT Country, COUNT(*) AS "Value for Money" FROM gasstations WHERE Segment = 'Value for Money' GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1;	debit_card_specializing
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'KAM' AND Currency = 'EUR') / (SELECT COUNT(*) FROM customers WHERE Segment = 'KAM') * 100	debit_card_specializing
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Consumption > 528.3	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'premium') / (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia') * 100;	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY SUM(Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT Segment FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Date = '201309' GROUP BY t1.Segment ORDER BY SUM(t2.Consumption) LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, MIN(y.Consumption) AS Consumption FROM customers c INNER JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' GROUP BY c.CustomerID, c.Segment, c.Currency;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE YEAR(Date) = 2012	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR') AND Date = YEAR(CURDATE()) - MONTH(CURDATE()) + 1	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN yearmonth AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Date = '201309';	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '20130601';	debit_card_specializing
SELECT DISTINCT T1.ChainID FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Price = (SELECT CURRENT_RATE FROM customers AS T3 WHERE T3.Currency = 'EUR')	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Amount) FROM transactions_1k WHERE Date LIKE '%2012-01%'	debit_card_specializing
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Currency = 'EUR' AND t2.Consumption > 1000	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T3.GasStationID = T2.GasStationID WHERE T3.Country = 'CZE'	debit_card_specializing
SELECT T1.Time, T1.Date FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE') AND Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'CZE' AND T2.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(Amount) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE');	debit_card_specializing
SELECT AVG(Amount) FROM transactions WHERE Currency = 'EUR';	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, MAX(t.Amount) AS Amount FROM customers c JOIN transactions t ON c.CustomerID = t.CustomerID JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '2012-08-25' GROUP BY c.CustomerID, c.Segment, c.Currency;	debit_card_specializing
SELECT Country FROM gasstations WHERE Date = '2012-08-25' ORDER BY Date LIMIT 1;	debit_card_specializing
SELECT T2.Currency FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '16:25:00'	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date LIKE '%2012-08-26%' AND Price > 0	debit_card_specializing
SELECT Segment FROM customers ORDER BY CustomerID LIMIT 1; SELECT Segment FROM customers ORDER BY CustomerID LIMIT 1;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24 12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'; SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT SUM(Consumption) AS total_spent, Date FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24') AND Date = '2012-01-01';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date BETWEEN '2012-08-26 08:00:00' AND '2012-08-26 09:00:00' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE');	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17	debit_card_specializing
SELECT Country FROM gasstations WHERE GasStationID = 667467	debit_card_specializing
SELECT t1.Segment, t1.Currency, t1.CustomerID FROM customers AS t1 JOIN transactions_1k AS t2 ON t1.CustomerID = t2.CustomerID JOIN yearmonth AS t3 ON t1.CustomerID = t3.CustomerID WHERE t2.Date = '2012-08-24' AND t2.Amount = 548.4	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Currency = 'EUR' AND Date = '2012-08-25'	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-24' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8)) - (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-25' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8)) / (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-24' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8))	debit_card_specializing
SELECT GasStationID, SUM(Amount) AS Revenue FROM transactions_1k GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1	debit_card_specializing
SELECT Segment, COUNT(*) AS "premium" FROM customers WHERE Segment = 'SVK' GROUP BY Segment SELECT Segment, COUNT(*) AS "premium" FROM customers WHERE Segment = 'SVK' GROUP BY Segment;	debit_card_specializing
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '%201201%';	debit_card_specializing
SELECT ProductID, Description FROM products ORDER BY Amount DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, AVG(p.Price) AS AveragePricePerSingleItem FROM customers c INNER JOIN transactions t ON c.CustomerID = t.CustomerID INNER JOIN products p ON t.ProductID = p.ProductID WHERE c.Currency = 'EUR' GROUP BY c.CustomerID ORDER BY AVG(p.Price) DESC LIMIT 1;	debit_card_specializing
SELECT T2.Country FROM products AS T1 JOIN gasstations AS T2 ON T1.ProductID = T2.GasStationID WHERE T1.ProductID = 2	debit_card_specializing
SELECT Consumption FROM yearmonth WHERE Date LIKE '%201208%' AND CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE ProductID = 5 AND Amount > 29.00)	debit_card_specializing
