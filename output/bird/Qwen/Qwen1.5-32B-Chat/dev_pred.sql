SELECT MAX(`Percent (%) Eligible Free (K-12)`) FROM frpm WHERE `County Name` = 'Alameda'
SELECT frpm.CDSCode, frpm.`Eligible Free Rate (Ages 5-17)` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.SchoolType = 'Continuation Schools' ORDER BY frpm.`Eligible Free Rate (Ages 5-17)` ASC LIMIT 3; 
SELECT DISTINCT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`County Name` = 'Fresno' AND f.`District Name` = 'Fresno County Office of Education'
SELECT s.MailStreet, s.MailCity, s.MailState FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.FRPM_Count_ (K-12) = (SELECT MAX(FRPM_Count_ (K-12)) FROM frpm) GROUP BY s.CDSCode;
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.OpenDate >= '2000-01-01' AND f.FundingType = 'Directly funded';
SELECT COUNT(*) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath < 400 AND s.Virtual = 'F'
SELECT DISTINCT s.CDSCode, s.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumTstTakr > 500 AND s.Magnet = 1;
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrRead >= 1500 OR ss.AvgScrMath >= 1500 OR ss.AvgScrWrite >= 1500 GROUP BY s.Phone ORDER BY COUNT(ss.NumTstTakr) DESC LIMIT 1;
SELECT COUNT(satscores.NumTstTakr) AS num_sat_test_takers FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.FRPM_Count_(_K-12_) = (SELECT MAX(FRPM_Count_(_K-12_)) FROM frpm)
SELECT COUNT(*) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath > 560 AND s.FundingType = 'Directly funded'
SELECT MAX(AvgScrRead) AS max_avg_read, frpm.FRPM_Count_Ages_5_17 FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode GROUP BY frpm.FRPM_Count_Ages_5_17 ORDER BY max_avg_read DESC LIMIT 1;
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`) AS highest_eligible_free_rate FROM frpm WHERE EXISTS (     SELECT 1     FROM satscores     WHERE frpm.CDSCode = satscores.cds     AND (satscores.NumGE1500 / satscores.NumTstTakr) > 0.3 );
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.rtype = 'SAT' AND sc.NumTstTakr > 0 ORDER BY sc.NumGE1500 / sc.NumTstTakr DESC LIMIT 3;
SELECT s.NCESDist, COUNT(f.`Enrollment (Ages 5-17)`) AS enrollment_count FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode GROUP BY s.NCESDist ORDER BY enrollment_count DESC LIMIT 5;
SELECT AVG(AvgScrRead) AS avg_reading_score, District FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Active' GROUP BY District ORDER BY avg_reading_score DESC LIMIT 1;
SELECT COUNT(*) FROM schools WHERE County = 'Merged Alameda' AND EXISTS (SELECT * FROM satscores WHERE schools.CDSCode = satscores.cds AND NumTstTakr < 100);
SELECT s.CharterNum FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.AvgScrWrite = 499 AND f.rtype = 'charter';
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Contra Costa' AND frpm.IRC = 1 AND satscores.NumTstTakr <= 250;
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12';
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `FRPM Count (K-12)` < 700;
SELECT s.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Contra Costa' GROUP BY s.School ORDER BY COUNT(sc.NumTstTakr) DESC LIMIT 1;
SELECT s.School, s.Street, s.City, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)` > 30;
SELECT s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Percent (%) Eligible Free (K-12)` > 0.1 AND f.NumGE1500 > 0;
SELECT DISTINCT s.School, frpm.`Funding Type` FROM schools s JOIN frpm ON s.CDSCode = frpm.CDSCode JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Riverside' GROUP BY s.School, frpm.`Funding Type` HAVING AVG(sc.AvgScrMath) > 400;
SELECT s.School, s.Street, s.City, s.Zip, s.State FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.District Name = 'Monterey' AND f.`Enrollment (Ages 5-17)` > 800 AND f.`Free Meal Count (Ages 5-17)` > 800 AND s.School Type = 'High Schools (Public)';
SELECT s.School, AVG(ss.AvgScrWrite) AS avg_write_score FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.OpenDate > '1991-01-01' OR s.ClosedDate < '2000-01-01' GROUP BY s.School HAVING s.Phone IS NOT NULL;
SELECT s.School, s.DOCType FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.IRC = 1 AND f.FundingType = 'Locally funded' AND (f.Enrollment (K-12) - f.Enrollment (Ages 5-17)) > (     SELECT AVG(f2.Enrollment (K-12) - f2.Enrollment (Ages 5-17))     FROM frpm f2     JOIN schools s2 ON f2.CDSCode = s2.CDSCode     WHERE f2.IRC = 1 AND f2.FundingType = 'Locally funded' );
SELECT MIN(OpenDate) FROM schools WHERE `School Type` = 'K-12 Schools (Public)' AND Enrollment (K-12) = (SELECT MAX(Enrollment (K-12)) FROM schools WHERE `School Type` = 'K-12 Schools (Public)')
SELECT City, SUM(Enrollment (K-12)) AS Total_Enrollment FROM frpm WHERE Low_grade >= 1 AND High_grade <= 12 GROUP BY City ORDER BY Total_Enrollment ASC LIMIT 5;
SELECT frpm.CDSCode, CAST(frpm.`Free Meal Count (K-12)` AS REAL) / frpm.`Enrollment (K-12)` AS eligible_free_rate FROM frpm WHERE frpm.LowGrade = '1' AND frpm.HighGrade = '12' ORDER BY frpm.`Enrollment (K-12)` DESC LIMIT 10, 11;
SELECT s.School, frpm.`Percent (%) Eligible FRPM (K-12)` AS eligible_rate FROM schools s JOIN frpm ON s.CDSCode = frpm.CDSCode WHERE frpm.`Ownership Code` = 66 AND frpm.`Low Grade` = 'K' AND frpm.`High Grade` = '12' ORDER BY frpm.`FRPM Count (K-12)` DESC LIMIT 5;
SELECT s.School, s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.FreeMealCount BETWEEN 1900 AND 2000 AND f.Ages5to17 = true;
SELECT CAST(`Free Meal Count (Ages 5-17)` AS REAL) / `Enrollment (Ages 5-17)` AS free_rate FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `School Name` = 'Kacey Gibson';
SELECT admemail1 FROM schools WHERE charter = 1 AND cdscode IN (     SELECT CDSCode     FROM frpm     WHERE LowGrade = '1'     AND HighGrade = '12'     ORDER BY Enrollment(K-12) ASC     LIMIT 1 ) 
SELECT s.AdmFName1 || ' ' || s.AdmLName1 AS AdminFullName FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumGE1500 = (SELECT MAX(sc2.NumGE1500) FROM satscores sc2) GROUP BY s.AdmFName1, s.AdmLName1, s.CDSCode ORDER BY COUNT(sc.NumTstTakr) DESC LIMIT 1;
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrRead >= 1500 AND sc.AvgScrMath >= 1500 AND sc.AvgScrWrite >= 1500 ORDER BY (sc.NumGE1500 / sc.NumTstTakr) ASC LIMIT 1;
SELECT s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.County Name = 'Los Angeles' AND f.`Enrollment (K-12)` BETWEEN 2000 AND 3000;
SELECT AVG(NumTstTakr) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' AND schools.County = 'Fresno';
  SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.District = 'Fresno Unified' AND sc.rtype = 'CMAS' GROUP BY s.Phone ORDER BY AVG(sc.AvgScrRead) ASC LIMIT 1;
SELECT s.CDSCode, AVG(ss.AvgScrRead) AS avg_reading_score FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.CDSCode ORDER BY avg_reading_score DESC LIMIT 5;
SELECT DISTINCT s.SchoolType FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
SELECT AVG(AvgScrMath) AS avg_math_score, County FROM satscores JOIN schools ON satscores.cds = schools.CDSCode GROUP BY County ORDER BY AVG(AvgScrMath + AvgScrRead + AvgScrWrite) ASC LIMIT 1;
SELECT AVG(AvgScrWrite) AS avg_writing_score, City FROM satscores WHERE NumTstTakr = (SELECT MAX(NumTstTakr) FROM satscores WHERE NumGE1500 > 0) GROUP BY City ORDER BY avg_writing_score DESC LIMIT 1;
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmLName1 = 'Ricci' AND s.AdmFName1 = 'Ulrich' GROUP BY s.School;
SELECT COUNT(s.CDSCode) AS Enrollees, s.State FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = 31 AND f.`School Type` = 'K-12 Schools (Public)' GROUP BY s.State ORDER BY Enrollees DESC LIMIT 1;
SELECT CAST(COUNT(DISTINCT CASE WHEN YEAR(OpenDate) = 1980 AND DOC = '52' THEN CDSCode END) AS REAL) / 12 FROM schools WHERE YEAR(OpenDate) = 1980 AND DOC = '52';
SELECT COUNT(CASE WHEN s.DOC = '54' AND s.County = 'Orange' THEN 1 END) AS unified_district_count,        COUNT(CASE WHEN s.DOC = '52' AND s.County = 'Orange' THEN 1 END) AS elementary_district_count,        (COUNT(CASE WHEN s.DOC = '54' AND s.County = 'Orange' THEN 1 END) / COUNT(CASE WHEN s.DOC = '52' AND s.County = 'Orange' THEN 1 END)) AS ratio FROM schools s WHERE s.DOC IN ('52', '54') AND s.County = 'Orange';
SELECT DISTINCT County, School FROM schools WHERE StatusType = 'Closed' ORDER BY COUNT(*) DESC, County, School LIMIT 1;
SELECT s.Street, s.City, s.Zip FROM schools s JOIN (   SELECT AVG(Score) AS avg_math, schools.CDSCode   FROM satscores   WHERE rtype = 'M'   GROUP BY schools.CDSCode   ORDER BY avg_math DESC   LIMIT 6 ) sm ON s.CDSCode = sm.CDSCode;
SELECT s.School, s.MailStreet FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.AvgScrRead = (SELECT MIN(AvgScrRead) FROM frpm) ORDER BY s.MailStreet ASC LIMIT 1;
SELECT COUNT(*) FROM satscores WHERE AvgScrRead + AvgScrMath + AvgScrWrite >= 1500 AND MailCity = 'Lakeport';
SELECT COUNT(*) FROM satscores WHERE MailCity = 'Fresno';
SELECT s.CDSCode, s.MailZip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.AdmFName1 = 'Avetik' AND f.AdmLName1 = 'Atoian';
SELECT CAST(COUNT(CASE WHEN schools.MailState = 'CA' AND schools.County = 'Colusa' THEN 1 END) AS REAL) / COUNT(CASE WHEN schools.MailState = 'CA' AND schools.County = 'Humboldt' THEN 1 END) AS ratio FROM schools WHERE schools.MailState = 'CA';
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND District LIKE '%San Joaquin%' AND StatusType = 'Active';
SELECT Phone, Ext FROM schools WHERE CDSCode IN (   SELECT DISTINCT s.CDSCode   FROM schools s   JOIN frpm f ON s.CDSCode = f.CDSCode   JOIN satscores sc ON s.CDSCode = sc.cds   ORDER BY sc.AvgScrWrite DESC   LIMIT 1 OFFSET 332 ) 
SELECT Phone, Ext FROM schools WHERE Zip = '95203-3704';
SELECT s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`School Name` IN(SELECT `School Name` FROM frpm WHERE (`Low Grade` = 'K' AND `High Grade` = '8') AND (`School Name` LIKE '%Mike Larson%' OR `School Name` LIKE '%Dante Alvarez%'))
SELECT s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.Virtual = 'P' AND s.County = 'San Joaquin' AND s.Charter = 1;
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND DOC = 52 AND City = 'Hickman';
SELECT COUNT(*) FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.County = 'Los Angeles' AND schools.Charter = 0 AND frpm.`Percent (%) Eligible Free (K-12)` < 0.18
SELECT s.School, s.City, adm.AdmFName || ' ' || adm.AdmLName AS AdminFullName FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.Charter = 1 AND s.CharterNum = '00D2' AND adm.AdmFName IS NOT NULL AND adm.AdmLName IS NOT NULL AND adm.AdmEmail1 IS NOT NULL ORDER BY s.School, adm.AdmFName, adm.AdmLName;
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';
SELECT CAST(COUNT(CASE WHEN s.CDSCode LIKE '05%' AND cs.FundingType = 'Locally Funded' THEN s.CDSCode END) AS REAL) * 100 / COUNT(s.CDSCode) FROM schools s JOIN frpm cs ON s.CDSCode = cs.CDSCode WHERE s.County = 'Santa Clara' GROUP BY s.County;
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';
I'm sorry, but based on the provided database schema, there is no direct table or information related to "Community College District closures" or any specific dates like "1989" or locations like "San Francisco". The given tables, `frpm`, `satscores`, and `schools`, do not contain data about college district closures, timelines, or geographical details beyond the county level.  If the information about community college district closures is stored in another table or if it can be derived from the available data in a complex manner, please provide additional details or clarify the relationship between the data and the required information.
SELECT County, COUNT(*) AS Num_Closed_Schools FROM schools WHERE SOC = '11' AND SUBSTRING(OpenDate, 1, 4) BETWEEN '1980' AND '1989' AND ClosedDate IS NOT NULL GROUP BY County ORDER BY Num_Closed_Schools DESC LIMIT 1;
SELECT DISTINCT s.NCESDist FROM schools s WHERE s.SOC = '31';
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND StatusType IN ('Active', 'Closed') AND DistrictType = 'Community Day School';
SELECT DistrictCode FROM schools WHERE Magnet = 0 AND City = 'Fresno'
SELECT COUNT(*) FROM frpm WHERE `Academic Year` = '2014-2015' AND `School Name` = 'State Special School' AND `County Name` = 'Fremont' AND `Enrollment (Ages 5-17)` IS NOT NULL;
SELECT SUM(`FRPM Count (Ages 5-17)`) AS Total_FRPM_Count FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.MailStreet LIKE 'PO Box 1040' AND schools.SchoolType = 'Youth Authority School';
SELECT MIN(`Low Grade`) AS lowest_grade FROM frpm WHERE `EdOpsCode` = 'SPECON' AND NCESDist = '613360';
SELECT DISTINCT s.SchoolName, frpm.EducationalOptionType FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE frpm.CountyCode = '37' AND frpm.`Educational Option Type` = 'Breakfast Provision 2';
SELECT City FROM schools WHERE County = 'Merced' AND EILCode = 'HS' AND LowGrade = '9' AND HighGrade = '12' AND `Educational Option Type` = 'Breakfast Provision 2';
SELECT s.School, frpm.`Percent (%) Eligible FRPM (Ages 5-17)` FROM schools s JOIN frpm ON s.CDSCode = frpm.CDSCode WHERE s.County = 'Los Angeles' AND frpm.`Low Grade` = 'K' AND frpm.`High Grade` = '9'
SELECT GSserved, COUNT(*) as count FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY count DESC LIMIT 1;
  SELECT COUNT(*) AS num_schools, County FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY num_schools DESC LIMIT 1;
SELECT s.School, s.Latitude FROM schools s WHERE s.Latitude = (SELECT MAX(Latitude) FROM schools)
SELECT s.City, frpm.LowGrade, s.School FROM schools s JOIN frpm ON s.CDSCode = frpm.CDSCode WHERE s.State = 'CA' GROUP BY s.City ORDER BY MIN(s.Latitude) LIMIT 1;
SELECT s.School, f.LowGrade, f.HighGrade FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY f.Longitude DESC LIMIT 1;
SELECT COUNT(DISTINCT s.CDSCode), COUNT(DISTINCT s.City), s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.GSoffered = 'K-8' AND s.Magnet = 1 GROUP BY s.City HAVING COUNT(DISTINCT f.`Educational Option Type`) > 1 ORDER BY COUNT(DISTINCT s.CDSCode) DESC; 
SELECT s.District, COUNT(*) AS count, SUBSTRING_INDEX(AdmFName1, ' ', 1) AS first_name FROM schools s GROUP BY s.District, SUBSTRING_INDEX(AdmFName1, ' ', 1) ORDER BY s.District, count DESC LIMIT 2;
SELECT s.DistrictCode, frpm.`Percent (%) Eligible Free (K-12)` FROM frpm JOIN schools s ON frpm.CDSCode = s.CDSCode WHERE s.AdmFName1 = 'Alusine';
SELECT s.District, s.County, s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.CharterNumber = '40' AND f.AdminLName1 IS NOT NULL LIMIT 1;
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND SOC = '62' AND DOC = '54';
SELECT s.School, adm.AdmEmail1 FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN (   SELECT cds, COUNT(*) AS num_test_takers_GE1500   FROM satscores   WHERE NumGE1500 > 0   GROUP BY cds   ORDER BY num_test_takers_GE1500 DESC   LIMIT 1 ) top_school ON s.CDSCode = top_school.cds JOIN frpm f ON s.CDSCode = f.CDSCode JOIN (   SELECT CDSCode, MAX(`Percent (%) Eligible FRPM (K-12)`) AS max_frpm_percent   FROM frpm   GROUP BY CDSCode ) frpm_max ON s.CDSCode = frpm_max.CDSCode WHERE f.`Percent (%) Eligible FRPM (K-12)` = frpm_max.max_frpm_percent;
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'East Bohemia' AND a.frequency = 'POPLATEK PO OBRATU';
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague') AND account_id IN (SELECT account_id FROM loan WHERE status = 'Eligible');
SELECT AVG(CASE WHEN date BETWEEN '1995-01-01' AND '1995-12-31' THEN A12 ELSE NULL END) AS avg_unemployment_1995, AVG(CASE WHEN date BETWEEN '1996-01-01' AND '1996-12-31' THEN A13 ELSE NULL END) AS avg_unemployment_1996 FROM district WHERE A12 IS NOT NULL AND A13 IS NOT NULL;
SELECT COUNT(DISTINCT T2.A11) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' AND T2.A11 > 6000 AND T2.A11 < 10000;
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A3 = 'North Bohemia' AND district.A11 > 8000;
SELECT account_id FROM client WHERE gender = 'F' ORDER BY birth_date ASC LIMIT 1 UNION ALL SELECT account_id FROM (   SELECT account_id, AVG(A11) AS avg_salary   FROM district JOIN account ON district.district_id = account.district_id   GROUP BY account.account_id ) AS salary_avg ORDER BY avg_salary ASC LIMIT 1;  WITH lowest_avg_salary AS (   SELECT account_id, AVG(A11) AS avg_salary   FROM district JOIN account ON district.district_id = account.district_id   GROUP BY account.account_id   ORDER BY avg_salary ASC LIMIT 1 ), highest_avg_salary AS (   SELECT account_id, AVG(A11) AS avg_salary   FROM district JOIN account ON district.district_id = account.district_id   GROUP BY account.account_id   ORDER BY avg_salary DESC LIMIT 1 ) SELECT (SELECT avg_salary FROM highest_avg_salary) - (SELECT avg_salary FROM lowest_avg_salary) AS gap;
SELECT account.account_id FROM account JOIN client ON account.account_id = client.client_id WHERE client.birth_date = (SELECT MIN(birth_date) FROM client) AND client.A11 = (SELECT MAX(A11) FROM client);
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND c.type = 'Owner';
SELECT DISTINCT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN trans t ON d.account_id = t.account_id WHERE t.type = 'POPLATEK PO OBRATU';
SELECT account.account_id, account.date, loan.amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.date BETWEEN '1997-01-01' AND '1997-12-31' AND account.frequency = 'POPLATEK TYDNE' GROUP BY account.account_id, account.date, loan.amount ORDER BY loan.amount ASC LIMIT 1;
SELECT a.account_id, a.date FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND a.date BETWEEN '1993-01-01' AND '1993-12-31' GROUP BY a.account_id, a.date ORDER BY MAX(l.amount) DESC LIMIT 1;
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.client_id = a.account_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Slokolov';
SELECT account.account_id, account.date FROM account WHERE account.date = (SELECT MIN(account.date) FROM account WHERE account.date LIKE '1995-%')
SELECT DISTINCT account.account_id FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.date < '1997-01-01' AND trans.amount > 3000;
SELECT client.client_id FROM client JOIN card ON client.client_id = card.client_id WHERE card.issued = '1994-03-03';
SELECT date  FROM account  WHERE account_id = (     SELECT account_id      FROM trans      WHERE operation = 'DEBIT' AND amount = 840 AND date = '1998-10-14' );
SELECT DISTINCT district_id FROM account WHERE date <= '1994-08-25' AND account_id IN (SELECT account_id FROM loan WHERE date = '1994-08-25');
  SELECT MAX(trans.amount) AS biggest_amount FROM trans JOIN card ON trans.account_id = card.account_id JOIN client ON card.client_id = client.client_id WHERE card.issued = '1996-10-21' AND client.district_id = (     SELECT district_id     FROM district     WHERE A8 = 1996 AND A9 = 10 AND A10 = 21 );
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client WHERE district_id = d.district_id) AND d.A11 = (SELECT MAX(A11) FROM district);
SELECT t1.amount FROM trans t1 JOIN account t2 ON t1.account_id = t2.account_id JOIN loan t3 ON t2.account_id = t3.account_id WHERE t3.amount = (SELECT MAX(amount) FROM loan WHERE account_id = t2.account_id) AND t1.date = (SELECT MIN(date) FROM trans WHERE account_id = t2.account_id);
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';
SELECT t.disp_id FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id JOIN disp d ON c.client_id = d.client_id WHERE t.date = '1998-09-02' AND t.amount = 5100 AND t.type = 'WITHDRAWAL';
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date BETWEEN '1996-01-01' AND '1996-12-31';
SELECT A2 FROM district WHERE district_id = (   SELECT district_id FROM client WHERE gender = 'F' AND birth_date = '1976-01-29' );
SELECT birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';
SELECT account.account_id FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Prague' ORDER BY account.date ASC LIMIT 1;
SELECT CAST(COUNT(CASE WHEN client.gender = 'M' THEN client.client_id END) AS REAL) * 100 / COUNT(client.client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A3 = 'Jihočeský kraj' AND district.A4 = (SELECT MAX(district.A4) FROM district WHERE district.A3 = 'Jihočeský kraj');
SELECT ((t2.balance - t1.balance) / t1.balance) * 100 AS increase_rate FROM trans t1 JOIN trans t2 ON t1.account_id = t2.account_id JOIN loan l ON t1.account_id = l.account_id WHERE t1.date = '1993-03-22' AND t2.date = '1998-12-27' AND l.date = '1993-07-05';
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) FROM loan;
SELECT CAST(SUM(CASE WHEN loan.amount < 100000 AND loan.status = 'C' THEN loan.amount ELSE 0 END) AS REAL) * 100 / SUM(loan.amount) FROM loan JOIN account ON loan.account_id = account.account_id;
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date >= '1993-01-01' AND a.date <= '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU' ORDER BY a.account_id;
SELECT account.account_id, account.frequency FROM account JOIN district ON account.district_id = district.district_id WHERE district.A5 = 'East Bohemia' AND account.date BETWEEN '1995-01-01' AND '2000-12-31';
SELECT account.account_id, account.date FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Prachatice';
SELECT A2, A3 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = (SELECT account_id FROM loan WHERE loan_id = '4990'));
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;
SELECT l.loan_id, d.A3, AVG(d.A11) AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60 GROUP BY l.loan_id, d.A3;
SELECT d.A5 AS district, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_percentage FROM district d JOIN client c ON d.district_id = c.district_id JOIN disp disp ON c.client_id = disp.client_id JOIN account acc ON disp.account_id = acc.account_id JOIN loan l ON acc.account_id = l.account_id WHERE l.status = 'D' AND l.date >= 1995 AND l.date < 1997;
SELECT CAST(COUNT(CASE WHEN T1.A2 = 'Decin' AND T2.date BETWEEN '1993-01-01' AND '1993-12-31' THEN T1.account_id END) AS REAL) * 100 / COUNT(T2.account_id) FROM account AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';
SELECT A2, COUNT(*) AS num_female_account_holders FROM account JOIN client ON account.district_id = client.district_id WHERE client.gender = 'F' GROUP BY A2 ORDER BY num_female_account_holders DESC LIMIT 10;
SELECT d.A2, SUM(t.amount) AS total_withdrawals FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.district_id ORDER BY total_withdrawals DESC LIMIT 10;
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'South Bohemia') AND account_id NOT IN (SELECT account_id FROM card);
SELECT A3 FROM district JOIN loan ON district.district_id = loan.account_id WHERE loan.status IN ('C', 'D') GROUP BY A3 ORDER BY COUNT(*) DESC LIMIT 1;
SELECT AVG(amount) AS average_loan_amount FROM loan JOIN client ON loan.account_id = client.client_id WHERE client.gender = 'M'
SELECT A2, A13 FROM district WHERE A13 IS NOT NULL AND YEAR(date) = 1996 ORDER BY A13 DESC;
  SELECT COUNT(DISTINCT account.account_id)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A16 = (SELECT MAX(district.A16) FROM district WHERE year(date) = 1996);
SELECT COUNT(DISTINCT account.account_id) FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND trans.operation = 'VYBER KARTOU' AND trans.balance < 0;
SELECT COUNT(DISTINCT loan.account_id) AS total_loans FROM loan JOIN account ON loan.account_id = account.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND loan.date BETWEEN '1995-01-01' AND '1997-12-31' AND loan.amount >= 250000;
  SELECT COUNT(*)  FROM account  WHERE account_id IN (     SELECT account_id      FROM loan      WHERE status IN ('C', 'D') )  AND EXISTS (     SELECT 1      FROM district      WHERE district.district_id = account.district_id      AND A2 = '1' );
  SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A15 = (     SELECT DISTINCT second_highest_crimes     FROM (         SELECT district_id, COUNT(*) AS num_crimes         FROM district         WHERE A15 IS NOT NULL AND A15 > 0 AND year(A5) = 1995         GROUP BY district_id         ORDER BY num_crimes DESC         LIMIT 1 OFFSET 1     ) AS subquery     WHERE subquery.district_id = d.district_id );
SELECT COUNT(*) FROM card c JOIN disp d ON c.card_id = d.card_id WHERE c.type = 'GOLD' AND d.type = 'DISPONENT';
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek');
SELECT DISTINCT T3.A2 FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.date BETWEEN '1997-01-01' AND '1997-12-31' AND T2.amount > 10000;
SELECT DISTINCT account.account_id FROM account JOIN `order` ON account.account_id = `order`.account_id WHERE `order`.k_symbol = 'SIPO' AND account.district_id = (SELECT district_id FROM district WHERE A5 = 'Pisek');
SELECT DISTINCT account.account_id FROM account JOIN disp ON account.account_id = disp.account_id JOIN card ON disp.card_id = card.card_id WHERE card.type = 'GOLD' AND account.account_id IN (     SELECT account.account_id FROM account     JOIN disp ON account.account_id = disp.account_id     JOIN card ON disp.card_id = card.card_id     WHERE card.type = 'JUNIOR' );
SELECT AVG(amount) AS average_credit_card_amount FROM trans WHERE operation = 'VYBER KARTOU' AND date >= '2021-01-01' AND date < '2022-01-01' GROUP BY MONTH(date);
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id JOIN card c ON a.account_id = c.account_id WHERE t.operation = 'VYBER KARTOU' AND YEAR(t.date) = 1998 GROUP BY a.account_id HAVING AVG(t.amount) < (     SELECT AVG(amount)     FROM trans     WHERE operation = 'VYBER KARTOU'     AND YEAR(date) = 1998 );
SELECT DISTINCT client.client_id, client.gender FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id JOIN account ON disp.account_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE client.gender = 'F';
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.client_id = a.account_id WHERE c.gender = 'F' AND d.A3 = 'South Bohemia';
SELECT DISTINCT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.type = 'OWNER';
SELECT DISTINCT T1.type AS account_type, AVG(T2.A11) AS avg_income FROM account T1 JOIN district T2 ON T1.district_id = T2.district_id WHERE T1.type != 'OWNER' AND T2.A11 > 8000 AND T2.A11 <= 9000 GROUP BY T1.type;
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';
SELECT DISTINCT T2.A2 FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'VYDAJ';
SELECT AVG(A15) FROM district WHERE A3 IN (SELECT A3 FROM district WHERE A15 > 4000) AND district_id IN (SELECT district_id FROM account WHERE date >= '1997-01-01')
SELECT COUNT(*) FROM card c JOIN disp d ON c.card_id = d.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.type = 'classic' AND a.type = 'OWNER';
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha');
SELECT CAST(COUNT(CASE WHEN card.type = 'Gold' AND card.issued < '1998-01-01' THEN 1 END) AS REAL) * 100 / COUNT(card.card_id) FROM card;
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) ORDER BY l.amount DESC LIMIT 1;
  SELECT SUM(A15) AS total_crimes FROM district JOIN account ON district.district_id = account.district_id WHERE account.account_id = 532 AND year(account.date) = 1995;
SELECT district_id FROM account WHERE account_id = (SELECT account_id FROM `order` WHERE order_id = 33333);
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 3356) AND operation = 'VYBER';
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND EXISTS (SELECT 1 FROM loan WHERE account.account_id = loan.account_id AND loan.amount < 200000);
SELECT type FROM card WHERE disp_id IN (SELECT disp_id FROM disp WHERE client_id = 13539);
SELECT A3 FROM district WHERE district_id = (SELECT district_id FROM client WHERE client_id = 3541);
SELECT district_id, COUNT(*) AS num_accounts_with_successful_loans FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'A' GROUP BY district_id ORDER BY num_accounts_with_successful_loans DESC LIMIT 1;
SELECT client.client_id, client.gender, client.birth_date FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN `order` ON account.account_id = `order`.account_id WHERE `order`.order_id = 32423;
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5);
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik');
SELECT DISTINCT client_id FROM card WHERE type = 'junior' AND issued >= '1997-01-01';
SELECT CAST(COUNT(DISTINCT CASE WHEN client.gender = 'F' THEN client.client_id END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN district.A11 > 10000 THEN client.client_id END) FROM client JOIN account ON client.client_id = account.account_id JOIN district ON district.district_id = account.district_id;
SELECT ((SUM(loans_1997.amount) - SUM(loans_1996.amount)) / SUM(loans_1996.amount) * 100) AS growth_rate FROM (   SELECT SUM(amount) AS amount   FROM loan   WHERE account_id IN (     SELECT account_id     FROM account     WHERE date BETWEEN '1996-01-01' AND '1996-12-31'   ) ) AS loans_1996, (   SELECT SUM(amount) AS amount   FROM loan   WHERE account_id IN (     SELECT account_id     FROM account     WHERE date BETWEEN '1997-01-01' AND '1997-12-31'   ) ) AS loans_1997 JOIN client ON loans_1997.account_id = client.client_id WHERE client.gender = 'M'
SELECT COUNT(*) FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE date > '1995-01-01') AND operation = 'VYBER KARTOU';
SELECT (SELECT SUM(A16) FROM district WHERE A3 = 'North Bohemia' AND A11 = 1996) - (SELECT SUM(A16) FROM district WHERE A3 = 'East Bohemia' AND A11 = 1996) AS difference_in_crimes;
  SELECT COUNT(*)  FROM disp  WHERE account_id = 1 AND type IN ('OWNER', 'DISPONENT')  UNION  SELECT COUNT(*)  FROM disp  WHERE account_id = 10 AND type IN ('OWNER', 'DISPONENT');
SELECT COUNT(*) AS statement_requests FROM trans WHERE account_id = 3 AND type = 'STMT';  SELECT SUM(amount) AS total_debit FROM trans WHERE account_id = 3 AND operation = 'DEBIT' AND amount = 3539 AND k_symbol = 'STATEMENT_REQUEST'; 
SELECT YEAR(client.birth_date) AS birth_year FROM client WHERE client.client_id = 130;
SELECT COUNT(DISTINCT account.account_id) FROM account JOIN disp ON account.account_id = disp.account_id WHERE account.frequency = 'POPLATEK PO OBRATU';
SELECT SUM(loan.amount) AS total_debt,         AVG(loan.payments) AS avg_payment_performance FROM loan JOIN account ON loan.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE client.client_id = 992;
SELECT SUM(amount) AS total_sum,         c.gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.account_id = c.client_id WHERE t.trans_id = 851 GROUP BY c.client_id;  -- Explanation: -- The SQL query starts by selecting the sum of the 'amount' column from the 'trans' table, renaming it as 'total_sum'. -- It then joins the 'account' table on the 'account_id' column to link transactions with accounts. -- Next, it further joins the 'client' table on the 'account_id' column to retrieve client information based on the account. -- The WHERE clause filters the rows to only include the transaction with 'trans_id' equal to 851. -- Finally, the query groups the results by 'client_id' to get the sum for each client, and selects the 'gender' column from the 'client' table to determine if the client is a man or a woman.
SELECT type FROM card WHERE client_id = 9;
SELECT SUM(amount) AS total_paid FROM trans WHERE account_id IN (     SELECT account_id     FROM account     WHERE client_id = 617 ) AND YEAR(date) = 1998;
SELECT DISTINCT client.client_id, client.birth_date FROM client JOIN district ON client.district_id = district.district_id JOIN account ON client.client_id = account.account_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.A5 = 'East Bohemia';
SELECT DISTINCT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;
SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'SIPO' AND t.amount > 4000;
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > '1996-01-01';
SELECT COUNT(*) FROM client WHERE gender = 'F' AND client_id IN (SELECT client_id FROM disp WHERE type = 'junior credit')
SELECT CAST(COUNT(DISTINCT CASE WHEN c.gender = 'F' AND d.A3 = 'Prague' THEN c.client_id END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN d.A3 = 'Prague' THEN c.client_id END) FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON c.district_id = d.district_id;
SELECT CAST(COUNT(CASE WHEN c.gender = 'M' AND a.frequency = 'POPLATEK TYDNE' THEN c.client_id END) AS REAL) * 100 / COUNT(CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN a.account_id END) AS percentage_male_weekly FROM account a JOIN client c ON a.account_id = c.client_id;
SELECT COUNT(DISTINCT c.client_id) AS num_clients FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND a.type = 'User';
SELECT account.account_id, account.date FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 24 AND account.date < '1997-01-01' ORDER BY loan.amount ASC LIMIT 1;
SELECT account.account_id FROM account JOIN client ON account.account_id = client.client_id WHERE client.gender = 'F' GROUP BY account.account_id ORDER BY AVG(district.A11) ASC, client.birth_date ASC LIMIT 1;
SELECT COUNT(*) FROM client WHERE birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'East Bohemia');
SELECT COUNT(*) FROM loan WHERE duration = 24 AND status = 'pre-payment' AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK TYDNE');
SELECT AVG(amount) AS avg_loan_amount FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.status IN ('C', 'D') AND a.type = 'POPLATEK PO OBRATU';
SELECT DISTINCT c.client_id, d.district_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'PERMANENT' AND a.type = 'OWNER';
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURRENT_DATE) AS age FROM client c JOIN card ca ON c.client_id = ca.client_id JOIN disp d ON ca.disp_id = d.disp_id JOIN account a ON d.account_id = a.account_id WHERE ca.type = 'gold' AND a.frequency = 'POPLATEK MESICNE' AND d.type = 'CREDİT' AND a.district_id IN (     SELECT district_id     FROM loan l );
SELECT bond_type, COUNT(*) AS count FROM bond GROUP BY bond_type ORDER BY count DESC LIMIT 1;
SELECT COUNT(DISTINCT molecule_id) FROM atom WHERE element = 'cl' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT AVG(CASE WHEN T3.element = 'O' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM molecule T1 JOIN bond T2 ON T1.molecule_id = T2.molecule_id JOIN connected T3 ON T2.bond_id = T3.bond_id WHERE T2.bond_type = '-';
SELECT CAST(SUM(CASE WHEN T2.label = '+' AND T3.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) FROM `atom` AS T1 INNER JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id INNER JOIN `bond` AS T3 ON T2.bond_id = T3.bond_id GROUP BY T2.molecule_id HAVING COUNT(T3.bond_id) = 1;
SELECT COUNT(DISTINCT a.atom_id) AS non_carcinogenic_sodium_atoms FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-'
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '#' AND m.label = '+';
SELECT CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(a.atom_id) FROM `atom` a JOIN `bond` b ON a.molecule_id = b.molecule_id JOIN `connected` c ON a.atom_id = c.atom_id WHERE b.bond_type = '=';
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br';
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';
SELECT molecule_id FROM atom WHERE element = 'si';
SELECT DISTINCT T1.element  FROM atom T1 JOIN connected T2 ON T1.atom_id = T2.atom_id JOIN bond T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR004_8_9'
SELECT DISTINCT T1.element  FROM atom T1 JOIN connected T2 ON T1.atom_id = T2.atom_id JOIN bond T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = ' = ' AND T1.element IN ('c', 'cl', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');
SELECT t2.label, COUNT(t2.label) AS count\_label FROM atom t1 JOIN molecule t2 ON t1.molecule\_id = t2.molecule\_id WHERE t1.element = 'h' GROUP BY t2.label ORDER BY count\_label DESC LIMIT 1;
SELECT DISTINCT T2.bond_type  FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'Te'
SELECT DISTINCT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON a2.atom_id = c2.atom_id2 JOIN bond b ON c.bond_id = b.bond_id AND c2.bond_id = b.bond_id WHERE b.bond_type = '-'
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN molecule m ON m.molecule_id = a1.molecule_id WHERE m.label = '-' AND a1.element <> a2.element;
SELECT element, COUNT(*) AS count\_element FROM atom JOIN molecule ON atom.molecule\_id = molecule.molecule\_id WHERE molecule.label = '-' GROUP BY element ORDER BY count\_element ASC LIMIT 1;
SELECT t3.bond_type FROM connected AS t1 JOIN connected AS t2 ON t1.atom_id2 = t2.atom_id JOIN bond AS t3 ON t2.bond_id = t3.bond_id WHERE t1.atom_id = 'TR004_8' AND t2.atom_id = 'TR004_20';
SELECT DISTINCT m.label FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element != 'sn' AND m.label = '+' UNION SELECT DISTINCT m.label FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element != 'sn' AND m.label = '-'
SELECT COUNT(*) FROM atom WHERE element = 'i' OR element = 's' AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-') GROUP BY molecule_id HAVING COUNT(DISTINCT element) = 2;
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON a1.atom_id = c2.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN bond b2 ON c2.bond_id = b2.bond_id WHERE b.bond_type = '#' AND b2.bond_type = '#';
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON m.molecule_id = c.bond_id OR m.molecule_id = a.molecule_id WHERE m.molecule_id = 'TR181';
SELECT CAST(SUM(CASE WHEN T1.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percent FROM molecule T1 LEFT JOIN atom T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IS NULL;
SELECT CAST(SUM(CASE WHEN T2.label = '+' AND T1.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id
SELECT element, COUNT(*) AS frequency FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY element ASC LIMIT 3;
SELECT DISTINCT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON a1.atom_id = c2.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN connected c3 ON a2.atom_id = c3.atom_id JOIN connected c4 ON a2.atom_id = c4.atom_id2 JOIN bond b2 ON c3.bond_id = b2.bond_id WHERE b.molecule_id = 'TR001' AND b2.molecule_id = 'TR001' AND b.bond_id = 'TR001_2_6';
SELECT difference FROM (SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS positive, SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS negative FROM molecule) AS counts;
SELECT atom_id FROM connected WHERE atom_id2 = 'TR000_5' AND atom_id <> 'TR000_5' AND bond_id = 'TR_000_2_5';
SELECT DISTINCT bond_id FROM connected WHERE atom_id2 = 'TR000_2';
  SELECT DISTINCT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' ORDER BY m.label ASC LIMIT 5;
SELECT CAST(SUM(CASE WHEN bond_type = ' = ' THEN 1 ELSE 0 END) AS REAL) / COUNT(bond_id) * 100 AS percent FROM bond WHERE molecule_id = 'TR008';
SELECT CAST(SUM(CASE WHEN `label` = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`molecule_id`) AS percent FROM `molecule`;
SELECT CAST(SUM(CASE WHEN `element` = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`atom_id`) AS percent FROM `atom` WHERE `molecule_id` = 'TR206'
SELECT DISTINCT bond_type FROM bond WHERE molecule_id = 'TR000';
SELECT element, label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR060';
SELECT b.bond_type, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE m.molecule_id = 'TR018' GROUP BY b.bond_type HAVING COUNT(b.bond_id) = (SELECT MAX(COUNT(b2.bond_id)) FROM bond b2 JOIN connected c2 ON b2.bond_id = c2.bond_id WHERE c2.atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR018') AND c2.atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR018')) ORDER BY COUNT(b.bond_id) DESC LIMIT 1;
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY m.molecule_id ORDER BY m.molecule_id ASC LIMIT 3;
SELECT DISTINCT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.molecule_id = 'TR006' ORDER BY T2.bond_type ASC LIMIT 2;
SELECT COUNT(*)  FROM `connected` c JOIN `bond` b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR009' AND (c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12');
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';
SELECT bond_type, atom_id, atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_6_9';
SELECT m.molecule_id,         CASE             WHEN m.label = '+' THEN 'Carcinogenic'            ELSE 'Not Carcinogenic'        END AS carcinogenic_status FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_10';
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#' ;
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';
SELECT element FROM atom WHERE molecule_id = 'TR004';
SELECT COUNT(*) FROM molecule WHERE label = '-';
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTRING(a.atom_id, 7, 2) BETWEEN 21 AND 25 AND m.label = '+';
SELECT b.bond_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a1.element = 'P' AND a2.element = 'N';
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id GROUP BY m.molecule_id, m.label HAVING COUNT(CASE WHEN b.bond_type = ' = ' THEN 1 END) = (SELECT MAX(num_double_bonds) FROM (SELECT m.molecule_id, COUNT(CASE WHEN b.bond_type = ' = ' THEN 1 END) AS num_double_bonds FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id GROUP BY m.molecule_id) subquery) AND m.label = '+';
SELECT AVG(COUNT(bond_id) / COUNT(atom_id)) FROM atom WHERE element = 'i' GROUP BY molecule_id;
SELECT bond.bond_type, bond.bond_id  FROM connected  JOIN bond ON connected.bond_id = bond.bond_id  JOIN atom ON connected.atom_id2 = atom.atom_id  WHERE atom.atom_id = '45';
SELECT DISTINCT element FROM atom WHERE atom_id NOT IN (SELECT DISTINCT atom_id FROM connected) OR atom_id NOT IN (SELECT DISTINCT atom_id2 FROM connected);
SELECT DISTINCT a1.element  FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN connected c2 ON a1.atom_id = c2.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN bond b2 ON c2.bond_id = b2.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR447' AND b.bond_type = '#' AND b2.bond_type = '#';
SELECT DISTINCT T1.element  FROM atom T1 JOIN connected T2 ON T1.atom_id = T2.atom_id JOIN bond T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR144_8_19';
SELECT m.label, COUNT(b.bond_id) AS num_double_bonds FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = ' = ' GROUP BY m.label ORDER BY num_double_bonds DESC LIMIT 1;
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;
SELECT DISTINCT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a_lead ON b.molecule_id = a_lead.molecule_id AND a_lead.element = 'pb' WHERE a.atom_id != a_lead.atom_id;
SELECT DISTINCT T1.element  FROM atom T1 JOIN connected T2 ON T1.atom_id = T2.atom_id JOIN connected T3 ON T2.atom_id2 = T3.atom_id AND T2.bond_id = T3.bond_id JOIN connected T4 ON T3.atom_id2 = T4.atom_id AND T3.bond_id = T4.bond_id JOIN bond T5 ON T2.bond_id = T5.bond_id WHERE T5.bond_type = '#' AND (T1.element = 'cl' OR T1.element = 'c');
SELECT CAST(COUNT(DISTINCT bond_id) AS REAL) / COUNT(DISTINCT atom_id) FROM atom WHERE atom_id IN (SELECT atom_id FROM atom GROUP BY atom_id, element ORDER BY COUNT(*) DESC LIMIT 1)
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' AND T1.label = '+' THEN 1 ELSE 0 END) AS REAL) / COUNT(T2.bond_id) AS proportion FROM molecule T1 JOIN bond T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'
SELECT COUNT(*) AS total_atoms FROM `atom` WHERE `element` IN('c', 'h');
SELECT atom_id2 FROM atom WHERE element = 's';
SELECT DISTINCT T2.bond_type FROM `atom` AS T1 INNER JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'sn' UNION SELECT DISTINCT T2.bond_type FROM `atom` AS T1 INNER JOIN `connected` AS T2 ON T1.atom_id2 = T2.atom_id WHERE T1.element = 'sn'
SELECT COUNT(DISTINCT element) FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id JOIN connected ON atom.atom_id = connected.atom_id WHERE bond.bond_type = '-' GROUP BY atom.molecule_id HAVING COUNT(*) = 2;
SELECT COUNT(DISTINCT a.atom_id) AS total_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br');
SELECT DISTINCT b.bond_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+';
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) AS percent FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-' GROUP BY      b.molecule_id HAVING      COUNT(DISTINCT b.bond_type) = 1;
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');
SELECT molecule_id FROM molecule WHERE label = '-';
SELECT COUNT(*) AS total_carcinogenic_molecules FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';
SELECT DISTINCT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';
SELECT DISTINCT a.element, a2.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN connected c2 ON a2.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11';
SELECT COUNT(DISTINCT bond_id) FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'i';
SELECT COUNT(*) AS count_carcinogenic, COUNT(*) - COUNT(CASE WHEN `label` = '+' THEN 1 END) AS count_non_carcinogenic FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` WHERE `atom.element` = 'ca' GROUP BY `molecule.molecule_id` HAVING MAX(`label`) = '+';
SELECT COUNT(*) > 0 FROM `connected` c JOIN `atom` a1 ON c.atom_id = a1.atom_id JOIN `atom` a2 ON c.atom_id2 = a2.atom_id JOIN `bond` b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_1_8' AND a1.element = 'cl' AND a2.element = 'c';
SELECT DISTINCT m1.molecule_id, m2.molecule_id FROM molecule m1 JOIN connected c1 ON m1.molecule_id = c1.atom_id JOIN connected c2 ON m1.molecule_id = c2.atom_id2 JOIN connected c3 ON m1.molecule_id = c3.atom_id2 JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c2.atom_id = a2.atom_id JOIN atom a3 ON c3.atom_id = a3.atom_id AND c3.bond_id = c2.bond_id JOIN bond b1 ON c1.bond_id = b1.bond_id JOIN bond b2 ON c2.bond_id = b2.bond_id JOIN bond b3 ON c3.bond_id = b3.bond_id WHERE a1.element = 'c' AND b1.bond_type = '#' AND b2.bond_type = '#' AND b3.bond_type = '#' AND m1.label = '-' AND m2.molecule_id != m1.molecule_id;
SELECT CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(m.molecule_id) AS percentage FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+';
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR001') AND a.molecule_id = 'TR001';
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = ' = ';
SELECT a1.atom_id AS first_atom_id, a2.atom_id AS second_atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#'
SELECT DISTINCT T1.element  FROM atom T1 JOIN connected T2 ON T1.atom_id = T2.atom_id JOIN connected T3 ON T2.atom_id2 = T3.atom_id AND T2.bond_id = T3.bond_id JOIN bond T4 ON T3.bond_id = T4.bond_id WHERE T4.bond_id = 'TR005_16_26' AND T1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');
SELECT COUNT(*) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-'
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_10_11';
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';
SELECT COUNT(*) AS toxicity_count FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND substr(atom_id, 7, 1) = '4' AND (element = 'cl' OR element = 'c' OR element = 'h');
SELECT      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(a.element)) AS ratio,     m.label FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      m.molecule_id = 'TR006' GROUP BY      m.label;
SELECT COUNT(*)  FROM molecule  JOIN atom ON molecule.molecule_id = atom.molecule_id  WHERE atom.element = 'ca' AND molecule.label = '+';
SELECT DISTINCT T2.bond_type  FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN atom AS T4 ON T3.atom_id2 = T4.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'te' AND T4.element = 'te'
SELECT DISTINCT T1.element AS Element1, T3.element AS Element2 FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id = T2.atom_id JOIN `atom` AS T3 ON T1.atom_id2 = T3.atom_id JOIN `bond` AS T4 ON T1.bond_id = T4.bond_id WHERE T4.bond_id = 'TR001_10_11' AND T2.molecule_id = SUBSTR('TR001_10_11', 1, 5) AND T3.molecule_id = SUBSTR('TR001_10_11', 1, 5) AND T2.atom_id LIKE CONCAT(SUBSTR('TR001_10_11', 7, 2), '%') AND T3.atom_id LIKE CONCAT(SUBSTR('TR001_10_11', 10, 2), '%');
SELECT CAST(COUNT(DISTINCT CASE WHEN T.bond_type = '#' THEN T.molecule_id END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) AS percent_triple_bond FROM molecule T2 LEFT JOIN bond T ON T.molecule_id = T2.molecule_id;
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR047'
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1' AND m.label = '+';
SELECT COUNT(*)  FROM molecule  WHERE molecule_id = 'TR151' AND label = '+';
SELECT DISTINCT T1.element  FROM atom T1 JOIN molecule T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR151' AND T1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND T1.element NOT IN ('c', 'h');
SELECT COUNT(*) FROM molecule WHERE label = '+';
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'c';
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');
SELECT DISTINCT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON m.molecule_id = a.molecule_id AND m.label = '+' WHERE b.bond_type = ' = ';
SELECT COUNT(*) FROM atom WHERE element = 'h' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2';
SELECT a.atom_id  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-' EXCEPT SELECT DISTINCT atom_id  FROM connected c JOIN atom a ON c.atom_id2 = a.atom_id WHERE a.element = 'c' AND a.atom_id IN (     SELECT atom_id      FROM connected c1     JOIN atom a1 ON c1.atom_id = a1.atom_id     WHERE a1.element = 'c' AND a1.atom_id IN (         SELECT atom_id          FROM connected c2         JOIN atom a2 ON c2.atom_id2 = a2.atom_id         WHERE a2.element = 'c' AND a2.atom_id IN (             SELECT atom_id              FROM connected c3             JOIN atom a3 ON c3.atom_id = a3.atom_id             WHERE a3.element = 'c'         )     ) );
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T1.molecule_id) AS percentage FROM molecule T1 JOIN atom T2 ON T1.molecule_id = T2.molecule_id
SELECT COUNT(*) FROM molecule WHERE molecule_id = 'TR124' AND label = '+';
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR186';
SELECT bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR007_4' AND c.atom_id2 = 'TR007_19';
SELECT DISTINCT T1.element FROM atom T1 INNER JOIN connected T2 ON T1.atom_id = T2.atom_id INNER JOIN connected T3 ON T2.atom_id2 = T3.atom_id AND T2.bond_id = T3.bond_id WHERE T3.atom_id2 = 'TR001_4' AND T2.bond_id = 'TR001_2';
SELECT COUNT(*) AS double_bonds,  CASE   WHEN label = '+' THEN 'Yes'  ELSE 'No' END AS carcinogenic FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR006' AND bond.bond_type = ' = ';
SELECT m.molecule_id, GROUP_CONCAT(a.element) AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY m.molecule_id;
SELECT b.bond_id, a1.element AS atom1, a2.element AS atom2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-'
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element) AS elements FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '#' AND (a.element = 'cl' OR a.element = 'c' OR a.element = 'h' OR a.element = 'o' OR a.element = 's' OR a.element = 'n' OR a.element = 'p' OR a.element = 'na' OR a.element = 'br' OR a.element = 'f' OR a.element = 'i' OR a.element = 'sn' OR a.element = 'pb' OR a.element = 'te' OR a.element = 'ca') GROUP BY m.molecule_id;
SELECT DISTINCT a1.element AS Element1, a2.element AS Element2 FROM atom a1, atom a2, connected c, bond b WHERE a1.atom_id = c.atom_id AND       a2.atom_id = c.atom_id2 AND       b.bond_id = c.bond_id AND       b.bond_id = 'TR000_2_3';
SELECT COUNT(*) FROM `bond` b JOIN `atom` a ON b.molecule_id = a.molecule_id WHERE a.element = 'cl';
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_types_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE m.molecule_id = 'TR346' GROUP BY a.atom_id;
SELECT COUNT(DISTINCT m.molecule_id) AS total_molecules_with_double_bond,        COUNT(DISTINCT CASE WHEN m.label = '+' THEN m.molecule_id END) AS carcinogenic_molecules_with_double_bond FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = ' = ';
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m LEFT JOIN atom a ON m.molecule_id = a.molecule_id LEFT JOIN connected c ON a.atom_id = c.atom_id WHERE m.molecule_id NOT IN (SELECT DISTINCT m2.molecule_id FROM molecule m2 JOIN atom a2 ON m2.molecule_id = a2.molecule_id WHERE a2.element = 's') AND m.molecule_id NOT IN (SELECT DISTINCT m3.molecule_id FROM molecule m3 JOIN bond b ON m3.molecule_id = b.molecule_id WHERE b.bond_type = ' = ') GROUP BY m.molecule_id;
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+';
  SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '-' ;
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';
SELECT CAST(SUM(CASE WHEN label = '+' AND atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule.molecule_id) AS percentage FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id;
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';
SELECT COUNT(DISTINCT T1.element) AS ElementCount FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR001_3_4';
SELECT T3.bond_type FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE T1.atom_id = 'TR000_1' AND T2.atom_id = 'TR000_2'
SELECT m.molecule_id FROM molecule m JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id AND a2.atom_id = 'TR000_4' WHERE a1.atom_id = 'TR000_2';
SELECT element FROM atom WHERE atom_id = 'TR000_1';
SELECT CASE WHEN m.label = '+' THEN 'Yes' ELSE 'No' END AS "Is_Carcinogenic" FROM molecule m WHERE m.molecule_id = 'TR000';
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond;
SELECT COUNT(*) FROM molecule WHERE molecule_id IN (SELECT DISTINCT molecule_id FROM atom WHERE element = 'n') AND label = '+';
SELECT molecule.molecule_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON atom.molecule_id = bond.molecule_id JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 's' AND bond.bond_type = ' = ';
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5
SELECT DISTINCT T3.element  FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `connected` AS T4 ON T2.bond_id = T4.bond_id JOIN `atom` AS T3 ON T4.atom_id2 = T3.atom_id WHERE T1.molecule_id = 'TR024' AND T2.bond_type = '=';
SELECT m.molecule_id, COUNT(a.atom_id) AS num_atoms FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY num_atoms DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T1.molecule_id) AS percentage FROM molecule T1 JOIN connected T2 ON T1.molecule_id = T2.bond_id JOIN atom T3 ON T2.atom_id = T3.atom_id JOIN atom T4 ON T2.atom_id2 = T4.atom_id WHERE T3.element = 'h' AND T4.element = 'h' AND T2.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+';
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.molecule_id BETWEEN 'TR004' AND 'TR010'  AND b.bond_type = '-' ;
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label <> '-');
SELECT COUNT(DISTINCT molecule_id) FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'o' AND bond.bond_type = ' = ';
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '-'
SELECT DISTINCT a.element, b.bond_type  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id = 'TR016';
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR012' AND a.element = 'c' AND b.bond_type = ' = ';
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id JOIN connected c ON a.atom_id = c.atom_id WHERE m.label = '+' AND a.element = 'O';
SELECT cards.* FROM cards WHERE cards.cardKingdomFoilId = cards.cardKingdomId AND cards.cardKingdomId IS NOT NULL;
SELECT name FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NULL
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards WHERE id = cards.id);
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = 2015;
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';
SELECT DISTINCT legality.status  FROM cards  JOIN legalities AS legality ON cards.uuid = legality.uuid  WHERE cards.types = 'Artifact'  AND cards.side IS NULL  AND legality.format = 'vintage';
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power IN ('*', NULL) AND l.format = 'commander' AND l.status = 'Legal'
SELECT c.name, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;
SELECT text FROM rulings WHERE uuid IN (     SELECT uuid     FROM cards     WHERE name = 'Sublime Epiphany' AND number = '74s' );
SELECT c.name, c.artist, COUNT(r.id) AS ruling_count FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.isPromo = 1 GROUP BY c.uuid ORDER BY ruling_count DESC LIMIT 1;
SELECT DISTINCT language FROM foreign_data WHERE uuid IN (     SELECT uuid     FROM cards     WHERE name = 'Annul' AND number = '29' )
SELECT DISTINCT cards.name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese';
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards;
SELECT s.code, s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';
SELECT COUNT(DISTINCT type) AS card_types_count FROM cards WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(*)  FROM cards  WHERE power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress';
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT DISTINCT language FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Angel of Mercy');
SELECT COUNT(*)  FROM cards  WHERE isTextless = 0  AND uuid IN (     SELECT uuid      FROM legalities      WHERE status = 'restricted' );
SELECT text FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Condemn')
SELECT COUNT(*)  FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE l.status = 'restricted' AND s.isStarter = 1;
SELECT status FROM legalities WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle');
SELECT type FROM cards WHERE name = 'Benalish Knight';
SELECT text FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Benalish Knight') AND format = 'rule'
SELECT DISTINCT artist FROM cards WHERE language = 'Phyrexian';
SELECT CAST(COUNT CASE WHEN borderColor = 'borderless' THEN id END AS REAL) / COUNT(id) * 100 AS percentage_of_borderless_cards FROM cards;
SELECT COUNT(*)  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;
SELECT COUNT(*)  FROM cards  JOIN foreign_data ON cards.uuid = foreign_data.uuid  WHERE cards.borderColor = 'borderless' AND foreign_data.language = 'Russian';
SELECT CAST(COUNT(CASE WHEN language = 'French' AND isStorySpotlight = 1 THEN id END) AS REAL) * 100 / COUNT(CASE WHEN isStorySpotlight = 1 THEN id END) AS percentage FROM cards
SELECT COUNT(*) FROM cards WHERE toughness = '99';
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%flying%';
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%';
SELECT c.id FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a';
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT DISTINCT cards.artist FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.language = 'Chinese Simplified';
SELECT name FROM cards WHERE availability = 'paper' AND language = 'Japanese';
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'Banned' AND cards.borderColor = 'white';
SELECT c.uuid, fd.language FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.format = 'legacy'
SELECT text FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Beacon of Immortality');
SELECT COUNT(c.uuid), GROUP_CONCAT(DISTINCT l.status)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = 'future'  GROUP BY c.uuid;
SELECT name, colors FROM cards WHERE setCode = 'OGW';
SELECT DISTINCT t2.translation, t1.language FROM set_translations t1 JOIN sets t2 ON t1.setCode = t2.code JOIN cards t3 ON t2.setCode = t3.setCode WHERE t3.convertedManaCost = 5 AND t2.code = '10E';
SELECT c.name, r.date  FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';
SELECT DISTINCT cards.colors, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.id BETWEEN 1 AND 20;
SELECT DISTINCT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language IS NOT NULL;
SELECT name FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'uncommon' ORDER BY rulings.date ASC LIMIT 3;
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon'  AND (cardKingdomFoilId IS NOT NULL OR cardKingdomId IS NOT NULL)
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'  AND availability = 'mtgo'  AND hand = -1;
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993'  AND availability = 'paper'  AND hasContentWarning = 1;
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability IN ('paper', 'mtgo')
SELECT SUM(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(cards.manaCost, ' ', numbers.n), ' ', -1) AS REAL)) AS total_unconverted_mana FROM cards JOIN (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) numbers ON CHAR_LENGTH(cards.manaCost) - CHAR_LENGTH(REPLACE(cards.manaCost, ' ', '')) >= numbers.n - 1 WHERE cards.artist = 'Rob Alexander';
SELECT DISTINCT type FROM cards WHERE availability = 'arena';
SELECT DISTINCT sets.setCode  FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Spanish';
SELECT CAST(COUNT(CASE WHEN cards.hand = '+3' AND cards.frameEffects = 'legendary' THEN 1 END) AS REAL) / COUNT(cards.id) * 100 AS percentage FROM cards WHERE cards.frameEffects = 'legendary';
SELECT CAST(SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(c.id) * 100 AS percentage, c.id FROM cards c GROUP BY c.id HAVING c.isStorySpotlight = 1;
SELECT name, (COUNT(*) FILTER (WHERE language = 'Spanish') * 100.0 / COUNT(*)) AS percentage FROM cards GROUP BY name ORDER BY percentage DESC;
SELECT DISTINCT language FROM set_translations WHERE setCode IN (     SELECT code     FROM sets     WHERE baseSetSize = 309 );
SELECT COUNT(*)  FROM set_translations  WHERE language = 'Portuguese (Brasil)' AND setCode IN (     SELECT code      FROM sets      WHERE block = 'Commander' );
SELECT cards.* FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.type = 'Creature' AND legalities.status = 'legal';
SELECT DISTINCT T2.translation  FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode JOIN cards AS T3 ON T1.id = T3.setCode WHERE T2.language = 'German' AND (T3.subtypes IS NOT NULL AND T3.supertypes IS NOT NULL)
SELECT COUNT(*)  FROM cards  WHERE power IS NULL OR power = '*'  AND text LIKE '%triggered ability%';
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.uuid JOIN sets s ON c.setCode = s.code WHERE s.format = 'pre-modern' AND r.text = 'This is a triggered mana ability' AND c.side IS NULL;
SELECT cards.id FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN sets ON cards.setCode = sets.code WHERE cards.artist = 'Erica Yang' AND legalities.format = 'Pauper' AND cards.availability = 'paper';
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.text = 'Das perfekte Gegenmittel zu einer dichten Formation';
SELECT t2.name AS foreign_name FROM cards t1 JOIN foreign_data t2 ON t1.uuid = t2.uuid WHERE t1.artist = 'Matthew D. Wilson' AND t2.language = 'French' AND t1.layout = 'normal' AND t1.borderColor = 'black' AND t1.type = 'Creature';
SELECT COUNT(*)  FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2009-01-10'
SELECT DISTINCT language FROM set_translations WHERE setCode IN (     SELECT code     FROM sets     WHERE block = 'Ravnica'     AND baseSetSize = 180 );
SELECT CAST(COUNT(CASE WHEN `format` = 'commander' AND `status` = 'legal' AND `hasContentWarning` = 0 THEN 1 END) AS REAL) / COUNT(`id`) * 100 FROM `cards` WHERE `format` = 'commander' AND `status` = 'legal';
SELECT CAST(COUNT(CASE WHEN language = 'French' AND power IS NULL OR power = '*' THEN 1 END) AS REAL) / COUNT(CASE WHEN power IS NULL OR power = '*' THEN 1 END) * 100 AS percentage FROM cards;
SELECT CAST(COUNT(CASE WHEN language = 'Japanese' AND type = 'expansion' THEN 1 END) AS REAL) * 100 / COUNT(language) FROM sets WHERE language = 'Japanese';
SELECT availability FROM cards WHERE artist = 'Daren Bader';
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1  AND isReprint = 1  AND isPromo = 1;
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arena league' ORDER BY name ASC LIMIT 3;
SELECT language FROM foreign_data WHERE multiverseid = 149934;
SELECT c1.id AS foil_card_id, c2.id AS regular_card_id FROM cards c1 JOIN cards c2 ON c1.multiverseId = c2.multiverseId WHERE c1.cardKingdomFoilId IS NOT NULL AND c1.cardKingdomId IS NOT NULL AND c2.cardKingdomFoilId IS NOT NULL AND c2.cardKingdomId IS NOT NULL GROUP BY c1.multiverseId ORDER BY c1.cardKingdomFoilId ASC LIMIT 3;
SELECT CAST(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) AS REAL) / COUNT(isTextless) * 100 AS proportion FROM cards;
SELECT DISTINCT cards.number FROM cards WHERE cards.subtypes LIKE '%Angel%' AND cards.subtypes LIKE '%Wizard%' AND cards.side IS NULL;
SELECT sets.name FROM sets WHERE sets.mtgoCode IS NULL OR sets.mtgoCode = '' ORDER BY sets.name ASC LIMIT 3;
SELECT DISTINCT language FROM set_translations WHERE setCode = 'ARC' AND translation = 'Archenemy';
SELECT sets.name, set_translations.translation  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.id = 5;
SELECT language, type FROM sets WHERE id = 206;
SELECT s.id, s.code FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.code ASC LIMIT 2;
SELECT sets.id FROM sets JOIN foreign_data ON sets.code = foreign_data.uuid WHERE sets.isForeignOnly = 1 AND sets.isFoilOnly = 1 AND foreign_data.language = 'Japanese';
SELECT s.code  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Russian'  GROUP BY s.code  ORDER BY s.baseSetSize DESC  LIMIT 1;
SELECT CAST(COUNT(CASE WHEN language = 'Chinese Simplified' AND isOnlineOnly = 1 THEN 1 END) AS REAL) / COUNT(isOnlineOnly) * 100 AS percentage FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.isOnlineOnly = 1
SELECT COUNT(*)  FROM sets  WHERE language = 'Japanese'  AND (mtgoCode IS NULL OR mtgoCode = '');
SELECT COUNT(*) AS count, cards.id AS card_id FROM cards WHERE borderColor = 'black';
SELECT COUNT(*) AS count, cards.id FROM cards WHERE cards.frameEffects = 'extendedart';
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT t2.language  FROM sets AS t1  JOIN set_translations AS t2 ON t1.code = t2.setCode  WHERE t1.id = 174;
SELECT name FROM sets WHERE code = 'ALL';
SELECT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'A Pedra Fellwar')
SELECT DISTINCT sets.code  FROM sets  WHERE sets.releaseDate = '2007-07-13';
SELECT s.baseSetSize, s.code  FROM sets s  WHERE s.block = 'Masques' OR s.block = 'Mirage';
SELECT setCode FROM sets WHERE type = 'expansion';
SELECT t2.name AS foreign_name, t1.type FROM cards t1 JOIN foreign_data t2 ON t1.uuid = t2.uuid WHERE t1.watermark = 'Boros'
SELECT T2.language, T2.flavorText, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie';
SELECT CAST(COUNT(CASE WHEN cards.convertedManaCost = 16 AND cards.setCode = 'Abyssal Horror' THEN 1 END) AS REAL) / COUNT(cards.convertedManaCost) * 100 AS percentage FROM cards WHERE cards.setCode = 'Abyssal Horror';
SELECT setCode FROM sets WHERE type = 'expansion commander';
SELECT t2.name AS foreign_name, t1.type FROM cards AS t1 JOIN foreign_data AS t2 ON t1.uuid = t2.uuid WHERE t1.watermark = 'Abzan' AND t2.language != 'en'
SELECT T2.language, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Azorius'
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'  AND cardKingdomFoilId = cardKingdomId  AND cardKingdomId IS NOT NULL;
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%' AND hand = '+%';
SELECT name FROM cards WHERE isTextless = 0;
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'  AND (power = '*' OR power IS NULL);
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'  AND availability LIKE '%arena,mtgo%'
SELECT name FROM cards WHERE convertedManaCost > (     SELECT convertedManaCost     FROM cards     WHERE name = 'Serra Angel' ) AND name = 'Shrine Keeper'
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;
SELECT translation FROM set_translations WHERE language = 'Italian' AND setCode IN (SELECT code FROM sets WHERE name = 'Ancestor''s Chosen');
SELECT COUNT(*)  FROM set_translations  WHERE translation = 'Angel of Mercy';
SELECT cards.name FROM cards JOIN sets ON cards.setCode = sets.code JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition';
SELECT COUNT(*)  FROM cards c JOIN set_translations st ON c.uuid = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Korean';
SELECT COUNT(*)  FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex';
SELECT COUNT(*)  FROM sets  WHERE translation = 'Hauptset Zehnte Edition' AND baseSetSize IS NOT NULL;
SELECT translation  FROM set_translations  WHERE language = 'Simplified Chinese'  AND setCode = '8ED';
SELECT COUNT(*)  FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;
SELECT releaseDate FROM sets WHERE name = 'Ancestor''s Chosen';
SELECT type FROM sets WHERE code = (SELECT translation FROM set_translations WHERE setCode = 'Hauptset Zehnte Edition' AND language = 'German');
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian';
SELECT COUNT(*)  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Adarkar Valkyrie'  AND s.isForeignOnly = 1;
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Italian'  AND set_translations.translation IS NOT NULL  AND sets.baseSetSize < 10;
SELECT COUNT(*)  FROM cards  WHERE sets.code = 'Coldsnap' AND borderColor = 'black';
SELECT name FROM cards WHERE setCode = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1;
SELECT DISTINCT cards.artist  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');
SELECT cards.* FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND cards.number = 4;
SELECT COUNT(*)  FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND uuid IN (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen');
SELECT DISTINCT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen') AND flavorText IS NOT NULL;
SELECT t2.translation  FROM set_translations t2  JOIN sets t1 ON t2.setCode = t1.code  JOIN cards t0 ON t1.id = t0.setCode  WHERE t0.name = 'Ancestor''s Chosen' AND t2.language = 'German';
SELECT text FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.language = 'Italian';
SELECT t2.translation FROM sets AS t1 JOIN set_translations AS t2 ON t1.code = t2.setCode JOIN cards AS t3 ON t1.id = t3.setCode WHERE t1.name = 'Coldsnap' AND t2.language = 'Italian' ORDER BY t3.convertedManaCost DESC LIMIT 1;
SELECT date FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Reminisce');
SELECT CAST(SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(cards.convertedManaCost)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN cards.cardKingdomFoilId = cards.cardKingdomId AND cards.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / SUM(cards.name = 'Coldsnap') * 100 AS percentage_powerful_cards FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap';
SELECT code FROM sets WHERE releaseDate = '2017-07-14';
SELECT keyruneCode FROM sets WHERE code = 'PKHC';
SELECT mcmId FROM sets WHERE code = 'SS2';
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';
SELECT type FROM sets WHERE name = 'From the Vault: Lore';
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';
SELECT c.name, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 1;
SELECT releaseDate  FROM sets  WHERE code IN (     SELECT setCode      FROM cards      WHERE name = 'Evacuation' );
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Rinascita di Alara' AND sets.baseSetSize IS NOT NULL;
SELECT type FROM sets WHERE code = (SELECT translation FROM set_translations WHERE setCode = 'Huitième édition' AND language = 'fr');
SELECT t2.translation  FROM sets AS t1  JOIN set_translations AS t2 ON t1.code = t2.setCode  WHERE t2.language = 'French'  AND t1.code IN (     SELECT DISTINCT setCode      FROM cards      WHERE name = 'Tendo Ice Bridge' );
SELECT COUNT(*)  FROM set_translations  WHERE translation IS NOT NULL AND setCode = 'Salvat 2011';
SELECT T2.translation  FROM sets AS T1  INNER JOIN set_translations AS T2 ON T1.code = T2.setCode  WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese';
SELECT name FROM cards WHERE setCode = 'Journey into Nyx Hero''s Path' ORDER BY convertedManaCost DESC LIMIT 1;
SELECT releaseDate FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Ola de frío';
SELECT T2.type  FROM cards AS T1  INNER JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T1.name = 'Samite Pilgrim';
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setCode = 'Mirrodin';
SELECT CAST(SUM(CASE WHEN language = 'Japanese' AND isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(language = 'Japanese') FROM cards JOIN set_translations ON cards.uuid = set_translations.uuid WHERE set_translations.translation = 'Japanese';
SELECT CAST(SUM(CASE WHEN cards.language = 'Portuguese (Brazil)' AND sets.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(cards.language = 'Portuguese (Brazil)') FROM cards JOIN sets ON cards.setCode = sets.code JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Portuguese (Brazil)'
SELECT DISTINCT availability  FROM cards  WHERE artist != 'Aleksi Briclot' AND isTextless = 1;
SELECT s.id FROM sets s WHERE s.baseSetSize = (SELECT MAX(baseSetSize) FROM sets)
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL)
SELECT frameEffects, COUNT(*) AS count FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY count DESC LIMIT 1;
SELECT COUNT(*)  FROM cards  WHERE duelDeck = 'a'  AND (power IS NULL OR power = '*')  AND hasFoil = 0;
SELECT s.id  FROM sets s WHERE s.type = 'commander' AND s.code NOT LIKE '%alchemy%' ORDER BY s.totalSetSize DESC LIMIT 1;
SELECT name FROM cards WHERE format = 'duel' GROUP BY name ORDER BY MAX(manaCost) DESC LIMIT 10;
SELECT MIN(originalReleaseDate), cards.name, GROUP_CONCAT(DISTINCT legality.format) AS legal_formats FROM cards JOIN legalities AS legality ON cards.uuid = legality.uuid WHERE cards.rarity = 'mythic' GROUP BY cards.uuid ORDER BY MIN(originalReleaseDate) ASC LIMIT 1;
SELECT COUNT(*)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.artist = 'Volkan Baga' AND fd.language = 'French';
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  JOIN sets s ON c.setCode = s.code  WHERE c.rarity = 'rare'  AND c.types LIKE '%Enchantment%'  AND c.name = 'Abundance'  AND l.status = 'Legal'  AND s.releaseDate IS NOT NULL;
SELECT t1.format, t2.name FROM legalities t1 JOIN cards t2 ON t1.uuid = t2.uuid WHERE t1.status = 'banned' GROUP BY t1.format ORDER BY COUNT(*) DESC LIMIT 1;
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond');
SELECT s.format FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON st.setCode = s.code WHERE c.artist = (SELECT MIN(artist) FROM cards) GROUP BY s.format;
SELECT status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  JOIN artists a ON c.artist = a.name  WHERE c.frameVersion = '1997'  AND a.name = 'D. Alexander Gregory'  AND c.hasContentWarning = 1  AND l.format = 'legacy'
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'banned'
SELECT AVG(id) AS annual_avg_sets, MAX(COUNT(DISTINCT language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(releaseDate);
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';
SELECT uuid FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'oldschool' AND legalities.status IN ('banned', 'restricted');
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';
SELECT text  FROM rulings  WHERE uuid IN (     SELECT uuid      FROM cards      WHERE artist = 'Kev Walker' )  ORDER BY MAX(date) DESC;
SELECT DISTINCT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'legal';
SELECT DISTINCT sets.name  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.language = 'Korean'  AND sets.code NOT IN (     SELECT set_code      FROM set_translations      WHERE language LIKE '%Japanese%' )
SELECT DISTINCT frameVersion, name  FROM cards  WHERE artist = 'Allen Williams';  SELECT *  FROM cards  WHERE artist = 'Allen Williams' AND status = 'banned';
SELECT     CASE         WHEN u1.DisplayName = 'Harlan' THEN u2.DisplayName         WHEN u2.DisplayName = 'Harlan' THEN u1.DisplayName     END AS HigherReputationUser,     MAX(CASE             WHEN u1.DisplayName = 'Harlan' THEN u1.Reputation             WHEN u2.DisplayName = 'Harlan' THEN u2.Reputation         END) AS HigherReputation FROM     users u1 JOIN     users u2 ON u1.Id <> u2.Id WHERE     u1.DisplayName IN ('Harlan', 'Jarrod Dixon')     AND u2.DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY     CASE         WHEN u1.DisplayName = 'Harlan' THEN u2.DisplayName         WHEN u2.DisplayName = 'Harlan' THEN u1.DisplayName     END;
SELECT Users.DisplayName FROM Users WHERE YEAR(Users.CreationDate) = 2014;
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'
SELECT u.DisplayName FROM users u ORDER BY u.Views DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;
SELECT COUNT(*) FROM users WHERE Views > 10 AND EXTRACT(YEAR FROM CreationDate) > 2013;
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (     SELECT Id      FROM users      WHERE DisplayName = 'csgillespie' );
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';
  SELECT Title  FROM posts  WHERE OwnerUserId = (     SELECT Id      FROM users      WHERE DisplayName = 'csgillespie' )  ORDER BY ViewCount DESC  LIMIT 1;
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT SUM(c.CommentCount) FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN comments c ON p.Id = c.PostId WHERE u.DisplayName = 'csgillespie';
  SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.Id = (     SELECT PostId     FROM posts     WHERE OwnerUserId = u.Id     ORDER BY AnswerCount DESC     LIMIT 1 )
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (     SELECT Id      FROM users      WHERE DisplayName = 'csgillespie' ) AND ParentId IS NULL;
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (     SELECT Id      FROM users      WHERE Age > 65 )  AND Score >= 20;
SELECT u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts';
SELECT p.Body FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id WHERE t.TagName = 'bayesian';
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags)
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT COUNT(*)  FROM badges  WHERE UserId IN (     SELECT Id      FROM users      WHERE DisplayName = 'csgillespie' )  AND YEAR(Date) = 2011;
SELECT u.DisplayName FROM users u JOIN (   SELECT UserId, COUNT(*) AS NumBadges   FROM badges   GROUP BY UserId   ORDER BY NumBadges DESC   LIMIT 1 ) b ON u.Id = b.UserId;
SELECT AVG(T2.Score) AS AverageScore FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(u.DisplayName) AS avg_badges FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200
SELECT CAST(COUNT(CASE WHEN users.Age > 65 THEN posts.Id END) AS REAL) * 100 / COUNT(posts.Id) AS percentage FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Score > 20
SELECT COUNT(*)  FROM votes  WHERE UserId = 58 AND CreationDate = '2010-07-19';
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(score) FROM comments)
SELECT COUNT(*)  FROM comments  WHERE PostId = (     SELECT Id      FROM posts      WHERE ViewCount = 1910 );
  SELECT posts.FavoriteCount  FROM posts  JOIN comments ON posts.Id = comments.PostId  WHERE comments.UserId = 3025 AND comments.CreationDate = '2014-04-23 20:29:39.0'
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1;
SELECT p.Title  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NULL;
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (     SELECT Id      FROM users      WHERE DisplayName = 'Tiago Pasqualini' );
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.Id = 6347;
SELECT COUNT(*)  FROM votes JOIN posts ON votes.PostId = posts.Id WHERE posts.Title LIKE '%data visualization%'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS PostToVoteRatio FROM posts JOIN votes ON posts.OwnerUserId = votes.UserId WHERE posts.OwnerUserId = 24;
SELECT SUM(ViewCount) AS TotalViews FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';
SELECT Text FROM comments WHERE Score = 17;
SELECT u.DisplayName FROM users u WHERE u.WebsiteUrl = 'http://stackoverflow.com';
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'thank you user93';
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion';
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?' ;
SELECT c.Text AS Comment FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data';
SELECT Title FROM posts WHERE LastEditorUserId = (SELECT Id FROM users WHERE DisplayName = 'Vebjorn Ljosa');
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny';
SELECT c.Id, c.Text FROM comments c JOIN postHistory ph ON c.PostId = ph.PostId WHERE ph.Comment IS NOT NULL AND ph.UserDisplayName IN (     SELECT u.DisplayName     FROM users u     JOIN postHistory ph ON u.Id = ph.UserId     WHERE ph.PostId = (         SELECT p.Id         FROM posts p         WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'     ) );
SELECT SUM(Vote.BountyAmount) AS TotalBountyAmount FROM posts P JOIN votes Vote ON P.Id = Vote.PostId WHERE P.Title LIKE '%data%'
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'
SELECT p.Title, c.Text AS Comment, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN comments c ON p.Id = c.PostId WHERE t.TagName = 'humor' GROUP BY p.Id, c.Text, p.Title;
SELECT COUNT(*)  FROM comments  WHERE UserId = 13;
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1;
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011;
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Count(Name) > 5;
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b1 ON u.Id = b1.UserId AND b1.Name = 'Teacher' JOIN badges b2 ON u.Id = b2.UserId AND b2.Name = 'Supporter' WHERE u.Location = 'New York';
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;
SELECT u.UserId FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId GROUP BY u.UserId HAVING COUNT(DISTINCT p.Id) = 1 AND SUM(p.ViewCount) >= 1000;
SELECT u.DisplayName, b.Name FROM users u JOIN badges b ON u.Id = b.UserId JOIN (     SELECT UserId, COUNT(*) AS CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON u.Id = c.UserId;
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher';
SELECT ((COUNT(CASE WHEN YEAR(`Date`) = 2010 THEN `Name` END) / COUNT(`Name`)) * 100 - ((COUNT(CASE WHEN YEAR(`Date`) = 2011 THEN `Name` END) / COUNT(`Name`)) * 100) AS percentage_difference FROM `badges` WHERE `Name` = 'Student'
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;
SELECT p.Id, p.Title, p.ViewCount AS Popularity FROM posts p INNER JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;
SELECT Score, linkTypeID  FROM posts  INNER JOIN postLinks ON posts.Id = postLinks.PostId  WHERE posts.Id = 395;
SELECT posts.Id AS PostID, users.Id AS CreatorUserId FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Score > 60;
SELECT SUM(FavoriteCount)  FROM posts  WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011 
SELECT AVG(UpVotes) AS avg_upvotes, AVG(Age) AS avg_age FROM users WHERE Id IN (SELECT OwnerUserId FROM posts GROUP BY OwnerUserId HAVING COUNT(*) > 10);
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08'
SELECT COUNT(*) FROM comments WHERE Score > 60;
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0';
SELECT COUNT(*) FROM posts WHERE Score = 10;
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';
SELECT b.Date  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';
SELECT CAST(COUNT(DISTINCT badges.UserId) AS REAL) * 100 / COUNT(DISTINCT users.Id) AS percentage FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Teacher';
SELECT CAST(COUNT(CASE WHEN users.Age BETWEEN 13 AND 18 THEN users.Id END) AS REAL) * 100 / COUNT(users.Id) AS percentage FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Organizer';
SELECT AVG(Score) AS CommentRatingScore FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0';
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria'
SELECT COUNT(*) FROM users JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Supporter' AND users.Age BETWEEN 19 AND 65;
SELECT COUNT(u.Views) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York';
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT CAST(COUNT(CASE WHEN YEAR(v.CreationDate) = 2010 THEN v.Id END) AS REAL) / COUNT(CASE WHEN YEAR(v.CreationDate) = 2011 THEN v.Id END) AS vote_ratio FROM votes v;
SELECT t1.TagName FROM tags t1 JOIN posts t2 ON t1.ExcerptPostId = t2.Id JOIN users t3 ON t2.OwnerUserId = t3.Id WHERE t3.DisplayName = 'John Stauffer';
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo');
SELECT COUNT(*)  FROM votes WHERE UserId IN (     SELECT Id      FROM users     WHERE DisplayName = 'Harlan' );
SELECT p.Id AS PostID FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;
SELECT      p1.Title AS 'Post Title by Harvey Motulsky',     SUM(p1.ViewCount) AS 'View Count Harvey Motulsky',     p2.Title AS 'Post Title by Noah Snyder',     SUM(p2.ViewCount) AS 'View Count Noah Snyder' FROM      posts p1 JOIN      users u1 ON p1.OwnerUserId = u1.Id JOIN      posts p2 JOIN      users u2 ON p2.OwnerUserId = u2.Id WHERE      u1.DisplayName = 'Harvey Motulsky'     AND u2.DisplayName = 'Noah Snyder' GROUP BY      p1.Title, p2.Title HAVING      MAX(SUM(p1.ViewCount)) > MAX(SUM(p2.ViewCount));
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.VoteCount > 4;
  SELECT COUNT(*)  FROM comments  WHERE Score < 60 AND UserDisplayName = 'Neil McGuigan'  AND PostId IN (     SELECT Id      FROM posts      WHERE OwnerUserId = (         SELECT Id          FROM users          WHERE DisplayName = 'Neil McGuigan'     ) );
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id OR t.WikiPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';
SELECT CAST(COUNT(CASE WHEN posts.Tags LIKE '%r%' AND posts.OwnerDisplayName = 'Community' THEN posts.Id END) AS REAL) * 100 / COUNT(CASE WHEN posts.OwnerDisplayName = 'Community' THEN posts.Id END) AS percentage FROM posts;
SELECT      SUM(CASE WHEN users.DisplayName = 'Mornington' THEN posts.ViewCount ELSE 0 END) -      SUM(CASE WHEN users.DisplayName = 'Amos' THEN posts.ViewCount ELSE 0 END) AS ViewCountDifference FROM      posts JOIN      users ON posts.OwnerUserId = users.Id;
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND year(Date) = 2014;
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';
SELECT u.DisplayName, u.Age FROM users u WHERE u.Views = (SELECT MAX(Views) FROM users)
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60;
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011;
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;
SELECT COUNT(*) AS HistoryCount, MAX(LastEditDate) AS LatestEditDate FROM postHistory WHERE PostId IN (     SELECT Id     FROM posts     WHERE Title = 'What is the best introductory Bayesian statistics textbook?' );
SELECT u.DisplayName, u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outlier'
SELECT p.Title AS RelatedPostTitle FROM posts p JOIN postLinks pl ON p.Id = pl.PostId JOIN posts related_p ON pl.RelatedPostId = related_p.Id WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time';
SELECT p.Id AS PostID, b.Name AS BadgeName FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.UserDisplayName = 'Samuel' AND YEAR(p.CreationDate) = 2013 AND YEAR(b.Date) = 2013;
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)
SELECT u.DisplayName, u.Location FROM users u JOIN tags t ON u.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';
SELECT T2.Title, T1.LinkTypeId FROM postLinks AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'What are principal component scores?'
SELECT p.ParentId, u.DisplayName AS ParentDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ParentId IS NOT NULL AND p.Score = (     SELECT MAX(c.Score)     FROM posts c     WHERE c.ParentId = p.ParentId ) 
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8);
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT u.Age FROM users u WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50;
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;
SELECT p.Score FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags)
SELECT CAST(COUNT(DISTINCT CASE WHEN YEAR(p.CreationDate) = 2010 AND p.AnswerCount <= 2 THEN pl.Id END) AS REAL) / 12 AS AverageMonthlyLinks FROM posts p JOIN postLinks pl ON p.Id = pl.PostId;
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 GROUP BY p.Id ORDER BY MAX(p.FavoriteCount) DESC LIMIT 1;
  SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks)
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1;
SELECT MIN(v.CreationDate) AS FirstVoteDate FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl'
SELECT MIN(p.CreaionDate) AS FirstPostDate FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users);
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' AND b.Date = (SELECT MIN(Date) FROM badges WHERE Name = 'Autobiographer')
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;
SELECT AVG(v.PostId) AS avg_posts_voted_oldest_users FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users);
SELECT u.DisplayName FROM users u WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;
SELECT u.DisplayName FROM users u WHERE u.Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010;
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts) AND p.OwnerUserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'Owner's Name')
SELECT AVG(`Score`) AS AverageScore FROM `posts` JOIN `users` ON `posts.OwnerUserId` = `users.Id` WHERE `users.DisplayName` = 'Stephen Turner' ;
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 AND p.FavoriteCount = (SELECT MAX(FavoriteCount)                        FROM posts                        WHERE YEAR(CreationDate) = 2010);
SELECT CAST(COUNT(CASE WHEN posts.CreationDate = '2011' AND users.Reputation > 1000 THEN posts.Id END) AS REAL) / COUNT(posts.Id) * 100 AS percentage FROM posts JOIN users ON posts.OwnerUserId = users.Id;
SELECT CAST(COUNT(CASE WHEN users.Age BETWEEN 13 AND 18 THEN users.Id END) AS REAL) / COUNT(users.Id) * 100 AS percentage FROM users;
SELECT SUM(T2.Views) AS TotalViews, T3.DisplayName AS LastPosterName FROM posts T1 JOIN users T3 ON T1.LastEditorUserId = T3.Id JOIN (     SELECT PostId, MAX(LastActivityDate) AS MaxLastActivityDate     FROM posts     GROUP BY PostId ) T4 ON T1.Id = T4.PostId AND T1.LastActivityDate = T4.MaxLastActivityDate JOIN tags T5 ON T1.Id = T5.ExcerptPostId WHERE T1.Title = 'Computer Game Datasets' AND T5.TagName = 'views' GROUP BY T3.DisplayName;
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);
  SELECT COUNT(*)  FROM comments  WHERE PostId = (SELECT PostId FROM posts WHERE Score = (SELECT MAX(Score) FROM posts))
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
SELECT   (SELECT     badges.Date   FROM     badges   JOIN     users ON badges.UserId = users.Id   WHERE     users.DisplayName = 'Zolomon'   ORDER BY     badges.Date ASC   LIMIT 1) -   (SELECT     users.CreationDate   FROM     users   WHERE     users.DisplayName = 'Zolomon') AS TimeToBadge;
  SELECT COUNT(p.Id) AS PostCount, COUNT(c.Id) AS CommentCount FROM posts p LEFT JOIN comments c ON p.OwnerUserId = c.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users)
