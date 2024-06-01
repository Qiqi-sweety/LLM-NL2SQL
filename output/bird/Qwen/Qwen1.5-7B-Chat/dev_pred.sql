SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS Highest_Eligible_Free_Rate FROM frpm WHERE `County Name` = 'Alameda' AND `School Type` = 'K-12 Schools (Public)' 
SELECT `Enrollment (Ages 5-17)`, `Free Meal Count (Ages 5-17)`, `Percent (%) Eligible Free (Ages 5-17)`  FROM frpm  WHERE `School Type` = 'Continuation' AND `Grade` BETWEEN '5' AND '17'  ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC  LIMIT 3;
SELECT Zip FROM frpm WHERE `County` = 'Fresno' AND `Charter School (Y/N)` = 1;
SELECT MailStreet, MailCity, MailState FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE School = (     SELECT School     FROM frpm     WHERE `FRPM Count (K-12)` = (         SELECT MAX(`FRPM Count (K-12)`)         FROM frpm     ) ) AND `FRPM Count (K-12)` = (     SELECT MAX(`FRPM Count (K-12)`)     FROM frpm ) AND `K-12 Schools (Public)` = 'Public';
SELECT s.Phone  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.`Charter School (Y/N)` = 1 AND s.OpenDate > '2000-01-01' AND s.StatusType = 'Open'
SELECT COUNT(*) FROM schools AS s JOIN frpm AS f ON s.CDSCode = f.CDSCode WHERE s.Virtual = 'F' AND f.AvgScrMath < 400;
SELECT schools.CDSCode, schools.School FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.NumTstTakr > 500 AND schools.Magnet = 1 OR schools.GSoffered = 'Magnet' 
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.AvgScrMath > 1500 GROUP BY s.CDSCode, s.Phone ORDER BY COUNT(f.CDSCode) DESC LIMIT 1; 
 SELECT COUNT(satscores.NumTstTakr) FROM satscores JOIN frpm ON satscores.cds = frpm.CDSCode WHERE frpm.EducationalOptionType = 'K-12' GROUP BY satscores.cds ORDER BY frpm.FRPM_Count (K-12) DESC LIMIT 1; 
SELECT COUNT(*) AS DirectlyCharteredSchools FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.CDSCode IN (     SELECT CDSCode     FROM frpm     JOIN satscores ON frpm.CDSCode = satscores.cds     WHERE satscores.AvgScrMath > 560 ) AND schools.Charter = 1; 
SELECT s.CDSCode, SUM(f.FRPMCount (Ages 5-17)) AS TotalFRPM FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode JOIN satscores sats ON s.CDS = sats.cds WHERE sats.rtype = 'Reading' AND sats.AvgScrRead = (     SELECT MAX(AvgScrRead)      FROM satscores     WHERE rtype = 'Reading' ) GROUP BY s.CDSCode 
SELECT schools.CDSCode FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode GROUP BY schools.CDSCode HAVING SUM(frpm.Enrollment (K-12) + frpm.Enrollment (Ages 5-17)) > 500;
 SELECT MAX(`Free Meal Count (Ages 5-17)`) / `Enrollment (Ages 5-17)` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE `2013-14 CALPADS Fall 1 Certification Status` = 1 AND (`NumGE1500` / `NumTstTakr`) > 0.3 
 SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.NumGE1500 / f.NumTstTakr = (     SELECT MAX(AvgScrGE1500 / NumTstTakr)     FROM (         SELECT f.CDSCode, AVG(f.NumGE1500) / COUNT(f.NumTstTakr) AS AvgScrGE1500         FROM frpm f         GROUP BY f.CDSCode     ) as sat_excellence     WHERE f.CDSCode IN (         SELECT s.CDSCode         FROM schools s         JOIN frpm f ON s.CDSCode = f.CDSCode         GROUP BY s.CDSCode         ORDER BY AVG(f.NumGE1500) / COUNT(f.NumTstTakr) DESC         LIMIT 3     ) ) 
SELECT s.NCESDist, s.NCESSchool, COUNT(f.Enrollment (Ages 5-17)) AS Enrollment_Ages_5_17 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode GROUP BY s.NCESDist, s.NCESSchool ORDER BY Enrollment_Ages_5_17 DESC LIMIT 5; 
SELECT s.District, AVG(f.AvgScrRead) AS AvgReadingScore FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.StatusType = 'Active' AND f.rtype = 'Reading' GROUP BY s.District ORDER BY AvgReadingScore DESC LIMIT 1; 
SELECT COUNT(*) as num_schools_with_less_than_100_takers FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Alameda' AND frpm.NumTstTakr < 100; 
 SELECT CharterNum FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.AvgScrWrite = 499; 
 SELECT COUNT(*) AS schools_with_max_test_takers FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.County = 'Contra Costa' AND frpm.NSLP Provision Status = 'Directly funded' AND frpm.NumTstTakr <= 250; 
 SELECT s.MailPhone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.AvgScrMath = (     SELECT MAX(AvgScrMath)     FROM frpm     WHERE CDSCode IN (         SELECT CDSCode         FROM frpm         JOIN schools s2 ON frpm.CDSCode = s2.CDSCode         GROUP BY CDSCode         HAVING AVG(AvgScrMath) = (             SELECT MAX(AvgScrMath)             FROM frpm         )     ) ); 
SELECT COUNT(*)  FROM frpm  WHERE `Low Grade` = '9' AND `High Grade` = '12'  AND County = 'Amador'; 
 SELECT COUNT(*) as Schools_with_condition FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Los Angeles'   AND frpm.FreeMealCount (K-12) > 500   AND frpm.FreeMealCount (K-12) < 700; 
SELECT s.School, COUNT(s.cds) AS TestTakers FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Contra Costa' GROUP BY s.CDSCode, s.School ORDER BY TestTakers DESC LIMIT 1; 
SELECT schools.School, schools.Street, schools.StreetAbr, schools.City, schools.Zip FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.Enrollment (K-12) - frpm.Enrollment (Ages 5-17) > 30; 
SELECT s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Percent (%) Eligible Free (K-12) > 0.1 AND f.Enrollment (K-12) >= 1500; 
SELECT s.CDSCode, s.FundingType FROM schools s JOIN (     SELECT CDSCode, AVG(AvgScrMath) AS avg_math     FROM satscores     WHERE RTYPE = 'Math' AND CDSCode IN (         SELECT CDSCode         FROM frpm         WHERE County = 'Riverside'         GROUP BY CDSCode         HAVING AVG(AvgScrMath) > 400     )     GROUP BY CDSCode ) sm ON s.CDSCode = sm.CDSCode WHERE s.County = 'Riverside'; 
SELECT s.School, CONCAT(s.Zip, ', ', s.Street, ', ', s.City, ', ', s.State) AS FullAddress FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.StatusType = 'High Schools (Public)' AND f.Pct (%) Eligible Free (Ages 5-17) > 0.8 AND f.Pct (%) Eligible FRPM (Ages 5-17) > 0.8 AND s.County = 'Monterey'; 
SELECT s.School, AVG(s.AvgScrWrite) AS AverageWritingScore FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.OpenDate > '1991-01-01' OR s.ClosedDate < '2000-01-01' GROUP BY s.School HAVING s.Phone IS NOT NULL 
SELECT s.School, s.DOCType  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.FundingType = 'Locally funded'  AND (f.Enrollment (K-12) - f.Enrollment (Ages 5-17)) >      (SELECT AVG(Enrollment (K-12) - Enrollment (Ages 5-17))       FROM frpm WHERE FundingType = 'Locally funded') AS avg_diff  GROUP BY s.School, s.DOCType;
WITH max_enrollment_school AS (   SELECT      schools.CDSCode,     MAX(enrollment) AS max_enrollment,     MIN(OpenDate) AS first_open_date   FROM      frpm   JOIN      schools ON frpm.CDSCode = schools.CDSCode   WHERE      School Type IN ('K-12 Schools (Public)', 'High Schools (Public)')   GROUP BY      schools.CDSCode ) SELECT    schools.CDSCode,   schools.OpenDate FROM    max_enrollment_school JOIN    schools ON max_enrollment_school.CDSCode = schools.CDSCode WHERE    schools.OpenDate = max_enrollment_school.first_open_date ORDER BY    max_enrollment DESC LIMIT 1; 
SELECT City  FROM frpm  WHERE `Grade` BETWEEN 'K' AND '12'  ORDER BY Enrollment (K-12) ASC  LIMIT 5;
SELECT      sf.CDSCode,      sf.Rtype,      sf.Sname,      sf.Dname,      sf.cname,      sf.Enrollment12,      sf.FreeMealCountK12 / sf.EnrollmentK12 AS EligibleFreeRate FROM      frpm sf JOIN      schools s ON sf.CDSCode = s.CDSCode WHERE      sf.SchoolType = 'Elementary Schools (Public)' AND      sf.Grade BETWEEN 'K' AND '12' ORDER BY      sf.EnrollmentK12 DESC LIMIT 2; 
 WITH top_schools AS (   SELECT CDSCode, SUM(`Enrollment (K-12)`) AS total_enrollment, SUM(`Free Meal Count (K-12)`) AS free_meal_count   FROM frpm   WHERE `Educational Option Type` = 'K-12' AND `Ownership Code` = 66   GROUP BY CDSCode   ORDER BY free_meal_count DESC   LIMIT 5 ) SELECT top_schools.CDSCode,         top_schools.free_meal_count / top_schools.total_enrollment AS eligibility_rate FROM top_schools JOIN frpm ON top_schools.CDSCode = frpm.CDSCode WHERE frpm.`Grade` BETWEEN 'K' AND '12' 
SELECT s.Website, s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Name` = 'Kacey Gibson' AND `School Type` = 'Elementary Schools (Public)' AND `Enrollment (Ages 5-17)` IS NOT NULL;
SELECT AdmEmail1 FROM schools WHERE Charter = 1 AND Enrollment (K-12) = (     SELECT MIN(Enrollment (K-12))     FROM frpm     WHERE CDSCode IN (         SELECT CDSCode         FROM frpm         WHERE `Academic Year` = '2014-2015' -- Assuming this is the year of interest         AND School Type = 'K-12 Schools (Public)'         AND Charter School (Y/N) = 1     ) ); 
WITH admin_schools AS (   SELECT s.CDSCode, s.AdmFName1, s.AdmLName1 AS AdminFullName   FROM schools s   JOIN frpm f ON s.CDSCode = f.CDSCode   WHERE f.NumGE1500 >= 1500 ), max_test_takers AS (   SELECT CDSCode, MAX(NumTstTakr) AS MaxTestTakers   FROM frpm   GROUP BY CDSCode ) SELECT admin_schools.AdminFullName FROM admin_schools JOIN max_test_takers mt ON admin_schools.CDSCode = max_test_takers.CDSCode WHERE max_test_takers.MaxTestTakers = (   SELECT MAX(MaxTestTakers)   FROM max_test_takers ) 
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.NumGE1500 / f.NumTstTakr = (SELECT MIN(NumGE1500 / NumTstTakr) FROM frpm)
SELECT s.Webpage FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND f.NumTstTakr BETWEEN 2000 AND 3000; 
SELECT AVG(NumTstTakr) FROM satscores WHERE CDS IN (SELECT CDSCode FROM schools WHERE NCESDist = 'Fresno' AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31')
SELECT s.Phone  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.District = 'Fresno Unified' AND f.rtype = 'AvgScrRead'  ORDER BY f.AvgScrRead ASC  LIMIT 1;
SELECT s.CDSCode, AVG(s.AvgScrRead) AS AvgReadingScore FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Virtual = 'F' AND f.VIRTUAL IS NOT NULL GROUP BY s.CDSCode ORDER BY AvgReadingScore DESC LIMIT 5;
WITH Math_Averages AS (   SELECT s.CDSCode, s.School, s.EdOpsName, AVG(AvgScrMath) AS Math_Avg   FROM frpm   JOIN schools s ON frpm.CDSCode = s.CDSCode   GROUP BY s.CDSCode, s.School, s.EdOpsName   ORDER BY Math_Avg DESC ), Top_math_school AS (   SELECT CDSCode, School, EdOpsName   FROM Math_Averages   LIMIT 1 ) SELECT Top_math_school.EdOpsName FROM Top_math_school JOIN schools s ON Top_math_school.CDSCode = s.CDSCode WHERE s.AvgScrMath = (   SELECT MAX(AvgScrMath)   FROM Math_Averages ) 
SELECT AVG(AvgScrMath) AS avg_math_score, County FROM frpm WHERE CDSCode = (SELECT CDSCode FROM frpm AS lowest_score_school GROUP BY CDSCode HAVING AVG(AvgScrRead + AvgScrMath + AvgScrWrite) = (SELECT MIN(AvgScrRead + AvgScrMath + AvgScrWrite) FROM frpm)) GROUP BY County;
 SELECT AVG(AvgScrWrite) AS AverageWritingScore, City FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE NumTstTakr >= 1500 GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT s.School, AVG(s.AvgScrWrite) AS AverageWritingScore FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.AdmFName1 = 'Ricci Ulrich' OR s.AdmLName1 = 'Ricci Ulrich' GROUP BY s.School; 
SELECT State, COUNT(*) AS Enrollments FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.DOC = '31' -- State Special Schools (DOC code: 31) AND frpm.`Low Grade` IS NOT NULL -- Include grades 1 through 12 (K-12) GROUP BY State ORDER BY Enrollments DESC LIMIT 1; 
SELECT COUNT(DISTINCT schools.CDSCode) / 12 AS avg_openings FROM schools WHERE schools.DOC = '52' -- For Elementary School District (DOC code: 52) AND schools.OpenDate BETWEEN '1980-01-01' AND '1980-12-31' 
SELECT CAST(SUM(CASE WHEN schools.DOC = 54 THEN 1 ELSE 0 END) AS REAL) / COUNT(CASE WHEN schools.DOC = 52 THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE schools.County = 'Orange County'; 
SELECT s.County, s.School, s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed' GROUP BY s.County, s.School ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT s.School, s.MailStreet  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.AvgScrMath = (     SELECT MAX(AvgScrMath)      FROM frpm      WHERE Academic Year = '2014-2015' AND School Type = 'High Schools (Public)' )  ORDER BY f.AvgScrMath DESC  LIMIT 6;
SELECT s.MailStreet, s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.AvgScrRead = (     SELECT MIN(AvgScrRead)     FROM frpm f2     JOIN schools s2 ON f2.CDSCode = s2.CDSCode     GROUP BY s2.MailStreet ) 
SELECT COUNT(*) FROM schools AS s JOIN frpm AS f ON s.CDSCode = f.CDSCode WHERE f.AvgScrRead + f.AvgScrMath + f.AvgScrWrite >= 1500 AND s.MailCity = 'Lakeport';
SELECT COUNT(s.NCESDist) AS TotalTestTakers FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.MailCity = 'Fresno'; 
SELECT s.MailZip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.AdmFName1 = 'Avetik Atoian' OR f.AdmFName2 = 'Avetik Atoian' OR f.AdmFName3 = 'Avetik Atoian';
SELECT CAST(SUM(CASE WHEN schools.MailState = 'California' AND schools.County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) AS schools_in_Colusa,        CAST(SUM(CASE WHEN schools.MailState = 'California' AND schools.County = 'Humboldt' THEN 1 ELSE 0 END) AS REAL) AS schools_in_Humboldt,        SUM(CASE WHEN schools.MailState = 'California' THEN 1 ELSE 0 END) AS total_schools_in_California,        CAST(SUM(schools_in_Colusa) / SUM(schools_in_Humboldt) AS REAL) AS ratio FROM schools WHERE schools.MailState = 'California' 
SELECT COUNT(s.CDSCode) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.MailState = 'California' AND s.AdmFName1 IS NOT NULL AND s.AdmFName1 <> '' AND s.District = 'San Joaquin'; 
SELECT s.Phone, s.Ext FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.AvgScrWrite = (     SELECT MAX(AvgScrWrite)     FROM frpm     WHERE CDSCode IN (         SELECT CDSCode         FROM frpm         ORDER BY AvgScrWrite DESC         LIMIT 333     ) ) 
SELECT s.Phone, s.Ext FROM schools s WHERE s.Zip = '95203-3704' AND s.School IS NOT NULL;
 SELECT s.Website FROM schools s WHERE s.AdmFName1 = 'Mike Larson' OR s.AdmFName2 = 'Dante Alvarez' 
 SELECT DISTINCT s.Website FROM schools s WHERE s.Charter = 1 AND s.Virtual = 'P' AND s.County = 'San Joaquin'; 
SELECT COUNT(*) FROM schools WHERE DOC = '52' AND Charter = 1 AND City = 'Hickman';
SELECT COUNT(*) FROM frpm WHERE CDSCode IN(SELECT CDSCode FROM schools WHERE County = 'Los Angeles' AND Charter = 0) AND `Percent (%) Eligible Free (K-12)` < 0.0018;
SELECT s.School, s.City, s.AdmFName1, s.AdmLName1 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.CDSCode IN (     SELECT CDSCode     FROM frpm     WHERE Charter = 1 AND CharterNum = '00D2' ) AND s.StatusType = 'Charter'; 
SELECT COUNT(*) AS Total_Schools FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'; 
SELECT CAST(SUM(CASE WHEN schools.FundingType = 'Locally funded' AND schools.County = 'Santa Clara' THEN 1 ELSE 0 END) AS REAL) AS locally_funded_count,        CAST(SUM(CASE WHEN schools.FundingType != 'Locally funded' THEN 1 ELSE 0 END) AS REAL) AS other_funding_count,        (CAST(SUM(CASE WHEN schools.FundingType = 'Locally funded' AND schools.County = 'Santa Clara' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN schools.FundingType != 'Locally funded' THEN 1 ELSE 0 END) * 100 AS REAL) AS ratio_percentage FROM schools WHERE schools.County = 'Santa Clara' GROUP BY schools.FundingType; 
SELECT COUNT(*)  FROM schools  WHERE County = 'Stanislaus'  AND FundingType = 'Directly Funded'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'; 
SELECT SUM(CASE WHEN `ClosedDate` LIKE '1989-%' AND `City` = 'San Francisco' AND `EdOpsName` = 'Community College District' THEN 1 ELSE 0 END) AS Total_Closures FROM schools WHERE `DOCType` = 'Closure Notice' AND `Year` = 1989; 
SELECT County, COUNT(*) AS closures FROM schools WHERE SOC = '11' AND StatusType = 'Closed' AND YEAR(OpenDate) BETWEEN 1980 AND 1989 GROUP BY County ORDER BY closures DESC LIMIT 1;
SELECT DISTINCT s.NCESDist FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.SOC = 31; 
SELECT COUNT(DISTINCT CASE WHEN `District Type` = 'District Community Day School' AND County = 'Alpine' THEN CDSCode END) AS Total_DistrictCDS FROM frpm WHERE `District Type` = 'District Community Day School' AND `ClosedDate` IS NULL OR `ClosedDate` IS NOT NULL; 
 SELECT DistrictCode FROM frpm WHERE School = (     SELECT School     FROM schools     WHERE City = 'Fresno' AND Magnet = 0 ) 
SELECT COUNT(*) FROM frpm WHERE `Educational Option Type` = 'State Special School' AND `Low Grade` >= 'Kindergarten' AND `High Grade` <= '17' AND `Academic Year` = '2014-2015' AND School = 'Fremont' AND `School Type` = 'Elementary Schools (Public)'
SELECT `Free Meal Count (Ages 5-17)` FROM frpm WHERE `School Name` = 'Youth Authority School' AND `MailStreet` = 'PO Box 1040';
SELECT MIN(`Low Grade`) AS LowestGrade FROM frpm WHERE `EdOpsCode` = 'SPECON' AND NCESSchool = '613360'; 
SELECT `Educational Option Type` FROM frpm WHERE `County Code` = '37' AND `Breakfast Provision 2` = 1 AND `School Name` IS NOT NULL;
 SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Low Grade` = '9' AND f.`High Grade` = '12' AND f.Educational Option Type = 'Lunch Provision 2' AND s.EILCode = 'HS' AND s.County = 'Merced'; 
SELECT s.School,         (s.FreeMealCount(Ages 5-17) / s.Enrollment(Ages 5-17)) * 100 AS 'Percent (%) Eligible FRPM (Ages 5-17)' FROM schools s WHERE s.County = 'Los Angeles' AND s.DistrictType = 'County Office of Education (COE)' AND s.SchoolType = 'K-12 Schools (Public)' AND s.SchoolGradeSpan LIKE '%Kindergarten to 9th%'
SELECT `Grade Span`, COUNT(*) AS count FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.City = 'Adelanto' AND schools.Magnet = 0 -- filter for non-magnet schools only GROUP BY `Grade Span` ORDER BY count DESC LIMIT 1; 
WITH county_schools AS (   SELECT County, COUNT(*) AS non_physical_count   FROM frpm   WHERE Virtual = 'F' AND CDSCode IN ('01100170109835', '01100170112607', '01100170118489', '01100170123968', '01100170124172') -- Schools in San Diego and Santa Barbara   GROUP BY County ), san_diego_county AS (   SELECT County   FROM county_schools   WHERE CDSCode = '01100170109835' -- San Diego ), santa_barbara_county AS (   SELECT County   FROM county_schools   WHERE CDSCode = '01100170112607' OR CDSCode = '01100170118489' OR CDSCode = '01100170123968' OR CDSCode = '01100170124172' -- Santa Barbara ) SELECT county_schools.County, MAX(non_physical_count) AS max_non_physical_count FROM county_schools JOIN san_diego_county ON county_schools.County = san_diego_county.County JOIN santa_barbara_county ON county_schools.County = santa_barbara_county.County GROUP BY county_schools.County ORDER BY max_non_physical_count DESC LIMIT 1; 
SELECT s.SchoolType, s.Latitude FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Latitude = (SELECT MAX(Latitude) FROM schools) 
SELECT s.City, MIN(s.Latitude), frpm.LowGrade FROM schools s JOIN frpm ON s.CDSCode = frpm.CDSCode WHERE s.State = 'CA' AND s.Latitude = (SELECT MIN(Latitude) FROM schools WHERE State = 'CA') GROUP BY s.City, frpm.LowGrade LIMIT 1; 
SELECT MIN(Grade) AS LowGrade, MAX(Grade) AS HighGrade FROM frpm WHERE CDSCode IN(SELECT CDSCode FROM schools WHERE Longitude = (SELECT MAX(Longitude) FROM schools)) ORDER BY HighGrade ASC LIMIT 1;
WITH magnet_k8_schools AS (   SELECT      COUNT(*) AS total_magnet_k8_schoools,      City,      COUNT(DISTINCT School) AS num_schoos_in_city   FROM      schools    WHERE      Magnet = 1 AND     教育选项类型 IN ('Kindergarten to 8th grade') -- K-8   GROUP BY      City ),  multiple_provision_types AS (   SELECT      CDSCode,      COUNT(*) AS num_multiple_types   FROM      frpm      JOIN schools ON frpm.CDSCode = schools.CDSCode    WHERE      Magnet = 1 AND      教育选项类型 NOT IN ('Kindergarten to 8th grade') -- Exclude K-8   GROUP BY      CDSCode ) SELECT    magnet_k8_schools.total_magnet_k8_schools,    magnet_k8_schools.num_schoos_in_city,    multiple_provision_types.num_multiple_types FROM    magnet_k8_schools JOIN    multiple_provision_types ON magnet_k8_schools.City = multiple_provision_types.City; 
SELECT frp.AdmFName1 AS FirstName, frp.District, COUNT(*) AS Count FROM schools s JOIN frpm fr ON s.CDSCode = fr.CDSCode GROUP BY frp.AdmFName1, frp.District ORDER BY Count DESC LIMIT 2; 
SELECT f.PctEligibleFreeK12, s.DistrictCode FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 = 'Alusine'; 
SELECT AdmLName3 FROM schools AS s JOIN frpm AS f ON s.CDSCode = f.CDSCode WHERE f.CharterSchoolNumber = '40' AND s.Charter = 1; 
SELECT AdmEmail1  FROM schools  WHERE County = 'San Bernardino'  AND District = 'San Bernardino City Unified'  AND StatusType = 'Public Intermediate/Middle Schools'  AND SOC = 62  AND DOC = 54  AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31';
SELECT s.MailEmail FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.AvgScrMath >= 1500 GROUP BY s.CDSCode ORDER BY COUNT(f.CDSCode) DESC LIMIT 1; 
SELECT COUNT(*) as accounts_in_east_bohemia FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district d2 ON d.district_id = d2.district_id WHERE d.type = 'POPLATEK PO OBRATU' AND d2.A3 = 'East Bohemia'; 
SELECT COUNT(*) AS eligible_accounts FROM account WHERE district_id IN (     SELECT district_id     FROM district     WHERE A3 = 'Prague' ) 
SELECT AVG(A12 / A13) AS unemployment_ratio FROM account WHERE date BETWEEN '1995-01-01' AND '1996-12-31'; 
 SELECT COUNT(DISTINCT district_id) FROM district JOIN account ON district.district_id = account.district_id JOIN client ON account.client_id = client.client_id JOIN loan ON account.account_id = loan.account_id WHERE client.gender = 'F' AND A11 BETWEEN 6000 AND 10000; 
 SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000; 
 WITH oldest_females AS (   SELECT account_id, birth_date, AVG(A11) AS avg_salary   FROM client   WHERE gender = 'F' AND A11 IS NOT NULL   GROUP BY account_id, birth_date   ORDER BY birth_date ASC, avg_salary ASC   LIMIT 1 ), highest_avg AS (   SELECT MAX(avg_salary) AS max_avg   FROM oldest_females ) SELECT account_id FROM oldest_females WHERE avg_salary = (SELECT max_avg FROM highest_avg) LIMIT 1; 
 SELECT account.account_id FROM account JOIN client ON account.district_id = client.district_id JOIN (     SELECT district_id, AVG(A11) AS avg_salary     FROM district     GROUP BY district_id     ORDER BY avg_salary DESC, birth_date ASC     LIMIT 1 ) AS max_avg_salary ON client.district_id = max_avg_salary.district_id WHERE account.client_id = (SELECT MIN(client_id) FROM client WHERE district_id = max_avg_salary.district_id) 
SELECT COUNT(*) FROM client WHERE gender = 'Owner' AND frequency = 'POPLATEK TYDNE';
 SELECT DISTINCT client.client_id, client.gender, client.birth_date FROM client JOIN disp ON client.district_id = disp.district_id JOIN account ON disp.account_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE loan.type = 'POPLATEK PO OBRATU'; 
SELECT account.account_id, account.frequency, SUM(loan.amount) AS total_approved_amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.date BETWEEN '1997-01-01' AND '1997-12-31'   AND account.frequency = 'POPLATEK MESICNE' GROUP BY account.account_id, account.frequency HAVING total_approved_amount = (   SELECT MIN(total_approved_amount)   FROM (     SELECT account.account_id, SUM(loan.amount) AS total_approved_amount     FROM account     JOIN loan ON account.account_id = loan.account_id     WHERE loan.date BETWEEN '1997-01-01' AND '1997-12-31'       AND account.frequency = 'POPLATEK MESICNE'       AND loan.status = 'APPROVED'     GROUP BY account.account_id   ) AS min_amount_accounts ) AND account.frequency = 'POPLATEK TYDNE'; 
SELECT account.account_id, MAX(loan.amount) AS highest_approved_amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND account.date >= '1993-01-01' GROUP BY account.account_id ORDER BY highest_approved_amount DESC 
SELECT COUNT(*) AS female_customers FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Slokolov'; 
SELECT account.account_id, account.district_id, account.frequency, account.date FROM account JOIN (     SELECT account_id, MIN(date) AS earliest_date     FROM account     WHERE YEAR(date) = 1995     GROUP BY account_id ) AS earliest_accounts ON account.account_id = earliest_accounts.account_id WHERE account.date = earliest_accounts.earliest_date; 
SELECT DISTINCT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.date < '1997-01-01' AND l.amount > 3000; 
SELECT client.client_id FROM client JOIN card ON client.district_id = card.district_id WHERE card.issued BETWEEN '1994-03-01' AND '1994-03-31' AND card.type = 'POPLATEK MESICNE';
SELECT account.account_id, account.open_date FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.amount = 840 AND trans.date = '1998-10-14'; 
SELECT T1.district_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25' AND T2.duration = 8;
SELECT MAX(amount) AS max_transaction_amount FROM trans JOIN card ON trans.account_id = card.card_id JOIN client ON card.disp_id = client.disp_id WHERE card.issued = '1996-10-21'; 
SELECT c.gender FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     JOIN account ON client.district_id = account.district_id     JOIN loan ON account.account_id = loan.account_id     JOIN district ON account.district_id = district.district_id     GROUP BY district_id     HAVING AVG(d.A11) = (         SELECT MAX(avg_salary)         FROM (             SELECT district_id, AVG(A11) as avg_salary             FROM district             GROUP BY district_id         ) as avg_salaries     ) ) 
SELECT c.client_id, MIN(t.amount) AS first_transaction_amount FROM client c JOIN loan l ON c.client_id = l.account_id JOIN trans t ON l.account_id = t.account_id AND t.date = (     SELECT MIN(date)     FROM trans     WHERE account_id = l.account_id AND date > (SELECT issued FROM card WHERE disp_id = c.disp_id) ) GROUP BY c.client_id ORDER BY MAX(loan.amount) DESC LIMIT 1; 
 SELECT COUNT(*) AS woman_accounts FROM client JOIN account ON client.district_id = account.district_id JOIN district ON client.district_id = district.district_id WHERE district.A2 = 'Jesenik' AND client.gender = 'female'; 
 SELECT card.disp_id FROM card JOIN trans ON card.card_id = trans.account_id JOIN loan ON trans.date = loan.date JOIN account ON loan.account_id = account.account_id WHERE trans.amount = 5100 AND YEAR(trans.date) = 1998 AND MONTH(trans.date) = 9 AND DAY(trans.date) = 2 JOIN client ON account.client_id = client.client_id 
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND YEAR(date) = 1996;
 SELECT A2 FROM client WHERE gender = 'F' AND birth_date = '1976-01-29' JOIN account ON client.district_id = account.district_id; 
