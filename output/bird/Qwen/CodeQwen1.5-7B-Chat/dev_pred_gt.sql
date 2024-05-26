SELECT T2.Percent_Eligible_Free FROM frpm AS T1  INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T2.County = 'ALAMEDA COUNTY' AND T2.District IS NOT NULL  ORDER BY T2.Percent_Eligible_Free DESC  LIMIT 1	california_schools
SELECT T1.School, T1.Percent_Eligible_Free_Ages_5_17, T1.Percent_Eligible_FRPM_Ages_5_17  FROM frpm AS T1  WHERE T1.School_Type = 'CONTINUATION'  ORDER BY T1.Percent_Eligible_Free_Ages_5_17 ASC  LIMIT 3	california_schools
SELECT Zip FROM schools WHERE Counties = 'Fresno County' AND Charter = 1	california_schools
SELECT S.Street, S.StreetAbr, S.City, S.Zip, S.State FROM schools AS S JOIN frpm AS F ON S.CDSCode = F.CDSCode WHERE F.`FRPM Count (K-12)` = (SELECT MAX(F2.`FRPM Count (K-12)`) FROM frpm AS F2)	california_schools
SELECT phone FROM schools WHERE district IN ( SELECT District FROM frpm WHERE CHARTER = 1 AND FundingType = 'Charter' ) AND openDate > '2000-01-01'	california_schools
SELECT COUNT(DISTINCT t1.schoolname) FROM schools AS t1 INNER JOIN satscores AS t2 ON t1.cdscode = t2.cds WHERE t2.avgscrmath < 400 AND t2.rtype = 'All' AND t1.virtual = 'Y'	california_schools
SELECT S.School FROM schools AS S JOIN satscores AS SS ON S.CDSCode = SS.cds WHERE SS.NumTstTakr > 500 AND S.Magnet = 1	california_schools
SELECT T3.phone FROM satscores AS T1 INNER JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T1.avgscrread > 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1	california_schools
SELECT SUM(NumTstTakr) FROM (     SELECT T1.NumTstTakr     FROM frpm AS T1     INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds     WHERE T1.`FRPM Count (K-12)` = (         SELECT MAX(T1.`FRPM Count (K-12)`)         FROM frpm AS T1     ) ) AS T1	california_schools
SELECT COUNT(DISTINCT T1.CDSCode) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.Charter = 1	california_schools
SELECT t1.`FRPM Count (Ages 5-17)` FROM frpm AS t1 INNER JOIN satscores AS t2 ON t1.CDSCode = t2.cds WHERE t2.AvgScrRead = ( SELECT MAX(AvgScrRead) FROM satscores )	california_schools
SELECT CDSCode FROM frpm WHERE SUM(CAST(`Enrollment (K-12)` AS REAL) + CAST(`Enrollment (Ages 5-17)` AS REAL)) > 500	california_schools
SELECT MAX(Percent_Eligible_Free_Ages_5_17)  FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE Percent_Eligible_Free_Ages_5_17 > 0.3	california_schools
SELECT T1.phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T2.cds = T1.CDSCode ORDER BY T2.AvgScrRead DESC LIMIT 3	california_schools
SELECT T2.NCESSchool FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`Enrollment (Ages 5-17)` DESC LIMIT 5	california_schools
SELECT T2.dname FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' GROUP BY T2.dname ORDER BY AVG(T1.AvgScrRead) DESC LIMIT 1	california_schools
SELECT COUNT(T1.cds) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Enrollment (K-12)` < 100	california_schools
SELECT T2.charterNum FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AvgScrWrite = 499	california_schools
SELECT COUNT(DISTINCT T2.school) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.charter = 1 AND T1.FundingType = 'Contra Costa (directly funded)' AND T1.`2013-14 CALPADS Fall 1 Certification Status` IS NOT NULL AND T2.NumTstTakr <= 250	california_schools
SELECT Phone FROM schools WHERE CDSCode = (SELECT CDS FROM satscores WHERE AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores))	california_schools
SELECT COUNT(*) FROM schools AS T1 JOIN frpm AS T2 ON T2.CDSCode = T1.CDSCode WHERE T1.County = 'Amador' AND T2.`Low Grade` = '9' AND T2.`High Grade` = '12'	california_schools
SELECT SUM(IIF(T1.`Free Meal Count (K-12)` > 500 AND T1.`Free Meal Count (K-12)` < 700, 1, 0)) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles'	california_schools
SELECT s.school FROM schools AS s INNER JOIN satscores AS ss ON s.CDSCode = ss.cds WHERE ss.rtype = 'All Students' ORDER BY ss.NumTstTakr DESC LIMIT 1	california_schools
SELECT T3.Street, T3.City FROM (SELECT DISTINCT T1.CDSCode FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` > 30 OR T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` < -30) AS T1 INNER JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode	california_schools
SELECT DISTINCT T1.school FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Percent (%) Eligible Free (K-12)` > 0.1 AND T1.NCESSchool IN ( SELECT CDS FROM satscores WHERE NumTstTakr >= 1500 )	california_schools
SELECT T1.FUNDINGTYPE FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.COUNTY = 'Riverside' AND T2.AvgScrMath > 400	california_schools
SELECT T2.County, T2.District, T2.School, T2.Street, T2.StreetAbr, T2.City, T2.Zip, T2.MailStreet, T2.MailStrAbr, T2.MailCity, T2.MailZip  FROM frpm AS T1  INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.`Enrollment (Ages 5-17)` > 800 AND T1.`FRPM Count (Ages 5-17)` > 0 AND T2.County = 'Monterey'	california_schools
SELECT T1.School, T2.AvgScrWrite FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.OpenDate > '1991-12-31' OR T1.ClosedDate < '2000-01-01'	california_schools
SELECT s.School, s.DOCType  FROM schools s  INNER JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.FundingType = 'LocallyFunded'  AND f.Percent_Eligible_Free_K_12 IS NOT NULL AND f.Percent_Eligible_FRPM_K_12 IS NOT NULL  AND f.Percent_Eligible_Free_5_17 IS NOT NULL AND f.Percent_Eligible_FRPM_5_17 IS NOT NULL  AND f.Percent_Eligible_Free_K_12 > 0  AND f.Percent_Eligible_FRPM_K_12 > 0  AND f.Percent_Eligible_Free_5_17 > 0  AND f.Percent_Eligible_FRPM_5_17 > 0  AND (f.Percent_Eligible_Free_K_12 - f.Percent_Eligible_Free_5_17) >  (SELECT AVG(f2.Percent_Eligible_Free_K_12 - f2.Percent_Eligible_Free_5_17)  FROM frpm f2  WHERE f2.FundingType = 'LocallyFunded'  AND f2.Percent_Eligible_Free_K_12 IS NOT NULL AND f2.Percent_Eligible_FRPM_K_12 IS NOT NULL  AND f2.Percent_Eligible_Free_5_17 IS NOT NULL AND f2.Percent_Eligible_FRPM_5_17 IS NOT NULL  AND f2.Percent_Eligible_Free_K_12 > 0  AND f2.Percent_Eligible_FRPM_K_12 > 0  AND f2.Percent_Eligible_Free_5_17 > 0  AND f2.Percent_Eligible_FRPM_5_17 > 0);	california_schools
SELECT OpenDate  FROM schools AS s WHERE s.Enrollment_12 >= ALL (SELECT Enrollment_12 FROM schools AS s_1 WHERE s_1.Enrollment_12 >= 0)	california_schools
SELECT t1.city FROM schools AS t1 INNER JOIN frpm AS t2 ON t1.cdscode = t2.cdscode WHERE t2.low_grade <= 12 ORDER BY t2.enrollment (k - 12) LIMIT 5	california_schools
SELECT T3.`Percent (%) Eligible Free (K-12)` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN satscores AS T3 ON T1.CDSCode = T3.cds WHERE T1.`Grade_Level` IN ('10th grade', '11th grade') AND T2.`Enrollment (K-12)` = ( SELECT MAX(T4.`Enrollment (K-12)`) FROM schools AS T5 INNER JOIN frpm AS T4 ON T5.CDSCode = T4.CDSCode WHERE T5.`Grade_Level` IN ('10th grade', '11th grade') )	california_schools
SELECT TOP 5 S.School, TOP 5 SUM(F.`Free Meal Count (K-12)`) AS total_meal_count FROM schools AS S JOIN frpm AS F ON S.CDSCode = F.CDSCode WHERE S.OwnershipCode = '66' GROUP BY S.School ORDER BY total_meal_count DESC	california_schools
SELECT T1.website, T2.school FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000	california_schools
SELECT T2.`Enrollment (Ages 5-17)`, T2.`Free Meal Count (Ages 5-17)`, T2.`Percent (%) Eligible Free (Ages 5-17)`  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.AdmFName1 = 'Kacey' AND T1.AdmLName1 = 'Gibson' AND T1.AdmFName2 IS NOT NULL AND T1.AdmLName2 IS NOT NULL	california_schools
SELECT T2.AdmEmail1 FROM (SELECT CDSCode FROM frpm WHERE Charter = 1 ORDER BY `Enrollment (K-12)` ASC LIMIT 1) AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode	california_schools
SELECT DISTINCT t1.EILName, t1.EILCode FROM schools AS t1 INNER JOIN ( SELECT cds FROM satscores WHERE AvgScrRead IS NOT NULL AND AvgScrMath IS NOT NULL AND AvgScrWrite IS NOT NULL AND NumTstTakr >= 1500 ORDER BY NumTstTakr DESC LIMIT 1 ) AS t2 ON t1.CDSCode = t2.cds	california_schools
SELECT T3.Street, T3.City, T3.Zip, T3.State FROM satscores AS T1 INNER JOIN schools AS T3 ON T1.cds = T3.CDSCode ORDER BY T1.AvgScrRead DESC LIMIT 1	california_schools
SELECT T1.Website FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr BETWEEN 2000 AND 3000 AND T1.County = 'Los Angeles County'	california_schools
SELECT AVG(NumTstTakr) FROM satscores WHERE cds IN ( SELECT CDSCode FROM schools WHERE DOC = 'Fresno' AND DATE(OpenDate) BETWEEN '1980-01-01' AND '1980-12-31' )	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.City = 'Fresno' AND T2.rtype = 'AY' ORDER BY T2.AvgScrRead ASC LIMIT 1	california_schools
WITH top_5_virtual_schools AS (   SELECT     cds,     dname,     AVG(AvgScrRead) AS avg_reading_score   FROM     satscores     JOIN schools ON satscores.cds = schools.CDSCode     JOIN frpm ON schools.CDSCode = frpm.CDSCode   WHERE     schools.Virtual = 'Yes'   GROUP BY     cds,     dname   ORDER BY     avg_reading_score DESC   LIMIT 5 ) SELECT DISTINCT   schools.school FROM   top_5_virtual_schools   JOIN schools ON top_5_virtual_schools.cds = schools.CDSCode	california_schools
SELECT T2.schooltype FROM (     SELECT M.cds     FROM (         SELECT cdscode         FROM satscores         WHERE avgscrmath = (             SELECT MAX(avgscrmath)             FROM satscores         )     ) S     INNER JOIN schools M ON S.cds = M.cds ) T1 INNER JOIN frpm T2 ON T1.cds = T2.cds	california_schools
SELECT avg_math_score, county FROM satscores AS T1 JOIN schools AS T2 ON T2.CDSCode = T1.cds ORDER BY avg_math_score ASC LIMIT 1	california_schools
SELECT s.City, AVG(ss.AvgScrWrite) FROM schools AS s JOIN frpm AS f ON s.CDSCode = f.CDSCode JOIN satscores AS ss ON s.CDSCode = ss.cds WHERE s.District = (     SELECT t.District     FROM (         SELECT f.District, COUNT(f.FRPMCount) AS frpm_count, SUM(ss.NumTstTakr) AS total_takers         FROM frpm AS f         JOIN satscores AS ss ON f.CDSCode = ss.cds         GROUP BY f.District         HAVING COUNT(f.FRPMCount) = (             SELECT COUNT(f.FRPMCount)             FROM frpm AS f             JOIN satscores AS ss ON f.CDSCode = ss.cds             GROUP BY f.District             ORDER BY COUNT(f.FRPMCount) DESC             LIMIT 1         )     ) AS t     WHERE t.total_takers >= 1500     ORDER BY t.frpm_count DESC     LIMIT 1 ) GROUP BY s.City	california_schools
SELECT sname, AVG(AvgScrWrite) as average_writing_score FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE sname IN (SELECT School FROM frpm WHERE EdOpsName = 'Ricci Ulrich') GROUP BY sname	california_schools
SELECT T2.State FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Low Grade` = '1' AND T2.`High Grade` = '12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1	california_schools
SELECT COUNT(CDSCode) AS number_of_schools FROM schools WHERE District = 'ELEMENTARY SCHOOL DISTRICT OF THE RIVERBANK' AND County = 'ALAMEDA' AND YEAR(OpenDate) = 1980	california_schools
SELECT CAST(SUM(IIF(schools.SchoolType = 'Merged School District School', 1, 0)) AS REAL) / COUNT(schools.SchoolType) AS ratio FROM schools WHERE schools.County = 'Orange County'	california_schools
SELECT T1.County, T1.School, T1.ClosedDate FROM schools AS T1 WHERE T1.ClosedDate IS NOT NULL ORDER BY T1.ClosedDate DESC LIMIT 1	california_schools
SELECT S.school, S.street FROM schools AS S JOIN satscores AS SS ON S.CDSCode = SS.cds ORDER BY SS.AvgScrMath DESC LIMIT 1	california_schools
SELECT T1.MailingStreet, T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead ASC LIMIT 1	california_schools
SELECT COUNT(DISTINCT T2.School)  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T1.MailingCity = 'LAKEPORT' AND T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500	california_schools
SELECT COUNT(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Fresno'	california_schools
SELECT DISTINCT T1.school FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.EdOpsName = 'Avetik Atoian'	california_schools
SELECT COUNT(CASE WHEN MailingState = 'California' AND County = 'Colusa' THEN 1 ELSE NULL END) AS ColusaCount, COUNT(CASE WHEN MailingState = 'California' AND County = 'Humboldt' THEN 1 ELSE NULL END) AS HumboldtCount FROM schools WHERE MailingState = 'California'	california_schools
SELECT COUNT(T2.CDSCode) AS num FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.MailState = 'California' AND T2.DistrictName = 'San Joaquin'	california_schools
SELECT Phone, Ext FROM schools AS t1 INNER JOIN satscores AS t2 ON t1.CDSCode = t2.cds ORDER BY t2.AvgScrWrite DESC LIMIT 1 OFFSET 332	california_schools
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT DISTINCT T1.Website FROM schools AS T1 INNER JOIN edopersonnel AS T2 ON T2.EilName = T1.EILName WHERE T2.AdmFName1 IN ('Mike', 'Dante') AND T2.AdmLName1 IN ('Larson', 'Alvarez')	california_schools
SELECT T1.Website FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 AND T2.Virtual = 'N' AND T1.County = 'San Joaquin'	california_schools
SELECT COUNT(T1.CDSCode) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.City = 'Hickman' AND T2.`Charter (Y/N)` = 1	california_schools
SELECT COUNT(DISTINCT T1.School) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Los Angeles' AND T2.`Percent (%) Eligible Free (K-12)` < 0.18	california_schools
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmEmail1, T2.AdmFName2, T2.AdmLName2, T2.AdmEmail2, T2.AdmFName3, T2.AdmLName3, T2.AdmEmail3, T1.School, T1.City FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter = 1 AND T2.CharterNum = '00D2'	california_schools
SELECT COUNT(CDSCode) FROM schools WHERE MailingCity = 'Hickman' AND CHARTERNUM = '00D4'	california_schools
SELECT      COUNT(DISTINCT CASE WHEN T1.FundingType = 'Local' THEN T1.CDSCode ELSE NULL END) * 100.0 /      COUNT(DISTINCT T1.CDSCode) as LocalFundingRatio FROM      schools AS T1 WHERE      T1.County = 'Santa Clara';	california_schools
SELECT COUNT(DISTINCT T2.SchoolCode) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Academic Year` BETWEEN '1/1/2000' AND '12/31/2005' AND T2.County = 'Stanislaus'	california_schools
SELECT COUNT(*) FROM schools WHERE `District` = 'Community College District' AND YEAR(LastUpdate) = 1989 AND City = 'San Francisco'	california_schools
SELECT T.County FROM schools AS T WHERE T.SchoolType LIKE 'Youth Authority Facilities (CEA)' AND T.StatusType LIKE 'CLOSED' AND T.`Academic Year` LIKE '198%' ORDER BY T.County ASC LIMIT 1	california_schools
SELECT T2.NCESDist FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOC = 'State Special School'	california_schools
SELECT COUNT(T1.CDSCode) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.county = 'Alpine' AND T2.`District Type` = 'Active'	california_schools
SELECT DISTINCT T2.dname FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.city = 'Fresno' AND T2.magnet IS NOT NULL AND T2.magnet = 0	california_schools
SELECT COUNT(DISTINCT T1.CDSCode) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`School Name` = 'State Special School' AND T2.`2013-14 Academic Year` = '14-15' AND T2.`Low Grade` = '5' AND T2.`High Grade` = '17'	california_schools
SELECT AVG(t1.Free Meal Count (Ages 5-17))  FROM frpm AS t1  JOIN schools AS t2 ON t1.CDSCode = t2.CDSCode  WHERE t2.`Mailing Street Address` = 'PO Box 1040' AND t2.`School Name` = 'Youth Authority School'	california_schools
SELECT LowGrade FROM frpm WHERE DistrictCode IN (SELECT DistrictCode FROM schools WHERE SchoolType = 'District Special Education Consortia School' AND NCESDist = '613360')	california_schools
SELECT T1.County FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.EducationalOptionType = 'Breakfast Provision 2' AND T1.CountyCode = 37	california_schools
SELECT city FROM schools AS t1 INNER JOIN frpm AS t2 ON t1.CDSCode = t2.CDSCode WHERE t2.LowGrade = '9' AND t2.HighGrade = '12' AND t2.`NSLP Provision Status` = '2' AND t1.County = 'Merced'	california_schools
SELECT `Percent (%) Eligible FRPM (Ages 5-17)` FROM schools WHERE StatusType = 'Active' AND District = 'Los Angeles' AND School LIKE '%Kindergarden%' AND School LIKE '%9th grade%'	california_schools
SELECT T2.`Grade Span` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.`School Code` WHERE T1.City = 'Adelanto' GROUP BY T2.`Grade Span` ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT MIN(CASE WHEN City = 'San Diego' THEN 1 ELSE 0 END) AS san_diego_county, MIN(CASE WHEN City = 'Santa Barbara' THEN 1 ELSE 0 END) AS santa_barbara_county, COUNT(DISTINCT CASE WHEN City IN ('San Diego', 'Santa Barbara') THEN T1.County ELSE NULL END) AS common_counties, COUNT(DISTINCT CASE WHEN City NOT IN ('San Diego', 'Santa Barbara') THEN T1.County ELSE NULL END) AS diff_counties FROM schools AS T1	california_schools
SELECT T1.School, T1.Latitude FROM schools AS T1 ORDER BY T1.Latitude DESC LIMIT 1	california_schools
SELECT T2.City, T1.school FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA' ORDER BY T1.Latitude ASC LIMIT 1	california_schools
SELECT LOWER(T2.`High Grade`), LOWER(T2.`Low Grade`) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Longitude = ( SELECT MAX(T3.Longitude) FROM schools AS T3 )	california_schools
SELECT COUNT(DISTINCT T1.District) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Magnet = 1 AND T2.`Low Grade` = 'Kindergarten' AND T2.`High Grade` = '8th'	california_schools
SELECT T1.dname, T3.AdmFName1, T3.AdmLName1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN schools AS T3 ON T2.CDSCode = T3.CDSCode GROUP BY T3.AdmFName1, T3.AdmLName1 ORDER BY COUNT(*) DESC LIMIT 2	california_schools
SELECT T1.DistrictCode FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Alusine'	california_schools
SELECT T2.AdmLName1, T3.District, T4.County, T2.dname FROM frpm AS T1 INNER JOIN schools AS T3 ON T1.District = T3.District INNER JOIN satscores AS T4 ON T1.District = T4.cds INNER JOIN ( SELECT District, DNAME FROM schools WHERE CHARTERNUM = 40 AND CHARTER = 1 ) AS T2 ON T1.District = T2.District	california_schools
SELECT T1.AdmEmail1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`District Name` = 'District of San Bernardino City Unified' AND T2.`Open Date` BETWEEN '2009-01-01' AND '2010-12-31' AND T2.`School Type` IN ('Public Intermediate/Middle Schools', 'Unified Scools') AND T2.`County Name` = 'San Bernardino County'	california_schools
SELECT T1.AdmEmail1, T1.School  FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrRead >= 1500 AND T2.AvgScrMath >= 1500 AND T2.AvgScrWrite >= 1500  ORDER BY T2.NumTstTakr DESC  LIMIT 1	california_schools
SELECT COUNT(T3.account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id INNER JOIN `order` AS T4 ON T1.account_id = T4.account_id WHERE T3.A2 = 'East Bohemia' AND T4.`order_id` IS NOT NULL	financial
SELECT COUNT(DISTINCT account.account_id) FROM account AS account INNER JOIN district AS district ON account.district_id = district.district_id INNER JOIN loan AS loan ON account.account_id = loan.account_id WHERE district.A2 = 'Prague' AND (loan.status = 'A' OR loan.status = 'B')	financial
Sure, here is the SQL query that should do the trick:  SELECT      AVG(CASE WHEN T1.year = '1995' THEN T1.unemployment_ratio ELSE 0 END) as AvgUnemployment1995,     AVG(CASE WHEN T1.year = '1996' THEN T1.unemployment_ratio ELSE 0 END) as AvgUnemployment1996,     CASE WHEN AVG(CASE WHEN T1.year = '1995' THEN T1.unemployment_ratio ELSE 0 END) >          AVG(CASE WHEN T1.year = '1996' THEN T1.unemployment_ratio ELSE 0 END) THEN '1995' ELSE '1996' END AS higherPercentage FROM      (SELECT          district_id,          AVG(unemployment_ratio) AS unemployment_ratio,          '1995' AS year     FROM          district      WHERE          date LIKE '1995%'     GROUP BY          district_id) as T1 JOIN      (SELECT          district_id,          AVG(unemployment_ratio) AS unemployment_ratio,          '1996' AS year     FROM          district      WHERE          date LIKE '1996%'     GROUP BY          district_id) as T2 ON      T1.district_id = T2.district_id	financial
SELECT COUNT(T.district_id) AS no_of_districts  FROM  (     SELECT client.district_id, AVG(client.birth_date) AS avg_age      FROM client      WHERE client.gender = 'F'      GROUP BY client.district_id ) AS T  WHERE T.avg_age > 6000 AND T.avg_age < 10000	financial
SELECT COUNT(*) FROM     (SELECT T2.client_id FROM district AS T1     INNER JOIN client AS T2 ON T1.district_id = T2.district_id     WHERE T2.birth_date <= DATE('2007-12-31') AND T2.birth_date >= DATE('1933-01-01') AND T1.A4 = 'North Bohemia' AND T2.gender = 'Male') AS T3  INNER JOIN account AS T4 ON T3.client_id = T4.client_id  GROUP BY T3.client_id  HAVING AVG(T4.amount) > 8000	financial
SELECT T1.account_id FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id WHERE T1.gender = 'F' ORDER BY T1.birth_date ASC LIMIT 1	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date = ( SELECT MAX(birth_date) FROM client ) ORDER BY T1.account_id DESC LIMIT 1	financial
SELECT COUNT(*) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T2.frequency = 'weekly'	financial
SELECT client_id FROM disp WHERE type = 'disponent' INTERSECT SELECT client_id FROM client WHERE gender = 'M'	financial
SELECT t3.account_id FROM loan AS t1 INNER JOIN `order` AS t2 ON t1.account_id = t2.account_id INNER JOIN disp AS t3 ON t1.account_id = t3.account_id WHERE t1.`date` LIKE '1997%' GROUP BY t3.account_id ORDER BY AVG(t1.amount) LIMIT 1	financial
SELECT T1.loan_id, T1.amount FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'A' AND T2.date BETWEEN '1993-01-01' AND '1993-12-31' ORDER BY T1.amount DESC LIMIT 1	financial
SELECT COUNT(T2.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.frequency = 'Monthly' AND T3.gender = 'F' AND T3.birth_date < '1950-01-01' AND T3.district_id = (SELECT district_id FROM district WHERE A2 = 'Slokolov')	financial
SELECT T2.account_id FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1995' ORDER BY T2.date ASC LIMIT 1	financial
SELECT t1.account_id FROM account AS t1 INNER JOIN loan AS t2 ON t1.account_id = t2.account_id WHERE t1.`date` < '1997-01-01' AND t2.amount > 3000	financial
SELECT c.client_id FROM client AS c JOIN disp AS d ON c.client_id = d.client_id JOIN account AS a ON d.account_id = a.account_id JOIN card AS cc ON d.disp_id = cc.disp_id WHERE cc.issued = '1994-03-03'	financial
SELECT t1.`date` FROM account AS t1 INNER JOIN trans AS t2 ON t1.account_id = t2.account_id WHERE t2.amount = 840 AND t1.`date` < '1998/10/15' ORDER BY t1.`date` DESC LIMIT 1	financial
SELECT T4.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T4 ON T2.district_id = T4.district_id WHERE T1.date = '1994/8/25'	financial
SELECT MAX(T4.amount) FROM trans AS T1 INNER JOIN disp AS T2 ON T2.account_id = T1.account_id INNER JOIN card AS T3 ON T3.disp_id = T2.disp_id INNER JOIN client AS T4 ON T4.client_id = T2.client_id WHERE STRFTIME('%Y/%m/%d', T3.issued) = '1996/10/21'	financial
SELECT T1.gender FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.client_id INNER JOIN ( SELECT AVG(A8) AS avg_salary, district_id FROM district ORDER BY avg_salary DESC LIMIT 1 ) AS T3 ON T1.district_id = T3.district_id ORDER BY T2.date DESC LIMIT 1	financial
SELECT amount FROM trans WHERE account_id = (SELECT account_id FROM loan ORDER BY amount DESC LIMIT 1) ORDER BY date ASC LIMIT 1	financial
SELECT COUNT(DISTINCT T3.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A2 = 'Jesenik' AND T3.gender = 'F'	financial
SELECT T4.disp_id FROM account AS T1 INNER JOIN card AS T2 ON T1.account_id = T2.disp_id INNER JOIN client AS T3 ON T3.client_id = T4.client_id INNER JOIN disp AS T5 ON T3.client_id = T5.client_id INNER JOIN trans AS T6 ON T1.account_id = T6.account_id WHERE T2.type = 'credit card' AND T1.date = '1998-09-02' AND T6.amount = 5100	financial
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND YEAR(date) = 1996	financial
SELECT T1.district_id FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id WHERE T1.birth_date = '1976-01-29' AND T1.gender = 'F' AND T2.date = '2001-09-17'	financial
SELECT T1.birth_date FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' AND T2.loan_id = 98832 AND T2.date = '1996-01-03'	financial
SELECT account_id FROM account WHERE district_id = ( SELECT district_id FROM district WHERE A4 LIKE '%Prague%' ) LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T3.gender = 'male' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.client_id) FROM district AS T1 INNER JOIN client AS T3 ON T1.district_id = T3.district_id WHERE T1.A2 = 'south Bohemia'	financial
SELECT CAST(SUM(CASE WHEN SUBSTR(t1.date, 1, 4) = 1993 AND SUBSTR(t1.date, 6, 2) = 3 AND SUBSTR(t1.date, 9, 2) = 22 THEN t1.balance ELSE 0 END) AS REAL) / SUM(CASE WHEN SUBSTR(t1.date, 1, 4) = 1998 AND SUBSTR(t1.date, 6, 2) = 12 AND SUBSTR(t1.date, 9, 2) = 27 THEN t1.balance ELSE 0 END) FROM trans AS t1 INNER JOIN account AS t2 ON t1.account_id = t2.account_id WHERE SUBSTR(t2.date, 1, 4) = 1993 AND SUBSTR(t2.date, 6, 2) = 7 AND SUBSTR(t2.date, 9, 2) = 5	financial
SELECT      SUM(CASE WHEN status = 'F' THEN amount END) * 100.0 / SUM(amount) as percentage  FROM      loan	financial
SELECT CAST(SUM(IIF(amount < 100000, 1, 0)) AS REAL) * 100 / COUNT(*) FROM loan	financial
SELECT T2.account_id, T3.A2 AS district_name, T3.A6 AS region FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T1.district_id = T3.district_id  WHERE strftime('%Y', T1.date) = '1993'  AND T2.type = 'disp'	financial
SELECT T1.account_id, COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'East Bohemia' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY T1.account_id, T1.frequency	financial
SELECT account_id, date FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prachatice')	financial
SELECT t3.A2, t3.A6 FROM loan AS t1  JOIN account AS t2 ON t1.account_id = t2.account_id  JOIN district AS t3 ON t2.district_id = t3.district_id  WHERE t1.loan_id = 4990;	financial
SELECT T1.account_id, T1.district_id, T2.A2 FROM loan AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.amount > 300000	financial
SELECT loan_id, T1.district_id, AVG(T3.A5)  FROM loan AS T1  INNER JOIN account AS T2 ON T1.account_id = T2.account_id  INNER JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.duration = 60  GROUP BY loan_id, T1.district_id	financial
SELECT DISTINCT a.A1, d.unemployment_rate_increment FROM district AS a LEFT JOIN ( SELECT d.district_id, ( SUM(CASE WHEN y.date BETWEEN '1996-01-01' AND '1996-12-31' THEN y.unemployment_rate ELSE 0 END) - SUM(CASE WHEN y.date BETWEEN '1995-01-01' AND '1995-12-31' THEN y.unemployment_rate ELSE 0 END) ) / SUM(y.unemployment_rate) AS unemployment_rate_increment FROM district AS d INNER JOIN year_unemployment_rate AS y ON d.district_id = y.district_id GROUP BY d.district_id ) AS d ON a.district_id = d.district_id WHERE d.unemployment_rate_increment IS NOT NULL	financial
SELECT CAST(SUM(IIF(T1.date >= '1993-01-01' AND T1.date < '1994-01-01', 1, 0)) AS REAL) * 100.0 / COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Decin'	financial
SELECT T2.account_id FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'monthly'	financial
SELECT T1.district_id, T1.A2  FROM district AS T1  JOIN client AS T2 ON T1.district_id = T2.district_id  WHERE T2.gender = 'F'  GROUP BY T1.district_id  ORDER BY COUNT(*) DESC  LIMIT 10	financial
SELECT D2.A2, T2.amount FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS D2 ON T1.account_id = D2.district_id WHERE T1.k_symbol = 'withdrawal' AND T1.bank_to = 'N/A' AND T1.date BETWEEN '1996-01-01' AND '1996-01-31' ORDER BY T2.amount DESC LIMIT 10	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'South Bohemia' AND T1.client_id NOT IN (SELECT DISTINCT T3.client_id FROM disp AS T3 INNER JOIN card AS T4 ON T3.disp_id = T4.disp_id)	financial
SELECT T2.district_id, COUNT(T1.loan_id) AS loan_count FROM loan AS T1  JOIN district AS T2 ON T1.account_id = T2.district_id  WHERE T1.status = 'A'  GROUP BY T2.district_id  ORDER BY loan_count DESC  LIMIT 1	financial
SELECT AVG(loan.amount) FROM client JOIN disp ON client.client_id = disp.client_id JOIN account ON disp.account_id = account.account_id JOIN loan ON account.account_id = loan.account_id WHERE client.gender = 'M'	financial
SELECT T1.A2, T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.date BETWEEN '1996-01-01' AND '1996-12-31' GROUP BY T1.A2, T1.A3 ORDER BY COUNT(*) DESC LIMIT 1	financial
Sure, let's break this problem down step-by-step:  1. Find the branch id where the largest number of crimes were committed in 1996. 2. Filter the `district_id` from the `loan` table where the status is 'defaulter' and the date is in 1996. 3. From the `district` table, select the `district_id` with the maximum number of such occurrences. 4. Now, find the `account_id` from the `account` table where the branch id obtained in step 3 is equal to `district_id`. 5. Count the number of unique `account_id` from the previous step.  ```sql SELECT COUNT(DISTINCT T1.account_id) AS num_accounts FROM account AS T1 JOIN (     SELECT district_id     FROM loan     WHERE status = 'defaulter' AND strftime('%Y', date) = '1996'     GROUP BY district_id     ORDER BY COUNT(*) DESC     LIMIT 1 ) AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'D'; ```	financial
SELECT COUNT(T2.account_id) FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN card AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'credit card' AND T1.k_symbol = 'withdrawal' AND T2.balance < 0 AND T1.bank_to = 'CASABANK' AND T2.date = ( SELECT DATE FROM account ORDER BY date ASC LIMIT 1 )	financial
SELECT COUNT(T1.loan_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T2.frequency = 'M' AND T1.amount >= 250000 AND T1.status = 'A'	financial
SELECT COUNT(DISTINCT T1.account_id) AS `How many accounts have running contracts in Branch location 1?` FROM `order` AS T1 INNER JOIN district AS T2 ON T2.district_id = T1.bank INNER JOIN account AS T3 ON T3.account_id = T1.account_id WHERE T2.A3 = '1'	financial
SELECT COUNT(T1.gender) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id IN (SELECT account_id FROM loan WHERE YEAR(date) = 1995 ORDER BY T2.account_id ASC LIMIT 1, 1) AND T1.gender = 'Male'	financial
SELECT COUNT(DISTINCT t1.card_id) FROM card AS t1 INNER JOIN disp AS t2 ON t1.disp_id = t2.disp_id INNER JOIN client AS t3 ON t2.client_id = t3.client_id WHERE t3.gender = 'female' AND t1.type = 'disponent'	financial
SELECT COUNT(account_id) FROM account JOIN district ON account.district_id = district.district_id WHERE A3 = 'Pisek'	financial
SELECT T1.district_id, T2.`A2` FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T3.type = 'VKLAD' AND T3.amount > 10000 AND YEAR(T1.date) = 1997	financial
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'household'	financial
SELECT account.account_id FROM account INNER JOIN card ON account.account_id = card.account_id WHERE card.type = 'gold' INTERSECT SELECT account.account_id FROM account INNER JOIN card ON account.account_id = card.account_id WHERE card.type = 'junior'	financial
SELECT AVG(t3.amount)  FROM account AS t1  INNER JOIN disp AS t2  ON t1.account_id = t2.account_id  INNER JOIN card AS t3  ON t2.disp_id = t3.disp_id  WHERE t1.frequency = 'M' AND strftime('%Y', t1.date) = '2021' AND t3.type = 'credit_card'	financial
SELECT client_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.frequency = 'Monthly' AND T1.date BETWEEN '1998-01-01' AND '1998-12-31' AND T2.type = 'DISP' GROUP BY client_id, T3.birth_date	financial
SELECT T1.client_id, T1.gender FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.status = 'A' AND T1.gender = 'F'	financial
SELECT COUNT(*) FROM client WHERE gender = 'female' INNER JOIN district ON client.district_id = district.district_id WHERE district.A3 LIKE '%South Bohemia%'	financial
SELECT account.account_id FROM account JOIN client ON account.district_id = client.district_id WHERE client.district_id = 'Tabor' AND account.status = 'A'	financial
SELECT T3.type  FROM client AS T1  JOIN district AS T2 ON T1.district_id = T2.district_id  JOIN loan AS T3 ON T1.district_id = T3.district_id  WHERE T2.A10 * 1000 > 8000  AND T2.A10 * 1000 <= 9000	financial
SELECT COUNT(t1.trans_id) AS TOTAL FROM trans AS t1 INNER JOIN account AS t2 ON t1.account_id = t2.account_id INNER JOIN district AS t3 ON t2.district_id = t3.district_id WHERE t3.A2 = 'North Bohemia' AND t1.bank = 'AB'	financial
SELECT DISTINCT T2.A2  FROM account AS T1  JOIN district AS T2 ON T1.district_id = T2.district_id  JOIN trans AS T3 ON T1.account_id = T3.account_id  WHERE T3.type = 'withdrawal'	financial
SELECT COUNT(T1.district_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE YEAR(T2.date) = 1997 AND T1.district_id IN ( SELECT district_id FROM account WHERE YEAR(date) = 1997 GROUP BY district_id HAVING COUNT(*) > 4000 )	financial
SELECT COUNT(c.card_id) FROM card AS c JOIN loan AS l ON c.disp_id = l.account_id WHERE c.type = 'classic'	financial
SELECT COUNT(client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Hl.m. Praha' AND T1.gender = 'M'	financial
SELECT CAST(COUNT(CASE WHEN T2.type = 'GOLD' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.type) AS percent FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.issued < '1998-01-01'	financial
SELECT T2.name FROM loan AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id ORDER BY T1.amount DESC LIMIT 1	financial
SELECT COUNT(t.loan_id) FROM loan AS t WHERE t.`date` LIKE '1995%' AND t.status = 'C'	financial
SELECT district_id FROM account WHERE account_id = (SELECT account_id FROM `order` WHERE order_id = 33333)	financial
SELECT T3.trans_id, T3.amount FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = 3356 AND T3.type = 'withdrawal' AND T3.operation = 'cash'	financial
SELECT COUNT(T.account_id) FROM ( SELECT T1.account_id FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'current' AND T1.status = 'A' AND T1.amount < 200000 GROUP BY T2.account_id ) AS T	financial
SELECT T2.type FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.client_id = 13539	financial
SELECT A2 FROM district WHERE district_id IN ( SELECT district_id FROM client WHERE client_id = 3541 )	financial
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'finished with no problems' GROUP BY T1.A2 ORDER BY COUNT(T2.account_id) DESC LIMIT 1	financial
SELECT T2.gender, T2.birth_date FROM order AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.order_id = 32423	financial
SELECT T3.type FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T3.client_id = T2.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.district_id = 5	financial
SELECT COUNT(account_id) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 LIKE 'Jesenik%')	financial
SELECT T2.client_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.type = 'junior' AND T2.gender = 'male' AND T2.birth_date > '1996-01-01'	financial
SELECT CAST(COUNT(CASE WHEN T3.gender = 'F' THEN 1 END) AS REAL) * 100 / COUNT(T1.client_id)  FROM disp AS T1  JOIN client AS T3 ON T3.client_id = T1.client_id  WHERE T3.district_id = (SELECT T2.district_id FROM district AS T2 WHERE AVG(T2.A10) > 10000)	financial
SELECT SUM(l.amount) / SUM(p.amount) AS growth_rate FROM loan l JOIN order o ON l.loan_id = o.loan_id JOIN client c ON o.client_id = c.client_id JOIN account a ON c.client_id = a.account_id WHERE c.gender = 'male' AND l.date BETWEEN '1996-01-01' AND '1997-12-31'	financial
SELECT COUNT(T1.trans_id) FROM trans AS T1 INNER JOIN card AS T2 ON T2.disp_id = T1.account_id WHERE T1.type = 'withdrawal' AND T1.date > '1995-12-31' AND T2.type = 'credit'	financial
SELECT SUM(IIF(A4 = 'Bohemia and Silesia' AND A2 = 'East', 1, 0)) - SUM(IIF(A4 = 'Bohemia and Silesia' AND A2 = 'North Bohemia', 1, 0)) FROM district	financial
SELECT COUNT(T1.type) FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.account_id BETWEEN 1 AND 10	financial
SELECT COUNT(T2.type) FROM trans AS T1 INNER JOIN card AS T2 ON T1.card_id = T2.card_id WHERE T1.account_id = 3 AND T2.type = 'account_statement' AND T1.operation = 'request' AND T1.amount = 0	financial
SELECT T2.A6 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 130	financial
SELECT COUNT(T2.trans_id) FROM account AS T1 INNER JOIN `order` AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T2.k_symbol = 'statement' AND T3.operation = 'receipt' AND T3.type = 'owner'	financial
SELECT MAX(t1.amount) FROM loan AS t1 INNER JOIN client AS t2 ON t2.client_id = t1.client_id WHERE t2.client_id = 992	financial
SELECT T1.amount, T4.gender, T2.account_id FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T1.type = 'WITHDRAWAL' AND T1.trans_id = 851	financial
SELECT type FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.client_id = 9	financial
SELECT SUM(T1.amount) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 617 AND T1.date BETWEEN '1998-01-01' AND '1998-12-31'	financial
SELECT DISTINCT t1.client_id, T3.account_id FROM client AS t1 INNER JOIN district AS t2 ON t1.district_id = t2.district_id INNER JOIN disp AS t3 ON t1.client_id = t3.client_id WHERE t1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND t2.A4 = 'East Bohemia'	financial
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'female' ORDER BY l.amount DESC LIMIT 3	financial
SELECT COUNT(DISTINCT t2.client_id)  FROM trans t1  JOIN disp t2 ON t1.account_id = t2.account_id  JOIN client t3 ON t2.client_id = t3.client_id  WHERE t1.type = 'PAYMENT'  AND t3.gender = 'M'  AND t3.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND t1.amount > 4000  AND t1.k_symbol = 'HOME';	financial
SELECT COUNT(T2.account_id) AS cnt FROM account AS T2 INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A2 = 'Beroun' AND T2.date > '1996-12-31'	financial
SELECT COUNT(*)  FROM client AS T1  INNER JOIN disp AS T2 ON T1.client_id = T2.client_id  INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id  WHERE T1.gender = 'F' AND T3.type = 'junior'	financial
SELECT COUNT(DISTINCT T1.client_id) / COUNT(DISTINCT T3.client_id) * 100 FROM disp AS T1 INNER JOIN client AS T3 ON T1.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A2 = 'Prague' AND T3.gender = 'F'	financial
SELECT COUNT(*) * 100 / (SELECT COUNT(client_id) FROM client WHERE gender = 'm') FROM client WHERE gender = 'm' AND client_id IN (SELECT client_id FROM disp WHERE type = 'owner' AND account_id IN (SELECT account_id FROM account WHERE frequency = 'weekly'))	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'user' AND T1.frequency = 'WEEK'	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status = 'A' AND T1.date < '1997-01-01' AND T2.duration > 24 GROUP BY T1.account_id ORDER BY T2.amount ASC LIMIT 1	financial
SELECT t3.account_id FROM client AS t1 INNER JOIN trans AS t2 ON t1.client_id = t2.account_id INNER JOIN account AS t3 ON t2.account_id = t3.account_id WHERE t1.gender = ' female' GROUP BY t3.account_id HAVING AVG(t2.amount) = ( SELECT MIN(avg_amount) FROM ( SELECT AVG(t4.amount) AS avg_amount FROM account AS t5 INNER JOIN trans AS t4 ON t5.account_id = t4.account_id GROUP BY t5.account_id ) AS t6 ) ORDER BY t3.date DESC	financial
SELECT COUNT(T2.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A2 = 'East Bohemia' AND YEAR(T1.birth_date) = 1920	financial
SELECT COUNT(T3.loan_id) FROM account AS T1 INNER JOIN loan AS T3 ON T1.account_id = T3.account_id WHERE T1.frequency = 'M' AND T3.duration = 24 AND T3.type = 'pre' AND T1.date IN ( SELECT T2.date FROM disp AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'W' AND T2.type = 'pre' )	financial
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN order AS T2 ON T1.loan_id = T2.loan_id INNER JOIN trans AS T3 ON T3.date > T2.issued AND T3.date < T1.date	financial
SELECT DISTINCT T2.client_id, T2.district_id FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id UNION SELECT DISTINCT T2.client_id, T2.district_id FROM `order` AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id	financial
SELECT DISTINCT T1.client_id, T2.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'monthly' AND T1.gender = 'M' AND T2.type = 'disp_card' AND T2.disp_id IN (SELECT T1.disp_id FROM disp AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'disp_card' AND T1.client_id = T2.client_id AND T2.status = 'A' AND T2.amount > 500000)	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT COUNT(DISTINCT molecule_id)  FROM molecule AS T1  JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T3.element = 'C'	toxicology
SELECT AVG(COUNT(DISTINCT atom_id)) AS average_oxygen_atoms FROM atom WHERE element = 'O' GROUP BY molecule_id HAVING COUNT(bond_id) = 1	toxicology
SELECT AVG(num_carcinogenic) FROM (   SELECT COUNT(DISTINCT T1.molecule_id) as num_carcinogenic   FROM molecule as T1    JOIN bond as T2 ON T1.molecule_id = T2.molecule_id   JOIN connected as T3 ON T1.molecule_id = T3.molecule_id   JOIN atom as T4 ON T3.atom_id = T4.atom_id AND T3.atom_id2 = T4.atom_id    WHERE T4.element = 'C' AND T2.bond_type = 'Single'   GROUP BY T1.molecule_id ) as T	toxicology
SELECT COUNT(m.molecule_id) FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'Na' AND b.bond_type = 'non-carcinogenic'	toxicology
SELECT m1.molecule_id  FROM molecule m1  JOIN atom a1 ON m1.molecule_id = a1.molecule_id  JOIN connected c1 ON a1.atom_id = c1.atom_id  JOIN bond b1 ON b1.bond_id = c1.bond_id  JOIN connected c2 ON c2.atom_id = c1.atom_id2  JOIN atom a2 ON a2.atom_id = c2.atom_id2  JOIN bond b2 ON b2.bond_id = c2.bond_id  JOIN connected c3 ON c3.atom_id = c2.atom_id2  JOIN atom a3 ON a3.atom_id = c3.atom_id2  JOIN bond b3 ON b3.bond_id = c3.bond_id  WHERE b1.bond_type = 'triple'  AND b2.bond_type = 'triple'  AND b3.bond_type = 'triple'  AND a1.element = 'C'  AND a2.element = 'C'  AND a3.element = 'C'	toxicology
SELECT    MAX(CASE WHEN T2.element = 'C' THEN 1 ELSE 0 END) / 2 * 100 AS percentage FROM    bond AS T1    JOIN connected AS T2 ON T1.bond_id = T2.bond_id    JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id    JOIN atom AS T4 ON T2.atom_id = T4.atom_id  WHERE    T1.bond_type = 'Double'	toxicology
SELECT COUNT(*) AS `Count of triple type bonds` FROM molecule t0 INNER JOIN bond t1 ON t0.molecule_id = t1.molecule_id INNER JOIN connected t2 ON t1.bond_id = t2.bond_id WHERE t2.atom_id = t2.atom_id2 AND t2.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = 'triple')	toxicology
SELECT COUNT(*)  FROM molecule  WHERE NOT EXISTS (     SELECT 1      FROM connected      JOIN atom ON connected.atom_id = atom.atom_id      WHERE molecule.molecule_id = connected.molecule_id AND atom.element = 'br' )	toxicology
SELECT COUNT(m.molecule_id) FROM molecule m WHERE EXISTS ( SELECT 1 FROM connected c JOIN bond b ON b.bond_id = c.bond_id WHERE b.bond_type = 'carcinogenic' GROUP BY m.molecule_id LIMIT 100 )	toxicology
SELECT DISTINCT t1.molecule_id FROM molecule AS t1 JOIN atom AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.element = 'Si'	toxicology
SELECT T2.element FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T1.bond_id = T3.bond_id  WHERE T3.bond_id = 'TR004_8_9'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = 'double'	toxicology
SELECT bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.element = 'H'  GROUP BY bond_type  ORDER BY COUNT(*) DESC  LIMIT 1;	toxicology
SELECT T.molecule_id FROM connected AS T WHERE T.atom_id = (SELECT atom_id FROM atom WHERE element = 'Te')	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id  FROM atom a1 JOIN bond b ON b.molecule_id = a1.molecule_id JOIN connected c ON c.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c.atom_id2 WHERE b.bond_type = 'single'	toxicology
SELECT DISTINCT atom_id FROM connected AS t1 JOIN bond AS t2 ON t1.bond_id = t2.bond_id WHERE t2.bond_type != 'carcinogenic'	toxicology
SELECT T2.element  FROM connected AS T1  JOIN atom AS T2 ON T2.atom_id = T1.atom_id  JOIN molecule AS T3 ON T3.molecule_id = T1.molecule_id  WHERE T3.label IS NOT NULL AND T2.element IS NOT NULL  GROUP BY T2.element  ORDER BY COUNT(*) ASC  LIMIT 1	toxicology
SELECT bond_type FROM bond WHERE bond_id IN ( SELECT bond_id FROM connected WHERE atom_id = 'TR004_8' AND atom_id2 = 'TR004_20' )	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'Ti'	toxicology
SELECT COUNT(T2.atom_id) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T3.element IN ('Iodine', 'Sulfur') AND T1.bond_type = 'Single'	toxicology
SELECT DISTINCT a1.atom_id, a2.atom_id FROM connected AS c JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = 'triple'	toxicology
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE molecule.label = 'TR181'	toxicology
SELECT CAST(SUM(CASE WHEN NOT EXISTS (SELECT * FROM connected c JOIN atom a ON c.atom_id2 = a.atom_id WHERE a.element = 'F' AND b.molecule_id = m.molecule_id) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT b.molecule_id) AS `Percentage of carcinogenic-type molecules that do not contain fluorine`	toxicology
SELECT CAST(COUNT(CASE WHEN T1.molecule_id IN (SELECT T1.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = 'triple') THEN T1.molecule_id END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percent FROM molecule AS T1	toxicology
SELECT DISTINCT atom.element FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = 'TR000' ORDER BY atom.element ASC LIMIT 3	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR001_2_6'	toxicology
SELECT COUNT(m.molecule_id) - COUNT(DISTINCT m.molecule_id) AS diff FROM molecule m	toxicology
SELECT a.atom_id  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_id = 'TR_000_2_5'	toxicology
SELECT DISTINCT bond.bond_id  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE connected.atom_id = '2'  AND connected.atom_id2 = 'TR000_2'	toxicology
SELECT m.label  FROM molecule m  JOIN connected c ON m.molecule_id = c.molecule_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = 'Double'  GROUP BY m.label  ORDER BY COUNT(c.atom_id) DESC  LIMIT 5	toxicology
SELECT CAST(COUNT(*) AS REAL) * 100 / COUNT(DISTINCT T1.atom_id) AS Percentage FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.label = 'TR008' AND T2.bond_type = 'double'	toxicology
SELECT CAST(SUM(CASE WHEN M.is_carcinogenic = 'true' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(M.molecule_id) FROM molecule M	toxicology
SELECT      SUM(a.element = 'H') * 100 / (SELECT COUNT(*) FROM atom a WHERE a.molecule_id = 'TR206') AS hydrogen_percentage FROM      connected c JOIN      atom a ON c.atom_id = a.atom_id JOIN      atom a2 ON c.atom_id2 = a2.atom_id	toxicology
SELECT bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR000')	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR060'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR018' GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT M.label FROM molecule M JOIN connected C ON M.molecule_id = C.molecule_id JOIN bond B ON C.bond_id = B.bond_id WHERE B.bond_type = 'single' GROUP BY M.molecule_id HAVING COUNT(DISTINCT C.atom_id) = 2 ORDER BY M.label ASC LIMIT 3	toxicology
SELECT bond_id FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON molecule.molecule_id = connected.molecule_id WHERE molecule.label = 'TR006' ORDER BY bond_id ASC LIMIT 2	toxicology
SELECT COUNT(T3.bond_id) AS molecule_TR009_atom_12_bonds FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id OR T2.atom_id = T3.atom_id2 JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T1.molecule_id = 'TR009' AND T2.atom_id = '12'	toxicology
SELECT COUNT(DISTINCT T.molecule_id) FROM (     SELECT T2.molecule_id, T3.element     FROM connected AS T1     JOIN atom AS T2 ON T1.atom_id = T2.atom_id     JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id     WHERE T3.element = 'bromine' ) AS T JOIN molecule AS T4 ON T.molecule_id = T4.molecule_id WHERE T4.label LIKE '%carcinogenic%'	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR001_6_9'	toxicology
SELECT a.molecule_id, m.label FROM atom AS a INNER JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10' AND m.label IS NOT NULL	toxicology
SELECT COUNT(DISTINCT T3.molecule_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T3.molecule_id = T2.molecule_id WHERE T1.bond_type = 'triple'	toxicology
SELECT COUNT(*) FROM connected WHERE atom_id = '19'	toxicology
SELECT element FROM atom WHERE molecule_id = (SELECT molecule_id FROM molecule WHERE label = 'TR004')	toxicology
SELECT COUNT(m.molecule_id) FROM molecule m WHERE NOT EXISTS (SELECT 1 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE m.molecule_id = b.molecule_id AND b.bond_type = 'carcinogenic')	toxicology
SELECT T1.label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T3.molecule_id = T2.molecule_id WHERE T3.element BETWEEN '21' AND '25'	toxicology
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.element = 'phosphorus' AND a2.element = 'nitrogen'	toxicology
SELECT m.label, COUNT(b.bond_id) as num_double_bonds FROM molecule m  JOIN connected c ON m.molecule_id = c.molecule_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double' GROUP BY m.molecule_id, m.label ORDER BY num_double_bonds DESC LIMIT 1	toxicology
SELECT COUNT(bond_id) / COUNT(DISTINCT atom_id) AS avg_bonds_per_iodine  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  WHERE element = 'I'	toxicology
SELECT bond.bond_type, bond.bond_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.atom_id = 45	toxicology
SELECT T1.element FROM atom AS T1 LEFT JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id IS NULL	toxicology
SELECT a1.element, a2.element, a3.element FROM atom a1 JOIN connected c1 ON a1.atom_id = c1.atom_id JOIN bond b ON c1.bond_id = b.bond_id JOIN connected c2 ON c2.bond_id = b.bond_id JOIN atom a2 ON a2.atom_id = c2.atom_id_2 JOIN connected c3 ON c3.atom_id = a2.atom_id JOIN atom a3 ON a3.atom_id = c3.atom_id_2 JOIN molecule m ON m.molecule_id = a1.molecule_id WHERE m.label = 'TR447' AND b.bond_type = 'triple'	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = 'TR144_8_19')	toxicology
SELECT molecule_id FROM ( SELECT molecule_id FROM connected AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T3.bond_id = T1.bond_id WHERE T3.bond_type = 'double' GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1 )	toxicology
SELECT element, COUNT(atom.atom_id) FROM atom JOIN molecule ON molecule.molecule_id = atom.molecule_id WHERE molecule.label IN (SELECT molecule.molecule_id FROM molecule JOIN connected ON molecule.molecule_id = connected.molecule_id WHERE bond_type = 'carcinogenic') GROUP BY element ORDER BY COUNT(atom.atom_id) ASC LIMIT 1	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'Pb'	toxicology
SELECT DISTINCT T2.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = 'triple')	toxicology
SELECT CAST(SUM(CASE WHEN atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond GROUP BY bond_id ORDER BY COUNT(*) DESC LIMIT 1)) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond	toxicology
SELECT SUM(CASE WHEN b.bond_type = 'single' THEN 1 ELSE 0 END) / COUNT(*) AS proportion  FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id IN (     SELECT a.atom_id      FROM atom a     WHERE a.element IN ('H', 'C', 'O', 'N') )	toxicology
SELECT COUNT(DISTINCT a.atom_id) AS total_atoms FROM atom AS a WHERE a.element = 'C' OR a.element = 'H'	toxicology
SELECT c.atom_id2  FROM connected AS c  JOIN atom AS a ON c.atom_id = a.atom_id  WHERE a.element = 'sulphur'	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'Tin'	toxicology
SELECT COUNT(T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = 'single'	toxicology
SELECT COUNT(DISTINCT connected.atom_id) FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = 'triple' AND (atom.element = 'phosphorus' OR atom.element = 'bromine')	toxicology
SELECT B.bond_id FROM bond AS B JOIN molecule AS M ON B.molecule_id = M.molecule_id WHERE M.label = 'carcinogenic'	toxicology
SELECT molecule_id FROM connected WHERE bond_id = 'single_bond'  In this query, we are selecting the molecule_id from the connected table where the bond_id is equal to 'single_bond'. This will give us the molecule_id of all molecules that have a single bond.	toxicology
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM molecule WHERE label LIKE '%' || 'C' || '%') FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = 'single' AND T3.element = 'C'	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id  FROM molecule  WHERE label IS NOT NULL  AND EXISTS (   SELECT 1    FROM connected    JOIN atom ON connected.atom_id = atom.atom_id    WHERE atom.molecule_id = molecule.molecule_id    AND EXISTS (     SELECT 1      FROM bond      WHERE bond.bond_id = connected.bond_id      AND bond.bond_type = 'non carcinogenic'   ) )	toxicology
Sure, here's the SQL to calculate the total carcinogenic molecules for molecule IDs from TR000 to TR030: ```sql SELECT COUNT(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' ``` This SQL statement will count the total number of molecules with molecule IDs that fall between 'TR000' and 'TR030'. The `WHERE` clause filters the molecules based on the molecule ID, and the `COUNT()` function calculates the number of matching molecules.	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id LIKE 'TR%' AND molecule_id BETWEEN 'TR000' AND 'TR050')	toxicology
SELECT DISTINCT e FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(b.bond_id) FROM bond AS b JOIN atom AS a ON b.molecule_id = a.molecule_id WHERE a.element = 'iodine'	toxicology
SELECT      m.label,     c.element,     COUNT(CASE WHEN m.label LIKE '%carcinogenic%' THEN 1 ELSE NULL END) AS num_carcinogenic,     COUNT(*) - COUNT(CASE WHEN m.label LIKE '%carcinogenic%' THEN 1 ELSE NULL END) AS num_non_carcinogenic FROM      connected c JOIN      atom a ON c.atom_id = a.atom_id JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.element = 'Ca' GROUP BY      m.label,     c.element	toxicology
SELECT COUNT(DISTINCT a1.element) FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR001_1_8' AND (a1.element = 'Chlorine' OR a2.element = 'Chlorine') AND (a1.element = 'Carbon' OR a2.element = 'Carbon')	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id INNER JOIN connected c ON a.atom_id = c.atom_id INNER JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'C' AND b.bond_type = 'triple' AND m.label NOT LIKE '%carcinogenic%' LIMIT 2	toxicology
SELECT CAST(COUNT(CASE WHEN atom.element = 'Cl' THEN 1 END) AS REAL) * 100 / COUNT(DISTINCT molecule.molecule_id) as percentage  FROM atom  INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id	toxicology
SELECT DISTINCT T3.element  FROM connected AS T1  JOIN bond AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON T1.atom_id = T3.atom_id  JOIN molecule AS T4 ON T4.molecule_id = T3.molecule_id  WHERE T4.label = 'TR001'	toxicology
SELECT DISTINCT b.molecule_id FROM bond b WHERE b.bond_type = 'double'	toxicology
1. First, let's see the relationship between the tables.  a. `atom` has many-to-one relationship with `molecule`.  b. `bond` has many-to-one relationship with `molecule`.  c. `connected` has many-to-many relationship between `atom` and `bond`.  2. We need to find the first and second atoms of triple bond type molecules.  3. Therefore, we need to join `atom`, `molecule`, `bond` and `connected` tables.  4. After joining the tables, we need to filter the rows where the bond type is 'Triple' and order the results by molecule_id and atom_id.  5. Once we get the results, we need to pick the first and second atom IDs.  SQL Query:  ```sql SELECT a1.atom_id, a2.atom_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = 'Triple' GROUP BY m.molecule_id, a1.atom_id, a2.atom_id ORDER BY m.molecule_id, a1.atom_id LIMIT 2; ```	toxicology
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_id = 'TR005_16_26'	toxicology
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 WHERE T1.molecule_id IN (SELECT T2.molecule_id FROM connected AS T3 JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T2.bond_type = 'single' GROUP BY T2.molecule_id)	toxicology
SELECT bond.bond_type FROM bond WHERE bond_id = 'TR001_10_11'	toxicology
SELECT bond.bond_id, molecule.label FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id INNER JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = 'Triple' AND atom1.element = 'C' AND atom2.element = 'C' AND (     SELECT COUNT(*)     FROM connected AS connected2     INNER JOIN atom AS atom3 ON connected2.atom_id = atom3.atom_id     WHERE connected2.bond_id = bond.bond_id     AND atom3.element = 'C' ) = 3	toxicology
SELECT count(m1.molecule_id) as molecule_count  FROM molecule m1  JOIN connected c ON m1.molecule_id = c.molecule_id  JOIN atom a ON c.atom_id = a.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.atom_id = '4' AND a.element = 'Toxicology'	toxicology
SELECT ROUND(COUNT(CASE WHEN atom.element = 'H' THEN 1 END) * 100.0 / COUNT(*), 2) AS ratio, molecule.label FROM connected JOIN atom ON connected.atom_id = atom.atom_id JOIN bond ON connected.bond_id = bond.bond_id JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR006' GROUP BY molecule.label	toxicology
SELECT t1.label FROM molecule AS t1 JOIN connected AS t2 ON t1.molecule_id = t2.molecule_id JOIN atom AS t3 ON t2.atom_id = t3.atom_id WHERE t3.element = 'calcium'	toxicology
SELECT T3.bond_type FROM atom AS T1  INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id  INNER JOIN bond AS T3 ON T3.bond_id = T2.bond_id  WHERE T1.element = 'Tellurium'	toxicology
SELECT a1.element FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR001_10_11'	toxicology
SELECT      ROUND(COUNT(CASE WHEN COUNT(DISTINCT bond_id) = 3 THEN 1 ELSE NULL END) * 100.0 / COUNT(*), 2) AS percent_of_triple_bond_compounds FROM      connected JOIN      bond ON connected.bond_id = bond.bond_id GROUP BY      connected.atom_id	toxicology
SELECT      COUNT(CASE WHEN c.bond_id IS NOT NULL THEN 1 ELSE NULL END) * 100.0 / COUNT(c.atom_id) AS percent FROM      molecule AS m JOIN      atom AS a ON m.molecule_id = a.molecule_id JOIN      connected AS c ON a.atom_id = c.atom_id WHERE      m.label = 'TR047'	toxicology
SELECT m.label  FROM molecule m  JOIN connected c ON m.molecule_id = c.molecule_id  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE a1.atom_id = 'TR001_1' AND b.bond_type LIKE '%carcinogenic%'	toxicology
SELECT T3.label, T4.element  FROM connected AS T1  INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id  INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id  INNER JOIN bond AS T4 ON T1.bond_id = T4.bond_id  WHERE T3.label = 'TR151'	toxicology
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR151'	toxicology
SELECT COUNT(DISTINCT CASE WHEN T2.element IN ('C', 'H', 'N', 'O', 'S', 'F') THEN T1.molecule_id ELSE NULL END) AS num_carcinogenic FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id	toxicology
SELECT DISTINCT a.* FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id BETWEEN 'TR010' AND 'TR050' AND a.element = 'C'	toxicology
SELECT COUNT(DISTINCT atom.atom_id)  FROM molecule  JOIN connected ON molecule.molecule_id = connected.molecule_id  JOIN atom ON connected.atom_id = atom.atom_id	toxicology
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = 'double' AND c.atom_id IN (SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'carcinogenic compound')	toxicology
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'Hydrogen' AND m.label = 'Carcinogenic Compound'	toxicology
SELECT T1.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T2.atom_id  =  T3.atom_id WHERE T3.element = 'TR00_1'	toxicology
SELECT A.atom_id FROM atom AS A WHERE A.element = 'C' EXCEPT SELECT C.atom_id FROM compound_carcinogenic AS C WHERE C.is_carcinogenic = 1	toxicology
SELECT COUNT(T1.molecule_id) / COUNT(DISTINCT T1.molecule_id) AS `% CARCINOGENS`  FROM molecule AS T1  JOIN (   SELECT T1.molecule_id    FROM atom AS T1    JOIN connected AS T2 ON T1.atom_id = T2.atom_id    JOIN connected AS T3 ON T2.atom_id2 = T3.atom_id    JOIN connected AS T4 ON T4.atom_id = T3.atom_id2    JOIN connected AS T5 ON T5.atom_id = T4.atom_id2    JOIN bond AS T6 ON T6.bond_id = T5.bond_id    WHERE T1.element = 'H'    AND T1.molecule_id IN (     SELECT T1.molecule_id      FROM molecule AS T1      JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id      WHERE T2.bond_id IN (       SELECT T1.bond_id        FROM bond AS T1        WHERE T1.bond_type IN (         SELECT T1.bond_type          FROM bond AS T1          GROUP BY T1.bond_type          HAVING COUNT(*) > 1       )     )   ) ) AS T7 ON T7.molecule_id = T1.molecule_id	toxicology
SELECT `molecule`.`molecule_id`, `molecule`.`label` FROM `molecule` INNER JOIN `connected` ON `molecule`.`molecule_id` = `connected`.`molecule_id` INNER JOIN `atom` ON `atom`.`atom_id` = `connected`.`atom_id` WHERE `molecule`.`label` = 'TR124'	toxicology
SELECT atom.atom_id  FROM atom  INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN molecule ON connected.molecule_id = molecule.molecule_id WHERE molecule.label = 'TR186'	toxicology
SELECT bond_type  FROM bond  WHERE molecule_id = (   SELECT molecule_id    FROM molecule    WHERE label = 'TR007_4_19' )	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(DISTINCT bond.bond_id) AS double_bonds, is_carcinogenic  FROM molecule  JOIN atom ON molecule.molecule_id = atom.molecule_id  JOIN connected ON atom.atom_id = connected.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE molecule.label = 'TR006' AND bond.bond_type = 'double'	toxicology
SELECT molecule_id FROM molecule WHERE label LIKE '%carcinogenic%'	toxicology
SELECT DISTINCT b.bond_id, a1.element, a2.element  FROM connected AS c  JOIN bond AS b ON c.bond_id = b.bond_id  JOIN atom AS a1 ON c.atom_id = a1.atom_id  JOIN atom AS a2 ON c.atom_id2 = a2.atom_id  WHERE b.bond_type = 'single'	toxicology
SELECT DISTINCT a.element  FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'Triple'	toxicology
SELECT atom.element FROM connected AS connected INNER JOIN bond AS bond ON connected.bond_id = bond.bond_id INNER JOIN atom AS atom ON connected.atom_id = atom.atom_id WHERE bond.bond_id = 'TR000_2_3'	toxicology
SELECT count(DISTINCT bond_id) AS num FROM connected JOIN atom ON connected.atom_id = atom.atom_id WHERE element = 'chlorine'	toxicology
SELECT a.atom_id, COUNT(b.bond_type) FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = 'TR346' GROUP BY a.atom_id	toxicology
To answer the question "How many molecules have a double bond type and among these molecule, how many are labeled as carcinogenic compounds?", we can use the following SQL query:  ```sql SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = 'double' ```  This query counts the distinct molecule IDs that have a double bond type in the `bond` table.   Next, to find the number of these molecules that are labeled as carcinogenic compounds, we can join the `molecule` table with an additional `compound` table that contains information about carcinogenic compounds. However, as per the given database schema, there is no direct information about which molecules are carcinogenic. Therefore, we cannot accurately calculate the number of carcinogenic molecules without additional information about the `compound` table.   So, the final SQL query for finding the number of molecules with double bond type among the carcinogenic compounds would require additional information about the `compound` table.	toxicology
SELECT count(m1.molecule_id) FROM molecule m1 WHERE m1.label NOT IN (SELECT m2.molecule_id FROM molecule m2 INNER JOIN connected c ON m2.molecule_id = c.molecule_id INNER JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'S' INNER JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'double')	toxicology
SELECT molecule.label  FROM molecule  JOIN connected ON molecule.molecule_id = connected.molecule_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.molecule_id = 'TR005'	toxicology
SELECT COUNT(*) AS number_of_single_bonds FROM bond WHERE bond_type = 'single'	toxicology
SELECT T1.molecule_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id JOIN bond AS T4 ON T1.bond_id = T4.bond_id WHERE T2.element = 'cl' AND T4.bond_type = 'carcinogenic'	toxicology
SELECT m.molecule_id  FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' GROUP BY m.molecule_id  HAVING COUNT(DISTINCT a.atom_id) = SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END)	toxicology
SELECT CAST(COUNT(CASE WHEN a.element = 'Cl' THEN 1 END) AS REAL) * 100 / COUNT(m.molecule_id) FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE c.bond_id IS NOT NULL	toxicology
SELECT T2.molecule_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T2.molecule_id = T1.molecule_id WHERE T1.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT T2.element)  FROM bond AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T1.bond_id = 'TR001_3_4'	toxicology
SELECT t2.bond_type FROM connected AS t1 JOIN bond AS t2 ON t1.bond_id = t2.bond_id WHERE t1.atom_id = 'TR000_1' AND t1.atom_id2 = 'TR000_2'	toxicology
SELECT label FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T3.atom_id = 'TR000_2' AND T2.atom_id2 = '2'	toxicology
SELECT e.element FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR000_1' AND m.label = 'toxicology'	toxicology
SELECT CASE WHEN COUNT(m.molecule_id) > 0 THEN 'Carcinogenic' ELSE 'Not carcinogenic' END AS Is_Carcinogenic FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = 'TR000'	toxicology
SELECT COUNT(DISTINCT a.atom_id) / COUNT(a.atom_id) * 100 as percentage FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = 'single'	toxicology
SELECT COUNT(DISTINCT t2.molecule_id) FROM atom AS t1 JOIN connected AS t3 ON t1.atom_id = t3.atom_id JOIN bond AS t4 ON t3.bond_id = t4.bond_id JOIN molecule AS t2 ON t2.molecule_id = t1.molecule_id WHERE t1.element = 'Nitrogen' AND t4.bond_type IN ('aromatic', 'single', 'double')	toxicology
SELECT T2.molecule_id FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T4 ON T4.bond_id = T3.bond_id JOIN molecule AS T2 ON T2.molecule_id = T4.molecule_id WHERE T1.element = 'Sulphur' AND T4.bond_type = 'Double bond'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element NOT IN ('C', 'H', 'O') GROUP BY m.molecule_id HAVING COUNT(c.atom_id) > 5	toxicology
SELECT t1.element, t3.label FROM atom AS t1 JOIN connected AS t2 ON t1.atom_id = t2.atom_id JOIN bond AS t3 ON t3.bond_id = t2.bond_id JOIN molecule AS t4 ON t4.molecule_id = t3.molecule_id WHERE t4.label = 'TR024' AND t3.bond_type = 'double'	toxicology
SELECT a.molecule_id, COUNT(b.atom_id) as num_atoms FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element IN ('H', 'C', 'N', 'O', 'F', 'Cl', 'Br', 'I') GROUP BY a.molecule_id ORDER BY num_atoms DESC LIMIT 1	toxicology
SELECT AVG(CASE WHEN T1.label = 'Carcinogen' AND T2.bond_type = 'Triple bond' THEN 1 ELSE 0 END) * 100 AS percentage  FROM molecule AS T1  JOIN connected AS T3 ON T1.molecule_id = T3.molecule_id  JOIN atom AS T2 ON T3.bond_id = T2.atom_id  WHERE T2.element = 'H'	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS num_molecules_carcinogenic FROM molecule m  JOIN connected c ON m.molecule_id = c.molecule_id JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = 'carcinogenic'	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM connected AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  JOIN bond AS T3 ON T1.bond_id = T3.bond_id  WHERE T2.molecule_id BETWEEN 'TR004' AND 'TR010' AND T3.bond_type = 'single'	toxicology
SELECT COUNT(DISTINCT T1.atom_id)  FROM ATOM AS T1  JOIN CONNECTED AS T2 ON T1.atom_id = T2.atom_id  JOIN MOLECULE AS T3 ON T3.molecule_id = T1.molecule_id  WHERE T3.label = 'TR008' AND T1.element = 'C'	toxicology
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T4.label != 'carcinogenic' AND T3.atom_id = 'TR004_7'	toxicology
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.bond_type = 'double' AND a1.element = 'O' AND a2.element = 'O'	toxicology
SELECT COUNT(*) FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = 'triple'  AND molecule.molecule_id NOT IN (   SELECT DISTINCT molecule.molecule_id    FROM molecule    JOIN connected ON molecule.molecule_id = connected.molecule_id   GROUP BY molecule.molecule_id   HAVING COUNT(DISTINCT connected.atom_id) >= 3 )	toxicology
SELECT DISTINCT bond.bond_type FROM connected AS connected INNER JOIN bond AS bond ON connected.bond_id = bond.bond_id INNER JOIN atom AS atom ON connected.atom_id = atom.atom_id INNER JOIN molecule AS molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR016'	toxicology
SELECT atom.atom_id  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  JOIN bond ON connected.bond_id = bond.bond_id  WHERE bond.bond_type = 'double'  AND atom.element = 'C'  AND connected.atom_id2 IN  (SELECT atom_id  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.element = 'C')  AND connected.atom_id IN  (SELECT atom_id  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.element = 'C')	toxicology
SELECT atom.atom_id FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = 'oxygen'	toxicology
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.text LIKE '%Incredibly Powerful Foil%'	card_games
SELECT id FROM cards WHERE isFoil = 0 AND isFullArt = 0	card_games
SELECT T2.name, T2.convertedManaCost FROM cards AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid ORDER BY T2.convertedManaCost DESC	card_games
SELECT T2.name FROM foreign_data AS T1  INNER JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T2.frameVersion = '2015 Frame Style' AND T1.ranking < 100	card_games
SELECT DISTINCT T2.format FROM sets AS T1 INNER JOIN legalities AS T2 ON T2.uuid = T1.uuid WHERE T1.type = 'expansion' AND T2.status = 'banned' AND T1.code IN ( SELECT code FROM sets WHERE expansion_group = 'gladiator' )	card_games
SELECT MAX(legalities.format) FROM (     SELECT cards.uuid     FROM cards     WHERE cards.type LIKE '%Artifact%'      AND cards.isReprint = 0      AND (cards.faces IS NULL OR cards.faces = '[]') ) JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'vintage'	card_games
SELECT DISTINCT T2.id, T2.artist FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'Commander' AND T2.power = 'Unknown'	card_games
SELECT T1.name, T3.text FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T2.language = 'English' AND T2.name = 'Stephen Daniel'	card_games
SELECT T3.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'	card_games
SELECT T1.name, T1.artist, CASE WHEN T2.isPromo = 1 THEN 'Promotional' ELSE 'Not Promotional' END AS printing_type FROM cards AS T1 LEFT JOIN cards AS T2 ON T1.uuid = T2.uuid ORDER BY LENGTH(T1.rulings) DESC LIMIT 1	card_games
SELECT COUNT(T3.language) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid INNER JOIN legalities AS T3 ON T2.uuid = T3.uuid WHERE T2.name = 'Annul' AND T2.number = '29' AND T3.format = 'altered' AND T3.status = 'not_allowed'	card_games
SELECT name FROM cards WHERE TEXT IN (SELECT TEXT FROM foreign_data WHERE language = 'japanese')	card_games
SELECT AVG(CASE WHEN COALESCE(SUBSTR(t1.languages, 9, 2), 'XX') = 'zh' THEN 1 ELSE 0 END) FROM cards AS t1	card_games
SELECT s.name, COUNT(c.id) FROM sets s JOIN cards c ON s.code = c.setCode JOIN set_translations st ON s.code = st.setCode AND st.language = 'it' GROUP BY s.name	card_games
SELECT COUNT(T1.type) FROM cards AS T1 INNER JOIN cards AS T2 ON T1.artist = 'Aaron Boyd' WHERE T1.artist = T2.artist	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'	card_games
SELECT COUNT(T2.power) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.power = 'Infinity'	card_games
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = "Ancestor's Chosen"	card_games
SELECT type FROM cards WHERE name = 'Ancestor's Chosen'	card_games
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Angel of Mercy'	card_games
SELECT COUNT(DISTINCT C.uuid) FROM cards C INNER JOIN legalities L ON C.uuid = L.uuid WHERE L.status = 'restricted' AND C.text IS NOT NULL	card_games
SELECT ruling FROM rulings WHERE text LIKE '%Condemn%'	card_games
SELECT COUNT(*) FROM cards AS t1 INNER JOIN legalities AS t2 ON t1.uuid = t2.uuid WHERE t2.status = 'restricted' AND t1.isStarter = 1	card_games
SELECT status FROM legalities WHERE uuid = ( SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle' )	card_games
SELECT TYPE FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT T2.rule FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN artists AS T2 ON T1.artist = T2.artist WHERE T1.scryfallOracleId IN (SELECT T1.scryfallOracleId FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Phyrexian')	card_games
SELECT CAST(SUM(CASE WHEN borderColor IS NULL OR borderColor = '' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'de' AND T1.isReprint = 1	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T3.translation = 'rus' AND T2.borderColor = 'none'	card_games
SELECT COUNT(*) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.isStorySpotlight = 1 AND legalities.format = 'commander' AND legalities.status = 'legal' AND cards.language = 'French'	card_games
SELECT COUNT(*) FROM cards WHERE toughness = 99	card_games
SELECT name FROM cards WHERE illustrator = 'Aaron Boyd'	card_games
SELECT COUNT(DISTINCT c.id) FROM cards AS c WHERE c.border_color = 'black' AND c.is_onli	card_games
SELECT id FROM cards WHERE convertedManaCost = 0	card_games
SELECT layout FROM cards WHERE keywords LIKE '%flying%'	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T1.originalType = 'Summon - Angel' AND T3.subtype IS NOT NULL AND T3.subtype != 'Angel'	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'modern' AND T2.status = 'restricted' AND T1.isFoil = 1 AND T1.power > ( SELECT AVG(T3.power) FROM cards AS T3 INNER JOIN legalities AS T4 ON T3.uuid = T4.uuid WHERE T4.format = 'modern' AND T4.status = 'restricted' AND T3.isFoil = 0 AND T3.power > 0 )	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT T2.edhrecRank FROM cards AS T1 INNER JOIN cards AS T2 ON T2.uuid = T1.uuid WHERE T1.frameVersion = '2015'	card_games
SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'zh-CN'	card_games
SELECT T2.name  FROM foreign_data AS T1  INNER JOIN cards AS T2  ON T1.uuid = T2.uuid  WHERE T2.availability = 'paper'  AND T1.language = 'Japanese'	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Unhinged' AND T1.borderColor = 'White'	card_games
SELECT cards.uuid, foreign_data.language FROM cards LEFT JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.format = 'Legacy'	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality' ORDER BY T2.date	card_games
SELECT T1.format, T2.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.frameVersion = 'Future'	card_games
SELECT colorIdentity, name FROM cards WHERE setCode = 'OGW'	card_games
SELECT c1.convertedManaCost, c1.name, c2.translation, c2.language FROM cards AS c1 LEFT JOIN set_translations AS c2 ON c1.setCode = c2.setCode WHERE c1.convertedManaCost = 5 AND c2.translation IS NOT NULL	card_games
SELECT C.name, R.date FROM cards C JOIN rulings R ON C.uuid = R.uuid WHERE C.originalType LIKE '%Creature - Elf%'	card_games
SELECT DISTINCT T2.name, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.colors = 'Black' AND T2.language = 'Japanese'	card_games
SELECT name FROM cards WHERE rarity = 'uncommon' ORDER BY ruling_id ASC LIMIT 3	card_games
SELECT count(*) FROM cards WHERE designer = 'John Avon' AND hasFoil = 1	card_games
SELECT COUNT(id) FROM cards WHERE borderColor = 'white'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND type LIKE '%mtgo%';	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.layout = 'normal' AND T2.frameVersion = '2003' AND T1.borderColor = 'black' AND T1.availability = 'paper, mtgo'	card_games
SELECT sum(T2.convertedManaCost) FROM cards AS T1 INNER JOIN cards AS T2 ON T1.artist = T2.artist WHERE T1.artist = 'Rob Alexander'	card_games
SELECT DISTINCT T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid	card_games
SELECT setCode FROM sets	card_games
SELECT CAST(SUM(CASE WHEN MAX(hand) = 3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(uuid) FROM cards WHERE layout = 'Legendary Creature'	card_games
SELECT    COUNT(*) * 100.0 / total.cnt AS pct,   card.id FROM    cards card    JOIN (     SELECT        id,       CASE          WHEN text IS NULL THEN 0          ELSE 1        END AS has_text      FROM        cards    ) text_card ON card.id = text_card.id JOIN    (     SELECT        COUNT(*) AS cnt      FROM        cards      WHERE        isStorySpotlight = 1    ) total ON 1 = 1  WHERE    card.isStorySpotlight = 1  GROUP BY    card.id	card_games
SELECT COUNT(T2.uuid), T1.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Premium Deck Series: Shatterspeaker'	card_games
SELECT T2.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.set_code WHERE T1.totalSetSize = 309	card_games
SELECT COUNT(*)  FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Commander' AND set_translations.language = 'brazilian'	card_games
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.type LIKE 'Creature%' AND T2.format LIKE '%Legal%'	card_games
SELECT types FROM cards	card_games
SELECT COUNT(t1.uuid) FROM cards AS t1 INNER JOIN rulings AS t2 ON t1.uuid = t2.uuid WHERE t1.power IS NOT NULL AND t2.text LIKE '%Triggered%'	card_games
SELECT COUNT(T2.id) FROM cards AS T1 INNER JOIN rules AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'premodern' AND T2.text = 'This is a triggered mana ability' AND T1.faces IS NULL	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability = 'paper' AND format = 'Pauper'	card_games
SELECT artist FROM cards WHERE text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%'	card_games
SELECT DISTINCT f.name  FROM foreign_data f  JOIN cards c ON f.uuid = c.uuid  WHERE c.artist = 'Matthew D. Wilson' AND c.type = 'Creature' AND c.layout = 'normal' AND c.borderColor = 'black'	card_games
SELECT COUNT(T2.uuid) FROM cards AS T1 INNER JOIN rulings AS T2 ON T2.uuid = T1.uuid WHERE T1.rarity = 'Common' AND T2.date = '2009-10-01'	card_games
SELECT language FROM set_translations  WHERE setCode =  (SELECT code  FROM sets  WHERE totalSetSize = 180  AND block = 'Ravnica')	card_games
SELECT AVG(CASE WHEN status = 'banned' THEN 1 ELSE 0 END) * 100 AS percentage FROM legalities	card_games
SELECT COUNT(T2.uuid) * 100.0 / COUNT(T1.uuid) FROM cards AS T1 LEFT JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'french' AND T2.power IS NULL	card_games
SELECT T2.name, CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(DISTINCT T1.setCode) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'ja' AND T1.isBooster = 0) AS percentage FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'ja' AND T1.isBooster = 0	card_games
SELECT printing FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE colorIndicator IS NULL OR colorIndicator = ''	card_games
SELECT COUNT(uuid) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN promotion_types AS T2 ON T1.uuid = T2.uuid WHERE T2.type = 'arena league' ORDER BY T1.power ASC LIMIT 3	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.multiverseId = 149934	card_games
SELECT DISTINCT T1.mcmId FROM cards AS T1 INNER JOIN cards AS T2 ON T1.mcmId = T2.cardKingdomFoilId ORDER BY T1.mcmId ASC LIMIT 3	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 WHERE T1.text IS NULL AND T1.layout <> 'normal'	card_games
SELECT T1.number FROM cards AS T1 INNER JOIN legalities AS T2 ON T2.uuid = T1.uuid WHERE T1.multiverseId IS NULL AND T2.format = 'commander' AND T1.isPromo = 0	card_games
SELECT t3.name FROM sets AS t1 INNER JOIN cards AS t2 ON t1.code = t2.setcode INNER JOIN set_translations AS t3 ON t3.setcode = t1.code INNER JOIN tcgplayer AS t4 ON t4.code = t1.code WHERE t3.translation = 'Magic: The Gathering Online' EXCEPT SELECT t3.name FROM sets AS t1 INNER JOIN cards AS t2 ON t1.code = t2.setcode INNER JOIN set_translations AS t3 ON t3.setcode = t1.code INNER JOIN tcgplayer AS t4 ON t4.code = t1.code WHERE t3.translation != 'Magic: The Gathering Online' ORDER BY t3.name ASC	card_games
SELECT language FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.setCode = 'ARC'	card_games
SELECT T2.name, T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.totalSetSize = 5 AND T2.language = 'English'	card_games
SELECT language, type FROM sets WHERE code = 'F15'	card_games
SELECT s.code, s.name FROM sets s INNER JOIN cards c ON s.code = c.setCode INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE s.block = 'Shadowmoor' AND fd.language = 'Italian' AND c.name <> '' ORDER BY s.name ASC LIMIT 2	card_games
SELECT T1.id FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.availability = 'Not for sale' AND T2.hasFoil = 1 AND T2.scryfallIllustrationId LIKE '%jp%'	card_games
SELECT s.name FROM sets AS s JOIN cards AS c ON s.code = c.setCode WHERE s.language = 'Russian' GROUP BY s.name ORDER BY COUNT(c.id) DESC LIMIT 1	card_games
SELECT COUNT(T1.language) * 100.0 / COUNT(*) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'zh-CN' AND T2.isOnlineOnly = 1	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name NOT IN ( SELECT name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE language = 'Japanese' )	card_games
SELECT COUNT(id) FROM cards WHERE borderColor = 'black'	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT T2.name FROM card_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.border_color = 'black' AND T2.is_full_art = 1	card_games
SELECT language FROM sets WHERE code = '174'	card_games
SELECT name FROM sets WHERE code = "ALL"	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13';	card_games
SELECT code FROM sets WHERE block IN ('Masques', 'Mirage')	card_games
SELECT T2.code FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.type = 'expansion'	card_games
SELECT T2.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.watermark = 'Boros'	card_games
SELECT T3.language, T1.flavorText FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T2.setCode = T3.code WHERE T3.watermark = 'colorpie'	card_games
SELECT CAST(SUM(CASE WHEN T2.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.uuid) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Abyssal Horror'	card_games
SELECT T1.code FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setcode INNER JOIN legalities AS T3 ON T2.uuid = T3.uuid WHERE T2.type = 'Expansion Commander'	card_games
SELECT t1.foreignname FROM foreign_data AS t1 INNER JOIN cards AS t2 ON t1.uuid = t2.uuid WHERE t2.watermark = 'Abzan Watermark' AND t1.language = 'en'	card_games
SELECT type FROM cards WHERE watermark = "azorius"	card_games
SELECT COUNT(*) FROM ( SELECT T1.uuid FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.artist = 'Aaron Miller' AND T2.format = 'Modern Magic' AND T3.releaseDate BETWEEN '2012-01-01' AND '2012-12-31' AND T1.power > '5' )	card_games
SELECT COUNT(*) FROM cards AS t1 INNER JOIN sets AS t2 ON t1.setCode = t2.code WHERE t2.isFoilOnly = 0	card_games
SELECT name FROM cards WHERE text IS NOT NULL	card_games
SELECT id, layout, manaCost FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT COUNT(DISTINCT t2.uuid)  FROM cards t1  JOIN foreign_data t2 ON t1.uuid = t2.uuid  WHERE t1.borderColor = 'White' AND t2.power = ''	card_games
SELECT name FROM cards WHERE isPromo = 1 AND otherFaceIds IS NOT NULL	card_games
SELECT types FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT T2.url FROM FOREIGN_DATA AS T1  JOIN cards AS T2 ON T1.uuid = T2.uuid  WHERE T1.type = 'Promo' AND T1.flavorText = 'Bundle'	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.borderColor = 'black' AND T1.printings LIKE '%arena%' AND T1.printings LIKE '%mtgo%'	card_games
SELECT MAX(convertedManaCost) FROM cards WHERE name = 'Serra Angel' UNION ALL SELECT MAX(convertedManaCost) FROM cards WHERE name = 'Shrine Keeper'	card_games
SELECT T2.artist FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.promoName = 'Battra, Dark Destroyer'	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT DISTINCT T3.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.uuid INNER JOIN sets AS T3 ON T3.code = T1.setCode WHERE T2.name LIKE 'Ancestor%Chosen%' AND T2.language = 'Italian'	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN cards AS T2 ON T2.setCode = T1.code WHERE T2.name = "Angel of Mercy"	card_games
SELECT name FROM cards WHERE setcode = 'Hauptset Zehnte Edition'	card_games
SELECT t2.text FROM sets AS t1 INNER JOIN rulings AS t2 ON t1.code = t2.uuid WHERE t2.text LIKE '%Ancestor's Chosen%' AND t1.language = 'ko'	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Hauptset Zehnte Edition'	card_games
SELECT t1.name FROM set_translations AS t1 INNER JOIN sets AS t2 ON t1.setcode = t2.code WHERE t1.language = 'Simplified Chinese' AND t2.name = 'Eighth Edition'	card_games
SELECT isOnlineOnly FROM sets WHERE name = 'Angel of Mercy'	card_games
SELECT releaseDate FROM sets WHERE name = 'Ancestor''s Chosen'	card_games
SELECT type FROM sets WHERE name = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(T3.code) FROM block AS T1 INNER JOIN sets AS T2 ON T1.id = T2.block_id INNER JOIN set_translations AS T3 ON T2.code = T3.set_code WHERE T1.name = 'Ice Age' AND T3.language = 'Italian'	card_games
SELECT CASE WHEN COUNT(T1.code) = COUNT(T2.code) THEN 1 ELSE 0 END FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Adarkar Valkyrie'	card_games
SELECT COUNT(*) FROM (SELECT T2.setcode FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.setcode = T2.code WHERE T1.language = 'Italian' GROUP BY T2.setcode HAVING COUNT(T2.baseSetSize) < 10)	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'Black'	card_games
SELECT t3.name FROM sets AS t1 INNER JOIN cards AS t2 ON t1.code = t2.setCode INNER JOIN cards AS t3 ON t1.code = t3.setCode WHERE t1.name = 'Coldsnap' ORDER BY t2.convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE setCode = 'coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT name FROM cards WHERE setCode = 'Coldsnap' AND number = '4';	card_games
SELECT COUNT(T2.id)  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.convertedManaCost > 5 AND T1.setCode = 'Coldsnap' AND T2.power = 'Unknown'	card_games
SELECT text FROM foreign_data WHERE language = 'Italian' AND uuid = (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen')	card_games
SELECT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen')	card_games
SELECT type FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'German'	card_games
SELECT T1.text FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T2.setCode = T3.code WHERE T1.language = 'Italian' AND T3.name = 'Coldsnap'	card_games
SELECT name FROM cards WHERE setcode = 'coldsnap' ORDER BY convertedmanacost DESC LIMIT 1	card_games
SELECT T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Reminisce' ORDER BY T2.date DESC LIMIT 1	card_games
SELECT CAST(SUM(IIF(T2.convertedManaCost = 7, 1, 0)) AS REAL) / COUNT(T1.convertedManaCost) * 100 AS percentage FROM cards AS T1 INNER JOIN ( SELECT convertedManaCost FROM cards WHERE setCode = 'Coldsnap' ) AS T2 ON T1.convertedManaCost = T2.convertedManaCost	card_games
To solve this problem, we need to know the names of the incredibly powerful cards in the Coldsnap set and then count them out of the total number of cards in that set. Here is the SQL query that will provide the percentage of incredibly powerful cards:  ```sql SELECT (COUNT(CASE WHEN power IS NOT NULL THEN 1 END) * 100.0 / (SELECT COUNT(*) FROM cards WHERE setCode = 'CS2')) as '% of incredibly powerful cards in Coldsnap'; ```  In this SQL query, we use a subquery to count the total number of cards in the Coldsnap set and multiply by 100 to get the percentage. We use the `CASE` statement to count only cards with a power value, as it's not clear what constitutes an incredibly powerful card in this context.   Also, it's important to note that we are assuming that cards without a power value are not considered incredibly powerful. If that's not the case, you would need to modify the `CASE` statement accordingly.	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT code FROM sets WHERE code = 'PKHC'	card_games
SELECT T1.mcmId FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.code = 'SS2'	card_games
SELECT name FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT T2.type FROM sets AS T1 INNER JOIN cards AS T2 ON T2.setCode = T1.code WHERE T1.name = 'From the Vault: Lore'	card_games
SELECT T2.parentCode FROM sets AS T1 INNER JOIN sets AS T2 ON T1.parentCode = T2.code WHERE T1.name = 'Commander 2014 Oversized'	card_games
SELECT name FROM cards WHERE artist = 'Jim Pavelec'  SELECT t1.text FROM ruling AS t1 JOIN cards AS t2 ON t1.uuid = t2.uuid WHERE t2.artist = 'Jim Pavelec'  SELECT t1.isPromo FROM cards AS t1 WHERE t1.artist = 'Jim Pavelec'   SELECT t1.isReserved FROM cards AS t1 WHERE t1.artist = 'Jim Pavelec'  SELECT t1.isTextless FROM cards AS t1 WHERE t1.artist = 'Jim Pavelec'	card_games
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'	card_games
SELECT COUNT(T1.name) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Rinascita di Alara'	card_games
SELECT type FROM sets WHERE name = 'Huitième édition';	card_games
SELECT T3.name FROM sets AS T1 INNER JOIN cards AS T2 ON T2.setCode = T1.code INNER JOIN foreign_data AS T3 ON T3.uuid = T2.uuid WHERE T2.name LIKE '%Tendo Ice Bridge%' AND T3.language = 'fr'	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode = 'SALV'	card_games
SELECT sets.name FROM sets AS sets INNER JOIN cards AS cards ON sets.code = cards.setCode WHERE cards.name = 'Fellwar Stone' AND sets.language = 'Japanese'	card_games
SELECT name FROM cards WHERE setCode = 'JOUR' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT T3.releaseDate FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode INNER JOIN cards AS T3 ON T2.setCode = T3.setCode WHERE T1.name = "Ola de frío"	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN cards AS T2 ON T2.setCode = T1.code WHERE T2.name = 'Samite Pilgrim'	card_games
SELECT count(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.convertedManaCost = '3' AND T2.name = 'World Championship Decks 2004'	card_games
SELECT t2.translation FROM sets AS t1 INNER JOIN set_translations AS t2 ON t1.code = t2.setCode WHERE t1.name = 'Mirrodin' AND t2.language = 'zh'	card_games
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T2.setCode = T1.code AND T2.language = 'ja'	card_games
SELECT CAST(COUNT(T1.uuid) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'pt'	card_games
SELECT printings FROM cards WHERE TEXT IS NULL AND asciiName IS NOT NULL	card_games
SELECT MAX(T2.totalSetSize), T1.code FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode	card_games
SELECT t2.artist FROM cards AS t1 INNER JOIN foreign_data AS t2 ON t1.uuid = t2.uuid WHERE t1.variations IS NULL OR t1.variations = 'None' ORDER BY t2.convertedManaCost DESC LIMIT 1	card_games
SELECT count(T1.id), T2.frameEffects FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.hasFoil = 1 AND T2.type LIKE 'Permanent' GROUP BY T2.frameEffects ORDER BY count(T1.id) DESC LIMIT 1	card_games
SELECT COUNT(*) AS number_of_cards FROM cards WHERE power = '???' AND isFoilOnly = 0 AND isNonFoilOnly = 0 AND duelDeck = 'A';	card_games
SELECT T1.id FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.type = 'Commander' GROUP BY T1.code ORDER BY COUNT(T2.id) DESC LIMIT 1	card_games
SELECT COUNT(DISTINCT CASE WHEN t.uuid IS NOT NULL THEN t.uuid ELSE c.uuid END) FROM cards c LEFT JOIN rulings t ON c.uuid = t.uuid WHERE c.duelDeck IS NOT NULL AND c.convertedManaCost IS NOT NULL AND c.name IS NOT NULL ORDER BY c.convertedManaCost DESC LIMIT 10	card_games
SELECT T1.date, T1.text, T2.format  FROM rulings AS T1  INNER JOIN legalities AS T2 ON T2.uuid = T1.uuid  WHERE T2.format = 'Mythic Rewards'  ORDER BY T1.date ASC  LIMIT 1	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'french'	card_games
SELECT COUNT(T1.uuid)  FROM cards AS T1  JOIN legalities AS T2 ON T2.uuid = T1.uuid  WHERE T1.rarity = 'Rare' AND T1.type = 'Enchantment' AND T2.format = 'Legal' AND T1.playformatstatus = 'all'	card_games
SELECT T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'banned' GROUP BY T1.format ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT language FROM sets WHERE code = 'BBD'	card_games
SELECT f.language FROM foreign_data AS f JOIN cards AS c ON f.uuid = c.uuid GROUP BY f.language ORDER BY COUNT(c.id) ASC LIMIT 1	card_games
SELECT c.uuid FROM cards c INNER JOIN sets s ON c.setCode = s.code WHERE s.releaseDate > 1997 AND c.scryfallIllustrationId = 'd7f0a50a-dcd6-44cd-94a4-0b52cd0d0c8e' AND c.isStorySpotlight = 1 AND c.isOversized = 0 AND c.isPromo = 0 AND c.isReprint = 0 AND c.isReserved = 0 AND c.isStarter = 0 AND c.isTextless = 0 AND c.isTimeshifted = 0 AND c.isOnlineOnly = 0	card_games
SELECT name, format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE edhrec_rank = 1	card_games
SELECT T1.name FROM sets AS T1 INNER JOIN ( SELECT language, set_code FROM cards GROUP BY language, set_code ORDER BY count(*) DESC LIMIT 1 ) AS T2 ON T1.code = T2.set_code WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31'	card_games
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena';	card_games
SELECT t1.uuid FROM cards AS T1 INNER JOIN legalities AS T2 ON t1.uuid = t2.uuid WHERE T2.status = 'restricted' OR T2.status = 'banned'	card_games
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setcode = T2.setcode INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T1.artist = 'Matthew D. Wilson' AND T3.status = 'Limited'	card_games
SELECT T2.text, T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Andro, Dismemberer' AND T1.artist = 'Kev Walker' ORDER BY T2.date DESC	card_games
SELECT c.name, l.format FROM cards AS c INNER JOIN legalities AS l ON c.uuid = l.uuid WHERE c.setCode = 'HOU'	card_games
SELECT name FROM sets WHERE code NOT IN ( SELECT T1.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE language = 'japanese' ) AND code IN ( SELECT T1.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE language = 'korean' )	card_games
SELECT cardKingdomId FROM cards WHERE artist = 'Allen Williams'	card_games
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon'));	codebase_community
SELECT DISTINCT DisplayName FROM users WHERE YEAR(CreationDate) = 2014	codebase_community
SELECT COUNT(DISTINCT Id)  FROM users  WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.VoteTypeId = 2 AND T1.UpVotes > 100 AND T2.VoteTypeId = 1	codebase_community
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Views > 10 AND YEAR(T1.CreationDate) > 2013	codebase_community
SELECT COUNT(Posts1.Id) AS num_posts FROM posts AS Posts1  JOIN users AS Users1 ON Posts1.OwnerUserId = Users1.Id  WHERE Users1.DisplayName = 'csgillespie'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT OwnerUserId, MIN(CreationDate) as MinCreationDate FROM posts WHERE Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') ORDER BY Score DESC LIMIT 1	codebase_community
SELECT DISTINCT T2.OwnerDisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id ORDER BY T1.Score DESC LIMIT 1	codebase_community
SELECT SUM(T1.CommentCount) FROM posts AS T1 INNER JOIN users AS T2 ON T2.Id = T1.OwnerUserId WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(Id) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND PostTypeId = 1	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T2.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(T1.id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.owneruserid = T2.id WHERE T2.displayname = 'csgillespie' AND T1.parentid IS NULL	codebase_community
SELECT DISTINCT T3.DisplayName FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T1.VoteTypeId = 2 AND T2.Score >= 10	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T2.Id = T1.OwnerUserId WHERE T2.Reputation > 500	codebase_community
SELECT LOCATION FROM users INNER JOIN posts ON users.ID = posts.OwnerUserId WHERE TITLE = 'Eliciting priors from experts'	codebase_community
SELECT T1.Body FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.TagName = 'bayesian'	codebase_community
SELECT T2.Body FROM tags AS T1 JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id	codebase_community
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'csgillespie' AND YEAR(b.Date) = 2011;	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId GROUP BY T1.DisplayName ORDER BY COUNT(*) DESC LIMIT 1	codebase_community
SELECT AVG(Score)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT AVG(T1.badges_count) FROM ( SELECT T3.UserId, COUNT(T2.Id) AS badges_count FROM badges AS T2 INNER JOIN users AS T3 ON T2.UserId = T3.Id WHERE T3.Views > 200 GROUP BY T3.UserId ) AS T1	codebase_community
SELECT CAST(COUNT(CASE WHEN posts.OwnerUserId IS NOT NULL THEN 1 END) AS REAL) * 100 / COUNT(*) FROM posts WHERE posts.Score > 20	codebase_community
SELECT SUM(T2.BountyAmount) FROM votes AS T2 INNER JOIN posts AS T3 ON T2.PostId = T3.Id WHERE T3.UserId = 58 AND YEAR(T2.CreationDate) = 2010 AND MONTH(T2.CreationDate) = 7 AND DAY(T2.CreationDate) = 19	codebase_community
SELECT T2.CreationDate FROM Votes AS T1 INNER JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T1.VoteTypeId = 2 ORDER BY T1.PostId DESC LIMIT 1	codebase_community
SELECT COUNT(T1.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Revival'	codebase_community
SELECT t3.Title FROM comments AS t1 INNER JOIN posts AS t3 ON t1.PostId = t3.Id WHERE t1.Score = ( SELECT max(Score) FROM comments )	codebase_community
SELECT COUNT(comments.Id) AS num_comments FROM posts INNER JOIN comments ON posts.Id = comments.PostId WHERE posts.ViewCount = 1910	codebase_community
SELECT T1.favoriteCount FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.userId = 3025 AND T2.creationDate = '2014-04-23 20:29:39'	codebase_community
SELECT T3.Text FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id INNER JOIN comments AS T3 ON T1.PostId = T3.PostId WHERE T1.ParentId = 107829 ORDER BY T3.Id LIMIT 1	codebase_community
SELECT COUNT(1) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.CreationDate = '2013-07-12 09:08:18' AND T1.UserId = 23853	codebase_community
SELECT reputation FROM users WHERE id = (SELECT owneruserid FROM posts WHERE id = 65041);	codebase_community
SELECT COUNT(Id) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini'	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347	codebase_community
SELECT COUNT(*)  FROM votes  JOIN posts ON votes.PostId = posts.Id  WHERE posts.Body LIKE '%data visualization%'	codebase_community
SELECT b.Name FROM badges AS b  JOIN users AS u ON b.UserId = u.Id  WHERE u.DisplayName = "DatEpicCoderGuyWhoPrograms"	codebase_community
SELECT COUNT(T2.PostId) / COUNT(T3.UserId) FROM votes AS T3 RIGHT JOIN posts AS T2 ON T3.UserId = T2.OwnerUserId WHERE T2.OwnerUserId = 24	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T2.VoteTypeId = 2 AND T2.Score = 17	codebase_community
SELECT Id  FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'SilentGhost'	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'thank you user93!'	codebase_community
SELECT T2.Id, T2.UserDisplayName FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'A Lion.'	codebase_community
SELECT T2.DisplayName, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Id  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT T1.LastEditorDisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT T4.Title FROM postHistory AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T4 ON T1.PostId = T4.Id WHERE T2.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl  FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.LastEditorDisplayName = 'Yevgeny'	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation'	codebase_community
SELECT SUM(v.BountyAmount) FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data%'	codebase_community
SELECT p.OwnerDisplayName FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.VoteTypeId = 3 AND v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, c.Text, c.Score FROM posts p JOIN posts_tags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id JOIN comments c ON p.Id = c.PostId WHERE t.TagName = 'humor' AND c.Score IS NOT NULL ORDER BY p.Id, c.Id	codebase_community
SELECT COUNT(Text) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT T2.userId FROM posts AS T1 INNER JOIN users AS T2 ON T1.owneruserid = T2.id ORDER BY T1.ViewCount ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT T1.UserId) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Supporter' AND YEAR(T2.Date) = 2011	codebase_community
SELECT COUNT(T.UserId) FROM ( SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(UserId) > 5 ) AS T	codebase_community
SELECT COUNT(DISTINCT T3.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId INNER JOIN posts AS T3 ON T2.UserId = T3.OwnerUserId WHERE T3.Tags LIKE '%<Teacher>%' AND T2.Name = 'Supporter' AND T1.Location = 'New York'	codebase_community
SELECT T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 1	codebase_community
SELECT T1.OwnerUserId, T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount >= 1000 AND T1.Id NOT IN (SELECT PostId FROM postHistory GROUP BY PostId HAVING COUNT(Id) > 1)	codebase_community
SELECT u.Id AS UserId, u.DisplayName AS UserDisplayName, MAX(b.Name) AS MostBadge FROM users u JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN badges b ON u.Id = b.UserId LEFT JOIN (     SELECT PostId, COUNT(*) AS CommentCount     FROM comments     GROUP BY PostId     ORDER BY CommentCount DESC ) c ON p.Id = c.PostId WHERE c.CommentCount = (     SELECT MAX(c2.CommentCount)     FROM comments c2 ) GROUP BY u.Id, u.DisplayName ORDER BY u.Id;	codebase_community
SELECT COUNT(users.Id) FROM users AS users INNER JOIN badges AS badges ON users.Id = badges.UserId WHERE badges.Name = 'Teacher' AND users.Location = 'India'	codebase_community
Sure, let's break down the question step by step to write the SQL query.  Step 1: Calculate the total number of badges given during 2010. SELECT COUNT(*) as total_badges_2010 FROM badges WHERE YEAR(Date) = 2010;  Step 2: Calculate the total number of badges given during 2011. SELECT COUNT(*) as total_badges_2011 FROM badges WHERE YEAR(Date) = 2011;  Step 3: Calculate the percentage difference between the total number of badges given during 2010 and 2011. SELECT ((total_badges_2011 - total_badges_2010) / total_badges_2010) * 100 as percentage_difference FROM (     SELECT COUNT(*) as total_badges_2010     FROM badges     WHERE YEAR(Date) = 2010 ) AS t1, (     SELECT COUNT(*) as total_badges_2011     FROM badges     WHERE YEAR(Date) = 2011 ) AS t2;  The final SQL query will be: ``` SELECT      ((total_badges_2011 - total_badges_2010) / total_badges_2010) * 100 as percentage_difference FROM      (SELECT COUNT(*) as total_badges_2010 FROM badges WHERE YEAR(Date) = 2010) t1,     (SELECT COUNT(*) as total_badges_2011 FROM badges WHERE YEAR(Date) = 2011) t2; ```	codebase_community
SELECT COUNT(DISTINCT UserId) FROM comments WHERE PostId = 3720	codebase_community
SELECT COUNT(DISTINCT T3.Id) FROM postLinks AS T1 INNER JOIN posts AS T3 ON T3.Id = T1.RelatedPostId WHERE T1.PostId = 61217	codebase_community
SELECT T1.Score, T3.LinkTypeId FROM postHistory AS T1 INNER JOIN postLinks AS T3 ON T1.PostId = T3.PostId WHERE T3.PostId = 395	codebase_community
SELECT p.Id, u.Id FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Score > 60	codebase_community
SELECT SUM(FavoriteCount) FROM votes WHERE UserId = 686 AND YEAR(CreationDate) = 2011	codebase_community
SELECT AVG(votes.voteTypeId) ,  AVG(users.age) FROM posts AS posts LEFT JOIN users AS users ON posts.owneruserid = users.id WHERE (SELECT COUNT(*) FROM posts AS posts WHERE posts.owneruserid = users.id) > 10	codebase_community
SELECT COUNT(DISTINCT T3.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN badges AS T3 ON T1.Id = T3.Id WHERE T1.Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 0	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47'	codebase_community
SELECT COUNT(T1.Id)  FROM posts AS T1  WHERE T1.Score = 10	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users))	codebase_community
SELECT T3.Reputation FROM badges AS T1 INNER JOIN posts AS T2 ON T1.UserId = T2.OwnerUserId INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Name = 'Electorate' AND T2.CreationDate = '2010-07-19 19:39:08'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre'	codebase_community
SELECT DISTINCT T1.Date  FROM badges AS T1  INNER JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T2.Location = 'Rochester, NY'	codebase_community
SELECT CAST(SUM(IIF(b.Name = 'Teacher', 1, 0)) AS REAL) * 100 / COUNT(DISTINCT u.Id) FROM users u LEFT JOIN badges b ON u.Id = b.UserId	codebase_community
SELECT CAST(COUNT(CASE WHEN DATE_PART('year', AGE(u.CreationDate)) BETWEEN 13 AND 19 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'	codebase_community
SELECT Comment  FROM comments AS T1  JOIN posts AS T2 ON T1.PostId = T2.Id  WHERE T2.CreaionDate = '2010-07-19 19:19:56.000'	codebase_community
SELECT TEXT FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CreationDate = '2010-07-19 19:37:33')	codebase_community
SELECT T3.Age FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id INNER JOIN badges AS T4 ON T3.Id = T4.UserId WHERE T3.Location = 'Vienna, Austria' AND T1.TagName = 'badges'	codebase_community
SELECT COUNT(T2.UserId)  FROM badges AS T1  INNER JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T1.Name = 'Supporter' AND T2.Age >= 18	codebase_community
SELECT T2.Views FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-7-19 19:39:08'	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id ORDER BY T2.Reputation ASC LIMIT 1	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = "Sharpie";	codebase_community
SELECT COUNT(DISTINCT T2.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Supporter'	codebase_community
SELECT Name FROM users WHERE Id = 30	codebase_community
SELECT COUNT(DISTINCT U.Id) FROM users U WHERE U.Location LIKE '%New York%'	codebase_community
SELECT COUNT(votes.Id) FROM votes	codebase_community
SELECT COUNT(Id) FROM users WHERE Age >= 18	codebase_community
SELECT Id, Views FROM posts ORDER BY Views DESC LIMIT 10	codebase_community
SELECT      COUNT(CASE WHEN YEAR(v.CreationDate) = 2010 THEN v.PostId ELSE NULL END) /     COUNT(CASE WHEN YEAR(v.CreationDate) = 2011 THEN v.PostId ELSE NULL END) AS voteRatio FROM      votes v	codebase_community
SELECT T.Name FROM tags AS T INNER JOIN posts AS P ON T.Id = P.Id INNER JOIN users AS U ON P.OwnerUserId = U.Id WHERE U.DisplayName = 'John Stauffer'	codebase_community
SELECT COUNT(Id) FROM posts WHERE OwnerDisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(T1.Id) AS count FROM votes AS T1  INNER JOIN users AS T2 ON T2.Id = T1.UserId  WHERE T2.DisplayName = 'Harlan'	codebase_community
SELECT T2.postid FROM users AS T1 INNER JOIN votes AS T2 ON T1.id = T2.userid INNER JOIN posts AS T3 ON T2.postid = T3.id WHERE T1.displayname = 'slashnick' ORDER BY T3.answercount DESC LIMIT 1	codebase_community
SELECT p1.Id FROM posts p1 INNER JOIN users u1 ON p1.OwnerUserId = u1.Id INNER JOIN votes v ON p1.Id = v.PostId INNER JOIN postLinks pl ON p1.Id = pl.PostId WHERE u1.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p1.Id ORDER BY SUM(v.Score) DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT p.Id) FROM posts p INNER JOIN votes v ON p.Id = v.PostId INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND v.VoteTypeId = 2 AND u.DisplayName IS NOT NULL	codebase_community
SELECT COUNT(T1.Id) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T3.DisplayName = 'Neil McGuigan' AND T1.Score < 0	codebase_community
SELECT t.TagName  FROM tags t  JOIN posts p ON t.Id = p.Tags  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'	codebase_community
SELECT CAST(COUNT(CASE WHEN T.TagName = 'r' THEN T.PostId ELSE NULL END) AS FLOAT) * 100 / COUNT(T1.Id) AS Percentage FROM posts AS T1 INNER JOIN tags AS T ON T1.Id = T.PostId	codebase_community
Calculate the difference in view count from posts posted by Mornington and view count from posts posted by Amos.	codebase_community
SELECT COUNT(DISTINCT T1.UserId)  FROM users AS T1  JOIN badges AS T2 ON T1.Id = T2.UserId  WHERE T2.Name = 'Commentator' AND YEAR(T2.Date) = 2014	codebase_community
SELECT COUNT(DISTINCT PostId) FROM postHistory WHERE CreationDate LIKE '2010-07-21%'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT T2.LastEditDate, T2.LastEditorUserId FROM posts AS T1 INNER JOIN postHistory AS T2 ON T2.PostId = T1.Id WHERE T1.Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(DISTINCT T1.Id) FROM comments AS T1 INNER JOIN users AS T2 ON T2.Id = T1.UserId WHERE T2.Id = 13 AND T1.Score < 0	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 0	codebase_community
SELECT T2.name FROM users AS T1 INNER JOIN badges AS T2 ON T1.id = T2.userid WHERE T1.location = 'North Pole' AND T2.date LIKE '2011%'	codebase_community
SELECT T2.DisplayName, T2.WebsiteUrl FROM users AS T2 INNER JOIN posts AS T3 ON T2.Id = T3.OwnerUserId WHERE T3.FavoriteCount > 150	codebase_community
SELECT COUNT(PostHistoryId) AS history_counts, p.LastEditDate AS last_edit_date FROM posts AS p WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT T1.LastAccessDate, T1.Location FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Outstanding User' ORDER BY T2.Date DESC LIMIT 1	codebase_community
SELECT T1.title FROM posts AS T1 INNER JOIN post_links AS T2 ON T2.PostId = T1.Id WHERE T1.title = 'How to tell if something happened in a data set which monitors a value over time'	codebase_community
SELECT p.Id, b.Name  FROM badges AS b  JOIN users AS u ON b.UserId = u.Id  JOIN postHistory AS ph ON u.Id = ph.UserId  JOIN posts AS p ON ph.PostId = p.Id  WHERE u.DisplayName = 'Samuel' AND YEAR(ph.CreationDate) = 2013	codebase_community
SELECT T3.OwnerDisplayName FROM post_link AS T1 JOIN posts AS T2 ON T1.post_id = T2.id JOIN users AS T3 ON T2.owner_user_id = T3.id WHERE T1.link_type_id = 3 GROUP BY T3.owner_display_name ORDER BY COUNT(*) DESC LIMIT 1	codebase_community
SELECT T.DisplayName FROM users AS T INNER JOIN tags AS T1 ON T.Id = T1.ExcerptPostId INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'hypothesis-testing'	codebase_community
SELECT postLinks.LinkTypeId, postLinks.RelatedPostId  FROM postLinks  JOIN posts ON posts.Id = postLinks.PostId  WHERE posts.Title = 'What are principal component scores?'	codebase_community
SELECT t1.ParentId, t2.DisplayName FROM posts AS t1 INNER JOIN users AS t2 ON t1.OwnerUserId = t2.Id ORDER BY t1.Score DESC LIMIT 1	codebase_community
SELECT T3.DisplayName, T3.WebsiteUrl FROM votes AS T1  JOIN users AS T3 ON T3.Id = T1.UserId  WHERE T1.VoteTypeId = 8  ORDER BY T1.BountyAmount DESC LIMIT 1	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN Votes AS T2 ON T1.Id = T2.PostId WHERE T2.VoteTypeId = 2 GROUP BY T2.VoteTypeId HAVING COUNT(*) >= 5 ORDER BY COUNT(*) DESC LIMIT 5	codebase_community
SELECT COUNT(DISTINCT T1.TagName) FROM tags AS T1 INNER JOIN posts AS T2 ON T2.Id = T1.ExcerptPostId WHERE T2.PostTypeId = 1 AND T2.Score >= 0 AND T2.AnswerCount BETWEEN 5000 AND 7000	codebase_community
SELECT T3.OwnerUserId FROM Posts AS T1 INNER JOIN Users AS T2 ON T1.OwnerUserId = T2.Id INNER JOIN Votes AS T3 ON T1.Id = T3.PostId WHERE T3.VoteTypeId = 2 ORDER BY T1.Score DESC LIMIT 1	codebase_community
SELECT DATE_PART('year', AGE(u.LastAccessDate, u.CreationDate)) AS age FROM users u ORDER BY age DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN votes ON posts.Id = votes.PostId WHERE YEAR(votes.CreationDate) = 2011 AND votes.BountyAmount = 50	codebase_community
SELECT Id FROM users WHERE CreationDate = (SELECT MIN(CreationDate) FROM users)	codebase_community
SELECT T2.score FROM tags AS T1 INNER JOIN posts AS T2 ON T2.id = T1.excerptpostid ORDER BY T1.count DESC LIMIT 1	codebase_community
SELECT AVG(COUNT(T1.PostId)) FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE YEAR(T2.CreationDate) = 2010 AND T1.AnswerCount <= 2	codebase_community
SELECT T4.id FROM postHistory AS T1 INNER JOIN votes AS T2 ON T1.PostId = T2.PostId INNER JOIN users AS T3 ON T2.UserId = T3.Id INNER JOIN posts AS T4 ON T1.PostId = T4.Id WHERE T3.Id = 1465 ORDER BY T2.voteTypeId DESC LIMIT 1	codebase_community
SELECT Title  FROM posts  WHERE Id =  (SELECT MAX(PostId)  FROM postLinks  WHERE PostId = Id AND CreationDate IS NOT NULL)	codebase_community
SELECT t3.DisplayName FROM badges AS t1 JOIN users AS t3 ON t1.UserId = t3.Id GROUP BY t1.UserId ORDER BY COUNT(t1.Id) DESC LIMIT 1	codebase_community
SELECT T.min_vote_date FROM ( SELECT MIN(CreationDate) AS min_vote_date FROM votes AS T1 INNER JOIN users AS T2 ON T2.Id = T1.UserId WHERE T2.DisplayName = 'chl' ) T	codebase_community
SELECT MIN(t1.CreationDate) FROM posts AS t1 ORDER BY t1.UserId ASC LIMIT 1	codebase_community
SELECT users.DisplayName  FROM users  JOIN badges ON users.Id = badges.UserId  WHERE badges.Name = 'Autobiographer'  ORDER BY badges.Date  LIMIT 1	codebase_community
SELECT COUNT(DISTINCT T2.Id)  FROM users AS T1  JOIN posts AS T2 ON T1.Id = T2.OwnerUserId  WHERE T1.Location = 'United Kingdom'  AND T2.FavoriteCount >= 4	codebase_community
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT Id                FROM users                WHERE Age IS NOT NULL)	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId ORDER BY T2.Score DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT UserId) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DISTINCT T1.DisplayName FROM users AS T1 WHERE T1.Age IS NOT NULL	codebase_community
SELECT COUNT(T1.Id) AS posts FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Jay Stevens' AND T1.CreaionDate BETWEEN '2010-01-01' AND '2010-12-31'	codebase_community
SELECT T.PostId, T1.Title FROM ( SELECT PostId, MAX(ViewCount) as max FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' GROUP BY PostId ) as T JOIN posts AS T1 ON T1.Id = T.PostId	codebase_community
SELECT TOP 1 posts.Id, posts.Title  FROM posts  ORDER BY posts.Score DESC	codebase_community
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner'	codebase_community
SELECT DISTINCT T4.DisplayName FROM posts AS T1 LEFT JOIN users AS T4 ON T1.OwnerUserId = T4.Id WHERE T1.ViewCount > 20000 AND strftime('%Y', T1.CreaionDate) = '2011'	codebase_community
SELECT p.Id, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010  ORDER BY p.Score DESC  LIMIT 1	codebase_community
SELECT CAST(COUNT(CASE WHEN T1.Reputation > 1000 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.Id) AS value FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE YEAR(T2.CreationDate) = 2011	codebase_community
SELECT      COUNT(T1.Id) AS teens,      (COUNT(T1.Id) * 100.0 / (SELECT COUNT(Id) FROM users WHERE Age BETWEEN 13 AND 19)) AS percentage  FROM      users T1  WHERE      T1.Age BETWEEN 13 AND 19	codebase_community
SELECT T1.Views, T2.LastEditorDisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Computer Game Datasets'	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)	codebase_community
SELECT COUNT(T1.Id)  FROM comments AS T1  JOIN posts AS T2 ON T1.PostId = T2.Id  WHERE T2.Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT COUNT(DISTINCT T1.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount > 35000 AND T2.UserId != T1.OwnerUserId	codebase_community
SELECT DISTINCT T1.DisplayName, T1.Location FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T2.Id = 183	codebase_community
SELECT users.Id FROM users JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'Emmett' ORDER BY badges.Date DESC LIMIT 1	codebase_community
SELECT COUNT(T3.Id) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T2.Id = T3.OwnerUserId WHERE T1.VoteTypeId = 2 AND T1.BountyAmount > 5000	codebase_community
SELECT T2.CreationDate FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Zolomon'	codebase_community
SELECT COUNT(posts.Id) AS PostsLeft, COUNT(comments.Id) AS CommentsLeft FROM users LEFT JOIN posts ON users.Id = posts.OwnerUserId LEFT JOIN comments ON users.Id = comments.UserId WHERE users.Id = (SELECT UserId FROM posts ORDER BY CreationDate DESC LIMIT 1)	codebase_community
SELECT c.Text, u.DisplayName  FROM comments c  JOIN posts p ON c.PostId = p.Id  JOIN users u ON c.UserId = u.Id  WHERE p.Title = 'Analysing wind data with R'  ORDER BY c.CreationDate DESC  LIMIT 1	codebase_community
SELECT COUNT(T2.UserId) AS UserAwarded  FROM badges AS T1  INNER JOIN users AS T2 ON T1.UserId = T2.Id  WHERE T1.Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(T2.Id) FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.PostId WHERE T2.TagName = 'careers'	codebase_community
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(T1.Id) ,  COUNT(T3.Id) FROM posts AS T1 LEFT JOIN comments AS T3 ON T1.Id = T3.PostId LEFT JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Clustering 1D data'	codebase_community
SELECT T1.CreationDate FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(Id) FROM posts WHERE BountyAmount > 30	codebase_community
SELECT TOP 1 CAST(COUNT(CASE WHEN T1.Score > 50 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(1) AS pct_above_50 FROM Posts AS T1 INNER JOIN (SELECT TOP 1 UserId FROM posts GROUP BY UserId ORDER BY COUNT(UserId) DESC) AS T2 ON T1.OwnerUserId = T2.UserId	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(T1.TagName) FROM tags AS T1 INNER JOIN posts AS T2 ON T2.Tags LIKE CONCAT('%', T1.TagName, '%') WHERE T2.PostTypeId = 1 AND T1.Id BETWEEN 1 AND 14 AND T1.Count < 20 GROUP BY T1.TagName	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT reputation, Upvotes FROM users WHERE DisplayName = 'fine, you win :)'	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%linear regression%'	codebase_community
SELECT Posts.Title, Comments.Text FROM posts as Posts INNER JOIN comments as Comments ON Posts.Id = Comments.PostId WHERE Posts.ViewCount BETWEEN 100 AND 150 AND Comments.Score = (SELECT MAX(Comments.Score) FROM comments as Comments INNER JOIN posts as Posts ON Comments.PostId = Posts.Id WHERE Posts.ViewCount BETWEEN 100 AND 150)	codebase_community
SELECT C.CreationDate AS CommentCreationDate, U.Age AS UserAge FROM comments C JOIN users U ON C.UserId = U.Id WHERE C.WebsiteUrl IS NOT NULL	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount < 5 AND T2.Score = 0	codebase_community
SELECT COUNT(*) FROM ( SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.CommentCount = 1 AND T1.Score = 0 )	codebase_community
SELECT COUNT(users.Id) AS total_users FROM users INNER JOIN comments ON users.Id = comments.UserId WHERE comments.PostId IN ( SELECT comments.PostId FROM comments WHERE comments.Score = 0 ) AND users.Age = 40	codebase_community
SELECT T3.PostId, T2.Text  FROM posts AS T1  JOIN comments AS T2 ON T1.Id = T2.PostId  JOIN postHistory AS T3 ON T1.Id = T3.PostId  WHERE T1.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT COUNT(T1.UpVotes) FROM votes AS T1 INNER JOIN comments AS T2 ON T1.UserId = T2.UserId WHERE T2.Text = 'R is also lazy evaluated'	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score BETWEEN 1 AND 5 AND T2.UserId = T3.Id AND T3.DownVotes = 0	codebase_community
SELECT CAST(SUM(IIF(T1.Score BETWEEN 5 AND 10 AND T2.UpVotes = 0, 1, 0)) AS REAL) * 100.0 / COUNT(T1.Id) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id	codebase_community
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(T3.hero_id) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T1.power_name = 'Super Strength'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength' AND T1.height_cm > 200	superhero
SELECT T2.full_name FROM hero_power AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id GROUP BY T2.full_name HAVING COUNT(T1.power_id) > 15	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue')	superhero
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T3 ON T1.skin_colour_id = T3.id INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(T2.hero_id) AS Count  FROM colour AS T1  INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id  INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id  INNER JOIN superpower AS T4 ON T3.power_id = T4.id  WHERE T1.colour = 'blue' AND T4.power_name = 'Agility'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'blue' AND T3.colour = 'blond'	superhero
SELECT COUNT(T2.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT T2.full_name FROM superhero AS T2 INNER JOIN publisher AS T1 ON T2.publisher_id = T1.id ORDER BY T2.height_cm DESC LIMIT 1	superhero
SELECT publisher_name FROM publisher WHERE id = (SELECT publisher_id FROM superhero WHERE superhero_name = 'Sauron')	superhero
SELECT COUNT(T2.id) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics' AND T2.eye_colour_id = (SELECT id FROM colour WHERE colour = 'blue')	superhero
SELECT AVG(T3.height_cm) FROM superhero AS T3 INNER JOIN publisher AS T4 ON T3.publisher_id = T4.id WHERE T4.publisher_name = 'Marvel Comics'	superhero
SELECT CAST(COUNT(T1.id) AS REAL) * 100 / COUNT(T3.id) FROM superhero AS T1 INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id INNER JOIN hero_power AS T4 ON T4.hero_id = T1.id INNER JOIN superpower AS T5 ON T4.power_id = T5.id WHERE T1.publisher_name = 'Marvel Comics' AND T5.power_name = 'Super Strength'	superhero
SELECT COUNT(T3.id) FROM publisher AS T1 INNER JOIN superhero AS T3 ON T1.id = T3.publisher_id WHERE T1.publisher_name = 'DC Comics'	superhero
SELECT p.publisher_name FROM publisher p INNER JOIN superhero s ON p.id = s.publisher_id ORDER BY s.height_cm DESC LIMIT 1	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T2.publisher_name = 'Marvel Comics' AND T3.colour = 'gold'	superhero
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blonde'	superhero
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.alignment_id = 1 ORDER BY T1.attribute_value ASC LIMIT 1	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'	superhero
SELECT COUNT(T2.id) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'durability' AND T2.attribute_value < 50	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'strength') AND attribute_value = 100 AND hero_id IN (SELECT id FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female'))	superhero
SELECT T3.superhero_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id ORDER BY COUNT(T2.id) DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') AND race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
1. Count total number of superheroes. SELECT COUNT(*) FROM superhero;  2. Count number of superheroes who act in their own self-interest or make decisions based on their own moral code. SELECT COUNT(*) FROM superhero WHERE alignment_id = 1;  3. Calculate percentage of superheroes with the above criteria. SELECT CAST((SELECT COUNT(*) FROM superhero WHERE alignment_id = 1) AS REAL) * 100 / COUNT(*) FROM superhero;  4. Count number of said superheroes published by Marvel Comics. SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND publisher_id = 1;  So, the SQL query would be:  ```sql WITH total_superheroes AS (   SELECT COUNT(*) AS total FROM superhero ), self_interest_superheroes AS (   SELECT COUNT(*) AS count FROM superhero   WHERE alignment_id = 1 ), marvel_superheroes AS (   SELECT COUNT(*) AS count FROM superhero   WHERE alignment_id = 1 AND publisher_id = 1 ) SELECT   CAST(self_interest_superheroes.count AS REAL) * 100 / total_superheroes.total AS percentage,   marvel_superheroes.count AS marvel_count FROM   total_superheroes,   self_interest_superheroes,   marvel_superheroes; ```  This SQL query calculates the percentage of superheroes who act in their own self-interest or make decisions based on their own moral code and also counts the number of those said superheroes published by Marvel Comics.	superhero
SELECT publisher.publisher_name  FROM publisher  WHERE publisher.id IN (     SELECT superhero.publisher_id      FROM superhero      GROUP BY superhero.publisher_id      HAVING COUNT(superhero.id) > (         SELECT COUNT(superhero.id)          FROM superhero          WHERE superhero.publisher_id IS NULL     ) )	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(T1.attribute_value) FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T2.eye_colour_id = T1.id WHERE T2.id = 75	superhero
SELECT T1.superhero_name, T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN gender AS T2 ON T2.id = T1.gender_id WHERE T2.gender = 'Female'	superhero
SELECT DISTINCT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.gender_id = (SELECT id FROM gender WHERE gender = 'Male') ORDER BY T3.power_name ASC LIMIT 5	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'alien'	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IS NULL	superhero
SELECT T3.superpower_name FROM hero_power AS T1  INNER JOIN power AS T3 ON T1.power_id = T3.id  WHERE T1.hero_id = 56	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'strength' AND T2.attribute_value >= 70 ORDER BY T1.full_name	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'bad')	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T2.id = T1.race_id WHERE T1.weight_kg = 169	superhero
SELECT T3.hair_colour FROM superhero AS T1 INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185	superhero
SELECT T2.colour  FROM superhero AS T1  INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id  ORDER BY T1.height_cm DESC  LIMIT 1	superhero
SELECT CAST(COUNT(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero WHERE height_cm BETWEEN 150 AND 180	superhero
SELECT superhero.full_name  FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Male' AND superhero.weight_kg > (   SELECT AVG(superhero.weight_kg) * 0.79   FROM superhero )	superhero
SELECT T2.power_name  FROM hero_power AS T1  JOIN superpower AS T2 ON T1.power_id = T2.id  GROUP BY T2.power_name  ORDER BY COUNT(*) DESC  LIMIT 1;	superhero
SELECT hero_attribute.attribute_value FROM hero_attribute INNER JOIN hero_attribute ON hero_attribute.hero_id = superhero.id WHERE superhero_name = 'Abomination'	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1	superhero
SELECT COUNT(DISTINCT T1.id) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'stealth'	superhero
SELECT T3.full_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id ORDER BY T1.attribute_value DESC LIMIT 1	superhero
SELECT AVG(height_cm) FROM superhero WHERE skin_colour_id IS NULL	superhero
SELECT COUNT(id) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');	superhero
WITH hero_stats AS (     SELECT          s.id AS hero_id,         s.superhero_name,         s.alignment_id,         a.id AS attribute_id,         a.attribute_name,         ha.attribute_value,         a.attribute_name = 'Durability' AS is_durability     FROM          superhero s     JOIN          hero_attribute ha ON s.id = ha.hero_id     JOIN          attribute a ON ha.attribute_id = a.id     WHERE          s.publisher_name = 'Dark Horse Comics' )  SELECT      hero_id,     MAX(attribute_value) AS max_durability FROM      hero_stats WHERE      is_durability = TRUE GROUP BY      hero_id ORDER BY      max_durability DESC LIMIT 1;	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abraham Sapien'	superhero
SELECT DISTINCT superhero_name  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  WHERE power_name = 'Flight'	superhero
SELECT T2.eye_colour, T2.hair_colour, T2.skin_colour FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Dark Horse Comics' AND T2.gender_id = ( SELECT id FROM gender WHERE gender = 'Female' )	superhero
SELECT superhero_name, T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN superhero AS T3 ON T1.eye_colour_id = T3.eye_colour_id INNER JOIN superhero AS T4 ON T1.hair_colour_id = T4.hair_colour_id INNER JOIN superhero AS T5 ON T1.skin_colour_id = T5.skin_colour_id WHERE T1.eye_colour_id = T3.eye_colour_id AND T1.hair_colour_id = T4.hair_colour_id AND T1.skin_colour_id = T5.skin_colour_id AND T1.id != T3.id AND T1.id != T4.id AND T1.id != T5.id	superhero
SELECT T2.superhero_name, T1.alignment FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T2.full_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 1 AND hair_colour_id = 4 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(T1.id) * 100 AS percentage_of_blue_female FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id	superhero
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT T3.gender FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN gender AS T3 ON T3.id = T2.gender_id WHERE T2.superhero_name = 'Agent 13'	superhero
SELECT T4.superhero_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN hero_superpower AS T3 ON T1.hero_id = T3.hero_id INNER JOIN superhero AS T4 ON T3.hero_id = T4.id WHERE T2.attribute_name = 'adaptation'	superhero
SELECT COUNT(DISTINCT T2.power_id) FROM hero_power AS T1 INNER JOIN hero_power AS T2 ON T1.hero_id = T2.hero_id WHERE T1.power_id = T2.power_id	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id IN (SELECT T3.id FROM superhero AS T3 INNER JOIN gender AS T4 ON T3.gender_id = T4.id WHERE T4.gender LIKE 'Male')	superhero
SELECT T4.height_cm FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T4 ON T2.hero_id = T4.id INNER JOIN colour AS T5 ON T4.eye_colour_id = T5.id WHERE T5.colour = 'Amber'	superhero
SELECT T2.full_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T2.eye_colour_id = 1 AND T2.hair_colour_id = 1	superhero
SELECT c.colour FROM colour AS c WHERE c.id = 4 AND c.colour = 'Gold'	superhero
SELECT full_name FROM superhero AS s WHERE race_id = ( SELECT id FROM race WHERE race = 'Vampire' )	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_attribute WHERE attribute_id = ( SELECT T.attribute_id FROM ( SELECT T1.attribute_id FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T2.attribute_name = 'strength' AND T1.attribute_value = ( SELECT MAX(T3.attribute_value) FROM hero_attribute AS T3 INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'strength' ) ) T GROUP BY T.attribute_id )	superhero
SELECT T1.race_id, T1.alignment_id FROM superhero AS T1 WHERE T1.full_name = 'Cameron Hicks'	superhero
SELECT COUNT(*) AS "Total female heroes",         (COUNT(CASE WHEN T1.gender_id = 2 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS "Percentage of female heroes" FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT T1.weight_kg - T2.weight_kg FROM superhero AS T1 INNER JOIN superhero AS T2 ON T1.superhero_name = 'Emil Blonsky' AND T2.superhero_name = 'Charles Chandler'	superhero
SELECT hero_id, AVG(height_cm)  FROM superhero  GROUP BY hero_id	superhero
SELECT T1.superpower_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T3.id = T2.hero_id WHERE T3.superhero_name = 'Abomination'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'god/eternal' AND T1.gender_id = 1	superhero
SELECT T.superhero_name FROM ( SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Good' ) AS T ORDER BY T.superhero_name DESC	superhero
SELECT COUNT(id) FROM superhero WHERE alignment_id = ( SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT T4.attribute_name, T4.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T4 ON T4.id = T2.attribute_id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'blue' AND T3.colour = 'brown'	superhero
SELECT publisher_name FROM publisher WHERE id = (SELECT publisher_id FROM superhero WHERE superhero_name = 'Hawkman') OR (SELECT publisher_id FROM superhero WHERE superhero_name = 'Karate Kid') OR (SELECT publisher_id FROM superhero WHERE superhero_name = 'Speedy')	superhero
SELECT COUNT(id) AS total_superheroes FROM superhero WHERE publisher_id IS NULL	superhero
SELECT CAST(SUM(IIF(T2.colour = 'blue', 1, 0)) AS REAL) * 100 / COUNT(*) AS percentage FROM superhero AS T1 LEFT JOIN colour AS T2 ON T2.id = T1.eye_colour_id	superhero
SELECT COUNT(T2.gender_id) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male'	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.id = 294	superhero
SELECT T1.full_name FROM superhero AS T1 WHERE T1.weight_kg IS NULL	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T2.eye_colour_id = T1.id WHERE T2.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Helen Parr'	superhero
SELECT race_id FROM superhero WHERE weight_kg = 108 AND height_cm = 188	superhero
SELECT publisher_name FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.id = 38	superhero
SELECT T4.race FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN race AS T4 ON T2.race_id = T4.id ORDER BY T1.attribute_value DESC LIMIT 1	superhero
SELECT T2.alignment, T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Atom IV'	superhero
SELECT full_name FROM superhero WHERE eye_colour_id = 1 LIMIT 5	superhero
SELECT avg(attribute_value) FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral'))	superhero
SELECT T2.id , T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_value = 100	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female' AND T1.alignment_id = 1	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE ha.attribute_value >= 75 AND ha.attribute_value <= 80	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.gender_id = 1 AND T1.hair_colour_id = 1	superhero
SELECT AVG(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id	superhero
SELECT COUNT(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE NULL END) - COUNT(CASE WHEN T1.eye_colour_id IS NULL THEN 1 ELSE NULL END) AS difference FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg IS NULL	superhero
SELECT height_cm FROM superhero WHERE superhero_name = 'Hulk'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T3.id = T2.power_name WHERE T1.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Green' AND T1.alignment_id = 1	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT superhero_name FROM superhero AS superhero_1 WHERE superhero_id IN (SELECT hero_id FROM hero_power AS hero_power_1 WHERE power_id = (SELECT id FROM superpower AS superpower_1 WHERE power_name = 'Control Wind')) ORDER BY superhero_name	superhero
SELECT T.gender FROM superhero T JOIN hero_attribute TA ON T.id = TA.hero_id JOIN attribute TB ON TA.attribute_id = TB.id WHERE TB.attribute_name = 'Phoenix Force'	superhero
SELECT s.superhero_name, s.height_cm FROM superhero AS s INNER JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.height_cm DESC LIMIT 1;	superhero
SELECT AVG(T2.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race_id != (SELECT id FROM race WHERE race = 'Human')	superhero
SELECT COUNT(hero_id) FROM hero_power WHERE power_id = ( SELECT id FROM superpower WHERE power_name = 'Speed' )	superhero
SELECT publisher_name FROM publisher WHERE id IN ( SELECT publisher_id FROM superhero GROUP BY publisher_id ORDER BY COUNT(id) DESC LIMIT 1 )	superhero
SELECT AVG(T1.attribute_value) FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' AND T2.attribute_name = 'Strength'	superhero
SELECT eye_colour  FROM colour  WHERE id = (     SELECT T2.eye_colour_id      FROM superhero AS T1      INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id      WHERE T1.superhero_name = 'Abomination' )	superhero
SELECT superhero_name  FROM superhero  ORDER BY height_cm DESC  LIMIT 1	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.superhero_name = 'Chuck Norris'	superhero
SELECT COUNT(T1.gender_id) / COUNT(T2.gender_id) * 100  FROM gender AS T1  INNER JOIN superhero AS T2 ON T1.id = T2.gender_id  WHERE T2.publisher_name = 'George Lucas' AND T1.gender = 'Female'	superhero
SELECT CAST(COUNT(CASE WHEN T2.alignment = 'good' THEN 1 ELSE NULL END) AS FLOAT) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T2.id = T1.alignment_id WHERE T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John %'	superhero
SELECT T.id FROM ( SELECT hero_id, MIN(attribute_value) FROM hero_attribute GROUP BY hero_id ) AS T	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'brown'	superhero
SELECT hero_attribute.attribute_value FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Aquababy'	superhero
SELECT height_cm ,  weight_kg ,  T1.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40	superhero
SELECT AVG(T2.height_cm) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T1.alignment = 'Neutral'	superhero
SELECT T1.id FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Intelligence'	superhero
SELECT T4.colour FROM superhero AS T1 INNER JOIN colour AS T4 ON T4.id = T1.eye_colour_id WHERE T1.superhero_name = 'Blackwulf'	superhero
Wrong question, the table does not contain information about height of superheroes, so I can't answer this question.	superhero
SELECT T2.driverRef FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.raceId = 18 ORDER BY T2.position ASC LIMIT 1	formula_1
SELECT T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 19 AND T2.positionOrder = 2	formula_1
SELECT YEAR(date) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = 'Shanghai'	formula_1
SELECT name FROM circuits WHERE name LIKE "%circuit de barcelona-catalunya%"	formula_1
SELECT name FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Germany')	formula_1
SELECT DISTINCT T2.position FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = 'Renault'	formula_1
SELECT COUNT(raceId) FROM races WHERE year = 2010 AND name NOT LIKE '%Asia%' AND name NOT LIKE '%Europe%' AND circuitId IN (SELECT circuitId FROM circuits WHERE country NOT LIKE '%Asia%' AND country NOT LIKE '%Europe%')	formula_1
SELECT name FROM races AS t1 JOIN circuits AS t2 ON t1.circuitId = t2.circuitId WHERE t2.country = 'Spain'	formula_1
SELECT lat, lng FROM circuits WHERE country = 'Australia'	formula_1
SELECT name FROM races WHERE circuitid IN ( SELECT circuitid FROM circuits WHERE name = 'Sepang International Circuit' )	formula_1
SELECT time FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = "Sepang International Circuit")	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T2.country FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 24 AND T1.position = 1	formula_1
SELECT T2.time FROM qualifying AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.qualifyId = 354 AND T3.forename = 'Bruno' AND T3.surname = 'Senna'	formula_1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T2.q2 = '0:01:40' AND T3.round = 355	formula_1
SELECT T2.name FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.q3 = '0:01:54' AND T1.raceId = 903	formula_1
SELECT COUNT(DISTINCT T1.driverId) AS num FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Bahrain Grand Prix' AND T2.year = 2007 AND T1.statusId = (SELECT statusId FROM status WHERE status = 'Finished')	formula_1
SELECT S.year, R.name FROM races AS R  JOIN seasons AS S ON S.year = R.year  WHERE R.raceId = 901	formula_1
SELECT COUNT(T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '2015-11-29'	formula_1
SELECT min(T1.dob) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592	formula_1
SELECT DISTINCT url FROM drivers WHERE TEXT(dob) = '1987-04-23' AND TEXT(forename) = 'Pierre'	formula_1
SELECT T3.country FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN drivers AS T3 ON T2.nationality = T3.nationality WHERE T1.raceId = 933 AND T1.fastestLapSpeed =   (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933)	formula_1
SELECT c.location, c.lat, c.lng FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE r.name = 'Malaysian Grand Prix'	formula_1
SELECT T1.url FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 AND T2.points IS NOT NULL ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT results.time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lucas' AND drivers.surname = 'di Grassi' AND results.raceId = (SELECT raceId FROM races WHERE name = 'Race No. 345')	formula_1
SELECT T1.country FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q2 = '0:01:15' AND T2.raceId = 347	formula_1
SELECT T1.code FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 45 AND T2.q3 = '0:01:33'	formula_1
SELECT time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T3.round = 743	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T2.position = 2 AND T3.name = 'San Marino Grand Prix' AND T3.year = 2006	formula_1
SELECT T1.year FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901	formula_1
SELECT COUNT(DISTINCT T4.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN driverStandings AS T3 ON T2.driverId = T3.driverId INNER JOIN drivers AS T4 ON T3.driverId = T4.driverId WHERE T1.date = '2015-11-29'	formula_1
SELECT T2.forename, T2.surname, T2.dob FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 872	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.lap = ( SELECT MIN(lap) FROM lapTimes WHERE raceId = 348 ) AND T2.raceId = 348	formula_1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = ( SELECT MAX(fastestLapSpeed) FROM results )	formula_1
SELECT ( MAX(T1.milliseconds) - T2.milliseconds ) * 100.0 / T2.milliseconds FROM lapTimes AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId AND T1.lap = T2.lap AND T1.driverId = 853 AND T2.driverId = 853 ORDER BY T1.raceId	formula_1
SELECT CAST(SUM(CASE WHEN T2.status = 'Finished' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.raceId) AS completion_rate  FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.date = '1983-07-16' AND T2.driverId IN (SELECT T2.driverId FROM races AS T1                                                 JOIN results AS T2 ON T1.raceId = T2.raceId                                                 WHERE T1.year = 1983 AND T1.date = '1983-07-16')	formula_1
SELECT MIN(year) FROM races	formula_1
SELECT COUNT(raceId) FROM races WHERE year = 2005 ORDER BY name DESC	formula_1
SELECT T1.name FROM races AS T1 INNER JOIN ( SELECT min(date) AS D FROM races ) AS T2 ON T1.date = T2.D	formula_1
SELECT name, date FROM races WHERE year = 1999 AND date = ( SELECT MAX(date) FROM races WHERE year = 1999 )	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(raceId) DESC LIMIT 1	formula_1
SELECT name FROM races WHERE year = 2017 AND circuitId NOT IN (SELECT circuitId FROM races WHERE year = 2000)	formula_1
SELECT T1.name, T1.location FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId ORDER BY T2.date ASC LIMIT 1	formula_1
SELECT MAX(T2.raceId) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'British Grand Prix'	formula_1
SELECT COUNT(DISTINCT year) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit' AND T2.country = 'UK'	formula_1
SELECT t1.forename, t1.surname FROM drivers AS t1 INNER JOIN results AS t2 ON t1.driverid = t2.driverid INNER JOIN races AS t3 ON t3.raceid = t2.raceid INNER JOIN circuits AS t4 ON t4.circuitid = t3.circuitid WHERE t4.name = 'Sepang International Circuit' AND t3.year = 2010 ORDER BY t2.position	formula_1
SELECT d.forename, d.surname, MAX(r.points) FROM drivers d JOIN results r ON d.driverId = r.driverId	formula_1
SELECT T1.forename, T1.surname, T1.driverId, SUM(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Chinese Grand Prix' AND T2.raceId = ( SELECT T2.raceId FROM results AS T2 INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2017 ORDER BY T3.date DESC LIMIT 1 ) GROUP BY T1.forename, T1.surname, T1.driverId ORDER BY SUM(T2.points) DESC LIMIT 3	formula_1
SELECT T1.driverId, T3.name FROM laptimes AS T1  INNER JOIN races AS T2 ON T1.raceId = T2.raceId  INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId  ORDER BY T1.milliseconds ASC  LIMIT 1	formula_1
SELECT AVG(T1.time) FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Sebastian' AND T2.surname = 'Vettel' AND T1.raceId = ( SELECT raceId FROM races WHERE year = 2009 AND name = 'Chinese Grand Prix' )	formula_1
SELECT CAST(SUM(CASE WHEN raceId IN (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit' AND country = 'Malaysia') AND year > 2010 AND positionOrder > 1) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN raceId IN (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit' AND country = 'Malaysia') AND year > 2010) THEN driverId ELSE NULL END)	formula_1
SELECT DISTINCT T1.forename, T1.surname, T1.nationality, T1.driverId FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.position = 1 GROUP BY T2.position ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T2.forename, T2.surname, T2.dob FROM drivers AS T2 INNER JOIN results AS T3 ON T2.driverId = T3.driverId INNER JOIN status AS T1 ON T3.statusId = T1.statusId WHERE T2.nationality = 'Japan' ORDER BY T2.dob ASC LIMIT 1	formula_1
SELECT T2.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year BETWEEN 1990 AND 2000 GROUP BY T2.name HAVING COUNT(T1.raceId) = 4	formula_1
SELECT T1.name, T1.location, T4.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId INNER JOIN seasons AS T3 ON T2.year = T3.year INNER JOIN results AS T4 ON T2.raceId = T4.raceId WHERE T3.year = 2006 AND T4.country = 'USA'	formula_1
SELECT T1.name AS race, T3.name AS circuit, T3.location FROM races AS T1 INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T1.date LIKE '2005-%-%' AND T1.name LIKE '%F1%'	formula_1
SELECT T1.date FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Alex' AND T3.surname = 'Yoong' AND T2.number < 10	formula_1
SELECT COUNT(races.raceId) FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId INNER JOIN results ON races.raceId = results.raceId INNER JOIN drivers ON results.driverId = drivers.driverId WHERE circuits.circuitRef = 'sepang-international-circuit' AND drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' AND results.position = 1	formula_1
SELECT T3.name AS race_name, T3.year AS race_year FROM results AS T1 INNER JOIN races AS T3 ON T1.raceId = T3.raceId INNER JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T4.forename = 'Michael' AND T4.surname = 'Schumacher' AND T1.fastestLap IS NOT NULL ORDER BY T1.fastestLapTime ASC LIMIT 1	formula_1
SELECT AVG(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T3.year = 2000	formula_1
SELECT T1.raceId, T1.positionText, T1.points FROM driverStandings AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.date ASC LIMIT 1	formula_1
SELECT T2.name AS race_name, T3.country AS hosting_country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId INNER JOIN circuits AS T3 ON T3.circuitId = T2.circuitId WHERE T1.year = 2017 ORDER BY T1.date	formula_1
SELECT races.name, races.year, circuits.location  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  ORDER BY races.laps DESC  LIMIT 1	formula_1
SELECT CAST(COUNT(CASE WHEN T1.country = 'Germany' THEN T1.country ELSE NULL END) AS REAL) * 100 / COUNT(T1.country) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name LIKE '%European Grand Prix%'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE lat ORDER BY lat ASC LIMIT 1	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT c.country FROM circuits AS c ORDER BY c.alt DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT T1.country FROM drivers AS T1 JOIN races AS T2 ON T1.driverid = T2.driverid GROUP BY T1.country ORDER BY T2.date ASC LIMIT 1	formula_1
SELECT T2.surname FROM constructors AS T1 INNER JOIN driver_standings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian'	formula_1
SELECT name FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson' AND url != ''	formula_1
SELECT T1.driverRef FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.constructorId = 3	formula_1
SELECT T1.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT DISTINCT T3.year  FROM circuits AS T1  INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId  INNER JOIN races AS T3 ON T1.circuitId = T3.circuitId  WHERE T1.name = 'Silverstone Circuit'	formula_1
SELECT name FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')	formula_1
SELECT T1.name, T2.name, T3.date FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId INNER JOIN seasons AS T3 ON T2.year = T3.year WHERE T3.year = 2010	formula_1
SELECT COUNT(*) FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')	formula_1
SELECT name FROM circuits WHERE location = 'Barcelona' AND country = 'Spain'	formula_1
SELECT url FROM circuits WHERE country = 'Spain' AND name = 'Autodromo Nuevo Barcelona'	formula_1
SELECT fastestLapTime FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND fastestLapTime IS NOT NULL ORDER BY fastestLapTime ASC LIMIT 1	formula_1
SELECT d.forename, d.surname  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE r.fastestLapSpeed = (   SELECT MAX(r2.fastestLapSpeed)    FROM results r2    WHERE r2.constructorId IN (     SELECT c.constructorId      FROM constructors c      WHERE c.name = 'Formula 1'   ) AND r2.statusId = 1 )	formula_1
SELECT T1.driverRef FROM drivers AS T1 INNER JOIN driverStandings AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T2.position = 1 AND T3.year = 2008	formula_1
SELECT T1.raceId, T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T2.name FROM driver_standings AS T1 INNER JOIN races AS T2 ON T1.race_id = T2.race_id WHERE T1.driver_id = ( SELECT T1.driver_id FROM driver_standings AS T1 INNER JOIN drivers AS T2 ON T1.driver_id = T2.driver_id WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ) AND T1.position = 1	formula_1
SELECT T3.fastestLapSpeed FROM races AS T1 INNER JOIN results AS T3 ON T1.raceId = T3.raceId WHERE T3.fastestLapSpeed IS NOT NULL AND T1.name = 'Spanish Grand Prix' AND T1.year = 2009 ORDER BY T3.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT DISTINCT T2.year FROM drivers AS T1  INNER JOIN results AS T2 ON T1.driverId = T2.driverId  WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT T4.name FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId INNER JOIN constructors AS T4 ON T2.constructorId = T4.constructorId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.year = 2008 AND T2.positionOrder = ( SELECT MAX(positionOrder) FROM results AS T5 WHERE T5.raceId = T2.raceId AND T5.constructorId = T4.constructorId )	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T1.grid = 4 AND T3.name = 'Australian Grand Prix' AND T3.year = 2008	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND resultId != ( SELECT resultId FROM results WHERE raceId = ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND statusId = 1 )	formula_1
SELECT fastestLapTime FROM results WHERE driverId = ( SELECT driverId FROM drivers WHERE number = 44 ) AND raceId = ( SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 )	formula_1
SELECT T2.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN driverStandings AS T3 ON T1.raceId = T3.raceId AND T1.driverId = T3.driverId WHERE T1.driverId = ( SELECT driverId FROM driverStandings WHERE position = 2 AND raceId = ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' ) ) AND T1.raceId = ( SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' )	formula_1
SELECT d.forename, d.surname, c.name FROM drivers AS d JOIN constructors AS c ON c.constructorId = results.constructorId JOIN results ON results.driverId = d.driverId WHERE c.name LIKE 'Team Renault' AND results.raceId = ( SELECT raceId FROM races WHERE year = 2008 ORDER BY date DESC LIMIT 1 )	formula_1
SELECT COUNT(T1.driverId) AS c FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'USA' AND T1.raceId IN (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)	formula_1
SELECT COUNT(DISTINCT T1.name) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2008	formula_1
SELECT sum(points) FROM results WHERE driverId = ( SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' )	formula_1
SELECT AVG(T1.fastestLapTime)  FROM results AS T1  INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId  WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT COUNT(T2.driverId) / COUNT(T1.driverId) * 100 AS completionRate FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.circuitId = 22	formula_1
SELECT CASE WHEN ROUND(MULTIPLY(SUBTRACT(A.milliseconds, D.milliseconds), 100.0) / A.milliseconds) <= 0 THEN 'Less' ELSE 'More' END AS comparison_result FROM results AS A JOIN results AS D ON A.raceId = D.raceId WHERE A.position = 1 AND D.position = (SELECT position FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) ORDER BY position DESC LIMIT 1)	formula_1
SELECT COUNT(*) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.circuitId IN (SELECT circuitId FROM races WHERE location = 'Melbourne' AND country = 'Australia')	formula_1
SELECT lat, lng FROM circuits WHERE country = 'United States'	formula_1
SELECT COUNT(d.driverId) FROM drivers d WHERE d.nationality = 'British' AND d.dob > '1980-12-31'	formula_1
SELECT AVG(T1.points)  FROM constructorResults AS T1  INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId  WHERE T2.nationality = 'British'	formula_1
SELECT T1.name FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT T1.name FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0	formula_1
SELECT COUNT(*) FROM constructors AS c JOIN constructorResults AS cr ON c.constructorId = cr.constructorId WHERE cr.points = 0 AND c.nationality = 'Japanese'	formula_1
SELECT DISTINCT T2.name FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.position = 1	formula_1
SELECT COUNT(T1.constructorId) FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'French' AND T2.laps > 50	formula_1
SELECT T1.raceId, T1.driverId FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T1.positionText != 'Disqualified' AND T2.nationality = 'Japan' AND T3.year >= 2007 AND T3.year <= 2009	formula_1
SELECT AVG(T1.fastestLapTime) AS avg_time, T2.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.position = 1 AND T1.fastestLapTime IS NOT NULL GROUP BY T2.year	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob > '1975-12-31' AND T2.positionOrder = 2	formula_1
SELECT COUNT(DISTINCT d.driverId) FROM drivers AS d LEFT JOIN results AS r ON d.driverId = r.driverId WHERE r.resultId IS NULL AND d.nationality = 'Italian'	formula_1
SELECT forename, surname FROM drivers WHERE driverId = ( SELECT driverId FROM results WHERE fastestLapTime = ( SELECT fastestLapTime FROM results ORDER BY fastestLapTime ASC LIMIT 1 ) )	formula_1
SELECT MAX(fastestLap) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009 AND winner = (SELECT driverId FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009 AND winner = 1)))	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT T2.name, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY T1.milliseconds ASC LIMIT 1	formula_1
SELECT COUNT(DISTINCT r.resultId) / COUNT(DISTINCT d.driverId) * 100.0 FROM results AS r INNER JOIN drivers AS d ON r.driverId = d.driverId WHERE YEAR(d.dob) >= 1985 AND r.laps > 50 AND r.raceId BETWEEN   ( SELECT raceId FROM races WHERE year BETWEEN 2000 AND 2005 ORDER BY date LIMIT 1 ) AND   ( SELECT raceId FROM races WHERE year BETWEEN 2000 AND 2005 ORDER BY date DESC LIMIT 1 )	formula_1
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'French' AND T2.time < '02:00.00'	formula_1
SELECT driverRef, nationality FROM drivers WHERE nationality = 'United States'	formula_1
SELECT raceId FROM races WHERE YEAR = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18	formula_1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob IS NOT NULL ORDER BY T1.dob LIMIT 3	formula_1
SELECT circuitRef FROM circuits WHERE name = "Robert Kubica"	formula_1
SELECT count(driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Australia' AND T1.dob LIKE '1980%'	formula_1
SELECT T1.forename, T1.surname, T4.fastestLapTime, MIN(T4.milliseconds) FROM drivers AS T1  INNER JOIN results AS T2 ON T1.driverId = T2.driverId  INNER JOIN races AS T3 ON T3.raceId = T2.raceId  INNER JOIN lapTimes AS T4 ON T4.raceId = T2.raceId AND T4.driverId = T2.driverId  WHERE T1.nationality = 'German' AND T1.dob BETWEEN '1980-01-01' AND '1990-12-31'  GROUP BY T1.driverId  ORDER BY T4.milliseconds ASC  LIMIT 3	formula_1
SELECT T2.circuitRef FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.nationality = 'German' ORDER BY T3.dob ASC LIMIT 1	formula_1
SELECT T1.driverId, T1.code FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob = '1971-04-24' AND T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime DESC LIMIT 1	formula_1
SELECT T2.forename, T2.surname, T1.lap, T2.dob FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'Spain' AND T2.dob < '1982-01-01' ORDER BY T1.milliseconds ASC LIMIT 10	formula_1
SELECT year FROM races WHERE fastestLapTime IS NOT NULL AND fastestLapTime <> '' ORDER BY fastestLapTime ASC LIMIT 1	formula_1
SELECT T2.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY T1.milliseconds ASC LIMIT 1	formula_1
SELECT driverId FROM results WHERE raceId = ( SELECT raceId FROM races ORDER BY year ASC, round ASC LIMIT 1 ) ORDER BY fastestLapTime ASC LIMIT 5	formula_1
SELECT COUNT(T2.position) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId BETWEEN 50 AND 100 AND T1.statusId = 9	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Austria'	formula_1
SELECT COUNT(*) AS finish_count, r.raceId  FROM results r  WHERE r.statusId = 1  GROUP BY r.raceId  ORDER BY finish_count DESC  LIMIT 1	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.position = 2	formula_1
SELECT YEAR(r.date), c.name, r.name, r.time  FROM races AS r  JOIN drivers AS d ON r.raceId = d.driverId  JOIN constructors AS con ON r.raceId = con.constructorId  WHERE d.dob = (SELECT MAX(dob) FROM drivers)  LIMIT 1	formula_1
SELECT COUNT(T1.forename)  FROM drivers AS T1  JOIN status AS T2 ON T1.statusId = T2.statusId  WHERE T2.status = 'disqualified' AND T1.nationality = 'United States'	formula_1
SELECT T1.name FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' AND T2.points = (SELECT MAX(points) FROM constructorStandings WHERE constructorId = T2.constructorId AND points > 0)	formula_1
SELECT t.url FROM constructors t INNER JOIN constructorStandings AS a ON t.constructorId = a.constructorId ORDER BY a.wins DESC LIMIT 1	formula_1
Sure, I can help with that. Let's first find the race ID for the French Grand Prix: SELECT raceId FROM races WHERE name = 'French Grand Prix' Let's then find the driver IDs for drivers who participated in that race: SELECT DISTINCT driverId FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'French Grand Prix') Finally, we can find the driver who had the slowest time in the 3rd lap: SELECT DISTINCT d.forename, d.surname, dr.time FROM drivers d JOIN results dr ON d.driverId = dr.driverId WHERE dr.raceId = (SELECT raceId FROM races WHERE name = 'French Grand Prix') AND dr.lap = 3 ORDER BY dr.time ASC LIMIT 1	formula_1
SELECT T1.fastestLapTime FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime ASC LIMIT 1	formula_1
SELECT AVG(T2.fastestLapTime) FROM races AS T1  JOIN results AS T2 ON T1.raceId = T2.raceId  WHERE T1.name = 'United States Grand Prix' AND T1.year = 2006 AND T2.position = 1 LIMIT 10	formula_1
SELECT T1.forename, T1.surname, T2.avg_pit_duration FROM drivers AS T1 INNER JOIN  (SELECT T1.driverId, AVG(T1.time) AS avg_pit_duration FROM pitStops AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 1985 AND T1.time IS NOT NULL GROUP BY T1.driverId) AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' ORDER BY T2.avg_pit_duration LIMIT 5	formula_1
SELECT T1.forename, T1.surname, T2.time FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.nationality = 'Canadian' AND T3.name = 'Canadian Grand Prix' AND T3.year = 2008 AND T2.position = 1	formula_1
SELECT T2.constructorRef FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = ( SELECT T1.raceId FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = ' Singapore Grand Prix' AND T1.year = 2009 ) AND T1.position = 1	formula_1
SELECT T3.forename, T3.surname, T3.dob FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.nationality = 'Austria' AND T3.dob BETWEEN '1981-01-01' AND '1991-12-31'	formula_1
SELECT T1.forename, T1.surname, T1.url, T1.dob FROM drivers AS T1 INNER JOIN races AS T2 ON T1.driverId = T2.winner INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T1.nationality = 'German' AND T1.dob BETWEEN '1971-01-01' AND '1985-12-31' AND T3.location = 'Germany' ORDER BY T1.dob DESC	formula_1
SELECT T1.location , T1.country, T1.lat , T1.lng FROM circuits AS T1 WHERE T1.name = 'Hungaroring'	formula_1
SELECT T4.name ,  T4.nationality ,  T3.points FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  JOIN constructors AS T4 ON T1.constructorId = T4.constructorId  JOIN circuits AS T5 ON T2.circuitId = T5.circuitId  JOIN seasons AS T6 ON T2.year = T6.year  WHERE T5.name = 'Monaco Grand Prix' AND T5.country = 'Monaco' AND T6.year BETWEEN 1980 AND 2010  GROUP BY T4.name, T4.nationality  ORDER BY T3.points DESC  LIMIT 1	formula_1
SELECT AVG(points)  FROM results  JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name LIKE '%Turkish Grand Prix%'	formula_1
SELECT COUNT(*) / COUNT(DISTINCT EXTRACT(YEAR FROM date)) FROM races WHERE YEAR BETWEEN 2000 AND 2009	formula_1
SELECT T2.nationality FROM drivers AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId GROUP BY T2.nationality ORDER BY COUNT(T2.nationality) DESC LIMIT 1	formula_1
SELECT COUNT(T1.raceId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.positionOrder = 91	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapSpeed = ( SELECT MAX(fastestLapSpeed) FROM results )	formula_1
SELECT T1.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId ORDER BY T2.date DESC LIMIT 1	formula_1
SELECT T4.forename, T4.surname FROM results AS T1 INNER JOIN races AS T2 ON T2.raceId = T1.raceId INNER JOIN qualifications AS T3 ON T1.raceId = T3.raceId INNER JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T2.name = '2008 Marina Bay Street Circuit' AND T3.round = 3 AND T1.position = 1	formula_1
SELECT t1.forename, t1.surname, t2.nationality, t1.number FROM drivers AS t1 INNER JOIN results AS t2 ON t1.driverId = t2.driverId ORDER BY t1.dob DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM pitStops AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId INNER JOIN drivers AS T4 ON T1.driverId = T4.driverId INNER JOIN races AS T5 ON T3.name = 'Canadian Grand Prix' WHERE T3.country = 'Canada' AND T1.time IS NOT NULL	formula_1
SELECT T2.forename, T2.surname FROM results AS T1  JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.wins = ( SELECT MAX(wins) FROM results )	formula_1
SELECT T2.time FROM pitStops AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T2.date IS NOT NULL  ORDER BY T2.date ASC  LIMIT 1	formula_1
SELECT time FROM lapTimes ORDER BY milliseconds ASC LIMIT 1	formula_1
SELECT STRFTIME('%H:%M:%S',fastestLapTime) FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE surname='Hamilton') ORDER BY fastestLapTime DESC LIMIT 1	formula_1
SELECT p.stop, p.time FROM pitStops AS p JOIN races AS r ON p.raceId = r.raceId JOIN drivers AS d ON p.driverId = d.driverId WHERE d.driverRef = 'hamilton' AND r.name = '2011 Australian Grand Prix' AND r.year = 2011	formula_1
SELECT DISTINCT T1.forename, T1.surname, T2.stop, T2.time  FROM drivers AS T1  INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId  INNER JOIN races AS T3 ON T2.raceId = T3.raceId  WHERE T3.year = 2011 AND T3.name = 'Australian Grand Prix'	formula_1
SELECT t1.raceId, t3.forename, t3.surname, t1.lap FROM lapTimes AS t1  JOIN drivers AS t3 ON t3.driverId = t1.driverId  JOIN races AS t4 ON t4.raceId = t1.raceId  WHERE t3.forename = 'Lewis' AND t3.surname = 'Hamilton'  AND t1.lap = (SELECT MIN(lap) FROM lapTimes WHERE driverId = t3.driverId AND raceId IN (SELECT raceId FROM races WHERE name LIKE '%Formula%'))	formula_1
SELECT DISTINCT T2.forename, T2.surname FROM results AS T1  JOIN drivers AS T2 ON T2.driverId = T1.driverId  ORDER BY T1.fastestLapTime ASC LIMIT 1	formula_1
SELECT DISTINCT T3.position FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN lapTimes AS T3 ON T1.raceId = T3.raceId AND T1.driverId = T3.driverId WHERE T2.name LIKE 'Formula 1%' AND T1.fastestLap = T3.lap AND T1.driverId = 4	formula_1
SELECT t3.time FROM circuits AS t1  INNER JOIN races AS t2 ON t1.circuitId = t2.circuitId  INNER JOIN lapTimes AS t3 ON t2.raceId = t3.raceId  WHERE t1.name = 'Austrian Grand Prix Circuit'  ORDER BY t3.lap ASC  LIMIT 1	formula_1
SELECT driverId, lap, time, milliseconds  FROM lapTimes  JOIN circuits ON lapTimes.raceId = races.raceId  JOIN races ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy'	formula_1
SELECT name FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Austrian Grand Prix Circuit' AND races.fastestLapTime != 'None' ORDER BY races.fastestLapTime ASC LIMIT 1	formula_1
SELECT fastestLapTime FROM results WHERE raceId = ( SELECT raceId FROM races WHERE circuitId = ( SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix Circuit' ) ) AND fastestLapTime IS NOT NULL	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN results AS T2 ON T1.circuitId = T2.raceId WHERE T2.laps = 29 AND T2.time LIKE '1:29.488%'	formula_1
To find the average time in milliseconds that Lewis Hamilton spent at a pit stop during Formula 1 races, we will first need to find the ID of Lewis Hamilton in the `drivers` table and then join this with the `pitStops` table to retrieve his pit stops. We'll also join this with the `races` table to get the races he participated in. From there, we can calculate the average time in milliseconds spent at the pit stop.  Here's the SQL query to achieve this:  ```sql SELECT AVG(milliseconds) FROM pitStops JOIN races ON pitStops.raceId = races.raceId JOIN drivers ON pitStops.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; ```  This query joins the `pitStops`, `races`, and `drivers` tables together to filter for Lewis Hamilton's pit stops during races. It then calculates the average of the `milliseconds` column to find the average time spent at the pit stop.	formula_1
SELECT AVG(T1.milliseconds) FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.country = 'Italy'	formula_1
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT height ,  player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player_Attributes ORDER BY potential ASC LIMIT 1	european_football_2
SELECT COUNT(T1.player_api_id) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.preferred_foot = 'right' AND T2.player_name LIKE 'Attack_Move%'	european_football_2
SELECT player_id, player_name, MAX(crossing)  FROM Player_Attributes  GROUP BY player_id  ORDER BY MAX(crossing) DESC  LIMIT 5	european_football_2
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE strftime('%Y', m.date) = '2016' GROUP BY l.name ORDER BY SUM(m.home_team_goal) + SUM(m.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.team_api_id AS T1_c1 FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = 2016 AND T2.home_team_goal < T2.away_team_goal ORDER BY COUNT(*) ASC LIMIT 1	european_football_2
SELECT T2.player_name FROM Player AS T2 INNER JOIN Player_Attributes AS T1 ON T2.player_api_id = T1.player_api_id ORDER BY T1.penalties DESC LIMIT 10	european_football_2
SELECT T2.team_short_name FROM Player AS T1 INNER JOIN Team AS T2 ON T1.player_api_id = T2.team_api_id WHERE T1.player_name = 'Steve Cooper' AND T1.birthday > DATETIME('now', '-32 YEAR') AND T2.name = 'Scottish Premier League'	european_football_2
SELECT T2.buildUpPlaySpeed FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id ORDER BY T2.buildUpPlaySpeed DESC LIMIT 4	european_football_2
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id JOIN Match AS T3 ON T1.id = T3.league_id WHERE T3.season = '2016' AND T3.home_team_goal = T3.away_team_goal GROUP BY T1.name ORDER BY COUNT(T3.id) DESC LIMIT 1	european_football_2
SELECT T1.player_name, T1.birthday  FROM Player AS T1  JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.sprint_speed >= 97 AND T2.date BETWEEN '2013-01-01' AND '2015-12-31'	european_football_2
SELECT T1.name FROM league AS T1 JOIN match AS T2 ON T2.league_id = T1.id WHERE T2.league_id IN ( SELECT league_id FROM match GROUP BY league_id ORDER BY COUNT(home_team_api_id) DESC LIMIT 1 )	european_football_2
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01' AND '1995-12-31';	european_football_2
SELECT T2.player_api_id FROM player_attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.date LIKE '2010%' GROUP BY T2.player_api_id HAVING AVG(T1.overall_rating) > (SELECT AVG(overall_rating) FROM player_attributes WHERE date LIKE '2010%') ORDER BY AVG(T1.overall_rating) DESC LIMIT 1	european_football_2
SELECT T2.team_fifa_api_id FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed BETWEEN 50 AND 60	european_football_2
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > ( SELECT AVG(T3.buildUpPlayPassing) FROM Team_Attributes AS T3 WHERE T3.date LIKE '2012%' )	european_football_2
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'Left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_id) AS Percentage FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T1.birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT name FROM League ORDER BY SUM(home_team_goal) + SUM(away_team_goal) ASC LIMIT 5	european_football_2
SELECT AVG(CAST(CASE WHEN T1.player_name = 'Ahmed Samir Farag' THEN T2.long_shots ELSE NULL END AS REAL)) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T2.player_fifa_api_id = T1.player_fifa_api_id	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.height > 180 ORDER BY T2.heading_accuracy DESC LIMIT 10	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T2.team_api_id = T1.team_api_id WHERE T1.chance_creation_passing IN (SELECT AVG(chance_creation_passing) FROM Team_Attributes WHERE STRFTIME('%Y', date) = '2014') AND T1.buildUpPlayDribblingClass = 'Normal' ORDER BY T1.chance_creation_passing	european_football_2
SELECT name FROM LEAGUE WHERE id IN ( SELECT l.id FROM Match AS m INNER JOIN League AS l ON m.league_id = l.id WHERE m.season = '2009/2010' GROUP BY m.home_team_api_id HAVING AVG(m.home_team_goal) > AVG(m.away_team_goal) )	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT T2.player_name FROM sqlite_sequence AS T1  INNER JOIN Player AS T2 ON T1.name = 'Player' WHERE strftime('%Y', T2.birthday) = '1970' AND strftime('%m', T2.birthday) = '10'	european_football_2
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Franco Zennaro'	european_football_2
SELECT COUNT(DISTINCT T1.team_id) FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.date LIKE '2012-%' AND T2.match_api_id IN ( SELECT match_api_id FROM Team_Attributes WHERE team_api_id = 5279 )	european_football_2
SELECT T2.finishing FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18'	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas') AND date LIKE '2011%'	european_football_2
SELECT COUNT(*) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id JOIN Country AS T3 ON T2.country_id = T3.id WHERE T3.name = 'Scotland' AND T1.season = '2015/2016'	european_football_2
SELECT preferred_foot FROM Player_Attributes ORDER BY CAST(REPLACE(SUBSTR(date, INSTR(date, '-')), '-', '') AS INTEGER) ORDER BY overall_rating ASC LIMIT 1	european_football_2
SELECT player_name FROM player_attributes ORDER BY potential DESC LIMIT 1	european_football_2
SELECT COUNT(player_id) FROM Player WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT DISTINCT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T2.team_api_id = T1.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT DISTINCT T1.defensive_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'David Wilson'	european_football_2
SELECT MAX(T2.birthday) FROM Player_attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id	european_football_2
SELECT name FROM League WHERE country_id IN (SELECT id FROM Country WHERE name = 'Netherlands')	european_football_2
SELECT AVG(T1.home_team_goal) FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id INNER JOIN Country AS T3 ON T2.country_id = T3.id WHERE T3.name = 'Poland' AND T1.season = '2010/2011'	european_football_2
SELECT AVG(T1.finishing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.height = (SELECT MIN(T3.height) FROM Player AS T3) OR T2.height = (SELECT MAX(T4.height) FROM Player AS T4)	european_football_2
SELECT player_name FROM player WHERE height  >  180	european_football_2
SELECT COUNT(DISTINCT T2.id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.birthday > '1990-12-31'	european_football_2
SELECT COUNT(T1.player_name) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name LIKE 'Adam%' AND T1.weight > 170	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.overall_rating > 80 AND T1.birthday BETWEEN '2008-01-01' AND '2010-12-31'	european_football_2
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Doran'	european_football_2
SELECT player_name FROM player WHERE preferred_foot = 'left'	european_football_2
SELECT team_short_name FROM Team_Attributes WHERE buildUpPlaySpeedClass = 'fast'	european_football_2
SELECT T1.player_api_id FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "Lionel Messi"	european_football_2
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > 70	european_football_2
SELECT avg(overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.height > 170 AND SUBSTR(T1.date, 1, 4) BETWEEN 2010 AND 2015	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.height ASC LIMIT 1	european_football_2
SELECT T2.name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'AC Milan'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*) FROM Match WHERE T1.season = '2008/2009' AND T2.name = 'German 1. Bundesliga'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.potential = 61 AND T1.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61)	european_football_2
SELECT      CASE          WHEN AVG(T1.ball_control) > AVG(T2.ball_control) THEN AVG(T1.ball_control) - AVG(T2.ball_control)         ELSE AVG(T2.ball_control) - AVG(T1.ball_control)     END AS diff_ball_control FROM      Player_Attributes AS T1  JOIN      Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE      T2.player_name IN ('Abdou Diallo', 'Aaron Appindangoye');	european_football_2
SELECT team_long_name FROM team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE birthdate = (SELECT MIN(birthdate) FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada'))	european_football_2
SELECT name FROM player ORDER BY height DESC LIMIT 1	european_football_2
SELECT COUNT(T1.id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'left' AND T2.attacking_work_rate = 'medium'	european_football_2
SELECT T2.name FROM match AS T1 JOIN country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium'	european_football_2
SELECT name FROM LEAGUE WHERE country_id IN (SELECT id FROM COUNTRY WHERE name = 'Germany')	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.strength DESC LIMIT 1	european_football_2
SELECT COUNT(DISTINCT T2.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.birthday LIKE '___-__-__' AND T1.birthday < '1986-01-01' AND T2.preferred_foot = 'Right' AND T2.defensive_work_rate = 'Low'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id OR T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.crossing = ( SELECT MAX(crossing) FROM Player_Attributes )	european_football_2
SELECT heading_accuracy FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(T3.player_api_id)  FROM Player_Attributes AS T1  INNER JOIN Player AS T3 ON T1.player_fifa_api_id = T3.player_fifa_api_id  WHERE T3.height > 180 AND T1.volleys > 70	european_football_2
SELECT T3.player_name FROM Player_attributes AS T1 INNER JOIN Player AS T3 ON T1.player_fifa_api_id = T3.player_fifa_api_id WHERE T1.volleys > 70 AND T1.dribbling > 70	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium')	european_football_2
SELECT MAX(long_passing) FROM Player_Attributes	european_football_2
SELECT COUNT(*) FROM Match WHERE SUBSTR(match_date, 1, 2) = '04' AND SUBSTR(match_date, 6, 4) = '2009' AND league_id = ( SELECT id FROM League WHERE name = 'Belgian Jupiler League' )	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE CAST(SUBSTR(T1.birthday, 1, 4) AS INTEGER) < 1986	european_football_2
SELECT CAST(T1.overall_rating AS REAL) * 100 / T2.overall_rating * 100  FROM Player_Attributes AS T1  JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T1.player_name = 'Ariel Borysiuk' AND T2.player_name = 'Paulin Puel'	european_football_2
SELECT AVG(buildUpPlaySpeed) FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_short_name = 'Heart of Midlothian')	european_football_2
SELECT avg(overall_rating) FROM Player_Attributes	european_football_2
SELECT COUNT(T3.id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Match AS T3 ON T3.home_player_1 = T1.player_api_id OR T3.home_player_2 = T1.player_api_id OR T3.home_player_3 = T1.player_api_id OR T3.home_player_4 = T1.player_api_id OR T3.home_player_5 = T1.player_api_id OR T3.home_player_6 = T1.player_api_id OR T3.home_player_7 = T1.player_api_id OR T3.home_player_8 = T1.player_api_id OR T3.home_player_9 = T1.player_api_id OR T3.home_player_10 = T1.player_api_id OR T3.home_player_11 = T1.player_api_id OR T3.away_player_1 = T1.player_api_id OR T3.away_player_2 = T1.player_api_id OR T3.away_player_3 = T1.player_api_id OR T3.away_player_4 = T1.player_api_id OR T3.away_player_5 = T1.player_api_id OR T3.away_player_6 = T1.player_api_id OR T3.away_player_7 = T1.player_api_id OR T3.away_player_8 = T1.player_api_id OR T3.away_player_9 = T1.player_api_id OR T3.away_player_10 = T1.player_api_id OR T3.away_player_11 = T1.player_api_id WHERE T1.player_name = 'Aaron Lennox'	european_football_2
SELECT T1.name, T2.potential FROM Country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.player_fifa_api_id INNER JOIN Player_Attributes AS T3 ON T3.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Ajax'	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Abdou Diallo')	european_football_2
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(T1.away_team_goal) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Italy'	european_football_2
SELECT T1.name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date = '2016-06-23' ORDER BY T1.birthday DESC LIMIT 1	european_football_2
SELECT overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Mooy' AND T1.date = '2016-02-04'	european_football_2
SELECT T2.potential FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = "Francesco Parravicini" AND T2.date = "2010-08-30"	european_football_2
SELECT attacking_work_rate FROM Player_Attributes WHERE player_name = 'Francesco Migliore' AND date = '2015-05-01';	european_football_2
SELECT T1.defensive_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Berigaud' AND T1.date = '2013-02-22'	european_football_2
SELECT date FROM Match WHERE home_player_1 = 22821 AND crossing = ( SELECT MAX(crossing) FROM Match WHERE home_player_1 = 22821 ) OR away_player_1 = 22821 AND crossing = ( SELECT MAX(crossing) FROM Match WHERE away_player_1 = 22821 )	european_football_2
SELECT T3.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.player_api_id INNER JOIN Team_Attributes AS T3 ON T2.team_api_id = T3.team_api_id WHERE T1.team_long_name = 'Willem II' AND T3.date = '2011-02-22'	european_football_2
SELECT T2.buildUpPlayDribbling FROM Match AS T1 JOIN Team_Attributes AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.date LIKE '2015-09-10' AND T1.home_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'LEI')	european_football_2
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'FC Lorient' AND T1.date = '2010-02-22'	european_football_2
SELECT T4.chanceCreationPassingClass FROM Match AS T1 INNER JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id INNER JOIN Team AS T3 ON T2.player_api_id = T3.team_api_id INNER JOIN Team_Attributes AS T4 ON T3.team_api_id = T4.team_api_id WHERE T3.team_short_name = 'PEC Zwolle' AND T1.date = '2013-09-20'	european_football_2
SELECT T2.chance_creation_crossing_class FROM Match AS T1 INNER JOIN Team_Attributes AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 0 AND T1.away_team_goal = 1 AND T1.date = '2010-02-22' AND T2.chance_creation_crossing_class IS NOT NULL	european_football_2
SELECT T3.defence_aggression_class FROM Country AS T1  INNER JOIN Team AS T2 ON T1.id = T2.team_fifa_api_id  INNER JOIN Team_Attributes AS T3 ON T2.id = T3.team_fifa_api_id  WHERE T2.team_short_name = 'Hannover 96' AND T3.date = '2015-09-10'	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND T2.date BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT CAST(SUM(CASE WHEN T1.overall_rating > T2.overall_rating THEN 1 ELSE 0 END) AS REAL) / COUNT(*) AS `Percentage` FROM Player_Attributes AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id AND T2.`date` = '2013/7/12' WHERE T1.player_name = 'Landon Donovan'	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.height DESC LIMIT 5	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT T1.player_name FROM player AS T1 INNER JOIN player_attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE STRFTIME('%Y', T1.birthday) - STRFTIME('%Y', T2.date) > 35	european_football_2
SELECT COUNT(DISTINCT match_id) AS `Home Team Goals Scored` FROM match_detail AS T1 JOIN player AS T2 ON T1.home_player_id = T2.player_id WHERE T2.player_name = 'Aaron Lennon'	european_football_2
SELECT COUNT(*) FROM player_attributes AS T1 INNER JOIN player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name IN ('Daan Smith', 'Filipe Ferreira')	european_football_2
SELECT COUNT(*) FROM Player AS t1 INNER JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE t1.birthday >= DATE('now', '-30 years')	european_football_2
SELECT player_name FROM player ORDER BY overall_rating DESC LIMIT 10	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.potential = ( SELECT max(potential) FROM Player_Attributes )	european_football_2
SELECT DISTINCT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'medium' OR T2.attacking_work_rate = 'high' AND T2.preferred_foot = 'right'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = ( SELECT max(T2.finishing) FROM Player_Attributes AS T2 )	european_football_2
SELECT player_name FROM Player WHERE country_id = (SELECT id FROM Country WHERE name = 'Belgium')	european_football_2
SELECT T2.name  FROM Player_attributes AS T1  INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T1.vision >= 90	european_football_2
SELECT T3.country_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Country AS T3 ON T3.id = T1.birthday	european_football_2
SELECT T3.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T3 ON T1.team_api_id = T3.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Medium'	european_football_2
SELECT DISTINCT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.chanceCreationPassing_class = 'low'	european_football_2
SELECT AVG(T2.height) FROM Country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Italy'	european_football_2
SELECT T2.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 ORDER BY T2.potential DESC LIMIT 3	european_football_2
SELECT count(id) FROM Player WHERE SUBSTR(birthday, 1, 4) > '1990' AND SUBSTR(player_name, 1, 6) = 'Aaron'	european_football_2
SELECT AVG(T2.jumping - T3.jumping) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id JOIN Player_Attributes AS T3 ON T3.player_fifa_api_id = 23	european_football_2
SELECT id FROM Player WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player_attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.preferred_foot = 'left' AND T1.crossing = ( SELECT MAX(crossing) FROM Player_attributes )	european_football_2
SELECT COUNT(*) / COUNT(DISTINCT player_api_id) * 100.0 FROM player_attributes WHERE strength > 80 AND stamina > 80	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN Match AS T2 ON T1.id = T2.country_id WHERE T2.league_id = ( SELECT T1.id FROM League AS T1 INNER JOIN Team AS T2 ON T1.id = T2.league_id WHERE T2.team_long_name = 'Poland Ekstraklasa' )	european_football_2
SELECT T1.away_team_goal, T1.home_team_goal FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id INNER JOIN League AS T3 ON T3.id = T1.league_id WHERE T3.name = 'Belgian Jupiler League' AND T1.date = '2008-09-24'	european_football_2
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Alexis Blin'	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Match AS T1 INNER JOIN Team_Attributes AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_id = (SELECT team_id FROM Team WHERE team_short_name = "KSV Cercle Brugge")	european_football_2
SELECT COUNT(T2.home_team_api_id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.league_id = T2.league_id WHERE T1.name = "Italian Serie A" AND T2.season = "2015–2016"	european_football_2
SELECT T2.home_team_goal FROM Country AS T1 INNER JOIN Match AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Netherlands' AND T2.league_id IN ( SELECT id FROM League WHERE name = 'Eredivisie' )	european_football_2
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.weight DESC LIMIT 1	european_football_2
SELECT T.name FROM Team AS T  INNER JOIN Match AS M ON T.team_api_id = M.home_team_api_id  WHERE STRFTIME('%Y', M.date) = '2015' AND STRFTIME('%Y', M.date) = '2016'  GROUP BY T.name  ORDER BY COUNT(T.team_api_id) DESC  LIMIT 1	european_football_2
SELECT T3.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id INNER JOIN Team AS T3 ON T2.team_long_name = T3.team_long_name GROUP BY T3.team_long_name ORDER BY SUM(T1.away_team_goal) DESC LIMIT 1	european_football_2
SELECT player_name FROM Player ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT CAST(COUNT(*) AS REAL) / COUNT(T1.player_api_id) * 100 AS percentage  FROM Player AS T1  JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T1.height < 180 AND T2.strength > 70	european_football_2
SELECT SEX FROM Patient WHERE ID IN (     SELECT ID     FROM Patient     WHERE ADMISSION = 'In-patient' ) GROUP BY SEX	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN SEX = 'FEMALE' AND YEAR(Birthday) > 1930 THEN ID ELSE NULL END) AS REAL) * 100 / COUNT(ID) FROM Patient	thrombosis_prediction
SELECT CAST(SUM(IIF(Birthday BETWEEN '1930-01-01' AND '1940-12-31' AND Admission = 'INPATIENT', 1, 0)) AS FLOAT) / COUNT(*) * 100 AS `Inpatient percentage` FROM Patient	thrombosis_prediction
SELECT CAST(SUM(IIF(Patient.Description BETWEEN '2010-01-01' AND '2020-12-31' AND Patient.Diagnosis = 'SLE', 1, 0)) AS REAL) / SUM(IIF(Patient.Description BETWEEN '2010-01-01' AND '2020-12-31', 1, 0)) FROM Patient	thrombosis_prediction
SELECT T2.diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.id = T2.id WHERE T1.id = '30609'	thrombosis_prediction
SELECT T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '163109'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH > 450 OR L.LDH < 30	thrombosis_prediction
SELECT T1.ID, T2.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 1	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Diagnosis FROM Thrombosis AS T1 INNER JOIN Patient AS T2 ON T2.ID = T1.ID ORDER BY T2.ID	thrombosis_prediction
SELECT T1.Description FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE YEAR(T1.Birthday) = 1937 AND T3.TG > 200	thrombosis_prediction
SELECT T2.ID, T2.SEX, T2.Diagnosis FROM Patient AS T2 INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T3.ALB < 3.5	thrombosis_prediction
SELECT CAST(SUM(IIF(SEX = 'FEMALE', 1, 0)) AS REAL) * 100.0 / COUNT(ID) AS percentage FROM Patient	thrombosis_prediction
SELECT AVG(T1.`aCL IgG`)  FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T2.SEX = 'Male'  AND T2.Birthday <= DATE_SUB(CURDATE(), INTERVAL 50 YEAR)	thrombosis_prediction
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'female' AND YEAR(T2.`Examination Date`) = 1997	thrombosis_prediction
SELECT Age FROM Patient ORDER BY Age ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE YEAR(E.`Examination Date`) = 1997 AND E.Thrombosis = (   SELECT MAX(E2.Thrombosis)   FROM Examination AS E2   WHERE YEAR(E2.`Examination Date`) = 1997 ) AND P.SEX = 'Female'	thrombosis_prediction
SELECT TIMESTAMPDIFF(YEAR, MIN(birthday), MAX(birthday)) AS age_gap FROM Patient	thrombosis_prediction
SELECT T2.Diagnosis  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T1.Birthday = (SELECT MIN(Birthday) FROM Patient)	thrombosis_prediction
SELECT COUNT(T1.ID) / COUNT(T2.`Month`) AS num_of_male FROM Patient AS T1 INNER JOIN ( SELECT ID, MONTH(`First Date`) AS `Month`, SEX FROM Patient WHERE `First Date` BETWEEN '1998-01-01' AND '1998-12-31' ) AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M'	thrombosis_prediction
SELECT T2.Sex, T2.Description, T2.Birthday FROM Examination AS T1  JOIN Patient AS T2 ON T1.ID = T2.ID  WHERE T2.Diagnosis LIKE 'SJS%' AND T1.`Examination Date` = (SELECT MAX(`Examination Date`) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE 'SJS%')	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN SEX = 'M' THEN 1 END) AS REAL) / COUNT(CASE WHEN SEX = 'F' THEN 1 END) FROM Patient WHERE `Diagnosis` LIKE '%abnormal%uric%count%'	thrombosis_prediction
To find the count of patients who haven't undergone a medical examination until at least a year following their initial hospital visit, you need to consider the dates of the first hospital visit and the examination dates. Since the Examinations table includes the Examination Date, you can join it with the Patients table on the ID column to get the corresponding Initial Date.  Here's the SQL query:  ```sql SELECT COUNT(*)  FROM Patient p WHERE NOT EXISTS (     SELECT 1      FROM Examination e      WHERE p.ID = e.ID      AND e.Examination_Date >= p.`First Date` + INTERVAL 1 YEAR ); ```  This query does the following:  1. Selects the count of patients (COUNT(*)). 2. Uses a subquery that checks for any medical examination after the patient's initial hospital visit plus one year. 3. `NOT EXISTS` returns true if there is no matching record in the subquery, which means the patient hasn't undergone an examination in the specified time frame.	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday >= DATE('1990-01-01') AND T1.Birthday <= DATE('1993-12-31')	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Male' AND T2.`T-BIL` > 0	thrombosis_prediction
SELECT DISTINCT T2.Diagnosis FROM Patient AS T1  INNER JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'	thrombosis_prediction
SELECT AVG(T2.Birthday) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1991-10-01' AND '1991-10-31'	thrombosis_prediction
To find the patient who had the highest hemoglobin count at the time of the examination and what is the doctor's diagnosis, I can write the following SQL query:  ```sql SELECT P.`First Date`, P.Diagnosis  FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.HGB = (SELECT MAX(HGB) FROM Laboratory) ORDER BY P.`First Date` ASC; ```  In this query, I first join the `Patient` table with the `Examination` and `Laboratory` tables on the ID column. Then I use a subquery to find the maximum hemoglobin count in the `Laboratory` table. Finally, I filter the results to include only the row with the maximum hemoglobin count, and sort the results by the first date of admission in ascending order.	thrombosis_prediction
SELECT T2.`aCL IgA` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` = '1996-12-02' AND T1.ID = 3605340	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 2927464 AND T2.`Date` = '1995-09-04' AND T2.TG < 300 AND T2.TG > 200 AND T2.TP < 200 AND T2.TP > 100 AND T2.`T-BIL` < 200 AND T2.`T-BIL` > 100 AND T2.CRE < 15 AND T2.CRE > 5 AND T2.HB > 11 AND T2.HCT < 47 AND T2.HCT > 38	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'AORTITIS' ORDER BY T1.`First Date` ASC LIMIT 1	thrombosis_prediction
SELECT T1.`aCL IgG`, T1.`aCL IgM` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.`Examination Date` = '1994-02-19' AND T1.`aCL IgA` = '1993-11-12'	thrombosis_prediction
SELECT T2.SEX FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` = '1992-06-12' AND T1.ALP = 9	thrombosis_prediction
SELECT p.Age FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`Uric Acid` = 8.4 AND e.`Examination Date` = '1991-10-21'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.`First Date` = '1991-06-13' AND T1.Diagnosis = 'SJS' AND T3.Date BETWEEN '1995-01-01' AND '1995-12-31'	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description = '1997/1/27' AND T2.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Birthday = '1959-03-01' AND Examination.`Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT (SELECT TG FROM Laboratory AS l1 WHERE l1.ID = p.ID AND l1.Date BETWEEN '1981-11-01' AND '1981-11-30' ORDER BY l1.Date LIMIT 1) - (SELECT TG FROM Laboratory AS l2 WHERE l2.ID = p.ID AND l2.Date BETWEEN '1981-12-01' AND '1981-12-31' ORDER BY l2.Date LIMIT 1) AS TG_Decrease FROM Patient AS p WHERE p.Birthday = '1959-02-18'	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE P.Diagnosis = 'Behcet''s' AND E.`Examination Date` BETWEEN '1970-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T3.GPT > 30 AND T3.ALB < 4	thrombosis_prediction
SELECT ID FROM Patient WHERE Birthday = '1964-01-01' AND SEX = 'Female' AND ADMISSION IS NOT NULL	thrombosis_prediction
SELECT COUNT(p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Thrombosis = 2 AND e.`ANA Pattern` = 'S' AND e.`aCL IgM` > (     SELECT AVG(`aCL IgM`)      FROM Examination      WHERE `aCL IgM` IS NOT NULL AND `aCL IgM` > 0 )	thrombosis_prediction
SELECT COUNT(*) / COUNT(DISTINCT T1.ID) * 100 FROM Patient AS T1 INNER JOIN ( SELECT T1.ID, COUNT(T2.U_PRO) AS uric_acid, COUNT(T2.IGG) AS proteinuria FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.U_PRO BETWEEN 1 AND 4 AND T2.IGG BETWEEN 1 AND 10000 GROUP BY T2.ID ) AS T3 ON T1.ID = T3.ID	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN p.SEX = 'Male' AND e.`First Date` BETWEEN '1981-01-01' AND '1981-12-31' AND e.Diagnosis = 'BEHCET' THEN 1 END) AS REAL) * 100 / COUNT(DISTINCT p.ID) FROM Patient p INNER JOIN Examination e ON p.ID = e.ID	thrombosis_prediction
SELECT t1.ID, t1.SEX, t1.Birthday, t1.Description, t1.`First Date`, t1.Admission, t1.Diagnosis  FROM Patient t1  INNER JOIN Laboratory t2 ON t1.ID = t2.ID  WHERE t2.Date BETWEEN '1991-10-01' AND '1991-10-31' AND (t2.`T-BIL` BETWEEN 1 AND 10)	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ANA = 1 AND T1.SEX = 'Female' AND T1.Birthday BETWEEN '1980-01-01' AND '1989-12-31' AND T2.`ANA Pattern` != 'P only'	thrombosis_prediction
SELECT p.SEX FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis = 'PSS' AND l.CRE = 2 AND l.GPT = 1 AND l.LDH = 123	thrombosis_prediction
SELECT AVG(L.ALB) FROM LaboRatory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Symptoms FROM Patient WHERE SEX = 'FEMALE' AND DIAGNOSIS = 'SLE' AND Symptoms IS NOT NULL ORDER BY Symptoms LIMIT 1	thrombosis_prediction
SELECT T2.Diagnosis, MIN(T1.`Examination Date`) AS FirstDate FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Female' AND T2.Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT t1.ID) FROM Patient AS t1 INNER JOIN Examination AS t2 ON t1.ID = t2.ID WHERE YEAR(t2.`Examination Date`) = 1997 AND (t1.SEX = 'Male' OR t1.SEX IS NOT NULL) AND (t2.`aCL IgA` IS NULL OR t2.`aCL IgA` >= 0 AND t2.`aCL IgA` <= 15)	thrombosis_prediction
SELECT COUNT(T1.ID) AS `Count of patients who had signs of thrombocytopenia with SLE diagnosed` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 1 AND T1.Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T1.SEX = 'Female' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T1.Birthday) = '1980' AND T2.Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'Male' AND ID IN (SELECT ID FROM Examination WHERE `Diagnosis` = 'BEHCET disease' AND `Examination Date` BETWEEN '1995-01-01' AND '1997-12-31') AND ID NOT IN (SELECT ID FROM Patient WHERE `Admission` = 'Hospital' AND `Thrombosis` = 1)	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.`WBC` < 3.5	thrombosis_prediction
SELECT TIMESTAMPDIFF(DAY, P1.First_Date, E1.`Examination Date`) AS time_difference FROM Patient AS P1 INNER JOIN ( SELECT ID, MIN(`Examination Date`) AS `Examination Date` FROM Examination GROUP BY ID ) AS E1 ON P1.ID = E1.ID WHERE P1.ID = 821298	thrombosis_prediction
SELECT CASE             WHEN UA BETWEEN 1 AND 300 THEN 'Yes'            ELSE 'No'        END AS WithinNormalRange FROM Patient  WHERE ID = 57266   AND UA IS NOT NULL	thrombosis_prediction
SELECT T2.`Examination Date`  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.ID = 48473 AND T2.`aCL IgG` IS NOT NULL AND T2.`aCL IgG` > 40	thrombosis_prediction
SELECT T1.SEX, T1.Birthday  FROM Patient AS T1  INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.`GOT` BETWEEN 10 AND 35 AND T2.Date BETWEEN '1994-01-01' AND '1994-12-31'	thrombosis_prediction
SELECT T2.ID FROM Patient AS T1 JOIN Lab AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Male' AND T2.GPT > 140	thrombosis_prediction
SELECT T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ALP > 50 ORDER BY T2.Birthday ASC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH BETWEEN 25 AND 45	thrombosis_prediction
SELECT DISTINCT T2.ID, T2.Birthday FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH > 300 AND T1.LDH < 100	thrombosis_prediction
SELECT ID FROM Patient WHERE DIAGNOSIS LIKE '%alkaliphatase%' AND ALP > 100 AND ALP < 200	thrombosis_prediction
SELECT ID FROM Patient WHERE Birthday = '1982-04-01'	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 7.2	thrombosis_prediction
Sure, I can help you write the SQL query based on the given database schema and constraints. Here it is:  ```sql SELECT L.`TP-DEV` FROM Patient P JOIN (     SELECT D.ID,            CASE                WHEN D.TP > 150 THEN D.TP - 100                WHEN D.TP < 80 THEN 50 - D.TP                ELSE 0            END AS `TP-DEV`     FROM Laboratory D ) L ON P.ID = L.ID WHERE P.SEX = 'Female' AND P.Description IS NOT NULL; ```  Here is a breakdown of the query:  1. We first select the necessary columns from the `Laboratory` table and alias it as `L`. The TP-DEV column calculates the deviation of the TP value from the normal, using CASE statements. 2. Then, we join the `Patient` table with the subquery result. 3. In the `WHERE` clause, we select only female patients whose Description is not NULL. 4. Finally, we select the TP-DEV column from the result.  Note that the calculation of the deviation depends on the range of normal values. You may need to adjust it based on your specific requirements.	thrombosis_prediction
To solve this problem, we'll need to write a SQL query that first filters out male patients with an albumin value outside of the specified range. Then, it will sort these patients by their birthdays in descending order.   Assuming the valid range for Albumin is between 3.5 and 6.5, the SQL query would be:  ```sql SELECT Patient.ID, Patient.SEX, Patient.Birthday  FROM Patient  INNER JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'Male' AND NOT (Laboratory.ALB BETWEEN 3.5 AND 6.5) ORDER BY Patient.Birthday DESC; ```  In this query, we are selecting the `ID`, `SEX`, and `Birthday` columns from the `Patient` table where the `SEX` is 'Male' and the `ALB` value is not between 3.5 and 6.5. We then sort the results in descending order by the `Birthday` column.	thrombosis_prediction
SELECT (     CASE          WHEN P.Birthday BETWEEN DATE '1982-01-01' AND DATE '1982-12-31' THEN              CASE                  WHEN L.ALB >= 3.5 AND L.ALB <= 5.7 THEN                      'Albumin is within normal range.'                 ELSE                      'Albumin is not within normal range.'             END          ELSE              'Patient not born in 1982.'      END ) AS AlbuminRange FROM Patient P LEFT JOIN Laboratory L ON P.ID = L.ID	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN SEX = 'Female' AND UA > 60 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) AS 'Percentage of female patients with Uric acid beyond normal range' FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE UA IS NOT NULL	thrombosis_prediction
SELECT avg(ua) AS `Average UA Index` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE ua IS NOT NULL ORDER BY T2.Date DESC LIMIT 1	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.UN BETWEEN 56 AND 78	thrombosis_prediction
SELECT T.ID, T.SEX, T.Birthday FROM Patient AS T WHERE T.Description = 'RA'	thrombosis_prediction
SELECT COUNT(T.ID) FROM (     SELECT DISTINCT E.ID     FROM Examination E     JOIN Patient P ON E.ID = P.ID     WHERE P.SEX = 'Male'       AND E.`CRE` > 150 ) T	thrombosis_prediction
SELECT CASE      WHEN COUNT(CASE WHEN SEX = 'Male' AND (CRE < 70 OR CRE > 140) THEN 1 END) > COUNT(CASE WHEN SEX = 'Female' AND (CRE < 70 OR CRE > 140) THEN 1 END) THEN 1      ELSE 0  END AS 'Result' FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = ( SELECT MAX(T_BIL) FROM Laboratory )	thrombosis_prediction
SELECT P.SEX, L.`T-BIL`  FROM Patient AS P  JOIN Laboratory AS L ON P.ID = L.ID WHERE L.`T-BIL` IS NOT NULL  AND (L.`T-BIL` < 10 OR L.`T-BIL` > 35)  GROUP BY P.SEX;	thrombosis_prediction
SELECT T1.ID, SUM(T3.`T-CHO`) AS tcho FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID GROUP BY T1.ID ORDER BY tcho DESC LIMIT 1	thrombosis_prediction
SELECT AVG(T1.Birthday) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Male' AND T2.`T-CHO` > 0	thrombosis_prediction
SELECT DISTINCT T2.description, T2.diagnosis FROM laboratory AS T1 INNER JOIN patient AS T2 ON T1.id = T2.id WHERE T1.tg > 100 AND T1.tg IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE TG > 200 AND YEAR(CURRENT_DATE) - YEAR(Patient.Birthday) > 50	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE BETWEEN 5 AND 99	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) AS Number_of_Male_Patients FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Male' AND T1.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND T2.CRE > 100	thrombosis_prediction
SELECT T1.ID, T1.SEX, T2.Description - T1.Birthday AS AGE FROM Patient AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.GLU < 35 OR T2.GLU > 300 AND T1.Birthday IS NOT NULL AND T2.Description IS NOT NULL	thrombosis_prediction
SELECT T1.ID, T3.GLU FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE T2.`Examination Date` BETWEEN '1991-01-01' AND '1991-12-31' AND T3.GLU BETWEEN 70 AND 200	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.WBC IS NOT NULL AND (L.WBC > 20 OR L.WBC < 3.5) ORDER BY P.Birthday ASC	thrombosis_prediction
SELECT Patient.ID, DATEDIFF(CURDATE(), Patient.Birthday) AS Age FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID ORDER BY Examination.`aCL IgM` ASC	thrombosis_prediction
Sure, based on your constraints and the provided database schema, here is the SQL to answer your question:  ```sql SELECT      P.SEX,     P.Birthday,     L.RBC FROM      Patient P  JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F' AND P.Birthday >= DATE_SUB(CURRENT_DATE, INTERVAL 50 YEAR) AND L.RBC < 3.5; ``` Explanation:   This SQL query joins the "Patient" and "Laboratory" tables based on the patient's ID. It then filters the result to only include female patients who are at least 50 years old and whose red blood cell count (RBC) is less than 3.5. The selected columns are the patient's sex, their birthday, and their red blood cell count.	thrombosis_prediction
SELECT p.ID, p.SEX FROM Examination AS e  JOIN Patient AS p ON e.ID = p.ID WHERE e.`aCL IgA` < 10 AND e.Thrombosis = 1;	thrombosis_prediction
SELECT T2.ID, T2.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.HGB IS NOT NULL ORDER BY T2.HGB DESC LIMIT 1	thrombosis_prediction
SELECT T3.ID, T2.age  FROM Patient T1  JOIN (      SELECT t3.ID, t3.Birthday      FROM Examination AS t1      JOIN Patient AS t3 ON t1.ID = t3.ID      WHERE t1.ANA > 100 AND t1.KCT > 10 AND t1.RVVT > 10 AND t1.LAC > 20 AND t1.`aCL IgG` > 50 AND t1.`aCL IgM` > 50 AND t1.`aCL IgA` > 50  ) AS T2 ON T1.ID = T2.ID  JOIN (      SELECT ID      FROM Laboratory      WHERE GOT > 100 AND GPT > 100 AND LDH > 100 AND ALP > 100 AND TP > 100 AND ALB > 100 AND UA > 100 AND UN > 100 AND CRE > 100 AND `T-BIL` > 100 AND `T-CHO` > 100 AND TG > 100 AND CPK > 100 AND GLU > 100 AND WBC > 100 AND RBC > 100 AND HGB > 100 AND HCT > 100 AND PLT > 100 AND PT > 100 AND APTT > 100 AND FG > 100 AND PIC > 100 AND TAT > 100 AND TAT2 > 100 AND CRP IS NOT NULL AND RA IS NOT NULL AND RF IS NOT NULL AND C3 > 100 AND C4 > 100 AND RNP IS NOT NULL AND SM IS NOT NULL AND SC170 IS NOT NULL AND SSA IS NOT NULL AND SSB IS NOT NULL AND CENTROMEA IS NOT NULL AND DNA IS NOT NULL AND `DNA-II` > 100  ) AS T3 ON T1.ID = T3.ID  GROUP BY T3.ID	thrombosis_prediction
SELECT AVG(HCT) FROM (SELECT l.HCT FROM Laboratory l JOIN Patient p ON l.ID = p.ID WHERE YEAR(p.`First Date`) = 1991 AND l.HCT < 0.1) AS subquery	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PLT < 100	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(P.Birthday) > 1984 AND YEAR(CURRENT_DATE) - YEAR(P.Birthday) < 50 AND L.PLT >= 15000 AND L.PLT <= 45000	thrombosis_prediction
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(ID) FROM Patient WHERE ID IN (SELECT ID FROM Patient WHERE Birthday <= DATE_SUB(CURDATE(), INTERVAL 55 YEAR)))) AS Percentage  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Examination.PT <> NULL AND Patient.SEX = 'Female' AND Patient.Birthday <= DATE_SUB(CURDATE(), INTERVAL 55 YEAR);	thrombosis_prediction
1. Join the Patient and Examination tables using the ID column 2. Filter the results to only include patients who first came to the hospital after year 1992 (first date is after 1992-12-31) 3. Join the Patient and Laboratory tables using the ID column 4. Filter the results to only include patients with a normal prothrombin time (PT) level (TP between 3.6 and 11.2) 5. Select the ID and Birthday columns from the filtered results 6. Return the distinct ID and Birthday	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND T1.Thrombosis = 1	thrombosis_prediction
Sure, I can help you with that! Let's first select the patients with an abnormal activated partial prothrombin time (APTT). Then, we can join that table with the Patient table to get the necessary information for each patient. Finally, we can filter the results to only include patients who have a mild thrombosis. Here's the SQL query to achieve that: SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.`First Date`, Patient.Admission, Patient.Diagnosis, Patient.Thrombosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.APTT IS NOT NULL AND Laboratory.APTT > 1500 AND Patient.Thrombosis IS NOT NULL AND Patient.Thrombosis = 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Male' AND T2.`aCL IgA` IS NOT NULL AND T2.`aCL IgA` > 130	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient P  LEFT JOIN Laboratory L ON P.ID = L.ID  WHERE P.Birthday > '1980-01-01' AND L.TG IS NOT NULL AND L.TG > 200	thrombosis_prediction
SELECT T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` > 0	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE E.`aCL IgA` IS NULL AND P.Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE E.`aCL IgG` < 0 AND E.Symptoms LIKE '%abortion%'	thrombosis_prediction
Sure, here's the SQL query to find the number of patients with a normal Ig G level (0-10 mmU/L) who have symptoms: ``` SELECT COUNT(DISTINCT T2.ID)  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.`aCL IgG` BETWEEN 0 AND 10 AND T2.Symptoms IS NOT NULL ``` This query first joins the Patient and Examination tables on the ID field. It then filters the results to only include rows where the aCL IgG level is between 0 and 10 and the Symptoms field is not NULL. Finally, it counts the distinct IDs of the patients that meet these criteria.	thrombosis_prediction
SELECT T1.diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`aCL IgA` BETWEEN 25 AND 90 AND T2.SEX = 'Female' AND T2.Birthday BETWEEN '1970-01-01' AND '1990-12-31' ORDER BY T1.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Patient WHERE Diagnosis = 'Hospitalized' AND Birthday > '1990-01-01'	thrombosis_prediction
SELECT Diagnosis FROM Patient WHERE ID IN ( SELECT ID FROM Examination WHERE `aCL IgM` > ( SELECT avg(`aCL IgM`) FROM Examination ) )	thrombosis_prediction
SELECT COUNT(T1.ID) AS `Number of Patients without C-reactive protein data recorded` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.CRP IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE CRP LIKE '%abnormal%' AND C4 IS NULL;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE `aCL IgG` > 0 AND `aCL IgM` > 0	thrombosis_prediction
SELECT DISTINCT P.Diagnosis  FROM Patient P  WHERE P.Birthday > '1995-01-01'  AND P.ID IN (     SELECT L.ID      FROM Laboratory L      WHERE L.`RhFactor` = 'normal' )	thrombosis_prediction
SELECT ID FROM Patient WHERE RF = 'Normal' AND DATEDIFF(CURRENT_DATE, Birthday) > 60 * 365	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  LEFT JOIN Examination E ON P.ID = E.ID  WHERE P.RF != 'None' AND E.Thrombosis IS NULL	thrombosis_prediction
SELECT COUNT(T1.ID)  FROM Patient AS T1  INNER JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.`ANA Pattern` = 'P' AND T2.`aCL IgG` >= 1.5 AND T2.`aCL IgM` >= 1.5	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.`aCL IgA` IS NOT NULL ORDER BY T2.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis IS NOT NULL AND T2.`aCL IgA` IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.`aCL IgA` IS NOT NULL AND E.`aCL IgA` BETWEEN 0 AND 100	thrombosis_prediction
SELECT T2.Birthday FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`aCL IgA` IS NOT NULL ORDER BY T2.`aCL IgA` ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(*) FROM ( SELECT DISTINCT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.SM = 'Normal anti-SM' ORDER BY T1.TAT DESC LIMIT 1 ) AS T3	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM = 'yes' ORDER BY T1.Birthday ASC LIMIT 3	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` > '1997-01-01' AND T2.`aCL IgG` IS NOT NULL AND T2.`aCL IgG` < 1	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'male' AND T2.`Thrombosis` = 1 AND T2.Symptoms LIKE '%vertigo%' AND T2.`Examination Date` > DATE_SUB(NOW(), INTERVAL 1 YEAR)	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms LIKE '%Normal anti-SSA%' AND T1.Description < '1990-01-01'	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX IS NOT NULL AND BIRTHDAY IS NOT NULL AND Description IS NOT NULL AND `First Date` IS NOT NULL AND Admission IS NOT NULL AND Diagnosis IS NOT NULL ORDER BY ID ASC LIMIT 1	thrombosis_prediction
SELECT count(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis LIKE '%SLE%' AND T3.SSB = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T.ID) FROM (SELECT L.ID FROM Laboratory AS L WHERE L.SSB = 'normal' AND L.CRP IS NOT NULL) AS T JOIN Examination AS E ON T.ID = E.ID WHERE E.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CENTROMEA = 'normal' AND T2.SSB = 'normal' AND T1.SEX = 'male'	thrombosis_prediction
SELECT T1.Diagnosis  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.`aCL IgA` > 0	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient P LEFT JOIN Laboratory L ON P.ID = L.ID WHERE L.DNA IS NULL	thrombosis_prediction
SELECT COUNT(Patient.ID) FROM Patient JOIN Lab ON Patient.ID = Lab.ID WHERE Lab.`DNA-II` IS NOT NULL	thrombosis_prediction
SELECT CAST(COUNT(T1.ID) AS REAL) * 100 / COUNT(T3.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Symptoms LIKE '%Glutamic oxaloacetic transaminase level%' AND T2.Diagnosis LIKE '%SLE%' AND T3.GOT > 200	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Male' AND T2.ALP BETWEEN 50 AND 300	thrombosis_prediction
SELECT MIN(Birthday)  FROM Patient AS T1  INNER JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.ALP > 'None'	thrombosis_prediction
SELECT P.ID, MAX(L.ALP)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALP IS NOT NULL AND L.ALP BETWEEN 30 AND 120  ORDER BY L.ALP DESC  LIMIT 3	thrombosis_prediction
SELECT COUNT(P.ID) AS male_count FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.ALP >= 0 AND L.ALP < 30	thrombosis_prediction
SELECT T2.Examination_Date FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.LAC >= 18 AND T2.LAC <= 76 ORDER BY T2.Examination_Date LIMIT 1	thrombosis_prediction
SELECT `Examination Date` FROM Examination WHERE `ALP` IS NOT NULL AND `ALP` > 0 ORDER BY `Examination Date` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ALP > 200	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE ALP BETWEEN 0 AND 30	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.T_CHO < 100	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' AND T2.`T-CHO` BETWEEN 3.5 AND 8.0	thrombosis_prediction
SELECT `Examination Date` FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.ALB >= 3.5 AND Patient.SEX IS NOT NULL ORDER BY `Examination Date` LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) AS `Count of IDs` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.SEX = 'Male' AND T3.ALB BETWEEN 3 AND 5 AND T3.`T-CHO` BETWEEN 3 AND 12	thrombosis_prediction
SELECT T.`aCL IgA` FROM ( SELECT T1.ID, MAX(T1.UA) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'female' AND T1.UA BETWEEN 70 AND 99 GROUP BY T1.ID ) AS T	thrombosis_prediction
SELECT MAX(`aCL IgA`) FROM Examination WHERE `aCL IgA` IS NOT NULL AND `aCL IgA` > 0 AND (CRE IS NULL OR CRE <= 1)	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.CRE <= 1.2 AND L.CRE IS NOT NULL ORDER BY L.CRE DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT Examination.ID)  FROM Examination  JOIN Patient ON Patient.ID = Examination.ID  JOIN Laboratory ON Laboratory.ID = Patient.ID  WHERE Laboratory.T_BIL > 125  AND Examination.`ANA Pattern` IS NOT NULL;	thrombosis_prediction
SELECT T4.`aCL IgG` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.`T-BIL` >= 0 AND T3.`T-BIL` <= 20 ORDER BY T3.`T-BIL` DESC LIMIT 1	thrombosis_prediction
Given the database schema, to answer the question, we need to join the Patient and Laboratory tables on the ID field, filter the patients whose total cholesterol (TG) is greater than 0, and then select the count of patients who have a negative measure of degree of coagulation (Thrombosis = 0).   Here is the SQL query:  ```sql SELECT COUNT(DISTINCT p.ID) AS num_patients  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG > 0 AND l.Thrombosis = 0 ```   This query first joins the Patient and Laboratory tables based on the ID field. Then it filters the results to only include patients with a total cholesterol (TG) greater than 0. Finally, it counts the distinct patient IDs who have a negative measure of degree of coagulation (Thrombosis = 0).	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`aCL IgG` > 7 AND T1.`aCL IgG` < 20 AND T1.`aCL IgM` > 11 AND T1.`aCL IgM` < 40 AND T1.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT COUNT(T1.ID)  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.`T-CHO` IS NOT NULL AND T2.`T-BIL` IS NOT NULL AND (T1.Symptoms IS NOT NULL AND T1.Symptoms != 'None')	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T2.`TG` DESC LIMIT 1	thrombosis_prediction
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CRE IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T2.ID)  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.`aCL IgG` >= 13 AND T2.`aCL IgG` <= 62  AND T2.`aCL IgM` >= 7 AND T2.`aCL IgM` <= 33  AND T2.`aCL IgA` IS NOT NULL  AND T2.Diagnosis IS NOT NULL  AND T2.Thrombosis IS NOT NULL	thrombosis_prediction
SELECT T1.`Birthday` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU IS NOT NULL AND T2.GLU != 'None' ORDER BY T2.GLU DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T.ID) FROM Patient AS T WHERE T.Description IS NOT NULL AND T.Diagnosis IS NOT NULL AND ( SELECT COUNT(*) FROM Laboratory AS T2 WHERE T2.ID = T.ID AND T2.GLU >= 70 AND T2.GLU <= 180 ) = 0 AND ( SELECT COUNT(*) FROM Examination AS T3 WHERE T3.ID = T.ID AND T3.Thrombosis = 0 )	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P WHERE P.Description IS NOT NULL AND EXISTS (SELECT 1 FROM Laboratory L WHERE L.ID = P.ID AND L.WBC > 4.3 AND L.WBC < 12.1)	thrombosis_prediction
SELECT COUNT(ID) FROM Patient AS T1 INNER JOIN Diagnosis AS T2 ON T1.Diagnosis = T2.ID WHERE T2.description = 'SLE' AND T1.WBC >= 100	thrombosis_prediction
SELECT T2.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC <> 'Normal' AND T1.Admission = 'Outpatient'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1  INNER JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T2.PLT IS NOT NULL  AND T2.PLT NOT BETWEEN 100 AND 500	thrombosis_prediction
SELECT T3.PLT  FROM Patient AS T1  INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID  INNER JOIN Examination AS T3 ON T1.ID = T3.ID  WHERE T1.Diagnosis = 'MCTD' AND T3.PLT BETWEEN 10000 AND 40000	thrombosis_prediction
SELECT AVG(TAT) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'Male' AND T1.Diagnosis LIKE 'Normal Prothrombin Time'	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 1 AND T2.`Prothrombin Time` = 'normal'	thrombosis_prediction
SELECT major_name FROM member WHERE first_name = 'Angela' AND last_name = 'Sanders';	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering'	student_club
SELECT DISTINCT T2.first_name, T2.last_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.department = 'Art and Design' AND T1.college = 'College of Fine Arts'	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer'	student_club
SELECT T3.phone FROM major AS T1 INNER JOIN member AS T3 ON T1.major_id = T3.link_to_major INNER JOIN attendance AS T4 ON T3.member_id = T4.link_to_member INNER JOIN event AS T5 ON T4.link_to_event = T5.event_id WHERE T1.major_name = 'Student Club' AND T5.event_name = 'Women''s Soccer'	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN attendance AS T3 ON T1.member_id = T3.link_to_member INNER JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T4.event_name = 'Women's Soccer' AND T1.t_shirt_size = 'Medium'	student_club
SELECT T1.event_id FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id ORDER BY COUNT(DISTINCT T2.link_to_member) DESC LIMIT 1	student_club
SELECT DISTINCT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President' AND T1.major_name = 'Student_Club'	student_club
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM attendance WHERE link_to_member IN (SELECT member_id FROM member WHERE first_name = 'Maya' AND last_name = 'Mclean'))	student_club
SELECT COUNT(t2.link_to_event) FROM member AS t1 INNER JOIN attendance AS t2 ON t1.member_id = t2.link_to_member INNER JOIN event AS t3 ON t2.link_to_event = t3.event_id WHERE t1.first_name = 'Sacha' AND t1.last_name = 'Harrison' AND SUBSTR(t3.event_date, 1, 4) = '2019' AND t3.type = 'Student_Club'	student_club
SELECT COUNT(*) FROM ( SELECT link_to_event FROM attendance GROUP BY link_to_event HAVING COUNT(*) > 10 ) AS subquery JOIN event ON subquery.link_to_event = event.event_id WHERE event.type = 'Meeting'	student_club
SELECT T2.event_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.link_to_event IN (SELECT T3.event_id FROM event AS T3 WHERE T3.type = 'Student_Club') AND COUNT(*) > 20	student_club
SELECT COUNT(DISTINCT T1.link_to_event) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_date LIKE '%2020%'	student_club
SELECT MAX(expense.cost) FROM expense	student_club
SELECT COUNT(DISTINCT T3.member_id) FROM major AS T1 INNER JOIN member AS T3 ON T1.major_id = T3.link_to_major WHERE T1.major_name = 'Environmental Engineering'	student_club
SELECT DISTINCT T2.first_name, T2.last_name FROM event AS T1 INNER JOIN attendance AS T3 ON T1.event_id = T3.link_to_event INNER JOIN member AS T2 ON T3.link_to_member = T2.member_id WHERE T1.event_name = 'Laugh Out Loud'	student_club
SELECT DISTINCT last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Law' AND major.major_name = 'Constitutional Studies'	student_club
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'	student_club
SELECT T3.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'	student_club
SELECT MAX(cost) FROM expense WHERE expense_date LIKE '2020-05%' AND income_source = 'Vice President';	student_club
SELECT SUM(T3.amount) FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget INNER JOIN income AS T3 ON T2.link_to_member = T3.link_to_member INNER JOIN event AS T4 ON T1.link_to_event = T4.event_id WHERE T4.type = 'September Meeting' AND T2.expense_description = 'Food'	student_club
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'President' AND T1.last_name = 'Student_Club'	student_club
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'IL')	student_club
SELECT T1.amount FROM income AS T1 INNER JOIN expense AS T2 ON T1.link_to_member = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_budget = T3.event_id INNER JOIN member AS T4 ON T3.event_id = T4.member_id WHERE T3.event_name = 'September Meeting' AND T2.expense_description = 'Advertisement'	student_club
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Pierre' AND T1.last_name = 'Guidi'	student_club
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'	student_club
SELECT SUM(CASE WHEN T3.date_received = '2019-10-08' THEN 1 ELSE 0 END) AS cnt FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id	student_club
SELECT AVG(T1.cost) FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND T3.event_date LIKE '9%' OR T3.event_date LIKE '10%'	student_club
SELECT T2.event_date FROM budget AS T1  JOIN event AS T2 ON T1.link_to_event = T2.event_id  WHERE T1.event_status = 'Completed'  AND T2.event_name = 'Student_Club'  AND T2.event_date LIKE '2019%'  INTERSECT  SELECT T2.event_date FROM budget AS T1  JOIN event AS T2 ON T1.link_to_event = T2.event_id  WHERE T1.event_status = 'Completed'  AND T2.event_name = 'Student_Club'  AND T2.event_date LIKE '2020%'  MINUS  SELECT T2.event_date FROM expense AS T1  JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id  WHERE T1.approved = 'Yes'  AND T2.event_status = 'Completed'  AND T2.event_name = 'Student_Club'  AND T2.event_date LIKE '2019%'  MINUS  SELECT T2.event_date FROM expense AS T1  JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id  WHERE T1.approved = 'Yes'  AND T2.event_status = 'Completed'  AND T2.event_name = 'Student_Club'  AND T2.event_date LIKE '2020%'	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT T.cost FROM expense AS T INNER JOIN event AS T1 ON T.link_to_event = T1.event_id WHERE T1.event_name = 'Posters' AND T1.event_date = '2019-09-04'	student_club
SELECT b2.remaining FROM budget AS b1 INNER JOIN budget AS b2 ON b1.event_status = b2.event_status INNER JOIN event AS e ON b1.link_to_event = e.event_id WHERE b1.category = 'Food' AND e.type = 'Fundraiser' AND b2.category = 'Food' AND b2.remaining = ( SELECT MAX(remaining) FROM budget AS b3 WHERE b3.category = 'Food' )	student_club
SELECT notes FROM event WHERE event_date = '2019-09-14'	student_club
SELECT COUNT(T1.major_id) FROM major AS T1 INNER JOIN event AS T2 ON T1.major_id = T2.major_id WHERE T1.college = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'	student_club
SELECT T3.county FROM member AS T1 INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O'Gallagher'	student_club
SELECT COUNT(*) FROM budget AS t1 INNER JOIN event AS t2 ON t1.link_to_event = t2.event_id WHERE t1.remaining > t1.spent AND t2.event_name = 'November Meeting'	student_club
SELECT SUM(b.amount)  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.event_name = 'September Speaker';	student_club
SELECT status FROM event WHERE event_id = ( SELECT link_to_event FROM budget WHERE spent = ( SELECT MAX(spent) FROM budget ) )	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'	student_club
SELECT COUNT(t1.t_shirt_size) FROM member AS t1 INNER JOIN major AS t2 ON t1.link_to_major = t2.major_id WHERE t2.major_name = 'Human Development and Family Studies' AND t1.t_shirt_size = 'Large';	student_club
SELECT zip_code FROM member WHERE first_name = 'Christof' AND last_name = 'Nielsen'	student_club
SELECT T3.major_name FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'Vice President'	student_club
SELECT state FROM zip_code WHERE zip_code = ( SELECT zip FROM member WHERE first_name = 'Sacha' AND last_name = 'Harrison' )	student_club
SELECT t2.department FROM member AS t1 INNER JOIN major AS t2 ON t1.link_to_major = t2.major_id WHERE t1.position = 'President'	student_club
SELECT date_received FROM income WHERE link_to_member = 'Connor Hilton'	student_club
SELECT first_name, last_name FROM member ORDER BY date_received ASC LIMIT 1	student_club
SELECT COUNT(*) AS "COUNT(distinct link_to_event)" FROM budget AS t1 INNER JOIN event AS t2 ON t1.link_to_event = t2.event_id WHERE t2.event_name = 'Yearly Kickoff' AND t1.category = 'Advertisement' INTERSECT SELECT COUNT(*) AS "COUNT(distinct link_to_event)" FROM budget AS t1 INNER JOIN event AS t2 ON t1.link_to_event = t2.event_id WHERE t2.event_name = 'October Meeting' AND t1.category = 'Advertisement'	student_club
SELECT CAST(SUM(CASE WHEN T2.category = 'Parking' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T2.event_name = 'November Speaker'	student_club
SELECT sum(t2.cost) FROM expense AS t1  JOIN budget AS t3 ON t2.link_to_budget = t3.budget_id  JOIN event AS t4 ON t3.link_to_event = t4.event_id	student_club
SELECT COUNT(DISTINCT T2.city) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.college = 'University of Virginia'	student_club
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Humanities and Social Sciences'	student_club
SELECT T3.short_state FROM member AS T1 INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'	student_club
SELECT SUM(cost) FROM expense WHERE link_to_budget = (SELECT budget_id FROM budget ORDER BY remaining ASC LIMIT 1)	student_club
SELECT DISTINCT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T3.event_id = T2.link_to_event WHERE T3.event_name = 'October Meeting'	student_club
SELECT college FROM member GROUP BY college ORDER BY count(*) DESC LIMIT 1	student_club
SELECT m.major_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.phone = '809-555-3360'	student_club
SELECT event_id FROM event JOIN budget ON event.event_id = budget.link_to_event ORDER BY budget.amount DESC LIMIT 1	student_club
SELECT T1.expense_description, T1.expense_date, T1.cost FROM expense AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  WHERE T2.position = 'Vice President'	student_club
SELECT count(T1.member_id) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women's Soccer'	student_club
SELECT T2.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'	student_club
SELECT SUM(CASE WHEN T1.state = 'MD' THEN 1 ELSE 0 END)  FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip	student_club
SELECT count(*) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.phone = '954-555-6240'	student_club
SELECT T2.member_id, T2.first_name, T2.last_name, T2.email, T2.position, T2.t_shirt_size, T2.phone, T2.zip, T2.link_to_major FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.college = 'School of Applied Sciences, Technology and Education'	student_club
SELECT event_name, event_date, type FROM event  JOIN budget ON event.event_id = budget.link_to_event  WHERE event_status = 'closed' AND budget.remaining > 0 ORDER BY spent / remaining DESC  LIMIT 1;	student_club
SELECT COUNT(DISTINCT T1.position) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'president'	student_club
SELECT MAX(t1.spent) FROM budget AS t1 INNER JOIN event AS t2 ON t1.link_to_event = t2.event_id	student_club
SELECT COUNT(event_id) FROM event WHERE event_date LIKE '2020%'	student_club
SELECT sum(cost) FROM expense WHERE expense_description LIKE '%food%'	student_club
SELECT DISTINCT T2.first_name, T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.first_name, T2.last_name HAVING COUNT(*) > 7	student_club
SELECT T1.member_id FROM member AS T1  INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id  INNER JOIN attendance AS T3 ON T3.link_to_member = T1.member_id  INNER JOIN event AS T4 ON T3.link_to_event = T4.event_id  WHERE T2.major_name = 'Interior Design' AND T4.event_name = 'Community Theater'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Student' AND T1.last_name = 'Georgetown' AND T2.state = 'South Carolina'	student_club
SELECT COUNT(T1.amount) FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Grant' AND T2.last_name = 'Gilmour'	student_club
SELECT T2.member_id FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.amount > 40	student_club
SELECT SUM(cost) as Total_Expense FROM expense WHERE expense_date LIKE '2022-%'	student_club
SELECT budget.link_to_event FROM budget WHERE budget.category = 'Yearly Kickoff'	student_club
WITH highest_income AS (     SELECT member_id, MAX(amount) as max_income     FROM income     GROUP BY member_id     ORDER BY max_income DESC     LIMIT 1 ) SELECT m.first_name, m.last_name, m.email, i.source FROM highest_income hi JOIN member m ON hi.member_id = m.member_id JOIN income i ON hi.member_id = i.link_to_member	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount ASC LIMIT 1	student_club
SELECT      SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /      SUM(b.amount) * 100 AS Yearly_Kickoff_Percentage FROM      budget b JOIN      event e ON b.link_to_event = e.event_id;	student_club
SELECT CAST(COUNT(CASE WHEN major_name = 'Finance' THEN member_id END) AS REAL) / COUNT(member_id) FROM member INNER JOIN major ON member.link_to_major = major.major_id	student_club
SELECT T1.source, SUM(T2.amount) as total_amount FROM income AS T1 INNER JOIN income AS T2 ON T1.link_to_member = T2.link_to_member WHERE SUBSTR(T2.date_received, 5, 2) = '09' AND SUBSTR(T2.date_received, 1, 4) = '2019' GROUP BY T1.source ORDER BY total_amount DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Student_Club' AND position = 'Secretary'	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching' AND T1.position = 'Student_Club'	student_club
SELECT COUNT(T1.link_to_member) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Community Theater' AND T2.event_date LIKE '2019%'	student_club
SELECT count(T1.event_id), T4.major_name, T4.major_id FROM attendance AS T1 INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id INNER JOIN major AS T4 ON T4.major_id = T3.link_to_major WHERE T3.first_name = 'Luisa' AND T3.last_name = 'Guidi'	student_club
SELECT AVG(T2.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.category = 'Food' AND T2.event_status = 'Past'	student_club
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T2.event_id = T1.link_to_event ORDER BY T1.amount DESC LIMIT 1	student_club
SELECT COUNT(*) AS "Did Maya McLean attend the Women's Soccer event?" FROM member AS t1 INNER JOIN attendance AS t2 ON t1.member_id = t2.link_to_member INNER JOIN event AS t3 ON t2.link_to_event = t3.event_id WHERE t1.first_name = 'Maya' AND t1.last_name = 'McLean' AND t3.event_name = 'Women''s Soccer';	student_club
SELECT CAST(COUNT(CASE WHEN T1.event_date LIKE '2019%' AND T1.type = 'Community Service' THEN T1.event_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.event_id) AS "Percentage share of events related to 'Community Service'" FROM event AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.link_to_major IN (SELECT major_id FROM major WHERE department = 'Student Club')	student_club
SELECT T1.amount FROM budget AS T1 JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T2.event_name = 'September Speaker' AND T1.category = 'Posters'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT T2.event_name, T1.spent - T1.amount AS difference FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.spent - T1.amount = ( SELECT MAX(T1.spent - T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.event_status = 'closed' )	student_club
SELECT T1.category, SUM(T2.cost) FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' GROUP BY T1.category	student_club
SELECT T3.category, T2.amount FROM budget AS T2 INNER JOIN event AS T3 ON T3.event_id = T2.link_to_event WHERE T3.event_name = 'April Speaker' ORDER BY T2.amount	student_club
WITH    filtered_budgets AS (     SELECT * FROM budget     WHERE category = 'Food'   ),   max_budget AS (     SELECT MAX(amount) AS max_amount FROM filtered_budgets   ) SELECT T2.budget_id, T2.amount FROM max_budget AS T1 JOIN budget AS T2 ON T1.max_amount = T2.amount;	student_club
SELECT T2.category, MAX(T2.amount) FROM budget AS T1 INNER JOIN budget AS T2 ON T2.event_status = 'approved' AND T2.category = T1.category GROUP BY T2.category ORDER BY T2.amount DESC LIMIT 3	student_club
SELECT SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.category = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT T1.first_name, T1.last_name, SUM(T3.cost) FROM member AS T1 INNER JOIN income AS T3 ON T1.member_id = T3.link_to_member WHERE T1.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY T1.first_name, T1.last_name	student_club
SELECT T1.expense_id FROM expense AS T1 INNER JOIN member AS T2 ON T2.member_id = T1.link_to_member WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT MAX(e.expense_date) FROM expense e JOIN income i ON e.link_to_member = i.link_to_member WHERE i.zip = 20003 AND i.amount = 'X-Large'	student_club
SELECT m.zip FROM member m WHERE NOT EXISTS (SELECT 1 FROM income i WHERE i.link_to_member = m.member_id AND i.amount >= 50)	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'	student_club
SELECT DISTINCT position FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business')	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'	student_club
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.status = 'open' AND T1.remaining > 30	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name LIKE 'MU 215%'	student_club
SELECT T4.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget INNER JOIN income AS T4 ON T3.link_to_member = T4.link_to_member WHERE T1.event_date = '2020-03-24T12:00:00'	student_club
SELECT major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Vice'	student_club
SELECT COUNT(T2.member_id) / COUNT(*) * 100 AS 'Percentage' FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Mathematics'	student_club
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215'	student_club
SELECT COUNT(T1.income_id) FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.amount = 50	student_club
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'extra large'	student_club
SELECT COUNT(DISTINCT T3.major_id) FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.link_to_major IN ( SELECT T1.major_id FROM major AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.county = 'College of Agriculture and Applied Sciences' ) AND T3.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT T2.last_name, T3.department, T3.college FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id INNER JOIN income AS T4 ON T1.member_id = T4.link_to_member WHERE T4.source LIKE 'Majors' AND T4.source LIKE '%Environmental Engineering%'	student_club
SELECT T2.category  FROM member AS T1  INNER JOIN budget AS T2 ON T1.member_id = T2.link_to_member  INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id  WHERE T1.zip = 215 AND T3.type = 'Guest Speaker' AND T2.spent = 0	student_club
SELECT T3.city, T3.state FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T2.department = 'Electrical and Computer Engineering'	student_club
SELECT event_name FROM event AS T1 INNER JOIN member AS T2 ON T1.event_id = T2.link_to_event INNER JOIN major AS T3 ON T3.major_id = T2.link_to_major WHERE T3.major_name = 'Vice President of Student Club' AND T3.department = 'School of Humanities and Social Sciences' AND T1.location = '900 E. Washington St.'	student_club
SELECT T1.last_name, T1.position FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '09/10/2019' AND T2.source = 'Pizza'	student_club
SELECT t2.last_name FROM event AS t1 INNER JOIN attendance AS t3 ON t3.link_to_event = t1.event_id INNER JOIN member AS t2 ON t3.link_to_member = t2.member_id WHERE t1.event_name = 'women''s soccer event'	student_club
SELECT CAST(SUM(CASE WHEN T1.amount > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.amount) AS percentage FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'Medium'	student_club
SELECT zip_code.city FROM zip_code INNER JOIN income ON income.zip = zip_code.zip_code WHERE income.amount IS NOT NULL AND income.source IS NOT NULL	student_club
SELECT zip_code FROM zip_code AS t1 INNER JOIN event AS t2 ON t1.zip_code = t2.zip_code WHERE t1.state = 'PR' AND t1.type = 'PO BOX' AND t1.city = 'SAN JUAN MUNICIPIO'	student_club
SELECT event_name FROM event WHERE type = 'game' AND status = 'closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT event_id FROM attendance WHERE link_to_member IN  (SELECT member_id FROM income WHERE amount > 50)	student_club
SELECT T1.first_name, T1.last_name, T1.member_id, T2.link_to_event FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_date BETWEEN '1/10/2019' AND '11/19/2019' AND T3.status = 'approved'	student_club
SELECT T3.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T2.major_name = 'rec1N0upiVLy5esTO' AND T1.first_name = 'Katy';	student_club
SELECT T2.phone FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Business' AND T1.college = 'College of Agriculture and Applied Sciences'	student_club
SELECT T3.email FROM income AS T1 INNER JOIN member AS T2 ON T2.member_id = T1.link_to_member INNER JOIN income AS T3 ON T3.member_id = T2.member_id WHERE T1.amount > 20 AND T1.date_received >= '2019-09-10' AND T1.date_received <= '2019-11-19' AND T3.amount > 20 AND T3.date_received >= '2019-09-10' AND T3.date_received <= '2019-11-19' AND T1.member_id = T3.member_id	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Education' AND T2.college = 'College of Education & Human Services'	student_club
SELECT CAST(SUM(CASE WHEN event_status = 'over budget' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) as percentage_over_budget FROM budget	student_club
SELECT T1.event_id, T1.location, T1.status FROM event AS T1 WHERE T1.event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_id FROM expense WHERE cost > 50 ORDER BY cost	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'extra large'	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM zip_code	student_club
SELECT event_name, location FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE spent - remaining < 0)	student_club
SELECT T.event_name, T.event_date FROM event AS T INNER JOIN budget AS T2 ON T.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost > 50 AND T3.cost < 100	student_club
SELECT M.first_name, M.last_name, M.link_to_major FROM member M INNER JOIN expense E ON M.member_id = E.link_to_member WHERE E.cost > 100	student_club
SELECT DISTINCT T2.city, T2.county FROM income AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_id IN (     SELECT event_id FROM     (         SELECT event_id, COUNT(*) AS cnt FROM income         GROUP BY event_id     ) AS T3     WHERE cnt > 40 )	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 1	student_club
SELECT AVG(amount) AS average_amount_paid FROM income WHERE position <> 'member'	student_club
SELECT event_name FROM event WHERE event_id IN (SELECT budget_id FROM budget WHERE spent - remaining < (SELECT AVG(spent - remaining) FROM budget))	student_club
SELECT SUM(CASE WHEN T.type = 'game' THEN T.cost ELSE 0 END) AS game_expense, SUM(T.cost) AS total_expense, CAST(SUM(CASE WHEN T.type = 'game' THEN T.cost ELSE 0 END) AS REAL) * 100 / SUM(T.cost) AS percentage FROM budget AS T	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Water' OR T2.category = 'Chips' OR T2.category = 'Cookies' ORDER BY T2.spent DESC LIMIT 1	student_club
SELECT T2.first_name, T2.last_name, SUM(T3.cost)  FROM expense AS T1  JOIN member AS T2 ON T2.member_id = T1.link_to_member  JOIN budget AS T3 ON T3.budget_id = T1.link_to_budget  GROUP BY T2.member_id  ORDER BY SUM(T3.cost) DESC  LIMIT 5	student_club
SELECT M.first_name, M.last_name, M.phone FROM member M WHERE M.member_id IN ( SELECT E.link_to_member FROM expense E WHERE E.cost > ( SELECT AVG(E1.cost) FROM expense E1 ) )	student_club
SELECT      ROUND(((SELECT COUNT(*) FROM member WHERE state = 'VT') * 100.0 / (SELECT COUNT(*) FROM member WHERE state = 'ME'))) AS percentage_diff FROM      member WHERE      state IN ('VT', 'ME')	student_club
SELECT T1.major_name, T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'	student_club
SELECT m.first_name, m.last_name, e.expense_description, e.cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.expense_description IN ('Water', 'Veggie tray', 'Supplies')	student_club
SELECT T1.last_name, T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'	student_club
SELECT t2.category FROM event AS t1 INNER JOIN budget AS t2 ON t1.event_id = t2.link_to_event WHERE t1.event_name = 'January Speaker'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'food'	student_club
SELECT T3.first_name, T3.last_name, T4.amount FROM event AS T1 JOIN income AS T2 ON T1.event_id = T2.link_to_member JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_date = '2019-09-09'	student_club
SELECT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Poster'	student_club
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'	student_club
SELECT SUM(T1.amount), T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker gifts' GROUP BY T2.event_name	student_club
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Girke'	student_club
SELECT T2.first_name, T2.last_name, T2.position FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip INNER JOIN income AS T3 ON T2.member_id = T3.link_to_member WHERE T3.amount >= 1 AND T1.state = 'North Carolina' AND T1.city = 'Lincolnton' AND T1.zip_code = 28092	student_club
SELECT COUNT(t1.GasStationID) FROM gasstations AS t1 INNER JOIN transactions_1k AS t2 ON t1.GasStationID = t2.GasStationID INNER JOIN products AS t3 ON t2.ProductID = t3.ProductID WHERE t3.Description = 'Premium' AND t1.Country = 'CZE'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) FROM customers	debit_card_specializing
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T2.`Date` LIKE '2012%' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT AVG(T1.Consumption) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T2.CustomerID = T1.CustomerID WHERE T2.Segment = 'SME' AND strftime('%Y', T1.Date) = '2013'	debit_card_specializing
SELECT t1.CustomerID FROM customers AS t1 INNER JOIN transactions_1k AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Date LIKE '2011%' AND t1.Currency = 'CZK' ORDER BY SUM(t2.Amount) DESC	debit_card_specializing
SELECT COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T2.Date LIKE '2012%' AND T2.Consumption < 30000	debit_card_specializing
SELECT      (SUM(CASE WHEN T2.Currency = 'CZK' THEN T3.Consumption ELSE 0 END) -       SUM(CASE WHEN T2.Currency = 'EUR' THEN T3.Consumption ELSE 0 END)) AS Difference  FROM      transactions_1k AS T1  JOIN      customers AS T2 ON T1.CustomerID = T2.CustomerID  JOIN      yearmonth AS T3 ON T3.CustomerID = T2.CustomerID AND T3.Date = CAST(T1.Date AS DATE) WHERE      T1.Date BETWEEN '2012-01-01' AND '2012-12-31'	debit_card_specializing
SELECT strftime('%Y', T1.Date) FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T3.Currency = 'EUR' GROUP BY strftime('%Y', T1.Date) ORDER BY SUM(T2.Consumption) DESC LIMIT 1	debit_card_specializing
SELECT T.segment FROM yearmonth AS T ORDER BY T.consumption ASC LIMIT 1	debit_card_specializing
SELECT YEAR FROM yearmonth WHERE Currency = 'CZK' GROUP BY YEAR ORDER BY SUM(Consumption) DESC LIMIT 1	debit_card_specializing
SELECT T1.Month, SUM(T1.Quantity) FROM ( SELECT DATE_FORMAT(T3.Date, "%Y-%m") AS Month, T2.CustomerID, T3.Price * T3.Amount AS Quantity FROM transactions_1k AS T3 INNER JOIN customers AS T2 ON T2.CustomerID = T3.CustomerID INNER JOIN yearmonth AS T1 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T1.`Year` = 2013 ) AS T1 GROUP BY T1.Month ORDER BY T1.`SUM(T1.Quantity)` DESC LIMIT 1	debit_card_specializing
SELECT DISTINCT T2.Segment, AVG(T1.Consumption) AS average_consumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN transactions_1k AS T3 ON T1.CustomerID = T3.CustomerID INNER JOIN gasstations AS T4 ON T3.GasStationID = T4.GasStationID WHERE T3.Currency = 'CZK' AND T4.Segment = 'KAM' AND T1.Date LIKE '2013%' GROUP BY T4.Segment	debit_card_specializing
SELECT CASE  WHEN SUM(CASE  WHEN T1.`Date` >= '2012-01-01' AND T1.`Date` <= '2012-12-31' THEN T1.Consumption  ELSE 0  END) = 0 THEN 'No sales in 2012'  ELSE SUM(CASE  WHEN T1.`Date` >= '2013-01-01' AND T1.`Date` <= '2013-12-31' THEN T1.Consumption  ELSE 0  END) / SUM(CASE  WHEN T1.`Date` >= '2012-01-01' AND T1.`Date` <= '2012-12-31' THEN T1.Consumption  ELSE 0  END) * 100  END AS growth_percentage,  T2.Segment  FROM yearmonth AS T1  INNER JOIN customers AS T2 ON T2.CustomerID = T1.CustomerID  WHERE T2.Currency = 'EUR'  GROUP BY T2.Segment  ORDER BY growth_percentage ASC	debit_card_specializing
SELECT SUM(t1.Consumption) FROM yearmonth AS t1 INNER JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.CustomerID = 6 AND strftime('%Y-%m', t1.Date) BETWEEN '2013-08-01' AND '2013-11-30'	debit_card_specializing
SELECT COUNT(CASE WHEN T2.Country = 'Czech Republic' THEN 1 ELSE NULL END) - COUNT(CASE WHEN T2.Country = 'Slovakia' THEN 1 ELSE NULL END) FROM transactions_1k AS T1 LEFT JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'Czech Republic' OR T2.Country = 'Slovakia'	debit_card_specializing
SELECT SUM(T2.Consumption) AS TotalConsumption FROM yearmonth AS T1 INNER JOIN yearmonth AS T2 ON T2.CustomerID = 7 AND T2.Date LIKE '2013-04-%' INNER JOIN yearmonth AS T3 ON T3.CustomerID = 5 AND T3.Date LIKE '2013-04-%'	debit_card_specializing
SELECT    CASE      WHEN SUM(CASE WHEN Currency = 'Czech koruna' THEN 1 ELSE 0 END) >           SUM(CASE WHEN Currency = 'Euros' THEN 1 ELSE 0 END)      THEN 'Yes, it is true that more SMEs pay in Czech koruna than in euros.'      ELSE 'No, it is false that more SMEs pay in Czech koruna than in euros.'    END AS Answer,   SUM(CASE WHEN Currency = 'Czech koruna' THEN 1 ELSE 0 END) -    SUM(CASE WHEN Currency = 'Euros' THEN 1 ELSE 0 END) AS Difference  FROM customers WHERE Segment = 'SME'	debit_card_specializing
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'Euro' AND T1.Date BETWEEN '2013-10-01' AND '2013-10-31' AND T2.Segment = 'LAM' GROUP BY T2.CustomerID ORDER BY SUM(T1.Amount) DESC LIMIT 1	debit_card_specializing
SELECT T2.CustomerID, COUNT(*) FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.GasStationID IN ( SELECT GasStationID FROM gasstations WHERE Segment = 'KAM' ) GROUP BY T2.CustomerID ORDER BY COUNT(*) DESC LIMIT 1	debit_card_specializing
SELECT SUM(Amount) FROM transactions_1k AS t1 INNER JOIN yearmonth AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Date = '2013-05-01' AND t1.Date = '2013-05-01'	debit_card_specializing
SELECT CAST(COUNT(T2.CustomerID) AS REAL) * 100 / COUNT(T2.CustomerID) AS Percent FROM transactions_1k AS T1 JOIN customers AS T2 ON T2.CustomerID = T1.CustomerID WHERE T2.Segment = 'LAM' AND T1.Amount > 4673	debit_card_specializing
SELECT T2.Country, COUNT(*) FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID INNER JOIN gasstations AS T3 ON T3.GasStationID = T2.GasStationID WHERE T1.Description = 'Value examples' GROUP BY T3.Country ORDER BY COUNT(*) DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(IIF(c.Currency = 'EUR', 1, 0)) AS REAL) * 100 / COUNT(DISTINCT c.CustomerID) AS PercentageOfKAMCustomersInEUR FROM customers c JOIN `transactions_1k` t ON c.CustomerID = t.CustomerID WHERE c.Segment = 'KAM'	debit_card_specializing
SELECT AVG(CASE WHEN ( SELECT COUNT(T1.CustomerID) FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '2012-02-01' AND '2012-02-28' GROUP BY T1.CustomerID HAVING SUM(T2.Consumption) > 528.3 ) IS NOT NULL THEN 1 ELSE 0 END) * 100 AS percentage FROM transactions_1k AS T1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations AS T1 INNER JOIN products AS T2 ON T1.Country = 'Slovakia'	debit_card_specializing
SELECT CustomerID FROM transactions_1k AS T1 INNER JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '2013%' AND T2.Month = '09' GROUP BY T2.CustomerID ORDER BY SUM(T1.Amount) DESC LIMIT 1	debit_card_specializing
SELECT Segment FROM customers GROUP BY Segment ORDER BY AVG(Amount) ASC LIMIT 1	debit_card_specializing
SELECT T1.customerid FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.customerid = T2.customerid INNER JOIN `transactions_1k` AS T3 ON T2.customerid = T3.customerid WHERE T2.`date` LIKE '2012-06%' ORDER BY T2.consumption LIMIT 1	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE DATE_PART('year', Date) = 2012	debit_card_specializing
SELECT `T3`.`CustomerID` FROM `transactions_1k` AS `T1` INNER JOIN `customers` AS `T2` ON `T1`.`CustomerID` = `T2`.`CustomerID` INNER JOIN `yearmonth` AS `T3` ON `T1`.`CustomerID` = `T3`.`CustomerID` WHERE `T2`.`Currency` = 'EUR' ORDER BY `T3`.`Consumption` DESC LIMIT 1	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 INNER JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T1.Date LIKE '2013-09%'	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE strftime('%m', T1.Date) = '06' AND strftime('%Y', T1.Date) = '2013'	debit_card_specializing
SELECT DISTINCT T3.ChainID FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Segment = 'Retail' AND T3.Currency = 'EUR'	debit_card_specializing
SELECT t2.description FROM transactions_1k AS t1 INNER JOIN products AS t2 ON t1.productid = t2.productid INNER JOIN customers AS t3 ON t1.customerid = t3.customerid WHERE t3.currency = '€'	debit_card_specializing
SELECT AVG(T3.Amount * T3.Price) FROM TRANSACTIONS_1K AS T1 INNER JOIN YEARMONTH AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN TRANSACTIONS_1K AS T3 ON T2.CustomerID = T3.CustomerID WHERE T2.Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(T.CustomerID) FROM transactions_1k AS T INNER JOIN customers AS C ON T.CustomerID = C.CustomerID WHERE C.Currency = 'EUR' AND (SELECT COUNT(*) FROM yearmonth AS Y WHERE Y.CustomerID = T.CustomerID AND Y.Consumption > 1000) = 1	debit_card_specializing
SELECT DISTINCT Description FROM transactions_1k WHERE GasStationID IN ( SELECT GasStationID FROM gasstations WHERE Country = 'Czech Republic' )	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11	debit_card_specializing
SELECT COUNT(T1.TransactionID) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'Czech Republic' AND T1.Price > 1000	debit_card_specializing
SELECT COUNT(DISTINCT T2.TransactionID) FROM yearmonth AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T3.Country = 'Czech Republic' AND T1.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(T2.Price * T2.Amount) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T2.GasStationID = T1.GasStationID WHERE T1.Country = 'Czech Republic'	debit_card_specializing
SELECT AVG(t1.Price * t1.Amount) FROM transactions_1k AS t1 INNER JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Currency = '€'	debit_card_specializing
SELECT T2.CustomerID, T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25' AND T2.CustomerID = ( SELECT T2.CustomerID FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25' GROUP BY T2.CustomerID ORDER BY SUM(T1.Amount) DESC LIMIT 1 )	debit_card_specializing
SELECT T2.Country FROM `transactions_1k` AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.`Date` = '2012-08-25' AND T1.CustomerID IS NOT NULL LIMIT 1	debit_card_specializing
SELECT T2.Currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Time = '16:25:00'	debit_card_specializing
SELECT T.Segment FROM customers AS T INNER JOIN transactions_1k AS T1 ON T1.CustomerID = T.CustomerID WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(T1.TransactionID) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Currency = 'EUR' AND T3.Date = '2012-08-26' AND T3.Time >= '00:00:00' AND T3.Time < '12:00:00'	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN yearmonth AS T3 ON T2.CustomerID = T3.CustomerID WHERE T3.Date = ( SELECT MIN(Date) FROM yearmonth )	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24' AND T2.Time = '12:42:00'	debit_card_specializing
SELECT T1.ProductID FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN `date` AS T3 ON T2.Date = T3.Date WHERE T3.`Year-Month` = '2012/8/23' AND T1.`Time` = '21:20:00'	debit_card_specializing
SELECT ProductID FROM `transactions_1k` WHERE Amount = 124.05 AND Date = '2012-08-24'	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-26' AND T2.Time LIKE '08:%'	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '2013-06%' AND T2.Amount = 214582.17	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = '667467'	debit_card_specializing
SELECT DISTINCT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T3.Currency = 'USD' AND T2.Date = '2012-08-24' AND T2.Amount = 548	debit_card_specializing
SELECT CAST(SUM(IIF(T2.Currency = 'EUR', 1, 0)) AS REAL) * 100 / COUNT(DISTINCT T2.CustomerID) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T2.CustomerID = T1.CustomerID INNER JOIN gasstations AS T3 ON T3.GasStationID = T1.GasStationID WHERE strftime('%Y-%m-%d', T1.Date) = '2012-08-25'	debit_card_specializing
SELECT T2.Consumption / T1.Consumption * 100 - 100 FROM yearmonth T1 INNER JOIN yearmonth T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25' AND T2.Date = '2013-08-25'	debit_card_specializing
SELECT T3.gasstationid FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.customerid = T2.customerid INNER JOIN gasstations AS T3 ON T1.gasstationid = T3.gasstationid GROUP BY T3.gasstationid ORDER BY SUM(T2.consumption) DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(IIF(T1.Description = 'Premium', 1, 0)) AS REAL) * 100 / COUNT(*) FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID	debit_card_specializing
SELECT SUM(t1.Amount) FROM transactions_1k AS t1 INNER JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.CustomerID = '38508'	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.Description ORDER BY COUNT(T1.ProductID) DESC LIMIT 5	debit_card_specializing
SELECT T1.CustomerID, (CAST(SUM(T2.Amount) AS REAL) / COUNT(T2.Amount)) FROM customers AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.CustomerID ORDER BY SUM(T2.Amount) DESC LIMIT 1	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN products AS T3 ON T2.ProductID = T3.ProductID WHERE T3.ProductID = 2 GROUP BY T1.Country ORDER BY COUNT(*) DESC LIMIT 1	debit_card_specializing
SELECT T1.Consumption FROM yearmonth AS T1 INNER JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '2012-08-%' AND T2.Price > 29.0 AND T2.ProductID = 5	debit_card_specializing
