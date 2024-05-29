SELECT MAX(EligibleFreeRate) FROM frpm WHERE County = "Alameda" AND EnrollmentType = "K-12"
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM frpm ORDER BY `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` LIMIT 3
SELECT Zip FROM schools WHERE County = "Fresno" AND StatusType = "Charter"
SELECT T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Enrollment (K-12) = (SELECT MAX(Enrollment (K-12)) FROM frpm)
SELECT Phone FROM schools WHERE Charter = 1 AND OpenDate > '2000-01-01'
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath < 400 AND T2.Virtual = 'F'
SELECT s.School, s.Magnet FROM satscores AS t1 JOIN schools AS s ON t1.cds = s.CDSCode WHERE t1.Enroll12 > 500 AND s.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead > 1500 ORDER BY T1.AvgScrRead DESC LIMIT 1
SELECT T1.School, T1.CDSCode, COUNT(*) AS NumTstTakr FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.CDSCode = (SELECT MAX(CDSCode) FROM frpm) AND T1.rtype = 'K-12' GROUP BY T1.School, T1.CDSCode ORDER BY NumTstTakr DESC
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.Charter = 1
SELECT frpm.CDSCode, frpm.SchoolName, frpm.FRPMCount, AVG(satscores.AvgScrRead) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.SchoolType = 'Elementary' AND satscores.rtype = 'Read' GROUP BY frpm.CDSCode, frpm.SchoolName, frpm.FRPMCount ORDER BY AVG(satscores.AvgScrRead) DESC LIMIT 1;
SELECT cds FROM frpm WHERE Enrollment(K-12) + Enrollment(Ages 5-17) > 500;
SELECT MAX(EligibleFree(Ages5to17)) FROM frpm WHERE ExcellenceRate > 0.3;
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead DESC LIMIT 3;
SELECT cds, enroll12 FROM satscores ORDER BY enroll12 DESC LIMIT 5;
SELECT DISTINCT DistrictName, AVG(CAST(Score AS FLOAT)) AS AverageScore FROM (     SELECT SchoolName, AVG(CAST(Score AS FLOAT)) AS Score     FROM satscores     JOIN schools ON satscores.CDSCode = Schools.CDSCode     WHERE rtype = 'Reading'     GROUP BY SchoolName ) AS Scores WHERE DistrictName IN (     SELECT DistrictName FROM schools     WHERE StatusType = 'Active' ) ORDER BY AverageScore DESC LIMIT 1;
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Alameda' AND T1.NumTstTakr < 100
SELECT cds, CharterNum FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrWrite = 499
SELECT COUNT(*) FROM frpm WHERE County = "Contra Costa" AND enroll12 <= 250
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY AVG(T1.AvgScrMath) DESC LIMIT 1;
SELECT COUNT(*) FROM frpm WHERE `Academic Year` = 2014 AND `County Name` = 'Amador' AND `Low Grade` = 9 AND `High Grade` = 12
SELECT COUNT(*) FROM frpm WHERE County = "Los Angeles" AND Enrollment(K-12) > 500 AND FreeMealCount(K-12) < 700
SELECT cds, COUNT(*) AS NumTstTakr FROM satscores GROUP BY cds ORDER BY NumTstTakr DESC LIMIT 1;
SELECT s.School, s.StreetAbr, s.City, s.Zip, s.State, s.MailStreet, s.MailStrAbr, s.MailCity, s.MailZip, s.MailState, s.Phone, s.Ext, s.Website, s.OpenDate, s.ClosedDate, s.Charter, s.CharterNum, s.FundingType, s.SOC, s.SOCType, s.EdOpsCode, s.EdOpsName, s.EILCode, s.EILName, s.GSoffered, s.GSserved, s.Virtual, s.Magnet, s.Latitude, s.Longitude, s.AdmFName1, s.AdmLName1, s.AdmEmail1, s.AdmFName2, s.AdmLName2, s.AdmEmail2, s.AdmFName3, s.AdmLName3, s.AdmEmail3 FROM frpm AS t1 JOIN schools AS s ON t1.School = s.CDSCode WHERE t1.Enrollment (K-12) - t1.Enrollment (Ages 5-17) > 30;
SELECT T2.School, T2.Percent_Eligible_Free_K_12, T1.AvgScrRead, T1.AvgScrMath, T1.AvgScrWrite, T1.NumGE1500 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 AND T2.Percent_Eligible_Free_K_12 > 0.1
SELECT T2.FundingType FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T1.CDSCode = T3.CDS WHERE T2.County = "Riverside" AND T3.AvgScrMath > 400
SELECT School, Street, City, State FROM schools WHERE County = "Monterey" AND Enrollment(Ages 15-17) > 800
SELECT s.School, AVG(s.AvgScrWrite) AS AvgScore FROM satscores AS s INNER JOIN schools AS s2 ON s.cds = s2.CDSCode WHERE s2.OpenDate > 1991 OR s2.ClosedDate < 2000 GROUP BY s.School
SELECT School, DOCType FROM schools WHERE (Enrollment(K-12) - Enrollment(Ages 5-17)) > (SELECT AVG(Enrollment(K-12) - Enrollment(Ages 5-17)) FROM schools WHERE FundingType = 'Locally Funded')
SELECT OpenDate FROM schools ORDER BY Enroll12 DESC LIMIT 1;
SELECT City, MIN(Enroll12) FROM satscores GROUP BY City ORDER BY Enroll12 LIMIT 5;
SELECT `Free Meal Count (K-12)` / `Enrollment (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10, 11;
SELECT `FRPM Count (K-12)` / `Enrollment (K-12)` FROM frpm WHERE `CDSCode` IN (SELECT `CDSCode` FROM schools WHERE `Ownership Code` = 66 ORDER BY `Free Meal Count (K-12)` DESC LIMIT 5)
SELECT School, Website FROM frpm WHERE FreeMealCount(5, 17) >= 1900 AND FreeMealCount(5, 17) <= 2000
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` FROM frpm WHERE `School Name` = 'Kacey Gibson'
SELECT AdmEmail1 FROM schools WHERE Charter = 1 ORDER BY Enrollment (K-12) LIMIT 1;
SELECT T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr >= 1500 GROUP BY T1.CDSCode ORDER BY T2.AvgScrRead DESC LIMIT 1
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead LIMIT 1;
SELECT T2.Website FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.enroll12 BETWEEN 2000 AND 3000 AND T2.County = "Los Angeles"
SELECT AVG(t1.AvgScrRead + t1.AvgScrMath + t1.AvgScrWrite) FROM satscores AS t1 JOIN schools AS t2 ON t1.cds = t2.CDSCode WHERE t2.City = 'Fresno' AND t2.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T1.CDSCode = T3.CDSCode GROUP BY T2.CDSCode ORDER BY AVG(T3.AvgScrRead) LIMIT 1
SELECT cds, AVG(AvgScrRead) AS AvgRead, AVG(AvgScrMath) AS AvgMath, AVG(AvgScrWrite) AS AvgWrite, COUNT(*) AS NumTstTakr FROM satscores WHERE cds IN (SELECT cds FROM schools WHERE Virtual = 'F' GROUP BY cds ORDER BY AVG(AvgScrRead) DESC LIMIT 5) GROUP BY cds
SELECT T2.EducationalOptionType FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT AVG(AvgScrMath) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode GROUP BY T1.cds ORDER BY AVG(AvgScrMath) LIMIT 1;
SELECT T2.City, AVG(T1.AvgScrWrite) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr >= 1500 GROUP BY T2.City ORDER BY AVG(T1.AvgScrWrite) DESC LIMIT 1
SELECT s.School, AVG(satscores.AvgScrWrite) FROM satscores INNER JOIN schools AS s ON satscores.cds = s.CDSCode WHERE s.AdmFName1 = 'Ricci Ulrich' GROUP BY s.School
SELECT State, COUNT(*) AS enrollment FROM schools WHERE DOC = 31 AND StatusType = 'State Special' GROUP BY State ORDER BY enrollment DESC LIMIT 1;
SELECT COUNT(*) / 12 FROM schools WHERE County = 'Alameda' AND DOC = 52 AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31';
SELECT (SELECT COUNT(*) FROM frpm WHERE County = "Orange" AND DistrictType = "Unified" AND SchoolType = "Elementary") / (SELECT COUNT(*) FROM frpm WHERE County = "Orange" AND DistrictType = "Elementary" AND SchoolType = "Elementary")
SELECT County, COUNT(*) AS ClosedSchools, MAX(ClosedDate) AS ClosureDate FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY ClosedSchools DESC LIMIT 1;
SELECT T2.Street, T2.City, T2.Zip, T2.State, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip, T2.MailState, T2.Phone, T2.Ext, T2.Website, T1.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T1.CDSCode ORDER BY AVG(T1.AvgScrMath) DESC LIMIT 6, 1
