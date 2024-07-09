 SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS Highest_Eligible_Free_Rate_K_12 FROM frpm WHERE `County Name` = 'Alameda' 
SELECT      CDSCode,      `School Name`,      `District Name`,      `County Name`,      `Educational Option Type`,      `NSLP Provision Status`,      `Charter School (Y/N)`,      `Charter School Number`,      `Charter Funding Type`,      `Low Grade`,      `High Grade`,      `Enrollment (Ages 5-17)`,      `Free Meal Count (Ages 5-17)`,      `Percent (%) Eligible Free (Ages 5-17)`,      `FRPM Count (Ages 5-17)`,      `Percent (%) Eligible FRPM (Ages 5-17)` FROM      frpm WHERE      `Educational Option Type` = 'Continuation' ORDER BY      `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3; 
SELECT `Zip` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `Charter School (Y/N)` = 1 AND `County Name` = 'Fresno';
 SELECT     `MailStreet`, `MailStrAbr`, `MailCity`, `MailState`, `MailZip` FROM     schools WHERE     `CDSCode` IN (         SELECT             CDSCode         FROM             frpm         WHERE             `FRPM Count (K-12)` = (                 SELECT                     MAX(`FRPM Count (K-12)`)                 FROM                     frpm             )     ); 
SELECT T1.Phone FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter = 1 AND T2.2013_14_CALPADS_Fall_1_Certification_Status = 1 AND T1.OpenDate > '2000-01-01'
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrMath < 400 AND schools.Virtual = 'F' 
SELECT `School` FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.enroll12 > 500 AND schools.Magnet = 1;
 SELECT T2.Phone  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.AvgScrRead > 1500 AND T1.AvgScrMath > 1500 AND T1.AvgScrWrite > 1500  ORDER BY T1.NumTstTakr DESC  LIMIT 1; 
 SELECT COUNT(*)  FROM satscores ss JOIN frpm fp ON ss.cds = fp.CDSCode WHERE fp.FRPM_Count_(K-12) = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm) 
SELECT COUNT(*)  FROM satscores ss  JOIN schools sc ON ss.cds = sc.CDSCode  WHERE ss.AvgScrMath > 560 AND sc.FundingType = 'Directly funded' 
 SELECT T1.FRPM_Count_Ages_5_17 FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores) 
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500 
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) AS Highest_Free_Rate FROM frpm WHERE `Percent (%) Eligible FRPM (Ages 5-17)` > 0.3 
 SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL AND T1.NumTstTakr > 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3 
 SELECT T2.NCESSchool, COUNT(T2.Enrollment) AS Enrollment_Ages_5_to_17 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Age Range` = 'Ages 5-17' GROUP BY T2.NCESSchool ORDER BY Enrollment_Ages_5_to_17 DESC LIMIT 5 
SELECT s.Name AS District_Name, AVG(ss.AvgScrRead) AS Average_Score_Reading FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.CDSCode, s.Name ORDER BY Average_Score_Reading DESC LIMIT 1;
SELECT COUNT(*)  FROM schools  WHERE CDSCode IN (SELECT cds FROM satscores WHERE NumTstTakr < 100) 
SELECT T2.CDSCode, T2.CharterNum FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite = 499;
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.County = 'Contra Costa'  AND frpm.CharterFundingType = 'Directly funded'  AND frpm.NumTstTakr <= 250;
 SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1 
 SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.County = 'Amador' AND frpm.LowGrade = '9' AND frpm.HighGrade = '12' 
 SELECT COUNT(*)  FROM (     SELECT *      FROM frpm      WHERE `Academic Year` = '2014-2015' AND `County Name` = 'Los Angeles'      AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700 ) AS filtered_schools 
SELECT s.name AS school_name, COUNT(st.taker_id) AS num_test_takers FROM schools s JOIN students st ON s.cdscd = st.school_code WHERE s.county = 'Contra Costa' GROUP BY s.cdscd, s.name ORDER BY num_test_takers DESC LIMIT 1;
SELECT      `School Name`,     `Address`  FROM      (     SELECT          `School Name`,         `Address`,         `Enrollment (K-12)` - `Enrollment (Ages 5-17)` AS enrollment_diff     FROM          schools      JOIN          frpm ON schools.CDSCode = frpm.CDSCode     WHERE          `Enrollment (K-12)` - `Enrollment (Ages 5-17)` > 30     ) AS subquery 
SELECT DISTINCT s.name AS school_name FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE f.Percent_()Eligible_FREE(K-12) > 0.1 AND ss.AvgScrRead >= 1500 OR ss.AvgScrMath >= 1500 OR ss.AvgScrWrite >= 1500 
SELECT `FundingType` FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Riverside' AND satscores.AvgScrMath > 400; 
SELECT      `School Name`,     `Street`,     `City`,     `State`,     `Zip` FROM      `frpm` JOIN      `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE      `Academic Year` = '2014-2015' AND      `District Type` = 'High Schools (Public)' AND      `School Type` = 'High School' AND      `Age Group` = 'Ages 15-17' AND      `Free Meal Count (Ages 15-17)` > 800 
SELECT      s.School,     ss.AvgScrWrite,     s.Phone FROM      schools s JOIN      satscores ss ON s.CDSCode = ss.cds WHERE      s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01' ORDER BY      s.School; 
SELECT      `School Name`,     `District Type` FROM      frpm WHERE      `Charter Funding Type` = 'Local' AND      (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) >     (         SELECT              AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)         FROM              frpm     ) 
SELECT OpenDate FROM schools WHERE CDSCode IN (SELECT CDSCode FROM frpm ORDER BY Enrollment DESC LIMIT 1) AND GSserved = 'K-12'
 SELECT      T2.City FROM      frpm AS T1 JOIN      schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T1.`Low Grade` LIKE 'K%' GROUP BY      T2.City ORDER BY      SUM(T1.Enrollment) ASC LIMIT 5; 
SELECT      `School Name`,     `School Code`,     `Enrollment (K-12)`,     `Free Meal Count (K-12)`,     (`Free Meal Count (K-12)` / `Enrollment (K-12)`) * 100 AS 'Eligible Free Rate (%)' FROM      frpm WHERE      `Rank` IN (10, 11) ORDER BY      `Enrollment (K-12)` DESC LIMIT 2; 
SELECT      `FRPM Count (K-12)`,     `Enrollment (K-12)`,     (`FRPM Count (K-12)` / `Enrollment (K-12)`) * 100 AS 'FRPM Rate (%)' FROM      frpm WHERE      `Charter School (Y/N)` = '0' AND     `Charter School Number` IS NULL AND     `Charter Funding Type` = '66' AND     `School Type` LIKE '%High Schools%' OR     `School Type` LIKE '%Elementary Schools%' ORDER BY      `FRPM Count (K-12)` DESC LIMIT 5; 
SELECT s.name, s.website FROM schools s JOIN frpm f ON s.cds = f.CDSCode WHERE f.FRPM_Count(Ages 5-17) BETWEEN 1900 AND 2000 
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Name` LIKE '%Kacey Gibson%' AND `Age Range` = 'Ages 5-17'
SELECT AdmEmail1  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE frpm.Charter = 1  ORDER BY frpm.Enrollment DESC  LIMIT 1; 
SELECT T2.AdminLName1, T2.AdminFName1  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.NumGE1500 IS NOT NULL AND T2.NumGE1500 >= 1500  ORDER BY T2.NumGE1500 DESC  LIMIT 1 
SELECT      `School` AS `Street`,     `City`,     `State`,     `Zip` FROM      schools JOIN      satscores ON schools.CDSCode = satscores.cds WHERE      satscores.NumGE1500 / satscores.NumTstTakr = (SELECT MIN(satscores.NumGE1500 / satscores.NumTstTakr) FROM satscores);
 SELECT schools.Website FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Los Angeles' AND satscores.enroll12 BETWEEN 2000 AND 3000 
SELECT AVG(T1.NumTstTakr) FROM satscores T1 JOIN schools T2 ON T1.cds = T2.CDSCode WHERE T2.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND T2.City = 'Fresno';
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT s.CDSCode, s.CDSSchool, AVG(sc.AvgScrRead) AS AverageReadingScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.Virtual = 'F' GROUP BY s.CDSCode, s.CDSSchool ORDER BY AverageReadingScore DESC LIMIT 5; 
SELECT T2.rtype FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT AVG(AvgScrMath), T1.County FROM satscores AS T2 JOIN schools AS T1 ON T2.cds = T1.CDSCode WHERE (T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite) =  (SELECT MIN(T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite) FROM satscores AS T2) 
 SELECT AVG(satscores.AvgScrWrite), schools.City FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.NumGE1500 IS NOT NULL AND satscores.NumGE1500 >= 1500 GROUP BY schools.City ORDER BY COUNT(satscores.cds) DESC LIMIT 1; 
SELECT s.name AS School_Name, AVG(sc.AvgScrWrite) AS Average_Writing_Score FROM schools s JOIN satscores sc ON s.cds = sc.cds WHERE s.AdmEmail1 LIKE '%Ricci Ulrich%' OR s.AdmEmail2 LIKE '%Ricci Ulrich%' OR s.AdmEmail3 LIKE '%Ricci Ulrich%' GROUP BY s.name ORDER BY Average_Writing_Score DESC; 
SELECT `State`, COUNT(*) AS EnrolleeCount FROM `frpm` JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode` WHERE `DOC` = '31' AND `School Type` LIKE 'Special%' GROUP BY `State` ORDER BY EnrolleeCount DESC LIMIT 1;
 SELECT COUNT(*) / 12 AS "Monthly Average" FROM schools WHERE County = 'Alameda' AND DOCType = 'Elementary School District' AND DOC = 52 AND STRFTIME('%Y', OpenDate) = '1980'; 
SELECT CAST(SUM(CASE WHEN T1.DOC = '52' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.DOC = '54' THEN 1 ELSE 0 END) FROM schools T1 INNER JOIN frpm T2 ON T1.CDSCode = T2.CDSCode WHERE T1.MailState = 'CA' AND SUBSTR(T1.County, 1, 3) = 'Orange'
 SELECT      S.County,      S.School,      S.ClosedDate  FROM      schools S  WHERE      S.StatusType = 'Closed'  GROUP BY      S.County,      S.School,      S.ClosedDate  ORDER BY      COUNT(*) DESC  LIMIT 1; 
 SELECT T1.School, T1.Street FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1 OFFSET 5 
 SELECT T2.MailStreet, T1.Sname FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores); 
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite >= 1500  AND schools.MailCity = 'Lakeport' 
SELECT COUNT(*)  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE s.MailCity = 'Fresno'
 SELECT s.School, s.MailZip FROM schools s JOIN (     SELECT AdmFName1, AdmLName1     FROM schools     WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian' ) AS admin ON s.AdmFName1 = admin.AdmFName AND s.AdmLName1 = admin.AdmLName1; 
SELECT CAST(SUM(CASE WHEN T1.County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools T1 JOIN frpm T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA' 
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.MailState = 'CA'  AND frpm.County = 'San Joaquin'  AND schools.StatusType = 'Active';
SELECT `Phone`, `Ext` FROM schools WHERE `Phone` IS NOT NULL AND `Ext` IS NOT NULL ORDER BY `AvgScrWrite` DESC LIMIT 1 OFFSET 332; 
SELECT `School`, Phone, Ext FROM schools WHERE `Zip` = '95203-3704';
 SELECT T2.Website FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE (T1.AdmFName1 = 'Mike' AND T1.AdmLName1 = 'Larson') OR (T1.AdmFName1 = 'Dante' AND T1.AdmLName1 = 'Alvarez') 
SELECT schools.Website FROM schools WHERE schools.Virtual = 'P' AND schools.Charter = 1 AND schools.State = 'CA' AND schools.DOCType = 'San Joaquin';
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.Doc = '52' AND frpm.Charter = 1 AND schools.City = 'Hickman';
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Los Angeles'  AND frpm.Charter = 0  AND (frpm.FreeMealCount_K_12 * 100 / frpm.Enrollment_K_12) < 0.18 
 SELECT      T2.School,      T2.City,      T1.AdmFName1 || ' ' || T1.AdmLName1 AS AdministratorName FROM      schools AS T1 JOIN      frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T1.Charter = 1 AND T1.CharterNum = '00D2' 
SELECT COUNT(*) FROM schools WHERE MailingCity = 'Hickman' AND CharterNum = '00D4';
SELECT      CAST(SUM(CASE WHEN FundingType = 'Local' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      schools  WHERE      County = 'Santa Clara' AND      DOCType = 'Charter'; 
SELECT COUNT(*)  FROM schools  WHERE County = 'Stanislaus'  AND FundingType = 'Directly funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' 
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.City = 'San Francisco'  AND frpm._Academic_Year = '1989'  AND frpm.DOCType = 'Community College District'  AND schools.StatusType = 'Closed';
SELECT `County` FROM schools WHERE `Year` BETWEEN 1980 AND 1989 AND `Ownership Code` = 'CEA' GROUP BY `County` ORDER BY COUNT(*) DESC LIMIT 1;
SELECT `NCESDist` FROM schools WHERE `School Ownership Code` = 'SS' AND SOC = '31';
 SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine'  AND (StatusType = 'Active' OR StatusType = 'Closed')  AND DOCType = 'District Community Day' 
 SELECT `District Code` FROM schools WHERE `City` = 'Fresno' AND Magnet = 0; 
SELECT SUM(`Enrollment (Ages 5-17)`)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.DOC = 'SSS'  AND `Academic Year` = '2014-2015';
SELECT `FRPM Count (Ages 5-17)` FROM frpm WHERE `Mailing Street Address` = 'PO Box 1040' AND `School Name` LIKE 'Youth Authority%'
SELECT `Low Grade` FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE EdOpsCode = 'SPECON' AND NCESDist = '613360';
SELECT `School Name` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `Educational Option Type` = 'Breakfast Provision 2' AND `County Code` = '37';
SELECT T1.City FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.LunchProvision = 'Lunch Provision 2' AND T2.LowGrade = '9' AND T2.HighGrade = '12' AND T1.EILCode = 'HS' AND T1.County = 'Merced'
 SELECT      s.name AS School_Name,     (ss.free_meal_count_ages_5_17 / ss.enrollment_ages_5_17 * 100) AS Percent_Eligible_FRPM_Ages_5_17 FROM      schools s JOIN      frpm f ON s.cds_code = f.CDSCode JOIN      satscores ss ON s.cds_code = ss.cds WHERE      s.county = 'Los Angeles' AND      s.gs_served = 'K-9' AND      f.CDSCode IN (         SELECT cds FROM frpm WHERE `Low Grade` LIKE 'K%' AND `High Grade` LIKE '9%'     ); 
SELECT COUNT(*) AS frequency, `Grade Span` FROM schools WHERE `City` = 'Adelanto' GROUP BY `Grade Span` ORDER BY frequency DESC LIMIT 1;
SELECT COUNT(*)  FROM schools  WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F';
SELECT School, Latitude FROM schools WHERE Latitude = (SELECT MAX(Latitude) FROM schools) LIMIT 1;
 SELECT sname, `Low Grade` FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE State = 'CA' ORDER BY Latitude ASC LIMIT 1; 
 SELECT `Grade Span` FROM schools WHERE Longitude = (SELECT MAX(Longitude) FROM schools); 
SELECT COUNT(*) AS total_schools,         City AS city,         COUNT(*) AS schools_in_city FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE Magnet = 1 AND `Educational Option Type` IS NOT NULL GROUP BY City 
 SELECT S.MailCity, AdmFName1 AS AdministratorFirstName, COUNT(*) AS Count FROM schools S JOIN (     SELECT AdmFName1, AdmLName1 FROM schools WHERE AdmFName1 IS NOT NULL     UNION ALL     SELECT AdmFName2, AdmLName2 FROM schools WHERE AdmFName2 IS NOT NULL     UNION ALL     SELECT AdmFName3, AdmLName3 FROM schools WHERE AdmFName3 IS NOT NULL ) T ON S.CDSCode = T.AdmLName1 || T.AdmFName1 || SUBSTR(S.DOC, 1, 5) GROUP BY S.MailCity, AdministratorFirstName ORDER BY Count DESC LIMIT 2; 
 SELECT `District Code` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE AdmFName1 LIKE 'Alusine' OR AdmFName2 LIKE 'Alusine' OR AdmFName3 LIKE 'Alusine' 
SELECT      AdmLName1 AS AdministratorLastName,     CASE          WHEN DOC = 'Alameda Unified' THEN 'Alameda Unified'         ELSE District     END AS District,     County,     SchoolName FROM      schools WHERE      CharterNum = '40';
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND SOC = '62' OR DOC = '54';
SELECT T2.AdminEmail1 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 IS NOT NULL AND T2.AvgScrRead >= 1500 AND T2.AvgScrMath >= 1500 ORDER BY T2.NumTstTakr DESC LIMIT 1;
SELECT COUNT(*)  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district dist ON c.district_id = dist.district_id  WHERE dist.A3 LIKE '%East Bohemia%' AND a.frequency = 'POPLATEK PO OBRATU' 
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague'  AND EXISTS (     SELECT 1      FROM loan      WHERE account.account_id = loan.account_id      AND loan.status IN ('A', 'B', 'C', 'D') ); 
SELECT      AVG(A12) AS avg_unemployment_1995,     AVG(A13) AS avg_unemployment_1996 FROM      district WHERE      A4 = '1995' OR A4 = '1996' 
SELECT COUNT(*)  FROM client  WHERE gender = 'F'  AND (SELECT AVG(A11) FROM district WHERE client.district_id = district.district_id) > 6000  AND (SELECT AVG(A11) FROM district WHERE client.district_id = district.district_id) < 10000; 
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A3 LIKE 'North Bohemia' AND district.A11 > 8000 
WITH female_clients AS (   SELECT c.client_id, AVG(d.A11) AS avg_salary   FROM client c   JOIN district d ON c.district_id = d.district_id   WHERE c.gender = 'F'   GROUP BY c.client_id ),  oldest_female AS (   SELECT MIN(birth_date) AS min_birth_date   FROM client   WHERE gender = 'F' ),  youngest_oldest_female AS (   SELECT MAX(client_id) AS max_client_id   FROM (     SELECT client_id, birth_date     FROM client     WHERE gender = 'F'     ORDER BY birth_date ASC     LIMIT 1   ) ),  min_avg_salary AS (   SELECT MIN(avg_salary) AS min_salary   FROM female_clients ),  max_avg_salary AS (   SELECT MAX(avg_salary) AS max_salary   FROM female_clients ),  gap AS (   SELECT (SELECT max_salary FROM max_avg_salary) - (SELECT min_salary FROM min_avg_salary) AS gap   FROM dual )  SELECT MAX(trans.account_id) AS account_number, gap.gap FROM trans JOIN account a ON trans.account_id = a.account_id JOIN youngest_oldest_female yo ON yo.max_client_id = a.client_id JOIN oldest_female o ON o.min_birth_date = client.birth_date JOIN female_clients f ON f.client_id = a.client_id JOIN min_avg_salary m ON m.min_salary = f.avg_salary JOIN max_avg_salary mx ON mx.max_salary = f.avg_salary JOIN gap g ON TRUE GROUP BY gap.gap ORDER BY gap.gap DESC, MAX(trans.account_id) LIMIT 1; 
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.account_id WHERE T2.birth_date IN (     SELECT MAX(birth_date) FROM client ) AND T1.account_id IN (     SELECT T3.account_id FROM account AS T3     JOIN client AS T4 ON T3.account_id = T4.account_id     GROUP BY T3.account_id     ORDER BY AVG(T4.A11) DESC     LIMIT 1 ) 
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER' 
SELECT c.client_id, c.gender, c.birth_date, d.A2, d.A3, d.A4, d.A5, d.A6, d.A7, d.A8, d.A9, d.A10, d.A11, d.A12, d.A13, d.A14, d.A15, d.A16 FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT'; 
SELECT account.account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE strftime('%Y', loan.date) = '1997' ORDER BY loan.amount ASC, strftime('%w', loan.date) = '0' DESC LIMIT 1; 
SELECT account.account_id, MAX(loan.amount) AS max_approved_amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND STRFTIME('%Y', loan.date) = '1993' GROUP BY account.account_id ORDER BY max_approved_amount DESC LIMIT 1; 
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.A2 = 'Slokolov' 
SELECT account_id, date FROM trans WHERE date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY date ASC LIMIT 1; 
SELECT account.account_id FROM account JOIN card ON account.account_id = card.account_id JOIN client ON card.client_id = client.client_id WHERE account.date < '1997-01-01' AND EXISTS (     SELECT 1     FROM trans     WHERE trans.account_id = account.account_id     AND trans.amount > 3000 ) 
SELECT client_id FROM card WHERE issued LIKE '1994/%' AND issued LIKE '%/3/3';
SELECT `date` FROM account WHERE account_id = (SELECT account_id FROM trans WHERE amount = 840 AND strftime('%Y-%m-%d', date) = '1998-10-14')
SELECT T1.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date BETWEEN '1994-08-25' AND '1994-08-25';
SELECT MAX(amount) AS BiggestTransactionAmount FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card WHERE issued BETWEEN '1996-10-01' AND '1996-11-01'));
SELECT c.gender  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.client_id = (     SELECT MAX(c2.client_id)      FROM client c2      JOIN district d2 ON c2.district_id = d2.district_id      WHERE d2.A11 = (         SELECT AVG(d3.A11)          FROM district d3          WHERE EXISTS (             SELECT 1              FROM account a              WHERE a.district_id = d3.district_id         )     ) ) 
SELECT MIN(t.amount) AS first_transaction_amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' AND l.amount = (SELECT MAX(amount) FROM loan)
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Jesenik' AND client.gender = 'F'; 
SELECT disp_id FROM disp WHERE client_id IN (     SELECT client_id FROM client WHERE client_id IN (         SELECT client_id FROM trans WHERE amount = 5100 AND date LIKE '1998-%-%' AND type = 'PRIJEM'     ) )
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice' AND strftime('%Y', account.date) = '1996';
SELECT T3.A2  FROM client AS T1  JOIN disp AS T2 ON T1.client_id = T2.client_id  JOIN account AS T3 ON T2.account_id = T3.account_id  WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29' 
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date LIKE '1996-01-03' AND l.status = 'A';
SELECT account_id  FROM account  JOIN client ON account.account_id = client.client_id  JOIN district ON client.district_id = district.district_id  WHERE district.A3 = 'Prague'  ORDER BY date  LIMIT 1; 
SELECT      CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id)  FROM      client AS T1  JOIN      district AS T2 ON T1.district_id = T2.district_id  WHERE      T2.A3 = 'south Bohemia' AND T2.A4 IS NOT NULL  ORDER BY      T2.A4 DESC  LIMIT 1; 
SELECT      ((t.balance - (SELECT t.balance FROM trans AS t WHERE t.date = '1993-03-22')) /       (SELECT t.balance FROM trans AS t WHERE t.date = '1993-03-22')) * 100 AS increase_rate FROM      trans AS t WHERE      t.date = '1998-12-27' AND      (SELECT l.date FROM loan AS l WHERE l.account_id = t.account_id) <= '1993-07-05' ORDER BY      l.date DESC LIMIT 1 
SELECT      CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) OVER () AS percentage_paid_with_no_issue FROM      loan 
SELECT      COUNT(*) FILTER (WHERE amount < 100000 AND status = 'C') * 100.0 / COUNT(*) OVER () AS percentage FROM      loan 
SELECT      a.account_id,      d.A2 AS district_name,      d.A3 AS district_region  FROM      account a  JOIN      disp d ON a.account_id = d.account_id  JOIN      district dt ON d.district_id = dt.district_id  WHERE      a.date BETWEEN '1993-01-01' AND '1993-12-31'  AND      d.type = 'POPLATEK PO OBRATU' 
SELECT T1.account_id, T1.frequency FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'east Bohemia' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31' 
SELECT account.account_id, account.date  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Prachatice' 
SELECT T3.A2, T3.A3 FROM loan AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.loan_id = '4990'
SELECT T1.account_id, T2.A2, T3.A3 FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.amount > 300000 
SELECT      loan_id,      district.A3 AS district,      A11 AS average_salary  FROM      loan  JOIN      account ON loan.account_id = account.account_id  JOIN      district ON account.district_id = district.district_id  WHERE      duration = 60; 
SELECT D.A15 AS District,         ((D.A13 - D.A12) / D.A12) * 100 AS Unemployment_Increment_Percentage FROM district D JOIN client C ON D.district_id = C.district_id JOIN disp DP ON C.client_id = DP.client_id JOIN account AC ON DP.account_id = AC.account_id JOIN loan LO ON AC.account_id = LO.account_id WHERE LO.status = 'D' 
SELECT      (COUNT(*) FILTER (WHERE T3.A2 = 'Decin') * 100.0 / COUNT(*)) AS percentage FROM      account T1 JOIN      disp T2 ON T1.account_id = T2.account_id JOIN      client T3 ON T2.client_id = T3.client_id JOIN      district T4 ON T3.district_id = T4.district_id WHERE      T4.A2 = 'Decin' AND      T1.date = '1993-02-26'; 
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE' 
SELECT T1.A2, COUNT(T3.client_id) AS FemaleAccountHolders FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN client AS T3 ON T2.account_id = T3.account_id AND T3.gender = 'F' GROUP BY T1.district_id, T1.A2 ORDER BY FemaleAccountHolders DESC LIMIT 10 
SELECT T1.A2, SUM(T3.amount) AS TotalWithdrawals FROM district AS T1 JOIN disp AS T2 ON T1.district_id = T2.disp_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ' AND T3.date LIKE '1996-01%' GROUP BY T1.district_id ORDER BY TotalWithdrawals DESC LIMIT 10; 
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A3 = 'South Bohemia' AND client.client_id NOT IN  (SELECT disp_id FROM card);
SELECT T3.A3  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T3.district_id = T2.client_id  JOIN loan AS T4 ON T1.account_id = T4.account_id  WHERE T4.status = 'C'  GROUP BY T3.A3  ORDER BY COUNT(T4.loan_id) DESC  LIMIT 1;
SELECT AVG(amount)  FROM loan  JOIN client ON loan.account_id = client.account_id  WHERE client.gender = 'M' 
 SELECT T1.A2 AS BranchLocation, T1.A4 AS DistrictName FROM district AS T1 WHERE T1.A4 IN (     SELECT T2.A4     FROM district AS T2     JOIN (         SELECT T3.A4, MAX(T3.A13) AS MaxUnemploymentRate         FROM district AS T3         WHERE STRFTIME('%Y', T3.A7) = '1996'         GROUP BY T3.A4     ) AS T4     ON T2.A4 = T4.A4 AND T2.A13 = T4.MaxUnemploymentRate ) 
SELECT COUNT(*)  FROM (     SELECT district_id, A16     FROM district     WHERE strftime('%Y', '1996-01-01') || '-' || strftime('%Y', '1996-12-31') = '1996' ) AS crimes_per_district JOIN account ON district.district_id = account.district_id WHERE A16 = (     SELECT MAX(A16)     FROM district     WHERE strftime('%Y', '1996-01-01') || '-' || strftime('%Y', '1996-12-31') = '1996' ) 
SELECT COUNT(*)  FROM (     SELECT account_id, balance     FROM trans     WHERE type = 'VYBER KARTOU' AND balance < 0     AND frequency = 'POPLATEK MESICNE' ) AS filtered_transactions; 
SELECT COUNT(*)  FROM account  JOIN loan ON account.account_id = loan.account_id  WHERE date BETWEEN '1995-01-01' AND '1997-12-31'  AND amount >= 250000  AND frequency = 'POPLATEK MESICNE'  AND status = 'A'; 
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  JOIN district ON client.district_id = district.district_id  WHERE district.district_id = 1 AND account.status = 'C' 
SELECT COUNT(*)  FROM client  WHERE client.district_id IN (     SELECT district.district_id      FROM (         SELECT district.A15 AS crimes_1995, district.district_id          FROM district          ORDER BY crimes_1995 DESC          LIMIT 1 OFFSET 1      ) AS subquery ) AND client.gender = 'M'; 
SELECT COUNT(*)  FROM card  JOIN disp ON card.card_id = disp.disp_id  WHERE card.type = 'gold' AND disp.type = 'DISPONENT';
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Pisek';
SELECT T3.A3 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 10000 AND T1.date LIKE '1997-%' AND T1.k_symbol = 'USD' 
SELECT T1.account_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.bank = 'YZ' AND T2.k_symbol = 'SIPO' AND T1.A15 = 'Pisek';
SELECT DISTINCT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.client_id = card.disp_id WHERE card.type = 'gold' INTERSECT SELECT DISTINCT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.client_id = card.disp_id WHERE card.type = 'junior';
SELECT AVG(amount) AS average_amount FROM trans JOIN account ON trans.account_id = account.account_id JOIN card ON account.account_id = card.account_id WHERE trans.date LIKE '2021-%' AND trans.type = 'VYBER KARTOU';
SELECT t.account_id FROM trans t JOIN card c ON t.account_id = c.card_id AND t.date LIKE '1998-%' WHERE t.amount < (     SELECT AVG(amount)     FROM trans     WHERE date LIKE '1998-%' ) AND t.type = 'VYBER KARTOU' GROUP BY t.account_id HAVING SUM(t.amount) < (     SELECT AVG(amount)     FROM trans     WHERE date LIKE '1998-%'     GROUP BY account_id ) 
SELECT c.client_id, c.gender, c.birth_date, ac.account_id, ac.frequency, ac.date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account ac ON d.account_id = ac.account_id WHERE c.gender = 'F' AND EXISTS (     SELECT 1 FROM loan l WHERE ac.account_id = l.account_id );
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A3 = 'south Bohemia';
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.frequency = 'OWNER' 
SELECT DISTINCT account.frequency FROM account JOIN disp ON account.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id JOIN district ON client.district_id = district.district_id JOIN loan ON account.account_id = loan.account_id WHERE disp.type = 'OWNER' AND district.A11 BETWEEN 8000 AND 9000 
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 LIKE 'North Bohemia' AND t.bank = 'AB';
SELECT T3.A2  FROM trans AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.type = 'VYDAJ' 
SELECT AVG(A15)  FROM district  WHERE A3 IN (     SELECT T3.A3      FROM (         SELECT T2.A3, COUNT(*) AS cnt          FROM account AS T1          JOIN disp AS T2 ON T1.account_id = T2.account_id          WHERE T1.date >= '1997-01-01'          GROUP BY T2.A3          HAVING COUNT(*) > 4000     ) AS T3 ) 
SELECT COUNT(*)  FROM card  JOIN disp ON card.card_id = disp.disp_id  JOIN account ON disp.account_id = account.account_id  WHERE card.type = 'classic' AND account.frequency = 'OWNER' 
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M' 
SELECT      CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      card 
SELECT c.client_id, c.gender, c.birth_date, d.A1 FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) AND l.status = 'A' AND a.type = 'OWNER'
SELECT COUNT(*)  FROM district  JOIN account ON district.district_id = account.district_id  WHERE account.account_id = 532 AND A15 IS NOT NULL;
SELECT T1.district_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333;
SELECT t.trans_id, t.date, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.client_id = 3356 AND t.type = 'VYBER' ORDER BY t.date; 
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE account.frequency = 'POPLATEK TYDNE' AND        EXISTS (           SELECT 1            FROM loan            WHERE loan.account_id = account.account_id AND                  loan.amount < 200000       ) 
SELECT type FROM card WHERE card_id = (SELECT card_id FROM disp WHERE client_id = 13539)
SELECT T1.A3 FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541;
SELECT D.A2  FROM district D JOIN client C ON D.district_id = C.district_id JOIN disp DS ON C.client_id = DS.client_id JOIN account AC ON DS.account_id = AC.account_id JOIN loan LO ON AC.account_id = LO.account_id WHERE LO.status = 'A' GROUP BY D.district_id ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT account_id FROM "order" WHERE order_id = 32423;
SELECT t.trans_id, a.account_id, a.date, t.type, t.operation, t.amount, t.balance, t.k_symbol, t.bank, t.account FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.district_id = 5 
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik';
SELECT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cr ON d.disp_id = cr.disp_id  WHERE cr.type = 'junior' AND cr.issued >= '1997-01-01' 
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.client_id)  FROM      client c JOIN      account a ON c.client_id = a.account_id JOIN      district d ON c.district_id = d.district_id WHERE      d.A11 > 10000 
SELECT      ((SUM(amount WHERE strftime('%Y', date) = '1997') - SUM(amount WHERE strftime('%Y', date) = '1996')) /       (SUM(amount WHERE strftime('%Y', date) = '1996'))) * 100 AS growth_rate FROM      loan WHERE      client_id IN (         SELECT              client_id          FROM              client          WHERE              gender = 'M'     ); 
SELECT COUNT(*)  FROM trans  WHERE type = 'VYBER KARTOU' AND date > '1995-12-31';
SELECT      (SELECT A16 FROM district WHERE A3 = 'North Bohemia') -      (SELECT A16 FROM district WHERE A3 = 'East Bohemia') 
SELECT COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10  AND type IN ('OWNER', 'DISPONENT') 
SELECT COUNT(*) AS requests, SUM(amount) AS total_debit FROM `order` WHERE account_id = 3 AND k_symbol = 'ST'; 
SELECT T2.birth_date FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T1.account_id = 130;
SELECT COUNT(*)  FROM disp  JOIN account ON disp.account_id = account.account_id  WHERE type = 'OWNER' AND account.frequency = 'POPLATEK PO OBRATU' 
SELECT loan.amount, loan.payments FROM loan JOIN account ON loan.account_id = account.account_id WHERE account.client_id = 992;
SELECT SUM(amount),         CASE WHEN client.gender = 'M' THEN 'man' ELSE 'woman' END AS owner_gender FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id WHERE account.account_id = (     SELECT account_id FROM trans WHERE trans_id = 851 ) 
SELECT t2.type FROM client AS t1 JOIN disp AS t2 ON t1.client_id = t2.client_id WHERE t1.client_id = 9;
SELECT SUM(amount) AS total_paid FROM trans JOIN account ON trans.account_id = account.account_id WHERE account.client_id = 617 AND YEAR(date) = 1998;
SELECT c.client_id  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A4 = 'East Bohemia';
SELECT client_id  FROM client  WHERE gender = 'F'  ORDER BY MAX(amount * payments) DESC  LIMIT 3; 
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  WHERE client.gender = 'M'  AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND account.frequency = 'HOME'  AND account.amount > 4000 
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  JOIN district ON client.district_id = district.district_id  WHERE district.A4 = 'Beroun' AND date > '1996-12-31';
 SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'F' AND district.A15 IS NOT NULL 
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.client_id)  FROM      client c  JOIN      disp d ON c.client_id = d.client_id  JOIN      account a ON d.account_id = a.account_id  JOIN      district d1 ON c.district_id = d1.district_id  WHERE      d1.A3 = 'Prague'; 
SELECT      CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.frequency) FROM      account AS T1 JOIN      client AS T2 ON T1.district_id = T2.district_id WHERE      T1.frequency = 'POPLATEK TYDNE' 
SELECT COUNT(*)  FROM account  WHERE frequency = 'POPLATEK TYDNE'
SELECT account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 24 AND date < '1997-01-01' ORDER BY amount ASC LIMIT 1; 
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T2.gender = 'F' ORDER BY T2.A10 ASC, T1.date ASC LIMIT 1
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE strftime('%Y', client.birth_date) = '1920' AND district.A3 LIKE 'East Bohemia%' 
SELECT COUNT(*)  FROM loan  WHERE duration = 24 AND status = 'A' AND frequency = 'POPLATEK TYDNE'; 
SELECT      t.date,     AVG(l.amount) AS average_loan_amount FROM      trans t JOIN      account a ON t.account_id = a.account_id JOIN      loan l ON a.account_id = l.account_id WHERE      l.status IN ('C', 'D') AND      t.type = 'POPLATEK PO OBRATU' GROUP BY      t.date; 
SELECT c.client_id, d.A1 FROM client c JOIN district d ON c.district_id = d.district_id WHERE EXISTS (     SELECT 1     FROM disp disp     WHERE disp.client_id = c.client_id     AND disp.type = 'OWNER' ) OR EXISTS (     SELECT 1     FROM account acc     WHERE acc.account_id IN (         SELECT acc.account_id         FROM disp d         WHERE d.client_id = c.client_id         AND d.type = 'OWNER'     )     AND acc.frequency = 'POPLATEK MESICNE' ) 
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURRENT_DATE) AS age  FROM client c JOIN card ca ON c.client_id = ca.disp_id WHERE ca.type = 'gold' AND EXISTS (     SELECT 1 FROM loan l WHERE l.account_id = ca.account_id AND l.status = 'A' ) 
SELECT bond_type  FROM bond  GROUP BY bond_type  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '-' AND a.element = 'cl'
SELECT AVG(CASE WHEN m.label = '+' THEN COUNT(*) END) AS avg_oxygen_atoms_in_single_bonded_molecules FROM (     SELECT c.molecule_id     FROM connected c     JOIN atom a ON c.atom_id = a.atom_id     JOIN bond b ON c.bond_id = b.bond_id     WHERE b.bond_type = '-' ) sb_bonds JOIN molecule m ON sb_bonds.molecule_id = m.molecule_id JOIN atom a ON a.molecule_id = sb_bonds.molecule_id WHERE a.element = 'o';
SELECT AVG(CASE WHEN T3.bond_type = '-' THEN 1 ELSE 0 END) AS average_single_bonded_carcinogenic_molecules FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.atom_id = ANY(T3.bond_id) WHERE T2.label = '+';
SELECT COUNT(*)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN element e ON a.element = e.element  WHERE e.element = 'na' AND m.label = '-'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+';
SELECT      CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM      atom AS T1 JOIN      connected AS T3 ON T1.atom_id = T3.atom_id JOIN      bond AS T2 ON T2.bond_id = T3.bond_id WHERE      T2.bond_type = '=' 
SELECT COUNT(*)  FROM bond  WHERE bond_type = '#'; 
SELECT COUNT(*) FROM atom WHERE element != 'br'; 
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+'; 
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'si'
SELECT T3.element  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id  WHERE T1.bond_id = 'TR004_8_9'
SELECT DISTINCT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T3.bond_id = T2.bond_id  WHERE T3.bond_type = ' =' ;
SELECT label  FROM (     SELECT label, COUNT(*) AS count_label,             (SELECT COUNT(*) FROM atom WHERE element = 'h') AS total_hydrogen_atoms     FROM atom     GROUP BY label ) AS labeled_atoms WHERE count_label = (SELECT MAX(count_label) FROM (     SELECT COUNT(*) AS count_label     FROM atom     WHERE element = 'h'     GROUP BY label )) 
SELECT T3.bond_type FROM `atom` AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T1.element = 'te' AND T2.label IN ('+', '-')
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '-'
SELECT DISTINCT A.atom_id  FROM atom A JOIN connected C ON A.atom_id = C.atom_id JOIN bond B ON C.bond_id = B.bond_id JOIN molecule M ON A.molecule_id = M.molecule_id WHERE M.label = '-' 
SELECT atom.element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '-'  GROUP BY atom.element  ORDER BY COUNT(*) ASC  LIMIT 1; 
SELECT T3.bond_type FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T3.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8');
SELECT DISTINCT label  FROM molecule  WHERE molecule_id NOT IN (     SELECT DISTINCT molecule_id      FROM atom      WHERE element = 'sn' ) AND label IS NOT NULL 
SELECT COUNT(*)  FROM atom a  JOIN bond b ON a.atom_id = ANY(SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-'))  JOIN atom a2 ON a2.atom_id = ANY(SELECT atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-'))  WHERE a.element IN ('i', 's') AND b.bond_type = '-' 
SELECT DISTINCT c.atom_id, a.element  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#' 
SELECT DISTINCT a.atom_id  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181' OR (a.atom_id IN (SELECT atom_id FROM connected WHERE atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181'))) OR (a.atom_id2 IN (SELECT atom_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181'))); 
SELECT      (COUNT(CASE WHEN atom.element != 'f' THEN 1 END) / CAST(COUNT(*) AS REAL)) * 100 AS percentage_carcinogenic_without_fluorine FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+'; 
SELECT      (SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) / CAST(COUNT(T1.bond_id) AS REAL)) * 100 AS percentage FROM      bond AS T1 JOIN      molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T2.label = '+'; 
 SELECT T1.element  FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.molecule_id = 'TR000'  ORDER BY T1.element ASC  LIMIT 3 
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR001_2_6' AND T2.molecule_id = 'TR001';
 SELECT      (SUM(CASE WHEN `molecule`.`label` = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN `molecule`.`label` = '-' THEN 1 ELSE 0 END)) AS difference FROM      `molecule` 
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5' UNION SELECT atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'
SELECT T3.bond_id FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id = T2.atom_id JOIN `connected` AS T3 ON T1.atom_id2 = T3.atom_id2 WHERE T2.atom_id = 'TR000_2' AND T3.atom_id2 = 'TR000_2';
 SELECT m.molecule_id, m.label  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' ORDER BY m.label LIMIT 5 
SELECT      (SUM(CASE WHEN `bond_type` = '=' THEN 1 ELSE 0 END) / COUNT(`bond_id`)) * 100 AS percentage_double_bonds FROM      `bond` JOIN      `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE      `molecule.molecule_id` = 'TR008'
SELECT      (SUM(CASE WHEN `label` = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(`molecule_id`)) AS percent FROM `molecule`;
 SELECT      (SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) / COUNT(atom.atom_id)) * 100 AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.molecule_id = 'TR206'; 