SELECT c.Text, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' AND c.CreationDate = (SELECT MAX(CreationDate) FROM comments WHERE PostId = p.Id);
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol';
SELECT COUNT(*) FROM posts JOIN tags ON posts.Id = tags.ExcerptPostId WHERE tags.TagName = 'careers' OR tags.TagName = 'careers';
SELECT u.Reputation, u.Views FROM users u WHERE u.DisplayName = 'Jarrod Dixon';
SELECT COUNT(c.Id) AS CommentCount, COUNT(p.Id) AS AnswerCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Clustering 1D data' AND (c.UserId IS NOT NULL OR p.OwnerUserId IS NOT NULL);
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;
SELECT CAST(COUNT(CASE WHEN posts.Score >= 50 THEN posts.Id END) AS REAL) * 100 / COUNT(posts.Id) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20;
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)' ;
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE Title = 'How can I adapt ANOVA for binary data?')
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 GROUP BY c.Text ORDER BY MAX(c.Score) DESC LIMIT 1;
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.UserDisplayName LIKE '%http://%'
SELECT COUNT(DISTINCT c.PostId) FROM comments c WHERE c.Score = 0 AND c.PostId IN (     SELECT p.Id     FROM posts p     WHERE p.ViewCount < 5 );
SELECT COUNT(*) FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0;
SELECT COUNT(DISTINCT u.Id)  FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score = 0 AND u.Age = 40;
SELECT p.Id AS PostID, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';
  SELECT UpVotes  FROM users  WHERE Id = (     SELECT UserId      FROM comments      WHERE Text = 'R is also lazy evaluated.' );
