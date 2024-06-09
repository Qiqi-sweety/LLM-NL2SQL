SELECT MAX(`Percent (%) Eligible Free (K-12)`)  FROM frpm  WHERE `County Name` = 'Alameda'	california_schools
SELECT      CDSCode,      `Free Meal Count (Ages 5-17)`,      `Enrollment (Ages 5-17)`,      `Percent (%) Eligible Free (Ages 5-17)`  FROM      frpm  WHERE      `School Type` = 'Continuation Schools'  ORDER BY      `Percent (%) Eligible Free (Ages 5-17)` ASC  LIMIT 3;	california_schools
SELECT T1.Zip FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T2.County = 'Fresno'	california_schools
SELECT T2.MailStreet, T2.MailCity, T2.MailState, T2.MailZip FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.FRPM_Count__K_12__ IS NOT NULL ORDER BY T1.FRPM_Count__K_12__ DESC LIMIT 1	california_schools
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T1.CharterSchoolNumber IS NOT NULL AND T2.OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrMath < 400 AND schools.Virtual = 'F'	california_schools
SELECT s.name FROM schools s JOIN satscores ss ON s.cds = ss.cds WHERE ss.enroll12 > 500 AND s.magnet = 1	california_schools
SELECT T2.Phone  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.AvgScrRead > 1500 AND T1.AvgScrMath > 1500 AND T1.AvgScrWrite > 1500  ORDER BY T1.NumTstTakr DESC  LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores ss  JOIN frpm fp ON ss.cds = fp.CDSCode  WHERE fp.FRPM_Count__K_12___ > (SELECT MAX(frpm.FRPM_Count__K_12__) FROM frpm)	california_schools
SELECT COUNT(*)  FROM satscores  WHERE AvgScrMath > 560  AND FundingType = 'Directly funded'  AND cds IN (     SELECT cds      FROM frpm      WHERE `Charter Funding Type` = 'Directly funded' )	california_schools
SELECT MAX(satscores.AvgScrRead) AS max_reading_score, frpm.FRPM_Count_Ages_5_17 FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)	california_schools
SELECT CDSCode  FROM frpm  WHERE (Enrollment (K-12) + Enrollment (Ages 5-17)) > 500	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) AS Highest_Free_Rate FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead IS NOT NULL AND satscores.AvgScrMath IS NOT NULL AND satscores.AvgScrWrite IS NOT NULL AND satscores.NumGE1500 / satscores.NumTstTakr > 0.3	california_schools
SELECT T2.Phone  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.NumGE1500 / T1.NumTstTakr IN (     SELECT T1.NumGE1500 / T1.NumTstTakr      FROM satscores AS T1      ORDER BY T1.NumGE1500 / T1.NumTstTakr DESC      LIMIT 3 )	california_schools
SELECT T1.CDSCode, T1.NCESSchool  FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (Ages 5-17)` IS NOT NULL ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT T2.District, AVG(T1.AvgScrRead) AS AverageReadingScore FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' GROUP BY T2.District ORDER BY AverageReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Alameda' AND frpm.`FRPM Count (K-12)` < 100	california_schools
SELECT T2.CDSCode FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite = 499	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE `County` = 'Contra Costa' AND `Charter Funding Type` = 'Directly funded' AND `NumTstTakr` <= 250	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm WHERE `Low Grade` = '9' AND `High Grade` = '12' AND `County Name` = 'Amador';	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.City = 'Los Angeles'  AND frpm.FreeMealCount_K_12 > 500  AND frpm.FreeMealCount_K_12 < 700	california_schools
SELECT sname FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE County = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1;	california_schools
SELECT      T1.School AS 'School Name',     T1.Street AS 'Street Address' FROM      schools AS T1 JOIN      frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE      ABS(T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) > 30	california_schools
SELECT T1.School, T1.cds FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`Percent (%) Eligible Free (K-12)` > 0.1 AND T2.AvgScrRead >= 1500 AND T2.AvgScrMath >= 1500 AND T2.AvgScrWrite >= 1500	california_schools
SELECT T2.School, T2.FundingType  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.AvgScrMath > 400 AND T2.County = 'Riverside'	california_schools
SELECT s.name, s.street, s.city, s.zip, s.state FROM schools s JOIN frpm f ON s.cds = f.CDSCode WHERE s.education_level = 'High Schools (Public)' AND f.LowGrade BETWEEN '15' AND '17' AND f.FreeMealCount (Ages 5-17) > 800 AND s.county = 'Monterey'	california_schools
SELECT s.name AS School_Name, AVG(sc.AvgScrWrite) AS Average_Writing_Score, sc.Phone AS Communication_Number FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.OpenDate > '1991-01-01' OR s.ClosedDate < '2000-01-01' GROUP BY s.CDSCode, s.name, sc.Phone	california_schools
SELECT      T1.School,     T1.DOCType FROM      frpm AS T1 JOIN      schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T1.Charter = 0 AND     T2.FundingType = 'Local' AND     ABS(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) >     (         SELECT AVG(ABS(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)         FROM frpm AS T3         WHERE T3.Charter = 0 AND T3.FundingType = 'Local'     ) ORDER BY      ABS(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) DESC;	california_schools
SELECT OpenDate  FROM frpm  WHERE `Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm)	california_schools
SELECT T2.MailCity FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Low Grade` = 'K' AND T1.`High Grade` = '12' ORDER BY T1.Enrollment (K-12) ASC LIMIT 5	california_schools
SELECT CAST(T1.FreeMealCount_12 AS REAL) / T1.Enrollment_12 AS EligibleFreeRate FROM frpm T1 WHERE T1.CDSCode IN (     SELECT T2.CDSCode     FROM frpm T2     ORDER BY T2.Enrollment_12 DESC     LIMIT 1 OFFSET 9 ) ORDER BY T1.Enrollment_12 DESC LIMIT 2;	california_schools
SELECT      T1.CDSCode,      T1.`FRPM Count (K-12)` / T1.`Enrollment (K-12)` AS EligibleRate FROM      frpm AS T1 JOIN      schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T2.FundingType = 'Directly funded' AND      T2.Charter = 66 ORDER BY      T1.`FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT T1.Website, T1.SchoolName FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Enrollment_Ages_5_17 BETWEEN 1900 AND 2000 AND T1.FreeMealCount_Ages_5_17 = 1900 OR T1.FreeMealCount_Ages_5_17 = 2000	california_schools
SELECT CAST(T1.`Free Meal Count (Ages 5-17)` AS REAL) / T1.`Enrollment (Ages 5-17)` AS FreeRate FROM frpm T1 JOIN schools T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson'	california_schools
SELECT AdmEmail1  FROM frpm  WHERE `Charter School (Y/N)` = 1  ORDER BY `Enrollment (K-12)` ASC  LIMIT 1;	california_schools
SELECT T2.AdmFName1, T2.AdmLName1  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.NumGE1500 IS NOT NULL AND T1.NumGE1500 >= 1500  ORDER BY T1.NumTstTakr DESC  LIMIT 1;	california_schools
SELECT T1.Street, T1.City, T1.State, T1.Zip  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrRead IS NOT NULL AND T2.AvgScrMath IS NOT NULL AND T2.AvgScrWrite IS NOT NULL  ORDER BY (T2.NumGE1500 / CAST(T2.NumTstTakr AS REAL)) ASC  LIMIT 1;	california_schools
SELECT T2.Website FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Los Angeles' AND T2.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(NumTstTakr)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'  AND schools.City = 'Fresno';	california_schools
SELECT T2.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Fresno Unified' ORDER BY T2.AvgScrRead ASC LIMIT 1	california_schools
SELECT sname, AVG(AvgScrRead) as avg_reading_score FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.Virtual = 'F' GROUP BY sname ORDER BY avg_reading_score DESC LIMIT 5;	california_schools
SELECT T1.SOCType FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores) AND T1.GSserved IS NOT NULL ORDER BY T1.GSserved DESC LIMIT 1	california_schools
SELECT AVG(S.AvgScrMath), S.County  FROM satscores AS S  JOIN frpm AS F ON S.cds = F.CDSCode  WHERE (S.AvgScrMath + S.AvgScrRead + S.AvgScrWrite) =  (SELECT MIN(totalscore) FROM  (SELECT S.cds, (S.AvgScrMath + S.AvgScrRead + S.AvgScrWrite) AS totalscore  FROM satscores AS S) AS subquery)	california_schools
SELECT AVG(satscores.AvgScrWrite), schools.City FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode WHERE satscores.NumGE1500 IS NOT NULL AND satscores.NumGE1500 >= 1500 GROUP BY satscores.cds ORDER BY COUNT(satscores.cds) DESC LIMIT 1;	california_schools
SELECT s.name AS School_Name, AVG(sc.AvgScrWrite) AS Average_Writing_Score FROM schools s JOIN satscores sc ON s.cds = sc.cds WHERE s.AdmEmail1 LIKE '%Ricci Ulrich%' OR s.AdmEmail2 LIKE '%Ricci Ulrich%' OR s.AdmEmail3 LIKE '%Ricci Ulrich%' GROUP BY s.name ORDER BY Average_Writing_Score DESC;	california_schools
SELECT State  FROM schools  WHERE DOC = '31' AND StatusType = 'Special'  ORDER BY COUNT(CDSCode) DESC  LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS "Monthly Average" FROM schools WHERE County = 'Alameda' AND DOCType = 'Elementary School District' AND DOC = 52 AND STRFTIME('%Y', OpenDate) = '1980';	california_schools
SELECT CAST(SUM(CASE WHEN T1.DOC = '52' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.DOC = '54' THEN 1 ELSE 0 END)  FROM schools T1  JOIN frpm T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.County = 'Orange'	california_schools
SELECT T1.County, T1.ClosedDate  FROM schools AS T1  JOIN (     SELECT County, COUNT(*) AS ClosedSchoolCount      FROM schools      WHERE StatusType = 'Closed'      GROUP BY County      ORDER BY ClosedSchoolCount DESC      LIMIT 1 ) AS T2  ON T1.County = T2.County;	california_schools
SELECT T2.School, T2.Street FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (     SELECT AVG(AvgScrMath)     FROM satscores     ORDER BY AVG(AvgScrMath) DESC     LIMIT 1 OFFSET 5 )	california_schools
SELECT T2.MailStreet, T1.sname FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores)	california_schools
SELECT COUNT(*)  FROM satscores  WHERE AvgScrRead + AvgScrMath + AvgScrWrite >= 1500 AND MailCity = 'Lakeport'	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.MailCity = 'Fresno'	california_schools
SELECT S.CDSCode, S.MailZip FROM schools S JOIN frpm F ON S.CDSCode = F.CDSCode WHERE S.AdmFName1 = 'Avetik' AND S.AdmLName1 = 'Atoian'	california_schools
SELECT CAST(COUNT(CASE WHEN T1.County = 'Colusa' THEN T1.CDSCode END) AS REAL) / COUNT(CASE WHEN T1.County = 'Humboldt' THEN T1.CDSCode END) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.MailState = 'CA'	california_schools
SELECT COUNT(*)  FROM schools  WHERE State = 'CA' AND MailState = 'San Joaquin' AND Active = 'Yes';	california_schools
SELECT T1.Phone, T1.Ext FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrWrite = (SELECT AVG(AvgScrWrite) FROM satscores ORDER BY AvgScrWrite DESC LIMIT 1 OFFSET 332)	california_schools
SELECT S.Phone, S.Ext, S.School FROM schools S WHERE S.Zip = '95203-3704';	california_schools
SELECT T2.Website  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T1.AdmFName1 = 'Mike Larson' OR T1.AdmFName1 = 'Dante Alvarez'	california_schools
SELECT T2.Website FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T1.Virtual = 'P' AND T1.Charter = 1 AND T1.County = 'San Joaquin'	california_schools
SELECT COUNT(*)  FROM schools  WHERE DOC = '52'  AND Charter = 1  AND City = 'Hickman'	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Code` = 'LA' AND `Charter School (Y/N)` = 0 AND `Percent (%) Eligible Free (K-12)` < 0.18	california_schools
SELECT      s.Name AS School_Name,     s.City,     a.AdmFName1 || ' ' || a.AdmLName1 AS Administrator_Name FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode JOIN      (         SELECT              CDSCode,              MAX(CASE WHEN AdmFName1 IS NOT NULL THEN 1 ELSE 0 END) AS AdmFName1,             MAX(CASE WHEN AdmLName1 IS NOT NULL THEN 1 ELSE 0 END) AS AdmLName1,             MAX(CASE WHEN AdmFName2 IS NOT NULL THEN 1 ELSE 0 END) AS AdmFName2,             MAX(CASE WHEN AdmLName2 IS NOT NULL THEN 1 ELSE 0 END) AS AdmLName2,             MAX(CASE WHEN AdmFName3 IS NOT NULL THEN 1 ELSE 0 END) AS AdmFName3,             MAX(CASE WHEN AdmLName3 IS NOT NULL THEN 1 ELSE 0 END) AS AdmLName3         FROM              schools         WHERE              Charter = 1 AND             CharterNum = '00D2'         GROUP BY              CDSCode     ) a ON s.CDSCode = a.CDSCode WHERE      s.Charter = 1 AND     a.AdmFName1 IS NOT NULL OR     a.AdmLName1 IS NOT NULL OR     a.AdmFName2 IS NOT NULL OR     a.AdmLName2 IS NOT NULL OR     a.AdmFName3 IS NOT NULL OR     a.AdmLName3 IS NOT NULL	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.MailCity = 'Hickman' AND frpm.CharterNum = '00D4';	california_schools
SELECT      CAST(SUM(CASE WHEN FundingType = 'Local' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      County = 'Santa Clara';	california_schools
SELECT COUNT(*)  FROM schools  WHERE DOC = 'Stanislaus'  AND FundingType = 'Directly Funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'	california_schools
SELECT COUNT(*)  FROM schools  WHERE StatusType = 'Closure'  AND OpenDate < '1989-01-01'  AND City = 'San Francisco'  AND Virtual = 'No'  AND SOCType LIKE '%Community College%'	california_schools
SELECT County  FROM schools  WHERE YEAR(ClosedDate) BETWEEN 1980 AND 1989  AND SOC = '11'  GROUP BY County  ORDER BY COUNT(*) DESC  LIMIT 1;	california_schools
SELECT T1.NCESDist  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T2.EducationalOptionType = 'State Special Schools' AND T1.SOC = '31'	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine' AND        (StatusType = 'Active' OR StatusType = 'Closed') AND        Virtual = 'District Community Day'	california_schools
SELECT `District Code` FROM schools WHERE `City` = 'Fresno' AND Magnet = 0;	california_schools
SELECT      SUM(`Enrollment (Ages 5-17)`)  FROM      frpm  WHERE      `Academic Year` = '2014-2015'      AND `School Name` = 'State Special School'      AND `City` = 'Fremont'      AND EdOpsCode = 'SSS';	california_schools
SELECT `FRPM Count (Ages 5-17)` FROM frpm WHERE `Mailing Street` = 'PO Box 1040' AND `Educational Option Type` = 'Youth Authority School';	california_schools
SELECT `Low Grade` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.NCESDist = '613360' AND schools.EdOpsCode = 'SPECON';	california_schools
SELECT `School Name`, `Educational Option Type` FROM frpm WHERE `Educational Option Type` = 'Breakfast Provision 2' AND `County Code` = '37';	california_schools
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.LowGrade = '9' AND T1.HighGrade = '12' AND T2.County = 'Merced' AND T1.EducationalOptionType = 'Lunch Provision 2' AND T1.SchoolType LIKE '%High Schools%'	california_schools
SELECT T1.School, T1.Percent_eligible_frpm__ages_5_17 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.LowGrade LIKE 'K%' AND T1.HighGrade LIKE '9%'	california_schools
SELECT      COUNT(*) AS frequency,      `Grade Span`  FROM      schools  WHERE      `City` = 'Adelanto'  GROUP BY      `Grade Span`  ORDER BY      frequency DESC  LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools  WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F'	california_schools
SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1;	california_schools
SELECT `School`, `Low Grade` FROM schools WHERE State = 'CA' ORDER BY Latitude ASC LIMIT 1;	california_schools
SELECT `Grade Span` FROM frpm WHERE Longitude = (SELECT MAX(Longitude) FROM frpm);	california_schools
SELECT COUNT(DISTINCT T1.City), T1.City FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.LowGrade LIKE 'K%' AND T2.HighGrade LIKE '8%' AND T1.Magnet = 1 GROUP BY T1.City	california_schools
SELECT T1.AdmFName1 AS AdministratorFirstName, T1.District, COUNT(*) AS AdministratorCount FROM schools AS T1 JOIN (     SELECT AdmFName1, COUNT(AdmFName1) AS NameCount     FROM schools     GROUP BY AdmFName1     ORDER BY NameCount DESC     LIMIT 2 ) AS T2 ON T1.AdmFName1 = T2.AdmFName1 GROUP BY T1.District, T1.AdmFName1 ORDER BY AdministratorCount DESC;	california_schools
SELECT T1.`District Code` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine' OR T2.AdmFName2 = 'Alusine' OR T2.AdmFName3 = 'Alusine' AND T1.`Percent (%) Eligible Free (K-12)` IS NOT NULL	california_schools
SELECT T2.AdmLName3, T2.District, T2.County, T2.SchoolName FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterNumber = '40' ORDER BY T2.LastUpdate DESC LIMIT 1;	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3  FROM schools  WHERE County = 'San Bernardino'  AND District = 'San Bernardino City Unified'  AND (OpenDate BETWEEN '2009-01-01' AND '2010-12-31')  AND (SOC = '62' OR DOC = '54')	california_schools
SELECT T2.AdmEmail1, T2.AdmEmail2, T2.AdmEmail3 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T2.CDSCode = T3.cds WHERE T3.NumGE1500 IS NOT NULL AND T3.AvgScrRead >= 1500 AND T3.AvgScrMath >= 1500 AND T3.AvgScrWrite >= 1500 ORDER BY T3.NumTstTakr DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  JOIN district ON client.district_id = district.district_id  WHERE district.A3 LIKE '%Východní Čechy%' AND account.frequency = 'POPLATEK PO OBRATU'	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague' AND account_id IN (     SELECT account_id FROM loan )	financial
SELECT      CASE          WHEN A12 > A13 THEN '1995'         ELSE '1996'     END AS year_with_higher_unemployment_rate FROM      district WHERE      A12 IS NOT NULL AND A13 IS NOT NULL;	financial
SELECT COUNT(DISTINCT A.district_id)  FROM district AS D  JOIN client AS C ON D.district_id = C.district_id  WHERE C.gender = 'F' AND D.A11 BETWEEN 6000 AND 10000;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000	financial
SELECT MIN(account_id), MAX(account_id) - MIN(account_id) FROM (     SELECT T1.account_id, AVG(T3.A11) AS avg_salary     FROM account AS T1     JOIN client AS T2 ON T1.client_id = T2.client_id     JOIN district AS T3 ON T2.district_id = T3.district_id     WHERE T2.gender = 'F'     GROUP BY T1.account_id     ORDER BY MAX(T3.A11) DESC, MIN(T3.A11) ASC     LIMIT 1 ) AS subquery	financial
SELECT T1.account_id FROM client AS T1 JOIN (     SELECT client_id, AVG(A11) AS avg_salary     FROM client     GROUP BY client_id ) AS T2 ON T1.client_id = T2.client_id WHERE T1.birth_date IN (     SELECT MIN(birth_date)     FROM client ) AND T2.avg_salary = (     SELECT MAX(avg_salary)     FROM (         SELECT AVG(A11) AS avg_salary         FROM client         WHERE client_id IN (             SELECT client_id             FROM client             ORDER BY birth_date             LIMIT 1         )     ) )	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND client.gender = 'Owner';	financial
SELECT DISTINCT c.client_id  FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.date BETWEEN '1997-01-01' AND '1997-12-31'  AND l.status = 'approved'  ORDER BY l.amount ASC, a.frequency = 'POPLATEK TYDNE' DESC  LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND a.date LIKE '1993-%' ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.A2 = 'Slokolov';	financial
SELECT account_id FROM trans WHERE date LIKE '1995-%' ORDER BY date ASC LIMIT 1;	financial
SELECT account.account_id FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.amount > 3000 AND account.date < '1997-01-01'	financial
SELECT client_id FROM card WHERE issued LIKE '1994-03-03'	financial
SELECT T2.date FROM trans AS T2 JOIN account AS T1 ON T2.account_id = T1.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'	financial
SELECT T1.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25'	financial
SELECT MAX(amount) AS biggest_transaction_amount FROM trans JOIN card ON trans.account_id = card.disp_id WHERE card.issued BETWEEN '1996-10-21' AND '1996-10-21';	financial
SELECT c.gender  FROM client c JOIN (     SELECT d.district_id, AVG(d.A11) AS avg_salary     FROM district d     GROUP BY d.district_id     ORDER BY avg_salary DESC     LIMIT 1 ) AS high_avg_salary ON c.district_id = high_avg_salary.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)      FROM client      WHERE district_id = high_avg_salary.district_id )	financial
SELECT MIN(t.amount)  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.amount = (SELECT MAX(amount) FROM loan)  AND a.date = (SELECT MIN(date) FROM account WHERE account_id IN (SELECT account_id FROM loan))	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Jesenik' AND client.gender = 'F'	financial
SELECT T3.disp_id FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T2.account_id = T3.account_id WHERE T2.amount = 5100 AND T2.date = '1998-09-02'	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice' AND date LIKE '1996-%'	financial
SELECT T3.A2 FROM client AS T1  JOIN disp AS T2 ON T1.client_id = T2.client_id  JOIN district AS T3 ON T2.account_id = T3.account_id  WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03'	financial
SELECT t1.account_id  FROM account AS t1 JOIN district AS t2 ON t1.district_id = t2.district_id WHERE t2.A3 = 'Prague' ORDER BY t1.date ASC LIMIT 1	financial
SELECT      100 * COUNT(CASE WHEN client.gender = 'M' THEN client.client_id END) / COUNT(client.client_id) AS male_percentage FROM      client JOIN      district ON client.district_id = district.district_id WHERE      district.A3 = 'South Bohemia'	financial
SELECT      ((t.balance - (SELECT t.balance FROM trans WHERE account_id = l.account_id AND date < '1993-07-05' ORDER BY date DESC LIMIT 1)) /      (SELECT t.balance FROM trans WHERE account_id = l.account_id AND date = '1993-07-05')) * 100 AS increase_rate FROM      loan l JOIN      account a ON l.account_id = a.account_id JOIN      trans t ON a.account_id = t.account_id WHERE      l.date >= '1993-07-05'     AND l.date <= '1998-12-27' ORDER BY      l.date LIMIT 1;	financial
SELECT      CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount)  FROM      loan;	financial
SELECT      COUNT(*) FILTER (WHERE payments < 100000 AND status = 'C') * 100.0 / COUNT(*) AS percentage_running_accounts FROM      loan	financial
SELECT      A1,      A2,      A3  FROM      account AS acc  JOIN      district AS dis ON acc.district_id = dis.district_id  JOIN      trans AS trn ON acc.account_id = trn.account_id  WHERE      acc.date LIKE '1993%' AND      trn.type = 'POPLATEK PO OBRATU'	financial
SELECT a.account_id, a.frequency  FROM account a  JOIN client c ON a.district_id = c.district_id  JOIN district d ON c.district_id = d.district_id  WHERE d.A4 = 'east Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT T1.account_id, T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'	financial
SELECT T1.A2, T1.A3 FROM district AS T1 JOIN loan AS T2 ON T1.district_id = T2.account_id WHERE T2.loan_id = 4990;	financial
SELECT T1.account_id, T2.A2, T3.A3  FROM account AS T1  JOIN loan AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T3.district_id = T1.district_id  WHERE T2.amount > 300000 AND T2.status = 'PAID'	financial
SELECT      loan.loan_id,      district.A3,      AVG(district.A11) AS average_salary FROM      loan JOIN      disp ON loan.account_id = disp.account_id JOIN      client ON disp.client_id = client.client_id JOIN      district ON client.district_id = district.district_id WHERE      loan.duration = 60 GROUP BY      loan.loan_id, district.A3;	financial
SELECT D.A1, (D.A13 - D.A12) / D.A12 * 100 AS unemployment_increment_rate FROM district D JOIN client C ON D.district_id = C.district_id JOIN loan L ON C.client_id = L.account_id WHERE L.status = 'D' AND L.date BETWEEN '1995-01-01' AND '1996-12-31';	financial
SELECT      CAST(SUM(CASE WHEN T3.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id)  FROM      account AS T1  JOIN      district AS T3 ON T1.district_id = T3.district_id  WHERE      T1.date = '1993-02-26'	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT T1.A2, COUNT(*) AS FemaleAccountHolders FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.A2 ORDER BY FemaleAccountHolders DESC LIMIT 10	financial
SELECT D.A2, SUM(T.amount) AS TotalWithdrawals FROM trans T JOIN account A ON T.account_id = A.account_id JOIN disp D ON A.account_id = D.account_id WHERE T.type = 'VYDAJ' AND T.date LIKE '1996-01%' GROUP BY D.A2 ORDER BY TotalWithdrawals DESC LIMIT 10;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A3 = 'South Bohemia' AND client.card_id IS NULL	financial
SELECT T3.A3  FROM (     SELECT T2.district_id, COUNT(*) AS active_loans_count      FROM loan AS T1      JOIN client AS T2 ON T1.account_id = T2.client_id      WHERE T1.status = 'C'      GROUP BY T2.district_id ) AS T3  JOIN district AS T4 ON T3.district_id = T4.district_id  ORDER BY T3.active_loans_count DESC  LIMIT 1;	financial
SELECT AVG(amount)  FROM loan  JOIN client ON loan.account_id = client.client_id  WHERE client.gender = 'M'	financial
SELECT D.A2 AS "Branch Location", D.A4 AS "District Name" FROM district D WHERE D.A13 = (SELECT MAX(A13) FROM district WHERE strftime('%Y', date) = '1996')	financial
SELECT COUNT(*)  FROM (     SELECT account_id, district_id      FROM (         SELECT district_id, SUM(A16) as totalCrimes          FROM district          WHERE strftime('%Y', date) = '1996'          GROUP BY district_id          ORDER BY totalCrimes DESC          LIMIT 1     ) AS maxCrimesByDistrict      JOIN disp ON disp.district_id = maxCrimesByDistrict.district_id ) AS accountsInMaxCrimesBranch;	financial
SELECT t1.account_id  FROM trans AS t1  JOIN account AS t2 ON t1.account_id = t2.account_id  WHERE t1.type = 'VYBER KARTOU' AND t2.frequency = 'POPLATEK MESICNE' AND t1.balance < 0	financial
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE date BETWEEN '1995-01-01' AND '1997-12-31'  AND amount >= 250000  AND frequency = 'POPLATEK MESICNE'  AND status = 'approved'	financial
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = '1' AND account.status = 'C'	financial
SELECT COUNT(*)  FROM client  WHERE client_id IN (     SELECT client_id FROM disp WHERE account_id IN (         SELECT account_id FROM account WHERE district_id = (             SELECT district_id FROM (                 SELECT district_id, COUNT(*) AS crime_count                  FROM disp                  JOIN account ON disp.account_id = account.account_id                  WHERE YEAR(account.date) = 1995                  GROUP BY district_id                  ORDER BY crime_count DESC                  LIMIT 1, 1 -- Get the branch with the second-highest number of crimes             ) t1         )     ) AND gender = 'M' );	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE type = 'disponent' AND card.type = 'gold';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Pisek'	financial
SELECT T3.A3  FROM trans AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.amount > 10000 AND T1.date LIKE '1997-%'  GROUP BY T3.A3	financial
SELECT T1.account_id FROM `order` AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.bank_to = 'Pisek' AND T1.k_symbol = 'SIPO'	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold' INTERSECT SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'junior'	financial
SELECT AVG(amount)  FROM (     SELECT `order`.amount      FROM `order`      JOIN account ON `order`.account_id = account.account_id      WHERE `order`.type = 'VYBER KARTOU' AND YEAR(`order`.date) = 2021 ) AS credit_card_orders	financial
SELECT T1.account_id  FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'VYBER KARTOU' AND YEAR(T2.date) = 1998 AND ABS(T2.amount) / EXTRACT(MONTH FROM (T2.date - (SELECT MIN(date) FROM trans WHERE account_id = T1.account_id))) < (SELECT AVG(ABS(amount)) / EXTRACT(MONTH FROM MAX(date) - MIN(date)) FROM trans WHERE type = 'VYBER KARTOU')	financial
SELECT c.client_id, c.gender  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN card ca ON d.client_id = ca.disp_id  JOIN account la ON c.client_id = la.account_id  JOIN loan l ON la.account_id = l.account_id  WHERE c.gender = 'F' AND ca.type = 'credit' AND l.status = 'active';	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A3 = 'south Bohemia'	financial
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Tabor' AND account.frequency = 'POPLATEK MESICNE' AND EXISTS (     SELECT 1     FROM loan     WHERE loan.account_id = account.account_id     AND loan.status = 'eligible' );	financial
SELECT DISTINCT T1.type  FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id JOIN district AS T4 ON T3.district_id = T4.district_id JOIN (     SELECT A11, A4      FROM district      WHERE A11 BETWEEN 8000 AND 9000 ) AS T5 ON T4.A4 = T5.A4 WHERE T1.type <> 'OWNER'	financial
SELECT COUNT(*)  FROM account a  JOIN client c ON a.account_id = c.client_id  JOIN district d ON c.district_id = d.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE d.A3 LIKE 'North Bohemia' AND t.bank LIKE 'AB'	financial
SELECT DISTINCT T1.A2  FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'	financial
SELECT AVG(A15)  FROM district  WHERE A15 > 4000 AND EXISTS (     SELECT 1      FROM account      WHERE account.district_id = district.district_id      AND date >= '1997-01-01' )	financial
SELECT COUNT(*)  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  JOIN account a ON d.account_id = a.account_id  JOIN loan l ON a.account_id = l.account_id  WHERE c.type = 'classic' AND a.frequency = 'OWNER'	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT      CAST(SUM(CASE WHEN T2.type = 'Gold' AND T3.issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.type)  FROM      card AS T2  JOIN      disp AS T3 ON T2.disp_id = T3.disp_id;	financial
SELECT c.client_id, c.gender, c.birth_date, MAX(l.amount) AS largest_loan_amount FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id GROUP BY c.client_id ORDER BY largest_loan_amount DESC LIMIT 1;	financial
SELECT A15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532)	financial
SELECT T1.district_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333;	financial
SELECT trans_id, account_id, date, amount, balance, k_symbol  FROM trans  WHERE account_id = 3356 AND operation = 'VYBER';	financial
SELECT COUNT(*)  FROM account  JOIN loan ON account.account_id = loan.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000	financial
SELECT T3.type FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.card_id WHERE T1.client_id = 13539;	financial
SELECT T1.A3 FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541;	financial
SELECT T1.A15 AS district_with_most_loans_finished_properly FROM district AS T1 JOIN (     SELECT account_id, COUNT(*) AS loan_count     FROM loan     WHERE status = 'A'     GROUP BY account_id ) AS T2 ON T1.district_id = T2.account_id JOIN account ON account.district_id = T1.district_id WHERE T2.loan_count = (     SELECT MAX(loan_count)     FROM (         SELECT COUNT(*) AS loan_count         FROM loan         WHERE status = 'A'         GROUP BY account_id     ) ) ORDER BY T1.A15 DESC LIMIT 1;	financial
SELECT t.`order_id`, t.account_id FROM `order` t WHERE t.order_id = 32423;	financial
SELECT t.trans_id, a.account_id, t.date, t.type, t.operation, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.district_id = 5;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'J' AND district.A3 = 'ES' AND district.A4 = 'NIK';	financial
SELECT DISTINCT T3.client_id  FROM card AS T1  JOIN disp AS T2 ON T1.disp_id = T2.disp_id  JOIN client AS T3 ON T2.client_id = T3.client_id  WHERE T1.type = 'junior' AND T1.issued >= '1997-01-01'	financial
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.client_id)  FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id JOIN      district dsc ON c.district_id = dsc.district_id WHERE      dsc.A11 > 10000	financial
SELECT      ((SUM(amount WHERE strftime('%Y', date) = '1997') - SUM(amount WHERE strftime('%Y', date) = '1996')) / SUM(amount WHERE strftime('%Y', date) = '1996')) * 100 AS growth_rate FROM      client JOIN      disp ON client.client_id = disp.client_id JOIN      account ON disp.account_id = account.account_id JOIN      loan ON account.account_id = loan.account_id WHERE      client.gender = 'M';	financial
SELECT COUNT(*)  FROM trans  JOIN account ON trans.account_id = account.account_id  WHERE trans.date > '1995-01-01' AND trans.type = 'VYBER KARTOU'	financial
SELECT (SELECT A16 FROM district WHERE A3 = 'North Bohemia') - (SELECT A16 FROM district WHERE A3 = 'East Bohemia') AS DifferenceInCrimes;	financial
SELECT COUNT(*)  FROM `order`  WHERE account_id = 1 AND account_to = 10 AND type = 'disponent' UNION  SELECT COUNT(*)  FROM `order`  WHERE account_id = 1 AND account_to = 10 AND type = 'owner';	financial
SELECT t.type, SUM(t.amount) AS total_debit  FROM trans AS t  JOIN account AS a ON t.account_id = a.account_id  WHERE a.account_id = 3 AND t.amount < 0  GROUP BY t.type  HAVING t.amount = -3539;	financial
SELECT T2.birth_date FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T1.account_id = 130 LIMIT 1;	financial
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  WHERE account.frequency = 'POPLATEK PO OBRATU'	financial
SELECT SUM(amount), status  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE client_id = 992;	financial
SELECT SUM(amount),         CASE WHEN c.gender = 'M' THEN 'Man' ELSE 'Woman' END  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN client c ON a.client_id = c.client_id  WHERE t.trans_id = 851 AND a.client_id = 4	financial
SELECT T2.type FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.disp_id WHERE T1.client_id = 9;	financial
SELECT SUM(amount) AS total_payment  FROM trans  JOIN account ON trans.account_id = account.account_id  WHERE account.client_id = 617 AND YEAR(trans.date) = 1998	financial
SELECT c.client_id  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31'  AND d.A4 = 'East Bohemia'	financial
SELECT client_id FROM client WHERE gender = 'F' ORDER BY MAX(amount) DESC LIMIT 3	financial
SELECT COUNT(*)  FROM client  JOIN account ON client.client_id = account.account_id  JOIN loan ON account.account_id = loan.account_id  WHERE client.gender = 'M'  AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND loan.amount > 4000;	financial
SELECT COUNT(*)  FROM account  JOIN client ON account.account_id = client.client_id  JOIN district ON client.district_id = district.district_id  WHERE district.A3 = 'Beroun' AND date > '1996-12-31'	financial
SELECT COUNT(*)  FROM client  JOIN card ON client.client_id = card.client_id  WHERE client.gender = 'F' AND card.type = 'JUNIOR';	financial
SELECT      CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.account_id)  FROM      account AS T1  JOIN      disp AS T2 ON T1.account_id = T2.account_id  JOIN      client AS T3 ON T2.client_id = T3.client_id  JOIN      district AS T4 ON T1.district_id = T4.district_id  WHERE      T4.A3 = 'Prague';	financial
SELECT      (COUNT(CASE WHEN T.client.gender = 'M' AND T.account.frequency = 'POPLATEK TYDNE' THEN 1 END)      / NULLIF(SUM(CASE WHEN T.account.frequency = 'POPLATEK TYDNE' THEN 1 ELSE 0 END), 0)) * 100 AS percentage_male_clients FROM      client AS C JOIN      disp AS D ON C.client_id = D.client_id JOIN      account AS A ON D.account_id = A.account_id WHERE      A.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  WHERE account.frequency = 'POPLATEK TYDNE';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T2.gender = 'F' ORDER BY T2.birth_date ASC, T1.A11 ASC LIMIT 1	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.birth_date LIKE '1920%' AND district.A3 = 'East Bohemia'	financial
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE loan.duration = 24 AND account.frequency = 'POPLATEK TYDNE'	financial
SELECT AVG(amount) AS avg_loan_amount FROM (     SELECT amount FROM loan     WHERE status IN ('C', 'D') AND k_symbol = 'POPLATEK PO OBRATU' ) AS filtered_loans;	financial
SELECT DISTINCT c.client_id, d.A1 FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.client_id IN (     SELECT DISTINCT t.account_id FROM trans t      WHERE t.type = 'PERMANENT ORDER' OR t.type = 'LOAN' ) AND c.client_id NOT IN (     SELECT DISTINCT a.account_id FROM account a      EXCEPT      SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id )	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN card ca ON c.client_id = ca.client_id WHERE ca.type = 'gold' AND EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = ca.account_id     AND l.status = 'eligible' )	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT COUNT(*)  FROM `atom` a JOIN `molecule` m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl'	toxicology
SELECT AVG(CASE WHEN T3.element = 'O' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T3.molecule_id = T2.molecule_id AND T3.atom_id = T2.bond_id WHERE T2.bond_type = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T3.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id AND EXISTS (     SELECT 1 FROM connected AS T4 WHERE T4.bond_id = T3.bond_id AND T1.atom_id IN (T4.atom_id, T4.atom_id2) ) WHERE T2.label = '+' AND T3.bond_type = '-'	toxicology
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond b ON c.bond_id = b.bond_id  WHERE m.label = '-'' AND a.element = 'na'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+'	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'c' AND bond.bond_type = ' =' THEN 1 ELSE 0 END) * 100.0 / COUNT(atom.atom_id)) AS percentage FROM      atom JOIN      connected ON atom.atom_id = connected.atom_id JOIN      bond ON connected.bond_id = bond.bond_id	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+';	toxicology
SELECT molecule_id FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'si');	toxicology
SELECT T3.element  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id  WHERE T1.bond_id = 'TR004_8_9'	toxicology
SELECT T3.element FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T3.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '==')) WHERE T2.label IS NOT NULL;	toxicology
SELECT MAX(COUNT(CASE WHEN atom.element = 'h' THEN molecule.label END)) FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE atom.element = 'h'	toxicology
SELECT T3.bond_type FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id AND T1.element = 'Te' WHERE T2.label IS NOT NULL AND T1.element = 'Te' AND T3.atom_id2 != T1.atom_id;	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-';	toxicology
SELECT A.atom_id, B.atom_id FROM connected C JOIN atom A ON C.atom_id = A.atom_id JOIN atom B ON C.atom_id2 = B.atom_id JOIN molecule M ON A.molecule_id = M.molecule_id WHERE M.label = '-';	toxicology
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '-'  GROUP BY element  ORDER BY COUNT(*) ASC  LIMIT 1;	toxicology
SELECT T3.bond_type FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T3.bond_id = T1.bond_id WHERE (T2.atom_id = 'TR004_8' AND T3.bond_id = T1.bond_id) OR (T2.atom_id = 'TR004_20' AND T3.bond_id = T1.bond_id)	toxicology
SELECT DISTINCT T3.label  FROM atom AS T1  JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id  JOIN bond AS T2 ON T1.atom_id = T2.molecule_id  WHERE T1.element != 'sn' AND T3.label IS NOT NULL  AND (T3.label = '+' OR T3.label = '-')	toxicology
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN bond b ON a.atom_id = ANY(b.atom_id) AND a.molecule_id = ANY(b.molecule_id)  JOIN connected c ON a.atom_id IN (SELECT atom_id FROM c WHERE bond_id IN (SELECT bond_id FROM b WHERE bond_type = '-'))  WHERE m.label IS NOT NULL  AND (a.element = 'i' OR a.element = 's')  AND b.bond_type = '-'	toxicology
SELECT T3.atom_id, T3.atom_id2 FROM connected AS T1 JOIN atom AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T3.molecule_id = T2.bond_id WHERE T3.molecule_id = 'TR181' UNION SELECT T1.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id2 = T2.atom_id2 JOIN molecule AS T3 ON T3.molecule_id = T2.bond_id WHERE T3.molecule_id = 'TR181'	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'f' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT molecule.molecule_id)) AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT      (SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) / COUNT(T1.bond_id)) * 100 AS percentage FROM      bond AS T1 JOIN      molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN      atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE      T2.label = '+' AND T1.bond_type = '#'	toxicology
SELECT T1.element  FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR000' ORDER BY T1.element ASC LIMIT 3	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR001' AND T2.bond_id = 'TR001_2_6'	toxicology
SELECT      (SUM(CASE WHEN `molecule`.label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN `molecule`.label = '-' THEN 1 ELSE 0 END)) AS difference FROM      `molecule`	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR_000_2_5' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR_000_2_5'	toxicology
SELECT T3.bond_id FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T3.bond_id = T1.bond_id WHERE T2.atom_id2 = 'TR000_2' AND T2.atom_id = 'TR000_2';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' ORDER BY T1.molecule_id LIMIT 5	toxicology
SELECT      (SUM(CASE WHEN `bond_type` = ' = ' THEN 1 ELSE 0 END) * 100.0 / COUNT(`bond_id`)) AS percentage_double_bonds FROM      `bond` JOIN      `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE      `molecule.molecule_id` = 'TR008';	toxicology
SELECT      (SUM(CASE WHEN `molecule`.`label` = '+' THEN 1 ELSE 0 END) * 100 / COUNT(`molecule`.`molecule_id`)) AS percent FROM      `molecule`;	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) / COUNT(atom.atom_id)) * 100 AS hydrogen_percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.molecule_id = 'TR206'	toxicology
SELECT T3.bond_type  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T1.bond_id = T3.bond_id  WHERE T2.molecule_id = 'TR000' OR T2.atom_id = 'TR000'	toxicology
SELECT T3.element, T2.label  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T1.atom_id = T3.atom_id AND T1.molecule_id = T3.molecule_id  WHERE T2.molecule_id = 'TR060'	toxicology
SELECT      T3.bond_type,      COUNT(T3.bond_type) AS bond_count FROM      connected AS T1 JOIN      atom AS T2 ON T1.atom_id = T2.atom_id JOIN      bond AS T3 ON T1.bond_id = T3.bond_id JOIN      molecule AS T4 ON T2.molecule_id = T4.molecule_id WHERE      T4.molecule_id = 'TR018' GROUP BY      T3.bond_type ORDER BY      bond_count DESC LIMIT 1;  SELECT      T4.label FROM      molecule AS T4 WHERE      T4.molecule_id = 'TR018';	toxicology
SELECT m.molecule_id  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' ORDER BY m.molecule_id LIMIT 3	toxicology
SELECT T3.bond_id  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T1.bond_id = T3.bond_id  WHERE T2.molecule_id = 'TR006'  ORDER BY T3.bond_type  LIMIT 2;	toxicology
SELECT COUNT(*)  FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) WHERE b.molecule_id LIKE 'TR009_%' AND (a.atom_id = 'TR009_12' OR a.atom_id2 = 'TR009_12')	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT T3.bond_type, T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_6_9' UNION SELECT T3.bond_type, T2.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_6_9'	toxicology
SELECT T1.label, T3.carcinogenic FROM `molecule` AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T2.atom_id = T3.atom_id  WHERE T2.atom_id = 'TR001_10' AND T3.carcinogenic IS NOT NULL;	toxicology
SELECT COUNT(*) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#'	toxicology
SELECT COUNT(*)  FROM connected  WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19';	toxicology
SELECT T1.element  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.molecule_id = 'TR004'  ORDER BY T1.element;	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-'	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id IN (SELECT atom_id FROM atom WHERE SUBSTRING(atom_id, 7, 2) BETWEEN '21' AND '25') WHERE EXISTS (     SELECT 1 FROM atom b     JOIN connected c2 ON b.atom_id = c2.atom_id2     WHERE b.atom_id IN (SELECT atom_id FROM atom WHERE SUBSTRING(atom_id, 7, 2) BETWEEN '21' AND '25')       AND c2.bond_id = c.bond_id       AND EXISTS (           SELECT 1 FROM bond bd           WHERE bd.bond_id = c.bond_id             AND bd.molecule_id = m.molecule_id             AND (SELECT label FROM molecule WHERE molecule_id = bd.molecule_id) = '+'       ) )	toxicology
SELECT T3.bond_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T3.molecule_id = T2.molecule_id WHERE T1.element = 'p' OR T1.element = 'n'	toxicology
SELECT m.label  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '= =' GROUP BY m.molecule_id ORDER BY COUNT(*) DESC LIMIT 1 AND m.label = '+';	toxicology
SELECT AVG(T3.bond_id_count) AS avg_bonds FROM (     SELECT COUNT(T1.atom_id) AS bond_id_count     FROM `atom` AS T1     JOIN `bond` AS T2 ON T1.atom_id = T2.atom_id     WHERE T1.element = 'i'     GROUP BY T2.bond_id ) AS T3	toxicology
SELECT T3.bond_type, T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.atom_id LIKE 'TR%_45'	toxicology
SELECT element  FROM atom  WHERE atom_id NOT IN (SELECT atom_id FROM connected) AND atom_id NOT IN (SELECT atom_id2 FROM connected)	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id IN (SELECT T3.bond_id FROM bond AS T3 WHERE T3.bond_type = '#') AND T1.molecule_id = 'TR447'	toxicology
SELECT T3.element  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id  WHERE T3.molecule_id = 'TR144_8_19'	toxicology
SELECT T1.molecule_id  FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.bond_type = ' = ' AND T1.label = '+'  GROUP BY T1.molecule_id  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T3.element = 'pb'	toxicology
SELECT atom.element  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN connected ON atom.atom_id = connected.atom_id2  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_type = '#'  AND (atom.element = 'cl' OR atom.element = 'c' OR atom.element = 'h' OR atom.element = 'o' OR atom.element = 's' OR atom.element = 'n' OR atom.element = 'p' OR atom.element = 'na' OR atom.element = 'br' OR atom.element = 'f' OR atom.element = 'i' OR atom.element = 'sn' OR atom.element = 'pb' OR atom.element = 'te' OR atom.element = 'ca') GROUP BY atom.element  HAVING COUNT(*) >= 3	toxicology
SELECT      CAST(SUM(CASE          WHEN bond_id IN (             SELECT bond_id              FROM connected              GROUP BY bond_id              HAVING COUNT(DISTINCT atom_id) = (                 SELECT COUNT(DISTINCT atom_id)                  FROM connected                  GROUP BY atom_id                  ORDER BY COUNT(atom_id) DESC                  LIMIT 1             )         ) THEN 1          ELSE 0      END) AS REAL) * 100 / COUNT(DISTINCT atom_id) FROM atom;	toxicology
SELECT      CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM      bond AS T2 JOIN      connected AS T1 ON T2.bond_id = T1.bond_id JOIN      atom AS T0 ON T0.atom_id = T1.atom_id JOIN      molecule AS T3 ON T3.molecule_id = T0.molecule_id WHERE      T2.bond_type = '-' AND T3.label = '+';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h')	toxicology
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 's'	toxicology
SELECT T3.bond_type FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 'sn' AND (T3.bond_type = ' = ' OR T3.bond_type = '- ' OR T3.bond_type = '# ')	toxicology
SELECT COUNT(DISTINCT atom.element) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-'	toxicology
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN bond b ON a.atom_id = ANY(SELECT atom_id FROM connected c WHERE c.bond_id IN (SELECT b.bond_id FROM bond b WHERE b.bond_type = '#'))  WHERE m.label IS NOT NULL  AND (a.element = 'p' OR a.element = 'br')	toxicology
SELECT T3.bond_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id WHERE T1.label = '+'	toxicology
SELECT `molecule.molecule_id` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `bond.bond_type` = '-' AND `molecule.label` = '-';	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(connected.atom_id)) FROM      connected JOIN      atom ON connected.atom_id = atom.atom_id JOIN      bond ON connected.bond_id = bond.bond_id WHERE      bond.bond_type = '-';	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT `molecule_id` FROM `molecule` WHERE `label` = '-'	toxicology
SELECT COUNT(*)  FROM molecule  JOIN atom ON molecule.molecule_id = atom.molecule_id  JOIN connected ON atom.atom_id IN (SELECT atom_id FROM connected)  WHERE molecule.molecule_id BETWEEN 'TR000' AND 'TR030'  AND atom.element = 'c'  AND EXISTS (SELECT * FROM atom WHERE atom.molecule_id = molecule.molecule_id AND atom.element = 'cl' AND EXISTS (SELECT * FROM connected WHERE connected.atom_id = atom.atom_id))  AND EXISTS (SELECT * FROM atom WHERE atom.molecule_id = molecule.molecule_id AND atom.element = 'h')  AND (molecule.label = '+' OR (SELECT label FROM molecule WHERE molecule.molecule_id = atom.molecule_id LIMIT 1) = '+')	toxicology
SELECT T3.bond_type  FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.bond_id = T3.bond_id  WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_id = 'TR001_10_11' AND T1.atom_id <> (SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_10_11') UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_id = 'TR001_10_11' AND T1.atom_id <> (SELECT atom_id FROM connected WHERE bond_id = 'TR001_10_11')	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'i';	toxicology
SELECT      m.label FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id JOIN      atom b ON a.atom_id IN (SELECT atom_id FROM atom WHERE element = 'Ca') GROUP BY      m.molecule_id HAVING      COUNT(DISTINCT CASE WHEN b.element = 'Ca' THEN a.atom_id ELSE NULL END) > 0 ORDER BY      MAX(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) DESC,      MAX(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) ASC LIMIT 1;	toxicology
SELECT T3.bond_id  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN connected AS T4 ON T1.atom_id = T4.atom_id2  JOIN atom AS T5 ON T4.atom_id2 = T5.atom_id  WHERE T2.molecule_id = 'TR000'  AND T1.element = 'cl'  AND T5.element = 'c'  AND T3.bond_id = 'TR001_1_8'	toxicology
SELECT T1.molecule_id  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  JOIN bond AS T3 ON T2.atom_id = T3.bond_id  WHERE T2.element = 'c' AND T3.bond_type = '#' AND T1.label = '-' LIMIT 2;	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT molecule.molecule_id)) AS chlorine_percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT T3.element FROM `molecule` AS T1 INNER JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T1.molecule_id = 'TR001' AND T3.element IS NOT NULL;	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = 'double'	toxicology
SELECT T3.atom_id, T3.atom_id2  FROM connected AS T1  JOIN bond AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON (T3.atom_id = T1.atom_id OR T3.atom_id2 = T1.atom_id)  WHERE T2.bond_type = '#'  LIMIT 1;	toxicology
SELECT atom.element  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_id = 'TR005_16_26'	toxicology
SELECT COUNT(*)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT `molecule`.`label` FROM `bond` JOIN `connected` ON `bond.bond_id` = `connected.bond_id` JOIN `atom` ON `connected.atom_id` = `atom.atom_id` JOIN `molecule` ON `atom.molecule_id` = `molecule.molecule_id` WHERE `bond.bond_id` = 'TR001_10_11';	toxicology
SELECT c.bond_id, m.label  FROM connected AS c  JOIN atom AS a1 ON c.atom_id = a1.atom_id  JOIN atom AS a2 ON c.atom_id2 = a2.atom_id  JOIN bond AS b ON c.bond_id = b.bond_id  JOIN molecule AS m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT atom.element  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+' AND SUBSTR(atom.atom_id, 7, 1) = '4' AND atom.element IN ('Cl', 'C', 'H', 'O', 'S', 'N', 'P', 'Na', 'Br', 'F', 'I', 'Sn', 'Pb', 'Te', 'Ca')	toxicology
SELECT      SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) AS hydrogen_count,     COUNT(*) AS total_atoms,     (SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) AS hydrogen_ratio,     (SELECT label FROM molecule WHERE molecule_id = 'TR006') AS molecule_label FROM      atom JOIN      connected ON atom.atom_id = connected.atom_id JOIN      bond ON connected.bond_id = bond.bond_id JOIN      molecule ON molecule.molecule_id = bond.molecule_id WHERE      molecule.molecule_id = 'TR006';	toxicology
SELECT T1.label  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id AND T2.atom_id <> T3.atom_id  JOIN bond AS T4 ON T3.atom_id = T4.atom_id AND T3.atom_id2 = T4.atom_id  WHERE T2.element = 'ca' AND T4.bond_type IN ('single', 'double', 'triple')  GROUP BY T1.molecule_id  HAVING COUNT(T2.atom_id) > 1  AND ALL(SELECT T5.label FROM atom AS T5 JOIN molecule AS T6 ON T5.molecule_id = T6.molecule_id WHERE T5.element != 'ca' AND T6.molecule_id = T1.molecule_id)	toxicology
SELECT T3.bond_type  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  WHERE T1.element = 'Te'  AND T3.bond_id IN (     SELECT T4.bond_id      FROM atom AS T1      JOIN connected AS T3 ON T1.atom_id = T3.atom_id2      JOIN bond AS T4 ON T3.bond_id = T4.bond_id      WHERE T1.element = 'Te' )	toxicology
SELECT DISTINCT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T3.bond_id = T2.bond_id  WHERE T3.bond_id = 'TR001_10_11';	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT      (SUM(CASE WHEN T3.bond_type = ' = ' THEN 1 ELSE 0 END) * 100.0 / COUNT(T3.bond_id)) AS percent FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN      bond AS T3 ON T2.atom_id = T3.molecule_id WHERE      T1.molecule_id = 'TR047';	toxicology
SELECT T1.label  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T2.atom_id = T3.atom_id  WHERE T2.atom_id = 'TR001_1' AND T1.label = '+'	toxicology
SELECT T1.label  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T2.atom_id = T3.atom_id  JOIN bond AS T4 ON T3.bond_id = T4.bond_id  WHERE T1.molecule_id = 'TR151' AND T4.bond_type = '+'  LIMIT 1;	toxicology
SELECT atom.element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR151' AND atom.element IN ('cl', 'br', 'i', 'f', 'te', 'sn', 'pb', 'ca')	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON a.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = m.molecule_id)) WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'c';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT T3.bond_id FROM `molecule` AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T1.label = '+' AND T4.bond_type = '=='	toxicology
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  JOIN connected ON atom.atom_id IN (SELECT atom_id FROM connected)  WHERE molecule.label = '+' AND atom.element = 'h';	toxicology
SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T3.atom_id = 'TR000_1' AND T3.molecule_id = 'TR000';	toxicology
SELECT `atom.atom_id` FROM `atom` JOIN `molecule` ON `atom.molecule_id` = `molecule.molecule_id` WHERE `atom.element` = 'c' AND `molecule.label` = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'h'	toxicology
SELECT T1.label  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T2.atom_id = T3.atom_id  JOIN bond AS T4 ON T3.bond_id = T4.bond_id  WHERE T1.molecule_id = 'TR124' AND T4.bond_type = '+' AND T1.label IS NOT NULL;	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T4.molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) AS double_bond_count, molecule.label  FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  JOIN connected ON bond.bond_id = connected.bond_id  WHERE molecule.molecule_id = 'TR006' AND bond.bond_type = ' = ' AND molecule.label = '+'	toxicology
SELECT m.molecule_id, m.label, a.element  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond b ON c.bond_id = b.bond_id  WHERE m.label = '+' AND (a.element = 'cl' OR a.element = 'c' OR a.element = 'h' OR a.element = 'o' OR a.element = 's' OR a.element = 'n' OR a.element = 'p' OR a.element = 'na' OR a.element = 'br' OR a.element = 'f' OR a.element = 'i' OR a.element = 'sn' OR a.element = 'pb' OR a.element = 'te' OR a.element = 'ca')	toxicology
SELECT c.atom_id, c.atom_id2, b.bond_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'	toxicology
SELECT T3.molecule_id, GROUP_CONCAT(DISTINCT T1.element) AS elements FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id JOIN bond AS T4 ON T1.bond_id = T4.bond_id WHERE T4.bond_type = '#' GROUP BY T3.molecule_id HAVING COUNT(*) IN (2) AND T1.element IN ('Cl', 'C') AND T3.element IN ('Cl', 'C') ORDER BY T3.molecule_id;	toxicology
SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T2.atom_id = T1.atom_id JOIN `bond` AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*)  FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a.element = 'cl' AND a2.element = 'cl'	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_id) AS bond_types_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON a.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = m.molecule_id)) WHERE m.molecule_id = 'TR346' GROUP BY a.atom_id	toxicology
SELECT COUNT(*) AS num_molecules_with_double_bond FROM molecule WHERE EXISTS (     SELECT 1 FROM bond WHERE bond.bond_id = bond.bond_id AND bond.bond_type = '=' AND molecule.molecule_id = bond.molecule_id ) AND EXISTS (     SELECT 1 FROM atom WHERE atom.atom_id IN (SELECT atom.atom_id FROM connected WHERE connected.bond_id = bond.bond_id) AND atom.element IN ('c', 'cl') AND molecule.molecule_id = atom.molecule_id ) AND molecule.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE m.label IS NULL  AND a.element != 's'  AND b.bond_type != '= ='	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4' AND T1.label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = '-'	toxicology
SELECT T1.molecule_id  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.element = 'cl' AND T1.label = '+'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label = '-'	toxicology
SELECT      (SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) / COUNT(T1.molecule_id)) * 100 AS percentage FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.element = 'cl';	toxicology
SELECT T1.molecule_id FROM bond AS T1 WHERE T1.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT atom.element) FROM connected JOIN atom ON (atom.atom_id = connected.atom_id OR atom.atom_id2 = connected.atom_id2) JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR001_3_4';	toxicology
SELECT T3.bond_type FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE (T2.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T2.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1')	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id IN ('TR000_2', 'TR000_4') GROUP BY T1.molecule_id HAVING COUNT(*) = 2;	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT `molecule`.`label` FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` WHERE `atom.atom_id` IN (SELECT `atom_id` FROM `connected` WHERE `bond_id` IS NULL) AND `molecule.molecule_id` = 'TR000';	toxicology
SELECT      CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) AS percentage FROM      atom AS T1 JOIN      bond AS T2 ON T1.atom_id = T2.atom_id AND T1.molecule_id = T2.molecule_id	toxicology
SELECT COUNT(*)  FROM molecule  JOIN atom ON molecule.molecule_id = atom.molecule_id  WHERE atom.element = 'n' AND molecule.label = '+';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = '=='	toxicology
SELECT `molecule.label` FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` JOIN `connected` ON `atom.atom_id` = `connected.atom_id` OR `atom.atom_id` = `connected.atom_id2` GROUP BY `molecule.molecule_id` HAVING COUNT(`atom.atom_id`) > 5 AND `molecule.label` = '-'	toxicology
SELECT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN connected AS T3 ON T1.atom_id = T3.atom_id2  JOIN atom AS T4 ON T3.atom_id2 = T4.atom_id  JOIN bond AS T5 ON T2.bond_id = T5.bond_id  JOIN bond AS T6 ON T3.bond_id = T6.bond_id  WHERE T1.molecule_id = 'TR024'  AND T5.bond_type = '='  AND T6.bond_type = '='  AND (T1.element = 'cl' OR T1.element = 'c' OR T1.element = 'h' OR T1.element = 'o' OR T1.element = 's' OR T1.element = 'n' OR T1.element = 'p' OR T1.element = 'na' OR T1.element = 'br' OR T1.element = 'f' OR T1.element = 'i' OR T1.element = 'sn' OR T1.element = 'pb' OR T1.element = 'te' OR T1.element = 'ca')	toxicology
SELECT `molecule_id` FROM `molecule` WHERE `label` = '+' ORDER BY COUNT(`atom.atom_id`) DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(T2.molecule_id)) AS percentage FROM      molecule AS T2 JOIN      atom AS T1 ON T2.molecule_id = T1.molecule_id JOIN      connected AS T4 ON T1.atom_id = T4.atom_id JOIN      bond AS T5 ON T4.bond_id = T5.bond_id WHERE      T1.element = 'h' AND T5.bond_type = '#'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*)  FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  WHERE molecule.molecule_id BETWEEN 'TR004' AND 'TR010'  AND bond.bond_type = '-'	toxicology
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR008' AND atom.element = 'c';	toxicology
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE atom.atom_id = 'TR004_7' AND molecule.label = '-'	toxicology
SELECT COUNT(DISTINCT T1.molecule_id)  FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  JOIN connected AS T3 ON T2.bond_id = T3.bond_id  JOIN atom AS T4 ON T3.atom_id = T4.atom_id  JOIN atom AS T5 ON T3.atom_id2 = T5.atom_id  WHERE T4.element = 'O' AND T5.element = 'O' AND T2.bond_type = '==';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id IN (     SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '#' ) AND label = '-'	toxicology
SELECT T3.element, T2.bond_type  FROM molecule AS T1  JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id  JOIN connected AS T4 ON T3.atom_id = T4.atom_id  JOIN bond AS T2 ON T2.bond_id = T4.bond_id  WHERE T1.molecule_id = 'TR016'	toxicology
SELECT T1.atom_id FROM `atom` AS T1 JOIN `molecule` AS T2 ON T2.molecule_id = T1.molecule_id JOIN `bond` AS T3 ON T3.bond_id = T1.bond_id WHERE T2.molecule_id = 'TR012' AND T1.element = 'c' AND T3.bond_type = 'double'	toxicology
SELECT atom.atom_id FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  JOIN bond ON atom.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = (SELECT molecule_id FROM molecule WHERE label = '+')))  JOIN atom AS atom2 ON atom2.atom_id IN (SELECT atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = (SELECT molecule_id FROM molecule WHERE label = '+')))  WHERE atom.element = 'o' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NULL;	card_games
SELECT name FROM cards WHERE faceConvertedManaCost > 0 AND faceConvertedManaCost = MAX(faceConvertedManaCost)	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned'	card_games
SELECT T2.status  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.types LIKE '%Artifact%' AND T1.side IS NULL AND T2.format = 'vintage'	card_games
SELECT `cards`.id, `cards`.artist  FROM `cards`  JOIN `legalities` ON `cards`.uuid = `legalities`.uuid  WHERE `cards`.power LIKE '*' OR `cards`.power IS NULL  AND `legalities`.format = 'commander'  AND `legalities`.status = 'Legal';	card_games
SELECT c.name, r.text  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Stephen Daniele' AND r.date IS NOT NULL AND c.hasContentWarning = 1;	card_games
SELECT      T1.text  FROM      rulings AS T1  JOIN      cards AS T2 ON T1.uuid = T2.uuid  WHERE      T2.name = 'Sublime Epiphany' AND T2.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE r.date IS NOT NULL  GROUP BY c.uuid  ORDER BY COUNT(r.uuid) DESC  LIMIT 1;	card_games
SELECT T2.language  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.name = 'Annul' AND T1.number = '29'	card_games
SELECT name FROM cards WHERE language = 'Japanese';	card_games
SELECT      CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM      cards AS T1 JOIN      foreign_data AS T2 ON T1.uuid = T2.uuid WHERE      T2.language = 'Chinese Simplified';	card_games
SELECT s.name, s.totalSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' ORDER BY s.name;	card_games
SELECT COUNT(DISTINCT c.types)  FROM cards c  WHERE c.artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM `cards` WHERE `power` = '*'	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT T3.language  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T2.format = T3.code  WHERE T1.name = 'Angel of Mercy';	card_games
SELECT COUNT(*)  FROM legalities  WHERE status = 'restricted' AND `text` IS NOT NULL AND `text` <> '' AND isTextless = 0;	card_games
SELECT text FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Condemn')	card_games
SELECT COUNT(*)  FROM legalities  WHERE status = 'restricted' AND uuid IN (SELECT uuid FROM cards WHERE isStarter = 1);	card_games
SELECT status FROM legalities WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle')	card_games
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight';	card_games
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight' AND T2.format IS NOT NULL;	card_games
SELECT DISTINCT artist  FROM cards  WHERE name LIKE '%Phyrexian%'	card_games
SELECT      CAST(SUM(CASE WHEN `borderColor` = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`id`) AS PercentageBorderlessCards FROM      cards	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE language = 'German' AND isReprint = 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian';	card_games
SELECT CAST(SUM(CASE WHEN T1.language = 'French' AND T2.isStorySpotlight = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.uuid)  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T2.format = 'Story Spotlight' AND T1.isStorySpotlight = 1	card_games
SELECT COUNT(*)  FROM cards  WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT `layout` FROM `cards` WHERE `keywords` LIKE '%flying%'	card_games
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%'	card_games
SELECT `id` FROM `cards` WHERE `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT name FROM cards WHERE language = 'Chinese Simplified';	card_games
SELECT uuid FROM cards WHERE availability = 'paper' AND language = 'Japanese';	card_games
SELECT COUNT(*)  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE legalities.format = 'Standard' AND status = 'Banned' AND cards.borderColor = 'white';	card_games
SELECT T1.uuid, T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy'	card_games
SELECT `text` FROM `rulings` WHERE `uuid` = (SELECT `uuid` FROM `cards` WHERE `name` = 'Beacon of Immortality');	card_games
SELECT COUNT(*) AS future_frame_card_count FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' AND legalities.status = 'legal'	card_games
SELECT c.name, c.colors FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.setCode = 'OGW'	card_games
SELECT T1.name, T1.language FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode AND T1.uuid = T2.uuid WHERE T1.setCode = '10E' AND T1.convertedManaCost = 5	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT      c.id,     c.colors,     l.format FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.id BETWEEN 1 AND 20;	card_games
SELECT c.uuid FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.colors = 'B' AND c.type LIKE 'Artifact%' AND fd.language IS NOT NULL;	card_games
SELECT name  FROM cards  WHERE rarity = 'uncommon'  ORDER BY date ASC  LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.artist = 'John Avon' AND (cards.cardKingdomFoilId IS NOT NULL OR cards.cardKingdomId IS NOT NULL)	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND (cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL)	card_games
SELECT COUNT(*)  FROM cards  WHERE artist LIKE 'UDON%' AND availability = 'mtgo' AND hand = '-1';	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost  FROM cards  WHERE layout = 'normal'  AND frameVersion = '2003'  AND borderColor = 'black'  AND (availability = 'paper' OR availability = 'mtgo');	card_games
SELECT SUM(LENGTH(replace('manaCost', '{', '') + replace('manaCost', '}', '') - LENGTH(replace('manaCost', '{', '')) - LENGTH(replace('manaCost', '}', ''))) AS TotalUnconvertedMana FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT      CASE          WHEN subtypes IS NOT NULL THEN subtypes          ELSE supertypes      END  FROM      cards  WHERE      availability = 'arena';	card_games
SELECT T2.setCode  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  JOIN set_translations AS T3 ON T2.setCode = T3.setCode  WHERE T1.language = 'Spanish'	card_games
SELECT CAST(SUM(CASE WHEN T1.hand = '+3' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id)  FROM cards AS T1  JOIN rulings AS T2 ON T1.uuid = T2.uuid  WHERE T2.text LIKE '%legendary%' AND T1.hand = '+3'	card_games
SELECT      c.id FROM      cards c WHERE      c.isStoryspotlight = 1 AND c.isTextless = 1 ORDER BY      c.id;	card_games
SELECT      name,     (COUNT(*) FILTER (WHERE language = 'Spanish') * 100.0 / COUNT(*)) AS percentage_in_spanish FROM      cards GROUP BY      name ORDER BY      percentage_in_spanish DESC;	card_games
SELECT DISTINCT T2.language  FROM sets AS T1  JOIN set_translations AS T2 ON T1.setCode = T2.setCode  WHERE T1.baseSetSize = 309;	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.setCode = set_translations.setCode  WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)' AND set_translations.translation IS NOT NULL;	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%' AND l.status = 'legal'	card_games
SELECT DISTINCT t1.name  FROM cards AS t1  JOIN foreign_data AS t2 ON t1.uuid = t2.uuid  JOIN translations AS t3 ON t2.language = 'german' AND t2.type = t3.type  WHERE t1.subtypes IS NOT NULL AND t1.supertypes IS NOT NULL AND t2.name IS NOT NULL AND t3.translation IS NOT NULL	card_games
SELECT COUNT(*)  FROM cards  WHERE power IS NULL AND (power = 'null' OR power = '*')	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.format = 'pre-modern'  AND cards.frameEffects LIKE '%triggered mana ability%'  AND cards.side IS NULL;	card_games
SELECT c.id  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'pauper' AND c.artist = 'Erica Yang' AND c.availability = 'paper'	card_games
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT ffl.flavorText  FROM cards c  JOIN foreign_data ffl ON c.uuid = ffl.uuid  WHERE c.artist = 'Matthew D. Wilson'  AND c.layout = 'normal'  AND c.borderColor = 'black'  AND ffl.language = 'French'  AND c.types LIKE '%Creature%';	card_games
SELECT COUNT(*)  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.rarity = 'rare' AND date = '2009-01-10'	card_games
SELECT `setTranslations.translation` FROM `sets` JOIN `set_translations` ON `sets.code` = `set_translations.setCode` WHERE `sets.baseSetSize` = 180 AND `sets.block` = 'Ravnica'	card_games
SELECT CAST(SUM(CASE WHEN hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM cards  WHERE format = 'commander' AND Status = 'legal'	card_games
SELECT      CAST(SUM(CASE WHEN power IS NULL OR power = '*' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS REAL)  FROM      cards  JOIN      foreign_data fd ON cards.uuid = fd.uuid  WHERE      fd.language = 'French';	card_games
SELECT      CAST(SUM(CASE WHEN S.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM      sets S JOIN      set_translations ST ON S.code = ST.setCode WHERE      ST.language = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*)  FROM cards  WHERE edhrecRank > 12000 AND borderColor = 'borderless';	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name  FROM cards  WHERE power IS NULL OR power = '*'  AND promoTypes = 'arenaleague'  ORDER BY name  LIMIT 3;	card_games
SELECT T2.language  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.multiverseId = 149934;	card_games
SELECT c1.id, c2.id  FROM cards c1  JOIN cards c2 ON c1.cardKingdomFoilId = c2.cardKingdomId  WHERE c1.cardKingdomFoilId IS NOT NULL AND c1.cardKingdomId IS NOT NULL  ORDER BY c1.cardKingdomFoilId  LIMIT 3	card_games
SELECT      CAST(SUM(CASE WHEN `text` IS NULL OR `text` = '' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS proportion FROM      cards WHERE      `layout` = 'normal' AND `isTextless` = 1	card_games
SELECT `number`  FROM cards  WHERE `side` IS NULL AND (`subtypes` LIKE '%Angel%' AND `subtypes` LIKE '%Wizard%')	card_games
SELECT      s.name  FROM      sets s  WHERE      s.mtgoCode IS NULL OR s.mtgoCode = ''  ORDER BY      s.name  LIMIT 3;	card_games
SELECT DISTINCT T2.language  FROM legalities AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T1.uuid = T3.uuid  WHERE T3.setCode = 'ARC' AND T2.mcmName = 'Archenemy';	card_games
SELECT T1.name, T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.setCode WHERE T1.id = 5	card_games
SELECT `language`, `type` FROM sets WHERE id = 206;	card_games
SELECT s.id, s.name FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode AND st.language = 'Italian' JOIN cards AS c ON c.setCode = s.code WHERE s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT `sets`.id FROM `sets` WHERE `sets`.isForeignOnly = 1 AND `sets`.isFoilOnly = 1 AND `set_translations`.language = 'Japanese';	card_games
SELECT      s.name FROM      sets s JOIN      set_translations st ON s.code = st.setCode AND st.language = 'Russian' WHERE      s.baseSetSize = (         SELECT              MAX(baseSetSize)          FROM              sets     )	card_games
SELECT      (SELECT COUNT(*) FROM cards WHERE language = 'Chinese Simplified' AND isOnlineOnly = 1) * 100 / (SELECT COUNT(*) FROM cards) AS Percentage	card_games
SELECT COUNT(*)  FROM sets  WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '')	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT `name`  FROM `cards`  WHERE `borderColor` = 'black' AND `isFullArt` = 1;	card_games
SELECT `language` FROM `set_translations` WHERE `setCode` = '174';	card_games
SELECT `sets`.name FROM `sets` WHERE `sets`.code = 'ALL';	card_games
SELECT foreign_data.language FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT T1.baseSetSize, T1.setCode FROM sets AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'en' AND T2.translation IN ('Masques', 'Mirage')	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion';	card_games
SELECT T2.foreignName, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'boros';	card_games
SELECT T2.language, T2.flavorText, T3.type  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  JOIN cards AS T3 ON T1.id = T3.id  WHERE T1.watermark = 'colorpie'	card_games
SELECT      CAST(SUM(CASE WHEN c.convertedManaCost = 16 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      cards c WHERE      c.name = 'Abyssal Horror';	card_games
SELECT code FROM sets WHERE type = 'expansion commander';	card_games
SELECT T1.asciiName, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'abzan';	card_games
SELECT T2.language, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Azorius';	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%' AND hand LIKE '+%'	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT      c.purchaseUrls FROM      cards c WHERE      c.promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black' AND        availability LIKE '%arena,mtgo%'	card_games
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT `sets`.name  FROM `sets`  JOIN `cards` ON `sets`.uuid = `cards`.uuid  JOIN `set_translations` ON `sets`.code = `set_translations`.setCode  WHERE `cards`.name = 'Ancestor''s Chosen' AND `set_translations`.language = 'Italian'	card_games
SELECT COUNT(*)  FROM set_translations  JOIN sets ON set_translations.setCode = sets.code  WHERE sets.name LIKE '%Angel of Mercy%'	card_games
SELECT name FROM cards WHERE uuid IN (SELECT uuid FROM set_translations WHERE language = 'German' AND translation = 'Hauptset Zehnte Edition')	card_games
SELECT COUNT(*)  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  JOIN sets ON legalities.uuid = sets.uuid  WHERE sets.name = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex'	card_games
SELECT SUM(baseSetSize)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation FROM set_translations WHERE language = 'Simplified Chinese' AND setCode = 'Eighth Edition'	card_games
SELECT EXISTS (     SELECT 1     FROM cards c     JOIN legalities l ON c.uuid = l.uuid     WHERE c.name = 'Angel of Mercy'     AND l.format = 'MTGO'     AND l.status = 'Legal' ) AS "Appears on MTGO";	card_games
SELECT releaseDate FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT `type` FROM `sets` WHERE `name` = 'Hauptset Zehnte Edition' AND `translation` = ' Hauptset Zehnte Edition'	card_games
SELECT COUNT(*)  FROM sets  WHERE block = 'Ice Age' AND language = 'Italian';	card_games
SELECT      cards.uuid,      sets.name,      sets.isForeignOnly FROM      cards JOIN      legalities ON cards.uuid = legalities.uuid JOIN      sets ON legalities.format = sets.code WHERE      cards.name = 'Adarkar Valkyrie' AND      sets.isForeignOnly = 1;	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation IS NOT NULL AND sets.language = 'Italian' AND sets.baseSetSize < 10;	card_games
SELECT COUNT(*)  FROM cards  WHERE name = 'Coldsnap' AND borderColor = 'black';	card_games
SELECT name  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap'  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT artist  FROM cards  WHERE uuid IN      (SELECT uuid       FROM cards       JOIN legalities ON cards.uuid = legalities.uuid       JOIN sets ON legalities.uuid = sets.uuid       WHERE sets.name = 'Coldsnap')  AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT * FROM cards WHERE setCode = 'Coldsnap' AND number = '4';	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.convertedManaCost > 5 AND cards.power = '*' OR cards.power IS NULL	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen'	card_games
SELECT DISTINCT T2.language  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL	card_games
SELECT type FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'German';	card_games
SELECT `cards`.name, `rulings`.text FROM `cards` JOIN `rulings` ON `cards`.uuid = `rulings`.uuid WHERE `cards`.name = 'Coldsnap' AND `rulings`.language = 'Italian';	card_games
SELECT T1.name AS italian_name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T2.uuid = T3.uuid WHERE T1.language = 'Italian' AND T3.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1;	card_games
SELECT date FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Reminisce')	card_games
SELECT      CAST(SUM(CASE WHEN `convertedManaCost` = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      cards  WHERE      `setCode` = 'Coldsnap';	card_games
SELECT      CAST(SUM(CASE WHEN c.name = 'Coldsnap' AND c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id) FROM cards c WHERE c.name = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT `mcmId` FROM `sets` WHERE `code` = 'SS2';	card_games
SELECT T2.mcmName FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate = '2017-06-09'	card_games
SELECT `type` FROM sets WHERE `name` LIKE 'From the Vault: Lore'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, c.text, r.text  FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 1;	card_games
SELECT `sets`.releaseDate  FROM `sets`  JOIN `cards` ON `sets`.uuid = `cards`.uuid  WHERE `cards`.name = 'Evacuation';	card_games
SELECT SUM(T1.baseSetSize)  FROM sets AS T1  JOIN set_translations AS T2 ON T1.setCode = T2.setCode  WHERE T2.translation = 'Rinascita di Alara'	card_games
SELECT type  FROM sets  WHERE name = 'Huitième édition' AND translation = 'Huitième édition';	card_games
SELECT `sets`.name  FROM `sets`  JOIN `set_translations` ON `sets`.code = `set_translations`.setCode  WHERE `set_translations`.language = 'French' AND EXISTS (     SELECT 1      FROM `cards`      WHERE `cards`.name = 'Tendo Ice Bridge' AND `cards`.uuid IN (         SELECT `cards`.uuid          FROM `cards`          JOIN `set_translations` ON `cards`.name = `set_translations.translation`          WHERE `set_translations`.setCode = `sets`.code     ) )	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode = 'Salvat 2011' AND translation IS NOT NULL;	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND EXISTS (     SELECT 1 FROM cards c     WHERE c.uuid IN (SELECT uuid FROM foreign_data fd WHERE fd.name = 'Fellwar Stone') AND c.setCode = s.code )	card_games
SELECT name  FROM cards  WHERE name = 'Journey into Nyx Hero''s Path'  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT releaseDate FROM sets WHERE translation = 'Ola de frío' AND name LIKE '%Ola de frío%'	card_games
SELECT `type` FROM sets WHERE `name` IN (SELECT `uuid` FROM cards WHERE `name` = 'Samite Pilgrim') AND `type` = 'expansion';	card_games
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3	card_games
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setCode = 'Mirrodin';	card_games
SELECT      CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      cards AS T1  JOIN      set_translations AS T2 ON T1.setCode = T2.setCode  WHERE      T2.language = 'Japanese';	card_games
SELECT      CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id)  FROM      cards AS T1  JOIN      set_translations AS T2 ON T1.setCode = T2.setCode  WHERE      T2.language = 'Portuguese (Brazil)';	card_games
SELECT DISTINCT availability  FROM cards  WHERE artist = 'Aleksi Briclot' AND isTextless = 1	card_games
SELECT T2.id  FROM (     SELECT T1.setCode, COUNT(*) AS cardCount      FROM cards AS T1      JOIN sets AS T2 ON T1.setCode = T2.code      GROUP BY T1.setCode      ORDER BY cardCount DESC      LIMIT 1 ) AS T1 JOIN sets AS T2 ON T1.setCode = T2.code;	card_games
SELECT T1.artist  FROM cards AS T1  JOIN (     SELECT MAX(T2.convertedManaCost) AS maxCost, T2.artist      FROM cards AS T2      WHERE T2.side IS NULL ) AS T3  ON T1.artist = T3.artist AND T1.convertedManaCost = T3.maxCost	card_games
SELECT MAX(frameEffects) AS MostCommonFrameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE power IS NULL OR power = '*'  AND hasFoil = 0  AND duelDeck = 'a';	card_games
SELECT `id` FROM sets WHERE `type` = 'commander' AND `totalSetSize` = (SELECT MAX(`totalSetSize`) FROM sets WHERE `type` = 'commander');	card_games
SELECT c.name, c.manaCost  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel'  ORDER BY c.manaCost DESC  LIMIT 10;	card_games
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE artist = 'Volkan Baga' AND language = 'French';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE cards.rarity = 'rare'  AND cards.types = 'Enchantment'  AND cards.name = 'Abundance'  AND legalities.status = 'Legal';	card_games
SELECT T2.format, T1.name FROM legalities AS T1 JOIN (     SELECT format, COUNT(*) AS banned_count     FROM legalities     WHERE status = 'banned'     GROUP BY format     ORDER BY banned_count DESC     LIMIT 1 ) AS T2 ON T1.format = T2.format JOIN cards AS T3 ON T3.uuid = T1.uuid;	card_games
SELECT `language` FROM `set_translations` WHERE `setCode` = 'Battlebond';	card_games
SELECT      artist,     GROUP_CONCAT(format SEPARATOR ', ') FROM      cards GROUP BY      artist HAVING      COUNT(*) = (         SELECT              MIN(count_artist)          FROM          (             SELECT                  artist,                  COUNT(*) AS count_artist              FROM                  cards              GROUP BY                  artist          ) AS subquery     ) ORDER BY      COUNT(*) ASC LIMIT 1;	card_games
SELECT status  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE frameVersion = '1997'  AND artist = 'D. Alexander Gregory'  AND hasContentWarning = 1  AND format = 'legacy';	card_games
SELECT `name`, `format` FROM `legalities` JOIN `cards` ON `legalities.uuid` = `cards.uuid` WHERE `edhrecRank` = 1 AND `status` = 'banned';	card_games
SELECT AVG(s.id) AS average_sets_per_year, MAX(COUNT(TL.language)) AS common_language FROM sets s JOIN set_translations TL ON s.code = TL.setCode WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31';	card_games
SELECT DISTINCT artist  FROM cards  WHERE borderColor = 'black' AND availability = 'mtgo' AND mtgArenaId IS NOT NULL;	card_games
SELECT T1.uuid  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T2.format = 'oldschool' AND (T2.status = 'banned' OR T2.status = 'restricted')	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE artist = 'Kev Walker'  ORDER BY date DESC;	card_games
SELECT      c.name FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      l.format IN ('Standard', 'Modern', 'Pauper', 'Legacy', 'Vintage', 'Pioneer', 'Brawl') AND     c.setCode = 'Hour of Devastation' AND     l.status = 'legal'	card_games
SELECT `name`  FROM `set_translations` WHERE `language` != '%Japanese%' AND `language` = 'Korean';	card_games
SELECT DISTINCT frameVersion, name  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE artist = 'Allen Williams' AND status = 'banned';	card_games
SELECT Users.Id, MAX(Users.Reputation)  FROM users  WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014;	codebase_community
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01 00:00:00'	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users) LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1	codebase_community
SELECT COUNT(*)  FROM users  WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT u.DisplayName  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(T2.CommentCount)  FROM users AS T1  JOIN posts AS T2 ON T1.Id = T2.OwnerUserId  WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT MAX(p.AnswerCount)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'  ORDER BY p.AnswerCount DESC  LIMIT 1	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age > 65 AND p.Score >= 20	codebase_community
SELECT Location  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE Title = 'Eliciting priors from experts';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'	codebase_community
SELECT p.Body  FROM posts p  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie'	codebase_community
SELECT T3.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND strftime('%Y', badges.Date) = '2011'	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(T1.Score)  FROM posts AS T1  JOIN users AS T2 ON T1.OwnerUserId = T2.Id  WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(COUNT(badges.Id)) AS AverageBadges FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Views > 200;	codebase_community
SELECT CAST(COUNT(CASE WHEN u.Age > 65 THEN p.Id ELSE NULL END) AS REAL) * 100 / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Score > 20	codebase_community
SELECT COUNT(*)  FROM votes  WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes WHERE Count(Id) = (SELECT COUNT(Id) FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1);	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN (     SELECT c.PostId, MAX(c.Score) AS max_score     FROM comments c     GROUP BY c.PostId ) AS cm ON p.Id = cm.PostId WHERE cm.max_score = (     SELECT MAX(c2.Score)     FROM comments c2     WHERE c2.PostId = cm.PostId );	codebase_community
SELECT COUNT(*)  FROM comments  WHERE PostId IN (     SELECT Id      FROM posts      WHERE ViewCount = 1910 )	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId JOIN comments c ON p.Id = c.PostId AND c.CreationDate = '2014/4/23 20:29:39.0' AND c.UserId = '3025';	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ParentId = 107829 AND c.CommentCount = 1;	codebase_community
SELECT p.Id, p.Title, p.Score  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NULL	codebase_community
SELECT T2.Reputation FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = '65041'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Tiago Pasqualini'	codebase_community
SELECT u.DisplayName FROM users u WHERE u.Id = 6347;	codebase_community
SELECT COUNT(*)  FROM posts  JOIN votes ON posts.Id = votes.PostId  WHERE posts.Title LIKE '%data visualization%'	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      COUNT(posts.Id) / COUNT(votes.Id) AS PostToVoteRatio FROM      posts JOIN      users ON posts.OwnerUserId = 24 LEFT JOIN      votes ON posts.Id = votes.PostId WHERE      users.Id = 24	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'SilentGhost';	codebase_community
SELECT c.UserDisplayName  FROM comments c  WHERE c.Text = 'thank you user93';	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text  FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName  FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT `users.DisplayName`  FROM `posts`  JOIN `users` ON `posts.OwnerUserId` = `users.Id`  WHERE `posts.Title` = 'Open source tools for visualizing multi-dimensional data' AND `posts.LastEditorUserId` IS NOT NULL	codebase_community
SELECT p.Title  FROM posts p  JOIN (     SELECT LastEditorUserId, PostId      FROM postHistory      WHERE LastEditorDisplayName = 'Vebjorn Ljosa' ) ph ON p.Id = ph.PostId;	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'	codebase_community
SELECT c.Text  FROM comments AS c  JOIN posts AS p ON c.PostId = p.Id  JOIN users AS u ON c.UserId = u.Id  WHERE u.Id IN (     SELECT e.LastEditorUserId      FROM posts AS p      JOIN postHistory AS ph ON p.Id = ph.PostId      JOIN users AS u ON ph.UserId = u.Id      WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND ph.Comment IS NOT NULL ) AND c.CreationDate <= (SELECT LastEditDate FROM posts WHERE Id = c.PostId)	codebase_community
SELECT SUM(T2.BountyAmount)  FROM posts AS T1  JOIN votes AS T2 ON T1.Id = T2.PostId  WHERE T1.Title LIKE '%data%'  AND T2.VoteTypeId = 3; -- Assuming type 3 represents bounties	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.BountyAmount = 50 AND v.PostId IN (     SELECT p.Id     FROM posts p     JOIN postHistory ph ON p.Id = ph.PostId     WHERE ph.Text LIKE '%variance%' )	codebase_community
SELECT AVG(p.ViewCount), p.Title, c.Text, p.Score  FROM posts p  JOIN tags t ON p.Tags LIKE '%humor%'  LEFT JOIN comments c ON p.Id = c.PostId  WHERE t.TagName = 'humor'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Supporter' AND Date BETWEEN '2011-01-01' AND '2011-12-31'	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  GROUP BY UserId  HAVING COUNT(Name) > 5;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b1 ON u.Id = b1.UserId  JOIN badges b2 ON u.Id = b2.UserId  WHERE u.Location = 'New York'  AND b1.Name = 'Teacher'  AND b2.Name = 'Supporter';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 1;	codebase_community
SELECT u.Id AS UserId FROM users u JOIN (     SELECT p.OwnerUserId, COUNT(DISTINCT ph.PostId) AS post_hist_count     FROM posts p     JOIN postHistory ph ON p.Id = ph.PostId     GROUP BY p.OwnerUserId     HAVING COUNT(DISTINCT ph.PostId) = 1 ) sub ON u.Id = sub.OwnerUserId WHERE u.Views >= 1000	codebase_community
SELECT b.UserId, b.Name  FROM badges b  JOIN (     SELECT UserId, COUNT(*) AS CommentCount      FROM comments      GROUP BY UserId      HAVING COUNT(*) = (         SELECT MAX(CommentCount)          FROM (             SELECT COUNT(*) AS CommentCount              FROM comments              GROUP BY UserId          ) t     ) ) c ON b.UserId = c.UserId	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher';	codebase_community
SELECT      ((COUNT(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 END) / CAST(COUNT(*) AS REAL)) * 100 -      (COUNT(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 END) / CAST(COUNT(*) AS REAL)) * 100) AS PercentageDifference FROM badges WHERE Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId)  FROM postHistory  JOIN comments ON postHistory.PostId = comments.PostId  WHERE postHistory.PostId = 3720;	codebase_community
SELECT p.Id AS postId, p.ViewCount AS popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId OR p.Id = pl.RelatedPostId WHERE pl.PostId = 61217 OR pl.RelatedPostId = 61217	codebase_community
SELECT c.Score, l.LinkTypeId FROM postLinks AS l JOIN posts AS p ON l.PostId = p.Id JOIN comments AS c ON p.Id = c.PostId WHERE p.Id = 395	codebase_community
SELECT p.Id, u.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(p.FavoriteCount)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Id = 686 AND YEAR(p.CreationDate) = 2011	codebase_community
SELECT      AVG(T1.UpVotes) AS AverageUpVotes,     AVG(T2.Age) AS AverageAge FROM      votes AS T1 JOIN      users AS T2 ON T1.UserId = T2.Id WHERE      T1.VoteTypeId = 2 -- Assuming 2 represents up votes GROUP BY      T2.Id HAVING      COUNT(T2.Id) > 10 -- Ensuring users have created more than 10 posts	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.CreationDate = '2010-07-19 19:39:07.0' AND p.Id = c.PostId;	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10;	codebase_community
SELECT T1.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Pierre')	codebase_community
SELECT T2.Date  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.Location = 'Rochester, NY'	codebase_community
SELECT      CAST(COUNT(*) OVER () AS REAL) * 100 / COUNT(b.UserId)  FROM      badges b  WHERE      b.Name = 'Teacher';	codebase_community
SELECT CAST(COUNT(*) OVER() * 100.0 / COUNT(U.Id) AS REAL) * 1 FROM badges B JOIN users U ON B.UserId = U.Id WHERE B.Name = 'Organizer' AND U.Age BETWEEN 13 AND 18	codebase_community
SELECT c.Score  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' AND b.Name = 'Teacher'	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT T1.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT Users.DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT      CAST(SUM(CASE WHEN YEAR(v.CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN YEAR(v.CreationDate) = 2011 THEN 1 ELSE 0 END) AS vote_ratio_2010_2011 FROM votes v	codebase_community
SELECT T.TagName  FROM tags AS T  JOIN posts AS P ON T.ExcerptPostId = P.Id  JOIN users AS U ON P.OwnerUserId = U.Id  WHERE U.DisplayName = 'John Stauffer'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'Harlan'	codebase_community
SELECT `posts.Id`  FROM `posts`  JOIN `users` ON `posts.OwnerUserId` = `users.Id`  WHERE `users.DisplayName` = 'slashnick'  ORDER BY `posts.AnswerCount` DESC  LIMIT 1;	codebase_community
SELECT p1.Id AS PostId_HarveyMotulsky, p2.Id AS PostId_NoahSnyder FROM posts p1 JOIN users u1 ON p1.OwnerUserId = u1.Id JOIN posts p2 ON p2.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Noah Snyder') JOIN users u2 ON p2.OwnerUserId = u2.Id WHERE u1.DisplayName = 'Harvey Motulsky' AND u2.DisplayName = 'Noah Snyder' AND (p1.ViewCount > p2.ViewCount OR (p1.ViewCount = p2.ViewCount AND p1.Id < p2.Id)) ORDER BY p1.ViewCount DESC, p1.Id ASC LIMIT 1 UNION ALL SELECT p2.Id AS PostId_HarveyMotulsky, p1.Id AS PostId_NoahSnyder FROM posts p2 JOIN users u2 ON p2.OwnerUserId = u2.Id JOIN posts p1 ON p1.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') JOIN users u1 ON p1.OwnerUserId = u1.Id WHERE u2.DisplayName = 'Noah Snyder' AND u1.DisplayName = 'Harvey Motulsky' AND (p2.ViewCount > p1.ViewCount OR (p2.ViewCount = p1.ViewCount AND p2.Id < p1.Id)) ORDER BY p2.ViewCount DESC, p2.Id ASC LIMIT 1	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Matt Parker' AND votes.VoteTypeId IN (2, 3) AND votes.PostId > 4	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId IN (     SELECT Id      FROM users      WHERE DisplayName = 'Neil McGuigan' ) AND Score < 60;	codebase_community
SELECT DISTINCT t.TagName FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN tags t ON p.Tags LIKE '%' + t.TagName + '%' WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;	codebase_community
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'	codebase_community
SELECT      CAST(COUNT(CASE WHEN t.TagName = 'r' THEN p.Id ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN u.DisplayName = 'Community' THEN p.Id ELSE NULL END) AS Percentage FROM      posts p JOIN      tags t ON p.Id = t.ExcerptPostId OR p.Id = t.WikiPostId JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName = 'Community';	codebase_community
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -       SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      users u JOIN      posts p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'commentator' AND Date LIKE '2014%'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, u.DisplayName FROM posts p JOIN postLinks pl ON p.Id = pl.PostId JOIN comments c ON pl.RelatedPostId = c.Id JOIN users u ON c.UserId = u.Id WHERE c.Score > 60	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location LIKE '%North Pole%' AND STRFTIME('%Y', b.Date) = '2011'	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(*) AS post_history_count, MAX(T1.LastEditDate) AS last_edit_date FROM posts T1 WHERE T1.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers'	codebase_community
SELECT p.Title FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = (     SELECT Id     FROM posts     WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' ) AND p.PostTypeId = 1;	codebase_community
SELECT p.Id AS PostID, b.Name AS BadgeName FROM badges b JOIN users u ON b.UserId = u.Id JOIN posts p ON b.Date = p.CreationDate WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT OwnerDisplayName FROM posts WHERE ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT p.Title, pl.LinkTypeId  FROM posts AS p  JOIN postLinks AS pl ON p.Id = pl.PostId  WHERE p.Title = 'What are principal component scores?'	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ParentId IS NOT NULL  AND p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId = p.Id)	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title  FROM posts  ORDER BY ViewCount DESC  LIMIT 5	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT MAX(Tags.Count), Posts.Score  FROM posts  JOIN (     SELECT TagName, COUNT(*) AS Count      FROM posts      JOIN tags ON tags.Id = posts.Tags      GROUP BY TagName      ORDER BY Count DESC      LIMIT 1 ) AS PopularTag ON posts.Tags = PopularTag.TagName	codebase_community
SELECT CAST(COUNT(*) AS REAL) / 12 AS AverageMonthlyLinks FROM postLinks WHERE YEAR(postLinks.CreationDate) = 2010 AND postLinks.PostId IN (     SELECT p.Id     FROM posts p     WHERE p.AnswerCount <= 2 )	codebase_community
SELECT p.Id  FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 AND p.FavoriteCount = (     SELECT MAX(FavoriteCount)      FROM posts      WHERE Id = v.PostId )	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.Id ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(votes.CreationDate)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'chl'	codebase_community
SELECT MIN(p.CreationDate) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT u.DisplayName  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE users.Location = 'United Kingdom' AND posts.FavoriteCount >= 4	codebase_community
SELECT AVG(v.PostId) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Jay Stevens'  AND YEAR(CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(p.Score)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Stephen Turner'	codebase_community
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount > 20000 AND STRFTIME('%Y', T1.CreationDate) = '2011'	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.CreationDate BETWEEN '2010-01-01' AND '2010-12-31' ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      CAST(COUNT(CASE WHEN u.Reputation > 1000 AND p.CreationDate BETWEEN '2011-01-01' AND '2011-12-31' THEN p.Id ELSE NULL END) AS REAL) * 100 / COUNT(p.Id) AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.CreationDate BETWEEN '2011-01-01' AND '2011-12-31';	codebase_community
SELECT      CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) as percentage FROM      users	codebase_community
SELECT u.DisplayName, p.ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets' AND p.OwnerUserId = (     SELECT OwnerUserId      FROM posts      WHERE Title = 'Computer Game Datasets'      ORDER BY LastActivityDate DESC      LIMIT 1 );	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (     SELECT AVG(ViewCount)      FROM posts )	codebase_community
SELECT COUNT(*)  FROM comments  WHERE postid IN (     SELECT postid      FROM posts      ORDER BY score DESC      LIMIT 1 );	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.LastEditorUserId  WHERE p.Id = 183  ORDER BY p.LastEditDate DESC  LIMIT 1;	codebase_community
SELECT Name  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett')  ORDER BY Date DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT      (SELECT Date FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Zolomon')) -      (SELECT CreationDate FROM users WHERE DisplayName = 'Zolomon')	codebase_community
SELECT COUNT(*) AS numberOfPosts, COUNT(*) AS numberOfComments FROM (     SELECT u.Id, u.CreationDate, p.Id AS postId, c.Id AS commentId     FROM users u     JOIN posts p ON u.Id = p.OwnerUserId     JOIN comments c ON u.Id = c.UserId     WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) ) subquery;	codebase_community
SELECT c.Text, u.DisplayName  FROM comments c  JOIN posts p ON c.PostId = p.Id  JOIN users u ON c.UserId = u.Id  WHERE p.Title = 'Analysing wind data with R'  ORDER BY c.CreationDate DESC  LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*)  FROM posts  JOIN postTags ON posts.Id = postTags.PostId  JOIN tags ON postTags.TagId = tags.Id  WHERE tags.TagName = 'careers';	codebase_community
SELECT u.Reputation, p.ViewCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jarrod Dixon';	codebase_community
SELECT COUNT(*) AS TotalComments, SUM(CASE WHEN p.PostTypeId = 2 THEN 1 ELSE 0 END) AS TotalAnswers FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Clustering 1D data'	codebase_community
SELECT `CreationDate` FROM `users` WHERE `DisplayName` = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT      CAST((COUNT(p.Id) FILTER (WHERE p.Score >= 50 AND u.Reputation = (SELECT MAX(Reputation) FROM users))) AS REAL) * 100 / COUNT(p.Id) OVER () AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId  FROM tags  WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes  FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT p.Text FROM posts AS p JOIN postHistory AS ph ON p.Id = ph.PostId WHERE p.Title = 'How can I adapt ANOVA for binary data?' AND ph.Comment LIKE '%linear regression%';	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  ORDER BY c.Score DESC  LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age  FROM comments AS c  JOIN users AS u ON c.UserId = u.Id  WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(*)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score = 0 AND p.ViewCount < 5	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CommentCount = 1 AND EXISTS (     SELECT 1      FROM comments      WHERE comments.PostId = posts.Id AND Score = 0 )	codebase_community
SELECT COUNT(DISTINCT c.UserId)  FROM comments AS c  JOIN users AS u ON c.UserId = u.Id  WHERE c.Score = 0 AND u.Age = 40	codebase_community
SELECT P.Id AS PostID, C.Text AS CommentText FROM posts P JOIN comments C ON P.Id = C.PostId WHERE P.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT COALESCE(v.UpVotes, 0) AS UpVoteNumber FROM comments c JOIN users u ON c.UserId = u.Id JOIN votes v ON u.Id = v.UserId AND v.VoteTypeId = 2 WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT T2.UserDisplayName  FROM comments AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T1.Score BETWEEN 1 AND 5  AND T2.DownVotes = 0	codebase_community
SELECT CAST(COUNT(CASE WHEN `UpVotes` = 0 AND `Score` BETWEEN 5 AND 10 THEN `UserId` END) AS REAL) * 100 / COUNT(`UserId`) as Percentage FROM `comments` WHERE `Score` BETWEEN 5 AND 10	codebase_community
SELECT T3.power_name FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(*)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT T1.full_name  FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  GROUP BY T1.id  HAVING COUNT(T3.id) > 15	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue';	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*)  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  JOIN colour c ON ha.eye_colour_id = c.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE c.colour = 'Blue' AND a.attribute_name = 'Intelligence' AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON ha.attribute_value = c.id WHERE c.colour = 'Blue' AND a.attribute_name = 'Eye Colour' JOIN hero_attribute ha2 ON s.id = ha2.hero_id JOIN attribute a2 ON ha2.attribute_id = a2.id JOIN colour c2 ON ha2.attribute_value = c2.id WHERE c2.colour = 'Blond' AND a2.attribute_name = 'Hair Colour';	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id IN (     SELECT id      FROM publisher      WHERE publisher_name = 'Marvel Comics' );	superhero
SELECT full_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'  ORDER BY height_cm DESC  LIMIT 1;	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron'	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN attribute ON superhero.alignment_id = attribute.id  JOIN attribute AS attribute_eye ON superhero.eye_colour_id = attribute_eye.id  JOIN colour ON attribute_eye.colour = 'Blue'  WHERE publisher.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(T.superhero.id) AS average_height FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'	superhero
SELECT      (SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END) * 100.0 / COUNT(h.id)) AS percentage FROM      superhero h JOIN      hero_power hp ON h.id = hp.hero_id JOIN      superpower sp ON hp.power_id = sp.id JOIN      publisher p ON h.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'DC Comics';	superhero
SELECT T.publisher_name FROM (     SELECT S.publisher_id, G.publisher_name, H.attribute_value, A.attribute_name     FROM superhero AS H     JOIN attribute AS A ON H.attribute_id = A.id     JOIN superhero_publisher AS SP ON H.id = SP.hero_id     JOIN publisher AS P ON SP.publisher_id = P.id     WHERE A.attribute_name = 'Speed' ) AS T WHERE T.attribute_value = (SELECT MIN(attribute_value) FROM (     SELECT attribute_value     FROM superhero     WHERE attribute_name = 'Speed' )) ;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'	superhero
SELECT T.publisher_name  FROM superhero AS T  JOIN hero_attribute AS TA ON T.id = TA.hero_id  JOIN attribute AS A ON TA.attribute_id = A.id  JOIN attribute_value AS AV ON TA.attribute_value = AV.id  WHERE A.attribute_name = 'colour' AND AV.colour = 'Blue'  AND T.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond'	superhero
SELECT s.superhero_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence') ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT race.race  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE superhero.superhero_name = 'Copycat' AND attribute.attribute_name = 'Race';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Durability')  AND hero_attribute.attribute_value < 50;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND hero_attribute.attribute_value = 100;	superhero
SELECT T.superhero_name  FROM (     SELECT T1.superhero_name, COUNT(T2.power_id) as power_count     FROM superhero AS T1     JOIN hero_power AS T2 ON T1.id = T2.hero_id     GROUP BY T1.id     ORDER BY power_count DESC     LIMIT 1 ) AS T	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id IN (     SELECT id      FROM race      WHERE race = 'Vampire' ) AND publisher_id IN (     SELECT id      FROM publisher      WHERE publisher_name LIKE '%Marvel%' OR publisher_name LIKE '%DC%' ) AND alignment_id IN (     SELECT id      FROM alignment      WHERE alignment = 'Good' );	superhero
SELECT      CAST(SUM(CASE WHEN T.superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') AND T.superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T.superhero.id) FROM      superhero T JOIN      alignment A ON T.superhero.alignment_id = A.id JOIN      publisher P ON T.superhero.publisher_id = P.id WHERE      A.alignment = 'Bad' AND P.publisher_name = 'Marvel Comics';	superhero
SELECT ABS((SELECT COUNT(*) FROM superhero WHERE publisher_id IN      (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') AND alignment_id IS NOT NULL) -      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN      (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND alignment_id IS NOT NULL))	superhero
SELECT publisher_id FROM superhero WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(T1.attribute_value)  FROM hero_attribute AS T1	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.id = 75;	superhero
SELECT T3.power_name FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T1.superhero_name = 'Deathlok';	superhero
SELECT AVG(T.superhero_id.weight_kg)  FROM superhero AS T  JOIN gender ON T.gender_id = gender.id  WHERE gender.gender = 'Female'	superhero
SELECT sp.power_name FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id JOIN gender g ON s.gender_id = g.id JOIN superpower sp ON hp.power_id = sp.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT T1.superhero_name  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  JOIN attribute AS T3 ON T2.attribute_id = T3.id  WHERE T3.attribute_name = 'Intelligence' AND T1.height_cm BETWEEN 170 AND 190 AND T1.eye_colour_id = 1	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  WHERE hp.hero_id = 56;	superhero
SELECT full_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Demi-God'  LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')	superhero
SELECT T1.race  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  JOIN attribute AS T3 ON T2.attribute_id = T3.id  WHERE T3.attribute_name = 'weight_kg' AND T2.attribute_value = 169;	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.height_cm = 185 AND T2.race = 'human' LIMIT 1;	superhero
SELECT c.colour FROM (     SELECT s.skin_colour_id, MAX(s.weight_kg) AS max_weight     FROM superhero s     GROUP BY s.skin_colour_id ) AS max_weight_superheroes JOIN colour c ON max_weight_superheroes.skin_colour_id = c.id WHERE max_weight_superheroes.max_weight = (     SELECT MAX(weight_kg)     FROM superhero );	superhero
SELECT      (SUM(CASE WHEN s.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0 / COUNT(s.id)) AS percentage FROM      superhero s WHERE      s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.full_name FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' AND s.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT power_name  FROM superpower  JOIN hero_power ON superpower.id = hero_power.power_id  GROUP BY power_name  ORDER BY COUNT(*) DESC  LIMIT 1;	superhero
SELECT T2.attribute_value FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  WHERE T1.superhero_name = 'Abomination'	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.id = 1;	superhero
SELECT COUNT(*) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'stealth';	superhero
SELECT s.full_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (     SELECT a.id      FROM attribute a     JOIN hero_attribute ha2 ON a.id = ha2.attribute_id     WHERE a.attribute_name = 'strength'     ORDER BY ha2.attribute_value DESC     LIMIT 1 )	superhero
SELECT AVG(T.superhero_id) AS average_superheroes_no_skin_colour FROM (     SELECT superhero.id AS superhero_id     FROM superhero     JOIN colour ON superhero.skin_colour_id = colour.id     WHERE colour.id = 1 ) AS T;	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id IN (     SELECT id      FROM publisher      WHERE publisher_name = 'Dark Horse Comics' );	superhero
SELECT T.superhero_name FROM (     SELECT S.superhero_id, SUM(H.attribute_value) AS total_durability     FROM superhero S     JOIN hero_attribute HA ON S.id = HA.hero_id     JOIN attribute A ON HA.attribute_id = A.id     JOIN publisher P ON S.publisher_id = P.id     WHERE A.attribute_name = 'durability' AND P.publisher_name = 'Dark Horse Comics'     GROUP BY S.superhero_id ) AS T JOIN superhero S ON T.superhero_id = S.id ORDER BY total_durability DESC LIMIT 1;	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT DISTINCT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Flight'	superhero
SELECT      c.colour AS eye_colour,     d.colour AS hair_colour,     e.colour AS skin_colour FROM      superhero s JOIN      gender g ON s.gender_id = g.id JOIN      colour c ON s.eye_colour_id = c.id JOIN      colour d ON s.hair_colour_id = d.id JOIN      colour e ON s.skin_colour_id = e.id JOIN      publisher p ON s.publisher_id = p.id WHERE      g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics'	superhero
SELECT S.superhero_name, P.publisher_name FROM superhero S JOIN attribute A ON S.eye_colour_id = A.id AND S.hair_colour_id = A.id AND S.skin_colour_id = A.id JOIN attribute_value ASV ON A.id = ASV.attribute_id AND ASV.attribute_value IS NOT NULL JOIN attribute_value ASV2 ON ASV.attribute_id = ASV2.attribute_id AND ASV.attribute_value = ASV2.attribute_value JOIN attribute_value ASV3 ON ASV.attribute_id = ASV3.attribute_id AND ASV.attribute_value = ASV3.attribute_value JOIN publisher P ON S.publisher_id = P.id;	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'A-Bomb';	superhero
SELECT      CAST(SUM(CASE WHEN T1.colour = 'Blue' AND T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END)  FROM      colour AS T1  JOIN      superhero AS T2  ON      T1.id = T2.skin_colour_id;	superhero
SELECT superhero.superhero_name, race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.full_name = 'Charles Chandler';	superhero
SELECT g.gender  FROM gender g  JOIN superhero s ON g.id = s.gender_id  WHERE s.superhero_name = 'Agent 13'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM hero_power  WHERE hero_id IN (     SELECT id      FROM superhero      WHERE superhero_name = 'Amazo' )	superhero
SELECT T3.power_name FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T1.full_name = 'Hunter Zolomon';	superhero
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT DISTINCT superhero.superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN colour ON hero_attribute.attribute_value = colour.id  WHERE attribute.attribute_name = 'Eye Colour' AND colour.colour = 'Black' AND hero_attribute.attribute_name = 'Hair Colour' AND colour.colour = 'Black';	superhero
SELECT c.colour  FROM colour AS c  JOIN superhero AS s ON c.id = s.skin_colour_id  WHERE c.colour = 'Gold'	superhero
SELECT full_name  FROM superhero  WHERE race = 'Vampire';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_attribute WHERE attribute_name = 'Strength' AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Strength');	superhero
SELECT T1.race, T2.alignment FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T1.superhero_name = 'Cameron Hicks';	superhero
SELECT      CAST(SUM(CASE WHEN T1.gender = 'Female' AND T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 END)  FROM      superhero AS T1  JOIN      publisher AS T2  ON      T1.publisher_id = T2.id  WHERE      T1.gender = 'Female';	superhero
SELECT AVG(T.superhero_id) AS average_weight FROM superhero T JOIN publisher P ON T.publisher_id = P.id JOIN alignment A ON T.alignment_id = A.id WHERE P.publisher_name LIKE '%Alien%' OR A.alignment LIKE '%Alien%' AND T.race_id IN (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT      (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') -      (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler')	superhero
SELECT superhero.superhero_name, AVG(superhero.height_cm) AS average_height FROM superhero GROUP BY superhero.superhero_name;	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination'	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  JOIN gender ON superhero.gender_id = gender.id  WHERE race.id = 21 AND gender.id = 1	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed') ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE alignment_id = 3;	superhero
SELECT T1.attribute_name, T2.attribute_value FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T3.id = T2.hero_id WHERE T3.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN attribute_value av ON ha.attribute_value = av.value_id JOIN colour c ON s.eye_colour_id = c.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE a.attribute_name = 'Eye Colour' AND c.colour = 'Blue' AND a.attribute_name = 'Hair Colour' AND c2.colour = 'Brown';	superhero
SELECT T.publisher_name  FROM superhero AS T  WHERE T.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      CAST(COUNT(CASE WHEN t1.eye_colour_id = 7 THEN 1 END) AS REAL) * 100 / COUNT(t1.id)  FROM      superhero t1	superhero
SELECT      (SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) * 1.0) /      (SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END)) AS ratio FROM      superhero;	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT power_id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.full_name = 'Helen Parr';	superhero
SELECT T1.race  FROM superhero AS T1  JOIN alignment AS T2 ON T1.alignment_id = T2.id  WHERE T1.weight_kg = 108 AND T1.height_cm = 188	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38;	superhero
SELECT T3.race  FROM (     SELECT T1.hero_id, T2.attribute_value, T3.race      FROM (         SELECT hero_id, MAX(attribute_value) as max_value          FROM hero_attribute          GROUP BY hero_id     ) AS T1      JOIN hero_attribute AS T2 ON T1.hero_id = T2.hero_id AND T1.max_value = T2.attribute_value      JOIN superhero AS T3 ON T2.hero_id = T3.id ) AS T4	superhero
SELECT T1.alignment, T3.power_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN hero_power AS T4 ON T1.id = T4.hero_id JOIN superpower AS T3 ON T4.power_id = T3.id WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  JOIN (     SELECT id FROM colour WHERE colour = 'Blue' ) c ON ha.attribute_id = c.id  WHERE a.attribute_name = 'Eye Colour' AND c.id = ha.attribute_value  LIMIT 5;	superhero
SELECT AVG(T2.attribute_value)  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  JOIN alignment AS T3 ON T1.alignment_id = T3.id  WHERE T3.alignment = 'Neutral'	superhero
SELECT c.colour  FROM colour AS c  JOIN superhero AS s ON c.id = s.skin_colour_id  JOIN hero_attribute AS ha ON s.id = ha.hero_id  WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence') AND ha.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN gender ON superhero.gender_id = gender.id  WHERE alignment.id = 1 AND gender.id = 2;	superhero
SELECT DISTINCT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80;	superhero
SELECT r.race  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE g.gender = 'male' AND c.colour = 'blue'	superhero
SELECT      CAST(SUM(CASE WHEN s.gender_id = 2 AND a.alignment_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN a.alignment_id = 2 THEN 1 END)  FROM      superhero s  JOIN      alignment a ON s.alignment_id = a.id  JOIN      gender g ON s.gender_id = g.id  WHERE      a.id = 2	superhero
SELECT      (SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END))  FROM      superhero AS T1  JOIN      colour AS T2 ON T1.eye_colour_id = T2.id  WHERE      T1.weight_kg = 0 OR T1.weight_kg IS NULL	superhero
SELECT attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = 'Hulk' AND attribute.attribute_name = 'Strength'	superhero
SELECT T2.power_name  FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  WHERE T1.superhero_name = 'Ajax';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id IN (     SELECT id      FROM gender      WHERE gender = 'Female' )  AND publisher_id IN (     SELECT id      FROM publisher      WHERE publisher_name = 'Marvel Comics' )	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;	superhero
SELECT T1.gender  FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T3.power_name = 'Phoenix Force'	superhero
SELECT superhero_name FROM superhero WHERE publisher_id IN (     SELECT id     FROM publisher     WHERE publisher_name = 'DC Comics' ) ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(T.superhero.id)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN race ON superhero.race_id = race.id  WHERE publisher.publisher_name = 'Dark Horse Comics' AND race.race != 'Human' AND alignment.alignment = 'Non-human'	superhero
SELECT superhero_name  FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed') AND hero_attribute.attribute_value = 100 ORDER BY superhero_name;	superhero
SELECT      (SUM(CASE WHEN T.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') THEN 1 ELSE 0 END) -      SUM(CASE WHEN T.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE 0 END)) AS difference FROM superhero T	superhero
SELECT T3.attribute_name FROM (     SELECT T2.attribute_value, T1.attribute_id     FROM hero_attribute AS T1     JOIN attribute AS T2 ON T1.attribute_id = T2.id     WHERE T1.hero_id IN (         SELECT id         FROM superhero         WHERE superhero_name = 'Black Panther'     ) ) AS T3 JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T3.attribute_value = (     SELECT MIN(T3.attribute_value)     FROM (         SELECT T2.attribute_value, T1.attribute_id         FROM hero_attribute AS T1         JOIN attribute AS T2 ON T1.attribute_id = T2.id         WHERE T1.hero_id IN (             SELECT id             FROM superhero             WHERE superhero_name = 'Black Panther'         )     ) AS T3 )	superhero
SELECT c.colour FROM colour c JOIN hero_attribute ha ON c.id = ha.eye_colour_id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination'	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      CAST(SUM(CASE WHEN T.superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND T.publisher.publisher_name = 'George Lucas' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T.publisher.publisher_name = 'George Lucas' THEN 1 END) AS PercentageFemaleSuperheroes FROM      superhero AS T JOIN      publisher AS P ON T.publisher_id = P.id	superhero
SELECT      CAST(SUM(CASE WHEN T.superhero.alignment_id = (SELECT id FROM T.alignment WHERE alignment = 'Good') AND T.publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T.publisher.publisher_name = 'Marvel Comics' THEN 1 END) AS PercentageGoodSuperheroes FROM      T_superhero AS T JOIN      T_publisher AS P ON T.publisher_id = P.id JOIN      T_alignment AS A ON T.alignment_id = A.id WHERE      P.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT T1.full_name  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  JOIN attribute AS T3 ON T2.attribute_id = T3.id  JOIN attribute_value AS T4 ON T2.attribute_value = T4.value  JOIN colour AS T5 ON T4.colour_id = T5.id  WHERE T5.colour = 'Brown' AND T1.weight_kg < 100;	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy'	superhero
SELECT T1.weight_kg, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT superhero.id AS hero_id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN attribute ON superhero.alignment_id = attribute.id WHERE attribute.attribute_name = 'Intelligence'	superhero
SELECT colour.colour FROM colour JOIN superhero ON colour.id = superhero.eye_colour_id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Blackwulf' AND alignment.alignment = 'Good';	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero h ON hp.hero_id = h.id  WHERE h.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT T2.driverRef FROM races AS T1 JOIN qualifying AS T2 ON T1.raceId = T2.raceId WHERE T1.raceId = 18 AND T2.position < 5 ORDER BY T2.q1 DESC LIMIT 1 OFFSET 4;	formula_1
SELECT T1.surname  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN qualifying AS T3 ON T2.driverId = T3.driverId AND T2.raceId = T3.raceId  WHERE T2.raceId = 19 AND T3.q2 IS NOT NULL AND T3.q2 = (     SELECT MIN(q2)      FROM qualifying      WHERE raceId = 19 )	formula_1
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = 'Shanghai';	formula_1
SELECT `url` FROM circuits WHERE `name` = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Germany'	formula_1
SELECT T1.position FROM `driverStandings` AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T3.constructorId = T2.constructorId WHERE T3.name = 'Renault' ORDER BY T1.position ASC	formula_1
SELECT COUNT(*)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2010 AND c.country NOT IN ('Asia', 'Europe')	formula_1
SELECT T2.name FROM `races` AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Spain'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Australian Grand Prix';	formula_1
SELECT T2.name, T2.url  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit';	formula_1
SELECT lat, lng  FROM circuits  WHERE name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T2.country  FROM constructors AS T1  JOIN constructorstandings AS T2 ON T1.constructorId = T2.constructorId  JOIN races AS T3 ON T2.raceId = T3.raceId  WHERE T3.round = 24 AND T2.points = 1	formula_1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId = (SELECT driverId FROM drivers WHERE surname = 'Senna' AND forename = 'Bruno')	formula_1
SELECT T3.nationality  FROM qualifying AS T1  JOIN drivers AS T3 ON T1.driverId = T3.driverId  WHERE T1.q2 = '0:01:40' AND T1.raceId = 355	formula_1
SELECT T1.number  FROM drivers AS T1  JOIN qualifying AS T2 ON T1.driverId = T2.driverId  WHERE T2.time = '0:01:54' AND T2.position = 3 AND T2.raceId = 903	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE name = 'Bahrain Grand Prix' AND year = 2007 ) AND time IS NOT NULL	formula_1
SELECT T2.url  FROM races AS T1  JOIN seasons AS T2 ON T1.year = T2.year  WHERE T1.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE year = 2015 AND date = '2015-11-29' )	formula_1
SELECT T2.forename, T2.surname FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.raceId = 592 AND T2.time IS NOT NULL ORDER BY T3.dob ASC LIMIT 1;	formula_1
SELECT T1.forename, T1.surname, T1.url  FROM drivers AS T1  JOIN lapTimes AS T2 ON T1.driverId = T2.driverId  WHERE T2.lap = 1 AND T2.raceId = 161 AND T2.time = '0:01:27';	formula_1
SELECT T3.nationality  FROM results AS T1  JOIN drivers AS T3 ON T1.driverId = T3.driverId  WHERE T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933)	formula_1
SELECT location, lat, lng FROM circuits WHERE name = 'Sepang International Circuit';	formula_1
SELECT T2.url  FROM constructorStandings AS T1  JOIN constructors AS T2 ON T1.constructorId = T2.constructorId  WHERE T1.raceId = 9  ORDER BY T1.points DESC  LIMIT 1	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'di Grassi' AND forename = 'Lucas') AND raceId = 345;	formula_1
SELECT `nationality`  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.raceId = 347 AND results.q2 = '0:01:15';	formula_1
SELECT T2.code  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  JOIN qualifying AS T3 ON T2.driverId = T3.driverId AND T1.raceId = T3.raceId  WHERE T1.raceId = 45 AND T3.q3 = '01:33'  LIMIT 1	formula_1
SELECT `time` FROM `results` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `forename` = 'Bruce' AND `surname` = 'McLaren') AND `raceId` = 743;	formula_1
SELECT      d.forename || ' ' || d.surname AS full_name,     r.position FROM      races AS r JOIN      results AS res ON r.raceId = res.raceId JOIN      drivers AS d ON res.driverId = d.driverId WHERE      r.year = 2006 AND r.name = 'San Marino Grand Prix' AND res.position = 2;	formula_1
SELECT T2.url FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE date = '2015-11-29' )	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 872 AND T1.time IS NOT NULL ORDER BY T2.dob DESC LIMIT 1;	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 348 ORDER BY T1.fastestLapTime ASC LIMIT 1	formula_1
SELECT T2.nationality  FROM results AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T1.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)      FROM results  )	formula_1
SELECT      CAST((CAST(SUBSTR(`fastestLapSpeed`, 1, INSTR(`fastestLapSpeed`, '.') - 1) AS REAL) -            CAST(SUBSTR(`fastestLapSpeed`, 1, INSTR(`fastestLapSpeed`, '.') - 1, 854) AS REAL) -            CAST(SUBSTR(`fastestLapSpeed`, 1, INSTR(`fastestLapSpeed`, '.') - 1, 853) AS REAL) * 100.0 /            CAST(SUBSTR(`fastestLapSpeed`, 1, INSTR(`fastestLapSpeed`, '.') - 1, 853) AS REAL) AS DECIMAL(5, 2)) FROM      races JOIN      results ON races.raceId = results.raceId WHERE      results.driverId = (SELECT driverId FROM drivers WHERE surname = 'di Resta' AND forename = 'Paul') AND      races.raceId IN (853, 854) ORDER BY      races.raceId ASC, results.position ASC LIMIT 1	formula_1
SELECT      COUNT(DRIVERID) FILTER (WHERE TIME IS NOT NULL AND DATE = '1983-07-16') AS race_completed,     COUNT(DRIVERID) FILTER (WHERE DATE = '1983-07-16') AS total_participants,     CAST(COUNT(DRIVERID) FILTER (WHERE TIME IS NOT NULL AND DATE = '1983-07-16') AS REAL) / COUNT(DRIVERID) FILTER (WHERE DATE = '1983-07-16') * 100 AS completion_rate FROM      RACES WHERE      DATE = '1983-07-16';	formula_1
SELECT year FROM races WHERE name = 'Singapore Grand Prix' ORDER BY year ASC LIMIT 1;	formula_1
SELECT COUNT(*) AS race_count, name  FROM races  WHERE year = 2005  ORDER BY name DESC;	formula_1
SELECT r1.name  FROM races r1 JOIN (     SELECT min(date) as min_date     FROM races ) r_min ON r1.date = r_min.min_date WHERE YEAR(r1.date) = YEAR(r_min.min_date) AND MONTH(r1.date) = MONTH(r_min.min_date)	formula_1
SELECT name, date  FROM races  WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999)	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT DISTINCT r.name  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2017  AND r.date NOT IN (     SELECT s.date      FROM races r2      JOIN circuits c2 ON r2.circuitId = c2.circuitId      JOIN seasons s ON r2.year = s.year      WHERE s.year = 2000 )	formula_1
SELECT T1.country, T1.name, T1.location  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  WHERE T2.year = (SELECT MIN(YEAR) FROM races WHERE name LIKE '%European Grand Prix%')  AND T2.name LIKE '%European Grand Prix%'  LIMIT 1;	formula_1
SELECT MAX(`year`) FROM `races` WHERE `name` = 'British Grand Prix' AND `circuitId` IN (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Brands Hatch');	formula_1
SELECT COUNT(*)  FROM circuits AS c  JOIN races AS r ON c.circuitId = r.circuitId  WHERE c.name = 'Silverstone International Circuit' AND r.name = 'British Grand Prix' AND r.country = 'United Kingdom';	formula_1
SELECT T3.forename, T3.surname, T5.position FROM races AS T1 JOIN results AS T5 ON T1.raceId = T5.raceId JOIN drivers AS T3 ON T5.driverId = T3.driverId WHERE T1.year = 2010 AND T1.name = 'Singapore Grand Prix' ORDER BY T5.position;	formula_1
SELECT T1.forename, T1.surname, T2.points  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T2.points = (SELECT MAX(points) FROM results)	formula_1
SELECT d.forename, d.surname, r.points  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races rs ON r.raceId = rs.raceId  WHERE rs.year = 2017 AND rs.name = 'Chinese Grand Prix'  ORDER BY r.points DESC  LIMIT 3;	formula_1
SELECT D.forename, R.name AS race_name FROM drivers D JOIN results R ON D.driverId = R.driverId JOIN races RS ON R.raceId = RS.raceId WHERE R.fastestLapTime IS NOT NULL ORDER BY R.fastestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(T3.milliseconds) AS AverageLapTime FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN lap_times AS T3 ON T2.raceId = T3.raceId AND T1.driverId = T3.driverId WHERE T1.forename = 'Sebastian' AND T1.surname = 'Vettel' AND T2.year = 2009 AND T2.name = 'Chinese Grand Prix'	formula_1
SELECT      COUNT(CASE WHEN T1.position > 1 THEN 1 ELSE NULL END) * 100.0 / COUNT(*) AS percentage FROM      races AS T1 JOIN      results AS T2 ON T1.raceId = T2.raceId JOIN      drivers AS T3 ON T2.driverId = T3.driverId WHERE      T3.surname = 'Hamilton' AND T1.year >= 2010	formula_1
SELECT      d.surname AS DriverName,     d.nationality AS Nationality,     AVG(r.points) AS AveragePoints FROM      drivers d JOIN      driverstandings ds ON d.driverId = ds.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      ds.wins = (SELECT MAX(wins) FROM driverstandings) GROUP BY      d.driverId LIMIT 1;	formula_1
SELECT      MAX(T1.dob) AS youngest_dob,     T1.forename,     T1.surname FROM      drivers AS T1 WHERE      T1.nationality = 'Japanese' AND     EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM T1.dob) + 1 = (SELECT MIN(YEAR) FROM seasons) + 1;	formula_1
SELECT DISTINCT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.year BETWEEN 1990 AND 2000  GROUP BY c.circuitId  HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT races.name AS RaceName, circuits.name AS CircuitName, circuits.location AS Location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE year = 2005 AND month(races.date) = 9;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Yoong' AND res.position < 10	formula_1
SELECT COUNT(*)  FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE r.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit') AND d.surname = 'Schumacher' AND res.position = 1	formula_1
SELECT races.name, races.year  FROM races  JOIN results ON races.raceId = results.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.surname = 'Schumacher' AND drivers.forename = 'Michael' AND results.fastestLap IS NOT NULL;	formula_1
SELECT AVG(T2.points)  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T1.surname = 'Irvine' AND T2.year = 2000	formula_1
SELECT      races.name AS first_race,     results.points AS points_for_first_race FROM      drivers JOIN      results ON drivers.driverId = results.driverId JOIN      races ON results.raceId = races.raceId WHERE      drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY      races.year ASC LIMIT 1;	formula_1
SELECT races.name, circuits.country  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.year = 2017  ORDER BY races.date;	formula_1
SELECT races.name, races.year, circuits.location  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  ORDER BY races.laps DESC  LIMIT 1;	formula_1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  WHERE T2.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT `name` FROM circuits WHERE `lat` IN (SELECT MAX(`lat`) FROM circuits WHERE `name` IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'))	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT T2.nationality FROM drivers AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT surname FROM drivers WHERE nationality = 'italian';	formula_1
SELECT url FROM drivers WHERE surname = 'Davidson' AND forename = 'Anthony';	formula_1
SELECT surname || ', ' || forename AS reference_name  FROM drivers  WHERE surname = 'Hamilton' AND forename = 'Lewis';	formula_1
SELECT T2.name FROM `races` AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix';	formula_1
SELECT T2.year  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  WHERE T1.name = 'Silverstone Circuit'	formula_1
SELECT races.name, circuits.url  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT `time` FROM races WHERE year BETWEEN 2010 AND 2019 AND name = 'Abu Dhabi Grand Prix' AND circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Abu Dhabi International Circuit')	formula_1
SELECT COUNT(*) FROM races WHERE circuitId IN (     SELECT circuitId FROM circuits WHERE country = 'Italy' );	formula_1
SELECT DISTINCT T2.date  FROM circuits AS T1  JOIN races AS T2  ON T1.circuitId = T2.circuitId  WHERE T1.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya' AND year = 2009;	formula_1
SELECT MIN(T.fastestLapTime)  FROM results AS T  JOIN drivers AS D ON T.driverId = D.driverId  WHERE D.forename = 'Lewis' AND D.surname = 'Hamilton'	formula_1
SELECT forename, surname FROM drivers WHERE driverId IN (SELECT driverId FROM results WHERE fastestLapSpeed IS NOT NULL ORDER BY fastestLapSpeed DESC LIMIT 1)	formula_1
SELECT `drivers.driverRef`  FROM `results`  JOIN `drivers` ON `results.driverId` = `drivers.driverId`  WHERE `results.raceId` IN (     SELECT `races.raceId`      FROM `races`      WHERE `races.name` = 'Australian Grand Prix' AND `races.year` = 2008 )  ORDER BY `results.position` ASC  LIMIT 1;	formula_1
SELECT T2.name FROM `drivers` AS T1 JOIN races AS T2 ON T1.driverId = T2.driverStandingsId WHERE T1.surname = 'Hamilton' AND T1.forename = 'Lewis'	formula_1
SELECT raceId FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton') ORDER BY rank LIMIT 1	formula_1
SELECT MAX(T2.fastestLapSpeed)  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT T2.year FROM drivers AS T1 JOIN races AS T2 ON T1.driverId = T4.driverId JOIN results AS T4 ON T2.raceId = T4.raceId WHERE T1.surname = 'Hamilton' AND T1.forename = 'Lewis'	formula_1
SELECT positionOrder  FROM results  WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis')  AND raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008);	formula_1
SELECT forename, surname  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE year = 2008 AND raceName = 'Australian Grand Prix' AND grid = 4;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL	formula_1
SELECT fastestLapTime FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND year = 2008 AND name = 'Australian Grand Prix';	formula_1
SELECT T2.time  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.position = 2	formula_1
SELECT      d.forename, d.surname, c.url FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races rs ON r.raceId = rs.raceId JOIN      constructors c ON r.constructorId = c.constructorId WHERE      rs.year = 2008 AND rs.name = 'Australian Grand Prix' AND r.position = 1;	formula_1
SELECT COUNT(*)  FROM drivers  JOIN races ON drivers.driverId = results.driverId  JOIN results ON races.raceId = results.raceId  WHERE drivers.nationality = 'American' AND races.year = 2008 AND races.name = 'Australian Grand Prix'	formula_1
SELECT COUNT(*)  FROM (     SELECT DISTINCT driverId      FROM results      WHERE raceId IN (         SELECT raceId          FROM races          WHERE year = 2008 AND name = 'Australian Grand Prix'     ) ) AS driver_list JOIN (     SELECT driverId      FROM results      WHERE time IS NOT NULL ) AS finished_drivers ON driver_list.driverId = finished_drivers.driverId	formula_1
SELECT SUM(T3.points)  FROM drivers AS T1  JOIN results AS T3 ON T1.driverId = T3.driverId  WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT AVG(STRFTIME('%s', fastestLapTime)) AS avg_fastest_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT CAST(COUNT(CASE WHEN T1.time IS NOT NULL THEN 1 END) AS REAL) / COUNT(*) AS completion_rate FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix';	formula_1
SELECT      ((SUM(CASE WHEN t1.position = 1 THEN CAST(SUBSTR(t1.time, 1, INSTR(t1.time, '.') - 1) AS REAL) END) + SUM(CASE WHEN t1.position = (SELECT COUNT(*) FROM races r JOIN results res ON r.raceId = res.raceId WHERE r.year = 2008 AND r.name = 'Australian Grand Prix') THEN CAST(SUBSTR(t1.time, 1, INSTR(t1.time, '.') - 1) AS REAL) END) - SUM(CASE WHEN t1.position = 1 THEN CAST(SUBSTR(t1.time, 1, INSTR(t1.time, '.') - 1) AS REAL) END)) / SUM(CASE WHEN t1.position = 1 THEN CAST(SUBSTR(t1.time, 1, INSTR(t1.time, '.') - 1) AS REAL) END)) * 100 AS percentage_faster FROM      (SELECT          raceId,          MAX(position) AS position,          MAX(time) AS time      FROM          results      WHERE          year = 2008 AND name = 'Australian Grand Prix') t1 JOIN      results t2 ON t1.raceId = t2.raceId AND t1.position = t2.position WHERE      t2.position = (SELECT COUNT(*) FROM races r JOIN results res ON r.raceId = res.raceId WHERE r.year = 2008 AND r.name = 'Australian Grand Prix')	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Melbourne' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01'	formula_1
SELECT AVG(T1.points)  FROM constructors AS T1  JOIN constructorstandings AS T2 ON T1.constructorId = T2.constructorId  WHERE T1.nationality = 'British'	formula_1
SELECT name FROM constructors WHERE constructorId = (SELECT constructorId FROM constructorStandings ORDER BY points DESC LIMIT 1)	formula_1
SELECT T2.name  FROM constructorResults AS T1  JOIN constructors AS T2 ON T1.constructorId = T2.constructorId  JOIN races AS T3 ON T3.raceId = T1.raceId  WHERE T3.raceId = 291 AND T1.points = 0	formula_1
SELECT COUNT(*)  FROM constructors  JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructors.nationality = 'Japanese' AND constructorResults.points = 0 AND COUNT(constructorResults.raceId) = 2;	formula_1
SELECT DISTINCT T1.name FROM constructors AS T1 JOIN constructorstandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1;	formula_1
SELECT COUNT(*)  FROM constructors  JOIN results ON constructors.constructorId = results.constructorId  JOIN races ON results.raceId = races.raceId  WHERE constructors.nationality = 'French' AND results.laps > 50;	formula_1
SELECT      COUNT(CASE WHEN T2.time IS NOT NULL AND T1.year BETWEEN 2007 AND 2009 THEN 1 END) * 100.0 / COUNT(*) AS race_completion_percentage FROM     seasons AS T1 JOIN     races AS T2 ON T1.year = T2.year JOIN     drivers AS T3 ON T3.driverId = T2.driverId WHERE     T3.nationality = 'Japanese';	formula_1
SELECT AVG(STRFTIME('%S', `time`) + STRFTIME('%%S', `time` / 1000) / 1000) AS average_time_seconds FROM `results` WHERE `position` = 1 AND `statusId` = (SELECT `statusId` FROM `status` WHERE `status` = 'Finished')	formula_1
SELECT `forename`, `surname`  FROM `drivers`  WHERE `dob` > '1975-01-01' AND `driverStandings`.`position` = 2;	formula_1
SELECT COUNT(*)  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE drivers.nationality = 'Italian' AND results.time IS NULL;	formula_1
SELECT `forename`, `surname` FROM `drivers` WHERE `driverId` IN (SELECT `driverId` FROM `results` WHERE `fastestLapTime` IS NOT NULL ORDER BY `fastestLapTime` ASC LIMIT 1)	formula_1
SELECT T3.fastestLap FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T3.constructorId = T2.constructorId WHERE T1.year = 2009 AND T3.name = 'champion' LIMIT 1	formula_1
SELECT AVG(T2.fastestLapSpeed)  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'	formula_1
SELECT T2.name, T1.year  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T2milliseconds IS NOT NULL  ORDER BY T2milliseconds ASC  LIMIT 1;	formula_1
SELECT      COUNT(CASE WHEN T1.dob < '1985-01-01' AND T2.laps > 50 THEN T1.driverId ELSE NULL END) * 100.0 / COUNT(T1.driverId) AS percentage FROM      drivers AS T1 JOIN      results AS T2 ON T1.driverId = T2.driverId WHERE      T2.year BETWEEN 2000 AND 2005	formula_1
SELECT COUNT(*)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races rs ON r.raceId = rs.raceId JOIN circuits c ON rs.circuitId = c.circuitId WHERE d.nationality = 'French' AND r.laps < 120	formula_1
SELECT `code` FROM drivers WHERE `nationality` = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT COUNT(*)  FROM (     SELECT T.driverId, T.yearOfBirth     FROM drivers AS T     WHERE T.nationality = 'Netherlands'     ORDER BY T.yearOfBirth ASC     LIMIT 3 ) AS Subquery	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Kubica' AND forename = 'Robert';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'Australian' AND dob LIKE '1980-%'	formula_1
SELECT driverId, surname, dob, MIN(time)  FROM drivers  JOIN lapTimes ON drivers.driverId = lapTimes.driverId  WHERE nationality = 'German'  AND dob BETWEEN '1980-01-01' AND '1990-12-31'  ORDER BY MIN(time) ASC  LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'Germany' ORDER BY dob ASC LIMIT 1;	formula_1
SELECT driverId, code  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE year(dob) = 1971 AND fastestLapTime IS NOT NULL	formula_1
SELECT d.driverId, d.forename, d.surname  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races rs ON r.raceId = rs.raceId WHERE d.nationality = 'Spain' AND d.dob < '1982-01-01' ORDER BY rs.year DESC, r.laps DESC, r.position LIMIT 10	formula_1
SELECT T1.year FROM `races` AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL GROUP BY T1.year ORDER BY MIN(T2.fastestLapTime) DESC LIMIT 1	formula_1
SELECT year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE milliseconds = (SELECT MAX(milliseconds) FROM lapTimes) GROUP BY year;	formula_1
SELECT T2.driverId  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.round = 1  ORDER BY T2.time  LIMIT 5	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId BETWEEN 50 AND 100  AND statusId = 2  AND time IS NOT NULL	formula_1
SELECT COUNT(*) AS count, location, lat, lng  FROM circuits  WHERE country = 'Austria'	formula_1
SELECT raceId, COUNT(*) AS num_finishers FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY num_finishers DESC LIMIT 1;	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL	formula_1
SELECT T1.year, T2.forename, T2.surname, T3.date, T3.time  FROM seasons AS T1  JOIN races AS T3 ON T1.year = T3.year  JOIN results AS T4 ON T3.raceId = T4.raceId  JOIN drivers AS T2 ON T4.driverId = T2.driverId  WHERE T2.dob = (SELECT MIN(dob) FROM drivers)  AND T4.position = 1  ORDER BY T1.year ASC  LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'American' AND EXISTS (     SELECT 1 FROM results WHERE drivers.driverId = results.driverId AND statusId = 2 )	formula_1
SELECT c.name, c.url  FROM constructors c  JOIN constructorstandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1;	formula_1
SELECT T2.url  FROM constructors AS T1  JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId  WHERE T2.wins = (SELECT MAX(wins) FROM constructorStandings)	formula_1
SELECT T1.forename, T1.surname  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN races AS T3 ON T2.raceId = T3.raceId  WHERE T3.name = 'French Grand Prix' AND T2.lap = 3  ORDER BY T2.time DESC  LIMIT 1;	formula_1
SELECT T1.time, T1milliseconds FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.fastestLap = 1 ORDER BY T1milliseconds ASC LIMIT 1	formula_1
SELECT AVG(T1.fastestLapTime)  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  JOIN circuits AS T3 ON T2.circuitId = T3.circuitId  WHERE T2.year = 2006 AND T2.name = 'United States Grand Prix' AND T1.rank <= 10	formula_1
SELECT      d.driverId,     d.forename,     d.surname,     AVG(p.duration) AS avg_pit_stop_duration FROM      drivers d JOIN      pit_stops p ON d.driverId = p.driverId WHERE      d.nationality = 'German'     AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY      d.driverId,     d.forename,     d.surname ORDER BY      avg_pit_stop_duration ASC LIMIT 5;	formula_1
SELECT T1.forename, T1.surname, T2.time  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T2.raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix' AND year = 2008)  AND T2.position = 1;	formula_1
SELECT T3.constructorRef, T3.url  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  JOIN constructors AS T3 ON T2.constructorId = T3.constructorId  WHERE T1.name = 'Singapore Grand Prix' AND T1.year = 2009  ORDER BY T1.time  LIMIT 1	formula_1
SELECT      forename,      surname,      dob  FROM      drivers  WHERE      nationality = 'Austria' AND      year(dob) BETWEEN 1981 AND 1991;	formula_1
SELECT      forename + ' ' + surname AS full_name,     url AS wiki_page_link,     dob FROM      drivers WHERE      nationality = 'German' AND      year(dob) BETWEEN 1971 AND 1985 ORDER BY      dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT      T2.points,      T1.name,      T1.nationality  FROM      constructors AS T1  JOIN      constructorStandings AS T2 ON T1.constructorId = T2.constructorId  JOIN      races AS T3 ON T2.raceId = T3.raceId  WHERE      T3.name = 'Monaco Grand Prix' AND      T3.year BETWEEN 1980 AND 2010  ORDER BY      T2.points DESC  LIMIT 1;	formula_1
SELECT AVG(T3.points)  FROM races AS T1  JOIN results AS T3 ON T1.raceId = T3.raceId  JOIN drivers AS T2 ON T3.driverId = T2.driverId  WHERE T1.name = 'Turkish Grand Prix' AND T2.surname = 'Hamilton'	formula_1
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM (     SELECT year, COUNT(raceId) AS race_count     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31'     GROUP BY year ) AS subquery	formula_1
SELECT nationality  FROM drivers  WHERE nationality IS NOT NULL  GROUP BY nationality  HAVING COUNT(*) > (SELECT COUNT(*) * 0.9 FROM drivers)  LIMIT 1;	formula_1
SELECT SUM(results.points) FROM results WHERE results.rank = 91 AND results.wins > 0	formula_1
SELECT T1.name  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  JOIN results AS T3 ON T2.raceId = T3.raceId  WHERE T3.fastestLapSpeed IS NOT NULL  ORDER BY T3.fastestLapSpeed ASC  LIMIT 1	formula_1
SELECT T1.location, T1.country  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  WHERE T2.date = (SELECT MAX(date) FROM races)	formula_1
SELECT T1.forename, T1.surname  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN races AS T3 ON T2.raceId = T3.raceId  JOIN circuits AS T4 ON T3.circuitId = T4.circuitId  JOIN qualifying AS T5 ON T2.qualifyId = T5.qualifyId  WHERE T3.year = 2008 AND T3.round = 3 AND T4.name = 'Marina Bay Street Circuit' AND T5.position = (SELECT MIN(position) FROM qualifying WHERE raceId = T3.raceId AND year = 2008 AND round = 3)	formula_1
SELECT      T1.forename || ' ' || T1.surname AS full_name,     T1.nationality,     T2.name AS first_race FROM      drivers AS T1 JOIN      races AS T2 ON T1.driverId = T2.driverId WHERE      T1.dob = (SELECT MAX(dob) FROM drivers) ORDER BY      T2.year DESC LIMIT 1;	formula_1
SELECT COUNT(*)  FROM (     SELECT driverId, COUNT(*) AS accidents      FROM pitStops      WHERE raceId IN (         SELECT raceId          FROM races          WHERE name = 'Canadian Grand Prix'     )      AND statusId = 3      GROUP BY driverId      ORDER BY accidents DESC      LIMIT 1 ) AS topAccidentsDriver	formula_1
SELECT T2.forename, T2.surname  FROM drivers AS T2  JOIN (     SELECT driverId, COUNT(*) AS wins      FROM results      GROUP BY driverId      HAVING wins > 0 ) AS T1 ON T2.driverId = T1.driverId  WHERE T2.dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT MAX(`duration`) AS longest_pit_stop_time FROM pitStops	formula_1
SELECT time FROM lapTimes ORDER BY milliseconds ASC LIMIT 1	formula_1
SELECT MAX(`duration`)  FROM pitStops  WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis')	formula_1
SELECT lap FROM pitStops WHERE raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix') AND driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis');	formula_1
SELECT T2.time, T2.duration FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2011 AND T1.name = 'Australian Grand Prix' ORDER BY T2.driverId, T2.stop;	formula_1
SELECT MIN(time) AS lap_record FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT `surname`, `forename`  FROM drivers  JOIN lapTimes ON drivers.driverId = lapTimes.driverId  WHERE milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT T1.position FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis') AND T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime ASC LIMIT 1	formula_1
SELECT T1.time  FROM races AS T1  JOIN circuits AS T2 ON T1.circuitId = T2.circuitId  WHERE T2.name = 'Austrian Grand Prix'  ORDER BY T1.time LIMIT 1;	formula_1
SELECT c.name, MIN(q.time) AS lap_record FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN qualifying q ON r.raceId = q.raceId WHERE c.country = 'Italy' GROUP BY c.name;	formula_1
SELECT T1.name AS race_name, T2.time AS lap_record_time FROM races AS T1 JOIN laptimes AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T3.name = 'Austrian Grand Prix' AND T2.lap = 1;	formula_1
SELECT T3.duration FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN pitStops AS T3 ON T2.driverId = T3.driverId AND T1.raceId = T3.raceId WHERE T1.name = 'Austrian Grand Prix' AND T2.position IS NOT NULL AND T2.time = (     SELECT MIN(T2.time)     FROM races AS T1     JOIN results AS T2 ON T1.raceId = T2.raceId     WHERE T1.name = 'Austrian Grand Prix' )	formula_1
SELECT lat, lng  FROM circuits  WHERE name IN (     SELECT r.name      FROM results r      JOIN races ra ON r.raceId = ra.raceId      WHERE r.fastestLapTime = '1:29.488' )	formula_1
SELECT AVG(milliseconds)  FROM pitStops  WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis')	formula_1
SELECT AVG(T3milliseconds) FROM      (SELECT T1.lap, T1.milliseconds FROM races AS T2 INNER JOIN lapTimes AS T1 ON T1.raceId = T2.raceId WHERE T2.circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')) AS subquery	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT MAX(height), player_name FROM Player;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating BETWEEN 60 AND 65  AND defensive_work_rate = 'low'	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)  LIMIT 5;	european_football_2
SELECT league.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY SUM(home_team_goal + away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id  FROM Match  WHERE season = '2015/2016'  AND (home_team_goal - away_team_goal) < 0  LIMIT 1;	european_football_2
SELECT player_name  FROM Player_Attributes  WHERE overall_rating >= (SELECT MAX(overall_rating) FROM Player_Attributes WHERE penalties > 0) - 5  ORDER BY penalties DESC  LIMIT 10;	european_football_2
SELECT away_team_api_id FROM Match WHERE      season = '2009/2010' AND     league_id IN (         SELECT id         FROM League         WHERE name = 'Scotland Premier League'     ) GROUP BY away_team_api_id ORDER BY SUM(CASE WHEN away_team_goal > home_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT MAX(buildUpPlaySpeed)  FROM Team_Attributes;	european_football_2
SELECT l.name  FROM League AS l  JOIN Match AS m ON l.id = m.league_id  WHERE m.season = '2015/2016'  GROUP BY l.name  ORDER BY COUNT(CASE WHEN home_team_goal = away_team_goal THEN 1 END) DESC  LIMIT 1;	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND T2.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'	european_football_2
SELECT League.name, COUNT(*) AS total_matches FROM Match JOIN League ON Match.league_id = League.id GROUP BY League.name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(T1.height)  FROM Player AS T1  WHERE T1.birthday >= '1990-01-01 00:00:00' AND T1.birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes) AND SUBSTR(date, 1, 4) = '2010'	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59	european_football_2
SELECT team_long_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE buildUpPlayPassingClass = 'Above Average' AND strftime('%Y', Team_Attributes.date) = '2012';	european_football_2
SELECT      (SUM(CASE WHEN p.preferred_foot = 'left' THEN 1 ELSE 0 END) * 1.0 / COUNT(p.player_fifa_api_id)) * 100 AS percentage_left_foot FROM      Player_Attributes pa JOIN      Player p ON pa.player_api_id = p.player_api_id WHERE      strftime('%Y', p.birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT league_id, SUM(home_team_goal + away_team_goal) AS total_goals FROM Match GROUP BY league_id ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(T.player_attribute.long_shots) AS average_long_shots FROM  (SELECT `player_fifa_api_id`, SUM(`long_shots`) AS total_long_shots FROM `Player_Attributes` WHERE `player_name` = 'Ahmed Samir Farag' GROUP BY `player_fifa_api_id`) AS T;	european_football_2
SELECT player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE height > 180  GROUP BY player_api_id  ORDER BY AVG(heading_accuracy) DESC  LIMIT 10	european_football_2
SELECT team_long_name  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE buildUpPlayDribblingClass = 'Normal'  AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00'  AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes) ORDER BY chanceCreationPassing DESC;	european_football_2
SELECT League.name  FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING AVG(home_team_goal) > AVG(away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE strftime('%Y', birthday) = '1970' AND strftime('%m', birthday) = '10';	european_football_2
SELECT attacking_work_rate FROM Player_Attributes WHERE player_name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' AND stage BETWEEN 1 AND 2;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francois Affolter') AND `date` = '2014-09-18 00:00:00';	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas') AND strftime('%Y', date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season LIKE '%2015/2016%' AND League.name = 'Scotland Premier League'	european_football_2
SELECT `preferred_foot`  FROM `Player`  JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `birthday` = (SELECT MAX(`birthday`) FROM `Player`)	european_football_2
SELECT player_name FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE Player_Attributes.weight < 130 AND Player_Attributes.preferred_foot = 'left'	european_football_2
SELECT team_short_name FROM Team WHERE team_api_id IN (     SELECT team_api_id FROM Team_Attributes WHERE chanceCreationPassingClass = 'Risky' )	european_football_2
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson')	european_football_2
SELECT `birthday` FROM `Player` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`))	european_football_2
SELECT T2.name FROM `League` AS T2 JOIN `Country` AS T1 ON T2.country_id = T1.id WHERE T1.name = 'Netherlands'	european_football_2
SELECT AVG(home_team_goal) FROM Match WHERE country_id IN (     SELECT id     FROM Country     WHERE name = 'Poland' ) AND season = '2010/2011'	european_football_2
SELECT T1.player_name  FROM Player AS T1  JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.finishing = (SELECT AVG(T2.finishing) FROM Player_Attributes AS T2 WHERE T2.height = (SELECT MAX(T2.height) FROM Player_Attributes AS T2))  OR T2.finishing = (SELECT AVG(T2.finishing) FROM Player_Attributes AS T2 WHERE T2.height = (SELECT MIN(T2.height) FROM Player_Attributes AS T2))	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT T1.player_name FROM `Player_Attributes` AS T1 JOIN `Player` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran') AND overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran'));	european_football_2
SELECT player_name FROM Player_Attributes WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT buildUpPlayPassingClass FROM Team WHERE team_short_name = 'CLB';	european_football_2
SELECT team_short_name FROM Team WHERE team_api_id IN (SELECT team_api_id FROM Team_Attributes WHERE buildUpPlayPassing > 70)	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  WHERE strftime('%Y', date) BETWEEN '2010' AND '2015'  AND height > 170	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)	european_football_2
SELECT `Country.name` FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `League.name` = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')	european_football_2
SELECT COUNT(*)  FROM Match  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT DISTINCT T.team_short_name FROM Team AS T JOIN Match AS M ON T.team_api_id = M.home_team_api_id WHERE M.home_team_goal = 10;	european_football_2
SELECT player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61)	european_football_2
SELECT      AVG(`ball_control`) - (SELECT AVG(`ball_control`) FROM `Player_Attributes` WHERE `player_name` = 'Abdou Diallo') AS `difference_ball_control_Abdou_Diallo`,     (SELECT AVG(`ball_control`) FROM `Player_Attributes` WHERE `player_name` = 'Aaron Appindangoye') AS `average_ball_control_Aaron_Appindangoye` FROM `Player_Attributes` WHERE `player_name` IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_name  FROM Player  WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada'))  ORDER BY birthday ASC  LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT `country.name` FROM `League` JOIN `Country` ON `League.country_id` = `Country.id` WHERE `League.name` = 'Belgium Jupiler League'	european_football_2
SELECT DISTINCT T.League.name FROM `League` AS T JOIN `Country` AS C ON T.country_id = C.id WHERE C.name = 'Germany'	european_football_2
SELECT player_name FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT COUNT(*)  FROM Player  WHERE strftime('%Y', birthday) < '1986' AND        (SELECT defensive_work_rate FROM Player_Attributes WHERE Player.player_api_id = Player_Attributes.player_api_id) = 'high'	european_football_2
SELECT player_name  FROM Player_Attributes  WHERE player_api_id IN (218353, (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Alexis'), (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ariel Borysiuk'), (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Arouna Kone')) AND `crossing` = (SELECT MAX(`crossing`) FROM Player_Attributes);	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk')	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE Player_Attributes.height > 180 AND Player_Attributes.volleys > 70;	european_football_2
SELECT T1.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.volleys > 70 AND T1.dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  JOIN Country ON League.country_id = Country.id  WHERE Season LIKE '2008/2009' AND Country.name = 'Belgium';	european_football_2
SELECT MAX(long_passing) FROM Player_Attributes WHERE date_of_birth = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Belgium Jupiler League'  AND strftime('%Y', date) = '2009'  AND strftime('%m', date) = '04'	european_football_2
SELECT league_id  FROM Match  WHERE season = '2008/2009'  GROUP BY league_id  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player` WHERE strftime('%Y', `birthday`) < '1986'	european_football_2
SELECT      ( (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel') ) * 100 / (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel') FROM     Player_Attributes WHERE     player_name IN ('Ariel Borysiuk', 'Paulin Puel');	european_football_2
SELECT AVG(Team_Attributes.buildUpPlaySpeed) FROM Team_Attributes WHERE Team_Attributes.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  WHERE player_name = 'Pietro Marino';	european_football_2
SELECT SUM(`crossing`)  FROM `Player_Attributes`  JOIN `Player` ON `Player_Attributes`.player_api_id = `Player`.player_api_id  WHERE `Player`.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass  FROM Team_Attributes  WHERE team_long_name = 'Ajax'	european_football_2
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `player_name` = 'Abdou Diallo' AND `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Abdou Diallo');	european_football_2
SELECT MAX(`overall_rating`)  FROM `Player_Attributes`  WHERE `player_name` = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal)  FROM Match  WHERE away_team_api_id IN  (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma')  AND country_id IN  (SELECT id FROM Country WHERE name = 'Italy')	european_football_2
SELECT T1.player_name  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T1.overall_rating = 77 AND T1.date = '2016-06-23'  ORDER BY T2.birthday ASC  LIMIT 1	european_football_2
SELECT overall_rating  FROM Player_Attributes  WHERE player_name = 'Aaron Mooy' AND date = '2016-02-04 00:00:00';	european_football_2
SELECT potential  FROM Player_Attributes  WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'	european_football_2
SELECT attacking_work_rate  FROM Player_Attributes  WHERE player_name = 'Francesco Migliore' AND date = '2015-05-01 00:00:00';	european_football_2
SELECT `defensive_work_rate`  FROM `Player_Attributes`  WHERE `player_name` = 'Kevin Berigaud' AND `date` = '2013-02-22 00:00:00'	european_football_2
SELECT date  FROM Player_Attributes  WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant')	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Willem II' AND `date` = '2012-02-22 00:00:00'	european_football_2
SELECT `buildUpPlayDribblingClass` FROM `Team_Attributes` WHERE `team_short_name` = 'LEI' AND date = '2015-09-10 00:00:00'	european_football_2
SELECT `buildUpPlayPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'FC Lorient' AND date = '2010-02-22'	european_football_2
SELECT chanceCreationPassingClass FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'	european_football_2
SELECT chanceCreationCrossingClass FROM Team_Attributes WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00'	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND date = '2015-09-10 00:00:00'	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  WHERE `player_name` = 'Marko Arnautovic'  AND `date` BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'	european_football_2
SELECT      CAST((overall_rating - (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Jordan Bowery')) AS REAL) * 100 / overall_rating FROM      Player_Attributes WHERE      player_name = 'Landon Donovan' AND date = '2013-07-12'	european_football_2
SELECT player_name  FROM Player  ORDER BY height DESC  LIMIT 5;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE datetime('now', 'localtime') - datetime(birthday) >= 34	european_football_2
SELECT COUNT(home_team_goal)  FROM Match  WHERE home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR        home_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon');	european_football_2
SELECT SUM(T.away_team_goal)  FROM Player_Attributes PA  JOIN Player P ON PA.player_api_id = P.player_api_id  JOIN Match M ON P.player_api_id IN (     SELECT player_api_id FROM Player WHERE player_name IN ('Daan Smith', 'Filipe Ferreira') ) AND M.away_player_X1 = P.player_api_id OR  M.away_player_X2 = P.player_api_id OR  M.away_player_X3 = P.player_api_id OR  M.away_player_X4 = P.player_api_id OR  M.away_player_X5 = P.player_api_id OR  M.away_player_X6 = P.player_api_id OR  M.away_player_X7 = P.player_api_id OR  M.away_player_X8 = P.player_api_id OR  M.away_player_X9 = P.player_api_id OR  M.away_player_X10 = P.player_api_id OR  M.away_player_X11 = P.player_api_id;	european_football_2
SELECT SUM(home_team_goal)  FROM Match  WHERE CAST(DATEDIFF(CURRENT_TIMESTAMP, birthday) AS REAL) / 365 <= 30	european_football_2
SELECT player_name FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 10;	european_football_2
SELECT player_name FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT T1.player_name FROM `Player` AS T1 JOIN `Player_Attributes` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'high' AND T2.defensive_work_rate = 'low';	european_football_2
SELECT player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE finishing = 1  ORDER BY datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) DESC  LIMIT 1;	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id JOIN Country AS T3 ON T2.country_id = T3.id WHERE T3.name = 'Belgium'	european_football_2
SELECT T2.country.name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.vision > 89;	european_football_2
SELECT T2.country_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T2.country_id ORDER BY AVG(T1.weight) DESC LIMIT 1	european_football_2
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T.`height`) AS AverageHeight FROM `Player` T JOIN `Country` C ON T.`country_id` = C.`id` WHERE C.`name` = 'Italy'	european_football_2
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name ASC  LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%' AND strftime('%Y', birthday) > '1990'	european_football_2
SELECT ABS((SELECT `jumping` FROM `Player_Attributes` WHERE `player_api_id` = 6) - (SELECT `jumping` FROM `Player_Attributes` WHERE `player_api_id` = 23)) AS Jumping_Score_Difference;	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)  AND preferred_foot = 'right'  LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left' AND attacking_work_rate = 'high';	european_football_2
SELECT CAST(SUM(CASE WHEN stamina > 80 AND strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes	european_football_2
SELECT T2.name FROM `League` AS T1 JOIN `Country` AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'	european_football_2
SELECT home_team_goal, away_team_goal  FROM Match  WHERE date LIKE '2008-09-24%' AND league_id IN (SELECT id FROM League WHERE name = 'Belgian Jupiler League')	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Alexis Blin')	european_football_2
SELECT `buildUpPlaySpeedClass` FROM `Team_Attributes` WHERE `team_long_name` = 'KSV Cercle Brugge' AND `buildUpPlaySpeed` IS NOT NULL;	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A')	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Netherlands') AND league_id IN (SELECT id FROM League WHERE name = 'Eredivisie')	european_football_2
SELECT finishing, curve  FROM Player_Attributes  WHERE weight = (SELECT MAX(weight) FROM Player_Attributes);	european_football_2
SELECT League.name FROM Match JOIN Team ON Match.home_team_api_id = Team.team_api_id OR Match.away_team_api_id = Team.team_api_id JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id JOIN League ON League.id = Team.country_id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY COUNT(Match.id) DESC LIMIT 1;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT player_name  FROM Player_Attributes  WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT      CAST(SUM(CASE WHEN height < 180 AND overall_strength > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Player_Attributes JOIN      Player ON Player_Attributes.player_api_id = Player.player_api_id JOIN      Team_Attributes ON Player_Attributes.player_api_id = Team_Attributes.team_api_id;	european_football_2
SELECT      100 * (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) - COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) /      COUNT(CASE WHEN SEX = 'M' THEN 1 END) AS PercentageDeviation FROM      Patient	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN YEAR(Patient.Birthday) > '1930' AND Patient.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN Patient.SEX = 'F' THEN Patient.ID END) FROM Patient;	thrombosis_prediction
SELECT      COUNT(CASE WHEN Admission = '+' THEN 1 END) * 100.0 / COUNT(*) AS inpatient_percentage FROM      Patient WHERE      strftime('%Y', Birthday) BETWEEN '1930' AND '1940';	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN p.Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN p.Admission = '-' THEN 1 ELSE 0 END) AS Ratio FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.Diagnosis = 'SLE'	thrombosis_prediction
SELECT `Diagnosis`, Date  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.ID = '30609'	thrombosis_prediction
SELECT      Patient.SEX,      Patient.Birthday,      Examination.Examination_Date,      Examination.Symptoms  FROM      Patient  JOIN      Examination ON Patient.ID = Examination.ID  WHERE      Examination.ID = 163109;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH > 500	thrombosis_prediction
SELECT P.ID,         CASE             WHEN EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday) < 0 THEN NULL             ELSE EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)         END AS Age  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE E.RVVT = '+';	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis = 2 AND Examination.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT Patient.ID  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE strftime('%Y', Patient.Birthday) = '1937' AND Laboratory.`T-CHO` >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALB < 3.5;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN T1.ID ELSE NULL END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F';	thrombosis_prediction
SELECT AVG(`aCL IgG`)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.Admission = '+' AND SUBSTR(CURRENT_TIMESTAMP(), 1, 4) - SUBSTR(Patient.Birthday, 1, 4) >= 50;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE YEAR(Description) = 1997 AND Admission = '-' AND SEX = 'F';	thrombosis_prediction
SELECT MIN(YEAR('First Date') - YEAR(Birthday)) AS Age_When_Arrived FROM Patient;	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT P.ID      FROM Patient P      JOIN Examination E ON P.ID = E.ID      WHERE E.Thrombosis = 1 AND YEAR(E.`Examination Date`) = 1997      AND P.SEX = 'F' ) AS WomenWithSevereThrombosis	thrombosis_prediction
SELECT      MAX(YEAR(Patient.Birthday)) - MIN(YEAR(Patient.Birthday)) FROM      Patient JOIN      Examination ON Patient.ID = Examination.ID JOIN      Laboratory ON Examination.ID = Laboratory.ID WHERE      Laboratory.TG >= 200	thrombosis_prediction
SELECT Symptoms, Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = (SELECT MIN(Birthday) FROM Patient);	thrombosis_prediction
SELECT      COUNT(DISTINCT l.ID) / 12 AS AverageMalePatientsTestedPerMonth FROM      Laboratory l JOIN      Patient p ON l.ID = p.ID WHERE      l.Date BETWEEN '1998-01-01' AND '1998-12-31' AND      p.SEX = 'M';	thrombosis_prediction
SELECT T1.Date AS 'Laboratory Completion Date',         (YEAR(T1.`First Date`) - YEAR(T1.Birthday)) AS 'Age at Admission' FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SJS' ORDER BY T1.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN UA <= '8.0' AND SEX = 'M' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN UA <= '6.5' AND SEX = 'F' THEN 1 ELSE 0 END) AS Ratio FROM      Patient JOIN      Examination ON Patient.ID = Examination.ID WHERE      Examination.UA <= CASE WHEN Patient.SEX = 'M' THEN '8.0' WHEN Patient.SEX = 'F' THEN '6.5' END;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  WHERE NOT EXISTS (     SELECT 1 FROM Examination e      WHERE e.ID = p.ID AND            e.Examination_Date >= STR_TO_DATE(p.First_Date, '%Y-%m-%d') + INTERVAL 1 YEAR );	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE EXTRACT(YEAR FROM Patient.Birthday) < 18  AND Examination.Examination_Date BETWEEN '1990-01-01' AND '1993-12-31'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.`T-BIL` > '2.0'	thrombosis_prediction
SELECT Diagnosis  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.Date BETWEEN '1985-01-01' AND '1995-12-31'  GROUP BY Diagnosis  ORDER BY COUNT(*) DESC  LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(Date) - YEAR(Patient.Birthday))  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE MONTH(Date) = 10 AND YEAR(Date) = 1991;	thrombosis_prediction
SELECT      (         EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday)     ) AS patient_age,     p.Diagnosis FROM      Patient p JOIN      Examination e ON p.ID = e.ID JOIN      Laboratory l ON p.ID = l.ID AND e.Examination_Date = l.Date WHERE      l.HGB = (         SELECT              MAX(HGB)          FROM              Laboratory          WHERE              ID = p.ID     )	thrombosis_prediction
SELECT `ANA` FROM Examination WHERE `Examination Date` = '1996-12-02' AND ID = 3605340;	thrombosis_prediction
SELECT      CASE          WHEN `T-CHO` < 250 THEN 'Normal'         ELSE 'Abnormal'     END AS Cholesterol_Status FROM      Laboratory WHERE      ID = 2927464 AND Date = '1995-09-04';	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'AORTITIS' LIMIT 1	thrombosis_prediction
SELECT `aCL IgM` FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Diagnosis = 'SLE' AND Patient.Description = '1994-02-19' AND Examination.`Examination Date` = '1993-11-12'	thrombosis_prediction
SELECT Patient.SEX FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.Thrombosis = 0 AND Laboratory.GPT = 9 AND Examination.Examination_Date = '1992-06-12'	thrombosis_prediction
SELECT      (         STRFTIME('%Y', '1991-10-21') -          strftime('%Y', T1.Birthday)     ) AS age_at_test FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID WHERE      T2.UA = '8.4' AND T2.Date = '1991-10-21'	thrombosis_prediction
SELECT COUNT(T2.ID)  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.First_Date = '1991-06-13' AND T1.Diagnosis = 'SJS' AND YEAR(T2.Date) = 1995	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'SLE' AND Examination.Examination_Date = '1997-01-27' AND Patient.`First Date` IS NOT NULL AND Patient.`First Date` = Examination.Examination_Date LIMIT 1;	thrombosis_prediction
SELECT Symptoms  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.Birthday = '1959-03-01' AND Examination.Examination_Date = '1993-09-27'	thrombosis_prediction
SELECT      ((SUM(`T-CHO`) * 1.0 WHERE Patient.Birthday = '1959-02-18' AND Date LIKE '1981-11-%') -      (SUM(`T-CHO`) * 1.0 WHERE Patient.Birthday = '1959-02-18' AND Date LIKE '1981-12-%')) /      (SUM(`T-CHO`) * 1.0 WHERE Patient.Birthday = '1959-02-18' AND Date LIKE '1981-11-%') * 100 AS DecreaseRate FROM      Examination e JOIN      Patient p ON e.ID = p.ID	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'Behcet' AND STRFTIME('%Y', p.Description) BETWEEN '1997' AND '1997';	thrombosis_prediction
SELECT Patient.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.Examination_Date BETWEEN '1987-07-06' AND '1996-01-31' AND Laboratory.GPT > 30 AND Laboratory.ALB < 4;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT *     FROM Examination     WHERE Thrombosis = 2 AND ANA = 'S' AND `aCL IgM` > (AVG(`aCL IgM`) * 1.2) ) AS SubQuery;	thrombosis_prediction
SELECT      CAST(SUM(CASE          WHEN Lab.UA <= 6.5 AND Lab.`U-PRO` > 0 AND Lab.`U-PRO` < 30 THEN 1         ELSE 0     END) AS REAL) * 100 / COUNT(*) AS Percentage FROM      Laboratory Lab JOIN      Examination Exa ON Lab.ID = Exa.ID WHERE      Exa.Diagnosis LIKE '%proteinuria%' AND Lab.`U-PRO` BETWEEN 0 AND 30;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DIAGNOSIS) FROM      Patient WHERE      SUBSTR(`First Date`, 1, 4) = '1981' AND SEX = 'M'	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Admission = '-'  AND L.Date LIKE '1991-10%'  AND L.`T-BIL` < 2.0	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT *      FROM Examination      WHERE ANA LIKE 'P' AND ANA NOT LIKE 'P' ) AS Excl_P_ANA  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.SEX = 'F'  AND Patient.Birthday BETWEEN '1980-01-01' AND '1989-12-31'	thrombosis_prediction
SELECT Patient.SEX  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.Diagnosis = 'PSS' AND Laboratory.CRP > 2 AND Laboratory.CRE = 1 AND Laboratory.LDH = 123;	thrombosis_prediction
SELECT AVG(LAB.TBIL)  FROM Laboratory LAB  JOIN Patient PAT ON LAB.ID = PAT.ID  WHERE PAT.SEX = 'F' AND LAB.PLT > 400 AND PAT.Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(T3.Symptoms) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T2.ID = T3.ID WHERE T3.Diagnosis = 'SLE'	thrombosis_prediction
SELECT `First Date`, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND Diagnosis LIKE '%APS%'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE strftime('%Y', e.`Examination Date`) = '1997' AND (e.TP < 6 OR e.TP > 8.5);	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN T1.Thrombosis = 1 AND T1.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Examination AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID WHERE      T1.Thrombosis = 1 AND T1.Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      Patient  WHERE      strftime('%Y', Birthday) = '1980' AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.Date BETWEEN '1995-01-01' AND '1997-12-31'  AND Diagnosis = 'BEHCET'  AND Patient.Admission = '-' AND Patient.SEX = 'M';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'F' AND l.WBC < 3.5	thrombosis_prediction
SELECT      DATEDIFF(T1.ExaminationDate, T2.FirstDate) AS EvaluationDelay FROM      Examination AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID WHERE      T2.ID = 821298 ORDER BY      T1.ExaminationDate ASC LIMIT 1	thrombosis_prediction
SELECT      CASE          WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 'Yes'         ELSE 'No'     END AS IsWithinNormalRange FROM      Laboratory WHERE      ID = 57266;	thrombosis_prediction
SELECT Lab.Date  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.ID = '48473' AND Laboratory.GOT >= 60	thrombosis_prediction
SELECT P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND YEAR(L.Date) = 1994	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'M' AND Examination.GPT >= 60	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Examination_Date = Laboratory.Date AND Laboratory.GPT > 60 ORDER BY Patient.Birthday ASC	thrombosis_prediction
SELECT AVG(LAB.LDH)  FROM Laboratory LAB  WHERE LAB.LDH < 500;	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT      Patient.ID,      Patient.Admission FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.ALP < 300 AND Patient.Admission IS NOT NULL	thrombosis_prediction
SELECT ID FROM Patient WHERE Birthday = '1982-04-01' AND EXISTS (     SELECT 1 FROM Laboratory WHERE ID = Patient.ID AND ALP < 300 )	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0	thrombosis_prediction
SELECT      T1.ID,      T1.TP,      (T1.TP - 8.5) AS TP_Deviation FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID WHERE      T1.SEX = 'F' AND T2.TP > 8.5;	thrombosis_prediction
SELECT T1.ID, T1.Birthday, T1.SEX, T1.Description, T1.`First Date`, T1.Admission, T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.SEX = 'M' AND (T3.ALB <= 3.5 OR T3.ALB >= 5.5) ORDER BY T1.Birthday DESC;	thrombosis_prediction
SELECT Patient.ID  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE strftime('%Y', Patient.Birthday) = '1982' AND Examination.ALB BETWEEN 3.5 AND 5.5	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F';	thrombosis_prediction
SELECT AVG(T1.UA) AS Average_UA_Index FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis IS NULL AND T1.UA < CASE WHEN T1.SEX = 'M' THEN 8.0 ELSE 6.5 END	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UN = 29	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis = 'RA' AND E.UN < 30;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5	thrombosis_prediction
SELECT      (SUM(CASE WHEN Patient.SEX = 'M' AND Laboratory.CRE >= 1.5 THEN 1 ELSE 0 END)) >      (SUM(CASE WHEN Patient.SEX = 'F' AND Laboratory.CRE >= 1.5 THEN 1 ELSE 0 END))	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID),         CASE             WHEN p.SEX = 'M' THEN 'Male'            ELSE 'Female'        END AS Sex FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` >= 2.0 GROUP BY Sex;	thrombosis_prediction
SELECT P.ID, L.`T-CHO` FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = (SELECT MIN(Birthday) FROM Patient) AND L.`T-CHO` = (SELECT MAX(`T-CHO`) FROM Laboratory)	thrombosis_prediction
SELECT AVG(DATE_PART('year', AGE(NOW()) - DATE_PART('year', Birthday))) AS AverageAge FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.`T-CHO` >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT *      FROM Patient      JOIN Laboratory ON Patient.ID = Laboratory.ID      WHERE Laboratory.TG >= 200 AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM Patient.Birthday) > 50 ) AS subquery;	thrombosis_prediction
SELECT DISTINCT T2.ID  FROM Laboratory AS T2  WHERE T2.CPK < 250 AND T2.Admission = '-'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE strftime('%Y', Patient.Birthday) BETWEEN '1936' AND '1956'  AND Patient.SEX = 'M'  AND Examination.CPK >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250	thrombosis_prediction
SELECT DISTINCT P.ID, LAB.GLU  FROM Patient P  JOIN Laboratory LAB ON P.ID = LAB.ID  WHERE LAB.GLU < 180 AND strftime('%Y', P.Description) >= '1991'	thrombosis_prediction
SELECT      P.ID,     P.SEX,     P.Birthday,     CASE          WHEN P.SEX = 'M' THEN ROUND(DATEDIFF(CURRENT_DATE(), P.Birthday) / 365.25) % 2 + 1         WHEN P.SEX = 'F' THEN ROUND(DATEDIFF(CURRENT_DATE(), P.Birthday) / 365.25)     END AS Age FROM      Patient P JOIN      Examination E ON P.ID = E.ID JOIN      Laboratory L ON P.ID = L.ID AND L.Date = (         SELECT MAX(Date) FROM Examination WHERE Examination.ID = P.ID     ) WHERE      L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY      P.SEX ORDER BY      P.SEX,     Age ASC;	thrombosis_prediction
SELECT P.ID,         EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM P.Birthday) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID AND L.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = P.ID) WHERE L.RBC < 3.5 AND P.Diagnosis IS NOT NULL	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, P.Birthday, P.Description, P.Admission FROM Patient P JOIN (     SELECT ID, Date     FROM Laboratory     WHERE RBC <= 3.5 OR RBC >= 6.0 ) L ON P.ID = L.ID WHERE P.SEX = 'F' AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday) >= 50 AND L.Date IS NOT NULL	thrombosis_prediction
SELECT P.ID, P.SEX  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE E.Birthday IS NOT NULL AND P.Admission = '-' AND P.HGB < 10;	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID AND E.Examination Date = L.Date WHERE E.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17 ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age FROM Patient P JOIN (     SELECT ID, COUNT(*) AS Lab_Exams_Count     FROM (         SELECT DISTINCT ID         FROM Laboratory         WHERE HCT >= 52     ) L     GROUP BY ID     HAVING COUNT(*) > 2 ) LE ON P.ID = LE.ID	thrombosis_prediction
SELECT AVG(HCT)  FROM Laboratory  WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      (SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END)) AS difference FROM      Laboratory WHERE      ID IN (         SELECT              ID          FROM              Examination          WHERE              Thrombosis = 1     )	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date LIKE '1984%' AND SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(Patient.Birthday)) < 50 AND Laboratory.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN P.SEX = 'F' AND L.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN P.SEX = 'F' THEN L.ID END) AS Percentage FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM P.Birthday) > 55;	thrombosis_prediction
SELECT Patient.ID  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.Diagnosis IS NOT NULL AND        Patient.`First Date` >= '1992-01-01' AND        Laboratory.PT < 14	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.Examination_Date > '1997-01-01' AND Examination.APTT >= 45	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.APTT IS NOT NULL AND e.APTT > 45 AND p.Thrombosis = 3  AND p.Thrombosis IN (SELECT Thrombosis FROM Examination WHERE Thrombosis = 3)  GROUP BY e.ID HAVING COUNT(e.ID) = 1	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT DISTINCT p.ID     FROM Patient p     JOIN Laboratory l ON p.ID = l.ID     WHERE p.SEX = 'M'     AND l.WBC BETWEEN 3.5 AND 9.0     AND (l.FG <= 150 OR l.FG >= 450) ) subquery	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID AND L.Date = (     SELECT MAX(L2.Date)     FROM Laboratory L2     WHERE L2.ID = P.ID ) WHERE P.Birthday > '1980-01-01' AND L.FG < 150 OR L.FG > 450	thrombosis_prediction
SELECT DISTINCT Diagnosis FROM Patient WHERE ID IN (     SELECT ID FROM Examination WHERE `U-PRO` >= 30 )	thrombosis_prediction
SELECT P.ID  FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.`U-PRO` BETWEEN 0 AND 30 AND P.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.`aCL IgG` < 900 AND Examination.Symptoms = 'abortion'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE `aCL IgG` BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `aCL IgA` = (SELECT MAX(`aCL IgA`) FROM Examination WHERE `aCL IgA` BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE `First Date` >= '1990-01-01'  AND IGA BETWEEN 80 AND 500;	thrombosis_prediction
SELECT Diagnosis  FROM Examination  WHERE `aCL IgM` NOT BETWEEN 40 AND 400  GROUP BY Diagnosis  ORDER BY COUNT(*) DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (     SELECT ID FROM Examination WHERE CRP LIKE '+' OR CRP LIKE '-' OR CRP < 1.0 ) AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.CRPT NOT IN ('+-', '-') AND e.CRPT >= 1.0 AND        (YEAR(CURRENT_DATE()) - YEAR(p.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RF = '-' OR e.RF = '+-'  AND e.KCT = '+'	thrombosis_prediction
SELECT Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE YEAR(Birthday) >= 1995 AND Examination.RF = '-'	thrombosis_prediction
SELECT T1.ID  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.RF < 20 AND DATEDIFF(YEAR(CURRENT_DATE(), T1.Birthday)) > 60	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE `RF` < 20 AND Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.`C3` > 35 AND Examination.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID AND L.Date = (     SELECT MAX(Date) FROM Examination WHERE P.ID = Examination.ID ) WHERE L.HCT < 29 OR L.HCT > 52 ORDER BY E.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 1 AND e.C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.`ANA Pattern` LIKE '%-%' OR E.`ANA Pattern` = '++' AND P.Admission = '+';	thrombosis_prediction
SELECT `Birthday` FROM Patient WHERE `Birthday` = (SELECT `Birthday` FROM Patient ORDER BY `Birthday` ASC LIMIT 1) AND EXISTS (     SELECT 1     FROM Examination     WHERE Examination.ID = Patient.ID     AND RNP NOT IN ('-', '+-') )	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE Examination.SM IN ('-', '+-') AND Examination.Thrombosis = 1;	thrombosis_prediction
SELECT p.ID  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.SM NOT IN ('-', '+')  ORDER BY p.Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT DISTINCT Examination.ID  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  JOIN Laboratory ON Examination.ID = Laboratory.ID  WHERE Examination.Examination_Date >= '1997-01-01' AND Laboratory.SC170 IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Symptoms LIKE '%vertigo%' AND p.SEX = 'M' AND e.SC170 IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.`ANA Pattern` LIKE '%SSA%' AND E.`ANA Pattern` NOT IN ('+','++') AND strftime('%Y', P.`First Date`) < '1990'	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSA NOT IN ('-', '+-') ORDER BY p.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`ANA Pattern` IN ('-', '+-') AND e.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.SSB = '-' OR Examination.SSB = '+-' AND Examination.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.`DNA-II` IN ('-', '+-')  AND l.CENTROMEA IN ('-', '+-')  AND l.SSB IN ('-', '+-')  AND p.SEX = 'M'	thrombosis_prediction
SELECT Diagnosis  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.`DNA-II` >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT ID)  FROM Examination  WHERE `DNA` < 8 AND Diagnosis IS NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.`DNA-II` >= 8 AND Patient.Admission = '+'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN LAB.GOT >= 60 AND PAT.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Examination EXAM  JOIN Patient PAT ON EXAM.ID = PAT.ID  JOIN Laboratory LAB ON EXAM.ID = LAB.ID AND EXAM.Examination_Date = LAB.Date	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'M' AND EXISTS (     SELECT 1      FROM Laboratory      WHERE ID = Patient.ID AND GOT < 60 )	thrombosis_prediction
SELECT MAX(Patient.Birthday)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GOT >= 60	thrombosis_prediction
SELECT P.Birthday  FROM Patient P JOIN (     SELECT ID, Date, MAX(GPT) AS MaxGPT     FROM Laboratory     WHERE GPT < 60     GROUP BY ID, Date ) L ON P.ID = L.ID ORDER BY L.MaxGPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.GOT < 60 AND Patient.SEX = 'M'	thrombosis_prediction
SELECT T1.First Date FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T2.First Date ASC LIMIT 1	thrombosis_prediction
SELECT `First Date` FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE l.LDH >= 500 ORDER BY p.`First Date` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.ALP >= 300 AND Patient.Admission = '+'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE p.Admission = '-' AND e.ALP < 300	thrombosis_prediction
SELECT Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON e.ID = l.ID  WHERE p.Diagnosis = 'SJS' AND l.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT T2.Date FROM Laboratory AS T2 WHERE T2.ALB = (SELECT MAX(T2.ALB) FROM Laboratory AS T2 WHERE T2.ALB > 3.5 AND T2.ALB < 5.5)	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M'  AND Examination.TP BETWEEN 6.0 AND 8.5  AND Examination.ALB BETWEEN 3.5 AND 5.5	thrombosis_prediction
SELECT      MAX(CASE WHEN P.SEX = 'F' THEN L.UA END) AS max_ua,     MAX(CASE WHEN P.SEX = 'F' AND L.UA > 6.50 THEN L.aCL_IgG END) AS acl_igG,     MAX(CASE WHEN P.SEX = 'F' AND L.UA > 6.50 THEN L.aCL_IgM END) AS acl_igM,     MAX(CASE WHEN P.SEX = 'F' AND L.UA > 6.50 THEN L.aCL_IgA END) AS acl_igA FROM      Examination E JOIN      Patient P ON E.ID = P.ID JOIN      Laboratory L ON E.ID = L.ID	thrombosis_prediction
SELECT MAX(`ANA`)  FROM Examination  WHERE `ANA` IS NOT NULL AND Examination.ID IN (     SELECT ID      FROM Examination      JOIN Laboratory ON Examination.ID = Laboratory.ID      WHERE `CRE` < 1.5 )	thrombosis_prediction
SELECT P.ID  FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.CRE < 1.5 AND E.`aCL IgA` = (     SELECT MAX(`aCL IgA`) FROM Examination )	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT ANA FROM Examination WHERE `T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0)	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT DISTINCT p.ID      FROM Patient p      JOIN Laboratory l ON p.ID = l.ID      WHERE l.`T-CHO` >= 250 AND l.KCT = '-' ) AS subquery;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`T-CHO` < 250 AND e.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON e.ID = l.ID  WHERE l.`T-CHO` < 200 AND e.Symptoms IS NOT NULL	thrombosis_prediction
SELECT Diagnosis FROM Patient WHERE ID IN (     SELECT ID FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID     WHERE TG < 200     ORDER BY MAX(TG) DESC     LIMIT 1 )	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T1.CPK < 250	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON e.ID = l.ID AND l.Date = (     SELECT MAX(l2.Date) FROM Examination e2 JOIN Laboratory l2 ON e2.ID = l2.ID WHERE e2.ID = e.ID ) WHERE l.CPK < 250 AND (     l.KCT = '+' OR l.RVVT = '+' OR l.LAC = '+' )	thrombosis_prediction
SELECT Birthday  FROM Patient  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE GLU > 180 )  ORDER BY Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.GLU < 180 AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.Thrombosis = 0 AND Laboratory.WBC BETWEEN 3.5 AND 9.0 AND Patient.Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON e.ID = l.ID  WHERE e.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID AND T1.Examination_Date = T3.Date WHERE T3.RBC <= 3.5 OR T3.RBC >= 6.0 AND T2.Admission = '-'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.Thrombosis = 0 AND Patient.Diagnosis IS NOT NULL	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Examination.Thrombosis, Examination.PLT FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Diagnosis = 'MCTD' AND Examination.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT AVG(L.PT)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID AND e.Examination_Date = l.Date WHERE e.Thrombosis IN (1, 2) AND l.PT < 14	thrombosis_prediction
SELECT T.major_name FROM member AS M JOIN major AS T ON M.link_to_major = T.major_id WHERE M.first_name = 'Angela' AND M.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Engineering') AND position = 'Student';	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'Art and Design'  AND m.position LIKE '%Student Club%'	student_club
SELECT COUNT(DISTINCT T1.member_id) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer'	student_club
SELECT T1.phone FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T3.event_id = T2.link_to_event WHERE T3.event_name = 'Women''s Soccer'	student_club
SELECT COUNT(*)  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium';	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.link_to_major LIKE 'Student_Club'  GROUP BY e.event_id  ORDER BY COUNT(a.link_to_event) DESC  LIMIT 1;	student_club
SELECT college FROM member WHERE position = 'Vice President' AND member_id IN (SELECT link_to_member FROM attendance WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name LIKE '%Officers meeting%'));	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean';	student_club
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  JOIN event ON attendance.link_to_event = event.event_id  WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND event.year(event_date) = 2019 AND event.type = 'Meeting' OR event.type = 'Election'	student_club
SELECT COUNT(*)  FROM (     SELECT event_id      FROM attendance      GROUP BY event_id      HAVING COUNT(*) > 10 ) AS subquery  JOIN (     SELECT event_id      FROM event      WHERE type = 'Meeting' ) AS meeting_events  ON attendance.event_id = meeting_events.event_id	student_club
SELECT event_name  FROM event  JOIN attendance ON event.event_id = attendance.link_to_event  GROUP BY event.event_id, event_name  HAVING COUNT(*) > 20;	student_club
SELECT AVG(T1.event_id) / COUNT(DISTINCT T1.event_name) AS average_attendance FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND STRFTIME('%Y', T1.event_date) = '2020';	student_club
SELECT expense_description  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.event_status = 'Open'  ORDER BY cost DESC  LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE link_to_major IN (     SELECT major_id      FROM major      WHERE major_name = 'Environmental Engineering' )	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_event = 'rec0Si5cQ4rJRVzd6'	student_club
SELECT T1.last_name  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT z.county FROM zip_code z WHERE z.zip_code = (SELECT zip FROM member WHERE first_name = 'Sherri' AND last_name = 'Ramsey')	student_club
SELECT college  FROM major  JOIN member ON major.major_id = member.link_to_major  WHERE first_name = 'Tyler' AND last_name = 'Hewitt';	student_club
SELECT amount FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President')	student_club
SELECT SUM(T2.spent)  FROM event AS T1  JOIN budget AS T2 ON T1.event_id = T2.link_to_event  WHERE T1.event_name = 'September Meeting' AND T2.category = 'Food';	student_club
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President' AND T1.link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Student_Club')	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1  JOIN zip_code AS T2 ON T1.zip = T2.zip_code  WHERE T2.state = 'Illinois'	student_club
SELECT SUM(T2.spent) AS TotalSpentOnAdvertisement FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Advertisement'	student_club
SELECT T.major_name FROM major AS T WHERE T.major_id = (     SELECT T.major_id FROM member AS M WHERE M.first_name = 'Pierce' AND M.last_name = 'Guidi' )	student_club
SELECT SUM(amount)  FROM budget  WHERE link_to_event IN (     SELECT event_id      FROM event      WHERE event_name = 'October Speaker' )	student_club
SELECT T2.approved FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T1.event_name = 'October Meeting' AND T1.event_date = '2019-10-08';	student_club
SELECT AVG(cost) AS average_cost_spent FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE first_name = 'Elijah' AND last_name = 'Allen' AND MONTH(expense.expense_date) IN (9, 10);	student_club
SELECT      SUM(CASE WHEN strftime('%Y', event_date) = '2019' THEN amount ELSE 0 END) -      SUM(CASE WHEN strftime('%Y', event_date) = '2020' THEN amount ELSE 0 END) AS total_spent_difference FROM      budget	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT T2.cost FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters' AND T2.event_status = 'Open' AND T2.expense_date = '2019-09-04';	student_club
SELECT T2.remaining  FROM budget AS T1  JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget  WHERE T1.category = 'Food' AND T1.spent < T2.cost AND T1.amount = (     SELECT MAX(T1.amount)      FROM budget AS T1      WHERE T1.category = 'Food' )	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(DISTINCT major_id) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT z.county FROM zip_code z WHERE z.zip_code = (SELECT zip FROM member WHERE first_name = 'Adela' AND last_name = 'O''Gallagher')	student_club
SELECT COUNT(*)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'November Meeting' AND budget.remaining < 0	student_club
SELECT SUM(b.remaining)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Speaker'	student_club
SELECT T1.event_status FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20'	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE first_name = 'Brent' AND last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Human Development and Family Studies' AND member.t_shirt_size = 'Large';	student_club
SELECT z.type  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Christof' AND m.last_name = 'Nielsen';	student_club
SELECT T3.major_name FROM member AS T1 INNER JOIN member_position AS T2 ON T1.member_id = T2.member_id INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.position = 'Vice President';	student_club
SELECT T2.state FROM `member` AS T1 INNER JOIN `zip_code` AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T2.department  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T1.position = 'President';	student_club
SELECT date_received  FROM income  WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Connor' AND last_name = 'Hilton')  AND source = 'Dues';	student_club
SELECT first_name, last_name FROM member WHERE member_id = (SELECT link_to_member FROM income WHERE source = 'Dues' ORDER BY date_received ASC LIMIT 1)	student_club
SELECT SUM(CASE             WHEN b.category = 'Advertisement' AND e.event_name = 'Yearly Kickoff' THEN b.amount            ELSE 0            END) / SUM(CASE                          WHEN b.category = 'Advertisement' AND e.event_name = 'October Meeting' THEN b.amount                         ELSE 0                         END) AS ratio FROM budget b JOIN event e ON b.link_to_event = e.event_id	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' AND e.event_name = 'November Speaker' THEN b.amount ELSE 0 END) /       COALESCE(SUM(b.amount), 0) * 100) AS percentage_budget_for_parking FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'November Speaker';	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT T1.department  FROM major AS T1  JOIN zip_code AS T2 ON T1.college = 'Humanities and Social Sciences'	student_club
SELECT z.city, z.county, z.state  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.remaining = (SELECT MIN(remaining) FROM budget)	student_club
SELECT T2.first_name, T2.last_name  FROM event AS T1  JOIN attendance AS T2 ON T1.event_id = T2.link_to_event  WHERE T1.event_name = 'October Meeting'	student_club
SELECT T1.college  FROM major AS T1  JOIN member AS T2 ON T1.major_id = T2.link_to_major  GROUP BY T1.college  ORDER BY COUNT(T2.member_id) DESC  LIMIT 1;	student_club
SELECT T2.major_name  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T1.phone = '809-555-3360'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.amount = (SELECT MAX(amount) FROM budget)	student_club
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'	student_club
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer'	student_club
SELECT date_received FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason');	student_club
SELECT COUNT(*) FROM zip_code WHERE short_state = 'MD';	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' ORDER BY CAST(b.spent AS REAL) / b.amount DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'	student_club
SELECT SUM(b.spent) AS total_spent_for_food FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE b.category = 'Food';	student_club
SELECT T3.first_name, T3.last_name  FROM attendance AS T1  JOIN member AS T3 ON T1.link_to_member = T3.member_id  GROUP BY T1.link_to_member  HAVING COUNT(T1.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT CONCAT(first_name, ' ', last_name)  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT COUNT(income_id) FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 40;	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Yearly Kickoff' OR event_name = 'Baseball game';	student_club
SELECT T1.first_name, T1.last_name  FROM member AS T1  JOIN budget AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.category = 'Yearly Kickoff' AND T2.event_status = 'Open';	student_club
SELECT T1.first_name, T1.last_name, T2.source  FROM member AS T1  JOIN income AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT event.event_name FROM event JOIN expense ON event.event_id = expense.link_to_event WHERE expense.cost = (SELECT MIN(cost) FROM expense)	student_club
SELECT      (SUM(cost WHERE event_name = 'Yearly Kickoff') /      (SELECT SUM(cost) FROM expense)) * 100 AS percentage_cost_yearly_kickoff	student_club
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching'	student_club
SELECT COUNT(DISTINCT T1.member_id)  FROM attendance AS T1  JOIN event AS T2 ON T1.link_to_event = T2.event_id  WHERE T2.event_name = 'Community Theater' AND STRFTIME('%Y', T2.event_date) = '2019';	student_club
SELECT COUNT(*)  FROM attendance a  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi'	student_club
SELECT AVG(b.spent)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.status = 'Closed' AND b.category = 'Food'	student_club
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE category = 'Advertisement' AND spent = (SELECT MAX(spent) FROM budget WHERE category = 'Advertisement'))	student_club
SELECT T1.link_to_member FROM `attendance` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id JOIN `member` AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Women''s Soccer' AND T3.first_name = 'Maya' AND T3.last_name = 'Mclean';	student_club
SELECT      CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id)  FROM      event  WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31' AND      department = 'Student_Club';	student_club
SELECT T2.cost FROM `expense` AS T1 JOIN `budget` AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters' AND T2.link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Speaker')	student_club
SELECT t_shirt_size  FROM member  GROUP BY t_shirt_size  ORDER BY COUNT(*) DESC  LIMIT 1;	student_club
SELECT e.event_name  FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense exp ON b.budget_id = exp.link_to_budget WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT expense_description, SUM(cost) AS total_value FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.link_to_event = (SELECT event_id FROM event WHERE event_name = 'October Meeting') AND approved = 'Yes';	student_club
SELECT category  FROM budget  WHERE link_to_event IN (     SELECT event_id      FROM event      WHERE event_name = 'April Speaker' ) ORDER BY amount ASC;	student_club
SELECT budget_id, MAX(amount) FROM budget WHERE category = 'Food';	student_club
SELECT link_to_event FROM budget WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT expense_description  FROM expense  JOIN member ON expense.link_to_member = member.member_id  WHERE first_name = 'Sacha' AND last_name = 'Harrison';	student_club
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'X-Large';	student_club
SELECT T2.zip_code FROM `expense` AS T1 JOIN `zip_code` AS T2 ON T2.zip_code = T1.zip WHERE T1.cost < 50	student_club
SELECT m.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Phillip' AND m.last_name = 'Cullen';	student_club
SELECT T1.position  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T2.major_name = 'Business'	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'	student_club
SELECT T1.type  FROM event AS T1  JOIN budget AS T2 ON T1.event_id = T2.link_to_event  WHERE T2.remaining > 30	student_club
SELECT `type` FROM event WHERE location = 'MU 215';	student_club
SELECT `category` FROM `budget` WHERE `event_status` = 'Open' AND `event_date` = '2020-03-24T12:00:00';	student_club
SELECT T.major_name FROM member AS T WHERE T.position = 'Vice President' AND T.link_to_major IS NOT NULL;	student_club
SELECT CAST(SUM(CASE WHEN M.position = 'Member' AND MA.major_name = 'Mathematics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(M.member_id)  FROM member M  JOIN major MA ON M.link_to_major = MA.major_id;	student_club
SELECT T1.category FROM `budget` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'	student_club
SELECT COUNT(income_id) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  JOIN zip_code ON major.college = 'Agriculture and Applied Sciences' AND zip_code.state = 'Short State'  WHERE major.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT T1.last_name, T2.major_name, T2.department, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering';	student_club
SELECT T2.category FROM `event` AS T1 INNER JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215' AND T1.type = 'Guest Speaker' AND T2.spent = 0	student_club
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T3.department = 'Electrical and Computer Engineering' AND T1.position = 'Member'	student_club
SELECT event_name FROM event JOIN member ON event.event_id = attendance.link_to_event JOIN zip_code ON member.zip = zip_code.zip_code JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President' AND major.college = 'Student_Club' AND zip_code.location = '900 E. Washington St.' AND event.type = 'Social';	student_club
SELECT T1.last_name, T1.position  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.expense_description = 'Pizza' AND T2.expense_date = '2019-09-10'	student_club
SELECT T2.last_name  FROM attendance AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  JOIN event AS T3 ON T1.link_to_event = T3.event_id  WHERE T3.event_name = 'Women''s Soccer' AND T2.position = 'Member';	student_club
SELECT      CAST(SUM(CASE WHEN T1.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id)  FROM      income AS T1  JOIN      member AS T2 ON T1.link_to_member = T2.member_id  WHERE      T2.t_shirt_size = 'Medium' AND T2.position = 'Member'	student_club
SELECT DISTINCT T2.state  FROM zip_code AS T1  JOIN member AS T2 ON T1.zip_code = T2.zip  WHERE T1.type = 'PO Box'	student_club
SELECT z.zip_code FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE z.city = 'San Juan Municipio' AND z.state = 'Puerto Rico' AND z.type = 'PO Box'	student_club
SELECT event_name  FROM event  WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT T1.link_to_event FROM `expense` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost > 50;	student_club
SELECT T1.first_name, T1.last_name, T2.expense_id FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.approved = 'true' AND T2.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T2.major_id = 'rec1N0upiVLy5esTO'	student_club
SELECT T1.phone  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  JOIN zip_code AS T3 ON T1.zip = T3.zip_code  WHERE T2.major_name = 'Business' AND T3.college = 'College of Agriculture and Applied Sciences'	student_club
SELECT T2.email  FROM expense AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  WHERE T1.expense_date BETWEEN '2019-09-10' AND '2019-11-19'  AND T1.cost > 20	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'education') AND position = 'Member';	student_club
SELECT      CAST(SUM(CASE WHEN `remaining` < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`event_id`) AS percentage_over_budget FROM      `budget` JOIN      `event` ON `budget.link_to_event` = `event.event_id` WHERE      `event_status` = 'Closed'	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id FROM expense WHERE (SUM(cost) / COUNT(expense_id)) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT      CAST(SUM(CASE WHEN zip_code.type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code.zip_code) AS percentage_PO_boxes FROM      zip_code	student_club
SELECT T1.event_name, T1.location  FROM event AS T1  JOIN budget AS T2 ON T1.event_id = T2.link_to_event  WHERE T2.remaining > 0;	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100	student_club
SELECT T1.first_name, T1.last_name, T2.major_name  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  JOIN expense AS T3 ON T1.member_id = T3.link_to_member  WHERE T3.cost > 100	student_club
SELECT T1.city, T1.county, T2.event_name FROM zip_code AS T1 JOIN event AS T2 ON T1.zip_code = T2.location JOIN (     SELECT event_id, COUNT(income_id) AS income_count     FROM income     GROUP BY event_id     HAVING COUNT(income_id) > 40 ) AS T3 ON T2.event_id = T3.event_id;	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) AS total_expense FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id, T1.first_name, T1.last_name HAVING COUNT(T2.expense_id) > 1 ORDER BY total_expense DESC LIMIT 1;	student_club
SELECT AVG(cost)  FROM expense  WHERE link_to_member IN (     SELECT member_id      FROM member      WHERE position != 'Member' )	student_club
SELECT event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Parking' AND budget.cost < (SELECT AVG(cost) FROM budget WHERE category = 'Parking')	student_club
SELECT      (SUM(cost) / COUNT(event_id)) * 100 AS percentage_cost_for_game_events FROM      event WHERE      type = 'Game';	student_club
SELECT b.budget_id FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' ORDER BY e.cost DESC LIMIT 1;	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id, T1.first_name, T1.last_name ORDER BY SUM(T2.cost) DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      (SUM(CASE WHEN zip.state = 'Maine' THEN 1 ELSE 0 END) / COUNT(CASE WHEN position = 'Member' THEN member_id END)) -     (SUM(CASE WHEN zip.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(CASE WHEN position = 'Member' THEN member_id END)) FROM member JOIN zip_code AS zip ON zip.zip_code = member.zip	student_club
SELECT m.major_name, d.department  FROM member AS m  JOIN major AS d ON m.link_to_major = d.major_id  WHERE m.first_name = 'Garrett' AND m.last_name = 'Gerke';	student_club
SELECT T1.first_name, T1.last_name, T2.cost FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T1.last_name, T1.phone  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T2.major_name = 'Elementary Education'	student_club
SELECT T2.category, T2.amount FROM `attendance` AS T1 JOIN `budget` AS T2 ON T1.link_to_event = T2.link_to_event WHERE T1.link_to_member IN (SELECT event_id FROM `event` WHERE event_name = 'January Speaker') AND T2.event_status = 'Open';	student_club
SELECT event.event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Food';	student_club
SELECT T1.first_name, T1.last_name, T3.amount FROM member AS T1 JOIN income AS T3 ON T1.member_id = T3.link_to_member WHERE T3.date_received = '2019-09-09'	student_club
SELECT budget.category FROM budget JOIN expense ON budget.budget_id = expense.link_to_budget WHERE expense.expense_description = 'Posters';	student_club
SELECT m.first_name, m.last_name, c.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN college c ON ma.college = c.college_name WHERE m.position = 'Secretary';	student_club
SELECT event.event_name, SUM(budget.spent) AS total_spent FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Speaker Gifts';	student_club
SELECT z.city  FROM member  JOIN zip_code z ON member.zip = z.zip_code  WHERE first_name = 'Garrett' AND last_name = 'Girke'	student_club
SELECT first_name, last_name, position  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE city = 'Lincolnton' AND state = 'North Carolina';	student_club
SELECT COUNT(*)  FROM gasstations  WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT      (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / NULLIF(SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END), 0)) AS Ratio FROM      customers;	debit_card_specializing
SELECT T1.CustomerID, T1.Consumption FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID AND T2.Segment = 'LAM' WHERE T1.Date BETWEEN '201201' AND '201212' GROUP BY T1.CustomerID ORDER BY SUM(T1.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'SME' )	debit_card_specializing
SELECT c.CustomerID, c.Currency, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID, c.Currency ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(*)  FROM yearmonth  JOIN customers ON yearmonth.CustomerID = customers.CustomerID  WHERE customers.Segment = 'KAM' AND Consumption < 30000 AND Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT      SUM(CASE WHEN T2.Currency = 'CZK' THEN T1.Consumption ELSE 0 END) - SUM(CASE WHEN T2.Currency = 'EUR' THEN T1.Consumption ELSE 0 END) AS Consumption_Difference FROM      yearmonth T1 JOIN      customers T2 ON T1.CustomerID = T2.CustomerID WHERE      STRFTIME('%Y', T1.Date) = '2012'	debit_card_specializing
SELECT strftime('%Y', Date) AS Year, SUM(Consumption) AS TotalGasUse FROM yearmonth WHERE Currency = 'EUR' GROUP BY Year ORDER BY TotalGasUse DESC LIMIT 1;	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT STRFTIME('%Y', Date) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Price = (SELECT MIN(Price) FROM yearmonth WHERE Price <> 0 AND STRFTIME('%Y', Date) IS NOT NULL) AND STRFTIME('%Y', Date) IS NOT NULL GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date  FROM yearmonth  WHERE CustomerID IN (     SELECT CustomerID      FROM customers      WHERE Segment = 'SME' )  AND Date LIKE '2013%'  ORDER BY Consumption DESC  LIMIT 1;	debit_card_specializing
WITH  LeastConsumptionPerSegment AS (     SELECT          Segment,         AVG(Consumption) AS AvgConsumption     FROM          yearmonth     WHERE          Date BETWEEN '201301' AND '201312'     GROUP BY          Segment ), SME_LAM_Difference AS (     SELECT          CASE              WHEN Segment = 'SME' THEN LeastConsumptionPerSegment.AvgConsumption             ELSE NULL         END AS SME_Avg,         CASE              WHEN Segment = 'LAM' THEN LeastConsumptionPerSegment.AvgConsumption             ELSE NULL         END AS LAM_Avg     FROM          LeastConsumptionPerSegment ), LAM_KAM_Difference AS (     SELECT          CASE              WHEN Segment = 'LAM' THEN LeastConsumptionPerSegment.AvgConsumption             ELSE NULL         END AS LAM_Avg,         CASE              WHEN Segment = 'KAM' THEN LeastConsumptionPerSegment.AvgConsumption             ELSE NULL         END AS KAM_Avg     FROM          LeastConsumptionPerSegment ), KAM_SME_Difference AS (     SELECT          CASE              WHEN Segment = 'KAM' THEN LeastConsumptionPerSegment.AvgConsumption             ELSE NULL         END AS KAM_Avg,         CASE              WHEN Segment = 'SME' THEN LeastConsumptionPerSegment.AvgConsumption             ELSE NULL         END AS SME_Avg     FROM          LeastConsumptionPerSegment ), Differences AS (     SELECT          (SME_Avg - LAM_Avg) AS SME_LAM_Diff,         (LAM_Avg - KAM_Avg) AS LAM_KAM_Diff,         (KAM_Avg - SME_Avg) AS KAM_SME_Diff     FROM          SME_LAM_Difference,         LAM_KAM_Difference,         KAM_SME_Difference ) SELECT * FROM Differences;	debit_card_specializing
WITH SegmentData AS (   SELECT      segment,     SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END) AS consumption_2012,     SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END) AS consumption_2013   FROM yearmonth   GROUP BY segment ), PercentChangeData AS (   SELECT      segment,     (consumption_2013 - consumption_2012) AS change_amount,     CAST((consumption_2013 - consumption_2012) AS REAL) / consumption_2013 * 100 AS percent_change   FROM SegmentData ), RankingData AS (   SELECT      segment,     MAX(percent_change) OVER (PARTITION BY segment ORDER BY percent_change DESC) AS max_percent_change,     MIN(percent_change) OVER (PARTITION BY segment ORDER BY percent_change ASC) AS min_percent_change   FROM PercentChangeData ) SELECT    segment,   max_percent_change,   min_percent_change FROM RankingData ORDER BY segment;	debit_card_specializing
SELECT SUM(T1.Amount) AS TotalConsumption FROM transactions_1k T1 JOIN yearmonth T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date WHERE T1.CustomerID = 6 AND T2.Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'Czech Republic' AND Segment = 'discount') -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'discount')	debit_card_specializing
SELECT      (SELECT SUM(Consumption) FROM yearmonth WHERE Date LIKE '201304%' AND CustomerID = 7) -      (SELECT SUM(Consumption) FROM yearmonth WHERE Date LIKE '201304%' AND CustomerID = 5)	debit_card_specializing
SELECT      SUM(CASE WHEN T1.Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS difference FROM      customers AS T1 WHERE      T1.Segment = 'SME'	debit_card_specializing
SELECT T1.CustomerID, T1.Consumption  FROM customers AS T1  JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310'  ORDER BY T2.Consumption DESC  LIMIT 1;	debit_card_specializing
SELECT T2.CustomerID, SUM(T2.Consumption) AS TotalConsumption FROM yearmonth T2 JOIN customers T1 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T2.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  JOIN customers ON yearmonth.CustomerID = customers.CustomerID  WHERE customers.Segment = 'KAM' AND yearmonth.Date = '201305'	debit_card_specializing
SELECT      (COUNT(*) OVER() * 100.0 / (SELECT COUNT(*) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM')) - 100.0) * SUM(CASE WHEN Consumption > 46.73 THEN 1 ELSE 0 END) OVER() / COUNT(*) OVER() FROM     yearmonth WHERE     CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM')	debit_card_specializing
SELECT Country, COUNT(*) AS ValueForMoneyStations FROM (     SELECT T2.Country, T1.Amount / T1.Price AS ValueForMoneyIndex     FROM transactions_1k AS T1     JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID     WHERE T1.Price * T1.Amount > T1.Price * 0.95 -- Assuming value for money is when price is less than 95% of the amount ) AS T3 GROUP BY Country ORDER BY ValueForMoneyStations DESC;	debit_card_specializing
SELECT      CAST(SUM(CASE WHEN c.Segment = 'KAM' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.CustomerID) AS Percentage FROM      customers c WHERE      c.Segment = 'KAM' AND      c.Currency = 'EUR';	debit_card_specializing
SELECT      COUNT(*) * 100.0 / SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS percentage FROM      yearmonth WHERE      DATE_FORMAT(Date, '%Y%m') = '201202'	debit_card_specializing
SELECT      COUNT(CASE WHEN segment = 'Premium' THEN gasstationid END) * 100.0 / COUNT(gasstationid)  FROM      gasstations  WHERE      country = 'Slovakia'	debit_card_specializing
SELECT T1.CustomerID FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201309' GROUP BY T1.CustomerID ORDER BY SUM(T1.Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT T1.Segment FROM (     SELECT T2.CustomerID, SUM(T2.Consumption) AS TotalConsumption     FROM yearmonth AS T2     WHERE T2.Date LIKE '201309%'     GROUP BY T2.CustomerID ) AS T3 JOIN customers AS T1 ON T1.CustomerID = T3.CustomerID WHERE T3.TotalConsumption = (SELECT MIN(TotalConsumption) FROM (     SELECT SUM(Price * CASE WHEN Date LIKE '201309%' THEN 1 ELSE 0 END) AS TotalConsumption     FROM transactions_1k     JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID     WHERE yearmonth.Date LIKE '201309%' ))	debit_card_specializing
SELECT T1.CustomerID, SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date = '201206' GROUP BY T1.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption)  FROM yearmonth  WHERE Date LIKE '2012%'	debit_card_specializing
SELECT      T1.Consumption * 12 AS AnnualConsume FROM      yearmonth T1 JOIN      customers T2 ON T1.CustomerID = T2.CustomerID WHERE      T2.Currency = 'EUR' ORDER BY      AnnualConsume DESC LIMIT 1	debit_card_specializing
SELECT T1.Description  FROM products AS T1  JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID  JOIN yearmonth AS T3 ON T2.CustomerID = T3.CustomerID AND T2.Date = T3.Date  WHERE T3.Date LIKE '201309%'	debit_card_specializing
SELECT T2.Country  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Date LIKE '201306%'  AND T2.Date LIKE '201306%';	debit_card_specializing
SELECT T2.ChainID FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Price IN (     SELECT Price     FROM transactions_1k     WHERE Currency = 'EUR' )	debit_card_specializing
SELECT T4.Description FROM `transactions_1k` AS T1 JOIN `products` AS T4 ON T1.ProductID = T4.ProductID WHERE T1.Currency = 'EUR'	debit_card_specializing
SELECT AVG(T1.Price * T1.Amount) AS AverageTotalPrice FROM transactions_1k T1 JOIN yearmonth T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date WHERE T2.Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(*)  FROM customers  JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID  WHERE customers.Currency = 'EUR' AND yearmonth.Consumption > 1000	debit_card_specializing
SELECT T1.Description  FROM products AS T1  JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID  JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID  WHERE T3.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T2.Time  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T2.ChainID = 11;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.Country = 'CZE' AND Date >= '2012-01-01'	debit_card_specializing
SELECT AVG(T1.Price * T1.Amount) AS AverageTotalPrice FROM transactions_1k T1 JOIN gasstations T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE';	debit_card_specializing
SELECT AVG(T1.Amount * T2.Price / 100) AS AverageTotalPrice FROM transactions_1k T1 JOIN yearmonth T2 ON T1.CustomerID = T2.CustomerID AND T2.Date = T1.Date JOIN customers T3 ON T1.CustomerID = T3.CustomerID WHERE T3.Currency = 'EUR'	debit_card_specializing
SELECT T1.CustomerID, SUM(T1.Amount) AS TotalAmount FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = '2012-08-25' GROUP BY T1.CustomerID ORDER BY TotalAmount DESC LIMIT 1;	debit_card_specializing
SELECT T2.Country  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Date = '2012-08-25'  ORDER BY T1.TransactionID  LIMIT 1;	debit_card_specializing
SELECT T1.Currency  FROM customers AS T1  JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Time = '16:25:00' AND T2.Date = '2012-08-24'	debit_card_specializing
SELECT c.Segment  FROM transactions_1k t1  JOIN customers c ON t1.CustomerID = c.CustomerID  WHERE t1.Date = '2012-08-23' AND t1.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN customers ON transactions_1k.CustomerID = customers.CustomerID  JOIN yearmonth ON transactions_1k.Date = yearmonth.Date AND transactions_1k.CustomerID = yearmonth.CustomerID  WHERE customers.Currency = 'EUR'  AND yearmonth.Date = '2012-08-26'  AND transactions_1k.Time < '13:00:00';	debit_card_specializing
SELECT Segment  FROM customers  WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT T2.Country  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT T1.ProductID FROM `transactions_1k` AS T1 JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date WHERE T1.Time = '21:20:00' AND T2.Date = '2012-08-23'	debit_card_specializing
SELECT T2.Date, T2.Amount  FROM transactions_1k AS T1  JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date  WHERE T1.Amount = 124.05 AND T2.Date LIKE '2012-08-24'  UNION  SELECT T2.Date, T2.Consumption  FROM transactions_1k AS T1  JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = T2.Date  WHERE EXTRACT(YEAR_MONTH FROM T1.Date) = '2012-01'  GROUP BY T2.Date, T2.Consumption  HAVING SUM(T1.Amount) = (SELECT SUM(T1.Amount) FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '2012-08-24')	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE Date = '2012-08-26' AND Time BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE'	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE ym.Date LIKE '201306%' AND SUM(ym.Consumption) = 214582.17	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467;	debit_card_specializing
SELECT T2.Currency  FROM transactions_1k AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T1.Amount = 548.4 AND T1.Date = '2012-08-24'	debit_card_specializing
SELECT      COUNT(*) * 100.0 / (         SELECT COUNT(*)         FROM customers         WHERE Currency = 'EUR'     ) AS percentage FROM yearmonth WHERE Date = '2012-08-25' AND CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Currency = 'EUR' )	debit_card_specializing
SELECT      ((SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END) - SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END)) /      SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END)) * 100 AS ConsumptionDecreaseRate FROM      yearmonth WHERE      Date = '2012-08-24' AND      CustomerID IN (         SELECT              CustomerID          FROM              transactions_1k          WHERE              Amount = 634.8     );	debit_card_specializing
SELECT T2.GasStationID, SUM(T1.Amount * T1.Price) AS TotalRevenue FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T2.GasStationID = T1.GasStationID GROUP BY T2.GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      SUM(CASE WHEN t.segment = 'SVK' AND t.description = 'premium' THEN 1 ELSE 0 END) * 100.0 / COUNT(t.segment)  FROM      transactions_1k t JOIN      customers c ON t.customerid = c.customerid WHERE      c.segment = 'SVK';	debit_card_specializing
SELECT SUM(Amount) AS TotalSpent FROM transactions_1k WHERE CustomerID = 38508;  SELECT SUM(Amount) AS January2012Spent FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '201201%';	debit_card_specializing
SELECT T1.Description  FROM products AS T1  JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID  GROUP BY T1.ProductID  ORDER BY SUM(T2.Amount) DESC  LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,      c.Currency,      AVG(p.Price / t.Amount) AS AveragePricePerItem FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID JOIN      products p ON t.ProductID = p.ProductID GROUP BY      c.CustomerID, c.Currency ORDER BY      SUM(t.Amount * p.Price) DESC LIMIT 1;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ProductID = 2 AND T2.Amount = (     SELECT MAX(T3.Amount)      FROM transactions_1k AS T3     WHERE T3.ProductID = 2 )	debit_card_specializing
SELECT y.Consumption  FROM yearmonth y  JOIN transactions_1k t ON y.CustomerID = t.CustomerID AND y.Date = t.Date  JOIN products p ON t.ProductID = p.ProductID  WHERE p.ProductID = 5 AND t.Price / t.Amount > 29.00 AND y.Date LIKE '201208%'	debit_card_specializing