SELECT T3.bond_type  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T2.bond_id = T3.bond_id  WHERE T1.molecule_id = 'TR000' 
SELECT atom.element, molecule.label  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN connected ON atom.atom_id = connected.atom_id2  JOIN bond ON connected.bond_id = bond.bond_id  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.molecule_id = 'TR006' AND molecule.label = '+';
SELECT      T2.bond_type,      COUNT(T2.bond_type) AS bond_count,     CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenic_status FROM      molecule AS T1 JOIN      bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE      T1.molecule_id = 'TR018' GROUP BY      T2.bond_type, T1.label HAVING      COUNT(T2.bond_type) >= ALL (         SELECT              COUNT(*)          FROM              bond AS T2         JOIN              molecule AS T1 ON T1.molecule_id = T2.molecule_id         WHERE              T1.molecule_id = 'TR018' AND T1.label <> '+'     ) ORDER BY      COUNT(T2.bond_type) DESC LIMIT 1; 
 SELECT T1.molecule_id  FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.bond_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '-' ORDER BY T1.label ASC LIMIT 3 
 SELECT T2.bond_id  FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN connected AS T4 ON T1.atom_id = T4.atom_id2  JOIN bond AS T2 ON T2.bond_id = T3.bond_id OR T2.bond_id = T4.bond_id  WHERE T1.molecule_id = 'TR006'  ORDER BY T2.bond_id  LIMIT 2 
SELECT COUNT(*)  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  JOIN atom ON (atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2)  WHERE bond.molecule_id = 'TR009' AND (atom.atom_id = 'TR009_12' OR atom.atom_id2 = 'TR009_12')
SELECT COUNT(*)  FROM molecule  WHERE label = '+'  AND EXISTS (     SELECT 1      FROM atom      WHERE molecule_id = molecule.molecule_id      AND element = 'br' ) 
SELECT T3.bond_type, T1.atom_id AS atom_id1, T2.atom_id AS atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_6_9'; 
SELECT m.label, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenic_status  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR001_10';
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'
SELECT COUNT(*)  FROM connected  WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19' 
SELECT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN connected AS T3 ON T1.atom_id = T3.atom_id2  JOIN bond AS T4 ON T2.bond_id = T4.bond_id OR T3.bond_id = T4.bond_id  JOIN molecule AS T5 ON T5.molecule_id = T1.molecule_id  WHERE T5.molecule_id = 'TR004'  GROUP BY T1.element;
SELECT COUNT(*) FROM `molecule` WHERE `label` = '-'
SELECT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T3.molecule_id = T1.molecule_id AND SUBSTR(T1.atom_id, 7, 2) BETWEEN 21 AND 25 AND T3.label = '+'; 
SELECT T3.bond_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T3.molecule_id = T2.molecule_id WHERE T1.element = 'p' OR T1.element = 'n'
SELECT m.label  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '='  GROUP BY m.molecule_id  ORDER BY COUNT(*) DESC  LIMIT 1  AND m.label = '+'; 
SELECT AVG(T3.bond_count) AS avg_bonds FROM (     SELECT COUNT(T2.bond_id) AS bond_count     FROM atom AS T1     JOIN bond AS T2 ON T1.atom_id = T2.atom_id     WHERE T1.element = 'i'     GROUP BY T1.atom_id ) AS T3 
SELECT      T3.bond_id,     CASE          WHEN T3.bond_type = ' = ' THEN 'double'         WHEN T3.bond_type = '-' THEN 'single'         WHEN T3.bond_type = '#' THEN 'triple'         ELSE T3.bond_type     END AS bond_type FROM      atom AS T1 JOIN      connected AS T2 ON T1.atom_id = T2.atom_id AND T1.atom_id2 = 'TR000_45' JOIN      bond AS T3 ON T3.bond_id = T2.bond_id WHERE      SUBSTR(T1.atom_id, 7, 2) + 0 = 45 
SELECT element  FROM atom  WHERE atom_id NOT IN (SELECT atom_id FROM connected) AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T4.molecule_id = 'TR447' AND T3.bond_type = '#'
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.molecule_id IN (SELECT T4.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.atom_id IN (SELECT atom_id2 FROM connected WHERE bond_id = 'TR144_8_19') UNION SELECT T4.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T3.atom_id IN (SELECT atom_id2 FROM connected WHERE bond_id = 'TR144_8_19')) AND T1.molecule_id = T3.molecule_id;
SELECT T1.molecule_id  FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T1.label = '+' AND T2.bond_type = '='  GROUP BY T1.molecule_id  ORDER BY COUNT(T2.bond_id) DESC  LIMIT 1 
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'  GROUP BY element  ORDER BY COUNT(*) ASC  LIMIT 1;
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type != '-' AND NOT EXISTS (SELECT * FROM atom AS T4 WHERE T4.element = 'pb' AND T4.atom_id = T1.atom_id)
SELECT T3.element  FROM connected AS T1  JOIN bond AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON (T1.atom_id = T3.atom_id OR T1.atom_id2 = T3.atom_id)  WHERE T2.bond_type = '#'  AND (T3.element = 'cl' AND T2.molecule_id IN (SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-' AND T1.atom_id IN (SELECT atom_id FROM atom WHERE element = 'c')))  OR (T3.element = 'c' AND T2.molecule_id IN (SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-' AND T1.atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl'))) 
SELECT      (COUNT(b.bond_id) * 100.0 / (SELECT COUNT(*) FROM atom WHERE element IN (         SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) DESC LIMIT 1))) AS percentage FROM      bond b; 
SELECT      CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id)  FROM      bond AS T2  JOIN      atom AS T1 ON T1.atom_id = SUBSTRING(T2.bond_id, 1, INSTR(T2.bond_id, '_') - 1)  JOIN      molecule AS T3 ON T3.molecule_id = T1.molecule_id  WHERE      T2.bond_type = '-' AND T3.label = '+'; 
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h') 
SELECT T2.atom_id2 FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'
SELECT T3.bond_id, T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'sn' 
SELECT COUNT(DISTINCT atom.element) FROM atom JOIN bond ON atom.atom_id = bond.molecule_id AND bond.bond_type = '-' JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' 
SELECT COUNT(*)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br')  AND EXISTS (SELECT * FROM molecule WHERE molecule_id = m.molecule_id AND label = '+') 
SELECT T3.bond_id FROM `molecule` AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id WHERE T1.label = '+';
SELECT `molecule.molecule_id` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` WHERE `bond.bond_type` = '-' AND `molecule.label` = '-'
 SELECT      CAST(SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom.atom_id) AS chlorine_percentage FROM      atom JOIN      connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN      bond ON connected.bond_id = bond.bond_id WHERE      bond.bond_type = '-' 
 SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002') 
SELECT `molecule_id` FROM `molecule` WHERE `label` = '-';
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030'  AND label = '+'; 
SELECT      T3.bond_id,      CASE          WHEN T2.bond_type = '=' THEN 'double bond'         WHEN T2.bond_type = '-' THEN 'single bond'         WHEN T2.bond_type = '#' THEN 'triple bond'         ELSE 'unknown bond type'     END AS bond_type FROM      molecule AS T1 JOIN      atom AS T3 ON T1.molecule_id = T3.molecule_id JOIN      bond AS T2 ON T3.atom_id = ANY (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = T1.molecule_id)) WHERE      T1.molecule_id BETWEEN 'TR000' AND 'TR050' 
SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_10_11' UNION SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id2 JOIN `bond` AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_10_11'
SELECT COUNT(*)  FROM atom  WHERE element = 'i'  AND EXISTS (SELECT 1 FROM connected WHERE connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id)
SELECT      m.label  FROM      atom a  JOIN      molecule mo ON a.molecule_id = mo.molecule_id  JOIN      element e ON a.element = e.element  WHERE      e.element = 'Ca'  GROUP BY      mo.label  ORDER BY      COUNT(*) DESC  LIMIT 1; 
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_id = 'TR001_1_8' AND (T3.element = 'cl' OR T4.element = 'cl') AND (T3.element = 'c' OR T4.element = 'c') GROUP BY T1.bond_id HAVING COUNT(*) = 2;
SELECT T1.molecule_id FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.bond_id = T3.bond_id  WHERE T3.element = 'c' AND T2.bond_type = '#' AND T1.label = '-' LIMIT 2; 
SELECT      (COUNT(CASE WHEN atom.element = 'cl' THEN 1 END) /       COUNT(DISTINCT atom.molecule_id)) * 100 AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      molecule.label = '+'; 
SELECT T3.element FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T1.molecule_id = 'TR001' AND T1.label = '+';
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = '
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' ORDER BY c.atom_id ASC, c.atom_id2 ASC LIMIT 1; 
SELECT T3.element FROM `bond` AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id AND T2.atom_id2 = 'TR005_16' OR T2.atom_id2 = T3.atom_id AND T2.atom_id = 'TR005_16'  WHERE T1.bond_id = 'TR005_16_26';
SELECT COUNT(*)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '-' AND m.label = '-' 
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_10_11'
SELECT c.bond_id, m.label  FROM connected AS c  JOIN bond AS b ON c.bond_id = b.bond_id  JOIN molecule AS m ON m.molecule_id = c.atom_id || c.atom_id2  WHERE b.bond_type = '#' AND m.label = '+' 
SELECT      atom.element  FROM      atom  JOIN      connected ON atom.atom_id = connected.atom_id  JOIN      bond ON connected.bond_id = bond.bond_id  JOIN      molecule ON atom.molecule_id = molecule.molecule_id  WHERE      molecule.label = '+' AND      SUBSTR(atom.atom_id, 7, 1) = '4' AND      atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT      SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) / COUNT(atom.element),      (SELECT label FROM molecule WHERE molecule.molecule_id = 'TR006') FROM      atom JOIN      connected ON atom.atom_id = connected.atom_id JOIN      bond ON connected.bond_id = bond.bond_id JOIN      molecule ON molecule.molecule_id = bond.molecule_id WHERE      molecule.molecule_id = 'TR006'; 
SELECT m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN atom ca ON ca.atom_id = c.atom_id2  WHERE a.element = 'ca' AND m.label = '+';
SELECT C.bond_id, B.bond_type  FROM atom A  JOIN atom A2 ON A.atom_id = A2.atom_id2  JOIN connected C ON A.atom_id = C.atom_id  JOIN bond B ON C.bond_id = B.bond_id  WHERE A.element = 'Te' AND B.bond_type IN ('=', '-', '#') 
SELECT DISTINCT atom.element  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_id = 'TR001_10_11';
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' 
SELECT      CAST(SUM(CASE WHEN T3.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.bond_id) AS percent FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN      bond AS T3 ON T2.atom_id = T3.molecule_id WHERE      T1.molecule_id = 'TR047' 
SELECT T1.label  FROM molecule AS T1  JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T3.atom_id = 'TR001_1'  AND T1.label = '+';
SELECT `molecule.label` FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` JOIN `connected` ON `atom.atom_id` = `connected.atom_id` OR `atom.atom_id` = `connected.atom_id2` WHERE `molecule.molecule_id` = 'TR151' AND `molecule.label` = '+';
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = 'TR151') AND T1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE label = '+';
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON a.atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = m.molecule_id)) WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'c'; 
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+';
SELECT T3.bond_id FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `connected` AS T4 ON T2.atom_id = T4.atom_id JOIN `bond` AS T3 ON T3.bond_id = T4.bond_id WHERE T1.label = '+' AND T3.bond_type = '=';
SELECT COUNT(*)  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  JOIN molecule ON molecule.molecule_id = bond.molecule_id  WHERE molecule.label = '+' AND atom.element = 'h' 
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T3.atom_id = 'TR000_1' AND T3.atom_id2 = 'TR000_2'; 
SELECT `atom.atom_id` FROM `atom` JOIN `connected` ON `atom.atom_id` = `connected.atom_id` JOIN `bond` ON `connected.bond_id` = `bond.bond_id` WHERE `atom.element` = 'c' AND `bond.bond_type` != '-' AND `molecule.label` = '-'
SELECT      CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id)  FROM      molecule AS T1  JOIN      atom AS T2  ON      T1.molecule_id = T2.molecule_id; 
SELECT `molecule`.label  FROM `molecule` JOIN atom ON `molecule.molecule_id` = atom.molecule_id JOIN connected ON atom.atom_id IN (SELECT atom_id FROM connected) WHERE `molecule.molecule_id` = 'TR124' AND `molecule.label` = '+';
SELECT T1.atom_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id JOIN `molecule` AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.molecule_id = 'TR186';
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR007_4' OR atom_id2 = 'TR007_4') AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_2_4' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_2_4'
SELECT COUNT(*) AS double_bonds, molecule.label  FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  JOIN connected ON connected.bond_id = bond.bond_id  WHERE molecule.molecule_id = 'TR006' AND bond.bond_type = '=' UNION SELECT 'N/A', molecule.label FROM molecule WHERE molecule.molecule_id = 'TR006' AND molecule.label IS NULL; 
SELECT m.molecule_id, m.label, a.element  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond b ON c.bond_id = b.bond_id  WHERE m.label = '+' AND (a.element = 'cl' OR a.element = 'c' OR a.element = 'h') 
SELECT c.atom_id, c.atom_id2, b.bond_id, m.label  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE b.bond_type = '-' 
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id JOIN atom AS T4 ON T3.atom_id = T4.atom_id OR T3.atom_id2 = T4.atom_id WHERE T2.bond_type = '#' AND (T4.element = 'cl' OR T4.element = 'c') 
SELECT atom.element FROM atom  JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id2 = connected.atom_id2 JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_id = 'TR000_2_3'
 SELECT COUNT(*)  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id  WHERE atom.element = 'cl' AND atom2.element = 'cl' 
