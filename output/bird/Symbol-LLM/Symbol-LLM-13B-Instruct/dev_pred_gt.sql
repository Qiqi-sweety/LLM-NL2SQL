SELECT MAX(Percent(%) Eligible Free(K-12)) FROM frpm WHERE County = "Alameda"	california_schools
SELECT MIN(Percent(%) Eligible Free(Ages 5-17))  FROM frpm  WHERE School Type = 'Continuation'  GROUP BY CDSCode  ORDER BY Percent(%) Eligible Free(Ages 5-17) ASC	california_schools
SELECT Zip FROM schools WHERE County = "Fresno"	california_schools
SELECT T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState ORDER BY T1.FRPM Count (K-12) DESC LIMIT 1	california_schools
SELECT Phone FROM schools WHERE OpenDate > '2000-01-01' AND FundingType = 'Charter'	california_schools
SELECT COUNT(*) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath < 400 AND T1.Virtual = 1	california_schools
SELECT s.School, s.Magnet FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.Enroll12 > 500 AND s.Magnet = 1 OR s.Magnet = 1	california_schools
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead > 1500 GROUP BY T1.CDSCode ORDER BY T2.AvgScrRead DESC LIMIT 1	california_schools
SELECT s.School, COUNT(*) AS "Number of SAT Test Takers" FROM frpm AS f JOIN schools AS s ON f.CDSCode = s.CDSCode JOIN satscores AS t ON s.CDSCode = t.cds WHERE f.SchoolType = 'K-12' AND f.EducationalOptionType = 'Regular' GROUP BY s.School ORDER BY f.SchoolType DESC	california_schools
SELECT COUNT(DISTINCT cds) FROM satscores WHERE AvgScrMath > 560	california_schools
SELECT frpm.CDSCode, frpm.SchoolName, frpm.FRPMCount FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.SchoolName = (SELECT MAX(satscores.School) FROM satscores JOIN schools ON satscores.CDS = schools.CDSCode GROUP BY satscores.CDS)	california_schools
SELECT cds, COUNT(*) AS total_enrollment FROM satscores GROUP BY cds HAVING COUNT(*) > 500	california_schools
SELECT MAX(Percent(%) Eligible Free(Ages 5-17)) FROM frpm WHERE Enrollment(Ages 5-17) > 0	california_schools
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds GROUP BY T1.CDSCode ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 3	california_schools
SELECT cds, COUNT(*) AS Enrollment_5_to_17 FROM satscores GROUP BY cds ORDER BY Enrollment_5_to_17 DESC LIMIT 5	california_schools
SELECT DISTINCT District, AVG(Reading) FROM satscores GROUP BY District ORDER BY AVG(Reading) DESC	california_schools
SELECT COUNT(*) FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Alameda' AND T2.Enrollment(Ages 5-17) < 100	california_schools
SELECT cds, AVG(AvgScrWrite) FROM satscores GROUP BY cds ORDER BY AVG(AvgScrWrite) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM schools WHERE County = "Contra Costa" AND StatusType = "Direct" AND NOT Enroll12 > 250	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.CDS = T2.CDSCode GROUP BY T1.CDS ORDER BY AVG(T1.AvgScrMath) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm WHERE County = "Amador" AND LowGrade = 9 AND HighGrade = 12	california_schools
SELECT COUNT(*) FROM frpm WHERE County = "Los Angeles" AND Enrollment(K-12) > 500 AND FreeMealCount(K-12) < 700	california_schools
SELECT T1.School, T1.CDSCode, T1.County, T1.District, T1.School, T1.SchoolType, T1.EducationalOptionType, T1.NSLPProvisionStatus, T1.CharterSchool, T1.CharterSchoolNumber, T1.CharterFundingType, T1.IRC, T1.LowGrade, T1.HighGrade, T1.Enrollment, T1.FreeMealCount, T1.PercentEligibleFree, T1.FRPMCount, T1.PercentEligibleFRPM, T1.2013_14CALPADS_Fall1_CertificationStatus FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T1.School, T1.CDSCode, T1.County, T1.District, T1.School, T1.SchoolType, T1.EducationalOptionType, T1.NSLPProvisionStatus, T1.CharterSchool, T1.CharterSchoolNumber, T1.CharterFundingType, T1.IRC, T1.LowGrade, T1.HighGrade, T1.Enrollment, T1.FreeMealCount, T1.PercentEligibleFree, T1.FRPMCount, T1.PercentEligibleFRPM, T1.2013_14CALPADS_Fall1_CertificationStatus ORDER BY T1.Enrollment DESC	california_schools
SELECT DISTINCT T1.School, T1.Street, T1.City, T1.Zip, T1.State, T1.MailStreet, T1.MailStrAbr, T1.MailCity, T1.MailZip, T1.MailState, T1.Phone, T1.Ext, T1.Website, T1.OpenDate, T1.ClosedDate, T1.Charter, T1.CharterNum, T1.FundingType, T1.SOC, T1.SOCType, T1.EdOpsCode, T1.EdOpsName, T1.EILCode, T1.EILName, T1.GSoffered, T1.GSserved, T1.Virtual, T1.Magnet, T1.Latitude, T1.Longitude, T1.AdmFName1, T1.AdmLName1, T1.AdmEmail1, T1.AdmFName2, T1.AdmLName2, T1.AdmEmail2, T1.AdmFName3, T1.AdmLName3, T1.AdmEmail3 FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Enrollment(K-12) - T2.Enrollment(Ages 5-17) > 30	california_schools
SELECT T1.School, T1.SchoolName, T1.SchoolType, T1.EducationalOptionType, T1.SOC, T1.SOCType, T1.AdmFName1, T1.AdmLName1, T1.AdmEmail1, T1.AdmFName2, T1.AdmLName2, T1.AdmEmail2, T1.AdmFName3, T1.AdmLName3, T1.AdmEmail3, T2.AvgScrRead, T2.AvgScrMath, T2.AvgScrWrite, T2.NumGE1500 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.SchoolType = 'K-12' AND T1.EducationalOptionType = 'Charter' AND T2.AvgScrRead >= 1500 AND T2.AvgScrMath >= 1500 AND T2.AvgScrWrite >= 1500 AND T1.SchoolName IN (SELECT T2.School FROM frpm AS T2 WHERE T2.Percent(%)EligibleFree(K-12) > 0.1)	california_schools
SELECT T1.FundingType FROM schools AS T1 JOIN (SELECT AVG(satscores.AvgScrMath) AS AvgMath FROM satscores JOIN schools AS T2 ON satscores.cds = T2.CDSCode GROUP BY T2.CDSCode HAVING AVG(satscores.AvgScrMath) > 400) AS T3 ON T1.CDSCode = T3.CDSCode	california_schools
SELECT School, Street, City, Zip, State, MailStreet, MailStrAbr, MailCity, MailZip, MailState FROM schools WHERE County = "Monterey" AND Enrollment(Ages 15-17) > 800 GROUP BY School, Street, City, Zip, State, MailStreet, MailStrAbr, MailCity, MailZip, MailState ORDER BY Enrollment(Ages 15-17) DESC	california_schools
SELECT s.School, AVG(satscores.AvgScrWrite) AS Avg_Writing_Score FROM satscores JOIN schools s ON satscores.cds = s.CDSCode WHERE s.OpenDate > 1991 OR s.ClosedDate < 2000 GROUP BY s.School	california_schools
SELECT AdmFName1, AdmLName1, AdmEmail1, DOCType FROM schools WHERE (Enrollment(Ages 5-17) - Enrollment(K-12)) > (SELECT AVG(Enrollment(Ages 5-17) - Enrollment(K-12)) FROM schools WHERE FundingType = 'Locally Funded')	california_schools
SELECT OpenDate FROM schools ORDER BY Enroll12 DESC LIMIT 1	california_schools
SELECT City, MIN(Enrollment) FROM schools WHERE Grade = '1-12' GROUP BY City ORDER BY Enrollment ASC	california_schools
SELECT cds, COUNT(*) AS Enrollment FROM satscores WHERE enroll12 > 10000 GROUP BY cds ORDER BY Enrollment DESC	california_schools
SELECT cds, COUNT(*) AS FRPMCount FROM frpm WHERE cds IN (SELECT cds FROM schools WHERE EdOpsCode = 66) GROUP BY cds ORDER BY FRPMCount DESC LIMIT 5	california_schools
SELECT School, Website FROM schools WHERE Enrollment(Ages 5-17) BETWEEN 1900 AND 2000	california_schools
SELECT FRPMCount, PercentEligibleFRPM FROM frpm WHERE SchoolName = 'Kacey Gibson' AND AgeBetween(Enrollment, 5, 17)	california_schools
SELECT AdmEmail1 FROM schools WHERE Charter = (SELECT MIN(Charter) FROM schools)	california_schools
SELECT T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.Enroll12 >= 1500 GROUP BY T1.AdmFName1, T1.AdmLName1 ORDER BY T2.Enroll12 DESC	california_schools
SELECT Street, City, Zip, State FROM schools ORDER BY ExcellenceRate DESC LIMIT 1	california_schools
SELECT School.Website FROM School, satscores WHERE School.County = 'Los Angeles' AND satscores.cds = School.CDSCode AND satscores.Enroll12 BETWEEN 2000 AND 3000	california_schools
SELECT AVG(satscores.NumTstTakr) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND schools.County = 'Fresno'	california_schools
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds GROUP BY T1.CDSCode ORDER BY AVG(T2.AvgScrRead) ASC LIMIT 1	california_schools
SELECT s.CDSCode, AVG(s.AvgScrRead) AS AvgRead, AVG(s.AvgScrMath) AS AvgMath, AVG(s.AvgScrWrite) AS AvgWrite, COUNT(DISTINCT s.CDSCode) AS CountSchools FROM satscores AS s JOIN schools AS s1 ON s.cds = s1.CDSCode WHERE s1.Virtual = 'Yes' GROUP BY s.CDSCode ORDER BY AvgRead DESC LIMIT 5	california_schools
SELECT T1.EdOpsName, T1.EdOpsCode FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds GROUP BY T1.CDSCode ORDER BY T2.AvgScrMath DESC LIMIT 1	california_schools
SELECT AVG(satscores.AvgScrMath) AS MathScore, schools.County FROM satscores JOIN schools ON satscores.cds = schools.CDSCode GROUP BY schools.County ORDER BY MathScore ASC LIMIT 1	california_schools
SELECT AVG(satscores.AvgScrWrite) AS "Writing Score", schools.City FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumTstTakr >= 1500 GROUP BY schools.City ORDER BY schools.City	california_schools
SELECT s.School, AVG(satscores.AvgScrWrite) AS AvgWritingScore FROM satscores JOIN schools s ON satscores.cds = s.CDSCode WHERE s.AdmEmail1 LIKE '%Ricci Ulrich%' GROUP BY s.School	california_schools
SELECT T1.State, T1.CDSCode, MAX(T2.Enroll12) FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T1.State ORDER BY MAX(T2.Enroll12) DESC	california_schools
SELECT AVG(COUNT(DISTINCT School)) AS Average_Schools_Opened FROM schools WHERE County = "Alameda" AND District = "Elementary" AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31' GROUP BY MONTH(OpenDate)	california_schools
SELECT    (SELECT COUNT(*) FROM frpm WHERE County = "Orange" AND DistrictType = "Unified") /    (SELECT COUNT(*) FROM frpm WHERE County = "Orange" AND DistrictType = "Elementary")	california_schools
SELECT County, COUNT(DISTINCT School) AS "Number of Closed Schools" FROM schools WHERE ClosedDate IS NOT NULL GROUP BY County ORDER BY COUNT(DISTINCT School) DESC	california_schools
SELECT T2.Street, T2.StreetAbr, T2.City, T2.Zip, T2.State, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState, T2.Phone, T2.Ext, T2.Website, T2.OpenDate, T2.ClosedDate, T2.Charter, T2.CharterNum, T2.FundingType, T2.SOC, T2.SOCType, T2.EdOpsCode, T2.EdOpsName, T2.EILCode, T2.EILName, T2.GSoffered, T2.GSserved, T2.Virtual, T2.Magnet, T2.Latitude, T2.Longitude, T2.AdmFName1, T2.AdmLName1, T2.AdmEmail1, T2.AdmFName2, T2.AdmLName2, T2.AdmEmail2, T2.AdmFName3, T2.AdmLName3, T2.AdmEmail3 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T2.Street, T2.StreetAbr, T2.City, T2.Zip, T2.State, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState, T2.Phone, T2.Ext, T2.Website, T2.OpenDate, T2.ClosedDate, T2.Charter, T2.CharterNum, T2.FundingType, T2.SOC, T2.SOCType, T2.EdOpsCode, T2.EdOpsName, T2.EILCode, T2.EILName, T2.GSoffered, T2.GSserved, T2.Virtual, T2.Magnet, T2.Latitude, T2.Longitude, T2.AdmFName1, T2.AdmLName1, T2	california_schools
SELECT s.MailStreet, s.School FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode GROUP BY s.MailStreet ORDER BY AVG(t1.AvgScrRead) ASC LIMIT 1	california_schools
SELECT COUNT(*) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead >= 1500 AND T1.MailCity = "Lakeport"	california_schools
SELECT COUNT(*) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Fresno'	california_schools
SELECT School, MailZip FROM schools WHERE DOC = 'Avetik Atoian'	california_schools
SELECT COUNT(DISTINCT cds) FROM frpm WHERE County = 'Colusa' AND County != 'Humboldt'	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND County = 'San Joaquin' AND StatusType = 'Active'	california_schools
SELECT School.Phone, School.Ext FROM School JOIN (SELECT School.Phone, School.Ext, AVG(satscores.AvgScrWrite) AS AvgWriteScore FROM School JOIN satscores ON School.CDSCode = satscores.cds GROUP BY School.Phone, School.Ext) AS T1 ON School.CDSCode = T1.CDSCode ORDER BY AvgWriteScore DESC LIMIT 333	california_schools
SELECT Phone, Ext FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE AdmFName1 = 'Mike Larson' AND AdmLName1 = 'Dante Alvarez'	california_schools
SELECT Website FROM schools WHERE Virtual = 'Partial' AND County = 'San Joaquin'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DistrictType = 'Elementary'	california_schools
SELECT COUNT(*) FROM frpm WHERE County = "Los Angeles" AND Percent(%)EligibleFree(K-12) < 0.18	california_schools
SELECT AdmFName1, AdmLName1, AdmEmail1, AdmFName2, AdmLName2, AdmEmail2, AdmFName3, AdmLName3, AdmEmail3 FROM schools WHERE Charter = '00D2'	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = "Hickman" AND Charter = "00D4"	california_schools
SELECT County, COUNT(*) AS "Total Schools", SUM(CASE WHEN FundingType = 'Local' THEN 1 ELSE 0 END) AS "Locally Funded", SUM(CASE WHEN FundingType = 'Other' THEN 1 ELSE 0 END) AS "Other" FROM schools WHERE County = 'Santa Clara' GROUP BY County ORDER BY County	california_schools
SELECT COUNT(*) FROM schools WHERE County = "Stanislaus" AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND FundingType = 'Direct'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND ClosedDate LIKE '%1989%'	california_schools
SELECT County, COUNT(*) AS ClosedSchools FROM schools WHERE ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND SOCType = 'Youth Authority Facilities (CEA)' GROUP BY County ORDER BY ClosedSchools DESC	california_schools
SELECT NCESSchool FROM schools WHERE EdOpsCode = 'State Special Schools'	california_schools
SELECT COUNT(DISTINCT cds) FROM frpm WHERE County = "Alpine" AND DistrictType = "Community Day School"	california_schools
SELECT DISTINCT DistrictCode FROM schools WHERE City = "Fresno" AND Magnet IS NULL	california_schools
SELECT COUNT(*) FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'State Special School' AND T1.Academic Year = '2014-2015' AND T1.County Code = 'Fremont' AND T1.District Type = 'State' AND T1.School Type = 'State' AND T1.Educational Option Type = 'State' AND T1.NSLP Provision Status = 'Yes' AND T1.Charter School (Y/N) = 1 AND T1.Charter School Number = 1 AND T1.Charter Funding Type = 'State' AND T1.Low Grade = 'None' AND T1.High Grade = 'None' AND T1.Enrollment (K-12) = 10 AND T1.Free Meal Count (K-12) = 1 AND T1.Percent (%) Eligible Free (K-12) = 1 AND T1.FRPM Count (K-12) = 1 AND T1.Percent (%) Eligible FRPM (K-12) = 1	california_schools
SELECT FRPMCount, PercentEligibleFRPM FROM frpm WHERE SchoolName = 'Youth Authority' AND MailStreet = 'PO Box 1040' AND AgeBetween(Enrollment, 5, 17)	california_schools
SELECT MIN(LowGrade) FROM frpm WHERE DistrictType = 'Special Education Consortia' AND DistrictCode = 613360	california_schools
SELECT School FROM schools WHERE County = 37	california_schools
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.LowGrade = 9 AND T1.HighGrade = 12 AND T1.CountyName = "Merced" AND T1.DistrictType = 2 AND T1.SchoolType = 4 AND T1.EducationalOptionType = 2 AND T1.NSLPProvisionStatus = 2 AND T1.CharterSchool = 1 AND T1.CharterSchoolNumber = 2 AND T1.CharterFundingType = 1 AND T1.IRC = 1 GROUP BY T2.City ORDER BY T2.City	california_schools
SELECT schools.School, schools.Percent(%)_Eligible_FRPM(Ages_5-17) FROM frpm JOIN schools ON frpm.SchoolCode = schools.CDSCode WHERE schools.County = "Los Angeles" AND schools.SchoolType = "K-9"	california_schools
SELECT AdmFName1, AdmLName1, AdmEmail1, COUNT(*) AS Count  FROM schools  WHERE City = "Adelanto"  GROUP BY AdmFName1, AdmLName1, AdmEmail1  ORDER BY Count DESC	california_schools
SELECT County, COUNT(*) FROM frpm WHERE County IN ('San Diego', 'Santa Barbara') AND NOT SchoolType IS NULL GROUP BY County ORDER BY County	california_schools
SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1	california_schools
SELECT School, MIN(LowGrade) FROM frpm WHERE State = 'California' GROUP BY School ORDER BY LowGrade ASC	california_schools
SELECT AdmFName1, AdmLName1, AdmEmail1, AdmFName2, AdmLName2, AdmEmail2, AdmFName3, AdmLName3, AdmEmail3 FROM schools ORDER BY Longitude DESC	california_schools
SELECT COUNT(DISTINCT cds) FROM schools WHERE StatusType = 'Open' AND GradeSpan = 'K-8' AND Magnet = 1	california_schools
SELECT AdmFName1, AdmLName1 FROM schools GROUP BY AdmFName1, AdmLName1 ORDER BY COUNT(*) DESC LIMIT 2	california_schools
SELECT DISTINCT T1.DistrictCode, T1.Percent(%)EligibleFree(K-12) FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine'	california_schools
SELECT T2.AdmLName3, T2.District, T2.County, T2.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterNum = 40 GROUP BY T2.AdmLName3 ORDER BY T2.AdmLName3	california_schools
SELECT AdmEmail1 FROM schools WHERE County = "San Bernardino" AND District = "San Bernardino City Unified" AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND EdOpsName = 'Public Intermediate/Middle Schools' AND EdOpsName = 'Unified Schools' GROUP BY AdmEmail1 ORDER BY AdmEmail1	california_schools
SELECT T1.AdmEmail1 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.CDS WHERE T2.AvgScrRead >= 1500 GROUP BY T1.CDSCode ORDER BY T2.AvgScrRead DESC LIMIT 1	california_schools
SELECT COUNT(DISTINCT account_id) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'East Bohemia') AND date > (SELECT MAX(date) FROM trans)	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prague') AND frequency = 'None'	financial
SELECT AVG(A15) FROM district WHERE A15 IS NOT NULL GROUP BY A15 ORDER BY A15 DESC LIMIT 1	financial
SELECT COUNT(DISTINCT district_id) FROM district WHERE A14 > 6000 AND A14 < 10000	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'North Bohemia') AND AVG(birth_date) > 8000 GROUP BY district_id	financial
SELECT account_id, AVG(salary) FROM client WHERE gender = 'female' GROUP BY account_id ORDER BY AVG(salary) LIMIT 1	financial
SELECT account_id, AVG(salary) FROM client GROUP BY account_id ORDER BY AVG(salary) DESC LIMIT 1	financial
SELECT COUNT(DISTINCT client_id) FROM client WHERE gender = 'Owner'	financial
SELECT DISTINCT T1.client_id, T1.gender, T1.birth_date, T1.district_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'Statement of Issuance' GROUP BY T1.client_id, T1.gender, T1.birth_date, T1.district_id ORDER BY T1.client_id	financial
SELECT account_id, MIN(amount) FROM loan WHERE date LIKE '1997%' GROUP BY account_id ORDER BY amount ASC	financial
SELECT account_id, MAX(amount) FROM loan WHERE duration > 12 GROUP BY account_id HAVING MAX(amount) > 1000000 ORDER BY account_id	financial
SELECT COUNT(*) FROM client WHERE gender = 'female' AND birth_date < 1950 AND district_id = (SELECT district_id FROM district WHERE A2 = 'Slokolov')	financial
SELECT account_id, date FROM account WHERE date LIKE '1995%' ORDER BY date ASC	financial
SELECT DISTINCT account_id FROM account WHERE date < 1997 AND account_id IN (SELECT account_id FROM trans WHERE amount > 3000)	financial
SELECT client_id FROM card WHERE issued = '1994/3/3'	financial
SELECT account_id FROM trans WHERE date = '1998-10-14'	financial
SELECT district_id FROM account WHERE date = '1994-08-25'	financial
SELECT MAX(amount) FROM trans WHERE account_id IN (SELECT account_id FROM card WHERE issued = '1996-10-21')	financial
SELECT gender FROM client WHERE NOT gender IS NULL ORDER BY birth_date ASC LIMIT 1	financial
SELECT trans.amount FROM account, client, loan, trans WHERE loan.account_id = account.account_id AND loan.status = 'open' AND loan.type = 'loan' AND loan.date = (SELECT MAX(date) FROM loan) AND client.client_id = account.client_id AND client.client_id = trans.account_id AND client.gender = 'None' AND client.birth_date = 'None' AND trans.date > loan.date ORDER BY trans.date LIMIT 1	financial
SELECT COUNT(*) FROM client WHERE gender = 'female' AND district_id IN (SELECT DISTINCT district_id FROM account WHERE bank = 'Jesenik')	financial
SELECT trans.disp_id FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.date = '1998-09-02' AND trans.amount = 5100	financial
SELECT COUNT(*) FROM account WHERE date LIKE "%1996%"	financial
SELECT DISTINCT district_id FROM client WHERE birth_date = '1976-01-29'	financial
SELECT birth_date FROM client WHERE client_id = (SELECT client_id FROM loan WHERE date = '1996-01-03' AND amount = 98832)	financial
SELECT account_id FROM account WHERE district_id = (SELECT MIN(district_id) FROM account)	financial
SELECT COUNT(*) FROM client WHERE gender = 'male' AND district_id = (SELECT district_id FROM district WHERE A2 = 'South Bohemia' AND A14 = (SELECT MAX(A14) FROM district WHERE A2 = 'South Bohemia')) GROUP BY district_id	financial
SELECT (SELECT MAX(balance) FROM trans WHERE date BETWEEN '1993-03-22' AND '1998-12-27' AND account_id IN (SELECT account_id FROM loan WHERE date = '1993-07-05')) - (SELECT MIN(balance) FROM trans WHERE date BETWEEN '1993-03-22' AND '1998-12-27' AND account_id IN (SELECT account_id FROM loan WHERE date = '1993-07-05'))	financial
SELECT loan_id, SUM(amount) AS total_amount, SUM(amount) * 100.0 / SUM(amount) AS percentage_paid FROM loan WHERE status = 'paid' GROUP BY loan_id	financial
SELECT account_id, COUNT(account_id) FROM loan WHERE amount < 100000 GROUP BY account_id	financial
SELECT account_id, district_name, district_region FROM account WHERE date > (SELECT MAX(date) FROM trans) AND year = 1993	financial
SELECT account_id, COUNT(account_id) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'east' AND A4 = 'Bohemia' AND A5 = 'None' AND A6 = 'None' AND A7 = 'None' AND A8 = 'None' AND A9 = 'None' AND A10 = 'None' AND A11 = 'None' AND A12 = 'None' AND A13 = 'None' AND A14 = 'None' AND A15 = 'None' AND A16 = 'None') AND frequency = 'None' AND date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY account_id ORDER BY account_id	financial
SELECT account_id, date FROM account WHERE district_id = (SELECT district_id FROM district WHERE district_name = 'Prachatice')	financial
SELECT district.A2, district.A3, district.A4, district.A5, district.A6, district.A7, district.A8, district.A9, district.A10, district.A11, district.A12, district.A13, district.A14, district.A15, district.A16 FROM district JOIN loan ON loan.district_id = district.district_id WHERE loan.loan_id = 4990	financial
SELECT account_id, district_id, region FROM account WHERE amount > 300000 GROUP BY account_id, district_id, region	financial
SELECT loan_id, district_id, AVG(salary)  FROM loan  WHERE duration = 60  GROUP BY district_id	financial
SELECT district, state, (1996-1995)*100/1995 AS rate_increase FROM loan JOIN client ON loan.client_id = client.client_id WHERE loan.status = 'running' AND client.district_id = (SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1) AND loan.district_id = district_id GROUP BY district, state	financial
SELECT district_id, COUNT(district_id) FROM account WHERE date LIKE '1993%' GROUP BY district_id ORDER BY district_id	financial
SELECT account_id FROM account WHERE frequency = 'Monthly'	financial
SELECT district_id, COUNT(*) AS num_female_account_holders FROM account WHERE gender = 'female' GROUP BY district_id ORDER BY num_female_account_holders DESC	financial
SELECT district.A2, district.A3, district.A4, district.A5, district.A6, district.A7, district.A8, district.A9, district.A10, district.A11, district.A12, district.A13, district.A14, district.A15, loan.amount, loan.date, loan.status, loan.type FROM loan JOIN district ON loan.district_id = district.district_id WHERE loan.type = 'withdrawal' AND loan.date LIKE '%1996-01%' GROUP BY loan.district_id, loan.type, loan.date, loan.amount, loan.status ORDER BY loan.amount DESC	financial
SELECT COUNT(DISTINCT account_id) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'South Bohemia') AND NOT account_id IN (SELECT account_id FROM card)	financial
SELECT district_id, MAX(loan_id) FROM loan GROUP BY district_id	financial
SELECT AVG(amount) FROM loan WHERE gender = 'M'	financial
SELECT district_id, district_name, MAX(A11)  FROM district  WHERE A11 IS NOT NULL  GROUP BY district_id  ORDER BY MAX(A11) DESC	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT MAX(district_id) FROM account)	financial
SELECT COUNT(DISTINCT account_id) FROM account WHERE frequency = 'Monthly' AND balance < 0	financial
SELECT COUNT(*) FROM loan WHERE date BETWEEN '1995-01-01' AND '1997-12-31' AND amount >= 250000 AND frequency = 'Monthly'	financial
SELECT COUNT(DISTINCT account_id) FROM account WHERE district_id = 1	financial
SELECT COUNT(*) FROM client WHERE gender = 'male' AND district_id = (SELECT district_id FROM crime WHERE date LIKE '%1995%' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 2, 1)	financial
SELECT COUNT(*) FROM card WHERE type = 'disponent'	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek')	financial
SELECT DISTINCT district_id FROM account WHERE amount > 10000	financial
SELECT account_id, k_symbol, amount FROM trans WHERE type = 'household' AND bank = 'Pisek' GROUP BY account_id, k_symbol, amount ORDER BY amount DESC	financial
SELECT account_id FROM account WHERE type = 'gold' INTERSECT SELECT account_id FROM account WHERE type = 'junior'	financial
SELECT AVG(amount) FROM loan WHERE date BETWEEN '2021-01-01' AND '2021-12-31'	financial
SELECT account_id FROM account WHERE frequency = 'credit' GROUP BY account_id HAVING AVG(amount) < (SELECT AVG(amount) FROM account WHERE frequency = 'credit')	financial
SELECT DISTINCT T1.client_id, T1.gender, T2.card_id, T2.type, T2.issued, T3.loan_id, T3.date, T3.amount, T3.status, T3.payments, T3.duration, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments, T3.payments,	financial
SELECT COUNT(*) FROM client WHERE gender = 'female' AND district_id IN (SELECT DISTINCT district_id FROM district WHERE A2 = 'South Bohemia')	financial
SELECT * FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Tabor') AND frequency = 'None'	financial
SELECT type FROM account WHERE NOT account_id IN (SELECT account_id FROM loan) GROUP BY type	financial
SELECT COUNT(DISTINCT account_id) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = (SELECT DISTINCT district_id FROM district WHERE district_name = 'North Bohemia') AND T2.bank = 'AB'	financial
SELECT DISTINCT T1.A2, T1.A3, T1.A4, T1.A5, T1.A6, T1.A7, T1.A8, T1.A9, T1.A10, T1.A11, T1.A12, T1.A13, T1.A14, T1.A15, T1.A16 FROM district AS T1 JOIN trans AS T2 ON T1.district_id = T2.district_id WHERE T2.type = 'Withdrawal'	financial
SELECT AVG(1995 AS _crimes) FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY T2.account_id HAVING COUNT(*) > 4000	financial
SELECT COUNT(*) FROM card WHERE type = 'classic'	financial
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha') AND gender = 'Male'	financial
SELECT COUNT(*) FROM card WHERE type = 'Gold' AND issued < 1998	financial
SELECT T1.client_id, T1.gender, T1.birth_date, T2.account_id, T2.date, T2.amount FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.account_id GROUP BY T1.client_id, T1.gender, T1.birth_date, T2.account_id, T2.date, T2.amount ORDER BY T2.amount DESC LIMIT 1	financial
SELECT COUNT(*) FROM trans WHERE date LIKE "%1995%" AND bank = (SELECT bank FROM account WHERE account_id = 532)	financial
SELECT DISTINCT district_id FROM account WHERE account_id = 33333	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 3356) AND type = 'cash'	financial
SELECT COUNT(*) FROM account WHERE frequency = 'Weekly' AND NOT account_id IN (SELECT account_id FROM loan WHERE amount > 200000)	financial
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 13539)	financial
SELECT district_id FROM client WHERE client_id = 3541	financial
SELECT district_id, COUNT(*) AS count FROM account WHERE status = 'paid' GROUP BY district_id ORDER BY count DESC	financial
SELECT account.client_id, account.district_id, account.frequency, account.date FROM account JOIN order ON account.account_id = order.account_id WHERE order.order_id = 32423	financial
SELECT * FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = 5	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik')	financial
SELECT DISTINCT T1.client_id FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'junior' AND T2.issued > 1996	financial
SELECT COUNT(*) AS count, gender FROM client WHERE district_id IN (SELECT AVG(A10) FROM district) AND gender = 'female' GROUP BY gender ORDER BY count DESC	financial
SELECT account_id, SUM(amount) AS total_amount FROM loan WHERE date BETWEEN '1996-01-01' AND '1997-12-31' GROUP BY account_id	financial
SELECT COUNT(*) FROM card WHERE type = 'credit' AND issued > 1995	financial
SELECT A15 - A16 FROM district WHERE A2 = 'East' AND A3 = 'North' AND A4 = 'Bohemia' AND A5 = '1996'	financial
SELECT COUNT(DISTINCT type) FROM card WHERE account_id = 1	financial
SELECT frequency FROM account WHERE account_id = 3	financial
SELECT birth_date FROM client WHERE client_id = 130	financial
SELECT COUNT(DISTINCT account_id) FROM account WHERE frequency = 'owner disposition'	financial
SELECT SUM(t2.amount) FROM client AS t1 JOIN loan AS t2 ON t1.client_id = t2.account_id WHERE t1.client_id = 992	financial
SELECT SUM(t.amount) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.client_id = 4 AND t.trans_id = 851	financial
SELECT type FROM card WHERE disp_id = (SELECT disp_id FROM disp WHERE client_id = 9)	financial
SELECT SUM(amount) FROM trans WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 617) AND date BETWEEN '1998-01-01' AND '1998-12-31'	financial
SELECT client_id, birth_date FROM client WHERE birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'East Bohemia')	financial
SELECT loan_id, account_id, amount FROM loan ORDER BY amount DESC LIMIT 3	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND account_id IN (SELECT account_id FROM trans WHERE amount > 4000)	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > 1996	financial
SELECT COUNT(*) FROM client WHERE gender = 'female' AND type = 'junior'	financial
SELECT COUNT(DISTINCT account_id) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prague') AND gender = 'female'	financial
SELECT COUNT(*) FROM client WHERE gender = 'male' AND date BETWEEN '2019-01-01' AND '2019-12-31'	financial
SELECT COUNT(DISTINCT client_id) FROM client WHERE gender = 'User' AND frequency = 'Weekly'	financial
SELECT account_id, MIN(amount) AS min_amount FROM loan WHERE duration > 24 GROUP BY account_id ORDER BY min_amount ASC	financial
SELECT account_id FROM client WHERE gender = 'female' GROUP BY account_id ORDER BY AVG(birth_date) ASC LIMIT 1	financial
SELECT COUNT(*) FROM client WHERE birth_date = 1920 AND district_id IN (SELECT district_id FROM district WHERE A2 = 'East' AND A4 = 'Bohemia')	financial
SELECT COUNT(*) FROM loan WHERE duration = 24 AND payments = 0	financial
SELECT AVG(amount) FROM loan WHERE status = 'running' AND date BETWEEN (SELECT MAX(date) FROM loan WHERE status = 'running') AND (SELECT MIN(date) FROM loan WHERE status = 'running')	financial
SELECT client_id, district_id FROM client WHERE gender = 'Male'	financial
SELECT client_id, age FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE type = 'high' AND issued = (SELECT MAX(issued) FROM disp WHERE type = 'high') ORDER BY issued DESC LIMIT 1)	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'Cl'	toxicology
SELECT AVG(oxygen) FROM atom WHERE bond_type = 'single'	toxicology
SELECT AVG(CASE WHEN bond_type = 'single' THEN 1 ELSE 0 END) FROM bond	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'Na' AND NOT molecule_id IS NULL	toxicology
SELECT DISTINCT molecule_id FROM connected WHERE bond_type = 'triple'	toxicology
SELECT COUNT(DISTINCT atom_id) FROM connected WHERE bond_type = 'double'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = 'triple'	toxicology
SELECT COUNT(*) FROM atom WHERE NOT element = 'Br'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'carcinogenic' GROUP BY label ORDER BY label ASC LIMIT 100	toxicology
SELECT molecule_id FROM atom WHERE element = 'Si'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_type = 'double'	toxicology
SELECT label FROM atom WHERE element = 'H' GROUP BY label ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT DISTINCT bond_type FROM bond WHERE bond_type = 'Te'	toxicology
SELECT DISTINCT atom_id FROM connected WHERE bond_type = 'single'	toxicology
SELECT DISTINCT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = 'Non-carcinogenic') GROUP BY atom_id ORDER BY atom_id	toxicology
SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR004_8' AND atom_id2 = 'TR004_20')	toxicology
SELECT label FROM molecule WHERE NOT molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'Sn')	toxicology
SELECT COUNT(DISTINCT atom_id) FROM connected WHERE bond_type = 'single' AND (element = 'I' OR element = 'S')	toxicology
SELECT DISTINCT atom_id, atom_id2 FROM connected WHERE bond_id = 'triple'	toxicology
SELECT DISTINCT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR181')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'carcinogenic' AND element NOT IN (SELECT element FROM atom WHERE element = 'fluorine')	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = 'triple'	toxicology
SELECT element FROM atom WHERE molecule_id = (SELECT molecule_id FROM molecule WHERE label = 'TR000') ORDER BY element	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE label = 'carcinogenic'	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR_000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id = (SELECT atom_id FROM connected WHERE atom_id = 'TR000_2') GROUP BY bond_id	toxicology
SELECT molecule_id, label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = 'double') ORDER BY molecule_id	toxicology
SELECT COUNT(DISTINCT bond_id) FROM bond WHERE molecule_id = 'TR008' AND bond_type = 'double'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'carcinogenic'	toxicology
SELECT COUNT(DISTINCT atom.atom_id) FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.atom_id2 = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR060'	toxicology
SELECT bond_type, COUNT(*) FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT molecule_id, label FROM molecule WHERE NOT molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = 'single') ORDER BY label	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 12	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'carcinogenic' AND element = 'Br'	toxicology
SELECT bond_type, atom_id FROM bond WHERE bond_id = 'TR001_6_9'	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR001_10'	toxicology
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = 'triple'	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 19	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004'	toxicology
SELECT COUNT(*) FROM molecule WHERE label != 'carcinogenic'	toxicology
SELECT molecule_id FROM molecule WHERE label = 'carcinogenic'	toxicology
SELECT DISTINCT bond_id FROM bond WHERE bond_type = 'P-N'	toxicology
SELECT molecule_id, COUNT(DISTINCT bond_id) FROM connected GROUP BY molecule_id ORDER BY COUNT(DISTINCT bond_id) DESC LIMIT 1	toxicology
SELECT AVG(bond_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'I')	toxicology
SELECT bond_type, bond_id FROM bond WHERE atom_id = 45	toxicology
SELECT element FROM atom WHERE NOT molecule_id IS NULL	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = (SELECT bond_id FROM bond WHERE bond.molecule_id = (SELECT molecule_id FROM molecule WHERE molecule.label = 'TR447'))	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR144_8_19'	toxicology
SELECT molecule_id, COUNT(DISTINCT bond_id) FROM connected GROUP BY molecule_id ORDER BY COUNT(DISTINCT bond_id) DESC	toxicology
SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1	toxicology
SELECT DISTINCT atom_id FROM atom WHERE element = 'Pb'	toxicology
SELECT DISTINCT element FROM atom WHERE bond_type = 'triple'	toxicology
SELECT    element,    COUNT(*) AS count  FROM    atom  GROUP BY    element  ORDER BY    count DESC	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = 'single'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'carbon' OR element = 'hydrogen'	toxicology
SELECT atom_id2 FROM atom WHERE element = 'Sulfur'	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'Sn')	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = 'single')	toxicology
SELECT COUNT(DISTINCT atom_id) FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE element = 'phosphorus' OR element = 'br'))	toxicology
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = 'carcinogenic')	toxicology
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = 'single' EXCEPT SELECT DISTINCT molecule_id FROM molecule WHERE label = 'carcinogenic'	toxicology
SELECT molecule_id, element, COUNT(element) AS percentage FROM atom WHERE bond_type = 'single' GROUP BY molecule_id, element	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000' OR molecule_id = 'TR001' OR molecule_id = 'TR002'	toxicology
SELECT molecule_id FROM molecule WHERE label = 'Non-carcinogenic'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'carcinogenic' AND molecule_id BETWEEN 'TR000' AND 'TR030'	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label BETWEEN 'TR000' AND 'TR050')	toxicology
SELECT element FROM atom WHERE atom_id = 'TR001_10_11'	toxicology
SELECT COUNT(DISTINCT bond_id) FROM bond WHERE element = 'Iodine'	toxicology
SELECT COUNT(*) FROM molecule WHERE element = 'Calcium'	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_1_8' AND atom.element = 'Cl'	toxicology
SELECT molecule_id FROM molecule WHERE label = 'triple bond non carcinogenic'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'carcinogenic'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = 'double'	toxicology
SELECT atom_id FROM bond WHERE bond_type = 'triple'	toxicology
SELECT element FROM atom WHERE molecule_id = (SELECT molecule_id FROM bond WHERE bond_id = 'TR005_16_26')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'single bond' AND NOT molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = 'carcinogenic')	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR001_10_11'	toxicology
SELECT bond_id FROM bond WHERE bond_type = 'triple'	toxicology
SELECT COUNT(DISTINCT atom.atom_id) FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id IN (SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = 'carcinogenic') AND atom.element = 'toxicology'	toxicology
SELECT molecule_id, COUNT(DISTINCT atom_id) FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = 'Hydrogen') GROUP BY molecule_id	toxicology
SELECT DISTINCT molecule_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = 'carcinogenic')	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'Te')	toxicology
SELECT DISTINCT element FROM atom	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = 'triple'	toxicology
SELECT COUNT(DISTINCT atom_id) FROM connected WHERE bond_type = 'double'	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'TR151'	toxicology
SELECT DISTINCT atom.element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = 'TR151'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'carcinogenic'	toxicology
SELECT atom_id FROM atom WHERE molecule_id BETWEEN TR010 AND TR050 AND element = 'C'	toxicology
SELECT COUNT(DISTINCT atom_id) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = 'carcinogenic compounds'	toxicology
SELECT bond_id FROM bond WHERE bond_type = 'double'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'hydrogen' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = 'carcinogenic compound')	toxicology
SELECT molecule_id FROM bond WHERE bond_type = 'TR00_1_2'	toxicology
SELECT atom_id FROM atom WHERE element = 'carbon' EXCEPT SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = 'carcinogenic')	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM connected WHERE bond_type = 'Carcinogenic'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'TR124'	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR007_4_19'	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = 'double' AND molecule_id = 'TR006'	toxicology
SELECT DISTINCT molecule_id, element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = 'carcinogenic') GROUP BY molecule_id, element ORDER BY element ASC	toxicology
SELECT DISTINCT atom_id, atom_id2, bond_id FROM connected WHERE bond_type = 'single'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'triple'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = 'Cl'	toxicology
SELECT atom_id, COUNT(DISTINCT bond_type) FROM connected WHERE molecule_id = 'TR346' GROUP BY atom_id ORDER BY bond_type ASC	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = 'double' AND molecule.label = 'carcinogenic compound'	toxicology
SELECT COUNT(*) FROM molecule WHERE NOT label LIKE '%S%' AND NOT molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = 'double')	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = 'single'	toxicology
SELECT DISTINCT molecule_id FROM molecule WHERE label LIKE '%cl%'	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c' EXCEPT SELECT DISTINCT molecule_id FROM molecule WHERE label = 'carcinogenic'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'Chlorine'	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id = 'TR001_3_4'	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2')	toxicology
SELECT molecule_id FROM atom WHERE atom_id = 'TR000_2'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'TR000'	toxicology
SELECT COUNT(DISTINCT atom_id) FROM connected WHERE bond_type = 'single'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'Nitrogen'	toxicology
SELECT DISTINCT molecule_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = 'double' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'Sulphur'))	toxicology
SELECT DISTINCT molecule_id FROM connected GROUP BY molecule_id HAVING COUNT(atom_id) > 5	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR024'	toxicology
SELECT molecule_id, COUNT(atom_id) FROM connected GROUP BY molecule_id ORDER BY COUNT(atom_id) DESC LIMIT 1	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'carcinogenic'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = 'carcinogenic'	toxicology
SELECT COUNT(*) FROM molecule WHERE NOT molecule_id IN (SELECT molecule_id FROM bond)	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR004_7'	toxicology
SELECT COUNT(*) FROM molecule WHERE label LIKE '%O=O%'	toxicology
SELECT COUNT(*) FROM molecule WHERE label IS NOT NULL	toxicology
SELECT element, bond_type FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.molecule_id = 'TR016'	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR012'	toxicology
SELECT atom_id FROM atom WHERE element = 'O'	toxicology
SELECT cards.name, cards.power, cards.toughness, cards.flavorText, cards.text, cards.frameEffects, cards.frameVersion, cards.manaCost, cards.convertedManaCost, cards.faceConvertedManaCost, cards.faceName, cards.flavorName, cards.colorIdentity, cards.colorIndicator, cards.colors, cards.cardKingdomFoilId, cards.cardKingdomId, cards.borderColor, cards.hasAlternativeDeckLimit, cards.hasContentWarning, cards.hasFoil, cards.hasNonFoil, cards.isAlternative, cards.isFullArt, cards.isOnlineOnly, cards.isOversized, cards.isPromo, cards.isReserved, cards.isStarter, cards.isStorySpotlight, cards.isTextless, cards.isTimeshifted, cards.mtgArenaId, cards.mtgjsonV4Id, cards.mtgoFoilId, cards.mtgoId, cards.multiverseId, cards.otherFaceIds, cards.power, cards.printings, cards.promoTypes, cards.purchaseUrls, cards.rarity, cards.scryfallId, cards.scryfallIllustrationId, cards.scryfallOracleId, cards.setCode, cards.text, cards.toughness, cards.types, cards.variations, cards.watermark FROM cards WHERE cards.power > 5 ORDER BY cards.power DESC	card_games
SELECT * FROM cards WHERE borderColor = 'None' AND foil = 0	card_games
SELECT name FROM cards WHERE convertedManaCost > faceConvertedManaCost GROUP BY name	card_games
SELECT cards.name FROM cards WHERE cards.frameVersion = '2015' AND cards.edhrecRank < 100	card_games
SELECT DISTINCT cards.name FROM cards, legalities WHERE cards.id = legalities.cards_id AND legalities.status = 'banned' AND legalities.format = 'gladiator' AND cards.rarity = 'mythic' GROUP BY cards.name	card_games
SELECT DISTINCT legalities.status FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE cards.type = 'Artifact' AND NOT cards.variations IS NULL AND legalities.format = 'Vintage'	card_games
SELECT cards.id, cards.artist FROM cards WHERE cards.power = 'None' AND cards.isCommanderLegal = 1 GROUP BY cards.id, cards.artist ORDER BY cards.id	card_games
SELECT c.text, r.text FROM cards c JOIN rulings r ON c.id = r.id WHERE c.illustrator = 'Stephen Daniel'	card_games
SELECT * FROM rulings WHERE rulings.cardId = (SELECT cards.id FROM cards WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s')	card_games
SELECT cards.name, cards.artist, COUNT(*) AS rulings FROM cards JOIN rulings ON cards.id = rulings.cardId GROUP BY cards.name, cards.artist ORDER BY rulings DESC	card_games
SELECT DISTINCT name FROM cards WHERE number = 29	card_games
SELECT * FROM cards WHERE languages = 'Japanese'	card_games
SELECT COUNT(*) AS total, SUM(CASE WHEN availability = 'yes' THEN 1 ELSE 0 END) AS available, SUM(CASE WHEN availability = 'no' THEN 1 ELSE 0 END) AS unavailable, SUM(CASE WHEN availability = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS percentage FROM cards WHERE languages = 'zh-TW'	card_games
SELECT T1.name, COUNT(*) AS total_cards FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Italian' GROUP BY T1.name	card_games
SELECT COUNT(DISTINCT card.type) FROM cards AS card JOIN set_translations AS set ON set.setCode = card.setCode WHERE set.language = 'en' AND set.translation = 'Aaron Boyd'	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = 'None'	card_games
SELECT DISTINCT promoTypes FROM cards WHERE name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = "Ancestor's Chosen"	card_games
SELECT cardKingdomFoilId, cardKingdomId, originalReleaseDate, originalText FROM cards WHERE name = 'Ancestor\'s Chosen'	card_games
SELECT DISTINCT language FROM set_translations JOIN sets ON set_translations.setCode = sets.id WHERE sets.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.id = T2.id WHERE T2.status = "Restricted" AND T1.text LIKE '%text box%'	card_games
SELECT text FROM rulings WHERE uuid = 'c5d4b5c-f5f5-4f5f-9f5f-5f5f5f5f5f5'	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.id = T2.id WHERE T2.status = 'Restricted' AND T1.isStarter = 1	card_games
SELECT status FROM legalities WHERE uuid = 'cloudchaser eagle'	card_games
SELECT cardKingdomFoilId, cardKingdomId, name FROM cards WHERE text = 'Benalish Knight'	card_games
SELECT * FROM cards WHERE name = "Benalish Knight"	card_games
SELECT artist FROM cards WHERE name = 'Phyrexian'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'None'	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode JOIN foreign_data AS T3 ON T2.language = T3.language WHERE T3.text = 'German' AND T1.isReprint > 0	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'None'	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.id = T2.id WHERE T2.language = "French" AND T1.isStorySpotlight = 1 GROUP BY T1.id ORDER BY T1.id	card_games
SELECT COUNT(*) FROM cards WHERE toughness = 99	card_games
SELECT cards.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.text LIKE '%Aaron Boyd%'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND mtgoFoilId IS NULL	card_games
SELECT id FROM cards WHERE convertedManaCost = 0	card_games
SELECT DISTINCT layout FROM cards WHERE keywords = 'flying'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = "Summon - Angel" AND NOT subtypes = "Angel"	card_games
SELECT cards.id FROM cards WHERE cards.isFoilOnly = 1 AND cards.isNonFoilOnly = 0	card_games
SELECT id FROM cards WHERE duelDeck = 'A'	card_games
SELECT cards.id, cards.edhrecRank FROM cards WHERE cards.frameVersion = 2015 GROUP BY cards.id ORDER BY cards.edhrecRank	card_games
SELECT artist FROM cards WHERE language = 'zh-TW'	card_games
SELECT cards.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese' AND NOT cards.availability IS NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white'	card_games
SELECT cards.uuid, foreign_data.language FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.text LIKE '%legacy%' GROUP BY cards.uuid ORDER BY cards.uuid	card_games
SELECT rulings.text FROM rulings WHERE rulings.text LIKE '%Beacon of Immortality%'	card_games
SELECT COUNT(DISTINCT cards.id) FROM cards WHERE cards.frameVersion = 'future'	card_games
SELECT c.colorIdentity, c.colorIndicator, c.colors FROM cards c WHERE c.setCode = 'OGW'	card_games
SELECT DISTINCT T1.name FROM cards AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T1.convertedManaCost = 5 AND T2.language = 'None'	card_games
SELECT T1.name, T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.id = T2.cardId WHERE T1.originalType = 'Creature - Elf' GROUP BY T1.name ORDER BY T2.date	card_games
SELECT colors FROM cards WHERE id IN (1, 20)	card_games
SELECT DISTINCT cards.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.type = 'Artifact' AND foreign_data.language = 'None' AND cards.colorIdentity = 'black'	card_games
SELECT rulings.text, rulings.date FROM rulings WHERE rulings.text IN (SELECT cards.text FROM cards WHERE cards.rarity = 'uncommon') ORDER BY rulings.date	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND isFoilOnly = 0	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'White' AND power > 3	card_games
SELECT COUNT(*) FROM cards WHERE text LIKE '%UDON%' AND printings = 'mtgo' AND hand = -1	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = "1993" AND hasContentWarning = 1	card_games
SELECT mtgjsonV4Id, manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND (availability = 'paper' OR availability = 'mtgo') GROUP BY mtgjsonV4Id ORDER BY manaCost	card_games
SELECT SUM(cards.convertedManaCost) FROM cards WHERE cards.text LIKE '%Rob Alexander%'	card_games
SELECT DISTINCT cardKingdomFoilId, cardKingdomId, name FROM cards WHERE mtgArenaId = 'arena' GROUP BY cardKingdomFoilId, cardKingdomId, name ORDER BY cardKingdomFoilId	card_games
SELECT DISTINCT T1.setCode FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = "ES"	card_games
SELECT COUNT(*) FROM cards WHERE frameEffects LIKE '%Maximum starting hand size%' AND (hand LIKE '%+3%')	card_games
SELECT cards.id, cards.storySpotlight, cards.text FROM cards WHERE cards.storySpotlight = 1 AND cards.text <> '' GROUP BY cards.id, cards.storySpotlight, cards.text ORDER BY cards.id	card_games
SELECT name, COUNT(*) AS total FROM cards WHERE language = 'Spanish' GROUP BY name ORDER BY total DESC	card_games
SELECT DISTINCT language FROM set_translations WHERE setCode = 309 GROUP BY language ORDER BY language ASC	card_games
SELECT COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = "pt-BR" AND T1.block = "Commander"	card_games
SELECT * FROM cards WHERE type = 'Creature' AND legalities.status = 'legal' GROUP BY id ORDER BY id	card_games
SELECT DISTINCT card.type FROM card, set_translations, sets WHERE card.type IN (SELECT DISTINCT translation.translation FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.language = 'german') AND card.type IN (SELECT DISTINCT translation.translation FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.language = 'german')	card_games
SELECT COUNT(*) FROM cards WHERE power = ''	card_games
SELECT COUNT(*) FROM cards WHERE (text LIKE '%This is a triggered mana ability%' OR text LIKE '%This is a triggered mana ability%') AND (premium = 0 OR (premium = 1 AND faceConvertedManaCost > 0))	card_games
SELECT cards.id FROM cards WHERE cards.artist = 'Erica Yang' AND cards.availability = 'Paper'	card_games
SELECT cards.artist FROM cards WHERE cards.text = "Das perfekte Gegenmittel zu einer dichten Formation"	card_games
SELECT DISTINCT t1.name FROM "cards" AS t1 JOIN "foreign_data" AS t2 ON t1.uuid = t2.uuid WHERE t1.text LIKE '%Matthew D. Wilson%' AND t1.type = 'Creature' AND t1.layout = 'normal' AND t1.borderColor = 'black' AND t2.language = 'French'	card_games
SELECT COUNT(*) FROM rulings WHERE date = '2009-10-01'	card_games
SELECT DISTINCT t1.language FROM foreign_data AS t1 JOIN sets AS t2 ON t1.setCode = t2.setCode WHERE t2.block = 'Ravnica' AND t2.totalSetSize = 180 GROUP BY t1.language ORDER BY t1.language	card_games
SELECT COUNT(*) FROM cards WHERE (legalities.status = 'legal' AND legalities.format = 'commander') AND cards.hasContentWarning = 0 GROUP BY cards.id ORDER BY cards.id	card_games
SELECT COUNT(*) FROM cards WHERE power = 'None' AND language = 'French'	card_games
SELECT COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Japanese' AND T1.type = 'Expansion set' GROUP BY T1.id ORDER BY T1.id	card_games
SELECT cards.printings FROM cards WHERE cards.text LIKE '%Daren Bader%'	card_games
SELECT COUNT(*) FROM cards WHERE colors = 'None' AND borderColor = 'None' AND edhrecRank > 12000	card_games
SELECT COUNT(*) FROM cards WHERE oversized = 1 AND reprinted = 1 AND promoTypes = 'promo'	card_games
SELECT name FROM cards WHERE promoTypes = 'arena league' ORDER BY name	card_games
SELECT foreign_data.language FROM foreign_data JOIN cards ON foreign_data.cardId = cards.id WHERE foreign_data.multiverseid = 149934	card_games
SELECT cards.id, cards.kingdomFoilId, cards.kingdomId FROM cards JOIN sets ON cards.setCode = sets.setCode WHERE sets.mtgjsonV4Id = (SELECT MAX(sets.mtgjsonV4Id) FROM sets) GROUP BY cards.id, cards.kingdomFoilId, cards.kingdomId ORDER BY cards.kingdomFoilId	card_games
SELECT COUNT(*) FROM cards WHERE layout <> 'normal'	card_games
SELECT COUNT(*) FROM cards WHERE types = 'Angel' AND subtypes = 'Wizard' AND NOT (variations LIKE '%two-faced%')	card_games
SELECT name FROM sets WHERE NOT mcmId IS NULL ORDER BY name	card_games
SELECT DISTINCT language FROM foreign_data WHERE name = 'Archenemy'	card_games
SELECT T1.name, T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T1.id = 5	card_games
SELECT language, type FROM foreign_data WHERE name = '206'	card_games
SELECT T1.id, T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Italian' AND T1.block = 'Shadowmoor' ORDER BY T1.name	card_games
SELECT setCode FROM sets WHERE isFoilOnly = 1 AND isForeignOnly = 1 AND isNonFoilOnly = 1 AND isOnlineOnly = 1 AND isPartialPreview = 1	card_games
SELECT MAX(totalSetSize) FROM sets WHERE language = 'Russian' GROUP BY language ORDER BY totalSetSize DESC	card_games
SELECT COUNT(*) FROM cards WHERE languages = "zh-TW" AND isOnlineOnly = 1	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND NOT mtgoCode IS NULL	card_games
SELECT cardKingdomId, COUNT(cardKingdomId) FROM cards WHERE borderColor = 'black' GROUP BY cardKingdomId	card_games
SELECT cardKingdomFoilId, COUNT(*) FROM cards WHERE frameEffects = 'extendedart' GROUP BY cardKingdomFoilId	card_games
SELECT cards.name FROM cards WHERE cards.borderColor = 'black' AND cards.isFullArt = 1	card_games
SELECT language FROM foreign_data WHERE name = '174'	card_games
SELECT name FROM sets WHERE code = "ALL"	card_games
SELECT foreign_data.language FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.name = 'A Pedra Fellwar'	card_games
SELECT setCode FROM sets WHERE releaseDate = "07/13/2007"	card_games
SELECT baseSetSize, setCode FROM sets WHERE block = "Masques" AND block = "Mirage"	card_games
SELECT DISTINCT name FROM sets WHERE type = 'expansion'	card_games
SELECT card.name, card.type FROM card WHERE card.watermark = 'boros'	card_games
SELECT cards.flavorText, cards.text, cards.type FROM cards WHERE cards.watermark = 'colorpie'	card_games
SELECT COUNT(*) FROM cards WHERE convertedManaCost = 10	card_games
SELECT DISTINCT name FROM sets WHERE type = 'Expansion Commander'	card_games
SELECT card.name, card.type FROM card WHERE card.watermark = 'abzan'	card_games
SELECT card.text, card.type FROM card WHERE card.watermark = 'azorius' GROUP BY card.type	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND power = 'None'	card_games
SELECT COUNT(*) FROM cards WHERE manaCost = 'None' AND hasAlternativeDeckLimit > 0	card_games
SELECT name FROM cards WHERE text LIKE '%text box%'	card_games
SELECT cardKingdomFoilId, SUM(convertedManaCost) FROM cards WHERE name = 'Ancestor's Chosen' GROUP BY cardKingdomFoilId	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'White' AND power = 'None'	card_games
SELECT name FROM cards WHERE promoTypes = 'Promotional Painting' AND variations = 'Multiple Faces'	card_games
SELECT DISTINCT cardKingdomFoilId, cardKingdomId, name FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT DISTINCT purchaseUrls FROM cards WHERE promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND (mtgArenaId != '' OR mtgoFoilId != '')	card_games
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE name = "Battra, Dark Destroyer"	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT tcgplayerGroupId FROM sets WHERE name = 'Ancestor's Chosen'	card_games
SELECT COUNT(*) FROM set_translations AS T1 JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T2.text LIKE '%Angel of Mercy%' GROUP BY T1.language ORDER BY T1.language	card_games
SELECT name FROM cards WHERE setCode = "Hauptset Zehnte Edition"	card_games
SELECT * FROM cards WHERE name = 'Ancestor\'s Chosen'	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.setCode WHERE T2.name = "Hauptset Zehnte Edition" AND T1.artist = "Adam Rex"	card_games
SELECT COUNT(*) FROM sets WHERE baseSetSize > 0	card_games
SELECT t1.name FROM sets AS t1 JOIN set_translations AS t2 ON t1.id = t2.setCode WHERE t2.language = 'Simplified Chinese' AND t1.name = 'Eighth Edition'	card_games
SELECT cards.setCode FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Angel of Mercy' AND set_translations.language = 'en'	card_games
SELECT releaseDate FROM sets WHERE name = "Ancestor's Chosen"	card_games
SELECT type FROM sets WHERE name = "Hauptset Zehnte Edition"	card_games
SELECT COUNT(DISTINCT T1.setCode) FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = "Italian" AND T1.block = "Ice Age"	card_games
SELECT * FROM cards WHERE name = 'Adarkar Valkyrie'	card_games
SELECT COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode JOIN sqlite_sequence AS T3 ON T1.mcmId = T3.mcmId WHERE T2.language = "Italian" AND T3.seq < 10 GROUP BY T1.id	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND setCode = 'Coldsnap'	card_games
SELECT name FROM cards WHERE setCode = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE setCode = 'Coldsnap' GROUP BY artist ORDER BY artist	card_games
SELECT name FROM cards WHERE setCode = 'Coldsnap' AND number = 4	card_games
SELECT COUNT(*) FROM cards WHERE convertedManaCost > 5 AND setCode = 'Coldsnap' AND power = 'None'	card_games
SELECT t.text FROM foreign_data AS t JOIN cards AS c ON t.text = c.text WHERE c.name = 'Ancestor's Chosen' AND t.language = 'Italian'	card_games
SELECT DISTINCT foreign_data.language FROM foreign_data JOIN cards ON foreign_data.cardId = cards.id WHERE cards.name = 'Ancestor\'s Chosen'	card_games
SELECT tcgplayerProductId FROM cards WHERE name = "Ancestor's Chosen"	card_games
SELECT rulings.text FROM rulings JOIN sets ON rulings.setCode = sets.setCode WHERE sets.name = "Coldsnap" AND rulings.language = "Italian"	card_games
SELECT name FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Italian' AND T1.setName = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT rulings.date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce'	card_games
SELECT COUNT(*) FROM cards WHERE convertedManaCost = 7 AND setCode = 'Coldsnap'	card_games
SELECT COUNT(*) FROM cards WHERE power = 'None' AND text LIKE '%Coldsnap%'	card_games
SELECT mcmId, mcmName FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT cards.name FROM cards WHERE cards.releaseDate = '2017/6/9'	card_games
SELECT type FROM sets WHERE name = "From the Vault: Lore"	card_games
SELECT parentCode FROM sets WHERE name = "Commander 2014 Oversized"	card_games
SELECT c.name, c.text, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.illustrator = 'Jim Pavelec'	card_games
SELECT releaseDate FROM sets WHERE name = 'Evacuation'	card_games
SELECT COUNT(*) FROM sets WHERE name = "Rinascita di Alara"	card_games
SELECT type FROM sets WHERE name = "Huitième édition"	card_games
SELECT tcgplayerGroupId FROM sets WHERE name = "Tendo Ice Bridge"	card_games
SELECT COUNT(DISTINCT t1.translation) FROM set_translations AS t1 JOIN sets AS t2 ON t1.setCode = t2.code WHERE t2.name = "Salvat 2011"	card_games
SELECT t.name FROM sets AS t JOIN set_translations AS st ON t.id = st.setCode JOIN "cards" AS c ON c.setCode = st.setCode WHERE c.name = "Fellwar Stone" AND st.language = "Japanese"	card_games
SELECT name FROM cards WHERE setCode = 'Journey into Nyx Hero' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT releaseDate FROM sets WHERE name = "Ola de frío"	card_games
SELECT tcgplayerGroupId FROM sets WHERE name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'World Championship Decks 2004' AND convertedManaCost = 3	card_games
SELECT t1.name FROM sets AS t1 JOIN set_translations AS t2 ON t1.id = t2.setCode WHERE t2.language = 'Simplified Chinese' AND t1.name = 'Mirrodin'	card_games
SELECT COUNT(DISTINCT cards.id) FROM cards JOIN set_translations ON cards.id = set_translations.id JOIN sets ON cards.setCode = sets.setCode WHERE set_translations.language = 'Japanese' AND NOT cards.isFoilOnly IS NULL GROUP BY cards.id ORDER BY cards.id	card_games
SELECT COUNT(DISTINCT cards.id) FROM cards JOIN set_translations ON cards.id = set_translations.id WHERE set_translations.language = 'Brazil Portuguese' AND cards.isOnlineOnly = 1	card_games
SELECT DISTINCT cardKingdomFoilId, cardKingdomId, name FROM cards WHERE text LIKE '%Aleksi Briclot%' AND NOT text LIKE '%text box%' GROUP BY cardKingdomFoilId, cardKingdomId, name ORDER BY cardKingdomFoilId	card_games
SELECT DISTINCT setCode FROM sets ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT illustrator, MAX(convertedManaCost) FROM cards WHERE NOT hasAlternativeDeckLimit IS NULL GROUP BY illustrator ORDER BY convertedManaCost DESC	card_games
SELECT frameEffects, COUNT(*) AS cnt FROM cards WHERE isFoil = 1 GROUP BY frameEffects ORDER BY cnt DESC	card_games
SELECT COUNT(*) FROM cards WHERE power = 'None' AND foil = 0 AND mtgArenaId = 'A'	card_games
SELECT MAX(totalSetSize) FROM sets WHERE type = 'Commander'	card_games
SELECT cards.name, cards.manaCost, cards.text, cards.flavorText, cards.flavorName, cards.power, cards.toughness, cards.types, cards.subtypes, cards.colorIdentity, cards.colorIndicator, cards.borderColor, cards.cardKingdomFoilId, cards.cardKingdomId, cards.availability, cards.asciiName, cards.convertedManaCost, cards.faceConvertedManaCost, cards.faceName, cards.hand, cards.hasAlternativeDeckLimit, cards.hasContentWarning, cards.hasFoil, cards.hasNonFoil, cards.isAlternative, cards.isFullArt, cards.isOnlineOnly, cards.isOversized, cards.isPromo, cards.isReprint, cards.isReserved, cards.isStarter, cards.isStorySpotlight, cards.isTextless, cards.isTimeshifted, cards.keywords, cards.leadershipSkills, cards.life, cards.loyalty, cards.manaCost, cards.mtcgjsonV4Id, cards.mtgoFoilId, cards.mtgoId, cards.multiverseId, cards.otherFaceIds, cards.power, cards.printings, cards.promoTypes, cards.purchaseUrls, cards.rarity, cards.scryfallId, cards.scryfallOracleId, cards.scryfallIllustrationId, cards.text, cards.toughness, cards.types, cards.subtypes, cards.variations, cards.watermark FROM cards ORDER BY cards.manaCost DESC LIMIT 10	card_games
SELECT MIN(originalReleaseDate) AS "release_date", legalities.format FROM sets JOIN legalities ON sets.id = legalities.id WHERE sets.type = 'mythic' GROUP BY legalities.format ORDER BY legalities.format	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.id = T2.id WHERE T2.language = "French"	card_games
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND types = 'Enchantment' AND (SELECT COUNT(*) FROM legalities WHERE format = 'Standard' AND status = 'legal' AND uuid = cards.uuid) = 3	card_games
SELECT legalities.format, legalities.status, cards.name FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Banned' GROUP BY legalities.format, legalities.status ORDER BY legalities.status DESC	card_games
SELECT language FROM foreign_data WHERE name = "Battlebond"	card_games
SELECT illustrator, format FROM cards GROUP BY illustrator ORDER BY COUNT(*) ASC	card_games
SELECT DISTINCT cards.name FROM cards WHERE cards.frameVersion = '1997' AND cards.text LIKE '%D. Alexander Gregory%' AND cards.types LIKE '%Legacy%' AND cards.isContentWarning = 1 AND cards.isOnlineOnly = 0	card_games
SELECT name, text FROM cards WHERE edhrecRank = 1	card_games
SELECT AVG(totalSetSize) FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY language	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND mtgArenaId IS NOT NULL ORDER BY artist	card_games
SELECT cards.uuid FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Restricted' OR legalities.status = 'Banned'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'Paper'	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.text LIKE '%Kev Walker%' ORDER BY rulings.date DESC	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.setCode = 'HOU' GROUP BY cards.name, legalities.format ORDER BY legalities.format	card_games
SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Korean' EXCEPT SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T2.language = 'Japanese'	card_games
SELECT DISTINCT cards.frameVersion, cards.flavorName, cards.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.text LIKE '%Allen Williams%' AND NOT cards.isBanned	card_games
SELECT DisplayName, Reputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC	codebase_community
SELECT DisplayName FROM users WHERE CreationDate BETWEEN '2014-01-01' AND '2014-12-31'	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(u.Id) FROM users AS u WHERE u.UpVotes > 100 AND u.DownVotes > 1	codebase_community
SELECT COUNT(Id) FROM users WHERE Views > 10 AND CreationDate > '2013-01-01'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = 101	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = 101	codebase_community
SELECT OwnerUserId FROM posts WHERE Id = 1	codebase_community
SELECT Title FROM Posts WHERE OwnerUserId = 101 ORDER BY Score DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT OwnerUserId FROM posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE OwnerUserId = '##UserId##')	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = 101 AND PostTypeId = 2	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT LastEditorUserId FROM posts WHERE Id = 10192)	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'csgillespie'	codebase_community
SELECT DISTINCT OwnerDisplayName FROM posts WHERE PostTypeId = 2 AND Score > 0 GROUP BY OwnerDisplayName ORDER BY Score DESC	codebase_community
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Age > 60 AND p.Score > 19 GROUP BY u.Id	codebase_community
SELECT Location FROM users WHERE Id = 101	codebase_community
SELECT * FROM posts WHERE Tags LIKE '%bayesian%'	codebase_community
SELECT p.Body FROM posts AS p WHERE p.Id = (SELECT t.ExcerptPostId FROM tags AS t ORDER BY t.Count DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = '##name##'	codebase_community
SELECT Name FROM badges WHERE UserId = 101	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = '##name##' AND YEAR(Date) = 2011	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = 101	codebase_community
SELECT AVG(b.Name) AS avg_badges, u.Views FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200 GROUP BY u.Id	codebase_community
SELECT COUNT(p.Id) AS "Number of Posts", COUNT(p.Id) * 100.0 / COUNT(p.Id) AS "Percentage" FROM posts AS p WHERE p.Score > 20 AND p.OwnerUserId IN (SELECT Id FROM users WHERE Age > 60) GROUP BY p.Id	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes ORDER BY CreationDate DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT c.PostId AS "post_link", c.Score, c.Text, c.CreationDate, c.UserId AS "user_link" FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments) GROUP BY c.PostId, c.Score, c.Text, c.CreationDate, c.UserId ORDER BY c.Score DESC	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = 1910	codebase_community
SELECT COUNT(*) FROM votes AS v JOIN posts AS p ON v.PostId = p.Id WHERE p.Id = 12345 AND v.UserId = 3025 AND v.CreationDate = '2014-04-23 20:29:39'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829	codebase_community
SELECT * FROM comments WHERE PostId = 123456 AND UserId = 23853 AND CreationDate = '2013-07-12 09:08:18'	codebase_community
SELECT Reputation FROM users WHERE Id = 65041	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT DisplayName FROM users WHERE Id = 6347	codebase_community
SELECT COUNT(*) FROM votes AS v WHERE v.PostId = 1	codebase_community
SELECT Name FROM badges WHERE UserId = 101	codebase_community
SELECT COUNT(p.Id) AS Posts, COUNT(v.Id) AS Votes, (COUNT(p.Id) / COUNT(v.Id)) AS Ratio FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId INNER JOIN votes AS v ON p.Id = v.PostId WHERE u.Id = 24 GROUP BY p.Id, v.Id ORDER BY Ratio DESC	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT * FROM comments WHERE Score = 17	codebase_community
SELECT * FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT Name FROM badges WHERE UserId = 101	codebase_community
SELECT c.UserId AS "user_link", c.CreationDate FROM comments AS c WHERE c.Text LIKE '%thank you user93%' ORDER BY c.CreationDate DESC	codebase_community
SELECT c.Id AS "comment_link", c.CreationDate, c.Text, c.Score, c.UserId AS "user_link" FROM comments AS c WHERE c.UserId = '##UserId##' ORDER BY c.CreationDate DESC	codebase_community
SELECT u.DisplayName, u.Reputation FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?' ORDER BY u.Reputation DESC	codebase_community
SELECT c.Id AS "comment_link", c.CreationDate, c.Text, c.UserId AS "user_link" FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?' ORDER BY c.CreationDate DESC	codebase_community
SELECT DISTINCT u.Id AS "user_link", u.DisplayName, u.Reputation, u.Location, u.WebsiteUrl, u.AboutMe, u.Views, u.UpVotes, u.DownVotes, u.Age, u.ProfileImageUrl, b.Name FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' ORDER BY u.Reputation DESC	codebase_community
SELECT DISTINCT LastEditorUserId FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data?' ORDER BY LastEditorUserId	codebase_community
SELECT Title FROM Posts WHERE LastEditorUserId = 101	codebase_community
SELECT SUM(p.Score) AS total_score, u.WebsiteUrl FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.LastEditorUserId = '##UserId##' GROUP BY u.WebsiteUrl ORDER BY total_score DESC	codebase_community
SELECT c.Text, c.CreationDate, c.UserId AS "user_link", c.UserDisplayName, c.PostId AS "post_link" FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.Id = 101 AND c.UserId != 101 GROUP BY c.Text, c.CreationDate, c.UserId, c.UserDisplayName, c.PostId ORDER BY c.CreationDate DESC	codebase_community
SELECT SUM(v.BountyAmount) FROM votes AS v JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data%'	codebase_community
SELECT * FROM votes WHERE BountyAmount = 50	codebase_community
SELECT AVG(ViewCount) FROM posts WHERE Tags LIKE '%humor%'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT Id AS "user_link", Views FROM users ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND YEAR(b.Date) = 2011	codebase_community
SELECT COUNT(*) FROM users AS u WHERE EXISTS (SELECT * FROM badges AS b WHERE b.UserId = u.Id GROUP BY b.UserId HAVING COUNT(*) > 5)	codebase_community
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%' AND (SELECT COUNT(*) FROM badges WHERE Name = 'Teacher' AND UserId = users.Id) > 0 AND (SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND UserId = users.Id) > 0	codebase_community
SELECT u.DisplayName, u.Reputation FROM users AS u JOIN posts AS p ON p.OwnerUserId = u.Id WHERE p.Id = 1	codebase_community
SELECT p.Id AS "post_link", p.ViewCount, p.OwnerUserId AS "user_link" FROM posts AS p JOIN postHistory AS ph ON p.Id = ph.PostId WHERE ph.PostHistoryTypeId = 5 GROUP BY p.Id, p.ViewCount, p.OwnerUserId HAVING COUNT(DISTINCT ph.PostId) = 1 AND p.ViewCount >= 1000 ORDER BY p.ViewCount DESC	codebase_community
SELECT c.UserId AS "user_link", COUNT(c.Id) AS "comments" FROM comments c JOIN users u ON c.UserId = u.Id GROUP BY c.UserId ORDER BY COUNT(c.Id) DESC LIMIT 10	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher'	codebase_community
SELECT (SELECT COUNT(*) FROM badges WHERE YEAR(Date) = 2010) - (SELECT COUNT(*) FROM badges WHERE YEAR(Date) = 2011)	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId ORDER BY PostHistoryTypeId	codebase_community
SELECT * FROM postLinks WHERE PostId = 61217	codebase_community
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395	codebase_community
SELECT p.Id AS "post_link", p.OwnerUserId AS "user_link", p.Score FROM posts AS p WHERE p.Score > 60 GROUP BY p.Id, p.OwnerUserId ORDER BY p.Score DESC	codebase_community
SELECT SUM(favoriteCount) FROM posts WHERE ownerUserId = 686 AND YEAR(creationDate) = 2011	codebase_community
SELECT AVG(UpVotes) AS avg_upvotes, AVG(Age) AS avg_age FROM users WHERE Users.Id IN (SELECT OwnerUserId FROM Posts GROUP BY OwnerUserId HAVING COUNT(Id) > 10)	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE UserId = '##UserId##' AND Date = '19/07/2010 19:39:08'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 0	codebase_community
SELECT * FROM comments WHERE CreationDate = '2010-07-19 19:25:47'	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = '##name##' AND b.Date = '##date##'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'	codebase_community
SELECT DISTINCT c.CreationDate FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId INNER JOIN comments AS c ON c.PostId = b.PostId WHERE u.Location LIKE '%Rochester, NY%' ORDER BY c.CreationDate	codebase_community
SELECT COUNT(DISTINCT u.Id) AS "Number of Users", u.DisplayName, u.Reputation, u.Location, u.Age, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.ProfileImageUrl, u.AccountId, u.Reputation, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.ProfileImageUrl, u.AccountId, u.Age, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.ProfileImageUrl, u.AccountId, u.Age, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.ProfileImageUrl, u.AccountId, u.Age, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.ProfileImageUrl, u.AccountId, u.Age, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.ProfileImageUrl, u.AccountId, u.Age, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.ProfileImageUrl, u.AccountId, u.Age, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.ProfileImageUrl, u.AccountId, u.Age, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.ProfileImageUrl, u.AccountId, u.Age, u.UpVotes, u.DownVotes, u.Views, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.	codebase_community
SELECT COUNT(DISTINCT u.Id) AS "number_of_users", u.Age FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Organizer' AND u.Age BETWEEN 13 AND 19 GROUP BY u.Age ORDER BY u.Age	codebase_community
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '1971-07-19 19:19:56'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.CreationDate = '2010-07-19 19:37:33'	codebase_community
SELECT Age FROM users WHERE Location = 'Vienna, Austria' INTERSECT SELECT Age FROM users WHERE Age > 100	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND u.Age >= 18	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = '##Name##' AND u.LastAccessDate = '##Date##'	codebase_community
SELECT b.Name, u.DisplayName, u.Reputation, u.Id AS "user_link" FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM Users) GROUP BY b.Name, u.DisplayName, u.Reputation, u.Id ORDER BY u.Reputation	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND u.Age > 65	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%'	codebase_community
SELECT COUNT(*) FROM votes WHERE CreationDate BETWEEN '2010-01-01' AND '2010-12-31'	codebase_community
SELECT COUNT(*) FROM users WHERE Age > 18	codebase_community
SELECT DisplayName, Views FROM users ORDER BY Views DESC	codebase_community
SELECT YEAR(CreationDate) AS Year, COUNT(CreationDate) AS Count FROM votes WHERE YEAR(CreationDate) IN (2010, 2011) GROUP BY YEAR(CreationDate) ORDER BY YEAR(CreationDate)	codebase_community
SELECT t.TagName, COUNT(*) AS Count FROM tags AS t JOIN posts AS p ON t.ExcerptPostId = p.Id WHERE p.OwnerUserId = '##UserId##' GROUP BY t.TagName ORDER BY Count DESC	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 101	codebase_community
SELECT p.Id AS "post_link", COUNT(a.Id) AS "number_of_answers" FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id JOIN badges AS b ON p.Id = b.PostId WHERE u.DisplayName = 'slashnick' AND p.PostTypeId = 1 GROUP BY p.Id ORDER BY COUNT(a.Id) DESC LIMIT 1	codebase_community
SELECT p.Id AS "post_link", p.Score, p.ViewCount, p.AnswerCount, p.CommentCount, p.FavoriteCount, p.OwnerUserId AS "user_link", p.OwnerDisplayName, p.LastEditorUserId AS "user_link", p.LastEditDate, p.CreationDate, p.Tags FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') AND p.PostTypeId = 1 GROUP BY p.Id, p.Score, p.ViewCount, p.AnswerCount, p.CommentCount, p.FavoriteCount, p.OwnerUserId, p.OwnerDisplayName, p.LastEditorUserId, p.LastEditDate, p.CreationDate, p.Tags ORDER BY p.Score DESC	codebase_community
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Matt Parker' AND p.Score > 4	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 101 AND Text LIKE '%negative%'	codebase_community
SELECT t.TagName, COUNT(*) AS "count" FROM posts AS p INNER JOIN postTags AS pt ON p.Id = pt.PostId INNER JOIN tags AS t ON t.Id = pt.TagId WHERE p.OwnerUserId = '##UserId##' AND p.PostTypeId = 1 AND p.ClosedDate IS NULL AND p.AnswerCount = 0 AND p.CommentCount = 0 GROUP BY t.TagName ORDER BY 'count' DESC	codebase_community
SELECT DISTINCT Name FROM badges WHERE Name IN ('Organizer')	codebase_community
SELECT COUNT(DISTINCT p.Id) AS Posts, p.Tags, p.CreationDate, p.Score, p.ViewCount, p.AnswerCount, p.CommentCount, p.FavoriteCount, p.LastActivityDate, p.OwnerUserId, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerDisplayName, p.LastEditorDisplayName, p.OwnerUserId, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerDisplayName, p.LastEditorDisplayName, p.OwnerUserId, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerDisplayName, p.LastEditorDisplayName, p.OwnerUserId, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerDisplayName, p.LastEditorDisplayName, p.OwnerUserId, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerDisplayName, p.LastEditorDisplayName, p.OwnerUserId, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerDisplayName, p.LastEditorDisplayName, p.OwnerUserId, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerDisplayName, p.LastEditorDisplayName, p.OwnerUserId, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p.OwnerDisplayName, p.LastEditorDisplayName, p.OwnerUserId, p.LastEditorUserId, p.LastEditDate, p.CommunityOwnedDate, p.ParentId, p.ClosedDate, p	codebase_community
SELECT (SELECT ViewCount FROM posts WHERE OwnerUserId = 101) - (SELECT ViewCount FROM posts WHERE OwnerUserId = 102)	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND Date BETWEEN '2014-01-01' AND '2014-12-31'	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate = '2010-07-21'	codebase_community
SELECT DisplayName, Age FROM users ORDER BY Views DESC	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 0	codebase_community
SELECT c.PostId AS "post_link", c.Text, c.UserId AS "user_link" FROM comments AS c WHERE c.Score > 0 GROUP BY c.PostId, c.Text, c.UserId ORDER BY c.Score DESC	codebase_community
SELECT b.Name FROM badges b WHERE b.UserId = '##UserId##' AND YEAR(b.Date) = 2011	codebase_community
SELECT DISTINCT u.DisplayName, u.WebsiteUrl FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150 GROUP BY u.DisplayName, u.WebsiteUrl ORDER BY u.DisplayName ASC	codebase_community
SELECT COUNT(*) AS PostHistoryCount, MAX(CreationDate) AS LastEditDate FROM postHistory WHERE PostId = 101 GROUP BY PostId	codebase_community
SELECT u.LastAccessDate, u.Location FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Outliers' GROUP BY u.LastAccessDate, u.Location ORDER BY u.LastAccessDate DESC	codebase_community
SELECT t.TagName, t.Count, p.Title FROM tags AS t JOIN posts AS p ON t.ExcerptPostId = p.Id WHERE t.TagName = 'data-analysis' ORDER BY t.Count DESC	codebase_community
SELECT p.Id, b.Name FROM posts AS p JOIN badges AS b ON p.Id = b.PostId WHERE p.OwnerUserId = '##UserId##' AND YEAR(p.CreationDate) = 2013 GROUP BY p.Id ORDER BY p.Id	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT u.DisplayName, u.Location FROM users AS u JOIN posts AS p ON p.OwnerUserId = u.Id JOIN tags AS t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT T1.Title, T2.LinkTypeId FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T1.Id = 101	codebase_community
SELECT p.OwnerUserId, p.DisplayName, p.Id AS "post_link" FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.Id = (SELECT MAX(p2.Id) FROM posts AS p2 JOIN users AS u2 ON p2.OwnerUserId = u2.Id) GROUP BY p.OwnerUserId, p.DisplayName, p.Id ORDER BY p.Score DESC	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users AS u JOIN votes AS v ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT TagName, Count FROM tags WHERE Count BETWEEN 5000 AND 7000 GROUP BY TagName ORDER BY Count DESC	codebase_community
SELECT OwnerUserId FROM posts ORDER BY Score DESC LIMIT 1	codebase_community
SELECT Age FROM users ORDER BY Age DESC	codebase_community
SELECT COUNT(*) FROM votes AS v WHERE v.CreationDate BETWEEN '2011-01-01' AND '2011-12-31' AND v.BountyAmount = 50	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1	codebase_community
SELECT MAX(Score) FROM Posts WHERE Tags LIKE '%<popular_tag>%'	codebase_community
SELECT COUNT(DISTINCT p.Id) AS num_links, MONTH(p.CreationDate) AS month, YEAR(p.CreationDate) AS year FROM postLinks AS p JOIN posts AS q ON p.PostId = q.Id WHERE q.AnswerCount <= 2 GROUP BY MONTH(p.CreationDate), YEAR(p.CreationDate) ORDER BY MONTH(p.CreationDate) ASC	codebase_community
SELECT p.Id AS "post_link", p.Score FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE v.UserId = 1465 GROUP BY p.Id, p.Score ORDER BY p.Score DESC LIMIT 1	codebase_community
SELECT p.Title FROM postLinks AS pl JOIN posts AS p ON p.Id = pl.PostId JOIN posts AS o ON o.Id = pl.RelatedPostId WHERE pl.LinkTypeId = 1 AND o.Id = 1 GROUP BY p.Title ORDER BY p.CreationDate DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT MIN(CreationDate) FROM votes WHERE UserId = '##UserId##'	codebase_community
SELECT MIN(CreationDate) FROM users AS u WHERE u.CreationDate IS NOT NULL	codebase_community
SELECT DISTINCT u.DisplayName FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' ORDER BY u.DisplayName	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Location LIKE '%United Kingdom%' AND SUM(p.FavoriteCount) >= 4	codebase_community
SELECT AVG(p.Score) AS avg_score, p.OwnerUserId AS user_id, p.OwnerDisplayName AS user_name, p.CreationDate AS post_date, p.Tags AS tags FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users) GROUP BY p.OwnerUserId, p.OwnerDisplayName, p.CreationDate, p.Tags ORDER BY p.CreationDate DESC	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age >= 18	codebase_community
SELECT COUNT(*) FROM users WHERE DisplayName = 'Jay Stevens'	codebase_community
SELECT p.Id, p.Title  FROM posts AS p  WHERE p.OwnerUserId = '##UserId##'  ORDER BY p.ViewCount DESC	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = 101	codebase_community
SELECT DISTINCT OwnerDisplayName FROM posts WHERE YEAR(CreationDate) = 2011 AND ViewCount > 20000 GROUP BY OwnerDisplayName	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE YEAR(CreationDate) = 2010 ORDER BY Score DESC LIMIT 1	codebase_community
SELECT COUNT(p.Id) AS "Number of Posts", p.OwnerUserId AS "User ID", p.CreationDate AS "Post Date", p.Score AS "Post Score", p.ViewCount AS "Post Views", p.AnswerCount AS "Post Answers", p.CommentCount AS "Post Comments", p.FavoriteCount AS "Post Favorites", u.Reputation AS "User Reputation", u.DisplayName AS "User Name", u.Location AS "User Location", u.CreationDate AS "User Creation Date", u.LastAccessDate AS "User Last Access Date", u.WebsiteUrl AS "User Website URL", u.AboutMe AS "User About Me", u.Views AS "User Views", u.UpVotes AS "User Up Votes", u.DownVotes AS "User Down Votes", u.Age AS "User Age" FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.CreationDate BETWEEN '2011-01-01' AND '2011-12-31' AND u.Reputation > 1000 GROUP BY p.OwnerUserId, p.CreationDate, p.Score, p.ViewCount, p.AnswerCount, p.CommentCount, p.FavoriteCount, u.Reputation, u.DisplayName, u.Location, u.CreationDate, u.LastAccessDate, u.WebsiteUrl, u.AboutMe, u.Views, u.UpVotes, u.DownVotes, u.Age ORDER BY p.CreationDate	codebase_community
SELECT COUNT(*) AS teenage_users FROM users WHERE Age < 18	codebase_community
SELECT SUM(ViewCount) AS total_views, OwnerUserId FROM posts WHERE Title = 'Computer Game Datasets' GROUP BY OwnerUserId ORDER BY total_views DESC	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)	codebase_community
SELECT c.PostId, c.CreationDate, c.Text, c.Score, c.UserId, c.UserDisplayName, c.UserId AS "user_link" FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE c.Score = (SELECT MAX(Score) FROM comments JOIN posts AS p ON c.PostId = p.Id) GROUP BY c.PostId, c.CreationDate, c.Text, c.Score, c.UserId, c.UserDisplayName, c.UserId ORDER BY c.Score DESC	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT DisplayName, Location FROM users WHERE LastAccessDate = (SELECT MAX(LastAccessDate) FROM users WHERE Users.Id = 183)	codebase_community
SELECT MAX(Date) FROM badges WHERE UserId = 101	codebase_community
SELECT COUNT(*) FROM users WHERE Age > 18 AND UpVotes > 5000	codebase_community
SELECT * FROM users WHERE DisplayName = 'Zolomon'	codebase_community
SELECT COUNT(p.Id) AS Posts, COUNT(c.Id) AS Comments FROM Posts AS p JOIN Users AS u ON p.OwnerUserId = u.Id JOIN Comments AS c ON p.Id = c.PostId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM Users) GROUP BY p.Id, c.Id	codebase_community
SELECT c.Text, c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.PostId = (SELECT Id FROM posts WHERE Title = 'Analysing wind data with R') ORDER BY c.CreationDate DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(*) FROM posts WHERE Tags LIKE '%careers%'	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(c.Id) AS "Comments", COUNT(a.Id) AS "Answers" FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Clustering 1D data' GROUP BY c.UserId ORDER BY c.UserId	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat' ORDER BY CreationDate ASC	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount > 30	codebase_community
SELECT COUNT(p.Id) AS "Number of Posts", SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS "Number of Posts with Score > 50" FROM posts AS p WHERE p.OwnerUserId = (SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1) GROUP BY p.Id ORDER BY p.Id	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(*) FROM tags WHERE Count < 15 AND Count > 20	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT u.Reputation, u.UpVotes FROM users AS u JOIN comments AS c ON c.UserId = u.Id WHERE c.Text LIKE '%fine, you win :)%'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Id = 101	codebase_community
SELECT c.Id AS "comment_link", c.Score, c.Text, c.CreationDate, c.UserId AS "user_link" FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1	codebase_community
SELECT CreationDate, Age FROM users WHERE WebsiteUrl IS NOT NULL	codebase_community
SELECT COUNT(DISTINCT c.PostId) FROM comments AS c WHERE c.Score = 0 AND c.CreationDate BETWEEN '2019-01-01' AND '2019-12-31' AND c.PostId IN (SELECT Id FROM posts WHERE ViewCount < 5)	codebase_community
SELECT COUNT(*) FROM comments WHERE Score = 0 AND PostId = 1 GROUP BY Score	codebase_community
SELECT COUNT(DISTINCT c.UserId) FROM comments c WHERE c.Score = 0 AND c.CreationDate BETWEEN '2019-01-01' AND '2019-12-31' AND c.UserId IN (SELECT Id FROM users WHERE Age = 40)	codebase_community
SELECT PostId, Text FROM comments WHERE PostId IN (SELECT PostId FROM posts WHERE Title = 'Group differences on a five point Likert item')	codebase_community
SELECT COUNT(*) FROM votes AS v WHERE v.PostId = 101 AND v.VoteTypeId = 2	codebase_community
SELECT c.Id AS "comment_link", c.CreationDate, c.Text, c.Score, c.UserId AS "user_link" FROM comments AS c WHERE c.UserId = 101444 ORDER BY c.CreationDate DESC	codebase_community
SELECT c.UserDisplayName FROM comments c WHERE c.Score BETWEEN 1 AND 5 AND c.UserId NOT IN (SELECT u.Id FROM users AS u WHERE u.DownVotes > 0) GROUP BY c.UserDisplayName ORDER BY c.UserDisplayName	codebase_community
SELECT COUNT(DISTINCT c.UserId) AS "users_with_0_upvotes", COUNT(DISTINCT c.UserId) * 100.0 / COUNT(DISTINCT c.UserId) AS "percentage" FROM comments c WHERE c.Score BETWEEN 5 AND 10 GROUP BY c.UserId	codebase_community
SELECT superpower.power_name FROM superpower JOIN hero_power ON hero_power.power_id = superpower.id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.superhero_name = '3-D Man'	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.height_cm > 200 AND T3.power_name = 'Super Strength'	superhero
SELECT superhero_name, COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(*) > 15 ORDER BY T1.id	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'blue')	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.eye_colour_id = (SELECT MAX(eye_colour_id) FROM superhero) AND T3.power_name = 'Agility'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'blue') AND hair_colour_id IN (SELECT id FROM colour WHERE colour = 'blond')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT superhero_name FROM superhero WHERE publisher_name = 'Marvel Comics' ORDER BY height_cm DESC LIMIT 1	superhero
SELECT publisher_name FROM publisher WHERE publisher_name = 'Sauron'	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'blue')	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT publisher_id, COUNT(*) AS count FROM superhero WHERE publisher_id IN (SELECT publisher_id FROM publisher WHERE publisher_name = 'Marvel Comics') AND superhero_name IN (SELECT superhero_name FROM superhero WHERE superhero_name LIKE '%Super Strength%') GROUP BY publisher_id	superhero
SELECT COUNT(*) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'DC Comics'	superhero
SELECT publisher_name FROM publisher ORDER BY publisher_name ASC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'gold')	superhero
SELECT publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero WHERE hair_colour_id IN (SELECT id FROM colour WHERE colour = 'blond')	superhero
SELECT superhero_name FROM superhero ORDER BY IQ ASC	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Copycat'	superhero
SELECT COUNT(*) FROM superhero WHERE superpower_id IN (SELECT power_id FROM hero_power WHERE power_name = 'Durability' GROUP BY hero_id HAVING COUNT(power_id) < 50)	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'death touch'	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'female') AND strength_kg = 100	superhero
SELECT superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE superhero_name = 'vampire'	superhero
SELECT COUNT(*) FROM superhero WHERE alignment = 'self-interested' OR alignment = 'moral code' AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT publisher_name, COUNT(*) AS num_superheroes FROM superhero GROUP BY publisher_name ORDER BY num_superheroes DESC	superhero
SELECT publisher_id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) FROM hero_attribute	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT eye_colour_id FROM superhero WHERE id = 75	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON hero_power.power_id = superpower.id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.superhero_name = 'Deathlok'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'female')	superhero
SELECT superpower.power_name  FROM superpower  JOIN hero_power ON hero_power.power_id = superpower.id  JOIN superhero ON hero_power.hero_id = superhero.id  WHERE superhero.gender_id = (SELECT gender.id FROM gender WHERE gender.gender = 'M')  ORDER BY superpower.power_name	superhero
SELECT superhero_name FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'alien')	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IS NULL	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON hero_power.power_id = superpower.id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.id = 56	superhero
SELECT superhero_name FROM superhero WHERE superhero_name LIKE '%Demi-God%'	superhero
SELECT COUNT(*) FROM superhero WHERE superhero_name = 'Bad'	superhero
SELECT superhero_name FROM superhero WHERE weight_kg = 169	superhero
SELECT T2.hair_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.height_cm = 185 AND T1.race_id = (SELECT race_id FROM race WHERE race = 'human') AND T2.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'hair colour')	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1	superhero
SELECT publisher_name, COUNT(*) AS count FROM superhero WHERE height_cm BETWEEN 150 AND 180 AND publisher_name = 'Marvel Comics' GROUP BY publisher_name	superhero
SELECT superhero_name FROM superhero WHERE weight_kg > (SELECT AVG(weight_kg) FROM superhero) AND gender_id = (SELECT id FROM gender WHERE gender = 'male')	superhero
SELECT power_name, COUNT(*) AS count  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  GROUP BY power_name  ORDER BY count DESC	superhero
SELECT T1.attribute_value FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.superhero_name = 'Abomination'	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON hero_power.power_id = superpower.id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.id = 1	superhero
SELECT COUNT(*) FROM superhero WHERE superhero_name IN (SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'stealth')	superhero
SELECT superhero_name, full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'strength' GROUP BY superhero_name, full_name ORDER BY strength DESC LIMIT 1	superhero
SELECT AVG(weight_kg) FROM superhero WHERE skin_colour_id IS NULL	superhero
SELECT COUNT(*) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Dark Horse Comics'	superhero
SELECT superhero_name FROM superhero WHERE publisher_id = (SELECT publisher_id FROM publisher WHERE publisher_name = 'Dark Horse Comics') ORDER BY height_cm DESC LIMIT 1	superhero
SELECT T1.colour FROM colour AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.colour_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Abraham Sapien' AND T1.colour = 'None'	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight'	superhero
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.gender_id = (SELECT id FROM gender WHERE gender = 'female')	superhero
SELECT T1.publisher_name FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id JOIN colour AS T5 ON T3.eye_colour_id = T5.id JOIN colour AS T6 ON T3.hair_colour_id = T6.id JOIN colour AS T7 ON T3.skin_colour_id = T7.id WHERE T5.colour = T6.colour AND T6.colour = T7.colour	superhero
SELECT superhero_name FROM superhero WHERE superhero_name = 'A-Bomb'	superhero
SELECT COUNT(*) AS count, COUNT(CASE WHEN gender = 'female' AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'blue') THEN 1 END) AS blue_female_count, COUNT(CASE WHEN gender = 'female' THEN 1 END) AS female_count, 100.0 * COUNT(CASE WHEN gender = 'female' AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'blue') THEN 1 END) / COUNT(CASE WHEN gender = 'female' THEN 1 END) AS blue_female_percentage FROM superhero WHERE gender = 'female' GROUP BY gender	superhero
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT gender_id FROM superhero WHERE superhero_name = 'Agent 13'	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'adaptation'	superhero
SELECT COUNT(*) FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN superpower AS T3 ON T1.power_id = T3.id WHERE T2.superhero_name = 'Amazo'	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON hero_power.power_id = superpower.id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.superhero_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN power_attribute AS T3 ON T2.power_id = T3.power_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'eye_colour' AND T4.attribute_value = 'amber'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT colour_id FROM colour WHERE colour = 'black') AND hair_colour_id = (SELECT colour_id FROM colour WHERE colour = 'black')	superhero
SELECT T1.eye_colour_id FROM colour AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.eye_colour_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.skin_colour_id = T1.colour AND T1.colour = 'gold'	superhero
SELECT superhero_name FROM superhero WHERE superhero_name LIKE '%vampire%'	superhero
SELECT superhero_name FROM superhero WHERE alignment_id IN (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT COUNT(DISTINCT t1.id) FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t3.attribute_name = 'strength' AND t2.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT T1.race, T1.alignment FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Cameron Hicks'	superhero
SELECT COUNT(*) FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.publisher_id = (SELECT publisher_id FROM publisher WHERE publisher_name = 'Marvel Comics') AND T2.attribute_name = 'gender' AND T2.attribute_value = 'female'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'alien')	superhero
(SELECT superhero.weight_kg - superhero.weight_kg FROM superhero WHERE superhero.superhero_name = 'Emil Blonsky') - (SELECT superhero.weight_kg - superhero.weight_kg FROM superhero WHERE superhero.superhero_name = 'Charles Chandler')	superhero
SELECT AVG(height_cm) FROM superhero GROUP BY gender_id	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON hero_power.power_id = superpower.id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race = 'god/eternal' AND gender = 'male'	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm ASC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT superhero_name, full_name, eye_colour_id, hair_colour_id, skin_colour_id, race_id, publisher_id, alignment_id, height_cm, weight_kg FROM superhero WHERE superhero_name = '3-D Man'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'blue') AND hair_colour_id IN (SELECT id FROM colour WHERE colour = 'brown')	superhero
SELECT publisher_name FROM publisher WHERE publisher_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT MAX(eye_colour_id) FROM superhero)	superhero
SELECT gender_id, COUNT(*) AS count, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_id, gender_	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT power_id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT superhero_name FROM superhero WHERE weight_kg IS NULL	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'	superhero
SELECT superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.full_name = 'Helen Parr'	superhero
SELECT superhero_name FROM superhero WHERE height_cm = 188 AND weight_kg = 108	superhero
SELECT publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.id = 38	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id GROUP BY T1.race ORDER BY T4.attribute_value DESC LIMIT 1	superhero
SELECT alignment, superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Atom IV'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'blue')	superhero
SELECT AVG(t1.attribute_value) FROM hero_attribute AS t1 JOIN superhero AS t2 ON t1.hero_id = t2.id WHERE t2.alignment = 'Neutral'	superhero
SELECT T1.skin_colour_id FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value = 100	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'female')	superhero
SELECT superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_value BETWEEN 75 AND 80	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.race_id = T2.race_id WHERE T2.gender = 'male' AND T2.hair_colour_id = (SELECT colour.id FROM colour WHERE colour.colour = 'blue')	superhero
SELECT COUNT(*) FROM superhero WHERE gender = 'female'	superhero
SELECT (SELECT COUNT(*) FROM superhero WHERE eye_colour_id IS NULL) - (SELECT COUNT(*) FROM superhero WHERE eye_colour_id IS NOT NULL)	superhero
SELECT MAX(weight_kg) FROM superhero WHERE superhero_name = 'Hulk'	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON hero_power.power_id = superpower.id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.superhero_name = 'Ajax'	superhero
SELECT COUNT(*) FROM superhero WHERE skin_colour_id IN (SELECT id FROM colour WHERE colour = 'green')	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'female')	superhero
SELECT superhero_name FROM superhero WHERE superpower_id IN (SELECT power_id FROM hero_power WHERE power_name = 'control wind') ORDER BY superhero_name	superhero
SELECT gender_id FROM superhero WHERE superhero_name = 'Phoenix Force'	superhero
SELECT superhero_name, weight_kg FROM superhero WHERE publisher_id IN (SELECT publisher_id FROM publisher WHERE publisher_name = 'DC Comics') ORDER BY weight_kg DESC LIMIT 1	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_id IN (SELECT publisher_id FROM publisher WHERE publisher_name = 'Dark Horse Comics') AND race_id IN (SELECT race_id FROM race WHERE race = 'Non-human')	superhero
SELECT superhero_name, MAX(height_cm) FROM superhero GROUP BY superhero_name	superhero
SELECT publisher_name, COUNT(*) AS num_superheroes  FROM publisher JOIN superhero ON superhero.publisher_id = publisher.id  GROUP BY publisher_name  ORDER BY num_superheroes DESC	superhero
SELECT T2.attribute_name, T1.attribute_value FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T1.hero_id = (SELECT superhero_id FROM superhero WHERE superhero_name = 'Black Panther') GROUP BY T2.attribute_name ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_name = 'George Lucas' AND gender = 'female'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT publisher_id FROM publisher WHERE publisher_name = 'Marvel Comics') AND superhero_name = 'good'	superhero
SELECT COUNT(*) FROM superhero WHERE superhero_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT superhero_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'brown')	superhero
SELECT T1.attribute_value FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T2.superhero_name = 'Aquababy'	superhero
SELECT weight_kg, race_id FROM superhero WHERE id = 40	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id IN (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT hero_id FROM superhero WHERE superpower_id IN (SELECT power_id FROM superpower WHERE power_name = 'intellegence')	superhero
SELECT T1.eye_colour_id FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Blackwulf'	superhero
SELECT superhero_name, power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.height_cm > (SELECT AVG(height_cm) FROM superhero) JOIN superpower AS T3 ON T2.power_id = T3.id	superhero
SELECT DISTINCT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 18 AND T2.position = 18 ORDER BY T2.rank DESC	formula_1
SELECT DISTINCT T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19 AND T1.time = (SELECT MAX(time) FROM results WHERE raceId = 19)	formula_1
SELECT year FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE location = "Shanghai")	formula_1
SELECT * FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Circuit de Barcelona-Catalunya")	formula_1
SELECT name FROM circuits WHERE country = "Germany"	formula_1
SELECT DISTINCT T2.position FROM constructors AS T1 JOIN circuits AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = "Renault"	formula_1
SELECT COUNT(*) FROM races WHERE year = 2010 AND location NOT IN ('Asia', 'Europe')	formula_1
SELECT name FROM races WHERE country = "Spain"	formula_1
SELECT location FROM circuits WHERE name = "Australian grand prix"	formula_1
SELECT * FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Sepang International Circuit")	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "Sepang International Circuit"	formula_1
SELECT DISTINCT name, location FROM circuits WHERE name = "Abu Dhabi Grand Prix"	formula_1
SELECT constructors.nationality FROM constructors JOIN results ON results.constructorId = constructors.constructorId WHERE results.raceId = 24 GROUP BY constructors.nationality HAVING COUNT(*) = 1	formula_1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId = 21	formula_1
SELECT DISTINCT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE results.q2 = "0:01:40" AND races.number = 355	formula_1
SELECT number FROM results WHERE time = '0:01:54'	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 2 AND year = 2007 AND statusId IS NULL	formula_1
SELECT * FROM races WHERE raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE date = "2015/11/29"	formula_1
SELECT DISTINCT T1.driverId, MAX(T1.dob) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592 GROUP BY T1.driverId	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 161 AND T2.milliseconds = '0:01:27'	formula_1
SELECT DISTINCT T1.name, T1.location FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId WHERE T2.raceId = 933 AND T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933) GROUP BY T1.name, T1.location	formula_1
SELECT location FROM circuits WHERE name = "Malaysian Grand Prix"	formula_1
SELECT constructors.name FROM constructors JOIN results ON results.constructorId = constructors.constructorId WHERE results.raceId = 9 ORDER BY results.points DESC LIMIT 1	formula_1
SELECT results.points FROM results JOIN races ON results.raceId = races.raceId WHERE races.number = 345 AND results.driverId = 10	formula_1
SELECT DISTINCT drivers.nationality FROM drivers, results, races WHERE results.driverId = drivers.driverId AND results.raceId = races.raceId AND results.time = '0:01:15' AND races.year = 347 GROUP BY drivers.nationality	formula_1
SELECT DISTINCT drivers.code FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 45 AND drivers.forename = "Jenson" AND drivers.surname = "Button" AND results.time = "0:01:33"	formula_1
SELECT results.time FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE results.number = 743 AND drivers.forename = "Bruce" AND drivers.surname = "McLaren"	formula_1
SELECT DISTINCT results.driverId, results.number FROM results WHERE results.raceId = (SELECT races.raceId FROM races WHERE races.year = 2006 AND races.name = "San Marino Grand Prix") AND results.position = 2	formula_1
SELECT * FROM races WHERE raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE date = "2015-11-29"	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, MIN(T1.dob) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 872 GROUP BY T1.driverId, T1.forename, T1.surname ORDER BY MIN(T1.dob)	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 348 ORDER BY T2.milliseconds	formula_1
SELECT DISTINCT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.fastestLapSpeed = (SELECT MAX(results.fastestLapSpeed) FROM results) GROUP BY drivers.nationality	formula_1
SELECT (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 853) - (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = (SELECT MAX(raceId) FROM results WHERE raceId < 853 ORDER BY raceId DESC LIMIT 1))	formula_1
SELECT DISTINCT T1.driverId, T1.number, T1.forename, T1.surname, T1.dob, T1.nationality, T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1 AND T2.date = "1983-07-16" GROUP BY T1.driverId, T1.number, T1.forename, T1.surname, T1.dob, T1.nationality, T1.url ORDER BY T1.driverId	formula_1
SELECT MIN(year) FROM races WHERE name = "Singapore Grand Prix"	formula_1
SELECT COUNT(*) FROM races WHERE year = 2005 GROUP BY name ORDER BY name DESC	formula_1
SELECT * FROM races ORDER BY year ASC	formula_1
SELECT name, date FROM races WHERE year = 1999 ORDER BY date DESC LIMIT 1	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT DISTINCT name FROM races WHERE year != 2000	formula_1
SELECT name, location FROM circuits WHERE country = "European" ORDER BY name ASC	formula_1
SELECT MAX(year) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Brands Hatch')) GROUP BY year ORDER BY year DESC	formula_1
SELECT COUNT(*) FROM circuits WHERE location = "Silverstone"	formula_1
SELECT DISTINCT drivers.driverId, drivers.forename, drivers.surname, drivers.dob, drivers.nationality, drivers.url FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.year = 2010 AND races.name = "Singapore Grand Prix" ORDER BY results.position	formula_1
SELECT DISTINCT T1.forename, T1.surname, T1.points FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT DISTINCT T1.driverId, T1.number, T2.points FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 2017 AND T2.year = 2017 GROUP BY T1.driverId, T1.number ORDER BY T2.points DESC LIMIT 3	formula_1
SELECT DISTINCT T1.driverId, T1.driverRef, T2.name, T2.year, T2.date, T2.time, T2.milliseconds, T2.points, T2.status, T2.constructorId, T2.constructorRef, T2.nationality, T2.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM results)	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId = 2 AND driverId = 2	formula_1
SELECT COUNT(DISTINCT results.resultId) FROM results WHERE results.driverId = 44 AND results.raceId NOT IN (SELECT races.raceId FROM races WHERE races.circuitId = (SELECT circuits.circuitId FROM circuits WHERE circuits.name = 'Spa-Francorchamps' AND circuits.location = 'Spa-Francorchamps' AND circuits.country = 'Belgium' AND circuits.lat > 50.64 AND circuits.lng < 5.08)) AND STRFTIME('%y', results.date) >= '2010'	formula_1
SELECT DISTINCT drivers.nationality, AVG(results.points) FROM drivers JOIN results ON drivers.driverId = results.driverId GROUP BY drivers.nationality ORDER BY AVG(results.points) DESC	formula_1
SELECT name FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1	formula_1
SELECT DISTINCT T1.name FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year BETWEEN 1990 AND 2000 GROUP BY T1.name HAVING COUNT(*) = 4	formula_1
SELECT T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = "USA" AND T2.year = 2006 GROUP BY T1.name, T1.location	formula_1
SELECT races.name, circuits.name, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2005 AND circuits.sport = "F1" AND STRFTIME('%m', races.date) = 'September'	formula_1
SELECT results.raceId, results.time FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = 2 AND results.number < 10 GROUP BY results.raceId, results.time ORDER BY results.time	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T3.name = "Sepang International Circuit" AND T4.forename = "Michael" AND T4.surname = "Schumacher" AND T1.statusId = (SELECT statusId FROM status WHERE status = "Won")	formula_1
SELECT races.year, results.fastestLapTime FROM races JOIN results ON races.raceId = results.raceId WHERE results.driverId = 2 AND results.constructorId = 1 GROUP BY races.year ORDER BY results.fastestLapTime ASC	formula_1
SELECT AVG(points) FROM results WHERE year = 2000	formula_1
SELECT results.points FROM results JOIN results ON results.raceId = races.raceId WHERE results.driverId = drivers.driverId AND results.constructorId = constructors.constructorId AND results.statusId = status.statusId AND results.driverId = 44 AND results.constructorId = 1 ORDER BY results.points DESC LIMIT 1	formula_1
SELECT races.name, races.country, races.date FROM races WHERE YEAR(races.date) = 2017 GROUP BY races.name, races.country ORDER BY races.date	formula_1
SELECT races.name, races.year, circuits.location  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  ORDER BY races.laps DESC  LIMIT 1	formula_1
SELECT COUNT(*) FROM races WHERE country = "Germany"	formula_1
SELECT location FROM circuits WHERE name = "Silverstone"	formula_1
SELECT name FROM circuits WHERE location = 'Silverstone'	formula_1
SELECT circuitRef FROM circuits WHERE name = "Marina Bay Street Circuit"	formula_1
SELECT name, location, MAX(alt) FROM circuits GROUP BY location ORDER BY location	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT MAX(dob) FROM drivers	formula_1
SELECT surname FROM drivers WHERE nationality = "Italian"	formula_1
SELECT name FROM drivers WHERE forename = "Anthony" AND surname = "Davidson"	formula_1
SELECT driverRef FROM drivers WHERE forename = "Lewis" AND surname = "Hamilton"	formula_1
SELECT circuitId FROM circuits WHERE name = "Valencia"	formula_1
SELECT DISTINCT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Silverstone") ORDER BY year	formula_1
SELECT DISTINCT results.raceId, results.driverId, results.constructorId, results.number, results.points, results.time, results.milliseconds, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed, results.rank FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = "Silverstone" AND results.statusId = (SELECT status.statusId FROM status WHERE status.status = "None") GROUP BY results.raceId, results.driverId, results.constructorId, results.number, results.points, results.time, results.milliseconds, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed, results.rank ORDER BY results.points DESC	formula_1
SELECT results.time FROM results JOIN races ON results.raceId = races.raceId WHERE races.year = 2010 AND races.name = "Abu Dhabi"	formula_1
SELECT COUNT(*) FROM circuits WHERE country = "Italy"	formula_1
SELECT date FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Barcelona-Catalunya") ORDER BY date	formula_1
SELECT DISTINCT circuitRef FROM circuits WHERE country = "Spain" AND year = 2009	formula_1
SELECT MIN(T2.time) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton" AND T1.raceId = (SELECT MAX(raceId) FROM results)	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = "Formula_1" ORDER BY T2.fastestLapSpeed DESC	formula_1
SELECT DISTINCT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1 AND T2.year = 2008 ORDER BY T2.rank	formula_1
SELECT DISTINCT results.raceId, results.year, results.month, results.day, results.time, results.points, results.laps, results.rank, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed, results.milliseconds, results.grid, results.position, results.positionText, results.statusId FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = "Lewis" AND drivers.surname = "Hamilton" AND results.year = 2019	formula_1
SELECT results.raceId, results.year, results.rank, results.points, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed, results.time, results.milliseconds, results.position, results.positionText, results.statusId FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE results.driverId = 44 AND results.year = 2015 GROUP BY results.raceId, results.year, results.rank, results.points, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed, results.time, results.milliseconds, results.position, results.positionText, results.statusId ORDER BY results.rank ASC	formula_1
SELECT DISTINCT T2.driverId, MAX(T1.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 2009 AND T1.circuitId = 4 GROUP BY T2.driverId	formula_1
SELECT DISTINCT year FROM results WHERE driverId = 1	formula_1
SELECT DISTINCT results.rank FROM results JOIN results ON results.raceId = races.raceId WHERE results.driverId = drivers.driverId AND results.year = 2008 AND results.raceId = 1	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.grid = 4 AND T2.raceId = 1	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 1 AND year = 2008	formula_1
SELECT MAX(T2.points) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.year = 2008 AND T3.forename = "Lewis" AND T3.surname = "Hamilton"	formula_1
SELECT results.time FROM results WHERE results.rank = 2 AND results.raceId = 1 AND results.year = 2008	formula_1
SELECT DISTINCT T1.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1 AND T2.year = 2008	formula_1
SELECT COUNT(DISTINCT driverId) FROM drivers WHERE nationality = "USA" AND date = "2008-03-15"	formula_1
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 1 AND T2.year = 2008	formula_1
SELECT SUM(T2.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton"	formula_1
SELECT AVG(T2.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = "Lewis" AND T2.surname = "Hamilton" AND T1.raceId IN (SELECT DISTINCT raceId FROM races WHERE name = "Formula_1")	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE laps = 1 AND raceId = 1	formula_1
SELECT (SELECT MAX(points) FROM results WHERE raceId = 1 AND year = 2008) - (SELECT MAX(points) FROM results WHERE raceId = 1 AND year = 2008 AND position = (SELECT MAX(position) FROM results WHERE raceId = 1 AND year = 2008))	formula_1
SELECT COUNT(*) FROM circuits WHERE location = "Melbourne, Australia"	formula_1
SELECT location FROM circuits WHERE country = "US"	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = "British" AND dob > 1980	formula_1
SELECT AVG(points) FROM constructors WHERE nationality = "British"	formula_1
SELECT MAX(points) FROM constructorStandings	formula_1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0	formula_1
SELECT COUNT(*) FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Japanese" AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(*) = 2	formula_1
SELECT * FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.rank = 1	formula_1
SELECT COUNT(*) FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "French" AND T2.number > 50	formula_1
SELECT COUNT(DISTINCT results.driverId) AS "Number of Drivers", results.year FROM results JOIN races ON results.raceId = races.raceId WHERE results.year BETWEEN 2007 AND 2009 AND results.driverId IN (SELECT driverId FROM drivers WHERE nationality = 'Japanese') GROUP BY results.year ORDER BY results.year	formula_1
SELECT year, AVG(time) AS avg_time FROM results GROUP BY year	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.rank = 2 AND T1.dob > 1975	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = "Italian" AND NOT finishRace = 1	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2019 ORDER BY T2.milliseconds	formula_1
SELECT MAX(number) FROM results WHERE year = 2009	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = "Spanish Grand Prix"	formula_1
SELECT races.name, races.year FROM races JOIN results ON races.raceId = results.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE results.rank = 1 GROUP BY races.name, races.year ORDER BY results.milliseconds ASC LIMIT 1	formula_1
SELECT COUNT(DISTINCT driverId) FROM drivers WHERE birthDate < '1985-01-01' AND laps > 50	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = "French" AND laptime < "02:00.00"	formula_1
SELECT * FROM drivers WHERE nationality = "America"	formula_1
SELECT DISTINCT raceId FROM races WHERE year = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18	formula_1
SELECT COUNT(DISTINCT driverId) FROM drivers WHERE nationality = 'Netherlandic'	formula_1
SELECT DISTINCT name FROM drivers WHERE forename = "Robert" AND surname = "Kubica"	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = "Australian" AND dob = 1980	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, MIN(T2.milliseconds) FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "German" AND T2.time BETWEEN "1980-01-01" AND "1990-12-31" GROUP BY T1.driverId, T1.forename, T1.surname ORDER BY MIN(T2.milliseconds) ASC	formula_1
SELECT DISTINCT name FROM drivers WHERE nationality = "German" ORDER BY dob ASC	formula_1
SELECT DISTINCT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob LIKE "1971%" ORDER BY T2.fastestLapTime	formula_1
SELECT DISTINCT drivers.driverId, drivers.forename, drivers.surname, drivers.dob, results.time, results.milliseconds, results.rank, results.points, results.laps, results.fastestLap, results.fastestLapTime, results.fastestLapSpeed, results.statusId FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN circuits ON results.raceId = circuits.raceId WHERE drivers.nationality = "Spanish" AND drivers.dob < 1982 ORDER BY results.milliseconds DESC LIMIT 10	formula_1
SELECT year FROM results ORDER BY fastestLapTime ASC LIMIT 1	formula_1
SELECT MIN(milliseconds) FROM lapTimes GROUP BY year ORDER BY year	formula_1
SELECT DISTINCT driverId, MIN(milliseconds) FROM lapTimes GROUP BY driverId ORDER BY milliseconds DESC	formula_1
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId BETWEEN 50 AND 100 AND T2.statusId = (SELECT statusId FROM status WHERE status = 'Disqualified')	formula_1
SELECT COUNT(*) FROM circuits WHERE country = "Austria"	formula_1
SELECT MAX(number) FROM results GROUP BY raceId	formula_1
SELECT DISTINCT T1.nationality, T1.birthday FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.points > (SELECT MAX(points) FROM results WHERE raceId = 23)	formula_1
SELECT MIN(dob) AS date, time FROM drivers GROUP BY date ORDER BY date ASC	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'American' AND statusId = (SELECT statusId FROM status WHERE status = 'Disqualified')	formula_1
SELECT MAX(points) FROM constructorStandings WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'Italian') GROUP BY constructorId	formula_1
SELECT constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId GROUP BY constructors.url ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT DISTINCT T1.driverId, T1.number, MAX(T2.milliseconds) FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 3 GROUP BY T1.driverId, T1.number	formula_1
SELECT races.name, lapTimes.milliseconds FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE lapTimes.lap = 1 ORDER BY lapTimes.milliseconds	formula_1
SELECT AVG(T2.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = (SELECT MAX(raceId) FROM results) AND T2.nationality = "American"	formula_1
SELECT DISTINCT T1.driverId, T1.forename, T1.surname, AVG(T2.milliseconds) AS avg_pit_stop_duration  FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId  WHERE T1.nationality = "German" AND T1.dob BETWEEN "1980-01-01" AND "1985-12-31"  GROUP BY T1.driverId, T1.forename, T1.surname  ORDER BY AVG(T2.milliseconds) ASC  LIMIT 5	formula_1
SELECT results.driverId, results.time FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = "Canadian Grand Prix" AND YEAR(results.date) = 2008 GROUP BY results.driverId, results.time ORDER BY results.time ASC	formula_1
SELECT T1.constructorRef, T1.url FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 2009 AND T2.circuitId = 4 AND T2.position = 1	formula_1
SELECT forename, surname FROM drivers WHERE nationality = 'Austrian' AND dob BETWEEN '1981-01-01' AND '1991-12-31'	formula_1
SELECT forname, surname, birth_date  FROM drivers  WHERE nationality = 'German'  AND birth_date BETWEEN '1971-01-01' AND '1985-12-31'  ORDER BY birth_date DESC	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = "Hungaroring"	formula_1
SELECT MAX(T1.points) AS score, T1.name, T1.nationality FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = (SELECT MAX(raceId) FROM races WHERE year BETWEEN 1980 AND 2010) GROUP BY T1.name, T1.nationality	formula_1
SELECT AVG(points) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Turkish Grand Prix') AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(year) FROM races WHERE year BETWEEN 2000 AND 2010 GROUP BY year	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM results WHERE rank = 91	formula_1
SELECT races.name, MAX(results.fastestLapSpeed) FROM races JOIN results ON races.raceId = results.raceId GROUP BY races.name	formula_1
SELECT T2.name, T2.location FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.raceId = (SELECT MAX(raceId) FROM results)	formula_1
SELECT DISTINCT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 3 AND T1.position = 1 AND T1.year = 2008	formula_1
SELECT DISTINCT drivers.forename, drivers.surname, races.name, races.year FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.nationality = 'None' AND results.year = (SELECT MAX(results.year) FROM results) GROUP BY drivers.forename, drivers.surname, races.name, races.year ORDER BY results.year DESC	formula_1
SELECT COUNT(*) FROM results WHERE results.driverId = (SELECT MAX(results.driverId) FROM results WHERE results.raceId = (SELECT races.raceId FROM races WHERE races.name = 'Canadian Grand Prix'))	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.rank = 1 GROUP BY T1.driverId ORDER BY T2.rank ASC	formula_1
SELECT MAX(milliseconds) FROM pitStops	formula_1
SELECT MAX(milliseconds) FROM lapTimes GROUP BY raceId, driverId, lap ORDER BY milliseconds ASC	formula_1
SELECT MAX(milliseconds) FROM pitStops WHERE driverId = 1	formula_1
SELECT MAX(milliseconds) FROM pitStops WHERE raceId = 1 AND driverId = 1	formula_1
SELECT DISTINCT T1.driverId, T1.stop, T1.time FROM pitStops AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2011	formula_1
SELECT MAX(milliseconds) FROM lapTimes WHERE raceId IN (SELECT races.raceId FROM races JOIN results ON results.raceId = races.raceId WHERE results.driverId = 4 AND results.constructorId = 1)	formula_1
SELECT DISTINCT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T3.name = 'Formula_1' AND T2.milliseconds = (SELECT MIN(milliseconds) FROM results)	formula_1
SELECT DISTINCT T2.position FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.driverId = 4 AND T1.constructorId = 2 AND T1.points = (SELECT MAX(T1.points) FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.driverId = 4 AND T1.constructorId = 2)	formula_1
SELECT MAX(milliseconds) FROM lapTimes WHERE raceId = 1	formula_1
SELECT DISTINCT T1.name, T2.driverId, T2.number, T2.time, T2.milliseconds FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = "Italy" AND T2.position = 1 GROUP BY T2.driverId, T2.number, T2.time, T2.milliseconds ORDER BY T2.milliseconds	formula_1
SELECT MAX(milliseconds) FROM lapTimes WHERE raceId = 1	formula_1
SELECT DISTINCT t1.driverId, t1.stop, t1.time, t1.duration FROM pitStops AS t1 JOIN results AS t2 ON t1.raceId = t2.raceId WHERE t2.driverId = (SELECT DISTINCT t2.driverId FROM results AS t2 JOIN results AS t3 ON t2.raceId = t3.raceId WHERE t2.driverId = (SELECT DISTINCT t3.driverId FROM results AS t3 JOIN results AS t4 ON t3.raceId = t4.raceId WHERE t3.driverId = (SELECT DISTINCT t4.driverId FROM results AS t4 JOIN results AS t5 ON t4.raceId = t5.raceId WHERE t4.driverId = (SELECT DISTINCT t5.driverId FROM results AS t5 JOIN results AS t6 ON t5.raceId = t6.raceId WHERE t5.driverId = (SELECT DISTINCT t6.driverId FROM results AS t6 JOIN results AS t7 ON t6.raceId = t7.raceId WHERE t6.driverId = (SELECT DISTINCT t7.driverId FROM results AS t7 JOIN results AS t8 ON t7.raceId = t8.raceId WHERE t7.driverId = (SELECT DISTINCT t8.driverId FROM results AS t8 JOIN results AS t9 ON t8.raceId = t9.raceId WHERE t8.driverId = (SELECT DISTINCT t9.driverId FROM results AS t9 JOIN results AS t10 ON t9.raceId = t10.raceId WHERE t9.driverId = (SELECT DISTINCT t10.driverId FROM results AS t10 JOIN results AS t11 ON t10.raceId = t11.raceId WHERE t10.driverId = (SELECT DISTINCT t11.driverId FROM results AS t11 JOIN results AS t12 ON t11.raceId = t12.raceId WHERE t11.driverId = (SELECT DISTINCT t12.driverId FROM results AS t12 JOIN results AS t13 ON t12.raceId = t13.raceId WHERE t12.driverId = (SELECT DISTINCT t13	formula_1
SELECT location FROM circuits WHERE lap = 1.29488	formula_1
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = 1	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT player_api_id, player_name, height FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player_Attributes ORDER BY potential LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND preferred_foot = 'right'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE crossing > 0 GROUP BY player_api_id ORDER BY crossing DESC LIMIT 5	european_football_2
SELECT league_id, COUNT(*) AS goals FROM Match WHERE season = 2016 GROUP BY league_id ORDER BY goals DESC	european_football_2
SELECT T1.home_team_api_id, T1.home_team_name, COUNT(*) AS matches_won FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id GROUP BY T1.home_team_api_id, T1.home_team_name HAVING COUNT(*) > 10 ORDER BY COUNT(*) DESC	european_football_2
SELECT player_api_id, player_name, penalties FROM Player ORDER BY penalties DESC LIMIT 10	european_football_2
SELECT T2.team_api_id, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T1.home_team_api_id, T1.home_player_X1, T1.home_player_X2, T1.home_player_X3, T1.home_player_X4, T1.home_player_X5, T1.home_player_X6, T1.home_player_X7, T1.home_player_X8, T1.home_player_X9, T1.home_player_X10, T1.home_player_X11, T1.away_team_api_id, T1.away_player_X1, T1.away_player_X2, T1.away_player_X3, T1.away_player_X4, T1.away_player_X5, T1.away_player_X6, T1.away_player_X7, T1.away_player_X8, T1.away_player_X9, T1.away_player_X10, T1.away_player_X11 FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id OR T1.away_team_api_id = T2.team_api_id WHERE T1.season = '2010' GROUP BY T2.team_api_id, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T1.home_team_api_id, T1.home_player_X1, T1.home_player_X2, T1.home_player_X3, T1.home_player_X4, T1.home_player_X5, T1.home_player_X6, T1.home_player_X7, T1.home_player_X8, T1.home_player_X9, T1.home_player_X10, T1.home_player_X11, T	european_football_2
SELECT TOP(4) AS T1_name, T1.team_api_id, T1.team_fifa_api_id, T1.team_long_name, T2.buildUpPlaySpeed FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id ORDER BY T2.buildUpPlaySpeed DESC	european_football_2
SELECT T2.league_id, T2.season, COUNT(*) AS matches_as_draw FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = 2016 GROUP BY T2.league_id, T2.season ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT player_api_id, player_name, player_fifa_api_id, birthday, weight, height, overall_rating, preferred_foot, attacking_work_rate, defensive_work_rate, crossing, finishing, heading_accuracy, short_passing, volleys, dribbling, curving, free_kick_accuracy, long_passing, ball_control, acceleration, sprint_speed, agility, reactions, balance, shot_power, jumping, stamina, strength, long_shots, aggression, interceptions, positioning, vision, penalties, marking, standing_tackle, sliding_tackle, gk_diving, gk_handling, gk_kicking, gk_positioning, gk_reflexes FROM Player JOIN Team_Attributes ON Player.team_api_id = Team_Attributes.team_api_id JOIN Team ON Player.team_api_id = Team.team_api_id JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE sprint_speed >= 97 AND season BETWEEN 2013 AND 2015 GROUP BY player_api_id, player_name, player_fifa_api_id, birthday, weight, height, overall_rating, preferred_foot, attacking_work_rate, defensive_work_rate, crossing, finishing, heading_accuracy, short_passing, volleys, dribbling, curving, free_kick_accuracy, long_passing, ball_control, acceleration, sprint_speed, agility, reactions, balance, shot_power, jumping, stamina, strength, long_shots, aggression, interceptions, positioning, vision, penalties, marking, standing_tackle, sliding_tackle, gk_diving, gk_handling, gk_kicking, gk_positioning, gk_reflexes ORDER BY overall_rating DESC	european_football_2
SELECT T1.name, COUNT(*) FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT AVG(weight) FROM Player WHERE birthday BETWEEN '1990-01-01' AND '1995-12-31'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date = 2010 GROUP BY player_api_id HAVING AVG(overall_rating) > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date = 2010) ORDER BY player_api_id DESC LIMIT 1	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeedClass IN (SELECT MAX(buildUpPlaySpeedClass) FROM Team_Attributes) GROUP BY team_fifa_api_id HAVING COUNT(buildUpPlaySpeedClass) > 50 AND COUNT(buildUpPlaySpeedClass) < 60	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes) GROUP BY T1.team_api_id HAVING COUNT(*) > 1 ORDER BY T2.buildUpPlayPassing DESC	european_football_2
SELECT preferred_foot, COUNT(*) FROM Player_Attributes WHERE birthday BETWEEN '1987-01-01' AND '1992-12-31' GROUP BY preferred_foot	european_football_2
SELECT T1.name, COUNT(T1.name) AS total_goals FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.name ORDER BY total_goals DESC LIMIT 5	european_football_2
SELECT AVG(long_shots) FROM Player WHERE player_name = 'Ahmed Samir Farag'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 GROUP BY T1.player_name ORDER BY AVG(T2.heading_accuracy) DESC LIMIT 10	european_football_2
SELECT T1.team_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'normal' GROUP BY T1.team_name HAVING AVG(T2.chanceCreationPassing) < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'normal') ORDER BY AVG(T2.chanceCreationPassing) DESC	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2009/2010' GROUP BY T1.name HAVING AVG(T2.home_team_goal) > AVG(T2.away_team_goal) ORDER BY AVG(T2.home_team_goal) DESC	european_football_2
SELECT T2.team_short_name FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_name = "Queens Park Rangers"	european_football_2
SELECT * FROM Player WHERE birthyear = 1970 AND birthmonth = 10	european_football_2
SELECT T1.player_api_id, T1.player_name, T2.overall_rating FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "Franco Zennaro"	european_football_2
SELECT T1.player_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T1.player_fifa_api_id, T1.	european_football_2
SELECT player_api_id, finishing FROM "Match" WHERE date = '18/09/2014' GROUP BY player_api_id ORDER BY finishing	european_football_2
SELECT T1.overall_rating FROM "Player_Attributes" AS T1 JOIN "Player" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Gabriel Tamas" AND T1.date = 2011	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/16' AND country_id = (SELECT id FROM Country WHERE name = 'Scotland')	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE date = (SELECT MAX(date) FROM Player_Attributes)	european_football_2
SELECT player_api_id, potential FROM Player_Attributes ORDER BY potential DESC	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE Player_Attributes.preferred_foot = 'left' AND Player_Attributes.player_api_id IN (SELECT Player.player_api_id FROM Player WHERE Player.weight < 130)	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = "Risky"	european_football_2
SELECT DISTINCT T1.player_api_id, T1.player_fifa_api_id, T1.player_name, T2.defensive_work_rate FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "David Wilson"	european_football_2
SELECT T1.birthday FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT T2.name FROM "League" AS T1 JOIN "Country" AS T2 ON T1.country_id = T2.id WHERE T2.name = "Netherlands"	european_football_2
SELECT AVG(home_team_goal) FROM Match WHERE season = '2010/2011' AND country_id = (SELECT id FROM Country WHERE name = 'Poland')	european_football_2
SELECT T1.player_api_id, AVG(T1.finishing) FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_api_id ORDER BY AVG(T1.finishing) DESC LIMIT 1	european_football_2
SELECT player_api_id, player_name FROM Player WHERE age > 180 GROUP BY player_api_id	european_football_2
SELECT COUNT(*) FROM Player WHERE birthday > 1990	european_football_2
SELECT COUNT(*) FROM Player WHERE weight > 170 AND player_name = 'Adam'	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE overall_rating > 80)	european_football_2
SELECT player_api_id, potential FROM Player_Attributes WHERE player_api_id = 254440	european_football_2
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left'	european_football_2
SELECT T1.team_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.team_name = "CLB"	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE overall_rating > 170 AND date BETWEEN '2010-01-01' AND '2015-12-31' GROUP BY overall_rating	european_football_2
SELECT player_api_id, player_name, height FROM Player ORDER BY height ASC LIMIT 1	european_football_2
SELECT country_id FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')	european_football_2
SELECT T2.team_short_name FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = 2544500	european_football_2
SELECT COUNT(*) FROM Match WHERE season LIKE '%2008%' AND date BETWEEN '2008-08-01' AND '2008-10-31' AND league_id IN (SELECT id FROM League WHERE name = '1. Bundesliga')	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10 GROUP BY T1.team_short_name	european_football_2
SELECT player_api_id, MAX(balance) AS max_balance, MAX(potential) AS max_potential FROM Player_Attributes WHERE potential = 61 GROUP BY player_api_id ORDER BY max_balance DESC	european_football_2
SELECT (SELECT AVG(ball_control) FROM Player WHERE player_name = 'Abdou Diallo') - (SELECT AVG(ball_control) FROM Player WHERE player_name = 'Aaron Appindangoye')	european_football_2
SELECT T2.team_long_name FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_fifa_api_id = 'GEN'	european_football_2
SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY player_api_id LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'left' AND T2.attacking_work_rate > 0	european_football_2
SELECT country_id FROM League WHERE name = 'Belgium Jupiler League'	european_football_2
SELECT * FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Germany') ORDER BY season DESC	european_football_2
SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes GROUP BY player_api_id	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id JOIN "Player_Attributes" AS T3 ON T1.player_api_id = T3.player_api_id WHERE T1.player_api_id IN (SELECT player_api_id FROM Player WHERE birthday < 1986) AND T3.preferred_foot = T2.team_fifa_api_id	european_football_2
SELECT player_api_id, MAX(crossing) FROM Player_Attributes GROUP BY player_api_id	european_football_2
SELECT T1.header_accuracy FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(*) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volley > 70	european_football_2
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volley >= 70 AND T2.dribbling >= 70	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/09' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium')	european_football_2
SELECT MAX(long_passing) FROM Player	european_football_2
SELECT COUNT(*) FROM Match WHERE country_id IN (SELECT country_id FROM League WHERE name = 'Belgium Jupiler League') AND date LIKE '%April%' AND year = 2009	european_football_2
SELECT league_id FROM Match WHERE season = '2008/09' GROUP BY league_id ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE date < 1986	european_football_2
SELECT (SELECT overall_rating FROM "Player_Attributes" WHERE player_api_id = (SELECT player_api_id FROM "Player" WHERE player_name = 'Ariel Borysiuk')) - (SELECT overall_rating FROM "Player_Attributes" WHERE player_api_id = (SELECT player_api_id FROM "Player" WHERE player_name = 'Paulin Puel'))	european_football_2
SELECT AVG(t1.buildUpPlaySpeed) FROM Team_Attributes AS t1 JOIN Team AS t2 ON t1.team_fifa_api_id = t2.team_fifa_api_id WHERE t2.team_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Pietro Marino')	european_football_2
SELECT SUM(t1.crossing) FROM sqlite_sequence AS t1 JOIN Player AS t2 ON t1.player_api_id = t2.player_api_id WHERE t2.player_name = 'Aaron Lennox'	european_football_2
SELECT MAX(chanceCreationPassing) FROM "Player" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.player_api_id = T2.player_api_id AND T1.player_name = 'Ajax'	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_api_id = 2103455	european_football_2
SELECT MAX(overall_rating) FROM Player_Attributes WHERE player_api_id = 254545	european_football_2
SELECT AVG(T2.home_team_goal) FROM "Match" AS T1 JOIN "Team" AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T2.team_name = 'Parma' AND T1.country_id = (SELECT country_id FROM "Country" WHERE country_name = 'Italy') AND T1.season = '2020/21'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date = '2016/6/23' ORDER BY T1.player_api_id LIMIT 1	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_api_id = 2016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000	european_football_2
SELECT player_api_id, potential FROM Player_Attributes WHERE date = '2010/8/30' GROUP BY player_api_id ORDER BY potential DESC	european_football_2
SELECT T1.player_api_id, T1.player_name, T2.attacking_work_rate FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date = '2015/5/1'	european_football_2
SELECT DISTINCT T1.defensive_work_rate FROM "Player_Attributes" AS T1 JOIN "Match" AS T2 ON T1.player_api_id = T2.home_player_api_id WHERE T2.date = "2013/02/22" AND T2.home_player_name = "Kevin Berigaud"	european_football_2
SELECT date FROM `Match` WHERE home_player_X1 = (SELECT player_api_id FROM Player WHERE player_name = 'Kevin Constant') ORDER BY home_player_X1 DESC LIMIT 1	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id JOIN "Match" AS T3 ON T2.team_fifa_api_id = T3.home_team_api_id WHERE T3.date = "2011/02/22" AND T1.team_name = "Willem II"	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_fifa_api_id = 'LEI' AND date = '2015/9/10' GROUP BY buildUpPlayDribblingClass ORDER BY buildUpPlayDribblingClass	european_football_2
SELECT buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_name = "FC Lorient" AND T2.date = "2010/2/22"	european_football_2
SELECT T1.chanceCreationPassingClass FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id JOIN "Match" AS T3 ON T2.team_fifa_api_id = T3.home_team_api_id WHERE T3.date = "2013-09-20" AND T1.team_name = "PEC Zwolle"	european_football_2
SELECT T1.chance_creation_crossing_class FROM "Team" AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id JOIN "Match" AS T3 ON T2.team_fifa_api_id = T3.home_team_api_id WHERE T3.date = "2010/2/22" AND T1.team_name = "Hull City"	european_football_2
SELECT T1.defenceAggressionClass FROM "Team" AS T1 JOIN "Match" AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_name = "Hannover 96" AND T2.date = "2015/9/10"	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE date BETWEEN '2007/02/22' AND '2016/04/21' AND player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Marko Arnautovic')	european_football_2
SELECT (SELECT MAX(overall_rating) FROM Player_Attributes WHERE player_api_id = 101) - (SELECT MAX(overall_rating) FROM Player_Attributes WHERE player_api_id = 102)	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_api_id, player_name FROM Player WHERE age >= 35	european_football_2
SELECT SUM(home_team_goal) FROM Match WHERE home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')	european_football_2
SELECT SUM(T2.home_player_X11) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.home_player_api_id WHERE T1.player_name = 'Daan Smith' OR T1.player_name = 'Filipe Ferreira'	european_football_2
SELECT SUM(home_team_goal) FROM Match WHERE home_player_age <= 30	european_football_2
SELECT player_api_id, player_name, overall_rating, preferred_foot, attacking_work_rate, defensive_work_rate, crossing, finishing, heading_accuracy, short_passing, volleys, dribbling, curving, free_kick_accuracy, long_passing, ball_control, acceleration, sprint_speed, agility, reactions, balance, shot_power, jumping, stamina, strength, long_shots, aggression, interceptions, positioning, vision, penalties, marking, standing_tackle, sliding_tackle, gk_diving, gk_handling, gk_kicking, gk_positioning, gk_reflexes FROM Player_Attributes JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id JOIN Team_Attributes ON Team_Attributes.team_api_id = Team.team_api_id JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id JOIN League ON League.id = Team.league_id JOIN Country ON Country.id = League.country_id JOIN Team_Attributes ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id JOIN Player_Attributes ON Player_Attributes.team_fifa_api_id = Team.team_fifa_api_id JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id JOIN League ON League.id = Team.league_id JOIN Country ON Country.id = League.country_id JOIN Team_Attributes ON Team_Attributes.team_fifa_api_id = Team.team_fifa_api_id JOIN Player_Attributes ON Player_Attributes.team_fifa_api_id = Team.team_fifa_api_id JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id JOIN League ON League.id = Team.league_id JOIN Country ON Country.id = League.country_id JOIN Team_Attributes ON Team_	european_football_2
SELECT player_api_id, MAX(potential) FROM Player_Attributes GROUP BY player_api_id	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN "Player_Attributes" AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = (SELECT MAX(attacking_work_rate) FROM "Player_Attributes") GROUP BY T1.player_api_id	european_football_2
SELECT player_api_id, player_name FROM Player WHERE finishing = 1 ORDER BY player_api_id LIMIT 1	european_football_2
SELECT player_api_id FROM Player WHERE country_api_id = (SELECT country_api_id FROM Country WHERE country_name = 'Belgium')	european_football_2
SELECT country_id FROM Player_Attributes WHERE vision >= 90	european_football_2
SELECT country_id, AVG(weight) FROM Player GROUP BY country_id ORDER BY AVG(weight) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN "Team_Attributes" AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'slow'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'safe' GROUP BY T1.team_api_id	european_football_2
SELECT AVG(t1.height) FROM Player as t1 JOIN "Player_Attributes" as t2 ON t1.player_api_id = t2.player_api_id WHERE t2.player_fifa_api_id = (SELECT MAX(player_api_id) FROM "Player_Attributes") GROUP BY t1.player_api_id	european_football_2
SELECT player_api_id, player_name FROM Player WHERE height > 180 ORDER BY player_api_id	european_football_2
SELECT COUNT(*) FROM Player WHERE birthday > 1990 AND player_name = 'Aaron'	european_football_2
SELECT (SELECT MAX(jumping) FROM Player_Attributes WHERE player_api_id = 6) - (SELECT MAX(jumping) FROM Player_Attributes WHERE player_api_id = 23)	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' AND potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') ORDER BY potential LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes WHERE preferred_foot = 'left')	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE strength > 80 AND stamina > 80	european_football_2
SELECT country_id FROM Match WHERE league_id = (SELECT league_id FROM League WHERE name = 'Poland Ekstraklasa')	european_football_2
SELECT T1.home_team_api_id, T1.away_team_api_id, T1.home_player_X1, T1.home_player_X2, T1.home_player_X3, T1.home_player_X4, T1.home_player_X5, T1.home_player_X6, T1.home_player_X7, T1.home_player_X8, T1.home_player_X9, T1.home_player_X10, T1.home_player_X11, T1.home_player_Y1, T1.home_player_Y2, T1.home_player_Y3, T1.home_player_Y4, T1.home_player_Y5, T1.home_player_Y6, T1.home_player_Y7, T1.home_player_Y8, T1.home_player_Y9, T1.home_player_Y10, T1.home_player_Y11, T1.home_player_1, T1.home_player_2, T1.home_player_3, T1.home_player_4, T1.home_player_5, T1.home_player_6, T1.home_player_7, T1.home_player_8, T1.home_player_9, T1.home_player_10, T1.home_player_11, T1.away_player_1, T1.away_player_2, T1.away_player_3, T1.away_player_4, T1.away_player_5, T1.away_player_6, T1.away_player_7, T1.away_player_8, T1.away_player_9, T1.away_player_10, T1.away_player_11 FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id JOIN Team AS T3 ON T1.away_team_api_id = T3.team_api_id WHERE T1.date = '20	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player WHERE player_name = 'Alexis Blin'	european_football_2
SELECT T1.team_api_id, T1.team_fifa_api_id, T1.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T2.team_short_name, T2.team_fifa_api_id, T2.team_long_name, T	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/16' AND league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Italy'))	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE league_id IN (SELECT id FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Netherlands'))	european_football_2
SELECT finishing, curve FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 1)	european_football_2
SELECT league_id FROM Match WHERE season = '2015/16' GROUP BY league_id ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT T2.team_name FROM Match AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id GROUP BY T1.away_team_api_id ORDER BY SUM(T1.away_team_goal) DESC LIMIT 1	european_football_2
SELECT player_api_id, MAX(overall_rating) FROM Player_Attributes GROUP BY player_api_id	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating > 70 AND height < 180	european_football_2
SELECT Sex, COUNT(*) AS MaleCount FROM Patient WHERE Sex = 'M' GROUP BY Sex ORDER BY MaleCount DESC	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Birthday > 1930	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE Patient.Birthday BETWEEN '1930-01-01' AND '1940-12-31' AND Patient.Admission = 'INPATIENT'	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday, T1.Description, T1.First_Date, T1.Admission, T1.Diagnosis, T2.Thrombosis, T2.Examination_Date, T2.aCL_IgG, T2.aCL_IgM, T2.ANA, T2.aCL_IgA, T2.Diagnosis, T2.KCT, T2.RVVT, T2.LAC, T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' GROUP BY T1.ID, T1.SEX, T1.Birthday, T1.Description, T1.First_Date, T1.Admission, T1.Diagnosis, T2.Thrombosis, T2.Examination_Date, T2.aCL_IgG, T2.aCL_IgM, T2.ANA, T2.aCL_IgA, T2.Diagnosis, T2.KCT, T2.RVVT, T2.LAC, T2.Symptoms ORDER BY T2.Thrombosis DESC	thrombosis_prediction
SELECT Examination.Diagnosis, Laboratory.Date FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Patient.ID = 30609	thrombosis_prediction
SELECT SEX, Birthday FROM Patient WHERE ID = 163109 SELECT Examination.Examination_Date, Examination.Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.ID = 163109	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > (SELECT MAX(Laboratory.LDH) FROM Laboratory) GROUP BY Patient.ID, Patient.SEX, Patient.Birthday	thrombosis_prediction
SELECT ID, age FROM Patient WHERE Admission = 'Positive'	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis > 10 GROUP BY Patient.ID, Patient.SEX, Patient.Diagnosis ORDER BY Patient.ID	thrombosis_prediction
SELECT * FROM Patient WHERE Birthday = 1937 AND TC > 200 SELECT * FROM Patient WHERE Birthday = 1937 AND TC > 200	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.ALB < 3.5 GROUP BY Patient.ID, Patient.SEX, Patient.Diagnosis ORDER BY Patient.ID	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'female' AND TP < 8	thrombosis_prediction
SELECT AVG(aCL IgG) FROM Examination WHERE ANA > 0 AND Thrombosis > 0 AND LAC = 'In-patient' AND Symptoms = 'None' AND ID IN (SELECT ID FROM Patient WHERE AGE >= 50)	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND `First Date` = 1997	thrombosis_prediction
SELECT MIN(Patient.Age) FROM Patient	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = (SELECT MAX(Thrombosis) FROM Examination) AND T2.SEX = 'female' AND T1.Examination Date = 1997	thrombosis_prediction
SELECT MAX(TAT) - MIN(TAT) FROM Examination	thrombosis_prediction
SELECT Examination.Symptoms, Examination.Diagnosis FROM Examination ORDER BY Examination.Examination_Date DESC LIMIT 1	thrombosis_prediction
SELECT AVG(t.RBC) FROM Patient AS t JOIN Examination AS e ON t.ID = e.ID JOIN Laboratory AS l ON t.ID = l.ID WHERE t.SEX = 'M' AND e.Examination Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY t.RBC ORDER BY t.RBC	thrombosis_prediction
SELECT MAX(Patient.Birthday) AS Birthday, MAX(Patient.Age) AS Age FROM Patient WHERE Patient.Diagnosis = 'SJS' GROUP BY Patient.ID ORDER BY Patient.Birthday DESC	thrombosis_prediction
SELECT Sex, COUNT(*) AS Count FROM Patient GROUP BY Sex ORDER BY Count DESC	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient WHERE NOT Patient.ID IN (SELECT Examination.Patient FROM Examination WHERE Examination.Examination_Date >= DATEADD(year, 1, Patient.First_Date))	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` BETWEEN '1990-01-01' AND '1993-12-31' AND AGE < 18	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND TAT2 > 1	thrombosis_prediction
SELECT TOP 1 Diagnosis FROM Examination WHERE ID IN (SELECT ID FROM Laboratory WHERE Date BETWEEN '1985-01-01' AND '1995-12-31') GROUP BY Diagnosis ORDER BY COUNT(*) DESC	thrombosis_prediction
SELECT AVG(Patient.Age) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Date LIKE '%1991%' AND Examination.Thrombosis IS NOT NULL GROUP BY Patient.Age	thrombosis_prediction
SELECT Patient.Birthday, Examination.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Birthday = (SELECT MAX(Patient.Birthday) FROM Patient JOIN Examination ON Patient.ID = Examination.ID)	thrombosis_prediction
SELECT IGM FROM Examination WHERE ID = 3605340	thrombosis_prediction
SELECT TC FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04' AND TC BETWEEN 150 AND 200	thrombosis_prediction
SELECT Sex FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY Sex ASC	thrombosis_prediction
SELECT Examination.aCL IgG FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Diagnosis = 'SLE' AND Examination.Examination Date = '1994-02-19' AND Examination.aCL IgG IS NOT NULL ORDER BY Examination.aCL IgG DESC	thrombosis_prediction
SELECT * FROM Examination WHERE ExaminationDate = '1992-06-12' AND ALT = 9	thrombosis_prediction
SELECT Patient.Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.UA = 8.4 AND Patient.Birthday < '1991-10-21' ORDER BY Patient.Age DESC	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Examination.Patient_ID IN (SELECT Patient.ID FROM Patient WHERE Patient.First_Date = '1991-06-13' AND Patient.Diagnosis = 'SJS') AND Examination.Date BETWEEN '1995-01-01' AND '1995-12-31'	thrombosis_prediction
SELECT DISTINCT Patient.Diagnosis FROM Patient WHERE Patient.Diagnosis = 'SLE' AND Patient.First Date = '1997-01-27'	thrombosis_prediction
SELECT Examination.Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = '1959-03-01' AND Examination.Examination_Date = '1993-09-27'	thrombosis_prediction
SELECT TAT, TAT2, COUNT(TAT) FROM Examination WHERE `Examination Date` BETWEEN '1981-11-01' AND '1981-12-31' AND Patient.Birthday = '1959-02-18' GROUP BY TAT, TAT2 ORDER BY TAT DESC	thrombosis_prediction
SELECT * FROM Examination WHERE Diagnosis = 'Behcet's' AND `Examination Date` BETWEEN '1970-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.GPT > 30 AND Examination.ALB < 4 AND Patient.Birthday BETWEEN '1987-07-06' AND '1996-01-31' GROUP BY Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Patient.Diagnosis ORDER BY Patient.ID	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND Birthday = 1964	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis > 2 AND Examination.ANA_Pattern = 'S' AND Examination.aCL_IgM > (SELECT AVG(Examination.aCL_IgM) FROM Examination)	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM (SELECT Patient.ID, Laboratory.U-PRO, Laboratory.U-PRO AS URIC_LEVEL, Laboratory.U-PRO AS PROTEINURIA_LEVEL FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.U-PRO BETWEEN 0 AND 10) AS t1 WHERE t1.PROTEINURIA_LEVEL < t1.URIC_LEVEL	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Sex = 'M' AND `First Date` = 1981 AND Diagnosis = 'BEHCET'	thrombosis_prediction
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Examination_Date = '1991-10-01' AND NOT Patient.Diagnosis IS NULL AND Laboratory.T-BIL BETWEEN 0 AND 1.0 AND Laboratory.T-CHO BETWEEN 0 AND 1.0 AND Laboratory.UN BETWEEN 0 AND 1.0 AND Laboratory.CKT BETWEEN 0 AND 1.0 AND Laboratory.RVVT BETWEEN 0 AND 1.0 AND Laboratory.LAC BETWEEN 0 AND 1.0 AND Laboratory.Symptoms IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE ANA NOT LIKE '%P%' AND `Examination Date` BETWEEN '1980-01-01' AND '1989-12-31'	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday, Patient.Description, Patient.First_Date, Patient.Admission, Patient.Diagnosis, Examination.Thrombosis, Laboratory.CRP, Laboratory.CENTROMEA, Laboratory.DNA_II FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'PSS' AND Laboratory.CRP = '2+' AND Laboratory.CENTROMEA = '1' AND Laboratory.DNA_II = '123'	thrombosis_prediction
SELECT AVG(ALB) FROM Laboratory WHERE Sex = 'F' AND PLT > 400 AND Diagnosis = 'SLE'	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT `First Date` FROM Patient WHERE ID = 48473	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'APS' AND SEX = 'F'	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Date < '1997-01-01' AND Examination.Date > '1997-12-31' AND Examination.TP < 0.5 OR Examination.TP > 1.5	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Examination AS t1 JOIN Patient AS t2 ON t1.ID = t2.ID WHERE t1.Thrombosis > 0 AND t2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Patient AS t1 JOIN Examination AS t2 ON t1.ID = t2.ID WHERE t1.SEX = 'female' AND t2.Diagnosis = 'RA' AND YEAR(t1.Birthday) = 1980	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Examination.ID IN (SELECT Patient.ID FROM Patient WHERE Patient.SEX = 'M' AND Patient.Admission BETWEEN '1995-01-01' AND '1997-12-31') AND Examination.Diagnosis = 'BEHCET disease' AND NOT Patient.ID IN (SELECT Patient.ID FROM Patient WHERE Patient.Admission BETWEEN '1995-01-01' AND '1997-12-31' AND Patient.Admission IS NULL)	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'F' AND WBC < 3.5	thrombosis_prediction
SELECT MAX(T-BIL) FROM Laboratory WHERE ID IN (SELECT MAX(ID) FROM Patient WHERE ID = 821298)	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Examination.ID = 57266 AND Examination.UA BETWEEN 2.0 AND 6.0	thrombosis_prediction
SELECT * FROM Examination WHERE Examination.ID = 48473 AND Examination.GOT > (SELECT MAX(GOT) FROM Examination WHERE Examination.ID = 48473)	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.GOT BETWEEN None AND None AND Examination.Date = 1994	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'M' AND Examination.GPT > (SELECT MAX(GPT) FROM Examination)	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALT > (SELECT MAX(ALT) FROM Examination) ORDER BY T2.Birthday	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH BETWEEN 0 AND 100	thrombosis_prediction
SELECT Patient.ID, Patient.Age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH BETWEEN 100 AND 300	thrombosis_prediction
SELECT * FROM Patient WHERE ALP BETWEEN 0.0 and 1.0	thrombosis_prediction
SELECT Patient.ID, Laboratory.ALP FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday = '1982-04-01' AND Laboratory.ALP BETWEEN (SELECT MIN(Laboratory.ALP) FROM Laboratory) AND (SELECT MAX(Laboratory.ALP) FROM Laboratory)	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < (SELECT MIN(Laboratory.TP) FROM Laboratory) GROUP BY Patient.ID, Patient.SEX, Patient.Birthday	thrombosis_prediction
SELECT (SELECT MAX(TP) FROM Laboratory WHERE Sex = 'female') - (SELECT MAX(TP) FROM Laboratory WHERE Sex = 'female' AND TP <= (SELECT MAX(TP) FROM Laboratory WHERE Sex = 'female'))	thrombosis_prediction
SELECT * FROM Patient WHERE SEX = 'M' AND Albumin < 3.5 ORDER BY Birthday DESC	thrombosis_prediction
SELECT * FROM Patient WHERE YEAR(Birthday) = 1982 AND Albumin BETWEEN 0.8 AND 1.2 SELECT * FROM Patient WHERE YEAR(Birthday) = 1982 AND Albumin BETWEEN 0.8 AND 1.2	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 1000 AND IGA > 1000 AND IGM > 1000 AND TAT2 > 10 AND IGG > 100	thrombosis_prediction
SELECT AVG(UA) FROM Laboratory WHERE UA IS NOT NULL	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UN BETWEEN 10 AND 20	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'RA' AND Examination.UN < 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND NOT CREATININE_INDEX IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND NOT CREATININE IS NULL	thrombosis_prediction
SELECT MAX(TAT) FROM Examination	thrombosis_prediction
SELECT Sex, SUM(T-BIL) FROM Laboratory WHERE T-BIL < 1.0 GROUP BY Sex	thrombosis_prediction
SELECT Patient.ID, Laboratory.T-CHO FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'None' AND Patient.Birthday = 'None' AND Patient.Description = 'None' AND Patient.Diagnosis = 'None' ORDER BY Laboratory.T-CHO DESC LIMIT 1	thrombosis_prediction
SELECT AVG(Birthday) FROM Patient WHERE SEX = 'M' AND TAT2 > 1000 GROUP BY Birthday	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.TG > 100 GROUP BY Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.Diagnosis ORDER BY Patient.Birthday	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE TG > 150 AND Age > 50	thrombosis_prediction
SELECT DISTINCT ID FROM Examination WHERE CreatininePhosphokinase BETWEEN None AND None	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND CreatinePhosphokinase > 1.0	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.AGE FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.GLU < 0.8 AND Examination.T-CHO < 200 GROUP BY Patient.ID, Patient.SEX, Patient.AGE HAVING COUNT(DISTINCT Examination.ID) = 1	thrombosis_prediction
SELECT Patient.ID, Laboratory.GLU FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.First_Date = 1991 AND Laboratory.GLU BETWEEN 0.5 AND 1.0 GROUP BY Patient.ID ORDER BY Patient.ID	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.WBC < 4000  GROUP BY Patient.SEX  ORDER BY Patient.Birthday	thrombosis_prediction
SELECT Patient.ID, Patient.Age, Examination.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.RBC < (SELECT MAX(Patient.RBC) FROM Patient)	thrombosis_prediction
SELECT * FROM Patient WHERE SEX = 'female' AND Age >= 50 AND RBC < 4 SELECT * FROM Patient WHERE SEX = 'female' AND Age >= 50 AND RBC < 4	thrombosis_prediction
SELECT DISTINCT ID, SEX FROM Patient WHERE HGB < 10 ORDER BY HGB ASC	thrombosis_prediction
SELECT Patient.ID, Patient.SEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'SLE' AND Patient.HGB = (SELECT MAX(Patient.HGB) FROM Patient WHERE Patient.HGB <> 'None')	thrombosis_prediction
SELECT Patient.ID, Patient.Age FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.HCT > (SELECT MAX(HCT) FROM Examination) GROUP BY Patient.ID, Patient.Age HAVING COUNT(*) >= 2	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date < '1991-01-01' AND HCT < (SELECT AVG(HCT) FROM Laboratory WHERE Date < '1991-01-01')	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.PLT < (SELECT MAX(PLT) FROM Examination)	thrombosis_prediction
SELECT * FROM Patient WHERE Age < 50 SELECT * FROM Examination WHERE YEAR(ExaminationDate) = 1984 AND PlateletLevel = 1	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Patient AS t1 JOIN Examination AS t2 ON t1.ID = t2.ID WHERE t1.SEX = 'female' AND t2.PT > 1.5 GROUP BY t1.ID	thrombosis_prediction
SELECT * FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.FirstDate > 1992 AND Examination.PT = 1	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND `T-BIL` IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = 'abnormal' AND T2.Thrombosis < 10	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND WBC = 1 AND FG < 1	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Birthday > '1980-01-01' AND Examination.FG < 1	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.U-PRO > 0	thrombosis_prediction
SELECT patient_id FROM Examination WHERE diagnosis = 'SLE' AND `Proteinuria` = 0	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.aCL IgG < 0 AND Examination.Symptoms = 'abortion'	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Patient AS t1 JOIN Examination AS t2 ON t1.ID = t2.ID WHERE t2.aCL IgG = 0 AND t2.Symptoms <> 'None'	thrombosis_prediction
SELECT Examination.Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.aCL IgA = (SELECT MAX(aCL IgA) FROM Examination WHERE aCL IgA BETWEEN 0 AND 100)	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.aCL IgA > 0 AND Patient.Admission > '1990-01-01'	thrombosis_prediction
SELECT t1.Diagnosis FROM Examination AS t1 JOIN Patient AS t2 ON t1.ID = t2.ID WHERE t1.aCL IgM > 0 GROUP BY t1.Diagnosis ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE NOT C-reactive_protein IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Age < 18 AND Examination.CRP = 'abnormal'	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RVVT = 'None' AND Examination.RF = 'None' AND Examination.RNP = 'None' AND Examination.SM = 'None' AND Examination.SSA = 'None' AND Examination.SSB = 'None' AND Examination.CENTROMEA = 'None' AND Examination.DNA = 'None' AND Examination.DNA_II = 'None' AND Examination.RF = 'None' AND Examination.RNP = 'None' AND Examination.SM = 'None' AND Examination.SSA = 'None' AND Examination.SSB = 'None' AND Examination.CENTROMEA = 'None' AND Examination.DNA = 'None' AND Examination.DNA_II = 'None' AND Examination.RF = 'None' AND Examination.RNP = 'None' AND Examination.SM = 'None' AND Examination.SSA = 'None' AND Examination.SSB = 'None' AND Examination.CENTROMEA = 'None' AND Examination.DNA = 'None' AND Examination.DNA_II = 'None' AND Examination.RF = 'None' AND Examination.RNP = 'None' AND Examination.SM = 'None' AND Examination.SSA = 'None' AND Examination.SSB = 'None' AND Examination.CENTROMEA = 'None' AND Examination.DNA = 'None' AND Examination.DNA_II = 'None' AND Examination.RF = 'None' AND Examination.RNP = 'None' AND Examination.SM = 'None' AND Examination.SSA = 'None' AND Examination.SSB = 'None' AND Examination.CENTROMEA = 'None' AND Examination.DNA = 'None' AND Examination.DNA_II = 'None' AND Examination.RF = 'None	thrombosis_prediction
SELECT * FROM Patient WHERE Birthday > '1995-01-01' AND RF = 'None'	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.AGE > 60 AND Examination.RF = 'NORMAL'	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RF = 'None' AND Examination.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Examination AS t1 JOIN Patient AS t2 ON t1.ID = t2.ID WHERE t1.ANA_Pattern = 'P' AND t1.Complement_3 = (SELECT MAX(Complement_3) FROM Examination)	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.HCT < 0.35 GROUP BY Patient.ID ORDER BY Examination.aCL IgG DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis > 0 AND T2.SEX = 'female' AND T1.ANA = 0 AND T1.aCL IgG = 0 AND T1.aCL IgM = 0 AND T1.aCL IgA = 0 AND T1.KCT = 0 AND T1.RVVT = 0 AND T1.LAC = 0 AND T1.Symptoms = 'None' AND T1.T-BIL = 0 AND T1.T-CHO = 0 AND T1.TG = 0 AND T1.CPK = 0 AND T1.GLU = 0 AND T1.WBC = 0 AND T1.RBC = 0 AND T1.HGB = 0 AND T1.HCT = 0 AND T1.PT = 0 AND T1.APTT = 0 AND T1.FG = 0 AND T1.PIC = 0 AND T1.TAT = 0 AND T1.TAT2 = 0 AND T1.U-PRO = 'None' AND T1.IGG = 0 AND T1.IGA = 0 AND T1.IGM = 0 AND T1.CRP = 'None' AND T1.RA = 'None' AND T1.RF = 'None' AND T1.C3 = 0 AND T1.C4 = 0 AND T1.RNP = 'None' AND T1.SM = 'None' AND T1.SSA = 'None' AND T1.SSB = 'None' AND T1.CENTROMEA = 'None' AND T1.DNA = 'None' AND T1.DNA-II = 0	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.ANA = 0	thrombosis_prediction
SELECT Patient.Birthday FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.ANA < 1 ORDER BY Patient.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Patient AS t1 JOIN Examination AS t2 ON t1.ID = t2.ID WHERE t2.Thrombosis = (SELECT MAX(Thrombosis) FROM Examination WHERE t2.Thrombosis <> 'None') AND t2.RF = 'None'	thrombosis_prediction
SELECT ID FROM Patient WHERE Sex = 'F' AND Age < 30	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.ANA_Pattern = 'None' AND Examination.Thrombosis = 0 AND Examination.Examination_Date > '1997-01-01'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE ANA = 0 AND Symptoms = 'vertigo' AND SEX = 'M'	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.ANA < 1 AND Patient.Admission < 1990	thrombosis_prediction
SELECT patient.ID FROM patient JOIN Examination ON patient.ID = Examination.ID WHERE Examination.ANA < 1 GROUP BY patient.ID ORDER BY patient.ID LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Diagnosis = 'SLE' AND Patient.SSB = 'None'	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Examination AS t1 JOIN Patient AS t2 ON t1.ID = t2.ID WHERE t1.Symptoms = 'None' AND t1.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT `DNA` IS NULL	thrombosis_prediction
SELECT DISTINCT Diagnosis FROM Examination WHERE `DNA-II` IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE NOT ID IN (SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.DNA = 'None')	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.DNA_II < 0	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Examination AS t1 JOIN Patient AS t2 ON t1.ID = t2.ID WHERE t1.GOT > 1 AND t1.GPT > 1 AND t1.ALB > 1 AND t1.UA > 1 AND t1.UN > 1 AND t1.T-BIL > 1 AND t1.T-CHO > 1 AND t1.TG > 1 AND t1.CPK > 1 AND t1.GLU > 1 AND t1.WBC < 4 AND t1.RBC < 4 AND t1.HGB < 4 AND t1.HCT < 4 AND t1.PT < 1 AND t1.APTT < 1 AND t1.FG < 1 AND t1.PIC < 1 AND t1.TAT < 1 AND t1.TAT2 < 1 AND t1.U-PRO = 'None' AND t2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND TAT2 < 1.5	thrombosis_prediction
SELECT MIN(Patient.Birthday) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG < 1	thrombosis_prediction
SELECT TOP 3 Birthday, MAX(GPT) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID GROUP BY Birthday ORDER BY MAX(GPT) DESC	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND NOT TAT2 IS NULL	thrombosis_prediction
SELECT MIN(Laboratory.Date) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'None' AND Laboratory.LDH BETWEEN 0 AND 1 GROUP BY Laboratory.Date ORDER BY Laboratory.Date ASC	thrombosis_prediction
SELECT MAX(Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.LAC = (SELECT MAX(LAC) FROM Examination)	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALP > 1	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALP = 0	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 0.8 GROUP BY T2.ID	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Patient AS t1 JOIN Examination AS t2 ON t1.ID = t2.ID WHERE t2.Diagnosis = 'SJS' AND t2.TP = (SELECT MAX(t2.TP) FROM Examination AS t2 JOIN Patient AS t1 ON t1.ID = t2.ID WHERE t2.Diagnosis = 'SJS')	thrombosis_prediction
SELECT MAX(ALB) FROM Laboratory GROUP BY ALB ORDER BY ALB DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND (ALB = 1 AND TP = 1)	thrombosis_prediction
SELECT IGM FROM Examination WHERE Sex = 'female' AND UA = (SELECT MAX(UA) FROM Examination WHERE Sex = 'female')	thrombosis_prediction
SELECT MAX(IGA) FROM Examination WHERE NOT IGA IS NULL	thrombosis_prediction
SELECT Patient.ID, MAX(Lab.Creatinine) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID GROUP BY Patient.ID HAVING MAX(Lab.Creatinine) = 1 AND Lab.Creatinine < 1.1 ORDER BY Patient.ID	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Examination AS t1 JOIN Patient AS t2 ON t1.ID = t2.ID WHERE t1.ANA = 'Peripheral' AND t1.aCL IgG > 1 AND t1.aCL IgM > 1	thrombosis_prediction
SELECT MAX(T-BIL) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'female'	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Cholesterol > 200 AND Examination.ANA < 0	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Examination AS t1 JOIN Patient AS t2 ON t1.ID = t2.ID WHERE t1.ANA_Pattern = 'P' AND t1.aCL_IgG BETWEEN 0 AND 1 AND t1.aCL_IgM BETWEEN 0 AND 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.TG = (SELECT MAX(TG) FROM Examination) AND T2.Symptoms = 'None'	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG BETWEEN (SELECT MAX(TG) FROM Laboratory) AND (SELECT MIN(TG) FROM Laboratory) GROUP BY T2.ID ORDER BY T1.TG DESC LIMIT 1	thrombosis_prediction
SELECT DISTINCT ID FROM Examination WHERE Thrombosis IS NULL AND CPK > 1.0	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Patient AS t1 JOIN Examination AS t2 ON t1.ID = t2.ID WHERE t2.TAT2 > 0 AND t2.TAT2 < 10 AND t2.TAT2 < 100 AND t2.TAT2 < 1000 AND t2.TAT2 < 10000 SELECT COUNT(DISTINCT t1.ID) FROM Patient AS t1 JOIN Examination AS t2 ON t1.ID = t2.ID WHERE t2.TAT2 > 0 AND t2.TAT2 < 10 AND t2.TAT2 < 100 AND t2.TAT2 < 1000 AND t2.TAT2 < 10000	thrombosis_prediction
SELECT Patient.Birthday FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.TG < 1 SELECT Patient.Birthday FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.TG < 1 GROUP BY Patient.ID ORDER BY Patient.Birthday DESC	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis IS NULL AND `T-BIL` IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.WBC > 0	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Diagnosis = 'SLE' AND Examination.WBC = (SELECT MAX(WBC) FROM Laboratory)	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RBC < 4 AND Patient.Admission = 'outpatient'	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Patient AS t1 JOIN Examination AS t2 ON t1.ID = t2.ID WHERE t1.SEX = 'female' AND t2.PLT > 100 GROUP BY t1.ID	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Description, p.First_Date, p.Admission, p.Diagnosis, l.PLT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'MCTD' AND l.PLT BETWEEN 100000 AND 150000 GROUP BY p.ID, p.SEX, p.Birthday, p.Description, p.First_Date, p.Admission, p.Diagnosis ORDER BY p.ID	thrombosis_prediction
SELECT AVG(PT) FROM Patient WHERE SEX = 'M' AND PT IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Examination WHERE Thrombosis > 1000 AND TP = 1	thrombosis_prediction
SELECT major_name FROM major WHERE department = 'EECS'	student_club
SELECT COUNT(*) FROM member WHERE major = 'Engineering'	student_club
SELECT first_name, last_name FROM member WHERE major_name = 'Art and Design'	student_club
SELECT COUNT(DISTINCT T1.member_id) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = "Women's Soccer"	student_club
SELECT phone FROM member WHERE member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event = 'Women's Soccer')	student_club
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women's Soccer' AND T1.t_shirt_size = 'medium'	student_club
SELECT event_id, event_name, MAX(attendance) FROM attendance JOIN event ON attendance.link_to_event = event.event_id GROUP BY event_id, event_name	student_club
SELECT major.college FROM major JOIN member ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'	student_club
SELECT T2.event_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean'	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Student_Club' AND T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND T1.event_date = 2019	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND T2.link_to_member IN (SELECT member_id FROM member GROUP BY member_id HAVING COUNT(*) > 10)	student_club
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T2.link_to_member = 'Student_Club' GROUP BY T1.event_name HAVING COUNT(*) > 20	student_club
SELECT AVG(attendance.attended) FROM attendance WHERE YEAR(attendance.attended) = 2020 GROUP BY attendance.link_to_event	student_club
SELECT MAX(expense_cost) FROM expense	student_club
SELECT COUNT(*) FROM member WHERE major = 'Environmental Engineering'	student_club
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = "Laugh Out Loud" GROUP BY T2.member_id	student_club
SELECT last_name FROM member WHERE major = "Law and Constitutional Studies"	student_club
SELECT zip_code.county FROM zip_code JOIN member ON zip_code.zip = member.zip WHERE member.first_name = "Sherri" AND member.last_name = "Ramsey"	student_club
SELECT major.college FROM major JOIN member ON member.link_to_major = major.major_id WHERE member.first_name = 'Tyler' AND member.last_name = 'Hewitt'	student_club
SELECT amount FROM income WHERE source = 'Vice President'	student_club
SELECT SUM(expense.cost) FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_description = 'Food' AND MONTH(expense.expense_date) = 9	student_club
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'	student_club
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Illinois')	student_club
SELECT SUM(expense.cost) FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_date = 'September' AND member.first_name = 'Student' AND member.last_name = 'Club' AND expense.category = 'advertisement'	student_club
SELECT DISTINCT major.department FROM major JOIN member ON member.major_id = major.major_id WHERE member.first_name = 'Pierce' AND member.last_name = 'Guidi'	student_club
SELECT SUM(budget.amount) FROM budget WHERE budget.event_status = 'October Speaker' GROUP BY budget.category ORDER BY budget.category	student_club
SELECT expense_id FROM expense WHERE expense_date = 'October 8, 2019'	student_club
SELECT AVG(cost) FROM expense WHERE expense_date BETWEEN '2021-09-01' AND '2021-10-31'	student_club
SELECT (SELECT SUM(spent) FROM budget WHERE event_status = 'Student_Club' AND YEAR(spent_date) = 2020) - (SELECT SUM(spent) FROM budget WHERE event_status = 'Student_Club' AND YEAR(spent_date) = 2019)	student_club
SELECT location FROM event WHERE event_name = "Spring Budget Review"	student_club
SELECT expense_cost FROM expense WHERE expense_date = '2019-09-04' AND expense_description = 'Posters'	student_club
SELECT budget.remaining FROM budget WHERE budget.category = 'Food' ORDER BY budget.remaining DESC LIMIT 1	student_club
SELECT notes FROM event WHERE event_date = '2019/9/14'	student_club
SELECT COUNT(*) FROM major WHERE department = "Humanities and Social Sciences"	student_club
SELECT phone FROM member WHERE first_name = "Carlo" AND last_name = "Jacobs"	student_club
SELECT zip_code.county FROM zip_code JOIN member ON zip_code.zip = member.zip WHERE member.first_name = "Adela" AND member.last_name = "O'Gallagher"	student_club
SELECT COUNT(*) FROM budget WHERE budget_id IN (SELECT budget_id FROM budget WHERE budget_id IN (SELECT link_to_budget FROM budget WHERE budget_id IN (SELECT link_to_event FROM event WHERE event_name = 'November Meeting'))) AND spent > amount	student_club
SELECT SUM(budget.amount) FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Speaker'	student_club
SELECT event_status FROM event WHERE event_date = "2019/8/20"	student_club
SELECT major_name FROM major WHERE department = 'EECS'	student_club
SELECT COUNT(*) FROM member WHERE major = "Human Development and Family Studies" AND t_shirt_size = "Large"	student_club
SELECT zip_code.type FROM zip_code JOIN member ON zip_code.zip = member.zip WHERE member.first_name = "Christof" AND member.last_name = "Nielson"	student_club
SELECT major_name FROM major WHERE department = 'Club'	student_club
SELECT zip_code.state FROM zip_code JOIN member ON zip_code.zip = member.zip WHERE member.first_name = "Sacha" AND member.last_name = "Harrison"	student_club
SELECT major.department FROM major JOIN member ON member.link_to_major = major.major_id WHERE member.position = 'President'	student_club
SELECT income_id FROM income WHERE date_received = '2021-01-01'	student_club
SELECT first_name, last_name FROM member ORDER BY date_received ASC LIMIT 1	student_club
SELECT COUNT(*) FROM budget WHERE budget.category = 'Advertisement' AND budget.event_status = 'Yearly Kickoff' AND budget.spent > (SELECT MAX(budget.spent) FROM budget WHERE budget.category = 'October Meeting' AND budget.event_status = 'October Meeting')	student_club
SELECT budget.category, budget.spent, budget.remaining, budget.amount, budget.link_to_event, budget.event_status, budget.link_to_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.foreign_key_event, budget.fore	student_club
SELECT SUM(t2.cost) FROM event AS t1 JOIN expense AS t2 ON t1.event_id = t2.link_to_event WHERE t1.type = 'Pizza Party'	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = "Orange" AND state = "Virginia"	student_club
SELECT DISTINCT department FROM major WHERE college = "Humanities and Social Sciences"	student_club
SELECT zip_code.city FROM zip_code JOIN member ON zip_code.zip = member.zip WHERE member.first_name = "Amy" AND member.last_name = "Firth"	student_club
SELECT budget_id, category, spent, remaining FROM budget ORDER BY remaining ASC LIMIT 1	student_club
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = "October Meeting" GROUP BY T2.first_name, T2.last_name	student_club
SELECT major_name FROM major GROUP BY major_name ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT major_name FROM major WHERE zip = (SELECT zip FROM member WHERE phone = "809-555-3360")	student_club
SELECT event_id, event_name, MAX(budget.amount) FROM budget JOIN event ON budget.link_to_event = event.event_id GROUP BY event_id ORDER BY budget.amount DESC	student_club
SELECT expense_description FROM expense WHERE link_to_member = 'Vice President'	student_club
SELECT COUNT(DISTINCT T1.member_id) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women\'s Soccer'	student_club
SELECT income_id, date_received FROM income WHERE link_to_member = 'Casey Mason'	student_club
SELECT COUNT(DISTINCT zip) FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland')	student_club
SELECT COUNT(*) FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.phone = "954-555-6240"	student_club
SELECT first_name, last_name FROM member WHERE department = "School of Applied Sciences, Technology and Education"	student_club
SELECT event_id, event_name, type, notes, location, status, MAX(spent) AS spent_to_budget_ratio FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.status = 'closed' GROUP BY event_id, event_name, type, notes, location, status ORDER BY spent_to_budget_ratio DESC	student_club
SELECT COUNT(*) FROM member WHERE position = 'president'	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND event_date LIKE '%2020%'	student_club
SELECT SUM(cost) FROM expense WHERE category = 'Food'	student_club
SELECT T2.first_name, T2.last_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.member_id HAVING COUNT(*) > 7	student_club
SELECT T2.first_name, T2.last_name FROM event AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.event_name = 'Community Theater' AND T2.major = 'interior design'	student_club
SELECT first_name, last_name FROM member WHERE zip = (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina')	student_club
SELECT COUNT(*) FROM income WHERE income.source = 'Grant Gilmour'	student_club
SELECT first_name, last_name FROM member WHERE zip > 40	student_club
SELECT SUM(cost) FROM expense WHERE event_status = 'None' AND link_to_event = 'Yearly Kickoff'	student_club
SELECT T2.first_name, T2.last_name FROM budget AS T1 JOIN member AS T2 ON T1.link_to_event = T2.link_to_event WHERE T1.event_status = 'Approved' GROUP BY T2.first_name, T2.last_name ORDER BY T2.first_name	student_club
SELECT first_name, last_name, income_source FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY first_name, last_name, income_source ORDER BY income_source DESC LIMIT 1	student_club
SELECT event_id, event_name, MIN(notes) FROM event GROUP BY event_id	student_club
SELECT SUM(cost) AS total_cost FROM expense	student_club
SELECT major_name, COUNT(*) AS count FROM major WHERE department = 'Finance' OR department = 'Physics' GROUP BY major_name	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received LIKE '%2019-09%' GROUP BY source ORDER BY total_amount DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(*) FROM member WHERE major = 'Physics Teaching'	student_club
SELECT COUNT(DISTINCT T1.member_id) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Community Theater' AND T3.event_date = 2019	student_club
SELECT COUNT(*) FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = "Luisa" AND T2.last_name = "Guidi"	student_club
SELECT AVG(expense.cost) FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE expense.category = 'Food' GROUP BY event.event_id	student_club
SELECT event_name, MAX(spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id GROUP BY event_name	student_club
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women's Soccer' AND T3.first_name = 'Maya' AND T3.last_name = 'Mclean'	student_club
SELECT event_id, COUNT(*) AS event_count, type FROM event WHERE event_name = 'Community Service' AND event_date LIKE '%2019%' GROUP BY event_id ORDER BY event_count DESC	student_club
SELECT SUM(cost) FROM expense WHERE link_to_event = 'September Speaker'	student_club
SELECT t_shirt_size, COUNT(*) AS count  FROM member  GROUP BY t_shirt_size  ORDER BY count DESC	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.spent > T2.amount GROUP BY T1.event_name ORDER BY T2.spent DESC LIMIT 1	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = 'October 15, 2019'	student_club
SELECT budget.category, budget.spent FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY budget.category ORDER BY budget.spent	student_club
SELECT budget_id, category, MAX(spent) FROM budget WHERE category = 'Food' GROUP BY budget_id	student_club
SELECT budget_id, category, spent, remaining FROM budget WHERE category = 'Advertising' ORDER BY spent DESC LIMIT 3	student_club
SELECT SUM(cost) FROM expense WHERE category = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '8/20/2019'	student_club
SELECT first_name, last_name, SUM(cost) FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY first_name, last_name	student_club
SELECT expense_description FROM expense WHERE link_to_member = 'Sacha Harrison'	student_club
SELECT DISTINCT expense_description FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE t_shirt_size = 'X-Large')	student_club
SELECT zip_code FROM member WHERE expense_date < '2020-01-01'	student_club
SELECT major_name FROM major JOIN member ON member.link_to_major = major.major_id WHERE member.first_name = "Phillip" AND member.last_name = "Cullen"	student_club
SELECT position FROM member WHERE major = "Business"	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'Medium' AND department = 'Business'	student_club
SELECT event_type FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining > 30	student_club
SELECT category FROM budget WHERE link_to_event = 'MU 215'	student_club
SELECT category FROM budget WHERE event_status = 'completed' AND event_date = '2020-03-24T12:00:00'	student_club
SELECT major_name FROM major WHERE department = 'Computer Science'	student_club
SELECT COUNT(*) FROM member WHERE major = 'Mathematics'	student_club
SELECT category FROM budget WHERE link_to_event = '215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'Extra Large'	student_club
SELECT COUNT(*) FROM major WHERE department = "School of Applied Sciences, Technology and Education" AND college = "Agriculture and Applied Sciences"	student_club
SELECT last_name, department, college FROM member WHERE major = 'Environmental Engineering'	student_club
SELECT budget.category FROM budget, event WHERE budget.link_to_event = event.event_id AND event.location = 'MU 215' AND budget.spent = 0	student_club
SELECT T2.city, T2.state FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.major_id WHERE T1.department = 'Electrical and Computer Engineering'	student_club
SELECT T2.event_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = "Vice" AND T1.last_name = "President" AND T1.organization = "Student_Club" AND T2.event_id = (SELECT MAX(event_id) FROM attendance)	student_club
SELECT T2.last_name, T2.position FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.date_received = '2019-09-10' AND T1.source = 'Pizza'	student_club
SELECT T2.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = "Women's Soccer" GROUP BY T2.link_to_member HAVING COUNT(*) > 0 ORDER BY T2.link_to_member	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'medium' AND zip IN (SELECT zip_code FROM zip_code WHERE zip_code = 50)	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'Post Office Box'	student_club
SELECT zip_code FROM zip_code WHERE state = "Puerto Rico"	student_club
SELECT event_name FROM event WHERE event_status = 'closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20' AND type = 'game'	student_club
SELECT T1.event_id, T1.event_name FROM event AS T1 JOIN "attendance" AS T2 ON T1.event_id = T2.link_to_event JOIN "member" AS T3 ON T2.link_to_member = T3.member_id WHERE T3.paid > 50 GROUP BY T1.event_id ORDER BY T1.event_id	student_club
SELECT T1.first_name, T1.last_name, T2.link_to_event FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_event IN (SELECT event_id FROM event WHERE event_date BETWEEN '2019-01-10' AND '2019-11-19')	student_club
SELECT major.college FROM major JOIN member ON member.link_to_major = major.major_id WHERE member.first_name = "Katy" AND major.major_name = "rec1N0upiVLy5esTO"	student_club
SELECT phone FROM member WHERE major = "Business" AND college = "Agriculture and Applied Sciences"	student_club
SELECT email FROM income WHERE amount > 20 GROUP BY email ORDER BY email ASC	student_club
SELECT COUNT(*) FROM member WHERE major_name = 'Education' AND college = 'Education & Human Services'	student_club
SELECT budget.category, COUNT(*) AS events_over_budget FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE budget.spent > budget.amount GROUP BY budget.category ORDER BY budget.category	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_id, AVG(cost) AS avg_cost FROM expense GROUP BY expense_id HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'Extra Large'	student_club
SELECT zip_code, COUNT(zip_code) FROM zip_code WHERE type = 'PO Box' GROUP BY zip_code ORDER BY zip_code	student_club
SELECT T1.event_name, T1.location FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.spent < T2.amount GROUP BY T1.event_id HAVING SUM(T2.spent) < T2.amount ORDER BY T2.spent DESC	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'pizza' AND T2.cost > 50 AND T2.cost < 100 GROUP BY T1.event_name, T1.event_date ORDER BY T1.event_date DESC	student_club
SELECT T2.first_name, T2.last_name, T2.major_name FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost > 100 GROUP BY T2.member_id	student_club
SELECT T1.city, T1.country FROM zip_code AS T1 JOIN event AS T2 ON T1.zip_code = T2.location WHERE T2.income > 40	student_club
SELECT T1.first_name, T1.last_name, MAX(T2.amount) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id	student_club
SELECT AVG(amount) FROM income WHERE NOT source = 'member'	student_club
SELECT event_name FROM event WHERE parking_cost < (SELECT AVG(parking_cost) FROM event)	student_club
SELECT event_id, type, SUM(cost) AS total_cost FROM expense WHERE event_id IN (SELECT event_id FROM event WHERE type = 'Game') GROUP BY event_id, type ORDER BY total_cost DESC	student_club
SELECT budget_id, category, MAX(spent) FROM budget GROUP BY category ORDER BY spent DESC	student_club
SELECT first_name, last_name FROM member ORDER BY spent DESC LIMIT 5	student_club
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING AVG(T2.cost) > (SELECT AVG(cost) FROM expense) ORDER BY AVG(T2.cost) DESC	student_club
SELECT (SELECT COUNT(*) FROM zip_code WHERE state = 'Maine') - (SELECT COUNT(*) FROM zip_code WHERE state = 'Vermont')	student_club
SELECT major_name, department FROM major WHERE first_name = "Garrett" AND last_name = "Gerke"	student_club
SELECT T1.first_name, T1.last_name, T2.expense_description, T2.cost FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, veggie tray and supplies'	student_club
SELECT last_name, phone FROM member WHERE major = "Elementary Education"	student_club
SELECT budget.category, budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker'	student_club
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'	student_club
SELECT first_name, last_name, amount FROM income WHERE date_received = '1999-09-09'	student_club
SELECT budget.category FROM budget JOIN expense ON budget.budget_id = expense.budget_id WHERE expense.expense_description = 'Posters'	student_club
SELECT first_name, last_name FROM member WHERE position = 'Secretary'	student_club
SELECT event_name, SUM(spent) AS total_spent FROM budget JOIN event ON budget.link_to_event = event.event_id GROUP BY event_name	student_club
SELECT zip_code.city FROM zip_code JOIN member ON zip_code.zip = member.zip WHERE member.first_name = 'Garrett' AND member.last_name = 'Girke'	student_club
SELECT first_name, last_name, position FROM member WHERE zip = 28092	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT Currency, COUNT(*) AS Count FROM customers GROUP BY Currency ORDER BY Count DESC	debit_card_specializing
SELECT MIN(Consumption) FROM yearmonth WHERE Date = 2012	debit_card_specializing
SELECT AVG(Consumption) FROM yearmonth WHERE YEAR(Date) = 2013	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, MAX(y.Consumption)  FROM customers c  JOIN yearmonth y  ON c.CustomerID = y.CustomerID  WHERE c.Currency = 'CZK'  GROUP BY c.CustomerID, c.Segment  ORDER BY MAX(y.Consumption) DESC	debit_card_specializing
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Segment = 'KAM' AND t2.Consumption < 30000 AND YEAR(t2.Date) = 2012	debit_card_specializing
SELECT    (SELECT MAX(Consumption) FROM yearmonth WHERE Date = 2012 AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')) -    (SELECT MAX(Consumption) FROM yearmonth WHERE Date = 2012 AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR'))	debit_card_specializing
SELECT Year, MAX(Consumption) FROM yearmonth GROUP BY Year	debit_card_specializing
SELECT Segment, MIN(Consumption) FROM yearmonth GROUP BY Segment	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Currency = 'CZK'	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date = 2013	debit_card_specializing
SELECT    (SELECT AVG(Consumption) FROM yearmonth WHERE Date LIKE '%2013%') -    (SELECT AVG(Consumption) FROM yearmonth WHERE Date LIKE '%2013%')	debit_card_specializing
SELECT Segment, MAX(Consumption) AS Consumption_2013, MIN(Consumption) AS Consumption_2012, (MAX(Consumption) - MIN(Consumption)) / MAX(Consumption) * 100 AS Percentage_increase FROM yearmonth GROUP BY Segment ORDER BY Percentage_increase DESC	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '2013-08-01' AND '2013-11-30' AND CustomerID = 6	debit_card_specializing
SELECT Country, COUNT(*) AS Discount_Gas_Stations FROM gasstations WHERE Country IN ('Czech Republic', 'Slovakia') GROUP BY Country ORDER BY Discount_Gas_Stations DESC	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE Date = 'April 2013' AND CustomerID = 7) - (SELECT Consumption FROM yearmonth WHERE Date = 'April 2013' AND CustomerID = 5)	debit_card_specializing
SELECT Segment, COUNT(*) AS NumberOfSMEs FROM customers WHERE Currency = 'Czech koruna' GROUP BY Segment ORDER BY NumberOfSMEs DESC	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date = 'October 2013'	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, MAX(c.Consumption) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID GROUP BY c.CustomerID, c.Segment, c.Currency ORDER BY c.CustomerID DESC	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE Date = 'May 2013'	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Segment = 'LAM' AND Consumption > 46.73	debit_card_specializing
SELECT Country, COUNT(*) AS "Value for Money" FROM gasstations WHERE Price = (SELECT MAX(Price) FROM gasstations) GROUP BY Country ORDER BY Country	debit_card_specializing
SELECT COUNT(*) FROM customers WHERE Segment = 'KAM' AND Currency = 'EUR'	debit_card_specializing
SELECT COUNT(DISTINCT CustomerID) FROM customers WHERE Segment = 'None'	debit_card_specializing
SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'Premium'	debit_card_specializing
SELECT CustomerID, MAX(Consumption) FROM yearmonth WHERE Date = 'September 2013' GROUP BY CustomerID	debit_card_specializing
SELECT Segment, MIN(Consumption) FROM yearmonth GROUP BY Segment	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, MIN(y.Consumption)  FROM customers c  JOIN yearmonth y  ON c.CustomerID = y.CustomerID  WHERE y.Date = 'June 2012'  GROUP BY c.CustomerID, c.Segment, c.Currency	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date = 2012 GROUP BY Date	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Currency = 'Euro' GROUP BY Date ORDER BY Consumption DESC	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN "yearmonth" AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Date = '2013-09-01'	debit_card_specializing
SELECT Country FROM gasstations WHERE TIME(Date) = '2013-06-01'	debit_card_specializing
SELECT DISTINCT T1.ChainID FROM gasstations AS T1 JOIN "transactions_1k" AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = "Euro"	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Price = (SELECT MAX(Price) FROM transactions_1k)	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE "%Jan%" AND YEAR(Date) = 2012	debit_card_specializing
SELECT COUNT(*) FROM customers AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Currency = 'Euro' AND t2.Consumption > 1000 GROUP BY t1.CustomerID	debit_card_specializing
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T3.Country = 'Czech Republic'	debit_card_specializing
SELECT T1.Time, T1.Date FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11 GROUP BY T1.Time, T1.Date ORDER BY T1.Time DESC	debit_card_specializing
SELECT COUNT(*) FROM gasstations WHERE Country = 'Czech Republic' INTERSECT SELECT COUNT(*) FROM transactions_1k WHERE Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Country = 'Czech Republic' AND T1.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'Czech Republic')	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE Currency = 'Euro'	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, MAX(t.Amount) FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID, c.Segment, c.Currency ORDER BY t.Amount DESC	debit_card_specializing
SELECT T2.Country, T2.GasStationID, T2.Segment, T2.ChainID, T2.Date FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Date ASC	debit_card_specializing
SELECT T2.Currency FROM "transactions_1k" AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-24 16:25:00'	debit_card_specializing
SELECT T2.Segment FROM "transactions_1k" AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-23 21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Currency = 'EUR'	debit_card_specializing
SELECT Segment FROM customers ORDER BY Date ASC	debit_card_specializing
SELECT Country FROM gasstations WHERE Date = '2012-08-24 12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23 21:20:00'	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE Date = '2012-01-01'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Time BETWEEN '8:00' AND '9:00' AND Date = '2012-08-26' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE')	debit_card_specializing
SELECT Currency FROM customers WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = 'June' AND YEAR(Date) = 2013 AND Amount = 214582.17)	debit_card_specializing
SELECT Country FROM gasstations WHERE GasStationID = 667467	debit_card_specializing
SELECT c.Segment, c.Currency, c.CustomerID, t.Date, t.Time, t.Amount, t.Price FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Amount = 548.4 GROUP BY c.Segment, c.Currency, c.CustomerID, t.Date, t.Time, t.Amount, t.Price ORDER BY t.Amount DESC	debit_card_specializing
SELECT COUNT(DISTINCT CustomerID) FROM customers WHERE Currency = 'EUR'	debit_card_specializing
SELECT      (SELECT MAX(Consumption) FROM yearmonth WHERE Date = '2012-08-25') - (SELECT MAX(Consumption) FROM yearmonth WHERE Date = '2013-08-25') ORDER BY Consumption DESC	debit_card_specializing
SELECT GasStationID, MAX(Amount) FROM transactions_1k GROUP BY GasStationID	debit_card_specializing
SELECT Segment, COUNT(*) AS Premium FROM customers WHERE Segment = 'SVK' GROUP BY Segment	debit_card_specializing
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508	debit_card_specializing
SELECT ProductID, Description FROM products ORDER BY Amount DESC LIMIT 5	debit_card_specializing
SELECT c.CustomerID, AVG(p.Price) AS Average_Price FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN products p ON t.ProductID = p.ProductID GROUP BY c.CustomerID ORDER BY AVG(p.Price) DESC	debit_card_specializing
SELECT T2.Country, MAX(T1.Price) FROM products AS T1 JOIN gasstations AS T2 ON T1.ProductID = T2.GasStationID GROUP BY T2.Country	debit_card_specializing
SELECT c.Consumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN products p ON t.ProductID = p.ProductID JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE t.Price > 29.00 AND p.ProductID = 5 AND ym.Date = 'August' AND ym.Year = 2012	debit_card_specializing
