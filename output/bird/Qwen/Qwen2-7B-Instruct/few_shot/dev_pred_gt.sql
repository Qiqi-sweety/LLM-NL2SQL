SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS Highest_Eligible_Free_Rate_K_12 FROM frpm WHERE `County Name` = 'Alameda'	california_schools
SELECT      CDSCode,      `School Name`,      `District Name`,      `County Name`,      `Educational Option Type`,      `NSLP Provision Status`,      `Charter School (Y/N)`,      `Charter School Number`,      `Charter Funding Type`,      `Low Grade`,      `High Grade`,      `Enrollment (Ages 5-17)`,      `Free Meal Count (Ages 5-17)`,      `Percent (%) Eligible Free (Ages 5-17)`,      `FRPM Count (Ages 5-17)`,      `Percent (%) Eligible FRPM (Ages 5-17)` FROM      frpm WHERE      `Educational Option Type` = 'Continuation' ORDER BY      `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3;	california_schools
SELECT `Zip` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `Charter School (Y/N)` = 1 AND `County Name` = 'Fresno';	california_schools
SELECT     `MailStreet`, `MailStrAbr`, `MailCity`, `MailState`, `MailZip` FROM     schools WHERE     `CDSCode` IN (         SELECT             CDSCode         FROM             frpm         WHERE             `FRPM Count (K-12)` = (                 SELECT                     MAX(`FRPM Count (K-12)`)                 FROM                     frpm             )     );	california_schools
SELECT T1.Phone FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter = 1 AND T2.2013_14_CALPADS_Fall_1_Certification_Status = 1 AND T1.OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrMath < 400 AND schools.Virtual = 'F'	california_schools
SELECT `School` FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.enroll12 > 500 AND schools.Magnet = 1;	california_schools
SELECT T2.Phone  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.AvgScrRead > 1500 AND T1.AvgScrMath > 1500 AND T1.AvgScrWrite > 1500  ORDER BY T1.NumTstTakr DESC  LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores ss JOIN frpm fp ON ss.cds = fp.CDSCode WHERE fp.FRPM_Count_(K-12) = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT COUNT(*)  FROM satscores ss  JOIN schools sc ON ss.cds = sc.CDSCode  WHERE ss.AvgScrMath > 560 AND sc.FundingType = 'Directly funded'	california_schools
SELECT T1.FRPM_Count_Ages_5_17 FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) AS Highest_Free_Rate FROM frpm WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL AND T1.NumTstTakr > 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3	california_schools
SELECT T2.NCESSchool, COUNT(T2.Enrollment) AS Enrollment_Ages_5_to_17 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Age Range` = 'Ages 5-17' GROUP BY T2.NCESSchool ORDER BY Enrollment_Ages_5_to_17 DESC LIMIT 5	california_schools
SELECT s.Name AS District_Name, AVG(ss.AvgScrRead) AS Average_Score_Reading FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.CDSCode, s.Name ORDER BY Average_Score_Reading DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools  WHERE CDSCode IN (SELECT cds FROM satscores WHERE NumTstTakr < 100)	california_schools
SELECT T2.CDSCode, T2.CharterNum FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite = 499;	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.County = 'Contra Costa'  AND frpm.CharterFundingType = 'Directly funded'  AND frpm.NumTstTakr <= 250;	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.County = 'Amador' AND frpm.LowGrade = '9' AND frpm.HighGrade = '12'	california_schools
SELECT COUNT(*)  FROM (     SELECT *      FROM frpm      WHERE `Academic Year` = '2014-2015' AND `County Name` = 'Los Angeles'      AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700 ) AS filtered_schools	california_schools
SELECT s.name AS school_name, COUNT(st.taker_id) AS num_test_takers FROM schools s JOIN students st ON s.cdscd = st.school_code WHERE s.county = 'Contra Costa' GROUP BY s.cdscd, s.name ORDER BY num_test_takers DESC LIMIT 1;	california_schools
SELECT      `School Name`,     `Address`  FROM      (     SELECT          `School Name`,         `Address`,         `Enrollment (K-12)` - `Enrollment (Ages 5-17)` AS enrollment_diff     FROM          schools      JOIN          frpm ON schools.CDSCode = frpm.CDSCode     WHERE          `Enrollment (K-12)` - `Enrollment (Ages 5-17)` > 30     ) AS subquery	california_schools
SELECT DISTINCT s.name AS school_name FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE f.Percent_()Eligible_FREE(K-12) > 0.1 AND ss.AvgScrRead >= 1500 OR ss.AvgScrMath >= 1500 OR ss.AvgScrWrite >= 1500	california_schools
SELECT `FundingType` FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Riverside' AND satscores.AvgScrMath > 400;	california_schools
SELECT      `School Name`,     `Street`,     `City`,     `State`,     `Zip` FROM      `frpm` JOIN      `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE      `Academic Year` = '2014-2015' AND      `District Type` = 'High Schools (Public)' AND      `School Type` = 'High School' AND      `Age Group` = 'Ages 15-17' AND      `Free Meal Count (Ages 15-17)` > 800	california_schools
SELECT      s.School,     ss.AvgScrWrite,     s.Phone FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01' ORDER BY      s.School;	california_schools
SELECT      `School Name`,     `District Type` FROM      frpm WHERE      `Charter Funding Type` = 'Local' AND      (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) >     (         SELECT              AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)         FROM              frpm     )	california_schools
SELECT OpenDate FROM schools WHERE CDSCode IN (SELECT CDSCode FROM frpm ORDER BY Enrollment DESC LIMIT 1) AND GSserved = 'K-12'	california_schools
SELECT      T2.City FROM      frpm AS T1 JOIN      schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T1.`Low Grade` LIKE 'K%' GROUP BY      T2.City ORDER BY      SUM(T1.Enrollment) ASC LIMIT 5;	california_schools
SELECT      `School Name`,     `School Code`,     `Enrollment (K-12)`,     `Free Meal Count (K-12)`,     (`Free Meal Count (K-12)` / `Enrollment (K-12)`) * 100 AS 'Eligible Free Rate (%)' FROM      frpm WHERE      `Rank` IN (10, 11) ORDER BY      `Enrollment (K-12)` DESC LIMIT 2;	california_schools
SELECT      `FRPM Count (K-12)`,     `Enrollment (K-12)`,     (`FRPM Count (K-12)` / `Enrollment (K-12)`) * 100 AS 'FRPM Rate (%)' FROM      frpm WHERE      `Charter School (Y/N)` = '0' AND     `Charter School Number` IS NULL AND     `Charter Funding Type` = '66' AND     `School Type` LIKE '%High Schools%' OR     `School Type` LIKE '%Elementary Schools%' ORDER BY      `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.name, s.website FROM schools s JOIN frpm f ON s.cds = f.CDSCode WHERE f.FRPM_Count(Ages 5-17) BETWEEN 1900 AND 2000	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Name` LIKE '%Kacey Gibson%' AND `Age Range` = 'Ages 5-17'	california_schools
SELECT AdmEmail1  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE frpm.Charter = 1  ORDER BY frpm.Enrollment DESC  LIMIT 1;	california_schools
SELECT T2.AdminLName1, T2.AdminFName1  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.NumGE1500 IS NOT NULL AND T2.NumGE1500 >= 1500  ORDER BY T2.NumGE1500 DESC  LIMIT 1	california_schools
SELECT      `School` AS `Street`,     `City`,     `State`,     `Zip` FROM      schools JOIN      satscores ON schools.CDSCode = satscores.cds WHERE      satscores.NumGE1500 / satscores.NumTstTakr = (SELECT MIN(satscores.NumGE1500 / satscores.NumTstTakr) FROM satscores);	california_schools
SELECT schools.Website FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Los Angeles' AND satscores.enroll12 BETWEEN 2000 AND 3000	california_schools
SELECT AVG(T1.NumTstTakr) FROM satscores T1 JOIN schools T2 ON T1.cds = T2.CDSCode WHERE T2.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND T2.City = 'Fresno';	california_schools
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1	california_schools
SELECT s.CDSCode, s.CDSSchool, AVG(sc.AvgScrRead) AS AverageReadingScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.Virtual = 'F' GROUP BY s.CDSCode, s.CDSSchool ORDER BY AverageReadingScore DESC LIMIT 5;	california_schools
SELECT T2.rtype FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT AVG(AvgScrMath), T1.County FROM satscores AS T2 JOIN schools AS T1 ON T2.cds = T1.CDSCode WHERE (T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite) =  (SELECT MIN(T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite) FROM satscores AS T2)	california_schools
SELECT AVG(satscores.AvgScrWrite), schools.City FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 IS NOT NULL AND satscores.NumGE1500 >= 1500 GROUP BY schools.City ORDER BY COUNT(satscores.cds) DESC LIMIT 1;	california_schools
SELECT s.name AS School_Name, AVG(sc.AvgScrWrite) AS Average_Writing_Score FROM schools s JOIN satscores sc ON s.cds = sc.cds WHERE s.AdmEmail1 LIKE '%Ricci Ulrich%' OR s.AdmEmail2 LIKE '%Ricci Ulrich%' OR s.AdmEmail3 LIKE '%Ricci Ulrich%' GROUP BY s.name ORDER BY Average_Writing_Score DESC;	california_schools
SELECT `State`, COUNT(*) AS EnrolleeCount FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE `DOC` = '31' AND `School Type` LIKE 'Special%' GROUP BY `State` ORDER BY EnrolleeCount DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS "Monthly Average" FROM schools WHERE County = 'Alameda' AND DOCType = 'Elementary School District' AND DOC = 52 AND STRFTIME('%Y', OpenDate) = '1980';	california_schools
SELECT CAST(SUM(CASE WHEN T1.DOC = '52' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.DOC = '54' THEN 1 ELSE 0 END) FROM schools T1 INNER JOIN frpm T2 ON T1.CDSCode = T2.CDSCode WHERE T1.MailState = 'CA' AND SUBSTR(T1.County, 1, 3) = 'Orange'	california_schools
SELECT      S.County,      S.School,      S.ClosedDate  FROM      schools S  WHERE      S.StatusType = 'Closed'  GROUP BY      S.County,      S.School,      S.ClosedDate  ORDER BY      COUNT(*) DESC  LIMIT 1;	california_schools
SELECT T1.School, T1.Street FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1 OFFSET 5	california_schools
SELECT T2.MailStreet, T1.Sname FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores);	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite >= 1500  AND schools.MailCity = 'Lakeport'	california_schools
SELECT COUNT(*)  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE s.MailCity = 'Fresno'	california_schools
SELECT s.School, s.MailZip FROM schools s JOIN (     SELECT AdmFName1, AdmLName1     FROM schools     WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian' ) AS admin ON s.AdmFName1 = admin.AdmFName AND s.AdmLName1 = admin.AdmLName1;	california_schools
SELECT CAST(SUM(CASE WHEN T1.County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools T1 JOIN frpm T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA'	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.MailState = 'CA'  AND frpm.County = 'San Joaquin'  AND schools.StatusType = 'Active';	california_schools
SELECT `Phone`, `Ext` FROM schools WHERE `Phone` IS NOT NULL AND `Ext` IS NOT NULL ORDER BY `AvgScrWrite` DESC LIMIT 1 OFFSET 332;	california_schools
SELECT `School`, Phone, Ext FROM schools WHERE `Zip` = '95203-3704';	california_schools
SELECT T2.Website FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE (T1.AdmFName1 = 'Mike' AND T1.AdmLName1 = 'Larson') OR (T1.AdmFName1 = 'Dante' AND T1.AdmLName1 = 'Alvarez')	california_schools
SELECT schools.Website FROM schools WHERE schools.Virtual = 'P' AND schools.Charter = 1 AND schools.State = 'CA' AND schools.DOCType = 'San Joaquin';	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.Doc = '52' AND frpm.Charter = 1 AND schools.City = 'Hickman';	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Los Angeles'  AND frpm.Charter = 0  AND (frpm.FreeMealCount_K_12 * 100 / frpm.Enrollment_K_12) < 0.18	california_schools
SELECT      T2.School,      T2.City,      T1.AdmFName1 || ' ' || T1.AdmLName1 AS AdministratorName FROM      schools AS T1 JOIN      frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T1.Charter = 1 AND T1.CharterNum = '00D2'	california_schools
SELECT COUNT(*) FROM schools WHERE MailingCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      CAST(SUM(CASE WHEN FundingType = 'Local' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      schools  WHERE      County = 'Santa Clara' AND      DOCType = 'Charter';	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Stanislaus'  AND FundingType = 'Directly funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.City = 'San Francisco'  AND frpm._Academic_Year = '1989'  AND frpm.DOCType = 'Community College District'  AND schools.StatusType = 'Closed';	california_schools
SELECT `County` FROM schools WHERE `Year` BETWEEN 1980 AND 1989 AND `Ownership Code` = 'CEA' GROUP BY `County` ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT `NCESDist` FROM schools WHERE `School Ownership Code` = 'SS' AND SOC = '31';	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine'  AND (StatusType = 'Active' OR StatusType = 'Closed')  AND DOCType = 'District Community Day'	california_schools
SELECT `District Code` FROM schools WHERE `City` = 'Fresno' AND Magnet = 0;	california_schools
SELECT SUM(`Enrollment (Ages 5-17)`)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.DOC = 'SSS'  AND `Academic Year` = '2014-2015';	california_schools
SELECT `FRPM Count (Ages 5-17)` FROM frpm WHERE `Mailing Street Address` = 'PO Box 1040' AND `School Name` LIKE 'Youth Authority%'	california_schools
SELECT `Low Grade` FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE EdOpsCode = 'SPECON' AND NCESDist = '613360';	california_schools
SELECT `School Name` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `Educational Option Type` = 'Breakfast Provision 2' AND `County Code` = '37';	california_schools
SELECT T1.City FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.LunchProvision = 'Lunch Provision 2' AND T2.LowGrade = '9' AND T2.HighGrade = '12' AND T1.EILCode = 'HS' AND T1.County = 'Merced'	california_schools
SELECT      s.name AS School_Name,     (ss.free_meal_count_ages_5_17 / ss.enrollment_ages_5_17 * 100) AS Percent_Eligible_FRPM_Ages_5_17 FROM      schools s JOIN      frpm f ON s.cds_code = f.CDSCode JOIN      satscores ss ON s.cds_code = ss.cds WHERE      s.county = 'Los Angeles' AND      s.gs_served = 'K-9' AND      f.CDSCode IN (         SELECT cds FROM frpm WHERE `Low Grade` LIKE 'K%' AND `High Grade` LIKE '9%'     );	california_schools
SELECT COUNT(*) AS frequency, `Grade Span` FROM schools WHERE `City` = 'Adelanto' GROUP BY `Grade Span` ORDER BY frequency DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools  WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F';	california_schools
SELECT School, Latitude FROM schools WHERE Latitude = (SELECT MAX(Latitude) FROM schools) LIMIT 1;	california_schools
SELECT sname, `Low Grade` FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE State = 'CA' ORDER BY Latitude ASC LIMIT 1;	california_schools
SELECT `Grade Span` FROM schools WHERE Longitude = (SELECT MAX(Longitude) FROM schools);	california_schools
SELECT COUNT(*) AS total_schools,         City AS city,         COUNT(*) AS schools_in_city FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE Magnet = 1 AND `Educational Option Type` IS NOT NULL GROUP BY City	california_schools
SELECT S.MailCity, AdmFName1 AS AdministratorFirstName, COUNT(*) AS Count FROM schools S JOIN (     SELECT AdmFName1, AdmLName1 FROM schools WHERE AdmFName1 IS NOT NULL     UNION ALL     SELECT AdmFName2, AdmLName2 FROM schools WHERE AdmFName2 IS NOT NULL     UNION ALL     SELECT AdmFName3, AdmLName3 FROM schools WHERE AdmFName3 IS NOT NULL ) T ON S.CDSCode = T.AdmLName1 || T.AdmFName1 || SUBSTR(S.DOC, 1, 5) GROUP BY S.MailCity, AdministratorFirstName ORDER BY Count DESC LIMIT 2;	california_schools
SELECT `District Code` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE AdmFName1 LIKE 'Alusine' OR AdmFName2 LIKE 'Alusine' OR AdmFName3 LIKE 'Alusine'	california_schools
SELECT      AdmLName1 AS AdministratorLastName,     CASE          WHEN DOC = 'Alameda Unified' THEN 'Alameda Unified'         ELSE District     END AS District,     County,     SchoolName FROM      schools WHERE      CharterNum = '40';	california_schools
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND SOC = '62' OR DOC = '54';	california_schools
SELECT T2.AdminEmail1 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 IS NOT NULL AND T2.AvgScrRead >= 1500 AND T2.AvgScrMath >= 1500 ORDER BY T2.NumTstTakr DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district dist ON c.district_id = dist.district_id  WHERE dist.A3 LIKE '%East Bohemia%' AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague'  AND EXISTS (     SELECT 1      FROM loan      WHERE account.account_id = loan.account_id      AND loan.status IN ('A', 'B', 'C', 'D') );	financial
SELECT      AVG(A12) AS avg_unemployment_1995,     AVG(A13) AS avg_unemployment_1996 FROM      district WHERE      A4 = '1995' OR A4 = '1996'	financial
SELECT COUNT(*)  FROM client  WHERE gender = 'F'  AND (SELECT AVG(A11) FROM district WHERE client.district_id = district.district_id) > 6000  AND (SELECT AVG(A11) FROM district WHERE client.district_id = district.district_id) < 10000;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A3 LIKE 'North Bohemia' AND district.A11 > 8000	financial
WITH female_clients AS (   SELECT c.client_id, AVG(d.A11) AS avg_salary   FROM client c   JOIN district d ON c.district_id = d.district_id   WHERE c.gender = 'F'   GROUP BY c.client_id ),  oldest_female AS (   SELECT MIN(birth_date) AS min_birth_date   FROM client   WHERE gender = 'F' ),  youngest_oldest_female AS (   SELECT MAX(client_id) AS max_client_id   FROM (     SELECT client_id, birth_date     FROM client     WHERE gender = 'F'     ORDER BY birth_date ASC     LIMIT 1   ) ),  min_avg_salary AS (   SELECT MIN(avg_salary) AS min_salary   FROM female_clients ),  max_avg_salary AS (   SELECT MAX(avg_salary) AS max_salary   FROM female_clients ),  gap AS (   SELECT (SELECT max_salary FROM max_avg_salary) - (SELECT min_salary FROM min_avg_salary) AS gap   FROM dual )  SELECT MAX(trans.account_id) AS account_number, gap.gap FROM trans JOIN account a ON trans.account_id = a.account_id JOIN youngest_oldest_female yo ON yo.max_client_id = a.client_id JOIN oldest_female o ON o.min_birth_date = client.birth_date JOIN female_clients f ON f.client_id = a.client_id JOIN min_avg_salary m ON m.min_salary = f.avg_salary JOIN max_avg_salary mx ON mx.max_salary = f.avg_salary JOIN gap g ON TRUE GROUP BY gap.gap ORDER BY gap.gap DESC, MAX(trans.account_id) LIMIT 1;	financial
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.account_id WHERE T2.birth_date IN (     SELECT MAX(birth_date) FROM client ) AND T1.account_id IN (     SELECT T3.account_id FROM account AS T3     JOIN client AS T4 ON T3.account_id = T4.account_id     GROUP BY T3.account_id     ORDER BY AVG(T4.A11) DESC     LIMIT 1 )	financial
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER'	financial
SELECT c.client_id, c.gender, c.birth_date, d.A2, d.A3, d.A4, d.A5, d.A6, d.A7, d.A8, d.A9, d.A10, d.A11, d.A12, d.A13, d.A14, d.A15, d.A16 FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT';	financial
SELECT account.account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE strftime('%Y', loan.date) = '1997' ORDER BY loan.amount ASC, strftime('%w', loan.date) = '0' DESC LIMIT 1;	financial
SELECT account.account_id, MAX(loan.amount) AS max_approved_amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND STRFTIME('%Y', loan.date) = '1993' GROUP BY account.account_id ORDER BY max_approved_amount DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.A2 = 'Slokolov'	financial
SELECT account_id, date FROM trans WHERE date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY date ASC LIMIT 1;	financial
SELECT account.account_id FROM account JOIN card ON account.account_id = card.account_id JOIN client ON card.client_id = client.client_id WHERE account.date < '1997-01-01' AND EXISTS (     SELECT 1     FROM trans     WHERE trans.account_id = account.account_id     AND trans.amount > 3000 )	financial
SELECT client_id FROM card WHERE issued LIKE '1994/%' AND issued LIKE '%/3/3';	financial
SELECT `date` FROM account WHERE account_id = (SELECT account_id FROM trans WHERE amount = 840 AND strftime('%Y-%m-%d', date) = '1998-10-14')	financial
SELECT T1.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date BETWEEN '1994-08-25' AND '1994-08-25';	financial
SELECT MAX(amount) AS BiggestTransactionAmount FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card WHERE issued BETWEEN '1996-10-01' AND '1996-11-01'));	financial
SELECT c.gender  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.client_id = (     SELECT MAX(c2.client_id)      FROM client c2      JOIN district d2 ON c2.district_id = d2.district_id      WHERE d2.A11 = (         SELECT AVG(d3.A11)          FROM district d3          WHERE EXISTS (             SELECT 1              FROM account a              WHERE a.district_id = d3.district_id         )     ) )	financial
SELECT MIN(t.amount) AS first_transaction_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' AND l.amount = (SELECT MAX(amount) FROM loan)	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Jesenik' AND client.gender = 'F';	financial
SELECT disp_id FROM disp WHERE client_id IN (     SELECT client_id FROM client WHERE client_id IN (         SELECT client_id FROM trans WHERE amount = 5100 AND date LIKE '1998-%-%' AND type = 'PRIJEM'     ) )	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice' AND strftime('%Y', account.date) = '1996';	financial
SELECT T3.A2  FROM client AS T1  JOIN disp AS T2 ON T1.client_id = T2.client_id  JOIN account AS T3 ON T2.account_id = T3.account_id  WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date LIKE '1996-01-03' AND l.status = 'A';	financial
SELECT account_id  FROM account  JOIN client ON account.account_id = client.client_id  JOIN district ON client.district_id = district.district_id  WHERE district.A3 = 'Prague'  ORDER BY date  LIMIT 1;	financial
SELECT      CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id)  FROM      client AS T1  JOIN      district AS T2 ON T1.district_id = T2.district_id  WHERE      T2.A3 = 'south Bohemia' AND T2.A4 IS NOT NULL  ORDER BY      T2.A4 DESC  LIMIT 1;	financial
SELECT      ((t.balance - (SELECT t.balance FROM trans AS t WHERE t.date = '1993-03-22')) /       (SELECT t.balance FROM trans AS t WHERE t.date = '1993-03-22')) * 100 AS increase_rate FROM      trans AS t WHERE      t.date = '1998-12-27' AND      (SELECT l.date FROM loan AS l WHERE l.account_id = t.account_id) <= '1993-07-05' ORDER BY      l.date DESC LIMIT 1	financial
SELECT      CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) OVER () AS percentage_paid_with_no_issue FROM      loan	financial
SELECT      COUNT(*) FILTER (WHERE amount < 100000 AND status = 'C') * 100.0 / COUNT(*) OVER () AS percentage FROM      loan	financial
SELECT      a.account_id,      d.A2 AS district_name,      d.A3 AS district_region  FROM      account a  JOIN      disp d ON a.account_id = d.account_id  JOIN      district dt ON d.district_id = dt.district_id  WHERE      a.date BETWEEN '1993-01-01' AND '1993-12-31'  AND      d.type = 'POPLATEK PO OBRATU'	financial
SELECT T1.account_id, T1.frequency FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'east Bohemia' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT account.account_id, account.date  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Prachatice'	financial
SELECT T3.A2, T3.A3 FROM loan AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.loan_id = '4990'	financial
SELECT T1.account_id, T2.A2, T3.A3 FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.amount > 300000	financial
SELECT      loan_id,      district.A3 AS district,      A11 AS average_salary  FROM      loan  JOIN      account ON loan.account_id = account.account_id  JOIN      district ON account.district_id = district.district_id  WHERE      duration = 60;	financial
SELECT D.A15 AS District,         ((D.A13 - D.A12) / D.A12) * 100 AS Unemployment_Increment_Percentage FROM district D JOIN client C ON D.district_id = C.district_id JOIN disp DP ON C.client_id = DP.client_id JOIN account AC ON DP.account_id = AC.account_id JOIN loan LO ON AC.account_id = LO.account_id WHERE LO.status = 'D'	financial
SELECT      (COUNT(*) FILTER (WHERE T3.A2 = 'Decin') * 100.0 / COUNT(*)) AS percentage FROM      account T1 JOIN      disp T2 ON T1.account_id = T2.account_id JOIN      client T3 ON T2.client_id = T3.client_id JOIN      district T4 ON T3.district_id = T4.district_id WHERE      T4.A2 = 'Decin' AND      T1.date = '1993-02-26';	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT T1.A2, COUNT(T3.client_id) AS FemaleAccountHolders FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN client AS T3 ON T2.account_id = T3.account_id AND T3.gender = 'F' GROUP BY T1.district_id, T1.A2 ORDER BY FemaleAccountHolders DESC LIMIT 10	financial
SELECT T1.A2, SUM(T3.amount) AS TotalWithdrawals FROM district AS T1 JOIN disp AS T2 ON T1.district_id = T2.disp_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ' AND T3.date LIKE '1996-01%' GROUP BY T1.district_id ORDER BY TotalWithdrawals DESC LIMIT 10;	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A3 = 'South Bohemia' AND client.client_id NOT IN  (SELECT disp_id FROM card);	financial
SELECT T3.A3  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T3.district_id = T2.client_id  JOIN loan AS T4 ON T1.account_id = T4.account_id  WHERE T4.status = 'C'  GROUP BY T3.A3  ORDER BY COUNT(T4.loan_id) DESC  LIMIT 1;	financial
SELECT AVG(amount)  FROM loan  JOIN client ON loan.account_id = client.account_id  WHERE client.gender = 'M'	financial
SELECT T1.A2 AS BranchLocation, T1.A4 AS DistrictName FROM district AS T1 WHERE T1.A4 IN (     SELECT T2.A4     FROM district AS T2     JOIN (         SELECT T3.A4, MAX(T3.A13) AS MaxUnemploymentRate         FROM district AS T3         WHERE STRFTIME('%Y', T3.A7) = '1996'         GROUP BY T3.A4     ) AS T4     ON T2.A4 = T4.A4 AND T2.A13 = T4.MaxUnemploymentRate )	financial
SELECT COUNT(*)  FROM (     SELECT district_id, A16     FROM district     WHERE strftime('%Y', '1996-01-01') || '-' || strftime('%Y', '1996-12-31') = '1996' ) AS crimes_per_district JOIN account ON district.district_id = account.district_id WHERE A16 = (     SELECT MAX(A16)     FROM district     WHERE strftime('%Y', '1996-01-01') || '-' || strftime('%Y', '1996-12-31') = '1996' )	financial
SELECT COUNT(*)  FROM (     SELECT account_id, balance     FROM trans     WHERE type = 'VYBER KARTOU' AND balance < 0     AND frequency = 'POPLATEK MESICNE' ) AS filtered_transactions;	financial
SELECT COUNT(*)  FROM account  JOIN loan ON account.account_id = loan.account_id  WHERE date BETWEEN '1995-01-01' AND '1997-12-31'  AND amount >= 250000  AND frequency = 'POPLATEK MESICNE'  AND status = 'A';	financial
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  JOIN district ON client.district_id = district.district_id  WHERE district.district_id = 1 AND account.status = 'C'	financial
SELECT COUNT(*)  FROM client  WHERE client.district_id IN (     SELECT district.district_id      FROM (         SELECT district.A15 AS crimes_1995, district.district_id          FROM district          ORDER BY crimes_1995 DESC          LIMIT 1 OFFSET 1      ) AS subquery ) AND client.gender = 'M';	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.card_id = disp.disp_id  WHERE card.type = 'gold' AND disp.type = 'DISPONENT';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Pisek';	financial
SELECT T3.A3 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 10000 AND T1.date LIKE '1997-%' AND T1.k_symbol = 'USD'	financial
SELECT T1.account_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.bank = 'YZ' AND T2.k_symbol = 'SIPO' AND T1.A15 = 'Pisek';	financial
SELECT DISTINCT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.client_id = card.disp_id WHERE card.type = 'gold' INTERSECT SELECT DISTINCT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.client_id = card.disp_id WHERE card.type = 'junior';	financial
SELECT AVG(amount) AS average_amount FROM trans JOIN account ON trans.account_id = account.account_id JOIN card ON account.account_id = card.account_id WHERE trans.date LIKE '2021-%' AND trans.type = 'VYBER KARTOU';	financial
SELECT t.account_id FROM trans t JOIN card c ON t.account_id = c.card_id AND t.date LIKE '1998-%' WHERE t.amount < (     SELECT AVG(amount)     FROM trans     WHERE date LIKE '1998-%' ) AND t.type = 'VYBER KARTOU' GROUP BY t.account_id HAVING SUM(t.amount) < (     SELECT AVG(amount)     FROM trans     WHERE date LIKE '1998-%'     GROUP BY account_id )	financial
SELECT c.client_id, c.gender, c.birth_date, ac.account_id, ac.frequency, ac.date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account ac ON d.account_id = ac.account_id WHERE c.gender = 'F' AND EXISTS (     SELECT 1 FROM loan l WHERE ac.account_id = l.account_id );	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A3 = 'south Bohemia';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.frequency = 'OWNER'	financial
SELECT DISTINCT account.frequency FROM account JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id JOIN district ON client.district_id = district.district_id JOIN loan ON account.account_id = loan.account_id WHERE disp.type = 'OWNER' AND district.A11 BETWEEN 8000 AND 9000	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 LIKE 'North Bohemia' AND t.bank = 'AB';	financial
SELECT T3.A2  FROM trans AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.type = 'VYDAJ'	financial
SELECT AVG(A15)  FROM district  WHERE A3 IN (     SELECT T3.A3      FROM (         SELECT T2.A3, COUNT(*) AS cnt          FROM account AS T1          JOIN disp AS T2 ON T1.account_id = T2.account_id          WHERE T1.date >= '1997-01-01'          GROUP BY T2.A3          HAVING COUNT(*) > 4000     ) AS T3 )	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.card_id = disp.disp_id  JOIN account ON disp.account_id = account.account_id  WHERE card.type = 'classic' AND account.frequency = 'OWNER'	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M'	financial
SELECT      CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      card	financial
SELECT c.client_id, c.gender, c.birth_date, d.A1 FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) AND l.status = 'A' AND a.type = 'OWNER'	financial
SELECT COUNT(*)  FROM district  JOIN account ON district.district_id = account.district_id  WHERE account.account_id = 532 AND A15 IS NOT NULL;	financial
SELECT T1.district_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333;	financial
SELECT t.trans_id, t.date, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.client_id = 3356 AND t.type = 'VYBER' ORDER BY t.date;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE account.frequency = 'POPLATEK TYDNE' AND        EXISTS (           SELECT 1            FROM loan            WHERE loan.account_id = account.account_id AND                  loan.amount < 200000       )	financial
SELECT type FROM card WHERE card_id = (SELECT card_id FROM disp WHERE client_id = 13539)	financial
SELECT T1.A3 FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541;	financial
SELECT D.A2  FROM district D JOIN client C ON D.district_id = C.district_id JOIN disp DS ON C.client_id = DS.client_id JOIN account AC ON DS.account_id = AC.account_id JOIN loan LO ON AC.account_id = LO.account_id WHERE LO.status = 'A' GROUP BY D.district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT account_id FROM "order" WHERE order_id = 32423;	financial
SELECT t.trans_id, a.account_id, a.date, t.type, t.operation, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.district_id = 5	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik';	financial
SELECT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cr ON d.disp_id = cr.disp_id  WHERE cr.type = 'junior' AND cr.issued >= '1997-01-01'	financial
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.client_id)  FROM      client c JOIN      account a ON c.client_id = a.account_id JOIN      district d ON c.district_id = d.district_id WHERE      d.A11 > 10000	financial
SELECT      ((SUM(amount WHERE strftime('%Y', date) = '1997') - SUM(amount WHERE strftime('%Y', date) = '1996')) /       (SUM(amount WHERE strftime('%Y', date) = '1996'))) * 100 AS growth_rate FROM      loan WHERE      client_id IN (         SELECT              client_id          FROM              client          WHERE              gender = 'M'     );	financial
SELECT COUNT(*)  FROM trans  WHERE type = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT      (SELECT A16 FROM district WHERE A3 = 'North Bohemia') -      (SELECT A16 FROM district WHERE A3 = 'East Bohemia')	financial
SELECT COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10  AND type IN ('OWNER', 'DISPONENT')	financial
SELECT COUNT(*) AS requests, SUM(amount) AS total_debit FROM `order` WHERE account_id = 3 AND k_symbol = 'ST';	financial
SELECT T2.birth_date FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T1.account_id = 130;	financial
SELECT COUNT(*)  FROM disp  JOIN account ON disp.account_id = account.account_id  WHERE type = 'OWNER' AND account.frequency = 'POPLATEK PO OBRATU'	financial
SELECT loan.amount, loan.payments FROM loan JOIN account ON loan.account_id = account.account_id WHERE account.client_id = 992;	financial
SELECT SUM(amount),         CASE WHEN client.gender = 'M' THEN 'man' ELSE 'woman' END AS owner_gender FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id WHERE account.account_id = (     SELECT account_id FROM trans WHERE trans_id = 851 )	financial
SELECT t2.type FROM client AS t1 JOIN disp AS t2 ON t1.client_id = t2.client_id WHERE t1.client_id = 9;	financial
SELECT SUM(amount) AS total_paid FROM trans JOIN account ON trans.account_id = account.account_id WHERE account.client_id = 617 AND YEAR(date) = 1998;	financial
SELECT c.client_id  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A4 = 'East Bohemia';	financial
SELECT client_id  FROM client  WHERE gender = 'F'  ORDER BY MAX(amount * payments) DESC  LIMIT 3;	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  WHERE client.gender = 'M'  AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND account.frequency = 'HOME'  AND account.amount > 4000	financial
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  JOIN district ON client.district_id = district.district_id  WHERE district.A4 = 'Beroun' AND date > '1996-12-31';	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A15 IS NOT NULL	financial
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.client_id)  FROM      client c  JOIN      disp d ON c.client_id = d.client_id  JOIN      account a ON d.account_id = a.account_id  JOIN      district d1 ON c.district_id = d1.district_id  WHERE      d1.A3 = 'Prague';	financial
SELECT      CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.frequency) FROM      account AS T1 JOIN      client AS T2 ON T1.district_id = T2.district_id WHERE      T1.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(*)  FROM account  WHERE frequency = 'POPLATEK TYDNE'	financial
SELECT account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 24 AND date < '1997-01-01' ORDER BY amount ASC LIMIT 1;	financial
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T2.gender = 'F' ORDER BY T2.A10 ASC, T1.date ASC LIMIT 1	financial
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE strftime('%Y', client.birth_date) = '1920' AND district.A3 LIKE 'East Bohemia%'	financial
SELECT COUNT(*)  FROM loan  WHERE duration = 24 AND status = 'A' AND frequency = 'POPLATEK TYDNE';	financial
SELECT      t.date,     AVG(l.amount) AS average_loan_amount FROM      trans t JOIN      account a ON t.account_id = a.account_id JOIN      loan l ON a.account_id = l.account_id WHERE      l.status IN ('C', 'D') AND      t.type = 'POPLATEK PO OBRATU' GROUP BY      t.date;	financial
SELECT c.client_id, d.A1 FROM client c JOIN district d ON c.district_id = d.district_id WHERE EXISTS (     SELECT 1     FROM disp disp     WHERE disp.client_id = c.client_id     AND disp.type = 'OWNER' ) OR EXISTS (     SELECT 1     FROM account acc     WHERE acc.account_id IN (         SELECT acc.account_id         FROM disp d         WHERE d.client_id = c.client_id         AND d.type = 'OWNER'     )     AND acc.frequency = 'POPLATEK MESICNE' )	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURRENT_DATE) AS age  FROM client c JOIN card ca ON c.client_id = ca.disp_id WHERE ca.type = 'gold' AND EXISTS (     SELECT 1 FROM loan l WHERE l.account_id = ca.account_id AND l.status = 'A' )	financial
SELECT bond_type  FROM bond  GROUP BY bond_type  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '-' AND a.element = 'cl'	toxicology
SELECT AVG(CASE WHEN m.label = '+' THEN COUNT(*) END) AS avg_oxygen_atoms_in_single_bonded_molecules FROM (     SELECT c.molecule_id     FROM connected c     JOIN atom a ON c.atom_id = a.atom_id     JOIN bond b ON c.bond_id = b.bond_id     WHERE b.bond_type = '-' ) sb_bonds JOIN molecule m ON sb_bonds.molecule_id = m.molecule_id JOIN atom a ON a.molecule_id = sb_bonds.molecule_id WHERE a.element = 'o';	toxicology
SELECT AVG(CASE WHEN T3.bond_type = '-' THEN 1 ELSE 0 END) AS average_single_bonded_carcinogenic_molecules FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.atom_id = ANY(T3.bond_id) WHERE T2.label = '+';	toxicology
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN element e ON a.element = e.element  WHERE e.element = 'na' AND m.label = '-'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+';	toxicology
SELECT      CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM      atom AS T1 JOIN      connected AS T3 ON T1.atom_id = T3.atom_id JOIN      bond AS T2 ON T2.bond_id = T3.bond_id WHERE      T2.bond_type = '='	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'si'	toxicology
SELECT T3.element  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id  WHERE T1.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T3.bond_id = T2.bond_id  WHERE T3.bond_type = ' =' ;	toxicology
SELECT label  FROM (     SELECT label, COUNT(*) AS count_label,             (SELECT COUNT(*) FROM atom WHERE element = 'h') AS total_hydrogen_atoms     FROM atom     GROUP BY label ) AS labeled_atoms WHERE count_label = (SELECT MAX(count_label) FROM (     SELECT COUNT(*) AS count_label     FROM atom     WHERE element = 'h'     GROUP BY label ))	toxicology
SELECT T3.bond_type FROM `atom` AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T1.element = 'te' AND T2.label IN ('+', '-')	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '-'	toxicology
SELECT DISTINCT A.atom_id  FROM atom A JOIN connected C ON A.atom_id = C.atom_id JOIN bond B ON C.bond_id = B.bond_id JOIN molecule M ON A.molecule_id = M.molecule_id WHERE M.label = '-'	toxicology
SELECT atom.element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '-'  GROUP BY atom.element  ORDER BY COUNT(*) ASC  LIMIT 1;	toxicology
SELECT T3.bond_type FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T3.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8');	toxicology
SELECT DISTINCT label  FROM molecule  WHERE molecule_id NOT IN (     SELECT DISTINCT molecule_id      FROM atom      WHERE element = 'sn' ) AND label IS NOT NULL	toxicology
SELECT COUNT(*)  FROM atom a  JOIN bond b ON a.atom_id = ANY(SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-'))  JOIN atom a2 ON a2.atom_id = ANY(SELECT atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-'))  WHERE a.element IN ('i', 's') AND b.bond_type = '-'	toxicology
SELECT DISTINCT c.atom_id, a.element  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#'	toxicology
SELECT DISTINCT a.atom_id  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181' OR (a.atom_id IN (SELECT atom_id FROM connected WHERE atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181'))) OR (a.atom_id2 IN (SELECT atom_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')));	toxicology
SELECT      (COUNT(CASE WHEN atom.element != 'f' THEN 1 END) / CAST(COUNT(*) AS REAL)) * 100 AS percentage_carcinogenic_without_fluorine FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT      (SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) / CAST(COUNT(T1.bond_id) AS REAL)) * 100 AS percentage FROM      bond AS T1 JOIN      molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.label = '+';	toxicology
SELECT T1.element  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.molecule_id = 'TR000'  ORDER BY T1.element ASC  LIMIT 3	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR001_2_6' AND T2.molecule_id = 'TR001';	toxicology
SELECT      (SUM(CASE WHEN `molecule`.`label` = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN `molecule`.`label` = '-' THEN 1 ELSE 0 END)) AS difference FROM      `molecule`	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT T3.bond_id FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id = T2.atom_id JOIN `connected` AS T3 ON T1.atom_id2 = T3.atom_id2 WHERE T2.atom_id = 'TR000_2' AND T3.atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id, m.label  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' ORDER BY m.label LIMIT 5	toxicology
SELECT      (SUM(CASE WHEN `bond_type` = '=' THEN 1 ELSE 0 END) / COUNT(`bond_id`)) * 100 AS percentage_double_bonds FROM      `bond` JOIN      `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE      `molecule.molecule_id` = 'TR008'	toxicology
SELECT      (SUM(CASE WHEN `label` = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(`molecule_id`)) AS percent FROM `molecule`;	toxicology
SELECT      (SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) / COUNT(atom.atom_id)) * 100 AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.molecule_id = 'TR206';	toxicology
SELECT T3.bond_type  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T2.bond_id = T3.bond_id  WHERE T1.molecule_id = 'TR000'	toxicology
SELECT atom.element, molecule.label  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN connected ON atom.atom_id = connected.atom_id2  JOIN bond ON connected.bond_id = bond.bond_id  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR006' AND molecule.label = '+';	toxicology
SELECT      T2.bond_type,      COUNT(T2.bond_type) AS bond_count,     CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenic_status FROM      molecule AS T1 JOIN      bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T1.molecule_id = 'TR018' GROUP BY      T2.bond_type, T1.label HAVING      COUNT(T2.bond_type) >= ALL (         SELECT              COUNT(*)          FROM              bond AS T2         JOIN              molecule AS T1 ON T1.molecule_id = T2.molecule_id         WHERE              T1.molecule_id = 'TR018' AND T1.label <> '+'     ) ORDER BY      COUNT(T2.bond_type) DESC LIMIT 1;	toxicology
SELECT T1.molecule_id  FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.bond_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '-' ORDER BY T1.label ASC LIMIT 3	toxicology
SELECT T2.bond_id  FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN connected AS T4 ON T1.atom_id = T4.atom_id2  JOIN bond AS T2 ON T2.bond_id = T3.bond_id OR T2.bond_id = T4.bond_id  WHERE T1.molecule_id = 'TR006'  ORDER BY T2.bond_id  LIMIT 2	toxicology
SELECT COUNT(*)  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  JOIN atom ON (atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2)  WHERE bond.molecule_id = 'TR009' AND (atom.atom_id = 'TR009_12' OR atom.atom_id2 = 'TR009_12')	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+'  AND EXISTS (     SELECT 1      FROM atom      WHERE molecule_id = molecule.molecule_id      AND element = 'br' )	toxicology
SELECT T3.bond_type, T1.atom_id AS atom_id1, T2.atom_id AS atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_6_9';	toxicology
SELECT m.label, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenic_status  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'	toxicology
SELECT COUNT(*)  FROM connected  WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'	toxicology
SELECT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN connected AS T3 ON T1.atom_id = T3.atom_id2  JOIN bond AS T4 ON T2.bond_id = T4.bond_id OR T3.bond_id = T4.bond_id  JOIN molecule AS T5 ON T5.molecule_id = T1.molecule_id  WHERE T5.molecule_id = 'TR004'  GROUP BY T1.element;	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '-'	toxicology
SELECT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T3.molecule_id = T1.molecule_id AND SUBSTR(T1.atom_id, 7, 2) BETWEEN 21 AND 25 AND T3.label = '+';	toxicology
SELECT T3.bond_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T3.molecule_id = T2.molecule_id WHERE T1.element = 'p' OR T1.element = 'n'	toxicology
SELECT m.label  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '='  GROUP BY m.molecule_id  ORDER BY COUNT(*) DESC  LIMIT 1  AND m.label = '+';	toxicology
SELECT AVG(T3.bond_count) AS avg_bonds FROM (     SELECT COUNT(T2.bond_id) AS bond_count     FROM atom AS T1     JOIN bond AS T2 ON T1.atom_id = T2.atom_id     WHERE T1.element = 'i'     GROUP BY T1.atom_id ) AS T3	toxicology
SELECT      T3.bond_id,     CASE          WHEN T3.bond_type = ' = ' THEN 'double'         WHEN T3.bond_type = '-' THEN 'single'         WHEN T3.bond_type = '#' THEN 'triple'         ELSE T3.bond_type     END AS bond_type FROM      atom AS T1 JOIN      connected AS T2 ON T1.atom_id = T2.atom_id AND T1.atom_id2 = 'TR000_45' JOIN      bond AS T3 ON T3.bond_id = T2.bond_id WHERE      SUBSTR(T1.atom_id, 7, 2) + 0 = 45	toxicology
SELECT element  FROM atom  WHERE atom_id NOT IN (SELECT atom_id FROM connected) AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T4.molecule_id = 'TR447' AND T3.bond_type = '#'	toxicology
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.molecule_id IN (SELECT T4.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.atom_id IN (SELECT atom_id2 FROM connected WHERE bond_id = 'TR144_8_19') UNION SELECT T4.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T3.atom_id IN (SELECT atom_id2 FROM connected WHERE bond_id = 'TR144_8_19')) AND T1.molecule_id = T3.molecule_id;	toxicology
SELECT T1.molecule_id  FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T1.label = '+' AND T2.bond_type = '='  GROUP BY T1.molecule_id  ORDER BY COUNT(T2.bond_id) DESC  LIMIT 1	toxicology
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'  GROUP BY element  ORDER BY COUNT(*) ASC  LIMIT 1;	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type != '-' AND NOT EXISTS (SELECT * FROM atom AS T4 WHERE T4.element = 'pb' AND T4.atom_id = T1.atom_id)	toxicology
SELECT T3.element  FROM connected AS T1  JOIN bond AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON (T1.atom_id = T3.atom_id OR T1.atom_id2 = T3.atom_id)  WHERE T2.bond_type = '#'  AND (T3.element = 'cl' AND T2.molecule_id IN (SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-' AND T1.atom_id IN (SELECT atom_id FROM atom WHERE element = 'c')))  OR (T3.element = 'c' AND T2.molecule_id IN (SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-' AND T1.atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl')))	toxicology
SELECT      (COUNT(b.bond_id) * 100.0 / (SELECT COUNT(*) FROM atom WHERE element IN (         SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) DESC LIMIT 1))) AS percentage FROM      bond b;	toxicology
SELECT      CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id)  FROM      bond AS T2  JOIN      atom AS T1 ON T1.atom_id = SUBSTRING(T2.bond_id, 1, INSTR(T2.bond_id, '_') - 1)  JOIN      molecule AS T3 ON T3.molecule_id = T1.molecule_id  WHERE      T2.bond_type = '-' AND T3.label = '+';	toxicology
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h')	toxicology
SELECT T2.atom_id2 FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'	toxicology
SELECT T3.bond_id, T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'sn'	toxicology
SELECT COUNT(DISTINCT atom.element) FROM atom JOIN bond ON atom.atom_id = bond.molecule_id AND bond.bond_type = '-' JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'	toxicology
SELECT COUNT(*)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br')  AND EXISTS (SELECT * FROM molecule WHERE molecule_id = m.molecule_id AND label = '+')	toxicology
SELECT T3.bond_id FROM `molecule` AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id WHERE T1.label = '+';	toxicology
SELECT `molecule.molecule_id` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `bond.bond_type` = '-' AND `molecule.label` = '-'	toxicology
SELECT      CAST(SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom.atom_id) AS chlorine_percentage FROM      atom JOIN      connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN      bond ON connected.bond_id = bond.bond_id WHERE      bond.bond_type = '-'	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT `molecule_id` FROM `molecule` WHERE `label` = '-';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030'  AND label = '+';	toxicology
SELECT      T3.bond_id,      CASE          WHEN T2.bond_type = '=' THEN 'double bond'         WHEN T2.bond_type = '-' THEN 'single bond'         WHEN T2.bond_type = '#' THEN 'triple bond'         ELSE 'unknown bond type'     END AS bond_type FROM      molecule AS T1 JOIN      atom AS T3 ON T1.molecule_id = T3.molecule_id JOIN      bond AS T2 ON T3.atom_id = ANY (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = T1.molecule_id)) WHERE      T1.molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_10_11' UNION SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id2 JOIN `bond` AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(*)  FROM atom  WHERE element = 'i'  AND EXISTS (SELECT 1 FROM connected WHERE connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id)	toxicology
SELECT      m.label  FROM      atom a  JOIN      molecule mo ON a.molecule_id = mo.molecule_id  JOIN      element e ON a.element = e.element  WHERE      e.element = 'Ca'  GROUP BY      mo.label  ORDER BY      COUNT(*) DESC  LIMIT 1;	toxicology
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_id = 'TR001_1_8' AND (T3.element = 'cl' OR T4.element = 'cl') AND (T3.element = 'c' OR T4.element = 'c') GROUP BY T1.bond_id HAVING COUNT(*) = 2;	toxicology
SELECT T1.molecule_id FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.bond_id = T3.bond_id  WHERE T3.element = 'c' AND T2.bond_type = '#' AND T1.label = '-' LIMIT 2;	toxicology
SELECT      (COUNT(CASE WHEN atom.element = 'cl' THEN 1 END) /       COUNT(DISTINCT atom.molecule_id)) * 100 AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+';	toxicology
SELECT T3.element FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T1.molecule_id = 'TR001' AND T1.label = '+';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = '	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' ORDER BY c.atom_id ASC, c.atom_id2 ASC LIMIT 1;	toxicology
SELECT T3.element FROM `bond` AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id AND T2.atom_id2 = 'TR005_16' OR T2.atom_id2 = T3.atom_id AND T2.atom_id = 'TR005_16'  WHERE T1.bond_id = 'TR005_16_26';	toxicology
SELECT COUNT(*)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT c.bond_id, m.label  FROM connected AS c  JOIN bond AS b ON c.bond_id = b.bond_id  JOIN molecule AS m ON m.molecule_id = c.atom_id || c.atom_id2  WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT      atom.element  FROM      atom  JOIN      connected ON atom.atom_id = connected.atom_id  JOIN      bond ON connected.bond_id = bond.bond_id  JOIN      molecule ON atom.molecule_id = molecule.molecule_id  WHERE      molecule.label = '+' AND      SUBSTR(atom.atom_id, 7, 1) = '4' AND      atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT      SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) / COUNT(atom.element),      (SELECT label FROM molecule WHERE molecule.molecule_id = 'TR006') FROM      atom JOIN      connected ON atom.atom_id = connected.atom_id JOIN      bond ON connected.bond_id = bond.bond_id JOIN      molecule ON molecule.molecule_id = bond.molecule_id WHERE      molecule.molecule_id = 'TR006';	toxicology
SELECT m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN atom ca ON ca.atom_id = c.atom_id2  WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT C.bond_id, B.bond_type  FROM atom A  JOIN atom A2 ON A.atom_id = A2.atom_id2  JOIN connected C ON A.atom_id = C.atom_id  JOIN bond B ON C.bond_id = B.bond_id  WHERE A.element = 'Te' AND B.bond_type IN ('=', '-', '#')	toxicology
SELECT DISTINCT atom.element  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_id = 'TR001_10_11';	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'	toxicology
SELECT      CAST(SUM(CASE WHEN T3.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.bond_id) AS percent FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN      bond AS T3 ON T2.atom_id = T3.molecule_id WHERE      T1.molecule_id = 'TR047'	toxicology
SELECT T1.label  FROM molecule AS T1  JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T3.atom_id = 'TR001_1'  AND T1.label = '+';	toxicology
SELECT `molecule.label` FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` JOIN `connected` ON `atom.atom_id` = `connected.atom_id` OR `atom.atom_id` = `connected.atom_id2` WHERE `molecule.molecule_id` = 'TR151' AND `molecule.label` = '+';	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = 'TR151') AND T1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON a.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = m.molecule_id)) WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'c';	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT T3.bond_id FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `connected` AS T4 ON T2.atom_id = T4.atom_id JOIN `bond` AS T3 ON T3.bond_id = T4.bond_id WHERE T1.label = '+' AND T3.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  JOIN molecule ON molecule.molecule_id = bond.molecule_id  WHERE molecule.label = '+' AND atom.element = 'h'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T3.atom_id = 'TR000_1' AND T3.atom_id2 = 'TR000_2';	toxicology
SELECT `atom.atom_id` FROM `atom` JOIN `connected` ON `atom.atom_id` = `connected.atom_id` JOIN `bond` ON `connected.bond_id` = `bond.bond_id` WHERE `atom.element` = 'c' AND `bond.bond_type` != '-' AND `molecule.label` = '-'	toxicology
SELECT      CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id)  FROM      molecule AS T1  JOIN      atom AS T2  ON      T1.molecule_id = T2.molecule_id;	toxicology
SELECT `molecule`.label  FROM `molecule` JOIN atom ON `molecule.molecule_id` = atom.molecule_id JOIN connected ON atom.atom_id IN (SELECT atom_id FROM connected) WHERE `molecule.molecule_id` = 'TR124' AND `molecule.label` = '+';	toxicology
SELECT T1.atom_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id JOIN `molecule` AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR007_4' OR atom_id2 = 'TR007_4') AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_2_4' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) AS double_bonds, molecule.label  FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  JOIN connected ON connected.bond_id = bond.bond_id  WHERE molecule.molecule_id = 'TR006' AND bond.bond_type = '=' UNION SELECT 'N/A', molecule.label FROM molecule WHERE molecule.molecule_id = 'TR006' AND molecule.label IS NULL;	toxicology
SELECT m.molecule_id, m.label, a.element  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond b ON c.bond_id = b.bond_id  WHERE m.label = '+' AND (a.element = 'cl' OR a.element = 'c' OR a.element = 'h')	toxicology
SELECT c.atom_id, c.atom_id2, b.bond_id, m.label  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE b.bond_type = '-'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id JOIN atom AS T4 ON T3.atom_id = T4.atom_id OR T3.atom_id2 = T4.atom_id WHERE T2.bond_type = '#' AND (T4.element = 'cl' OR T4.element = 'c')	toxicology
SELECT atom.element FROM atom  JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id2 = connected.atom_id2 JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(*)  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id  WHERE atom.element = 'cl' AND atom2.element = 'cl'	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_id) AS bond_types_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON a.molecule_id = b.molecule_id WHERE m.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(*)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_type = '=' AND m.label = '+'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element != 's' AND b.bond_type != '='	toxicology
SELECT `molecule.label` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` JOIN `connected` ON `bond.bond_id` = `connected.bond_id` WHERE `bond.bond_id` = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = '-'	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id)  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.element = 'cl'	toxicology
SELECT T3.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT atom.element) FROM atom JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_id = 'TR001_3_4';	toxicology
SELECT T3.bond_type FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T1.bond_id = T3.bond_id WHERE T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2' OR (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_1')	toxicology
SELECT T1.label  FROM molecule AS T1  JOIN connected AS T2 ON T1.molecule_id = T2.bond_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id  WHERE T3.atom_id IN ('TR000_2') AND T4.atom_id = 'TR000_4'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT `molecule`.`label` FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` JOIN `connected` ON `atom.atom_id` = `connected.atom_id` WHERE `atom.atom_id` IN (SELECT `atom_id` FROM `connected` WHERE `bond_id` IS NOT NULL) AND `molecule.molecule_id` = 'TR000';	toxicology
SELECT      (SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) / CAST(COUNT(T2.bond_id) AS REAL)) * 100 AS percentage FROM      bond AS T2 JOIN      atom AS T1 ON T1.atom_id = SUBSTRING(T2.bond_id, 1, INSTR(T2.bond_id, '_') - 1) JOIN      connected AS T3 ON T2.bond_id = T3.bond_id;	toxicology
SELECT COUNT(*)  FROM molecule  JOIN atom ON molecule.molecule_id = atom.molecule_id  JOIN element ON atom.element = element.element  WHERE element = 'N' AND molecule.label = '+';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = ' =' ;	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5 AND m.label = '-'	toxicology
SELECT T3.element  FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.bond_id IN (SELECT bond_id FROM connected WHERE (atom_id = T3.atom_id OR atom_id2 = T3.atom_id) AND T1.molecule_id = 'TR024')  WHERE T2.bond_type = '='	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (COUNT(CASE WHEN T1.label = '+' THEN 1 ELSE NULL END) / CAST(COUNT(T1.molecule_id) AS REAL)) * 100.0 AS percentage FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN      bond AS T3 ON T2.atom_id = T3.atom_id WHERE      T2.element = 'h' AND T3.bond_type = '#'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010'	toxicology
SELECT COUNT(*) FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE atom_id2 IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR008'))) AND element = 'c';	toxicology
SELECT t.atom.element FROM atom t JOIN connected c ON t.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '-' AND t.atom_id = 'TR004_7';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id IN (     SELECT DISTINCT c.atom_id     FROM connected c     JOIN atom a ON c.atom_id = a.atom_id     JOIN bond b ON c.bond_id = b.bond_id     WHERE a.element = 'O' AND b.bond_type = '=' )	toxicology
SELECT COUNT(*)  FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  JOIN connected ON bond.bond_id = connected.bond_id  WHERE bond.bond_type = '#' AND molecule.label = '-'	toxicology
SELECT T1.element, T2.bond_type  FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T2 ON T2.bond_id = T3.bond_id  WHERE T1.molecule_id = 'TR016' UNION SELECT T1.element, 'double bond'  FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T2 ON T2.bond_id = T3.bond_id  WHERE T2.bond_type = ' =' AND T1.molecule_id = 'TR016' UNION SELECT T1.element, 'triple bond'  FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T2 ON T2.bond_id = T3.bond_id  WHERE T2.bond_type = '#' AND T1.molecule_id = 'TR016'	toxicology
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR012' AND atom.element = 'c' AND bond.bond_type = '=';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE molecule.label = '+' AND atom.element = 'o'	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)	card_games
SELECT name FROM cards WHERE MAX(faceConvertedManaCost) IS NOT NULL;	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT      c.uuid,      l.format,      l.status FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.types LIKE '%Artifact%' AND      c.side IS NULL AND      l.format = 'vintage'	card_games
SELECT `id`, artist FROM cards WHERE power LIKE '*' OR power IS NULL AND uuid IN (     SELECT uuid     FROM legalities     WHERE format = 'commander' AND status = 'Legal' )	card_games
SELECT c.name, c.text, r.date, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;	card_games
SELECT text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN (     SELECT uuid      FROM rulings      GROUP BY uuid      HAVING COUNT(*) = (SELECT MAX(numRules) FROM (         SELECT COUNT(*) AS numRules          FROM rulings          GROUP BY uuid      )) ) r ON c.uuid = r.uuid	card_games
SELECT      f.language  FROM      cards c  JOIN      foreign_data f ON c.uuid = f.uuid  WHERE      c.name = 'Annul' AND c.number = '29';	card_games
SELECT `name` FROM `cards` WHERE `language` = 'Japanese';	card_games
SELECT      (COUNT(*) FILTER (WHERE language = 'Chinese Simplified') * 100.0 / COUNT(*)) AS percentage FROM      cards	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.setCode = st.setCode AND st.language = 'Italian' ORDER BY s.name;	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*)  FROM cards  WHERE power = '*'	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT `originalType` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT T3.language  FROM cards AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  JOIN set_translations AS T3 ON T2.setCode = T3.setCode AND T1.uuid = T3.uuid  WHERE T1.name = 'Angel of Mercy';	card_games
SELECT COUNT(*)  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT text FROM rulings WHERE uuid = '7fef665c-36a1-5f7a-9299-cf8938708710'	card_games
SELECT COUNT(*)  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT status FROM legalities WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle')	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT T2.date, T2.text  FROM cards AS T1  JOIN rulings AS T2 ON T1.uuid = T2.uuid  WHERE T1.name = 'Benalish Knight';	card_games
SELECT artist FROM cards WHERE name = 'Phyrexian';	card_games
SELECT      CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_borderless_cards FROM      cards;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian';	card_games
SELECT      (COUNT(CASE WHEN T1.language = 'French' AND T2.isStorySpotlight = 1 THEN 1 END)      / COUNT(CASE WHEN T2.isStorySpotlight = 1 THEN 1 END)) * 100 AS percentage FROM      cards AS T1 JOIN      legalities AS T2 ON T1.uuid = T2.uuid WHERE      T2.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black' AND availability LIKE '%mtgo%'	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT `layout` FROM `cards` WHERE `keywords` LIKE '%flying%'	card_games
SELECT COUNT(*)  FROM cards  WHERE `originalType` LIKE '%Summon - Angel%' AND subtypes NOT LIKE '%Angel%'	card_games
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT `artist` FROM `cards` WHERE `language` = 'Chinese Simplified';	card_games
SELECT `name`  FROM `cards`  WHERE `availability` = 'paper' AND `language` = 'Japanese';	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'Banned' AND cards.borderColor = 'white';	card_games
SELECT T1.uuid, T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy'	card_games
SELECT text FROM rulings WHERE uuid = '56f4935b-f6c5-59b9-88bf-9bcce20247ce'	card_games
SELECT COUNT(*) AS future_frame_card_count, status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' AND legalities.status = 'legal';	card_games
SELECT      cards.name,      CASE          WHEN cards.colors LIKE '%W%' THEN 'White'         WHEN cards.colors LIKE '%U%' THEN 'Blue'         WHEN cards.colors LIKE '%B%' THEN 'Black'         WHEN cards.colors LIKE '%R%' THEN 'Red'         WHEN cards.colors LIKE '%G%' THEN 'Green'         ELSE 'Unknown'     END AS color FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      sets.setCode = 'OGW';	card_games
SELECT T1.name, T1.translation  FROM cards AS T1  JOIN set_translations AS T2 ON T1.setCode = T2.setCode AND T1.setCode = '10E'  WHERE T1.convertedManaCost = 5;	card_games
SELECT T1.name, T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'	card_games
SELECT      c.id, c.colors, l.format  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  WHERE      c.id BETWEEN 1 AND 20	card_games
SELECT cd.uuid  FROM cards cd  JOIN foreign_data fd ON cd.uuid = fd.uuid  WHERE cd.colors = 'B' AND cd.type = 'Artifact' AND fd.language IN ('German', 'Spanish', 'French', 'Italian', 'Japanese')	card_games
SELECT name  FROM cards  WHERE rarity = 'uncommon'  ORDER BY COALESCE(rulings.date, '1900-01-01') ASC  LIMIT 3;	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE artist = 'John Avon'  AND (cardKingdomId IS NOT NULL OR cardKingdomFoilId IS NOT NULL)	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'  AND (cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL)	card_games
SELECT COUNT(*)  FROM cards  WHERE artist LIKE 'UDON'  AND availability LIKE 'mtgo'  AND hand = -1	card_games
SELECT COUNT(*)  FROM cards  WHERE frameVersion LIKE '1993%' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost  FROM cards  WHERE layout = 'normal'  AND frameVersion = '2003'  AND borderColor = 'black'  AND availability LIKE '%paper%'  AND availability LIKE '%mtgo%'	card_games
SELECT SUM(REAL(`convertedManaCost`)) AS TotalUncolvertedMana FROM `cards` WHERE `artist` = 'Rob Alexander';	card_games
SELECT DISTINCT `type` FROM `cards` WHERE `availability` = 'arena';	card_games
SELECT DISTINCT s.setCode  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON st.setCode = c.setCode AND st.language = 'Spanish';	card_games
SELECT CAST(SUM(CASE WHEN T1.hand = '+3' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id)  FROM cards AS T1  JOIN (     SELECT id      FROM cards      WHERE frameEffects = 'legendary' ) AS T2  ON T1.id = T2.id	card_games
SELECT      id FROM      cards WHERE      isStoryspotlight = 1 AND isTextless = 1	card_games
SELECT      name  FROM      cards  WHERE      language = 'Spanish' ORDER BY      name;	card_games
SELECT DISTINCT T2.language  FROM sets AS T1  JOIN set_translations AS T2 ON T1.setCode = T2.setCode  WHERE T1.baseSetSize = 309	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.setCode = set_translations.setCode  WHERE sets.block = 'Commander'  AND set_translations.language = 'Portuguese (Brasil)'	card_games
SELECT id  FROM cards  WHERE type = 'Creature' AND status = 'Legal'	card_games
SELECT DISTINCT t1.supertypes || ' ' || t1.subtypes AS Card_Type FROM cards t1 JOIN foreign_data t2 ON t1.uuid = t2.uuid WHERE t2.language = 'German' AND t1.subtypes IS NOT NULL AND t1.supertypes IS NOT NULL	card_games
SELECT COUNT(*)  FROM cards  WHERE power IS NULL OR power = '*' AND (power IS NULL OR power = '*') AND (power LIKE '%triggered ability%' OR power LIKE '%activated ability%')	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.format LIKE 'pre-modern' AND        cards.faceName IS NULL AND        cards.frameVersion LIKE '%triggered mana ability%'	card_games
SELECT `cards`.id  FROM `cards`  JOIN `legalities` ON `cards`.uuid = `legalities`.uuid  WHERE `legalities`.format = 'pauper' AND `cards`.artist = 'Erica Yang' AND `cards`.availability = 'paper';	card_games
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT t1.name  FROM cards AS t1  JOIN foreign_data AS t2 ON t1.uuid = t2.uuid  WHERE t1.artist = 'Matthew D. Wilson'  AND t1.type = 'Creature'  AND t1.layout = 'normal'  AND t1.borderColor = 'black'  AND t2.language = 'French'	card_games
SELECT COUNT(*)  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.rarity = 'rare' AND date = '2009-01-10'	card_games
SELECT language  FROM set_translations  WHERE setCode IN (SELECT code FROM sets WHERE baseSetSize = 180 AND block LIKE 'Ravnica%')	card_games
SELECT      CAST(SUM(CASE WHEN `hasContentWarning` = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      cards  JOIN      legalities ON cards.uuid = legalities.uuid  WHERE      legalities.format = 'commander' AND legalities.status = 'legal'	card_games
SELECT      CAST(COUNT(CASE WHEN power IS NULL OR power = '*' THEN 1 ELSE NULL END) * 100.0 / COUNT(*) AS REAL) AS PercentageWithoutPowerInFrench FROM      cards WHERE      language = 'French'	card_games
SELECT      CAST(SUM(CASE WHEN `type` = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`type`)  FROM      `sets` WHERE      `language` = 'Japanese';	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT T1.id AS kingdom_card_id, T2.id AS kingdom_foil_id FROM cards AS T1 JOIN cards AS T2 ON T1.cardKingdomFoilId = T2.uuid WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL ORDER BY T2.id LIMIT 3;	card_games
SELECT CAST(SUM(CASE WHEN `isTextless` = 1 AND `layout` = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM `cards`	card_games
SELECT id FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%' AND otherFaceIds IS NULL;	card_games
SELECT      s.name  FROM      sets s  WHERE      s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY      s.name ASC  LIMIT 3	card_games
SELECT DISTINCT T1.language  FROM `foreign_data` AS T1  JOIN `cards` AS T2 ON T1.uuid = T2.uuid  JOIN `sets` AS T3 ON T2.setCode = T3.code  WHERE T3.mcmName = 'Archenemy' AND T3.setCode = 'ARC'	card_games
SELECT `name`, translation FROM sets WHERE id = 5 JOIN set_translations ON sets.code = set_translations.setCode;	card_games
SELECT language, type FROM sets WHERE id = 206	card_games
SELECT T1.code, T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode JOIN cards AS T3 ON T3.uuid = (SELECT uuid FROM foreign_data WHERE language = 'Italian' AND T1.code = T1.code) WHERE T2.language = 'Italian' AND T1.block LIKE 'Shadowmoor%' ORDER BY T1.name ASC LIMIT 2;	card_games
SELECT `id`  FROM `sets`  WHERE `isForeignOnly` = 1 AND `language` = 'Japanese';	card_games
SELECT `name`, SUM(`baseSetSize`) AS total_cards FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`language` = 'Russian' GROUP BY `sets`.`code` ORDER BY total_cards DESC LIMIT 1;	card_games
SELECT      CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' AND T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid)  FROM      cards AS T1  JOIN      sets AS T2 ON T1.setCode = T2.code  WHERE      T2.isOnlineOnly = 1;	card_games
SELECT COUNT(*)  FROM sets  WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '')	card_games
SELECT id  FROM cards  WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT `name` FROM `cards` WHERE `borderColor` = 'black' AND `isFullArt` = 1;	card_games
SELECT `language` FROM `set_translations` WHERE `setCode` = '174';	card_games
SELECT `name` FROM `sets` WHERE `code` = 'ALL';	card_games
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13'	card_games
SELECT `baseSetSize`, `code` FROM `sets` WHERE `block` = 'Masques' OR `block` = 'Mirage'	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion';	card_games
SELECT `foreign_data`.name, `cards`.type FROM `cards` JOIN `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` WHERE `cards`.watermark = 'Boros';	card_games
SELECT T2.language, T2.flavorText, T3.type  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T1.setCode = T3.code  WHERE T1.watermark = 'colorpie'	card_games
SELECT      CAST(SUM(CASE WHEN `convertedManaCost` = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`convertedManaCost`) AS percentage FROM      cards WHERE      `name` = 'Abyssal Horror'	card_games
SELECT `code` FROM `sets` WHERE `type` = 'expansion' AND `block` LIKE '%commander%'	card_games
SELECT `name`, `type` FROM `cards` WHERE `watermark` = 'abzan' AND `asciiName` IS NOT NULL;	card_games
SELECT T2.language, T2.type  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.watermark = 'Azorius';	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%' AND hand LIKE '+%'	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)	card_games
SELECT name  FROM cards  WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT DISTINCT T1.purchaseUrls FROM cards AS T1 WHERE T1.promoTypes LIKE '%bundle%'	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND (availability LIKE '%arena%') AND (availability LIKE '%mtgo%')	card_games
SELECT MAX(`convertedManaCost`)  FROM `cards`  WHERE `name` = 'Serra Angel' OR `name` = 'Shrine Keeper'	card_games
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3;	card_games
SELECT `sets`.`name` FROM `sets` JOIN `cards` ON `sets`.`uuid` = `cards`.`uuid` JOIN `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` WHERE `cards`.`name` = 'Ancestor''s Chosen' AND `foreign_data`.`language` = 'Italian'	card_games
SELECT COUNT(*)  FROM `set_translations`  JOIN `sets` ON `set_translations.setCode` = `sets.code`  JOIN `cards` ON `sets.code` = `cards.setCode`  WHERE `cards.name` = 'Angel of Mercy';	card_games
SELECT name FROM cards JOIN set_translations ON cards.uuid = set_translations.uuid WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean' ) AS KoreanVersionExists;	card_games
SELECT COUNT(*)  FROM cards  JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND artist = 'Adam Rex';	card_games
SELECT SUM(baseSetSize)  FROM sets  WHERE translation = 'Hauptset Zehnte Edition'	card_games
SELECT translation  FROM set_translations  WHERE setCode = '8ED' AND language = 'Chinese Simplified'	card_games
SELECT      cards.name,      sets.mtgoCode  FROM      cards  JOIN      sets ON cards.uuid = sets.uuid  WHERE      cards.name = 'Angel of Mercy' AND sets.mtgoCode IS NOT NULL;	card_games
SELECT `releaseDate` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `type` FROM `sets` WHERE `translation` = ' Hauptset Zehnte Edition'	card_games
SELECT COUNT(*)  FROM sets  WHERE block = 'Ice Age' AND language = 'Italian'	card_games
SELECT      c.name  FROM      cards c  JOIN      sets s ON c.setCode = s.code  WHERE      c.name = 'Adarkar Valkyrie' AND      s.isForeignOnly = 1;	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10;	card_games
SELECT COUNT(*)  FROM cards  WHERE setCode = 'Coldsnap' AND borderColor = 'black';	card_games
SELECT name FROM cards WHERE setCode = 'COLD' ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT artist  FROM cards  JOIN sets ON cards.uuid = sets.code_translations  WHERE sets.setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT * FROM cards WHERE name = 'Coldsnap' AND number = 4;	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.convertedManaCost > 5 AND cards.power = '*' OR cards.power IS NULL;	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT language  FROM foreign_data  WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL;	card_games
SELECT type  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE language = 'German' AND name = 'Ancestor''s Chosen';	card_games
SELECT T1.text AS "Italian Ruling Text" FROM rulings AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Coldsnap' AND T1.language = 'Italian'	card_games
SELECT name  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.setCode = 'Coldsnap' AND foreign_data.language = 'Italian'  ORDER BY cards.convertedManaCost DESC  LIMIT 1;	card_games
SELECT date FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Reminisce')	card_games
SELECT      CAST(SUM(CASE WHEN `convertedManaCost` = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      `cards` WHERE      `setName` = 'Coldsnap'	card_games
SELECT      CAST(SUM(CASE WHEN T1.cardKingdomFoilId = T1.cardKingdomId AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.name) FROM      cards T1 WHERE      T1.name = 'Coldsnap'	card_games
SELECT `code` FROM `sets` WHERE `releaseDate` = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT `mcmId` FROM `sets` WHERE `code` = 'SS2'	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT `type` FROM `sets` WHERE `name` LIKE 'From the Vault: Lore'	card_games
SELECT `parentCode` FROM `sets` WHERE `name` = 'Commander 2014 Oversized';	card_games
SELECT c.name, c.text, ft.text, l.hasContentWarning FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON c.setCode = st.setCode AND st.language = 'English' JOIN rulings r ON c.uuid = r.uuid JOIN (     SELECT artist, MAX(id) as max_id     FROM cards     WHERE artist = 'Jim Pavelec'     GROUP BY artist ) j ON c.artist = j.artist AND c.id = j.max_id JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Jim Pavelec' ORDER BY c.name;	card_games
SELECT `releaseDate` FROM `sets` WHERE `name` = 'Evacuation'	card_games
SELECT SUM(T1.baseSetSize) FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Rinascita di Alara'	card_games
SELECT `type` FROM `sets` WHERE `translation` = 'Huitième édition'	card_games
SELECT `sets`.name  FROM `sets`  JOIN `set_translations` ON `sets`.code = `set_translations`.setCode  WHERE `set_translations`.language = 'French'  AND EXISTS (     SELECT 1      FROM `cards`      JOIN `foreign_data` ON `cards`.uuid = `foreign_data`.uuid      WHERE `cards`.name = 'Tendo Ice Bridge' AND `foreign_data`.language = 'French' )	card_games
SELECT COUNT(*)  FROM set_translations  WHERE name = 'Salvat 2011' AND translation IS NOT NULL	card_games
SELECT s.name  FROM sets s  JOIN foreign_data fd ON s.code = fd.uuid  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Fellwar Stone' AND fd.language = 'Japanese'	card_games
SELECT name  FROM cards  WHERE name = 'Journey into Nyx Hero''s Path'  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT `releaseDate` FROM `sets` WHERE `translation` = 'Ola de frío'	card_games
SELECT `type` FROM `sets` WHERE `name` = 'Samite Pilgrim'	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;	card_games
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND name = 'Mirrodin'	card_games
SELECT      CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid)  FROM      sets AS T1  JOIN      cards AS T2 ON T1.code = T2.setCode  JOIN      foreign_data AS T3 ON T2.uuid = T3.uuid  WHERE      T3.language = 'Japanese'	card_games
SELECT      CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      cards AS T1  JOIN      foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE      T2.language = 'Portuguese (Brazil)';	card_games
SELECT      cards.name,     cards.availability FROM      cards JOIN      artists ON cards.artist = artists.name WHERE      artists.name = 'Aleksi Briclot' AND     cards.isTextless = 1	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)	card_games
SELECT artist  FROM cards  WHERE side IS NULL  AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL)	card_games
SELECT MAX(frameEffects) AS MostCommonFrameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*)  FROM cards  WHERE power IN ('*', NULL) AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT `id` FROM `sets` WHERE `type` = 'commander' ORDER BY `totalSetSize` DESC LIMIT 1;	card_games
SELECT id, name, manaCost  FROM cards  WHERE availability LIKE '%duel%'  ORDER BY CAST(REPLACE(manaCost, '{', '') AS REAL) DESC  LIMIT 10;	card_games
SELECT MIN(T1.originalReleaseDate) AS oldest_release_date, T2.format  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.rarity = 'mythic' AND T2.status = 'legal'	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE artist = 'Volkan Baga' AND language = 'French'	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  JOIN sets ON cards.setCode = sets.code  WHERE cards.rarity = 'rare'  AND cards.types = 'Enchantment'  AND cards.name = 'Abundance'  AND legalities.status = 'Legal'	card_games
SELECT T1.format, T2.name  FROM legalities AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T1.status = 'banned'  GROUP BY T1.format  ORDER BY COUNT(*) DESC  LIMIT 1;	card_games
SELECT language FROM sets WHERE name = 'Battlebond';	card_games
SELECT artist, format  FROM cards  GROUP BY artist  ORDER BY COUNT(*) ASC  LIMIT 1;	card_games
SELECT `status` FROM `legalities` JOIN `cards` ON `legalities`.`uuid` = `cards`.`uuid` WHERE `cards`.`artist` = 'D. Alexander Gregory' AND `cards`.`hasContentWarning` = 1 AND `legalities`.`format` = 'legacy' AND `cards`.`frameVersion` = '1997';	card_games
SELECT T1.name, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'banned'	card_games
SELECT AVG(T1.id) AS average_sets_released, MAX(T2.common_language) AS common_language FROM sets AS T1 JOIN (     SELECT language     FROM sets     WHERE MAX(releaseDate) BETWEEN '2012-01-01' AND '2015-12-31' ) AS T2 ON T1.language = T2.language;	card_games
SELECT artist  FROM cards  WHERE BorderColor = 'black' AND availability LIKE '%arena%'	card_games
SELECT T1.uuid FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'oldschool' AND T2.status IN ('banned', 'restricted')	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE artist = 'Kev Walker'  ORDER BY date DESC	card_games
SELECT T1.name, T3.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T2.code = T3.code WHERE T3.name = 'Hour of Devastation' AND T2.status = 'legal'	card_games
SELECT s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language NOT LIKE '%Japanese%' AND st.language = 'Korean'	card_games
SELECT      frameVersion,     name FROM      cards JOIN      legalities ON cards.uuid = legalities.uuid WHERE      artist = 'Allen Williams' AND status = 'banned';	card_games
SELECT Users.DisplayName, MAX(Users.Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00';	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1	codebase_community
SELECT COUNT(*)  FROM users  WHERE Views > 10 AND EXTRACT(YEAR FROM CreationDate) > 2013;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Title FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'csgillespie') ORDER BY p.ViewCount DESC LIMIT 1	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(CommentCount) FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT MAX(p.AnswerCount) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (     SELECT Id      FROM users      WHERE DisplayName = 'csgillespie' ) AND ParentId IS NULL	codebase_community
SELECT u.DisplayName  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.Age > 65 AND posts.Score >= 20	codebase_community
SELECT Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts')	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'	codebase_community
SELECT Posts.Body FROM tags JOIN posts ON tags.ExcerptPostId = posts.Id WHERE tags.Count = (     SELECT MAX(Count)     FROM tags )	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT T1.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND EXTRACT(YEAR FROM Date) = 2011	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(T1.Score) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(badges.Id) / COUNT(u.DisplayName) FROM badges JOIN users u ON badges.UserId = u.Id WHERE u.Views > 200	codebase_community
SELECT      COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0 / COUNT(p.Id) AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 20	codebase_community
SELECT COUNT(*)  FROM votes  WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910);	codebase_community
SELECT FavoriteCount  FROM posts  WHERE OwnerUserId = 3025 AND CreaionDate = '2014/4/23 20:29:39.0'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ParentId = 107829 AND p.CommentCount = 1	codebase_community
SELECT      p.Id AS PostId,     p.Title,     p.CreationDate,     p.ClosedDate FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0' AND      p.ClosedDate IS NULL;	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = '65041')	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Tiago Pasqualini'	codebase_community
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Title LIKE '%data visualization%' AND PostTypeId = 1 AND Score > 0	codebase_community
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      COUNT(p.Id) / COUNT(v.Id) AS PostToVoteRatio FROM      posts p JOIN      users u ON p.OwnerUserId = 24 JOIN      votes v ON p.Id = v.PostId WHERE      u.Id = 24	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'SilentGhost')	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93'	codebase_community
SELECT c.Text  FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(posts.Score) AS TotalScore, users.WebsiteUrl FROM posts JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny'	codebase_community
SELECT c.Text  FROM comments c JOIN postHistory ph ON c.Id = ph.PostId JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND EXISTS (     SELECT * FROM postHistory ph2 WHERE ph2.PostId = p.Id AND ph2.UserId != c.UserId AND ph2.Comment IS NOT NULL )	codebase_community
SELECT SUM(T3.BountyAmount) AS TotalBountyAmount FROM posts AS T1 JOIN votes AS T3 ON T1.Id = T3.PostId WHERE T1.Title LIKE '%data%'	codebase_community
SELECT u.DisplayName  FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.BountyAmount = 50 AND v.PostId IN (     SELECT p.Id      FROM posts p      WHERE p.Title LIKE '%variance%' )	codebase_community
SELECT      AVG(posts.ViewCount) AS AverageViewCount,     posts.Title,     comments.Text,     comments.Score FROM      posts JOIN      tags ON posts.Id = tags.ExcerptPostId JOIN      comments ON posts.Id = comments.PostId WHERE      tags.TagName = 'humor'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Supporter' AND YEAR(Date) = 2011;	codebase_community
SELECT COUNT(T2.UserId) FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Teacher' GROUP BY T2.UserId HAVING COUNT(T1.Name) > 5	codebase_community
SELECT COUNT(DISTINCT T1.UserId)  FROM badges AS T2  JOIN users AS T1 ON T2.UserId = T1.Id  WHERE T1.Location LIKE '%New York%'  AND T2.Name IN ('Teacher', 'Supporter')	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount >= 1000 GROUP BY u.Id, u.DisplayName HAVING COUNT(DISTINCT p.Id) = 1;	codebase_community
SELECT u.DisplayName, b.Name FROM users u JOIN (     SELECT UserId, COUNT(*) AS CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId WHERE c.CommentCount = (     SELECT MAX(CommentCount)     FROM (         SELECT COUNT(*) AS CommentCount         FROM comments         GROUP BY UserId     ) cc );	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher';	codebase_community
SELECT      ABS((COUNT(CASE WHEN YEAR(b.Date) = 2010 THEN b.Name END) / COUNT(CASE WHEN YEAR(b.Date) = 2010 THEN 1 END) * 100) -          (COUNT(CASE WHEN YEAR(b.Date) = 2011 THEN b.Name END) / COUNT(CASE WHEN YEAR(b.Date) = 2011 THEN 1 END) * 100)) AS PercentageDifference FROM badges b	codebase_community
SELECT pht.PostHistoryTypeId, COUNT(DISTINCT ph.UserId) AS UniqueUsersCommented FROM postHistory pht JOIN posts ph ON pht.PostId = ph.Id WHERE ph.Id = 3720 GROUP BY pht.PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount  FROM posts AS p  JOIN postLinks AS pl ON p.Id = pl.PostId  WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT c.Score, pl.LinkTypeId FROM comments c JOIN postLinks pl ON c.PostId = pl.PostId WHERE c.PostId = 395;	codebase_community
SELECT p.Id, u.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(T.post.favoriteCount)  FROM posts AS T  JOIN postHistory AS PH ON T.id = PH.postId  WHERE T.ownerUserId = 686 AND YEAR(PH.CreationDate) = 2011	codebase_community
SELECT      AVG(T1.UpVotes) AS UpVotesAverage,     AVG(T2.Age) AS AverageAge FROM      (     SELECT          UserId, SUM(UpVotes) AS UpVotesSum     FROM          votes v     GROUP BY          UserId     HAVING          COUNT(*) > 10     ) AS T1 JOIN      users T2 ON T1.UserId = T2.Id	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Announcer'	codebase_community
SELECT Name  FROM badges  WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN (     SELECT UserId, MAX(Reputation) AS MaxReputation     FROM users     GROUP BY UserId ) AS T2 ON T1.UserId = T2.UserId WHERE T2.MaxReputation = T1.Reputation	codebase_community
SELECT u.DisplayName, u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre'	codebase_community
SELECT T1.Date FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'	codebase_community
SELECT      CAST(COUNT(CASE WHEN Name = 'Teacher' THEN UserId END) AS REAL) / COUNT(UserId) * 100 FROM      badges;	codebase_community
SELECT      CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT b.UserId)  FROM      badges b  JOIN      users u ON b.UserId = u.Id  WHERE      b.Name = 'Organizer'	codebase_community
SELECT `Score` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:19:56.0'	codebase_community
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'Vienna, Austria' AND b.Name = 'Teacher';	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT T1.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT T3.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId JOIN badges AS T3 ON T3.Id = T2.Id WHERE T1.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY'	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT      CAST(SUM(CASE WHEN YEAR(v.CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN YEAR(v.CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio_2010_2011 FROM      votes v	codebase_community
SELECT t.TagName FROM tags AS t JOIN posts AS p ON t.ExcerptPostId = p.Id OR t.WikiPostId = p.Id JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Stauffer'	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(*)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'Harlan';	codebase_community
SELECT `posts`.Id FROM `posts` JOIN `users` ON `posts`.OwnerUserId = `users`.Id WHERE `users`.DisplayName = 'slashnick' ORDER BY `posts`.AnswerCount DESC LIMIT 1;	codebase_community
SELECT      p.Id,     p.Title,     p.ViewCount,     u.DisplayName FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ORDER BY      p.ViewCount DESC LIMIT 1	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Matt Parker' AND Score > 4;	codebase_community
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE comments.Score < 60 AND users.DisplayName = 'Neil McGuigan'	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.Id NOT IN (     SELECT c.PostId     FROM comments c )	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer'	codebase_community
SELECT CAST(SUM(CASE WHEN T.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM posts P JOIN tags T ON P.Id = T.ExcerptPostId WHERE P.OwnerDisplayName = 'Community'	codebase_community
SELECT      (SUM(T2.ViewCount) - SUM(T3.ViewCount)) AS ViewCountDifference FROM      users AS T1 JOIN      posts AS T2 ON T2.OwnerUserId = T1.Id JOIN      users AS T3 ON T3.DisplayName = 'Amos' WHERE      T1.DisplayName = 'Mornington'	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59'	codebase_community
SELECT u.DisplayName, u.Age FROM users u WHERE u.Views = (SELECT MAX(VIEWS) FROM users)	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Score > 60 AND c.Score > 60	codebase_community
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location LIKE '%North Pole%' AND STRFTIME('%Y', Date) = '2011'	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(*) AS post_history_count, MAX(p.LastEditDate) AS last_edit_date FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title LIKE '%best introductory Bayesian statistics textbook%'	codebase_community
SELECT u.LastAccessDate, u.Location  FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers'	codebase_community
SELECT p.Title FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.PostId WHERE pl.RelatedPostId IN (     SELECT pl.RelatedPostId     FROM postLinks AS pl     JOIN posts AS p ON pl.PostId = p.Id     WHERE p.Title LIKE '%How to tell if something happened in a data set which monitors a value over time%' )	codebase_community
SELECT p.Id, b.Name FROM badges b JOIN users u ON u.Id = b.UserId JOIN posts p ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.ExcerptPostId = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT p.Title, pl.LinkTypeId  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE p.Title = 'What are principal component scores?'	codebase_community
SELECT p.OwnerDisplayName FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL) AND p.ParentId IS NOT NULL;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM users u  JOIN votes v ON u.Id = v.UserId  WHERE v.VoteTypeId = 8  ORDER BY v.BountyAmount DESC  LIMIT 1;	codebase_community
SELECT Title  FROM posts  ORDER BY ViewCount DESC  LIMIT 5	codebase_community
SELECT COUNT(*)  FROM tags  WHERE tags.Count BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT P.Id, P.Score, T.Count FROM posts P JOIN (     SELECT TagName, MAX(Count) AS MaxCount     FROM tags T ) T ON T.TagName = P.Tags WHERE T.MaxCount = (     SELECT MAX(Count)     FROM tags ) ORDER BY P.Score DESC LIMIT 1;	codebase_community
SELECT COUNT(p.Id) / 12 AS AverageMonthlyLinks FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE YEAR(p.CreationDate) = 2010 AND p.AnswerCount <= 2	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.OwnerUserId = 1465 AND v.PostId = p.Id WHERE v.VoteTypeId = 2 GROUP BY p.Id ORDER BY SUM(CASE WHEN v.BountyAmount IS NULL THEN 1 ELSE 0 END) DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks) LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.Id ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.DisplayName = 'chl'	codebase_community
SELECT MIN(T1.CreationDate) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM `users`)	codebase_community
SELECT u.DisplayName  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE users.Location = 'United Kingdom' AND posts.FavoriteCount >= 4	codebase_community
SELECT AVG(PostId)  FROM votes  WHERE UserId IN (SELECT Id                   FROM users                   ORDER BY Age DESC                   LIMIT 1)	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Jay Stevens'  AND YEAR(CreationDate) = 2010;	codebase_community
SELECT `posts.Id`, `posts.Title` FROM `posts` JOIN `users` ON `posts.OwnerUserId` = `users.Id` WHERE `users.DisplayName` = 'Harvey Motulsky' ORDER BY `posts.ViewCount` DESC LIMIT 1;	codebase_community
SELECT P.Id, P.Title FROM posts AS P WHERE P.Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(p.Score)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Stephen Turner'	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      CAST(COUNT(CASE WHEN u.Reputation > 1000 THEN p.Id ELSE NULL END) AS REAL) * 100 / COUNT(p.Id) AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      YEAR(p.CreationDate) = 2011;	codebase_community
SELECT      CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) as Percentage FROM      users	codebase_community
SELECT u.DisplayName, p.ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets' ORDER BY p.LastActivityDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)	codebase_community
SELECT COUNT(*)  FROM comments  WHERE PostId = (     SELECT PostId      FROM posts      ORDER BY Score DESC      LIMIT 1 )	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.LastEditorUserId  WHERE p.Id = 183  ORDER BY p.LastEditDate DESC  LIMIT 1;	codebase_community
SELECT Name, Date  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett')  ORDER BY Date DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65  AND UpVotes > 5000;	codebase_community
SELECT      (SELECT Date FROM badges WHERE UserId = (         SELECT Id FROM users WHERE DisplayName = 'Zolomon'     )) - (         SELECT CreationDate FROM users WHERE DisplayName = 'Zolomon'     ) AS TimeToGetBadge	codebase_community
SELECT COUNT(*)  FROM (     SELECT u.Id, COUNT(p.Id) AS PostsCount, COUNT(c.Id) AS CommentsCount     FROM users u     LEFT JOIN posts p ON u.Id = p.OwnerUserId     LEFT JOIN comments c ON u.Id = c.UserId     WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users)     GROUP BY u.Id ) AS UserStats;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*)  FROM posts  JOIN postTags ON posts.Id = postTags.PostId  JOIN tags ON postTags.TagId = tags.Id  WHERE tags.TagName = 'careers'	codebase_community
SELECT users.Reputation, posts.ViewCount FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'Jarrod Dixon';	codebase_community
SELECT COUNT(*) AS total_comments  FROM comments  JOIN posts ON comments.PostId = posts.Id  WHERE posts.Title = 'Clustering 1D data';  SELECT COUNT(*) AS total_answers  FROM posts  WHERE PostTypeId = 2 AND OwnerUserId IS NOT NULL AND posts.ParentId IN (     SELECT Id FROM posts WHERE Title = 'Clustering 1D data' );	codebase_community
SELECT `CreationDate` FROM `users` WHERE `DisplayName` = 'IrishStat'	codebase_community
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30;	codebase_community
SELECT      CAST(SUM(CASE WHEN `Score` >= 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      `posts` p  JOIN      `users` u ON p.OwnerUserId = u.Id  WHERE      u.Reputation = (SELECT MAX(Reputation) FROM `users`);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text  FROM comments AS c  JOIN posts AS p ON c.PostId = p.Id  WHERE p.Title = 'How can I adapt ANOVA for binary data?'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  ORDER BY c.Score DESC  LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(*)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CommentCount = 1 AND EXISTS (     SELECT 1      FROM comments      WHERE comments.PostId = posts.Id      GROUP BY comments.PostId      HAVING COUNT(comments.Id) = 1 AND comments.Score = 0 )	codebase_community
SELECT COUNT(DISTINCT c.UserId)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score = 0 AND u.Age = 40	codebase_community
SELECT p.Id AS "post_id", c.Text AS "comment_text" FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT `Votes`.BountyAmount FROM `comments`  JOIN `posts` ON `comments.PostId` = `posts.Id` JOIN `users` ON `comments.UserId` = `users.Id` JOIN `votes` ON `comments.Id` = `votes.PostId` WHERE `comments.Text` LIKE '%R is also lazy evaluated%'	codebase_community
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      CAST(COUNT(CASE WHEN UpVotes = 0 AND Score BETWEEN 5 AND 10 THEN UserId END) AS REAL) * 100 / COUNT(CASE WHEN Score BETWEEN 5 AND 10 THEN UserId END) AS Percentage FROM      comments	codebase_community
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man'	superhero
SELECT COUNT(*)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200	superhero
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id GROUP BY superhero.id HAVING COUNT(superpower.id) > 15;	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue';	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  WHERE s.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT full_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'  ORDER BY superhero.height_cm DESC  LIMIT 1;	superhero
SELECT publisher_name FROM superhero WHERE superhero_name = 'Sauron';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics' AND colour.colour = 'Blue'	superhero
SELECT AVG(superhero.height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT      CAST(SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)  FROM      superhero s  JOIN      hero_power hp ON s.id = hp.hero_id  JOIN      superpower sp ON hp.power_id = sp.id  WHERE      s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')	superhero
SELECT T.publisher_name FROM (     SELECT T1.publisher_id, T2.publisher_name, T1.attribute_id, T1.attribute_value     FROM (         SELECT id, attribute_name, attribute_value, publisher_id         FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id         WHERE attribute_name = 'Speed'     ) T1 JOIN publisher ON T1.publisher_id = publisher.id ) T WHERE T.attribute_value = (     SELECT MIN(T2.attribute_value)     FROM (         SELECT id, attribute_name, attribute_value, publisher_id         FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id         WHERE attribute_name = 'Speed'     ) T2 JOIN publisher ON T2.publisher_id = publisher.id )	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond';	superhero
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence') ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT race.race  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE superhero.superhero_name = 'Copycat' AND attribute.attribute_name = 'Race';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = 100;	superhero
SELECT superhero_name FROM (     SELECT superhero.id, COUNT(hero_power.power_id) AS power_count      FROM superhero      JOIN hero_power ON superhero.id = hero_power.hero_id      GROUP BY superhero.id      ORDER BY power_count DESC      LIMIT 1 ) AS result;	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Vampire'	superhero
SELECT      COUNT(CASE WHEN alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE NULL END) * 100.0 / COUNT(*) AS percentage FROM      superhero WHERE      alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') AND      publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT ABS((SELECT COUNT(*) FROM superhero WHERE publisher_id IN(SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) -             (SELECT COUNT(*) FROM superhero WHERE publisher_id IN(SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))) AS difference	superhero
SELECT `publisher_id` FROM `publisher` WHERE `publisher_name` = 'Star Trek';	superhero
SELECT AVG(T2.attribute_value) AS average_attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.id = 75;	superhero
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS s ON hp.hero_id = s.id WHERE s.superhero_name = 'Deathlok'	superhero
SELECT AVG(T.superhero.weight_kg)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  WHERE gender.gender = 'Female'	superhero
SELECT sp.power_name FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm BETWEEN 170 AND 190  AND eye_colour_id = 1;	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56;	superhero
SELECT full_name  FROM superhero  WHERE race_id IN (     SELECT id      FROM race      WHERE race = 'Demi-God' )  LIMIT 5;	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.attribute_name = 'Bad'	superhero
SELECT T1.race  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  WHERE T2.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Weight') AND T2.attribute_value = 169;	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.hair_colour_id  WHERE s.height_cm = 185 AND s.race = 1	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)	superhero
SELECT      CAST(COUNT(CASE WHEN s.publisher_id = 13 THEN 1 END) AS REAL) * 100 / COUNT(s.id)  FROM      superhero s WHERE      s.height_cm BETWEEN 150 AND 180;	superhero
SELECT full_name  FROM superhero  WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id GROUP BY power_name ORDER BY COUNT(*) DESC LIMIT 1	superhero
SELECT attribute_value FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Abomination')	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.id = 1;	superhero
SELECT COUNT(*)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'stealth'	superhero
SELECT full_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Strength'  AND hero_attribute.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Strength')	superhero
SELECT AVG(1.0 * COUNT(s.hero_id))  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE c.id = 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id IN (     SELECT id      FROM publisher      WHERE publisher_name = 'Dark Horse Comics' );	superhero
SELECT s.superhero_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics') ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT colour.colour FROM colour WHERE colour.id = (SELECT skin_colour_id FROM superhero WHERE full_name = 'Abraham Sapien')	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';	superhero
SELECT      c.colour AS eye_colour,     co.colour AS hair_colour,     cs.colour AS skin_colour FROM      colour c JOIN      colour co ON c.id = superhero.eye_colour_id JOIN      colour cs ON c.id = superhero.skin_colour_id JOIN      superhero ON c.id = superhero.eye_colour_id JOIN      superhero ON co.id = superhero.hair_colour_id JOIN      superhero ON cs.id = superhero.skin_colour_id JOIN      publisher ON superhero.publisher_id = publisher.id WHERE      superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND     publisher.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name, p.publisher_name  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND s.hair_colour_id = c.id AND s.skin_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT T3.race FROM superhero AS T1 JOIN superhero AS T2 ON T1.id = T2.id JOIN race AS T3 ON T2.race_id = T3.id WHERE T2.superhero_name = 'A-Bomb';	superhero
SELECT      CAST(SUM(CASE WHEN c.colour = 'Blue' AND g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END)  FROM      colour c  JOIN      superhero s ON c.id = s.skin_colour_id  JOIN      gender g ON g.id = s.gender_id	superhero
SELECT superhero_name, race  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT gender.gender  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  WHERE superhero.superhero_name = 'Agent 13';	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM hero_power  JOIN superhero ON hero_power.hero_id = superhero.id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superhero.superhero_name = 'Amazo';	superhero
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.full_name = 'Hunter Zolomon';	superhero
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT s.superhero_name  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND c.colour = 'Black' JOIN colour cc ON s.hair_colour_id = cc.id AND cc.colour = 'Black'	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  WHERE c.colour = 'Gold'	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Vampire')	superhero
SELECT superhero_name FROM superhero WHERE alignment = 'Neutral';	superhero
SELECT COUNT(*)  FROM hero_attribute  WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'))	superhero
SELECT T1.race, T1.alignment FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T1.superhero_name = 'Cameron Hicks'	superhero
SELECT      CAST(SUM(CASE WHEN T.superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND T.publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T.publisher.publisher_name = 'Marvel Comics' THEN 1 END) AS Percentage FROM      superhero T JOIN      publisher ON T.publisher_id = publisher.id	superhero
SELECT AVG(T.superhero.weight_kg)  FROM superhero  JOIN superhero ON superhero.id = superhero.superhero_id  JOIN race ON race.id = superhero.race_id  WHERE race.race = 'Alien'	superhero
SELECT ABS((SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler'))	superhero
SELECT superhero.superhero_name, AVG(superhero.height_cm) AS average_height FROM superhero GROUP BY superhero.superhero_name;	superhero
SELECT sp.power_name FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  JOIN gender ON superhero.gender_id = gender.id  WHERE race.id = 21 AND gender.id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE attribute_name = 'Speed'  ORDER BY attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT T2.attribute_name, T2.attribute_value  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  WHERE T1.superhero_name = '3-D Man'	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c_eye ON s.eye_colour_id = c_eye.id JOIN colour c_hair ON s.hair_colour_id = c_hair.id WHERE c_eye.colour = 'Blue' AND c_hair.colour = 'Brown';	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Hawkman' OR superhero.superhero_name = 'Karate Kid' OR superhero.superhero_name = 'Speedy';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;	superhero
SELECT      CAST(SUM(CASE WHEN c.id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id)  FROM      colour c  JOIN      superhero s ON c.id = s.eye_colour_id;	superhero
SELECT CAST(SUM(CASE WHEN T.superhero.gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T.superhero.gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero AS T;	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT power_id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Karen Beecher-Duncan';	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T1.race FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Height (cm)') AND T2.attribute_value = 188 WHERE T1.weight_kg = (SELECT attribute_value FROM hero_attribute AS T3 JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Weight (kg)' AND T3.attribute_value = 108);	superhero
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38;	superhero
SELECT T1.race  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  WHERE T2.attribute_value = (SELECT MAX(T2.attribute_value) FROM hero_attribute AS T2)	superhero
SELECT a.alignment, sp.power_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = 'Atom IV'	superhero
SELECT full_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN colour ON hero_attribute.eye_colour_id = colour.id  WHERE attribute.attribute_name = 'Eye Colour' AND colour.colour = 'Blue'  LIMIT 5;	superhero
SELECT AVG(T2.attribute_value)  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  JOIN alignment AS T3 ON T1.alignment_id = T3.id  WHERE T3.alignment = 'Neutral'	superhero
SELECT colour.colour  FROM colour  JOIN superhero ON colour.id = superhero.skin_colour_id  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_value = 100 AND hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence')	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN gender ON superhero.gender_id = gender.id  WHERE alignment.id = 1 AND gender.id = 2;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  JOIN gender ON superhero.gender_id = gender.id  WHERE colour.colour = 'blue' AND gender.gender = 'Male';	superhero
SELECT      CAST(SUM(CASE WHEN T1.gender_id = 2 AND T2.alignment_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T2.alignment_id = 2 THEN 1 END) AS percentage_female_badsuperheroes FROM      superhero AS T1 JOIN      alignment AS T2 ON T1.alignment_id = T2.id JOIN      gender AS T3 ON T1.gender_id = T3.id WHERE      T2.id = 2;	superhero
SELECT      (         (SELECT COUNT(*) FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE c.id = 7 AND s.weight_kg = 0 OR s.weight_kg IS NULL)         -         (SELECT COUNT(*) FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE c.id = 1 AND s.weight_kg = 0 OR s.weight_kg IS NULL)     ) AS difference	superhero
SELECT attribute_value  FROM hero_attribute  JOIN superhero ON hero_attribute.hero_id = superhero.id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE superhero.superhero_name = 'Hulk' AND attribute.attribute_name = 'Strength'	superhero
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Ajax'	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  WHERE colour.colour = 'Green' AND superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher.publisher_name = 'Marvel Comics'	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Wind Control'  ORDER BY superhero.superhero_name ASC;	superhero
SELECT T1.gender  FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T3.power_name = 'Phoenix Force';	superhero
SELECT superhero.superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics' ORDER BY superhero.weight_kg DESC LIMIT 1;	superhero
SELECT AVG(superhero.height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.race <> 'Human' AND publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed') AND hero_attribute.attribute_value = 100;	superhero
SELECT      CASE          WHEN SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)          THEN CONCAT('DC Comics has ', SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END), ' more superheroes than Marvel Comics.')         WHEN SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)          THEN CONCAT('Marvel Comics has ', SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END), ' more superheroes than DC Comics.')         ELSE 'Both publishers have the same number of superheroes.'     END AS Publisher_Comparison FROM      publisher AS T1;	superhero
SELECT attribute.attribute_name FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;	superhero
SELECT colour.colour  FROM colour  JOIN superhero ON colour.id = superhero.eye_colour_id  WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      CAST(SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS REAL) AS percentage_female_superheroes FROM      superhero WHERE      publisher_id IN (         SELECT id FROM publisher WHERE publisher_name = 'George Lucas'     );	superhero
SELECT      CAST(SUM(CASE WHEN T.superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND T.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T.superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 END) AS PercentageOfGoodSuperheroes FROM      superhero AS T JOIN      alignment AS A ON T.alignment_id = A.id JOIN      publisher AS P ON T.publisher_id = P.id	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN colour ON hero_attribute.attribute_id = colour.id WHERE superhero.weight_kg < 100 AND colour.colour = 'Brown'	superhero
SELECT attribute_value FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Aquababy')	superhero
SELECT weight_kg, race FROM superhero WHERE id = 40;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.attribute_name = 'Neutral'	superhero
SELECT superhero.id AS hero_id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence';	superhero
SELECT colour.colour  FROM colour  JOIN superhero ON colour.id = superhero.eye_colour_id  WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero h ON hp.hero_id = h.id  WHERE h.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 18 AND T2.q1 IS NOT NULL ORDER BY T2.q1 LIMIT 5	formula_1
SELECT T2.surname  FROM qualifying AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T1.raceId = 19 AND T1.q2 IS NOT NULL  ORDER BY T1.q2  LIMIT 1	formula_1
SELECT T1.year FROM `races` AS T1 JOIN `circuits` AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = 'Shanghai';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Germany'	formula_1
SELECT T3.position  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  JOIN results AS T3 ON T2.raceId = T3.raceId  WHERE T1.constructorId = (SELECT constructorId FROM constructors WHERE name = 'Renault')	formula_1
SELECT COUNT(*)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2010 AND c.country NOT IN ('Asia', 'Europe')	formula_1
SELECT T2.name  FROM races AS T1  JOIN circuits AS T2 ON T1.circuitId = T2.circuitId  WHERE T2.country = 'Spain';	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Australian Grand Prix';	formula_1
SELECT T1.url FROM `races` AS T1 JOIN `circuits` AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix';	formula_1
SELECT T2.country  FROM constructorResults AS T1  JOIN circuits AS T2 ON T1.constructorId = T2.constructorId  WHERE T1.points = 1 AND T1.raceId = 24;	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354;	formula_1
SELECT nationality  FROM drivers  JOIN qualifying ON drivers.driverId = qualifying.driverId  WHERE qualifying.q2 = '0:01:40' AND qualifying.raceId = 355;	formula_1
SELECT `number` FROM `qualifying` WHERE `q3` = '01:54' AND `raceId` = 903;	formula_1
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.statusId != 1	formula_1
SELECT T1.url  FROM seasons AS T1  JOIN races AS T2 ON T1.year = T2.year  WHERE T2.raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId FROM races WHERE date = '2015-11-29' ) AND statusId = 1;	formula_1
SELECT drivers.surname, drivers.forename, drivers.dob FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 592 AND results.statusId = 1 ORDER BY drivers.dob ASC LIMIT 1	formula_1
SELECT drivers.forename, drivers.surname, drivers.url FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.time = '01:27.418';	formula_1
SELECT T2.nationality  FROM results AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T1.raceId = 933 AND T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933)	formula_1
SELECT location, lat, lng FROM circuits WHERE name = 'Malaysian Grand Prix';	formula_1
SELECT T2.url FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.points = (SELECT MAX(points) FROM constructorStandings WHERE raceId = 9)	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceId = 345;	formula_1
SELECT T3.nationality FROM qualifying AS T1 JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.q2 = '0:01:15' AND T1.raceId = 347	formula_1
SELECT T1.forename, T1.surname  FROM drivers AS T1  JOIN qualifying AS T2 ON T1.driverId = T2.driverId  WHERE T2.raceId = 45 AND T2.q3 = '0:01:33'	formula_1
SELECT time FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE code = 'MCL') AND raceId = 743;	formula_1
SELECT driver.name  FROM drivers AS driver  JOIN results ON driver.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2006  AND races.name = 'San Marino Grand Prix'  AND results.position = 2;	formula_1
SELECT T2.url  FROM races AS T1  JOIN seasons AS T2 ON T1.year = T2.year  WHERE T1.raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29')	formula_1
SELECT      drivers.driverId,      drivers.forename,      drivers.surname,      drivers.dob FROM      results JOIN      drivers ON results.driverId = drivers.driverId WHERE      results.raceId = 872 AND results.time IS NOT NULL ORDER BY      drivers.dob DESC LIMIT 1	formula_1
SELECT drivers.forename, drivers.surname  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE results.raceId = 348 AND results.fastestLapTime = (SELECT MIN(time) FROM results WHERE raceId = 348)	formula_1
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT    CAST((fastestLapSpeed(853) - fastestLapSpeed(854)) / fastestLapSpeed(853) * 100 AS REAL) AS percentage_faster FROM results WHERE raceId IN (853, 854) ORDER BY raceId DESC, fastestLapSpeed ASC LIMIT 1	formula_1
SELECT      COUNT(CASE WHEN T1.time IS NOT NULL THEN T1.driverId ELSE NULL END) / COUNT(T1.driverId) * 100 AS completion_rate FROM      races AS T1 JOIN      results AS T2 ON T1.raceId = T2.raceId WHERE      T1.date = '1983-07-16';	formula_1
SELECT year FROM races WHERE name = 'Singapore Grand Prix' ORDER BY year ASC LIMIT 1;	formula_1
SELECT COUNT(*) AS race_count, name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT r1.name, r2.name  FROM races r1  JOIN races r2 ON r2.year = r1.year AND r2.month = r1.month AND r1.raceId < r2.raceId WHERE r1.date = (SELECT MIN(date) FROM races)	formula_1
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1;	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT `name` FROM `races` WHERE `year` = 2017 EXCEPT SELECT `name` FROM `races` WHERE `year` = 2000;	formula_1
SELECT T1.country, T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year = (SELECT MIN(year) FROM races WHERE country LIKE 'European%' AND name LIKE 'Grand Prix')	formula_1
SELECT year  FROM races  WHERE name = 'British Grand Prix' AND circuitId IN (     SELECT circuitId      FROM circuits      WHERE name = 'Brands Hatch' )  ORDER BY year DESC  LIMIT 1;	formula_1
SELECT COUNT(*)  FROM races  WHERE circuitId IN (     SELECT circuitId      FROM circuits      WHERE name = 'Silverstone International Circuit' AND country = 'United Kingdom' ) AND name LIKE '%British Grand Prix%'	formula_1
SELECT d.forename, d.surname, r.position FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Singapore Grand Prix' AND year = 2010) ORDER BY r.position;	formula_1
SELECT T1.forename, T1.surname  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T2.points = (SELECT MAX(points) FROM results)	formula_1
SELECT d.forename, d.surname, r.points FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races rs ON r.raceId = rs.raceId WHERE rs.year = 2017 AND rs.name = 'Chinese Grand Prix' ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT drivers.forename, races.name, lapTimes.time  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  JOIN lapTimes ON results.resultId = lapTimes.raceId AND results.driverId = lapTimes.driverId  WHERE lapTimes.time = (SELECT MIN(time) FROM lapTimes);	formula_1
SELECT AVG(T3.time)  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN lapTimes AS T3 ON T2.raceId = T3.raceId AND T1.driverId = T3.driverId  WHERE T1.forename = 'Sebastian' AND T1.surname = 'Vettel' AND T2.raceId = (SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND year = 2009)	formula_1
SELECT      COUNT(CASE WHEN position > 1 THEN raceId END) * 100.0 / COUNT(raceId) AS percentage FROM      results WHERE      surname = 'Hamilton' AND year >= 2010;	formula_1
SELECT      d.surname AS Driver_Name,      d.nationality AS Nationality,      AVG(r.points) AS Average_Point_Scores FROM      drivers d JOIN      driverStandings rs ON d.driverId = rs.driverId JOIN      results r ON rs.raceId = r.raceId AND d.driverId = r.driverId WHERE      rs.wins = (         SELECT              MAX(wins)          FROM              driverStandings     ) GROUP BY      d.driverId;	formula_1
SELECT MAX(YEAR(DATE()) - YEAR(`dob`) + 1) AS `age`, `forename`, `surname`  FROM `drivers`  WHERE `nationality` = 'Japanese'	formula_1
SELECT DISTINCT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.year BETWEEN 1990 AND 2000  GROUP BY c.circuitId  HAVING COUNT(r.raceId) = 4	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT races.name AS RaceName, circuits.name AS CircuitName, circuits.location AS Location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE year = 2005 AND month(races.date) = 9;	formula_1
SELECT T2.name  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  JOIN drivers AS T3 ON T3.driverId = T1.driverId  WHERE T3.code = 'YOOG' AND T1.position < 10	formula_1
SELECT COUNT(*)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  JOIN circuits c ON ra.circuitId = c.circuitId  WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit' AND r.rank = 1;	formula_1
SELECT T1.name, T2.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T2.fastestLapTime ASC LIMIT 1	formula_1
SELECT AVG(T2.points)  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T2.year = 2000;	formula_1
SELECT      r.year AS first_year,      rs.points AS points_first_race FROM      races r JOIN      results rs ON r.raceId = rs.raceId JOIN      drivers d ON rs.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY      r.year ASC LIMIT 1;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT race.name, races.year, circuits.location  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.laps = (SELECT MAX(laps) FROM races);	formula_1
SELECT      COUNT(*) FILTER (WHERE country = 'Germany') * 100.0 / COUNT(*) AS percentage FROM      races WHERE      name = 'European Grand Prix' AND     country IN ('Germany', 'European Union');	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT `location`, MAX(`lat`) AS highest_latitude  FROM circuits  WHERE `location` IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')  ORDER BY highest_latitude DESC  LIMIT 1	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT T1.country FROM circuits AS T1 WHERE T1.alt = (SELECT MAX(alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE surname = 'Davidson' AND forename = 'Anthony';	formula_1
SELECT `driverRef` FROM drivers WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton';	formula_1
SELECT circuits.name  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;	formula_1
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit'	formula_1
SELECT      races.name AS Race_Name,      circuits.url AS Circuit_Url FROM      races JOIN      circuits ON races.circuitId = circuits.circuitId WHERE      circuits.name = 'Silverstone Circuit';	formula_1
SELECT `date` FROM races WHERE year BETWEEN 2010 AND 2019 AND name = 'Abu Dhabi Grand Prix' AND circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Abu Dhabi International Circuit')	formula_1
SELECT COUNT(*) FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')	formula_1
SELECT DISTINCT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya' AND year = 2009;	formula_1
SELECT MIN(fastestLapTime) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT `forename`, `surname` FROM `drivers` WHERE `drivers.driverId` IN (SELECT `driverId` FROM `results` WHERE `fastestLapSpeed` = (SELECT MAX(`fastestLapSpeed`) FROM `results`))	formula_1
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Australian Grand Prix' AND races.year = 2008 AND results.position = 1	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT T1.name AS Race_Name, MIN(T2.rank) AS Highest_Rank  FROM circuits AS T1  JOIN results AS T2 ON T1.circuitId = T2.raceId  WHERE T2.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis')  GROUP BY T1.circuitId;	formula_1
SELECT MAX(T.fastestLapSpeed) AS Fastest_Lap_Speed FROM results T JOIN races R ON T.raceId = R.raceId WHERE R.year = 2009 AND R.name = 'Spanish Grand Prix';	formula_1
SELECT DISTINCT T2.year FROM drivers AS T1 JOIN races AS T2 ON T1.driverId = T4.driverId JOIN results AS T4 ON T2.raceId = T4.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton';	formula_1
SELECT positionOrder  FROM results  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')  AND raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)	formula_1
SELECT `forename`, `surname`  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE results.grid = 4 AND results.raceId IN (     SELECT raceId      FROM races      WHERE year = 2008 AND name LIKE '%Australian Grand Prix%'  )	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE name = '2008 Australian Grand Prix') AND time IS NOT NULL;	formula_1
SELECT fastestLapTime FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND fastestLap > 0;	formula_1
SELECT time FROM results WHERE position = 2 AND raceId IN (SELECT raceId FROM races WHERE name = "Australian Grand Prix" AND year = 2008)	formula_1
SELECT      d.surname AS Champion_Surname,     d.forename AS Champion_Forename,     c.url AS More_Information FROM      drivers d JOIN      constructorStandings cs ON d.driverId = cs.driverId AND cs.position = 1 JOIN      races r ON cs.raceId = r.raceId AND r.name = 'Australian Grand Prix' JOIN      results res ON d.driverId = res.driverId AND r.raceId = res.raceId AND res.position = 1 JOIN      constructors c ON cs.constructorId = c.constructorId WHERE      r.year = 2008;	formula_1
SELECT COUNT(*)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races rs ON r.raceId = rs.raceId  WHERE d.nationality = 'American' AND rs.year = 2008 AND rs.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(*)  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2008  AND races.name LIKE 'Australian Grand Prix'  AND results.time IS NOT NULL	formula_1
SELECT SUM(T2.points) AS total_points FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton';	formula_1
SELECT AVG(STRFTIME('%s', fastestLapTime)) AS AverageFastestLapTime FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT CAST(SUM(CASE WHEN time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(*)  FROM races  JOIN results ON races.raceId = results.raceId  WHERE year = 2008 AND races.name = 'Australian Grand Prix'	formula_1
SELECT      (ABS(T1.fastestLapTime - T2.fastestLapTime) / T2.fastestLapTime) * 100 AS percentage_faster FROM      (         SELECT fastestLapTime FROM results WHERE driverId = 1 AND raceId = (SELECT raceId FROM races WHERE name = '2008 Australian Grand Prix' AND year = 2008)     ) T1,     (         SELECT fastestLapTime FROM results WHERE position = (SELECT MAX(position) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = '2008 Australian Grand Prix' AND year = 2008))     ) T2;	formula_1
SELECT COUNT(*)  FROM circuits  WHERE location = 'Melbourne' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01'	formula_1
SELECT AVG(T1.points)  FROM constructorResults AS T1  JOIN constructors AS T2 ON T1.constructorId = T2.constructorId  WHERE T2.nationality = 'British';	formula_1
SELECT name FROM constructors WHERE constructorId = (     SELECT constructorId FROM constructorStandings ORDER BY points DESC LIMIT 1 )	formula_1
SELECT T2.name FROM `constructorStandings` AS T1 JOIN `constructors` AS T2 ON T1.constructorId = T2.constructorId WHERE T1.points = 0 AND T1.raceId = 18;	formula_1
SELECT COUNT(*)  FROM (     SELECT constructorId      FROM constructorResults      WHERE nationality = 'Japanese' AND points = 0     GROUP BY constructorId     HAVING COUNT(DISTINCT raceId) = 2 ) AS subquery	formula_1
SELECT DISTINCT T2.name FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.position = 1;	formula_1
SELECT COUNT(*)  FROM constructors  JOIN results ON constructors.constructorId = results.constructorId  WHERE constructors.nationality = 'French' AND results.laps > 50;	formula_1
SELECT      COUNT(CASE WHEN T1.time IS NOT NULL THEN T1.driverId ELSE NULL END) * 100.0 / COUNT(T1.driverId) AS completion_percentage FROM      results AS T1 JOIN      drivers AS T2 ON T1.driverId = T2.driverId WHERE      T2.nationality = 'Japanese' AND      T1.year BETWEEN 2007 AND 2009;	formula_1
SELECT AVG(SUBSTR(TIME, 1, INSTR(TIME, ':') - 1) || SUBSTR(TIME, INSTR(TIME, ':') + 1)) AS average_time_seconds FROM results WHERE statusId = 1;	formula_1
SELECT forename, surname  FROM drivers  WHERE dob > '1975-01-01' AND driverStandingsId IN (     SELECT driverStandingsId      FROM driverStandings      WHERE position = 2 )	formula_1
SELECT COUNT(*)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.nationality = 'Italian' AND results.time IS NULL;	formula_1
SELECT forename, surname  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE results.fastestLapTime IS NOT NULL  ORDER BY results.fastestLapTime ASC  LIMIT 1;	formula_1
SELECT T3.fastestLapNumber FROM results AS T1 JOIN constructorstandings AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T4 ON T1.raceId = T4.raceId WHERE T4.year = 2009 AND T2.position = 1 LIMIT 1	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM `results` AS T1 INNER JOIN `drivers` AS T2 ON T1.driverId = T2.driverId WHERE T1.name = 'Spanish Grand Prix' AND T1.statusId = 1	formula_1
SELECT T2.name, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1milliseconds IS NOT NULL ORDER BY T1milliseconds ASC LIMIT 1;	formula_1
SELECT      COUNT(*) FILTER (WHERE year(dob) < 1985 AND laps > 50) * 100.0 /      COUNT(*) FILTER (WHERE year BETWEEN 2000 AND 2005) AS percentage FROM drivers JOIN races ON drivers.driverId = results.driverId JOIN results ON races.raceId = results.raceId WHERE year(races.year) BETWEEN 2000 AND 2005	formula_1
SELECT COUNT(*)  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE drivers.nationality = 'French' AND results.time < '02:00:00'	formula_1
SELECT `code` FROM drivers WHERE `nationality` = 'American';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT      drivers.number,      COUNT(*) AS netherlands_drivers_count FROM      drivers JOIN      seasons ON seasons.year = drivers.dob WHERE      drivers.nationality = 'Dutch' GROUP BY      drivers.driverId ORDER BY      MIN(seasons.year) ASC LIMIT 3	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Kubica' AND forename = 'Robert';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE dob LIKE '%1980-%' AND nationality = 'Australian';	formula_1
SELECT      d.driverId,     d.forename,     d.surname FROM      drivers d JOIN      races r ON d.driverId = r.driverId JOIN      results res ON res.driverId = d.driverId AND res.raceId = r.raceId WHERE      d.nationality = 'German' AND     d.dob BETWEEN '1980-01-01' AND '1990-12-31' AND     r.year BETWEEN 2009 AND 2022 AND     res.position = 1 AND     res.fastestLap IS NOT NULL AND     res.fastestLapTime IS NOT NULL ORDER BY      res.fastestLapTime ASC LIMIT 3;	formula_1
SELECT      MIN(d dob) AS oldest_dob,     driverRef FROM      drivers WHERE      nationality = 'German' ORDER BY      d dob ASC LIMIT 1;	formula_1
SELECT driverId, code  FROM drivers  WHERE year(dob) = 1971 AND fastestLapTime IS NOT NULL;	formula_1
SELECT      d.driverId,      d.forename,      d.surname,      MAX(r.time) AS latest_lap_time FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      d.nationality = 'Spanish' AND      d.dob < '1982-01-01' GROUP BY      d.driverId,      d.forename,      d.surname ORDER BY      latest_lap_time DESC LIMIT 10;	formula_1
SELECT T1.year  FROM seasons AS T1  JOIN results AS T2 ON T1.year = T2.raceId  WHERE T2.fastestLapTime IS NOT NULL  ORDER BY T2.fastestLapTime ASC  LIMIT 1	formula_1
SELECT T1.year FROM `races` AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime = 'Max' GROUP BY T1.year ORDER BY T1.year LIMIT 1	formula_1
SELECT driverId  FROM lapTimes  WHERE lap = 1  ORDER BY time  LIMIT 5	formula_1
SELECT COUNT(*)  FROM results  WHERE statusId = 2 AND raceId BETWEEN 50 AND 100 AND time IS NOT NULL	formula_1
SELECT COUNT(*) AS count, location, lat, lng  FROM circuits  WHERE location LIKE '%Austria%' AND lat IS NOT NULL AND lng IS NOT NULL;	formula_1
SELECT raceId AS "race_number" FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT T2.driverRef, T2.nationality, T2.dob FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.q2 IS NOT NULL AND T1.raceId = 23;	formula_1
SELECT T1.year, T1.name, T1.date, T1.time  FROM seasons AS T1  JOIN qualifying AS T2 ON T1.year = T2.raceId  JOIN drivers AS T3 ON T2.driverId = T3.driverId  WHERE T3.forename = 'Max' AND T3.surname = 'Verstappen'  ORDER BY T3.dob DESC  LIMIT 1	formula_1
SELECT COUNT(*)  FROM results  WHERE statusId = 2 AND nationality = 'American';	formula_1
SELECT c.name, c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1;	formula_1
SELECT T2.url FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.wins = (SELECT MAX(wins) FROM constructorStandings) LIMIT 1	formula_1
SELECT      d.driverId, d.forename, d.surname, r.time FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races rs ON r.raceId = rs.raceId WHERE      rs.name = 'French Grand Prix' AND      r.lap = 3 ORDER BY      r.time DESC LIMIT 1;	formula_1
SELECT T1.time, T1.milliseconds FROM lapTimes AS T1 WHERE T1.lap = 1 ORDER BY T1.time LIMIT 1	formula_1
SELECT AVG(T.fastestLapTime)  FROM results T  JOIN races R ON T.raceId = R.raceId  JOIN seasons S ON R.year = S.year  WHERE R.name LIKE '%United States Grand Prix%' AND S.year = 2006 AND T.position <= 10 AND T.fastestLapTime IS NOT NULL	formula_1
SELECT d.driverId, d.forename, AVG(ps.duration) AS avg_duration FROM drivers d JOIN pitstops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId, d.forename ORDER BY avg_duration ASC LIMIT 5;	formula_1
SELECT T1.forename, T1.surname, T3.time  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN races AS T3 ON T2.raceId = T3.raceId  WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2008 AND T2.position = 1	formula_1
SELECT T2.constructorRef, T2.url  FROM races AS T1  JOIN constructorStandings AS T2 ON T1.raceId = T2.raceId  JOIN seasons AS T3 ON T1.year = T3.year  WHERE T1.name = 'Singapore Grand Prix' AND T3.year = 2009  ORDER BY T1.time LIMIT 1	formula_1
SELECT drivers.forename, drivers.surname, drivers.dob  FROM drivers  WHERE drivers.nationality = 'Austrian' AND year(drivers.dob) BETWEEN 1981 AND 1991	formula_1
SELECT      drivers.forename + ' ' + drivers.surname AS FullName,     drivers.url AS WikipediaPageLink,     drivers.dob FROM      drivers WHERE      drivers.nationality = 'German' AND      drivers.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY      drivers.dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Hungaroring')	formula_1
SELECT cr.points, c.name, c.nationality  FROM constructorResults AS cr  JOIN constructors AS c ON cr.constructorId = c.constructorId  JOIN races AS r ON cr.raceId = r.raceId  WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010  ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT AVG(T1.points)  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  JOIN circuits AS T3 ON T2.circuitId = T3.circuitId  WHERE T3.country = 'Turkey' AND T1.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton')	formula_1
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM (     SELECT YEAR(date) AS race_year     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31' ) AS race_years GROUP BY EXTRACT(YEAR FROM date)	formula_1
SELECT nationality FROM drivers WHERE ROWID IN (     SELECT ROWID     FROM (         SELECT ROWID, COUNT(*) AS count         FROM drivers         GROUP BY nationality         ORDER BY count DESC         LIMIT 1     ) );	formula_1
SELECT SUM(results.points)  FROM results  WHERE results.rank = 91 AND results.fastestLap IS NOT NULL;	formula_1
SELECT T1.name FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.raceId WHERE T2.fastestLapSpeed = (SELECT MIN(fastestLapSpeed) FROM results)	formula_1
SELECT `location`, `country` FROM `races` WHERE `date` = (SELECT MAX(`date`) FROM `races`)	formula_1
SELECT      drivers.forename,      drivers.surname  FROM      drivers  JOIN      qualifying ON drivers.driverId = qualifying.driverId  JOIN      races ON qualifying.raceId = races.raceId  WHERE      races.name = 'Marina Bay Street Circuit' AND      races.year = 2008 AND      qualifying.position = (SELECT MIN(position) FROM qualifying WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Marina Bay Street Circuit' AND year = 2008) ORDER BY raceId, position LIMIT 1) AND      races.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Marina Bay Street Circuit') AND      qualifying.qualifyId = (SELECT MAX(qualifyId) FROM qualifying WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Marina Bay Street Circuit' AND year = 2008));	formula_1
SELECT      T1.forename + ' ' + T1.surname AS full_name,     T1.nationality,     T2.name AS first_race FROM      drivers AS T1 JOIN      races AS T2 ON T1.driverId = T2.driverId WHERE      T1.dob = (SELECT MAX(dob) FROM drivers) ORDER BY      T2.date LIMIT 1;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE name = 'Canadian Grand Prix' ) AND statusId = 3	formula_1
SELECT T2.forename, T2.surname FROM drivers AS T2 JOIN driverStandings AS T1 ON T2.driverId = T1.driverId WHERE T1.wins > 0 AND T2.dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT MAX(`duration`) AS `longest_time_spent_at_pitstop` FROM `pitStops`;	formula_1
SELECT time FROM lapTimes ORDER BY milliseconds LIMIT 1	formula_1
SELECT MAX(`duration`) AS longest_time FROM pitStops WHERE `driverId` = (SELECT `driverId` FROM drivers WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton');	formula_1
SELECT lap FROM pitStops WHERE raceId = (SELECT raceId FROM races WHERE name = '2011 Australian Grand Prix') AND driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton');	formula_1
SELECT T1.driverId, T1.time AS pitStopTime FROM pitStops AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN seasons AS T3 ON T2.year = T3.year WHERE T2.name LIKE '%2011 Australian Grand Prix%' AND T3.year = 2011	formula_1
SELECT MIN(time) AS LapRecordTime FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND position = 1;	formula_1
SELECT `surname`, `forename`  FROM drivers  JOIN lapTimes ON drivers.driverId = lapTimes.driverId  WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT T1.positionText FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton') AND T2.fastestLapTime IS NOT NULL;	formula_1
SELECT MIN(time) AS lap_record FROM lapTimes WHERE raceId IN (     SELECT raceId FROM races WHERE name = 'Austrian Grand Prix' ) AND position = 1;	formula_1
SELECT c.name, l.time  FROM circuits c  JOIN (     SELECT raceId, MIN(time) AS min_time      FROM lapTimes      GROUP BY driverId, raceId ) l ON c.circuitId = (SELECT circuitId FROM races WHERE raceId = l.raceId) WHERE c.country = 'Italy' ORDER BY l.min_time;	formula_1
SELECT T1.name AS race_name, T2.time AS lap_record_time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T3.name = 'Austrian Grand Prix' AND T2.fastestLapTime IS NOT NULL;	formula_1
SELECT T2.duration FROM circuits AS T1 JOIN pitStops AS T2 ON T1.circuitId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' AND T2.time LIKE '%Austrian Grand Prix%'	formula_1
SELECT `lat`, `lng`  FROM circuits  WHERE `time` = '1:29.488'	formula_1
SELECT AVG(milliseconds)  FROM pitStops  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(T3milliseconds)  FROM (     SELECT T1.laps, T1.milliseconds      FROM lapTimes AS T1      JOIN circuits AS T2 ON T1.circuitId = T2.circuitId      WHERE T2.country = 'Italy' ) AS subquery	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player) LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating BETWEEN 60 AND 65  AND defensive_work_rate = 'low';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) LIMIT 5;	european_football_2
SELECT league.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY SUM(home_team_goal + away_team_goal) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id  FROM "Match"  WHERE season = '2015/2016' AND (home_team_goal - away_team_goal) < 0  GROUP BY home_team_api_id  ORDER BY COUNT(*) ASC  LIMIT 1	european_football_2
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.penalties = (SELECT MAX(penalties) FROM Player_Attributes) ORDER BY Player_Attributes.penalties DESC LIMIT 10;	european_football_2
SELECT away_team_api_id  FROM Match  WHERE season = '2009/2010' AND league_id IN (     SELECT id      FROM League      WHERE name = 'Scotland Premier League' )  GROUP BY away_team_api_id  HAVING SUM(CASE WHEN away_team_goal > home_team_goal THEN 1 ELSE 0 END) > ALL (     SELECT SUM(CASE WHEN away_team_goal > home_team_goal THEN 1 ELSE 0 END)      FROM Match      WHERE season = '2009/2010' AND league_id IN (         SELECT id          FROM League          WHERE name = 'Scotland Premier League'     )      GROUP BY away_team_api_id ) ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT MAX(buildUpPlaySpeed) AS TopSpeed FROM Team_Attributes WHERE team_api_id IN (     SELECT team_api_id     FROM (         SELECT team_api_id, RANK() OVER (ORDER BY buildUpPlaySpeed DESC) AS rank         FROM Team_Attributes         WHERE buildUpPlaySpeed IS NOT NULL         LIMIT 4     ) subquery     WHERE rank = 1 )	european_football_2
SELECT league.name  FROM League  JOIN Match ON League.id = Match.league_id  WHERE Match.season = '2015/2016'  GROUP BY League.name  ORDER BY SUM(home_team_goal = away_team_goal) DESC  LIMIT 1;	european_football_2
SELECT T1.player_name,         TIMESTAMPDIFF(YEAR, T1.birthday, CURRENT_DATE()) AS age FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND T2.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'	european_football_2
SELECT League.name, COUNT(*) AS total_matches FROM Match JOIN League ON Match.league_id = League.id GROUP BY League.id ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(T.height)  FROM Player AS T  WHERE T.birthday >= '1990-01-01 00:00:00' AND T.birthday < '1996-01-01 00:00:00'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' AND overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE strftime('%Y', Team_Attributes.date) = '2012' AND Team_Attributes.buildUpPlayPassing > (SELECT AVG(Team_Attributes.buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', Team_Attributes.date) = '2012');	european_football_2
SELECT      (SUM(CASE WHEN t.player_api_id IN (         SELECT p.player_api_id FROM Player p          WHERE strftime('%Y', p.birthday) BETWEEN '1987' AND '1992'     ) AND t.preferred_foot = 'left')      ) * 1.0 / COUNT(DISTINCT CASE WHEN strftime('%Y', p.birthday) BETWEEN '1987' AND '1992' THEN p.player_api_id ELSE NULL END) AS percentage_left_foot FROM Player_Attributes t JOIN Player p ON t.player_api_id = p.player_api_id	european_football_2
SELECT league_id, SUM(home_team_goal + away_team_goal) as total_goals FROM Match GROUP BY league_id ORDER BY total_goals ASC LIMIT 5	european_football_2
SELECT AVG(`long_shots`)  FROM `Player_Attributes`  WHERE `player_api_id` IN (     SELECT `player_api_id`      FROM `Player`      WHERE `player_name` = 'Ahmed Samir Farag' )	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_api_id ORDER BY AVG(pa.heading_accuracy) DESC LIMIT 10	european_football_2
SELECT T1.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (     SELECT AVG(T3.chanceCreationPassing)      FROM Team_Attributes AS T3     WHERE T3.buildUpPlayDribblingClass = 'Normal'     AND T3.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' ) ORDER BY T1.chanceCreationPassing DESC;	european_football_2
SELECT L.name  FROM League AS L JOIN Match AS M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name  FROM Player  WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10'	european_football_2
SELECT attacking_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Franco Zennaro')	european_football_2
SELECT buildUpPlayPositioningClass FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' AND date BETWEEN '2010-02-22 00:00:00' AND '2010-12-31 23:59:59';	european_football_2
SELECT `finishing`  FROM `Player_Attributes`  WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francois Affolter')  AND `date` = '2014-09-18 00:00:00';	european_football_2
SELECT overall_rating  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas')  AND strftime('%Y', date) = '2011';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season LIKE '2015/2016' AND League.name = 'Scotland Premier League';	european_football_2
SELECT preferred_foot  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.birthday = (SELECT MAX(birthday) FROM Player)	european_football_2
SELECT player_name FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.weight < 130 AND Player_Attributes.preferred_foot = 'left'	european_football_2
SELECT DISTINCT T.team_short_name FROM Team_Attributes TA JOIN Team T ON TA.team_api_id = T.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson')	european_football_2
SELECT T.player_birthday FROM Player_Attributes AS PA JOIN Player AS T ON PA.player_api_id = T.player_api_id WHERE PA.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT `name` FROM `League` WHERE `country_id` = (SELECT `id` FROM `Country` WHERE `name` = 'Netherlands')	european_football_2
SELECT AVG(home_team_goal)  FROM "Match"  WHERE country_id IN (SELECT id FROM Country WHERE name = 'Poland') AND season = '2010/2011';	european_football_2
SELECT AVG(T1.finishing) AS avg_finishing_rate FROM Player_Attributes T1 JOIN Player T2 ON T1.player_api_id = T2.player_api_id WHERE T2.height IN (SELECT MAX(height) FROM Player WHERE height IS NOT NULL) UNION SELECT AVG(T1.finishing) AS avg_finishing_rate FROM Player_Attributes T1 JOIN Player T2 ON T1.player_api_id = T2.player_api_id WHERE T2.height IN (SELECT MIN(height) FROM Player WHERE height IS NOT NULL)	european_football_2
SELECT T.player_name FROM `Player` AS T WHERE T.height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT potential  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (     SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'left' )	european_football_2
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT buildUpPlayPassingClass FROM Team WHERE team_short_name = 'CLB';	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlayPassing > 70	european_football_2
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  WHERE strftime('%Y', `date`) BETWEEN '2010' AND '2015'  AND `height` > 170;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)	european_football_2
SELECT c.name  FROM League l  JOIN Country c ON l.country_id = c.id  WHERE l.name = 'Italy Serie A'	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')	european_football_2
SELECT COUNT(*)  FROM "Match"  JOIN League ON "Match".league_id = League.id  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', "Match".date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT DISTINCT T.team_short_name FROM Match M JOIN Team T ON M.home_team_api_id = T.team_api_id WHERE M.home_team_goal = 10;	european_football_2
SELECT player_name  FROM Player  WHERE player_api_id IN (     SELECT player_api_id      FROM Player_Attributes      WHERE potential = 61      ORDER BY balance DESC      LIMIT 1 )	european_football_2
SELECT      AVG(TA.ball_control) - AVG(PA.ball_control) AS Difference_Average_Ball_Control FROM      Player_Attributes PA JOIN      Player P ON PA.player_api_id = P.player_api_id JOIN      Team_Attributes TA ON P.player_fifa_api_id = TA.team_fifa_api_id WHERE      P.player_name = 'Abdou Diallo' UNION ALL SELECT      AVG(TA.ball_control) - AVG(PA.ball_control) AS Difference_Average_Ball_Control FROM      Player_Attributes PA JOIN      Player P ON PA.player_api_id = P.player_api_id JOIN      Team_Attributes TA ON P.player_fifa_api_id = TA.team_fifa_api_id WHERE      P.player_name = 'Aaron Appindangoye'	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_name  FROM Player  WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada'))  ORDER BY birthday ASC  LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT Country.name  FROM Country  JOIN League ON Country.id = League.country_id  WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Germany'	european_football_2
SELECT player_name, MAX(overall_rating) AS strongest_overall_strength FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id;	european_football_2
SELECT COUNT(*)  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE strftime('%Y', Player.birthday) < '1986' AND Player_Attributes.defensive_work_rate = 'high';	european_football_2
SELECT player_name FROM Player_Attributes WHERE player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE `crossing` = (         SELECT MAX(`crossing`)          FROM Player_Attributes     ) )	european_football_2
SELECT Heading_Accuracy FROM Player_Attributes WHERE player_api_id = (SELECT id FROM Player WHERE player_name = 'Ariel Borysiuk')	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.height > 180 AND Player_Attributes.volleys > 70	european_football_2
SELECT player_name  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Belgium' AND season = '2008/2009';	european_football_2
SELECT T1.long_passing FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT COUNT(*)  FROM "Match"  JOIN League ON "Match".league_id = League.id  WHERE League.name = 'Belgium Jupiler League'  AND strftime('%Y', "Match".date) = '2009'  AND strftime('%m', "Match".date) = '04';	european_football_2
SELECT league_id  FROM Match  WHERE season = '2008/2009'  GROUP BY league_id  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE strftime('%Y', `Player`.`birthday`) < '1986'	european_football_2
SELECT      ( (MAX(`overall_rating`) - (SELECT `overall_rating` FROM `Player` WHERE `player_name` = 'Paulin Puel')) / (SELECT `overall_rating` FROM `Player` WHERE `player_name` = 'Paulin Puel') ) * 100 AS percentage_increase FROM      `Player` WHERE      `player_name` = 'Ariel Borysiuk';	european_football_2
SELECT AVG(Team_Attributes.buildUpPlaySpeed)  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes T1  JOIN Player T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(`crossing`)  FROM `Player_Attributes`  JOIN `Player` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id`  WHERE `Player`.`player_name` = 'Aaron Lennox'	european_football_2
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass  FROM Team_Attributes  WHERE team_long_name = 'Ajax'	european_football_2
SELECT preferred_foot FROM Player WHERE player_name = 'Abdou Diallo'	european_football_2
SELECT MAX(`overall_rating`)  FROM `Player_Attributes`  WHERE `player_name` = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal)  FROM Match  WHERE away_team_api_id IN      (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma')  AND country_id IN      (SELECT id FROM Country WHERE name = 'Italy')	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating = 77 AND T1.date = '2016-06-23' ORDER BY T2.birthday ASC LIMIT 1;	european_football_2
SELECT overall_rating  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Mooy')  AND date = '2016-02-04 00:00:00'	european_football_2
SELECT potential  FROM Player_Attributes  WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'	european_football_2
SELECT `attacking_work_rate`  FROM `Player_Attributes`  WHERE `player_api_id` IN (     SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francesco Migliore' ) AND `date` = '2015-05-01 00:00:00'	european_football_2
SELECT t1.defensive_work_rate  FROM Player_Attributes AS t1  JOIN Player AS t2 ON t1.player_api_id = t2.player_api_id  WHERE t2.player_name = 'Kevin Berigaud' AND t1.date = '2013-02-22 00:00:00'	european_football_2
SELECT date  FROM Player_Attributes  WHERE player_api_id IN (     SELECT player_api_id      FROM Player_Attributes      WHERE player_name = 'Kevin Constant'      ORDER BY crossing DESC      LIMIT 1 )	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22 00:00:00'	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00'	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_long_name = 'FC Lorient' AND date = '2010-02-22';	european_football_2
SELECT chanceCreationPassingClass FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'	european_football_2
SELECT chanceCreationCrossingClass FROM Team_Attributes WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00'	european_football_2
SELECT `defence_aggression_class` FROM `team_attributes` WHERE `team_long_name` = 'Hannover 96' AND date = '2015-09-10 00:00:00'	european_football_2
SELECT AVG(TA.overall_rating)  FROM Player_Attributes TA  JOIN Player P ON TA.player_api_id = P.player_api_id  JOIN Team T ON TA.team_api_id = T.team_api_id  JOIN Match M ON T.team_api_id = M.home_team_api_id OR T.team_api_id = M.away_team_api_id  WHERE P.player_name = 'Marko Arnautovic' AND M.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'	european_football_2
SELECT      (AVG(`overall_rating` WHERE `player_name` = 'Landon Donovan') - AVG(`overall_rating` WHERE `player_name` = 'Jordan Bowery')) / AVG(`overall_rating` WHERE `player_name` = 'Landon Donovan') * 100 AS percentage_difference FROM `Player_Attributes` WHERE `date` = '2013-07-12'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name  FROM Player  WHERE datetime('now', 'localtime') - datetime(birthday) >= 34	european_football_2
SELECT SUM(home_team_goal)  FROM "Match"  JOIN Player ON "Match".home_player_1 = Player.player_api_id  WHERE Player.player_name = 'Aaron Lennon'	european_football_2
SELECT SUM(T.away_team_goal)  FROM "Match" T  JOIN `Player` P1 ON T.away_player_1 = P1.player_api_id  JOIN `Player` P2 ON T.away_player_2 = P2.player_api_id  JOIN `Player` P3 ON T.away_player_3 = P3.player_api_id  JOIN `Player` P4 ON T.away_player_4 = P4.player_api_id  JOIN `Player` P5 ON T.away_player_5 = P5.player_api_id  JOIN `Player` P6 ON T.away_player_6 = P6.player_api_id  JOIN `Player` P7 ON T.away_player_7 = P7.player_api_id  JOIN `Player` P8 ON T.away_player_8 = P8.player_api_id  JOIN `Player` P9 ON T.away_player_9 = P9.player_api_id  JOIN `Player` P10 ON T.away_player_10 = P10.player_api_id  JOIN `Player` P11 ON T.away_player_11 = P11.player_api_id  WHERE (P1.player_name = 'Daan Smith' OR P2.player_name = 'Daan Smith' OR P3.player_name = 'Daan Smith' OR P4.player_name = 'Daan Smith' OR P5.player_name = 'Daan Smith' OR P6.player_name = 'Daan Smith' OR P7.player_name = 'Daan Smith' OR P8.player_name = 'Daan Smith' OR P9.player_name = 'Daan Smith' OR P10.player_name = 'Daan Smith' OR P11.player_name = 'Daan Smith')  AND (P1.player_name = 'Filipe Ferreira' OR P2.player_name = 'Filipe Ferreira' OR P3.player_name = 'Filipe Ferreira' OR P4.player_name = 'Filipe Ferreira' OR P5.player_name = 'Filipe Ferreira' OR P6.player_name = 'Filipe Ferreira' OR P7.player_name = 'Filipe Ferreira' OR P8.player_name = 'Filipe Ferreira' OR P9.player_name = 'Filipe Ferreira' OR P10.player_name = 'Filipe Ferreira' OR P11.player_name = 'Filipe Ferreira')	european_football_2
SELECT SUM(home_team_goal)  FROM Match  WHERE CAST(DATE('now') AS DATE) - birthday < 31	european_football_2
SELECT player_name FROM Player_Attributes JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 10;	european_football_2
SELECT player_name FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT DISTINCT T.player_name  FROM Player_Attributes AS TA  JOIN Player AS P ON TA.player_api_id = P.player_api_id  WHERE TA.attacking_work_rate = 'high' AND P.player_api_id IN (     SELECT home_player_X1, home_player_X2, home_player_X3, home_player_X4, home_player_X5, home_player_X6, home_player_X7, home_player_X8, home_player_X9, home_player_X10, home_player_X11,             away_player_X1, away_player_X2, away_player_X3, away_player_X4, away_player_X5, away_player_X6, away_player_X7, away_player_X8, away_player_X9, away_player_X10, away_player_X11      FROM Match      WHERE (home_team_goal > 0 OR away_team_goal > 0) )	european_football_2
SELECT T.player_name FROM Player AS T JOIN Player_Attributes AS PA ON T.player_api_id = PA.player_api_id WHERE PA.finishing = 1 ORDER BY STRFTIME('%Y', T.birthday) DESC LIMIT 1;	european_football_2
SELECT T2.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id JOIN Country AS T3 ON T1.country_id = T3.id WHERE T3.name = 'Belgium'	european_football_2
SELECT Player.country, Player.player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player_Attributes.vision >= 90;	european_football_2
SELECT T.country.name FROM (     SELECT T.country_id, AVG(T.player.weight) AS avg_weight     FROM Player AS T     GROUP BY T.country_id ) AS Subquery1 JOIN Country AS T ON T.id = Subquery1.country_id WHERE Subquery1.avg_weight = (     SELECT MAX(avg_weight)     FROM (         SELECT AVG(weight) AS avg_weight         FROM Player         GROUP BY country_id     ) AS Subquery2 );	european_football_2
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT T.team_short_name FROM Team_Attributes AS T JOIN Team AS Te ON T.team_fifa_api_id = Te.team_fifa_api_id WHERE T.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(T.height) AS AverageHeight FROM Player AS T JOIN Country AS C ON T.country_id = C.id WHERE C.name = 'Italy';	european_football_2
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name ASC  LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%' AND strftime('%Y', birthday) > '1990'	european_football_2
SELECT ABS((SELECT jumping FROM Player_Attributes WHERE player_api_id = 6) - (SELECT jumping FROM Player_Attributes WHERE player_api_id = 23)) AS score_difference;	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)  AND preferred_foot = 'right' ORDER BY potential ASC  LIMIT 3	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)  AND preferred_foot = 'left'  AND attacking_work_rate = 'high';	european_football_2
SELECT      (COUNT(*) FILTER (WHERE overall_rating > 80 AND strength > 80 AND stamina > 80) * 100.0 / COUNT(*)) AS percentage FROM      Player_Attributes	european_football_2
SELECT c.name FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Poland Ekstraklasa'	european_football_2
SELECT home_team_goal, away_team_goal  FROM Match  WHERE date LIKE '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League');	european_football_2
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Alexis Blin'	european_football_2
SELECT buildUpPlaySpeedClass FROM Team WHERE team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*)  FROM "Match"  WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')	european_football_2
SELECT MAX(home_team_goal)  FROM "Match"  WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie')	european_football_2
SELECT finishing, curve  FROM Player_Attributes  WHERE weight = (SELECT MAX(weight) FROM Player_Attributes);	european_football_2
SELECT      League.name FROM      League JOIN      Match ON League.id = Match.league_id WHERE      Match.season = '2015/2016' GROUP BY      League.name ORDER BY      COUNT(Match.id) DESC LIMIT 1;	european_football_2
SELECT T.team_long_name  FROM Team AS T  JOIN Match AS M ON T.team_api_id = M.away_team_api_id  WHERE M.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1)	european_football_2
SELECT      CAST(SUM(CASE WHEN height < 180 AND overall_strength > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Player_Attributes JOIN      Player ON Player.player_api_id = Player_Attributes.player_api_id JOIN      Team_Attributes ON Team_Attributes.team_api_id = Player.player_api_id WHERE      Player.height < 180 AND Player_Attributes.overall_strength > 70;	european_football_2
SELECT      (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) -       COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) * 100.0 /      (COUNT(CASE WHEN SEX = 'M' THEN 1 END)) AS Percentage_Deviation FROM      Patient	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN strftime('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT      COUNT(CASE WHEN Admission = '+' THEN 1 END) * 100.0 / COUNT(*) AS InpatientPercentage FROM      Patient WHERE      strftime('%Y', Birthday) BETWEEN '1930' AND '1940'	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)  FROM      Patient  WHERE      Diagnosis = 'SLE'	thrombosis_prediction
SELECT      Diagnosis, Date  FROM      Patient  WHERE      ID = 30609;	thrombosis_prediction
SELECT      Patient.SEX,     Patient.Birthday,     Examination.`Examination Date`,     Examination.Symptoms FROM      Patient JOIN      Examination ON Patient.ID = Examination.ID WHERE      Patient.ID = 163109;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH > 500	thrombosis_prediction
SELECT P.ID,         (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+';	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2 AND T1.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT Patient.ID FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE strftime('%Y', Patient.Birthday) = '1937' AND Laboratory.`T-CHO` >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALB < 3.5;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID)  FROM      Patient AS T1  JOIN      Examination AS T2  ON      T1.ID = T2.ID	thrombosis_prediction
SELECT AVG(`aCL IgG`)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.Admission = '+' AND strftime('%Y', 'now') - strftime('%Y', Patient.Birthday) >= '50'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE YEAR(Description) = 1997 AND SEX = 'F' AND Admission = '-'	thrombosis_prediction
SELECT MIN(T1.Birthday) - MAX(T1.`First Date`) AS Age FROM Patient T1;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = '1' AND p.SEX = 'F' AND strftime('%Y', e.Examination_Date) = '1997'	thrombosis_prediction
SELECT      MAX(YEAR(`Patient`.Birthday)) - MIN(YEAR(`Patient`.Birthday)) FROM      `Patient` WHERE      EXISTS (         SELECT 1 FROM `Laboratory` WHERE `Laboratory`.ID = `Patient`.ID AND `Laboratory`.TG >= 200     )	thrombosis_prediction
SELECT Symptoms, Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = (SELECT MIN(BIRTHDAY) FROM Patient) ORDER BY Examination.Examination_Date LIMIT 1;	thrombosis_prediction
SELECT      COUNT(p.ID) / 12 AS AverageMalePatientsTestedPerMonth FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.SEX = 'M' AND      e.Examination_Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT `First Date`, (EXTRACT(YEAR FROM `First Date`) - EXTRACT(YEAR FROM Birthday)) AS age_when_arrived FROM Patient WHERE Diagnosis = 'SJS' ORDER BY Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN UA <= 8.0 AND SEX = 'M' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN UA <= 6.5 AND SEX = 'F' THEN 1 ELSE 0 END) AS Ratio FROM      Patient JOIN      Examination ON Patient.ID = Examination.ID WHERE      Examination.UA <= CASE WHEN Patient.SEX = 'M' THEN 8.0 ELSE 6.5 END;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE e.ID IS NULL OR        EXTRACT(YEAR FROM e.Examination_Date) - EXTRACT(YEAR FROM p.First_Date) >= 1	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE strftime('%Y', e.Examination_Date) BETWEEN '1990' AND '1993'  AND strftime('%Y', p.Birthday) < '1990'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'M' AND Laboratory.`T-BIL` > '2.0'	thrombosis_prediction
SELECT Diagnosis  FROM Examination  WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'  GROUP BY Diagnosis  ORDER BY COUNT(*) DESC  LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR('1991-10-30') - YEAR(Patient.Birthday)) AS AverageAge FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT      CAST(DATE_PART('year', 'Examination Date') - DATE_PART('year', Birthday) AS INTEGER) AS Age,     Diagnosis FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      HGB = (SELECT MAX(HGB) FROM Examination);	thrombosis_prediction
SELECT `ANA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT      LAB.TBIL  FROM      Laboratory LAB  WHERE      LAB.ID = 2927464 AND      LAB.Date = '1995-09-04'	thrombosis_prediction
SELECT Patient.SEX  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Diagnosis = 'AORTITIS'  ORDER BY Examination.ID LIMIT 1;	thrombosis_prediction
SELECT T1.aCL_IgM  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T2.Diagnosis = 'SLE' AND T2.Description = '1994-02-19'  AND T1.Examination_Date = '1993-11-12'	thrombosis_prediction
SELECT `First Name`, `Last Name` FROM Patient WHERE SEX IN ('M', 'F') AND GPT = '9' AND Date = '1992-06-12';	thrombosis_prediction
SELECT      T2.Birthday - STRFTIME('%Y', T2.Description) AS age FROM      Laboratory AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID WHERE      T1.UA = '8.4' AND T1.Date = '1991-10-21'	thrombosis_prediction
SELECT COUNT(Laboratory.ID)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.Diagnosis = 'SJS' AND Patient.`First Date` = '1991-06-13' AND Laboratory.Date BETWEEN '1995-01-01' AND '1995-12-31'	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Date = '1997-01-27' AND Examination.Diagnosis = 'SLE' AND Patient.Description IS NULL;	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Examination.Date = '1993-09-27' AND ID IN (SELECT ID FROM Patient WHERE Birthday = '1959-03-01')	thrombosis_prediction
SELECT      (SUM(CASE WHEN Date LIKE '1981-11-%' THEN `T-CHO` END) - SUM(CASE WHEN Date LIKE '1981-12-%' THEN `T-CHO` END)) /      (SUM(CASE WHEN Date LIKE '1981-11-%' THEN `T-CHO` END) + SUM(CASE WHEN Date LIKE '1981-12-%' THEN `T-CHO` END)) * 100 AS Decrease_Rate FROM      Laboratory WHERE      Birthday = '1959-02-18';	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Diagnosis = 'Behcet\'s' AND strftime('%Y', p.Description) BETWEEN '1997' AND '1997';	thrombosis_prediction
SELECT T1.ID  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.Date BETWEEN '1987-07-06' AND '1996-01-31'  AND T2.GPT > 30  AND T2.ALB < 4	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM (     SELECT *      FROM Examination      WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (AVG(`aCL IgM`) * 1.2) ) AS Subquery	thrombosis_prediction
SELECT      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE `U-PRO` > 0 AND `U-PRO` < 30) AS percentage FROM      Patient WHERE      UA <= 6.5;	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Patient  WHERE      strftime('%Y', `First Date`) = '1981' AND      SEX = 'M'	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.`T-BIL` < 2.0	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE NOT (ANA_pattern = 'P') AND SEX = 'F' AND strftime('%Y', BIRTHDAY) BETWEEN '1980' AND '1989'	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'PSS' AND T2.CRP > 2 AND T2.CRE = 1 AND T2.LDH = 123;	thrombosis_prediction
SELECT AVG(T1.ALB)  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  JOIN Laboratory AS T3 ON T1.ID = T3.ID  WHERE T1.SEX = 'F' AND T3.PLT > 400 AND T2.Diagnosis = 'SLE'	thrombosis_prediction
SELECT MAX(T.Symptoms) AS MostCommonSign FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT `Description`, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE strftime('%Y', e.Examination_Date) = '1997' AND e.TP NOT BETWEEN 6 AND 8.5	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.Diagnosis LIKE '%ITP%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.Thrombosis = 1 AND T1.Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Patient  WHERE      YEAR(Birthday) = 1980 AND Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M'  AND strftime('%Y', e.`Examination Date`) BETWEEN '1995' AND '1997' AND e.Diagnosis = 'BEHCET' AND p.Admission = '-'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF('Examination Date', `First Date`) FROM Patient WHERE ID = 821298;	thrombosis_prediction
SELECT      Patient.ID,      Patient.SEX,      Laboratory.UA FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Patient.ID = 57266 AND      (Patient.SEX = 'M' AND Laboratory.UA > 8.0) OR      (Patient.SEX = 'F' AND Laboratory.UA > 6.5)	thrombosis_prediction
SELECT `Date` FROM Laboratory WHERE ID = 48473 AND GOT >= 60;	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GOT < 60 AND YEAR(Laboratory.Date) = 1994	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'M' AND EXISTS (     SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND GPT >= 60 )	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC	thrombosis_prediction
SELECT AVG(LDH)  FROM Laboratory  WHERE LDH < 500;	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH BETWEEN 600 AND 800	thrombosis_prediction
SELECT      p.ID,     p.Admission,     l.ALP FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.ALP < 300	thrombosis_prediction
SELECT ID FROM Patient WHERE Birthday = '1982-04-01' AND ALP < 300	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0;	thrombosis_prediction
SELECT      ID,      SUBTRACT(TP, 8.5) AS DeviationFromNormal FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Patient.SEX = 'F' AND TP > 8.5;	thrombosis_prediction
SELECT Patient.ID, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND (Laboratory.ALB <= 3.5 OR Laboratory.ALB >= 5.5) ORDER BY Patient.Birthday DESC;	thrombosis_prediction
SELECT p.ID, p.Birthday, l.ALB FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.Birthday) = '1982' AND l.ALB BETWEEN 3.5 AND 5.5	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT AVG(Laboratory.UA) AS Average_UA_Index FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX IN ('M', 'F') AND Patient.SEX = CASE WHEN Laboratory.UA < 8.0 THEN 'M' ELSE 'F' END AND Laboratory.UA <= CASE WHEN Patient.SEX = 'M' THEN 8.0 ELSE 6.5 END GROUP BY Laboratory.ID HAVING MAX(Laboratory.Date) IS NOT NULL	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P WHERE P.ID IN (     SELECT L.ID FROM Laboratory L WHERE L.UN = 29 )	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis = 'RA' AND E.UN < 30;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5	thrombosis_prediction
SELECT      (COUNT(CASE WHEN SEX = 'M' AND CRE >= 1.5 THEN 1 END) > COUNT(CASE WHEN SEX = 'F' AND CRE >= 1.5 THEN 1 END)) AS is_more_male FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE IS NOT NULL AND Laboratory.CRE >= 1.5	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID), CASE WHEN p.SEX = 'F' THEN 'Female' ELSE 'Male' END AS Sex FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` >= 2.0 GROUP BY Sex;	thrombosis_prediction
SELECT P.ID, L.`T-CHO` FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = (SELECT MIN(Birthday) FROM Patient) AND L.`T-CHO` = (SELECT MAX(`T-CHO`) FROM Laboratory);	thrombosis_prediction
SELECT AVG(TIMESTAMPDIFF(YEAR, Birthday, NOW())) AS AverageAge FROM Patient WHERE SEX = 'M' AND Laboratory.`T-CHO` >= 250;	thrombosis_prediction
SELECT P.ID, P.Diagnosis, LAB.TG FROM Patient P JOIN Laboratory LAB ON P.ID = LAB.ID WHERE LAB.TG > 300;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday) > 50	thrombosis_prediction
SELECT DISTINCT ID FROM Laboratory WHERE Admission = '-' AND CPK < 250;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE year(Birthday) BETWEEN '1936' AND '1956'  AND sex = 'M'  AND CPK >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250	thrombosis_prediction
SELECT Patient.ID, Laboratory.GLU FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE strftime('%Y', Patient.Description) >= '1991' AND Laboratory.GLU < 180;	thrombosis_prediction
SELECT      P.ID,      P.SEX,      P.Birthday,      DATEDIFF(CURRENT_DATE(), P.Birthday)/365 AS Age FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY      P.SEX ORDER BY      Age ASC;	thrombosis_prediction
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM P.Birthday)) AS Age  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE L.RBC < 3.5 AND E.Diagnosis IS NOT NULL	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Admission FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND (     EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) >= 50 ) AND (e.RBC <= 3.5 OR e.RBC >= 6.0)	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Admission = '-' AND E.Hemoglobin < 10	thrombosis_prediction
SELECT ID, SEX FROM Patient WHERE Diagnosis = 'SLE' AND HGB > 10 AND HGB < 17 ORDER BY Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT P.ID,         TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age  FROM Patient P  JOIN (     SELECT ID      FROM Laboratory      WHERE HCT >= 52      GROUP BY ID      HAVING COUNT(*) > 2 ) AS LabExceedNormal ON P.ID = LabExceedNormal.ID	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      (SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END)) AS difference FROM      Laboratory WHERE      PLT IS NOT NULL;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date LIKE '1984%' AND p.Birthday < DATE_TRUNC('year', CURRENT_DATE) - 50 AND l.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT      CAST(SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 1.0 / COUNT(*) * 100 AS Percentage FROM      Patient WHERE      EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM Birthday) > 55;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis = 0 AND Examination.Diagnosis IS NOT NULL AND strftime('%Y', Patient.`First Date`) > '1992' AND Examination.PT < 14	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE `Examination Date` > '1997-01-01' AND APTT >= 45;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.APTT IS NOT NULL AND Examination.APTT > 45 AND Patient.Thrombosis = 3 GROUP BY Examination.ID HAVING COUNT(Examination.ID) = 1	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M'  AND e.WBC BETWEEN 3.5 AND 9.0  AND l.FG NOT BETWEEN 150 AND 450	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Birthday > '1980-01-01' AND e.FG < 150 OR e.FG > 450	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` >= 30;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`U-PRO` BETWEEN 0 AND 30 AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.IGG < 900 AND Examination.Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.IGG BETWEEN 900 AND 2000 AND Examination.Symptoms IS NOT NULL	thrombosis_prediction
SELECT Diagnosis FROM (     SELECT Diagnosis, MAX(IGA) AS MaxIGA     FROM Examination     WHERE IGA BETWEEN 80 AND 500     GROUP BY Diagnosis     ORDER BY MaxIGA DESC     LIMIT 1 ) AS Subquery	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE IGA BETWEEN 80 AND 500  AND strftime('%Y', `First Date`) >= '1990'	thrombosis_prediction
SELECT Diagnosis  FROM Examination  WHERE `aCL IgM` NOT BETWEEN 40 AND 400  GROUP BY Diagnosis  ORDER BY COUNT(Diagnosis) DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE NOT (CRP LIKE '+' OR CRP LIKE '-' OR CRP < 1.0) AND Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE E.CRPT NOT IN ('+-', '-') AND E.CRPT >= 1.0 AND DATEDIFF(YEAR(CURRENT_DATE()), YEAR(P.Birthday)) < 18	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RA IN ('-', '+-') AND p.KCT = '+'	thrombosis_prediction
SELECT Diagnosis  FROM Patient  WHERE YEAR(Birthday) >= 1995 AND RA IN ('-', '+-')	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RF < 20 AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM Patient.Birthday) > 60;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE RF < 20 AND Patient.ID IN (SELECT ID FROM Examination WHERE Thrombosis = 0);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.ANA = 256 AND e.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT ID FROM Patient WHERE `HCT` NOT BETWEEN 29 AND 52 ORDER BY `aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 1 AND e.C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RNP = '-' OR e.RNP = '+-' AND p.Admission = '+';	thrombosis_prediction
SELECT MAX(`Birthday`) FROM `Patient` WHERE `Patient.ID` = (SELECT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.RNP` NOT IN ('-', '+-'))	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.SM IN ('-', '+-') AND e.SM != '1' AND p.Thrombosis = '1'	thrombosis_prediction
SELECT Patient.ID  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.SM NOT IN ('-', '+')  ORDER BY Patient.Birthday DESC  LIMIT 3	thrombosis_prediction
SELECT Examination.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Examination_Date >= '1997-01-01' AND Examination.SC170 IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Symptoms LIKE '%vertigo%' AND p.SEX = 'M' AND p.Diagnosis = 'SC170' AND e.Diagnosis IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`ANA Pattern` LIKE '%SSA%' AND p.`First Date` < '1990-01-01'	thrombosis_prediction
SELECT ID FROM Patient WHERE `First Date` = (SELECT `First Date` FROM Patient ORDER BY `First Date` ASC LIMIT 1) AND SSA NOT IN ('-', '+') LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`ANA Pattern` LIKE '%S%' AND p.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`SSB` IN ('-', '+-') AND e.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.`DNA-II` IN ('-', '+-')  AND Laboratory.SSB IN ('-', '+-')  AND Patient.SEX = 'M'	thrombosis_prediction
SELECT Diagnosis  FROM Patient  WHERE ID IN (     SELECT ID      FROM Examination      WHERE `DNA-II` >= 8 )	thrombosis_prediction
SELECT COUNT(DISTINCT ID)  FROM Patient  WHERE Diagnosis = 'normal anti-DNA level' AND Description IS NULL	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE `DNA-II` >= 8 AND Admission = '+'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN L.GOT >= 60 AND P.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'M' AND Examination.GOT < 60;	thrombosis_prediction
SELECT MAX(Birthday) FROM Patient WHERE ID IN (     SELECT L.ID     FROM Laboratory AS L     WHERE L.GOT >= 60 )	thrombosis_prediction
SELECT      Birthday FROM      Patient JOIN      (         SELECT              ID,             MAX(CASE WHEN GPT < 60 THEN GPT ELSE NULL END) AS MaxGPT         FROM              Laboratory         GROUP BY              ID     ) AS LabResults ON Patient.ID = LabResults.ID WHERE      LabResults.MaxGPT IS NOT NULL GROUP BY      Patient.Birthday ORDER BY      COUNT(*) DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE ID IN (     SELECT ID FROM Laboratory WHERE GOT < 60 ) AND SEX = 'M'	thrombosis_prediction
SELECT T2.Birthday FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T2.LDH DESC LIMIT 1;	thrombosis_prediction
SELECT Lab.Date FROM Laboratory AS Lab WHERE Lab.ID = (SELECT MAX(ID) FROM Patient) AND Lab.LDH >= 500;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.ALP >= 300 AND Patient.Admission = '+'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Admission = '-' AND e.ALP < 300;	thrombosis_prediction
SELECT Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE p.Diagnosis = 'SJS' AND e.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT Examination.Date FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.ALB > 3.5 AND Laboratory.ALB < 5.5 ORDER BY Laboratory.ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE Sex = 'M'  AND ALB > 3.5  AND ALB < 5.5  AND TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT MAX(`aCL IgG`) FROM Examination WHERE `Sex` = 'F' AND ID IN (     SELECT ID FROM Laboratory WHERE UA > 6.50 AND UA IS NOT NULL )	thrombosis_prediction
SELECT MAX(ANA)  FROM Examination  WHERE CRE < 1.5	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5 AND T2.`aCL IgA` = (     SELECT MAX(`aCL IgA`) FROM Examination )	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.`T-BIL` >= 2.0 AND l.ANA LIKE '%P%'	thrombosis_prediction
SELECT T1.ANA  FROM Examination AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.`T-BIL` < 2.0 AND T2.`T-BIL` IS NOT NULL  AND T1.ID = (SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 GROUP BY T1.ID ORDER BY MAX(T2.`T-BIL`) DESC LIMIT 1)	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.`T-CHO` >= 250 AND Laboratory.KCT = '-'	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.ANA LIKE '%P%' AND Patient.`T-CHO` < 250	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.TG < 200 AND e.Symptoms IS NOT NULL	thrombosis_prediction
SELECT Diagnosis FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG < 200 ORDER BY TG DESC LIMIT 1)	thrombosis_prediction
SELECT ID  FROM Patient  WHERE Thrombosis = 0 AND EXISTS (     SELECT 1      FROM Laboratory      WHERE Patient.ID = Laboratory.ID AND CPK < 250 )	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON e.ID = l.ID  WHERE l.CPK < 250 AND        (l.KCT = '+' OR l.RVVT = '+' OR l.LAC = '+')	thrombosis_prediction
SELECT Birthday FROM Patient WHERE ID = (SELECT ID FROM Patient WHERE GLU > 180 ORDER BY Birthday ASC LIMIT 1)	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Thrombosis = 0 AND Patient.GLU < 180	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE Admission = '+' AND `WBC` BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.Diagnosis = 'SLE' AND Examination.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0 AND Patient.Admission = '-'	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 0 AND p.Diagnosis IS NOT NULL	thrombosis_prediction
SELECT P.ID, P.Birthday, L.PLT FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.PLT BETWEEN 100 AND 400 AND P.Diagnosis = 'MCTD'	thrombosis_prediction
SELECT AVG(T1.PT)  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T1.SEX = 'M' AND T2.Thrombosis = 0 AND T2.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.Thrombosis IN (2, 1) AND Patient.Diagnosis LIKE '%severe thrombosis%' AND Examination.Diagnosis IS NOT NULL AND Examination.Diagnosis LIKE '%normal prothrombin time%' AND Patient.Diagnosis LIKE '%normal prothrombin time%' AND Examination.PT < 14;	thrombosis_prediction
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Engineering');	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'Art and Design Department';	student_club
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer'	student_club
SELECT T3.phone FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event JOIN `member` AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer'	student_club
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  WHERE attendance.link_to_event = 'rec2N69DMcrqN9PJC' AND member.t_shirt_size = 'Medium'	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id GROUP BY event.event_id ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT c.college  FROM member m  JOIN student_club_position scp ON m.member_id = scp.member_id  JOIN college c ON scp.college_id = c.college_id  WHERE scp.position = 'Vice President';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(*)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE e.event_date LIKE '2019-%' AND m.first_name = 'Sacha' AND m.last_name = 'Harrison'	student_club
SELECT COUNT(*)  FROM (     SELECT event_id     FROM attendance     GROUP BY event_id     HAVING COUNT(*) > 10 ) AS attended_events JOIN event ON event.event_id = attended_events.event_id WHERE event.type = 'Meeting'	student_club
SELECT event_name  FROM event  JOIN (     SELECT link_to_event      FROM attendance      GROUP BY link_to_event      HAVING COUNT(*) > 20 ) AS attendance_counts ON event.event_id = attendance_counts.link_to_event;	student_club
SELECT AVG(T1.event_id) / COUNT(DISTINCT T1.event_name) AS AverageAttendance FROM event T1 JOIN attendance T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND STRFTIME('%Y', T1.event_date) = '2020';	student_club
SELECT expense_description  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.event_status = 'Closed'  ORDER BY cost DESC  LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud';	student_club
SELECT T1.last_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT `county` FROM `zip_code` WHERE `zip_code` = (SELECT `zip` FROM `member` WHERE `member_id` = 'recCRWMfFqifuKMc6')	student_club
SELECT college FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE first_name = 'Tyler' AND last_name = 'Hewitt')	student_club
SELECT SUM(amount) FROM budget WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President') AND approved = 'true';	student_club
SELECT SUM(T2.spent) AS TotalSpentOnFood FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Food';	student_club
SELECT T3.city, T3.state FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders' AND T2.major_name = 'Student_Club'	student_club
SELECT member.first_name, member.last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'IL' AND member.position = 'Student_Club';	student_club
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement' AND T2.event_name = 'September Meeting' AND T2.type = 'Meeting' AND T2.status = 'Open'	student_club
SELECT `department` FROM major WHERE major_id IN (     SELECT link_to_major     FROM member     WHERE first_name = 'Pierce' OR first_name = 'Guidi' );	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'October Speaker'	student_club
SELECT e.expense_id, e.expense_description, e.approved  FROM expense e JOIN event ev ON e.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08' AND e.approved IS NOT NULL	student_club
SELECT AVG(cost) AS average_cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Elijah' AND member.last_name = 'Allen' AND MONTH(expense.expense_date) IN (9, 10)	student_club
SELECT      (         (SELECT SUM(spent) FROM budget WHERE event_status = 'Closed' AND YEAR(event_date) = 2019)         -         (SELECT SUM(spent) FROM budget WHERE event_status = 'Closed' AND YEAR(event_date) = 2020)     ) AS "Total_Spent_Difference_2019_vs_2020"	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND event_date = '2019-09-04';	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(DISTINCT major_id) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT T3.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*)  FROM budget  WHERE link_to_event IN (     SELECT event_id      FROM event      WHERE event_name = 'November Meeting' ) AND remaining < 0;	student_club
SELECT SUM(amount)  FROM budget  WHERE link_to_event = 'recI43CzsZ0Q625ma';	student_club
SELECT T1.event_status FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20'	student_club
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE first_name = 'Brent' AND last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Human Development and Family Studies' AND member.t_shirt_size = 'Large';	student_club
SELECT T3.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielsen' AND T3.major_name = 'Outdoor Product Design and Development';	student_club
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President';	student_club
SELECT T3.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN member AS T4 ON T4.member_id = 'recZ4PkGERzl9ziHO' WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison' AND T4.first_name = 'Sacha' AND T4.last_name = 'Harrison'	student_club
SELECT T2.department  FROM `attendance` AS T1  JOIN `member` AS T2 ON T1.link_to_member = T2.member_id  WHERE T2.position = 'President';	student_club
SELECT date_received  FROM income  WHERE source = 'Dues' AND link_to_member = 'rec3pH4DxMcWHMRB7'	student_club
SELECT first_name, last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE source = 'Dues' ORDER BY date_received ASC LIMIT 1;	student_club
SELECT      SUM(CASE WHEN e.event_name = 'Yearly Kickoff' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END) AS Advertisement_Yearly_Kickoff,     SUM(CASE WHEN e.event_name = 'October Meeting' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END) AS Advertisement_October_Meeting FROM      event e JOIN      budget b ON e.event_id = b.link_to_event	student_club
SELECT      (SUM(amount WHERE category = 'Parking' AND event_name = 'November Speaker') /       (SELECT SUM(amount) FROM budget WHERE event_name = 'November Speaker')) * 100 AS percentage FROM      budget;	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT expense_description  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.remaining = (SELECT MIN(remaining) FROM budget)	student_club
SELECT T3.first_name, T3.last_name  FROM event AS T1  JOIN attendance AS T2 ON T1.event_id = T2.link_to_event  JOIN member AS T3 ON T2.link_to_member = T3.member_id  WHERE T1.event_name = 'October Meeting';	student_club
SELECT college  FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY college ORDER BY COUNT(*) DESC LIMIT 1;	student_club
SELECT T3.major_name  FROM member AS T1  JOIN zip_code AS T2 ON T1.zip = T2.zip_code  JOIN major AS T3 ON T1.link_to_major = T3.major_id  WHERE T1.phone = '809-555-3360'	student_club
SELECT event_name FROM event WHERE event_id = (SELECT link_to_event FROM budget WHERE amount = (SELECT MAX(amount) FROM budget))	student_club
SELECT e.expense_description  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.position = 'Vice President';	student_club
SELECT COUNT(*) FROM `attendance` WHERE `link_to_event` = 'rec2N69DMcrqN9PJC';	student_club
SELECT date_received FROM income WHERE member_id = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason')	student_club
SELECT COUNT(*) FROM zip_code WHERE state = 'MD';	student_club
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  WHERE member.phone = '954-555-6240'	student_club
SELECT `first_name`, `last_name` FROM `member` WHERE `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `department` = 'School of Applied Sciences, Technology and Education')	student_club
SELECT      e.event_name FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      e.status = 'Closed' ORDER BY      DIVIDE(b.spent, b.amount) DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020';	student_club
SELECT SUM(spent)  FROM budget  WHERE category = 'Food'	student_club
SELECT T2.first_name, T2.last_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T1.link_to_member HAVING COUNT(T1.link_to_event) > 7;	student_club
SELECT DISTINCT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT `first_name`, `last_name` FROM `member` JOIN `zip_code` ON `member`.zip = `zip_code`.zip_code WHERE `city` = 'Georgetown' AND `state` = 'SC';	student_club
SELECT COUNT(*)  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour'	student_club
SELECT first_name, last_name FROM member WHERE member_id IN (     SELECT link_to_member FROM income WHERE amount > 40 )	student_club
SELECT SUM(cost) AS TotalExpense FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.category = 'Baseball game';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount)  FROM member m  JOIN income i ON m.member_id = i.link_to_member  GROUP BY m.member_id  ORDER BY MAX(i.amount) DESC  LIMIT 1;	student_club
SELECT event_name FROM (     SELECT event_name, MIN(cost) AS min_cost FROM event e     JOIN expense exp ON e.event_id = exp.link_to_event ) AS subquery WHERE min_cost = (     SELECT MIN(cost) FROM expense );	student_club
SELECT      (SUM(cost WHERE event_name = 'Yearly Kickoff') /      (SELECT SUM(cost) FROM expense)) * 100 AS percentage_cost_yearly_kickoff	student_club
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major	student_club
SELECT source, MAX(amount) AS max_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY max_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching';	student_club
SELECT COUNT(DISTINCT link_to_member)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater' AND STRFTIME('%Y', event.event_date) = '2019';	student_club
SELECT COUNT(*) AS num_events_attended FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Luisa' AND last_name = 'Guidi')	student_club
SELECT AVG(b.remaining)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.status = 'Closed' AND b.category = 'Food'	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer') AND link_to_member = (SELECT member_id FROM member WHERE first_name = 'Maya' AND last_name = 'Mclean');	student_club
SELECT      CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) AS percentage_share FROM      event WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT expense.cost  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.category = 'Posters' AND expense.expense_description = 'Posters' AND budget.event_status = 'Closed';	student_club
SELECT t_shirt_size  FROM member  GROUP BY t_shirt_size  ORDER BY COUNT(*) DESC  LIMIT 1;	student_club
SELECT T1.event_name  FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1	student_club
SELECT b.category, SUM(e.cost) AS total_value FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND e.approved = 'true' GROUP BY b.category;	student_club
SELECT category  FROM budget  WHERE link_to_event = 'recI43CzsZ0Q625ma'  ORDER BY amount ASC;	student_club
SELECT budget_id, category, amount  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;	student_club
SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_date = '2019-08-20'	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT expense_description FROM expense WHERE link_to_member = 'recdIBgeU38UbV2sy'	student_club
SELECT expense_description  FROM expense  JOIN member ON expense.link_to_member = member.member_id  WHERE member.t_shirt_size = 'X-Large';	student_club
SELECT z.short_state  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost < 50	student_club
SELECT T.major_name FROM `member` AS T1 JOIN `major` AS T ON T1.link_to_major = T.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'	student_club
SELECT T1.position  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T2.major_name = 'Business'	student_club
SELECT COUNT(*)  FROM member  WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business')  AND t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30	student_club
SELECT `type` FROM event WHERE `location` = 'MU 215';	student_club
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00'	student_club
SELECT m.major_name  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Vice' AND mem.last_name = 'President' AND mem.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN position = 'Member' AND major_name = 'Mathematics' THEN 1 ELSE 0 END)      / CAST(COUNT(member_id) AS REAL)) * 100 AS percentage_members_mathematics FROM      member  JOIN      major ON member.link_to_major = major.major_id;	student_club
SELECT event.category  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.location = 'MU 215'	student_club
SELECT COUNT(*)  FROM income  WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT T1.last_name, T2.major_name, T2.department, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT T1.city, T1.state FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip JOIN major AS T3 ON T3.major_id = T2.link_to_major WHERE T3.department = 'Electrical and Computer Engineering Department' AND T2.position = 'Member';	student_club
SELECT ev.event_name FROM event ev JOIN attendance a ON ev.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN zip_code zc ON m.zip = zc.zip_code WHERE m.position = 'Vice President' AND ev.type = 'Social' AND zc.location = '900 E. Washington St.';	student_club
SELECT T1.last_name, T1.position  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.expense_description = 'Pizza' AND T2.expense_date = '2019-09-10';	student_club
SELECT T1.last_name  FROM member AS T1  JOIN attendance AS T2 ON T1.member_id = T2.link_to_member  JOIN event AS T3 ON T2.link_to_event = T3.event_id  WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Member'	student_club
SELECT      CAST(SUM(CASE WHEN amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      income JOIN      member ON income.link_to_member = member.member_id WHERE      member.t_shirt_size = 'Medium' AND member.position = 'Member'	student_club
SELECT DISTINCT T2.state FROM zip_code AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.type = 'PO Box'	student_club
SELECT DISTINCT z.zip_code FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE z.city = 'San Juan' AND z.county = 'San Juan Municipio' AND z.state = 'Puerto Rico' AND z.type = 'PO Box'	student_club
SELECT event_name  FROM event  WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT T1.link_to_event FROM `attendance` AS T1 JOIN `expense` AS T2 ON T1.link_to_event = T2.link_to_budget WHERE T2.cost > 50	student_club
SELECT T1.first_name, T1.last_name, T2.link_to_event  FROM member AS T1  JOIN (     SELECT T3.link_to_member      FROM expense AS T3      WHERE T3.approved = 'true' AND T3.expense_date BETWEEN '2019-01-10' AND '2019-11-19' ) AS T2 ON T1.member_id = T2.link_to_member	student_club
SELECT T3.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Katy' AND T2.major_id = 'rec1N0upiVLy5esTO'	student_club
SELECT T1.phone FROM `member` AS T1 INNER JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business'	student_club
SELECT DISTINCT income.notes, member.email  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE income.date_received BETWEEN '2019-09-10' AND '2019-11-19'  AND income.amount > 20;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'education' AND member.position = 'Member';	student_club
SELECT      CAST(SUM(CASE WHEN `remaining` < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) AS percentage_over_budget FROM      budget WHERE      event_status = 'Closed';	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description  FROM expense  WHERE (SUM(cost) / COUNT(expense_id)) > 50	student_club
SELECT first_name, last_name  FROM member  WHERE t_shirt_size = 'X-Large';	student_club
SELECT      CAST(SUM(CASE WHEN zip_code.type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code.zip_code) AS percentage_po_boxes FROM      zip_code;	student_club
SELECT event.event_name, event.location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0;	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100	student_club
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100	student_club
SELECT T1.city, T1.country  FROM zip_code AS T1  JOIN attendance AS T2 ON T1.zip_code = SUBSTR(T2.link_to_event, 3, 5)  JOIN event AS T3 ON T2.link_to_event = T3.event_id  WHERE T3.amount > 40  GROUP BY T1.zip_code;	student_club
SELECT T1.first_name, T1.last_name, SUM(T2.cost) AS total_expense FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(T2.expense_id) > 1 ORDER BY total_expense DESC LIMIT 1;	student_club
SELECT AVG(cost)  FROM expense  WHERE link_to_member IN (     SELECT member_id      FROM member      WHERE position != 'Member' )	student_club
SELECT event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Parking' AND budget.cost < (SELECT AVG(cost) FROM budget WHERE category = 'Parking')	student_club
SELECT      (SUM(cost) OVER () * 100 / COUNT(event_id) OVER ()) AS percentage FROM      event WHERE      type = 'Game';	student_club
SELECT b.budget_id, b.category, MAX(e.cost) AS max_cost FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' GROUP BY b.budget_id, b.category ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name  FROM member m JOIN (     SELECT link_to_member, SUM(cost) AS total_spent     FROM expense     GROUP BY link_to_member     ORDER BY total_spent DESC     LIMIT 5 ) e ON m.member_id = e.link_to_member	student_club
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      (SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END) * 1.0 / COUNT(CASE WHEN position = 'Member' THEN 1 END) -      SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) * 1.0 / COUNT(CASE WHEN position = 'Member' THEN 1 END)) * 100 AS percentage_difference FROM member JOIN zip_code ON member.zip = zip_code.zip_code	student_club
SELECT major_name, department FROM major WHERE major_id = (SELECT link_to_major FROM member WHERE first_name = 'Garrett' AND last_name = 'Gerke')	student_club
SELECT T1.first_name, T1.last_name, T2.cost FROM `member` AS T1  JOIN `expense` AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T1.last_name, T1.phone  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T2.major_name = 'Elementary Education'	student_club
SELECT category, amount FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'January Speaker') AND event_status = 'Closed';	student_club
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09'	student_club
SELECT budget.category  FROM budget  JOIN expense ON budget.budget_id = expense.link_to_budget  WHERE expense.expense_description = 'Posters';	student_club
SELECT T1.first_name, T1.last_name, T3.college  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  JOIN zip_code AS T3 ON T1.zip = T3.zip_code  WHERE T1.position = 'Secretary'	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT `city` FROM `member` WHERE `first_name` = 'Garrett' AND `last_name` = 'Girke';	student_club
SELECT first_name, last_name, position FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE city = 'Lincolnton' AND state = 'North Carolina';	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT      CAST(SUM(CASE WHEN `Currency` = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN `Currency` = 'CZK' THEN 1 ELSE 0 END) AS ratio FROM      customers WHERE      `Currency` IN ('EUR', 'CZK');	debit_card_specializing
SELECT c.CustomerID, c.Segment, SUM(ym.Consumption) as TotalConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID AND STRFTIME('%Y', ym.Date) = '2012' WHERE c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(y.Consumption) / 12 AS AvgMonthlyConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND strftime('%Y', y.Date) = '2013' GROUP BY strftime('%Y', y.Date), y.CustomerID ORDER BY y.CustomerID, y.Date;	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID, c.Segment, c.Currency ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT CustomerID)  FROM yearmonth  WHERE CustomerID IN (     SELECT CustomerID      FROM customers      WHERE Segment = 'KAM' ) AND Consumption < 30000 AND Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT      SUM(CASE WHEN T2.Currency = 'CZK' THEN T1.Consumption ELSE 0 END) - SUM(CASE WHEN T2.Currency = 'EUR' THEN T1.Consumption ELSE 0 END) AS ConsumptionDifference FROM      yearmonth AS T1 JOIN      customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE      STRFTIME('%Y', T1.Date) = '2012'	debit_card_specializing
SELECT strftime('%Y', Date) AS Year, SUM(Consumption) AS TotalGasUse FROM yearmonth WHERE Currency = 'EUR' GROUP BY Year ORDER BY TotalGasUse DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT `Year` = LEFT(Date, 4), MAX(Consumption)  FROM yearmonth  WHERE `Currency` = 'CZK'  GROUP BY `Year`  ORDER BY SUM(Consumption) DESC  LIMIT 1;	debit_card_specializing
SELECT Date  FROM yearmonth  WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date LIKE '2013%'  ORDER BY Consumption DESC  LIMIT 1;	debit_card_specializing
WITH  LeastConsumptionPerSegment AS (     SELECT          Segment,         AVG(Consumption) AS AnnualAverageConsumption     FROM          yearmonth     WHERE          Date BETWEEN '201301' AND '201312'     GROUP BY          Segment ), LeastConsumptionValues AS (     SELECT          Segment,         MIN(AnnualAverageConsumption) AS MinAnnualAverageConsumption     FROM          LeastConsumptionPerSegment ), DifferenceInConsumption AS (     SELECT          'SME' AS Segment1,         'LAM' AS Segment2,         AVG(t1.MinAnnualAverageConsumption - t2.MinAnnualAverageConsumption) AS Difference     FROM          LeastConsumptionValues t1,         LeastConsumptionValues t2     WHERE          t1.Segment = 'SME' AND         t2.Segment = 'LAM' ), SecondQuery AS (     SELECT          'LAM' AS Segment1,         'KAM' AS Segment2,         AVG(t1.MinAnnualAverageConsumption - t2.MinAnnualAverageConsumption) AS Difference     FROM          LeastConsumptionValues t1,         LeastConsumptionValues t2     WHERE          t1.Segment = 'LAM' AND         t2.Segment = 'KAM' ), ThirdQuery AS (     SELECT          'KAM' AS Segment1,         'SME' AS Segment2,         AVG(t1.MinAnnualAverageConsumption - t2.MinAnnualAverageConsumption) AS Difference     FROM          LeastConsumptionValues t1,         LeastConsumptionValues t2     WHERE          t1.Segment = 'KAM' AND         t2.Segment = 'SME' ) SELECT      * FROM DifferenceInConsumption UNION ALL SELECT * FROM SecondQuery UNION ALL SELECT * FROM ThirdQuery;	debit_card_specializing
SELECT      c.Segment,     MAX((ym.Consumption_2013 - ym.Consumption_2012) / ym.Consumption_2013 * 100) AS Max_Percentage_Increase,     MIN((ym.Consumption_2013 - ym.Consumption_2012) / ym.Consumption_2013 * 100) AS Min_Percentage_Increase FROM      customers c JOIN      (SELECT          ym.CustomerID,         SUM(CASE WHEN STRFTIME('%Y', ym.Date) = '2012' THEN ym.Consumption ELSE 0 END) AS Consumption_2012,         SUM(CASE WHEN STRFTIME('%Y', ym.Date) = '2013' THEN ym.Consumption ELSE 0 END) AS Consumption_2013     FROM          yearmonth ym     GROUP BY          ym.CustomerID) ym ON c.CustomerID = ym.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      c.Segment ORDER BY      Max_Percentage_Increase DESC, Min_Percentage_Increase ASC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT      COUNT(*)  FROM      gasstations  WHERE      Country = 'CZE' AND Segment = 'Discount';	debit_card_specializing
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS ConsumptionDifference;	debit_card_specializing
SELECT      SUM(CASE WHEN `Currency` = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN `Currency` = 'EUR' THEN 1 ELSE 0 END) AS difference FROM      customers WHERE      Segment = 'SME';	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT T1.CustomerID, SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T1.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  WHERE Date = '201305' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM')	debit_card_specializing
SELECT      (COUNT(*) FILTER (WHERE `Consumption` > 46.73 AND Segment = 'LAM') * 100.0 / COUNT(*) FILTER (WHERE Segment = 'LAM')) AS percentage FROM      yearmonth;	debit_card_specializing
SELECT T2.Country, COUNT(T1.GasStationID) AS CountValueForMoneyGasStations FROM gasstations AS T1 JOIN (     SELECT ChainID     FROM gasstations     WHERE Segment = 'Value for money' ) AS T2 ON T1.ChainID = T2.ChainID GROUP BY T2.Country;	debit_card_specializing
SELECT      COUNT(*) FILTER (WHERE customers.Segment = 'KAM' AND customers.Currency = 'EUR') * 100.0 /      COUNT(*) FILTER (WHERE customers.Segment = 'KAM') AS percentage FROM      customers JOIN      transactions_1k ON customers.CustomerID = transactions_1k.CustomerID	debit_card_specializing
SELECT      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM yearmonth WHERE Date LIKE '201202')  FROM      yearmonth  WHERE      Date LIKE '201202' AND Consumption > 528.29999999999995453;	debit_card_specializing
SELECT      CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      gasstations  WHERE      Country = 'SVK'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN (     SELECT ym.CustomerID, SUM(ym.Consumption) as total_consumption     FROM yearmonth ym     WHERE ym.Date = '201309'     GROUP BY ym.CustomerID ) t ON c.CustomerID = t.CustomerID ORDER BY t.total_consumption ASC LIMIT 1;	debit_card_specializing
SELECT T1.CustomerID, T1.Segment, SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T2.Date = '201206' WHERE T1.Segment = 'SME' GROUP BY T1.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption)  FROM yearmonth  WHERE Date LIKE '2012%'	debit_card_specializing
SELECT MAX(TY.Consumption * 12) AS MaxAnnualConsumption FROM yearmonth AS YM JOIN customers AS C ON YM.CustomerID = C.CustomerID WHERE C.Currency = 'EUR'	debit_card_specializing
SELECT T3.Description FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T3.ProductID = T1.ProductID WHERE T1.Date = '201309'	debit_card_specializing
SELECT T2.Country  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID AND T1.Date = T3.Date  WHERE T3.Date LIKE '201306'	debit_card_specializing
SELECT T2.ChainID, T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Price > 0 AND T1.Currency = 'EUR'	debit_card_specializing
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Price > 0 AND ROUND(T2.Price, 2) * 1 == T2.Amount AND T2.Currency = 'EUR'	debit_card_specializing
SELECT AVG(`Price`)  FROM transactions_1k  WHERE `Date` LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT T1.CustomerID)  FROM `transactions_1k` AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Currency = 'EUR' AND T1.Consumption > 1000	debit_card_specializing
SELECT T1.Description  FROM products AS T1  JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID  JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID  WHERE T3.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.ChainID = 11	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t1k  JOIN gasstations g ON t1k.GasStationID = g.GasStationID  WHERE g.Country = 'CZE' AND t1k.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE';	debit_card_specializing
SELECT AVG(T1.Amount) AS AverageTotalPrice FROM transactions_1k T1 JOIN customers T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT t1.CustomerID FROM transactions_1k AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID AND SUBSTR(t1.Date, 1, 10) = '2012-08-25' WHERE t1.Date = '2012-08-25' ORDER BY t1.Amount DESC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' AND T1.CustomerID IN (     SELECT T3.CustomerID     FROM transactions_1k AS T3     WHERE T3.Date = '2012-08-24' ) AND NOT EXISTS (     SELECT 1     FROM transactions_1k AS T4     WHERE T4.Date > '2012-08-25' AND T4.CustomerID = T1.CustomerID );	debit_card_specializing
SELECT T1.Currency  FROM customers AS T1  JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Price <> 0 AND Price IS NOT NULL AND Currency = 'EUR';	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)	debit_card_specializing
SELECT T2.Country  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT ym.Consumption, tr.Amount  FROM yearmonth ym  JOIN transactions_1k tr ON ym.CustomerID = tr.CustomerID AND ym.Date = '2012-08-24'  WHERE tr.Amount = 124.05  JOIN customers c ON ym.CustomerID = c.CustomerID  WHERE c.Date LIKE '2012-01-%'	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE Date = '2012-08-26' AND Time BETWEEN '08:00:00' AND '09:00:00' AND Country = 'CZE'	debit_card_specializing
SELECT T2.Currency  FROM transactions_1k AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID AND T3.Date LIKE '201306%'  WHERE T1.Amount * T3.Consumption = 214582.17  GROUP BY T2.CustomerID  HAVING COUNT(T1.TransactionID) = 1;	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467;	debit_card_specializing
SELECT T1.Currency  FROM customers AS T1  JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Date = '2012-08-24' AND T2.Amount = 548.4	debit_card_specializing
SELECT      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers) AS percentage FROM      customers JOIN      transactions_1k ON customers.CustomerID = transactions_1k.CustomerID WHERE      Date = '2012-08-25' AND      Currency = 'EUR';	debit_card_specializing
SELECT      (y2012.consumption - y2013.consumption) / y2012.consumption AS consumption_decrease_rate FROM     (SELECT          CustomerID, SUM(Price) AS consumption      FROM          transactions_1k      WHERE          Date = '2012-08-24'      GROUP BY          CustomerID) y2012,     (SELECT          CustomerID, SUM(Consumption) AS consumption      FROM          yearmonth      WHERE          Date BETWEEN '2012-08-24' AND '2013-08-24'      GROUP BY          CustomerID) y2013 WHERE      y2012.CustomerID = y2013.CustomerID AND y2012.consumption = 634.8 LIMIT 1;	debit_card_specializing
SELECT T2.GasStationID, SUM(T1.Amount * T1.Price) AS TotalRevenue FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T2.GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS premium_percentage FROM      gasstations WHERE      Country = 'SVK';	debit_card_specializing
SELECT SUM(Amount) AS January_2012_Spent FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '201201%';  SELECT SUM(Amount) AS Total_Spent FROM transactions_1k WHERE CustomerID = 38508;	debit_card_specializing
SELECT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  GROUP BY p.Description  ORDER BY SUM(t.Amount) DESC  LIMIT 5;	debit_card_specializing
SELECT c.Currency, SUM(t.Amount / t.Price) AS AveragePricePerItem, c.Segment FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency, c.Segment ORDER BY SUM(t.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1	debit_card_specializing
SELECT ym.Consumption FROM yearmonth ym JOIN transactions_1k t ON ym.CustomerID = t.CustomerID AND ym.Date = SUBSTR(t.Date, 1, 6) AND t.ProductID = 5 AND t.Price / t.Amount > 29.00;	debit_card_specializing