SELECT a.atom_id, COUNT(DISTINCT b.bond_id) AS bond_types_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN bond b ON a.molecule_id = b.molecule_id WHERE m.molecule_id = 'TR346' GROUP BY a.atom_id; 
SELECT COUNT(*)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_type = '=' AND m.label = '+' 
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element != 's' AND b.bond_type != '=' 
SELECT `molecule.label` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` JOIN `connected` ON `bond.bond_id` = `connected.bond_id` WHERE `bond.bond_id` = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';
SELECT COUNT(*)  FROM bond  WHERE bond_type = '-'
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'; 
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label = '-' 
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id)  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.element = 'cl' 
SELECT T3.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT atom.element) FROM atom JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_id = 'TR001_3_4';
SELECT T3.bond_type FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T1.bond_id = T3.bond_id WHERE T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2' OR (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_1')
 SELECT T1.label  FROM molecule AS T1  JOIN connected AS T2 ON T1.molecule_id = T2.bond_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id  WHERE T3.atom_id IN ('TR000_2') AND T4.atom_id = 'TR000_4' 
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT `molecule`.`label` FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` JOIN `connected` ON `atom.atom_id` = `connected.atom_id` WHERE `atom.atom_id` IN (SELECT `atom_id` FROM `connected` WHERE `bond_id` IS NOT NULL) AND `molecule.molecule_id` = 'TR000';
SELECT      (SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) / CAST(COUNT(T2.bond_id) AS REAL)) * 100 AS percentage FROM      bond AS T2 JOIN      atom AS T1 ON T1.atom_id = SUBSTRING(T2.bond_id, 1, INSTR(T2.bond_id, '_') - 1) JOIN      connected AS T3 ON T2.bond_id = T3.bond_id;
SELECT COUNT(*)  FROM molecule  JOIN atom ON molecule.molecule_id = atom.molecule_id  JOIN element ON atom.element = element.element  WHERE element = 'N' AND molecule.label = '+';
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = ' =' ;
 SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5 AND m.label = '-' 
SELECT T3.element  FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.bond_id IN (SELECT bond_id FROM connected WHERE (atom_id = T3.atom_id OR atom_id2 = T3.atom_id) AND T1.molecule_id = 'TR024')  WHERE T2.bond_type = '=' 
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;
SELECT      (COUNT(CASE WHEN T1.label = '+' THEN 1 ELSE NULL END) / CAST(COUNT(T1.molecule_id) AS REAL)) * 100.0 AS percentage FROM      molecule AS T1 JOIN      atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN      bond AS T3 ON T2.atom_id = T3.atom_id WHERE      T2.element = 'h' AND T3.bond_type = '#' 
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT COUNT(*)  FROM bond  WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010' 
SELECT COUNT(*) FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE atom_id2 IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR008'))) AND element = 'c';
SELECT t.atom.element FROM atom t JOIN connected c ON t.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '-' AND t.atom_id = 'TR004_7';
SELECT COUNT(*)  FROM molecule  WHERE molecule_id IN (     SELECT DISTINCT c.atom_id     FROM connected c     JOIN atom a ON c.atom_id = a.atom_id     JOIN bond b ON c.bond_id = b.bond_id     WHERE a.element = 'O' AND b.bond_type = '=' )
SELECT COUNT(*)  FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  JOIN connected ON bond.bond_id = connected.bond_id  WHERE bond.bond_type = '#' AND molecule.label = '-' 
SELECT T1.element, T2.bond_type  FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T2 ON T2.bond_id = T3.bond_id  WHERE T1.molecule_id = 'TR016' UNION SELECT T1.element, 'double bond'  FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T2 ON T2.bond_id = T3.bond_id  WHERE T2.bond_type = ' =' AND T1.molecule_id = 'TR016' UNION SELECT T1.element, 'triple bond'  FROM atom AS T1  JOIN connected AS T3 ON T1.atom_id = T3.atom_id  JOIN bond AS T2 ON T2.bond_id = T3.bond_id  WHERE T2.bond_type = '#' AND T1.molecule_id = 'TR016' 
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR012' AND atom.element = 'c' AND bond.bond_type = '=';
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE molecule.label = '+' AND atom.element = 'o'
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;
SELECT * FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)
SELECT name FROM cards WHERE MAX(faceConvertedManaCost) IS NOT NULL;
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';
SELECT      c.uuid,      l.format,      l.status FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.types LIKE '%Artifact%' AND      c.side IS NULL AND      l.format = 'vintage'
SELECT `id`, artist FROM cards WHERE power LIKE '*' OR power IS NULL AND uuid IN (     SELECT uuid     FROM legalities     WHERE format = 'commander' AND status = 'Legal' ) 
SELECT c.name, c.text, r.date, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1; 
SELECT text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s';
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN (     SELECT uuid      FROM rulings      GROUP BY uuid      HAVING COUNT(*) = (SELECT MAX(numRules) FROM (         SELECT COUNT(*) AS numRules          FROM rulings          GROUP BY uuid      )) ) r ON c.uuid = r.uuid 
SELECT      f.language  FROM      cards c  JOIN      foreign_data f ON c.uuid = f.uuid  WHERE      c.name = 'Annul' AND c.number = '29';
SELECT `name` FROM `cards` WHERE `language` = 'Japanese';
 SELECT      (COUNT(*) FILTER (WHERE language = 'Chinese Simplified') * 100.0 / COUNT(*)) AS percentage FROM      cards 
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.setCode = st.setCode AND st.language = 'Italian' ORDER BY s.name; 
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(*)  FROM cards  WHERE power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress';
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT `originalType` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';
SELECT DISTINCT T3.language  FROM cards AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  JOIN set_translations AS T3 ON T2.setCode = T3.setCode AND T1.uuid = T3.uuid  WHERE T1.name = 'Angel of Mercy';
SELECT COUNT(*)  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE legalities.status = 'restricted' AND cards.isTextless = 0;
SELECT text FROM rulings WHERE uuid = '7fef665c-36a1-5f7a-9299-cf8938708710'
SELECT COUNT(*)  FROM legalities  JOIN cards ON legalities.uuid = cards.uuid  WHERE legalities.status = 'restricted' AND cards.isStarter = 1;
SELECT status FROM legalities WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle')
SELECT type FROM cards WHERE name = 'Benalish Knight';
SELECT T2.date, T2.text  FROM cards AS T1  JOIN rulings AS T2 ON T1.uuid = T2.uuid  WHERE T1.name = 'Benalish Knight';
SELECT artist FROM cards WHERE name = 'Phyrexian';
SELECT      CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_borderless_cards FROM      cards;
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE foreign_data.language = 'German' AND cards.isReprint = 1;
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian';
SELECT      (COUNT(CASE WHEN T1.language = 'French' AND T2.isStorySpotlight = 1 THEN 1 END)      / COUNT(CASE WHEN T2.isStorySpotlight = 1 THEN 1 END)) * 100 AS percentage FROM      cards AS T1 JOIN      legalities AS T2 ON T1.uuid = T2.uuid WHERE      T2.isStorySpotlight = 1; 
SELECT COUNT(*) FROM cards WHERE toughness = '99';
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black' AND availability LIKE '%mtgo%' 
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT `layout` FROM `cards` WHERE `keywords` LIKE '%flying%'
SELECT COUNT(*)  FROM cards  WHERE `originalType` LIKE '%Summon - Angel%' AND subtypes NOT LIKE '%Angel%'
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL 
SELECT id FROM cards WHERE duelDeck = 'a';
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT `artist` FROM `cards` WHERE `language` = 'Chinese Simplified';
SELECT `name`  FROM `cards`  WHERE `availability` = 'paper' AND `language` = 'Japanese';
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'Banned' AND cards.borderColor = 'white';
 SELECT T1.uuid, T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy' 
 SELECT text FROM rulings WHERE uuid = '56f4935b-f6c5-59b9-88bf-9bcce20247ce' 
SELECT COUNT(*) AS future_frame_card_count, status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' AND legalities.status = 'legal';
SELECT      cards.name,      CASE          WHEN cards.colors LIKE '%W%' THEN 'White'         WHEN cards.colors LIKE '%U%' THEN 'Blue'         WHEN cards.colors LIKE '%B%' THEN 'Black'         WHEN cards.colors LIKE '%R%' THEN 'Red'         WHEN cards.colors LIKE '%G%' THEN 'Green'         ELSE 'Unknown'     END AS color FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      sets.setCode = 'OGW'; 
SELECT T1.name, T1.translation  FROM cards AS T1  JOIN set_translations AS T2 ON T1.setCode = T2.setCode AND T1.setCode = '10E'  WHERE T1.convertedManaCost = 5;
SELECT T1.name, T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT      c.id, c.colors, l.format  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  WHERE      c.id BETWEEN 1 AND 20 
SELECT cd.uuid  FROM cards cd  JOIN foreign_data fd ON cd.uuid = fd.uuid  WHERE cd.colors = 'B' AND cd.type = 'Artifact' AND fd.language IN ('German', 'Spanish', 'French', 'Italian', 'Japanese')
 SELECT name  FROM cards  WHERE rarity = 'uncommon'  ORDER BY COALESCE(rulings.date, '1900-01-01') ASC  LIMIT 3; 
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE artist = 'John Avon'  AND (cardKingdomId IS NOT NULL OR cardKingdomFoilId IS NOT NULL)
 SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'  AND (cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL) 
SELECT COUNT(*)  FROM cards  WHERE artist LIKE 'UDON'  AND availability LIKE 'mtgo'  AND hand = -1 
SELECT COUNT(*)  FROM cards  WHERE frameVersion LIKE '1993%' AND availability = 'paper' AND hasContentWarning = 1;
SELECT manaCost  FROM cards  WHERE layout = 'normal'  AND frameVersion = '2003'  AND borderColor = 'black'  AND availability LIKE '%paper%'  AND availability LIKE '%mtgo%'
SELECT SUM(REAL(`convertedManaCost`)) AS TotalUncolvertedMana FROM `cards` WHERE `artist` = 'Rob Alexander';
SELECT DISTINCT `type` FROM `cards` WHERE `availability` = 'arena';
SELECT DISTINCT s.setCode  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON st.setCode = c.setCode AND st.language = 'Spanish';
SELECT CAST(SUM(CASE WHEN T1.hand = '+3' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id)  FROM cards AS T1  JOIN (     SELECT id      FROM cards      WHERE frameEffects = 'legendary' ) AS T2  ON T1.id = T2.id 
SELECT      id FROM      cards WHERE      isStoryspotlight = 1 AND isTextless = 1 
 SELECT      name  FROM      cards  WHERE      language = 'Spanish' ORDER BY      name; 
SELECT DISTINCT T2.language  FROM sets AS T1  JOIN set_translations AS T2 ON T1.setCode = T2.setCode  WHERE T1.baseSetSize = 309
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.setCode = set_translations.setCode  WHERE sets.block = 'Commander'  AND set_translations.language = 'Portuguese (Brasil)'
SELECT id  FROM cards  WHERE type = 'Creature' AND status = 'Legal' 
 SELECT DISTINCT t1.supertypes || ' ' || t1.subtypes AS Card_Type FROM cards t1 JOIN foreign_data t2 ON t1.uuid = t2.uuid WHERE t2.language = 'German' AND t1.subtypes IS NOT NULL AND t1.supertypes IS NOT NULL 
SELECT COUNT(*)  FROM cards  WHERE power IS NULL OR power = '*' AND (power IS NULL OR power = '*') AND (power LIKE '%triggered ability%' OR power LIKE '%activated ability%') 
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.format LIKE 'pre-modern' AND        cards.faceName IS NULL AND        cards.frameVersion LIKE '%triggered mana ability%' 
SELECT `cards`.id  FROM `cards`  JOIN `legalities` ON `cards`.uuid = `legalities`.uuid  WHERE `legalities`.format = 'pauper' AND `cards`.artist = 'Erica Yang' AND `cards`.availability = 'paper';
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation';
SELECT t1.name  FROM cards AS t1  JOIN foreign_data AS t2 ON t1.uuid = t2.uuid  WHERE t1.artist = 'Matthew D. Wilson'  AND t1.type = 'Creature'  AND t1.layout = 'normal'  AND t1.borderColor = 'black'  AND t2.language = 'French'
SELECT COUNT(*)  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.rarity = 'rare' AND date = '2009-01-10' 
SELECT language  FROM set_translations  WHERE setCode IN (SELECT code FROM sets WHERE baseSetSize = 180 AND block LIKE 'Ravnica%')
SELECT      CAST(SUM(CASE WHEN `hasContentWarning` = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      cards  JOIN      legalities ON cards.uuid = legalities.uuid  WHERE      legalities.format = 'commander' AND legalities.status = 'legal' 
SELECT      CAST(COUNT(CASE WHEN power IS NULL OR power = '*' THEN 1 ELSE NULL END) * 100.0 / COUNT(*) AS REAL) AS PercentageWithoutPowerInFrench FROM      cards WHERE      language = 'French' 
 SELECT      CAST(SUM(CASE WHEN `type` = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`type`)  FROM      `sets` WHERE      `language` = 'Japanese'; 
SELECT availability FROM cards WHERE artist = 'Daren Bader';
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;
 SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3; 
SELECT language FROM foreign_data WHERE multiverseid = 149934;
 SELECT T1.id AS kingdom_card_id, T2.id AS kingdom_foil_id FROM cards AS T1 JOIN cards AS T2 ON T1.cardKingdomFoilId = T2.uuid WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL ORDER BY T2.id LIMIT 3; 
SELECT CAST(SUM(CASE WHEN `isTextless` = 1 AND `layout` = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM `cards` 
SELECT id FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%' AND otherFaceIds IS NULL; 
 SELECT      s.name  FROM      sets s  WHERE      s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY      s.name ASC  LIMIT 3 
SELECT DISTINCT T1.language  FROM `foreign_data` AS T1  JOIN `cards` AS T2 ON T1.uuid = T2.uuid  JOIN `sets` AS T3 ON T2.setCode = T3.code  WHERE T3.mcmName = 'Archenemy' AND T3.setCode = 'ARC'
SELECT `name`, translation FROM sets WHERE id = 5 JOIN set_translations ON sets.code = set_translations.setCode;
SELECT language, type FROM sets WHERE id = 206
 SELECT T1.code, T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode JOIN cards AS T3 ON T3.uuid = (SELECT uuid FROM foreign_data WHERE language = 'Italian' AND T1.code = T1.code) WHERE T2.language = 'Italian' AND T1.block LIKE 'Shadowmoor%' ORDER BY T1.name ASC LIMIT 2; 
SELECT `id`  FROM `sets`  WHERE `isForeignOnly` = 1 AND `language` = 'Japanese';
SELECT `name`, SUM(`baseSetSize`) AS total_cards FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`language` = 'Russian' GROUP BY `sets`.`code` ORDER BY total_cards DESC LIMIT 1;
SELECT      CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' AND T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid)  FROM      cards AS T1  JOIN      sets AS T2 ON T1.setCode = T2.code  WHERE      T2.isOnlineOnly = 1;
SELECT COUNT(*)  FROM sets  WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '')
 SELECT id  FROM cards  WHERE borderColor = 'black'; 
SELECT id FROM cards WHERE frameEffects = 'extendedart'; 
SELECT `name` FROM `cards` WHERE `borderColor` = 'black' AND `isFullArt` = 1;
SELECT `language` FROM `set_translations` WHERE `setCode` = '174';
SELECT `name` FROM `sets` WHERE `code` = 'ALL';
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar';
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT `baseSetSize`, `code` FROM `sets` WHERE `block` = 'Masques' OR `block` = 'Mirage'
SELECT `code` FROM `sets` WHERE `type` = 'expansion';
SELECT `foreign_data`.name, `cards`.type FROM `cards` JOIN `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` WHERE `cards`.watermark = 'Boros';
 SELECT T2.language, T2.flavorText, T3.type  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T1.setCode = T3.code  WHERE T1.watermark = 'colorpie' 
SELECT      CAST(SUM(CASE WHEN `convertedManaCost` = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`convertedManaCost`) AS percentage FROM      cards WHERE      `name` = 'Abyssal Horror' 
SELECT `code` FROM `sets` WHERE `type` = 'expansion' AND `block` LIKE '%commander%'
SELECT `name`, `type` FROM `cards` WHERE `watermark` = 'abzan' AND `asciiName` IS NOT NULL;
SELECT T2.language, T2.type  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.watermark = 'Azorius';
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%' AND hand LIKE '+%'
SELECT name FROM cards WHERE isTextless = 0;
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)
SELECT name  FROM cards  WHERE isPromo = 1 AND side IS NOT NULL;
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT DISTINCT T1.purchaseUrls FROM cards AS T1 WHERE T1.promoTypes LIKE '%bundle%'
 SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND (availability LIKE '%arena%') AND (availability LIKE '%mtgo%') 
SELECT MAX(`convertedManaCost`)  FROM `cards`  WHERE `name` = 'Serra Angel' OR `name` = 'Shrine Keeper'
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';
 SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3; 
SELECT `sets`.`name` FROM `sets` JOIN `cards` ON `sets`.`uuid` = `cards`.`uuid` JOIN `foreign_data` ON `cards`.`uuid` = `foreign_data`.`uuid` WHERE `cards`.`name` = 'Ancestor''s Chosen' AND `foreign_data`.`language` = 'Italian'
SELECT COUNT(*)  FROM `set_translations`  JOIN `sets` ON `set_translations.setCode` = `sets.code`  JOIN `cards` ON `sets.code` = `cards.setCode`  WHERE `cards.name` = 'Angel of Mercy';
SELECT name FROM cards JOIN set_translations ON cards.uuid = set_translations.uuid WHERE set_translations.translation = 'Hauptset Zehnte Edition';
SELECT EXISTS (     SELECT 1     FROM cards c     JOIN foreign_data fd ON c.uuid = fd.uuid     WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean' ) AS KoreanVersionExists;
 SELECT COUNT(*)  FROM cards  JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND artist = 'Adam Rex'; 
 SELECT SUM(baseSetSize)  FROM sets  WHERE translation = 'Hauptset Zehnte Edition' 
SELECT translation  FROM set_translations  WHERE setCode = '8ED' AND language = 'Chinese Simplified'
SELECT      cards.name,      sets.mtgoCode  FROM      cards  JOIN      sets ON cards.uuid = sets.uuid  WHERE      cards.name = 'Angel of Mercy' AND sets.mtgoCode IS NOT NULL;
SELECT `releaseDate` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';
SELECT `type` FROM `sets` WHERE `translation` = ' Hauptset Zehnte Edition'
SELECT COUNT(*)  FROM sets  WHERE block = 'Ice Age' AND language = 'Italian'
SELECT      c.name  FROM      cards c  JOIN      sets s ON c.setCode = s.code  WHERE      c.name = 'Adarkar Valkyrie' AND      s.isForeignOnly = 1;
 SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Italian' AND sets.baseSetSize < 10; 
 SELECT COUNT(*)  FROM cards  WHERE setCode = 'Coldsnap' AND borderColor = 'black'; 
SELECT name FROM cards WHERE setCode = 'COLD' ORDER BY convertedManaCost DESC LIMIT 1;
SELECT artist  FROM cards  JOIN sets ON cards.uuid = sets.code_translations  WHERE sets.setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') 
SELECT * FROM cards WHERE name = 'Coldsnap' AND number = 4;
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.convertedManaCost > 5 AND cards.power = '*' OR cards.power IS NULL;
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';
SELECT DISTINCT language  FROM foreign_data  WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL;
 SELECT type  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE language = 'German' AND name = 'Ancestor''s Chosen'; 
SELECT T1.text AS "Italian Ruling Text" FROM rulings AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Coldsnap' AND T1.language = 'Italian'
SELECT name  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.setCode = 'Coldsnap' AND foreign_data.language = 'Italian'  ORDER BY cards.convertedManaCost DESC  LIMIT 1;
SELECT date FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Reminisce')
SELECT      CAST(SUM(CASE WHEN `convertedManaCost` = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      `cards` WHERE      `setName` = 'Coldsnap' 
 SELECT      CAST(SUM(CASE WHEN T1.cardKingdomFoilId = T1.cardKingdomId AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.name) FROM      cards T1 WHERE      T1.name = 'Coldsnap' 
SELECT `code` FROM `sets` WHERE `releaseDate` = '2017-07-14';
SELECT keyruneCode FROM sets WHERE code = 'PKHC';
SELECT `mcmId` FROM `sets` WHERE `code` = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT `type` FROM `sets` WHERE `name` LIKE 'From the Vault: Lore'
SELECT `parentCode` FROM `sets` WHERE `name` = 'Commander 2014 Oversized';
SELECT c.name, c.text, ft.text, l.hasContentWarning FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON c.setCode = st.setCode AND st.language = 'English' JOIN rulings r ON c.uuid = r.uuid JOIN (     SELECT artist, MAX(id) as max_id     FROM cards     WHERE artist = 'Jim Pavelec'     GROUP BY artist ) j ON c.artist = j.artist AND c.id = j.max_id JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Jim Pavelec' ORDER BY c.name; 
SELECT `releaseDate` FROM `sets` WHERE `name` = 'Evacuation'
SELECT SUM(T1.baseSetSize) FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Rinascita di Alara'
SELECT `type` FROM `sets` WHERE `translation` = 'Huitième édition'
SELECT `sets`.name  FROM `sets`  JOIN `set_translations` ON `sets`.code = `set_translations`.setCode  WHERE `set_translations`.language = 'French'  AND EXISTS (     SELECT 1      FROM `cards`      JOIN `foreign_data` ON `cards`.uuid = `foreign_data`.uuid      WHERE `cards`.name = 'Tendo Ice Bridge' AND `foreign_data`.language = 'French' )
SELECT COUNT(*)  FROM set_translations  WHERE name = 'Salvat 2011' AND translation IS NOT NULL
SELECT s.name  FROM sets s  JOIN foreign_data fd ON s.code = fd.uuid  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Fellwar Stone' AND fd.language = 'Japanese'
 SELECT name  FROM cards  WHERE name = 'Journey into Nyx Hero''s Path'  ORDER BY convertedManaCost DESC  LIMIT 1; 
SELECT `releaseDate` FROM `sets` WHERE `translation` = 'Ola de frío'
SELECT `type` FROM `sets` WHERE `name` = 'Samite Pilgrim'
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND name = 'Mirrodin'
 SELECT      CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid)  FROM      sets AS T1  JOIN      cards AS T2 ON T1.code = T2.setCode  JOIN      foreign_data AS T3 ON T2.uuid = T3.uuid  WHERE      T3.language = 'Japanese' 
SELECT      CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      cards AS T1  JOIN      foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE      T2.language = 'Portuguese (Brazil)'; 
SELECT      cards.name,     cards.availability FROM      cards JOIN      artists ON cards.artist = artists.name WHERE      artists.name = 'Aleksi Briclot' AND     cards.isTextless = 1 
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)
SELECT artist  FROM cards  WHERE side IS NULL  AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL) 
SELECT MAX(frameEffects) AS MostCommonFrameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*)  FROM cards  WHERE power IN ('*', NULL) AND hasFoil = 0 AND duelDeck = 'a'; 
 SELECT `id` FROM `sets` WHERE `type` = 'commander' ORDER BY `totalSetSize` DESC LIMIT 1; 
 SELECT id, name, manaCost  FROM cards  WHERE availability LIKE '%duel%'  ORDER BY CAST(REPLACE(manaCost, '{', '') AS REAL) DESC  LIMIT 10; 
SELECT MIN(T1.originalReleaseDate) AS oldest_release_date, T2.format  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.rarity = 'mythic' AND T2.status = 'legal'
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE artist = 'Volkan Baga' AND language = 'French'
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  JOIN sets ON cards.setCode = sets.code  WHERE cards.rarity = 'rare'  AND cards.types = 'Enchantment'  AND cards.name = 'Abundance'  AND legalities.status = 'Legal'
SELECT T1.format, T2.name  FROM legalities AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T1.status = 'banned'  GROUP BY T1.format  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT language FROM sets WHERE name = 'Battlebond';
SELECT artist, format  FROM cards  GROUP BY artist  ORDER BY COUNT(*) ASC  LIMIT 1; 
SELECT `status` FROM `legalities` JOIN `cards` ON `legalities`.`uuid` = `cards`.`uuid` WHERE `cards`.`artist` = 'D. Alexander Gregory' AND `cards`.`hasContentWarning` = 1 AND `legalities`.`format` = 'legacy' AND `cards`.`frameVersion` = '1997';
 SELECT T1.name, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'banned' 
SELECT AVG(T1.id) AS average_sets_released, MAX(T2.common_language) AS common_language FROM sets AS T1 JOIN (     SELECT language     FROM sets     WHERE MAX(releaseDate) BETWEEN '2012-01-01' AND '2015-12-31' ) AS T2 ON T1.language = T2.language; 
SELECT artist  FROM cards  WHERE BorderColor = 'black' AND availability LIKE '%arena%'
SELECT T1.uuid FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'oldschool' AND T2.status IN ('banned', 'restricted') 
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
 SELECT text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE artist = 'Kev Walker'  ORDER BY date DESC 
SELECT T1.name, T3.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T2.code = T3.code WHERE T3.name = 'Hour of Devastation' AND T2.status = 'legal'
SELECT s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language NOT LIKE '%Japanese%' AND st.language = 'Korean'
SELECT      frameVersion,     name FROM      cards JOIN      legalities ON cards.uuid = legalities.uuid WHERE      artist = 'Allen Williams' AND status = 'banned'; 
 SELECT Users.DisplayName, MAX(Users.Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') 
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014; 
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00';
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1 
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1 
 SELECT COUNT(*)  FROM users  WHERE Views > 10 AND EXTRACT(YEAR FROM CreationDate) > 2013; 
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Eliciting priors from experts'
SELECT p.Title FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'csgillespie') ORDER BY p.ViewCount DESC LIMIT 1
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT SUM(CommentCount) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT MAX(p.AnswerCount) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' 
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (     SELECT Id      FROM users      WHERE DisplayName = 'csgillespie' ) AND ParentId IS NULL
SELECT u.DisplayName  FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.Age > 65 AND posts.Score >= 20 
SELECT Location FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts')
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'
SELECT Posts.Body FROM tags JOIN posts ON tags.ExcerptPostId = posts.Id WHERE tags.Count = (     SELECT MAX(Count)     FROM tags )
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
 SELECT T1.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.DisplayName = 'csgillespie' 
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'csgillespie' AND EXTRACT(YEAR FROM Date) = 2011 
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1; 
SELECT AVG(T1.Score) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT AVG(badges.Id) / COUNT(u.DisplayName) FROM badges JOIN users u ON badges.UserId = u.Id WHERE u.Views > 200 
SELECT      COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0 / COUNT(p.Id) AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 20 
SELECT COUNT(*)  FROM votes  WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;
SELECT COUNT(*)  FROM badges  WHERE Name = 'Revival';
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments) 
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910);
SELECT FavoriteCount  FROM posts  WHERE OwnerUserId = 3025 AND CreaionDate = '2014/4/23 20:29:39.0'
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ParentId = 107829 AND p.CommentCount = 1
SELECT      p.Id AS PostId,     p.Title,     p.CreationDate,     p.ClosedDate FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0' AND      p.ClosedDate IS NULL;
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = '65041')
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Tiago Pasqualini'
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;
SELECT COUNT(*)  FROM posts  WHERE Title LIKE '%data visualization%' AND PostTypeId = 1 AND Score > 0 
 SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms' 
SELECT      COUNT(p.Id) / COUNT(v.Id) AS PostToVoteRatio FROM      posts p JOIN      users u ON p.OwnerUserId = 24 JOIN      votes v ON p.Id = v.PostId WHERE      u.Id = 24 
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17;
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'SilentGhost')
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93'
SELECT c.Text  FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'; 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa' 
SELECT SUM(posts.Score) AS TotalScore, users.WebsiteUrl FROM posts JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny'
SELECT c.Text  FROM comments c JOIN postHistory ph ON c.Id = ph.PostId JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND EXISTS (     SELECT * FROM postHistory ph2 WHERE ph2.PostId = p.Id AND ph2.UserId != c.UserId AND ph2.Comment IS NOT NULL ) 
SELECT SUM(T3.BountyAmount) AS TotalBountyAmount FROM posts AS T1 JOIN votes AS T3 ON T1.Id = T3.PostId WHERE T1.Title LIKE '%data%' 
SELECT u.DisplayName  FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.BountyAmount = 50 AND v.PostId IN (     SELECT p.Id      FROM posts p      WHERE p.Title LIKE '%variance%' )
SELECT      AVG(posts.ViewCount) AS AverageViewCount,     posts.Title,     comments.Text,     comments.Score FROM      posts JOIN      tags ON posts.Id = tags.ExcerptPostId JOIN      comments ON posts.Id = comments.PostId WHERE      tags.TagName = 'humor' 
 SELECT COUNT(*) FROM comments WHERE UserId = 13; 
 SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1 
SELECT Id FROM users ORDER BY Views ASC LIMIT 1
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Supporter' AND YEAR(Date) = 2011;
SELECT COUNT(T2.UserId) FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Teacher' GROUP BY T2.UserId HAVING COUNT(T1.Name) > 5 
SELECT COUNT(DISTINCT T1.UserId)  FROM badges AS T2  JOIN users AS T1 ON T2.UserId = T1.Id  WHERE T1.Location LIKE '%New York%'  AND T2.Name IN ('Teacher', 'Supporter')
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 1;
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount >= 1000 GROUP BY u.Id, u.DisplayName HAVING COUNT(DISTINCT p.Id) = 1; 
SELECT u.DisplayName, b.Name FROM users u JOIN (     SELECT UserId, COUNT(*) AS CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId WHERE c.CommentCount = (     SELECT MAX(CommentCount)     FROM (         SELECT COUNT(*) AS CommentCount         FROM comments         GROUP BY UserId     ) cc ); 
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location LIKE '%India%' AND b.Name = 'Teacher'; 
 SELECT      ABS((COUNT(CASE WHEN YEAR(b.Date) = 2010 THEN b.Name END) / COUNT(CASE WHEN YEAR(b.Date) = 2010 THEN 1 END) * 100) -          (COUNT(CASE WHEN YEAR(b.Date) = 2011 THEN b.Name END) / COUNT(CASE WHEN YEAR(b.Date) = 2011 THEN 1 END) * 100)) AS PercentageDifference FROM badges b 
SELECT pht.PostHistoryTypeId, COUNT(DISTINCT ph.UserId) AS UniqueUsersCommented FROM postHistory pht JOIN posts ph ON pht.PostId = ph.Id WHERE ph.Id = 3720 GROUP BY pht.PostHistoryTypeId; 
 SELECT p.Id, p.ViewCount  FROM posts AS p  JOIN postLinks AS pl ON p.Id = pl.PostId  WHERE pl.RelatedPostId = 61217; 
SELECT c.Score, pl.LinkTypeId FROM comments c JOIN postLinks pl ON c.PostId = pl.PostId WHERE c.PostId = 395;
SELECT p.Id, u.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60; 
SELECT SUM(T.post.favoriteCount)  FROM posts AS T  JOIN postHistory AS PH ON T.id = PH.postId  WHERE T.ownerUserId = 686 AND YEAR(PH.CreationDate) = 2011 
SELECT      AVG(T1.UpVotes) AS UpVotesAverage,     AVG(T2.Age) AS AverageAge FROM      (     SELECT          UserId, SUM(UpVotes) AS UpVotesSum     FROM          votes v     GROUP BY          UserId     HAVING          COUNT(*) > 10     ) AS T1 JOIN      users T2 ON T1.UserId = T2.Id 
SELECT COUNT(*)  FROM badges  WHERE Name = 'Announcer'
 SELECT Name  FROM badges  WHERE Date = '2010-07-19 19:39:08.0'; 
SELECT COUNT(*) FROM comments WHERE Score > 60;
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(*)  FROM posts  WHERE Score = 10
SELECT T1.Name FROM badges AS T1 JOIN (     SELECT UserId, MAX(Reputation) AS MaxReputation     FROM users     GROUP BY UserId ) AS T2 ON T1.UserId = T2.UserId WHERE T2.MaxReputation = T1.Reputation 
SELECT u.DisplayName, u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0'; 
 SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre' 
SELECT T1.Date FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY' 
SELECT      CAST(COUNT(CASE WHEN Name = 'Teacher' THEN UserId END) AS REAL) / COUNT(UserId) * 100 FROM      badges; 
SELECT      CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT b.UserId)  FROM      badges b  JOIN      users u ON b.UserId = u.Id  WHERE      b.Name = 'Organizer' 
SELECT `Score` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:19:56.0'
SELECT `Text` FROM `comments` WHERE `CreationDate` = '2010-07-19 19:37:33.0'
SELECT u.Age  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'Vienna, Austria' AND b.Name = 'Teacher';
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age BETWEEN 19 AND 65; 
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE Date = '2010-07-19 19:39:08.0'; 
 SELECT T1.Name  FROM badges AS T1  JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.Reputation = (SELECT MIN(Reputation) FROM users) 
SELECT T3.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId JOIN badges AS T3 ON T3.Id = T2.Id WHERE T1.DisplayName = 'Sharpie' 
SELECT COUNT(*)  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE badges.Name = 'Supporter' AND users.Age > 65; 
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY'
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2010; 
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
 SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users); 
