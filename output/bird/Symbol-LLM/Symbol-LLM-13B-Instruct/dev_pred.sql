SELECT MAX(EligibleFreeRate) FROM frpm WHERE County = "Alameda"
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM frpm ORDER BY `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` LIMIT 3
SELECT Zip FROM schools WHERE County = "Fresno" AND Charter = 1
SELECT T2.MailStreet, T2.MailStrAbr FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.FRPMCount (K-12) DESC LIMIT 1
SELECT Phone FROM schools WHERE Charter = 1 AND OpenDate > '2000-01-01'
SELECT COUNT(*) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath < 400 AND T1.Virtual = 'F'
SELECT s.School, s.Magnet FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.Enroll12 > 500 AND s.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.Enroll12 > 1500 ORDER BY T1.Enroll12 DESC LIMIT 1
SELECT s.School, COUNT(*) AS "Number of SAT Test Takers" FROM satscores s INNER JOIN frpm f ON s.cds = f.CDSCode INNER JOIN schools s2 ON f.CDSCode = s2.CDSCode WHERE s2.FRPMCount(K-12) = (SELECT MAX(FRPMCount(K-12)) FROM frpm) GROUP BY s.School
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.Charter = 1
SELECT T2.CDSCode, T2.FRPMCount FROM satscores AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)
SELECT cds FROM schools WHERE Enrollment(K-12) + Enrollment(Ages 5-17) > 500
SELECT MAX(Percent(%) Eligible FRPM(Ages 5-17)) FROM frpm WHERE Enrollment(Ages 5-17) > 0
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead DESC LIMIT 3
SELECT cds, enroll12 FROM satscores ORDER BY enroll12 DESC LIMIT 5
SELECT DISTINCT DistrictName, AVG(satscores.AvgScrRead) AS AvgReadingScore FROM satscores INNER JOIN schools ON satscores.CDS = schools.CDSCode WHERE satscores.rtype = 'Reading' GROUP BY DistrictName ORDER BY AvgReadingScore DESC LIMIT 1
SELECT COUNT(*) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Alameda' AND T2.NumTstTakr < 100
SELECT T2.CharterNum FROM satscores AS T1 JOIN schools AS T2 ON T1.CDS = T2.CDSCode WHERE T1.AvgScrWrite = 499
SELECT COUNT(*) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = "Contra Costa" AND T2.NumTstTakr <= 250
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY AVG(T1.AvgScrMath) DESC LIMIT 1
SELECT COUNT(*) FROM frpm WHERE County = "Amador" AND LowGrade = 9 AND HighGrade = 12
SELECT COUNT(*) FROM frpm WHERE County = "Los Angeles" AND FreeMealCount < 700 AND Enrollment(K-12) > 500
SELECT s.School, s.CDSCode, COUNT(*) AS NumTstTakr FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.rtype = 'Contra Costa' GROUP BY s.School, s.CDSCode ORDER BY NumTstTakr DESC LIMIT 1
SELECT School, Street_Abr, Street, City, Zip, State, MailStreet, MailStrAbr, MailCity, MailZip, MailState, Phone, Ext, Website, OpenDate, ClosedDate, Charter, CharterNum, FundingType, DOC, DOCType, SOC, SOCType, EdOpsCode, EdOpsName, EILCode, EILName, GSoffered, GSserved, Virtual, Magnet, Latitude, Longitude, AdmFName1, AdmLName1, AdmEmail1, AdmFName2, AdmLName2, AdmEmail2, AdmFName3, AdmLName3, AdmEmail3 FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE (Enrollment(K-12) - Enrollment(Ages 5-17)) > 30
SELECT T2.School, T2.SchoolName FROM satscores AS T1 JOIN schools AS T2 ON T1.CDS = T2.CDSCode WHERE T1.AvgScrRead >= 1500 AND T1.PctGE1500 > 0.1
SELECT T2.FundingType FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = "Riverside" AND AVG(AVG(T1.Satscores.AvgScrMath)) > 400
SELECT T2.Street, T2.City, T2.State, T2.Zip, T2.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = "Monterey" AND T1.SchoolType = "High" AND T1.Enrollment(Ages 15-17) > 800
SELECT School, AVG(satscores.AvgScrWrite) AS AvgScore FROM satscores WHERE satscores.CDSCode IN (     SELECT School     FROM schools     WHERE School.OpenDate > 1991 OR School.ClosedDate < 2000 ) GROUP BY School
SELECT School, DOCType FROM schools WHERE (Enrollment(K-12) - Enrollment(Ages 5-17)) > (SELECT AVG(Enrollment(K-12) - Enrollment(Ages 5-17)) FROM schools WHERE FundingType = 'Local')
SELECT OpenDate FROM schools ORDER BY Enroll12 DESC LIMIT 1
SELECT City, MIN(Enrollment) AS Enrollment FROM schools WHERE Enrollment >= 12 GROUP BY City ORDER BY Enrollment LIMIT 5
SELECT `School Name`, `Percent (%) Eligible Free (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10, 11
SELECT `School Name`, `FRPM Count (K-12)` / `Enrollment (K-12)` AS EligibleFreeReducedPriceMealRate FROM frpm WHERE `School Type` = 66 ORDER BY `FRPM Count (K-12)` DESC LIMIT 5
SELECT School, Website FROM schools WHERE Enrollment(Ages 5-17) BETWEEN 1900 AND 2000
SELECT FRPMCount, PercentEligibleFRPM FROM frpm WHERE SchoolName = 'Kacey Gibson' AND AgeBetween5and17 = 1
SELECT AdmEmail1 FROM schools WHERE Charter = 1 ORDER BY Enrollment (K-12) LIMIT 1
SELECT T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr >= 1500 GROUP BY T1.CDSCode ORDER BY T2.AvgScrRead DESC LIMIT 1
SELECT T1.Street, T1.City, T1.Zip, T1.State FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead LIMIT 1
SELECT T2.Website FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = "Los Angeles" AND T1.Enrollment >= 2000 AND T1.Enrollment <= 3000
SELECT AVG(satscores.NumTstTakr) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.County = "Fresno" AND satscores.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T1.CDSCode = T3.CDS GROUP BY T1.CDSCode ORDER BY AVG(T3.AvgScrRead) LIMIT 1
SELECT cds, AVG(AvgScrRead) AS AvgRead, AVG(AvgScrMath) AS AvgMath, AVG(AvgScrWrite) AS AvgWrite, COUNT(*) AS NumTstTakr FROM satscores WHERE cds IN (SELECT cds FROM schools WHERE Virtual = 'F') GROUP BY cds ORDER BY AvgRead DESC LIMIT 5
SELECT EdOpsName FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
SELECT AVG(AvgScrMath) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY AVG(AvgScrMath) LIMIT 1
SELECT T1.City, AVG(T1.AdmEmail1) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.CDS WHERE T2.Enroll12 >= 1500 GROUP BY T1.City ORDER BY T2.Enroll12 DESC LIMIT 1
SELECT s.School, AVG(s.AvgScrWrite) FROM satscores AS s INNER JOIN schools AS s2 ON s.cds = s2.CDSCode WHERE s2.AdmEmail1 = 'Ricci.Ulrich@example.com' GROUP BY s.School
SELECT State, COUNT(*) AS Enrollment FROM schools WHERE DOC = 31 AND Enrollment = (SELECT MAX(Enrollment) FROM schools WHERE DOC = 31) GROUP BY State
SELECT AVG(COUNT(DISTINCT schools.CDSCode)) FROM frpm, schools WHERE frpm.DistrictType = 'Elementary' AND frpm.SchoolType = 'Regular' AND frpm.County = 'Alameda' AND frpm.AcademicYear = 1980 AND schools.CDSCode = frpm.CDSCode AND schools.OpenDate > '1980-01-01' AND schools.OpenDate < '1980-12-31' GROUP BY MONTH(schools.OpenDate)
SELECT (SELECT COUNT(*) FROM frpm WHERE County = "Orange" AND DistrictType = "Unified" AND SchoolType = "Elementary") / (SELECT COUNT(*) FROM frpm WHERE County = "Orange" AND DistrictType = "Elementary" AND SchoolType = "Elementary")
SELECT County, COUNT(*) AS "Number of Closed Schools" FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Street, T2.City, T2.Zip, T2.State, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState, T2.Phone, T2.Ext, T2.Website, T2.OpenDate, T2.ClosedDate, T2.Charter, T2.CharterNum, T2.FundingType, T2.SOC, T2.SOCType, T2.EdOpsCode, T2.EdOpsName, T2.EILCode, T2.EILName, T2.GSoffered, T2.GSserved, T2.Virtual, T2.Magnet, T2.Latitude, T2.Longitude, T2.AdmFName1, T2.AdmLName1, T2.AdmEmail1, T2.AdmFName2, T2.AdmLName2, T2.AdmEmail2, T2.AdmFName3, T2.AdmLName3, T2.AdmEmail3 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY T1.AvgScrMath DESC LIMIT 6, 1
SELECT T2.MailStreet, T2.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T2.School ORDER BY AVG(T1.AvgScrRead) LIMIT 1
SELECT COUNT(*) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500 AND T1.MailCity = "Lakeport"
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Fresno'
SELECT School, MailZip FROM schools WHERE SOCType = 'Avetik Atoian'
SELECT (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Colusa') / (SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'Humboldt')
SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'San Joaquin' AND StatusType = 'Active'
SELECT T2.Phone, T2.Ext FROM satscores AS T1 JOIN schools AS T2 ON T1.CDS = T2.CDSCode GROUP BY T1.CDS ORDER BY AVG(T1.AvgScrWrite) DESC LIMIT 333
SELECT Phone, Ext FROM schools WHERE Zip = "95203-3704"
SELECT Website FROM schools WHERE AdmFName1 = "Mike Larson" AND AdmLName1 = "Dante Alvarez"
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin'
SELECT COUNT(*) FROM schools WHERE City = "Hickman" AND DOC = 52 AND Charter = 1
SELECT COUNT(*) FROM frpm WHERE County = "Los Angeles" AND `Free Meal Count (K-12)` * 100 / `Enrollment (K-12)` < 0.18
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmEmail1, T2.School, T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T1.CharterNum = '00D2'
SELECT COUNT(*) FROM schools WHERE MailCity = "Hickman" AND CharterNum = "00D4"
SELECT (SELECT COUNT(*) FROM frpm WHERE County = "Santa Clara" AND CharterFundingType = "Locally Funded" AND SchoolType = "Charter") / (SELECT COUNT(*) FROM frpm WHERE County = "Santa Clara" AND CharterFundingType <> "Locally Funded" AND SchoolType = "Charter") * 100
SELECT COUNT(*) FROM schools WHERE County = "Stanislaus" AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND FundingType = 'Directly Funded'
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND ClosedDate LIKE '%1989%'
SELECT County, COUNT(*) AS ClosedSchools FROM schools WHERE OpenDate BETWEEN '1980-01-01' AND '1989-12-31' AND SOC = 11 GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1
SELECT NCESSchool FROM schools WHERE SOC = 31
SELECT COUNT(*) FROM frpm WHERE County = "Alpine" AND DistrictType = "Community Day School"
SELECT DistrictCode FROM schools WHERE City = "Fresno" AND Magnet = 0
SELECT SUM(Enrollment) FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.EdOpsCode = 'SSS' AND T1.AcademicYear = '2014-2015' AND T1.CountyName = 'Fremont' AND T1.DistrictName = 'State Special School' AND T1.SchoolType = 'K-12' AND T1.EducationalOptionType = 'Regular'
SELECT `Free Meal Count (Ages 5-17)` FROM frpm WHERE `School Name` = 'Youth Authority'
SELECT MIN(LowGrade) FROM frpm WHERE District = 613360 AND EdOpsCode = 'SPECON'
SELECT T2.EducationalOptionType FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CountyCode = 37 AND T1.NSLPProvisionStatus = 2
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.LowGrade = 9 AND T1.HighGrade = 12 AND T1.CountyName = "Merced" AND T1.EducationalOptionType = "2" AND T2.EducationalOptionType = "HS"
SELECT SchoolName, Percent(%)Eligible FRPM(Ages 5-17) FROM frpm WHERE County = "Los Angeles" AND SchoolType = "K-9"
SELECT GSoffered, COUNT(*) AS cnt FROM schools WHERE City = "Adelanto" GROUP BY GSoffered ORDER BY cnt DESC LIMIT 1
SELECT County, COUNT(*) FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1
SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1
SELECT School, MIN(LowGrade) FROM frpm WHERE State = 'CA' GROUP BY School
SELECT AdmFName1, AdmLName1, AdmEmail1, AdmFName2, AdmLName2, AdmEmail2, AdmFName3, AdmLName3, AdmEmail3 FROM schools ORDER BY Longitude DESC LIMIT 1
SELECT COUNT(*), City, COUNT(*) FROM schools WHERE Magnet = 1 AND (Kindergarten = 1 OR Grade = 1) AND (Grade = 8 OR Grade = 8) GROUP BY City
SELECT AdmFName1, AdmLName1, District FROM schools GROUP BY AdmFName1, AdmLName1 ORDER BY COUNT(*) DESC LIMIT 2
SELECT DISTINCT T1.DistrictCode, T1.Percent_Eligible_Free_K_12 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine'
SELECT T1.AdmLName2, T1.District, T1.County, T1.School FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.CharterNum = 40
SELECT AdmEmail1 FROM schools WHERE County = "San Bernardino" AND District = "San Bernardino City Unified" AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND SOC = 62 AND DOC = 54
SELECT T2.AdmEmail1, T1.School FROM satscores AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AvgScrRead >= 1500 GROUP BY T2.CDSCode ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'POPLATEK PO OBRATU') AND date > (SELECT MAX(date) FROM trans)
SELECT COUNT(*) FROM district WHERE A3 = 'Prague'
SELECT MAX(A12) FROM district WHERE A12 <> '' AND A12 <> 'null'
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000
SELECT COUNT(*) FROM client WHERE gender = 'M' AND A3 = 'North Bohemia' AND A11 > 8000
SELECT account_id, AVG(A11) AS avg_salary FROM client WHERE gender = 'F' GROUP BY account_id ORDER BY avg_salary LIMIT 1
SELECT account_id FROM client ORDER BY birth_date DESC LIMIT 10
SELECT COUNT(*) FROM client WHERE gender = 'Owner' AND district_id IN (SELECT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')
SELECT * FROM client WHERE gender = 'POPLATEK PO OBRATU'
SELECT account_id, MIN(amount) AS min_amount FROM loan WHERE date LIKE "%1997%" GROUP BY account_id HAVING COUNT(*) = 1 ORDER BY min_amount
SELECT account_id, MAX(amount) FROM loan WHERE duration > 12 AND account_id IN (SELECT account_id                   FROM account                   WHERE date LIKE "1993%") GROUP BY account_id
SELECT COUNT(*) FROM client WHERE birth_date < 1950 AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Slokolov') AND gender = 'F'
SELECT * FROM account WHERE date LIKE '1995%' ORDER BY date LIMIT 1
SELECT * FROM account WHERE date < 1997 AND amount > 3000
SELECT client_id FROM card WHERE issued = '1994/3/3'
SELECT date FROM account WHERE account_id = (SELECT account_id FROM trans WHERE amount = 840 AND date = '1998-10-14')
SELECT district_id FROM account WHERE date = '1994-08-25'
SELECT MAX(T2.amount) FROM card AS T1 JOIN trans AS T2 ON T1.card_id = T2.card_id WHERE T1.issued = '1996-10-21'
SELECT T1.gender FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.district_id = (SELECT MAX(district_id) FROM account) ORDER BY T1.birth_date LIMIT 1
SELECT amount FROM trans WHERE account_id IN (SELECT account_id FROM loan ORDER BY amount DESC LIMIT 1) AND type = 'debit' ORDER BY date LIMIT 1
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM branch WHERE A2 = 'Jesenik' AND A5 = 'F') AND gender = 'F'
SELECT disp_id FROM trans WHERE amount = 5100 AND date = '1998/9/2'
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date < 1996
SELECT district_id FROM client WHERE birth_date = '1976-01-29'
SELECT birth_date FROM client WHERE client_id = (SELECT loan_id FROM loan WHERE amount = 98832 AND date = '1996-01-03')
SELECT account_id FROM account WHERE district_id = (SELECT district_id FROM district WHERE A3 = 'Prague' ORDER BY date LIMIT 1) ORDER BY date LIMIT 1
SELECT district_id, COUNT(client_id) AS clients, COUNT(client_id) AS male_clients, COUNT(client_id) AS female_clients, COUNT(client_id) AS male_clients_percentage FROM client WHERE district_id = (SELECT district_id FROM district WHERE A3 = 'South Bohemia' AND A4 = (SELECT MAX(A4) FROM district WHERE A3 = 'South Bohemia')) GROUP BY district_id
SELECT (SELECT SUM(trans.amount) FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.client_id = (SELECT client_id FROM client WHERE client_id = (SELECT client_id FROM loan WHERE loan_id = (SELECT loan_id FROM loan WHERE date = '1993-07-05'))) AND trans.date BETWEEN '1993-03-22' AND '1998-12-27') / (SELECT SUM(trans.amount) FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.client_id = (SELECT client_id FROM client WHERE client_id = (SELECT client_id FROM loan WHERE loan_id = (SELECT loan_id FROM loan WHERE date = '1993-07-05'))) AND trans.date BETWEEN '1993-03-22' AND '1998-12-27') * 100
SELECT (SELECT SUM(amount) FROM loan WHERE status = 'A' AND payments > 0) / (SELECT SUM(amount) FROM loan) * 100
SELECT (SELECT SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) FROM loan WHERE amount < 100000) * 100.0 / (SELECT SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) FROM loan)
SELECT account_id, district_name, district_region FROM account WHERE date > (SELECT MAX(date) FROM trans) AND frequency = '1993'
SELECT account_id, COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'East' AND A4 = 'Bohemia' AND A5 = '1995' AND A6 = '2000') GROUP BY account_id
SELECT account_id, date FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Prachatice')
SELECT district.A2, district.A3 FROM district, loan WHERE loan.district_id = district.district_id AND loan.loan_id = 4990
SELECT account_id, district_id, region_id FROM district WHERE A2 = 'New York' AND A3 = 'Manhattan' INNER JOIN loan ON loan.district_id = district_id WHERE loan.amount > 300000
SELECT loan_id, district_id, AVG(A11) FROM loan WHERE duration = 60 GROUP BY district_id
SELECT district.A2, district.A3, district.A4, district.A5, district.A6, district.A7, district.A8, district.A9, district.A10, district.A11, district.A12, district.A13, district.A14, district.A15, district.A16 FROM district, loan WHERE loan.status = 'D' AND loan.district_id = district.district_id AND loan.date BETWEEN '1995-01-01' AND '1996-12-31'
SELECT A2, COUNT(A2) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date = 1993 GROUP BY A2
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT district_id, COUNT(*) AS female_account_holders FROM account WHERE gender = 'F' GROUP BY district_id ORDER BY female_account_holders DESC LIMIT 10
SELECT district_id, SUM(amount) AS sum_withdraws FROM trans WHERE date LIKE '1996-01%' AND type = 'VYDAJ' GROUP BY district_id ORDER BY sum_withdraws DESC LIMIT 10
SELECT COUNT(*) FROM client WHERE NOT client_id IN (SELECT client_id FROM disp WHERE type = 'credit')
SELECT district_id FROM loan WHERE status = 'C' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(amount) FROM loan WHERE gender = 'M'
SELECT A2, A13 FROM district WHERE A13 = (SELECT MAX(A13) FROM district)
SELECT SUM(A16) FROM district WHERE A16 = (SELECT MAX(A16) FROM district)
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK MESICNE' AND date < (SELECT MAX(date) FROM account WHERE frequency = 'POPLATEK MESICNE' AND balance < 0)
SELECT COUNT(*) FROM loan WHERE date BETWEEN '1995-01-01' AND '1997-12-31' AND amount >= 250000 AND frequency = 'POPLATEK MESICNE'
SELECT COUNT(*) FROM loan WHERE status = 'C' AND bank = 'Branch 1'
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM crime_stats WHERE year = 1995 GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 2, 1)
SELECT COUNT(*) FROM card WHERE type = 'gold'
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Pisek'
SELECT DISTINCT T1.A2, T1.A3, T1.A4, T1.A5, T1.A6, T1.A7, T1.A8, T1.A9, T1.A10, T1.A11, T1.A12, T1.A13, T1.A14, T1.A15, T1.A16 FROM district AS T1 JOIN trans AS T2 ON T1.district_id = T2.district_id WHERE T2.amount > 10000 AND T2.date = 1997
SELECT account_id FROM order WHERE k_symbol = 'SIPO'
SELECT * FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'gold' INTERSECT SELECT * FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'junior'
SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date BETWEEN '2021-01-01' AND '2021-12-31'
SELECT account_id FROM account WHERE frequency = 'monthly' AND date BETWEEN '1998-01-01' AND '1998-12-31' AND amount < (SELECT AVG(amount) FROM account WHERE frequency = 'monthly' AND date BETWEEN '1998-01-01' AND '1998-12-31')
SELECT * FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T1.client_id = T3.client_id WHERE T1.gender = 'F' AND T3.type = 'credit' INTERSECT SELECT * FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T1.client_id = T3.client_id
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'south Bohemia')
SELECT * FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Tabor') AND type = 'OWNER'
SELECT type FROM account WHERE NOT account_id IN (SELECT account_id FROM loan) AND district_id IN (SELECT district_id FROM district WHERE A11 BETWEEN 8000 AND 9000) AND type <> 'OWNER'
SELECT COUNT(*) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id IN (SELECT district_id FROM district WHERE A3 = 'North Bohemia') AND T2.bank = 'AB'
SELECT T1.A2 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'
SELECT AVG(A15) FROM district WHERE A2 = '1995' AND A9 > 4000 AND A12 > 0
SELECT COUNT(*) FROM card WHERE type = 'classic' AND disp_id IN (SELECT disp_id FROM disp WHERE account_id IN (SELECT account_id FROM loan))
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha') AND gender = 'M'
SELECT COUNT(type) FROM card WHERE type = 'gold' AND issued < 1998
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T2.account_id = T3.account_id GROUP BY T1.client_id ORDER BY SUM(T3.amount) DESC LIMIT 1
SELECT district_id, A15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532)
SELECT T1.district_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 3356) AND operation = 'VYBER'
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND date BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 WEEK, CURDATE()) AND CURDATE() AND amount < 200000
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 13539)
SELECT district_id FROM client WHERE client_id = 3541
SELECT district_id FROM account WHERE status = 'A' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT account.client_id, account.district_id, account.frequency, account.date FROM account JOIN order ON account.account_id = order.account_id WHERE order.order_id = 32423
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5)
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik')
SELECT DISTINCT T1.client_id FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'junior' AND T2.issued > '1996-01-01'
SELECT AVG(A11) FROM district WHERE A11 > 10000 SELECT AVG(A11) FROM district WHERE A11 > 10000
SELECT SUM(amount_1997) - SUM(amount_1996) / SUM(amount_1996) * 100 AS growth_rate FROM loan WHERE account_id IN (SELECT account_id FROM client WHERE gender = 'M') AND date BETWEEN '1996-01-01' AND '1997-12-31'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > 1995
SELECT (SELECT A16 FROM district WHERE A2 = 'North' AND A3 = 'Bohemia') - (SELECT A16 FROM district WHERE A2 = 'East' AND A3 = 'Bohemia')
SELECT COUNT(*) FROM account WHERE account_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
SELECT frequency, SUM(amount) FROM account WHERE account_id = 3 GROUP BY frequency
SELECT birth_date FROM client WHERE client_id = 130
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU'
SELECT SUM(t1.amount) AS total_debt, SUM(t1.payments) AS total_payments FROM loan AS t1 JOIN client AS t2 ON t1.client_id = t2.client_id WHERE t2.client_id = 992
SELECT SUM(t1.amount) FROM account AS t1 JOIN client AS t2 ON t1.client_id = t2.client_id JOIN trans AS t3 ON t1.account_id = t3.account_id WHERE t2.client_id = 4 AND t3.trans_id = 851
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 9)
SELECT SUM(amount) FROM trans WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 617) AND date LIKE "%1998%"
SELECT client_id, birth_date FROM client WHERE birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'East Bohemia')
SELECT loan_id FROM loan WHERE status = 'paid' GROUP BY loan_id ORDER BY SUM(amount) DESC LIMIT 3
SELECT COUNT(*) FROM client WHERE gender = 'M' AND birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND district_id IN (SELECT district_id FROM loan WHERE amount > 4000)
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > 1996
SELECT COUNT(*) FROM client WHERE gender = 'F' AND type = 'junior'
SELECT COUNT(*) AS count,        (SELECT COUNT(*) FROM client         WHERE gender = 'F' AND district_id IN (SELECT district_id FROM account                                             WHERE bank = 'Prague')) /         (SELECT COUNT(*) FROM client          WHERE district_id IN (SELECT district_id FROM account                              WHERE bank = 'Prague')) * 100 FROM client WHERE district_id IN (SELECT district_id FROM account                      WHERE bank = 'Prague')
SELECT COUNT(*) * 100.0 / COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT DISTINCT district_id FROM account WHERE frequency = 'POPLATEK TYDNE')
SELECT COUNT(*) FROM client WHERE frequency = 'POPLATEK TYDNE'
SELECT account_id, MIN(amount) AS min_amount FROM loan WHERE duration > 24 AND account_id IN (SELECT account_id FROM account                   WHERE date < 1997) GROUP BY account_id
SELECT account_id FROM client WHERE gender = 'F' ORDER BY A11 LIMIT 1
SELECT COUNT(*) FROM client WHERE birth_date = 1920 AND district_id IN (SELECT district_id FROM district WHERE A3 = 'East Bohemia')
SELECT COUNT(*) FROM loan WHERE duration = 24 AND payments = 'POPLATEK TYDNE'
SELECT AVG(amount) FROM loan WHERE status = 'C' AND type = 'POPLATEK PO ORAÇU'
SELECT T1.client_id, T1.district_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'permanent' OR T2.type = 'loan'
SELECT T1.client_id, T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'gold' AND T2.account_id IN (SELECT account_id FROM loan)
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(*) FROM atom WHERE element = 'cl'
SELECT AVG(element = 'o') FROM atom WHERE bond_type = '-'
SELECT AVG(bond_type = '-') FROM bond
SELECT COUNT(*) FROM molecule AS t1 JOIN atom AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.element = 'na' AND t1.label = '-'
SELECT * FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+'
SELECT DIVIDE(SUM(element = 'c'), COUNT(atom_id)) FROM atom WHERE bond_type = ' = ';
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR099'
SELECT molecule_id FROM atom WHERE element = 'si'
SELECT element FROM atom WHERE bond_id = 'TR004_8_9'
SELECT element FROM atom WHERE bond_type = ' = ';
SELECT label FROM atom WHERE element = 'h' GROUP BY label ORDER BY COUNT(label) DESC LIMIT 1
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te')
SELECT atom_id FROM connected WHERE bond_type = '-'
SELECT DISTINCT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-'))
SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) LIMIT 1
SELECT bond_type FROM bond WHERE atom_id = 'TR004_8' AND atom_id = 'TR004_20'
SELECT label FROM molecule WHERE NOT molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'sn')
SELECT COUNT(*) FROM atom WHERE element = 'i' OR element = 's' AND NOT molecule_id IS NULL
SELECT atom_id, atom_id2, bond_id FROM connected WHERE bond_type = '#'
SELECT DISTINCT atom_id FROM connected WHERE molecule_id = 'TR181'
SELECT DIVIDE(SUM(element = 'f'), COUNT(molecule_id)) AS percent FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND element != 'f'
SELECT DIVIDE(COUNT(bond_id) FROM bond WHERE bond_type = '#' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')), COUNT(bond_id) FROM bond WHERE bond_type = '#' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6'
SELECT ABS(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) FROM molecule
SELECT atom_id FROM bond WHERE bond_id = 'TR_000_2_5'
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2'
SELECT T2.label FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' = ' ORDER BY T2.label
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(bond_id)) AS percent FROM bond WHERE molecule_id = 'TR008'
SELECT DIVIDE(SUM(label = '+'), COUNT(molecule_id)) AS percent FROM molecule
SELECT SUM(element = 'h') FROM atom WHERE molecule_id = 'TR206'
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT element FROM atom WHERE molecule_id = 'TR060'
SELECT bond_type, COUNT(*) AS count FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type ORDER BY count DESC LIMIT 1
SELECT T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = '-' ORDER BY T1.label
SELECT bond_id, bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type
SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR009' AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12')
SELECT COUNT(*) FROM molecule WHERE label = '+' AND element = 'br'
SELECT bond_type, atom_id, atom_id2 FROM bond WHERE bond_id = 'TR001_6_9'
SELECT molecule_id FROM atom WHERE atom_id = 'TR001_10'
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19'
SELECT element FROM atom WHERE molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT molecule_id FROM atom WHERE SUBSTRING(atom_id, 7, 2) BETWEEN 21 AND 25 AND element = '+'
SELECT * FROM atom WHERE element = 'p' INTERSECT SELECT * FROM atom WHERE element = 'n'
SELECT molecule_id FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(bond_id) FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'i')
SELECT bond_type, bond_id FROM bond WHERE atom_id = 45
SELECT element FROM atom WHERE NOT atom_id IN (SELECT atom_id FROM connected);
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.label = 'TR447' AND T2.bond_type = '#'
SELECT element FROM atom WHERE molecule_id = 'TR144_8_19'
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' GROUP BY T1.label ORDER BY COUNT(*) DESC LIMIT 1
SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) LIMIT 1
SELECT DISTINCT atom_id FROM atom WHERE element = 'pb'
SELECT element FROM bond WHERE bond_type = '#'
SELECT DIVIDE(COUNT(bond_id), COUNT(atom_id WHERE MAX(COUNT(atom_id)) = 2)) FROM bond
SELECT DIVIDE(SUM(label = '+'), COUNT(bond_id)) FROM bond WHERE bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN('c', 'h')
SELECT atom_id2 FROM atom WHERE element = 's'
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'sn')
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-')
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '#' AND element = 'p' OR element = 'br')
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT molecule_id FROM bond WHERE bond_type = '-'
SELECT DIVIDE(SUM(element = 'cl'), COUNT(atom_id)) AS percent FROM atom WHERE bond_type = '-'
SELECT label FROM molecule WHERE molecule_id = 'TR000' OR molecule_id = 'TR001' OR molecule_id = 'TR002'
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030'
SELECT bond_type FROM bond WHERE molecule_id IN ('TR000', 'TR001', 'TR002', 'TR003', 'TR004', 'TR005', 'TR006', 'TR007', 'TR008', 'TR009', 'TR010', 'TR011', 'TR012', 'TR013', 'TR014', 'TR015', 'TR016', 'TR017', 'TR018', 'TR019', 'TR020', 'TR021', 'TR022', 'TR023', 'TR024', 'TR025', 'TR026', 'TR027', 'TR028', 'TR029', 'TR030', 'TR031', 'TR032', 'TR033', 'TR034', 'TR035', 'TR036', 'TR037', 'TR038', 'TR039', 'TR040', 'TR041', 'TR042', 'TR043', 'TR044', 'TR045', 'TR046', 'TR047', 'TR048', 'TR049', 'TR050') SELECT bond_type FROM bond WHERE molecule_id IN ('TR000', 'TR001', 'TR002', 'TR003', 'TR004', 'TR005', 'TR006', 'TR007', 'TR008', 'TR009', 'TR010', 'TR011', 'TR012', 'TR013', 'TR014', 'TR015', 'TR016', 'TR017', 'TR018', 'TR019', 'TR020', 'TR021', 'TR022', 'TR023', 'TR024', 'TR025', 'TR026', 'TR027', 'TR028', 'TR029',
SELECT element FROM atom WHERE bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM atom WHERE element = 'i'
SELECT MAX(label) FROM molecule WHERE element = 'ca'
SELECT * FROM atom WHERE atom_id = 'TR001_1_8'
SELECT molecule_id FROM bond WHERE bond_type = '#' AND element = 'c'
SELECT DIVIDE(SUM(element = 'pb'), COUNT(molecule_id)) AS percentage FROM atom WHERE label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001'
SELECT molecule_id FROM bond WHERE bond_type = ' = ';
SELECT atom_id, atom_id2 FROM connected WHERE bond_type = '#'
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR005_16_26')
SELECT COUNT(*) FROM molecule AS t1 JOIN bond AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.bond_type = '-' AND t1.label = '-'
SELECT label FROM molecule WHERE molecule_id = 'TR001_10_11'
SELECT bond_id FROM bond WHERE bond_type = '#'
SELECT COUNT(DISTINCT atom_id) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND substr(atom_id, 7, 1) = 4 AND element = 'c'
SELECT label FROM molecule WHERE molecule_id = 'TR006'
SELECT * FROM molecule WHERE element = 'ca' AND label = '+'
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te')
SELECT DISTINCT T1.element FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT DIVIDE(SUM(bond_type = ' = '), COUNT(all bond_id)) AS percent FROM bond WHERE molecule_id = 'TR047'
SELECT * FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1') AND label = '+'
SELECT * FROM molecule WHERE label = '+'
SELECT * FROM atom WHERE element = 'c'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE substr(molecule_id, 3, 3) BETWEEN 'TR010' AND 'TR050') AND element = 'c'
SELECT COUNT(*) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT bond_id FROM bond WHERE bond_type = ' = '
SELECT COUNT(*) FROM atom WHERE element = 'h' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT molecule_id FROM bond WHERE bond_type = 'TR00_1_2' AND atom_id = (SELECT atom_id FROM bond WHERE bond_type = 'TR00_1_2' AND atom_id = 'TR00_1')
SELECT atom_id FROM atom WHERE element = 'c' EXCEPT SELECT atom_id FROM atom WHERE label = '-'
SELECT DIVIDE(SUM(CASE WHEN element = 'h' AND label = '+' THEN 1 ELSE NULL END), COUNT(molecule_id)) * 100.0 AS percentage FROM molecule
SELECT * FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE molecule_id = 'TR007_4_19'
SELECT element FROM atom WHERE molecule_id = 'TR001_2_4'
SELECT COUNT(*) FROM bond WHERE bond_type = ' = ' AND molecule_id = 'TR006'
SELECT * FROM molecule WHERE label = '+' AND element = 'c' OR element = 'h' OR element = 'o' OR element = 's' OR element = 'n' OR element = 'p' OR element = 'na' OR element = 'br' OR element = 'f' OR element = 'i' OR element = 'sn' OR element = 'pb' OR element = 'te' OR element = 'ca'
SELECT T1.atom_id, T1.atom_id2, T2.label FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = 'single bond'
SELECT DISTINCT T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*) FROM atom WHERE element = 'cl'
SELECT atom_id, COUNT(DISTINCT bond_type) FROM bond WHERE molecule_id = 'TR346' GROUP BY atom_id
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.label = '+'
SELECT COUNT(*) FROM molecule WHERE NOT label LIKE '%s%' AND NOT molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = ' = ')
SELECT label FROM molecule WHERE molecule_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT * FROM atom WHERE element = 'cl'
SELECT * FROM atom WHERE element = 'c' EXCEPT SELECT * FROM molecule WHERE label = '-'
SELECT DIVIDE(SUM(CASE WHEN label = '+' AND element = 'cl' THEN 1 ELSE NULL END), COUNT(molecule_id)) AS percentage FROM molecule
SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_1_7'
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id = 'TR001_3_4'
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2')
SELECT molecule_id FROM atom WHERE atom_id = "TR000_2"
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000'
SELECT DIVIDE(SUM(bond_type = '-'), COUNT(bond_id)) AS percentage FROM bond WHERE bond_type = '-'
SELECT COUNT(*) FROM molecule WHERE element = 'n' AND label = '+'
SELECT * FROM atom WHERE element = 's' AND bond_type = ' = ';
SELECT COUNT(*) FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.label = '-' AND COUNT(T1.atom_id) > 5
SELECT element FROM atom WHERE molecule_id = 'TR024' AND bond_type = '='
SELECT molecule_id FROM atom GROUP BY molecule_id ORDER BY COUNT(atom_id) DESC LIMIT 1
SELECT DIVIDE(SUM(label = '+'), COUNT(molecule_id)) * 100.0 FROM molecule WHERE element = 'h' AND bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT element FROM atom WHERE atom_id = 'TR004_7'
SELECT COUNT(*) FROM molecule AS t1 JOIN bond AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.bond_type = ' = ' AND t1.element = 'o';
SELECT COUNT(*) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.bond_id = '#'
SELECT element, bond_type FROM bond WHERE molecule_id = 'TR016'
SELECT atom_id FROM connected WHERE bond_id = ' = ' AND molecule_id = 'TR012'
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+' AND element = 'o')
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL
SELECT * FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL
SELECT name FROM cards WHERE convertedManaCost > (SELECT MAX(convertedManaCost) FROM cards)
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = 2015
SELECT cards.name FROM cards WHERE cards.rarity = 'mythic' AND cards.text LIKE '%banned%' AND cards.types LIKE '%gladiator%'
SELECT DISTINCT legalities.status FROM legalities INNER JOIN cards ON legalities.uuid = cards.uuid WHERE cards.types = 'Artifact' AND cards.side = 'NULL' AND legalities.format = 'vintage'
SELECT cards.id, cards.artist FROM cards WHERE cards.power = '*' OR cards.power IS NULL AND cards.format = 'commander' AND legalities.status = 'Legal' AND legalities.format = 'commander' AND legalities.uuid = cards.uuid
SELECT cards.name, rulings.text FROM cards, rulings WHERE cards.artist = 'Stephen Daniele' AND rulings.cardKingdomFoilId = cards.mtgjsonV4Id AND rulings.cardKingdomId = cards.mtgjsonV4Id AND rulings.scryfallId = cards.scryfallId AND rulings.scryfallOracleId = cards.scryfallOracleId AND rulings.scryfallIllustrationId = cards.scryfallIllustrationId AND rulings.text LIKE '%hasContentWarning%'
SELECT * FROM rulings WHERE cardName = 'Sublime Epiphany' AND number = '74s'
SELECT T1.name, T1.artist, T1.promoTypes FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.name, T1.artist ORDER BY COUNT(T2.uuid) DESC LIMIT 1
SELECT DISTINCT foreign_data.language FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'annul' AND cards.number = '29'
SELECT * FROM "cards" WHERE "foreign_data"."language" = 'japanese'
SELECT SUM(id) AS total, COUNT(id) AS chinese_simplified, SUM(id) * 100.0 / COUNT(id) AS percentage FROM cards WHERE language = 'Chinese Simplified'
SELECT T1.name, T1.totalSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Italian'
SELECT COUNT(*) FROM "cards" WHERE "artist" = 'aaron boyd'
SELECT keywords FROM cards WHERE name = "Angel of Mercy"
SELECT COUNT(*) FROM cards WHERE power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = "Ancestor's Chosen"
SELECT originalType FROM cards WHERE name = "Ancestor's Chosen"
SELECT DISTINCT T1.language FROM foreign_data AS T1 JOIN sets AS T2 ON T1.multiverseid = T2.id JOIN card_sets AS T3 ON T2.setCode = T3.setCode WHERE T3.name = 'Angel of Mercy'
SELECT COUNT(*) FROM legalities WHERE status = 'restricted' AND isTextless = 0
SELECT rulings.text FROM rulings WHERE rulings.cardKingdomFoilId = 'Condemn'
SELECT COUNT(*) FROM cards WHERE cards.isStarter = 1 AND cards.isOnlineOnly = 1
SELECT legalities.status FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE cards.name = "Cloudchaser Eagle"
SELECT card.type FROM card WHERE card.name = 'Benalish Knight'
SELECT DISTINCT legalities.format FROM legalities INNER JOIN cards ON legalities.uuid = cards.uuid WHERE cards.name = 'Benalish Knight'
SELECT artist FROM cards WHERE name = 'Phyrexian'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless'
SELECT COUNT(*) FROM cards WHERE language = 'german' AND isReprint = 1
SELECT COUNT(*) FROM "cards" WHERE "borderColor" = 'borderless' AND "language" = 'Russian'
SELECT COUNT(*) FROM cards WHERE language = 'French' AND isStorySpotlight = 1
SELECT COUNT(*) FROM cards WHERE toughness = 99
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM "cards" WHERE borderColor = 'black' AND availability = 'mtgo'
SELECT id FROM cards WHERE convertedManaCost = 0
SELECT layout FROM cards WHERE keywords = 'flying'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes <> 'Angel';
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrecRank FROM "cards" WHERE frameVersion = 2015
SELECT artist FROM cards WHERE language = 'zh-CN'
SELECT cards.name FROM cards WHERE cards.availability = 'paper' AND cards.language = 'Japanese';
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND status = 'Banned'
SELECT cards.uuid, foreign_data.language FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.format = 'legacy'
SELECT rulings.text FROM rulings WHERE rulings.cardKingdomFoilId = 'beacon of immortality'
SELECT COUNT(*) FROM cards WHERE frameVersion = 'future' AND status = 'legal';
SELECT cards.colorIdentity, cards.colors FROM cards WHERE cards.setCode = 'OGW'
SELECT T1.name FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'en' AND T1.convertedManaCost = 5
SELECT T1.name, T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.id = T2.cardId WHERE T1.originalType = 'Creature - Elf'
SELECT colors FROM cards WHERE id BETWEEN 1 AND 20
SELECT cards.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.originalType = 'Artifact' AND cards.colors = 'B' AND foreign_data.language = 'foreign'
SELECT cards.name FROM cards, rulings WHERE cards.rarity = 'uncommon' AND rulings.text LIKE '%' + cards.name + '%' ORDER BY rulings.date
SELECT COUNT(*) FROM cards WHERE artist = "John Avon" AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1
SELECT COUNT(*) FROM cards WHERE availability = 'paper' AND frameVersion = '1993' AND hasContentWarning = 1
SELECT manaCost FROM cards WHERE layout = 'normal' AND availability = 'paper' AND availability = 'mtgo' AND borderColor = 'black' AND frameVersion = '2003'
SELECT SUM(cards.manaCost) FROM cards WHERE cards.artist = 'Rob Alexander'
SELECT DISTINCT card.type, card.subtypes, card.supertypes FROM cards WHERE card.availability = 'arena'
SELECT T1.setCode FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = "es"
SELECT DIVIDE(COUNT(hand = '+3'), COUNT(id)) FROM cards WHERE frameEffects = 'legendary'
SELECT id, COUNT(*) AS count FROM cards WHERE isStorySpotlight = 1 AND isTextless = 1 GROUP BY id ORDER BY count DESC
SELECT name, DIVIDE(SUM(id), COUNT(id)) * 100 AS percentage FROM cards WHERE language = 'Spanish' GROUP BY name
SELECT DISTINCT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T1.baseSetSize = 309
SELECT COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Portuguese (Brasil)' AND T1.block = 'Commander'
SELECT * FROM cards WHERE types = 'Creature' AND legal = 'legal' ORDER BY id
SELECT DISTINCT card.type FROM card, set_translations, sets WHERE set_translations.language = 'german' AND set_translations.setCode = sets.setCode AND sets.type = 'card' AND sets.type IN (SELECT DISTINCT card.type FROM card WHERE card.subtypes IS NOT NULL AND card.supertypes IS NOT NULL)
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards WHERE (side IS NULL OR (side <> "0" AND side <> "1")) AND (text LIKE '%This is a triggered mana ability%' OR text LIKE '%This is a triggered mana ability%')
SELECT cardId FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper'
SELECT artist FROM "cards" WHERE text = "Das perfekte Gegenmittel zu einer dichten Formation"
SELECT name FROM "cards" WHERE language = 'French' AND borderColor = 'black' AND artist = 'Matthew D. Wilson' AND type = 'Creature' AND layout = 'normal'
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND text LIKE '%ruling text%' AND date = '2009-01-10'
SELECT T1.language FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.id WHERE T2.block = 'Ravnica' AND T2.baseSetSize = 180
SELECT DIVIDE(COUNT(hasContentWarning = 0),COUNT(id))*100 FROM cards WHERE format = 'commander' AND status = 'legal';
SELECT DIVIDE(COUNT(language = 'French' AND power IS NULL OR power = '*'), COUNT(power IS NULL OR power = '*')) * 100 FROM cards WHERE power IS NULL OR power = '*'
SELECT DIVIDE(COUNT(language = 'Japanese'),COUNT(language))*100 FROM set_translations WHERE type = 'expansion'
SELECT "cards".printings FROM "cards" WHERE "cards".artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000
SELECT COUNT(*) FROM cards WHERE isOversized = 1 OR isReprint = 1 OR isPromo = 1
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name
SELECT foreign_data.language FROM foreign_data WHERE foreign_data.multiverseid = 149934
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId <> '' AND cardKingdomId <> '' ORDER BY cardKingdomFoilId
SELECT DIVIDE(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END), COUNT(CASE WHEN isTextless = 1 THEN 1 END)) * 100 FROM cards WHERE isTextless = 1 AND layout = 'normal'
SELECT COUNT(*) FROM "cards" WHERE "side" IS NULL AND "subtypes" = 'Angel' AND "subtypes" = 'Wizard'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name
SELECT DISTINCT language FROM foreign_data WHERE name = 'Archenemy' AND type = 'set'
SELECT T1.name, T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T1.id = 5
SELECT language, type FROM sets WHERE id = 206
SELECT T1.id, T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = "Italian" AND T1.block = "Shadowmoor" ORDER BY T1.name LIMIT 2
SELECT T1.id FROM sets AS T1 JOIN "foreign_data" AS T2 ON T1.id = T2.id WHERE T2.language = 'Japanese' AND T1.isFoilOnly = 1 AND T1.isForeignOnly = 1
SELECT MAX(baseSetSize) FROM sets WHERE language = 'Russian'
SELECT COUNT(*) FROM "cards" WHERE "foreign_data"."language" = 'chinese_simplified' AND "cards"."isOnlineOnly" = 1
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND mtgoCode IS NULL OR mtgoCode = '';
SELECT COUNT(id) FROM cards WHERE borderColor = 'black'
SELECT COUNT(*), id FROM cards WHERE frameEffects = 'extendedart'
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1
SELECT language FROM "foreign_data" WHERE "foreign_data".setCode = 174
SELECT name FROM sets WHERE code = "ALL"
SELECT foreign_data.language FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'A Pedra Fellwar'
SELECT setCode FROM sets WHERE releaseDate = "07/13/2007"
SELECT baseSetSize, setCode FROM sets WHERE block = "Masques" AND block = "Mirage"
SELECT setCode FROM sets WHERE type = 'expansion'
SELECT card.name, card.type FROM card WHERE card.watermark = 'boros'
SELECT flavorText, language FROM foreign_data WHERE text LIKE '%colorpie%'
SELECT DIVIDE(COUNT(convertedManaCost = 10),COUNT(convertedManaCost))*100 FROM cards WHERE setCode = 'Abyssal Horror'
SELECT setCode FROM sets WHERE type = 'Expansion Commander'
SELECT card.name, card.type FROM card WHERE card.watermark = 'abzan'
SELECT "cards".text, "cards".type FROM "cards" WHERE "cards".watermark = 'azorius'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE availability = 'paper' AND hand = '+'
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND power = '*' OR power IS NULL
SELECT name FROM cards WHERE isPromo = 1 AND side <> '0' GROUP BY name HAVING COUNT(*) > 1
SELECT DISTINCT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND (availability LIKE '%arena%' OR availability LIKE '%mtgo%')
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT t.name FROM sets AS t WHERE t.name = (SELECT cards.setCode FROM cards WHERE cards.name = 'Ancestor\'s Chosen')
SELECT COUNT(*) FROM set_translations AS T1 JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T2.name = 'Angel of Mercy'
SELECT T2.name FROM set_translations AS T1 JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T1.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Ancestor\'s Chosen' AND T2.language = 'Korean'
SELECT COUNT(*) FROM "cards" AS T1 JOIN "set_translations" AS T2 ON T1.setCode = T2.setCode JOIN "sets" AS T3 ON T2.setCode = T3.id WHERE T3.name = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'
SELECT baseSetSize FROM sets WHERE setCode = 'Hauptset Zehnte Edition'
SELECT translation FROM set_translations WHERE setCode = 'Eighth Edition' AND language = 'Simplified Chinese'
SELECT (SELECT COUNT(*) FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL) > 0
SELECT releaseDate FROM sets WHERE name = 'Ancestor''s Chosen'
SELECT type FROM sets WHERE name = "Hauptset Zehnte Edition"
SELECT COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Italian' AND T1.block = 'Ice Age'
SELECT (SELECT COUNT(*) FROM "cards" WHERE "name" = 'Adarkar Valkyrie' AND "isForeignOnly" = 1) > 0
SELECT COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Italian' AND T1.baseSetSize < 10
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND borderColor = 'black'
SELECT name FROM cards WHERE setCode = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE setCode = 'Coldsnap'
SELECT * FROM cards WHERE setCode = 'Coldsnap' AND number = 4
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND convertedManaCost > 5 AND (power = '*' OR T1.power IS NULL)
SELECT flavorText FROM "cards" WHERE name = 'Ancestor''s Chosen' AND language = 'Italian'
SELECT DISTINCT foreign_data.language FROM foreign_data INNER JOIN cards ON foreign_data.cardId = cards.id WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.text IS NOT NULL
SELECT types FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT rulings.text FROM rulings WHERE rulings.language = 'Italian' AND rulings.date IS NULL AND rulings.text IS NULL AND rulings.uuid IS NULL
SELECT name FROM cards WHERE setCode = 'Coldsnap' AND language = 'Italian' ORDER BY convertedManaCost DESC LIMIT 1
SELECT rulings.date FROM rulings WHERE rulings.text = 'Reminisce'
SELECT SUM(convertedManaCost) FROM cards WHERE setCode = 'Coldsnap' AND convertedManaCost = 7
SELECT DIVIDE(SUM(CASE WHEN cardKingdomFoilId = cardKingdomId THEN 1 ELSE 0 END), SUM(CASE WHEN name = 'Coldsnap' THEN 1 ELSE 0 END)) * 100 AS percentage_incredibly_powerful FROM cards WHERE name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = "PKHC"
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = "2017/6/9"
SELECT type FROM sets WHERE name = "From the Vault: Lore"
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT cards.name, cards.text, rulings.text FROM cards, rulings WHERE cards.artist = 'Jim Pavelec' AND rulings.uuid = cards.uuid AND rulings.text LIKE '%missing or degraded properties and values%'
SELECT releaseDate FROM sets WHERE name = 'Evacuation'
SELECT COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.translation = 'Rinascita di Alara'
SELECT sets.type FROM sets WHERE sets.name = "Huitième édition"
SELECT T2.name FROM "cards" AS T1 JOIN "set_translations" AS T2 ON T1.setCode = T2.setCode WHERE T1.name = "Tendo Ice Bridge" AND T2.language = "French"
SELECT COUNT(*) FROM set_translations WHERE set_translations.setCode = 'Salvat 2011'
SELECT T2.name FROM foreign_data AS T1 JOIN sets AS T2 ON T1.setCode = T2.setCode WHERE T1.language = 'Japanese' AND T1.name = 'Fellwar Stone'
SELECT name FROM cards WHERE setCode = 'Journey into Nyx Hero''s Path' ORDER BY convertedManaCost DESC LIMIT 1
SELECT releaseDate FROM sets WHERE name = "Ola de frío"
SELECT DISTINCT tcgplayerGroupId FROM sets WHERE name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards WHERE setCode = 'World Championship Decks 2004' AND convertedManaCost = '3'
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setCode = 'Mirrodin'
SELECT SUM(isNonFoilOnly) FROM "cards" WHERE language = 'Japanese'
SELECT SUM(isOnlineOnly) FROM "cards" WHERE language = "Portuguese (Brazil)"
SELECT DISTINCT printings FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1 AND availability != '0'
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT MAX(frameEffects) FROM cards WHERE cardKingdomFoilId <> '' AND cardKingdomId <> '' GROUP BY cardKingdomFoilId ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE power IS NULL AND hasFoil = 0 AND duelDeck = 'a'
SELECT MAX(id) FROM sets WHERE type = 'commander'
SELECT name, manaCost FROM cards WHERE format = 'duel' ORDER BY manaCost DESC LIMIT 10
SELECT MIN(originalReleaseDate) AS "release_date", rarity, status FROM cards WHERE rarity = 'mythic' AND status = 'legal' GROUP BY rarity, status ORDER BY originalReleaseDate
SELECT COUNT(*) FROM "cards" WHERE "cards".artist = 'Volkan Baga' AND "cards".language = 'French'
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND types = 'Enchantment' AND name = 'Abundance' AND status = 'Legal'
SELECT format, name FROM cards WHERE status = 'banned' GROUP BY format ORDER BY COUNT(*) DESC LIMIT 1
SELECT language FROM set_translations WHERE setCode = 'Battlebond'
SELECT illustrator, format FROM cards GROUP BY illustrator ORDER BY COUNT(*) LIMIT 1
SELECT status FROM cards WHERE frameVersion = '1997' AND artist = 'D. Alexander Gregory' AND hasContentWarning = 1 AND format = 'legacy'
SELECT name FROM cards WHERE edhrecRank = 1 AND status = 'banned' AND format = 'play'
SELECT AVG(id) FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY language ORDER BY MAX(COUNT(language)) DESC LIMIT 1
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena'
SELECT cards.uuid FROM cards WHERE cards.format = 'oldschool' AND cards.status = 'banned' OR cards.status = 'restricted'
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT * FROM rulings WHERE cardKingdomFoilId IN (SELECT cardKingdomFoilId FROM "cards" WHERE artist = 'Kev Walker') ORDER BY date DESC
SELECT T1.name, T3.format FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode JOIN legalities AS T3 ON T2.setCode = T3.setCode WHERE T2.setName = 'Hour of Devastation'
SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Korean' EXCEPT SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Japanese'
SELECT DISTINCT frameVersion, name FROM cards WHERE artist = 'Allen Williams' AND NOT status IS NULL
SELECT DisplayName, MAX(Reputation) AS HighestReputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY DisplayName
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1
SELECT COUNT(*) FROM users WHERE Views > 10 AND CreationDate > 2013
SELECT COUNT(*) FROM users WHERE DisplayName = 'csgillespie'
SELECT Title FROM posts WHERE OwnerUserId = '##UserId##'
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts'
SELECT Title FROM posts WHERE OwnerUserId = '##UserId##' ORDER BY ViewCount DESC LIMIT 1
SELECT OwnerDisplayName FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT SUM(CommentCount) FROM posts WHERE OwnerUserId = '##UserId##'
SELECT COUNT(*) FROM posts WHERE OwnerUserId = '##UserId##' AND PostTypeId = 2
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL
SELECT OwnerDisplayName FROM posts WHERE ClosedDate IS NOT NULL
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Age > 65 AND p.Score > 20
SELECT Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts')
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian')
SELECT p.Body FROM posts AS p WHERE p.Id = (SELECT t.ExcerptPostId FROM tags AS t ORDER BY t.Count DESC LIMIT 1)
SELECT COUNT(*) FROM badges WHERE Name = 'csgillespie'
SELECT Name FROM badges WHERE UserId = '##UserId##'
SELECT COUNT(*) FROM badges WHERE YEAR(Date) = 2011 AND UserId = '##UserId##'
SELECT DisplayName FROM users WHERE Id = (SELECT MAX(UserId) FROM badges)
SELECT AVG(Score) FROM posts WHERE OwnerUserId = '##UserId##'
SELECT AVG(COUNT(Id)) AS Average_Badges FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Views > 200)
SELECT COUNT(Id) AS "count", CAST(COUNT(Id) AS FLOAT) / (SELECT COUNT(*) FROM users WHERE Age > 65) * 100 AS "percentage" FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE posts.Score > 20 AND users.Age > 65
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE OwnerUserId = 58) AND CreationDate = '2010-07-19'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'
SELECT p.Title FROM posts AS p INNER JOIN comments AS c ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments)
SELECT COUNT(*) FROM comments WHERE PostId = 1910
SELECT COUNT(*) FROM votes WHERE PostId = 123456 AND VoteTypeId = 5 AND CreationDate = '2014/4/23 20:29:39.0'
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1
SELECT * FROM comments WHERE UserId = 23853 AND CreationDate = '2013-07-12 09:08:18.0'
SELECT Reputation FROM users WHERE Id = 65041
SELECT COUNT(*) FROM users WHERE DisplayName = 'Tiago Pasqualini'
SELECT DisplayName FROM users WHERE Id = 381800
SELECT COUNT(*) FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'DatEpicCoderGuyWhoPrograms')
SELECT COUNT(p.Id) / COUNT(v.Id) FROM posts AS p INNER JOIN users AS u ON p.OwnerUserId = u.Id INNER JOIN votes AS v ON p.Id = v.PostId WHERE u.Id = '24'
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT * FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT Name FROM badges WHERE UserId = '##UserId##'
SELECT PostId, Text FROM comments WHERE Text LIKE '%thank you user93%'
SELECT * FROM comments WHERE UserId = '##UserId##'
SELECT u.DisplayName, u.Reputation FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'
SELECT * FROM comments WHERE PostId = 10144
SELECT u.DisplayName FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Necromancer'
SELECT OwnerUserId FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data'
SELECT Title FROM posts WHERE LastEditorUserId = 101
SELECT SUM(Score) AS total_score, WebsiteUrl FROM users INNER JOIN postHistory ON postHistory.UserId = Users.Id WHERE Users.DisplayName = 'Yevgeny' AND postHistory.PostHistoryTypeId = 5 GROUP BY WebsiteUrl
SELECT c.Text FROM comments c INNER JOIN postHistory h ON c.PostId = h.PostId INNER JOIN posts p ON h.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND h.UserId = '##UserId##'
SELECT SUM(BountyAmount) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data%')
SELECT u.DisplayName, p.Title, v.CreationDate, v.PostId, v.BountyAmount FROM users AS u INNER JOIN posts AS p ON p.OwnerUserId = u.Id INNER JOIN votes AS v ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%' AND v.CreationDate > '2019-01-01' ORDER BY v.CreationDate DESC
SELECT AVG(ViewCount) FROM posts WHERE Tags LIKE '%humor%'
SELECT COUNT(*) FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT Id FROM users ORDER BY Views LIMIT 1
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND Date >= '2011-01-01' AND Date < '2012-01-01'
SELECT COUNT(UserId) FROM badges WHERE Count(Name) > 5
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%' AND (SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND UserId = users.Id) > 0 AND (SELECT COUNT(*) FROM badges WHERE Name = 'Teacher' AND UserId = users.Id) > 0
SELECT u.DisplayName, u.Reputation FROM users AS u WHERE u.Id = 1
SELECT u.Id AS "user_link", COUNT(p.Id) AS "posts", u.Views, u.Reputation, u.Location FROM users AS u INNER JOIN postHistory AS ph ON ph.UserId = u.Id INNER JOIN posts AS p ON p.Id = ph.PostId WHERE ph.PostHistoryTypeId = 5 AND u.Reputation > 1000 GROUP BY u.Id, u.Reputation, u.Views, u.Location HAVING COUNT(p.Id) = 1 AND u.Views > 1000 ORDER BY u.Reputation DESC
SELECT u.DisplayName, COUNT(c.Id) AS Comments FROM users u INNER JOIN comments c ON c.UserId = u.Id GROUP BY u.Id, u.DisplayName ORDER BY Comments DESC LIMIT 100
SELECT COUNT(*) FROM users WHERE Location LIKE '%India%' AND Badges.Name = 'Teacher'
SELECT (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2010) - (SELECT COUNT(Name) FROM badges WHERE YEAR(Date) = 2011)
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId
SELECT * FROM postLinks WHERE PostId = 61217
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395
SELECT PostId, OwnerUserId FROM posts WHERE Score > 60
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND CreationDate = 2011
SELECT AVG(UpVotes) AS avg_upvotes, AVG(Age) AS avg_age FROM users WHERE Count(UserId) > 10
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08'
SELECT COUNT(*) FROM comments WHERE Score > 60
SELECT * FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(*) FROM posts WHERE Score = 10
SELECT b.Name FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT u.Reputation FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT Name FROM badges AS b WHERE b.UserId = (SELECT Id FROM users WHERE DisplayName = 'Pierre')
SELECT DISTINCT b.Date FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE u.Location LIKE '%Rochester, NY%'
SELECT COUNT(UserId) AS "Teacher", COUNT(UserId) AS "Total Users" FROM badges WHERE Name = 'Teacher'
SELECT COUNT(UserId) AS "count", COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN UserId END) AS "count_teenagers" FROM users WHERE EXISTS (SELECT * FROM badges WHERE Name = 'Organizer' AND UserId = users.Id) GROUP BY UserId
SELECT Score FROM comments WHERE PostId = 123456 AND CreationDate = '2010-07-19 19:19:56.0'
SELECT Text FROM comments WHERE PostId = 123456 AND CreationDate = '2010-07-19 19:37:33.0'
SELECT Age FROM users WHERE Location = 'Vienna, Austria' AND Reputation > 1000
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND Reputation >= 15000
SELECT SUM(Views) FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = '##name##' AND Date = '2010-07-19 19:39:08.0')
SELECT b.Name FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')
SELECT COUNT(*) FROM users WHERE Age > 65 AND EXISTS(SELECT * FROM badges WHERE badges.UserId = users.Id AND badges.Name = 'Supporter')
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%'
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 10
SELECT DIVIDE(COUNT(Id) FROM votes WHERE YEAR(CreationDate) = 2010, COUNT(Id) FROM votes WHERE YEAR(CreationDate) = 2011)
SELECT t.TagName FROM users AS u INNER JOIN tags AS t ON t.TagName = 'google-apps-script' WHERE u.DisplayName = 'John Stauffer'
SELECT COUNT(*) FROM users WHERE DisplayName = 'Daniel Vassallo'
SELECT COUNT(*) FROM votes WHERE UserId = 12345
SELECT Id FROM posts WHERE OwnerUserId = 101 AND PostTypeId = 1 ORDER BY AnswerCount DESC LIMIT 1
SELECT MAX(SUM(ViewCount)) FROM posts WHERE PostTypeId IN (1, 2) AND (DisplayName = 'Harvey Motulsky' OR DisplayName = 'Noah Snyder')
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.Score > 4
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE OwnerUserId = '##UserId##') AND Score < 60
SELECT t.TagName, t.Count FROM tags AS t INNER JOIN posts AS p ON t.ExcerptPostId = p.Id WHERE p.OwnerUserId = '##UserId##' AND p.PostTypeId = 1 AND p.ClosedDate IS NULL AND p.CommentCount = 0
SELECT DISTINCT Name FROM badges WHERE Name = 'Organizer'
SELECT DIVIDE(COUNT(PostId WHERE TagName = 'r'), COUNT(PostId WHERE DisplayName = 'Community')) AS percentage;
SELECT (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Mornington') - (SELECT SUM(ViewCount) FROM posts WHERE DisplayName = 'Amos')
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'commentator' AND YEAR(Date) = 2014
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59'
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60
SELECT c.PostId AS "post_link", c.Text, c.UserId AS "user_link" FROM comments AS c WHERE c.Score > 60
SELECT b.Name FROM badges AS b WHERE b.UserId = '##UserId##' AND YEAR(b.Date) = 2011
SELECT u.DisplayName, u.WebsiteUrl FROM users AS u INNER JOIN posts AS p ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150
SELECT COUNT(*) AS PostHistoryCount, MAX(CreationDate) AS LastEditDate FROM postHistory WHERE PostId = 12345
SELECT u.LastAccessDate, u.Location FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Outliers'
SELECT Title FROM posts WHERE PostId = 10144
SELECT p.Id AS "post_link", b.Name FROM badges AS b INNER JOIN posts AS p ON p.Id = b.PostId WHERE b.UserId = '##UserId##' AND YEAR(b.Date) = 2013
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1
SELECT u.DisplayName, u.Location FROM users AS u INNER JOIN tags AS t ON t.TagName = 'hypothesis-testing' INNER JOIN postTags AS pt ON pt.PostId = t.WikiPostId INNER JOIN posts AS p ON p.Id = pt.PostId WHERE p.OwnerUserId = u.Id
SELECT T1.Title, T2.LinkTypeId FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'What are principal component scores?'
SELECT p.OwnerDisplayName FROM posts AS p WHERE p.Id = (SELECT MAX(p2.ParentId) FROM posts AS p2 WHERE p2.Score = (SELECT MAX(Score) FROM posts))
SELECT u.DisplayName, u.WebsiteUrl FROM users AS u INNER JOIN votes AS v ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50
SELECT Id FROM users ORDER BY Age LIMIT 1
SELECT MAX(Score) FROM posts WHERE Tags LIKE '%<java>%'
SELECT AVG(CAST(COUNT(Id) AS FLOAT)) FROM postLinks WHERE YEAR(CreationDate) = 2010 AND AnswerCount < 2
SELECT MAX(FavoriteCount) FROM posts WHERE OwnerUserId = 1465
SELECT Title FROM posts WHERE Id = (SELECT MIN(PostId) FROM postLinks)
SELECT DisplayName FROM users WHERE Id = (SELECT MAX(UserId) FROM badges)
SELECT MIN(CreationDate) FROM votes WHERE UserId = '##UserId##'
SELECT MIN(CreaionDate) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Age = (SELECT MIN(Age) FROM users)
SELECT DisplayName FROM users WHERE Id = (SELECT MIN(UserId) FROM badges WHERE Name = 'Autobiographer')
SELECT COUNT(*) FROM users WHERE Location = 'United Kingdom' AND (SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = Users.Id) >= 4
SELECT AVG(PostId) FROM votes
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65
SELECT COUNT(*) FROM users WHERE DisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010
SELECT Id, Title FROM posts WHERE OwnerUserId = 101 AND PostTypeId = 1 ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1
SELECT AVG(Score) FROM posts WHERE OwnerUserId = 101
SELECT OwnerDisplayName FROM posts WHERE ViewCount > 20000 AND YEAR(CreationDate) = 2011
SELECT Id, OwnerDisplayName FROM posts WHERE YEAR(CreationDate) = 2010 ORDER BY FavoriteCount DESC LIMIT 1
SELECT DIVIDE(COUNT(Id) WHERE CreationDate = 2011 AND Reputation > 1000, COUNT(Id)) * 100 AS percentage
SELECT DIVIDE(COUNT(Id) WHERE Age BETWEEN 13 AND 18), COUNT(Id) FROM users
SELECT SUM(ViewCount) AS total_views, OwnerUserId, OwnerDisplayName, MAX(CreationDate) AS last_edit_date FROM posts WHERE Title = 'Computer Game Datasets' GROUP BY OwnerUserId, OwnerDisplayName ORDER BY last_edit_date DESC LIMIT 1
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT PostId FROM posts ORDER BY Score DESC LIMIT 1)
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT DisplayName, Location FROM users WHERE Id = (SELECT MAX(LastEditorUserId) FROM posts WHERE Id = 183)
SELECT MAX(Date) FROM badges WHERE Name = 'Emmett'
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000
SELECT DATEDIFF(stats_badges.Date, CreationDate) FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'Zolomon'
SELECT COUNT(*) AS Posts, COUNT(*) AS Comments FROM (SELECT p.Id AS PostId, c.Id AS CommentId FROM posts AS p INNER JOIN comments AS c ON p.Id = c.PostId WHERE p.OwnerUserId = (SELECT MAX(Id) FROM users) GROUP BY p.Id, c.Id) AS t1
SELECT Text, UserDisplayName FROM comments WHERE PostId = 101 ORDER BY CreationDate DESC LIMIT 1
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(*) FROM posts WHERE Tags LIKE '%careers%'
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT c.Text, c.Score, c.CreationDate, c.UserId AS "user_link", p.Title, p.Tags, p.ViewCount, p.Score, p.AnswerCount, p.CommentCount, p.FavoriteCount, p.LastEditorUserId AS "last_editor", p.LastEditDate AS "last_edit", p.CommunityOwnedDate AS "co_date", p.ParentId AS "parent_id", p.ClosedDate AS "closed_date", p.OwnerUserId AS "user_link", p.OwnerDisplayName AS "user_name", p.LastEditorDisplayName AS "last_editor_name" FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE c.Text LIKE '%##text##%' AND p.Title = 'Clustering 1D data' ORDER BY c.CreationDate DESC
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(*) FROM votes WHERE BountyAmount > 30
SELECT DIVIDE(COUNT(stats_posts.Id) WHERE Score > = 50 AND MAX(Reputation)), COUNT(stats_posts.Id) AS percentage FROM posts AS stats_posts WHERE OwnerUserId = (SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1) AND Score > = 50
SELECT COUNT(*) FROM posts WHERE Score < 20
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count < 20
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT u.Reputation, SUM(v.VoteTypeId) AS UpVotes FROM users AS u INNER JOIN comments AS c ON c.UserId = u.Id INNER JOIN votes AS v ON v.PostId = c.PostId WHERE c.Text = 'fine, you win :)' GROUP BY u.Id
SELECT Text FROM comments WHERE PostId = 10144
SELECT PostId, MAX(Score) AS HighestScore FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount BETWEEN 100 AND 150) GROUP BY PostId
SELECT CreationDate, Age FROM users WHERE Comment LIKE '%http://%'
SELECT COUNT(c.PostId) FROM comments AS c WHERE c.Score = 0 AND c.CreationDate > '2019-01-01' AND c.CreationDate < '2019-01-31' AND NOT EXISTS(SELECT * FROM posts AS p WHERE p.Id = c.PostId AND p.ViewCount > 5)
SELECT COUNT(*) FROM comments WHERE PostId = 1 AND Score = 0
SELECT COUNT(DISTINCT c.UserId) FROM users AS u INNER JOIN comments AS c ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40
SELECT PostId, Text FROM comments WHERE Text LIKE '%Group differences on a five point Likert item%'
SELECT SUM(UpVotes) FROM users WHERE DisplayName LIKE '%R is also lazy evaluated%'
SELECT * FROM comments WHERE UserId = '##UserId##'
SELECT c.UserDisplayName FROM comments c WHERE c.Score BETWEEN 1 AND 5 AND c.DownVotes = 0
SELECT DIVIDE(COUNT(UserId) WHERE Score BETWEEN 5 AND 10 AND UpVotes = 0), COUNT(UserId) WHERE Score BETWEEN 5 AND 10) AS percentage;
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND superhero_name IN (SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength')
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(T1.id) > 15
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue')
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN power_attribute AS T3 ON T2.power_id = T3.power_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Agility' AND T1.eye_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blue')
SELECT superhero_name FROM superhero WHERE eye_colour_id IN (SELECT colour.id FROM colour WHERE colour.colour = 'Blue') AND hair_colour_id IN (SELECT colour.id FROM colour WHERE colour.colour = 'Blond') AND superhero.superpower_id IN (SELECT superpower.id FROM superpower WHERE superpower.power_name = 'Agility')
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT superhero_name FROM superhero WHERE publisher_name = 'Marvel Comics' ORDER BY height_cm DESC LIMIT 1
SELECT publisher_name FROM publisher WHERE publisher_name = 'Sauron'
SELECT COUNT(*) FROM superhero WHERE publisher_name = 'Marvel Comics' AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue')
SELECT AVG(height_cm) FROM superhero WHERE publisher_name = 'Marvel Comics'
SELECT publisher_name, COUNT(*) AS "Superheroes", SUM(CASE WHEN power_name = 'Super Strength' THEN 1 ELSE 0 END) AS "Super Strength" FROM superhero WHERE publisher_name = 'Marvel Comics' GROUP BY publisher_name
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')
SELECT publisher_name FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Speed' GROUP BY T1.publisher_name ORDER BY MIN(T4.attribute_value) LIMIT 1
SELECT COUNT(*) FROM superhero WHERE publisher_name = 'Marvel Comics' AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Gold')
SELECT publisher_name FROM publisher WHERE publisher_name = (SELECT publisher_name FROM superhero WHERE superhero_name = 'Blue Beetle II')
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'Blond')
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T3.attribute_value LIMIT 1
SELECT race_id FROM superhero WHERE superhero_name = 'Copycat'
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T3.attribute_value < 50
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t3.attribute_name = 'Strength' AND t3.attribute_value = 100 AND t1.gender_id IN (SELECT id FROM gender WHERE gender = 'Female')
SELECT superhero_name FROM superhero GROUP BY superhero_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race = 'Vampire'
SELECT COUNT(*) FROM superhero WHERE alignment = 'Bad' AND publisher_name = 'Marvel Comics'
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))
SELECT publisher_id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(attribute_value) FROM hero_attribute
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.id = 75
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Deathlok'
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = 2
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.gender = 'Male'
SELECT superhero_name FROM superhero WHERE race = 'Alien'
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 56
SELECT superhero_name FROM superhero WHERE race = 'Demi-God'
SELECT COUNT(*) FROM superhero WHERE alignment_id = 'Bad'
SELECT race_id FROM superhero WHERE weight_kg = 169
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.height_cm = 185 AND T1.race = 'human' AND T2.attribute_id = T4.id AND T2.attribute_value = T4.attribute_value AND T4.attribute_name = 'hair colour' AND T4.id = T1.hair_colour_id
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1
SELECT AVG(CASE WHEN height_cm BETWEEN 150 AND 180 THEN 1 ELSE 0 END) * 100 / COUNT(*) FROM superhero WHERE publisher_id = 13
SELECT full_name FROM superhero WHERE weight_kg > (SELECT AVG(weight_kg) FROM superhero) AND gender_id IN (SELECT id FROM gender WHERE gender = 'male')
SELECT power_name FROM superpower GROUP BY power_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'
SELECT superpower.power_name FROM superpower, hero_power WHERE hero_power.hero_id = 1 AND hero_power.power_id = superpower.id
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'stealth'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'strength' GROUP BY T1.id ORDER BY T3.attribute_value DESC LIMIT 1
SELECT AVG(weight_kg) FROM superhero WHERE skin_colour_id IS NULL
SELECT COUNT(*) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'durability' AND T1.publisher_id = (SELECT publisher_name FROM publisher WHERE publisher_name = 'Dark Horse Comics') GROUP BY T1.superhero_name ORDER BY MAX(T3.attribute_value) DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN colour AS T3 ON T2.eye_colour_id = T3.id WHERE T1.superhero_name = 'Abraham Sapien'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'gender' AND T3.attribute_value = 'Female' AND T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')
SELECT T1.publisher_name FROM publisher AS T1 JOIN superhero AS T2 ON T1.publisher_id = T2.publisher_id WHERE T2.hair_colour_id = T2.skin_colour_id AND T2.eye_colour_id = T2.skin_colour_id
SELECT race_id FROM superhero WHERE superhero_name = 'A-Bomb'
SELECT percentage FROM superhero WHERE gender = 'Female' AND colour = 'Blue'
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler'
SELECT gender.gender FROM gender JOIN superhero ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_power AS t2 ON t1.id = t2.hero_id WHERE t1.superhero_name = 'Amazo';
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN colour AS T3 ON T2.eye_colour_id = T3.id AND T2.hair_colour_id = T3.id WHERE T3.colour = 'Black'
SELECT T1.eye_colour_id FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T1.colour = 'Gold'
SELECT superhero_name FROM superhero WHERE race = 'Vampire'
SELECT superhero_name FROM superhero WHERE alignment = 'Neutral'
SELECT COUNT(*) FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Strength' AND T1.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T2.attribute_name = 'Strength')
SELECT T1.race, T2.alignment FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Cameron Hicks'
SELECT percent FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' AND T2.gender_id = (SELECT id FROM gender WHERE gender = 'Female')
SELECT AVG(weight_kg) FROM superhero WHERE race = 'Alien'
SELECT difference FROM superhero WHERE full_name = 'Emil Blonsky' - (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler')
SELECT AVG(height_cm) FROM superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' GROUP BY T1.superhero_name ORDER BY T3.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3
SELECT T1.attribute_name, T2.attribute_value FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'
SELECT superhero_name FROM superhero WHERE eye_colour_id = 7 AND hair_colour_id = 9
SELECT publisher_name FROM publisher WHERE publisher_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL
SELECT percentage FROM superhero WHERE eye_colour_id = 7
SELECT ratio FROM superhero WHERE gender_id = 1 OR gender_id = 2
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT power_id FROM superpower WHERE power_name = 'cryokinesis'
SELECT superhero_name FROM superhero WHERE superhero.id = 294
SELECT superhero_name FROM superhero WHERE weight_kg IS NULL
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.full_name = 'Karen Beecher-Duncan' AND T2.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'eye_colour')
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Helen Parr'
SELECT race_id FROM superhero WHERE weight_kg = 108 AND height_cm = 188
SELECT publisher_name FROM publisher WHERE publisher_id = (SELECT publisher_id FROM superhero WHERE id = 38)
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id GROUP BY T1.race ORDER BY MAX(T4.attribute_value) DESC LIMIT 1
SELECT T1.alignment, T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Atom IV'
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue')
SELECT AVG(attribute_value) FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE alignment_id = 3)
SELECT T1.skin_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value = 100
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value BETWEEN 75 AND 80
SELECT race_id FROM superhero WHERE hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'blue') AND gender_id = (SELECT gender.id FROM gender WHERE gender.gender = 'male')
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END), COUNT(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END)), 100.0) AS percentage FROM alignment, gender WHERE alignment.id = 2 AND gender.id = 2
SELECT (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 7 AND weight_kg > 0) - (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 1 AND weight_kg > 0)
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Hulk' AND T2.attribute_name = 'Strength';
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero WHERE skin_colour_id = (SELECT id FROM colour WHERE colour = 'Green') AND alignment = 'Bad'
SELECT COUNT(*) FROM superhero WHERE gender = 'Female' AND publisher_name = 'Marvel Comics'
SELECT superhero_name FROM superhero WHERE superhero_name IN (SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control') ORDER BY superhero_name
SELECT T1.gender FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN hero_power AS T3 ON T2.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'
SELECT superhero_name FROM superhero WHERE publisher_name = 'DC Comics' ORDER BY weight_kg DESC LIMIT 1
SELECT AVG(height_cm) FROM superhero WHERE publisher_name = 'Dark Horse Comics' AND race <> 'Human'
SELECT COUNT(*) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t3.attribute_name = 'Speed' AND t2.attribute_value = 100
SELECT publisher_name, COUNT(*) AS num_superheroes FROM superhero GROUP BY publisher_name ORDER BY num_superheroes DESC LIMIT 1
SELECT T1.attribute_name FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' GROUP BY T1.attribute_name ORDER BY MIN(T1.attribute_value) LIMIT 1
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN colour AS T3 ON T2.eye_colour_id = T3.id WHERE T1.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT publisher_name, COUNT(*) AS count, SUM(CASE WHEN gender = 'Female' THEN 1 ELSE NULL END) AS female_count, MULTIPLY(SUM(CASE WHEN gender = 'Female' THEN 1 ELSE NULL END), 100.0) / COUNT(*) AS percentage FROM superhero WHERE publisher_name = 'George Lucas' GROUP BY publisher_name
SELECT MULTIPLY(DIVIDE(SUM(alignment = 'Good'), COUNT(publisher_name = 'Marvel Comics')), 100.0) FROM superhero WHERE publisher_name = 'Marvel Comics' AND alignment = 'Good'
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT T1.id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id GROUP BY T1.id ORDER BY T3.attribute_value LIMIT 1
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT superhero_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'brown')
SELECT t2.attribute_value FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id WHERE t1.superhero_name = "Aquababy"
SELECT weight_kg, race_id FROM superhero WHERE superhero_id = 40
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'neutral')
SELECT hero_id FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Intelligence')
SELECT T2.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Blackwulf' AND T2.attribute_name = 'eye_colour_id'
SELECT power_name FROM superhero AS t1 JOIN hero_power AS t2 ON t1.id = t2.hero_id WHERE t1.height_cm > MULTIPLY(AVG(height_cm), 0.8)
SELECT DISTINCT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 18 AND T2.q1 = (SELECT MAX(q1) FROM results WHERE raceId = 18)
SELECT T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19 AND T1.q2 = (SELECT MIN(q2) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19)
SELECT year FROM circuits WHERE location = "Shanghai"
SELECT races.url FROM circuits, races WHERE circuits.name = "Circuit de Barcelona-Catalunya" AND races.circuitId = circuits.circuitId
SELECT name FROM circuits WHERE country = "Germany"
SELECT DISTINCT T2.position FROM constructors AS T1 JOIN circuits AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = "Renault"
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId IN (SELECT circuitId FROM circuits WHERE location = "grand prix" EXCEPT SELECT circuitId FROM circuits WHERE location = "Asia" OR location = "Europe")
SELECT name FROM races WHERE country = "Spain"
SELECT location FROM circuits WHERE name = "Australian grand prix"
SELECT results.url FROM results WHERE results.raceId IN (SELECT races.raceId FROM races WHERE races.circuitId IN (SELECT circuits.circuitId FROM circuits WHERE circuits.name = "Sepang International Circuit")) AND results.year = 2015
SELECT time FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Sepang International Circuit")
SELECT lat, lng FROM circuits WHERE name = "Abu Dhabi Grand Prix"
SELECT T1.nationality FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 24 AND T2.points = 1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId = 11
SELECT DISTINCT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.number = 355 AND T2.time = "0:01:40"
SELECT number FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.number = 903 AND T2.time = '0:01:54'
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 3 AND time IS NULL
SELECT T1.year FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901
SELECT COUNT(DISTINCT driverId) FROM results WHERE date = "2015-11-29"
SELECT MAX(dob) FROM drivers WHERE NOT time IS NULL AND raceId = 592
SELECT DISTINCT T1.driverId, T1.url FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 161 AND T2.milliseconds = 127
SELECT T1.name, T1.location FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId WHERE T2.raceId = 933 AND T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT location FROM circuits WHERE name = "Malaysian Grand Prix"
SELECT constructors.url FROM constructors, constructorStandings WHERE constructorStandings.constructorId = constructors.constructorId AND constructorStandings.raceId = 9 ORDER BY constructorStandings.points DESC LIMIT 1
SELECT results.points FROM results, races WHERE results.raceId = races.raceId AND races.number = 345 AND results.driverId = 10 AND results.constructorId = 10
SELECT DISTINCT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.number = 347 AND T2.time = "0:01:15"
SELECT DISTINCT T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.number = 45 AND T2.time = '0:01:33'
SELECT results.time FROM results WHERE results.raceId = 743 AND results.driverId = 1
SELECT DISTINCT T2.driverId FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = "San Marino Grand Prix" AND T1.year = 2006 AND T1.position = 2
SELECT T1.year FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901
SELECT COUNT(DISTINCT driverId) FROM results WHERE date = "2015-11-29"
SELECT MAX(dob) FROM drivers WHERE time LIKE '%872%'
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 348 ORDER BY T2.milliseconds LIMIT 1
SELECT nationality FROM drivers WHERE driverId = (SELECT driverId FROM results WHERE raceId = 348 AND fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results))
SELECT (SELECT fastestLapSpeed(raceId = 853) FROM results WHERE raceId = 853) - (SELECT fastestLapSpeed(raceId = 854) FROM results WHERE raceId = 854)
SELECT DIVIDE(COUNT(driverId) WHERE time <> '' AND date = '1983-07-16'), (COUNT(driverId) WHERE date = '1983-07-16')) AS percentage FROM results WHERE year = 1983 AND date = '1983-07-16'
SELECT MIN(year) FROM races WHERE name = "Singapore Grand Prix"
SELECT COUNT(*), name FROM races WHERE year = 2005 ORDER BY name DESC
SELECT * FROM races WHERE year = (SELECT MIN(year) FROM races) AND month = (SELECT MIN(month) FROM races);
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT name FROM races WHERE year != 2000
SELECT location FROM circuits WHERE name = "European Grand Prix" ORDER BY year LIMIT 1
SELECT MAX(year) FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = "Brands Hatch")
SELECT COUNT(*) FROM circuits WHERE location = "Silverstone"
SELECT DISTINCT T1.forename, T1.surname, T1.number FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2010 AND T3.name = "Singapore Grand Prix" ORDER BY T2.position
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY SUM(T2.points) DESC LIMIT 1
SELECT T1.forename, T1.surname, T2.points FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 2017 AND T2.year = 2017 ORDER BY T2.points DESC LIMIT 3
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, T2.name, MIN(T2.milliseconds) FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId
SELECT AVG(time) FROM results WHERE raceId = 5 AND driverId = 1 AND constructorId = 1
SELECT DIVIDE(COUNT(raceId) WHERE surname = 'Hamilton' AND year >= 2010 AND position > 1, COUNT(raceId) WHERE surname = 'Hamilton' AND year >= 2010) AS percentage;
SELECT T1.nationality, AVG(T1.points) FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY MAX(T2.wins) DESC LIMIT 1
SELECT name FROM drivers WHERE nationality = 'Japanese' AND age = 2022 - YEAR(dob) + 1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year BETWEEN 1990 AND 2000 GROUP BY T1.name HAVING COUNT(*) = 4
SELECT T1.name, T1.location, T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = "USA" AND T2.year = 2006
SELECT T1.name, T2.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2005 AND month(T1.date) = 9
SELECT races.name FROM results, races WHERE results.driverId = 1 AND results.number < 10 AND results.raceId = races.raceId
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.name = "Sepang International Circuit" AND T1.driverId = 1 AND T1.constructorId = 1 AND T1.statusId = 1
SELECT races.year, races.name FROM races JOIN results ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = "Michael" AND drivers.surname = "Schumacher" AND results.milliseconds = (SELECT MIN(milliseconds) FROM results)
SELECT AVG(points) FROM results WHERE year = 2000
SELECT MIN(year), points FROM results WHERE driverId = 1
SELECT name, country, date FROM races WHERE year = 2017 ORDER BY date
SELECT races.name, races.year, circuits.location FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.laps = (SELECT MAX(laps) FROM races)
SELECT COUNT(*) FROM circuits WHERE country = 'Germany' AND name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = "Silverstone"
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY max(lat) DESC LIMIT 1
SELECT circuitRef FROM circuits WHERE name = "Marina Bay Street Circuit"
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT nationality FROM drivers ORDER BY dob LIMIT 1
SELECT surname FROM drivers WHERE nationality = "italian"
SELECT url FROM drivers WHERE forename = "Anthony" AND surname = "Davidson"
SELECT driverRef FROM drivers WHERE forename = "Lewis" AND surname = "Hamilton"
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year = 2009 AND races.name = "Spanish Grand Prix"
SELECT DISTINCT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Silverstone")
SELECT * FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Silverstone")
SELECT time FROM races WHERE year = 2010 AND circuitId = (SELECT circuitId FROM circuits WHERE name = "Abu Dhabi Circuit")
SELECT COUNT(*) FROM circuits WHERE country = "Italy"
SELECT date FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Barcelona-Catalunya")
SELECT url FROM circuits WHERE year = 2009
SELECT MIN(T2.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1 AND T2.year = 2008 ORDER BY T2.rank LIMIT 1
SELECT races.name FROM results, races WHERE results.raceId = races.raceId AND results.driverId = 47 AND results.constructorId = 13
SELECT MIN(rank) FROM results WHERE raceId IN (SELECT races.raceId FROM races WHERE races.name = "Formula_1")
SELECT MAX(T2.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T2.name = "Spanish Grand Prix"
SELECT DISTINCT year FROM results WHERE name = "Lewis Hamilton"
SELECT positionOrder FROM results WHERE raceId = 1 AND year = 2008 AND driverId = 1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.grid = 4 AND T1.raceId = 1
SELECT COUNT(DISTINCT driverId) FROM results WHERE time <> "null" AND raceId = 1
SELECT MAX(T2.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = "Lewis" AND T3.surname = "Hamilton" AND T2.year = 2008
SELECT results.time FROM results WHERE results.rank = 2 AND results.raceId = 1 AND STRFTIME('%y', results.date) = '2008'
SELECT T1.name, T1.location, T2.time FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year = 2008 AND T2.raceId = 1
SELECT COUNT(*) FROM drivers WHERE nationality = 'American' AND date LIKE '%2008%'
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1 AND T2.time LIKE '%2008%'
SELECT SUM(T2.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"
SELECT AVG(milliseconds) FROM lapTimes WHERE driverId = 1 AND raceId IN (SELECT raceId FROM races WHERE name = 'Formula_1')
SELECT COUNT(DISTINCT raceId) FROM results WHERE time IS NOT NULL
SELECT (SELECT MAX(milliseconds) FROM lapTimes WHERE raceId = 1 AND time LIKE '%00:00:00.%') - (SELECT MAX(milliseconds) FROM lapTimes WHERE raceId = 1 AND time LIKE '%00:00:00.%') * 100 / (SELECT MAX(milliseconds) FROM lapTimes WHERE raceId = 1 AND time LIKE '%00:00:00.%')
SELECT COUNT(*) FROM circuits WHERE country = "Australia" AND location = "Melbourne"
SELECT location FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = "British" AND dob > 1980
SELECT AVG(points) FROM constructors WHERE nationality = "British"
SELECT * FROM constructorStandings ORDER BY points DESC LIMIT 1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0
SELECT COUNT(*) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Japanese" AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(*) = 2
SELECT * FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1
SELECT COUNT(*) FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "French" AND T2.laps > 50
SELECT COUNT(DISTINCT driverId) FROM results WHERE year BETWEEN 2007 AND 2009 AND time <> '' AND nationality = "Japanese"
SELECT year, AVG(TIMEDIFF(finished_time, start_time)) AS average_time FROM results WHERE statusId = (SELECT statusId FROM status WHERE status = 'Champion') GROUP BY year
SELECT forename, surname FROM drivers WHERE year(dob) > 1975 AND rank = 2
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Italian" AND T2.time IS NULL
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapTime LIMIT 1
SELECT MAX(T2.fastestLap) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.year = 2009
SELECT AVG(fastestLapSpeed) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Spanish Grand Prix')
SELECT name, year FROM races ORDER BY milliseconds LIMIT 1
SELECT COUNT(driverId) FROM drivers WHERE year(dob) < 1985 AND laps > 50
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "French" AND T2.milliseconds < 02:00.00
SELECT * FROM drivers WHERE nationality = 'America'
SELECT raceId FROM races WHERE year = 2009
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18
SELECT COUNT(*) FROM drivers WHERE nationality = "Netherlandic" AND year(dob) = (SELECT MAX(year(dob)) FROM drivers)
SELECT driverRef FROM drivers WHERE forename = "Robert" AND surname = "Kubica"
SELECT COUNT(*) FROM drivers WHERE nationality = "Australian" AND year(dob) = 1980
SELECT DISTINCT driverId, name, surname, forename, birthDate, nationality, url FROM drivers WHERE birthDate BETWEEN '1980-01-01' AND '1990-12-31' AND nationality = 'German' ORDER BY MIN(time) LIMIT 3
SELECT driverRef FROM drivers WHERE nationality = "German" ORDER BY year(dob) LIMIT 1
SELECT DISTINCT driverId, code FROM drivers WHERE year(dob) = 1971 AND fastestLapTime = (SELECT MAX(fastestLapTime) FROM results)
SELECT * FROM drivers WHERE nationality = 'Spanish' AND year(dob) < 1982 ORDER BY MAX(time) DESC LIMIT 10
SELECT year FROM results ORDER BY fastestLapTime LIMIT 1
SELECT year FROM lapTimes GROUP BY year ORDER BY AVG(milliseconds) DESC LIMIT 1
SELECT DISTINCT driverId FROM lapTimes ORDER BY time DESC LIMIT 5
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND statusId = 2 AND time IS NULL
SELECT COUNT(*) FROM circuits WHERE country = "Austria"
SELECT MAX(number) FROM results
SELECT DISTINCT T1.nationality, T1.birthday FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.raceId = 23 AND T2.q2 <> ''
SELECT T1.year, T1.name, T1.date, T1.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = "Max" AND T3.surname = "Verstappen" ORDER BY T3.dob DESC LIMIT 1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "American" AND T2.statusId = 2
SELECT MAX(T2.points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Italian"
SELECT constructors.url FROM constructors ORDER BY constructorStandings.wins DESC LIMIT 1
SELECT MAX(time) FROM lapTimes WHERE raceId IN (SELECT races.raceId FROM races WHERE races.name = "French Grand Prix") AND lap = 3
SELECT raceId, MIN(milliseconds) FROM lapTimes WHERE lap = 1 GROUP BY raceId
SELECT AVG(fastestLapTime) FROM results WHERE raceId IN (SELECT races.raceId FROM races WHERE races.year = 2006 AND races.name = "United States Grand Prix") AND rank < 11
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, AVG(T2.duration) FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "German" AND T1.dob BETWEEN 1980 AND 1985 GROUP BY T1.driverId ORDER BY AVG(T2.duration) LIMIT 5
SELECT T2.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = "Canadian Grand Prix" AND YEAR(T1.year) = 2008 ORDER BY T1.rank LIMIT 1
SELECT T1.constructorRef, T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 2009 AND T2.position = 1
SELECT forename, surname, dob FROM drivers WHERE year(dob) BETWEEN '1981' AND '1991' AND nationality = 'Austrian'
SELECT forename, surname, nationality, dob, year(dob) FROM drivers WHERE year(dob) BETWEEN '1971' AND '1985' AND nationality = 'German' ORDER BY dob DESC
SELECT location, country, lat, lng FROM circuits WHERE name = "Hungaroring"
SELECT MAX(T2.points) AS score, T2.name, T2.nationality FROM results AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = (SELECT MAX(raceId) FROM races WHERE year BETWEEN 1980 AND 2010) GROUP BY T2.name, T2.nationality
SELECT AVG(points) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = "Turkish Grand Prix") AND driverId IN (SELECT driverId FROM drivers WHERE forename = "Lewis" AND surname = "Hamilton")
SELECT AVG(year) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31'
SELECT MAX(nationality) FROM drivers
SELECT SUM(T2.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.rank = 91
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId GROUP BY T1.name ORDER BY MIN(T2.fastestLapTime)
SELECT T1.location, T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId GROUP BY T1.location, T1.country ORDER BY MAX(T2.date) DESC LIMIT 1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.name = "Marina Bay Street Circuit" AND T3.year = 2008 AND T1.position = 1 AND T1.q1 = (SELECT MIN(q1) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = "Marina Bay Street Circuit" AND T2.year = 2008)
SELECT forename, surname, nationality, name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.rank = (SELECT MIN(rank) FROM results)
SELECT COUNT(*) FROM results WHERE statusId = 3 AND raceId = (SELECT MAX(raceId) FROM results WHERE statusId = 3)
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.dob = (SELECT MIN(dob) FROM drivers)
SELECT MAX(duration) FROM pitStops
SELECT MAX(milliseconds) FROM lapTimes
SELECT MAX(duration) FROM pitStops WHERE driverId = 44
SELECT lap FROM pitStops WHERE raceId = 1 AND driverId = 1 AND stop = 1
SELECT DISTINCT T1.driverId, T1.stop, T1.time FROM pitStops AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2011 AND T2.raceId = 1
SELECT MIN(milliseconds) FROM lapTimes WHERE raceId IN (SELECT races.raceId FROM races WHERE races.name = 'Formula_1') AND driverId IN (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton')
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT T1.position FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId WHERE T2.driverId = 44 AND T2.fastestLap = (SELECT MIN(time) FROM results WHERE driverId = 44)
SELECT MIN(milliseconds) FROM lapTimes WHERE raceId = 6
SELECT circuits.name, MIN(lapTimes.milliseconds) FROM circuits INNER JOIN lapTimes ON circuits.circuitId = lapTimes.circuitId WHERE circuits.country = "Italy" GROUP BY circuits.name
SELECT races.year FROM circuits, races WHERE circuits.name = "Austrian Grand Prix Circuit" AND races.circuitId = circuits.circuitId AND races.year = (SELECT MAX(year) FROM races WHERE races.circuitId = circuits.circuitId)
SELECT duration FROM pitStops WHERE raceId = (SELECT races.raceId FROM races WHERE races.name = 'Austrian Grand Prix Circuit' ORDER BY results.milliseconds LIMIT 1) AND driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Nico' AND drivers.surname = 'Rosberg')
SELECT location FROM circuits WHERE circuitId IN (SELECT circuitId FROM lapTimes WHERE time = '1:29.488')
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = 1
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)
SELECT COUNT(*) FROM "Player_Attributes" WHERE overall_rating > = 60 AND overall_rating < 65 AND defensive_work_rate = 'low'
SELECT player_api_id FROM "Player_Attributes" WHERE crossing = (SELECT MAX(crossing) FROM "Player_Attributes")
SELECT league_id FROM Match WHERE season = '2015/2016' GROUP BY league_id ORDER BY SUM(home_team_goal, away_team_goal) DESC LIMIT 1
SELECT T2.team_name, T1.home_team_api_id, T1.home_team_goal, T1.season FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.season = '2015/2016' AND T1.home_team_goal < T1.away_team_goal GROUP BY T1.home_team_api_id, T1.home_team_goal, T1.season ORDER BY T1.home_team_goal DESC LIMIT 1
SELECT player_name FROM Player ORDER BY penalties DESC LIMIT 10
SELECT MAX(SUBTRACT(away_team_goal, home_team_goal) > 0) FROM Match WHERE season = '2009/2010' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League') AND home_team_api_id IN (SELECT id FROM Team)
SELECT T1.team_api_id, T1.team_fifa_api_id, MAX(T2.buildUpPlaySpeed) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id GROUP BY T1.team_api_id ORDER BY MAX(T2.buildUpPlaySpeed) DESC LIMIT 4
SELECT League_id FROM Match WHERE season = '2015/2016' GROUP BY League_id ORDER BY SUM(home_team_goal = away_team_goal) DESC LIMIT 1
SELECT * FROM Player WHERE sprint_speed > = 97 AND date >= '2013-01-01 00:00:00' AND date <= '2015-12-31 00:00:00'
SELECT League.name, COUNT(*) FROM Match, League WHERE League.id = Match.league_id GROUP BY League.name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT AVG(height) FROM Player WHERE birthday > '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'
SELECT player_api_id FROM Player_Attributes WHERE date = '2010' GROUP BY player_api_id HAVING AVG(overall_rating) > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date = '2010') ORDER BY overall_rating DESC LIMIT 1
SELECT team_fifa_api_id FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed BETWEEN 51 AND 59
SELECT T2.team_long_name FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM "Team_Attributes") AND T2.date = 2012
SELECT DIVIDE(SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END), COUNT(player_fifa_api_id)) * 100 AS percentage_left_foot, birthday FROM Player WHERE birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00' GROUP BY birthday
SELECT League_ID, COUNT(*) AS Goals FROM Match GROUP BY League_ID ORDER BY Goals DESC LIMIT 5;
SELECT AVG(long_shots) FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ahmed Samir Farag'
SELECT player_name FROM Player WHERE height > 180 GROUP BY player_name HAVING AVG(heading_accuracy) > (SELECT AVG(heading_accuracy) FROM Player WHERE height > 180) ORDER BY AVG(heading_accuracy) DESC LIMIT 10
SELECT T1.team_long_name FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date > '2014-01-01 00:00:00' AND T2.date < '2014-01-31 00:00:00' GROUP BY T1.team_api_id HAVING AVG(T2.chanceCreationPassing) < (SELECT AVG(chanceCreationPassing) FROM "Team_Attributes" WHERE buildUpPlayDribblingClass = 'Normal' AND date > '2014-01-01 00:00:00' AND date < '2014-01-31 00:00:00') ORDER BY AVG(chanceCreationPassing) DESC
SELECT League.name FROM League, Match WHERE League.season = '2009/2010' AND Match.league_id = League.id AND Match.home_team_api_id = Team.team_api_id AND Match.away_team_api_id = Team.team_api_id GROUP BY League.name HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal)
SELECT team_short_name FROM "Team" WHERE team_long_name = 'Queens Park Rangers'
SELECT * FROM Player WHERE birthday LIKE '%1970%' AND birthday LIKE '%10%';
SELECT T1.attacking_work_rate FROM "Player_Attributes" AS T1 JOIN "Player" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Franco Zennaro"
SELECT SUM(buildUpPlayPositioningClass) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.buildUpPlayPositioningClass = '1st two thirds'
SELECT SUM(t1.finishing) FROM "Player_Attributes" AS t1 JOIN "Match" AS t2 ON t1.player_api_id = t2.home_player_api_id WHERE t1.player_api_id = '200101' AND t2.date = '2014-09-18 00:00:00';
SELECT SUM(T1.overall_rating) FROM "Player_Attributes" AS T1 JOIN "Match" AS T2 ON T1.player_api_id = T2.home_player_api_id WHERE T2.season = 2011 AND T2.home_player_api_id = (SELECT "Player"."player_api_id" FROM "Player" WHERE "player_name" = 'Gabriel Tamas')
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League');
SELECT preferred_foot FROM Player_Attributes WHERE date = (SELECT MAX(date) FROM Player_Attributes)
SELECT player_api_id, potential FROM Player_Attributes ORDER BY potential DESC LIMIT 10
SELECT COUNT(*) FROM Player_Attributes WHERE weight < 130 AND preferred_foot = 'left'
SELECT T1.team_short_name FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky'
SELECT "Player_Attributes"."defensive_work_rate" FROM "Player_Attributes" WHERE "Player_Attributes"."player_api_id" = (SELECT "Player"."player_api_id" FROM "Player" WHERE "Player"."player_name" = 'David Wilson')
SELECT date FROM "Player_Attributes" ORDER BY overall_rating DESC LIMIT 1
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = "Netherlands"
SELECT AVG(home_team_goal) FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Poland') AND season = '2010/2011';
SELECT T1.player_api_id, AVG(T1.finishing) FROM "Player" AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_api_id ORDER BY AVG(T1.finishing) DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';
SELECT COUNT(*) FROM Player WHERE weight > 170 AND player_name = 'Adam'
SELECT player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating > 80 AND T2.date BETWEEN '2008' AND '2010'
SELECT potential FROM Player_Attributes WHERE player_api_id = 2544500
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left'
SELECT T1.team_long_name FROM Team AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_short_name = 'CLB'
SELECT T1.team_short_name FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70
SELECT AVG(overall_rating) FROM Player_Attributes WHERE date BETWEEN '2010' AND '2015' AND height > 170
SELECT player_api_id FROM Player ORDER BY height LIMIT 1
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A';
SELECT T2.team_short_name FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = 2544500
SELECT COUNT(*) FROM Match WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';
SELECT T1.team_short_name FROM "Team" AS T1 JOIN "Match" AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10
SELECT player_api_id, MAX(balance) AS balance, MAX(potential) AS potential FROM Player_Attributes WHERE potential = 61 GROUP BY player_api_id ORDER BY balance DESC
SELECT ABS(AVG(ball_control) - AVG(ball_control WHERE player_name = 'Aaron Appindangoye')) FROM Player WHERE player_name = 'Abdou Diallo'
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY birthday LIMIT 1
SELECT player_api_id FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(*) FROM "Player_Attributes" WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Belgium Jupiler League'
SELECT * FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Germany');
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE date < '1986' AND defensive_work_rate = 'high'
SELECT player_api_id FROM "Player" WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC LIMIT 1
SELECT Player_Attributes.heading_accuracy FROM Player_Attributes WHERE Player_Attributes.player_api_id = 2554400
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70
SELECT T1.player_name FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70
SELECT COUNT(*) FROM Match WHERE season = '2008/09' AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium');
SELECT MAX(T1.long_passing) FROM `Player` AS T1 JOIN `Player_Attributes` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.birthday = (SELECT MAX(birthday) FROM `Player`)
SELECT COUNT(*) FROM Match WHERE League.name = 'Belgium Jupiler League' AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04';
SELECT league_id FROM Match WHERE season = '2008/2009' GROUP BY league_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(overall_rating) FROM Player_Attributes WHERE birthday < '1986'
SELECT (SELECT overall_rating FROM "Player_Attributes" WHERE player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM "Player_Attributes" WHERE player_name = 'Paulin Puel') * 100 / (SELECT overall_rating FROM "Player_Attributes" WHERE player_name = 'Paulin Puel')
SELECT AVG(buildUpPlaySpeed) FROM "Team" JOIN "Team_Attributes" ON "Team".team_api_id = "Team_Attributes".team_api_id WHERE "Team".team_long_name = 'Heart of Midlothian'
SELECT AVG(overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) FROM "Match" AS T1 JOIN "Player" AS T2 ON T1.home_player_X1 = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'
SELECT MAX(chanceCreationPassing) AS score, chanceCreationPassingClass FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax' AND T2.chanceCreationPassingClass = 'chanceCreationPassing'
SELECT preferred_foot FROM "Player_Attributes" WHERE player_name = "Abdou Diallo"
SELECT MAX(overall_rating) FROM "Player_Attributes" WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(away_team_goal) FROM Match WHERE country_id = (SELECT country_id FROM Country WHERE name = 'Italy') AND home_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma')
SELECT T1.player_name FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date = '2016/6/23' ORDER BY T1.birthday LIMIT 1
SELECT overall_rating FROM Player_Attributes WHERE date = '2016-02-04 00:00:00' AND player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Mooy')
SELECT potential FROM Player_Attributes WHERE date = '2010-08-30 00:00:00' AND player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Francesco Parravicini')
SELECT attacking_work_rate FROM "Player_Attributes" WHERE "player_api_id" = (SELECT "player_api_id" FROM "Player" WHERE "player_name" = 'Francesco Migliore') AND date = '2015-05-01 00:00:00'
SELECT preferred_foot, defensive_work_rate FROM "Player_Attributes" WHERE "player_api_id" = '##player_api_id##' AND date = '2013-02-22 00:00:00'
SELECT date FROM "Match" WHERE home_player_X1 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X2 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X3 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X4 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X5 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X6 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X7 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X8 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X9 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X10 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND home_player_X11 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND away_player_X1 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND away_player_X2 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND away_player_X3 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND away_player_X4 = (SELECT MAX(player_api_id) FROM "Player" WHERE player_name = "Kevin Constant") AND away_player_X5 = (SELECT MAX(player_api_id) FROM "Player" WHERE player
SELECT T1.buildUpPlaySpeedClass FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2012-02-22 00:00:00'
SELECT SUM(buildUpPlayDribbling) FROM Team_Attributes WHERE team_fifa_api_id = 'LEI' AND date = '2015-09-10 00:00:00'
SELECT T1.buildUpPlayPassingClass FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date = '2010-02-22'
SELECT chancecreationpassingclass FROM "Team" JOIN "Team_Attributes" ON "Team".team_api_id = "Team_Attributes".team_api_id WHERE "Team".team_long_name = 'PEC Zwolle' AND "Team_Attributes".date = '2013-09-20 00:00:00'
SELECT T1.chanceCreationCrossingClass FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id JOIN "Match" AS T3 ON T3.home_team_api_id = T1.team_api_id WHERE T1.team_long_name = 'Hull City' AND T3.date = '2010-02-22 00:00:00'
SELECT T1.defenceAggressionClass FROM "Team" AS T1 JOIN "Match" AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date = '2015-09-10 00:00:00'
SELECT AVG(overall_rating) FROM "Player_Attributes" WHERE "player_api_id" IN (SELECT "player_api_id" FROM "Player" WHERE "player_name" = 'Marko Arnautovic') AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'
SELECT (SELECT overall_rating FROM "Player_Attributes" WHERE player_api_id = (SELECT player_api_id FROM "Player" WHERE player_name = 'Landon Donovan')) - (SELECT overall_rating FROM "Player_Attributes" WHERE player_api_id = (SELECT player_api_id FROM "Player" WHERE player_name = 'Jordan Bowery')) * 100 / (SELECT overall_rating FROM "Player_Attributes" WHERE player_api_id = (SELECT player_api_id FROM "Player" WHERE player_name = 'Landon Donovan'))
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE age >= 35
SELECT SUM(home_team_goal) FROM Match WHERE home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')
SELECT SUM(T2.away_team_goal) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.away_player_1 WHERE T1.player_name = 'Daan Smith' OR T1.player_name = 'Filipe Ferreira'
SELECT SUM(home_team_goal) FROM Match WHERE age <= 30
SELECT player_api_id, player_name, overall_rating FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 10
SELECT player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY potential DESC LIMIT 1
SELECT T1.player_name FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'high'
SELECT player_name FROM Player WHERE finishing = 1 ORDER BY eldest_player DESC LIMIT 1
SELECT player_name FROM Player WHERE country_id IN (SELECT id FROM Country WHERE name = 'Belgium')
SELECT T1.country_id FROM Country AS T1 JOIN "Player" AS T2 ON T1.id = T2.country_id JOIN "Player_Attributes" AS T3 ON T2.player_api_id = T3.player_api_id WHERE T3.vision > 89
SELECT country_id FROM Player GROUP BY country_id ORDER BY AVG(weight) DESC LIMIT 1
SELECT T1.team_long_name FROM Team AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'
SELECT T1.team_short_name FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'
SELECT AVG(T1.height) FROM `Player` AS T1 JOIN `Country` AS T2 ON T1.country_api_id = T2.id WHERE T2.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name
SELECT COUNT(*) FROM Player WHERE birthday > '1990' AND player_name LIKE 'Aaron%'
SELECT (SELECT jumping FROM Player WHERE id = 6) - (SELECT jumping FROM Player WHERE id = 23)
SELECT player_api_id FROM "Player_Attributes" WHERE potential = (SELECT MIN(potential) FROM "Player_Attributes") AND preferred_foot = 'right' ORDER BY potential LIMIT 3
SELECT COUNT(*) FROM "Player_Attributes" WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM "Player_Attributes")
SELECT COUNT(*) FROM Player_Attributes WHERE strength > 80 AND stamina > 80
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Poland Ekstraklasa'
SELECT home_team_goal, away_team_goal FROM Match WHERE date = '2008-09-24%' AND league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Belgian'))
SELECT `player_api_id`, `sprint_speed`, `agility`, `acceleration` FROM `Player` WHERE `player_name` = 'Alexis Blin'
SELECT buildUpPlaySpeedClass FROM "Team" WHERE team_long_name = 'KSV Cercle Brugge'
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Italy'))
SELECT MAX(home_team_goal) FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Netherlands'))
SELECT T1.finishing, T1.curve FROM "Player" AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.weight DESC LIMIT 1
SELECT T2.league_id, T2.name FROM "Match" AS T1 JOIN "League" AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.league_id ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T1.team_long_name FROM "Team" AS T1 JOIN "Match" AS T2 ON T1.team_api_id = T2.away_team_api_id GROUP BY T1.team_long_name ORDER BY SUM(T2.away_team_goal) DESC LIMIT 1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating > 70 AND height < 180
SELECT (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') - (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-')
SELECT (SELECT COUNT(ID) FROM Patient WHERE year(Birthday) > '1930' AND SEX = 'F') / (SELECT COUNT(ID) FROM Patient WHERE SEX = 'F')
SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31' AND Admission = '+'
SELECT (SELECT COUNT(ID) FROM Patient WHERE Diagnosis = 'SLE' AND Admission = '+') / (SELECT COUNT(ID) FROM Patient WHERE Diagnosis = 'SLE' AND Admission = '-')
SELECT Examination.Diagnosis, Laboratory.Date FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Patient.ID = 30609
SELECT Patient.SEX, Patient.Birthday, Examination.Examination_Date, Examination.Symptoms FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.ID = 163109
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500
SELECT Patient.ID, Patient.Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RVVT = '+'
SELECT ID, SEX, Diagnosis FROM Patient WHERE Thrombosis = 2
SELECT * FROM Patient WHERE YEAR(Birthday) = '1937' AND `T-CHO` > = 250
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.ALB < 3.5
SELECT COUNT(*) * 100.0 FROM Laboratory WHERE (SEX = 'F' AND TP < 6.0 OR TP > 8.5)
SELECT AVG(aCL IgG) FROM Examination WHERE Admission = '+' AND SUBTRACT(year(CURRENT_TIMESTAMP), year(Birthday)) >= 50
SELECT COUNT(*) FROM Patient WHERE Sex = 'F' AND YEAR(Description) = '1997' AND Admission = '-'
SELECT MIN(age) FROM Patient WHERE NOT `First Date` IS NULL
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 1 AND SEX = 'F' AND `Examination Date` = 1997
SELECT MAX(year(Birthday)) - MIN(year(Birthday)) FROM Patient WHERE NOT TG IS NULL
SELECT Examination.Symptoms, Examination.Diagnosis FROM Examination ORDER BY Patient.Birthday DESC LIMIT 1
SELECT AVG(COUNT(ID)) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT MAX(Laboratory.Date) AS Oldest_Lab_Date, MAX(Patient.Birthday) AS Patient_Age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SJS' AND YEAR(Patient.Birthday) = YEAR(Laboratory.Date)
SELECT (SELECT SUM(UA <= 8.0 AND SEX = 'M') FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID) / (SELECT SUM(UA <= 6.5 AND SEX = 'F') FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID)
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE NOT Patient.ID IN (SELECT Examination.Patient FROM Examination WHERE Examination.Examination Date < DATEADD(year, -1, GETDATE()))
SELECT COUNT(*) FROM Examination WHERE `Examination Date` BETWEEN '1990-01-01' AND '1993-12-31' AND YEAR(Patient.Birthday) < 18
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND `T-BIL` > 2.0
SELECT MAX(COUNT(Diagnosis)) FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'
SELECT AVG(SUBTRACT('1999', year(Birthday))) FROM Patient WHERE NOT Birthday IS NULL AND Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT MAX(HGB), T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Examination Date = (SELECT MAX(Examination Date) FROM Examination)
SELECT `aCL IgA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT COUNT(*) > 0 FROM Examination WHERE Examination.ID = 2927464 AND Examination.T-CHO < 250 AND Examination.Date = '1995-09-04'
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` LIMIT 1
SELECT Examination.aCL IgM FROM Examination WHERE Examination.Patient_ID IN (SELECT Patient.ID FROM Patient WHERE Patient.Description = '1994-02-19') AND Examination.Diagnosis = 'SLE' AND Examination.Date = '1993-11-12'
SELECT Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.GPT = 9 AND Examination.Date = '1992-06-12'
SELECT SUBTRACT('1992', year(Birthday)) FROM Patient WHERE Patient.ID IN (SELECT Laboratory.ID FROM Laboratory WHERE Laboratory.UA = '8.4' AND Laboratory.Date = '1991-10-21')
SELECT COUNT(*) FROM Examination WHERE Examination.Patient_ID IN (SELECT Patient.ID FROM Patient WHERE Patient.First_Date = '1991-06-13' AND Patient.Diagnosis = 'SJS') AND Examination.Date = 1995
SELECT patient.Diagnosis FROM patient JOIN Examination ON patient.ID = examination.ID WHERE examination.Examination_Date = '1997-01-27' AND patient.First_Date IS NULL
SELECT Symptoms FROM Examination WHERE `Examination Date` = '1993-09-27' AND Patient.Birthday = '1959-03-01'
SELECT (SELECT SUM(T-CHO) FROM Laboratory WHERE Date BETWEEN '1981-11-01' AND '1981-12-31' AND ID IN (SELECT ID FROM Patient WHERE Birthday = '1959-02-18')) - (SELECT SUM(T-CHO) FROM Laboratory WHERE Date BETWEEN '1981-11-01' AND '1981-12-31' AND ID IN (SELECT ID FROM Patient WHERE Birthday = '1959-02-18'))
SELECT * FROM Examination WHERE Diagnosis = 'Behcet' AND `Examination Date` BETWEEN '1970-01-01' AND '1997-12-31'
SELECT ID FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4
SELECT ID, * FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'
SELECT COUNT(*) FROM Examination WHERE Thrombosis > 2 AND ANA = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) FROM Examination)
SELECT AVG(UA) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30 AND UA < = 6.5
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND YEAR(`FIRST DATE`) = '1981' AND Diagnosis = 'BEHCET'
SELECT * FROM Patient WHERE Admission = '-' AND Date LIKE '1991-10%' AND T-BIL < 2.0
SELECT COUNT(*) FROM Examination WHERE ANA_PATTERN != 'p' AND BIRTHDAY BETWEEN 1980 AND 1989
SELECT Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'PSS' AND Laboratory.CRP > 2 AND Laboratory.CRE = 1 AND Laboratory.LDH = 123
SELECT AVG(ALB) FROM Laboratory WHERE SEX = 'F' AND PLT > 400 AND Diagnosis = 'SLE'
SELECT MAX(symptoms) FROM Examination WHERE diagnosis = 'SLE'
SELECT `First Date` FROM Patient WHERE ID = 48473 ORDER BY `First Date` LIMIT 1
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'
SELECT COUNT(*) FROM Laboratory WHERE YEAR(Date) = '1997' AND TP > 6 AND TP < 8.5
SELECT SUM(CASE WHEN Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Examination
SELECT COUNT(DISTINCT SEX) FROM Patient WHERE YEAR(BIRTHDAY) = '1980' AND diagnosis = 'RA'
SELECT COUNT(*) FROM Examination WHERE `Examination Date` BETWEEN '1995' AND '1997' AND Diagnosis = 'BEHCET' AND NOT Admission IS NULL
SELECT COUNT(*) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5
SELECT DATEDIFF(Examination Date, First Date) FROM Examination WHERE Examination.ID IN (SELECT Patient.ID FROM Patient WHERE Patient.ID = 821298)
SELECT COUNT(*) > 0 FROM Examination WHERE Examination.ID = 57266 AND Examination.UA > 8.0 AND Examination.SEX = 'M' OR Examination.UA > 6.5 AND Examination.SEX = 'F'
SELECT Date FROM Laboratory WHERE ID IN (SELECT Patient.ID FROM Patient WHERE Patient.ID = 48473) AND GOT > 60
SELECT Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.Date = 1994 AND Laboratory.GOT < 60
SELECT ID FROM Patient WHERE SEX = 'M' AND NOT GPT IS NULL AND GPT > 60
SELECT * FROM Patient WHERE GPT > 60 ORDER BY Birthday DESC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500
SELECT Patient.ID, Patient.Age FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH >= 600 AND Laboratory.LDH <= 800
SELECT * FROM Laboratory WHERE ALP < 300 AND (Admission = '+' OR Admission = '-')
SELECT Patient.ID FROM Patient WHERE Patient.Birthday = '1982-04-01' AND NOT Laboratory.ALP IS NULL
SELECT ID, SEX, Birthday FROM Patient WHERE TP < 6.0
SELECT (SELECT TP FROM Laboratory WHERE SEX = 'F' AND TP > 8.5) - 8.5
SELECT * FROM Patient WHERE SEX = 'M' AND (ALB < 3.5 OR ALB > 5.5) ORDER BY Birthday DESC
SELECT * FROM Patient WHERE YEAR(Birthday) = '1982' AND ALB BETWEEN 3.5 AND 5.5
SELECT COUNT(*) FROM Laboratory WHERE UA > 8.0 AND Sex = 'F' OR UA > 6.5 AND Sex = 'F'
SELECT AVG(UA) FROM Laboratory WHERE UA < 8.0 AND SEX = 'M' OR UA < 6.5 AND SEX = 'F'
SELECT ID, SEX, Birthday FROM Patient WHERE UN = 29
SELECT ID, SEX, Birthday FROM Patient WHERE Diagnosis = 'RA' AND UN < 30
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND CRE > 1.5
SELECT (SELECT COUNT(*) FROM Laboratory WHERE Sex = 'M' AND CRE > 1.5) > (SELECT COUNT(*) FROM Laboratory WHERE Sex = 'F' AND CRE > 1.5)
SELECT MAX(T-BIL) FROM Laboratory
SELECT Sex, SUM(T-BIL) FROM Laboratory WHERE T-BIL > = 2.0 GROUP BY Sex
SELECT Patient.ID, Laboratory.T-CHO FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID ORDER BY Patient.Birthday DESC LIMIT 1
SELECT AVG(YEAR(NOW()) - YEAR(birthday)) FROM Patient WHERE gender = 'M' AND `T-CHO` > 250
SELECT * FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE TG > 100
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.AGE > 50 AND TG > 200
SELECT DISTINCT ID FROM Examination WHERE ACL IgG < 250 AND ACL IgM < 250 AND ANA < 250 AND ACL IgA < 250 AND Diagnosis = 'outpatient'
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND Birthday BETWEEN '1936' AND '1956' AND CPK > 250
SELECT Patient.ID, Patient.SEX, Patient.AGE FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GLU > 180 AND Laboratory.T-CHO < 250
SELECT Patient.ID, Laboratory.GLU FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Description) > = 1991 AND Laboratory.GLU < 180
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.WBC < 3.5 OR Examination.WBC > 9.0 GROUP BY Patient.SEX ORDER BY Patient.Birthday
SELECT Patient.ID, Patient.Age, Examination.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Birthday < CURRENT_DATE() - INTERVAL 1 YEAR AND Patient.RBC < 3.5
SELECT * FROM Patient WHERE Sex = 'F' AND age >= 50 AND (RBC < 3.5 OR RBC >= 6.0) AND Admission = '+'
SELECT ID, SEX FROM Patient WHERE Admission = '-' AND HGB < 10
SELECT Patient.ID, Patient.SEX FROM Patient WHERE Patient.Diagnosis = 'SLE' AND Patient.HGB < 17 ORDER BY Patient.Birthday LIMIT 1
SELECT Patient.ID, Patient.Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.HCT > 52 GROUP BY Patient.ID HAVING COUNT(Patient.ID) > 2
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29
SELECT (SELECT COUNT(*) FROM Laboratory WHERE PLT < 100) - (SELECT COUNT(*) FROM Laboratory WHERE PLT > 400)
SELECT * FROM Patient WHERE YEAR(Birthday) < 50 INTERSECT SELECT * FROM Laboratory WHERE PLT BETWEEN 100 AND 400 AND Date = '1984%'
SELECT MULTIPLY(DIVIDE(SUM(CASE WHEN PT > = 14 AND Sex = 'F' THEN 1 ELSE 0 END), SUM(PT > = 14)), 1.0) FROM Laboratory WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(Birthday) > 55
SELECT * FROM Patient WHERE `First Date` > 1992 AND PT < 14
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT < 45
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.APTT > 45 AND T2.Thrombosis = 3
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND WBC BETWEEN 3.5 AND 9.0 AND FG < = 150 OR FG > = 450
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND Laboratory.FG < 150 OR Laboratory.FG > 450
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.U-PRO > 30
SELECT patient_id FROM Patient WHERE diagnosis = 'SLE' AND NOT patient_id IN (SELECT patient_id FROM Examination WHERE `U-PRO` > 30)
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` < 900 AND Symptoms = 'abortion'
SELECT COUNT(*) FROM Examination WHERE `aCL IgG` BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.aCL IgA = (SELECT MAX(aCL IgA) FROM Examination WHERE aCL IgA BETWEEN 80 AND 500)
SELECT COUNT(*) FROM Patient WHERE YEAR(`First Date`) > = 1990 AND IGA BETWEEN 80 AND 500
SELECT MAX(COUNT(Diagnosis)) FROM Examination WHERE `aCL IgM` < 40 OR `aCL IgM` > 400
SELECT COUNT(*) FROM Patient WHERE NOT Description IS NULL
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday IS NULL AND Laboratory.CRP > 1.0
SELECT COUNT(DISTINCT ID) FROM Examination WHERE KCT = '+'
SELECT Diagnosis FROM Examination WHERE YEAR(Birthday) > 1995 AND RA = '-' OR RA = '+-'
SELECT Patient.ID FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'male' AND Patient.Birthday < (SELECT MAX(Birthday) FROM Patient WHERE SEX = 'male') AND Laboratory.RF < 20 AND YEAR(CURDATE()) - YEAR(Patient.Birthday) > 60
SELECT COUNT(*) FROM Examination WHERE RF < 20 AND Thrombosis = 0
SELECT COUNT(DISTINCT t1.ID) FROM (SELECT Patient.ID, Examination.ANA_Pattern, Examination.Examination_Date FROM Examination JOIN Patient ON Examination.Patient_ID = Patient.ID WHERE Examination.aCL_IgG > 35 AND Examination.aCL_IgM > 35 AND Examination.ANA_Pattern = 'P') AS t1
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Hematoclit < 29 OR Hematoclit > 52 AND Examination.aCL IgA = (SELECT MAX(aCL IgA) FROM Examination)
SELECT COUNT(DISTINCT ID) FROM Examination WHERE Thrombosis > 0 AND C4 > 10
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RNP = '-' AND Patient.Admission = '+'
SELECT Birthday FROM Patient WHERE RNP <> '-' ORDER BY Birthday DESC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE SM = '1' AND Thrombosis = '1'
SELECT ID FROM Patient WHERE Birthday IN (SELECT MAX(Birthday) FROM Patient) AND NOT SM IN('-', '+-') ORDER BY ID LIMIT 3
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Examination_Date > '1997-01-01' AND Examination.SC170 = '-'
SELECT COUNT(DISTINCT t1.ID) FROM (SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Examination.Examination_Date, Examination.aCL_IgG, Examination.aCL_IgM, Examination.ANA, Examination.ANA_Pattern, Examination.aCL_IgA, Examination.Diagnosis, Examination.KCT, Examination.RVVT, Examination.LAC, Examination.Symptoms, Examination.Thrombosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.aCL_IgG > 0 AND Examination.aCL_IgM > 0 AND Examination.ANA_Pattern = 'normal') AS t1 JOIN (SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Examination.Examination_Date, Examination.aCL_IgG, Examination.aCL_IgM, Examination.ANA, Examination.ANA_Pattern, Examination.aCL_IgA, Examination.Diagnosis, Examination.KCT, Examination.RVVT, Examination.LAC, Examination.Symptoms, Examination.Thrombosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.aCL_IgG > 0 AND Examination.aCL_IgM > 0 AND Examination.ANA_Pattern = 'normal' AND Patient.Sex = 'M' AND Patient.Symptoms = 'vertigo') AS t2 ON t1.ID = t2.ID
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE Patient.SEX = 'F' AND NOT Patient.SSA IN('-','+-') AND YEAR(Patient.First_Date) < 1990
SELECT ID FROM Patient WHERE `First Date` = (SELECT MIN(`First Date`) FROM Patient) AND SSA <> '-' OR SSA <> '+-' ORDER BY `First Date` LIMIT 1
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'SLE' AND Examination.SSB = '-'
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN('-', '+-') AND Symptoms IS NOT NULL
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND CENTROMEA IN('-', '+-') AND SSB IN('-', '+-')
SELECT DISTINCT Diagnosis FROM Examination WHERE `DNA-II` > 8
SELECT COUNT(DISTINCT ID) FROM Patient WHERE NOT Description IS NULL AND NOT DNA < 8
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND DNA_II < 8
SELECT COUNT(DISTINCT ID) FROM Examination WHERE GOT > 60 AND Diagnosis = 'SLE'
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND GOT < 60
SELECT MIN(Birthday) FROM Patient WHERE NOT GOT > 60
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT GOT < 60
SELECT MIN(First Date) FROM Patient WHERE ID IN (SELECT MAX(LDH) FROM Laboratory WHERE LDH < 500)
SELECT MAX(Patient.First_Date) FROM Patient WHERE Patient.ID IN (SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.LDH > = 500)
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND ALP > 300
SELECT COUNT(*) FROM Patient WHERE Admission = '-' AND ALP < 300
SELECT * FROM Examination WHERE TP < 6.0
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'SJS' AND TP > 6.0 AND TP < 8.5
SELECT MAX(ALB > 3.5 AND ALB < 5.5) AS ExaminationDate FROM Examination
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND ALB > 3.5 AND ALB < 5.5 AND TP BETWEEN 6.0 AND 8.5
SELECT MAX(aCL IgG, aCL IgM, aCL IgA) FROM Examination WHERE Sex = 'F' AND UA > 6.50
SELECT MAX(ANA) FROM Examination WHERE CRE < 1.5
SELECT Patient.ID  FROM Patient  INNER JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Creatinine < 1.5  AND Examination.aCL IgA = (SELECT MAX(aCL IgA) FROM Examination)
SELECT COUNT(*) FROM Examination WHERE `T-BIL` > = 2.0 AND ANA_Pattern = 'P';
SELECT MAX(T-BIL) FROM Laboratory WHERE T-BIL < 2.0
SELECT COUNT(*) FROM Examination WHERE `T-CHO` > 250 AND KCT = '-'
SELECT COUNT(*) FROM Examination WHERE `T-CHO` < 250 AND ANA_Pattern = 'P';
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms <> '';
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 GROUP BY T2.ID ORDER BY MAX(TG) DESC LIMIT 1
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CPK < 250
SELECT COUNT(*) FROM Examination WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+')
SELECT Birthday FROM Patient WHERE `First Date` = (SELECT MIN(`First Date`) FROM Patient) AND GLU > 180
SELECT COUNT(*) FROM Examination WHERE `T-BIL` < 180 AND Thrombosis = 0
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(*) FROM Patient WHERE Diagnosis = 'SLE' AND WBC BETWEEN 3.5 AND 9.0
SELECT Patient.ID FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RBC < 3.5 OR Examination.RBC > 6.0 AND Patient.Admission = '-'
SELECT COUNT(*) FROM Examination WHERE PLT > 100 AND PLT < 400 AND Diagnosis <> 'null'
SELECT * FROM Patient WHERE Diagnosis = 'MCTD' AND PLT > 100 AND PLT < 400
SELECT AVG(PT) FROM Patient WHERE Sex = 'M' AND PT < 14
SELECT COUNT(*) FROM Examination WHERE Thrombosis > 1 AND PT < 14
SELECT major_name FROM major WHERE first_name = "Angela" AND last_name = "Sanders"
SELECT COUNT(*) FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.college = 'Engineering'
SELECT T2.first_name, T2.last_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.department = "Art and Design"
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = "Women's Soccer" AND T3.first_name = "Student" AND T3.last_name = "Club"
SELECT T2.phone FROM event AS T1 JOIN "attendance" AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = "Women's Soccer"
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = "Women's Soccer" AND T1.t_shirt_size = "Medium"
SELECT event.event_name FROM event, attendance WHERE attendance.link_to_event = event.event_id AND event.event_name = (SELECT MAX(event.event_name) FROM event, attendance WHERE attendance.link_to_event = event.event_id AND event.event_name = 'Student_Club')
SELECT T2.college FROM "member" AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = "Vice President"
SELECT T2.event_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = "Maya" AND T3.last_name = "McLean"
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Student_Club' AND YEAR(T1.event_date) = 2019
SELECT COUNT(*) FROM event AS T1 JOIN "attendance" AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND COUNT(T2.link_to_member) > 10
SELECT T1.event_name FROM event AS T1 JOIN "attendance" AS T2 ON T1.event_id = T2.link_to_event WHERE T2.link_to_member = 'Student_Club' GROUP BY T1.event_name HAVING COUNT(T2.link_to_member) > 20
SELECT AVG(COUNT(DISTINCT event_id)) FROM event WHERE YEAR(event_date) = 2020 AND type = 'Meeting'
SELECT MAX(cost) FROM expense WHERE expense_description = 'club'
SELECT COUNT(*) FROM member WHERE major = 'Environmental Engineering'
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN "attendance" AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = "Laugh Out Loud"
SELECT last_name FROM member WHERE major = 'Law and Constitutional Studies'
SELECT county FROM zip_code WHERE city = "Sherri Ramsey"
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Tyler" AND T1.last_name = "Hewitt"
SELECT amount FROM income WHERE source = 'Vice President'
SELECT SUM(spent) FROM budget WHERE category = 'Food' AND event_status = 'Cancelled'
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'
SELECT T2.first_name, T2.last_name FROM zip_code AS T1 JOIN member AS T2 ON T1.zip = T2.zip WHERE T1.state = "IL"
SELECT SUM(spent) FROM budget WHERE category = 'Advertisement' AND event_status = 'Cancelled' AND event_name = 'September Meeting'
SELECT DISTINCT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Pierce" AND T1.last_name = "Guidi"
SELECT SUM(amount) FROM budget WHERE event_status = 'Approved' AND event_name = 'October Speaker'
SELECT expense_id FROM expense WHERE expense_date = '2019-10-08' AND approved = True
SELECT AVG(cost) FROM expense WHERE MONTH(expense_date) = 9 OR MONTH(expense_date) = 10 AND link_to_member = 'Elijah Allen'
SELECT (SELECT SUM(spent) FROM budget WHERE YEAR(event_date) = 2019) - (SELECT SUM(spent) FROM budget WHERE YEAR(event_date) = 2020)
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT SUM(cost) FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'
SELECT MAX(budget.amount) FROM budget WHERE budget.category = 'Food'
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'
SELECT COUNT(*) FROM major WHERE department = "Humanities and Social Sciences"
SELECT phone FROM member WHERE first_name = "Carlo" AND last_name = "Jacobs"
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Adela" AND T1.last_name = "O'Gallagher"
SELECT COUNT(*) FROM budget WHERE budget.event_status = 'November Meeting' AND budget.remaining < 0
SELECT SUM(amount) FROM budget WHERE event_status = 'September Speaker'
SELECT T1.status FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Post Cards, Posters' AND T1.event_date = '2019-8-20'
SELECT major_name FROM major WHERE department = 'EECS' AND college = 'Coleman'
SELECT COUNT(*) FROM member WHERE major = "Human Development and Family Studies" AND t_shirt_size = "Large"
SELECT zip_code.type FROM zip_code JOIN member ON member.zip = zip_code.zip_code WHERE member.first_name = "Christof" AND member.last_name = "Nielson"
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Sacha" AND T1.last_name = "Harrison"
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = "President"
SELECT date_received FROM income WHERE source = 'Dues'
SELECT first_name, last_name FROM member WHERE member_id IN (SELECT MIN(link_to_member) FROM income WHERE source = 'Dues')
SELECT (SELECT SUM(amount WHERE category = 'Advertisement' AND event_name = 'Yearly Kickoff') FROM budget) / (SELECT SUM(amount WHERE event_name = 'October Meeting' AND category = 'Advertisement') FROM budget)
SELECT DIVDE(SUM( amount where category = 'Parking' and event_name = 'November Speaker'), COUNT( event_name = 'November Speaker' )) * 100
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'
SELECT COUNT(*) FROM zip_code WHERE county = "Orange" AND state = "Virginia"
SELECT DISTINCT department FROM major WHERE college = "Humanities and Social Sciences"
SELECT T2.city, T2.county, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Amy" AND T1.last_name = "Firth"
SELECT expense_description FROM expense WHERE link_to_budget = (SELECT budget_id FROM budget ORDER BY remaining LIMIT 1)
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN "attendance" AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = "October Meeting"
SELECT major.college FROM major GROUP BY major.college ORDER BY COUNT(major.college) DESC LIMIT 1
SELECT major_name FROM major WHERE zip = "809-555-3360"
SELECT event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id GROUP BY T1.event_id ORDER BY SUM(T2.amount) DESC LIMIT 1
SELECT * FROM expense WHERE expense_description LIKE '%Vice President%'
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women's Soccer'
SELECT date_received FROM income WHERE first_name = "Casey" AND last_name = "Mason"
SELECT COUNT(*) FROM zip_code WHERE state = "Maryland"
SELECT COUNT(*) FROM member JOIN attendance ON member.member_id = attendance.link_to_member WHERE member.phone = "954-555-6240"
SELECT first_name, last_name FROM member WHERE department = "School of Applied Sciences, Technology and Education"
SELECT event_name FROM event WHERE status = 'Closed' ORDER BY DIVIDE(spent, amount) DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President'
SELECT MAX(spent) FROM budget
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020
SELECT SUM(spent) FROM budget WHERE category = 'Food'
SELECT T2.first_name, T2.last_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.member_id HAVING COUNT(T1.link_to_event) > 7
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id JOIN major AS T4 ON T3.major_id = T4.major_id WHERE T4.major_name = 'Interior Design' AND T1.event_name = 'Community Theater'
SELECT first_name, last_name FROM member WHERE zip = (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina')
SELECT SUM(income.amount) FROM income WHERE income.source = 'Grant Gilmour'
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip FROM zip_code WHERE county = 'Los Angeles' AND state = 'CA') AND income.amount > 40
SELECT SUM(cost) FROM expense WHERE event_id IN (SELECT event_id FROM event WHERE event_name = 'Baseball game' AND event_date = 'Yearly Kickoff')
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN budget AS T2 ON T1.member_id = T2.link_to_member WHERE T2.event_status = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name, T2.source FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.amount) DESC LIMIT 1
SELECT event_name FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id ORDER BY SUM(T2.cost) LIMIT 1
SELECT SUM(cost) FROM expense WHERE event_id IN (SELECT event_id FROM event WHERE event_name = 'Yearly Kickoff')
SELECT DIVDE(SUM(major_name = 'Finance'), SUM(major_name = 'Physics')) FROM major WHERE department = 'Business'
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'
SELECT COUNT(*) FROM member WHERE major = 'Physics Teaching'
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND YEAR(T1.event_date) = 2019
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = "Luisa" AND T3.last_name = "Guidi"
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Advertisement' GROUP BY T1.event_name ORDER BY SUM(T2.spent) DESC LIMIT 1
SELECT COUNT(*) > 0 FROM event, member WHERE event.event_name = 'Women's Soccer' AND member.first_name = 'Maya' AND member.last_name = 'Mclean' AND member.zip = (SELECT zip_code.zip_code FROM zip_code WHERE zip_code.city = 'Mclean')
SELECT SUM(type = 'Community Service') / COUNT(event_id) * 100 FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31' AND event_name = 'Student_Club'
SELECT SUM(cost) FROM expense WHERE expense_description = 'Posters' AND link_to_event = 'September Speaker'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 GROUP BY T1.event_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT expense_type, SUM(cost) FROM expense WHERE expense_date = 'October Meeting' GROUP BY expense_type
SELECT category, SUM(amount) FROM budget WHERE link_to_event = 'April Speaker' GROUP BY category ORDER BY SUM(amount)
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT budget_id, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3
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
SELECT category FROM event WHERE location = 'MU 215'
SELECT category FROM event WHERE event_date = '2020-03-24T12:00:00'
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'
SELECT COUNT(*) FROM member WHERE major_name = 'Mathematics'
SELECT category FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large'
SELECT COUNT(*) FROM major WHERE department = "School of Applied Sciences, Technology and Education" AND college = "Agriculture and Applied Sciences"
SELECT T2.last_name, T1.department, T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.major_name = 'Environmental Engineering'
SELECT budget.category FROM budget, event WHERE budget.spent = 0 AND event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.link_to_event = event.event_id
SELECT T2.city, T2.state FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.department = 'Electrical and Computer Engineering'
SELECT T1.event_name FROM event AS T1 JOIN "attendance" AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T1.location = '900 E. Washington St.' AND T1.type = 'Social'
SELECT T2.last_name, T2.position FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'
SELECT T2.last_name FROM event AS T1 JOIN "attendance" AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = "Women's Soccer"
SELECT COUNT(amount) FROM income WHERE source = 'Student_Club' AND t_shirt_size = 'Medium'
SELECT county FROM zip_code WHERE type = 'PO Box'
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'Puerto Rico'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'
SELECT T1.link_to_event FROM event AS T1 JOIN "attendance" AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.t_shirt_size > 50
SELECT T1.first_name, T1.last_name, T2.link_to_event FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.approved = 'true' AND T2.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Katy" AND T2.major_name = "rec1N0upiVLy5esTO"
SELECT phone FROM member WHERE major_name = 'Business' AND college = 'College of Agriculture and Applied Sciences'
SELECT email FROM member WHERE zip > (SELECT MAX(zip) FROM member)
SELECT COUNT(*) FROM member WHERE major_name = 'education' AND college = 'Education & Human Services'
SELECT SUM(remaining < 0) / COUNT(event_id) * 100 FROM budget
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT * FROM expense GROUP BY expense_description HAVING DIVIDE( SUM(cost), COUNT(expense_id) ) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT DIVIDE(SUM(type = 'PO Box'), COUNT(zip_code)) * 100 FROM zip_code WHERE type = 'PO Box'
SELECT T1.event_name, T1.location FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining > 0
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100
SELECT T1.first_name, T1.last_name, T1.major_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > 100
SELECT T1.city, T1.country FROM zip_code AS T1 JOIN event AS T2 ON T1.zip_code = T2.zip_code GROUP BY T1.city, T1.country HAVING COUNT(*) > 50
SELECT T1.first_name, T1.last_name, MAX(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(DISTINCT T2.link_to_event) > 1
SELECT AVG(cost) FROM expense WHERE link_to_member NOT IN (SELECT member_id FROM member WHERE position = 'Member')
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' AND T2.spent < (SELECT AVG(spent) FROM budget WHERE category = 'Parking')
SELECT SUM(cost) / COUNT(event_id) * 100 FROM expense WHERE event_status = 'Game'
SELECT budget_id FROM expense WHERE expense_description = 'Water, chips, cookies' ORDER BY cost DESC LIMIT 1
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > (SELECT AVG(cost) FROM expense)
SELECT (SELECT SUM(state = 'Maine') FROM member) - (SELECT SUM(state = 'Vermont') FROM member)
SELECT T2.major_name, T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = "Garrett" AND T1.last_name = "Gerke"
SELECT T1.first_name, T1.last_name, T1.email, T2.expense_description, T2.cost FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'
SELECT last_name, phone FROM member WHERE major = 'Elementary Education'
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker'
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Food'
SELECT first_name, last_name, amount FROM income WHERE date_received = '190909'
SELECT budget.category FROM budget, expense WHERE expense.expense_description = 'Posters' AND expense.link_to_budget = budget.budget_id
SELECT first_name, last_name, college FROM member WHERE position = "Secretary"
SELECT SUM(spent) FROM budget WHERE category = 'Speaker Gifts'
SELECT T2.city FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = "Garrett" AND T1.last_name = "Girke"
SELECT first_name, last_name, position FROM member WHERE zip = 28092 AND city = 'Lincolnton' AND state = 'North Carolina'
SELECT COUNT(*) FROM gasstations WHERE Country = "CZE" AND Segment = "Premium"
SELECT Currency, COUNT(*) AS Ratio FROM customers WHERE Currency IN ('EUR', 'CZK') GROUP BY Currency
SELECT CustomerID, MIN(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' GROUP BY CustomerID
SELECT AVG(Consumption) FROM yearmonth WHERE YEAR(Date) = 2013 AND Segment = 'SME'
SELECT c.CustomerID, c.Segment, c.Currency, SUM(y.Consumption) AS total_consumption FROM customers c INNER JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID, c.Segment, c.Currency ORDER BY total_consumption DESC LIMIT 1
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Segment = 'KAM' AND t2.Consumption < 30000 AND t2.Date BETWEEN '201201' AND '201212'
SELECT (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')) - (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR'))
SELECT Date FROM yearmonth WHERE Currency = 'EUR' GROUP BY Date ORDER BY SUM(Consumption) DESC LIMIT 1
SELECT Segment FROM yearmonth GROUP BY Segment ORDER BY SUM(Consumption) LIMIT 1
SELECT Date, MAX(Consumption) FROM yearmonth WHERE Currency = 'CZK' GROUP BY Date
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2013%'
SELECT      (SELECT AVG(Consumption)       FROM yearmonth       WHERE Date BETWEEN '201301' AND '201312'       GROUP BY CustomerID       ORDER BY AVG(Consumption) ASC       LIMIT 1) -      (SELECT AVG(Consumption)       FROM yearmonth       WHERE Date BETWEEN '201301' AND '201312'       GROUP BY CustomerID       ORDER BY AVG(Consumption) ASC       LIMIT 1) -      (SELECT AVG(Consumption)       FROM yearmonth       WHERE Date BETWEEN '201301' AND '201312'       GROUP BY CustomerID       ORDER BY AVG(Consumption) ASC       LIMIT 1)
SELECT Segment, MAX(Consumption) AS Max_Consumption, MAX(Consumption) * 100.0 / MAX(Consumption) AS Percentage_Increase FROM yearmonth WHERE Currency = 'EUR' AND Date BETWEEN '201201' AND '201312' GROUP BY Segment ORDER BY Percentage_Increase DESC LIMIT 1
SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201308' AND '201311' AND CustomerID = 6
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'Czech Republic' AND Segment = 'discount') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'discount')
SELECT (SELECT Consumption FROM yearmonth WHERE Date = '201304' AND CustomerID = 7) - (SELECT Consumption FROM yearmonth WHERE Date = '201304' AND CustomerID = 5)
SELECT (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') - (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR')
SELECT MAX(Consumption) FROM yearmonth WHERE Date = '201310' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM' AND Currency = 'Euro')
SELECT CustomerID, MAX(Consumption) FROM yearmonth GROUP BY CustomerID
SELECT SUM(Consumption) FROM yearmonth WHERE Date = '201305'
SELECT COUNT(*) FROM customers WHERE Segment = 'LAM' AND Consumption > 46.73
SELECT Country, COUNT(*) AS "Value for Money" FROM gasstations WHERE Segment = 'Value for Money' GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*) FROM customers WHERE Segment = 'KAM' AND Currency = 'Euro'
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Consumption > 528.3 AND t2.Date = '201202'
SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'premium'
SELECT CustomerID FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY SUM(Consumption) DESC LIMIT 1
SELECT Segment FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Date = '201309' GROUP BY t1.Segment ORDER BY SUM(t2.Consumption) LIMIT 1
SELECT c.CustomerID, c.Segment, MIN(y.Consumption) FROM customers c INNER JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' GROUP BY c.CustomerID, c.Segment
SELECT MAX(Consumption) FROM yearmonth WHERE YEAR(Date) = 2012
SELECT MAX(Consumption) FROM yearmonth
SELECT T1.Description FROM products AS T1 JOIN "yearmonth" AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Date = "201309"
SELECT T2.Country FROM "transactions_1k" AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = "201306"
SELECT T2.ChainID FROM "transactions_1k" AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Currency = 'Euro'
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Price = 1
SELECT AVG(Amount) FROM transactions_1k WHERE Date LIKE "%2012-01%"
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Currency = 'Euro' AND t2.Consumption > 1000
SELECT T1.Description FROM products AS T1 JOIN "transactions_1k" AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T3.Country = "CZE"
SELECT Time FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11)
SELECT COUNT(*) FROM gasstations AS t1 JOIN "transactions_1k" AS t2 ON t1.GasStationID = t2.GasStationID WHERE t1.Country = "CZE" AND t2.Price > 1000
SELECT COUNT(*) FROM gasstations AS t1 JOIN "transactions_1k" AS t2 ON t1.GasStationID = t2.GasStationID WHERE t1.Country = "CZE" AND t2.Date > "2012-01-01"
SELECT AVG(Amount) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE')
SELECT AVG(Price) FROM transactions_1k WHERE Currency = 'Euro'
SELECT CustomerID, MAX(Amount) FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID
SELECT Country, MIN(Date) FROM transactions_1k JOIN customers JOIN gasstations ON transactions_1k.CustomerID = customers.CustomerID AND transactions_1k.GasStationID = gasstations.GasStationID WHERE YEAR(Date) = 2012 AND MONTH(Date) = 8 AND transactions_1k.Amount > 0 GROUP BY Country ORDER BY MIN(Date) LIMIT 1
SELECT Currency FROM customers WHERE CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24 16:25:00')
SELECT Segment FROM customers WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-23 21:20:00' AND Time = '21:20:00')
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Currency = 'EUR'
SELECT Segment FROM customers ORDER BY Date LIMIT 1
SELECT Country FROM gasstations WHERE Date = '2012-08-24 12:42:00'
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND TIME = '21:20:00'
SELECT SUM(Consumption) AS expenses, Date FROM yearmonth WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24') AND Date = '2012-01-01'
SELECT COUNT(*) FROM transactions_1k WHERE Time BETWEEN '8:00' AND '9:00' AND Date = '2012-08-26' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE')
SELECT Currency FROM customers WHERE CustomerID IN (SELECT CustomerID FROM yearmonth WHERE Date LIKE '201306')
SELECT Country FROM gasstations WHERE ChainID = 667467
SELECT T2.Nationality FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T2.CustomerID = T3.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Amount = 548.4
SELECT COUNT(*) FROM customers WHERE Currency = 'EUR' AND Date = '2012-08-25'
SELECT (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-25' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8)) - (SELECT Consumption FROM yearmonth WHERE Date = '2012-08-24' AND CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8))
SELECT GasStationID FROM transactions_1k GROUP BY GasStationID ORDER BY SUM(Amount) DESC LIMIT 1
SELECT Segment, COUNT(*) AS Premium FROM customers WHERE Segment = 'SVK' GROUP BY Segment
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE "%201201%"
SELECT ProductID, Description, SUM(Amount) AS Total_Sales FROM transactions_1k INNER JOIN products ON transactions_1k.ProductID = products.ProductID GROUP BY ProductID, Description ORDER BY Total_Sales DESC LIMIT 5
SELECT CustomerID, AVG(Price) AS AveragePrice FROM transactions_1k GROUP BY CustomerID ORDER BY AveragePrice DESC LIMIT 1
SELECT Country FROM gasstations WHERE GasStationID = (SELECT GasStationID FROM transactions_1k WHERE ProductID = 2)
SELECT Consumption FROM yearmonth WHERE Date LIKE '%201208%' AND Price > 29.00
