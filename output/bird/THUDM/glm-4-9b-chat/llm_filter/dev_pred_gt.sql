SELECT MAX(`Free Meal Count (K-12)`) / MAX(`Enrollment (K-12)`) AS Highest_Eligible_Free_Rate FROM frpm WHERE `Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm f INNER JOIN schools s ON f.id = s.id WHERE s.County = "Alameda")	california_schools
SELECT   CDSCode,   ('FRPM Count (Ages 5-17)' / 'Enrollment (Ages 5-17)') AS EligibleFreeRate FROM   frpm ORDER BY   EligibleFreeRate ASC LIMIT 3;	california_schools
SELECT Zip  FROM schools  WHERE `Charter School (Y/N)` = 1;	california_schools
SELECT s.MailStreet, s.MailCity FROM schools s JOIN frpm f ON s.School = f.School WHERE f.FRPM_Count_(K-12) = (SELECT MAX(frpm.FRPM_Count_(K-12)) FROM frpm)	california_schools
SELECT Phone FROM schools WHERE Charter = 1 AND OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM schools AS s JOIN satscores AS sc ON s.Virtual = 'N' WHERE sc.AvgScrMath < 400;	california_schools
SELECT CDSCode  FROM schools  WHERE Magnet = 1 UNION SELECT CDSCode  FROM schools  WHERE Magnet IS NULL;	california_schools
CREATE TABLE 'test_takers'  (     'SchoolPhone' TEXT NULL,     'SATScore' INTEGER NULL );	california_schools
SELECT s.NumTstTakr FROM frpm f JOIN satscores s ON f.FRPM Count (K-12) = s.NumTstTakr WHERE f.FRPM Count (K-12) = (SELECT MAX('FRPM Count (K-12)')                              FROM frpm);	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores sc ON s.CDSCode = sc.CDSCode WHERE sc.AvgScrMath > 560 AND s.Charter = 1;	california_schools
SELECT s.CDSCode, COUNT(*) AS FRPM_Count FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds JOIN (     SELECT cds     FROM satscores     GROUP BY cds     ORDER BY AVG(Reading) DESC     LIMIT 1 ) highest_reading ON s.CDSCode = highest_reading.cds WHERE s.CDSCode LIKE '0110017%' GROUP BY s.CDSCode;	california_schools
SELECT s.CDSCode FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f."Enrollment (K-12)" + f."Enrollment (Ages 5-17)" > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)`) / MAX(`Enrollment (Ages 5-17)`) as HighestEligibleFreeRate FROM schools WHERE (`NumGE1500` / `NumTstTakr`) > 0.3;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.Phone = sc.Phone WHERE sc.NumTstTakr IS NOT NULL AND sc.NumGE1500 IS NOT NULL ORDER BY (sc.NumGE1500 / sc.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT NCESSchool FROM schools ORDER BY NCESSchool DESC LIMIT 5;	california_schools
SELECT s.StatusType, MAX(scr.AvgScrRead) FROM schools s JOIN satscores scr ON s.StatusType = scr.AvgScrRead WHERE s.StatusType = 'Active' GROUP BY s.StatusType ORDER BY scr.AvgScrRead DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.State) FROM schools s JOIN satscores sc ON s.State = sc.NumTstTakr WHERE sc.NumTstTakr < 100;	california_schools
CREATE TABLE 'school_scores'  (     'CDSCode' TEXT NOT NULL,     'Subject' TEXT NOT NULL,     'Score' INTEGER,     PRIMARY KEY ('CDSCode', 'Subject'),     FOREIGN KEY ('CDSCode') REFERENCES 'schools'('CDSCode') );	california_schools
SELECT COUNT(*)  FROM schools AS s  JOIN frpm AS f ON s.CDSCode = f.CDSCode  WHERE s.County = 'Contra Costa' AND f.'Enrollment (K-12)' <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.Phone = sc.Phone WHERE sc.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores WHERE AvgScrMath IS NOT NULL)	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Amador' AND LowGrade = 9 AND HighGrade = 12;	california_schools
SELECT COUNT(*) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.City = 'Los Angeles' AND f.'Free Meal Count (K-12)' > 500 AND f.'FRPM Count (K-12)' < 700;	california_schools
SELECT s.CDSCode, COUNT(ss.cds) AS test_takers FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.CDSCode LIKE '0110017%' AND s.CDSCode LIKE '%Contra Costa%' GROUP BY s.CDSCode ORDER BY test_takers DESC LIMIT 1;	california_schools
SELECT s.School, s.Street FROM schools s JOIN frpm f ON s.School = f.'Enrollment (K-12)' - f.'Enrollment (Ages 5-17)' WHERE f.'Enrollment (K-12)' - f.'Enrollment (Ages 5-17)' > 30;	california_schools
SELECT f school_name FROM frpm f JOIN satscores s ON f.school_name = s.school_name WHERE f.'Percent (%) Eligible Free (K-12)' > 0.1 AND s.NumTstTakr >= 1500;	california_schools
SELECT s.City, s.FundingType FROM schools AS s WHERE s.City = 'Riverside' AND s.FundingType IS NOT NULL AND (SELECT AVG(m.AverageMathScore) FROM schools AS m WHERE m.City = s.City) > 400;	california_schools
SELECT      s.School,      s.Street,      s.City,      s.Zip,      s.State  FROM      schools s  JOIN      frpm f ON s.District = f.CDSCode  WHERE      s.County = 'Monterey'      AND s.School LIKE '%High School%'     AND f.CDSCode IN (SELECT CDSCode FROM frpm WHERE CDSCode LIKE '011001701%' AND CAST(SUBSTRING(CDSCode, 25, 4) AS INT) > 800);	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone FROM schools s JOIN satscores ss ON s.School = (SELECT School FROM schools WHERE OpenDate > '1991-12-31' OR ClosedDate < '2000-01-01')	california_schools
SELECT s.'DOCType', f.'Enrollment (K-12)' - f.'Enrollment (Ages 5-17)' AS Difference FROM 'schools' AS s JOIN 'frpm' AS f ON s.'DOCType' = f.'DOCType' WHERE s.'FundingType' = "Locally funded" HAVING f.'Enrollment (K-12)' - f.'Enrollment (Ages 5-17)' > (SELECT AVG(f.'Enrollment (K-12)' - f.'Enrollment (Ages 5-17)') FROM 'schools' AS s JOIN 'frpm' AS f ON s.'DOCType' = f.'DOCType' WHERE s.'FundingType' = "Locally funded")	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.OpenDate = (SELECT OpenDate FROM schools WHERE OpenDate IS NOT NULL ORDER BY OpenDate ASC LIMIT 1) WHERE f.'Enrollment (K-12)' = (SELECT MAX('Enrollment (K-12)') FROM frpm);	california_schools
SELECT 'Enrollment (K-12)'  FROM frpm  ORDER BY 'Enrollment (K-12)' ASC  LIMIT 5;	california_schools
SELECT `Percent (%) Eligible Free (K-12)`  FROM frpm  ORDER BY `Enrollment (K-12)` DESC  LIMIT 10;	california_schools
SELECT CDSCode,         (FRPM Count (K-12) / Enrollment (K-12)) AS EligibleFreeOrReducedMealRate FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM frpm WHERE 'Ownership Code' = '66') ORDER BY (FRPM Count (K-12) / Enrollment (K-12)) DESC LIMIT 5;	california_schools
SELECT s.School, s.Website FROM schools s JOIN frpm f ON s.School = f.School WHERE f.FRPM_Count__Ages_5_17 BETWEEN 1900 AND 2000;	california_schools
SELECT     (SUM(T2.Free_Meal_Count_Ages_5_17) / SUM(T2.Enrollment_Ages_5_17)) AS Free_Rate FROM     schools AS T1 JOIN     (         SELECT             CDSCode,             SUM(Free_Meal_Count_Ages_5_17) AS Free_Meal_Count_Ages_5_17,             SUM(Enrollment_Ages_5_17) AS Enrollment_Ages_5_17         FROM             student_data         WHERE             SchoolName = 'Kacey Gibson School'         GROUP BY             CDSCode     ) AS T2 ON     T1.CDSCode = T2.CDSCode;	california_schools
SELECT s.AdmEmail1 FROM schools s JOIN frpm f ON s.AdmEmail1 = f.AdmEmail1 WHERE f."Charter School (Y/N)" = 1 ORDER BY f."Enrollment (K-12)" ASC LIMIT 1;	california_schools
SELECT s.'AdmFName1', s.'AdmLName1' FROM 'schools' s JOIN (     SELECT 'schools'.'School', SUM('satscores'.'NumTstTakr') AS TotalSAT     FROM 'schools'     LEFT JOIN 'satscores' ON 'schools'.'School' = 'satscores'.'School'     GROUP BY 'schools'.'School'     HAVING TotalSAT >= 1500 ) AS high_sat_schools ON s.'School' = high_sat_schools.'School' WHERE s.'School' = (     SELECT 'School'     FROM 'schools'     LEFT JOIN 'satscores' ON 'schools'.'School' = 'satscores'.'School'     GROUP BY 'schools'.'School'     ORDER BY SUM('satscores'.'NumTstTakr') DESC     LIMIT 1 );	california_schools
SELECT Street, City, Zip, State FROM schools ORDER BY (SELECT NumGE1500 / NumTstTakr FROM schools WHERE schools.Street = s.Street) ASC LIMIT 1;	california_schools
SELECT s.CDSCode FROM schools s JOIN satscores ss ON s.CDSCode = ss.NumTstTakr WHERE s.CDSCode = '01100170118489' AND ss.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(NumTstTakr)  FROM satscores  WHERE EXISTS (SELECT 1 FROM schools WHERE OpenDate BETWEEN '1980-01-01' AND '1980-12-31')	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.CDSCode WHERE s.CDSCode IN (SELECT CDSCode FROM schools WHERE 'Fresno Unified' = (SELECT DistrictName FROM schools WHERE CDSCode = s.CDSCode)) ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s1.Virtual, s2.AvgScrRead FROM schools AS s1 JOIN satscores AS s2 ON s1.Virtual = 'F' WHERE s2.AvgScrRead IN (     SELECT MAX(AvgScrRead) OVER (ORDER BY AvgScrRead DESC)      FROM satscores     WHERE AvgScrRead IS NOT NULL ) ORDER BY s2.AvgScrRead DESC LIMIT 5;	california_schools
SELECT s.EdOpsName FROM schools s JOIN school_scores ss ON s.School = ss.School WHERE ss.TypeOfEducation = 'Math' GROUP BY s.School ORDER BY AVG(ss.MathScore) DESC LIMIT 1;	california_schools
SELECT s.County, (ss.AvgScrRead + ss.AvgScrMath + ss.AvgScrWrite) AS TotalAvgScore FROM schools s JOIN satscores ss ON s.County = (SELECT County FROM schools WHERE AvgScrRead IS NOT NULL AND AvgScrMath IS NOT NULL AND AvgScrWrite IS NOT NULL ORDER BY (AvgScrRead + AvgScrMath + AvgScrWrite) ASC LIMIT 1) WHERE ss.AvgScrRead IS NOT NULL AND ss.AvgScrMath IS NOT NULL AND ss.AvgScrWrite IS NOT NULL ORDER BY TotalAvgScore ASC LIMIT 1;	california_schools
SELECT      s.City,      AVG(sc.AvgScrWrite) AS AvgWritingScore FROM      schools s JOIN      satscores sc ON s.City = sc.City GROUP BY      s.City HAVING      SUM(sc.AvgScrWrite) >= 1500 ORDER BY      COUNT(*) DESC LIMIT 1;	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.CDSCode WHERE s.School IS NOT NULL AND s.School LIKE '%Ricci Ulrich%' GROUP BY s.School;	california_schools
SELECT 'DOCType', COUNT(*) as 'Number of Enrollees' FROM schools WHERE DOCType = 'State Special Schools' GROUP BY DOCType ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS MonthlyAverage FROM schools WHERE County = "Alameda" AND OpenDate >= '1980-01-01' AND OpenDate < '1981-01-01' AND DOC = '52';	california_schools
SELECT      (COUNT(CASE WHEN 'DOCType' = '54' THEN 1 END) * 1.0) /      COUNT(CASE WHEN 'DOCType' = '52' THEN 1 END) AS Ratio FROM      'schools' WHERE      'County' = 'Orange' AND      'StatusType' = 'Merged';	california_schools
SELECT County, COUNT(*) as ClosedSchoolsCount, School, ClosedDate FROM schools WHERE ClosedDate IS NOT NULL GROUP BY County, School, ClosedDate ORDER BY ClosedSchoolsCount DESC LIMIT 1;	california_schools
SELECT School, MailStreet FROM schools WHERE School = (     SELECT School     FROM schools     JOIN (         SELECT AVG(CAST(MailStrAbr AS FLOAT)) AS MathAverage         FROM schools         GROUP BY School     ) AS avg_schools     ON schools.School = avg_schools.School     ORDER BY MathAverage DESC     LIMIT 5, 1 );	california_schools
SELECT s.School, s.MailStreet FROM schools s JOIN satscores sc ON s.School IS NOT NULL AND s.School = sc.School WHERE sc.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL);	california_schools
SELECT COUNT(*)  FROM schools  JOIN satscores ON schools.CDSCode = satscores.CDSCode WHERE (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500 AND schools.CDSCode IN (     SELECT CDSCode      FROM schools      WHERE mailing_city = 'Lakeport' );	california_schools
SELECT SUM(s.NumTstTakr)  FROM satscores s  JOIN schools sch ON s.NumTstTakr = sch.MailCity  WHERE sch.MailCity = 'Fresno';	california_schools
SELECT 'School', 'MailZip' FROM 'schools' WHERE 'School' = "Avetik Atoian's administration";	california_schools
SELECT CAST(COUNT(CASE WHEN County = 'Colusa' THEN 1 END) AS REAL) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 END) AS Ratio FROM schools WHERE County IN ('Colusa', 'Humboldt')	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND County = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN satscores sc ON s.Phone = sc.AvgScrWrite ORDER BY sc.AvgScrWrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT Phone, Ext FROM schools WHERE Zip = "95203-3704"	california_schools
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' OR AdmFName2 = 'Mike' AND AdmLName2 = 'Larson' OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez' OR AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez';	california_schools
SELECT Website FROM schools WHERE County = 'San Joaquin' AND Charter = 1 AND Virtual = 'P';	california_schools
SELECT COUNT(*) FROM schools WHERE City = "Hickman" AND Charter = 1 AND DOC = 52;	california_schools
SELECT COUNT(*) AS NonCharteredSchoolsCount FROM frpm WHERE Charter = 0 AND `Free Meal Count (K-12)` * 100 / `Enrollment (K-12)` < 0.18;	california_schools
SELECT School, City, AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3 FROM schools WHERE School IS NOT NULL AND AdmFName1 IS NOT NULL AND AdmLName1 IS NOT NULL AND 'Charter' = 1 AND School = 'FAME Public Charter';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      ROUND(         (COUNT(CASE WHEN 'FundingType' = 'Locally funded' THEN 1 END) * 100.0) /          COUNT(*),         2     ) AS Percentage_Locally_Funded FROM      'schools' WHERE      'County' = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM schools WHERE 'OpenDate' BETWEEN '2000-01-01' AND '2005-12-31' AND 'FundingType' = 'Directly Funded'	california_schools
SELECT SUM('Enrollment (K-12)') AS TotalEnrollment FROM frpm;	california_schools
SELECT County, COUNT(*) AS ClosureCount FROM schools WHERE SOC = '11' AND YEAR(ClosedDate) BETWEEN 1980 AND 1989 GROUP BY County ORDER BY ClosureCount DESC LIMIT 1;	california_schools
SELECT NCESDist  FROM schools  WHERE SOC = '31';	california_schools
SELECT StatusType, COUNT(*) AS NumberOfSchools FROM schools WHERE County = 'Alpine' AND StatusType IN ('Active', 'Closed') GROUP BY StatusType;	california_schools
SELECT NCESDist  FROM schools  WHERE Magnet = 0;	california_schools
SELECT frpm."Enrollment (Ages 5-17)" FROM frpm JOIN schools ON frpm."CDSCode" = schools."EdOpsCode" WHERE schools."EdOpsCode" = 'SSS' AND frpm."Academic Year" = '2014-2015';	california_schools
SELECT SUM(CASE WHEN age BETWEEN 5 AND 17 THEN 1 ELSE 0 END) AS FreeOrReducedMealCount FROM meal_data WHERE school = 'Youth Authority School' AND mailing_address = 'PO Box 1040';	california_schools
SELECT MIN(Grade)  FROM schools  WHERE NCESDist = '613360' AND EdOpsCode = 'SPECON';	california_schools
CREATE TABLE 'school_details'  (     'SchoolID' TEXT NOT NULL,     'CountyCode' TEXT NOT NULL,     'EducationalLevelName' TEXT NOT NULL,     'BreakfastProvision' TEXT NOT NULL,     PRIMARY KEY('SchoolID'),     FOREIGN KEY('SchoolID') REFERENCES 'schools'('SchoolID'), -- Assuming there's a 'SchoolID' in 'schools' table     FOREIGN KEY('CountyCode') REFERENCES 'schools'('County') );	california_schools
SELECT s.City FROM schools s JOIN frpm f ON s.County = f.CDSCode WHERE f.CDSCode LIKE '01100170%' AND s.County = 'Merced' AND f.EILCode = 'HS' AND f.LunchProvision = 2;	california_schools
SELECT      s.School,      (f.FRPM_Count__Ages_5_17 / f.Enrollment__Ages_5_17 * 100) AS Percent__Eligible_FRPM FROM      schools s JOIN      frpm f ON s.School = f.School_Name WHERE      s.County = 'Alameda'      AND s.GSoffered = 'K-9'     AND s.GSserved = 'K-9';	california_schools
SELECT GradeSpan, COUNT(*) as Count FROM schools WHERE City = 'Adelanto' GROUP BY GradeSpan ORDER BY Count DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) as SchoolCount FROM schools WHERE Virtual = 'N' AND County BETWEEN 'San Diego' AND 'Santa Barbara' GROUP BY County ORDER BY SchoolCount DESC LIMIT 1;	california_schools
SELECT 'School', 'Latitude' FROM 'schools' ORDER BY 'Latitude' DESC LIMIT 1;	california_schools
SELECT s.School, s.City, s.Latitude, f Low_Grade FROM schools s JOIN frpm f ON s.School = f.Low_Grade WHERE s.City IN ('Hayward', 'Newark', 'Oakland', 'Berkeley') ORDER BY s.Latitude ASC LIMIT 1;	california_schools
SELECT s.grade_span FROM schools s JOIN school_grades sg ON s.some_common_key = sg.school_id WHERE s.Longitude = (SELECT MAX(Longitude) FROM schools);	california_schools
SELECT      s.City,      COUNT(DISTINCT s.School) AS NumSchools FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.Magnet = 1 AND      f.GSoffered = 'K-8' GROUP BY      s.City;	california_schools
SELECT 'District', 'AdmFName1', COUNT(*) AS 'Frequency' FROM schools GROUP BY 'District', 'AdmFName1' ORDER BY 'Frequency' DESC LIMIT 2;	california_schools
SELECT      (SELECT `Free Meal Count (K-12)` FROM `school_administrators` WHERE `First Name` = 'Alusine') /      (SELECT `Enrollment (K-12)` FROM `frpm`) * 100 AS 'Percent (%) Eligible Free (K-12)',     (SELECT `District Code` FROM `school_administrators` WHERE `First Name` = 'Alusine' AND `School Name` =      (SELECT `School Name` FROM `frpm` WHERE `Enrollment (K-12)` =      (SELECT `Enrollment (K-12)` FROM `frpm` WHERE `First Name` = 'Alusine')))	california_schools
SELECT     s.County,     s.District,     s.AdmLName1 AS AdminLastName FROM     schools s WHERE     s.CharterNum = "040";	california_schools
SELECT `AdmEmail1` FROM `schools` WHERE `County` = "San Bernardino" AND `District` = "San Bernardino City Unified" AND `OpenDate` BETWEEN "2009-01-01" AND "2010-12-31" AND `DOCType` = "Unified Schools (54)" AND `SOCType` = "Intermediate/Middle Schools (62)" AND `DOCType` = "Unified Schools (54)" AND `SOCType` = "Unified Schools (54)";	california_schools
SELECT      s.AdmEmail1  FROM      schools s  JOIN      satscores ss  ON      s.CDSCode = ss.cds  WHERE      ss.NumGE1500 IS NOT NULL  GROUP BY      s.AdmEmail1  ORDER BY      COUNT(*) DESC  LIMIT 1;	california_schools
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.A3 WHERE d.A3 = 'central Bohemia' AND a.account_id IN (     SELECT account_id     FROM card     WHERE type = 'gold' );	financial
SELECT COUNT(a.district_id)  FROM account a  JOIN district d ON a.district_id = d.A3  WHERE d.A3 = 'Prague' AND a.district_id IN (SELECT district_id FROM loan);	financial
SELECT      CASE          WHEN AVG('A12') > AVG('A13') THEN '1995'         ELSE '1996'     END AS higher_unemployment_year FROM      'district';	financial
SELECT COUNT(DISTINCT d.district_id) AS districts_with_female_salary_range FROM district d JOIN employee e ON d.district_id = e.district_id WHERE e.gender = 'F' AND e.salary BETWEEN 6000 AND 10000;	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.A11 WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;	financial
SELECT      a.account_id,      (SELECT MAX(A11) FROM district) - (SELECT MIN(A11) FROM district) AS salary_gap FROM      account a JOIN      client c ON a.district_id = c.district_id WHERE      c.gender = 'F' ORDER BY      c.birth_date ASC,      A11 ASC LIMIT 1;	financial
SELECT account_id FROM disp JOIN client ON disp.account_id = client.account_id JOIN district ON disp.account_id = district.A11 WHERE birth_date = (SELECT MIN(birth_date) FROM client) GROUP BY account_id ORDER BY AVG(district.A11) DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN account a ON c.client_id = a.client_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT c.client_id FROM client c JOIN trans t ON c.client_id = t.k_symbol WHERE t.type = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, MIN(l.amount) AS min_loan_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date BETWEEN '1997-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK TYDNE' GROUP BY a.account_id ORDER BY min_loan_amount ASC LIMIT 1;	financial
SELECT account.account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND account.date BETWEEN "1993-01-01" AND "1993-12-31" ORDER BY loan.amount DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND A2 = 'Slokolov';	financial
SELECT a.date FROM account a JOIN trans t ON a.date = t.date WHERE a.date BETWEEN '1995-01-01' AND '1995-12-31' GROUP BY a.date ORDER BY a.date ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.amount WHERE a.date < '1997-01-01' AND l.amount > 3000;	financial
SELECT c.client_id FROM client c JOIN card cr ON c.client_id = cr.client_id WHERE cr.issued = '1994-03-03';	financial
SELECT a.date AS account_open_date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.date = '1998-10-14' AND t.account_id = 840;	financial
SELECT a.district_id FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(t.amount) AS max_transaction_amount FROM transactions t JOIN card c ON t.card_id = c.disp_id WHERE c.date_opened = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN disp d ON c.gender = d.account_id WHERE d.type = 'OWNER' GROUP BY c.gender ORDER BY AVG(d.account_id) DESC LIMIT 1;	financial
SELECT t.amount AS first_transaction_amount FROM account a JOIN trans t ON a.account_id = t.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) ORDER BY t.date LIMIT 1;	financial
SELECT COUNT(*)  FROM client  WHERE gender = 'F' AND client_id IN (SELECT client_id FROM branch WHERE region = 'Jesenik');	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.date = '1998-09-02' AND t.amount = 5100;	financial
SELECT COUNT(*) FROM account WHERE date BETWEEN '1996-01-01' AND '1996-12-31' AND district_id IN (SELECT district_id FROM district WHERE district_id = (SELECT district_id FROM district WHERE district_name = 'Litomerice'));	financial
SELECT a.district_id FROM client c JOIN account a ON c.client_id = a.client_id WHERE c.gender = 'F' AND c.client_id = (     SELECT client_id     FROM client     WHERE gender = 'F' AND client_id IN (         SELECT client_id         FROM client         WHERE gender = 'F' AND STRFTIME('%Y/%m/%d', birthdate) = '1976/01/29'     ) )	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.client_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT c.client_id FROM client c JOIN district d ON c.client_id = d.client_id WHERE d.A3 = 'Prague' ORDER BY c.client_id LIMIT 1;	financial
SELECT      (SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district WHERE A4 = '1204953')) /      (SELECT COUNT(*) FROM client WHERE district_id = (SELECT district_id FROM district WHERE A4 = '1204953')) * 100 AS male_client_percentage FROM district WHERE A4 = '1204953';	financial
SELECT   (A.balance - B.balance) / B.balance * 100 AS increase_rate FROM   (     SELECT       account_id,       balance     FROM       account     WHERE       account_id = (         SELECT           account_id         FROM           loan         WHERE           date = '1993-07-05'       )   ) A,   (     SELECT       account_id,       balance     FROM       account     WHERE       account_id = (         SELECT           account_id         FROM           loan         WHERE           date = '1993-03-22'       )   ) B WHERE   A.account_id = B.account_id;	financial
SELECT      (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage_paid FROM      loan;	financial
SELECT      ROUND(         (SUM(CASE WHEN l.amount < 100000 THEN 1 ELSE 0 END) * 100.0) / COUNT(*),         2     ) AS percentage_of_accounts_with_no_issue FROM      account a JOIN      loan l ON a.district_id = l.amount WHERE      l.status = 'C';	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.account_id = d.A2 WHERE a.account_id IN (SELECT account_id FROM transactions WHERE year = 1993 AND statement = 'POPLATEK PO OBRATU');	financial
SELECT a.account_id, a.frequency FROM account a JOIN client c ON a.account_id = c.district_id WHERE c.district_id = 1 AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.account_id = d.A2 WHERE d.A2 = 'Prachatice';	financial
SELECT d.A2, d.A3 FROM loan l JOIN district d ON l.loan_id = d.A2 WHERE l.loan_id = 4990;	financial
SELECT l.account_id, d.A3 AS district, d2.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.A3 JOIN district d2 ON d.A3 = d2.A3 WHERE d2.A3 != 'central Bohemia';	financial
SELECT l.loan_id, d.A3, d.A11 / 60 AS average_salary FROM loan l JOIN district d ON l.loan_id = d.A11 WHERE d.A11 / 60 = 60;	financial
SELECT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_rate FROM loan l JOIN client c ON l.account_id = c.client_id JOIN district d ON c.client_id = d.district_id WHERE l.status = 'D';	financial
SELECT      (COUNT(*) FILTER (WHERE a.district_id = d.A2 AND a.date = '1993-02-26') * 100.0) / COUNT(*) FROM      account a JOIN      district d ON a.district_id = d.A2 WHERE      d.A2 = 'Decin';	financial
SELECT account_id  FROM account  WHERE frequency = "POPLATEK MESICNE";	financial
SELECT d.district_id, COUNT(a.district_id) AS female_account_holders FROM district d JOIN account a ON d.district_id = a.district_id WHERE a.gender = 'F' GROUP BY d.district_id ORDER BY female_account_holders DESC LIMIT 10;	financial
SELECT t.A2, SUM(t.amount) AS total_withdrawal FROM district d JOIN trans t ON d.A2 = t.A2 WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY t.A2 ORDER BY total_withdrawal DESC LIMIT 10;	financial
SELECT COUNT(*) FROM account WHERE district_id NOT IN (     SELECT district_id     FROM district     WHERE A3 = 'South Bohemia' );	financial
SELECT district_id, COUNT(*) AS active_loans FROM loan WHERE status IN ('C', 'D') GROUP BY district_id ORDER BY active_loans DESC LIMIT 1;	financial
SELECT AVG(amount) AS average_loan_amount FROM loan JOIN client ON loan.id = client.id WHERE client.gender = 'M';	financial
SELECT d.A2 AS district_name, c.district_id FROM client c JOIN district d ON c.district_id = d.A2 WHERE YEAR(c.birth_date) = 1996 GROUP BY c.district_id, d.A2 ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.account_id = d.A16 WHERE d.A16 = (SELECT MAX(A16) FROM district);	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND balance < 0 AND (SELECT frequency FROM account WHERE account.frequency = 'POPLATEK MESICNE' AND account.frequency IN (SELECT frequency FROM account));	financial
SELECT COUNT(*) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK MESICNE' AND l.status = 'A';	financial
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.account_id > 0 AND (l.status = 'C' OR l.status = 'D');	financial
SELECT COUNT(c.gender)  FROM client c  JOIN district d ON c.district_id = d.A15  WHERE d.A15 = (     SELECT A15      FROM district      ORDER BY A15 DESC      LIMIT 1 OFFSET 1 ) AND c.gender = 'M';	financial
SELECT COUNT(*) FROM card c JOIN disp d ON c.type = d.type WHERE c.type = 'gold' AND d.type = 'DISPONENT';	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN district d ON a.account_id = d.A2  WHERE d.A2 = "Pisek";	financial
SELECT account.district_id FROM account JOIN trans ON account.district_id = trans.district_id WHERE trans.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY account.district_id HAVING SUM(trans.amount) > 10000;	financial
SELECT DISTINCT a.account_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.k_symbol = 'SIPO' AND a.account_id IN (     SELECT account_id     FROM account     JOIN order o ON account.account_id = o.account_id     WHERE o.k_symbol = 'SIPO'     AND a.account_id IN (         SELECT account_id         FROM account         JOIN order o ON account.account_id = o.account_id         WHERE o.k_symbol = 'SIPO'         AND a.account_id = 5     ) )	financial
SELECT d.account_id FROM disp d JOIN card c1 ON d.account_id = c1.disp_id JOIN card c2 ON d.account_id = c2.disp_id AND c1.disp_id = 42 AND c2.disp_id = 51 WHERE c1.disp_id = 42 AND c2.disp_id = 51;	financial
SELECT AVG(amount) AS average_credit_card_amount FROM trans WHERE operation = 'VYBER KARTOU' AND date >= '2021-01-01' AND date < '2022-01-01';	financial
SELECT account.account_id FROM account JOIN (     SELECT account_id, SUM(amount) as total_spent, COUNT(date) as months     FROM trans     WHERE date BETWEEN '1998-01-01' AND '1998-12-31'     GROUP BY account_id ) as monthly_spent ON account.account_id = monthly_spent.account_id WHERE monthly_spent.total_spent / monthly_spent.months < (     SELECT AVG(total_spent / months)     FROM (         SELECT account_id, SUM(amount) as total_spent, COUNT(date) as months         FROM trans         WHERE date BETWEEN '1998-01-01' AND '1998-12-31'         GROUP BY account_id     ) as monthly_spent )	financial
SELECT DISTINCT d.account_id FROM disp d JOIN card c ON d.account_id = c.card_id JOIN account a ON d.account_id = a.account_id WHERE a.gender = 'F' AND EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = a.account_id );	financial
SELECT COUNT(*)  FROM client  JOIN account ON client.gender = 'F'  JOIN district ON account.district_id = district.A3  WHERE district.A3 = 'south Bohemia';	financial
SELECT account_id FROM account JOIN district ON account.account_id = district.A2 WHERE district.A2 = 'Tabor' AND frequency = 'POPLATEK MESICNE'	financial
SELECT d.type FROM disp d JOIN district dt ON d.account_id = dt.A11 WHERE d.type != 'OWNER' AND dt.A11 BETWEEN 8000 AND 9000 GROUP BY d.type;	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.district_id = (SELECT district_id FROM district WHERE region = 'North Bohemia') AND t.bank = 'AB';	financial
SELECT DISTINCT a.district_id FROM account a JOIN trans t ON a.district_id = t.district_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(A15) AS avg_crimes FROM district WHERE A15 > 4000 AND A15 IN (SELECT A15 FROM district WHERE A15 > 0) AND EXISTS (     SELECT 1     FROM trans     WHERE YEAR(date) >= 1997 ) AND YEAR('trans.date') = 1995;	financial
SELECT COUNT(*)  FROM card  JOIN account ON card.card_id = account.card_id  WHERE account.account_type = 'OWNER';	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha');	financial
SELECT      (COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) * 100.0) /      COUNT(c.type) AS gold_issued_before_1998_percentage FROM      card c;	financial
CREATE TABLE 'loan'  (     'loan_id' INTEGER NOT NULL,     'account_id' INTEGER NOT NULL,     'loan_amount' DECIMAL(10, 2) NOT NULL,     PRIMARY KEY('loan_id'),     FOREIGN KEY('account_id') REFERENCES 'account'('account_id') );	financial
SELECT SUM(d.A15) AS total_crimes FROM account a JOIN district d ON a.district_id = d.A15 WHERE a.account_id = 532;	financial
SELECT a.district_id FROM account a JOIN order_table o ON a.account_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT *  FROM trans  WHERE account_id = 3356 AND operation = 'VYBER';	financial
SELECT COUNT(*) FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;	financial
SELECT c.type  FROM card c JOIN client_card cc ON c.card_id = cc.card_id WHERE cc.client_id = 13539;	financial
SELECT d.A3 FROM client c JOIN district d ON c.district_id = d.A3 WHERE c.district_id = 3541;	financial
SELECT district_id FROM account JOIN loan ON account.district_id = loan.district_id WHERE loan.status = 'A' GROUP BY district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT c.client_id FROM client c JOIN order o ON c.client_id = o.account_id WHERE o.account_id = 32423;	financial
SELECT t.trans_id, t.date FROM trans t JOIN account a ON t.trans_id = a.district_id WHERE a.district_id = 5;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE district_id = 5);	financial
SELECT client_id FROM client JOIN card ON client.client_id = card.client_id WHERE card.type = 'junior' AND card.issued >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS percentage_female FROM      client c JOIN      district d ON c.client_id = d.district_id WHERE      d.A11 > 10000;	financial
SELECT     ((SUM(CASE WHEN L.date BETWEEN '1997-01-01' AND '1997-12-31' THEN L.amount ELSE 0 END) -        SUM(CASE WHEN L.date BETWEEN '1996-01-01' AND '1996-12-31' THEN L.amount ELSE 0 END)) /      SUM(CASE WHEN L.date BETWEEN '1996-01-01' AND '1996-12-31' THEN L.amount ELSE 0 END) * 100) AS growth_rate FROM     loan L JOIN     client C ON L.amount = C.gender WHERE     C.gender = 'M'	financial
SELECT COUNT(*) FROM `trans` WHERE `operation` = 'VYBER KARTOU' AND `date` > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN d.A3 = 'North Bohemia' THEN a.A16 ELSE 0 END) -      SUM(CASE WHEN d.A3 = 'East Bohemia' THEN a.A16 ELSE 0 END)) AS crime_difference FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      d.A3 IN ('North Bohemia', 'East Bohemia');	financial
SELECT      COUNT(CASE WHEN d.type = 'OWNER' THEN 1 END) AS owners,     COUNT(CASE WHEN d.type = 'DISPONENT' THEN 1 END) AS disponents FROM      disp d JOIN      account a ON d.disp_id = a.account_id WHERE      a.account_id BETWEEN 1 AND 10;	financial
SELECT      COUNT(*) AS 'request_count' FROM      account WHERE      frequency = 'POPLATEK MESICNE' AND      account_number = 3;  SELECT      SUM(amount) AS 'total_debit_3539' FROM      trans WHERE      operation = 'DEBIT' AND      amount = 3539;	financial
SELECT c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.account_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN client c ON a.account_id = c.client_id WHERE a.account_id IN (     SELECT account_id     FROM account     WHERE Frequency = 'POPLATEK PO OBRATU' );	financial
SELECT l.amount, cl.client_id FROM loan l JOIN client cl ON l.account_id = cl.client_id WHERE cl.client_id = 992;	financial
SELECT      SUM(t.amount) AS total_sum,     c.gender FROM      trans t JOIN      client c ON t.account_id = c.client_id WHERE      t.trans_id = 851 AND c.client_id = 4;	financial
SELECT c.type  FROM card c JOIN client_card cc ON c.card_id = cc.card_id WHERE cc.client_id = 9;	financial
SELECT SUM(t.amount) AS total_spent FROM trans t WHERE t.date BETWEEN '1998-01-01' AND '1998-12-31' AND t.client_id = 617;	financial
SELECT c.client_id FROM client c JOIN district d ON c.client_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.district_id IN (SELECT district_id FROM district WHERE district_id = 1);	financial
SELECT client_id  FROM client  WHERE gender = 'F'  ORDER BY client_id DESC  LIMIT 3;	financial
SELECT COUNT(DISTINCT c.gender) FROM client c JOIN account a ON c.gender = 'M' WHERE c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND a.frequency = 'POPLATEK MESICNE' AND (SELECT SUM(p.amount) FROM payment p WHERE p.client_id = c.id) > 4000;	financial
SELECT COUNT(*) FROM account WHERE district_id = 5 AND date > "1996-01-01";	financial
SELECT COUNT(c.client_id) FROM client c JOIN card cd ON c.client_id = cd.card_id WHERE c.gender = 'F' AND cd.card_id BETWEEN 1 AND 3;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(DISTINCT a.district_id) FROM      client c JOIN      account a ON c.gender = 'F' JOIN      district d ON a.district_id = d.A3 WHERE      d.A3 = 'Prague'	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) / COUNT(CASE WHEN c.gender = 'M' THEN 1 END + COUNT(CASE WHEN c.gender = 'F' THEN 1 END)) * 100) AS male_clients_percentage FROM      client c JOIN      card cd ON c.client_id = cd.client_id WHERE      cd.type = 'gold' OR cd.type = 'classic' OR cd.type = 'junior';	financial
SELECT COUNT(c.client_id) FROM client c JOIN account a ON c.client_id = a.client_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.account_id IN (     SELECT account_id     FROM account     WHERE account_id IN (         SELECT account_id         FROM loan         WHERE duration > 24     )     AND account_id NOT IN (         SELECT account_id         FROM loan         WHERE duration <= 24     ) ) ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON d.A11 = c.client_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') GROUP BY a.account_id HAVING AVG(d.A11) = (SELECT MIN(average_salary) FROM district);	financial
SELECT COUNT(*) FROM client JOIN district ON client.birth_date BETWEEN '1920-01-01' AND '1920-12-31' WHERE district.A3 = 'east Bohemia';	financial
SELECT COUNT(*)  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT      T.date,     AVG(L.amount) AS average_loan_amount FROM      trans T JOIN      loan L ON T.date = (SELECT MAX(trans.date) FROM trans WHERE loan_id = L.loan_id) WHERE      L.status IN ('C', 'D') AND      L.status IN (SELECT status FROM loan WHERE 'POPLATEK PO OBRATU' = 'POPLATEK PO OBRATU') GROUP BY      T.date;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.account_id JOIN loan l ON d.account_id = l.status WHERE l.status IN ('A', 'C');	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN card cd ON c.client_id = cd.client_id WHERE cd.type = 'gold';	financial
SELECT bond_type, COUNT(bond_type) AS frequency FROM bond GROUP BY bond_type ORDER BY frequency DESC LIMIT 1;	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS average_oxygen_atoms FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON a.molecule_id = c.atom_id OR a.molecule_id = c.atom_id2 WHERE b.bond_type = '-';	toxicology
SELECT AVG(CASE WHEN m.label = '+' THEN COUNT(b.bond_type) END)  FROM molecule AS m LEFT JOIN bond AS b ON m.label = '+' WHERE b.bond_type = '-';	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.label = '+' WHERE b.bond_type = '#';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.molecule_id) AS percentage_carbon FROM      atom a JOIN      molecule m ON a.molecule_id = m.label WHERE      m.label = '-' AND     EXISTS (         SELECT 1 FROM bond b WHERE b.bond_type = '=' AND b.molecule_id = a.molecule_id     )	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = "=";	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'si';	toxicology
SELECT a.element FROM atom a JOIN bond b ON a.element = b.bond_id WHERE b.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.element = b.bond_type WHERE b.bond_type = '=';	toxicology
SELECT m.label, COUNT(a.molecule_id) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE m.label = '+' GROUP BY m.label ORDER BY count DESC LIMIT 1;	toxicology
SELECT bond_type FROM bond JOIN atom ON bond.bond_type = atom.molecule_id WHERE atom.molecule_id = 'te';	toxicology
SELECT a1.atom_id AS atom1, a2.atom_id AS atom2 FROM atom a1 JOIN bond b ON a1.atom_id < b.atom_id JOIN atom a2 ON b.atom_id = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON m.label = '-' JOIN (     SELECT atom_id     FROM atom     WHERE atom_id IN (         SELECT atom_id         FROM molecule         WHERE label = '+'     ) ) AS connected_atoms ON a.atom_id = connected_atoms.atom_id;	toxicology
SELECT element, COUNT(*) AS count FROM atom JOIN molecule ON atom.element = molecule.label WHERE molecule.label = '-' GROUP BY element ORDER BY count ASC LIMIT 1;	toxicology
SELECT bond_type FROM connected WHERE atom_id = 'TR004_8' AND atom_id2 = 'TR004_20' OR atom_id = 'TR004_20' AND atom_id2 = 'TR004_8';	toxicology
SELECT m.label FROM molecule m WHERE m.label NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element <> 'sn' )	toxicology
SELECT COUNT(*) FROM atom a JOIN bond b ON a.atom_id = SUBSTRING(b.bond_id, 1, LENGTH(b.bond_id) - 1) WHERE a.atom_id LIKE '%i%' OR a.atom_id LIKE '%s%' AND b.bond_type = '-';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.atom_id = b.bond_id OR c.atom_id2 = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE a.molecule_id = 'TR181';	toxicology
SELECT      (SUM(CASE WHEN label = '+' AND element != 'f' THEN 1 ELSE 0 END) * 100.0) /      COUNT(*)  FROM      molecule  JOIN      atom  ON      molecule.label = atom.element WHERE      molecule.label = '+';	toxicology
SELECT     SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond.bond_id) AS percent FROM     bond JOIN     molecule ON bond.bond_id LIKE CONCAT(molecule.molecule_id, '%') WHERE     molecule.molecule_id IN (SELECT molecule_id FROM molecule JOIN bond ON molecule.molecule_id LIKE CONCAT(bond.bond_id, '%') WHERE bond.bond_type = '#')     AND molecule.molecule_id IN (SELECT molecule_id FROM molecule JOIN bond ON molecule.molecule_id LIKE CONCAT(bond.bond_id, '%') WHERE bond.bond_type = '+')	toxicology
SELECT element, COUNT(*) AS frequency FROM atom WHERE molecule_id = 'TR000' AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY element ORDER BY frequency DESC, element ASC LIMIT 3;	toxicology
SELECT a1.atom_id AS atom1, a2.atom_id AS atom2 FROM atom a1 JOIN bond b ON a1.atom_id LIKE CONCAT('%', b.bond_id, '%') JOIN atom a2 ON a2.atom_id LIKE CONCAT('%', b.bond_id, '%') WHERE b.bond_id = 'TR001_2_6' AND b.molecule_id = 'TR001'	toxicology
SELECT (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule;	toxicology
SELECT c.atom_id  FROM connected c  JOIN bond b ON c.atom_id = SUBSTRING(b.bond_id, 5) WHERE b.bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' AND bond_id = 'TR000_2_4';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.label = b.bond_type WHERE b.bond_type = ' = ' GROUP BY m.label ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT      DIVIDE(SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END), COUNT(bond.bond_id)) AS percent FROM      bond WHERE      bond.molecule_id = 'TR008';	toxicology
SELECT DIVIDE(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END), COUNT(molecule_id)) AS percent FROM molecule;	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.element), 2) AS percent FROM      atom a JOIN      molecule m ON a.element = m.molecule_id WHERE      m.molecule_id = 'TR206'	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id = 'TR000';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.element LIKE CONCAT('%', m.label, '%') WHERE m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+' AND m.label = '+'	toxicology
SELECT      bond_type,      CASE          WHEN COUNT(bond_type) > (SELECT COUNT(*) FROM bond) / 2 THEN 'Majority'         ELSE 'Minority'     END AS bond_majority,     CASE          WHEN m.label = '+' THEN 'Carcinogenic'         ELSE 'Non-carcinogenic'     END AS carcinogenicity FROM      bond JOIN      molecule m ON bond_type = '-' WHERE      m.label = 'TR018' GROUP BY      bond_type ORDER BY      COUNT(bond_type) DESC LIMIT 1;	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.label = b.molecule_id WHERE m.label != '-' AND b.bond_type = '-' GROUP BY m.label ORDER BY m.label ASC LIMIT 3;	toxicology
SELECT bond_id, bond_type FROM bond WHERE bond_id LIKE 'TR006%' ORDER BY bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM bond WHERE bond_id LIKE 'TR009_%' AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12');	toxicology
SELECT COUNT(*)  FROM molecule  JOIN atom ON molecule.label = '+'  WHERE atom.element = 'br';	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_type = c.atom_id OR b.bond_type = c.atom_id2 WHERE c.atom_id = 'TR001_6_9' OR c.atom_id2 = 'TR001_6_9';	toxicology
SELECT m.label, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-carcinogenic' END AS carcinogenicity FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE a.molecule_id = 'TR001_10';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = "#");	toxicology
SELECT COUNT(bond_id)  FROM connected  WHERE bond_id LIKE 'TR%_19';	toxicology
SELECT DISTINCT `element` FROM `atom` WHERE `molecule_id` = "TR004";	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '-';	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE SUBSTRING(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT bond_id FROM connected WHERE bond_id IN (     SELECT bond_id     FROM connected AS c1     JOIN atom AS a1 ON c1.bond_id = a1.bond_id     WHERE a1.element = 'p' ) AND bond_id IN (     SELECT bond_id     FROM connected AS c2     JOIN atom AS a2 ON c2.bond_id = a2.bond_id     WHERE a2.element = 'n' );	toxicology
SELECT m.label, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.label = b.bond_type WHERE b.bond_type = '=' GROUP BY m.label ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT      COUNT(b.bond_id) / COUNT(a.atom_id) AS average_bonds_per_atom FROM      atom a JOIN      bond b ON a.atom_id = CONCAT('TR', b.molecule_id, '_', b.bond_id) WHERE      a.element = 'i' GROUP BY      a.atom_id;	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN atom ON bond.bond_id LIKE CONCAT(SUBSTR(atom.atom_id, 7, 2), '%') WHERE atom.atom_id LIKE 'TR000_%' AND SUBSTR(atom.atom_id, 7, 2) + 0 = 45;	toxicology
SELECT a.element FROM atom a WHERE NOT EXISTS (     SELECT 1     FROM atom a2     WHERE a.element != a2.element     AND EXISTS (         SELECT 1         FROM bond b         WHERE b.atom_id1 = a.atom_id OR b.atom_id2 = a.atom_id         AND b.atom_id1 = a2.atom_id OR b.atom_id2 = a2.atom_id     ) ) AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT a.atom_id FROM atom a JOIN bond b ON a.molecule_id = b.bond_type WHERE b.bond_type = '###' AND a.molecule_id = 'TR447';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR144_8_19';	toxicology
SELECT m.label, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.label = b.bond_type WHERE m.label = '+' GROUP BY m.label ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT element FROM atom JOIN molecule ON atom.element = molecule.label WHERE molecule.label = '+' GROUP BY atom.element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id WHERE a1.element = 'pb' AND c1.atom_id IN (SELECT atom_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl'));	toxicology
SELECT DISTINCT c1.atom_id AS element1, c2.atom_id AS element2 FROM connected c1 JOIN bond b ON c1.atom_id = LEFT(b.bond_id, LENGTH(b.bond_id) - 1) JOIN connected c2 ON c2.atom_id = SUBSTRING(b.bond_id FROM LENGTH(b.bond_id) - 1) WHERE b.bond_type = '-' AND c1.atom_id LIKE '%c' AND c2.atom_id LIKE '%c' UNION SELECT c1.atom_id AS element1, c2.atom_id AS element2 FROM connected c1 JOIN bond b ON c1.atom_id = LEFT(b.bond_id, LENGTH(b.bond_id) - 1) JOIN connected c2 ON c2.atom_id = SUBSTRING(b.bond_id FROM LENGTH(b.bond_id) - 1) WHERE b.bond_type = '-' AND c1.atom_id LIKE '%c' AND c2.atom_id LIKE '%h' UNION SELECT c1.atom_id AS element1, c2.atom_id AS element2 FROM connected c1 JOIN bond b ON c1.atom_id = LEFT(b.bond_id, LENGTH(b.bond_id) - 1) JOIN connected c2 ON c2.atom_id = SUBSTRING(b.bond_id FROM LENGTH(b.bond_id) - 1) WHERE b.bond_type = '-' AND c1.atom_id LIKE '%o' AND c2.atom_id LIKE '%o' UNION SELECT c1.atom_id AS element1, c2.atom_id AS element2 FROM connected c1 JOIN bond b ON c1.atom_id = LEFT(b.bond_id, LENGTH(b.bond_id) - 1) JOIN connected c2 ON c2.atom_id = SUBSTRING(b.bond_id FROM LENGTH(b.bond_id) - 1) WHERE b.bond_type = '-' AND c1.atom_id LIKE '%s' AND c2.atom_id LIKE '%s' UNION SELECT c1.atom_id AS element1, c2.atom_id AS element2 FROM connected c1 JOIN bond b ON c1.atom_id = LEFT(b.bond_id, LENGTH(b.bond_id) - 1) JOIN connected c2 ON c2.atom_id = SUBSTRING(b.bond_id FROM LENGTH(b.bond_id) - 1) WHERE b.bond_type = '-' AND c1.atom_id LIKE '%n' AND c2.atom_id LIKE '%n'	toxicology
SELECT      (SELECT COUNT(*) FROM bond AS b1       JOIN atom AS a1 ON b1.bond_id = a1.atom_id       JOIN atom AS a2 ON b1.bond_id = a2.atom_id       WHERE a1.element = a2.element       GROUP BY a1.element, a2.element       ORDER BY COUNT(*) DESC       LIMIT 1) * 100 /      (SELECT COUNT(DISTINCT a.atom_id) FROM atom AS a)  FROM bond;	toxicology
SELECT SUM(CASE WHEN 'bond_type' = '-' AND 'molecule' = '+' THEN 1 ELSE 0 END) / COUNT('bond_id') AS single_bond_carcinogenic_proportion FROM bond	toxicology
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h');	toxicology
SELECT a.atom_id FROM atom a WHERE a.element = 's' AND a.atom_id IN (SELECT c.atom_id2 FROM connected c);	toxicology
SELECT b.bond_type FROM bond b JOIN atom a ON b.bond_type = a.element WHERE a.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN bond b ON a.atom_id = b.bond_type WHERE b.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN molecule m ON a.atom_id = SUBSTRING(molecule_id, 3) WHERE m.label = '+' AND (molecule_id LIKE '%p%' OR molecule_id LIKE '%br%');	toxicology
SELECT b.bond_id FROM bond b JOIN connected c1 ON b.bond_id = c1.atom_id JOIN connected c2 ON b.bond_id = c2.atom_id2 JOIN molecule m1 ON c1.atom_id LIKE CONCAT('%', m1.molecule_id, '%') JOIN molecule m2 ON c2.atom_id2 LIKE CONCAT('%', m2.molecule_id, '%') WHERE m1.molecule_id IN ('TR000', 'TR001', 'TR002', 'TR004', 'TR006') AND m2.molecule_id IN ('TR000', 'TR001', 'TR002', 'TR004', 'TR006') AND m1.molecule_id = '+' AND m2.molecule_id = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = LEFT(b.bond_id, 4) WHERE b.bond_id LIKE '%-%' AND m.label = '-';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100 AS percent_cl FROM      atom a WHERE      a.element = 'cl' AND EXISTS (         SELECT 1         FROM bond b         WHERE b.bond_type = '-' AND a.atom_id = b.atom_id     );	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id  FROM molecule  WHERE label = '-';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id BETWEEN 'TR000' AND 'TR030' AND m.label = '+';	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.element = c.atom_id WHERE c.atom_id = 'TR001_10_11';	toxicology
SELECT COUNT(bond.bond_id) FROM bond JOIN atom ON bond.bond_id LIKE CONCAT(molecule_id, '_', '%') WHERE atom.element = 'i';	toxicology
SELECT MAX(label) AS most_common_carcinogenicity FROM atom JOIN molecule ON atom.molecule_id = molecule.label WHERE molecule.label LIKE '%ca%' GROUP BY atom.molecule_id;	toxicology
SELECT      COUNT(DISTINCT a1.molecule_id) = 1 AND      COUNT(DISTINCT a2.molecule_id) = 1 FROM      atom a1 JOIN      atom a2 ON a1.molecule_id = a2.molecule_id WHERE      a1.element = 'cl' AND      a2.element = 'c' AND      a1.molecule_id = 'TR001' AND      a2.molecule_id = 'TR001' AND      a1.bond_id = 'TR001_1' AND      a2.bond_id = 'TR001_8';	toxicology
SELECT m1.label AS molecule1, m2.label AS molecule2 FROM molecule AS m1 JOIN molecule AS m2 ON m1.label = '-' AND m2.label = '-' JOIN bond ON m1.label = '-' AND bond.bond_type = '#' JOIN bond ON m2.label = '-' AND bond.bond_type = '#' JOIN atom ON m1.label = '-' AND atom.element = 'c' JOIN atom ON m2.label = '-' AND atom.element = 'c' WHERE m1.label != m2.label GROUP BY m1.label, m2.label;	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(m.molecule_id), 2) AS percentage_cl_in_carcinogenic FROM      atom a JOIN      molecule m ON a.element = m.label WHERE      m.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = "TR001" AND element IN ('cl', 'c', 'h');	toxicology
SELECT bond_type FROM bond WHERE bond_type = '=';	toxicology
SELECT a1.atom_id AS first_atom, a2.atom_id AS second_atom FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id2 JOIN connected c2 ON c1.atom_id2 = c2.atom_id2 JOIN connected c3 ON c2.atom_id2 = c3.atom_id2 JOIN atom a2 ON c3.atom_id2 = a2.atom_id WHERE c1.bond_type = '#' AND c2.bond_type = '#' AND c3.bond_type = '#' GROUP BY a1.atom_id, a2.atom_id	toxicology
SELECT DISTINCT 'atom.element'  FROM 'atom'  WHERE 'atom.element' IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND EXISTS (     SELECT 1 FROM bond WHERE bond.bond_id = 'TR005_16_26' )	toxicology
SELECT COUNT(m.label)  FROM molecule m  JOIN bond b ON m.label = '-'  WHERE b.bond_type = '-';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.label WHERE b.molecule_id = 'TR001' AND b.molecule_id LIKE 'TR001_%_%' AND SUBSTRING(b.molecule_id, 8, 2) = '10' AND SUBSTRING(b.molecule_id, 10, 2) = '11';	toxicology
SELECT bond.bond_id, molecule.label AS carcinogenic FROM bond JOIN molecule ON bond.bond_id LIKE CONCAT('%', molecule.label) WHERE molecule.label = '+' AND bond.bond_id LIKE '%#%'	toxicology
SELECT      m.label,     a.element FROM      molecule m JOIN      atom a ON m.label = '+' AND SUBSTR(a.atom_id, 7, 1) = '4' WHERE      a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT      (SELECT COUNT('h') FROM atom WHERE EXISTS (         SELECT * FROM molecule WHERE molecule.label = '+' AND atom.element = 'h' AND molecule.label = atom.label     ) AND EXISTS (         SELECT * FROM molecule WHERE molecule.label = '+' AND atom.element = 'h' AND molecule.label = atom.label     )) /      (SELECT COUNT(DISTINCT atom.label) FROM atom JOIN molecule ON atom.label = molecule.label WHERE molecule.label = '+') AS ratio,     molecule.label FROM      molecule WHERE      molecule.label = '+';	toxicology
SELECT m.label AS 'Carcinogenicity' FROM molecule AS m JOIN atom AS a ON m.label = '+' AND a.element = 'ca';	toxicology
SELECT bond_type FROM bond WHERE bond_type = '-' OR bond_type = '=' AND EXISTS (     SELECT 1     FROM atom     WHERE element = 'te' );	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM bond b JOIN atom a1 ON b.atom_id = a1.atom_id JOIN atom a2 ON b.atom_id = a2.atom_id WHERE b.bond_id = "TR001_10_11" AND a1.atom_id = SUBSTR("TR001_10_11", 7, 2) AND a2.atom_id = SUBSTR("TR001_10_11", 10, 2);	toxicology
SELECT      (SELECT COUNT(*) FROM bond WHERE bond_type = '#') * 100.0 /      (SELECT COUNT(*) FROM molecule) AS triple_bond_percentage;	toxicology
SELECT      ROUND(         SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond.bond_id),          2     ) AS percent_double_bond FROM      bond JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      molecule.molecule_id = 'TR047'	toxicology
SELECT      m.label  FROM      molecule m  JOIN      atom a ON m.label = '+'  WHERE      a.molecule_id = 'TR001_1';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+' AND label = 'TR151';	toxicology
SELECT DISTINCT element  FROM atom  WHERE molecule_id = 'TR151' AND element IN ('cl', 'br', 'i', 'pb', 'te', 'sn', 'ca');	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.atom_id IN (     SELECT atom_id     FROM atom     WHERE element = 'c' ) WHERE m.molecule_id LIKE 'TR%[1-4][0-9][0-9][0-9][0-9]'	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.atom_id = m.atom_id WHERE m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.bond_id LIKE CONCAT(SUBSTRING(b.bond_id, 1, 1), '%') WHERE m.label = '+' AND b.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.atom_id = m.label WHERE m.label = '+' AND a.atom_id LIKE 'h%';	toxicology
SELECT b.molecule_id FROM bond b JOIN connected c ON b.molecule_id = c.bond_id WHERE c.bond_id = 'TR00_1_2' AND c.bond_id LIKE 'TR00_1%'	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE a.atom_id LIKE '%c%' AND m.label != '-';	toxicology
SELECT      DIVIDE(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END), COUNT(DISTINCT a.molecule_id)) * 100.0 AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.label WHERE      m.label = '+';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+' AND label = 'TR124';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE m.label = 'TR186'	toxicology
SELECT bond_type  FROM bond  WHERE bond_type = '=' AND bond_type = '-' AND bond_type = '#' LIMIT 1;	toxicology
SELECT a.element  FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(b.bond_type) AS double_bonds_count,         CASE WHEN m.label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM bond b JOIN molecule m ON b.label = m.label WHERE m.label = 'TR006' AND b.bond_type = '=';	toxicology
SELECT m.label AS Molecule, GROUP_CONCAT(a.element ORDER BY a.element) AS Elements FROM molecule m JOIN atom a ON m.label = '+' GROUP BY m.label;	toxicology
SELECT b.bond_id, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.atom_id OR b.bond_id = c.atom_id2 WHERE b.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element ORDER BY a.element) AS elements FROM molecule m JOIN bond b ON m.molecule_id = b.bond_type JOIN atom a ON m.molecule_id = a.element WHERE b.bond_type = '#' GROUP BY m.molecule_id;	toxicology
SELECT a1.element AS element1, a2.element AS element2 FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_3';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_id IN (     SELECT bond_id     FROM bond     JOIN atom ON bond.bond_id LIKE CONCAT('%', atom.element, '%')     WHERE atom.element = 'cl' );	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.atom_id = m.atom_id WHERE m.molecule_id = 'TR346';  SELECT COUNT(DISTINCT 'bond_type') AS bond_types_count FROM bond;	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+'  AND EXISTS (     SELECT 1      FROM bond      WHERE bond.bond_type = '='      AND bond.bond_type IN (SELECT bond_type FROM bond WHERE bond_type = '=' AND bond.label = molecule.label) );	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN bond b ON m.molecule_id = b.molecule_id WHERE a.element != 's' AND b.bond_type != '='	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.label WHERE b.molecule_id = 'TR001_2_4' AND m.label = '+';	toxicology
SELECT COUNT(*)  FROM atom  WHERE atom_id LIKE 'TR005_%';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.label = a.element WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT     ROUND(         (SUM(CASE WHEN label = '+' AND element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),         2     ) AS percentage FROM     molecule JOIN     atom ON molecule.label = '+'	toxicology
SELECT b.bond_id FROM bond b WHERE b.bond_id = "TR001_1_7";	toxicology
SELECT COUNT(DISTINCT a.element)  FROM bond b  JOIN atom a ON b.bond_id = CONCAT('TR', LPAD(SUBSTRING_INDEX(a.element, '_', 1), 3, '0'), '_', LPAD(SUBSTRING_INDEX(a.element, '_', -1), 3, '0')) WHERE b.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type  FROM bond  JOIN connected ON bond.bond_type = connected.bond_type  WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2';	toxicology
SELECT molecule_id  FROM atom  WHERE atom_id = 'TR000_2' OR atom_id = 'TR000_4';	toxicology
SELECT element  FROM atom  WHERE element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')  AND element_id = 'TR000_1';	toxicology
SELECT CASE WHEN label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule WHERE label = '+';	toxicology
SELECT DIVIDE(COUNT(CASE WHEN 'bond_type' = '-' THEN 1 END), COUNT('bond_id')) AS percentage FROM bond;	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT a.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element = 's' AND b.bond_type = ' = ';	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND COUNT(a.molecule_id) > 5 GROUP BY m.molecule_id	toxicology
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.element = b.bond_type JOIN molecule m ON a.element = m.label WHERE m.label = 'TR024' AND b.bond_type = '=';	toxicology
SELECT m.label, COUNT(a.molecule_id) AS atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE m.label = '+' GROUP BY m.label ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT     ROUND(DIVIDE(COUNT(m.molecule_id), (SELECT COUNT(*) FROM molecule WHERE label = '+')) * 100.0, 2) AS percentage_carcinogenic_with_triple_bond_h FROM     molecule m JOIN     connected c ON m.molecule_id = c.atom_id OR m.molecule_id = c.atom_id2 JOIN     atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE     a.element = 'h'     AND c.atom_id <> c.atom_id2     AND m.label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND molecule_id NOT IN (SELECT molecule_id FROM bond WHERE bond_type = '=');	toxicology
SELECT COUNT(a.element)  FROM atom a  JOIN molecule m ON a.element = 'c'  WHERE m.label = 'TR008';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.atom_id = CONCAT('TR004_', m.molecule_id) WHERE m.molecule_id = 'TR004' AND a.element IN ('-', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = SUBSTRING(b.bond_id, 1, 3) WHERE b.bond_type = '=' AND SUBSTRING(b.bond_id, 5, 1) = 'o';	toxicology
SELECT COUNT(*) FROM molecule m JOIN bond b ON m.molecule_id = b.bond_type WHERE b.bond_type = '=#' AND m.label = '-'	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN bond b ON a.element = b.bond_type WHERE a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a.element = 'cl' AND b.bond_type IN ('-', '=', '#') AND EXISTS (     SELECT 1     FROM molecule     WHERE molecule_id = 'TR016'     AND molecule.molecule_id = 'TR016' );	toxicology
SELECT a.atom_id  FROM atom a  JOIN bond b ON a.atom_id = SUBSTRING(b.bond_id, 1, LENGTH(b.bond_id) - 2) WHERE a.molecule_id = "TR012"  AND b.bond_type = "=" AND a.atom_id LIKE 'TR012_c%'	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.atom_id = m.label WHERE m.label = '+' AND a.element = 'o'	toxicology
SELECT c.cardKingdomFoilId, c.cardKingdomId, c.uuid FROM cards c WHERE c.cardKingdomFoilId = c.cardKingdomId AND c.cardKingdomFoilId IS NOT NULL;	card_games
SELECT * FROM cards WHERE borderColor = 'black' AND cardKingdomFoilId IS NULL AND NOT EXISTS (     SELECT 1     FROM cards AS c     WHERE c.cardKingdomFoilId IS NOT NULL     AND c.cardKingdomFoilId = cards.cardKingdomFoilId )	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT c.uuid, c.edhrecRank FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank < 100 AND c.frameVersion = '2015' AND l.status = 'Legal';	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.name = l.status WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.status = 'gladiator';	card_games
SELECT legalities.format FROM cards JOIN legalities ON cards.types = 'Artifact' AND cards.side IS NULL WHERE legalities.format = 'vintage';	card_games
SELECT id, artist FROM cards WHERE power = '*' OR power IS NULL AND format = 'commander' AND status = 'Legal';	card_games
SELECT c.artist, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.artist = 'Stephen Daniel' WHERE c.artist = 'Stephen Daniel';	card_games
SELECT text  FROM rulings  WHERE name = 'Sublime Epiphany' AND number = '74s';	card_games
SELECT cards.name, cards.artist, cards.isPromo FROM cards JOIN (     SELECT uuid, COUNT(uuid) as ruling_count     FROM rulings     GROUP BY uuid     ORDER BY ruling_count DESC     LIMIT 1 ) AS most_rulings ON cards.uuid = most_rulings.uuid;	card_games
SELECT st.translation  FROM cards c  JOIN set_translations st ON c.setCode = st.translation  WHERE c.name = 'Annul' AND c.number = '29';	card_games
SELECT c.uuid FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_simplified FROM      cards;	card_games
SELECT s.totalSetSize FROM sets s JOIN set_translations st ON s.setCode = st.setCode WHERE st.setCode = '10E' AND s.totalSetSize IS NOT NULL;	card_games
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT `keywords`  FROM `cards`  WHERE `keywords` = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE promoTypes = 'Duress';	card_games
SELECT borderColor FROM cards WHERE borderColor = 'Ancestor''s Chosen'	card_games
SELECT `originalType` FROM `cards` WHERE `originalType` = 'Ancestor''s Chosen'	card_games
SELECT st.language FROM sets s JOIN cards c ON s.name = c.setCode JOIN set_translations st ON s.name = st.language WHERE c.setCode = (SELECT setCode FROM cards WHERE setCode = 'Angel of Mercy');	card_games
SELECT COUNT(*) FROM legalities WHERE status = 'restricted' AND isTextless = 0;	card_games
SELECT text  FROM rulings  WHERE text LIKE '%Condemn%';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT legalities.status  FROM cards  JOIN legalities ON cards.name = legalities.status  WHERE cards.name = 'Cloudchaser Eagle';	card_games
SELECT type  FROM cards  WHERE type LIKE '%Benalish Knight%';	card_games
SELECT l.format, l.status FROM cards c JOIN legalities l ON c.name = 'Benalish Knight' WHERE c.name = 'Benalish Knight';	card_games
SELECT c.artist FROM cards c JOIN legalities l ON c.artist = l.artist WHERE l.format = 'commander' OR l.format = 'duel' OR l.format = 'legacy' OR l.format = 'modern' OR l.format = 'penny' GROUP BY c.artist HAVING COUNT(l.format) = 5;	card_games
SELECT      (SELECT COUNT(*)       FROM cards       WHERE borderColor = 'borderless') * 100.0 /      (SELECT COUNT(*) FROM cards) AS percentageBorderlessCards	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.name = foreign_data.language  WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards LEFT JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian';	card_games
SELECT      (COUNT(CASE WHEN c.language = 'French' THEN 1 END) * 100.0) / COUNT(c.uuid) AS percentage_french_story_spotlight FROM      cards c WHERE      c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT artist  FROM cards  WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE availability = 'mtgo' AND borderColor = 'black';	card_games
SELECT id  FROM cards  WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords = 'Flying';	card_games
SELECT COUNT(*) FROM cards WHERE 'Summon - Angel' = 'originalType' AND 'Angel' NOT IN ('subtypes');	card_games
SELECT c1.id FROM cards c1 JOIN cards c2 ON c1.cardKingdomId = c2.cardKingdomId AND c2.cardKingdomFoilId IS NOT NULL WHERE c1.cardKingdomFoilId IS NOT NULL AND c1.id != c2.id;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.artist = foreign_data.name WHERE foreign_data.name = '祖神に選ばれし者';	card_games
SELECT c.uuid FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.availability LIKE '%paper%' AND fd.language = 'Japanese';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.borderColor = legalities.status WHERE legalities.status = 'Banned' AND cards.borderColor = 'white';	card_games
SELECT c.uuid, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.language WHERE c.uuid IN (     "5f8287b1-5bb6-5f4c-ad17-316a40d5bb0c",     "57aaebc1-850c-503d-9f6e-bb8d00d8bf7c",     "8ac972b5-9f6e-5cc8-91c3-b9a40a98232e",     "a69b404f-144a-5317-b10e-7d9dce135b24",     "6d268c95-c176-5766-9a46-c14f739aba1c" );	card_games
SELECT rulings.text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.uuid IN (SELECT uuid FROM cards WHERE text = 'Beacon of Immortality');	card_games
SELECT      c.frameVersion,      COUNT(c.uuid) AS total_cards FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.frameVersion = 'future' AND l.status = 'Legal' GROUP BY      c.frameVersion;	card_games
SELECT colorIdentity FROM cards WHERE setCode = 'OGW';	card_games
SELECT c.set translations.translation, st.language FROM cards c JOIN set_translations st ON c.setCode = st.translation WHERE c.convertedManaCost = 5.0 AND c.setCode = '10E';	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.name = r.date WHERE c.name IN (     SELECT name     FROM cards     WHERE name = 'Ancestor\'s Chosen' OR name = 'Angel of Mercy' OR name = 'Aven Cloudchaser' OR name = 'Ballista Squad' OR name = 'Bandage' );	card_games
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.colors = l.format WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.colors, c.originalType FROM cards c JOIN foreign_data fd ON c.colors = fd.language WHERE c.originalType = 'Artifact' AND c.colors = 'B';	card_games
SELECT c.uuid FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal'  AND frameVersion = '2003'  AND borderColor = 'black'  AND (availability = 'paper' OR availability = 'mtgo');	card_games
SELECT SUM(CASE WHEN artist = 'Rob Alexander' THEN 0 ELSE CAST(manaCost AS INTEGER) END) AS total_unconverted_mana FROM cards;	card_games
SELECT DISTINCT     TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX('availability', ',', numbers.n), ',', -1)) AS card_type FROM     (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) numbers WHERE n <= 1 + (LENGTH('availability') - LENGTH(REPLACE('availability', ',', ''))) AND     SUBSTRING_INDEX(SUBSTRING_INDEX('availability', ',', numbers.n), ',', -1) <> '' AND     availability = 'mtgo,paper' ORDER BY     card_type;	card_games
SELECT c.setCode FROM cards c JOIN set_translations t ON c.setCode = t.translation WHERE t.translation = 'Dixième édition';	card_games
SELECT      ROUND(         (COUNT(CASE WHEN hand = '+3' THEN 1 END) * 100.0) / COUNT(*),         2     ) AS percentage_of_legendary_cards_with_max_hand_size_3 FROM      cards WHERE      frameEffects = 'legendary'	card_games
SELECT      id,      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM cards WHERE isStorySpotlight = 1) AS percentage FROM      cards WHERE      isStorySpotlight = 1 AND isTextless = 0 GROUP BY      id;	card_games
SELECT name,        (SUM(CASE WHEN name LIKE '%Spanish%' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_spanish FROM cards GROUP BY name ORDER BY name;	card_games
SELECT st.language  FROM set_translations st  JOIN sets s ON st.translation = s.baseSetSize  WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal';	card_games
SELECT DISTINCT     CASE          WHEN 'supertypes' IS NOT NULL THEN 'supertypes'         ELSE 'subtypes'     END AS cardType FROM      cards WHERE      ('subtypes' IS NOT NULL OR 'supertypes' IS NOT NULL)     AND EXISTS (         SELECT 1         FROM set_translations         WHERE cards.setCode = set_translations.setCode         AND set_translations.language = 'German'     )	card_games
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.power IS NULL WHERE r.text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.multiverseId = l.multiverseId WHERE l.format NOT IN ('modern', 'commander', 'duel', 'legacy', 'penny') AND c.side IS NULL;	card_games
SELECT id  FROM cards  WHERE artist = 'Erica Yang' AND availability LIKE '%paper%';	card_games
SELECT artist  FROM cards  WHERE artist = "Pete Venters" OR artist = "Volkan Baǵa" OR artist = "Justin Sweet" OR artist = "Matthew D. Wilson" OR artist = "Rebecca Guay";	card_games
SELECT f.name FROM cards c JOIN foreign_data f ON c.name = f.name WHERE c.artist = 'Matthew D. Wilson' AND c.borderColor = 'black' AND c.layout = 'normal' AND f.name LIKE '%de l%';	card_games
SELECT COUNT(*) FROM cards JOIN rulings ON cards.rarity = 'rare' WHERE rulings.date = '2009-01-10';	card_games
SELECT language FROM set_translations WHERE baseSetSize = 180;	card_games
SELECT      (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.ID) AS percentage FROM      cards c JOIN      legalities l ON c.hasContentWarning = 0 WHERE      l.format = 'commander' AND l.status = 'Legal'	card_games
SELECT      (COUNT(CASE WHEN 'language' = 'French' THEN 1 END) / COUNT(CASE WHEN 'power' IS NULL OR 'power' = '*' THEN 1 END)) * 100 AS percentage FROM      'cards' WHERE      'power' IS NULL OR 'power' = '*'	card_games
SELECT      (COUNT(CASE WHEN s.type = 'expansion' THEN 1 END) * 100.0) / COUNT(*) AS percentage_japanese_expansion_sets FROM      sets s JOIN      set_translations st ON s.type = st.language WHERE      st.language = 'Japanese';	card_games
SELECT availability  FROM cards  WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor IS NULL AND colors IS NOT NULL AND edhrecRank > 12000;	card_games
SELECT      SUM(isOversized) AS TotalOversized,     SUM(isReprint) AS TotalReprinted,     SUM(isPromo) AS TotalPromoPrinted FROM      cards;	card_games
SELECT name  FROM cards  WHERE power IS NULL OR power = '*'    AND promoTypes = 'arenaleague'  ORDER BY name ASC  LIMIT 3;	card_games
SELECT language  FROM foreign_data  JOIN cards ON foreign_data.language = cards.language  WHERE cards.multiverseid = 149934;	card_games
SELECT id, cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) * 100) / COUNT(*) AS proportion FROM      cards WHERE      isTextless = 1	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name ASC  LIMIT 3;	card_games
SELECT st.language FROM set_translations st JOIN sets s ON st.language = s.code WHERE s.code = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.name = st.translation WHERE s.id = 5;	card_games
SELECT s.type, t.translation FROM sets s JOIN set_translations t ON s.code = t.translation WHERE s.code = '206';	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Italian' WHERE s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.name, s.id FROM sets s JOIN foreign_data fd ON s.name = fd.language WHERE fd.language = 'Japanese' AND s.isForeignOnly = 1 AND s.isFoilOnly = 1;	card_games
SELECT s.name, s.baseSetSize FROM sets s WHERE s.name IN (     SELECT st.name     FROM set_translations st     WHERE st.language = 'Russian' ) ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      (COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 END) * 100) / COUNT(*) FROM      cards;	card_games
SELECT COUNT(*) FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' AND NOT EXISTS (     SELECT 1     FROM set_translations     WHERE sets.mtgoCode = set_translations.mtgoCode     AND set_translations.language = 'Japanese' )	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id;	card_games
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language  FROM set_translations  WHERE code = '174';	card_games
SELECT name FROM sets WHERE name = 'Fourth Edition Foreign Black Border';	card_games
SELECT name  FROM foreign_data  WHERE name = 'A Pedra Fellwar';	card_games
SELECT code  FROM sets  WHERE releaseDate = '2007-07-13';	card_games
SELECT 'baseSetSize', 'setCode' FROM sets WHERE 'blockName' = 'Masques' OR 'blockName' = 'Mirage';	card_games
SELECT code  FROM sets  WHERE type = 'expansion';	card_games
SELECT      foreign_data.name AS foreign_name,      cards.type AS card_type FROM      cards JOIN      foreign_data ON cards.uuid = foreign_data.uuid WHERE      cards.watermark = 'boros';	card_games
SELECT fd.type, fd.text, c.uuid FROM cards c JOIN foreign_data fd ON c.uuid = fd.text WHERE fd.type LIKE '%colorpie%'	card_games
SELECT      (COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM      cards c JOIN      sets s ON c.name = s.name WHERE      s.name = 'Abyssal Horror';	card_games
SELECT DISTINCT setCode FROM Sets WHERE expansionCommander IS NOT NULL;	card_games
SELECT fd.name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Abzan';	card_games
SELECT type FROM cards WHERE watermark = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.availability LIKE '%paper%' WHERE l.status = 'Legal' AND c.availability LIKE '+%'	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT manaCost  FROM cards  WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power IS NULL OR power = '*');	card_games
SELECT name  FROM cards  WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE subtypes LIKE '%,Maro-Sorcerer%' OR supertypes LIKE '%,Maro-Sorcerer%';	card_games
SELECT      JSON_UNQUOTE(JSON_EXTRACT('purchaseUrls', '$.cardKingdom')) AS cardKingdom,      JSON_UNQUOTE(JSON_EXTRACT('purchaseUrls', '$.cardmarket')) AS cardMarket,      JSON_UNQUOTE(JSON_EXTRACT('purchaseUrls', '$.tcgplayer')) AS tcgPlayer FROM      cards WHERE      promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE availability LIKE '%mtgo%'  AND availability LIKE '%arena%'  AND borderColor = 'black';	card_games
SELECT      CASE          WHEN MAX(c1.convertedManaCost) > MAX(c2.convertedManaCost) THEN 'Serra Angel'         WHEN MAX(c1.convertedManaCost) < MAX(c2.convertedManaCost) THEN 'Shrine Keeper'         ELSE 'Both cards have the same cost'     END AS CardWithHigherManaCost FROM      (SELECT MAX(convertedManaCost) AS convertedManaCost FROM cards WHERE name = 'Serra Angel') c1,     (SELECT MAX(convertedManaCost) AS convertedManaCost FROM cards WHERE name = 'Shrine Keeper') c2;	card_games
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name  FROM cards  WHERE frameVersion = '2003'  ORDER BY convertedManaCost DESC  LIMIT 3;	card_games
SELECT t.translation FROM set_translations t JOIN (     SELECT language     FROM set_translations     WHERE translation = 'Ancestor''s Chosen' ) a ON t.language = a.language WHERE t.language = 'Italian';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE 'Angel of Mercy' IN (SELECT name FROM cards);	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.name = s.code  JOIN set_translations st ON s.code = st.translation  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS (     SELECT 1     FROM cards AS c     JOIN set_translations AS st ON c.name = st.translation     WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Korean' ) AS has_korean_translation;	card_games
SELECT COUNT(*) FROM cards WHERE setCode = '10E' AND artist = 'Adam Rex';	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.baseSetSize = st.translation WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT translation FROM sets JOIN set_translations ON sets.name = set_translations.translation WHERE sets.name = 'Eighth Edition' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.name = l.status  WHERE c.name = 'Angel of Mercy'  AND l.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate  FROM sets s JOIN cards c ON s.releaseDate = c.name  WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT type FROM sets WHERE type = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(*)  FROM sets s  JOIN set_translations st ON s.code = st.language  WHERE s.code IN ('10E', '2ED', '3ED', '4BB') AND st.language = 'Italian';	card_games
SELECT name  FROM sets  WHERE name = 'Adarkar Valkyrie' AND isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE baseSetSize < 10 AND EXISTS (     SELECT 1     FROM set_translations     WHERE sets.baseSetSize = set_translations.baseSetSize     AND translation LIKE '%Edizione%' );	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.name = sets.name WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black';	card_games
SELECT name  FROM cards  WHERE name = 'Coldsnap'  ORDER BY convertedManaCost DESC  LIMIT 1;	card_games
SELECT artist FROM cards WHERE setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT c.number FROM cards c JOIN sets s ON c.number = 4 AND s.name = 'Coldsnap';	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN (     SELECT name     FROM cards     WHERE name = 'Coldsnap' AND convertedManaCost > 5 ) AS T2 ON T1.name = T2.name WHERE T1.power IS NULL;	card_games
SELECT cards.flavorText FROM cards JOIN foreign_data ON cards.flavorText = foreign_data.language WHERE foreign_data.language = 'Italian' AND cards.flavorText = 'Ancestor''s Chosen'	card_games
SELECT fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL;	card_games
SELECT t.translation FROM cards c JOIN set_translations t ON c.name = t.translation WHERE c.name = 'Ancestor''s Chosen' AND t.language = 'German';	card_games
SELECT set_translations.translation FROM rulings JOIN set_translations ON rulings.text LIKE CONCAT('%', 'Coldsnap', '%') WHERE set_translations.language = 'Italian';	card_games
SELECT name FROM cards WHERE name = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT r.date  FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.uuid = '5f8287b1-5bb6-5f4c-ad17-316a40d5bb0c';	card_games
SELECT     (SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(c.convertedManaCost) FROM     cards c JOIN     sets s ON c.set = s.name WHERE     s.name = 'Coldsnap'	card_games
SELECT      (SUM(CASE WHEN card.cardKingdomFoilId = card.cardKingdomId AND card.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100.0) /      (SELECT COUNT(*) FROM cards WHERE name = 'Coldsnap') AS percentage_incredibly_powerful FROM cards AS card JOIN sets AS set_table ON card.setCode = set_table.code WHERE set_table.name = 'Coldsnap';	card_games
SELECT code  FROM sets  WHERE releaseDate = '2017-07-14';	card_games
SELECT `keyruneCode` FROM `sets` WHERE `code` = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE mcmId IS NOT NULL AND EXISTS (SELECT 1 FROM sets WHERE code = 'SS2')	card_games
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09';	card_games
SELECT `type` FROM `sets` WHERE `name` LIKE 'From the Vault: Lore%'	card_games
SELECT parentCode  FROM sets  WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.artist, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards c JOIN rulings r ON c.artist = r.artist WHERE c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate  FROM sets s  JOIN cards c ON s.releaseDate = c.setCode  WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.baseSetSize = set_translations.translation  WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT s.code AS expansionType FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.setCode = (SELECT code FROM sets WHERE code = '10E') AND s.code = 'Huitième édition';	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.translation WHERE st.language = 'French' AND st.translation = 'Tendo Ice Bridge';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.name = set_translations.translation WHERE sets.name = 'Salvat 2011' AND set_translations.translation IS NOT NULL;	card_games
SELECT st.translation  FROM cards c  JOIN set_translations st ON c.setCode = st.translation  WHERE c.name = 'Fellwar Stone' AND st.translation LIKE '核心系列%';	card_games
SELECT MAX(convertedManaCost), name FROM cards WHERE name = 'Journey into Nyx Hero''s Path' GROUP BY name;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.setID = st.setID WHERE st.setTranslation = 'Ola de frío';	card_games
SELECT `type`  FROM `sets`  WHERE `name` = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards WHERE name = 'World Championship Decks 2004' AND convertedManaCost = 3.0;	card_games
SELECT translation FROM sets JOIN set_translations ON sets.name = set_translations.translation WHERE sets.name = 'Mirrodin' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT      (SUM(CASE WHEN sets.isNonFoilOnly = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN cards.language = 'Japanese' THEN 1 ELSE 0 END)) * 100 AS percentage_non_foil_japanese_cards FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      cards.language = 'Japanese'	card_games
SELECT      (SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      cards WHERE      language = 'Portuguese (Brazil)';	card_games
SELECT `availability` FROM `cards` WHERE `artist` != 'Aleksi Briclot' AND `isTextless` = 1;	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY artist LIMIT 1;	card_games
SELECT cardKingdomFoilId, MAX(frameEffects) FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY cardKingdomFoilId ORDER BY MAX(frameEffects) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE duelDeck = 'a' AND (power IS NULL OR power = '*') AND hasFoil = 0;	card_games
SELECT MAX(totalSetSize) AS highestTotalCards, id FROM sets WHERE type = 'commander' GROUP BY id ORDER BY highestTotalCards DESC LIMIT 1;	card_games
SELECT manaCost FROM cards JOIN legalities ON cards.manaCost = legalities.format WHERE legalities.format = 'duel' ORDER BY LENGTH(manaCost) DESC LIMIT 10;	card_games
SELECT c.originalReleaseDate, l.format FROM cards c JOIN legalities l ON c.originalReleaseDate = (SELECT MIN(originalReleaseDate) FROM cards WHERE rarity = 'mythic' AND status = 'legal') WHERE c.rarity = 'mythic' AND c.status = 'legal';	card_games
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.artist = 'Volkan Baga' AND foreign_data.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.name = legalities.status WHERE cards.rarity = 'rare'  AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT legalities.format, COUNT(foreign_data.name) AS banned_count FROM legalities JOIN foreign_data ON legalities.format = foreign_data.name WHERE foreign_data.name IS NOT NULL AND foreign_data.name LIKE '%banned%' GROUP BY legalities.format ORDER BY banned_count DESC LIMIT 1;	card_games
SELECT language  FROM set_translations  WHERE setCode = (SELECT setCode FROM set_translations WHERE language = 'Battlebond');	card_games
SELECT artist, format FROM cards WHERE artist = (SELECT artist FROM cards GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1) ORDER BY artist;	card_games
SELECT legalities.status FROM cards JOIN legalities ON cards.artist = 'D. Alexander Gregory' WHERE cards.frameVersion = '1997' AND cards.hasContentWarning = 1 AND legalities.format = 'legacy' AND (legalities.status = 'Legal' OR legalities.status = 'Wizards of the Coast');	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.name = l.format WHERE c.edhrecRank = 1 AND l.format = 'banned';	card_games
SELECT AVG(id)  FROM sets  WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate);	card_games
SELECT artist  FROM cards  WHERE availability = 'arena' AND artist IN (SELECT artist FROM cards WHERE BorderColor = 'black');	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'banned' OR status = 'restricted');	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.artist = c.artist WHERE c.artist = 'Kev Walker' ORDER BY r.text DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.name = l.format WHERE c.name IN (     SELECT name     FROM cards     JOIN sets ON cards.name = sets.name     WHERE sets.name = 'Hour of Devastation' AND c.status = 'legal' );	card_games
SELECT s.name FROM sets s JOIN set_translations st1 ON s.name = st1.language WHERE st1.language NOT LIKE '%Japanese%' AND EXISTS (     SELECT 1     FROM set_translations st2     WHERE s.name = st2.language     AND st2.language = 'Korean' );	card_games
SELECT c.frameVersion FROM cards c JOIN legalities l ON c.artist = 'Allen Williams' AND l.status = 'Legal' WHERE l.status = 'banned';	card_games
SELECT      CASE          WHEN MAX(CASE WHEN 'DisplayName' = "Harlan" THEN 'Reputation' END) >               MAX(CASE WHEN 'DisplayName' = "Jarrod Dixon" THEN 'Reputation' END)          THEN "Harlan"          ELSE "Jarrod Dixon"      END AS HigherReputation FROM      'users';	codebase_community
SELECT `DisplayName` FROM `users` WHERE YEAR(`CreationDate`) = 2014;	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00';	codebase_community
SELECT DisplayName FROM users JOIN (     SELECT AccountId, MAX(Views) as MaxViews     FROM another_table -- Assuming there is another table with Views column     GROUP BY AccountId ) as MaxViewUsers ON users.AccountId = MaxViewUsers.AccountId;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND Id NOT IN (SELECT Id FROM users WHERE UpVotes = 0);	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(*)  FROM posts  INNER JOIN users ON posts.OwnerUserId = users.OwnerUserId  WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.Title = 'Eliciting priors from experts' AND u.DisplayName IS NOT NULL WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title FROM posts JOIN users ON posts.ViewCount = (SELECT MAX(ViewCount) FROM posts) WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.OwnerUserId = p.OwnerUserId WHERE p.OwnerUserId = (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     ORDER BY MAX(FavoriteCount) DESC     LIMIT 1 );	codebase_community
SELECT SUM(CommentCount) AS TotalComments FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT AnswerCount  FROM posts  WHERE DisplayName = 'csgillespie'  ORDER BY AnswerCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.DisplayName WHERE p.LastEditorUserId IS NOT NULL AND p.LastEditorUserId = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM posts JOIN users ON posts.OwnerUserId = users.OwnerUserId WHERE users.DisplayName = 'csgillespie' AND posts.ParentId IS NULL	codebase_community
SELECT u.DisplayName  FROM users u JOIN posts p ON u.OwnerUserId = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE Score >= 20 AND Age > 65;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.OwnerUserId = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN (     SELECT MAX(Count) AS MaxCount     FROM tags ) AS t ON p.Id = t.MaxCount WHERE p.Id = t.MaxCount;	codebase_community
SELECT COUNT(b.Id)  FROM badges b  JOIN users u ON b.Id = u.Id  WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.Name = 'Teacher' AND u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM badges WHERE Date >= '2011-01-01 00:00:00.0' AND Date < '2012-01-01 00:00:00.0' AND EXISTS (SELECT 1 FROM users WHERE users.DisplayName = 'csgillespie' AND users.DisplayName = badges.DisplayName);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.DisplayName = b.Id GROUP BY u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(Score)  FROM posts  JOIN users ON posts.OwnerUserId = users.OwnerUserId  WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(DISTINCT u.DisplayName) AS avg_badges_per_user FROM badges b JOIN users u ON b.Id IN (SELECT Id FROM badges) WHERE u.Views > 200;	codebase_community
SELECT      ROUND((SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) * 100.0) / COUNT(p.Id), 2) AS ElderUserPercentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 20;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate  FROM votes  GROUP BY CreationDate  ORDER BY COUNT(Id) DESC  LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.Score WHERE c.Score = (SELECT MAX(Score) FROM comments) AND c.Score IS NOT NULL;	codebase_community
SELECT CommentCount FROM posts WHERE ViewCount = 1910	codebase_community
SELECT p.FavoriteCount FROM comments c JOIN posts p ON c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0' WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0';	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 LIMIT 1;	codebase_community
SELECT      p.ClosedDate IS NOT NULL AS wellFinished FROM      posts p JOIN      comments c ON p.ClosedDate IS NULL WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT Reputation  FROM users  WHERE Reputation = 101;	codebase_community
SELECT COUNT(p.OwnerUserId)  FROM posts p  JOIN users u ON p.OwnerUserId = u.OwnerUserId  WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName  FROM votes v  JOIN users u ON v.UserId = u.UserId  WHERE v.UserId = 6347;	codebase_community
SELECT COUNT(v.Id)  FROM posts p JOIN votes v ON p.Title LIKE '%data visualization%'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.Name = u.DisplayName WHERE u.DisplayName = "DatEpicCoderGuyWhoPrograms";	codebase_community
SELECT      (SELECT COUNT(*) FROM posts WHERE posts.Id = users.Id) /      (SELECT COUNT(*) FROM votes WHERE votes.Id = users.Id) AS post_vote_ratio FROM users WHERE users.Id = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text  FROM comments  WHERE Score = 17;	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.DisplayName = v.UserId WHERE u.WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.UserId FROM badges b JOIN users u ON b.UserId = u.UserId WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.DisplayName WHERE c.Text = 'thank you user93'	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.UserId WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.DisplayName = (SELECT DisplayName FROM users WHERE Reputation = (SELECT Reputation FROM posts WHERE Id = (SELECT Id FROM posts WHERE Title = 'Understanding what Dassault iSight is doing?')));	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.Text LIKE CONCAT('%gentle boosting differ from AdaBoost%', '%') WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.DisplayName = b.Name WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT 'LastEditorUserId' FROM 'posts' WHERE 'Title' = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.DisplayName WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score), u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.DisplayName WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.post_id = p.id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(B.BountyAmount) AS TotalBountyAmount FROM posts P LEFT JOIN votes B ON P.Title LIKE '%data%'	codebase_community
SELECT v.DisplayName FROM votes v JOIN posts p ON v.PostID = p.PostID WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%';	codebase_community
SELECT p.Title, p.ViewCount, t.TagName, AVG(p.ViewCount) as AvgViewCount FROM posts p JOIN tags t ON p.Id = t.Id WHERE t.TagName = 'humor' GROUP BY p.Id;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Id = 13;	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND YEAR(b.Date) = 2011;	codebase_community
SELECT COUNT(u.Id)  FROM users u JOIN (     SELECT Name, COUNT(Name) AS badge_count      FROM badges      GROUP BY Name      HAVING COUNT(Name) > 5 ) b ON u.Id = b.badge_count	codebase_community
SELECT COUNT(DISTINCT u.UserId) FROM users u JOIN badges b ON u.UserId = b.UserId WHERE u.Location = 'New York, NY' AND b.Name IN ('Teacher', 'Supporter')	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.OwnerUserId = p.OwnerUserId WHERE p.OwnerUserId = 1;	codebase_community
SELECT p.ViewCount FROM posts p JOIN postHistory ph ON p.ViewCount >= 1000 AND ph.PostId = p.ViewCount GROUP BY ph.PostId HAVING COUNT(DISTINCT ph.PostId) = 1;	codebase_community
SELECT u.Id, u.DisplayName, b.Name FROM users u JOIN comments c ON u.Id = c.UserId JOIN badges b ON u.Id = b.Name GROUP BY u.Id, u.DisplayName, b.Name ORDER BY COUNT(c.Id) DESC;	codebase_community
SELECT COUNT(*)  FROM users  JOIN badges ON users.DisplayName = badges.Name  WHERE users.Location = 'India' AND badges.Name = 'Teacher';	codebase_community
SELECT      ((COUNT(CASE WHEN Year(b.Date) = 2010 THEN b.Name END) / COUNT(b.Name)) -       (COUNT(CASE WHEN Year(b.Date) = 2011 THEN b.Name END) / COUNT(b.Name)) * 100 AS PercentageDifference FROM badges b WHERE b.Name = 'Student'	codebase_community
SELECT PostHistoryTypeId FROM postHistory WHERE PostHistoryTypeId IN (SELECT PostHistoryTypeId FROM comments WHERE PostId = 3720);  SELECT COUNT(DISTINCT UserId)  FROM comments  WHERE PostId = 3720;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT p.Id, pl.LinkTypeId FROM posts p LEFT JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE p.Id = 395;	codebase_community
SELECT Id FROM posts WHERE Score > 60;  SELECT DISTINCT OwnerUserId FROM posts WHERE Score > 60;	codebase_community
SELECT SUM(CASE WHEN UserId = 686 THEN 1 ELSE 0 END) AS TotalVotesIn2011 FROM votes WHERE YEAR(CreationDate) = 2011;	codebase_community
SELECT AVG(u.UpVotes) AS AvgUpVotes, AVG(u.Age) AS AvgAge FROM users u JOIN (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(*) > 10 ) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = "Announcer";	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT('Id') FROM 'posts' WHERE 'Score' = 10;	codebase_community
SELECT b.Name FROM badges b JOIN (     SELECT MAX(Reputation) AS MaxReputation     FROM users ) u ON b.Name IN (     SELECT Name     FROM badges     JOIN users ON badges.Name = users.Id     GROUP BY badges.Name     HAVING COUNT(DISTINCT users.Id) = (SELECT MAX(COUNT(DISTINCT users.Id))                                       FROM badges                                       JOIN users ON badges.Name = users.Id                                       GROUP BY badges.Name) ) b;	codebase_community
SELECT u.Reputation  FROM users u  JOIN badges b ON u.Reputation = b.Id  WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.Name = u.DisplayName WHERE u.DisplayName = "Pierre";	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.Date = u.Date WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT      ROUND(         (COUNT(b.UserId) / (SELECT COUNT(DISTINCT 'users.Id' FROM 'users')) * 100),          2     ) AS PercentageOfUsersWithTeacherBadge FROM      'badges' AS b WHERE      b.Name = 'Teacher';	codebase_community
SELECT   ROUND(     (COUNT(u.UserId) * 100.0) / SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END),     2   ) AS PercentageOfTeenagers FROM   users u JOIN   badges b ON u.UserId = b.UserId WHERE   b.Name = 'Organizer';	codebase_community
SELECT c.Score FROM comments c JOIN posts p ON c.PostID = p.ID WHERE p.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT `Age` FROM `users` WHERE `Location` = 'Vienna, Austria';	codebase_community
SELECT COUNT(*) FROM users u JOIN badges b ON u.Age BETWEEN 19 AND 65 AND b.Name = 'Supporter';	codebase_community
SELECT u.Views FROM users u WHERE EXISTS (     SELECT 1     FROM badges b     WHERE b.Date = '2010-07-19 19:39:08.0' AND u.Views IS NOT NULL );	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.Name = 'Teacher' WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.Name = u.DisplayName  WHERE u.DisplayName = 'Sharpie';	codebase_community
SELECT COUNT(*) FROM users WHERE Age > 65 AND EXISTS (     SELECT 1     FROM badges     WHERE badges.Name = 'Supporter' AND users.Id = badges.Name );	codebase_community
SELECT DisplayName FROM users WHERE ID = 30;	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Views` = (SELECT MAX(`Views`) FROM `users`);	codebase_community
SELECT      (COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id END) / COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id END)) AS Ratio FROM votes;	codebase_community
SELECT TagName  FROM tags  JOIN users ON tags.TagName = users.DisplayName  WHERE users.DisplayName = 'John Stauffer';	codebase_community
SELECT COUNT(*)  FROM users  WHERE DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE UserId = (SELECT UserId FROM users WHERE DisplayName = 'Harlan');	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.Id = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT MAX(SUM(ViewCount))  FROM posts  WHERE (DisplayName = 'Harvey Motulsky' OR DisplayName = 'Noah Snyder')  GROUP BY DisplayName	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Matt Parker'  AND p.Id > 4	codebase_community
SELECT COUNT(*)  FROM comments  JOIN users ON comments.Score < 60 AND users.DisplayName = 'Neil McGuigan'	codebase_community
SELECT DISTINCT t.TagName FROM tags t JOIN posts p ON t.TagName = p.TagName LEFT JOIN comments c ON p.Id = c.PostId WHERE p.OwnerUserId = (SELECT OwnerUserId FROM users WHERE DisplayName = 'Mark Meckes') AND c.PostId IS NULL	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.DisplayName = b.Name WHERE b.Name = 'Organizer';	codebase_community
SELECT      CAST(COUNT(CASE WHEN T1.TagName = 'r' THEN T1.PostId ELSE NULL END) AS REAL) / COUNT(T1.PostId) * 100 AS percentage FROM      tags AS T1 JOIN      posts AS T2 ON T1.TagId = T2.TagId WHERE      T2.DisplayName = 'Community';	codebase_community
SELECT     (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -       SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS DifferenceInViewCount FROM     posts p JOIN     users u ON p.ViewCount = u.DisplayName	codebase_community
SELECT COUNT(u.Id)  FROM users u  JOIN badges b ON u.Id = b.Id  WHERE b.Name = 'Commentator' AND DATE_FORMAT(Date, '%Y') = '2014'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age FROM users WHERE Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT LastEditorUserId, LastEditDate  FROM posts  WHERE Title = 'Detecting a given face in a database of facial images'  ORDER BY LastEditDate DESC  LIMIT 1;	codebase_community
SELECT COUNT(*) FROM comments WHERE Score < 60 AND UserId = 13;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Title IS NOT NULL AND p.Title != '' AND c.PostId = p.Title AND c.Score > 60;	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.Name = users.Location WHERE users.Location = 'North Pole' AND badges.Name LIKE 'Teacher' AND (SELECT YEAR(Date) FROM badges WHERE badges.Name = users.Location) = 2011;	codebase_community
SELECT u.WebsiteUrl, p.OwnerDisplayName FROM posts p JOIN users u ON p.OwnerDisplayName = u.WebsiteUrl WHERE p.FavoriteCount > 150;	codebase_community
SELECT     (SELECT COUNT(*) FROM postHistory WHERE Text LIKE '%What is the best introductory Bayesian statistics textbook%') AS PostHistoryCount,     (SELECT LastEditDate FROM posts WHERE LastEditDate IS NOT NULL AND Text LIKE '%What is the best introductory Bayesian statistics textbook%') AS LastEditDate	codebase_community
SELECT `LastAccessDate`, `Location` FROM `users` WHERE `DisplayName` = 'Community' OR `DisplayName` = 'Geoff Dalgas' OR `DisplayName` = 'Jarrod Dixon' OR `DisplayName` = 'Emmett' OR `DisplayName` = 'Shane';	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Title = "How to tell if something happened in a data set which monitors a value over time"	codebase_community
SELECT u.CreationDate, b.Date FROM users u JOIN badges b ON u.DisplayName = 'Samuel' AND YEAR(u.CreationDate) = 2013 AND YEAR(b.Date) = 2013;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.OwnerUserId WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.OwnerUserId = p.OwnerUserId WHERE p.OwnerUserId IN (     SELECT OwnerUserId     FROM posts     WHERE TagName = 'hypothesis-testing' );	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.PostId = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT u1.DisplayName FROM users u1 JOIN users u2 ON u1.DisplayName = u2.DisplayName WHERE u2.DisplayName = (     SELECT MAX(Score) FROM posts     WHERE ParentID IS NOT NULL ) AND u2.ParentID IS NOT NULL;	codebase_community
SELECT u.DisplayName, u.WebsiteURL FROM users u JOIN votes v ON u.UserId = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT `OwnerUserId` FROM `posts` ORDER BY `FavoriteCount` DESC LIMIT 1;	codebase_community
SELECT MAX(Age) FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(v.CreationDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT AccountId  FROM users  WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT p.Score FROM posts p JOIN tags t ON p.Score = t.Count WHERE t.Count = (SELECT MAX(Count) FROM tags) LIMIT 1;	codebase_community
SELECT      COUNT(postLinks.Id) / 12 AS AverageMonthlyLinks FROM      postLinks JOIN      posts ON postLinks.Id = posts.Id WHERE      YEAR(postLinks.CreationDate) = 2010 AND      posts.AnswerCount <= 2;	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.UserId WHERE v.UserId = 1465 GROUP BY p.Id ORDER BY SUM(v.UserId) DESC LIMIT 1;	codebase_community
SELECT p.Title  FROM posts p  JOIN postLinks pl ON p.Title = pl.Title  WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.DisplayName = b.Name GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;	codebase_community
SELECT MIN('CreationDate')  FROM 'votes'  WHERE 'users.Id' = (SELECT 'Id' FROM 'users' WHERE 'DisplayName' = 'chl');	codebase_community
SELECT MIN(posts.Id), MIN(users.Age) FROM users JOIN posts ON users.Id = posts.Id WHERE users.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.DisplayName = b.UserId WHERE b.Date = (SELECT MIN(Date) FROM badges WHERE 'Autobiographer' = (SELECT Name FROM badges WHERE UserId = b.UserId)) AND (SELECT Name FROM badges WHERE UserId = b.UserId) = 'Autobiographer' LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.UserId) FROM users u JOIN votes v ON u.UserId = v.UserId WHERE u.Location = 'United Kingdom' GROUP BY u.UserId HAVING SUM(v.FavoriteCount) >= 4;	codebase_community
SELECT AVG(v.PostId)  FROM votes v JOIN users u ON v.PostId = u.Age WHERE u.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Reputation` = (SELECT MAX(`Reputation`) FROM `users`);	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(p.Id)  FROM posts p JOIN users u ON p.Id = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(u.CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title  FROM posts p  JOIN users u ON p.Id = u.Id  WHERE u.DisplayName = 'Harvey Motulsky'  ORDER BY p.ViewCount DESC  LIMIT 1;	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1;	codebase_community
SELECT AVG('posts.Score')  FROM 'posts'  JOIN 'users' ON 'posts.DisplayName' = 'users.DisplayName'  WHERE 'users.DisplayName' = 'Stephen Turner';	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.OwnerUserId = p.OwnerUserId WHERE p.ViewCount > 20000;	codebase_community
SELECT Id, OwnerDisplayName  FROM posts  WHERE year(CreationDate) = 2010  ORDER BY FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN p.OwnerUserId IN (SELECT u.OwnerUserId FROM users u WHERE u.Reputation > 1000) THEN 1 ELSE NULL END) * 100.0) / COUNT(*),          2     ) AS percentage FROM      posts p;	codebase_community
SELECT DIVIDE(COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 END), COUNT(Id)) AS percentage FROM users;	codebase_community
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.DisplayName WHERE p.ViewCount IS NOT NULL AND p.ViewCount = (SELECT MAX(ViewCount) FROM posts WHERE ViewCount IS NOT NULL AND DisplayName = 'Computer Game Datasets')	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*)  FROM comments  WHERE post_id = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1);	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.DisplayName = p.DisplayName WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.Name = u.Name WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT TIMESTAMPDIFF(SECOND, CreationDate, stats_badges.Date) AS TimeToBadge FROM users JOIN stats_badges ON users.DisplayName = stats_badges.DisplayName WHERE users.DisplayName = 'Zolomon';	codebase_community
SELECT u.CreationDate, COUNT(DISTINCT p.Id) AS PostCount, COUNT(c.PostId) AS CommentCount FROM users u LEFT JOIN posts p ON u.CreationDate = (SELECT MAX(CreationDate) FROM users) LEFT JOIN comments c ON p.Id = c.PostId GROUP BY u.CreationDate;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.PostId = (SELECT PostId FROM comments WHERE Text = 'Analysing wind data with R' ORDER BY CreationDate DESC LIMIT 1) WHERE c.CreationDate = (SELECT MAX(CreationDate) FROM comments WHERE PostId = (SELECT PostId FROM comments WHERE Text = 'Analysing wind data with R')) AND c.Text = (SELECT Text FROM comments WHERE PostId = (SELECT PostId FROM comments WHERE Text = 'Analysing wind data with R' ORDER BY CreationDate DESC LIMIT 1));	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE EXISTS (SELECT 1 FROM badges WHERE UserId = b.UserId AND 'Citizen Patrol' = badge_name);	codebase_community
SELECT COUNT(*) FROM posts WHERE Id IN (SELECT Id FROM tags WHERE TagName = 'careers');	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT      COUNT(c.Id) AS comment_count,     COALESCE(SUM(CASE WHEN p.AcceptedAnswerId IS NOT NULL THEN 1 ELSE 0 END), 0) AS answer_count FROM      posts p LEFT JOIN      comments c ON p.AcceptedAnswerId = c.Id WHERE      p.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate  FROM users  WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30;	codebase_community
SELECT      (COUNT(CASE WHEN posts.Score >= 50 THEN posts.Id ELSE NULL END) * 100.0) /      COUNT(posts.Id) AS percentage FROM      posts INNER JOIN      users ON posts.Id = users.Reputation WHERE      users.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT excerpt_post_id, wiki_post_id  FROM posts_tags  WHERE tag_name = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.UserId = c.UserId WHERE c.UserId IN (     SELECT UserId     FROM comments     WHERE UserId IN (         SELECT UserId         FROM comments         WHERE Text = 'fine, you win :)'     ) );	codebase_community
SELECT posts.Title FROM posts JOIN comments ON posts.PostId = comments.PostId WHERE posts.Title = 'How can I adapt ANOVA for binary data?';	codebase_community
SELECT MAX(c.Score) AS HighestCommentScore FROM comments c JOIN posts p ON c.Score = (SELECT MAX(Score) FROM comments WHERE p.ViewCount BETWEEN 100 AND 150) WHERE p.ViewCount BETWEEN 100 AND 150;	codebase_community
SELECT `CreationDate`, `Age` FROM `users` WHERE `CreationDate` IN (     SELECT `CreationDate`     FROM `users`     WHERE `Age` IS NOT NULL     AND `CreationDate` IN (         SELECT `CreationDate`         FROM `users`         WHERE `CreationDate` LIKE '%http://%'     ) );	codebase_community
SELECT COUNT(p.ViewCount)  FROM posts p  JOIN comments c ON p.ViewCount < 5  WHERE c.Score = 0;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score = 0  AND Id IN (SELECT Id FROM posts WHERE CommentCount = 1);	codebase_community
SELECT COUNT(DISTINCT c.UserId) FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.Age = 40 AND c.UserId IN (SELECT UserId FROM comments WHERE score = 0);	codebase_community
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.Id WHERE p.Id = (SELECT Id FROM posts WHERE Text = 'Group differences on a five point Likert item')	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.UserId JOIN (     SELECT UserId     FROM comments     JOIN (         SELECT Text, MIN(Id) AS MinId         FROM comments         GROUP BY Text     ) AS c_min ON c.Id = c_min.MinId     WHERE c_min.Text = 'R is also lazy evaluated.' ) AS c_text ON c.UserId = c_text.UserId;	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.Id = u.DisplayName WHERE u.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT c.UserDisplayName FROM comments c LEFT JOIN votes v ON c.UserId = v.UserId WHERE c.UserId IS NOT NULL AND v.UserId IS NULL AND c.Score BETWEEN 1 AND 5;	codebase_community
SELECT   (COUNT(CASE WHEN u.UpVotes = 0 THEN c.UserId END) * 100.0) / COUNT(c.UserId) AS percentage FROM   comments c JOIN   users u ON c.UserId = u.Id WHERE   c.Score BETWEEN 5 AND 10;	codebase_community
SELECT hp.power_id FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.power_id JOIN (     SELECT id     FROM superhero     WHERE superhero_name = '3-D Man' ) AS sd ON s.id = sd.id;	superhero
SELECT COUNT(DISTINCT superhero.id)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.hero_id = superpower.power_name  WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND power_name = 'Super Strength';	superhero
SELECT superhero.full_name FROM superhero WHERE superhero.full_name IN (     SELECT hero_power.full_name     FROM hero_power     GROUP BY hero_power.full_name     HAVING COUNT(hero_power.power_id) > 15 );	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.id = (SELECT id FROM colour WHERE name = 'Blue');	superhero
SELECT c.id, c.id AS colour_id FROM superhero AS s JOIN colour AS c ON s.skin_colour_id = c.id WHERE s.skin_colour_id IN (SELECT id FROM colour WHERE id = (SELECT id FROM superhero WHERE superhero_name = 'Apocalypse'))	superhero
SELECT COUNT(DISTINCT superhero.id)  FROM superhero  JOIN power ON superhero.id = power.superhero_id  JOIN power_ability ON power.id = power_ability.power_id  JOIN ability ON power_ability.ability_id = ability.id  JOIN ability_type ON ability.ability_type_id = ability_type.id  JOIN eye_colour ON superhero.eye_colour_id = eye_colour.id  WHERE eye_colour.colour = 'Blue' AND ability_type.name = 'Agility';	superhero
SELECT superhero_name  FROM superhero  JOIN colour AS eyes ON superhero.eye_colour_id = eyes.id  JOIN colour AS hair ON superhero.hair_colour_id = hair.id  WHERE eyes.id = (SELECT id FROM colour WHERE name = 'Blue')  AND hair.id = (SELECT id FROM colour WHERE name = 'Blond');	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.publisher_name  WHERE publisher.publisher_name = 'Marvel Comics'	superhero
SELECT s.full_name FROM superhero s JOIN publisher p ON s.full_name = p.publisher_name WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC LIMIT 1;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.superhero_name = p.publisher_name WHERE s.superhero_name = 'Sauron'	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND colour.colour = 'Blue';	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE publisher_name = 'Marvel Comics';	superhero
SELECT      ROUND((SUM(CASE WHEN sp.power_name = 'Super Strength' THEN 1 ELSE 0 END) / COUNT(s.id)) * 100, 2) AS percentage_with_super_strength FROM      superhero s JOIN      hero_power hp ON s.id = hp.hero_id JOIN      superpower sp ON hp.hero_id = sp.power_name JOIN      (SELECT id FROM superhero WHERE publisher_id = 13) marvel_comics ON s.id = marvel_comics.id WHERE      sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher  ON superhero.publisher_name = publisher.publisher_name  WHERE publisher.publisher_name = 'DC Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.publisher_id JOIN hero_attribute ha ON s.publisher_id = ha.publisher_id WHERE ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE attribute_name = 'Speed') AND ha.attribute_name = 'Speed' GROUP BY p.publisher_name ORDER BY ha.attribute_value LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.publisher_id  WHERE publisher.publisher_name = 'Marvel Comics'  AND colour = 'Gold';	superhero
SELECT publisher_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.publisher_id  WHERE superhero.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero WHERE hair_colour_id IN (SELECT id FROM colour WHERE id = 1);	superhero
SELECT superhero.id FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.id WHERE hero_attribute.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute) AND hero_attribute.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE attribute_name = 'Intelligence');	superhero
SELECT race_id FROM superhero WHERE superhero_name = 'Copycat';	superhero
SELECT COUNT(DISTINCT superhero.id)  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.attribute_id  WHERE hero_attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50;	superhero
SELECT superhero_name  FROM superhero  JOIN superpower ON superhero_name = superhero_name  WHERE power_name = 'Death Touch';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.gender_id = hero_attribute.attribute_value WHERE superhero.gender_id = 2 AND hero_attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.hero_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero JOIN race ON superhero.id = race.id WHERE race.id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      ROUND((SUM(CASE WHEN s.id IN (SELECT id FROM superhero WHERE alignment = 'Bad') THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_bad_alignment,     COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN s.id ELSE NULL END) AS marvel_bad盟 superheroes_count FROM      superhero s CROSS JOIN      publisher p WHERE      p.publisher_name = 'Marvel Comics' AND     s.alignment = 'Bad'	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT publisher_id FROM publisher WHERE publisher_name = 'DC Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT publisher_id FROM publisher WHERE publisher_name = 'ABC Studios')) AS diff;	superhero
SELECT publisher_name FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value)  FROM hero_attribute;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT eye_colour FROM superhero  JOIN eye_colour ON superhero.eye_colour_id = eye_colour.id  WHERE superhero.id = 75;	superhero
SELECT hp.power_id  FROM hero_power hp JOIN superhero s ON hp.power_id = s.superhero_name WHERE s.superhero_name = 'Deathlok';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE gender_id = 2;	superhero
SELECT power_name  FROM superhero_powers  WHERE gender = 'Male'  LIMIT 5;	superhero
SELECT superhero_name  FROM superhero  WHERE race_id = (SELECT race_id FROM race WHERE race = 'Alien');	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IS NULL;	superhero
SELECT hero_power FROM hero_power WHERE hero_id = 56;	superhero
SELECT full_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.id = (SELECT id FROM race WHERE name = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE id = 2);	superhero
SELECT r.id, r.name FROM superhero s JOIN race r ON s.race_id = r.id JOIN superhero_weight sw ON s.id = sw.superhero_id WHERE sw.weight_kg = 169;	superhero
SELECT colour.name FROM superhero JOIN hair_colour AS colour ON superhero.hair_colour_id = colour.id JOIN skin_colour ON superhero.skin_colour_id = skin_colour.id WHERE superhero.height_cm = 185 AND skin_colour.name = 'human';	superhero
SELECT colour FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT     ROUND((SUM(CASE WHEN s.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) / COUNT(s.publisher_id), 2) AS percentage_marvel_heroes FROM superhero s WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT superhero.full_name FROM superhero WHERE superhero.gender_id = 1 AND superhero.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT power_id, COUNT(power_id) as power_count FROM hero_power GROUP BY power_id ORDER BY power_count DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.attribute_value = s.id WHERE s.id = (SELECT id FROM superhero WHERE superhero_name = 'Abomination');	superhero
SELECT power_name FROM superpowers WHERE hero_id = 1;	superhero
SELECT COUNT(DISTINCT superhero.id) FROM superhero JOIN hero_power ON superhero.id = hero_power.power_id JOIN (     SELECT power_id     FROM hero_power     JOIN (         SELECT power_id         FROM hero_power         JOIN superhero ON hero_power.power_id = superhero.id     ) AS hero_with_power     ON hero_power.power_id = hero_with_power.power_id     WHERE hero_with_power.power_id = (         SELECT power_id         FROM hero_power         WHERE power_name = 'stealth'     ) ) AS stealth_heroes ON hero_power.power_id = stealth_heroes.power_id;	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.full_name = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE hero_id = s.full_name) AND ha.attribute_name = 'strength';	superhero
SELECT AVG(CASE WHEN s.skin_colour_id IS NULL THEN 1 ELSE 0 END) AS average_no_skin_colours FROM superhero s;	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.publisher_name  WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT superhero.id FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.id JOIN publisher ON superhero.publisher_id = publisher.publisher_name WHERE publisher.publisher_name = 'Dark Horse Comics' AND hero_attribute.attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute     JOIN superhero ON hero_attribute.id = superhero.id     JOIN publisher ON superhero.publisher_id = publisher.publisher_name     WHERE publisher.publisher_name = 'Dark Horse Comics'     AND hero_attribute.attribute_value IS NOT NULL )	superhero
SELECT colour FROM colour WHERE id = (SELECT eye_colour_id FROM superhero WHERE full_name = "Abraham Sapien");	superhero
SELECT superhero.superhero_name  FROM superhero  JOIN hero_power ON superhero.superhero_name = hero_power.hero_id  JOIN superpower ON hero_power.hero_id = superpower.power_name  WHERE superpower.power_name = 'Flight';	superhero
SELECT eye_colour_id, hair_colour_id, skin_colour_id FROM superhero WHERE gender_id = 2 AND publisher_id = 4;	superhero
SELECT s1.superhero_name, p.publisher_name FROM superhero s1 JOIN superhero s2 ON s1.eye_colour_id = s2.eye_colour_id AND s1.hair_colour_id = s2.hair_colour_id AND s1.skin_colour_id = s2.skin_colour_id JOIN publisher p ON s1.publisher_id = p.publisher_id WHERE s1.superhero_name != s2.superhero_name GROUP BY s1.superhero_name, p.publisher_name HAVING COUNT(*) > 1;	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.race_id  WHERE s.race_id = (SELECT race_id FROM superhero WHERE superhero_name = 'A-Bomb');	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.id = 5 THEN 1 ELSE 0 END) * 100.0) /          (COUNT(CASE WHEN g.id = 2 THEN 1 ELSE NULL END)),         2     ) AS percentage_blue_female_superheroes FROM      superhero AS s JOIN      gender AS g ON s.gender_id = g.id JOIN      colour AS c ON s.skin_colour_id = c.id WHERE      g.id = 2;	superhero
SELECT superhero_name, race_id FROM superhero WHERE superhero_name = 'Charles Chandler';	superhero
SELECT gender_id  FROM superhero  WHERE superhero_name = 'Agent 13';	superhero
SELECT superhero_name  FROM superhero  JOIN superpower ON superhero_name = power_name  WHERE power_name = 'Adaptation';	superhero
SELECT COUNT hp.power_id FROM superhero s JOIN hero_power hp ON s.id = hp.power_id WHERE s.superhero_name = 'Amazo';	superhero
SELECT hp.power_name FROM superhero AS sz JOIN hero_power AS hp ON sz.full_name = 'Hunter Zolomon' WHERE sz.full_name = 'Hunter Zolomon';	superhero
SELECT superhero.height_cm  FROM superhero  JOIN colour ON superhero.colour_id = colour.id  WHERE colour.colour = 'Amber';	superhero
SELECT superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black';	superhero
SELECT s.eye_colour_id FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'Gold';	superhero
SELECT `full_name` FROM `superhero` WHERE `race_id` = 55;	superhero
SELECT superhero_name  FROM superhero  WHERE alignment = 'Neutral';	superhero
SELECT COUNT(*)  FROM hero_attribute ha  JOIN attribute a ON ha.attribute_value = a.attribute_name = (SELECT MAX(attribute_value) FROM hero_attribute ha2 WHERE ha2.attribute_name = a.attribute_name) WHERE a.attribute_name = 'Strength';	superhero
SELECT race_id, alignment_id  FROM superhero  WHERE superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND((SUM(CASE WHEN s.gender_id = 2 AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0) / COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 END), 2) AS percentage_female_heroes_by_marvel FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE id = 3);	superhero
SELECT      (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') -      (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero;	superhero
SELECT power_name FROM superpower WHERE power_name = (SELECT power_name FROM superpower WHERE power_name = 'Abomination');	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 1 AND id IN (SELECT id FROM race WHERE id = 21);	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.superhero_name = hero_attribute.attribute_value  WHERE attribute_name = 'Speed'  ORDER BY hero_attribute.attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT `attribute_value`  FROM `hero_attribute`  WHERE `hero_id` IN (     SELECT `hero_id`      FROM `hero_attribute`      JOIN `hero` ON `hero_attribute.hero_id` = `hero.hero_id`     WHERE `hero.superhero_name` = '3-D Man' );	superhero
SELECT superhero_name  FROM superhero  WHERE eye_colour_id = 7 AND hair_colour_id = 9;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.publisher_name WHERE s.publisher_id IN (     SELECT publisher_id     FROM superhero     WHERE superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') );	superhero
SELECT COUNT(*)  FROM superhero  WHERE id NOT IN (SELECT id FROM publisher WHERE id = 1);	superhero
SELECT      ROUND((SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS blue_eye_percentage FROM superhero;	superhero
SELECT   SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) /    SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS male_female_ratio FROM superhero;	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name  FROM superhero  WHERE id = 294;	superhero
SELECT full_name  FROM superhero  WHERE weight_kg IS NULL OR weight_kg = 0;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON c.id = s.eye_colour_id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN superpower sp ON s.full_name = 'Helen Parr'	superhero
SELECT race_id FROM superhero WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT p.id, p.name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.id = 38;	superhero
SELECT r.race FROM hero_attribute ha JOIN race r ON ha.hero_id = r.race WHERE ha.hero_id = (SELECT hero_id FROM hero_attribute ORDER BY hero_id DESC LIMIT 1)	superhero
SELECT s.alignment_id, sp.power_name FROM superhero s JOIN superpower sp ON s.alignment_id = sp.alignment_id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(attribute_value)  FROM hero_attribute  WHERE superhero.alignment_id = 3;	superhero
SELECT c.colour FROM hero_attribute ha JOIN colour c ON ha.attribute_id = c.id WHERE ha.hero_id IN (     SELECT hero_id     FROM hero_attribute     GROUP BY hero_id     HAVING SUM(attribute_id) = 100 );	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id = 2 AND alignment_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.superhero_name = hero_attribute.attribute_value WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT s.race_id FROM superhero s JOIN colour c ON s.hair_colour_id = c.id JOIN gender g ON s.gender_id = g.id WHERE c.colour = 'Blue' AND g.gender = 'Male';	superhero
SELECT      ROUND(         (SUM(CASE WHEN alignment.id = 2 AND gender.id = 2 THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN alignment.id = 2 THEN 1 ELSE 0 END),         2     ) AS percentage_female_bad_superheroes FROM superhero JOIN alignment ON superhero.gender_id = alignment.id JOIN gender ON superhero.alignment_id = gender.id;	superhero
SELECT      (SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) -       SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END)) AS eye_colours_difference FROM      superhero T1 WHERE      T1.weight_kg = 0 OR T1.weight_kg IS NULL;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.attribute_value = s.id WHERE ha.attribute_name = 'Strength' AND s.superhero_name = 'Hulk';	superhero
SELECT hp.power_id FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.power_id JOIN (     SELECT id FROM superhero WHERE superhero_name = 'Ajax' ) AS a ON s.id = a.id;	superhero
SELECT COUNT(*) FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Bad' AND superhero.skin_colour_id = (SELECT id FROM colour WHERE colour = 'Green');	superhero
SELECT COUNT(*)  FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name  FROM superhero  JOIN superpower ON superhero.superhero_name = superpower.power_name  WHERE superpower.power_name = 'Wind Control'  ORDER BY superhero_name;	superhero
SELECT gender_id FROM superhero WHERE power_name = 'Phoenix Force';	superhero
SELECT MAX(weight_kg)  FROM superhero  WHERE publisher_name = 'DC Comics';	superhero
SELECT AVG(height_cm)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.name = 'Human'  AND superhero.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(DISTINCT superhero.id) AS FastestHeroCount FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_id = (SELECT attribute_id FROM hero_attribute WHERE attribute_name = 'Speed' AND attribute_value = 100) AND hero_attribute.attribute_value = 100;	superhero
SELECT     CASE          WHEN SUM(CASE WHEN publisher_name = 'DC Comics' THEN 1 ELSE 0 END)               > SUM(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)          THEN SUM(CASE WHEN publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)         ELSE SUM(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN publisher_name = 'DC Comics' THEN 1 ELSE 0 END)     END AS superhero_difference FROM     superheroes;	superhero
SELECT `attribute_value` FROM `hero_attribute` JOIN `superhero` ON `hero_attribute`.`attribute_value` = MIN(`hero_attribute`.`attribute_value`) WHERE `superhero`.`name` = 'Black Panther';	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.colour WHERE s.eye_colour_id = (SELECT eye_colour_id FROM superhero WHERE superhero_name = 'Abomination');	superhero
SELECT height_cm FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT superhero_name  FROM superhero  WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND((SUM(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS female_percentage FROM      superhero INNER JOIN      publisher ON superhero.publisher_id = publisher.id INNER JOIN      gender ON superhero.gender_id = gender.id WHERE      publisher.publisher_name = 'George Lucas';	superhero
SELECT      ROUND(         (SUM(CASE WHEN alignment_id = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100.0,         2     ) AS good_superhero_percentage FROM superhero WHERE publisher_id = (SELECT publisher_id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT attribute_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)	superhero
SELECT `full_name` FROM `superhero` WHERE `full_name` = "Alien";	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.id = 3;	superhero
SELECT attribute_value FROM hero_attribute WHERE attribute_value = 80;	superhero
SELECT weight_kg, race_id FROM superhero WHERE id = 40;	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE alignment_id IS NULL;	superhero
SELECT superhero.id FROM superhero JOIN superpower ON superhero.id = superpower.id WHERE superpower.power_name = 'Intelligence';	superhero
SELECT colour FROM colour WHERE id = (SELECT eye_colour_id FROM superhero WHERE superhero_name = 'Blackwulf');	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.q1 WHERE q.q1 = (SELECT MAX(q1) FROM qualifying WHERE raceId = 18) AND d.driverId IN (     SELECT driverId     FROM qualifying     WHERE raceId = 18     GROUP BY driverId     ORDER BY q1 DESC     LIMIT 5 );	formula_1
SELECT driverId FROM qualifying WHERE q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)	formula_1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.year = c.circuitId WHERE c.name = 'Shanghai International Circuit';	formula_1
SELECT url  FROM circuits  WHERE url LIKE '%Circuit_de_Barcelona-Catalunya%'	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.name = c.country WHERE c.country = 'Germany';	formula_1
SELECT c.circuitRef FROM circuits AS c JOIN constructors AS con ON c.circuitRef = con.constructorRef WHERE con.constructorRef = 'renault';	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.raceId = circuits.name  WHERE races.year = 2010  AND circuits.country NOT IN ('Malaysia', 'Bahrain', 'Spain', 'Turkey', 'Monaco');	formula_1
SELECT r.name  FROM races r JOIN circuits c ON r.circuitId = c.country WHERE c.country = 'Spain';	formula_1
SELECT lat, lng FROM circuits WHERE lat = 40.9517 AND lng = 29.405;	formula_1
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit';	formula_1
SELECT time FROM races JOIN circuits ON races.time = circuits.name WHERE circuits.name = "Sepang International Circuit";	formula_1
SELECT circuits.lat, circuits.lng  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE circuits.circuitId = 17;	formula_1
SELECT c.country FROM results r JOIN constructors c ON r.constructorId = c.constructorId WHERE r.raceId = 24 AND r.raceId = (SELECT raceId FROM results WHERE constructorId = c.constructorId GROUP BY raceId HAVING COUNT(*) = 1)	formula_1
SELECT q1  FROM qualifying  JOIN drivers ON qualifying.q1 = drivers.surname  JOIN races ON qualifying.q1 = races.raceId  WHERE drivers.surname = 'Senna' AND races.raceId = 354;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.driverId = r.driverId WHERE r.raceId = 355 AND r.Q2_time = '0:01:40';	formula_1
SELECT q.driverId FROM qualifying q JOIN results r ON q.driverId = r.driverId WHERE q.raceId = 903 AND r.fastestLapTime = "0:01:54";	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d LEFT JOIN results r ON d.driverId = r.driverId LEFT JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 1 AND r.statusId != 1;	formula_1
SELECT s.url FROM races r JOIN seasons s ON r.year = SUBSTR(s.url, LENGTH('http://en.wikipedia.org/wiki/') + 1) WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE time IS NOT NULL;	formula_1
SELECT      d.dob FROM      drivers d JOIN      results r ON d.dob = (SELECT MIN(dob) FROM drivers d2 WHERE EXISTS (SELECT 1 FROM results r2 WHERE r2.raceId = 592 AND d2.dob = d.dob)) WHERE      EXISTS (SELECT 1 FROM results r2 WHERE r2.raceId = 592 AND d.dob = r.dob) ORDER BY      d.dob ASC LIMIT 1;	formula_1
SELECT d.url FROM drivers d JOIN lapTimes lt ON d.url = lt.raceId WHERE lt.raceId = 161 AND lt.raceId = '0:01:27';	formula_1
SELECT d.nationality FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE driverId IN (SELECT driverId FROM results WHERE raceNo = 933)) AND r.raceNo = 933;	formula_1
SELECT lat, lng FROM circuits WHERE location = "Kuala Lumpur";	formula_1
SELECT c.url  FROM constructors c JOIN constructorResults cr ON c.url = cr.url WHERE cr.raceId = 9 ORDER BY (SELECT SUM(points) FROM constructorResults WHERE raceId = 9 AND url = c.url) DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Lucas di Grassi') AND raceId = 345;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.surname = q.q2 WHERE q.raceId = 347 AND q2 = '0:01:15';	formula_1
SELECT d.driverId FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q3 = '0:01:33' AND r.raceId = 45;	formula_1
SELECT r.time FROM results r JOIN drivers d ON r.driver_id = d.id WHERE d.forename = 'Bruce' AND d.surname = 'McLaren' AND r.raceId = 743;	formula_1
SELECT r.name, res.position, d.driverId FROM results AS res JOIN races AS r ON res.raceId = r.raceId WHERE r.name = 'San Marino Grand Prix' AND r.year = 2006 AND res.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.url LIKE CONCAT('%', r.year, '%') WHERE r.year = 2009 AND r.year IN (     SELECT year     FROM races     WHERE year = 2009     ORDER BY year     LIMIT 901 - 1 );	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.date = '2015-11-29';	formula_1
SELECT d.dob FROM drivers d JOIN results r ON d.dob = (SELECT MAX(dob) FROM drivers WHERE dob IN (SELECT dob FROM drivers d2 JOIN results r2 ON d2.dob = r2.dob WHERE r2.raceId = 872)) WHERE r.raceId = 872;	formula_1
SELECT d.forename, d.surname FROM lapTimes lt JOIN drivers d ON lt.raceId = 348 AND lt.time = (SELECT MIN(time) FROM lapTimes WHERE raceId = 348)	formula_1
SELECT d.nationality FROM drivers d JOIN (     SELECT fastestLapSpeed     FROM results     ORDER BY fastestLapSpeed DESC     LIMIT 1 ) AS r ON d.nationality = r.fastestLapSpeed	formula_1
SELECT      (CAST(SUBSTRING(fastestLapSpeed FROM 1 FOR 5) AS REAL) -       CAST(SUBSTRING((SELECT fastestLapSpeed FROM results WHERE raceId = 854) FROM 1 FOR 5) AS REAL)) /      CAST(SUBSTRING((SELECT fastestLapSpeed FROM results WHERE raceId = 854) FROM 1 FOR 5) AS REAL) * 100 AS percentage FROM results WHERE raceId = 853;	formula_1
SELECT      DIVIDE(COUNT(CASE WHEN time IS NOT NULL THEN driverId END), COUNT(driverId)) AS completionRate FROM      results WHERE      DATE(time) = '1983-07-16';	formula_1
SELECT year  FROM races  WHERE name = 'Singapore Grand Prix'  ORDER BY year ASC  LIMIT 1;	formula_1
SELECT COUNT(*) AS total_races_2005 FROM races WHERE year = 2005 ORDER BY year DESC;	formula_1
SELECT raceId, year, date  FROM races  WHERE year = (SELECT year FROM races ORDER BY date ASC LIMIT 1)  AND month(date) = (SELECT month(min(date)) FROM races ORDER BY date ASC LIMIT 1);	formula_1
SELECT name, date  FROM races  WHERE date = (SELECT MAX(date) FROM races WHERE YEAR(date) = 1999);	formula_1
SELECT seasons.year, COUNT(races.round) AS race_count FROM seasons LEFT JOIN races ON seasons.year = races.round GROUP BY seasons.year ORDER BY race_count DESC LIMIT 1;	formula_1
SELECT r.raceId FROM races r WHERE r.year = 2017 AND r.year NOT IN (SELECT year FROM seasons WHERE year = 2000);	formula_1
SELECT c.name, c.location, c.country FROM circuits c JOIN races r ON c.name = r.circuitId WHERE c.country = 'Europe' ORDER BY r.year ASC LIMIT 1;	formula_1
SELECT MAX(year)  FROM seasons  JOIN races ON seasons.year = races.circuitId  WHERE circuitId = 17;	formula_1
SELECT COUNT(DISTINCT r.year)  FROM circuits c  JOIN races r ON c.name = 'Silverstone Circuit' AND c.country = 'United Kingdom' AND c.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, ds.position FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.position IS NOT NULL ORDER BY ds.position;	formula_1
SELECT drivers.forename, drivers.surname, driverStandings.points FROM drivers JOIN driverStandings ON drivers.forename = driverStandings.forename WHERE driverStandings.points = (SELECT MAX(points) FROM driverStandings);	formula_1
SELECT d.surname, SUM(r.points) as total_points FROM drivers d JOIN results r ON d.surname = r.driver_surname -- Assuming there is a column named driver_surname in results table JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2017 AND ra.circuitId = (SELECT circuitId FROM races WHERE 'Chinese Grand Prix' = raceName) GROUP BY d.surname ORDER BY total_points DESC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, lt.time FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.time = (SELECT MIN(time) FROM lapTimes)	formula_1
SELECT AVG(lt.time)  FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE d.driverId = 1 AND r.raceId = 2;	formula_1
SELECT      (COUNT(CASE WHEN position > 1 THEN 1 END) * 100.0) / COUNT(*) AS percentage FROM      results WHERE      driverId = (SELECT driverId FROM results WHERE surname = 'Hamilton' AND year >= 2010)     AND year >= 2010;	formula_1
SELECT drivers.nationality, driverStandings.points FROM drivers JOIN driverStandings ON drivers.nationality = driverStandings.nationality GROUP BY drivers.nationality ORDER BY COUNT(*) DESC, driverStandings.points DESC LIMIT 1;	formula_1
SELECT MIN(dob) AS youngest_dob, forename, surname FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT c.circuitId FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId HAVING COUNT(r.year) = 4;	formula_1
SELECT c.name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name AS RaceName, c.name AS CircuitName, c.location AS CircuitLocation FROM races r JOIN circuits c ON r.name = c.name WHERE MONTH(date) = 9 AND YEAR(date) = 2005;	formula_1
SELECT r.raceId FROM results r JOIN drivers d ON r.raceId = (SELECT raceId FROM results WHERE position < 10) WHERE d.forename = 'Alex' AND d.surname = 'Yoong';	formula_1
SELECT COUNT(*)  FROM driverStandings  JOIN drivers ON driverStandings.driverId = drivers.driverRef  WHERE drivers.driverRef = 'hamilton' AND driverStandings.points = (SELECT MAX(points) FROM driverStandings WHERE circuitRef = 'sepang');	formula_1
SELECT r.raceId, YEAR(r.raceId) AS raceYear FROM results r JOIN drivers d ON r.raceId = d.dob WHERE d.dob = '1981-07-29' ORDER BY r.raceId LIMIT 1;	formula_1
SELECT AVG(points)  FROM results  JOIN seasons ON results.points = seasons.year  WHERE seasons.year = 2000;	formula_1
SELECT MIN(year) AS first_race_year, points FROM races JOIN results ON races.year = results.year JOIN drivers ON drivers.driverId = results.driverId WHERE drivers.driverId = (SELECT driverId FROM drivers WHERE name = 'Lewis Hamilton');	formula_1
SELECT r.year, r.round, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.year, r.round;	formula_1
SELECT r.raceId, s.year, c.location, MAX(r.laps) AS most_laps FROM results r JOIN seasons s ON r.raceId = s.year JOIN circuits c ON s.year = c.location GROUP BY r.raceId, s.year, c.location ORDER BY most_laps DESC LIMIT 1;	formula_1
SELECT      (COUNT(CASE WHEN c.name = 'Germany' THEN 1 END) * 100.0) / COUNT(c.name) AS percentage_germany FROM      races r JOIN      circuits c ON r.circuitId = c.name WHERE      r.name = 'European Grand Prix' AND c.country = 'Germany';	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT 'Silverstone Circuit' AS circuit, MAX(lat) AS highest_lat FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE 'lat' IN (2.76083, 26.0325, 41.57, 40.9517));  SELECT 'Hockenheimring' AS circuit, MAX(lat) AS highest_lat FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE 'lat' IN (26.0325, 41.57, 40.9517, 43.7347));  SELECT 'Hungaroring' AS circuit, MAX(lat) AS highest_lat FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE 'lat' IN (41.57, 40.9517, 43.7347, 2.76083));	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country  FROM circuits  WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1;	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url  FROM drivers  WHERE url LIKE '%Anthony Davidson%';	formula_1
SELECT `driverRef` FROM `drivers` WHERE `driverRef` = 'hamilton';	formula_1
SELECT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'Spanish Grand Prix' AND YEAR(r.name) = 2009;	formula_1
SELECT DISTINCT s.year FROM seasons s JOIN races r ON s.year = r.year WHERE s.year BETWEEN 1950 AND 1954;	formula_1
SELECT r.name AS RaceName, r.url AS RaceURL FROM races r JOIN circuits c ON r.url IS NOT NULL AND r.url LIKE CONCAT(c.url, '%') WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT r.time  FROM races r  JOIN circuits c ON r.year = 2010 AND c.name = 'Abu Dhabi Circuit';	formula_1
SELECT COUNT(r.raceId)  FROM races r JOIN circuits c ON r.raceId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT date  FROM races  WHERE circuitId = 17;	formula_1
SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.raceId WHERE r.year = 2009 AND c.url LIKE '%Circuit_de_Barcelona-Catalunya'	formula_1
SELECT MIN('fastestLapTime') AS fastestLapTime FROM results;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.forename = r.fastestLapSpeed WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results);	formula_1
SELECT d.driverRef FROM results r JOIN drivers d ON r.driverId = d.driverRef WHERE r.raceId = 18 AND r.position = 1;	formula_1
SELECT raceId FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';	formula_1
SELECT r.raceId FROM results r JOIN drivers d ON r.raceId = d.driverId WHERE d.driverId = (SELECT driverId FROM drivers WHERE name = 'Lewis Hamilton') ORDER BY r.rank LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE name = 'Spanish Grand Prix');	formula_1
SELECT DISTINCT year  FROM races WHERE raceId IN (     SELECT raceId      FROM races      WHERE year = 2009 );	formula_1
SELECT positionOrder  FROM results  WHERE driverId = 1 AND raceId = 2008;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.position = 4 AND q.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.year = ra.year AND ra.name = 'Australian Grand Prix' WHERE r.time IS NOT NULL;	formula_1
SELECT MIN(fastestLapTime)  FROM results  WHERE raceId = 18 AND driverId = 5;	formula_1
SELECT time  FROM results  WHERE raceId = (SELECT raceId FROM seasons WHERE year = 2008 AND raceName = 'Australian Grand Prix')  ORDER BY time ASC  LIMIT 1 OFFSET 1;	formula_1
SELECT d.forename, d.surname, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.points = (SELECT MAX(points) FROM results WHERE driverId IN (SELECT driverId FROM results WHERE strftime('%Y', date) = '2008')) AND strftime('%Y', date) = '2008' AND date LIKE '2008-03-16%';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'American' AND NOT EXISTS (     SELECT 1     FROM races     WHERE year = 2008 AND name = 'Australian Grand Prix' );	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE EXISTS (SELECT 1 FROM results AS r2 WHERE r2.driverId = d.driverId AND r2.time IS NOT NULL);	formula_1
SELECT SUM(r.points)  FROM results AS r  JOIN drivers AS d ON r.driver_id = d.driver_id  JOIN races AS ra ON r.race_id = ra.race_id  WHERE d.forename = 'Lewis' AND ra.name LIKE '%Grand Prix%';	formula_1
SELECT AVG(     CAST(SUBSTRING('fastestLapTime', 1, 2) AS INTEGER) * 60 +     CAST(SUBSTRING('fastestLapTime', 4, 2) AS INTEGER) +     CAST(SUBSTRING('fastestLapTime', 7, 3) / 1000 AS INTEGER) ) AS avgFastestLapTime FROM results JOIN drivers ON results.raceId = drivers.driverId WHERE drivers.driverId = 1;	formula_1
SELECT     (SELECT COUNT(DISTINCT r.raceId)      FROM results r      WHERE r.raceId = 1 AND r.time IS NOT NULL) /      (SELECT COUNT(DISTINCT r.raceId)      FROM results r      WHERE r.raceId = 1) AS completion_rate;	formula_1
SELECT   ((     SELECT       (TIMEDIFF(time, MIN(time)) / MIN(time) * 100     FROM results AS r1     JOIN races AS r2 ON r1.raceId = r2.raceId     WHERE r2.year = 2008 AND r1.time IS NOT NULL   ) - (     SELECT       (TIMEDIFF(time, MAX(time)) / MAX(time) * 100     FROM results AS r1     JOIN races AS r2 ON r1.raceId = r2.raceId     WHERE r2.year = 2008 AND r1.time IS NOT NULL   )) * 100 AS percentage_difference FROM results AS r3 JOIN races AS r4 ON r3.raceId = r4.raceId WHERE r4.year = 2008 AND r3.time IS NOT NULL ORDER BY r3.time LIMIT 1;	formula_1
SELECT COUNT(*)  FROM circuits  WHERE location = 'Melbourne' AND country = 'Australia';	formula_1
SELECT lat, lng  FROM circuits  WHERE country = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT AVG(cr.points) AS average_points FROM constructorResults cr JOIN constructors c ON cr.points = c.nationality WHERE c.nationality = "British";	formula_1
SELECT 'points' FROM constructorStandings ORDER BY 'points' DESC LIMIT 1;	formula_1
SELECT cr.constructorId FROM constructorResults cr JOIN races r ON cr.constructorId = r.constructorId WHERE r.name = 'Spanish Grand Prix' AND cr.points = 0;	formula_1
SELECT COUNT(DISTINCT c.name) FROM constructors c JOIN constructorResults cr ON c.name = cr.name JOIN races r ON cr.raceId = r.raceId WHERE c.nationality IS NULL OR c.nationality <> 'Japanese' AND cr.points = 0 GROUP BY c.name HAVING COUNT(r.raceId) = 2;	formula_1
SELECT c.name  FROM constructors c JOIN constructorStandings cs ON c.name = cs.name WHERE cs.position = 1;	formula_1
SELECT COUNT(*) FROM constructors JOIN constructorResults ON constructors.id = constructorResults.constructorId WHERE constructors.nationality = 'French' AND constructorResults.lapNumber > 50;	formula_1
SELECT     (COUNT(DISTINCT d.driverId) - COUNT(DISTINCT d.driverId) *      (SELECT COUNT(DISTINCT d.driverId) FROM drivers d       INNER JOIN driverStandings ds ON d.driverId = ds.driverId       INNER JOIN races r ON ds.raceId = r.raceId       WHERE d.nationality = 'Japanese' AND r.year BETWEEN 2007 AND 2009 AND ds.time IS NOT NULL) /      (SELECT COUNT(DISTINCT d.driverId) FROM drivers d       INNER JOIN driverStandings ds ON d.driverId = ds.driverId       INNER JOIN races r ON ds.raceId = r.raceId       WHERE d.nationality = 'Japanese' AND r.year BETWEEN 2007 AND 2009)) * 100 AS completion_percentage FROM drivers d INNER JOIN driverStandings ds ON d.driverId = ds.driverId INNER JOIN races r ON ds.raceId = r.raceId WHERE d.nationality = 'Japanese' AND r.year BETWEEN 2007 AND 2009;	formula_1
SELECT s.year, AVG(TIMESTAMPDIFF(SECOND, '00:00:00.000', r.time)) AS avg_champion_time FROM seasons s JOIN results r ON s.year = SUBSTRING_INDEX(r.time, ':', 1) WHERE r.statusId = 1 AND r.time IS NOT NULL GROUP BY s.year;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN driverStandings ds ON d.driver_id = ds.driver_id WHERE d.dob > '1975-01-01' AND ds.position = 2;	formula_1
SELECT COUNT(*)  FROM drivers  WHERE surname IN ('Hamilton', 'Heidfeld', 'Rosberg', 'Alonso', 'Kovalainen')  AND surname NOT IN (SELECT surname FROM drivers JOIN results ON drivers.surname = results.surname WHERE results.time IS NULL);	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.surname = SUBSTR(r.fastestLapTime, 5) WHERE r.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results);	formula_1
SELECT r.fastestLap FROM results r JOIN driverStandings ds ON r.driverId = ds.position WHERE ds.position = 1 AND YEAR(r.raceId) = 2009;	formula_1
SELECT AVG(fastestLapSpeed)  FROM races  WHERE year = 2009 AND circuitId = (SELECT circuitId FROM races WHERE name = 'Spanish Grand Prix');	formula_1
SELECT r.name, r.year FROM races r JOIN (     SELECT MIN(milliseconds) AS min_milliseconds     FROM results     WHERE milliseconds IS NOT NULL ) AS subq ON r.year = (     SELECT year     FROM results     WHERE milliseconds = subq.min_milliseconds );	formula_1
SELECT     ROUND(         (COUNT(CASE WHEN d.dob < '1985-01-01' THEN dt.driverId END) /           COUNT(CASE WHEN r.year BETWEEN 2000 AND 2005 THEN dt.driverId END)) * 100,         2     ) AS percentage_of_qualified_drivers FROM     drivers d JOIN     lapTimes dt ON d.driverId = dt.driverId JOIN     races r ON dt.driverId = r.driverId WHERE     d.dob < '1985-01-01'     AND r.year BETWEEN 2000 AND 2005     AND dt.lap > 50;	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'French' AND NOT EXISTS (     SELECT 1     FROM lapTimes     WHERE drivers.nationality = 'French' AND lap < 120 );	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId  FROM races  JOIN raceDetails ON races.raceId = raceDetails.raceId  WHERE raceDetails.year = 2009;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM drivers  WHERE driverId NOT IN (SELECT driverId FROM races WHERE raceId = 18);	formula_1
SELECT number FROM drivers WHERE nationality = 'British' OR nationality = 'German' OR nationality = 'Spanish' OR nationality = 'Finnish' ORDER BY number DESC LIMIT 3;	formula_1
SELECT `driverRef` FROM `drivers` WHERE `driverRef` = 'kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = "Australian" AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.nationality, d.dob, lt.time FROM drivers d JOIN lapTimes lt ON d.nationality = lt.time WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' ORDER BY lt.time ASC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE nationality = 'German'  ORDER BY dob  LIMIT 1;	formula_1
SELECT d.driverId, r.fastestLapTime FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob BETWEEN '1971-01-01' AND '1971-12-31' AND r.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results);	formula_1
SELECT d.surname, d.dob, lt.time FROM drivers d JOIN lapTimes lt ON d.surname = lt.time WHERE d.dob < '1982-01-01' ORDER BY lt.time DESC LIMIT 10;	formula_1
SELECT year  FROM seasons  JOIN results ON seasons.year = results.year  WHERE fastestLapTime = (SELECT MIN(fastestLapTime) FROM results);	formula_1
SELECT MIN(time) AS slowest_lap_time FROM lapTimes WHERE time = (SELECT MAX(time) FROM lapTimes);	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results r JOIN races ra ON r.driverId = ra.raceId WHERE ra.raceId > 50 AND ra.raceId < 100 AND r.time IS NULL AND ra.statusId = 2;	formula_1
SELECT c.country, c.lat, c.lng FROM circuits c WHERE c.country = 'Austria'	formula_1
SELECT number, COUNT(*) as finishers_count FROM results WHERE time IS NOT NULL GROUP BY number ORDER BY finishers_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT      d.dob,      q.q1 FROM      drivers d JOIN      qualifying q ON d.driverId = q.driverId WHERE      d.dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.statusId = 2;	formula_1
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.name = cs.points WHERE c.name LIKE '%Italy%' ORDER BY cs.points DESC LIMIT 1;	formula_1
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.url = cs.url WHERE cs.wins = (SELECT MAX(wins) FROM constructorStandings)	formula_1
SELECT driverId FROM lapTimes WHERE raceId = 1 AND lapNumber = 3 ORDER BY time DESC LIMIT 1;	formula_1
SELECT raceId,         CAST(SUBSTRING_INDEX(time, ':', -1) * 60 + CAST(SUBSTRING_INDEX(time, ':', 1) AS UNSIGNED) * 1000 AS UNSIGNED) AS time_in_milliseconds FROM lapTimes WHERE lap = 1 ORDER BY time_in_milliseconds LIMIT 1;	formula_1
SELECT AVG('fastestLapTime')  FROM results  WHERE 'raceId' = 2006 AND 'rank' < 11;	formula_1
SELECT d.driverId, d.surname, d.forename, AVG(PS.duration) AS avg_pit_stop_duration FROM drivers d JOIN pitStops PS ON d.driverId = PS.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId, d.surname, d.forename ORDER BY avg_pit_stop_duration ASC LIMIT 5;	formula_1
SELECT driverId, time FROM results WHERE raceId = (SELECT raceId FROM results WHERE time LIKE 'Canadian Grand Prix in 2008%') ORDER BY points DESC LIMIT 1;	formula_1
SELECT c.constructorRef, c.url FROM results r JOIN constructors c ON r.constructorId = c.constructorRef WHERE r.driverId = (     SELECT driverId     FROM results     WHERE driverId = (         SELECT MAX(driverId)         FROM results         WHERE constructorId = c.constructorRef     ) ) AND c.constructorRef = (     SELECT constructorRef     FROM constructors     WHERE url = 'http://en.wikipedia.org/wiki/2009_Singapore_Grand_Prix' )	formula_1
SELECT `forename`, `surname`, `dob` FROM `drivers` WHERE `nationality` = 'Austrian' AND YEAR(`dob`) BETWEEN 1981 AND 1991;	formula_1
SELECT CONCAT(forename, ' ', surname) AS full_name, url FROM drivers WHERE nationality = 'German' AND YEAR(dob) BETWEEN 1971 AND 1985 ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE location = 'Hungaroring';	formula_1
SELECT cr.constructorId, c.name, c.nationality, SUM(cr.points) as total_points FROM constructorResults cr JOIN races r ON cr.constructorId = r.raceId JOIN constructors c ON cr.constructorId = c.constructorId WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Monaco Grand Prix') AND c.year BETWEEN 1980 AND 2010 GROUP BY cr.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points)  FROM results  JOIN drivers ON results.driverId = drivers.nationality  WHERE drivers.nationality = "Turkish";	formula_1
SELECT AVG(round) AS average_races_per_year FROM races WHERE year BETWEEN 2000 AND 2010;	formula_1
SELECT nationality, COUNT(*) as count FROM drivers GROUP BY nationality ORDER BY count DESC LIMIT 1;	formula_1
SELECT SUM(CASE WHEN points >= 25 THEN 1 ELSE 0 END) AS victories FROM driverStandings WHERE points = (SELECT MAX(points) FROM driverStandings WHERE points < (SELECT points FROM driverStandings WHERE driverId = 91));	formula_1
SELECT r.name  FROM results AS res  JOIN races AS r ON res.raceId = r.raceId  WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results);	formula_1
SELECT CONCAT(c.location, ', ', c.country) AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId ORDER BY r.circuitId DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.round = r.round WHERE r.round = 3 AND r.year = 2008 AND q.position = 1;	formula_1
SELECT CONCAT(forename, ' ', surname) AS full_name, nationality FROM drivers WHERE nationality = 'Finnish' AND forename = 'Heikki' AND surname = 'Kovalainen'	formula_1
SELECT      d.driverId,      d.nationality,      COUNT(r.statusId) AS accident_count FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      r.raceId = (SELECT raceId FROM results WHERE 'statusId' = 3 GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1)     AND r.statusId = 3 GROUP BY      d.driverId, d.nationality ORDER BY      accident_count DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, ds.wins FROM drivers d JOIN driverStandings ds ON d.dob = (SELECT MIN(dob) FROM drivers) JOIN drivers d2 ON d.dob = d2.dob JOIN driverStandings ds2 ON d2.driver_id = ds2.driver_id;	formula_1
SELECT MAX(`duration`) AS longestPitStopTime FROM `pitStops`;	formula_1
SELECT MIN(time) AS fastestLapTime FROM lapTimes;	formula_1
SELECT MAX(duration) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE name = 'Lewis Hamilton');	formula_1
SELECT pitStops.lap  FROM pitStops  JOIN races ON pitStops.raceId = races.raceId  WHERE races.name = 'Australian Grand Prix' AND pitStops.driverId = (SELECT driverId FROM races WHERE name = 'Australian Grand Prix' AND name LIKE '%Hamilton%');	formula_1
SELECT pitStops.driverId, pitStops.duration FROM pitStops JOIN races ON pitStops.driverId = races.driverId WHERE races.date = '2011-03-27';	formula_1
SELECT fastestLapTime FROM results WHERE fastestLapTime = (SELECT MIN(fastestLapTime) FROM results) AND EXISTS (     SELECT 1     FROM drivers     WHERE drivers.driverId = (         SELECT driverId         FROM drivers         WHERE driverId = 1     ) );	formula_1
SELECT drivers.fullName FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.id WHERE lapTimes.time = (SELECT MIN(time) FROM lapTimes);	formula_1
SELECT c.name, r.position FROM results r JOIN circuits c ON r.constructorId = c.constructorId WHERE r.driverId = (SELECT driverId FROM results WHERE fastestLapTime = MIN(fastestLapTime));	formula_1
SELECT MIN('time') AS lap_record FROM lapTimes WHERE 'raceId' = (SELECT 'raceId' FROM circuits WHERE 'name' = 'Austrian Grand Prix Circuit');	formula_1
SELECT MAX(time) as fastestLapTime FROM lapTimes WHERE circuitId IN (SELECT circuitId FROM circuits WHERE circuitId = 2 OR circuitId = 3 OR circuitId = 4 OR circuitId = 5 OR circuitId = 6);	formula_1
SELECT r.name FROM lapTimes lt JOIN races r ON lt.lap = r.lap WHERE lt.time = (SELECT MIN(time) FROM lapTimes lt2) AND r.name = 'Austrian Grand Prix';	formula_1
SELECT pitStops.duration FROM pitStops JOIN results ON pitStops.raceId = results.raceId WHERE results.raceId = 841 AND pitStops.duration = (     SELECT MIN(duration) FROM pitStops WHERE raceId = 841 );	formula_1
SELECT lat, lng FROM circuits WHERE lap_record = '1:29.488';	formula_1
SELECT AVG(`milliseconds`)  FROM `pitStops`  WHERE `surname` = 'Hamilton';	formula_1
SELECT AVG(l.milliseconds)  FROM lapTimes l JOIN circuits c ON l.milliseconds IS NOT NULL AND c.country = 'Italy';	formula_1
SELECT MAX(overall_rating) FROM Player_Attributes;	european_football_2
SELECT player_name, height  FROM Player  WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low';	european_football_2
SELECT player_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT season, SUM(home_team_goal + away_team_goal) AS total_goals FROM Match WHERE season = '2015/2016' GROUP BY season ORDER BY total_goals DESC LIMIT 1;	european_football_2
SELECT home_team_api_id FROM Match WHERE season = '2015/2016' AND home_team_goal < away_team_goal GROUP BY home_team_api_id ORDER BY COUNT(*) ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_name = pa.penalties ORDER BY pa.penalties DESC LIMIT 10;	european_football_2
SELECT away_team_api_id FROM Match WHERE season = '2009/2010' AND away_team_goal > home_team_goal GROUP BY away_team_api_id ORDER BY SUM(away_team_goal - home_team_goal) DESC LIMIT 1;	european_football_2
SELECT team_long_name, MAX(buildUpPlaySpeed) as highest_speed FROM Team JOIN (SELECT team_api_id, MAX(buildUpPlaySpeed) as buildUpPlaySpeed       FROM Team       ORDER BY buildUpPlaySpeed DESC       LIMIT 4) AS top_teams ON Team.team_api_id = top_teams.team_api_id;	european_football_2
SELECT league_id FROM Match WHERE season = '2015/2016' GROUP BY league_id ORDER BY SUM(CASE WHEN home_team_goal = away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT      (strftime('%Y', 'now') - strftime('%Y', Player.birthday)) AS age,     Player.birthday FROM      Player JOIN      Player_Attributes ON Player.birthday = Player_Attributes.date WHERE      Player_Attributes.sprint_speed >= 97 AND     Player_Attributes.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'	european_football_2
SELECT L.name, COUNT(M.league_id) AS total_matches FROM League L JOIN Match M ON L.name = M.league_id GROUP BY L.name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id  FROM Team_Attributes  WHERE buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT T1.team_long_name FROM Team_Attributes T1 JOIN Team T2 ON T1.team_api_id = T2.team_api_id WHERE T1.date LIKE '2012-%-%' AND T1.buildUpPlayPassing > (     SELECT AVG(T3.buildUpPlayPassing)     FROM Team_Attributes T3     WHERE T3.date LIKE '2012-%-%'     AND T3.buildUpPlayPassing IS NOT NULL )	european_football_2
SELECT      (SUM(CASE WHEN P.preferred_foot = 'left' THEN 1 ELSE 0 END) * 1.0) / COUNT(P.player_api_id) AS percentage_left_foot FROM      Player P JOIN      (SELECT player_api_id FROM Player WHERE birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00') AS Births ON      P.player_api_id = Births.player_api_id	european_football_2
SELECT league_id, SUM(home_team_goal + away_team_goal) AS total_goals FROM Match GROUP BY league_id ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots) AS average_long_shots FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_fifa_api_id = 218353;	european_football_2
SELECT p.player_name, AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_name = pa.heading_accuracy WHERE p.height > 180 GROUP BY p.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT team_long_name FROM Team_Attributes AS ta JOIN Team AS t ON ta.id = t.id WHERE ta.buildUpPlayDribblingClass = 'Normal' AND ta.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND ta.chanceCreationPassing < (SELECT SUM(chanceCreationPassing) / COUNT(id) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY ta.chanceCreationPassing DESC;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.name = M.name GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal)	european_football_2
SELECT `team_short_name` FROM `Team` WHERE `team_long_name` = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10';	european_football_2
SELECT pa.player_api_id, p.player_name, pa.attacking_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass  FROM Team_Attributes  WHERE team_api_id = (SELECT team_api_id FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' LIMIT 1) AND buildUpPlayPositioningClass LIKE '%Freedom of Movement%' AND buildUpPlayPositioningClass LIKE '%1st two thirds%'	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id = 505942 AND date = '2014-09-18 00:00:00';	european_football_2
SELECT * FROM 'Player_Attributes' WHERE strftime('%Y', 'date') = '2011';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.country_id = League.country_id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT pa.preferred_foot FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player);	european_football_2
SELECT player_api_id, MAX(potential) AS highest_potential FROM Player_Attributes GROUP BY player_api_id ORDER BY highest_potential DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player p JOIN Player_Attributes pa ON p.id = pa.player_id WHERE p.weight < 130 AND pa.preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_api_id = (SELECT player_api_id FROM Player WHERE Player.player_api_id = 505942);	european_football_2
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT L.name  FROM League L JOIN Country C ON L.name = 'Netherlands' WHERE C.id = (SELECT id FROM Country WHERE name = 'Netherlands');	european_football_2
SELECT AVG(home_team_goal)  FROM Match  WHERE country_id = (SELECT country_id FROM Country WHERE name = 'Poland')  AND season = '2010/2011';	european_football_2
SELECT pa.player_id, pa.finishing FROM Player_Attributes pa JOIN Player p ON pa.player_id = p.player_id WHERE p.height = (SELECT MAX(height) FROM Player)    OR p.height = (SELECT MIN(height) FROM Player) ORDER BY pa.finishing DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_name = (SELECT player_name FROM Player WHERE player_api_id = pa.player_api_id) WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT potential FROM Player_Attributes WHERE player_name = 'Aaron Doran';	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE preferred_foot = 'left';	european_football_2
SELECT DISTINCT T1.team_long_name FROM Team_Attributes AS T1 JOIN Teams AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_api_id IN (SELECT team_api_id FROM Team_Attributes WHERE team_api_id IN (SELECT team_api_id FROM Team_Attributes WHERE team_short_name = 'CLB'))	european_football_2
SELECT team_short_name  FROM Team WHERE team_short_name IN (     SELECT team_short_name      FROM Team_Attributes      WHERE buildUpPlayPassing > 70 );	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  JOIN Player ON Player_Attributes.date = Player.date  WHERE strftime('%Y', date) BETWEEN '2010' AND '2015'  AND Player.height > 170;	european_football_2
SELECT height FROM Player ORDER BY height ASC LIMIT 1;	european_football_2
SELECT Country.name FROM League JOIN Country ON League.country_id = Country.id WHERE League.name = 'Italy Serie A';	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_api_id = 30572);	european_football_2
SELECT COUNT(*)  FROM Match JOIN League ON Match.country_id = League.id WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT t.team_api_id FROM Team t JOIN Match m ON t.team_api_id = m.home_team_goal WHERE m.home_team_goal = 10;	european_football_2
SELECT p.player_api_id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 AND pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61);	european_football_2
SELECT ABS(AVG(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE NULL END) - AVG(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE NULL END)) AS diff_average_ball_control FROM Player_Attributes;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT      (SELECT name FROM Player WHERE birthday = '1979-11-08 00:00:00') AS older_player,     (SELECT name FROM Player WHERE birthday = '1982-05-08 00:00:00') AS younger_player	european_football_2
SELECT height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT country_id  FROM League  WHERE name = 'Belgium Jupiler League';	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.name = Country.name  WHERE Country.name = 'Germany';	european_football_2
SELECT * FROM 'Player_Attributes' WHERE 'overall_rating' = (SELECT MAX('overall_rating') FROM 'Player_Attributes');	european_football_2
SELECT COUNT(*) FROM Player JOIN Player_Attributes ON Player.birthday < strftime('%Y', '1986-01-01') AND Player_Attributes.defensive_work_rate = 'high';	european_football_2
SELECT MAX(crossing) AS best_crossing FROM Player_Attributes WHERE player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE player_api_id IN (         SELECT player_api_id         FROM Player_Attributes         WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes WHERE player_api_id = 505942)     )     AND player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE player_api_id = 505942) );	european_football_2
SELECT heading_accuracy  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes WHERE player_api_id = 505942 ORDER BY heading_accuracy DESC LIMIT 1);	european_football_2
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70;	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_name = pa.player_name  WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(M.id)  FROM Match M  JOIN Country C ON M.country_id = C.id  WHERE C.name = 'Belgium' AND M.season = '2008/2009';	european_football_2
SELECT pa.long_passing FROM Player p JOIN Player_Attributes pa ON p.birthday = pa.long_passing WHERE p.birthday = (SELECT MIN(birthday) FROM Player);	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04';	european_football_2
SELECT league_id FROM matches WHERE season = '2008/2009' GROUP BY league_id ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE strftime('%Y', Player.birthday) < '1986';	european_football_2
SELECT      (ABS((SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk') -           (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel'))) * 100 /      (SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Paulin Puel') AS percentage_difference	european_football_2
SELECT AVG(`buildUpPlaySpeed`) AS average_build_up_play_speed FROM `Team_Attributes` WHERE `team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(crossing) AS total_crossing_score FROM Player_Attributes INNER JOIN (     SELECT player_api_id     FROM Player_Attributes     WHERE player_api_id = (         SELECT player_api_id         FROM Player_Attributes         WHERE player_name = 'Aaron Lennox'     ) ) AS T2 ON Player_Attributes.player_api_id = T2.player_api_id;	european_football_2
SELECT MAX(`chanceCreationPassing`), `chanceCreationPassingClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax' GROUP BY `chanceCreationPassingClass` ORDER BY `chanceCreationPassing` DESC LIMIT 1;	european_football_2
SELECT preferred_foot  FROM Player_Attributes  WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(overall_rating)  FROM Player_Attributes  WHERE player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal) AS average_goals FROM Match JOIN Team ON Match.away_team_api_id = Team.team_long_name WHERE Team.team_long_name = 'Parma' AND Match.country_id = 1;	european_football_2
SELECT P.player_api_id, P.birthday FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating = 77 AND PA.date = '2016-06-23' ORDER BY P.birthday ASC LIMIT 1;	european_football_2
SELECT overall_rating  FROM Player_Attributes  WHERE player_name = 'Aaron Mooy' AND date = '2016-02-04 00:00:00';	european_football_2
SELECT potential  FROM Player_Attributes  WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player_Attributes WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00');	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_api_id` = (     SELECT `player_api_id`     FROM `Player_Attributes`     WHERE `player_api_id` IN (         SELECT `player_api_id`         FROM `Player_Attributes`         WHERE `player_name` = 'Francesco Migliore'         AND `date` = '2015-05-01 00:00:00'     ) );	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00') AND date = '2013-02-22 00:00:00';	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' ORDER BY crossing DESC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE date = '2011-02-22 00:00:00' AND team_long_name = 'Willem II';	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_fifa_api_id FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00') AND date = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_fifa_api_id FROM Team_Attributes WHERE team_long_name = 'FC Lorient') AND date = '2010-02-22';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_fifa_api_id = (     SELECT team_fifa_api_id     FROM Team_Attributes     WHERE team_long_name = 'PEC Zwolle'     AND date = '2013-09-20 00:00:00' ) ORDER BY date DESC LIMIT 1;	european_football_2
SELECT `chanceCreationCrossingClass` FROM `Team_Attributes` WHERE `team_fifa_api_id` IN (     SELECT `team_fifa_api_id`     FROM `Team_Attributes`     WHERE `team_long_name` = 'Hull City' ) AND `date` = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_fifa_api_id` = (     SELECT `team_fifa_api_id`     FROM `Team_Attributes`     WHERE `team_long_name` = 'Hannover 96' ) AND `date` = '2015-09-10 00:00:00';	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  WHERE player_name = 'Marko Arnautovic'  AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';	european_football_2
SELECT      (         (SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes WHERE player_name = 'Landon Donovan' AND date = '2013-07-12')          - (SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes WHERE player_name = 'Jordan Bowery' AND date = '2013-07-12'))     ) /      (SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes WHERE player_name = 'Landon Donovan' AND date = '2013-07-12')) * 100 AS percentage_difference	european_football_2
SELECT player_name  FROM Player  ORDER BY height DESC  LIMIT 5;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT birthday  FROM Player  WHERE (strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', birthday)) > 34	european_football_2
SELECT SUM(home_team_goal)  FROM Match  WHERE home_player_11 IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon');	european_football_2
SELECT SUM(away_goals)  FROM Match m  JOIN Player p ON m.away_team_api_id = p.team_api_id  WHERE p.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(M.home_team_goal) AS total_home_goals FROM Match M JOIN Player_Attributes PA ON M.player_api_id = PA.player_api_id WHERE TIMESTAMPDIFF(YEAR, (SELECT birthday FROM Player_Attributes WHERE player_api_id = M.player_api_id), CURRENT_TIMESTAMP) < 30;	european_football_2
SELECT pa.player_name FROM Player pa JOIN Player_Attributes pa_attr ON pa.player_name = pa_attr.player_name ORDER BY pa_attr.overall_rating DESC LIMIT 10;	european_football_2
SELECT player_name  FROM Player  WHERE player_name IN (SELECT player_name FROM Player_Attributes ORDER BY potential DESC LIMIT 1)	european_football_2
SELECT PA.player_api_id FROM Player_Attributes PA WHERE PA.attacking_work_rate = 'high' GROUP BY PA.player_api_id HAVING COUNT(DISTINCT CASE WHEN PA.attacking_work_rate = 'high' THEN PA.player_api_id ELSE NULL END) > 0;	european_football_2
SELECT      p.name,     MAX(SUBTRACT(datetime(CURRENT_TIMESTAMP, 'localtime'), datetime(p.birthday))) AS age FROM      Player_Attributes pa JOIN      Players p ON pa.player_id = p.id WHERE      pa.finishing = 1 ORDER BY      age DESC LIMIT 1;	european_football_2
SELECT player_name  FROM Player  JOIN Country ON Player.player_name LIKE 'Aaron%'  WHERE Country.name = 'Belgium';	european_football_2
SELECT `player_api_id`, country FROM `Player_Attributes` WHERE `vision` > 89;	european_football_2
SELECT c.id AS country_id, AVG(p.weight) AS average_weight FROM Player p JOIN Country c ON p.player_api_id = c.id GROUP BY c.id ORDER BY average_weight DESC LIMIT 1;	european_football_2
SELECT team_long_name FROM Team_Attributes WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_short_name = ta.team_short_name WHERE ta.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height)  FROM Player  JOIN Country ON Player.height = Country.id  WHERE Country.id = 1;	european_football_2
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name ASC  LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT      (SELECT jumping FROM Player_Attributes WHERE id = 6) -      (SELECT jumping FROM Player_Attributes WHERE id = 23) AS difference_between_jumping_scores;	european_football_2
SELECT player_fifa_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 3;	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.id WHERE pa.preferred_foot = 'left' AND pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left');	european_football_2
SELECT      ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM Player), 2) AS percentage FROM      Player_Attributes WHERE      stamina > 80 AND strength > 80;	european_football_2
SELECT c.name FROM Country c JOIN League l ON c.country_id = l.country_id WHERE c.name = 'Poland' AND l.name = 'Ekstraklasa';	european_football_2
SELECT m.home_team_goal AS home_score, m.away_team_goal AS away_score FROM Match m JOIN League l ON m.name = l.name WHERE m.date = '2008-09-24 00:00:00' AND l.name = 'Belgium Jupiler League';	european_football_2
SELECT pa.sprint_speed, pa.agility, pa.acceleration FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Alexis Blin');	european_football_2
SELECT      CASE          WHEN buildUpPlaySpeedClass = 'Slow' THEN 'Slow'         WHEN buildUpPlaySpeedClass = 'Balanced' THEN 'Balanced'         WHEN buildUpPlaySpeedClass = 'Fast' THEN 'Fast'     END AS speed_class FROM      Team_Attributes WHERE      team_fifa_api_id = (SELECT team_fifa_api_id FROM Team_Attributes WHERE team_long_name = 'KSV Cercle Brugge' GROUP BY team_fifa_api_id)	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016';	european_football_2
SELECT MAX(home_team_goal)  FROM Match  WHERE country_id = (SELECT country_id FROM League WHERE name = "Netherlands Eredivisie");	european_football_2
SELECT pa.finishing, pa.curve  FROM Player p  JOIN Player_Attributes pa ON p.weight = pa.finishing  WHERE p.weight = (SELECT MAX(weight) FROM Player);	european_football_2
SELECT team_long_name, COUNT(id) AS total_games FROM Match WHERE season = '2015/2016' GROUP BY team_long_name ORDER BY total_games DESC LIMIT 1;	european_football_2
SELECT T2.team_long_name FROM Match AS M JOIN Team AS T2 ON M.away_team_api_id = T2.team_long_name JOIN (     SELECT away_team_api_id, MAX(away_team_goal) AS max_goals     FROM Match     GROUP BY away_team_api_id ) AS T3 ON M.away_team_api_id = T3.away_team_api_id WHERE T3.max_goals = (     SELECT MAX(away_team_goal)     FROM Match );	european_football_2
SELECT p.player_api_id, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_fifa_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 1;	european_football_2
SELECT      (COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END) * 100.0) / COUNT(id) AS percentage FROM      Player;	european_football_2
SELECT     CASE         WHEN SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) - SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END AND Admission = '+') >               SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) - SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END AND Admission = '-')         THEN 'In-patient'         ELSE 'Outpatient'     END AS Gender_Preference,     ROUND(         (             SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) - SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END AND Admission = '+') -              SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) + SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END AND Admission = '-')         ) /          SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) * 100     ) AS Percentage_Deviation FROM     Patient;	thrombosis_prediction
SELECT      (SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) > '1930' AND SEX = 'F') /      (SELECT COUNT(*) FROM Patient WHERE SEX = 'F') * 100 AS PercentageFemaleBornAfter1930	thrombosis_prediction
SELECT      ROUND((COUNT(CASE WHEN `Admission` = '+' THEN 1 END) * 100.0) / COUNT(*), 2) AS Inpatient_Percentage FROM      `Patient` WHERE      `Birthday` BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN 'Diagnosis' = 'SLE' AND 'Admission' = '+' THEN 'ID' END) /      COUNT(CASE WHEN 'Diagnosis' = 'SLE' AND 'Admission' = '-' THEN 'ID' END)) AS OutpatientToInpatientRatio FROM Examination;	thrombosis_prediction
SELECT p.Diagnosis, l.Date FROM Patient p JOIN Laboratory l ON p.Diagnosis = l.Diagnosis WHERE p.Diagnosis LIKE '%30609%'	thrombosis_prediction
SELECT      P.SEX,      P.Birthday,      E.Symptoms FROM      Patient P JOIN      Examination E ON P.SEX = E.Symptoms WHERE      P.SEX = 'F' AND P.Birthday = '1934-02-13';	thrombosis_prediction
SELECT ID, SEX, Birthday FROM Patient WHERE ID IN (SELECT Patient_ID FROM LabResults WHERE LDH > 500);	thrombosis_prediction
SELECT ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(Birthday)) AS age FROM Patient JOIN Coagulation ON Patient.ID = Coagulation.PatientID WHERE Coagulation.RVVT = '+'	thrombosis_prediction
SELECT p.ID, p.SEX, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.T-CHO WHERE EXTRACT(YEAR FROM p.Birthday) = 1937 AND l.T-CHO >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ALB WHERE Laboratory.ALB < 3.5;	thrombosis_prediction
SELECT     (COUNT(CASE WHEN L.TP < 6.0 OR L.TP > 8.5 THEN P.ID END) * 100.0) / COUNT(P.ID) AS percentage_female_out_of_range FROM     Patient P JOIN     Laboratory L ON P.ID = L.TP WHERE     P.SEX = 'F'	thrombosis_prediction
SELECT AVG(aCL_IgG)  FROM Patient  WHERE Admission = '+'  AND (YEAR(CURRENT_TIMESTAMP) - YEAR(Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p1 WHERE p1.SEX = 'F' AND YEAR(p1.Description) = 1997 AND EXISTS (     SELECT 1     FROM Patient p2     WHERE p1.ID + 1 = p2.ID     AND p2.Description LIKE '1997-%' );	thrombosis_prediction
SELECT MIN(SUBTRACT(YEAR('Birthday'), YEAR('First Date'))) AS YoungestPatientAge FROM 'Patient' WHERE 'First Date' IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Examination E ON P.ID = E.Thrombosis WHERE P.SEX = 'F' AND E.Thrombosis = 1;	thrombosis_prediction
SELECT      MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.TG WHERE      Laboratory.TG >= 200;	thrombosis_prediction
SELECT e.Diagnosis, e.Symptoms FROM Patient p JOIN Examination e ON p.ID = e.Diagnosis WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient);	thrombosis_prediction
SELECT COUNT(ID) / 12 AS AverageMonthlyMalePatients FROM Laboratory WHERE Date BETWEEN '1998-01-01' AND '1998-12-31' AND SEX = 'M' GROUP BY MONTH(Date);	thrombosis_prediction
SELECT Lab.Date, (YEAR(Lab.Date) - YEAR(P.Birthday)) AS AgeAtArrival FROM Laboratory Lab JOIN Patient P ON Lab.Date = P.FirstDate WHERE P.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY AgeAtArrival DESC LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN 'SEX' = 'M' AND 'UA' <= 8.0 THEN 1 ELSE 0 END) /       SUM(CASE WHEN 'SEX' = 'F' AND 'UA' <= 6.5 THEN 1 ELSE 0 END)) AS 'Male_to_Female_Ratio' FROM      'Patient'  JOIN      'Laboratory'  ON      'Patient'.'SEX' = 'Laboratory'.'SEX';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p LEFT JOIN Examination e ON p.ID = e.Examination_Date WHERE p.First_Date IS NOT NULL AND e.Examination_Date IS NULL AND DATEDIFF(YEAR, p.First_Date, e.Examination_Date) >= 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.Birthday < DATE_SUB('1994-01-01', INTERVAL 18 YEAR) WHERE Examination.Examination Date BETWEEN '1990-01-01' AND '1993-12-31';	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.SEX = 'M' AND L.T_BIL > 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS Count FROM Examination WHERE 'Examination Date' BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY Count DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(Birthday))  FROM Patient  JOIN Laboratory ON Patient.Birthday <= '1991-10-01' AND Patient.Birthday >= '1991-09-30' WHERE Laboratory.Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT      (YEAR('Examination.Examination Date') - YEAR('Patient.Birthday')) AS Age,     'Doctor\'s Diagnosis' AS Diagnosis FROM      Patient JOIN      Examination ON Patient.Birthday = Examination.Examination Date WHERE      Examination.HGB = (SELECT MAX(HGB) FROM Examination) ORDER BY      Examination.HGB DESC LIMIT 1;	thrombosis_prediction
SELECT ANA  FROM Examination  WHERE ANA = 256 AND ExaminationDate = '1996-12-02';	thrombosis_prediction
SELECT TP FROM Laboratory WHERE TP < 250 AND TP IS NOT NULL;	thrombosis_prediction
SELECT SEX  FROM 'Patient'  WHERE 'Diagnosis' = 'AORTITIS'  ORDER BY 'ID'  LIMIT 1;	thrombosis_prediction
SELECT aCL_IgM FROM 'Patient' WHERE 'Description' = '1993-11-12' AND EXISTS (     SELECT 1     FROM 'Patient' AS Diag     WHERE Diag.'Description' = '1994-02-19' AND Diag.Description = 'SLE' )	thrombosis_prediction
SELECT SEX  FROM Patient  JOIN Laboratory ON Patient.SEX = 'F'  WHERE Laboratory.GPT = 9 AND Laboratory.Date = '1992-06-12';	thrombosis_prediction
SELECT DATEDIFF('1991-10-21', Birthday) - (YEAR('1991-10-21') - YEAR(Birthday)) AS Age FROM Patient WHERE EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.Date = '1991-10-21' AND Laboratory.UA = 8.4 ) AND Birthday IS NOT NULL;	thrombosis_prediction
SELECT COUNT('Laboratory.ID')  FROM 'Laboratory' JOIN 'Patient' ON 'Laboratory.ID' = 'Patient.ID' WHERE 'Patient.Diagnosis' = "SJS" AND 'Patient.FirstDate' = "1991-06-13" AND 'Laboratory.Date' BETWEEN "1995-01-01" AND "1995-12-31";	thrombosis_prediction
SELECT 'Diagnosis' FROM Examination WHERE Diagnosis LIKE '%SLE%' AND 'First Date' = '1997-01-27' ORDER BY First Visit DESC LIMIT 1;	thrombosis_prediction
SELECT e.Symptoms FROM Patient p JOIN Examination e ON p.Birthday = e.Symptoms WHERE p.Birthday = '1959-03-01' AND e.Symptoms = '1993-09-27';	thrombosis_prediction
SELECT      (SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-11-%' THEN l.T-CHO ELSE 0 END) -      SUM(CASE WHEN p.Birthday = '1959-02-18' AND l.Date LIKE '1981-12-%' THEN l.T-CHO ELSE 0 END)) AS CholesterolDecrease FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      p.Birthday = '1959-02-18' AND      (l.Date BETWEEN '1981-11-01' AND '1981-12-31')	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis LIKE '%Behcet%' AND e.Examination Date BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT 'Examination.ID' FROM 'Examination' JOIN 'Laboratory' ON 'Examination.ID' = 'Laboratory.GOT' WHERE 'Laboratory.GOT' > 30 AND 'Laboratory.ALB' < 4 AND 'Examination.ID' BETWEEN 14872 AND 122405;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 2 AND E.`ANA Pattern` = 'S' AND E.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination);	thrombosis_prediction
SELECT      (COUNT(CASE WHEN UA <= 6.5 THEN 1 END) * 100.0) /      COUNT(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 END) AS percentage FROM      'Laboratory'	thrombosis_prediction
SELECT      (SUM(CASE WHEN `DIAGNOSIS` = 'BEHCET' THEN 1 ELSE 0 END) / COUNT(`DIAGNOSIS` = 'BEHCET')) * 100 AS Percentage_Behcet FROM      `Patient` WHERE      `SEX` = 'M' AND      YEAR(`FIRST DATE`) = '1981'	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, P.Birthday, P.Description, P.`First Date`, P.Admission, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'  AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND ANA_Pattern NOT IN ('p', 'P');	thrombosis_prediction
SELECT DISTINCT E.Diagnosis FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Diagnosis = 'PSS' AND L.CRP > 2 AND L.CRE = 1 AND L.LDH = 123;	thrombosis_prediction
SELECT AVG(L.ALB) AS AvgAlbuminLevel FROM Laboratory AS L JOIN Patient AS P ON L.ALB IS NOT NULL AND L.PLT > 400 AND P.SEX = 'F' AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(Symptoms) AS MostCommonSymptom FROM Examination WHERE Diagnosis LIKE '%SLE%';	thrombosis_prediction
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.TP WHERE YEAR(DATE) = 1997 AND L.TP > 6 AND L.TP < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Diagnosis LIKE '%ITP%' THEN 1 ELSE 0 END) / SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END)) * 100 AS ProportionOfSLEWithThrombocytopenia FROM Examination;	thrombosis_prediction
SELECT (COUNT(CASE WHEN SEX = 'F' THEN 1 END) * 100) / COUNT(*)  FROM Patient  WHERE YEAR(BIRTHDAY) = '1980' AND SEX = 'F'	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Examination E ON P.Admission = E.'Examination Date' WHERE P.SEX = 'M' AND E.'Examination Date' BETWEEN '1995' AND '1997' AND E.'Diagnosis' LIKE '%BEHCET%' AND P.'Admission' = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT TIMESTAMPDIFF(MINUTE, `First Date`, `Examination Date`) AS TimeToEvaluation FROM Patients WHERE `Patient Number` = 821298 ORDER BY `First Date`, `Examination Date` LIMIT 1;	thrombosis_prediction
SELECT      CASE          WHEN 'M' = 'M' AND UA > 8.0 THEN 'Yes'         WHEN 'F' = 'F' AND UA > 6.5 THEN 'Yes'         ELSE 'No'     END AS Is_UA_Normal FROM      Laboratory WHERE      UA IS NOT NULL AND     UA >= CASE                  WHEN 'M' = 'M' THEN 8.0                 WHEN 'F' = 'F' THEN 6.5                 ELSE 0             END AND     (SELECT UA FROM Laboratory WHERE patient_number = 57266)	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.GOT WHERE p.Birthday BETWEEN '1994-01-01' AND '1994-12-31' AND l.GOT < 60;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.GPT WHERE Patient.SEX = 'M' AND Laboratory.GPT >= 60;	thrombosis_prediction
SELECT 'Examination.Diagnosis' FROM 'Examination' JOIN 'Patient' ON 'Examination.Diagnosis' LIKE '%GPT > 60%' ORDER BY MAX('Patient.Birthday') ASC;	thrombosis_prediction
SELECT AVG(LDH) AS avg_ldh FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT      p.ID,      (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM      Patient p JOIN      Laboratory l ON p.ID = l.LDH WHERE      p.ID = l.LDH AND l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT P.Admission, L.ALP FROM Patient P JOIN Laboratory L ON P.Admission = L.ALP WHERE L.ALP < 300;	thrombosis_prediction
SELECT p.Birthday, l.ALP FROM Patient p JOIN Laboratory l ON p.Birthday = l.ALP WHERE p.Birthday = '1982-04-01' AND l.ALP < 300;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.TP WHERE l.TP < 6.0;	thrombosis_prediction
SELECT ID, (TP - 8.5) AS TP_Deviation FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.TP WHERE SEX = 'F' AND TP > 8.5;	thrombosis_prediction
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.Birthday = L.Birthday WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT      P.Birthday,      L.ALB,      CASE          WHEN L.ALB BETWEEN 3.5 AND 5.5 THEN 'Within normal range'         ELSE 'Not within normal range'     END AS Albumin_Status FROM      Patient P JOIN      Laboratory L ON P.Birthday BETWEEN '1982-01-01' AND '1982-12-31' WHERE      P.Birthday BETWEEN '1982-01-01' AND '1982-12-31';	thrombosis_prediction
SELECT     CAST(COUNT(*) AS REAL) / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F') * 100 AS Percentage FROM     Laboratory WHERE     (UA > 8.0 OR (UA > 6.5 AND SEX = 'F'));	thrombosis_prediction
SELECT AVG(UA) AS Average_UA FROM Laboratory WHERE (UA < 8.0 AND SEX = 'M') OR (UA < 6.5 AND SEX = 'F') AND (SELECT MAX(Date) FROM Laboratory AS L2 WHERE L2.Date <= Laboratory.Date AND L2.SEX = Laboratory.SEX) = Laboratory.Date;	thrombosis_prediction
SELECT ID, SEX, Birthday  FROM Patient  WHERE ID IN (SELECT ID FROM `Patient` WHERE `UN` = 29);	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.UN WHERE p.SEX = 'F' AND l.UN < 30 AND p.ID IN (SELECT ID FROM Patient WHERE SEX = 'F' AND Birthday BETWEEN '1920-01-01' AND '1945-12-31')	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.CRE WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT (SUM(CASE WHEN 'SEX' = 'M' AND 'CRE' >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN 'SEX' = 'F' AND 'CRE' >= 1.5 THEN 1 ELSE 0 END)) AS male_over_female FROM 'Patient' JOIN 'Laboratory' ON 'Patient.SEX' = 'Laboratory.SEX' WHERE 'Laboratory.CRE' >= 1.5;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Laboratory.T_BIL FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.T_BIL WHERE Laboratory.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory) ORDER BY Laboratory.T_BIL DESC LIMIT 1;	thrombosis_prediction
SELECT P.SEX, COUNT(L.T_BIL) AS Abnormal_Bilirubin_Count FROM Patient P JOIN Laboratory L ON P.SEX = L.T_BIL WHERE L.T_BIL >= 2.0 GROUP BY P.SEX;	thrombosis_prediction
SELECT p.Birthday, lab.T-CHO FROM Patient p JOIN Laboratory lab ON p.Birthday = lab.Birthday WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND lab.T-CHO = (SELECT MAX(T-CHO) FROM Laboratory)	thrombosis_prediction
SELECT AVG(DATEDIFF(CURRENT_DATE, 'Birthday') / 365) AS average_age FROM Patient WHERE 'SEX' = 'M' AND EXISTS (     SELECT 1 FROM Laboratory L     WHERE L.T-CHO >= 250 AND L.T-CHO IS NOT NULL AND Patient.ID = L.ID );	thrombosis_prediction
SELECT p.ID, p.Diagnosis, l.TG FROM Patient p JOIN Laboratory l ON p.ID = l.TG WHERE l.TG > 300;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE year(current_timestamp) - year('Birthday') > 50 AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.TG >= 200     AND Laboratory.TG IS NOT NULL     AND Patient.TG = Laboratory.TG );	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.CPK WHERE L.CPK IS NOT NULL AND L.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.SEX = 'M' AND P.Birthday BETWEEN '1936-01-01' AND '1956-12-31' WHERE L.CPK >= 250;	thrombosis_prediction
SELECT ID, SEX,         (strftime('%Y', 'now') - strftime('%Y', Birthday)) AS Age FROM Patient WHERE (strftime('%Y', 'now') - strftime('%Y', Birthday)) > 0 AND GLU >= 180 AND T-CHO < 250;	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU < 180 AND YEAR(l.Date) = 1991 AND NOT EXISTS (     SELECT 1     FROM Laboratory l2     WHERE l2.ID = p.ID AND YEAR(l2.Date) < 1991 );	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.WBC WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 ORDER BY p.SEX, (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) ASC;	thrombosis_prediction
SELECT ID, Diagnosis  FROM Patient  WHERE Diagnosis LIKE '%RBC < 3.5%'	thrombosis_prediction
SELECT P.Birthday, L.RBC, CASE WHEN L.RBC <= 3.5 OR L.RBC >= 6.0 THEN '+' ELSE '-' END AS Admission FROM Patient P JOIN Laboratory L ON P.Birthday = L.RBC WHERE P.Sex = 'F' AND SUBSTR(CURRENT_DATE, 1, 4) - SUBSTR(P.Birthday, 1, 4) >= 50;	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.HGB WHERE L.HGB < 10;	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.Diagnosis JOIN Laboratory L ON P.ID = L.HGB WHERE E.Diagnosis = 'SLE' AND L.HGB BETWEEN 10 AND 17 ORDER BY P.ID ASC LIMIT 1;	thrombosis_prediction
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT >= 52 GROUP BY P.ID, P.Birthday HAVING COUNT(L.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT)  FROM 'Laboratory'  WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS 'LowerThanNormal',     SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS 'HigherThanNormal',     SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS 'Difference' FROM Laboratory;	thrombosis_prediction
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.Birthday BETWEEN DATE_SUB(L.Date, INTERVAL 50 YEAR) AND L.Date WHERE L.Date LIKE '1984%' AND P.Birthday IS NOT NULL AND P.Birthday < DATE_SUB(CURDATE(), INTERVAL 50 YEAR) AND EXISTS (     SELECT 1     FROM Laboratory L2     WHERE P.Birthday BETWEEN DATE_SUB(L2.Date, INTERVAL 50 YEAR) AND L2.Date     AND L2.Date LIKE '1984%'     AND EXISTS (         SELECT 1         FROM Platelets PLT         WHERE P.Birthday = PLT.Birthday         AND PLT.PLT BETWEEN 100 AND 400     ) );	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END) * 1.0) / COUNT(*), 2) AS percentage_abnormal_PT FROM      Patient  JOIN      Laboratory ON Patient.Birthday <= DATE_SUB(CURRENT_DATE, INTERVAL 55 YEAR)  WHERE      Patient.SEX = 'F';	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.PT WHERE P.ID > 0 AND L.PT IS NOT NULL AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE 'Examination Date' > '1997-01-01' AND NOT EXISTS (     SELECT 1     FROM Examination AS E2     WHERE E2.ID = Examination.ID     AND E2.'Examination Date' <= '1997-01-01'     AND E2.APTT >= 45 )	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.APTT WHERE L.APTT > 45 AND E.Diagnosis LIKE '%3%';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.FG WHERE P.SEX = 'M' AND (L.FG <= 150 OR L.FG >= 450) AND L.FG BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.Birthday) FROM Patient P JOIN Laboratory L ON P.Birthday > '1980-01-01' AND L.FG BETWEEN 150 AND 450;	thrombosis_prediction
SELECT `Patient.Diagnosis` FROM `Patient` JOIN `Laboratory` ON `Patient.Diagnosis` = `Laboratory.U-PRO` WHERE `Laboratory.U-PRO` >= 30;	thrombosis_prediction
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.U_PRO  WHERE l.U_PRO IS NOT NULL  AND l.U_PRO BETWEEN 0 AND 30  AND EXISTS (SELECT 1 FROM Diagnosis WHERE Patient_ID = p.ID AND Diagnosis = 'SLE');	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Symptoms = 'abortion' AND EXISTS (     SELECT 1     FROM Examination AS E2     WHERE E2.Symptoms = 'AMI' AND E2.Symptoms IS NULL );	thrombosis_prediction
SELECT COUNT(*) FROM Patients WHERE IGG BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.ID, l.IGA FROM Patient p JOIN Laboratory l ON p.ID = l.IGA WHERE l.IGA BETWEEN 80 AND 500 ORDER BY l.IGA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.IGA  WHERE l.IGA BETWEEN 80 AND 500 AND p.ID > 0;	thrombosis_prediction
SELECT MAX(COUNT('Diagnosis')) AS MostCommonDisease FROM Examination WHERE 'Diagnosis' LIKE '%IgM%' GROUP BY 'Diagnosis' ORDER BY COUNT('Diagnosis') DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE l.CRP IN ('+', '-', '<1.0') AND l.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.Birthday) FROM Patient P JOIN Laboratory L ON P.Birthday = L.CRP WHERE L.CRP NOT IN ('+-', '-') AND L.CRP >= 1.0 AND (YEAR(CURDATE()) - YEAR(P.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.RA WHERE p.ID IN (2110, 11408, 12052, 14872, 27654) AND l.RA IN ('-', '+-') AND p.ID IN (SELECT ID FROM Laboratory WHERE KCT = '+');	thrombosis_prediction
SELECT `Diagnosis` FROM `Patient` WHERE `Birthday` > '1995-01-01' AND `Diagnosis` NOT LIKE '%RA%' AND `Diagnosis` NOT LIKE '%SLE%' AND `Diagnosis` NOT LIKE '%PSS%' AND `Diagnosis` NOT LIKE '%MCTD%' AND `Diagnosis` NOT LIKE '%RA, SLE susp%';	thrombosis_prediction
SELECT ID FROM Patient WHERE EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.RF < 20 AND Laboratory.ID = Patient.ID ) AND (YEAR(CURDATE()) - YEAR(Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.RF  WHERE l.RF < 20 AND p.ID NOT IN (     SELECT Patient.ID      FROM Patient      JOIN Laboratory ON Patient.ID = Laboratory.RF      WHERE Laboratory.RF IS NOT NULL AND Laboratory.RF >= 20 );	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.C3 WHERE Laboratory.C3 > 35 AND Patient.ID IN (SELECT ID FROM Patient WHERE 'ANA Pattern' = 'P');	thrombosis_prediction
SELECT `Patient`.`ID` FROM `Patient` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `HCT` NOT BETWEEN 29 AND 52 ORDER BY `aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT P.Diagnosis) FROM Patient P JOIN Laboratory L ON P.Diagnosis LIKE '%APS%' WHERE L.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.RNP WHERE Laboratory.RNP IN ('-', '+-') AND Laboratory.RNP IS NOT NULL;	thrombosis_prediction
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.Birthday = (SELECT MIN(Birthday) FROM Patient) WHERE L.RNP NOT IN('-', '+-');	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SM IN('-', '+-') AND Thrombosis = 1;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.SM WHERE l.SM NOT IN ('-', '+-') ORDER BY p.ID LIMIT 3;	thrombosis_prediction
SELECT ID  FROM Examination  WHERE 'Examination Date' >= '1997-01-01'  AND SC170 IN('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.Symptoms WHERE p.ID IN (     SELECT ID     FROM Examination     WHERE Symptoms = 'normal anti-scl70' ) AND p.Sex = 'M' AND e.Symptoms = 'vertigo';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.SSA WHERE L.SSA IN ('-', '+-') AND P.ID IN (SELECT ID FROM Patient WHERE YEAR(`First Date`) < 1990);	thrombosis_prediction
SELECT MIN(`Patient.ID`)  FROM `Patient` JOIN `Laboratory` ON `Patient.ID` = `Laboratory.SSA` WHERE `Laboratory.SSA` NOT IN('-', '+-') ORDER BY `Patient.ID` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT L.SSB)  FROM Laboratory L  JOIN Examination E ON L.SSB IN('-', '+-')  WHERE E.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.SSB IN('-', '+-') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  WHERE CENTROMEA IN('-', '+-')  AND SSB IN('-', '+-')  AND Sex = 'M';	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.DNA WHERE l.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT P.Description)  FROM Patient P JOIN Laboratory L ON P.Description = L.DNA WHERE L.DNA < 8 AND P.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.Admission) FROM Patient p JOIN Laboratory l ON p.Admission = l.'DNA-II' WHERE p.Admission = '+' AND l.'DNA-II' >= 8;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN L.GOT >= 60 THEN P.ID END) * 1.0) / COUNT(CASE WHEN L.GOT >= 60 THEN 1 END) AS PercentageAbnormalGOTWithSLE FROM      Patient P JOIN      Laboratory L ON P.ID = L.GOT WHERE      P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;	thrombosis_prediction
SELECT MAX(Birthday)  FROM Patient  WHERE EXISTS (     SELECT 1      FROM Laboratory      WHERE Patient.Birthday = Laboratory.GOT     AND Laboratory.GOT >= 60 );	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 ORDER BY l.GPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND NOT EXISTS (     SELECT 1     FROM Examination     WHERE Examination.ID = Patient.ID     AND NOT EXISTS (         SELECT 1         FROM Examination AS E2         WHERE E2.ID = Examination.ID         AND E2.ID IN (SELECT ID FROM Examination WHERE ID < 60)     ) );	thrombosis_prediction
SELECT p.First_Date FROM Patient p JOIN Laboratory l ON p.First_Date = (SELECT MIN(First_Date) FROM Patient WHERE First_Date IS NOT NULL AND (SELECT LDH FROM Laboratory WHERE Laboratory.ID = p.First_Date) < 500) WHERE (SELECT LDH FROM Laboratory WHERE Laboratory.ID = p.First_Date) < 500;	thrombosis_prediction
SELECT MAX("First Date")  FROM Patient  JOIN Laboratory ON Patient."First Date" = Laboratory."First Date" WHERE Laboratory."LDH" >= 500;	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ALP WHERE L.ALP >= 300 AND P.Admission = '+';	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE ALP < 300;	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p JOIN Laboratory l ON p.ID = l.TP WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.Diagnosis = 'SJS' WHERE L.TP > 6.0 AND L.TP < 8.5;	thrombosis_prediction
SELECT Examination.Examination_Date FROM Examination JOIN Laboratory ON Examination.Examination_Date = Laboratory.ALB WHERE Laboratory.ALB IN (SELECT MAX(ALB) FROM Laboratory WHERE ALB > 3.5 AND ALB < 5.5) JOIN Patient ON Examination.Examination_Date = Patient.ID;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.SEX = 'M' WHERE ALB > 3.5 AND ALB < 5.5 AND TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT Patient.ID, Lab.aCL_IgG, Lab.aCL_IgM, Lab.aCL_IgA FROM Patient JOIN Laboratory Lab ON Patient.ID = Lab.Patient_ID WHERE Patient.Sex = 'F' AND Lab.UA > 6.50 AND Lab.UA = (SELECT MAX(UA) FROM Laboratory WHERE UA > 6.50);	thrombosis_prediction
SELECT MAX(ANA)  FROM 'Laboratory'  WHERE 'CRE' < 1.5;	thrombosis_prediction
SELECT PatientID FROM Patients WHERE CRE < 1.5 AND aCL_IgA = (SELECT MAX(aCL_IgA) FROM Patients);	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE E.ANA_Pattern LIKE '%P%' AND EXISTS (     SELECT 1      FROM Examination E2      WHERE E2.ID = P.ID AND E2.ANA_Pattern IS NOT NULL AND E2.ANA_Pattern LIKE '%P%'      AND CAST(E2.ANA_Pattern AS TEXT) NOT LIKE '%,%'     AND E2.ANA_Pattern NOT LIKE 'P,%'     AND E2.ANA_Pattern NOT LIKE '%,P%'     AND CAST(E2.ANA_Pattern AS TEXT) NOT LIKE '%,P,%'     AND CAST(E2.ANA_Pattern AS TEXT) NOT LIKE '%,,%'     AND E2.ANA_Pattern NOT LIKE 'S,%'     AND CAST(E2.ANA_Pattern AS TEXT) NOT LIKE '%S,%'     AND E2.ANA_Pattern NOT LIKE ',S,%'     AND E2.ANA_Pattern NOT LIKE '%S'     AND E2.ANA_Pattern NOT LIKE '%,%S'     AND E2.ANA_Pattern NOT LIKE ',,%S'     AND E2.ANA_Pattern NOT LIKE 'P,S,%'     AND E2.ANA_Pattern NOT LIKE 'P,%S'     AND E2.ANA_Pattern NOT LIKE '%P,%S'     AND E2.ANA_Pattern NOT LIKE 'P,S,%S'     AND E2.ANA_Pattern NOT LIKE 'P,%S,%'     AND E2.ANA_Pattern NOT LIKE '%P,%S,%'     AND E2.ANA_Pattern NOT LIKE '%P,S,%S'     AND E2.ANA_Pattern NOT LIKE '%P,%S,%S'     AND E2.ANA_Pattern NOT LIKE 'S,P,%'     AND E2.ANA_Pattern NOT LIKE 'S,%P'     AND E2.ANA_Pattern NOT LIKE '%S,P,%'     AND E2.ANA_Pattern NOT LIKE '%S,%P,%'     AND E2.ANA_Pattern NOT LIKE '%S,P,%S'     AND E2.ANA_Pattern NOT LIKE '%S,%P,%S'     AND E2.ANA_Pattern NOT LIKE 'P,S,S,%'     AND E2.ANA_Pattern NOT LIKE 'P,S,%S,%'     AND E2.ANA_Pattern NOT LIKE	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.T_BIL WHERE L.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory WHERE T_BIL < 2.0)	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory AS L WHERE L.T-CHO >= 250 AND EXISTS (     SELECT 1     FROM Laboratory AS L2     WHERE L2.T-CHO = L.T-CHO AND L2.KCT = '-' );	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE 'T-CHO' < 250 AND ANA_Pattern = 'P';	thrombosis_prediction
SELECT COUNT(p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.TG WHERE l.TG < 200 AND p.ID IN (SELECT ID FROM Patient WHERE Symptoms IS NOT NULL);	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.TG WHERE l.TG < 200 ORDER BY l.TG DESC LIMIT 1;	thrombosis_prediction
SELECT Examination.ID FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.Thrombosis = 0 AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Laboratory L ON E.RVVT = '+' OR E.KCT = '+' OR E.LAC = '+' WHERE L.CPK < 250;	thrombosis_prediction
SELECT p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GLU > 180  ORDER BY p.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory L JOIN Examination E ON L.GLU < 180 AND E.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE Diagnosis = 'SLE' AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND Laboratory.WBC BETWEEN 3.5 AND 9.0 );	thrombosis_prediction
SELECT p.'Admission' FROM 'Patient' p JOIN 'Laboratory' l ON p.'Admission' = l.'Admission' WHERE (l.'RBC' <= 3.5 OR l.'RBC' >= 6.0) AND p.'Admission' = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT L.PLT FROM Laboratory L JOIN Patient P ON L.PLT BETWEEN 100 AND 400 WHERE P.Diagnosis = 'MCTD';	thrombosis_prediction
SELECT AVG(PT)  FROM Laboratory  WHERE PT < 14  AND ID IN (SELECT ID FROM Patient WHERE SEX = 'M');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.Thrombosis WHERE e.Thrombosis IN (1, 2) AND e.Thrombosis < 14;	thrombosis_prediction
SELECT major.major_name  FROM member  JOIN major ON member.link_to_major = major.major_name  WHERE member.link_to_major = 'Angela Sanders';	student_club
CREATE TABLE 'student_club'  (     'member_id' TEXT NULL,     'in_student_club' BOOLEAN NULL,     FOREIGN KEY('member_id') REFERENCES 'member'('member_id') );  ALTER TABLE 'major' ADD COLUMN 'student_in_club' BOOLEAN NULL;  -- Populate hypothetical data for 'student_club' and 'major' INSERT INTO 'student_club' ('member_id', 'in_student_club') VALUES ("rec1x5zBFIqoOuPW8", TRUE); INSERT INTO 'student_club' ('member_id', 'in_student_club') VALUES ("rec280Sk7o31iG0Tx", FALSE); INSERT INTO 'student_club' ('member_id', 'in_student_club') VALUES ("rec28ORZgcm1dtqBZ", TRUE); INSERT INTO 'student_club' ('member_id', 'in_student_club') VALUES ("rec2a03QXbFQAUZ7X", FALSE); INSERT INTO 'student_club' ('member_id', 'in_student_club') VALUES ("rec3pH4DxMcWHMRB7", TRUE);  UPDATE 'major' SET 'student_in_club' = TRUE WHERE 'college' = "College of Engineering";	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.major_id = ma.major_id WHERE ma.major_name = 'Outdoor Product Design and Development';	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN member m ON a.link_to_member = m.member_id  JOIN event e ON a.event_name = e.event_name  WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.phone = a.link_to_member JOIN event e ON a.event_name = e.event_name WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*) FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.event_id = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium';	student_club
SELECT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_id ORDER BY COUNT(a.link_to_event) DESC LIMIT 1;	student_club
SELECT m.position, m.link_to_major, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.college WHERE m.position = 'Vice President'	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_name = a.link_to_event JOIN some_other_table sot ON sot.attendee_name = 'Maya Mclean' WHERE sot.link_to_event = a.link_to_event;	student_club
SELECT COUNT(DISTINCT e.event_name) FROM attendance a JOIN event e ON a.link_to_event = e.event_name WHERE e.event_date LIKE '2019%' AND a.link_to_member = 'Sacha Harrison' AND e.event_name LIKE 'Student_Club%'	student_club
SELECT COUNT(*)  FROM event e JOIN attendance a ON e.event_id = a.link_to_member WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 10;	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_name = attendance.link_to_event GROUP BY event.event_name HAVING COUNT(attendance.link_to_event) > 20;	student_club
SELECT AVG(COUNT(e.event_id)) / COUNT(DISTINCT e.event_name) AS average_attendance FROM event e WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020;	student_club
SELECT expense_description, MAX(cost) AS highest_cost FROM expense WHERE expense_description LIKE '%Club Events%' ORDER BY cost DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member m  JOIN major ma ON m.member_id = ma.major_id  WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.first_name = a.link_to_event WHERE a.link_to_event = "rec2N69DMcrqN9PJC";	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.last_name = ma.major_name WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.county WHERE m.first_name = 'Sherri' AND m.last_name = 'Ramsey';	student_club
SELECT m.major.college FROM member m JOIN major maj ON m.link_to_major = maj.college WHERE m.link_to_major = 'Tyler Hewitt';	student_club
SELECT i.amount  FROM income i  JOIN member m ON i.link_to_member = m.position  WHERE m.position = 'Vice President';	student_club
SELECT SUM(e.cost) AS total_spent FROM expense e JOIN event ev ON e.expense_id = ev.expense_id WHERE e.expense_description LIKE '%Food%' AND ev.event_name = 'September Meeting';	student_club
SELECT z.city FROM member m JOIN zip_code z ON m.zip = z.city JOIN major ma ON m.link_to_major = ma.major_name WHERE ma.major_name = 'President of the Student Club';	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM member WHERE NOT EXISTS (     SELECT 1     FROM zip_code     WHERE member.first_name = zip_code.state     AND zip_code.state != 'Illinois' ) AND EXISTS (     SELECT 1     FROM zip_code     WHERE member.first_name = zip_code.state     AND zip_code.state = 'Illinois' );	student_club
SELECT SUM(cost) AS total_spent_on_advertisement FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE expense.cost IS NOT NULL AND expense.event_name = 'September Meeting' AND budget.category = 'Advertisement';	student_club
SELECT m.major.department  FROM member m  JOIN major maj ON m.link_to_major = maj.department  WHERE m.link_to_major IN ("recxK3MHQFbR9J5uO", "recaJdSK83k6ekRJL");	student_club
SELECT SUM(amount)  FROM budget  WHERE event_name = 'October Speaker';	student_club
SELECT e.event_name, e.event_date, ex.approved FROM event e JOIN expense ex ON e.event_name = 'October Meeting' AND e.event_date = '2019-10-08' WHERE ex.approved = 'true';	student_club
SELECT AVG(cost) AS average_cost FROM expense WHERE expense_date BETWEEN '2019-09-01' AND '2019-10-31' AND expense_id IN (     SELECT expense_id     FROM expense     JOIN member ON expense.member_id = member.member_id     WHERE member.first_name = 'Elijah' AND member.last_name = 'Allen' );	student_club
SELECT      (SUM(CASE WHEN YEAR(event_date) = 2019 THEN spent ELSE 0 END) -      SUM(CASE WHEN YEAR(event_date) = 2020 THEN spent ELSE 0 END)) AS total_difference FROM      budget;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT e.cost FROM event e JOIN expense ex ON e.event_name LIKE '%Posters%' WHERE e.event_name LIKE '%2019-09-04%'	student_club
SELECT remaining  FROM budget  WHERE amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food');	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'	student_club
SELECT COUNT(*)  FROM major  WHERE major_id IN (     SELECT major_id      FROM major      JOIN another_table ON major.major_id = another_table.major_id      WHERE another_table.department = 'College of Humanities and Social Sciences' );	student_club
SELECT phone FROM member WHERE phone = "(651) 928-4507";	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.county WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget WHERE link_to_event = 'recI43CzsZ0Q625ma' OR       link_to_event = 'recggMW2eyCYceNcy' OR       link_to_event = 'recJ4Witp9tpjaugn' OR       link_to_event = 'recHaMmaKyfktt5fW' AND remaining < 0;	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.amount = e.event_id  WHERE e.event_name = 'September Speaker';	student_club
SELECT event_status  FROM expense  WHERE expense_description = "Post Cards, Posters"  AND expense_date = "2019-08-20";	student_club
SELECT major.major_name FROM member JOIN major ON member.member_id = 'brent_thomason'	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = 'recxK3MHQFbR9J5uO' AND t_shirt_size = 'X-Large'	student_club
SELECT zip_code.type FROM member JOIN zip_code ON member.first_name = 'Christof' AND member.last_name = 'Nielson' WHERE zip_code.type IS NOT NULL;	student_club
SELECT m.major_name FROM member m JOIN major ma ON m.position = 'Vice President' WHERE m.position = 'Vice President';	student_club
SELECT state FROM member WHERE first_name = 'Sacha' AND last_name = 'Harrison';	student_club
SELECT m.position, ma.department FROM member m JOIN major ma ON m.position = 'President' WHERE m.position = 'President';	student_club
SELECT date_received FROM income WHERE source = 'Dues' ORDER BY date_received DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.first_name = i.first_name AND m.last_name = i.last_name WHERE i.date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues');	student_club
SELECT      (SUM(CASE WHEN category = 'Advertisement' AND event_name = 'Yearly Kickoff' THEN amount ELSE 0 END)       / SUM(CASE WHEN category = 'Advertisement' AND event_name = 'October Meeting' THEN amount ELSE 0 END)) AS comparison_ratio FROM budget	student_club
SELECT      (SUM(CASE WHEN category = 'Parking' THEN amount ELSE 0 END) / COUNT(event_name = 'November Speaker')) * 100 AS parking_budget_percentage FROM      budget WHERE      link_to_event = 'recHaMmaKyfktt5fW'	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(*)  FROM zip_code  WHERE county = 'Orange County' AND 'Virginia';	student_club
SELECT department FROM major WHERE department = 'College of Humanities and Social Sciences Department';	student_club
SELECT zc.city, zc.county, zc.state FROM member m JOIN zip_code zc ON m.zip = zc.zip WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description FROM expense e JOIN (     SELECT budget_id     FROM budget     ORDER BY remaining ASC     LIMIT 1 ) b ON e.budget_id = b.budget_id;	student_club
SELECT a.link_to_member FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE a.link_to_event = (SELECT link_to_event FROM attendance WHERE link_to_event LIKE '%October Meeting%')	student_club
SELECT college, COUNT(*) AS member_count FROM major GROUP BY college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT m.major_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.link_to_major = (     SELECT link_to_major      FROM member      WHERE link_to_major = "recxK3MHQFbR9J5uO" );	student_club
SELECT link_to_event, MAX(amount)  FROM budget  GROUP BY link_to_event  ORDER BY MAX(amount) DESC  LIMIT 1;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.expense_description = m.position WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT link_to_member)  FROM attendance  WHERE link_to_member IN (SELECT link_to_member FROM attendance WHERE event_name = 'Women''s Soccer');	student_club
SELECT 'income.date_received' FROM 'member' JOIN 'income' ON 'member.member_id' = 'income.member_id' WHERE 'member.member_id' = 'rec280Sk7o31iG0Tx'	student_club
SELECT COUNT(*) FROM member WHERE zip IN (SELECT zip FROM zip_code WHERE state = 'Maryland');	student_club
SELECT COUNT(*)  FROM attendance  WHERE link_to_member IN (     SELECT member_id      FROM members      WHERE phone_number = '954-555-6240' );	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.first_name = ma.department WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event_name, (spent / amount) AS spend_to_budget_ratio FROM event JOIN budget ON event.event_name = budget.event_name WHERE event_name IN (     SELECT event_name     FROM event     WHERE status = 'Closed' ) ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget;	student_club
SELECT COUNT(*)  FROM event  WHERE YEAR(event_date) = 2020 AND event_id IN (SELECT event_id FROM event_type WHERE type = 'Meeting');	student_club
SELECT SUM(spent)  FROM budget  WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN (     SELECT link_to_event     FROM attendance     GROUP BY link_to_event     HAVING COUNT(*) > 7 ) a ON m.first_name = (SELECT first_name FROM member WHERE link_to_event = a.link_to_event)	student_club
SELECT a.link_to_member FROM attendance a JOIN major m ON a.link_to_member = m.major_name WHERE m.major_name = 'Interior Design' AND a.link_to_event = 'Community Theater';	student_club
SELECT first_name, last_name  FROM member  WHERE first_name = 'Georgetown' AND last_name = 'South Carolina';	student_club
SELECT SUM(i.amount)  FROM income i  JOIN member m ON i.amount = m.first_name  WHERE m.first_name = 'Grant';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member m JOIN income i ON m.first_name = (SELECT first_name FROM member WHERE first_name = m.first_name AND (SELECT SUM(amount) FROM income WHERE member.first_name = m.first_name) > 40)	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN event ev ON e.expense_id IN (     SELECT expense_id     FROM expense     WHERE expense_id LIKE '%Baseball game%' ) WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN event e ON m.first_name = e.event_name WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.amount AS income FROM member m JOIN income i ON m.first_name = (SELECT first_name FROM member WHERE income.amount = (SELECT MAX(amount) FROM income))	student_club
SELECT event_id  FROM event  ORDER BY cost ASC  LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN e.cost ELSE 0 END) / SUM(e.cost)) * 100 AS Yearly_Kickoff_Percentage FROM      expense e JOIN      event ev ON e.cost = ev.event_name	student_club
SELECT      (SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) /      SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END)) AS finance_to_physics_ratio FROM      major;	student_club
SELECT source, SUM(amount) as total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT m.first_name, m.last_name, m.email FROM member m WHERE m.first_name = 'Angela' AND m.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT link_to_major FROM major WHERE major_name = 'Physics Teaching')	student_club
SELECT COUNT(DISTINCT a.link_to_member)  FROM attendance a  JOIN event e ON a.link_to_member = e.event_id  WHERE e.event_name = 'Community Theater' AND YEAR(e.event_date) = 2019;	student_club
SELECT COUNT(a.link_to_event) AS events_attended, m.link_to_major FROM attendance a JOIN member m ON a.link_to_event = m.link_to_major WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' GROUP BY a.link_to_event, m.link_to_major;	student_club
SELECT AVG(cost)  FROM expense  WHERE EXISTS (     SELECT 1      FROM event      WHERE event.status = 'Closed' AND expense.id = event.expense_id ) AND expense.category = 'Food';	student_club
SELECT event_name FROM budget WHERE category = 'Advertisement' GROUP BY event_name ORDER BY MAX(spent) DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_event = (SELECT link_to_event FROM events WHERE name = 'Women''s Soccer') AND link_to_member = (SELECT link_to_member FROM members WHERE name = 'Maya Mclean');	student_club
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0) / COUNT(event_id) AS percentage_community_service FROM      event WHERE      type = 'Community Service' AND      event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Posters'  AND expense_description IN (SELECT expense_description FROM expense WHERE expense_description LIKE '%Posters%');	student_club
SELECT t_shirt_size, MAX(COUNT(t_shirt_size))  FROM orders  GROUP BY t_shirt_size;	student_club
SELECT e.event_name FROM event e JOIN expense ex ON e.event_name = ex.event_name JOIN budget b ON e.event_name = b.event_name WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT expense.type, SUM(expense.cost) AS total_value FROM expense JOIN event ON expense.event_name = event.event_name WHERE event.event_name = 'October Meeting' AND expense.approved = 'true' GROUP BY expense.type;	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_name WHERE e.event_name = 'April Speaker' ORDER BY b.amount ASC;	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food';	student_club
SELECT budget_id, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_parking_cost FROM expense WHERE expense_id = 'Parking';	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.first_name = e.cost WHERE m.first_name = 'rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;	student_club
SELECT expense_description FROM expense WHERE link_to_member = 'recro8T1MPMwRadVH';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.expense_description = m.t_shirt_size WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.zip = e.zip WHERE e.cost < 50;	student_club
SELECT major.major_name  FROM major  JOIN member ON major.major_name = member.link_to_major  WHERE member.link_to_major = (SELECT link_to_major FROM member WHERE link_to_major IS NOT NULL);	student_club
SELECT m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_name WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.major_name = major.major_name  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.type = b.type WHERE b.remaining > 30;	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_name = b.category WHERE e.event_name LIKE '%MU 215%';	student_club
SELECT b.category FROM event e JOIN budget b ON e.event_name = b.category WHERE e.event_date = '2020-03-24T12:00:00';	student_club
SELECT `link_to_major` FROM `member` WHERE `position` = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN m.member_id IN (SELECT member_id FROM member m JOIN major ma ON m.major_id = ma.major_id WHERE ma.major_name = 'Mathematics') THEN 1 ELSE 0 END) / COUNT(m.member_id)) * 100 AS percentage_math_members FROM member m;	student_club
SELECT b.category FROM budget b JOIN event e ON b.category = e.category WHERE e.location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*)  FROM member  WHERE t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.link_to_major, m.major_name, m.department, m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_name WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM budget b JOIN event e ON b.category = 'Guest Speaker' AND b.spent = 0 WHERE e.location = 'MU 215';	student_club
SELECT z.city, z.state FROM zip_code z JOIN member m ON z.city = m.link_to_major WHERE m.link_to_major = 'recxK3MHQFbR9J5uO' OR m.link_to_major = 'rec7BxKpjJ7bNph3O' OR m.link_to_major = 'recdIBgeU38UbV2sy' OR m.link_to_major = 'recaJdSK83k6ekRJL';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_name = a.link_to_event JOIN member m ON a.link_to_event = m.position WHERE m.position = 'Vice President' AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.last_name = e.expense_description WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.last_name = a.link_to_member JOIN event e ON a.event_name = 'Women''s Soccer' WHERE e.position = 'Member';	student_club
SELECT      (SELECT COUNT(*) FROM income WHERE amount = 50 AND link_to_member IN (         SELECT member_id FROM member WHERE t_shirt_size = 'Medium'     )) / (SELECT COUNT(DISTINCT member_id) FROM member WHERE t_shirt_size = 'Medium') * 100 AS percentage_of_50_amount	student_club
SELECT DISTINCT state FROM zip_code WHERE city LIKE '%PO Box%'	student_club
SELECT m.zip FROM member m JOIN zip_code zc ON m.zip = zc.zip_code JOIN (     SELECT zip_code     FROM zip_code     WHERE zip_code BETWEEN 00900 AND 00999 ) pobox_zip ON m.zip = pobox_zip.zip_code WHERE zc.zip_code BETWEEN 00900 AND 00999;	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT a.link_to_event FROM attendance a JOIN expense e ON a.link_to_event = e.cost WHERE e.cost > 50;	student_club
SELECT m.first_name, m.last_name, e.link_to_member FROM member m JOIN expense e ON m.first_name = SUBSTR(e.link_to_member, 5) WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT m.first_name, maj.college FROM member m JOIN major maj ON m.link_to_major = maj.college WHERE m.first_name = 'Katy' AND m.link_to_major = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member m JOIN major ma ON m.phone = ma.major_name WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT email  FROM expenses  WHERE expense_date BETWEEN '2019-09-10' AND '2019-11-19'  AND cost > 20;	student_club
SELECT COUNT(*)  FROM member  WHERE link_to_major IN (SELECT link_to_major FROM major WHERE major_name = 'Education');	student_club
SELECT DIVIDE(SUM(CASE WHEN 'budget.remaining' < 0 THEN 1 ELSE 0 END), COUNT('event.event_id')) * 100 AS percentage_over_budget FROM 'event' JOIN 'budget' ON 'event.event_id' = 'budget.event_id';	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, cost FROM expense GROUP BY expense_id HAVING SUM(cost) / COUNT(expense_id) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT DIVIDE(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END), COUNT(zip_code)) * 100 AS percentage_PO_Box FROM zip_code;	student_club
SELECT event_name, location FROM event JOIN budget ON event.event_name = budget.link_to_event WHERE budget.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_name = ex.expense_description WHERE ex.cost > 50 AND ex.cost < 100 AND ex.expense_description = 'Pizza';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN expense e ON m.first_name = e.cost WHERE e.cost > 100;	student_club
SELECT e.city, e.country FROM event e JOIN (     SELECT event_id     FROM income     GROUP BY event_id     HAVING COUNT(income_id) > 40 ) i ON e.event_id = i.event_id;	student_club
SELECT m.member_id, MAX(e.cost) as max_cost FROM member m JOIN (     SELECT member_id, cost     FROM expense     GROUP BY member_id, cost     HAVING COUNT(*) > 1 ) e ON m.member_id = e.member_id GROUP BY m.member_id ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT AVG(cost)  FROM expense  WHERE position != 'Member';	student_club
SELECT event_name FROM event WHERE event_id IN (     SELECT e.event_id     FROM event e     JOIN expense ex ON e.event_id = ex.event_id     WHERE e.event_name LIKE '%Parking%'     GROUP BY e.event_id     HAVING SUM(ex.cost) < (SELECT AVG(cost) FROM expense) );	student_club
SELECT      (SUM('expense.cost') / COUNT('event.event_id')) * 100 AS game_event_percentage FROM      'event' JOIN      'expense' ON 'event.event_id' = 'expense.event_id' WHERE      'event.type' = 'Game';	student_club
SELECT link_to_budget FROM expense WHERE cost = (SELECT MAX(cost) FROM expense WHERE expense_description = 'Water, chips, cookies')	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m LEFT JOIN expense e ON m.first_name = e.cost GROUP BY m.first_name, m.last_name ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, e.cost FROM member m JOIN expense e ON m.first_name = (SELECT first_name FROM member WHERE cost > AVG(cost)) WHERE e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT      SUBTRACT(         DIVIDE(SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END), COUNT(position = 'Member')),          DIVIDE(SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END), COUNT(position = 'Member'))     ) AS percentage_difference FROM member WHERE position = 'Member';	student_club
SELECT m.major_name, m.department FROM major m JOIN member me ON m.major_name = me.link_to_major WHERE me.link_to_major = 'recxK3MHQFbR9J5uO';	student_club
SELECT m.first_name, m.last_name, e.cost FROM member m JOIN expense e ON m.first_name = e.cost WHERE e.cost = 'Water, Veggie tray, supplies';	student_club
SELECT last_name, phone FROM member WHERE last_name IN ("Sanders", "Gilmour", "Guidi", "Woodard", "Hilton");	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.category = CONCAT('Speaker Gifts', ' - ', e.event_name) WHERE e.event_name = 'Officers meeting - January';	student_club
SELECT category FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.first_name = i.first_name WHERE i.date_received = '2019-09-04';	student_club
SELECT b.category  FROM budget b  JOIN expense e ON b.category = 'Posters'  WHERE e.link_to_budget = b.category;	student_club
SELECT CONCAT(first_name, ' ', last_name) AS full_name, major.college FROM member JOIN major ON member.first_name = major.college WHERE first_name = 'Randy' AND last_name = 'Woodard';	student_club
SELECT SUM(b.spent), e.event_name FROM budget b JOIN event e ON b.category = e.event_name WHERE b.category = 'Speaker Gifts';	student_club
SELECT city FROM zip_code WHERE city = 'Garrett Girke'	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.first_name = 'Lincolnton' AND m.last_name = 'North Carolina' WHERE z.zip_code = 28092;	student_club
SELECT COUNT(DISTINCT gs.Country) FROM gasstations gs JOIN gas_station_products gsp ON gs.Country = gsp.Country JOIN products p ON gsp.ProductDescription = p.Description WHERE p.Description = 'Premium';	debit_card_specializing
SELECT (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END)) AS Ratio_EUR_to_CZK FROM customers;	debit_card_specializing
SELECT c.CustomerID, MIN(y.Consumption) AS MinConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'LAM' AND y.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID ORDER BY MinConsumption LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS Average_Monthly_Consumption FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND (CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME'));	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date BETWEEN '201101' AND '201112' AND Currency = 'CZK' GROUP BY CustomerID ORDER BY SUM(Consumption) DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' AND ym.Consumption < 30000 AND ym.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Segment = 'CZK' THEN ym.Consumption ELSE 0 END) -      SUM(CASE WHEN c.Segment = 'EUR' THEN ym.Consumption ELSE 0 END)) AS ConsumptionDifference FROM customers c JOIN yearmonth ym ON LEFT(ym.Date, 6) BETWEEN '201201' AND '201212' WHERE c.Segment IN ('CZK', 'EUR');	debit_card_specializing
CREATE TABLE 'gas_usage'  (     'YearMonth' TEXT NOT NULL,     'Currency' TEXT NOT NULL,     'GasUsage' INTEGER NOT NULL );	debit_card_specializing
SELECT `Segment`, MIN(`Consumption`) AS `MinConsumption` FROM `yearmonth` JOIN `customers` ON `yearmonth`.`Consumption` = `customers`.`Segment` GROUP BY `Segment` ORDER BY `MinConsumption` LIMIT 1;	debit_card_specializing
SELECT LEFT(Date, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE LEFT(Date, 4) = '2012' OR LEFT(Date, 4) = '2013' OR LEFT(Date, 4) = '2014' OR LEFT(Date, 4) = '2015' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT      SUBSTR(Date, 5, 2) AS 'Month',      MAX(Consumption) AS 'PeakConsumption' FROM      yearmonth WHERE      Date LIKE '2013%'      AND EXISTS (         SELECT 1          FROM customers          WHERE customers.Segment = 'SME'          AND SUBSTR(yearmonth.Date, 5, 2) = customers.Segment     ) GROUP BY      Month ORDER BY      PeakConsumption DESC LIMIT 1;	debit_card_specializing
WITH Customer_Averages AS (     SELECT         Segment,         AVG(Consumption) AS AnnualAvg     FROM         yearmonth     WHERE         Date BETWEEN '201301' AND '201312'     GROUP BY         Segment ), Lowest_Consumption AS (     SELECT         Segment,         MIN(Consumption) AS MinConsumption     FROM         yearmonth     WHERE         Date BETWEEN '201301' AND '201312'     GROUP BY         Segment ), Lowest_Segment_Consumption AS (     SELECT         a.Segment,         a.AnnualAvg     FROM         Customer_Averages a     JOIN         Lowest_Consumption b ON a.Segment = b.Segment     WHERE         a.AnnualAvg = b.MinConsumption ), SME_LAM AS (     SELECT         (SELECT AnnualAvg FROM Lowest_Segment_Consumption WHERE Segment = 'SME') -          (SELECT AnnualAvg FROM Lowest_Segment_Consumption WHERE Segment = 'LAM') AS Difference ), LAM_KAM AS (     SELECT         (SELECT AnnualAvg FROM Lowest_Segment_Consumption WHERE Segment = 'LAM') -          (SELECT AnnualAvg FROM Lowest_Segment_Consumption WHERE Segment = 'KAM') AS Difference ), KAM_SME AS (     SELECT         (SELECT AnnualAvg FROM Lowest_Segment_Consumption WHERE Segment = 'KAM') -          (SELECT AnnualAvg FROM Lowest_Segment_Consumption WHERE Segment = 'SME') AS Difference ) SELECT     (SELECT Difference FROM SME_LAM) AS SME_LAM_Difference,     (SELECT Difference FROM LAM_KAM) AS LAM_KAM_Difference,     (SELECT Difference FROM KAM_SME) AS KAM_SME_Difference;	debit_card_specializing
SELECT      c.Segment,     (SUM(CASE WHEN ym.Date BETWEEN '201201' AND '201212' THEN ym.Consumption ELSE 0 END) -       SUM(CASE WHEN ym.Date BETWEEN '201301' AND '201312' THEN ym.Consumption ELSE 0 END)) /       SUM(CASE WHEN ym.Date BETWEEN '201301' AND '201312' THEN ym.Consumption ELSE 1 END) * 100 AS PercentageIncrease,     (SUM(CASE WHEN ym.Date BETWEEN '201201' AND '201212' THEN ym.Consumption ELSE 0 END) -       SUM(CASE WHEN ym.Date BETWEEN '201301' AND '201312' THEN ym.Consumption ELSE 0 END)) /       SUM(CASE WHEN ym.Date BETWEEN '201201' AND '201212' THEN ym.Consumption ELSE 1 END) * 100 AS PercentageDecrease FROM      yearmonth ym JOIN      customers c ON c.Segment = (SELECT Segment FROM customers ORDER BY COUNT(*) DESC LIMIT 1) GROUP BY      c.Segment ORDER BY      ABS(PercentageIncrease) DESC, ABS(PercentageDecrease) ASC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  WHERE Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money') -      (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount') AS DifferenceDiscountCzechSlovakia	debit_card_specializing
SELECT (SUM(CASE WHEN ym.Date = '201304' THEN c.Consumption ELSE 0 END) -        SUM(CASE WHEN ym.Date = '201304' THEN c.Consumption ELSE 0 END)) AS Difference FROM yearmonth AS ym JOIN customers AS c ON ym.CustomerID = c.CustomerID WHERE c.CustomerID = 7 AND ym.Date = '201304' AND EXISTS (     SELECT 1     FROM yearmonth AS ym2     JOIN customers AS c2 ON ym2.CustomerID = c2.CustomerID     WHERE c2.CustomerID = 5 AND ym2.Date = '201304' );	debit_card_specializing
SELECT      SUM(CASE WHEN 'Segment' = 'SME' THEN 1 ELSE 0 END) AS Total_SMEs_CZK,     SUM(CASE WHEN 'Segment' = 'SME' THEN 0 ELSE 1 END) AS Total_SMEs_EUR FROM      'customers' WHERE      'Segment' IN ('SME', 'LAM')	debit_card_specializing
SELECT c.Currency, ym.Consumption FROM customers c JOIN yearmonth ym ON c.Currency = ym.Currency WHERE c.Currency = "EUR" AND ym.Date = "201310" ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, ym.Consumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.CustomerID IN (     SELECT CustomerID FROM customers WHERE CustomerID LIKE 'KAM%' ) ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(`Consumption`)  FROM `yearmonth` WHERE `Date` = '201305'  AND EXISTS (     SELECT 1      FROM `customers`      WHERE `Segment` = 'KAM'      AND `customers`.`Segment` = `yearmonth`.`Date` );	debit_card_specializing
SELECT     ROUND((SUM(CASE WHEN Consumption > 46.73 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS Percentage FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'LAM';	debit_card_specializing
SELECT Country, COUNT(*) AS ValueForMoneyCount FROM gasstations JOIN transactions_1k ON gasstations.Country = transactions_1k.Country WHERE transactions_1k.Price > (SELECT AVG(Price) FROM transactions_1k) GROUP BY Country;	debit_card_specializing
SELECT     (SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS PercentageOfKAMInEuro FROM customers WHERE Segment = 'KAM'	debit_card_specializing
SELECT      ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM customers), 2) AS percentage FROM      customers JOIN      yearmonth ON customers.Segment = yearmonth.Segment WHERE      yearmonth.Date = '201202' AND yearmonth.Consumption > 528.3;	debit_card_specializing
SELECT      (COUNT(CASE WHEN Country = 'CZE' AND Segment = 'Premium' THEN 1 END) * 100.0) / COUNT(*) AS PercentageOfPremiumGasStations FROM gasstations;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.Segment = y.Segment WHERE y.Consumption = (SELECT MIN(Consumption) FROM yearmonth WHERE date = '201309');	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.Segment = 'SME' WHERE y.Consumption = (SELECT MIN(Consumption) FROM yearmonth WHERE date = '201206') AND y.date = '201206';	debit_card_specializing
SELECT MAX(Consumption)  FROM yearmonth  WHERE DATE_FORMAT(Date, '%Y') = '2012';	debit_card_specializing
SELECT MAX(`Consumption`) AS `Biggest_Monthly_Consumption` FROM `yearmonth` WHERE `Date` IN (     SELECT `Date`     FROM `yearmonth`     JOIN `customers` ON `yearmonth`.`Date` LIKE CONCAT(SUBSTRING(`customers`.`Currency`, 3), '%')     GROUP BY `Date`     ORDER BY SUM(`Consumption`) / 12 DESC     LIMIT 1 );	debit_card_specializing
SELECT p.Description FROM products p JOIN yearmonth y ON LEFT(p.Description, 6) = y.Date WHERE y.Date = '201309';	debit_card_specializing
SELECT GasStationID FROM transactions_1k JOIN yearmonth ON SUBSTR(transactions_1k.GasStationID, 1, 6) = yearmonth.Date WHERE yearmonth.Date = '201306';	debit_card_specializing
SELECT g ChainID FROM gasstations g JOIN transactions_1k t ON g.ChainID = t.GasStationID WHERE t.GasStationID IN (3704, 656, 741);	debit_card_specializing
SELECT p.Description  FROM products p JOIN transactions_1k t ON p.Description = 'Nafta'  UNION SELECT p.Description  FROM products p JOIN transactions_1k t ON p.Description = 'Special'  UNION SELECT p.Description  FROM products p JOIN transactions_1k t ON p.Description = 'Super'  UNION SELECT p.Description  FROM products p JOIN transactions_1k t ON p.Description = 'Natural';	debit_card_specializing
SELECT AVG(`Amount`) AS average_total_price FROM `transactions_1k` WHERE `Date` LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(*) FROM customers JOIN yearmonth ON customers.Currency = "EUR" WHERE yearmonth.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.Description JOIN gasstations g ON t.ProductID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.ChainID WHERE gasstations.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE GasStationID IN (     SELECT GasStationID     FROM GasStationDetails     WHERE Country = 'CZE' ) AND Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.Date IN (SELECT Date FROM transactions_1k) WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(t.Amount) as AverageTotalPrice FROM transactions_1k t JOIN gasstations g ON t.Amount = g.Country WHERE g.Country = 'CZE';	debit_card_specializing
SELECT AVG(t.Amount) AS AverageTotalPrice FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT CustomerID, SUM(Amount) AS TotalPaid FROM transactions_1k GROUP BY CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.Date ASC LIMIT 1;	debit_card_specializing
SELECT currency FROM transactions WHERE date = '2012-08-24' AND time = '16:25:00';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment IS NOT NULL AND ym.CustomerID = 5	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Amount IS NOT NULL;	debit_card_specializing
SELECT Segment  FROM customers  WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);	debit_card_specializing
SELECT g.Country  FROM transactions_1k t1 JOIN gasstations g ON t1.GasStationID = g.GasStationID WHERE t1.GasStationID IN (3704, 656, 741) AND g.Country IS NOT NULL;	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT ym.Consumption, ym.Date FROM transactions_1k AS t JOIN yearmonth AS ym ON t.CustomerID = ym.Consumption WHERE t.Amount = 124.05 AND t.Date = '2012-08-24' AND ym.Date LIKE '2012-01-%';	debit_card_specializing
SELECT COUNT(t.GasStationID) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.Country WHERE t.GasStationID IS NOT NULL AND g.Country = 'CZE' AND t.GasStationID IN (3704, 656, 741);	debit_card_specializing
SELECT 'transactions_1k.Amount' AS Amount, 'transactions_1k.Date' AS Date FROM 'transactions_1k' WHERE 'transactions_1k.CustomerID' IN (SELECT 'yearmonth.CustomerID' FROM 'yearmonth' WHERE 'yearmonth.Date' LIKE '201306%') GROUP BY 'transactions_1k.CustomerID' HAVING SUM('transactions_1k.Amount') = 214582.17;	debit_card_specializing
SELECT c.Country FROM customers AS cu JOIN transactions_1k AS t ON cu.CustomerID = t.CustomerID WHERE t.CustomerID = 667467;	debit_card_specializing
SELECT Customer.Nationality FROM transactions_1k JOIN Customers ON transactions_1k.CustomerID = Customers.CustomerID WHERE transactions_1k.Date = '2012-08-24' AND transactions_1k.Amount = 548.4;	debit_card_specializing
SELECT      (COUNT(CASE WHEN c.Currency = 'EUR' THEN 1 END) * 100.0) / COUNT(*) AS Percentage_EUR_Users FROM      customers c JOIN      yearmonth ym ON DATE(c.Currency) = ym.Date WHERE      ym.Date = '2012-08-25'	debit_card_specializing
SELECT     (y2012.Consumption - y2013.Consumption) / y2012.Consumption AS DecreaseRate FROM     (         SELECT Consumption         FROM yearmonth         WHERE Date = '2012-08-24'     ) AS y2012 CROSS JOIN     (         SELECT Consumption         FROM yearmonth         WHERE Date = '2013-08-24'     ) AS y2013;	debit_card_specializing
SELECT GasStationID, SUM(Amount) AS TotalRevenue FROM transactions_1k GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT     (COUNT(CASE WHEN p.Description LIKE '%premium%' THEN 1 END) * 100.0) / COUNT(*) AS Premium_Percentage FROM     customers c JOIN     gasstations g ON c.Segment = g.Country JOIN     products p ON c.Segment = p.Description WHERE     g.Country = 'SVK';	debit_card_specializing
SELECT SUM(Amount) AS TotalAmount FROM transactions_1k WHERE CustomerID = 38508 AND Amount IS NOT NULL;  SELECT SUM(Amount) AS TotalAmountInJanuary FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '201201%';	debit_card_specializing
SELECT p.Description, COUNT(t1.ProductID) AS SalesCount FROM products p JOIN transactions_1k t1 ON p.Description = t1.ProductID GROUP BY p.Description ORDER BY SalesCount DESC LIMIT 5;	debit_card_specializing
SELECT c.Currency, AVG(t.Price / t.Amount) AS AvgPricePerItem FROM customers c JOIN transactions_1k t ON c.Currency = t.Price GROUP BY c.Currency ORDER BY AvgPricePerItem DESC LIMIT 1;	debit_card_specializing
SELECT g.Country, SUM(s.SalesAmount) AS TotalSales FROM gasstations g JOIN sales s ON g.Country = s.Country WHERE s.ProductID = 2 GROUP BY g.Country ORDER BY TotalSales DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID FROM transactions_1k t JOIN yearmonth ym ON t.CardID = ym.CustomerID WHERE t.ProductID = 5 AND t.Price / t.Amount > 29.00 AND ym.Date LIKE '201208%';	debit_card_specializing