SELECT      CAST(SUM(CASE WHEN YEAR(v.CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN YEAR(v.CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio_2010_2011 FROM      votes v 
 SELECT t.TagName FROM tags AS t JOIN posts AS p ON t.ExcerptPostId = p.Id OR t.WikiPostId = p.Id JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Stauffer' 
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Daniel Vassallo'
SELECT COUNT(*)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'Harlan';
SELECT `posts`.Id FROM `posts` JOIN `users` ON `posts`.OwnerUserId = `users`.Id WHERE `users`.DisplayName = 'slashnick' ORDER BY `posts`.AnswerCount DESC LIMIT 1;
 SELECT      p.Id,     p.Title,     p.ViewCount,     u.DisplayName FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ORDER BY      p.ViewCount DESC LIMIT 1 
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'Matt Parker' AND Score > 4;
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE comments.Score < 60 AND users.DisplayName = 'Neil McGuigan' 
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.Id NOT IN (     SELECT c.PostId     FROM comments c ) 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer'
 SELECT CAST(SUM(CASE WHEN T.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM posts P JOIN tags T ON P.Id = T.ExcerptPostId WHERE P.OwnerDisplayName = 'Community' 
 SELECT      (SUM(T2.ViewCount) - SUM(T3.ViewCount)) AS ViewCountDifference FROM      users AS T1 JOIN      posts AS T2 ON T2.OwnerUserId = T1.Id JOIN      users AS T3 ON T3.DisplayName = 'Amos' WHERE      T1.DisplayName = 'Mornington' 
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'commentator' AND YEAR(Date) = 2014;
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59' 
SELECT u.DisplayName, u.Age FROM users u WHERE u.Views = (SELECT MAX(VIEWS) FROM users) 
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60; 
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Score > 60 AND c.Score > 60 
 SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location LIKE '%North Pole%' AND STRFTIME('%Y', Date) = '2011' 
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150; 
SELECT COUNT(*) AS post_history_count, MAX(p.LastEditDate) AS last_edit_date FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title LIKE '%best introductory Bayesian statistics textbook%'
SELECT u.LastAccessDate, u.Location  FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' 
SELECT p.Title FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.PostId WHERE pl.RelatedPostId IN (     SELECT pl.RelatedPostId     FROM postLinks AS pl     JOIN posts AS p ON pl.PostId = p.Id     WHERE p.Title LIKE '%How to tell if something happened in a data set which monitors a value over time%' )
 SELECT p.Id, b.Name FROM badges b JOIN users u ON u.Id = b.UserId JOIN posts p ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013 
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)
 SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.ExcerptPostId = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing' 
SELECT p.Title, pl.LinkTypeId  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE p.Title = 'What are principal component scores?'
SELECT p.OwnerDisplayName FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL) AND p.ParentId IS NOT NULL; 
 SELECT u.DisplayName, u.WebsiteUrl  FROM users u  JOIN votes v ON u.Id = v.UserId  WHERE v.VoteTypeId = 8  ORDER BY v.BountyAmount DESC  LIMIT 1; 
 SELECT Title  FROM posts  ORDER BY ViewCount DESC  LIMIT 5 
SELECT COUNT(*)  FROM tags  WHERE tags.Count BETWEEN 5000 AND 7000 
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*)  FROM votes  WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50; 
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)
SELECT P.Id, P.Score, T.Count FROM posts P JOIN (     SELECT TagName, MAX(Count) AS MaxCount     FROM tags T ) T ON T.TagName = P.Tags WHERE T.MaxCount = (     SELECT MAX(Count)     FROM tags ) ORDER BY P.Score DESC LIMIT 1;
 SELECT COUNT(p.Id) / 12 AS AverageMonthlyLinks FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE YEAR(p.CreationDate) = 2010 AND p.AnswerCount <= 2 
 SELECT p.Id FROM posts p JOIN votes v ON p.OwnerUserId = 1465 AND v.PostId = p.Id WHERE v.VoteTypeId = 2 GROUP BY p.Id ORDER BY SUM(CASE WHEN v.BountyAmount IS NULL THEN 1 ELSE 0 END) DESC LIMIT 1; 
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks) LIMIT 1;
SELECT u.DisplayName  FROM badges b JOIN users u ON b.UserId = u.Id GROUP BY u.Id ORDER BY COUNT(b.Name) DESC LIMIT 1;
SELECT MIN(v.CreationDate)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.DisplayName = 'chl'
SELECT MIN(T1.CreationDate) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM `users`)
 SELECT u.DisplayName  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date  LIMIT 1; 
SELECT COUNT(*)  FROM users  JOIN posts ON users.Id = posts.OwnerUserId  WHERE users.Location = 'United Kingdom' AND posts.FavoriteCount >= 4 
SELECT AVG(PostId)  FROM votes  WHERE UserId IN (SELECT Id                   FROM users                   ORDER BY Age DESC                   LIMIT 1)
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;
 SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT COUNT(*)  FROM posts  WHERE OwnerDisplayName = 'Jay Stevens'  AND YEAR(CreationDate) = 2010;
SELECT `posts.Id`, `posts.Title` FROM `posts` JOIN `users` ON `posts.OwnerUserId` = `users.Id` WHERE `users.DisplayName` = 'Harvey Motulsky' ORDER BY `posts.ViewCount` DESC LIMIT 1;
SELECT P.Id, P.Title FROM posts AS P WHERE P.Score = (SELECT MAX(Score) FROM posts)
SELECT AVG(p.Score)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Stephen Turner' 
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011 
 SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1; 
SELECT      CAST(COUNT(CASE WHEN u.Reputation > 1000 THEN p.Id ELSE NULL END) AS REAL) * 100 / COUNT(p.Id) AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      YEAR(p.CreationDate) = 2011; 
SELECT      CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) as Percentage FROM      users 
SELECT u.DisplayName, p.ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets' ORDER BY p.LastActivityDate DESC LIMIT 1; 
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts) 
SELECT COUNT(*)  FROM comments  WHERE PostId = (     SELECT PostId      FROM posts      ORDER BY Score DESC      LIMIT 1 ) 
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000 AND CommentCount = 0; 
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.LastEditorUserId  WHERE p.Id = 183  ORDER BY p.LastEditDate DESC  LIMIT 1; 
SELECT Name, Date  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett')  ORDER BY Date DESC  LIMIT 1;
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65  AND UpVotes > 5000; 
 SELECT      (SELECT Date FROM badges WHERE UserId = (         SELECT Id FROM users WHERE DisplayName = 'Zolomon'     )) - (         SELECT CreationDate FROM users WHERE DisplayName = 'Zolomon'     ) AS TimeToGetBadge 
SELECT COUNT(*)  FROM (     SELECT u.Id, COUNT(p.Id) AS PostsCount, COUNT(c.Id) AS CommentsCount     FROM users u     LEFT JOIN posts p ON u.Id = p.OwnerUserId     LEFT JOIN comments c ON u.Id = c.UserId     WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users)     GROUP BY u.Id ) AS UserStats; 
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 1;
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol';
SELECT COUNT(*)  FROM posts  JOIN postTags ON posts.Id = postTags.PostId  JOIN tags ON postTags.TagId = tags.Id  WHERE tags.TagName = 'careers' 
SELECT users.Reputation, posts.ViewCount FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'Jarrod Dixon';
 SELECT COUNT(*) AS total_comments  FROM comments  JOIN posts ON comments.PostId = posts.Id  WHERE posts.Title = 'Clustering 1D data';  SELECT COUNT(*) AS total_answers  FROM posts  WHERE PostTypeId = 2 AND OwnerUserId IS NOT NULL AND posts.ParentId IN (     SELECT Id FROM posts WHERE Title = 'Clustering 1D data' ); 
SELECT `CreationDate` FROM `users` WHERE `DisplayName` = 'IrishStat'
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30; 
SELECT      CAST(SUM(CASE WHEN `Score` >= 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      `posts` p  JOIN      `users` u ON p.OwnerUserId = u.Id  WHERE      u.Reputation = (SELECT MAX(Reputation) FROM `users`); 
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20; 
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';
SELECT c.Text  FROM comments AS c  JOIN posts AS p ON c.PostId = p.Id  WHERE p.Title = 'How can I adapt ANOVA for binary data?' 
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  ORDER BY c.Score DESC  LIMIT 1; 
SELECT c.CreationDate, u.Age FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%' 
SELECT COUNT(*)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score = 0 AND p.ViewCount < 5; 
SELECT COUNT(*)  FROM posts  WHERE CommentCount = 1 AND EXISTS (     SELECT 1      FROM comments      WHERE comments.PostId = posts.Id      GROUP BY comments.PostId      HAVING COUNT(comments.Id) = 1 AND comments.Score = 0 ) 
SELECT COUNT(DISTINCT c.UserId)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score = 0 AND u.Age = 40 
SELECT p.Id AS "post_id", c.Text AS "comment_text" FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'
SELECT `Votes`.BountyAmount FROM `comments`  JOIN `posts` ON `comments.PostId` = `posts.Id` JOIN `users` ON `comments.UserId` = `users.Id` JOIN `votes` ON `comments.Id` = `votes.PostId` WHERE `comments.Text` LIKE '%R is also lazy evaluated%'
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'Harvey Motulsky' 
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0; 
 SELECT      CAST(COUNT(CASE WHEN UpVotes = 0 AND Score BETWEEN 5 AND 10 THEN UserId END) AS REAL) * 100 / COUNT(CASE WHEN Score BETWEEN 5 AND 10 THEN UserId END) AS Percentage FROM      comments 
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = '3-D Man' 
SELECT COUNT(*)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength'
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200 
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id GROUP BY superhero.id HAVING COUNT(superpower.id) > 15; 
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'; 
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  WHERE s.superhero_name = 'Apocalypse'
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility'; 
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Blond'; 
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'; 
 SELECT full_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'  ORDER BY superhero.height_cm DESC  LIMIT 1; 
SELECT publisher_name FROM superhero WHERE superhero_name = 'Sauron';
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics' AND colour.colour = 'Blue' 
SELECT AVG(superhero.height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'; 
SELECT      CAST(SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)  FROM      superhero s  JOIN      hero_power hp ON s.id = hp.hero_id  JOIN      superpower sp ON hp.power_id = sp.id  WHERE      s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') 
SELECT COUNT(*)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') 
SELECT T.publisher_name FROM (     SELECT T1.publisher_id, T2.publisher_name, T1.attribute_id, T1.attribute_value     FROM (         SELECT id, attribute_name, attribute_value, publisher_id         FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id         WHERE attribute_name = 'Speed'     ) T1 JOIN publisher ON T1.publisher_id = publisher.id ) T WHERE T.attribute_value = (     SELECT MIN(T2.attribute_value)     FROM (         SELECT id, attribute_name, attribute_value, publisher_id         FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id         WHERE attribute_name = 'Speed'     ) T2 JOIN publisher ON T2.publisher_id = publisher.id ) 
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics' 
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II';
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.colour = 'Blond'; 
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence') ORDER BY hero_attribute.attribute_value ASC LIMIT 1;
SELECT race.race  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE superhero.superhero_name = 'Copycat' AND attribute.attribute_name = 'Race';
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50 
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';
SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = 100; 
SELECT superhero_name FROM (     SELECT superhero.id, COUNT(hero_power.power_id) AS power_count      FROM superhero      JOIN hero_power ON superhero.id = hero_power.hero_id      GROUP BY superhero.id      ORDER BY power_count DESC      LIMIT 1 ) AS result;
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Vampire'
SELECT      COUNT(CASE WHEN alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE NULL END) * 100.0 / COUNT(*) AS percentage FROM      superhero WHERE      alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') AND      publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') 
SELECT ABS((SELECT COUNT(*) FROM superhero WHERE publisher_id IN(SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) -             (SELECT COUNT(*) FROM superhero WHERE publisher_id IN(SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))) AS difference 
SELECT `publisher_id` FROM `publisher` WHERE `publisher_name` = 'Star Trek';
SELECT AVG(T2.attribute_value) AS average_attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id 
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.id = 75;
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS s ON hp.hero_id = s.id WHERE s.superhero_name = 'Deathlok'
SELECT AVG(T.superhero.weight_kg)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  WHERE gender.gender = 'Female' 
SELECT sp.power_name FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5; 
SELECT T1.superhero_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT superhero_name  FROM superhero  WHERE height_cm BETWEEN 170 AND 190  AND eye_colour_id = 1; 
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56;
SELECT full_name  FROM superhero  WHERE race_id IN (     SELECT id      FROM race      WHERE race = 'Demi-God' )  LIMIT 5; 
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.attribute_name = 'Bad'
SELECT T1.race  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  WHERE T2.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Weight') AND T2.attribute_value = 169; 
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.hair_colour_id  WHERE s.height_cm = 185 AND s.race = 1 
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.eye_colour_id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero) 
SELECT      CAST(COUNT(CASE WHEN s.publisher_id = 13 THEN 1 END) AS REAL) * 100 / COUNT(s.id)  FROM      superhero s WHERE      s.height_cm BETWEEN 150 AND 180; 
SELECT full_name  FROM superhero  WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero) 
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id GROUP BY power_name ORDER BY COUNT(*) DESC LIMIT 1 
SELECT attribute_value FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Abomination')
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.id = 1; 
SELECT COUNT(*)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'stealth' 
 SELECT full_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Strength'  AND hero_attribute.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Strength') 
SELECT AVG(1.0 * COUNT(s.hero_id))  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE c.id = 1;
 SELECT COUNT(*)  FROM superhero  WHERE publisher_id IN (     SELECT id      FROM publisher      WHERE publisher_name = 'Dark Horse Comics' ); 
 SELECT s.superhero_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics') ORDER BY ha.attribute_value DESC LIMIT 1; 
SELECT colour.colour FROM colour WHERE colour.id = (SELECT skin_colour_id FROM superhero WHERE full_name = 'Abraham Sapien')
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight';
SELECT      c.colour AS eye_colour,     co.colour AS hair_colour,     cs.colour AS skin_colour FROM      colour c JOIN      colour co ON c.id = superhero.eye_colour_id JOIN      colour cs ON c.id = superhero.skin_colour_id JOIN      superhero ON c.id = superhero.eye_colour_id JOIN      superhero ON co.id = superhero.hair_colour_id JOIN      superhero ON cs.id = superhero.skin_colour_id JOIN      publisher ON superhero.publisher_id = publisher.id WHERE      superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND     publisher.publisher_name = 'Dark Horse Comics' 
 SELECT s.superhero_name, p.publisher_name  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND s.hair_colour_id = c.id AND s.skin_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id; 
