SELECT      MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS HighestFreeRate FROM      frpm WHERE      `CDSCode` IN (SELECT `CDSCode` FROM schools WHERE `County` = 'Alameda');	california_schools
SELECT CDSCode,         Percent_Eligible_Free FROM (     SELECT f.CDSCode,             (f.Free_Meal_Count / f.Enrollment) AS Percent_Eligible_Free     FROM frpm AS f     JOIN schools AS s ON f.CDSCode = s.CDSCode     WHERE s.Charter = 1 ) AS SubQuery ORDER BY Percent_Eligible_Free ASC LIMIT 3;	california_schools
SELECT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Fresno' AND s.Charter = 1;	california_schools
SELECT s.Street FROM schools s JOIN frpm f ON s.MailCity = f.CDSCode WHERE f.FRPM Count (K-12) = (SELECT MAX("FRPM Count (K-12)") FROM frpm);	california_schools
SELECT Phone FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.'Charter School (Y/N)' = 1 AND frpm.'Charter Funding Type' = "Directly funded" AND schools.OpenDate > "2000-01-01";	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F';	california_schools
SELECT s.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone FROM satscores AS sc JOIN schools AS s ON sc.cds = s.CDSCode WHERE sc.NumGE1500 IS NOT NULL AND sc.NumTstTakr = (     SELECT MAX(sc2.NumTstTakr)     FROM satscores AS sc2     WHERE sc2.NumGE1500 IS NOT NULL )	california_schools
SELECT s.NumTstTakr FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.FRPM_Count_(K-12) = (SELECT MAX(FRPM_Count_(K-12)) FROM frpm)	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores ss ON s.CDSCode = ss.CDSCode JOIN frpm f ON s.CDSCode = f.CDSCode WHERE ss.AvgScrMath > 560 AND f.'Charter Funding Type' = 'Directly funded';	california_schools
SELECT f.'FRPM Count (Ages 5-17)' FROM 'schools' s JOIN 'satscores' sa ON s.'CDSCode' = sa.'CDSCode' JOIN 'frpm' f ON s.'CDSCode' = f.'CDSCode' WHERE sa.'AvgScrRead' = (SELECT MAX('AvgScrRead') FROM 'satscores')	california_schools
SELECT s.CDSCode  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Enrollment (K-12)` + f.`Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`)  FROM `frpm` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `satscores` WHERE `NumGE1500` / `NumTstTakr` > 0.3);	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumTstTakr > 0 ORDER BY (ss.NumGE1500 / ss.NumTstTakr) DESC LIMIT 3;	california_schools
SELECT      s.NCESSchool,      frpm.`Enrollment (Ages 5-17)`  FROM      frpm  JOIN      schools s ON frpm.CDSCode = s.CDSCode  ORDER BY      frpm.`Enrollment (Ages 5-17)` DESC  LIMIT 5;	california_schools
SELECT s.District, MAX(s.AvgScrRead) AS HighestScore FROM schools s JOIN satscores ss ON s.NCESDist = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY HighestScore DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100;	california_schools
SELECT s1.CharterNum, s2.AvgScrWrite FROM schools s1 JOIN satscores s2 ON s1.CDSCode = s2.cds WHERE s2.AvgScrWrite > 499 AND s1.CharterNum IS NOT NULL ORDER BY s2.AvgScrWrite DESC;	california_schools
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores st ON s.CDSCode = st.cds WHERE s.County = 'Fresno' AND s.FundingType = 'Directly funded' AND st.NumTstTakr <= 250;	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Amador' AND 'LowGrade' = 9 AND 'HighGrade' = 12;	california_schools
SELECT COUNT(*) FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.County = 'Los Angeles' AND frpm.'Free Meal Count (K-12)' > 500 AND frpm.'Free Meal Count (K-12)' < 700;	california_schools
SELECT s.School, sname, SUM(NumTstTakr) AS TotalTestTakers FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Contra Costa' GROUP BY s.School, sname ORDER BY TotalTestTakers DESC LIMIT 1;	california_schools
SELECT s.School, s.Street, s.StreetAbr, s.City, s.Zip, s.State FROM schools s JOIN frpm f ON s.School IS NOT NULL AND s.School = f.CDSCode WHERE ABS(f."Enrollment (K-12)" - f."Enrollment (Ages 5-17)") > 30;	california_schools
SELECT frpm.SchoolName FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.`Percent (%) Eligible Free (K-12)` > 0.1 AND satscores.NumGE1500 IS NOT NULL AND satscores.NumTstTakr > 0;	california_schools
SELECT s.CDSCode, s.FundingType FROM schools s JOIN (     SELECT sc.CDSCode, AVG(st.AvgScrMath) AS AvgAvgScrMath     FROM schools sc     JOIN satscores st ON sc.CDSCode = st.cds     WHERE sc.County = 'Riverside'     GROUP BY sc.CDSCode     HAVING AVG(st.AvgScrMath) > 400 ) AS avg_scores ON s.CDSCode = avg_scores.CDSCode;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM schools s JOIN frpm f ON s.School = f.County Name WHERE f.County Name = 'Monterey' AND f.Percent (%) Eligible Free (Ages 5-17) > 800;	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01')	california_schools
WITH LocalFundingSchools AS (     SELECT         s.CDSCode,         s.School,         s.DOCType,         (f.Enrollment__K_12 - f.Enrollment__Ages_5_17) AS Difference     FROM         schools s     JOIN         frpm f ON s.CDSCode = f.CDSCode     WHERE         s.FundingType = 'Directly funded' ), AverageDifference AS (     SELECT         AVG(Difference) AS AvgDiff     FROM         LocalFundingSchools ) SELECT     ls.School,     ls.DOCType FROM     LocalFundingSchools ls JOIN     AverageDifference ad ON ls.Difference > ad.AvgDiff;	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.'Enrollment (K-12)' = (     SELECT MAX(f2.'Enrollment (K-12)')     FROM frpm f2 ) ORDER BY s.OpenDate ASC LIMIT 1;	california_schools
SELECT s.City, fmin.Enrollment (K-12) as LowestEnrollment FROM schools s JOIN (     SELECT CDSCode, MIN(Enrollment (K-12)) as Enrollment (K-12)     FROM frpm     GROUP BY CDSCode ) fmin ON s.CDSCode = fmin.CDSCode ORDER BY fmin.Enrollment (K-12) ASC LIMIT 5;	california_schools
SELECT     s.CDSCode,     s.School,     f.`Enrollment (K-12)`,     f.`Free Meal Count (K-12)`,     (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) AS EligibleFreeRate FROM     frpm f JOIN     schools s ON f.CDSCode = s.CDSCode ORDER BY     f.`Enrollment (K-12)` DESC LIMIT 11;	california_schools
SELECT      `School Name`,      `FRPM Count (K-12)` / `Enrollment (K-12)` AS EligibleFreeMealRate FROM      frpm WHERE      `School Type` = 'K-12 Schools (Public)' AND      `Educational Option Type` = 'Traditional' AND      `Charter School (Y/N)` = 0 AND      `School Code` IN (         SELECT              `School Code`         FROM              frpm         WHERE              `School Type` = 'K-12 Schools (Public)' AND              `Educational Option Type` = 'Traditional' AND              `Charter School (Y/N)` = 0         ORDER BY              `FRPM Count (K-12)` DESC         LIMIT 5     ) ORDER BY      EligibleFreeMealRate DESC LIMIT 5;	california_schools
SELECT schools.Website, schools.School FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm."Free Meal Count (Ages 5-17)" BETWEEN 1900 AND 2000;	california_schools
SELECT      f.CDSCode,      f.School_Name,      (f.Free_Meal_Count__Ages_5_17 / f.Enrollment__Ages_5_17) AS Free_Rate FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.AdmLName1 = 'Gibson';	california_schools
SELECT s.AdmEmail1 FROM frpm f JOIN schools s ON f.CDSCode = s.AdmFName1 WHERE f.'Charter School (Y/N)' = 1 ORDER BY f.'Enrollment (K-12)' ASC LIMIT 1;	california_schools
SELECT      s.AdmFName1,      s.AdmLName1,      s.AdmFName2,      s.AdmLName2,      s.AdmFName3,      s.AdmLName3 FROM      schools s JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      sc.NumGE1500 IS NOT NULL AND      sc.NumGE1500 = (         SELECT MAX(sc2.NumGE1500)         FROM satscores sc2         WHERE sc2.cds = s.CDSCode     )	california_schools
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumGE1500 IS NOT NULL AND sc.NumTstTakr > 0 ORDER BY (sc.NumGE1500 / sc.NumTstTakr) ASC LIMIT 1;	california_schools
SELECT s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.School Code JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.County = 'Los Angeles' AND sc.NumTstTakr BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(s.NumTstTakr)  FROM schools s  JOIN satscores s2 ON s.CDSCode = s2.NumTstTakr  WHERE s.City = 'Fresno' AND YEAR(s.OpenDate) = 1980;	california_schools
SELECT s.Phone FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores sc ON s.CDSCode = sc.cds WHERE f."District Name" = 'Fresno Unified' AND sc.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores sc2 JOIN frpm f2 ON sc2.cds = f2.CDSCode WHERE f2."District Name" = 'Fresno Unified')	california_schools
SELECT s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Virtual = 'F' AND s.StatusType = 'Active' AND f.AvgScrRead IS NOT NULL AND s.County = f.County ORDER BY f.AvgScrRead DESC PARTITION BY s.County LIMIT 5;	california_schools
SELECT frpm.`Educational Option Type` FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrMath IS NOT NULL AND satscores.AvgScrMath = (     SELECT MAX(AvgScrMath)     FROM satscores     WHERE AvgScrMath IS NOT NULL )	california_schools
SELECT      s.County,      (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) AS TotalAvgScore FROM      satscores s JOIN      schools sch ON s.cds = sch.CDSCode ORDER BY      TotalAvgScore ASC LIMIT 1;	california_schools
SELECT      s.City,      AVG(ss.AvgScrWrite) AS AvgWritingScore FROM      satscores ss JOIN      schools s ON ss.cds = s.CDSCode WHERE      ss.NumGE1500 IS NOT NULL GROUP BY      s.City ORDER BY      COUNT(ss.cds) DESC LIMIT 1;	california_schools
SELECT s.School, AVG(sc.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School;	california_schools
SELECT      s.State,      COUNT(*) AS NumEnrollees FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.DOC = '31' AND      s.DOCType = 'K-12' GROUP BY      s.State ORDER BY      NumEnrollees DESC LIMIT 1;	california_schools
SELECT      COUNT(*) / 12 AS monthly_average_openings FROM      'schools' WHERE      'StatusType' = "Active"     AND 'County' = "Alameda"     AND 'DOC' = "52"     AND 'OpenDate' BETWEEN "1980-01-01" AND "1980-12-31";	california_schools
SELECT      (SELECT COUNT(*) FROM schools WHERE StatusType = 'Merged' AND DOC = '54') AS UnifiedSchoolsCount,     (SELECT COUNT(*) FROM schools WHERE StatusType = 'Merged' AND DOC = '52') AS ElementarySchoolsCount,     (SELECT COUNT(*) FROM schools WHERE StatusType = 'Merged' AND DOC = '54') * 1.0 /      (SELECT COUNT(*) FROM schools WHERE StatusType = 'Merged' AND DOC = '52') AS Ratio FROM      DUAL;	california_schools
SELECT County, School, ClosedDate  FROM schools  WHERE StatusType = 'Closed'  GROUP BY County  ORDER BY COUNT(*) DESC  LIMIT 1;	california_schools
SELECT s.Street, s.StreetAbr, s.City, s.Zip, s.State, s.SchoolName FROM schools s JOIN (     SELECT sname, AVG(AvgScrMath) AS avg_math     FROM satscores     JOIN schools s ON s.CDSCode = satscores.cds     GROUP BY sname     ORDER BY avg_math DESC ) AS math_scores ON s.School = math_scores.sname WHERE math_scores.avg_math = (     SELECT AVG(AvgScrMath)     FROM satscores     JOIN schools s ON s.CDSCode = satscores.cds     GROUP BY sname     ORDER BY avg_math DESC     LIMIT 1 OFFSET 6 );	california_schools
SELECT s.MailStreet, sch.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds JOIN frpm f ON s.CDSCode = f.CDSCode WHERE sc.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores)	california_schools
SELECT COUNT(*) FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.City = 'Lakeport' AND (sc.AvgScrRead + sc.AvgScrMath + sc.AvgScrWrite) >= 1500;	california_schools
SELECT s.NumTstTakr FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.City = 'Fresno';	california_schools
SELECT School, MailZip FROM schools WHERE AdmLName1 = 'Atoian';	california_schools
SELECT      (SELECT COUNT(*) FROM schools WHERE County = 'Colusa' AND MailState = 'CA') /      (SELECT COUNT(*) FROM schools WHERE County = 'Humboldt' AND MailState = 'CA') AS Ratio	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND County = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT s.Phone, s.Ext FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds ORDER BY sc.AvgScrWrite DESC LIMIT 1 OFFSET 332;	california_schools
SELECT 'School', 'Phone', 'Ext' FROM schools WHERE Zip = "95203-3704";	california_schools
SELECT s.Website  FROM schools s WHERE s.AdmFName1 = 'Mike' AND s.AdmLName1 = 'Larson'     OR s.AdmFName2 = 'Mike' AND s.AdmLName2 = 'Larson'     OR s.AdmFName3 = 'Mike' AND s.AdmLName3 = 'Larson'     OR s.AdmFName1 = 'Dante' AND s.AdmLName1 = 'Alvarez'     OR s.AdmFName2 = 'Dante' AND s.AdmLName2 = 'Alvarez'     OR s.AdmFName3 = 'Dante' AND s.AdmLName3 = 'Alvarez';	california_schools
SELECT Website  FROM schools  WHERE County = 'San Joaquin'  AND Charter = 1  AND Virtual = 'P';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = '52';	california_schools
SELECT COUNT(*) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Alameda' AND s.Charter = 0 AND (f.Free_Meal_Count_(K-12) * 100 / f.Enrollment_(K-12)) < 0.18;	california_schools
SELECT School, City, AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3 FROM schools WHERE Charter = 1 AND CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT      (COUNT(*) FILTER (WHERE FundingType = 'Locally funded') * 100.0) / COUNT(*) * 100 AS PercentageLocallyFunded FROM      schools WHERE      County = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM schools WHERE '2000-01-01' <= OpenDate AND OpenDate <= '2005-12-31' AND FundingType = 'Directly funded' AND County = 'Stanislaus' AND StatusType = 'Active';	california_schools
SELECT COUNT(DISTINCT frpm.CDSCode) AS TotalClosure FROM frpm JOIN schools ON frpm.CDSCode = schools.School WHERE schools.City = 'San Francisco' AND schools.ClosedDate BETWEEN '1989-01-01' AND '1989-12-31';	california_schools
SELECT      County,      COUNT(*) AS TotalClosed FROM      schools WHERE      SOC = '11'      AND YEAR(ClosedDate) BETWEEN 1980 AND 1989 GROUP BY      County ORDER BY      TotalClosed DESC LIMIT 1;	california_schools
SELECT s.NCESDist FROM schools s WHERE s.SOC = '31';	california_schools
SELECT      CASE          WHEN `StatusType` = 'Active' THEN 'Active'         WHEN `StatusType` = 'Closed' THEN 'Closed'     END AS Status,     COUNT(*) AS Total FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      `County` = 'Alpine'     AND (`School Type` = 'Community Day Schools' OR `School Type` LIKE '%Community Day Schools%') GROUP BY      `StatusType`;	california_schools
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0;	california_schools
SELECT frpm.'Enrollment (Ages 5-17)' FROM frpm JOIN schools ON frpm.'CDSCode' = schools.'CDSCode' WHERE schools.'EdOpsCode' = 'SSS' AND frpm.'Academic Year' = '2014-2015';	california_schools
SELECT frpm.FRPM_Count__Ages_5_17  FROM frpm  JOIN schools ON frpm.CDSCode = schools.MailStreet  WHERE schools.MailStreet = 'PO Box 1040' AND schools.StatusType = 'Youth Authority';	california_schools
SELECT MIN('frpm.Low Grade')  FROM 'frpm'  JOIN 'schools' ON 'frpm.CDSCode' = 'schools.NCESDist'  WHERE 'schools.EdOpsCode' = 'SPECON';	california_schools
SELECT s.School, f.EducationalOptionType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.CountyCode = '37' AND f.EducationalOptionType = 'Breakfast Provision 2';	california_schools
SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.NSLP_Provision_Status = 'Lunch Provision 2' AND f.Low_Grade = '9' AND f.County_Code = '01' AND s.EILCode = 'HS' AND EXISTS (     SELECT 1     FROM frpm f2     WHERE f2.CDSCode = f.CDSCode     AND f2.Low_Grade = '12' );	california_schools
SELECT      s.School,     SUM(f.FRMPercent) AS TotalFRMPercent FROM      (         SELECT              frpm.CDSCode,             frpm.County Name AS CountyName,             frpm.'Enrollment (Ages 5-17)' AS Enrollment,             frpm.'Free Meal Count (Ages 5-17)' AS FreeMealCount,             (frpm.'Free Meal Count (Ages 5-17)' / frpm.'Enrollment (Ages 5-17)') * 100 AS FRMPercent         FROM              frpm         WHERE              frpm.'Low Grade' = 'K' AND             frpm.County Name = 'Alameda'     ) f JOIN      schools s ON f.CDSCode = s.School WHERE      f.CountyName = 'Alameda' AND     f.'Low Grade' = '9' GROUP BY      s.School;	california_schools
SELECT      GSoffered,      COUNT(*) AS count  FROM      schools  WHERE      City = 'Adelanto'  GROUP BY      GSoffered  ORDER BY      count DESC  LIMIT 1;	california_schools
SELECT      County,      COUNT(*) AS SchoolCount FROM      schools WHERE      Virtual = 0 AND     County IN ('San Diego', 'Santa Barbara') GROUP BY      County ORDER BY      SchoolCount DESC LIMIT 1;	california_schools
SELECT School, Latitude  FROM schools  WHERE Latitude = (SELECT MAX(Latitude) FROM schools);	california_schools
SELECT s.School, f Low_Grade FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.State = 'CA' AND s.Latitude = (SELECT MIN(Latitude) FROM schools WHERE State = 'CA')	california_schools
SELECT MAX(ABS(Longitude)), GSoffered FROM schools WHERE CDSCode IN (SELECT CDSCode FROM frpm) ORDER BY ABS(Longitude) DESC LIMIT 1;	california_schools
SELECT      City,      COUNT(*) AS NumberOfSchools FROM      schools WHERE      GSoffered = 'K-8' AND Magnet = 1 AND `NSLP Provision Status` = 'Multiple Provision Types' GROUP BY      City;	california_schools
SELECT      s.AdmFName1 AS AdminFName,      f.'District Name',      COUNT(s.AdmFName1) AS Count FROM      schools s JOIN      frpm f ON s.AdmFName1 = f.'CDSCode' GROUP BY      s.AdmFName1,      f.'District Name' ORDER BY      Count DESC LIMIT 2;	california_schools
SELECT      frpm.DistrictCode,      ((frpm.FreeMealCount_K12 / frpm.Enrollment_K12) * 100) AS Percent_Eligible_Free FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      schools.AdmFName1 = 'Alusine';	california_schools
SELECT      County,      District,      School,      AdmLName1 FROM      schools WHERE      CharterNum = '40';	california_schools
SELECT s.AdmEmail1, s.AdmEmail2, s.AdmEmail3 FROM schools s WHERE s.County = 'San Bernardino'   AND s.District = 'San Bernardino City Unified'   AND s.DOCTYPE = '54'   AND s.SOC = '62'   AND s.OpenDate BETWEEN '2009-01-01' AND '2010-12-31'   AND s.StatusType = 'Active';	california_schools
SELECT s.AdmEmail1, s.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.NumTstTakr WHERE sc.NumGE1500 IS NOT NULL ORDER BY sc.NumGE1500 DESC LIMIT 1;	california_schools
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.A3 JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'East Bohemia' AND t.type = 'POPLATEK PO OBRATU';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.A3 JOIN loan l ON a.account_id = l.account_id WHERE d.A3 = 'Prague' AND l.status = 'A';	financial
SELECT      (SELECT AVG(A12) FROM district) AS avg_unemployment_1995,     (SELECT AVG(A13) FROM district) AS avg_unemployment_1996 WHERE     (SELECT AVG(A12) FROM district) > (SELECT AVG(A13) FROM district)     OR     (SELECT AVG(A12) FROM district) < (SELECT AVG(A13) FROM district);	financial
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000 AND A6 = 'F';	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND (SELECT AVG(a.frequency) FROM account a WHERE a.district_id = c.district_id) > 8000;	financial
WITH GenderAndAge AS (     SELECT          c.client_id,          c.gender,          c.birth_date,         d.A11 AS average_salary     FROM          client c     JOIN          district d ON c.district_id = d.A11     JOIN          account a ON c.client_id = a.district_id     WHERE          c.gender = 'F' ), OldestFemaleClient AS (     SELECT          client_id     FROM          GenderAndAge     ORDER BY          birth_date     LIMIT 1 ), LowestAvgSalary AS (     SELECT          average_salary     FROM          GenderAndAge     WHERE          client_id = (SELECT client_id FROM OldestFemaleClient) ), HighestAvgSalary AS (     SELECT          MAX(average_salary) AS max_salary     FROM          GenderAndAge ), SalaryGap AS (     SELECT          (SELECT max_salary FROM HighestAvgSalary) - (SELECT average_salary FROM LowestAvgSalary) AS salary_gap ) SELECT      c.client_id,      c.gender,      c.birth_date,      a.account_id,      d.A11 AS average_salary,     (SELECT salary_gap FROM SalaryGap) AS gap FROM      client c JOIN      account a ON c.client_id = a.district_id JOIN      district d ON c.district_id = d.A11 WHERE      c.gender = 'F'     AND c.client_id = (SELECT client_id FROM OldestFemaleClient);	financial
SELECT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON c.district_id = d.A11 WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) ORDER BY d.A11 DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN account a ON c.client_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN order o ON d.account_id = o.account_id WHERE o.k_symbol = "POPLATEK TYDNE" AND c.gender = "Owner";	financial
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dt ON a.district_id = dt.A2 JOIN trans t ON d.account_id = t.account_id WHERE t.k_symbol = 'POPLATEK PO OBRATU';	financial
SELECT      l.account_id,      MIN(l.amount) AS min_amount FROM      loan l JOIN      account a ON l.account_id = a.account_id WHERE      l.date BETWEEN '1997-01-01' AND '1997-12-31'     AND l.status = 'A'     AND EXISTS (         SELECT 1         FROM trans t         WHERE t.account_id = l.account_id         AND t.type = 'POPLATEK TYDNE'     ) GROUP BY      l.account_id ORDER BY      min_amount ASC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND YEAR(a.date) = 1993 ORDER BY l.amount DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN district d ON a.district_id = d.A2  WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov';	financial
SELECT account_id, district_id, date FROM account WHERE date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY date ASC LIMIT 1;	financial
SELECT a.district_id FROM account a WHERE a.date < '1997-01-01' AND a.frequency = 'POPLATEK MESICNE'	financial
SELECT c.client_id FROM client c JOIN card cd ON c.client_id = cd.card_id WHERE cd.issued = '1995-04-24';	financial
SELECT a.date AS 'AccountOpenedDate' FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.date = '1998-10-14' AND t.amount = 840;	financial
SELECT d.district_id FROM loan l JOIN account a ON l.account_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(amount) AS biggest_amount FROM trans JOIN card ON trans.account_id = account.account_id JOIN client ON card.client_id = client.client_id WHERE issued = '1996-10-21';	financial
SELECT c.gender FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) ORDER BY d.A11 DESC LIMIT 1;	financial
SELECT c.client_id, t.amount AS first_transaction_amount FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id JOIN trans t ON a.account_id = t.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) AND t.date = (SELECT MIN(date) FROM trans WHERE account_id = a.account_id);	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F';	financial
SELECT d.disp_id FROM trans t JOIN disp d ON t.account_id = d.client_id WHERE t.amount = 5100 AND t.date = '1998-09-02';	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice' AND YEAR(account.date) = 1996;	financial
SELECT d.A2 FROM client c JOIN account a ON c.gender = 'F' AND YEAR(c.birth_date) = 1976 AND MONTH(c.birth_date) = 1 AND DAY(c.birth_date) = 29 JOIN district d ON a.district_id = d.district_id;	financial
SELECT c.birth_date FROM client c JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT a.account_id  FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.account_id LIMIT 1;	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) * 100.0) / COUNT(c.client_id) AS male_client_percentage FROM      client c JOIN      district d ON c.district_id = d.A3 AND d.A4 = '149893';	financial
SELECT   ((MAX(T.balance) - MIN(T.balance)) / MIN(T.balance)) * 100 AS increase_rate FROM   account A JOIN   trans T ON A.account_id = T.account_id WHERE   A.account_id IN (     SELECT       L.account_id     FROM       loan L     WHERE       L.date = '1993-07-05'   )   AND T.date BETWEEN '1993-03-22' AND '1998-12-27';	financial
SELECT     ROUND(         (SUM(CASE WHEN l.status = 'A' THEN l.amount ELSE 0 END) / SUM(l.amount)) * 100,         2     ) AS fully_paid_percentage FROM     loan l JOIN     account a ON l.account_id = a.account_id	financial
SELECT     (SUM(CASE WHEN L.amount < 100000 AND L.status = 'C' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT L.account_id) FROM     loan L JOIN     account A ON L.account_id = A.account_id	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND t.type = 'POPLATEK PO OBRATU' ORDER BY a.account_id;	financial
SELECT a.account_id, a.frequency FROM account a JOIN client c ON a.account_id = c.client_id JOIN district d ON c.client_id = d.A2 WHERE d.A2 IN ('Benesov', 'Kolin', 'Kladno', 'Beroun') AND a.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice';	financial
SELECT d.A3 AS district, d.A3 AS region FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = 4990;	financial
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.district_id, d.A11 FROM loan l JOIN loan_details ld ON l.loan_id = ld.loan_id JOIN district d ON d.district_id = ld.district_id WHERE ld.duration = 60;	financial
SELECT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment FROM district d JOIN account a ON d.district_id = (SELECT district_id FROM client WHERE district_id = d.district_id) JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'D';	financial
SELECT     (COUNT(CASE WHEN d.A2 = 'Decin' AND a.date LIKE '1993%' THEN 1 END) * 100.0) / COUNT(*) FROM     account a JOIN     district d ON a.district_id = d.district_id;	financial
SELECT a.account_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE a.frequency = 'POPLATEK MESICNE' GROUP BY a.account_id HAVING COUNT(o.account_id) > 0;	financial
SELECT      d.A2 AS district_name,      COUNT(c.client_id) AS female_account_holders FROM      district d JOIN      client c ON d.district_id = c.district_id WHERE      c.gender = 'F' GROUP BY      d.A2 ORDER BY      female_account_holders DESC LIMIT      9;	financial
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.A2 WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  LEFT JOIN district d ON a.account_id = d.account_id  WHERE d.A3 = 'South Bohemia' AND NOT EXISTS (     SELECT 1      FROM credit_card      WHERE account_id = a.account_id );	financial
SELECT d.A3 AS district_name, COUNT(l.loan_id) AS active_loan_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.district_id ORDER BY active_loan_count DESC LIMIT 1;	financial
SELECT AVG(amount)  FROM loan  JOIN client ON loan.account_id = client.client_id  WHERE client.gender = 'M';	financial
SELECT d.A2, d.A13 FROM district d WHERE d.A13 = (SELECT MAX(A13) FROM district)	financial
SELECT a.district_id, COUNT(a.account_id) AS total_accounts FROM account a JOIN district d ON a.district_id = d.A16 WHERE a.date BETWEEN '1996-01-01' AND '1996-12-31' GROUP BY a.district_id ORDER BY total_accounts DESC LIMIT 1;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND t.balance < 0;	financial
SELECT COUNT(*) FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.date BETWEEN '1995-01-01' AND '1997-12-31' AND loan.amount >= 250000 AND account.frequency = 'POPLATEK MESICNE' AND loan.status = 'A';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id JOIN district d ON d.district_id = (SELECT district_id FROM client WHERE client_id = a.account_id) WHERE d.A2 = 'Hl.m. Praha' AND (l.status = 'C' OR l.status = 'D');	financial
SELECT COUNT(c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A15 = (     SELECT MAX(A15)      FROM district      WHERE A15 < (SELECT MAX(A15) FROM district) ) AND c.gender = 'M';	financial
SELECT COUNT(*) FROM card WHERE type = "gold" AND disp_id IN (SELECT disp_id FROM disp WHERE type = "OWNER");	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.A2  WHERE district.A2 = 'Pisek';	financial
SELECT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.district_id = t.district_id WHERE t.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY d.A2 HAVING SUM(t.amount) > 10000;	financial
SELECT a.account_id FROM account a JOIN order o ON a.account_id = o.order_id JOIN trans t ON o.order_id = t.k_symbol JOIN district d ON a.district_id = d.A2 WHERE d.A2 = 'Pisek' AND t.k_symbol = 'SIPO';	financial
SELECT DISTINCT a.account_id FROM account a JOIN card c ON a.account_id = c.disp_id WHERE c.type = 'gold' JOIN disp d ON a.account_id = d.account_id;	financial
SELECT AVG(t.amount) as average_credit_card_amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU' AND t.date BETWEEN '2021-01-01' AND '2021-12-31' GROUP BY MONTH(t.date);	financial
SELECT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.operation = 'VYBER KARTOU' AND t.amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND YEAR(t.date) = 1998) AND YEAR(t.date) = 1998;	financial
SELECT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN loan l ON a.account_id = l.account_id JOIN card cr ON a.account_id = cr.disp_id WHERE c.gender = 'F';	financial
SELECT COUNT(a.account_id) FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.A3 WHERE c.gender = 'F' AND d.A3 = 'South Bohemia';	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.account_id IN (SELECT account_id FROM account WHERE account_type = 'OWNER');	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id NOT IN (     SELECT account_id     FROM account     WHERE account_type = 'OWNER' ) AND d.A11 BETWEEN 8000 AND 9000;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.A3 JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB';	financial
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.A2 = (SELECT A2 FROM district WHERE A2 = d.A2) JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';	financial
SELECT AVG(t.A15) AS avg_crimes FROM district AS d JOIN account AS a ON d.district_id = a.district_id WHERE d.A15 > 4000 AND a.date >= '1997-01-01' AND a.date < '1998-01-01';	financial
SELECT COUNT(c.card_id)  FROM card c JOIN account a ON c.disp_id = a.account_id WHERE c.type = 'classic' AND a.account_type = 'OWNER';	financial
SELECT COUNT(client_id)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M';	financial
SELECT      ROUND(         (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) * 100.0) /          COUNT(*),         2     ) AS gold_card_percentage FROM      card;	financial
SELECT c.client_id, c.gender, c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT SUM(d.A15) AS total_crimes FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id = 532;	financial
SELECT a.district_id FROM account a JOIN order o ON a.district_id = o.account_id WHERE o.order_id = 33333;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.account_id = c.client_id WHERE c.client_id = 3356 AND t.operation = 'VYBER';	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT c.type FROM card c JOIN client cl ON c.card_id = cl.client_id WHERE cl.client_id = 13539;	financial
SELECT d.A3  FROM client c  JOIN district d ON c.district_id = d.A3  WHERE c.client_id = 3541;	financial
SELECT d.A2, COUNT(a.account_id) AS total_accounts FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.A2 ORDER BY total_accounts DESC LIMIT 1;	financial
SELECT a.account_id FROM account a JOIN order o ON a.account_id = o.account_id WHERE o.order_id = 32423;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A5 = '65';	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.A2 WHERE district.A2 = 'Jesenik';	financial
SELECT DISTINCT c.client_id FROM client c JOIN card cd ON c.client_id = cd.disp_id JOIN disp d ON c.client_id = d.client_id WHERE cd.type = 'junior' AND cd.issued >= '1997-01-01';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS percentage_female FROM      client c JOIN      account a ON c.district_id = a.district_id JOIN      district d ON a.district_id = d.A11 WHERE      d.A11 IN (SELECT A11 FROM district WHERE A11 > 10000)	financial
SELECT      ((SUM(CASE WHEN L.date BETWEEN '1997-01-01' AND '1997-12-31' THEN L.amount ELSE 0 END) -       SUM(CASE WHEN L.date BETWEEN '1996-01-01' AND '1996-12-31' THEN L.amount ELSE 0 END)) /       SUM(CASE WHEN L.date BETWEEN '1996-01-01' AND '1996-12-31' THEN L.amount ELSE 0 END) * 100) AS growth_rate FROM      loan L JOIN      account A ON L.account_id = A.account_id JOIN      client C ON A.district_id = C.district_id WHERE      C.gender = 'M';	financial
SELECT COUNT(*)  FROM trans  WHERE type = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT      (SUM(CASE WHEN d.A3 = 'central Bohemia' AND a.date BETWEEN '1996-01-01' AND '1996-12-31' THEN 1 ELSE 0 END) -      SUM(CASE WHEN d.A3 = 'Prague' AND a.date BETWEEN '1996-01-01' AND '1996-12-31' THEN 1 ELSE 0 END)) AS crime_difference FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      a.date BETWEEN '1996-01-01' AND '1996-12-31';	financial
SELECT COUNT(*) FROM 'disp' WHERE 'account_id' BETWEEN 1 AND 10;	financial
-- Query to find how often account number 3 requests an account statement to be released SELECT COUNT(*) as statement_release_frequency FROM `trans` WHERE `account_id` = 3 AND `type` = "PRIJEM" AND `k_symbol` = "VYDAJ STANU";  -- Query to calculate the total amount debited for a specific k_symbol SELECT SUM(`amount`) as total_debit FROM `trans` WHERE `account_id` = 3 AND `type` = "VYDAJ" AND `k_symbol` = "3539";	financial
SELECT c.birth_date  FROM client c  JOIN account a ON c.client_id = a.account_id  WHERE a.account_id = 130;	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN trans t ON a.account_id = t.account_id WHERE t.k_symbol IS NOT NULL AND t.k_symbol LIKE '%POPLATEK PO OBRATU%';	financial
SELECT l.amount, l.status FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE c.client_id = 992;	financial
SELECT SUM(t.amount) AS total_amount, c.gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.account_id = c.client_id WHERE t.account_id = (SELECT account_id FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Kolin' AND A3 = 'central Bohemia')) AND c.client_id = 4 AND t.trans_id = 851;	financial
SELECT c.type FROM card c JOIN client_account ca ON c.card_id = ca.card_id JOIN client cl ON ca.client_id = cl.client_id WHERE cl.client_id = 9;	financial
SELECT SUM(amount) AS total_amount FROM trans WHERE account_id = 617 AND date BETWEEN '1998-01-01' AND '1998-12-31';	financial
SELECT c.client_id FROM client c JOIN district d ON c.district_id = d.A2 JOIN account a ON c.district_id = a.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A2 = 'Kolin';	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN trans t ON c.client_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.operation = 'SIPO' AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND account.date > '1996-01-01';	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id WHERE c.gender = 'F' AND crd.type = 'junior';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0) / COUNT(c.client_id) AS female_account_percentage FROM      account a JOIN      client c ON a.account_id = c.client_id JOIN      district d ON a.district_id = d.district_id WHERE      d.A3 = 'Prague';	financial
SELECT      (COUNT(CASE WHEN c.gender = 'M' AND a.frequency = 'POPLATEK TYDNE' THEN 1 END) * 100.0) /      COUNT(CASE WHEN a.frequency = 'POPLATEK TYDNE' THEN 1 END) AS percentage_male_weekly_statements FROM      client c JOIN      account a ON c.district_id = a.district_id	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c JOIN account a ON c.district_id = a.district_id WHERE a.frequency = 'POPLATEK TYDNE' AND c.gender = 'M';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < "1997-01-01" ORDER BY l.amount ASC LIMIT 1;	financial
SELECT ac.account_id FROM account ac JOIN client cl ON ac.district_id = cl.district_id JOIN district dis ON ac.district_id = dis.district_id WHERE cl.gender = 'F' AND dis.A11 = (SELECT MIN(A11) FROM district) ORDER BY cl.client_id LIMIT 1;	financial
SELECT COUNT(*) FROM client WHERE YEAR(birth_date) = 1920 AND district_id IN (SELECT district_id FROM district WHERE A3 = 'east Bohemia');	financial
SELECT COUNT(a.account_id)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE';	financial
SELECT      l.date AS transaction_date,     AVG(l.amount) AS average_loan_amount FROM      loan l JOIN      trans t ON l.account_id = t.account_id AND l.date = t.date WHERE      l.status IN ('C', 'D') AND t.type = 'POPLATEK PO OBRATU' GROUP BY      l.date ORDER BY      l.date;	financial
SELECT c.client_id, d.district_id FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.account_id IS NOT NULL;	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card crd ON d.disp_id = crd.disp_id JOIN account acc ON d.account_id = acc.account_id JOIN loan ln ON acc.account_id = ln.account_id WHERE crd.type = 'gold' AND ln.status = 'A';	financial
SELECT `bond_type`, COUNT(*) AS count FROM `bond` GROUP BY `bond_type` ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl';	toxicology
SELECT AVG(CASE WHEN a.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM bond b JOIN connected c ON b.bond_id = CONCAT(c.atom_id, '_', c.atom_id2) JOIN atom a ON c.atom_id = a.molecule_id OR c.atom_id2 = a.molecule_id WHERE b.bond_type = '-' GROUP BY b.molecule_id;	toxicology
SELECT AVG(CASE WHEN m.label = '+' THEN COUNT(b.bond_id) ELSE 0 END) / COUNT(a.atom_id)  FROM molecule m JOIN bond b ON m.label = '+' AND b.bond_type = '-' JOIN atom a ON m.label = '+' AND a.atom_id = b.atom_id	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-';	toxicology
SELECT b.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+';	toxicology
SELECT      SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.atom_id) FROM      atom a JOIN      bond b ON a.atom_id = b.atom_id WHERE      b.molecule_id IN (SELECT m.label FROM molecule m WHERE m.label = '+' OR m.label = '-')     AND b.atom_id2 IN (SELECT a2.atom_id FROM atom a2 WHERE a2.element = 'c' AND a2.atom_id = b.atom_id)	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = "=";	toxicology
SELECT COUNT(*) FROM atom WHERE element <> 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE a.element = 'c';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT a1.element AS element1, a2.element AS element2 FROM atom a1 JOIN bond b ON a1.molecule_id = b.molecule_id JOIN atom a2 ON a2.molecule_id = b.molecule_id AND a1.atom_id != a2.atom_id WHERE b.bond_type = '=' AND a1.atom_id < a2.atom_id;	toxicology
SELECT m.label, COUNT(a.atom_id) as atom_count FROM atom a JOIN molecule m ON a.molecule_id = m.label WHERE a.element = 'h' GROUP BY m.label ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT b.bond_type FROM atom a JOIN connected c ON a.molecule_id = c.bond_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id2 JOIN connected c2 ON c1.bond_id = c2.bond_id AND c2.atom_id2 = a1.atom_id JOIN molecule m ON a1.molecule_id = m.label WHERE m.label = '-' AND a1.atom_id < a2.atom_id;	toxicology
SELECT element, COUNT(*) AS count FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY count ASC LIMIT 1;	toxicology
SELECT bond_type  FROM bond  WHERE bond_id = 'TR004_8_TR004_20' OR bond_id = 'TR004_20_TR004_8';	toxicology
SELECT DISTINCT m.label FROM molecule m WHERE m.label NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element != 'sn' )	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element IN ('i', 's') AND b.bond_type = '-';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN bond b ON a.atom_id = b.bond_id WHERE b.bond_type = '#' AND a.atom_id IN (SELECT atom_id2 FROM connected);	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.molecule_id WHERE b.molecule_id = 'TR181';	toxicology
SELECT      ROUND(DIVIDE(SUM(CASE WHEN a.element = 'f' THEN 1 ELSE 0 END) * 100, COUNT(DISTINCT m.molecule_id)), 2) AS percentage_fluorine_free_carcinogens FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      m.label = '+' AND a.element <> 'f';	toxicology
SELECT      ROUND((SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) * 100) / COUNT(b.bond_id), 2) AS percent_carcinogenic_triple_bonds FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.label = '+' AND b.bond_type = '#'	toxicology
SELECT element, COUNT(*) as occurrences FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY occurrences DESC, element ASC LIMIT 3;	toxicology
SELECT a1.atom_id AS Atom1, a2.atom_id AS Atom2 FROM atom a1 JOIN bond b ON a1.atom_id = SUBSTRING(b.bond_id, 1, CHAR_LENGTH(b.bond_id) - 2) JOIN atom a2 ON a2.atom_id = SUBSTRING(b.bond_id, -2, CHAR_LENGTH(b.bond_id)) WHERE b.bond_id = 'TR001_2_6' AND a1.atom_id != a2.atom_id;	toxicology
SELECT (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule;	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON (c.atom_id = b.bond_id OR c.atom_id2 = b.bond_id) WHERE b.bond_id = 'TR000_2_5'	toxicology
SELECT c1.bond_id FROM connected c1 WHERE c1.atom_id2 = 'TR000_2' AND EXISTS (     SELECT 1     FROM connected c2     WHERE c2.bond_id = c1.bond_id     AND c2.atom_id2 = 'TR000_2' );	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY m.label ASC LIMIT 5;	toxicology
SELECT     ROUND(DIVIDE(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END), COUNT(bond_id)) * 100, 5) AS percent FROM     bond WHERE     molecule_id = 'TR008';	toxicology
SELECT ROUND((SUM(CASE WHEN 'label' = '+' THEN 1 ELSE 0 END) * 100.0) / COUNT('molecule_id'), 3) AS percent FROM molecule;	toxicology
SELECT ROUND(DIVIDE(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END), COUNT(a.atom_id)), 4) AS percent FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.molecule_id = 'TR206'	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id = "TR000";	toxicology
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR060';	toxicology
SELECT      bond_type,      COUNT(bond_type) AS bond_count,     CASE          WHEN COUNT(bond_type) = (SELECT MAX(bond_count) FROM (SELECT bond_type, COUNT(bond_type) AS bond_count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type) AS bond_counts) THEN 'Yes'         ELSE 'No'     END AS is_majority FROM      bond  WHERE      molecule_id = 'TR010'  GROUP BY      bond_type;	toxicology
SELECT c1.molecule_id FROM connected c1 JOIN bond b ON c1.bond_id = b.bond_id JOIN molecule m ON c1.molecule_id = m.molecule_id WHERE m.label = '-' AND b.bond_id LIKE 'TR%_1_%' GROUP BY c1.molecule_id ORDER BY c1.molecule_id ASC LIMIT 3;	toxicology
SELECT b.bond_id, b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR006' ORDER BY b.bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br';	toxicology
SELECT bond.bond_type, connected.atom_id, connected.atom_id2 FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR001_6_9';	toxicology
SELECT m.label AS molecule_label, m.label = '+' AS is_carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';	toxicology
SELECT COUNT(bond_id) AS connections_count FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19';	toxicology
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'p' OR a2.element = 'p' AND a1.element = 'n' OR a2.element = 'n';	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT COUNT(b.bond_id) / COUNT(a.atom_id) AS average_bonds_per_atom FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'i';	toxicology
SELECT bond.bond_id, bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE atom_id = 'TR000_45' OR atom_id2 = 'TR000_45'	toxicology
SELECT a.element FROM atom a LEFT JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id IS NULL;	toxicology
SELECT a1.atom_id, a2.atom_id FROM atom a1 JOIN bond b ON a1.atom_id = b.bond_id JOIN connected c1 ON b.bond_id = c1.bond_id JOIN connected c2 ON a1.atom_id = c2.atom_id JOIN connected c3 ON a2.atom_id = c3.atom_id JOIN atom a2 ON c2.atom_id2 = a2.atom_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#' AND c1.atom_id2 = c3.atom_id;	toxicology
SELECT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE c.bond_id = 'TR144_8_19';	toxicology
SELECT      m.molecule_id,      COUNT(b.bond_type) AS double_bond_count FROM      molecule m JOIN      bond b ON m.molecule_id = b.molecule_id WHERE      m.label = '+' AND b.bond_type = '=' GROUP BY      m.molecule_id ORDER BY      double_bond_count DESC LIMIT 1;	toxicology
SELECT element, COUNT(*) as frequency FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY frequency ASC LIMIT 1;	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'pb';	toxicology
SELECT a.element FROM atom a JOIN bond b ON a.atom_id = b.bond_id WHERE b.bond_type = '#';	toxicology
SELECT      (COUNT(bond_id) /      (SELECT COUNT(DISTINCT atom_id)       FROM connected       WHERE bond_id IN         (SELECT bond_id          FROM connected          GROUP BY bond_id          ORDER BY COUNT(bond_id) DESC          LIMIT 1))) * 100 AS percentage FROM connected;	toxicology
SELECT ROUND((SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) * 100) / COUNT(bond_id), 5) AS carcinogenic_single_bond_proportion FROM bond WHERE bond_type = '-';	toxicology
SELECT COUNT(*) AS total_atoms FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT DISTINCT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 's';	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'sn' OR a2.element = 'sn';	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '-'  GROUP BY a.molecule_id;	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_triple_bond_atoms FROM atom a JOIN bond b ON a.atom_id = b.bond_id OR a.atom_id = b.bond_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br')	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100 AS chlorine_percentage FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-' AND a.element = 'cl'	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element  FROM connected AS c  JOIN bond AS b ON c.bond_id = b.bond_id  JOIN atom AS a ON c.atom_id = a.atom_id  WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT bond.bond_id) FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'i';	toxicology
SELECT      m.molecule_id,     MAX(m.label) AS carcinogenicity FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.element = 'ca' GROUP BY      a.molecule_id ORDER BY      carcinogenicity DESC;	toxicology
SELECT COUNT(*)  FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_id = 'TR001_1_8'  AND (a1.element = 'cl' OR a2.element = 'cl') AND (a1.element = 'c' OR a2.element = 'c');	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c' AND b.bond_type = '=' AND m.label = '-';	toxicology
SELECT      ROUND((SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.molecule_id)) * 100, 2) AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR001' AND a.element != 'h';	toxicology
SELECT bond.molecule_id FROM bond WHERE bond_type = '='	toxicology
SELECT DISTINCT c1.atom_id, c2.atom_id2 FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#' AND c1.atom_id < c2.atom_id;	toxicology
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(*) FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';	toxicology
SELECT m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '=' AND molecule.label = '+';	toxicology
SELECT      a.element  FROM      atom a  JOIN      molecule m ON a.molecule_id = m.molecule_id  WHERE      m.label = '+'      AND LENGTH(a.atom_id) - LENGTH(REPLACE(a.atom_id, '4', '')) = 3;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) * 1.0) / COUNT(*) AS ratio,     m.label FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' AND m.label = '+' GROUP BY      m.label;	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE atom.element = 'c';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT      (SELECT COUNT(*)       FROM bond       WHERE bond_type = '#') * 100.0 /      (SELECT COUNT(*)       FROM molecule) AS triple_bond_percentage;	toxicology
SELECT      (SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) * 100.0) / COUNT(bond.bond_id) AS percent FROM      bond JOIN      connected ON bond.bond_id = connected.bond_id WHERE      connected.molecule_id = 'TR047'	toxicology
SELECT m.label AS molecule_label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1';	toxicology
SELECT COUNT(*)  FROM molecule  WHERE molecule_id = 'TR151' AND label = '+';	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'br', 'i', 'sn', 'pb', 'te');	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050'   AND a.element = 'c';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '=';	toxicology
SELECT COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'h';	toxicology
SELECT `molecule_id` FROM `connected` JOIN `bond` ON `connected.bond_id` = `bond.bond_id` WHERE `connected.atom_id` = 'TR000_1' OR `connected.atom_id2` = 'TR000_1' AND `bond.bond_id` = 'TR000_1_2';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '+' EXCEPT SELECT c.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a2 ON b.bond_id = a2.atom_id WHERE a2.element = 'c' AND b.bond_type = '=';	toxicology
SELECT      ROUND(         (SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.molecule_id)) * 100.0,          2     ) AS percentage_of_carcinogenic_molecules_with_hydrogen FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+';	toxicology
SELECT      m.molecule_id,      m.label FROM      molecule m WHERE      m.molecule_id = 'TR124' AND      m.label = '+';	toxicology
SELECT a.atom_id, a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.molecule_id = 'TR186';	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';	toxicology
SELECT a1.element AS Element1, a2.element AS Element2 FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_2_4' AND a1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca') AND a2.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT      COUNT(b.bond_type) AS double_bonds_count,      CASE          WHEN m.label = '+' THEN 'Carcinogenic'          ELSE 'Non-carcinogenic'      END AS carcinogenicity FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      b.molecule_id = 'TR006' AND      b.bond_type = '=\''	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');	toxicology
SELECT bond.bond_id, atom1.element AS atom1_element, atom2.element AS atom2_element FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id WHERE bond.bond_type = '-';	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element) AS elements FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '=' GROUP BY m.molecule_id	toxicology
SELECT a1.element AS Atom1_Element, a2.element AS Atom2_Element FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(*) FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'cl';	toxicology
SELECT atom_id, COUNT(bond.bond_type) AS bond_types_count FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.molecule_id = 'TR346' GROUP BY atom.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS double_bonded_carcinogenic_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  LEFT JOIN atom a ON m.molecule_id = a.molecule_id  LEFT JOIN bond b ON a.atom_id = b.bond_id AND b.bond_type = '=' WHERE a.element <> 's' AND b.bond_id IS NULL;	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+';	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT      DIVIDE(SUM(CASE WHEN label = '+' AND element = 'cl' THEN 1 ELSE 0 END), COUNT(DISTINCT molecule_id)) AS percentage FROM      atom JOIN      molecule ON atom.molecule_id = molecule.molecule_id WHERE      label = '+';	toxicology
SELECT `molecule_id`  FROM `bond`  WHERE `bond_id` = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT a.element) AS unique_elements FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_3_4';	toxicology
SELECT bond_type FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2';	toxicology
SELECT m.label AS molecule_label FROM molecule m JOIN atom a1 ON m.molecule_id = a1.molecule_id JOIN atom a2 ON m.molecule_id = a2.molecule_id WHERE a1.atom_id = 'TR000_2' OR a2.atom_id = 'TR000_4';	toxicology
SELECT element  FROM atom  WHERE atom_id = 'TR000_1';	toxicology
SELECT   CASE      WHEN m.label = '+' THEN 'Carcinogenic'     ELSE 'Non-carcinogenic'   END AS carcinogenicity FROM   molecule m WHERE   m.molecule_id = 'TR000';	toxicology
SELECT     ROUND(DIVIDE(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END), COUNT(a.atom_id)), 2) AS percentage FROM     atom a JOIN     connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN     bond b ON c.bond_id = b.bond_id;	toxicology
SELECT COUNT(*) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'n' AND molecule.label = '+';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON a.atom_id = b.molecule_id WHERE a.element = 's' AND b.bond_type = ' = ';	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR024' AND b.bond_type = '=';	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT      (SUM(CASE WHEN a.element = 'h' AND b.bond_type = '#' THEN 1 ELSE 0 END) * 100.0) / COUNT(a.molecule_id) AS percentage_carcinogenic_triple_bond_hydgens FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN      bond b ON c.bond_id = b.bond_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND EXISTS (     SELECT 1     FROM bond     JOIN connected ON bond.bond_id = connected.bond_id     WHERE bond.molecule_id = molecule.molecule_id     AND bond.bond_type = '-' );	toxicology
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR004_7' AND m.label = '-'	toxicology
SELECT COUNT(DISTINCT c.molecule_id)  FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 'o' AND b.bond_type = ' = ';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR002';	toxicology
SELECT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a1.element = 'c' AND b.bond_type = ' = ' AND a1.molecule_id = 'TR012';	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT c.* FROM cards c WHERE c.borderColor = 'borderless' AND (c.cardKingdomFoilId IS NULL OR c.cardKingdomId IS NULL)	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name, c.scryfallId FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Artifact%' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.id FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.text LIKE '%Illustrated by Stephen Daniel%' AND c.artist = 'Stephen Daniel' UNION SELECT c.id FROM cards c WHERE c.artist = 'Stephen Daniel' AND c.id NOT IN (SELECT id FROM foreign_data WHERE text LIKE '%Illustrated by Stephen Daniel%');	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1;	card_games
SELECT language, name, text FROM foreign_data WHERE name = 'Annul' AND number = '29';	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN s.language = 'Chinese Simplified' THEN s.id ELSE 0 END) * 100.0) / COUNT(s.id) AS percentage_chinese_simplified FROM      set_translations s;	card_games
SELECT      sets.name,      sets.totalSetSize FROM      sets  JOIN      set_translations ON sets.code = set_translations.setCode WHERE      set_translations.language = 'Italian';	card_games
SELECT COUNT(DISTINCT type) AS numberOfTypes FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes  FROM cards  WHERE name = 'Duress';	card_games
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen';	card_games
SELECT `originalType` FROM `cards` WHERE `originalType` = 'Ancestor''s Chosen'	card_games
SELECT st.translation FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.translation WHERE c.setCode = (SELECT setCode FROM cards WHERE 'setCode' = '10E');	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.status WHERE legalities.status = 'restricted' AND cards.isTextless = 0;	card_games
SELECT r.text FROM cards c JOIN rulings r ON c.name = 'Condemn';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'restricted' AND cards.isStarter = 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Aven Cloudchaser';	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Benalish Knight';	card_games
SELECT artist FROM cards WHERE asciiName = 'Phyrexian';	card_games
SELECT      (COUNT(*) FILTER (WHERE borderColor = 'borderless')) * 100.0 / COUNT(*) AS borderless_percentage FROM      cards;	card_games
SELECT COUNT(*) FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;	card_games
SELECT COUNT(c.id)  FROM cards c  JOIN set_translations st ON c.setCode = st.language  WHERE c.borderColor = 'borderless' AND st.language = 'Russian';	card_games
SELECT      (SELECT COUNT(*)       FROM cards       WHERE language = 'French' AND isStorySpotlight = 1) * 100.0 /      (SELECT COUNT(*)       FROM cards       WHERE isStorySpotlight = 1) AS percentage_of_french_story_spotlight_cards	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords = 'Flying';	card_games
SELECT COUNT(*) FROM cards WHERE type = 'Summon - Angel' AND 'Angel' NOT IN (SUBSTRING_INDEX(SUBSTRING_INDEX(subtypes, ',', -1), ',', 1));	card_games
SELECT id FROM cards WHERE hasFoil = 1 AND (cardKingdomFoilId IS NOT NULL OR cardKingdomId IS NOT NULL) AND id IN (     SELECT cardKingdomId     FROM cards     WHERE hasFoil = 0 AND (cardKingdomFoilId IS NOT NULL OR cardKingdomId IS NOT NULL) );	card_games
SELECT id FROM cards WHERE duelDeck = 'a';	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';	card_games
SELECT c.artist FROM cards c JOIN set_translations st ON c.artist IS NOT NULL AND c.artist = st.translation WHERE st.language = 'Chinese Simplified';	card_games
SELECT c.name  FROM cards c JOIN set_translations st ON c.uuid = st.setCode WHERE c.availability LIKE '%paper%' AND st.setCode LIKE '%Japanese'	card_games
SELECT COUNT(*) FROM cards WHERE status = 'Banned' AND borderColor = 'white';	card_games
SELECT cards.uuid, foreign_data.language FROM cards JOIN legalities ON cards.uuid = legalities.format JOIN foreign_data ON cards.uuid = foreign_data.language WHERE legalities.format = 'legacy';	card_games
SELECT text  FROM rulings  WHERE text LIKE '%Beacon of Immortality%';	card_games
SELECT      c.id,      c.frameVersion,      l.status  FROM      cards c  JOIN      legalities l ON c.uuid = l.uuid  WHERE      c.frameVersion = 'future'      AND l.status = 'Legal';	card_games
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.id = s.id WHERE s.code = 'OGW';	card_games
SELECT c.name, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5.0;	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';	card_games
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20;	card_games
SELECT c.name, c.uuid FROM cards c JOIN foreign_data fd ON c.name = fd.language WHERE c.type = 'Artifact' AND c.colors = 'B';	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND hasContentWarning = 1 AND availability LIKE '%paper%';	card_games
SELECT manaCost  FROM cards  WHERE availability = 'mtgo,paper'    AND frameVersion = '2003'    AND borderColor = 'black'    AND layout = 'normal';	card_games
SELECT SUM(CAST(manaCost AS INTEGER)) AS totalManaCost FROM cards WHERE artist = 'Rob Alexander';	card_games
SELECT DISTINCT 'subtypes' AS type FROM cards WHERE 'availability' = 'mtgo,paper' AND ('subtypes' IS NOT NULL OR 'supertypes' IS NOT NULL) UNION SELECT DISTINCT 'supertypes' AS type FROM cards WHERE 'availability' = 'mtgo,paper' AND 'supertypes' IS NOT NULL;	card_games
SELECT c.setCode FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON c.setCode = s.code WHERE st.language = 'Spanish';	card_games
SELECT DIVIDE(COUNT(CASE WHEN frameEffects = 'legendary' THEN 1 END AND hand IS NOT NULL AND isOnlineOnly = 1 ELSE NULL END), COUNT(id)) FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT      id,      (SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) * 100.0) /      COUNT(*) AS percentage FROM      cards GROUP BY      id HAVING      isStorySpotlight = 1 AND isTextless = 0;	card_games
SELECT name,         ROUND((SUM(CASE WHEN fd.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0) / COUNT(c.id), 2) AS percentage_spanish FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid GROUP BY c.name ORDER BY percentage_spanish DESC;	card_games
SELECT DISTINCT t.translation FROM sets s JOIN set_translations t ON s.code = t.setCode JOIN (     SELECT setCode     FROM sets     WHERE baseSetSize = 309 ) as s2 ON s.code = s2.setCode;	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.type LIKE 'Creature%' AND l.status = 'Legal';	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE subtypes IS NOT NULL AND supertypes IS NOT NULL AND (SELECT translation FROM set_translations WHERE set_translations.setCode = cards.setCode AND set_translations.language = 'German') IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(*) FROM cards WHERE side IS NULL AND EXISTS (     SELECT 1     FROM legalities     WHERE legalities.uuid = cards.uuid     AND EXISTS (         SELECT 1         FROM rulings         WHERE rulings.text = 'This is a triggered mana ability.'         AND rulings.uuid = cards.uuid     ) );	card_games
SELECT cards.id FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.artist = 'Erica Yang' AND legalities.format = 'penny' AND cards.availability LIKE '%paper%';	card_games
SELECT cards.artist FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.text = 'Das perfekte Gegenmittel zu einer dichten Formation';	card_games
SELECT name FROM cards JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.artist = 'Matthew D. Wilson' AND cards.type = 'Creature' AND cards.layout = 'normal' AND cards.borderColor = 'black' AND foreign_data.language = 'French';	card_games
SELECT COUNT(c.id)  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT st.language FROM sets s JOIN set_translations st ON s.baseSetSize = 180 AND s.block = 'Ravnica' WHERE s.baseSetSize = 180;	card_games
SELECT      ROUND((COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) * 100.0) / COUNT(c.id), 2) AS percentage_no_content_warning FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.mtgjsonV4Id = 'commander' AND      l.status = 'Legal';	card_games
SELECT      (COUNT(CASE WHEN f.language = 'French' THEN 1 END) * 100.0) /      COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END) AS percentage_without_power_in_french FROM      foreign_data AS f JOIN      cards AS c ON f.language = 'French'	card_games
SELECT      ROUND((COUNT(CASE WHEN s.type = 'expansion' THEN 1 END) * 100.0) / COUNT(CASE WHEN st.language = 'Japanese' THEN 1 END), 2) AS percentage_japanese_expansion_sets FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Japanese'	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor IS NULL AND colors IS NOT NULL AND edhrecRank > 12000;	card_games
SELECT      SUM(isOversized) AS TotalOversized,     SUM(isReprint) AS TotalReprinted,     SUM(isPromo) AS TotalPromotions FROM cards;	card_games
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseId = '149934';	card_games
SELECT id, cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT      (COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) * 100.0) / COUNT(*) AS proportion FROM      cards	card_games
SELECT number FROM cards WHERE otherFaceIds IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%';	card_games
SELECT s.name, s.code FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3;	card_games
SELECT language  FROM set_translations  JOIN sets ON set_translations.setCode = sets.code  WHERE sets.mcmName = 'Archenemy' AND sets.code = 'ARC';	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.id = st.translation WHERE s.id = 5;	card_games
SELECT st.language, s.type FROM sets s JOIN set_translations st ON s.id = st.id WHERE s.id = 206;	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;	card_games
SELECT s.id FROM sets s WHERE s.isFoilOnly = 1 AND s.isForeignOnly = 1 AND NOT EXISTS (     SELECT 1     FROM set_translations st     WHERE st.language = 'Japanese'     AND st.setCode = s.code );	card_games
SELECT s.name, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode AND st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT      (SELECT COUNT(*) FROM cards WHERE isOnlineOnly = 1) * 100.0 /      (SELECT COUNT(*) FROM cards) AS percentageChineseSimplifiedOnlineOnly FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation LIKE '%核心系列第十版%'	card_games
SELECT COUNT(*) FROM sets WHERE code NOT IN (SELECT setCode FROM set_translations WHERE language = 'Japanese') AND (mtgoCode IS NULL OR mtgoCode = '');	card_games
SELECT id  FROM cards  WHERE borderColor = 'black';	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT name  FROM cards  WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT setCode FROM sets WHERE id = 174);	card_games
SELECT `name` FROM `sets` WHERE `code` = 'ALL';	card_games
SELECT fd.name FROM foreign_data AS fd JOIN cards AS c ON fd.name = c.name WHERE c.name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT baseSetSize, code  FROM sets  WHERE block = 'Masques' OR block = 'Mirage';	card_games
SELECT code  FROM sets  WHERE type = 'expansion';	card_games
SELECT      f.name,      c.type FROM      cards AS c JOIN      foreign_data AS f ON c.watermark = f.name WHERE      c.watermark IS NOT NULL;	card_games
SELECT fd.language, fd.flavorText, c.type FROM cards c JOIN foreign_data fd ON c.type = fd.flavorText WHERE c.watermark = 'colorpie';	card_games
SELECT      ROUND((COUNT(CASE WHEN c.convertedManaCost = 10 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage FROM      cards c JOIN      sets s ON c.setCode = s.id WHERE      s.name = 'Abyssal Horror';	card_games
SELECT code FROM sets WHERE type = 'expansion commander';	card_games
SELECT fd.name, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.name WHERE c.watermark = 'Abzan';	card_games
SELECT fd.language, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'Azorius';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name  FROM cards  WHERE isTextless = 0;	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT c.artist) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.borderColor = 'black' AND c.availability LIKE '%mtgo%' AND c.availability LIKE '%arena%' GROUP BY c.artist;	card_games
SELECT      CASE          WHEN c1.convertedManaCost > c2.convertedManaCost THEN c1.name         WHEN c1.convertedManaCost < c2.convertedManaCost THEN c2.name         ELSE 'Both cards cost the same converted mana'     END AS MoreExpensiveCard FROM      (SELECT 'Serra Angel' AS name, 7.0 AS convertedManaCost) c1 CROSS JOIN      (SELECT 'Shrine Keeper' AS name, 4.0 AS convertedManaCost) c2;	card_games
SELECT artist  FROM cards  WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name, convertedManaCost FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT st.translation  FROM cards AS c  JOIN sets AS s ON c.name = 'Ancestor''s Chosen' JOIN sets AS s2 ON s.code = s2.code JOIN set_translations AS st ON s2.code = st.code WHERE st.language = 'Italian';	card_games
SELECT COUNT(*)  FROM set_translations  WHERE setCode IN (     SELECT setCode      FROM cards      WHERE name = 'Angel of Mercy' );	card_games
SELECT c.name  FROM cards c  JOIN set_translations st ON c.cardKingdomId = st.setCode  JOIN sets s ON st.setCode = s.code  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS(     SELECT 1      FROM cards c      JOIN sets s ON c.setCode = s.code      LEFT JOIN set_translations st ON s.code = st.code AND st.language = 'Korean'     WHERE c.name = 'Ancestor''s Chosen' ) AS has_korean_translation;	card_games
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.id = set_translations.translation WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';	card_games
SELECT sets.baseSetSize  FROM sets  JOIN set_translations ON sets.baseSetSize IS NOT NULL AND sets.baseSetSize = set_translations.baseSetSize  WHERE set_translations.translation = 'Hauptset Zehnte Edition';	card_games
SELECT t.translation  FROM sets s  JOIN set_translations t ON s.name = t.translation  WHERE s.name = 'Eighth Edition' AND t.language = 'Chinese Simplified';	card_games
SELECT      s.name  FROM      cards c  JOIN      sets s ON c.setCode = s.name  WHERE      c.name = 'Angel of Mercy'      AND c.mtgoId IS NOT NULL;	card_games
SELECT s.releaseDate FROM cards c JOIN sets s ON c.setCode = s.releaseDate WHERE c.name = 'Ancestor''s Chosen';	card_games
SELECT s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian';	card_games
SELECT s.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;	card_games
SELECT COUNT(*) FROM sets WHERE baseSetSize < 10 AND EXISTS (     SELECT 1     FROM set_translations     WHERE sets.code = set_translations.setCode     AND set_translations.language = 'Italian' );	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'US06' AND borderColor = 'black';	card_games
SELECT name FROM cards JOIN sets ON cards.setCode = sets.name WHERE sets.name = 'Coldsnap' ORDER BY cards.convertedManaCost DESC LIMIT 1;	card_games
SELECT DISTINCT artist FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT `name`, `number` FROM `cards` JOIN `sets` ON `cards.setCode` = `sets.code` WHERE `sets.name` = 'Coldsnap' AND `cards.number` = '4';	card_games
SELECT COUNT(*) FROM cards C JOIN sets S ON C.setCode = S.code WHERE C.convertedManaCost > 5 AND S.name = 'Coldsnap' AND (C.power = '*' OR C.power IS NULL);	card_games
SELECT ct.translation FROM cards c JOIN set_translations ct ON c.setCode = ct.translation WHERE c.name = 'Ancestor''s Chosen' AND ct.language = 'Italian';	card_games
SELECT st.setCode FROM set_translations st JOIN cards c ON st.setCode = c.setCode WHERE c.name = 'Ancestor''s Chosen' AND c.flavorText IS NOT NULL;	card_games
SELECT type  FROM foreign_data  WHERE language = 'German' AND type LIKE 'Mensch, Kleriker'  AND EXISTS (SELECT 1 FROM cards WHERE cards.name = 'Ancestor''s Chosen' AND cards.uuid = foreign_data.uuid);	card_games
SELECT st.translation FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON c.setCode = st.setCode WHERE s.name = 'Coldsnap' AND st.language = 'Italian';	card_games
SELECT t.translation FROM cards c JOIN sets s ON c.id = s.id JOIN set_translations t ON s.name = t.translation WHERE s.name = 'Coldsnap' AND t.language = 'Italian' AND c.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE id IN (SELECT id FROM sets WHERE name = 'Coldsnap'))	card_games
SELECT 'rulings.date' as when_created FROM 'cards' JOIN 'rulings' ON 'cards.uuid' = 'rulings.uuid' WHERE 'cards.name' = 'Reminisce';	card_games
SELECT      (SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0) /      COUNT(cards.name)  FROM      cards  JOIN      sets ON cards.setCode = sets.code  WHERE      sets.code = '2ED' AND      cards.convertedManaCost = 7;	card_games
SELECT      (SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_incredibly_powerful FROM      cards  JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT `keyruneCode`  FROM `sets`  WHERE `code` = 'PKHC';	card_games
SELECT mcmId FROM 'sets' WHERE code = 'SS2';	card_games
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore';	card_games
SELECT parentCode  FROM sets  WHERE name = 'Commander 2014 Oversized';	card_games
SELECT      c.uuid,      r.text AS ruling_text,      CASE          WHEN c.hasContentWarning = 1 THEN 'Yes'         ELSE 'No'     END AS hasContentWarning FROM      cards c LEFT JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate  FROM sets s  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Evacuation';	card_games
SELECT baseSetSize  FROM sets  JOIN set_translations ON sets.code = set_translations.setCode  WHERE set_translations.translation = 'Rinascita di Alara';	card_games
SELECT type  FROM sets  JOIN set_translations ON sets.name = set_translations.translation  WHERE set_translations.translation = 'Huitième édition';	card_games
SELECT st.translation FROM cards c JOIN set_translations st ON c.name = st.translation JOIN sets s ON st.setCode = s.code WHERE c.name = 'Tendo Ice Bridge' AND st.language = 'French';	card_games
SELECT COUNT(*)  FROM sets  JOIN set_translations ON sets.code = set_translations.id  WHERE sets.name = 'Tenth Edition' AND set_translations.translation IS NOT NULL;	card_games
SELECT st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  JOIN cards c ON s.code = c.setCode  WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese';	card_games
SELECT name, MAX(convertedManaCost) AS maxCMC FROM cards WHERE name = 'Journey into Nyx Hero''s Path' GROUP BY name ORDER BY maxCMC DESC LIMIT 1;	card_games
SELECT s.releaseDate  FROM sets s  JOIN set_translations st ON s.releaseDate = st.setCode  WHERE st.translation = 'Ola de frío';	card_games
SELECT s.type FROM sets s JOIN cards c ON s.type = c.setCode WHERE c.name = 'Samite Pilgrim';	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;	card_games
SELECT st.translation FROM sets s JOIN set_translations st ON s.name = st.translation WHERE s.name = 'Mirrodin' AND st.language = 'Chinese Simplified';	card_games
SELECT      ROUND((SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN s.language = 'Japanese' THEN 1 ELSE 0 END), 2) AS percentage_japanese_non_foil FROM      cards c JOIN      set_translations st ON c.uuid = st.uuid JOIN      sets s ON st.setCode = s.code WHERE      s.language = 'Japanese';	card_games
SELECT      (SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      cards c JOIN      set_translations st ON c.cardKingdomId = st.setCode WHERE      st.language = 'Portuguese (Brazil)';	card_games
SELECT availability  FROM cards  WHERE artist != 'Aleksi Briclot' AND isTextless = 1;	card_games
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets);	card_games
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL)	card_games
SELECT MAX(frameEffects) AS most_common_frame_effect FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*')   AND hasFoil = 0   AND duelDeck = 'a';	card_games
SELECT id  FROM sets  WHERE type = 'commander'  ORDER BY totalSetSize DESC  LIMIT 1;	card_games
SELECT name, MAX(convertedManaCost) AS unconvertedManaCost FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'duel' GROUP BY cards.id ORDER BY unconvertedManaCost DESC LIMIT 10;	card_games
SELECT MIN(originalReleaseDate), c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Legal' GROUP BY c.name, l.format ORDER BY MIN(originalReleaseDate) ASC LIMIT 1;	card_games
SELECT COUNT(c.id) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format ORDER BY COUNT(l.uuid) DESC LIMIT 1;	card_games
SELECT language FROM set_translations  JOIN sets ON sets.code = set_translations.language  WHERE sets.name = 'Battlebond';	card_games
SELECT c.artist, l.format FROM cards c JOIN legalities l ON c.id = l.uuid GROUP BY c.artist, l.format ORDER BY COUNT(c.id) ASC LIMIT 1;	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND c.hasContentWarning = 1 AND l.format = 'legacy';	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT      COUNT(*) / (SELECT COUNT(DISTINCT releaseDate) FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31') AS annual_avg_sets,     MAX(CASE WHEN MAX(COUNT(DISTINCT translation)) > 1 THEN MAX(translation) ELSE NULL END) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' JOIN set_translations ON sets.id = set_translations.translation GROUP BY sets.id;	card_games
SELECT artist  FROM cards  WHERE borderColor = 'black' AND availability LIKE '%arena%';	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'oldschool' AND l.status IN ('banned', 'restricted');	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';	card_games
SELECT r.date, r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT c.name, l.format FROM cards c JOIN sets s ON c.cardKingdomId = s.name JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st1 ON s.code = st1.setCode AND st1.language = 'Korean' LEFT JOIN set_translations st2 ON s.code = st2.setCode AND st2.language LIKE '%Japanese%' WHERE st2.setCode IS NULL;	card_games
SELECT c.frameVersion FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' UNION SELECT c.frameVersion FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned';	card_games
SELECT MAX('Reputation') AS Reputation FROM 'users' WHERE 'DisplayName' IN ("Harlan", "Jarrod Dixon");	codebase_community
SELECT DisplayName  FROM users  WHERE YEAR(CreationDate) = 2011;	codebase_community
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT `DisplayName` FROM `users` ORDER BY `Views` DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u WHERE u.Views > 10 AND YEAR(u.CreationDate) > 2013;	codebase_community
SELECT COUNT(*)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.DisplayName WHERE p.Title = 'Eliciting priors from experts';	codebase_community
SELECT Title  FROM posts  JOIN users ON posts.OwnerUserId = users.DisplayName  WHERE users.DisplayName = 'csgillespie'  ORDER BY ViewCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(CommentCount) as TotalComments FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT p.AnswerCount  FROM posts p  JOIN users u ON p.Id = u.Id  WHERE u.DisplayName = 'csgillespie'  ORDER BY p.AnswerCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM posts p JOIN users u ON p.LastEditorUserId = u.DisplayName WHERE p.Title = "Examples for teaching: Correlation does not mean causation"	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.Id = u.Id WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location FROM users u JOIN posts p ON u.OwnerUserId = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.ExcerptPostId IS NOT NULL AND p.Body LIKE '%bayesian%';	codebase_community
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(*)  FROM badges  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT Name  FROM badges  WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(posts.Score)  FROM posts  JOIN users ON posts.OwnerUserId = users.Id  WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(b.CountOfBadges) as AverageBadges FROM (     SELECT COUNT(b.Id) as CountOfBadges     FROM badges b     JOIN users u ON b.UserId = u.Id     WHERE u.Views > 200     GROUP BY b.UserId ) as b;	codebase_community
SELECT      (COUNT(CASE WHEN u.Age > 65 THEN p.Id END) * 100.0) / COUNT(p.Id) AS ElderUserPercentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE CreationDate = '2010-07-19' AND UserId = 58;	codebase_community
SELECT MAX(`CreationDate`)  FROM `votes` GROUP BY `CreationDate` ORDER BY COUNT(`Id`) DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM badges  WHERE Name = 'Revival';	codebase_community
SELECT p.Title  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT c.CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910;	codebase_community
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014/04/23 20:29:39.0';	codebase_community
SELECT Text  FROM comments  WHERE PostId = 107829  LIMIT 1;	codebase_community
SELECT      p.Id,     p.Title,     p.ClosedDate FROM      posts p JOIN      comments c ON p.Id = c.PostId WHERE      c.UserId = 23853 AND      c.CreationDate = '2013-07-12 09:08:18.0' AND      (p.ClosedDate IS NULL OR p.ClosedDate IS NOT NULL);	codebase_community
SELECT u.Reputation  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 65041;	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini';	codebase_community
SELECT u.DisplayName  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE v.Id = 6347;	codebase_community
SELECT COUNT(v.Id) AS VoteCount FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT      (COUNT(posts.Id) - COUNT(votes.Id)) / NULLIF(COUNT(votes.Id), 0) AS post_vote_ratio FROM      posts LEFT JOIN      votes ON posts.Id = votes.Id WHERE      posts.OwnerUserId = 24;	codebase_community
SELECT ViewCount  FROM posts  WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName  FROM users  WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.Id = u.Id WHERE u.DisplayName = 'SilentGhost';	codebase_community
SELECT u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.DisplayName  WHERE c.Text = 'thank you user93'	codebase_community
SELECT c.Id, c.PostId, c.Score, c.Text, c.CreationDate, c.UserId, c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = "Understanding what Dassault iSight is doing?"	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName  FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.DisplayName WHERE p.Title = 'Open source tools for visualizing multi-dimensional data';	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.PostId, c.UserId, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(BountyAmount) AS TotalBountyAmount FROM posts JOIN votes ON posts.OwnerUserId = votes.PostId WHERE posts.Title LIKE '%data%';	codebase_community
SELECT u.DisplayName FROM votes v JOIN users u ON v.UserId = u.DisplayName JOIN posts p ON v.PostId = p.Body WHERE v.BountyAmount = 50 AND p.Body LIKE '%variance%';	codebase_community
SELECT p.Title, AVG(p.ViewCount) AS AvgViewCount, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Id IN (     SELECT PostId     FROM comments     WHERE Text LIKE '%<humor>%' ) GROUP BY p.Id;	codebase_community
SELECT COUNT(*)  FROM comments  WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT badges.UserId)  FROM badges  WHERE badges.Name = 'Supporter' AND strftime('%Y', badges.Date) = '2011';	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  WHERE b.UserId IN (SELECT u.Id                    FROM users u                    JOIN badges b2 ON u.Id = b2.UserId                    GROUP BY u.Id                    HAVING COUNT(b2.Id) > 5);	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'New York, NY' AND b.Name IN ('Teacher', 'Supporter');	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;	codebase_community
SELECT ph.UserId FROM postHistory ph JOIN posts p ON ph.PostId = p.PostId GROUP BY ph.UserId HAVING COUNT(DISTINCT ph.PostId) = 1 AND p.ViewCount >= 1000;	codebase_community
SELECT u.DisplayName, b.Name FROM users u JOIN comments c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Teacher' GROUP BY u.DisplayName, b.Name ORDER BY COUNT(c.Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      (100.0 * (COUNT(CASE WHEN Year(b.Date) = 2010 THEN 1 END) - COUNT(CASE WHEN Year(b.Date) = 2011 THEN 1 END)) /      (COUNT(CASE WHEN Year(b.Date) = 2010 THEN 1 END) + COUNT(CASE WHEN Year(b.Date) = 2011 THEN 1 END)) * 100 AS percentage_difference FROM badges b WHERE b.Name = 'Student';	codebase_community
SELECT PostHistoryTypeId FROM postHistory WHERE PostId = 3720;  SELECT COUNT(DISTINCT UserId) AS UniqueCommenters FROM comments WHERE PostId = 3720;	codebase_community
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.postID = pl.postID WHERE p.postID = 395;	codebase_community
SELECT p.Id AS PostId FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Id IN (SELECT Id FROM users)   AND EXISTS (SELECT 1 FROM posts WHERE OwnerUserId = u.Id AND Score > 60);	codebase_community
SELECT SUM(FavoriteCount)  FROM posts  WHERE Year(CreaionDate) = 2011  AND OwnerUserId = 686;	codebase_community
SELECT AVG(u.UpVotes) + AVG(u.Age) AS avg_upvotes_and_age FROM users u JOIN (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(*) > 10 ) p ON u.Id = p.OwnerUserId;	codebase_community
SELECT COUNT(DISTINCT 'badges.UserId') FROM 'badges' WHERE 'badges.Name' = "Announcer" AND 'badges.UserId' IN (SELECT 'users.Id' FROM 'users');	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*)  FROM comments  WHERE Score > 60;	codebase_community
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score = 10;	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = "Rochester, NY";	codebase_community
SELECT     (COUNT(b.UserId) * 100.0) / COUNT(u.Id) AS PercentageOfTeachers FROM     badges b JOIN     users u ON b.UserId = u.Id WHERE     b.Name = 'Teacher'	codebase_community
SELECT      ROUND(         (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN b.UserId END) * 100.0) /          COUNT(b.UserId),          2     ) AS Teenager_Percentage FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'	codebase_community
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56.0';	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0' AND PostId IN (SELECT Id FROM posts);	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = "Vienna, Austria";	codebase_community
SELECT COUNT(DISTINCT u.UserId)  FROM badges b  JOIN users u ON b.UserId = u.UserId  WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views FROM users u JOIN badges b ON u.UserId = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users);	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = "Sharpie";	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `DisplayName` = 'Geoff Dalgas';	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName  FROM users  WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT DIVIDE(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END), COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END)) AS VoteRatio FROM votes;	codebase_community
SELECT T1.TagName FROM tags AS T1 JOIN users AS T2 ON T1.ExcerptPostId IS NOT NULL AND T2.OwnerUserId = T1.ExcerptPostId WHERE T2.DisplayName = 'John Salvatier';	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Id IN (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId NOT IN (SELECT Id FROM users WHERE DisplayName = 'Harlan')	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.Id = u.DisplayName WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT      CASE          WHEN MAX(SUM(p.ViewCount)) OVER (PARTITION BY u.DisplayName) =               (SELECT MAX(SUM(p.ViewCount)) FROM posts p JOIN users u ON p.OwnerUserId = u.Id                WHERE u.DisplayName = 'Harvey Motulsky') THEN 'Harvey Motulsky'         ELSE 'Noah Snyder'     END AS MorePopularAuthor FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY      u.DisplayName;	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Matt Parker' AND p.Id IN (SELECT PostId FROM votes WHERE VoteTypeId = 2 GROUP BY PostId HAVING COUNT(*) > 4);	codebase_community
SELECT COUNT(*) FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.TagName = p.TagName LEFT JOIN comments c ON p.Id = c.PostId JOIN users u ON p.Id = u.Id WHERE u.DisplayName = 'Mark Meckes' AND c.PostId IS NULL GROUP BY t.TagName HAVING COUNT(c.PostId) = 0;	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer';	codebase_community
SELECT      (COUNT(CASE WHEN t.TagName = 'r' THEN p.Id END) * 100.0) /      COUNT(p.Id) AS percentage FROM      posts p JOIN      tags t ON p.Id = t.ExcerptPostId JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.DisplayName = 'Community';	codebase_community
SELECT      (SELECT SUM(ViewCount)       FROM posts p       JOIN users u ON p.OwnerUserId = u.Id       WHERE u.DisplayName = 'Mornington') -      (SELECT SUM(ViewCount)       FROM posts p       JOIN users u ON p.OwnerUserId = u.Id       WHERE u.DisplayName = 'Amos') AS DifferenceInViewCount;	codebase_community
SELECT COUNT(DISTINCT b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = "Commentator" AND EXTRACT(YEAR FROM b.Date) = 2014;	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT u.DisplayName, u.Age FROM users u JOIN posts p ON u.Age = p.ViewCount WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts);	codebase_community
SELECT p.LastEditDate, p.LastEditorUserId FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.LastEditorUserId IS NOT NULL AND u.DisplayName = 'Community' AND p.Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(*) FROM comments WHERE Score < 60 AND UserId = 13;	codebase_community
SELECT posts.Title, users.DisplayName FROM comments JOIN posts ON comments.PostId = posts.PostId JOIN users ON comments.UserId = users.UserId WHERE comments.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
SELECT      ph.PostId,      COUNT(ph.Id) AS PostHistoryCount,      MAX(p.LastEditDate) AS LastEditDate FROM      postHistory ph JOIN      posts p ON ph.PostId = p.Id JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY      ph.PostId;	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers';	codebase_community
SELECT p.Title AS RelatedPostTitle FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = "How to tell if something happened in a data set which monitors a value over time" AND pl.RelatedPostId = p.Id;	codebase_community
SELECT p.Id, b.Name FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Samuel' AND YEAR(b.Date) = 2013;	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.TagName WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName AS ParentDisplayName FROM posts AS p JOIN users AS u ON p.ParentId = u.Id WHERE p.Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL);	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8)	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT `OwnerUserId`  FROM `posts`  WHERE `FavoriteCount` = (SELECT MAX(`FavoriteCount`) FROM `posts`)	codebase_community
SELECT Age  FROM users  WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM posts JOIN votes ON posts.Id = votes.PostId WHERE YEAR(posts.CreaionDate) = 2011 AND votes.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT SUM(p.Score)  FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.Count IS NOT NULL AND p.Id IN (     SELECT p2.Id     FROM posts p2     JOIN tags t2 ON p2.Id = t2.ExcerptPostId     WHERE t2.Count IS NOT NULL AND t2.ExcerptPostId LIKE '2010-07-19%' );	codebase_community
SELECT      COUNT(postLinks.Id) / 12 AS avg_monthly_links FROM      postLinks JOIN      posts ON postLinks.PostId = posts.Id WHERE      YEAR(postLinks.CreationDate) = 2010 AND      posts.AnswerCount <= 2;	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks);	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1;	codebase_community
SELECT MIN(CreationDate)  FROM votes  WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'chl')  ORDER BY CreationDate ASC  LIMIT 1;	codebase_community
SELECT MIN(p.CreaionDate) AS FirstPostDate FROM posts p JOIN users u ON p.OwnerUserId = u.Age WHERE u.Age = (SELECT MIN(Age) FROM users);	codebase_community
SELECT u.DisplayName FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = "Autobiographer" ORDER BY b.Date ASC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(V.PostId)  FROM votes V  JOIN users U ON V.UserId = U.Id  WHERE U.Age = (SELECT MAX(Age) FROM users);	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT `DisplayName` FROM `users` WHERE `Age` BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(p.Id) as PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010;	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(p.Score)  FROM posts p  JOIN users u ON p.Id = u.Id  WHERE u.DisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT p.OwnerDisplayName FROM posts p WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE year(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT      (COUNT(CASE WHEN u.Reputation > 1000 THEN p.Id END) * 100.0) / COUNT(p.Id) AS ReputationOver1000Percentage FROM      posts p LEFT JOIN      users u ON p.OwnerUserId = u.Reputation	codebase_community
SELECT      (COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 END) * 100.0) / COUNT(Id) AS percentage FROM      users;	codebase_community
SELECT SUM(p.ViewCount) AS TotalViews, u.DisplayName AS LastUser FROM posts p JOIN users u ON p.OwnerUserId = u.OwnerUserId WHERE p.Title = 'Computer Game Datasets' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);	codebase_community
SELECT COUNT(c.Id)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183;	codebase_community
SELECT badges.Name, badges.Date FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = "Emmett" ORDER BY badges.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;	codebase_community
SELECT TIMESTAMPDIFF(SECOND, u.CreationDate, b.Date) AS TimeToGetBadge FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT u.CreationDate, COUNT(p.Id) AS Posts, COUNT(c.Id) AS Comments FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY u.CreationDate;	codebase_community
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.DisplayName JOIN posts p ON c.PostId = p.Id WHERE p.Id = (SELECT Id FROM posts WHERE 'Analysing wind data with R' = Text) ORDER BY c.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'careers';	codebase_community
SELECT 'Reputation', 'Views' FROM users WHERE 'DisplayName' = 'Jarrod Dixon';	codebase_community
SELECT      c.Id AS CommentCount,     (SELECT COUNT(*) FROM comments AS c2 WHERE c2.PostId = p.Id) AS AnswerCount FROM      posts AS p WHERE      p.Title = 'Clustering 1D data'	codebase_community
SELECT 'CreationDate' FROM 'users' WHERE 'DisplayName' = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM posts WHERE Id IN (SELECT PostId FROM votes WHERE BountyAmount >= 30);	codebase_community
SELECT      (SELECT COUNT(*)       FROM posts       WHERE posts.OwnerUserId = (SELECT MAX(Reputation) FROM users)       AND posts.Score > 50) * 100.0 /      (SELECT COUNT(*)       FROM posts       WHERE posts.OwnerUserId = (SELECT MAX(Reputation) FROM users)) AS PercentageAbove50	codebase_community
SELECT COUNT(*)  FROM posts  WHERE Score < 20;	codebase_community
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT 'ExcerptPostId', 'WikiPostId'  FROM tags  WHERE TagName = 'sample';	codebase_community
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.PostId WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT      c.CreationDate,      u.Age  FROM      comments c  JOIN      users u ON c.UserId = u.Id  WHERE      c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(c.PostId) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostId, c.Id AS CommentId FROM posts p JOIN comments c ON p.Id = c.PostId JOIN posts titled_posts ON p.Id = titled_posts.Id WHERE titled_posts.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT      (COUNT(DISTINCT c.UserId) FILTER (WHERE v.VoteTypeId IS NULL) * 100.0) /      COUNT(DISTINCT c.UserId) AS PercentageZeroUpVotes FROM      comments c LEFT JOIN      votes v ON c.UserId = v.UserId AND v.VoteTypeId = 1 WHERE      c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.superhero_name = '3-D Man' JOIN superpower sp ON hp.power_id = sp.power_name;	superhero
SELECT COUNT(DISTINCT superhero_name) FROM superhero JOIN hero_power ON superhero.hero_id = hero_power.hero_id JOIN superpower ON hero_power.power_name = superpower.power_name WHERE superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.id = (SELECT id FROM superpower WHERE power_name = 'Super Strength') AND s.height_cm > 200;	superhero
SELECT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.full_name HAVING COUNT(hero_power.power_id) > 15;	superhero
SELECT COUNT(*)  FROM superhero  WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue');	superhero
SELECT c.colour  FROM superhero AS s JOIN colour AS c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(DISTINCT sh.id)  FROM superhero sh JOIN colour c ON sh.eye_colour_id = c.id JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.id = 1 AND sp.id = 2;	superhero
SELECT superhero_name FROM superhero JOIN colour AS eye_colour ON eye_colour.id = superhero.eye_colour_id JOIN colour AS hair_colour ON hair_colour.id = superhero.hair_colour_id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Blond';	superhero
SELECT COUNT(*)  FROM superhero  INNER JOIN publisher  ON superhero.publisher_id = publisher.publisher_name  WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT full_name, height_cm FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;	superhero
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.publisher_name  WHERE s.superhero_name = 'Sauron';	superhero
SELECT c.colour, COUNT(s.id) AS eye_color_count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.publisher_id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY eye_color_count DESC;	superhero
SELECT AVG(height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher_name = 'Marvel Comics'	superhero
SELECT DISTINCT superhero.full_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_name = superpower.power_name JOIN publisher ON superhero.publisher_name = publisher.publisher_name WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.id = p.id WHERE p.publisher_name = 'DC Comics'	superhero
SELECT p.publisher_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN publisher p ON s.publisher_id = p.publisher_name WHERE ha.attribute_id = (SELECT attribute_id FROM hero_attribute WHERE attribute_name = 'Speed' ORDER BY attribute_value ASC LIMIT 1) ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.publisher_id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  WHERE colour.id = (SELECT id FROM colour WHERE id = 1);	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.attribute_id JOIN attribute a ON ha.attribute_value = a.attribute_name WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value LIMIT 1;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'Copycat';	superhero
SELECT superhero_name, full_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50;	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.power_name WHERE superpower.power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero_name ORDER BY COUNT(hero_power.hero_id) DESC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.id = (SELECT id FROM race WHERE name = 'Vampire');	superhero
SELECT      ROUND((SUM(CASE WHEN alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad') THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS percentage_bad_alignment,     COUNT(*) AS count_bad_alignment_heroes FROM      superhero WHERE      publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics');	superhero
SELECT   (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))   -    (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'ABC Studios')) AS diff	superhero
SELECT id FROM publisher WHERE publisher_name = "Star Trek";	superhero
SELECT AVG(attribute_value) AS average_attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id;	superhero
SELECT COUNT(*)  FROM superhero  WHERE full_name IS NULL;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.superhero_name = 'Deathlok' AND s.superhero_name = hp.hero_id JOIN superpower sp ON hp.hero_id = sp.power_name;	superhero
SELECT AVG(weight_kg)  FROM superhero  WHERE gender_id IN (SELECT id FROM gender WHERE id = 2);	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.hero_id = sp.power_name JOIN gender g ON s.gender_id = g.id WHERE g.id = 1 GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 5;	superhero
SELECT superhero_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Alien';	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IS NULL;	superhero
SELECT sp.power_name  FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_name = sp.power_name WHERE sh.id = 56;	superhero
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE id = 2);	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.race_id WHERE s.weight_kg = 169;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.hair_colour_id = c.id JOIN race AS r ON s.race_id = r.id WHERE s.height_cm = 185 AND r.race = 'human';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero);	superhero
SELECT      ROUND(         (SUM(CASE WHEN superhero.publisher_id = 13 THEN 1 ELSE 0 END) * 100.0) /          COUNT(superhero.publisher_id),          2     ) AS percentage_marvel_heroes FROM superhero WHERE superhero.height_cm BETWEEN 150 AND 180;	superhero
SELECT full_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero);	superhero
SELECT sp.power_name, COUNT(hp.power_id) AS power_count FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT a.attribute_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.attribute_id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 1;	superhero
SELECT COUNT(DISTINCT superhero.id)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.power_name  WHERE superpower.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT AVG(CASE WHEN c.id IS NULL THEN 1 ELSE 0 END)  FROM superhero s  LEFT JOIN colour c ON s.skin_colour_id = c.id;	superhero
SELECT COUNT(*)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.publisher_name  WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.superhero_name = ha.hero_id JOIN attribute a ON ha.attribute_value = a.id JOIN publisher p ON s.publisher_id = p.publisher_name WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Flight';	superhero
SELECT      c1.colour AS eye_colour,      c2.colour AS hair_colour,      c3.colour AS skin_colour  FROM      superhero AS s  JOIN      colour AS c1 ON s.eye_colour_id = c1.id  JOIN      colour AS c2 ON s.hair_colour_id = c2.id  JOIN      colour AS c3 ON s.skin_colour_id = c3.id  JOIN      gender AS g ON s.gender_id = g.id  JOIN      publisher AS p ON s.publisher_id = p.id  WHERE      g.gender = 'Female'      AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s1.superhero_name, p.publisher_name FROM superhero s1 JOIN superhero s2 ON s1.eye_colour_id = s2.eye_colour_id AND s1.hair_colour_id = s2.hair_colour_id AND s1.skin_colour_id = s2.skin_colour_id JOIN publisher p ON s1.publisher_id = p.publisher_id WHERE s1.superhero_name <> s2.superhero_name;	superhero
SELECT r.race FROM superhero AS s JOIN race AS r ON s.race_id = r.race_id WHERE s.superhero_name = 'A-Bomb';	superhero
SELECT      ROUND(         (SUM(CASE WHEN c.id = 1 AND g.gender = 'Female' THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END)     ) AS percentage_blue_female_superheroes FROM      superhero s JOIN      colour c ON s.colour_id = c.id JOIN      gender g ON s.gender_id = g.id WHERE      g.gender = 'Female';	superhero
SELECT superhero_name, race  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE full_name = "Charles Chandler";	superhero
SELECT g.gender  FROM superhero s  JOIN gender g ON s.gender_id = g.gender_id  WHERE s.superhero_name = 'Agent 13';	superhero
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.superhero_name = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.power_name WHERE superpower.power_name = 'Adaptation';	superhero
SELECT COUNT(hp.power_id) AS power_count FROM hero_power hp JOIN superhero s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo';	superhero
SELECT sp.power_name FROM superhero su JOIN hero_power hp ON su.id = hp.hero_id JOIN superpower sp ON hp.hero_id = sp.id WHERE su.full_name = "Hunter Zolomon";	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black';	superhero
SELECT superhero_name, c.colour AS eye_colour FROM superhero JOIN colour AS e ON superhero.eye_colour_id = e.id JOIN colour AS s ON superhero.skin_colour_id = s.id WHERE s.colour = 'Gold';	superhero
SELECT superhero.full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.id = 5;	superhero
SELECT superhero_name  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Neutral';	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Strength');	superhero
SELECT r.id AS race_id, r.id AS race, a.id AS alignment_id, a.id AS alignment FROM superhero s JOIN race r ON s.id = r.id JOIN alignment a ON s.id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = 2 AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END),         2     ) AS percentage_female_heroes_by_Marvel FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics';	superhero
SELECT AVG(weight_kg)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Alien';	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') -         (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;	superhero
SELECT id, (SUM(height_cm) / COUNT(*)) AS average_height_cm FROM superhero GROUP BY id;	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.superhero_name = 'Abomination' JOIN superpower sp ON hp.hero_id = sp.id;	superhero
SELECT COUNT(*)  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.id = 21 AND superhero.gender_id = 1;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.id = hero_attribute.hero_id  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute_name = 'Speed'  ORDER BY attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT a.attribute_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.superhero_name = ha.attribute_value JOIN attribute a ON ha.attribute_value = a.attribute_name WHERE s.superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c_eye ON s.eye_colour_id = c_eye.id AND c_eye.colour = 'Blue' JOIN colour c_hair ON s.hair_colour_id = c_hair.id AND c_hair.colour = 'Brown';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.publisher_id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(*)  FROM superhero  WHERE publisher_id IS NULL OR publisher_id != 13;	superhero
SELECT      ROUND((SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) * 100.0) / COUNT(s.id), 2) AS blue_eyes_percentage FROM      superhero s JOIN      colour c ON s.eye_colour_id = c.id;	superhero
SELECT     (SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) / SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END)) AS male_female_ratio FROM superhero;	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name  FROM superhero  WHERE weight_kg IS NULL OR weight_kg = 0;	superhero
SELECT c.colour  FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.colour WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.hero_id = sp.power_name WHERE s.full_name = 'Helen Parr';	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.race_id WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.publisher_name WHERE s.id = 38;	superhero
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN hero_attribute ha ON s.id = ha.attribute_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute) GROUP BY r.race;	superhero
SELECT      a.alignment_id,     sp.power_name FROM      superhero s JOIN      hero_power hp ON s.id = hp.hero_id JOIN      superpower sp ON hp.power_id = sp.id JOIN      alignment a ON s.alignment_id = a.id WHERE      s.superhero_name = 'Atom IV';	superhero
SELECT superhero.full_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'  LIMIT 5;	superhero
SELECT AVG(ha.attribute_value)  FROM hero_attribute ha  JOIN superhero s ON ha.hero_id = s.id  JOIN alignment a ON s.alignment_id = a.id  WHERE a.alignment = 'Neutral';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.colour JOIN hero_attribute ha ON s.hero_id = ha.hero_id WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;	superhero
SELECT superhero_name  FROM superhero  JOIN hero_attribute ON superhero.superhero_name = hero_attribute.hero_id  WHERE hero_attribute.attribute_value BETWEEN 75 AND 80;	superhero
SELECT race.race  FROM superhero  JOIN colour ON superhero.hair_colour_id = colour.id  JOIN gender ON superhero.gender_id = gender.id  WHERE colour.colour = 'Blue' AND gender.gender = 'Male';	superhero
SELECT      ROUND(MULTIPLY(DIVIDE(SUM(CASE WHEN alignment.id = 2 AND gender.id = 2 THEN 1 ELSE 0 END), COUNT(CASE WHEN alignment.id = 2 THEN 1 END)), 100.0), 2) AS percentage_female_bad_superheroes FROM superhero JOIN alignment ON superhero.gender_id = alignment.id JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 2;	superhero
SELECT      (SUM(CASE WHEN T2.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.eye_colour_id = 1 THEN 1 ELSE 0 END)) AS difference FROM      superhero AS T1 JOIN      colour AS T2 ON T1.eye_colour_id = T2.id WHERE      T1.weight_kg = 0 OR T1.weight_kg IS NULL	superhero
SELECT hero_attribute.attribute_value  FROM hero_attribute  JOIN superhero ON hero_attribute.hero_id = superhero.superhero_name  JOIN attribute ON hero_attribute.attribute_value = attribute.attribute_name  WHERE superhero.superhero_name = 'Hulk' AND attribute.attribute_name = 'Strength';	superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.superhero_name = 'Ajax' AND hp.hero_id = s.superhero_name JOIN superpower AS sp ON hp.hero_id = sp.id;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.id = colour.id JOIN alignment ON superhero.id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN publisher p ON s.publisher_id = p.publisher_name  WHERE g.id = 1 AND p.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name  FROM superhero  JOIN hero_power ON superhero.hero_id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.power_id  WHERE superpower.power_name = 'Wind Control'  ORDER BY superhero_name ASC;	superhero
SELECT s.gender_id, g.gender FROM superhero s JOIN hero_power hp ON s.hero_id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.power_id JOIN gender g ON s.gender_id = g.gender_id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name, weight_kg  FROM superhero  WHERE publisher_id IN (SELECT publisher_id FROM publisher WHERE publisher_name = 'DC Comics')  ORDER BY weight_kg DESC  LIMIT 1;	superhero
SELECT AVG(height_cm)  FROM superhero  WHERE race_id IN (SELECT race_id FROM race WHERE race <> 'Human')  AND publisher_id IN (SELECT publisher_id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
SELECT      superhero_name,      full_name FROM      superhero JOIN      hero_attribute ON superhero.id = hero_attribute.hero_id JOIN      attribute ON hero_attribute.attribute_id = attribute.id WHERE      attribute_name = 'Speed'      AND attribute_value = 100;	superhero
SELECT      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))      -      (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference	superhero
SELECT a.attribute_name, MIN(ha.attribute_value) AS min_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id JOIN attribute a ON ha.attribute_id = a.attribute_name WHERE s.superhero_name = 'Black Panther' GROUP BY a.attribute_name ORDER BY min_value ASC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name  FROM superhero  WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT      ROUND(         (SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) / COUNT(*)) * 100.0,          2     ) AS female_percentage FROM      superhero s WHERE      s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'George Lucas');	superhero
SELECT      ROUND(MULTIPLY(DIVIDE(COUNT(CASE WHEN s.alignment_id = (SELECT id FROM alignment WHERE alignment = 'Good') AND p.publisher_name = 'Marvel Comics' THEN 1 END), COUNT(*)), 100.0), 2) AS percentage_good_superheroes FROM superhero s JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);	superhero
SELECT `full_name` FROM `superhero` WHERE `superhero_name` = 'Alien';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg < 100 AND colour.colour = 'Brown';	superhero
SELECT ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.superhero_name = "Aquababy" AND ha.hero_id = s.superhero_id;	superhero
SELECT weight_kg, race FROM superhero WHERE id = 40;	superhero
SELECT AVG(height_cm)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE alignment.alignment = 'Neutral';	superhero
SELECT hp.hero_id FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.power_name = 'Intelligence' JOIN superhero s ON hp.hero_id = s.id;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT s.id, sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.power_id JOIN superpower sp ON hp.power_id = sp.power_id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT d.driverRef FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 20 AND q.q1 IN (     SELECT MAX(q1) FROM qualifying WHERE raceId = 20 ) AND (     SELECT COUNT(DISTINCT q1) FROM qualifying WHERE raceId = 20 AND q1 = q.q1 ) = 5;	formula_1
SELECT d.surname FROM qualifying AS q JOIN drivers AS d ON q.driverId = d.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)	formula_1
SELECT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai';	formula_1
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany';	formula_1
SELECT r.position  FROM results r JOIN constructors c ON r.constructorId = c.constructorId JOIN circuits ct ON r.raceId = ct.circuitId WHERE c.constructorId = (     SELECT constructorId      FROM constructors      WHERE name = 'Renault' );	formula_1
SELECT COUNT(*) FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.country NOT IN ('Malaysia', 'Bahrain', 'Turkey', 'Monaco');	formula_1
SELECT r.name  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';	formula_1
SELECT races.url FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.name = 'Sepang International Circuit';	formula_1
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = "Sepang International Circuit";	formula_1
SELECT circuits.lat, circuits.lng FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Abu Dhabi Grand Prix';	formula_1
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.raceId = 24 AND cr.points = 1;	formula_1
SELECT q.q1 FROM qualifying q JOIN drivers d ON q.driverId = d.forename AND d.surname = 'Senna' JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 354 AND d.forename = 'Bruno' AND d.surname = 'Senna';	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '0:01:40' AND q.raceId = 355;	formula_1
SELECT d.number FROM drivers d JOIN qualifying q ON d.driverId = q.raceId WHERE q.q3 LIKE '0:01:54%' AND q.raceId = 903;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Bahrain Grand Prix' AND s.status = 'Finished' EXCEPT SELECT d.driverId FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2007 AND ra.name = 'Bahrain Grand Prix';	formula_1
SELECT s.url FROM races r JOIN seasons s ON r.year = SUBSTR(s.url, LENGTH('http://en.wikipedia.org/wiki/') + 1) WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT r.driverId)  FROM results r  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.date = '2015-11-29';	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT      d.driverRef,      d.url  FROM      drivers d  JOIN      lapTimes lt ON d.driverId = lt.driverId  JOIN      races r ON lt.raceId = r.raceId  WHERE      r.raceId = 161      AND lt.time LIKE '01:27%'      AND d.url IS NOT NULL;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933);	formula_1
SELECT c.lat, c.lng FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitRef WHERE r.name = 'Malaysian Grand Prix';	formula_1
SELECT c.url  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  JOIN races r ON cr.raceId = r.raceId  WHERE r.raceId = 9  ORDER BY cr.points DESC  LIMIT 1;	formula_1
SELECT q.q1  FROM drivers d  JOIN qualifying q ON d.driverRef = q.q1  JOIN races r ON r.raceId = q.q1  WHERE d.surname = 'di Grassi' AND r.raceId = 345;	formula_1
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.raceId WHERE q.q2 = '0:01:15' AND q.raceId = 347;	formula_1
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.raceId WHERE q.q3 LIKE '0:01:33%' AND q.raceId = (SELECT raceId FROM races WHERE raceId = 45);	formula_1
SELECT time  FROM results  JOIN drivers ON results.driverId = drivers.surname  WHERE drivers.surname = "McLaren" AND results.raceId = 743;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = "San Marino Grand Prix" AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.url LIKE CONCAT('%', r.year, '%') WHERE r.raceId = 901;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.date = '2015-11-29'  AND statusId != 1;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId = 872 AND r.statusId = 1 ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.raceId = 348 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLap = (SELECT MAX(fastestLap) FROM results)	formula_1
SELECT      (CAST(SUBTRACT(CAST(SUBSTRING_INDEX('218.385', '.', 1) AS REAL), CAST(SUBSTRING_INDEX('217.586', '.', 1) AS REAL)) AS REAL) * 100) /      CAST(SUBSTRING_INDEX('217.586', '.', 1) AS REAL) FROM      drivers  JOIN      results ON drivers.driverId = results.driverId  JOIN      races ON results.driverId = races.driverId  WHERE      drivers.forename = 'Paul' AND drivers.surname = 'di Resta' AND      races.raceId = 853;	formula_1
SELECT      (COUNT(CASE WHEN r.time IS NOT NULL THEN dr.driverId END) * 100.0) / COUNT(dr.driverId) AS completionRate FROM      drivers dr JOIN      results r ON dr.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.date = '1983-07-16';	formula_1
SELECT year  FROM races  WHERE name = 'Singapore Grand Prix'  ORDER BY year ASC  LIMIT 1;	formula_1
SELECT COUNT(*) AS TotalRaces, name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT r.name FROM races r JOIN (     SELECT MIN(year) AS min_year     FROM races ) y ON r.year = y.min_year JOIN (     SELECT MIN(MONTH(raceDate)) AS min_month     FROM races ) m ON MONTH(raceDate) = m.min_month;	formula_1
SELECT name, date  FROM races  WHERE year = 1999  ORDER BY round DESC  LIMIT 1;	formula_1
SELECT `year`, COUNT(`round`) as race_count FROM `races` GROUP BY `year` ORDER BY race_count DESC LIMIT 1;	formula_1
SELECT r.name FROM races r WHERE r.year = 2017 AND r.year NOT IN (SELECT year FROM races WHERE year = 2000);	formula_1
SELECT c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.url LIKE '%1950%' AND c.country = 'Spain';	formula_1
SELECT s.year FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId JOIN seasons AS s ON r.year = s.year WHERE c.name = 'Brands Hatch' AND c.country = 'Britain' ORDER BY s.year DESC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT s.year) FROM seasons s JOIN races r ON s.year = r.year JOIN circuits c ON r.circuitId = c.id WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix';	formula_1
SELECT d.forename, d.surname, ds.position FROM drivers d JOIN driverStandings ds ON d.forename = ds.forename JOIN races r ON ds.raceId = r.year WHERE r.year = 2010 AND r.circuitId = (SELECT circuitId FROM races WHERE year = 2010 AND circuitId = 1) ORDER BY ds.position;	formula_1
SELECT drivers.forename, drivers.surname, driverStandings.points  FROM drivers  JOIN driverStandings ON drivers.driverId = driverStandings.driverId  ORDER BY driverStandings.points DESC  LIMIT 1;	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.year = r.year AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT drivers.forename, drivers.surname, races.name, MIN(lapTimes.time) as bestLapTime FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId GROUP BY drivers.driverId, races.raceId ORDER BY bestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(STR_TO_MILLIS('time')) AS average_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix'	formula_1
SELECT      (COUNT(CASE WHEN d.surname = 'Hamilton' AND rs.position > 1 THEN 1 END) * 100.0) /      COUNT(CASE WHEN d.surname = 'Hamilton' THEN 1 END) AS percentage FROM      driverStandings ds JOIN      drivers d ON ds.driverId = d.driverId JOIN      races r ON ds.raceId = r.raceId WHERE      d.surname = 'Hamilton' AND      r.year >= 2010;	formula_1
SELECT      d.forename,      d.surname,      d.nationality,      ds.points FROM      driverStandings ds JOIN      drivers d ON ds.driverId = d.driverId WHERE      ds.points = (SELECT MAX(points) FROM driverStandings)	formula_1
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS age, forename, surname FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT DISTINCT c.circuitRef, c.name, c.location, c.country FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN seasons s ON r.year = s.year WHERE s.year BETWEEN 1990 AND 2000 GROUP BY c.circuitId HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name AS CircuitName, c.location AS CircuitLocation, r.name AS RaceName FROM circuits c JOIN races r ON c.name = r.name JOIN seasons s ON r.name LIKE CONCAT('%', s.year, '%') WHERE s.year = 2006 AND c.country = 'USA';	formula_1
SELECT r.name AS RaceName, c.name AS CircuitName, c.location AS CircuitLocation FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2005 AND MONTH(r.year * 100 + r.circuitId) = 9;	formula_1
SELECT r.name AS raceName FROM races r JOIN driverStandings ds ON r.raceId = ds.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND ds.position < 20;	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  JOIN driverStandings ON races.raceId = driverStandings.raceId  JOIN drivers ON driverStandings.driverId = drivers.driverId  WHERE circuits.name = 'Sepang International Circuit'  AND drivers.surname = 'Schumacher'  AND driverStandings.points = (SELECT MAX(points) FROM driverStandings ds2 WHERE ds2.raceId = races.raceId);	formula_1
SELECT r.name AS race, r.year FROM races r JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverRef WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(points)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN seasons ON results.raceId IN (SELECT raceId FROM races WHERE year = 2000)  WHERE drivers.surname = "Irvine"	formula_1
SELECT MIN(r.year) AS first_race_year, ds.points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' JOIN races r ON ds.raceId = r.raceId GROUP BY ds.driverId ORDER BY first_race_year ASC LIMIT 1;	formula_1
SELECT r.name, c.country, r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2017 ORDER BY r.date;	formula_1
SELECT      r.name,      r.year,      c.location,      MAX(re.laps) AS max_laps FROM      results re JOIN      races r ON re.raceId = r.raceId JOIN      circuits c ON r.circuitId = c.circuitId GROUP BY      r.raceId ORDER BY      max_laps DESC LIMIT 1;	formula_1
SELECT      (SELECT COUNT(*)       FROM races       WHERE country = 'Germany' AND name = 'European Grand Prix') * 100.0 /      (SELECT COUNT(*)       FROM races       WHERE name = 'European Grand Prix') AS percentage;	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT      MAX(lat) as highest_latitude,      circuitRef  FROM circuits  WHERE circuitRef IN ('silverstone', 'hockenheimring', 'hungaroring') GROUP BY circuitRef  ORDER BY highest_latitude DESC  LIMIT 1;	formula_1
SELECT circuitRef  FROM circuits  WHERE name = 'Marina Bay Street Circuit';	formula_1
SELECT country  FROM circuits  WHERE alt = (SELECT MAX(alt) FROM circuits);	formula_1
SELECT COUNT(*)  FROM drivers  WHERE code IS NULL;	formula_1
SELECT nationality  FROM drivers  WHERE dob = (SELECT MIN(dob) FROM drivers);	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
SELECT url FROM drivers WHERE surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE driverRef = 'hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;	formula_1
SELECT DISTINCT s.year  FROM seasons s  JOIN races r ON s.year = r.year  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit';	formula_1
SELECT      c.name AS circuit_name,      c.location,      c.country,      r.year,      r.round,      r.name AS race_name,      r.date,      r.time,      r.url AS race_url FROM      circuits c JOIN      races r ON c.circuitId = r.circuitId WHERE      c.circuitRef = 'silverstone';	formula_1
SELECT date FROM races JOIN circuits ON races.circuitId = circuits.name WHERE year BETWEEN 2010 AND 2019 AND circuits.name = "Abu Dhabi Circuit";	formula_1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy';	formula_1
SELECT `date` FROM `races` JOIN `circuits` ON `races.circuitId` = `circuits.circuitId` WHERE `circuits.name` = "Circuit de Barcelona-Catalunya";	formula_1
SELECT c.url FROM circuits c JOIN seasons s ON c.circuitId = s.circuitId WHERE s.year = 2009 AND c.name = 'Circuit de Barcelona-Catalunya';	formula_1
SELECT MIN(l.milliseconds) AS fastestLapTime FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId WHERE d.surname = 'Hamilton';	formula_1
SELECT d.forename, d.surename FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE r.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results );	formula_1
SELECT d.driverRef FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId JOIN races r ON ds.raceId = r.raceId WHERE r.name = 'Canadian Grand Prix' AND ds.position = 1 AND ds.year = 2007;	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON d.driverId = res.driverId WHERE d.driverRef = "hamilton";	formula_1
SELECT r.name FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.rank ASC LIMIT 1;	formula_1
SELECT MAX(milliseconds) AS fastestLapSpeed FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId JOIN seasons ON races.year = seasons.year WHERE drivers.surname = 'Alonso' AND seasons.year = 2009;	formula_1
SELECT DISTINCT r.year FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.driverRef = 'hamilton';	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, rs.rank FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId JOIN results rs ON ds.raceId = rs.raceId AND ds.driverId = rs.driverId WHERE d.driverRef = 'hamilton' AND r.name = 'Chinese Grand Prix' ORDER BY rs.rank DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.grid JOIN races ra ON ra.raceId = r.raceId WHERE r.grid = 4 AND ra.year = 1989 AND ra.name = "Australian Grand Prix";	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND time IS NOT NULL;	formula_1
SELECT      MIN('milliseconds') AS fastest_lap_time FROM      'lapTimes' lt JOIN      'drivers' d ON lt.driverId = d.driverId WHERE      d.driverId = 5 AND     lt.raceId IN (         SELECT              circuitId         FROM              'races' r         JOIN              'circuits' c ON r.circuitId = c.circuitId         WHERE              c.name = 'Albert Park Grand Prix Circuit'     ) ORDER BY      fastest_lap_time ASC LIMIT 1;	formula_1
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.rank = 2;	formula_1
SELECT d.forename, d.surname, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.forename LIKE 'HH:%';	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  JOIN races r ON ds.circuitId = r.circuitId  JOIN circuits c ON r.circuitId = c.circuitId  WHERE d.nationality = 'British' AND r.name = 'Australian Grand Prix';	formula_1
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND EXISTS (     SELECT 1     FROM results     WHERE results.driverId = r.driverId     AND results.raceId IN (SELECT raceId FROM races WHERE year = 2008) );	formula_1
SELECT SUM(points) AS total_points FROM results WHERE driverId = (SELECT id FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton');	formula_1
SELECT AVG(SUBSTRING_INDEX(SUBSTRING_INDEX(MAX(time), ':', 1), '.', 1) +         (SUBSTRING_INDEX(SUBSTRING_INDEX(MAX(time), ':', 2), '.', 1) / 60.0)) AS avgFastestLapTime FROM lapTimes WHERE driverId = (SELECT driverRef FROM drivers WHERE surname = 'Hamilton')	formula_1
SELECT     (COUNT(CASE WHEN lt.time IS NOT NULL THEN lt.raceId END) * 1.0) / COUNT(lt.raceId) FROM     lapTimes lt WHERE     lt.raceId IN (         SELECT r.raceId         FROM races r         WHERE r.year = 2008 AND r.name = 'Australian Grand Prix'     );	formula_1
SELECT      ((TIMEDIFF(MAX(T2.time), MIN(T2.time)) / MIN(T2.time) * 100) AS percentage_difference) FROM      results AS T1 JOIN      drivers AS T2 ON T1.raceId = 18 AND T2.driverId = T1.raceId WHERE      T1.time IS NOT NULL	formula_1
SELECT COUNT(*)  FROM circuits  WHERE country = 'Australia' AND location = 'Adelaide';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*)  FROM drivers  WHERE nationality = "British" AND dob > "1980-01-01";	formula_1
SELECT MAX(points)  FROM constructorResults  JOIN constructors ON constructorResults.constructorId = constructors.constructorId  WHERE constructors.nationality = "British";	formula_1
SELECT c.name, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId GROUP BY c.name ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE r.raceId = 291 AND cs.points = 0;	formula_1
SELECT COUNT(DISTINCT cr.constructorId) FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY cr.constructorId HAVING COUNT(cr.raceId) = 2;	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorStandingsId WHERE cs.position = 1;	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN constructors c ON d.driverId = c.constructorId JOIN results r ON c.constructorId = r.constructorId WHERE d.nationality = 'French' AND r.laps > 50;	formula_1
SELECT      (COUNT(CASE WHEN r.driverId IN (SELECT d.driverId FROM drivers d WHERE d.nationality = 'Japanese') THEN 1 END) * 100.0)      / COUNT(DISTINCT r.driverId)  FROM      results r  JOIN      races ra ON r.raceId = ra.raceId  JOIN      seasons se ON ra.year = se.year  WHERE      se.year BETWEEN 2007 AND 2009	formula_1
SELECT      s.year,     AVG(UNIX_TIMESTAMP(SUBSTRING_INDEX(SUBSTRING_INDEX(r.time, ':', 2), ':', -2), 'SS') * 60 +      UNIX_TIMESTAMP(SUBSTRING_INDEX(SUBSTRING_INDEX(r.time, ':', 1), ':', -2), 'MM') * 60 +      UNIX_TIMESTAMP(SUBSTRING_INDEX(r.time, ':', 0), 'HH') AS avg_seconds FROM      results AS r JOIN      seasons AS s ON s.year = YEAR(r.time) WHERE      s.year < 1975     AND r.time IS NOT NULL     AND EXISTS (         SELECT 1         FROM driverStandings ds         WHERE ds.driverId = (             SELECT driverId             FROM driverStandings             WHERE points = (SELECT MAX(points) FROM driverStandings ds2 WHERE ds2.year = s.year)         )         AND ds.driverId = r.driverId     ) GROUP BY      s.year;	formula_1
SELECT d.forename FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob > '1975-01-01' AND ds.position = 2;	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND driverId NOT IN (     SELECT driverId     FROM results     WHERE time IS NOT NULL );	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId ORDER BY lt.lapTime ASC LIMIT 1;	formula_1
SELECT lt.lap FROM lapTimes lt JOIN (     SELECT ds.driverId     FROM driverStandings ds     JOIN races r ON ds.raceId = r.raceId     WHERE r.year = 2009 AND ds.driverId = (         SELECT driverId         FROM driverStandings ds2         JOIN races r2 ON ds2.raceId = r2.raceId         WHERE r2.year = 2009         ORDER BY COUNT(*) DESC         LIMIT 1     ) ) AS champion ON lt.driverId = champion.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.year = 2009 ORDER BY lt.time ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapSpeed) AS averageFastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix';	formula_1
SELECT r.name, r.year, MIN(r.milliseconds) as MinMilliseconds FROM races r JOIN results rs ON r.raceId = rs.raceId WHERE rs.milliseconds IS NOT NULL GROUP BY r.name, r.year ORDER BY MinMilliseconds ASC LIMIT 1;	formula_1
SELECT     (SELECT COUNT(DISTINCT d.driverId)      FROM drivers d      JOIN lapTimes lt ON d.driverId = lt.driverId      JOIN races r ON lt.raceId = r.raceId      WHERE d.dob < '1985-01-01'        AND r.year BETWEEN 2000 AND 2005        AND lt.lap > 50) * 100.0   /     (SELECT COUNT(DISTINCT d.driverId)      FROM drivers d      JOIN lapTimes lt ON d.driverId = lt.driverId      JOIN races r ON lt.raceId = r.raceId      WHERE d.dob < '1985-01-01'        AND r.year BETWEEN 2000 AND 2005) AS percentage;	formula_1
SELECT COUNT(*) FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = "French" AND lt.milliseconds < 120;	formula_1
SELECT code FROM drivers WHERE nationality = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(DISTINCT 'driverStandings.driverId') AS driversParticipated FROM 'driverStandings' WHERE 'driverStandings.raceId' = 18;	formula_1
SELECT d.code, d.number, (SELECT MAX(YEAR(dob)) FROM drivers) AS youngest_age FROM drivers d WHERE nationality = 'Dutch' ORDER BY dob DESC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.surname, MIN(lt.time) AS earliest_lap_time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'German' AND YEAR(d.dob) BETWEEN 1980 AND 1990 GROUP BY d.driverId ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef  FROM drivers  WHERE nationality = 'German'  ORDER BY dob  LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.dob = '1971-01-01' AND lt.fastestLap = 1;	formula_1
SELECT d.driverId, d.surname, d.forename, d.dob, MAX(lt.time) AS latestLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'Spanish' AND d.dob < '1982-01-01' GROUP BY d.driverId, d.surname, d.forename, d.dob ORDER BY latestLapTime DESC LIMIT 10;	formula_1
SELECT DISTINCT year FROM races JOIN results ON races.raceId = results.raceId WHERE fastestLap IS NOT NULL ORDER BY fastestLapTime ASC LIMIT 1;	formula_1
SELECT s.year FROM seasons s JOIN races r ON s.year = r.year JOIN (     SELECT raceId, MAX(STR_TO_FLOAT(time)) AS max_time     FROM lapTimes     GROUP BY raceId ) lt ON r.year IN (SELECT year FROM seasons) GROUP BY s.year ORDER BY max_time ASC LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.raceId > 50 AND ra.raceId < 100 AND r.statusId = 2 AND r.time IS NULL;	formula_1
SELECT COUNT(*) AS circuit_count, location, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY circuitId;	formula_1
SELECT r.raceId, COUNT(*) as finishers_count FROM races r JOIN results rs ON r.raceId = rs.raceId WHERE rs.laps IS NOT NULL GROUP BY r.raceId ORDER BY finishers_count DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT      r.year,     r.name,     r.date,     r.time FROM      drivers d JOIN      qualifying q ON d.driverId = q.driverId JOIN      races r ON q.raceId = r.raceId WHERE      d.dob = (         SELECT              MIN(dob)         FROM              drivers     ) ORDER BY      r.date ASC LIMIT 1;	formula_1
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = "American" AND s.statusId = (SELECT statusId FROM status WHERE statusId = 1 AND statusId = (SELECT statusId FROM status WHERE 'Puncture'));	formula_1
SELECT c.nationality, c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Italian' AND cr.points = (     SELECT MAX(points)     FROM constructorResults     WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'Italian') );	formula_1
SELECT c.url  FROM constructors c JOIN constructorStandings cs ON c.constructorRef = cs.constructorId WHERE cs.wins = (SELECT MAX(wins) FROM constructorStandings);	formula_1
SELECT d.driverId, d.forename, d.surname, MAX(lt.time) as slowestLapTime FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 GROUP BY d.driverId ORDER BY slowestLapTime DESC LIMIT 1;	formula_1
SELECT      r.name AS raceName,      MIN(lt.milliseconds) AS fastestLapTime FROM      races r JOIN      lapTimes lt ON r.raceId = lt.lap WHERE      lt.lap = 1 GROUP BY      r.raceId ORDER BY      fastestLapTime ASC LIMIT 1;	formula_1
SELECT AVG(fastestLapTime)  FROM results  JOIN driverStandings ON results.driverId = driverStandings.driverId  WHERE results.raceId = (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix')  AND driverStandings.rank < 11;	formula_1
SELECT d.forename, d.surname, AVG(PS.duration) AS avg_duration FROM drivers d JOIN pitStops PS ON d.driverId = PS.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId ORDER BY avg_duration ASC LIMIT 3;	formula_1
SELECT d.driverId, d.name, lt.time FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId AND r.name = 'Canadian Grand Prix' JOIN lapTimes lt ON d.driverId = lt.driverId WHERE r.year = 2008 AND lt.time = (     SELECT MIN(lt.time)     FROM lapTimes lt     JOIN driverStandings ds ON lt.driverId = ds.driverId     JOIN races r ON ds.raceId = r.raceId AND r.name = 'Canadian Grand Prix'     WHERE r.year = 2008 );	formula_1
SELECT      c.constructorRef,      c.url FROM      results r JOIN      constructors c ON r.constructorId = c.constructorRef JOIN      races ra ON r.raceId = ra.raceId JOIN      seasons se ON ra.year = se.year WHERE      ra.name = 'Singapore Grand Prix' AND      se.year = 2009 AND      r.position = 1;	formula_1
SELECT forename, surname, dob  FROM drivers  WHERE nationality = 'Austrian'  AND EXTRACT(YEAR FROM dob) BETWEEN 1981 AND 1991;	formula_1
SELECT CONCAT(forename, ' ', surname) AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC;	formula_1
SELECT location, country, lat, lng  FROM circuits  WHERE location = 'Hungaroring';	formula_1
SELECT      c.name,      c.nationality,      SUM(cr.points) AS total_points FROM      constructors c JOIN      constructorResults cr ON c.constructorId = cr.constructorId JOIN      races r ON cr.raceId = r.raceId JOIN      seasons s ON r.year = s.year WHERE      r.name = 'Monaco Grand Prix' AND      s.year BETWEEN 1980 AND 2010 GROUP BY      c.name,      c.nationality ORDER BY      total_points DESC LIMIT 1;	formula_1
SELECT AVG(points)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN circuits ON circuits.circuitId = races.circuitId  JOIN races ON races.circuitId = circuits.circuitId  WHERE drivers.surname = 'Hamilton' AND circuits.name = 'Istanbul Park';	formula_1
SELECT AVG(COUNT(raceId)) AS average_races_per_year FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY year;	formula_1
SELECT nationality, COUNT(*) as count FROM drivers GROUP BY nationality ORDER BY count DESC LIMIT 1;	formula_1
SELECT SUM(CASE WHEN rs.positionText = '1' THEN 1 ELSE 0 END) AS victories FROM driverStandings rs WHERE rs.positionText = '91';	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapSpeed = (     SELECT MIN(fastestLapSpeed)     FROM results );	formula_1
SELECT c.location, c.country, c.location || ', ' || c.country AS full_location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races)	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.raceId = c.raceId WHERE q.position = 1 AND r.year = 2008 AND c.name = 'Marina Bay Street Circuit' ORDER BY q.q3 LIMIT 1;	formula_1
SELECT d.forename, d.surname, d.nationality, r.name FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.driverId = r.raceId WHERE d.dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  JOIN drivers ON results.driverId = drivers.driverId  JOIN status ON results.statusId = status.statusId  WHERE races.name = 'Canadian Grand Prix'  AND status.status = 'Accident'  AND drivers.driverId = (     SELECT driverId      FROM results      JOIN races ON results.raceId = races.raceId      JOIN status ON results.statusId = status.statusId      WHERE races.name = 'Canadian Grand Prix'      AND status.status = 'Accident'      GROUP BY drivers.driverId      ORDER BY COUNT(*) DESC      LIMIT 1 );	formula_1
SELECT d.forename, d.surname, (SELECT SUM(ds.wins) FROM driverStandings ds WHERE ds.driverId = d.driverId) AS totalWins FROM drivers d WHERE d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY totalWins DESC LIMIT 1;	formula_1
SELECT MAX(duration) AS longest_pit_stop_time FROM pitStops;	formula_1
SELECT MIN('time') AS fastest_time FROM lapTimes JOIN circuits ON lapTimes.raceId = circuits.circuitId;	formula_1
SELECT MAX(`duration`) AS longest_pit_stop_duration FROM `pitStops` WHERE `driverId` = (SELECT `driverId` FROM `drivers` WHERE `forename` = 'Lewis' AND `surname` = 'Hamilton');	formula_1
SELECT pitStops.lap FROM pitStops JOIN drivers ON pitStops.driverId = drivers.driverRef JOIN races ON pitStops.raceId = races.year WHERE drivers.surname = 'Hamilton' AND races.year = 2011 AND races.year = 4;	formula_1
SELECT d.driverId, ps.duration FROM pitStops ps JOIN races r ON ps.raceId = r.raceId JOIN drivers d ON ps.driverId = d.driverId WHERE r.name = 'Australian Grand Prix' AND r.year = 2011;	formula_1
SELECT MIN(`milliseconds`) AS fastestLapTime FROM `lapTimes` JOIN `drivers` ON `lapTimes`.`driverId` = `drivers`.`driverRef` WHERE `drivers`.`surname` = 'Hamilton'	formula_1
SELECT d.forename, d.surName, lt.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.time = (     SELECT MIN(time)     FROM lapTimes ) LIMIT 20;	formula_1
SELECT r.position FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY lt.milliseconds LIMIT 1;	formula_1
SELECT MIN(time) AS lap_record FROM lapTimes JOIN circuits ON lapTimes.circuitId = circuits.circuitId WHERE circuits.name = 'Austrian Grand Prix Circuit';	formula_1
SELECT c.name, d.forename, d.surname, lt.lap, lt.time, lt.milliseconds FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes lt ON r.raceId = lt.raceId JOIN drivers d ON lt.driverId = d.driverId WHERE c.country = 'Italy' ORDER BY lt.milliseconds ASC;	formula_1
SELECT r.name FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.driverId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix' AND lt.milliseconds = (     SELECT MIN(milliseconds)     FROM lapTimes lt2     JOIN races r2 ON lt2.driverId = r2.raceId     JOIN circuits c2 ON r2.circuitId = c2.circuitId     WHERE c2.name = 'Austrian Grand Prix' );	formula_1
SELECT pitStops.duration  FROM pitStops  JOIN races ON pitStops.raceId = races.circuitId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.name = 'Austrian Grand Prix'  AND pitStops.driverId = (     SELECT driverId      FROM driverStandings      WHERE raceId = races.circuitId      ORDER BY duration ASC      LIMIT 1 );	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN (     SELECT raceId, MIN(time) AS minTime     FROM lapTimes     GROUP BY raceId ) lt ON r.circuitId = lt.raceId WHERE lt.minTime = "1:29.488";	formula_1
SELECT AVG(pitStops.milliseconds)  FROM pitStops  JOIN drivers ON pitStops.driverId = drivers.driverId  WHERE drivers.surname = 'Hamilton';	formula_1
SELECT AVG(lt.milliseconds)  FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy';	formula_1
SELECT player_api_id  FROM Player_Attributes  WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT pa.preferred_foot FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.overall_rating BETWEEN 60 AND 65 AND pa.defensive_work_rate = 'low';	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.id WHERE pa.crossing = (SELECT MAX(crossing) FROM Player_Attributes) GROUP BY pa.player_api_id ORDER BY pa.crossing DESC LIMIT 5;	european_football_2
SELECT League.id, League.country_id FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.id, League.country_id ORDER BY SUM(Match.home_team_goal + Match.away_team_goal) DESC LIMIT 1;	european_football_2
SELECT      M.home_team_api_id,      T.team_long_name,     COUNT(M.home_team_api_id) AS lost_matches_count FROM      Match M JOIN      Team T ON M.home_team_api_id = T.team_api_id WHERE      M.season = '2015/2016' AND      M.home_team_goal < M.away_team_goal GROUP BY      M.home_team_api_id,      T.team_long_name ORDER BY      lost_matches_count ASC LIMIT 1;	european_football_2
SELECT P.player_name, SUM(PA.penalties) as total_penalties FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id GROUP BY P.player_api_id ORDER BY total_penalties DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM Match M JOIN Team T ON M.away_team_api_id = T.team_long_name WHERE M.season = '2009/2010' AND M.away_team_goal > M.home_team_goal AND M.name = 'Scotland Premier League' GROUP BY T.team_long_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT team_long_name, MAX(buildUpPlaySpeed) AS max_build_up_play_speed FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team_Attributes.buildUpPlaySpeedClass = 'High' GROUP BY Team_Attributes.team_api_id ORDER BY max_build_up_play_speed DESC LIMIT 4;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(CASE WHEN M.home_team_goal = M.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1;	european_football_2
SELECT      P.player_name,     TIMESTAMPDIFF(YEAR, P.birthday, CURDATE()) AS current_age FROM      Player P JOIN      Player_Attributes PA ON      P.player_api_id = PA.player_api_id WHERE      PA.sprint_speed >= 97     AND PA.date BETWEEN "2013-01-01 00:00:00" AND "2015-12-31 23:59:59";	european_football_2
SELECT League.name, COUNT(Match.match_api_id) AS total_matches FROM League JOIN Match ON League.id = Match.league_id GROUP BY League.id ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';	european_football_2
SELECT pa.player_api_id FROM Player_Attributes pa WHERE substr(pa.date, 1, 4) = '2010' GROUP BY pa.player_api_id HAVING pa.overall_rating > (     SELECT AVG(pa2.overall_rating)     FROM Player_Attributes pa2     WHERE substr(pa2.date, 1, 4) = '2010' ) ORDER BY pa.overall_rating DESC LIMIT 1;	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT t.team_long_name FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE strftime('%Y', ta.date) = '2012' AND ta.buildUpPlayPassing > (     SELECT AVG(ta2.buildUpPlayPassing)     FROM Team_Attributes ta2     WHERE ta2.buildUpPlayPassing IS NOT NULL     AND strftime('%Y', ta2.date) = '2012' )	european_football_2
SELECT      ROUND((SUM(CASE WHEN pa.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT p.player_fifa_api_id), 2) AS percentage_left_foot_players FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      pa.preferred_foot = 'left'      AND p.birthday BETWEEN '1987-01-01' AND '1992-12-31';	european_football_2
SELECT League.name, SUM(Match.home_team_goal + Match.away_team_goal) AS total_goals FROM Match JOIN League ON Match.league_id = League.id GROUP BY League.id, League.name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT      AVG(long_shots) AS average_long_shots FROM      Player_Attributes  JOIN      Player  ON      Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id WHERE      Player.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT P.player_name, AVG(PA.heading_accuracy) AS avg_heading_accuracy FROM Player P JOIN Player_Attributes PA ON P.player_fifa_api_id = PA.player_fifa_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS TA JOIN Team AS T2 ON TA.team_api_id = T2.team_api_id WHERE TA.buildUpPlayDribblingClass = 'Normal' AND TA.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND TA.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY TA.chanceCreationPassing DESC;	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.name = (SELECT name FROM League WHERE id = M.league_id) WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal);	european_football_2
SELECT `team_short_name` FROM `Team` WHERE `team_long_name` = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10';	european_football_2
SELECT pa.attacking_work_rate FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Franco Zennaro';	european_football_2
SELECT 'Team_Attributes.buildUpPlayPositioningClass'  FROM 'Team'  JOIN 'Team_Attributes' ON 'Team.team_api_id' = 'Team_Attributes.team_api_id'  WHERE 'Team.team_long_name' = 'ADO Den Haag' AND 'Team_Attributes.buildUpPlayPositioningClass' LIKE '%freedom of movement%'	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Francois Affolter') AND date = '2014-09-18 00:00:00';	european_football_2
SELECT pa.overall_rating FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011';	european_football_2
SELECT COUNT(m.id)  FROM Match m  JOIN League l ON m.season = '2015/2016' AND l.name = 'Scotland Premier League' JOIN Country c ON l.country_id = c.id WHERE c.name = 'Scotland';	european_football_2
SELECT pa.preferred_foot FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.weight < 130 AND Player_Attributes.preferred_foot = 'left';	european_football_2
SELECT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson');	european_football_2
SELECT p.birthday FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT l.name  FROM League l  JOIN Country c ON l.country_id = c.id  WHERE c.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN League ON Match.league_id = League.id  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_name = pa.player_name WHERE p.height = (SELECT MAX(height) FROM Player) OR p.height = (SELECT MIN(height) FROM Player) GROUP BY p.player_name ORDER BY AVG(pa.finishing) DESC LIMIT 1;	european_football_2
SELECT player_name  FROM Player  WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT `potential` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_api_id` = `Player.player_api_id` WHERE `Player.player_name` = 'Aaron Doran';	european_football_2
SELECT pa.player_name FROM Player pa JOIN Player_Attributes pa_attr ON pa.player_api_id = pa_attr.player_api_id WHERE pa_attr.preferred_foot = 'left';	european_football_2
SELECT team_long_name  FROM Team  JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id  WHERE Team_Attributes.buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_short_name = 'CLB';	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > 70;	european_football_2
SELECT AVG(pa.overall_rating) AS average_rating FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE strftime('%Y', pa.date) BETWEEN '2010' AND '2015' AND p.height > 170;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT Country.name FROM League JOIN Country ON League.name = 'Italy Serie A'	european_football_2
SELECT team_short_name FROM Team JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T.team_short_name FROM Team T JOIN Match M ON T.team_api_id = M.home_team_api_id WHERE M.home_team_goal = 10;	european_football_2
SELECT p.player_name, pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61) AND pa.potential = 61;	european_football_2
SELECT      AVG(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE 0 END) -      AVG(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE 0 END) AS ball_control_difference FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      p.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT `team_long_name` FROM `Team` WHERE `team_short_name` = 'GEN'	european_football_2
SELECT      CASE          WHEN P1.birthday > P2.birthday THEN 'Aaron Lennon'          WHEN P1.birthday < P2.birthday THEN 'Abdelaziz Barrada'          ELSE 'Both are the same age'      END AS Older_Player FROM      Player P1  CROSS JOIN      Player P2  WHERE      P1.player_name = 'Aaron Lennon' AND P2.player_name = 'Abdelaziz Barrada';	european_football_2
SELECT player_name, height  FROM Player  WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT COUNT(*) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT Country.name FROM League JOIN Country ON League.name = 'Belgium Jupiler League' WHERE Country.name = League.name;	european_football_2
SELECT League.name FROM League JOIN Country ON League.id = Country.id WHERE Country.name = 'Germany';	european_football_2
SELECT p.player_name, pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT DISTINCT p.player_api_id FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, pa.crossing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT heading_accuracy  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Ariel Borysiuk');	european_football_2
SELECT COUNT(*) FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height > 180 AND Player_Attributes.volleys > 70;	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium');	european_football_2
SELECT pa.long_passing  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT L.id, L.id AS league_name, COUNT(M.id) AS match_count FROM League AS L JOIN Match AS M ON L.id = M.league_id WHERE M.season = '2008/2009' GROUP BY L.id ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG('Player_Attributes.overall_rating')  FROM 'Player_Attributes' JOIN 'Player' ON 'Player_Attributes.player_api_id' = 'Player.player_api_id' WHERE strftime('%Y', 'Player.birthday') < '1986';	european_football_2
SELECT     (         (p1.overall_rating - p2.overall_rating) * 100.0 / p2.overall_rating     ) AS rating_difference_percentage FROM     Player_Attributes p1 JOIN     Player p ON p1.player_api_id = p.player_api_id JOIN     Player_Attributes p2 ON p1.player_fifa_api_id = p2.player_fifa_api_id WHERE     p.player_name = 'Ariel Borysiuk' AND p2.player_name = 'Paulin Puel'	european_football_2
SELECT AVG(`buildUpPlaySpeed`)  FROM `Team_Attributes` JOIN `Team` ON `Team_Attributes.team_fifa_api_id` = `Team.team_fifa_api_id` WHERE `Team.team_long_name` = 'Heart of Midlothian';	european_football_2
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino';	european_football_2
SELECT SUM(pa.crossing) AS total_crossing_score FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing), chanceCreationPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Ajax' GROUP BY chanceCreationPassingClass ORDER BY MAX(chanceCreationPassing) DESC LIMIT 1;	european_football_2
SELECT `preferred_foot` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes.player_fifa_api_id` = `Player.player_fifa_api_id` WHERE `Player.player_name` = 'Abdou Diallo';	european_football_2
SELECT MAX(`overall_rating`)  FROM `Player_Attributes` JOIN `Player` AS T2 ON `Player_Attributes`.`player_api_id` = T2.`player_api_id` WHERE T2.`player_name` = 'Dorlan Pabon';	european_football_2
SELECT AVG(away_team_goal)  FROM Match  JOIN Team ON Match.away_team_api_id = Team.team_api_id  JOIN League ON Team.team_api_id = League.id  WHERE Team.team_long_name = 'Parma' AND League.name = 'Italy Serie A';	european_football_2
SELECT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating = 77 AND PA.date LIKE '2016-06-23%' ORDER BY P.birthday LIMIT 1;	european_football_2
SELECT `overall_rating` FROM `Player_Attributes` JOIN `Player` ON `Player_Attributes`.`player_api_id` = `Player`.`player_api_id` WHERE `Player`.`player_name` = 'Aaron Mooy' AND `Player_Attributes`.`date` LIKE '2016-02-04%';	european_football_2
SELECT `potential` FROM `Player_Attributes` WHERE `player_api_id` IN (SELECT `player_api_id` FROM `Player` WHERE `player_name` = 'Francesco Parravicini') AND `date` = '2010-08-30 00:00:00';	european_football_2
SELECT attacking_work_rate  FROM Player_Attributes  WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate  FROM Player_Attributes  WHERE date = '2013-02-22 00:00:00'  AND player_name = 'Kevin Berigaud';	european_football_2
SELECT date FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Kevin Constant' ORDER BY pa.crossing DESC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_api_id = (     SELECT team_api_id     FROM Team     WHERE team_long_name = 'Willem II' ) AND date = '2011-02-22'	european_football_2
SELECT `buildUpPlayDribblingClass` FROM `Team_Attributes` WHERE `team_api_id` IN (SELECT `team_api_id` FROM `Team` WHERE `team_short_name` = 'LEI') AND `date` = '2015-09-10 00:00:00'	european_football_2
SELECT buildUpPlayPassingClass  FROM Team_Attributes  WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%';	european_football_2
SELECT chanceCreationPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'PEC Zwolle' AND Team_Attributes.date = '2013-09-20 00:00:00';	european_football_2
SELECT chanceCreationCrossingClass FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Hull City') AND date = '2010-02-22 00:00:00';	european_football_2
SELECT `defenceAggressionClass` FROM `Team_Attributes` WHERE `team_long_name` = 'Hannover 96' AND `date` LIKE '2015-09-10%';	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Marko Arnautovic'  AND LEFT(date, 10) BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      (SELECT overall_rating FROM Player_Attributes WHERE player_api_id =          (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan') AND date = '2013-07-12') -      (SELECT overall_rating FROM Player_Attributes WHERE player_api_id =          (SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery') AND date = '2013-07-12') /      (SELECT overall_rating FROM Player_Attributes WHERE player_api_id =          (SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan') AND date = '2013-07-12') * 100 AS percentage_difference	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT player_api_id  FROM Player  ORDER BY weight DESC  LIMIT 10;	european_football_2
SELECT p.player_name FROM Player p WHERE p.birthday <= DATE('now', '-35 years')	european_football_2
SELECT SUM(home_team_goal) AS home_goals_scored_by_Aaron_Lennon FROM Match JOIN Player ON Match.home_player_1 = Player.player_api_id OR               Match.home_player_2 = Player.player_api_id OR               Match.home_player_3 = Player.player_api_id OR               Match.home_player_4 = Player.player_api_id OR               Match.home_player_5 = Player.player_api_id OR               Match.home_player_6 = Player.player_api_id OR               Match.home_player_7 = Player.player_api_id OR               Match.home_player_8 = Player.player_api_id OR               Match.home_player_9 = Player.player_api_id OR               Match.home_player_10 = Player.player_api_id OR               Match.home_player_11 = Player.player_api_id WHERE Player.player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(a.away_team_goal) AS total_away_goals FROM Match a JOIN Player p1 ON a.away_player_1 = p1.player_name AND p1.player_name = 'Daan Smith' JOIN Player p2 ON a.away_player_2 = p2.player_name AND p2.player_name = 'Filipe Ferreira';	european_football_2
SELECT SUM(home_team_goal) AS total_home_goals FROM Match JOIN Player ON home_player_1 = player_api_id OR               home_player_2 = player_api_id OR               home_player_3 = player_api_id OR               home_player_4 = player_api_id OR               home_player_5 = player_api_id OR               home_player_6 = player_api_id OR               home_player_7 = player_api_id OR               home_player_8 = player_api_id OR               home_player_9 = player_api_id OR               home_player_10 = player_api_id OR               home_player_11 = player_api_id WHERE (strftime('%Y', CURRENT_TIMESTAMP, 'localtime') - strftime('%Y', birthday, 'localtime')) < 31 GROUP BY home_team_api_id;	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes);	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT DISTINCT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id JOIN Match M ON P.player_api_id = M.home_player_1 OR P.player_api_id = M.home_player_2 OR                  P.player_api_id = M.home_player_3 OR P.player_api_id = M.home_player_4 OR                  P.player_api_id = M.home_player_5 OR P.player_api_id = M.home_player_6 OR                  P.player_api_id = M.home_player_7 OR P.player_api_id = M.home_player_8 OR                  P.player_api_id = M.home_player_9 OR P.player_api_id = M.home_player_10 OR                  P.player_api_id = M.home_player_11 OR P.player_api_id = M.away_player_1 OR                  P.player_api_id = M.away_player_2 OR P.player_api_id = M.away_player_3 OR                  P.player_api_id = M.away_player_4 OR P.player_api_id = M.away_player_5 OR                  P.player_api_id = M.away_player_6 OR P.player_api_id = M.away_player_7 OR                  P.player_api_id = M.away_player_8 OR P.player_api_id = M.away_player_9 OR                  P.player_api_id = M.away_player_10 OR P.player_api_id = M.away_player_11 WHERE PA.attacking_work_rate = 'high' AND M.stage = 1 AND ((M.home_player_X1 IS NOT NULL AND P.player_api_id = M.home_player_X1) OR      (M.home_player_X2 IS NOT NULL AND P.player_api_id = M.home_player_X2) OR      (M.home_player_X3 IS NOT NULL AND P.player_api_id = M.home_player_X3) OR      (M.home_player_X4 IS NOT NULL AND P.player_api_id = M.home_player_X4) OR      (M.home_player_X5 IS NOT NULL AND P.player_api_id = M.home_player_X5) OR      (M.home_player_X6 IS NOT NULL AND P.player_api_id = M.home_player_X6) OR      (M.home_player_X7 IS NOT NULL AND P.player_api_id = M.home_player_X7) OR      (M.home_player_X8 IS NOT NULL AND P.player_api_id = M.home_player_X	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT p.player_name  FROM Player p  JOIN Country c ON p.player_fifa_api_id = c.id  WHERE c.name = 'Belgium';	european_football_2
SELECT P.player_name, C.name AS country_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id JOIN Country C ON P.player_fifa_api_id = C.id WHERE PA.vision > 89;	european_football_2
SELECT      c.name AS Country,      AVG(p.weight) AS AvgWeight FROM      Player p JOIN      Country c ON p.player_api_id IN (SELECT player_api_id FROM Player_Attributes) GROUP BY      c.name ORDER BY      AvgWeight DESC LIMIT 1;	european_football_2
SELECT `team_long_name` FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE `buildUpPlaySpeedClass` = 'Slow';	european_football_2
SELECT t.team_short_name FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE ta.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(height) AS average_height FROM Player JOIN Country ON Player.player_fifa_api_id IN (     SELECT player_fifa_api_id     FROM Player     JOIN Country ON Player.player_fifa_api_id = Country.player_fifa_api_id     WHERE Country.name = 'Italy' )	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE player_api_id = (SELECT id FROM Player WHERE id = 6)) -        (SELECT jumping FROM Player_Attributes WHERE player_api_id = (SELECT id FROM Player WHERE id = 23)) AS jump_difference	european_football_2
SELECT p.player_api_id FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right')   AND pa.preferred_foot = 'right' ORDER BY pa.potential LIMIT 5;	european_football_2
SELECT COUNT(DISTINCT pa.player_api_id) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = pa.crossing) AND pa.preferred_foot = 'left';	european_football_2
SELECT     ROUND((COUNT(CASE WHEN pa.stamina > 80 AND pa.strength > 80 THEN 1 END) * 100.0) / COUNT(*), 2) AS percentage FROM     Player_Attributes pa JOIN     Player p ON pa.id = p.player_api_id;	european_football_2
SELECT C.name FROM League L JOIN Country C ON L.country_id = C.id WHERE L.name = "Poland Ekstraklasa";	european_football_2
SELECT      M.home_team_goal AS home_score,      M.away_team_goal AS away_score FROM      Match M JOIN      Team H ON M.home_team_api_id = H.team_api_id JOIN      Team A ON M.away_team_api_id = A.team_api_id JOIN      League L ON M.league_id = L.league_id WHERE      L.name = 'Belgium Jupiler League'      AND M.date LIKE '2008-09-24%'     AND H.team_long_name = 'KRC Genk'     AND A.team_long_name = 'Beerschot AC';	european_football_2
SELECT 'sprint_speed', 'agility', 'acceleration' FROM 'Player_Attributes' pa JOIN 'Player' p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Alexis Blin';	european_football_2
SELECT buildUpPlaySpeedClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = "Italy Serie A") AND season = "2015/2016";	european_football_2
SELECT MAX(home_team_goal) AS highest_score FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Netherlands Eredivisie';	european_football_2
SELECT finishing, curve  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 1);	european_football_2
SELECT League.id, League.name, COUNT(Match.id) as games_count FROM League JOIN Match ON League.id = Match.league_id WHERE Match.season = '2015/2016' GROUP BY League.id, League.name ORDER BY games_count DESC LIMIT 4;	european_football_2
SELECT t.team_long_name FROM Team t JOIN Match m ON t.team_long_name = m.away_team_api_id WHERE m.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT     ROUND(         (COUNT(CASE WHEN p.height < 180 AND pa.overall_rating > 70 THEN 1 END) * 100.0) / COUNT(p.player_fifa_api_id),         2     ) AS percentage_under_180_over_70_strength FROM     Player p JOIN     Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id;	european_football_2
SELECT     CASE         WHEN SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) > SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END) THEN             (SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)) /              SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END) * 100         ELSE             (SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END) - SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END)) /              SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) * 100     END AS Percentage_Deviation FROM     Patient;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN YEAR('Birthday') > '1930' THEN '1' END) * 100.0) / COUNT('ID') AS PercentageOfFemalesBornAfter1930 FROM      'Patient' WHERE      'SEX' = 'F'	thrombosis_prediction
SELECT      (SELECT COUNT(*)       FROM Patient       WHERE YEAR(Birthday) BETWEEN 1930 AND 1940 AND Admission = '+') * 100.0 /      (SELECT COUNT(*)       FROM Patient       WHERE YEAR(Birthday) BETWEEN 1930 AND 1940) AS Inpatient_Percentage;	thrombosis_prediction
SELECT      (COUNT(CASE WHEN 'Examination.Diagnosis' = 'SLE' AND 'Patient.Admission' = '+' THEN 'Examination.ID' END) /       COUNT(CASE WHEN 'Examination.Diagnosis' = 'SLE' AND 'Patient.Admission' = '-' THEN 'Examination.ID' END)) AS SLE_Outpatient_to_Inpatient_Ratio FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Diagnosis = 'SLE';	thrombosis_prediction
SELECT p.Diagnosis, l.Date FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609;	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday, Examination.Examination_Date, Examination.Symptoms FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.LDH WHERE l.LDH > 500;	thrombosis_prediction
SELECT      p.ID,      (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) AS Age FROM      Patient p JOIN      Examination e ON p.ID = e.ID WHERE      e.RVVT = '+';	thrombosis_prediction
SELECT p.ID, p.SEX, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1937-05-02' AND l.`T-CHO` >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.aCL_IgG WHERE Examination.aCL_IgG < 3.5;	thrombosis_prediction
SELECT     (COUNT(CASE WHEN P.SEX = 'F' AND L.TP < 6.0 OR L.TP > 8.5 THEN 1 END) * 100.0) / COUNT(P.ID) AS PercentageOfFemalesWithAbnormalTP FROM     Patient P JOIN     Laboratory L ON P.ID = L.ID	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS avg_aCL_IgG FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Admission = '+' AND (YEAR(CURRENT_TIMESTAMP) - YEAR(Patient.Birthday)) >= 50;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F'  AND EXTRACT(YEAR FROM Description) = 1997  AND Admission = '-';	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS AgeAtArrival FROM Patient WHERE `First Date` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = 1 AND E.Examination_Date BETWEEN '1997-01-01' AND '1997-12-31' AND P.SEX = 'F';	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM Patient WHERE EXISTS (     SELECT 1     FROM Laboratory     WHERE Laboratory.ID = Patient.ID       AND Laboratory.TG >= 200 );	thrombosis_prediction
SELECT E.Diagnosis, P.Birthday FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday = (SELECT MIN(Birthday) FROM Patient) AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT      CASE MONTH(Date)         WHEN 1 THEN COUNT(ID) / 12         WHEN 2 THEN COUNT(ID) / 12         WHEN 3 THEN COUNT(ID) / 12         WHEN 4 THEN COUNT(ID) / 12         WHEN 5 THEN COUNT(ID) / 12         WHEN 6 THEN COUNT(ID) / 12         WHEN 7 THEN COUNT(ID) / 12         WHEN 8 THEN COUNT(ID) / 12         WHEN 9 THEN COUNT(ID) / 12         WHEN 10 THEN COUNT(ID) / 12         WHEN 11 THEN COUNT(ID) / 12         WHEN 12 THEN COUNT(ID) / 12     END AS Average_Male_Patients_Per_Month FROM      Laboratory     INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE      Patient.SEX = 'M'      AND Laboratory.Date BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY      MONTH(Laboratory.Date);	thrombosis_prediction
SELECT      p.Birthday AS InitialHospitalDate,     (SELECT `First Date` FROM Patient WHERE p.ID = ID AND `First Date` IS NOT NULL ORDER BY `First Date` ASC LIMIT 1) AS InitialArrivalDate,     (SELECT (YEAR(`First Date`) - YEAR(p.Birthday)) FROM Patient WHERE p.ID = ID AND `First Date` IS NOT NULL ORDER BY `First Date` ASC LIMIT 1) AS AgeAtInitialArrival FROM      Patient p WHERE      p.Diagnosis = 'SJS' ORDER BY      p.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT      (SUM(CASE WHEN p.SEX = 'M' AND l.UA <= 8 THEN 1 ELSE 0 END) * 1.0) /      (SUM(CASE WHEN p.SEX = 'F' AND l.UA <= 6.5 THEN 1 ELSE 0 END) * 1.0) AS MaleToFemaleRatio FROM Patient p JOIN Laboratory l ON p.ID = l.ID	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  LEFT JOIN Examination e ON p.ID = e.ID AND e.`Examination Date` >= DATE_ADD(p.`First Date`, INTERVAL 1 YEAR)  WHERE e.ID IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS underage_patients_examined FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Patient.Birthday < '1990-01-01' AND YEAR(Examination.`Examination Date`) BETWEEN 1990 AND 1993;	thrombosis_prediction
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.T_BIL >= 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS count FROM Examination WHERE Examination_Date BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY count DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(SUBTRACT('1999', year(P.Birthday))) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT      (YEAR(CURRENT_DATE) - YEAR(P.Birthday)) AS Age,     E.Diagnosis FROM      Patient P JOIN      Examination E ON P.Birthday = (SELECT MAX(HGB) FROM Laboratory L WHERE L.ID = E.ID) JOIN      Laboratory L ON E.ID = L.ID ORDER BY      Age DESC LIMIT 1;	thrombosis_prediction
SELECT `aCL IgG`, `aCL IgM`, `aCL IgA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT T-CHO  FROM Laboratory  WHERE ID = 2927464  AND Date = '1995-09-04'  AND T-CHO IS NOT NULL  AND T-CHO < 250;	thrombosis_prediction
SELECT P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis LIKE '%AORTITIS%' ORDER BY E.ID ASC LIMIT 1;	thrombosis_prediction
SELECT `aCL IgM` FROM Examination WHERE `Examination Date` = '1993-11-12' AND Diagnosis = 'SLE' AND ID IN (SELECT ID FROM Patient WHERE Description = '1994-02-19');	thrombosis_prediction
SELECT P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX IN ('M', 'F') AND L.GPT = '9' AND L.Date = '1992-06-12';	thrombosis_prediction
SELECT      (strftime('%Y', '1991-10-21') - strftime('%Y', Birthday)) AS Age FROM      Patient JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.UA = '8.4' AND      Laboratory.Date = '1991-10-21';	thrombosis_prediction
SELECT COUNT('Laboratory.ID') FROM 'Patient' JOIN 'Laboratory' ON 'Patient.ID' = 'Laboratory.ID' WHERE 'Patient.First Date' = '1991-06-13' AND 'Patient.Diagnosis' = 'SJS' AND 'Laboratory.Date' BETWEEN '1995-01-01' AND '1995-12-31';	thrombosis_prediction
SELECT p.Diagnosis AS OriginalDiagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.`First Date` = '1997-01-27' AND e.`Diagnosis` = 'SLE';	thrombosis_prediction
SELECT E.Symptoms FROM Patient P JOIN Examination E ON P.ID = E.ExaminationDate WHERE P.Birthday = '1959-03-01' AND E.'Examination Date' = '1993-09-27';	thrombosis_prediction
SELECT      (SUM(CASE WHEN p.ID = 12052 AND l.Date LIKE '1981-11-%' THEN l.T-CHO ELSE 0 END) -      SUM(CASE WHEN p.ID = 12052 AND l.Date LIKE '1981-12-%' THEN l.T-CHO ELSE 0 END)) AS DecreaseRate FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1959-02-18'	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis LIKE '%Behcet%' AND E.Examination_Date BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.Examination Date BETWEEN '1987-07-06' AND '1996-01-31' AND Laboratory.GOT > 30 AND Laboratory.ALB < 4;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' ORDER BY ID;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND 'ANA Pattern' = 'S' AND 'aCL IgM' > (SELECT AVG('aCL IgM') * 1.2 FROM Examination);	thrombosis_prediction
SELECT      ROUND(         (COUNT(CASE WHEN L.UA <= 6.5 THEN 1 END) * 100.0) /          COUNT(CASE WHEN L.U-PRO > 0 AND L.U-PRO < 30 THEN 1 END),          2     ) AS Percentage FROM      Laboratory AS L JOIN      Patient AS P ON L.ID = P.ID WHERE      L.U-PRO > 0 AND L.U-PRO < 30;	thrombosis_prediction
SELECT      (SUM(CASE WHEN `Diagnosis` = 'BEHCET' AND YEAR(`First Date`) = '1981' THEN 1 ELSE 0 END) * 100.0) /      COUNT(CASE WHEN YEAR(`First Date`) = '1981' THEN 1 ELSE NULL END) AS PercentageBEHCET FROM      Patient WHERE      SEX = 'M' AND      YEAR(`First Date`) = '1981';	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND ID NOT IN (SELECT ID FROM Examination WHERE 'ANA Pattern' = 'P');	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID AND e.Examination_Date = l.Date WHERE e.Diagnosis = 'PSS' AND l.CRP > 2 AND l.CRE = 1 AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB)  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.SEX = 'F'  AND Laboratory.PLT > 400  AND Patient.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis LIKE '%SLE%' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1;	thrombosis_prediction
SELECT MIN('Examination.Date') AS FirstDocumentationDate, 'Examination.Diagnosis' AS Disease FROM 'Patient' JOIN 'Examination' ON 'Patient.ID' = 'Examination.ID' WHERE 'Patient.ID' = 48473;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE YEAR(Examination.Examination Date) = 1997 AND Examination.TP > 6 AND Examination.TP < 8.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Examination.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN Examination.Symptoms LIKE '%ITP%' THEN 1 ELSE 0 END), 0)) * 100 AS Proportion_SLE_With_Thrombocytopenia FROM Examination;	thrombosis_prediction
SELECT      (SUM(CASE WHEN YEAR(Birthday) = 1980 AND Diagnosis = 'RA' THEN 1 ELSE 0 END) * 100) /      SUM(CASE WHEN YEAR(Birthday) = 1980 THEN 1 ELSE 0 END) AS PercentageOfWomenWithRA FROM      Patient P JOIN      Examination E ON P.ID = E.ID WHERE      YEAR(P.Birthday) = 1980 AND E.Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND e.Diagnosis LIKE '%Behcet disease%' AND e.Diagnosis NOT LIKE '%hospital%'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON e.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF('Examination.Examination Date', 'Patient.First Date')  FROM 'Patient'  JOIN 'Examination' ON 'Patient.ID' = 'Examination.ID'  WHERE 'Patient.ID' = 821298;	thrombosis_prediction
SELECT     Patient.SEX,     Laboratory.UA FROM     Laboratory JOIN     Patient ON Laboratory.ID = Patient.ID WHERE     Patient.ID = 57266     AND (Patient.SEX = 'M' AND Laboratory.UA > 8.0 OR          Patient.SEX = 'F' AND Laboratory.UA > 6.5);	thrombosis_prediction
SELECT Laboratory.Date FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.ID = 48473 AND Laboratory.GOT >= 60;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID AND E.ID = L.ID WHERE L.GOT < 60 AND YEAR(E.Examination Date) = 1994;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT p.ID, p.Birthday, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT AVG(LDH) AS Average_LDH FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT p.ID,         (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.LDH WHERE l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT      P.ID,      P.Admission FROM      Patient AS P JOIN      Laboratory AS L ON      P.ID = L.ID WHERE      L.ALP < 300;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.TP WHERE l.TP < 6.0;	thrombosis_prediction
SELECT     Patient.ID,     (Laboratory.TP - 8.5) AS TP_Deviation FROM     Patient JOIN     Laboratory ON Patient.ID = Laboratory.ID WHERE     Patient.SEX = 'F'     AND Laboratory.TP > 8.5	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p WHERE p.SEX = 'M' AND p.ALB <= 3.5 OR p.ALB >= 5.5 ORDER BY p.Birthday DESC;	thrombosis_prediction
SELECT      p.ID,      p.SEX,      p.Birthday,      CASE          WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes'         ELSE 'No'     END AS IsAlbinWithinNormalRange FROM      Patient p LEFT JOIN      Laboratory l ON p.ID = l.ID AND Year(l.Date) = '1982' WHERE      Year(p.Birthday) = '1982';	thrombosis_prediction
SELECT      (COUNT(CASE WHEN Lab.UA > 6.5 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_Female_UA_Beyond_Normal FROM      Patient Pat JOIN      Examination Exam ON Pat.ID = Exam.ID JOIN      Laboratory Lab ON Exam.ID = Lab.UA WHERE      Pat.SEX = 'F';	thrombosis_prediction
SELECT AVG(UA) AS Average_UA_Index FROM Laboratory WHERE UA < 6.5 AND SEX = 'F'    OR UA < 8.0 AND SEX = 'M'    AND ID IN (SELECT ID FROM Examination GROUP BY ID ORDER BY MAX(`Examination Date`) DESC)	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'RA' AND l.UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5;	thrombosis_prediction
SELECT      (SUM(CASE WHEN Sex = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END) >       SUM(CASE WHEN Sex = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END)) AS more_males_than_females FROM      Patient  JOIN      Laboratory  ON      Patient.ID = Laboratory.ID;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.T_BIL = (SELECT MAX(T_BIL) FROM Laboratory)	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT ID) AS Patient_IDs FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE T_BIL >= 2.0 GROUP BY SEX;	thrombosis_prediction
SELECT P.ID, L.T-CHO FROM Patient P JOIN Laboratory L ON P.ID = L.T-CHO WHERE P.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY L.T-CHO DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(DIVIDE(SUBTRACT(YEAR(NOW()), YEAR(Birthday)), COUNT(ID))) as AverageAge FROM Patient WHERE SEX = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND (YEAR(CURRENT_TIMESTAMP) - YEAR(p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) AS MalePatientsWithHighCPK FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND Patient.SEX = 'M' AND Laboratory.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l.T-CHO < 250;	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU < 180 AND EXTRACT(YEAR FROM p.Description) = 1991;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE (e.WBC <= 3.5 OR e.WBC >= 9.0) GROUP BY p.SEX, p.Birthday ORDER BY p.SEX, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) ASC;	thrombosis_prediction
SELECT p.ID,         TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age,         p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RBC < 3.5;	thrombosis_prediction
SELECT      P.ID,     P.SEX,     P.Birthday,     P.Admission FROM      Patient P WHERE      P.SEX = 'F' AND      (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM P.Birthday)) >= 50 AND      P.Admission = '+' AND      EXISTS (         SELECT 1         FROM Examination E         WHERE              E.ID = P.ID AND              (E.RBC <= 3.5 OR E.RBC >= 6.0)     );	thrombosis_prediction
SELECT E.ID, P.SEX FROM Examination E JOIN Laboratory L ON E.ID = L.ID JOIN Patient P ON E.ID = P.Admission WHERE P.Admission = '-' AND L.HGB < 10;	thrombosis_prediction
SELECT      p.ID,      p.SEX  FROM      Patient p  JOIN      Examination e ON p.ID = e.ID  WHERE      e.Diagnosis = 'SLE'      AND p.Birthday = (         SELECT MAX(Birthday)          FROM Patient          WHERE ID IN (             SELECT ID              FROM Examination              WHERE Diagnosis = 'SLE'              AND HGB BETWEEN 10 AND 17         )     )	thrombosis_prediction
SELECT      p.ID,      (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) AS Age FROM      Patient p JOIN      (SELECT           ID,           COUNT(*) AS ExamCount      FROM           Laboratory      GROUP BY           ID      HAVING           COUNT(*) >= 2) lab ON      p.ID = lab.ID JOIN      (SELECT           ID,           MAX(HCT) AS MaxHCT      FROM           Laboratory      WHERE           HCT >= 52      GROUP BY           ID) hct ON      p.ID = hct.ID WHERE      lab.ExamCount > 2     AND hct.MaxHCT >= 52;	thrombosis_prediction
SELECT AVG(HCT)  FROM Laboratory  WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      (SELECT COUNT(*) FROM Laboratory WHERE PLT < 100) AS 'LowerThanNormal',     (SELECT COUNT(*) FROM Laboratory WHERE PLT > 400) AS 'HigherThanNormal'	thrombosis_prediction
SELECT DISTINCT P.SEX, P.Birthday, P.Description, P.Admission, P.Diagnosis FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE YEAR(L.Date) = 1984 AND P.Birthday IS NOT NULL AND (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) < 50 AND L.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT      ROUND((SUM(CASE WHEN PT >= 14 AND SEX = 'F' THEN 1 ELSE 0 END) * 100.0) / SUM(CASE WHEN PT >= 14 THEN 1 ELSE 0 END), 2) AS Percentage_Female_Abnormal_PT FROM      Patient  WHERE      SEX = 'F'      AND (EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM Birthday)) > 55	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday, p.Admission FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.`First Date` > '1992-12-31' AND e.PT < 14;	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE 'Examination Date' > '1997-01-01' AND 'RVVT' IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Examination  JOIN Patient ON Examination.ID = Patient.ID  WHERE Examination.APTT > 45 AND Examination.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.WBC > 3.5 AND l.WBC < 9.0 AND (l.FG <= 150 OR l.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Birthday > '1980-01-01' AND l.FG IS NOT NULL AND l.FG < 150 OR l.FG > 450;	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.U-PRO >= 30;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Diagnosis = 'SLE' AND e.aCL_IgG > 0 AND e.aCL_IgG < 30	thrombosis_prediction
SELECT DISTINCT P.ID FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG >= 2000;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG > 900 AND E.aCL_IgG < 2000 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT P.ID, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.IGA = (SELECT MAX(IGA) FROM Laboratory WHERE IGA BETWEEN 80 AND 500)	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.IGA > 80 AND Laboratory.IGA < 500 AND YEAR(Patient.`First Date`) >= 1990;	thrombosis_prediction
SELECT E.Diagnosis, COUNT(E.Diagnosis) AS DiseaseCount FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.IGM <= 40 OR L.IGM >= 400 GROUP BY E.Diagnosis ORDER BY DiseaseCount DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID IN (     SELECT DISTINCT Patient.ID     FROM Examination     JOIN Patient ON Examination.ID = Patient.ID     WHERE Examination.CRP = '+' ) AND Patient.Description IS NULL;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5 AND SUBDATE(CURDATE(), INTERVAL 70 YEAR) > P.Birthday;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Diagnosis LIKE '%RA%' AND e.KCT = '+';	thrombosis_prediction
SELECT DISTINCT E.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday > '1985-01-01' AND L.RA IN('-', '+-');	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RF < 20 AND (YEAR(CURDATE()) - YEAR(P.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RF < 20 AND e.Thrombosis = '0';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL_IgG > 35 AND E.ANA_Pattern = 'P';	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE NOT (29 < e.aCL_IgA AND e.aCL_IgA < 52) ORDER BY e.aCL_IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Symptoms = 'AMI' AND l.C4 > 10;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.Admission = '+' AND e.RNP IN ('-', '+-');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RNP NOT IN('-', '+-') ORDER BY p.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.ANA IN('-', '+-') AND E.Thrombosis = 0;	thrombosis_prediction
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.ANA_Pattern LIKE '%S%' AND e.ANA_Pattern NOT LIKE '%negative%' AND e.ANA_Pattern NOT LIKE '%0%' ORDER BY p.Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Examination_Date > '1997-01-01' AND L.SC170 IN('negative','0');	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.aCL_IgG IN('negative', '0')  AND P.SEX = 'F'  AND E.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Description IN ('-', '+') AND YEAR(P.First Date) < 2000;	thrombosis_prediction
SELECT ID  FROM Patient  WHERE Description NOT IN ('negative', '0')  ORDER BY First_Date ASC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE E.Diagnosis = 'SLE' AND E.aCL_IgG IN('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.ANA IN ('negative', '0') AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID AND l.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = p.ID) WHERE p.SEX = 'M' AND l.CENTROMEA IN('-', '+-') AND l.SSB IN('-', '+-');	thrombosis_prediction
SELECT p.ID, e.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.DNA IS NULL AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.DNA-II > 900 AND L.DNA-II < 2000 AND P.Admission = '+';	thrombosis_prediction
SELECT      ROUND(         (COUNT(CASE WHEN L.GOT >= 60 AND E.Diagnosis = 'SLE' THEN P.ID ELSE NULL END) * 1.0) /          COUNT(CASE WHEN L.GOT >= 60 THEN P.ID ELSE NULL END),          2     ) AS Percentage FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID JOIN      Examination E ON L.ID = E.ID;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MIN(`Birthday`)  FROM `Patient`  WHERE `ID` IN (     SELECT `ID`      FROM `Laboratory`      WHERE `GOT` >= 60 );	thrombosis_prediction
SELECT p.ID, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT IS NOT NULL AND l.GPT < 60 ORDER BY l.GPT DESC LIMIT 3;	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT < 60 AND P.SEX = 'M';	thrombosis_prediction
SELECT MIN(P.First_Date)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH < 500  ORDER BY L.LDH DESC  LIMIT 1;	thrombosis_prediction
SELECT MAX('Date')  FROM Laboratory  WHERE 'ID' IN (SELECT 'ID' FROM Patient WHERE 'First Date' = (SELECT MAX('First Date') FROM Patient))  AND 'LDH' >= 500;	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALP >= 300 AND P.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '-' AND l.ALP < 300;	thrombosis_prediction
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Examination.Diagnosis = 'SJS' AND Laboratory.TP > 6.0 AND Laboratory.TP < 8.5;	thrombosis_prediction
SELECT `Examination Date` FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.ALB > 3.5 AND Laboratory.ALB < 5.5 ORDER BY Laboratory.ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT E.aCL_IgG, E.aCL_IgM, E.aCL_IgA FROM Examination E JOIN Laboratory L ON E.ID = L.ID JOIN Patient P ON E.ID = P.ID WHERE P.SEX = 'F' AND L.UA > 6.50 AND L.UA = (SELECT MAX(UA) FROM Laboratory WHERE UA > 6.50) ORDER BY L.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(`aCL IgG`), MAX(`aCL IgM`), MAX(`aCL IgA`), MAX(ANA) FROM Examination WHERE CRE < 1.5 GROUP BY Patient.ID ORDER BY MAX(`aCL IgG`), MAX(`aCL IgM`), MAX(`aCL IgA`), MAX(ANA) DESC LIMIT 1;	thrombosis_prediction
SELECT Patient.ID FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5 AND Laboratory.aCL_IgA = (     SELECT MAX(Lab.aCL_IgA)     FROM Laboratory Lab     WHERE Lab.CRE < 1.5 )	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.T_BIL >= 2.0 AND e.ANA_Pattern LIKE '%P%';	thrombosis_prediction
SELECT Examination.aCL_IgG, Examination.aCL_IgM, Examination.ANA FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`T-BIL` < 2.0 ORDER BY Examination.`T-BIL` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.T_CHO >= 250 AND e.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`T-CHO` < 250 AND e.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.TG < 200 AND e.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.TG < 200 AND e.TG = (SELECT MAX(TG) FROM Examination WHERE TG < 200)	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Thrombosis = 0 AND l.CPK < 250;	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+');	thrombosis_prediction
SELECT p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU > 180 ORDER BY p.Birthday LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC <= 3.5 OR l.RBC >= 6.0 AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.PLT > 100 AND Examination.PLT < 400 AND Examination.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT P.ID, E.PLT FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Diagnosis = 'MCTD' AND E.PLT > 100 AND E.PLT < 400;	thrombosis_prediction
SELECT AVG(PT) AS AveragePT FROM Examination WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND PT < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis IN (2, 1) AND e.PT < 14;	thrombosis_prediction
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Angela' AND m.last_name = 'Sanders';	student_club
SELECT COUNT(*)  FROM member  WHERE link_to_major IN (     SELECT major_id      FROM major      WHERE college = 'College of Engineering' );	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.department WHERE ma.department = 'Art and Design Department';	student_club
SELECT COUNT(DISTINCT attendance.link_to_member)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_name  WHERE event.event_name = 'Women''s Soccer';	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.phone = SUBSTR(a.link_to_event, 5) JOIN event e ON a.link_to_event = CONCAT('rec', e.event_name) WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(DISTINCT a.link_to_member) FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium';	student_club
SELECT event.event_name, COUNT(a.link_to_event) AS attendance_count FROM event JOIN attendance a ON event.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.link_to_major = 'recxK3MHQFbR9J5uO' -- Assuming 'recxK3MHQFbR9J5uO' is the ID of the Student_Club major GROUP BY event.event_name ORDER BY attendance_count DESC LIMIT 1;	student_club
SELECT m.position, m.link_to_major, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_name = a.link_to_event  JOIN member m ON a.link_to_member = m.first_name AND m.last_name = 'Mclean' WHERE m.first_name = 'Maya';	student_club
SELECT COUNT(*) FROM event JOIN attendance ON event.event_name = 'Student_Club' JOIN member ON attendance.link_to_member = member.link_to_member WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND YEAR(event.event_date) = 2019;	student_club
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_member = event.event_id  WHERE event.type = 'Meeting'  GROUP BY event.event_id  HAVING COUNT(attendance.link_to_member) > 10;	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.event_name NOT LIKE '%fundraiser%' GROUP BY e.event_name HAVING COUNT(a.link_to_member) > 20;	student_club
SELECT      (COUNT(DISTINCT e.event_id) / COUNT(DISTINCT a.link_to_event)) AS average_attendance FROM      event e JOIN      attendance a ON e.event_id = a.link_to_event WHERE      e.type = 'Meeting' AND      e.event_date BETWEEN '2020-01-01' AND '2020-12-31'	student_club
SELECT expense_description, MAX(cost) as max_cost FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE type = 'Meeting' OR type = 'Election')) GROUP BY expense_description ORDER BY max_cost DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_name WHERE major.major_name = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies';	student_club
SELECT zip_code.county FROM member JOIN zip_code ON member.zip = zip_code.county WHERE member.member_id = 'SherriRamsey';	student_club
SELECT m.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Tyler' AND m.last_name = 'Hewitt';	student_club
SELECT i.amount FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT SUM(e.cost) as total_spent_on_food FROM expense e JOIN budget b ON e.link_to_budget = b.link_to_event JOIN event ev ON b.link_to_event = ev.event_name WHERE ev.event_name = 'September Meeting' AND e.expense_description LIKE '%Food%';	student_club
SELECT zip_code.city, zip_code.state FROM member JOIN zip_code ON member.zip = zip_code.zip WHERE member.member_id = 'president_id';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.state = 'Illinois';	student_club
SELECT SUM(e.cost) AS total_advertisement_spent FROM expense e JOIN budget b ON e.link_to_budget = b.link_to_event JOIN event ev ON b.link_to_event = ev.event_name JOIN member m ON e.link_to_member = m.zip JOIN zip_code z ON m.zip = z.state WHERE ev.event_name = 'September Meeting' AND b.category = 'Advertisement'	student_club
SELECT major.department FROM major JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Pierce' OR member.last_name = 'Guidi';	student_club
SELECT SUM(b.amount) AS total_budget FROM budget b JOIN event e ON b.link_to_event = e.event_name WHERE e.event_name = 'October Speaker'	student_club
SELECT e.approved FROM expense e JOIN event ev ON e.link_to_member = ev.event_name WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08';	student_club
SELECT SUM(`cost`) / COUNT(`cost`) AS average_cost FROM `expense` JOIN `member` ON `expense`.`link_to_member` = `member`.`member_id` WHERE `member`.`first_name` = 'Elijah' AND `member`.`last_name` = 'Allen' AND (SUBSTR(`expense_date`, 6, 2) = '09' OR SUBSTR(`expense_date`, 6, 2) = '10');	student_club
SELECT      (SUM(CASE WHEN LEFT(event_date, 4) = '2019' THEN spent ELSE 0 END) -       SUM(CASE WHEN LEFT(event_date, 4) = '2020' THEN spent ELSE 0 END)) AS difference FROM      budget JOIN      event ON budget.link_to_event = event.event_id;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review';	student_club
SELECT b.amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name LIKE '%Posters%' AND e.event_date = '2019-09-04';	student_club
SELECT b.remaining FROM budget b WHERE b.category = 'Food' AND b.amount = (SELECT MAX(budget.amount) FROM budget WHERE category = 'Food')	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*)  FROM major  WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.last_name = 'O''Gallagher';	student_club
SELECT COUNT(*) FROM budget b JOIN event e ON b.budget_id = e.event_name WHERE e.event_name = 'November Meeting' AND b.remaining < 0;	student_club
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_name  WHERE e.event_name = 'September Speaker';	student_club
SELECT e.event_status FROM event e JOIN expense ex ON e.event_id = ex.link_to_event WHERE ex.expense_description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, m.link_to_major, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_name WHERE m.first_name = 'Brent' AND m.last_name = 'Thomason';	student_club
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';	student_club
SELECT zip_code.type FROM member JOIN zip_code ON member.first_name = 'Christof' AND member.last_name = 'Nielson'	student_club
SELECT m.major_name FROM major m JOIN member me ON m.major_id = me.member_id WHERE me.position = 'Vice President';	student_club
SELECT zc.state FROM member m JOIN zip_code zc ON m.zip = zc.state WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison';	student_club
SELECT m.first_name, m.last_name, m.position, ma.department FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'President';	student_club
SELECT date_received  FROM income  WHERE source = 'Dues' AND link_to_member = (SELECT link_to_member FROM member WHERE first_name = 'Connor' AND last_name = 'Hilton');	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.link_to_member = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END)      / SUM(CASE WHEN e.event_name = 'October Meeting' AND b.category = 'Advertisement' THEN b.amount ELSE 0 END)) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id;	student_club
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) /       (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) +        SUM(CASE WHEN b.category != 'Parking' AND e.event_name = 'November Speaker' THEN b.amount ELSE 0 END))) * 100 AS parking_budget_percentage FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'November Speaker';	student_club
SELECT SUM(cost) AS total_pizza_cost FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city)  FROM zip_code  WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT `department`  FROM `major`  WHERE `college` = "College of Humanities and Social Sciences";	student_club
SELECT zc.city, zc.county, zc.state  FROM member m  JOIN zip_code zc ON m.zip = zc.city  WHERE m.member_id = 'amyFirth';	student_club
SELECT e.expense_description FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE b.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT m.member_id, m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_name WHERE e.event_name = 'October Meeting';	student_club
SELECT college, COUNT(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY college ORDER BY member_count DESC LIMIT 1;	student_club
SELECT m.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.phone = "809-555-3360";	student_club
SELECT event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  ORDER BY budget.amount DESC  LIMIT 1;	student_club
SELECT e.expense_description, e.expense_date, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President';	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS member_count FROM attendance a JOIN event e ON a.link_to_event = e.event_name WHERE e.event_name = 'Women''s Soccer';	student_club
SELECT 'income.date_received'  FROM 'income'  JOIN 'member' ON 'income.link_to_member' = 'member.first_name' AND 'income.link_to_member' = 'member.last_name' WHERE 'member.first_name' = "Casey" AND 'member.last_name' = "Mason";	student_club
SELECT COUNT(*) FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland';	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_member = (SELECT link_to_member FROM member WHERE phone = '954-555-6240');	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_name WHERE ma.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT event_name, (spent / amount) AS spend_to_budget_ratio FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) AS highest_spent FROM budget;	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND YEAR(event_date) = 2020;	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.first_name = SUBSTR(a.link_to_member, 6) GROUP BY m.first_name, m.last_name HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.major_name = ma.major_name JOIN event e ON m.member_id IN (SELECT member_id FROM event_member WHERE event_name = 'Community Theater') WHERE ma.major_name = 'Interior Design';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code zc ON m.zip = zc.city WHERE zc.city = 'Georgetown' AND zc.state = 'South Carolina';	student_club
SELECT SUM(amount) AS total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40;	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.link_to_event JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff'	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name FROM member m JOIN budget b ON m.member_id = (SELECT link_to_budget FROM expense WHERE link_to_budget = b.budget_id) JOIN event e ON b.link_to_event = e.event_name WHERE e.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, i.amount, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (SELECT MAX(amount) FROM income) ORDER BY i.amount DESC;	student_club
SELECT event_name, MIN(cost)  FROM event  WHERE cost IS NOT NULL  GROUP BY event_name  ORDER BY MIN(cost) ASC  LIMIT 1;	student_club
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.cost ELSE 0 END) / SUM(b.cost)) * 100 AS percentage_of_total_cost FROM      event e JOIN      budget b ON e.event_id = b.link_to_event	student_club
SELECT      (SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) /       SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END)) AS finance_to_physics_ratio FROM      major m;	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary' AND link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Agriculture and Applied Sciences');	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_name FROM major WHERE major_name = 'Physics Teaching');	student_club
SELECT COUNT(DISTINCT a.link_to_member) AS member_count FROM attendance a JOIN event e ON a.link_to_event = e.event_name AND YEAR(e.event_date) = 2019 WHERE e.event_name = 'Community Theater';	student_club
SELECT COUNT(a.link_to_event) AS event_count, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.link_to_major WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi' GROUP BY m.major_name;	student_club
SELECT AVG(spent)  FROM budget  WHERE category = 'Food'  AND link_to_event IN (SELECT event_id FROM event WHERE event_status = 'Closed');	student_club
SELECT event_name  FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE budget.category = 'Advertisement'  ORDER BY budget.spent DESC  LIMIT 1;	student_club
SELECT COUNT(*) FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_name WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer'	student_club
SELECT      ROUND(DIVIDE(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END), COUNT(event_id)) * 100, 2) AS 'Community_Service_Percentage' FROM      event WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT e.cost FROM event AS ev JOIN budget AS b ON ev.event_id = b.link_to_event JOIN expense AS ex ON b.budget_id = ex.link_to_budget WHERE ev.event_name = 'September Speaker' AND ex.expense_description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(t_shirt_size) AS size_count FROM member GROUP BY t_shirt_size ORDER BY size_count DESC LIMIT 1;	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT e.type, SUM(exp.cost) AS total_value FROM event e JOIN expense exp ON e.event_id = exp.link_to_budget WHERE e.event_name = 'October Meeting' AND e.event_id IN (SELECT event_id FROM event WHERE event_name = 'October Meeting') GROUP BY e.type;	student_club
SELECT category, SUM(amount) AS total_amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY category ORDER BY total_amount ASC;	student_club
SELECT MAX(amount)  FROM budget  WHERE category = 'Food';	student_club
SELECT budget_id, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost)  FROM expense  WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.first_name AND m.last_name = 'Harrison' WHERE m.first_name = 'Sacha';	student_club
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large';	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50;	student_club
SELECT m.major_name FROM major m JOIN member mem ON m.major_id = mem.link_to_major WHERE mem.first_name = 'Phillip' AND mem.last_name = 'Cullen';	student_club
SELECT m.position FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business';	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (     SELECT major_id     FROM major     WHERE major_name = 'Business' ) AND t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT type  FROM event  WHERE location = 'MU 215';	student_club
SELECT type  FROM event  WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT m.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President';	student_club
SELECT      (SUM(CASE WHEN m.position = 'Member' AND ma.major_name = 'Business' THEN 1 ELSE 0 END) * 100.0) / COUNT(m.member_id) AS business_member_percentage FROM      member m JOIN      major ma ON m.link_to_major = ma.major_name;	student_club
SELECT type  FROM event  WHERE location = 'MU 215';	student_club
SELECT COUNT(*)  FROM income  WHERE amount = 50;	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, m.link_to_major, m.major(major_name), m.major(college) FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND b.spent = 0.0 AND e.type = 'Guest Speaker';	student_club
SELECT z.city, z.state FROM member m JOIN major mj ON m.link_to_major = mj.major_name JOIN zip_code z ON m.zip = z.state WHERE mj.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN member m ON e.event_id = m.event_id JOIN major ma ON m.major_id = ma.major_id WHERE ma.college = 'School of Business' AND m.first_name = 'Vice President' AND e.type = 'Social' AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM member m JOIN attendance a ON m.link_to_major = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE m.position = 'Member' AND e.event_name = 'Women''s Soccer';	student_club
SELECT      ROUND(         (SUM(CASE WHEN m.t_shirt_size = 'Medium' AND i.amount = 50 THEN 1 ELSE 0 END) * 100.0) /          SUM(CASE WHEN m.t_shirt_size = 'Medium' THEN 1 ELSE 0 END),         2     ) AS percentage_of_50 FROM      member m JOIN      income i ON m.member_id = i.link_to_member WHERE      m.t_shirt_size = 'Medium' AND      m.position = 'Member';	student_club
SELECT DISTINCT zc.state FROM zip_code zc WHERE zc.type = 'PO Box';	student_club
SELECT zip_code FROM zip_code WHERE city = 'San Juan' AND state = 'Puerto Rico' AND type = 'PO Box';	student_club
SELECT event_name  FROM event  WHERE type = 'Game'  AND status = 'Closed'  AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT e.link_to_event FROM expense AS ex JOIN member AS m ON ex.link_to_member = m.member_id WHERE ex.cost > 50;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_id, e.event_name FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19' AND EXISTS (     SELECT 1     FROM attendance a     WHERE a.link_to_event = e.link_to_event );	student_club
SELECT m.first_name, m.link_to_major, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Katy' AND ma.major_id = 'rec1N0upiVLy5esTO'	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND ma.college = 'College of Agriculture and Applied Sciences';	student_club
SELECT m.email FROM member m JOIN expense e ON m.email = e.link_to_member WHERE e.cost > 20 AND e.expense_date BETWEEN '2019-09-10' AND '2019-11-19';	student_club
SELECT COUNT(DISTINCT m.member_id)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Education';	student_club
SELECT      (SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) / COUNT(event_id)) * 100 AS percentage_over_budget FROM      event JOIN      budget ON event.event_id = budget.link_to_event;	student_club
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_id, cost  FROM expense  WHERE cost > 50;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 100.0) / COUNT(zip_code) AS percentage_PO_Box FROM zip_code;	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE NOT EXISTS (     SELECT 1     FROM budget     WHERE link_to_event = e.event_id     AND remaining > 0 );	student_club
SELECT e.event_name, e.event_date FROM event e JOIN expense ex ON e.event_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_name JOIN expense e ON m.first_name || ' ' || m.last_name = (SELECT first_name || ' ' || last_name FROM member WHERE link_to_member = e.link_to_member) WHERE e.cost > 100;	student_club
SELECT zip_code.city, zip_code.country FROM event JOIN zip_code ON event.location = zip_code.city JOIN income ON event.event_id = income.link_to_member WHERE event.event_id IN (     SELECT event.event_id     FROM event     JOIN income ON event.event_id = income.link_to_member     GROUP BY event.event_id     HAVING COUNT(income.income_id) > 40 );	student_club
SELECT      m.member_id,      m.first_name,      m.last_name,      SUM(e.cost) AS total_cost FROM      member m JOIN      expense e ON m.member_id = e.link_to_member WHERE      e.approved = 'true' GROUP BY      m.member_id HAVING      COUNT(DISTINCT e.link_to_budget) > 1 ORDER BY      total_cost DESC LIMIT 1;	student_club
SELECT AVG(expense.cost)  FROM expense  JOIN member ON expense.link_to_member = member.member_id  WHERE member.position <> 'Member';	student_club
SELECT event_name FROM event WHERE event_id NOT IN (     SELECT link_to_event     FROM budget     WHERE category = 'Parking'     GROUP BY link_to_event     HAVING SUM(spent) >= (SELECT SUM(spent) / COUNT(event_id) FROM budget WHERE category = 'Parking') );	student_club
SELECT      (SUM(e.cost) / COUNT(e.event_id)) * 100 AS percentage_cost FROM      expense e JOIN      budget b ON e.link_to_budget = b.budget_id JOIN      event ev ON b.link_to_event = ev.event_id WHERE      ev.type = 'Meeting';	student_club
SELECT link_to_budget, MAX(cost) FROM expense WHERE expense_description = 'Water, chips, cookies' GROUP BY link_to_budget ORDER BY MAX(cost) DESC LIMIT 1;	student_club
SELECT m.first_name || ' ' || m.last_name AS full_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.phone = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT      SUBTRACT(         DIVIDE(SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END),                 COUNT(m.member_id)),         DIVIDE(SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END),                 COUNT(m.member_id))     ) AS percentage_difference FROM      member m JOIN      zip_code z ON m.zip = z.zip_code;	student_club
SELECT m.major_name, m.department  FROM major m  JOIN member mem ON m.major_id = mem.link_to_major  WHERE mem.link_to_major = 'recxK3MHQFbR9J5uO';	student_club
SELECT m.first_name, m.last_name, e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies';	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.major_id = ma.major_id WHERE ma.major_name = 'Elementary Education';	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_name WHERE e.event_name = 'Officers meeting - January' AND b.category = 'Speaker Gifts';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food';	student_club
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.first_name = SUBSTR(i.link_to_member, 6) WHERE i.date_received = "2019-09-04";	student_club
SELECT b.category  FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE e.expense_description = 'Posters';	student_club
SELECT CONCAT(m.first_name, ' ', m.last_name) AS full_name, m.position, m.major.college FROM member m JOIN major m2 ON m.link_to_major = m2.college WHERE m.position = 'Secretary';	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_name WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name;	student_club
SELECT zip_code.city FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code zc ON m.zip = zc.zip_code WHERE zc.city = 'Lincolnton' AND zc.state = 'North Carolina' AND zc.zip_code = 28092;	student_club
SELECT COUNT(*)  FROM gasstations  WHERE Country = "CZE"  AND GasStationID IN (     SELECT GasStationID      FROM products      WHERE Description = "Premium" );	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM customers WHERE Currency = 'EUR') /      (SELECT COUNT(*) FROM customers WHERE Currency = 'CZK') AS EUR_to_CZK_ratio;	debit_card_specializing
SELECT c.CustomerID, c.Segment, ym.Consumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND ym.Date BETWEEN '201201' AND '201212' ORDER BY ym.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME')  AND Date BETWEEN '201301' AND '201312';	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = "EUR" AND ym.Date BETWEEN "201101" AND "201112" AND EXISTS (     SELECT 1     FROM transactions_1k t     JOIN products p ON t.Amount = p.ProductID     WHERE p.Description = "Nafta" ) ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Segment = 'KAM'  AND ym.Date BETWEEN '201201' AND '201212'  AND ym.Consumption < 30000;	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) -       SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END)) AS DifferenceInConsumption FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      y.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT      yearmonth.Date AS YearMonth,     SUM(yearmonth.Consumption) AS TotalConsumption FROM      yearmonth JOIN      customers ON yearmonth.CustomerID = customers.CustomerID WHERE      customers.Currency = 'EUR' GROUP BY      YEAR(yearmonth.Date), MONTH(yearmonth.Date) ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Segment, MIN(Consumption) AS MinConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY Segment ORDER BY MinConsumption ASC LIMIT 1;	debit_card_specializing
SELECT      SUBSTR('Date', 1, 4) AS Year,      SUM('Consumption') AS TotalConsumption FROM      yearmonth WHERE      EXISTS (         SELECT 1          FROM gasstations          WHERE gasstations.Country = 'CZE'         AND gasstations.Country IN (             SELECT gasstations.Country              FROM gasstations, customers              WHERE gasstations.Country = customers.Currency              AND customers.Currency = 'CZK'         )     ) GROUP BY      Year ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT Date, Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date BETWEEN '201301' AND '201312' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
WITH AnnualConsumption AS (     SELECT          c.Segment,         SUM(y.Cost) AS AnnualTotalConsumption,         COUNT(DISTINCT y.CustomerID) AS CustomersInSegment     FROM          yearmonth y     JOIN          customers c ON y.CustomerID = c.CustomerID     WHERE          SUBSTR(y.Date, 1, 6) BETWEEN '201301' AND '201312'     GROUP BY          c.Segment ), LowestConsumption AS (     SELECT          Segment,         MIN(AnnualTotalConsumption) AS MinAnnualConsumption     FROM          AnnualConsumption     GROUP BY          Segment ), SegmentAverages AS (     SELECT          ac.Segment,         ac.AnnualTotalConsumption / ac.CustomersInSegment AS AnnualAverage     FROM          AnnualConsumption ac     JOIN          LowestConsumption lc ON ac.Segment = lc.Segment AND ac.AnnualTotalConsumption = lc.MinAnnualConsumption ) SELECT      'SME vs LAM' AS SegmentComparison,     saa.AnnualAverage AS SMEAverage,     lab.AnnualAverage AS LAMAverage,     saa.AnnualAverage - lab.AnnualAverage AS Difference FROM      SegmentAverages saa JOIN      customers c ON saa.Segment = c.Segment AND c.Segment = 'SME' JOIN      SegmentAverages lab ON saa.Segment = lab.Segment AND lab.Segment = 'LAM' UNION ALL SELECT      'LAM vs KAM' AS SegmentComparison,     lab.AnnualAverage AS LAMAverage,     kaa.AnnualAverage AS KAMAverage,     lab.AnnualAverage - kaa.AnnualAverage AS Difference FROM      SegmentAverages lab JOIN      customers c ON lab.Segment = c.Segment AND c.Segment = 'LAM' JOIN      SegmentAverages kaa ON lab.Segment = kaa.Segment AND kaa.Segment = 'KAM' UNION ALL SELECT      'KAM vs SME' AS SegmentComparison,     kaa.AnnualAverage AS KAMAverage,     saa.AnnualAverage AS SMEAverage,     kaa.AnnualAverage - saa.AnnualAverage AS Difference FROM      SegmentAverages kaa JOIN      customers c ON kaa.Segment = c.S	debit_card_specializing
SELECT      g.Segment,      (MAX(Consumption_2013 - Consumption_2012) / Consumption_2013) * 100 AS Highest_Percentage_Increase,     (MIN(Consumption_2013 - Consumption_2012) / Consumption_2012) * 100 AS Lowest_Percentage_Increase FROM (     SELECT          ym1.Segment,          ym1.Consumption AS Consumption_2012,          ym2.Consumption AS Consumption_2013,         (ym2.Consumption - ym1.Consumption) AS Increase_or_Decrease     FROM          yearmonth ym1     INNER JOIN          yearmonth ym2 ON ym1.CustomerID = ym2.CustomerID         AND LEFT(ym1.Date, 4) = LEFT(ym2.Date, 4)         AND ym1.Date < ym2.Date         AND LEFT(ym1.Date, 4) = '2012'         AND LEFT(ym2.Date, 4) = '2013'     INNER JOIN          gasstations g ON ym1.CustomerID = g.CustomerID     WHERE          ym1.Currency = 'EUR' AND ym2.Currency = 'EUR' ) AS Consumption_Change GROUP BY      Segment ORDER BY      Highest_Percentage_Increase DESC,      Lowest_Percentage_Increase ASC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT     (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount')     - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS DiscountGasStationDifference;	debit_card_specializing
SELECT      (SUM(t1.Amount) - COALESCE(SUM(t2.Amount), 0)) AS Difference FROM      (SELECT 'transactions_1k.Amount' AS Amount      FROM 'transactions_1k'      INNER JOIN 'yearmonth' ON 'transactions_1k.Amount' IS NOT NULL AND 'yearmonth.CustomerID' = 'transactions_1k.Amount'      WHERE 'yearmonth.CustomerID' = 7 AND 'yearmonth.Date' = '201304') AS t1 CROSS JOIN     (SELECT 'transactions_1k.Amount' AS Amount      FROM 'transactions_1k'      INNER JOIN 'yearmonth' ON 'transactions_1k.Amount' IS NOT NULL AND 'yearmonth.CustomerID' = 'transactions_1k.Amount'      WHERE 'yearmonth.CustomerID' = 5 AND 'yearmonth.Date' = '201304') AS t2;	debit_card_specializing
SELECT      (SELECT SUM(CASE WHEN c.Segment = 'SME' AND t.ProductID = 2 THEN 1 ELSE 0 END)       FROM customers c      JOIN transactions_1k t ON c.CustomerID = t.CustomerID      WHERE t.ProductID IN (SELECT ProductID FROM products WHERE 'CZK' = (SELECT Currency FROM product_prices WHERE ProductID = t.ProductID))     ) -      (SELECT SUM(CASE WHEN c.Segment = 'SME' AND t.ProductID = 2 THEN 1 ELSE 0 END)       FROM customers c      JOIN transactions_1k t ON c.CustomerID = t.CustomerID      WHERE t.ProductID IN (SELECT ProductID FROM products WHERE 'EUR' = (SELECT Currency FROM product_prices WHERE ProductID = t.ProductID))     ) AS More_SMEs_Pay_CZK_than_EUR;	debit_card_specializing
SELECT c.CustomerID, ym.Consumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,      SUM(y.Consumption) AS TotalConsumption FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      c.Segment = 'KAM' GROUP BY      c.CustomerID ORDER BY      TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption)  FROM yearmonth  WHERE Date = "201305"  AND CustomerID IN (SELECT CustomerID FROM customers WHERE CustomerID = 3 OR CustomerID = 5 OR CustomerID = 6 OR CustomerID = 7 OR CustomerID = 9);	debit_card_specializing
SELECT     (COUNT(CASE WHEN Consumption > 46.73 THEN 1 END) * 100.0 / COUNT(*)) AS Percentage FROM     yearmonth JOIN     customers ON yearmonth.CustomerID = customers.CustomerID WHERE     customers.Segment = 'LAM';	debit_card_specializing
SELECT      g.Country,      COUNT(*) AS 'ValueForMoneyStations' FROM      gasstations g WHERE      g.Segment = 'Value for money' GROUP BY      g.Country ORDER BY      'ValueForMoneyStations' DESC;	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      customers c WHERE      c.Segment = 'KAM';	debit_card_specializing
SELECT      (SELECT COUNT(*) FROM yearmonth WHERE Date = '201202' AND Consumption > 528.3) /      (SELECT COUNT(*) FROM yearmonth WHERE Date = '201202') * 100 AS percentage	debit_card_specializing
SELECT     (COUNT(CASE WHEN 'Country' = 'SLO' THEN 1 END) / COUNT(*)) * 100 AS PercentageOfPremiumGasStations FROM     gasstations WHERE     'Country' = 'SLO';	debit_card_specializing
SELECT CustomerID, SUM(Consumption) as TotalConsumption FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment, SUM(t.Amount) AS TotalAmount FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth y ON t.Date = y.Date WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalAmount ASC LIMIT 1;	debit_card_specializing
SELECT      c.CustomerID,      SUM(t.Amount) AS TotalAmount FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      c.Segment = 'SME'      AND y.Date = '201206' GROUP BY      c.CustomerID ORDER BY      TotalAmount ASC LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption)  FROM yearmonth  WHERE SUBSTR(Date, 1, 4) = '2012';	debit_card_specializing
SELECT MAX(Consumption) AS MaxMonthlyConsumption FROM yearmonth AS y JOIN customers AS c ON y.Currency = c.Currency WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT p.Description FROM products p JOIN yearmonth ym ON p.ProductID = ym.ProductID WHERE ym.Date LIKE '201309%'	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN yearmonth y ON t.GasStationID = y.GasStationID WHERE y.Date = '201306';	debit_card_specializing
SELECT g.ChainID FROM gasstations g JOIN customers c ON g.ChainID IS NOT NULL JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE c.Currency = 'EUR' GROUP BY g.ChainID;	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG('Price' * 'Amount') AS 'AverageTotalPrice' FROM 'transactions_1k' WHERE 'Date' BETWEEN '2012-01-01' AND '2012-01-31';	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM transactions_1k t JOIN products p ON t.ProductID = p.Description JOIN gasstations g ON t.ProductID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT T.Time FROM transactions_1k T JOIN gasstations G ON T.GasStationID = G.GasStationID WHERE G.ChainID = 11;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(T.Price * T.Amount) AS AverageTotalPrice FROM transactions_1k AS T JOIN gasstations AS GS ON T.GasStationID = GS.GasStationID WHERE GS.Country = 'CZE';	debit_card_specializing
SELECT      c.CustomerID,      AVG(t.Price) AS AvgTotalPrice FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      c.CustomerID;	debit_card_specializing
SELECT c.CustomerID, SUM(t.Amount) AS TotalPaid FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE ym.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.Country = t.Country WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID ASC LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.Segment = 'SME' JOIN transactions_1k t ON ym.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00'	debit_card_specializing
SELECT c.Segment FROM customers c JOIN (     SELECT MIN(CustomerID) as MinCustomerID     FROM customers ) as min_customers ON c.CustomerID = min_customers.MinCustomerID;	debit_card_specializing
SELECT g.Country FROM transactions_1k AS t1 JOIN gasstations AS g ON t1.GasStationID = g.GasStationID WHERE t1.Date = '2012-08-24' AND t1.Time = '12:42:00';	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00';	debit_card_specializing
SELECT ym.Consumption, ym.Date FROM yearmonth ym WHERE ym.CustomerID = (     SELECT t.CustomerID     FROM transactions_1k t     WHERE t.Date = '2012-08-24' AND t.Amount = 124.05 ) AND ym.Date = '201201';	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.ChainID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date = '2012-08-26' AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00';	debit_card_specializing
SELECT c.Currency FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE ym.Date = '201306' AND EXISTS (     SELECT 1     FROM transactions_1k t     WHERE ym.CustomerID = t.CustomerID     AND t.Amount = 214582 );	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.Country = t.Country JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.CustomerID = 667467;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN yearmonth ym ON t.CustomerID = ym.CustomerID JOIN gasstations g ON c.CustomerID = g.CustomerID WHERE t.Amount = 548.4 AND t.Date = '2012-08-24' AND ym.Date = '201208';	debit_card_specializing
SELECT      (COUNT(DISTINCT c.CustomerID) /      (SELECT COUNT(DISTINCT CustomerID) FROM customers)) * 100 AS percentage_eur_customers FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      c.Currency = 'EUR' AND     ym.Date = '2012-08-25';	debit_card_specializing
SELECT      (SUM(CASE WHEN ym.Date LIKE '2012%' THEN ym.Consumption ELSE 0 END) -       SUM(CASE WHEN ym.Date LIKE '2013%' THEN ym.Consumption ELSE 0 END)) /       SUM(CASE WHEN ym.Date LIKE '2012%' THEN ym.Consumption ELSE 1 END) AS ConsumptionDecreaseRate FROM      yearmonth ym WHERE      ym.Date = '2012-08-25'     AND ym.CustomerID = (         SELECT              ym2.CustomerID         FROM              yearmonth ym2         WHERE              ym2.Date = '2012-08-25'     );	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS Revenue FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations) GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1;	debit_card_specializing
SELECT      (SELECT SUM(CASE WHEN p.Description = 'Special' THEN t.Amount ELSE 0 END)       FROM transactions_1k t       JOIN products p ON t.ProductID = p.Description       JOIN gasstations gs ON t.GasStationID = gs.ChainID       JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND DATE(ym.Date) = DATE(t.Date)) /      (SELECT SUM(t.Amount)       FROM transactions_1k t       JOIN gasstations gs ON t.GasStationID = gs.ChainID       JOIN yearmonth ym ON t.CustomerID = ym.CustomerID AND DATE(ym.Date) = DATE(t.Date)      WHERE gs.Country = 'SVK') * 100 AS PercentagePremium FROM gasstations WHERE Country = 'SVK';	debit_card_specializing
SELECT SUM("Amount") AS TotalAmountSpent FROM transactions_1k WHERE "CustomerID" = 38508;  SELECT SUM("Amount") AS TotalAmountSpentInJanuary FROM transactions_1k WHERE "CustomerID" = 38508 AND "Date" = '201201';	debit_card_specializing
SELECT p.Description AS ProductName, SUM(t.Amount) AS TotalSold FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID ORDER BY TotalSold DESC LIMIT 5;	debit_card_specializing
SELECT      t.CustomerID,     c.Currency,     AVG(t.Price) / SUM(t.Amount) AS AvgPricePerItem,     SUM(t.Amount * t.Price) AS TotalSpent FROM      transactions_1k t JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      t.CustomerID, c.Currency ORDER BY      TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.ProductID = 2 ORDER BY t.Price DESC LIMIT 1;	debit_card_specializing
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym JOIN transactions_1k t ON ym.CustomerID = t.CustomerID WHERE t.ProductID = 5 AND t.Price / t.Amount > 29.00 AND ym.Date = '201208';	debit_card_specializing