SELECT c.birth_date FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE l.loan_id = 98832 AND l.date = '1996-01-03' AND l.amount = 98832; 
SELECT account.account_id FROM account JOIN client ON account.district_id = client.district_id WHERE client.client_id IN (     SELECT client_id     FROM client     WHERE district.A3 = 'Prague'     AND client.birth_date IS NOT NULL ) LIMIT 1;
 SELECT      ((COUNT(CASE WHEN t.type = 'M' AND t.gender = 'M' AND d.A3 = 'southern Bohemia' THEN 1 ELSE 0 END) / COUNT(t.account_id)) * 100) AS male_percentage FROM      account a JOIN      disp d ON a.disp_id = d.disp_id JOIN      trans t ON a.account_id = t.account_id JOIN      client c ON d.client_id = c.client_id JOIN      district d2 ON c.district_id = d2.district_id WHERE      d2.A3 = 'southern Bohemia' AND d2.A4 IS NOT NULL; 
WITH first_loan_date AS (   SELECT account_id, birth_date, MIN(date) AS first_loan_date   FROM loan   WHERE date = '1993-07-05'     AND account_id IN (       SELECT account_id       FROM loan       WHERE date = '1993-07-05'     )     GROUP BY account_id, birth_date   HAVING COUNT(*) = 1 ), latest_balance AS (   SELECT account_id, MAX(balance) AS latest_balance   FROM trans   WHERE date BETWEEN '1993-03-22' AND '1998-12-27'     AND account_id IN (       SELECT account_id       FROM first_loan_date     ) ) SELECT    (latest_balance - first_loan_date.balance) / latest_balance * 100 AS balance_increase_rate FROM    first_loan_date JOIN    latest_balance ON first_loan_date.account_id = latest_balance.account_id; 
SELECT      (SUM(CASE WHEN loan.status = 'A' THEN loan.amount ELSE 0 END) / SUM(loan.amount)) * 100 AS 'Fully Paid Percentage' FROM      loan; 
SELECT      (SUM(CASE WHEN loan.amount < 100000 AND loan.status = 'C' THEN loan.amount ELSE 0 END) / SUM(loan.amount)) * 100 AS 'Percentage of Running Contracts' FROM      loan WHERE      loan.amount < 100000; 
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK MESICNE' -- Filter for accounts with 'POPLATEK MESICNE' frequency AND YEAR(a.date) = 1993 -- Filter for accounts in 1993 AND a.type = 'POPLATEK PO OBRATU' -- Filter for statements issued after transactions 
SELECT account.account_id, account.frequency, COUNT(*) AS issuance_count FROM account JOIN client ON account.district_id = client.district_id WHERE client.gender = 'male' AND client.birth_date BETWEEN '1995-01-01' AND '2000-12-31' AND district.A2 = '向东' GROUP BY account.account_id, account.frequency ORDER BY issuance_count DESC;
SELECT account.account_id, account.date FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Prachatice'
SELECT A2, A3 FROM district WHERE loan_id = '4990';
SELECT account.account_id, account.district_id, district.A2, district.A3 FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.amount > 300000;
SELECT l.loan_id, d.A3, AVG(l.amount / 12) AS avg_salary FROM loan l JOIN district d ON l.district_id = d.district_id JOIN loan d AS avg_salary_on_duration ON l.account_id = avg_salary_on_duration.account_id AND avg_salary_on_duration.duration = 60 * 12 GROUP BY l.loan_id, d.A3; 
SELECT d.A2, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increase FROM district d JOIN loan l ON d.district_id = l.account_id JOIN account a ON l.account_id = a.account_id WHERE l.status = 'D' AND a.date BETWEEN '1995-01-01' AND '1996-12-31' 
SELECT      (COUNT(*) * 100.0 / SUM(CASE WHEN A2 = 'Decin' THEN 1 ELSE 0 END) OVER()) AS 'Percentage of Decin Accounts' FROM      account WHERE      YEAR(date) = 1993 AND      district_id IN (SELECT district_id FROM district WHERE A2 = 'Decin') 
SELECT account.account_id FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.type = 'POPLATEK MESICNE'; 
SELECT A2, COUNT(*) AS female_accounts FROM account JOIN client ON account.district_id = client.district_id WHERE client.gender = 'F' GROUP BY A2 ORDER BY female_accounts DESC LIMIT 10; 
SELECT d.A2, SUM(t.amount) AS total_withdrawals FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id AND t.type = 'VYDAJ' AND t.date LIKE '1996-01%' WHERE t.type <> 'KARTA' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10; 
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'South Bohemia'  AND account.card_id IS NULL;
SELECT A3, SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS active_loans FROM district JOIN loan ON district.district_id = loan.district_id WHERE status IN ('C', 'D') GROUP BY A3 ORDER BY active_loans DESC LIMIT 1; 
 SELECT AVG(amount) AS avg_loan_amount FROM loan JOIN client ON loan.account_id = client.client_id WHERE client.gender = 'M'; 
SELECT A.A2, A.A13 FROM district A JOIN account AS AC ON A.district_id = AC.district_id JOIN loan AS L ON AC.account_id = L.account_id WHERE YEAR(L.date) = 1996 AND A.A13 IS NOT NULL ORDER BY A.A13 DESC;
SELECT COUNT(account.account_id) FROM account JOIN loan ON account.account_id = loan.account_id JOIN district ON account.district_id = district.district_id WHERE loan.date BETWEEN '1996-01-01' AND '1996-12-31' AND district.A16 AS crimes_1996 = (SELECT MAX(A16) FROM district WHERE A16 IS NOT NULL) GROUP BY district.district_id; 
SELECT COUNT(*) AS count FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYBER KARTOU' AND t.frequency = 'POPLATEK MESICNE' AND a.balance < 0; 
SELECT COUNT(*)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31'; 
 SELECT COUNT(*) AS running_accounts FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'C' OR loan.status = 'D' AND disp.disp_id = 1; 
 SELECT COUNT(*) AS male_clients FROM client JOIN account ON client.district_id = account.district_id JOIN loan ON account.account_id = loan.account_id JOIN district ON account.district_id = district.district_id WHERE loan.date = '1995-01-01' AND loan.date <= '1995-12-31' AND district.A15 = (   SELECT MAX(A15)   FROM district   WHERE year(date) = 1995   GROUP BY district_id   HAVING A15 < (     SELECT MAX(A15)     FROM district     WHERE year(date) = 1995     ORDER BY A15 DESC     LIMIT 1 OFFSET 1   ) ) AND client.gender = 'M'; 
SELECT COUNT(*) FROM card WHERE type = 'GOLD' AND disp_id IS NOT NULL;
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek');
SELECT DISTINCT district.district_id, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16 FROM district JOIN account ON district.district_id = account.district_id JOIN trans ON account.account_id = trans.account_id WHERE year(trans.date) = 1997 AND trans.amount > 10000;
SELECT account.account_id FROM account JOIN order ON account.account_id = order.account_id WHERE order.k_symbol = 'SIPO';
 SELECT DISTINCT account.account_id FROM account JOIN card ON account.account_id = card.account_id WHERE card.type IN ('GOLD', 'JUNIOR') 
SELECT AVG(amount) AS average_amount FROM trans WHERE date BETWEEN '2021-01-01' AND '2021-12-31' AND type = 'VYBER KARTOU' AND account_id IN (     SELECT account_id     FROM account     WHERE frequency = 'POPLATEK MESICNE' ); 
SELECT account.account_id, account.account_id AS 'Holder ID' FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.type = 'VYBER KARTOU' -- Credit card withdrawal AND YEAR(date) = 1998 AND amount < (     SELECT AVG(amount)     FROM trans     WHERE trans.type = 'VYBER KARTOU' AND YEAR(date) = 1998 ) GROUP BY account.account_id; 
SELECT DISTINCT a.account_id FROM account a JOIN card c ON a.account_id = c.account_id JOIN loan l ON a.account_id = l.account_id WHERE a.gender = 'F' AND c.type = 'CREDIT CARD'; 
SELECT COUNT(*) FROM account JOIN client ON account.district_id = client.district_id WHERE client.gender = 'F' AND district.A3 = 'south Bohemia';
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.type = 'OWNER' JOIN loan l ON a.account_id = l.account_id 
SELECT account.type AS ineligible_account_type, AVG(A11) AS avg_income FROM account LEFT JOIN loan ON account.account_id = loan.account_id WHERE account.type != 'OWNER' AND A11 BETWEEN 8000 AND 9000 AND account.district_id IN (     SELECT district_id     FROM district     WHERE A11 > 8000 AND A11 <= 9000 ) GROUP BY account.type; 
SELECT COUNT(*) FROM account AS a JOIN trans AS t ON a.account_id = t.account_id JOIN district AS d ON a.district_id = d.district_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';
SELECT A2 FROM district AS d JOIN account AS a ON d.district_id = a.district_id JOIN trans AS t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ'; 
 SELECT AVG(A15) AS avg_crimes_1995 FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK MESICNE' -- filter for monthly accounts   AND a.date BETWEEN '1997-01-01' AND '1997-12-31' -- filter for accounts opened in 1997   AND d.A3 > 4000 -- filter for regions with more than 4000 crimes in 1995   AND YEAR(a.date) = 1995 -- filter for crimes in 1995 
 SELECT COUNT(*)  FROM card c JOIN account a ON c.account_id = a.account_id WHERE a.type = 'OWNER' AND c.type = 'CLASSIC'; 
SELECT COUNT(*)  FROM client  WHERE gender = 'M' AND district_id IN (     SELECT district_id      FROM district      WHERE A2 = 'Hl.m. Praha' ); 
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percent of Gold Cards Issued Before 1998' FROM card; 
SELECT account.client_id, client.gender, client.birth_date FROM account JOIN loan ON account.account_id = loan.account_id ORDER BY loan.amount DESC LIMIT 1; 
SELECT SUM(A15) AS committed_crimes_1995 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532) AND A15 IS NOT NULL AND YEAR(date) = 1995; 
SELECT district_id FROM account WHERE order_id = 33333;
SELECT * FROM trans WHERE account_id IN (     SELECT account_id FROM client WHERE client_id = 3356     AND type = 'VYBER'     AND operation = 'VYBER' -- Checking for cash withdrawal ) AND type = 'VYBER' AND operation = 'VYBER'; 
 SELECT COUNT(*) AS weekly_accounts_with_loan_under_200000 FROM account WHERE frequency = 'POPLATEK MESICNE' AND loan_id < 200000; 
SELECT card.type FROM client JOIN card ON client.client_id = card.client_id WHERE client.client_id = 13539; 
SELECT A3 FROM client WHERE client_id = 3541;
 SELECT district_id, COUNT(*) as num_accounts FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'A' GROUP BY district_id ORDER BY num_accounts DESC LIMIT 1; 
SELECT DISTINCT client.client_id FROM order WHERE order_id = 32423; 
SELECT * FROM trans WHERE account_id IN (     SELECT account_id FROM account     WHERE district_id = 5 ) 
SELECT COUNT(*) as account_count FROM account WHERE district_id = 15; 
 SELECT client.client_id FROM client JOIN card ON client.client_id = card.client_id WHERE card.type = 'JUNIOR' AND card.issued >= '1997-01-01'; 
SELECT (COUNT(CASE WHEN gender = 'F' THEN 1 END) * 100 / COUNT(*)) AS 'Percentage of Women' FROM client JOIN district ON client.district_id = district.district_id WHERE district.A11 > 10000; 
 SELECT ((SUM(loan.amount) IN 1997 - SUM(loan.amount) IN 1996) / SUM(loan.amount) IN 1996) * 100 AS growth_rate FROM loan JOIN client ON loan.account_id = client.client_id WHERE client.gender = 'M' AND loan.date BETWEEN '1996-01-01' AND '1997-12-31'; 
SELECT COUNT(*) AS credit_card_withdrawals FROM trans WHERE type = 'VYBER KARTOU' AND date > '1995-01-01'; 
SELECT SUM(A16) AS total_crimes_north_bohemia, SUM(A16 WHERE A3 = 'East Bohemia') AS total_crimes_east_bohemia FROM district WHERE YEAR(date) = 1996 AND A16 IS NOT NULL GROUP BY A3;
SELECT COUNT(*) AS total_dispos FROM trans WHERE account_id BETWEEN 1 AND 10 AND type IN ('DISP'); 
SELECT COUNT(*) AS statement_requests FROM trans WHERE account_id = 3 AND type = 'ACCOUNT STATEMENT'; 
SELECT birth_date FROM client WHERE client_id = 130; 
 SELECT COUNT(*) AS accounts_with_statement_request FROM account JOIN trans ON account.account_id = trans.account_id JOIN disp ON trans.disp_id = disp.disp_id WHERE trans.type = 'OBRAT' AND disp.type = 'OWNER' AND frequency = 'POPLATEK PO OBRATU'; 
SELECT SUM(amount) AS debt_amount, status FROM loan JOIN account ON loan.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE client.client_id = 992; 
SELECT SUM(amount) AS total_amount, gender FROM trans JOIN account ON trans.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE client.client_id = 4 AND trans.trans_id > 851 AND (gender = 'MAN' OR gender = 'MALE') GROUP BY gender; 
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id JOIN account ON disp.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE client.client_id = 9; 
SELECT SUM(amount) AS total_paid FROM trans WHERE client_id = 617 AND date BETWEEN '1998-01-01' AND '1998-12-31'; 
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A8 = 1 -- East Bohemia (assuming A8 represents the district code for East Bohemia) 
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.client_id WHERE c.gender = 'F' AND l.amount = (     SELECT MAX(amount)     FROM loan     WHERE client_id IN (         SELECT client_id         FROM client         WHERE gender = 'F'     ) ) LIMIT 3; 
SELECT COUNT(*)  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  JOIN trans t ON a.account_id = t.account_id  WHERE c.gender = 'M'  AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND t.type = 'SIPO'  AND t.amount > 4000; 
SELECT COUNT(*) AS opened_after_1996 FROM account WHERE district_id = 1 AND date > '1996-01-01'; 
 SELECT COUNT(*) AS female_junior_cards FROM client c JOIN card c_card ON c.client_id = c_card.client_id WHERE c.gender = 'F' AND c_card.type = 'JUNIOR'; 