SELECT T3.race FROM superhero AS T1 JOIN superhero AS T2 ON T1.id = T2.id JOIN race AS T3 ON T2.race_id = T3.id WHERE T2.superhero_name = 'A-Bomb';
SELECT      CAST(SUM(CASE WHEN c.colour = 'Blue' AND g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END)  FROM      colour c  JOIN      superhero s ON c.id = s.skin_colour_id  JOIN      gender g ON g.id = s.gender_id  
SELECT superhero_name, race  FROM superhero  WHERE full_name = 'Charles Chandler';
SELECT gender.gender  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  WHERE superhero.superhero_name = 'Agent 13';
SELECT superhero.superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Adaptation'; 
SELECT COUNT(*)  FROM hero_power  JOIN superhero ON hero_power.hero_id = superhero.id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superhero.superhero_name = 'Amazo';
SELECT superpower.power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.full_name = 'Hunter Zolomon';
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT s.superhero_name  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND c.colour = 'Black' JOIN colour cc ON s.hair_colour_id = cc.id AND cc.colour = 'Black' 
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  WHERE c.colour = 'Gold' 
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Vampire')
SELECT superhero_name FROM superhero WHERE alignment = 'Neutral';
SELECT COUNT(*)  FROM hero_attribute  WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')) 
SELECT T1.race, T1.alignment FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT      CAST(SUM(CASE WHEN T.superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND T.publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T.publisher.publisher_name = 'Marvel Comics' THEN 1 END) AS Percentage FROM      superhero T JOIN      publisher ON T.publisher_id = publisher.id 
SELECT AVG(T.superhero.weight_kg)  FROM superhero  JOIN superhero ON superhero.id = superhero.superhero_id  JOIN race ON race.id = superhero.race_id  WHERE race.race = 'Alien' 
SELECT ABS((SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler')) 
SELECT superhero.superhero_name, AVG(superhero.height_cm) AS average_height FROM superhero GROUP BY superhero.superhero_name; 
SELECT sp.power_name FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.superhero_name = 'Abomination';
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  JOIN gender ON superhero.gender_id = gender.id  WHERE race.id = 21 AND gender.id = 1; 
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE attribute_name = 'Speed'  ORDER BY attribute_value DESC  LIMIT 1;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT T2.attribute_name, T2.attribute_value  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  WHERE T1.superhero_name = '3-D Man' 
SELECT s.superhero_name FROM superhero s JOIN colour c_eye ON s.eye_colour_id = c_eye.id JOIN colour c_hair ON s.hair_colour_id = c_hair.id WHERE c_eye.colour = 'Blue' AND c_hair.colour = 'Brown';
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Hawkman' OR superhero.superhero_name = 'Karate Kid' OR superhero.superhero_name = 'Speedy';
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT      CAST(SUM(CASE WHEN c.id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id)  FROM      colour c  JOIN      superhero s ON c.id = s.eye_colour_id; 
SELECT CAST(SUM(CASE WHEN T.superhero.gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T.superhero.gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero AS T; 
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);
SELECT power_id FROM superpower WHERE power_name = 'cryokinesis';
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL; 
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Karen Beecher-Duncan'; 
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'
SELECT T1.race FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Height (cm)') AND T2.attribute_value = 188 WHERE T1.weight_kg = (SELECT attribute_value FROM hero_attribute AS T3 JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Weight (kg)' AND T3.attribute_value = 108); 
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38;
SELECT T1.race  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  WHERE T2.attribute_value = (SELECT MAX(T2.attribute_value) FROM hero_attribute AS T2)
SELECT a.alignment, sp.power_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = 'Atom IV' 
SELECT full_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN colour ON hero_attribute.eye_colour_id = colour.id  WHERE attribute.attribute_name = 'Eye Colour' AND colour.colour = 'Blue'  LIMIT 5; 
SELECT AVG(T2.attribute_value)  FROM superhero AS T1  JOIN hero_attribute AS T2 ON T1.id = T2.hero_id  JOIN alignment AS T3 ON T1.alignment_id = T3.id  WHERE T3.alignment = 'Neutral' 
SELECT colour.colour  FROM colour  JOIN superhero ON colour.id = superhero.skin_colour_id  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_value = 100 AND hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence') 
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN gender ON superhero.gender_id = gender.id  WHERE alignment.id = 1 AND gender.id = 2; 
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80;
 SELECT race.race  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  JOIN gender ON superhero.gender_id = gender.id  WHERE colour.colour = 'blue' AND gender.gender = 'Male'; 
SELECT      CAST(SUM(CASE WHEN T1.gender_id = 2 AND T2.alignment_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T2.alignment_id = 2 THEN 1 END) AS percentage_female_badsuperheroes FROM      superhero AS T1 JOIN      alignment AS T2 ON T1.alignment_id = T2.id JOIN      gender AS T3 ON T1.gender_id = T3.id WHERE      T2.id = 2; 
SELECT      (         (SELECT COUNT(*) FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE c.id = 7 AND s.weight_kg = 0 OR s.weight_kg IS NULL)         -         (SELECT COUNT(*) FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE c.id = 1 AND s.weight_kg = 0 OR s.weight_kg IS NULL)     ) AS difference 
SELECT attribute_value  FROM hero_attribute  JOIN superhero ON hero_attribute.hero_id = superhero.id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE superhero.superhero_name = 'Hulk' AND attribute.attribute_name = 'Strength' 
SELECT T2.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  WHERE colour.colour = 'Green' AND superhero.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND publisher.publisher_name = 'Marvel Comics' 
SELECT superhero.superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Wind Control'  ORDER BY superhero.superhero_name ASC;
SELECT T1.gender  FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T3.power_name = 'Phoenix Force';
SELECT superhero.superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics' ORDER BY superhero.weight_kg DESC LIMIT 1; 
SELECT AVG(superhero.height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.race <> 'Human' AND publisher.publisher_name = 'Dark Horse Comics'; 
 SELECT COUNT(*)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  WHERE hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Speed') AND hero_attribute.attribute_value = 100; 
SELECT      CASE          WHEN SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)          THEN CONCAT('DC Comics has ', SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END), ' more superheroes than Marvel Comics.')         WHEN SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)          THEN CONCAT('Marvel Comics has ', SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END), ' more superheroes than DC Comics.')         ELSE 'Both publishers have the same number of superheroes.'     END AS Publisher_Comparison FROM      publisher AS T1; 
SELECT attribute.attribute_name FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1; 
 SELECT colour.colour  FROM colour  JOIN superhero ON colour.id = superhero.eye_colour_id  WHERE superhero.superhero_name = 'Abomination'; 
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero); 
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';
SELECT      CAST(SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS REAL) AS percentage_female_superheroes FROM      superhero WHERE      publisher_id IN (         SELECT id FROM publisher WHERE publisher_name = 'George Lucas'     ); 
SELECT      CAST(SUM(CASE WHEN T.superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND T.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T.superhero.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 END) AS PercentageOfGoodSuperheroes FROM      superhero AS T JOIN      alignment AS A ON T.alignment_id = A.id JOIN      publisher AS P ON T.publisher_id = P.id 
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%' 
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute); 
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';
SELECT full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN colour ON hero_attribute.attribute_id = colour.id WHERE superhero.weight_kg < 100 AND colour.colour = 'Brown' 
SELECT attribute_value FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Aquababy')
SELECT weight_kg, race FROM superhero WHERE id = 40;
SELECT AVG(height_cm) AS average_height FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.attribute_name = 'Neutral'
SELECT superhero.id AS hero_id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence';
SELECT colour.colour  FROM colour  JOIN superhero ON colour.id = superhero.eye_colour_id  WHERE superhero.superhero_name = 'Blackwulf';
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero h ON hp.hero_id = h.id  WHERE h.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero) 
 SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 18 AND T2.q1 IS NOT NULL ORDER BY T2.q1 LIMIT 5 
SELECT T2.surname  FROM qualifying AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T1.raceId = 19 AND T1.q2 IS NOT NULL  ORDER BY T1.q2  LIMIT 1
SELECT T1.year FROM `races` AS T1 JOIN `circuits` AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = 'Shanghai';
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Germany'
SELECT T3.position  FROM circuits AS T1  JOIN races AS T2 ON T1.circuitId = T2.circuitId  JOIN results AS T3 ON T2.raceId = T3.raceId  WHERE T1.constructorId = (SELECT constructorId FROM constructors WHERE name = 'Renault')
SELECT COUNT(*)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2010 AND c.country NOT IN ('Asia', 'Europe')
SELECT T2.name  FROM races AS T1  JOIN circuits AS T2 ON T1.circuitId = T2.circuitId  WHERE T2.country = 'Spain';
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Australian Grand Prix';
SELECT T1.url FROM `races` AS T1 JOIN `circuits` AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit'
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix';
SELECT T2.country  FROM constructorResults AS T1  JOIN circuits AS T2 ON T1.constructorId = T2.constructorId  WHERE T1.points = 1 AND T1.raceId = 24;
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354;
SELECT nationality  FROM drivers  JOIN qualifying ON drivers.driverId = qualifying.driverId  WHERE qualifying.q2 = '0:01:40' AND qualifying.raceId = 355;
SELECT `number` FROM `qualifying` WHERE `q3` = '01:54' AND `raceId` = 903;
 SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.statusId != 1 
 SELECT T1.url  FROM seasons AS T1  JOIN races AS T2 ON T1.year = T2.year  WHERE T2.raceId = 901 
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId FROM races WHERE date = '2015-11-29' ) AND statusId = 1;
SELECT drivers.surname, drivers.forename, drivers.dob FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 592 AND results.statusId = 1 ORDER BY drivers.dob ASC LIMIT 1
SELECT drivers.forename, drivers.surname, drivers.url FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.time = '01:27.418';
SELECT T2.nationality  FROM results AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T1.raceId = 933 AND T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933)
SELECT location, lat, lng FROM circuits WHERE name = 'Malaysian Grand Prix';
SELECT T2.url FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.points = (SELECT MAX(points) FROM constructorStandings WHERE raceId = 9)
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceId = 345;
SELECT T3.nationality FROM qualifying AS T1 JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.q2 = '0:01:15' AND T1.raceId = 347
SELECT T1.forename, T1.surname  FROM drivers AS T1  JOIN qualifying AS T2 ON T1.driverId = T2.driverId  WHERE T2.raceId = 45 AND T2.q3 = '0:01:33'
SELECT time FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE code = 'MCL') AND raceId = 743;
SELECT driver.name  FROM drivers AS driver  JOIN results ON driver.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2006  AND races.name = 'San Marino Grand Prix'  AND results.position = 2;
 SELECT T2.url  FROM races AS T1  JOIN seasons AS T2 ON T1.year = T2.year  WHERE T1.raceId = 901 
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29')
SELECT      drivers.driverId,      drivers.forename,      drivers.surname,      drivers.dob FROM      results JOIN      drivers ON results.driverId = drivers.driverId WHERE      results.raceId = 872 AND results.time IS NOT NULL ORDER BY      drivers.dob DESC LIMIT 1
SELECT drivers.forename, drivers.surname  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE results.raceId = 348 AND results.fastestLapTime = (SELECT MIN(time) FROM results WHERE raceId = 348)
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT    CAST((fastestLapSpeed(853) - fastestLapSpeed(854)) / fastestLapSpeed(853) * 100 AS REAL) AS percentage_faster FROM results WHERE raceId IN (853, 854) ORDER BY raceId DESC, fastestLapSpeed ASC LIMIT 1 
SELECT      COUNT(CASE WHEN T1.time IS NOT NULL THEN T1.driverId ELSE NULL END) / COUNT(T1.driverId) * 100 AS completion_rate FROM      races AS T1 JOIN      results AS T2 ON T1.raceId = T2.raceId WHERE      T1.date = '1983-07-16'; 
SELECT year FROM races WHERE name = 'Singapore Grand Prix' ORDER BY year ASC LIMIT 1;
SELECT COUNT(*) AS race_count, name FROM races WHERE year = 2005 ORDER BY name DESC;
 SELECT r1.name, r2.name  FROM races r1  JOIN races r2 ON r2.year = r1.year AND r2.month = r1.month AND r1.raceId < r2.raceId WHERE r1.date = (SELECT MIN(date) FROM races) 
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1;
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT `name` FROM `races` WHERE `year` = 2017 EXCEPT SELECT `name` FROM `races` WHERE `year` = 2000;
SELECT T1.country, T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year = (SELECT MIN(year) FROM races WHERE country LIKE 'European%' AND name LIKE 'Grand Prix')
SELECT year  FROM races  WHERE name = 'British Grand Prix' AND circuitId IN (     SELECT circuitId      FROM circuits      WHERE name = 'Brands Hatch' )  ORDER BY year DESC  LIMIT 1;
SELECT COUNT(*)  FROM races  WHERE circuitId IN (     SELECT circuitId      FROM circuits      WHERE name = 'Silverstone International Circuit' AND country = 'United Kingdom' ) AND name LIKE '%British Grand Prix%'
SELECT d.forename, d.surname, r.position FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Singapore Grand Prix' AND year = 2010) ORDER BY r.position; 
 SELECT T1.forename, T1.surname  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T2.points = (SELECT MAX(points) FROM results) 
 SELECT d.forename, d.surname, r.points FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races rs ON r.raceId = rs.raceId WHERE rs.year = 2017 AND rs.name = 'Chinese Grand Prix' ORDER BY r.points DESC LIMIT 3; 
SELECT drivers.forename, races.name, lapTimes.time  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  JOIN lapTimes ON results.resultId = lapTimes.raceId AND results.driverId = lapTimes.driverId  WHERE lapTimes.time = (SELECT MIN(time) FROM lapTimes);
SELECT AVG(T3.time)  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN lapTimes AS T3 ON T2.raceId = T3.raceId AND T1.driverId = T3.driverId  WHERE T1.forename = 'Sebastian' AND T1.surname = 'Vettel' AND T2.raceId = (SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND year = 2009)
 SELECT      COUNT(CASE WHEN position > 1 THEN raceId END) * 100.0 / COUNT(raceId) AS percentage FROM      results WHERE      surname = 'Hamilton' AND year >= 2010; 
SELECT      d.surname AS Driver_Name,      d.nationality AS Nationality,      AVG(r.points) AS Average_Point_Scores FROM      drivers d JOIN      driverStandings rs ON d.driverId = rs.driverId JOIN      results r ON rs.raceId = r.raceId AND d.driverId = r.driverId WHERE      rs.wins = (         SELECT              MAX(wins)          FROM              driverStandings     ) GROUP BY      d.driverId; 
SELECT MAX(YEAR(DATE()) - YEAR(`dob`) + 1) AS `age`, `forename`, `surname`  FROM `drivers`  WHERE `nationality` = 'Japanese'
SELECT DISTINCT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.year BETWEEN 1990 AND 2000  GROUP BY c.circuitId  HAVING COUNT(r.raceId) = 4 
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;
SELECT races.name AS RaceName, circuits.name AS CircuitName, circuits.location AS Location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE year = 2005 AND month(races.date) = 9;
SELECT T2.name  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  JOIN drivers AS T3 ON T3.driverId = T1.driverId  WHERE T3.code = 'YOOG' AND T1.position < 10
SELECT COUNT(*)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  JOIN circuits c ON ra.circuitId = c.circuitId  WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit' AND r.rank = 1;
SELECT T1.name, T2.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT AVG(T2.points)  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T2.year = 2000;
SELECT      r.year AS first_year,      rs.points AS points_first_race FROM      races r JOIN      results rs ON r.raceId = rs.raceId JOIN      drivers d ON rs.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY      r.year ASC LIMIT 1; 
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date; 
SELECT race.name, races.year, circuits.location  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.laps = (SELECT MAX(laps) FROM races);
SELECT      COUNT(*) FILTER (WHERE country = 'Germany') * 100.0 / COUNT(*) AS percentage FROM      races WHERE      name = 'European Grand Prix' AND     country IN ('Germany', 'European Union');
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT `location`, MAX(`lat`) AS highest_latitude  FROM circuits  WHERE `location` IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')  ORDER BY highest_latitude DESC  LIMIT 1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';
SELECT T1.country FROM circuits AS T1 WHERE T1.alt = (SELECT MAX(alt) FROM circuits)
SELECT COUNT(*) FROM drivers WHERE code IS NULL;
SELECT T1.nationality FROM drivers AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.dob = (SELECT MIN(dob) FROM drivers)
SELECT surname FROM drivers WHERE nationality = 'Italian';
SELECT url FROM drivers WHERE surname = 'Davidson' AND forename = 'Anthony';
SELECT `driverRef` FROM drivers WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton';
SELECT circuits.name  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;
 SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit' 
 SELECT      races.name AS Race_Name,      circuits.url AS Circuit_Url FROM      races JOIN      circuits ON races.circuitId = circuits.circuitId WHERE      circuits.name = 'Silverstone Circuit'; 
SELECT `date` FROM races WHERE year BETWEEN 2010 AND 2019 AND name = 'Abu Dhabi Grand Prix' AND circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Abu Dhabi International Circuit')
SELECT COUNT(*) FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')
 SELECT DISTINCT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya' 
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya' AND year = 2009;
SELECT MIN(fastestLapTime) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT `forename`, `surname` FROM `drivers` WHERE `drivers.driverId` IN (SELECT `driverId` FROM `results` WHERE `fastestLapSpeed` = (SELECT MAX(`fastestLapSpeed`) FROM `results`))
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Australian Grand Prix' AND races.year = 2008 AND results.position = 1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT T1.name AS Race_Name, MIN(T2.rank) AS Highest_Rank  FROM circuits AS T1  JOIN results AS T2 ON T1.circuitId = T2.raceId  WHERE T2.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis')  GROUP BY T1.circuitId;
SELECT MAX(T.fastestLapSpeed) AS Fastest_Lap_Speed FROM results T JOIN races R ON T.raceId = R.raceId WHERE R.year = 2009 AND R.name = 'Spanish Grand Prix';
SELECT DISTINCT T2.year FROM drivers AS T1 JOIN races AS T2 ON T1.driverId = T4.driverId JOIN results AS T4 ON T2.raceId = T4.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton';
SELECT positionOrder  FROM results  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')  AND raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)
SELECT `forename`, `surname`  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE results.grid = 4 AND results.raceId IN (     SELECT raceId      FROM races      WHERE year = 2008 AND name LIKE '%Australian Grand Prix%'  )
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE name = '2008 Australian Grand Prix') AND time IS NOT NULL;
SELECT fastestLapTime FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND fastestLap > 0;
SELECT time FROM results WHERE position = 2 AND raceId IN (SELECT raceId FROM races WHERE name = "Australian Grand Prix" AND year = 2008)
SELECT      d.surname AS Champion_Surname,     d.forename AS Champion_Forename,     c.url AS More_Information FROM      drivers d JOIN      constructorStandings cs ON d.driverId = cs.driverId AND cs.position = 1 JOIN      races r ON cs.raceId = r.raceId AND r.name = 'Australian Grand Prix' JOIN      results res ON d.driverId = res.driverId AND r.raceId = res.raceId AND res.position = 1 JOIN      constructors c ON cs.constructorId = c.constructorId WHERE      r.year = 2008;
SELECT COUNT(*)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races rs ON r.raceId = rs.raceId  WHERE d.nationality = 'American' AND rs.year = 2008 AND rs.name = 'Australian Grand Prix';
 SELECT COUNT(*)  FROM drivers  JOIN results ON drivers.driverId = results.driverId  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2008  AND races.name LIKE 'Australian Grand Prix'  AND results.time IS NOT NULL 
