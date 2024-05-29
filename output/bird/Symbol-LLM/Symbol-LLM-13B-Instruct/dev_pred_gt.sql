SELECT MAX(EligibleFreeRate) FROM frpm WHERE County = "Alameda" AND EnrollmentType = "K-12"	california_schools
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM frpm ORDER BY `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` LIMIT 3	california_schools
SELECT Zip FROM schools WHERE County = "Fresno" AND StatusType = "Charter"	california_schools
SELECT T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Enrollment (K-12) = (SELECT MAX(Enrollment (K-12)) FROM frpm)	california_schools
SELECT Phone FROM schools WHERE Charter = 1 AND OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath < 400 AND T2.Virtual = 'F'	california_schools
SELECT s.School, s.Magnet FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.Enroll12 > 500 AND s.Magnet = 1	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead > 1500 ORDER BY T1.AvgScrRead DESC LIMIT 1	california_schools
SELECT T1.School, T1.CDSCode, COUNT(*) AS NumTstTakr FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.CDSCode = (SELECT MAX(CDSCode) FROM frpm) AND T1.rtype = 'K-12' GROUP BY T1.School, T1.CDSCode ORDER BY NumTstTakr DESC	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.Charter = 1	california_schools
SELECT frpm.CDSCode, frpm.SchoolName, frpm.FRPMCount, AVG(satscores.AvgScrRead) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.SchoolType = 'Elementary' AND satscores.rtype = 'Read' GROUP BY frpm.CDSCode, frpm.SchoolName, frpm.FRPMCount ORDER BY AVG(satscores.AvgScrRead) DESC LIMIT 1;	california_schools
SELECT cds FROM frpm WHERE Enrollment(K-12) + Enrollment(Ages 5-17) > 500;	california_schools
SELECT MAX(EligibleFree(Ages5to17)) FROM frpm WHERE ExcellenceRate > 0.3;	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead DESC LIMIT 3;	california_schools
SELECT cds, enroll12 FROM satscores ORDER BY enroll12 DESC LIMIT 5;	california_schools
SELECT DISTINCT DistrictName, AVG(CAST(Score AS FLOAT)) AS AverageScore FROM (     SELECT SchoolName, AVG(CAST(Score AS FLOAT)) AS Score     FROM satscores     JOIN schools ON satscores.CDSCode = Schools.CDSCode     WHERE rtype = 'Reading'     GROUP BY SchoolName ) AS Scores WHERE DistrictName IN (     SELECT DistrictName FROM schools     WHERE StatusType = 'Active' ) ORDER BY AverageScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Alameda' AND T1.NumTstTakr < 100	california_schools
SELECT cds, CharterNum FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrWrite = 499	california_schools
SELECT COUNT(*) FROM frpm WHERE County = "Contra Costa" AND enroll12 <= 250	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY AVG(T1.AvgScrMath) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE `Academic Year` = 2014 AND `County Name` = 'Amador' AND `Low Grade` = 9 AND `High Grade` = 12	california_schools
SELECT COUNT(*) FROM frpm WHERE County = "Los Angeles" AND Enrollment(K-12) > 500 AND FreeMealCount(K-12) < 700	california_schools
SELECT cds, COUNT(*) AS NumTstTakr FROM satscores GROUP BY cds ORDER BY NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.School, s.StreetAbr, s.City, s.Zip, s.State, s.MailStreet, s.MailStrAbr, s.MailCity, s.MailZip, s.MailState, s.Phone, s.Ext, s.Website, s.OpenDate, s.ClosedDate, s.Charter, s.CharterNum, s.FundingType, s.SOC, s.SOCType, s.EdOpsCode, s.EdOpsName, s.EILCode, s.EILName, s.GSoffered, s.GSserved, s.Virtual, s.Magnet, s.Latitude, s.Longitude, s.AdmFName1, s.AdmLName1, s.AdmEmail1, s.AdmFName2, s.AdmLName2, s.AdmEmail2, s.AdmFName3, s.AdmLName3, s.AdmEmail3 FROM frpm AS t1 JOIN schools AS s ON t1.School = s.CDSCode WHERE t1.Enrollment (K-12) - t1.Enrollment (Ages 5-17) > 30;	california_schools
SELECT T2.School, T2.Percent_Eligible_Free_K_12, T1.AvgScrRead, T1.AvgScrMath, T1.AvgScrWrite, T1.NumGE1500 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 AND T2.Percent_Eligible_Free_K_12 > 0.1	california_schools
SELECT T2.FundingType FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T1.CDSCode = T3.CDS WHERE T2.County = "Riverside" AND T3.AvgScrMath > 400	california_schools
SELECT School, Street, City, State FROM schools WHERE County = "Monterey" AND Enrollment(Ages 15-17) > 800	california_schools
SELECT s.School, AVG(s.AvgScrWrite) AS AvgScore FROM satscores AS s INNER JOIN schools AS s2 ON s.cds = s2.CDSCode WHERE s2.OpenDate > 1991 OR s2.ClosedDate < 2000 GROUP BY s.School	california_schools
SELECT School, DOCType FROM schools WHERE (Enrollment(K-12) - Enrollment(Ages 5-17)) > (SELECT AVG(Enrollment(K-12) - Enrollment(Ages 5-17)) FROM schools WHERE FundingType = 'Locally Funded')	california_schools
SELECT OpenDate FROM schools ORDER BY Enroll12 DESC LIMIT 1;	california_schools
SELECT City, MIN(Enroll12) FROM satscores GROUP BY City ORDER BY Enroll12 LIMIT 5;	california_schools
SELECT `Free Meal Count (K-12)` / `Enrollment (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10, 11;	california_schools
SELECT `FRPM Count (K-12)` / `Enrollment (K-12)` FROM frpm WHERE `CDSCode` IN (SELECT `CDSCode` FROM schools WHERE `Ownership Code` = 66 ORDER BY `Free Meal Count (K-12)` DESC LIMIT 5)	california_schools
SELECT School, Website FROM frpm WHERE FreeMealCount(5, 17) >= 1900 AND FreeMealCount(5, 17) <= 2000	california_schools
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM frpm WHERE `School Name` = 'Kacey Gibson'	california_schools
SELECT AdmEmail1 FROM schools WHERE Charter = 1 ORDER BY Enrollment (K-12) LIMIT 1;	california_schools
SELECT T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr >= 1500 GROUP BY T1.CDSCode ORDER BY T2.AvgScrRead DESC LIMIT 1	california_schools
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead LIMIT 1;	california_schools
SELECT T2.Website FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.enroll12 BETWEEN 2000 AND 3000 AND T2.County = "Los Angeles"	california_schools
SELECT AVG(t1.AvgScrRead + t1.AvgScrMath + t1.AvgScrWrite) FROM satscores AS t1 JOIN schools AS t2 ON t1.cds = t2.CDSCode WHERE t2.City = 'Fresno' AND t2.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'	california_schools
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T1.CDSCode = T3.CDSCode GROUP BY T2.CDSCode ORDER BY AVG(T3.AvgScrRead) LIMIT 1	california_schools
SELECT cds, AVG(AvgScrRead) AS AvgRead, AVG(AvgScrMath) AS AvgMath, AVG(AvgScrWrite) AS AvgWrite, COUNT(*) AS NumTstTakr FROM satscores WHERE cds IN (SELECT cds FROM schools WHERE Virtual = 'F' GROUP BY cds ORDER BY AVG(AvgScrRead) DESC LIMIT 5) GROUP BY cds	california_schools
SELECT T2.EducationalOptionType FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT AVG(AvgScrMath) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY AVG(AvgScrMath) LIMIT 1;	california_schools
SELECT T2.City, AVG(T1.AvgScrWrite) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr >= 1500 GROUP BY T2.City ORDER BY AVG(T1.AvgScrWrite) DESC LIMIT 1	california_schools
SELECT s.School, AVG(satscores.AvgScrWrite) FROM satscores INNER JOIN schools AS s ON satscores.cds = s.CDSCode WHERE s.AdmFName1 = 'Ricci Ulrich' GROUP BY s.School	california_schools
SELECT State, COUNT(*) AS enrollment FROM schools WHERE DOC = 31 AND StatusType = 'State Special' GROUP BY State ORDER BY enrollment DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 FROM schools WHERE County = 'Alameda' AND DOC = 52 AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31';	california_schools
SELECT (SELECT COUNT(*) FROM frpm WHERE County = "Orange" AND DistrictType = "Unified" AND SchoolType = "Elementary") / (SELECT COUNT(*) FROM frpm WHERE County = "Orange" AND DistrictType = "Elementary" AND SchoolType = "Elementary")	california_schools
SELECT County, COUNT(*) AS ClosedSchools, MAX(ClosedDate) AS ClosureDate FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY ClosedSchools DESC LIMIT 1;	california_schools
SELECT T2.Street, T2.City, T2.Zip, T2.State, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState, T2.Phone, T2.Ext, T2.Website, T1.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T1.CDSCode ORDER BY AVG(T1.AvgScrMath) DESC LIMIT 6, 1	california_schools
SELECT T2.MailStreet, T2.MailStrAbr, T1.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T2.MailStreet, T2.MailStrAbr ORDER BY AVG(T1.AvgScrRead) LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite >= 1500 AND T2.MailCity = 'Lakeport'	california_schools
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Fresno'	california_schools
SELECT School, MailZip FROM schools WHERE SOCType = 'Traditional' AND SOCName = 'Avetik Atoian';	california_schools
SELECT (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Colusa') / (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Humboldt')	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND StatusType = 'Active'	california_schools
SELECT Phone, Ext FROM schools ORDER BY AvgScrWrite DESC LIMIT 333	california_schools
SELECT Phone, Ext FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE AdmFName1 = 'Mike Larson' AND AdmLName1 = 'Dante Alvarez'	california_schools
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1;	california_schools
SELECT COUNT(*) FROM frpm WHERE County = "Los Angeles" AND Charter = 0 AND `Free Meal Count (K-12)` * 100 / `Enrollment (K-12)` < 0.18	california_schools
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmEmail1, T1.School, T1.City FROM schools AS T1 JOIN administrators AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T1.CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = "Hickman" AND CharterNum = "00D4"	california_schools
SELECT (SELECT COUNT(*) FROM frpm WHERE County = 'Santa Clara' AND FundingType = 'Locally Funded') / (SELECT COUNT(*) FROM frpm WHERE County = 'Santa Clara') * 100	california_schools
SELECT COUNT(*) FROM frpm WHERE County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND FundingType = 'Directly Funded'	california_schools
SELECT COUNT(*) FROM schools WHERE District = 'Community College' AND ClosedDate LIKE '%1989%' AND City = 'San Francisco'	california_schools
SELECT County, COUNT(*) AS ClosedSchools FROM schools WHERE YEAR(ClosedDate) BETWEEN 1980 AND 1989 AND SOC = 11 GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT NCESSchool FROM schools WHERE SOC = 31	california_schools
SELECT COUNT(*) FROM schools WHERE County = "Alpine" AND StatusType = "District Community Day School"	california_schools
SELECT DISTINCT DistrictCode FROM schools WHERE City = 'Fresno' AND Magnet = 0	california_schools
SELECT SUM(Enrollment) FROM frpm WHERE School = 'State Special School' AND AcademicYear = '2014-2015' AND AgeBetween(5, 17)	california_schools
SELECT FRPMCount(5 AS _17) FROM frpm WHERE SchoolName = 'Youth Authority School' AND MailStreet = 'PO Box 1040'	california_schools
SELECT MIN(LowGrade) FROM frpm WHERE DistrictSpecialEducConsortiaSchool = '613360'	california_schools
SELECT T2.Educational_Option_Type FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Breakfast_Provision_2 = '2' AND T2.County_Code = 37	california_schools
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SchoolType = 'HS' AND T1.LowGrade = 9 AND T1.HighGrade = 12 AND T2.County = 'Merced' AND T2.SOCType = 'Lunch Provision 2'	california_schools
SELECT cds, Percent(%)Eligible FRPM(Ages 5-17) FROM frpm WHERE County = "Los Angeles" AND Enrollment(K-12) BETWEEN 0 AND 9000;	california_schools
SELECT cds, COUNT(*) AS cnt FROM satscores GROUP BY cds ORDER BY cnt DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1;	california_schools
SELECT School, MIN(LowGrade) FROM frpm WHERE State = 'CA' GROUP BY School;	california_schools
SELECT MIN(HighGrade) - MIN(LowGrade) FROM frpm	california_schools
SELECT COUNT(*), City, COUNT(*) FROM schools WHERE Magnet = 1 AND (Kindergarten = 1 OR Kindergarten = 1) AND (8thGrade = 1 OR 8thGrade = 1) GROUP BY City	california_schools
SELECT AdmFName1, AdmLName1, District FROM schools GROUP BY AdmFName1, AdmLName1 ORDER BY COUNT(*) DESC LIMIT 2;	california_schools
SELECT DistrictCode, Percent(%)EligibleFree(K-12) FROM frpm WHERE AdmFName1 LIKE '%Alusine%'	california_schools
SELECT T1.AdmLName2, T1.District, T1.County, T1.School FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.CharterNum = 40	california_schools
SELECT AdmEmail1 FROM schools WHERE County = "San Bernardino" AND District = "San Bernardino City Unified" AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND SOC = 62 AND DOC = 54	california_schools
SELECT T2.AdmEmail1, T1.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 GROUP BY T2.AdmEmail1 ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'POPLATEK PO OBRATU') AND date > (SELECT MAX(date) FROM account)	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague') AND account_id IN (SELECT account_id FROM loan)	financial
SELECT MAX(A12) FROM district WHERE A12 <> '' AND A12 <> 'null' AND A13 <> '' AND A13 <> 'null'	financial
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000;	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND A3 = 'North Bohemia' AND A11 > 8000	financial
SELECT account_id, AVG(A11) AS avg_salary FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY avg_salary LIMIT 1;  SELECT AVG(A11) AS avg_salary, MAX(A11) AS max_salary FROM client WHERE gender = 'F' GROUP BY account_id;  SELECT AVG(A11) AS avg_salary, MAX(A11) AS max_salary FROM client WHERE gender = 'F' GROUP BY account_id;  SELECT AVG(A11) AS avg_salary, MAX(A11) AS max_salary FROM client WHERE gender = 'F' GROUP BY account_id; SELECT account_id, AVG(A11) AS avg_salary FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY avg_salary LIMIT 1;  SELECT AVG(A11) AS avg_salary, MAX(A11) AS max_salary FROM client WHERE gender = 'F' GROUP BY account_id;  SELECT AVG(A11) AS avg_salary, MAX(A11) AS max_salary FROM client WHERE gender = 'F' GROUP BY account_id;  SELECT AVG(A11) AS avg_salary, MAX(A11) AS max_salary FROM client WHERE gender = 'F' GROUP BY account_id; SELECT account_id, AVG(A11) AS avg_salary FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY avg_salary LIMIT 1;  SELECT AVG(A11) AS avg_salary, MAX(A11) AS max_salary FROM client WHERE gender = 'F' GROUP BY account_id;  SELECT AVG(A11) AS avg_salary, MAX(A11) AS max_salary FROM client WHERE gender = 'F' GROUP BY account_id;  SELECT AVG(A1	financial
SELECT account_id, AVG(A11) FROM client GROUP BY account_id ORDER BY AVG(A11) DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client WHERE gender = 'Owner' AND district_id IN (SELECT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')	financial
SELECT * FROM client WHERE district_id IN (SELECT district_id FROM disp WHERE type = 'POPLATEK PO OBRATU')	financial
SELECT account_id, MIN(amount) AS min_amount FROM loan WHERE date < '1997-12-31' GROUP BY account_id HAVING COUNT(*) > 1	financial
SELECT account_id, amount FROM loan WHERE duration > 12 AND account_id IN (SELECT account_id                   FROM account                   WHERE date LIKE '1993%') ORDER BY amount DESC LIMIT 10	financial
SELECT COUNT(*) FROM client WHERE birth_date < 1950 AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Slokolov') AND gender = 'F';	financial
SELECT * FROM account WHERE date = (SELECT MIN(date) FROM account WHERE YEAR(date) = 1995)	financial
SELECT * FROM account WHERE date < 1997 AND amount > 3000	financial
SELECT client_id FROM card WHERE issued = '1994-03-03'	financial
SELECT date FROM account WHERE amount = 840 AND date LIKE '%1998-10-14%'	financial
SELECT district_id FROM account WHERE date = '1994-08-25'	financial
SELECT MAX(T2.amount) FROM card AS T1 JOIN trans AS T2 ON T1.card_id = T2.card_id WHERE T1.disp_id IN (SELECT client_id FROM client WHERE birth_date = '1963-08-03') AND T1.issued = '1996-10-21'	financial
SELECT T1.gender FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.date = (SELECT MAX(date) FROM account)	financial
SELECT amount FROM trans WHERE trans.account_id IN (SELECT account_id FROM loan ORDER BY amount DESC LIMIT 1) AND NOT trans.amount IS NULL ORDER BY trans.date LIMIT 1	financial
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM disp WHERE bank = 'Jesenik') AND gender = 'F';	financial
SELECT disp_id FROM trans WHERE amount = 5100 AND date = '1998-09-02'	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date = 1996	financial
SELECT district_id FROM client WHERE birth_date = '1976-01-29'	financial
SELECT client.birth_date FROM client, loan WHERE loan.amount = 98832 AND loan.date = '1996-01-03' AND loan.client_id = client.client_id	financial
SELECT account_id FROM account WHERE district_id = (SELECT district_id FROM district WHERE A3 = 'Prague' ORDER BY date LIMIT 1) ORDER BY date LIMIT 1	financial
SELECT district_id, COUNT(client_id) AS clients, COUNT(client_id) - COUNT(client_id) AS male_clients, COUNT(client_id) - COUNT(client_id) * 100.0 / COUNT(client_id) AS percentage FROM client WHERE district_id = (SELECT district_id FROM district                     WHERE A4 = (SELECT A4 FROM district                               WHERE A3 = 'South Bohemia'                               ORDER BY A15 DESC                               LIMIT 1)) AND gender = 'M' GROUP BY district_id	financial
SELECT (SELECT SUM(t1.balance) FROM trans AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id WHERE t1.date < '1993-02-26' AND t1.date > '1993-02-26' AND t2.client_id = (SELECT client_id FROM client WHERE client_id = (SELECT client_id FROM loan WHERE loan_id = 1)) AND t1.type = 'debit') - (SELECT SUM(t2.balance) FROM trans AS t2 JOIN account AS t3 ON t2.account_id = t3.account_id WHERE t2.date < '1993-02-26' AND t2.date > '1993-02-26' AND t3.client_id = (SELECT client_id FROM client WHERE client_id = (SELECT client_id FROM loan WHERE loan_id = 1)) AND t2.type = 'credit') / (SELECT SUM(t3.balance) FROM trans AS t3 JOIN account AS t4 ON t3.account_id = t4.account_id WHERE t3.date < '1993-02-26' AND t3.date > '1993-02-26' AND t4.client_id = (SELECT client_id FROM client WHERE client_id = (SELECT client_id FROM loan WHERE loan_id = 1)) AND t3.type = 'credit') * 100	financial
SELECT (SELECT SUM(amount) FROM loan WHERE status = 'A' AND payments = 0) / (SELECT SUM(amount) FROM loan) * 100	financial
SELECT (SELECT SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) FROM loan WHERE amount < 100000) * 100.0 / (SELECT SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) FROM loan)	financial
SELECT account_id, district_name, A3 FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date < (SELECT MAX(date) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.type = 'POPLATEK PO OBRATU') AND T1.type = 'POPLATEK PO OBRATU'	financial
SELECT account_id, COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'East' AND A4 = 'Bohemia') AND date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY account_id	financial
SELECT account_id, date FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prachatice')	financial
SELECT district.A2, district.A3 FROM district, loan WHERE loan.account_id IN (SELECT account.account_id FROM account WHERE account.account_id = 4990) AND loan.duration > 0 AND loan.duration < 12;	financial
SELECT account_id, district_id, region_id FROM district WHERE A2 = 'POPLATEK MESICNE' AND A3 = 'KRAJENSKÝ KRAJ' AND A14 > 300000	financial
SELECT loan_id, district_id, AVG(A11) FROM loan WHERE duration = 60 GROUP BY district_id;	financial
SELECT district.A2, district.A3, district.A4, district.A5, district.A6, district.A7, district.A8, district.A9, district.A10, district.A11, district.A12, district.A13, district.A14, district.A15, district.A16 FROM district, loan WHERE loan.status = 'D' AND loan.date BETWEEN '1995-01-01' AND '1996-12-31' AND loan.district_id = district.district_id AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.frequency = 'D' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id) AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.frequency = 'D' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id) AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.frequency = 'D' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id) AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.frequency = 'D' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id) AND loan.account_id IN (SELECT account.account_id FROM account WHERE account.frequency = 'D' AND account.date BETWEEN '1995-01-01' AND '1996-12-31' AND account.district_id = district.district_id) AND loan.account_id	financial
SELECT SUM(account.amount) AS total_amount, SUM(account.amount) * 100.0 / SUM(account.amount) AS percentage FROM account WHERE account.district_id IN (SELECT district_id FROM district WHERE district.A2 = 'Decin') AND account.date = '1993-02-26'	financial
SELECT account_id FROM account WHERE frequency = 'monthly'	financial
SELECT district_id, COUNT(*) AS female_account_holders FROM account WHERE gender = 'F' GROUP BY district_id ORDER BY female_account_holders DESC LIMIT 10;	financial
SELECT district.A2, SUM(amount) AS sum_withdraws FROM account INNER JOIN card ON account.account_id = card.account_id INNER JOIN district ON account.district_id = district.district_id WHERE card.type = 'VYDAJ' AND STRFTIME('%y-%m', account.date) = '1996-01' GROUP BY district.A2 ORDER BY sum_withdraws DESC LIMIT 10;	financial
SELECT COUNT(*) FROM client WHERE NOT client_id IN (SELECT client_id FROM disp WHERE type = 'credit')	financial
SELECT district_id FROM loan WHERE status = 'C' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT AVG(amount) FROM loan WHERE gender = 'M'	financial
SELECT district_name, branch_location FROM district WHERE A13 = (SELECT MAX(A13) FROM district)	financial
SELECT SUM(A16) FROM district WHERE A16 = (SELECT MAX(A16) FROM district)	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK MESICNE' AND date < (SELECT MAX(date) FROM account WHERE frequency = 'POPLATEK MESICNE' AND balance < 0)	financial
SELECT COUNT(*) FROM loan WHERE date BETWEEN '1995-01-01' AND '1997-12-31' AND amount >= 250000 AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE' AND date BETWEEN '1995-01-01' AND '1997-12-31')	financial
SELECT COUNT(*) FROM loan WHERE status = 'C' AND bank = '1'	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM crime WHERE date = 1995 ORDER BY A15 DESC LIMIT 2, 1)	financial
SELECT COUNT(*) FROM card WHERE type = 'gold'	financial
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = "Pisek"	financial
SELECT DISTINCT T1.A2, T1.A3, T1.A4, T1.A5, T1.A6, T1.A7, T1.A8, T1.A9, T1.A10, T1.A11, T1.A12, T1.A13, T1.A14, T1.A15, T1.A16 FROM district AS T1 JOIN trans AS T2 ON T1.district_id = T2.district_id WHERE T2.amount > 10000 AND T2.date = 1997	financial
SELECT account_id FROM order WHERE k_symbol = 'SIPO'	financial
SELECT * FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'gold' INTERSECT SELECT * FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'junior'	financial
SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND YEAR(date) = 2021	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE' AND date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY account_id HAVING AVG(amount) < (SELECT AVG(amount) FROM account WHERE frequency = 'POPLATEK MESICNE' AND date BETWEEN '1998-01-01' AND '1998-12-31')	financial
SELECT * FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T1.client_id = T3.client_id JOIN loan AS T4 ON T1.client_id = T4.client_id WHERE T1.gender = 'F' AND T3.type = 'Credit' AND T4.status = 'Active'	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'south Bohemia');	financial
SELECT * FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Tabor') AND type = 'OWNER'	financial
SELECT type FROM account WHERE NOT account_id IN (SELECT account_id FROM loan) AND district_id IN (SELECT district_id FROM district WHERE A11 BETWEEN 8000 AND 9000) AND type <> 'OWNER'	financial
SELECT COUNT(*) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id IN (SELECT district_id FROM district WHERE A3 = 'North Bohemia') AND T2.bank = 'AB'	financial
SELECT T1.A2 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'	financial
SELECT AVG(A15) FROM district WHERE A2 = 'POPLATEK MESICNE' AND A15 > 4000 AND A15 > (SELECT AVG(A15) FROM district WHERE A2 = 'POPLATEK MESICNE' AND A15 > 0)	financial
SELECT COUNT(*) FROM card WHERE type = 'classic' AND issued < (SELECT MAX(issued) FROM card WHERE type = 'OWNER')	financial
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha') AND gender = 'M'	financial
SELECT COUNT(type) FROM card WHERE type = 'gold' AND issued < 1998	financial
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T2.account_id = T3.account_id GROUP BY T1.client_id ORDER BY SUM(T3.amount) DESC LIMIT 1;	financial
SELECT district_id, A15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532)	financial
SELECT district_id FROM account WHERE order_id = 33333	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 3356) AND operation = 'VYBER'	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND date BETWEEN '1995-03-24' AND '1997-07-07' AND amount < 200000	financial
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 13539)	financial
SELECT district_id FROM client WHERE client_id = 3541	financial
SELECT district_id FROM account WHERE status = 'A' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT account.client_id, account.district_id, account.frequency, account.date FROM account WHERE account.account_id = 32423	financial
SELECT * FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = 5	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik')	financial
SELECT DISTINCT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'junior' AND T2.issued > '1996-01-01'	financial
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T2.district_id IN (SELECT AVG(A11) FROM district AS T3 WHERE T3.A11 > 10000)	financial
SELECT SUM(amount_1997) - SUM(amount_1996) / SUM(amount_1996) * 100 AS growth_rate FROM loan WHERE account_id IN (SELECT account_id FROM client WHERE gender = 'M') AND date BETWEEN '1996-01-01' AND '1997-12-31';	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > 1995	financial
SELECT (SELECT SUM(A16) FROM district WHERE A3 = 'North' AND A5 = 'Bohemia') - (SELECT SUM(A16) FROM district WHERE A3 = 'East' AND A5 = 'Bohemia')	financial
SELECT COUNT(*) FROM account WHERE account_id IN (1,2,3,4,5,6,7,8,9,10)	financial
SELECT frequency, SUM(amount) FROM account WHERE account_id = 3 GROUP BY frequency	financial
SELECT birth_date FROM client WHERE client_id = 130	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU'	financial
SELECT SUM(t2.amount) AS total_debt, SUM(t2.payments) AS payments FROM client AS t1 JOIN loan AS t2 ON t1.client_id = t2.account_id WHERE t1.client_id = 992;	financial
SELECT SUM(t1.amount) FROM account AS t1 JOIN client AS t2 ON t1.client_id = t2.client_id WHERE t1.account_id = 851	financial
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 9)	financial
SELECT SUM(amount) FROM trans WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 617) AND date LIKE "%1998%"	financial
SELECT client_id, birth_date FROM client WHERE birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'East Bohemia')	financial
SELECT loan_id FROM loan WHERE status = 'paid' ORDER BY amount DESC LIMIT 3;	financial
SELECT COUNT(*) FROM client WHERE birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND gender = 'M' AND client_id IN (SELECT account_id FROM trans WHERE amount > 4000)	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > 1996	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND type = 'junior'	financial
SELECT (SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T2.district_id = (SELECT MAX(district_id) FROM account AS T3 WHERE T3.district_id = (SELECT MAX(district_id) FROM district WHERE A3 = 'Prague'))) / (SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.district_id = (SELECT MAX(district_id) FROM district WHERE A3 = 'Prague')) * 100	financial
SELECT COUNT(*) * 100.0 / COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT DISTINCT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')	financial
SELECT COUNT(*) FROM client WHERE frequency = 'POPLATEK TYDNE'	financial
SELECT account_id, MIN(amount) AS min_amount FROM loan WHERE duration > 24 AND account_id IN (SELECT account_id FROM account                   WHERE date < 1997) GROUP BY account_id;	financial
SELECT account_id FROM client WHERE gender = 'F' ORDER BY A11 LIMIT 1	financial
SELECT COUNT(*) FROM client WHERE birth_date = 1920 AND district_id IN (SELECT district_id FROM district WHERE A3 = 'East Bohemia')	financial
SELECT COUNT(*) FROM loan WHERE duration = 24 AND payments = 0	financial
SELECT AVG(amount) FROM loan WHERE status = 'C' AND POPLATEK PO ORAÇU = 'D'	financial
SELECT T1.client_id, T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.type = 'owner'	financial
SELECT T1.client_id, T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'gold' AND T2.account_id IN (SELECT account_id FROM loan)	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'cl' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-');	toxicology
SELECT AVG(element = 'o') FROM atom WHERE bond_type = '-';	toxicology
SELECT AVG(bond_type = '-') FROM bond	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-' AND element = 'na';	toxicology
SELECT * FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+'	toxicology
SELECT DIVIDE(SUM(element = 'c'), COUNT(atom_id)) FROM atom WHERE bond_type = ' = ';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR099';	toxicology
SELECT molecule_id FROM atom WHERE element = 'si';	toxicology
SELECT element FROM atom WHERE bond_id = 'TR004_8_9';	toxicology
SELECT element FROM atom WHERE bond_type = ' = ';	toxicology
SELECT label FROM atom WHERE element = 'h' GROUP BY label ORDER BY COUNT(label) DESC LIMIT 1;	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te');	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_type = '-';	toxicology
SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-'))	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(*) LIMIT 1;	toxicology
SELECT bond_type FROM bond WHERE atom_id = 'TR004_8' AND atom_id = 'TR004_20';	toxicology
SELECT label FROM molecule WHERE NOT molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'sn')	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'i' OR element = 's' AND NOT bond_type IS NULL;	toxicology
SELECT atom_id, atom_id2, bond_id FROM connected WHERE bond_type = '#';	toxicology
SELECT atom_id FROM connected WHERE molecule_id = 'TR181'	toxicology
SELECT DIVIDE(SUM(element = 'f'), COUNT(molecule_id)) AS percent FROM atom WHERE label = '+' AND element != 'f';	toxicology
SELECT DIVIDE(COUNT(bond_id) FROM bond WHERE bond_type = '#' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')), COUNT(bond_id) FROM bond WHERE bond_type = '#' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element;	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6'	toxicology
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-')	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR_000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id = (SELECT atom_id FROM atom WHERE molecule_id = (SELECT molecule_id FROM atom WHERE atom_id = 'TR000_2'))	toxicology
SELECT T2.label FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' = ' ORDER BY T2.label	toxicology
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(bond_id)) as percent FROM bond WHERE molecule_id = 'TR008'	toxicology
SELECT DIVIDE(SUM(label = '+'), COUNT(molecule_id)) as percent FROM molecule;	toxicology
SELECT SUM(element = 'h') FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR060';	toxicology
SELECT bond_type, COUNT(*) AS count FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type ORDER BY count DESC LIMIT 1;	toxicology
SELECT T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = '-' ORDER BY T1.label	toxicology
SELECT bond_id, bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type	toxicology
SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR009' AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12');	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND element = 'br';	toxicology
SELECT bond_type, atom_id, atom_id2 FROM bond WHERE bond_id = 'TR001_6_9'	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR001_10'	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#';	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT molecule_id FROM atom WHERE SUBSTRING(atom_id, 7, 2) BETWEEN 21 AND 25 AND label = '+';	toxicology
SELECT * FROM atom WHERE element = 'p' OR element = 'n'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = ';	toxicology
SELECT AVG(bond_id) FROM bond WHERE molecule_id IN (SELECT atom_id FROM atom WHERE element = 'i');	toxicology
SELECT bond_type, bond_id FROM bond WHERE atom_id = 45;	toxicology
SELECT element FROM atom WHERE NOT atom_id IN (SELECT atom_id FROM connected);	toxicology
SELECT atom.atom_id FROM atom, bond, molecule WHERE bond.bond_type = 'triple' AND molecule.molecule_id = bond.molecule_id AND molecule.label = 'TR447';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR144_8_19'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1;	toxicology
SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) LIMIT 1;	toxicology
SELECT DISTINCT atom_id FROM atom WHERE element = 'pb'	toxicology
SELECT element FROM atom WHERE bond_type = '#';	toxicology
SELECT DIVIDE(COUNT(bond_id), COUNT(atom_id WHERE MAX(COUNT(atom_id)) = 2)) FROM bond	toxicology
SELECT DIVIDE(SUM(label = '+'), COUNT(bond_id)) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN('c', 'h')	toxicology
SELECT atom_id2 FROM atom WHERE element = 's'	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'sn');	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '#' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'p' OR element = 'br'))	toxicology
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '-'	toxicology
SELECT DIVIDE(SUM(element = 'cl'), COUNT(atom_id)) as percent FROM atom WHERE bond_type = '-'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000' OR molecule_id = 'TR001' OR molecule_id = 'TR002'	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030';	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE molecule_id = 'TR000' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR001' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR002' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR003' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR004' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR005' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR006' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR007' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR008' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR009' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR010' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR011' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR012' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR013' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR014' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR015' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR016' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR017' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR018' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR019' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR020' UNION SELECT molecule_id FROM atom WHERE molecule_id = 'TR021	toxicology
SELECT element FROM atom WHERE bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'i'	toxicology
SELECT MAX(label) FROM molecule WHERE element = 'ca';	toxicology
SELECT * FROM atom WHERE atom_id = 'TR001_1_8'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '#' AND element = 'c'	toxicology
SELECT DIVIDE(SUM(element = 'pb'), COUNT(molecule_id)) AS percentage FROM atom WHERE label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = ';	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_type = '#'	toxicology
SELECT element FROM atom WHERE bond_id = 'TR005_16_26'	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR001_10_11'	toxicology
SELECT bond_id FROM bond WHERE bond_type = '#'	toxicology
SELECT molecule_id, COUNT(CASE WHEN element = 'cl' THEN 1 END) AS toxicology FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND substr(atom_id, 7, 1) = 4 GROUP BY molecule_id;	toxicology
SELECT DIVIDE(SUM(element = 'h'), count(element)) FROM atom WHERE molecule_id = 'TR006';	toxicology
SELECT * FROM molecule WHERE label = '+' AND element = 'ca';	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te');	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(*) AS count, bond_type FROM bond WHERE bond_type = '#' GROUP BY bond_type;	toxicology
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(all bond_id)) as percent FROM bond WHERE molecule_id = 'TR047'	toxicology
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1');	toxicology
SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR151';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR151'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE substr(molecule_id, 3, 3) BETWEEN 10 AND 50) AND element = 'c';	toxicology
SELECT COUNT(*) FROM molecule AS t1 JOIN atom AS t2 ON t1.molecule_id = t2.molecule_id WHERE t1.label = '+'	toxicology
SELECT bond_id FROM bond WHERE bond_type = ' = ';	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'h' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT T2.molecule_id FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T3.element = 'TR00_1' AND T1.bond_id = 'TR000_1_2'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' EXCEPT SELECT atom_id FROM atom WHERE label = '-'	toxicology
SELECT DIVIDE(SUM(CASE WHEN element = 'h' AND label = '+' THEN 1 ELSE NULL END), COUNT(molecule_id)) * 100.0 AS percentage FROM atom WHERE element = 'h';	toxicology
SELECT * FROM molecule WHERE label = '+' AND molecule_id = 'TR124';	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR007_4_19'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = ' = ' AND molecule_id = 'TR006';	toxicology
SELECT molecule_id, element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT T1.label, T2.atom_id, T3.atom_id FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T2.bond_id = '1'	toxicology
SELECT molecule_id, element FROM atom WHERE bond_type = '#';	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'cl'	toxicology
SELECT atom_id, COUNT(*) FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE molecule_id = 'TR346') GROUP BY atom_id;	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.label = '+'	toxicology
SELECT COUNT(*) FROM molecule WHERE NOT label LIKE '%s%' AND NOT molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = ' = ')	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT * FROM atom WHERE element = 'cl'	toxicology
SELECT * FROM atom WHERE element = 'c' EXCEPT SELECT * FROM molecule WHERE label = '-'	toxicology
SELECT DIVIDE(COUNT(DISTINCT molecule_id) FROM atom WHERE element = 'cl' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')), COUNT(DISTINCT molecule_id) FROM atom WHERE element = 'cl' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id = 'TR001_3_4';	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id = 'TR000_1') AND molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id = 'TR000_2')	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR000_2'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT percentage FROM bond WHERE bond_type = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND element = 'n';	toxicology
SELECT molecule_id FROM atom WHERE element = 's' AND bond_type = ' = ';	toxicology
SELECT COUNT(*) FROM molecule AS t1 JOIN connected AS t2 ON t1.molecule_id = t2.molecule_id WHERE t1.label = '-' AND COUNT(t2.atom_id) > 5;	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR024' AND bond_type = '='	toxicology
SELECT molecule_id FROM atom GROUP BY molecule_id ORDER BY COUNT(atom_id) DESC LIMIT 1;	toxicology
SELECT DIVIDE(COUNT(DISTINCT molecule_id) FROM connected WHERE bond_type = '#' AND element = 'h' AND label = '+', COUNT(DISTINCT molecule_id) FROM connected) * 100.0	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR004_7'	toxicology
SELECT COUNT(*) FROM molecule AS t1 JOIN bond AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.bond_type = ' = ' AND t1.label = 'oxygen';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-' AND bond_type = '#';	toxicology
SELECT element, bond_type FROM bond WHERE molecule_id = 'TR016'	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR012' AND element = 'c' AND bond_type = ' = ';	toxicology
SELECT atom_id FROM atom WHERE element = 'o'	toxicology
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
total	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
	card_games
SELECT DisplayName, MAX(Reputation) AS HighestReputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY DisplayName ORDER BY HighestReputation DESC LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND CreationDate > 2013	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'csgillespie'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = 101	codebase_community
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = '##UserId##' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT SUM(CommentCount) FROM posts WHERE OwnerUserId = '##UserId##'	codebase_community
SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = '##UserId##'	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT LastEditorUserId FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation')	codebase_community
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL	codebase_community
SELECT OwnerDisplayName FROM posts WHERE ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Age > 65 AND p.Score > 20	codebase_community
SELECT Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts')	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian')	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags ORDER BY Count DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Teacher' AND UserId = 101	codebase_community
SELECT Name FROM badges WHERE UserId = 101	codebase_community
SELECT COUNT(*) FROM badges WHERE YEAR(Date) = 2011 AND UserId = 102656	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT MAX(UserId) FROM badges)	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = '##UserId##'	codebase_community
SELECT AVG(COUNT(Id)) AS average_badges FROM (     SELECT COUNT(Id) AS count, DisplayName     FROM users     WHERE Views > 200     GROUP BY DisplayName ) AS t GROUP BY DisplayName	codebase_community
SELECT COUNT(Id) AS "count", CAST(COUNT(Id) AS FLOAT) / (SELECT COUNT(*) FROM users WHERE Age > 65) * 100 AS "percentage" FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE posts.Score > 20 AND users.Age > 65;	codebase_community
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE OwnerUserId = 58) AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts AS p INNER JOIN comments AS c ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = 1910	codebase_community
SELECT COUNT(*) FROM votes WHERE PostId = 123456 AND VoteTypeId = 5 AND CreationDate = '2014/4/23 20:29:39.0'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1	codebase_community
SELECT * FROM comments WHERE UserId = 23853 AND CreationDate = '2013-07-12 09:08:18.0' AND ClosedDate IS NULL	codebase_community
SELECT Reputation FROM users WHERE Id = 65041	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT DisplayName FROM users WHERE Id = 381800	codebase_community
SELECT COUNT(*) FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'DatEpicCoderGuyWhoPrograms')	codebase_community
SELECT COUNT(p.Id) / COUNT(v.Id) FROM posts AS p INNER JOIN votes AS v ON p.Id = v.PostId WHERE p.OwnerUserId = '24'	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT * FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT Name FROM badges WHERE UserId = 15	codebase_community
SELECT PostId, Text FROM comments WHERE Text LIKE '%thank you user93%'	codebase_community
SELECT * FROM comments WHERE UserId = 101	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts AS p INNER JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT * FROM comments WHERE PostId = 10144	codebase_community
SELECT u.DisplayName FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Necromancer';	codebase_community
SELECT OwnerUserId FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT Title FROM Posts WHERE LastEditorUserId = 101	codebase_community
SELECT SUM(Score) AS total_score, WebsiteUrl FROM users INNER JOIN postHistory ON postHistory.UserId = Users.Id WHERE Users.DisplayName = 'Yevgeny' AND postHistory.PostHistoryTypeId = 5 GROUP BY WebsiteUrl	codebase_community
SELECT c.Text FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.Id = 10140	codebase_community
SELECT SUM(BountyAmount) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data%')	codebase_community
SELECT u.DisplayName FROM users AS u INNER JOIN votes AS v ON u.Id = v.UserId WHERE v.BountyAmount = 50 AND v.PostId = 10125 AND v.VoteTypeId = 8	codebase_community
SELECT AVG(ViewCount) FROM posts WHERE Tags LIKE '%humor%'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT Id FROM users ORDER BY Views LIMIT 1	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE YEAR(Date) = 2011	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Count(Name) > 5;	codebase_community
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%' AND (SELECT COUNT(*) FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Teacher' OR badges.Name = 'Supporter') > 0	codebase_community
SELECT u.DisplayName, u.Reputation FROM users AS u WHERE u.Id = 1	codebase_community
SELECT u.Id AS "user_link", COUNT(p.Id) AS "posts", SUM(p.ViewCount) AS "views" FROM users AS u INNER JOIN postHistory AS ph ON ph.UserId = u.Id INNER JOIN posts AS p ON p.Id = ph.PostId WHERE ph.PostHistoryTypeId = 5 AND u.Reputation > 1000 GROUP BY u.Id HAVING COUNT(p.Id) = 1 AND SUM(p.ViewCount) > 1000 ORDER BY 'views' DESC	codebase_community
SELECT u.DisplayName, COUNT(c.Id) AS Comments FROM users u INNER JOIN comments c ON c.UserId = u.Id GROUP BY u.Id, u.DisplayName ORDER BY Comments DESC LIMIT 100;	codebase_community
SELECT COUNT(*) FROM users WHERE Location LIKE '%India%' AND EXISTS(SELECT * FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Teacher')	codebase_community
SELECT (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2010) - (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2011)	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId	codebase_community
SELECT * FROM postLinks WHERE PostId = 61217	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395	codebase_community
SELECT PostId, OwnerUserId FROM posts WHERE Score > 60	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND CreationDate = 2011	codebase_community
SELECT AVG(UpVotes) AS avg_upvotes, AVG(Age) AS avg_age FROM users WHERE Count(UserId) > 10;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT * FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10	codebase_community
SELECT b.Name FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Pierre')	codebase_community
SELECT DISTINCT T1.Date FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'	codebase_community
SELECT COUNT(UserId) AS "Teacher", COUNT(UserId) AS "Total Users" FROM badges WHERE Name = 'Teacher'	codebase_community
SELECT COUNT(UserId) AS "count", COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN UserId END) AS "count_teenagers" FROM users WHERE EXISTS (SELECT * FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Organizer') GROUP BY UserId	codebase_community
SELECT Score FROM comments WHERE PostId = 1	codebase_community
SELECT Text FROM comments WHERE PostId = 4	codebase_community
SELECT Age FROM users WHERE Location LIKE '%Vienna%' AND Reputation > 1000	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND Reputation >= 15000	codebase_community
SELECT SUM(p.ViewCount) FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id INNER JOIN posts AS p ON p.Id = b.PostId WHERE b.Date = '2010-07-19 19:39:08.0' AND u.DisplayName = 'Teacher' AND p.OwnerUserId = u.Id	codebase_community
SELECT b.Name FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')	codebase_community
SELECT COUNT(*) FROM users WHERE Age > 65 AND EXISTS(SELECT * FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Supporter')	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%'	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 10	codebase_community
SELECT (SELECT COUNT(Id) FROM votes WHERE YEAR(CreationDate) = 2010) / (SELECT COUNT(Id) FROM votes WHERE YEAR(CreationDate) = 2011)	codebase_community
SELECT t.TagName FROM users AS u INNER JOIN tags AS t ON t.TagName = '##TagName##' WHERE u.DisplayName = 'John Stauffer'	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 101	codebase_community
SELECT Id FROM posts WHERE OwnerUserId = 101 AND PostTypeId = 1 AND AnswerCount = (SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = 101 AND PostTypeId = 1)	codebase_community
SELECT MAX(SUM(ViewCount)) FROM posts WHERE DisplayName IN ('Harvey Motulsky', 'Noah Snyder');	codebase_community
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.Score > 4;	codebase_community
SELECT COUNT(*) FROM comments WHERE Score < 60 AND PostId IN (SELECT Id FROM posts WHERE OwnerUserId = '##UserId##' AND DisplayName = 'Neil McGuigan')	codebase_community
SELECT t.TagName, t.Count FROM tags AS t WHERE t.TagName IN (     SELECT t.TagName     FROM tags AS t     WHERE t.TagName IN (         SELECT t.TagName         FROM tags AS t         WHERE t.TagName IN (             SELECT t.TagName             FROM tags AS t             WHERE t.TagName IN (                 SELECT t.TagName                 FROM tags AS t                 WHERE t.TagName IN (                     SELECT t.TagName                     FROM tags AS t                     WHERE t.TagName IN (                         SELECT t.TagName                         FROM tags AS t                         WHERE t.TagName IN (                             SELECT t.TagName                             FROM tags AS t                             WHERE t.TagName IN (                                 SELECT t.TagName                                 FROM tags AS t                                 WHERE t.TagName IN (                                     SELECT t.TagName                                     FROM tags AS t                                     WHERE t.TagName IN (                                         SELECT t.TagName                                         FROM tags AS t                                         WHERE t.TagName IN (                                             SELECT t.TagName                                             FROM tags AS t                                             WHERE t.TagName IN (                                                 SELECT t.TagName                                                 FROM tags AS t                                                 WHERE t.TagName IN (                                                     SELECT t.TagName                                                     FROM tags AS t                                                     WHERE t.TagName IN (                                                         SELECT t.TagName                                                         FROM tags AS t                                                         WHERE t.TagName IN (                                                             SELECT t.TagName                                                             FROM tags AS t                                                             WHERE t.TagName IN (                                                                 SELECT t.TagName                                                                 FROM tags AS t                                                                 WHERE t.TagName IN (                                                                     SELECT t.TagName                                                                     FROM tags AS t                                                                     WHERE t.TagName IN (                                                                         SELECT t.TagName                                                                         FROM tags AS t                                                                         WHERE t.TagName IN (                                                                             SELECT t.TagName                                                                             FROM tags AS t                                                                             WHERE t.TagName IN (	codebase_community
SELECT DISTINCT T1.DisplayName FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'	codebase_community
SELECT DIVIDE(COUNT(PostId WHERE TagName = 'r'), COUNT(PostId WHERE DisplayName = 'Community')) AS percentage;	codebase_community
SELECT (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Mornington') - (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Amos')	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE YEAR(Date) = 2014	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts AS p INNER JOIN comments AS c ON c.PostId = p.Id WHERE c.Score > 60 AND p.OwnerUserId = '##UserId##'	codebase_community
SELECT b.Name FROM badges AS b WHERE b.UserId = 101 AND YEAR(b.Date) = 2011	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users AS u INNER JOIN posts AS p ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150	codebase_community
SELECT COUNT(*) AS PostHistoryCount, MAX(CreationDate) AS LastEditDate FROM postHistory WHERE PostId = 12345	codebase_community
SELECT u.LastAccessDate, u.Location FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Outliers'	codebase_community
SELECT Title FROM posts WHERE PostId = 101444	codebase_community
SELECT p.Id AS "post_link", b.Name FROM badges AS b INNER JOIN posts AS p ON p.Id = b.PostId WHERE b.UserId = '##UserId##' AND YEAR(b.Date) = 2013	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT u.DisplayName, u.Location FROM users AS u INNER JOIN tags AS t ON t.TagName = 'hypothesis-testing' WHERE t.ExcerptPostId = u.Id	codebase_community
SELECT T1.Title, T2.LinkTypeId FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T1.Id = 10244	codebase_community
SELECT p.OwnerDisplayName FROM posts AS p WHERE p.Id = (SELECT MAX(p2.ParentId) FROM posts AS p2 WHERE p2.Score = (SELECT MAX(Score) FROM posts))	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users AS u INNER JOIN votes AS v ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50	codebase_community
SELECT Id FROM users ORDER BY Age LIMIT 1;	codebase_community
SELECT MAX(ViewCount) AS ViewCount, MAX(Score) AS Score FROM posts WHERE Tags LIKE '%<kotlin>%'	codebase_community
SELECT AVG(CAST(COUNT(Id) AS FLOAT)) FROM postLinks WHERE YEAR(CreationDate) = 2010 AND AnswerCount < 2	codebase_community
SELECT Id FROM posts WHERE OwnerUserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Title FROM posts WHERE Id = (SELECT MIN(PostId) FROM postLinks)	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT MAX(UserId) FROM badges)	codebase_community
SELECT MIN(CreationDate) FROM votes WHERE UserId = '##UserId##'	codebase_community
SELECT MIN(CreaionDate) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT MIN(UserId) FROM badges WHERE Name = 'Autobiographer')	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'United Kingdom' AND (SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = users.Id) >= 4;	codebase_community
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010	codebase_community
SELECT Id, Title FROM posts WHERE OwnerUserId = 101 AND PostTypeId = 1 ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1;	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = 101	codebase_community
SELECT OwnerDisplayName FROM posts WHERE ViewCount > 20000 AND YEAR(CreationDate) = 2011	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE YEAR(CreationDate) = 2010 ORDER BY FavoriteCount DESC LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(Id) WHERE CreationDate = 2011 AND Reputation > 1000, COUNT(Id)) * 100 AS percentage;	codebase_community
SELECT DIVIDE(COUNT(Id) WHERE Age BETWEEN 13 AND 18), COUNT(Id) FROM users GROUP BY Age	codebase_community
SELECT SUM(ViewCount) AS total_views, OwnerUserId, OwnerDisplayName, MAX(CreationDate) AS last_edit_date FROM posts WHERE Title = 'Computer Game Datasets' GROUP BY OwnerUserId, OwnerDisplayName ORDER BY total_views DESC	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT PostId FROM posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT DisplayName, Location FROM users WHERE Id = (SELECT MAX(LastEditorUserId) FROM posts WHERE Id = 183)	codebase_community
SELECT MAX(Date) FROM badges WHERE Name = 'Emmett'	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT (SELECT MAX(Date) FROM badges WHERE Name = 'Teacher' AND UserId = '##UserId##') - (SELECT MAX(CreationDate) FROM users WHERE DisplayName = 'Zolomon')	codebase_community
SELECT COUNT(*) AS Posts, COUNT(*) AS Comments FROM (SELECT p.Id AS PostId, c.Id AS CommentId FROM posts AS p INNER JOIN comments AS c ON p.Id = c.PostId WHERE p.OwnerUserId = (SELECT MAX(Id) FROM users) GROUP BY p.Id, c.Id) AS t1 GROUP BY PostId, CommentId;	codebase_community
SELECT Text, UserDisplayName FROM comments WHERE PostId = 101 ORDER BY CreationDate DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(*) FROM posts WHERE Tags LIKE '%careers%'	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT c.Text, c.Score, c.CreationDate, c.UserId AS "user_link", c.PostId AS "post_link" FROM comments AS c WHERE c.PostId = 12345 SELECT c.Text, c.Score, c.CreationDate, c.UserId AS "user_link", c.PostId AS "post_link" FROM comments AS c WHERE c.PostId = 12345 UNION SELECT a.Text, a.Score, a.CreationDate, a.UserId AS "user_link", a.PostId AS "post_link" FROM posts AS a WHERE a.Id = 12345	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount > 30	codebase_community
SELECT DIVIDE(COUNT(stats_posts.Id) WHERE Score > = 50 AND MAX(Reputation)), COUNT(stats_posts.Id) AS percentage FROM posts AS stats_posts WHERE stats_posts.OwnerUserId = (SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1) AND stats_posts.PostTypeId = 2 AND stats_posts.Score > = 50;	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count < 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users AS u INNER JOIN comments AS c ON c.UserId = u.Id WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT Text FROM comments WHERE PostId = 10144	codebase_community
SELECT PostId, MAX(Score) AS HighestScore FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount BETWEEN 100 AND 150) GROUP BY PostId	codebase_community
SELECT CreationDate, Age FROM users WHERE Comment LIKE '%http://%'	codebase_community
SELECT COUNT(c.PostId) FROM comments AS c WHERE c.Score = 0 AND c.CreationDate > '2010-07-19 19:39:07.0' AND c.CreationDate < '2010-07-19 19:39:07.0' AND c.PostId IN (SELECT Id FROM posts WHERE ViewCount < 5)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = 1 AND Score = 0	codebase_community
SELECT COUNT(DISTINCT c.UserId) FROM comments AS c WHERE c.Score = 0 AND c.CreationDate BETWEEN '2019-01-01' AND '2019-12-31'	codebase_community
SELECT PostId, Text FROM comments WHERE PostId = 101	codebase_community
SELECT SUM(UpVotes) FROM users WHERE DisplayName LIKE '%R is also lazy evaluated%'	codebase_community
SELECT * FROM comments WHERE UserId = '##UserId##'	codebase_community
SELECT c.UserDisplayName FROM comments c WHERE c.Score BETWEEN 1 AND 5 AND c.UserId NOT IN (SELECT u.Id FROM users AS u WHERE u.DownVotes > 0)	codebase_community
SELECT DIVIDE(COUNT(UserId) WHERE Score BETWEEN 5 AND 10 AND UpVotes = 0), COUNT(UserId) WHERE Score BETWEEN 5 AND 10) AS percentage;	codebase_community
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man';	superhero
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_power AS t2 ON t1.id = t2.hero_id JOIN superpower AS t3 ON t2.power_id = t3.id WHERE t3.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND superhero_name IN (SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength');	superhero
SELECT superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(T1.id) > 15	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN power_name AS T3 ON T2.power_id = T3.id WHERE T1.eye_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blue') AND T3.power_name = 'Agility'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blue') AND hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blond') AND superhero.superpower_id = (SELECT superpower.id FROM superpower WHERE superpower.power_name = 'Agility');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT superhero_name FROM superhero WHERE publisher_name = 'Marvel Comics' ORDER BY height_cm DESC LIMIT 1	superhero
SELECT publisher_name FROM publisher WHERE publisher_name = 'Sauron'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_name = 'Marvel Comics' AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_name = 'Marvel Comics';	superhero
SELECT publisher_name, COUNT(*) AS "Superheroes", SUM(CASE WHEN power_name = 'Super Strength' THEN 1 ELSE 0 END) AS "Super Strength" FROM superhero WHERE publisher_name = 'Marvel Comics' GROUP BY publisher_name	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')	superhero
SELECT publisher_name FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t3.attribute_name = 'Speed' GROUP BY publisher_name ORDER BY MIN(t3.attribute_value) LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_name = 'Marvel Comics' AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Gold');	superhero
SELECT publisher_name FROM publisher WHERE publisher_name IN (SELECT publisher_name FROM superhero WHERE superhero_name = 'Blue Beetle II');	superhero
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blond')	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T3.attribute_value LIMIT 1	superhero
SELECT race_id FROM superhero WHERE superhero_name = 'Copycat'	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T3.attribute_value < 50	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t3.attribute_name = 'Strength' AND t3.attribute_value = 100 AND t1.gender_id = (SELECT id FROM gender WHERE gender = 'Female')	superhero
SELECT superhero_name FROM superhero GROUP BY superhero_name ORDER BY COUNT(superhero_name) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race = 'Vampire'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_name = 'Marvel Comics' AND alignment = 'Bad';	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))	superhero
SELECT publisher_id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) FROM hero_attribute	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.id = 75	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Deathlok'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = 2;	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.gender = 'Male';	superhero
SELECT superhero_name FROM superhero WHERE race = 'Alien';	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 56	superhero
SELECT superhero_name FROM superhero WHERE race = 'Demi-God'	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 'Bad'	superhero
SELECT race_id FROM superhero WHERE weight_kg = 169	superhero
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN colour AS T3 ON T2.hair_colour_id = T3.id WHERE T1.race = 'human' AND T1.height_cm = 185;	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE height_cm BETWEEN 150 AND 180 AND publisher_id = 13	superhero
SELECT superhero_name FROM superhero WHERE weight_kg > (SELECT AVG(weight_kg) FROM superhero) AND gender_id IN (SELECT id FROM gender WHERE gender = 'Male')	superhero
SELECT power_name FROM superpower GROUP BY power_name ORDER BY COUNT(*) DESC LIMIT 1;	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination';	superhero
SELECT superpower.power_name FROM superpower, hero_power WHERE hero_power.hero_id = 1 AND hero_power.power_id = superpower.id	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'stealth';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'strength' ORDER BY T3.attribute_value DESC LIMIT 1	superhero
SELECT AVG(weight_kg) FROM superhero WHERE skin_colour_id IS NULL;	superhero
SELECT COUNT(*) FROM publisher AS T1 JOIN superhero AS T2 ON T1.publisher_name = T2.publisher_id WHERE T1.publisher_name = 'Dark Horse Comics';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'durability' AND T1.publisher_id = (SELECT publisher_name FROM publisher WHERE publisher_name = 'Dark Horse Comics') GROUP BY T1.superhero_name ORDER BY MAX(T3.attribute_value) DESC LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abraham Sapien' AND T2.attribute_name = 'eye_colour_id'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight';	superhero
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Female' AND T1.publisher_id = (SELECT publisher_id FROM publisher WHERE publisher_name = 'Dark Horse Comics')	superhero
SELECT publisher_name FROM superhero WHERE hair_colour_id = skin_colour_id AND hair_colour_id = eye_colour_id	superhero
SELECT race_id FROM superhero WHERE superhero_name = 'A-Bomb'	superhero
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN colour = 'Blue' THEN 1 ELSE 0 END), COUNT(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END)), 100) FROM superhero WHERE gender = 'Female'	superhero
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT gender_id FROM superhero WHERE superhero_name = 'Agent 13'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation';	superhero
SELECT COUNT(*) FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Amazo';	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Hunter Zolomon'	superhero
SELECT height_cm FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Amber')	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN colour AS T3 ON T2.eye_colour_id = T3.id AND T2.hair_colour_id = T3.id WHERE T3.colour = 'Black';	superhero
SELECT T1.eye_colour_id FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Gold'	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT superhero_name FROM superhero WHERE alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Strength' AND T1.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T2.attribute_name = 'Strength')	superhero
SELECT T1.race, T2.alignment FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Cameron Hicks';	superhero
SELECT percent FROM hero_attribute WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'Female' AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race = 'Alien';	superhero
SELECT (SELECT SUM(weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') FROM superhero) - (SELECT SUM(weight_kg FROM superhero WHERE full_name = 'Charles Chandler') FROM superhero)	superhero
SELECT AVG(height_cm) FROM superhero	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' GROUP BY T1.superhero_name ORDER BY T3.attribute_value DESC LIMIT 1;	superhero
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
SELECT superhero_name FROM superhero WHERE weight_kg IS NULL	superhero
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.full_name = 'Karen Beecher-Duncan' AND T2.attribute_id = (SELECT T3.id FROM attribute AS T3 WHERE T3.attribute_name = 'eye_colour')	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Helen Parr'	superhero
SELECT race_id FROM superhero WHERE weight_kg = 108 AND height_cm = 188	superhero
SELECT publisher_name FROM publisher WHERE publisher_id = (SELECT publisher_id FROM superhero WHERE id = 38);	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id GROUP BY T1.race ORDER BY MAX(T4.attribute_value) DESC LIMIT 1;	superhero
SELECT T1.alignment, T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT AVG(t2.attribute_value) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id WHERE t1.alignment_id = 3;	superhero
SELECT T1.skin_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value = 100	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value BETWEEN 75 AND 80	superhero
SELECT race_id FROM superhero WHERE hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'blue') AND gender_id = (SELECT gender.id FROM gender WHERE gender.gender = 'male');	superhero
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END), COUNT(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END)), 100.0) FROM superhero JOIN alignment ON superhero.id = alignment.id JOIN gender ON superhero.id = gender.id WHERE alignment.alignment = 'Bad' AND gender.gender = 'Female';	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 7) - (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 1)	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Hulk' AND T2.attribute_name = 'Strength';	superhero
SELECT power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero WHERE skin_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Green') AND alignment = 'Bad';	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero_name FROM superhero WHERE power_name = 'Wind Control' ORDER BY superhero_name	superhero
SELECT T1.gender FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN hero_power AS T3 ON T2.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'	superhero
SELECT superhero_name FROM superhero WHERE publisher_name = 'DC Comics' ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(height_cm) FROM superhero WHERE race <> 'Human' AND publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t3.attribute_name = 'Speed' AND t2.attribute_value = 100	superhero
SELECT publisher_name, COUNT(*) AS num_superheroes FROM superhero GROUP BY publisher_name ORDER BY num_superheroes DESC LIMIT 1;	superhero
SELECT T1.attribute_name FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' GROUP BY T1.attribute_name ORDER BY MIN(T2.attribute_value) LIMIT 1;	superhero
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN colour AS T3 ON T2.eye_colour_id = T3.id WHERE T1.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN gender = 'Female' THEN 1 ELSE NULL END), COUNT(publisher_name = 'George Lucas')), 100.0) FROM superhero WHERE publisher_name = 'George Lucas'	superhero
SELECT MULTIPLY(DIVIDE(SUM(alignment = 'Good'), COUNT(publisher_name = 'Marvel Comics')), 100.0) FROM superhero WHERE publisher_name = 'Marvel Comics' AND alignment = 'Good';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value LIMIT 1;	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT superhero_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'brown')	superhero
SELECT t2.attribute_value FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id WHERE t1.superhero_name = 'Aquababy'	superhero
SELECT weight_kg, race_id FROM superhero WHERE superhero_id = 40	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment = 'Neutral'	superhero
SELECT T1.hero_id FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superpower AS T3 ON T1.power_id = T3.id WHERE T2.attribute_name = 'Intelligence'	superhero
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Blackwulf' AND T2.attribute_name = 'eye_colour_id'	superhero
SELECT power_name FROM superhero AS t1 JOIN hero_power AS t2 ON t1.id = t2.hero_id WHERE t1.height_cm > MULTIPLY(AVG(height_cm), 0.8)	superhero
SELECT DISTINCT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 18 AND T2.q1 = (SELECT MAX(q1) FROM results WHERE raceId = 18)	formula_1
SELECT T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19 AND T1.q2 = (SELECT MIN(q2) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19)	formula_1
SELECT year FROM circuits WHERE location = "Shanghai"	formula_1
SELECT url FROM circuits WHERE name = "Circuit de Barcelona-Catalunya"	formula_1
SELECT name FROM circuits WHERE country = "Germany"	formula_1
SELECT DISTINCT T2.position FROM constructors AS T1 JOIN circuits AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = "Renault"	formula_1
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId IN (SELECT circuitId FROM circuits WHERE location LIKE '%grand prix%' AND (country LIKE '%Asia%' OR country LIKE '%Europe%'))	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = "Spain"	formula_1
SELECT location FROM circuits WHERE name = "Australian grand prix"	formula_1
SELECT url FROM circuits WHERE name = "sepang international circuit"	formula_1
SELECT time FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')	formula_1
SELECT lat, lng FROM circuits WHERE name = "Abu Dhabi Grand Prix"	formula_1
SELECT T1.nationality FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 24 AND T2.points = 1	formula_1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId = 11	formula_1
SELECT DISTINCT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.number = 355 AND T2.time = "0:01:40"	formula_1
SELECT number FROM drivers WHERE driverId IN (SELECT driverId FROM results WHERE raceId IN (SELECT raceId FROM qualifying WHERE number = 903) AND time LIKE '%0:01:54%')	formula_1
SELECT COUNT(*) FROM results WHERE raceId = 3 AND time IS NULL	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.number = 901	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE date = "2015-11-29"	formula_1
SELECT MAX(dob) FROM drivers WHERE NOT time IS NULL AND raceId = 592	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, T1.url FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 161 AND T2.milliseconds = 0 ORDER BY T2.milliseconds	formula_1
SELECT T2.nationality, T2.surname, T2.forename FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 AND T1.fastestLapSpeed = (SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933)	formula_1
SELECT location FROM circuits WHERE name = 'sepang'	formula_1
SELECT constructors.url FROM constructors, constructorStandings WHERE constructorStandings.constructorId = constructors.constructorId AND constructorStandings.raceId = 9 ORDER BY constructorStandings.points DESC LIMIT 1	formula_1
SELECT results.points FROM results WHERE results.raceId = 345 AND results.driverId = 10 AND results.q1 = 'P'	formula_1
SELECT DISTINCT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 347 AND T2.time = "0:01:15"	formula_1
SELECT DISTINCT T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 45 AND T2.q3 = '0:01:33'	formula_1
SELECT results.time FROM results WHERE results.raceId = 743 AND results.driverId = 1	formula_1
SELECT DISTINCT T2.driverId FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 3 AND T1.year = 2006 AND T1.position = 2	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.number = 901	formula_1
SELECT COUNT(*) FROM results WHERE date = "2015-11-29"	formula_1
SELECT MAX(dob) FROM drivers WHERE time LIKE '%872%'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 348 ORDER BY T2.milliseconds LIMIT 1	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 348 AND T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT (SELECT fastestLapSpeed(raceId = 853) FROM results WHERE raceId = 853) - (SELECT fastestLapSpeed(raceId = 854) FROM results WHERE raceId = 854)	formula_1
SELECT DIVIDE(COUNT(driverid), COUNT(driverid)) FROM results WHERE date = '1983-07-16'	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005 ORDER BY name DESC	formula_1
SELECT name FROM races WHERE year = (SELECT MIN(year) FROM races) AND month = (SELECT MIN(month) FROM races);	formula_1
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1;	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT DISTINCT name FROM races WHERE year != 2000	formula_1
SELECT location, name FROM circuits WHERE country = 'Monaco' AND year = (SELECT MIN(year) FROM races WHERE continent = 'Europe');	formula_1
SELECT MAX(year) FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Brands Hatch')	formula_1
SELECT COUNT(*) FROM circuits WHERE name = "Silverstone"	formula_1
SELECT DISTINCT T1.forename, T1.surname, T1.number FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 2010 AND T2.circuitId = 4 ORDER BY T2.position	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY SUM(T2.points) DESC LIMIT 1;	formula_1
SELECT T1.forename, T1.surname, SUM(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 4 GROUP BY T1.driverId ORDER BY SUM(T2.points) DESC LIMIT 3;	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, T2.name, T2.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM results)	formula_1
SELECT AVG(time) FROM results WHERE raceId = 5 AND driverId = 1 AND constructorId = 1	formula_1
SELECT DIVIDE(COUNT(raceId) where surname = 'Hamilton', year >= 2010 and position>1), (COUNT(raceId) where surname = 'Hamilton', year >= 2010) as percentage;	formula_1
SELECT T1.nationality, AVG(T1.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY MAX(COUNT(T2.wins)) DESC LIMIT 1;	formula_1
SELECT forename, surname FROM drivers WHERE nationality = 'Japanese' AND age = 2022 - YEAR(dob) + 1	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year BETWEEN 1990 AND 2000 GROUP BY T1.name HAVING COUNT(*) = 4;	formula_1
SELECT T1.name, T1.location, T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = "USA" AND T2.year = 2006	formula_1
SELECT T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.date LIKE "2005-09%"	formula_1
SELECT races.name FROM drivers, results, races WHERE drivers.driverId = results.driverId AND drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.raceId = races.raceId AND results.position < 10	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T4.forename = "Michael" AND T4.surname = "Schumacher" AND T3.name = "Sepang International Circuit" AND T1.points = (SELECT MAX(points) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId JOIN drivers AS T4 ON T1.driverId = T4.driverId)	formula_1
SELECT races.year, races.name, MIN(milliseconds) FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = "Michael" AND drivers.surname = "Schumacher" GROUP BY races.year, races.name	formula_1
SELECT AVG(points) FROM results WHERE year = 2000	formula_1
SELECT MIN(year), points FROM results WHERE driverId = 44	formula_1
SELECT name, country, date FROM races WHERE year = 2017 ORDER BY date	formula_1
SELECT races.name, races.year, circuits.location FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.laps = (SELECT MAX(laps) FROM races)	formula_1
SELECT percentage FROM races WHERE name = 'European Grand Prix' AND country = 'Germany'	formula_1
SELECT location FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY max(lat) DESC LIMIT 1;	formula_1
SELECT circuitRef FROM circuits WHERE name = "Marina Bay Street Circuit"	formula_1
SELECT location FROM circuits ORDER BY alt DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT nationality FROM drivers ORDER BY dob LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian'	formula_1
SELECT url FROM drivers WHERE forename = "Anthony" AND surname = "Davidson"	formula_1
SELECT driverRef FROM drivers WHERE forename = "Lewis" AND surname = "Hamilton"	formula_1
SELECT T2.name FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2009	formula_1
SELECT DISTINCT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Silverstone Circuit")	formula_1
SELECT * FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')	formula_1
SELECT time FROM races WHERE year = 2010 AND circuitId = (SELECT circuitId FROM circuits WHERE name = "Abu Dhabi Circuit")	formula_1
SELECT COUNT(*) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = "Italy" AND T2.sport = "Formula_1"	formula_1
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "Barcelona-Catalunya"	formula_1
SELECT url FROM circuits WHERE circuitRef = 'Valencia Street Circuit'	formula_1
SELECT MIN(T2.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1 AND T2.year = 2008 ORDER BY T2.rank LIMIT 1	formula_1
SELECT results.raceId, results.year, results.month, results.day, results.time, results.milliseconds, results.points, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed, results.rank, results.laps, results.time, results.milliseconds, results.statusId, results.driverId, results.constructorId, results.constructorRef, results.constructorId, results.constructorRef, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandingsId, results.constructorStandings	formula_1
SELECT races.name, results.rank FROM races INNER JOIN results ON races.id = results.raceId WHERE results.driverId = 44 AND results.rank = (SELECT MIN(results.rank) FROM results WHERE results.driverId = 44 AND results.raceId = races.id)	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T2.name = "Spanish Grand Prix"	formula_1
SELECT DISTINCT year FROM results WHERE driverId = 44	formula_1
SELECT positionOrder FROM results WHERE raceId = 1 AND year = 2008 AND driverId = 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.grid = 4 AND T2.raceId = 1	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE time <> "null" AND raceId = 1	formula_1
SELECT MAX(T2.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.name = "2008 Australian Grand Prix" AND T3.forename = "Lewis" AND T3.surname = "Hamilton"	formula_1
SELECT results.time FROM results WHERE results.raceId = 1 AND results.year = 2008 AND results.position = 2	formula_1
SELECT T1.name, T1.url FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Australian Grand Prix' AND YEAR(T1.date) = 2008 AND T1.rank = 1 AND T1.time LIKE '%HH:MM:SS.%';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'American' AND date LIKE '%2008%'	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1 AND T2.time LIKE '%2008%'	formula_1
SELECT SUM(T2.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"	formula_1
SELECT AVG(fastestLapTime) FROM results WHERE driverId = 44 AND constructorId = 1	formula_1
SELECT COUNT(DISTINCT raceID) FROM results WHERE time IS NOT NULL	formula_1
SELECT (SELECT MAX(time) FROM results WHERE raceId = 1 AND year = 2008) - (SELECT MAX(time) FROM results WHERE raceId = 1 AND year = 2008 AND rank = (SELECT MAX(rank) FROM results WHERE raceId = 1 AND year = 2008)) * 100 / (SELECT MAX(time) FROM results WHERE raceId = 1 AND year = 2008)	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Melbourne' AND country = 'Australia';	formula_1
SELECT location FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > 1980	formula_1
SELECT AVG(points) FROM constructorStandings WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'British')	formula_1
SELECT * FROM constructorStandings ORDER BY points DESC LIMIT 1	formula_1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0	formula_1
SELECT COUNT(*) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Japanese" AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(*) = 2	formula_1
SELECT * FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1	formula_1
SELECT COUNT(*) FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "French" AND T2.laps > 50	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE year BETWEEN 2007 AND 2009 AND time <> '' AND nationality = 'Japanese'	formula_1
SELECT year, AVG(TIMEDIFF(finished_time, start_time)) AS average_time FROM results WHERE NOT finished_time IS NULL GROUP BY year	formula_1
SELECT forename, surname FROM drivers WHERE year(dob) > 1975 AND rank = 2	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Italian" AND T2.time IS NULL	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapTime LIMIT 1	formula_1
SELECT MAX(T2.fastestLap) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009	formula_1
SELECT AVG(fastestLapSpeed) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix');	formula_1
SELECT name, year FROM races ORDER BY milliseconds LIMIT 1;	formula_1
SELECT COUNT(driverId) FROM drivers WHERE year(dob) < 1985 AND laps > 50	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "French" AND T2.milliseconds < 02:00.00	formula_1
SELECT * FROM drivers WHERE nationality = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Netherlandic' AND year(dob) = (SELECT MAX(year(dob)) FROM drivers)	formula_1
SELECT driverRef FROM drivers WHERE forename = "Robert" AND surname = "Kubica"	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Australian' AND year(dob) = 1980	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, MIN(T2.time) FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "German" AND T2.year >= 1980 AND T2.year <= 1990 GROUP BY T1.driverId, T1.forename, T1.surname ORDER BY MIN(T2.time) LIMIT 3	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY year(dob) LIMIT 1;	formula_1
SELECT DISTINCT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob LIKE "1971%" AND T2.fastestLapTime = (SELECT MAX(fastestLapTime) FROM results)	formula_1
SELECT * FROM drivers WHERE year(dob) < 1982 AND MAX(time) = (SELECT MAX(time) FROM drivers WHERE year(dob) < 1982)	formula_1
SELECT year FROM results ORDER BY fastestLapTime LIMIT 1	formula_1
SELECT year FROM lapTimes ORDER BY time DESC LIMIT 1	formula_1
SELECT DISTINCT driverId, MIN(time) FROM lapTimes WHERE lap = 1 GROUP BY driverId ORDER BY MIN(time) DESC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NULL	formula_1
SELECT COUNT(*) FROM circuits WHERE location LIKE '%Austria%' AND lat != '' AND lng != '';	formula_1
SELECT MAX(number) FROM results WHERE time IS NOT NULL	formula_1
SELECT DISTINCT T1.nationality, T1.birthday FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 <> ''	formula_1
SELECT T1.name, T1.date, T1.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Max' AND T3.surname = 'Villeneuve' AND T1.year = (SELECT MIN(year) FROM results AS T4 JOIN drivers AS T5 ON T4.driverId = T5.driverId WHERE T5.forename = 'Max' AND T5.surname = 'Villeneuve') ORDER BY T3.dob DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "American" AND T2.statusId = 2;	formula_1
SELECT MAX(t1.points) FROM constructorStandings AS t1 JOIN constructors AS t2 ON t1.constructorId = t2.constructorId WHERE t2.nationality = "Italian"	formula_1
SELECT constructors.url FROM constructors WHERE constructors.name = (SELECT MAX(constructors.name) FROM constructors)	formula_1
SELECT MAX(time) FROM lapTimes WHERE raceId = 3 AND driverId IN (SELECT DISTINCT driverId FROM results WHERE raceId = 3)	formula_1
SELECT MIN(milliseconds) FROM lapTimes WHERE lap = 1	formula_1
SELECT AVG(fastestLapTime) FROM results WHERE raceId = 2 AND year = 2006	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, AVG(T2.duration) FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' AND T1.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY T1.driverId ORDER BY AVG(T2.duration) LIMIT 5;	formula_1
SELECT T2.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = "Canadian Grand Prix" AND YEAR(T1.year) = 2008 ORDER BY T1.rank LIMIT 1	formula_1
SELECT T1.constructorRef, T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 2009 AND T2.position = 1	formula_1
SELECT forename, surname, dob FROM drivers WHERE year(dob) BETWEEN '1981' AND '1991' AND nationality = 'Austrian'	formula_1
SELECT forename, surname, dob, url FROM drivers WHERE year(dob) BETWEEN '1971' AND '1985' AND nationality = 'German' ORDER BY dob DESC	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'	formula_1
SELECT MAX(T2.points) AS score, T2.name, T2.nationality FROM results AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = (SELECT MAX(raceId) FROM races WHERE year BETWEEN 1980 AND 2010) GROUP BY T2.name, T2.nationality	formula_1
SELECT AVG(points) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Turkish Grand Prix') AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(year) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31'	formula_1
SELECT MAX(nationality) FROM drivers	formula_1
SELECT SUM(T2.points) FROM results AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.rank = 91	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId GROUP BY T1.name ORDER BY MIN(T2.fastestLapTime) DESC LIMIT 1	formula_1
SELECT T1.name, T1.location, T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.date = (SELECT MAX(date) FROM races)	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = (SELECT MIN(raceId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008) AND T1.position = 1	formula_1
SELECT DISTINCT drivers.forename, drivers.surname, races.name, drivers.nationality, MIN(drivers.dob) AS dob FROM drivers, races WHERE drivers.nationality = races.nationality AND drivers.driverId = races.driverId GROUP BY drivers.forename, drivers.surname, races.name, drivers.nationality ORDER BY dob DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM results WHERE results.driverId = (SELECT MAX(results.driverId) FROM results WHERE results.raceId = (SELECT races.raceId FROM races WHERE races.name = 'Canadian Grand Prix')) AND results.statusId = 3	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT MAX(duration) FROM pitStops	formula_1
SELECT MAX(milliseconds) FROM lapTimes	formula_1
SELECT MAX(duration) FROM pitStops WHERE driverId = 44	formula_1
SELECT lap FROM pitStops WHERE raceId = 1 AND driverId = 1 AND stop = 1	formula_1
SELECT DISTINCT T1.driverId, T1.stop, T1.time FROM pitStops AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2011	formula_1
SELECT MIN(milliseconds) FROM lapTimes WHERE raceId IN (SELECT races.raceId FROM races JOIN results ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = "Lewis" AND drivers.surname = "Hamilton")	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId JOIN lapTimes AS T4 ON T2.raceId = T4.raceId AND T2.driverId = T4.driverId WHERE T3.name = 'Formula_1' AND T4.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT T1.position FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId WHERE T2.driverId = 44 AND T2.fastestLap = (SELECT MIN(time) FROM results WHERE driverId = 44)	formula_1
SELECT MIN(milliseconds) FROM lapTimes WHERE raceId = 4	formula_1
SELECT c.name, MIN(l.milliseconds) AS fastest_time FROM circuits c JOIN lapTimes l ON c.circuitId = l.circuitId WHERE c.country = 'Italy' GROUP BY c.name	formula_1
SELECT races.name FROM circuits, races WHERE circuits.name = 'Austrian Grand Prix Circuit' AND races.circuitId = circuits.circuitId AND races.year = (SELECT MAX(year) FROM races WHERE races.circuitId = circuits.circuitId)	formula_1
SELECT MAX(milliseconds) FROM pitStops WHERE raceId = (SELECT MAX(raceId) FROM results WHERE circuitId = (SELECT MAX(circuitId) FROM circuits WHERE name = 'Austrian Grand Prix Circuit'))	formula_1
SELECT location FROM circuits WHERE lat, lng = (SELECT MAX(lat), MAX(lng) FROM lapTimes WHERE time = '1:29.488')	formula_1
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = 44	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating > = 60 AND overall_rating < 65 AND defensive_work_rate = 'low'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)	european_football_2
SELECT league_id FROM Match WHERE season = '2015/2016' GROUP BY league_id ORDER BY SUM(home_team_goal, away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id FROM Match WHERE season = '2015/2016' AND home_team_api_id IN (SELECT home_team_api_id FROM Match WHERE season = '2015/2016' GROUP BY home_team_api_id ORDER BY COUNT(*) DESC LIMIT 1)	european_football_2
SELECT player_name FROM Player ORDER BY penalties DESC LIMIT 10;	european_football_2
SELECT MAX(SUBTRACT(away_team_goal, home_team_goal) > 0) FROM Match WHERE season = '2009/2010' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League');	european_football_2
SELECT T1.team_api_id, T1.team_fifa_api_id, MAX(T2.buildUpPlaySpeed) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id GROUP BY T1.team_api_id ORDER BY MAX(T2.buildUpPlaySpeed) DESC LIMIT 4;	european_football_2
SELECT League_id, COUNT(*) AS matches_end_as_draw FROM Match WHERE season = '2015/2016' GROUP BY League_id ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT * FROM Player_Attributes WHERE overall_rating > = 80 AND date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'	european_football_2
SELECT League.name, COUNT(*) AS matches FROM League INNER JOIN Match ON League.id = Match.league_id GROUP BY League.id ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday > '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010' GROUP BY player_api_id HAVING AVG(overall_rating) > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010') ORDER BY AVG(overall_rating) DESC LIMIT 10	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes) AND STRFTIME('%Y', T2.date) = '2012';	european_football_2
SELECT DIVIDE(SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END), COUNT(player_fifa_api_id)) * 100 AS percentage_left_foot FROM Player_Attributes WHERE birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00';	european_football_2
SELECT League_id, COUNT(*) AS Goals FROM Match GROUP BY League_id ORDER BY Goals DESC LIMIT 5;	european_football_2
SELECT AVG(long_shots) FROM Player WHERE player_fifa_api_id IN (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT player_api_id, player_name, AVG(heading_accuracy) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 GROUP BY player_api_id ORDER BY AVG(heading_accuracy) DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date > '2014-01-01 00:00:00' AND T2.date < '2014-01-31 00:00:00' GROUP BY T1.team_api_id HAVING AVG(T2.chanceCreationPassing) < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date > '2014-01-01 00:00:00' AND date < '2014-01-31 00:00:00') ORDER BY chanceCreationPassing DESC	european_football_2
SELECT League.name FROM League, Match WHERE League.season = '2009/2010' AND Match.league_id = League.id GROUP BY League.name HAVING AVG(home_team_goal) > AVG(away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT * FROM Player WHERE YEAR(birthday) = 1970 AND MONTH(birthday) = 10;	european_football_2
SELECT T1.player_api_id, T1.player_fifa_api_id, T1.date, T1.overall_rating, T1.potential, T1.preferred_foot, T1.attacking_work_rate, T1.crossing, T1.finishing, T1.heading_accuracy, T1.short_passing, T1.volleys, T1.dribbling, T1.curve, T1.free_kick_accuracy, T1.long_passing, T1.ball_control, T1.acceleration, T1.sprint_speed, T1.agility, T1.reactions, T1.balance, T1.shot_power, T1.jumping, T1.strength, T1.long_shots, T1.aggression, T1.interceptions, T1.positioning, T1.vision, T1.penalties, T1.marking, T1.standing_tackle, T1.sliding_tackle, T1.gk_diving, T1.gk_handling, T1.gk_kicking, T1.gk_positioning, T1.gk_reflexes, T1.food_delivery, T1.food_delivery_time FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Franco Zennaro"	european_football_2
SELECT SUM(buildUpPlayPositioningClass) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.buildUpPlayPositioningClass = '1st two thirds';	european_football_2
SELECT Player_Attributes.player_api_id, Player_Attributes.player_fifa_api_id, Player_Attributes.date, Player_Attributes.finishing FROM Player_Attributes WHERE Player_Attributes.player_api_id = 218353 AND Player_Attributes.date = '2014-09-18 00:00:00'	european_football_2
SELECT SUM(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id JOIN Player AS T3 ON T1.player_api_id = T3.player_api_id WHERE T3.player_name = 'Gabriel Tamas' AND T1.date = '2011'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League');	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE date = (SELECT MAX(date) FROM Player_Attributes);	european_football_2
SELECT * FROM Player_Attributes ORDER BY potential DESC LIMIT 10	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT DISTINCT T1.defensive_work_rate FROM Player_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id JOIN Player AS T3 ON T1.player_api_id = T3.player_api_id WHERE T3.player_name = "David Wilson"	european_football_2
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1;	european_football_2
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = "Netherlands";	european_football_2
SELECT AVG(home_team_goal) FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Poland') AND season = '2010/2011';	european_football_2
SELECT T1.player_api_id, AVG(T1.finishing) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_api_id ORDER BY AVG(T1.finishing) DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE born_after_1990 = 1;	european_football_2
SELECT COUNT(*) FROM Player WHERE weight > 170 AND player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Adam');	european_football_2
SELECT player_api_id, player_name FROM Player_Attributes WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010';	european_football_2
SELECT potential FROM Player_Attributes WHERE player_api_id = 218353 AND date = '2016-02-18 00:00:00';	european_football_2
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left';	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_short_name = "CLB"	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE date BETWEEN '2010-01-01' AND '2015-12-31' AND height > 170;	european_football_2
SELECT player_api_id, height FROM Player ORDER BY height LIMIT 1;	european_football_2
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A';	european_football_2
SELECT T2.team_short_name FROM `Team_Attributes` AS T1 JOIN `Team` AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = 218353	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND date BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T2.team_short_name FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10	european_football_2
SELECT * FROM Player_Attributes WHERE potential = 61 ORDER BY balance DESC LIMIT 1;	european_football_2
SELECT ABS(AVG(ball_control) - AVG(ball_control WHERE player_name = 'Aaron Appindangoye')) FROM Player_Attributes WHERE player_name = 'Abdou Diallo'	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'GEN';	european_football_2
SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY birthday LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Belgium Jupiler League';	european_football_2
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany';	european_football_2
SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes GROUP BY player_api_id;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating > 80 AND defensive_work_rate = 'high' AND players.player_api_id IN (SELECT Player.player_api_id FROM Player WHERE STRFTIME('%Y', birthday) < '1986')	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE player_api_id IN (1,2,3,4,5) GROUP BY player_api_id ORDER BY MAX(crossing) DESC LIMIT 1;	european_football_2
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Ariel Borysiuk"	european_football_2
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE volleys > 70 AND dribbling > 70	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/09' AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT MAX(long_passing) FROM Player_Attributes WHERE birthday = (SELECT MAX(birthday) FROM Player);	european_football_2
SELECT COUNT(*) FROM Match WHERE League.name = 'Belgium Jupiler League' AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04';	european_football_2
SELECT MAX(league_id) FROM Match WHERE season = '2008/2009';	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE birthday < '1986';	european_football_2
SELECT (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel') * 100 / (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel')	european_football_2
SELECT AVG(buildUpPlaySpeed) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.id JOIN Player AS T3 ON T1.player_api_id = T3.player_api_id WHERE T3.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(T2.crossing) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing) AS score, chanceCreationPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax' GROUP BY chanceCreationPassingClass	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating) FROM Player_Attributes WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal) FROM Match WHERE country_id = (SELECT country_id FROM Country WHERE name = 'Italy') AND home_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma')	european_football_2
SELECT player_name FROM Player_Attributes WHERE overall_rating = 77 AND date = '2016-06-23' ORDER BY birthday LIMIT 1	european_football_2
SELECT SUM(overall_rating) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Mooy') AND date = '2016-02-04 00:00:00';	european_football_2
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Francesco Parravicini') AND date = '2010-08-30 00:00:00';	european_football_2
SELECT T1.player_api_id, T1.player_name, T1.player_fifa_api_id, T1.date, T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date = '2015-05-01 00:00:00';	european_football_2
SELECT T1.defensive_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Berigaud' AND T1.date = '2013-02-22 00:00:00';	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant')	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_long_name = 'Willem II' AND T1.date = '2011-02-22 00:00:00';	european_football_2
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00';	european_football_2
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_long_name = 'FC Lorient' AND T1.date = '2010-02-22'	european_football_2
SELECT chance_creation_passing_class FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00';	european_football_2
SELECT T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_long_name = 'Hull City' AND T1.date = '2010-02-22 00:00:00';	european_football_2
SELECT T1.defenceAggressionClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date = '2015-09-10 00:00:00';	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Marko Arnautovic') AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';	european_football_2
SELECT (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan') AS player_api_id, (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery') AS player_api_id, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating_2, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating_1, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating_2, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating_1, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating_2, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating_1, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating_2 SELECT (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating_1, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery')) AS overall_rating_2, (SELECT overall_rating FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan')) AS overall_rating overall_rating SELECT overall	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE age >= datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday) > 34	european_football_2
SELECT SUM(home_team_goal) FROM Match WHERE home_player_name = 'Aaron Lennon'	european_football_2
SELECT SUM(T2.home_player_Y11) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.home_player_api_id WHERE T1.player_name = 'Daan Smith' OR T1.player_name = 'Filipe Ferreira'	european_football_2
SELECT SUM(home_team_goal) FROM Match WHERE home_player_age <= 30	european_football_2
SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes GROUP BY player_api_id;	european_football_2
SELECT player_api_id, player_name, MAX(potential) FROM Player_Attributes WHERE NOT potential IS NULL GROUP BY player_api_id, player_name ORDER BY potential DESC LIMIT 10	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'high'	european_football_2
SELECT player_name FROM Player WHERE finishing = 1 ORDER BY age DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE country_api_id IN (SELECT country_id FROM Country WHERE name = 'Belgium')	european_football_2
SELECT T1.country_id FROM Country AS T1 JOIN Player_Attributes AS T2 ON T1.id = T2.country_id WHERE T2.vision > 89	european_football_2
SELECT country_id, AVG(weight) FROM Player GROUP BY country_id ORDER BY AVG(weight) DESC LIMIT 1;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T1.height) FROM Player AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_name = 'Italy';	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name	european_football_2
SELECT COUNT(*) FROM Player WHERE birthday > '1990' AND player_name LIKE 'Aaron%';	european_football_2
SELECT (SELECT jumping FROM Player WHERE id = 6) - (SELECT jumping FROM Player WHERE id = 23)	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' AND potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = "left" AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = "left")	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE strength > 80 AND stamina > 80	european_football_2
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Poland Ekstraklasa';	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date = '2008-09-24%'	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player_Attributes WHERE player_name = 'Alexis Blin'	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A')	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Netherlands'))	european_football_2
SELECT finishing, curve FROM Player_Attributes WHERE weight = (SELECT MAX(weight) FROM Player_Attributes)	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' GROUP BY T1.team_long_name ORDER BY COUNT(T2.id) DESC LIMIT 1;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id GROUP BY T1.team_api_id ORDER BY SUM(T2.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes GROUP BY player_api_id;	european_football_2
SELECT DIVIDE(COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END),COUNT(id)) * 100 AS percentage FROM Player_Attributes WHERE overall_rating > 70;	european_football_2
SELECT (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') - (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-')	thrombosis_prediction
SELECT (SELECT COUNT(ID) FROM Patient WHERE year(Birthday) > '1930' AND SEX = 'F') / (SELECT COUNT(ID) FROM Patient WHERE SEX = 'F')	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31' AND Admission = '+'	thrombosis_prediction
SELECT (SELECT COUNT(ID) FROM Examination WHERE Diagnosis = 'SLE' AND Admission = '+') / (SELECT COUNT(ID) FROM Examination WHERE Diagnosis = 'SLE' AND Admission = '-')	thrombosis_prediction
SELECT Examination.Diagnosis, Laboratory.Date FROM Examination INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.ID = 30609	thrombosis_prediction
SELECT SEX, Birthday, `Examination Date`, Symptoms FROM Patient WHERE ID = 163109	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;	thrombosis_prediction
SELECT ID, age FROM Examination WHERE RVVT = '+'	thrombosis_prediction
SELECT ID, SEX, Diagnosis FROM Patient WHERE Thrombosis = 2;	thrombosis_prediction
SELECT * FROM Patient WHERE YEAR(Birthday) = '1937' AND `T-CHO` > = 250	thrombosis_prediction
SELECT ID, SEX, Diagnosis FROM Patient WHERE ALB < 3.5;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE (SEX = 'F' AND TP < 6.0 OR TP > 8.5)	thrombosis_prediction
SELECT AVG(aCL IgG) FROM Examination WHERE Admission = '+' AND SUBTRACT(year(CURRENT_TIMESTAMP), year(Birthday)) >= 50	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'F' AND YEAR(Description) = '1997' AND Admission = '-'	thrombosis_prediction
SELECT MIN(age) FROM Patient WHERE NOT `First Date` IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 1 AND SEX = 'F' AND YEAR(Examination Date) = 1997	thrombosis_prediction
SELECT (SELECT MAX(year(Birthday)) FROM Patient) - (SELECT MIN(year(Birthday)) FROM Patient) FROM Patient WHERE NOT TG IS NULL;	thrombosis_prediction
SELECT Examination.Symptoms, Examination.Diagnosis FROM Examination ORDER BY Examination.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(COUNT(ID)) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY MONTH(T2.Date)	thrombosis_prediction
SELECT MAX(Birthday), MAX(year(Birthday)) FROM Patient WHERE Diagnosis = 'SJS'	thrombosis_prediction
SELECT (SELECT SUM(UA <= 8.0 AND SEX = 'M') FROM Laboratory) / (SELECT SUM(UA <= 6.5 AND SEX = 'F') FROM Laboratory)	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE NOT Patient.ID IN (SELECT Examination.Patient FROM Examination WHERE Examination.Date < DATEADD(year, -1, GETDATE()))	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE YEAR(Birthday) < 18 AND `Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND `T-BIL` > 2.0	thrombosis_prediction
SELECT MAX(COUNT(Diagnosis)) FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT AVG(SUBTRACT('1999', year(Birthday))) FROM Patient WHERE NOT Birthday IS NULL AND Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT T1.Age, T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.HGB = (SELECT MAX(HGB) FROM Examination)	thrombosis_prediction
SELECT `aCL IgA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT COUNT(*) > 0 FROM Examination WHERE Examination.ID = 2927464 AND Examination.TAT2 < 250	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` LIMIT 1;	thrombosis_prediction
SELECT aCL IgM FROM Examination WHERE Patient.ID = (SELECT Patient.ID FROM Patient WHERE Patient.Description = '1994-02-19') AND Examination.Description = '1993/11/12'	thrombosis_prediction
SELECT * FROM Patient WHERE SEX = 'M' AND Date = '1992-06-12' AND GPT = '9'	thrombosis_prediction
SELECT AGE(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UA = '8.4' AND L.Date = '1991-10-21'	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.First_Date = '1991-06-13' AND Patient.Diagnosis = 'SJS' AND NOT Patient.ID IS NULL AND STRFTIME('%y', Laboratory.Date) = '1995'	thrombosis_prediction
SELECT patient.Diagnosis FROM patient WHERE patient.ID IN (SELECT Examination.Patient FROM Examination WHERE Examination.Examination_Date = '1997-01-27' AND Examination.Diagnosis = 'SLE') ORDER BY patient.First_Date LIMIT 1	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE `Examination Date` = '1993-09-27' AND Patient.Birthday = '1959-03-01'	thrombosis_prediction
SELECT (SELECT SUM(T-CHO) FROM Laboratory WHERE Date BETWEEN '1981-11-01' AND '1981-12-31' AND ID IN (SELECT ID FROM Patient WHERE Birthday = '1959-02-18')) - (SELECT SUM(T-CHO) FROM Laboratory WHERE Date BETWEEN '1981-11-01' AND '1981-12-31' AND ID IN (SELECT ID FROM Patient WHERE Birthday = '1959-02-18'))	thrombosis_prediction
SELECT * FROM Patient WHERE Diagnosis = 'Behcet' INTERSECT SELECT * FROM Examination WHERE YEAR(Description) > = '1997-1-1' AND YEAR(Description) < '1998-1-1'	thrombosis_prediction
SELECT ID FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4	thrombosis_prediction
SELECT ID, * FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND ANA = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) FROM Examination)	thrombosis_prediction
SELECT MULTIPLY(DIVIDE(UA < = 6.5, `U-PRO` > 0 AND `U-PRO` < 30), 100) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30 AND UA < = 6.5	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE NULL END) WHERE YEAR(First Date) = 1981, MULTIPLY(COUNT(YEAR(First Date) = 1981), 100)) * 100 AS percentage FROM Patient WHERE SEX = 'M' AND YEAR(First Date) = 1981	thrombosis_prediction
SELECT * FROM Patient WHERE Admission = '-' AND Date LIKE '1991-10%' AND T-BIL < 2.0	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE ANA_PATTERN != 'p' AND BIRTHDAY BETWEEN 1980 AND 1989;	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'PSS' AND Laboratory.CRP > 2 AND Laboratory.CRE = 1 AND Laboratory.LDH = 123	thrombosis_prediction
SELECT AVG(ALB) FROM Laboratory WHERE SEX = 'F' AND PLT > 400 AND `T-BIL` = 'SLE';	thrombosis_prediction
SELECT MAX(symptoms) FROM Examination WHERE diagnosis = 'SLE';	thrombosis_prediction
SELECT `First Date`, `Diagnosis` FROM Patient WHERE `ID` = 48473	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE YEAR(DATE) = '1997' AND (TP > 6 AND TP < 8.5);	thrombosis_prediction
SELECT DIVIDE(SUM(CASE WHEN Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE NULL END), SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE NULL END)) * 100	thrombosis_prediction
SELECT COUNT(DISTINCT SEX) FROM Patient WHERE YEAR(BIRTHDAY) = '1980' AND diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` BETWEEN '1995' AND '1997' AND `ANA Pattern` = 'BEHCET' AND NOT `Admission` IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(Examination Date, First Date) FROM Examination WHERE Examination.ID = 821298	thrombosis_prediction
SELECT COUNT(*) > 0 FROM Examination WHERE Examination.ID = 57266 AND Examination.UA > 8.0 AND Examination.SEX = 'M' OR Examination.UA > 6.5 AND Examination.SEX = 'F'	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT > 60	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND STRFTIME('%y', Laboratory.Date) = '1994'	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'M' AND NOT GPT IS NULL AND GPT > 60	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.Birthday DESC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT ID, age FROM Patient WHERE age >= (SELECT MAX(age) FROM Patient) AND LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT * FROM Laboratory WHERE ALP < 300 AND Admission = '+';	thrombosis_prediction
SELECT * FROM Patient WHERE Birthday = '1982-04-01' AND NOT ALP > 300	thrombosis_prediction
SELECT ID, SEX, Birthday FROM Patient WHERE TP < 6.0	thrombosis_prediction
SELECT (SELECT TP FROM Laboratory WHERE SEX = 'F' AND TP > 8.5) - 8.5	thrombosis_prediction
SELECT * FROM Patient WHERE SEX = 'M' AND (ALB < 3.5 OR ALB > 5.5) ORDER BY Birthday DESC	thrombosis_prediction
SELECT * FROM Patient WHERE YEAR(Birthday) = '1982' AND ALB BETWEEN 3.5 AND 5.5;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE UA > 8.0 AND Sex = 'F' OR UA > 6.5 AND Sex = 'F'	thrombosis_prediction
SELECT AVG(UA) FROM Laboratory WHERE UA < 8.0 AND SEX = 'M' OR UA < 6.5 AND SEX = 'F'	thrombosis_prediction
SELECT ID, SEX, Birthday FROM Patient WHERE UN = 29	thrombosis_prediction
SELECT ID, SEX, Birthday FROM Patient WHERE Diagnosis = 'RA' AND UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND CRE > 1.5	thrombosis_prediction
True	thrombosis_prediction
SELECT MAX(T-BIL) FROM Laboratory	thrombosis_prediction
SELECT Sex, SUM(T-BIL) FROM Laboratory WHERE T-BIL > 2.0 GROUP BY Sex;	thrombosis_prediction
SELECT patient_id, T-CHO FROM Laboratory ORDER BY T-CHO DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(NOW()) - YEAR(birthday)) FROM Patient WHERE gender = 'M' AND `T-CHO` > = 250;	thrombosis_prediction
SELECT * FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE TG > 100;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE TG > 200 AND YEAR(CURRENT_TIMESTAMP) - YEAR(Laboratory.Date) > 50;	thrombosis_prediction
SELECT DISTINCT ID FROM Examination WHERE APTT < 250	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Birthday BETWEEN '1936' AND '1956' AND SEX = 'M' AND CPK > 250	thrombosis_prediction
SELECT ID, SEX, age FROM Patient WHERE (SELECT MAX(GLU) FROM Laboratory WHERE NOT `T-CHO` IS NULL AND `T-CHO` < 250) = (SELECT MAX(GLU) FROM Laboratory WHERE NOT `T-CHO` IS NULL AND `T-CHO` > 180)	thrombosis_prediction
SELECT Patient.ID, Laboratory.GLU FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Description) > = 1991 AND Laboratory.GLU < 180;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.WBC < 3.5 OR Examination.WBC > 9.0 GROUP BY Patient.SEX ORDER BY Patient.Birthday	thrombosis_prediction
SELECT ID, age FROM Patient WHERE RBC < 3.5;	thrombosis_prediction
SELECT * FROM Patient WHERE Sex = 'F' AND age >= 50 AND (RBC < 3.5 OR RBC >= 6.0) AND Admission = '+'	thrombosis_prediction
SELECT ID, SEX FROM Patient WHERE Admission = '-' AND HGB < 10;	thrombosis_prediction
SELECT ID, SEX FROM Patient WHERE Diagnosis = 'SLE' AND HGB < 10 AND HGB > 17 ORDER BY Birthday LIMIT 1;	thrombosis_prediction
SELECT patient.ID, patient.Age FROM patient JOIN (     SELECT patient.ID, patient.Age, COUNT(*) AS c1     FROM patient     JOIN Laboratory ON patient.ID = Laboratory.ID     WHERE patient.Age >= 18     AND Laboratory.HCT > 52     GROUP BY patient.ID, patient.Age     HAVING COUNT(*) > 2 ) AS t1 ON patient.ID = t1.ID ORDER BY patient.Age DESC	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE PLT < 100 - (SELECT COUNT(*) FROM Examination WHERE PLT > 400)	thrombosis_prediction
SELECT * FROM Patient WHERE YEAR(Birthday) < 50 INTERSECT SELECT * FROM Laboratory WHERE PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN PT > = 14 AND Sex = 'F' THEN 1 ELSE 0 END), SUM(PT > = 14)), 1.0) FROM Laboratory WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(Birthday) > 55;	thrombosis_prediction
SELECT * FROM Patient WHERE `First Date` > 1992 AND PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE APTT > 45 AND Thrombosis = 3	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND WBC BETWEEN 3.5 AND 9.0 AND FG < = 150 OR FG > = 450	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND Laboratory.FG < 150 OR Laboratory.FG > 450	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.U-PRO > 30	thrombosis_prediction
SELECT patient_id FROM Examination WHERE `U-PRO` < 30 AND Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` < 900 AND Symptoms = 'abortion'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE IGG BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `aCL IgA` = (SELECT MAX(aCL IgA) FROM Examination WHERE `aCL IgA` BETWEEN 80 AND 500)	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE YEAR(`First Date`) > = 1990 AND IGA BETWEEN 80 AND 500	thrombosis_prediction
SELECT MAX(COUNT(Diagnosis)) FROM Examination WHERE IGM < 40 OR IGM > 400	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE NOT Description IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRP > 1.0 AND YEAR(CURDATE()) - YEAR(Patient.Birthday) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE RVVT = '+-' AND KCT = '+'	thrombosis_prediction
SELECT Disease FROM Examination WHERE YEAR(Birthday) > 1995 AND RA = '-' OR RA = '+-';	thrombosis_prediction
SELECT ID FROM Patient WHERE RF < 20 AND YEAR(CURDATE()) - YEAR(Birthday) > 60	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE RF < 20 AND Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM (SELECT Patient.ID, Examination.ANA_Pattern, Patient.Birthday FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.aCL_IgG > 35 AND Examination.aCL_IgM > 35 AND Examination.ANA_Pattern = 'P') AS t1	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.HCT < 29 OR Examination.HCT > 52 AND Examination.aCL IgA = (SELECT MAX(Examination.aCL IgA) FROM Examination)	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE Thrombosis > 0 AND C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RNP = '-' AND Patient.Admission = '+'	thrombosis_prediction
SELECT Birthday FROM Patient WHERE RNP <> '-' ORDER BY Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE SM = '1' AND Thrombosis = '1';	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND Birthday IN (SELECT MAX(Birthday) FROM Patient WHERE SEX = 'F' AND NOT SM IN('-', '+-')) ORDER BY Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Examination_Date > '1997-01-01' AND Examination.SC170 = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM (SELECT Patient.ID, Patient.SEX, Examination.Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.ANA = '-' AND Examination.T-BIL = '-' AND Examination.T-CHO = '-' AND Patient.SEX = 'M' AND Patient.Symptoms = 'vertigo') AS t1 WHERE t1.ANA = '-' AND t1.T-BIL = '-' AND t1.T-CHO = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE NOT Patient.Description IS NULL AND Patient.First_Date < 1990	thrombosis_prediction
SELECT ID FROM Patient WHERE NOT `First Date` IS NULL ORDER BY `First Date` LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB = '-' AND Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN('-', '+-') AND Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND CENTROMEA IN('-', '+-') AND SSB IN('-', '+-')	thrombosis_prediction
SELECT DISTINCT Diagnosis FROM Examination WHERE `DNA-II` > 8	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE NOT Description IS NULL AND NOT DNA IS NULL AND DNA < 8	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.DNA_II < 8 AND T1.Admission = '+'	thrombosis_prediction
SELECT MULTIPLY(DIVIDE(COUNT(ID WHERE GOT > = 60 AND Diagnosis = 'SLE'), COUNT(ID WHERE GOT > = 60)), 1.0) FROM Laboratory WHERE GOT > = 60 AND Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND GOT < 60	thrombosis_prediction
SELECT MIN(Birthday) FROM Patient WHERE NOT ID IN (SELECT ID FROM Laboratory WHERE GOT > 60);	thrombosis_prediction
SELECT TOP 3 Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT < 60 ORDER BY Patient.Birthday DESC	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT GOT < 60	thrombosis_prediction
SELECT MIN(First Date) FROM Patient WHERE ID IN (SELECT MAX(LDH) FROM Laboratory WHERE LDH < 500);	thrombosis_prediction
SELECT MAX(First Date) FROM Patient WHERE NOT LDH > 500	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND ALP > 300	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '-' AND ALP < 300	thrombosis_prediction
SELECT * FROM Examination WHERE TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'SJS' AND TP > 6.0 AND TP < 8.5	thrombosis_prediction
SELECT MAX(ALB > 3.5 AND ALB < 5.5) AS ExaminationDate FROM Laboratory	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND ALB > 3.5 AND ALB < 5.5 AND TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT MAX(UA > 6.50) AS UricAcidLevel, MAX(aCL IgG) AS aCLigG, MAX(aCL IgM) AS aCLigM, MAX(aCL IgA) AS aCLigA FROM Examination WHERE Sex = 'F';	thrombosis_prediction
SELECT MAX(ANA) FROM Examination WHERE CRE < 1.5	thrombosis_prediction
SELECT Patient.ID  FROM Patient  INNER JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Creatinine < 1.5  AND Examination.ANA = (SELECT MAX(ANA) FROM Examination)	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `T-BIL` > = 2.0 AND ANA Pattern = 'P';	thrombosis_prediction
SELECT MAX(T-BIL) FROM Laboratory WHERE T-BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `T-CHO` > 250 AND KCT = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE ANA_Pattern = 'P' AND T_CHO < 250	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms <> '';	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 ORDER BY T1.TG DESC LIMIT 1	thrombosis_prediction
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+')	thrombosis_prediction
SELECT Birthday FROM Patient WHERE NOT Birthday IS NULL AND (SELECT MAX(Birthday) FROM Patient) = Birthday AND (SELECT MAX(GLU) FROM Laboratory) > 180;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 0 AND GLU < 180	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'SLE' AND WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT ID FROM Examination WHERE RBC < 3.5 OR RBC > 6.0 AND Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE PLT > 100 AND PLT < 400 AND Diagnosis <> '';	thrombosis_prediction
SELECT * FROM Examination WHERE PLT > 100 AND PLT < 400 AND Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(PT) FROM Laboratory WHERE Sex = 'M' AND PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis > 1 AND PT < 14	thrombosis_prediction
SELECT major_name FROM major WHERE department = 'EECS' AND college = 'CSU'	student_club
SELECT COUNT(*) FROM member WHERE position = 'Student_Club' AND college = 'Engineering'	student_club
SELECT T2.first_name, T2.last_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.department = 'Art and Design'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = "Women's Soccer" AND T1.first_name = "Student_Club"	student_club
SELECT T2.phone FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = "Women's Soccer"	student_club
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = "Women's Soccer" AND T1.t_shirt_size = "Medium"	student_club
SELECT event.event_name, MAX(count(attendance.link_to_event)) FROM event, attendance WHERE event.event_id = attendance.link_to_event AND event.event_name = 'Student_Club' GROUP BY event.event_name	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = "Vice President"	student_club
SELECT T2.event_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'McLean'	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND YEAR(T1.event_date) = 2019	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND COUNT(DISTINCT T2.link_to_member) > 10	student_club
SELECT event_name FROM event WHERE attendance > 20	student_club
SELECT AVG(COUNT(DISTINCT event_id)) FROM event WHERE YEAR(event_date) = 2020	student_club
SELECT MAX(cost) FROM expense	student_club
SELECT COUNT(*) FROM member WHERE major = 'Environmental Engineering'	student_club
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = "Laugh Out Loud"	student_club
SELECT last_name FROM member WHERE major = 'Law and Constitutional Studies'	student_club
SELECT county FROM zip_code WHERE city = 'Sherri Ramsey'	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Tyler" AND T1.last_name = "Hewitt"	student_club
SELECT amount FROM income WHERE source = 'Vice President'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed' AND event_name = 'September Meeting'	student_club
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'	student_club
SELECT first_name, last_name FROM member WHERE zip = (SELECT zip FROM zip_code WHERE state = 'Illinois')	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Advertisement' AND event_status = 'Closed' AND event_name = 'September Meeting'	student_club
SELECT DISTINCT department FROM major WHERE major_name IN ('Computer Science', 'Engineering')	student_club
SELECT SUM(amount) FROM budget WHERE event_status = 'Approved' AND event_name = 'October Speaker'	student_club
SELECT COUNT(*) FROM expense WHERE event_id IN (SELECT event_id FROM event WHERE event_name = 'October Meeting' AND event_date = '2019-10-08') AND approved = True	student_club
SELECT AVG(cost) FROM expense WHERE MONTH(expense_date) = 9 OR MONTH(expense_date) = 10 AND link_to_member = 'Elijah Allen'	student_club
SELECT (SELECT SUM(spent) FROM budget WHERE YEAR(event_date) = 2019) - (SELECT SUM(spent) FROM budget WHERE YEAR(event_date) = 2020)	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT cost FROM expense WHERE link_to_event = 'Posters' AND expense_date = '2019-09-04'	student_club
SELECT MAX(budget.amount) FROM budget WHERE budget.category = 'Food'	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'	student_club
SELECT COUNT(*) FROM major WHERE department = "Humanities and Social Sciences"	student_club
SELECT phone FROM member WHERE first_name = "Carlo" AND last_name = "Jacobs"	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Adela" AND T1.last_name = "O'Gallagher"	student_club
SELECT COUNT(*) FROM budget WHERE budget.event_status = 'Approved' AND budget.spent < budget.amount	student_club
SELECT SUM(amount) FROM budget WHERE event_status = 'Cancelled' AND link_to_event = 'September Speaker'	student_club
SELECT T1.status FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20'	student_club
SELECT major_name FROM major WHERE department = 'EECS' AND college = 'MU' AND first_name = 'Brent' AND last_name = 'Thomason'	student_club
SELECT COUNT(*) FROM member WHERE major = 'Human Development and Family Studies' AND t_shirt_size = 'Large'	student_club
SELECT type FROM zip_code WHERE city = 'Christof Nielson'	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T2.position = 'Vice President'	student_club
SELECT zip_code.state FROM zip_code JOIN member ON zip_code.zip = member.zip WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'	student_club
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'	student_club
SELECT date_received FROM income WHERE source = 'Dues'	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (SELECT MIN(member_id) FROM income WHERE source = 'Dues')	student_club
SELECT (SELECT SUM(amount WHERE category = 'Advertisement' AND event_name = 'Yearly Kickoff') FROM budget) - (SELECT SUM(amount WHERE event_name = 'October Meeting' AND category = 'Advertisement') FROM budget)	student_club
SELECT DIVDE(SUM( amount where category = 'Parking' and event_name = 'November Speaker'), COUNT( event_name = 'November Speaker' )) * 100	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(*) FROM zip_code WHERE county = "Orange" AND state = "Virginia"	student_club
SELECT DISTINCT department FROM major WHERE college = 'Humanities and Social Sciences'	student_club
SELECT T2.city, T2.county, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Amy" AND T1.last_name = "Firth"	student_club
SELECT expense_description FROM expense WHERE budget_id = (SELECT budget_id FROM budget ORDER BY remaining LIMIT 1)	student_club
SELECT name FROM member WHERE member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event = 'October Meeting')	student_club
SELECT major.college FROM major GROUP BY major.college ORDER BY COUNT(major.college) DESC LIMIT 1;	student_club
SELECT major_name FROM major WHERE zip = '809-555-3360'	student_club
SELECT event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id GROUP BY T1.event_id ORDER BY SUM(T2.amount) DESC LIMIT 1;	student_club
SELECT expense_description FROM expense WHERE link_to_member = 'Vice President'	student_club
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women's Soccer'	student_club
SELECT date_received FROM income WHERE member_id = 'Casey Mason'	student_club
SELECT COUNT(*) FROM zip_code WHERE state = 'Maryland'	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.phone = "954-555-6240"	student_club
SELECT first_name, last_name FROM member WHERE department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT event_name, MAX(DIVIDE(spent, amount)) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.status = 'Closed' GROUP BY event_name	student_club
SELECT COUNT(*) FROM member WHERE position = 'President'	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food'	student_club
SELECT T2.first_name, T2.last_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.member_id HAVING COUNT(T1.link_to_event) > 7	student_club
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Community Theater' AND T2.major_name = 'Interior Design'	student_club
SELECT first_name, last_name FROM member WHERE zip = (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina')	student_club
SELECT SUM(income.amount) FROM income WHERE income.source = 'Grant Gilmour'	student_club
SELECT first_name, last_name FROM member WHERE income.amount > 40	student_club
SELECT SUM(cost) FROM expense WHERE link_to_event = 'Baseball game'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN budget AS T2 ON T1.member_id = T2.link_to_member WHERE T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.event_status = 'Approved' AND T2.	student_club
SELECT first_name, last_name, source FROM income ORDER BY amount DESC LIMIT 1;	student_club
SELECT event_name FROM event ORDER BY cost LIMIT 1;	student_club
SELECT DIVIDE(SUM(cost WHERE event_name = 'Yearly Kickoff'), SUM(cost)) * 100	student_club
SELECT DIVDE(SUM(major_name = 'Finance'), SUM(major_name = 'Physics')) FROM major WHERE department = 'Business'	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(*) FROM member WHERE major = 'Physics Teaching'	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND YEAR(T1.event_date) = 2019	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = "Luisa" AND T3.last_name = "Guidi"	student_club
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Advertisement' GROUP BY T1.event_id ORDER BY SUM(T2.spent) DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean' AND T1.event_name = 'Women''s Soccer'	student_club
SELECT SUM(type = 'Community Service') / COUNT(event_id) * 100 FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31' AND event_name = 'Student_Club'	student_club
SELECT expense_cost FROM expense WHERE expense_description = 'Posters' AND link_to_event = 'September Speaker'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T1.status = 'Closed' AND T2.remaining < 0 GROUP BY T1.event_name ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT SUM(cost) FROM expense WHERE event_id IN (SELECT event_id FROM event WHERE event_name = 'October Meeting') AND approved = 'Yes'	student_club
SELECT category, SUM(amount) FROM budget WHERE link_to_event = 'April Speaker' GROUP BY category ORDER BY SUM(amount)	student_club
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT budget_id, category, spent, remaining, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT SUM(income.amount) AS total_cost, member.first_name, member.last_name FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.member_id = 'rec4BLdZHS2Blfp4v'	student_club
SELECT expense_description FROM expense WHERE link_to_member = 'Sacha Harrison'	student_club
SELECT DISTINCT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'	student_club
SELECT zip_code FROM member WHERE expense_cost < 50	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Phillip" AND T1.last_name = "Cullen"	student_club
SELECT position FROM member WHERE major = 'Business'	student_club
SELECT COUNT(*) FROM member WHERE major_name = 'Business' AND t_shirt_size = 'Medium'	student_club
SELECT T1.type FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining > 30	student_club
SELECT event_category FROM event WHERE location = 'MU 215'	student_club
SELECT category FROM event WHERE event_date = '2020-03-24T12:00:00'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT DIVIDE(SUM(position = 'Member' AND major_name = 'Mathematics'), COUNT(member_id)) * 100	student_club
SELECT category FROM event WHERE location = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT COUNT(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'Agriculture and Applied Sciences'	student_club
SELECT T2.last_name, T1.department, T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.major_name = 'Environmental Engineering'	student_club
SELECT budget.category FROM budget, event WHERE budget.spent = 0 AND event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.link_to_event = event.event_id	student_club
SELECT T2.city, T2.state FROM major AS T1 JOIN zip_code AS T2 ON T1.major_id = T2.major_id WHERE T1.department = 'Electrical and Computer Engineering'	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T3.zip = '900 E. Washington St.' AND T1.type = 'Social'	student_club
SELECT T2.last_name, T2.position FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'	student_club
SELECT T2.last_name FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Women''s Soccer'	student_club
SELECT percentage FROM member WHERE t_shirt_size = 'Medium' AND position = 'Member' AND amount = 50	student_club
SELECT county, state, short_state FROM zip_code WHERE type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'Puerto Rico'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT link_to_event FROM expense WHERE cost > 50	student_club
SELECT T1.first_name, T1.last_name, T2.link_to_event FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.approved = 'true' AND T2.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T2.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T2.first_name = "Katy" AND T1.major_name = "rec1N0upiVLy5esTO"	student_club
SELECT phone FROM member WHERE major_name = 'Business' AND college = 'College of Agriculture and Applied Sciences'	student_club
SELECT email FROM member WHERE link_to_expense IN (SELECT link_to_expense FROM expense WHERE expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND cost > 20)	student_club
SELECT COUNT(*) FROM member WHERE major = 'education' AND college = 'Education & Human Services'	student_club
SELECT DIVIDE(SUM(remaining < 0), COUNT(event_id)) * 100 FROM budget WHERE event_status = 'over budget'	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT * FROM expense WHERE DIVIDE( SUM(cost), COUNT(expense_id) ) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT DIVIDE(SUM(type = 'PO Box'), COUNT(zip_code)) * 100 FROM zip_code WHERE type = 'PO Box'	student_club
SELECT T1.event_name, T1.location FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining > 0	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100	student_club
SELECT T1.first_name, T1.last_name, T1.major_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > 100	student_club
SELECT T1.city, T1.country FROM zip_code AS T1 JOIN event AS T2 ON T1.zip_code = T2.zip_code WHERE T2.income > 50	student_club
SELECT T1.first_name, T1.last_name, MAX(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(DISTINCT T2.link_to_event) > 1	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member NOT IN (SELECT member_id FROM member WHERE position = 'Member')	student_club
SELECT event_name FROM event WHERE cost < (SELECT AVG(cost) FROM expense WHERE category = 'Parking')	student_club
SELECT SUM(cost) / COUNT(event_id) * 100 FROM expense WHERE event_status = 'Game'	student_club
SELECT budget_id FROM expense WHERE expense_description = 'Water, chips, cookies' ORDER BY cost DESC LIMIT 1	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 5	student_club
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT (SELECT SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END) FROM member) - (SELECT SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) FROM member)	student_club
SELECT major_name, department FROM major WHERE major_id IN (SELECT major_id FROM member WHERE first_name = 'Garrett' AND last_name = 'Gerke')	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT last_name, phone FROM member WHERE major = 'Elementary Education'	student_club
SELECT budget.category, budget.amount FROM budget WHERE budget.link_to_event = 'rec0akZnLLpGUloLH'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Food'	student_club
SELECT first_name, last_name, amount FROM income WHERE date_received = '2019-09-09'	student_club
SELECT budget.category FROM budget, expense WHERE expense.expense_description = 'Posters' AND expense.link_to_budget = budget.budget_id	student_club
SELECT first_name, last_name, college FROM member WHERE position = 'Secretary'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Speaker Gifts'	student_club
SELECT zip_code.city FROM zip_code JOIN member ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Girke'	student_club
SELECT first_name, last_name FROM member WHERE zip = 28092	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT Currency, COUNT(*) AS Ratio FROM customers WHERE Currency IN ('EUR', 'CZK') GROUP BY Currency;	debit_card_specializing
SELECT CustomerID, MIN(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' GROUP BY CustomerID	debit_card_specializing
SELECT AVG(Consumption) FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME' AND Currency = 'EUR');	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, SUM(y.Consumption) AS Total_Consumption FROM customers c INNER JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID, c.Segment, c.Currency ORDER BY Total_Consumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Segment = 'KAM' AND t2.Consumption < 30000 AND YEAR(t2.Date) = 2012;	debit_card_specializing
SELECT (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')) - (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR'))	debit_card_specializing
SELECT Date, MAX(Consumption) FROM yearmonth WHERE Currency = 'EUR' GROUP BY Date;	debit_card_specializing
SELECT Segment FROM yearmonth GROUP BY Segment ORDER BY SUM(Consumption) LIMIT 1;	debit_card_specializing
SELECT Date, MAX(Consumption) FROM yearmonth WHERE Currency = 'CZK' GROUP BY Date;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2013%';	debit_card_specializing
SELECT (SELECT AVG(Consumption) FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') GROUP BY CustomerID) - (SELECT AVG(Consumption) FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM' AND Currency = 'CZK') GROUP BY CustomerID) - (SELECT AVG(Consumption) FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM' AND Currency = 'CZK') GROUP BY CustomerID)	debit_card_specializing
SELECT Segment, MAX(Consumption) AS Max_Consumption, MIN(Consumption) AS Min_Consumption, MAX(Consumption) - MIN(Consumption) AS Increase, MAX(Consumption) - MIN(Consumption) * 100 / MAX(Consumption) AS Percentage_Increase FROM yearmonth WHERE Date BETWEEN '201201' AND '201312' AND Currency = 'EUR' GROUP BY Segment ORDER BY Percentage_Increase DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201308' AND '201311' AND CustomerID = 6;	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'Czech Republic' AND Segment = 'discount') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'discount')	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE Date = '201304' AND CustomerID = 7) - (SELECT Consumption FROM yearmonth WHERE Date = '201304' AND CustomerID = 5)	debit_card_specializing
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') - (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR')	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date = '201310' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM' AND Currency = 'EUR');	debit_card_specializing
SELECT CustomerID, MAX(Consumption) FROM yearmonth GROUP BY CustomerID;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE Date = '201305'	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Segment = 'LAM' AND Consumption > 46.73;	debit_card_specializing
SELECT Country, COUNT(*) AS "Value for Money" FROM gasstations WHERE Segment = 'Value for Money' GROUP BY Country ORDER BY COUNT(*) DESC;	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Segment = 'KAM' AND Currency = 'EUR';	debit_card_specializing
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Consumption > 528.3	debit_card_specializing
SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'premium';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY SUM(Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT Segment FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Date = '201309' GROUP BY t1.Segment ORDER BY SUM(t2.Consumption) LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, MIN(y.Consumption) AS Consumption FROM customers c INNER JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' GROUP BY c.CustomerID, c.Segment, c.Currency;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE YEAR(Date) = 2012	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Currency = 'EUR'	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN yearmonth AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Date = '201309';	debit_card_specializing
SELECT T2.Country FROM transactions AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '201306';	debit_card_specializing
SELECT DISTINCT T1.ChainID FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'EUR';	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Price = 1	debit_card_specializing
SELECT AVG(Amount) FROM transactions_1k WHERE Date LIKE '%2012-01%'	debit_card_specializing
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Currency = 'EUR' AND t2.Consumption > 1000;	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T3.Country = 'CZE'	debit_card_specializing
SELECT Time FROM transactions_1k WHERE GasStationID = 11	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE') AND Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE TIME(Date) > '2012-01-01' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE')	debit_card_specializing
SELECT AVG(Amount) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE');	debit_card_specializing
SELECT AVG(Amount) FROM transactions WHERE Currency = 'EUR';	debit_card_specializing
SELECT CustomerID, MAX(Amount) FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID;	debit_card_specializing
SELECT Country, MIN(Date) FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE YEAR(Date) = 2012 AND MONTH(Date) = 8 AND Day(Date) = 25 GROUP BY Country ORDER BY Date LIMIT 1;	debit_card_specializing
SELECT T2.Currency FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '16:25:00'	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T3.Date = '2012-08-23' AND T2.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date LIKE '2012-08-26' AND Price = 'EUR';	debit_card_specializing
SELECT Segment FROM customers ORDER BY CustomerID LIMIT 1;	debit_card_specializing
SELECT Country FROM gasstations WHERE Date = '2012-08-24 12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions WHERE Date = '2012-08-23' AND TIME = '21:20:00';	debit_card_specializing
SELECT SUM(Consumption) AS total_spent, Date FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24') AND Date = '2012-01-01';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date BETWEEN '2012-08-26 08:00:00' AND '2012-08-26 09:00:00' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE');	debit_card_specializing
SELECT Currency FROM customers WHERE CustomerID IN (SELECT CustomerID FROM yearmonth WHERE Date LIKE '201306%')	debit_card_specializing
SELECT Country FROM gasstations WHERE GasStationID = 667467	debit_card_specializing
SELECT T2.Segment, T2.Currency FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Amount = 548.4;	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Currency = 'EUR' AND Date = '2012-08-25';	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-25' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8)) - (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-24' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8))	debit_card_specializing
SELECT GasStationID FROM transactions_1k GROUP BY GasStationID ORDER BY SUM(Amount) DESC LIMIT 1;	debit_card_specializing
SELECT Segment, COUNT(*) AS Premium FROM customers WHERE Segment = 'SVK' GROUP BY Segment;	debit_card_specializing
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508;	debit_card_specializing
SELECT ProductID, Description, SUM(Amount) AS Total_Sales FROM transactions_1k JOIN products ON transactions_1k.ProductID = products.ProductID GROUP BY ProductID, Description ORDER BY Total_Sales DESC LIMIT 5;	debit_card_specializing
SELECT CustomerID, AVG(Price) AS AveragePrice FROM transactions GROUP BY CustomerID ORDER BY AveragePrice DESC LIMIT 1;	debit_card_specializing
SELECT Country FROM gasstations WHERE GasStationID = (SELECT GasStationID FROM transactions_1k WHERE ProductID = 2)	debit_card_specializing
SELECT Consumption FROM yearmonth WHERE Date LIKE '%201208%' AND ProductID = 5 AND Amount > 29.00	debit_card_specializing