SELECT CAST(SUM(CASE WHEN t.gender = 'F' AND a.district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN a.district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague') THEN 1 END) AS 'Proportion of Female Clients in Prague Branch' FROM account a JOIN client c ON a.client_id = c.client_id JOIN trans t ON a.account_id = t.account_id WHERE a.district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague') 
SELECT      (COUNT(CASE WHEN client.gender = 'M' AND trans.type = 'POPLATEK TYDNE' THEN 1 END) / COUNT(CASE WHEN trans.type = 'POPLATEK TYDNE' THEN 1 END)) * 100 AS percentage_male FROM      client JOIN      trans ON client.client_id = trans.account_id WHERE      trans.type = 'POPLATEK TYDNE'; 
SELECT COUNT(DISTINCT client_id) AS weekly_users FROM client JOIN account ON client.district_id = account.district_id WHERE account.frequency = 'POPLATEK MESICNE'; 
SELECT account.account_id, account.amount FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 24 * 12 AND account.date < '1997-01-01' ORDER BY amount MIN(); 
SELECT account.account_id FROM account JOIN client ON account.district_id = client.district_id WHERE client.gender = 'F' AND account.A11 = (     SELECT MIN(A11)     FROM account AS account2     JOIN client ON account2.district_id = client.district_id     WHERE client.gender = 'F' ) AND account.A11 IS NOT NULL 
SELECT COUNT(*) AS client_count FROM client JOIN district ON client.district_id = district.district_id WHERE client.birth_date = '1920' AND district.A3 IS NOT NULL; 
SELECT COUNT(*) AS loan_count FROM loan WHERE frequency = 'POPLATEK MESICNE' AND duration = 24 * 12 AND type = 'PRE-PAYMENT' 
SELECT AVG(amount) AS avg_loan_amount FROM loan WHERE status = 'C' AND date > (     SELECT date     FROM trans     WHERE account_id = loan.account_id AND type = 'POPLATEK PO OBRATU' ) 
SELECT DISTINCT c.client_id, d.district_id FROM client c JOIN account a ON c.district_id = a.district_id JOIN disp d ON c.client_id = d.client_id WHERE a.frequency NOT IN ('POPLATEK MESICNE', 'LOAN') OR EXISTS (     SELECT 1     FROM loan l     WHERE l.account_id = a.account_id     OR EXISTS (         SELECT 1         FROM order o         WHERE o.account_id = a.account_id AND o.type = 'PERMANENT'     ) )
SELECT client.client_id, client.birth_date AS age  FROM client  JOIN card ON client.client_id = card.client_id  JOIN loan ON card.card_id = loan.card_id  WHERE card.type = 'gold' AND loan.status = 'eligible'
SELECT bond_type, COUNT(*) AS bond_count FROM bond GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1; 
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id2 JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE molecule.label = '-'" AND atom.element = 'cl' AND connected.bond_id IS NULL;
SELECT AVG(CASE WHEN bond_type = '-' AND element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom JOIN connected ON atom.atom_id = connected.atom_id1 JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id IN (     SELECT molecule_id     FROM bond     WHERE bond_type = '-' ); 
SELECT AVG(bond_type = '-') AS avg_single_bonds FROM bond JOIN connected ON bond.molecule_id = connected.molecule_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.label = '+' AND bond.bond_type = '-'
SELECT COUNT(*) FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 JOIN molecule m ON m.molecule_id = c.molecule_id WHERE a.element = 'na' AND m.label = '-';
SELECT molecule_id FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '+';
SELECT CAST(SUM(CASE WHEN element = 'c' AND bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond_type = '=';
SELECT COUNT(*) AS triple_bonds FROM bond WHERE bond_type = '#'; 
SELECT COUNT(*) AS "Atoms Without Bromine" FROM atom WHERE element != 'br'; 
 SELECT COUNT(*) AS carcinogenic_molecules FROM molecule JOIN connected ON molecule.molecule_id = connected.molecule_id JOIN atom ON connected.atom_id = atom.atom_id WHERE molecule.molecule_id BETWEEN 'TR000' AND 'TR099' AND connected.label = '+' LIMIT 100; 
 SELECT molecule_id FROM atom WHERE element = 'si'; 
SELECT DISTINCT element  FROM atom  WHERE bond_id = 'TR004_8_9';
SELECT DISTINCT element  FROM atom a, bond b, connected c  WHERE a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')  AND b.bond_type = ' = '  AND c.atom_id = a.atom_id  AND c.atom_id2 = a.atom_id  AND a.element != b.element;
SELECT molecule.label FROM atom JOIN connected ON atom.atom_id = connected.atom_id1 JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE atom.element = 'h' GROUP BY molecule.label HAVING COUNT(*) = (     SELECT MAX(count)     FROM (         SELECT molecule.label, COUNT(*) AS count         FROM atom         JOIN connected ON atom.atom_id = connected.atom_id1         JOIN molecule ON connected.molecule_id = molecule.molecule_id         WHERE atom.element = 'h'         GROUP BY molecule.label     ) AS subquery ) AND molecule.label IN ('+', '-') 
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te') AND bond_id IN (SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'te'))
SELECT DISTINCT a.atom_id  FROM atom a  INNER JOIN connected c ON a.atom_id = c.atom_id1  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '-'
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id1 JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a1.molecule_id = m.molecule_id OR a2.molecule_id = m.molecule_id WHERE m.label = '-'; 
 SELECT element FROM atom JOIN connected ON atom.atom_id = connected.atom_id1 JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE molecule.label != '-' AND atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') GROUP BY atom.element ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id IN ('TR004_8', 'TR004_20'));
SELECT DISTINCT molecule.label FROM molecule LEFT JOIN connected ON molecule.molecule_id = connected.molecule_id LEFT JOIN atom ON connected.atom_id1 = atom.atom_id WHERE atom.element != 'sn' AND molecule.label IN ('+', '-')
SELECT COUNT(*)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id1  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element IN ('i', 's') AND b.bond_type = '-'  AND a.molecule_id IN (SELECT molecule_id FROM molecule WHERE label IS NULL)
SELECT DISTINCT a1.atom_id AS connected_atom1, a2.atom_id AS connected_atom2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id1 JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#') AND a1.molecule_id = a2.molecule_id;
SELECT DISTINCT a.atom_id  FROM atom a  INNER JOIN connected c ON a.atom_id = c.atom_id1  WHERE c.molecule_id = 'TR181' OR c.atom_id2 = 'TR181';
SELECT CAST(SUM(CASE WHEN label = '+' AND element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule JOIN connected ON molecule.molecule_id = connected.molecule_id JOIN atom ON connected.atom_id1 = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE label = '+'; 
SELECT CAST(SUM(CASE WHEN bond_type = '#' AND label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage of Carcinogenic Molecules in Triple Type Bonds' FROM bond WHERE bond_type = '#'; 
SELECT element FROM atom WHERE molecule_id = 'TR000' AND (element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')) ORDER BY element ASC LIMIT 3; 
SELECT DISTINCT a.atom_id  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id1  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.molecule_id = 'TR001' AND b.bond_id = 'TR001_2_6';
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules,         SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS non_carcinogenic_molecules,         SUM(CASE WHEN label = '+' THEN 1 ELSE -1 END) AS difference FROM molecule JOIN connected ON molecule.molecule_id = connected.molecule_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element IN ('cl', 'c') -- filter for atoms of interest GROUP BY molecule.molecule_id 
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id1 WHERE connected.bond_id = 'TR000_2_5';
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2' AND atom_id = 'TR000_2';
SELECT m.label  FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = ' = ' GROUP BY m.molecule_id ORDER BY m.label ASC LIMIT 5;
SELECT CAST(SUM(CASE WHEN bond_type = ' = ' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS 'percent' FROM bond WHERE molecule_id = 'TR008'; 
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS 'percent_carcinogenic' FROM molecule;
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 END) AS REAL) * 100 / COUNT(*) AS percent FROM atom WHERE molecule_id = 'TR206'; 
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';
SELECT element, label  FROM molecule  WHERE molecule_id = 'TR060' AND label IN ('+', '-')  AND molecule_id IN (SELECT molecule_id FROM atom WHERE element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'));
SELECT bond_type,         CASE             WHEN MAX(COUNT(*) OVER (PARTITION BY bond_type)) > (SELECT COUNT(*) FROM connected WHERE molecule_id = 'TR018') THEN 'Majority'            ELSE 'Not Majority'        END AS bond_type_majority,        molecule.label AS carcinogenic_status FROM bond JOIN connected ON bond.molecule_id = connected.molecule_id JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR018' AND molecule.label IN ('+', '-') GROUP BY bond_type, molecule.label ORDER BY bond_type_majority DESC, carcinogenic_status; 
SELECT m.label FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id AND c.bond_id IS NOT NULL JOIN bond b ON c.bond_id = b.bond_id AND b.bond_type = '-' WHERE b.bond_type = '-' AND a.element IN ('c', 'cl') -- Considering only single bonds between carbon (C) and chlorine (Cl) GROUP BY m.molecule_id, m.label HAVING COUNT(DISTINCT a.element) = 2 -- Molecules with exactly two distinct elements ORDER BY m.label ASC LIMIT 3; 
SELECT bond_id, bond_type FROM bond AS b JOIN connected AS c ON b.molecule_id = c.molecule_id WHERE c.atom_id IN (     SELECT atom_id     FROM atom     WHERE molecule_id = 'TR006' ) ORDER BY bond_type ASC, bond_id ASC LIMIT 2; 
SELECT COUNT(*) FROM bond WHERE molecule_id LIKE 'TR009%' AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12')
SELECT COUNT(*) AS "Carcinogenic Molecules with Bromine" FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN connected ON atom.atom_id IN (SELECT atom_id FROM atom WHERE element = 'br') WHERE molecule.label = '+';
SELECT bond.bond_type, atom.atom_id, atom.atom_id2 FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE bond.molecule_id = 'TR001' AND connected.bond_id = 'TR001_6_9'; 
SELECT molecule_id, label FROM molecule WHERE atom_id = 'TR001_10' AND label = '+';
 SELECT COUNT(*) AS molecule_count FROM molecule WHERE molecule_id IN (     SELECT molecule_id     FROM bond     WHERE bond_type = '#' ) 
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%\_19' AND bond_id IS NOT NULL;
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR004';
SELECT COUNT(molecule_id) AS non_carcinogenic_molecules FROM molecule WHERE label = '-'; 
SELECT DISTINCT m.label  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN molecule m ON c.molecule_id = m.molecule_id  WHERE SUBSTRING(a.atom_id, 7, 2) BETWEEN '21' AND '25'  AND m.label = '+';
SELECT bond_id FROM bond WHERE molecule_id IN (     SELECT molecule_id     FROM atom     WHERE element IN ('p', 'n') ) 
SELECT molecule_id AS "Most Carcinogenic Molecule" FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE bond.bond_type = ' = ' AND molecule.label = '+' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN element = 'i' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) FROM atom WHERE element = 'i' AND bond_id IS NOT NULL;
SELECT bond_type, bond_id FROM bond WHERE SUBSTR(atom_id, 7, 2) + 0 = 45 AND bond_type IN ('=', '-', '#');
SELECT DISTINCT element FROM atom WHERE atom_id NOT IN SELECT atom_id FROM connected;
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR447' AND b.bond_type = '#';
SELECT DISTINCT element  FROM atom  WHERE molecule_id = 'TR144_8_19';
SELECT m.molecule_id, COUNT(*) AS double_bonds_count FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id1 = a.atom_id OR c.atom_id2 = a.atom_id WHERE m.label = '++' AND a.bond_type = ' = ' GROUP BY m.molecule_id ORDER BY double_bonds_count DESC LIMIT 1; 
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1;
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 WHERE a.element = 'pb' AND EXISTS (SELECT * FROM bond b WHERE c.bond_id = b.bond_id)
SELECT DISTINCT element FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'); 
SELECT      (COUNT(bond_id) / (SELECT COUNT(*) FROM atom WHERE MAX(element_count) = (SELECT MAX COUNT(DISTINCT element) FROM atom))) * 100 AS bond_percentage FROM      (SELECT          molecule_id,          bond_type,          COUNT(DISTINCT CASE WHEN element IN ('cl', 'c') THEN atom_id END) as element_count     FROM          bond         JOIN atom ON bond.molecule_id = atom.molecule_id     GROUP BY          molecule_id,          bond_type) as bond_counts 
SELECT CAST(SUM(CASE WHEN bond_type = '-' AND label = '+' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) AS proportion FROM bond WHERE bond_type = '-'; 
 SELECT COUNT(*) AS total_atoms FROM atom WHERE element IN ('c', 'h') 
SELECT atom_id2 FROM connected AS c JOIN atom AS a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 's'; 
SELECT bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom ON connected.atom_id1 = atom.atom_id  WHERE atom.element = 'sn' AND (bond_type = '=' OR bond_type = '-' OR bond_type = '#' )
 SELECT COUNT(DISTINCT element)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '-'; 
SELECT COUNT(*) AS total_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('p', 'br') AND b.bond_type = '#'; 
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT molecule_id FROM molecule WHERE label = '-' AND bond_type = '-' AND atom_id IN(SELECT atom_id FROM atom WHERE molecule_id IN(SELECT molecule_id FROM connected WHERE bond_id IS NULL))
SELECT CAST(SUM(CASE WHEN element = 'cl' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 AS percent FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-' AND a.element = 'cl' AND b.molecule_id IN (     SELECT molecule_id FROM molecule WHERE label LIKE '%-%' ) 
SELECT molecule.label  FROM molecule  WHERE molecule.molecule_id IN ('TR000', 'TR001', 'TR002') AND molecule.label IN ('+', '-')
SELECT molecule_id FROM molecule WHERE label = '-'; 
SELECT SUM(CASE WHEN molecule.label = '+' THEN 1 ELSE 0 END) AS total_carcinogenic_molecules FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id BETWEEN 'TR000' AND 'TR030'; 
SELECT bond_type FROM bond WHERE molecule_id IN ('TR000', 'TR001', 'TR002', 'TR003', 'TR004', 'TR005') AND bond_type IN ('=', '-', '#');
SELECT element FROM atom WHERE bond_id = 'TR001_10_11';
SELECT COUNT(*) FROM bond WHERE bond_type = 'i' AND element = 'i';
SELECT      CASE          WHEN COUNT(CASE WHEN molecule.label = '+' THEN 1 END) > COUNT(CASE WHEN molecule.label = '-' THEN 1 END) THEN 'Mostly carcinogenic'         ELSE 'Mostly non-carcinogenic'     END AS molecule_category FROM      atom  JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      atom.element = 'ca'; 
SELECT COUNT(*)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id1  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element IN ('cl', 'c')  AND b.bond_id = 'TR001_1_8';
 SELECT DISTINCT molecule_id FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id JOIN connected ON atom.atom_id IN (SELECT atom_id2 FROM connected WHERE atom_id = 'atom_id') WHERE atom.element = 'c' AND bond.bond_type = '#' AND connected.label = '-' GROUP BY molecule_id HAVING COUNT(*) = 2; 
SELECT CAST(SUM(CASE WHEN element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN molecule m ON m.molecule_id = a.molecule_id WHERE m.label = '+'; 
SELECT DISTINCT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id2 WHERE connected.molecule_id = 'TR001';
SELECT DISTINCT m.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND b.bond_id = c.bond_id WHERE b.bond_type = ' = ' 
SELECT a.atom_id AS first_atom, a2.atom_id AS second_atom FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id IN (     SELECT bond_id     FROM bond     WHERE bond_type = '#' ) 
SELECT DISTINCT e.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id1  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_id = 'TR005_16_26' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT COUNT(*) FROM molecule WHERE label = '-' AND bond_type = '-' GROUP BY molecule_id HAVING COUNT(*) = (SELECT COUNT(*) FROM bond WHERE bond_type = '-');
SELECT m.label FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11' AND m.label IN ('+', '-');
SELECT bond_id, molecule_id, bond_type,         CASE             WHEN bond_type = '#' AND label = '+' THEN 'Carcinogenic'            WHEN bond_type = '#' AND label = '-' THEN 'Non-Carcinogenic'            ELSE 'Unknown'        END AS bond_carcinogenicity FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id JOIN connected ON atom.atom_id = connected.atom_id1 JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond_type = '#'; 
 SELECT COUNT(*) AS toxic_elements FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.label = '++' AND SUBSTR(a.atom_id, 7, 1) = 4 AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') 
SELECT      CASE          WHEN label = '+' THEN 'Carcinogenic Ratio'         ELSE 'Non-Carcinogenic Ratio'     END AS Label_Ratio,     SUM(CASE WHEN element = 'h' THEN 1 END) / COUNT(*) AS Hydrogen_Ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.molecule_id = 'TR006' GROUP BY      m.label; 
SELECT molecule_id, label FROM molecule JOIN connected ON molecule.molecule_id = connected.molecule_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'ca' AND connected.label IN ('+', '-') GROUP BY molecule_id, label HAVING COUNT(DISTINCT atom.element) = 1;
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'te') AND bond_type IN ('=', '-', '#');
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = SUBSTR(bond_id, 1, 5) AND        c.atom_id2 = SUBSTR(bond_id, 10, 2) AND        b.bond_type IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND        b.bond_id = 'TR001_10_11'; 
SELECT      (COUNT(CASE WHEN bond_type = '#' THEN 1 END) * 100.0 / COUNT(*) AS triple_bond_percent FROM      atom JOIN bond ON atom.molecule_id = bond.molecule_id GROUP BY      molecule_id; 
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percent FROM bond WHERE molecule_id = 'TR047' AND bond_type = '=' 
SELECT molecule_id, label FROM molecule WHERE molecule_id IN (     SELECT molecule_id     FROM atom     WHERE atom_id = 'TR001_1'     AND molecule_id IN (         SELECT molecule_id         FROM connected         WHERE atom_id1 = 'TR001_1'     )     AND label = '+' ); 
SELECT CASE      WHEN EXISTS (         SELECT 1         FROM molecule AS m         WHERE m.label = '++' AND m.molecule_id = 'TR151'     ) THEN 'Yes, TR151 is carcinogenic'     ELSE 'No, TR151 is not carcinogenic' END AS carcinogenic_status; 
SELECT DISTINCT T2.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.molecule_id = 'TR151';
SELECT COUNT(*) FROM molecule WHERE label = '+';
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'c'; 
 SELECT COUNT(*)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN molecule m ON m.molecule_id = c.molecule_id WHERE m.label = '+'; 
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element IN ('cl') AND bond_type = '=') AND bond_id IN(SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'cl' AND label = '+')))
 SELECT COUNT(*) AS count_atoms FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' AND molecule.label = '+'; 
SELECT molecule_id FROM bond AS b WHERE bond_id = 'TR000_1_2' AND atom_id = 'TR000_1';
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN molecule m ON c.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label != '-'; 
SELECT CAST(SUM(CASE WHEN element = 'h' AND label = '+' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(molecule_id) AS percentage FROM atom JOIN connected ON atom.atom_id = connected.atom_id1 JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE element = 'h'; 
SELECT COUNT(*) AS carcinogenic_molecules FROM connected AS c JOIN molecule AS m ON c.molecule_id = m.molecule_id WHERE m.label = 'TR124' AND c.atom_id IN (     SELECT atom_id     FROM atom     WHERE molecule_id = 'TR000'     AND element IN ('cl', 'c') ); 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE c.molecule_id = 'TR186';
SELECT bond_type FROM bond WHERE molecule_id = 'TR007' AND bond_id = 'TR007_4_19';
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4'; 
SELECT COUNT(*) AS double_bonds_count FROM connected AS c JOIN atom AS a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR006' AND b.bond_type = '=' AND (a.label = '+' OR b.label = '+') ;
 SELECT m.label, a.element FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id1 = a.atom_id OR c.atom_id2 = a.atom_id WHERE m.label = '+' AND (a.element = 'cl' OR a.element = 'c' OR a.element = 'h' OR a.element = 'o' OR a.element = 's' OR a.element = 'n' OR a.element = 'p' OR a.element = 'na' OR a.element = 'br' OR a.element = 'f' OR a.element = 'i' OR a.element = 'sn' OR a.element = 'pb' OR a.element = 'te' OR a.element = 'ca') 
SELECT bond.bond_id, atom.atom_id AS atom1, atom.atom_id AS atom2 FROM bond JOIN connected ON bond.molecule_id = connected.molecule_id JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE bond.bond_type = '-' 
 SELECT m.label, GROUP_CONCAT(a.element) AS elements FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id1 = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_type = '#' GROUP BY m.molecule_id HAVING COUNT(DISTINCT a.element) IN (SELECT CASE                                         WHEN element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') THEN 3                                        ELSE 0                                        END                                        FROM atom                                        WHERE element IS NOT NULL) 
SELECT DISTINCT a.element  FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN atom b ON c.atom_id2 = b.atom_id WHERE c.bond_id = 'TR000_2_3'; 
SELECT COUNT(*) FROM bond AS b JOIN connected AS c ON b.molecule_id = c.molecule_id JOIN atom AS a ON c.atom_id = a.atom_id AND a.element = 'cl'
SELECT a.atom_id, COUNT(b.bond_type) AS bond_types FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id; 
SELECT COUNT(molecule_id) AS molecules_with_double_bond,         SUM(CASE WHEN bond_type = ' = ' AND label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules FROM molecule JOIN connected ON molecule.molecule_id = connected.molecule_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond_type = ' = '; 
SELECT COUNT(molecule_id) AS num_molecules FROM molecule WHERE molecule_id NOT IN (     SELECT DISTINCT molecule_id     FROM atom     WHERE element = 's' ) AND molecule_id NOT IN (     SELECT molecule_id     FROM connected     WHERE bond_type = ' = '     OR bond_type != ' = ' ) 
SELECT m.label FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4' AND m.label = '+'; 
SELECT COUNT(*) AS atom_count FROM atom WHERE molecule_id = 'TR005'; 
 SELECT COUNT(*) AS single_bonds FROM bond WHERE bond_type = '-'; 
SELECT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'cl' AND m.label = '+'; 
SELECT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'c' AND m.label != '-'; 
SELECT CAST(SUM(CASE WHEN label = '+' AND element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percentage FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE element = 'cl'; 
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'; 
SELECT COUNT(DISTINCT element) FROM atom JOIN bond ON atom.atom_id = bond.atom_id WHERE bond.bond_id = 'TR001_3_4';
SELECT bond_type  FROM bond  WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id IN ('TR000_1', 'TR000_2'))  AND bond_type = '=';
SELECT m.label FROM atom a1 JOIN molecule m ON a1.molecule_id = m.molecule_id WHERE a1.atom_id = 'TR000_2' OR a1.atom_id = 'TR000_4'; 
SELECT element FROM atom WHERE atom_id = 'TR000_1';
SELECT CASE      WHEN m.label = '+' THEN 'Carcinogenic'     ELSE 'Non-carcinogenic' END AS molecule_status FROM molecule m WHERE m.molecule_id = 'TR000'; 
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond WHERE bond_type = '-'; 
SELECT COUNT(*) AS carcinogenic_molecules FROM molecule WHERE molecule_id IN (     SELECT molecule_id     FROM atom     WHERE element = 'n' ) AND label = '+'; 
SELECT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id1 = a.atom_id JOIN atom b ON c.atom_id2 = b.atom_id WHERE a.element = 's' AND b.element = 's' AND c.bond_type = '=';
SELECT m.molecule_id, m.label FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id WHERE m.label = '-' AND COUNT(a.atom_id) > 5; 
SELECT DISTINCT element  FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');
SELECT m.molecule_id AS "Carcinogenic Molecule" FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id1 = a.atom_id OR c.atom_id2 = a.atom_id GROUP BY m.molecule_id HAVING COUNT(a.atom_id) = (SELECT MAX(count) FROM (SELECT molecule_id, COUNT(*) AS count FROM atom GROUP BY molecule_id HAVING label = '+') AS max_atoms) ORDER BY COUNT(a.atom_id) DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN element = 'h' AND bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS 'Percentage of Carcinogenic Molecules' FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' 
SELECT COUNT(*) FROM molecule WHERE label = '+';
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND bond_type = '-';
SELECT COUNT(*) AS carbon_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR008' AND a.element = 'c'; 
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label != '-') AND element NOT IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');
SELECT COUNT(*) FROM molecule WHERE molecule_id IN(SELECT molecule_id FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = ' = ' AND element = 'o') GROUP BY molecule_id;
SELECT COUNT(*)  FROM molecule m  JOIN connected c ON m.molecule_id = c.molecule_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#' AND m.label = '-';
SELECT DISTINCT element, bond_type  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id1  JOIN bond ON connected.bond_id = bond.bond_id  WHERE molecule_id = 'TR016' AND (element IN ('cl', 'c', 'h') OR bond_type IN ('=', '-', '#'))
SELECT atom.atom_id FROM atom  JOIN bond ON atom.molecule_id = bond.molecule_id  JOIN connected ON atom.atom_id = connected.atom_id1  WHERE atom.element = 'c' AND bond.bond_type = ' = ' AND connected.molecule_id = 'TR012';
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id1 JOIN molecule m ON m.molecule_id = c.molecule_id WHERE m.label = '+' AND a.element = 'o'; 
SELECT * FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;
SELECT * FROM cards WHERE borderColor IS NULL AND cardKingdomFoilId IS NULL OR cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NULL;
SELECT name  FROM cards  WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)
SELECT c.* FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'EDHRec' AND c.frameVersion = '2015' AND c.edhrecRank < 100; 
SELECT * FROM cards WHERE rarity = 'mythic' AND status = 'Banned' AND format = 'gladiator'
SELECT * FROM cards WHERE type = 'Artifact' AND side IS NULL AND format = 'vintage' AND uuid IN (     SELECT uuid FROM legalities     WHERE format = 'vintage' )
SELECT c.id, c.artist  FROM cards c  WHERE c.power = '*' OR c.power IS NULL  AND c.format = 'commander'  AND c.status = 'Legal'
SELECT c.* FROM cards c JOIN foreign_data f ON c.uuid = f.uuid JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel' AND c.hasContentWarning = 1; 
SELECT * FROM rulings WHERE text LIKE '%Sublime Epiphany%' AND uuid = '74s';
SELECT c.name AS card_name, c.artist, COUNT(r.uuid) AS ruling_count, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid, c.name, c.artist, c.isPromo HAVING ruling_count = (     SELECT MAX(count)     FROM (         SELECT COUNT(*) AS count         FROM cards c2         JOIN rulings r2 ON c2.uuid = r2.uuid         WHERE c2.isPromo = 1     ) AS promos ) ORDER BY ruling_count DESC, c.isPromo DESC LIMIT 1; 
SELECT language FROM foreign_data WHERE name = 'annul' AND uuid IN(SELECT uuid FROM cards WHERE number = '29')
SELECT * FROM cards WHERE uuid IN(SELECT uuid FROM foreign_data WHERE language = 'Japanese');
SELECT CAST(SUM(id) AS REAL) * 100 / COUNT(id) AS 'Percentage of Cards in Chinese Simplified' FROM cards WHERE language = 'Chinese Simplified'; 
 SELECT s.setCode, s.totalSetSize FROM sets s JOIN set_translations st ON s.setCode = st.setCode WHERE st.language = 'Italian'; 
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(*) FROM cards WHERE power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress';
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';
 SELECT DISTINCT T2.language FROM cards AS C JOIN set_translations AS ST ON C.setCode = ST.setCode JOIN sets AS S ON ST.setCode = S.code WHERE C.name = 'Angel of Mercy' AND S.name IS NOT NULL; 
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.textless = 0;
SELECT text FROM rulings WHERE uuid = 'replace(Ancestor''s Chosen, ''Ancestor''s Chosen, ''Condemn)';
 SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'restricted' AND cards.isStarter = 1; 
SELECT status FROM legalities WHERE uuid = '8ac972b5-9f6e-5cc8-91c3-b9a40a98232e'; 
SELECT type FROM cards WHERE name = 'Benalish Knight';
SELECT ruling.text FROM rulings WHERE cards.name = 'Benalish Knight' AND format IS NOT NULL;
SELECT DISTINCT artist  FROM cards  WHERE type = 'Artifact' AND setCode LIKE '%Phyrexian%' AND name LIKE '%Art%' AND language = 'Phyrexian';
SELECT (COUNT(id) FILTER (WHERE borderColor = 'borderless') / COUNT(id)) * 100 AS 'Percentage of Borderless Cards' FROM cards;
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless' AND language = 'Russian'; 
SELECT (COUNT(CASE WHEN language = 'French' AND isStorySpotlight = 1 THEN 1 END) * 100 / COUNT(isStorySpotlight = 1)) AS 'Percentage of French Story Spotlight Cards' FROM cards WHERE isStorySpotlight = 1;
SELECT COUNT(*) FROM cards WHERE toughness = '99';
SELECT * FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT layout FROM cards WHERE keywords LIKE '%flying%' 
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtype NOT LIKE '%Angel%'
SELECT c.id FROM cards c WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL AND c.isFoil = 1;
SELECT id FROM cards WHERE duelDeck = 'a';
 SELECT edhrecRank FROM cards WHERE frameVersion = '2015'; 
SELECT DISTINCT artist FROM cards WHERE language = 'zh-CN'; 
SELECT * FROM cards WHERE availability = 'paper' AND language = 'Japanese'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND status = 'Banned';
 SELECT cards.uuid, foreign_data.language FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.format = 'legacy' 
 SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality'; 
SELECT COUNT(*) AS num_cards_with_future_frame_version,         CASE WHEN status = 'legal' THEN 'Legal' ELSE 'Not Legal' END AS legality_status FROM cards WHERE frameVersion = 'future'; 
SELECT * FROM cards WHERE setCode = 'OGW' AND colorIdentity IS NOT NULL;
SELECT c.name, l.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON c.setCode = s.code WHERE s.setCode = '10E' AND c.convertedManaCost = 5 AND st.language IS NOT NULL; 
SELECT name, ruling.date FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE originalType = 'Creature - Elf';
SELECT colors, format FROM cards WHERE id BETWEEN 1 AND 20; 
 SELECT c.* FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language IS NOT NULL; 
SELECT name, rulings.date FROM cards WHERE rarity = 'uncommon' ORDER BY rulings.date ASC LIMIT 3; 
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'John Avon' AND c.cardKingdomFoilId IS NOT NULL AND f.flavorText NOT LIKE '%power%'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;
 SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'  AND availability = 'mtgo'  AND hand = '-1'; 
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;
SELECT convertedManaCost  FROM cards  WHERE layout = 'normal'  AND frameVersion = '2003'  AND borderColor = 'black'  AND (availability = 'paper' OR availability = 'mtgo'); 
SELECT SUM(c.manaCost) AS total_unconverted_mana FROM cards c WHERE c.artist = 'Rob Alexander'; 
SELECT DISTINCT types FROM cards WHERE availability = 'arena';
SELECT setCode FROM sets WHERE language = 'Spanish';
SELECT CAST(SUM(CASE WHEN hand = '+3' AND frameEffects = 'legendary' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS 'Percentage of Legendary Frame Effect Cards with Max Hand Size +3' FROM cards WHERE frameEffects = 'legendary'; 
 SELECT c.id, c.name,         (SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 1 THEN 1 ELSE 0 END) / COUNT(c.id)) * 100 AS percentage FROM cards c GROUP BY c.id, c.name 
SELECT name,         (SUM(CASE WHEN language = 'Spanish' THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS percentage FROM cards GROUP BY name; 
SELECT language FROM set_translations WHERE setCode = '309';
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)'; 
SELECT c.id, c.name FROM cards c WHERE c.type = 'Creature' AND c.status = 'legal' AND c.subtypes LIKE '%Goblin%'
SELECT DISTINCT t.type  FROM cards t  WHERE t.language = 'German'  AND t.subtypes IS NOT NULL  AND t.supertypes IS NOT NULL;
SELECT COUNT(*) AS count_null_power_cards FROM cards WHERE power IS NULL OR power = '*' AND (faceConvertedManaCost IS NOT NULL OR faceName IS NOT NULL OR layout IS NOT NULL OR text IS NOT NULL); 
SELECT COUNT(*) AS count FROM cards WHERE format IN ('premodern') AND        rulings.text = 'This is a triggered mana ability' AND        side IS NULL; 
SELECT c.id FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Erica Yang' AND c.availability = 'paper' AND c.format = 'Pauper' AND c.isOnlineOnly = 0;
SELECT artist FROM cards WHERE flavorText = 'Das perfekte Gegenmittel zu einer dichten Formation'; 
 SELECT flavorText FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.artist = 'Matthew D. Wilson' AND cards.layout = 'normal' AND cards.borderColor = 'black' AND language = 'French'; 
 SELECT COUNT(*)  FROM cards  WHERE rarity = 'rare'  AND date = '2009-01-10'  AND uuid IN (     SELECT uuid      FROM rulings      WHERE text IS NOT NULL ) 
 SELECT s.language FROM sets s JOIN set_translations st ON s.setCode = st.setCode WHERE s.block = 'Ravnica' AND s.baseSetSize = 180; 
SELECT CAST(SUM(CASE WHEN format = 'commander' AND status = 'legal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage Without Content Warning' FROM cards WHERE hasContentWarning = 0; 
SELECT CAST(SUM(CASE WHEN language = 'French' AND power IS NULL OR power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN power IS NULL OR power = '*' THEN 1 END) AS 'Percentage of Cards Without Power in French' FROM cards; 
SELECT CAST(SUM(CASE WHEN language = 'Japanese' AND type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage of Japanese translated expansion sets' FROM sets WHERE language = 'Japanese' AND type = 'expansion'
SELECT availability FROM cards WHERE artist = 'Daren Bader';
 SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless'  AND edhrecRank > 12000; 
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;
 SELECT * FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3; 
SELECT language FROM foreign_data WHERE multiverseid = 149934;
 SELECT c.id AS foilId, c2.id AS kingdomId FROM cards c JOIN cards c2 ON c.cardKingdomFoilId = c2.id OR c2.cardKingdomFoilId = c.id WHERE c.cardKingdomFoilId IS NOT NULL AND c2.cardKingdomId IS NOT NULL ORDER BY c.cardKingdomFoilId ASC, c2.cardKingdomId ASC LIMIT 3; 
SELECT CAST(SUM(CASE WHEN `isTextless` = 1 AND `layout` = 'normal' THEN 1 ELSE 0 END) AS REAL) / COUNT(`uuid`) * 100 AS 'Proportion Without Normal Layout' FROM `cards`; 
SELECT c.number FROM cards c WHERE c.subtypes LIKE '%Angel%' AND c.subtypes LIKE '%Wizard' AND c.otherFaceIds IS NULL; 
SELECT s.name FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3;
SELECT language  FROM set_translations  WHERE setCode = 'ARC' AND mcmName = 'Archenemy';
SELECT s.name AS setName, st.translation AS setTranslation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5; 
SELECT language, type FROM sets WHERE id = 206;
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.setCode = st.setCode JOIN cards c ON s.mcmId = c.mcmId WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2; 
SELECT s.id FROM sets s JOIN legalities l ON s.uuid = l.uuid WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND s.language = 'Japanese' AND l.status != 'Legal' ORDER BY s.name;
SELECT sets.code AS set_name, SUM(cards.id) AS total_cards FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.language = 'Russian' GROUP BY sets.code ORDER BY total_cards DESC LIMIT 1;
 SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 AND language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage of Online Cards' FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE language = 'Chinese Simplified' AND legalities.status = 'Legal'; 
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND mtgoCode IS NULL OR mtgoCode = ''
SELECT id FROM cards WHERE borderColor = 'black';
SELECT id FROM cards WHERE frameEffects = 'extendedart';
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT language FROM sets WHERE code = '174';
SELECT name FROM sets WHERE code = 'ALL';
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar';
SELECT setCode FROM sets WHERE releaseDate = '2007-07-13';
SELECT s.baseSetSize, s.setCode FROM sets s WHERE s.block IN ('Masques', 'Mirage'); 
SELECT code FROM sets WHERE type = 'expansion';
SELECT foreignName, type FROM cards WHERE watermark = 'boros';
SELECT language, flavorText, type FROM cards WHERE watermark = 'colorpie';
SELECT CAST(SUM(CASE WHEN cards.name = 'Abyssal Horror' AND cards.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM cards WHERE cards.name = 'Abyssal Horror'; 
SELECT sets.setCode FROM sets JOIN set_types ON sets.type = 'expansion' WHERE set_types.name = 'commander'; 
SELECT foreignName, type FROM cards WHERE watermark = 'abzan';
SELECT language, type FROM cards WHERE watermark = 'azorius' AND uuid IN (SELECT uuid FROM cards WHERE type = 'Card');
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL;
 SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%'  AND hand = '+%'; 
SELECT name FROM cards WHERE isTextless = 0; 
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen';
SELECT COUNT(*)  FROM cards  WHERE colorIdentity = 'W' AND borderColor = 'unknown' AND power IS NULL OR power = '*'
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL GROUP BY name HAVING COUNT(*) > 1; 
SELECT types FROM cards WHERE name = 'Molimo, Maro-Sorcerer' AND subtypes IS NOT NULL UNION SELECT types FROM cards WHERE name = 'Molimo, Maro-Sorcerer' AND supertypes IS NOT NULL;
SELECT purchaseUrls  FROM cards  WHERE promoTypes = 'bundle';
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'; 
SELECT name, convertedManaCost  FROM cards  WHERE name IN ('Serra Angel', 'Shrine Keeper')  AND convertedManaCost = (SELECT MAX(convertedManaCost)                           FROM cards                           WHERE name IN ('Serra Angel', 'Shrine Keeper'));
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';
SELECT name  FROM cards  WHERE frameVersion = '2003'  AND convertedManaCost = (     SELECT MAX(convertedManaCost)      FROM cards      WHERE frameVersion = '2003' ) ORDER BY convertedManaCost DESC  LIMIT 3; 
SELECT setTranslation.translation FROM set_translations AS st JOIN sets AS s ON st.setCode = s.code WHERE s.name = 'Ancestor''s Chosen' AND language = 'Italian';
SELECT COUNT(*) FROM set_translations WHERE translation LIKE '%Angel of Mercy%'
 SELECT name  FROM cards  WHERE setCode = 'Hauptset Zehnte Edition'; 
SELECT COUNT(*)  FROM cards  WHERE name = 'Ancestor''s Chosen' AND language = 'Korean';
SELECT COUNT(*) FROM cards WHERE setCode = 'Hauptset Zehnte Edition' AND artist = 'Adam Rex';
SELECT COUNT(*) FROM "sets" WHERE code = 'Hauptset Zehnte Edition' AND baseSetSize IS NOT NULL;
SELECT translation FROM set_translations WHERE setCode = 'Eighth Edition' AND language = 'Simplified Chinese';
SELECT COUNT(*) AS appearance_count FROM cards WHERE name = 'Angel of Mercy' AND mtgoCode IS NOT NULL; 
SELECT releaseDate FROM sets WHERE name = 'Ancestor''s Chosen';
SELECT type FROM sets WHERE name = 'Hauptset Zehnte Edition' AND translation = 'Hauptset Zehnte Edition';
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian'; 
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.isForeignOnly = 1 AND s.name = 'Adarkar Valkyrie' AND c.country = 'US';
SELECT COUNT(*) FROM sets WHERE language = 'Italian' AND translation IS NOT NULL AND baseSetSize < 10;
SELECT COUNT(*) FROM cards WHERE setCode = 'Coldsnap' AND borderColor = 'black';
 SELECT name  FROM cards  WHERE setCode = 'Coldsnap'  ORDER BY convertedManaCost DESC  LIMIT 1; 
SELECT DISTINCT artist  FROM cards  WHERE setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');
SELECT * FROM cards WHERE setCode = 'Coldsnap' AND number = 4;
SELECT COUNT(*)  FROM cards  WHERE setCode = 'Coldsnap'  AND convertedManaCost > 5  AND (power = '*' OR T1.power IS NULL)  AND name = 'Coldsnap';
SELECT flavorText FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'Italian';
 SELECT DISTINCT language FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL; 
SELECT type FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'German';
SELECT r.text AS ruling_text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Coldsnap' AND c.language = 'Italian'
SELECT name  FROM cards  WHERE language = 'Italian' AND setCode = 'Coldsnap' AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE language = 'Italian' AND setCode = 'Coldsnap')
SELECT date FROM rulings WHERE text LIKE '%Reminisce%' AND name = 'Reminisce';
SELECT CAST(SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN cards.convertedManaCost IS NOT NULL THEN 1 ELSE 0 END) AS 'Percentage of cards with converted mana cost 7 in Coldsnap' FROM cards WHERE cards.name = 'Coldsnap' AND cards.convertedManaCost IS NOT NULL;
 SELECT CAST(SUM(CASE WHEN cards.name = 'Coldsnap' AND cards.cardKingdomFoilId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage of Incredibly Powerful Cards' FROM cards WHERE cards.name = 'Coldsnap'; 
SELECT s.setCode FROM sets s WHERE s.releaseDate = '2017-07-14';
 SELECT keyruneCode FROM sets WHERE code = 'PKHC'; 
SELECT mcmId FROM sets WHERE code = 'SS2';
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%' AND type = 'expansion';
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';
SELECT c.id, c.name, c.text, c.hasContentWarning FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Jim Pavelec' AND fd.language IS NOT NULL AND c.text LIKE '%ruling%' GROUP BY c.id, c.name, c.text, c.hasContentWarning HAVING c.hasContentWarning = 1; 
SELECT releaseDate FROM sets WHERE name = 'Evacuation';
SELECT COUNT(*) FROM sets WHERE name = 'Rinascita di Alara' AND type = 'Set';
SELECT type FROM sets WHERE setCode = 'Huitième édition' AND translation = 'Huitième édition' AND type = 'Expansion';
SELECT setTranslation.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN foreign_data fd ON s.mcmId = fd.multiverseid WHERE fd.name = 'Tendo Ice Bridge' AND st.language = 'French'; 
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND name = 'Salvat 2011';
SELECT s.name AS japaneseName FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Fellwar Stone' AND c.language = 'Japanese';
SELECT name FROM cards WHERE setCode = 'Journey into Nyx Hero''s Path' ORDER BY convertedManaCost DESC LIMIT 1;
SELECT releaseDate FROM sets WHERE name = 'Ola de frío' AND translation = 'Ola de frío';
SELECT set.type FROM sets s JOIN cards c ON s.setCode = c.setCode WHERE c.name = 'Samite Pilgrim';
SELECT COUNT(*) FROM cards WHERE setCode = 'World Championship Decks 2004' AND convertedManaCost = 3;
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setCode = 'Mirrodin';
SELECT (SUM(CASE WHEN language = 'Japanese' AND isNonFoilOnly = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS 'Percentage of Japanese Non-Foil Cards' FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.language = 'Japanese'; 
SELECT CAST(SUM(CASE WHEN language = 'Portuguese (Brazil)' AND isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN language = 'Portuguese (Brazil)' THEN 1 END) AS 'Percentage of Online Only Cards' FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.language = 'Portuguese (Brazil)' 
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1;
SELECT s.id AS unique_id FROM sets s JOIN cards c ON s.setCode = c.setCode GROUP BY s.setCode ORDER BY MAX(c.baseSetSize) DESC LIMIT 1;
SELECT a.artist  FROM cards a  WHERE a.side IS NULL AND a.convertedManaCost = (SELECT MAX(convertedManaCost)  FROM cards WHERE side IS NULL)  GROUP BY a.artist;
SELECT MAX(frameEffects) AS most_common_frame_effect  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  GROUP BY frameEffects  HAVING COUNT(*) = (SELECT MAX(count)                    FROM (SELECT cardKingdomFoilId, COUNT(*) AS count                          FROM cards                          WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL                          GROUP BY frameEffects) AS foil_counts                    WHERE foil_counts.count = (SELECT COUNT(*)                                               FROM cards                                               WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL));
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'
WITH commander_sets AS (   SELECT s.id, s.totalSetSize   FROM sets s   JOIN legalities l ON s.uuid = l.uuid   WHERE l.format IN (' commander ')     AND s.type = 'commander'     AND s.isForeignOnly = 0 -- exclude foreign-only sets     AND s.isAlchemyModification = 0 -- exclude Alchemy modifications ),  max_cards AS (   SELECT MAX(totalSetSize) AS max_total   FROM commander_sets ) SELECT cs.id FROM commander_sets cs JOIN max_cards mc ON cs.totalSetSize = mc.max_total 
SELECT * FROM cards WHERE format = 'duel' AND convertedManaCost IS NULL ORDER BY manaCost DESC LIMIT 10;
SELECT MIN(originalReleaseDate) AS oldest_release_date, name AS oldest_mythic_card  FROM cards  WHERE rarity = 'mythic' AND status = 'legal'  GROUP BY name;
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baga' AND fd.language = 'French';
SELECT COUNT(*) FROM cards c WHERE c.rarity = 'rare' AND c.type = 'Enchantment' AND c.name = 'Abundance' AND c.status = 'Legal'
 SELECT format, name FROM legalities WHERE status = 'banned' GROUP BY format ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT language FROM sets WHERE name = 'Battlebond';
SELECT Illustrator, MIN(Format) AS Format FROM cards JOIN artists ON cards.artist = artists.name GROUP BY Illustrator HAVING COUNT(*) = (SELECT MIN艺术家数量 FROM (     SELECT COUNT(*) AS ArtistCount     FROM cards ) AS min_artist_count) 
SELECT status  FROM cards  WHERE frameVersion = '1997' AND artist = 'D. Alexander Gregory' AND hasContentWarning = 1 AND format = 'legacy' AND uuid IN (     SELECT uuid      FROM cards      WHERE type = 'Card'      AND type IN ('Land', 'Artifact') )
SELECT name, format FROM cards WHERE edhrecRank = 1 AND status = 'banned' ORDER BY name ASC;
SELECT AVG(id) AS avg_sets, MAX(COUNT(language)) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' AND isOnlineOnly = 0 GROUP BY common_language;
 SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena'; 
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';
SELECT r.date, r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC; 
 SELECT cards.name, formats.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.setCode = 'Hour of Devastation' AND legalities.status = 'legal' AND formats.format IS NOT NULL; 
SELECT name FROM sets WHERE name NOT LIKE '%Japanese%' AND language = 'Korean'; 
SELECT frameVersion, COUNT(*) AS card_count FROM cards WHERE artist = 'Allen Williams' GROUP BY frameVersion UNION SELECT frameVersion, 'Banned' AS card_count FROM cards WHERE artist = 'Allen Williams' AND status = 'banned' ORDER BY card_count DESC;
SELECT MAX(Reputation) AS highest_reputation_user FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon');
SELECT u.DisplayName FROM users u WHERE YEAR(u.CreationDate) = 2014;
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00';
SELECT u.DisplayName AS "Display Name of User with Most Views" FROM users u WHERE u.Views = (SELECT MAX(Views) FROM users);
SELECT COUNT(DISTINCT UserId) FROM users WHERE Upvotes > 100 AND Downvotes > 1;
 SELECT COUNT(DISTINCT users.Id) AS UsersWithMoreViewsAfter2013 FROM users WHERE Views > 10 AND YEAR(creationDate) > 2013; 
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'; 
SELECT u.DisplayName AS Owner FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' AND Id = (SELECT MAX(PostId) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ViewCount = (SELECT MAX(ViewCount) FROM posts));
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN votes v ON p.Id = v.PostId WHERE v.BountyAmount = (     SELECT MAX(BountyAmount)     FROM votes     WHERE PostId = p.Id ) 
 SELECT SUM(CommentCount) AS TotalComments FROM comments JOIN posts ON comments.PostId = posts.Id JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'; 
 SELECT p.Id, MAX(p.AnswerCount) AS MaxAnswers FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' GROUP BY p.Id ORDER BY MaxAnswers DESC LIMIT 1; 
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';
SELECT COUNT(*) AS RootPostsCount FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL;
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL; 
SELECT COUNT(*) AS 'Posts With Score Over 19' FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.Age > 65 AND posts.Score >= 20; 
SELECT Location FROM users WHERE OwnerUserId = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts')
SELECT p.Body  FROM posts p  JOIN tags t ON p.ExcerptPostId = t.Id  WHERE t.TagName = 'bayesian'
SELECT p.Id, p.Body FROM posts p JOIN tags t ON p.ExcerptPostId = t.Id WHERE t.Count = (     SELECT MAX(Count)     FROM tags ) 
SELECT COUNT(*) FROM badges WHERE UserDisplayName = 'csgillespie';
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
 SELECT COUNT(*) AS num_badges_obtained_in_2011 FROM badges WHERE UserId IN (   SELECT Id   FROM users   WHERE DisplayName = 'csgillespie' ) AND YEAR(Date) = 2011; 
 SELECT u.DisplayName FROM users u JOIN (     SELECT UserId, COUNT(*) AS badge_count     FROM badges     GROUP BY UserId     HAVING COUNT(*) = (SELECT MAX(badge_count) FROM badges) ) b ON u.Id = b.UserId 
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'
 SELECT AVG(COUNT(Id)) AS average_badges FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Views > 200; 
SELECT CAST(SUM(CASE WHEN Post.Score > 20 AND users.Age > 65 THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 AS 'Percentage Owned by Elder Users' FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.Score > 20 GROUP BY p.OwnerUserId HAVING u.Age > 65 
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';
 SELECT CreationDate FROM votes WHERE PostId IN (   SELECT PostId   FROM votes   GROUP BY PostId   HAVING MAX(Count(Id)) ) 
SELECT COUNT(*) FROM badges WHERE Name = 'Revival';
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (     SELECT MAX(Score)     FROM comments ) 
SELECT p.Id, COUNT(c.Id) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910 GROUP BY p.Id; 
SELECT COUNT(FavoriteCount) FROM posts WHERE Id = (SELECT PostId FROM comments WHERE UserId = '3025' AND CreationDate = '2014-04-23 20:29:39.0') AND Post.FavoriteCount IS NOT NULL;
SELECT c.Text FROM comments c JOIN (     SELECT PostId, MAX(CommentCount) AS max_count     FROM posts     WHERE ParentId = 107829     GROUP BY PostId     HAVING max_count = 1 ) p ON c.PostId = p.PostId WHERE c.CommentCount = 1; 
SELECT p.Id AS PostId,         CASE             WHEN p.ClosedDate IS NULL THEN 'Well-finished'            ELSE 'Not well-finished'        END AS PostCompletion FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'User No. 23853' AND p.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NULL; 
SELECT u.Reputation FROM users u WHERE u.Id = (     SELECT OwnerUserId     FROM posts     WHERE Id = '65041' ) 
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini';
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.PostId = '381800' AND v.VoteTypeId = (SELECT VoteTypeId FROM votes WHERE Id = '6347')
SELECT COUNT(*) FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';
SELECT CAST(SUM(CASE WHEN OwnerUserId = 24 OR UserId = 24 THEN 1 ELSE 0 END) AS REAL) / COUNT(votes.Id) AS PostVoteRatio FROM posts p LEFT JOIN votes v ON p.Id = v.PostId WHERE p.OwnerUserId = 24 OR p.UserId = 24; 
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';
SELECT c.Text FROM comments c WHERE c.Score = 17; 
SELECT u.DisplayName  FROM users u  WHERE u.WebsiteUrl = 'http://stackoverflow.com';
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'SilentGhost')
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'thank you user93'; 
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion' 
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing';
SELECT c.Id, c.Score, c.Text, c.CreationDate, u.DisplayName AS UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.PostId IN (     SELECT p.Id     FROM posts p     WHERE p.Title = 'How does gentle boosting differ from AdaBoost?' ) 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10; 
SELECT DISTINCT p.LastEditorUserId FROM posts p WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';
SELECT p.Title FROM posts p JOIN votes v ON p.LastEditorUserId = v.UserId WHERE v.CreationDate AND p.LastEditorDisplayName = 'Vebjorn Ljosa'; 
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Yevgeny' AND p.LastEditorUserId = u.Id;
 SELECT c.* FROM comments c INNER JOIN postHistory ph ON c.PostId = ph.PostId INNER JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND c.UserId IN (   SELECT UserId   FROM postHistory   WHERE PostId = p.Id   AND CreationDate = (     SELECT MAX(CreationDate)     FROM postHistory     WHERE PostId = p.Id     AND Title = 'Why square the difference instead of taking the absolute value in standard deviation?'   ) ) 
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM votes JOIN posts ON votes.PostId = posts.Id WHERE posts.Title LIKE '%data%' 
SELECT u.DisplayName  FROM users u  JOIN votes v ON u.Id = v.UserId  JOIN posts p ON v.PostId = p.Id  WHERE p.Title LIKE '%variance%' AND v.BountyAmount = 50;
SELECT p.Title, c.Text AS Comment, p.ViewCount FROM posts p JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id WHERE t.TagName = 'humor' JOIN comments c ON p.Id = c.PostId GROUP BY p.Id, p.Title, c.Text, p.ViewCount HAVING p.ViewCount IS NOT NULL AVG(p.ViewCount) AS AverageViewCount; 
SELECT COUNT(*) AS TotalComments FROM comments WHERE UserId = 13; 
SELECT `UserId` FROM `users` WHERE `Reputation` = (SELECT MAX(`Reputation`) FROM `users`)
 SELECT UserId FROM users WHERE Views = (SELECT MIN(Views) FROM users) 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Supporter' AND Date >= '2011-01-01' AND Date <= '2011-12-31'; 
SELECT COUNT(UserId) FROM badges WHERE Name IN (SELECT Name FROM badges GROUP BY UserId HAVING COUNT(*) > 5);
SELECT COUNT(*) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York';
SELECT u.DisplayName AS UserDisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1; 
SELECT u.Id, u.DisplayName FROM users u JOIN (   SELECT PostId, COUNT(*) AS post_history_count   FROM postHistory   GROUP BY PostId   HAVING COUNT(*) = 1 AND PostHistoryViews >= 1000 ) ph ON u.Id = ph.UserId WHERE ph.post_history_count = 1; 
SELECT u.DisplayName AS UserDisplayName, b.Name AS BadgeName FROM users u JOIN (     SELECT UserId, MAX(CommentCount) AS MaxComments     FROM comments     GROUP BY UserId     HAVING MAX(CommentCount) = (         SELECT MAX(CommentCount)         FROM comments     ) ) c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId ORDER BY MaxComments DESC; 
SELECT COUNT(UserId) AS UsersWithTeacherBadge FROM badges JOIN users ON badges.UserId = users.Id WHERE users.Location = 'India' AND badges.Name = 'Teacher'; 
SELECT      ((COUNT(CASE WHEN Name LIKE 'Student' AND Date >= '2010-01-01' AND Date <= '2010-12-31' THEN 'Student' END) / COUNT('Student')) * 100) AS Percentage_2010,     ((COUNT(CASE WHEN Name LIKE 'Student' AND Date >= '2011-01-01' AND Date <= '2011-12-31' THEN 'Student' END) / COUNT('Student')) * 100) AS Percentage_2011,     ((Percentage_2011 - Percentage_2010) / Percentage_2011) * 100 AS PercentageDifference FROM badges WHERE Name LIKE '%Student%' 
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommentUsers FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId; 
SELECT p.Id, p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; 
SELECT Score, LinkTypeId FROM posts WHERE Id = 395;
SELECT p.Id AS PostId, u.Id AS UserId FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.Score > 60 
SELECT SUM(favoriteCount) AS total_favorites FROM posts p JOIN votes v ON p.Id = v.PostId JOIN users u ON v.UserId = u.Id WHERE u.Id = 686 AND YEAR(p.CreationDate) = 2011; 
 SELECT Divide(Sum(UpVotes), Count(UserId)) AS UpVoteAverage, Divide(Sum(Age), Count(UserId)) AS AverageAge FROM users WHERE Count(PostId) > 10; 
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer' AND UserId IS NOT NULL;
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08' 
SELECT COUNT(*) FROM comments WHERE Score > 60;
SELECT c.Text AS "Detailed Content" FROM comments c WHERE c.CreationDate = '2010-07-19 19:16:14.0' AND c.UserId IS NOT NULL ;
 SELECT COUNT(*) FROM posts WHERE Score = 10; 
 SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (     SELECT MAX(Reputation)     FROM users ) 
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT Name FROM badges WHERE UserDisplayName = 'Pierre'
SELECT Date FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Location = 'Rochester, NY')
SELECT CAST(SUM(CASE WHEN badges.Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) / COUNT(UserId) * 100 AS 'Percentage of Teachers' FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Teacher'; 
SELECT CAST(SUM(CASE WHEN badges.Name = 'Organizer' AND users.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(UserId) AS 'Percentage of Teenagers' FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Organizer'; 
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56.0' 
SELECT c.Text AS "Detailed Content" FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:37:33' AND p.CreaionDate = '2010-07-19 19:37:33.000'
SELECT u.Age  FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' AND b.Name = 'Teacher';
SELECT COUNT(*)  FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65; 
SELECT COUNT(*) AS view_count FROM users JOIN badges ON users.Id = badges.UserId WHERE badges.Date = '2010-07-19 19:39:08.0'
SELECT Name FROM badges WHERE UserId IN (SELECT UserId FROM users ORDER BY Reputation ASC LIMIT 1)
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Sharpie')
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Age > 65 AND b.Name = 'Supporter';
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York';
SELECT COUNT(*) as VotesIn2010 FROM votes WHERE YEAR(CreationDate) = 2010; 
 SELECT COUNT(*) AS 'Number of Adult Users' FROM users WHERE Age BETWEEN 19 AND 65; 
 SELECT u.DisplayName, MAX(u.Views) AS HighestViews FROM users u GROUP BY u.DisplayName ORDER BY HighestViews DESC; 
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS REAL) AS vote_ratio FROM votes 
 SELECT Tags.TagName FROM tags INNER JOIN users ON tags.OwnerUserId = users.Id WHERE users.DisplayName = 'John Stauffer' 
SELECT COUNT(*) AS PostsCreatedByDaniel FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Daniel Vassallo'; 
SELECT COUNT(*) as votes_made_by_Harlan FROM votes WHERE UserId IN (     SELECT Id     FROM users     WHERE DisplayName = 'Harlan' ) 
SELECT p.Id AS PostID FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' AND p.AnswerCount = (     SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = u.Id ) 
SELECT p.Id, p.Title, MAX(p.ViewCount) AS max_view_count FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p.Id, p.Title 
 SELECT COUNT(*) AS "Posts With More Than 4 Votes" FROM posts WHERE PostId > 4 AND OwnerDisplayName = 'Matt Parker' 
SELECT COUNT(*) FROM comments WHERE Score < 60 AND UserDisplayName = 'Neil McGuigan' AND PostId IN(SELECT Id FROM posts WHERE OwnerUserId = [Neil McGuigan's UserId])
SELECT t.TagName FROM tags t LEFT JOIN postTags pt ON t.Id = pt.TagId LEFT JOIN posts p ON pt.PostId = p.Id WHERE p.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Mark Meckes') AND pt.Comment IS NULL; 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN TagName = 'R language' THEN 1 ELSE 0 END) AS REAL) / COUNT(PostId WHERE DisplayName = 'Community') * 100 AS percentage FROM posts WHERE DisplayName = 'Community' AND TagName IS NOT NULL;
SELECT SUM(CASE WHEN `OwnerDisplayName` = 'Mornington' THEN `ViewCount` ELSE 0 END) - SUM(CASE WHEN `DisplayName` = 'Amos' THEN `ViewCount` ELSE 0 END) AS view_count_difference FROM posts; 
 SELECT COUNT(DISTINCT UserId) AS UsersReceivedCommentatorBadgeIn2014 FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014; 
SELECT COUNT(*) AS PostsCreated FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'; 
 SELECT u.DisplayName, u.Age FROM users u JOIN (     SELECT UserId, MAX(Views) AS max_views     FROM posts     GROUP BY UserId ) pv ON u.Id = pv.UserId 
SELECT p.LastEditDate, pu.DisplayName AS LastEditorUserId FROM posts p JOIN users pu ON p.LastEditorUserId = pu.Id WHERE p.Title = 'Detecting a given face in a database of facial images'; 
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;
SELECT p.Title, c.UserId, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE c.Score > 60; 
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011;
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150;
SELECT     ph.Id AS PostHistoryId,     COUNT(*) AS HistoryCount,     MAX(ph.CreationDate) AS LastEditDate FROM     postHistory ph JOIN     posts p ON ph.PostId = p.Id WHERE     p.Title = 'What is the best introductory Bayesian statistics textbook' GROUP BY     ph.Id 
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers'
SELECT p.Title FROM posts p LEFT JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId IS NOT NULL   AND (     -- Assuming "value over time" could be inferred from "Monitoring" or "TimeSeries"     p.Title LIKE '%Monitoring%'     OR p.Title LIKE '%TimeSeries%'     OR EXISTS (       SELECT 1       FROM tags t       WHERE t.TagName = 'value-over-time'         AND t.ExcerptPostId = p.Id     )   ); 
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreationDate) = 2013 OR YEAR(b.Date) = 2013; 
SELECT u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts) 
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.OwnerUserId = p.OwnerUserId JOIN tags t ON p.ExcerptPostId = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing'; 
SELECT p.Title AS 'Related Post Titles', pl.LinkTypeId AS 'Link Type IDs' FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?' 
 SELECT p.OwnerDisplayName AS ParentDisplayName, p.Score AS HighestScore FROM posts p WHERE p.ParentId IS NOT NULL AND p.Score = (     SELECT MAX(score)     FROM posts     WHERE ParentId = p.Id ) 
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (     SELECT MAX(BountyAmount)     FROM votes     WHERE VoteTypeId = 8 ) 
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);
SELECT u.Age FROM users u JOIN (     SELECT UserId, MAX(Reputation) AS max_rep     FROM users     GROUP BY UserId ) as max_reps ON u.Id = max_reps.UserId ORDER BY max_reps.max_rep DESC LIMIT 1; 
SELECT COUNT(*) AS posts_with_bounty_50_in_2011 FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50; 
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);
 SELECT p.Score FROM posts p JOIN tags t ON p.TagName = t.TagName WHERE t.Count = (SELECT MAX(Count) FROM tags) 
SELECT CAST(AVG(DIVIDE(SUM(CASE WHEN YEAR(CreationDate) = 2010 AND AnswerCount <= 2 THEN 1 END), 12)) AS REAL) AS avg_monthly_links FROM postLinks WHERE YEAR(CreationDate) = 2010 
SELECT p.Id AS MostValuablePostId FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 GROUP BY p.Id ORDER BY MAX(v.FavoriteCount) DESC LIMIT 1; 
SELECT Title FROM posts WHERE Id IN(SELECT PostId FROM postLinks MIN(CreationDate))
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName HAVING COUNT(b.Name) = (     SELECT MAX(count)     FROM (         SELECT COUNT(*) AS count         FROM badges     ) AS badge_counts )
SELECT MIN(CreationDate) FROM votes JOIN posts ON votes.PostId = posts.Id WHERE posts.OwnerDisplayName = 'chl' AND votes.VoteTypeId = (     SELECT MIN(VoteTypeId)     FROM votes     WHERE PostId IN (         SELECT PostId         FROM votes         WHERE UserId IN (             SELECT Id             FROM users             WHERE DisplayName = 'chl'         )     ) ) 
 SELECT MIN(CreationDate) AS FirstPostDate FROM posts WHERE OwnerUserId IN (     SELECT MIN(Id) AS YoungestUserId     FROM users     GROUP BY UserId ) 
SELECT User.DisplayName FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Autobiographer' AND DATE(badges.Date) = MIN(DATE(badges.Date)) GROUP BY users.Id, users.DisplayName LIMIT 1;
SELECT COUNT(User.Id) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4; 
 SELECT AVG(PostId) AS AveragePostsVoted FROM votes JOIN users ON votes.UserId = users.Id WHERE users.Age = (SELECT MAX(Age) FROM users) 
SELECT u.DisplayName AS DisplayName, MAX(u.Reputation) AS HighestReputation FROM users u GROUP BY u.DisplayName ORDER BY HighestReputation DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;
SELECT u.DisplayName FROM users u WHERE u.Age BETWEEN 19 AND 65; 
 SELECT COUNT(*) as PostsCount FROM posts WHERE OwnerDisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010; 
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' AND p.ViewCount = (     SELECT MAX(ViewCount)     FROM posts     WHERE OwnerUserId = u.Id ) 
SELECT p.Id, p.Title AS 'Post Title' FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts) AND p.OwnerUserId IN (     SELECT u.Id FROM users u     WHERE u.DisplayName IS NOT NULL )
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'Stephen Turner'
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE YEAR(p.CreationDate) = 2011 AND p.ViewCount > 20000; 
SELECT p.Id, u.DisplayName AS OwnerDisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 AND p.FavoriteCount = (     SELECT MAX(FavoriteCount)     FROM posts     WHERE YEAR(CreationDate) = 2010 )
SELECT CAST(SUM(CASE WHEN CreationDate = '2011' AND Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) / COUNT(Id) * 100 AS 'Percentage' FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE CreationDate = '2011'; 
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) AS 'Percentage of Teenage Users' FROM users WHERE Age BETWEEN 13 AND 18; 
SELECT p.Title AS "Post Title", u.DisplayName AS "Last Poster Display Name", p.ViewCount AS "Total Views" FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets' AND p.LastEditorUserId IS NULL;
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT MAX(Score) FROM posts)
SELECT COUNT(*) AS NumPosts FROM posts WHERE ViewCount > 35000 AND CommentCount = 0; 
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.LastEditorUserId = p.LastEditorUserId WHERE p.Id = 183 AND u.LastEditDate = (     SELECT MAX(LastEditDate)     FROM posts     WHERE Id = 183 )
SELECT b.Name AS LatestBadge  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Emmett'  AND b.Date = (SELECT MAX(Date) FROM badges WHERE UserId = u.Id)
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
 SELECT DATEDIFF(CreationDate, stats.badges.Date) AS TimeToBadge FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Zolomon' AND b.DisplayName = 'Zolomon' 
SELECT COUNT(*) AS Posts, COUNT(*) AS Comments FROM (   SELECT p.Id, c.Id, COUNT(c.Id) AS CommentCount   FROM posts p   LEFT JOIN comments c ON p.Id = c.PostId   INNER JOIN users u ON p.OwnerUserId = u.Id   GROUP BY p.Id, u.Id   HAVING u.CreationDate = (     SELECT MAX(CreationDate)     FROM users   ) ) AS latest_account_posts_comments 
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' AND c.CreationDate = (     SELECT MAX(CreationDate)     FROM comments c2     WHERE c2.PostId = p.Id )
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol';
SELECT COUNT(*)  FROM posts p JOIN tags t ON p.TagId = t.Id WHERE t.TagName = 'careers'; 
SELECT u.Reputation, u.Views FROM users u JOIN users u2 ON u.DisplayName = 'Jarrod Dixon' WHERE u2.Id = u.Id;
SELECT COUNT(*) AS CommentCount, COUNT(c.Id) AS AnswerCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Clustering 1D data'; 
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'; 
SELECT COUNT(*) AS PostsWithBountyOver30 FROM votes WHERE BountyAmount >= 30 AND PostId IN (     SELECT Id FROM posts ) 
WITH stats_posts AS (   SELECT p.Id, p.Score, u.Reputation   FROM posts p   JOIN users u ON p.OwnerUserId = u.Id   GROUP BY p.Id, p.Score, u.Reputation   HAVING p.Score > 50 AND u.Reputation = (     SELECT MAX(Reputation)     FROM users   ) ), most_influential_posts AS (   SELECT Id, COUNT(*) AS count   FROM stats_posts   GROUP BY Id   ORDER BY count DESC   LIMIT 1 ) SELECT CAST(SUM(count) AS REAL) * 100 / COUNT(*) AS percentage FROM most_influential_posts; 
SELECT COUNT(*) FROM posts WHERE Score < 20; 
 SELECT COUNT(*) AS count FROM tags WHERE Id < 15 AND Count <= 20; 
SELECT T2.Id AS ExcerptPostId, T3.Id AS WikiPostId FROM tags T1 JOIN postTags PT ON T1.Id = PT.TagId JOIN posts T2 ON PT.PostId = T2.Id JOIN tags T3 ON T2.TagName = 'sample' AND T3.Id = T1.WikiPostId;
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)' 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How can I adapt ANOVA for binary data?'; 
 SELECT c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount BETWEEN 100 AND 150 AND p.Score = (     SELECT MAX(s.Score)     FROM comments s     WHERE s.PostId = p.Id ) 
SELECT CreationDate, Age FROM users JOIN comments ON users.Id = comments.UserId WHERE Text LIKE '%http://%' 
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;
SELECT COUNT(*) AS CommentWithZeroScore FROM comments WHERE PostId IN (     SELECT PostId     FROM posts     WHERE CommentCount = 1 ) AND Score = 0; 
SELECT COUNT(DISTINCT users.Age) AS TotalUsersAges40 FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40; 
SELECT p.Id AS PostId, c.Text AS Comment FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'
SELECT u.Id, u.UpVotes FROM users u JOIN votes v ON u.Id = v.UserId JOIN comments c ON v.PostId = c.PostId WHERE c.Text = 'R is also lazy evaluated'; 
SELECT c.Id, c.Text, c.CreationDate, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' 
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND c.DownVotes = 0; 
 SELECT CAST(SUM(CASE WHEN Score BETWEEN 5 AND 10 AND UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(UserId WHERE Score BETWEEN 5 AND 10) * 100 AS percentage FROM comments WHERE Score BETWEEN 5 AND 10; 
SELECT power_name  FROM superpower  JOIN hero_power ON superpower.id = hero_power.power_id  WHERE superhero_name = '3-D Man'; 
SELECT COUNT(*) AS count_of_superheroes FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength'; 
SELECT COUNT(*) FROM superhero WHERE power_name = 'Super Strength' AND height_cm > 200;
SELECT DISTINCT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.superhero_id JOIN superpower sp ON hp.power_id = sp.id GROUP BY s.full_name HAVING COUNT(sp.power_name) > 15; 
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'; 
SELECT colour.colour FROM superhero s JOIN colour ON s.skin_colour_id = colour.id WHERE s.superhero_name = 'Apocalypse';
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') AND power_name = 'Agility';
SELECT DISTINCT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN colour ON superhero.eye_colour_id = colour.id JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE colour.colour = 'Blue' AND colour.colour = 'Blond' AND superpower.power_name = 'Agility'; 
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');
SELECT s.full_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND s.height_cm = (     SELECT MAX(height_cm) FROM superhero WHERE publisher_id = p.id ); 
SELECT publisher.publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name = 'Sauron';
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE publisher_name = 'Marvel Comics' AND colour.colour = 'Blue'; 
SELECT AVG(height_cm) AS avg_height FROM superhero WHERE publisher_id IN (     SELECT id     FROM publisher     WHERE publisher_name = 'Marvel Comics' ) 
SELECT CAST(SUM(CASE WHEN publisher_name = 'Marvel Comics' AND power_name = 'Super Strength' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage of Super Strength' FROM superhero WHERE publisher_name = 'Marvel Comics'; 
 SELECT COUNT(*) AS num_superheroes FROM superhero WHERE publisher_id IN (     SELECT id     FROM publisher     WHERE publisher_name = 'DC Comics' ) 
SELECT publisher.publisher_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' GROUP BY publisher.publisher_name ORDER BY MIN(hero_attribute.attribute_value) ASC LIMIT 1; 
SELECT COUNT(*) FROM superhero WHERE publisher_name = 'Marvel Comics' AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold');
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II';
SELECT COUNT(*) FROM superhero WHERE hair_colour_id IN (SELECT id FROM colour WHERE colour = 'Blond');
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' GROUP BY s.superhero_name ORDER BY MIN(ha.attribute_value) ASC LIMIT 1; 
SELECT race_id FROM superhero WHERE superhero_name = 'Copycat';
SELECT COUNT(*) FROM superhero WHERE EXISTS (SELECT * FROM hero_attribute WHERE superhero.id = hero_attribute.hero_id AND attribute_name = 'Durability' AND attribute_value < 50);
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.gender = 'Female' AND a.attribute_name = 'Strength' AND a.attribute_value = 100;
 SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id GROUP BY superhero_name HAVING COUNT(*) = (     SELECT MAX(count)     FROM (         SELECT COUNT(*) AS count         FROM superhero         JOIN hero_power ON superhero.id = hero_power.hero_id         JOIN superpower ON hero_power.power_id = superpower.id     ) AS subquery ) 
SELECT COUNT(*) FROM superhero WHERE race = 'Vampire'; 
SELECT CAST(SUM(alignment = 'Bad') AS REAL) * 100 / COUNT(*) AS percentage, COUNT(*) AS count_marvel FROM superhero WHERE publisher_name = 'Marvel Comics' AND alignment IN ('Bad', 'Neutral') 
SELECT SUM(CASE WHEN publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM superhero WHERE publisher_id IN (     SELECT id     FROM publisher     WHERE publisher_name IN ('DC Comics', 'Marvel Comics') );
SELECT publisher_id FROM publisher WHERE publisher_name = 'Star Trek';
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute; 
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;
SELECT colour.colour FROM superhero s JOIN colour ON s.eye_colour_id = colour.id WHERE s.id = 75;
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Deathlok'; 
 SELECT AVG(weight_kg) AS average_weight FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female'; 
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5; 
SELECT superhero_name FROM superhero WHERE race = 'Alien'; 
 SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1; 
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56;
SELECT full_name FROM superhero WHERE race = 'Demi-God' LIMIT 5;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 'Bad';
SELECT race_id FROM superhero WHERE weight_kg = 169;
 SELECT hair_colour FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE race = 'human' AND height_cm = 185; 
 SELECT c.colour FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON a.eye_colour_id = c.id WHERE s.weight_kg = (     SELECT MAX(weight_kg)     FROM superhero ) 
SELECT CAST(SUM(CASE WHEN publisher.id = 13 AND height_cm BETWEEN 150 AND 180 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(publisher.id) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.id = 13;
 SELECT s.full_name FROM superhero s JOIN英雄力量hp ON s.id = hp.英雄_id JOIN英雄属性ha ON s.id = ha.英雄_id JOIN英雄 weight_avg ON ha.英雄_id = weight_avg.英雄_id WHERE s.gender = 'Male' AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero) 
SELECT superpower.power_name, COUNT(*) AS power_count FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id GROUP BY superpower.power_name ORDER BY power_count DESC LIMIT 1; 
SELECT attribute_value FROM hero_attribute WHERE superhero_name = 'Abomination' AND attribute_id IN (SELECT attribute_id FROM attribute WHERE attribute_name = 'Intelligence');
SELECT power_name FROM hero_power WHERE hero_id = 1;
 SELECT COUNT(*) AS num_heroes_with_stealth_power FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'stealth'; 
SELECT h.full_name FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'strength' GROUP BY h.id, h.full_name ORDER BY MAX(ha.attribute_value) DESC LIMIT 1; 
SELECT AVG(hero_id) AS average_no_skin_colour FROM superhero WHERE skin_colour_id = (SELECT id FROM colour WHERE colour = '1'); 
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute.attribute_name = 'durability' AND publisher.publisher_name = 'Dark Horse Comics' GROUP BY superhero.superhero_name ORDER BY MAX(hero_attribute.attribute_value) DESC LIMIT 1; 
SELECT colour.colour FROM colour JOIN superhero_hair_colour ON colour.id = superhero_hair_colour.eye_colour_id JOIN superhero ON superhero.id = superhero_hair_colour.superhero_id WHERE superhero.full_name = 'Abraham Sapien';
SELECT superhero_name  FROM superhero  INNER JOIN hero_power ON superhero.id = hero_power.hero_id  INNER JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Flight';
 SELECT eyes.colour, hair.colour, skin.colour FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id JOIN colour AS eyes ON superhero.eye_colour_id = eyes.id JOIN colour AS hair ON superhero.hair_colour_id = hair.id JOIN colour AS skin ON superhero.skin_colour_id = skin.id WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Dark Horse Comics'; 
 SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.skin_colour_id AND s.hair_colour_id = s.skin_colour_id AND EXISTS (     SELECT 1     FROM hero_power hp     WHERE hp.hero_id = s.id     AND hp.power_id IN (         SELECT id         FROM superpower sp         WHERE sp.power_name = 'Same Eyes, Hair and Skin Colour'     ) ); 
SELECT race_id FROM superhero WHERE superhero_name = 'A-Bomb' AND foreign_key(race_id) REFERENCES race(id);
SELECT CAST(SUM(CASE WHEN colour = 'Blue' AND gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN gender = 'Female' THEN 1 END) AS 'Percentage of Blue Female Superheroes' FROM superhero WHERE gender = 'Female'; 
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler' AND superhero_name IS NOT NULL AND race IS NOT NULL;
SELECT gender_id FROM superhero WHERE superhero_name = 'Agent 13';
SELECT DISTINCT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation'; 
SELECT COUNT(*) FROM hero_power WHERE superhero_name = 'Amazo';
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE superhero.full_name = 'Hunter Zolomon';
 SELECT h.height_cm FROM superhero h JOIN colour c ON h.eye_colour_id = c.id WHERE c.colour = 'Amber'; 
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN colour AS black_eye_hair ON superhero.hair_colour_id = black_eye_hair.id WHERE black_eye_hair.colour = 'Black';
SELECT eye_colour.colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Gold';
SELECT full_name FROM superhero WHERE race_id IN (     SELECT id     FROM race     WHERE race = 'Vampire' ) 
SELECT superhero_name FROM superhero WHERE alignment = 'Neutral'; 
 SELECT COUNT(*) AS "Number of Heroes with Highest Strength" FROM hero_attribute WHERE attribute_name = 'Strength' AND attribute_value = (     SELECT MAX(attribute_value)     FROM hero_attribute ha2     WHERE ha2.attribute_id = hero_attribute.attribute_id ) 
SELECT race.race, alignment.alignment FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks';
SELECT CAST(SUM(CASE WHEN gender = 'Female' AND publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percent of Female Heroes Published by Marvel Comics' FROM superhero WHERE publisher_name = 'Marvel Comics'; 
SELECT AVG(weight_kg) FROM superhero WHERE race = 'Alien';
SELECT      (SUM(weight_kg) AS difference)  FROM      superhero  WHERE      full_name = 'Emil Blonsky'      AND weight_kg IS NOT NULL  UNION ALL      SELECT          -SUM(weight_kg) AS difference      FROM          superhero      WHERE          full_name = 'Charles Chandler'          AND weight_kg IS NOT NULL  GROUP BY 1; 
SELECT superhero.superhero_name, AVG(height_cm) AS average_height FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id GROUP BY superhero.superhero_name; 
SELECT sp.power_name AS "Superpower" FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination';
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1; 
SELECT superhero_name  FROM hero_attribute  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute_name = 'Speed'  AND hero_attribute.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_name = 'Speed')  JOIN superhero ON hero_attribute.hero_id = superhero.id;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT attribute.attribute_name, attribute.attribute_value FROM attribute JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = '3-D Man';
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Eye Colour' AND ha.attribute_value = 7 JOIN hero_attribute hha ON s.id = hha.hero_id JOIN attribute ah ON hha.attribute_id = ah.id WHERE ah.attribute_name = 'Hair Colour' AND hha.attribute_value = 9; 
SELECT publisher.publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT CAST(SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS 'Percentage of Superheroes with Blue Eyes' FROM superhero WHERE eye_colour_id = 7;
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS REAL) AS ratio FROM superhero WHERE gender IS NOT NULL;
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);
SELECT power_id FROM hero_power WHERE power_name = 'cryokinesis';
SELECT superhero_name FROM superhero WHERE id = 294;
 SELECT DISTINCT s.superhero_name, s.full_name FROM superhero s LEFT JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Weight' AND attribute_value IN (0, NULL)) OR s.weight_kg IS NULL; 
SELECT colour.colour FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN colour ON hero_attribute.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan';
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.superhero_id IN (SELECT hero_id FROM superhero WHERE full_name = 'Helen Parr');
SELECT race_id FROM superhero WHERE weight_kg = 108 AND height_cm = 188;
SELECT publisher.publisher_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38;
 SELECT race_id, race FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id GROUP BY race_id HAVING MAX(attribute_value) AS max_attribute_value ORDER BY max_attribute_value DESC LIMIT 1; 
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV'; 
SELECT DISTINCT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.superhero_id JOIN superpower sp ON hp.power_id = sp.id JOIN colour c ON hp.eye_colour_id = c.id WHERE c.colour = 'Blue'; 
SELECT AVG(attribute_value) FROM hero_attribute WHERE alignment_id = 3;
 SELECT skin.colour FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN hero_attribute ha ON superhero.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_value = 100; 
SELECT COUNT(*) AS good_female_heroes FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 1 AND gender.id = 2; 
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_value BETWEEN 75 AND 80;
SELECT race.race FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN colour ON superhero.hair_colour_id = colour.id WHERE gender.gender = 'male' AND colour.colour = 'blue';
SELECT CAST(SUM(CASE WHEN alignment.id = 2 AND gender.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(CASE WHEN alignment.id = 2 THEN 1 END) AS 'Percentage of Female Bad Superheroes' FROM alignment INNER JOIN gender ON alignment.alignment_id = gender.alignment_id WHERE alignment.alignment = 'Bad' AND gender.gender = 'Female';
 SELECT      (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 7 AND weight_kg != 0) -      (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 1 AND weight_kg IS NULL) AS difference 
SELECT attribute_value FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Hulk' AND attribute_name = 'Strength')
SELECT power_name FROM superpower JOIN hero_power ON superpower.id = hero_power.power_id WHERE superhero_name = 'Ajax';
 SELECT COUNT(*)  FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN colour c ON s.skin_colour_id = c.id WHERE a.alignment = 'Bad' AND c.colour = 'Green'; 
SELECT COUNT(*) FROM superhero WHERE gender = 'Female' AND publisher_name = 'Marvel Comics';
SELECT superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero_name ASC;
SELECT gender.gender FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Phoenix Force' JOIN gender ON superhero.gender_id = gender.id; 
SELECT superhero_name  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'DC Comics'  AND hero_weight_kg = (SELECT MAX(weight_kg) FROM superhero WHERE publisher.publisher_name = 'DC Comics') AS heaviest_hero;
SELECT AVG(height_cm) FROM superhero WHERE race_id NOT IN (SELECT id FROM race WHERE race_name = 'Human') AND publisher_name = 'Dark Horse Comics';
 SELECT COUNT(*) as fastest_superheroes FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Speed' AND attribute_value = 100; 
SELECT      CASE          WHEN SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) > SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) THEN 'DC Comics'         ELSE 'Marvel Comics'     END AS publisher_with_more_superheroes,     ABS(SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM      superhero  JOIN      publisher ON superhero.publisher_id = publisher.id GROUP BY      publisher.publisher_name; 
SELECT attribute_name FROM hero_attribute WHERE hero_id IN(SELECT id FROM superhero WHERE superhero_name = 'Black Panther') AND attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute WHERE hero_id IN(SELECT id FROM superhero WHERE superhero_name = 'Black Panther')) AND attribute_id IN(SELECT attribute_id FROM attribute);
SELECT colour.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination';
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Height' AND hero_attribute.attribute_value = (SELECT MAX(height_cm) FROM superhero);
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';
SELECT CAST(SUM(CASE WHEN publisher_name = 'George Lucas' AND gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(CASE WHEN publisher_name = 'George Lucas' THEN 1 END) AS 'Percentage of Female Superheroes' FROM superhero WHERE publisher_name = 'George Lucas'; 
SELECT CAST(SUM(alignment = 'Good') AS REAL) * 100.0 / COUNT(publisher_name = 'Marvel Comics') AS percentage FROM superhero WHERE publisher_name = 'Marvel Comics';
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN colour c ON a.attribute_name = 'Eye Colour' AND c.id = ha.eye_colour_id WHERE s.weight_kg < 100 AND c.colour = 'Brown'; 
 SELECT attribute.attribute_value FROM hero_attribute ha JOIN attribute ON ha.attribute_id = attribute.id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Aquababy'; 
SELECT weight_kg, race FROM superhero WHERE id = 40;
SELECT AVG(height_cm) AS average_height FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral') 
SELECT hero_id FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Intelligence';
SELECT colour.colour FROM colour JOIN hero_eye_colour ON colour.id = hero_eye_colour.eye_colour_id WHERE hero_eye_colour.superhero_name = 'Blackwulf';
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN (     SELECT AVG(height_cm) AS avg_height     FROM superhero ) AS avg_height_all WHERE s.height_cm > (avg_height_all.avg_height * 0.8); 
 SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 18 AND r.q1 = (     SELECT MAX(q1)     FROM qualifying     WHERE raceId = 18 ) GROUP BY d.driverRef HAVING COUNT(*) = 5; 
SELECT surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE raceId = (SELECT raceId FROM races WHERE number = 19 AND round = 2) AND MIN(results.q2) = (     SELECT MIN(q2)     FROM races     WHERE number = 19 AND round = 2 ) 
SELECT year FROM races WHERE location = 'Shanghai';
SELECT url FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya');
SELECT circuits.name  FROM circuits  WHERE circuits.country = 'Germany';
SELECT circuits.position FROM circuits JOIN constructors ON circuits.constructorRef = constructors.constructorRef WHERE constructors.name = 'Renault'
 SELECT COUNT(*) as races_count FROM races WHERE year = 2010 AND (country NOT IN ('Asia', 'Europe') AND url IS NOT NULL); 
SELECT name FROM races WHERE circuits.location = 'Spain';
SELECT circuits.lat, circuits.lng  FROM circuits  WHERE circuits.country = 'Australia' AND circuits.name = 'Australian Grand Prix';
SELECT url  FROM races  WHERE circuitId = (SELECT circuitId FROM circuits WHERE circuitRef = 'Sepang International Circuit');
 SELECT time FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE circuitRef = 'sepang') 
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix';
SELECT circuits.country  FROM circuits  JOIN constructorResults ON circuits.circuitId = constructorResults.circuitId  JOIN constructors ON constructorResults.constructorId = constructors.constructorId  WHERE constructorResults.raceId = 24 AND constructorResults.points = 1; 
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna');
SELECT nationality FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE raceId = 355 AND q2 = '0:01:40'; 
SELECT drivers.number FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId JOIN races ON qualifying.raceId = races.raceId WHERE races.raceId = 903 AND qualifying.round = 3 AND time = '00:01:54';
SELECT COUNT(driverId)  FROM drivers WHERE raceId = (SELECT raceId FROM races WHERE year = 2007 AND round = 1 AND name = 'Bahrain Grand Prix') AND time IS NULL; 
SELECT seasons.year AS season_year, seasons.url AS season_url FROM seasons JOIN races ON seasons.year = races.year WHERE races.raceId = 901;
SELECT COUNT(driverId) AS finished_drivers FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE YEAR(date) = 2015 AND MONTH(date) = 11 AND DAY(date) = 29 ) AND time IS NOT NULL; 
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1; 
SELECT drivers.forename, drivers.surname, drivers.url FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE lapTimes.raceId = 161 AND lapTimes.time = '0:01:27';
SELECT nationality FROM drivers WHERE raceId = 933 AND fastestLapSpeed = (     SELECT MAX(fastestLapSpeed) FROM results     WHERE raceId = 933 );
SELECT circuits.location, circuits.lat, circuits.lng  FROM circuits  WHERE circuits.country = 'Malaysia' AND circuits.name = 'Malaysian Grand Prix';
SELECT constructors.constructorRef, constructors.url  FROM constructors  JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  JOIN races ON constructorResults.raceId = races.raceId  WHERE races.raceId = 9 AND constructorResults.points = (SELECT MAX(points) FROM constructorResults WHERE raceId = 9)
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi');
SELECT nationality  FROM drivers  JOIN qualifying ON drivers.driverId = qualifying.driverId  WHERE raceId = 347 AND q2 = '0:01:15';
SELECT drivers.code FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.raceId = 45 AND results.q3 = '0:01:33' 
SELECT results.time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE results.raceId = 743 AND drivers.forename = 'Bruce' AND drivers.surname = 'McLaren'; 
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.name = 'San Marino Grand Prix' AND races.year = 2006 AND results.position = 2; 
SELECT seasons.year FROM seasons JOIN races ON seasons.year = races.year WHERE races.raceId = 901;
SELECT COUNT(driverId) FROM results WHERE YEAR(date) = 2015 AND MONTH(date) = 11 AND DAY(date) = 29 AND status = 'Finished'; 
 SELECT driverId, MAX(dob) AS youngest_dob FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 872 AND results.time IS NOT NULL GROUP BY drivers.driverId ORDER BY youngest_dob ASC LIMIT 1; 
SELECT drivers.forename, drivers.surname FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE races.raceId = 348 AND MIN(lapTimes.time) AS bestLapTime IS NOT NULL 
SELECT nationality FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE raceId = [insert the raceId here] AND results.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results     WHERE raceId = [insert the raceId here] ); 
SELECT CAST(DIVIDE(SUBTRACT(fastestLapSpeed(raceId = 853), fastestLapSpeed(raceId = 854)), fastestLapSpeed(raceId = 853)) * 100 AS REAL) AS percentage_faster FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM results WHERE raceId = 854 AND number = 1 AND position = 1) AND fastestLapSpeed IS NOT NULL;
SELECT      drivers.driverRef,      COUNT(driverId) AS completed_races,      CAST(SUM(CASE WHEN date = '1983-07-16' AND time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(driverId) AS race_completion_rate FROM      drivers JOIN      races ON drivers.driverId = races.driverId WHERE      races.date = '1983-07-16' GROUP BY      drivers.driverRef 
SELECT MIN(year) AS first_singapore_grand_prix_year FROM races WHERE name = 'Singapore Grand Prix'; 
SELECT COUNT(*) AS race_count, races.name FROM races WHERE YEAR(races.year) = 2005 GROUP BY races.name ORDER BY race_count DESC; 
SELECT r.name AS first_race_name,         GROUP_CONCAT(r.name SEPARATOR ', ') AS other_races_in_same_month_year FROM races r WHERE r.year = (SELECT MIN(year) FROM races) AND        r.month = (SELECT MIN(month) FROM races) GROUP BY r.year, r.month 
SELECT circuits.name AS circuit_name, races.date AS race_date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 1999 AND races.round = (     SELECT MAX(round)     FROM races     WHERE year = 1999 ) 
SELECT seasons.year FROM seasons JOIN races ON seasons.year = races.year GROUP BY seasons.year HAVING COUNT(races.round) = (     SELECT MAX(count_rounds)     FROM (         SELECT races.year, COUNT(races.round) AS count_rounds         FROM races         GROUP BY races.year     ) AS race_counts ) 
SELECT races.name FROM races WHERE races.year = 2017 AND NOT EXISTS (     SELECT 1     FROM races AS races_2000     WHERE races_2000.year = 2000 AND races.raceId = races_2000.raceId ) 
SELECT circuits.country, circuits.location  FROM circuits  JOIN races ON circuits.circuitId = races.circuitId  WHERE circuits.country = 'Europe' AND races.year = (SELECT MIN(year) FROM races)  AND races.url LIKE '%European Grand Prix%'  AND races.year >= (SELECT MIN(year) FROM seasons)  AND circuits.country != 'Malaysia';
SELECT MAX(seasons.year) AS last_season FROM seasons JOIN races ON seasons.year = races.year JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Brands Hatch' AND circuits.country = 'United Kingdom'   AND circuits.url = 'http://en.wikipedia.org/wiki/Brands_Hatch'; 
SELECT COUNT(*) FROM seasons WHERE url LIKE '%British Grand Prix%' AND country = 'United Kingdom';
SELECT drivers.driverRef, drivers.forename, drivers.surname, driverStandings.position FROM drivers JOIN driverStandings ON drivers.driverId = driverStandings.driverId WHERE races.year = 2010 AND races.name = 'Singapore Grand Prix' ORDER BY driverStandings.position; 
SELECT d.forename, d.surname, MAX(rs.points) AS most_points FROM drivers d JOIN results rs ON d.driverId = rs.driverId GROUP BY d.driverRef ORDER BY most_points DESC LIMIT 1; 
SELECT drivers.forename, drivers.surname, SUM(results.points) AS total_points FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE races.name = 'Chinese Grand Prix' AND races.year = 2017 GROUP BY drivers.driverId ORDER BY total_points DESC LIMIT 3; 
SELECT drivers.forename, drivers.surname, races.name FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE lapTimes.time = (SELECT MIN(time) FROM lapTimes) 
SELECT AVG(time) AS average_lap_time FROM lapTimes JOIN results ON lapTimes.raceId = results.raceId JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE results.driverId = (SELECT driverId FROM drivers WHERE forename = 'Sebastian' AND surname = 'Vettel' AND nationality = 'Germany' AND year = 2009) AND results.raceId IN (SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND year = 2009);
 SELECT CAST(SUM(CASE WHEN surname = 'Hamilton' AND year >= 2010 AND position > 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(raceId) WHERE surname = 'Hamilton' AND year >= 2010 AS percentage 
SELECT d.forename, d.surname, d.nationality, AVG(r.points) AS avg_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId GROUP BY d.driverId, d.nationality ORDER BY COUNT(ws.wins) DESC LIMIT 1; 
SELECT MAX(dob), name FROM drivers WHERE nationality = 'Japanese' AND YEAR(dob) = 2022 - YEAR(CURDATE()) + 1;
 SELECT circuits.circuitId, circuits.name, circuits.location FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year BETWEEN 1990 AND 2000 GROUP BY circuits.circuitId, circuits.name, circuits.location HAVING COUNT(races.raceId) = 4; 
SELECT circuits.name, circuits.location, races.name AS race_name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'USA' AND races.year = 2006;
SELECT r.name AS race_name, c.circuitName, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE EXTRACT(MONTH FROM r.date) = 9 AND EXTRACT(YEAR FROM r.date) = 2005 
SELECT races.name AS race_name  FROM races  JOIN drivers ON races.driverId = drivers.driverId  WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND races.position < 10;
SELECT COUNT(*) AS wins_in_Sepang FROM results AS r JOIN constructors AS c ON r.constructorId = c.constructorId JOIN drivers AS d ON r.driverId = d.driverId WHERE c.name = 'Michael Schumacher'  AND r.circuitId = (     SELECT circuitId     FROM circuits     WHERE name = 'Sepang International Circuit' ) AND r.points = (     SELECT MAX(points)     FROM results AS r2     WHERE r2.raceId = r.raceId AND r2.constructorId = r.constructorId ) 
SELECT races.name AS race_name, races.year AS race_year FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' AND results.fastestLap = MIN(results(milliseconds)) 
SELECT AVG(points) AS average_points FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Eddie' AND surname = 'Irvine')   AND year = 2000; 
SELECT MIN(races.year) AS first_race_year, results.points FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' GROUP BY results.raceId LIMIT 1; 
SELECT circuits.country, races.name, races.date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2017 ORDER BY races.date; 
SELECT races.name, races.year, circuits.location FROM races JOIN circuits ON races.circuitId = circuits.circuitId GROUP BY races.name, races.year, circuits.location ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN country = 'Germany' AND name = 'European Grand Prix' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage of European Grand Prix in Germany' FROM races WHERE name = 'European Grand Prix'; 
SELECT lat, lng FROM circuits WHERE circuitRef = 'Silverstone Circuit';
SELECT circuitName, MAX(lat) AS maxLatitude  FROM circuits  WHERE circuitName IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')  GROUP BY circuitName  ORDER BY maxLatitude DESC  LIMIT 1;
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit';
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits);
SELECT COUNT(*) AS non_code_drivers FROM drivers WHERE code IS NULL; 
SELECT nationality FROM drivers WHERE dob = (     SELECT MIN(dob)     FROM drivers ) 
SELECT surname  FROM drivers  WHERE nationality = 'italian'; 
SELECT url FROM circuits WHERE name = 'Anthony Davidson';
SELECT driverRef FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis';
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.year = 2009 AND races.url LIKE '%Spanish Grand Prix%' AND races.round = 1 -- Assuming the Spanish Grand Prix is in the first round AND races.language = 'es' -- Assuming the race's URL indicates the language, which for Spain would be 'es' (Spanish) 
SELECT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit') AND url IS NOT NULL;
SELECT r.name, r.date, r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit' AND r.url IS NOT NULL;
SELECT time FROM races WHERE circuitId = (SELECT circuitId                   FROM circuits                   WHERE name = 'Abu Dhabi Circuit'                   AND year BETWEEN 2010 AND 2019)   AND year BETWEEN 2010 AND 2019; 
 SELECT COUNT(*) AS race_count FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'Italy'; 
SELECT date FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya') AND url IS NOT NULL;
SELECT circuits.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.country = 'Spain' AND races.year = 2009 AND circuits.location = 'Circuit de Barcelona-Catalunya';
SELECT MIN(fastestLapTime) FROM results WHERE driverId = (     SELECT driverId     FROM drivers     WHERE forename = 'Lewis' AND surname = 'Hamilton' ) 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE s.status = 'fastest_lap' 
SELECT driverRef FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)   AND position = 1; 
SELECT races.name FROM races JOIN drivers ON races.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT races.raceId, races.name AS race_name FROM races JOIN driverStandings ON races.raceId = driverStandings.raceId JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' GROUP BY races.raceId, races.name MIN_RANK() OVER (ORDER BY driverStandings.position) AS rank_highest ORDER BY rank_highest ASC LIMIT 1;
 SELECT MAX(fastestLapSpeed) AS fastest_lap_speed FROM results WHERE raceId IN (   SELECT raceId   FROM races   WHERE year = 2009 AND location = 'Circuit de Barcelona-Catalunya' ) 
SELECT DISTINCT races.year FROM races JOIN drivers ON races.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT r.positionOrder FROM results r WHERE r.raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' AND round = 1) AND r.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.grid = 4;
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' AND time IS NOT NULL) AND driverId IS NOT NULL;
SELECT * FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' AND nationality = 'Britain' AND year = 2008)   AND raceId IN (     SELECT raceId     FROM races     WHERE year = 2008       AND name = 'Australian Grand Prix'   ); 
SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' AND round = 1) AND position = 2;
SELECT drivers.forename, drivers.surname, circuits.url FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.positionOrder = 1 -- Assuming the champion is always in first position AND results.time LIKE '%:00:00%' -- Filter for a finished time in format 'HH:MM:SS.mmm' 
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'American'  AND races.year = 2008  AND races.name = 'Australian Grand Prix'; 
SELECT COUNT(driverId) as num_participated FROM results WHERE raceId IN (   SELECT raceId   FROM races   WHERE year = 2008 AND location = 'Albert Park' -- Assuming the Australian Grand Prix is held at Albert Park   AND time IS NOT NULL -- Checking if the race was actually completed ) 
SELECT SUM(results.points) AS total_points FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT AVG(FastestLapTime) AS average_fastest_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT CAST(SUM(CASE WHEN time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(*) AS completion_rate FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE year = 2008 AND name = 'Australian Grand Prix' ) 
 SELECT      (CAST(SUBSTR(results.time, 1, 11) AS REAL) -      CAST(SUBSTR(results.fastestLapTime, 1, 11) AS REAL)) *      100 /      COALESCE(CAST(SUBSTR(results.time, 1, 11) AS REAL), 0) AS percentage_faster FROM      results WHERE      results.raceId = (SELECT MAX(raceId) FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')     AND results.driverId = (         SELECT              driverId          FROM              driverStandings          WHERE              raceId = (SELECT MAX(raceId) FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')              AND position = (                 SELECT MAX(position)                  FROM driverStandings                  WHERE raceId = (SELECT MAX(raceId) FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')             )             AND time IS NOT NULL     )     AND results.statusId = (         SELECT MIN(statusId)          FROM status          WHERE status = 'Champion'     ) 
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';
SELECT circuits.lat, circuits.lng  FROM circuits WHERE circuits.country = 'USA'; 
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01';
SELECT AVG(points) AS avg_points FROM constructors WHERE nationality = 'British';
SELECT constructors.constructorRef, SUM(constructorResults.points) AS total_points FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId GROUP BY constructors.constructorRef ORDER BY total_points DESC LIMIT 1; 
SELECT constructors.name FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId WHERE constructorResults.raceId = 291 AND constructorResults.points = 0; 
 SELECT COUNT(*)  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  JOIN races r ON cr.raceId = r.raceId  WHERE c.nationality = 'Japanese' AND cr.points = 0 AND COUNT(r.raceId) = 2; 
SELECT constructors.constructorRef, constructors.name FROM constructors INNER JOIN results ON constructors.constructorId = results.constructorId WHERE results.rank = 1; 
 SELECT COUNT(*) FROM constructors AS c JOIN driverStandings AS ds ON c.constructorId = ds.constructorId WHERE c.nationality = 'French' AND ds.laps > 50; 
SELECT CAST(SUM(CASE WHEN time IS NOT NULL AND year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT driverId) AS race_completion_percentage FROM drivers WHERE nationality = 'Japanese' AND year BETWEEN 2007 AND 2009; 
SELECT year, AVG(TIMESTAMPDIFF(SECOND, 'HH:MM:SS.mmm', time)) AS avg_champion_time FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE results.position = 1 AND time IS NOT NULL GROUP BY year; 
 SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.position = 2 AND drivers.dob > '1975-01-01' 
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'Italian' AND time IS NULL; 
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.fastestLapTime IS NOT NULL ORDER BY lt.time ASC LIMIT 1; 
 SELECT lap FROM lapTimes WHERE raceId IN (   SELECT raceId   FROM results   WHERE year = 2009     AND driverId IN (       SELECT driverId       FROM results       WHERE raceId IN (         SELECT raceId         FROM results         WHERE year = 2009           AND position = (             SELECT MIN(position)             FROM results             WHERE year = 2009           )       )     )     AND status = 'champion'     AND time LIKE '%:%%:%.000' ) ORDER BY time ASC LIMIT 1; 
SELECT AVG(fastestLapSpeed) AS average_speed FROM results WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Spanish Grand Prix'     AND year = 2009 ) 
 SELECT r.name, r.year FROM races r JOIN results r2 ON r.raceId = r2.raceId WHERE r2(milliseconds IS NOT NULL) AND r2(milliseconds = MIN(r2(milliseconds))) 
 SELECT (COUNT(driverId) FILTER (WHERE year(dob) < 1985 AND laps > 50) / COUNT(driverId WHERE year BETWEEN 2000 AND 2005)) * 100 AS 'Percentage Born Before 1985 with Over 50 Lap Numbers' FROM drivers WHERE year(dob) BETWEEN 1976 AND 1984 AND year BETWEEN 2000 AND 2005 
SELECT COUNT(*)  FROM drivers AS d JOIN lapTimes AS lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.time < '02:00.00'; 
SELECT driverCode FROM drivers WHERE nationality = 'America';
SELECT raceId FROM races WHERE year = 2009;
SELECT COUNT(driverId) AS participant_count FROM races WHERE raceId = 18; 
SELECT c.nationality AS state_code_number, COUNT(*) AS num_netherlandic_drivers FROM drivers d JOIN circuits c ON d.nationality = 'Netherlands' OR d.nationality = 'Dutch' WHERE d.dob = (     SELECT MIN(dob)     FROM drivers     WHERE nationality = 'Netherlands' OR nationality = 'Dutch' ) GROUP BY c.nationality ORDER BY MAX(d.dob) DESC LIMIT 3; 
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'Australian' AND YEAR(dob) = 1980; 
SELECT d.forename, d.surname, l.time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' AND l.time = (     SELECT MIN(time)     FROM lapTimes     WHERE driverId = d.driverId     AND raceId IN (         SELECT raceId         FROM races         WHERE country = 'Germany'     ) ) ORDER BY l.time ASC LIMIT 3; 
SELECT driverRef FROM drivers WHERE nationality = 'German' AND year(dob) = (     SELECT MIN(year)     FROM drivers     WHERE nationality = 'German' ) 
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE YEAR(d.dob) = 1971 AND r.fastestLapTime IS NOT NULL ORDER BY r.fastestLapTime DESC LIMIT 1; 
 SELECT d.forename, d.surname, d.dob, d.url, lap.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spain' AND d.dob < '1982-01-01' AND lt.time = (SELECT MAX(time) FROM lapTimes WHERE raceId = lt.raceId AND driverId = d.driverId) ORDER BY d.dob ASC, lt.time DESC LIMIT 10; 
SELECT races.year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE lapTimes.fastestLapTime IS NOT NULL;
SELECT races.year FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId GROUP BY races.year ORDER BY MAX(lapTimes.time) ASC LIMIT 1; 
SELECT driverId FROM lapTimes WHERE raceId = (     SELECT MIN(raceId)     FROM lapTimes     WHERE lap = 1 ) ORDER BY MIN(time) DESC LIMIT 5; 
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND time IS NOT NULL AND statusId = 2;
SELECT circuits.location, circuits.lat, circuits.lng FROM circuits WHERE circuits.country = 'Austria';
SELECT races.year, races.round, MAX(races.raceId) AS max_race_number FROM races JOIN results ON races.raceId = results.raceId WHERE results.time IS NOT NULL GROUP BY races.year, races.round ORDER BY COUNT(results.driverId) DESC LIMIT 1; 
SELECT driverRef, nationality, dob FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId WHERE qualifying.raceId = 23 AND qualifying.q2 IS NOT NULL;
SELECT s.year FROM seasons s JOIN qualifying q ON s.year = q.raceId JOIN drivers d ON q.driverId = d.driverId WHERE d.dob = (     SELECT MIN(dob)     FROM drivers ) AND q.position = 1; -- assuming the first position in qualifying represents the first race 
 SELECT COUNT(*) AS num_disqualified_drivers FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE drivers.nationality = 'American' AND results.statusId = 2; 
SELECT constructors.constructorRef, constructors.url  FROM constructors  JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructors.nationality = 'Italian'  GROUP BY constructors.constructorRef, constructors.url  ORDER BY SUM(constructorResults.points) DESC  LIMIT 1;
SELECT constructors.url  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  GROUP BY constructors.url  HAVING SUM(constructorStandings.wins) = (SELECT MAX(wins) FROM constructorStandings);
SELECT d.forename, d.surname, r.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 GROUP BY d.driverId, d.forename, d.surname ORDER BY MAX(lt.time) DESC LIMIT 1; 
SELECT races.name, races.date, lapTimes.time AS fastest_lap_time_in_milliseconds FROM races JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE lapTimes.lap = 1 AND lapTimes.time = (     SELECT MIN(time)     FROM lapTimes     WHERE lap = 1 ) 
SELECT AVG(fastestLapTime) FROM results WHERE raceId IN (     SELECT raceId FROM races     WHERE year = 2006 AND location = 'United States' ) AND driverId IN (     SELECT driverId FROM driverStandings     WHERE raceId IN (         SELECT raceId FROM races         WHERE year = 2006 AND location = 'United States'     )     AND position < 11 )
SELECT d.forename, d.surname, AVG(p.duration) AS avg_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverRef HAVING avg_duration = (     SELECT MIN(avg_duration)     FROM (         SELECT AVG(duration) AS avg_duration         FROM pitStops         JOIN drivers ON pitStops.driverId = drivers.driverId         WHERE drivers.nationality = 'German'         AND drivers.dob BETWEEN '1980-01-01' AND '1985-12-31'         GROUP BY drivers.driverRef     ) AS subquery ) ORDER BY avg_duration ASC LIMIT 5; 
SELECT d.forename, d.surname, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId IN (     SELECT races.raceId     FROM races     WHERE races.name = 'Canadian Grand Prix' AND races.year = 2008 ) AND r.position = 1; 
SELECT constructorRef, url FROM constructors JOIN constructorStandings cs ON constructors.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE year = 2009 AND race.name = 'Singapore Grand Prix' AND MAX(time) = (     SELECT MAX(time)     FROM lapTimes     WHERE raceId = r.raceId ) AS max_time GROUP BY constructorRef HAVING position = 1;
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers JOIN countries ON drivers.nationality = countries.country WHERE countries.name = 'Austria' AND drivers.dob BETWEEN '1981-01-01' AND '1991-12-31'; 
SELECT drivers.forename + ' ' + drivers.surname AS full_name, circuits.url AS wiki_page_link, drivers.dob FROM drivers JOIN circuits ON drivers.url = circuits.url WHERE drivers.nationality = 'German' AND drivers.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY drivers.dob DESC; 
SELECT location  FROM circuits  WHERE circuitRef = 'Hungaroring'; 
SELECT points, constructors.name, constructors.nationality FROM constructors JOIN constructorResults AS cr ON constructors.constructorId = constructorResults.constructorId JOIN races AS r ON constructorResults.raceId = r.raceId WHERE r.year BETWEEN 1980 AND 2010   AND r.name = 'Monaco Grand Prix' ORDER BY points DESC LIMIT 1; 
SELECT AVG(points) AS average_score FROM results WHERE raceId IN (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE location = 'Istanbul' AND country = 'Turkey')) AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');
SELECT AVG(year) AS average_races FROM races WHERE year >= 2000 AND year <= 2010; 
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT COUNT(*) AS victories FROM driverStandings JOIN results ON driverStandings.driverId = results.driverId WHERE results.position = (SELECT MAX(position) FROM driverStandings WHERE raceId IN (     SELECT raceId FROM races     WHERE raceId IN (         SELECT circuits.circuitId         FROM circuits         JOIN races ON circuits.circuitId = races.circuitId         WHERE races.year = (             SELECT MAX(year) FROM races             WHERE driverStandings.raceId IN (                 SELECT raceId                 FROM driverStandings                 ORDER BY points DESC                 LIMIT 1             )         )     ) )) AND results.points = (     SELECT MIN(points) FROM driverStandings     WHERE raceId IN (         SELECT raceId         FROM driverStandings         ORDER BY points DESC         LIMIT 1     ) );
SELECT r.name FROM races r JOIN results r2 ON r.raceId = r2.raceId JOIN drivers d ON r.driverId = d.driverId WHERE r2.fastestLapTime = (     SELECT MIN(fastestLapTime)     FROM results ) 
SELECT circuits.location + ', ' + circuits.country AS full_location, circuits.name AS latest_race_circuit FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.date = (SELECT MAX(date) FROM races) GROUP BY circuits.location, circuits.country, circuits.name ORDER BY circuits.location + ', ' + circuits.country DESC LIMIT 1;
 SELECT drivers.forename, drivers.surname FROM drivers JOIN qualifying ON drivers.driverId = qualifying.driverId JOIN races ON qualifying.raceId = races.raceId WHERE races.year = 2008 AND races.round = 3 AND qualifying.q3 = (     SELECT MIN(q3)     FROM qualifying     WHERE raceId = races.raceId AND year = 2008 AND round = 3 ) 
 SELECT d.forename + ' ' + d.surname AS fullName, d.nationality, r.name AS firstRaceName FROM drivers d JOIN races r ON d.driverId = (     SELECT driverId     FROM races     WHERE dob = (         SELECT MIN(dob)         FROM drivers     )     AND raceId = (         SELECT MIN(raceId)         FROM races     ) ) ORDER BY d.dob ASC LIMIT 1; 
 SELECT d.driverId, COUNT(*) AS accidents FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceName = 'Canadian Grand Prix' AND r.statusId = 3 GROUP BY d.driverId ORDER BY accidents DESC LIMIT 1; 
 SELECT d.forename, d.surname, COUNT(*) AS wins FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.forename, d.surname; 
SELECT MAX(pitStops.duration) AS longest_pit_stop_time FROM pitStops GROUP BY driverId 
SELECT MAX(time) AS fastest_lap_time FROM lapTimes 
SELECT MAX(pitStops.duration) AS longest_pit_stop_time FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT * FROM pitStops WHERE raceId = (SELECT raceId FROM races                  WHERE year = 2011 AND name = 'Australian Grand Prix'                  AND driverId = (SELECT driverId FROM drivers                                   WHERE forename = 'Lewis' AND surname = 'Hamilton'))   AND lap = (SELECT MIN(lap) FROM pitStops              WHERE raceId = raceId AND driverId = driverId); 
SELECT driverId, raceId, stop, time, duration FROM pitStops WHERE raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix') 
SELECT lapTimes.time AS fastest_lap_time FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND lapTimes.time = (     SELECT MAX(time)     FROM lapTimes     WHERE raceId = lapTimes.raceId ) 
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.time = (     SELECT MIN(time)     FROM lapTimes ) 
SELECT circuits.circuitId, circuits.name, circuits.location, circuits.country FROM circuits JOIN lapTimes ON circuits.circuitId = lapTimes.raceId JOIN results ON lapTimes.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND results.fastestLapTime = (     SELECT MIN(time)     FROM lapTimes     WHERE raceId = lapTimes.raceId ) 
SELECT MIN(time) AS fastest_lap_time FROM lapTimes WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix Circuit'); 
SELECT circuits.circuitId, circuits.name, circuits.lat, circuits.lng, lapTimes.time FROM circuits JOIN lapTimes ON circuits.circuitId = lapTimes.raceId WHERE circuits.country = 'Italy' AND lapTimes.time = (     SELECT MAX(time)     FROM lapTimes     WHERE circuits.circuitId = lapTimes.raceId ) 
SELECT races.name AS race_name  FROM races  JOIN lapTimes ON races.raceId = lapTimes.raceId  WHERE races.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix Circuit')  AND lapTimes.time = (SELECT MAX(time) FROM lapTimes WHERE raceId = races.raceId);
SELECT pitStops.duration FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN laps ON pitStops.driverId = laps.driverId AND pitStops.raceId = laps.raceId JOIN results ON laps.resultId = results.lap WHERE races.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix Circuit') AND results.status = ' fastestLap';
SELECT circuits.lat, circuits.lng  FROM circuits  JOIN lapTimes ON circuits.circuitId = lapTimes.circuitId  WHERE lapTimes.time = '1:29.488'
SELECT AVG(milliseconds) AS average_pit_stop_time FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');
SELECT AVG(milliseconds) AS average_lap_time FROM lapTimes WHERE location = 'Italy';
SELECT `player_api_id` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`)
SELECT `player_name`, `height` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`) AS tallest_player;
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT MIN(`player_api_id`) FROM `Player_Attributes` WHERE `potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`)) AND `preferred_foot` = 'right';
SELECT COUNT(DISTINCT `player_api_id`) FROM `Player_Attributes` WHERE `overall_rating` BETWEEN 60 AND 65 AND `defensive_work_rate` = 'low'; 
SELECT `player_api_id` FROM `Player_Attributes` WHERE `crossing` = (SELECT MAX(`crossing`) FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player_Attributes` GROUP BY `player_api_id` ORDER BY `crossing` DESC LIMIT 5)) ORDER BY `crossing` DESC LIMIT 5;
SELECT `League.name` AS "Most Goals League"  FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` WHERE `Match.season` = '2015/2016'  GROUP BY `League.id` ORDER BY SUM(`Match.home_team_goal` + `Match.away_team_goal`) DESC LIMIT 1;
SELECT `home_team_api_id`, COUNT(*) AS match_loss_count FROM `Match` WHERE season = '2015/2016' AND (home_team_goal - away_team_goal) < 0 GROUP BY `home_team_api_id` ORDER BY match_loss_count MIN;
SELECT `player_name` AS 'Full Name' FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` GROUP BY `player_api_id` ORDER BY `penalties` DESC LIMIT 10; 
SELECT away_team_api_id AS winning_team  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Scotland Premier League'  AND season = '2009/2010'  GROUP BY away_team_api_id  HAVING SUM(ABS(away_team_goal - home_team_goal)) =      (SELECT MAX(sum_diff)       FROM (SELECT                CASE                    WHEN away_team_goal > home_team_goal THEN away_team_goal                    ELSE -home_team_goal                END AS sum_diff,                away_team_api_id             FROM Match             WHERE League.name = 'Scotland Premier League'               AND season = '2009/2010') AS subquery)
 SELECT team_long_name, buildUpPlaySpeed FROM Team_Attributes WHERE team_fifa_api_id IN (     SELECT team_fifa_api_id     FROM Team_Attributes     GROUP BY team_fifa_api_id     ORDER BY buildUpPlaySpeed DESC     LIMIT 4 ) 
SELECT League.name FROM League JOIN Match ON League.id = Match.league_id WHERE MATCH.season = '2015/2016' AND SUM(Match.home_team_goal = Match.away_team_goal) = (     SELECT MAX(sum_home_team_goal)     FROM (         SELECT League.id, SUM(Match.home_team_goal = Match.away_team_goal) as sum_home_team_goal         FROM League         JOIN Match ON League.id = Match.league_id         WHERE MATCH.season = '2015/2016'         GROUP BY League.id     ) AS max_draws_per_league ) 
SELECT TIMESTAMPDIFF(YEAR, birthday, CURRENT_DATE) AS age FROM Player_Attributes WHERE sprint_speed >= 97 AND date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00' AND player_api_id IN (     SELECT player_api_id     FROM Player_Attributes     WHERE player_api_id IN (         SELECT player_api_id         FROM Player_Attributes         WHERE player_fifa_api_id = 218353     ) );
SELECT `League`.name AS 'League Name', COUNT(`Match`.league_id) AS 'Total Matches' FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` GROUP BY `League.id` ORDER BY COUNT(`Match.league_id`) DESC LIMIT 1; 
 SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'; 
SELECT player_api_id  FROM Player_Attributes  WHERE date LIKE '2010%'  AND overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%')  GROUP BY player_api_id  HAVING MAX(overall_rating) = (SELECT MAX(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%');
SELECT `team_fifa_api_id` FROM `Team_Attributes` WHERE buildUpPlaySpeed BETWEEN 51 AND 59;
SELECT team_long_name  FROM Team_Attributes  WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012'  AND (SUM(buildUpPlayPassing) / COUNT(team_long_name)) < (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE year = '2012')
SELECT CAST(SUM(CASE WHEN `preferred_foot` = 'left' AND birth_year BETWEEN 1987 AND 1992 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(`player_fifa_api_id`) AS 'Percentage of Players Preferred Left Foot Born 1987-92' FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` AND `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `preferred_foot` = 'left' AND DATE_FORMAT(`birthday`, '%Y-%m-%d') BETWEEN '1987-01-01' AND '1992-12-31'
SELECT name, SUM(home_team_goal + away_team_goal) AS total_goals FROM League JOIN Match ON League.id = Match.league_id GROUP BY League.name ORDER BY total_goals ASC LIMIT 5;
SELECT CAST(SUM(long_shots) AS REAL) / COUNT(player_fifa_api_id) AS average_long_shots FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag');
SELECT player_name  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id  WHERE height > 180 AND heading_accuracy IS NOT NULL  GROUP BY Player.player_api_id  ORDER BY AVG(heading_accuracy) DESC  LIMIT 10;
SELECT t.team_long_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.buildUpPlayDribblingClass = 'Normal'   AND t.date >= '2014-01-01 00:00:00'   AND t.date <= '2014-01-31 00:00:00' GROUP BY t.team_api_id, t.team_long_name HAVING SUM(ta.chanceCreationPassing) / COUNT(ta.id) > (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00') ORDER BY SUM(ta.chanceCreationPassing) DESC; 
SELECT `League.name` FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` WHERE YEAR(`Match.season`) = 2009 AND YEAR(`Match.season`) = 2010 AND AVG(`Match.home_team_goal`) > AVG(`Match.away_team_goal`)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';
SELECT * FROM `Player_Attributes` p JOIN `Player` player ON p.player_api_id = player.player_api_id WHERE YEAR(p.date) = 1970 AND MONTH(p.date) = 10;
SELECT `attacking_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Franco Zennaro'; 
SELECT buildUpPlayPositioningClass FROM Team_Attributes WHERE team_long_name = 'ADO Den Haag' AND date BETWEEN '2016-02-18 00:00:00' AND '2015-12-31 23:59:59' AND buildUpPlayPositioningClass LIKE '%first_two_thirds%'
SELECT `heading_accuracy` FROM `Player_Attributes` WHERE `date` = '2014-09-18 00:00:00' AND `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francois Affolter') AND `preferred_foot` = 'right';
SELECT overall_rating  FROM Player_Attributes  WHERE date = strftime('%Y-%m-%d', '2011-01-01')  AND player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Gabriel Tamas')  AND player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas');
 SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Scotland Premier League' AND Match.season = '2015-2016'; 
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` ORDER BY `birthday` DESC LIMIT 1) AND `attacking_work_rate` = 'medium';
SELECT * FROM `Player_Attributes` WHERE `potential` = (SELECT MAX(`potential`) FROM `Player_Attributes`);
SELECT COUNT(*) FROM Player_Attributes WHERE weight < 130 AND preferred_foot = 'left';
SELECT T.team_short_name FROM `Team` AS T JOIN `Team_Attributes` AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'; 
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson');
SELECT `birthday` FROM `Player` WHERE `player_api_id` IN(SELECT `player_api_id` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`))
SELECT name FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Netherlands');
 SELECT AVG(home_team_goal) AS average_home_goal FROM Match WHERE country_id IN (     SELECT id     FROM Country     WHERE name = 'Poland' ) AND season = '2010/2011'; 
SELECT p.player_name, AVG(f.finishing) AS avg_finishing_rate FROM Player_Attributes f JOIN Player p ON f.player_api_id = p.player_api_id WHERE p.height = (SELECT MIN(height) FROM Player) GROUP BY p.player_name ORDER BY avg_finishing_rate DESC LIMIT 1; 
SELECT `player_name` FROM `Player` WHERE `height` > 180;
SELECT COUNT(*) FROM `Player` WHERE strftime('%Y', `birthday`) > '1990';
SELECT COUNT(*)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name LIKE 'Adam%' AND p.weight > 170 AND Team_Attributes.ta.buildUpPlaySpeedClass = 'Fast'; 
SELECT DISTINCT Player.player_name  FROM Player_Attributes  JOIN Player ON Player.player_api_id = Player_Attributes.player_api_id  WHERE strftime('%Y', Player_Attributes.date) BETWEEN '2008' AND '2010' AND Player_Attributes.overall_rating > 80;
SELECT potential FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Aaron Doran');
SELECT * FROM Player_Attributes WHERE preferred_foot = 'left'; 
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Fast';
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_short_name = 'CLB';
SELECT Team.short_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team_Attributes.buildUpPlayPassing > 70; 
SELECT AVG(`overall_rating`) AS avg_overall_rating FROM `Player_Attributes` WHERE `date` BETWEEN '2010-01-01' AND '2015-12-31' AND `overall_rating` > 170 
SELECT `player_name`, `height` FROM `Player` WHERE `height` = (SELECT MIN(`height`) FROM `Player`);
SELECT name FROM League WHERE name = 'Italy Serie A';
SELECT team_short_name  FROM Team_Attributes  WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player_Attributes` WHERE `player_api_id` = (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Aaron Doran');
SELECT COUNT(*) as match_count FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10'; 
SELECT team_short_name FROM `Match` WHERE home_team_goal = 10 AND home_team_goal IS NOT NULL;
SELECT `player_name`, `balance`  FROM `Player_Attributes` WHERE `potential` = 61 AND `balance` = (SELECT MAX(`balance`) FROM `Player_Attributes`);
SELECT ABS(AVG(`ball_control`) - AVG(`ball_control`)) AS difference FROM `Player_Attributes` WHERE `player_name` = 'Abdou Diallo' AND `player_name` = 'Aaron Appindangoye';
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';
SELECT player_name  FROM Player  WHERE player_api_id IN (SELECT player_api_id  FROM Player_Attributes  WHERE player_fifa_api_id = (SELECT player_fifa_api_id  FROM Player  WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada'))  AND birthday < (SELECT birthday  FROM Player  WHERE player_name = 'Abdelaziz Barrada') ORDER BY birthday DESC LIMIT 1;
SELECT `player_name` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`);
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';
SELECT Country.name FROM Country JOIN League ON League.country_id = Country.id WHERE League.name = 'Belgium Jupiler League';
SELECT name FROM League WHERE country_id IN(SELECT id FROM Country WHERE name = 'Germany');
SELECT `player_name`, MAX(`overall_rating`) AS strongest_strength FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`) GROUP BY `player_api_id` ;
SELECT COUNT(*)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE strftime('%Y', Player.birthday) < '1986'  AND Player_Attributes.defensive_work_rate = 'high' 
SELECT player_name, MAX(crossing) AS max_crossing FROM Player_Attributes WHERE player_api_id IN (218353, 505942, 505942) -- Assuming their API IDs GROUP BY player_name ORDER BY max_crossing DESC LIMIT 1; 
SELECT heading_accuracy FROM Player_Attributes WHERE player_name = 'Ariel Borysiuk'; 
SELECT COUNT(*)  FROM Player_Attributes  WHERE height > 180 AND volleys > 70; 
SELECT DISTINCT `player_name` FROM `Player_Attributes` WHERE `volleys` > 70 AND `dribbling` > 70;
SELECT COUNT(*)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Belgium' AND season = '2008/2009'; 
SELECT long_passing  FROM Player_Attributes  WHERE date = (SELECT MIN(date) FROM Player_Attributes)  AND player_api_id IN (SELECT player_api_id FROM Player WHERE birthday = (SELECT MIN(birthday) FROM Player))
SELECT COUNT(*) FROM Match WHERE League.name = 'Belgium Jupiler League' AND strftime('%Y', date) = '2009' AND strftime('%m', date) = '04';
SELECT League.name AS "Most Matches League" FROM League JOIN Match ON League.id = Match.league_id WHERE season = '2008/2009' GROUP BY League.id HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT League.id, COUNT(*) AS count FROM League JOIN Match ON League.id = Match.league_id WHERE season = '2008/2009' GROUP BY League.id) AS subquery)
SELECT AVG(`overall_rating`) AS average_overall_rating FROM `Player_Attributes` WHERE strftime('%Y', `birthday`) < '1986'
SELECT ((A.Overall_Rating - P.Overall_Rating) * 100 / P.Overall_Rating) AS Percentage_Higher FROM Player_Attributes A JOIN Player P ON A.player_api_id = P.player_api_id WHERE A.player_name = 'Ariel Borysiuk' AND P.player_name = 'Paulin Puel';
SELECT AVG(`buildUpPlaySpeed`) AS average_build_up_speed FROM `Team_Attributes` WHERE `team_long_name` = 'Heart of Midlothian' AND `team_api_id` IS NOT NULL;
SELECT AVG(T1.overall_rating) AS average_overall_rating FROM Player_Attributes T1 JOIN Player T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino'; 
SELECT SUM(`crossing`) AS total_crossing_score FROM `Player_Attributes` WHERE T2.player_name = 'Aaron Lennox'
SELECT MAX(`chanceCreationPassing`) AS highest_chance_creation_passing_score, `chanceCreationPassingClass` AS classification FROM `Team_Attributes` WHERE `team_long_name` = 'Ajax'
SELECT preferred_foot FROM Player_Attributes WHERE player_name = 'Abdou Diallo'
SELECT MAX(`overall_rating`) FROM `Player_Attributes` WHERE T2.player_name = 'Dorlan Pabon'
 SELECT AVG(away_team_goal)  FROM Match  WHERE away_team_api_id IN (     SELECT team_api_id      FROM Team      WHERE team_long_name = 'Parma' AND country_id IN (         SELECT id          FROM Country          WHERE name = 'Italy'     ) ) AND away_team_api_id IN (     SELECT team_api_id      FROM Team_Attributes      WHERE team_fifa_api_id IN (         SELECT team_fifa_api_id          FROM Team          WHERE team_long_name = 'Parma'     ) AND buildUpPlayPressureClass = 'high' ); 
SELECT `player_name` FROM `Player_Attributes` WHERE `overall_rating` = 77 AND date = '2016-06-23' GROUP BY `player_api_id` ORDER BY `birthday` DESC LIMIT 1;
SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Aaron Mooy' AND date = '2016-02-04 00:00:00';
SELECT potential FROM Player_Attributes WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00';
SELECT `attacking_work_rate`  FROM `Player_Attributes`  WHERE `player_name` = 'Francesco Migliore' AND date = '2015-05-01 00:00:00'
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_name` = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00' AND `player_api_id` IN(SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Kevin Berigaud');
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant')
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22 00:00:00';
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00';
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_fifa_api_id FROM Team WHERE team_long_name = 'FC Lorient' AND date = '2010-02-22')
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00' AND buildUpPlayPassingClass IS NOT NULL;
SELECT buildUpPlayCrossingClass FROM Team_Attributes WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00';
SELECT buildUpPlayDefenceAggressionClass  FROM Team_Attributes  WHERE team_long_name = 'Hannover 96' AND date = '2015-09-10 00:00:00';
SELECT AVG(`overall_rating`) AS average_rating FROM `Player_Attributes` WHERE `player_name` = 'Marko Arnautovic' AND date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'; 
SELECT CAST((player_name = 'Landon Donovan'::TEXT * (overall_rating - player_name = 'Jordan Bowery'::TEXT) / overall_rating) AS REAL) * 100 AS 'Percentage Difference' FROM Player_Attributes WHERE date = '2013-07-12' AND player_name IN ('Landon Donovan', 'Jordan Bowery')
SELECT `player_name`  FROM `Player`  JOIN `Player_Attributes` ON `Player.player_api_id` = `Player_Attributes.player_api_id` WHERE `height` = (SELECT MAX(`height`) FROM `Player_Attributes`) LIMIT 5; 
SELECT `player_api_id` FROM `Player` WHERE `weight` = (SELECT MAX(`weight`) FROM `Player`) LIMIT 10;
SELECT player_name  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE DATE(date) - DATE(player_birthday) > INTERVAL '34' YEAR;
 SELECT COUNT(*) as home_team_goals FROM Match JOIN Home_player_1 ON Match.home_player_1 = Home_player_1.player_api_id WHERE Home_player_1.player_name = 'Aaron Lennon'; 
SELECT SUM(away_team_goal) AS total_away_goals FROM Match WHERE away_player_1 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') OR away_player_11 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_2 IN (SELECT player_api_id FROM Player WHERE player_name = 'Filipe Ferreira') OR away_player_10 IN (SELECT player_api_id FROM Player WHERE player_name = 'Daan Smith') GROUP BY match_api_id;
SELECT SUM(home_team_goal) AS total_goals FROM Match JOIN Player_Attributes ON Match.home_player_1 = Player_Attributes.player_api_id JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE DATE_SUB(CURRENT_TIMESTAMP, INTERVAL '31' DAY) < DATE(Player.birthday) 
SELECT player_name FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 10;
SELECT `player_name` FROM `Player_Attributes` WHERE `potential` = (SELECT MAX(`potential`) FROM `Player_Attributes`)
SELECT DISTINCT `player_name` FROM `Player_Attributes` WHERE `attacking_work_rate` = 'high' AND存在的外键引用`Player_Attributes.player_api_id` IN (SELECT `player_api_id` FROM `Player_Attributes` WHERE `date` IN (SELECT `date` FROM `Player_Attributes` WHERE `preferred_foot` = 'right'))`
SELECT `player_name`  FROM `Player_Attributes`  WHERE `finishing` = 1 AND `date` = (SELECT MAX(`date`) FROM `Player_Attributes` WHERE `finishing` = 1)  AND `player_api_id` IN (SELECT `player_api_id` FROM `Player_Attributes` WHERE `finishing` = 1 AND `date` = MAX(`date`))  AND `age` = (SELECT MAX(`age`) FROM `Player` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player_Attributes` WHERE `finishing` = 1 AND `date` = MAX(`date`)))  ORDER BY `age` DESC LIMIT 1;
SELECT player_name  FROM Player  WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium')
SELECT T1.player_name, C.name AS country FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id JOIN Country AS C ON T2.country_id = C.id WHERE T1.vision > 89; 
SELECT `Country.name` AS Country_Name, AVG(`Player.weight`) AS Average_Weight FROM `Player` JOIN `Country` ON `Player.country_id` = `Country.id` GROUP BY `Country.name` ORDER BY Average_Weight DESC LIMIT 1;
SELECT team_long_name  FROM Team_Attributes  WHERE buildUpPlaySpeedClass = 'Slow';
SELECT team_short_name  FROM Team_Attributes  WHERE chanceCreationPassingClass = 'Safe' AND team_api_id IN (     SELECT team_api_id      FROM Team_Attributes      WHERE match_api_id IN (         SELECT match_api_id          FROM Match          WHERE country_id IN (             SELECT country_id              FROM League              WHERE name = 'Your Specific League Name' -- replace with the actual league name         )          AND season = 'Your Specific Season' -- replace with the actual season         AND stage IS NOT NULL     ) );
SELECT AVG(`height`) AS avg_height FROM `Player` WHERE `country_id` IN (SELECT `id` FROM `Country` WHERE `name` = 'Italy')
SELECT player_name FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.height > 180 ORDER BY player_name ASC;
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%'  AND birthday > '1990-01-01'; 
SELECT SUBSTR(jumping, 1, INSTR(jumping, '跳跃') - 1) AS jumping_score_6,         SUBSTR(jumping, INSTR(jumping, '跳跃') + 5, LENGTH(jumping)) AS jumping_score_23,        jumping_score_6 - jumping_score_23 AS difference FROM Player_Attributes WHERE player_api_id = 6 OR player_api_id = 23;
SELECT `player_api_id` FROM `Player_Attributes` WHERE `potential` = (SELECT MIN(`potential`) FROM `Player_Attributes`) AND `preferred_foot` = 'right' ORDER BY `potential` ASC LIMIT 3;
 SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left'  AND crossing = (SELECT MAX(crossing)                  FROM Player_Attributes                  WHERE player_api_id = Player_Attributes.player_api_id) 
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Player_Attributes)) AS percentage_with_high_strength_stamina FROM Player_Attributes WHERE stamina > 80 AND strength > 80;
SELECT Country.name FROM League INNER JOIN Country ON League.country_id = Country.id WHERE League.name = 'Poland Ekstraklasa'; 
SELECT away_team_goal AS 'Final Score Away Team', home_team_goal AS 'Final Score Home Team' FROM Match WHERE date LIKE '2008-09-24%' AND league_id = (SELECT id FROM League WHERE name = 'Belgian Jupiler League');
SELECT sprint_speed, agility, acceleration  FROM Player_Attributes  WHERE player_name = 'Alexis Blin'
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  WHERE team_long_name = 'KSV Cercle Brugge' AND buildUpPlaySpeed IS NOT NULL;
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016'  AND league_id IN (SELECT id FROM League WHERE name = 'Italian Serie A'); 
SELECT MAX(home_team_goal) AS highest_score  FROM Match  WHERE league_id IN (SELECT id FROM League WHERE name = 'Netherlands Eredivisie') AND home_team_api_id IS NOT NULL;
 SELECT `finishing`, `curve`  FROM `Player_Attributes`  WHERE `weight` = (SELECT MAX(`weight`) FROM `Player_Attributes`) 
SELECT `League.name` AS "Most Games League" FROM `League` JOIN `Match` ON `League.id` = `Match.league_id` WHERE `Match.season` = '2015/2016' GROUP BY `League.name` ORDER BY COUNT(`Match.id`) DESC LIMIT 1;
 SELECT `away_team_long_name`  FROM `Match`  WHERE `away_team_goal` = (SELECT MAX(`away_team_goal`)                           FROM `Match`) 
SELECT `player_name` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`) AND `player_api_id` IN(SELECT `player_api_id` FROM `Player_Attributes` WHERE `player_fifa_api_id` = 218353) LIMIT 1;
SELECT (COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END) / COUNT(id)) * 100 AS 'Percentage of Players Under 180 cm with Strength > 70' FROM Player_Attributes;
 SELECT      CASE          WHEN SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) > SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END) THEN 'In-patient'         ELSE 'Outpatient'     END AS Admission_Type,     ((SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)) / SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END)) * 100 AS Deviation_Pct FROM      Patient GROUP BY      Admission_Type; 
SELECT CAST(SUM(CASE WHEN `SEX` = 'F' AND YEAR(`Birthday`) > '1930' THEN 1 ELSE 0 END) AS REAL) / COUNT(`ID`) * 100 AS 'Percentage of Female Patients Born After 1930' FROM Patient;
 SELECT      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31') AS InpatientPercentage FROM      Patient WHERE      Admission = '+'; 
SELECT CAST(SUM(CASE WHEN Diagnosis = 'SLE' AND Admission = '+' THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN Diagnosis = 'SLE' AND Admission = '-' THEN 1 ELSE 0 END) AS REAL) FROM Examination;
SELECT Diagnosis FROM Examination WHERE ID = 30609; SELECT Date FROM Laboratory WHERE ID IN (SELECT ID FROM Examination WHERE ID = 30609);
SELECT SEX, Birthday FROM Patient WHERE ID = 163109; SELECT Examination.Date, Symptoms FROM Examination WHERE ID = 163109;
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.LDH > '500'; 
SELECT P.ID, P.Birthday - INTERVAL 'YEAR' * EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+'
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 2;
 SELECT P.ID, P.Description FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(L.Date) = '1937' AND L.`T-CHO` >= '250'; 
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.ALB < 3.5;
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' AND T2.TP < '6.0' OR T2.TP > '8.5' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T2.TP IS NOT NULL;
SELECT AVG(`aCL IgG`) FROM Examination WHERE Admission = '+' AND SUBSTR(YEAR(CURRENT_TIMESTAMP), 1, 4) - SUBSTR(Birthday, 1, 4) >= '50';
 SELECT COUNT(*) AS num_followed_females FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-'; 
SELECT TIMESTAMPDIFF(YEAR, `First Date`, Birthday) AS Age FROM Patient WHERE Admission IS NOT NULL AND `First Date` IS NOT NULL ORDER BY Age MIN();
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Thrombosis = '1' AND p.SEX = 'F' AND e.Examination_Date = '1997-05-27'; 
SELECT DATEDIFF(YEAR, MIN(Birthday), MAX(Birthday)) AS AgeGap FROM Patient WHERE tg >= 200;
 SELECT Symptoms, Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = (     SELECT MIN(Birthday)     FROM Patient ) 
SELECT CAST(AVG(Laboratory.ID) AS INT) AS MonthlyTests, MONTH(Laboratory.Date) AS Month FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.Date BETWEEN '1998-01-01' AND '1998-12-31' AND Patient.SEX = 'M' GROUP BY MONTH(Laboratory.Date)
SELECT min(Date) AS oldest_lab_date, MIN(year(Birthday)) - year(`First Date`) AS arrival_age FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Diagnosis = 'SJS' GROUP BY Patient.ID ORDER BY oldest_lab_date ASC LIMIT 1;
SELECT CAST(SUM(CASE WHEN SEX = 'M' AND UA <= '8.0' THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN SEX = 'F' AND UA <= '6.5' THEN 1 ELSE 0 END) AS REAL) FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.UA <='8.0' OR (Laboratory.UA <='6.5' AND SEX = 'F')
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE SUBSTR(YEAR(e.ExaminationDate) - YEAR(p.FirstDate), 1, 4) >= 1;
SELECT COUNT(*) FROM Examination WHERE YEAR(Examination.Date) BETWEEN 1990 AND 1993 AND EXTRACT(YEAR FROM Birthday) < 18;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`T-BIL` > '2.0'
SELECT Diagnosis, COUNT(Diagnosis) AS Common_Illness FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY Common_Illness DESC LIMIT 1;
SELECT AVG(T2.Birthday - YEAR('1991')) AS Average_Age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE MONTH(T2.Examination_Date) BETWEEN 10 AND 10 AND YEAR(T2.Examination_Date) = 1991;
SELECT EX.Examination.Date - EX.Patient.Birthday AS Age, EX.Diagnosis FROM Examination EX JOIN Patient PX ON EX.ID = PX.ID WHERE EX.HGB = (SELECT MAX(HGB) FROM Examination) GROUP BY EX.ID, EX.Diagnosis;
SELECT `ANA` FROM Examination WHERE `Patient.ID` = 3605340 AND `Examination.Date` = '1996-12-02';
SELECT CASE  WHEN T3.T_CHO <= 250 THEN 'Normal' ELSE 'Not Normal' END AS Total_Cholesterol_Status FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON E.ID = L.ID AND L.Date = '1995-09-04' WHERE P.ID = 2927464 AND L.T_CHO IS NOT NULL AND T3.T_CHO IS NOT NULL AND L.T_CHO < 250;
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' AND ID IN(SELECT ID FROM Examination WHERE Diagnosis = 'AORTITIS') LIMIT 1;
SELECT aCL.IgM FROM Examination AS e WHERE e.Diagnosis = 'SLE' AND e.Description = '1994-02-19' AND e.aCL.IgM IS NOT NULL AND e.Date = '1993-11-12'
SELECT CASE      WHEN SEX = 'M' THEN 'Man'     ELSE 'Women' END AS Gender FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Date = '1992-06-12' AND GPT = 9;
SELECT CAST(SUBTRACT('1992', year(Birthday)) AS INT) FROM Patient WHERE ID IN (SELECT Patient.ID FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE UA = '8.4' AND Date = '1991-10-21')
SELECT COUNT(Laboratory.ID) AS TotalTests FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.First_Date = '1991-06-13' AND Patient.Diagnosis = 'SJS' AND YEAR(Laboratory.Date) = 1995;
SELECT Diagnosis FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE `Examination Date` = '1997-01-27' AND Diagnosis = 'SLE') AND `First Date` IS NOT NULL;
SELECT Symptoms FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday = '1959-03-01' AND Examination.Examination_Date = '1993-09-27'; 
SELECT ((SUM(CASE WHEN Birthday = '1959-02-18' AND Date LIKE '1981-11-%' THEN `T-CHO` END) - SUM(CASE WHEN Birthday = '1959-02-18' AND Date LIKE '1981-12-%' THEN `T-CHO` END)) / COUNT(*)) AS decrease_rate FROM Laboratory WHERE Date BETWEEN '1981-11-01' AND '1981-12-31' AND ID IN(SELECT ID FROM Patient WHERE Birthday = '1959-02-18') AND `T-CHO` IS NOT NULL;
SELECT P.ID FROM Patient P INNER JOIN Examination E ON P.ID = E.foreign_key (ID) WHERE P.Diagnosis = 'Behcet' AND YEAR(E.Description) BETWEEN '1997-01-01' AND '1997-12-31'
SELECT P.ID FROM Patient P INNER JOIN Examination E ON P.ID = E.ID WHERE E.Date BETWEEN '1987-07-06' AND '1996-01-31' AND E.GPT > 30 AND E.ALB < 4;
 SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F' AND YEAR(P.Birthday) = 1964 AND E.Admision = '+' GROUP BY P.ID; 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2 AND e.ANA = 'S' AND e.aCL IgM > (AVG(e.aCL IgM) * 1.2)
SELECT CAST(SUM(CASE WHEN `U-PRO` > 0 AND `U-PRO` < 30 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage' FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.UA <= 6.5;
SELECT CAST(SUM(CASE WHEN SEX = 'M' AND YEAR(`First Date`) = '1981' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(YEAR(`First Date`) = '1981') AS 'Percentage of Male Patients with BEHCET' FROM Patient WHERE Diagnosis = 'BEHCET'
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID AND L.Date LIKE '1991-10%' WHERE L.T_BIL < 2.0 AND P.Admission = '-'
SELECT COUNT(*) FROM Examination WHERE Diagnosis NOT LIKE 'P' AND `ANA Pattern` = 'p' AND SEX = 'F' AND YEAR(Birthday) BETWEEN 1980 AND 1989;
SELECT SEX FROM Patient WHERE Diagnosis = 'PSS' AND EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID     AND CRE = 1     AND CRE > 2     AND LDH = 123 );
SELECT AVG(ALB) AS avg_albumin FROM Examination JOIN Patient ON Examination.ID = Patient.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE SEX = 'F' AND PLT > 400 AND Diagnosis = 'SLE'
SELECT MAX(Symptoms) AS MostCommonSign FROM Examination WHERE Diagnosis = 'SLE'
SELECT MIN(`Description`) AS First_Documentation_Date, Diagnosis FROM Patient WHERE ID = 48473;
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis LIKE '%APS%'
 SELECT COUNT(P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE YEAR(E.Examination Date) = '1997' AND E.TP > 6 AND E.TP < 8.5 
 SELECT CAST(SUM(CASE WHEN Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) * 100 AS Proportion FROM Examination WHERE Diagnosis LIKE '%SLE%' 
SELECT CAST(SUM(CASE WHEN YEAR(Birthday) = '1980' AND Diagnosis = 'RA' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Patient WHERE SEX = 'F'
 SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND e.Examination_Date BETWEEN '1995-01-01' AND '1997-12-31'  AND e.Diagnosis = 'BEHCET'  AND p.Admission = '-'; 
 SELECT COUNT(P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F' AND E.WBC < 3.5; 
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM Examination WHERE Patient.ID = 821298;
SELECT CASE      WHEN EXISTS (SELECT * FROM Examination WHERE ID = 57266 AND UA > 8.0 AND SEX = 'M') THEN 'Yes'     WHEN EXISTS (SELECT * FROM Examination WHERE ID = 57266 AND UA > 6.5 AND SEX = 'F') THEN 'Yes'     ELSE 'No' END AS "Within Normal Range" FROM Examination WHERE ID = 57266;
SELECT Date FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE Description = '48473') AND GOT >= 60;
 SELECT P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date = '1994-01-01' AND L.GOT < 60 
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.GPT >= 60;
SELECT P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.GPT > 60 AND P.Birthday = (     SELECT MAX(Birthday)     FROM Patient     WHERE ID IN (SELECT ID FROM Examination WHERE GPT > 60) ) GROUP BY P.ID, P.Diagnosis ORDER BY P.Birthday; 
SELECT AVG(LDH) AS average_LDH FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE LDH < 500;
SELECT p.ID, age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.LDH > 600 AND e.LDH < 800 AND age = SUBTRACT(year(current_timestamp), year(p.Birthday))
SELECT P.Diagnosis, COUNT(*) AS Treatment_Type FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.ALP < 300 AND P.Admission IN ('+', '-') GROUP BY P.Diagnosis; 
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Birthday = '1982-04-01' AND E.ALP < 300; 
 SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.TP < 6.0; 
SELECT TP - 8.5 AS Deviation FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'F' AND Examination.TP > 8.5;
SELECT * FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND (e.ALB < 3.5 OR e.ALB > 5.5) ORDER BY p.Birthday DESC; 
 SELECT Patient.ID, Patient.Description, CASE      WHEN Patient.Birthday BETWEEN '1982-01-01' AND '1982-12-31' THEN          CASE              WHEN Laboratory.ALB BETWEEN 3.5 AND 5.5 THEN 'Albumin is within normal range'             ELSE 'Albumin is not within normal range'         END     ELSE 'Patient was not born in 1982' END AS AlbuminStatus FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Laboratory.Date) = 1982; 
SELECT (COUNT(*) * 100.0 / COUNT(*) OVER () AS 'Percentage') FROM Examination WHERE Sex = 'F' AND (UA > 8.0 OR (UA > 6.5 AND Sex = 'F')) AND UA IS NOT NULL;
 SELECT AVG(L.UA) AS AverageUAIndex FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.UA < 8.0 AND (P.SEX = 'M' OR L.UA < 6.5 AND P.SEX = 'F') AND L.Date = (     SELECT MAX(Date)     FROM Laboratory L2     WHERE L2.Patient_ID = L.Patient_ID ) 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.UN = 29;
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'RA' AND l.UN < 30; 
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND CRE >= 1.5;
SELECT SUM(CASE WHEN Sex = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN Sex = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END) AS "More Males" FROM Examination, Patient WHERE CRE >= 1.5 AND Patient.ID = Examination.ID;
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Examination) 
SELECT Sex, COUNT(*) AS TotalPatients FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`T-BIL` >= 2.0 GROUP BY Sex;
SELECT Patient.ID, MAX(Laboratory.T-CHO) AS T_CHOI INDEX FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID GROUP BY Patient.ID HAVING MIN(Laboratory.Date) = (     SELECT MIN(Date)     FROM Laboratory     GROUP BY Patient.ID     ORDER BY MIN(Date) ASC LIMIT 1 ) AND MAX(Laboratory.T-CHO) = (     SELECT MAX(T-CHO)     FROM Laboratory     GROUP BY Patient.ID ) ORDER BY MIN(Laboratory.Date) DESC LIMIT 1;
SELECT AVG(SUM(YEAR(NOW()) - Birthday) / COUNT(ID)) AS avg_age FROM Patient WHERE SEX = 'M' AND `T-CHO` >= 250;
SELECT P.ID, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.TG > 300;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.TG >= 200 AND SUBSTR(YEAR(CURRENT_TIMESTAMP) - p.Birthday, 1, 4) > 50;
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Admission = '-' AND E.CPK < 250;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Birthday BETWEEN '1936' AND '1956' AND p.SEX = 'M' AND e.CPK >= 250;
SELECT p.ID, p.SEX, TIMESTAMPDIFF(YEAR, p.Birthday, CURRENT_TIMESTAMP) AS age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.GLU >= 180 AND e.`T-CHO` < 250;
SELECT p.ID, e.GLU FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE YEAR(p.Description) >= 1991 AND e.GLU < 180;
SELECT P.ID, P.SEX, P.Birthday, P.Age FROM Patient P JOIN (     SELECT ID, MIN(Date) AS MinDate     FROM Laboratory     WHERE WBC < 3.5 OR WBC > 9.0     GROUP BY ID ) LabMin ON P.ID = LabMin.ID JOIN (     SELECT ID, Date, TIMESTAMPDIFF(YEAR, Birthday, Date) AS Age     FROM Patient ) PatientAge ON P.ID = PatientAge.ID WHERE TIMESTAMPDIFF(YEAR, PatientAge.Birthday, LabMin.MinDate) IS NOT NULL ORDER BY P.SEX, PatientAge.Age ASC; 
SELECT P.ID, P.Birthday, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RBC < 3.5 AND DATE_SUB(CURDATE(), INTERVAL P.Birthday YEAR) AS Age 
SELECT p.ID, p.Diagnosis, l.Admision FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND SUBTRACT(YEAR(CURRENT_TIMESTAMP), YEAR(p.Birthday)) >= 50 AND (e.RBC <= 3.5 OR e.RBC >= 6.0) AND l.Admision IN ('+', '-') GROUP BY p.ID, p.Diagnosis, l.Admision;
SELECT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Admission = '-' AND E.HGB < 10; 
 SELECT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis = 'SLE' AND 10 < E.HGB < 17 GROUP BY P.ID, P.SEX HAVING MIN(P.Birthday) = (     SELECT MIN(Birthday)     FROM Patient P2     WHERE P2.ID IN (         SELECT E2.ID         FROM Examination E2         JOIN Patient P3 ON E2.ID = P3.ID         WHERE E2.Diagnosis = 'SLE' AND E2.HGB >= 10 AND E2.HGB <= 17     ) ) 
SELECT P.ID, P.Age FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT > 52 AND COUNT(L.ID) > 2;
SELECT AVG(HCT) AS average_hct_lower_than_normal FROM Examination WHERE EXTRACT(YEAR FROM Date) = 1991 AND HCT < 29;
WITH abnormal_plts AS (   SELECT Patient.ID, COUNT(*) AS count   FROM Examination   JOIN Patient ON Examination.ID = Patient.ID   WHERE Examination.PLT < 100   GROUP BY Patient.ID ),  lower_range AS (   SELECT SUM(count) AS lower_count   FROM abnormal_plts ),  higher_range AS (   SELECT SUM(count) AS higher_count   FROM abnormal_plts   WHERE PLT > 400 )  SELECT    lower_count - higher_count AS difference,   lower_count AS patients_lower_range,   higher_count AS patients_higher_range FROM lower_range, higher_range; 
SELECT p.ID, p.SEX, p.Birthday, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON e.ID = l.ID AND DATE_FORMAT(l.Date, '%Y') = '1984%' WHERE SUBSTR(YEAR(CURRENT_TIMESTAMP) FROM '1984%', 1) - YEAR(p.Birthday) < 50 AND l.PLT BETWEEN 100 AND 400; 
 SELECT CAST(SUM(CASE WHEN SUBSTR(T2.Date, 1, 4) > 1955 AND T2.SEX = 'F' AND T2.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) AS 'Percentage of Female with Abnormal PT' FROM Patient T1 JOIN Examination T2 ON T1.ID = T2.ID WHERE T1.Birthday < DATE('1956-01-01') 
SELECT P.ID, P.SEX, P.Birthday, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.`First Date` > '1992-01-01' AND E.PT < 14;
SELECT COUNT(*) AS InactivatedAPTTS FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT >= 45; 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.APTT > 45 AND e.Thrombosis = 3 GROUP BY p.ID HAVING COUNT(*) = 1;
 SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND e.WBC BETWEEN 3.5 AND 9.0  AND (e.FG <= 150 OR e.FG >= 450) GROUP BY p.ID HAVING COUNT(DISTINCT e.ID) = 1; 
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.Birthday > '1980-01-01'  AND Examination.FG BETWEEN 150 AND 450;
SELECT DISTINCT Diagnosis FROM Examination WHERE `U-PRO` >= 30;
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`U-PRO` BETWEEN 0 AND 30 AND e.Diagnosis = 'SLE' AND p.Diagnosis = 'SLE';
SELECT COUNT(P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.IGG < 900 AND E.Symptoms = 'abortion'; 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.IGG BETWEEN 900 AND 2000 AND e.Symptoms IS NOT NULL;
SELECT Diagnosis FROM Examination WHERE IGA BETWEEN 80 AND 500 AND ID IN(SELECT ID FROM Patient WHERE IGA = (SELECT MAX(IGA) FROM Examination)) AND IGA IS NOT NULL;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.aCL IgA BETWEEN 80 AND 500 AND YEAR(e.`First Date`) >= 1990;
SELECT Diagnosis, MAX(COUNT(Diagnosis)) AS MostCommonDisease FROM Examination WHERE IGM NOT BETWEEN 40 AND 400 GROUP BY Diagnosis ORDER BY MostCommonDisease DESC;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Description IS NULL AND (e.CRP LIKE '+' OR e.CRP LIKE '-' OR e.CRP < 1.0)
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.CRP NOT IN ('+-', '-') AND Examination.CRP >= 1.0 AND SUBTRACT(YEAR(CURDATE()), YEAR(Patient.Birthday)) < 18;
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RA IN('-+', '+-') AND Examination.KCT = '+'; 
SELECT DISTINCT Diagnosis FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE YEAR(p.Birthday) >= 1995 AND RA IN('-', '+-') AND p.Diagnosis IS NOT NULL;
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RF < 20 AND SUBSTR(YEAR(CURDATE()), 1, 4) - SUBSTR(P.Birthday, 1, 4) > 60;
SELECT COUNT(P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Diagnosis NOT LIKE '%Thrombosis%' AND E.RF < 20; 
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.C3 > 35 AND Examination.ANA = 'P'; 
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Hematocrit NOT BETWEEN 29 AND 52 AND MAX(Examination.`aCL IgA`) = (     SELECT MAX(`aCL IgA`)     FROM Examination     WHERE Patient.ID IN (         SELECT Patient.ID         FROM Patient         JOIN Examination ON Patient.ID = Examination.ID         WHERE Hematocrit NOT BETWEEN 29 AND 52     ) ) GROUP BY Patient.ID ORDER BY MAX(Examination.`aCL IgA`) DESC LIMIT 1;
SELECT COUNT(DISTINCT Patient.ID) FROM Examination WHERE Thrombosis = 1 AND C4 > 10;
SELECT COUNT(DISTINCT Patient.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE RNP = '-' OR RNP = '+-' AND Admission = '+';
 SELECT p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RNP NOT IN ('-', '+-') AND p.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE RNP NOT IN ('-', '+-')) 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'normal anti-SM' AND e.Thrombosis = '1' AND e.ANA_PATTERN IN ('-', '+-') AND e.SM IN ('1')
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis IN ('SLE', 'SjS', 'vertigo') AND E.ANA Pattern NOT IN ('-', '+-') GROUP BY P.ID ORDER BY P.Birthday ASC LIMIT 3; 
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` >= '1997-01-01' AND e.SYMptoms LIKE '%- +-%' OR e.SYMptoms IS NULL AND e.SCA170 IN ('-', '+-')
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.SC170 IN ('-', '+-') AND Patient.SEX = 'M' AND Examination.Symptoms = 'vertigo'; 
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Diagnosis IN ('SLE', 'SjS', 'vertigo') AND Examination.SSA IN ('-', '+-') AND YEAR(Patient.First Date) < 1990;
 SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA Pattern IN ('-','+',SSA) GROUP BY p.ID HAVING MIN(e.First Date) = (   SELECT MIN(`First Date`)   FROM Patient p2   WHERE p2.ID = p.ID AND SSA IS NOT IN ('-', '+-') ) 
SELECT COUNT(DISTINCT Patient.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.Diagnosis = 'SLE' AND e.ANA Pattern IN('-', '+-') AND e.SSA = '-' OR e.SSB = '0'
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.SSB IN('-', '+-') AND Examination.Symptoms IS NOT NULL; 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.CENTROMEA IN('-+', '-') AND e.SSB IN('-+', '-')
SELECT DISTINCT P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.DNA >= 8 AND E.Diagnosis IS NOT NULL; 
SELECT COUNT(DISTINCT Patient.ID) FROM Patient LEFT JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.DNA < 8 AND Patient.Description IS NULL; 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.DNA-II < 8 AND p.Admission = '+'
SELECT CAST(SUM(CASE WHEN GOT >= 60 AND Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage with Abnormal GOT and SLE' FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Diagnosis = 'SLE' AND GOT >= 60; 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.GOT < 60;
 SELECT MIN(P.Birthday) AS Youngest_Birthdate FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.GOT >= 60 
SELECT P.Birthday, COUNT(*) AS GPT_Levels FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON E.ID = L.ID WHERE L.GPT < 60 GROUP BY P.Birthday ORDER BY GPT_Levels DESC LIMIT 3; 
 SELECT COUNT(*) AS male_count FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.GOT < 60 AND Patient.SEX = 'M' 
SELECT p.ID, MIN(p.First_Date) AS First_Date FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON e.ID = l.ID WHERE l.LDH < 500 AND l.LDH IS NOT NULL GROUP BY p.ID ORDER BY MAX(l.LDH) DESC LIMIT 1; 
SELECT MAX(`First Date`) AS Latest_Date FROM Patient WHERE EXISTS (SELECT 1 FROM Examination WHERE Patient.ID = Patient.ID AND LDH >= 500)
SELECT COUNT(P.ID) as AdmittedPatients FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.ALP >= 300 AND P.Admission = '+'; 
SELECT COUNT(*) FROM Patient WHERE Admission = '-' AND ALP < 300;
SELECT DISTINCT Diagnosis FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE TP < 6.0; 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SJS' AND e.TP > 6.0 AND e.TP < 8.5;
SELECT `Examination.Date` FROM Examination WHERE ALB IN(SELECT MAX(ALB) FROM Examination WHERE ALB > 3.5 AND ALB < 5.5) AND `Examination.Diagnosis` IS NOT NULL;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.ALB > 3.5 AND e.ALB < 5.5 AND e.TP BETWEEN 6.0 AND 8.5;
SELECT MAX(`aCL IgG`, `aCL IgM`, `aCL IgA`) AS max_anticardiolipin FROM Examination WHERE Sex = 'F' AND UA > 6.50 AND Diagnosis IS NULL;
SELECT MAX(ANA) AS highest_ANA_level FROM Examination WHERE CRE < 1.5 AND Diagnosis IS NOT NULL;
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.CRE < 1.5 AND E.aCL_IgA = (     SELECT MAX(aCL_IgA)     FROM Examination     WHERE Patient.ID = P.ID ) 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.`T-BIL` >= 2.0 AND e.ANA Pattern LIKE '%P%'
SELECT ANA  FROM Examination  WHERE T_BIL < 2.0  AND ID IN (SELECT ID FROM Patient WHERE T_BIL = (SELECT MAX(`T-BIL`) FROM Laboratory))  AND T_BIL = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0)
SELECT COUNT(P.ID) AS CountOfPatients FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.`T-CHO` >= 250 AND E.KCT = '-' 
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA Pattern = 'P' AND e.`T-CHO` < 250;
 SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.TG < 200 AND e.Symptoms IS NOT NULL 
SELECT Diagnosis FROM Examination WHERE TG < 200 AND Diagnosis IN(SELECT Diagnosis FROM Examination WHERE TG IS NOT NULL) GROUP BY Diagnosis ORDER BY MAX(TG) DESC LIMIT 1;
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Thrombosis = 0 AND Examination.CPK < 250;
SELECT COUNT(*)  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.CPK < 250 AND (Examination.KCT = '+' OR Examination.RVVT = '+' OR Examination.LAC = '+')
SELECT Patient.Birthday FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.GLU > 180 GROUP BY Patient.ID, Patient.Birthday ORDER BY Patient.Birthday ASC LIMIT 1; 
SELECT COUNT(P.ID) AS NonThrombosisCount FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.GLU < 180 AND E.Thrombosis = 0; 
SELECT COUNT(*) FROM Patient WHERE Admission = '+' AND WBC BETWEEN 3.5 AND 9.0;
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.WBC BETWEEN 3.5 AND 9.0;
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RBC < = 3.5 OR e.RBC > = 6.0 AND p.Admission = '-'
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.PLT > 100 AND p.PLT < 400 AND e.Diagnosis IS NOT NULL;
SELECT P.ID, P.Description, P.Birthday, P.Diagnosis, L.PLT FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.PLT >= 100 AND L.PLT <= 400 AND E.Diagnosis = 'MCTD'
SELECT AVG(PT) AS Average_PT FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.SEX = 'M' AND Examination.PT < 14;
SELECT COUNT(P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis IN (2, 1) AND E.PT < 14; 
SELECT major_name FROM member WHERE first_name = 'Angela' AND last_name = 'Sanders' AND link_to_major IS NOT NULL;
SELECT COUNT(member.member_id) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Engineering' AND member.position = 'Student' AND member.link_to_major IN (     SELECT major_id     FROM event     WHERE event_name = 'Student_Club' ); 
SELECT first_name, last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design' AND member.position = 'Student_Club';
SELECT COUNT(*) FROM attendance AS a JOIN member AS m ON a.link_to_member = m.member_id WHERE a.link_to_event = 'Women''s Soccer' AND m.position = 'Student_Club';
SELECT member.phone FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer';
SELECT COUNT(*) FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium';
 SELECT event.event_id, event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Student_Club' AND member.position = 'Student' GROUP BY event.event_id, event.event_name ORDER BY COUNT(link_to_event) DESC LIMIT 1; 
SELECT college FROM member WHERE position = 'Vice President' AND link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Student_Club');
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean';
SELECT COUNT(*) FROM attendance WHERE link_to_member = 'Sacha Harrison' AND YEAR(event_date) = 2019 AND link_to_event IN(SELECT event_id FROM event WHERE member_id IN(SELECT member_id FROM member WHERE first_name = 'Sacha' AND last_name = 'Harrison'));
SELECT COUNT(event_id) as meeting_count FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' AND COUNT(event.event_id) > 10;
SELECT event_name FROM event WHERE event_id IN(SELECT link_to_event FROM attendance WHERE link_to_member IN(SELECT member_id FROM member WHERE position='Student_Club' AND link_to_major IS NOT NULL)) GROUP BY event_id HAVING COUNT(event_id) > 20;
SELECT AVG(COUNT(event_id)) AS average_attendance FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020; 
SELECT MAX(cost) AS most_expensive_item FROM expense WHERE expense_description LIKE '%Club Events%' AND link_to_budget IN (SELECT link_to_event FROM budget WHERE event_status = 'Open')
SELECT COUNT(*) AS num_members FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering'; 
SELECT first_name, last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud';
 SELECT last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Law and Constitutional Studies'; 
SELECT county FROM zip_code WHERE zip = (     SELECT zip     FROM member     WHERE first_name = 'Sherri' AND last_name = 'Ramsey' ); 
SELECT DISTINCT college FROM member JOIN major ON member.link_to_major = major.major_id WHERE first_name = 'Tyler' AND last_name = 'Hewitt'; 
SELECT SUM(amount) FROM income WHERE position = 'Vice President';
SELECT SUM(amount) FROM expense WHERE category = 'Food' AND event_name = 'September Meeting' AND link_to_member IN (SELECT link_to_member FROM member WHERE position = 'Student_Club');
SELECT m.city, m.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President'; 
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Illinois')
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN expense e ON b.link_to_budget = e.link_to_budget JOIN member m ON e.link_to_member = m.member_id WHERE b.category = 'Advertisement' AND event_name = 'September Meeting' AND m.link_to_major = 'Student_Club'; 
SELECT department FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE first_name = 'Pierce' AND last_name = 'Guidi')
SELECT SUM(amount) AS total_budgeted_amount FROM budget WHERE event_status = 'Open' AND event_name = 'October Speaker'; 
SELECT expense.expense_id, expense.expense_description, expense.approved FROM expense JOIN event ON expense.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND event.event_date = '2019-10-08' AND expense.approved = True; 
 SELECT SUM(cost) / COUNT(*) FROM expense WHERE link_to_member = 'member_id_for_Elijah_Allen' AND       MONTH(expense_date) IN (9, 10) 
SELECT SUM(spent) AS diff_spent FROM budget WHERE event_status = 'Student_Club' AND YEAR(event_date) IN (2019, 2020) GROUP BY YEAR(event_date) HAVING YEAR(event_date) = 2020 SUBTRACT(SUM(spent) FROM (     SELECT SUM(spent) AS total_2019     FROM budget     WHERE event_status = 'Student_Club' AND YEAR(event_date) = 2019 ), (     SELECT SUM(spent) AS total_2020     FROM budget     WHERE event_status = 'Student_Club' AND YEAR(event_date) = 2020 ));
SELECT location FROM event WHERE event_name = 'Spring Budget Review';
SELECT expense.cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.category = 'Posters' AND budget.event_date = '2019-09-04';
SELECT budget.remaining  FROM budget  WHERE budget.category = 'Food' AND budget.amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')
SELECT notes FROM expense WHERE date_received = '2019-09-14' AND source = 'Fundraising';
SELECT COUNT(*) AS number_of_majors FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'College of Humanities and Social Sciences'; 
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher' AND z.type = 'Home'; 
 SELECT COUNT(*) AS exceeded_budgets FROM budget WHERE event_name = 'November Meeting' AND remaining < 0; 
SELECT SUM(amount) AS total_budget_amount FROM budget WHERE event_status = 'September Speaker'; 
SELECT event.status  FROM event  JOIN expense ON event.event_id = expense.link_to_event  WHERE expense.expense_description = 'Post Cards, Posters' AND expense.expense_date = '2019-08-20';
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE first_name = 'Brent' AND last_name = 'Thomason';
SELECT COUNT(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Human Development and Family Studies' AND t_shirt_size = 'Large'; 
SELECT zip_code.type FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE first_name = 'Christof' AND last_name = 'Nielsen'; 
SELECT major.major_name FROM major JOIN member ON major.link_to_major = member.link_to_major WHERE member.position = 'Vice President';
SELECT state FROM member WHERE first_name = 'Sacha' AND last_name = 'Harrison';
SELECT m.department FROM member m JOIN event e ON m.link_to_member = e.event_id JOIN major m2 ON m.link_to_major = m2.major_id WHERE e.type = 'Meeting' AND e.status = 'Open' AND e.event_name = 'Officers meeting - March' AND m.position = 'President'; 
SELECT date_received FROM income WHERE source = 'Dues' AND link_to_member = 'Connor Hilton';
SELECT first_name, last_name FROM member WHERE received_date = (     SELECT MIN(date_received)     FROM income     WHERE source = 'Dues' )
SELECT SUM(CASE WHEN category = 'Advertisement' AND event_name = 'Yearly Kickoff' THEN amount ELSE 0 END) / SUM(CASE WHEN category = 'Advertisement' AND event_name = 'October Meeting' THEN amount ELSE 0 END) AS ratio FROM budget WHERE event_name IN ('Yearly Kickoff', 'October Meeting')
SELECT CAST(SUM(amount WHERE category = 'Parking' AND event_name = 'November Speaker') AS REAL / COUNT(event_name = 'November Speaker') * 100 AS 'Percentage of Parking Budget' FROM budget WHERE event_name = 'November Speaker'; 
SELECT SUM(expense.cost) AS total_pizza_cost FROM expense WHERE expense.expense_description = 'Pizza'; 
SELECT COUNT(*) AS city_count FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';
SELECT city, county, state FROM member WHERE first_name = 'Amy' AND last_name = 'Firth' AND link_to_major IS NULL;
 SELECT expense.expense_description, expense.cost, budget.remaining FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.remaining = (SELECT MIN(remaining) FROM budget) 
SELECT DISTINCT m.member_id, m.first_name, m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  WHERE a.link_to_event = 'rec2N69DMcrqN9PJC';
SELECT major.college AS college_most_members_go FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY COUNT(*) DESC LIMIT 1;
SELECT major.major_name FROM member WHERE phone = '809-555-3360' AND link_to_major IS NOT NULL;
SELECT event.event_name, MAX(amount) AS highest_budget_amount FROM event JOIN budget ON event.event_id = budget.link_to_event GROUP BY event.event_name ORDER BY highest_budget_amount DESC LIMIT 1;
SELECT * FROM expense WHERE link_to_member IN (     SELECT member_id FROM member WHERE position = 'Vice President' ); 
SELECT COUNT(link_to_member) FROM attendance WHERE link_to_event = 'rec2N69DMcrqN9PJC'; 
SELECT date_received FROM income WHERE member_id = 'Casey Mason' AND link_to_member IS NOT NULL;
SELECT COUNT(*) AS members_from_maryland FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'MD'; 
SELECT COUNT(*) FROM attendance WHERE link_to_member = '954-555-6240';
SELECT first_name, last_name FROM member WHERE link_to_major = 'School of Applied Sciences, Technology and Education';
SELECT event.event_name, SUM(budget.spent) AS total_spent, SUM(budget.amount) AS total_amount, MAX(DIVIDE(SUM(budget.spent), SUM(budget.amount))) AS spend_to_budget_ratio FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' GROUP BY event.event_name ORDER BY spend_to_budget_ratio DESC LIMIT 1;
SELECT COUNT(*) AS num_students FROM member WHERE position = 'President'; 
SELECT MAX(b.spent) AS highest_budget_spent FROM budget b WHERE b.event_status = 'Open';
SELECT COUNT(*) AS meeting_events_in_2020 FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020; 
 SELECT SUM(b.spent) AS total_food_spent FROM budget b WHERE b.category = 'Food'; 
 SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id GROUP BY m.member_id HAVING COUNT(e.event_id) > 7; 
SELECT * FROM member  JOIN major ON member.link_to_major = major.major_id  JOIN attendance ON member.member_id = attendance.link_to_member  WHERE major.major_name = 'Interior Design' AND event.event_name = 'Community Theater';
SELECT first_name, last_name FROM member WHERE link_to_major IN (     SELECT major_id     FROM major     WHERE college = 'Georgetown' AND state = 'South Carolina' ) 
SELECT COUNT(*) FROM income WHERE link_to_member = 'Grant Gilmour';
SELECT first_name, last_name FROM member WHERE income.amount > 40;
SELECT SUM(expense.cost) AS total_expense FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff'; 
SELECT member_id FROM member WHERE position = 'Manager' AND link_to_event IN (SELECT event_id FROM event WHERE event_name = 'Yearly Kickoff');
 SELECT m.first_name, m.last_name, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id, i.source HAVING SUM(i.amount) = (     SELECT MAX(amount)     FROM income ) 
SELECT event_name, MIN(cost) AS lowest_cost FROM event GROUP BY event_name;
SELECT CAST(SUM(cost WHERE event_name = 'Yearly Kickoff') AS REAL / SUM(cost) * 100 AS percentage_cost FROM event; 
 SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS REAL) AS finance_physics_ratio FROM major WHERE major_name IN ('Finance', 'Physics') 
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;
SELECT first_name, last_name, email  FROM member  WHERE position = 'Secretary' AND link_to_major = 'Student_Club';
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching'; 
SELECT COUNT(*) FROM member JOIN attendance ON member.member_id = attendance.link_to_member WHERE event_name = 'Community Theater' AND YEAR(event_date) = 2019;
SELECT COUNT(*) AS events_attended, major.major_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event JOIN member ON attendance.link_to_member = member.member_id JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Luisa' AND member.last_name = 'Guidi'; 
 SELECT AVG(spent) AS avg_food_spending FROM budget WHERE category = 'Food' AND event_status = 'Closed'; 
 SELECT event.event_name, MAX(budget.spent) AS highest_spent FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' GROUP BY event.event_name ORDER BY highest_spent DESC LIMIT 1; 
SELECT * FROM attendance WHERE link_to_member = 'Maya Mclean' AND link_to_event = 'Women''s Soccer'; 
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS 'Percentage of Community Service Events' FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31' AND event_name LIKE '%Student_Club%' 
SELECT cost FROM expense WHERE expense_description = 'Posters' AND event_name = 'September Speaker';
SELECT MAXCOUNT(t_shirt_size) AS most_popular_size FROM member WHERE link_to_major IN(SELECT major_id FROM major);
 SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' AND budget.remaining < 0 GROUP BY event.event_name ORDER BY -budget.remaining LIMIT 1; 
SELECT type, SUM(cost) AS total_approved_value FROM expense WHERE link_to_event = 'rec2N69DMcrqN9PJC' -- Assuming 'October Meeting' is represented by 'rec2N69DMcrqN9PJC' AND approved = 'Approved' GROUP BY type;
SELECT budget.amount, budget.category FROM budget WHERE event_status = 'Open' AND event_name = 'April Speaker' ORDER BY budget.amount ASC; 
SELECT MAX(amount) FROM budget WHERE category = 'Food';
SELECT budget_id, category, MAX(amount) AS max_amount FROM budget WHERE category = 'Advertising' GROUP BY budget_id, category ORDER BY max_amount DESC LIMIT 3; 
 SELECT SUM(expense.cost) AS total_parking_cost FROM expense WHERE expense.expense_description = 'Parking'; 
SELECT SUM(expense.cost) AS total_expense FROM expense WHERE expense.expense_date = '2019-08-20'; 
SELECT first_name, last_name, SUM(cost) AS total_cost FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY first_name, last_name;
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';
SELECT expense.expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large'; 
SELECT zip FROM member WHERE cost < 50;
SELECT major_name FROM member WHERE first_name = 'Phillip' AND last_name = 'Cullen' AND link_to_major IS NOT NULL;
SELECT position FROM member WHERE link_to_major = 'Business';
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium';
SELECT type FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 30; 
SELECT category FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE location = 'MU 215')
SELECT category FROM budget WHERE event_date = '2020-03-24T12:00:00';
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE position = 'Vice President';
SELECT (SUM(CASE WHEN position = 'Member' AND major_name = 'Mathematics' THEN 1 ELSE 0 END) / COUNT(member_id)) * 100 AS 'Percentage of Members Majoring in Mathematics' FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Mathematics'; 
SELECT category FROM budget WHERE link_to_event = 'MU 215';
 SELECT COUNT(*) AS income_count FROM income WHERE amount = 50; 
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large'; 
 SELECT COUNT(*)  FROM major WHERE major.department = 'School of Applied Sciences, Technology and Education'  AND major.college = 'College of Agriculture and Applied Sciences'; 
 SELECT last_name, department, college FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering'; 
 SELECT budget.category FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.location = 'MU 215' AND budget.spent = 0 AND budget.event_status = 'Guest Speaker' 
SELECT city, state FROM member WHERE position = 'Member' AND link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Electrical and Computer Engineering')
SELECT event_name FROM event WHERE type = 'Social' AND location = '900 E. Washington St.' AND position = 'Vice President'
SELECT last_name, position FROM member WHERE email IN (SELECT link_to_member FROM expense WHERE expense_description = 'Pizza' AND expense_date = '2019-09-10');
SELECT last_name FROM member WHERE position = 'Member' AND event_name = 'Women''s Soccer';
 SELECT CAST(SUM(CASE WHEN T.shirt_size = 'Medium' AND position = 'Member' THEN amount ELSE 0 END) AS REAL) / COUNT(T.member_id) * 100 AS 'Percentage of $50 received by Student_Club' FROM member T JOIN income I ON T.member_id = I.link_to_member WHERE I.amount = 50 AND T.position = 'Member' GROUP BY T.member_id 
 SELECT DISTINCT state, short_state FROM zip_code WHERE type = 'PO Box'; 
SELECT zip_code.zip_code FROM zip_code WHERE state = 'Puerto Rico' AND type = 'PO Box';
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';
SELECT e.event_id, e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.link_to_budget AND m.cost > 50;
SELECT member.first_name, last_name, email, link_to_event  FROM member  JOIN expense ON member.link_to_member = expense.link_to_member  WHERE expense.approved = 'true' AND expense.expense_date BETWEEN '2019-01-10' AND '2019-11-19'  JOIN event ON expense.link_to_event = event.event_id;
SELECT college FROM member JOIN major ON member.link_to_major = major.major_id WHERE first_name = 'Katy' AND major.major_id = 'rec1N0upiVLy5esTO'; 
SELECT member.phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'College of Agriculture and Applied Sciences' AND major.major_name = 'Business'; 
SELECT email FROM member JOIN expense ON member.link_to_member = expense.link_to_member WHERE expense.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND expense.cost > 20; 
 SELECT COUNT(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Education' AND major.college = 'College of Education & Human Services'; 
SELECT (SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) / COUNT(event_id)) * 100 AS 'Percentage of events over budget' FROM budget WHERE event_status = 'Open';
SELECT event.event_id, event.location, event.status FROM event WHERE event.event_date BETWEEN '2019-11-01' AND '2020-03-31';
 SELECT expense.expense_id, expense.expense_description, AVG(cost) AS average_cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE cost > 50 GROUP BY expense.expense_id, expense.expense_description HAVING AVG(cost) > 50; 
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';
SELECT CAST(SUM(type = 'PO Box') AS REAL / COUNT(zip_code) * 100 AS percentage_of_PO_boxes FROM zip_code; 
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0; 
SELECT event_name, event_date FROM event JOIN expense ON event.event_id = expense.link_to_event WHERE expense.expense_description = 'Pizza' AND expense.cost > 50 AND expense.cost < 100;
 SELECT first_name, last_name, major_name FROM member JOIN expense ON member.link_to_member = expense.link_to_member JOIN budget ON expense.link_to_budget = budget.budget_id WHERE cost > 100; 
SELECT city, state FROM event e JOIN income i ON e.event_id = i.link_to_event WHERE i.amount > 40;
 SELECT m.first_name, m.last_name, MAX(e.cost) AS max_amount FROM member m JOIN expense e ON m.link_to_member = e.link_to_member GROUP BY m.member_id HAVING COUNT(DISTINCT e.event_id) > 1 
SELECT DIVIDE(SUM(cost), COUNT(event_id)) AS avg_paid_by_students FROM expense WHERE link_to_member IN (     SELECT member_id     FROM member     WHERE position != 'Member' );
SELECT event_name FROM event WHERE cost < (SELECT SUM(cost) / COUNT(event_id) FROM event WHERE category = 'Parking')
SELECT CAST(SUM(cost) AS REAL) / COUNT(CASE WHEN type = 'Game' THEN event_id END) * 100 AS 'Percentage of Game Event Cost' FROM event WHERE type = 'Game'; 
 SELECT b.event_status, b.amount FROM budget b JOIN expense e ON b.link_to_event = e.link_to_budget WHERE e.expense_description IN ('Water', 'Chips', 'Cookies') GROUP BY b.event_status, b.amount HAVING MAX(e.cost) = (   SELECT MAX(cost)   FROM expense   WHERE expense.description IN ('Water', 'Chips', 'Cookies') ) 
 SELECT first_name, last_name FROM member JOIN expense ON member.member_id = expense.link_to_member JOIN budget ON expense.link_to_budget = budget.budget_id GROUP BY member.member_id ORDER BY MAX(expense.cost) DESC LIMIT 5; 
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.link_to_member = e.link_to_member WHERE e.cost > (     SELECT AVG(cost) FROM expense ) 
 SELECT CAST(SUM(CASE WHEN state = 'Maine' THEN 1 ELSE 0 END) AS REAL) / COUNT(position = 'Member') AS maine_percentage,        CAST(SUM(CASE WHEN state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) / COUNT(position = 'Member') AS vermont_percentage,        (maine_percentage - vermont_percentage) * 100 AS percentage_difference FROM member WHERE state IN ('Maine', 'Vermont'); 
SELECT major.major_name, major.department  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';
 SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.link_to_member = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies' GROUP BY m.member_id; 
 SELECT last_name, phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education'; 
SELECT category, amount  FROM budget  WHERE event_name = 'January Speaker';
SELECT event.event_name FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food'
 SELECT first_name, last_name, amount FROM member JOIN income ON member.member_id = income.link_to_member WHERE date_received = '2019-09-09'; 
SELECT category FROM budget WHERE expense_description = 'Posters';
SELECT first_name, last_name, college FROM member WHERE position = 'Secretary' AND link_to_major IS NOT NULL;
 SELECT event.event_name, SUM(expense.cost) AS total_spent FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.category = 'Speaker Gifts' GROUP BY event.event_name; 
SELECT city FROM member WHERE first_name = 'Garrett' AND last_name = 'Girke' AND zip = (SELECT zip_code FROM zip_code WHERE state = 'IL' AND short_state = 'IL');
SELECT first_name, last_name, position  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE city = 'Lincolnton' AND state = 'North Carolina';
SELECT COUNT(GasStationID) FROM gasstations JOIN transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID WHERE Country = 'CZE' AND Segment = 'Premium'; 
SELECT (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END)) AS Ratio FROM transactions_1k 
 SELECT c.CustomerID, MIN(ym.Consumption) AS LeastConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date BETWEEN '2012-01-01' AND '2012-12-31' AND ym.Segment = 'LAM' GROUP BY c.CustomerID ORDER BY LeastConsumption ASC LIMIT 1; 
SELECT AVG(y.monthly_consumption) AS average_monthly_consumption FROM (     SELECT Date, SUM(Consumption) AS monthly_consumption, EXTRACT(YEAR FROM Date) AS year     FROM yearmonth     JOIN customers ON yearmonth.CustomerID = customers.CustomerID     WHERE customers.Segment = 'SME' AND EXTRACT(YEAR FROM Date) = 2013     GROUP BY Date, year     HAVING Date BETWEEN '2013-01-01' AND '2013-12-31' ) AS y 
SELECT c.CustomerID, c.Segment, SUM(t.Amount) AS TotalConsumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Currency = 'CZK' AND Date BETWEEN '2011-01-01' AND '2011-12-31' GROUP BY c.CustomerID, c.Segment ORDER BY TotalConsumption DESC LIMIT 1;
 SELECT COUNT(*)  FROM yearmonth  WHERE Date BETWEEN '2012-01' AND '2012-12'      AND Segment = 'KAM'      AND Consumption < 30000; 
SELECT      ym.Date,      SUM(CASE WHEN t.CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Currency = 'CZK') THEN t.Consumption ELSE 0 END) AS CZK_consumption,     SUM(CASE WHEN t.CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Currency = 'EUR') THEN t.Consumption ELSE 0 END) AS EUR_consumption FROM      yearmonth ym JOIN      transactions_1k t ON ym.CustomerID = t.CustomerID WHERE      t.Date BETWEEN '2012-01' AND '2012-12' GROUP BY      ym.Date 
SELECT Date, SUM(Consumption) AS TotalConsumption FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE Price = 'EUR' GROUP BY Date ORDER BY TotalConsumption DESC LIMIT 1; 
SELECT Segment, SUM(Consumption) AS TotalConsumption FROM yearmonth GROUP BY Segment ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Currency = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1; 
SELECT month, MAX(Consumption) AS PeakConsumption FROM (   SELECT SUBSTR(Date, 1, 4) AS YearMonth, MONTH(Date) AS Month, SUM(Consumption) AS Consumption   FROM yearmonth   JOIN customers ON yearmonth.CustomerID = customers.CustomerID   WHERE customers.Segment = 'SME' AND YearMonth LIKE '2013%'   GROUP BY YearMonth, Month ) AS monthly_consumption GROUP BY Month ORDER BY PeakConsumption DESC LIMIT 1; 
SELECT      CASE          WHEN Segment = 'SME' THEN 'SME - LAM'         WHEN Segment = 'LAM' THEN 'LAM - KAM'         ELSE 'KAM - SME'     END AS SegmentDifference,     ((SUM(Consumption) OVER (PARTITION BY Segment, Date BETWEEN '2013-01-01' AND '2013-12-31') / COUNT(DISTINCT CustomerID)) AS AnnualAverage FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE Segment IN ('SME', 'LAM', 'KAM') GROUP BY Segment, Date ORDER BY AnnualAverage ASC LIMIT 1; 
SELECT Segment,         ((Consumption_2013 - Consumption_2012) / Consumption_2013) * 100 AS Percentage_Increase,        COALESCE(MAX(Percentage_Increase), 0) AS Max_increase,        COALESCE(MIN(Percentage_Increase), 100) AS Min_increase FROM (   SELECT      c.Segment,      ym.Consumption_2012,      ym.Consumption_2013,      (ym.Consumption_2013 - ym.Consumption_2012) / ym.Consumption_2013 * 100 AS Percentage_Increase   FROM      customers c     JOIN yearmonth ym ON c.CustomerID = ym.CustomerID   WHERE      ym.Date BETWEEN '201201' AND '201312'     AND ym.Currency = 'EUR'     AND c.Segment IN ('SME', 'LAM', 'KAM') ) AS segment_consumption_changes GROUP BY    Segment ORDER BY    Max_increase DESC,    Min_increase ASC LIMIT 1; 
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Date >= '2013-08-01' AND Date <= '2013-11-30'   AND CustomerID = 6; 
SELECT      CASE          WHEN Segment = 'DISCOUNT' THEN 'Czech Republic'         ELSE 'Slovakia'     END AS Country,     COUNT(*) AS DiscountStations FROM      gasstations WHERE      Country IN ('Czech Republic', 'Slovakia') GROUP BY      Country; 
SELECT      (yearmonth.Consumption WHERE yearmonth.CustomerID = 7 AND yearmonth.Date = '2013-04' -       yearmonth.Consumption WHERE yearmonth.CustomerID = 5 AND yearmonth.Date = '2013-04') AS ExtraConsumption FROM      yearmonth WHERE      yearmonth.Date = '2013-04'; 
WITH sme_czeck_koruna AS (   SELECT CustomerID, SUM(Amount) AS czeck_koruna_amount   FROM transactions_1k   JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID   WHERE Segment = 'SME' AND Currency = 'CZK'   GROUP BY CustomerID ), sme_euro AS (   SELECT CustomerID, SUM(Amount) AS euro_amount   FROM transactions_1k   JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID   WHERE Segment = 'SME' AND Currency = 'EUR'   GROUP BY CustomerID )  SELECT    CASE      WHEN sme_czeck_koruna.czeck_koruna_amount > sme_euro.euro_amount THEN sme_czeck_koruna.czeck_koruna_amount - sme_euro.euro_amount     ELSE 0   END AS more_sme_czeck_koruna,   sme_czeck_koruna.czeck_koruna_amount - sme_euro.euro_amount AS total_more FROM sme_czeck_koruna JOIN sme_euro ON sme_czeck_koruna.CustomerID = sme_euro.CustomerID 
SELECT c.CustomerID, c.Segment, c.Currency, ym.Consumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '2013-10' ORDER BY ym.Consumption DESC LIMIT 1;
WITH LAM_customers AS (   SELECT CustomerID, SUM(Consumption) AS total_consumption   FROM yearmonth   WHERE Segment = 'LAM'   GROUP BY CustomerID ), most_consumed_LAM AS (   SELECT CustomerID, MAX(total_consumption) AS max_consumption   FROM LAM_customers ) SELECT LAM_customers.CustomerID, LAM_customers.total_consumption FROM LAM_customers JOIN most_consumed_LAM ON LAM_customers.CustomerID = most_consumed_LAM.CustomerID WHERE most_consumed_LAM.max_consumption = (   SELECT MAX(total_consumption)   FROM LAM_customers ) 
SELECT SUM(yearmonth.Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'KAM' AND yearmonth.Date = '2013-05'; 
SELECT (SUM(CASE WHEN Segment = 'LAM' AND Consumption > 46.73 THEN 1 ELSE 0 END) / COUNT(CASE WHEN Segment = 'LAM' THEN 1 END)) * 100 AS 'Percentage_LAM_consumption' FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE Segment = 'LAM'; 
WITH monthly_consumption AS (   SELECT     Country,     SUM(Consumption) AS total_consumption,     SUM(Price * Consumption) AS total_value_for_money   FROM yearmonth   GROUP BY Country ), most_value_for_money AS (   SELECT     Country,     total_value_for_money,     ROW_NUMBER() OVER (ORDER BY total_value_for_money DESC) AS rank   FROM monthly_consumption )  SELECT   Country,   total_value_for_money AS 'Value for Money Gas Stations',   rank FROM most_value_for_money WHERE rank = 1 
SELECT (SUM(CASE WHEN Segment = 'KAM' AND Currency = 'EUR' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS 'Percentage of KAM using Euros' FROM transactions_1k WHERE Segment = 'KAM'; 
SELECT      (COUNT(CASE WHEN YearMonth.Consumption > 528.3 THEN 1 END) / COUNT(*)) * 100 AS 'PercentageAbove528.3' FROM      yearmonth WHERE      YearMonth.Date = '2012-02' 
SELECT (COUNT(CASE WHEN GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'Slovakia' AND Segment = 'Premium') THEN 1 END) / COUNT(GasStationID)) * 100 AS 'Percentage of Premium Gas Stations' FROM gasstations; 
SELECT c.CustomerID FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE ym.Date = '201309' AND ym.Consumption = (     SELECT MAX(Consumption)     FROM yearmonth     WHERE Date = '201309' ) GROUP BY c.CustomerID ORDER BY Consumption DESC LIMIT 1; 
SELECT Segment FROM yearmonth WHERE Date = '201309' GROUP BY Segment ORDER BY Consumption ASC LIMIT 1; 
SELECT c.CustomerID, c.Segment, SUM(t.Amount) AS TotalConsumption FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND Date = '201206' GROUP BY c.CustomerID, c.Segment ORDER BY TotalConsumption MIN LIMIT 1; 
SELECT MAX(Consumption) AS HighestMonthlyConsumption FROM yearmonth WHERE DATE(yearmonth.Date) LIKE '2012%' 
 SELECT Date, MAX(Consumption) / 12 AS MonthlyConsumption FROM yearmonth WHERE Currency = 'EUR' GROUP BY Date ORDER BY MonthlyConsumption DESC LIMIT 1; 
SELECT products.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID AND DATE_FORMAT(y.Date, '%Y%m') = '201309' WHERE y.Date BETWEEN '2013-09-01' AND '2013-09-30';
SELECT Country FROM gasstations JOIN transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID WHERE Date >= '2013-06-01' AND Date <= '2013-06-30'; 
SELECT g.ChainID, GROUP_CONCAT(g.ChainID) AS ChainNames FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY g.ChainID; 
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND t.Date = ym.Date WHERE t.Currency = 'EUR' AND ym.Consumption IS NOT NULL; 
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE Date LIKE '2012-01%' 
SELECT COUNT(*) AS num_customers FROM transactions_1k t JOIN yearmonth y ON t.CustomerID = y.CustomerID JOIN customers c ON t.Currency = c.Currency WHERE t.Currency = 'EUR' AND y.Consumption > 1000; 
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'; 
SELECT DISTINCT Time FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11; 
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND Price > 1000;
SELECT COUNT(*) as num_transactions FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND Date > '2012-01-01'; 
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE';
SELECT AVG(T2.Price) AS avg_total_price FROM transactions_1k T1 JOIN yearmonth T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Consumption IS NOT NULL; 
SELECT c.CustomerID, SUM(t.Amount) AS TotalAmount FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY TotalAmount DESC LIMIT 1; 
SELECT Country  FROM gasstations  JOIN transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID  WHERE Date = '2012-08-25'  AND Amount > 0  GROUP BY Country  ORDER BY Date ASC  LIMIT 1;
SELECT Currency FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE Date = '2012-08-24' AND Time = '16:25:00'; 
SELECT Segment FROM transactions_1k AS T1 INNER JOIN customers AS C ON T1.CustomerID = C.CustomerID WHERE Date = '2012-08-23' AND T1.Time = '21:20:00' AND C.Segment IS NOT NULL;
SELECT COUNT(*) AS Transactions FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE Date >= '2012-08-26' AND Date < '2012-08-26 13:00:00' AND Price * YearMonth.Consumption > 0 AND Price IS NOT NULL AND Currency = 'EUR'; 
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = (     SELECT MIN(Date)     FROM yearmonth ) 
SELECT Country  FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE Date = '2012-08-24' AND T1.Time = '12:42:00';
SELECT T2.ProductID FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date = '2012-08-23' AND T1.Time = '21:20:00';
SELECT transactions_1k.Amount, yearmonth.Date AS january_date, yearmonth.Consumption FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE transactions_1k.Amount = 124.05 AND yearmonth.Date = '2012-01-01' 
SELECT COUNT(*)  FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE Date = '2012-08-26' AND Time BETWEEN '08:00:00' AND '09:00:00' AND GasStationID IN (     SELECT GasStationID     FROM gasstations     WHERE Country = 'CZE' ); 
SELECT Currency  FROM transactions_1k t JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE Date LIKE '201306%' AND Amount = 214582.17; 
SELECT Country FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE transactions_1k.TransactionID = 667467; 
SELECT customers.Currency FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID WHERE Date = '2012-08-24' AND Amount = 548.4; 
SELECT      (SUM(yearmonth.Consumption) FILTER (WHERE yearmonth.Date = '2012-08-25') /       COUNT(CASE WHEN customers.Currency = 'EUR' THEN customers.CustomerID END)) * 100 AS 'Percentage_of_EUR_customers' FROM      customers JOIN      yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE      customers.Currency = 'EUR' AND      yearmonth.Date = '2012-08-25'; 
WITH customer_transactions AS (   SELECT T1.CustomerID, Date, Consumption   FROM transactions_1k T1   JOIN yearmonth T2 ON T1.CustomerID = T2.CustomerID   WHERE T1.Amount = 634.8 AND DATE('2012-08-25') = T1.Date ),  consumption_rates AS (   SELECT      T1.CustomerID,     Date,     Consumption,     LAG(Consumption, 1) OVER (PARTITION BY CustomerID ORDER BY Date) AS prev_consumption_2012,     COALESCE(SUM(Consumption), 0) AS total_consumption_2013   FROM customer_transactions   WHERE Date >= '2012-01-01' AND Date <= '2013-12-31' ) SELECT    customer_transactions.CustomerID,   customer_transactions.Date,   consumption_rates.decrease_rate FROM    customer_transactions JOIN consumption_rates ON customer_transactions.CustomerID = consumption_rates.CustomerID WHERE    consumption_rates.Date = '2012-08-25' 
SELECT GasStationID, SUM(Amount * Price) AS TotalRevenue FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1; 
SELECT      (SUM(CASE WHEN products.Description = 'premium' THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS 'PremiumPercentage' FROM      transactions_1k JOIN      products ON transactions_1k.ProductID = products.ProductID WHERE      products.Country = 'SVK'; 
SELECT SUM(Transactions.Amount) AS TotalAmount FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 38508; 
SELECT p.Description AS FullProductName, SUM(t.Amount) AS TotalSales FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID, p.Description ORDER BY TotalSales DESC LIMIT 5; 
SELECT c.CustomerID, c.Segment, SUM(t.Amount) AS TotalSpending, AVG(t.Price / t.Amount) AS AvgPricePerItem FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth y ON c.CustomerID = y.CustomerID AND DATE_FORMAT(y.Date, '%Y-%m') = 'YYYY-MM' -- Replace 'YYYY-MM' with the desired month WHERE c.Currency = 'EUR' -- Filter for transactions in EUR GROUP BY c.CustomerID, c.Segment ORDER BY TotalSpending DESC LIMIT 1; 
SELECT Country, GasStationID, MAX(Price) AS MostExpensivePrice FROM transactions_1k JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID JOIN products ON transactions_1k.ProductID = products.ProductID WHERE products.ProductID = 2 AND Price = (     SELECT MAX(Price) FROM products     WHERE ProductID = 2 ) GROUP BY GasStationID, Country ORDER BY MostExpensivePrice DESC LIMIT 1; 
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym JOIN transactions_1k t ON ym.CustomerID = t.CustomerID JOIN products p ON t.ProductID = p.ProductID WHERE p.ProductID = 5 AND t.Amount * t.Price > 29.00 AND ym.Date LIKE '201208%' 