SELECT SUM(T2.points) AS total_points FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton';
SELECT AVG(STRFTIME('%s', fastestLapTime)) AS AverageFastestLapTime FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT CAST(SUM(CASE WHEN time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(*)  FROM races  JOIN results ON races.raceId = results.raceId  WHERE year = 2008 AND races.name = 'Australian Grand Prix' 
SELECT      (ABS(T1.fastestLapTime - T2.fastestLapTime) / T2.fastestLapTime) * 100 AS percentage_faster FROM      (         SELECT fastestLapTime FROM results WHERE driverId = 1 AND raceId = (SELECT raceId FROM races WHERE name = '2008 Australian Grand Prix' AND year = 2008)     ) T1,     (         SELECT fastestLapTime FROM results WHERE position = (SELECT MAX(position) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = '2008 Australian Grand Prix' AND year = 2008))     ) T2;
SELECT COUNT(*)  FROM circuits  WHERE location = 'Melbourne' AND country = 'Australia';
SELECT lat, lng FROM circuits WHERE country = 'USA';
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01'
SELECT AVG(T1.points)  FROM constructorResults AS T1  JOIN constructors AS T2 ON T1.constructorId = T2.constructorId  WHERE T2.nationality = 'British';
SELECT name FROM constructors WHERE constructorId = (     SELECT constructorId FROM constructorStandings ORDER BY points DESC LIMIT 1 )
SELECT T2.name FROM `constructorStandings` AS T1 JOIN `constructors` AS T2 ON T1.constructorId = T2.constructorId WHERE T1.points = 0 AND T1.raceId = 18;
SELECT COUNT(*)  FROM (     SELECT constructorId      FROM constructorResults      WHERE nationality = 'Japanese' AND points = 0     GROUP BY constructorId     HAVING COUNT(DISTINCT raceId) = 2 ) AS subquery
SELECT DISTINCT T2.name FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.position = 1;
 SELECT COUNT(*)  FROM constructors  JOIN results ON constructors.constructorId = results.constructorId  WHERE constructors.nationality = 'French' AND results.laps > 50; 
SELECT      COUNT(CASE WHEN T1.time IS NOT NULL THEN T1.driverId ELSE NULL END) * 100.0 / COUNT(T1.driverId) AS completion_percentage FROM      results AS T1 JOIN      drivers AS T2 ON T1.driverId = T2.driverId WHERE      T2.nationality = 'Japanese' AND      T1.year BETWEEN 2007 AND 2009; 
SELECT AVG(SUBSTR(TIME, 1, INSTR(TIME, ':') - 1) || SUBSTR(TIME, INSTR(TIME, ':') + 1)) AS average_time_seconds FROM results WHERE statusId = 1;
SELECT forename, surname  FROM drivers  WHERE dob > '1975-01-01' AND driverStandingsId IN (     SELECT driverStandingsId      FROM driverStandings      WHERE position = 2 )
SELECT COUNT(*)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.nationality = 'Italian' AND results.time IS NULL;
SELECT forename, surname  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE results.fastestLapTime IS NOT NULL  ORDER BY results.fastestLapTime ASC  LIMIT 1;
SELECT T3.fastestLapNumber FROM results AS T1 JOIN constructorstandings AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T4 ON T1.raceId = T4.raceId WHERE T4.year = 2009 AND T2.position = 1 LIMIT 1
SELECT AVG(T2.fastestLapSpeed) FROM `results` AS T1 INNER JOIN `drivers` AS T2 ON T1.driverId = T2.driverId WHERE T1.name = 'Spanish Grand Prix' AND T1.statusId = 1
SELECT T2.name, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1milliseconds IS NOT NULL ORDER BY T1milliseconds ASC LIMIT 1;
SELECT      COUNT(*) FILTER (WHERE year(dob) < 1985 AND laps > 50) * 100.0 /      COUNT(*) FILTER (WHERE year BETWEEN 2000 AND 2005) AS percentage FROM drivers JOIN races ON drivers.driverId = results.driverId JOIN results ON races.raceId = results.raceId WHERE year(races.year) BETWEEN 2000 AND 2005 
SELECT COUNT(*)  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE drivers.nationality = 'French' AND results.time < '02:00:00' 
SELECT `code` FROM drivers WHERE `nationality` = 'American';
SELECT raceId FROM races WHERE year = 2009;
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;
 SELECT      drivers.number,      COUNT(*) AS netherlands_drivers_count FROM      drivers JOIN      seasons ON seasons.year = drivers.dob WHERE      drivers.nationality = 'Dutch' GROUP BY      drivers.driverId ORDER BY      MIN(seasons.year) ASC LIMIT 3 
SELECT driverRef FROM drivers WHERE surname = 'Kubica' AND forename = 'Robert';
SELECT COUNT(*)  FROM drivers  WHERE dob LIKE '%1980-%' AND nationality = 'Australian';
 SELECT      d.driverId,     d.forename,     d.surname FROM      drivers d JOIN      races r ON d.driverId = r.driverId JOIN      results res ON res.driverId = d.driverId AND res.raceId = r.raceId WHERE      d.nationality = 'German' AND     d.dob BETWEEN '1980-01-01' AND '1990-12-31' AND     r.year BETWEEN 2009 AND 2022 AND     res.position = 1 AND     res.fastestLap IS NOT NULL AND     res.fastestLapTime IS NOT NULL ORDER BY      res.fastestLapTime ASC LIMIT 3; 
SELECT      MIN(d dob) AS oldest_dob,     driverRef FROM      drivers WHERE      nationality = 'German' ORDER BY      d dob ASC LIMIT 1;
SELECT driverId, code  FROM drivers  WHERE year(dob) = 1971 AND fastestLapTime IS NOT NULL;
SELECT      d.driverId,      d.forename,      d.surname,      MAX(r.time) AS latest_lap_time FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      d.nationality = 'Spanish' AND      d.dob < '1982-01-01' GROUP BY      d.driverId,      d.forename,      d.surname ORDER BY      latest_lap_time DESC LIMIT 10; 
SELECT T1.year  FROM seasons AS T1  JOIN results AS T2 ON T1.year = T2.raceId  WHERE T2.fastestLapTime IS NOT NULL  ORDER BY T2.fastestLapTime ASC  LIMIT 1
SELECT T1.year FROM `races` AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime = 'Max' GROUP BY T1.year ORDER BY T1.year LIMIT 1
SELECT driverId  FROM lapTimes  WHERE lap = 1  ORDER BY time  LIMIT 5 
SELECT COUNT(*)  FROM results  WHERE statusId = 2 AND raceId BETWEEN 50 AND 100 AND time IS NOT NULL
SELECT COUNT(*) AS count, location, lat, lng  FROM circuits  WHERE location LIKE '%Austria%' AND lat IS NOT NULL AND lng IS NOT NULL;
SELECT raceId AS "race_number" FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.driverRef, T2.nationality, T2.dob FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.q2 IS NOT NULL AND T1.raceId = 23;
SELECT T1.year, T1.name, T1.date, T1.time  FROM seasons AS T1  JOIN qualifying AS T2 ON T1.year = T2.raceId  JOIN drivers AS T3 ON T2.driverId = T3.driverId  WHERE T3.forename = 'Max' AND T3.surname = 'Verstappen'  ORDER BY T3.dob DESC  LIMIT 1
SELECT COUNT(*)  FROM results  WHERE statusId = 2 AND nationality = 'American';
 SELECT c.name, c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1; 
SELECT T2.url FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.wins = (SELECT MAX(wins) FROM constructorStandings) LIMIT 1
SELECT      d.driverId, d.forename, d.surname, r.time FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races rs ON r.raceId = rs.raceId WHERE      rs.name = 'French Grand Prix' AND      r.lap = 3 ORDER BY      r.time DESC LIMIT 1;
SELECT T1.time, T1.milliseconds FROM lapTimes AS T1 WHERE T1.lap = 1 ORDER BY T1.time LIMIT 1
SELECT AVG(T.fastestLapTime)  FROM results T  JOIN races R ON T.raceId = R.raceId  JOIN seasons S ON R.year = S.year  WHERE R.name LIKE '%United States Grand Prix%' AND S.year = 2006 AND T.position <= 10 AND T.fastestLapTime IS NOT NULL
SELECT d.driverId, d.forename, AVG(ps.duration) AS avg_duration FROM drivers d JOIN pitstops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId, d.forename ORDER BY avg_duration ASC LIMIT 5; 
SELECT T1.forename, T1.surname, T3.time  FROM drivers AS T1  JOIN results AS T2 ON T1.driverId = T2.driverId  JOIN races AS T3 ON T2.raceId = T3.raceId  WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2008 AND T2.position = 1
SELECT T2.constructorRef, T2.url  FROM races AS T1  JOIN constructorStandings AS T2 ON T1.raceId = T2.raceId  JOIN seasons AS T3 ON T1.year = T3.year  WHERE T1.name = 'Singapore Grand Prix' AND T3.year = 2009  ORDER BY T1.time LIMIT 1
SELECT drivers.forename, drivers.surname, drivers.dob  FROM drivers  WHERE drivers.nationality = 'Austrian' AND year(drivers.dob) BETWEEN 1981 AND 1991
 SELECT      drivers.forename + ' ' + drivers.surname AS FullName,     drivers.url AS WikipediaPageLink,     drivers.dob FROM      drivers WHERE      drivers.nationality = 'German' AND      drivers.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY      drivers.dob DESC; 
SELECT location, country, lat, lng FROM circuits WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Hungaroring')
 SELECT cr.points, c.name, c.nationality  FROM constructorResults AS cr  JOIN constructors AS c ON cr.constructorId = c.constructorId  JOIN races AS r ON cr.raceId = r.raceId  WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010  ORDER BY cr.points DESC LIMIT 1; 
 SELECT AVG(T1.points)  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  JOIN circuits AS T3 ON T2.circuitId = T3.circuitId  WHERE T3.country = 'Turkey' AND T1.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton') 
 SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM (     SELECT YEAR(date) AS race_year     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31' ) AS race_years GROUP BY EXTRACT(YEAR FROM date) 
SELECT nationality FROM drivers WHERE ROWID IN (     SELECT ROWID     FROM (         SELECT ROWID, COUNT(*) AS count         FROM drivers         GROUP BY nationality         ORDER BY count DESC         LIMIT 1     ) );
SELECT SUM(results.points)  FROM results  WHERE results.rank = 91 AND results.fastestLap IS NOT NULL;
SELECT T1.name FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.raceId WHERE T2.fastestLapSpeed = (SELECT MIN(fastestLapSpeed) FROM results)
SELECT `location`, `country` FROM `races` WHERE `date` = (SELECT MAX(`date`) FROM `races`)
SELECT      drivers.forename,      drivers.surname  FROM      drivers  JOIN      qualifying ON drivers.driverId = qualifying.driverId  JOIN      races ON qualifying.raceId = races.raceId  WHERE      races.name = 'Marina Bay Street Circuit' AND      races.year = 2008 AND      qualifying.position = (SELECT MIN(position) FROM qualifying WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Marina Bay Street Circuit' AND year = 2008) ORDER BY raceId, position LIMIT 1) AND      races.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Marina Bay Street Circuit') AND      qualifying.qualifyId = (SELECT MAX(qualifyId) FROM qualifying WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Marina Bay Street Circuit' AND year = 2008));
SELECT      T1.forename + ' ' + T1.surname AS full_name,     T1.nationality,     T2.name AS first_race FROM      drivers AS T1 JOIN      races AS T2 ON T1.driverId = T2.driverId WHERE      T1.dob = (SELECT MAX(dob) FROM drivers) ORDER BY      T2.date LIMIT 1;
SELECT COUNT(*)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE name = 'Canadian Grand Prix' ) AND statusId = 3
SELECT T2.forename, T2.surname FROM drivers AS T2 JOIN driverStandings AS T1 ON T2.driverId = T1.driverId WHERE T1.wins > 0 AND T2.dob = (SELECT MIN(dob) FROM drivers)
SELECT MAX(`duration`) AS `longest_time_spent_at_pitstop` FROM `pitStops`;
SELECT time FROM lapTimes ORDER BY milliseconds LIMIT 1
SELECT MAX(`duration`) AS longest_time FROM pitStops WHERE `driverId` = (SELECT `driverId` FROM drivers WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton');
SELECT lap FROM pitStops WHERE raceId = (SELECT raceId FROM races WHERE name = '2011 Australian Grand Prix') AND driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton');
 SELECT T1.driverId, T1.time AS pitStopTime FROM pitStops AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN seasons AS T3 ON T2.year = T3.year WHERE T2.name LIKE '%2011 Australian Grand Prix%' AND T3.year = 2011 
SELECT MIN(time) AS LapRecordTime FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND position = 1;
SELECT `surname`, `forename`  FROM drivers  JOIN lapTimes ON drivers.driverId = lapTimes.driverId  WHERE lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT T1.positionText FROM circuits AS T1 JOIN results AS T2 ON T1.circuitId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton') AND T2.fastestLapTime IS NOT NULL;
SELECT MIN(time) AS lap_record FROM lapTimes WHERE raceId IN (     SELECT raceId FROM races WHERE name = 'Austrian Grand Prix' ) AND position = 1;
SELECT c.name, l.time  FROM circuits c  JOIN (     SELECT raceId, MIN(time) AS min_time      FROM lapTimes      GROUP BY driverId, raceId ) l ON c.circuitId = (SELECT circuitId FROM races WHERE raceId = l.raceId) WHERE c.country = 'Italy' ORDER BY l.min_time; 
SELECT T1.name AS race_name, T2.time AS lap_record_time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T3.name = 'Austrian Grand Prix' AND T2.fastestLapTime IS NOT NULL;
SELECT T2.duration FROM circuits AS T1 JOIN pitStops AS T2 ON T1.circuitId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' AND T2.time LIKE '%Austrian Grand Prix%'
SELECT `lat`, `lng`  FROM circuits  WHERE `time` = '1:29.488' 
SELECT AVG(milliseconds)  FROM pitStops  WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(T3milliseconds)  FROM (     SELECT T1.laps, T1.milliseconds      FROM lapTimes AS T1      JOIN circuits AS T2 ON T1.circuitId = T2.circuitId      WHERE T2.country = 'Italy' ) AS subquery
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player) LIMIT 1;
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating BETWEEN 60 AND 65  AND defensive_work_rate = 'low';
 SELECT player_api_id FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) LIMIT 5; 
SELECT league.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' GROUP BY League.name ORDER BY SUM(home_team_goal + away_team_goal) DESC LIMIT 1;
SELECT home_team_api_id  FROM "Match"  WHERE season = '2015/2016' AND (home_team_goal - away_team_goal) < 0  GROUP BY home_team_api_id  ORDER BY COUNT(*) ASC  LIMIT 1
 SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.penalties = (SELECT MAX(penalties) FROM Player_Attributes) ORDER BY Player_Attributes.penalties DESC LIMIT 10; 
 SELECT away_team_api_id  FROM Match  WHERE season = '2009/2010' AND league_id IN (     SELECT id      FROM League      WHERE name = 'Scotland Premier League' )  GROUP BY away_team_api_id  HAVING SUM(CASE WHEN away_team_goal > home_team_goal THEN 1 ELSE 0 END) > ALL (     SELECT SUM(CASE WHEN away_team_goal > home_team_goal THEN 1 ELSE 0 END)      FROM Match      WHERE season = '2009/2010' AND league_id IN (         SELECT id          FROM League          WHERE name = 'Scotland Premier League'     )      GROUP BY away_team_api_id ) ORDER BY COUNT(*) DESC  LIMIT 1; 
 SELECT MAX(buildUpPlaySpeed) AS TopSpeed FROM Team_Attributes WHERE team_api_id IN (     SELECT team_api_id     FROM (         SELECT team_api_id, RANK() OVER (ORDER BY buildUpPlaySpeed DESC) AS rank         FROM Team_Attributes         WHERE buildUpPlaySpeed IS NOT NULL         LIMIT 4     ) subquery     WHERE rank = 1 ) 
SELECT league.name  FROM League  JOIN Match ON League.id = Match.league_id  WHERE Match.season = '2015/2016'  GROUP BY League.name  ORDER BY SUM(home_team_goal = away_team_goal) DESC  LIMIT 1; 
SELECT T1.player_name,         TIMESTAMPDIFF(YEAR, T1.birthday, CURRENT_DATE()) AS age FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND T2.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00' 
 SELECT League.name, COUNT(*) AS total_matches FROM Match JOIN League ON Match.league_id = League.id GROUP BY League.id ORDER BY total_matches DESC LIMIT 1; 
SELECT AVG(T.height)  FROM Player AS T  WHERE T.birthday >= '1990-01-01 00:00:00' AND T.birthday < '1996-01-01 00:00:00' 
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' AND overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC;
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59;
SELECT Team.team_long_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE strftime('%Y', Team_Attributes.date) = '2012' AND Team_Attributes.buildUpPlayPassing > (SELECT AVG(Team_Attributes.buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', Team_Attributes.date) = '2012');
SELECT      (SUM(CASE WHEN t.player_api_id IN (         SELECT p.player_api_id FROM Player p          WHERE strftime('%Y', p.birthday) BETWEEN '1987' AND '1992'     ) AND t.preferred_foot = 'left')      ) * 1.0 / COUNT(DISTINCT CASE WHEN strftime('%Y', p.birthday) BETWEEN '1987' AND '1992' THEN p.player_api_id ELSE NULL END) AS percentage_left_foot FROM Player_Attributes t JOIN Player p ON t.player_api_id = p.player_api_id 
 SELECT league_id, SUM(home_team_goal + away_team_goal) as total_goals FROM Match GROUP BY league_id ORDER BY total_goals ASC LIMIT 5 
SELECT AVG(`long_shots`)  FROM `Player_Attributes`  WHERE `player_api_id` IN (     SELECT `player_api_id`      FROM `Player`      WHERE `player_name` = 'Ahmed Samir Farag' )
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 GROUP BY p.player_api_id ORDER BY AVG(pa.heading_accuracy) DESC LIMIT 10 
SELECT T1.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (     SELECT AVG(T3.chanceCreationPassing)      FROM Team_Attributes AS T3     WHERE T3.buildUpPlayDribblingClass = 'Normal'     AND T3.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' ) ORDER BY T1.chanceCreationPassing DESC; 
SELECT L.name  FROM League AS L JOIN Match AS M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal) 
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';
SELECT player_name  FROM Player  WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10' 
SELECT attacking_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Franco Zennaro')
SELECT buildUpPlayPositioningClass FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' AND date BETWEEN '2010-02-22 00:00:00' AND '2010-12-31 23:59:59';
SELECT `finishing`  FROM `Player_Attributes`  WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francois Affolter')  AND `date` = '2014-09-18 00:00:00';
SELECT overall_rating  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas')  AND strftime('%Y', date) = '2011';
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season LIKE '2015/2016' AND League.name = 'Scotland Premier League';
SELECT preferred_foot  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.birthday = (SELECT MAX(birthday) FROM Player)
SELECT player_name FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT COUNT(*)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.weight < 130 AND Player_Attributes.preferred_foot = 'left' 
SELECT DISTINCT T.team_short_name FROM Team_Attributes TA JOIN Team T ON TA.team_api_id = T.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson')
SELECT T.player_birthday FROM Player_Attributes AS PA JOIN Player AS T ON PA.player_api_id = T.player_api_id WHERE PA.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT `name` FROM `League` WHERE `country_id` = (SELECT `id` FROM `Country` WHERE `name` = 'Netherlands')
SELECT AVG(home_team_goal)  FROM "Match"  WHERE country_id IN (SELECT id FROM Country WHERE name = 'Poland') AND season = '2010/2011';
SELECT AVG(T1.finishing) AS avg_finishing_rate FROM Player_Attributes T1 JOIN Player T2 ON T1.player_api_id = T2.player_api_id WHERE T2.height IN (SELECT MAX(height) FROM Player WHERE height IS NOT NULL) UNION SELECT AVG(T1.finishing) AS avg_finishing_rate FROM Player_Attributes T1 JOIN Player T2 ON T1.player_api_id = T2.player_api_id WHERE T2.height IN (SELECT MIN(height) FROM Player WHERE height IS NOT NULL)
SELECT T.player_name FROM `Player` AS T WHERE T.height > 180;
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%' AND weight > 170;
 SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010' 
SELECT potential  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')
SELECT player_name FROM Player WHERE player_api_id IN (     SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'left' )
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Fast'
SELECT buildUpPlayPassingClass FROM Team WHERE team_short_name = 'CLB';
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlayPassing > 70
SELECT AVG(`overall_rating`)  FROM `Player_Attributes`  WHERE strftime('%Y', `date`) BETWEEN '2010' AND '2015'  AND `height` > 170; 
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)
SELECT c.name  FROM League l  JOIN Country c ON l.country_id = c.id  WHERE l.name = 'Italy Serie A'
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')
SELECT COUNT(*)  FROM "Match"  JOIN League ON "Match".league_id = League.id  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', "Match".date) BETWEEN '2008-08' AND '2008-10';
SELECT DISTINCT T.team_short_name FROM Match M JOIN Team T ON M.home_team_api_id = T.team_api_id WHERE M.home_team_goal = 10;
SELECT player_name  FROM Player  WHERE player_api_id IN (     SELECT player_api_id      FROM Player_Attributes      WHERE potential = 61      ORDER BY balance DESC      LIMIT 1 )
SELECT      AVG(TA.ball_control) - AVG(PA.ball_control) AS Difference_Average_Ball_Control FROM      Player_Attributes PA JOIN      Player P ON PA.player_api_id = P.player_api_id JOIN      Team_Attributes TA ON P.player_fifa_api_id = TA.team_fifa_api_id WHERE      P.player_name = 'Abdou Diallo' UNION ALL SELECT      AVG(TA.ball_control) - AVG(PA.ball_control) AS Difference_Average_Ball_Control FROM      Player_Attributes PA JOIN      Player P ON PA.player_api_id = P.player_api_id JOIN      Team_Attributes TA ON P.player_fifa_api_id = TA.team_fifa_api_id WHERE      P.player_name = 'Aaron Appindangoye'
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';
SELECT player_name  FROM Player  WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada'))  ORDER BY birthday ASC  LIMIT 1;
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low' 
SELECT Country.name  FROM Country  JOIN League ON Country.id = League.country_id  WHERE League.name = 'Belgium Jupiler League';
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Germany'
SELECT player_name, MAX(overall_rating) AS strongest_overall_strength FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id;
SELECT COUNT(*)  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE strftime('%Y', Player.birthday) < '1986' AND Player_Attributes.defensive_work_rate = 'high';
SELECT player_name FROM Player_Attributes WHERE player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE `crossing` = (         SELECT MAX(`crossing`)          FROM Player_Attributes     ) )
SELECT Heading_Accuracy FROM Player_Attributes WHERE player_api_id = (SELECT id FROM Player WHERE player_name = 'Ariel Borysiuk')
SELECT COUNT(*)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.height > 180 AND Player_Attributes.volleys > 70 
SELECT player_name  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE volleys > 70 AND dribbling > 70;
SELECT COUNT(*)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Belgium' AND season = '2008/2009';
SELECT T1.long_passing FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.birthday ASC LIMIT 1
SELECT COUNT(*)  FROM "Match"  JOIN League ON "Match".league_id = League.id  WHERE League.name = 'Belgium Jupiler League'  AND strftime('%Y', "Match".date) = '2009'  AND strftime('%m', "Match".date) = '04';
 SELECT league_id  FROM Match  WHERE season = '2008/2009'  GROUP BY league_id  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE strftime('%Y', `Player`.`birthday`) < '1986' 
SELECT      ( (MAX(`overall_rating`) - (SELECT `overall_rating` FROM `Player` WHERE `player_name` = 'Paulin Puel')) / (SELECT `overall_rating` FROM `Player` WHERE `player_name` = 'Paulin Puel') ) * 100 AS percentage_increase FROM      `Player` WHERE      `player_name` = 'Ariel Borysiuk';
SELECT AVG(Team_Attributes.buildUpPlaySpeed)  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating)  FROM Player_Attributes T1  JOIN Player T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(`crossing`)  FROM `Player_Attributes`  JOIN `Player` ON `Player`.`player_api_id` = `Player_Attributes`.`player_api_id`  WHERE `Player`.`player_name` = 'Aaron Lennox'
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass  FROM Team_Attributes  WHERE team_long_name = 'Ajax'
SELECT preferred_foot FROM Player WHERE player_name = 'Abdou Diallo'
SELECT MAX(`overall_rating`)  FROM `Player_Attributes`  WHERE `player_name` = 'Dorlan Pabon'
SELECT AVG(away_team_goal)  FROM Match  WHERE away_team_api_id IN      (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma')  AND country_id IN      (SELECT id FROM Country WHERE name = 'Italy')
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating = 77 AND T1.date = '2016-06-23' ORDER BY T2.birthday ASC LIMIT 1;
SELECT overall_rating  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Mooy')  AND date = '2016-02-04 00:00:00'
SELECT potential  FROM Player_Attributes  WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'
SELECT `attacking_work_rate`  FROM `Player_Attributes`  WHERE `player_api_id` IN (     SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francesco Migliore' ) AND `date` = '2015-05-01 00:00:00'
SELECT t1.defensive_work_rate  FROM Player_Attributes AS t1  JOIN Player AS t2 ON t1.player_api_id = t2.player_api_id  WHERE t2.player_name = 'Kevin Berigaud' AND t1.date = '2013-02-22 00:00:00'
SELECT date  FROM Player_Attributes  WHERE player_api_id IN (     SELECT player_api_id      FROM Player_Attributes      WHERE player_name = 'Kevin Constant'      ORDER BY crossing DESC      LIMIT 1 )
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22 00:00:00'
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00'
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_long_name = 'FC Lorient' AND date = '2010-02-22';
SELECT chanceCreationPassingClass FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'
SELECT chanceCreationCrossingClass FROM Team_Attributes WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00'
SELECT `defence_aggression_class` FROM `team_attributes` WHERE `team_long_name` = 'Hannover 96' AND date = '2015-09-10 00:00:00'
SELECT AVG(TA.overall_rating)  FROM Player_Attributes TA  JOIN Player P ON TA.player_api_id = P.player_api_id  JOIN Team T ON TA.team_api_id = T.team_api_id  JOIN Match M ON T.team_api_id = M.home_team_api_id OR T.team_api_id = M.away_team_api_id  WHERE P.player_name = 'Marko Arnautovic' AND M.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'
SELECT      (AVG(`overall_rating` WHERE `player_name` = 'Landon Donovan') - AVG(`overall_rating` WHERE `player_name` = 'Jordan Bowery')) / AVG(`overall_rating` WHERE `player_name` = 'Landon Donovan') * 100 AS percentage_difference FROM `Player_Attributes` WHERE `date` = '2013-07-12' 
 SELECT player_name FROM Player ORDER BY height DESC LIMIT 5 
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;
SELECT player_name  FROM Player  WHERE datetime('now', 'localtime') - datetime(birthday) >= 34 
SELECT SUM(home_team_goal)  FROM "Match"  JOIN Player ON "Match".home_player_1 = Player.player_api_id  WHERE Player.player_name = 'Aaron Lennon'
SELECT SUM(T.away_team_goal)  FROM "Match" T  JOIN `Player` P1 ON T.away_player_1 = P1.player_api_id  JOIN `Player` P2 ON T.away_player_2 = P2.player_api_id  JOIN `Player` P3 ON T.away_player_3 = P3.player_api_id  JOIN `Player` P4 ON T.away_player_4 = P4.player_api_id  JOIN `Player` P5 ON T.away_player_5 = P5.player_api_id  JOIN `Player` P6 ON T.away_player_6 = P6.player_api_id  JOIN `Player` P7 ON T.away_player_7 = P7.player_api_id  JOIN `Player` P8 ON T.away_player_8 = P8.player_api_id  JOIN `Player` P9 ON T.away_player_9 = P9.player_api_id  JOIN `Player` P10 ON T.away_player_10 = P10.player_api_id  JOIN `Player` P11 ON T.away_player_11 = P11.player_api_id  WHERE (P1.player_name = 'Daan Smith' OR P2.player_name = 'Daan Smith' OR P3.player_name = 'Daan Smith' OR P4.player_name = 'Daan Smith' OR P5.player_name = 'Daan Smith' OR P6.player_name = 'Daan Smith' OR P7.player_name = 'Daan Smith' OR P8.player_name = 'Daan Smith' OR P9.player_name = 'Daan Smith' OR P10.player_name = 'Daan Smith' OR P11.player_name = 'Daan Smith')  AND (P1.player_name = 'Filipe Ferreira' OR P2.player_name = 'Filipe Ferreira' OR P3.player_name = 'Filipe Ferreira' OR P4.player_name = 'Filipe Ferreira' OR P5.player_name = 'Filipe Ferreira' OR P6.player_name = 'Filipe Ferreira' OR P7.player_name = 'Filipe Ferreira' OR P8.player_name = 'Filipe Ferreira' OR P9.player_name = 'Filipe Ferreira' OR P10.player_name = 'Filipe Ferreira' OR P11.player_name = 'Filipe Ferreira')
SELECT SUM(home_team_goal)  FROM Match  WHERE CAST(DATE('now') AS DATE) - birthday < 31 
SELECT player_name FROM Player_Attributes JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 10;
SELECT player_name FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT DISTINCT T.player_name  FROM Player_Attributes AS TA  JOIN Player AS P ON TA.player_api_id = P.player_api_id  WHERE TA.attacking_work_rate = 'high' AND P.player_api_id IN (     SELECT home_player_X1, home_player_X2, home_player_X3, home_player_X4, home_player_X5, home_player_X6, home_player_X7, home_player_X8, home_player_X9, home_player_X10, home_player_X11,             away_player_X1, away_player_X2, away_player_X3, away_player_X4, away_player_X5, away_player_X6, away_player_X7, away_player_X8, away_player_X9, away_player_X10, away_player_X11      FROM Match      WHERE (home_team_goal > 0 OR away_team_goal > 0) )
SELECT T.player_name FROM Player AS T JOIN Player_Attributes AS PA ON T.player_api_id = PA.player_api_id WHERE PA.finishing = 1 ORDER BY STRFTIME('%Y', T.birthday) DESC LIMIT 1;
SELECT T2.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id JOIN Country AS T3 ON T1.country_id = T3.id WHERE T3.name = 'Belgium'
SELECT Player.country, Player.player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player_Attributes.vision >= 90;
SELECT T.country.name FROM (     SELECT T.country_id, AVG(T.player.weight) AS avg_weight     FROM Player AS T     GROUP BY T.country_id ) AS Subquery1 JOIN Country AS T ON T.id = Subquery1.country_id WHERE Subquery1.avg_weight = (     SELECT MAX(avg_weight)     FROM (         SELECT AVG(weight) AS avg_weight         FROM Player         GROUP BY country_id     ) AS Subquery2 );
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Slow'
SELECT T.team_short_name FROM Team_Attributes AS T JOIN Team AS Te ON T.team_fifa_api_id = Te.team_fifa_api_id WHERE T.chanceCreationPassingClass = 'Safe'
SELECT AVG(T.height) AS AverageHeight FROM Player AS T JOIN Country AS C ON T.country_id = C.id WHERE C.name = 'Italy';
 SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name ASC  LIMIT 3; 
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%' AND strftime('%Y', birthday) > '1990'
SELECT ABS((SELECT jumping FROM Player_Attributes WHERE player_api_id = 6) - (SELECT jumping FROM Player_Attributes WHERE player_api_id = 23)) AS score_difference;
SELECT player_api_id  FROM Player_Attributes  WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)  AND preferred_foot = 'right' ORDER BY potential ASC  LIMIT 3 
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)  AND preferred_foot = 'left'  AND attacking_work_rate = 'high'; 
SELECT      (COUNT(*) FILTER (WHERE overall_rating > 80 AND strength > 80 AND stamina > 80) * 100.0 / COUNT(*)) AS percentage FROM      Player_Attributes 
SELECT c.name FROM League l JOIN Country c ON l.country_id = c.id WHERE l.name = 'Poland Ekstraklasa'
SELECT home_team_goal, away_team_goal  FROM Match  WHERE date LIKE '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League');
SELECT `sprint_speed`, `agility`, `acceleration` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Alexis Blin'
SELECT buildUpPlaySpeedClass FROM Team WHERE team_long_name = 'KSV Cercle Brugge'
SELECT COUNT(*)  FROM "Match"  WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')
SELECT MAX(home_team_goal)  FROM "Match"  WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie')
SELECT finishing, curve  FROM Player_Attributes  WHERE weight = (SELECT MAX(weight) FROM Player_Attributes);
 SELECT      League.name FROM      League JOIN      Match ON League.id = Match.league_id WHERE      Match.season = '2015/2016' GROUP BY      League.name ORDER BY      COUNT(Match.id) DESC LIMIT 1; 
