SELECT MAX(`Percent (%) Eligible Free (K-12)`)  FROM frpm  WHERE `County` = 'Alameda'  AND `Low Grade` = 'K'  AND `High Grade` = '12';	california_schools
SELECT `Percent (%) Eligible Free (Ages 5-17)`  FROM frpm  WHERE `School Type` = 'Continuation Schools'  ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC  LIMIT 3;	california_schools
SELECT Zip FROM frpm WHERE `County Name` = 'Fresno County Office of Education' AND `Charter School (Y/N)` = 1;	california_schools
SELECT schools.MailStreet, schools.MailCity, schools.MailState FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.`Low Grade` = 'K' AND frpm.`High Grade` = '12' AND frpm.`FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm     WHERE `Low Grade` = 'K' AND `High Grade` = '12' ) ORDER BY frpm.`FRPM Count (K-12)` DESC LIMIT 1;	california_schools
SELECT Phone FROM schools WHERE Charter = 1 AND FundingType = 'Directly funded' AND OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*)  FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.AvgScrMath < 400 AND s.Virtual = 'F' AND s.LastUpdate IS NOT NULL;	california_schools
SELECT s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 > 500 AND s.Magnet = 1;	california_schools
SELECT Phone FROM schools WHERE CDSCode IN (     SELECT CDSCode     FROM satscores     WHERE NumGE1500 = (         SELECT MAX(NumGE1500)         FROM satscores     ) ) ORDER BY NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(*) AS num_test_takers FROM satscores WHERE cds IN (     SELECT CDSCode     FROM frpm     WHERE Academic_Year = '2014-2015'     AND Enrollment (K-12) = (         SELECT MAX(Enrollment (K-12))         FROM frpm         WHERE Academic_Year = '2014-2015'         AND FRPM_Count (K-12) IS NOT NULL     ) )	california_schools
SELECT COUNT(*)  FROM satscores ss JOIN frpm f ON ss.cds = f.CDSCode WHERE ss.AvgScrMath > 560 AND f.CharterFundingType = 'Directly funded';	california_schools
SELECT frpm.FRPM_Count (Ages 5-17) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrRead = (   SELECT MAX(AvgScrRead)   FROM satscores ) ORDER BY satscores.AvgScrRead DESC LIMIT 1;	california_schools
SELECT CDSCode FROM frpm WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500;	california_schools
SELECT MAX(`Percent (%) Eligible Free (Ages 5-17)`)  FROM satscores  JOIN frpm ON satscores.cds = frpm.CDSCode  WHERE AvgScrRead >= 1500 / NumTstTakr AND AvgScrMath >= 1500 / NumTstTakr AND AvgScrWrite >= 1500 / NumTstTakr;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrRead IS NOT NULL AND ss.AvgScrMath IS NOT NULL AND ss.AvgScrWrite IS NOT NULL ORDER BY (ss.NumGE1500 / ss.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT schools.NCESSchool, COUNT(*) AS Enrollment FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`Enrollment (Ages 5-17)` IS NOT NULL GROUP BY schools.NCESSchool ORDER BY Enrollment DESC LIMIT 5;	california_schools
SELECT District, AVG(AvgScrRead) AS AverageReadingScore FROM satscores WHERE StatusType = 'Active' GROUP BY District ORDER BY AverageReadingScore DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Alameda'  AND cds IN (SELECT CDSCode FROM frpm WHERE AcademicYear = '2014-2015')  AND cds IN (SELECT cds FROM satscores WHERE NumTstTakr < 100);	california_schools
SELECT CharterNum FROM schools WHERE CDSCode IN (     SELECT CDSCode     FROM satscores     WHERE AvgScrWrite = 499 ) AND Charter = 1;	california_schools
SELECT COUNT(*)  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE County = 'Contra Costa'  AND frpm.FundingType = 'Directly funded'  AND frpm.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath = (     SELECT MAX(AvgScrMath)     FROM satscores ) GROUP BY s.Phone;	california_schools
SELECT COUNT(*) FROM frpm WHERE County = 'Amador' AND LowGrade = '9' AND HighGrade = '12';	california_schools
SELECT COUNT(*) AS school_count FROM frpm WHERE `County Name` = 'Los Angeles' AND (`Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700);	california_schools
SELECT s.School, COUNT(s.sname) AS TestTakers FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Contra Costa' GROUP BY s.School ORDER BY TestTakers DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.StreetAbr, s.City, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE ABS(f.Enrollment (K-12) - f.Enrollment (Ages 5-17)) > 30;	california_schools
SELECT s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.Percent (%) Eligible Free (K-12) > 0.1 AND f.AvgScrMath >= 1500;	california_schools
SELECT s.School, s.FundingType FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath > 400 AND s.County = 'Riverside';	california_schools
SELECT S.School, S.Street, S.StreetAbr, S.City, S.State, S.Zip FROM schools S JOIN satscores SS ON S.CDSCode = SS.cds WHERE S.StatusType = 'High Schools (Public)' AND SS.AvgScrMath IS NOT NULL -- Assuming AvgScrMath is an indicator of a high school AND (SS.enroll12 >= 800 OR SS.NumTstTakr >= 800) -- Checking for either enrollment or number of test takers greater than 800 AND S.County = 'Monterey'; -- Limiting to Monterey County	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.OpenDate > '1991-01-01' AND (s.ClosedDate < '2000-01-01' OR s.ClosedDate IS NULL) AND ss.AvgScrWrite IS NOT NULL;	california_schools
SELECT s.School, s.DOCType FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.FundingType = 'Directly funded' AND f.Enrollment (K-12) - f.Enrollment (Ages 5-17) > (     SELECT AVG(Enrollment (K-12) - Enrollment (Ages 5-17))     FROM frpm     WHERE FundingType = 'Directly funded' )	california_schools
SELECT OpenDate FROM schools WHERE StatusType = 'K-12 Schools (Public)' AND Enrollment (K-12) = (     SELECT MAX(Enrollment (K-12))     FROM schools     WHERE StatusType = 'K-12 Schools (Public)' ) ORDER BY OpenDate LIMIT 1;	california_schools
SELECT City FROM frpm WHERE `High Grade` = '12' AND `Low Grade` = '1' GROUP BY City ORDER BY Enrollment (K-12) ASC LIMIT 5;	california_schools
SELECT      s.CDSCode,      (s.FreeMealCount AS 'Free Meal Count (K-12)', s.Enrollment AS 'Enrollment (K-12)') AS 'Eligible Free Rate',     (s.FreeMealCount / s.Enrollment) * 100 AS 'Eligible Free Rate (%)' FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.`Low Grade` = '9' AND f.`High Grade` = '12'  ORDER BY      s.Enrollment DESC LIMIT 10;	california_schools
SELECT S.School, (F.FRPM_Count_K_12 / F.Enrollment_K_12) AS Eligibility_Rate FROM schools S JOIN frpm F ON S.CDSCode = F.CDSCode WHERE S.OwnershipCode = '66' ORDER BY F.FRPM_Count_K_12 DESC LIMIT 5;	california_schools
SELECT S.School, S.Website FROM schools S JOIN frpm F ON S.CDSCode = F.CDSCode WHERE F.FreeMealCount (Ages 5-17) BETWEEN 1900 AND 2000;	california_schools
SELECT      `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS FreeRate FROM      frpm WHERE      `School Name` = 'Kacey Gibson School' AND     `School Type` = 'Elementary Schools (Public)' AND     `Educational Option Type` IS NULL;	california_schools
SELECT AdmEmail1 FROM frpm WHERE Charter School (Y/N) = 1 AND Enrollment (K-12) = (SELECT MIN(Enrollment (K-12)) FROM frpm WHERE Charter School (Y/N) = 1)	california_schools
SELECT s.AdmFName1, s.AdmLName1 FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 > 0 GROUP BY s.CDSCode ORDER BY ss.NumTstTakr DESC LIMIT 1;	california_schools
SELECT Street, City, Zip, State FROM schools WHERE (NumGE1500 / NumTstTakr) = (     SELECT MIN(NumGE1500 / NumTstTakr)     FROM satscores ) AND CDSCode IN (SELECT CDSCode FROM satscores);	california_schools
SELECT s.Website FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Los Angeles' AND sc.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(NumTstTakr) AS AverageTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Fresno' AND schools.OpenDate BETWEEN '1980-01-01' AND '1980-12-31';	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' AND ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores WHERE District = 'Fresno Unified') ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.School, AVG(s.AvgScrRead) AS avg_reading_score FROM schools s WHERE s.Virtual = 'F' GROUP BY s.School ORDER BY avg_reading_score DESC LIMIT 5;	california_schools
SELECT School_Type FROM schools WHERE CDSCode IN (     SELECT CDSCode     FROM satscores     WHERE AvgScrMath = (         SELECT MAX(AvgScrMath)         FROM satscores     ) )	california_schools
SELECT AVG(s.AvgScrMath) AS avg_math_score, s.County FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath = (     SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite)     FROM satscores     WHERE cds IN (SELECT CDSCode FROM schools) ) GROUP BY s.County;	california_schools
SELECT AVG(s.AvgScrWrite) AS avg_writing_score, s.City FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.NumGE1500 = (     SELECT MAX(NumGE1500)     FROM satscores ) GROUP BY s.City;	california_schools
SELECT s.School, AVG(sats.AvgScrWrite) AS AverageWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci Ulrich' OR s.AdmLName1 = 'Ricci Ulrich' GROUP BY s.School;	california_schools
SELECT COUNT(*) AS Enrollments FROM frpm WHERE `School Type` = 'State Special Schools' AND `Low Grade` = 'K' AND `High Grade` = '12' AND DOC = 31 GROUP BY CDSCode ORDER BY Enrollments DESC LIMIT 1;	california_schools
SELECT COUNT(*) / 12 AS MonthlyAverage FROM schools WHERE County = 'Alameda' AND DOC = '52' AND YEAR(OpenDate) = 1980;	california_schools
SELECT     (COUNT(*) FILTER (WHERE schools.DOC = 54 AND schools.County = 'Orange County' AND frpm.DistrictCode = schools.District)) AS Unified_School_District_Count,     (COUNT(*) FILTER (WHERE schools.DOC = 52 AND schools.County = 'Orange County' AND frpm.DistrictCode = schools.District)) AS Elementary_School_District_Count,     CAST(COUNT(*) FILTER (WHERE schools.DOC = 54 AND schools.County = 'Orange County' AND frpm.DistrictCode = schools.District) AS REAL) / COUNT(*) FILTER (WHERE schools.DOC = 52 AND schools.County = 'Orange County' AND frpm.DistrictCode = schools.District) AS Ratio FROM     frpm JOIN     schools ON frpm.CDSCode = schools.CDSCode WHERE     schools.County = 'Orange County' AND (schools.DOC = 54 OR schools.DOC = 52);	california_schools
SELECT s.County, s.School, s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed' ORDER BY COUNT(s.CDSCode) DESC LIMIT 1;	california_schools
SELECT s.School, s.Street FROM schools s WHERE s.CDSCode IN (     SELECT CDSCode     FROM satscores     ORDER BY AvgScrMath DESC     LIMIT 1 OFFSET 5 ) ORDER BY s.Street ASC LIMIT 1;	california_schools
SELECT s.MailStreet, s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrRead = (     SELECT MIN(AvgScrRead)     FROM satscores ) ORDER BY ss.AvgScrRead ASC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.MailCity = 'Lakeport'  AND satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite >= 1500;	california_schools
SELECT COUNT(*)  FROM satscores  WHERE CDS IN (SELECT CDSCode FROM schools WHERE MailCity = 'Fresno');	california_schools
SELECT s.CDSCode, s.MailZip FROM schools s WHERE AdmFName1 = 'Avetik Atoian' OR AdmLName1 = 'Avetik Atoian' OR AdmFName2 = 'Avetik Atoian' OR AdmLName2 = 'Avetik Atoian' OR AdmFName3 = 'Avetik Atoian' OR AdmLName3 = 'Avetik Atoian';	california_schools
SELECT COUNT(CASE WHEN County = 'Colusa' THEN 1 END) AS count_Colusa,        COUNT(CASE WHEN County = 'Humboldt' THEN 1 END) AS count_Humboldt,        (COUNT(CASE WHEN County = 'Colusa' THEN 1 END) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 END)) AS ratio FROM schools WHERE MailState = 'California';	california_schools
SELECT COUNT(*) AS ActiveSchoolsInSanJoaquin FROM schools WHERE MailState = 'California' AND StatusType = 'Active' AND District = 'San Joaquin';	california_schools
SELECT Phone, Ext FROM schools WHERE CDSCode IN (     SELECT CDSCode     FROM (         SELECT CDSCode, AVG(AvgScrWrite) AS avg_write_score         FROM satscores         GROUP BY CDSCode         ORDER BY avg_write_score DESC         LIMIT 332     ) AS top_scores )	california_schools
SELECT Phone, Ext FROM schools WHERE Zip = '95203-3704';	california_schools
SELECT s.Website FROM schools s WHERE s.AdmFName1 = 'Mike Larson' OR s.AdmFName2 = 'Mike Larson' OR s.AdmFName3 = 'Mike Larson' OR s.AdmLName1 = 'Mike Larson' OR s.AdmLName2 = 'Mike Larson' OR s.AdmLName3 = 'Mike Larson' AND (s.AdmFName1 = 'Dante Alvarez' OR s.AdmFName2 = 'Dante Alvarez' OR s.AdmFName3 = 'Dante Alvarez') OR (s.AdmLName1 = 'Dante Alvarez' OR s.AdmLName2 = 'Dante Alvarez' OR s.AdmLName3 = 'Dante Alvarez');	california_schools
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin';	california_schools
SELECT COUNT(*)  FROM schools  WHERE Charter = 1  AND DOC = '52'  AND City = 'Hickman';	california_schools
SELECT COUNT(*) AS TotalNonChartered FROM frpm WHERE County = 'Los Angeles' AND Charter = 0 AND `Free Meal Count (K-12)` * 100 / `Enrollment (K-12)` < 0.18;	california_schools
SELECT S.School, S.City FROM schools S WHERE S.Charter = 1 AND S.CharterNum = '00D2' AND (S.AdmFName1 IS NOT NULL OR S.AdmFName2 IS NOT NULL OR S.AdmFName3 IS NOT NULL)	california_schools
SELECT COUNT(*) AS total_schools FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(schools.CDSCode) AS locally_funded_count_santa_clara,      COUNT(CASE WHEN frpm.CharterFundingType = 'Directly funded' THEN frpm.CDSCode END) AS total_charter_funded_count_santa_clara) AS counts,     (COUNT(schools.CDSCode) / COUNT(CASE WHEN frpm.CharterFundingType = 'Directly funded' THEN frpm.CDSCode END) * 100.0) AS funding_ratio_percentage FROM      schools JOIN      frpm ON schools.CDSCode = frpm.CDSCode WHERE      schools.County = 'Santa Clara'     AND frpm.CharterFundingType = 'Directly funded';	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT SUM(CASE WHEN StatusType = 'Closed' AND Year = 1989 AND City = 'San Francisco' THEN 1 ELSE 0 END) AS Total_Closures FROM schools;	california_schools
SELECT COUNT(*) AS num_closures FROM schools WHERE SOC = 11 AND SUBSTR(OpenDate, 1, 4) BETWEEN '1980' AND '1989' GROUP BY County ORDER BY num_closures DESC LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31';	california_schools
SELECT COUNT(*) AS ActiveDCSDistricts FROM schools WHERE StatusType = 'District Community Day School' AND County = 'Alpine' AND (ClosedDate IS NULL OR ClosedDate >= CURRENT_DATE - INTERVAL '1 year');  SELECT COUNT(*) AS ClosedDCSDistricts FROM schools WHERE StatusType = 'District Community Day School' AND County = 'Alpine' AND ClosedDate IS NOT NULL;  UNION ALL  SELECT 0 AS Status, 'Total' AS StatusDescription, SUM(CASE WHEN ClosedDate IS NULL THEN 1 ELSE 0 END) + SUM(CASE WHEN ClosedDate IS NOT NULL THEN 1 ELSE 0 END) AS TotalDCSDistricts FROM schools WHERE County = 'Alpine' AND StatusType = 'District Community Day School';  This SQL query will provide the count of active and closed District Community Day Schools in the county of Alpine. It first separates the counts into two separate queries for active (schools with no closed date or a closed date within the last year) and closed schools. Then, it combines these counts using a UNION ALL and adds a row for the total number of active and closed schools combined.	california_schools
SELECT DISTINCT District Code FROM schools WHERE City = 'Fresno' AND Magnet = 0;	california_schools
SELECT COUNT(*)  FROM frpm WHERE School = 'State Special School' AND `Academic Year` = '2014-2015' AND `Enrollment (Ages 5-17)` > 0 AND EdOpsCode = 'SSS';	california_schools
SELECT `Free Meal Count (Ages 5-17)`  FROM frpm  WHERE School Name = 'Youth Authority School' AND MailStreet = 'PO Box 1040';	california_schools
SELECT MIN(`Low Grade`)  FROM frpm  WHERE `EdOpsCode` = 'SPECON'  AND `NCESDist` = '613360';	california_schools
SELECT S.School, S.StatusType FROM schools S JOIN frpm F ON S.CDSCode = F.CDSCode WHERE F.CountyCode = '37' AND F.EducationalOptionType = 'Breakfast Provision 2';	california_schools
SELECT School FROM schools WHERE County = 'Merced' AND EILCode = 'HS' AND GSoffered = 'Breakfast Provision 2' AND LowGrade = '9' AND HighGrade = '12';	california_schools
SELECT s.School,         ((ss.FreeMealCount(Ages 5-17) / ss.Enrollment(Ages 5-17)) * 100) AS Percent_Eligible_FRPM FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND f.LowGrade = 'K' AND f.HighGrade = '9' AND f.EducationalOptionType = 'Traditional';	california_schools
SELECT GradeSpanType, COUNT(*) as Count FROM schools WHERE City = 'Adelanto' GROUP BY GradeSpanType ORDER BY Count DESC LIMIT 1;	california_schools
SELECT COUNT(*) AS num_schools, County FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY num_schools DESC LIMIT 1;	california_schools
SELECT School_Type, School_Name, Latitude FROM schools WHERE Latitude = (SELECT MAX(Latitude) FROM schools) ORDER BY Latitude DESC LIMIT 1;	california_schools
SELECT s.School, s.Latitude FROM schools s WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1;	california_schools
SELECT DISTINCT School, `High Grade`, `Low Grade` FROM frpm WHERE CDSCode = (     SELECT CDSCode     FROM schools     ORDER BY Longitude DESC     LIMIT 1 );	california_schools
SELECT COUNT(*) as num_schools_with_multiple_provisions, COUNT(DISTINCT City) as num_cities, City FROM schools WHERE Magnet = 1 AND GSserved LIKE '%K-8%' GROUP BY City;	california_schools
SELECT AdmFName1, AdmFName2, District FROM schools WHERE AdmFName1 IS NOT NULL OR AdmFName2 IS NOT NULL GROUP BY AdmFName1, AdmFName2, District ORDER BY COUNT(*) DESC LIMIT 2;	california_schools
SELECT `District Code`,         ( `Free Meal Count (K-12)` / `Enrollment (K-12)` ) * 100 AS 'Percent (%) Eligible Free (K-12)' FROM frpm WHERE AdmFName1 = 'Alusine';	california_schools
SELECT AdmLName3, District, County, School FROM schools WHERE CharterNum = '40';	california_schools
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino'  AND District = 'San Bernardino City Unified' AND (SOC = '62' OR DOC = '54') AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31';	california_schools
SELECT s.School, s.AdmEmail1 FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 = (   SELECT MAX(NumGE1500)   FROM satscores ) ORDER BY ss.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(*)  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN card c ON d.card_id = c.card_id  JOIN client cl ON d.client_id = cl.client_id  JOIN district dt ON cl.district_id = dt.district_id  WHERE dt.A3 = 'East Bohemia'  AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague' AND account.frequency = 'POPLATEK MESICNE';	financial
SELECT      AVG(CASE WHEN year IN (1995, 1996) THEN A12 ELSE NULL END) AS avg_1995,     AVG(CASE WHEN year = 1995 THEN A12 ELSE NULL END) AS avg_1995_unemployment,     AVG(CASE WHEN year = 1996 THEN A13 ELSE NULL END) AS avg_1996_unemployment FROM      district WHERE      A12 IS NOT NULL OR A13 IS NOT NULL GROUP BY      year ORDER BY      avg_1995 DESC, avg_1996 DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM district  WHERE A11 > 6000 AND A11 < 10000 AND A2 = 'F'	financial
SELECT COUNT(*)  FROM client  WHERE gender = 'M' AND A3 = 'North Bohemia' AND A11 > 8000;	financial
SELECT a.account_id FROM account a JOIN client c ON a.client_id = c.client_id WHERE c.gender = 'F' AND c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE gender = 'F' ) AND a.A11 = (     SELECT MIN(A11)     FROM client     WHERE gender = 'F' ) GROUP BY a.account_id HAVING a.A11 = (     SELECT MAX(A11)     FROM client     WHERE gender = 'F' ) ORDER BY a.A11 DESC LIMIT 1 SELECT MAX(a.A11) - MIN(a.A11) AS gap FROM account a JOIN client c ON a.client_id = c.client_id WHERE c.gender = 'F' AND c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE gender = 'F' ) AND a.A11 = (     SELECT MIN(A11)     FROM client     WHERE gender = 'F' )	financial
SELECT a.account_id FROM account a JOIN client c ON a.client_id = c.client_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) AND a.A11 = (SELECT MAX(A11) FROM client) GROUP BY a.account_id;	financial
SELECT COUNT(*) FROM client WHERE client_id IN (     SELECT client_id     FROM disp     WHERE type = 'POPLATEK TYDNE' ) AND gender = 'OWNER';	financial
SELECT DISTINCT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN trans t ON d.card_id = t.account_id WHERE t.type = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.date FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date BETWEEN '1997-01-01' AND '1997-12-31' AND l.status = 'approved' AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id, a.date FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND YEAR(a.date) = 1993 ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'F' AND c.birth_date < '1950' AND a.district_id IN (SELECT district_id FROM district WHERE A2 = 'SLOKOLOV');	financial
SELECT * FROM account WHERE date = '1995-01-01' AND account_id IN (     SELECT account_id     FROM account     WHERE YEAR(date) = 1995     GROUP BY account_id     ORDER BY MIN(date) ASC     LIMIT 1 );	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.amount > 3000;	financial
SELECT client.client_id FROM client JOIN card ON client.client_id = card.client_id WHERE card.issued = '1994-03-03';	financial
SELECT date FROM account WHERE account_id IN (SELECT account_id FROM trans WHERE amount = 840 AND operation = 'DEPOSIT' AND bank = 'SOME_BANK' AND k_symbol = 'USD' AND date >= '1998-10-14') ORDER BY date LIMIT 1;	financial
SELECT district.district_id FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.date = '1994-08-25' AND loan.status = 'approved';	financial
SELECT MAX(amount) FROM trans JOIN card ON trans.account_id = card.account_id JOIN client ON card.client_id = client.client_id WHERE card.issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A11 = (   SELECT MAX(A11)   FROM district ) AND c.birth_date = (   SELECT MIN(birth_date)   FROM client   WHERE district_id IN (     SELECT district_id     FROM district     WHERE A11 = (       SELECT MAX(A11)       FROM district     )   ) );	financial
SELECT c.client_id, MIN(t.amount) AS first_transaction_amount FROM client c JOIN loan l ON c.client_id = l.account_id JOIN account a ON l.account_id = a.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'DEBIT' -- Assuming debit transactions are the first ones after opening the account GROUP BY c.client_id ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(*)  FROM client  JOIN disp ON client.client_id = disp.client_id  JOIN account ON disp.account_id = account.account_id  WHERE district.A2 = 'Jesenik' AND client.gender = 'F';	financial
SELECT disp.disp_id FROM disp JOIN client ON disp.client_id = client.client_id JOIN trans ON disp.account_id = trans.account_id WHERE trans.amount = 5100 AND trans.date >= '1998-09-01' AND trans.date <= '1998-09-30';	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date BETWEEN '1996-01-01' AND '1996-12-31';	financial
SELECT A2 FROM district WHERE district_id IN (SELECT district_id FROM client WHERE gender = 'F' AND birth_date = '1976-01-29');	financial
SELECT client.birth_date FROM client JOIN loan ON client.client_id = loan.account_id WHERE loan.amount = 98832 AND loan.date = '1996-01-03';	financial
SELECT account_id FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id WHERE A3 = 'Prague' AND client.client_id = (     SELECT MIN(client_id)     FROM client     JOIN disp ON client.client_id = disp.client_id     JOIN account ON disp.account_id = account.account_id     WHERE A3 = 'Prague' );	financial
SELECT (COUNT(*) FILTER (WHERE client.gender = 'M' AND district.A3 = 'SOUTH BOHEMIA') * 100.0) / COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE district.A4 IS NOT NULL;	financial
SELECT ((t2.balance - t1.balance) / t1.balance) * 100 AS increase_rate FROM account a JOIN trans t1 ON a.account_id = t1.account_id AND a.date = '1993-03-22' JOIN trans t2 ON a.account_id = t2.account_id AND a.date = '1998-12-27' WHERE a.client_id IN (     SELECT client_id     FROM loan     WHERE date = '1993-07-05'     ORDER BY loan_id     LIMIT 1 );	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS 'Percentage Fully Paid' FROM loan;	financial
SELECT      (SUM(CASE WHEN status = 'C' AND amount < 100000 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_running_no_issues FROM      loan;	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date >= '1993-01-01' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT a.account_id, a.frequency FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31' AND d.A2 = 'east Bohemia';	financial
SELECT account_id, date FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Prachatice');	financial
SELECT A2 AS district, A3 AS region FROM district WHERE loan_id = 4990;	financial
SELECT account.account_id, district.A2 AS district, district.A3 AS region FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.amount > 300000;	financial
SELECT l.loan_id, d.A3, AVG(d.A11) AS average_salary FROM loan l JOIN district d ON l.account_id = account.district_id WHERE l.duration = 60 GROUP BY l.loan_id, d.A3;	financial
SELECT d.A2 AS district,         ((d.A13 - COALESCE(d.A12, 0)) / COALESCE(d.A12, 0)) * 100 AS unemployment_increment_rate FROM district d JOIN loan l ON d.district_id = l.account_id WHERE l.status = 'D' AND l.date >= '1995-01-01' AND l.date < '1997-01-01';	financial
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM account WHERE date = '1993-01-01' AND district_id = (SELECT district_id FROM district WHERE A2 = 'Decin'))) AS percentage FROM account WHERE date = '1993-01-01' AND district_id = (SELECT district_id FROM district WHERE A2 = 'Decin');	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT district.A2, COUNT(*) as num_female_account_holders FROM district JOIN client ON district.district_id = client.district_id WHERE client.gender = 'F' GROUP BY district.A2 ORDER BY num_female_account_holders DESC LIMIT 10;	financial
SELECT A2 AS district_name, SUM(amount) AS total_withdrawals FROM trans JOIN account ON trans.account_id = account.account_id JOIN disp ON trans.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE trans.type = 'VYDAJ' AND date LIKE '1996-01%' GROUP BY district_name ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'South Bohemia'  AND account_id NOT IN (SELECT DISTINCT account_id FROM disp);	financial
SELECT A3 FROM district WHERE district_id IN (     SELECT district_id     FROM loan     WHERE status IN ('C', 'D') ) GROUP BY A3 ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT AVG(amount) as average_loan_amount FROM loan JOIN client ON loan.account_id = client.account_id WHERE client.gender = 'M';	financial
SELECT A2 AS district_name, disp.A3 AS branch_location FROM district JOIN disp ON district.district_id = disp.A4 WHERE A13 IS NOT NULL AND EXTRACT(YEAR FROM date) = 1996 ORDER BY A13 DESC;	financial
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE EXTRACT(YEAR FROM a.date) = 1996 AND d.A16 = (SELECT MAX(A16) FROM district WHERE EXTRACT(YEAR FROM A9) = 1996);	financial
SELECT COUNT(*)  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE a.frequency = 'POPLATEK MESICNE'  AND t.operation = 'VYBER KARTOU'  AND t.balance < 0;	financial
SELECT COUNT(*)  FROM loan  WHERE account_id IN (     SELECT account_id      FROM account      WHERE frequency = 'POPLATEK MESICNE' AND date BETWEEN '1995-01-01' AND '1997-12-31' ) AND amount >= 250000;	financial
SELECT COUNT(*)  FROM account  JOIN disp ON account.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  WHERE client.district_id = 1 AND (disp.type = 'C' OR (disp.type = 'D' AND trans.balance >= 0))	financial
SELECT COUNT(*)  FROM client  WHERE district_id = (SELECT district_id                      FROM district                      WHERE A15 = (SELECT MAX(A15)                                  FROM district                                  WHERE YEAR(date) = 1995                                  AND A15 < (SELECT MAX(A15)                                            FROM district                                            WHERE YEAR(date) = 1995)))  AND gender = 'M'	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE disp.type = 'gold' AND card.type = 'disponent';	financial
SELECT COUNT(*)  FROM account  WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek');	financial
SELECT district.A2, district.A3, district.A4, district.A5, district.A6, district.A7, district.A8, district.A9, district.A10, district.A11, district.A12, district.A13, district.A14, district.A15, district.A16 FROM district JOIN trans ON district.district_id = trans.account_id WHERE trans.date BETWEEN '1997-01-01' AND '1997-12-31' AND amount > 10000;	financial
SELECT a.account_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.k_symbol = 'SIPO' AND a.district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek');	financial
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type IN ('GOLD', 'JUNIOR') AND d.client_id IS NOT NULL;	financial
SELECT AVG(amount) AS average_amount FROM trans WHERE type = 'VYBER KARTOU' AND YEAR(date) = 2021;	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.date >= '1998-01-01' AND t.date < '1999-01-01' AND t.type = 'VYBER KARTOU' GROUP BY a.account_id HAVING SUM(t.amount) / COUNT(*) < (SELECT AVG(SUM(amount)) / COUNT(*) FROM trans WHERE date BETWEEN '1998-01-01' AND '1998-12-31' AND type = 'VYBER KARTOU')	financial
SELECT c.client_id, c.gender FROM client c JOIN card cr ON c.client_id = cr.client_id JOIN disp dp ON c.client_id = dp.client_id JOIN account acc ON dp.account_id = acc.account_id JOIN loan ln ON acc.account_id = ln.account_id WHERE c.gender = 'F' AND cr.type = 'credit';	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' AND district.A3 = 'South Bohemia';	financial
SELECT * FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Tabor') AND type = 'OWNER';	financial
SELECT account.type FROM account JOIN district ON account.district_id = district.district_id WHERE account.type != 'OWNER' AND district.A11 > 8000 AND district.A11 <= 9000;	financial
SELECT COUNT(*) FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.bank LIKE 'AB' AND A3 = 'North Bohemia';	financial
SELECT DISTINCT district.A2 FROM district JOIN account ON district.district_id = account.district_id JOIN trans ON account.account_id = trans.account_id WHERE trans.type = 'VYDAJ';	financial
SELECT AVG(A15) as avg_crimes FROM district WHERE A3 IN (     SELECT DISTINCT district.A3     FROM district     JOIN account ON district.district_id = account.district_id     WHERE account.date >= '1997-01-01' AND account.date < '1998-01-01' ) AND A15 > 4000 AND EXTRACT(YEAR FROM date) = 1995;	financial
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE disp.type = 'CLASSIC'  AND EXISTS (     SELECT 1      FROM account      JOIN disp ON account.account_id = disp.account_id      WHERE account.type = 'OWNER' );	financial
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha' AND A10 = 'M') AND gender = 'M';	financial
SELECT (COUNT(*) FILTER (WHERE type = 'GOLD' AND issued < '1998-01-01') * 100.0) / COUNT(*) FROM card;	financial
SELECT client.client_id, client.gender, client.birth_date FROM client JOIN account ON client.district_id = account.district_id JOIN loan ON account.account_id = loan.account_id WHERE loan.amount = (SELECT MAX(loan_amount) FROM loan) ORDER BY loan.amount DESC LIMIT 1;	financial
SELECT COUNT(*) FROM account WHERE account_id = 532 AND date BETWEEN '1995-01-01' AND '1995-12-31' AND district_id IN (SELECT district_id FROM account WHERE account_id = 532);	financial
SELECT district_id FROM account WHERE account_id IN (SELECT account_id FROM order WHERE order_id = 33333);	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 3356 AND type = 'CASH WITHDRAWAL') AND operation = 'VYBER';	financial
SELECT COUNT(*)  FROM account  JOIN loan ON account.account_id = loan.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;	financial
SELECT c.type FROM client c JOIN disp d ON c.client_id = d.client_id WHERE c.client_id = 13539;	financial
SELECT A3 FROM district WHERE district_id = (SELECT district_id FROM client WHERE client_id = 3541);	financial
SELECT district.A2 FROM district JOIN account ON district.district_id = account.district_id JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'A' GROUP BY district.A2 ORDER BY COUNT(*) DESC LIMIT 1;	financial
SELECT client.client_id, client.gender, client.birth_date FROM client JOIN order ON client.client_id = order.account_id WHERE order.order_id = 32423;	financial
SELECT * FROM trans WHERE account_id IN (   SELECT account_id   FROM account   WHERE district_id = 5 );	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik');	financial
SELECT client.client_id FROM client JOIN card ON client.client_id = card.client_id WHERE card.type = 'junior' AND card.issued >= '1997-01-01';	financial
SELECT (COUNT(CASE WHEN client.gender = 'F' THEN 1 END) * 100.0 / COUNT(DISTINCT client.client_id)) AS percentage_women FROM client JOIN district ON client.district_id = district.district_id WHERE district.A11 > 10000;	financial
SELECT      ((SUM(CASE WHEN t2.date BETWEEN '1996-01-01' AND '1997-12-31' THEN t2.amount ELSE 0 END)       - SUM(CASE WHEN t1.date BETWEEN '1995-01-01' AND '1996-12-31' THEN t1.amount ELSE 0 END))      / SUM(CASE WHEN t1.date BETWEEN '1995-01-01' AND '1996-12-31' THEN t1.amount ELSE 0 END))     * 100 AS growth_rate FROM      trans AS t1 JOIN      trans AS t2 ON t1.account_id = t2.account_id JOIN      client AS c ON t1.account_id = c.client_id WHERE      c.gender = 'M';	financial
SELECT COUNT(*) FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE type = 'KARTA') AND operation = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT SUM(CASE WHEN A3 = 'A3' THEN A16 ELSE 0 END) AS total_crimes_east_1996,        SUM(CASE WHEN A3 = 'A16' THEN A16 ELSE 0 END) AS total_crimes_north_1996,        total_crimes_north_1996 - total_crimes_east_1996 AS crime_difference FROM district WHERE EXTRACT(YEAR FROM A9) = 1996;	financial
SELECT COUNT(DISTINCT case when T1.type = 'OWNER' then T1.disp_id else NULL end) as owner_dispositions,        COUNT(DISTINCT case when T1.type = 'DISPONENTER' then T1.disp_id else NULL end) as disponent_dispositions FROM account T1 WHERE T1.account_id BETWEEN 1 AND 10;	financial
SELECT COUNT(*) AS statement_requests FROM trans WHERE account_id = 3 AND type = 'statement';	financial
SELECT EXTRACT(YEAR FROM client.birth_date) FROM client WHERE client_id IN (     SELECT client_id     FROM disp     WHERE account_id = (         SELECT account_id         FROM account         WHERE account_id = 130     ) );	financial
SELECT COUNT(*) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN trans t ON a.account_id = t.account_id WHERE a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(l.loan_id IS NOT NULL * l.amount) AS debt_amount,         AVG(l.payments) AS average_payments FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c.client_id = 992 AND l.status = 'PAID';	financial
SELECT SUM(t.amount) AS total_amount, c.gender FROM trans t JOIN client c ON t.account_id = c.client_id WHERE c.client_id = 4 AND t.trans_id > 851 GROUP BY c.gender;	financial
SELECT type FROM card WHERE client_id = 9;	financial
SELECT SUM(amount) AS total_amount FROM trans WHERE client_id = 617 AND YEAR(date) = 1998;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A2 = 'East Bohemia';	financial
SELECT client.client_id FROM client JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'F' ORDER BY loan.amount DESC LIMIT 3;	financial
SELECT COUNT(*) FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN trans ON account.account_id = trans.account_id WHERE client.gender = 'M' AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND trans.type = 'SIPO' AND trans.amount > 4000;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Beroun' AND A12 IS NOT NULL) AND date > '1996-12-31';	financial
SELECT COUNT(*)  FROM client  JOIN card ON client.client_id = card.client_id  WHERE client.gender = 'F' AND card.type = 'junior';	financial
SELECT COUNT(CASE WHEN T2.gender = 'F' AND T1.A3 = 'PRAGUE' THEN 1 END) * 100.0 / COUNT(CASE WHEN T1.A3 = 'PRAGUE' THEN 1 END) AS proportion_female_customers FROM client T1 JOIN account T2 ON T1.client_id = T2.client_id WHERE T1.district_id = (SELECT district_id FROM district WHERE A3 = 'PRAGUE');	financial
SELECT (COUNT(CASE WHEN client.gender = 'M' AND account.frequency = 'POPLATEK TYDNE' THEN 1 END) / COUNT(CASE WHEN account.frequency = 'POPLATEK TYDNE' THEN 1 END)) * 100 AS 'Percentage_Male_Weekly_Statements' FROM client JOIN account ON client.client_id = account.client_id WHERE account.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(*) FROM client WHERE client_id IN (     SELECT client_id     FROM disp     WHERE type = 'POPLATEK TYDNE' );	financial
SELECT a.account_id, a.date FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN client c ON a.client_id = c.client_id WHERE c.gender = 'F' AND a.district_id = c.district_id AND a.district_id = (SELECT district_id                      FROM district                      WHERE A11 = (SELECT MIN(A11)                                  FROM district                                  WHERE A2 LIKE 'F%' AND A11 IS NOT NULL)) ORDER BY c.birth_date DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client WHERE birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND district_id IN (SELECT district_id FROM district WHERE A3 LIKE '%East Bohemia%');	financial
SELECT COUNT(*)  FROM loan  WHERE account_id IN (     SELECT account_id      FROM account      WHERE frequency = 'POPLATEK TYDNE'     AND date >= DATE_SUB(CURDATE(), INTERVAL 24 MONTH) );	financial
SELECT AVG(amount) as avg_loan_amount FROM loan WHERE status IN ('C', 'D') AND date <= (SELECT MAX(date) FROM trans WHERE trans.account_id = loan.account_id AND trans.type = 'POPLATEK PO OBRATU');	financial
SELECT c.client_id, d.district_id FROM client c JOIN account a ON c.client_id = a.client_id JOIN disp d ON a.account_id = d.account_id WHERE d.type IN ('PERMANENT ORDER', 'LOAN') AND NOT EXISTS (   SELECT 1   FROM trans t   WHERE t.account_id = a.account_id   AND t.type != 'ORDER' );	financial
SELECT client.client_id,         EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM client.birth_date) AS age FROM client JOIN card ON client.client_id = card.client_id WHERE card.type = 'GOLD' AND EXISTS (     SELECT 1     FROM loan     WHERE loan.account_id = client.client_id );	financial
SELECT bond_type, COUNT(*) AS count FROM bond GROUP BY bond_type ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(*)  FROM atom  WHERE element = 'cl'  AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT AVG(CASE WHEN atom.element = 'O' AND bond.bond_type = '-' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label IS NOT NULL;	toxicology
SELECT COUNT(CASE WHEN bond_type = '-' AND molecule.label = '+' THEN 1 END) / COUNT(DISTINCT atom_id) AS avg_carcinogenic_single_bonded FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id JOIN molecule ON atom.molecule_id = molecule.molecule_id;	toxicology
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE atom.element = 'na' AND molecule.label = '-'	toxicology
SELECT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT CAST(COUNT(*) AS REAL) * 100.0 / COUNT(DISTINCT CASE WHEN atom.element = 'c' THEN molecule_id END) AS carbon_percentage FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id2 = connected.atom_id WHERE connected.bond_id IS NOT NULL AND connected.bond_type = '=' GROUP BY molecule.molecule_id;	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type = '#'	toxicology
SELECT COUNT(*)  FROM atom  WHERE element != 'br'	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+';	toxicology
SELECT `molecule_id` FROM `atom` WHERE `element` = 'si';	toxicology
SELECT DISTINCT element FROM atom WHERE atom_id IN (   SELECT atom_id   FROM connected   WHERE bond_id = 'TR004_8_9' ) AND (element = 'cl' OR element = 'c' OR element = 'h' OR element = 'o' OR element = 's' OR element = 'n' OR element = 'p' OR element = 'na' OR element = 'br' OR element = 'f' OR element = 'i' OR element = 'sn' OR element = 'pb' OR element = 'te' OR element = 'ca');	toxicology
SELECT DISTINCT A.element FROM atom A JOIN connected C ON A.atom_id = C.atom_id OR A.atom_id2 = C.atom_id JOIN bond B ON C.bond_id = B.bond_id WHERE B.bond_type = ' = ' AND (A.element = 'cl' OR A.element = 'c')	toxicology
SELECT COUNT(*) AS count, label FROM atom WHERE element = 'h' GROUP BY label HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count, label FROM atom WHERE element = 'h' GROUP BY label) AS subquery) ORDER BY count DESC LIMIT 1;	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE atom.element = 'Te' AND bond.bond_type IS NOT NULL;	toxicology
SELECT DISTINCT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '-';	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.label = '-' AND a1.element IN ('H', 'C', 'N', 'O', 'S') -- Assuming these elements are considered non-carcinogenic AND a2.element IN ('H', 'C', 'N', 'O', 'S') GROUP BY a1.atom_id HAVING COUNT(DISTINCT a2.atom_id) >= 2;	toxicology
SELECT element FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '-' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (   SELECT molecule_id   FROM atom   WHERE atom_id = 'TR004_8' ) AND bond_id IN (   SELECT bond_id   FROM connected   WHERE atom_id = 'TR004_8' AND atom_id2 = 'TR004_20' );	toxicology
SELECT label FROM molecule WHERE molecule_id NOT IN (   SELECT DISTINCT molecule_id   FROM atom   WHERE element = 'Sn' ) AND label IN ('+', '-')	toxicology
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id2 = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'i' AND b.bond_type = '-' AND m.label IS NOT NULL GROUP BY a.molecule_id HAVING COUNT(*) = (SELECT COUNT(*) FROM atom ai IN (SELECT atom_id FROM atom WHERE element = 's') JOIN connected ci ON ai.atom_id = ci.atom_id JOIN bond bi ON ci.bond_id = bi.bond_id JOIN molecule mi ON ai.molecule_id = mi.molecule_id WHERE bi.bond_type = '-' AND mi.label IS NOT NULL);	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR181';	toxicology
SELECT (COUNT(CASE WHEN molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'f' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')) = 0) * 100.0 / COUNT(DISTINCT molecule_id)) AS percent FROM molecule WHERE label = '+'	toxicology
SELECT (SUM(CASE WHEN bond_type = '#' AND label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond_id)) AS percent FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id;	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' AND (element = 'cl' OR element = 'c' OR element = 'h') ORDER BY element ASC LIMIT 3;	toxicology
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE atom.molecule_id = 'TR001' AND bond.bond_id = 'TR001_2_6';	toxicology
SELECT difference FROM molecule WHERE label IN('+', '-')	toxicology
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2';	toxicology
SELECT T1.molecule_id, COUNT(T2.bond_id) AS num_double_bonds FROM molecule T1 JOIN bond T2 ON T1.molecule_id = T2.molecule_id AND T2.bond_type = ' = ' GROUP BY T1.molecule_id HAVING num_double_bonds > 1 ORDER BY T1.molecule_id ASC LIMIT 5;	toxicology
SELECT (SUM(CASE WHEN bond_type = ' = ' THEN 1 ELSE 0 END) / COUNT(bond_id)) * 100 AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) / COUNT(molecule_id)) * 100 AS percent FROM molecule;	toxicology
SELECT SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) * 100.0 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = 'TR060' WHERE a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND m.label IN('+', '-')	toxicology
SELECT bond_type, COUNT(*) AS bond_count FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type HAVING bond_count = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count, bond_type FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type) AS subquery) AND EXISTS (SELECT * FROM molecule WHERE molecule_id = 'TR018' AND label = '+');  This SQL query first selects the bond type and counts the occurrences of each type for molecule 'TR018'. It then checks if the count of the majority bond type matches the maximum count among all bond types for that molecule. Finally, it checks if the molecule is labeled as carcinogenic by looking for a row in the molecule table with 'TR018' and label '+'. If both conditions are met, the bond type and carcinogenic status are returned.	toxicology
SELECT T1.molecule_id FROM molecule T1 JOIN bond T2 ON T1.molecule_id = T2.molecule_id JOIN connected T3 ON T2.bond_id = T3.bond_id JOIN atom T4 ON T3.atom_id = T4.atom_id JOIN atom T5 ON T3.atom_id2 = T5.atom_id WHERE T2.bond_type = '-' AND T1.label = '-' GROUP BY T1.molecule_id ORDER BY T1.molecule_id ASC LIMIT 3;	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type ASC LIMIT 2;	toxicology
SELECT COUNT(*)  FROM bond  WHERE molecule_id LIKE 'TR009%'  AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12');	toxicology
SELECT COUNT(*) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'br' AND molecule.label = '+';	toxicology
SELECT bond.bond_type, atom.atom_id, atom2.atom_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id AND (atom.atom_id = 'TR001_6' OR atom.atom_id2 = 'TR001_6') JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id AND (atom2.atom_id = 'TR001_9' OR atom2.atom_id2 = 'TR001_9') WHERE bond.molecule_id = 'TR001' AND bond_type IN (' = ', '-', '#');	toxicology
SELECT `molecule.label` AS molecule_label, `label` AS carcinogenic FROM `atom` JOIN `molecule` ON `atom.molecule_id` = `molecule.molecule_id` WHERE `atom.atom_id` = 'TR001_10';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*)  FROM connected  WHERE atom_id LIKE 'TR%_19' AND atom_id2 LIKE 'TR%_19';	toxicology
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR004' AND (element = 'cl' OR element = 'c' OR element = 'h' OR element = 'o' OR element = 's' OR element = 'n' OR element = 'p' OR element = 'na' OR element = 'br' OR element = 'f' OR element = 'i' OR element = 'sn' OR element = 'pb' OR element = 'te' OR element = 'ca');	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '-';	toxicology
SELECT DISTINCT T1.molecule_id FROM atom T1 WHERE SUBSTRING(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T1.label = '+';	toxicology
SELECT bond_id FROM bond WHERE bond_id IN (   SELECT bond_id   FROM connected   JOIN atom ON connected.atom_id = atom.atom_id   WHERE atom.element = 'P' ) AND bond_id IN (   SELECT bond_id   FROM connected   JOIN atom ON connected.atom_id2 = atom.atom_id   WHERE atom.element = 'N' );	toxicology
SELECT COUNT(*) AS double_bonds_count, m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id HAVING COUNT(*) = (SELECT MAX(double_bonds_count) FROM (SELECT COUNT(*) AS double_bonds_count, m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id) AS subquery) AND m.label = '+' LIMIT 1;	toxicology
SELECT AVG(COUNT(bond_id)) / COUNT(atom_id) AS average_bonds FROM atom WHERE element = 'i'	toxicology
SELECT bond_type, bond_id FROM bond WHERE SUBSTR(atom_id, 7, 2) + 0 = 45 AND (bond_type = '=' OR bond_type = '-' OR bond_type = '#');	toxicology
SELECT DISTINCT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id2 = c.atom_id WHERE c.atom_id IS NULL AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a.element != 'cl';	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR447' AND b.bond_type = '#'	toxicology
SELECT DISTINCT A.element FROM atom A JOIN connected C ON A.atom_id = C.atom_id JOIN bond B ON C.bond_id = B.bond_id WHERE B.molecule_id = 'TR144_8_19' AND A.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT `molecule_id`, COUNT(*) AS num_double_bonds FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` JOIN `bond` ON `atom.atom_id` IN (`bond.atom_id1`, `bond.atom_id2`) WHERE `molecule.label` = '+' AND `bond.bond_type` = ' = ' GROUP BY `molecule_id` ORDER BY num_double_bonds DESC LIMIT 1;	toxicology
SELECT MIN(`element`) FROM atom WHERE `molecule_id` IN (SELECT `molecule_id` FROM molecule WHERE `label` = '+') GROUP BY `element` HAVING COUNT(*) = (SELECT COUNT(*) FROM atom WHERE `molecule_id` IN (SELECT `molecule_id` FROM molecule WHERE `label` = '+'))	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id WHERE a1.element = 'pb';	toxicology
SELECT DISTINCT element FROM atom WHERE atom_id IN (   SELECT atom_id   FROM connected   JOIN bond ON connected.bond_id = bond.bond_id   WHERE bond_type = '#' ) AND (element = 'cl' OR element = 'c') AND element NOT IN ('h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT (COUNT(bond_id) / COUNT(DISTINCT atom_id)) * 100 AS percentage FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element IN (     SELECT element     FROM atom     GROUP BY element     HAVING COUNT(*) = (         SELECT COUNT(*)         FROM atom         GROUP BY element         ORDER BY COUNT(*) DESC         LIMIT 1     ) );	toxicology
SELECT COUNT(CASE WHEN bond_type = '-' AND label = '+' THEN 1 END) * 1.0 / COUNT(bond_id) AS proportion_of_carcinogenic_single_bonds FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond_type = '-' AND label = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE element IN('c', 'h');	toxicology
SELECT `atom_id2` FROM `connected` WHERE `atom_id` IN (SELECT `atom_id` FROM `atom` WHERE `element` = 's')	toxicology
SELECT bond_type FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'sn' AND (bond_type = '=' OR bond_type = '-' OR bond_type = '#');	toxicology
SELECT COUNT(DISTINCT element) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-')	toxicology
SELECT COUNT(*) AS total_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id2 = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id AND b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br') GROUP BY a.molecule_id;	toxicology
SELECT bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT COUNT(CASE WHEN atom.element = 'cl' AND connected.bond_id IS NOT NULL AND bond.bond_type = '-' THEN 1 END) * 100.0 / COUNT(DISTINCT atom.atom_id) AS percent_cl_chlorine FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '-';	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN ('TR000', 'TR001', 'TR002') AND `label` IN('+', '-');	toxicology
SELECT DISTINCT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) AS total_carcinogenic_molecules FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT DISTINCT A.element FROM atom A JOIN connected C ON A.atom_id = C.atom_id JOIN bond B ON C.bond_id = B.bond_id WHERE B.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = 'i';	toxicology
SELECT COUNT(*) AS carcinogenic_count,         SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS positive_count,        SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS negative_count FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'Ca' GROUP BY molecule.molecule_id HAVING MAX(label) = '+' OR (MAX(label) = '-' AND positive_count < negative_count);	toxicology
SELECT COUNT(*)  FROM bond AS b  JOIN atom AS a1 ON b.bond_id = 'TR001_1_8' AND a1.atom_id IN ('TR000_3', 'TR000_2')  JOIN atom AS a2 ON b.bond_id = 'TR001_1_8' AND a2.atom_id IN ('TR000_3', 'TR000_2') WHERE a1.element = 'cl' AND a2.element = 'c';	toxicology
SELECT DISTINCT T1.molecule_id FROM molecule T1 JOIN atom T2 ON T1.molecule_id = T2.molecule_id JOIN connected T3 ON T2.atom_id = T3.atom_id JOIN bond T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'c' AND T4.bond_type = '#' AND T1.label = '-';	toxicology
SELECT (COUNT(CASE WHEN atom.element = 'cl' AND molecule.label = '+' THEN 1 END) * 100.0 / COUNT(DISTINCT molecule.molecule_id)) AS percentage_cl_chlorine_carcinogenic FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+'	toxicology
SELECT DISTINCT atom.element FROM atom JOIN molecule ON atom.molecule_id = 'TR001' WHERE atom.element IN ('Hg', 'As', 'Pb', 'Cd', 'Cr', 'Cu', 'Hg2+', 'Aluminum', 'Mercury') -- Considering common toxicology elements AND atom.molecule_id = 'TR001';	toxicology
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = ' = ';	toxicology
SELECT a1.atom_id AS first_atom_id, a2.atom_id AS second_atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON a2.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND a1.atom_id < a2.atom_id;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR005_16_26' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT COUNT(*)  FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  WHERE bond.bond_type = '-' AND molecule.label = '-';	toxicology
SELECT `molecule.label` FROM `molecule` JOIN `bond` ON `molecule.molecule_id` = `bond.molecule_id` JOIN `connected` ON `bond.bond_id` = `connected.bond_id` WHERE `connected.atom_id` = 'TR001_10' AND `connected.atom_id2` = 'TR001_11';	toxicology
SELECT bond_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond_type = '#' AND (molecule.label = '+' OR molecule.label = '-')	toxicology
SELECT COUNT(*) AS毒理学计数 FROM molecule WHERE label = '+' AND SUBSTR(atom.atom_id, 7, 1) = '4' AND atom.element = 'cl';	toxicology
SELECT COUNT(CASE WHEN element = 'h' THEN 1 END) AS hydrogen_count,         COUNT(*) AS total_count,         CASE             WHEN COUNT(*) > 0 THEN (COUNT(CASE WHEN element = 'h' THEN 1 END) / COUNT(*))::TEXT            ELSE '0'         END AS hydrogen_ratio,         label  FROM atom  WHERE atom_id IN (SELECT atom_id FROM connected                   JOIN bond ON connected.bond_id = bond.bond_id                   JOIN molecule ON bond.molecule_id = molecule.molecule_id                   WHERE molecule.molecule_id = 'TR006')     AND element = 'h'    AND molecule.label IN ('+', '-')  GROUP BY label;	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'Ca' AND m.label = '+';	toxicology
SELECT bond_type FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id JOIN connected ON bond.bond_id = connected.bond_id WHERE atom.element = 'te' AND (connected.atom_id = 'TR000_1' OR connected.atom_id2 = 'TR000_1') -- Assuming TR000_1 is the tellurium atom in the molecule AND (bond_type = '=' OR bond_type = '-' OR bond_type = '#'); -- Considering the possible bond types for double, single, and triple bonds	toxicology
SELECT DISTINCT A.element FROM atom A JOIN connected C ON A.atom_id = SUBSTR(C.bond_id, 7, 2) OR A.atom_id2 = SUBSTR(C.bond_id, 7, 2) JOIN bond B ON C.bond_id = B.bond_id WHERE B.molecule_id = SUBSTR(C.bond_id, 1, 5) AND C.atom_id = 'TR001_10' AND C.atom_id2 = 'TR001_11' AND (A.element = 'cl' OR A.element = 'c' OR A.element = 'h' OR A.element = 'o' OR A.element = 's' OR A.element = 'n' OR A.element = 'p' OR A.element = 'na' OR A.element = 'br' OR A.element = 'f' OR A.element = 'i' OR A.element = 'sn' OR A.element = 'pb' OR A.element = 'te' OR A.element = 'ca');	toxicology
SELECT (COUNT(*) FILTER (WHERE bond_type = '#') * 100.0 / COUNT(DISTINCT molecule_id)) AS 'Percentage of Compounds with Triple Bonds' FROM bond JOIN connected ON bond.bond_id = connected.bond_id;	toxicology
SELECT (SUM(CASE WHEN bond_type = ' = ' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond_id)) AS percent FROM bond WHERE molecule_id = 'TR047';	toxicology
SELECT COUNT(*) > 0 AS is_carcinogenic FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id2 = connected.atom_id WHERE atom.atom_id = 'TR001_1' AND molecule.label = '+';	toxicology
SELECT COUNT(*) > 0 FROM molecule WHERE molecule_id = 'TR151' AND label = '+';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a.element != 'c' AND a.element != 'h' AND a.element != 'o' AND a.element != 'n' AND a.element != 'p';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND molecule_id LIKE 'TR010%' AND molecule_id LIKE 'TR050%' AND LENGTH(molecule_id) = 6;	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond_type = ' = ';	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'h' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label LIKE '%+')	toxicology
SELECT DISTINCT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.atom_id = 'TR000_1' AND T3.bond_type = 'TR00_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label != '-';	toxicology
SELECT (SUM(CASE WHEN molecule.label = '+' AND atom.element = 'h' THEN 1 ELSE 0 END) / COUNT(molecule.molecule_id)) * 100.0 AS percentage_of_carcinogenic_hydrogen_molecules FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id;	toxicology
SELECT COUNT(*) > 0 AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR124' AND label = '+';	toxicology
SELECT atom.atom_id, atom.element FROM atom WHERE atom.molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR007_4_19' AND bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR007_4' OR atom_id2 = 'TR007_4');	toxicology
SELECT DISTINCT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.molecule_id = 'TR001' AND connected.atom_id2 = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS double_bonds FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.molecule_id = 'TR006' AND bond.bond_type = ' = ' AND EXISTS (   SELECT 1   FROM molecule   WHERE molecule.molecule_id = connected.molecule_id AND molecule.label = '+' );	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element) AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id2 = c.atom_id WHERE m.label = '+' AND (a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY m.molecule_id;	toxicology
SELECT bond.bond_id, bond_type, atom.atom_id, atom.element FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id JOIN connected ON bond.bond_id = connected.bond_id WHERE bond_type = '-' AND atom.atom_id IN (SELECT DISTINCT atom_id FROM connected);	toxicology
SELECT m.molecule_id, GROUP_CONCAT(DISTINCT a.element SEPARATOR ', ') AS elements FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND (a.element = 'cl' OR a.element = 'c') GROUP BY m.molecule_id;	toxicology
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR000_2_3' AND atom.element IN ('cl');	toxicology
SELECT COUNT(*)  FROM bond  WHERE bond_type IN (SELECT element FROM atom WHERE element = 'cl');	toxicology
SELECT atom.atom_id, COUNT(DISTINCT bond.bond_type) as bond_types FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.molecule_id = 'TR346' GROUP BY atom.atom_id;	toxicology
SELECT COUNT(*) AS total_molecules_with_double_bond,         COUNT(*) FILTER (WHERE label = '+') AS carcinogenic_molecules FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id NOT IN (SELECT DISTINCT molecule_id FROM atom WHERE element = 's')  AND molecule_id NOT IN (SELECT DISTINCT molecule_id FROM connected, bond                        WHERE bond.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = ' = ')                          AND connected.atom_id IN (SELECT atom_id FROM atom WHERE element = 's')                          OR connected.atom_id2 IN (SELECT atom_id FROM atom WHERE element = 's'));	toxicology
SELECT `label` FROM `molecule` WHERE `molecule_id` IN (   SELECT `bond_id`[:-3]   FROM `bond`   WHERE `bond_id` LIKE 'TR001_2_%' ) AND `label` = '+';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR005';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT (COUNT(*) FILTER (WHERE molecule.label = '+' AND atom.element = 'cl') * 100.0) / COUNT(molecule.molecule_id) AS percentage FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'cl';	toxicology
SELECT `molecule_id` FROM `bond` WHERE `bond_id` = 'TR001_1_7';	toxicology
SELECT COUNT(*)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_3_4' AND a.element IN ('cl');	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (   SELECT bond_id   FROM connected   WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2' );	toxicology
SELECT m.molecule_id FROM molecule m JOIN connected c1 ON m.molecule_id = c1.atom_id JOIN atom a1 ON c1.atom_id2 = a1.atom_id AND a1.atom_id = 'TR000_2' JOIN connected c2 ON m.molecule_id = c2.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id AND a2.atom_id = 'TR000_4';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT CASE WHEN EXISTS (SELECT * FROM molecule WHERE molecule_id = 'TR000' AND label = '+') THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END;	toxicology
SELECT (COUNT(CASE WHEN bond_type = '-' THEN 1 END) * 100.0 / COUNT(bond_id)) AS percentage FROM bond;	toxicology
SELECT COUNT(*) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'N' AND molecule.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = ' = ';	toxicology
SELECT `molecule_id` FROM molecule WHERE `label` = '-' AND EXISTS (   SELECT 1   FROM atom   WHERE atom.molecule_id = molecule.molecule_id   GROUP BY atom.molecule_id   HAVING COUNT(*) > 5 );	toxicology
SELECT DISTINCT A.element FROM atom A JOIN connected C ON A.atom_id = C.atom_id OR A.atom_id2 = C.atom_id JOIN bond B ON C.bond_id = B.bond_id WHERE A.molecule_id = 'TR024' AND B.bond_type = '=' AND (A.element = 'cl' OR A.element = 'c');	toxicology
SELECT `molecule.label` AS carcinogenic_molecule FROM `molecule` JOIN `atom` ON `molecule.molecule_id` = `atom.molecule_id` WHERE `molecule.label` = '+' GROUP BY `molecule.molecule_id` HAVING COUNT(`atom.atom_id`) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count, `atom.molecule_id` FROM `atom` GROUP BY `atom.molecule_id`) AS subquery);	toxicology
SELECT (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) / COUNT(molecule_id)) * 100.0 AS carcinogenic_percentage FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id2 = connected.atom_id WHERE atom.element = 'H' AND connected.bond_type = '#'	toxicology
SELECT COUNT(*)  FROM molecule  WHERE label = '+';	toxicology
SELECT COUNT(*)  FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE m.molecule_id BETWEEN 'TR004' AND 'TR010'  AND b.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element = 'c' AND molecule_id = 'TR008';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT COUNT(*) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN bond ON bond.molecule_id = atom.molecule_id JOIN connected ON atom.atom_id = connected.atom_id AND atom.atom_id2 = connected.atom_id2 WHERE atom.element = 'o' AND bond.bond_type = '=';	toxicology
SELECT COUNT(*)  FROM molecule  JOIN connected ON molecule.molecule_id = connected.molecule_id JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#' AND molecule.label = '-';	toxicology
SELECT atom.element, bond.bond_type FROM atom JOIN bond ON atom.molecule_id = 'TR016' WHERE atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND (atom.atom_id = bond.atom_id1 OR atom.atom_id = bond.atom_id2) AND bond.bond_type IN (' = ', '-', '#');	toxicology
SELECT atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON bond.bond_id = connected.bond_id JOIN atom AS atom2 ON atom2.atom_id = connected.atom_id2 WHERE atom.element = 'c' AND bond.bond_type = '=' AND atom2.element = 'c' AND molecule_id = 'TR012';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND atom.element = 'o';	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM cards WHERE borderColor = 'none' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL) AND hasFoil = 0;	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT * FROM cards WHERE rarity = 'mythic' AND status = 'Banned' AND format = 'gladiator';	card_games
SELECT c.name, l.format, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Artifact%' AND c.side IS NULL AND l.format = 'vintage'	card_games
SELECT id, artist FROM cards WHERE power = '*' OR power IS NULL AND format = 'commander' AND status = 'Legal';	card_games
SELECT c.name AS card_name, r.text AS ruling_text, c.hasContentWarning AS has_missing_or_degraded FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Sublime Epiphany' AND number = '74s');	card_games
SELECT c.name AS card_name, c.artist AS artist_name, COUNT(r.uuid) AS ruling_count, c.isPromo FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid HAVING COUNT(r.uuid) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM rulings GROUP BY uuid) AS max_rulings) AND c.isPromo = 1;	card_games
SELECT DISTINCT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Annul' AND number = '29');	card_games
SELECT name FROM cards WHERE variations LIKE '%Japanese%' AND languages LIKE '%Japanese%';	card_games
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 AS 'Percentage_of_Cards_in_Chinese_Simplified' FROM cards;	card_games
SELECT s.code, s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd' AND scryfallIllustrationId IS NOT NULL;	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*)  FROM cards  WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress';	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT s.language FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT text FROM rulings WHERE uuid = 'ad41be73-582f-58ed-abd4-a88c1f616ac3';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isStarter = 1;	card_games
SELECT status FROM legalities WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle');	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Benalish Knight');	card_games
SELECT DISTINCT artist FROM cards WHERE setCode = 'Phyrexian';	card_games
SELECT (COUNT(*) FILTER (WHERE borderColor = 'borderless') * 100.0) / COUNT(*) AS borderless_percentage FROM cards;	card_games
SELECT COUNT(*) FROM cards WHERE scryfallIllustrationId IS NOT NULL AND language = 'German' AND isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND EXISTS (   SELECT 1   FROM foreign_data   WHERE cards.uuid = foreign_data.uuid   AND foreign_data.language = 'Russian' );	card_games
SELECT CAST(COUNT(*) AS REAL) * 100.0 / COUNT(*) OVER (WHERE isStorySpotlight = 1)  FROM cards  WHERE language = 'French' AND isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT `layout` FROM cards WHERE `keywords` LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%';	card_games
SELECT id FROM cards WHERE hasFoil = 1 AND (cardKingdomFoilId IS NOT NULL OR cardKingdomId IS NOT NULL) AND edhrecRank = 1;	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT `artist` FROM cards WHERE `language` = 'Chinese Simplified';	card_games
SELECT * FROM cards WHERE availability = 'paper' AND language = 'Japanese';	card_games
SELECT COUNT(*)  FROM cards  WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT c.uuid, f.language FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.format = 'legacy';	card_games
SELECT text FROM rulings WHERE uuid = 'beacon_of_immortality_uuid';	card_games
SELECT COUNT(*), legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' AND legalities.status = 'legal';	card_games
SELECT cards.name, colors FROM cards JOIN sets ON cards.setCode = 'OGW' WHERE cards.setCode = 'OGW';	card_games
SELECT c.name, f.translation, f.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode AND c.uuid = st.setCode JOIN foreign_data f ON c.uuid = f.uuid WHERE c.convertedManaCost = 5 AND c.setCode = '10E';	card_games
SELECT cards.name, rulings.date FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf';	card_games
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT * FROM cards WHERE originalType = 'Artifact' AND colors LIKE '%B%' AND uuid IN (SELECT uuid FROM foreign_data WHERE language IS NOT NULL)	card_games
SELECT name FROM cards WHERE rarity = 'uncommon' ORDER BY ruling_date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND (cardKingdomId IS NULL OR cardKingdomFoilId IS NULL) AND hasFoil = 1;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1;	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND availability IN ('paper', 'mtgo') AND frameVersion = '2003' AND borderColor = 'black';	card_games
SELECT SUM(CAST(SUBSTRING(manaCost, 1, LENGTH(manaCost) - LENGTH(REPLACE(manaCost, '{', ''))) AS REAL)) AS total_unconverted_mana FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT c.type, c.subtypes, c.supertypes FROM cards c WHERE c.availability = 'arena';	card_games
SELECT setCode FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.language = 'Spanish';	card_games
SELECT CAST(COUNT(*) AS REAL) * 100.0 / COUNT(*) AS percentage FROM cards WHERE frameEffects = 'legendary' AND hand = '+3';	card_games
SELECT id,         (COUNT(*) FILTER (WHERE isStorySpotlight = 1 AND isTextless = 0) / COUNT(*) FILTER (WHERE isStorySpotlight = 1)) * 100 AS percentage_with_text_box FROM cards GROUP BY id;	card_games
SELECT name,         CAST(COUNT(*) AS REAL) * 100 / COUNT(*) OVER() AS percentage_spoken_in_spanish FROM cards WHERE language = 'Spanish' GROUP BY name;	card_games
SELECT DISTINCT setTranslations.translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT * FROM cards WHERE type LIKE '%Creature%' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'legal') AND types LIKE '%Goblin%'	card_games
SELECT DISTINCT types FROM cards WHERE languages LIKE '%Deutsch%' AND (subtypes IS NOT NULL AND supertypes IS NOT NULL);	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%' AND faceName IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'pre-modern' AND cards.side IS NULL AND cards.text LIKE '%This is a triggered mana ability%';	card_games
SELECT c.id FROM cards c WHERE c.artist = 'Erica Yang' AND c.availability = 'paper' AND c.format IN ('pauper');	card_games
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT c.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Matthew D. Wilson' AND c.layout = 'normal' AND c.borderColor = 'black' AND f.language = 'French' AND f.type = 'Creature';	card_games
SELECT COUNT(*) FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2009-01-10';	card_games
SELECT set_translations.language FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.baseSetSize = 180 AND sets.block = 'Ravnica';	card_games
SELECT (COUNT(*) FILTER (WHERE hasContentWarning = 0 AND format = 'commander' AND status = 'legal') * 100.0) / COUNT(*) AS percentage FROM cards;	card_games
SELECT (COUNT(*) FILTER (WHERE language = 'French' AND (power IS NULL OR power = '*'))) * 100 / COUNT(*) AS percentage FROM cards WHERE power IS NULL OR power = '*';	card_games
SELECT CAST(COUNT(*) AS REAL) * 100 / COUNT(*) OVER() AS percentage FROM sets WHERE language = 'Japanese' AND type = 'expansion';	card_games
SELECT availability AS kind_of_printing FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE uuid = '149934';	card_games
SELECT c1.id, c1.cardKingdomFoilId, c2.cardKingdomId FROM cards c1 JOIN cards c2 ON c1.cardKingdomFoilId = c2.cardKingdomId WHERE c1.cardKingdomFoilId IS NOT NULL AND c2.cardKingdomId IS NOT NULL ORDER BY c1.cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(COUNT(*) AS REAL) / COUNT(*) * 100 FROM cards WHERE isTextless = 1 AND layout = 'normal';	card_games
SELECT `number` FROM cards WHERE `otherFaceIds` IS NULL AND `subtypes` LIKE '%Angel%' AND `subtypes` LIKE '%Wizard%'	card_games
SELECT s.name FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3;	card_games
SELECT DISTINCT language FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.mcmName = 'Archenemy' AND sets.setCode = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5;	card_games
SELECT language, type FROM sets WHERE id = 206;	card_games
SELECT s.code, s.id FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Italian' WHERE s.block = 'Shadowmoor' ORDER BY s.code ASC LIMIT 2;	card_games
SELECT s.id FROM sets s JOIN legalities l ON s.uuid = l.uuid WHERE s.isForeignOnly = 1 AND l.status = 'Legal' AND s.name = 'Japanese' AND l.format = ' foil';	card_games
SELECT s.code FROM sets s WHERE s.language = 'Russian' GROUP BY s.code HAVING baseSetSize = (SELECT MAX(baseSetSize) FROM sets WHERE language = 'Russian') LIMIT 1;	card_games
SELECT (COUNT(*) FILTER (WHERE language = 'Chinese Simplified' AND isOnlineOnly = 1)) * 100 / COUNT(isOnlineOnly) AS percentage FROM cards;	card_games
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id FROM cards WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language FROM set_translations WHERE setCode = '174';	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar';	card_games
SELECT setCode FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, setCode FROM sets WHERE block IN ('Masques', 'Mirage');	card_games
SELECT setCode FROM sets WHERE type = 'expansion';	card_games
SELECT c.name AS foreign_name, c.type AS card_type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'boros';	card_games
SELECT language, flavorText, type FROM cards WHERE watermark = 'colorpie';	card_games
SELECT (COUNT(*) FILTER (WHERE cards.convertedManaCost = 10 AND cards.name = 'Abyssal Horror') / COUNT(cards.convertedManaCost)) * 100 AS percentage FROM cards WHERE cards.name = 'Abyssal Horror';	card_games
SELECT s.setCode FROM sets s WHERE s.type = 'expansion' AND s.setCode IN (     SELECT c.setCode     FROM cards c     WHERE c.type = 'Commander' )	card_games
SELECT cards.name, cards.type FROM cards WHERE cards.watermark = 'abzan';	card_games
SELECT f.language, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Azorius' AND c.isOnlineOnly = 0;	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'  AND cardKingdomFoilId = cardKingdomId  AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '+%';	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT cards.purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black'  AND availability LIKE '%arena,mtgo%'	card_games
SELECT * FROM cards WHERE (name = 'Serra Angel' AND convertedManaCost > (SELECT convertedManaCost FROM cards WHERE name = 'Shrine Keeper')) OR (name = 'Shrine Keeper' AND convertedManaCost > (SELECT convertedManaCost FROM cards WHERE name = 'Serra Angel'));	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT s.name FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen' AND s.language = 'Italian';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode IN (SELECT setCode                    FROM cards                    WHERE name = 'Angel of Mercy');	card_games
SELECT name FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) > 0 FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.name = 'Ancestor''s Chosen' AND f.language = 'Korean';	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT COUNT(*) FROM sets WHERE name = 'Hauptset Zehnte Edition' AND type = 'baseSet';	card_games
SELECT `translation` FROM `set_translations` WHERE `language` = 'Simplified Chinese' AND `setCode` = 'Eighth Edition';	card_games
SELECT COUNT(*) > 0 FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL;	card_games
SELECT releaseDate FROM sets WHERE name = 'Ancestor''s Chosen';	card_games
SELECT type FROM sets WHERE code = 'Hauptset Zehnte Edition' AND translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian';	card_games
SELECT * FROM cards WHERE name = 'Adarkar Valkyrie' AND isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE code IN (     SELECT setCode     FROM set_translations     WHERE language = 'Italian' ) AND baseSetSize < 10;	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND borderColor = 'black';	card_games
SELECT name FROM cards WHERE setCode = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT c.number FROM cards c JOIN sets s ON c.setCode = 'Coldsnap' WHERE c.number = 4;	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND (convertedManaCost > 5 AND (power = '*' OR power IS NULL));	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL);	card_games
SELECT text FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen') AND language = 'German';	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN set_translations st ON c.setCode = st.setCode AND st.language = 'Italian' WHERE c.name = 'Coldsnap';	card_games
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.setCode = st.setCode AND st.language = 'Italian' WHERE s.name = 'Coldsnap' AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)     FROM cards     WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'Standard' AND status = 'Legal')     AND setCode = 'Coldsnap' ) ORDER BY c.convertedManaCost DESC;	card_games
SELECT date FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Reminisce');	card_games
SELECT CAST(SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM cards WHERE cards.name = 'Coldsnap';	card_games
SELECT (SUM(CASE WHEN cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100) / SUM(CASE WHEN name = 'Coldsnap' THEN 1 ELSE 0 END) AS percentage_incredibly_powerful FROM cards WHERE name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT s.mcmName FROM sets s WHERE s.releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.text, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec' AND c.hasContentWarning = 1;	card_games
SELECT releaseDate FROM sets WHERE name = 'Evacuation';	card_games
SELECT COUNT(*) FROM sets WHERE name = 'Rinascita di Alara';	card_games
SELECT sets.type FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Huitième édition';	card_games
SELECT setCode FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'French' AND EXISTS (     SELECT 1     FROM cards c     JOIN legalities l ON c.uuid = l.uuid     WHERE c.name = 'Tendo Ice Bridge' AND l.status = 'legal' );	card_games
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND setCode = 'Salvat 2011';	card_games
SELECT set_translations.translation FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE cards.name = 'Fellwar Stone' AND set_translations.language = 'Japanese';	card_games
SELECT name FROM cards WHERE setCode = 'Journey into Nyx Hero''s Path' ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT releaseDate FROM sets WHERE setCode = 'Ola de frío' AND translation = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*)  FROM cards  WHERE setCode = 'World Championship Decks 2004'  AND convertedManaCost = 3;	card_games
SELECT set_translations.translation FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.name = 'Mirrodin' AND set_translations.language = 'Chinese Simplified';	card_games
SELECT SUM(CASE WHEN language = 'Japanese' AND isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN language = 'Japanese' THEN 1 ELSE 0 END) AS percentage_Japanese_non_foil FROM cards JOIN set_translations ON cards.uuid = set_translations.uuid WHERE set_translations.language = 'Japanese';	card_games
SELECT (SUM(CASE WHEN language = 'Portuguese (Brazil)' AND isOnlineOnly = 1 THEN 1 ELSE 0 END) / COUNT(CASE WHEN language = 'Portuguese (Brazil)' THEN 1 END)) * 100 AS 'Percentage Online Only'  FROM cards  JOIN set_translations ON cards.uuid = set_translations.uuid;	card_games
SELECT distinct cards.printings FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1 AND cards.availability NOT LIKE '%paper%' AND cards.availability NOT LIKE '%foil%' AND cards.availability NOT LIKE '%digital%';	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL) ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT frameEffects, COUNT(*) as count FROM cards WHERE hasFoil = 1 AND (cardKingdomFoilId IS NOT NULL OR cardKingdomId IS NOT NULL) GROUP BY frameEffects ORDER BY count DESC LIMIT 1;	card_games
SELECT COUNT(*)  FROM cards  WHERE power IS NULL OR power = '*'  AND hasFoil = 0  AND duelDeck = 'a';	card_games
SELECT s.id FROM sets s WHERE s.type = 'commander' GROUP BY s.setCode ORDER BY MAX(s.totalSetSize) DESC LIMIT 1;	card_games
SELECT cards.name, cards.manaCost FROM cards WHERE cards.format = 'duel' GROUP BY cards.name, cards.manaCost ORDER BY CAST(SUBSTRING cards.manaCost AS REAL) DESC LIMIT 10;	card_games
SELECT MIN(originalReleaseDate), name, format FROM cards WHERE rarity = 'mythic' AND status = 'legal' GROUP BY format;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Volkan Baga' AND f.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types LIKE '%Enchantment%' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT s.name AS play_format, c.name AS card_name FROM legalities l JOIN sets s ON l.uuid = s.code JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'banned' GROUP BY s.name, c.name HAVING COUNT(*) = (SELECT MAX(count_banned) FROM (   SELECT COUNT(*) AS count_banned   FROM legalities   WHERE status = 'banned'   GROUP BY play_format ) subquery)	card_games
SELECT set_translations.language FROM set_translations JOIN sets ON set_translations.setCode = sets.code WHERE sets.name = 'Battlebond';	card_games
SELECT c.artist, f.format FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = (SELECT MIN(artist) FROM cards) GROUP BY c.artist, f.format;	card_games
SELECT status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997' AND cards.artist = 'D. Alexander Gregory' AND cards.hasContentWarning = 1 AND legalities.format = 'legacy';	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.edhrecRank = 1 AND legalities.status = 'banned';	card_games
SELECT AVG(set_count) AS annual_average_sets, MAX(language) AS common_language FROM (     SELECT COUNT(*) AS set_count, language     FROM sets     WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'     GROUP BY language ) AS language_counts;	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'banned' OR status = 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT * FROM rulings WHERE uuid IN (   SELECT uuid FROM cards   WHERE artist = 'Kev Walker' ) ORDER BY date DESC;	card_games
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.setCode = 'Hour of Devastation' AND legalities.status = 'legal';	card_games
SELECT s.name FROM sets s LEFT JOIN set_translations st ON s.code = st.setCode AND st.language = 'Japanese' WHERE st.id IS NULL AND EXISTS (     SELECT 1     FROM set_translations st2     WHERE s.code = st2.setCode AND st2.language = 'Korean' )	card_games
SELECT DISTINCT cards.frameVersion, cards.name FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.artist = 'Allen Williams' AND legalities.status = 'banned';	card_games
SELECT MAX(Reputation) as HighestReputation, DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY DisplayName ORDER BY HighestReputation DESC LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2014;	codebase_community
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01 00:00:00';	codebase_community
SELECT u.DisplayName FROM users u ORDER BY u.Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT Title FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ViewCount = (SELECT MAX(ViewCount) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie'));	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(f.FavoriteCount) FROM posts f)	codebase_community
SELECT SUM(CommentCount)  FROM posts  WHERE OwnerDisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) AS AnswerCount FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND AnswerCount = (SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie'));	codebase_community
SELECT `users.DisplayName` FROM `posts` JOIN `users` ON `posts.LastEditorUserId` = `users.Id` WHERE `posts.Title` = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie' AND ParentId IS NULL)	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (   SELECT Id   FROM users   WHERE Age > 65 ) AND Score >= 20;	codebase_community
SELECT Location FROM users WHERE Id = (     SELECT OwnerUserId     FROM posts     WHERE Title = 'Eliciting priors from experts' );	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId GROUP BY p.Id ORDER BY t.Count DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie' AND YEAR(Date) = 2011)	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(Score) AS AverageScore FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE DisplayName = 'csgillespie' );	codebase_community
SELECT AVG(COUNT(b.Id)) AS AverageBadges FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Views > 200 GROUP BY u.DisplayName;	codebase_community
SELECT (COUNT(CASE WHEN p.OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND p.Score > 20 THEN p.Id END) * 100.0) / COUNT(p.Id) AS Percentage FROM posts p;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(*) DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(comments.Score) FROM comments) ORDER BY p.Score DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910);	codebase_community
SELECT COUNT(*) FROM favorites WHERE PostId IN (   SELECT PostId   FROM comments   WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0' );	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 AND CommentCount = 1;	codebase_community
SELECT p.Id, p.ClosedDate FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = 23853 WHERE c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NOT NULL;	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini');	codebase_community
SELECT `UserDisplayName` FROM `votes` WHERE Id = 6347;	codebase_community
SELECT COUNT(*) AS NumVotes FROM votes JOIN posts ON votes.PostId = posts.Id WHERE posts.Title LIKE '%data visualization%';	codebase_community
SELECT Name FROM badges WHERE UserId IN (   SELECT Id   FROM users   WHERE DisplayName = 'DatEpicCoderGuyWhoPrograms' );	codebase_community
SELECT COUNT(posts.Id) / COUNT(votes.Id) AS PostToVoteRatio FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.Id = 24;	codebase_community
SELECT COUNT(ViewCount) FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT u.DisplayName FROM users u WHERE u.WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'SilentGhost');	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93';	codebase_community
SELECT * FROM comments WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'A Lion');	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing';	codebase_community
SELECT * FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT DISTINCT users.DisplayName FROM users JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT Title FROM posts WHERE LastEditorUserId = (SELECT Id FROM users WHERE DisplayName = 'Vebjorn Ljosa');	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny';	codebase_community
SELECT c.Id, c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND c.UserId = p.LastEditorUserId;	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM votes JOIN posts ON votes.PostId = posts.Id WHERE posts.Title LIKE '%data%'	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%variance%' AND v.BountyAmount = 50;	codebase_community
SELECT p.Title, p.Body, c.Text, p.Score FROM posts p JOIN tags t ON p.Tags LIKE '%humor%' AND p.Id = t.ExcerptPostId LEFT JOIN comments c ON p.Id = c.PostId GROUP BY p.Id ORDER BY AVG(p.ViewCount) DESC;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND Date BETWEEN '2011-01-01' AND '2011-12-31';	codebase_community
SELECT COUNT(*)  FROM users  JOIN badges ON users.Id = badges.UserId  GROUP BY users.Id  HAVING COUNT(badges.Name) > 5;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Id IN (     SELECT UserId      FROM badges      WHERE Name = 'Teacher' ) AND Location = 'New York'  AND EXISTS (     SELECT *      FROM badges b2      WHERE b2.UserId = users.Id AND b2.Name = 'Supporter' );	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT u.Id, u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId GROUP BY u.Id, u.DisplayName HAVING COUNT(ph.Id) = 1 AND p.Views >= 1000;	codebase_community
SELECT u.DisplayName, b.Name FROM users u JOIN (     SELECT UserId, COUNT(*) as CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId ORDER BY c.CommentCount DESC;	codebase_community
SELECT COUNT(DISTINCT users.Id) FROM users JOIN badges ON users.Id = badges.UserId WHERE users.Location = 'India' AND badges.Name = 'Teacher';	codebase_community
SELECT      ((SUM(CASE WHEN Name = 'Student' AND Year(Date) = 2010 THEN 1 ELSE 0 END) / COUNT(*) * 100) -      (SUM(CASE WHEN Name = 'Student' AND Year(Date) = 2011 THEN 1 ELSE 0 END) / COUNT(*) * 100)) AS PercentageDifference FROM      badges WHERE      Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) as UniqueUsers FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Id = 395;	codebase_community
SELECT p.Id AS PostId, u.Id AS UserId FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60;	codebase_community
SELECT SUM(favoriteCount) FROM posts WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011;	codebase_community
SELECT AVG(UpVotes) AS AverageUpVotes, AVG(Age) AS AverageAge FROM users JOIN posts ON users.Id = posts.OwnerUserId GROUP BY users.Id HAVING COUNT(posts.OwnerUserId) > 10;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0';	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (     SELECT MAX(Reputation)     FROM users )	codebase_community
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Pierre');	codebase_community
SELECT DISTINCT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT (COUNT(DISTINCT CASE WHEN Name = 'Teacher' THEN UserId END) / COUNT(DISTINCT UserId)) * 100 AS TeacherPercentage FROM badges;	codebase_community
SELECT CAST(COUNT(*) AS REAL) * 100.0 / COUNT(UserId) AS Percentage FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Organizer' AND users.Age BETWEEN 13 AND 18;	codebase_community
SELECT Score FROM comments WHERE PostId IN (     SELECT Id     FROM posts     WHERE CreationDate = '2010-07-19 19:19:56.0' )	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(DISTINCT u.Views) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT Name FROM badges WHERE UserId IN (     SELECT UserId     FROM users     ORDER BY Reputation ASC     LIMIT 1 );	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Sharpie');	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Supporter' AND UserId IN (SELECT Id FROM users WHERE Age > 65);	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Id` = 30;	codebase_community
SELECT COUNT(DISTINCT users.Id) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT `users.DisplayName` FROM `users` ORDER BY `Views` DESC LIMIT 1;	codebase_community
SELECT DIVIDE(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id END), COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id END)) AS vote_ratio_2010_2011 FROM votes;	codebase_community
SELECT T2.TagName FROM users U JOIN posts P ON U.Id = P.OwnerUserId JOIN tags T2 ON P.Id = T2.ExcerptPostId WHERE U.DisplayName = 'John Stauffer';	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo');	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan');	codebase_community
SELECT p.Id FROM posts p WHERE p.OwnerUserId = (SELECT u.Id FROM users u WHERE u.DisplayName = 'slashnick') ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT MAX(SUM(ViewCount)) AS Popularity FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' OR OwnerDisplayName = 'Noah Snyder';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Matt Parker')  AND PostId > 4;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score < 60 AND UserDisplayName = 'Neil McGuigan'  AND PostId IN (     SELECT PostId      FROM posts      JOIN users ON posts.OwnerUserId = users.Id      WHERE DisplayName = 'Neil McGuigan' );	codebase_community
SELECT DISTINCT T.TagName FROM tags T JOIN posts P ON T.ExcerptPostId = P.Id WHERE P.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Mark Meckes') AND P.CommentCount = 0;	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT (COUNT(PostId) AS TotalPosts_R, COUNT(PostId WHERE TagName = 'r') AS Posts_R_Language) FROM posts WHERE PostTypeId = (SELECT Id FROM tags WHERE TagName = 'community') GROUP BY PostTypeId ORDER BY TotalPosts_R DESC LIMIT 1;  -- Calculate the percentage WITH community_posts AS (   SELECT COUNT(*) AS Total_Community_Posts   FROM posts   WHERE PostTypeId IN (SELECT Id FROM tags WHERE TagName = 'community') ), r_language_posts AS (   SELECT COUNT(*) AS Total_R_Language_Posts   FROM posts   WHERE TagName = 'r' ) SELECT (Total_R_Language_Posts * 100.0 / Total_Community_Posts) AS Percentage FROM community_posts, r_language_posts ORDER BY Percentage DESC LIMIT 1;	codebase_community
SELECT (SUM(CASE WHEN DisplayName = 'Mornington' THEN ViewCount ELSE 0 END) - SUM(CASE WHEN DisplayName = 'Amos' THEN ViewCount ELSE 0 END)) AS DifferenceInViewCount FROM posts;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users u WHERE u.Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(*) AS history_count, p.LastEditDate FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY p.LastEditDate;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers' AND b.Date = (     SELECT MAX(Date)     FROM badges     WHERE Name = 'Outliers' );	codebase_community
SELECT p2.Title FROM posts p1 JOIN postLinks pl ON p1.Id = pl.RelatedPostId JOIN posts p2 ON p2.Id = pl.PostId WHERE p1.Body LIKE '%How to tell if something happened in a data set which monitors a value over time%'	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId WHERE b.UserId IN (     SELECT UserId     FROM users     WHERE DisplayName = 'Samuel'     AND YEAR(CreationDate) = 2013 ) AND YEAR(b.Date) = 2013;	codebase_community
SELECT OwnerDisplayName FROM posts WHERE ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN tags t ON u.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing';	codebase_community
SELECT p2.Title, pl.LinkTypeId FROM posts p1 JOIN postLinks pl ON p1.Id = pl.PostId JOIN posts p2 ON pl.RelatedPostId = p2.Id WHERE p1.Title = 'What are principal component scores?'	codebase_community
SELECT p.OwnerDisplayName FROM posts p JOIN posts c ON p.ParentId = c.Id WHERE p.Score = (     SELECT MAX(s.Score)     FROM posts s     WHERE s.ParentId = p.Id ) GROUP BY p.OwnerDisplayName;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8)	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT AVG(Age) AS AverageAge FROM (   SELECT Age   FROM users   WHERE Id = (     SELECT UserId     FROM votes     GROUP BY UserId     HAVING SUM(UpVotes) = (       SELECT MAX(SUM(UpVotes))       FROM votes       GROUP BY UserId     )   ) ) AS InfluentialUser LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts JOIN votes ON posts.Id = votes.PostId WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50;	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;	codebase_community
SELECT p.Score FROM posts p JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' GROUP BY p.Id ORDER BY COUNT(t.Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(postLinks.Id) AS MonthlyLinks,         DATE_FORMAT(CreationDate, '%Y-%m') AS Month,         DIVIDE(COUNT(postLinks.Id), 12) AS AveragePerMonth FROM postLinks JOIN posts ON postLinks.PostId = posts.Id WHERE posts.AnswerCount <= 2 AND YEAR(postLinks.CreationDate) = 2010 GROUP BY Month ORDER BY Month;	codebase_community
SELECT p.Id FROM posts p WHERE p.OwnerUserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts WHERE Id IN (   SELECT PostId   FROM postLinks   ORDER BY CreationDate   LIMIT 1 );	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName HAVING COUNT(b.Name) = (SELECT MAX(COUNT(b2.Name)) FROM badges b2)	codebase_community
SELECT MIN(CreationDate) FROM votes WHERE UserId IN (   SELECT Id   FROM users   WHERE DisplayName = 'chl' );	codebase_community
SELECT MIN(CreationDate) AS FirstPostDate FROM posts WHERE OwnerUserId IN (SELECT Id FROM users ORDER BY Age ASC LIMIT 1)	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Autobiographer' AND b.Date = (SELECT MIN(Date) FROM badges WHERE Name = 'Autobiographer');	codebase_community
SELECT COUNT(*)  FROM users  WHERE Location = 'United Kingdom'  AND Id IN (     SELECT UserId      FROM votes      WHERE PostId IN (         SELECT Id          FROM posts          WHERE FavoriteCount >= 4     ) );	codebase_community
SELECT AVG(v.PostId) AS AveragePostsVoted FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DISTINCT Users.DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010);	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.OwnerUserId IN (SELECT u.Id FROM users u WHERE u.DisplayName = 'Harvey Motulsky') ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts) AND OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'owner_name')	codebase_community
SELECT AVG(Score) AS AverageScore FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner');	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 AND p.FavoriteCount = (     SELECT MAX(FavoriteCount)     FROM posts     WHERE YEAR(CreationDate) = 2010 )	codebase_community
SELECT (COUNT(*) FILTER (WHERE CreationDate >= '2011-01-01' AND CreationDate <= '2011-12-31' AND Reputation > 1000)) * 100.0 / COUNT(*) AS Percentage FROM posts JOIN users ON posts.OwnerUserId = users.Id;	codebase_community
SELECT (COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN Id END) * 100.0) / COUNT(Id) AS 'Percentage_of_Teenagers' FROM users;	codebase_community
SELECT p.Views, u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Computer Game Datasets';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(*)  FROM comments  WHERE PostId = (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts));	codebase_community
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT Users.DisplayName, Users.Location FROM users JOIN posts ON users.Id = posts.LastEditorUserId WHERE posts.Id = 183 AND posts.LastEditDate = (     SELECT MAX(LastEditDate)     FROM posts     WHERE Id = 183 );	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Emmett') AND Date = (SELECT MAX(Date) FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Emmett'));	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT DATEDIFF(CreationDate, (SELECT CreationDate FROM users WHERE DisplayName = 'Zolomon')) AS TimeToGetBadge FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Zolomon');	codebase_community
SELECT COUNT(p.Id) AS PostCount, COUNT(c.Id) AS CommentCount FROM posts p LEFT JOIN comments c ON p.OwnerUserId = c.UserId WHERE p.OwnerUserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1);	codebase_community
SELECT Text, UserDisplayName FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.Title = 'Analysing wind data with R' AND comments.CreationDate = (SELECT MAX(CreationDate) FROM comments WHERE PostId = posts.Id) ORDER BY comments.CreationDate DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Tags LIKE '%careers%';	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT COUNT(*) AS Comments, SUM(CASE WHEN PostTypeId = 2 THEN 1 ELSE 0 END) AS Answers FROM posts JOIN comments ON posts.Id = comments.PostId JOIN votes ON posts.Id = votes.PostId AND votes.VoteTypeId = 2 WHERE posts.Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT CAST(SUM(CASE WHEN Score >= 50 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT Text FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.Title = 'How can I adapt ANOVA for binary data?' AND posts.PostTypeId = 1;	codebase_community
SELECT Text FROM comments WHERE PostId IN (   SELECT PostId   FROM posts   WHERE ViewCount BETWEEN 100 AND 150 ) ORDER BY Score DESC LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.UserDisplayName LIKE '%http://%' AND u.DisplayName IS NOT NULL;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score = 0 AND posts.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM posts  JOIN comments ON posts.Id = comments.PostId  WHERE posts.CommentCount = 1 AND comments.Score = 0;	codebase_community
SELECT COUNT(DISTINCT users.Id) FROM comments JOIN users ON comments.UserId = users.Id WHERE comments.Score = 0 AND users.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Id AS CommentId FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT UpVotes FROM users JOIN comments ON users.Id = comments.UserId WHERE comments.Text = 'R is also lazy evaluated';	codebase_community
SELECT * FROM comments WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky');	codebase_community
SELECT DISTINCT UserDisplayName FROM comments WHERE Score BETWEEN 1 AND 5 AND DownVotes = 0;	codebase_community
SELECT      CAST(COUNT(UserId) AS REAL) FILTER (WHERE UpVotes = 0 AND Score BETWEEN 5 AND 10) / COUNT(UserId) FILTER (WHERE Score BETWEEN 5 AND 10) AS percentage FROM comments;	codebase_community
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_id IN (   SELECT id   FROM superhero   WHERE superhero_name = '3-D Man' );	superhero
SELECT COUNT(*) FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.full_name HAVING COUNT(hero_power.power_id) > 15;	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT c.colour FROM superhero s JOIN race r ON s.race_id = r.id JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' AND hero_power.power_name = 'Agility';	superhero
SELECT superhero.superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND colour.colour = 'Blue' JOIN colour ON superhero.hair_colour_id = colour.id AND colour.colour = 'Blond' JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id AND superpower.power_name = 'Agility';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT s.full_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND s.height_cm = (     SELECT MAX(height_cm)     FROM superhero     WHERE publisher_id = p.id )	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT (SUM(CASE WHEN hero_power.power_name = 'Super Strength' THEN 1 ELSE 0 END) / COUNT(superhero.id)) * 100 AS percentage_Super_Strength FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id WHERE superhero.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics');	superhero
SELECT p.publisher_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' GROUP BY s.publisher_id ORDER BY MIN(ha.attribute_value) ASC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT publisher.publisher_name FROM superhero WHERE superhero.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_name = 'Intelligence' GROUP BY superhero_name ORDER BY MIN(attribute_value) ASC LIMIT 1;	superhero
SELECT race.race FROM superhero WHERE superhero.superhero_name = 'Copycat';	superhero
SELECT COUNT(*)  FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND attribute_value < 50;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female' AND attribute.attribute_name = 'Strength' AND attribute_value = 100;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count, superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name) AS subquery);	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT SUM(CASE WHEN superhero.alignment = 'Bad' THEN 1 ELSE 0 END) AS num_bad_superheroes,        COUNT(superhero.id) AS total_superheroes,        (SUM(CASE WHEN superhero.alignment = 'Bad' THEN 1 ELSE 0 END) * 100.0 / COUNT(superhero.id)) AS percentage_bad,        COUNT(CASE WHEN superhero.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND superhero.alignment = 'Bad' THEN superhero.id ELSE NULL END) AS num_marvel_bad_superheroes FROM superhero;	superhero
SELECT SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference_in_superheroes FROM publisher;	superhero
SELECT publisher_id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(ha.attribute_value) as average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75;	superhero
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id IN (     SELECT superhero.id     FROM superhero     WHERE superhero.superhero_name = 'Deathlok' );	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = 2;	superhero
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Male') GROUP BY superpower.power_name LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race = 'Alien';	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1;	superhero
SELECT p.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.id = 56;	superhero
SELECT full_name FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT race.race FROM superhero WHERE weight_kg = 169;	superhero
SELECT c.colour FROM superhero s JOIN race r ON s.race_id = r.id JOIN colour c ON s.hair_colour_id = c.id WHERE r.race = 'human' AND s.height_cm = 185;	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)	superhero
SELECT SUM(CASE WHEN superhero.publisher_id = 13 AND superhero.height_cm BETWEEN 150 AND 180 THEN 1 ELSE 0 END) * 100 / COUNT(publisher.id) AS percentage_Marvel FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id;	superhero
SELECT s.full_name FROM superhero s JOIN (   SELECT AVG(weight_kg) AS avg_weight   FROM superhero ) AS avg ON s.weight_kg > avg.avg_weight * 0.79 WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Male') AND s.weight_kg IS NOT NULL;	superhero
SELECT power_name FROM hero_power GROUP BY power_name ORDER BY COUNT(power_name) DESC LIMIT 1;	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT power_name FROM superpower JOIN hero_power ON hero_power.power_id = superpower.id WHERE hero_power.hero_id = 1;	superhero
SELECT COUNT(*) FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) AS average_without_skin_colour FROM superhero LEFT JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.id = 1;	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute.attribute_name = 'Durability' AND publisher.publisher_name = 'Dark Horse Comics' GROUP BY superhero.superhero_name ORDER BY hero_attribute.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien' AND s.alignment_id IS NOT NULL;	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id WHERE hero_power.power_name = 'Flight';	superhero
SELECT c.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c ON s.eye_colour_id = c.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT superhero.superhero_name, publisher.publisher_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND superhero.hair_colour_id = colour.id AND superhero.skin_colour_id = colour.id;	superhero
SELECT race.race FROM superhero WHERE superhero.superhero_name = 'A-Bomb' AND superhero.race_id IS NOT NULL;	superhero
SELECT (SUM(CASE WHEN gender = 'Female' AND skin_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') THEN 1 ELSE 0 END) * 100.0 / COUNT(CASE WHEN gender = 'Female' THEN 1 END)) AS percentage_blue_female_superheroes FROM superhero;	superhero
SELECT superhero.superhero_name, race.race FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN race ON superhero.race_id = race.id WHERE attribute.attribute_name = 'full_name' AND superhero.full_name = 'Charles Chandler';	superhero
SELECT gender.gender FROM superhero WHERE superhero_name = 'Agent 13' AND id = (SELECT hero_id FROM hero_power JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero_name = 'Agent 13');	superhero
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(*)  FROM hero_power  WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Amazo');	superhero
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_id IN (   SELECT superhero.id   FROM superhero   WHERE full_name = 'Hunter Zolomon' );	superhero
SELECT superhero.height_cm FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN hero_attribute ha1 ON superhero.id = ha1.hero_id JOIN attribute a1 ON ha1.attribute_id = a1.id JOIN colour c1 ON a1.id = c1.id AND c1.colour = 'Black' JOIN hero_attribute ha2 ON superhero.id = ha2.hero_id JOIN attribute a2 ON ha2.attribute_id = a2.id JOIN colour c2 ON a2.id = c2.id AND c2.colour = 'Black' WHERE c1.id = ha1.attribute_id AND c2.id = ha2.attribute_id;	superhero
SELECT DISTINCT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'Gold';	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire';	superhero
SELECT superhero_name FROM superhero WHERE alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_name = 'Strength' AND attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute     WHERE attribute_name = 'Strength' );	superhero
SELECT race.race, alignment.alignment FROM superhero WHERE superhero_name = 'Cameron Hicks';	superhero
SELECT SUM(CASE WHEN gender = 'Female' AND publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100 / COUNT(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS percent_female_marvel_heroes FROM superhero;	superhero
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Alien');	superhero
SELECT SUM(CASE WHEN full_name = 'Emil Blonsky' THEN weight_kg ELSE 0 END) - SUM(CASE WHEN full_name = 'Charles Chandler' THEN weight_kg ELSE 0 END) AS weight_difference FROM superhero;	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE superhero_name = 'Abomination';	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Speed');	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man';	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = 7 AND hair_colour_id = 9;	superhero
SELECT p.publisher_name FROM superhero s WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id != 1;	superhero
SELECT SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) * 100.0 / COUNT(superhero_name) AS percentage_blue_eyes FROM superhero;	superhero
SELECT SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS male_count,        SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS female_count,        CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS REAL) AS ratio FROM superhero;	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (     SELECT MAX(height_cm)     FROM superhero );	superhero
SELECT s.power_id FROM superpower s WHERE s.power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT s.full_name FROM superhero s WHERE s.weight_kg = 0 OR s.weight_kg IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT s.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.full_name = 'Helen Parr';	superhero
SELECT race.race FROM superhero WHERE weight_kg = 108 AND height_cm = 188;	superhero
SELECT publisher.publisher_name FROM superhero WHERE id = 38;	superhero
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (     SELECT attribute_id     FROM hero_attribute     JOIN attribute ON hero_attribute.attribute_id = attribute.id     WHERE attribute.attribute_name = 'Intelligence'     GROUP BY attribute_id     ORDER BY MAX(attribute_value) DESC     LIMIT 1 ) GROUP BY r.race ORDER BY MAX(ha.attribute_value) DESC LIMIT 1;	superhero
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3;	superhero
SELECT c.colour FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON s.skin_colour_id = c.id WHERE a.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id JOIN gender ON superhero.gender_id = gender.id WHERE colour.colour = 'blue' AND gender.gender = 'male';	superhero
SELECT SUM(CASE WHEN alignment.id = 2 AND gender.id = 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(CASE WHEN alignment.id = 2 THEN 1 ELSE NULL END) AS female_percentage FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 2;	superhero
SELECT SUM(CASE WHEN T1.weight_kg = 0 OR T1.weight_kg IS NULL THEN 1 ELSE 0 END) AS num_missing_weight,        SUM(CASE WHEN T2.colour_id = 7 THEN 1 ELSE 0 END) AS num_blue_eyes,        SUM(CASE WHEN T2.colour_id = 1 THEN 1 ELSE 0 END) AS num_no_eye_color,        SUM(CASE WHEN T1.weight_kg = 0 OR T1.weight_kg IS NULL AND T2.colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.weight_kg = 0 OR T1.weight_kg IS NULL AND T2.colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero T1 LEFT JOIN hero_power T2 ON T1.id = T2.hero_id LEFT JOIN colour T3 ON T2.eye_colour_id = T3.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0;	superhero
SELECT hero_attribute.attribute_value FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' AND hero_attribute.hero_id IN (     SELECT superhero.id     FROM superhero     WHERE superhero.superhero_name = 'Hulk' );	superhero
SELECT s.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') AND skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Green');	superhero
SELECT COUNT(*)  FROM superhero  WHERE gender_id IN (SELECT id FROM gender WHERE gender = 'Female')  AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.superhero_name ASC;	superhero
SELECT gender.gender FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Phoenix Force';	superhero
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') AND weight_kg = (     SELECT MAX(weight_kg)     FROM superhero     WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') ) ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE race_id NOT IN (SELECT id FROM race WHERE race = 'Human') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_name = 'Speed' AND attribute_value = 100;	superhero
SELECT SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference_in_superheroes FROM publisher;	superhero
SELECT a.attribute_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Black Panther' GROUP BY a.attribute_name ORDER BY MIN(ha.attribute_value) ASC LIMIT 1;	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT (SUM(CASE WHEN publisher_name = 'George Lucas' AND gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(CASE WHEN publisher_name = 'George Lucas' THEN 1 END)) AS female_superhero_percentage FROM superhero;	superhero
SELECT (SUM(CASE WHEN publisher_name = 'Marvel Comics' AND alignment = 'Good' THEN 1 ELSE 0 END) * 100.0 / COUNT(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 END)) AS percentage_of_good_superheroes FROM superhero;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)	superhero
SELECT s.full_name FROM superhero s WHERE s.superhero_name = 'Alien';	superhero
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Aquababy';	superhero
SELECT superhero.weight_kg, race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.id = 40;	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral');	superhero
SELECT hero_id FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence';	superhero
SELECT colour.colour FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Blackwulf';	superhero
SELECT s.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT driverRef FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE raceId = 18 AND q1 = (     SELECT q1     FROM qualifying     WHERE raceId = 18     ORDER BY q1 DESC     LIMIT 5 );	formula_1
SELECT surname FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE raceId = 19 AND q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19) GROUP BY drivers.surname ORDER BY q2 ASC LIMIT 1;	formula_1
SELECT DISTINCT seasons.year FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Shanghai';	formula_1
SELECT url FROM races WHERE circuitRef = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Germany';	formula_1
SELECT c.position FROM circuits c JOIN constructors co ON c.circuitId = co.constructorId WHERE co.name = 'Renault';	formula_1
SELECT COUNT(*)  FROM races  WHERE year = 2010  AND circuitRef NOT IN ('sepang', 'bahrain', 'catalunya', 'istanbul', 'monaco')  AND circuitRef NOT LIKE '%Asia%'  AND circuitRef NOT LIKE '%Europe%';	formula_1
SELECT races.name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain';	formula_1
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.name = 'Australian Grand Prix';	formula_1
SELECT url FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit');	formula_1
SELECT races.date, races.time FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT country FROM constructors WHERE constructorId IN (SELECT constructorId FROM constructorResults WHERE raceId = 24 AND points = 1);	formula_1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId = (SELECT driverId FROM drivers WHERE surname = 'Senna' AND forename = 'Bruno');	formula_1
SELECT drivers.nationality FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE qualifyId = 355 AND q2 = '0:01:40';	formula_1
SELECT drivers.number FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 903 AND q3 = '0:01:54';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE driverId NOT IN (     SELECT driverId      FROM results      WHERE raceId = (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007)      AND time IS NOT NULL )	formula_1
SELECT url FROM seasons WHERE year = (SELECT year FROM races WHERE raceId = 901);	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29')  AND milliseconds IS NOT NULL;	formula_1
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 592 AND results.points IS NOT NULL ORDER BY drivers.dob ASC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname, drivers.url FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE races.round = 161 AND lapTimes.time = '0:01:27';	formula_1
SELECT drivers.forename, drivers.surname, drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE raceId = 933 AND fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933) GROUP BY drivers.driverId;	formula_1
SELECT location, lat, lng FROM circuits WHERE name = 'Malaysian Grand Prix';	formula_1
SELECT c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN results r ON cr.raceId = 9 AND r.constructorId = c.constructorId WHERE r.points = (   SELECT MAX(points)   FROM constructorResults   JOIN results ON constructorResults.raceId = 9 AND results.constructorId = constructorResults.constructorId ) ORDER BY r.points DESC LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId = (     SELECT driverId     FROM drivers     WHERE surname = 'di Grassi' );	formula_1
SELECT drivers.nationality FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId JOIN races ON qualifying.raceId = races.raceId WHERE races.round = 347 AND q2 = '0:01:15';	formula_1
SELECT drivers.code FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 45 AND q3 = '0:01:33';	formula_1
SELECT time FROM results WHERE raceId = 743 AND driverId = (SELECT driverId FROM drivers WHERE surname = 'McLaren' AND forename = 'Bruce');	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'San Marino Grand Prix' AND YEAR(races.date) = 2006 AND results.position = 2;	formula_1
SELECT url FROM seasons WHERE year IN (   SELECT year   FROM races   WHERE raceId = 901 );	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29')  AND laps = (SELECT MAX(laps) FROM results WHERE raceId = races.raceId AND races.date = '2015-11-29');	formula_1
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 872 AND results.time IS NOT NULL GROUP BY drivers.driverId ORDER BY drivers.dob DESC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 348 AND results.fastestLap = 1 ORDER BY results.fastestLapTime ASC LIMIT 1;	formula_1
SELECT drivers.nationality FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results );	formula_1
SELECT ((SUBTRACT(fastestLapSpeed(raceId = 853), fastestLapSpeed(raceId = 854))) / fastestLapSpeed(raceId = 853)) * 100 AS percentage	formula_1
SELECT      driverId,     COUNT(driverId) AS total_completed_races,     COUNT(driverId WHERE time IS NOT NULL AND date = '1983-07-16') AS completed_races,     (COUNT(driverId WHERE time IS NOT NULL AND date = '1983-07-16') / COUNT(driverId WHERE date = '1983-07-16')) * 100 AS completion_rate FROM      results WHERE      date = '1983-07-16' GROUP BY      driverId;	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*) AS race_count, name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT r.name FROM races r WHERE YEAR(r.date) = YEAR MIN(CASE WHEN r.date IS NOT NULL THEN r.date END) AND MONTH(r.date) = MONTH MIN(CASE WHEN r.date IS NOT NULL THEN r.date END) ORDER BY r.date ASC LIMIT 1;	formula_1
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999)	formula_1
SELECT year FROM seasons GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year = 2017 AND year NOT IN (SELECT year FROM races WHERE year = 2000);	formula_1
SELECT c.country, c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = (SELECT MIN(year) FROM races WHERE name LIKE '%European Grand Prix%') AND c.country IN ('United Kingdom', 'Germany', 'France', 'Italy', 'Spain');	formula_1
SELECT MAX(year) FROM races WHERE name = 'British Grand Prix' AND circuitRef = 'Brands Hatch';	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Silverstone' AND races.name LIKE '%British Grand Prix%'  AND circuits.country = 'United Kingdom';	formula_1
SELECT drivers.forename, drivers.surname, results.position FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Singapore Grand Prix' AND races.year = 2010 ORDER BY results.position;	formula_1
SELECT drivers.forename, drivers.surname, SUM(results.points) AS total_points FROM drivers JOIN results ON drivers.driverId = results.driverId GROUP BY drivers.driverId HAVING total_points = (SELECT MAX(total_points) FROM (   SELECT drivers.forename, drivers.surname, SUM(results.points) AS total_points   FROM drivers   JOIN results ON drivers.driverId = results.driverId   GROUP BY drivers.driverId ) AS subquery) ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname, SUM(results.points) AS total_points FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Chinese Grand Prix' AND races.year = 2017 GROUP BY drivers.driverId ORDER BY total_points DESC LIMIT 3;	formula_1
SELECT drivers.forename, drivers.surname, races.name FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN lapsTimes ON results.laps = lapsTimes.lap AND results.raceId = lapsTimes.raceId WHERE lapsTimes.time = (SELECT MIN(time) FROM lapsTimes) ORDER BY lapsTimes.time ASC;	formula_1
SELECT AVG(time) AS average_lap_time FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Vettel' AND forename = 'Sebastian') AND raceId = (SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND year = 2009);	formula_1
SELECT CAST((COUNT(CASE WHEN surname = 'Hamilton' AND position > 1 THEN raceId END) / COUNT(CASE WHEN surname = 'Hamilton' THEN raceId END)) * 100 AS REAL) AS percentage FROM races WHERE year >= 2010;	formula_1
SELECT drivers.forename, drivers.surname, drivers.nationality, AVG(results.points) AS avg_points FROM drivers JOIN results ON drivers.driverId = results.driverId GROUP BY drivers.driverId HAVING COUNT(results.wins) = (     SELECT MAX(count_wins)     FROM (         SELECT COUNT(*) AS count_wins         FROM results         GROUP BY driverId     ) AS win_counts ) ORDER BY avg_points DESC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname, 2022 - drivers.dob + 1 AS age FROM drivers WHERE drivers.nationality = 'Japanese' ORDER BY age ASC LIMIT 1;	formula_1
SELECT * FROM circuits WHERE circuitId IN (     SELECT circuitId     FROM races     WHERE year BETWEEN 1990 AND 2000     GROUP BY circuitId     HAVING COUNT(*) = 4 );	formula_1
SELECT circuits.name, circuits.location, races.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'USA' AND races.year = 2006;	formula_1
SELECT races.name AS race_name, circuits.name AS circuit_name, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2005 AND EXTRACT(MONTH FROM races.date) = 9;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 10;	formula_1
SELECT COUNT(*)  FROM results  JOIN constructors ON results.constructorId = constructors.constructorId  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE drivers.surname = 'Schumacher'  AND circuits.name = 'Sepang International Circuit'  AND results.points = (SELECT MAX(points) FROM results WHERE driverId = drivers.driverId AND raceId = races.raceId);	formula_1
SELECT races.name, races.year FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapTime = (     SELECT MIN(milliseconds)     FROM results     WHERE driverId IN (         SELECT driverId         FROM drivers         WHERE surname = 'Schumacher'     ) );	formula_1
SELECT AVG(points) FROM results WHERE year = 2000 AND driverId = (SELECT driverId FROM drivers WHERE surname = 'Irvine' AND forename = 'Eddie');	formula_1
SELECT r.name AS first_race, r.url, SUM(rs.points) AS first_race_points FROM races r JOIN results rs ON r.raceId = rs.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.year = (SELECT MIN(year) FROM races WHERE driverId IN (SELECT driverId FROM results WHERE driverRef = 'Lewis Hamilton')) GROUP BY r.name, r.url;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT r.name AS race_name, s.year, c.location FROM races r JOIN seasons s ON r.year = s.year JOIN circuits c ON r.circuitId = c.circuitId WHERE r.laps = (SELECT MAX(laps) FROM races) ORDER BY laps DESC LIMIT 1;	formula_1
SELECT (COUNT(*) AS germany_grand_prix_count FROM races WHERE country = 'Germany' AND name = 'European Grand Prix') * 100 / COUNT(*) AS percentage FROM races WHERE name = 'European Grand Prix';	formula_1
SELECT lat, lng FROM circuits WHERE circuitRef = 'Silverstone';	formula_1
SELECT name FROM circuits WHERE lat = (     SELECT MAX(lat)     FROM circuits     WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') );	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*)  FROM drivers  WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE driverRef = 'Anthony Davidson';	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis';	formula_1
SELECT name FROM circuits WHERE year = 2009 AND round = 1;	formula_1
SELECT DISTINCT seasons.year FROM seasons JOIN races ON seasons.year = races.year JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit';	formula_1
SELECT r.name AS race_name, r.date, r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone'	formula_1
SELECT r.date, r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name LIKE 'Abu Dhabi Grand Prix' AND r.year BETWEEN 2010 AND 2019;	formula_1
SELECT COUNT(*) AS num Races FROM races WHERE circuitId IN (     SELECT circuitId     FROM circuits     WHERE country = 'Italy' );	formula_1
SELECT date FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya');	formula_1
SELECT url FROM circuits WHERE circuitId IN (     SELECT circuitId     FROM races     JOIN seasons ON races.year = seasons.year     WHERE races.name = 'Spanish Grand Prix'     AND seasons.year = 2009 );	formula_1
SELECT MIN(fastestLapTime) AS fastest_lap_time FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis');	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.fastestLapSpeed IS NOT NULL ORDER BY results.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT drivers.driverRef FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE races.name = 'Australian Grand Prix' AND races.year = 2008 AND results.position = 1;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.surname = 'Hamilton' AND d.forename = 'Lewis';	formula_1
SELECT r.name AS race_name FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.surname = 'Hamilton' AND r.rank = (   SELECT MIN(rank)   FROM results   WHERE driverId = d.driverId ) ORDER BY r.year, r.round LIMIT 1;	formula_1
SELECT MAX(`fastestLapSpeed`) AS fastest_lap_speed FROM results WHERE raceId = (     SELECT raceId     FROM races     WHERE year = 2009 AND name = 'Spanish Grand Prix' );	formula_1
SELECT DISTINCT seasons.year FROM seasons JOIN results ON seasons.year = results.year JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis';	formula_1
SELECT positionOrder FROM results WHERE raceId = (SELECT raceId                 FROM races                 WHERE name = 'Australian Grand Prix' AND year = 2008) AND driverId = (SELECT driverId                 FROM drivers                 WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.year = 2008 AND results.grid = 4 AND results.raceId IN (   SELECT raceId   FROM races   WHERE name = 'Australian Grand Prix' );	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)  AND time IS NOT NULL;	formula_1
SELECT r.name AS race_name, l.time AS fastest_lap_time FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId AND d.surname = 'Hamilton' AND d.forename = 'Lewis' WHERE r.year = 2008 AND r.name = 'Australian Grand Prix' AND lt.position = 1 ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT time FROM results WHERE raceId = (   SELECT raceId   FROM races   WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND driverId IN (   SELECT driverId   FROM results   WHERE raceId = (     SELECT raceId     FROM races     WHERE year = 2008 AND name = 'Australian Grand Prix'   ) AND position = 2 );	formula_1
SELECT drivers.forename, drivers.surname, results.points, results.time FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId JOIN seasons ON races.year = seasons.year WHERE races.name = 'Australian Grand Prix' AND seasons.year = 2008 AND results.position = 1 AND results.points = (     SELECT MAX(points)     FROM results     WHERE races.name = 'Australian Grand Prix'     AND seasons.year = 2008 ) AND results.statusId = (     SELECT statusId     FROM status     WHERE status = 'Finished' ) ORDER BY results.points DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND d.nationality = 'American';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE driverId IN (     SELECT driverId      FROM results      WHERE raceId = (         SELECT raceId          FROM races          WHERE name = 'Australian Grand Prix' AND year = 2008 AND time IS NOT NULL     ) ) AND driverId IN (     SELECT driverId      FROM races      GROUP BY driverId      HAVING COUNT(raceId) > 0 );	formula_1
SELECT SUM(points) FROM results WHERE driverId IN (   SELECT driverId   FROM drivers   WHERE surname = 'Hamilton' );	formula_1
SELECT AVG(CAST(SUBSTR(fastestLapTime, 0, 2) AS REAL) * 60 + CAST(SUBSTR(fastestLapTime, 3, 2) AS REAL) AS REAL) AS average_fastest_lap_time FROM results WHERE driverRef = 'Lewis Hamilton';	formula_1
SELECT COUNT(*) AS completed_laps_count,         COUNT(DISTINCT races.raceId) AS total_races FROM races JOIN results ON races.raceId = results.raceId WHERE races.year = 2008 AND results.time IS NOT NULL GROUP BY races.year HAVING year = 2008 ORDER BY completed_laps_count DESC LIMIT 1;	formula_1
SELECT ((julianday(laps.time) - julianday(champion_time)) * 24 * 60 * 60 + extract('second' from laps.time) - extract('second' from champion_time)) / COALESCE(extract('second' from last_driver_time), 1) * 100 AS speed_difference_percentage FROM results r1 JOIN (     SELECT raceId, driverId, time AS champion_time     FROM results     WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 AND status LIKE '%Champ%')     AND driverId = (SELECT driverId FROM drivers WHERE points = (SELECT MAX(points) FROM driverStandings WHERE raceId = r1.raceId)) ) c ON r1.raceId = c.raceId AND r1.driverId = c.driverId JOIN (     SELECT raceId, driverId, time AS last_driver_time     FROM results     WHERE raceId = r1.raceId     AND driverId = (SELECT driverId FROM drivers WHERE points = (SELECT MIN(points) FROM driverStandings WHERE raceId = r1.raceId))     AND time IS NOT NULL ) l ON r1.raceId = l.raceId AND r1.driverId = l.driverId WHERE r1.raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND r1.time IS NOT NULL;	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01';	formula_1
SELECT AVG(points) AS average_points FROM constructorResults JOIN constructors ON constructorResults.constructorId = constructors.constructorId WHERE nationality = 'British';	formula_1
SELECT constructorRef, SUM(points) as total_points FROM constructorResults GROUP BY constructorRef ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN results r ON cr.raceId = r.raceId AND r.raceId = 291 WHERE cr.points = 0;	formula_1
SELECT COUNT(*)  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY c.constructorId HAVING COUNT(r.raceId) = 2;	formula_1
SELECT DISTINCT constructors.name FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructorStandings.position = 1;	formula_1
SELECT COUNT(*) FROM constructors c JOIN lapTimes lt ON c.constructorId = lt.constructorId WHERE lt.lap > 50 AND c.nationality = 'French';	formula_1
SELECT ((COUNT(drivers.driverId) AS total_japanese_drivers)        AS total_japanese_drivers_with_time,        (COUNT(CASE WHEN drivers.nationality = 'Japanese' AND results.time IS NOT NULL AND races.year BETWEEN 2007 AND 2009 THEN drivers.driverId END) AS japanese_drivers_completed_races) FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.nationality = 'Japanese' AND races.year BETWEEN 2007 AND 2009 GROUP BY drivers.nationality HAVING drivers.nationality = 'Japanese' AND COUNT(CASE WHEN results.time IS NOT NULL AND races.year BETWEEN 2007 AND 2009 THEN drivers.driverId END) > 0 AND (SELECT COUNT(*) FROM drivers WHERE nationality = 'Japanese' AND year BETWEEN 2007 AND 2009) > 0 ORDER BY total_japanese_drivers_with_time DESC LIMIT 1 OFFSET 0 * 100 AS race_completion_percentage;	formula_1
SELECT year, AVG(TIME_TO_SEC(time)) AS avg_champion_time FROM results WHERE position = 1 AND time IS NOT NULL GROUP BY year;	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE YEAR(drivers.dob) > 1975 AND results.position = 2;	formula_1
SELECT COUNT(*)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.fastestLapTime IS NOT NULL ORDER BY results.fastestLapTime ASC LIMIT 1;	formula_1
SELECT MAX(lap) AS fastest_lap FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009) AND driverId IN (SELECT driverId FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009) AND points = (SELECT MAX(points) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009))) AND statusId = (SELECT statusId FROM status WHERE status = 'Champion')  AND time LIKE '0%:0%:0.%';	formula_1
SELECT AVG(fastestLapSpeed) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Spanish Grand Prix' AND year = 2009);	formula_1
SELECT name, year FROM results WHERE milliseconds IS NOT NULL ORDER BY milliseconds ASC LIMIT 1;	formula_1
SELECT CAST(COUNT(driverId) AS REAL) / COUNT(DISTINCT CASE WHEN year(dob) < 1985 AND laps > 50 THEN driverId END) * 100 AS percentage FROM drivers JOIN races ON drivers.driverId = results.driverId WHERE year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(*) FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND SUBSTR(lt.time, 1, 4) < '02:00' AND SUBSTR(lt.time, 7, 4) < '00:00';	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(*) FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 18;	formula_1
SELECT drivers.code, COUNT(*) as netherlands_drivers FROM drivers WHERE nationality = 'Netherlands' AND year(dob) = (SELECT MIN(year(dob)) FROM drivers) GROUP BY drivers.code ORDER BY year(dob) ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE surname = 'Kubica' AND forename = 'Robert';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality LIKE '%Australian%' AND YEAR(dob) = 1980;	formula_1
SELECT d.driverId, d.forename, d.surname, MIN(l.time) as earliest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY d.driverId, d.forename, d.surname ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' AND year(dob) = (SELECT MIN(year(dob)) FROM drivers WHERE nationality = 'German') ORDER BY year(dob) ASC LIMIT 1;	formula_1
SELECT driverId, code FROM drivers WHERE YEAR(dob) = 1971 AND fastestLapTime IS NOT NULL ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT d.driverRef, d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish' AND YEAR(d.dob) < 1982 GROUP BY d.driverId ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT year FROM races WHERE fastestLapTime IS NOT NULL ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId GROUP BY year ORDER BY MAX(lapTimes.time) ASC LIMIT 1;	formula_1
SELECT driverId FROM qualifying WHERE q1 = (SELECT MIN(q1) FROM qualifying) GROUP BY driverId ORDER BY q1 ASC LIMIT 5;	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId BETWEEN 50 AND 100  AND statusId = 2  AND time IS NOT NULL;	formula_1
SELECT COUNT(*), circuits.location, circuits.lat, circuits.lng FROM circuits WHERE circuits.country = 'Austria';	formula_1
SELECT number FROM results WHERE laps IS NOT NULL GROUP BY number ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT drivers.driverRef, drivers.forename, drivers.surname, drivers.dob FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 23 AND qualifying.q2 IS NOT NULL;	formula_1
SELECT drivers.forename, drivers.surname, races.date, races.time FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE races.year = (SELECT MIN(year) FROM drivers WHERE YEAR(DOB) = (SELECT MAX(YEAR(DOB)) FROM drivers)) ORDER BY drivers.dob ASC LIMIT 1;	formula_1
SELECT COUNT(*)  FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 2;	formula_1
SELECT constructors.name, constructors.url FROM constructors JOIN constructorStandings cs ON constructors.constructorId = cs.constructorId WHERE constructors.nationality = 'Italian' GROUP BY constructors.constructorId ORDER BY SUM(cs.points) DESC LIMIT 1;	formula_1
SELECT constructors.url FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId GROUP BY constructors.constructorId HAVING SUM(constructorStandings.wins) = (     SELECT MAX(total_wins)     FROM (         SELECT constructorId, SUM(wins) AS total_wins         FROM constructorStandings         GROUP BY constructorId     ) AS subquery );	formula_1
SELECT drivers.forename, drivers.surname, results.time FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'French Grand Prix' AND laps = 3 ORDER BY results.time DESC LIMIT 1;	formula_1
SELECT races.name, MIN(results.milliseconds) AS fastest_lap_time FROM races JOIN results ON races.raceId = results.raceId WHERE results.position = 1 GROUP BY races.name ORDER BY fastest_lap_time ASC LIMIT 1;	formula_1
SELECT AVG(results.fastestLapTime) as average_fastest_lap_time FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE races.year = 2006 AND races.name = 'United States Grand Prix' AND drivers.rank < 11;	formula_1
SELECT d.driverRef, AVG(p.duration) AS avg_duration FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId ORDER BY avg_duration ASC LIMIT 5;	formula_1
SELECT drivers.forename, drivers.surname, results.time FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'Canadian Grand Prix' AND races.year = 2008 AND results.position = 1;	formula_1
SELECT c.constructorRef, c.url FROM constructors c JOIN results r ON c.constructorId = r.constructorId JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Singapore Grand Prix' AND YEAR(ra.date) = 2009 AND s.status = 'Champion' ORDER BY r.points DESC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers WHERE nationality = 'Austrian' AND YEAR(drivers.dob) BETWEEN '1981' AND '1991';	formula_1
SELECT drivers.forename + ' ' + drivers.surname AS fullName, circuits.url AS wikiLink, drivers.dob AS dob FROM drivers JOIN constructors ON drivers.nationality = 'German' JOIN races ON drivers.driverId = results.driverId JOIN circuits ON races.circuitId = circuits.circuitId WHERE EXTRACT(YEAR FROM drivers.dob) BETWEEN 1971 AND 1985 AND drivers.driverId IN (   SELECT driverId   FROM results   JOIN constructors ON results.constructorId = constructors.constructorId   JOIN seasons ON results.year = seasons.year   WHERE constructors.nationality = 'German' ) ORDER BY drivers.dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE circuitRef = 'Hungaroring';	formula_1
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON r.name = 'Monaco Grand Prix' WHERE r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId, c.name, c.nationality ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points) FROM results WHERE raceId IN (   SELECT raceId   FROM races   WHERE name LIKE '%Turkish Grand Prix%'   AND constructorId IN (     SELECT constructorId     FROM constructors     WHERE nationality = 'British'     AND driverRef = 'Lewis Hamilton'   ) );	formula_1
SELECT COUNT(*) / 10 AS annual_average_races FROM races WHERE year >= 2000 AND year < 2011 AND date BETWEEN '2000-01-01' AND '2010-12-31';	formula_1
SELECT MAX(nationality) FROM drivers;	formula_1
SELECT COUNT(*) AS victories FROM driverStandings WHERE driverStandings.position = 91 AND driverStandings.wins > 0;	formula_1
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId WHERE results.fastestLapSpeed = (SELECT MIN(fastestLapSpeed) FROM results);	formula_1
SELECT circuits.name, circuits.location, circuits.country FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.date = (SELECT MAX(date) FROM races) ORDER BY races.date DESC LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = (     SELECT raceId     FROM races     WHERE name LIKE '%Marina Bay Street Circuit%' AND year = 2008 AND q3 = (         SELECT MIN(q3)         FROM qualifying     ) ) AND qualifying.position = 1;	formula_1
SELECT drivers.forename + ' ' + drivers.surname AS fullName, drivers.nationality, races.name AS firstRace FROM drivers JOIN races ON drivers.driverId = results.driverId WHERE races.year = (SELECT MAX(year) FROM seasons) AND drivers.dob = (SELECT MAX(dob) FROM drivers);	formula_1
SELECT COUNT(*)  FROM results  JOIN status ON results.statusId = status.statusId  WHERE raceName = 'Canadian Grand Prix'  AND status.status = 3  GROUP BY driverId  ORDER BY COUNT(*) DESC  LIMIT 1;	formula_1
SELECT drivers.forename, drivers.surname, COUNT(*) AS wins FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.points > 0 GROUP BY drivers.driverId HAVING dob = (SELECT MIN(dob) FROM drivers) LIMIT 1;	formula_1
SELECT MAX(pitStops.duration) AS longest_duration FROM pitStops;	formula_1
SELECT MIN(time) AS fastest_lap_time FROM lapTimes WHERE laps = (SELECT MAX(laps) FROM lapTimes);	formula_1
SELECT MAX(pitStops.duration) AS longest_duration FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis');	formula_1
SELECT lap FROM pitStops WHERE raceId = (SELECT raceId FROM races WHERE name = '2011 Australian Grand Prix' AND url LIKE '%2011%') AND driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton');	formula_1
SELECT drivers.forename, drivers.surname, pitStops.time, pitStops.duration FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId WHERE races.name = '2011 Australian Grand Prix' AND races.year = 2011;	formula_1
SELECT MIN(time) AS fastest_lap_time FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND laps = (SELECT MAX(laps) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'));	formula_1
SELECT drivers.forename, drivers.surname FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes ) ORDER BY lapTimes.milliseconds ASC LIMIT 1;	formula_1
SELECT c.name AS circuit_name, r.name AS race_name, r.year, MIN(l.time) AS fastest_lap_time FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes l ON r.raceId = l.raceId AND l.driverId = (     SELECT driverId     FROM results     WHERE driverRef = 'Lewis Hamilton' AND fastestLap = 1     AND races.year = r.year     LIMIT 1 ) GROUP BY c.circuitId, r.name, r.year ORDER BY fastest_lap_time ASC;	formula_1
SELECT MIN(time) AS lap_record FROM lapTimes WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Austrian Grand Prix');	formula_1
SELECT DISTINCT circuits.name AS circuit_name, MIN(lapTimes.time) AS lap_record_time FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN results ON races.raceId = results.raceId JOIN lapTimes ON results.driverId = lapTimes.driverId AND results.raceId = lapTimes.raceId WHERE circuits.country = 'Italy' GROUP BY circuits.name;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN lapTimes lt ON r.raceId = lt.raceId AND res.driverId = lt.driverId WHERE r.country = 'Austria' AND lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes WHERE raceId = r.raceId) ORDER BY r.year, r.round LIMIT 1;	formula_1
SELECT pitStops.time, pitStops.duration FROM pitStops JOIN results ON pitStops.raceId = results.raceId JOIN drivers ON pitStops.driverId = drivers.driverId JOIN lapsTimes ON pitStops.lap = lapsTimes.lap WHERE lapsTimes.time = (SELECT MIN(time) FROM lapsTimes WHERE raceId = pitStops.raceId AND driverId = drivers.driverId) AND results.raceId = pitStops.raceId AND results.constructorId = (SELECT constructorId FROM results WHERE raceId = pitStops.raceId AND driverId = drivers.driverId AND position = 1) -- Assuming position 1 refers to the winner, who sets the lap record AND results.statusId = (SELECT statusId FROM status WHERE status = 'Finished'); -- Considering the race must be finished for a lap record to be valid	formula_1
SELECT circuits.lat, circuits.lng FROM circuits WHERE circuits.name IN (     SELECT circuits.name     FROM circuits     JOIN results ON circuits.circuitId = results.raceId     JOIN lapTimes ON results.driverId = lapTimes.driverId AND lapTimes.lap = (SELECT MIN(lap) FROM lapTimes WHERE lapTimes.time = '1:29.488')     GROUP BY circuits.name );	formula_1
SELECT AVG(milliseconds) AS average_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis');	formula_1
SELECT AVG(milliseconds) AS average_lap_time FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE circuitId IN (         SELECT circuitId         FROM circuits         WHERE country = 'Italy'     ) );	formula_1
SELECT `player_api_id`  FROM `Player_Attributes`  WHERE overall_rating = (SELECT MAX(overall_rating) FROM `Player_Attributes`)	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`) AND `attacking_work_rate` IS NOT NULL;	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating >= 60 AND pa.overall_rating < 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT `player_api_id`  FROM `Player_Attributes`  GROUP BY `player_api_id`  ORDER BY MAX(`crossing`) DESC  LIMIT 5;	european_football_2
SELECT `League.name` FROM `Match` JOIN `League` ON `Match.league_id` = `League.id` WHERE `Match.season` = '2015/2016' GROUP BY `League.name` ORDER BY SUM(`home_team_goal`, `away_team_goal`) DESC LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) AS lost_matches FROM Match WHERE season = '2015/2016' AND home_team_goal - away_team_goal < 0 GROUP BY home_team_api_id ORDER BY lost_matches ASC LIMIT 1;	european_football_2
SELECT p.player_name FROM Player p WHERE p.penalties = (     SELECT MAX(penalties)     FROM Player ) ORDER BY p.penalties DESC LIMIT 10;	european_football_2
SELECT away_team_api_id, away_team_long_name FROM Match JOIN League ON Match.league_id = League.id JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE League.name = 'Scotland Premier League' AND season = '2009/2010' GROUP BY away_team_api_id HAVING MAX(SUBTRACT(Match.away_team_goal, Match.home_team_goal)) > 0 ORDER BY MAX(SUBTRACT(Match.away_team_goal, Match.home_team_goal)) DESC LIMIT 1;	european_football_2
SELECT team_long_name, buildUpPlaySpeed FROM Team_Attributes WHERE team_fifa_api_id IN (     SELECT team_fifa_api_id     FROM Team     ORDER BY buildUpPlaySpeed DESC     LIMIT 4 ) ORDER BY buildUpPlaySpeed DESC;	european_football_2
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2015/2016' GROUP BY l.id HAVING SUM(m.home_team_goal = m.away_team_goal) = (     SELECT MAX(total_draws)     FROM (         SELECT SUM(CASE WHEN home_team_goal = away_team_goal THEN 1 ELSE 0 END) AS total_draws         FROM Match         WHERE season = '2015/2016'     ) subquery );	european_football_2
SELECT      player_api_id,     (strftime('%Y-%m-%d', 'now') - birthday) AS current_age FROM      Player JOIN      Player_Attributes pa ON Player.player_api_id = pa.player_api_id WHERE      pa.sprint_speed >= 97     AND pa.date >= '2013-01-01 00:00:00'     AND pa.date <= '2015-12-31 00:00:00' GROUP BY      player_api_id HAVING      current_age IS NOT NULL;	european_football_2
SELECT `League.name`, COUNT(*) AS total_matches FROM `Match` GROUP BY `League.name` ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE EXTRACT(YEAR FROM birthday) >= 1990 AND EXTRACT(YEAR FROM birthday) < 1996;	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' GROUP BY player_api_id HAVING overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date, 1, 4) = '2010') ORDER BY overall_rating DESC;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59;	european_football_2
SELECT T.team_long_name FROM Team_Attributes TA JOIN Team T ON TA.team_fifa_api_id = T.team_fifa_api_id WHERE strftime('%Y', TA.date) = '2012' GROUP BY TA.team_long_name HAVING AVG(TA.buildUpPlayPassing) / COUNT(TA.team_long_name) > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012')	european_football_2
SELECT      (COUNT(CASE WHEN player_api_id IN (         SELECT player_api_id         FROM Player         WHERE birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00'         AND preferred_foot = 'left'     ) THEN 1 ELSE NULL END) * 1.0) / COUNT(player_fifa_api_id) AS left_foot_percentage FROM      Player_Attributes;	european_football_2
SELECT `League.name`, SUM(`Match.home_team_goal` + `Match.away_team_goal`) AS total_goals FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` GROUP BY `League.name` ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(`long_shots`) AS average_long_shots FROM Player_Attributes WHERE player_fifa_api_id = (SELECT `player_fifa_api_id` FROM `Player` WHERE player_name = 'Ahmed Samir Farag');	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.height > 180 GROUP BY p.player_name ORDER BY AVG(pa.heading_accuracy) DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team_Attributes T1 JOIN Team T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date >= '2014-01-01 00:00:00' AND T1.date <= '2014-01-31 00:00:00' GROUP BY T1.team_api_id HAVING AVG(T1.chanceCreationPassing) > (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY AVG(T1.chanceCreationPassing) DESC;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.id HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT * FROM Player WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10';	european_football_2
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Franco Zennaro');	european_football_2
SELECT AVG(buildUpPlayPositioningClass) AS average_freedom_of_movement FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' AND date >= '2022-01-01' AND date <= '2022-06-30';	european_football_2
SELECT finishing FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Francois Affolter' AND birthday = '1991-07-01') AND date = '2014-09-18 00:00:00';	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Gabriel Tamas') AND strftime('%Y', `date`) = '2011'	european_football_2
SELECT COUNT(*)  FROM Match  WHERE league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League')  AND season = '2015/2016';	european_football_2
SELECT `preferred_foot`  FROM `Player_Attributes`  WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` ORDER BY `birthday` DESC LIMIT 1)  AND `attacking_work_rate` = 'on';	european_football_2
SELECT * FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) ORDER BY potential DESC;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.weight < 130 AND pa.preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'David Wilson';	european_football_2
SELECT `birthday` FROM `Player` WHERE `player_fifa_api_id` IN (SELECT `player_fifa_api_id` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(overall_rating) FROM `Player_Attributes`)) LIMIT 1;	european_football_2
SELECT `League.name` FROM `League` WHERE `League.country_id` = (SELECT `id` FROM `Country` WHERE `name` = 'Netherlands');	european_football_2
SELECT AVG(home_team_goal) AS average_home_team_goal FROM Match WHERE country_id IN (SELECT id FROM Country WHERE name = 'Poland') AND season = '2010/2011';	european_football_2
SELECT player_name, AVG(finishing) AS avg_finishing_rate FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.height IN (SELECT MAX(height) FROM Player, (SELECT MIN(height) FROM Player) AS min_height) GROUP BY player_name ORDER BY avg_finishing_rate DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT DISTINCT Player.player_name FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player_Attributes.overall_rating > 80 AND strftime('%Y', Player_Attributes.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Aaron Doran');	european_football_2
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left';	european_football_2
SELECT `Team.team_long_name` FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `Team_Attributes.buildUpPlaySpeedClass` = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_short_name = 'CLB';	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlayPassing > 70;	european_football_2
SELECT AVG(`overall_rating`)  FROM Player_Attributes  WHERE strftime('%Y', `date`) BETWEEN '2010' AND '2015'  AND `height` > 170;	european_football_2
SELECT p.player_name, p.height FROM Player p ORDER BY p.height ASC LIMIT 1;	european_football_2
SELECT `country.name` FROM `League` WHERE `name` = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran');	european_football_2
SELECT COUNT(*)  FROM Match  WHERE league_id IN (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga')  AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT team_short_name FROM Match WHERE home_team_goal = 10;	european_football_2
SELECT * FROM Player_Attributes WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61)	european_football_2
SELECT AVG(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE NULL END) - AVG(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE NULL END) AS difference_in_ball_control_average FROM Player_Attributes;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT p1.player_name FROM Player AS p1 JOIN Player_Attributes AS pa1 ON p1.player_api_id = pa1.player_api_id JOIN Player AS p2 ON p2.player_api_id = pa1.player_api_id JOIN Player_Attributes AS pa2 ON p2.player_api_id = pa2.player_api_id WHERE pa1.date < pa2.date AND p1.player_api_id IN (218353, 505942) -- Aaron Lennon's FIFA API ID AND p2.player_api_id IN (218353, 505942) -- Abdelaziz Barrada's FIFA API ID AND p1.player_api_id != p2.player_api_id ORDER BY p1.birthday ASC LIMIT 1;	european_football_2
SELECT `player_name`, `height` FROM `Player` WHERE height = (SELECT MAX(height) FROM `Player`);	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT `country.name` FROM `League` WHERE `name` = 'Belgium Jupiler League';	european_football_2
SELECT DISTINCT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany';	european_football_2
SELECT `player_name`  FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `strength` = (SELECT MAX(`strength`) FROM `Player_Attributes`) ORDER BY `strength` DESC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM Player WHEREstrftime('%Y', birthday) < '1986' AND player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE defensive_work_rate = 'high' );	european_football_2
SELECT player_name FROM Player_Attributes WHERE player_api_id IN (   SELECT player_api_id   FROM Player_Attributes   WHERE preferred_foot = 'right' -- Assuming right-footed players are more relevant for crossing ) GROUP BY player_api_id ORDER BY AVG(crossing) DESC LIMIT 1;	european_football_2
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Ariel Borysiuk');	european_football_2
SELECT COUNT(*)  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT DISTINCT player_name FROM Player_Attributes WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2008/2009'  AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT `long_passing`  FROM `Player_Attributes`  WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` ORDER BY `birthday` ASC LIMIT 1)	european_football_2
SELECT COUNT(*)  FROM Match  WHERE league_id IN (SELECT id FROM League WHERE name = 'Belgium Jupiler League')  AND strftime('%Y', date) = '2009'  AND strftime('%m', date) = '04';	european_football_2
SELECT `League.name` FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` WHERE `Match.season` = '2008/2009' GROUP BY `League.name` ORDER BY COUNT(`Match.id`) DESC LIMIT 1;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM Player_Attributes WHERE strftime('%Y', `birthday`) < '1986'	european_football_2
SELECT ((SUBTRACT(overall_rating, overall_rating WHERE player_name = 'Paulin Puel') / overall_rating WHERE player_name = 'Paulin Puel') * 100) AS percentage_difference FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk';	european_football_2
SELECT AVG(`buildUpPlaySpeed`) AS average_build_up_play_speed FROM `Team_Attributes` WHERE `team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating) AS average_overall_rating FROM Player_Attributes T1 WHERE T1.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(crossing) AS total_crossing_score FROM Player_Attributes WHERE player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing) AS highest_score, chanceCreationPassingClass FROM Team_Attributes WHERE team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo' AND player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Abdou Diallo');	european_football_2
SELECT MAX(overall_rating) FROM Player_Attributes WHERE player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal) AS average_goals FROM Match WHERE home_team_long_name = 'Parma' AND country_id IN (SELECT id FROM Country WHERE name = 'Italy') AND away_team_api_id IN (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma');	european_football_2
SELECT `Player.player_name`  FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player_Attributes.overall_rating` = 77 AND `Player_Attributes.date` = '2016-06-23' GROUP BY `Player.player_api_id` ORDER BY `Player.birthday` ASC LIMIT 1;	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Aaron Mooy' AND date = '2016-02-04 00:00:00';	european_football_2
SELECT potential FROM Player_Attributes WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00';	european_football_2
SELECT `attacking_work_rate`  FROM `Player_Attributes`  WHERE `player_name` = 'Francesco Migliore'  AND `date` = '2015-05-01 00:00:00';	european_football_2
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Kevin Berigaud' AND `date` = '2013-02-22 00:00:00' AND `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Kevin Berigaud');	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant');	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22 00:00:00';	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_long_name = 'FC Lorient' AND date = '2010-02-22';	european_football_2
SELECT chance_creation_passing_class FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00';	european_football_2
SELECT chance_creation_crossing_class FROM Team_Attributes WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass`  FROM `Team_Attributes`  WHERE `team_long_name` = 'Hannover 96'  AND date = '2015-09-10 00:00:00';	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes WHERE player_name = 'Marko Arnautovic' AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00';	european_football_2
SELECT ((`Player_Attributes`.overall_rating - (SELECT `Player_Attributes`.overall_rating FROM `Player_Attributes` WHERE player_name = 'Jordan Bowery' AND date = '2013-07-12')) / (`Player_Attributes`.overall_rating) * 100) AS percentage FROM `Player_Attributes` WHERE player_name = 'Landon Donovan' AND date = '2013-07-12';	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE datetime('CURRENT_TIMESTAMP','localtime') - datetime(birthday) > 34;	european_football_2
SELECT SUM(home_team_goal)  FROM Match  WHERE home_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon');	european_football_2
SELECT SUM(away_team_goal)  FROM Match  WHERE away_player_1 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_2 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_3 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_4 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_5 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_6 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_7 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_8 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_9 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_10 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  OR away_player_11 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith')  AND away_team_api_id IN (SELECT team_api_id FROM Team_Attributes);  UNION  SELECT SUM(away_team_goal)  FROM Match  WHERE away_player_1 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')  OR away_player_2 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')  OR away_player_3 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')  OR away_player_4 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')  OR away_player_5 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')  OR away_player_6 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')  OR away_player_7 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')  OR away_player_8 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')  OR away_player_9 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira')	european_football_2
SELECT SUM(home_team_goal) AS total_home_team_goals FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id OR Match.home_player_2 = Player.player_api_id OR Match.home_player_3 = Player.player_api_id OR Match.home_player_4 = Player.player_api_id OR Match.home_player_5 = Player.player_api_id OR Match.home_player_6 = Player.player_api_id OR Match.home_player_7 = Player.player_api_id OR Match.home_player_8 = Player.player_api_id OR Match.home_player_9 = Player.player_api_id OR Match.home_player_10 = Player.player_api_id OR Match.home_player_11 = Player.player_api_id WHERE DATETIME('now') - DATETIME(Player.birthday) < 31;	european_football_2
SELECT DISTINCT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT `player_name`  FROM `Player_Attributes`  WHERE `potential` = (SELECT MAX(`potential`) FROM `Player_Attributes`)	european_football_2
SELECT p.player_name FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.attacking_work_rate = 'high';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 AND MAX(SUBSTR(p.birthday, 1, 10)) = SUBSTR(p.birthday, 1, 10) ORDER BY SUBSTR(p.birthday, 1, 10) DESC LIMIT 1;	european_football_2
SELECT DISTINCT player_name FROM Player WHERE player_fifa_api_id IN (     SELECT team_fifa_api_id     FROM Team     JOIN League ON Team.country_id = League.id     WHERE League.name = 'Belgium' );	european_football_2
SELECT DISTINCT player_name, country.name  FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id JOIN Country ON Player.country_id = Country.id WHERE vision > 89;	european_football_2
SELECT c.name AS country, AVG(t.weight) AS avg_weight FROM Country c JOIN Team t ON c.id = t.country_id JOIN Player p ON t.team_api_id = p.player_api_id GROUP BY c.name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT T2.team_long_name FROM Team_Attributes T1 JOIN Team T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT t.team_short_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE ta.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy');	european_football_2
SELECT `player_name`  FROM `Player`  WHERE `height` > 180  ORDER BY `player_name` ASC  LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%'  AND birthdate > '1990'	european_football_2
SELECT (jumping AS jumping_diff)  FROM Player_Attributes  WHERE id = 6  SUBTRACT  (SELECT jumping  FROM Player_Attributes  WHERE id = 23);	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) AND preferred_foot = 'right' ORDER BY potential ASC LIMIT 3;	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE preferred_foot = 'left');	european_football_2
SELECT COUNT(*) AS total_players,         SUM(CASE WHEN strength > 80 AND stamina > 80 THEN 1 ELSE 0 END) AS high_strength_stamina_players,        (SUM(CASE WHEN strength > 80 AND stamina > 80 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_high_strength_stamina FROM Player_Attributes;	european_football_2
SELECT DISTINCT T2.name AS country_name FROM Match M JOIN League L ON M.league_id = L.id JOIN Country C ON L.country_id = C.id WHERE M.season LIKE '%Ekstraklasa%' AND M.country_id = (SELECT id FROM Country WHERE name = 'Poland');	european_football_2
SELECT home_team_goal, away_team_goal FROM Match WHERE date LIKE '2008-09-24%' AND league_id IN (SELECT id FROM League WHERE name = 'Belgian Jupiler League') AND (home_team_api_id IS NOT NULL OR away_team_api_id IS NOT NULL);	european_football_2
SELECT sprint_speed, agility, acceleration FROM Player_Attributes WHERE player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016'  AND league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A');	european_football_2
SELECT MAX(home_team_goal)  FROM Match  WHERE league_id IN (SELECT id FROM League WHERE name = 'Netherlands Eredivisie');	european_football_2
SELECT finishing, curve FROM Player_Attributes WHERE player_api_id IN (   SELECT player_api_id   FROM Player   WHERE weight = (SELECT MAX(weight) FROM Player) );	european_football_2
SELECT `League.name` FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` WHERE `Match.season` = '2015/2016' GROUP BY `League.name` ORDER BY COUNT(`Match.id`) DESC LIMIT 1;	european_football_2
SELECT T2.team_long_name FROM Match M JOIN Team T1 ON M.away_team_api_id = T1.team_api_id GROUP BY T1.team_api_id ORDER BY MAX(M.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT `player_name` FROM `Player` WHERE `id` IN (SELECT `home_player_1` FROM `Match` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`)) OR `id` IN (SELECT `away_player_1` FROM `Match` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`));	european_football_2
SELECT (COUNT(*) FILTER (WHERE height < 180 AND overall_rating > 70) / COUNT(*)) * 100 AS percentage_of Players_Under_180_Strength_70 FROM Player;	european_football_2
SELECT      (COUNT(*) WHERE SEX = 'M' AND Admission = '+') -      (COUNT(*) WHERE SEX = 'M' AND Admission = '-') AS inpatient_minus_outpatient_difference,     ((COUNT(*) WHERE SEX = 'M' AND Admission = '+') / (COUNT(*) WHERE SEX = 'M')) * 100 AS male_percentage_inpatient,     ((COUNT(*) WHERE SEX = 'M' AND Admission = '-') / (COUNT(*) WHERE SEX = 'M')) * 100 AS male_percentage_outpatient FROM Patient;	thrombosis_prediction
SELECT CAST(COUNT(*) AS REAL) FILTER (WHERE YEAR(Birthday) > '1930' AND SEX = 'F') / COUNT(*) * 100 AS 'Percentage of Female Patients Born After 1930' FROM Patient;	thrombosis_prediction
SELECT      COUNT(CASE WHEN Admission = '+' THEN 1 END) * 100.0 /      (SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31') FROM Patient WHERE YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31' AND Admission = '+';	thrombosis_prediction
SELECT DIVIDE(COUNT(*) WHERE Diagnosis = 'SLE' AND Admission = '+', COUNT(*) WHERE Diagnosis = 'SLE' AND Admission = '-') AS OutpatientToInpatientRatio FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Description AS Disease, l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609 ORDER BY l.Date;	thrombosis_prediction
SELECT p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109 AND e.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500;	thrombosis_prediction
SELECT p.ID, EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RVVT = '+'	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = '1937' AND L.`T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT ((COUNT(*) FILTER (WHERE Patient.SEX = 'F' AND Laboratory.TP < 6.0 OR Laboratory.TP > 8.5)) / COUNT(DISTINCT Laboratory.ID)) * 100 AS 'Percentage_of_Female_with_TP_out_of_range' FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID;	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS avg_anti_cardiolipin_IgG FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Admission = '+' AND SUBTRACT(CURRENT_TIMESTAMP, Patient.Birthday) >= 50;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'  AND YEAR(Birthday) = 1997  AND Admission = '-'  AND EXISTS (     SELECT 1      FROM Examination      WHERE Examination.Patient.ID = Patient.ID      AND YEAR(`First Date`) = 1997 );	thrombosis_prediction
SELECT AVG(SUBTRACT(YEAR(Birthday), YEAR(`First Date`))) AS youngest_age FROM Patient WHERE `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.Year = 1997 AND Examination.Thrombosis = 1 AND Patient.SEX = 'F';	thrombosis_prediction
SELECT MAX(year(Birthday)) - MIN(year(Birthday)) AS age_gap FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE TG >= 200 )	thrombosis_prediction
SELECT Symptoms, Diagnosis FROM Examination WHERE Patient.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY Patient.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT CASE WHEN Patient.SEX = 'M' THEN Patient.ID END) / 12 FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY YEAR(Laboratory.Date);	thrombosis_prediction
SELECT Laboratory.Date, EXTRACT(YEAR FROM Patient.Birthday) - EXTRACT(YEAR FROM Patient.`First Date`) AS Age FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.TP = 'SJS' AND Laboratory.Date = (SELECT MIN(Date) FROM Laboratory WHERE TP = 'SJS') GROUP BY Laboratory.Date, Patient.Birthday, Patient.`First Date` ORDER BY Age DESC LIMIT 1;	thrombosis_prediction
SELECT     COUNT(CASE WHEN SEX = 'M' AND UA <= 8.0 THEN 1 END) / COUNT(CASE WHEN SEX = 'F' AND UA <= 6.5 THEN 1 END) AS MaleToFemaleRatio FROM     Patient JOIN     Laboratory ON Patient.ID = Laboratory.ID WHERE     Laboratory.UA IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient LEFT JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.ID IS NULL AND DATEDIFF(YEAR, `First Date`, `Examination Date`) >= 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE YEAR(Birthday) < 18 AND EXISTS (     SELECT 1     FROM Examination     WHERE Patient.ID = Examination.ID     AND Examination.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31' );	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE SEX = 'M' AND `T-BIL` > 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS IllnessCount FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY IllnessCount DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT('1991', year(Birthday))) AS average_age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT p.Birthday,         EXTRACT(YEAR FROM (EXAMINATION_DATE - p.Birthday)) AS Age,         d.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.HGB = (SELECT MAX(hg.HGB) FROM Laboratory hg WHERE hg.ID = p.ID) GROUP BY p.ID, p.Birthday, d.Diagnosis;	thrombosis_prediction
SELECT `ANA`  FROM Examination  WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  WHERE Patient.ID = 2927464  AND Date = '1995-09-04'  AND `T-CHO` < 250;	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'AORTITIS' ORDER BY p.ID ASC LIMIT 1;	thrombosis_prediction
SELECT aCL IgM FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Diagnosis = 'SLE' AND Description = '1994-02-19' AND `Examination Date` = '1993-11-12';	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date = '1992-06-12' AND l.GPT = 9;	thrombosis_prediction
SELECT DATEDIFF('1992', year(P.Birthday)) AS AgeAtTime FROM Patient P JOIN Laboratory L ON P.ID = L.ID AND L.Date = '1991-10-21' AND L.UA = '8.4'	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  WHERE Patient.ID = (     SELECT ID      FROM Patient      WHERE `First Date` = '1991-06-13' AND Diagnosis = 'SJS' ) AND Date BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.`Examination Date` = '1997-01-27' AND p.`First Date` IS NOT NULL;	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Patient.ID IN (   SELECT ID   FROM Patient   WHERE Birthday = '1959-03-01' ) AND `Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT ((SUM(CASE WHEN Birthday = '1959-02-18' AND Date like '1981-12-%' THEN `T-CHO`) - SUM(CASE WHEN Birthday = '1959-02-18' AND Date like '1981-11-%' THEN `T-CHO`)) / SUM(CASE WHEN Birthday = '1959-02-18' THEN 1 END)) AS DecreaseRate FROM Laboratory WHERE Patient.ID IN (SELECT ID FROM Patient WHERE Birthday = '1959-02-18');	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'Behcet' AND YEAR(e.Description) >= '1997-01-01' AND YEAR(e.Description) < '1998-01-01';	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date BETWEEN '1987-07-06' AND '1996-01-31' AND l.GPT > 30 AND l.ALB < 4;	thrombosis_prediction
SELECT p.ID FROM Patient p WHERE p.SEX = 'F' AND YEAR(p.Birthday) = 1964 AND p.Admission = '+';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis = 2 AND e.ANA = 'S' AND e.`aCL IgM` > (AVG(e.`aCL IgM`) * 1.2)	thrombosis_prediction
SELECT COUNT(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 AND UA <= 6.5 THEN 1 END) * 100.0 / COUNT(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 END) AS percentage FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.UA <= 6.5 AND Laboratory.`U-PRO` > 0 AND Laboratory.`U-PRO` < 30;	thrombosis_prediction
SELECT (SUM(CASE WHEN Diagnosis = 'BEHCET' AND YEAR(`First Date`) = '1981' THEN 1 ELSE 0 END) / COUNT(CASE WHEN YEAR(`First Date`) = '1981' THEN 1 END)) * 100 FROM Patient WHERE SEX = 'M' AND YEAR(`First Date`) = '1981'	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.T-BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'  AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31'  AND ID NOT IN (SELECT Patient.ID FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.ANA = 256 AND Examination.`ANA Pattern` = 'P')	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE SEX = 'F' AND PLT > 400 AND Diagnosis = 'SLE';	thrombosis_prediction
SELECT MAX(Symptoms) AS MostCommonSymptom FROM Examination WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT `Description`, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  WHERE Date BETWEEN '1997-01-01' AND '1997-12-31'  AND TP > 8.5 OR TP < 6;	thrombosis_prediction
SELECT (SUM(CASE WHEN Thrombosis = 1 AND Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS proportion_with_thrombocytopenia_and_SLE FROM Examination;	thrombosis_prediction
SELECT (COUNT(*) FILTER (WHERE SEX = 'F' AND YEAR(Birthday) = '1980' AND Diagnosis = 'RA') * 100.0) / COUNT(*) AS 'Percentage_of_Women_with_RA' FROM Patient WHERE YEAR(Birthday) = '1980' AND Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.SEX = 'M'  AND Examination.Diagnosis = 'BEHCET'  AND Examination.Admission = '-'  AND Examination.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM Patient WHERE ID = 821298;	thrombosis_prediction
SELECT * FROM Laboratory WHERE Patient.ID = 57266 AND (SEX = 'M' AND UA > 8.0 OR (SEX = 'F' AND UA > 6.5)) AND Date = (SELECT MAX(Date) FROM Laboratory WHERE Patient.ID = 57266);	thrombosis_prediction
SELECT `Date` FROM Laboratory WHERE Patient.ID = 48473 AND GOT >= 60;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date BETWEEN '1994-01-01' AND '1994-12-31' AND l.GOT < 60;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 GROUP BY p.ID, p.Birthday ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE ID IN (     SELECT Patient.ID     FROM Patient     JOIN Laboratory ON Patient.ID = Laboratory.ID     WHERE Laboratory.LDH < 500 )	thrombosis_prediction
SELECT p.ID, EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT p.Admission FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.ALP < 300 AND p.Admission IN ('+', '-')	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT (TP - 8.5) AS Deviation FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND TP > 8.5;	thrombosis_prediction
SELECT * FROM Patient WHERE SEX = 'M' AND ALB <= 3.5 OR ALB >= 5.5 ORDER BY Birthday DESC;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday,  CASE      WHEN Laboratory.ALB BETWEEN 3.5 AND 5.5 THEN 'Normal'     ELSE 'Not Normal' END AS Albumin_Range FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Year(Patient.Birthday) = 1982;	thrombosis_prediction
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F') AS Female_Patient_Uric_Acid_Beyond_Range FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE (SEX = 'F' AND UA > 6.5) OR (SEX = 'M' AND UA > 8.0) AND Laboratory.UA IS NOT NULL;	thrombosis_prediction
SELECT AVG(`UA`) as average-UA-index FROM Laboratory WHERE (`SEX` = 'M' AND `UA` < 8.0) OR (`SEX` = 'F' AND `UA` < 6.5) AND Patient.ID = Laboratory.ID AND Date = (SELECT MAX(Date) FROM Laboratory WHERE Patient.ID = Laboratory.ID);	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'RA' AND l.UN < 30;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5;	thrombosis_prediction
SELECT (COUNT(*) WHERE Patient.SEX = 'M' AND Laboratory.CRE >= 1.5) > (COUNT(*) WHERE Patient.SEX = 'F' AND Laboratory.CRE >= 1.5) AS result;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T-BIL = (SELECT MAX(T-BIL) FROM Laboratory) GROUP BY p.ID, p.SEX, p.Birthday;	thrombosis_prediction
SELECT p.SEX, COUNT(*) as Total_Patients FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` >= 2.0 GROUP BY p.SEX;	thrombosis_prediction
SELECT p.ID, l.T-CHO FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date = (SELECT MAX(Date) FROM Laboratory WHERE p.ID = Laboratory.ID) GROUP BY p.ID ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(YEAR(CURRENT_DATE) - YEAR(Birthday), COUNT(ID))) as average_age FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE SEX = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.TG >= 200  AND (SUBTRACT(CURRENT_TIMESTAMP, Patient.Birthday) > 50);	thrombosis_prediction
SELECT DISTINCT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Admission = '-' AND Laboratory.CPK < 250;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.Birthday BETWEEN '1936-01-01' AND '1956-12-31'  AND Patient.SEX = 'M'  AND Laboratory.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l.T-CHO < 250 AND p.ID NOT IN (     SELECT ID     FROM Laboratory     WHERE GLU < 180 OR T-CHO >= 250 );	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Description >= '1991-01-01' AND l.GLU < 180 ORDER BY p.ID;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC < 3.5 OR l.WBC >= 9.0 GROUP BY p.SEX, EXTRACT(YEAR FROM CURRENT_DATE - p.Birthday), p.ID ORDER BY p.SEX, EXTRACT(YEAR FROM CURRENT_DATE - p.Birthday);	thrombosis_prediction
SELECT p.ID, EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) AS Age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RBC < 3.5 AND p.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) >= 50 AND (l.RBC <= 3.5 OR l.RBC >= 6.0) AND (p.Admission = '+' OR p.Admission = '-')	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.HGB BETWEEN 10 AND 17 GROUP BY p.ID, p.SEX HAVING p.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.HGB BETWEEN 10 AND 17)) ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT p.ID, age = EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM p.Birthday) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID, age HAVING COUNT(l.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29 AND ID IN (SELECT ID FROM Patient            WHERE ID IN (SELECT ID FROM Examination                        WHERE `Examination Date` BETWEEN '1991-01-01' AND '1991-12-31'));	thrombosis_prediction
SELECT      (SUM(CASE WHEN Laboratory.PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN Laboratory.PLT > 400 THEN 1 ELSE 0 END)) AS difference_in_counts FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Laboratory.PLT < 100 OR Laboratory.PLT > 400;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.Date LIKE '1984%' AND DATEDIFF(CURRENT_DATE, p.Birthday) / 365 < 50 AND l.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT ((SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END)) * 1.0) AS percentage_female_abnormal_PT FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE DATEDIFF(year(CURRENT_TIMESTAMP), Birthday) > 55;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.`First Date` > '1992-12-31' AND l.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE `Examination Date` > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.APTT > 45 AND e.Thrombosis = 3 GROUP BY e.ID HAVING COUNT(*) = 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.WBC BETWEEN 3.5 AND 9.0 AND (Laboratory.FG <= 150 OR Laboratory.FG >= 450) GROUP BY Patient.ID HAVING COUNT(*) = 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday > '1980-01-01' AND Laboratory.FG NOT BETWEEN 150 AND 450;	thrombosis_prediction
SELECT DISTINCT Diagnosis FROM Examination WHERE `U-PRO` >= 30;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`U-PRO` BETWEEN 0 AND 30 AND p.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`aCL IgG` < 900 AND p.Symptoms = 'abortion';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.`aCL IgG` BETWEEN 900 AND 2000  AND p.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE IGA BETWEEN 80 AND 500 AND IGA = (SELECT MAX(IGA) FROM Examination WHERE IGA BETWEEN 80 AND 500) ORDER BY IGA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.`aCL IgA` BETWEEN 80 AND 500  AND YEAR(`First Date`) >= 1990;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS DiseaseCount FROM Examination WHERE `aCL IgM` NOT BETWEEN 40 AND 400 GROUP BY Diagnosis ORDER BY DiseaseCount DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE ID NOT IN (SELECT Patient.ID FROM Laboratory WHERE CRP LIKE '+' OR CRP LIKE '-' OR CRP < 1.0 AND Description IS NOT NULL)	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRP NOT IN('-+', '-') AND Laboratory.CRP >= 1.0 AND (YEAR(CURRENT_DATE()) - YEAR(Laboratory.Birthday)) < 18;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RA = '-' AND e.KCT = '+'	thrombosis_prediction
SELECT DISTINCT Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE YEAR(Birthday) >= 1995 AND RA IN('-', '+-') AND Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RF < 20 AND SUBTRACT(YEAR(CURRENT_DATE()), YEAR(p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.RF < 20 AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.C3 > 35 AND e.ANA_PATTERN = 'P';	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.HCT NOT BETWEEN 29 AND 52 AND e.`aCL IgA` = (     SELECT MAX(`aCL IgA`)     FROM Examination     WHERE HCT NOT BETWEEN 29 AND 52 ) ORDER BY e.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 1 AND e.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RNP IN ('-', '+-') AND Laboratory.Admission = '+';	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN('-','+-') GROUP BY p.Birthday ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.SM IN('-+', '0') AND e.Thrombosis = 1;	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.SM NOT IN('-+', '') ORDER BY P.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` >= '1997-01-01' AND e.SC170 IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SC170 IN('-+', 'normal') AND p.SEX = 'M' AND e.Symptoms = 'vertigo';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.SSA IN('-','+-') AND YEAR(Laboratory.Date) < 1990;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA NOT IN('-+', '') ORDER BY p.`First Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis = 'SLE' AND Laboratory.SSB IN ('-', '+-') AND Laboratory.SSA IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.SSB IN('-','+-') AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.CENTROMEA IN('-+', '+-') AND Laboratory.SSB IN('-+', '+-') AND Patient.SEX = 'M';	thrombosis_prediction
SELECT DISTINCT Diagnosis FROM Examination WHERE `DNA` >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.DNA < 8 AND Patient.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.DNA-II >= 8 AND Laboratory.Admission = '+';	thrombosis_prediction
SELECT (COUNT(*) FILTER (WHERE Laboratory.GOT >= 60 AND Patient.Diagnosis = 'SLE') * 1.0 / COUNT(Laboratory.ID FILTER (WHERE Laboratory.GOT >= 60))) AS Percentage_SLE_GOT_Abnormal FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND Laboratory.GOT < 60;	thrombosis_prediction
SELECT MIN(`Birthday`)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GOT >= 60;	thrombosis_prediction
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT < 60 GROUP BY P.Birthday ORDER BY MAX(L.GPT) DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M';	thrombosis_prediction
SELECT MIN(`First Date`)  FROM Laboratory  WHERE LDH < 500 AND ID IN (SELECT ID FROM Laboratory GROUP BY ID HAVING MAX(LDH))  AND ID IN (SELECT ID FROM Patient);	thrombosis_prediction
SELECT MAX(`First Date`)  FROM Patient  WHERE ID IN (SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE LDH >= 500);	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory  WHERE ALP >= 300 AND Admission = '+'  AND Patient.ID = Laboratory.ID;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Admission = '-' AND ALP < 300;	thrombosis_prediction
SELECT DISTINCT Diagnosis FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Diagnosis = 'SJS' AND p.ID IN (     SELECT p.ID     FROM Laboratory l     JOIN Patient p ON l.ID = p.ID     WHERE l.Date = MAX(l.Date) AND l.TP > 6.0 AND l.TP < 8.5 )	thrombosis_prediction
SELECT `Examination Date` FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.ALB > 3.5 AND Laboratory.ALB < 5.5 GROUP BY Examination.ID ORDER BY Laboratory.ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M'  AND Laboratory.ALB > 3.5  AND Laboratory.ALB < 5.5  AND Laboratory.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT `aCL IgG`, `aCL IgM`, `aCL IgA` FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.SEX = 'F' AND Laboratory.UA > 6.50 AND (Examination.`aCL IgG` = MAX(Laboratory.UA) OR Examination.`aCL IgM` = MAX(Laboratory.UA) OR Examination.`aCL IgA` = MAX(Laboratory.UA)) ORDER BY Laboratory.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(`ANA`) AS highest_ana_concentration FROM Examination WHERE Patient.ID IN (SELECT ID FROM Laboratory WHERE CRE < 1.5) AND `ANA` IS NOT NULL;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.CRE < 1.5 AND l.aCL IgA = (     SELECT MAX(aCL IgA)     FROM Laboratory     WHERE p.ID = Laboratory.ID );	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.`T-BIL` >= 2.0 AND e.ANA LIKE '%P%'	thrombosis_prediction
SELECT `ANA`  FROM Examination  WHERE `Patient`.`ID` = (     SELECT `Patient`.`ID`      FROM Laboratory      WHERE `T-BIL` < 2.0      GROUP BY `Patient`.`ID`      ORDER BY MAX(`T-BIL`) DESC      LIMIT 1 ) AND `ANA` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Laboratory WHERE Patient.ID IN (     SELECT Patient.ID     FROM Laboratory     WHERE T-CHO >= 250 ) AND KCT = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ANA_PATTERN = 'P' AND l.T-_CHO < 250;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE TG < 200 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.TG = (SELECT MAX(TG) FROM Laboratory WHERE TG < 200) AND Patient.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Thrombosis = 0 AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.CPK < 250 AND (l.KCT = '+' OR l.RVVT = '+' OR l.LAC = '+')	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU > 180 GROUP BY p.ID ORDER BY p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE Admission = '+'  AND Patient.ID IN (     SELECT Patient.ID      FROM Laboratory      WHERE WBC BETWEEN 3.5 AND 9.0 )	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Diagnosis = 'SLE' AND WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC < 3.5 OR l.RBC >= 6.0 AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.PLT > 100 AND p.PLT < 400 AND e.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT p.ID, p.PatientName, l.PLT FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'MCTD' AND (l.PLT > 100 AND l.PLT < 400);	thrombosis_prediction
SELECT AVG(PT) as average_PT FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'M' AND PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Thrombosis IN (2, 1) AND e.PT < 14;	thrombosis_prediction
SELECT major_name FROM member WHERE first_name = 'Angela' AND last_name = 'Sanders' AND link_to_major IS NOT NULL;	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major mj ON m.link_to_major = mj.major_id WHERE mj.department = 'Art and Design';	student_club
SELECT COUNT(*) FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*)  FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer'  AND member.t_shirt_size = 'Medium';	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_id HAVING COUNT(attendance.link_to_event) = (     SELECT MAX(count_attendance)     FROM (         SELECT COUNT(*) AS count_attendance         FROM event         JOIN attendance ON event.event_id = attendance.link_to_event         GROUP BY event.event_id     ) AS subquery ) ORDER BY COUNT(attendance.link_to_event) DESC LIMIT 1;	student_club
SELECT m.college FROM member m WHERE m.position = 'Vice President';	student_club
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event WHERE attendance.link_to_member = 'Maya McLean';	student_club
SELECT COUNT(*) FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND YEAR(event.event_date) = 2019;	student_club
SELECT COUNT(*)  FROM event  JOIN attendance ON event.event_id = attendance.link_to_event  WHERE event.type = 'Meeting'  GROUP BY event.event_id  HAVING COUNT(attendance.link_to_member) > 10;	student_club
SELECT event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_id HAVING COUNT(attendance.link_to_member) > 20;	student_club
SELECT AVG(COUNT(event_id)) / COUNT(DISTINCT event_name) AS average_attendance FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT MAX(cost) AS most_expensive_item FROM expense WHERE link_to_event IS NOT NULL;	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = 'major_name_of_Environmental_Engineering';	student_club
SELECT member.first_name, member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Law and Constitutional Studies';	student_club
SELECT zip_county FROM member WHERE first_name = 'Sherri' AND last_name = 'Ramsey';	student_club
SELECT college FROM major WHERE major_id = (     SELECT link_to_major     FROM member     WHERE first_name = 'Tyler' AND last_name = 'Hewitt' );	student_club
SELECT SUM(amount) FROM income WHERE link_to_member IN (   SELECT member_id   FROM member   WHERE position = 'Vice President' );	student_club
SELECT SUM(expense.cost) AS total_spent_on_food FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE expense.category = 'Food' AND event.event_name = 'September Meeting';	student_club
SELECT m.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President';	student_club
SELECT member.first_name, member.last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Illinois';	student_club
SELECT SUM(expense.cost) AS total_spent FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Advertisement' AND event.event_name = 'September Meeting';	student_club
SELECT department FROM major WHERE major_id IN (   SELECT link_to_major   FROM member   WHERE first_name = 'Pierce' AND last_name = 'Guidi' );	student_club
SELECT SUM(amount) AS total_budgeted_amount FROM budget WHERE link_to_event = 'rec0akZnLLpGUloLH';	student_club
SELECT approved FROM expense WHERE event_name = 'October Meeting' AND event_date = '2019-10-08';	student_club
SELECT SUM(cost) / COUNT(*) AS average_cost FROM expense WHERE link_to_member = 'Elijah Allen' AND EXTRACT(MONTH FROM expense_date) IN (9, 10);	student_club
SELECT SUM(CASE WHEN YEAR(event_date) = 2019 THEN spent ELSE 0 END) - SUM(CASE WHEN YEAR(event_date) = 2020 THEN spent ELSE 0 END) AS difference_spent FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE type = 'Student_Club');	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Posters'  AND event_date = '2019-09-04';	student_club
SELECT MAX(budget.amount) AS biggest_budget_food, budget.remaining FROM budget WHERE budget.category = 'Food';	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE last_name = 'Jacobs' AND first_name = 'Carlo';	student_club
SELECT z.city, z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*)  FROM budget  WHERE link_to_event = 'rec0akZnLLpGUloLH' AND remaining < 0;	student_club
SELECT SUM(amount)  FROM budget  WHERE link_to_event = 'September Speaker';	student_club
SELECT event_status FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Post Cards, Posters' AND expense.expense_date = '2019-08-20';	student_club
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  WHERE link_to_major = 'Human Development and Family Studies'  AND t_shirt_size = 'Large';	student_club
SELECT z.type FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.member_id = 'Christof Nielson';	student_club
SELECT m.major_name FROM member m JOIN position p ON m.position = 'Vice President' JOIN major mj ON m.link_to_major = mj.major_id;	student_club
SELECT z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT m.department FROM member m WHERE m.position = 'President';	student_club
SELECT i.date_received FROM income i WHERE i.link_to_member = 'Connor Hilton' AND i.source = 'Dues';	student_club
SELECT member.first_name, member.last_name FROM member WHERE source = 'Dues' AND date_received = (SELECT MIN(date_received) FROM income WHERE source = 'Dues');	student_club
SELECT COUNT(*) AS difference_in_budget FROM budget WHERE category = 'Advertisement' AND (event_name = 'Yearly Kickoff' AND SUM(amount) > (SELECT SUM(amount) FROM budget WHERE event_name = 'October Meeting' AND category = 'Advertisement') / (SELECT COUNT(*) FROM budget WHERE event_name = 'Yearly Kickoff' AND category = 'Advertisement'));	student_club
SELECT (SUM(CASE WHEN category = 'Parking' AND event_name = 'November Speaker' THEN amount ELSE 0 END) / COUNT(*) * 100) AS parking_percentage FROM budget;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(*) FROM zip_code WHERE type = 'city' AND county = 'Orange' AND state = 'Virginia';	student_club
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT z.city, z.county, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Amy' AND m.last_name = 'Firth';	student_club
SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget) ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';	student_club
SELECT major.college, COUNT(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT m.major_name FROM member m WHERE m.phone = '809-555-3360';	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event GROUP BY event.event_id ORDER BY budget.amount DESC LIMIT 1;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_event = 'rec2N69DMcrqN9PJC';	student_club
SELECT income.date_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Casey' AND member.last_name = 'Mason';	student_club
SELECT COUNT(*)  FROM member  WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'Maryland')  AND zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland');	student_club
SELECT COUNT(*)  FROM attendance  WHERE link_to_member IN (   SELECT member_id    FROM member    WHERE phone = '954-555-6240' );	student_club
SELECT member.first_name, member.last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event.event_name, EXPENSES.spent / EXPENSES.amount AS spend_to_budget_ratio FROM event JOIN budget ON event.event_id = budget.link_to_event JOIN expense ON budget.budget_id = expense.link_to_budget WHERE event.status = 'Closed' GROUP BY event.event_name ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent) as total_spent_on_food FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT DISTINCT m.member_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT member.first_name, member.last_name FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';	student_club
SELECT SUM(income.amount)  FROM income  WHERE link_to_member = 'Grant Gilmour';	student_club
SELECT member.first_name, member.last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.amount > 40;	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_description = 'Yearly Kickoff';	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN budget b ON m.member_id = b.link_to_member WHERE b.category = 'Yearly Kickoff' AND b.event_status = 'Open';	student_club
SELECT member.first_name, member.last_name, income.source FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.amount = (SELECT MAX(income.amount) FROM income) ORDER BY income.amount DESC;	student_club
SELECT event_name FROM event WHERE event_id IN (   SELECT link_to_event   FROM expense   WHERE approved = 'Approved' ) ORDER BY cost ASC LIMIT 1;	student_club
SELECT ((SUM(CASE WHEN expense.event_name = 'Yearly Kickoff' THEN expense.cost ELSE 0 END) / SUM(expense.cost)) * 100) AS 'Percentage of Cost for Yearly Kickoff' FROM expense JOIN event ON expense.link_to_event = event.event_id;	student_club
SELECT COUNT(CASE WHEN major_name = 'Finance' THEN 1 END) / COUNT(CASE WHEN major_name = 'Physics' THEN 1 END) AS finance_to_physics_ratio FROM member JOIN major ON member.link_to_major = major.major_id;	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY amount DESC LIMIT 1;	student_club
SELECT member.first_name, member.last_name, member.email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Physics Teaching');	student_club
SELECT COUNT(*) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Community Theater' AND YEAR(event.event_date) = 2019;	student_club
SELECT COUNT(*) AS number_of_events, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.member_id = 'Luisa Guidi' GROUP BY m.member_id, m.major_name;	student_club
SELECT AVG(CAST(spent AS REAL)) FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT event_name FROM budget WHERE category = 'Advertisement' GROUP BY event_name ORDER BY MAX(spent) DESC LIMIT 1;	student_club
SELECT COUNT(*) > 0 FROM attendance WHERE link_to_event = 'rec2N69DMcrqN9PJC' AND link_to_member = 'member_id_of_Maya_Mclean';	student_club
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) / COUNT(event_id)) * 100 FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31' AND link_to_member IN (SELECT link_to_member FROM member WHERE link_to_major IS NOT NULL);	student_club
SELECT SUM(cost) AS total_cost FROM expense WHERE expense_description = 'Posters' AND link_to_event IN (   SELECT event_id   FROM event   WHERE event_name = 'September Speaker' );	student_club
SELECT t_shirt_size, COUNT(*) AS count FROM member GROUP BY t_shirt_size ORDER BY count DESC LIMIT 1;	student_club
SELECT event_name FROM event WHERE status = 'Closed' AND event_id IN (     SELECT link_to_event     FROM budget     WHERE remaining < 0     AND remaining = (         SELECT MIN(remaining)         FROM budget AS b2         WHERE b2.link_to_event = budget.link_to_event         AND b2.remaining < 0     ) );	student_club
SELECT expense.expense_type, SUM(expense.cost) AS total_approved_value FROM expense JOIN event ON expense.link_to_event = 'October Meeting' WHERE event.event_name = 'October Meeting' AND expense.approved = 'Approved' GROUP BY expense.expense_type;	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'April Speaker' ORDER BY b.amount ASC;	student_club
SELECT MAX(amount) as highest_food_budget FROM budget WHERE category = 'Food';	student_club
SELECT budget_id, category, MAX(amount) as max_amount FROM budget WHERE category = 'Advertising' GROUP BY budget_id, category ORDER BY max_amount DESC LIMIT 3;	student_club
SELECT SUM(cost) AS total_cost_spent FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id, m.first_name, m.last_name;	student_club
SELECT expense.expense_description FROM expense WHERE link_to_member = 'Sacha Harrison';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT major_name FROM member WHERE first_name = 'Phillip' AND last_name = 'Cullen' AND link_to_major IS NOT NULL;	student_club
SELECT member.position FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = 'Business' AND t_shirt_size = 'Medium';	student_club
SELECT DISTINCT type FROM budget WHERE remaining > 30;	student_club
SELECT DISTINCT category FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.location = 'MU 215';	student_club
SELECT category FROM event WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT DISTINCT m.major_name FROM member m WHERE m.position = 'Vice President';	student_club
SELECT (SUM(CASE WHEN position = 'Member' AND major_name = 'Mathematics' THEN 1 ELSE 0 END) / COUNT(member_id)) * 100 AS percentage_mathematics_members FROM member JOIN major ON member.link_to_major = major.major_id;	student_club
SELECT DISTINCT category FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*)  FROM income  WHERE amount = 50;	student_club
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.last_name, m.major_name AS department, m.college FROM member m JOIN major ON m.link_to_major = major.major_id WHERE m.major_name = 'Environmental Engineering';	student_club
SELECT DISTINCT b.category FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT m.city, z.state FROM member m JOIN major m1 ON m.link_to_major = m1.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE m1.department = 'Electrical and Computer Engineering' AND m.position = 'Member';	student_club
SELECT event_name FROM event JOIN member ON event.location = member.location WHERE member.position = 'Vice President' AND event.type = 'Social' AND member.zip = (SELECT zip_code FROM zip_code WHERE short_state = 'IL' AND city = 'Champaign' AND street_address LIKE '900 E. Washington St.');	student_club
SELECT last_name, position FROM member JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Pizza' AND expense.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member';	student_club
SELECT (COUNT(*) FILTER (WHERE member.t_shirt_size = 'Medium' AND position = 'Member' AND income.amount = 50))::REAL / COUNT(*) FILTER (WHERE member.t_shirt_size = 'Medium' AND position = 'Member') * 100 AS percentage FROM member INNER JOIN income ON member.member_id = income.link_to_member WHERE income.amount = 50;	student_club
SELECT DISTINCT z.city, z.state, z.short_state FROM zip_code z WHERE z.type = 'PO Box';	student_club
SELECT DISTINCT zip_code.zip FROM zip_code WHERE zip_code.type = 'PO Box' AND zip_code.city = 'San Juan' AND zip_code.state = 'Puerto Rico';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT DISTINCT e.event_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON a.link_to_event = e.link_to_budget WHERE e.cost > 50;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_id FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT m.college FROM member m JOIN major mj ON m.link_to_major = mj.major_id WHERE m.first_name = 'Katy' AND mj.major_id = 'rec1N0upiVLy5esTO';	student_club
SELECT member.phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Agriculture and Applied Sciences' AND major.major_name = 'Business';	student_club
SELECT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'education' AND major.college = 'Education & Human Services';	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event.event_id) FROM event LEFT JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining < 0;	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense WHERE cost / COUNT(*) > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) / COUNT(zip_code)) * 100 AS percentage_po_boxes FROM zip_code;	student_club
SELECT event_name, location FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0;	student_club
SELECT event.event_name, event.event_date FROM event JOIN expense ON event.event_id = expense.link_to_event WHERE expense.expense_description = 'Pizza' AND expense.cost > 50 AND expense.cost < 100;	student_club
SELECT m.first_name, m.last_name, m.link_to_major AS major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100;	student_club
SELECT e.location AS city, z.city AS country FROM event e JOIN zip_code z ON e.location = z.city WHERE e.link_to_income IN (   SELECT link_to_event   FROM income   GROUP BY link_to_event   HAVING COUNT(*) > 40 );	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_amount FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id HAVING COUNT(e.event_id) > 1 ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT AVG(cost) AS average_amount_paid FROM expense WHERE link_to_member NOT LIKE '%Member%' AND link_to_member IS NOT NULL;	student_club
SELECT event_name FROM event JOIN expense ON event.event_id = expense.link_to_event WHERE expense.category = 'Parking' AND cost < (SELECT DIVIDE(SUM(cost), COUNT(*) FROM expense WHERE category = 'Parking'))	student_club
SELECT (SUM(cost) / COUNT(event_id)) * 100 AS percentage_of_game_cost FROM expense WHERE link_to_event IN (SELECT event_id FROM event WHERE type = 'Game');	student_club
SELECT budget_id FROM budget WHERE link_to_event IN (   SELECT link_to_event   FROM expense   WHERE expense_description IN ('Water, chips, cookies') ) GROUP BY budget_id HAVING SUM(cost) = (   SELECT MAX(total_cost)   FROM (     SELECT budget_id, SUM(cost) AS total_cost     FROM expense     WHERE expense_description IN ('Water, chips, cookies')     GROUP BY budget_id   ) AS subquery );	student_club
SELECT m.first_name, m.last_name FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY SUM(e.cost) DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense) GROUP BY m.member_id;	student_club
SELECT      (SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END) / COUNT(*) * 100) -      (SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(*) * 100) AS percentage_difference FROM      member;	student_club
SELECT major_name, department FROM major WHERE link_to_member = (     SELECT member_id     FROM member     WHERE first_name = 'Garrett' AND last_name = 'Gerke' );	student_club
SELECT m.first_name, m.last_name, e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies' AND e.approved = 'Approved';	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT category, amount FROM budget WHERE link_to_event = 'January Speaker';	student_club
SELECT event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food';	student_club
SELECT member.first_name, member.last_name, income.amount FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.date_received = '2019-09-09';	student_club
SELECT category FROM budget WHERE expense_description = 'Posters';	student_club
SELECT member.first_name, member.last_name, major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Secretary';	student_club
SELECT event.event_name, SUM(budget.spent) AS total_spent FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Speaker Gifts' GROUP BY event.event_name;	student_club
SELECT T2.city FROM member M1 JOIN zip_code Z ON M1.zip = Z.zip_code WHERE M1.first_name = 'Garrett' AND M1.last_name = 'Girke';	student_club
SELECT member.first_name, member.last_name, member.position FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Lincolnton' AND zip_code.state = 'North Carolina';	student_club
SELECT COUNT(*) AS NumberOfGasStations FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) AS count_EUR,         COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) AS count_CZK,        (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END)) AS ratio FROM customers;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID AND y.Date BETWEEN '201201' AND '201212' WHERE c.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(C.Consumption) / 12 AS avg_monthly_consumption FROM yearmonth C JOIN customers S ON C.CustomerID = S.CustomerID WHERE S.Segment = 'SME' AND C.Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS TotalConsumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE c.Currency = 'CZK' AND t.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(*) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date BETWEEN '201201' AND '201212' AND y.Consumption < 30000 AND c.Segment = 'KAM';	debit_card_specializing
SELECT      SUM(CASE WHEN Currency = 'CZK' THEN Consumption ELSE 0 END) AS czk_consumption,     SUM(CASE WHEN Currency = 'EUR' THEN Consumption ELSE 0 END) AS eur_consumption,     czk_consumption - eur_consumption AS consumption_difference FROM      yearmonth WHERE      Date BETWEEN '201201' AND '201212' GROUP BY      Currency;	debit_card_specializing
SELECT EXTRACT(YEAR FROM Date) AS Year, SUM(Consumption) AS TotalGasUse FROM yearmonth WHERE Currency = 'EUR' GROUP BY Year ORDER BY TotalGasUse DESC LIMIT 1;	debit_card_specializing
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT Date, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Date LIKE '20%_' -- Extracting the year from the first 4 characters of the Date string AND Currency = 'CZK' -- Filter for transactions in Czech Koruna (CZK) GROUP BY Date ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date LIKE '2013%' GROUP BY Date ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
WITH min_consumption AS (     SELECT         Segment,         MIN(Consumption) AS min_consumption     FROM         yearmonth     WHERE         substr(Date, 1, 4) = '2013'     GROUP BY         Segment ),  sme_lam_diff AS (     SELECT         (SUM(CASE WHEN Segment = 'SME' THEN Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN Segment = 'SME' THEN CustomerID END)) AS sme_avg,         (SUM(CASE WHEN Segment = 'LAM' THEN Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN Segment = 'LAM' THEN CustomerID END)) AS lam_avg     FROM         yearmonth     WHERE         substr(Date, 1, 4) = '2013' ),  lam_kam_diff AS (     SELECT         (SUM(CASE WHEN Segment = 'LAM' THEN Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN Segment = 'LAM' THEN CustomerID END)) AS lam_avg,         (SUM(CASE WHEN Segment = 'KAM' THEN Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN Segment = 'KAM' THEN CustomerID END)) AS kam_avg     FROM         yearmonth     WHERE         substr(Date, 1, 4) = '2013' ),  sme_kam_diff AS (     SELECT         (SUM(CASE WHEN Segment = 'SME' THEN Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN Segment = 'SME' THEN CustomerID END)) AS sme_avg,         (SUM(CASE WHEN Segment = 'KAM' THEN Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN Segment = 'KAM' THEN CustomerID END)) AS kam_avg     FROM         yearmonth     WHERE         substr(Date, 1, 4) = '2013' )  SELECT     Segment,     COALESCE(sme_lam_diff.sme_avg - lam_kam_diff.lam_avg, 0) AS sme_lam_difference,     COALESCE(lam_kam_diff.lam_avg - sme_kam_diff.sme_avg, 0) AS lam_kam_difference,     CO	debit_card_specializing
WITH consumption_diff AS (     SELECT         c.Segment,         SUM(ym.Consumption) AS consumption_2012,         SUM(             CASE                 WHEN ym.Date LIKE '2012%'                 THEN ym.Consumption                 ELSE 0             END         ) OVER (PARTITION BY c.Segment) AS consumption_2013     FROM         customers c         JOIN yearmonth ym ON c.CustomerID = ym.CustomerID     WHERE         c.Currency = 'EUR'     GROUP BY         c.Segment )  SELECT     Segment,     (consumption_2013 - consumption_2012) / consumption_2013 * 100 AS percentage_increase,     CASE         WHEN (consumption_2013 - consumption_2012) > 0 THEN 'Increase'         ELSE 'Decrease'     END AS direction FROM     consumption_diff WHERE     consumption_2013 IS NOT NULL ORDER BY     percentage_increase DESC,     direction LIMIT 2;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT COUNT(*) AS difference FROM gasstations gs1 JOIN gasstations gs2 ON gs1.Country = 'Czech Republic' AND gs1.Segment = 'discount' LEFT JOIN gasstations gs3 ON gs3.Country = 'Slovakia' AND gs3.Segment = 'discount' AND gs3.GasStationID > gs1.GasStationID WHERE gs3.GasStationID IS NULL;	debit_card_specializing
SELECT ((y1.Consumption - y2.Consumption) AS Difference) FROM yearmonth y1 JOIN yearmonth y2 ON y1.CustomerID = 7 AND y1.Date = '201304' WHERE y2.CustomerID = 5 AND y2.Date = '201304';	debit_card_specializing
SELECT     SUM(CASE WHEN Segment = 'SME' AND Currency = 'CZK' THEN 1 ELSE 0 END) AS SME_CZK,     SUM(CASE WHEN Segment = 'SME' AND Currency = 'EUR' THEN 1 ELSE 0 END) AS SME_EUR,     SME_CZK - SME_EUR AS Difference FROM     customers WHERE     Segment = 'SME';	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND SUBSTR(y.Date, 6, 2) = '13' AND SUBSTR(y.Date, 1, 4) = '2013' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) AS Total Consumption FROM yearmonth WHERE Date = '201305' AND CustomerID IN (   SELECT CustomerID   FROM customers   WHERE Segment = 'KAM' );	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'LAM' AND Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS 'Percentage_LAM_46p73' FROM yearmonth WHERE Segment = 'LAM';	debit_card_specializing
SELECT      gs.Country,     COUNT(gs.GasStationID) AS Total_Gas_Stations,     SUM(t.Amount / y.Consumption) AS Average_Value_per_Unit FROM      gasstations gs JOIN      transactions_1k t ON gs.GasStationID = t.GasStationID JOIN      yearmonth y ON t.CustomerID = y.CustomerID GROUP BY      gs.Country ORDER BY      Average_Value_per_Unit DESC;	debit_card_specializing
SELECT (COUNT(*) FILTER (WHERE customers.Segment = 'KAM' AND customers.Currency = 'EUR') * 100.0) / COUNT(*) FILTER (WHERE customers.Segment = 'KAM') AS 'Percentage_of_KAM_customers_in_EUR' FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID;	debit_card_specializing
SELECT COUNT(*) AS num_customers_exceeding_limit,         (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM yearmonth WHERE Date = '201202')) AS percentage_exceeding_limit FROM yearmonth WHERE Date = '201202' AND Consumption > 528.3;	debit_card_specializing
SELECT      (COUNT(CASE WHEN Segment = 'Premium' AND Country = 'Slovakia' THEN GasStationID END) * 100.0 / COUNT(CASE WHEN Country = 'Slovakia' THEN GasStationID END)) AS 'Percentage_of_Premium_Gas_Stations' FROM      gasstations	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID AND y.Date = '201309' GROUP BY c.CustomerID ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY SUM(y.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201206' AND c.Segment = 'SME' GROUP BY c.CustomerID ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE Date LIKE '2012%'	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) / 12 AS MonthlyConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' GROUP BY c.CustomerID ORDER BY MonthlyConsumption DESC LIMIT 1;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN yearmonth y ON y.ProductID = p.ProductID AND y.Date = '201309' WHERE y.CustomerID IN (   SELECT CustomerID   FROM customers   WHERE Segment IN ('SME', 'LAM') -- Considering both SME and LAM segments )	debit_card_specializing
SELECT DISTINCT Country FROM gasstations JOIN transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID WHERE Date LIKE '201306%' AND transactions_1k.Date IS NOT NULL;	debit_card_specializing
SELECT DISTINCT gasstations.ChainID FROM gasstations JOIN transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID WHERE transactions_1k.Currency = 'EUR';	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID WHERE t.Currency = 'EUR';	debit_card_specializing
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k JOIN yearmonth ON transactions_1k.Date = yearmonth.Date AND transactions_1k.CustomerID = yearmonth.CustomerID WHERE substr(transactions_1k.Date, 1, 4) = '2012' AND substr(transactions_1k.Date, 6, 2) = '01';	debit_card_specializing
SELECT COUNT(*) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE gs.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT T.Time FROM transactions_1k T JOIN gasstations G ON T.GasStationID = G.GasStationID WHERE G.ChainID = 11;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE' AND Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE' AND Date > '2012-01-01';	debit_card_specializing
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE';	debit_card_specializing
SELECT AVG(Price) AS avg_total_price FROM transactions_1k WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR');	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS TotalPaid FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT GasCountry FROM gasstations WHERE GasStationID IN (     SELECT GasStationID     FROM transactions_1k     JOIN yearmonth ON transactions_1k.Date = yearmonth.Date AND transactions_1k.CustomerID = yearmonth.CustomerID     WHERE Date = '2012-08-25'     ORDER BY TransactionID ASC     LIMIT 1 );	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Time = '16:25:00' AND t.Date = '2012-08-24';	debit_card_specializing
SELECT Segment FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID JOIN yearmonth ON transactions_1k.Date = yearmonth.Date AND transactions_1k.Time = '21:20:00' WHERE yearmonth.Date = '2012-08-23' AND transactions_1k.TransactionID IN (     SELECT TransactionID     FROM transactions_1k     WHERE Date = '2012-08-23' AND Time = '21:20:00' );	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN customers ON transactions_1k.CustomerID = customers.CustomerID  WHERE customers.Currency = 'EUR'  AND Date = '2012-08-26'  AND Time < '13:00:00';	debit_card_specializing
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1;	debit_card_specializing
SELECT DISTINCT Country FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE Date = '2012-08-24' AND Time = '12:42:00';	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT SUM(Amount) AS total_spent_january, Date FROM transactions_1k WHERE CustomerID IN (     SELECT CustomerID     FROM yearmonth     WHERE Date = '2012-08-24' AND Amount = 124.05 ) AND Date BETWEEN '2012-01-01' AND '2012-01-31' GROUP BY Date;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  JOIN countries AS cz ON gasstations.Country = cz.CountryCode  WHERE transactions_1k.Date = '2012-08-26'  AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00'  AND cz.CountryName = 'Czech Republic';	debit_card_specializing
SELECT c.Currency FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date LIKE '201306' AND y.Consumption = 214582.17;	debit_card_specializing
SELECT Country FROM transactions_1k WHERE TransactionID = 667467 AND CardID IS NOT NULL;	debit_card_specializing
SELECT c.Country FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth y ON c.CustomerID = y.CustomerID AND y.Date = '2012-08-24' WHERE t.Amount = 548.4;	debit_card_specializing
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR')) AS 'Percentage_of_EUR_customers_20120825' FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE Date = '2012-08-25';	debit_card_specializing
SELECT ((y2.Consumption - y1.Consumption) / y1.Consumption) AS ConsumptionDecreaseRate FROM yearmonth y1 JOIN yearmonth y2 ON y1.CustomerID = y2.CustomerID AND y1.Date = '2012-08-24' AND y2.Date = '2013-08-25' WHERE y1.CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Amount = 634.8 AND EXTRACT(YEAR FROM Date) = 2012);	debit_card_specializing
SELECT GasStationID, SUM(Amount) AS Revenue FROM transactions_1k GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1;	debit_card_specializing
SELECT     (COUNT(*) FILTER (WHERE products.Description = 'Premium' AND GasStationID IN (         SELECT GasStationID         FROM transactions_1k         JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID         WHERE Segment = 'SVK'         AND Country = 'SK'     )) / COUNT(DISTINCT transactions_1k.GasStationID) FILTER (WHERE Segment = 'SVK' AND Country = 'SK')) * 100 AS 'Premium_Percentage' FROM     transactions_1k JOIN     gasstations ON transactions_1k.GasStationID = gasstations.GasStationID JOIN     products ON transactions_1k.ProductID = products.ProductID WHERE     gasstations.Country = 'SK';	debit_card_specializing
SELECT     SUM(t.Amount) AS total_amount_spent,     SUM(y.Consumption) AS amount_spent_january_2012 FROM     customers c JOIN     transactions_1k t ON c.CustomerID = t.CustomerID JOIN     yearmonth y ON c.CustomerID = y.CustomerID AND y.Date = '201201' WHERE     c.CustomerID = 38508;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID, p.Description ORDER BY SUM(t.Amount) DESC LIMIT 5;	debit_card_specializing
SELECT      c.CustomerID,     SUM(t.Amount) AS TotalSpending,     AVG(t.Price / t.Amount) AS AveragePricePerItem,     c.Currency FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY      c.CustomerID, c.Currency ORDER BY      TotalSpending DESC LIMIT 1;	debit_card_specializing
SELECT Country FROM gasstations WHERE GasStationID IN (     SELECT GasStationID     FROM transactions_1k     WHERE ProductID = 2 AND Amount = 1     GROUP BY GasStationID     ORDER BY Price DESC     LIMIT 1 );	debit_card_specializing
SELECT cm.Segment, ym.Consumption FROM customers cm JOIN yearmonth ym ON cm.CustomerID = ym.CustomerID JOIN transactions_1k tr ON cm.CustomerID = tr.CustomerID JOIN products pr ON pr.ProductID = tr.ProductID WHERE pr.Description = 'Product ID No.5' AND Price / Amount > 29.00 AND ym.Date LIKE '201208'	debit_card_specializing