SELECT Text FROM comments WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky');
SELECT u.UserDisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND c.DownVotes = 0
SELECT CAST(COUNT(CASE WHEN c.UpVotes = 0 AND c.Score BETWEEN 5 AND 10 THEN c.UserId END) AS REAL) * 100 / COUNT(c.UserId) FROM comments c WHERE c.Score BETWEEN 5 AND 10;
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = '3-D Man';
SELECT COUNT(*) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';
SELECT COUNT(*) FROM superhero WHERE height_cm > 200 AND id IN (SELECT hero_id FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Super Strength'));
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');
SELECT colour FROM superhero WHERE superhero_name = 'Apocalypse' AND skin_colour_id = colour.id;
SELECT COUNT(DISTINCT superhero.id) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';
SELECT DISTINCT superhero_name FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id IN (SELECT id FROM colour WHERE colour = 'Blond');
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');
SELECT s.full_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND s.height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron';
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue');
SELECT AVG(height_cm) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT CAST(SUM(CASE WHEN hero_power.power_id IN (SELECT superpower.id FROM superpower WHERE superpower.power_name = 'Super Strength') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(superhero.id)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');
SELECT publisher.publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_id = (SELECT attribute.id                                     FROM attribute                                     WHERE attribute.attribute_name = 'Speed') GROUP BY publisher.publisher_name ORDER BY MIN(hero_attribute.attribute_value) LIMIT 1;
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold');
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond');
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence') AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Intelligence'))
SELECT race FROM superhero WHERE superhero_name = 'Copycat';
SELECT COUNT(*) FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Durability') AND ha.attribute_value < 50;
SELECT DISTINCT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha JOIN attribute a ON s.id = ha.hero_id AND ha.attribute_id = a.id WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(power_id) DESC LIMIT 1;
SELECT COUNT(*) FROM superhero WHERE race = 'Vampire';
SELECT CAST(SUM(CASE WHEN alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(superhero.id) AS percentage,        COUNT(CASE WHEN alignment = 'Bad' AND publisher.publisher_name = 'Marvel Comics' THEN superhero.id END) AS marvel_bad_count FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id;
SELECT      CASE          WHEN publisher_name = 'Marvel Comics' THEN SUM(1)         ELSE 0     END AS marvel_count,     CASE          WHEN publisher_name = 'DC Comics' THEN SUM(1)         ELSE 0     END AS dc_count,     (CASE          WHEN publisher_name = 'Marvel Comics' THEN SUM(1)         ELSE 0     END) - (CASE          WHEN publisher_name = 'DC Comics' THEN SUM(1)         ELSE 0     END) AS difference FROM      superhero WHERE      publisher_name IN ('Marvel Comics', 'DC Comics');
SELECT publisher_id FROM publisher WHERE publisher_name = 'Star Trek';
SELECT AVG(attribute_value) FROM hero_attribute;
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;
SELECT colour FROM superhero WHERE id = 75 AND eye_colour_id = colour.id;
SELECT power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Deathlok';
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = 2;
SELECT DISTINCT superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Male' LIMIT 5;
SELECT superhero_name FROM superhero WHERE race = 'Alien';
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1;
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id = 56);
SELECT DISTINCT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169;
SELECT c.colour FROM superhero s JOIN race r ON s.race_id = r.id JOIN colour c ON s.hair_colour_id = c.id WHERE r.race = 'human' AND s.height_cm = 185;
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)
SELECT CAST(SUM(CASE WHEN publisher.publisher_id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(publisher.publisher_id) FROM superhero WHERE superhero.height_cm BETWEEN 150 AND 180 AND publisher.publisher_id = 13;
SELECT s.full_name  FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' AND s.weight_kg > (SELECT AVG(s2.weight_kg) * 0.79 FROM superhero s2)
SELECT power_name, COUNT(*) AS power_count FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id GROUP BY power_name ORDER BY power_count DESC LIMIT 1;
SELECT attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Abomination';
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id = 1);
SELECT COUNT(*) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'stealth';
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Strength')
SELECT AVG(CASE WHEN superhero.skin_colour_id IS NULL THEN 1 ELSE 0 END) AS average FROM superhero;
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE p.publisher_name = 'Dark Horse Comics' AND ha.attribute_name = 'Durability' GROUP BY s.superhero_name ORDER BY MAX(ha.attribute_value) DESC LIMIT 1;
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Abraham Sapien';
SELECT DISTINCT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour h ON s.hair_colour_id = h.id JOIN colour sk ON s.skin_colour_id = sk.id JOIN publisher p ON s.publisher_id = p.id WHERE h.id = sk.id AND h.id = c.id;
SELECT race.race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE superhero.superhero_name = 'A-Bomb';
SELECT CAST(SUM(CASE WHEN superhero.hair_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') AND superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(superhero.gender_id) FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female';
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler';
SELECT gender.gender FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13';
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';
SELECT COUNT(power_id) FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo');
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.full_name = 'Hunter Zolomon';
SELECT superhero.height_cm FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';
SELECT DISTINCT superhero.superhero_name  FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black';
SELECT DISTINCT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'Gold';
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (     SELECT attribute_id FROM attribute WHERE attribute_name = 'Strength' ) AND ha.attribute_value = (     SELECT MAX(attribute_value) FROM hero_attribute     WHERE hero_id IN (         SELECT id FROM superhero WHERE alignment_id NOT IN (1, 4)     ) AND attribute_id = (         SELECT attribute_id FROM attribute WHERE attribute_name = 'Strength'     ) );
SELECT race.race, alignment.alignment  FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks';
SELECT CAST(SUM(CASE WHEN gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');
SELECT AVG(weight_kg) FROM superhero WHERE race = 'Alien';
SELECT   (     SUM(CASE WHEN superhero.full_name = 'Emil Blonsky' THEN superhero.weight_kg ELSE 0 END) -     SUM(CASE WHEN superhero.full_name = 'Charles Chandler' THEN superhero.weight_kg ELSE 0 END)   ) AS difference FROM   superhero;
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;
SELECT power_name FROM superpower WHERE id IN ( SELECT power_id FROM hero_power WHERE hero_id IN ( SELECT id FROM superhero WHERE superhero_name = 'Abomination' ) );
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_id = (SELECT attribute_id FROM attribute WHERE attribute_name = 'Speed') AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT attribute_id FROM attribute WHERE attribute_name = 'Speed'));
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT a.attribute_name, h.attribute_value FROM hero_attribute h JOIN attribute a ON h.attribute_id = a.id WHERE h.hero_id = (     SELECT s.id     FROM superhero s     WHERE s.superhero_name = '3-D Man' );
SELECT superhero_name FROM superhero WHERE eye_colour_id = 7 AND hair_colour_id = 9;
SELECT DISTINCT publisher.publisher_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE superhero.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT CAST(SUM(CASE WHEN superhero.eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(superhero.superhero_name) FROM superhero;
SELECT CAST(SUM(CASE WHEN gender.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) AS gender_ratio FROM superhero JOIN gender ON superhero.gender_id = gender.id;
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);
SELECT id FROM superpower WHERE power_name = 'cryokinesis';
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT s.full_name FROM superhero s WHERE s.weight_kg IS NULL OR s.weight_kg = 0;
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.full_name = 'Karen Beecher-Duncan';
SELECT DISTINCT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.full_name = 'Helen Parr';
SELECT race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 108 AND superhero.height_cm = 188;
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38;
SELECT race.race FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Maximum Attribute Value' GROUP BY superhero.race ORDER BY MAX(hero_attribute.attribute_value) DESC LIMIT 1;
SELECT a.alignment, sp.power_name  FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';
SELECT DISTINCT full_name FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue');
SELECT AVG(attribute_value) FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.alignment_id = 3;
SELECT c.colour  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON s.skin_colour_id = c.id WHERE a.attribute_value = 100;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;
SELECT DISTINCT race.race FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id JOIN gender ON superhero.gender_id = gender.id WHERE colour.colour = 'blue' AND gender.gender = 'male';
SELECT CAST(SUM(CASE WHEN gender.id = 2 AND alignment.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 2;
SELECT      (SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END)) AS difference FROM      superhero T1 WHERE      T1.weight_kg = 0 OR T1.weight_kg IS NULL;
SELECT attribute_value FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.superhero_name = 'Hulk' AND hero_attribute.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength');
SELECT power_name FROM superpower WHERE power_id IN (SELECT power_id FROM hero_power WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Ajax'));
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') AND skin_colour_id = (SELECT id FROM colour WHERE colour = 'Green');
SELECT COUNT(*) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');
SELECT DISTINCT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero_name ASC;
SELECT DISTINCT g.gender  FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE sp.power_name = 'Phoenix Force';
SELECT superhero_name FROM superhero WHERE publisher_name = 'DC Comics' ORDER BY weight_kg DESC LIMIT 1;
SELECT AVG(height_cm) AS average_height FROM superhero WHERE race != 'Human' AND publisher_name = 'Dark Horse Comics';
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;
SELECT   CASE     WHEN SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) > SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) THEN 'DC Comics'     WHEN SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) > SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) THEN 'Marvel Comics'     ELSE 'Equal'   END AS publisher_with_more_heroes,   ABS(SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference_in_hero_count FROM   superhero JOIN   publisher ON superhero.publisher_id = publisher.id;
SELECT a.attribute_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Black Panther' GROUP BY a.attribute_name ORDER BY MIN(ha.attribute_value) ASC LIMIT 1;
SELECT colour.colour  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE superhero.superhero_name = 'Abomination';
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';
SELECT CAST(SUM(CASE WHEN gender = 'Female' AND publisher_name = 'George Lucas' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(publisher_name = 'George Lucas') FROM superhero;
SELECT CAST(SUM(CASE WHEN alignment = 'Good' AND publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(publisher_name = 'Marvel Comics') FROM superhero;
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';
SELECT h.id AS hero_id FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id WHERE ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)
SELECT s.full_name FROM superhero s WHERE s.superhero_name = 'Alien';
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Brown' AND s.weight_kg < 100;
SELECT attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Aquababy';
SELECT weight_kg, race  FROM superhero  WHERE id = 40;
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');
SELECT DISTINCT h.id AS hero_id FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Blackwulf';
SELECT superpower.power_name  FROM superhero  JOIN superpower ON superhero.id = hero_power.hero_id  WHERE superhero.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);
SELECT DISTINCT drivers.driverRef  FROM drivers  JOIN qualifying ON drivers.driverId = qualifying.driverId  WHERE qualifying.raceId = 18 AND qualifying.position = 5;
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.round = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = r.raceId)
SELECT DISTINCT year FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE location = 'Shanghai');
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';
SELECT T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Germany';
SELECT DISTINCT r.circuitId, c.position FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN constructorStandings cs ON r.raceId = cs.raceId JOIN constructors con ON cs.constructorId = con.constructorId AND con.name = 'Renault';
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId IN (SELECT circuitId FROM circuits WHERE country NOT IN ('Malaysia', 'Bahrain', 'Turkey', 'Spain')) AND name LIKE '%Grand Prix%'
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';
SELECT circuits.lat, circuits.lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Australian Grand Prix';
SELECT url FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit');
SELECT time FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit');
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.name = 'Yas Marina Circuit';
SELECT DISTINCT T2.country  FROM races AS T1 JOIN constructorResults AS T3 ON T1.raceId = T3.raceId JOIN constructors AS T2 ON T3.constructorId = T2.constructorId WHERE T1.round = 24 AND T3.points = 1;
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Senna' AND forename = 'Bruno') AND raceId = 354;
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40';
SELECT driverId FROM qualifying WHERE raceId = 903 AND q3 = '0:01:54';
SELECT COUNT(*)  FROM drivers d LEFT JOIN results r ON d.driverId = r.driverId WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007) AND r.time IS NULL;
SELECT seasons.year FROM seasons JOIN races ON seasons.year = races.year WHERE races.round = 901;
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND positionOrder > 0;
SELECT d.surname, d.forename, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.round = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;
SELECT drivers.url FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.raceId = 161 AND lapTimes.time = '0:01:27';
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933);
SELECT location, lat, lng FROM circuits WHERE name = 'Malaysian Grand Prix';
SELECT constructors.url FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId JOIN races ON races.raceId = constructorResults.raceId WHERE races.round = 9 ORDER BY constructorResults.points DESC LIMIT 1;
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId = (SELECT driverId FROM drivers WHERE surname = 'di Grassi' AND forename = 'Lucas');
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '0:01:15';
SELECT d.code  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 45 AND q.q3 = '0:01:33';
SELECT time FROM results WHERE raceId = 743 AND driverId = (   SELECT driverId   FROM drivers   WHERE surname = 'McLaren'   AND forename = 'Bruce' );
SELECT drivers.surname, drivers.forename FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON races.raceId = results.raceId WHERE races.name = 'San Marino Grand Prix' AND races.year = 2006 AND results.position = 2;
SELECT seasons.* FROM seasons JOIN races ON seasons.year = races.year WHERE races.round = 901;
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE year = 2015 AND date = '2015-11-29' ) AND position > 0;
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON ra.raceId = r.raceId WHERE ra.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON ra.raceId = r.raceId WHERE ra.round = 348 AND r.positionOrder = (     SELECT MIN(positionOrder)     FROM results     WHERE raceId = ra.raceId );
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results );
SELECT CAST((fastestLapSpeed(raceId = 853) - (SELECT fastestLapSpeed FROM results WHERE raceId = 854)) AS REAL) / fastestLapSpeed(raceId = 853) * 100 AS percentage FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'di Resta' AND forename = 'Paul') AND number = 853;
SELECT CAST(COUNT(DISTINCT CASE WHEN time IS NOT NULL AND date = '1983-07-16' THEN driverId END) AS REAL) / COUNT(DISTINCT CASE WHEN date = '1983-07-16' THEN driverId END) * 100 AS percentage FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE year = 1983 AND month = 7 AND day = 16 );
SELECT year FROM races WHERE name = 'Singapore Grand Prix' ORDER BY year ASC LIMIT 1;
SELECT COUNT(*) AS RaceCount, races.name FROM races WHERE year = 2005 GROUP BY races.name ORDER BY races.name DESC;
SELECT MIN(date) AS first_race_date, name FROM races WHERE year = (SELECT year FROM races WHERE date = (SELECT MIN(date) FROM races)) AND month = (SELECT month FROM races WHERE date = (SELECT MIN(date) FROM races));  SELECT name FROM races WHERE year = (SELECT year FROM races WHERE date = (SELECT MIN(date) FROM races)) AND month = (SELECT month FROM races WHERE date = (SELECT MIN(date) FROM races)) AND date != (SELECT MIN(date) FROM races);
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999);
SELECT year, COUNT(*) AS num_races FROM races GROUP BY year ORDER BY num_races DESC LIMIT 1;
SELECT name FROM races WHERE year = 2017 AND circuitId NOT IN (SELECT circuitId FROM races WHERE year = 2000)
SELECT T1.country, T1.name, T1.location FROM circuits T1 JOIN races T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'European Grand Prix' AND T2.year = (SELECT MIN(year) FROM races WHERE name = 'European Grand Prix');
SELECT MAX(year) FROM races WHERE name = 'British Grand Prix' AND circuitRef = 'Brands Hatch';
SELECT COUNT(*) FROM races WHERE name = 'British Grand Prix' AND circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit' AND country = 'United Kingdom');
SELECT d.surname, d.forename FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2010 AND ra.name = 'Singapore Grand Prix' ORDER BY r.positionOrder;
SELECT d.forename, d.surname, MAX(pr.points) AS most_points FROM drivers d JOIN results pr ON d.driverId = pr.driverId GROUP BY d.driverId, d.forename, d.surname ORDER BY most_points DESC LIMIT 1;
SELECT d.surname, d.forename, SUM(r.points) AS total_points FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2017 AND ra.name = 'Chinese Grand Prix' GROUP BY d.driverId ORDER BY total_points DESC LIMIT 3;
SELECT MIN(`lapTimes.time`) AS best_lap_time, `drivers.forename`, `drivers.surname`, `races.name` FROM `lapTimes` JOIN `drivers` ON `lapTimes.driverId` = `drivers.driverId` JOIN `races` ON `lapTimes.raceId` = `races.raceId` GROUP BY `drivers.forename`, `drivers.surname`, `races.name` ORDER BY `best_lap_time` ASC LIMIT 1;
SELECT AVG(CAST(replace(time, '.', ',') AS REAL)) AS avg_lap_time FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE year = 2009 AND name = 'Chinese Grand Prix' ) AND driverId IN (     SELECT driverId     FROM drivers     WHERE surname = 'Vettel' AND forename = 'Sebastian' );
SELECT CAST(COUNT(DISTINCT CASE WHEN surname = 'Hamilton' AND year >= 2010 AND position > 1 THEN raceId END) AS REAL) / COUNT(DISTINCT CASE WHEN surname = 'Hamilton' AND year >= 2010 THEN raceId END) * 100 AS percentage FROM races JOIN drivers ON races.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND races.year >= 2010;
SELECT d.forename, d.surname, d.nationality, AVG(r.points) AS average_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId GROUP BY d.driverId ORDER BY COUNT(ds.wins) DESC LIMIT 1;
SELECT dob, forename, surname FROM drivers WHERE nationality = 'Japanese' ORDER BY dob ASC LIMIT 1 OFFSET (2022 - EXTRACT(YEAR FROM dob)) + 1;
SELECT c.circuitRef FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY c.circuitRef HAVING COUNT(*) = 4;
SELECT circuits.name AS circuit_name, circuits.location, races.name AS race_name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'USA' AND races.year = 2006;
SELECT races.name AS Race_Name, circuits.name AS Circuit_Name, circuits.location AS Circuit_Location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE month(races.date) = 9 AND year(races.date) = 2005;
SELECT races.name  FROM races  JOIN results ON races.raceId = results.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 10;
SELECT COUNT(*) FROM results WHERE driverRef = 'michael_schumacher' AND raceId IN (SELECT raceId FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')) AND points = (SELECT MAX(points) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')));
SELECT r.name AS Race, r.year AS Year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND res.milliseconds = (     SELECT MIN(milliseconds)     FROM results     WHERE driverId = d.driverId );
SELECT AVG(points) AS average_points FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Irvine') AND year = 2000;
SELECT r.name AS first_race, results.points FROM races r JOIN results ON r.raceId = results.raceId JOIN drivers d ON results.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.year = (SELECT MIN(year) FROM races WHERE drivers.driverRef = d.driverRef);
SELECT races.name, countries.country FROM races JOIN circuits ON races.circuitId = circuits.circuitId JOIN countries ON circuits.country = countries.country WHERE races.year = 2017 ORDER BY races.date;
SELECT MAX(laps) AS most_laps, races.name AS race_name, seasons.year, circuits.location FROM races JOIN seasons ON races.year = seasons.year JOIN circuits ON races.circuitId = circuits.circuitId GROUP BY races.name, seasons.year, circuits.location ORDER BY most_laps DESC LIMIT 1;
SELECT CAST(COUNT(CASE WHEN races.country = 'Germany' AND races.name = 'European Grand Prix' THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN races.name = 'European Grand Prix' THEN 1 END) FROM races;
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'))
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)
SELECT COUNT(*) FROM drivers WHERE code IS NULL;
SELECT country FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers)
SELECT surname FROM drivers WHERE nationality = 'Italian';
SELECT url FROM drivers WHERE surname = 'Davidson' AND forename = 'Anthony';
SELECT driverRef FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis';
SELECT name FROM circuits WHERE url = (SELECT url FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix')
SELECT DISTINCT year FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit');
SELECT races.name, races.date, circuits.url AS circuit_url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit';
SELECT time FROM races WHERE year = 2010 AND circuitId = (SELECT circuitId FROM circuits WHERE name = 'Yas Marina Circuit');
SELECT COUNT(*)  FROM races WHERE circuitId IN (     SELECT circuitId      FROM circuits      WHERE country = 'Italy' );
SELECT date FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya');
SELECT circuits.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN seasons ON races.year = seasons.year WHERE races.name = 'Spanish Grand Prix' AND seasons.year = 2009;
SELECT MIN(fastestLapTime) AS fastest Lap Time FROM results WHERE driverId = (     SELECT driverId     FROM drivers     WHERE surname = 'Hamilton' AND forename = 'Lewis' );
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN qualifying q ON d.driverId = q.driverId WHERE r.points = (     SELECT MAX(points)     FROM results     WHERE fastestLapTime IS NOT NULL ) AND q.position = 1;
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.position = 1;
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis';
SELECT r.name AS Race_Name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1;
SELECT MAX(fastestLapSpeed) AS fastestlapspeed FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix');
SELECT DISTINCT year FROM races WHERE raceId IN (SELECT raceId FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis'));
SELECT positionOrder FROM results WHERE driverRef = 'lewis_hamilton' AND raceId IN (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix');
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.grid = 4 AND r.raceId IN (     SELECT raceId     FROM races     WHERE year = 2008 AND name = 'Australian Grand Prix' );
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL;
SELECT MAX(fastestLapTime) AS fastest Lap Time FROM results WHERE driverRef = 'lewishamilton' AND raceId IN (     SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' );
SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND positionOrder = 2;
SELECT d.forename, d.surname, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON ra.raceId = r.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.position = 1;
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN races r ON d.driverId = r.driverId  JOIN seasons s ON r.year = s.year  WHERE s.year = 2008 AND r.name = 'Australian Grand Prix' AND d.nationality = 'American';
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ON r.raceId = races.raceId WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND r.time IS NOT NULL;
SELECT SUM(points) FROM results WHERE driverId = (     SELECT driverId     FROM drivers     WHERE surname = 'Hamilton' AND forename = 'Lewis' );
SELECT CAST(SUM(CAST(SUBSTR(fastestLapTime, 4, 2) AS INTEGER) * 60 + CAST(RIGHT(SUBSTR(fastestLapTime, 7), 3) AS INTEGER)) AS REAL) / COUNT(*) AS avg_fastest_lap_time FROM results WHERE driverRef = 'lewis_hamilton' AND fastestLapTime IS NOT NULL;
SELECT CAST(COUNT(CASE WHEN T1.time IS NOT NULL THEN T1.raceId END) AS REAL) / COUNT(T1.raceId) AS completion_rate FROM races T1 JOIN results T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix';
SELECT CAST((T1.time::float - T2.time::float) AS REAL) * 100 / T2.time::float AS percentage_faster FROM results AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.position = 1 AND T2.position = COUNT(*) OVER (PARTITION BY T2.raceId) AND T1.year = 2008 AND T1.status = 'Finished' AND T2.status = 'Finished' AND T1.time IS NOT NULL AND T2.time IS NOT NULL;
SELECT COUNT(*) FROM circuits WHERE location = 'Melbourne' AND country = 'Australia';
SELECT lat, lng FROM circuits WHERE country = 'USA';
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01';
SELECT AVG(points) AS average_points FROM constructors WHERE nationality = 'British';
SELECT constructors.name, MAX(constructorStandings.points) AS highest_points FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId GROUP BY constructors.name ORDER BY highest_points DESC LIMIT 1;
SELECT constructors.name FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructorStandings.raceId = 291 AND constructorStandings.points = 0;
SELECT COUNT(DISTINCT constructors.constructorId)  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  WHERE constructors.nationality = 'Japanese'  GROUP BY constructors.constructorId  HAVING COUNT(constructorStandings.raceId) = 2 AND SUM(constructorStandings.points) = 0;
SELECT DISTINCT constructors.name FROM constructors JOIN results ON constructors.constructorId = results.constructorId WHERE results.rank = 1;
SELECT COUNT(DISTINCT constructors.constructorId) FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId JOIN races ON constructorResults.raceId = races.raceId JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE constructors.nationality = 'French' AND lapTimes.lap > 50;
SELECT CAST(COUNT(DISTINCT CASE WHEN r.year BETWEEN 2007 AND 2009 AND d.nationality = 'Japanese' AND r.time IS NOT NULL THEN d.driverId END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN r.year BETWEEN 2007 AND 2009 AND d.nationality = 'Japanese' THEN d.driverId END) AS RaceCompletionPercentage FROM races r JOIN drivers d ON r.driverId = d.driverId;
SELECT year, AVG(CAST(REPLACE(time, ':', '.') AS REAL)) AS avg_champion_time FROM results WHERE position = 1 AND time IS NOT NULL GROUP BY year;
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE drivers.dob > '1975-01-01' AND results.rank = 2;
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND NOT EXISTS (SELECT * FROM results WHERE drivers.driverId = results.driverId AND results.time IS NOT NULL);
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results );
SELECT MAX(lap) AS fastest_lap_number FROM results WHERE year = 2009 AND points = (SELECT MAX(points)              FROM driverStandings              WHERE year = 2009              AND position = 1)
SELECT AVG(fastestLapSpeed) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009 AND name = 'Spanish Grand Prix');
SELECT r.name, r.year FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.milliseconds IS NOT NULL GROUP BY r.raceId ORDER BY MIN(res.milliseconds) LIMIT 1;
SELECT CAST(COUNT(DISTINCT CASE WHEN year(drivers.dob) < 1985 AND races.laps > 50 THEN drivers.driverId END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN races.year BETWEEN 2000 AND 2005 THEN drivers.driverId END) FROM drivers JOIN races ON drivers.driverId = races.driverId;
SELECT COUNT(*)  FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.time < '02:00.00';
SELECT driverRef FROM drivers WHERE nationality = 'America';
SELECT raceId FROM races WHERE year = 2009;
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;
SELECT d.code FROM drivers d WHERE d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY d.dob LIMIT 3;  SELECT COUNT(*) FROM drivers d WHERE d.nationality = 'Netherlands' AND d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY d.dob LIMIT 3;
SELECT driverRef FROM drivers WHERE surname = 'Kubica' AND forename = 'Robert';
SELECT COUNT(*) FROM drivers WHERE nationality = 'Australian' AND YEAR(dob) = 1980;
SELECT d.forename, d.surname FROM drivers d WHERE d.nationality = 'German' AND YEAR(d.dob) BETWEEN 1980 AND 1990 ORDER BY MIN(l.time) ASC LIMIT 3;
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;
SELECT drivers.driverId, drivers.code FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE year(drivers.dob) = 1971 AND results.fastestLapTime IS NOT NULL ORDER BY results.fastestLapTime ASC LIMIT 1;
SELECT d.forename, d.surname FROM drivers d JOIN races r ON d.driverId = r.driverId JOIN lapTimes lt ON d.driverId = lt.driverId AND r.raceId = lt.raceId WHERE d.nationality = 'Spanish' AND year(d.dob) < 1982 GROUP BY d.driverId ORDER BY MAX(lt.time) DESC LIMIT 10;
SELECT year FROM races WHERE raceId IN (SELECT raceId FROM results WHERE fastestLapTime IS NOT NULL ORDER BY CAST(fastestLapTime AS REAL) ASC LIMIT 1);
SELECT year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId GROUP BY year ORDER BY MAX(CAST(lapTimes.time AS REAL)) ASC LIMIT 1;
SELECT d.driverId FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.lap = 1 GROUP BY d.driverId ORDER BY MIN(lt.time) DESC LIMIT 5;
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 99 AND positionOrder > 0 AND time IS NOT NULL AND statusId = 2;
SELECT COUNT(*) AS circuit_count, location, lat, lng FROM circuits WHERE location LIKE '%Austria%' GROUP BY location, lat, lng;
SELECT raceId, COUNT(*) AS finishers FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY finishers DESC LIMIT 1;
SELECT drivers.driverRef, drivers.nationality, drivers.dob FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 23 AND qualifying.q2 IS NOT NULL;
SELECT MIN(seasons.year) AS first_qualifying_year,         drivers.forename || ' ' || drivers.surname AS youngest_driver_name,         races.date,         races.time FROM drivers JOIN races ON drivers.driverId = races.driverId JOIN seasons ON races.year = seasons.year WHERE drivers.dob = (SELECT MIN(drivers.dob) FROM drivers) GROUP BY seasons.year, drivers.forename, drivers.surname, races.date, races.time;
SELECT COUNT(*)  FROM drivers  JOIN results ON drivers.driverId = results.driverId  WHERE drivers.nationality = 'American' AND results.statusId = 2;
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' GROUP BY c.constructorId ORDER BY MAX(cs.points) DESC LIMIT 1;
SELECT c.url  FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId GROUP BY c.constructorId ORDER BY COUNT(r.raceId) DESC LIMIT 1;
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON ra.raceId = r.raceId WHERE ra.name = 'French Grand Prix' AND r.lap = 3 GROUP BY d.driverId ORDER BY MAX(r.time) DESC LIMIT 1;
SELECT r.name AS Race_Name, MIN(lt.time) * 1000 AS Fastest_First_Lap_Time_in_Milliseconds FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId WHERE lt.lap = 1 GROUP BY r.name ORDER BY MIN(lt.time) ASC LIMIT 1;
SELECT AVG(CAST(fastestLapTime AS REAL)) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix') AND rank < 11;
SELECT d.forename, d.surname, AVG(p.duration) AS avg_pit_stop_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId ORDER BY avg_pit_stop_duration ASC LIMIT 5;
SELECT d.forename, d.surname, r.time FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE r.year = 2008 AND r.name = 'Canadian Grand Prix' AND res.position = 1 AND r.time NOT LIKE '%:%:%.%';
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId JOIN races ON constructorStandings.raceId = races.raceId WHERE races.year = 2009 AND races.name = 'Singapore Grand Prix' AND constructorStandings.position = 1;
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers WHERE drivers.nationality = 'Austrian' AND YEAR(drivers.dob) BETWEEN '1981' AND '1991';
SELECT drivers.forename || ' ' || drivers.surname AS fullname, drivers.url, drivers.dob FROM drivers WHERE drivers.nationality = 'German' AND year(drivers.dob) BETWEEN '1971' AND '1985' ORDER BY drivers.dob DESC;
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Monaco Grand Prix' AND r.date BETWEEN '1980-01-01' AND '2010-12-31' GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;
SELECT AVG(T2.points) AS average_score FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Turkish Grand Prix' AND T3.surname = 'Hamilton';
SELECT AVG(count\_race) AS annual\_average\_races FROM (SELECT COUNT(raceId) AS count\_race FROM races WHERE year BETWEEN 2000 AND 2010 GROUP BY year) AS yearly\_races;
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*)  FROM driverStandings WHERE position = 91 AND wins > 0;
SELECT races.name AS Race_Name FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)
SELECT circuits.location || ', ' || circuits.country AS full_location FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.date = (SELECT MAX(date) FROM races);
SELECT CONCAT(d.forename, ' ', d.surname) AS full_name FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.year = 2008 AND r.circuitId = (     SELECT circuitId     FROM circuits     WHERE name = 'Marina Bay Street Circuit' ) AND q.position = 1 ORDER BY q.q3 ASC LIMIT 1;
SELECT d.forename || ' ' || d.surname AS full_name, d.nationality, r.name AS first_race_name FROM drivers d JOIN races r ON d.driverId = r.round WHERE d.dob = (SELECT MIN(dob) FROM drivers)
SELECT COUNT(*)  FROM results  WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix')  AND statusId = 3  GROUP BY driverId  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT COUNT(raceId), d.forename, d.surname FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.forename, d.surname HAVING COUNT(raceId) > 0;
SELECT MAX(duration) AS longest_duration FROM pitStops;
SELECT MIN(time) AS fastest_lap_time FROM lapTimes WHERE lap = 1;
SELECT MAX(duration) AS longest_duration FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis');
SELECT lap FROM pitStops WHERE driverId = (     SELECT driverId     FROM drivers     WHERE surname = 'Hamilton' AND forename = 'Lewis' ) AND raceId = (     SELECT raceId     FROM races     WHERE year = 2011 AND name = 'Australian Grand Prix' );
SELECT driverId, SUM(duration) AS total_duration FROM pitStops WHERE raceId IN (     SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix' ) GROUP BY driverId;
SELECT MIN(time) AS lap_record FROM lapTimes WHERE driverId = (     SELECT driverId     FROM drivers     WHERE surname = 'Hamilton' AND forename = 'Lewis' ) AND raceId IN (     SELECT raceId     FROM races     WHERE url LIKE '%Formula_1%' );
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.time = (SELECT MIN(time) FROM lapTimes);
SELECT circuits.name AS circuit_position FROM races JOIN laps_times ON races.raceID = lap_times.raceID JOIN drivers ON races.driverID = drivers.driverID JOIN circuits ON races.circuitID = circuits.circuitID WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND lap_times.time = (SELECT MIN(time) FROM lap_times WHERE raceID = races.raceID);
SELECT MIN(time) AS lap_record FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Austrian Grand Prix' );
SELECT c.name AS circuit_name, MIN(r.time) AS lap_record FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN qualifying q ON r.raceId = q.raceId WHERE c.country = 'Italy' GROUP BY c.name;
SELECT r.name AS Race_Name FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit' AND lt.time = (     SELECT MIN(lapTime)     FROM lapTimes     WHERE raceId = r.raceId );
SELECT pitStops.duration  FROM pitStops  JOIN results ON pitStops.raceId = results.raceId AND pitStops.driverId = results.driverId  JOIN laps ON results.raceId = laps.raceId AND results.driverId = laps.driverId  WHERE laps.time = (SELECT MIN(laps.time)                    FROM laps                    WHERE laps.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix Circuit'))  AND pitStops.raceId = results.raceId;
SELECT DISTINCT circuits.lat, circuits.lng FROM circuits JOIN lapTimes ON circuits.circuitId = lapTimes.raceId WHERE lapTimes.time = '1:29.488';
SELECT AVG(milliseconds) AS avg_pit_stop_time_milliseconds FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis');
SELECT AVG(milliseconds) AS avg_lap_time_milliseconds FROM lapTimes WHERE raceId IN (SELECT raceId FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy'));
SELECT pa.player_api_id, MAX(pa.overall_rating) AS highest_rating FROM Player_Attributes pa GROUP BY pa.player_api_id ORDER BY highest_rating DESC LIMIT 1;
SELECT `player_name`, `height` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`);
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`)
SELECT COUNT(DISTINCT pa.player_api_id) FROM Player_Attributes pa WHERE pa.overall_rating >= 60 AND pa.overall_rating < 65 AND pa.defensive_work_rate = 'low';
SELECT pa.player_api_id FROM Player_Attributes pa WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes) GROUP BY pa.player_api_id ORDER BY COUNT(*) DESC LIMIT 5;
SELECT name, SUM(home_team_goal + away_team_goal) AS total_goals FROM Match JOIN League ON Match.league_id = League.id WHERE season = '2015/2016' GROUP BY League.id ORDER BY total_goals DESC LIMIT 1;
SELECT T2.team_long_name FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.season = '2015/2016' GROUP BY T2.team_long_name ORDER BY COUNT(CASE WHEN (T1.home_team_goal - T1.away_team_goal) < 0 THEN 1 END) ASC LIMIT 1;
SELECT T.player_name FROM Player AS T JOIN Player_Attributes AS A ON T.player_api_id = A.player_api_id GROUP BY T.player_name ORDER BY MAX(A.penalties) DESC LIMIT 10;
SELECT away_team_api_id  FROM Match  WHERE League.name = 'Scotland Premier League'  AND season = '2009/2010'  GROUP BY away_team_api_id  ORDER BY SUM(away_team_goal - home_team_goal) DESC  LIMIT 1;
SELECT T2.name, T1.buildUpPlaySpeed FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed = (SELECT MAX(buildUpPlaySpeed) FROM Team_Attributes GROUP BY team_api_id ORDER BY MAX(buildUpPlaySpeed) DESC LIMIT 4) ORDER BY T1.buildUpPlaySpeed DESC;
SELECT League.name, COUNT(Match.match_api_id) AS draw_count FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' AND Match.home_team_goal = Match.away_team_goal GROUP BY League.name ORDER BY draw_count DESC LIMIT 1;
SELECT CAST(DATETIME() AS DATE) - birthday AS age, pa.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.sprint_speed >= 97 AND pa.date >= '2013-01-01 00:00:00' AND pa.date <= '2015-12-31 00:00:00';
SELECT T2.name, COUNT(T1.league_id) AS total_matches FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T2.name ORDER BY total_matches DESC LIMIT 1;
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';
SELECT pa.player_api_id FROM Player_Attributes pa WHERE substr(pa.date, 1, 4) = '2010' GROUP BY pa.player_api_id HAVING MAX(pa.overall_rating) > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010');
SELECT DISTINCT T1.team_fifa_api_id FROM Team_Attributes AS T1 WHERE T1.buildUpPlaySpeed BETWEEN 51 AND 59;
SELECT T2.team_long_name  FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE strftime('%Y', T1.date) = '2012' AND T1.buildUpPlayPassing IS NOT NULL GROUP BY T2.team_long_name HAVING AVG(T1.buildUpPlayPassing) < (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL);
SELECT CAST(SUM(CASE WHEN preferred_foot = 'left' AND birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00' THEN 1 ELSE 0 END) AS REAL) * 1.0 / COUNT(player_fifa_api_id) FROM Player;
SELECT name, SUM(home_team_goal + away_team_goal) AS total_goals FROM Match JOIN League ON Match.league_id = League.id GROUP BY League.id ORDER BY total_goals ASC LIMIT 5;
SELECT AVG(`long_shots`) AS average_long_shots FROM `Player_Attributes` WHERE `player_fifa_api_id` = (SELECT `player_fifa_api_id` FROM `Player` WHERE `player_name` = 'Ahmed Samir Farag');
SELECT player_name, AVG(heading_accuracy) AS avg_heading_accuracy FROM Player_Attributes JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE height > 180 GROUP BY player_fifa_api_id ORDER BY avg_heading_accuracy DESC LIMIT 10;
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date >= '2014-01-01 00:00:00' AND T1.date <= '2014-01-31 00:00:00' GROUP BY T2.team_long_name HAVING SUM(T1.chanceCreationPassing) / COUNT(T1.id) > T1.chanceCreationPassing ORDER BY T1.chanceCreationPassing DESC;
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal);
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';
SELECT * FROM Player WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10';
SELECT attacking_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Franco Zennaro')
SELECT buildUpPlayPositioningClass FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag'
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Francois Affolter') AND date = '2014-09-18 00:00:00';
SELECT overall_rating FROM Player_Attributes WHERE player_api_id = 505942 AND strftime('%Y', date) = '2011'
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016'  AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League');
SELECT pa.preferred_foot FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player) ORDER BY p.birthday DESC LIMIT 1;
SELECT `player_name` FROM `Player_Attributes` WHERE `potential` = (SELECT MAX(`potential`) FROM `Player_Attributes`)
SELECT COUNT(*)  FROM Player_Attributes  WHERE weight < 130 AND preferred_foot = 'left';
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.chanceCreationPassingClass = 'Risky';
SELECT defensive_work_rate FROM Player_Attributes WHERE player_name = 'David Wilson';
SELECT birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT name FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Netherlands');
SELECT AVG(home_team_goal) FROM Match WHERE country_id IN (SELECT id FROM Country WHERE name = 'Poland') AND season = '2010/2011';
SELECT AVG(`finishing`) AS average_finishing_rate FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.height` = (SELECT MAX(`height`) FROM `Player`) OR `Player.height` = (SELECT MIN(`height`) FROM `Player`) GROUP BY `Player.player_api_id` ORDER BY average_finishing_rate DESC LIMIT 1;
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*)  FROM Player  WHERE strftime('%Y', birthday) > '1990';
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;
SELECT DISTINCT T2.player_name  FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010';
SELECT potential FROM Player_Attributes WHERE player_api_id = 505942;
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left';
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlaySpeedClass = 'Fast';
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_short_name = 'CLB';
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > 70;
SELECT AVG(`overall_rating`) FROM `Player_Attributes` WHERE strftime('%Y', `date`) BETWEEN '2010' AND '2015' AND height > 170;
SELECT `player_name` FROM `Player` WHERE `height` = (SELECT MIN(`height`) FROM `Player`)
SELECT DISTINCT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A';
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran');
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';
SELECT DISTINCT T2.team_short_name  FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10;
SELECT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.balance = (SELECT MAX(balance) FROM Player_Attributes) AND PA.potential = 61;
SELECT AVG(`ball_control`) - AVG(`ball_control`)  FROM `Player_Attributes`  WHERE `player_name` = 'Abdou Diallo'  GROUP BY `player_name`  HAVING COUNT(*) > 1  UNION ALL  SELECT AVG(`ball_control`)  FROM `Player_Attributes`  WHERE `player_name` = 'Aaron Appindangoye'  GROUP BY `player_name`  HAVING COUNT(*) > 1;
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';
SELECT p1.player_name AS 'Older Player' FROM Player p1 JOIN Player_Attributes pa1 ON p1.player_api_id = pa1.player_api_id JOIN Player p2 ON p2.player_api_id = pa1.player_api_id JOIN Player_Attributes pa2 ON p2.player_api_id = pa2.player_api_id WHERE p1.player_name = 'Aaron Lennon' AND p2.player_name = 'Abdelaziz Barrada' AND STRFTIME('%Y-%m-%d', p1.birthday) < STRFTIME('%Y-%m-%d', p2.birthday);
SELECT `player_name` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`)
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';
SELECT DISTINCT country_id FROM League WHERE name = 'Belgium Jupiler League';
SELECT DISTINCT league.name FROM League league JOIN Country country ON league.country_id = country.id WHERE country.name = 'Germany';
SELECT `Player.player_name`  FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player_Attributes.overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`)
SELECT COUNT(*)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high'
SELECT player_name FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone')) AND player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone');
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id = 505942;
SELECT COUNT(*)  FROM Player_Attributes  WHERE height > 180 AND volleys > 70;
SELECT T2.player_name FROM `Player_Attributes` AS T1 INNER JOIN `Player` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.volleys > 70 AND T1.dribbling > 70;
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Belgium' AND Season = '2008/2009';
SELECT pa.long_passing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY p.birthday ASC LIMIT 1;
SELECT COUNT(*)  FROM Match  WHERE league_id IN (     SELECT id      FROM League      WHERE name = 'Belgium Jupiler League' )  AND strftime('%Y', date) = '2009'  AND strftime('%m', date) = '04'
SELECT COUNT(*) AS num_matches, l.name AS league_name FROM Match m JOIN League l ON m.league_id = l.id WHERE m.season = '2008/2009' GROUP BY l.id ORDER BY num_matches DESC LIMIT 1;
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE strftime('%Y', Player.birthday) < '1986';
SELECT CAST(((`Player_Attributes`.overall_rating - (SELECT `Player_Attributes`.overall_rating FROM `Player_Attributes` WHERE `Player_Attributes`.player_name = 'Paulin Puel')) / (SELECT `Player_Attributes`.overall_rating FROM `Player_Attributes` WHERE `Player_Attributes`.player_name = 'Paulin Puel')) * 100 AS REAL) AS percentage_difference FROM `Player_Attributes` WHERE `Player_Attributes`.player_name = 'Ariel Borysiuk';
SELECT AVG(buildUpPlaySpeed) FROM Team_Attributes WHERE team_long_name = 'Heart of Midlothian';
SELECT AVG(T1.overall_rating)  FROM Player_Attributes T1  JOIN Player T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) AS Total_Crossing_Score FROM Player_Attributes T1 JOIN Player T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox';
SELECT MAX(Team_Attributes.chanceCreationPassing) AS highest_score, Team_Attributes.chanceCreationPassingClass AS classification FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Ajax'
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo';
SELECT MAX(`overall_rating`) FROM `Player_Attributes` AS T1 JOIN `Player` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon';
SELECT AVG(away_team_goal) FROM Match WHERE away_team_long_name = 'Parma' AND country_id = (SELECT id FROM Country WHERE name = 'Italy');
SELECT Player.player_name  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player_Attributes.overall_rating = 77 AND Player_Attributes.date = '2016-06-23'  ORDER BY Player.birthday ASC  LIMIT 1;
SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Aaron Mooy' AND date = '2016-02-04 00:00:00';
SELECT potential FROM Player_Attributes WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00';
SELECT attacking_work_rate FROM Player_Attributes WHERE player_name = 'Francesco Migliore' AND date = '2015-05-01 00:00:00';
SELECT defensive_work_rate FROM Player_Attributes WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant') ORDER BY date ASC LIMIT 1;
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22 00:00:00'
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00'
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_long_name = 'FC Lorient' AND date = '2010-02-22';
SELECT chanceCreationPassingClass FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'
SELECT chanceCreationCrossingClass FROM Team_Attributes WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00'
SELECT defenceAggressionClass FROM Team_Attributes WHERE team_long_name = 'Hannover 96' AND date = '2015-09-10 00:00:00'
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_name = 'Marko Arnautovic' AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'
SELECT CAST((`player_name` = 'Landon Donovan' AND `date` = '2013-07-12' AND `overall_rating` - (`player_name` = 'Jordan Bowery' AND `date` = '2013-07-12' AND `overall_rating`)) AS REAL) * 100 / (`player_name` = 'Landon Donovan' AND `date` = '2013-07-12' AND `overall_rating`) FROM Player_Attributes WHERE (`player_name` = 'Landon Donovan' AND `date` = '2013-07-12') OR (`player_name` = 'Jordan Bowery' AND `date` = '2013-07-12');
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5;
SELECT DISTINCT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id ORDER BY p.weight DESC LIMIT 10;
SELECT player_name FROM Player WHERE datetime('CURRENT_TIMESTAMP','localtime') - datetime(birthday) > 34;
SELECT COUNT(*)  FROM Match  WHERE home_team_goal > 0  AND home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')  OR home_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon');
SELECT SUM(away_team_goal) AS total_goals FROM Match WHERE (home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR home_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith'))  OR (away_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_6 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith'))  OR (home_player_1 = (
SELECT SUM(home_team_goal) AS total_home_team_goals FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id OR Match.home_player_2 = Player.player_api_id OR Match.home_player_3 = Player.player_api_id OR Match.home_player_4 = Player.player_api_id OR Match.home_player_5 = Player.player_api_id OR Match.home_player_6 = Player.player_api_id OR Match.home_player_7 = Player.player_api_id OR Match.home_player_8 = Player.player_api_id OR Match.home_player_9 = Player.player_api_id OR Match.home_player_10 = Player.player_api_id OR Match.home_player_11 = Player.player_api_id WHERE Player.birthday < DATETIME('now', '-30 years');
SELECT DISTINCT player_name FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);
SELECT DISTINCT player_name FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes);
SELECT pa.player_name FROM Player_Attributes pa JOIN Match m ON pa.player_api_id = m.home_player_1 OR pa.player_api_id = m.home_player_2 OR pa.player_api_id = m.home_player_3 OR pa.player_api_id = m.home_player_4 OR pa.player_api_id = m.home_player_5 OR pa.player_api_id = m.home_player_6 OR pa.player_api_id = m.home_player_7 OR pa.player_api_id = m.home_player_8 OR pa.player_api_id = m.home_player_9 OR pa.player_api_id = m.home_player_10 OR pa.player_api_id = m.home_player_11 WHERE pa.attacking_work_rate = 'high' AND (m.shoton IS NOT NULL OR m.shotoff IS NOT NULL OR m.cross IS NOT NULL OR m.corner IS NOT NULL) GROUP BY pa.player_name HAVING COUNT(*) > 10;
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.finishing = 1 ORDER BY datetime(Player.birthday, 'unixepoch') ASC LIMIT 1;
SELECT T1.player_name FROM Player AS T1 JOIN Country AS T2 ON T1.player_fifa_api_id = T2.id WHERE T2.name = 'Belgium'
SELECT DISTINCT T2.player_name, C.name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id JOIN Country AS C ON T2.player_fifa_api_id = C.id WHERE T1.vision > 89;
SELECT c.name AS country_name, AVG(p.weight) AS average_weight FROM Player p JOIN Country c ON p.player_fifa_api_id = c.id GROUP BY c.name ORDER BY average_weight DESC LIMIT 1;
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow'
SELECT T2.team_short_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T1.chanceCreationPassingClass = 'Safe' UNION SELECT T2.team_short_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.chanceCreationPassingClass = 'Safe'
SELECT AVG(height) FROM Player WHERE player_fifa_api_id IN (SELECT player_fifa_api_id FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Italy'));
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%' AND birthday > '1990'
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6) - (SELECT jumping FROM Player_Attributes WHERE id = 23) AS difference;
SELECT pa.player_api_id FROM Player_Attributes pa WHERE pa.preferred_foot = 'right' ORDER BY pa.potential ASC LIMIT 3;
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes)  AND preferred_foot = 'left';
SELECT CAST(COUNT(DISTINCT pa.player_api_id) AS REAL) * 100 / COUNT(DISTINCT p.player_api_id) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.stamina > 80 AND pa.strength > 80;
SELECT DISTINCT c.name AS country_name FROM Match m JOIN League l ON m.league_id = l.id JOIN Country c ON l.country_id = c.id WHERE l.name = 'Ekstraklasa' AND c.name = 'Poland';
SELECT home_team_goal AS home_score, away_team_goal AS away_score FROM Match WHERE date LIKE '2008-09-24%' AND league_id IN (     SELECT id     FROM League     WHERE name = 'Belgian Jupiler League' );
SELECT sprint_speed, agility, acceleration FROM Player_Attributes WHERE player_name = 'Alexis Blin';
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'KSV Cercle Brugge'
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016'  AND league_id IN (SELECT id FROM League WHERE name = 'Serie A' AND country_id IN (SELECT id FROM Country WHERE name = 'Italy'));
SELECT MAX(home_team_goal) AS highest_home_score FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Eredivisie' AND country_id IN (SELECT id FROM Country WHERE name = 'Netherlands'));
SELECT pa.finishing, pa.curve FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.weight = (SELECT MAX(weight) FROM Player)
SELECT T2.name AS LeagueName, COUNT(M.id) AS TotalGames FROM Match M JOIN League T2 ON M.league_id = T2.id WHERE M.season = '2015/2016' GROUP BY T2.name ORDER BY TotalGames DESC LIMIT 1;
SELECT T2.team_long_name  FROM Match AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id GROUP BY T2.team_long_name ORDER BY MAX(T1.away_team_goal) DESC LIMIT 1;
SELECT `player_name` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`);
SELECT CAST(COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN id END) AS REAL) / COUNT(id) * 100 AS percentage FROM Player;
SELECT      CASE          WHEN COUNT(CASE WHEN `SEX` = 'M' AND Admission = '+' THEN ID END) - COUNT(CASE WHEN `SEX` = 'M' AND Admission = '-' THEN ID END) > 0 THEN 'In-patient'         ELSE 'Out-patient'     END AS patient_type,     (COUNT(CASE WHEN `SEX` = 'M' AND Admission = '+' THEN ID END) - COUNT(CASE WHEN `SEX` = 'M' AND Admission = '-' THEN ID END)) * 100.0 / COUNT(CASE WHEN `SEX` = 'M' THEN ID END) AS deviation_percentage FROM      Patient WHERE      `SEX` = 'M';
SELECT CAST(COUNT(CASE WHEN YEAR(Birthday) > '1930' AND SEX = 'F' THEN ID END) AS REAL) / COUNT(CASE WHEN SEX = 'F' THEN ID END) * 100 AS Percentage FROM Patient;
SELECT CAST(COUNT(CASE WHEN YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31' AND Admission = '+' THEN 1 END) AS REAL) * 100 / COUNT(*) FROM Patient;
SELECT CAST(COUNT(DISTINCT CASE WHEN `Diagnosis` = 'SLE' AND Admission = '+' THEN `Patient`.`ID` END) AS REAL) / COUNT(DISTINCT CASE WHEN `Diagnosis` = 'SLE' AND Admission = '-' THEN `Patient`.`ID` END) FROM `Patient` JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` JOIN `Laboratory` ON `Patient`.`ID` = `Laboratory`.`ID` WHERE `Examination`.`Diagnosis` = 'SLE';
SELECT Diagnosis, Date  FROM Laboratory  WHERE ID = 30609  ORDER BY Date;
SELECT SEX, Birthday, `Examination Date`, Symptoms FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.ID = '163109';
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;
SELECT T1.ID, SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.RVVT = '+';
SELECT Patient.ID, Patient.SEX, Examination.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis = 2;
SELECT DISTINCT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Birthday) = '1937' AND Laboratory.`T-CHO` >= '250';
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5
SELECT CAST(COUNT(DISTINCT CASE WHEN `SEX` = 'F' AND TP < 6.0 OR TP > 8.5 THEN `ID` END) AS REAL) / COUNT(`ID`) * 100 FROM `Patient` JOIN `Examination` ON `Patient.ID` = `Examination.ID` GROUP BY `Patient.ID`
SELECT AVG(`aCL IgG`) FROM Examination WHERE Admission = '+' AND SUBTRACT(year(CURRENT_TIMESTAMP), year(Birthday)) >= '50';
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND YEAR(p.Description) = 1997 AND l.Admission = '-' GROUP BY p.ID;
SELECT MIN(SUBTRACT(YEAR(Birthday), YEAR(`First Date`))) AS Age_at_Admission FROM Patient;
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Thrombosis = 1  AND e.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'  AND p.SEX = 'F';
SELECT age_gap FROM (SELECT (MAX(YEAR(Birthday)) - MIN(YEAR(Birthday))) AS age_gap FROM Patient WHERE ID IN(SELECT ID FROM Laboratory WHERE TG >= 200)) AS age_difference_table;
SELECT Symptoms, Diagnosis FROM Examination WHERE ID IN (SELECT MIN(ID) FROM Patient);
SELECT CAST(COUNT(DISTINCT p.ID) AS REAL) / 12  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT T2.Date, (YEAR(T2.`First Date`) - YEAR(T1.Birthday)) AS AgeAtAdmission FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' AND T1.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY T2.Date ASC LIMIT 1;
SELECT CAST(SUM(CASE WHEN P.SEX = 'M' AND L.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN P.SEX = 'F' AND L.UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) AS male_to_female_ratio FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UA IS NOT NULL;
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE e.ID IS NULL OR (SUBTRACT(year(e.`Examination Date`), year(p.`First Date`)) >= 1)
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE YEAR(Patient.Birthday) < 18  AND Examination.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31';
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.`T-BIL` > 2.0;
SELECT Diagnosis, COUNT(*) AS IllnessCount FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY IllnessCount DESC LIMIT 1;
SELECT AVG(SUBTRACT('1991', year(Birthday))) AS average_age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT SUBTRACT(year(`Examination Date`), year(Birthday)) AS Age, Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE HGB = (SELECT MAX(HGB) FROM Laboratory) ORDER BY Age DESC LIMIT 1;
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT (T2.T-CHO < 250) AS `Cholesterol Normal` FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.ID = 2927464 AND T2.Date = '1995-09-04'
SELECT SEX FROM Patient WHERE ID = (SELECT MIN(ID) FROM Patient WHERE Diagnosis = 'AORTITIS');
SELECT aCL_IgM FROM Examination WHERE Diagnosis = 'SLE' AND `Description` = '1994-02-19' AND ID IN (SELECT ID FROM Patient WHERE `Description` = '1993-11-12')
SELECT SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT = '9' AND Laboratory.Date = '1992-06-12'
SELECT CAST(YEAR('1991-10-21') - YEAR(`Birthday`) AS REAL) AS Age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE UA = '8.4' AND Date = '1991-10-21';
SELECT COUNT(Laboratory.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.`First Date` = '1991-06-13' AND Patient.Diagnosis = 'SJS' AND YEAR(Laboratory.Date) = 1995;
SELECT T2.Diagnosis AS Original_Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` = '1997-01-27' AND T2.Diagnosis = 'SLE' AND T1.`First Date` = (SELECT MIN(T1.`First Date`) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` = '1997-01-27' AND T2.Diagnosis = 'SLE')
SELECT Symptoms FROM Examination WHERE `First Date` = '1993-09-27' AND Patient.ID = (SELECT ID FROM Patient WHERE Birthday = '1959-03-01')
SELECT ((SUM(CASE WHEN `Patient.Birthday` = '1959-02-18' AND Laboratory.Date LIKE '1981-11-%' THEN Laboratory.`T-CHO` END) - SUM(CASE WHEN `Patient.Birthday` = '1959-02-18' AND Laboratory.Date LIKE '1981-12-%' THEN Laboratory.`T-CHO` END)) / SUM(CASE WHEN `Patient.Birthday` = '1959-02-18' AND Laboratory.Date LIKE '1981-11-%' THEN Laboratory.`T-CHO` END)) * 100 AS DecreaseRate FROM Laboratory JOIN `Patient` ON Laboratory.ID = `Patient.ID` WHERE `Patient.Birthday` = '1959-02-18' GROUP BY `Patient.ID`
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis LIKE '%Behcet%' AND YEAR(p.Description) >= '1997-01-01' AND YEAR(p.Description) < '1998-01-01'
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date BETWEEN '1987-07-06' AND '1996-01-31' AND l.GPT > 30 AND l.ALB < 4;
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+';  SELECT ID  FROM Patient  WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'  ORDER BY ID;
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Thrombosis = 2  AND e.ANA = 'S'  AND e.`aCL IgM` >= AVG(e.`aCL IgM`) * 1.2
SELECT CAST(COUNT(CASE WHEN U-PRO > 0 AND U-PRO < 30 AND UA <= 6.5 THEN 1 END) AS REAL) * 100 / COUNT(U-PRO > 0 AND U-PRO < 30) FROM Laboratory WHERE U-PRO IS NOT NULL AND UA IS NOT NULL;
SELECT CAST(SUM(CASE WHEN YEAR(`First Date`) = '1981' AND SEX = 'M' AND Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(YEAR(`First Date`) = '1981' AND SEX = 'M') FROM Patient WHERE YEAR(`First Date`) = '1981' AND SEX = 'M'
SELECT DISTINCT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.`T-BIL` < 2.0;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.`ANA Pattern` != 'P' AND p.SEX = 'F' AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31';
SELECT DISTINCT T2.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123;
SELECT AVG(ALB) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.PLT > 400 AND Examination.Diagnosis = 'SLE'
SELECT MAX(Symptoms) AS Most_Common_Sign FROM Examination WHERE Diagnosis = 'SLE'
SELECT T2.Date AS 'Medical Information First Documented', T2.Diagnosis AS 'Disease' FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 48473 ORDER BY T2.Date ASC LIMIT 1;
SELECT COUNT(*) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'F' AND Examination.Diagnosis = 'APS'
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = '1997' AND l.TP NOT BETWEEN 6 AND 8.5;
SELECT CAST(SUM(CASE WHEN `Symptoms` LIKE '%ITP%' AND Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(Diagnosis LIKE '%SLE%') FROM Examination WHERE Symptoms LIKE '%ITP%'
SELECT CAST(SUM(CASE WHEN YEAR(Birthday) = '1980' AND Diagnosis = 'RA' AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Patient;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND p.Diagnosis = 'BEHCET' AND l.Date BETWEEN '1995-01-01' AND '1997-12-31' AND p.Admission = '-'
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;
SELECT DATEDIFF(`Examination Date`, `First Date`)  FROM Patient  WHERE ID = 821298
SELECT COUNT(*)  FROM Laboratory  WHERE ID = 57266  AND (SEX = 'M' AND UA > 8.0 OR SEX = 'F' AND UA > 6.5);
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60
SELECT P.SEX, P.Birthday FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND YEAR(L.Date) = 1994;
SELECT DISTINCT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GPT >= 60;
SELECT DISTINCT T2.Diagnosis  FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT > 60 ORDER BY T2.Birthday ASC;
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;
SELECT p.ID, SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(p.Birthday)) AS age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH BETWEEN 600 AND 800;
SELECT p.Admission FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP < 300
SELECT T1.ID FROM `Patient` AS T1 INNER JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' AND T2.ALP < 300;
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0
SELECT AVG(SUBTRACT(TP, 8.5)) AS Deviation FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.TP > 8.5
SELECT DISTINCT P.ID, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.ALB <= 3.5 OR L.ALB >= 5.5 ORDER BY P.Birthday DESC;
SELECT p.Birthday,         CASE             WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'            ELSE 'Outside Normal Range'        END AS AlbuminRange FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = '1982'
SELECT CAST(COUNT(CASE WHEN P.SEX = 'F' AND L.UA > 6.5 THEN 1 END) AS REAL) * 100 / COUNT(P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F'
SELECT AVG(T2.UA) AS Average-UA FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = T1.ID) AND (T1.SEX = 'M' AND T2.UA < 8.0 OR T1.SEX = 'F' AND T2.UA < 6.5)
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UN < 30 AND P.Diagnosis = 'RA';
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5;
SELECT      CASE          WHEN SUM(CASE WHEN P.SEX = 'M' AND L.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' AND L.CRE >= 1.5 THEN 1 ELSE 0 END) THEN 'True'         ELSE 'False'     END AS result FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      L.CRE >= 1.5
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)
SELECT p.SEX, COUNT(*) AS Total FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` >= 2.0 GROUP BY p.SEX;
SELECT p.ID, MAX(l.T-CHO) AS max_T CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID GROUP BY p.ID ORDER BY p.Birthday ASC LIMIT 1;
SELECT AVG(DIVIDE(SUBTRACT(YEAR(CURRENT_DATE), YEAR(birthday)), COUNT(ID))) AS average_age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE SEX = 'M' AND `T-CHO` >= 250;
SELECT DISTINCT P.ID, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG > 300;
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(P.Birthday)) > 50
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.CPK < 250;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND YEAR(p.Birthday) BETWEEN '1936' AND '1956' AND l.CPK >= 250;
SELECT p.ID, p.SEX, age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l.`T-CHO` < 250;
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Description) >= 1991 AND l.GLU < 180;
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 GROUP BY p.SEX, p.Birthday ORDER BY p.Birthday ASC;
SELECT p.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday) AS Age, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC < 3.5;
SELECT p.Diagnosis, p.Admission FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F' AND YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday) >= 50 AND (e.RBC <= 3.5 OR e.RBC >= 6.0);
SELECT DISTINCT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.HGB < 10;
SELECT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Diagnosis = 'SLE' AND L.HGB BETWEEN 10 AND 17 ORDER BY P.Birthday ASC LIMIT 1;
SELECT p.ID, age AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID HAVING COUNT(l.ID) > 2;
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;
SELECT      CASE          WHEN SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) > 0 THEN 'Number of patients with lower than normal platelet level is greater'         WHEN SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) < 0 THEN 'Number of patients with higher than normal platelet level is greater'         ELSE 'Numbers are equal'     END AS comparison_result FROM      Laboratory JOIN      Patient  ON      Laboratory.ID = Patient.ID WHERE      Laboratory.PLT < 100 OR Laboratory.PLT > 400;
SELECT DISTINCT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date LIKE '1984%' AND SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(P.Birthday)) < 50 AND L.PLT BETWEEN 100 AND 400;
SELECT CAST(SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 1.0 / SUM(PT >= 14) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday) > 55 GROUP BY Patient.SEX HAVING SUM(PT >= 14) > 0;
SELECT DISTINCT P.ID, P.SEX, P.Birthday, P.Description FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE P.`First Date` > '1992-01-01' AND L.PT < 14;
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT >= 45;
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.APTT > 45 AND e.Thrombosis = 3 AND e.Thrombosis IS NOT NULL;
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.WBC BETWEEN 3.5 AND 9.0 AND (l.FG <= 150 OR l.FG >= 450);
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Birthday > '1980-01-01' AND l.FG NOT BETWEEN 150 AND 450;
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` >= 30;
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` > 0 AND T2.`U-PRO` < 30 AND T1.Diagnosis = 'SLE'
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.IGG < 900 AND e.Symptoms = 'abortion';
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGG BETWEEN 900 AND 2000 AND p.Symptoms IS NOT NULL;
SELECT Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE IGA BETWEEN 80 AND 500 GROUP BY Patient.ID ORDER BY MAX(IGA) DESC LIMIT 1;
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGA BETWEEN 80 AND 500 AND YEAR(Patient.`First Date`) >= 1990;
SELECT Diagnosis, COUNT(*) AS count FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGM NOT BETWEEN 40 AND 400 GROUP BY Diagnosis ORDER BY count DESC LIMIT 1;
SELECT COUNT(*) FROM Patient WHERE ID IN (     SELECT Patient.ID FROM Patient     LEFT JOIN Laboratory ON Patient.ID = Laboratory.ID     WHERE Laboratory.CRP LIKE '+' OR Laboratory.CRP LIKE '-' OR Laboratory.CRP < 1.0     GROUP BY Patient.ID     HAVING MAX(Laboratory.Description IS NOT NULL) = 0 );
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRP NOT IN ('+-', '-') AND l.CRP >= 1.0  AND YEAR(CURRENT_DATE) - YEAR(p.Birthday) < 18;
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.RF IN ('-', '+-') AND l.KCT = '+';
SELECT DISTINCT T2.Diagnosis FROM `Patient` AS T1 INNER JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) >= 1995 AND T2.RA IN('-', '+-')
SELECT T1.ID FROM `Patient` AS T1 INNER JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) > 60
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.RF < 20 AND e.Thrombosis = 0
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.C3 > 35 AND e.`ANA Pattern` = 'P'
SELECT T1.ID  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  JOIN Laboratory AS T3 ON T1.ID = T3.ID  WHERE T3.HCT NOT BETWEEN 29 AND 52  ORDER BY T2.`aCL IgA` DESC  LIMIT 1;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Thrombosis = 1  AND l.C4 > 10
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RNP IN ('-', '+-')  AND p.Admission = '+';
SELECT p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN ('-', '+-') ORDER BY p.Birthday ASC LIMIT 1;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SM IN ('-', '+-') AND e.Thrombosis = 1;
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SM NOT IN ('-', '+-') ORDER BY p.Birthday ASC LIMIT 3;
SELECT DISTINCT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.`Examination Date` >= '1997-01-01' AND T3.SC170 IN ('-', '+-')
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SC170 IN ('-', '+-')  AND p.SEX = 'M'  AND e.Symptoms = 'vertigo';
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SSA IN ('-', '+-')  AND YEAR(p.`First Date`) < 1990;
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA NOT IN ('-', '+-') AND p.`First Date` = (SELECT MIN(`First Date`) FROM Patient)
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'SLE' AND l.SSB IN ('-', '0')
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SSB IN ('-', '+-')  AND e.Symptoms IS NOT NULL;
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'M'  AND ID IN (     SELECT DISTINCT Patient.ID      FROM Patient      JOIN Laboratory ON Patient.ID = Laboratory.ID      WHERE Laboratory.CENTROMEA IN ('-', '+-')      AND Laboratory.SSB IN ('-', '+-') );
SELECT DISTINCT T2.Diagnosis  FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA >= 8;
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID LEFT JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA < 8 AND p.Description IS NULL;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`DNA-II` > 8 AND p.Admission = '+';
SELECT CAST(COUNT(CASE WHEN Laboratory.GOT >= 60 AND Patient.Diagnosis = 'SLE' THEN Patient.ID END) AS REAL) * 1.0 / COUNT(CASE WHEN Laboratory.GOT >= 60 THEN Patient.ID END) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID;
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60;
SELECT MIN(P.Patient_Birthday) AS Youngest_Birthdate FROM Patient P JOIN Laboratory L ON P.ID = L.Patient_ID WHERE L.GOT >= 60
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT < 60 GROUP BY p.Birthday ORDER BY MAX(l.GPT) DESC LIMIT 3;
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Laboratory WHERE GOT < 60)
SELECT `First Date` FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE LDH = (SELECT MAX(LDH) FROM Laboratory WHERE LDH < 500) GROUP BY Patient.ID ORDER BY MIN(`First Date`) LIMIT 1;
SELECT MAX(`First Date`) AS LatestRecordDate FROM Patient WHERE EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = Patient.ID)     AND LDH >= 500 );
  SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.ALP >= 300 AND Patient.Admission = '+';
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.ALP < 300;
SELECT T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.TP < 6.0
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' AND l.TP > 6.0 AND l.TP < 8.5;
SELECT `Examination Date` FROM Examination WHERE ALB = (     SELECT MAX(ALB)     FROM Laboratory     WHERE ALB > 3.5 AND ALB < 5.5 );
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5
SELECT e.`aCL IgG`, e.`aCL IgM`, e.`aCL IgA` FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE p.SEX = 'F' AND l.UA > 6.50 ORDER BY l.UA DESC LIMIT 1;
SELECT MAX(`ANA`) AS max_ana FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.CRE < 1.5 AND T2.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM Examination)
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%'
SELECT p.DESCRIPTION FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` = (     SELECT MAX(`T-BIL`)     FROM Laboratory     WHERE `T-BIL` < 2.0 ) AND p.DESCRIPTION IS NOT NULL;
SELECT COUNT(*)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-CHO` >= 250 AND p.KCT = '-'
SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-CHO` < 250 AND e.`ANA Pattern` = 'P'
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG = (SELECT MAX(TG) FROM Laboratory WHERE T1.TG < 200)
SELECT DISTINCT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Thrombosis = 0 AND T3.CPK < 250
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+')
SELECT Birthday FROM Patient WHERE ID = (SELECT MIN(ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GLU > 180)
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.GLU < 180 AND e.Thrombosis = 0
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND EXISTS (SELECT * FROM Laboratory WHERE Patient.ID = Laboratory.ID AND WBC BETWEEN 3.5 AND 9.0);
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC <= 3.5 OR l.RBC >= 6.0 AND p.Admission = '-'
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.PLT > 100 AND L.PLT < 400 AND P.Diagnosis IS NOT NULL
SELECT PLT FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE PLT BETWEEN 100 AND 400 AND Diagnosis = 'MCTD'
SELECT AVG(PT) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.PT < 14
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis IN (1, 2) AND e.PT < 14
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';
SELECT COUNT(*) FROM member WHERE college = 'College of Engineering';
SELECT first_name, last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design';
SELECT COUNT(DISTINCT m.member_id) FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';
SELECT DISTINCT phone FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON event.event_id = attendance.link_to_event WHERE event.event_name = 'Women''s Soccer';
SELECT COUNT(*) FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';
SELECT e.event_name, COUNT(a.link_to_member) AS attendance FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Student_Club' GROUP BY e.event_id ORDER BY attendance DESC LIMIT 1;
SELECT DISTINCT college FROM member WHERE position = 'Vice President';
SELECT event.event_name FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' JOIN event ON attendance.link_to_event = event.event_id;
SELECT COUNT(*) FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(e.event_date) = 2019;
SELECT COUNT(*) FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(e.event_id) > 10;
SELECT event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_id HAVING COUNT(attendance.link_to_member) > 20;
SELECT AVG(COUNT(event_id)) / COUNT(DISTINCT event_name) AS average_attendance FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense WHERE link_to_event IN (SELECT event_id FROM event));
SELECT COUNT(*) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';
SELECT first_name, last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON event.event_id = attendance.link_to_event WHERE event.event_name = 'Laugh Out Loud';
SELECT last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Law and Constitutional Studies';
SELECT county FROM zip_code WHERE zip = (SELECT zip FROM member WHERE first_name = 'Sherri' AND last_name = 'Ramsey')
SELECT college FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE first_name = 'Tyler' AND last_name = 'Hewitt');
SELECT SUM(amount) AS total_funds_received FROM income WHERE link_to_member IN (     SELECT member_id     FROM member     WHERE position = 'Vice President' );
SELECT SUM(expense.cost) AS total_spent_on_food FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Meeting' AND expense.expense_description LIKE '%Food%' AND event.event_date LIKE '202%09%';
SELECT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Illinois');
SELECT SUM(expense.cost) AS total_spent FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Meeting' AND expense.expense_description = 'Advertisement' AND event.event_date LIKE '202%';
SELECT department FROM major WHERE major_id IN(SELECT link_to_major FROM member WHERE first_name = 'Pierce' OR last_name = 'Guidi') GROUP BY department;
SELECT SUM(amount) FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Speaker')
SELECT COUNT(*)  FROM expense  WHERE link_to_event IN (     SELECT event_id      FROM event      WHERE event_name = 'October Meeting' AND event_date = '2019-10-08' ) AND approved = 'True'  GROUP BY link_to_event  HAVING COUNT(*) = (SELECT COUNT(*) FROM expense WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Meeting' AND event_date = '2019-10-08'))
SELECT AVG(cost) AS average_cost FROM expense WHERE link_to_member = 'Elijah Allen' AND MONTH(expense_date) IN (9, 10);
SELECT   SUM(CASE WHEN YEAR(event_date) = 2019 THEN spent ELSE 0 END) -   SUM(CASE WHEN YEAR(event_date) = 2020 THEN spent ELSE 0 END) AS difference FROM   budget JOIN   event ON budget.link_to_event = event.event_id WHERE   event.status = 'Open' AND event.type = 'Meeting' AND event.location = 'MU 215';
SELECT location FROM event WHERE event_name = 'Spring Budget Review';
SELECT expense_description, cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';
SELECT remaining FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14';
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O\'Gallagher';
SELECT COUNT(*)  FROM budget  WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'November Meeting')  AND remaining < 0;
SELECT SUM(amount) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Speaker')
SELECT e.event_status  FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-8-20';
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Human Development and Family Studies') AND t_shirt_size = 'Large';
SELECT z.type FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson';
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';
SELECT DISTINCT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';
SELECT department FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.position = 'President'
SELECT date_received FROM income WHERE source = 'Dues' AND email = 'Connor Hilton';
SELECT first_name, last_name FROM member WHERE member_id IN (SELECT link_to_member FROM income WHERE source = 'Dues' AND date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues'));
SELECT COUNT(*) FROM budget WHERE event_name = 'Yearly Kickoff' AND category = 'Advertisement' AND amount > (SELECT SUM(amount) FROM budget WHERE event_name = 'October Meeting' AND category = 'Advertisement') / (SELECT SUM(amount) FROM budget WHERE event_name = 'Yearly Kickoff' AND category = 'Advertisement');
SELECT CAST(SUM(CASE WHEN b.category = 'Parking' AND e.event_name = 'November Speaker' THEN b.amount ELSE 0 END) AS REAL) * 100 / COUNT(e.event_name) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker';
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange' AND state = 'Virginia';
SELECT department  FROM major  WHERE college = 'College of Humanities and Social Sciences';
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';
SELECT expense_description FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.remaining = (SELECT MIN(remaining) FROM budget)
SELECT member_id, first_name, last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member WHERE attendance.link_to_event = 'rec0akZnLLpGUloLH';
SELECT college, COUNT(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY college ORDER BY member_count DESC LIMIT 1;
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360';
SELECT event.event_name, budget.amount FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.amount = (SELECT MAX(amount) FROM budget);
SELECT expense_description FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President');
SELECT COUNT(*)  FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer';
SELECT date_received FROM income WHERE link_to_member = 'CASEY_MASON';
SELECT COUNT(*) FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Maryland';
SELECT COUNT(*) FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240';
SELECT first_name || ' ' || last_name AS full_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education';
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.status = 'Closed'  AND b.event_status = 'Closed'  ORDER BY CAST(b.spent AS REAL) / CAST(b.amount AS REAL) DESC  LIMIT 1;
SELECT COUNT(*) FROM member WHERE position = 'President';
SELECT MAX(spent) AS highest_budget_spent FROM budget;
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;
SELECT SUM(spent) AS total_food_spent FROM budget WHERE category = 'Food';
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id, m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;
SELECT DISTINCT member.first_name, member.last_name FROM member JOIN major ON member.link_to_major = major.major_id JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE major.major_name = 'Interior Design' AND event.event_name = 'Community Theater';
SELECT first_name || ' ' || last_name AS full_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina');
SELECT COUNT(*) FROM income WHERE source = 'Grant Gilmour';
SELECT CONCAT(member.first_name, ' ', member.last_name) AS name_of_students FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.amount > 40;
SELECT SUM(expense.cost) AS total_expense FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff';
SELECT member.first_name, member.last_name FROM member JOIN budget ON member.member_id = budget.link_to_member WHERE budget.category = 'Yearly Kickoff';
SELECT m.first_name, m.last_name, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (SELECT MAX(amount) FROM income);
SELECT e.event_name FROM event e JOIN expense e2 ON e.event_id = e2.link_to_event GROUP BY e.event_id ORDER BY MIN(e2.cost) ASC LIMIT 1;
SELECT CAST(SUM(CASE WHEN event.event_name = 'Yearly Kickoff' THEN expense.expense_description ELSE NULL END) AS REAL) / SUM(expense.expense_description) * 100 AS percentage_cost_yearly_kickoff FROM expense JOIN event ON expense.link_to_event = event.event_id;
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major;
SELECT MAX(source) AS top_source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';
SELECT COUNT(*)  FROM member  JOIN major  ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching';
SELECT COUNT(DISTINCT link_to_member) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Community Theater' AND YEAR(event.event_date) = 2019;
SELECT COUNT(a.link_to_event), m.major_name  FROM attendance a  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi';
SELECT DIVIDE(SUM(b.spent), COUNT(b.spent)) AS average_food_spending FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.status = 'Closed' AND b.category = 'Food';
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' AND budget.spent = (SELECT MAX(spent)                    FROM budget                    WHERE category = 'Advertisement')
SELECT COUNT(*)  FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND attendance.link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer');
SELECT CAST(SUM(CASE WHEN type = 'Community Service' AND event_date BETWEEN '2019-01-01' AND '2019-12-31' THEN 1 ELSE 0 END) AS REAL) / COUNT(event_id) * 100 FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';
SELECT SUM(cost) AS total_cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Posters' AND event.event_name = 'September Speaker';
SELECT t_shirt_size, COUNT(*) AS count FROM member GROUP BY t_shirt_size ORDER BY count DESC LIMIT 1;
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 GROUP BY e.event_name ORDER BY b.remaining ASC LIMIT 1;
SELECT expense_description, SUM(cost) AS total_value FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'Yes' GROUP BY expense_description;
SELECT SUM(amount) AS total_budgeted_amount, category FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY category ORDER BY category ASC;
SELECT MAX(amount) FROM budget WHERE category = 'Food';
SELECT category, amount FROM budget WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3;
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking';
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';
SELECT CONCAT(member.first_name, ' ', member.last_name) AS full_name, SUM(expense.cost) AS total_cost FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE member.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY member.member_id;
SELECT expense_description FROM expense WHERE link_to_member = 'Sacha Harrison';
SELECT expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large'
SELECT DISTINCT z.zip_code  FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN zip_code z ON m.zip = z.zip_code WHERE e.cost < 50;
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';
SELECT DISTINCT member.position FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business';
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium';
SELECT DISTINCT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;
SELECT DISTINCT category FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.location = 'MU 215';
SELECT category FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_date = '2020-03-24T12:00:00';
SELECT major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';
SELECT CAST(SUM(CASE WHEN position = 'Member' AND major_name = 'Mathematics' THEN 1 ELSE 0 END) AS REAL) / COUNT(member_id) * 100 FROM member JOIN major ON member.link_to_major = major.major_id;
SELECT DISTINCT category FROM event WHERE location = 'MU 215';
SELECT COUNT(*) FROM income WHERE amount = 50;
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';
SELECT m.last_name, m.major_id, major.department, major.college FROM member m JOIN major ON m.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering';
SELECT DISTINCT budget.category FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.spent = 0;
SELECT DISTINCT z.city, z.state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';
SELECT e.event_name FROM event e JOIN member m ON e.event_id = a.link_to_event JOIN attendance a ON m.member_id = a.link_to_member JOIN zip_code z ON m.zip = z.zip_code WHERE e.type = 'Social' AND m.position = 'Vice President' AND z.city = 'Student_Club' AND z.zip_code = 900;
SELECT last_name, position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';
SELECT last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON event.event_id = attendance.link_to_event WHERE event.event_name = 'Women''s Soccer' AND member.position = 'Member';
SELECT CAST(COUNT(CASE WHEN member.t_shirt_size = 'Medium' AND member.position = 'Member' AND income.amount = 50 THEN income.amount END) AS REAL) / COUNT(member.member_id) * 100 AS percentage FROM member JOIN income ON member.member_id = income.link_to_member WHERE member.t_shirt_size = 'Medium' AND member.position = 'Member';
SELECT DISTINCT z.country FROM zip_code z WHERE z.type = 'PO Box';
SELECT DISTINCT z.zip_code  FROM zip_code z WHERE z.type = 'PO Box'  AND z.country = 'San Juan Municipio'  AND z.state = 'Puerto Rico';
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';
SELECT e.event_id FROM event e JOIN income i ON e.event_id = i.link_to_event JOIN member m ON i.link_to_member = m.member_id WHERE i.amount > 50;
SELECT DISTINCT m.member_id, m.first_name, m.last_name, e.event_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN expense ex ON m.member_id = ex.link_to_member WHERE ex.approved = 'true' AND ex.expense_date BETWEEN '2019-01-10' AND '2019-11-19';
SELECT DISTINCT e.event_id, e.event_name, e.event_date, e.type, e.notes, e.location, e.status FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Katy' AND ma.major_id = 'rec1N0upiVLy5esTO';
SELECT phone FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business' AND college = 'College of Agriculture and Applied Sciences');
SELECT DISTINCT member.email FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND expense.cost > 20;
SELECT COUNT(*) FROM member WHERE major_id IN (SELECT major_id FROM major WHERE major_name = 'education' AND college = 'College of Education & Human Services') AND position = 'Member';
SELECT CAST(SUM(CASE WHEN budget.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event.event_id) AS percentage_of_events_over_budget FROM event JOIN budget ON event.event_id = budget.link_to_event;
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';
SELECT expense_description FROM expense GROUP BY expense_description HAVING SUM(cost) / COUNT(expense_id) > 50;
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';
SELECT CAST(SUM(CASE WHEN zip_code.type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) / COUNT(zip_code.zip_code) * 100 AS percentage_of_po_boxes FROM zip_code;
SELECT event.event_name, event.location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0;
SELECT event.event_name, event.event_date FROM event INNER JOIN expense ON event.event_id = expense.link_to_event WHERE expense.expense_description = 'Pizza' AND expense.cost > 50 AND expense.cost < 100;
SELECT e.event_name, m.major_name  FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.cost > 100;
SELECT DISTINCT T2.city, T2.country FROM event AS T1 JOIN zip_code AS T2 ON T1.location = T2.zip_code JOIN (     SELECT link_to_event     FROM income     GROUP BY link_to_event     HAVING COUNT(*) > 40 ) AS T3 ON T1.event_id = T3.link_to_event;
SELECT member.first_name, member.last_name, SUM(expense.cost) AS total_expense FROM member JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.member_id HAVING COUNT(DISTINCT expense.event_id) > 1 ORDER BY total_expense DESC LIMIT 1;
SELECT AVG(cost) AS average_amount_paid FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.position != 'Member'
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget WHERE expense.category = 'Parking' GROUP BY event.event_name HAVING AVG(expense.cost) < (SELECT AVG(cost) FROM expense WHERE expense.category = 'Parking')
SELECT CAST(SUM(expense.cost) AS REAL) * 100 / COUNT(DISTINCT event.event_id) AS percentage_game_cost FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.type = 'Game'
SELECT MAX(`cost`) AS max_cost, `link_to_event` FROM `expense` WHERE `expense_description` = 'Water, chips, cookies' GROUP BY `link_to_event` ORDER BY max_cost DESC LIMIT 1;
SELECT CONCAT(member.first_name, ' ', member.last_name) AS full_name, MAX(expense.cost) AS total_spending FROM member JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.member_id ORDER BY total_spending DESC LIMIT 5;
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense);
SELECT   SUBTRACT(     DIVIDE(       SUM(CASE WHEN member.zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maine') THEN 1 ELSE 0 END),       COUNT(CASE WHEN position = 'Member' THEN 1 END)     ),     DIVIDE(       SUM(CASE WHEN member.zip IN (SELECT zip_code FROM zip_code WHERE state = 'Vermont') THEN 1 ELSE 0 END),       COUNT(CASE WHEN position = 'Member' THEN 1 END)     )   ) AS percentage_difference FROM   member JOIN   zip_code ON member.zip = zip_code.zip_code;
SELECT major_name, department  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';
SELECT CONCAT(member.first_name, ' ', member.last_name) AS full_name, expense.cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_description = 'Water, Veggie tray, supplies';
SELECT last_name, phone FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Elementary Education');
SELECT category, amount FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'January Speaker')
SELECT DISTINCT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';
SELECT first_name, last_name, amount FROM member JOIN income ON member.member_id = income.link_to_member WHERE date_received = '2019-09-09';
SELECT category FROM budget JOIN expense ON budget.link_to_event = expense.link_to_budget WHERE expense.expense_description = 'Posters';
SELECT first_name || ' ' || last_name AS full_name, college FROM member WHERE position = 'Secretary';
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;
SELECT city FROM zip_code WHERE zip = (SELECT zip FROM member WHERE last_name = 'Girke' AND first_name = 'Garrett');
SELECT first_name, last_name, position FROM member WHERE zip = 28092 AND EXISTS (SELECT 1 FROM zip_code WHERE member.zip = zip_code.zip_code AND zip_code.city = 'Lincolnton' AND zip_code.state = 'North Carolina');
SELECT COUNT(DISTINCT GasStationID) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';
SELECT CAST(COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) AS REAL) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) AS ratio FROM customers;
SELECT c.CustomerID, c.Segment, SUM(t.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth t ON c.CustomerID = t.CustomerID WHERE c.Segment = 'LAM' AND t.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID, c.Segment ORDER BY TotalConsumption ASC LIMIT 1;
SELECT AVG(Consumption) / 12 AS avg_monthly_consumption FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'SME' ) AND Date BETWEEN '201301' AND '201312';
SELECT c.CustomerID, c.Segment, SUM(t.Consumption) AS TotalConsumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth y ON t.TransactionID = y.TransactionID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID, c.Segment ORDER BY TotalConsumption DESC LIMIT 1;
SELECT COUNT(DISTINCT customers.CustomerID) FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE customers.Segment = 'KAM' AND yearmonth.Consumption < 30000 AND yearmonth.Date BETWEEN '201201' AND '201212';
SELECT SUM(CASE WHEN customers.Currency = 'CZK' THEN yearmonth.Consumption ELSE 0 END) - SUM(CASE WHEN customers.Currency = 'EUR' THEN yearmonth.Consumption ELSE 0 END) AS Difference_In_Consumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency IN ('CZK', 'EUR') AND yearmonth.Date BETWEEN '201201' AND '201212';
SELECT Date FROM yearmonth WHERE Currency = 'EUR' GROUP BY Date ORDER BY SUM(Consumption) DESC LIMIT 1;
SELECT Segment FROM customers GROUP BY Segment ORDER BY SUM(yearmonth.Consumption) ASC LIMIT 1;
SELECT Year, SUM(Consumption) AS TotalConsumption FROM (   SELECT SUBSTR(Date, 1, 4) AS Year, Consumption   FROM yearmonth   WHERE Currency = 'CZK' ) AS SubQuery GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;
SELECT Date AS PeakMonth FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date LIKE '2013%' GROUP BY Date ORDER BY Consumption DESC LIMIT 1;
WITH low_consumption_customers AS (   SELECT Segment, COUNT(*) as num_customers, SUM(Consumption) as total_consumption   FROM yearmonth   WHERE Date BETWEEN '201301' AND '201312'   GROUP BY Segment   ORDER BY total_consumption   LIMIT 1 )  SELECT CAST(low_consumption_customers.total_consumption AS REAL) / low_consumption_customers.num_customers AS avg_annual_consumption_sme,        0 AS avg_annual_consumption_lam FROM low_consumption_customers WHERE Segment = 'SME'  UNION ALL  SELECT 0 AS avg_annual_consumption_sme,        CAST(low_consumption_customers.total_consumption AS REAL) / low_consumption_customers.num_customers AS avg_annual_consumption_lam FROM low_consumption_customers WHERE Segment = 'LAM'  ORDER BY Segment; 
SELECT      Segment,     MAX(PercentageIncrease) AS BiggestIncrease,     MIN(PercentageIncrease) AS LowestDecrease FROM (     SELECT          c.Segment,         ym2013.Consumption AS Consumption2013,         ym2012.Consumption AS Consumption2012,         ((ym2013.Consumption - ym2012.Consumption) / ym2013.Consumption) * 100 AS PercentageIncrease     FROM          customers c         JOIN yearmonth ym2013 ON c.CustomerID = ym2013.CustomerID AND ym2013.Date LIKE '2013%'         JOIN yearmonth ym2012 ON c.CustomerID = ym2012.CustomerID AND ym2012.Date LIKE '2012%'     WHERE          c.Currency = 'EUR'         AND c.Segment IN ('SME', 'LAM', 'KAM') ) subquery GROUP BY Segment;
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';
SELECT COUNT(*) - (SELECT COUNT(*) FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'Discount') AS Difference FROM gasstations WHERE Country = 'Czech Republic' AND Segment = 'Discount';
SELECT SUM(yearmonth.Consumption) - (SELECT SUM(yearmonth.Consumption) FROM yearmonth WHERE yearmonth.CustomerID = 5 AND substr(yearmonth.Date, 1, 4) = '2013' AND substr(yearmonth.Date, 6, 2) = '04') AS Difference FROM yearmonth WHERE yearmonth.CustomerID = 7 AND substr(yearmonth.Date, 1, 4) = '2013' AND substr(yearmonth.Date, 6, 2) = '04';
SELECT COUNT(DISTINCT CASE WHEN customers.Currency = 'CZK' THEN customers.CustomerID ELSE NULL END) - COUNT(DISTINCT CASE WHEN customers.Currency = 'EUR' THEN customers.CustomerID ELSE NULL END) AS Difference FROM customers WHERE customers.Segment = 'SME';
SELECT c.CustomerID, c.Segment, c.Currency, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;
SELECT c.CustomerID, SUM(t.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth t ON c.CustomerID = t.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND Date = '201305'
SELECT CAST(COUNT(CASE WHEN yearmonth.Consumption > 46.73 THEN 1 END) AS REAL) * 100 / COUNT(*)  FROM yearmonth  JOIN customers ON yearmonth.CustomerID = customers.CustomerID  WHERE customers.Segment = 'LAM'
SELECT Country, COUNT(*) AS ValueForMoneyGasStations FROM gasstations WHERE Segment = 'LAM' GROUP BY Country ORDER BY CAST(SUM(Amount) AS REAL) / SUM(Price) DESC LIMIT 1;
SELECT CAST(COUNT(DISTINCT CASE WHEN customers.Segment = 'KAM' AND customers.Currency = 'EUR' THEN customers.CustomerID END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN customers.Segment = 'KAM' THEN customers.CustomerID END) FROM customers;
SELECT CAST(COUNT(DISTINCT CASE WHEN yearmonth.Consumption > 528.3 THEN customers.CustomerID END) AS REAL) * 100 / COUNT(DISTINCT customers.CustomerID) FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE yearmonth.Date = '201202';
SELECT CAST(COUNT(CASE WHEN gasstations.Country = 'Slovakia' AND gasstations.Segment = 'Premium' THEN gasstations.GasStationID END) AS REAL) * 100 / COUNT(gasstations.GasStationID) FROM gasstations WHERE gasstations.Country = 'Slovakia';
SELECT t1.CustomerID, SUM(t2.Consumption) AS TotalConsumption FROM customers t1 JOIN yearmonth t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Date = '201309' GROUP BY t1.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;
SELECT Segment, MIN(Consumption) AS LeastConsumption FROM yearmonth WHERE Date = '201309' GROUP BY Segment ORDER BY LeastConsumption ASC LIMIT 1;
SELECT c.CustomerID, c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' GROUP BY c.CustomerID, c.Segment ORDER BY TotalConsumption ASC LIMIT 1;
SELECT MAX(Consumption) AS HighestConsumption FROM yearmonth WHERE strftime('%Y', Date) = '2012';
SELECT MAX(monthly_consumption) AS biggest_monthly_consumption FROM ( SELECT CAST(SUM(yearmonth.Consumption) AS REAL) / 12 AS monthly_consumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR' GROUP BY yearmonth.Date, customers.CustomerID ) AS monthly_data;
SELECT Description FROM products JOIN transactions_1k ON products.ProductID = transactions_1k.ProductID JOIN yearmonth ON transactions_1k.TransactionID = yearmonth.TransactionID WHERE strftime('%Y%m', yearmonth.Date) = '201309'
SELECT DISTINCT Country FROM gasstations WHERE GasStationID IN (SELECT GasStationID FROM transactions_1k WHERE strftime('%Y%m', Date) = '201306');
SELECT DISTINCT gasstations.ChainID FROM gasstations JOIN transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID WHERE transactions_1k.Amount IS NOT NULL AND customers.Currency = 'EUR' GROUP BY gasstations.ChainID;
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';
SELECT AVG(Price * Amount) AS AverageTotalPrice FROM transactions_1k WHERE Date LIKE '2012-01%' ;
SELECT COUNT(DISTINCT c.CustomerID) AS NumCustomers FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;
SELECT products.Description FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE gasstations.Country = 'CZE' AND customers.Currency = 'EUR';
SELECT DISTINCT strftime('%Y-%m-%d %H:%M:%S', Time) AS TransactionTime FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11);
SELECT COUNT(*) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE') AND Price > 1000;
SELECT COUNT(*) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE') AND Date > '2012-01-01';
SELECT AVG(Price * Amount) AS AverageTotalPrice FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE';
SELECT AVG(Amount * Price) AS AverageTotalPrice FROM transactions_1k WHERE Currency = 'EUR';
SELECT c.CustomerID, SUM(t.Amount) AS TotalPaid FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY TotalPaid DESC LIMIT 1;
SELECT Country FROM gasstations WHERE GasStationID = (     SELECT GasStationID     FROM transactions_1k     WHERE Date = '2012-08-25'     ORDER BY TransactionID ASC     LIMIT 1 );
SELECT DISTINCT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';
SELECT Segment FROM customers WHERE CustomerID = (     SELECT CustomerID FROM transactions_1k T1     WHERE Date = '2012-08-23' AND T1.time = '21:20:00' );
SELECT COUNT(*)  FROM transactions_1k  WHERE Date = '2012-08-26'  AND Time < '13:00:00'  AND Currency = 'EUR';
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers);
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00';
SELECT ProductID FROM transactions_1k AS T1 WHERE Date = '2012-08-23' AND T1.time = '21:20:00';
SELECT t2.Consumption, t2.Date FROM yearmonth t2 JOIN transactions_1k t1 ON t2.CustomerID = t1.CustomerID WHERE t1.Amount = 124.05 AND t1.Date = '2012-08-24' AND t2.Date = '2012-01-01'
SELECT COUNT(*) FROM transactions_1k WHERE Time BETWEEN '08:00:00' AND '09:00:00' AND Date = '2012-08-26' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE');
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date LIKE '201306%' AND y.Consumption = 214582.17;
SELECT c.Country FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.CardID = 667467;
SELECT DISTINCT c.Country FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE t.Amount = 5484 AND y.Date = '2012-08-24';
SELECT CAST(COUNT(DISTINCT CASE WHEN customers.Currency = 'EUR' AND yearmonth.Date = '2012-08-25' THEN customers.CustomerID END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN yearmonth.Date = '2012-08-25' THEN customers.CustomerID END) FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID;
SELECT ((t1.Consumption - t2.Consumption) / t1.Consumption) AS decrease_rate FROM yearmonth t1 JOIN yearmonth t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Date = '2012-08-25' AND t1.Consumption = 634.8 AND t2.Date = '2013-08-25'
SELECT GasStationID, SUM(Amount * Price) AS TotalRevenue FROM transactions_1k GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;
SELECT      (SUM(CASE WHEN products.Description = 'premium' THEN yearmonth.Consumption ELSE 0 END) * 100 / SUM(yearmonth.Consumption)) AS percentage_of_premium FROM      yearmonth JOIN      transactions_1k ON yearmonth.TransactionID = transactions_1k.TransactionID JOIN      gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE      gasstations.Country = 'SVK'
SELECT SUM(transactions_1k.Amount) AS TotalAmount,        SUM(CASE WHEN strftime('%Y%m', transactions_1k.Date) = '201201' THEN transactions_1k.Amount ELSE 0 END) AS Jan2012Amount FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.CustomerID = 38508; 
SELECT Description FROM products ORDER BY COUNT(*) DESC LIMIT 5;
SELECT c.CustomerID, AVG(t.Price) AS avg_price_per_item, c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(t.Amount) DESC LIMIT 1;
SELECT Country FROM gasstations WHERE GasStationID = (     SELECT GasStationID     FROM transactions_1k     WHERE ProductID = 2     ORDER BY Price DESC     LIMIT 1 );
SELECT c.CustomerID, y.Consumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN products p ON t.ProductID = p.ProductID JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE t.Price / t.Amount > 29.00 AND p.ProductID = 5 AND y.Date LIKE '201208%'