SELECT T.team_long_name  FROM Team AS T  JOIN Match AS M ON T.team_api_id = M.away_team_api_id  WHERE M.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1)
SELECT      CAST(SUM(CASE WHEN height < 180 AND overall_strength > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Player_Attributes JOIN      Player ON Player.player_api_id = Player_Attributes.player_api_id JOIN      Team_Attributes ON Team_Attributes.team_api_id = Player.player_api_id WHERE      Player.height < 180 AND Player_Attributes.overall_strength > 70; 
SELECT      (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) -       COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) * 100.0 /      (COUNT(CASE WHEN SEX = 'M' THEN 1 END)) AS Percentage_Deviation FROM      Patient 
SELECT CAST(SUM(CASE WHEN strftime('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F' 
SELECT      COUNT(CASE WHEN Admission = '+' THEN 1 END) * 100.0 / COUNT(*) AS InpatientPercentage FROM      Patient WHERE      strftime('%Y', Birthday) BETWEEN '1930' AND '1940' 
SELECT      CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)  FROM      Patient  WHERE      Diagnosis = 'SLE'
SELECT      Diagnosis, Date  FROM      Patient  WHERE      ID = 30609; 
SELECT      Patient.SEX,     Patient.Birthday,     Examination.`Examination Date`,     Examination.Symptoms FROM      Patient JOIN      Examination ON Patient.ID = Examination.ID WHERE      Patient.ID = 163109;
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH > 500 
SELECT P.ID,         (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+';
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2 AND T1.Diagnosis IS NOT NULL;
SELECT Patient.ID FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE strftime('%Y', Patient.Birthday) = '1937' AND Laboratory.`T-CHO` >= 250 
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALB < 3.5;
SELECT      CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID)  FROM      Patient AS T1  JOIN      Examination AS T2  ON      T1.ID = T2.ID 
SELECT AVG(`aCL IgG`)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Patient.Admission = '+' AND strftime('%Y', 'now') - strftime('%Y', Patient.Birthday) >= '50' 
SELECT COUNT(*) FROM Patient WHERE YEAR(Description) = 1997 AND SEX = 'F' AND Admission = '-'
SELECT MIN(T1.Birthday) - MAX(T1.`First Date`) AS Age FROM Patient T1;
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = '1' AND p.SEX = 'F' AND strftime('%Y', e.Examination_Date) = '1997' 
SELECT      MAX(YEAR(`Patient`.Birthday)) - MIN(YEAR(`Patient`.Birthday)) FROM      `Patient` WHERE      EXISTS (         SELECT 1 FROM `Laboratory` WHERE `Laboratory`.ID = `Patient`.ID AND `Laboratory`.TG >= 200     )
SELECT Symptoms, Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = (SELECT MIN(BIRTHDAY) FROM Patient) ORDER BY Examination.Examination_Date LIMIT 1;
 SELECT      COUNT(p.ID) / 12 AS AverageMalePatientsTestedPerMonth FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      p.SEX = 'M' AND      e.Examination_Date BETWEEN '1998-01-01' AND '1998-12-31' 
SELECT `First Date`, (EXTRACT(YEAR FROM `First Date`) - EXTRACT(YEAR FROM Birthday)) AS age_when_arrived FROM Patient WHERE Diagnosis = 'SJS' ORDER BY Birthday ASC LIMIT 1;
SELECT      CAST(SUM(CASE WHEN UA <= 8.0 AND SEX = 'M' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN UA <= 6.5 AND SEX = 'F' THEN 1 ELSE 0 END) AS Ratio FROM      Patient JOIN      Examination ON Patient.ID = Examination.ID WHERE      Examination.UA <= CASE WHEN Patient.SEX = 'M' THEN 8.0 ELSE 6.5 END;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE e.ID IS NULL OR        EXTRACT(YEAR FROM e.Examination_Date) - EXTRACT(YEAR FROM p.First_Date) >= 1 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE strftime('%Y', e.Examination_Date) BETWEEN '1990' AND '1993'  AND strftime('%Y', p.Birthday) < '1990'  
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'M' AND Laboratory.`T-BIL` > '2.0'
SELECT Diagnosis  FROM Examination  WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'  GROUP BY Diagnosis  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT AVG(YEAR('1991-10-30') - YEAR(Patient.Birthday)) AS AverageAge FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Date BETWEEN '1991-10-01' AND '1991-10-30';
SELECT      CAST(DATE_PART('year', 'Examination Date') - DATE_PART('year', Birthday) AS INTEGER) AS Age,     Diagnosis FROM      Examination e JOIN      Patient p ON e.ID = p.ID WHERE      HGB = (SELECT MAX(HGB) FROM Examination);
SELECT `ANA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';
SELECT      LAB.TBIL  FROM      Laboratory LAB  WHERE      LAB.ID = 2927464 AND      LAB.Date = '1995-09-04' 
SELECT Patient.SEX  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Diagnosis = 'AORTITIS'  ORDER BY Examination.ID LIMIT 1;
SELECT T1.aCL_IgM  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T2.Diagnosis = 'SLE' AND T2.Description = '1994-02-19'  AND T1.Examination_Date = '1993-11-12'
SELECT `First Name`, `Last Name` FROM Patient WHERE SEX IN ('M', 'F') AND GPT = '9' AND Date = '1992-06-12';
SELECT      T2.Birthday - STRFTIME('%Y', T2.Description) AS age FROM      Laboratory AS T1 JOIN      Patient AS T2 ON T1.ID = T2.ID WHERE      T1.UA = '8.4' AND T1.Date = '1991-10-21'
SELECT COUNT(Laboratory.ID)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.Diagnosis = 'SJS' AND Patient.`First Date` = '1991-06-13' AND Laboratory.Date BETWEEN '1995-01-01' AND '1995-12-31' 
SELECT Patient.Diagnosis FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Date = '1997-01-27' AND Examination.Diagnosis = 'SLE' AND Patient.Description IS NULL;
SELECT Symptoms FROM Examination WHERE Examination.Date = '1993-09-27' AND ID IN (SELECT ID FROM Patient WHERE Birthday = '1959-03-01')
SELECT      (SUM(CASE WHEN Date LIKE '1981-11-%' THEN `T-CHO` END) - SUM(CASE WHEN Date LIKE '1981-12-%' THEN `T-CHO` END)) /      (SUM(CASE WHEN Date LIKE '1981-11-%' THEN `T-CHO` END) + SUM(CASE WHEN Date LIKE '1981-12-%' THEN `T-CHO` END)) * 100 AS Decrease_Rate FROM      Laboratory WHERE      Birthday = '1959-02-18';
SELECT DISTINCT p.ID  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Diagnosis = 'Behcet\'s' AND strftime('%Y', p.Description) BETWEEN '1997' AND '1997'; 
SELECT T1.ID  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.Date BETWEEN '1987-07-06' AND '1996-01-31'  AND T2.GPT > 30  AND T2.ALB < 4 
SELECT ID FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+'; 
SELECT COUNT(*)  FROM (     SELECT *      FROM Examination      WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (AVG(`aCL IgM`) * 1.2) ) AS Subquery 
SELECT      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE `U-PRO` > 0 AND `U-PRO` < 30) AS percentage FROM      Patient WHERE      UA <= 6.5; 
SELECT      CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Patient  WHERE      strftime('%Y', `First Date`) = '1981' AND      SEX = 'M' 
SELECT DISTINCT p.ID  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.`T-BIL` < 2.0 
SELECT COUNT(*)  FROM Patient  WHERE NOT (ANA_pattern = 'P') AND SEX = 'F' AND strftime('%Y', BIRTHDAY) BETWEEN '1980' AND '1989' 
SELECT T1.SEX FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'PSS' AND T2.CRP > 2 AND T2.CRE = 1 AND T2.LDH = 123;
SELECT AVG(T1.ALB)  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  JOIN Laboratory AS T3 ON T1.ID = T3.ID  WHERE T1.SEX = 'F' AND T3.PLT > 400 AND T2.Diagnosis = 'SLE'
SELECT MAX(T.Symptoms) AS MostCommonSign FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Diagnosis = 'SLE';
SELECT `Description`, Diagnosis FROM Patient WHERE ID = 48473;
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND Diagnosis = 'APS'
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE strftime('%Y', e.Examination_Date) = '1997' AND e.TP NOT BETWEEN 6 AND 8.5 
SELECT CAST(SUM(CASE WHEN T1.Diagnosis LIKE '%ITP%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.Thrombosis = 1 AND T1.Diagnosis LIKE '%SLE%' 
SELECT      CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      Patient  WHERE      YEAR(Birthday) = 1980 AND Diagnosis = 'RA'; 
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M'  AND strftime('%Y', e.`Examination Date`) BETWEEN '1995' AND '1997' AND e.Diagnosis = 'BEHCET' AND p.Admission = '-' 
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND WBC < 3.5; 
SELECT DATEDIFF('Examination Date', `First Date`) FROM Patient WHERE ID = 821298;
SELECT      Patient.ID,      Patient.SEX,      Laboratory.UA FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Patient.ID = 57266 AND      (Patient.SEX = 'M' AND Laboratory.UA > 8.0) OR      (Patient.SEX = 'F' AND Laboratory.UA > 6.5) 
SELECT `Date` FROM Laboratory WHERE ID = 48473 AND GOT >= 60;
SELECT Patient.SEX, Patient.Birthday  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GOT < 60 AND YEAR(Laboratory.Date) = 1994 
SELECT ID FROM Patient WHERE SEX = 'M' AND EXISTS (     SELECT 1 FROM Laboratory WHERE Laboratory.ID = Patient.ID AND GPT >= 60 ) 
SELECT T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC
SELECT AVG(LDH)  FROM Laboratory  WHERE LDH < 500;
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday)) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH BETWEEN 600 AND 800 
SELECT      p.ID,     p.Admission,     l.ALP FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.ALP < 300 
SELECT ID FROM Patient WHERE Birthday = '1982-04-01' AND ALP < 300 
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0; 
SELECT      ID,      SUBTRACT(TP, 8.5) AS DeviationFromNormal FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Patient.SEX = 'F' AND TP > 8.5; 
SELECT Patient.ID, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND (Laboratory.ALB <= 3.5 OR Laboratory.ALB >= 5.5) ORDER BY Patient.Birthday DESC; 
SELECT p.ID, p.Birthday, l.ALB FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE strftime('%Y', p.Birthday) = '1982' AND l.ALB BETWEEN 3.5 AND 5.5 
SELECT CAST(SUM(CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F' 
SELECT AVG(Laboratory.UA) AS Average_UA_Index FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX IN ('M', 'F') AND Patient.SEX = CASE WHEN Laboratory.UA < 8.0 THEN 'M' ELSE 'F' END AND Laboratory.UA <= CASE WHEN Patient.SEX = 'M' THEN 8.0 ELSE 6.5 END GROUP BY Laboratory.ID HAVING MAX(Laboratory.Date) IS NOT NULL 
SELECT P.ID, P.SEX, P.Birthday FROM Patient P WHERE P.ID IN (     SELECT L.ID FROM Laboratory L WHERE L.UN = 29 )
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis = 'RA' AND E.UN < 30;
SELECT COUNT(*)  FROM Patient  WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5 
SELECT      (COUNT(CASE WHEN SEX = 'M' AND CRE >= 1.5 THEN 1 END) > COUNT(CASE WHEN SEX = 'F' AND CRE >= 1.5 THEN 1 END)) AS is_more_male FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE IS NOT NULL AND Laboratory.CRE >= 1.5 
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)
SELECT COUNT(DISTINCT p.ID), CASE WHEN p.SEX = 'F' THEN 'Female' ELSE 'Male' END AS Sex FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` >= 2.0 GROUP BY Sex; 
SELECT P.ID, L.`T-CHO` FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = (SELECT MIN(Birthday) FROM Patient) AND L.`T-CHO` = (SELECT MAX(`T-CHO`) FROM Laboratory);
SELECT AVG(TIMESTAMPDIFF(YEAR, Birthday, NOW())) AS AverageAge FROM Patient WHERE SEX = 'M' AND Laboratory.`T-CHO` >= 250;
SELECT P.ID, P.Diagnosis, LAB.TG FROM Patient P JOIN Laboratory LAB ON P.ID = LAB.ID WHERE LAB.TG > 300; 
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM p.Birthday) > 50 
SELECT DISTINCT ID FROM Laboratory WHERE Admission = '-' AND CPK < 250;
SELECT COUNT(*)  FROM Patient  WHERE year(Birthday) BETWEEN '1936' AND '1956'  AND sex = 'M'  AND CPK >= 250; 
SELECT P.ID, P.SEX, EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250 
SELECT Patient.ID, Laboratory.GLU FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE strftime('%Y', Patient.Description) >= '1991' AND Laboratory.GLU < 180; 
SELECT      P.ID,      P.SEX,      P.Birthday,      DATEDIFF(CURRENT_DATE(), P.Birthday)/365 AS Age FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY      P.SEX ORDER BY      Age ASC; 
SELECT P.ID,         (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM P.Birthday)) AS Age  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE L.RBC < 3.5 AND E.Diagnosis IS NOT NULL 
SELECT p.ID, p.SEX, p.Birthday, p.Admission FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND (     EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) >= 50 ) AND (e.RBC <= 3.5 OR e.RBC >= 6.0) 
SELECT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Admission = '-' AND E.Hemoglobin < 10 
SELECT ID, SEX FROM Patient WHERE Diagnosis = 'SLE' AND HGB > 10 AND HGB < 17 ORDER BY Birthday ASC LIMIT 1;
SELECT P.ID,         TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age  FROM Patient P  JOIN (     SELECT ID      FROM Laboratory      WHERE HCT >= 52      GROUP BY ID      HAVING COUNT(*) > 2 ) AS LabExceedNormal ON P.ID = LabExceedNormal.ID 
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;
SELECT      (SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END)) AS difference FROM      Laboratory WHERE      PLT IS NOT NULL; 
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date LIKE '1984%' AND p.Birthday < DATE_TRUNC('year', CURRENT_DATE) - 50 AND l.PLT BETWEEN 100 AND 400 
SELECT      CAST(SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 1.0 / COUNT(*) * 100 AS Percentage FROM      Patient WHERE      EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM Birthday) > 55; 
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis = 0 AND Examination.Diagnosis IS NOT NULL AND strftime('%Y', Patient.`First Date`) > '1992' AND Examination.PT < 14 
SELECT COUNT(*)  FROM Examination  WHERE `Examination Date` > '1997-01-01' AND APTT >= 45; 
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.APTT IS NOT NULL AND Examination.APTT > 45 AND Patient.Thrombosis = 3 GROUP BY Examination.ID HAVING COUNT(Examination.ID) = 1 
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M'  AND e.WBC BETWEEN 3.5 AND 9.0  AND l.FG NOT BETWEEN 150 AND 450 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Birthday > '1980-01-01' AND e.FG < 150 OR e.FG > 450 
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` >= 30;
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`U-PRO` BETWEEN 0 AND 30 AND Patient.Diagnosis = 'SLE';
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.IGG < 900 AND Examination.Symptoms = 'abortion';
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.IGG BETWEEN 900 AND 2000 AND Examination.Symptoms IS NOT NULL 
SELECT Diagnosis FROM (     SELECT Diagnosis, MAX(IGA) AS MaxIGA     FROM Examination     WHERE IGA BETWEEN 80 AND 500     GROUP BY Diagnosis     ORDER BY MaxIGA DESC     LIMIT 1 ) AS Subquery 
SELECT COUNT(*)  FROM Patient  WHERE IGA BETWEEN 80 AND 500  AND strftime('%Y', `First Date`) >= '1990' 
SELECT Diagnosis  FROM Examination  WHERE `aCL IgM` NOT BETWEEN 40 AND 400  GROUP BY Diagnosis  ORDER BY COUNT(Diagnosis) DESC  LIMIT 1; 
SELECT COUNT(*)  FROM Patient  WHERE NOT (CRP LIKE '+' OR CRP LIKE '-' OR CRP < 1.0) AND Description IS NULL;
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE E.CRPT NOT IN ('+-', '-') AND E.CRPT >= 1.0 AND DATEDIFF(YEAR(CURRENT_DATE()), YEAR(P.Birthday)) < 18 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RA IN ('-', '+-') AND p.KCT = '+' 
SELECT Diagnosis  FROM Patient  WHERE YEAR(Birthday) >= 1995 AND RA IN ('-', '+-') 
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.RF < 20 AND EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM Patient.Birthday) > 60; 
SELECT COUNT(*) FROM Patient WHERE RF < 20 AND Patient.ID IN (SELECT ID FROM Examination WHERE Thrombosis = 0);
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.ANA = 256 AND e.`ANA Pattern` = 'P' 
SELECT ID FROM Patient WHERE `HCT` NOT BETWEEN 29 AND 52 ORDER BY `aCL IgA` DESC LIMIT 1;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 1 AND e.C4 > 10 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RNP = '-' OR e.RNP = '+-' AND p.Admission = '+';
SELECT MAX(`Birthday`) FROM `Patient` WHERE `Patient.ID` = (SELECT `Patient.ID` FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` WHERE `Examination.RNP` NOT IN ('-', '+-'))
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.SM IN ('-', '+-') AND e.SM != '1' AND p.Thrombosis = '1' 
SELECT Patient.ID  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.SM NOT IN ('-', '+')  ORDER BY Patient.Birthday DESC  LIMIT 3 
SELECT Examination.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Examination_Date >= '1997-01-01' AND Examination.SC170 IN ('-', '+-')
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Symptoms LIKE '%vertigo%' AND p.SEX = 'M' AND p.Diagnosis = 'SC170' AND e.Diagnosis IN ('-', '+-') 
 SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`ANA Pattern` LIKE '%SSA%' AND p.`First Date` < '1990-01-01' 
SELECT ID FROM Patient WHERE `First Date` = (SELECT `First Date` FROM Patient ORDER BY `First Date` ASC LIMIT 1) AND SSA NOT IN ('-', '+') LIMIT 1;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`ANA Pattern` LIKE '%S%' AND p.Diagnosis = 'SLE' 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`SSB` IN ('-', '+-') AND e.Symptoms IS NOT NULL 
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.`DNA-II` IN ('-', '+-')  AND Laboratory.SSB IN ('-', '+-')  AND Patient.SEX = 'M' 
SELECT Diagnosis  FROM Patient  WHERE ID IN (     SELECT ID      FROM Examination      WHERE `DNA-II` >= 8 ) 
SELECT COUNT(DISTINCT ID)  FROM Patient  WHERE Diagnosis = 'normal anti-DNA level' AND Description IS NULL 
SELECT COUNT(*)  FROM Patient  WHERE `DNA-II` >= 8 AND Admission = '+' 
SELECT CAST(SUM(CASE WHEN L.GOT >= 60 AND P.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60; 
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'M' AND Examination.GOT < 60;
SELECT MAX(Birthday) FROM Patient WHERE ID IN (     SELECT L.ID     FROM Laboratory AS L     WHERE L.GOT >= 60 )
 SELECT      Birthday FROM      Patient JOIN      (         SELECT              ID,             MAX(CASE WHEN GPT < 60 THEN GPT ELSE NULL END) AS MaxGPT         FROM              Laboratory         GROUP BY              ID     ) AS LabResults ON Patient.ID = LabResults.ID WHERE      LabResults.MaxGPT IS NOT NULL GROUP BY      Patient.Birthday ORDER BY      COUNT(*) DESC LIMIT 3 
SELECT COUNT(*)  FROM Patient  WHERE ID IN (     SELECT ID FROM Laboratory WHERE GOT < 60 ) AND SEX = 'M' 
SELECT T2.Birthday FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T2.LDH DESC LIMIT 1;
SELECT Lab.Date FROM Laboratory AS Lab WHERE Lab.ID = (SELECT MAX(ID) FROM Patient) AND Lab.LDH >= 500;
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.ALP >= 300 AND Patient.Admission = '+' 
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Admission = '-' AND e.ALP < 300; 
SELECT Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.TP < 6.0; 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE p.Diagnosis = 'SJS' AND e.TP BETWEEN 6.0 AND 8.5 
SELECT Examination.Date FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.ALB > 3.5 AND Laboratory.ALB < 5.5 ORDER BY Laboratory.ALB DESC LIMIT 1;
SELECT COUNT(*)  FROM Patient  WHERE Sex = 'M'  AND ALB > 3.5  AND ALB < 5.5  AND TP BETWEEN 6.0 AND 8.5; 
SELECT MAX(`aCL IgG`) FROM Examination WHERE `Sex` = 'F' AND ID IN (     SELECT ID FROM Laboratory WHERE UA > 6.50 AND UA IS NOT NULL )
SELECT MAX(ANA)  FROM Examination  WHERE CRE < 1.5 
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5 AND T2.`aCL IgA` = (     SELECT MAX(`aCL IgA`) FROM Examination ) 
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.`T-BIL` >= 2.0 AND l.ANA LIKE '%P%' 
SELECT T1.ANA  FROM Examination AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.`T-BIL` < 2.0 AND T2.`T-BIL` IS NOT NULL  AND T1.ID = (SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 GROUP BY T1.ID ORDER BY MAX(T2.`T-BIL`) DESC LIMIT 1)
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.`T-CHO` >= 250 AND Laboratory.KCT = '-' 
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.ANA LIKE '%P%' AND Patient.`T-CHO` < 250 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.TG < 200 AND e.Symptoms IS NOT NULL 
SELECT Diagnosis FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG < 200 ORDER BY TG DESC LIMIT 1)
SELECT ID  FROM Patient  WHERE Thrombosis = 0 AND EXISTS (     SELECT 1      FROM Laboratory      WHERE Patient.ID = Laboratory.ID AND CPK < 250 ) 
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON e.ID = l.ID  WHERE l.CPK < 250 AND        (l.KCT = '+' OR l.RVVT = '+' OR l.LAC = '+') 
SELECT Birthday FROM Patient WHERE ID = (SELECT ID FROM Patient WHERE GLU > 180 ORDER BY Birthday ASC LIMIT 1)
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Thrombosis = 0 AND Patient.GLU < 180 
SELECT COUNT(*)  FROM Patient  WHERE Admission = '+' AND `WBC` BETWEEN 3.5 AND 9.0;
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.Diagnosis = 'SLE' AND Examination.WBC BETWEEN 3.5 AND 9.0;
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0 AND Patient.Admission = '-'
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 0 AND p.Diagnosis IS NOT NULL 
SELECT P.ID, P.Birthday, L.PLT FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.PLT BETWEEN 100 AND 400 AND P.Diagnosis = 'MCTD' 
SELECT AVG(T1.PT)  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T1.SEX = 'M' AND T2.Thrombosis = 0 AND T2.PT < 14;
SELECT COUNT(*)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.Thrombosis IN (2, 1) AND Patient.Diagnosis LIKE '%severe thrombosis%' AND Examination.Diagnosis IS NOT NULL AND Examination.Diagnosis LIKE '%normal prothrombin time%' AND Patient.Diagnosis LIKE '%normal prothrombin time%' AND Examination.PT < 14;
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Engineering');
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'Art and Design Department';
 SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer' 
 SELECT T3.phone FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event JOIN `member` AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer' 
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  WHERE attendance.link_to_event = 'rec2N69DMcrqN9PJC' AND member.t_shirt_size = 'Medium' 
 SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id GROUP BY event.event_id ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT c.college  FROM member m  JOIN student_club_position scp ON m.member_id = scp.member_id  JOIN college c ON scp.college_id = c.college_id  WHERE scp.position = 'Vice President'; 
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';
SELECT COUNT(*)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE e.event_date LIKE '2019-%' AND m.first_name = 'Sacha' AND m.last_name = 'Harrison' 
SELECT COUNT(*)  FROM (     SELECT event_id     FROM attendance     GROUP BY event_id     HAVING COUNT(*) > 10 ) AS attended_events JOIN event ON event.event_id = attended_events.event_id WHERE event.type = 'Meeting' 
SELECT event_name  FROM event  JOIN (     SELECT link_to_event      FROM attendance      GROUP BY link_to_event      HAVING COUNT(*) > 20 ) AS attendance_counts ON event.event_id = attendance_counts.link_to_event; 
 SELECT AVG(T1.event_id) / COUNT(DISTINCT T1.event_name) AS AverageAttendance FROM event T1 JOIN attendance T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND STRFTIME('%Y', T1.event_date) = '2020'; 
 SELECT expense_description  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.event_status = 'Closed'  ORDER BY cost DESC  LIMIT 1; 
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering';
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud';
SELECT T1.last_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'
SELECT `county` FROM `zip_code` WHERE `zip_code` = (SELECT `zip` FROM `member` WHERE `member_id` = 'recCRWMfFqifuKMc6')
SELECT college FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE first_name = 'Tyler' AND last_name = 'Hewitt')
SELECT SUM(amount) FROM budget WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President') AND approved = 'true';
SELECT SUM(T2.spent) AS TotalSpentOnFood FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Food';
SELECT T3.city, T3.state FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders' AND T2.major_name = 'Student_Club'
SELECT member.first_name, member.last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'IL' AND member.position = 'Student_Club';
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement' AND T2.event_name = 'September Meeting' AND T2.type = 'Meeting' AND T2.status = 'Open'
SELECT `department` FROM major WHERE major_id IN (     SELECT link_to_major     FROM member     WHERE first_name = 'Pierce' OR first_name = 'Guidi' );
 SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'October Speaker' 
SELECT e.expense_id, e.expense_description, e.approved  FROM expense e JOIN event ev ON e.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08' AND e.approved IS NOT NULL 
SELECT AVG(cost) AS average_cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Elijah' AND member.last_name = 'Allen' AND MONTH(expense.expense_date) IN (9, 10) 
SELECT      (         (SELECT SUM(spent) FROM budget WHERE event_status = 'Closed' AND YEAR(event_date) = 2019)         -         (SELECT SUM(spent) FROM budget WHERE event_status = 'Closed' AND YEAR(event_date) = 2020)     ) AS "Total_Spent_Difference_2019_vs_2020" 
SELECT location FROM event WHERE event_name = 'Spring Budget Review';
SELECT cost FROM expense WHERE expense_description = 'Posters' AND event_date = '2019-09-04';
SELECT remaining FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';
SELECT COUNT(DISTINCT major_id) FROM major WHERE college = 'College of Humanities and Social Sciences';
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';
SELECT T3.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher';
SELECT COUNT(*)  FROM budget  WHERE link_to_event IN (     SELECT event_id      FROM event      WHERE event_name = 'November Meeting' ) AND remaining < 0; 
SELECT SUM(amount)  FROM budget  WHERE link_to_event = 'recI43CzsZ0Q625ma'; 
SELECT T1.event_status FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20'
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE first_name = 'Brent' AND last_name = 'Thomason';
 SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Human Development and Family Studies' AND member.t_shirt_size = 'Large'; 
SELECT T3.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielsen' AND T3.major_name = 'Outdoor Product Design and Development';
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.position = 'Vice President';
SELECT T3.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN member AS T4 ON T4.member_id = 'recZ4PkGERzl9ziHO' WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison' AND T4.first_name = 'Sacha' AND T4.last_name = 'Harrison'
SELECT T2.department  FROM `attendance` AS T1  JOIN `member` AS T2 ON T1.link_to_member = T2.member_id  WHERE T2.position = 'President';
SELECT date_received  FROM income  WHERE source = 'Dues' AND link_to_member = 'rec3pH4DxMcWHMRB7'
 SELECT first_name, last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE source = 'Dues' ORDER BY date_received ASC LIMIT 1; 
 SELECT      SUM(CASE WHEN e.event_name = 'Yearly Kickoff' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END) AS Advertisement_Yearly_Kickoff,     SUM(CASE WHEN e.event_name = 'October Meeting' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END) AS Advertisement_October_Meeting FROM      event e JOIN      budget b ON e.event_id = b.link_to_event 
SELECT      (SUM(amount WHERE category = 'Parking' AND event_name = 'November Speaker') /       (SELECT SUM(amount) FROM budget WHERE event_name = 'November Speaker')) * 100 AS percentage FROM      budget; 
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Pizza' 
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';
 SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'; 
SELECT z.city, z.county, z.state  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';
SELECT expense_description  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.remaining = (SELECT MIN(remaining) FROM budget) 
SELECT T3.first_name, T3.last_name  FROM event AS T1  JOIN attendance AS T2 ON T1.event_id = T2.link_to_event  JOIN member AS T3 ON T2.link_to_member = T3.member_id  WHERE T1.event_name = 'October Meeting'; 
 SELECT college  FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY college ORDER BY COUNT(*) DESC LIMIT 1; 
 SELECT T3.major_name  FROM member AS T1  JOIN zip_code AS T2 ON T1.zip = T2.zip_code  JOIN major AS T3 ON T1.link_to_major = T3.major_id  WHERE T1.phone = '809-555-3360' 
SELECT event_name FROM event WHERE event_id = (SELECT link_to_event FROM budget WHERE amount = (SELECT MAX(amount) FROM budget))
SELECT e.expense_description  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.position = 'Vice President';
SELECT COUNT(*) FROM `attendance` WHERE `link_to_event` = 'rec2N69DMcrqN9PJC';
SELECT date_received FROM income WHERE member_id = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason')
 SELECT COUNT(*) FROM zip_code WHERE state = 'MD'; 
 SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  WHERE member.phone = '954-555-6240' 
SELECT `first_name`, `last_name` FROM `member` WHERE `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `department` = 'School of Applied Sciences, Technology and Education')
SELECT      e.event_name FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      e.status = 'Closed' ORDER BY      DIVIDE(b.spent, b.amount) DESC LIMIT 1;
SELECT COUNT(*)  FROM member  WHERE position = 'President';
SELECT MAX(spent) FROM budget;
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020';
 SELECT SUM(spent)  FROM budget  WHERE category = 'Food' 
SELECT T2.first_name, T2.last_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T1.link_to_member HAVING COUNT(T1.link_to_event) > 7; 
SELECT DISTINCT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater';
SELECT `first_name`, `last_name` FROM `member` JOIN `zip_code` ON `member`.zip = `zip_code`.zip_code WHERE `city` = 'Georgetown' AND `state` = 'SC';
 SELECT COUNT(*)  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour' 
SELECT first_name, last_name FROM member WHERE member_id IN (     SELECT link_to_member FROM income WHERE amount > 40 )
SELECT SUM(cost) AS TotalExpense FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.category = 'Baseball game';
SELECT m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'Yearly Kickoff';
 SELECT m.first_name, m.last_name, i.source, MAX(i.amount)  FROM member m  JOIN income i ON m.member_id = i.link_to_member  GROUP BY m.member_id  ORDER BY MAX(i.amount) DESC  LIMIT 1; 
SELECT event_name FROM (     SELECT event_name, MIN(cost) AS min_cost FROM event e     JOIN expense exp ON e.event_id = exp.link_to_event ) AS subquery WHERE min_cost = (     SELECT MIN(cost) FROM expense );
SELECT      (SUM(cost WHERE event_name = 'Yearly Kickoff') /      (SELECT SUM(cost) FROM expense)) * 100 AS percentage_cost_yearly_kickoff 
 SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major 
 SELECT source, MAX(amount) AS max_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY max_amount DESC LIMIT 1; 
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';
SELECT COUNT(*) FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching';
SELECT COUNT(DISTINCT link_to_member)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater' AND STRFTIME('%Y', event.event_date) = '2019';
 SELECT COUNT(*) AS num_events_attended FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Luisa' AND last_name = 'Guidi') 
 SELECT AVG(b.remaining)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.status = 'Closed' AND b.category = 'Food' 
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1;
SELECT COUNT(*) FROM attendance WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer') AND link_to_member = (SELECT member_id FROM member WHERE first_name = 'Maya' AND last_name = 'Mclean');
SELECT      CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) AS percentage_share FROM      event WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31' 
SELECT expense.cost  FROM expense  JOIN budget ON expense.link_to_budget = budget.budget_id  WHERE budget.category = 'Posters' AND expense.expense_description = 'Posters' AND budget.event_status = 'Closed';
SELECT t_shirt_size  FROM member  GROUP BY t_shirt_size  ORDER BY COUNT(*) DESC  LIMIT 1; 
 SELECT T1.event_name  FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1 
SELECT b.category, SUM(e.cost) AS total_value FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND e.approved = 'true' GROUP BY b.category; 
SELECT category  FROM budget  WHERE link_to_event = 'recI43CzsZ0Q625ma'  ORDER BY amount ASC; 
SELECT budget_id, category, amount  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1;
 SELECT budget_id, category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3; 
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Parking'; 
SELECT SUM(cost)  FROM expense  WHERE expense_date = '2019-08-20' 
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id; 
SELECT expense_description FROM expense WHERE link_to_member = 'recdIBgeU38UbV2sy'
SELECT expense_description  FROM expense  JOIN member ON expense.link_to_member = member.member_id  WHERE member.t_shirt_size = 'X-Large'; 
SELECT z.short_state  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost < 50 
SELECT T.major_name FROM `member` AS T1 JOIN `major` AS T ON T1.link_to_major = T.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'
SELECT T1.position  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T2.major_name = 'Business' 
 SELECT COUNT(*)  FROM member  WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business')  AND t_shirt_size = 'Medium'; 
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30 
SELECT `type` FROM event WHERE `location` = 'MU 215';
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00'
SELECT m.major_name  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Vice' AND mem.last_name = 'President' AND mem.position = 'Vice President';
SELECT      (SUM(CASE WHEN position = 'Member' AND major_name = 'Mathematics' THEN 1 ELSE 0 END)      / CAST(COUNT(member_id) AS REAL)) * 100 AS percentage_members_mathematics FROM      member  JOIN      major ON member.link_to_major = major.major_id; 
 SELECT event.category  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event.location = 'MU 215' 
SELECT COUNT(*)  FROM income  WHERE amount = 50
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';
 SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education'; 
SELECT T1.last_name, T2.major_name, T2.department, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'; 
SELECT b.category FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0; 
SELECT T1.city, T1.state FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip JOIN major AS T3 ON T3.major_id = T2.link_to_major WHERE T3.department = 'Electrical and Computer Engineering Department' AND T2.position = 'Member';
SELECT ev.event_name FROM event ev JOIN attendance a ON ev.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN zip_code zc ON m.zip = zc.zip_code WHERE m.position = 'Vice President' AND ev.type = 'Social' AND zc.location = '900 E. Washington St.';
 SELECT T1.last_name, T1.position  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.expense_description = 'Pizza' AND T2.expense_date = '2019-09-10'; 
 SELECT T1.last_name  FROM member AS T1  JOIN attendance AS T2 ON T1.member_id = T2.link_to_member  JOIN event AS T3 ON T2.link_to_event = T3.event_id  WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Member' 
SELECT      CAST(SUM(CASE WHEN amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM      income JOIN      member ON income.link_to_member = member.member_id WHERE      member.t_shirt_size = 'Medium' AND member.position = 'Member' 
SELECT DISTINCT T2.state FROM zip_code AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.type = 'PO Box' 
SELECT DISTINCT z.zip_code FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE z.city = 'San Juan' AND z.county = 'San Juan Municipio' AND z.state = 'Puerto Rico' AND z.type = 'PO Box' 
SELECT event_name  FROM event  WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';
SELECT T1.link_to_event FROM `attendance` AS T1 JOIN `expense` AS T2 ON T1.link_to_event = T2.link_to_budget WHERE T2.cost > 50 
 SELECT T1.first_name, T1.last_name, T2.link_to_event  FROM member AS T1  JOIN (     SELECT T3.link_to_member      FROM expense AS T3      WHERE T3.approved = 'true' AND T3.expense_date BETWEEN '2019-01-10' AND '2019-11-19' ) AS T2 ON T1.member_id = T2.link_to_member 
 SELECT T3.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Katy' AND T2.major_id = 'rec1N0upiVLy5esTO' 
SELECT T1.phone FROM `member` AS T1 INNER JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business' 
SELECT DISTINCT income.notes, member.email  FROM income  JOIN member ON income.link_to_member = member.member_id  WHERE income.date_received BETWEEN '2019-09-10' AND '2019-11-19'  AND income.amount > 20; 
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'education' AND member.position = 'Member';
SELECT      CAST(SUM(CASE WHEN `remaining` < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) AS percentage_over_budget FROM      budget WHERE      event_status = 'Closed'; 
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31' 
SELECT expense_description  FROM expense  WHERE (SUM(cost) / COUNT(expense_id)) > 50 
 SELECT first_name, last_name  FROM member  WHERE t_shirt_size = 'X-Large'; 
SELECT      CAST(SUM(CASE WHEN zip_code.type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code.zip_code) AS percentage_po_boxes FROM      zip_code; 
SELECT event.event_name, event.location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0;
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100 
 SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100 
SELECT T1.city, T1.country  FROM zip_code AS T1  JOIN attendance AS T2 ON T1.zip_code = SUBSTR(T2.link_to_event, 3, 5)  JOIN event AS T3 ON T2.link_to_event = T3.event_id  WHERE T3.amount > 40  GROUP BY T1.zip_code; 
SELECT T1.first_name, T1.last_name, SUM(T2.cost) AS total_expense FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(T2.expense_id) > 1 ORDER BY total_expense DESC LIMIT 1; 
SELECT AVG(cost)  FROM expense  WHERE link_to_member IN (     SELECT member_id      FROM member      WHERE position != 'Member' ) 
SELECT event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Parking' AND budget.cost < (SELECT AVG(cost) FROM budget WHERE category = 'Parking') 
SELECT      (SUM(cost) OVER () * 100 / COUNT(event_id) OVER ()) AS percentage FROM      event WHERE      type = 'Game'; 
SELECT b.budget_id, b.category, MAX(e.cost) AS max_cost FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' GROUP BY b.budget_id, b.category ORDER BY max_cost DESC LIMIT 1; 
 SELECT m.first_name, m.last_name  FROM member m JOIN (     SELECT link_to_member, SUM(cost) AS total_spent     FROM expense     GROUP BY link_to_member     ORDER BY total_spent DESC     LIMIT 5 ) e ON m.member_id = e.link_to_member 
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > (SELECT AVG(cost) FROM expense) 
SELECT      (SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END) * 1.0 / COUNT(CASE WHEN position = 'Member' THEN 1 END) -      SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) * 1.0 / COUNT(CASE WHEN position = 'Member' THEN 1 END)) * 100 AS percentage_difference FROM member JOIN zip_code ON member.zip = zip_code.zip_code 
SELECT major_name, department FROM major WHERE major_id = (SELECT link_to_major FROM member WHERE first_name = 'Garrett' AND last_name = 'Gerke')
SELECT T1.first_name, T1.last_name, T2.cost FROM `member` AS T1  JOIN `expense` AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.expense_description = 'Water, Veggie tray, supplies'
SELECT T1.last_name, T1.phone  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  WHERE T2.major_name = 'Elementary Education' 
SELECT category, amount FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'January Speaker') AND event_status = 'Closed';
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food';
 SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09' 
SELECT budget.category  FROM budget  JOIN expense ON budget.budget_id = expense.link_to_budget  WHERE expense.expense_description = 'Posters';
SELECT T1.first_name, T1.last_name, T3.college  FROM member AS T1  JOIN major AS T2 ON T1.link_to_major = T2.major_id  JOIN zip_code AS T3 ON T1.zip = T3.zip_code  WHERE T1.position = 'Secretary' 
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name; 
SELECT `city` FROM `member` WHERE `first_name` = 'Garrett' AND `last_name` = 'Girke';
SELECT first_name, last_name, position FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE city = 'Lincolnton' AND state = 'North Carolina';
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';
SELECT      CAST(SUM(CASE WHEN `Currency` = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN `Currency` = 'CZK' THEN 1 ELSE 0 END) AS ratio FROM      customers WHERE      `Currency` IN ('EUR', 'CZK'); 
SELECT c.CustomerID, c.Segment, SUM(ym.Consumption) as TotalConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID AND STRFTIME('%Y', ym.Date) = '2012' WHERE c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT AVG(y.Consumption) / 12 AS AvgMonthlyConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND strftime('%Y', y.Date) = '2013' GROUP BY strftime('%Y', y.Date), y.CustomerID ORDER BY y.CustomerID, y.Date; 
SELECT c.CustomerID, c.Segment, c.Currency, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID, c.Segment, c.Currency ORDER BY TotalConsumption DESC LIMIT 1; 
SELECT COUNT(DISTINCT CustomerID)  FROM yearmonth  WHERE CustomerID IN (     SELECT CustomerID      FROM customers      WHERE Segment = 'KAM' ) AND Consumption < 30000 AND Date BETWEEN '201201' AND '201212' 
SELECT      SUM(CASE WHEN T2.Currency = 'CZK' THEN T1.Consumption ELSE 0 END) - SUM(CASE WHEN T2.Currency = 'EUR' THEN T1.Consumption ELSE 0 END) AS ConsumptionDifference FROM      yearmonth AS T1 JOIN      customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE      STRFTIME('%Y', T1.Date) = '2012' 
SELECT strftime('%Y', Date) AS Year, SUM(Consumption) AS TotalGasUse FROM yearmonth WHERE Currency = 'EUR' GROUP BY Year ORDER BY TotalGasUse DESC LIMIT 1; 
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;
SELECT `Year` = LEFT(Date, 4), MAX(Consumption)  FROM yearmonth  WHERE `Currency` = 'CZK'  GROUP BY `Year`  ORDER BY SUM(Consumption) DESC  LIMIT 1;
SELECT Date  FROM yearmonth  WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date LIKE '2013%'  ORDER BY Consumption DESC  LIMIT 1;
WITH  LeastConsumptionPerSegment AS (     SELECT          Segment,         AVG(Consumption) AS AnnualAverageConsumption     FROM          yearmonth     WHERE          Date BETWEEN '201301' AND '201312'     GROUP BY          Segment ), LeastConsumptionValues AS (     SELECT          Segment,         MIN(AnnualAverageConsumption) AS MinAnnualAverageConsumption     FROM          LeastConsumptionPerSegment ), DifferenceInConsumption AS (     SELECT          'SME' AS Segment1,         'LAM' AS Segment2,         AVG(t1.MinAnnualAverageConsumption - t2.MinAnnualAverageConsumption) AS Difference     FROM          LeastConsumptionValues t1,         LeastConsumptionValues t2     WHERE          t1.Segment = 'SME' AND         t2.Segment = 'LAM' ), SecondQuery AS (     SELECT          'LAM' AS Segment1,         'KAM' AS Segment2,         AVG(t1.MinAnnualAverageConsumption - t2.MinAnnualAverageConsumption) AS Difference     FROM          LeastConsumptionValues t1,         LeastConsumptionValues t2     WHERE          t1.Segment = 'LAM' AND         t2.Segment = 'KAM' ), ThirdQuery AS (     SELECT          'KAM' AS Segment1,         'SME' AS Segment2,         AVG(t1.MinAnnualAverageConsumption - t2.MinAnnualAverageConsumption) AS Difference     FROM          LeastConsumptionValues t1,         LeastConsumptionValues t2     WHERE          t1.Segment = 'KAM' AND         t2.Segment = 'SME' ) SELECT      * FROM DifferenceInConsumption UNION ALL SELECT * FROM SecondQuery UNION ALL SELECT * FROM ThirdQuery; 
SELECT      c.Segment,     MAX((ym.Consumption_2013 - ym.Consumption_2012) / ym.Consumption_2013 * 100) AS Max_Percentage_Increase,     MIN((ym.Consumption_2013 - ym.Consumption_2012) / ym.Consumption_2013 * 100) AS Min_Percentage_Increase FROM      customers c JOIN      (SELECT          ym.CustomerID,         SUM(CASE WHEN STRFTIME('%Y', ym.Date) = '2012' THEN ym.Consumption ELSE 0 END) AS Consumption_2012,         SUM(CASE WHEN STRFTIME('%Y', ym.Date) = '2013' THEN ym.Consumption ELSE 0 END) AS Consumption_2013     FROM          yearmonth ym     GROUP BY          ym.CustomerID) ym ON c.CustomerID = ym.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      c.Segment ORDER BY      Max_Percentage_Increase DESC, Min_Percentage_Increase ASC LIMIT 1; 
SELECT SUM(Consumption)  FROM yearmonth  WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311' 
SELECT      COUNT(*)  FROM      gasstations  WHERE      Country = 'CZE' AND Segment = 'Discount'; 
SELECT      (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') -      (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS ConsumptionDifference;
SELECT      SUM(CASE WHEN `Currency` = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN `Currency` = 'EUR' THEN 1 ELSE 0 END) AS difference FROM      customers WHERE      Segment = 'SME'; 
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1; 
SELECT T1.CustomerID, SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T1.CustomerID ORDER BY TotalConsumption DESC LIMIT 1; 
SELECT SUM(Consumption)  FROM yearmonth  WHERE Date = '201305' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM')
SELECT      (COUNT(*) FILTER (WHERE `Consumption` > 46.73 AND Segment = 'LAM') * 100.0 / COUNT(*) FILTER (WHERE Segment = 'LAM')) AS percentage FROM      yearmonth; 
SELECT T2.Country, COUNT(T1.GasStationID) AS CountValueForMoneyGasStations FROM gasstations AS T1 JOIN (     SELECT ChainID     FROM gasstations     WHERE Segment = 'Value for money' ) AS T2 ON T1.ChainID = T2.ChainID GROUP BY T2.Country; 
SELECT      COUNT(*) FILTER (WHERE customers.Segment = 'KAM' AND customers.Currency = 'EUR') * 100.0 /      COUNT(*) FILTER (WHERE customers.Segment = 'KAM') AS percentage FROM      customers JOIN      transactions_1k ON customers.CustomerID = transactions_1k.CustomerID 
SELECT      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM yearmonth WHERE Date LIKE '201202')  FROM      yearmonth  WHERE      Date LIKE '201202' AND Consumption > 528.29999999999995453; 
SELECT      CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      gasstations  WHERE      Country = 'SVK' 
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1; 
SELECT c.Segment FROM customers c JOIN (     SELECT ym.CustomerID, SUM(ym.Consumption) as total_consumption     FROM yearmonth ym     WHERE ym.Date = '201309'     GROUP BY ym.CustomerID ) t ON c.CustomerID = t.CustomerID ORDER BY t.total_consumption ASC LIMIT 1; 
SELECT T1.CustomerID, T1.Segment, SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T2.Date = '201206' WHERE T1.Segment = 'SME' GROUP BY T1.CustomerID ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT MAX(Consumption)  FROM yearmonth  WHERE Date LIKE '2012%'
SELECT MAX(TY.Consumption * 12) AS MaxAnnualConsumption FROM yearmonth AS YM JOIN customers AS C ON YM.CustomerID = C.CustomerID WHERE C.Currency = 'EUR' 
SELECT T3.Description FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T3.ProductID = T1.ProductID WHERE T1.Date = '201309'
SELECT T2.Country  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID AND T1.Date = T3.Date  WHERE T3.Date LIKE '201306'  
SELECT T2.ChainID, T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Price > 0 AND T1.Currency = 'EUR' 
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE T2.Price > 0 AND ROUND(T2.Price, 2) * 1 == T2.Amount AND T2.Currency = 'EUR'
SELECT AVG(`Price`)  FROM transactions_1k  WHERE `Date` LIKE '2012-01%'
SELECT COUNT(DISTINCT T1.CustomerID)  FROM `transactions_1k` AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Currency = 'EUR' AND T1.Consumption > 1000 
 SELECT T1.Description  FROM products AS T1  JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID  JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID  WHERE T3.Country = 'CZE'; 
SELECT DISTINCT Time  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.ChainID = 11 
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000 
SELECT COUNT(*)  FROM transactions_1k t1k  JOIN gasstations g ON t1k.GasStationID = g.GasStationID  WHERE g.Country = 'CZE' AND t1k.Date > '2012-01-01' 
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE'; 
SELECT AVG(T1.Amount) AS AverageTotalPrice FROM transactions_1k T1 JOIN customers T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' 
SELECT t1.CustomerID FROM transactions_1k AS t1 JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID AND SUBSTR(t1.Date, 1, 10) = '2012-08-25' WHERE t1.Date = '2012-08-25' ORDER BY t1.Amount DESC LIMIT 1 
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' AND T1.CustomerID IN (     SELECT T3.CustomerID     FROM transactions_1k AS T3     WHERE T3.Date = '2012-08-24' ) AND NOT EXISTS (     SELECT 1     FROM transactions_1k AS T4     WHERE T4.Date > '2012-08-25' AND T4.CustomerID = T1.CustomerID );
SELECT T1.Currency  FROM customers AS T1  JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00' 
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00';
SELECT COUNT(*)  FROM transactions_1k  WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Price <> 0 AND Price IS NOT NULL AND Currency = 'EUR'; 
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)
SELECT T2.Country  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';
SELECT ym.Consumption, tr.Amount  FROM yearmonth ym  JOIN transactions_1k tr ON ym.CustomerID = tr.CustomerID AND ym.Date = '2012-08-24'  WHERE tr.Amount = 124.05  JOIN customers c ON ym.CustomerID = c.CustomerID  WHERE c.Date LIKE '2012-01-%' 
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE Date = '2012-08-26' AND Time BETWEEN '08:00:00' AND '09:00:00' AND Country = 'CZE' 
SELECT T2.Currency  FROM transactions_1k AS T1  JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID  JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID AND T3.Date LIKE '201306%'  WHERE T1.Amount * T3.Consumption = 214582.17  GROUP BY T2.CustomerID  HAVING COUNT(T1.TransactionID) = 1; 
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467;
SELECT T1.Currency  FROM customers AS T1  JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T2.Date = '2012-08-24' AND T2.Amount = 548.4 
SELECT      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers) AS percentage FROM      customers JOIN      transactions_1k ON customers.CustomerID = transactions_1k.CustomerID WHERE      Date = '2012-08-25' AND      Currency = 'EUR'; 
SELECT      (y2012.consumption - y2013.consumption) / y2012.consumption AS consumption_decrease_rate FROM     (SELECT          CustomerID, SUM(Price) AS consumption      FROM          transactions_1k      WHERE          Date = '2012-08-24'      GROUP BY          CustomerID) y2012,     (SELECT          CustomerID, SUM(Consumption) AS consumption      FROM          yearmonth      WHERE          Date BETWEEN '2012-08-24' AND '2013-08-24'      GROUP BY          CustomerID) y2013 WHERE      y2012.CustomerID = y2013.CustomerID AND y2012.consumption = 634.8 LIMIT 1; 
SELECT T2.GasStationID, SUM(T1.Amount * T1.Price) AS TotalRevenue FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T2.GasStationID ORDER BY TotalRevenue DESC LIMIT 1; 
SELECT      SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS premium_percentage FROM      gasstations WHERE      Country = 'SVK'; 
SELECT SUM(Amount) AS January_2012_Spent FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '201201%';  SELECT SUM(Amount) AS Total_Spent FROM transactions_1k WHERE CustomerID = 38508; 
 SELECT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  GROUP BY p.Description  ORDER BY SUM(t.Amount) DESC  LIMIT 5; 
SELECT c.Currency, SUM(t.Amount / t.Price) AS AveragePricePerItem, c.Segment FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency, c.Segment ORDER BY SUM(t.Amount) DESC LIMIT 1; 
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1 
SELECT ym.Consumption FROM yearmonth ym JOIN transactions_1k t ON ym.CustomerID = t.CustomerID AND ym.Date = SUBSTR(t.Date, 1, 6) AND t.ProductID = 5 AND t.Price / t.Amount > 29.00; 
